Return-Path: <linux-kbuild+bounces-2410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 871769293EC
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 15:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CA6A1F21E11
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 13:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C086BFB5;
	Sat,  6 Jul 2024 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P56CncoS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9DC4C3D0;
	Sat,  6 Jul 2024 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720273863; cv=none; b=P1dhrfkdsHq8HGdf24gf1JgvjUwdBv6xNuwVUIclTrM5LHDk0wonJoo1HjYnpA4c16ARMynB4b6YCHnFDky9VTwvAhopnzygy1nI5c79gBjF0IAE47CQXHQ8pVX/nr0GSujN13+ycmBhq46AiSuA5WQhGvoJlXeSYJyI1w26Mec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720273863; c=relaxed/simple;
	bh=X9vRa17fTy9MnCPbEsacHW0Yq6YdSHQRYPKmU8jUpl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Td36n+GUyIJY0YHaUb0kwjLzZ01mxnUywwui/GqyYL3EerFobGlmuNE0Aw2/UHe7xz8auArOn8Tdtkfg4BLxorsRjL/7JG+tCCOFq3IDwRbOqeplazCEzqv5Z/Zk4qRBVik36r8gw9+13tmx7UttCHLbKsumXX7ps1r5hB/psoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P56CncoS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA9BC4AF0C;
	Sat,  6 Jul 2024 13:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720273863;
	bh=X9vRa17fTy9MnCPbEsacHW0Yq6YdSHQRYPKmU8jUpl4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P56CncoSI+upQ65deMifAigKav0nmp4m+4iIwUIbHtq2Q3Aqvnyzoq9MMLhJjA/d8
	 GddYkhlz/muKY+rEVMPYK+GWpqxj8E6fXSBac2faMpSHo+rJpRbeXTdS8oCwcAqI9d
	 6MwUkwggEGHHAPbfGYIE0uRaPQugnQJqd3sqS8J8chSrFL1XLluP31I1eEM6nXRS+Z
	 DGpj/YWEdCIpttTdvHP2EIzUY5ulhuqpqgkBZRtQC6lGHu5ie8ZMnY/umHzfIamG4e
	 PVTe2owibtz68TrVVSkjMKG2O9qjNMggQZE23fOUhBcNI4no+lO0KtT7TQ7PnoAYG0
	 Fx8lZ7k2is55g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee9b1b422fso4302301fa.0;
        Sat, 06 Jul 2024 06:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVf7jWfTMICsILp02RGJeaA4BuQpjGT1WLgZbV00Cd3ovVdxzCJO+5sscTVGOYacNNaJwba9SBB0tadeXjStBR/hhuPGkwQ+Y/vDw1odkfxui5jHdbsyYoArnhsvf6gSjhVE3m0hJxxcEC
X-Gm-Message-State: AOJu0YzGuybj+VKsMOw6vCJoURcD9kU2Cd8xB7UfZSOM141p7QhoXy4Y
	iuEw+HQGsOxljMoYyYCVN5a8Rtkv1U9gUZSMfflTHyyz4abonhJFqTGI2wEkuBn+hQbLENLgjVE
	uCtZB60aFfF8hGaRpKnRvL4NxW4o=
X-Google-Smtp-Source: AGHT+IFjONZrso8UsJ0ZUhCSnU5Oo3SGE8q0i9xF8cRqaj63wQ+qy5hYgEUSoAmmfcT42fXEYFYgCvCnsJiObr0pRXE=
X-Received: by 2002:a05:6512:34c2:b0:52c:9820:5e52 with SMTP id
 2adb3069b0e04-52ea0e3a7f7mr1582535e87.27.1720273861763; Sat, 06 Jul 2024
 06:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
 <20240702234008.19101-2-richard.weiyang@gmail.com> <CAK7LNAR08Nx3-8XYe4qmUegDFo2zLUvkVdA1t51g1Bamh5Tteg@mail.gmail.com>
 <20240705065456.dogycpd37jun44p5@master> <20240706061236.snp4r2tixx3h7hfe@master>
