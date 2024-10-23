Return-Path: <linux-kbuild+bounces-4246-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA1B9ABC54
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 05:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C7AF1F21C15
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 03:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DD952F88;
	Wed, 23 Oct 2024 03:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMbGgl1r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4021139E;
	Wed, 23 Oct 2024 03:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729654777; cv=none; b=HvYySJ+miV9LipBvsD0ezLMu53qQKFjKqWHSt/V9oJegpK0jpgCxFch/XRTvJDIdsx/U6ow4rnusbQnybIfyqW8eqhY+BUyd+cIR+0GfJj/KgO8jKyR2iVu8DqlbBdzr57o1Zgjm7vLTKcb6+ypqOoEQ3Gni6SRP6Tc/6CrT4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729654777; c=relaxed/simple;
	bh=bWPXaO4wbrblRneGFGhxY6y52ljzyNu1a9lMENWtzF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adn2jb1Dp+Q5zqdg30Q20+mMSFq+aPgUsnD+9Eck9MyIXHP7W8Sr3Sa3/o/IIzRE3QXjYBI7yPcPTs4Vbr51DsNlkiYoFax0YhERjQIOzHJbwnHwTmZulHkYLNB4fyfWKqrgGN9CBWMEAxVWI/6kbYcqCdzeogkF3oAdbynuIsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMbGgl1r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3BCC4CEEA;
	Wed, 23 Oct 2024 03:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729654777;
	bh=bWPXaO4wbrblRneGFGhxY6y52ljzyNu1a9lMENWtzF4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NMbGgl1rC4inH6PxlOEXvcJmBAxCl6uUSUt3u440jrxNzRbIvipfTburDVG36qWIz
	 dOH5tCe0jeeQu2qUtiucym/nNrH3mfKIRGqeBuHG03gWzecaumFM8VdW7iN1EjvHQB
	 Zl0tJP3xE4E+zvJ9Ks/Hj5osIqFBP1XQqbc01oSOim7Ewx6SR3ss2WxOWBpjsXUDKV
	 aUol+ev7DeDfi/8WnNC50TdnM8pinD7lvK1acWwLmTStFSsSpbXudvyo8wBkwRAPly
	 eXdd21EgRGXmZ48oAJhS6x02md1QbRmGSPjPogPFdHsjc8FQ+ATnJOn+HijVBb0duA
	 dvfEhR4RymRlg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso49900621fa.1;
        Tue, 22 Oct 2024 20:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULVt8CZF9wuq7zeYLg+Ezce7DQ4k5G6x8lyqK3yfVCowH70E4YbE+1M1AAv1OijaYRU89B+MKDTAGUkA==@vger.kernel.org, AJvYcCUsMOtCrxmeN4Q7pGrotUWa3U3alWojAnx0Qb06UqVjiOb0L3i2Z6cYtMGSDuQjO7EWhJru3v74le8r5yBq@vger.kernel.org, AJvYcCXp6O+5nAPJHUDAj+ws+qcscnh+lj4Nk8sdWcNuXZwxOcNGdQe8OuTMCkpTNrWjRsTjgdJE9ZTMwEk4bdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd8aXVzxh/4bK7+SWXL6ONDGNw4hHDEIwsHPnXbBK1gdjMHAbB
	9V9kOEuctyseJ60mhnAglmxe0M6o7vxF/a8WBmrzgYJldwAZ6rAxveEpA5CGxT28+jP0p6U0SKw
	dvr9UuqpTcTlQbPOnnf5GRRGZRy0=
X-Google-Smtp-Source: AGHT+IG1m1c8WF9Ifm54MlXWxXbh0iMTPKQYEttQXsWIzvLY4nWYZZl7/oT+dYwJAZTktYREhgohpTAT6LM7SU3MG0Q=
X-Received: by 2002:a05:6512:2304:b0:536:54db:ddd0 with SMTP id
 2adb3069b0e04-53b1a2405f9mr421331e87.0.1729654776050; Tue, 22 Oct 2024
 20:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20241021201657.GA898643@thelio-3990X> <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
 <20241022200732.GA487584@thelio-3990X> <etezvjy_HnDpgOTBrzap29if1ChFBhl1RawcNJK3UAsFk6i_g_cyHoz7hlqfYqASgJZ97W4HxnGA-nbCXL73pIRN9tUKUttAp1JefMRp8rs=@protonmail.com>
