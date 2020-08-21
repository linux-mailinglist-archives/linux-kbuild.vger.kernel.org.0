Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D15824E050
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 21:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgHUTC4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 15:02:56 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:62785 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgHUTCy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:02:54 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07LJ23eV027595;
        Sat, 22 Aug 2020 04:02:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07LJ23eV027595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598036526;
        bh=i+N9rQs5GJ5sYzQoaZQMubS5P0XusebE3s9Zow0JwbM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TtMxdpaZfWRfXQ9A52j0HMeVZiAsUCqKkAphmnVlUi24LXjxR9LA+PLOn5GYP7EFp
         Ut/rnr0sVjTgeNTefyi5Vfs+3F6lP8wzfPKblCKzRldHo+Pnw2ZKeUHrCnl9iNQCi5
         OFizO6f3DqfvN34gGjgUonhb9FTNDu5cwfUejJ/uelRqtzb4Ya8nxj6Ds5dDVW3Tvi
         QJnabW7K66zatu/PHTxOVD3Rv3U/yPCl+RDNsSmQbgk3NhDn94/FWewxFQQnYrvBk0
         YHeLjWTW8hPHkEBRczocVFTgQ+3RNmSqy8xYnrCYiIcDP0583I130F4zpSgi9rYitt
         EsKRDLMilAZfg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] gen_compile_commands: do not support .cmd files under tools/ directory
Date:   Sat, 22 Aug 2020 04:01:53 +0900
Message-Id: <20200821190159.1033740-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821190159.1033740-1-masahiroy@kernel.org>
References: <20200821190159.1033740-1-masahiroy@kernel.org>
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

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch

 scripts/gen_compile_commands.py | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 535248cf2d7e..1b9899892d99 100755
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
@@ -84,20 +82,13 @@ def process_line(root_directory, file_directory, command_prefix, relative_path):
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
 
 
@@ -122,7 +113,7 @@ def main():
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

