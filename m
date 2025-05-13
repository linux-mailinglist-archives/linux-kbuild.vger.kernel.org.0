Return-Path: <linux-kbuild+bounces-7096-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A47FAB5D98
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 22:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E291B44CE9
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 May 2025 20:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5856F1E5734;
	Tue, 13 May 2025 20:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g7ClsNqZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90BD53365
	for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 20:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747167492; cv=none; b=i5wZyEDCPnCMS+Qzdlp2ezQ/Su+UNoWKOaI6A/ENOEXk9b+40pz3LUv1w4TJbBBoh/ngw6RoORPTJwCVlQA7P4mEX6SsaFhtPRpHZqUPTnUwwzi8F0QLnDjOcS2r3cGRFveu2S9TNoC5s6b38+IHLn/iT3vwDUf2UzQb5Mn/yao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747167492; c=relaxed/simple;
	bh=OJwf1gtrdOmEhHBqP9wFleegBTEbOGMxB+QBp4GPBy4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gt/eKdL0Z10J9dN5oP48bwT4yjmqmQZm+/5WwC1S2ZwxxsjrvjSBKe6Sk/fuarJ1N0+ASQtbkwi6w0Dh/VQRJPXmhCmuVP5QM4mrpmbPdh6TiPBFnZLh4XVCRS2u4uZaT3YJRIzBkrbRZhGJc9nNxa60VcHny9CogL4ZCrX3AIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g7ClsNqZ; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-48b7747f881so7981cf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 May 2025 13:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747167489; x=1747772289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QKsWC1u9X6eSVEPOec0CVbM42qOzgIx89b27GhS8NEI=;
        b=g7ClsNqZyUsh/xx4wbXrLm/9fNlPsNHpufguCXw0ABTf4D10RsHqZ6Ws5EPT9mZtPi
         zi1W0sg+0biKXaPSjNCfk05BZ2YCwNI984EC4mJt4VELpg1GKOGBwtYaxDJ7l0nQldRF
         HaSKwiIUy521NASaxJgGW9vSlA8uGohkekhN6hDyKiehJyoFat0M4BT20C6l58Mq9lnt
         XYEiCTTUjArAuXGBgOsWyD+kjnEyr1ylMn5KhKnFO0JCcgK/TmFFhEeAHM21RcK8xb7Y
         GSE8MoMBd7Mn4HwcJFIPtq2VD9fi5pINtH80Pv4lE9KhkoihFA7uBPVA/dfqDjLPDZDW
         GihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747167489; x=1747772289;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKsWC1u9X6eSVEPOec0CVbM42qOzgIx89b27GhS8NEI=;
        b=qamKYIi/GA5CsA/KJyzblEWFlt6FyEorWxAdZFZhwXZdqvIhq8WZadxVrKfYuhzLCX
         VePd0LeItyuNgFA9HoxHAox97usLlm/s3/mamwmdBXhKLfbvnK7CPBawZ+PEub2sJ+Ix
         QLplHkqlUHoJaFkDEcQHAPXjSrncP144MnjB0vwzhTU0FTjPG40ebcLWQl4FRrhQX2O4
         WHFceA3M2ebErTS1RRrn0er0jsC4vQBJlKW5/e1ybRKAc/rIhMPLHJJzB7/p8mgr2VbH
         vKFp2s6PWZoazuCwuC4vxLblHoPRaFZHUanA+oI+0BQ2smQdrW8NoryEw+IHbDTY7mDi
         DQOg==
X-Gm-Message-State: AOJu0YynsFLrYmdxPd0/JZYJzVfkBJs0KmzCE14gpokFy6Fiuu9LiH4t
	K2OJCCt6HWLC+9K6SQWzbhBkeIvqzspO3dQTvhF1WBtcPF38N6M4gppYhy3unElukoTxpBHaCX7
	Jq+eKPN2MBdmieBrtseHgBPQKzJPERm4cDehLvs8vX5nd5eZK0sdGsaIkjwY=
X-Gm-Gg: ASbGncs3v5IkXVt32Vnse+pgYT6KXFx675d1K0Q1g92zojs9Uw8Mij0DsyFG/tcGYL4
	jdh2gqWVxRX0dIUSFlH9jhaLSzp/EqEnyaIkkOzPMdivWyQW4ck4OV6AtBBRrK0IzFyt1ieOKsT
	aNu7ytcr7mvbfU39LucUz4ZcrgstgdPOtYAPomioNHdiwvLB//SVjnsIKtshgbQmg=
X-Google-Smtp-Source: AGHT+IGEtUrn9XfdTBXRqAN2YkrqX6c6hwoMmWOXAJ+dYk39cUO+JymlWd0u0hNCUeCe28uXlvLjHIF9E0I3gGOsgjY=
X-Received: by 2002:a05:622a:486:b0:474:fb73:6988 with SMTP id
 d75a77b69052e-49496168ee5mr1047121cf.24.1747167488798; Tue, 13 May 2025
 13:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Juan Yescas <jyescas@google.com>
Date: Tue, 13 May 2025 13:17:57 -0700
X-Gm-Features: AX0GCFtnQh3cBk6lPh07x_W0a0iviqJ84geEfWk1lHFPPqHMzAlD04cGac9wdIk
Message-ID: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
Subject: Kconfig for range is being ignored
To: linux-kbuild@vger.kernel.org
Cc: Suren Baghdasaryan <surenb@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kbuild team,

In the patch from below, I am adding a new configuration that depends
on ARCH_FORCE_MAX_ORDER.

https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/

When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER has
to be ARCH_FORCE_MAX_ORDER.

mm/Kconfig

config ARCH_FORCE_MAX_ORDER
      int
config PAGE_BLOCK_ORDER
       int "Page Block Order"
       range 1 10 if !ARCH_FORCE_MAX_ORDER
       default 10 if !ARCH_FORCE_MAX_ORDER
       range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
       default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER

This configuration works on ARM64, however, on powerpc, the restriction is
not being respected.

The main difference that I see between arch/arm64/Kconfig and
arch/powerpc/Kconfig
is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig

https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
config ARCH_FORCE_MAX_ORDER
int
default "13" if ARM64_64K_PAGES
default "11" if ARM64_16K_PAGES
default "10"

https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L918
config ARCH_FORCE_MAX_ORDER
int "Order of maximal physically contiguous allocations"
range 7 8 if PPC64 && PPC_64K_PAGES
default "8" if PPC64 && PPC_64K_PAGES
range 12 12 if PPC64 && !PPC_64K_PAGES
default "12" if PPC64 && !PPC_64K_PAGES
range 8 10 if PPC32 && PPC_16K_PAGES

How to reproduce it
 $ ARCH=powerpc make allmodconfig
 $ cat .config | grep MAX_ORDER
CONFIG_ARCH_FORCE_MAX_ORDER=8
 $ cat .config | grep PAGE_BLOCK
CONFIG_PAGE_BLOCK_ORDER=10.   -> This should be 8, NOT 10.

Is the Kconfig in this change
https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
configured properly? What needs to be changed?

Thanks
Juan

