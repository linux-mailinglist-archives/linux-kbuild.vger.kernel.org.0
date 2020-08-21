Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D762924E054
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 21:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgHUTDF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 15:03:05 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:62821 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgHUTC5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:02:57 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07LJ23eZ027595;
        Sat, 22 Aug 2020 04:02:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07LJ23eZ027595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598036529;
        bh=tMEUJhFRfVlsf+Bq735fe/sTFgfgHqQiZv6E88yGDDQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2LyUnHUDJ5Xk9MClLntRAFcbYwyYb0w1RlmZ6HgHedQshTxy6IFFtGT2zJQ5a00ac
         +OJ3mY9W3i3rfXety2DFPvkodGrMvj8hL6394wGK2cAqh5V/ZfaR8dRrnrWQCLYj8y
         2e9kps5sNr7ABVIlA3aOB9ug1JWyT44sQzfFq6ThesoZj2XSZenZtqEVmuRKYeq9c8
         Atzch3v0odofkFSuAO25yxje49CgtO+E5QIFqi1JpTDRuDD2bOlyr5flYgZJz99tg/
         6+ZVJDWfj/Fa7mZRfcetkJJpALLCDl7nu0PfjG4cMMmN2an1SQiv36z7v/f9rwNA/2
         WzSXWZE4U6n6Q==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/9] gen_compile_commands: support *.o, *.a, modules.order in positional argument
Date:   Sat, 22 Aug 2020 04:01:57 +0900
Message-Id: <20200821190159.1033740-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821190159.1033740-1-masahiroy@kernel.org>
References: <20200821190159.1033740-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This script currently searches the specified directory for .cmd files.
One drawback is it may contain stale .cmd files after you rebuild the
kernel several times without 'make clean'.

This commit supports *.o, *.a, and modules.order as positional
parameters. If such files are given, they are parsed to collect
associated .cmd files. I added a generator helper for each of them.

This feature is useful to get the list of active .cmd files from the
last build, and will be used by the next commit to wire up the
compile_commands.json rule to the Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Separate the file parser into generator functions
  - Use 'obj' instead of 'object' because 'object' is a built-in function
  - I think using 'file' is OK because it is not a built-in function in Python3
    (https://docs.python.org/3/library/functions.html)
    Anyway, the variable 'file' is no longer used in this version
  - Keep the previous work-flow to allow to search the given directory

 scripts/gen_compile_commands.py | 100 ++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 4 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 6dec7e2c4098..65859e6044b5 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -12,6 +12,7 @@ import json
 import logging
 import os
 import re
+import subprocess
 
 _DEFAULT_OUTPUT = 'compile_commands.json'
 _DEFAULT_LOG_LEVEL = 'WARNING'
@@ -32,8 +33,9 @@ def parse_arguments():
     Returns:
         log_level: A logging level to filter log output.
         directory: The work directory where the objects were built
+        ar: Command used for parsing .a archives
         output: Where to write the compile-commands JSON file.
-        paths: The list of directories to handle to find .cmd files
+        paths: The list of files/directories to handle to find .cmd files
     """
     usage = 'Creates a compile_commands.json database from kernel .cmd files'
     parser = argparse.ArgumentParser(description=usage)
@@ -53,12 +55,21 @@ def parse_arguments():
     parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
                         default=_DEFAULT_LOG_LEVEL, help=log_level_help)
 
+    ar_help = 'command used for parsing .a archives'
+    parser.add_argument('-a', '--ar', type=str, default='ar', help=ar_help)
+
+    paths_help = ('directories to search or files to parse '
+                  '(files should be *.o, *.a, or modules.order). '
+                  'If nothing is specified, the current directory is searched')
+    parser.add_argument('paths', type=str, nargs='*', help=paths_help)
+
     args = parser.parse_args()
 
     return (args.log_level,
             os.path.abspath(args.directory),
             args.output,
-            [args.directory])
+            args.ar,
+            args.paths if len(args.paths) > 0 else [args.directory])
 
 
 def cmdfiles_in_dir(directory):
@@ -81,6 +92,73 @@ def cmdfiles_in_dir(directory):
                 yield os.path.join(dirpath, filename)
 
 
+def to_cmdfile(path):
+    """Return the path of .cmd file used for the given build artifact
+
+    Args:
+        Path: file path
+
+    Returns:
+        The path to .cmd file
+    """
+    dir, base = os.path.split(path)
+    return os.path.join(dir, '.' + base + '.cmd')
+
+
+def cmdfiles_for_o(obj):
+    """Generate the iterator of .cmd files associated with the object
+
+    Yield the .cmd file used to build the given object
+
+    Args:
+        obj: The object path
+
+    Yields:
+        The path to .cmd file
+    """
+    yield to_cmdfile(obj)
+
+
+def cmdfiles_for_a(archive, ar):
+    """Generate the iterator of .cmd files associated with the archive.
+
+    Parse the given archive, and yield every .cmd file used to build it.
+
+    Args:
+        archive: The archive to parse
+
+    Yields:
+        The path to every .cmd file found
+    """
+    for obj in subprocess.check_output([ar, '-t', archive]).decode().split():
+        yield to_cmdfile(obj)
+
+
+def cmdfiles_for_modorder(modorder):
+    """Generate the iterator of .cmd files associated with the modules.order.
+
+    Parse the given modules.order, and yield every .cmd file used to build the
+    contained modules.
+
+    Args:
+        modorder: The modules.order file to parse
+
+    Yields:
+        The path to every .cmd file found
+    """
+    with open(modorder) as f:
+        for line in f:
+            ko = line.rstrip()
+            base, ext = os.path.splitext(ko)
+            if ext != '.ko':
+                sys.exit('{}: module path must end with .ko'.format(ko))
+            mod = base + '.mod'
+	    # The first line of *.mod lists the objects that compose the module.
+            with open(mod) as m:
+                for obj in m.readline().split():
+                    yield to_cmdfile(obj)
+
+
 def process_line(root_directory, command_prefix, file_path):
     """Extracts information from a .cmd line and creates an entry from it.
 
@@ -116,7 +194,7 @@ def process_line(root_directory, command_prefix, file_path):
 
 def main():
     """Walks through the directory and finds and parses .cmd files."""
-    log_level, directory, output, paths = parse_arguments()
+    log_level, directory, output, ar, paths = parse_arguments()
 
     level = getattr(logging, log_level)
     logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
@@ -126,7 +204,21 @@ def main():
     compile_commands = []
 
     for path in paths:
-        cmdfiles = cmdfiles_in_dir(path)
+        # If 'path' is a directory, handle all .cmd files under it.
+        # Otherwise, handle .cmd files associated with the file.
+        # Most of built-in objects are linked via archives (built-in.a or lib.a)
+        # but some are linked to vmlinux directly.
+        # Modules are lis
+        if os.path.isdir(path):
+            cmdfiles = cmdfiles_in_dir(path)
+        elif path.endswith('.o'):
+            cmdfiles = cmdfiles_for_o(path)
+        elif path.endswith('.a'):
+            cmdfiles = cmdfiles_for_a(path, ar)
+        elif path.endswith('modules.order'):
+            cmdfiles = cmdfiles_for_modorder(path)
+        else:
+            sys.exit('{}: unknown file type'.format(path))
 
         for cmdfile in cmdfiles:
             with open(cmdfile, 'rt') as f:
-- 
2.25.1

