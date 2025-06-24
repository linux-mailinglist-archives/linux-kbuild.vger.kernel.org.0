Return-Path: <linux-kbuild+bounces-7694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CD1AE6DFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 19:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D364A0D4B
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31FB2E62D5;
	Tue, 24 Jun 2025 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hTqQ0oT2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867B2E62C0;
	Tue, 24 Jun 2025 17:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750787838; cv=none; b=fsk3O/ITaWCVmE1RzmBijO1B4XWdxda+iYEl3l8Fll0ic/iqLxwFIScI5PQLJUQU+wKjscxXhW8SJYYm/wDV3vxxXFfv//Q46QCicIlYK+Hfdd8beu03iLthnMi9RifMQfEgl0eLkx87b8Ln7I/uc9aty4FY6msWIUpSDTQsK04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750787838; c=relaxed/simple;
	bh=JEHWULRoFr8HmcK51IB5pjchZBRZaxJIIXSVSXZMX+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9xGVx/EQYMHkyG+aS6XWm7TFH1SO0uMp8afTJ+KQ6CsQl7RNz9rnFbUlavCkYlvMysrOAx0CnHrqG4wuLNHYDUFM9KNq8VoArtqzlO9VBDC5gcBCUYJwKBnOk1b/5DgtFGQtkhZKI6SKUpTYhU0N8CzgjKttaKBukY3Xu1dF/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hTqQ0oT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E993C4CEF8;
	Tue, 24 Jun 2025 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750787837;
	bh=JEHWULRoFr8HmcK51IB5pjchZBRZaxJIIXSVSXZMX+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hTqQ0oT2eE+n8ekqNRtqT2c9Whh/IcmBrx+9e9aZ2Yn2EcB/uIG+rIQilr9m4YiUm
	 19xY24Ecag+oE8aG7/pDVduLkWY1BIoOs8IWkj5mKmfIuWpaf5YLjlgiW8IGyDuZkr
	 vKYaf8uJC73Itr0rYnttdvJafJ8LWZZrJIBsRKTaRvsZxIyDDj3GixARaAJGYgJwK8
	 UccDEqF6LQqtor9YdeSgXXRWdbEg0MI78opDNTfuJxrcsyWiQ+N1BZ50Wxo+tQY7Ej
	 lBp4xvED0C6YBkqMhdCnHGbusP8NDw9QT+xh0VjTYynyerokjmfZ9zrc92oQTDLd1I
	 hJsGdyd/o1lZw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso1286611fa.0;
        Tue, 24 Jun 2025 10:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7AYOiHosK/w3LizNOzL9ImrpKopMU945RNnTTeG7aGjb2vprlJ/oX9iCqIb0uPT3KOxixU6SH4UR81KM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoBRuLfDeNVfxV7sdKjTImrqQb1rKVwZ9nE24IM21DORXvmhVX
	sOWksEv7y5eHupvvvyxv+T/kbVB8zevz1sZPsiD+tOa+uapQNrmK3IU3te3s8FWXNg/3aEYQhSu
	yQN4uryDgs483xW60CqSk1OC8+GHreU8=
X-Google-Smtp-Source: AGHT+IGq7hissTIkrVJCDOV8p8HRypLn0VmeopkjUXXhsLLPYzSM5f5T0O7Ot9nZ0vtikK/lSezVm3GumAphKV0oQew=
X-Received: by 2002:a05:6512:3c98:b0:553:2154:7bcc with SMTP id
 2adb3069b0e04-554f5ccf99bmr1457634e87.20.1750787836092; Tue, 24 Jun 2025
 10:57:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522172941.1669424-1-jeremy.linton@arm.com>
 <CAK7LNAQzkh+DO7ZBVEgLu63k0H5qB-etV_jpo67k+itLWGAosA@mail.gmail.com> <14f2329f-e110-4f3f-976b-acb38d255798@arm.com>
