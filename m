Return-Path: <linux-kbuild+bounces-1754-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD338BBC4B
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 15:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A932824BE
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 May 2024 13:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D133639ACC;
	Sat,  4 May 2024 13:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="rbpDIJrz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA4C2D022
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714830890; cv=none; b=OWPZ9ciqwVXCev3LYMWrY/IWBvH1tBqJELpVei+gPXTB3dAOLkoc7XAeC54vwCBzxwchOu5A6eZzVhUQWxBfUYg1UxpX63LA7mo+Na5QA6k/xr92F3iVoNYWKmZ4brhIwj0B+DadZMMxJ8RAn/k5qByJg/COdmhLu+KQLs/jPX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714830890; c=relaxed/simple;
	bh=3iKg45ushSHq8F9OfPaFQFgDANImax1q6EdgzZEUgmY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPnyS5BR40pU4g8kG+YvlcppV84tbSf5/xUVouN6+/dnOJem/MY6el7ZH84LtDwL8lpXZmK0emHu5ZgmQFpagXvvScfl/O5UWoQu6bg1+xHYOJYX3JNcxlBkfW6q3I77IlWuxJPTzgRqraJ/y+joWnUKPwNnICmdKeY+hd0b/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=rbpDIJrz; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E553A3F1EE
	for <linux-kbuild@vger.kernel.org>; Sat,  4 May 2024 13:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714830879;
	bh=0WjRr/tkWkr3Xh5WFmNS0edjBe9cmHkmJf/+9+FPMJg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=rbpDIJrz+1jXRUzlNCpwMD/o1hvelyNmRXKldi4+VZ9JijFpgIkiEs/tcphJLOVa2
	 WciGDJ0c5Ll37d6fMQslrFmmsRhuNEPrt5HNh/+Uwtyzru+1nvNaVE9JPiMdX1zfoW
	 zyLuZH0J6XDt8EP4BqjV2Seqc14RWx8bRTMidHimtvs07ao8A8PrTrk45/zwYxBXih
	 sn7MVjZD9zl7GdaYDneSe66bO1RSTrxwyfLxJDcZqej+zdfGvP8F+4wErMofyKzNMU
	 VodOiY1kMy8w9CxEJJ6g0fI1iulZCeTnbRssChUPENFzG9gQEPChN/Skz+2bOrAET9
	 AB4SsFNra0lVw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-439fe1c5facso8106261cf.0
        for <linux-kbuild@vger.kernel.org>; Sat, 04 May 2024 06:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714830879; x=1715435679;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0WjRr/tkWkr3Xh5WFmNS0edjBe9cmHkmJf/+9+FPMJg=;
        b=E8xA+dNB2cTQ2d23BM4UNbiX26VHioGTRfDZaSk+6sM0PLUPWtSrXUI66HPC1+BrbP
         ilKlCLvdrVpsE14kVtC8gHysCq0zKf9P2Ka1dULfFODO0l5v6y1khO1Du3B9zJUmunwE
         +icRNlZEMIJj+wjPw1MCvq7W43rntyfDAfqAK70uv3eAwttP1msCfPef3wutZ4Luef12
         IVjTvEdzP5Jf4SbwJw+gAPe7mXeicTxGCSIhX4YLzsCYtlr/dyP2mqRzUpw1Iq37s0HG
         efiluvDh1RHVFiE7YAOyezm0z/djLzA5fCcvN5Qi16wYbyG0YJRCC9HmFJMZKFXj77Rk
         BVbw==
X-Forwarded-Encrypted: i=1; AJvYcCW4B4Ot19pZKQDP9FFzG6R/cz3rMJEOUGwaswrmgIE3BL/8kQR1Ep1PcLuCbLe6cl6jA4bKTWMP4+TngHUCw4zhr5J55RxSx2O4JQhr
X-Gm-Message-State: AOJu0YwQ/8meeujWNQduSElC0lP6j/SHRdPWG70gqHjgDT9Ku2LNVVPM
	HkNGyn4bBpyBTNLI/DY1Gl6LQcCcRtvYZKtVfofeaeDf0NFoNmdxgucC38byHFhpIbJ0EPOCRbw
	HklMHjMuxncAtZc80J7a1zYa9tlFDjn7V28w734FAGUe+D6Hg5lHeGzvkpJCkdPq0I7+FhREjgz
	wFpWGGDShJERZ1VvxkmLlUJxKETyKlbtZPOs9sbauKZaVjLpYlLNn7
X-Received: by 2002:a05:622a:296:b0:43a:b15c:e9cd with SMTP id z22-20020a05622a029600b0043ab15ce9cdmr5704936qtw.29.1714830878721;
        Sat, 04 May 2024 06:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgNUPmd8Omg8BY6DSgks9Q18f2l7AQMWWDiPcpdB91lbabuImXrnY7zD1n0VbloJMoBfZD97i+xKm67tXuC4k=
