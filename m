Return-Path: <linux-kbuild+bounces-8556-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9DB2F817
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 14:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CACE17E617
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 12:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143B52DE6F6;
	Thu, 21 Aug 2025 12:31:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8E319D8A7;
	Thu, 21 Aug 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779498; cv=none; b=iPfWKP4bb0bMckcXV/jJ3A0PeD1Vp/25iheW8b9g69qba/LSLxVats8TIkBw6rERIePMklIp2XtaWQzBFtrrwZnf1+bEXTC/+eVEU4aImhvyKik7heBRm+XegD407WmP55gUQoy1rPZPXk4TGHrK8gQW6Esf726Eg0c5lsYrwhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779498; c=relaxed/simple;
	bh=wSBvw55YuhTUqmASHzPdh67urTqTQ8G3C8Yt7petnF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6cvIXv2r6SR9HVh9vXEYvaBzwhgcNSLoF4rVF8OpdiFcmbpgYk3vI0or/bajhcYkBNPDtqO+bMI31ZtP9Zct5S0bjsM9fg/ut8K/NJsgz752hB1g2vRH5Y6meHD2qeo+wUzzTvm26/fJPvAVVWKxyq61cUN+EwZRo1pJBEhfio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D09B168F;
	Thu, 21 Aug 2025 05:31:27 -0700 (PDT)
