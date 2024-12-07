Return-Path: <linux-kbuild+bounces-5027-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2F9E7F5B
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2024 10:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 304621689B2
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Dec 2024 09:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A56913C683;
	Sat,  7 Dec 2024 09:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tfg1pyve"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB9200A0;
	Sat,  7 Dec 2024 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733563275; cv=none; b=R7qMuVvH45qbOrtaKKBttwoCIyfybOj7c1r7YETH58cImM7/9YqZfhRP3KZ2k0GvH12uaPxGI8OdeDoyBvV8QzCZ67LQ5U/cN7H+uJlfCUpxtr1tYLPPs2Fgwi5jdHk5jw7SKk2GHGCcNDRZi7JtiINqSFj1WJiLySglrvsq33I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733563275; c=relaxed/simple;
	bh=oXaKWhVppoF+2yB9dqGTHDuejqvmtpaXwKyVrGLxOGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rO1NjB6gtd3iunYWXSUnnFJ08MMZP3PshlmRbeb7eKXutx9O/7OACWhZnOazCwVa6FIuRFobVbQbpenwr+1YQ/7ZwVgyangAQor0q9F+S428X0I9TP683sNGyOa87Ko0LNshKPXFTbDQk5rQvC+FzatHpRCoaAwqKTVSiUPf2Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tfg1pyve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB5DC4CEE1;
	Sat,  7 Dec 2024 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733563274;
	bh=oXaKWhVppoF+2yB9dqGTHDuejqvmtpaXwKyVrGLxOGU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tfg1pyvevvjWCf2RDSvl/KgipCykR46pje2aXZeCN+oZ7ysevjPYeEKjV7hmf13Vm
	 UDbtcUEOgTqbDU+992HUXsR5dOLvN2Y8T7KHRdUWRQ20aL+L8etmZroSgSu3IMPoxE
	 YqyOolei5ii66Y0dqdaR1ALVX9OGtZ5db9NqrAlk47HFDkhCIZmio4/D+Bx1VumDrV
	 XprrVvIBz93s/d8onLivtfz8sf+xyAZETn9+3R08FMV2a6+wA4gk5MQrzLh6xGFkQO
	 tsYUjLy+9v3zJ/P56THOayFw1BsosrrNC3YMiDijy7EWRGhJ54kNM0eVMzeRL9fHcD
	 RtEo8UlGyAaXg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso442285866b.1;
        Sat, 07 Dec 2024 01:21:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaMwb1j5oI6YhZgpr4gyBDS/Oe23EsY9x/jan/6m+t6ugEtBlGeFNJ7kbg7MnnfyKPsNU4oOhFkMFOMBk=@vger.kernel.org, AJvYcCWbdlZpw71Y70d/UK6ymDW+lolLUVL6hwkK45uiFB1XOnGYB5ReSCIDLIc+IABFuOpEnu9/ii9n@vger.kernel.org, AJvYcCWpAIi3vPHIlb8moFZowcflEsqT1neDcl4g4ne1WzFv8ADUDYzjBXOB0I59b47OnwJwK5Zjy5E775yt0dam@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo2DOOyOdXLmkZjlVVvEdgEWaoS2vxxjZIG7/RjPGksWeR9dlH
	mZiAGTbRHELXHRyfgRfynkQwyIzNladYfCHRug3TTue55AFHIRelV+k2Rxej+JfKM5sKqoRyrcC
	DzRt7FB6dJn1sPNssEjPP+bola9U=
X-Google-Smtp-Source: AGHT+IHlVF7tZYrIaLh2jBCm3RKIXfyNIznJWxjjRoEUentLdi1XjsoDPhpixqV8IOPgf2bn437pTpO7hsyeoAen46Q=
X-Received: by 2002:a17:907:90d5:b0:aa6:4671:ddf5 with SMTP id
 a640c23a62f3a-aa646721797mr291560666b.35.1733563272964; Sat, 07 Dec 2024
 01:21:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206085810.112341-1-chenhuacai@loongson.cn> <2024120635-wham-campsite-b62b@gregkh>
In-Reply-To: <2024120635-wham-campsite-b62b@gregkh>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 7 Dec 2024 17:21:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4Db0tVrqcfXHceJeODgnK0ggHpx9_6vwXAAV0LohCD-w@mail.gmail.com>
Message-ID: <CAAhV-H4Db0tVrqcfXHceJeODgnK0ggHpx9_6vwXAAV0LohCD-w@mail.gmail.com>
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where possible
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin <sashal@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, stable@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Greg,

On Fri, Dec 6, 2024 at 9:04=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Dec 06, 2024 at 04:58:07PM +0800, Huacai Chen wrote:
> > Backport this series to 6.1&6.6 because LoongArch gets build errors wit=
h
> > latest binutils which has commit 599df6e2db17d1c4 ("ld, LoongArch: prin=
t
> > error about linking without -fPIC or -fPIE flag in more detail").
> >
> >   CC      .vmlinux.export.o
> >   UPD     include/generated/utsversion.h
> >   CC      init/version-timestamp.o
> >   LD      .tmp_vmlinux.kallsyms1
> > loongarch64-unknown-linux-gnu-ld: kernel/kallsyms.o:(.text+0): relocati=
on R_LARCH_PCALA_HI20 against `kallsyms_markers` can not be used when makin=
g a PIE object; recompile with -fPIE
> > loongarch64-unknown-linux-gnu-ld: kernel/crash_core.o:(.init.text+0x984=
): relocation R_LARCH_PCALA_HI20 against `kallsyms_names` can not be used w=
hen making a PIE object; recompile with -fPIE
> > loongarch64-unknown-linux-gnu-ld: kernel/bpf/btf.o:(.text+0xcc7c): relo=
cation R_LARCH_PCALA_HI20 against `__start_BTF` can not be used when making=
 a PIE object; recompile with -fPIE
> > loongarch64-unknown-linux-gnu-ld: BFD (GNU Binutils) 2.43.50.20241126 a=
ssertion fail ../../bfd/elfnn-loongarch.c:2673
> >
> > In theory 5.10&5.15 also need this, but since LoongArch get upstream at
> > 5.19, so I just ignore them because there is no error report about othe=
r
> > archs now.
>
> Odd, why doesn't this affect other arches as well using new binutils?  I
> hate to have to backport all of this just for one arch, as that feels
> odd.
The related binutils commit is only for LoongArch, so build errors
only occured on LoongArch. I don't know why other archs have no
problem exactly, but may be related to their CFLAGS (for example, if
we disable CONFIG_RELOCATABLE, LoongArch also has no build errors
because CFLAGS changes).

On the other hand, Ard's original patches are not for LoongArch only,
so I think backport to stable branches is also not for LoongArch only.

Huacai

>
> thanks,
>
> greg k-h

