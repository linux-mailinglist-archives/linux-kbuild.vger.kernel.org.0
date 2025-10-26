Return-Path: <linux-kbuild+bounces-9284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 222EEC0B6B9
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Oct 2025 00:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0C803B7B75
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Oct 2025 23:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC57F2FE057;
	Sun, 26 Oct 2025 23:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=surgut.co.uk header.i=@surgut.co.uk header.b="hsRGQOKt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC82FFFA6
	for <linux-kbuild@vger.kernel.org>; Sun, 26 Oct 2025 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761519958; cv=none; b=n2OPMZN0979c8babK0so17omlO46bDIyJDmJtRONbWIheXhtgLGrW5W/NFxEbsPgTrPj2z3GbAX+NhyVC+ll0gPLmXeC/kMSdMetnK68gIlUS0XHa9bsgEVbDq+kds10A3BQvVHPmFWvHHIbOfmU6+423FiNEdD16AaGUcQqov4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761519958; c=relaxed/simple;
	bh=PPxjfgh0ouB1LEh9FfKbHQ8cr7KijaRuWZO7sOvIlmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=khYVUhCfgJXtbmsr7RBe/dM1D9PMKf6c2VhuijqKVTUlz41feuqK+XWT0tY6jadZKf9WEWHUW8uSqcWM9f9WshQgXWYXuGekhSi++3E+X9ijAOJTyKIs25WeSCzTkIv1v1VaJhywFQoOt+ZFd/x+rrYfEhMALuuSuINA7Jg5XJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk; spf=pass smtp.mailfrom=surgut.co.uk; dkim=pass (1024-bit key) header.d=surgut.co.uk header.i=@surgut.co.uk header.b=hsRGQOKt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surgut.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surgut.co.uk
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so830320266b.3
        for <linux-kbuild@vger.kernel.org>; Sun, 26 Oct 2025 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=surgut.co.uk; s=google; t=1761519953; x=1762124753; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=is27natm4q82ZfjRueAlfHtVSyQtOlMyTtv22WIryvc=;
        b=hsRGQOKtsSEjTRu6s5t/zHvqNcX0sCsq8Kf6xuP6PWBeV6RPobjEeCz9bADYTOTxAP
         5BNfJSOYYxalwx1oyMUxc66d2ru+sIM32G566vggWn1MbG+SAc5ioifeGBsSrwUQ4PF5
         MdF3ZTZloo4VJYIh/Sr8EuCqX84rpJqjQ3iOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761519953; x=1762124753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=is27natm4q82ZfjRueAlfHtVSyQtOlMyTtv22WIryvc=;
        b=QUknzU98kTKIfoMNYhdQy1VrD/80aoGlTUenUJ4uOTEYUPryv0JGUeGJnxH36pofSo
         awzXiON0V92/tu2PEhTyszHbFyEz6kmiY7Ur4dEfDH17NWX5VmO/h0Hiodf5TgI+gEXb
         KNNdzNBE8ny0ubOAdKm//u79eO9TzAq3P6JxrbUPqy//hsv7QJChbdfCB/34qZiI8/Wh
         VsfQJqHNbCJ9NxZcwLxTaFHpAZ+zo8LFcUu+h2J0mJUYQfCXtq7dILrSBbJpafd5h34/
         K+emYMaGF9zsJ8X026ehave7vmFPKw0Ms9/R6zZkyPR4V74kYRCDF7lR7kkMAgYbVRaA
         8bEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGcheS2hgG5YA79uqMp0mMjUOIYUp+tyu4SoIZUHbj1h1krFW6aGZ5woD9v61k7Ba+bprVju8DyX8S5OA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9qk4vGWFOsoHK0b/+hgt/ZjI9dTNEmCDnnhxNveKcPJNwD3CT
	23p3n5fIfnF/p2CW+ypYiwyLlrHfEQbURxVwr9ykqEEdz5vyGJ53h8Qas54GqMTzpVsqE0oCHlQ
	MOk6frMVxSDk7m2tuhZ0GxPOFCJsq05fduyrY6JMJyQ==
X-Gm-Gg: ASbGncsUjDcLzyFzx3c3z+a1C6csUi7tszCGv9Ao2ym3MA9afl8VMVm8a/LSlCz29cP
	EYQiJ7dh6TMP3ePV7DIaRoBUpaeD33u4zOG/Qdk2EQOkidJnUz7cttSFRZYngEuMqC+1AM41djz
	Q2myudOaTsNSOI56n6KSkWM+ODenvetRgtDpcNy+v2udO96bynRE+O8K6y6dQPE5XlCoT1zUQ9W
	FhhLEcMHZUpXcRF0Rn6cWGKliBn3j2ICiLsuiYvzVq4I4ssT/WkPlN1Jpd/W/PfwurgHxaX0RAE
	srhvlSXfeB1GNDRRdnc=
X-Google-Smtp-Source: AGHT+IE2qeiv6wtEHcxfHTxcz3+g4CqNYkc3SG8aYvr97lhf/t3X5J9M5LV1kA1IPHQlfzD1kGLF4Bc3T0T6p5XwUH0=
X-Received: by 2002:a17:907:1b18:b0:b6d:4080:fdf0 with SMTP id
 a640c23a62f3a-b6d6ff6e411mr962713966b.50.1761519952882; Sun, 26 Oct 2025
 16:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026202100.679989-1-dimitri.ledkov@surgut.co.uk> <20251026215635.GA2368369@ax162>
