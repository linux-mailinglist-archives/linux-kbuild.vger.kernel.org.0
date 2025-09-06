Return-Path: <linux-kbuild+bounces-8751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DFB4757A
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 19:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4038A00979
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 17:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BF324677D;
	Sat,  6 Sep 2025 17:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bcx9C9Ye"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E24086A;
	Sat,  6 Sep 2025 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179127; cv=none; b=HKe89MvZ0NSvmtitRFSF3u5TucGnkVMzsqgTVa7bJxRr8pv3IIyKxEdSIqjOdtDiEHo0gAUXH4Zm1tofunI0R/eRpR3DiMhFfll6FJ9YFIBt1wzy5sPZM6mSlU1yOQ6jvXVMkzAl8ISUVmKyYiIRYf78MSTA9TIPCvhY1kEc8gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179127; c=relaxed/simple;
	bh=cNUkbrGBHpi4S6YL8QGOpwmMxtWCanEKyYBblcsACZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=knzTg6w7bGqrt/iPIxAjz5N/1BSYDiJj6JxSWxq9Wg6nYCJBvWrx/5Mc8UUNmh986EhaH1v63gm4jP5WmQLJUY3JIDeyjxmsrN2RwboVFeLvQmWt5Ql4oxoF6Rx+rRgN2ZnilIMp1BR0yZglkX8s9hictpHPbQXsW4B211LAq5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bcx9C9Ye; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3dcce361897so2031541f8f.3;
        Sat, 06 Sep 2025 10:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179124; x=1757783924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRcDWNpUUbZTeol9QRv1WeubB1y1xQlfIP4m0Tbtx6c=;
        b=Bcx9C9YeZQGFJLEapWmKqb937PM/JY3S7vT/W4p7hXnig8ZybgCFbia93F2lOtf9Cf
         4j+qWv1VWtP4YSbLGskh/EgB6XrqA1Y/kq/zf53lwRRfXr5RJB5NU9oflxlH4mZiu+dX
         0aajBewJNxf/bbbFEyouLu3We0huhmgE/vwHKg9vLrUVHCLFo9sYqBsLXihH4EW6jqvY
         Q5qbpyGCQV3xitUxTy6Xse/hydT6oLjG0PDIqUw6eCfeRsUpqgS0V/RBP435VfSW4Sv7
         gV//2ZSPUKMpe6fAM9CVuTgD9VCtUAqRLahlFy4HyfPjj1Cs1w0abpmlWR8Y/YAaSiHT
         gw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179124; x=1757783924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XRcDWNpUUbZTeol9QRv1WeubB1y1xQlfIP4m0Tbtx6c=;
        b=T4IlPY5qbvKYP7LWXdrR91lWOEdqZHw9VRdlAHyZHVSWn0rwOje0K8rv1Iy3prWTeg
         V4gbFm4PudsV0L0ekWzwfTpTi/iTgk0cpHiRF3i5Q6Fkf5BXwYhKuY+MIYnxr60Tvcv5
         VanLJph/x9nzdYWKU+fGkXtf56HdfiCpLq88cj8096qS0MCnsvWjMY2GCuaM6VHhIOQq
         NGEM/RtmEAjgtFxv6rEFK/H7vfNUT5/uuhIFAcC2PrUIHef9z1onGVXFxwGrKeOIzVSv
         nMe9Ei0p/2+h0SHHaBeUg6VIYUQGCt97mpM5QQBU9FdRM5PDOAWZmoGIoflYF7Kx++dX
         7RJw==
