Return-Path: <linux-kbuild+bounces-9322-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AD2C1D297
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E73D64E2B6A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5312E3587A1;
	Wed, 29 Oct 2025 20:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="pBdq+49r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E842B31A55B
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768603; cv=none; b=HA8294Od5XaxQp1TTQkcK5YpZmEN8s2sr8ruiWcAOAixGkQ+fmFB7nVZoNc0XXVu2Iix6/9wA8BK094wxlYWGcuU5p/YP1BKUpPKrwfuoG1Rfsm3tOJ5QG7VKkVv18PEmTkHcvpKLXP/X0RlRWRJmLahSiXckhRI4BcZ7iOCnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768603; c=relaxed/simple;
	bh=jEmJKiDGaKr1Ozen4a1EogitDsnx48GxuX85uDh3IVc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=okmjlKhNSgArbpfDrQocWKsBLZ6H/ZQ/37WQGynLpVHo8q4ux1ipd0gEfzEHzUU++vuvQ5hNQHOqESM8CWS+PLA2/xC20zxPxZg3+kwCf19uV0bbBrHv4O27hFFImgYPdvBvJHO0+s63v7kWOTHv9tV6AUKeaZg4N+f33wTGIRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=pBdq+49r; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768596; x=1762027796;
	bh=IfDaBLNxvsgHIrxT5fF1MIs0svV8id6MA4rHYub5Mv4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=pBdq+49rTHNOBK233h+hE/8kgDm119V2Cyxh6x3CJfUMZgrImJKljJzkL1rJ7FpqB
	 oGMZ1cBZqpXVXJeKUzdFZqImw5pwDEW+1z5wCJPnEHS7j4lEg1vdCjyI/cvYqUJuMo
	 9T8x43dN+CeMwlYtpVk04VWb2INWjgDZeF+hJggjQ/XfdfovcfacS5HJQor96976tN
	 zvdFuxv3E95MUK8nGO6R/5N7r2oC8TGp5QLzX5KaAhpJPaYXTlr0MKSh/ikIdguoT/
	 L/3HACO477GDPSw6c54QqDArd+BB1hZxgTw0xETeO0yJRwxcwh9nAkRfr621JKAlIN
	 2B4VfucEgl9IQ==
Date: Wed, 29 Oct 2025 20:09:51 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 15/18] x86/kasan: Handle UD1 for inline KASAN reports
Message-ID: <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: db233bf96a7423ff32d19231938d1a80a3e5afe6
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Inline KASAN on x86 should do tag mismatch reports by passing the
metadata through the UD1 instruction and the faulty address through RDI,
a scheme that's already used by UBSan and is easy to extend.

The current LLVM way of passing KASAN software tag mode metadata is done
using the INT3 instruction. However that should be changed because it
doesn't align to how the kernel already handles UD1 for similar use
cases. Since inline software tag-based KASAN doesn't work on x86 due to
missing compiler support it can be fixed and the INT3 can be changed to
UD1 at the same time.

Add a kasan component to the #UD decoding and handling functions.

Make part of that hook - which decides whether to die or recover from a
tag mismatch - arch independent to avoid duplicating a long comment on
both x86 and arm64 architectures.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v6:
- Change the whole patch from using INT3 to UD1.

Changelog v5:
- Add die to argument list of kasan_inline_recover() in
  arch/arm64/kernel/traps.c.

Changelog v4:
- Make kasan_handler() a stub in a header file. Remove #ifdef from
  traps.c.
- Consolidate the "recover" comment into one place.
- Make small changes to the patch message.

 MAINTAINERS                  |  2 +-
 arch/x86/include/asm/bug.h   |  1 +
 arch/x86/include/asm/kasan.h | 20 ++++++++++++++++++++
 arch/x86/kernel/traps.c      |  8 ++++++++
 arch/x86/mm/Makefile         |  2 ++
 arch/x86/mm/kasan_inline.c   | 21 +++++++++++++++++++++
 include/linux/kasan.h        | 23 +++++++++++++++++++++++
 7 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 arch/x86/mm/kasan_inline.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 53cbc7534911..a6e3cc2f3cc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13422,7 +13422,7 @@ S:=09Maintained
 B:=09https://bugzilla.kernel.org/buglist.cgi?component=3DSanitizers&produc=
t=3DMemory%20Management
 F:=09Documentation/dev-tools/kasan.rst
 F:=09arch/*/include/asm/*kasan*.h
-F:=09arch/*/mm/kasan_init*
+F:=09arch/*/mm/kasan_*
 F:=09include/linux/kasan*.h
 F:=09lib/Kconfig.kasan
 F:=09mm/kasan/
diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 880ca15073ed..428c8865b995 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -31,6 +31,7 @@
 #define BUG_UD2=09=09=090xfffe
 #define BUG_UD1=09=09=090xfffd
 #define BUG_UD1_UBSAN=09=090xfffc
+#define BUG_UD1_KASAN=09=090xfffb
 #define BUG_UDB=09=09=090xffd6
 #define BUG_LOCK=09=090xfff0
=20
diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 396071832d02..375651d9b114 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -6,6 +6,24 @@
 #include <linux/kasan-tags.h>
 #include <linux/types.h>
 #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
+
+/*
+ * LLVM ABI for reporting tag mismatches in inline KASAN mode.
+ * On x86 the UD1 instruction is used to carry metadata in the ECX registe=
r
+ * to the KASAN report. ECX is used to differentiate KASAN from UBSan when
+ * decoding the UD1 instruction.
+ *
+ * SIZE refers to how many bytes the faulty memory access
+ * requested.
+ * WRITE bit, when set, indicates the access was a write, otherwise
+ * it was a read.
+ * RECOVER bit, when set, should allow the kernel to carry on after
+ * a tag mismatch. Otherwise die() is called.
+ */
+#define KASAN_ECX_RECOVER=090x20
+#define KASAN_ECX_WRITE=09=090x10
+#define KASAN_ECX_SIZE_MASK=090x0f
+#define KASAN_ECX_SIZE(ecx)=09(1 << ((ecx) & KASAN_ECX_SIZE_MASK))
 #define KASAN_SHADOW_SCALE_SHIFT 3
