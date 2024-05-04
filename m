Return-Path: <linux-kbuild+bounces-1757-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C11748BBC92
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 17:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E43FE1C20F82
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 15:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8B03D54B;
	Sat,  4 May 2024 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IgusHqbd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67808381AF;
	Sat,  4 May 2024 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714834777; cv=none; b=kY/6+ClxT5AGdvClmks7CQj0MoVMuikL+zo8yvtvHyu8qm7V9BbBh4gnZi0CaTGtCAOO8/SgGFrqc38twMOuxXabW7rf8Yh4/6d0B9iglgJ8aNzO2hSCvdSSL7QzB3J70/u8pcZXK9hPkntViy6ha6jHnAsveN2AJisoe5RgVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714834777; c=relaxed/simple;
	bh=59o7tXquRIqoxapI21PlnhHN12jY6tte9WJwrzVGL94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Md1Va2LvmCmrh/9D3caauFBNRB3PKs8CpZAIkSpmh0uKY9nF9t4++V/16Z75Q0gmwcP7AgPD1ZUNUqku5WfwSKvRl1PxqfEwgU8vZyA/45UMg4CFMBNa7pzv+BaH5JTLNE1QsA6e9o1QeBFN7mxqeADdBRH2ctrixLUuaCblTPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IgusHqbd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463DAC072AA;
	Sat,  4 May 2024 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714834777;
	bh=59o7tXquRIqoxapI21PlnhHN12jY6tte9WJwrzVGL94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IgusHqbdv0cxu41AzmUq2zJmz251NdLvB8oTzJyksXvA3IOb2NN2DfMz+/hHUK4Nx
	 PVkhF1uzINKChzMoJbQUTi1ltJAzAIlajsxPOTdZ114mxNZBYFTpt8nGsWoH1kxXAf
	 SzOZuAhIIBYnLsvpks/2gSh6OBig5G/nE97x2LYs8ub3D7dyURoUf/aVNkRIX8I2Qc
	 Mcb1eB2t58OhTEEFZ2W4xTCRNE+u6Xn6+G2G8WUUcFoZnQ5hf7YIpRxFMJLf1zO66j
	 hsuWWigAyc5GgxXMlNF0P9OcWtbPATNOgt+vl0fg3I8maNNDAxgmAvUcKp5BkHDd9S
	 6aGzVpqFvEBqw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2df848f9325so7439731fa.1;
        Sat, 04 May 2024 07:59:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWb85heOczbwyl1rHuzkJ6+DQp8pM6+kYp9QIS7YC8X8tPL4XMYJOqn2VeUNGtA4Dz2k9LXiJXIw224vH9MpF21KIDGIyrK4u9jlVicJs7yPpOGvqpCqF0/XpbB0hx3qlStjXGm7KJlUU+G
X-Gm-Message-State: AOJu0YwWYb/bZPEQS9Za8G7iQDY9kAJ3e7e2WyXNlPj2JxXZdZFQckBM
	JwpbEbowL0KBfi6CWbR20c3ln5LXYSkas0OwpbACto0Rb6BpvaZC1LFm+Tvuh6F7+cu/gqkZjcE
	UwuGvB+dHckfDxykqVZSBFcZcN38=
X-Google-Smtp-Source: AGHT+IFptx2/XrRKQS9VVn18TUeYl4iE0DDrVmRwBY6jDxJdM/VwzAfnq2l+RFLlTkrU/eauv/8Uf0erH5jfb+QzN1M=
X-Received: by 2002:a2e:9ed4:0:b0:2d8:63a2:50d2 with SMTP id
 h20-20020a2e9ed4000000b002d863a250d2mr3903586ljk.6.1714834775950; Sat, 04 May
 2024 07:59:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-2-emil.renner.berthing@canonical.com>
 <87ttjgcqjv.fsf@all.your.base.are.belong.to.us> <CAK7LNASqwN1gd8TovcR3RDkxkE_M=BSDD5GoOoLOkDQnuNDAcA@mail.gmail.com>
 <CAJM55Z-dorP1MgiCu=+VV_D+b6XXKWacUjT04QAsKvdmQtNv3g@mail.gmail.com>
