Return-Path: <linux-kbuild+bounces-9306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE17C1CEC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB6594E38D4
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 19:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1466235581B;
	Wed, 29 Oct 2025 19:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="AOyiR+rx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2662E6127;
	Wed, 29 Oct 2025 19:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761764754; cv=none; b=jeLR2fUH3Q/yEIZ5V2vvgEawuYFn2j2nF0l9k2UDZ0/cE+E2XbhB3fsmkPAC+vi8gC6u+hfLeO9o+TkioV/0N1iOQ3YSATaiyWhdpABnGbqAIplBBvrcqAQjoJd+pmHQUo/1ekbeod5CmQVVBuulswKxCeY9u0LaaiSmXKIudNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761764754; c=relaxed/simple;
	bh=xKY6sWDSn9QH5vGZMFNxNDCBwD1Q1OcZh+NHOOl4Biw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=L6aw2NxrRCQKch+V8PgI1BUq2sK8YO/pdeIJYzg6ivMt9ET1tPAbM1EqC1/jIIqXSbODTdXozlEJaIKuFV7HldHOfGt0S1sEzPFAJ+eLAzq/UPxhSJsCetCbSDOxd03C1oBM0ksVX2UO3C7BCHkSEv6ZUIVIP+NAaVK7XxbF/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=AOyiR+rx; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761764742; x=1762023942;
	bh=B6CFw+JSCNGBsZMvctblIxAviwt5E/Cc+YlSpcKbM2E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AOyiR+rxjPfuH7pfkccCI8rMLfkmxjFsngbdMFMpi0zT4M9D/FWZ0qEvVFsr1QqeG
	 aeZ2rEk2blvOc+RXJxXre8BTUUVbzPiTtUZ4eHKV9bHrVYAJlsoMd05Lslow36MqQ8
	 K1GqlN+S8D2tbrEFnke0JQzVh5/x0+dix/wvoZunNpTeIQfxlVbATxihUfV2eK9PjX
	 bABFBwRA4NtMKHqlPZVAPKUYV8KiyMUeMOTqMz/oiwTf4WOAPtgU3CPBKYhT/PbkYQ
	 FEroosHwGZzCM4S0jlQmRJf2mw83e0gfpA5QM23gVgTomBwocLeKV2LF5dkPZpAIJl
	 DKnDSNw2AvrHg==
Date: Wed, 29 Oct 2025 19:05:27 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 00/18] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: b23693d0cf530e4c8a53771e64b6fdea3be223c5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D Introduction
The patchset aims to add a KASAN tag-based mode for the x86 architecture
with the help of the new CPU feature called Linear Address Masking
(LAM). Main improvement introduced by the series is 2x lower memory
usage compared to KASAN's generic mode, the only currently available
mode on x86. The tag based mode may also find errors that the generic
mode couldn't because of differences in how these modes operate.

=3D=3D=3D=3D=3D=3D=3D How does KASAN' tag-based mode work?
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

=3D=3D=3D=3D=3D=3D=3D Differences summary compared to the arm64 tag-based m=
ode
- Tag width:
=09- Tag width influences the chance of a tag mismatch due to two
=09  tags from different allocations having the same value. The
=09  bigger the possible range of tag values the lower the chance
=09  of that happening.
=09- Shortening the tag width from 8 bits to 4, while it can help
=09  with memory usage, it also increases the chance of not
=09  reporting an error. 4 bit tags have a ~7% chance of a tag
=09  mismatch.

- Address masking mechanism
=09- TBI in arm64 allows for storing metadata in the top 8 bits of
=09  the virtual address.
=09- LAM in x86 allows storing tags in bits [62:57] of the pointer.
=09  To maximize memory savings the tag width is reduced to bits
=09  [60:57].

- Inline mode mismatch reporting
=09- Arm64 inserts a BRK instruction to pass metadata about a tag
=09  mismatch to the KASAN report.
=09- On x86 the INT3 instruction is used for the same purpose.

=3D=3D=3D=3D=3D=3D=3D Testing
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

=3D=3D=3D=3D=3D=3D=3D Benchmarks [1]
All tests were ran on a Sierra Forest server platform. The only
differences between the tests were kernel options:
=09- CONFIG_KASAN
=09- CONFIG_KASAN_GENERIC
=09- CONFIG_KASAN_SW_TAGS
=09- CONFIG_KASAN_INLINE [1]
=09- CONFIG_KASAN_OUTLINE

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

Work under load time comparison (compiling the mainline kernel) (200 cores)=
:
*  62s for clean kernel
* 171s / 125s for generic KASAN (outline/inline)
* 145s for tag-based KASAN (outline) [2]

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

=3D=3D=3D=3D=3D=3D=3D Compilation
Clang was used to compile the series (make LLVM=3D1) since gcc doesn't
seem to have support for KASAN tag-based compiler instrumentation on
x86.

