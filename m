Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3474824E80D
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 16:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgHVO5V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 10:57:21 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47429 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgHVO5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 10:57:12 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07MEuKVS025434;
        Sat, 22 Aug 2020 23:56:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07MEuKVS025434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598108183;
        bh=q+4NzfCiNDCECz9HAmB0Vnyx61RvHFvh4fBxtXHAgmk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vhSHkbteTJ4+PlHc++uEkTlryLkihsAhwH56fQSbp1JRkabaLrLoTErVW/rWy0uD9
         BkoIEgk8wuUmaQNf26R50vbFOk4NYa+l+oaiqsFAItcg9DvL2+NbHwVWex3nNLKHQK
         r+zAjMNJxNtI/Q4/clhLypJEi1RQviUZVp2BInZM+QcWkL7zryrUlvV/qRC/jOnUqG
         U0+6fk3So/cyW6TTM1q9u2LME8eXzvv1hqxhyE1Y5JG9rhHy6hA8C5Z+zHUbBMO4YI
         eMJPMau0PMpvHriXzZOmfV0gRpLxVUblDyXNqih/ihhXzWEiNYbrgIpnrWue9l/xww
         GRuaVAiSuZHBQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/10] gen_compile_commands: do not support .cmd files under tools/ directory
Date:   Sat, 22 Aug 2020 23:56:11 +0900
Message-Id: <20200822145618.1222514-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200822145618.1222514-1-masahiroy@kernel.org>
References: <20200822145618.1222514-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The tools/ directory uses a different build system, and the format of
.cmd files is different because the tools builds run in a different
work directory.

Supporting two formats compilicates the script.

The only loss by this change is objtool.

Also, rename the confusing variable 'relative_path' because it is
not necessarily a relative path. When the output directory is not
the direct child of the source tree (e.g. O=foo/bar), it is an
absolute path. Rename it to 'file_path'.

os.path.join(root_directory, file_path) works whether the file_path
is relative or not. If file_path is already absolute, it returns it
as-is.

I used os.path.abspath() to normalize file paths. If you run this
script against the kernel built with O=foo option, the file_path
contains '../' patterns. os.path.abspath() fixes up 'foo/bar/../baz'
into 'foo/baz', and produces a cleaner commands_database.json.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v3:
  - Add a comment about why I used os.path.abspath()

Changes in v2:
  - New patch

 scripts/gen_compile_commands.py | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 535248cf2d7e..49fff0b0b385 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -59,23 +59,21 @@ def parse_arguments():
     return args.log_level, directory, output
 
 
-def process_line(root_directory, file_directory, command_prefix, relative_path):
+def process_line(root_directory, command_prefix, file_path):
     """Extracts information from a .cmd line and creates an entry from it.
 
     Args:
         root_directory: The directory that was searched for .cmd files. Usually
             used directly in the "directory" entry in compile_commands.json.
-        file_directory: The path to the directory the .cmd file was found in.
         command_prefix: The extracted command line, up to the last element.
-        relative_path: The .c file from the end of the extracted command.
-            Usually relative to root_directory, but sometimes relative to
-            file_directory and sometimes neither.
+        file_path: The .c file from the end of the extracted command.
+            Usually relative to root_directory, but sometimes absolute.
 
     Returns:
         An entry to append to compile_commands.
 
     Raises:
-        ValueError: Could not find the extracted file based on relative_path and
+        ValueError: Could not find the extracted file based on file_path and
             root_directory or file_directory.
     """
     # The .cmd files are intended to be included directly by Make, so they
@@ -84,20 +82,14 @@ def process_line(root_directory, file_directory, command_prefix, relative_path):
     # by Make, so this code replaces the escaped version with '#'.
     prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
 
-    cur_dir = root_directory
-    expected_path = os.path.join(cur_dir, relative_path)
-    if not os.path.exists(expected_path):
-        # Try using file_directory instead. Some of the tools have a different
-        # style of .cmd file than the kernel.
-        cur_dir = file_directory
-        expected_path = os.path.join(cur_dir, relative_path)
-        if not os.path.exists(expected_path):
-            raise ValueError('File %s not in %s or %s' %
-                             (relative_path, root_directory, file_directory))
+    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
+    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
+    if not os.path.exists(abs_path):
+        raise ValueError('File %s not found' % abs_path)
     return {
-        'directory': cur_dir,
-        'file': relative_path,
-        'command': prefix + relative_path,
+        'directory': root_directory,
+        'file': abs_path,
+        'command': prefix + file_path,
     }
 
 
@@ -122,7 +114,7 @@ def main():
                 result = line_matcher.match(f.readline())
                 if result:
                     try:
-                        entry = process_line(directory, dirpath,
+                        entry = process_line(directory,
                                              result.group(1), result.group(2))
                         compile_commands.append(entry)
                     except ValueError as err:
-- 
2.25.1

