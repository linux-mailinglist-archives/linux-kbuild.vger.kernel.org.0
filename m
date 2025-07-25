Return-Path: <linux-kbuild+bounces-8158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5132B11865
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 08:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83D39586958
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 06:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8EF28467D;
	Fri, 25 Jul 2025 06:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="SGwTVuWP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194088634A
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753424430; cv=none; b=ankRj3nNa5fV6avsbkzbaDxlwVGd5WO90jju0PrUDY8J/HMVQnN77me2x7JMXgx1B/douP7PYHtIDqlsja7R3Ihpi0uKz1aLx1xCX9rB95kAG3ydD8HKYosjcZANmZI6ae69oBeRZqd0ZeHUUmn65Lq0Jj2Q+3kdSNShGhcAaas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753424430; c=relaxed/simple;
	bh=CzNkY+VnDu3peRwB9s6DITK/IEoW+u7ophXXib+eXGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=He7yfj9Y7f4Et4N7Q9Bs4QcdfKOKVBcM8O/F8hWH4wD+E192GtNITDI1Zlcz/mtMm7TiIKGXwvEYVaGoXhN1XQ7BOwmg1BLYPn9mkZvqD6Ta2RMxiiodPHR7faaKX1+ncy0P1h9IyEfL/Y66Yd0vh8/0dXgKr6uD+1ugwaKdDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=SGwTVuWP; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 527C33FB53
	for <linux-kbuild@vger.kernel.org>; Fri, 25 Jul 2025 06:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424014;
	bh=TzyPAUEa1ra9f+Fo595oVFYE4lltInSXTAdJNreFcWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=SGwTVuWPpY6c1sBas8ZSrZFlNSdI+cToZfZTpDnBCyoc3IwaGhT3YzzQtVaa1NLut
	 ovTwZ7OmUcw2zORa0q2Nm8VPL3g5soWaNEXJUcAv+oRYyVsUq5vcX57CLMc3WQm3qF
	 MFAjEA4UZj2hEjU9PhoO05Jz0xqpe5Bx2oIM4ymLfTaYRbd1SPJ++EwQkj5aqP/hyB
	 RxKmNF299j8c9A8zUQN1K47CCyokaFNvJFzilFten1OddENebYsaY/riojolSXZojC
	 YxAH3ZbJHLGIiihaPFxJmskXRlSlOys22+qaLRGcKlPUiqocLFKhz45lHYtfRQh5fU
	 LBpl1JJv4XQBw==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45526e19f43so6597095e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424013; x=1754028813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzyPAUEa1ra9f+Fo595oVFYE4lltInSXTAdJNreFcWM=;
        b=iz8F2qpHO36QvseW3Oa35quZoTgh2uYdYlYuZxB30Gz+EPuIM19rkigLDVZauJhwHd
         7AgSJzcpNf0j9peDZru+D0GLDUkKyWMAKIk3r3QDdAcx4RJTpjuxJ2ZZAkGrHmcRq2LE
         8AHtXlzDuW2jeNu+TRFuJZUWuDtnvLUuIV6ibK8RUk7M18QLf61XjGePSgJdv2lGT1/n
         ux/cgBLLwOl+LU8NGDwym0izPM+BKLuuKYHOFerh+XJkd/XqjgKKA4j4WB3OuI6rQAxA
         VO5Yp3oGnFocLOgNgUlNw1rr3Y9UQBo99IWUj99PY0qaWXGL0M+ItokTLDQ8gM8mJxK6
         sgrg==
X-Forwarded-Encrypted: i=1; AJvYcCXndEtOsQAAGmXY00LKgE453U2MlUexoKnaTVvEPJufHWi8pVabNjdqGhPYI/SeViQ+EsxZ9gisPbMmQUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCu+Woi/v2bLBnmo/AVpAeGycSox5ziiqnHrfktHd4xizHy6tI
	gVu3vkAtRf8PaP1J9V5+8XSL+/6UmsigI+H3HTs8mLrLZjKW078/m+hnfl/E0r1IYmoI+djlEUU
	8ngfbBrqBAUBcHxyBd5iqSb2jM20fcU73Yu06ekF5EMMVUx0gpN+m3r5/oR1NBlMHA+N2QvI+lK
	Njg3FR7A==
X-Gm-Gg: ASbGncva+1CmwM8MDJl/+fRiYLbEcyhDn0SsNSuzSvUvxPkeq2/nIejJp43qoPICRot
	NbeqinrecM7Chc/KYvxHjX+0GyQJUIy2rEymIQ2Mru1bViZigN3x5/cdGNUW7WpnwlmTpozZHXF
	Cwz8INxLY3h2TKX/J8ysHxZMdXkBo6JH96pMV7Navlv2d7P6fTUtpFCrEUZF4DTzvYTutU2satF
	alfmr7Xm90kcqbq+hPNwMnMDUYqOCHTr2EhrvBEgOQy3D44vK9HLiLNub9XOnLyGtcPAxQyqJeK
	GnO03L65HsL42Q8QXt/K9qlJpKnTEvdUgHoVfYPAKvmmFbTbqtzveixoJ75+bTSs8+kO3mKyiOm
	IT/OiWS/d1oGKlJWeAqExKAVQaA+povpQG8o1
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-45876b12ab6mr2570205e9.8.1753424013116;
        Thu, 24 Jul 2025 23:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnuDATio1q8lhm2BzVtYuo6oTtxWHR46flKXtmOHWUTwYg4EBDhbjT8wj0HyskkwGEINn1ow==
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-45876b12ab6mr2569725e9.8.1753424012699;
        Thu, 24 Jul 2025 23:13:32 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcb61sm41269355e9.20.2025.07.24.23.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:13:31 -0700 (PDT)
Message-ID: <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>
Date: Fri, 25 Jul 2025 08:13:29 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.07.25 01:36, Deepak Gupta wrote:
> SYM_* macros are used to define assembly routines. In this patch series,
> re-define those macros in risc-v arch specific include file to include
> a landing pad instruction at the beginning. This is done only when the
> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
> 
> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
> support.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
> index 9e88ba23cd2b..162774b81158 100644
> --- a/arch/riscv/include/asm/linkage.h
> +++ b/arch/riscv/include/asm/linkage.h
> @@ -6,7 +6,49 @@
>   #ifndef _ASM_RISCV_LINKAGE_H
>   #define _ASM_RISCV_LINKAGE_H
>   
> +#ifdef __ASSEMBLY__
> +#include <asm/assembler.h>
> +#endif
> +
>   #define __ALIGN		.balign 4
>   #define __ALIGN_STR	".balign 4"
>   
> +#ifdef __riscv_zicfilp
> +/*
> + * A landing pad instruction is needed at start of asm routines
> + * re-define macros for asm routines to have a landing pad at
> + * the beginning of function. Currently use label value of 0x1.

Your code below uses label value 0 which disables tag checking. As long 
as we don't have tool support for calculating function hashes that is an 
appropriate approach.

%s/Currently use label value of 0x1./Label value 0x0 disables tag checking./

Best regards

Heinrich

> + * Eventually, label should be calculated as a hash over function
> + * signature.
> + */
> +#define SYM_FUNC_START(name)				\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_NOALIGN(name)			\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_LOCAL(name)			\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_WEAK(name)			\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
> +	lpad 0;
> +
> +#define SYM_TYPED_FUNC_START(name)				\
> +	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#endif
> +
>   #endif /* _ASM_RISCV_LINKAGE_H */
> 