In-Reply-To: <etezvjy_HnDpgOTBrzap29if1ChFBhl1RawcNJK3UAsFk6i_g_cyHoz7hlqfYqASgJZ97W4HxnGA-nbCXL73pIRN9tUKUttAp1JefMRp8rs=@protonmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 12:38:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbFeJc9Y=BFY85SwESUKNNDTRDunyLGveDusC--NVkCw@mail.gmail.com>
Message-ID: <CAK7LNASbFeJc9Y=BFY85SwESUKNNDTRDunyLGveDusC--NVkCw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
To: Koakuma <koachan@protonmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 9:44=E2=80=AFAM Koakuma <koachan@protonmail.com> wr=
ote:
>
> Nathan Chancellor <nathan@kernel.org> wrote:
> > Koakuma might know more than I do but I did not test either the
> > integrated assembler or the rest of the LLVM tools; I only tested clang
> > for CC. As far as I am aware, that has been where most of the effort in
> > llvm-project has been going and I think there are probably other fixes
> > that will be needed for the other tools. The command I tested was:
> >
> > $ make -skj"$(nproc)" \
> > ARCH=3Dsparc64 \
> > CC=3Dclang \
> > CROSS_COMPILE=3Dsparc64-linux-gnu- \
> > LLVM_IAS=3D0 \
> > mrproper defconfig all
> >
> > I see this as more of a stepping stone series to make testing those
> > other components easier as time goes on, hence why I did not really
> > consider user facing documentation either like you brought up in the
> > other thread.
> >
> > Cheers,
> > Nathan
>
> Ah, pardon me for forgetting to say it in the cover letter.
> But yeah. At the moment only clang as CC works, all other LLVM tools are =
still
> incomplete and need some work to be able to build the kernel, so these pa=
tches
> indeed are intended as stepping stones to make it easier to work on
> the rest of the tools.
>
> I'm not sure if I should update the documentation now given that LLVM sup=
port
> is nowhere near as complete as other architectures, but I'll do it if nee=
ded...

Nathan said he was able to build the kernel.


If so, I think this should be documented (required LLVM version and
the supported build command),
otherwise people cannot test this patch.




Anyway, the sparc subsystem is maintained.
I hope Andreas can take a look.



commit eb5b0f9812fff72f82e6ecc9ad4dafaf4971a16a
Merge: 4ffc45808373 d21dffe51baa
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Sep 25 11:21:06 2024 -0700

    Merge tag 'sparc-for-6.12-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc

    Pull sparc32 update from Andreas Larsson:

     - Remove an unused variable for sparc32

    * tag 'sparc-for-6.12-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc:
      arch/sparc: remove unused varible paddrbase in function leon_swprobe(=
)

commit 7dd894c1bf65a9591ba27f6175cf3238748deb47
Merge: 1c7d0c3af5cc a3da15389112
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu Jul 18 15:48:41 2024 -0700

    Merge tag 'sparc-for-6.11-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc

    Pull sparc updates from Andreas Larsson:

     - Add MODULE_DESCRIPTION for a number of sbus drivers

     - Fix linking error for large sparc32 kernels

     - Fix incorrect functions signature and prototype warnings for sparc64

    * tag 'sparc-for-6.11-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/alarsson/linux-sparc:
      sparc64: Fix prototype warnings in hibernate.c
      sparc64: Fix prototype warning for prom_get_mmu_ihandle
      sparc64: Fix incorrect function signature and add prototype for
prom_cif_init
      sparc64: Fix prototype warnings for floppy_64.h
      sparc32: Fix truncated relocation errors when linking large kernels
      sbus: add missing MODULE_DESCRIPTION() macros


--=20
Best Regards
Masahiro Yamada

