Return-Path: <linux-kbuild+bounces-9316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5122FC1D24C
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19A354E41A9
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA7435A151;
	Wed, 29 Oct 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Q8fbvGeL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CBD314A80;
	Wed, 29 Oct 2025 20:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768435; cv=none; b=ZgRfA7xAAYt/HShkTmhrCEDwa/oK8BsO0Ba7Fw3DmlgiVgJ05lBIZlM9sptfBeYWQ+Qifr4zP2WJIM1BM8Ah/GZ82EV2Vtpmg7ohR61k4ALRSxp1l9EYajOwzJtl46K5Bmb2cp8zlBXP/cwg1hFaHTMNz3iH/IOvS34o0HOinig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768435; c=relaxed/simple;
	bh=+cA2njdiqaGsLKzMeaYLJnV2PWefw9DHpnKbgEVAOp8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttKHM82N3Do8VRNI+8rRx5ifJN6zhPmU8txt2xxnNJvw4kPg1dRByK1C7YCwVD+SXWlm48E1qIjzC6USoE9gVlnx9L9hjNl5HQxu3Ln7DHJ2zkF2seMZtYw5uM/MKWE7Hr7gRLA4Au02qvxJsxc4fqYmBMm1XGF7x2TrbfQU0tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Q8fbvGeL; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768428; x=1762027628;
	bh=ORgS5h+xBvFClF5iXcyTXC092gY8CGZFTCYy/D6hFpU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Q8fbvGeL2ExKLfg1F1thHnRQ92jM0SfvidRW/4ypa4lolos8RCX0lLu+i2H6kTK6S
	 MaA1nBDNDQPyyfdcKvl+1OcEfLMV2Viqk9a+x2KT3lXIr9hXFR4fmSs0XylD1sTGie
	 tsO96krT1yWQpKu1JBZ1xoqT/Am1AJerQd1O8H4fUA92e+JgBxhZqZgpSkBFj0QbBY
	 kK5jeFm7SA2QiUwxKEOqXSEioeBK0pAcc9z8/Bx7JbdabNmBwQBKWD9VAd4AMK2nqH
	 tn//iBIEYCz7O+2enlz2b7WX/VCaIyvT/kkUpw3q6WdAghPk/Ks4hSNUdaZmzn+OT9
	 2SUvjbSgsrkKQ==
Date: Wed, 29 Oct 2025 20:07:02 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 10/18] x86/mm: Physical address comparisons in fill_p*d/pte
Message-ID: <da6cee1f1e596da12ef6e57202c26ec802f7528a.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 931b8bb7920f3633ea9d19d797d43379e99d4838
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Calculating page offset returns a pointer without a tag. When comparing
the calculated offset to a tagged page pointer an error is raised
because they are not equal.

Change pointer comparisons to physical address comparisons as to avoid
issues with tagged pointers that pointer arithmetic would create. Open
code pte_offset_kernel(), pmd_offset(), pud_offset() and p4d_offset().
Because one parameter is always zero and the rest of the function
insides are enclosed inside __va(), removing that layer lowers the
complexity of final assembly.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v2:
- Open code *_offset() to avoid it's internal __va().

 arch/x86/mm/init_64.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 0e4270e20fad..2d79fc0cf391 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -269,7 +269,10 @@ static p4d_t *fill_p4d(pgd_t *pgd, unsigned long vaddr=
)
 =09if (pgd_none(*pgd)) {
 =09=09p4d_t *p4d =3D (p4d_t *)spp_getpage();
 =09=09pgd_populate(&init_mm, pgd, p4d);
-=09=09if (p4d !=3D p4d_offset(pgd, 0))
+
+=09=09if (__pa(p4d) !=3D (pgtable_l5_enabled() ?
+=09=09=09=09  __pa(pgd) :
+=09=09=09=09  (unsigned long)pgd_val(*pgd) & PTE_PFN_MASK))
 =09=09=09printk(KERN_ERR "PAGETABLE BUG #00! %p <-> %p\n",
 =09=09=09       p4d, p4d_offset(pgd, 0));
 =09}
@@ -281,7 +284,7 @@ static pud_t *fill_pud(p4d_t *p4d, unsigned long vaddr)
 =09if (p4d_none(*p4d)) {
 =09=09pud_t *pud =3D (pud_t *)spp_getpage();
 =09=09p4d_populate(&init_mm, p4d, pud);
-=09=09if (pud !=3D pud_offset(p4d, 0))
+=09=09if (__pa(pud) !=3D (p4d_val(*p4d) & p4d_pfn_mask(*p4d)))
 =09=09=09printk(KERN_ERR "PAGETABLE BUG #01! %p <-> %p\n",
 =09=09=09       pud, pud_offset(p4d, 0));
 =09}
@@ -293,7 +296,7 @@ static pmd_t *fill_pmd(pud_t *pud, unsigned long vaddr)
 =09if (pud_none(*pud)) {
 =09=09pmd_t *pmd =3D (pmd_t *) spp_getpage();
 =09=09pud_populate(&init_mm, pud, pmd);
-=09=09if (pmd !=3D pmd_offset(pud, 0))
+=09=09if (__pa(pmd) !=3D (pud_val(*pud) & pud_pfn_mask(*pud)))
 =09=09=09printk(KERN_ERR "PAGETABLE BUG #02! %p <-> %p\n",
 =09=09=09       pmd, pmd_offset(pud, 0));
 =09}
@@ -305,7 +308,7 @@ static pte_t *fill_pte(pmd_t *pmd, unsigned long vaddr)
 =09if (pmd_none(*pmd)) {
 =09=09pte_t *pte =3D (pte_t *) spp_getpage();
 =09=09pmd_populate_kernel(&init_mm, pmd, pte);
-=09=09if (pte !=3D pte_offset_kernel(pmd, 0))
+=09=09if (__pa(pte) !=3D (pmd_val(*pmd) & pmd_pfn_mask(*pmd)))
 =09=09=09printk(KERN_ERR "PAGETABLE BUG #03!\n");
 =09}
 =09return pte_offset_kernel(pmd, vaddr);
--=20
2.51.0



