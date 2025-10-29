Return-Path: <linux-kbuild+bounces-9318-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFFDC1D23A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 570E63435C6
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127A5350A09;
	Wed, 29 Oct 2025 20:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bjmx3g8O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161EE32862C
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 20:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768471; cv=none; b=DKEOsE11E1k4rVzogVo0kHiM5XHtOm32UMMzqBSNWNHpcKfYYRWOsEuAp4nqW+Uagz1eqDGL8QZ6btsaamNYTar59RLIRYCgdcN9r+FV0AKovkJXxW/N/mXAvWbED96njXmWXthY2U0Cidx/Rf1AJGdwxgZ28X6bAxs1qjPEI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768471; c=relaxed/simple;
	bh=pG6PmCayk69IIjMpN+E9J4X5ppcFU9gBb5y0rPTdVEE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AOBUnlzRPXrEGDvebATNExmmHmqHhfHbVPJ/zDBcCGqabRYF1YUSgTZXCQ3B7esjdcCAOyvPn5oLNP8GGwmwAfcRlRDEwIULuUsMxXVAm65PHQEDAv3jyNobZgFy1e2JGYftOrXzID/5FeWQ/DAbFEC7Et9jfVokpl+h7v2a4wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bjmx3g8O; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768465; x=1762027665;
	bh=h7bOmcRxuqO6z3MZPe9zBvs6V2vz8fOGqA1RpHhG/FE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bjmx3g8OlacQX7FEB7CB4gFpPcUTD0I5Kc1p43/y9uXqIMVnKJWIWOuru2SF/QQfu
	 6AiAPDukFzXStuxWTR5WDI0wUwQ3jAjKxjVKN/rW5W4cFnmYpLhh/SnXC+CNzfiPNN
	 yCU0Y0WKKnfImz6JKMr3Dj0qQjo+Mp/U3OEVrV6kaX0VUG3dIxPsjjzPd48CTfn+MD
	 HpUu7+z+rhYq8apG5mFFr/w3+YtjPLc59AwJlIe7QmemdTNU+aT/cA3JtTnT2ge0If
	 nWKsUZ1l87vhw5I/ZZHp5y2xOcPYMO6CexFWC9kS9HmKpnu1vWPf8OvbB4AV2iSubm
	 Hlcw1buJNqcCg==
Date: Wed, 29 Oct 2025 20:07:38 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 11/18] x86/kasan: KASAN raw shadow memory PTE init
Message-ID: <f533bb094a566242ec196afbde222796c6d6c084.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 388931058df330f6e092950b7ef3ba7585e70752
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

In KASAN's generic mode the default value in shadow memory is zero.
During initialization of shadow memory pages they are allocated and
zeroed.

In KASAN's tag-based mode the default tag for the arm64 architecture is
0xFE which corresponds to any memory that should not be accessed. On x86
(where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
during the initializations all the bytes in shadow memory pages should
be filled with it.

Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
avoid zeroing out the memory so it can be set with the KASAN invalid
tag.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v2:
- Remove dense mode references, use memset() instead of kasan_poison().

 arch/x86/mm/kasan_init_64.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 998b6010d6d3..e69b7210aaae 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -34,6 +34,18 @@ static __init void *early_alloc(size_t size, int nid, bo=
ol should_panic)
 =09return ptr;
 }
=20
+static __init void *early_raw_alloc(size_t size, int nid, bool should_pani=
c)
+{
+=09void *ptr =3D memblock_alloc_try_nid_raw(size, size,
+=09=09=09__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+
+=09if (!ptr && should_panic)
+=09=09panic("%pS: Failed to allocate page, nid=3D%d from=3D%lx\n",
+=09=09      (void *)_RET_IP_, nid, __pa(MAX_DMA_ADDRESS));
+
+=09return ptr;
+}
+
 static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
 =09=09=09=09      unsigned long end, int nid)
 {
@@ -63,8 +75,9 @@ static void __init kasan_populate_pmd(pmd_t *pmd, unsigne=
d long addr,
 =09=09if (!pte_none(*pte))
 =09=09=09continue;
=20
-=09=09p =3D early_alloc(PAGE_SIZE, nid, true);
-=09=09entry =3D pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
+=09=09p =3D early_raw_alloc(PAGE_SIZE, nid, true);
+=09=09memset(p, PAGE_SIZE, KASAN_SHADOW_INIT);
+=09=09entry =3D pfn_pte(PFN_DOWN(__pa_nodebug(p)), PAGE_KERNEL);
 =09=09set_pte_at(&init_mm, addr, pte, entry);
 =09} while (pte++, addr +=3D PAGE_SIZE, addr !=3D end);
 }
@@ -436,7 +449,7 @@ void __init kasan_init(void)
 =09 * it may contain some garbage. Now we can clear and write protect it,
 =09 * since after the TLB flush no one should write to it.
 =09 */
-=09memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+=09memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 =09for (i =3D 0; i < PTRS_PER_PTE; i++) {
 =09=09pte_t pte;
 =09=09pgprot_t prot;
--=20
2.51.0



