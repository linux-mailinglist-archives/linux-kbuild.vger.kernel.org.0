Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E2224E80C
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 16:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbgHVO5V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 10:57:21 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:47424 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgHVO5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 10:57:12 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 07MEuKVU025434;
        Sat, 22 Aug 2020 23:56:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 07MEuKVU025434
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598108185;
        bh=kQajBz1G8qgjw+0MUJ0nLzYzwlOyQl9s1CrXywysVeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vVURP5tFck6wTrk+tHt9VgorM49hz3tpp9tlXMa3TTq/tlPVJ0pG6BxeKc6BN0ZYd
         aMLUO7uhDeFf5Vb8btlg0HItIdVY04qqIWczH42rNBUw1A0lLOKxT5EzHyWLlg5MYV
         xUdEZpMZt3RnUy11CpbDkFEunCegtTSnwf91albn0hWqDpCj6xlrmR1ND/k3eQ+Hoh
         Asca0qIOpasw8LMoL00yibcSF64p1ggahnNOLqwO7Mk5goKGnpwPp2Z5hEbuDumVkn
         xz6VFXS8NOI3jnke/0WpTkcIW705gTLT1hqNOBppWkZ9rjFwf/H9LFkKOfU6JFVMg7
         IDnMRkctY88+g==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] gen_compile_commands: make -o option independent of -d option
Date:   Sat, 22 Aug 2020 23:56:13 +0900
Message-Id: <20200822145618.1222514-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200822145618.1222514-1-masahiroy@kernel.org>
References: <20200822145618.1222514-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Change the -o option independent of the -d option, which is I think
clearer behavior. Some people may like to use -d to specify a separate
output directory, but still output the compile_commands.py in the
source directory (unless the source tree is read-only) because it is
the default location Clang Tools search for the compilation database.

Also, move the default parameter to the default= argument of the
.add_argument().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---

(no changes since v2)

Changes in v2:
  - New patch

 scripts/gen_compile_commands.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index f37c1dac8db4..71a0630ae188 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -39,11 +39,13 @@ def parse_arguments():
 
     directory_help = ('specify the output directory used for the kernel build '
                       '(defaults to the working directory)')
-    parser.add_argument('-d', '--directory', type=str, help=directory_help)
+    parser.add_argument('-d', '--directory', type=str, default='.',
+                        help=directory_help)
 
-    output_help = ('The location to write compile_commands.json (defaults to '
-                   'compile_commands.json in the search directory)')
-    parser.add_argument('-o', '--output', type=str, help=output_help)
+    output_help = ('path to the output command database (defaults to ' +
+                   _DEFAULT_OUTPUT + ')')
+    parser.add_argument('-o', '--output', type=str, default=_DEFAULT_OUTPUT,
+                        help=output_help)
 
     log_level_help = ('the level of log messages to produce (defaults to ' +
                       _DEFAULT_LOG_LEVEL + ')')
@@ -52,11 +54,9 @@ def parse_arguments():
 
     args = parser.parse_args()
 
-    directory = args.directory or os.getcwd()
-    output = args.output or os.path.join(directory, _DEFAULT_OUTPUT)
-    directory = os.path.abspath(directory)
-
-    return args.log_level, directory, output
+    return (args.log_level,
+            os.path.abspath(args.directory),
+            args.output)
 
 
 def process_line(root_directory, command_prefix, file_path):
-- 
2.25.1

