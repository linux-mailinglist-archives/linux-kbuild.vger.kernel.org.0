Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A79E1D6721
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgEQJuw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:52 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38304 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgEQJtf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LF018560;
        Sun, 17 May 2020 18:49:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LF018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708956;
        bh=j6wsEFU4ZcKF4NPr4DfjF9axIs0Sidaw0zTXsYPAy7A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U2WWQaHwnMz4agedu7Is/7ZBE1xWaZmv2LrLfO4i5dns6ctK7/vzY9qGYlzbsjgMR
         aput7/2IGj9E8qkBwWVgrOWa1cnBH/wtNnXDGVK2pQuc+ZBl7AF3YYI0id1jTy4ppa
         pWw2UBlX9u0zs4DZPW6Di9xaS9ia/dDWJx3IS1ee3OHawLgxzyJPunU05CXfdE9i21
         rLG9ePgM64VgnwddVcJRsVEhDYhRCTs2NM/b2N3VfWChE/JIpyzq7gd5sWp8hqEjBx
         Aii8HC0NcRSmsvBGZPv0LCtlzNjOIfsoJ8/vppSRYgq5Jn2GjC05UyA1XdjYESCtTq
         XgZrAErR+WU7w==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 18/29] modpost: show warning if vmlinux is not found when processing modules
Date:   Sun, 17 May 2020 18:48:48 +0900
Message-Id: <20200517094859.2376211-19-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

check_exports() does not print warnings about unresolved symbols if
vmlinux is missing because there would be too many.

This situation happens when you do 'make modules' from the clean
tree, or compile external modules against a kernel tree that has
not been completely built.

Not checking unresolved symbols is dangerous because you might be
building useless modules. At least it should be noted.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index b14ecfbfd640..8150be00e3df 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2004,8 +2004,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	/* When there's no vmlinux, don't print warnings about
-	 * unresolved symbols (since there'll be too many ;) */
 	if (is_vmlinux(modname)) {
 		have_vmlinux = 1;
 		mod->skip = 1;
@@ -2617,6 +2615,13 @@ int main(int argc, char **argv)
 	if (files_source)
 		read_symbols_from_files(files_source);
 
+	/*
+	 * When there's no vmlinux, don't print warnings about
+	 * unresolved symbols (since there'll be too many ;)
+	 */
+	if (!have_vmlinux)
+		warn("Symbol info of vmlinux is missing. Unresolved symbol check will be entirely skipped.\n");
+
 	err = 0;
 
 	for (mod = modules; mod; mod = mod->next) {
-- 
2.25.1

