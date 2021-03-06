Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EAB32F7C5
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Mar 2021 03:22:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhCFCTt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 21:19:49 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46138 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhCFCTe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 21:19:34 -0500
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1262J9K5011968;
        Sat, 6 Mar 2021 11:19:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1262J9K5011968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614997149;
        bh=L3FQe892KYTxx5812Ek7RmQh0GfMG4VfuLgvmQHunsQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Nq2qeuL5M/8H19ZjiSltFknmcluRx5LzAYiuXSQMldauRse81jL47y1pSYA/yOupP
         V6YBKun85vMtz1ckfvFE2+9C0P4jg7CdrIiT40moRfbS2wjg3B+laeIwey6N2WgY+f
         DOQkrhp5QgnB60+C7cssoPaf3J82KPArKIgo2OOhDut1roUeQHB8fp/JcqIBjWPB7K
         8oQ7WwMpNLMQ038K1uBGSu1Y1K+/xiEAEbSDXyaIMyx817ZBJcvkx/tNro3XfyT8qH
         rASbv4UccnQiK+6/j+/ys4kqa+UxDrTppSOjN3O/mre9sefga7ogZmpQcXjtYoc5HQ
         /vpu5drrAW23Q==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id u11so2300882plg.13;
        Fri, 05 Mar 2021 18:19:09 -0800 (PST)
X-Gm-Message-State: AOAM531GqQr7fffrV6oQZnKjMRaYy1zmEDOM9xF7O6kr6Dj0QewkmLiV
        zjktBt7Yi60jg8oHQdMJ9UYvyfVjf2KIp+pfnHY=
X-Google-Smtp-Source: ABdhPJwsTPMJxJ420fM2BEDqqbpXcGnD1P0DbTPxQr1kguPu1yrJbezcmwonjG5+FplvYvT/ahdJE+ug1/iGMzhhqi4=
X-Received: by 2002:a17:902:b088:b029:e5:b645:dcf2 with SMTP id
 p8-20020a170902b088b02900e5b645dcf2mr11295833plr.71.1614997148646; Fri, 05
 Mar 2021 18:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20210304113708.215121-1-masahiroy@kernel.org> <202103041518.22EB819E@keescook>
 <CAHk-=wj6t2i1BgmWP1Zb2WVF3zZzkHvsxsALJk7VpfKm6UgLcw@mail.gmail.com>
 <20210305022500.cyi3cfwgt2t6mona@treble> <20210306012815.nfmquoln65vq6yq7@treble>
In-Reply-To: <20210306012815.nfmquoln65vq6yq7@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Mar 2021 11:18:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR7E4Ud9MPy3q5VOab4EFMumr5GMHqyv=H970+gPTBrFg@mail.gmail.com>
Message-ID: <CAK7LNAR7E4Ud9MPy3q5VOab4EFMumr5GMHqyv=H970+gPTBrFg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rebuild GCC plugins when the compiler is upgraded
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Eigler <fche@redhat.com>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 6, 2021 at 10:28 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Mar 04, 2021 at 08:25:00PM -0600, Josh Poimboeuf wrote:
> > On Thu, Mar 04, 2021 at 03:37:14PM -0800, Linus Torvalds wrote:
> > > On Thu, Mar 4, 2021 at 3:20 PM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > This seems fine to me, but I want to make sure Josh has somewhere to
> > > > actually go with this. Josh, does this get you any closer?
> >
> > No, this doesn't seem to help me at all.
> >
> > > > It sounds like the plugins need to move to another location for
> > > > packaged kernels?
> > >
> > > Well, it might be worth extending the stuff that gets installed with
> > > /lib/modules/<kernel-version>/ with enough information and
> > > infrastruvcture to then build any external modules.
> >
> > The gcc plugins live in scripts/, which get installed by "make
> > modules_install" already.  So the plugins' source and makefiles are in
> > /lib/modules/<kernel-version>/build/scripts/gcc-plugins.
> >
> > So everything needed for building the plugins is already there.  We just
> > need the kernel makefiles to rebuild the plugins locally, when building
> > an external module.
>
> This seems to work with very limited testing...  Based on top of
> Masahiro's recent patch:
>
>   https://lkml.kernel.org/r/CAK7LNARHoTnZ3gAvHgnYB4n-wYuboxC10A6zURh1ODGhxWd2yA@mail.gmail.com




