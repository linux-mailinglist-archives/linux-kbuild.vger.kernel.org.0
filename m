Return-Path: <linux-kbuild+bounces-8394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28DB22881
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 15:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 983B162093D
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BF41DE3D6;
	Tue, 12 Aug 2025 13:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjPMH/oc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AB874420;
	Tue, 12 Aug 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005210; cv=none; b=E5hyD+ALQuz0/Y5Qbris57kgD+FeECjhCKeOFupCHvtsGWTP1+TPVS5NhwUcOrLgnof6tPrxnCwx1Gc3ZIcHuw/V3cK0qhJogNDbWQSOvycTNIj7SJsMttk5OnyppATNxD5atvQwjoQvOwx6njdiyi+U8Rx6kaQqot3D3eEb1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005210; c=relaxed/simple;
	bh=3vjNsBiRH4qTtxkXlQjP9ZJdLJ+PMfRGcHXqnMgrRUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ozc2yKNwfdubHe7Gtj4p1vIViN0NoD0WhXyywcUmUe+YbMPEGPnU2PMgXi9kJDJ3OmjHTNVk3S/5TnZc7cIxWehoYULCMz94Z60PCB1R584HUnzecmNZ2nUjCx8HzxML+poX7/nwACfHyzAIjbVvfwmqxKPi/px3do5EXL+jVrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjPMH/oc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005209; x=1786541209;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3vjNsBiRH4qTtxkXlQjP9ZJdLJ+PMfRGcHXqnMgrRUE=;
  b=QjPMH/ocYsoQHGGe1FSnCo42J8PAuLvgUvM62xMhbiAXst9758mEKpEp
   2XLVpLH23rgeQ3+gHah5naA8vN3QkMmmJMdujMKkRYhxBwr6fCXw3hVso
   0FRXV9OE+4lG3qp/tGLvvjx9yEPbACB3ESKJ6fdxW09Q/WSJ5kriGbSz7
   dqWIntavRZiU5SaiOHySt19Tifa9hkCaomGoMVKHYk8SLE8a2eI9U3tYE
   1EjS1YZB8eZjcwK8DRiZwws6c10F+YXa2AoQ1/yVfp1DS65P1Nq8Q6uZA
   MVuy2blzOHjyawwGwtIvh9pn1VMyt+P7zcx2XOwMOqklNXEECy9jdC3tg
   A==;
X-CSE-ConnectionGUID: 8JXx3dMDQ3qfLIbIaKGeSg==
X-CSE-MsgGUID: 5+w1kJbQRmiFiMYEEvHZeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60903111"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60903111"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:59 -0700
X-CSE-ConnectionGUID: kayhpomIS0akEcqtG//q8Q==
X-CSE-MsgGUID: VWXG4HKqROyugDxAls9HoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165831255"
Received: from vpanait-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:24:35 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: nathan@kernel.org,
	arnd@arndb.de,
	broonie@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	will@kernel.org,
	kaleshsingh@google.com,
	rppt@kernel.org,
	leitao@debian.org,
	coxu@redhat.com,
	surenb@google.com,
	akpm@linux-foundation.org,
	luto@kernel.org,
	jpoimboe@kernel.org,
	changyuanl@google.com,
	hpa@zytor.com,
	dvyukov@google.com,
	kas@kernel.org,
	corbet@lwn.net,
	vincenzo.frascino@arm.com,
	smostafa@google.com,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	andreyknvl@gmail.com,
	alexander.shishkin@linux.intel.com,
	thiago.bauermann@linaro.org,
	catalin.marinas@arm.com,
	ryabinin.a.a@gmail.com,
	jan.kiszka@siemens.com,
	jbohac@suse.cz,
	dan.j.williams@intel.com,
	joel.granados@kernel.org,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	nicolas.schier@linux.dev,
	pcc@google.com,
	andriy.shevchenko@linux.intel.com,
	wei.liu@kernel.org,
	bp@alien8.de,
	ada.coupriediaz@arm.com,
	xin@zytor.com,
	pankaj.gupta@amd.com,
	vbabka@suse.cz,
	glider@google.com,
	jgross@suse.com,
	kees@kernel.org,
	jhubbard@nvidia.com,
	joey.gouly@arm.com,
	ardb@kernel.org,
	thuth@redhat.com,
	pasha.tatashin@soleen.com,
	kristina.martsenko@arm.com,
	bigeasy@linutronix.de,
	maciej.wieczor-retman@intel.com,
	lorenzo.stoakes@oracle.com,
	jason.andryuk@amd.com,
	david@redhat.com,
	graf@amazon.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	mark.rutland@arm.com,
	dave.hansen@linux.intel.com,
	samuel.holland@sifive.com,
	kbingham@kernel.org,
	trintaeoitogc@gmail.com,
	scott@os.amperecomputing.com,
	justinstitt@google.com,
	kuan-ying.lee@canonical.com,
	maz@kernel.org,
	tglx@linutronix.de,
	samitolvanen@google.com,
	mhocko@suse.com,
	nunodasneves@linux.microsoft.com,
	brgerst@gmail.com,
	willy@infradead.org,
	ubizjak@gmail.com,
	peterz@infradead.org,
	mingo@redhat.com,
	sohil.mehta@intel.com