In-Reply-To: <14f2329f-e110-4f3f-976b-acb38d255798@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 Jun 2025 02:56:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNARG3wO_1R6_n1djbAQVx8=t0aMqAR4aaMUsRDBysSkkfA@mail.gmail.com>
X-Gm-Features: AX0GCFvK0nA7ob0OCVGm5FQUprS6ycScSfAziip_yY57p5OzWJ2IDkXAzRbgpk4
Message-ID: <CAK7LNARG3wO_1R6_n1djbAQVx8=t0aMqAR4aaMUsRDBysSkkfA@mail.gmail.com>
Subject: Re: [PATCH] scripts: add zboot support to extract-vmlinux
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 1:09=E2=80=AFAM Jeremy Linton <jeremy.linton@arm.co=
m> wrote:
>
> Hi,
>
> Thanks for looking at this.
>
> On 6/7/25 11:04 AM, Masahiro Yamada wrote:
> > On Fri, May 23, 2025 at 2:29=E2=80=AFAM Jeremy Linton <jeremy.linton@ar=
m.com> wrote:
> >>
> >> Zboot compressed kernel images are used for arm kernels on various
> >> distros.
> >
> > Are you talking about arm 32 bit here?
> > (arch/arm/boot/zImage)
>
> No, it should be arm64.
>
> >
> >> extract-vmlinux fails with those kernels because the wrapped image is
> >> another PE. While this could be a bit confusing, the tools primary
> >> purpose of unwrapping and decompressing the contained vmlinux image
> >> makes it the obvious place for this functionality.
> >>
> >> Add a 'file' check in check_vmlinux() that detects a contained PE
> >> image before trying readelf. Recent file implementations output
> >> something like:
> >>
> >> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
> >
> > Are you talking about arm64 here?
> >
> > I am confused, as arm64 adopts a simple-compressed image.
>
> No, there is a CONFIG_EFI_ZBOOT, which is a EFI/PE image which self
> decompresses a contained kernel similar to x86, but is for !x86 EFI
> architectures. This patch extends this utility to work for those images
> as well.

The commit description does not explain why this is useful.

Extracing vmlinux ELF is useful for debugging purposes.

In this case, the extracted file is
arch/arm64/boot/vmlinux.bin, which is just a (zero-padded) binary.




>
> >
> >
> > Apparently, this patch did not work for me.
> >
> > $ ./scripts/extract-vmlinux  arch/arm/boot/zImage
> > extract-vmlinux: Cannot find vmlinux.
> >
> > The 'file' command says, it is "data".
> > Is my 'file' command too old?
> >
> > $ file arch/arm/boot/Image
> > arch/arm/boot/Image: data
> >
> >
> >> Which is also a stronger statement than readelf provides so drop that
> >> part of the comment. At the same time this means that kernel images
> >> which don't appear to contain a compressed image will be returned
> >> rather than reporting an error. Which matches the behavior for
> >> existing ELF files.
> >>
> >> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> >> Cc: Ard Biesheuvel <ardb@kernel.org>
> >> ---
> >>   scripts/extract-vmlinux | 9 +++++----
> >>   1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> >> index 8995cd304e6e..edda1abe226c 100755
> >> --- a/scripts/extract-vmlinux
> >> +++ b/scripts/extract-vmlinux
> >> @@ -12,10 +12,11 @@
> >>
> >>   check_vmlinux()
> >>   {
> >> -       # Use readelf to check if it's a valid ELF
> >> -       # TODO: find a better to way to check that it's really vmlinux
> >> -       #       and not just an elf
> >> -       readelf -h $1 > /dev/null 2>&1 || return 1
> >> +       file $1 |grep 'Linux kernel.*boot executable Image' > /dev/nul=
l
> >> +       if [ "$?" -ne "0" ]; then
> >> +               # Use readelf to check if it's a valid ELF, if 'file' =
fails
> >> +               readelf -h $1 > /dev/null 2>&1 || return 1
> >> +       fi
> >>
> >>          cat $1
> >>          exit 0
> >> --
> >> 2.49.0
> >>
> >
> >
>
>


--=20
Best Regards
Masahiro Yamada

