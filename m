Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AAC1410FF6
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Sep 2021 09:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbhITHU1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Sep 2021 03:20:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:49448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233135AbhITHU1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Sep 2021 03:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C78461107;
        Mon, 20 Sep 2021 07:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632122340;
        bh=vQCF18pgufjlU2YjZhBX75Dd8k9bJvrrNH8u32H2noY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jF+w21fKC/gTs4usrUvSr1ZMwFv/i2YwH8N/gUmhzMYIp2YTmfNbMLPgCjFfjKxnq
         DRqVwDSaDAOIsIBba6asBWJdTzl7u2QYcE6I7upMCcahHlW9StYdlMzUz3ritoVm5C
         jRc2ghk9fZFobwvJJhrjC5lyaJdYlsZ/XaQ9n+FZrNAKNyLgQA5MxNy8HB4BJV4ZgA
         bNxS6JbS2OTflyNQLw3eErIZkvUfUi5ot2E1cIJ4o5MFM7bBVrP1QWVVLkVGsDr6qe
         Z2GZTbBZOSWyEZZgXopg/MqKqY3oafTtAqjExQeWXXxKT0jNd7BggUQjO75AdIL+8C
         nWacF+mZQjw3Q==
Received: by mail-oi1-f171.google.com with SMTP id p2so23600366oif.1;
        Mon, 20 Sep 2021 00:19:00 -0700 (PDT)
X-Gm-Message-State: AOAM531Dq47kEOzX+E69qJoZgPG0Sjy2DkvvR9ICtPjRMsrczjhl+2qT
        lxSrx+UHiCutxweJjFt7TeWWp01N2EHBI3P7gqM=
X-Google-Smtp-Source: ABdhPJyu2+bX7NS94buZjhE0P+4K0/rYUNJfXAezKf5JLooVtCG4a1gP7R9jO0YYBGyOrsjS9Ih1s1+hNIqS2a7sjI4=
X-Received: by 2002:a05:6808:15a2:: with SMTP id t34mr20968961oiw.47.1632122339704;
 Mon, 20 Sep 2021 00:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
In-Reply-To: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 20 Sep 2021 09:18:47 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGQ+x243wK-8NP+kxs2dCgSa+MD5+Tv3Xzo3510Td1t3Q@mail.gmail.com>
Message-ID: <CAMj1kXGQ+x243wK-8NP+kxs2dCgSa+MD5+Tv3Xzo3510Td1t3Q@mail.gmail.com>
Subject: Re: [PATCH] [RFC/RFT]SCS:Add gcc plugin to support Shadow Call Stack
To:     Dan Li <ashimida@linux.alibaba.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        YiFei Zhu <yifeifz2@illinois.edu>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Colin King <colin.king@canonical.com>, andreyknvl@gmail.com,
        Mark Rutland <mark.rutland@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
        luc.vanoostenryck@gmail.com, Marco Elver <elver@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Dan,

On Sun, 19 Sept 2021 at 18:37, Dan Li <ashimida@linux.alibaba.com> wrote:
>
> The Clang-based shadow call stack protection has been integrated into the
> mainline, but kernel compiled by gcc cannot enable this feature for now.
>
> This Patch supports gcc-based SCS protection by adding a plugin.
>

Thanks for working on this. I had a stab at this myself about 2 years
ago and couldn't make it work.

> For each function that x30 will be pushed onto the stack during execution,
> this plugin:
> 1) insert "str x30, [x18], #8" at the entry of the function to save x30
>    to current SCS
> 2) insert "ldr x30, [x18, #-8]!"  before the exit of this function to
>    restore x30
>

This logic seems sound to me, but it would be nice if someone more
familiar with Clang's implementation could confirm that it is really
this simple.

Looking at your plugin, there is an issue with tail calls, and I don't
think Clang simply disables those altogether as well, right?

