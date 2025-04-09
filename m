Return-Path: <linux-kbuild+bounces-6547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DF6A82BF6
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 18:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC29C1889C1D
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 16:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BAF91C84CD;
	Wed,  9 Apr 2025 16:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bg4/ZZlH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA71C4A13;
	Wed,  9 Apr 2025 16:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214658; cv=none; b=Lt3PGvmS1XZJeS+fyeuRSrZ3sdjiHZffgYj3RUhO/MLyp8hA+h23K96frKnR9L2cWsoiWnBfVimAnOcIn9zKa7kVCye4xsZBV7UG18OsjHnuZ+OMy9tODkoyOpEdqMJNu8csqBA7BhQwEIcTUKFw6meWfJS0MYlDnWgj9Zyf4ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214658; c=relaxed/simple;
	bh=TJCANtQVIfo4GCVzWxO30Axf7ECgxM5Mp41y//AoHeg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RWVSUag0PuuSKPRhpNRGduVe+lN410x1ldBaz/kItI3IOg7GlT5M8uVOK7beCPr5hsd3yFrk8OyIpz4r5recxmxQE865VxOLrV1jG7YJkFCKlacAkaDbGwOTGfK4inueTObKSe8sx91F0F4JDaC774YONChlY6iU5WD01yUB/jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bg4/ZZlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68539C4CEE2;
	Wed,  9 Apr 2025 16:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214654;
	bh=TJCANtQVIfo4GCVzWxO30Axf7ECgxM5Mp41y//AoHeg=;
	h=From:To:Cc:Subject:Date:From;
	b=Bg4/ZZlHqXpmWb30IyVW8qT18Fl4GUtB46CH0ejPQ/oVkKccluYHx17Bcb84Be2HZ
	 HXM/wDGSQAkncqtqymcHutro4+DSgDatFmzDAn3hoP/6oDdh+6gUC3Xk2Nznmbxwe/
	 kDegbRDg5th8qDLpyDWbJuKAwTJwJupIj+LX3jWDfxIxCC8G3JgnxUQIaCAkea5UJS
	 eu1zHSFsYwo5Os8EEbjWALokLAFXRzXIFGHxk1zDz5T/VxxNILK3XKj4iEoviSehn4
	 o0aqIA6cRBPWeNznfSxXF6FBe7mf7o1A9cbt/V6kk4kxrUO2by5/WXKeXlqgfiBmPO
	 0w6Nxl89D+ApQ==
From: Kees Cook <kees@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Douglas Anderson <dianders@chromium.org>,
	Russell King <linux@armlinux.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andrew Davis <afd@ti.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Xin Li <xin3.li@intel.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gcc-plugins: Remove ARM_SSP_PER_TASK plugin
