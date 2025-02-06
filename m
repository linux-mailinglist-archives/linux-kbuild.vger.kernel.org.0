Return-Path: <linux-kbuild+bounces-5644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E75C5A2A497
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 10:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33213188831B
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 09:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C5122A4E5;
	Thu,  6 Feb 2025 09:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nR8qDONS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20A2288EF;
	Thu,  6 Feb 2025 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834305; cv=none; b=mtiOf1IrUCAMPZ2R0zoZGio9meJyNTZdnaGZAUerl5kwWF/0l5+X9kQbpmbAFbAZYRVGd4CwghQLYTFbh9l+uv/whcJDYxmfoEETJf7IeDqM9ccOUFW77XpAE8cVsb0Zane12O/qnCz/TBFOFh0U+y8aEC6ScqjN89angzOQQZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834305; c=relaxed/simple;
	bh=Q6AG0Tb6OXFB7wV0ZyGe9g/9r8PLQ/Tcu0VVcSGy51Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpQrZzQu1bc5Btl15ngnmskGGfC8ZZbJlFYi2KyYV5w5nduN+dVeWmOiPa3cZYphOphu5alp1/mp+UlJpW5odlalL+d3upeyIJUDNDBbO5Cnka+vgAt/Q5w7BHtpe45M4qdUxxDPOYWylggy2OqAh8RT2u8rvPqxiGeGC4lJOeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nR8qDONS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C33C4CEE9;
	Thu,  6 Feb 2025 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738834304;
	bh=Q6AG0Tb6OXFB7wV0ZyGe9g/9r8PLQ/Tcu0VVcSGy51Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nR8qDONS6rjfjxa3FFh6nYG9JIMOl4KGAdEs6Jwuugx9stgcrBRv6KO+JuoXcVhwM
	 L7ByfBwuAbpYHIwxiUuBScNnLqW8k9A+xb2fOzdH3swsRIZ98s/f9hTWr+HpDWCB5b
	 FnnB62NPLkcSXnTedhwRApgsTM0fO3JmY7erBPrn38e9SHOK/YdjBTr7TBRUDk1pd1
	 hLjv4ftd0G4B9pS94/RyCozdhkpKYQReRu9A7sJ57GrBt+MBj3mkgbqbdw6/M5wZx5
	 2qFrEe+M3CKA9ptLK+NELwbSJ/ux5BxWRRAeBbDIbqey6iSz4fxcv5ojemIPQRRK4i
	 z4qK1ybB5I4Rg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543e47e93a3so768280e87.2;
        Thu, 06 Feb 2025 01:31:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgVy/3PsLifZER4P18I4NUAqWvgEsNuukrhZ2+wIZUTlRAGeZeyTDBuUbcyV4N/UyxhfFfwXXA9vxNUH4=@vger.kernel.org, AJvYcCVQnZ3xTtPcKCr+nrdxajWBqud9P3bau7suGc9TOHPp34t4UFIcinCrAX7VH39rDmGBogc9IqRO@vger.kernel.org, AJvYcCWrffx/lBU0Omr095cJpOHRQz8HvdjQ2HRWYIGcGnwLCUuKboj0vlSJ2PmNkInjT/PB27Ak4ra+KXgPc7kw@vger.kernel.org
X-Gm-Message-State: AOJu0YwIXmywO2Z26a01s+9RMgOyMOsYUzSnKue6f1SpkrIZxHFImFsi
	XTO2SGbQ0e8015QRHPovWc8HkTIRO82rV7U6GaysozPMDtvahgtrcc+MhOBXLtLaAd6e4G8mRP0
	HBeypzS2+xsAau8Q1NokyT27gZts=
X-Google-Smtp-Source: AGHT+IGebw4cig1cVqkZhlVHDqSescttcHIDn0kzKQ7R63gfmvspIXo0UlAHrss4F8BMyNGjIrTntmAMN/iOtL9dBeQ=
X-Received: by 2002:a05:6512:686:b0:53e:37e4:1457 with SMTP id
 2adb3069b0e04-54405a6c0c4mr2506851e87.33.1738834302634; Thu, 06 Feb 2025
 01:31:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024120635-wham-campsite-b62b@gregkh> <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
