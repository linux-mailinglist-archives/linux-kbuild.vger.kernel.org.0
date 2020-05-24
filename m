Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B851E0009
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 17:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbgEXPoD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 24 May 2020 11:44:03 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:19695 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728375AbgEXPnX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 May 2020 11:43:23 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04OFgcV1017561;
        Mon, 25 May 2020 00:42:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04OFgcV1017561
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590334967;
        bh=89ErMXh26P8QYWxRP0K/OpAcmsgvizV+z6whwSbR2d0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e/obEuaHX7a+d74Zl+wXvYZ5FFE+NGkH2rBMGi7hOF4D6ftW8LsuYeI35g71elD2B
         UrDt9xM/TWcylHFJt1TSrcWuZoXDJaleH+Bst8/dMfeF7zM7/ySuEpf78FCcKHmbug
         GlXhgztiLvtuyqvm3wWJGoo5ebbKIah8hJg9Zmy0HB8TQfqiDylzeSSs5/MZ5cL1DR
         K9ljwPuMS/otEQ3O8vDGopTRBqBReasGtBg0QuiVx8WdzizaYSB0kwnw2kt0eaasJ7
         MqQDBB60RzkjdyxJFYdPkxgEAsjHMSiAY68it7KNJ7wAB1MVpKYTIIkfPeCkBT77+k
         Mfq8mBjJMyVIw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/29] modpost: rename ext_sym_list to dump_list
Date:   Mon, 25 May 2020 00:42:22 +0900
Message-Id: <20200524154235.380482-17-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200524154235.380482-1-masahiroy@kernel.org>
References: <20200524154235.380482-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The -i option is used to include Modules.symver as well as files from
$(KBUILD_EXTRA_SYMBOLS).

Make the struct and variable names more generic.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 scripts/mod/modpost.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 2ecf72a176cf..ebfc720ee5a4 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2549,8 +2549,8 @@ static void write_namespace_deps_files(const char *fname)
 	free(ns_deps_buf.p);
 }
 
-struct ext_sym_list {
-	struct ext_sym_list *next;
+struct dump_list {
+	struct dump_list *next;
 	const char *file;
 };
 
@@ -2563,16 +2563,17 @@ int main(int argc, char **argv)
 	int opt;
 	int err;
 	int n;
-	struct ext_sym_list *extsym_start = NULL;
-	struct ext_sym_list **extsym_iter = &extsym_start;
+	struct dump_list *dump_read_start = NULL;
+	struct dump_list **dump_read_iter = &dump_read_start;
 
 	while ((opt = getopt(argc, argv, "i:mnsT:o:awENd:")) != -1) {
 		switch (opt) {
 		case 'i':
 			external_module = 1;
-			*extsym_iter = NOFAIL(calloc(1, sizeof(**extsym_iter)));
-			(*extsym_iter)->file = optarg;
-			extsym_iter = &(*extsym_iter)->next;
+			*dump_read_iter =
+				NOFAIL(calloc(1, sizeof(**dump_read_iter)));
+			(*dump_read_iter)->file = optarg;
+			dump_read_iter = &(*dump_read_iter)->next;
 			break;
 		case 'm':
 			modversions = 1;
@@ -2609,13 +2610,13 @@ int main(int argc, char **argv)
 		}
 	}
 
-	while (extsym_start) {
-		struct ext_sym_list *tmp;
+	while (dump_read_start) {
+		struct dump_list *tmp;
 
-		read_dump(extsym_start->file);
-		tmp = extsym_start->next;
-		free(extsym_start);
-		extsym_start = tmp;
+		read_dump(dump_read_start->file);
+		tmp = dump_read_start->next;
+		free(dump_read_start);
+		dump_read_start = tmp;
 	}
 
 	while (optind < argc)
-- 
2.25.1

