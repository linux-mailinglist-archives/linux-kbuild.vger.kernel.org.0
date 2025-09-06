Return-Path: <linux-kbuild+bounces-8756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DBB4758F
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 19:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E75A5A07FDD
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Sep 2025 17:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5E12586C2;
	Sat,  6 Sep 2025 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adO6qL7f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349B724677D;
	Sat,  6 Sep 2025 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757179188; cv=none; b=cECS2AN6Xu0H4dsvNDyF2sSHVBbqCFJYTL+OkcXSB/eff0qzEqukzXnQb5cm8h2Z9pKuDLF3LJRK1tqeEUjv8RgX2/xZu7sE8M0yMnDpNqd83DNGp7pNC843HjCZLJAtrWY+dKpKECuCt8JVhwSr1VIXj4hfVht96VWbSgrSnOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757179188; c=relaxed/simple;
	bh=OuZVI2GLzoUKIi3pchVrqPyrM9O9b/wTFR5FJ2en3UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlcI9717qnrJpZzNSYAaeiVTPjibr/yCLLhBFgqk7MqQdwoL3L57hoN5BrBY3J9ZHg7tgqc46m/1OdwuWq6hSL7g32JvqqAlrGBV0AuvrVIU5O0yKXAYG6A2PhGTf716dQIrprylgEEnSiDHIGjI/cuSKyS6+bkGP9rsos+5rr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adO6qL7f; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3dcce361897so2031762f8f.3;
        Sat, 06 Sep 2025 10:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757179184; x=1757783984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJMKKvsr9aBhw2LBExeW27+96C2S4i1wtwzuhhQgIDI=;
        b=adO6qL7fSxiQIYE+M97sz3uf9A8UmwIkaeXN6yw/7gME8hz4t+1WhMjCGrWdhtGOYO
         +ophsNpL3wygqIduTCedOtSUY4BFRVRqtxm90fq+K0CkTfKf7Bm4q0IKrev/K/ZfBrTb
         AEEDwoQ+MwlHY79OmxgxnJMRxSUbakbr9mU1y4afen2Ua8qNzupr/PkjpHmatcoQBZEW
         y4Yq/P8hgcxnnH8UXmrCoEE0/LrtYrhBb96EqzqvmTNMnV8lzEn3re/8xYkw1hVOTOLR
         XDJHed1WtvUXmH/mQ8D2b15J4EHwd6ElRNb3QAeXRlET6HPJu5AxTgEx4USNCKZvLOWa
         rnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757179184; x=1757783984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJMKKvsr9aBhw2LBExeW27+96C2S4i1wtwzuhhQgIDI=;
        b=WmgAPIG1VUF6keMNImfUUvM1ce/pw3GW4j9q6oVX8JukpVXiNJzi2L/Xax1akz/0KW
         dZ+flqJC7tIioLkwMEhAS5CMXXgon8PWBZNfL0wkhdU2I1lovASn54GtVUPls4Rcxz+P
         Z5O7Z5QmMOZDmsQCA9m0Uck8ptaqOFkG6bJ1wtb6DC2mXIzN26flERNNqa2E4OnHrZcJ
         yFcDTlFyvuXdIJmQWhzcmCYFaT4GLK9codfXNpVY3HLQcPPi9qVAy3Ji0Rh6JR2UeuST
         hMzpePOhzx3+P38OHQSoC+4ChlUOJopH1q7hHmZFdK6LGq2Rni/Itt/c7Zisub0RCgmL
         LaPA==
X-Forwarded-Encrypted: i=1; AJvYcCUUOsUVKEjw8RkXFHUW19ZZMLDEcCYJAkPoxwj8mxhRQnpfnXF8g5ioqW/h2teHnuDgI8LtsmkWJ6OeVbTL@vger.kernel.org, AJvYcCUwgZalLTmjlAei6s4E46YbmJtSGgYs+8v4L5N+4R/3N+0zP5itup/kWCwW0/XUz/JTnrOq+U9vVrKy7RuH@vger.kernel.org, AJvYcCVAfbOmmeo6yrOHhVZgpPPrmrox5n9lE+cnSE/WM4uGaMWZIJiFP6HtnWLod3F1lBjSlwUSafWFb+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdEiDkln596K2MOW03pcrV93AgRnvUUotxuBN10wMGkFHJZ2L
	/xlO3IoOdCR3DwDCr1txn7mn8v+sRWd5zIEu/Px9Wj3edT0FOnRdKtSWjPKklJeaDGXtYFoTdSv
	8T7OId6494CUmP6u6P2cAo2TMQEhw5FE=
