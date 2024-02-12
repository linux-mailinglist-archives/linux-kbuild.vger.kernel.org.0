Return-Path: <linux-kbuild+bounces-896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BED8520D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Feb 2024 22:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899291C20A4D
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Feb 2024 21:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708704D135;
	Mon, 12 Feb 2024 21:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wD7rETtq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29BB4C63F
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2024 21:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707775171; cv=none; b=VLhhW06tLDKJfIBR+ApwW62CfIu055n6DGBA8pc/eO9UjVp9nfILsV2PrUnrttX6P1xwnat+lQ09irORD2k8agyUkovb5bhdA+J1AOQRQYnGKt+do6yCAAjU8JjQFZP4ojmF188RHmwM+8hsddSXxGIv4azDK5C1eAGraDI8mmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707775171; c=relaxed/simple;
	bh=b+F7pcUkc0r1mBK4PMiDYHZh9PrP/YYZbjdLAkDYuqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWlS2gP4h0MMZVhupMbmqtojkjrA8GMpzUAcTmOXBRMkEwaLFQ2WKoU+Bwttvf0cWAFDe+Xup22XqGu3wqKBOaYF2I3yVV+g0gwN1qrSuSjbfksBgQMt6HlEM0kFISVtZerurkyMpOnUGzNlgFUiSOCRtCTkblIaB3vQ83arpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wD7rETtq; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-561f0f116ecso770a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2024 13:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707775168; x=1708379968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAP8ciFMVXJQebx3ikecm7gfdkfYQjqo8DHa2ep2azc=;
        b=wD7rETtqM4/AXpgyBmUXVB/RxvDASj96OA3fpDl+l5zIbLSdb2C0yABKfNBMEjYSqs
         rfQiDnPfueMDBAMjO1KbdmkGrdOZ09tar1O03kWVwt4ZiU97GErY0Omh/MGe2Q4LnfM4
         jJNJjI0tlhXOthnkMk0Ahe/wofJhKaSVCGCbLhKQ9VVpdZ8etBcjVJ1EMkrkaiTZHTvf
         L78ZFoMBAFWoLO/wCpCUXtTUn4cfRpHsSFXYmAXnyDkMvteofbst609rR49o0IX2uC9i
         4oveUekPtgh8KGmqyLwmG1DkP0eHTOZER0wkpekaD8m1Fha5z7i14z44ZpdbBknobU4C
         s1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707775168; x=1708379968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAP8ciFMVXJQebx3ikecm7gfdkfYQjqo8DHa2ep2azc=;
        b=UNf2gjkNEQuDobvNBwuHKs37TRx+Oesc6C/lPqgtPL4JH5re/U8IL6E/7G7LbBeT/4
         5/S9m+dmcuYHXLLGsrTiZJ0mC/4o7IUCrMqlRPeMqCBuFbQRencPLKl6SGbZJ5CAcbb1
         ixDnk/yloqPOVaZWzm3hTtaGeoeZLAXL2gRVLNJqCZYWyZ8h5JlmFXc8ptElSOX65zvU
         9uXca+FGQrPxjuYvSBEg3u+Rd5nA+N4yA2apYOP2VzU9+ziopfb++n49sOilak/d5QkZ
         5mlfECaYQ5lpAiMFAtgwgAu/AzZrrMfD2c+CxXsGoV4rM4xVHy3LLafFJ/nk8Jb3EZOT
         RiqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj8ro1AXhemmR22DP8WSqu2sqWG7tw+aO5dX6Jy+6qjHolyjeEMo9LCqSn2UwbBrCk0/GQqbuFeBlp7Ch1nwzYJTaRxHXLhTTgvvCt
X-Gm-Message-State: AOJu0YzMoFXVZKCuaQaoBrXgTtSCyTOeYOekoV12m8lnDGPrOTtJmGJj
	koAKdKI08aU5t8ssPMh1D2hAf+wo9WSj9Pl7nV2s9jyVRTlc4l0BXUqQQds5oHllmq7xAP9fCNQ
	O4tSaCsnuKGfTlrSMUz0b+yoBkEkGWpSTDvBw
X-Google-Smtp-Source: AGHT+IHVMdtdCGzIfHivtEQ0BtRleckWRpXt904pHGON8MVFD17b2K8kzlWT2wyZJMxj43kyZ4tIOGfpdJ4L3KikWtM=
X-Received: by 2002:a50:f615:0:b0:561:d84d:f6ce with SMTP id
 c21-20020a50f615000000b00561d84df6cemr22522edn.6.1707775167821; Mon, 12 Feb
 2024 13:59:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208012057.2754421-2-yshuiv7@gmail.com> <CAK7LNAT0KT7sbZJZNXtq5waM-UjUm4zHyf9xHZc3uHLvZ_eAfA@mail.gmail.com>
