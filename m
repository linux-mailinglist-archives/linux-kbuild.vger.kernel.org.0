Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCB041E727
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351969AbhJAFfH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:07 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25298 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351850AbhJAFfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:06 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVa000646;
        Fri, 1 Oct 2021 14:33:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVa000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066382;
        bh=WTpKMRil49Ua4S75pS4uC3uoC8dv8trD2opZWKxINlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WlqaepZjENagIx2wkk3vOaEPy6e4jNyfVfE2x86FCNkSezGV3hgzZwYlxodhaRuD8
         yxzcDtphUN+NBmnQ5ZC23JUBwiyz339SQ/mHicl0rtTmtJeHJ9usUh13wNbkTUuexl
         q4BvY2WU6XMQRgbvTRnfxG9sQ1xSuaROvNjXpWT2CaohTckZphB/rLa5Wnxoyfipnv
         zw7qR4zFsc95drlHMDsVre3jZWjocO+sRFuatjNwbAkcEBO9na1Mid8WkbdRKeSfsh
         YbWM3DyBv4/A9Ttarry1eahZH0iX9+cfAWI6zfe56oMpmKwmQs9xbBDQKCdQ9/VMMq
         DuSxA1BCyPTwQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] kconfig: refactor conf_write_dep()
Date:   Fri,  1 Oct 2021 14:32:51 +0900
Message-Id: <20211001053253.1223316-8-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The if ... else inside the for-loop is unneeded because one empty
line is placed after printing the last element of deps_config.

Currently, all errors in conf_write_dep() are ignored. Add proper
error checks.

Rename it to conf_write_autoconf_cmd(), which is more intuitive.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 54 ++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 6eb2c806fec0..75e45e69d660 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -957,32 +957,50 @@ int conf_write(const char *name)
 }
 
 /* write a dependency file as used by kbuild to track dependencies */
-static int conf_write_dep(const char *name)
+static int conf_write_autoconf_cmd(const char *autoconf_name)
 {
+	char name[PATH_MAX], tmp[PATH_MAX];
 	struct file *file;
 	FILE *out;
+	int ret;
 
-	out = fopen("..config.tmp", "w");
-	if (!out)
-		return 1;
-	fprintf(out, "deps_config := \\\n");
-	for (file = file_list; file; file = file->next) {
-		if (file->next)
-			fprintf(out, "\t%s \\\n", file->name);
-		else
-			fprintf(out, "\t%s\n", file->name);
+	ret = snprintf(name, sizeof(name), "%s.cmd", autoconf_name);
+	if (ret >= sizeof(name)) /* check truncation */
+		return -1;
+
+	if (make_parent_dir(name))
+		return -1;
+
+	ret = snprintf(tmp, sizeof(tmp), "%s.cmd.tmp", autoconf_name);
+	if (ret >= sizeof(tmp)) /* check truncation */
+		return -1;
+
+	out = fopen(tmp, "w");
+	if (!out) {
+		perror("fopen");
+		return -1;
 	}
-	fprintf(out, "\n%s: \\\n"
-		     "\t$(deps_config)\n\n", conf_get_autoconfig_name());
 
-	env_write_dep(out, conf_get_autoconfig_name());
+	fprintf(out, "deps_config := \\\n");
+	for (file = file_list; file; file = file->next)
+		fprintf(out, "\t%s \\\n", file->name);
+
+	fprintf(out, "\n%s: $(deps_config)\n\n", autoconf_name);
+
+	env_write_dep(out, autoconf_name);
 
 	fprintf(out, "\n$(deps_config): ;\n");
+
+	if (ferror(out)) /* error check for all fprintf() calls */
+		return -1;
+
 	fclose(out);
 
-	if (make_parent_dir(name))
-		return 1;
-	rename("..config.tmp", name);
+	if (rename(tmp, name)) {
+		perror("rename");
+		return -1;
+	}
+
 	return 0;
 }
 
@@ -1109,7 +1127,9 @@ int conf_write_autoconf(int overwrite)
 	if (!overwrite && is_present(autoconf_name))
 		return 0;
 
-	conf_write_dep("include/config/auto.conf.cmd");
+	ret = conf_write_autoconf_cmd(autoconf_name);
+	if (ret)
+		return -1;
 
 	if (conf_touch_deps())
 		return 1;
-- 
2.30.2

