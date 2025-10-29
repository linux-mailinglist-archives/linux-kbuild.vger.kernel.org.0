Return-Path: <linux-kbuild+bounces-9308-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBB3C1CEEB
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 21CFF4E4BCB
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 19:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785DE359708;
	Wed, 29 Oct 2025 19:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="H4tX2CgX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D7358D3D
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761764791; cv=none; b=FIdD1P6dLjpajg6zVzDMo2GxCNWchlEPnNUabkUmJaXgglWWej6y2Am7Uqet6I8ejP0gGxNmkHCniUaLPh9BBJSm7IYdpHbzBfetIBp7XpZeWtyOjU5hvdDsU/OL5yQ+mz/sysvIZFlXd9YwAJ8fjO3xLfdTs0/IlB8QnVPTp8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761764791; c=relaxed/simple;
	bh=bJqOLRh5AHXtNPhQL4KECEBFIG6XjKIdfPp+UO0i17o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQr2nwpKHqH/EInPDkk2zdyLG8inCEHPQ67rKJkq5cAmZ1G7GN57Xt2BmDUNWqdNa85RUsYuzyr5nKXJl0ZsD8MkayPwVwFbgVIs5z6V6Jhasm+DRb/63ZmxGlZiVL4Nja1VZ6VJrlCKDTko6obGSdH1fJFRQxrHatJusPN7HGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=H4tX2CgX; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761764786; x=1762023986;
	bh=jxLQWxZR1uUIJx1zLFGYnHCjTfyYOaAydFAYRdFzgVE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=H4tX2CgX2I46gjCYLXUey1izXUjeYYlVYJLkj6haus0rWX1Ik/lAVr4Ep8q33tSLR
	 U6vGRWtoKELsOGMIDVJkARcEln+7pVGxbgUevhvqWXYL6Ib8pMQ2jtbrmkwjkfvXhL
	 l5AtZ+pi06lU+HHuyy7mbuH7kGYp6NpTX6eiGgjWCGttWb+vaJ10/LENS2igc6PgDO
	 up6HXVnm175PpnjYVxIFu2VDJZZ6XfePsrl6RZRn+MRWw1cojvOeOaRVSst1cnCtvB
	 xxCtJpb+O28I+6ulCMBXklDx4NJoW3FMVrnxePy7aMv7RIIgTLzfdkhx1xmqddzP0r
	 dHvmMrlRp8MUA==
Date: Wed, 29 Oct 2025 19:06:17 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 03/18] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: d92e0c1a55128f8d1bfda37556d8adda3911f1d0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Samuel Holland <samuel.holland@sifive.com>

Currently, kasan_mem_to_shadow() uses a logical right shift, which turns
canonical kernel addresses into non-canonical addresses by clearing the
high KASAN_SHADOW_SCALE_SHIFT bits. The value of KASAN_SHADOW_OFFSET is
then chosen so that the addition results in a canonical address for the
shadow memory.

For KASAN_GENERIC, this shift/add combination is ABI with the compiler,
because KASAN_SHADOW_OFFSET is used in compiler-generated inline tag
checks[1], which must only attempt to dereference canonical addresses.

However, for KASAN_SW_TAGS there is some freedom to change the algorithm
without breaking the ABI. Because TBI is enabled for kernel addresses,
the top bits of shadow memory addresses computed during tag checks are
irrelevant, and so likewise are the top bits of KASAN_SHADOW_OFFSET.
This is demonstrated by the fact that LLVM uses a logical right shift in
the tag check fast path[2] but a sbfx (signed bitfield extract)
instruction in the slow path[3] without causing any issues.

Using an arithmetic shift in kasan_mem_to_shadow() provides a number of
benefits:

1) The memory layout doesn't change but is easier to understand.
KASAN_SHADOW_OFFSET becomes a canonical memory address, and the shifted
pointer becomes a negative offset, so KASAN_SHADOW_OFFSET =3D=3D
KASAN_SHADOW_END regardless of the shift amount or the size of the
virtual address space.