In-Reply-To: <CAK7LNAT0KT7sbZJZNXtq5waM-UjUm4zHyf9xHZc3uHLvZ_eAfA@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Mon, 12 Feb 2024 13:59:13 -0800
Message-ID: <CAFP8O3Kqx-gdTBFn_hesWzd-6NCpGEz1=fMoJXuX+n4c7sp0Bw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix building with LLVM on NixOS
To: Yuxuan Shui <yshuiv7@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, nathan@kernel.org, 
	nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 1:30=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> +Cc: Fangrui Song <maskray@google.com>
>
>
>
> On Thu, Feb 8, 2024 at 10:22=E2=80=AFAM Yuxuan Shui <yshuiv7@gmail.com> w=
rote:
> >
> > NixOS is designed to have immutable packages, and explicit dependencies=
.
> > It allows multiple different versions of the same shared library to
> > co-exist in its file system.
> >
> > Each application built with Nix, the NixOS package manager, will have
> > paths to its dependency shared libraries hardcoded into its executable,
> > this includes the dynamic linker. To achieve this, Nix adds a
> > --dynamic-linker linker flag when building any application.
> >
> > This isn't a problem if the kernel is built with ld.bfd, because ld.bfd
> > ignores the --dynamic-linker flag when the resulting binary doesn't hav=
e
> > a DT_NEEDED entry. However, ld.lld respects --dynamic-linker
> > unconditionally, which breaks linking in several cases.
> >
> > This commit adds an explicit --no-dynamic-linker flag which overrides
> > the flag added by Nix.
>
>
>
> I expect some Acks from LLVM folks (especially, from Frangrui)
> if this is the right thing to do.

GNU ld seems to ignore --dynamic-linker for a position-dependent
executable (ET_EXEC) when there is no DT_NEEDED entry.
ld.lld respects --dynamic-linker in this case. Before this kernel
report, I do not know any user inconvenienced by this difference.
(mold respects --dynamic-linker as well.)
This could be helpful to test an executable with PT_INTERP but no DT_NEEDED=
.

I think this patch does not fix non-x86 builds.
It feels to me that NixOS should provide a linker wrapper that does
not force --dynamic-linker=3D.
While it's extremely uncommon (and generally not recommended), certain
programs invoke the linker directly (instead of using a compiler
driver).
Such programs would run into a problem when they make a
position-dependent executable with no dependency as well.
I don't feel that NixOS forcing --dynamic-linker=3D is enough
justification to change linkers.

> > Signed-off-by: Yuxuan Shui <yshuiv7@gmail.com>
> > ---
> >  Makefile                      | 3 +++
> >  arch/x86/boot/Makefile        | 2 +-
> >  arch/x86/realmode/rm/Makefile | 2 +-
> >  3 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index a171eafce2a3b..10ed19caecb1b 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -531,6 +531,9 @@ RUSTFLAGS_KERNEL =3D
> >  AFLAGS_KERNEL  =3D
> >  LDFLAGS_vmlinux =3D
> >
> > +LDFLAGS_MODULE +=3D --no-dynamic-linker
> > +LDFLAGS_vmlinux +=3D --no-dynamic-linker
> > +
> >  # Use USERINCLUDE when you must reference the UAPI directories only.
> >  USERINCLUDE    :=3D \
> >                 -I$(srctree)/arch/$(SRCARCH)/include/uapi \
> > diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> > index 3cece19b74732..390a4604166eb 100644
> > --- a/arch/x86/boot/Makefile
> > +++ b/arch/x86/boot/Makefile
> > @@ -102,7 +102,7 @@ $(obj)/zoffset.h: $(obj)/compressed/vmlinux FORCE
> >  AFLAGS_header.o +=3D -I$(objtree)/$(obj)
> >  $(obj)/header.o: $(obj)/zoffset.h
> >
> > -LDFLAGS_setup.elf      :=3D -m elf_i386 -z noexecstack -T
> > +LDFLAGS_setup.elf      :=3D --no-dynamic-linker -m elf_i386 -z noexecs=
tack -T
> >  $(obj)/setup.elf: $(src)/setup.ld $(SETUP_OBJS) FORCE
> >         $(call if_changed,ld)
> >
> > diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makef=
ile
> > index f614009d3e4e2..4b42006d9ce02 100644
> > --- a/arch/x86/realmode/rm/Makefile
> > +++ b/arch/x86/realmode/rm/Makefile
> > @@ -50,7 +50,7 @@ $(obj)/pasyms.h: $(REALMODE_OBJS) FORCE
> >  targets +=3D realmode.lds
> >  $(obj)/realmode.lds: $(obj)/pasyms.h
> >
> > -LDFLAGS_realmode.elf :=3D -m elf_i386 --emit-relocs -T
> > +LDFLAGS_realmode.elf :=3D --no-dynamic-linker -m elf_i386 --emit-reloc=
s -T
> >  CPPFLAGS_realmode.lds +=3D -P -C -I$(objtree)/$(obj)
> >
> >  targets +=3D realmode.elf
> > --
> > 2.43.0
> >
>
>
> --
> Best Regards
> Masahiro Yamada
>


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF

