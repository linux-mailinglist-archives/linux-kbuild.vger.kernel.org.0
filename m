Return-Path: <linux-kbuild+bounces-1752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D50E8BBB9B
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 14:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FA4BB216F5
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 12:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DF02231C;
	Sat,  4 May 2024 12:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYbc62O8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1B3AD55;
	Sat,  4 May 2024 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714827021; cv=none; b=OLk65iykfObMnsJ0k97kWXXOupqdF3NKJi8IkUjZQ+Y1Vh5FpCWQYfaIjL3TX820CymYaaRM3sQ7BjtjJb196fdERXtb31kPoUmUE8F9mDOi1V1B/Yso0++uAqmvJ2YL2haY5lfLkae/Ax5KcgI1C02DfqSxbORsbLvOjYudPvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714827021; c=relaxed/simple;
	bh=15OnQaGp+w4QV1wpR/KVCGa9n/nGZ5yYchbybkXHSw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThHJ8fI1DBJ6qhebrS6e+0/Og/aCope5Eh/uaRpJ4SEP13JXlAu2BW59swevfGs8Lder5lsxjpW8sSn7UA0bdt2zeThQSJZpzw1kiad8K4q171sd3D/XtZcUcwciWFU4keLFmPrPtESz2R1hLwOJrJwEdIZYwPKmNibRXipUaQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYbc62O8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58495C4AF1D;
	Sat,  4 May 2024 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714827021;
	bh=15OnQaGp+w4QV1wpR/KVCGa9n/nGZ5yYchbybkXHSw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eYbc62O8Cj25EWIqccM5lSCeaULjZIKfZTrdJicfLI2UFwkJTX2GnB16PjCF6+Nml
	 bmiaaPbyj6jkR41ZHghLjAVtiazO5phLBMCv7sCn4ztBd2LLRY+Oa+hNompZ+Dyz1Y
	 yD3l+FCp8ESw5WG9k84zLdoQBlsgQj2yBC5FnYiiKcY16S4ATXaekY9l3QvzsiHEH0
	 QJs15Xor1N5gKDZCHhIa1Ed8SStvvj91RCDDl9Vl9Hwd+7eXZiz9rQrL4pV2hl6dQC
	 XzP1gNHnhNwMyydv7SJIe4OeWt1VJzhN5KNz6+5onVJ4nfNfy2A5eXFmqeZfXewMQA
	 1spNxVRNoXhCQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e1fa2ff499so21755411fa.0;
        Sat, 04 May 2024 05:50:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWdSQyBFwLJ2vVCb7UUFqr+migRgX17OLQ6l1db+Fsd0ah5whyuX0kFBr2HX30Zo08V26IMBfPC0klEzuIE1TJGnN2HIShs4w2Ajux6k2Lh2TT8y/ZXHqieDr/ZmYtxzvO+cyfd4zEtYVn
X-Gm-Message-State: AOJu0YxQ2zM381fdFg+ZydGIhhgl0nHTs6SwMCpnyqGqJh3hsbkgBh0J
	rEHe/IHsTv2Mie0QL11AD3e4d079bZrAjDyNOvhev/5Imd2G+vbFgQ3lZr+ci4Fx3gN6HedVFeL
	nUfd23x+MMFUW3hbMC1RBx6GWvlI=
X-Google-Smtp-Source: AGHT+IFoIWqnaCzFi5bNroPPVQfMUu5iH1qzKiswWoi1X1aOcGBHqnF36kOKqqTCGdOZmTez4jxeTBKoC2fUiC0UW2Y=
X-Received: by 2002:a19:7714:0:b0:51f:16bc:18f9 with SMTP id
 s20-20020a197714000000b0051f16bc18f9mr2237701lfc.25.1714827019969; Sat, 04
 May 2024 05:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-2-emil.renner.berthing@canonical.com> <87ttjgcqjv.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ttjgcqjv.fsf@all.your.base.are.belong.to.us>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 May 2024 21:49:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASqwN1gd8TovcR3RDkxkE_M=BSDD5GoOoLOkDQnuNDAcA@mail.gmail.com>
