Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD303921BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 23:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbhEZVEl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 17:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbhEZVEi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 17:04:38 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A728EC061574;
        Wed, 26 May 2021 14:03:04 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id y197so3988375ybe.11;
        Wed, 26 May 2021 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fjggmNXP8aJJIe5LARZOetddJKB665gZqov3k0rARmE=;
        b=oIshPE/fiYe7+ESpjqOYMCMYMV58cBEEthVeSftX73A3wP12A8wiQ+su72g7mM2vQq
         mAa04QudN1IuRCoUtJj2BylIZx0rXdPmXYWJOiHv3WE+kKVffRVL2ppoOYHcsRP/WG3i
         Dq2RGxcTv3G7lMaExu56gbKgeSFUTDANYZfhcUgDO2bf/IwGhQye1U0ES3YSOYFxGXXj
         4qrojsSLFSgvI5U2KTDSpQV+CxBo/KCbxhfQiu5mZniLOU9/xZqFwYPj/2ljKjyqtwez
         VKubTRx//LZQ2NmV2PUW4iyl0uXbncMaYqdRUMNTnnxS4udzZRNWTLUzfblVtafa348q
         LzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjggmNXP8aJJIe5LARZOetddJKB665gZqov3k0rARmE=;
        b=DPPSpim6T1XBe/qgvIJNgCq5rN7bEvCTMSRgzAQSqNMXg20KAF0Y7kwIkR4sbqgXcI
         0+QY9MxdpYcTh8bu9i5lOyNBlfsLJmgWGngRDlN7nf1COLLVBGWMaIyT7zlW3UWBwAqw
         06jiFgzP+J9gkA9vi8MS8MBAdq1rxGHci/sIqgEXFEbLziN5fF8P4oGH0xWYbvwBE/ph
         wjyujOXdUxLgk7iZr059n4BuQaqCJ6UtPErhiyRc3PsMaAGvWxDjhfehJRyk3v7lnSiD
         92Bz5pKC56fNDfRtmq4ihbtc8azFwcaD6c/pLW3+eqkaYu/RECZYejhz/EL0UMDYXsZr
         Dfyg==
X-Gm-Message-State: AOAM530+ffwTXK437GdHz9S4PvGWktpqFSErln8ROqqw8b+MWcDaDHIt
        25K5A0ViD4ar5lxoMQHUvqOHYlRnYSvGyTSf0czzoh2zxMo=
X-Google-Smtp-Source: ABdhPJz4+zhebIxWn7F4gfKP/NFsVuyboDr7JVj62TVrVWpMRjTAmq7cT8f6GsYU05z4bq0578DxNbKgFVOr2ZjIgS4=
X-Received: by 2002:a25:3357:: with SMTP id z84mr53013528ybz.260.1622062983834;
 Wed, 26 May 2021 14:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210518142302.1046718-1-javierm@redhat.com> <CAEf4BzYqA1Upbm75aW-Rs-WCqQ6KRnSje-uTis2fw749_f8tRw@mail.gmail.com>
 <CAK7LNAQZNkdQTtGHmrE0dcbeirBZb1O++A4b2oaAvu6+1Jupbw@mail.gmail.com>
In-Reply-To: <CAK7LNAQZNkdQTtGHmrE0dcbeirBZb1O++A4b2oaAvu6+1Jupbw@mail.gmail.com>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Wed, 26 May 2021 14:02:52 -0700
Message-ID: <CAEf4BzaV0y51EY5JAYZ0dueC2NQihwy+4pTtidSj4KXxGm+fwA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: quote OBJCOPY var to avoid a pahole call break
 the build
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Wed, May 26, 2021 at 12:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, May 27, 2021 at 1:18 AM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Tue, May 18, 2021 at 7:23 AM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> > >
> > > The ccache tool can be used to speed up cross-compilation, by calling the
> > > compiler and binutils through ccache. For example, following should work:
> > >
> > >     $ export ARCH=arm64 CROSS_COMPILE="ccache aarch64-linux-gnu-"
>
> Actually, I did not know this...
>
> > >
> > >     $ make M=drivers/gpu/drm/rockchip/
> > >
> > > but pahole fails to extract the BTF info from DWARF, breaking the build:
> > >
> > >       CC [M]  drivers/gpu/drm/rockchip//rockchipdrm.mod.o
> > >       LD [M]  drivers/gpu/drm/rockchip//rockchipdrm.ko
> > >       BTF [M] drivers/gpu/drm/rockchip//rockchipdrm.ko
> > >     aarch64-linux-gnu-objcopy: invalid option -- 'J'
> > >     Usage: aarch64-linux-gnu-objcopy [option(s)] in-file [out-file]
> > >      Copies a binary file, possibly transforming it in the process
> > >     ...
> > >     make[1]: *** [scripts/Makefile.modpost:156: __modpost] Error 2
> > >     make: *** [Makefile:1866: modules] Error 2
> > >
> > > this fails because OBJCOPY is set to "ccache aarch64-linux-gnu-copy" and
> > > later pahole is executed with the following command line:
> > >
> > >     LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@
> > >
> > > which gets expanded to:
> > >
> > >     LLVM_OBJCOPY=ccache aarch64-linux-gnu-objcopy pahole -J ...
> > >
> > > instead of:
> > >
> > >     LLVM_OBJCOPY="ccache aarch64-linux-gnu-objcopy" pahole -J ...
> > >
> > > Fixes: 5f9ae91f7c0 ("kbuild: Build kernel module BTFs if BTF is enabled and pahole supports it")
> > > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> > > ---
> > >
> >
> > LGTM. Masahiro, would you like us to take this through bpf tree or
> > you'll apply this to kbuild one?
> >
> > Acked-by: Andrii Nakryiko <andrii@kernel.org>
> >
> > >  scripts/Makefile.modfinal | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > > index dd87cea9fba..a7883e45529 100644
> > > --- a/scripts/Makefile.modfinal
> > > +++ b/scripts/Makefile.modfinal
> > > @@ -59,7 +59,7 @@ quiet_cmd_ld_ko_o = LD [M]  $@
> > >  quiet_cmd_btf_ko = BTF [M] $@
> > >        cmd_btf_ko =                                                     \
> > >         if [ -f vmlinux ]; then                                         \
> > > -               LLVM_OBJCOPY=$(OBJCOPY) $(PAHOLE) -J --btf_base vmlinux $@; \
> > > +               LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J --btf_base vmlinux $@; \
> > >         else                                                            \
> > >                 printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
> > >         fi;
> > > --
> > > 2.31.1
> > >
>
>
> Please feel free to pick it up.

Ok, sounds good.

> I do not know 5f9ae91f7c0.
>
> BTW, I see similar code in scripts/link-vmlinux.sh too.
>
>      LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${extra_paholeopt} ${1}
>
> Is it OK to leave it unquoted?

You are right, link-vmlinux.sh should be updated accordingly.

Javier, can you please send v2 and cc bpf@vger.kernel.org? Thanks!

>
>
> --
> Best Regards
> Masahiro Yamada
