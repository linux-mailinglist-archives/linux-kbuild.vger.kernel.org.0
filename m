Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F29414B02
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Sep 2021 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhIVNul (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Sep 2021 09:50:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232199AbhIVNuk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Sep 2021 09:50:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC749611CA;
        Wed, 22 Sep 2021 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632318551;
        bh=+QEC1+27fohFwpDuDphJnfN+9PiD2mxb99GrjHageNk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SO5BYFUinzedn0zXA+fMQxDJGEyj9BdJyuLMYg+nv66d8PQqhq18a3MIvHPOe34HP
         ecbcnAa8ufIrI1rVrCKXPWg8yGQ+rAzNBIFbC/vPwzMFfExigjmAN1KYL+bdrMJ7NS
         4P9Swu4O9RrS838+YkSrkA0zDkCJ3+G5AEe2Kk9y5HbbKPV4hq11jlB5Pj6FFYaKlG
         bEKVVlxS7tYHUAJiBKyg7Q/sD4inc4yzydkSaxkK8WjZoASSuyOy4NUUk32KYaSce0
         IJAlQwNNw9QpsuoWAdzqUrhz2l6DDpav/UU1V/fJWgb1RO2XpBMZ8quUszQ4+DtcK5
         KYRr5GhgfIwqw==
Received: by mail-oo1-f45.google.com with SMTP id i26-20020a4ad09a000000b002a9d58c24f5so952992oor.0;
        Wed, 22 Sep 2021 06:49:10 -0700 (PDT)
X-Gm-Message-State: AOAM530VeLfF3E9Xupjr8amwxrPf1mXu/do3NQtgK/7AXpf0Kt6pVITZ
        1v99+JEp+defE94AVO9a8aN9S7zJxGGOryN2CQk=
X-Google-Smtp-Source: ABdhPJzM+cL8tce9ouiZPtrKvrsK1eIHdD3WNmv/bXwX+TJSH4Vn6UrRawp/ORnEjfml+WWeMGHZ12YHbFWRyRyj3ns=
X-Received: by 2002:a4a:11c6:: with SMTP id 189mr47213ooc.32.1632318550159;
 Wed, 22 Sep 2021 06:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
 <CAMj1kXGQ+x243wK-8NP+kxs2dCgSa+MD5+Tv3Xzo3510Td1t3Q@mail.gmail.com>
 <bbe282c6-64f4-cd95-5d64-8266d52ee7a1@linux.alibaba.com> <CAMj1kXGr7ZzBmr-SrxmBsqWvn+NSPC_VKAr5gqx1WN-91i7wpg@mail.gmail.com>
 <94198e26-2cfd-fdc8-7427-d41437cae964@linux.alibaba.com>
In-Reply-To: <94198e26-2cfd-fdc8-7427-d41437cae964@linux.alibaba.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 22 Sep 2021 15:48:58 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHTksfrmVLyNW6q4aKV0N38KRRx5_9426zpb6MGPNDdKg@mail.gmail.com>
Message-ID: <CAMj1kXHTksfrmVLyNW6q4aKV0N38KRRx5_9426zpb6MGPNDdKg@mail.gmail.com>
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

On Tue, 21 Sept 2021 at 08:00, Dan Li <ashimida@linux.alibaba.com> wrote:
>
>
>
> On 9/21/21 5:22 AM, Ard Biesheuvel wrote:
> > On Mon, 20 Sept 2021 at 20:53, Dan Li <ashimida@linux.alibaba.com> wrote:
> >>
> >> Hi Ard,
> >>
> >> Thanks for your comment.
> >>
> >> I pasted a copy of the config code in my last email, could you please check it again?
> >>
> >> On 9/20/21 3:18 PM, Ard Biesheuvel wrote:
> >>> Hi Dan,
> >>>
> >>> On Sun, 19 Sept 2021 at 18:37, Dan Li <ashimida@linux.alibaba.com> wrote:
> >>>>
> >>>> The Clang-based shadow call stack protection has been integrated into the
> >>>> mainline, but kernel compiled by gcc cannot enable this feature for now.
> >>>>
> >>>> This Patch supports gcc-based SCS protection by adding a plugin.
> >>>>
> >>>
> >>> Thanks for working on this. I had a stab at this myself about 2 years
> >>> ago and couldn't make it work.
> >>>
> >>>> For each function that x30 will be pushed onto the stack during execution,
> >>>> this plugin:
> >>>> 1) insert "str x30, [x18], #8" at the entry of the function to save x30
> >>>>      to current SCS
> >>>> 2) insert "ldr x30, [x18, #-8]!"  before the exit of this function to
> >>>>      restore x30
> >>>>
> >>>
> >>> This logic seems sound to me, but it would be nice if someone more
> >>> familiar with Clang's implementation could confirm that it is really
> >>> this simple.
> >>>
> >>> Looking at your plugin, there is an issue with tail calls, and I don't
> >>> think Clang simply disables those altogether as well, right?
> >>
> >> I am not familiar with clang's code, the logic comes from clang's description and the
> >> disassembled binary code for now, so it may be different from the actual situation.
> >>
> >
> > OK
> >
> >> The tail call could be handled (theoretically), and I will try to solve the issue in
> >> the next version.
> >>>
> >>>>    ifdef CONFIG_SHADOW_CALL_STACK
> >>>> -CC_FLAGS_SCS   := -fsanitize=shadow-call-stack
> >>>> +CC_FLAGS_SCS   := $(if $(CONFIG_CC_IS_CLANG),-fsanitize=shadow-call-stack,)
> >>>
> >>> This variable should contain whatever needs to be added to the
> >>> compiler comamand line
> >>     In the new code, an 'enable' option is added here to enable the plugin
> >>>>    KBUILD_CFLAGS  += $(CC_FLAGS_SCS)
> >>>>    export CC_FLAGS_SCS
> >>>>    endif
> >>>> diff --git a/arch/Kconfig b/arch/Kconfig
> >>>> index 98db634..81ff127 100644
> >>>> --- a/arch/Kconfig
> >>>> +++ b/arch/Kconfig
> >>>> @@ -594,7 +594,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
> >>>>
> >>>>    config SHADOW_CALL_STACK
> >>>>           bool "Clang Shadow Call Stack"
> >>>> -       depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
> >>>> +       depends on (CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK) || GCC_PLUGIN_SHADOW_CALL_STACK
> >>>
> >>> This logic needs to be defined in such a way that a builtin
> >>> implementation provided by GCC will take precedence once it becomes
> >>> available.
> >>>
> >>     In new code, if gcc supports SCS in the future, the plugin will be closed due to
> >>     CC_HAVE_SHADOW_CALL_STACK is true.
> >>>>           depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
> >>>>           help
> >>>>             This option enables Clang's Shadow Call Stack, which uses a
> >>>> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> >>>> index ab9eb4c..2534195e 100644
> >>>> --- a/scripts/gcc-plugins/Kconfig
> >>>> +++ b/scripts/gcc-plugins/Kconfig
> >>>> @@ -19,6 +19,14 @@ menuconfig GCC_PLUGINS
> >>>>
> >>>>    if GCC_PLUGINS
> >>>>
> >>>> +config GCC_PLUGIN_SHADOW_CALL_STACK
> >>>> +       bool "GCC Shadow Call Stack plugin"
> >>>> +       select SHADOW_CALL_STACK
> >>>
> >>> You shouldn't 'select' something like this if the symbol has its own
> >>> dependencies which may be unsatisfied, as this causes a Kconfig
> >>> warning. Also, en/disabling shadow call stacks for the architecture
> >>> should be done from the arch's 'kernel features' menu, it shouldn't be
> >>> buried in the GCC plugins menu.
> >>      I removed 'select' in the new version.
> >>      SCS's enable is changed to rely on CONFIG_SHADOW_CALL_STACK in arch/kernel,
> >>      the GCC_PLUGIN_SHADOW_CALL_STACK config is just to add a usable platform to it.
> >>>> +       help
> >>>> +         This plugin is used to support the kernel CONFIG_SHADOW_CALL_STACK
> >>>> +         compiled by gcc. Its principle is basically the same as that of CLANG.
> >>>> +         For more information, please refer to "config SHADOW_CALL_STACK"
> >>>> +
> >>>> +__visible int plugin_is_GPL_compatible;
> >>>> +
> >>>> +static struct plugin_info arm64_scs_plugin_info = {
> >>>> +       .version        = "20210926vanilla",
> >>>
> >>> I will respond to this obvious invitation at bikeshedding by saying
> >>> that 'salted caramel' is clearly the superior flavor of ice cream.
> >>     I'm sorry, as a non-native English speaker, I think I might not understand
> >>     what you mean here. My intention is to say that this is the first/initial
> >>     version, do I miss something?
> >
> > It was a joke - don't worry about it.
> >
> >>>> +       .help           = "disable\tdo not activate plugin\n"
> >>>> +                         "verbose\tprint all debug infos\n",
> >>>> +};
> >>>> +static unsigned int arm64_scs_execute(void)
> >>>> +{
> >>>> +       rtx_insn *insn;
> >>>> +       enum scs_state state = SCS_SEARCHING_FIRST_INSN;
> >>>> +
> >>>> +       for (insn = get_insns(); insn; insn = NEXT_INSN(insn)) {
> >>>> +               rtx mark = NULL;
> >>>> +
> >>>> +               switch (GET_CODE(insn)) {
> >>>> +               case NOTE:
> >>>> +               case BARRIER:
> >>>> +               case CODE_LABEL:
> >>>> +               case INSN:
> >>>> +               case DEBUG_INSN:
> >>>> +               case JUMP_INSN:
> >>>> +               case JUMP_TABLE_DATA:
> >>>> +                       break;
> >>>> +               case CALL_INSN:
> >>>> +                       if (SIBLING_CALL_P(insn)) {
> >>>> +                               error(G_("Sibling call found in func:%s, file:%s\n"),
> >>>> +                                               get_name(current_function_decl),
> >>>> +                                               main_input_filename);
> >>>> +                               gcc_unreachable();
> >>>> +                       }
> >>>
> >>> Sibling calls are an important optimization, not only for performance
> >>> but also for stack utilization, so this needs to be fixed. Can you
> >>> elaborate on the issue you are working around here?
> >>>
> >>     Since the ARM64 has disabled sibling calls (-fno-optimize-sibling-calls) by default,
> >>     there is almost no sibling call appear in the kernel I encountered.
> >
> > What do you mean this is disabled by default? Is that a compiler
> > setting or a Linux setting?
> It's a linux setting in aarch64 kernel.
>
> In aarch64, since CONFIG_FRAME_POINTER is always selected, -fno-optimize-sibling-calls is
> usually enable by default, and I think sibling calls rarely appear (I only encountered
> it once in my cases from bsp's code):
>
> ./arch/arm64/Kconfig
> config ARM64
> ...
> select FRAME_POINTER
>
> ./Makefile
> ifdef CONFIG_FRAME_POINTER
> KBUILD_CFLAGS   += -fno-omit-frame-pointer -fno-optimize-sibling-calls
> ...
>

Ah good to know. I don't think we should disable this optimization -
we need the frame pointer to unwind the call stack, but that doesn't
mean we should obsess about function calls disappearing from the call
stack because they end in a tail call.

Anyway, I spotted another issue with your code:

0000000000000080 <sysctl_net_exit>:
{
  80:   f800865e        str     x30, [x18], #8
  84:   d503245f        bti     c
  88:   d503233f        paciasp

You cannot put that str at the start of the function like that: the
BTI needs to come first, or you will trigger BTI faults if any of
these functions are called indirectly.

There are other reasons why adding it at the start is a bad idea: we
insert NOPs there for ftrace, for instance, which also should appear
at a fixed offset in the prologue.