Message-ID: <CAK7LNASqwN1gd8TovcR3RDkxkE_M=BSDD5GoOoLOkDQnuNDAcA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] riscv: make image compression configurable
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 2, 2024 at 10:05=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> Emil Renner Berthing <emil.renner.berthing@canonical.com> writes:
>
> > Previously the build process would always set KBUILD_IMAGE to the
> > uncompressed Image file (unless XIP_KERNEL or EFI_ZBOOT was enabled) an=
d
> > unconditionally compress it into Image.gz. However there are already
> > build targets for Image.bz2, Image.lz4, Image.lzma, Image.lzo and
> > Image.zstd, so let's make use of those, make the compression method
> > configurable and set KBUILD_IMAGE accordingly so that targets like
> > 'make install' and 'make bindeb-pkg' will use the chosen image.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com=
>
> > ---
> >  arch/riscv/Kconfig         |  7 +++++++
> >  arch/riscv/Makefile        | 43 ++++++++++++++++++++------------------
> >  arch/riscv/boot/install.sh |  9 +++++---
> >  3 files changed, 36 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index be09c8836d56..6c092d1ea7db 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -138,6 +138,13 @@ config RISCV
> >       select HAVE_GCC_PLUGINS
> >       select HAVE_GENERIC_VDSO if MMU && 64BIT
> >       select HAVE_IRQ_TIME_ACCOUNTING
> > +     select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
> > +     select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
> > +     select HAVE_KERNEL_LZ4 if !XIP_KERNEL && !EFI_ZBOOT
> > +     select HAVE_KERNEL_LZMA if !XIP_KERNEL && !EFI_ZBOOT
> > +     select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
> > +     select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
> > +     select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
> >       select HAVE_KPROBES if !XIP_KERNEL
> >       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> >       select HAVE_KRETPROBES if !XIP_KERNEL
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 5b3115a19852..29be676415d6 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -129,11 +129,27 @@ endif
> >  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
> >
> >  # Default target when executing plain make
> > -boot         :=3D arch/riscv/boot
> > +boot :=3D arch/riscv/boot
> >  ifeq ($(CONFIG_XIP_KERNEL),y)
> >  KBUILD_IMAGE :=3D $(boot)/xipImage
> > +else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
> > +KBUILD_IMAGE :=3D $(boot)/loader.bin
> > +else ifeq ($(CONFIG_EFI_ZBOOT),y)
> > +KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> > +else ifeq ($(CONFIG_KERNEL_GZIP),y)
> > +KBUILD_IMAGE :=3D $(boot)/Image.gz
> > +else ifeq ($(CONFIG_KERNEL_BZIP2),y)
> > +KBUILD_IMAGE :=3D $(boot)/Image.bz2
> > +else ifeq ($(CONFIG_KERNEL_LZ4),y)
> > +KBUILD_IMAGE :=3D $(boot)/Image.lz4
> > +else ifeq ($(CONFIG_KERNEL_LZMA),y)
> > +KBUILD_IMAGE :=3D $(boot)/Image.lzma
> > +else ifeq ($(CONFIG_KERNEL_LZO),y)
> > +KBUILD_IMAGE :=3D $(boot)/Image.lzo
> > +else ifeq ($(CONFIG_KERNEL_ZSTD),y)
> > +KBUILD_IMAGE :=3D $(boot)/Image.zst
> >  else
> > -KBUILD_IMAGE :=3D $(boot)/Image.gz
> > +KBUILD_IMAGE :=3D $(boot)/Image
> >  endif
>
> Really a nit/change if you want, but maybe doing something like
> arch/s390/boot/Makefile does is easier to read:
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 024482c68835..70f08e9999b4 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -128,6 +128,14 @@ endif
>  # arch specific predefines for sparse
>  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
>
> +suffix-$(CONFIG_KERNEL_GZIP)  :=3D .gz
> +suffix-$(CONFIG_KERNEL_BZIP2) :=3D .bz2
> +suffix-$(CONFIG_KERNEL_LZ4)  :=3D .lz4
> +suffix-$(CONFIG_KERNEL_LZMA)  :=3D .lzma
> +suffix-$(CONFIG_KERNEL_LZO)  :=3D .lzo
> +suffix-$(CONFIG_KERNEL_XZ)  :=3D .xz
> +suffix-$(CONFIG_KERNEL_ZSTD)  :=3D .zst
> +
>  # Default target when executing plain make
>  boot :=3D arch/riscv/boot
>  ifeq ($(CONFIG_XIP_KERNEL),y)
> @@ -136,20 +144,8 @@ else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAA=
N),yy)
>  KBUILD_IMAGE :=3D $(boot)/loader.bin
>  else ifeq ($(CONFIG_EFI_ZBOOT),y)
>  KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> -else ifeq ($(CONFIG_KERNEL_GZIP),y)
> -KBUILD_IMAGE :=3D $(boot)/Image.gz
> -else ifeq ($(CONFIG_KERNEL_BZIP2),y)
> -KBUILD_IMAGE :=3D $(boot)/Image.bz2
> -else ifeq ($(CONFIG_KERNEL_LZ4),y)
> -KBUILD_IMAGE :=3D $(boot)/Image.lz4
> -else ifeq ($(CONFIG_KERNEL_LZMA),y)
> -KBUILD_IMAGE :=3D $(boot)/Image.lzma
> -else ifeq ($(CONFIG_KERNEL_LZO),y)
> -KBUILD_IMAGE :=3D $(boot)/Image.lzo
> -else ifeq ($(CONFIG_KERNEL_ZSTD),y)
> -KBUILD_IMAGE :=3D $(boot)/Image.zst
>  else
> -KBUILD_IMAGE :=3D $(boot)/Image
> +KBUILD_IMAGE :=3D $(boot)/Image$(suffix-y)
>  endif




Good idea.


If you avoid the 'else ifeq' chain completely,
you also could do like this:



boot-image-$(CONFIG_KERNEL_GZIP)         :=3D Image.gz
   ...
boot-image-$(CONFIG_KERNEL_ZSTD)         :=3D Image.zst
boot-image-$(CONFIG_KERNEL_UNCOMPRESSED) :=3D Image
boot-image-$(CONFIG_RISCV_M_MODE)        :=3D loader.bin
boot-image-$(CONFIG_ARCH_CANAAN)         :=3D loader.bin
boot-image-$(CONFIG_EFI_ZBOOT)           :=3D vmlinuz.efi
boot-image-$(CONFIG_XIP_KERNEL)          :=3D xipImage

KBUILD_IMAGE :=3D $(boot)/$(boot-image-y)



Emil's current patch will work, of course.




BTW, this patch will conflict with
3b938e231b660a278de2988ee77b832d665c5326
It lands in riscv subsystem.


--=20
Best Regards
Masahiro Yamada

