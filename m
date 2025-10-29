Return-Path: <linux-kbuild+bounces-9325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B209C1D2AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B2DAC34CEAE
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D3734F48E;
	Wed, 29 Oct 2025 20:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cXdMGkjY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1FF35A931;
	Wed, 29 Oct 2025 20:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768695; cv=none; b=CGNqqHoBeWtcFpPtAMvJX8yly94dx4amfO9XHq9dfH8lPdCM3RshUai0Y/V99rdCf/OoarFqgKuEu7bMbTQk94TcROTWQxMTCzoMNC8CXasfD155FZ8mExmRk5mcfv6K+7JWwcWeaHuEuXlA2JPyNsJAt8Ymt4aHYe3St1HcxiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768695; c=relaxed/simple;
	bh=i2x6FuRzHHu3DqZfnTFMfT434IIQFJZMu963TwDZRwE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PGqX0V2PHO+v5Qkfg+30nYm6ZgEJMDU1WAAgs2sR3EA+5q53T2pAvc7moM5lv++VgSRZy26qyKCxnSU0aSCUfRCaroYt3RN3xghseFXCNOE8Px/xWS25urx2bAOxSNa4TH/dqY51CEbOvu579sVYoNq58lagmVloK69ewWHFrv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cXdMGkjY; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768688; x=1762027888;
	bh=801m/BDnq+4IDZrRjH01sT6fZRZq5h0m340QBaMU7xk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cXdMGkjYQPcz0Nv21dBbiab8WuIQ4hr8ZJRQqwUepbPD1rbiz/vhDeUFcNs+IGjar
	 od6iv3/pch7jNVp38Q2cmI4VQR0pGdQZyx7xwgvOjcMGXYKinHJUeISc801+Y8WgrO
	 SCNfKcZPXZtF2+rk0dIn06Lyyoiy42cPczWw1N9Ui8kQDW0LXKyASTAfV23YHt8/QB
	 FHk6Lay8dA8JodN9I7Vt57QyS2WDP7aNMHr/4vq1HuuEYHnPPI3dMERBgdU9EwiM+L
	 Mj22z+1Gh8UFKiZFiqV8G56jWG5bH3ehdlP3bMiXUuyMKOD3PJOh+zXTgfnU3nZFJH
	 7Bb570r+dWC+Q==
Date: Wed, 29 Oct 2025 20:11:22 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 18/18] x86/kasan: Make software tag-based kasan available
Message-ID: <d98f04754c3f37f153493c13966c1e02852f551d.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: f951758d099748a231d1551fe212ba144d88e29b
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Make CONFIG_KASAN_SW_TAGS available for x86 machines if they have
ADDRESS_MASKING enabled (LAM) as that works similarly to Top-Byte Ignore
(TBI) that allows the software tag-based mode on arm64 platform.

Set scale macro based on KASAN mode: in software tag-based mode 16 bytes
of memory map to one shadow byte and 8 in generic mode.

Disable CONFIG_KASAN_INLINE and CONFIG_KASAN_STACK when
CONFIG_KASAN_SW_TAGS is enabled on x86 until the appropriate compiler
support is available.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v6:
- Don't enable KASAN if LAM is not supported.
- Move kasan_init_tags() to kasan_init_64.c to not clutter the setup.c
  file.
- Move the #ifdef for the KASAN scale shift here.
- Move the gdb code to patch "Use arithmetic shift for shadow
  computation".
- Return "depends on KASAN" line to Kconfig.
- Add the defer kasan config option so KASAN can be disabled on hardware
  that doesn't have LAM.

Changelog v4:
- Add x86 specific kasan_mem_to_shadow().
- Revert x86 to the older unsigned KASAN_SHADOW_OFFSET. Do the same to
  KASAN_SHADOW_START/END.
- Modify scripts/gdb/linux/kasan.py to keep x86 using unsigned offset.
- Disable inline and stack support when software tags are enabled on
  x86.

Changelog v3:
- Remove runtime_const from previous patch and merge the rest here.
- Move scale shift definition back to header file.
- Add new kasan offset for software tag based mode.
- Fix patch message typo 32 -> 16, and 16 -> 8.
- Update lib/Kconfig.kasan with x86 now having software tag-based
  support.

Changelog v2:
- Remove KASAN dense code.

 Documentation/arch/x86/x86_64/mm.rst | 6 ++++--
 arch/x86/Kconfig                     | 4 ++++
 arch/x86/boot/compressed/misc.h      | 1 +
 arch/x86/include/asm/kasan.h         | 4 ++++
 arch/x86/mm/kasan_init_64.c          | 5 +++++
 lib/Kconfig.kasan                    | 3 ++-
 6 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/=
