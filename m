Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA871DFFFD
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387602AbgEXPnp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:43:45 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19709 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728508AbgEXPnY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:24 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcUw017561;
        Mon, 25 May 2020 00:42:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcUw017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334966;
        bh=Pe8hfxDjRGUZwydN8j8H7B1RhdHPopr2dmjeMw9MlSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lUIhpfd+chEgZcG0avG81gcQ7wrL+fAhRJPj25CpVNt9dEpZpspYCKgb7Tom4L7He
         FYeH4tK7O4QR+2GAGwINgIK1Xp3ESbsSggR9qVigLRUF8OXs3rbjE3WiGmK4w4mYjz
         fgmHV6TQK+6B9qf6JVITWH+wL7Gq0o+4fdFEIMGxCOkQBt+bRKG8XOvdm1sDowt+BO
         90YqdAA50kTl/mKNswt/H479vbpkHncj2BIUS9PA/1zhSi+mxkgqA9xOlaxXcfQEyX
         gYNfYxv3eSCmpO/5AGKrxef9ZZhG9NTVt10vgRtTVHy7RBTdhmpXk3w3dkCgYkGsGO
         R83dVAZMIrDDQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/29] modpost: load KBUILD_EXTRA_SYMBOLS files in order
Date:   Mon, 25 May 2020 00:42:19 +0900
Message-Id: <20200524154235.380482-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, modpost reads extra symbol dump files in the reverse order.
If '-e foo -e bar' is given, modpost reads bar, foo, in this order.

This is probably not a big deal, but there is no good reason to reverse
the order. Read files in the given order.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 33cdb78a4ba1..2f5fab40d859 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2569,8 +2569,8 @@ int main(int argc, char **argv)
 	int opt;
 	int err;
 	int n;
-	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
+	struct ext_sym_list **extsym_iter = &extsym_start;
 
 	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
@@ -2580,11 +2580,9 @@ int main(int argc, char **argv)
 			break;
 		case 'e':
 			external_module = 1;
-			extsym_iter =
-			   NOFAIL(malloc(sizeof(*extsym_iter)));
-			extsym_iter->next = extsym_start;
-			extsym_iter->file = optarg;
-			extsym_start = extsym_iter;
+			*extsym_iter = NOFAIL(calloc(1, sizeof(**extsym_iter)));
+			(*extsym_iter)->file = optarg;
+			extsym_iter = &(*extsym_iter)->next;
 			break;
 		case 'm':
 			modversions = 1;
@@ -2624,10 +2622,12 @@ int main(int argc, char **argv)
 	if (kernel_read)
 		read_dump(kernel_read, 1);
 	while (extsym_start) {
+		struct ext_sym_list *tmp;
+
 		read_dump(extsym_start->file, 0);
-		extsym_iter = extsym_start->next;
+		tmp = extsym_start->next;
 		free(extsym_start);
-		extsym_start = extsym_iter;
+		extsym_start = tmp;
 	}
 
 	while (optind < argc)
-- 
2.25.1

