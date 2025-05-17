Return-Path: <linux-kbuild+bounces-7134-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9D3ABA76D
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 02:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A9B4C70BA
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 00:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C092BD1B;
	Sat, 17 May 2025 00:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cN5W0BNd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EB34B1E72
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 00:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747443398; cv=none; b=hfjYoBPxOM847dhlA6lkq8g3xn0MxukhYI1ByOgMYrBRnMaynAMUH19b31flVQNAKG3frFkcu6ipgsk3EnsYwyI2E20PnKTNabOy0VA2BMhumXdSz7gnLeb0YJO3IGJO+mWgVTvBpxZanqnWWqqGS1keglpds9xfDmweb+KzANk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747443398; c=relaxed/simple;
	bh=frYmUisTeFRCF5P25ctYlbY/J4RaPHAJgKUQOgOPOvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOc0fI5hp5rAtk7xdy2dner89Xy8Py8xfQ/6NYktN+5wm9xig2F1XLBl/Plt+FATaUyg1Jn2TaTCcPVnlNA4agxfAW0pkxiVnhVI5sUcVF95eAJHsakWXYfcpsels+gkZkbBtOOjxxhbAN6UVhfrbPIJuo+/nFBz1zgEawkOJwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cN5W0BNd; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774611d40bso112831cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 16 May 2025 17:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747443396; x=1748048196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4qJFdGXcbmhMxWjdYFPiWX3fZnwkJBWxpfvIOdhX84=;
        b=cN5W0BNdFG8OGjLfnwbryEH6ht4IyqFyEIt9qsNkfhSgthTJX72rdSquIiXuKol6EB
         q7+6EAVid5T9IOwHJZNAyoO6r3YN9yBf7urbK63V91RPp1OnSO7FxonEaIfWMNj27qgK
         sC304O8PVK+YKKTcsFUiyiFM9YQtvQhEoNLCNzU7BWSWJP+uKu6uH/vx4I8upOMBkZoR
         wYzRVyqTRdMT1jpuQqAi+u2MJsemnQ1XeB0tmpxCnUyTVpE/ZFy4IbzmT4iMPUft3Q76
         29YI78YmHLkvvO3X39qiDS45rO6ykQMPmhOFh3yrpc28KNrkGeUey880y0Odvp1zGfHo
         Wc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747443396; x=1748048196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4qJFdGXcbmhMxWjdYFPiWX3fZnwkJBWxpfvIOdhX84=;
        b=uT40FkVHF1robk0MQKOTIaDbMxjk8LjrcYQweFxqeBrcf2vNgKQQtB94P7aF6/hLGo
         YtZmgOrb/HQ3eyb6vEhRRUpkMNiHZ+jBD6y5UrjhmS5uly+XhbUeKL0UcqxtJfKl/thX
         VnAFpV+uHSuSqqa1PyRqB2kBH751tGCyQGIYZl332TNFI1SMr0rUokzpMp/MvSciq1yx
         hVJs3QgpOAxHlI/DgFeFTU2FDw7cW9XjYgG6rLuKPBldv+YTHqmkvhHdKymPaYLBPDfX
         41PsIkYRnE5vn+9Xd/cgtY/1yTICMde5eLBJ8IG4i8Q4I+MfqevHHR1holP+y92F0C4e
         StTg==
X-Forwarded-Encrypted: i=1; AJvYcCX8pFWbn5upX2b82ySvtU+hRR12zymKlAGVx0yMv0B5r3+OkGuokJpaAQ0a+ID4IWluZpjhQK3vMcKAZgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGliGg0ZDf7P8m1KB0GgnienYz3AKvd2icOMllFAFkRcYUOsxv
	McbacLybQtJb4v4XVDllPpDHaQDTpzyi+NkggRFKP7ohpTW+WtCHVGZs6WDEmBha8g59GzDbsbu
	NmzyFxE37/khZ3uEhjdTE3I3loJfT0pAdih3Mcn+V
X-Gm-Gg: ASbGncs8p+XRMsP5QRbmoZwYLRUKKxL8vrf8PHxukHe+1UiWkR/At1IO2fDTypVBnV9
	TYVTIHKyxGEpX+sC53q261qqXrwYjjpoDovBbxpqUYZ9T9UkHbxUGQDzpKl6BeUszp7PWQvtp71
	V2gp4v4Q2nDl9I0DemtozBhAOiBiOOcOweSR//+GasY1kwfJ74WOKIG3vvjH4oNxDcC5Im8zP7B
	RAk
