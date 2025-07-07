Return-Path: <linux-kbuild+bounces-7914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F1AFBEA6
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 01:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86FFF1701EC
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 23:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE7F235362;
	Mon,  7 Jul 2025 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7imcRVp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DDD23505E;
	Mon,  7 Jul 2025 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751931351; cv=none; b=cnGq9bISL3JRBL4tOGMJ7PMOvKGEKFd39HqsLbgIdkaqq6gESLA3A41xaa/5qzz1/K8jfysCngX6BPr8kpLe1lD3gFNo0jBFCj6lM122OVsnWJ7NoFmA5XEd1+yXEB+p4XQavEkzHvS0NQAdDfgM5BLrFOPYTcWNdYOqun0yn3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751931351; c=relaxed/simple;
	bh=WDGFw9Gctb4tU/P17uJxRAYYxyAcGafc7AOmFAX1LXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jy+7t6TQLuD8EMzHE6ieIfagxd0ZZN7cTodfwyXzh0RAVPWMEsR/fzgFxzAHSjX5t4ED2MA2+I/BW1HqHbU8Me3uhpa3ojuw4fnlinUdbaNk/ZEIcmJJNWSTEYs5NurLv/Xi00ZGALIZooedbdhZ124C1ZL7MDWxDI+q1R6VACA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7imcRVp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30605C4CEE3;
	Mon,  7 Jul 2025 23:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751931351;
	bh=WDGFw9Gctb4tU/P17uJxRAYYxyAcGafc7AOmFAX1LXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H7imcRVpRrnO8+bEZzq3acHi6ps5xbWAa+/ehalg1ra4dGAikGHivjkw0n2olj/NY
	 5XpEqZfee2c+rhgSGUxGdUnszqIzurqWBwSzsJMuBtxwfLL6IQVh/Lb80Af7aVPMPJ
	 fiWPt9FfTi6w1tvom6SQHOnMFT96okLCZ2ZG9YasE/ON4a7IJ+QA+uXG6f9EFR2iKJ
	 PueGnRPjhWakU6HkLgC+DhC20oI6OrSM/06pKQpaFFKlwATdm/Us+g06ZkKBF4h3ha
	 OOfIGtsAyfFr/DHVVT5IyjKLGw+RrmekNhTt7Wmzxc6VQARxBA/MaPsxI2GuooBHSH
	 SG+XJ22CFjnwQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b165c80cso3693741e87.2;
        Mon, 07 Jul 2025 16:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAW9KfYIN25/Cyvkv/CWOpY7cetaQU3gUkRDcXoCn5i4VlOo5MPQJPmU9G+QpAcVWE5Nlo4+T/TX7pIO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmvkH9UDzJKZxBY1mlFb5wXSqJ2F9nMi7R6PEI9aobHhwOEUUx
	hs2SZ+raO4FFUopypYe9RQgz2FqbCFX/GX9LBoEBiOW+c2jHeHAh1Ga38gzLav0B9OuAsJ+tekx
	ZIf8wEY5QAt8tFvjckhkcKDNqrEZpk+Y=
X-Google-Smtp-Source: AGHT+IHc/wTNsKnt79q8uG+HfpnKMiqpLCdYgtrDe99Kzuo0GGqBH3qbyQfycPR/m9zrF7evFjEQt3Vv82yOr/3CQ9Q=
X-Received: by 2002:a05:6512:3084:b0:553:2ce8:a000 with SMTP id
 2adb3069b0e04-557f836c64emr203640e87.41.1751931349836; Mon, 07 Jul 2025
 16:35:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250522172941.1669424-1-jeremy.linton@arm.com>
 <CAK7LNAQzkh+DO7ZBVEgLu63k0H5qB-etV_jpo67k+itLWGAosA@mail.gmail.com>
 <14f2329f-e110-4f3f-976b-acb38d255798@arm.com> <CAK7LNARG3wO_1R6_n1djbAQVx8=t0aMqAR4aaMUsRDBysSkkfA@mail.gmail.com>
 <4edecc95-0b6e-4365-bc97-d072bb06d79d@arm.com>