In-Reply-To: <F6E14B0130692444+20250206083705.63378-1-wangyuli@uniontech.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 6 Feb 2025 10:31:31 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGJhrwg06Z2X9ZZKQ2XmgQ7N0_D-TJy+iySRmYzOMnGkw@mail.gmail.com>
X-Gm-Features: AWEUYZnQdhaxLOzWRmPZht5-vA_YiVmsBJ92uwDIa3N1IikbOKyDzf36vMWnojY
Message-ID: <CAMj1kXGJhrwg06Z2X9ZZKQ2XmgQ7N0_D-TJy+iySRmYzOMnGkw@mail.gmail.com>
Subject: Re: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where possible
To: WangYuli <wangyuli@uniontech.com>
Cc: gregkh@linuxfoundation.org, chenhuacai@kernel.org, chenhuacai@loongson.cn, 
	kernel@xen0n.name, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, masahiroy@kernel.org, nathan@kernel.org, 
	ndesaulniers@google.com, nicolas@fjasle.eu, sashal@kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Feb 2025 at 09:53, WangYuli <wangyuli@uniontech.com> wrote:
>
> Hi, Greg,
>
> It's rather unfortunate that currently, almost all Linux distributions
> supporting LoongArch are using LTS kernels version v6.6 or older, such as
> openEuler and deepin. [1][2]
>
> If this bugfix isn't merged into linux-stable, then every single distro
> kernel team will have to waste time fixing the same darn bug over and
> over, even though it's already fixed in later kernels.
>
> This would really make LTS look like it's failing to serve its intended
> purpose. And I'm sure all of us do not want to see something so terrible
> happen.
>
> On Fri, Dec 6, 2024 at 9:04=E2=80=AFPM Greg Kroah-Hartman wrote:
> > Odd, why doesn't this affect other arches as well using new binutils?  =
I
> > hate to have to backport all of this just for one arch, as that feels
> > odd.
>
> Could you help me understand why you expressed that you "hate" to have
> to backport something for only one arch?
> Given that we've historically done quite a bit of similar backporting for
> architectures such as arm, powerpc, and x86...It's not exactly unpreceden=
ted.
> I just want to grasp the rationale, as it all seems perfectly justified
> and necessary.
>
> Moreover, with all the active and strict code reviews by all developers,
> such occurrences are not frequent on LoongArch. You could be not exactly
> "always" backporting something like this just for LoongArch, so perhaps
> that might make you and your colleagues feel a little less "hate" :-)
>
> As for your questions on the root cause of the issue and the effectivenes=
s
> of this fix, I reckon Xi Ruoyao's explanation and Ard Biesheuvel's
> supplementary points have already provided ample details. [3][4][5]
>
> If, after your feedback, you still have any lingering doubts regarding th=
e
> issue itself or the LoongArch architecture, I believe that Xi Ruoyao,
> Ard Biesheuvel, and Huacai Chen would all be more than willing to elabora=
te
> further.
>
> I'm bringing this up because we've encountered concrete issues in the
> process of maintaining distributions. Furthermore, as an upstream resourc=
e,
> linux-stable can help us more effectively drive forward community
> development efforts.
> Plus, we realize this benefits all Linux community developers just the sa=
me.
>
> Hoping you could spare a moment from your busy schedule to take another l=
ook
> at this patch series and perhaps reconsider the LTS inclusion of this bug=
fix.
>
> [1]. https://gitee.com/openeuler/kernel/blob/openEuler-25.03/Makefile#L3
> [2]. https://github.com/deepin-community/kernel/blob/linux-6.6.y/Makefile=
#L3
> [3]. https://lore.kernel.org/all/ccb1fa9034b177042db8fcbe7a95a2a5b466dc30=
.camel@xry111.site/
> [4]. https://lore.kernel.org/all/CAMj1kXEV+HC+2HMLhDaLfAufQLrXRs2J7akMNr1=
mjejDYc7kdw@mail.gmail.com/#t
> [5]. https://lore.kernel.org/all/c9a43e5da01ee2215393c0f3c50956171fe660ab=
.camel@xry111.site/
>

You might consider sending a Loongarch-only patch for mainline that
adds weak definitions of these symbols, and backport that to -stable
once it hits Linus's tree. That way, the weak references are always
satisfied, even during the first linker pass.