In-Reply-To: <20240706061236.snp4r2tixx3h7hfe@master>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 6 Jul 2024 22:50:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARX+qxzD-6ip9Q64Bvju3ACQ0uFPThkLgRqvmem-LQ9uw@mail.gmail.com>
Message-ID: <CAK7LNARX+qxzD-6ip9Q64Bvju3ACQ0uFPThkLgRqvmem-LQ9uw@mail.gmail.com>
Subject: Re: [PATCH 2/3] modpost: .meminit.* is not in init section when
 CONFIG_MEMORY_HOTPLUG set
To: Wei Yang <richard.weiyang@gmail.com>
Cc: akpm@linux-foundation.org, nathan@kernel.org, nicolas@fjasle.eu, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 6, 2024 at 3:12=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com>=
 wrote:
>
> On Fri, Jul 05, 2024 at 06:54:56AM +0000, Wei Yang wrote:
> >On Wed, Jul 03, 2024 at 11:44:38PM +0900, Masahiro Yamada wrote:
> >>On Wed, Jul 3, 2024 at 8:40=E2=80=AFAM Wei Yang <richard.weiyang@gmail.=
com> wrote:
> >>>
> >>> .meminit.* is not put into init section when CONFIG_MEMORY_HOTPLUG is
> >>> set, since we define MEM_KEEP()/MEM_DISCARD() according to
> >>> CONFIG_MEMORY_HOTPLUG.
> >>>
> >>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> >>> CC: Mike Rapoport (IBM) <rppt@kernel.org>
> >>> ---
> >>>  scripts/mod/modpost.c | 10 ++++++++++
> >>>  1 file changed, 10 insertions(+)
> >>
> >>
> >>
> >>NACK.
> >>
> >>
> >>The section mismatch is performed _unconditionally_.
> >>
> >>
> >>
> >>In the old days, we did this depending on relevant CONFIG options.
> >>It was more than 15 years ago that we stopped doing that.
> >>
> >>
> >>See this:
> >>
> >>
> >>commit eb8f689046b857874e964463619f09df06d59fad
> >>Author: Sam Ravnborg <sam@ravnborg.org>
> >>Date:   Sun Jan 20 20:07:28 2008 +0100
> >>
> >>    Use separate sections for __dev/__cpu/__mem code/data
> >>
> >>
> >>
> >>
> >>So, if you wanted to check this only when CONFIG_MEMORY_HOTPLUG=3Dn,
> >>you would need to add #ifdef CONFIG_MEMORY_HOTPLUG to include/linux/ini=
t.h
> >>
> >>That is what we did in the Linux 2.6.* era, which had much worse
> >>section mismatch coverage.
> >>
> >
> >Masahiro
> >
> >If you would give me some suggestions, I'd appreciate it a lot.
> >
> >The original thing I want to do is to put function __free_pages_core() i=
n
> >__meminit section, since this function is only used by __init functions =
and
> >in memory_hotplug.c.  This means it is save to release it if
> >CONFIG_MEMORY_HOTPLUG is set.
> >
> >Then I add __meminit to function __free_pages_core() and face the warnin=
g from
> >modpost.
> >
> >  WARNING: modpost: vmlinux: section mismatch in reference: generic_onli=
ne_page+0xa (section: .text) -> __free_pages_core (section: .meminit.text)
> >
> >A .text function calls init code is not proper. Then I add __meminit to
> >generic_online_page too. Then I face this warning from modpost.
> >
> >  WARNING: modpost: vmlinux: generic_online_page: EXPORT_SYMBOL used for=
 init symbol. Remove __init or EXPORT_SYMBOL.
> >
>
> I guess I found the correct way.
>
> Add __ref to generic_online_page to not issue a warning.



Yes, __ref is used to bypass the section mismatch check.

Some functions in mm/memory_hotplug.c are annotated as __ref
to reference __meminit functions.

Adding __ref is the easy solution.



Having said that, I started to think
eb8f689046b857874e964463619f09df06d59fad was the wrong decision.
I will revert it.











--=20
Best Regards
Masahiro Yamada

