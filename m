Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C573D41FA78
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Oct 2021 10:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhJBJA3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 2 Oct 2021 05:00:29 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39572 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbhJBJA3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Oct 2021 05:00:29 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 1928wSeR001590;
        Sat, 2 Oct 2021 17:58:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 1928wSeR001590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633165109;
        bh=y6Vdz3468vq7hD6hH4Mvs2Z+5nlR8gIOTry/lN1Mlss=;
        h=From:To:Cc:Subject:Date:From;
        b=x4FRvnXIrDygPqS2aa61BxsaCyQsbu40QLhpCn7kef4mDk3c6JPFuO6sd3Inl9Knx
         XG8QweY7RzM3pQEgak848gfgzcRItbSOpJVgNYYFjbs0qjDapKgrVbMdUtK7BwVcM5
         rXMR3C2MJ27xGmAwxEm9SxanVFBH8b2YYeE1VDvolAm4Qb+pLyZ/CwFrn9EV/lqoW2
         QDf89zT9ukrYDP7cCKDKc5e7DxToMBR7fVwD77oZwwQSxoTNb54Pnga4g119ETNowZ
         P9pzQzRqsHeLecyUbyfxk/Cz2lFf9Re416j3gQEPza69BaTp1kEI1Dunn1XsksqRzi
         jT/05c5vRdR+Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/10] [for -next only] kconfig: generate include/generated/rustc_cfg
Date:   Sat,  2 Oct 2021 17:58:23 +0900
Message-Id: <20211002085823.1280124-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch is not intended for the mainline.

I created this patch for Stephen Rothwell to resolve the merge
conflicts in linux-next more easily.

The Rust tree is touching scripts/kconfig/confdata.c to generate
include/generated/rustc_cfg, which would cause complicated conflicts
with changes from the kbuild tree.

I re-implemented it to produce the equaivalent rustc_cfg.

I also fixed the memory leak; the original code from the Rust tree
did not free the malloc'ed pointer.

Stephen:
When you resolve the conflicts in confdata.c, please take this one.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes for v2:
 - Fix memory leak for *val == 'n' case.


 scripts/kconfig/confdata.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9ece2f3b61a6..ad371d71c842 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -603,6 +603,9 @@ static const struct comment_style comment_style_c = {
 
 static void conf_write_heading(FILE *fp, const struct comment_style *cs)
 {
+	if (!cs) /* no heading for rustc_cfg? */
+		return;
+
 	fprintf(fp, "%s\n", cs->comment_block_begin);
 
 	fprintf(fp, "%s Automatically generated file; DO NOT EDIT.\n",
@@ -750,6 +753,38 @@ static void print_symbol_for_c(FILE *fp, struct symbol *sym)
 	free(escaped);
 }
 
+/* rustc configuration */
+static void print_symbol_for_rustc_cfg(FILE *fp, struct symbol *sym)
+{
+	const char *val;
+	char *escaped;
+
+	if (sym->type == S_UNKNOWN)
+		return;
+
+	val = sym_get_string_value(sym);
+
+	if ((sym->type == S_BOOLEAN || sym->type == S_TRISTATE) && *val == 'n')
+		return;
+
+	/*
+	 * To have similar functionality to the C macro `IS_ENABLED()` we
+	 * provide an empty `--cfg CONFIG_X` here in both `y` and `m` cases.
+	 *
+	 * Then, the common `fprintf()` below will also give us a
+	 * `--cfg CONFIG_X="y"` or `--cfg CONFIG_X="m"`, which can be used as
+	 * the equivalent of `IS_BUILTIN()`/`IS_MODULE()`.
+	 */
+	if (sym->type == S_BOOLEAN || sym->type == S_TRISTATE)
+		fprintf(fp, "--cfg=%s%s\n", CONFIG_, sym->name);
+
+	escaped = escape_string_value(val);
+
+	fprintf(fp, "--cfg=%s%s=%s\n", CONFIG_, sym->name, escaped);
+
+	free(escaped);
+}
+
 /*
  * Write out a minimal config.
  * All values that has default values are skipped as this is redundant.
@@ -1129,6 +1164,12 @@ int conf_write_autoconf(int overwrite)
 	if (ret)
 		return ret;
 
+	ret = __conf_write_autoconf("include/generated/rustc_cfg",
+				    print_symbol_for_rustc_cfg,
+				    NULL);
+	if (ret)
+		return ret;
+
 	/*
 	 * Create include/config/auto.conf. This must be the last step because
 	 * Kbuild has a dependency on auto.conf and this marks the successful
-- 
2.30.2