In-Reply-To: <20251026215635.GA2368369@ax162>
From: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
Date: Sun, 26 Oct 2025 23:05:41 +0000
X-Gm-Features: AWmQ_bk-C6yqRcXuQFysCvIdDTFpFqbzjo0WJC8EN1TlWFS6dNkNgds3DoFI9WM
Message-ID: <CANBHLUikrwQS2UcMa1Ryde3r8mPSTCL1WrObF1qKa+o-=MjN=A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: align modinfo section for Secureboot Authenticode
 EDK2 compat
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	masahiroy@kernel.org, arnd@arndb.de, linux-kbuild@vger.kernel.org, 
	legion@kernel.org, nsc@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Oct 2025 at 21:56, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Dimitri,
>
> On Sun, Oct 26, 2025 at 08:21:00PM +0000, Dimitri John Ledkov wrote:
> > Previously linker scripts would always generate vmlinuz that has sections
> > aligned. And thus padded (correct Authenticode calculation) and unpadded
>
> Was this something that was guaranteed to happen or did it just always
> happen by coincidence? Is there a way to enforce this?

I don't believe this was ever guaranteed, but out of convenience /
performance / compatibility various sections are aligned and padded
already. Thus it is possible that it was an unwritten contract that
all kernels' sections so far have been padded/aligned on many if not
all UEFI platforms.

From time to time, roughly every 3-5 years since 2012, I experience
this class of bugs in various EFI tooling and/or projects. In all
cases projects agree to produce aligned&padded binaries.
Because it is almost no cost to do so, and it prevents head-scratching
debugging.

I don't know of a good way to enforce this, the pesign tool is a good
way to check this -> as it implements the known padded/nopadding
options to calculate the hashes. Maybe some pefile walk script can be
written to validate/test sections at the end of the kernel build. If
such a tool exists, it would be useful for gnu-efi, grub,
systemd-boot, fwupd, and all kernels.

>
> > calculation would be same. As in https://github.com/rhboot/pesign userspace
> > tool would produce the same authenticode digest for both of the following
> > commands:
> >
> >     pesign --padding --hash --in ./arch/x86_64/boot/bzImage
> >     pesign --nopadding --hash --in ./arch/x86_64/boot/bzImage
> >
> > The commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
> > vmlinux.unstripped") added .modinfo section of variable length. Depending
> > on kernel configuration it may or may not be aligned.
> >
> > All userspace signing tooling correctly pads such section to calculation
> > spec compliant authenticode digest.
>
> I might be missing something here but .modinfo should not be in the
> final vmlinux since it gets stripped out via the strip_relocs rule in
> scripts/Makefile.vmlinux. Does this matter because an unaligned .modinfo
> section could potentially leave sections after it in the linker scripts
> unaligned as well?

I am out of my depth here as well, but yes I too am surprised how the
change in question affected the binary.
Note that .modinfo doesn't declare 0 VMA address, and if one sets it
as .modinfo 0 => linking fails due to overlap.
Thus yes, my naive understanding is that presence of this unaligned
section pushed something else to start on an unaligned address, and
that itself was not padded.
Or maybe strip doesn't recalculate things..... but then is it really
strip at this point if we want it to move sections about and
align/padd them, sounds more like linker script at this point.

When I look with objdump at two vmlinux the working and non-working
one, they look almost identical with nothing standing out. But of
course I only see the top level pefile

Possibly a better way to do this is to indeed have dedicated linker
scripts for uncompressed image with extra metadata and debug info;
uncompressed image without extra metadata/debug; compressed image with
debug info; compressed image without debug info => as direct link
targets, rather than link - then - strip.

>
> > However, if bzImage is not further processed and is attempted to be loaded
> > directly by EDK2 firmware, it calculates unpadded Authenticode digest and
>
> Could this affect other bootloaders as well?

Yes. It can affect lots of tooling that works with EFI binaries such
as signing tools, efivars creation tooling, parsing/wrapper tools,
bootloaders, and boot firmware. Given how niche all of this is, and
because the majority of EFI binaries are padded & aligned, it is
highly unusual when an unagling and/or unpadded one is encountered.

> I noticed this report about
> rEFInd and pointed them here in case it was related:
>
> https://lore.kernel.org/CAB95QARfqSUNJCCgyPcTPu0-hk10e-sOVVMrnpKd6OdV_PHrGA@mail.gmail.com/
>
> > fails to correct accept/reject such kernel builds even when propoer
> > Authenticode values are enrolled in db/dbx. One can say EDK2 requires
> > aligned/padded kernels in Secureboot.
> >
> > Thus add ALIGN(8) to the .modinfo section, to esure kernels irrespective of
> > modinfo contents can be loaded by all existing EDK2 firmware builds.
> >
> > Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in vmlinux.unstripped")
>
> I took this change via the Kbuild tree for 6.18-rc1 so I can pick this
> up for kbuild-fixes or Arnd can take this if he has anything pending for
> fixes in the asm-generic tree.
>

This would be very appreciated. Thank you.

> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> > ---
> >  include/asm-generic/vmlinux.lds.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> > index 8a9a2e732a65b..e04d56a5332e6 100644
> > --- a/include/asm-generic/vmlinux.lds.h
> > +++ b/include/asm-generic/vmlinux.lds.h
> > @@ -832,7 +832,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
> >
> >  /* Required sections not related to debugging. */
> >  #define ELF_DETAILS                                                  \
> > -             .modinfo : { *(.modinfo) }                              \
> > +             .modinfo : { *(.modinfo) . = ALIGN(8); }                \
> >               .comment 0 : { *(.comment) }                            \
> >               .symtab 0 : { *(.symtab) }                              \
> >               .strtab 0 : { *(.strtab) }                              \
> > --
> > 2.51.0
> >

-- 
Regards,

Dimitri.

