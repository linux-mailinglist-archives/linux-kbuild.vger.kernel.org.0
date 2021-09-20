Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B97941266A
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Sep 2021 20:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355379AbhITS51 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Sep 2021 14:57:27 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:42771 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1386756AbhITSzU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Sep 2021 14:55:20 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0Up4Ngyt_1632164026;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0Up4Ngyt_1632164026)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 21 Sep 2021 02:53:48 +0800
Subject: Re: [PATCH] [RFC/RFT]SCS:Add gcc plugin to support Shadow Call Stack
To:     Ard Biesheuvel <ardb@kernel.org>
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
References: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
 <CAMj1kXGQ+x243wK-8NP+kxs2dCgSa+MD5+Tv3Xzo3510Td1t3Q@mail.gmail.com>
From:   Dan Li <ashimida@linux.alibaba.com>
Message-ID: <bbe282c6-64f4-cd95-5d64-8266d52ee7a1@linux.alibaba.com>
Date:   Tue, 21 Sep 2021 02:53:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGQ+x243wK-8NP+kxs2dCgSa+MD5+Tv3Xzo3510Td1t3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ard,

Thanks for your comment.

I pasted a copy of the config code in my last email, could you please check it again?

On 9/20/21 3:18 PM, Ard Biesheuvel wrote:
> Hi Dan,
> 
> On Sun, 19 Sept 2021 at 18:37, Dan Li <ashimida@linux.alibaba.com> wrote:
>>
>> The Clang-based shadow call stack protection has been integrated into the
>> mainline, but kernel compiled by gcc cannot enable this feature for now.
>>
>> This Patch supports gcc-based SCS protection by adding a plugin.
>>
> 
> Thanks for working on this. I had a stab at this myself about 2 years
> ago and couldn't make it work.
> 
>> For each function that x30 will be pushed onto the stack during execution,
>> this plugin:
>> 1) insert "str x30, [x18], #8" at the entry of the function to save x30
>>     to current SCS
>> 2) insert "ldr x30, [x18, #-8]!"  before the exit of this function to
>>     restore x30
>>
> 
> This logic seems sound to me, but it would be nice if someone more
> familiar with Clang's implementation could confirm that it is really
> this simple.
> 
> Looking at your plugin, there is an issue with tail calls, and I don't
> think Clang simply disables those altogether as well, right?

I am not familiar with clang's code, the logic comes from clang's description and the
disassembled binary code for now, so it may be different from the actual situation.

The tail call could be handled (theoretically), and I will try to solve the issue in
the next version.
> 
>>   ifdef CONFIG_SHADOW_CALL_STACK
>> -CC_FLAGS_SCS   := -fsanitize=shadow-call-stack
>> +CC_FLAGS_SCS   := $(if $(CONFIG_CC_IS_CLANG),-fsanitize=shadow-call-stack,)
> 
> This variable should contain whatever needs to be added to the
> compiler comamand line
   In the new code, an 'enable' option is added here to enable the plugin
>>   KBUILD_CFLAGS  += $(CC_FLAGS_SCS)
>>   export CC_FLAGS_SCS
>>   endif
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index 98db634..81ff127 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -594,7 +594,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
>>
>>   config SHADOW_CALL_STACK
>>          bool "Clang Shadow Call Stack"
>> -       depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
>> +       depends on (CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK) || GCC_PLUGIN_SHADOW_CALL_STACK
> 
> This logic needs to be defined in such a way that a builtin
> implementation provided by GCC will take precedence once it becomes
> available.
> 
   In new code, if gcc supports SCS in the future, the plugin will be closed due to
   CC_HAVE_SHADOW_CALL_STACK is true.
>>          depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
>>          help
>>            This option enables Clang's Shadow Call Stack, which uses a
>> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
>> index ab9eb4c..2534195e 100644
>> --- a/scripts/gcc-plugins/Kconfig
>> +++ b/scripts/gcc-plugins/Kconfig
>> @@ -19,6 +19,14 @@ menuconfig GCC_PLUGINS
>>
>>   if GCC_PLUGINS
>>
>> +config GCC_PLUGIN_SHADOW_CALL_STACK
>> +       bool "GCC Shadow Call Stack plugin"
>> +       select SHADOW_CALL_STACK
> 
> You shouldn't 'select' something like this if the symbol has its own
> dependencies which may be unsatisfied, as this causes a Kconfig
> warning. Also, en/disabling shadow call stacks for the architecture
> should be done from the arch's 'kernel features' menu, it shouldn't be
> buried in the GCC plugins menu.
    I removed 'select' in the new version.
    SCS's enable is changed to rely on CONFIG_SHADOW_CALL_STACK in arch/kernel,
    the GCC_PLUGIN_SHADOW_CALL_STACK config is just to add a usable platform to it.