In-Reply-To: <CAJM55Z-dorP1MgiCu=+VV_D+b6XXKWacUjT04QAsKvdmQtNv3g@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 May 2024 23:58:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNASwKy=wjJT1YNCACLfnn6VY0-7scN=wi4hRoCssh=6cGQ@mail.gmail.com>
Message-ID: <CAK7LNASwKy=wjJT1YNCACLfnn6VY0-7scN=wi4hRoCssh=6cGQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] riscv: make image compression configurable
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 10:54=E2=80=AFPM Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Masahiro Yamada wrote:
> > On Thu, May 2, 2024 at 10:05=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@ke=
rnel.org> wrote:
> > >
> > > Emil Renner Berthing <emil.renner.berthing@canonical.com> writes:
> > >
> > > > Previously the build process would always set KBUILD_IMAGE to the
> > > > uncompressed Image file (unless XIP_KERNEL or EFI_ZBOOT was enabled=
) and
> > > > unconditionally compress it into Image.gz. However there are alread=
y
> > > > build targets for Image.bz2, Image.lz4, Image.lzma, Image.lzo and
> > > > Image.zstd, so let's make use of those, make the compression method
> > > > configurable and set KBUILD_IMAGE accordingly so that targets like
> > > > 'make install' and 'make bindeb-pkg' will use the chosen image.
> > > >
> > > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical=
.com>
> > > > ---
> > > >  arch/riscv/Kconfig         |  7 +++++++
> > > >  arch/riscv/Makefile        | 43 ++++++++++++++++++++--------------=
----
> > > >  arch/riscv/boot/install.sh |  9 +++++---
> > > >  3 files changed, 36 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index be09c8836d56..6c092d1ea7db 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -138,6 +138,13 @@ config RISCV
> > > >       select HAVE_GCC_PLUGINS
> > > >       select HAVE_GENERIC_VDSO if MMU && 64BIT
> > > >       select HAVE_IRQ_TIME_ACCOUNTING
> > > > +     select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
> > > > +     select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
> > > > +     select HAVE_KERNEL_LZ4 if !XIP_KERNEL && !EFI_ZBOOT
> > > > +     select HAVE_KERNEL_LZMA if !XIP_KERNEL && !EFI_ZBOOT
> > > > +     select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
> > > > +     select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
> > > > +     select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
> > > >       select HAVE_KPROBES if !XIP_KERNEL
> > > >       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> > > >       select HAVE_KRETPROBES if !XIP_KERNEL
> > > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > > index 5b3115a19852..29be676415d6 100644
> > > > --- a/arch/riscv/Makefile
> > > > +++ b/arch/riscv/Makefile
> > > > @@ -129,11 +129,27 @@ endif
> > > >  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
> > > >
> > > >  # Default target when executing plain make
> > > > -boot         :=3D arch/riscv/boot
> > > > +boot :=3D arch/riscv/boot
> > > >  ifeq ($(CONFIG_XIP_KERNEL),y)
> > > >  KBUILD_IMAGE :=3D $(boot)/xipImage
> > > > +else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
> > > > +KBUILD_IMAGE :=3D $(boot)/loader.bin
> > > > +else ifeq ($(CONFIG_EFI_ZBOOT),y)
> > > > +KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> > > > +else ifeq ($(CONFIG_KERNEL_GZIP),y)
> > > > +KBUILD_IMAGE :=3D $(boot)/Image.gz
> > > > +else ifeq ($(CONFIG_KERNEL_BZIP2),y)
> > > > +KBUILD_IMAGE :=3D $(boot)/Image.bz2
> > > > +else ifeq ($(CONFIG_KERNEL_LZ4),y)
> > > > +KBUILD_IMAGE :=3D $(boot)/Image.lz4
> > > > +else ifeq ($(CONFIG_KERNEL_LZMA),y)
> > > > +KBUILD_IMAGE :=3D $(boot)/Image.lzma
> > > > +else ifeq ($(CONFIG_KERNEL_LZO),y)
> > > > +KBUILD_IMAGE :=3D $(boot)/Image.lzo
> > > > +else ifeq ($(CONFIG_KERNEL_ZSTD),y)
> > > > +KBUILD_IMAGE :=3D $(boot)/Image.zst
> > > >  else
> > > > -KBUILD_IMAGE :=3D $(boot)/Image.gz
> > > > +KBUILD_IMAGE :=3D $(boot)/Image
> > > >  endif
> > >
> > > Really a nit/change if you want, but maybe doing something like
> > > arch/s390/boot/Makefile does is easier to read:
> > >
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 024482c68835..70f08e9999b4 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -128,6 +128,14 @@ endif
> > >  # arch specific predefines for sparse
> > >  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
> > >
> > > +suffix-$(CONFIG_KERNEL_GZIP)  :=3D .gz
> > > +suffix-$(CONFIG_KERNEL_BZIP2) :=3D .bz2
> > > +suffix-$(CONFIG_KERNEL_LZ4)  :=3D .lz4
> > > +suffix-$(CONFIG_KERNEL_LZMA)  :=3D .lzma
> > > +suffix-$(CONFIG_KERNEL_LZO)  :=3D .lzo
> > > +suffix-$(CONFIG_KERNEL_XZ)  :=3D .xz
> > > +suffix-$(CONFIG_KERNEL_ZSTD)  :=3D .zst
> > > +
> > >  # Default target when executing plain make
> > >  boot :=3D arch/riscv/boot
> > >  ifeq ($(CONFIG_XIP_KERNEL),y)
> > > @@ -136,20 +144,8 @@ else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_C=
ANAAN),yy)
> > >  KBUILD_IMAGE :=3D $(boot)/loader.bin
> > >  else ifeq ($(CONFIG_EFI_ZBOOT),y)
> > >  KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> > > -else ifeq ($(CONFIG_KERNEL_GZIP),y)
> > > -KBUILD_IMAGE :=3D $(boot)/Image.gz
> > > -else ifeq ($(CONFIG_KERNEL_BZIP2),y)
> > > -KBUILD_IMAGE :=3D $(boot)/Image.bz2
> > > -else ifeq ($(CONFIG_KERNEL_LZ4),y)
> > > -KBUILD_IMAGE :=3D $(boot)/Image.lz4
> > > -else ifeq ($(CONFIG_KERNEL_LZMA),y)
> > > -KBUILD_IMAGE :=3D $(boot)/Image.lzma
> > > -else ifeq ($(CONFIG_KERNEL_LZO),y)
> > > -KBUILD_IMAGE :=3D $(boot)/Image.lzo
> > > -else ifeq ($(CONFIG_KERNEL_ZSTD),y)
> > > -KBUILD_IMAGE :=3D $(boot)/Image.zst
> > >  else
> > > -KBUILD_IMAGE :=3D $(boot)/Image
> > > +KBUILD_IMAGE :=3D $(boot)/Image$(suffix-y)
> > >  endif
> >
> >
> >
> >
> > Good idea.
> >
> >
> > If you avoid the 'else ifeq' chain completely,
> > you also could do like this:
> >
> >
> >
> > boot-image-$(CONFIG_KERNEL_GZIP)         :=3D Image.gz
> >    ...
> > boot-image-$(CONFIG_KERNEL_ZSTD)         :=3D Image.zst
> > boot-image-$(CONFIG_KERNEL_UNCOMPRESSED) :=3D Image
> > boot-image-$(CONFIG_RISCV_M_MODE)        :=3D loader.bin
> > boot-image-$(CONFIG_ARCH_CANAAN)         :=3D loader.bin
> > boot-image-$(CONFIG_EFI_ZBOOT)           :=3D vmlinuz.efi
> > boot-image-$(CONFIG_XIP_KERNEL)          :=3D xipImage
> >
> > KBUILD_IMAGE :=3D $(boot)/$(boot-image-y)
>
> Hi Masahiro and Bj=C3=B6rn.
>
> I like this approach. But I think it doesn't quite do the same when fx.
> CONFIG_RISCV_M_MODE=3Dn but CONFIG_ARCH_CANAAN=3Dy which I think is a val=
id
> configuration for the new Kendryte K230 support. In this case boot-image-=
y
> would be overwritten with the loader.bin value even for S-mode kernels.
>
> To keep the previous behaviour we'd need something like
>
>   boot-image-$(CONFIG_RISCV_M_MODE *and* CONFIG_ARCH_CANAAN) :=3D loader.=
bin
>
> Maybe just
>
>   ifeq ($(CONFIG_RISCV_M_MODE),y)
>   boot-image-$(CONFIG_ARCH_CANAAN) :=3D loader.bin
>   endif
>
> Do you guys have a better solution?


Hi Emil, sorry I misunderstood AND and OR.


ifdef CONFIG_RISCV_M_MODE
boot-image-$(CONFIG_ARCH_CANAAN) :=3D loader.bin
endif

is slightly shorter.



boot-image-$(and $(CONFIG_RISCV_M_MODE),$(CONFIG_ARCH_CANAAN)) :=3D loader.=
bin

is also possible, but the line is a bit long.


Otherwise, I do not have a better idea.




I am fine with any form.
I leave it to you and Palmer.





--=20
Best Regards
Masahiro Yamada

