Return-Path: <linux-kbuild+bounces-2528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B9931629
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 15:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158E01C21DBA
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 13:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40C918E777;
	Mon, 15 Jul 2024 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1ist1Ng"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE118E75C;
	Mon, 15 Jul 2024 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721051772; cv=none; b=HCFqR1RRgZl/dpCQ33iHuc0kZBu3RIauCHW9l/Ih6KIYitmOwiWrYtZDKTRLskXJgQJtbmS7tE7x+yp5V0a1A/FOSRkMSixDvUU8RTSdyMcZDXt1DfHC0w75RwEfcGb96RBg3vom2u0PFdx/LpcMdBLlbVGPatgttJ/9PVbHG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721051772; c=relaxed/simple;
	bh=M7dTi/l8wr+R+cCgvmMoNrDflWm1Z3z/TlQD3srnwvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5P5dQhXLFJhKDXUqySE2edCw3LLXk1A7EVQk2IpagvVOEIW3xwRmvA+973LddGiDzg2q2ljBpU2C50iZTHTmc/R40py0iRuVnjLDphRTxpBNuGpS8I6UY8gn9NNIUitnZ0HWUSfsGXAQ9WLJQrl+GXF5G/GtNvGpF8es1Odp80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t1ist1Ng; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0DFAC4AF0D;
	Mon, 15 Jul 2024 13:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721051772;
	bh=M7dTi/l8wr+R+cCgvmMoNrDflWm1Z3z/TlQD3srnwvg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t1ist1NgIF6KIHRkbwiZkAIXV4h5a/3EvbAIUKGVPl/dM0Zd3R76ML1EEpKDJEbor
	 y/FBCA5/OwRwtqtRgTsVfCGueKfqs4mnXeY75sHfPnQybCXATa0gaACoQoYXOGtOd+
	 37OIMy1fujIilzj3PX74nt47wmSLCHCrAAtwPcWyp1/wIyGJKcNlFwtZf70/IxIO6P
	 /NsSdeg+1izH11mEI8G/F0Sq9WS17sSnjFq0L0gRPE4AFDYIt2/6/idR/l5lhAvCb2
	 qOhXGwafB4LCBwktl7P+o7f1CEboKTck5cavc5wEx8EzXML4IHj40TD4IWlVVrhSA2
	 gWni+VI+vXI3Q==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eedebccfa4so22920171fa.1;
        Mon, 15 Jul 2024 06:56:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4DqZnI+bvMPwgHGXivQE0YVyN9HqBfmaaBLwO8Hp8Gpwn4ON9UOKbjViylHkJmgc6UqL1w6xepOZ99JVu8pqbrdrDLeZsMkykqAXR
X-Gm-Message-State: AOJu0YwH34oLgAyVO/Zj/7tAJtdsZ8yvZjL3dBGTE+IRMG2gS15vMp+J
	mfPnlVPmb8DLr/yTyRND5mQE/O8Zdb5yiG5gjqH9feGcy/hbo85dxg5nRcGLTiKPHhf2q+4nAE2
	nOH9y7VVnmVStawieEwHb6/vUT1Y=
X-Google-Smtp-Source: AGHT+IFbHSMVCFKYrE2QR7ssYrdThQpWI/p5nmm7ZjAaZSznRhTIl+Skf5Fv9bivm37FdEAub1Lufde4DF4FMRIp8Qo=
X-Received: by 2002:a05:6512:3b20:b0:52c:adc4:137c with SMTP id
 2adb3069b0e04-52eb99949a2mr14011033e87.20.1721051770687; Mon, 15 Jul 2024
 06:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714105848.1844400-1-masahiroy@kernel.org> <ZpUkTZYt5DSHP5aP@J2N7QTR9R3>
In-Reply-To: <ZpUkTZYt5DSHP5aP@J2N7QTR9R3>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 22:55:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2Jwe2jJLbX=murdgmWu2Yy8a2vcPuMhQBffqZHo_=jw@mail.gmail.com>
Message-ID: <CAK7LNAQ2Jwe2jJLbX=murdgmWu2Yy8a2vcPuMhQBffqZHo_=jw@mail.gmail.com>
Subject: Re: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 10:29=E2=80=AFPM Mark Rutland <mark.rutland@arm.com=
> wrote:
>
> On Sun, Jul 14, 2024 at 07:58:46PM +0900, Masahiro Yamada wrote:
> > The condition 'select HAVE_ARCH_KASAN' is always true because
> > there is 'select HAVE_ARCH_KASAN' statement above.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Looks like we forgot to simplify this in commit:
>
>   0383808e4d99ac31 ("arm64: kasan: Reduce minimum shadow alignment and en=
able 5 level paging")
>
> ... where we began selecting HAVE_ARCH_KASAN unconditionally.


Good point. This may be worth recording in the description.

I will send v2 with a typo fixed.

Thanks.



>
> FWIW:
>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>
> Mark.
>
> > ---
> >
> >  arch/arm64/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index c87d16b12e9b..d37cbfc3031e 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -167,9 +167,9 @@ config ARM64
> >       select HAVE_ARCH_JUMP_LABEL
> >       select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >       select HAVE_ARCH_KASAN
> > -     select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> > -     select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
> > -     select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
> > +     select HAVE_ARCH_KASAN_VMALLOC
> > +     select HAVE_ARCH_KASAN_SW_TAGS
> > +     select HAVE_ARCH_KASAN_HW_TAGS if ARM64_MTE
> >       # Some instrumentation may be unsound, hence EXPERT
> >       select HAVE_ARCH_KCSAN if EXPERT
> >       select HAVE_ARCH_KFENCE
> > --
> > 2.43.0
> >
> >
>


--=20
Best Regards
Masahiro Yamada

