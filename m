Return-Path: <linux-kbuild+bounces-9319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727FC1D27F
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:09:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A5E64E2029
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AAD3590D8;
	Wed, 29 Oct 2025 20:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="f1ahGvJ8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002672DE200;
	Wed, 29 Oct 2025 20:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768510; cv=none; b=UnF595ze7gK0D4C29Pu8FgA2E7Z+Jq4+IugtBdQX2L5yABysCu8mmQo3XEMeiqmz3XiwCcU144U/WBTluB5VltsI2GjP9bEfj0pMLp446Ey9gBlzLW2gRsKY6v4Bcgxib2Tz3mCZJR9JlGQ5xdVCr+Fl5uHSrcLtQgXws4j60mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768510; c=relaxed/simple;
	bh=bVzjv4HTOC1vQrn+XBZNIMKDdCF53/G6D7SEjdZ3RUs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hcit+rYC99+bE8NiHAzuv7OEVhs4XYGCmtwpOIqjgXfYvIgsBPD9mfScUaCnT+3tyaWFUgfbVHIC/6lD8NAk4v4Q4ZGZgJr32ksf8N1nsMLJ8pqEUgiNqOZQA3xYFEfB22A01fLtMMOB8ABY6Ex72oBof9cY3tVE492o+6SRFQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=f1ahGvJ8; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768504; x=1762027704;
	bh=Ye8tYnzEiAyAJOizOqIrcZYSk2K1DbVUwkfvl955amo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f1ahGvJ8GYmWSAN4yQvaJJ8AMmaQXPPMzcKSaz6Xrvq0aoFjM/UK6qEVGIKRCoLqb
	 5LIptGgTqr85HdCtdsCnnkULneMU0vlAU6dQciyV6UUzUvyMy/kCVMmX+/4xr6YHW/
	 +oMozIC9BWSxBmEgcmmyjZZG3vnN+B3w2jxVYTdAYKkzhqe2taxX2Pl6kthj9hres/
	 YBb4kjMyUMhTGxyvSz8vda/30rOZZimxFRxQD0jyouhiV9xwy9nfBkUN6uEXRd/Z/X
	 euFq5/cNqoY3dnXuBokf29Dwc8D5+0mx1I6WMSm4ouiysMLrt2mGdvalln0qeq9P+o
	 sDufRjOTA1fvw==
Date: Wed, 29 Oct 2025 20:08:18 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 12/18] x86/mm: LAM compatible non-canonical definition
Message-ID: <56d9203b1fcb6281b0d29b44bc181530e5c72327.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 015c7fdaea374a790951b755b565538ef4bdd04b
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

For an address to be canonical it has to have its top bits equal to each
other. The number of bits depends on the paging level and whether
they're supposed to be ones or zeroes depends on whether the address
points to kernel or user space.

With Linear Address Masking (LAM) enabled, the definition of linear
address canonicality is modified. Not all of the previously required
bits need to be equal, only the first and last from the previously equal
bitmask. So for example a 5-level paging kernel address needs to have
bits [63] and [56] set.

Change the canonical checking function to use bit masks instead of bit
shifts.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v6:
- Use bitmasks to check both kernel and userspace addresses (Dave Hansen
  and Samuel Holland).

Changelog v4:
- Add patch to the series.

 arch/x86/include/asm/page.h | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index bcf5cad3da36..df2c93b90a6b 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -82,14 +82,37 @@ static __always_inline void *pfn_to_kaddr(unsigned long=
 pfn)
 =09return __va(pfn << PAGE_SHIFT);
 }
=20
+/*
+ * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks=
.
+ */
+#ifdef CONFIG_KASAN_SW_TAGS
+static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
+{
+=09return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
+}
+#else
 static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
 {
 =09return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
 }
+#endif
+
+#ifdef CONFIG_KASAN_SW_TAGS
+#define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits - 1))
+#else
+#define CANONICAL_MASK(vaddr_bits) GENMASK_ULL(63, vaddr_bits)
+#endif
=20
 static __always_inline u64 __is_canonical_address(u64 vaddr, u8 vaddr_bits=
)
 {
-=09return __canonical_address(vaddr, vaddr_bits) =3D=3D vaddr;
+=09unsigned long cmask =3D CANONICAL_MASK(vaddr_bits);
+
+=09/*
+=09 * Kernel canonical address & cmask will evaluate to cmask while
+=09 * userspace canonical address & cmask will evaluate to zero.
+=09 */
+=09u64 result =3D (vaddr & cmask) =3D=3D cmask || !(vaddr & cmask);
+=09return result;
 }
=20
 #endif=09/* __ASSEMBLER__ */
--=20
2.51.0