X-Received: by 2002:a05:622a:296:b0:43a:b15c:e9cd with SMTP id
 z22-20020a05622a029600b0043ab15ce9cdmr5704920qtw.29.1714830878391; Sat, 04
 May 2024 06:54:38 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 4 May 2024 13:54:37 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAK7LNASqwN1gd8TovcR3RDkxkE_M=BSDD5GoOoLOkDQnuNDAcA@mail.gmail.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
 <20240502111613.1380453-2-emil.renner.berthing@canonical.com>
 <87ttjgcqjv.fsf@all.your.base.are.belong.to.us> <CAK7LNASqwN1gd8TovcR3RDkxkE_M=BSDD5GoOoLOkDQnuNDAcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Sat, 4 May 2024 13:54:37 +0000
Message-ID: <CAJM55Z-dorP1MgiCu=+VV_D+b6XXKWacUjT04QAsKvdmQtNv3g@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] riscv: make image compression configurable
To: Masahiro Yamada <masahiroy@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Masahiro Yamada wrote:
> On Thu, May 2, 2024 at 10:05=E2=80=AFPM Bj=C3=B6rn T=C3=B6pel <bjorn@kern=
el.org> wrote:
> >
> > Emil Renner Berthing <emil.renner.berthing@canonical.com> writes:
> >
> > > Previously the build process would always set KBUILD_IMAGE to the
> > > uncompressed Image file (unless XIP_KERNEL or EFI_ZBOOT was enabled) =
and
> > > unconditionally compress it into Image.gz. However there are already
> > > build targets for Image.bz2, Image.lz4, Image.lzma, Image.lzo and
> > > Image.zstd, so let's make use of those, make the compression method
> > > configurable and set KBUILD_IMAGE accordingly so that targets like
> > > 'make install' and 'make bindeb-pkg' will use the chosen image.
> > >
> > > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.c=
om>
> > > ---
> > >  arch/riscv/Kconfig         |  7 +++++++
> > >  arch/riscv/Makefile        | 43 ++++++++++++++++++++----------------=
--
> > >  arch/riscv/boot/install.sh |  9 +++++---
> > >  3 files changed, 36 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index be09c8836d56..6c092d1ea7db 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -138,6 +138,13 @@ config RISCV
> > >       select HAVE_GCC_PLUGINS
> > >       select HAVE_GENERIC_VDSO if MMU && 64BIT
> > >       select HAVE_IRQ_TIME_ACCOUNTING
> > > +     select HAVE_KERNEL_BZIP2 if !XIP_KERNEL && !EFI_ZBOOT
> > > +     select HAVE_KERNEL_GZIP if !XIP_KERNEL && !EFI_ZBOOT
> > > +     select HAVE_KERNEL_LZ4 if !XIP_KERNEL && !EFI_ZBOOT
> > > +     select HAVE_KERNEL_LZMA if !XIP_KERNEL && !EFI_ZBOOT
> > > +     select HAVE_KERNEL_LZO if !XIP_KERNEL && !EFI_ZBOOT
> > > +     select HAVE_KERNEL_UNCOMPRESSED if !XIP_KERNEL && !EFI_ZBOOT
> > > +     select HAVE_KERNEL_ZSTD if !XIP_KERNEL && !EFI_ZBOOT
> > >       select HAVE_KPROBES if !XIP_KERNEL
> > >       select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> > >       select HAVE_KRETPROBES if !XIP_KERNEL
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index 5b3115a19852..29be676415d6 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -129,11 +129,27 @@ endif
> > >  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
> > >
> > >  # Default target when executing plain make
> > > -boot         :=3D arch/riscv/boot
> > > +boot :=3D arch/riscv/boot
> > >  ifeq ($(CONFIG_XIP_KERNEL),y)
> > >  KBUILD_IMAGE :=3D $(boot)/xipImage
> > > +else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CANAAN),yy)
> > > +KBUILD_IMAGE :=3D $(boot)/loader.bin
> > > +else ifeq ($(CONFIG_EFI_ZBOOT),y)
> > > +KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> > > +else ifeq ($(CONFIG_KERNEL_GZIP),y)
> > > +KBUILD_IMAGE :=3D $(boot)/Image.gz
> > > +else ifeq ($(CONFIG_KERNEL_BZIP2),y)
> > > +KBUILD_IMAGE :=3D $(boot)/Image.bz2
> > > +else ifeq ($(CONFIG_KERNEL_LZ4),y)
> > > +KBUILD_IMAGE :=3D $(boot)/Image.lz4
> > > +else ifeq ($(CONFIG_KERNEL_LZMA),y)
> > > +KBUILD_IMAGE :=3D $(boot)/Image.lzma
> > > +else ifeq ($(CONFIG_KERNEL_LZO),y)
> > > +KBUILD_IMAGE :=3D $(boot)/Image.lzo
> > > +else ifeq ($(CONFIG_KERNEL_ZSTD),y)
> > > +KBUILD_IMAGE :=3D $(boot)/Image.zst
> > >  else
> > > -KBUILD_IMAGE :=3D $(boot)/Image.gz
> > > +KBUILD_IMAGE :=3D $(boot)/Image
> > >  endif
> >
> > Really a nit/change if you want, but maybe doing something like
> > arch/s390/boot/Makefile does is easier to read:
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index 024482c68835..70f08e9999b4 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -128,6 +128,14 @@ endif
> >  # arch specific predefines for sparse
> >  CHECKFLAGS +=3D -D__riscv -D__riscv_xlen=3D$(BITS)
> >
> > +suffix-$(CONFIG_KERNEL_GZIP)  :=3D .gz
> > +suffix-$(CONFIG_KERNEL_BZIP2) :=3D .bz2
> > +suffix-$(CONFIG_KERNEL_LZ4)  :=3D .lz4
> > +suffix-$(CONFIG_KERNEL_LZMA)  :=3D .lzma
> > +suffix-$(CONFIG_KERNEL_LZO)  :=3D .lzo
> > +suffix-$(CONFIG_KERNEL_XZ)  :=3D .xz
> > +suffix-$(CONFIG_KERNEL_ZSTD)  :=3D .zst
> > +
> >  # Default target when executing plain make
> >  boot :=3D arch/riscv/boot
> >  ifeq ($(CONFIG_XIP_KERNEL),y)
> > @@ -136,20 +144,8 @@ else ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_ARCH_CAN=
AAN),yy)
> >  KBUILD_IMAGE :=3D $(boot)/loader.bin
> >  else ifeq ($(CONFIG_EFI_ZBOOT),y)
> >  KBUILD_IMAGE :=3D $(boot)/vmlinuz.efi
> > -else ifeq ($(CONFIG_KERNEL_GZIP),y)
> > -KBUILD_IMAGE :=3D $(boot)/Image.gz
> > -else ifeq ($(CONFIG_KERNEL_BZIP2),y)
> > -KBUILD_IMAGE :=3D $(boot)/Image.bz2
> > -else ifeq ($(CONFIG_KERNEL_LZ4),y)
> > -KBUILD_IMAGE :=3D $(boot)/Image.lz4
> > -else ifeq ($(CONFIG_KERNEL_LZMA),y)
> > -KBUILD_IMAGE :=3D $(boot)/Image.lzma
> > -else ifeq ($(CONFIG_KERNEL_LZO),y)
> > -KBUILD_IMAGE :=3D $(boot)/Image.lzo
> > -else ifeq ($(CONFIG_KERNEL_ZSTD),y)
> > -KBUILD_IMAGE :=3D $(boot)/Image.zst
> >  else
> > -KBUILD_IMAGE :=3D $(boot)/Image
> > +KBUILD_IMAGE :=3D $(boot)/Image$(suffix-y)
> >  endif
>
>
>
>
> Good idea.
>
>
> If you avoid the 'else ifeq' chain completely,
> you also could do like this:
>
>
>
> boot-image-$(CONFIG_KERNEL_GZIP)         :=3D Image.gz
>    ...
> boot-image-$(CONFIG_KERNEL_ZSTD)         :=3D Image.zst
> boot-image-$(CONFIG_KERNEL_UNCOMPRESSED) :=3D Image
> boot-image-$(CONFIG_RISCV_M_MODE)        :=3D loader.bin
> boot-image-$(CONFIG_ARCH_CANAAN)         :=3D loader.bin
> boot-image-$(CONFIG_EFI_ZBOOT)           :=3D vmlinuz.efi
> boot-image-$(CONFIG_XIP_KERNEL)          :=3D xipImage
>
> KBUILD_IMAGE :=3D $(boot)/$(boot-image-y)

Hi Masahiro and Bj=C3=B6rn.

I like this approach. But I think it doesn't quite do the same when fx.
CONFIG_RISCV_M_MODE=3Dn but CONFIG_ARCH_CANAAN=3Dy which I think is a valid
configuration for the new Kendryte K230 support. In this case boot-image-y
would be overwritten with the loader.bin value even for S-mode kernels.

To keep the previous behaviour we'd need something like

  boot-image-$(CONFIG_RISCV_M_MODE *and* CONFIG_ARCH_CANAAN) :=3D loader.bi=
n

Maybe just

  ifeq ($(CONFIG_RISCV_M_MODE),y)
  boot-image-$(CONFIG_ARCH_CANAAN) :=3D loader.bin
  endif

Do you guys have a better solution?

/Emil

>
>
>
> Emil's current patch will work, of course.
>
>
>
>
> BTW, this patch will conflict with
> 3b938e231b660a278de2988ee77b832d665c5326
> It lands in riscv subsystem.

Oh, you're right. I'll rebase on that for v2, thanks.

/Emil

