Return-Path: <linux-kbuild+bounces-11036-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFCXEJebg2nppwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11036-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 20:18:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B12DEC00C
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 20:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7779E3034E19
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 19:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66493F0743;
	Wed,  4 Feb 2026 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Tmrlsjvj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D789421F12;
	Wed,  4 Feb 2026 19:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770232702; cv=none; b=XKKlFdr0wIBcVPnM1VztN2ZmDkxt+Fy+egZ6H2bqjuNPo3n2v7psbkapj5ZS50L/YqikfZ9r7uY8UE7bIWbW45usMOv83UGhEey7Nq0y+RWkJ7gTcf18+LPdSvIpcUfZclVjOV8HfC10wYM4eizRgDtCdlXsUdo8fsukhupk/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770232702; c=relaxed/simple;
	bh=ESI5qy25OZL/FDJA7SVKYRuozXkbu4tNY7ozYDZsjMQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hD+LseujzBv6GFk9cxarz2VA+i7sOvVwOW722hRoxZKlDUjz9e0K4W4op2k5bMeNfL+y8t1ejIJdeswc58JqdzkxlRG8nhbQEQcfSCQFLgrS+Vjkrm1ScG7G99gohUvFbTSfao5yiz/YRqqy6Sdd6i5/Kd+U2fA1jFO81GYuHCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Tmrlsjvj; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1770232692; x=1770491892;
	bh=73oX5UGRgshUHRpRhlZcRkKYChDyx05rk9BjHk/OfuI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TmrlsjvjRZTYgJeK7clA8KHGhP85jvgScM9rXRlZTi3pqRmw25EimtkNJNC8Pbkch
	 LjNNbvCFYVQ3uchnX2D9SQJbVWP5RT33hJxkrmtyvGeJKuiN7rStgs+96HbzsjKdRY
	 o8+MIkt1DEEj/bI9GvBQy+4gsSCw3lRcSObuhbwsTSPCTNreeZB02T3jAf4rdcg2Z7
	 RulLiyqeZLMxBuq1OiJr3ofCoFieqMLGacMhTpyqJ/O0NBHnzauVHO9UQZSwp2vXz/
	 OL4sgaxAhtvoWYhheZnDbcherNRzT0Dc4ws62bWMcwvqPagfgt+nCMqYmM1ZU0pjDd
	 U4Zi4pLy0V6cA==
Date: Wed, 04 Feb 2026 19:18:05 +0000
To: hpa@zytor.com, andreyknvl@gmail.com, peterz@infradead.org, david@kernel.org, nathan@kernel.org, samitolvanen@google.com, catalin.marinas@arm.com, lorenzo.stoakes@oracle.com, rppt@kernel.org, ryabinin.a.a@gmail.com, luto@kernel.org, surenb@google.com, nick.desaulniers+lkml@gmail.com, kas@kernel.org, chleroy@kernel.org, will@kernel.org, maciej.wieczor-retman@intel.com, vbabka@suse.cz, Liam.Howlett@oracle.com, jeremy.linton@arm.com, jpoimboe@kernel.org, thomas.lendacky@amd.com, thuth@redhat.com, kees@kernel.org, mingo@redhat.com, jan.kiszka@siemens.com, dave.hansen@linux.intel.com, vincenzo.frascino@arm.com, morbo@google.com, axelrasmussen@google.com, yuanchu@google.com, urezki@gmail.com, trintaeoitogc@gmail.com, brgerst@gmail.com, osandov@fb.com, akpm@linux-foundation.org, mhocko@suse.com, nsc@kernel.org, kbingham@kernel.org, glider@google.com, samuel.holland@sifive.com, corbet@lwn.net, dvyukov@google.com, anshuman.khandual@arm.com, yeoreum.yun@arm.com, weixugc@google.com,
	leitao@debian.org, ubizjak@gmail.com, justinstitt@google.com, bp@alien8.de, jackmanb@google.com, ardb@kernel.org, tglx@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, workflows@vger.kernel.org, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-mm@kvack.org, m.wieczorretman@pm.me
