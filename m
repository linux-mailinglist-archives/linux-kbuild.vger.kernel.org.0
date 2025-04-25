Return-Path: <linux-kbuild+bounces-6743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3CA9CF9E
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Apr 2025 19:31:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0720216D6FF
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Apr 2025 17:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCB01FBEAC;
	Fri, 25 Apr 2025 17:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vfqak3l1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EF31A5B92
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Apr 2025 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602270; cv=none; b=dD1KY8zpKLVTb84c3N/g6W6HiophhhD9n6Vzup6pcvqTRHZO3HhuWUoi+OQonFhOeqc++7bZu1H8T72T32UL+mWadvrbrYUWYXdlhSqdIQmxYoOTh7VIa89v5ocfOiGZMww2ILwU/3PKvSnzlPRLH35qbkb1Myskh2qorgH58vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602270; c=relaxed/simple;
	bh=3NbOv3sHZFPKjvpBXeb+EJZGD1o21jNZN64WdCPPvks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJmoRNKbC+m1P8ZMgrnBYAsVsh7uA7aig6PPIkCWoOovCg81PevOYgrlJtHDOGlRb5P5lG4Yv4Dym0ajwnV7SlL5Ok/FPqS5GncgmiTkcHKCV0oQkAtaPS0g1RRhGz8UiQ5FGjykKLkgXXINNoUtSAey3p5dg+i28VJoRYD1lms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfqak3l1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe808908so3605e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Apr 2025 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745602266; x=1746207066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JFiaMWMIJ6jFGDzd2ejMDb6Y0fvSj84EWSVaMESBeFo=;
        b=vfqak3l193I4V6WveoPvjBtMTm6p3rwqpKlPn0QOhkYI9bRZwsnrC2wBzrsG+xmZwX
         2n7tiPUBBBnEk8AzjoeP8AEaBwuy0lqgd0k1ttBXrOlYStxQROv0FoLw/ifofoubAjJN
         BAivBxJDT1ulpwC66zV5ulLLS1mypHJH6womgdV2yjd2iXyrQbYJ951wl5E26fxHk2cW
         /pFE2ucIf4R7GbR+zNZb+r+sCjksLN1QFQ/WSdhphm6mhwqq69RuiJW7kyExwsT5tEcR
         A9sTUVLPept9KfIhKc8COc0JSIN/6yf5BBX1l27YAyZa0CvTSEdq4l012DNG7J97zZrw
         br1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602266; x=1746207066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFiaMWMIJ6jFGDzd2ejMDb6Y0fvSj84EWSVaMESBeFo=;
        b=KGHshcO6FCLet2EsrrYGyZVwAXtU7255YRzyxZskT2clWi8RQ62/PEszMSDO7CGgC2
         ejwDXp91B9A5cETjK3KdQFTUNo7Szf5/QYX6YtfP8H29I+ZhjfOUL6CIb87vwBKaiYyV
         9JRKHzlfnnwK/lmHC9LaysYfIpkaAoM0XVEmGGNqYVVtZKDufxBA/S5XXims7NvAYV7C
         stgVs79/uetR4ACnKz++yCO2g0C93NMI5FzDbYBM/zhej4tQezaq6oFMLv4lQfTaXnxn
         Gr37UrYmYaELR4HjWSBzxu07uxafAkOeO49rJoxNWNlJP3Aa7RRZqqn17lkZBHfYHLcV
         nzDA==
X-Forwarded-Encrypted: i=1; AJvYcCUTzLbKwgLP2ZW7TtrfLUFvtep4eaKfoVJe4SFtbe6nqACS8XZXGknzv35zEIiy1zGrPna4XT83dZY/JKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Qns2qXhZoDV7UXp+IbS5fxSOVLaH8EbtKtEwrBKcrU1Z3cPU
	708VIBq3X7FggJS6Ni4jo0Rh5T39WzP1ZCN4tqVU5kL/Lk/R5D8cxQhn6W30tQ==
X-Gm-Gg: ASbGncsA0UNgNha/16PVm925JRGaVBQMf6shuDRebjS+rzEnYCxnkPc1FPvtwJx78+c
	tGYHAKs8CeUU3ljxEtZa1gGRrsGIhL1LuwCmP5Yej8GNT97D7mNAgIpVBPtjJDEkHAaPxDJjCZZ
	OmVXbNo/JiprN47ImQfQRCawrO3SJex9so/FVePay8SXnGiTrx3aH6+3/xFgNOIz4QHkIvEGgu2
	2hTifJtCOkvTWXcNSDoZhlhXrDRAL13YL9zEbhPxKVcTbZQMvDlyo1oEG1xjya68AU22N6GytGP
	7dntfmW1KtJXeztM1QRD67nuiYOABq15dpNCxTqg1zQkvBuvOEAohuBInX93UZarldrWJgO5KXk
	Tt3g=
X-Google-Smtp-Source: AGHT+IEVDVRVuX4opsIX/vqCZ4daSuCP6celTChiSDGf34K1DZrofUU6naynvnVCdNa987Qdas1bbg==
X-Received: by 2002:a05:600c:1c8b:b0:439:8f59:2c56 with SMTP id 5b1f17b1804b1-440abc6d38bmr9835e9.2.1745602266145;
        Fri, 25 Apr 2025 10:31:06 -0700 (PDT)