2) KASAN_SHADOW_OFFSET becomes a simpler constant, requiring only one
instruction to load instead of two. Since it must be loaded in each
function with a tag check, this decreases kernel text size by 0.5%.

3) This shift and the sign extension from kasan_reset_tag() can be
combined into a single sbfx instruction. When this same algorithm change
is applied to the compiler, it removes an instruction from each inline
tag check, further reducing kernel text size by an additional 4.6%.

These benefits extend to other architectures as well. On RISC-V, where
the baseline ISA does not shifted addition or have an equivalent to the
sbfx instruction, loading KASAN_SHADOW_OFFSET is reduced from 3 to 2
instructions, and kasan_mem_to_shadow(kasan_reset_tag(addr)) similarly
combines two consecutive right shifts.

Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tr=
ansforms/Instrumentation/AddressSanitizer.cpp#L1316 [1]
Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tr=
ansforms/Instrumentation/HWAddressSanitizer.cpp#L895 [2]
Link: https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Ta=
rget/AArch64/AArch64AsmPrinter.cpp#L669 [3]
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
Changelog v6: (Maciej)
- Add Catalin's acked-by.
- Move x86 gdb snippet here from the last patch.

Changelog v5: (Maciej)
- (u64) -> (unsigned long) in report.c

Changelog v4: (Maciej)
- Revert x86 to signed mem_to_shadow mapping.
- Remove last two paragraphs since they were just poorer duplication of
  the comments in kasan_non_canonical_hook().

Changelog v3: (Maciej)
- Fix scripts/gdb/linux/kasan.py so the new signed mem_to_shadow() is
  reflected there.
- Fix Documentation/arch/arm64/kasan-offsets.sh to take new offsets into
  account.
- Made changes to the kasan_non_canonical_hook() according to upstream
  discussion. Settled on overflow on both ranges and separate checks for
  x86 and arm.

Changelog v2: (Maciej)
- Correct address range that's checked in kasan_non_canonical_hook().
  Adjust the comment inside.
- Remove part of comment from arch/arm64/include/asm/memory.h.
- Append patch message paragraph about the overflow in
  kasan_non_canonical_hook().

 Documentation/arch/arm64/kasan-offsets.sh |  8 +++--
 arch/arm64/Kconfig                        | 10 +++----
 arch/arm64/include/asm/memory.h           | 14 ++++++++-
 arch/arm64/mm/kasan_init.c                |  7 +++--
 include/linux/kasan.h                     | 10 +++++--
 mm/kasan/report.c                         | 36 ++++++++++++++++++++---
 scripts/gdb/linux/kasan.py                |  5 +++-
 scripts/gdb/linux/mm.py                   |  5 ++--
 8 files changed, 76 insertions(+), 19 deletions(-)
 mode change 100644 =3D> 100755 Documentation/arch/arm64/kasan-offsets.sh

diff --git a/Documentation/arch/arm64/kasan-offsets.sh b/Documentation/arch=
/arm64/kasan-offsets.sh
old mode 100644
new mode 100755
index 2dc5f9e18039..ce777c7c7804
--- a/Documentation/arch/arm64/kasan-offsets.sh
+++ b/Documentation/arch/arm64/kasan-offsets.sh
@@ -5,8 +5,12 @@
=20
 print_kasan_offset () {
 =09printf "%02d\t" $1
-=09printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) \
-=09=09=09- (1 << (64 - 32 - $2)) ))
+=09if [[ $2 -ne 4 ]] then
+=09=09printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) \
+=09=09=09=09- (1 << (64 - 32 - $2)) ))
+=09else
+=09=09printf "0x%08x00000000\n" $(( (0xffffffff & (-1 << ($1 - 1 - 32))) )=
)
+=09fi
 }
=20
 echo KASAN_SHADOW_SCALE_SHIFT =3D 3
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..ac50ba2d760b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -433,11 +433,11 @@ config KASAN_SHADOW_OFFSET
 =09default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
 =09default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
 =09default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
-=09default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 &&=
 !ARM64_16K_PAGES)) && KASAN_SW_TAGS
-=09default 0xefffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) &&=
 ARM64_16K_PAGES && KASAN_SW_TAGS
-=09default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
-=09default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
-=09default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
+=09default 0xffff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 &&=
 !ARM64_16K_PAGES)) && KASAN_SW_TAGS
+=09default 0xffffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) &&=
 ARM64_16K_PAGES && KASAN_SW_TAGS
+=09default 0xfffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
+=09default 0xffffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
+=09default 0xfffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
 =09default 0xffffffffffffffff
=20
 config UNWIND_TABLES
diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memor=
y.h
index f1505c4acb38..7bbebde59a75 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -89,7 +89,15 @@
  *
  * KASAN_SHADOW_END is defined first as the shadow address that correspond=
s to
  * the upper bound of possible virtual kernel memory addresses UL(1) << 64
- * according to the mapping formula.
+ * according to the mapping formula. For Generic KASAN, the address in the
+ * mapping formula is treated as unsigned (part of the compiler's ABI), so=
 the
+ * end of the shadow memory region is at a large positive offset from
+ * KASAN_SHADOW_OFFSET. For Software Tag-Based KASAN, the address in the
+ * formula is treated as signed. Since all kernel addresses are negative, =
they
+ * map to shadow memory below KASAN_SHADOW_OFFSET, making KASAN_SHADOW_OFF=
SET
+ * itself the end of the shadow memory region. (User pointers are positive=
 and
+ * would map to shadow memory above KASAN_SHADOW_OFFSET, but shadow memory=
 is
+ * not allocated for them.)
  *
  * KASAN_SHADOW_START is defined second based on KASAN_SHADOW_END. The sha=
dow
  * memory start must map to the lowest possible kernel virtual memory addr=
ess
@@ -100,7 +108,11 @@
  */
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 #define KASAN_SHADOW_OFFSET=09_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+#ifdef CONFIG_KASAN_GENERIC
 #define KASAN_SHADOW_END=09((UL(1) << (64 - KASAN_SHADOW_SCALE_SHIFT)) + K=
ASAN_SHADOW_OFFSET)
+#else
+#define KASAN_SHADOW_END=09KASAN_SHADOW_OFFSET
+#endif
 #define _KASAN_SHADOW_START(va)=09(KASAN_SHADOW_END - (UL(1) << ((va) - KA=
SAN_SHADOW_SCALE_SHIFT)))
 #define KASAN_SHADOW_START=09_KASAN_SHADOW_START(vabits_actual)
 #define PAGE_END=09=09KASAN_SHADOW_START
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index abeb81bf6ebd..937f6eb8115b 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -198,8 +198,11 @@ static bool __init root_level_aligned(u64 addr)
 /* The early shadow maps everything to a single page of zeroes */
 asmlinkage void __init kasan_early_init(void)
 {
-=09BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D
-=09=09KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+=09if (IS_ENABLED(CONFIG_KASAN_GENERIC))
+=09=09BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D
+=09=09=09KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
+=09else
+=09=09BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=3D KASAN_SHADOW_END);
 =09BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS), SHADOW_ALIGN));
 =09BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS_MIN), SHADOW_ALIGN=
));
 =09BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, SHADOW_ALIGN));
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index b00849ea8ffd..952ade776e51 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -61,8 +61,14 @@ int kasan_populate_early_shadow(const void *shadow_start=
,
 #ifndef kasan_mem_to_shadow
 static inline void *kasan_mem_to_shadow(const void *addr)
 {
-=09return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
-=09=09+ KASAN_SHADOW_OFFSET;
+=09void *scaled;
+
+=09if (IS_ENABLED(CONFIG_KASAN_GENERIC))
+=09=09scaled =3D (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)=
;
+=09else
+=09=09scaled =3D (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
+
+=09return KASAN_SHADOW_OFFSET + scaled;
 }
 #endif
=20
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 62c01b4527eb..50d487a0687a 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -642,11 +642,39 @@ void kasan_non_canonical_hook(unsigned long addr)
 =09const char *bug_type;
=20
 =09/*
-=09 * All addresses that came as a result of the memory-to-shadow mapping
-=09 * (even for bogus pointers) must be >=3D KASAN_SHADOW_OFFSET.
+=09 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shif=
t
+=09 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
+=09 * both x86 and arm64). Thus, the possible shadow addresses (even for
+=09 * bogus pointers) belong to a single contiguous region that is the
+=09 * result of kasan_mem_to_shadow() applied to the whole address space.
 =09 */
-=09if (addr < KASAN_SHADOW_OFFSET)
-=09=09return;
+=09if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0UL)) ||
+=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0UL)))
+=09=09=09return;
+=09}
+
+=09/*
+=09 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
+=09 * arithmetic shift. Normally, this would make checking for a possible
+=09 * shadow address complicated, as the shadow address computation
+=09 * operation would overflow only for some memory addresses. However, du=
e
+=09 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
+=09 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
+=09 * the overflow always happens.
+=09 *
+=09 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
+=09 * possible shadow addresses belong to a region that is the result of
+=09 * kasan_mem_to_shadow() applied to the memory range
+=09 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
+=09 * resulting possible shadow region is contiguous, as the overflow
+=09 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
+=09 */
+=09if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
+=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFUL << 56)=
) ||
+=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0UL)))
+=09=09=09return;
+=09}
=20
 =09orig_addr =3D (unsigned long)kasan_shadow_to_mem((void *)addr);
