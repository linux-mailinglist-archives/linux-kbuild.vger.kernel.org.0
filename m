Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9099F41E728
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351998AbhJAFfI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:08 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25301 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhJAFfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:06 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVZ000646;
        Fri, 1 Oct 2021 14:33:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVZ000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066382;
        bh=imMcxxRBOk59LpGPgQvOavvO2pXMq6eJw3Tshj1dGOU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XIS4NZEv7lQryZvIdtyKiL5AuLDzShsi3JpDVfP5d7mqN+3Nab40WSkPwq9b0NMnp
         cFyPnsVhhSCML6O4W9mvZJSYlHYMLotFjxovGheku6hfX9dGfBASB/g7f6jlZ22mfm
         12t+1A/qO/nekmFDFe4uijLLmOERIArBW9w5ABPCG4XakLCnxy+l55GmJT5JaR8UBM
         IooldsX4PHzn2FQ2YG+FdFvPonD5uGJzf53l364YgTJoCZANF0ksAi4bbsWWshZlVN
         8LxIy7DO0DXYniSIp/NDT/DBROsIuRRz//4CF2g3dCwRLqZGyVGaFkRDzWFT8OJoaw
         Lt9+3Gu2eQElw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] kconfig: refactor conf_write_autoconf()
Date:   Fri,  1 Oct 2021 14:32:50 +0900
Message-Id: <20211001053253.1223316-7-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This function does similar for auto.conf and autoconf.h

Create __conf_write_autoconf() helper to factor out the common code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 94 +++++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 37 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 2c518aaa5255..6eb2c806fec0 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -1058,13 +1058,53 @@ static int conf_touch_deps(void)
 	return 0;
 }
 
+static int __conf_write_autoconf(const char *filename,
+				 void (*print_symbol)(FILE *, struct symbol *),
+				 const struct comment_style *comment_style)
+{
+	char tmp[PATH_MAX];
+	FILE *file;
+	struct symbol *sym;
+	int ret, i;
+
+	if (make_parent_dir(filename))
+		return -1;
+
+	ret = snprintf(tmp, sizeof(tmp), "%s.tmp", filename);
+	if (ret >= sizeof(tmp)) /* check truncation */
+		return -1;
+
+	file = fopen(tmp, "w");
+	if (!file) {
+		perror("fopen");
+		return -1;
+	}
+
+	conf_write_heading(file, comment_style);
+
+	for_all_symbols(i, sym)
+		if ((sym->flags & SYMBOL_WRITE) && sym->name)
+			print_symbol(file, sym);
+
+	/* check possible errors in conf_write_heading() and print_symbol() */
+	if (ferror(file))
+		return -1;
+
+	fclose(file);
+
+	if (rename(tmp, filename)) {
+		perror("rename");
+		return -1;
+	}
+
+	return 0;
+}
+
 int conf_write_autoconf(int overwrite)
 {
 	struct symbol *sym;
-	const char *name;
 	const char *autoconf_name = conf_get_autoconfig_name();
-	FILE *out, *out_h;
-	int i;
+	int ret, i;
 
 	if (!overwrite && is_present(autoconf_name))
 		return 0;
@@ -1074,45 +1114,25 @@ int conf_write_autoconf(int overwrite)
 	if (conf_touch_deps())
 		return 1;
 
-	out = fopen(".tmpconfig", "w");
-	if (!out)
-		return 1;
-
-	out_h = fopen(".tmpconfig.h", "w");
-	if (!out_h) {
-		fclose(out);
-		return 1;
-	}
-
-	conf_write_heading(out, &comment_style_pound);
-	conf_write_heading(out_h, &comment_style_c);
-
-	for_all_symbols(i, sym) {
+	for_all_symbols(i, sym)
 		sym_calc_value(sym);
-		if (!(sym->flags & SYMBOL_WRITE) || !sym->name)
-			continue;
 
-		/* write symbols to auto.conf and autoconf.h */
-		print_symbol_for_autoconf(out, sym);
-		print_symbol_for_c(out_h, sym);
-	}
-	fclose(out);
-	fclose(out_h);
-
-	name = conf_get_autoheader_name();
-	if (make_parent_dir(name))
-		return 1;
-	if (rename(".tmpconfig.h", name))
-		return 1;
+	ret = __conf_write_autoconf(conf_get_autoheader_name(),
+				    print_symbol_for_c,
+				    &comment_style_c);
+	if (ret)
+		return ret;
 
-	if (make_parent_dir(autoconf_name))
-		return 1;
 	/*
-	 * This must be the last step, kbuild has a dependency on auto.conf
-	 * and this marks the successful completion of the previous steps.
+	 * Create include/config/auto.conf. This must be the last step because
+	 * Kbuild has a dependency on auto.conf and this marks the successful
+	 * completion of the previous steps.
 	 */
-	if (rename(".tmpconfig", autoconf_name))
-		return 1;
+	ret = __conf_write_autoconf(conf_get_autoconfig_name(),
+				    print_symbol_for_autoconf,
+				    &comment_style_pound);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.30.2

