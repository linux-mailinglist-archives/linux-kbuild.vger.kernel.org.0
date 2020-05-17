Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020731D6720
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2020 11:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgEQJuw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 05:50:52 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38299 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbgEQJtf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 05:49:35 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 04H9n4LA018560;
        Sun, 17 May 2020 18:49:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 04H9n4LA018560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589708953;
        bh=r15Zqyu0314pn0p8/OzIECBjRDQoaidbyvoxk5EXhGc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aoJSSGVWYjqnFp5uHAh+aIIKwJSoQM+n7z4vETmuBec1W4bcNW18vQpkg+gQgEkrq
         A622fchT5MC89C7NkFsheevHHSXo84U4tu6fXZ82K3vly8JCyQDUQ1Y+x767lXsnzR
         wZulJSCUSP17iU7bvSMM8SbRD/YVj1R9pA0YWEv5FVnWrW1ytLjrur/Jpg0ixnZMaM
         WcXH18ceUoLOBuO8bFulZtzo6zgiUAiaND8ldmbMyuaWg4Ozn8h7UOWi+ozw2C4lqx
         6DVb+eVLx2N9yoaNonIRSbdZ5Nxs8D93960ftaLFKuHNSo2btkpEYFKXKJ5lu56L9i
         8J2JG9AYCDR7g==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 13/29] modpost: load KBUILD_EXTRA_SYMBOLS files in order
Date:   Sun, 17 May 2020 18:48:43 +0900
Message-Id: <20200517094859.2376211-14-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200517094859.2376211-1-masahiroy@kernel.org>
References: <20200517094859.2376211-1-masahiroy@kernel.org>
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
index cd3cb781a2e7..dc8f15f10da0 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2559,8 +2559,8 @@ int main(int argc, char **argv)
 	int opt;
 	int err;
 	int n;
-	struct ext_sym_list *extsym_iter;
 	struct ext_sym_list *extsym_start = NULL;
+	struct ext_sym_list **extsym_iter = &extsym_start;
 
 	while ((opt = getopt(argc, argv, "i:e:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
@@ -2570,11 +2570,9 @@ int main(int argc, char **argv)
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
@@ -2614,10 +2612,12 @@ int main(int argc, char **argv)
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

