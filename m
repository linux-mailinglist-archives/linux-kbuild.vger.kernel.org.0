Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E61BC24E815
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 16:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgHVO5p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 10:57:45 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47432 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgHVO5N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 10:57:13 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07MEuKVW025434;
        Sat, 22 Aug 2020 23:56:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07MEuKVW025434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598108186;
        bh=xK0TccZgu0kMI4oYgleYpG0IMmmzu3uu8KTK04GIMN0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QbN6B9GsoDqA/CiNLvNTihVKHlARD9K0ftDask49e2/yXJey4b8pBDxnz/2pkSRpN
         ZB7XeOC6Ik3ijdtFdRcjGlTRBNpmfliGEWf1r7BNP8Jt/TubI/TVNniE/h7yj5rPwm
         y71B1xPP1bQpU9zdn+hqs3RMd/eTwAD6sVPcC57aUIscsIcgLMV9ol1VAZk4FSDO6E
         /wZBgWMUL8KsqaurHB5+6UHNO525fLKSox/Gop7xwKw6WdchVuntlQtGuu4crr4mY/
         GJwiw8nCAhSS8hk8uwtpfKkuklvMyDXWrsythZ71ix4ZAYT7nsX5Yp/q/y/qGk/UiC
         HdNNoCllQY21g==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/10] gen_compile_commands: support *.o, *.a, modules.order in positional argument
Date:   Sat, 22 Aug 2020 23:56:15 +0900
Message-Id: <20200822145618.1222514-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200822145618.1222514-1-masahiroy@kernel.org>
References: <20200822145618.1222514-1-masahiroy@kernel.org>
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

Changes in v3:
  - Use 'llvm-ar' instead of 'ar' for the default of -a option
  - Fix the corrupted comment block

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
index e45f17be8817..f370375b2f70 100755
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
         directory: The work directory where the objects were built.
+        ar: Command used for parsing .a archives.
         output: Where to write the compile-commands JSON file.
-        paths: The list of directories to handle to find .cmd files.
+        paths: The list of files/directories to handle to find .cmd files.
     """
     usage = 'Creates a compile_commands.json database from kernel .cmd files'
     parser = argparse.ArgumentParser(description=usage)
@@ -53,12 +55,21 @@ def parse_arguments():
     parser.add_argument('--log_level', choices=_VALID_LOG_LEVELS,
                         default=_DEFAULT_LOG_LEVEL, help=log_level_help)
 
+    ar_help = 'command used for parsing .a archives'
+    parser.add_argument('-a', '--ar', type=str, default='llvm-ar', help=ar_help)
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
 
@@ -117,7 +195,7 @@ def process_line(root_directory, command_prefix, file_path):
 
 def main():
     """Walks through the directory and finds and parses .cmd files."""
-    log_level, directory, output, paths = parse_arguments()
+    log_level, directory, output, ar, paths = parse_arguments()
 
     level = getattr(logging, log_level)
     logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
@@ -127,7 +205,21 @@ def main():
     compile_commands = []
 
     for path in paths:
-        cmdfiles = cmdfiles_in_dir(path)
+        # If 'path' is a directory, handle all .cmd files under it.
+        # Otherwise, handle .cmd files associated with the file.
+        # Most of built-in objects are linked via archives (built-in.a or lib.a)
+        # but some objects are linked to vmlinux directly.
+        # Modules are listed in modules.order.
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

