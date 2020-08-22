Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD88524E808
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 16:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgHVO5M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 10:57:12 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47418 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgHVO5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 10:57:12 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07MEuKVV025434;
        Sat, 22 Aug 2020 23:56:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07MEuKVV025434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598108185;
        bh=jH2tLSORRhlXDuP+7ApdPBfQ1QixQf9c+4qwpQLm8xk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XCcHsUJFon+sjkDt/sF4cmBipK+M3z/uIpLS97rIiAkegFB/PmFLCO9s5n3J0M284
         xAEpaVQ5VVF89hevHo9UOPOh7aQnhYAQWigyPMoUbeY420NAt2pFqrBnMuDehvvKLa
         U4wTGK5tizgqR+nB3Zly+6Qhswx1nj6aR38oyJT0n2OEdTkEpzascAzoEHHrIkx1yw
         c/KzjmsIPt5fjDqBcho33KO5IXp5z6zQ/KvRgTbk6ndnP0Vt+Yfh2P6UY8DHsSjQeb
         SFneOkEnH5qn5sxeDsyeKN90E8i6VMruuDSBnCw35rzRjkIaczSXmllJ4+AgLffAn2
         vi7f/IJeSfpgQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/10] gen_compile_commands: move directory walk to a generator function
Date:   Sat, 22 Aug 2020 23:56:14 +0900
Message-Id: <20200822145618.1222514-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200822145618.1222514-1-masahiroy@kernel.org>
References: <20200822145618.1222514-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, this script walks under the specified directory (default to
the current directory), then parses all .cmd files found.

Split it into a separate helper function because the next commit will
add more helpers to pick up .cmd files associated with given file(s).

There is no point to build and return a huge list at once. I used a
generator so it works in the for-loop with less memory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v3:
  - Add the missing punctuation in the comment

Changes in v2:
  - New patch

 scripts/gen_compile_commands.py | 44 ++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 71a0630ae188..e45f17be8817 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -33,6 +33,7 @@ def parse_arguments():
         log_level: A logging level to filter log output.
         directory: The work directory where the objects were built.
         output: Where to write the compile-commands JSON file.
+        paths: The list of directories to handle to find .cmd files.
     """
     usage = 'Creates a compile_commands.json database from kernel .cmd files'
     parser = argparse.ArgumentParser(description=usage)
@@ -56,7 +57,28 @@ def parse_arguments():
 
     return (args.log_level,
             os.path.abspath(args.directory),
-            args.output)
+            args.output,
+            [args.directory])
+
+
+def cmdfiles_in_dir(directory):
+    """Generate the iterator of .cmd files found under the directory.
+
+    Walk under the given directory, and yield every .cmd file found.
+
+    Args:
+        directory: The directory to search for .cmd files.
+
+    Yields:
+        The path to a .cmd file.
+    """
+
+    filename_matcher = re.compile(_FILENAME_PATTERN)
+
+    for dirpath, _, filenames in os.walk(directory):
+        for filename in filenames:
+            if filename_matcher.match(filename):
+                yield os.path.join(dirpath, filename)
 
 
 def process_line(root_directory, command_prefix, file_path):
@@ -95,31 +117,29 @@ def process_line(root_directory, command_prefix, file_path):
 
 def main():
     """Walks through the directory and finds and parses .cmd files."""
-    log_level, directory, output = parse_arguments()
+    log_level, directory, output, paths = parse_arguments()
 
     level = getattr(logging, log_level)
     logging.basicConfig(format='%(levelname)s: %(message)s', level=level)
 
-    filename_matcher = re.compile(_FILENAME_PATTERN)
     line_matcher = re.compile(_LINE_PATTERN)
 
     compile_commands = []
-    for dirpath, _, filenames in os.walk(directory):
-        for filename in filenames:
-            if not filename_matcher.match(filename):
-                continue
-            filepath = os.path.join(dirpath, filename)
 
-            with open(filepath, 'rt') as f:
+    for path in paths:
+        cmdfiles = cmdfiles_in_dir(path)
+
+        for cmdfile in cmdfiles:
+            with open(cmdfile, 'rt') as f:
                 result = line_matcher.match(f.readline())
                 if result:
                     try:
-                        entry = process_line(directory,
-                                             result.group(1), result.group(2))
+                        entry = process_line(directory, result.group(1),
+                                             result.group(2))
                         compile_commands.append(entry)
                     except ValueError as err:
                         logging.info('Could not add line from %s: %s',
-                                     filepath, err)
+                                     cmdfile, err)
 
     with open(output, 'wt') as f:
         json.dump(compile_commands, f, indent=2, sort_keys=True)
-- 
2.25.1

