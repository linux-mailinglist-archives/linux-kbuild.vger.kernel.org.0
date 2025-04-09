Return-Path: <linux-kbuild+bounces-6546-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55DFA82BED
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36B76444D00
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 16:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CEC433AD;
	Wed,  9 Apr 2025 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBkFCHrY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637601C57B2;
	Wed,  9 Apr 2025 16:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214591; cv=none; b=Cv+oA2cXkQQ/5VEZWcfYjLaMwFoWfUn9SSmaZI9Hlk10fYKfwzNRsXpUT/Xsldrzx90rO2dh+/Jm2kPY+ofiJRpsSx0+8UQCBdIKdYldf7oODN+lbek9EV1LXUCDWnGOdkS+Gse9/CITzn2zQFsM6MpjdLDis34XiGTzQeUrlLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214591; c=relaxed/simple;
	bh=+ziiKcpq40KHLTKB5D7JfzLNH/xmK8EsYce/6ImmTAs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nSvo5GfBOQ0rOX4C1evoAr2xtKy7SxSguhm9Sl/PYHWHG/C22gczyqmDlDA9i0fanUKrEKV//UuJEeQjBVQEDdUw0PVwTPjHmMgt2YpJ5/yE5MjKaxJZdPWbxNFEWV5bB/w7WaCMBP2G9e74anOvqdwFR8rR0u5gkhdIVxcQsqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBkFCHrY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC1DC4CEE2;
	Wed,  9 Apr 2025 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214591;
	bh=+ziiKcpq40KHLTKB5D7JfzLNH/xmK8EsYce/6ImmTAs=;
	h=From:To:Cc:Subject:Date:From;
	b=SBkFCHrYcg+lu8qabqWZASjcN3aOdqyQkRpNAyG9uF1KJw02tMLtOxPPWpsgfkFM+
	 vQTWjn66IR+27ChEMPd3OjNzEVazfrWtvH/+bd1oFLMQdFD5Nk4OPGdzixjqCAZlsC
	 PbqdIVljXzL+7NqgZqoOgcFHUa5wOD2FJjH42nsRWkbASBegJ0i+pGi1XMlmC1CUO2
	 QchTp4wGxJnwwjOhMkD09ArGURdsky3qwWmJU7F6CLU6cG5hwx5j/Il09hLEZpkfnz
	 ToZnyJigCROhN7GXf0Y03V3MCL6D/qJAYpAbrhi/jifohKOy5PsE+0ph2KpICrQzW1
	 y4aozynH7cYqg==
From: Kees Cook <kees@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] gcc-plugins: Remove SANCOV plugin
Date: Wed,  9 Apr 2025 09:02:56 -0700
Message-Id: <20250409160251.work.914-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7959; i=kees@kernel.org; h=from:subject:message-id; bh=+ziiKcpq40KHLTKB5D7JfzLNH/xmK8EsYce/6ImmTAs=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnfZumvVRVfeZjhfoe+9f43M7rkwuYeDHz90VFA4ngUW 028ddeWjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIlEWDIy/G35sXOHPA+PhRJ/ 0NcgDUkO9zfbRGfx/rd97qGkucVChuGf8rXX3R1L9I8yX4otqVqqM9k9Tm12ifAx2zdO4h8DQu7 wAwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

There are very few users of this plugin[1], and since it's features
are available in GCC 6 and later (and Clang), users can update their
compilers if they need support on newer kernels.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: kasan-dev@googlegroups.com
---
 lib/Kconfig.debug                   |   4 +-
 scripts/Makefile.gcc-plugins        |   2 -
 scripts/Makefile.kcov               |   1 -
 scripts/gcc-plugins/Kconfig         |  10 ---
 scripts/gcc-plugins/sancov_plugin.c | 134 ----------------------------
 5 files changed, 1 insertion(+), 150 deletions(-)
 delete mode 100644 scripts/gcc-plugins/sancov_plugin.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1af972a92d06..e7347419ffc5 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2135,15 +2135,13 @@ config ARCH_HAS_KCOV
 config CC_HAS_SANCOV_TRACE_PC
 	def_bool $(cc-option,-fsanitize-coverage=trace-pc)
 
