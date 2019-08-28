Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1CD9F879
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 04:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfH1C6S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Aug 2019 22:58:18 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:23781 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbfH1C6S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 22:58:18 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x7S2wANV016624;
        Wed, 28 Aug 2019 11:58:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x7S2wANV016624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566961092;
        bh=mFHsEzwB4oWOXBHmgeLVqODXLT7BOd0irzx8s7TXEyg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J7wcNIqR0iChGHGKviSAJbwDFUw1A4+GmfZWoj7h92vKagxrjBbOsmYMhoPH1yXL6
         w4pjh1LNROd1Lu6VipxBuDfvaKD6ngM4zNCaqQv8t5h25FNuJysqjKkarA+gOTCS8i
         2dG+MD+Wc3cBUd0stwk0Q7suwnyfGyRWQHW+wImaWfIKmdIFG/PJQoSiYTXyFe/cST
         qynux6JT4pAbvQts+abkl0ayN0dHFlmE90lil3e7fWSdQa3x4Z7JRilkzcZpswAHSg
         nukuYhk3lLzn6w8I5xW/KDEcAQnRnKVblpWk13hDmQej6BxnYSLg7xQp4Y0/QO89fI
         PjFdatCs16Wfw==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id b20so895323vso.1;
        Tue, 27 Aug 2019 19:58:11 -0700 (PDT)
X-Gm-Message-State: APjAAAWlGaRzUH3cSLqqycL0A+DQWJEVRdbNvDwayNHKPJsZdYoIJCTT
        //DuUo6zWaVIye+xFBZ8ukp0/Hk9chGe43jwZz0=
X-Google-Smtp-Source: APXvYqx6drAO5VNEZonnNYeGy9NH4k3kBr70fIT0ItBVqaeLU6B/YCT3sh1pBnPM+sgD47uB8cjkfLMm4IuUVx0QUEQ=
X-Received: by 2002:a05:6102:20c3:: with SMTP id i3mr1099865vsr.155.1566961090274;
 Tue, 27 Aug 2019 19:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190827103621.1073-1-yamada.masahiro@socionext.com>
 <20190827192811.GA24626@archlinux-threadripper> <CAKwvOd=7Jf13PDC9Q1FMhZUJQsq7Ggn=wRz5xpRY0YrU6tP9Kw@mail.gmail.com>
 <20190827213447.GA26954@archlinux-threadripper> <CAKwvOd=pQm7ytZSJeRzXoWwzouDADOYkO8S_+zSPtXOAO3Jc5g@mail.gmail.com>
In-Reply-To: <CAKwvOd=pQm7ytZSJeRzXoWwzouDADOYkO8S_+zSPtXOAO3Jc5g@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 28 Aug 2019 11:57:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARduZNvwQ2AJbP3NNDojM+1AACx=wRqdRz+DRSCuVMK2w@mail.gmail.com>
Message-ID: <CAK7LNARduZNvwQ2AJbP3NNDojM+1AACx=wRqdRz+DRSCuVMK2w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick, Nathan,

