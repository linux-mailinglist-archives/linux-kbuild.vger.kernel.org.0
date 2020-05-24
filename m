Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF761E0007
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbgEXPoC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:02 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19702 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728477AbgEXPnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:24 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcV3017561;
        Mon, 25 May 2020 00:42:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcV3017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334968;
        bh=wb0J5G69DoTL+wI0/9Zf5SSHfE9nobJztDSHU3cD8KA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=zYW7bndk7h1x9i4Wf+d0tnhWI3BobwdLFkUaa2Z8UMJclQ7dROXOznJLsdSNmRClw
         oywJsdlqt0xC7yqgV3GF2qiUSPY3T+qhfAFrI0tgkY5woxSH3NfN5T1AOYHTAdBSHA
         n2kTR+ef9/xOu0OGDXucTcnsDzE3/o+oaZGYZ+Z/sRENab8IktWsSsuN3Vn0hVMx1V
         ZokR/JQx483t5pNKZNMWg0OGTjO67cfOiPgwbOG0/4bEDGQ3dPYDYty2Lu0ca2t2q5
         tuz/OVxQXZmZLeWtYngS7AShZ9u7mzgqnLSCghsfaoGGDBI3ulJfVe1987pxmQS48c
         VbSCMSHmdb6dQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 18/29] modpost: show warning if vmlinux is not found when processing modules
Date:   Mon, 25 May 2020 00:42:24 +0900
Message-Id: <20200524154235.380482-19-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
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

Changes in v2: None

 scripts/mod/modpost.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0a24d2c501c1..638c45d35292 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2014,8 +2014,6 @@ static void read_symbols(const char *modname)
 
 	mod = new_module(modname);
 
-	/* When there's no vmlinux, don't print warnings about
-	 * unresolved symbols (since there'll be too many ;) */
 	if (is_vmlinux(modname)) {
 		have_vmlinux = 1;
 		mod->skip = 1;
@@ -2627,6 +2625,13 @@ int main(int argc, char **argv)
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

