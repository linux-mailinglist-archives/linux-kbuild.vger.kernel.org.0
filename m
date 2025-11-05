Return-Path: <linux-kbuild+bounces-9411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE45FC34958
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 09:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBAB81920FAC
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 08:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095FD2DC784;
	Wed,  5 Nov 2025 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="LhiWe1iH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22AB2DAFA2;
	Wed,  5 Nov 2025 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332541; cv=pass; b=Daj28slTYCvAohSsAx6XBpae+MgHtAabptk6jHr6udG/n5kJKKuvUppxLJAzu/WYHLV41E5SNO+bF9Y7cFEiVBROVl5JtosnjVLnoPPm6UGg9qI1wCxE5QbTncn8Uu7r30CcGQ3CB/tUCqAfXjjOrBBYMFYnCkkMgdCQZ6JY4xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332541; c=relaxed/simple;
	bh=wbWnCuLLFunM/BcVHsHqiaYuD22oodG7ikx24LFExSA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvtT3XcJ7FwdKjBRrH8um+tn9WePoGP8m/fW/E+vicl66HHWMuBqSr8Y7d0KBFaE07rVbOPMbxwXjMq15Bx6fFX5b+4kUVUYMjVSGW1lPeAdsE4f5NHPLSvbCRKcin7tELGfwrMA9ZNJDNJIRogy9n3iOqWhlk8BO9NyzKJBYeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=LhiWe1iH; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762332479; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bnp/x3Bnx2tfQ12gosAfIGyvlK/fp5ySj61E0ulg2gV6IAd+1nhocRYzr2lIFScNVvs4waUL48Iqirdsj1g3w9jSLJbDF0QxopRNAwE1pUFlH8CiVLWRA1gtHhQ6wRBcf2CLyKkTfEdvqtHjlZoZhByXtn9ck0ykXUB/bqR/hKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762332479; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=u7P1xZCfbI58utps+NHX5kY2NHdA4BoKURJk9ZAJrv8=; 
	b=VDOQLPyjWRZzh09riFmUDbx2wRGHv6rfYeUMeMbGob5h1TSTd4Jjmry+5VXM9vxyDSh7dyyiukDAWSOP1R65/wF7GxbDAKt0Musoj5+f4z0e2pdRMpcFpuer7sAIQx4CqZUho1ME7QM+4JxbrBgYA5glFZZRhpmmFpGCT2La9Gw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762332479;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=u7P1xZCfbI58utps+NHX5kY2NHdA4BoKURJk9ZAJrv8=;
	b=LhiWe1iHdlnG1+6rSiFkVBQMSQOS17/SqWEEufWnVdnjRWIsABDr/KkrQ0oc7Wpk
	JpdlrJOtaeFTo1SCG+jnhWD77OjOMDKblAqKD0H+HSC9A74gWfEpofKSJu4/JGyxa+c
	RYKsZE1rl5l6FKEFORdobrqS6pmooNjd4ij0WyEk=
Received: by mx.zohomail.com with SMTPS id 1762332478016960.3898176076386;
	Wed, 5 Nov 2025 00:47:58 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 1/2] gcc-plugins: add cleanup_plugin for uninitialized cleanup detection
Date: Wed,  5 Nov 2025 16:46:56 +0800
Message-ID: <20251105084733.3598704-6-me@linux.beauty>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105084733.3598704-1-me@linux.beauty>
References: <20251105084733.3598704-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

Add a GCC plugin to warn about uninitialized automatic variables with
cleanup attributes. This helps catch this potential interdependency problem
as documented in include/linux/cleanup.h.

The plugin detects uninitialized cleanup variables and warns developers
without blocking builds (warnings are not converted to errors by -Werror).

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 scripts/Makefile.gcc-plugins         |   1 +
 scripts/gcc-plugins/Kconfig          |   6 ++
 scripts/gcc-plugins/cleanup_plugin.c | 106 +++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 scripts/gcc-plugins/cleanup_plugin.c

diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index b0e1423b09c21..b948261c142e6 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+gcc-plugin-$(CONFIG_GCC_PLUGIN_CLEANUP_ATTRIBUTE_WARN) += cleanup_plugin.so
 gcc-plugin-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)	+= latent_entropy_plugin.so
 gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_LATENT_ENTROPY)		\
 		+= -DLATENT_ENTROPY_PLUGIN
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index 6b34ba19358d8..906d50eb5efa6 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -36,4 +36,10 @@ config GCC_PLUGIN_LATENT_ENTROPY
 	   * https://grsecurity.net/
 	   * https://pax.grsecurity.net/
 
+config GCC_PLUGIN_CLEANUP_ATTRIBUTE_WARN
+	def_bool y
+	help
+	  Warn when local automatic variables annotated with
+	  __attribute__((cleanup(...))) are declared without an initializer.
+
 endif
diff --git a/scripts/gcc-plugins/cleanup_plugin.c b/scripts/gcc-plugins/cleanup_plugin.c
new file mode 100644
index 0000000000000..d28f8969186de
--- /dev/null
+++ b/scripts/gcc-plugins/cleanup_plugin.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Warn about uninitialized automatic variables that use the
+ * __attribute__((cleanup(...))) attribute.
+ */
+
+#include "gcc-common.h"
+
+__visible int plugin_is_GPL_compatible;
+
+static struct plugin_info cleanup_plugin_info = {
+	.version = PLUGIN_VERSION,
+	.help = "Warn when cleanup attribute variables lack initializers\n",
+};
+
+static bool has_cleanup_attribute(tree var)
+{
+	tree attrs;
+
+	attrs = DECL_ATTRIBUTES(var);
+	if (!attrs)
+		return false;
+
+	return lookup_attribute("cleanup", attrs) != NULL_TREE;
+}
+
+static bool is_candidate_decl(tree var)
+{
+	if (TREE_CODE(var) != VAR_DECL)
+		return false;
+
+	if (DECL_ARTIFICIAL(var))
+		return false;
+
+	if (TREE_STATIC(var) || DECL_EXTERNAL(var))
+		return false;
+
+	if (!has_cleanup_attribute(var))
+		return false;
+
+	return true;
+}
+
+static bool has_declaration_initializer(tree var)
+{
+	if (DECL_INITIAL(var))
+		return true;
+
+#ifdef DECL_INITIALIZED_P
+	if (DECL_INITIALIZED_P(var))
+		return true;
+#endif
+
+	return false;
+}
+
+static void warn_if_uninitialized(tree var)
+{
+	location_t loc;
+	bool saved_warning_as_error;
+
+	if (has_declaration_initializer(var))
+		return;
+
+	loc = DECL_SOURCE_LOCATION(var);
+	if (loc == UNKNOWN_LOCATION)
+		return;
+
+	/* Temporarily disable treating warnings as errors for this specific warning */
+	saved_warning_as_error = global_dc->warning_as_error_requested_p();
+	global_dc->set_warning_as_error_requested(false);
+	warning_at(
+		loc, 0,
+		"%qD declared with cleanup attribute is not initialized at declaration",
+		var);
+	/* Restore the original setting */
+	global_dc->set_warning_as_error_requested(saved_warning_as_error);
+}
+
+static void cleanup_finish_decl(void *gcc_data, void *user_data)
+{
+	tree var = (tree)gcc_data;
+
+	(void)user_data;
+
+	if (!is_candidate_decl(var))
+		return;
+
+	warn_if_uninitialized(var);
+}
+
+__visible int plugin_init(struct plugin_name_args *plugin_info,
+			  struct plugin_gcc_version *version)
+{
+	if (!plugin_default_version_check(version, &gcc_version)) {
+		error(G_("incompatible gcc/plugin versions"));
+		return 1;
+	}
+
+	register_callback(plugin_info->base_name, PLUGIN_INFO, NULL,
+			  &cleanup_plugin_info);
+	register_callback(plugin_info->base_name, PLUGIN_FINISH_DECL,
+			  cleanup_finish_decl, NULL);
+
+	return 0;
+}
-- 
2.51.0


