Return-Path: <linux-kbuild+bounces-7136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF377ABA886
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 08:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F551BA4626
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 06:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2186F2E628;
	Sat, 17 May 2025 06:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo0tKQ8p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15B72AD0C
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 06:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747464342; cv=none; b=T5pI1Nl2ve5m/cx7JlEV2VbB19Lu22ocdK5rZ8VZ9OV+99N82+Tdu6QSHus5WQaGoBY+cDpBWRXTuNUbJqE474vZ6TU5gPn4BTHstTTkmLHg1AVVedTwUJTGJi9ybOWxrcEdBZGI35G8M2E+FuWoVEjj0cdnhpz2oGHb5fJd7rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747464342; c=relaxed/simple;
	bh=bVvgw2FKPHAUKA7FJKx1pTMT+oH3aZGzPXkvJmfx+vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ze1RgKi+H7JpGiQdsCR3l7M0fN1E1isZ4Am4ri0M9SsENIQy6elyx6JnxrnYJ71p8uw9KjvW9SFeGrL2IouOjW4QROrh9CseDxq+Oci4MkTcASHQEZS6E74E+LGwKrzd6vOSW+yug5CZYyc13lYU5HC6egRhsjN/z9Z/yRmYoCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qo0tKQ8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A36C4CEEB
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 06:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747464341;
	bh=bVvgw2FKPHAUKA7FJKx1pTMT+oH3aZGzPXkvJmfx+vg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qo0tKQ8pi2dLMNRbHdufhZsH1lze22Bo7//Xrkbhrsb3KKyKtH5I+1ccUOlEO8v1n
	 Vwwne0/8fbSQI1TgOn/IjkhMpp5NWBxaETGblCYzDu75BC3kqbEbl6gzxvIB+E7R8V
	 7TKGv4fWFEbYPOyyRdYwwFbtrCNqRm/JzvhhoFO384ocyVyEntQo1Fe/CWJpZeUoRi
	 4h8nIrH18O+KY92UHP3AkdqjBUKMtaE0ax2vW1q/KO/i7hqQChPAyKfg1IzO7Ns+HZ
	 OJOMSUOvOSwVLulxaVTkwS8NF6AVRK19F9y7poPN+UgTnpSYnhVjyOvk2dVdqcZQqy
	 b0W/v3y1lYIBQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54fd1650afdso3569403e87.3
        for <linux-kbuild@vger.kernel.org>; Fri, 16 May 2025 23:45:41 -0700 (PDT)
X-Gm-Message-State: AOJu0Yws8M4SXQ1pVmreNez6nXAJ2TxSNY8zDgZLwuAXzSojg3sjr8GV
	RLRLykmIDEfOUspe9XqBkU6lHQK8HFv0OiwVvDvbvjyv7f8jc4TtAvm3Uhvr3JG6YJ+G9UdPB6l
	obM1eagBPduAB7iSGKgVswmeLd04CmsY=
X-Google-Smtp-Source: AGHT+IEYsPtTSk/9kH8QWyDXVnxp9e7hPjV4cvCSWGrF7mWR2pJLbhKXG1If0cVmRfMbUKjTApCYeilftrtcBIM1G/I=
X-Received: by 2002:a05:6512:640f:b0:545:60b:f38c with SMTP id
 2adb3069b0e04-550e98fbe63mr1772941e87.41.1747464340082; Fri, 16 May 2025
 23:45:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
In-Reply-To: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 17 May 2025 15:45:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
X-Gm-Features: AX0GCFuzuXFHg1Zh3FahIED0ji5QxdeOTXjS7TMJyBN1PoRim00E0dZyKQXnHag
Message-ID: <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
Subject: Re: Kconfig for range is being ignored
To: Juan Yescas <jyescas@google.com>
Cc: linux-kbuild@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>, 
	"T.J. Mercier" <tjmercier@google.com>, Kalesh Singh <kaleshsingh@google.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 5:18=E2=80=AFAM Juan Yescas <jyescas@google.com> wr=
ote:
>
> Hi Kbuild team,
>
> In the patch from below, I am adding a new configuration that depends
> on ARCH_FORCE_MAX_ORDER.
>
> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>
> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER h=
as
> to be ARCH_FORCE_MAX_ORDER.
>
> mm/Kconfig
>
> config ARCH_FORCE_MAX_ORDER
>       int
> config PAGE_BLOCK_ORDER
>        int "Page Block Order"
>        range 1 10 if !ARCH_FORCE_MAX_ORDER
>        default 10 if !ARCH_FORCE_MAX_ORDER


The logical calculations such as "!", "if"
are allowed for bool and tristate types.

Here, ARCH_FORCE_MAX_ORDER is "int".

So, I do not understand what
"!ARCH_FORCE_MAX_ORDER" is intended for.


You are doing what is not supposed to work.









>        range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>        default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>
> This configuration works on ARM64, however, on powerpc, the restriction i=
s
> not being respected.
>
> The main difference that I see between arch/arm64/Kconfig and
> arch/powerpc/Kconfig
> is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
>
> https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
> config ARCH_FORCE_MAX_ORDER
> int
> default "13" if ARM64_64K_PAGES
> default "11" if ARM64_16K_PAGES
> default "10"
>
> https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L918
> config ARCH_FORCE_MAX_ORDER
> int "Order of maximal physically contiguous allocations"
> range 7 8 if PPC64 && PPC_64K_PAGES
> default "8" if PPC64 && PPC_64K_PAGES
> range 12 12 if PPC64 && !PPC_64K_PAGES
> default "12" if PPC64 && !PPC_64K_PAGES
> range 8 10 if PPC32 && PPC_16K_PAGES
>
> How to reproduce it
>  $ ARCH=3Dpowerpc make allmodconfig
>  $ cat .config | grep MAX_ORDER
> CONFIG_ARCH_FORCE_MAX_ORDER=3D8
>  $ cat .config | grep PAGE_BLOCK
> CONFIG_PAGE_BLOCK_ORDER=3D10.   -> This should be 8, NOT 10.
>
> Is the Kconfig in this change
> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
> configured properly? What needs to be changed?
>
> Thanks
> Juan
>


--=20
Best Regards
Masahiro Yamada

