Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4F741E72E
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352070AbhJAFfP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:15 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25299 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351892AbhJAFfG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:06 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVc000646;
        Fri, 1 Oct 2021 14:33:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVc000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066383;
        bh=fDT5+bUlmH+NExGoDYLtSJAw+fxo+1QQtTvlcIJMHwA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cXFbXehx1QWuFwCVzhp2mFbtwDDEQ7QqbvsoqRkGxjxvL0er5zGEG63RET1wr4KNs
         n1MpfNnVedHTKK2HacwwlBJrIgBOBYgB6t/tulFqyN5Qd93ecgqsgoJXiim7u+pmzp
         iPj/FctWVeF7/aKXrINK/ImPj3JmSHmSdR/Ha8W/LRBuQt0WNizZ8u0CAi4SlfKXN5
         m6ZFFEOgDczaQvi8/l9iz89Q9oR/QqA9e8FuNJanzntLc2n0wTVEDRHhubTeZ6mDxc
         bewuUnCHV8o1yw47yhaAoj9/1Xj5MOuOaPgENc83EGCNXOrd+dZ+ZsDUb/8c5+OMvb
         IZB+LaH2pX2cw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] [for next only] kconfig: generate include/generated/rustc_cfg
Date:   Fri,  1 Oct 2021 14:32:53 +0900
Message-Id: <20211001053253.1223316-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch is not intended for the mainline.

I created this patch for Stephen Rothwell to resolve the merge
conflicts more easily.

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

 scripts/kconfig/confdata.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 9ece2f3b61a6..4767f3810cf4 100644
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
@@ -750,6 +753,39 @@ static void print_symbol_for_c(FILE *fp, struct symbol *sym)
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
+	escaped = escape_string_value(val);
+
+	if (sym->type == S_BOOLEAN || sym->type == S_TRISTATE) {
+		if (*val == 'n')
+			return;
+
+		/*
+		 * To have similar functionality to the C macro `IS_ENABLED()`
+		 * we provide an empty `--cfg CONFIG_X` here in both `y`
+		 * and `m` cases.
+		 *
+		 * Then, the common `fprintf()` below will also give us
+		 * a `--cfg CONFIG_X="y"` or `--cfg CONFIG_X="m"`, which can
+		 * be used as the equivalent of `IS_BUILTIN()`/`IS_MODULE()`.
+		 */
+		fprintf(fp, "--cfg=%s%s\n", CONFIG_, sym->name);
+	}
+
+	fprintf(fp, "--cfg=%s%s=%s\n", CONFIG_, sym->name, escaped);
+
+	free(escaped);
+}
+
 /*
  * Write out a minimal config.
  * All values that has default values are skipped as this is redundant.
@@ -1129,6 +1165,12 @@ int conf_write_autoconf(int overwrite)
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

