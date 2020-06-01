Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D00C1E9DA8
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbgFAF6V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39998 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgFAF6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:20 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLn023694;
        Mon, 1 Jun 2020 14:57:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLn023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991061;
        bh=8omp1ak2zJDPcGwE4krnaIiaOAFMT3vUAPBeNO3RNiQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Kb20fRFsITf3rTNBDP5MnKPt/e5Kd9qJrYfLdFpeL7CJOSqREo+lsE8SdaMeUnP1r
         nF8Lk/LM7CzF3V4mwD6FXhTCXgSigkP6FoWmm2r3d1JuS77rWiJeMExFS/CTuprAI5
         JTJij6WM3E33tYEE1lz34x3RiS6Cr1DAAwt4yhhxttr9sRuaY0KgmUBIktuIogVqvG
         b/rDaAT/253Xs1vvTcZ9pi5UOAzY72bRL4J0ZYxonHHQLnd3s5ErwkOIwCZqKVGBKj
         j1kQw50b8KsNqFw9nsylNw3ISGjTqpXvTGeKqI7T+/syNab5W71MM12SNltRgImqRz
         PoGpMzGaDCCJw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/37] modpost: load KBUILD_EXTRA_SYMBOLS files in order
Date:   Mon,  1 Jun 2020 14:57:04 +0900
Message-Id: <20200601055731.3006266-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
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

 scripts/mod/modpost.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 160139508821..5224a02edbf2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2555,8 +2555,8 @@ int main(int argc, char **argv)
 	int opt;
 	int err;
 	int n;
-	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
+	struct ext_sym_list **extsym_iter = &extsym_start;
 
 	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
@@ -2566,11 +2566,9 @@ int main(int argc, char **argv)
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
@@ -2610,10 +2608,12 @@ int main(int argc, char **argv)
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