Received: from [10.57.1.220] (unknown [10.57.1.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8ED163F63F;
	Thu, 21 Aug 2025 05:31:18 -0700 (PDT)
Message-ID: <9eb211ee-94bf-431b-981c-e305c8ea5e0b@arm.com>
Date: Thu, 21 Aug 2025 13:30:28 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/18] kasan: x86: arm64: KASAN tag-based mode for x86
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
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/08/2025 14:23, Maciej Wieczor-Retman wrote:
> [...]
> ======= Testing
> Checked all the kunits for both software tags and generic KASAN after
> making changes.
>
> In generic mode the results were:
>
> kasan: pass:59 fail:0 skip:13 total:72
> Totals: pass:59 fail:0 skip:13 total:72
> ok 1 kasan
>
> and for software tags:
>
> kasan: pass:63 fail:0 skip:9 total:72
> Totals: pass:63 fail:0 skip:9 total:72
> ok 1 kasan
I tested the series on arm64 and after fixing the build issues mentioned
I was able to boot without issues and did not observe any regressions
in the KASAN KUnit tests with either generic or software tags.

So this is Tested-by: Ada Couprie Diaz <ada.coupriediaz@arm.com> (For arm64)

I will note that the tests `kmalloc_memmove_negative_size` and
`kmalloc_memmove_invalid_size` seem to be able to corrupt memory
and lead to kernel crashes if `memmove()` is not properly instrumented,
which I discovered while investigating [0].
> [...]
> ======= Compilation
> Clang was used to compile the series (make LLVM=1) since gcc doesn't
> seem to have support for KASAN tag-based compiler instrumentation on
> x86.

Interestingly, while investigating [0], this comment slipped by me and
I managed to compile your series for x86 with software tags using GCC,
though it is a bit hacky.
You need to update the CC_HAS_KASAN_SW_TAGS to pass `-mlam=u48`
or `-mlam=u57`, as it is disabled by default, and pass `-march=arrowlake`
for compilation (the support for software tags depends on the arch).
You could then test with GCC (though the issue in [0] also applies to x86).

Best,
Ada

[0]: https://groups.google.com/g/kasan-dev/c/v1PYeoitg88

> ======= Dependencies
> The base branch for the series is the mainline kernel, tag 6.17-rc1.
>
> ======= Enabling LAM for testing
> Since LASS is needed for LAM and it can't be compiled without it I
> applied the LASS series [1] first, then applied my patches.
>
> [1] https://lore.kernel.org/all/20250707080317.3791624-1-kirill.shutemov@linux.intel.com/
>
> Changes v4:
> - Revert x86 kasan_mem_to_shadow() scheme to the same on used in generic
>    KASAN. Keep the arithmetic shift idea for the KASAN in general since
>    it makes more sense for arm64 and in risc-v.
> - Fix inline mode but leave it unavailable until a complementary
>    compiler patch can be merged.
> - Apply Dave Hansen's comments on series formatting, patch style and
>    code simplifications.
>
> Changes v3:
> - Remove the runtime_const patch and setup a unified offset for both 5
>    and 4 paging levels.
> - Add a fix for inline mode on x86 tag-based KASAN. Add a handler for
>    int3 that is generated on inline tag mismatches.
> - Fix scripts/gdb/linux/kasan.py so the new signed mem_to_shadow() is
>    reflected there.
> - Fix Documentation/arch/arm64/kasan-offsets.sh to take new offsets into
>    account.
> - Made changes to the kasan_non_canonical_hook() according to upstream
>    discussion.
> - Remove patches 2 and 3 since they related to risc-v and this series
>    adds only x86 related things.
> - Reorder __tag_*() functions so they're before arch_kasan_*(). Remove
>    CONFIG_KASAN condition from __tag_set().
>
> Changes v2:
> - Split the series into one adding KASAN tag-based mode (this one) and
>    another one that adds the dense mode to KASAN (will post later).
> - Removed exporting kasan_poison() and used a wrapper instead in
>    kasan_init_64.c
> - Prepended series with 4 patches from the risc-v series and applied
>    review comments to the first patch as the rest already are reviewed.
>
> Maciej Wieczor-Retman (16):
>    kasan: Fix inline mode for x86 tag-based mode
>    x86: Add arch specific kasan functions
>    kasan: arm64: x86: Make special tags arch specific
>    x86: Reset tag for virtual to physical address conversions
>    mm: x86: Untag addresses in EXECMEM_ROX related pointer arithmetic
>    x86: Physical address comparisons in fill_p*d/pte
>    x86: KASAN raw shadow memory PTE init
>    x86: LAM compatible non-canonical definition
>    x86: LAM initialization
>    x86: Minimal SLAB alignment
>    kasan: arm64: x86: Handle int3 for inline KASAN reports
>    kasan: x86: Apply multishot to the inline report handler
>    kasan: x86: Logical bit shift for kasan_mem_to_shadow
>    mm: Unpoison pcpu chunks with base address tag
>    mm: Unpoison vms[area] addresses with a common tag
>    x86: Make software tag-based kasan available
>
> Samuel Holland (2):
>    kasan: sw_tags: Use arithmetic shift for shadow computation
>    kasan: sw_tags: Support tag widths less than 8 bits
>
>   Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
>   Documentation/arch/x86/x86_64/mm.rst      |  6 +-
>   MAINTAINERS                               |  4 +-
>   arch/arm64/Kconfig                        | 10 ++--
>   arch/arm64/include/asm/kasan-tags.h       |  9 +++
>   arch/arm64/include/asm/kasan.h            |  6 +-
>   arch/arm64/include/asm/memory.h           | 14 ++++-
>   arch/arm64/include/asm/uaccess.h          |  1 +
>   arch/arm64/kernel/traps.c                 | 17 +-----
>   arch/arm64/mm/kasan_init.c                |  7 ++-
>   arch/x86/Kconfig                          |  4 +-
>   arch/x86/boot/compressed/misc.h           |  1 +
>   arch/x86/include/asm/cache.h              |  4 ++
>   arch/x86/include/asm/kasan-tags.h         |  9 +++
>   arch/x86/include/asm/kasan.h              | 71 ++++++++++++++++++++++-
>   arch/x86/include/asm/page.h               | 24 +++++++-
>   arch/x86/include/asm/page_64.h            |  2 +-
>   arch/x86/kernel/alternative.c             |  4 +-
>   arch/x86/kernel/head_64.S                 |  3 +
>   arch/x86/kernel/setup.c                   |  2 +
>   arch/x86/kernel/traps.c                   |  4 ++
>   arch/x86/mm/Makefile                      |  2 +
>   arch/x86/mm/init.c                        |  3 +
>   arch/x86/mm/init_64.c                     | 11 ++--
>   arch/x86/mm/kasan_init_64.c               | 19 +++++-
>   arch/x86/mm/kasan_inline.c                | 26 +++++++++
>   arch/x86/mm/pat/set_memory.c              |  1 +
>   arch/x86/mm/physaddr.c                    |  1 +
>   include/linux/kasan-tags.h                | 21 +++++--
>   include/linux/kasan.h                     | 51 +++++++++++++++-
>   include/linux/mm.h                        |  6 +-
>   include/linux/mmzone.h                    |  1 -
>   include/linux/page-flags-layout.h         |  9 +--
>   lib/Kconfig.kasan                         |  3 +-
>   mm/execmem.c                              |  4 +-
>   mm/kasan/hw_tags.c                        | 11 ++++
>   mm/kasan/report.c                         | 45 ++++++++++++--
>   mm/kasan/shadow.c                         | 18 ++++++
>   mm/vmalloc.c                              |  8 +--
>   scripts/Makefile.kasan                    |  3 +
>   scripts/gdb/linux/kasan.py                |  5 +-
>   scripts/gdb/linux/mm.py                   |  5 +-
>   42 files changed, 381 insertions(+), 82 deletions(-)
>   mode change 100644 => 100755 Documentation/arch/arm64/kasan-offsets.sh
>   create mode 100644 arch/arm64/include/asm/kasan-tags.h
>   create mode 100644 arch/x86/include/asm/kasan-tags.h
>   create mode 100644 arch/x86/mm/kasan_inline.c
>

