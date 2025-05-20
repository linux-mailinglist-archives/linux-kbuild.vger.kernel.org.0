Return-Path: <linux-kbuild+bounces-7186-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBCBABE815
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 01:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE3E44C6CCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 23:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB031E570B;
	Tue, 20 May 2025 23:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bqn09syT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625B0635
	for <linux-kbuild@vger.kernel.org>; Tue, 20 May 2025 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747784036; cv=none; b=M9yzOfu6QpvBma+YMsPN5IeSr2ZEqVvckmqYFPahfh7WKyjow2fEywcIE4lhHV0uL3B3Ud545ci+GtXz0l7Q7R6tP8mW+hsS7z+XDpuEqGklovi/4sTCXqp90shfyotLEL2pssgjyYx1IZIzIIOMxm7pdvRgb8dG4V9xiD8RjiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747784036; c=relaxed/simple;
	bh=IVeYwkL035CvAxD2iwND8xM5J0jDmmxK1+634uI+Ggs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHcnrkUQ5FxJECOztoFfRyZvL/XxqgruMkgq+DrmU6lDo5MKMlkoqG2XMV1HRD+cYBuotqp+ZppSRJWquCTBfx+EExJgFeOVanVhh1hdvS2msYZBOZ/7JlB6GPO9a04YRaHOcILeVlT16Bzw1pP7nK74pKJSxwzmitI6DMr9blc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bqn09syT; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-48b7747f881so1248891cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 20 May 2025 16:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747784033; x=1748388833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II9Do6TW9EBU8ibTUUm3sCf4IxzSAfULAAFF3HMJQKY=;
        b=bqn09syTeQjv6Io7N3JjcBk7gEWfr9HIuABtlO+PWHxA8EhivgBU7kUz2R/YybOd6j
         da/jTrSrnkGGOADqFxH/gu3K0S/+rdv9Ato5ubDNoN4To29e7BRBF4LXGb5CfI7yUncD
         IH1stuRSl4BPNpuOMYl+cAek8Hmg+fXozDx4vlpHAramix5ot0OwDlqxoaiqpFDy4u0b
         BmoxuyooT9OGr/dop3wSZPeHGfibD8dM16XVhicn+SOqyIAj2G2BhlIftdpGFYeXZAqY
         QbEPTQyOVvOHlrq09kOewuc1ULvrIsXuBGhYS+DTlEO9UpYj3A/T7LpzwbXEC2DcqyRM
         wIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747784033; x=1748388833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=II9Do6TW9EBU8ibTUUm3sCf4IxzSAfULAAFF3HMJQKY=;
        b=qFTRs3yQpeROE0UMMiiUmp7TeTy8Cjry4/xAn8+WYzpCrF3EQH0SJTXnWcUr/0LrvS
         B6tMcxkE04f3XdnmINcMQvplc9v9xHTZVHNkaupln/VXbY6hJyCS1lSWc6weWvQIu2uj
         Jh7Gub8mTvODBpvKTwk82IlghkVEJ+S9I6S6fUvAgkBKQP4SmkOhLObPT6gU9xdZ2Qy3
         +5CvWBiRYoBz6y2dB3xk4MrKu7lXxgfu0PZXzQco/r7Di4T9xHB4MZ3gy63tJsN4sPT1
         C0WyUYiv3xQPRW2UBWUFcSjwnVs6PaFuw1z7ASEl9kUNUsj6z+r4XrNoCVEXu9P7/9xl
         R0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXyzl/kIFV5m7ohyJhkqXPyuoZRVclI6s52SKnvggWw/a88Fi0SZ9iB+YWwkbkSDGqapWa3pgPsS3tnJdY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxym+YNNv3abfMSFkNGoBYqNk1eb2VkmvR1mRqrfRfNYRPPga4U
	/yO8GSKTLQCgvnQKKotAtYCJOx6ktKGru6VtvkdA2v5EdADm67vtBVPVoA0LEFyp/C1STgMYD1F
	3bc0RjPRzLwMXfruj8iiaZo4zQhGNC1gYEVcNbrO6
X-Gm-Gg: ASbGnctqHuTzPQoDGCAYQVNckSCrAzkx0AtoiGfe49Tm+H0GeMztDwbd/JDTDYBqYMC
	DxJR2hz4E+2CbbVXv7HbmOuPTKEmT9oPjOTZ4HzE7IMz1fbgtokkjEfYHygPbuFOwAvGn7FOUa1
	Z/YHLuslUl/WYb3zRvG5bn5ZPvb3n19pZKpA/rUcoPoWNyPictoTalafzBPCJG54y8jn7vUqRZ
