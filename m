Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD846318FB1
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 17:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbhBKQQB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 11:16:01 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:26451 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbhBKQN4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 11:13:56 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 11BGC1x7021970;
        Fri, 12 Feb 2021 01:12:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 11BGC1x7021970
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613059922;
        bh=3/hwJtYyqVNBvsoXcMoZWlx6opZT0eYugHUwt0TrPzA=;
        h=From:To:Cc:Subject:Date:From;
        b=p1+BosIh832dUiMNkkaFMFuhQ9cl3yVy+gi6iKWxgYlx/OnxC4B+M1yU8UkyUD9Yd
         eEATrYFFlHJi9nDrSrlHUWTQEsbYitnU7xjbiMQaa/vC8IEOOpVQMvJpZlmAl69TCL
         SI0k6YESbm7noHd682KMP2a/y3M2aAVyoNTCPIhv9DLkIIvPB/pzLrqz/i3F5+2Ru3
         nNvChYaPFJXxpdIK0/v2h9yfhHj2Sz+i0Z8fahS/yILfAVvXr97FXVFo2SepYkKu5V
         8vqymz8DJO7jrHFuo1E+UE4s40tE5dSHaRHxOnH3l4lFMUVH6ImnHlONVIiBT9yOFh
         9tiDYr59KujXw==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH] gen_compile_commands: prune some directories
Date:   Fri, 12 Feb 2021 01:11:54 +0900
Message-Id: <20210211161154.3892836-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If directories are passed to gen_compile_commands.py, os.walk() traverses
all the subdirectories to search for .cmd files, but we know some of them
are not worth traversing.

Use the 'topdown' parameter of os.walk to prune them.

Documentation about the 'topdown' option of os.walk:
  When topdown is True, the caller can modify the dirnames list
  in-place (perhaps using del or slice assignment), and walk() will
  only recurse into the subdirectories whose names remain in dirnames;
  this can be used to prune the search, impose a specific order of
  visiting, or even to inform walk() about directories the caller
  creates or renames before it resumes walk() again. Modifying
  dirnames when topdown is False has no effect on the behavior of
  the walk, because in bottom-up mode the directories in dirnames
  are generated before dirpath itself is generated.

This commit prunes four directories, .git, Documentation, include, and
tools.

The first three do not contain any C files. My main motivation is the
last one, tools/ directory.

Commit 6ca4c6d25949 ("gen_compile_commands: do not support .cmd files
under tools/ directory") stopped supporting the tools/ directory.
The current code no longer picks up .cmd files from the tools/
directory.

If you run:

  ./scripts/clang-tools/gen_compile_commands.py --log_level=INFO

then, you will see several "File ... not found" log messages.

This is expected, and I do not want to support the tools/ directory.
However, without an explicit comment "do not support tools/", somebody
might try to get it back. Clarify this.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/clang-tools/gen_compile_commands.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 19963708bcf8..eb5faefbdf74 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -20,7 +20,9 @@ _DEFAULT_LOG_LEVEL = 'WARNING'
 _FILENAME_PATTERN = r'^\..*\.cmd$'
 _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
-
+# The tools/ directory adopts a different build system, and produces .cmd
+# files in a different format. Do not support it.
+_EXCLUDE_DIRS = ['.git', 'Documentation', 'include', 'tools']
 
 def parse_arguments():
     """Sets up and parses command-line arguments.
@@ -80,8 +82,14 @@ def cmdfiles_in_dir(directory):
     """
 
     filename_matcher = re.compile(_FILENAME_PATTERN)
+    exclude_dirs = [ os.path.join(directory, d) for d in _EXCLUDE_DIRS ]
+
+    for dirpath, dirnames, filenames in os.walk(directory, topdown=True):
+        # Prune unwanted directories.
+        if dirpath in exclude_dirs:
+            dirnames[:] = []
+            continue
 
-    for dirpath, _, filenames in os.walk(directory):
         for filename in filenames:
             if filename_matcher.match(filename):
                 yield os.path.join(dirpath, filename)
-- 
2.27.0

