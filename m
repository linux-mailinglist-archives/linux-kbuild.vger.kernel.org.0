Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADAA83256EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Feb 2021 20:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233364AbhBYTnG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Feb 2021 14:43:06 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:27033 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233688AbhBYTkz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Feb 2021 14:40:55 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 11PJdHhX022432;
        Fri, 26 Feb 2021 04:39:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 11PJdHhX022432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614281958;
        bh=Un4E+2aUOV2+Wl5VZVnD+a1bDXLl6aHMYaActAJFkKI=;
        h=From:To:Cc:Subject:Date:From;
        b=Uaq0cFcRzkCPAU6jyVmA0LZjH61sS18V2zm1HcnLH6j6czFK93xoeDhX2ngnCM9Nw
         BRpV3rWML686mPAUYiUy5J7uH+1tmPj87vaf70cJqfDry0Eg3hKZY4T50FJGi+hiiN
         6/SKcRw9WcS2yHtL6RKfabOw4JAGd5MUkYzsJSofUoDvmdcRin+sTAIqUnzh5XNKlT
         NwlSLU0PFvjx94Kn3GeQZ6RORL8xxFyAoyjVQZGBt8XH2xEm0S0wGNutIvyGQYINny
         gES6wXdTtaEIx6mdvDs/ybNsRQaQKhPoF1IWu6kR8sPQxOe4J9wQ0GqbBaiys4HIup
         jpIzU1VytPF9w==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: remove .thinlto-cache by 'make clean'
Date:   Fri, 26 Feb 2021 04:39:12 +0900
Message-Id: <20210225193912.3303604-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make clean' should remove build artifacts unneeded by external module
builds. Obviously, you do not need to keep this directory.

Fixes: dc5723b02e52 ("kbuild: add support for Clang LTO")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b18dbc634690..8601a86ebe38 100644
--- a/Makefile
+++ b/Makefile
@@ -1501,7 +1501,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += include/ksym vmlinux.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
-	       compile_commands.json
+	       compile_commands.json .thinlto-cache
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
@@ -1515,7 +1515,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  *.spec
 
 # Directories & files removed with 'make distclean'
-DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS .thinlto-cache
+DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
 
 # clean - Delete most, but leave enough to build external modules
 #
-- 
2.27.0