X-Forwarded-Encrypted: i=1; AJvYcCUisu1j4ROrcdq4XKYEo9RoeNk6Heu0YZbBd1Sky82p3nSgnLD68c8Zout1x8eF+FDUiZD8dFzlEutQylq5@vger.kernel.org, AJvYcCUnOBQi3B0cA+SC6LXrEF/+VlFy5u2HSl7AEAOdFnrwMjw/DZMIn5OFsHiOVswcMvVT4zCzzAM6Vhs=@vger.kernel.org, AJvYcCX0ulx0kg1xzNe1qoMxANQgOGfvHY9zG9dnDeUrs/y/4g2HvKL4vlpj7dIMmZxhVcP2YTsGWHRMFj7MZNZi@vger.kernel.org
X-Gm-Message-State: AOJu0YyEbPFupdtjcGKYCqHc8hK4+rOhJBI0BONRsRaBgNSs1Qu2j+tY
	1BUS7TCXT3P2frGJf/C73TcnW53rD/vcvDORyx1JriqBKtkMYJqHj70Ke8ylRFAC9b1Ot/nZMfp
	4cMBq/P/1C4wBtEvYgHpQRkahLOhDDxc=
X-Gm-Gg: ASbGnctHi7R95rpLWm73VEobbBqBqnzmDUwB8CfmzJL8A61SnXUbowY9CoWpFAtmFwW
	79JAfImYyqluHT1nhrEUBkUWHYGBqfiO5oP6R85OL8TyKnav3bqEpdoi0Qpi/MHVcWXmADSZxwG
	Xdp1syCFLbA3PQ7zXJDOjsBvTYvfqLB1CqJ9A//hP2SUt8ocHQMEQg8mhZuN1EQoJENlV3du3MI
	F9+6IJs
X-Google-Smtp-Source: AGHT+IF1jrxuZ+XP2qXXI9FFTf9IlpGFsK20eHmJUUPJ4TKagTjFlAJHX8ijiGVB9qx7MVwBHEBlfwFBXPiejNWY0r8=
X-Received: by 2002:a05:6000:1a86:b0:3d7:cd09:ae1e with SMTP id
 ffacd0b85a97d-3e6425eb1e9mr1335076f8f.17.1757179123944; Sat, 06 Sep 2025
 10:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <7a85ceb0918c6b204078e6d479b85fef6a6c1768.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <7a85ceb0918c6b204078e6d479b85fef6a6c1768.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:18:33 +0200
