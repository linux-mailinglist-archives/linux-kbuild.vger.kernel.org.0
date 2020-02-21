Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B36AC1678BE
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2020 09:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728308AbgBUIuo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 03:50:44 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43906 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388884AbgBUIun (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 03:50:43 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200221085040euoutp01998fa5e73432f32a5551293b00bfcc98~1XsQuwD8N2143021430euoutp01Q
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Feb 2020 08:50:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200221085040euoutp01998fa5e73432f32a5551293b00bfcc98~1XsQuwD8N2143021430euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582275040;
        bh=HZLNxylF3daAUHGgLFX7OuD1/pYOLzAhJCT48ldmvp8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=bJTSssywoTDY9rLZ4jT2P01j2QhiKpZfBKVAtb16Jijl0RxvmD7hfN+KoCkJ5SI4Z
         CQEwn/PklQlSkIYFiBhjob3NkLieGUdKmSXK7klUwGJu74R93r0SKiVzRFvk2+OqCW
         ndOKBvaPMFPTvdljHh+v7B9TTi2ZBqXXywmb29QY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200221085040eucas1p1964a56ab0b132d8c0120d31850741b72~1XsQSuyfh2317823178eucas1p1n;
        Fri, 21 Feb 2020 08:50:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id EC.08.61286.0E99F4E5; Fri, 21
        Feb 2020 08:50:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929~1XsP8LlTH2387523875eucas1p26;
        Fri, 21 Feb 2020 08:50:39 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200221085039eusmtrp26e6785315653b9152523025d12bd84bb~1XsP7HlW00916709167eusmtrp2G;
        Fri, 21 Feb 2020 08:50:39 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-2c-5e4f99e009d7
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8E.B0.07950.FD99F4E5; Fri, 21
        Feb 2020 08:50:39 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200221085038eusmtip275b699c639314f6826691376433a2979~1XsO2zE1v0499104991eusmtip2U;
        Fri, 21 Feb 2020 08:50:38 +0000 (GMT)
Subject: Re: [PATCH] kbuild: use KBUILD_DEFCONFIG as the fallback for
 DEFCONFIG_LIST
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     x86@kernel.org, sparclinux@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Borislav Petkov <bp@alien8.de>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jeff Dike <jdike@addtoit.com>, Nick Hu <nickhu@andestech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Chen <deanbo422@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-riscv@lists.infradead.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e0212512-bc44-fc3a-a647-47eff86983b7@samsung.com>
Date:   Fri, 21 Feb 2020 09:50:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200216154502.26478-1-masahiroy@kernel.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0yTVxj2fPd2Vo4F0zdosqRRjGQTyMZysjmiCYknC5vyh+gUtZtf0Ekr
        toK6ZLGzzLCOqVFU+Lh5GXIRRcDWghcQHYywVFfmBMKixAvUgBgQh1jZaD+Z/Hue532e875P
        ciRW3ypESlstO2WrxZRuFLScu/XlrffvF6zaEOvyhJHB/FqOuF4pIhm9MCmQ4TO5iJx8OcGT
        olvZHOkZH0TkhbubJwNXv+fIsVoDqbnSJ5K6B3/xJNDoYUhnY5FA3KPZAikK5LHk56ok0ne/
        iye+5hMMudNcg4i/M5cl+5UwcqRh6jF7ewVP6uuOsiS7N56MX3jAk3uHrzLLF9CJyU6R/vPD
        AY5e6VBYWl1SjWh/5RmWDvr9HL1Y2c3QGznPRdqg/C3SuqofBeotfMbRp16vSOt/2Uu7S3bQ
        4Wt3BOpz3BVXh3+pXbZZTt+aJVtjEjZpt5T95OAzWmN3Oy4fY+3o0WIn0kiAPwT32THBibSS
        HlcgcF16zKjkOYLhvFOiSkYR7Lvp5KYj4+PTkXIEvcUOXiVDCI7/dnrKJUnhOAXu/rouGIjA
        FIaqakIvsbhJhMD102JwIOA4cA45haBfhxMgrycxKHN4EQzcrBaCeB5OhcLKG6HFOjwX2gse
        hrAGfwztpX8wQczid8HhKmRVbICeh6WhCoAPaqCnv5xXr06EvpLXoorD4UnbxTd4AfzbMB1w
        IOjznhNVkougc18+Ul2fQK93InQpi5dATWOMKq+A4v4AE5QBz4GuobnqEXPgsPs4q8o6yNmv
        V91RoLSd/3/t9ds+9hAyKjOqKTPqKDPqKG/3nkBcFTLImTZzmmyLs8i7ltpMZlumJW3p19vN
        dWjqd3dMto140JjvqxaEJWScrdtt/2KDnjdl2faYWxBIrDFCFzV7StJtNu35VrZu32jNTJdt
        LWi+xBkNug9O+VP1OM20U94myxmydXrKSJpIO6Iro6NnWZPmx/qljJzkZY9W7Ipv2pvy7KSG
        uipeR6wtPerRhbVEXloYz2zcsW0sUPndcjuXVb9G+/R28Ygj8ptPuwp9CdzA5XlJhqgy8+/J
        qa5WT1NbrfYJzh25x7wqW/+i4DEkl9sdWe99fk3/5zsdH1lWrW3/LKN5SX7ipphZTI6Rs20x
        xUWzVpvpP8MVtDfZAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0iTaxzHefZeFUdP0/DBhGRwCoJm72ztWdgoitPzR6fEIsLSWvailXO2
        d9oNajHPOWvlwW7W3kSLLuSUrFl2j7SyRmCkmbosFZO0dAWauRpytizwvw/fyw9+8OUpVTuT
        wG/Lt4nWfFOemo2mn088fTev2706a35pgw4Pnb5G4xs/ZA6PXJ1g8edLRwA+F/zO4PIXxTT2
        jw8BPFbfyeCB+wdpXHYtHtfe6+Wwt+81g0N3bilw651yFtePFLO4PHSCwiWelbi3p4PBLQ/P
        KnDbw1qAB1uPUPgfeRo+fjt8zO67zOA670kKF3fp8PjVPgZ3H7uvWJJIvk+0cuTb3//R5N5z
        mSI1FTWAfKi6RJGhwUGaXK/qVJBHzlGO3JbfcsTrOcSS5jNfaBJobuZI3YUDpLNiJ/n8oI0l
        LY52Li02Q5NqtRTaxKRci2RbrN4gYK1GMGCNdoFBI6ToMxdpdepkY+pWMW9bkWhNNm7W5F48
        7GAKmubvdtwto+ygf44LRPEILkDj419ZF4jmVfAiQI7BEDdpJCJfmZ2Z5FgUeu36FfoE0DPv
        sbDB87FwHWp/siGSiYMEDXtquUiGgk84VFFVwkYMFTSgYn8zFWEWCsg1HDnE80poRCf8yyMy
        Df9AA49rfsZnwEzU4XYqIqyE05HP/Z6OcBRchHyVL3/qFFyIKup6qUmehRw3zvzieOR/X6ko
        BSp5Sl2eUpGnVOQplbOA9oA4sVAy55glrUYymaXC/BxNtsXsBeFR1TcFr98CrsCaRgB5oI5R
        7ravylIxpiJpj7kRIJ5Sxylnx4Ql5VbTnr2i1bLJWpgnSo1AF37uKJUwI9sSnmi+bZOgE/TY
        IOhT9CkLsTpe6YQNG1Uwx2QTd4higWj93VPwUQl28MpXpCrFgRy3/vCuj+eD1sblob4oo2D/
        80egwJKedGUko2E7TL0bSB+lgmnVSxN2da0fTVLKTWMPdmYYXmrXJjaFgupl1f+O5TpvvulP
        C8wqWtEWM9yfzUeX7N87OuDc4pxprK7bfKryr66eni9f3Sszu9Orxk77b3bEtVg8in1qWso1
        CXMpq2T6H3tOa3hqAwAA
X-CMS-MailID: 20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929
References: <20200216154502.26478-1-masahiroy@kernel.org>
        <CGME20200221085039eucas1p2b439c37eb04870cc020f452b7ad31929@eucas1p2.samsung.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dear All,

On 16.02.2020 16:45, Masahiro Yamada wrote:
> Most of the Kconfig commands (except defconfig and all*config) read the
> .config file as a base set of CONFIG options.
>
> When it does not exist, the files in DEFCONFIG_LIST are searched in this
> order and loaded if found.
>
> I do not see much sense in the last two entries in DEFCONFIG_LIST.
>
> [1] ARCH_DEFCONFIG
>
> The entry for DEFCONFIG_LIST is guarded by 'depends on !UML'. So, the
> ARCH_DEFCONFIG definition in arch/x86/um/Kconfig is meaningless.
>
> arch/{sh,sparc,x86}/Kconfig define ARCH_DEFCONFIG depending on 32 or 64
> bit variant symbols. This is a little bit strange; ARCH_DEFCONFIG should
> be a fixed string because the base config file is loaded before the symbol
> evaluation stage.
>
> Using KBUILD_DEFCONFIG is saner because it is fixed before Kconfig is
> invoked. Fortunately, arch/{sh,sparc,x86}/Makefile define it in the
> same way, and it works as expected. Hence, replace ARCH_DEFCONFIG with
> "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)".
>
> [2] arch/$(ARCH)/defconfig
>
> This file path is no longer valid. The defconfig files are always located
> in the arch configs/ directories.
>
>    $ find arch -name defconfig | sort
>    arch/alpha/configs/defconfig
>    arch/arm64/configs/defconfig
>    arch/csky/configs/defconfig
>    arch/nds32/configs/defconfig
>    arch/riscv/configs/defconfig
>    arch/s390/configs/defconfig
>    arch/unicore32/configs/defconfig
>
> The path arch/*/configs/defconfig is already covered by
> "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)". So, this file path is
> not necessary.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This patch landed in today's linux-next (next-20200221) and broke arm64 
builds:

--->8---

$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
*** Default configuration is based on 'defconfig'
#
# configuration written to .config
#
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image.gz
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
scripts/kconfig/conf  --syncconfig Kconfig
...

(endless loop)

--->8---

Reverting it fixes the issue:

--->8---

$ git revert cdd5d1a207d6a3a06c9e627a0234d9a6af6ad347
[detached HEAD 1080d6a13b6d] Revert "kbuild: use KBUILD_DEFCONFIG as the 
fallback for DEFCONFIG_LIST"
  5 files changed, 22 insertions(+), 1 deletion(-)
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- defconfig
*** Default configuration is based on 'defconfig'
#
# No change to .config
#
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image.gz
scripts/kconfig/conf  --syncconfig Kconfig
   UPD     include/config/kernel.release
   UPD     include/generated/utsrelease.h
   CC      scripts/mod/empty.o
...

$ aarch64-linux-gnu-gcc --version
aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.4.0-1ubuntu1~18.04.1) 7.4.0
Copyright (C) 2017 Free Software Foundation, Inc.
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--->8---

It looks that the issue is similar to the one described here:

https://patchwork.kernel.org/patch/10453685/

I hope this report helps fixing the issue.

> ---
>
>   arch/sh/Kconfig     | 5 -----
>   arch/sparc/Kconfig  | 5 -----
>   arch/x86/Kconfig    | 5 -----
>   arch/x86/um/Kconfig | 5 -----
>   init/Kconfig        | 3 +--
>   5 files changed, 1 insertion(+), 22 deletions(-)
>
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 9ece111b0254..b4f0e37b83eb 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -87,11 +87,6 @@ config SUPERH64
>   	select HAVE_EXIT_THREAD
>   	select KALLSYMS
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/sh/configs/shx3_defconfig" if SUPERH32
> -	default "arch/sh/configs/cayman_defconfig" if SUPERH64
> -
>   config GENERIC_BUG
>   	def_bool y
>   	depends on BUG && SUPERH32
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index c1dd6dd642f4..0de15380d1fc 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -95,11 +95,6 @@ config SPARC64
>   	select PCI_DOMAINS if PCI
>   	select ARCH_HAS_GIGANTIC_PAGE
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/sparc/configs/sparc32_defconfig" if SPARC32
> -	default "arch/sparc/configs/sparc64_defconfig" if SPARC64
> -
>   config ARCH_PROC_KCORE_TEXT
>   	def_bool y
>   
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index beea77046f9b..98935f4387f9 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -240,11 +240,6 @@ config OUTPUT_FORMAT
>   	default "elf32-i386" if X86_32
>   	default "elf64-x86-64" if X86_64
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/x86/configs/i386_defconfig" if X86_32
> -	default "arch/x86/configs/x86_64_defconfig" if X86_64
> -
>   config LOCKDEP_SUPPORT
>   	def_bool y
>   
> diff --git a/arch/x86/um/Kconfig b/arch/x86/um/Kconfig
> index a8985e1f7432..95d26a69088b 100644
> --- a/arch/x86/um/Kconfig
> +++ b/arch/x86/um/Kconfig
> @@ -27,11 +27,6 @@ config X86_64
>   	def_bool 64BIT
>   	select MODULES_USE_ELF_RELA
>   
> -config ARCH_DEFCONFIG
> -	string
> -	default "arch/um/configs/i386_defconfig" if X86_32
> -	default "arch/um/configs/x86_64_defconfig" if X86_64
> -
>   config 3_LEVEL_PGTABLES
>   	bool "Three-level pagetables" if !64BIT
>   	default 64BIT
> diff --git a/init/Kconfig b/init/Kconfig
> index 452bc1835cd4..6ccdb168dee5 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -6,8 +6,7 @@ config DEFCONFIG_LIST
>   	default "/lib/modules/$(shell,uname -r)/.config"
>   	default "/etc/kernel-config"
>   	default "/boot/config-$(shell,uname -r)"
> -	default ARCH_DEFCONFIG
> -	default "arch/$(ARCH)/defconfig"
> +	default "arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)"
>   
>   config CC_IS_GCC
>   	def_bool $(success,$(CC) --version | head -n 1 | grep -q gcc)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

