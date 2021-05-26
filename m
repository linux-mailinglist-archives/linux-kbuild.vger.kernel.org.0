Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75118391FD3
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 20:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbhEZTAr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 15:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234938AbhEZTAr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 15:00:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA0A0613C7;
        Wed, 26 May 2021 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055555;
        bh=WGltjEQGQmSpa0KZNMruhrwEKLk8ypzCyKbofsPqxgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vxk/fz3Qe8ijcHZhGycuv13zj2Tf2nadeqXGtW5NLCvKPewj7F/Di3JcXN8IQlpco
         fVmmg0sPOgXMDVs+2xEMDJpPDT+gDZzw34FJ2eiusEpmGOOxLp8tWqirTkmyaObqON
         xxhraziuBhEoHX6whg47zCH2CwBBBkiRoENq4U9C2cvYbmq3bK7yDjWq6304dB96Io
         5fGSeIuH6Gpptu+yVcXb+IuL1zjVcEH3rXHNkxDnkn4J8gwSLFCcN4sNNjFaRtWzFL
         //EJLmkm1/M6bM0twIB1zyv7agPKsNBw2edeC+yhEorOFYw7Mi1/fs/vj9RcyDYvG/
         uYwEPuxK8ImRw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 76BE14011C; Wed, 26 May 2021 15:59:10 -0300 (-03)
Date:   Wed, 26 May 2021 15:59:10 -0300
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Javier Martinez Canillas <javierm@redhat.com>,
        open list <linux-kernel@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] kbuild: quote OBJCOPY var to avoid a pahole call break
 the build
Message-ID: <YK6afk8QQW/vHMuu@kernel.org>
References: <20210518142302.1046718-1-javierm@redhat.com>
 <CAEf4BzYqA1Upbm75aW-Rs-WCqQ6KRnSje-uTis2fw749_f8tRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzYqA1Upbm75aW-Rs-WCqQ6KRnSje-uTis2fw749_f8tRw@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Wed, May 26, 2021 at 09:18:27AM -0700, Andrii Nakryiko escreveu:
> On Tue, May 18, 2021 at 7:23 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> >
> > The ccache tool can be used to speed up cross-compilation, by calling the
> > compiler and binutils through ccache. For example, following should work:
> >
> >     $ export ARCH=arm64 CROSS_COMPILE="ccache aarch64-linux-gnu-"
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

LGTM

Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>

- Arnaldo

 
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

-- 

- Arnaldo