X-Gm-Features: AS18NWA_eEHpTXTQ0knIVmmRfCpxcK6aFKCLGMxVUA2hte0L9DlCgBnRDAv5G6o
Message-ID: <CA+fCnZecdx5QsYcwn6ZyNoOkQRqmonUmSmfiihYTF8Ws_0O9KA@mail.gmail.com>
Subject: Re: [PATCH v5 05/19] kasan: arm64: x86: Make special tags arch specific
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 10:27=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> KASAN's tag-based mode defines multiple special tag values. They're
> reserved for:
> - Native kernel value. On arm64 it's 0xFF and it causes an early return
>   in the tag checking function.
> - Invalid value. 0xFE marks an area as freed / unallocated. It's also
>   the value that is used to initialize regions of shadow memory.
> - Max value. 0xFD is the highest value that can be randomly generated
>   for a new tag.
>
> Metadata macro is also defined:
> - Tag width equal to 8.
>
> Tag-based mode on x86 is going to use 4 bit wide tags so all the above
> values need to be changed accordingly.
>
> Make native kernel tag arch specific for x86 and arm64.
>
> Replace hardcoded kernel tag value and tag width with macros in KASAN's
> non-arch specific code.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v5:
> - Move KASAN_TAG_MIN to the arm64 kasan-tags.h for the hardware KASAN
>   mode case.
>
> Changelog v4:
> - Move KASAN_TAG_MASK to kasan-tags.h.
>
> Changelog v2:
> - Remove risc-v from the patch.
>
>  MAINTAINERS                         |  2 +-
>  arch/arm64/include/asm/kasan-tags.h | 13 +++++++++++++
>  arch/arm64/include/asm/kasan.h      |  4 ----
>  arch/x86/include/asm/kasan-tags.h   |  9 +++++++++
>  include/linux/kasan-tags.h          | 10 +++++++++-
>  include/linux/kasan.h               |  4 +++-
>  include/linux/mm.h                  |  6 +++---
>  include/linux/mmzone.h              |  1 -
>  include/linux/page-flags-layout.h   |  9 +--------
>  9 files changed, 39 insertions(+), 19 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kasan-tags.h
>  create mode 100644 arch/x86/include/asm/kasan-tags.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fed6cd812d79..788532771832 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13176,7 +13176,7 @@ L:      kasan-dev@googlegroups.com
>  S:     Maintained
>  B:     https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&pr=
oduct=3DMemory%20Management
>  F:     Documentation/dev-tools/kasan.rst
> -F:     arch/*/include/asm/*kasan.h
> +F:     arch/*/include/asm/*kasan*.h
>  F:     arch/*/mm/kasan_init*
>  F:     include/linux/kasan*.h
>  F:     lib/Kconfig.kasan
> diff --git a/arch/arm64/include/asm/kasan-tags.h b/arch/arm64/include/asm=
/kasan-tags.h
> new file mode 100644
> index 000000000000..152465d03508
> --- /dev/null
> +++ b/arch/arm64/include/asm/kasan-tags.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL       0xFF /* native kernel pointers tag */
> +
> +#define KASAN_TAG_WIDTH                8
> +
> +#ifdef CONFIG_KASAN_HW_TAGS
> +#define KASAN_TAG_MIN                  0xF0 /* minimum value for random =
tags */
> +#endif
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasa=
n.h
> index 4ab419df8b93..d2841e0fb908 100644
> --- a/arch/arm64/include/asm/kasan.h
> +++ b/arch/arm64/include/asm/kasan.h
> @@ -7,10 +7,6 @@
>  #include <linux/linkage.h>
>  #include <asm/memory.h>
>
> -#ifdef CONFIG_KASAN_HW_TAGS
> -#define KASAN_TAG_MIN                  0xF0 /* minimum value for random =
tags */
> -#endif
> -
>  #define arch_kasan_set_tag(addr, tag)  __tag_set(addr, tag)
>  #define arch_kasan_reset_tag(addr)     __tag_reset(addr)
>  #define arch_kasan_get_tag(addr)       __tag_get(addr)
> diff --git a/arch/x86/include/asm/kasan-tags.h b/arch/x86/include/asm/kas=
an-tags.h
> new file mode 100644
> index 000000000000..68ba385bc75c
> --- /dev/null
> +++ b/arch/x86/include/asm/kasan-tags.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_KASAN_TAGS_H
> +#define __ASM_KASAN_TAGS_H
> +
> +#define KASAN_TAG_KERNEL       0xF /* native kernel pointers tag */
> +
> +#define KASAN_TAG_WIDTH                4
> +
> +#endif /* ASM_KASAN_TAGS_H */
> diff --git a/include/linux/kasan-tags.h b/include/linux/kasan-tags.h
> index e07c896f95d3..fe80fa8f3315 100644
> --- a/include/linux/kasan-tags.h
> +++ b/include/linux/kasan-tags.h
> @@ -2,7 +2,15 @@
>  #ifndef _LINUX_KASAN_TAGS_H
>  #define _LINUX_KASAN_TAGS_H
>
> -#include <asm/kasan.h>
> +#if defined(CONFIG_KASAN_SW_TAGS) || defined(CONFIG_KASAN_HW_TAGS)
> +#include <asm/kasan-tags.h>
> +#endif
> +
> +#ifndef KASAN_TAG_WIDTH
> +#define KASAN_TAG_WIDTH                0
> +#endif
> +
> +#define KASAN_TAG_MASK         ((1UL << KASAN_TAG_WIDTH) - 1)
>
>  #ifndef KASAN_TAG_KERNEL
>  #define KASAN_TAG_KERNEL       0xFF /* native kernel pointers tag */
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index b396feca714f..54481f8c30c5 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -40,7 +40,9 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
>
>  #ifdef CONFIG_KASAN_SW_TAGS
>  /* This matches KASAN_TAG_INVALID. */
> -#define KASAN_SHADOW_INIT 0xFE
> +#ifndef KASAN_SHADOW_INIT