X-Gm-Gg: ASbGnctfeKNKvwdWTcFrbiyem+SM8o2oPF4HOSVGjLWE3wYIqrWgA/z5HLxJyPPbciD
	2igv6iATyRFo7oG2dfdFkYlden91Gy2RRuOmMUjIUsAXHle8vAjl70mrYchNm+UcG/cY6AC/JHY
	17BzGOrG+tcm7k4L6WQ3gd3v0Pe3ND6LSvvpPoWk7kt0OqvvWgq44jHOKoHKnA/32CGEOt8DndV
	UeuskKo
X-Google-Smtp-Source: AGHT+IEt1QBffRC3qCjFQkegXvZucxYLutWCtmj14Ka9sbWhzeDhlKSUm/6Exox7rMe+GxRha+OpSlfJGP8xa6Nz8LU=
X-Received: by 2002:a05:6000:2c0b:b0:3e0:37f3:7778 with SMTP id
 ffacd0b85a97d-3e64317d070mr1984874f8f.26.1757179184312; Sat, 06 Sep 2025
 10:19:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com> <3db48135aec987c99e8e6601249d4a4c023703c4.1756151769.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <3db48135aec987c99e8e6601249d4a4c023703c4.1756151769.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 6 Sep 2025 19:19:33 +0200
X-Gm-Features: AS18NWARCvbmNO2W6P1AIa0UmJPeNw-mXWqtKJ3IgauS5o9YHYHKl3h4kKJN_64
Message-ID: <CA+fCnZd2824w610t86xQk+ykfv3EyAOvhb_OuXjru5e+jE4HTw@mail.gmail.com>
Subject: Re: [PATCH v5 19/19] x86: Make software tag-based kasan available
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

On Mon, Aug 25, 2025 at 10:32=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
> ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
> (TBI) that allows the software tag-based mode on arm64 platform.
>
> Set scale macro based on KASAN mode: in software tag-based mode 16 bytes
> of memory map to one shadow byte and 8 in generic mode.
>
> Disable CONFIG_KASAN_INLINE and CONFIG_KASAN_STACK when
> CONFIG_KASAN_SW_TAGS is enabled on x86 until the appropriate compiler
> support is available.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add x86 specific kasan_mem_to_shadow().
> - Revert x86 to the older unsigned KASAN_SHADOW_OFFSET. Do the same to
>   KASAN_SHADOW_START/END.
> - Modify scripts/gdb/linux/kasan.py to keep x86 using unsigned offset.
> - Disable inline and stack support when software tags are enabled on
>   x86.
>
> Changelog v3:
> - Remove runtime_const from previous patch and merge the rest here.
> - Move scale shift definition back to header file.
> - Add new kasan offset for software tag based mode.
> - Fix patch message typo 32 -> 16, and 16 -> 8.
> - Update lib/Kconfig.kasan with x86 now having software tag-based
>   support.
>
> Changelog v2:
> - Remove KASAN dense code.
>
>  Documentation/arch/x86/x86_64/mm.rst | 6 ++++--
>  arch/x86/Kconfig                     | 4 +++-
>  arch/x86/boot/compressed/misc.h      | 1 +
>  arch/x86/include/asm/kasan.h         | 1 +
>  arch/x86/kernel/setup.c              | 2 ++
>  lib/Kconfig.kasan                    | 3 ++-
>  scripts/gdb/linux/kasan.py           | 4 ++--
>  7 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x8=
6/x86_64/mm.rst
> index a6cf05d51bd8..ccbdbb4cda36 100644
> --- a/Documentation/arch/x86/x86_64/mm.rst
> +++ b/Documentation/arch/x86/x86_64/mm.rst
> @@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
>     ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unus=
ed hole
>     ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual =
memory map (vmemmap_base)
>     ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unus=
ed hole
> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________
>                                                                |
>                                                                | Identica=
l layout to the 56-bit one from here on:
> @@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
>     ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unus=
ed hole
>     ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual =
memory map (vmemmap_base)
>     ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unus=
ed hole
> -   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory
> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________
>                                                                |
>                                                                | Identica=
l layout to the 47-bit one from here on:
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index b8df57ac0f28..f44fec1190b6 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -69,6 +69,7 @@ config X86
>         select ARCH_CLOCKSOURCE_INIT
>         select ARCH_CONFIGURES_CPU_MITIGATIONS
>         select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
> +       select ARCH_DISABLE_KASAN_INLINE        if X86_64 && KASAN_SW_TAG=
S