> At present, this patch has been successfully compiled(based on defconfig)
> in the following gcc versions(if plugin is supported) and startup normally:
> * 6.3.1
> * 7.3.1
> * 7.5.0
> * 8.2.1
> * 9.2.0
> * 10.3.1
>
> with commands:
> make ARCH=arm64 defconfig
> ./scripts/config -e CONFIG_GCC_PLUGINS -e CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>
> ---
> FYI:
> 1) The function can be used to test whether the shadow stack is effective:
> //noinline void __noscs scs_test(void)
> noinline void scs_test(void)
> {
>     register unsigned long *sp asm("sp");
>     unsigned long * lr = sp + 1;
>
>     asm volatile("":::"x30");
>     *lr = 0;
> }
>
> ffff800010012670 <scs_test>:
> ffff800010012670:       f800865e        str     x30, [x18], #8
> ffff800010012674:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
> ffff800010012678:       910003fd        mov     x29, sp
> ffff80001001267c:       f90007ff        str     xzr, [sp, #8]
> ffff800010012680:       a8c17bfd        ldp     x29, x30, [sp], #16
> ffff800010012684:       f85f8e5e        ldr     x30, [x18, #-8]!
> ffff800010012688:       d65f03c0        ret
>
> If SCS protection is enabled, this function will return normally.
> If the function has __noscs attribute (scs disabled), it will crash due to 0
> address access.
>
> 2) Other tests are in progress ...
>
> Signed-off-by: Dan Li <ashimida@linux.alibaba.com>
> ---
>  Makefile                               |   2 +-
>  arch/Kconfig                           |   2 +-
>  include/linux/compiler-gcc.h           |   4 +
>  scripts/Makefile.gcc-plugins           |   4 +
>  scripts/gcc-plugins/Kconfig            |   8 ++
>  scripts/gcc-plugins/arm64_scs_plugin.c | 256 +++++++++++++++++++++++++++++++++
>  6 files changed, 274 insertions(+), 2 deletions(-)
>  create mode 100644 scripts/gcc-plugins/arm64_scs_plugin.c
>
> diff --git a/Makefile b/Makefile
> index 61741e9..0f0121a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -924,7 +924,7 @@ LDFLAGS_vmlinux += --gc-sections
>  endif
>
>  ifdef CONFIG_SHADOW_CALL_STACK
> -CC_FLAGS_SCS   := -fsanitize=shadow-call-stack
> +CC_FLAGS_SCS   := $(if $(CONFIG_CC_IS_CLANG),-fsanitize=shadow-call-stack,)

This variable should contain whatever needs to be added to the
compiler comamand line
>  KBUILD_CFLAGS  += $(CC_FLAGS_SCS)
>  export CC_FLAGS_SCS
>  endif
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 98db634..81ff127 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -594,7 +594,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
>
>  config SHADOW_CALL_STACK
>         bool "Clang Shadow Call Stack"
> -       depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
> +       depends on (CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK) || GCC_PLUGIN_SHADOW_CALL_STACK

This logic needs to be defined in such a way that a builtin
implementation provided by GCC will take precedence once it becomes
available.

>         depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
>         help
>           This option enables Clang's Shadow Call Stack, which uses a
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index cb9217f..426c8e5 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -50,6 +50,10 @@
>  #define __latent_entropy __attribute__((latent_entropy))
>  #endif
>
> +#if defined(SHADOW_CALL_STACK_PLUGIN) && !defined(__CHECKER__)
> +#define __noscs __attribute__((no_shadow_call_stack))
> +#endif
> +

>  /*
>   * calling noreturn functions, __builtin_unreachable() and __builtin_trap()
>   * confuse the stack allocation in gcc, leading to overly large stack
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 952e468..eeaf2c6 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -46,6 +46,10 @@ ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
>  endif
>  export DISABLE_ARM_SSP_PER_TASK_PLUGIN
>
> +gcc-plugin-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK) += arm64_scs_plugin.so
> +gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK)       \
> +               += -DSHADOW_CALL_STACK_PLUGIN
> +
>  # All the plugin CFLAGS are collected here in case a build target needs to
>  # filter them out of the KBUILD_CFLAGS.
>  GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index ab9eb4c..2534195e 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -19,6 +19,14 @@ menuconfig GCC_PLUGINS
>
>  if GCC_PLUGINS
>
> +config GCC_PLUGIN_SHADOW_CALL_STACK
> +       bool "GCC Shadow Call Stack plugin"
> +       select SHADOW_CALL_STACK

You shouldn't 'select' something like this if the symbol has its own
dependencies which may be unsatisfied, as this causes a Kconfig
warning. Also, en/disabling shadow call stacks for the architecture
should be done from the arch's 'kernel features' menu, it shouldn't be
buried in the GCC plugins menu.

> +       help
> +         This plugin is used to support the kernel CONFIG_SHADOW_CALL_STACK
> +         compiled by gcc. Its principle is basically the same as that of CLANG.
> +         For more information, please refer to "config SHADOW_CALL_STACK"
> +
>  config GCC_PLUGIN_CYC_COMPLEXITY
>         bool "Compute the cyclomatic complexity of a function" if EXPERT
>         depends on !COMPILE_TEST        # too noisy
> diff --git a/scripts/gcc-plugins/arm64_scs_plugin.c b/scripts/gcc-plugins/arm64_scs_plugin.c
> new file mode 100644
> index 0000000..c5a66140
> --- /dev/null
> +++ b/scripts/gcc-plugins/arm64_scs_plugin.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include "gcc-common.h"
> +
> +#define v_info(fmt, ...)                                                       \
> +       do {                                                                    \
> +               if (verbose)                                                    \
> +                       fprintf(stderr, "[SCS]: " fmt,  ## __VA_ARGS__);        \
> +       } while (0)
> +
> +#define NOSCS_ATTR_STR  "no_shadow_call_stack"
> +#define SCS_ASM_PUSH_STR "str x30, [x18], #8\n\t"
> +#define SCS_ASM_POP_STR  "ldr x30, [x18, #-8]!\n\t"
> +
> +__visible int plugin_is_GPL_compatible;
> +
> +static struct plugin_info arm64_scs_plugin_info = {
> +       .version        = "20210926vanilla",

I will respond to this obvious invitation at bikeshedding by saying
that 'salted caramel' is clearly the superior flavor of ice cream.

> +       .help           = "disable\tdo not activate plugin\n"
> +                         "verbose\tprint all debug infos\n",
> +};
> +
> +static bool verbose;
> +
> +static rtx gen_scs_push(location_t loc)
> +{
> +       rtx insn = gen_rtx_ASM_INPUT_loc(VOIDmode, ggc_strdup(SCS_ASM_PUSH_STR), loc);
> +
> +       MEM_VOLATILE_P(insn) = 1;
> +       return insn;
> +}
> +
> +static rtx gen_scs_pop(location_t loc)
> +{
> +       rtx insn = gen_rtx_ASM_INPUT_loc(VOIDmode, ggc_strdup(SCS_ASM_POP_STR), loc);
> +
> +       MEM_VOLATILE_P(insn) = 1;
> +       return insn;
> +}
> +
> +static bool arm64_scs_gate(void)
> +{
> +       bool is_ignored;
> +
> +#if BUILDING_GCC_VERSION >= 8002
> +       is_ignored = !cfun->machine->frame.emit_frame_chain;
> +#else
> +       is_ignored = !frame_pointer_needed;
> +#endif
> +
> +       /* No need to insert protection code into functions that do not push LR into stack */
> +       if (is_ignored) {
> +               v_info("No protection code inserted into func:%s in file:%s\n",
> +                       get_name(current_function_decl), main_input_filename);
> +               return 0;
> +       }
> +
> +       gcc_assert(cfun->machine->frame.wb_candidate2 == R30_REGNUM);
> +
> +       /* Don't insert protection code into functions with NOSCS_ATTR_STR attribute */
> +       if (lookup_attribute(NOSCS_ATTR_STR, DECL_ATTRIBUTES(current_function_decl))) {
> +               v_info("No protection code inserted into %s func:%s in file:%s\n", NOSCS_ATTR_STR,
> +                               get_name(current_function_decl), main_input_filename);
> +               return 0;
> +       }
> +       return 1;
> +}
> +
> +enum scs_state {
> +       /* The first valid instruction has not been found in the current instruction sequence */
> +       SCS_SEARCHING_FIRST_INSN,
> +       /* Currently searching for the return rtx instruction in this function */
> +       SCS_SEARCHING_FUNC_RETURN,
> +       /* Found an EPILOGUE_BEGIN before the function return instruction */
> +       SCS_FOUND_ONE_EPILOGUE_NOTE,
> +};
> +
> +static unsigned int arm64_scs_execute(void)
> +{
> +       rtx_insn *insn;
> +       enum scs_state state = SCS_SEARCHING_FIRST_INSN;
> +
> +       for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
> +               rtx mark = NULL;
> +
> +               switch (GET_CODE(insn)) {
> +               case NOTE:
> +               case BARRIER:
> +               case CODE_LABEL:
> +               case INSN:
> +               case DEBUG_INSN:
> +               case JUMP_INSN:
> +               case JUMP_TABLE_DATA:
> +                       break;
> +               case CALL_INSN:
> +                       if (SIBLING_CALL_P(insn)) {
> +                               error(G_("Sibling call found in func:%s, file:%s\n"),
> +                                               get_name(current_function_decl),
> +                                               main_input_filename);
> +                               gcc_unreachable();
> +                       }

Sibling calls are an important optimization, not only for performance
but also for stack utilization, so this needs to be fixed. Can you
elaborate on the issue you are working around here?

> +                       break;
> +               default:
> +                       error(G_("Invalid rtx_insn seqs found with type:%s in func:%s, file:%s\n"),
> +                                       GET_RTX_NAME(GET_CODE(insn)),
> +                                       get_name(current_function_decl), main_input_filename);
> +                       gcc_unreachable();
> +                       break;
> +               }
> +
> +               if (state == SCS_SEARCHING_FIRST_INSN) {
> +                       /* A function that needs to be instrumented should not found epilogue
> +                        * before its first insn
> +                        */
> +                       gcc_assert(!(NOTE_P(insn) && (NOTE_KIND(insn) == NOTE_INSN_EPILOGUE_BEG)));
> +
> +                       if (NOTE_P(insn) || INSN_DELETED_P(insn))
> +                               continue;
> +
> +                       state = SCS_SEARCHING_FUNC_RETURN;
> +
> +                       /* Insert scs pop before the first instruction found */
> +                       mark = gen_scs_push(RESERVED_LOCATION_COUNT);
> +                       emit_insn_before(mark, insn);
> +               }
> +
> +               /* Find the corresponding epilogue before 'RETURN' instruction (if any) */
> +               if (state == SCS_SEARCHING_FUNC_RETURN) {
> +                       if (NOTE_P(insn) && (NOTE_KIND(insn) == NOTE_INSN_EPILOGUE_BEG)) {
> +                               state = SCS_FOUND_ONE_EPILOGUE_NOTE;
> +                               continue;
> +                       }
> +               }
> +
> +               if (!JUMP_P(insn))
> +                       continue;
> +
> +               /* A function return insn was found */
> +               if (ANY_RETURN_P(PATTERN(insn))) {
> +                       /* There should be an epilogue before 'RETURN' inst */
> +                       if (GET_CODE(PATTERN(insn)) == RETURN) {
> +                               gcc_assert(state == SCS_FOUND_ONE_EPILOGUE_NOTE);
> +                               state = SCS_SEARCHING_FUNC_RETURN;
> +                       }
> +
> +                       /* There is no epilogue before 'SIMPLE_RETURN' insn */
> +                       if (GET_CODE(PATTERN(insn)) == SIMPLE_RETURN)
> +                               gcc_assert(state == SCS_SEARCHING_FUNC_RETURN);

These assert()s will crash the compiler if the RTL doesn't have quite
the right structure, correct? Could we issue a warning instead, saying
function 'x' could not be handled, and back out gracefully (i.e.,
don't insert the push either)?

> +
> +                       /* Insert scs pop instruction(s) before return insn */
> +                       mark = gen_scs_pop(RESERVED_LOCATION_COUNT);
> +                       emit_insn_before(mark, insn);
> +               }
> +       }
> +       return 0;
> +}
> +
> +static tree handle_noscs_attribute(tree *node, tree name, tree args __unused, int flags,
> +               bool *no_add_attrs)
> +{
> +       *no_add_attrs = true;
> +
> +       gcc_assert(DECL_P(*node));
> +       switch (TREE_CODE(*node)) {
> +       default:
> +               error(G_("%qE attribute can be applies to function decl only (%qE)"), name, *node);
> +               gcc_unreachable();
> +
> +       case FUNCTION_DECL:     /* the attribute is only used for function declarations */
> +               break;
> +       }
> +
> +       *no_add_attrs = false;

I'm not familiar with this idiom: what is the purpose of setting this
to true initially and then to false again when the expected flow
through the function is to do nothing at all?

> +       return NULL_TREE;
> +}
> +
> +static struct attribute_spec noscs_attr = {};
> +
> +static void scs_register_attributes(void *event_data __unused, void *data __unused)
> +{
> +       noscs_attr.name = NOSCS_ATTR_STR;
> +       noscs_attr.decl_required = true;
> +       noscs_attr.handler = handle_noscs_attribute;
> +       register_attribute(&noscs_attr);
> +}
> +
> +static void (*old_override_options_after_change)(void);
> +
> +static void scs_override_options_after_change(void)
> +{
> +       if (old_override_options_after_change)
> +               old_override_options_after_change();
> +
> +       flag_optimize_sibling_calls = 0;
> +}
> +
> +static void callback_before_start_unit(void *gcc_data __unused, void *user_data __unused)
> +{
> +       /* Turn off sibling call to avoid inserting duplicate scs pop codes */

Sibling calls will restore x30 before the calk, right? So where do the
duplicate pops come from?

> +       old_override_options_after_change = targetm.override_options_after_change;
> +       targetm.override_options_after_change = scs_override_options_after_change;
> +
> +       flag_optimize_sibling_calls = 0;

Do we need this twice?

> +}
> +
> +#define PASS_NAME arm64_scs
> +#define TODO_FLAGS_FINISH (TODO_dump_func | TODO_verify_rtl_sharing)
> +#include "gcc-generate-rtl-pass.h"
> +
> +__visible int plugin_init(struct plugin_name_args *plugin_info, struct plugin_gcc_version *version)
> +{
> +       int i;
> +       const char * const plugin_name = plugin_info->base_name;
> +       const int argc = plugin_info->argc;
> +       const struct plugin_argument * const argv = plugin_info->argv;
> +       bool enable = true;
> +
> +       PASS_INFO(arm64_scs, "shorten", 1, PASS_POS_INSERT_BEFORE);
> +
> +       if (!plugin_default_version_check(version, &gcc_version)) {
> +               error(G_("Incompatible gcc/plugin versions"));
> +               return 1;
> +       }
> +
> +       if (strncmp(lang_hooks.name, "GNU C", 5) && !strncmp(lang_hooks.name, "GNU C+", 6)) {
> +               inform(UNKNOWN_LOCATION, G_("%s supports C only, not %s"), plugin_name,
> +                               lang_hooks.name);
> +               enable = false;
> +       }
> +

Do we need this check?

> +       for (i = 0; i < argc; ++i) {
> +               if (!strcmp(argv[i].key, "disable")) {
> +                       enable = false;
> +                       continue;
> +               }
> +               if (!strcmp(argv[i].key, "verbose")) {
> +                       verbose = true;
> +                       continue;
> +               }
> +               error(G_("unknown option '-fplugin-arg-%s-%s'"), plugin_name, argv[i].key);
> +       }
> +
> +       register_callback(plugin_name, PLUGIN_INFO, NULL, &arm64_scs_plugin_info);
> +
> +       register_callback(plugin_name, PLUGIN_ATTRIBUTES, scs_register_attributes, NULL);
> +
> +       if (!enable) {
> +               v_info("Plugin disabled for file:%s\n", main_input_filename);
> +               return 0;
> +       }
> +
> +       register_callback(plugin_name, PLUGIN_START_UNIT, callback_before_start_unit, NULL);
> +
> +       register_callback(plugin_name, PLUGIN_PASS_MANAGER_SETUP, NULL, &arm64_scs_pass_info);
> +
> +       return 0;
> +}
> --
> 2.7.4
>
