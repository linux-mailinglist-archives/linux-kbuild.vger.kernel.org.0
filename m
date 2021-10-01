Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C816941E72A
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238424AbhJAFfI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:08 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25308 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230512AbhJAFfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:06 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVY000646;
        Fri, 1 Oct 2021 14:33:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVY000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066381;
        bh=TY3pNDuHtjJvzRNvuIX7wXtebmfGI1zG24Lpl/V7eeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IEKR2PDn/KdO5HXPiyrfnsW1d/OsJ+9E2cPIRgo6lH8QNAtLB9JdkqDN6UsPq2hpc
         UXgV2UuWlda91GTIrgWi88nbq5cV7klPmuS3UL81abvNn8ttg8YC5Ylf4XjgriiOgY
         ykRrnmVzg3+1l6/D8SLY2QnaGYUUpkWKKi31ZCjn9t2LLtqSH0N4rbRzFvR87umLl0
         u7+w1WCigqOq50N1AIDMYpTryULAWIB/PhbgI9nRgpxcoMXp7Sg9tuaCPFEdqtI9a/
         29ejGdBKpcdMLrvVNotvQrO21G6OtL0YHefsiQcw6MDGB+zOjXSkjgFD7EtswXXf5z
         9UnDNwjbyBnfA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] kconfig: add conf_get_autoheader_name()
Date:   Fri,  1 Oct 2021 14:32:49 +0900
Message-Id: <20211001053253.1223316-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For consistency with conf_get_autoconfig_name()

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 78af1dd68894..2c518aaa5255 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -223,6 +223,13 @@ static const char *conf_get_autoconfig_name(void)
 	return name ? name : "include/config/auto.conf";
 }
 
+static const char *conf_get_autoheader_name(void)
+{
+	char *name = getenv("KCONFIG_AUTOHEADER");
+
+	return name ? name : "include/generated/autoconf.h";
+}
+
 static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 {
 	char *p2;
@@ -1092,9 +1099,7 @@ int conf_write_autoconf(int overwrite)
 	fclose(out);
 	fclose(out_h);
 
-	name = getenv("KCONFIG_AUTOHEADER");
-	if (!name)
-		name = "include/generated/autoconf.h";
+	name = conf_get_autoheader_name();
 	if (make_parent_dir(name))
 		return 1;
 	if (rename(".tmpconfig.h", name))
-- 
2.30.2