Do you think it would make sense to drop the parts of the series that
add int3 handling, since the inline instrumentation does not work yet
anyway?

>         select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE &=
& MIGRATION
>         select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
>         select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
> @@ -199,6 +200,7 @@ config X86
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN                  if X86_64
>         select HAVE_ARCH_KASAN_VMALLOC          if X86_64
> +       select HAVE_ARCH_KASAN_SW_TAGS          if ADDRESS_MASKING
>         select HAVE_ARCH_KFENCE
>         select HAVE_ARCH_KMSAN                  if X86_64
>         select HAVE_ARCH_KGDB
> @@ -403,7 +405,7 @@ config AUDIT_ARCH
>
>  config KASAN_SHADOW_OFFSET
>         hex
> -       depends on KASAN

Line accidentally removed?

> +       default 0xeffffc0000000000 if KASAN_SW_TAGS
>         default 0xdffffc0000000000
>
>  config HAVE_INTEL_TXT
> diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/m=
isc.h
> index db1048621ea2..ded92b439ada 100644
> --- a/arch/x86/boot/compressed/misc.h
> +++ b/arch/x86/boot/compressed/misc.h
> @@ -13,6 +13,7 @@
>  #undef CONFIG_PARAVIRT_SPINLOCKS
>  #undef CONFIG_KASAN
>  #undef CONFIG_KASAN_GENERIC
> +#undef CONFIG_KASAN_SW_TAGS
>
>  #define __NO_FORTIFY
>
> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
> index f3e34a9754d2..385f4e9daab3 100644
> --- a/arch/x86/include/asm/kasan.h
> +++ b/arch/x86/include/asm/kasan.h
> @@ -7,6 +7,7 @@
>  #include <linux/types.h>
>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>  #ifdef CONFIG_KASAN_SW_TAGS
> +#define KASAN_SHADOW_SCALE_SHIFT 4
>
>  /*
>   * LLVM ABI for reporting tag mismatches in inline KASAN mode.
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 1b2edd07a3e1..5b819f84f6db 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1207,6 +1207,8 @@ void __init setup_arch(char **cmdline_p)
>
>         kasan_init();
>
> +       kasan_init_sw_tags();
> +
>         /*
>          * Sync back kernel address range.
>          *
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index f82889a830fa..9ddbc6aeb5d5 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -100,7 +100,8 @@ config KASAN_SW_TAGS
>
>           Requires GCC 11+ or Clang.
>
> -         Supported only on arm64 CPUs and relies on Top Byte Ignore.
> +         Supported on arm64 CPUs that support Top Byte Ignore and on x86=
 CPUs
> +         that support Linear Address Masking.
>
>           Consumes about 1/16th of available memory at kernel start and
>           add an overhead of ~20% for dynamic allocations.
> diff --git a/scripts/gdb/linux/kasan.py b/scripts/gdb/linux/kasan.py
> index fca39968d308..4b86202b155f 100644
> --- a/scripts/gdb/linux/kasan.py
> +++ b/scripts/gdb/linux/kasan.py
> @@ -7,7 +7,7 @@
>  #
>
>  import gdb
> -from linux import constants, mm
> +from linux import constants, utils, mm
>  from ctypes import c_int64 as s64
>
>  def help():
> @@ -40,7 +40,7 @@ class KasanMemToShadow(gdb.Command):
>          else:
>              help()
>      def kasan_mem_to_shadow(self, addr):
> -        if constants.CONFIG_KASAN_SW_TAGS:
> +        if constants.CONFIG_KASAN_SW_TAGS and not utils.is_target_arch('=
x86'):

This change seems to belong to the patch that changes how the shadow
memory address is calculated.


>              addr =3D s64(addr)
>          return (addr >> self.p_ops.KASAN_SHADOW_SCALE_SHIFT) + self.p_op=
s.KASAN_SHADOW_OFFSET
>
> --
> 2.50.1
>

