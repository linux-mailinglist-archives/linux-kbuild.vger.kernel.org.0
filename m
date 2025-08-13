Return-Path: <linux-kbuild+bounces-8436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 230F7B24C63
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 16:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C06BE7B1DE2
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 14:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081B61CAA9C;
	Wed, 13 Aug 2025 14:48:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4F319A288;
	Wed, 13 Aug 2025 14:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096535; cv=none; b=DJY84rD6yLGeYnJytfuNQaZlv5L/RHSl3TrIZm9w/rO/oV7kXeS6vN1LPWPafBFwXd7tAkRTne9MTh6LAtO/8y/gDH/47ZaFjBL0DFr+IvBkfK20mYS4aUOnWs4GZTmu2kAvlPZbC276lwlN4db5zIqQA+aGrGiwzgR+j5dbOCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096535; c=relaxed/simple;
	bh=QDCt6vH8aJxa4wubOXy6BdR0EGboDh52Gw503R3mLcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXonOic+rgWCcKU7bxuNFZLZsoOK6NztUTTU56MV5Ep4+PhjF3eBNiyeMG3b5dvRXNbdsiYbGePGNR40WvEWH3MyMXLPNh70Ap60OfUcLdYHuOpR90H6gEhVmnq/wsid6hTGY1WQ56Fiw34vSH0alWjJKqCcckgZjffWSytg1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4402312FC;
	Wed, 13 Aug 2025 07:48:44 -0700 (PDT)
