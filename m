Return-Path: <linux-kbuild+bounces-9324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BECACC1D2B5
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 72F794E2321
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18BEB35A93B;
	Wed, 29 Oct 2025 20:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fzcdT/Mg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98AB311587;
	Wed, 29 Oct 2025 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768673; cv=none; b=XYGaRl3Z4A0UVdhUCLdYwRzMg6TBggufYRHAxHfRQ3ZqwkyYhoM/VX2MucZDD1GEbxiAdyUTDNfohX3+QgmEtAoY4pumslFoqlV9Z1JNJldaMeW5a45RcsfK1LYlGSI4eXH73SG1udWJ1Y9/IQZiwVBoLJSXbRMrL2G/b89POkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768673; c=relaxed/simple;
	bh=j2uwSocT6IFw6bbQ1grp87Y3SKSODbUdA2TcfR9tSV8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BTGm++xACNV5CVsnH3QVrZivCgGoM6yB37uAsybTh+kviKgHWUXZ5JZIVLHz9m26kM7m405G8l+PFKNi8ow+EMrkJwnxCQasWfC2jAEXC+A2XuKqFeKFnl7RvpsTgeSJNqIPM9lNVnxe3xM43gS5UOkNegPpshUVU50Z3+1PnQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fzcdT/Mg; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768667; x=1762027867;
	bh=qpGuNHZZR4hchfLUKKttSmaxG+W37eMF01r5+dBbCBY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fzcdT/Mg837dtUDPzN3IZvJaFmIR4Koi9D+v6niFRb/NDXYCqERKygFXgJXDi25Nv
	 opesT+yY+ZAJxBCKk0ZbHNPb4MmR/qTVK0Z2Q1fl5bY9rdus7GvFftgsKs92S3Qtzm
	 u8mvfXIT3aHxC5vDZBVshhQgdWJHoFxaxEJQtYDzMAhElAG7KvcXieapyAoWHrlRUN
	 yJpUT363OVIiMLTqvxO9wi+6g5bah1gyRFRfq8Q1ReHcFkouvWUfWHp20CeXzhITsI
	 U97+N2r0KUpsSmw9ebJH+rNIrUxQ1hFJolDaiMg/U/CTV4shVJNvcKz19+T0ukaPqk
	 nmoReRkSuQ50g==
Date: Wed, 29 Oct 2025 20:11:00 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 17/18] x86/kasan: Logical bit shift for kasan_mem_to_shadow
Message-ID: <81848c9df2dc22e9d9104c8276879e6e849a5087.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 1962ec27b7155c20b7f866d92710251ffdf5f53c
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

While generally tag-based KASAN adopts an arithemitc bit shift to
convert a memory address to a shadow memory address, it doesn't work for
all cases on x86. Testing different shadow memory offsets proved that
either 4 or 5 level paging didn't work correctly or inline mode ran into
issues. Thus the best working scheme is the logical bit shift and
non-canonical shadow offset that x86 uses for generic KASAN, of course
adjusted for the increased granularity from 8 to 16 bytes.

Add an arch specific implementation of kasan_mem_to_shadow() that uses
the logical bit shift.

The non-canonical hook tries to calculate whether an address came from
kasan_mem_to_shadow(). First it checks whether this address fits into
the legal set of values possible to output from the mem to shadow
function.

Tie both generic and tag-based x86 KASAN modes to the address range
check associated with generic KASAN.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Add this patch to the series.

 arch/x86/include/asm/kasan.h | 7 +++++++
 mm/kasan/report.c            | 5 +++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 375651d9b114..2372397bc3e5 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -49,6 +49,13 @@
 #include <linux/bits.h>
=20
 #ifdef CONFIG_KASAN_SW_TAGS
+static inline void *__kasan_mem_to_shadow(const void *addr)
+{
+=09return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
+=09=09+ KASAN_SHADOW_OFFSET;
+}
+
+#define kasan_mem_to_shadow(addr)=09__kasan_mem_to_shadow(addr)
 #define __tag_shifted(tag)=09=09FIELD_PREP(GENMASK_ULL(60, 57), tag)
 #define __tag_reset(addr)=09=09(sign_extend64((u64)(addr), 56))
 #define __tag_get(addr)=09=09=09((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)a=
ddr))
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 50d487a0687a..fd8fe004b0c0 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -642,13 +642,14 @@ void kasan_non_canonical_hook(unsigned long addr)
 =09const char *bug_type;
=20
 =09/*
-=09 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shif=
t
+=09 * For Generic KASAN and Software Tag-Based mode on the x86
+=09 * architecture, kasan_mem_to_shadow() uses the logical right shift
 =09 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
 =09 * both x86 and arm64). Thus, the possible shadow addresses (even for
 =09 * bogus pointers) belong to a single contiguous region that is the
 =09 * result of kasan_mem_to_shadow() applied to the whole address space.
 =09 */
-=09if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+=09if (IS_ENABLED(CONFIG_KASAN_GENERIC) || IS_ENABLED(CONFIG_X86_64)) {
 =09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0UL)) ||
 =09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0UL)))
 =09=09=09return;
--=20
2.51.0