Cc: linux-mm@kvack.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	llvm@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/18] kasan: x86: arm64: KASAN tag-based mode for x86
Date: Tue, 12 Aug 2025 15:23:36 +0200
Message-ID: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

======= Introduction
The patchset aims to add a KASAN tag-based mode for the x86 architecture
with the help of the new CPU feature called Linear Address Masking
(LAM). Main improvement introduced by the series is 2x lower memory
usage compared to KASAN's generic mode, the only currently available
mode on x86. The tag based mode may also find errors that the generic
mode couldn't because of differences in how these modes operate.

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

- Address masking mechanism
	- TBI in arm64 allows for storing metadata in the top 8 bits of
	  the virtual address.
	- LAM in x86 allows storing tags in bits [62:57] of the pointer.
	  To maximize memory savings the tag width is reduced to bits
	  [60:57].

- Inline mode mismatch reporting
	- Arm64 inserts a BRK instruction to pass metadata about a tag
	  mismatch to the KASAN report.
	- On x86 the INT3 instruction is used for the same purpose.

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

======= Benchmarks [1]
All tests were ran on a Sierra Forest server platform. The only
differences between the tests were kernel options:
	- CONFIG_KASAN
	- CONFIG_KASAN_GENERIC
	- CONFIG_KASAN_SW_TAGS
	- CONFIG_KASAN_INLINE [1]
	- CONFIG_KASAN_OUTLINE

Boot time (until login prompt):
* 02:55 for clean kernel
* 05:42 / 06:32 for generic KASAN (inline/outline)
* 05:58 for tag-based KASAN (outline) [2]

Total memory usage (512GB present on the system - MemAvailable just
after boot):
* 12.56 GB for clean kernel
* 81.74 GB for generic KASAN
* 44.39 GB for tag-based KASAN

Kernel size:
* 14 MB for clean kernel
* 24.7 MB / 19.5 MB for generic KASAN (inline/outline)
* 27.1 MB / 18.1 MB for tag-based KASAN (inline/outline)

Compilation time comparison (10 cores):
* 7:27 for clean kernel
* 8:21/7:44 for generic KASAN (inline/outline)
* 8:20/7:41 for tag-based KASAN (inline/outline)

[1] Currently inline mode doesn't work on x86 due to things missing in
the compiler. I have written a patch for clang that seems to fix the
inline mode and I was able to boot and check that all patches regarding
the inline mode work as expected. My hope is to post the patch to LLVM
once this series is completed, and then make inline mode available in
the kernel config.

[2] While I was able to boot the inline tag-based kernel with my
compiler changes in a simulated environment, due to toolchain
difficulties I couldn't get it to boot on the machine I had access to.
Also boot time results from the simulation seem too good to be true, and
they're much too worse for the generic case to be believable. Therefore
I'm posting only results from the physical server platform.

======= Compilation
Clang was used to compile the series (make LLVM=1) since gcc doesn't
seem to have support for KASAN tag-based compiler instrumentation on
x86.

======= Dependencies
The base branch for the series is the mainline kernel, tag 6.17-rc1.

======= Enabling LAM for testing
Since LASS is needed for LAM and it can't be compiled without it I
applied the LASS series [1] first, then applied my patches.

[1] https://lore.kernel.org/all/20250707080317.3791624-1-kirill.shutemov@linux.intel.com/