Received: from [10.57.1.244] (unknown [10.57.1.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8166E3F5A1;
	Wed, 13 Aug 2025 07:48:34 -0700 (PDT)
Message-ID: <cae90aa0-9fa6-4066-bbc0-ba391f908fb2@arm.com>
Date: Wed, 13 Aug 2025 15:48:32 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/18] kasan: sw_tags: Support tag widths less than 8
 bits
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: nathan@kernel.org, arnd@arndb.de, broonie@kernel.org,
 Liam.Howlett@oracle.com, urezki@gmail.com, will@kernel.org,
 kaleshsingh@google.com, rppt@kernel.org, leitao@debian.org, coxu@redhat.com,
 surenb@google.com, akpm@linux-foundation.org, luto@kernel.org,
 jpoimboe@kernel.org, changyuanl@google.com, hpa@zytor.com,
 dvyukov@google.com, kas@kernel.org, corbet@lwn.net,
 vincenzo.frascino@arm.com, smostafa@google.com,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, andreyknvl@gmail.com,
 alexander.shishkin@linux.intel.com, thiago.bauermann@linaro.org,
 catalin.marinas@arm.com, ryabinin.a.a@gmail.com, jan.kiszka@siemens.com,
 jbohac@suse.cz, dan.j.williams@intel.com, joel.granados@kernel.org,
 baohua@kernel.org, kevin.brodsky@arm.com, nicolas.schier@linux.dev,
 pcc@google.com, andriy.shevchenko@linux.intel.com, wei.liu@kernel.org,
 bp@alien8.de, xin@zytor.com, pankaj.gupta@amd.com, vbabka@suse.cz,
 glider@google.com, jgross@suse.com, kees@kernel.org, jhubbard@nvidia.com,
 joey.gouly@arm.com, ardb@kernel.org, thuth@redhat.com,
 pasha.tatashin@soleen.com, kristina.martsenko@arm.com,
 bigeasy@linutronix.de, lorenzo.stoakes@oracle.com, jason.andryuk@amd.com,
 david@redhat.com, graf@amazon.com, wangkefeng.wang@huawei.com,
 ziy@nvidia.com, mark.rutland@arm.com, dave.hansen@linux.intel.com,
 samuel.holland@sifive.com, kbingham@kernel.org, trintaeoitogc@gmail.com,
 scott@os.amperecomputing.com, justinstitt@google.com,
 kuan-ying.lee@canonical.com, maz@kernel.org, tglx@linutronix.de,
 samitolvanen@google.com, mhocko@suse.com, nunodasneves@linux.microsoft.com,
 brgerst@gmail.com, willy@infradead.org, ubizjak@gmail.com,
 peterz@infradead.org, mingo@redhat.com, sohil.mehta@intel.com,
 linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, llvm@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ada Couprie Diaz <ada.coupriediaz@arm.com>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <780347f3897ea97e90968de028c9dd02f466204e.1755004923.git.maciej.wieczor-retman@intel.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <780347f3897ea97e90968de028c9dd02f466204e.1755004923.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/08/2025 14:23, Maciej Wieczor-Retman wrote:
> From: Samuel Holland <samuel.holland@sifive.com>
>
> Allow architectures to override KASAN_TAG_KERNEL in asm/kasan.h. This
> is needed on RISC-V, which supports 57-bit virtual addresses and 7-bit
> pointer tags. For consistency, move the arm64 MTE definition of
> KASAN_TAG_MIN to asm/kasan.h, since it is also architecture-dependent;
> RISC-V's equivalent extension is expected to support 7-bit hardware
> memory tags.
>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>   arch/arm64/include/asm/kasan.h   |  6 ++++--
>   arch/arm64/include/asm/uaccess.h |  1 +
>   include/linux/kasan-tags.h       | 13 ++++++++-----
>   3 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.h
> index e1b57c13f8a4..4ab419df8b93 100644
> --- a/arch/arm64/include/asm/kasan.h
> +++ b/arch/arm64/include/asm/kasan.h
> @@ -6,8 +6,10 @@
>   
>   #include <linux/linkage.h>
>   #include <asm/memory.h>
> -#include <asm/mte-kasan.h>
> -#include <asm/pgtable-types.h>
> +
> +#ifdef CONFIG_KASAN_HW_TAGS
> +#define KASAN_TAG_MIN			0xF0 /* minimum value for random tags */
> +#endif
Building CONFIG_KASAN_HW_TAGS with -Werror on arm64 fails here
due to a warning about KASAN_TAG_MIN being redefined.

On my side the error got triggered when compiling
arch/arm64/kernel/asm-offsets.c due to the ordering of some includes :
from <asm/processor.h>, <linux/kasan-tags.h> ends up being included
(by <asm/cpufeatures.h> including <asm/sysreg.h>) before <asm/kasan.h>.
(Build trace at the end for reference)

Adding `#undef KASAN_TAG_MIN` before redefining the arch version
allows building CONFIG_KASAN_HW_TAGS on arm64 without
further issues, but I don't know if this is most appropriate fix.Thanks, 
Ada ---

   CC      arch/arm64/kernel/asm-offsets.s
In file included from ./arch/arm64/include/asm/processor.h:42,
                  from ./include/asm-generic/qrwlock.h:18,
                  from ./arch/arm64/include/generated/asm/qrwlock.h:1,
                  from ./arch/arm64/include/asm/spinlock.h:9,
                  from ./include/linux/spinlock.h:95,
                  from ./include/linux/mmzone.h:8,
                  from ./include/linux/gfp.h:7,
                  from ./include/linux/slab.h:16,
                  from ./include/linux/resource_ext.h:11,
                  from ./include/linux/acpi.h:13,
                  from ./include/acpi/apei.h:9,
                  from ./include/acpi/ghes.h:5,
                  from ./include/linux/arm_sdei.h:8,
                  from ./arch/arm64/kernel/asm-offsets.c:10:
./arch/arm64/include/asm/kasan.h:11: error: "KASAN_TAG_MIN" redefined [-Werror]
    11 | #define KASAN_TAG_MIN                   0xF0 /* minimum value for random tags */
       |
In file included from ./arch/arm64/include/asm/sysreg.h:14,
                  from ./arch/arm64/include/asm/cputype.h:250,
                  from ./arch/arm64/include/asm/cache.h:43,
                  from ./include/vdso/cache.h:5,
                  from ./include/linux/cache.h:6,
                  from ./include/linux/slab.h:15:
./include/linux/kasan-tags.h:23: note: this is the location of the previous definition
    23 | #define KASAN_TAG_MIN           0x00 /* minimum value for random tags */
       |


