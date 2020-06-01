Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34CFA1E9DAB
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbgFAF6W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:22 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40003 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLq023694;
        Mon, 1 Jun 2020 14:57:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLq023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991062;
        bh=OLmg5iPguTNrk6IbHD7AokOguO5w7b27x1H5GW/sCTU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gzhpz/ZstVwUmZdryhUVIdTLFoYezxL/tdjxXnH0oIjZhL8ACOcBgbHxKPyQUCxHf
         oT8TS0Nhxi17TXvdAhxU6TvbcJZMgamjWtszgiKnUaAUHWdJqCFtWaf2BuRm6qdMi1
         +moybh1jfaVn4e6ocHG97E89weAtppBAnuxBM5C0ZtGq04xVbLYtktJHZBlpBWiLCL
         ASK6yLkBLRn7r0nm8AF6Jxn5GHEpcTdMpqlsYv7+MVEPzMkb5G1wzp0ubqJhFRHlXs
         arWLDMdNl0LW/r+7qqrSpQqRZ0lTfAhLL+uV/wdK1u3vOx9BpQZbbCQouqq+pa83wl
         VR3oGGEGqqj9w==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 13/37] modpost: rename ext_sym_list to dump_list
Date:   Mon,  1 Jun 2020 14:57:07 +0900
Message-Id: <20200601055731.3006266-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
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

 scripts/mod/modpost.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 28d8f5377c62..b8e521f50b2d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2535,8 +2535,8 @@ static void write_namespace_deps_files(const char *fname)
 	free(ns_deps_buf.p);
 }
 
-struct ext_sym_list {
-	struct ext_sym_list *next;
+struct dump_list {
+	struct dump_list *next;
 	const char *file;
 };
 
@@ -2549,16 +2549,17 @@ int main(int argc, char **argv)
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
@@ -2595,13 +2596,13 @@ int main(int argc, char **argv)
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