Changes v4:
- Revert x86 kasan_mem_to_shadow() scheme to the same on used in generic
  KASAN. Keep the arithmetic shift idea for the KASAN in general since
  it makes more sense for arm64 and in risc-v.
- Fix inline mode but leave it unavailable until a complementary
  compiler patch can be merged.
- Apply Dave Hansen's comments on series formatting, patch style and
  code simplifications.

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

Maciej Wieczor-Retman (16):
  kasan: Fix inline mode for x86 tag-based mode
  x86: Add arch specific kasan functions
  kasan: arm64: x86: Make special tags arch specific
  x86: Reset tag for virtual to physical address conversions
  mm: x86: Untag addresses in EXECMEM_ROX related pointer arithmetic
  x86: Physical address comparisons in fill_p*d/pte
  x86: KASAN raw shadow memory PTE init
  x86: LAM compatible non-canonical definition
  x86: LAM initialization
  x86: Minimal SLAB alignment
  kasan: arm64: x86: Handle int3 for inline KASAN reports
  kasan: x86: Apply multishot to the inline report handler
  kasan: x86: Logical bit shift for kasan_mem_to_shadow
  mm: Unpoison pcpu chunks with base address tag
  mm: Unpoison vms[area] addresses with a common tag
  x86: Make software tag-based kasan available

Samuel Holland (2):
  kasan: sw_tags: Use arithmetic shift for shadow computation
  kasan: sw_tags: Support tag widths less than 8 bits

 Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
 Documentation/arch/x86/x86_64/mm.rst      |  6 +-
 MAINTAINERS                               |  4 +-
 arch/arm64/Kconfig                        | 10 ++--
 arch/arm64/include/asm/kasan-tags.h       |  9 +++
 arch/arm64/include/asm/kasan.h            |  6 +-
 arch/arm64/include/asm/memory.h           | 14 ++++-
 arch/arm64/include/asm/uaccess.h          |  1 +
 arch/arm64/kernel/traps.c                 | 17 +-----
 arch/arm64/mm/kasan_init.c                |  7 ++-
 arch/x86/Kconfig                          |  4 +-
 arch/x86/boot/compressed/misc.h           |  1 +
 arch/x86/include/asm/cache.h              |  4 ++
 arch/x86/include/asm/kasan-tags.h         |  9 +++
 arch/x86/include/asm/kasan.h              | 71 ++++++++++++++++++++++-
 arch/x86/include/asm/page.h               | 24 +++++++-
 arch/x86/include/asm/page_64.h            |  2 +-
 arch/x86/kernel/alternative.c             |  4 +-
 arch/x86/kernel/head_64.S                 |  3 +
 arch/x86/kernel/setup.c                   |  2 +
 arch/x86/kernel/traps.c                   |  4 ++
 arch/x86/mm/Makefile                      |  2 +
 arch/x86/mm/init.c                        |  3 +
 arch/x86/mm/init_64.c                     | 11 ++--
 arch/x86/mm/kasan_init_64.c               | 19 +++++-
 arch/x86/mm/kasan_inline.c                | 26 +++++++++
 arch/x86/mm/pat/set_memory.c              |  1 +
 arch/x86/mm/physaddr.c                    |  1 +
 include/linux/kasan-tags.h                | 21 +++++--
 include/linux/kasan.h                     | 51 +++++++++++++++-
 include/linux/mm.h                        |  6 +-
 include/linux/mmzone.h                    |  1 -
 include/linux/page-flags-layout.h         |  9 +--
 lib/Kconfig.kasan                         |  3 +-
 mm/execmem.c                              |  4 +-
 mm/kasan/hw_tags.c                        | 11 ++++
 mm/kasan/report.c                         | 45 ++++++++++++--
 mm/kasan/shadow.c                         | 18 ++++++
 mm/vmalloc.c                              |  8 +--
 scripts/Makefile.kasan                    |  3 +
 scripts/gdb/linux/kasan.py                |  5 +-
 scripts/gdb/linux/mm.py                   |  5 +-
 42 files changed, 381 insertions(+), 82 deletions(-)
 mode change 100644 => 100755 Documentation/arch/arm64/kasan-offsets.sh
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/x86/include/asm/kasan-tags.h
 create mode 100644 arch/x86/mm/kasan_inline.c

-- 
2.50.1


