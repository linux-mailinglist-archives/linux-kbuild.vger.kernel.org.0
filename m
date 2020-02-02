Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9D4A14FB8B
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Feb 2020 06:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgBBFJg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Feb 2020 00:09:36 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:58015 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbgBBFJg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Feb 2020 00:09:36 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 01259SCZ026546;
        Sun, 2 Feb 2020 14:09:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 01259SCZ026546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580620168;
        bh=0KYkc3+fXPLDfoOu9nykrUesAlfwthN/qlBaxElOalE=;
        h=From:To:Cc:Subject:Date:From;
        b=NMHjpqsm8UEFuIo6bHwGU3Pf8KTgA5qcwn/OraUGIJmWAU9eGmcservBHTftCJQsa
         GrgqnOHWFfwR4C3raferS163o0qZoQOLx2wU183f7SoQppDW5xCVSPYeTsZAaUiCfk
         pU4h3OCnUKRXPDFPtgekz3AcGD0PLo4qSXsdl4upIhxNaBTJI9jVMyeEGqGSusSrxc
         ST86bjl/XZ1pRJPVFQ92e7XYiejloIRLvTCHjc8R9oUqMU3NPWIns5CMjYa5aWyaQl
         tRKGUTv+nvK0s6KB44WZ81tPvGnIeDjes+5SXKaNqYrbQe4d1cnVQm334UbJ9kBu+P
         KTZRxGU4ATsKg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] scripts/kallsyms: rename local variables in read_symbol()
Date:   Sun,  2 Feb 2020 14:09:20 +0900
Message-Id: <20200202050922.12402-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I will use 'sym' for the point to struce sym_entry in the next commit.
Rename 'sym', 'stype' to 'name', 'type', which are more intuitive.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 94153732ec00..5c34edd98b3e 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -176,43 +176,43 @@ static void check_symbol_range(const char *sym, unsigned long long addr,
 
 static int read_symbol(FILE *in, struct sym_entry *s)
 {
-	char sym[500], stype;
+	char name[500], type;
 	int rc;
 
-	rc = fscanf(in, "%llx %c %499s\n", &s->addr, &stype, sym);
+	rc = fscanf(in, "%llx %c %499s\n", &s->addr, &type, name);
 	if (rc != 3) {
-		if (rc != EOF && fgets(sym, 500, in) == NULL)
+		if (rc != EOF && fgets(name, 500, in) == NULL)
 			fprintf(stderr, "Read error or end of file.\n");
 		return -1;
 	}
-	if (strlen(sym) >= KSYM_NAME_LEN) {
+	if (strlen(name) >= KSYM_NAME_LEN) {
 		fprintf(stderr, "Symbol %s too long for kallsyms (%zu >= %d).\n"
 				"Please increase KSYM_NAME_LEN both in kernel and kallsyms.c\n",
-			sym, strlen(sym), KSYM_NAME_LEN);
+			name, strlen(name), KSYM_NAME_LEN);
 		return -1;
 	}
 
-	if (is_ignored_symbol(sym, stype))
+	if (is_ignored_symbol(name, type))
 		return -1;
 
 	/* Ignore most absolute/undefined (?) symbols. */
-	if (strcmp(sym, "_text") == 0)
+	if (strcmp(name, "_text") == 0)
 		_text = s->addr;
 
-	check_symbol_range(sym, s->addr, text_ranges, ARRAY_SIZE(text_ranges));
-	check_symbol_range(sym, s->addr, &percpu_range, 1);
+	check_symbol_range(name, s->addr, text_ranges, ARRAY_SIZE(text_ranges));
+	check_symbol_range(name, s->addr, &percpu_range, 1);
 
 	/* include the type field in the symbol name, so that it gets
 	 * compressed together */
-	s->len = strlen(sym) + 1;
+	s->len = strlen(name) + 1;
 	s->sym = malloc(s->len + 1);
 	if (!s->sym) {
 		fprintf(stderr, "kallsyms failure: "
 			"unable to allocate required amount of memory\n");
 		exit(EXIT_FAILURE);
 	}
-	strcpy(sym_name(s), sym);
-	s->sym[0] = stype;
+	strcpy(sym_name(s), name);
+	s->sym[0] = type;
 
 	s->percpu_absolute = 0;
 
-- 
2.17.1