Is this a bad coding contest?

I am not asking you to add ugly ifeq or whatever
hacks to say "this worked for me".

Please feel free to do this in the fedora kernel,
but do not send it to upstream.

Sorry, I really do not want to see hacks like this any more.

Remember, how badly objtool was integrated in the build system,
and you even blocked me from fixing that.







> From: Josh Poimboeuf <jpoimboe@redhat.com>
> Subject: [PATCH] gcc-plugins: Rebuild plugins in external module directory
>
> When building external kernel modules, the build system doesn't require
> the GCC version to match the version used to build the original kernel.
>
> In fact, most distros release the compiler and the kernel in separate
> packages, with separate release cadences.  So it's not uncommon for
> mismatches to occur.
>
> But with GCC plugins enabled, that's no longer allowed:
>
>   cc1: error: incompatible gcc/plugin versions
>   cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so
>
> That error comes from the plugin's call to
> plugin_default_version_check(), which strictly enforces the GCC version.
> The strict check makes sense, because there's nothing to prevent the GCC
> plugin ABI from changing, and it often does.
>
> Since plugins are tightly tied to the compiler version, just rebuild
> them locally in the external module directory, and then use the local
> version in the external module build.
>
> Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> ---
>  Makefile                     | 1 +
>  scripts/Makefile.gcc-plugins | 2 +-
>  scripts/gcc-plugins/Makefile | 8 ++++++--
>  3 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index bc208886fcce..90c6656de224 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1784,6 +1784,7 @@ prepare:
>                 echo "  The kernel was built by: "$(CONFIG_CC_VERSION_TEXT); \
>                 echo "  You are using:           $(CC_VERSION_TEXT)"; \
>         fi
> +       $(Q)$(MAKE) $(build)=scripts/gcc-plugins
>
>  PHONY += help
>  help:
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 952e46876329..be4303678942 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -48,7 +48,7 @@ export DISABLE_ARM_SSP_PER_TASK_PLUGIN
>
>  # All the plugin CFLAGS are collected here in case a build target needs to
>  # filter them out of the KBUILD_CFLAGS.
> -GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> +GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD),$(objtree))/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
>  # The sancov_plugin.so is included via CFLAGS_KCOV, so it is removed here.
>  GCC_PLUGINS_CFLAGS := $(filter-out %/sancov_plugin.so, $(GCC_PLUGINS_CFLAGS))
>  export GCC_PLUGINS_CFLAGS
> diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
> index b5487cce69e8..9f8e2ef3ab56 100644
> --- a/scripts/gcc-plugins/Makefile
> +++ b/scripts/gcc-plugins/Makefile
> @@ -1,10 +1,14 @@
>  # SPDX-License-Identifier: GPL-2.0
>
> -$(obj)/randomize_layout_plugin.so: $(objtree)/$(obj)/randomize_layout_seed.h
> +ifneq ($(KBUILD_EXTMOD),)
> +override obj := $(KBUILD_EXTMOD)/$(obj)
> +endif
> +
> +$(obj)/randomize_layout_plugin.so: $(objtree)/$(src)/randomize_layout_seed.h
>  quiet_cmd_create_randomize_layout_seed = GENSEED $@
>  cmd_create_randomize_layout_seed = \
>    $(CONFIG_SHELL) $(srctree)/$(src)/gen-random-seed.sh $@ $(objtree)/include/generated/randomize_layout_hash.h
> -$(objtree)/$(obj)/randomize_layout_seed.h: FORCE
> +$(objtree)/$(src)/randomize_layout_seed.h: FORCE
>         $(call if_changed,create_randomize_layout_seed)
>  targets += randomize_layout_seed.h randomize_layout_hash.h
>
> --
> 2.29.2
>


-- 
Best Regards
Masahiro Yamada