X-Google-Smtp-Source: AGHT+IGfX7eE3qqj/xJAX9zTbQsokvUwY2ezabWCuf/blYWmw87y/jCQ2lEkc/ZgGx5ltZCRO07KIn4MEc3Ki2jtgm8=
X-Received: by 2002:a05:622a:28c:b0:47e:b278:2e07 with SMTP id
 d75a77b69052e-49595c5da5bmr1276071cf.20.1747443395688; Fri, 16 May 2025
 17:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <e6f335a4-c981-4bb1-8ea4-70e9efc56ae3@suse.cz> <f7bb4ac6-af9e-4388-b672-6364f77b975d@redhat.com>
In-Reply-To: <f7bb4ac6-af9e-4388-b672-6364f77b975d@redhat.com>
From: Juan Yescas <jyescas@google.com>
Date: Fri, 16 May 2025 17:56:23 -0700
X-Gm-Features: AX0GCFtkGP5JZPkwLAfiJJRZi1_daD5l143HSnZmtPftOBNMma2T-1pKRvxpMOE
Message-ID: <CAJDx_rhm_4FMNu+Z_B4N5xySJz06BdBWyqGBukiTix5waMEjDA@mail.gmail.com>
Subject: Re: Kconfig for range is being ignored
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 7:14=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 16.05.25 15:10, Vlastimil Babka wrote:
> > On 5/13/25 22:17, Juan Yescas wrote:
> >> Hi Kbuild team,
> >>
> >> In the patch from below, I am adding a new configuration that depends
> >> on ARCH_FORCE_MAX_ORDER.
> >>
> >> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.co=
m/
> >>
> >> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDE=
R has
> >> to be ARCH_FORCE_MAX_ORDER.
> >>
> >> mm/Kconfig
> >>
> >> config ARCH_FORCE_MAX_ORDER
> >>        int
> >> config PAGE_BLOCK_ORDER
> >>         int "Page Block Order"
> >>         range 1 10 if !ARCH_FORCE_MAX_ORDER
> >>         default 10 if !ARCH_FORCE_MAX_ORDER
> >>         range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >>         default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >>
> >> This configuration works on ARM64, however, on powerpc, the restrictio=
n is
> >> not being respected.
> >>
> >> The main difference that I see between arch/arm64/Kconfig and
> >> arch/powerpc/Kconfig
> >> is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
> >>
> >> https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L16=
37
> >> config ARCH_FORCE_MAX_ORDER
> >> int
> >> default "13" if ARM64_64K_PAGES
> >> default "11" if ARM64_16K_PAGES
> >> default "10"
> >
> > I've changed this default "10" to default "8" and
> >
> >> ARCH=3Darm64 make allmodconfig
> >> grep ORDER .config
> > CONFIG_ARCH_FORCE_MAX_ORDER=3D8
> > CONFIG_PAGE_BLOCK_ORDER=3D10
> >
> > So I'd say it has the same issue as powerpc, just not obvious due to th=
e
> > different default.
> >
> > Poking a bit I found this interesting bit in arch/Kconfig:
> >
> > # Note: arch/$(SRCARCH)/Kconfig needs to be included first so that it c=
an
> > # override the default values in this file.
> > #
> > source "arch/$(SRCARCH)/Kconfig"
> >
> > Thus I've tried to move the whole config PAGE_BLOCK_ORDER thing from
> > mm/Kconfig to arch/Kconfig. But to my surprise it didn't change anythin=
g.
> >
> > AFAICS "config ARCH_MMAP_RND_BITS" is doing very similar stuff than we'=
re
> > trying with "config PAGE_BLOCK_ORDER" but it seems to work? I'm puzzled=
.
>
> I have a faint recollection that tests for "!" and numerical values
> has some weird corner cases. I skimmed the docs but didn't immediately
> spot what I was looking for :(
>
> ... or was it, that testing for a config option that is not
> define has weird semantics? But that wouldn't explain what we see here ..=
.
>
> Let me do some more digging.
>

Thanks David for taking a look at it!

> --
> Cheers,
>
> David / dhildenb
>