-
 config KCOV
 	bool "Code coverage for fuzzing"
 	depends on ARCH_HAS_KCOV
-	depends on CC_HAS_SANCOV_TRACE_PC || GCC_PLUGINS
+	depends on CC_HAS_SANCOV_TRACE_PC
 	depends on !ARCH_WANTS_NO_INSTR || HAVE_NOINSTR_HACK || \
 		   GCC_VERSION >= 120000 || CC_IS_CLANG
 	select DEBUG_FS
-	select GCC_PLUGIN_SANCOV if !CC_HAS_SANCOV_TRACE_PC
 	select OBJTOOL if HAVE_NOINSTR_HACK
 	help
 	  KCOV exposes kernel code coverage information in a form suitable
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index e4deaf5fa571..6da109d563a5 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -52,8 +52,6 @@ KBUILD_CFLAGS += $(GCC_PLUGINS_CFLAGS)
 
 # Some plugins are enabled outside of this Makefile, but they still need to
 # be included in GCC_PLUGIN so they can get built.
-gcc-plugin-external-$(CONFIG_GCC_PLUGIN_SANCOV)			\
-	+= sancov_plugin.so
 gcc-plugin-external-$(CONFIG_GCC_PLUGIN_RANDSTRUCT)		\
 	+= randomize_layout_plugin.so
 
diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67e8cfe3474b..67de7942b3e7 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
-kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
 
 export CFLAGS_KCOV := $(kcov-flags-y)
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index e383cda05367..ba868d1eef3d 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -19,16 +19,6 @@ menuconfig GCC_PLUGINS
 
 if GCC_PLUGINS
 
-config GCC_PLUGIN_SANCOV
-	bool
-	# Plugin can be removed once the kernel only supports GCC 6+
-	depends on !CC_HAS_SANCOV_TRACE_PC
-	help
-	  This plugin inserts a __sanitizer_cov_trace_pc() call at the start of
-	  basic blocks. It supports all gcc versions with plugin support (from
-	  gcc-4.5 on). It is based on the commit "Add fuzzing coverage support"
-	  by Dmitry Vyukov <dvyukov@google.com>.
-
 config GCC_PLUGIN_LATENT_ENTROPY
 	bool "Generate some entropy during boot and runtime"
 	help
