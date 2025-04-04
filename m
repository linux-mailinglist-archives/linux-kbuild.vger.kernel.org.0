Return-Path: <linux-kbuild+bounces-6410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57883A7BD54
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B758E189F5EE
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA961EB5F1;
	Fri,  4 Apr 2025 13:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HghoyQ7j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD01991B2;
	Fri,  4 Apr 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772490; cv=none; b=fnae9Y0TYI1J3vHji0CtKrmZlNN+MrqShFzdVpmT2h8I+09VGjdXdcCcuVGrlL3sMdgMg/KyjwkerLZKMd96817CEL30WQO4EFmYSdCt4kNlDwPxZOmCtZUMwr2E6xY1KXvJ9MmlzL3la0hpatrkyJ1yFohuic72H004hbPZ9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772490; c=relaxed/simple;
	bh=UmYfWsnNAV/qSCDcr4ZpyELoC1X9sU7WVhwu9z7WdMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jvkh96aBsHH2p5fWYxXl5yMqUVUHh+Kflbv4NgT7swO+6nESAI6amjpITDzFQkZopnzt793vxTxZtyHsQIi7rmGCC3a1CEHKXcVbtPmbUv4iNQObZaeoH1bGa4H+nOSZRSRqPykYnFcprVXVtPx/uG+go7ndB3TSxoT02SEvxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HghoyQ7j; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743772488; x=1775308488;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UmYfWsnNAV/qSCDcr4ZpyELoC1X9sU7WVhwu9z7WdMk=;
  b=HghoyQ7jynqCXthoD4TymNyarwUEArRYlqtoBMM2eNUrN3Nt0/CVNP7f
   sKDrki+JMEjusphO3lNAJKWBFX/Bin783tJHOStHwYasm8RSqwXka7SiO
   Ke/+tUn2kPhItIEhX+id7K/7K3gZnQ9pL4cts75we9sAse9U/Q6AI0fw1
   +cshkCBIhLQt2xBNWn5O02dv+m9P2dIL07ZD8YBGpnqWthrjYH0TXlhTv
   PZhbzUGupTwAyQd/REwBtByiVi70eE2/KorC4mocibyig46lT3+Lbh4w+
   f4R89+/4zQbHogG8RoDvFqVZ/b/R+fpHW2RuW6vkidd/hnMFORdGtngCL
   Q==;
X-CSE-ConnectionGUID: bo9e+V7QREO9PP2p3ADG/A==
X-CSE-MsgGUID: SkDWv9x8RLKnJ32LSMRASw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55401488"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55401488"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:14:47 -0700
X-CSE-ConnectionGUID: FZxz6OJGQf6jyVDmqeoQgQ==
X-CSE-MsgGUID: loB3APGTTAqGkdlmWdKwag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128156901"
Received: from opintica-mobl1 (HELO wieczorr-mobl1.intel.com) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:14:32 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: hpa@zytor.com,
	hch@infradead.org,
	nick.desaulniers+lkml@gmail.com,
	kuan-ying.lee@canonical.com,
	masahiroy@kernel.org,
	samuel.holland@sifive.com,
	mingo@redhat.com,
	corbet@lwn.net,
	ryabinin.a.a@gmail.com,
	guoweikang.kernel@gmail.com,
	jpoimboe@kernel.org,
	ardb@kernel.org,
	vincenzo.frascino@arm.com,
	glider@google.com,
	kirill.shutemov@linux.intel.com,
	apopple@nvidia.com,
	samitolvanen@google.com,
	maciej.wieczor-retman@intel.com,
	kaleshsingh@google.com,
	jgross@suse.com,
	andreyknvl@gmail.com,
	scott@os.amperecomputing.com,
	tony.luck@intel.com,
	dvyukov@google.com,
	pasha.tatashin@soleen.com,
	ziy@nvidia.com,
	broonie@kernel.org,
	gatlin.newhouse@gmail.com,
	jackmanb@google.com,
	wangkefeng.wang@huawei.com,
	thiago.bauermann@linaro.org,
	tglx@linutronix.de,
	kees@kernel.org,
	akpm@linux-foundation.org,
	jason.andryuk@amd.com,
	snovitoll@gmail.com,
	xin@zytor.com,
	jan.kiszka@siemens.com,
	bp@alien8.de,
	rppt@kernel.org,
	peterz@infradead.org,
	pankaj.gupta@amd.com,
	thuth@redhat.com,
	andriy.shevchenko@linux.intel.com,
	joel.granados@kernel.org,
	kbingham@kernel.org,
	nicolas@fjasle.eu,
	mark.rutland@arm.com,
	surenb@google.com,
	catalin.marinas@arm.com,
	morbo@google.com,
	justinstitt@google.com,
	ubizjak@gmail.com,
	jhubbard@nvidia.com,
	urezki@gmail.com,
	dave.hansen@linux.intel.com,
	bhe@redhat.com,
	luto@kernel.org,
	baohua@kernel.org,
	nathan@kernel.org,
	will@kernel.org,
	brgerst@gmail.com