X-Google-Smtp-Source: AGHT+IGTLbuuFCBQtOosSspUjP57q7yPIZ0QFmTVjvE33JI4s3NkubF2mZL+OS3+QFcf6qJX+Zefr7BY2tDpmWDqZWg=
X-Received: by 2002:ac8:5a8e:0:b0:477:8686:901d with SMTP id
 d75a77b69052e-495ff6d3f0dmr12969991cf.1.1747784032853; Tue, 20 May 2025
 16:33:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
 <438DD530-00EA-4F7E-9CC0-A1274400DD84@nvidia.com> <86B954BA-2AF7-46F8-8C56-966D24889139@nvidia.com>
In-Reply-To: <86B954BA-2AF7-46F8-8C56-966D24889139@nvidia.com>
From: Juan Yescas <jyescas@google.com>
Date: Tue, 20 May 2025 16:33:41 -0700
X-Gm-Features: AX0GCFuZH2Ag61uPgFasz7h-8ZYTcY50lxKt8BiAZ-Jnm485UQo96g77s_Vky54
Message-ID: <CAJDx_rim5BjvBzRmU-d5KWTF4ALHfnA_1_UYtqwKUkRjvNec6Q@mail.gmail.com>
Subject: Re: Kconfig for range is being ignored
To: Zi Yan <ziy@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 11:46=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>
> On 17 May 2025, at 14:42, Zi Yan wrote:
>
> > On 17 May 2025, at 2:45, Masahiro Yamada wrote:
> >
> >> On Wed, May 14, 2025 at 5:18=E2=80=AFAM Juan Yescas <jyescas@google.co=
m> wrote:
> >>>
> >>> Hi Kbuild team,
> >>>
> >>> In the patch from below, I am adding a new configuration that depends
> >>> on ARCH_FORCE_MAX_ORDER.
> >>>
> >>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.c=
om/
> >>>
> >>> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORD=
ER has
> >>> to be ARCH_FORCE_MAX_ORDER.
> >>>
> >>> mm/Kconfig
> >>>
> >>> config ARCH_FORCE_MAX_ORDER
> >>>       int
> >>> config PAGE_BLOCK_ORDER
> >>>        int "Page Block Order"
> >>>        range 1 10 if !ARCH_FORCE_MAX_ORDER
> >>>        default 10 if !ARCH_FORCE_MAX_ORDER
> >>
> >>
> >> The logical calculations such as "!", "if"
> >> are allowed for bool and tristate types.
> >>
> >> Here, ARCH_FORCE_MAX_ORDER is "int".
> >>
> >> So, I do not understand what
> >> "!ARCH_FORCE_MAX_ORDER" is intended for.
> >
> > It is intended for when ARCH_FORCE_MAX_ORDER is not set
> > in arch/*/Kconfig and has value 0. Would
> > if ARCH_FORCE_MAX_ORDER =3D=3D 0 work?
>
> if ARCH_FORCE_MAX_ORDER =3D 0 and if ARCH_FORCE_MAX_ORDER !=3D 0
> work.
>

Thanks Zi, this works.

> >
> >>
> >>
> >> You are doing what is not supposed to work.
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >>>        range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >>>        default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >>>
> >>> This configuration works on ARM64, however, on powerpc, the restricti=
on is
> >>> not being respected.
> >>>
> >>> The main difference that I see between arch/arm64/Kconfig and
> >>> arch/powerpc/Kconfig
> >>> is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
> >>>
> >>> https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1=
637
> >>> config ARCH_FORCE_MAX_ORDER
> >>> int
> >>> default "13" if ARM64_64K_PAGES
> >>> default "11" if ARM64_16K_PAGES
> >>> default "10"
> >>>
> >>> https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#=
L918
> >>> config ARCH_FORCE_MAX_ORDER
> >>> int "Order of maximal physically contiguous allocations"
> >>> range 7 8 if PPC64 && PPC_64K_PAGES
> >>> default "8" if PPC64 && PPC_64K_PAGES
> >>> range 12 12 if PPC64 && !PPC_64K_PAGES
> >>> default "12" if PPC64 && !PPC_64K_PAGES
> >>> range 8 10 if PPC32 && PPC_16K_PAGES
> >>>
> >>> How to reproduce it
> >>>  $ ARCH=3Dpowerpc make allmodconfig
> >>>  $ cat .config | grep MAX_ORDER
> >>> CONFIG_ARCH_FORCE_MAX_ORDER=3D8
> >>>  $ cat .config | grep PAGE_BLOCK
> >>> CONFIG_PAGE_BLOCK_ORDER=3D10.   -> This should be 8, NOT 10.
> >>>
> >>> Is the Kconfig in this change
> >>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.c=
om/
> >>> configured properly? What needs to be changed?
> >>>
> >>> Thanks
> >>> Juan
> >>>
> >>
> >>
> >> --
> >> Best Regards
> >> Masahiro Yamada
> >
> >
> > --
> > Best Regards,
> > Yan, Zi
>
>
> --
> Best Regards,
> Yan, Zi