Received: from google.com (202.88.205.35.bc.googleusercontent.com. [35.205.88.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2dfc2fsm62434785e9.33.2025.04.25.10.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:31:05 -0700 (PDT)
Date: Fri, 25 Apr 2025 17:30:57 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Kees Cook <kees@kernel.org>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
Message-ID: <aAvG0br0XT9BFZ6S@google.com>
References: <20250416180440.231949-1-smostafa@google.com>
 <20250416180440.231949-4-smostafa@google.com>
 <202504161250.CC5C277A@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504161250.CC5C277A@keescook>

On Wed, Apr 16, 2025 at 12:54:21PM -0700, Kees Cook wrote:
> On Wed, Apr 16, 2025 at 06:04:33PM +0000, Mostafa Saleh wrote:
> > Add a new Kconfig CONFIG_UBSAN_KVM_EL2 for KVM which enables
> > UBSAN for EL2 code (in protected/nvhe/hvhe) modes.
> > This will re-use the same checks enabled for the kernel for
> > the hypervisor. The only difference is that for EL2 it always
> > emits a "brk" instead of implementing hooks as the hypervisor
> > can't print reports.
> > 
> > The KVM code will re-use the same code for the kernel
> > "report_ubsan_failure()" so #ifdefs are changed to also have this
> > code for CONFIG_UBSAN_KVM_EL2
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
> >  include/linux/ubsan.h            | 2 +-
> >  lib/Kconfig.ubsan                | 9 +++++++++
> >  lib/ubsan.c                      | 6 ++++--
> >  scripts/Makefile.ubsan           | 5 ++++-
> >  5 files changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> > index b43426a493df..cbe7e12752bc 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> > +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> > @@ -99,3 +99,9 @@ KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS), $(KBUILD_CFLAG
> >  # causes a build failure. Remove profile optimization flags.
> >  KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%, $(KBUILD_CFLAGS))
> >  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
> > +
> > +ifeq ($(CONFIG_UBSAN_KVM_EL2),y)
> > +UBSAN_SANITIZE := y
> > +# Always use brk and not hooks
> > +ccflags-y += $(CFLAGS_UBSAN_FOR_TRAP)
> > +endif
> > diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
> > index c843816f5f68..3ab8d38aedb8 100644
> > --- a/include/linux/ubsan.h
> > +++ b/include/linux/ubsan.h
> > @@ -2,7 +2,7 @@
> >  #ifndef _LINUX_UBSAN_H
> >  #define _LINUX_UBSAN_H
> >  
> > -#ifdef CONFIG_UBSAN_TRAP
> > +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
> >  const char *report_ubsan_failure(u32 check_type);
> >  #else
> >  static inline const char *report_ubsan_failure(u32 check_type)
> > diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> > index 4216b3a4ff21..3878858eb473 100644
> > --- a/lib/Kconfig.ubsan
> > +++ b/lib/Kconfig.ubsan
> > @@ -166,4 +166,13 @@ config TEST_UBSAN
> >  	  This is a test module for UBSAN.
> >  	  It triggers various undefined behavior, and detect it.
> >  
> > +config UBSAN_KVM_EL2
> > +	bool "UBSAN for KVM code at EL2"
> > +	depends on ARM64
> > +	help
> > +	  Enable UBSAN when running on ARM64 with KVM in a split mode
> > +	  (nvhe/hvhe/protected) for the hypervisor code running in EL2.
> > +	  In this mode, any UBSAN violation in EL2 would panic the kernel
> > +	  and information similar to UBSAN_TRAP would be printed.
> > +
> >  endif	# if UBSAN
> > diff --git a/lib/ubsan.c b/lib/ubsan.c
> > index 17993727fc96..a6ca235dd714 100644
> > --- a/lib/ubsan.c
> > +++ b/lib/ubsan.c
> > @@ -19,7 +19,7 @@
> >  
> >  #include "ubsan.h"
> >  
> > -#ifdef CONFIG_UBSAN_TRAP
> > +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
> >  /*
> >   * Only include matches for UBSAN checks that are actually compiled in.
> >   * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
> > @@ -97,7 +97,9 @@ const char *report_ubsan_failure(u32 check_type)
> >  	}
> >  }
> >  
> > -#else
> > +#endif
> > +
> > +#ifndef CONFIG_UBSAN_TRAP
> >  static const char * const type_check_kinds[] = {
> >  	"load of",
> >  	"store to",
> > diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> > index 9e35198edbf0..68af6830af0f 100644
> > --- a/scripts/Makefile.ubsan
> > +++ b/scripts/Makefile.ubsan
> > @@ -1,5 +1,8 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > +#Shared with KVM/arm64
> 
> Nitpick: Please add a space between "#" and "Shared", and end the line
> with "."

I will fix it in v2.

> 
> > +export CFLAGS_UBSAN_FOR_TRAP := $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> > +
> >  # Enable available and selected UBSAN features.
> >  ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
> >  ubsan-cflags-$(CONFIG_UBSAN_BOUNDS_STRICT)	+= -fsanitize=bounds-strict
> > @@ -10,7 +13,7 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
> >  ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
> >  ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
> >  ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
> > -ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> > +ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(CFLAGS_UBSAN_FOR_TRAP)
> 
> Another minor style request: please name this "CFLAGS_UBSAN_TRAP"
> (nothing else in Kconfig uses "FOR" like this, and leaving it off sounds
> more declarative).
I will fix it also in v2.

> 
> >  
> >  export CFLAGS_UBSAN := $(ubsan-cflags-y)
> 
> Otherwise, yes, looks good.
> 
> -- 
> Kees Cook

Thanks,
Mostafa

