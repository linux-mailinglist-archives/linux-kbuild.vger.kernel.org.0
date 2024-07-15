Return-Path: <linux-kbuild+bounces-2529-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD4093163E
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30F6BB2092B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 13:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3622D18E75C;
	Mon, 15 Jul 2024 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCumHgbk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7571741CF;
	Mon, 15 Jul 2024 13:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721051995; cv=none; b=kKNOjcRuXUqIi6omSsDK7zSJK8jqs3ewu3TVrP3zn3wwbS9ctzT08JndZGrFFQhazUS+8lH4vjpNBp2jfi71AKkVN+TJHfytPgYWQJAGVts4dLxbKGK0OmuYBtG6nHsll/lj+9SgIZZOM4eTxtJa7FG7r9O6wAzKbAv7lDKIF9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721051995; c=relaxed/simple;
	bh=lnUbh0906J979Z5Q7efi25eR78VP0Dl8hKI4KVfbbUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ssQ7F9xCDW+ZN/iASR9PFI/li+UgmDVcfEupLYp672YNFzPvlN4+Ou8CTdSaJkU01OR8YZ5rJV+KxKCDVWuDWVnmbtQkBeb6Qmls0xUOW9BzB4L1udzqxCZh1BXkqDyoSBJBxpUi3xmSVysPOP2SrpvC21DJlHRKbEUdlLKTVHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCumHgbk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5966C4AF0D;
	Mon, 15 Jul 2024 13:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721051994;
	bh=lnUbh0906J979Z5Q7efi25eR78VP0Dl8hKI4KVfbbUs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cCumHgbkoC5amDcVIZcR/XyQHgWNlhYdkjDZwyPr2R8wA4+tw8yzSMtuNHXzr6qhk
	 iDW36FEyHKWRZ0tlx+AX+7s8lq6QgU9dxCc7feu29o9r8VU0FYFzxTboX7K1geMkWY
	 7nfbYdtLIwi5P1Ue2cV1yFgWKYmKrlrC8aAy0vW2DSNOdRlQsTzjx0nu4zib70Qazg
	 BVZC7y9mVVA7YXtwUmsZA8epkGJwqr93qBMO3GZUHaaNDCG0bFd28N9gTVfx9i51eD
	 UfuaaXMCS98MjUC11J+CNjnbIni1ohVT10Nyq3/PvnzdDjhWpkIlKWBQWxY0Tt/JMu
	 AaC/iqNA8ZF+A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52eafa1717bso4557670e87.2;
        Mon, 15 Jul 2024 06:59:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7lL0lCBLQikNFwXK8GjkMaZ/uZWKG5bHXErTvW1PZR9yrb+qwPmDcOiF1KYS/iybkea7YLrBN0QroOtg1b2xTiOlo5I/yxJXNBJwDGxjKyl+nnpZ4JNEVzep+0CcSZGPx3e3mDT+n10sU
X-Gm-Message-State: AOJu0YyKS9Lu0bitzKt7n8hNJAoOgXRK7bXysgF2/cYh+c2KdCUEonSQ
	ewGhUi869abVfn93nITqgyLdhnUag+OosPrq2BRbkyzeIhNZUJ2dOPDeV/dJMiGXnHUtX92HdEv
	gg+8m9jLQhwG5bYHjvgIzd93GTb0=
X-Google-Smtp-Source: AGHT+IGaFyh90uplXRgB/hY8U3HSUQG4Qe5ZCmxPfDj6eYceYcjixf7NM9x/SbwzSyC5SHMKUBqVPkfdOhTAd6GCCP0=
X-Received: by 2002:a05:6512:3d01:b0:52b:88c3:b2bc with SMTP id
 2adb3069b0e04-52eb99d151bmr14820662e87.48.1721051993556; Mon, 15 Jul 2024
 06:59:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714105848.1844400-1-masahiroy@kernel.org>
 <87d70313-9c8c-4cdf-a040-7ea31804cad7@arm.com> <ZpUnnYTRX-OkEPHh@J2N7QTR9R3>
In-Reply-To: <ZpUnnYTRX-OkEPHh@J2N7QTR9R3>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 15 Jul 2024 22:59:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyAYahxRakc6tivsxqVOVhXkyCweM8VDKZhP7vWPJpJw@mail.gmail.com>
Message-ID: <CAK7LNAQyAYahxRakc6tivsxqVOVhXkyCweM8VDKZhP7vWPJpJw@mail.gmail.com>
Subject: Re: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
To: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-kbuild@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 10:44=E2=80=AFPM Mark Rutland <mark.rutland@arm.com=
> wrote:
>
> On Mon, Jul 15, 2024 at 08:11:08AM +0530, Anshuman Khandual wrote:
> > On 7/14/24 16:28, Masahiro Yamada wrote:
> > > The condition 'select HAVE_ARCH_KASAN' is always true because
> > > there is 'select HAVE_ARCH_KASAN' statement above.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  arch/arm64/Kconfig | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index c87d16b12e9b..d37cbfc3031e 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -167,9 +167,9 @@ config ARM64
> > >     select HAVE_ARCH_JUMP_LABEL
> > >     select HAVE_ARCH_JUMP_LABEL_RELATIVE
> > >     select HAVE_ARCH_KASAN
> > > -   select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> > > -   select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
> > > -   select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
> > > +   select HAVE_ARCH_KASAN_VMALLOC
> > > +   select HAVE_ARCH_KASAN_SW_TAGS
> > > +   select HAVE_ARCH_KASAN_HW_TAGS if ARM64_MTE
> > >     # Some instrumentation may be unsound, hence EXPERT
> > >     select HAVE_ARCH_KCSAN if EXPERT
> > >     select HAVE_ARCH_KFENCE
> >
> > There is another similar instance with HAVE_FUNCTION_GRAPH_TRACER as we=
ll.
> > Just wondering if the following change should be folded in here ?
> >
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -210,8 +210,8 @@ config ARM64
> >         select HAVE_FTRACE_MCOUNT_RECORD
> >         select HAVE_FUNCTION_TRACER
> >         select HAVE_FUNCTION_ERROR_INJECTION
> > -       select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
> >         select HAVE_FUNCTION_GRAPH_TRACER
> > +       select HAVE_FUNCTION_GRAPH_RETVAL
> >         select HAVE_GCC_PLUGINS
> >         select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
> >                 HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
>
> That looks like a sensible cleanup, but I think it'd be better as a
> separate patch.
>
> It looks like that has always been redundant since it was introduced in
> commit
>
>   3646970322464c21 ("arm64: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL")
>
> ... would you mind spinning a patch?
>
> Mark.


Agree.

We can have a separate patch.


I can see more redundant 'if' and 'depends on'.


For example, KERNEL_MODE_NEON is always 'y'.

config KERNEL_MODE_NEON
     def_bool y



So, I can see redundancy in


     select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON

and

     config EFI
          bool "UEFI runtime support"
          depends on OF && !CPU_BIG_ENDIAN
          depends on KERNEL_MODE_NEON




--=20
Best Regards
Masahiro Yamada