=3D=3D=3D=3D=3D=3D=3D Dependencies
The base branch for the series is the mainline kernel, tag 6.18-rc3.

=3D=3D=3D=3D=3D=3D=3D Previous versions
v5: https://lore.kernel.org/all/cover.1756151769.git.maciej.wieczor-retman@=
intel.com/
v4: https://lore.kernel.org/all/cover.1755004923.git.maciej.wieczor-retman@=
intel.com/
v3: https://lore.kernel.org/all/cover.1743772053.git.maciej.wieczor-retman@=
intel.com/
v2: https://lore.kernel.org/all/cover.1739866028.git.maciej.wieczor-retman@=
intel.com/
v1: https://lore.kernel.org/all/cover.1738686764.git.maciej.wieczor-retman@=
intel.com/

Changes v6:
- Initialize sw-tags only when LAM is available.
- Move inline mode to use UD1 instead of INT3
- Remove inline multishot patch.
- Fix the canonical check to work for user addresses too.
- Revise patch names and messages to align to tip tree rules.
- Fix vdso compilation issue.

Changes v5:
- Fix a bunch of arm64 compilation errors I didn't catch earlier.
  Thank You Ada for testing the series!
- Simplify the usage of the tag handling x86 functions (virt_to_page,
  phys_addr etc.).
- Remove within() and within_range() from the EXECMEM_ROX patch.

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
  kasan: Unpoison pcpu chunks with base address tag
  kasan: Unpoison vms[area] addresses with a common tag
  kasan: Fix inline mode for x86 tag-based mode
  x86/kasan: Add arch specific kasan functions
  kasan: arm64: x86: Make special tags arch specific
  x86/mm: Reset tag for virtual to physical address conversions
  mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic
  x86/mm: Physical address comparisons in fill_p*d/pte
  x86/kasan: KASAN raw shadow memory PTE init
  x86/mm: LAM compatible non-canonical definition
  x86/mm: LAM initialization
  x86: Minimal SLAB alignment
  x86/kasan: Handle UD1 for inline KASAN reports
  arm64: Unify software tag-based KASAN inline recovery path
  x86/kasan: Logical bit shift for kasan_mem_to_shadow
  x86/kasan: Make software tag-based kasan available

Samuel Holland (2):
  kasan: sw_tags: Use arithmetic shift for shadow computation
  kasan: sw_tags: Support tag widths less than 8 bits

 Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
 Documentation/arch/x86/x86_64/mm.rst      |  6 +-
 MAINTAINERS                               |  4 +-
 arch/arm64/Kconfig                        | 10 ++--
 arch/arm64/include/asm/kasan-tags.h       | 14 +++++
 arch/arm64/include/asm/kasan.h            |  2 -
 arch/arm64/include/asm/memory.h           | 14 ++++-
 arch/arm64/include/asm/uaccess.h          |  1 +
 arch/arm64/kernel/traps.c                 | 17 +-----
 arch/arm64/mm/kasan_init.c                |  7 ++-
 arch/x86/Kconfig                          |  4 ++
 arch/x86/boot/compressed/misc.h           |  1 +
 arch/x86/include/asm/bug.h                |  1 +
 arch/x86/include/asm/cache.h              |  4 ++
 arch/x86/include/asm/kasan-tags.h         |  9 +++
 arch/x86/include/asm/kasan.h              | 73 ++++++++++++++++++++++-
 arch/x86/include/asm/page.h               | 33 +++++++++-
 arch/x86/include/asm/page_64.h            |  1 +
 arch/x86/kernel/head_64.S                 |  3 +
 arch/x86/kernel/traps.c                   |  8 +++
 arch/x86/mm/Makefile                      |  2 +
 arch/x86/mm/init.c                        |  3 +
 arch/x86/mm/init_64.c                     | 11 ++--
 arch/x86/mm/kasan_init_64.c               | 24 +++++++-
 arch/x86/mm/kasan_inline.c                | 21 +++++++
 arch/x86/mm/physaddr.c                    |  2 +
 include/linux/kasan-tags.h                | 21 +++++--
 include/linux/kasan.h                     | 46 ++++++++++++--
 include/linux/mm.h                        |  6 +-
 include/linux/page-flags-layout.h         |  9 +--
 lib/Kconfig.kasan                         |  3 +-
 mm/execmem.c                              |  2 +-
 mm/kasan/report.c                         | 37 ++++++++++--
 mm/kasan/tags.c                           | 19 ++++++
 mm/vmalloc.c                              |  6 +-
 scripts/Makefile.kasan                    |  3 +
 scripts/gdb/linux/kasan.py                |  5 +-
 scripts/gdb/linux/mm.py                   |  5 +-
 38 files changed, 370 insertions(+), 75 deletions(-)
 mode change 100644 =3D> 100755 Documentation/arch/arm64/kasan-offsets.sh
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/x86/include/asm/kasan-tags.h
 create mode 100644 arch/x86/mm/kasan_inline.c

--=20
2.51.0



