Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4698E46A60E
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Dec 2021 20:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348469AbhLFT5M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Dec 2021 14:57:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348710AbhLFT5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Dec 2021 14:57:12 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12444C061746
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Dec 2021 11:53:43 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id u80so11164215pfc.9
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Dec 2021 11:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W+B24Ga02KLCay/J4QiW1W4XQA9sxklK4oWjeCSkusE=;
        b=hMzp1aRLXVBLljYR/QEuI5Zz1WW43waFAlVjlPrR6IWcm0BWoeBLlWyJd4lsbtUu9J
         B4WERxJ5V0cpAoruiNVmzpNHNw1OhCdqGLFzqEeexcGdh+zOc4uI0zroB0vwW68whwH0
         aVlfFzA83YRLxvNaa2x6+TmCqXR8CV5vpq3LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W+B24Ga02KLCay/J4QiW1W4XQA9sxklK4oWjeCSkusE=;
        b=pdPLmYO5xx0tDMkeWHjJVMv6V0Wk31n3Kby9i+0uLQrvQf5YhTOFuwgWSY6MhvC4Nf
         QXkSrOn+/Xahsvbz4ItPSFcuUzm7p6eVqrU527jJeUTZGTOF1dvIuWV0E0lHPUCPF65o
         BayCJGX+Mvy6ypvaxKp6AOTwuC4I79vWtz1Wi5DmqVfrz+dZIMlZceGrtK724jfh9hSA
         miP46cTMFj9vLa5s/a/qTcuy0YtrQPOrj92Kh21qREso282bpUUr0wSlb+9HSf8vl8Ex
         1rHvg/eCLUGXv+Wrk3OQL9+RNRGBDcr1Vo3TGvBYicYSAYB5GukMuoeP2B5whnTPSfSr
         fRWw==
X-Gm-Message-State: AOAM530a1i1zBAiLPBAsx2dF4KA19tBilF7f6mdtd7g+uvs0Tcqw3t9z
        kbZJyZnOdA/q+Z05y0amZe0ElA==
X-Google-Smtp-Source: ABdhPJzsg9Wl/VM5Qi3xeLjvoXz6CTFEFxMju2bvCeJuDFeddvXa0smAsi9CaFobyMWxNuiG6PrVxw==
X-Received: by 2002:a63:b919:: with SMTP id z25mr346072pge.252.1638820422565;
        Mon, 06 Dec 2021 11:53:42 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m13sm78621pgt.22.2021.12.06.11.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 11:53:42 -0800 (PST)
Date:   Mon, 6 Dec 2021 11:53:41 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Salvatore Bonaccorso <carnil@debian.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Makefile: CC_IMPLICIT_FALLTHROUGH passed quoted as argument to
 gcc
Message-ID: <202112061128.6B670358@keescook>
References: <YatpectAYsWnmPy2@eldamar.lan>
 <CAHk-=whTTWUyL5j5_-UeRT6k9VcJM_VOfjiKuU2NBJkxhbnXpw@mail.gmail.com>
 <CAK7LNAR-VXwHFEJqCcrFDZj+_4+Xd6oynbj_0eS8N504_ydmyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAR-VXwHFEJqCcrFDZj+_4+Xd6oynbj_0eS8N504_ydmyw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 05, 2021 at 02:54:05AM +0900, Masahiro Yamada wrote:
> On Sun, Dec 5, 2021 at 1:53 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Sat, Dec 4, 2021 at 5:13 AM Salvatore Bonaccorso <carnil@debian.org> wrote:
> > >
> > > Andreas suggested to replace the
> > >
> > > KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
> > >
> > > with
> > >
> > > KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(patsubst "%",%,$(CONFIG_CC_IMPLICIT_FALLTHROUGH))
> >
> > Ugh. I think the external build environment is a bit broken, but
> > whatever. The above is ugly but I guess it works.
> >
> > Another alternative would be to make the Kconfig strings simply not
> > have '"' as part of them.
> >
> > When you do
> >
> >     a = "hello"
> >     print $a
> >
> > in any normal language, you generally wouldn't expect it to print the
> > quotes, it should just print the bare word.
> >
> > But that's what the Kconfig string language basically does in this
> > case. And I guess several users expect and take advantage of that ;(
> >
> > Masahiro? Comments?
> 
> Yes, you get to the point.
> 
> In fact, this is in my TODO list for a while
> (and this is the reason I was doing prerequisite Kconfig refactoring
> in the previous development cycle).
> I will try to find some spare time to complete this work.
> 
> 
> 
> Kconfig generates two similar files,
> 
>  -   .config
>  -   include/config/auto.conf
> 
> Changing the format of the .config is presumably problematic
> since it is the saved user configuration as well.
> 
> It is possible (and more reasonable) to change include/config/auto.conf
> so strings are not quoted.
> 
> In Makefiles, quotations are just normal characters; they have no
> special functionality.
> 
> So, in Makefile context, it is more handy to do
> 
>      CONFIG_X=foo bar
> 
> instead of
> 
>     CONFIG_X="foo bar"
> 
> 
> 
> One problem is include/config/auto.conf is included not only by Makefiles
> but also by shell scripts.
> 
> 
> In shell context, the right hand side must be quoted
> in case the value contains spaces.
> 
>    CONFIG_X="foo bar"
> 
> 
> 
> My plan is to fix
>   scripts/link-vmlinux.sh
>   scripts/gen_autoksyms.sh
> etc. to not directly include the auto.conf.
> Later, change Kconfig to generate the auto.conf without "".
> 
> 
> 
> In the meantime,
> 
> KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(patsubst
> "%",%,$(CONFIG_CC_IMPLICIT_FALLTHROUGH))
> 
>  or if you prefer slightly shorter form,
> 
> KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH:"%"=%)
> 
> will be a workaround.

It'll be nice to get this fixed. There are a few places where there is
a test for a compiler flag in Kconfig, and then the option is repeated
in the Makefile, due to the above quoting issues. For example:

arch/arm64/Kconfig:
	config CC_HAS_BRANCH_PROT_PAC_RET
	     # GCC 9 or later, clang 8 or later
	     def_bool $(cc-option,-mbranch-protection=pac-ret+leaf)

arch/arm64/Makefile:
	branch-prot-flags-$(CONFIG_CC_HAS_BRANCH_PROT_PAC_RET) := -mbranch-protection=pac-ret+leaf


I like the $(CONFIG_CC_IMPLICIT_FALLTHROUGH:"%"=%) solution: it's short.

-- 
Kees Cook
