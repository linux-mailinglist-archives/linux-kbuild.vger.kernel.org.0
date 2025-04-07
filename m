Return-Path: <linux-kbuild+bounces-6481-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9DA7D77D
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 10:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98FDA7A3794
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 08:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6C6226D03;
	Mon,  7 Apr 2025 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YYwi1oc0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F2D211A0B
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Apr 2025 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013726; cv=none; b=Qx0HxqvxvmgFwVn/oxfsKco6ystWS4l4kyi0TL0ymqz2SD176bOnm4AjTvycjNTKlvJHx3aiJdV71F9nO204we77hSF3+TBDRLNgBjRsB8FTC/nG3H847tUpREnd5PlzyZ84xwIKcaftomnaKzvLhc1AK5uKGsOscJzMIfnsz9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013726; c=relaxed/simple;
	bh=7eKwR+8NelLDqbmRwgY2SrOwJJmgSMiDGnzt6L51nLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5pvv2SFFCHZ3yr2YxOR9N+ItCBfHLSoT/1kp7i7gsbF8pTWXRUGKaw+oUUCTx9gNbVBGyBJr/X0HWVsDatNZSiuMDiyJx7g0yrNyzRSXJSrUczByG6NoXVYQl0hqSrghjDFnCEIGaSmr+5E/pOEXoJU0wLYVNFg+IDT9zoX+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=YYwi1oc0; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso6648374a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Apr 2025 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744013722; x=1744618522; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxhNXhmOXrXU9cn3uuap3d3f1w/9DGD5pG/vOAg+GCU=;
        b=YYwi1oc0edop/Av6fSOshDK2XvLhHx/X1pdYQfkv3n0Mtd7JUFaxmTBkwfnIgtUINR
         EayPdUV46tfcXzwNS32vprlnmr25IvKLSDb5eEpaINdTlE3nmrv5kw0pfIIpASzfX7vU
         AtP0bwpTELTB0xfR6oG4yLF+v4Cl318a5797Zb78XX4UkcqpBo+bnu+L4lMMBeP9VqOf
         n6eT1JnePywHVn25oQij55/2jVwORFV62hV+NjxQz+ZM0ggcICSQZWMPEX0bOWLA0N3D
         +i9QeX9bncGroT5P+aGd2bhnWGpw5VN2oi1LsaNITE0PQV1pc8MTGBtLJSA9ULPuqUDD
         ID+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013722; x=1744618522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxhNXhmOXrXU9cn3uuap3d3f1w/9DGD5pG/vOAg+GCU=;
        b=mh0B2yijHaGMFcetP9dSVT9IBkh4cwWAQmP/5N7zgo2xoIArryo0jSbztOJ35eZnNi
         aPxRkLgF3skhUIIPF3WOZBwYC5YCb4pT20uQyzUXNp8tmlQl+3/R1ubY5/uT2bSg5dwK
         Qtjd/GOTs0z3pauyGtV90upVej5MMlFwKzNCulg/2puZ0gXz70b9Rnmtu/kZR27W/eOE
         ke6ur+NY9iPM3m+3wNx0oMPcpMUgt8kLRpgjGj0w245THp/SKivNSVXEM7m3r3IH3UCZ
         uwMer/hdT2r+7O9kU7xg/KDHF7eTfCMl34MgBSdn57dCvGtXs56ZFdnGmQWa+O2+5MH1
         vWFw==
X-Forwarded-Encrypted: i=1; AJvYcCUVbCZ5ef0oX23vQD38XBMF2pv7G0KMYPROg6e14JsuMSi/3TzqBATJwn5G9/1GtunC4lg2hiBQ1y41FjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrJDZNSvMuLeekq7NEVcrOg2UGx68+O6G2Eo2zkZxY5+j2kBE
	hvjJ3LHMyATTLqjBsrhJj/6sfGPHZYy5dUPrluxL03yn6Ve9pVvjxD37ewDMgkG2Iv8djUPwk9O
	BcY9c7pyU+MTgp3gs0UNp2UellZzgtE01CZSiAA==
X-Gm-Gg: ASbGnctJmamlrTbUBBWkOgH+2JPgoitTyU/YPuZXGXFV7mfUFMqK47JyD5dGqt3vpvP
	o8loIL5xTUR6/grfUwtp1htadj5J3vUyYOgNsUD+n3ML5xV5Uvd+s4MgSbPS+S+5d3D6Hc0eueJ
	kWnNOj6OmXd3ezrUFklkUodszOdjCRpNqASYpDbMd5193FynEmDx/+EMFe
X-Google-Smtp-Source: AGHT+IGgzEsWY+FDt77Og8y5aNWXUnnOo8nRCNX9z9AS6T2kxW12Ew+hSRh5KhztpZghUinGFQgeBKUpUrZ7kM/dDF0=
X-Received: by 2002:a05:6402:3489:b0:5de:c9d0:6742 with SMTP id
 4fb4d7f45d1cf-5f0db80a5ebmr5551794a12.9.1744013722372; Mon, 07 Apr 2025
 01:15:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
 <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr> <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
In-Reply-To: <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 7 Apr 2025 10:15:11 +0200
X-Gm-Features: ATxdqUF5a3kGXRp3r7uxE0Bhe9AOdQ046v-EZyv9hJ2EImaWyVHa56ABPSTHfBg
Message-ID: <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, Apr 4, 2025 at 5:25=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Apr 4, 2025 at 12:45=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > Hi Ard,
> >
> > On 03/04/2025 17:11, Ard Biesheuvel wrote:
> > > On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com>=
 wrote:
> > >> riscv uses the .rela.dyn section to relocate the kernel at runtime b=
ut
> > >> that section is stripped from vmlinux. That prevents kexec to
> > >> successfully load vmlinux since it does not contain the relocations =
info
> > >> needed.
> > >>
> > > Maybe explain that .rela.dyn contains runtime relocations, which are
> > > only emitted if they are actually needed - as opposed to the static
> > > relocations that are not emitted as SHF_ALLOC sections, and are not
> > > considered to be part of the runtime image in the first place.
> >
> >
> > Ok I'll do.
> >
> >
> > > It
> > > would be nice if we could use --remove-relocations=3D here, which onl=
y
> > > removes static relocations, but unfortunately, llvm-objcopy does not
> > > support this.
> > >
> > > Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn and
> > > .relr.dyn, as they all carry runtime relocations.
> >
> >
> > Ok, I'll add them to the next version.
> >
> >
> > >
> > > Finally, I'd be curious to know why RISC-V relies on --emit-relocs in
> > > the first place? Is the relocs check really needed? If not, it would
> > > be a nice opportunity to get rid of Makefile.postlink entirely.
> >
> >
> > So I had to check and it happens that this was an issue with the
> > toolchain, I should check if that still happens with newer ones.
> >
> > commit 559d1e45a16dcf1542e430ea3dce9ab625be98d0
> > Author: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Date:   Wed Mar 29 06:53:29 2023 +0200
> >
> >      riscv: Use --emit-relocs in order to move .rela.dyn in init
>
>
>
>
> So,
>
> Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move
> .rela.dyn in init")
>
> Is this the correct tag?

This is the initial culprit yes, but if we use this tag, the fix won't
apply. So I decided to pick Ard's patch so that this fix can be easily
backported to 6.14, and I'll come up with a new version for previous
releases. Is that ok with you?

Thanks,

Alex

>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