=20
diff --git a/scripts/gdb/linux/kasan.py b/scripts/gdb/linux/kasan.py
index 56730b3fde0b..4b86202b155f 100644
--- a/scripts/gdb/linux/kasan.py
+++ b/scripts/gdb/linux/kasan.py
@@ -7,7 +7,8 @@
 #
=20
 import gdb
-from linux import constants, mm
+from linux import constants, utils, mm
+from ctypes import c_int64 as s64
=20
 def help():
     t =3D """Usage: lx-kasan_mem_to_shadow [Hex memory addr]
@@ -39,6 +40,8 @@ class KasanMemToShadow(gdb.Command):
         else:
             help()
     def kasan_mem_to_shadow(self, addr):
+        if constants.CONFIG_KASAN_SW_TAGS and not utils.is_target_arch('x8=
6'):
+            addr =3D s64(addr)
         return (addr >> self.p_ops.KASAN_SHADOW_SCALE_SHIFT) + self.p_ops.=
KASAN_SHADOW_OFFSET
=20
 KasanMemToShadow()
diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
index 7571aebbe650..2e63f3dedd53 100644
--- a/scripts/gdb/linux/mm.py
+++ b/scripts/gdb/linux/mm.py
@@ -110,12 +110,13 @@ class aarch64_page_ops():
         self.KERNEL_END =3D gdb.parse_and_eval("_end")
=20
         if constants.LX_CONFIG_KASAN_GENERIC or constants.LX_CONFIG_KASAN_=
SW_TAGS:
+            self.KASAN_SHADOW_OFFSET =3D constants.LX_CONFIG_KASAN_SHADOW_=
OFFSET
             if constants.LX_CONFIG_KASAN_GENERIC:
                 self.KASAN_SHADOW_SCALE_SHIFT =3D 3
+                self.KASAN_SHADOW_END =3D (1 << (64 - self.KASAN_SHADOW_SC=
ALE_SHIFT)) + self.KASAN_SHADOW_OFFSET
             else:
                 self.KASAN_SHADOW_SCALE_SHIFT =3D 4
-            self.KASAN_SHADOW_OFFSET =3D constants.LX_CONFIG_KASAN_SHADOW_=
OFFSET
-            self.KASAN_SHADOW_END =3D (1 << (64 - self.KASAN_SHADOW_SCALE_=
SHIFT)) + self.KASAN_SHADOW_OFFSET
+                self.KASAN_SHADOW_END =3D self.KASAN_SHADOW_OFFSET
             self.PAGE_END =3D self.KASAN_SHADOW_END - (1 << (self.vabits_a=
ctual - self.KASAN_SHADOW_SCALE_SHIFT))
         else:
             self.PAGE_END =3D self._PAGE_END(self.VA_BITS_MIN)
--=20
2.51.0