>> +       help
>> +         This plugin is used to support the kernel CONFIG_SHADOW_CALL_STACK
>> +         compiled by gcc. Its principle is basically the same as that of CLANG.
>> +         For more information, please refer to "config SHADOW_CALL_STACK"
>> +
>> +__visible int plugin_is_GPL_compatible;
>> +
>> +static struct plugin_info arm64_scs_plugin_info = {
>> +       .version        = "20210926vanilla",
> 
> I will respond to this obvious invitation at bikeshedding by saying
> that 'salted caramel' is clearly the superior flavor of ice cream.
   I'm sorry, as a non-native English speaker, I think I might not understand
   what you mean here. My intention is to say that this is the first/initial
   version, do I miss something?
>> +       .help           = "disable\tdo not activate plugin\n"
>> +                         "verbose\tprint all debug infos\n",
>> +};
>> +static unsigned int arm64_scs_execute(void)
>> +{
>> +       rtx_insn *insn;
>> +       enum scs_state state = SCS_SEARCHING_FIRST_INSN;
>> +
>> +       for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
>> +               rtx mark = NULL;
>> +
>> +               switch (GET_CODE(insn)) {
>> +               case NOTE:
>> +               case BARRIER:
>> +               case CODE_LABEL:
>> +               case INSN:
>> +               case DEBUG_INSN:
>> +               case JUMP_INSN:
>> +               case JUMP_TABLE_DATA:
>> +                       break;
>> +               case CALL_INSN:
>> +                       if (SIBLING_CALL_P(insn)) {
>> +                               error(G_("Sibling call found in func:%s, file:%s\n"),
>> +                                               get_name(current_function_decl),
>> +                                               main_input_filename);
>> +                               gcc_unreachable();
>> +                       }
> 
> Sibling calls are an important optimization, not only for performance
> but also for stack utilization, so this needs to be fixed. Can you
> elaborate on the issue you are working around here?
>
   Since the ARM64 has disabled sibling calls (-fno-optimize-sibling-calls) by default,
   there is almost no sibling call appear in the kernel I encountered.
   So I did not provide support for it, and I will fix this issue in the next version.
>> +                       break;
>> +               default:
>> +                       error(G_("Invalid rtx_insn seqs found with type:%s in func:%s, file:%s\n"),
>> +                                       GET_RTX_NAME(GET_CODE(insn)),
>> +                                       get_name(current_function_decl), main_input_filename);
>> +                       gcc_unreachable();
>> +                       break;
>> +               }
>> +               /* A function return insn was found */
>> +               if (ANY_RETURN_P(PATTERN(insn))) {
>> +                       /* There should be an epilogue before 'RETURN' inst */
>> +                       if (GET_CODE(PATTERN(insn)) == RETURN) {
>> +                               gcc_assert(state == SCS_FOUND_ONE_EPILOGUE_NOTE);
>> +                               state = SCS_SEARCHING_FUNC_RETURN;
>> +                       }
>> +
>> +                       /* There is no epilogue before 'SIMPLE_RETURN' insn */
>> +                       if (GET_CODE(PATTERN(insn)) == SIMPLE_RETURN)
>> +                               gcc_assert(state == SCS_SEARCHING_FUNC_RETURN);
> 
> These assert()s will crash the compiler if the RTL doesn't have quite
> the right structure, correct? Could we issue a warning instead, saying
> function 'x' could not be handled, and back out gracefully (i.e.,
> don't insert the push either)?
> 
    Sure, I think I need to dynamically mark all instrumented positions here,
    and then confirm that the instruction sequence is correct before inserting in batches.
>> +
>> +                       /* Insert scs pop instruction(s) before return insn */
>> +                       mark = gen_scs_pop(RESERVED_LOCATION_COUNT);
>> +                       emit_insn_before(mark, insn);
>> +               }
>> +       }
>> +       return 0;
>> +}
>> +
>> +static tree handle_noscs_attribute(tree *node, tree name, tree args __unused, int flags,
>> +               bool *no_add_attrs)
>> +{
>> +       *no_add_attrs = true;
>> +
>> +       gcc_assert(DECL_P(*node));
>> +       switch (TREE_CODE(*node)) {
>> +       default:
>> +               error(G_("%qE attribute can be applies to function decl only (%qE)"), name, *node);
>> +               gcc_unreachable();
>> +
>> +       case FUNCTION_DECL:     /* the attribute is only used for function declarations */
>> +               break;
>> +       }
>> +
>> +       *no_add_attrs = false;
> 
> I'm not familiar with this idiom: what is the purpose of setting this
> to true initially and then to false again when the expected flow
> through the function is to do nothing at all?
> 
    This is my mistake, at the beginning default case only return 0 directly after a warning;
    At that time, if *no_add_attrs is true, the corresponding attribute will not be added to 'node',
    and it means __noscs attribute can only be added for FUNCTION_DECL.
    For now, *no_add_attrs = true; is useless, it should be deleted.

    But if, as you said, try to back out gracefully, is it better to report warning in the default case?
>> +       return NULL_TREE;
>> +}
>> +
>> +static void (*old_override_options_after_change)(void);
>> +
>> +static void scs_override_options_after_change(void)
>> +{
>> +       if (old_override_options_after_change)
>> +               old_override_options_after_change();
>> +
>> +       flag_optimize_sibling_calls = 0;
>> +}
>> +
>> +static void callback_before_start_unit(void *gcc_data __unused, void *user_data __unused)
>> +{
>> +       /* Turn off sibling call to avoid inserting duplicate scs pop codes */
> 
> Sibling calls will restore x30 before the calk, right? So where do the
> duplicate pops come from?
    a sibling call could be like:
    stp     x29, x30, [sp, #-xx]!
    .......
    ldp     x29, x30, [sp], #xx
    ---> p1
    b       callee
    ldp     x29, x30, [sp], #xx
    ---> p2
    ret
    
    What i mean here is if we need to insert, the scs pop code should be insert in both p1/p2,
> 
>> +       old_override_options_after_change = targetm.override_options_after_change;
>> +       targetm.override_options_after_change = scs_override_options_after_change;
>> +
>> +       flag_optimize_sibling_calls = 0;
> 
> Do we need this twice?
   I think so, there are functions similar to push/pop in gcc (cl_optimization_restore/save)
   * callback_before_start_unit is used to set zero during initialization
   * scs_override_options_after_change is used to reset to 0 after a 'push' occurs
>> +}
>> +
>> +#define PASS_NAME arm64_scs
>> +#define TODO_FLAGS_FINISH (TODO_dump_func | TODO_verify_rtl_sharing)
>> +#include "gcc-generate-rtl-pass.h"
>> +
>> +__visible int plugin_init(struct plugin_name_args *plugin_info, struct plugin_gcc_version *version)
>> +{
>> +       int i;
>> +       const char * const plugin_name = plugin_info->base_name;
>> +       const int argc = plugin_info->argc;
>> +       const struct plugin_argument * const argv = plugin_info->argv;
>> +       bool enable = true;
>> +
>> +       PASS_INFO(arm64_scs, "shorten", 1, PASS_POS_INSERT_BEFORE);
>> +
>> +       if (!plugin_default_version_check(version, &gcc_version)) {
>> +               error(G_("Incompatible gcc/plugin versions"));
>> +               return 1;
>> +       }
>> +
>> +       if (strncmp(lang_hooks.name, "GNU C", 5) && !strncmp(lang_hooks.name, "GNU C+", 6)) {
>> +               inform(UNKNOWN_LOCATION, G_("%s supports C only, not %s"), plugin_name,
>> +                               lang_hooks.name);
>> +               enable = false;
>> +       }
>> +
> 
> Do we need this check?
   This code is copied from structleak_plugin.c, I misunderstood the meaning here, and I will delete it later
> 
>> +       for (i = 0; i < argc; ++i) {
>> +               if (!strcmp(argv[i].key, "disable")) {
>> +                       enable = false;
>> +                       continue;
>> +               }
>> +               if (!strcmp(argv[i].key, "verbose")) {
>> +                       verbose = true;
>> +                       continue;
>> +               }
>> +               error(G_("unknown option '-fplugin-arg-%s-%s'"), plugin_name, argv[i].key);
>> +       }
>> +
>> +       register_callback(plugin_name, PLUGIN_INFO, NULL, &arm64_scs_plugin_info);
>> +
>> +       register_callback(plugin_name, PLUGIN_ATTRIBUTES, scs_register_attributes, NULL);
>> +
>> +       if (!enable) {
>> +               v_info("Plugin disabled for file:%s\n", main_input_filename);
>> +               return 0;
>> +       }
>> +
>> +       register_callback(plugin_name, PLUGIN_START_UNIT, callback_before_start_unit, NULL);
>> +
>> +       register_callback(plugin_name, PLUGIN_PASS_MANAGER_SETUP, NULL, &arm64_scs_pass_info);
>> +
>> +       return 0;
>> +}
>> --
>> 2.7.4
>>
