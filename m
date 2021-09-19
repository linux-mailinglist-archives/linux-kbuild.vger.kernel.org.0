Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44E4410C5D
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Sep 2021 18:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbhISQi4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Sep 2021 12:38:56 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:36800 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229437AbhISQi4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Sep 2021 12:38:56 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R301e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04407;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0Uot2tLe_1632069438;
Received: from localhost(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0Uot2tLe_1632069438)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 20 Sep 2021 00:37:25 +0800
From:   Dan Li <ashimida@linux.alibaba.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net,
        keescook@chromium.org, nathan@kernel.org, ndesaulniers@google.com,
        akpm@linux-foundation.org, tglx@linutronix.de,
        peterz@infradead.org, samitolvanen@google.com, frederic@kernel.org,
        rppt@kernel.org, yifeifz2@illinois.edu, viresh.kumar@linaro.org,
        colin.king@canonical.com, andreyknvl@gmail.com,
        mark.rutland@arm.com, ojeda@kernel.org, will@kernel.org,
        ardb@kernel.org, luc.vanoostenryck@gmail.com, elver@google.com,
        nivedita@alum.mit.edu
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Dan Li <ashimida@linux.alibaba.com>
Subject: [PATCH] [RFC/RFT]SCS:Add gcc plugin to support Shadow Call Stack
Date:   Mon, 20 Sep 2021 00:37:16 +0800
Message-Id: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The Clang-based shadow call stack protection has been integrated into the
mainline, but kernel compiled by gcc cannot enable this feature for now.

This Patch supports gcc-based SCS protection by adding a plugin.

For each function that x30 will be pushed onto the stack during execution,
this plugin:
1) insert "str x30, [x18], #8" at the entry of the function to save x30
   to current SCS
2) insert "ldr x30, [x18, #-8]!"  before the exit of this function to
   restore x30

At present, this patch has been successfully compiled(based on defconfig)
in the following gcc versions(if plugin is supported) and startup normally:
* 6.3.1
* 7.3.1
* 7.5.0
* 8.2.1
* 9.2.0
* 10.3.1

with commands:
make ARCH=arm64 defconfig
./scripts/config -e CONFIG_GCC_PLUGINS -e CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK
make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

---
FYI:
1) The function can be used to test whether the shadow stack is effective:
//noinline void __noscs scs_test(void)
noinline void scs_test(void)
{
    register unsigned long *sp asm("sp");
    unsigned long * lr = sp + 1;

    asm volatile("":::"x30");
    *lr = 0;
}