diff --git a/scripts/gcc-plugins/sancov_plugin.c b/scripts/gcc-plugins/sancov_plugin.c
deleted file mode 100644
index b76cb9c42cec..000000000000
--- a/scripts/gcc-plugins/sancov_plugin.c
+++ /dev/null
@@ -1,134 +0,0 @@
-/*
- * Copyright 2011-2016 by Emese Revfy <re.emese@gmail.com>
- * Licensed under the GPL v2, or (at your option) v3
- *
- * Homepage:
- * https://github.com/ephox-gcc-plugins/sancov
- *
- * This plugin inserts a __sanitizer_cov_trace_pc() call at the start of basic blocks.
- * It supports all gcc versions with plugin support (from gcc-4.5 on).
- * It is based on the commit "Add fuzzing coverage support" by Dmitry Vyukov <dvyukov@google.com>.
- *
- * You can read about it more here:
- *  https://gcc.gnu.org/viewcvs/gcc?limit_changes=0&view=revision&revision=231296
- *  https://lwn.net/Articles/674854/
- *  https://github.com/google/syzkaller
- *  https://lwn.net/Articles/677764/
- *
- * Usage:
- * make run
- */
-
-#include "gcc-common.h"
-
-__visible int plugin_is_GPL_compatible;
-
-tree sancov_fndecl;
-
-static struct plugin_info sancov_plugin_info = {
-	.version	= PLUGIN_VERSION,
-	.help		= "sancov plugin\n",
-};
-
-static unsigned int sancov_execute(void)
-{
-	basic_block bb;
-
-	/* Remove this line when this plugin and kcov will be in the kernel.
-	if (!strcmp(DECL_NAME_POINTER(current_function_decl), DECL_NAME_POINTER(sancov_fndecl)))
-		return 0;
-	*/
-
-	FOR_EACH_BB_FN(bb, cfun) {
-		const_gimple stmt;
-		gcall *gcall;
-		gimple_stmt_iterator gsi = gsi_after_labels(bb);
-
-		if (gsi_end_p(gsi))
-			continue;
-
-		stmt = gsi_stmt(gsi);
-		gcall = as_a_gcall(gimple_build_call(sancov_fndecl, 0));
-		gimple_set_location(gcall, gimple_location(stmt));
-		gsi_insert_before(&gsi, gcall, GSI_SAME_STMT);
-	}
-	return 0;
-}
-
-#define PASS_NAME sancov
-
-#define NO_GATE
-#define TODO_FLAGS_FINISH TODO_dump_func | TODO_verify_stmts | TODO_update_ssa_no_phi | TODO_verify_flow
-
-#include "gcc-generate-gimple-pass.h"
-
-static void sancov_start_unit(void __unused *gcc_data, void __unused *user_data)
-{
-	tree leaf_attr, nothrow_attr;
-	tree BT_FN_VOID = build_function_type_list(void_type_node, NULL_TREE);
-
-	sancov_fndecl = build_fn_decl("__sanitizer_cov_trace_pc", BT_FN_VOID);
-
-	DECL_ASSEMBLER_NAME(sancov_fndecl);
-	TREE_PUBLIC(sancov_fndecl) = 1;
-	DECL_EXTERNAL(sancov_fndecl) = 1;
-	DECL_ARTIFICIAL(sancov_fndecl) = 1;
-	DECL_PRESERVE_P(sancov_fndecl) = 1;
-	DECL_UNINLINABLE(sancov_fndecl) = 1;
-	TREE_USED(sancov_fndecl) = 1;
-
-	nothrow_attr = tree_cons(get_identifier("nothrow"), NULL, NULL);
-	decl_attributes(&sancov_fndecl, nothrow_attr, 0);
-	gcc_assert(TREE_NOTHROW(sancov_fndecl));
-	leaf_attr = tree_cons(get_identifier("leaf"), NULL, NULL);
-	decl_attributes(&sancov_fndecl, leaf_attr, 0);
-}
-
-__visible int plugin_init(struct plugin_name_args *plugin_info, struct plugin_gcc_version *version)
-{
-	int i;
-	const char * const plugin_name = plugin_info->base_name;
-	const int argc = plugin_info->argc;
-	const struct plugin_argument * const argv = plugin_info->argv;
-	bool enable = true;
-
-	static const struct ggc_root_tab gt_ggc_r_gt_sancov[] = {
-		{
-			.base = &sancov_fndecl,
-			.nelt = 1,
-			.stride = sizeof(sancov_fndecl),
-			.cb = &gt_ggc_mx_tree_node,
-			.pchw = &gt_pch_nx_tree_node
-		},
-		LAST_GGC_ROOT_TAB
-	};
-
-	/* BBs can be split afterwards?? */
-	PASS_INFO(sancov, "asan", 0, PASS_POS_INSERT_BEFORE);
-
-	if (!plugin_default_version_check(version, &gcc_version)) {
-		error(G_("incompatible gcc/plugin versions"));
-		return 1;
-	}
-
-	for (i = 0; i < argc; ++i) {
-		if (!strcmp(argv[i].key, "no-sancov")) {
-			enable = false;
-			continue;
-		}
-		error(G_("unknown option '-fplugin-arg-%s-%s'"), plugin_name, argv[i].key);
-	}
-
-	register_callback(plugin_name, PLUGIN_INFO, NULL, &sancov_plugin_info);
-
-	if (!enable)
-		return 0;
-
-#if BUILDING_GCC_VERSION < 6000
-	register_callback(plugin_name, PLUGIN_START_UNIT, &sancov_start_unit, NULL);
-	register_callback(plugin_name, PLUGIN_REGISTER_GGC_ROOTS, NULL, (void *)&gt_ggc_r_gt_sancov);
-	register_callback(plugin_name, PLUGIN_PASS_MANAGER_SETUP, NULL, &sancov_pass_info);
-#endif
-
-	return 0;
-}
-- 
2.34.1


