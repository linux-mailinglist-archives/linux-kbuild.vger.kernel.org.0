Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2BDA1DEE80
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 19:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbgEVRpg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 13:45:36 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:42791 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgEVRpf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 13:45:35 -0400
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 04MHjCZp006529;
        Sat, 23 May 2020 02:45:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 04MHjCZp006529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590169513;
        bh=rLsdMRfeyuDHWZtXBc09c+5yI+XIy6MzzofNEb/odbw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zBTBGk+O+hyiLzZsF+Q0X+nbbIz2KqTdlyhC/mNZT55Z+cORFp/A5D4mv9OxwL0yc
         NJFIvCN8oBf4MCSGXRhnLJK9kgbzQ2YccpuYtpGog4lbqeuRt2ZRwtSizIKSecAmK/
         8bnrV+0MU0jXoAOc6c6wusKnu26MiusDLCMAipVtuXMU3JnS3nG09apay6FxOPXaBR
         g+9xI+1CjmHL80OiprmxondHmdqQ7nqMJGvIF6NTq97MnSFR5MmTjmeVFuiYsn3mDo
         9kvFg89x500tvJDYb3j53M+Rd0g3jbUG3RPtEtHiML9s14xje8mtlimlzgwT1kPZuY
         3460j2tbJDOzg==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id w188so2780220vkf.0;
        Fri, 22 May 2020 10:45:13 -0700 (PDT)
X-Gm-Message-State: AOAM5335BaVSD/zaNMVjajizNRU2R3fybcvIzG7t1G3AxSyWcAsRrLrw
        lp9QH/RqvWGHME3mJsevEsSOS/teiioRA3bEwvs=
X-Google-Smtp-Source: ABdhPJyOlAJ/aga5nvnqTOhe/Z0ZcHj8m7VZKlrl4mv6P2/AltNmsoqN1pIH2MyR9G1brNqjN++8ASQrq4QTgorz0f8=
X-Received: by 2002:a1f:b2c9:: with SMTP id b192mr10171152vkf.73.1590169512338;
 Fri, 22 May 2020 10:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com> <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
In-Reply-To: <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 23 May 2020 02:44:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
Message-ID: <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To:     Sami Tolvanen <samitolvanen@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+ Michael, and PPC ML.

They may know something about the reason of failure.


On Sat, May 23, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 5:27 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Instead of linking all compilation units again each time vmlinux_link is
> > called, reuse vmlinux.o from modpost_link.
> >
> > With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> > vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> > in the time spent in vmlinux_link).
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  scripts/link-vmlinux.sh | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index d09ab4afbda4..c6cc4305950c 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -77,11 +77,8 @@ vmlinux_link()
> >
> >         if [ "${SRCARCH}" != "um" ]; then
> >                 objects="--whole-archive                        \
> > -                       ${KBUILD_VMLINUX_OBJS}                  \
> > +                       vmlinux.o                               \
> >                         --no-whole-archive                      \
> > -                       --start-group                           \
> > -                       ${KBUILD_VMLINUX_LIBS}                  \
> > -                       --end-group                             \
> >                         ${@}"
> >
> >                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
> >
> > base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
> > --
> > 2.27.0.rc0.183.gde8f92d652-goog
> >
>
>
> I like this patch irrespective of CLANG_LTO, but
> unfortunately, my build test failed.
>
>
> ARCH=powerpc failed to build as follows:
>
>
>
>   MODPOST vmlinux.o
>   MODINFO modules.builtin.modinfo
>   GEN     modules.builtin
>   LD      .tmp_vmlinux.kallsyms1
> vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+4b1c
> vmlinux.o:(__ftr_alt_97+0x164): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+1cf78
> vmlinux.o:(__ftr_alt_97+0x288): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+1dac4
> vmlinux.o:(__ftr_alt_97+0x2f0): relocation truncated to fit:
> R_PPC64_REL14 against `.text'+1e254
> make: *** [Makefile:1125: vmlinux] Error 1
>
>
>
> I used powerpc-linux-gcc
> available at
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2.0/
>
>
> Build command:
>
> make -j24 ARCH=powerpc  CROSS_COMPILE=powerpc-linux-  defconfig all
>
>
> Could you check it please?
>
>
>
> I will apply it to my test branch.
> Perhaps, 0-day bot may find more failure cases.
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
