Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF581E000F
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbgEXPoQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:16 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19700 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728407AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcV2017561;
        Mon, 25 May 2020 00:42:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcV2017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334968;
        bh=dx46xPKo8/Ev4BVyOq1gqpNICFRHPYuyTLcxI7gbKJA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TAjbyITJi6GbuNHF7Httids1qDblpUwBbcTqdKKWiZtHTbAEPVvnrq2KJ8c0SRzFc
         u01AGCSeLQKYhgFPC20B5v4yigOp4pkNMkQkD/tVMPn3UCLEqRkrPkPumcCwNbQREY
         en38dmTVjML0XOlk2X4/3cEUtD5V0VR4TDqy83UTAPi/PUJLCjJ2enUM/z3uu0b9x4
         i/G7mEQamLN24S8BNRdqCaBBr1Kk8aYLBK2lrGx92T9B7lYQUDNZfgV2UENwpjVZ9G
         F0id7I+7aBp3iOinWAj9mQWVfCp92IOP5mpXPx3sTwRQlAOrVlQtw3B4ktKleANe9k
         ct/WIdJAgOUEw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/29] modpost: re-add -e to set external_module flag
Date:   Mon, 25 May 2020 00:42:23 +0900
Message-Id: <20200524154235.380482-18-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Previously, the -i option had two functions; load a symbol dump file,
and set the external_module flag.

I want to assign a dedicate option for each of them.

Going forward, the -i is used to load a symbol dump file, and the -e
to set the external_module flag.

With this, we will be able to use -i for loading in-kernel symbols.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/Makefile.modpost | 1 +
 scripts/mod/modpost.c    | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index a316095c843c..d14143b30b7a 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -81,6 +81,7 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
 
 # modpost options for external modules
 MODPOST += \
+	-e \
 	-i Module.symvers \
 	$(addprefix -i ,$(KBUILD_EXTRA_SYMBOLS)) \
 	-o $(KBUILD_EXTMOD)/Module.symvers
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ebfc720ee5a4..0a24d2c501c1 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2566,10 +2566,12 @@ int main(int argc, char **argv)
 	struct dump_list *dump_read_start = NULL;
 	struct dump_list **dump_read_iter = &dump_read_start;
 
-	while ((opt = getopt(argc, argv, "i:mnsT:o:awENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
-		case 'i':
+		case 'e':
 			external_module = 1;
+			break;
+		case 'i':
 			*dump_read_iter =
 				NOFAIL(calloc(1, sizeof(**dump_read_iter)));
 			(*dump_read_iter)->file = optarg;
-- 
2.25.1