ffff800010012670 <scs_test>:
ffff800010012670:       f800865e        str     x30, [x18], #8
ffff800010012674:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
ffff800010012678:       910003fd        mov     x29, sp
ffff80001001267c:       f90007ff        str     xzr, [sp, #8]
ffff800010012680:       a8c17bfd        ldp     x29, x30, [sp], #16
ffff800010012684:       f85f8e5e        ldr     x30, [x18, #-8]!
ffff800010012688:       d65f03c0        ret

If SCS protection is enabled, this function will return normally.
If the function has __noscs attribute (scs disabled), it will crash due to 0
address access.

2) Other tests are in progress ...

Signed-off-by: Dan Li <ashimida@linux.alibaba.com>
---
 Makefile                               |   2 +-
 arch/Kconfig                           |   2 +-
 include/linux/compiler-gcc.h           |   4 +
 scripts/Makefile.gcc-plugins           |   4 +
 scripts/gcc-plugins/Kconfig            |   8 ++
 scripts/gcc-plugins/arm64_scs_plugin.c | 256 +++++++++++++++++++++++++++++++++
 6 files changed, 274 insertions(+), 2 deletions(-)
 create mode 100644 scripts/gcc-plugins/arm64_scs_plugin.c

diff --git a/Makefile b/Makefile
index 61741e9..0f0121a 100644
--- a/Makefile
+++ b/Makefile
@@ -924,7 +924,7 @@ LDFLAGS_vmlinux += --gc-sections
 endif
 
 ifdef CONFIG_SHADOW_CALL_STACK
-CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
+CC_FLAGS_SCS	:= $(if $(CONFIG_CC_IS_CLANG),-fsanitize=shadow-call-stack,)
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
 export CC_FLAGS_SCS
 endif
diff --git a/arch/Kconfig b/arch/Kconfig
index 98db634..81ff127 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -594,7 +594,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
 
 config SHADOW_CALL_STACK
 	bool "Clang Shadow Call Stack"
-	depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
+	depends on (CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK) || GCC_PLUGIN_SHADOW_CALL_STACK
 	depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
 	help
 	  This option enables Clang's Shadow Call Stack, which uses a
diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index cb9217f..426c8e5 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -50,6 +50,10 @@
 #define __latent_entropy __attribute__((latent_entropy))
 #endif
 
+#if defined(SHADOW_CALL_STACK_PLUGIN) && !defined(__CHECKER__)
+#define __noscs __attribute__((no_shadow_call_stack))
+#endif
+
 /*
  * calling noreturn functions, __builtin_unreachable() and __builtin_trap()
  * confuse the stack allocation in gcc, leading to overly large stack
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 952e468..eeaf2c6 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -46,6 +46,10 @@ ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
 endif
 export DISABLE_ARM_SSP_PER_TASK_PLUGIN
 
+gcc-plugin-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK) += arm64_scs_plugin.so
+gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK)	\
+		+= -DSHADOW_CALL_STACK_PLUGIN
+
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
 GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index ab9eb4c..2534195e 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -19,6 +19,14 @@ menuconfig GCC_PLUGINS
 
 if GCC_PLUGINS
 
+config GCC_PLUGIN_SHADOW_CALL_STACK
+	bool "GCC Shadow Call Stack plugin"
+	select SHADOW_CALL_STACK
+	help
+	  This plugin is used to support the kernel CONFIG_SHADOW_CALL_STACK
+	  compiled by gcc. Its principle is basically the same as that of CLANG.
+	  For more information, please refer to "config SHADOW_CALL_STACK"
+
 config GCC_PLUGIN_CYC_COMPLEXITY
 	bool "Compute the cyclomatic complexity of a function" if EXPERT
 	depends on !COMPILE_TEST	# too noisy
diff --git a/scripts/gcc-plugins/arm64_scs_plugin.c b/scripts/gcc-plugins/arm64_scs_plugin.c
new file mode 100644
index 0000000..c5a66140
--- /dev/null
+++ b/scripts/gcc-plugins/arm64_scs_plugin.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "gcc-common.h"
+
+#define v_info(fmt, ...)							\
+	do {									\
+		if (verbose)							\
+			fprintf(stderr, "[SCS]: " fmt,  ## __VA_ARGS__);	\
+	} while (0)
+
+#define NOSCS_ATTR_STR  "no_shadow_call_stack"
+#define SCS_ASM_PUSH_STR "str x30, [x18], #8\n\t"
+#define SCS_ASM_POP_STR  "ldr x30, [x18, #-8]!\n\t"
+
+__visible int plugin_is_GPL_compatible;
+
+static struct plugin_info arm64_scs_plugin_info = {
+	.version	= "20210926vanilla",
+	.help		= "disable\tdo not activate plugin\n"
+			  "verbose\tprint all debug infos\n",
+};
+
+static bool verbose;
+
+static rtx gen_scs_push(location_t loc)
+{
+	rtx insn = gen_rtx_ASM_INPUT_loc(VOIDmode, ggc_strdup(SCS_ASM_PUSH_STR), loc);
+
+	MEM_VOLATILE_P(insn) = 1;
+	return insn;
+}
+
+static rtx gen_scs_pop(location_t loc)
+{
+	rtx insn = gen_rtx_ASM_INPUT_loc(VOIDmode, ggc_strdup(SCS_ASM_POP_STR), loc);
+
+	MEM_VOLATILE_P(insn) = 1;
+	return insn;
+}
+
+static bool arm64_scs_gate(void)
+{
+	bool is_ignored;
+
+#if BUILDING_GCC_VERSION >= 8002
+	is_ignored = !cfun->machine->frame.emit_frame_chain;
+#else
+	is_ignored = !frame_pointer_needed;
+#endif
+
+	/* No need to insert protection code into functions that do not push LR into stack */
+	if (is_ignored) {
+		v_info("No protection code inserted into func:%s in file:%s\n",
+			get_name(current_function_decl), main_input_filename);
+		return 0;
+	}
+
+	gcc_assert(cfun->machine->frame.wb_candidate2 == R30_REGNUM);
+
+	/* Don't insert protection code into functions with NOSCS_ATTR_STR attribute */
+	if (lookup_attribute(NOSCS_ATTR_STR, DECL_ATTRIBUTES(current_function_decl))) {
+		v_info("No protection code inserted into %s func:%s in file:%s\n", NOSCS_ATTR_STR,
+				get_name(current_function_decl), main_input_filename);
+		return 0;
+	}
+	return 1;
+}
+
+enum scs_state {
+	/* The first valid instruction has not been found in the current instruction sequence */
+	SCS_SEARCHING_FIRST_INSN,
+	/* Currently searching for the return rtx instruction in this function */
+	SCS_SEARCHING_FUNC_RETURN,
+	/* Found an EPILOGUE_BEGIN before the function return instruction */
+	SCS_FOUND_ONE_EPILOGUE_NOTE,
+};
+
+static unsigned int arm64_scs_execute(void)
+{
+	rtx_insn *insn;
+	enum scs_state state = SCS_SEARCHING_FIRST_INSN;
+
+	for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
+		rtx mark = NULL;
+
+		switch (GET_CODE(insn)) {
+		case NOTE:
+		case BARRIER:
+		case CODE_LABEL:
+		case INSN:
+		case DEBUG_INSN:
+		case JUMP_INSN:
+		case JUMP_TABLE_DATA:
+			break;
+		case CALL_INSN:
+			if (SIBLING_CALL_P(insn)) {
+				error(G_("Sibling call found in func:%s, file:%s\n"),
+						get_name(current_function_decl),
+						main_input_filename);
+				gcc_unreachable();
+			}
+			break;
+		default:
+			error(G_("Invalid rtx_insn seqs found with type:%s in func:%s, file:%s\n"),
+					GET_RTX_NAME(GET_CODE(insn)),
+					get_name(current_function_decl), main_input_filename);
+			gcc_unreachable();
+			break;
+		}
+
+		if (state == SCS_SEARCHING_FIRST_INSN) {
+			/* A function that needs to be instrumented should not found epilogue
+			 * before its first insn
+			 */
+			gcc_assert(!(NOTE_P(insn) && (NOTE_KIND(insn) == NOTE_INSN_EPILOGUE_BEG)));
+
+			if (NOTE_P(insn) || INSN_DELETED_P(insn))
+				continue;
+
+			state = SCS_SEARCHING_FUNC_RETURN;
+
+			/* Insert scs pop before the first instruction found */
+			mark = gen_scs_push(RESERVED_LOCATION_COUNT);
+			emit_insn_before(mark, insn);
+		}
+
+		/* Find the corresponding epilogue before 'RETURN' instruction (if any) */
+		if (state == SCS_SEARCHING_FUNC_RETURN) {
+			if (NOTE_P(insn) && (NOTE_KIND(insn) == NOTE_INSN_EPILOGUE_BEG)) {
+				state = SCS_FOUND_ONE_EPILOGUE_NOTE;
+				continue;
+			}
+		}
+
+		if (!JUMP_P(insn))
+			continue;
+
+		/* A function return insn was found */
+		if (ANY_RETURN_P(PATTERN(insn))) {
+			/* There should be an epilogue before 'RETURN' inst */
+			if (GET_CODE(PATTERN(insn)) == RETURN) {
+				gcc_assert(state == SCS_FOUND_ONE_EPILOGUE_NOTE);
+				state = SCS_SEARCHING_FUNC_RETURN;
+			}
+
+			/* There is no epilogue before 'SIMPLE_RETURN' insn */
+			if (GET_CODE(PATTERN(insn)) == SIMPLE_RETURN)
+				gcc_assert(state == SCS_SEARCHING_FUNC_RETURN);
+
+			/* Insert scs pop instruction(s) before return insn */
+			mark = gen_scs_pop(RESERVED_LOCATION_COUNT);
+			emit_insn_before(mark, insn);
+		}
+	}
+	return 0;
+}
+
+static tree handle_noscs_attribute(tree *node, tree name, tree args __unused, int flags,
+		bool *no_add_attrs)
+{
+	*no_add_attrs = true;
+
+	gcc_assert(DECL_P(*node));
+	switch (TREE_CODE(*node)) {
+	default:
+		error(G_("%qE attribute can be applies to function decl only (%qE)"), name, *node);
+		gcc_unreachable();
+
+	case FUNCTION_DECL:	/* the attribute is only used for function declarations */
+		break;
+	}
+
+	*no_add_attrs = false;
+	return NULL_TREE;
+}
+
+static struct attribute_spec noscs_attr = {};
+
+static void scs_register_attributes(void *event_data __unused, void *data __unused)
+{
+	noscs_attr.name	= NOSCS_ATTR_STR;
+	noscs_attr.decl_required = true;
+	noscs_attr.handler = handle_noscs_attribute;
+	register_attribute(&noscs_attr);
+}
+
+static void (*old_override_options_after_change)(void);
+
+static void scs_override_options_after_change(void)
+{
+	if (old_override_options_after_change)
+		old_override_options_after_change();
+
+	flag_optimize_sibling_calls = 0;
+}
+
+static void callback_before_start_unit(void *gcc_data __unused, void *user_data __unused)
+{
+	/* Turn off sibling call to avoid inserting duplicate scs pop codes */
+	old_override_options_after_change = targetm.override_options_after_change;
+	targetm.override_options_after_change = scs_override_options_after_change;
+
+	flag_optimize_sibling_calls = 0;
+}
+
+#define PASS_NAME arm64_scs
+#define TODO_FLAGS_FINISH (TODO_dump_func | TODO_verify_rtl_sharing)
+#include "gcc-generate-rtl-pass.h"
+
+__visible int plugin_init(struct plugin_name_args *plugin_info, struct plugin_gcc_version *version)
+{
+	int i;
+	const char * const plugin_name = plugin_info->base_name;
+	const int argc = plugin_info->argc;
+	const struct plugin_argument * const argv = plugin_info->argv;
+	bool enable = true;
+
+	PASS_INFO(arm64_scs, "shorten", 1, PASS_POS_INSERT_BEFORE);
+
+	if (!plugin_default_version_check(version, &gcc_version)) {
+		error(G_("Incompatible gcc/plugin versions"));
+		return 1;
+	}
+
+	if (strncmp(lang_hooks.name, "GNU C", 5) && !strncmp(lang_hooks.name, "GNU C+", 6)) {
+		inform(UNKNOWN_LOCATION, G_("%s supports C only, not %s"), plugin_name,
+				lang_hooks.name);
+		enable = false;
+	}
+
+	for (i = 0; i < argc; ++i) {
+		if (!strcmp(argv[i].key, "disable")) {
+			enable = false;
+			continue;
+		}
+		if (!strcmp(argv[i].key, "verbose")) {
+			verbose = true;
+			continue;
+		}
+		error(G_("unknown option '-fplugin-arg-%s-%s'"), plugin_name, argv[i].key);
+	}
+
+	register_callback(plugin_name, PLUGIN_INFO, NULL, &arm64_scs_plugin_info);
+
+	register_callback(plugin_name, PLUGIN_ATTRIBUTES, scs_register_attributes, NULL);
+
+	if (!enable) {
+		v_info("Plugin disabled for file:%s\n", main_input_filename);
+		return 0;
+	}
+
+	register_callback(plugin_name, PLUGIN_START_UNIT, callback_before_start_unit, NULL);
+
+	register_callback(plugin_name, PLUGIN_PASS_MANAGER_SETUP, NULL, &arm64_scs_pass_info);
+
+	return 0;
+}
-- 
2.7.4