Date: Wed,  9 Apr 2025 09:04:10 -0700
Message-Id: <20250409160409.work.168-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6865; i=kees@kernel.org; h=from:subject:message-id; bh=TJCANtQVIfo4GCVzWxO30Axf7ECgxM5Mp41y//AoHeg=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnfZlU5fPV2ecRi2nNrao2GucRnz8q3LlmdtjzV77Q8T l8QWdjZUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCcJOjGBluFVQtesY6K5D19JSN Z412qNX7M8pUFKuvDSsM3KtTfVuN4b+fsuKjB5xRxoFtTHKR9YeD3lx0OHv8L6M3c2nw7hMXb3I CAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of trying to remove GCC plugins from Linux, drop the
ARM_SSP_PER_TASK plugin. The feature is available upstream since GCC
12, so anyone needing newer kernels with per-task ssp can update their
compiler[1].

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/08393aa3-05a3-4e3f-8004-f374a3ec4b7e@app.fastmail.com/ [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Davis <afd@ti.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Xin Li <xin3.li@intel.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-hardening@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
---
 arch/arm/Kconfig                              |   3 +-
 arch/arm/boot/compressed/Makefile             |   2 +-
 scripts/Makefile.gcc-plugins                  |   6 -
 scripts/gcc-plugins/Kconfig                   |   4 -
 scripts/gcc-plugins/arm_ssp_per_task_plugin.c | 107 ------------------
 5 files changed, 2 insertions(+), 120 deletions(-)
 delete mode 100644 scripts/gcc-plugins/arm_ssp_per_task_plugin.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 835b5f100e92..6f037edf0f41 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1379,8 +1379,7 @@ config CC_HAVE_STACKPROTECTOR_TLS
 config STACKPROTECTOR_PER_TASK
 	bool "Use a unique stack canary value for each task"
 	depends on STACKPROTECTOR && CURRENT_POINTER_IN_TPIDRURO && !XIP_DEFLATED_DATA
-	depends on GCC_PLUGINS || CC_HAVE_STACKPROTECTOR_TLS
-	select GCC_PLUGIN_ARM_SSP_PER_TASK if !CC_HAVE_STACKPROTECTOR_TLS
+	depends on CC_HAVE_STACKPROTECTOR_TLS
 	default y
 	help
 	  Due to the fact that GCC uses an ordinary symbol reference from
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 945b5975fce2..d61369b1eabe 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -96,7 +96,7 @@ KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
 	     -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
-	     -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
+	     -I$(obj)
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
 asflags-y := -DZIMAGE
 
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 6da109d563a5..194122d969a8 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -36,12 +36,6 @@ ifdef CONFIG_GCC_PLUGIN_STACKLEAK
 endif
 export DISABLE_STACKLEAK_PLUGIN
 
-gcc-plugin-$(CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK) += arm_ssp_per_task_plugin.so
-ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
-    DISABLE_ARM_SSP_PER_TASK_PLUGIN += -fplugin-arg-arm_ssp_per_task_plugin-disable
-endif
-export DISABLE_ARM_SSP_PER_TASK_PLUGIN
-
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
 GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index ba868d1eef3d..6b34ba19358d 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -36,8 +36,4 @@ config GCC_PLUGIN_LATENT_ENTROPY
 	   * https://grsecurity.net/
 	   * https://pax.grsecurity.net/
 
-config GCC_PLUGIN_ARM_SSP_PER_TASK
-	bool
-	depends on GCC_PLUGINS && ARM
-
 endif
diff --git a/scripts/gcc-plugins/arm_ssp_per_task_plugin.c b/scripts/gcc-plugins/arm_ssp_per_task_plugin.c
deleted file mode 100644
index 7328d037f975..000000000000
--- a/scripts/gcc-plugins/arm_ssp_per_task_plugin.c
+++ /dev/null
@@ -1,107 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-#include "gcc-common.h"
-
-__visible int plugin_is_GPL_compatible;
-
-static unsigned int canary_offset;
-
-static unsigned int arm_pertask_ssp_rtl_execute(void)
-{
-	rtx_insn *insn;
-
-	for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
-		const char *sym;
-		rtx body;
-		rtx current;
-
-		/*
-		 * Find a SET insn involving a SYMBOL_REF to __stack_chk_guard
-		 */
-		if (!INSN_P(insn))
-			continue;
-		body = PATTERN(insn);
-		if (GET_CODE(body) != SET ||
-		    GET_CODE(SET_SRC(body)) != SYMBOL_REF)
-			continue;
-		sym = XSTR(SET_SRC(body), 0);
-		if (strcmp(sym, "__stack_chk_guard"))
-			continue;
-
-		/*
-		 * Replace the source of the SET insn with an expression that
-		 * produces the address of the current task's stack canary value
-		 */
-		current = gen_reg_rtx(Pmode);
-
-		emit_insn_before(gen_load_tp_hard(current), insn);
-
-		SET_SRC(body) = gen_rtx_PLUS(Pmode, current,
-					     GEN_INT(canary_offset));
-	}
-	return 0;
-}
-
-#define PASS_NAME arm_pertask_ssp_rtl
-
-#define NO_GATE
-#include "gcc-generate-rtl-pass.h"
-
-#if BUILDING_GCC_VERSION >= 9000
-static bool no(void)
-{
-	return false;
-}
-
-static void arm_pertask_ssp_start_unit(void *gcc_data, void *user_data)
-{
-	targetm.have_stack_protect_combined_set = no;
-	targetm.have_stack_protect_combined_test = no;
-}
-#endif
-
-__visible int plugin_init(struct plugin_name_args *plugin_info,
-			  struct plugin_gcc_version *version)
-{
-	const char * const plugin_name = plugin_info->base_name;
-	const int argc = plugin_info->argc;
-	const struct plugin_argument *argv = plugin_info->argv;
-	int i;
-
-	if (!plugin_default_version_check(version, &gcc_version)) {
-		error(G_("incompatible gcc/plugin versions"));
-		return 1;
-	}
-
-	for (i = 0; i < argc; ++i) {
-		if (!strcmp(argv[i].key, "disable"))
-			return 0;
-
-		/* all remaining options require a value */
-		if (!argv[i].value) {
-			error(G_("no value supplied for option '-fplugin-arg-%s-%s'"),
-			      plugin_name, argv[i].key);
-			return 1;
-		}
-
-		if (!strcmp(argv[i].key, "offset")) {
-			canary_offset = atoi(argv[i].value);
-			continue;
-		}
-		error(G_("unknown option '-fplugin-arg-%s-%s'"),
-		      plugin_name, argv[i].key);
-		return 1;
-	}
-
-	PASS_INFO(arm_pertask_ssp_rtl, "expand", 1, PASS_POS_INSERT_AFTER);
-
-	register_callback(plugin_info->base_name, PLUGIN_PASS_MANAGER_SETUP,
-			  NULL, &arm_pertask_ssp_rtl_pass_info);
-
-#if BUILDING_GCC_VERSION >= 9000
-	register_callback(plugin_info->base_name, PLUGIN_START_UNIT,
-			  arm_pertask_ssp_start_unit, NULL);
-#endif
-
-	return 0;
-}
-- 
2.34.1