x86_64/mm.rst
index a6cf05d51bd8..ccbdbb4cda36 100644
--- a/Documentation/arch/x86/x86_64/mm.rst
+++ b/Documentation/arch/x86/x86_64/mm.rst
@@ -60,7 +60,8 @@ Complete virtual memory map with 4-level page tables
    ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unused=
 hole
    ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual me=
mory map (vmemmap_base)
    ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unused=
 hole
-   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shad=
ow memory
+   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shad=
ow memory (generic mode)
+   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN shad=
ow memory (software tag-based mode)
   __________________|____________|__________________|_________|___________=
_________________________________________________
                                                               |
                                                               | Identical =
layout to the 56-bit one from here on:
@@ -130,7 +131,8 @@ Complete virtual memory map with 5-level page tables
    ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused=
 hole
    ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual me=
mory map (vmemmap_base)
    ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused=
 hole
-   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory
+   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory (generic mode)
+   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN shad=
ow memory (software tag-based mode)
   __________________|____________|__________________|_________|___________=
_________________________________________________
                                                               |
                                                               | Identical =
layout to the 47-bit one from here on:
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fa3b616af03a..7c73a2688172 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -67,6 +67,7 @@ config X86
 =09select ARCH_CLOCKSOURCE_INIT
 =09select ARCH_CONFIGURES_CPU_MITIGATIONS
 =09select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
+=09select ARCH_DISABLE_KASAN_INLINE=09if X86_64 && KASAN_SW_TAGS
 =09select ARCH_ENABLE_HUGEPAGE_MIGRATION if X86_64 && HUGETLB_PAGE && MIGR=
ATION
 =09select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64
 =09select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
@@ -196,6 +197,8 @@ config X86
 =09select HAVE_ARCH_JUMP_LABEL_RELATIVE
 =09select HAVE_ARCH_KASAN=09=09=09if X86_64
 =09select HAVE_ARCH_KASAN_VMALLOC=09=09if X86_64
+=09select HAVE_ARCH_KASAN_SW_TAGS=09=09if ADDRESS_MASKING
+=09select ARCH_NEEDS_DEFER_KASAN=09=09if ADDRESS_MASKING
 =09select HAVE_ARCH_KFENCE
 =09select HAVE_ARCH_KMSAN=09=09=09if X86_64
 =09select HAVE_ARCH_KGDB
@@ -406,6 +409,7 @@ config AUDIT_ARCH
 config KASAN_SHADOW_OFFSET
 =09hex
 =09depends on KASAN
+=09default 0xeffffc0000000000 if KASAN_SW_TAGS
 =09default 0xdffffc0000000000
=20
 config HAVE_INTEL_TXT
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/mis=
c.h
index db1048621ea2..ded92b439ada 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -13,6 +13,7 @@
 #undef CONFIG_PARAVIRT_SPINLOCKS
 #undef CONFIG_KASAN
 #undef CONFIG_KASAN_GENERIC
+#undef CONFIG_KASAN_SW_TAGS
=20
 #define __NO_FORTIFY
=20
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 2372397bc3e5..8320fffc71a1 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
=20
+#ifdef CONFIG_KASAN_SW_TAGS
 /*
  * LLVM ABI for reporting tag mismatches in inline KASAN mode.
  * On x86 the UD1 instruction is used to carry metadata in the ECX registe=
r
@@ -24,7 +25,10 @@
 #define KASAN_ECX_WRITE=09=090x10
 #define KASAN_ECX_SIZE_MASK=090x0f
 #define KASAN_ECX_SIZE(ecx)=09(1 << ((ecx) & KASAN_ECX_SIZE_MASK))
+#define KASAN_SHADOW_SCALE_SHIFT 4
+#else
 #define KASAN_SHADOW_SCALE_SHIFT 3
+#endif
=20
 /*
  * Compiler uses shadow offset assuming that addresses start
diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index e69b7210aaae..4a5a4a4d43db 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -465,4 +465,9 @@ void __init kasan_init(void)
=20
 =09init_task.kasan_depth =3D 0;
 =09kasan_init_generic();
+
+=09if (boot_cpu_has(X86_FEATURE_LAM))
+=09=09kasan_init_sw_tags();
+=09else
+=09=09pr_info("KernelAddressSanitizer not initialized (sw-tags): hardware =
doesn't support LAM\n");
 }
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index a4bb610a7a6f..d13ea8da7bfd 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -112,7 +112,8 @@ config KASAN_SW_TAGS
=20
 =09  Requires GCC 11+ or Clang.
=20
-=09  Supported only on arm64 CPUs and relies on Top Byte Ignore.
+=09  Supported on arm64 CPUs that support Top Byte Ignore and on x86 CPUs
+=09  that support Linear Address Masking.
=20
 =09  Consumes about 1/16th of available memory at kernel start and
 =09  add an overhead of ~20% for dynamic allocations.
--=20
2.51.0



