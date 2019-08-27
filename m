Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 032D09F5AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2019 23:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfH0V4V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Aug 2019 17:56:21 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39596 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfH0V4V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Aug 2019 17:56:21 -0400
Received: by mail-pg1-f196.google.com with SMTP id u17so204779pgi.6
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2019 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cgrXiX6w+iXAJx451uKI5IvGXQ8JzxadwvN8II0tDoE=;
        b=BNoJCtJR9DudUn5uIPXEstToXgIyaeuQKR8gPCMk32BwoLZ3w+Bq0EcyxwGluhWtrT
         N61JFyt/usomSRCx1GADBeEqDWHq4/88rlPVf0x/eDnEyMqIPl1qK1QMTZTjOqCHnkj8
         wrBP1Ly28xFm9WHlxqhpg6fyxD8AZd/D/u10HDmnmv6AwK2q9J2XUEvE50evh7EQQrPA
         M/G5iQ7RCfP1GGZZ8RqvGqroXqBktdOTzIqYem2OOFsiRxSvVdeTXcYliA8oFfi+anav
         khxlF58mako4lJsz7h3+PfJ9K3+IYMqzgxbqEXTpEFPqyUns4uX5xakK00sIZe+S4vaM
         54vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgrXiX6w+iXAJx451uKI5IvGXQ8JzxadwvN8II0tDoE=;
        b=ZetL6AOuKzgJYEskwCYOijTcXjyswBNHv9JtBVlT1SBgFkBiZXI0ZkrqZaMqqOdfsD
         wNozBfwXOaCoD+lhxBYW6eLGdwD5m8rppmb2aUeL4ZGwImwvuKzTBL3tK0iPzxpghjrb
         Drb0Fd0esZBb6zdf2y27NPajG2BFC29djB0Xn8w0a9wcR9xDAi+T9a8sjuC79Y5VblXh
         7DM4bAJ809x26tAR31xm+7SIGaCEDs+lF7DetV3c2V1VQgKcGDtLQYBtz9Tg3dsJO5BT
         gcTveNo7uu4S1LC/WbLJyLRGAMBynBpe87PtwWdBTsZwPTgpiEaM03xozQddOdWzMfB5
         Xh0g==
X-Gm-Message-State: APjAAAU2U13jSdHhbrieBvBeDSW7PQ3vbyUrwEhTARv6cUaDTXOMNRHo
        IKyRsxgl0YwaGyYvNQ2kieIZUxRj/F8E5CZZdjJ1kQ==
X-Google-Smtp-Source: APXvYqyLXu8oCvZW+1b5S65SZDsQkreDEfq4D9XrqvMgvpefkLpjNcNf3isA6dhIzL9TGBYSa1flhyqbql93k4uReWk=
X-Received: by 2002:a65:690b:: with SMTP id s11mr573264pgq.10.1566942980152;
 Tue, 27 Aug 2019 14:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190827103621.1073-1-yamada.masahiro@socionext.com>
 <20190827192811.GA24626@archlinux-threadripper> <CAKwvOd=7Jf13PDC9Q1FMhZUJQsq7Ggn=wRz5xpRY0YrU6tP9Kw@mail.gmail.com>
 <20190827213447.GA26954@archlinux-threadripper>
In-Reply-To: <20190827213447.GA26954@archlinux-threadripper>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 27 Aug 2019 14:56:07 -0700
Message-ID: <CAKwvOd=pQm7ytZSJeRzXoWwzouDADOYkO8S_+zSPtXOAO3Jc5g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: enable unused-function warnings for W= build
 with Clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
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