Subject: [PATCH v10 00/13] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <cover.1770232424.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: d8adabb086f51c3e89e343803ba9366a6dc96c98
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11036-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[zytor.com,gmail.com,infradead.org,kernel.org,google.com,arm.com,oracle.com,intel.com,suse.cz,amd.com,redhat.com,siemens.com,linux.intel.com,fb.com,linux-foundation.org,suse.com,sifive.com,lwn.net,debian.org,alien8.de];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[63];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:mid,pm.me:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B12DEC00C
X-Rspamd-Action: no action

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
=09- Right now on x86 the INT3 instruction is used for the same
=09  purpose. The attempt to move it over to use UD1 is already
=09  implemented and tested but relies on another series that needs
=09  merging first. Therefore this patch will be posted separately
=09  once the dependency is satisfied by being merged upstream.

=3D=3D=3D=3D=3D=3D=3D Testing
Checked all the kunits for both software tags and generic KASAN after
making changes.

In generic mode (both with these patches and without) the results were:

kasan: pass:61 fail:1 skip:14 total:76
Totals: pass:61 fail:1 skip:14 total:76
not ok 1 kasan

and for software tags:

kasan: pass:65 fail:1 skip:10 total:76
Totals: pass:65 fail:1 skip:10 total:76
not ok 1 kasan

At the time of testing the one failing case is also present on generic
mode without this patchset applied. This seems to point to something
else being at fault for the one case not passing. The test case in
question concerns strscpy() out of bounds error not getting caught.

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
x86. Patchset does seem to compile with gcc without an issue but doesn't
boot afterwards.

=3D=3D=3D=3D=3D=3D=3D Dependencies
The series is based on 6.19-rc8.

=3D=3D=3D=3D=3D=3D=3D Previous versions
v9: https://lore.kernel.org/all/cover.1768845098.git.m.wieczorretman@pm.me/
v8: https://lore.kernel.org/all/cover.1768233085.git.m.wieczorretman@pm.me/
v7: https://lore.kernel.org/all/cover.1765386422.git.m.wieczorretman@pm.me/
v6: https://lore.kernel.org/all/cover.1761763681.git.m.wieczorretman@pm.me/
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

=3D=3D=3D (two fixes patches were split off after v6) (merged into mm-unsta=
ble)
v1: https://lore.kernel.org/all/cover.1762267022.git.m.wieczorretman@pm.me/
v2: https://lore.kernel.org/all/cover.1764685296.git.m.wieczorretman@pm.me/
v3: https://lore.kernel.org/all/cover.1764874575.git.m.wieczorretman@pm.me/
v4: https://lore.kernel.org/all/cover.1764945396.git.m.wieczorretman@pm.me/

Changes v10:
- Rebase the series onto 6.19-rc8.
- Add Mike Rapoport's acked-by to patch 6.
- Modify Documentation/dev-tools/kasan.rst in patches 1 and 13.

Changes v9:
- Lock HAVE_ARCH_KASAN_SW_TAGS behind CC_IS_CLANG due to gcc not working
  in practice.
- Remove pr_info() from KASAN initialization.
- Add paragraph to mm.rst explaining the alternative KASAN memory
  ranges.
- Move out arch based code from kasan_non_canonical_hook() into arch
  subdirectories. arm64 and non-arch changes in patch 1, x86 changes in
  patch 12.
- Reset tag bits on arm64's non-canonical hook to allow inline mode to
  work.
- Revert modifying __is_canonical_address() since it can break KVM. Just
  untag address in copy_from_kernel_no_fault_allowed().
- Add a bunch of reviewed-by tags.

Changes v8:
- Detached the UD1/INT3 inline patch from the series so the whole
  patchset can be merged without waiting on other dependency series. For
  now with lack of compiler support for the inline mode that patch
  didn't work anyway so this delay is not an issue.
- Rebased patches onto 6.19-rc5.
- Added acked-by tag to "kasan: arm64: x86: Make special tags arch
  specific".

Changes v7:
- Rebased the series onto Peter Zijlstra's "WARN() hackery" v2 patchset.
- Fix flipped memset arguments in "x86/kasan: KASAN raw shadow memory
  PTE init".
- Reorder tag width defines on arm64 to avoid redefinition warnings.
- Split off the pcpu unpoison patches into a separate fix oriented
  series.