In-Reply-To: <4edecc95-0b6e-4365-bc97-d072bb06d79d@arm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 8 Jul 2025 08:35:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=LaMQLqqhG86T9Vk6tZYOYzMsvfm_FtK8sBdL5CGY+A@mail.gmail.com>
X-Gm-Features: Ac12FXx7w0TacWEJ-k1sJSb6LJq1WsxnNhWpbImmkZaLkyp28QcnvRxHusK9wtg
Message-ID: <CAK7LNAR=LaMQLqqhG86T9Vk6tZYOYzMsvfm_FtK8sBdL5CGY+A@mail.gmail.com>
Subject: Re: [PATCH] scripts: add zboot support to extract-vmlinux
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 6:29=E2=80=AFAM Jeremy Linton <jeremy.linton@arm.com=
> wrote:
>
> Hi,
>
> Thanks for looking at this.
>
> On 6/24/25 12:56 PM, Masahiro Yamada wrote:
> > On Tue, Jun 17, 2025 at 1:09=E2=80=AFAM Jeremy Linton <jeremy.linton@ar=
m.com> wrote:
> >>
> >> Hi,
> >>
> >> Thanks for looking at this.
> >>
> >> On 6/7/25 11:04 AM, Masahiro Yamada wrote:
> >>> On Fri, May 23, 2025 at 2:29=E2=80=AFAM Jeremy Linton <jeremy.linton@=
arm.com> wrote:
> >>>>
> >>>> Zboot compressed kernel images are used for arm kernels on various
> >>>> distros.
> >>>
> >>> Are you talking about arm 32 bit here?
> >>> (arch/arm/boot/zImage)
> >>
> >> No, it should be arm64.
> >>
> >>>
> >>>> extract-vmlinux fails with those kernels because the wrapped image i=
s
> >>>> another PE. While this could be a bit confusing, the tools primary
> >>>> purpose of unwrapping and decompressing the contained vmlinux image
> >>>> makes it the obvious place for this functionality.
> >>>>
> >>>> Add a 'file' check in check_vmlinux() that detects a contained PE
> >>>> image before trying readelf. Recent file implementations output
> >>>> something like:
> >>>>
> >>>> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
> >>>
> >>> Are you talking about arm64 here?
> >>>
> >>> I am confused, as arm64 adopts a simple-compressed image.
> >>
> >> No, there is a CONFIG_EFI_ZBOOT, which is a EFI/PE image which self
> >> decompresses a contained kernel similar to x86, but is for !x86 EFI
> >> architectures. This patch extends this utility to work for those image=
s
> >> as well.
> >
> > The commit description does not explain why this is useful.
> >
> > Extracing vmlinux ELF is useful for debugging purposes.
>
> Right,
>
> >
> > In this case, the extracted file is
> > arch/arm64/boot/vmlinux.bin, which is just a (zero-padded) binary.
>
> $ file vmlinux.bin
> vmlinux.bin: Linux kernel ARM64 boot executable Image, little-endian, 4K
> pages
> $ readpe -S vmlinux.bin
> Sections
>      Section
>          Name:                            .text
>          Virtual Size:                    0x2860000 (42336256 bytes)
>          Virtual Address:                 0x10000
>          Size Of Raw Data:                0x2860000 (42336256 bytes)
>          Pointer To Raw Data:             0x10000
>          Number Of Relocations:           0
>          Characteristics:                 0x60000020
>          Characteristic Names
>                                               IMAGE_SCN_CNT_CODE
>                                               IMAGE_SCN_MEM_EXECUTE
> ...(trimming remainder of output)
>
> Its another complete PE boot image which can be used by UEFI/grub/etc as
> well as any PE debugging and analysis utilities.
>
> So, this change effectively removes the zboot wrapper. The resulting
> image is still useful for a certain amount of debugging (ex string
> extraction, manually matching crash points, version checking, etc) in a
> distro based environment where the user doesn't have a kernel build tree
> handy. As well as any boot debugging, which could be caused by the ZBOOT
> wrapper itself, and I'm sure a long list of other things.

OK. Then, please add a little more context regarding
how this is useful in the commit description of v2.

Please fix the first line of the description:

used for arm kernels -> used for arm64 kernels


Lastly, how about this implementation?

check_vmlinux()
{
        if file $1 | grep -q 'Linux kernel.*boot executable Image' ||
                            readelf -h $1 > /dev/null 2>&1; then
                cat $1
                exit 0
        fi
}


I used the -q option for grep instead of the redirection.


Masahiro



--=20
Best Regards
Masahiro Yamada

