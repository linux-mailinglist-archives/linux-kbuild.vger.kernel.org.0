Return-Path: <linux-kbuild+bounces-7133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B8ABA75E
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 02:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E92A03B9561
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 00:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C43D53A7;
	Sat, 17 May 2025 00:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dQLFL/qt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADAB4C97
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 00:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747442207; cv=none; b=ueBocna89CyAHfXbEsAcETzjoXQkXSsvO8Q+4VDxF5P8uG4sEnjmfZRe76DNZMRcVXvgrXXLLZ4nSOHe7/62BHfYNR1AaYeejkgzXIDIIzPeF+9YANUCOJxIv/z1An/fLeRi3Q/gY1QEmo5MiSjDG7SbJHFkqCeRzMzuW2VJYcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747442207; c=relaxed/simple;
	bh=fz7tXqfHdLpyB+vBZ5xt0hghhHnD9GTOoEuMWa62t1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h/Gt4RY+HIK/0FwA3/7H3wCLfNMHlgZ8VqAciNZM33pMQhG74njXvE4Bdk6Nfntw2fx/ROvY3hXu4rfiNUI0PvIzF5TcfX6gVY1ycUyvVLdM1YeqWhOj2srNxfLTBDeicQlp2ayTVUbe2c3kT/JsxCz4Glm7Y8a6zMW8YPs6w90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dQLFL/qt; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47e9fea29easo73511cf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 May 2025 17:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747442204; x=1748047004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xk38n4kXWFo9oAkwKlA6VoS+AvJdSIc09q8LAjGdfKI=;
        b=dQLFL/qtxTHj80oF0lxPbPLa+h+XvNYYYLk+zt9tuNpaMr8BezpfZVrrdrLvkq1yuI
         UXLWSgzDMCh4KgdwW/ebiSkdNpywDuZFiBRRShEhlHoU9y3PF+u5DpuNTUiFw/xl7kN5
         PL+uESgbWjRelUtuYHUnvENMZ0x71MKCq3cMQGzOxvUpfN7FA4Avlw+TcRRAVFBU5kPN
         q138cIyPBD4Lyl4gJzeanzHAOYKunrjaCfGysc5l1s+5zELdylMQ4SrkfZc9n3e7cMUy
         lGWZP7votLfAqeot6/fmJ9c3epLS9L+TKMIxTnQ1kb4z8uR7g0rwgrAd898LEMP2+jux
         BVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747442204; x=1748047004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xk38n4kXWFo9oAkwKlA6VoS+AvJdSIc09q8LAjGdfKI=;
        b=AKTRl6UylHPsvKPUpy1cNurW19mujFgOGHNcAas7Rk/hO2AEJ4UEC+se9ztYDH6ijT
         IOwXW4SAytuV/EMN18h654Bu6qQaTN4JcLc+MlYwo6HMEZSExqKA719a67hxihLHvNyQ
         aL8nxZRoNdws/DnTOSESSMXIbyapSkRTDeY5vqvmavlnUzO1Irp4AXtTffnU8ecvBz0N
         BOraRXFIwgIvlrr+rlZfIBASbTdcuuZUjGnG5wzws8p8Fm4jeu9rDXp4+KD6+T1r8p+J
         HMNBcpPEYUvOk/eNNTwyfwLjscVcFRD56ZCYbz4LN96+4UQmGIa2n+eDD7MYU9C5x9uF
         Go6Q==
X-Gm-Message-State: AOJu0YwoGbM72IHjfADvQDJenMu9c79PfGPbtJhD80xJU3EsKBu2wk1o
	7xovNd8GiEs3PuyccqsZ6WNThdPyWlRJqg7hc/o8povXc6osVEGvYCornPiacfSf6EqlxgFyUWc
	BMm6Ksmalf26Mjf7bHmYoGmSBE0Xtk46zcxu2q4ts
X-Gm-Gg: ASbGncv8LZGcmsOKJYCDhfQj/f05SIJq3AIfAkt9TQU+OR1OMFOJYSF4AX2TedFeFNk
	oPnOUm2gHQIRU16oiXuCjHHJ3u3O/putTGXua2raeK44+JbmizX68i3ZiyoltGV9vKM3khhThlQ
	QhdqCyoQ1KpccwS0gzEcGG3WC9Ig28z8ZH3FqliAIUM7993zhZqo946JENnpjJ+y3JKA==
X-Google-Smtp-Source: AGHT+IHRcm5hrjzTGCj3Jg5WAGWst/cvnduG4u5PDlbgHWS7fC4EsoVspD6x/O/bYSvXOwJh6OgOPWz+VbtTMPzQDKw=
X-Received: by 2002:ac8:57d6:0:b0:471:f34d:1d83 with SMTP id
 d75a77b69052e-49600b8a5eamr685801cf.7.1747442204178; Fri, 16 May 2025
 17:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <e6f335a4-c981-4bb1-8ea4-70e9efc56ae3@suse.cz>