Do we need this ifndef?

> +#define KASAN_SHADOW_INIT KASAN_TAG_INVALID
> +#endif
>  #else
>  #define KASAN_SHADOW_INIT 0
>  #endif
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 1ae97a0b8ec7..bb494cb1d5af 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1692,7 +1692,7 @@ static inline u8 page_kasan_tag(const struct page *=
page)
>
>         if (kasan_enabled()) {
>                 tag =3D (page->flags >> KASAN_TAG_PGSHIFT) & KASAN_TAG_MA=
SK;
> -               tag ^=3D 0xff;
> +               tag ^=3D KASAN_TAG_KERNEL;
>         }
>
>         return tag;
> @@ -1705,7 +1705,7 @@ static inline void page_kasan_tag_set(struct page *=
page, u8 tag)
>         if (!kasan_enabled())
>                 return;
>
> -       tag ^=3D 0xff;
> +       tag ^=3D KASAN_TAG_KERNEL;
>         old_flags =3D READ_ONCE(page->flags);
>         do {
>                 flags =3D old_flags;
> @@ -1724,7 +1724,7 @@ static inline void page_kasan_tag_reset(struct page=
 *page)
>
>  static inline u8 page_kasan_tag(const struct page *page)
>  {
> -       return 0xff;
> +       return KASAN_TAG_KERNEL;
>  }
>
>  static inline void page_kasan_tag_set(struct page *page, u8 tag) { }
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 0c5da9141983..c139fb3d862d 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -1166,7 +1166,6 @@ static inline bool zone_is_empty(struct zone *zone)
>  #define NODES_MASK             ((1UL << NODES_WIDTH) - 1)
>  #define SECTIONS_MASK          ((1UL << SECTIONS_WIDTH) - 1)
>  #define LAST_CPUPID_MASK       ((1UL << LAST_CPUPID_SHIFT) - 1)
> -#define KASAN_TAG_MASK         ((1UL << KASAN_TAG_WIDTH) - 1)

So we cannot define this here because of include dependencies? Having
this value defined here would look cleaner.

Otherwise, let's add a comment here with a reference to where this
value is defined.

>  #define ZONEID_MASK            ((1UL << ZONEID_SHIFT) - 1)
>
>  static inline enum zone_type page_zonenum(const struct page *page)
> diff --git a/include/linux/page-flags-layout.h b/include/linux/page-flags=
-layout.h
> index 760006b1c480..b2cc4cb870e0 100644
> --- a/include/linux/page-flags-layout.h
> +++ b/include/linux/page-flags-layout.h
> @@ -3,6 +3,7 @@
>  #define PAGE_FLAGS_LAYOUT_H
>
>  #include <linux/numa.h>
> +#include <linux/kasan-tags.h>
>  #include <generated/bounds.h>
>
>  /*
> @@ -72,14 +73,6 @@
>  #define NODE_NOT_IN_PAGE_FLAGS 1
>  #endif
>
> -#if defined(CONFIG_KASAN_SW_TAGS)
> -#define KASAN_TAG_WIDTH 8
> -#elif defined(CONFIG_KASAN_HW_TAGS)
> -#define KASAN_TAG_WIDTH 4

This case is removed here but not added to arch/arm64/include/asm/kasan-tag=
s.h.


> -#else
> -#define KASAN_TAG_WIDTH 0
> -#endif
> -
>  #ifdef CONFIG_NUMA_BALANCING
>  #define LAST__PID_SHIFT 8
>  #define LAST__PID_MASK  ((1 << LAST__PID_SHIFT)-1)
> --
> 2.50.1
>