=20
 /*
@@ -34,10 +52,12 @@
 #define __tag_shifted(tag)=09=09FIELD_PREP(GENMASK_ULL(60, 57), tag)
 #define __tag_reset(addr)=09=09(sign_extend64((u64)(addr), 56))
 #define __tag_get(addr)=09=09=09((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)a=
ddr))
+void kasan_inline_handler(struct pt_regs *regs);
 #else
 #define __tag_shifted(tag)=09=090UL
 #define __tag_reset(addr)=09=09(addr)
 #define __tag_get(addr)=09=09=090
+static inline void kasan_inline_handler(struct pt_regs *regs) { }
 #endif /* CONFIG_KASAN_SW_TAGS */
=20
 #ifdef CONFIG_64BIT
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 6b22611e69cc..40fefd306c76 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -179,6 +179,9 @@ __always_inline int decode_bug(unsigned long addr, s32 =
*imm, int *len)
 =09if (X86_MODRM_REG(v) =3D=3D 0)=09/* EAX */
 =09=09return BUG_UD1_UBSAN;
=20
+=09if (X86_MODRM_REG(v) =3D=3D 1)=09/* ECX */
+=09=09return BUG_UD1_KASAN;
+
 =09return BUG_UD1;
 }
=20
@@ -357,6 +360,11 @@ static noinstr bool handle_bug(struct pt_regs *regs)
 =09=09}
 =09=09break;
=20
+=09case BUG_UD1_KASAN:
+=09=09kasan_inline_handler(regs);
+=09=09handled =3D true;
+=09=09break;
+
 =09default:
 =09=09break;
 =09}
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index 5b9908f13dcf..1dc18090cbe7 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -36,7 +36,9 @@ obj-$(CONFIG_PTDUMP)=09=09+=3D dump_pagetables.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)=09+=3D debug_pagetables.o
=20
 KASAN_SANITIZE_kasan_init_$(BITS).o :=3D n
+KASAN_SANITIZE_kasan_inline.o :=3D n
 obj-$(CONFIG_KASAN)=09=09+=3D kasan_init_$(BITS).o
+obj-$(CONFIG_KASAN_SW_TAGS)=09+=3D kasan_inline.o
=20
 KMSAN_SANITIZE_kmsan_shadow.o=09:=3D n
 obj-$(CONFIG_KMSAN)=09=09+=3D kmsan_shadow.o
diff --git a/arch/x86/mm/kasan_inline.c b/arch/x86/mm/kasan_inline.c
new file mode 100644
index 000000000000..65641557c294
--- /dev/null
+++ b/arch/x86/mm/kasan_inline.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kasan.h>
+#include <linux/kdebug.h>
+
+void kasan_inline_handler(struct pt_regs *regs)
+{
+=09int metadata =3D regs->cx;
+=09u64 addr =3D regs->di;
+=09u64 pc =3D regs->ip;
+=09bool recover =3D metadata & KASAN_ECX_RECOVER;
+=09bool write =3D metadata & KASAN_ECX_WRITE;
+=09size_t size =3D KASAN_ECX_SIZE(metadata);
+
+=09if (user_mode(regs))
+=09=09return;
+
+=09if (!kasan_report((void *)addr, size, write, pc))
+=09=09return;
+
+=09kasan_die_unless_recover(recover, "Oops - KASAN", regs, metadata, die);
+}
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 3c0c60ed5d5c..9bd1b1ebd674 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -679,4 +679,27 @@ void kasan_non_canonical_hook(unsigned long addr);
 static inline void kasan_non_canonical_hook(unsigned long addr) { }
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
=20
+#ifdef CONFIG_KASAN_SW_TAGS
+/*
+ * The instrumentation allows to control whether we can proceed after
+ * a crash was detected. This is done by passing the -recover flag to
+ * the compiler. Disabling recovery allows to generate more compact
+ * code.
+ *
+ * Unfortunately disabling recovery doesn't work for the kernel right
+ * now. KASAN reporting is disabled in some contexts (for example when
+ * the allocator accesses slab object metadata; this is controlled by
+ * current->kasan_depth). All these accesses are detected by the tool,
+ * even though the reports for them are not printed.
+ *
+ * This is something that might be fixed at some point in the future.
+ */
+static inline void kasan_die_unless_recover(bool recover, char *msg, struc=
t pt_regs *regs,
+=09unsigned long err, void die_fn(const char *str, struct pt_regs *regs, l=
ong err))
+{
+=09if (!recover)
+=09=09die_fn(msg, regs, err);
+}
+#endif
+
 #endif /* LINUX_KASAN_H */
--=20
2.51.0