- Redid the canonicality checks so it works for KVM too (didn't change
  the __canonical_address() function previously).
- A lot of fixes pointed out by Alexander in his great review:
=09- Fixed "x86/mm: Physical address comparisons in fill_p*d/pte"
=09- Merged "Support tag widths less than 8 bits" and "Make special
=09  tags arch specific".
=09- Added comments and extended patch messages for patches
=09  "x86/kasan: Make software tag-based kasan available" and
=09  "mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic=
",
=09- Fixed KASAN_TAG_MASK definition order so all patches compile
=09  individually.
=09- Renamed kasan_inline.c to kasan_sw_tags.c.

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

Maciej Wieczor-Retman (11):
  kasan: Fix inline mode for x86 tag-based mode
  x86/kasan: Add arch specific kasan functions
  x86/mm: Reset tag for virtual to physical address conversions
  mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic
  x86/mm: Use physical address comparisons in fill_p*d/pte
  x86/kasan: Initialize KASAN raw shadow memory
  x86/mm: Reset tags in a canonical address helper call
  x86/mm: Initialize LAM_SUP
  x86: Increase minimal SLAB alignment for KASAN
  x86/kasan: Use a logical bit shift for kasan_mem_to_shadow
  x86/kasan: Make software tag-based kasan available

Samuel Holland (2):
  kasan: sw_tags: Use arithmetic shift for shadow computation
  kasan: arm64: x86: Make special tags arch specific

 Documentation/arch/arm64/kasan-offsets.sh |  8 ++-
 Documentation/arch/x86/x86_64/mm.rst      | 10 ++-
 Documentation/dev-tools/kasan.rst         | 46 +++++++------
 MAINTAINERS                               |  4 +-
 arch/arm64/Kconfig                        | 10 +--
 arch/arm64/include/asm/kasan-tags.h       | 14 ++++
 arch/arm64/include/asm/kasan.h            |  7 +-
 arch/arm64/include/asm/memory.h           | 14 +++-
 arch/arm64/include/asm/uaccess.h          |  1 +
 arch/arm64/mm/Makefile                    |  2 +
 arch/arm64/mm/kasan_init.c                |  7 +-
 arch/arm64/mm/kasan_sw_tags.c             | 35 ++++++++++
 arch/x86/Kconfig                          |  4 ++
 arch/x86/boot/compressed/misc.h           |  1 +
 arch/x86/include/asm/cache.h              |  4 ++
 arch/x86/include/asm/kasan-tags.h         |  9 +++
 arch/x86/include/asm/kasan.h              | 79 ++++++++++++++++++++++-
 arch/x86/include/asm/page.h               |  8 +++
 arch/x86/include/asm/page_64.h            |  1 +
 arch/x86/kernel/head_64.S                 |  3 +
 arch/x86/mm/init.c                        |  3 +
 arch/x86/mm/init_64.c                     | 11 ++--
 arch/x86/mm/kasan_init_64.c               | 24 ++++++-
 arch/x86/mm/maccess.c                     |  2 +-
 arch/x86/mm/physaddr.c                    |  2 +
 include/linux/kasan-tags.h                | 21 ++++--
 include/linux/kasan.h                     | 13 ++--
 include/linux/mm.h                        |  6 +-
 include/linux/mmzone.h                    |  2 +-
 include/linux/page-flags-layout.h         |  9 +--
 lib/Kconfig.kasan                         |  3 +-
 mm/execmem.c                              |  9 ++-
 mm/kasan/kasan.h                          |  7 ++
 mm/kasan/report.c                         | 15 ++++-
 mm/vmalloc.c                              |  7 +-
 scripts/Makefile.kasan                    |  3 +
 scripts/gdb/linux/kasan.py                |  5 +-
 scripts/gdb/linux/mm.py                   |  5 +-
 38 files changed, 340 insertions(+), 74 deletions(-)
 create mode 100644 arch/arm64/include/asm/kasan-tags.h
 create mode 100644 arch/arm64/mm/kasan_sw_tags.c
 create mode 100644 arch/x86/include/asm/kasan-tags.h

--=20
2.53.0