On Tue, Aug 27, 2019 at 2:34 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Aug 27, 2019 at 01:58:05PM -0700, Nick Desaulniers wrote:
> > On Tue, Aug 27, 2019 at 12:28 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Tue, Aug 27, 2019 at 07:36:21PM +0900, Masahiro Yamada wrote:
> > > > GCC and Clang have different policy for -Wunused-function; GCC never
> > > > reports unused-function warnings for 'static inline' functions whereas
> > > > Clang reports them if they are defined in source files instead of
> > > > included headers although it has been suppressed since commit
> > > > abb2ea7dfd82 ("compiler, clang: suppress warning for unused static
> > > > inline functions").
> > > >
> > > > We often miss to remove unused functions where 'static inline' is used
> > > > in .c files since there is no tool to detect them. Unused code remains
> > > > until somebody notices. For example, commit 075ddd75680f ("regulator:
> > > > core: remove unused rdev_get_supply()").
> > > >
> > > > Let's remove __maybe_unused from the inline macro to allow Clang to
> > > > start finding unused static inline functions. As always, it is not a
> > > > good idea to sprinkle warnings for the normal build, so I added
> > > > -Wno-unsued-function for no W= build.
> >
> > s/unsued/unused/
> >
> > > >
> > > > Per the documentation [1], -Wno-unused-function will also disable
> > > > -Wunneeded-internal-declaration, which can help find bugs like
> > > > commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
> > > > mlxplat_mlxcpld_msn201x_items"). (pointed out by Nathan Chancellor)
> > > > I added -Wunneeded-internal-declaration to address it.
> > > >
> > > > If you contribute to code clean-up, please run "make CC=clang W=1"
> > > > and check -Wunused-function warnings. You will find lots of unused
> > > > functions.
> > > >
> > > > Some of them are false-positives because the call-sites are disabled
> > > > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > > > unused-function warnings because it is intended to be a hint for the
> > > > compiler's optimization. I prefer __maybe_unused or #ifdef around the
> > > > definition.
> >
> > I'd say __maybe_unused for function parameters that are used depending
> > of ifdefs in the body of the function, otherwise strictly ifdefs.
> >
> > > >
> > > > [1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function
> > > >
> > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > >
> > > I am still not a big fan of this as I think it weakens clang as a
> > > standalone compiler but the change itself looks good so if it is going
> > > in anyways:
> > >
> > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > >
> > > I'm sure Nick would like to weigh in as well before this gets merged.
> >
> > So right away for an x86_64 defconfig w/ this patch, clang points out:
> >
> > drivers/gpu/drm/i915/i915_sw_fence.c:84:20: warning: unused function
> > 'debug_fence_init_onstack' [-Wunused-function]
> > static inline void debug_fence_init_onstack(struct i915_sw_fence *fence)
> >                    ^
> > drivers/gpu/drm/i915/i915_sw_fence.c:105:20: warning: unused function
> > 'debug_fence_free' [-Wunused-function]
> > static inline void debug_fence_free(struct i915_sw_fence *fence)
> >                    ^
> >
> > The first looks fishy (grep -r debug_fence_init_onstack), the second
> > only has a callsite ifdef CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS.
> >
> > drivers/gpu/drm/i915/intel_guc_submission.c:1117:20: warning: unused
> > function 'ctx_save_restore_disabled' [-Wunused-function]
> > static inline bool ctx_save_restore_disabled(struct intel_context *ce)
> >                    ^
> > drivers/gpu/drm/i915/display/intel_hdmi.c:1696:26: warning: unused
> > function 'intel_hdmi_hdcp2_protocol' [-Wunused-function]
> > enum hdcp_wired_protocol intel_hdmi_hdcp2_protocol(void)
> >                          ^
> > arm64 defconfig builds cleanly, same with arm.  Things might get more
> > hairy with all{yes|mod}config, but the existing things it finds don't
> > look insurmountable to me.  In fact, I'll file bugs in our issue
> > tracker (https://github.com/ClangBuiltLinux/linux/issues) for the
> > above.
> >
> > So I'm not certain this patch weakens existing checks.
>
> Well, we no longer get -Wunused-function warnings without W=1.
> Sometimes, that warning is just a result of missed clean up but there
> have been instances where it was a real bug:
>
> https://lore.kernel.org/lkml/20190523010235.GA105588@archlinux-epyc/
>
> https://lore.kernel.org/lkml/1558574945-19275-1-git-send-email-skomatineni@nvidia.com/
>
> Having warnings not be equal between compilers out of the box causes
> confusion and irritation: https://crbug.com/974884
>
> Is not the objective of ClangBuiltLinux to rely on GCC less?
>
> The only reason that we see the warnings crop up in i915 is because
> they add -Wall after all of the warnings get disabled (i.e.
> -Wno-unused-function -Wall so -Wunused-function gets enabled again).
>
> To get these warnings after this patch, W=1 has to be used and that
> results in a lot of extra warnings. x86_64 defconfig has one objtool
> warning right now, W=1 adds plenty more (from both -W flags and lack of
> kerneldoc annotations):
>
> https://gist.github.com/175afbca29ead14bd039ad46f4ab0ded
>
> This is just food for thought though.

So if we took just the hunk against include/linux/compiler_types.h
from this patch, we'd be back in a situation pre-commit-abb2ea7dfd82
("compiler, clang: suppress warning for unused static inline
functions").  Hmm...

I would like to minimize the number of Clang specific warnings that
are disabled in scripts/Makefile.extrawarn.

Masahiro, does your patch correctly make -Wunused-function work for
clang at W=1?  It looks like -Wunused gets added to warning-1, but
then -Wno-unused-function gets added to KBUILD_CFLAGS after `warning`
does.  Will that work correctly?  I'd imagine that at W=1,
KBUILD_CFLAGS for clang will look like:
... -Wunused -Wno-unused-function ...
which is probably not what we want?
-- 
Thanks,
~Nick Desaulniers
