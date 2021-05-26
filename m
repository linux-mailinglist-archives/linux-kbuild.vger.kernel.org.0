Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66FF139212A
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 21:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232324AbhEZTz0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 15:55:26 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:61001 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbhEZTz0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 15:55:26 -0400
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 14QJrgrY029737;
        Thu, 27 May 2021 04:53:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 14QJrgrY029737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622058822;
        bh=tVRT+PcjR97t4IuJpi2X0n+OU2xQfbFz9htkRteh/Zw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rzRsso6fu75kwKTYRS4m0zqZDQHJb8SksKZxd6HVkE+fRVlQL2K7Qc/Jc5AOzAIZo
         RtH2oPK5zWP/4Q/9G5F+eoFnTNvD0MnbEHGQdf5PAmBO1ePZo/jlFDp7ZUJ6lFPKkn
         dwRXxObx/3jUBuF05E5RJh4lEYWjjNL6mnLkZXAVKRCQWyKhaS/h8hKGTZrP6B2cHg
         z2cCb0yJC9rBwIdNdZ403UP3bL82DX8U6D+LCjV77E45dWWlFCYJvm6JeMvuVsj5qE
         GohV1tBzu2GU5RxNYxOWZs/r0vZoN0yAC5LmiBVVvo1ckkR12yNUZFUHsN3CoZyFrA
         nKWVy0XuEISvw==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id x18so1762271pfi.9;
        Wed, 26 May 2021 12:53:42 -0700 (PDT)
X-Gm-Message-State: AOAM5317NzMstCcINa/5tFsj8X4Dvvg8P8x0nqlWYK5K0pbfcREnWYDa
        FqQDj294NYod4W9HiRJu3/hvcLPLcjSlMV2Mfug=
X-Google-Smtp-Source: ABdhPJwPdcbJYRCzv9TTg6tbBgQi4zgbr3hqQvq5iLiweSvE/8M8sDpsa67zQ0pszqZRACbU+p5+av+G34LL0CJrND0=
X-Received: by 2002:a63:164f:: with SMTP id 15mr86651pgw.175.1622058821401;
 Wed, 26 May 2021 12:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210518142302.1046718-1-javierm@redhat.com> <CAEf4BzYqA1Upbm75aW-Rs-WCqQ6KRnSje-uTis2fw749_f8tRw@mail.gmail.com>
In-Reply-To: <CAEf4BzYqA1Upbm75aW-Rs-WCqQ6KRnSje-uTis2fw749_f8tRw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 27 May 2021 04:53:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQZNkdQTtGHmrE0dcbeirBZb1O++A4b2oaAvu6+1Jupbw@mail.gmail.com>
Message-ID: <CAK7LNAQZNkdQTtGHmrE0dcbeirBZb1O++A4b2oaAvu6+1Jupbw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: quote OBJCOPY var to avoid a pahole call break
 the build
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        open list <linux-kernel@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 27, 2021 at 1:18 AM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Tue, May 18, 2021 at 7:23 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > The ccache tool can be used to speed up cross-compilation, by calling the
> > compiler and binutils through ccache. For example, following should work:
> >
> >     $ export ARCH=arm64 CROSS_COMPILE="ccache aarch64-linux-gnu-"

Actually, I did not know this...

> >
> >     $ make M=drivers/gpu/drm/rockchip/
> >
> > but pahole fails to extract the BTF info from DWARF, breaking the build:
> >
> >       CC [M]  drivers/gpu/drm/rockchip//rockchipdrm.mod.o
> >       LD [M]  drivers/gpu/drm/rockchip//rockchipdrm.ko
> >       BTF [M] drivers/gpu/drm/rockchip//rockchipdrm.ko
> >     aarch64-linux-gnu-objcopy: invalid option -- 'J'
> >     Usage: aarch64-linux-gnu-objcopy [option(s)] in-file [out-file]
> >      Copies a binary file, possibly transforming it in the process
> >     ...
> >     make[1]: *** [scripts/Makefile.modpost:156: __modpost] Error 2
> >     make: *** [Makefile:1866: modules] Error 2
> >
> > this fails because OBJCOPY is set to "ccache aarch64-linux-gnu-copy" and
> > later pahole is executed with the following command line:
> >
> >     LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@
> >
> > which gets expanded to:
> >
> >     LLVM_OBJCOPY=ccache aarch64-linux-gnu-objcopy pahole -J ...
> >
> > instead of:
> >
> >     LLVM_OBJCOPY="ccache aarch64-linux-gnu-objcopy" pahole -J ...
> >
> > Fixes: 5f9ae91f7c0 ("kbuild: Build kernel module BTFs if BTF is enabled and pahole supports it")
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > ---
> >
>
> LGTM. Masahiro, would you like us to take this through bpf tree or
> you'll apply this to kbuild one?
>
> Acked-by: Andrii Nakryiko <andrii@kernel.org>
>
> >  scripts/Makefile.modfinal | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index dd87cea9fba..a7883e45529 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@ -59,7 +59,7 @@ quiet_cmd_ld_ko_o = LD [M]  $@
> >  quiet_cmd_btf_ko = BTF [M] $@
> >        cmd_btf_ko =                                                     \
> >         if [ -f vmlinux ]; then                                         \
> > -               LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@; \
> > +               LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
> >         else                                                            \
> >                 printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
> >         fi;
> > --
> > 2.31.1
> >


Please feel free to pick it up.
I do not know 5f9ae91f7c0.

BTW, I see similar code in scripts/link-vmlinux.sh too.

     LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${extra_paholeopt} ${1}

Is it OK to leave it unquoted?


-- 
Best Regards
Masahiro Yamada