Cc: llvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	x86@kernel.org
Subject: [PATCH v3 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
Date: Fri,  4 Apr 2025 15:14:04 +0200
Message-ID: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes v3:
- Remove the runtime_const patch and setup a unified offset for both 5
  and 4 paging levels.
- Add a fix for inline mode on x86 tag-based KASAN. Add a handler for
  int3 that is generated on inline tag mismatches.
- Fix scripts/gdb/linux/kasan.py so the new signed mem_to_shadow() is
  reflected there.
- Fix Documentation/arch/arm64/kasan-offsets.sh to take new offsets into
  account.
- Made changes to the kasan_non_canonical_hook() according to upstream
  discussion.
- Remove patches 2 and 3 since they related to risc-v and this series
  adds only x86 related things.
- Reorder __tag_*() functions so they're before arch_kasan_*(). Remove
  CONFIG_KASAN condition from __tag_set().

Changes v2:
- Split the series into one adding KASAN tag-based mode (this one) and
  another one that adds the dense mode to KASAN (will post later).
- Removed exporting kasan_poison() and used a wrapper instead in
  kasan_init_64.c
- Prepended series with 4 patches from the risc-v series and applied
  review comments to the first patch as the rest already are reviewed.

======= Introduction
The patchset aims to add a KASAN tag-based mode for the x86 architecture
with the help of the new CPU feature called Linear Address Masking
(LAM). Main improvement introduced by the series is 2x lower memory
usage compared to KASAN's generic mode, the only currently available
mode on x86.

There are two relevant series in the process of adding KASAN tag-based
support to x86. This one focuses on implementing and enabling the
tag-based mode for the x86 architecture by using LAM. The second one
attempts to add a new memory saving mechanism called "dense mode" to the
non-arch part of the tag-based KASAN code. It can provide another 2x
memory savings by packing tags denser in the shadow memory.

======= How does KASAN' tag-based mode work?
When enabled, memory accesses and allocations are augmented by the
compiler during kernel compilation. Instrumentation functions are added
to each memory allocation and each pointer dereference.

The allocation related functions generate a random tag and save it in
two places: in shadow memory that maps to the allocated memory, and in
the top bits of the pointer that points to the allocated memory. Storing
the tag in the top of the pointer is possible because of Top-Byte Ignore
(TBI) on arm64 architecture and LAM on x86.

The access related functions are performing a comparison between the tag
stored in the pointer and the one stored in shadow memory. If the tags
don't match an out of bounds error must have occurred and so an error
report is generated.

The general idea for the tag-based mode is very well explained in the
series with the original implementation [1].

[1] https://lore.kernel.org/all/cover.1544099024.git.andreyknvl@google.com/

======= Differences summary compared to the arm64 tag-based mode
- Tag width:
	- Tag width influences the chance of a tag mismatch due to two
	  tags from different allocations having the same value. The
	  bigger the possible range of tag values the lower the chance
	  of that happening.
	- Shortening the tag width from 8 bits to 4, while it can help
	  with memory usage, it also increases the chance of not
	  reporting an error. 4 bit tags have a ~7% chance of a tag
	  mismatch.

- TBI and LAM
	- TBI in arm64 allows for storing metadata in the top 8 bits of
	  the virtual address.
	- LAM in x86 allows storing tags in bits [62:57] of the pointer.
	  To maximize memory savings the tag width is reduced to bits
	  [60:57].

======= Testing
Checked all the kunits for both software tags and generic KASAN after
making changes.

In generic mode the results were:

kasan: pass:59 fail:0 skip:13 total:72
Totals: pass:59 fail:0 skip:13 total:72
ok 1 kasan

and for software tags:

kasan: pass:63 fail:0 skip:9 total:72
Totals: pass:63 fail:0 skip:9 total:72
ok 1 kasan

======= Benchmarks
All tests were ran on a Sierra Forest server platform with 512GB of
memory. The only differences between the tests were kernel options:
	- CONFIG_KASAN
	- CONFIG_KASAN_GENERIC
	- CONFIG_KASAN_SW_TAGS
	- CONFIG_KASAN_INLINE [1]
	- CONFIG_KASAN_OUTLINE

More benchmarks are noted in the second series that adds the dense mode
to KASAN. That's because most values on x86' tag-based mode are tailored
to work well with that.

Boot time (until login prompt):
* 03:48 for clean kernel
* 08:02 / 09:45 for generic KASAN (inline/outline)
* 08:50 for tag-based KASAN
* 04:50 for tag-based KASAN with stacktrace disabled [1]

Compilation time comparison (10 cores):
* 7:27 for clean kernel
* 8:21/7:44 for generic KASAN (inline/outline)
* 7:41 for tag-based KASAN

[1] Currently (after getting it enabled in the Makefile) inline mode
doesn't work on x86. It's probably due to something missing in the
compiler and I aim to figure this out when working on the second series
that adds the dense mode (and will need compiler support anyway).

[2] Memory allocation and freeing performance suffers heavily from saving
stacktraces that can be later displayed in error reports.

======= Compilation
Clang was used to compile the series (make LLVM=1) since gcc doesn't
seem to have support for KASAN tag-based compiler instrumentation on
x86.

======= Dependencies
The base branch for the series is the tip x86/mm branch.

======= Enabling LAM for testing the series without LASS
Since LASS is needed for LAM and it can't be compiled without it I
enabled LAM during testing with the patch below:

--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2275,7 +2275,7 @@ config RANDOMIZE_MEMORY_PHYSICAL_PADDING
 config ADDRESS_MASKING
 	bool "Linear Address Masking support"
 	depends on X86_64
-	depends on COMPILE_TEST || !CPU_MITIGATIONS # wait for LASS
+	#depends on COMPILE_TEST || !CPU_MITIGATIONS # wait for LASS
 	help
 	  Linear Address Masking (LAM) modifies the checking that is applied
 	  to 64-bit linear addresses, allowing software to use of the

--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2401,9 +2401,10 @@ void __init arch_cpu_finalize_init(void)

 		/*
 		 * Enable this when LAM is gated on LASS support
+		 */
 		if (cpu_feature_enabled(X86_FEATURE_LAM))
 			USER_PTR_MAX = (1ul << 63) - PAGE_SIZE;
-		 */
+
 		runtime_const_init(ptr, USER_PTR_MAX);

 		/*

Maciej Wieczor-Retman (12):
  x86: Add arch specific kasan functions
  kasan: arm64: x86: Make special tags arch specific
  x86: Reset tag for virtual to physical address conversions
  x86: Physical address comparisons in fill_p*d/pte
  x86: KASAN raw shadow memory PTE init
  x86: LAM initialization
  x86: Minimal SLAB alignment
  x86: Update the KASAN non-canonical hook
  x86: Handle int3 for inline KASAN reports
  kasan: Fix inline mode for x86 tag-based mode
  mm: Unpoison pcpu chunks with base address tag
  x86: Make software tag-based kasan available

Samuel Holland (2):
  kasan: sw_tags: Use arithmetic shift for shadow computation
  kasan: sw_tags: Support tag widths less than 8 bits

 Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
 Documentation/arch/x86/x86_64/mm.rst      |  6 +-
 MAINTAINERS                               |  2 +-
 arch/arm64/Kconfig                        | 10 ++--
 arch/arm64/include/asm/kasan-tags.h       |  9 +++
 arch/arm64/include/asm/kasan.h            |  6 +-
 arch/arm64/include/asm/memory.h           | 14 ++++-
 arch/arm64/include/asm/uaccess.h          |  1 +
 arch/arm64/mm/kasan_init.c                |  7 ++-
 arch/x86/Kconfig                          |  5 +-
 arch/x86/boot/compressed/misc.h           |  1 +
 arch/x86/include/asm/cache.h              |  4 ++
 arch/x86/include/asm/kasan-tags.h         |  9 +++
 arch/x86/include/asm/kasan.h              | 41 ++++++++++++-
 arch/x86/include/asm/page.h               | 17 ++++--
 arch/x86/include/asm/page_64.h            |  2 +-
 arch/x86/kernel/alternative.c             |  3 +
 arch/x86/kernel/head_64.S                 |  3 +
 arch/x86/kernel/setup.c                   |  2 +
 arch/x86/kernel/traps.c                   | 52 +++++++++++++++++
 arch/x86/mm/fault.c                       |  2 +
 arch/x86/mm/init.c                        |  3 +
 arch/x86/mm/init_64.c                     | 11 ++--
 arch/x86/mm/kasan_init_64.c               | 21 +++++--
 arch/x86/mm/physaddr.c                    |  1 +
 include/linux/kasan-tags.h                | 19 ++++--
 include/linux/kasan.h                     | 24 +++++++-
 include/linux/mm.h                        |  6 +-
 include/linux/page-flags-layout.h         |  7 +--
 lib/Kconfig.kasan                         |  3 +-
 mm/kasan/report.c                         | 70 +++++++++++++++++++++--
 mm/kasan/shadow.c                         | 11 ++++
 mm/vmalloc.c                              |  3 +-
 scripts/Makefile.kasan                    |  3 +
 scripts/gdb/linux/kasan.py                |  3 +
 scripts/gdb/linux/mm.py                   |  5 +-
 36 files changed, 336 insertions(+), 58 deletions(-)
 mode change 100644 => 100755 Documentation/arch/arm64/kasan-offsets.sh
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/x86/include/asm/kasan-tags.h

-- 
2.49.0