In-Reply-To: <e6f335a4-c981-4bb1-8ea4-70e9efc56ae3@suse.cz>
From: Juan Yescas <jyescas@google.com>
Date: Fri, 16 May 2025 17:36:32 -0700
X-Gm-Features: AX0GCFsdqRI2GzzYVUw8gY-htX1ce-HMYzRLtmTzwzWayza7PQtQkOOKFIaJwbs
Message-ID: <CAJDx_ribK1A1_M=YAW66JBsbmPiPtySXtd0+6WNE8KqeP7Chhg@mail.gmail.com>
Subject: Re: Kconfig for range is being ignored
To: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 6:10=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 5/13/25 22:17, Juan Yescas wrote:
> > Hi Kbuild team,
> >
> > In the patch from below, I am adding a new configuration that depends
> > on ARCH_FORCE_MAX_ORDER.
> >
> > https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com=
/
> >
> > When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER=
 has
> > to be ARCH_FORCE_MAX_ORDER.
> >
> > mm/Kconfig
> >
> > config ARCH_FORCE_MAX_ORDER
> >       int
> > config PAGE_BLOCK_ORDER
> >        int "Page Block Order"
> >        range 1 10 if !ARCH_FORCE_MAX_ORDER
> >        default 10 if !ARCH_FORCE_MAX_ORDER
> >        range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >        default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> >
> > This configuration works on ARM64, however, on powerpc, the restriction=
 is
> > not being respected.
> >
> > The main difference that I see between arch/arm64/Kconfig and
> > arch/powerpc/Kconfig
> > is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
> >
> > https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L163=
7
> > config ARCH_FORCE_MAX_ORDER
> > int
> > default "13" if ARM64_64K_PAGES
> > default "11" if ARM64_16K_PAGES
> > default "10"
>
> I've changed this default "10" to default "8" and
>
> > ARCH=3Darm64 make allmodconfig
> > grep ORDER .config
> CONFIG_ARCH_FORCE_MAX_ORDER=3D8
> CONFIG_PAGE_BLOCK_ORDER=3D10
>
> So I'd say it has the same issue as powerpc, just not obvious due to the
> different default.
>

Thanks Vlastimil for pointing it out.

I tried this config, and I was getting "0" for CONFIG_PAGE_BLOCK_ORDER
for the default ARM64 configuration.

config ARCH_FORCE_MAX_ORDER
  int

config PAGE_BLOCK_ORDER
  int "Page Block Order"
  range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
  default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER

 $ ARCH=3Darm64 make allmodconfig
 $ cat .config | grep PAGE_BLOCK
CONFIG_PAGE_BLOCK_ORDER=3D0
 $ cat .config | grep MAX_ORDER
CONFIG_ARCH_FORCE_MAX_ORDER=3D10

I was expecting to get "10".

> Poking a bit I found this interesting bit in arch/Kconfig:
>
> # Note: arch/$(SRCARCH)/Kconfig needs to be included first so that it can
> # override the default values in this file.
> #
> source "arch/$(SRCARCH)/Kconfig"
>
> Thus I've tried to move the whole config PAGE_BLOCK_ORDER thing from
> mm/Kconfig to arch/Kconfig. But to my surprise it didn't change anything.
>
> AFAICS "config ARCH_MMAP_RND_BITS" is doing very similar stuff than we're
> trying with "config PAGE_BLOCK_ORDER" but it seems to work? I'm puzzled.
>
> > https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L9=
18
> > config ARCH_FORCE_MAX_ORDER
> > int "Order of maximal physically contiguous allocations"
> > range 7 8 if PPC64 && PPC_64K_PAGES
> > default "8" if PPC64 && PPC_64K_PAGES
> > range 12 12 if PPC64 && !PPC_64K_PAGES
> > default "12" if PPC64 && !PPC_64K_PAGES
> > range 8 10 if PPC32 && PPC_16K_PAGES
> >
> > How to reproduce it
> >  $ ARCH=3Dpowerpc make allmodconfig
> >  $ cat .config | grep MAX_ORDER
> > CONFIG_ARCH_FORCE_MAX_ORDER=3D8
> >  $ cat .config | grep PAGE_BLOCK
> > CONFIG_PAGE_BLOCK_ORDER=3D10.   -> This should be 8, NOT 10.
> >
> > Is the Kconfig in this change
> > https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com=
/
> > configured properly? What needs to be changed?
> >
> > Thanks
> > Juan
>

