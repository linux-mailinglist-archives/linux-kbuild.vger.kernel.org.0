Return-Path: <linux-kbuild+bounces-7135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BEABA76E
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 02:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76F71A225B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 00:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77ACE2C190;
	Sat, 17 May 2025 00:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UBzPvB3e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA817B67A
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 00:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747443526; cv=none; b=ooZ03aZbnIXJDyK+mv61suGxBxqpxydzF4siERkEoUM16WLjjUAbc/GIyO3/m33Z//OqNF6nXbtwbrZsVqQzeijvRdCUeRRPE0MI17F9YIlTIMgeygfeXiBYPkZncTHFuFxEs4bDVmQjD5ub33enLNWkQR7FsK2mjWKLo4ymS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747443526; c=relaxed/simple;
	bh=khfn5ljnUm+q+0wMcb0WGBFGgs1AmuMUXxpOUTM2X9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+Hdtk/f9KHRui9AK7KwAJJ6RLI4TcstCtVf1wUNnHCgsabkAA3mrhwr99yJDyhMUYI8uNVm51WDd4S9NtZMrhCq2oa808hznm0PQAcdj1sC2ukmxqRSzIwOcNjjaVFDHRIArL58WonYkX760sBXrTZdxecl/ssGDybEw1Bntr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UBzPvB3e; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47e9fea29easo77981cf.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 May 2025 17:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747443523; x=1748048323; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObP7tXoSHaj3JgPmmVBi+8/MyX14r71bBs80zzRrxbE=;
        b=UBzPvB3eOpfpVan/ElQK0cbCJxzPpyJZrKsUP098SXOXUoXEc6tMuAlBPcUPVGi1KH
         fMP0doKk3t7oCO0Ql9LFoQdMe6tYYBBZL0yQKUAHNP5BgGxyW+Ro+UAjphIgMnadJL86
         IYafs8XdIRx2OpDCl3YgPQzHDLP8riTjh87UyJ3fzxvPBpjVbyxNcq+GzUG+p+eeXVKT
         pOieoYyq9aSNcwj3Bs3eZMFW0e0g+lG6mcIOktA24pOfWfUitmNugTp0uPsUBmht8UuL
         gwwu87/+SMv3i+ZC5YObQxoCtZSXSUQ+3X+g4qyscehTSXePSSi0QRfhn8MKy7bMFyvv
         QMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747443523; x=1748048323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObP7tXoSHaj3JgPmmVBi+8/MyX14r71bBs80zzRrxbE=;
        b=w8fwsEo3YXJlLOEj3cy2ksW+sP0g/XM3bApTRQS2C6lLJ+BYLuHGVfoe/lygkQbxYm
         3nrOCLYZuFXRzGlWUWesGShaNMhjTW8XXlLaW/6LgMNNc2ZABdG+no3TFnse1gGNdtK4
         dsjH/+dlSVg1MgXQNeDJYOuChqcD7zgKaGqzB/qUn6j/l8ceVECaGWzgeARdwm1YdN3F
         ICd7y9wceWADhfLMX7Sz176GOYbvWiQAVpTpVxqM/qxc8gxhUQ0H31AfG3hnPGHg/VMh
         gqk6y/1g06UoMe6GWd7lkQ9jbmgMA9N7uJ2/At1LYICBozlyPHs449D5dzj6KdBCLgBK
         8bew==
X-Gm-Message-State: AOJu0YwCXwgdD48qfgh0+/wlduUQRCWF8r6mdqind2JPulAjattbrkdO
	OGVGpw/6FpLP+UovNQ51iGIDS4DsubsO9Ss4+Svtx0Z10Tq395prc2ryL4hr64G3LIoccoMRhbs
	uOjCdXr8HnSABDjhAowACTfhRZZEO3+Qwv+LW4UOG
X-Gm-Gg: ASbGnct4pJjZg7bxaAUuNGnWb5Nhi30C1BbioqzS1zraxp8QylOz/0A2futMJ0XRakU
	PgQsJqNiN1XqKwwYVBcV/KLU9qcd+Cl4Zg35btDJdYPIKPiJe8hNXU0zWaT+n2UTNRKG4n55a4Z
	E9nZhX7Wh+Gtp4MF66yZs5ctFQowS95cC7auJXAct83T8DMRCjdOraM1WSQMw0EyJMFg==
X-Google-Smtp-Source: AGHT+IGsL4Zxoe5b8xnycgBoNTI72G/WmRAU9jd6OXkUTNiTfPT1rP98sCOV/xY00grWqCLfVupm3iQC27mh21OUe8s=
X-Received: by 2002:ac8:5344:0:b0:494:b641:4851 with SMTP id
 d75a77b69052e-49601267af3mr623501cf.27.1747443523125; Fri, 16 May 2025
 17:58:43 -0700 (PDT)
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
Date: Fri, 16 May 2025 17:58:31 -0700
X-Gm-Features: AX0GCFsLLh-q0TXIwYdtf8vCPBA6XZtlzJIUDpB2sJCNejmAx7xfEGtWt52lROk
Message-ID: <CAJDx_rhvBwytc7CFNRBFFoxZuM1dVcP23Oc21ARiGac+94U6Mg@mail.gmail.com>
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

I did this test with ARCH_MMAP_RND_BITS

 $ git diff
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a0ce777f9706..b4ed3c603fbb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -481,6 +481,9 @@ config PGTABLE_LEVELS
        default 2 if !PPC64
        default 4

+config ARCH_MMAP_RND_BITS_DEFAULT
+       default 16
+
 source "arch/powerpc/sysdev/Kconfig"
 source "arch/powerpc/platforms/Kconfig"

 $ ARCH=3Dpowerpc make allmodconfig

 $ cat .config | grep ARCH_MMAP_RND_BITS
CONFIG_ARCH_MMAP_RND_BITS_MAX=3D29
CONFIG_ARCH_MMAP_RND_BITS_MIN=3D14
CONFIG_ARCH_MMAP_RND_BITS_DEFAULT=3D16
CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
CONFIG_ARCH_MMAP_RND_BITS=3D14

I was expecting CONFIG_ARCH_MMAP_RND_BITS to be "16"
but it was "14". Is this correct?

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