On Wed, Aug 28, 2019 at 6:56 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Aug 27, 2019 at 2:34 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Tue, Aug 27, 2019 at 01:58:05PM -0700, Nick Desaulniers wrote:
> > > On Tue, Aug 27, 2019 at 12:28 PM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > >
> > > > On Tue, Aug 27, 2019 at 07:36:21PM +0900, Masahiro Yamada wrote:
> > > > > GCC and Clang have different policy for -Wunused-function; GCC never
> > > > > reports unused-function warnings for 'static inline' functions whereas
> > > > > Clang reports them if they are defined in source files instead of
> > > > > included headers although it has been suppressed since commit
> > > > > abb2ea7dfd82 ("compiler, clang: suppress warning for unused static
> > > > > inline functions").
> > > > >
> > > > > We often miss to remove unused functions where 'static inline' is used
> > > > > in .c files since there is no tool to detect them. Unused code remains
> > > > > until somebody notices. For example, commit 075ddd75680f ("regulator:
> > > > > core: remove unused rdev_get_supply()").
> > > > >
> > > > > Let's remove __maybe_unused from the inline macro to allow Clang to
> > > > > start finding unused static inline functions. As always, it is not a
> > > > > good idea to sprinkle warnings for the normal build, so I added
> > > > > -Wno-unsued-function for no W= build.
> > >
> > > s/unsued/unused/
> > >
> > > > >
> > > > > Per the documentation [1], -Wno-unused-function will also disable
> > > > > -Wunneeded-internal-declaration, which can help find bugs like
> > > > > commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> > > > > mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> > > > > I added -Wunneeded-internal-declaration to address it.
> > > > >
> > > > > If you contribute to code clean-up, please run "make CC=clang W=1"
> > > > > and check -Wunused-function warnings. You will find lots of unused
> > > > > functions.
> > > > >
> > > > > Some of them are false-positives because the call-sites are disabled
> > > > > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > > > > unused-function warnings because it is intended to be a hint for the
> > > > > compiler's optimization. I prefer __maybe_unused or #ifdef around the
> > > > > definition.
> > >
> > > I'd say __maybe_unused for function parameters that are used depending
> > > of ifdefs in the body of the function, otherwise strictly ifdefs.
> > >
> > > > >
> > > > > [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function
> > > > >
> > > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > >
> > > > I am still not a big fan of this as I think it weakens clang as a
> > > > standalone compiler but the change itself looks good so if it is going
> > > > in anyways:
> > > >
> > > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > >
> > > > I'm sure Nick would like to weigh in as well before this gets merged.
> > >
> > > So right away for an x86_64 defconfig w/ this patch, clang points out:
> > >
> > > drivers/gpu/drm/i915/i915_sw_fence.c:84:20: warning: unused function
> > > 'debug_fence_init_onstack' [-Wunused-function]
> > > static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
> > >                    ^
> > > drivers/gpu/drm/i915/i915_sw_fence.c:105:20: warning: unused function
> > > 'debug_fence_free' [-Wunused-function]
> > > static inline void debug_fence_free(struct i915_sw_fence *fence)
> > >                    ^
> > >
> > > The first looks fishy (grep -r debug_fence_init_onstack), the second
> > > only has a callsite ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS.
> > >
> > > drivers/gpu/drm/i915/intel_guc_submission.c:1117:20: warning: unused
> > > function 'ctx_save_restore_disabled' [-Wunused-function]
> > > static inline bool ctx_save_restore_disabled(struct intel_context *ce)
> > >                    ^
> > > drivers/gpu/drm/i915/display/intel_hdmi.c:1696:26: warning: unused
> > > function 'intel_hdmi_hdcp2_protocol' [-Wunused-function]
> > > enum hdcp_wired_protocol intel_hdmi_hdcp2_protocol(void)
> > >                          ^
> > > arm64 defconfig builds cleanly, same with arm.  Things might get more
> > > hairy with all{yes|mod}config, but the existing things it finds don't
> > > look insurmountable to me.  In fact, I'll file bugs in our issue
> > > tracker (https://github.com/ClangBuiltLinux/linux/issues) for the
> > > above.
> > >
> > > So I'm not certain this patch weakens existing checks.
> >
> > Well, we no longer get -Wunused-function warnings without W=1.
> > Sometimes, that warning is just a result of missed clean up but there
> > have been instances where it was a real bug:
> >
> > https://lore.kernel.org/lkml/20190523010235.GA105588@archlinux-epyc/
> >
> > https://lore.kernel.org/lkml/1558574945-19275-1-git-send-email-skomatineni@nvidia.com/
> >
> > Having warnings not be equal between compilers out of the box causes
> > confusion and irritation: https://crbug.com/974884
> >
> > Is not the objective of ClangBuiltLinux to rely on GCC less?
> >
> > The only reason that we see the warnings crop up in i915 is because
> > they add -Wall after all of the warnings get disabled (i.e.
> > -Wno-unused-function -Wall so -Wunused-function gets enabled again).
> >
> > To get these warnings after this patch, W=1 has to be used and that
> > results in a lot of extra warnings. x86_64 defconfig has one objtool
> > warning right now, W=1 adds plenty more (from both -W flags and lack of
> > kerneldoc annotations):
> >
> > https://gist.github.com/175afbca29ead14bd039ad46f4ab0ded
> >
> > This is just food for thought though.
>
> So if we took just the hunk against include/linux/compiler_types.h
> from this patch, we'd be back in a situation pre-commit-abb2ea7dfd82
> ("compiler, clang: suppress warning for unused static inline
> functions").  Hmm...
>
> I would like to minimize the number of Clang specific warnings that
> are disabled in scripts/Makefile.extrawarn.

I agree.

I do not want to carry this forever.

After we clean up the warnings (it may take several development cycles),
I want to turn on Wunused-function for all the build mode.



> Masahiro, does your patch correctly make -Wunused-function work for
> clang at W=1?  It looks like -Wunused gets added to warning-1, but
> then -Wno-unused-function gets added to KBUILD_CFLAGS after `warning`
> does.  Will that work correctly?  I'd imagine that at W=1,
> KBUILD_CFLAGS for clang will look like:
> ... -Wunused -Wno-unused-function ...
> which is probably not what we want?

Hmm?

-Wunused is added only when W=1.

-Wno-unused-function is added only when W= was not passed.

They do not happen at the same time.









> --
> Thanks,
> ~Nick Desaulniers



--
Best Regards
Masahiro Yamada
