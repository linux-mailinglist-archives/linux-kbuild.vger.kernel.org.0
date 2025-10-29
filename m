Return-Path: <linux-kbuild+bounces-9307-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C91C1CED3
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68B834E4098
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 19:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB96359FA6;
	Wed, 29 Oct 2025 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="fFgp0OHh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E198359FB4;
	Wed, 29 Oct 2025 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761764765; cv=none; b=j4q+MBMxyGMYUTVL/Pa9d9uPHiUUopxf0s/leUDXclHK2eDZ8fAFy9eeWw+Nr35iJih425iT/6mv8LfuXBw+vbSDLZbiPW2yM9lBcpZ7QtS4zyIs6go7dAGk5sCDQ1rOeSn9E/4pJWexuK2yILl+q0GpcCQqanl0e8q/1aU3UGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761764765; c=relaxed/simple;
	bh=bMT6zwC9CBlFeLlkzXFrhE34J++x8Mj3alXKXMT5fIg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hv90gJCp46IGgzbemxnwUIuEAOYInaMekJvP1jcbc3GLG0Apy7MsiQ7r5v4qjcMoKZh+CAF67QFgHGZuRBu0sXQqDZOTE71BIjxAB10Vb27SFCS4Dls3gSLbx3skPnb7GhTLqwM+YIDsIN1Qw5tukEhyAj/z1Joc52mr2ZDv8Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=fFgp0OHh; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761764754; x=1762023954;
	bh=rr0Rm1n5HeBo5Fap/+IfVyHkvEn5nn0dcbxf514Q+kg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fFgp0OHhcEPVlbbfupp7L0/UqzlPp2RufUT4rPPgcExkOWMJvc4oNZYRsMnJtLaiq
	 tbZ0pJJzf7+iztM4ZLjdgxVnfM0mU6sf7aJcNlMahV5ULYqRdQak8/GsfTRouV/FV6
	 Rs3i2/tvdQy39XdXhteb1Q2psCmSv2YN7LhtWCCQ7XWYMeotnXT6CCvT66EtLFz+NN
	 sdhEsdTaaCaHmgD+5tvbCHk0oBbsVLiQdk1opgevss+X0r7JVDeWWz63T8Rl3NBTQs
	 fXUxKPqTm1DzR2rgkTnD11K7i77mRTHyM41THQ7Jcuwksy4ckzfzi12AR2jyyGpRiX
	 +IffcE9sHZTTA==
Date: Wed, 29 Oct 2025 19:05:49 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me, stable@vger.kernel.org, Baoquan He <bhe@redhat.com>
Subject: [PATCH v6 01/18] kasan: Unpoison pcpu chunks with base address tag
Message-ID: <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: aef5b12294c25038010fe20ffdc227c541613b14
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

The problem presented here is related to NUMA systems and tag-based
KASAN modes - software and hardware ones. It can be explained in the
following points:

=091. There can be more than one virtual memory chunk.
=092. Chunk's base address has a tag.
=093. The base address points at the first chunk and thus inherits
=09   the tag of the first chunk.
=094. The subsequent chunks will be accessed with the tag from the
=09   first chunk.
=095. Thus, the subsequent chunks need to have their tag set to
=09   match that of the first chunk.

Refactor code by moving it into a helper in preparation for the actual
fix.

Fixes: 1d96320f8d53 ("kasan, vmalloc: add vmalloc tagging for SW_TAGS")
Cc: <stable@vger.kernel.org> # 6.1+
Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Tested-by: Baoquan He <bhe@redhat.com>
---
Changelog v6:
- Add Baoquan's tested-by tag.
- Move patch to the beginning of the series as it is a fix.
- Move the refactored code to tags.c because both software and hardware
  modes compile it.
- Add fixes tag.

Changelog v4:
- Redo the patch message numbered list.
- Do the refactoring in this patch and move additions to the next new
  one.

Changelog v3:
- Remove last version of this patch that just resets the tag on
  base_addr and add this patch that unpoisons all areas with the same
  tag instead.

 include/linux/kasan.h | 10 ++++++++++
 mm/kasan/tags.c       | 11 +++++++++++
 mm/vmalloc.c          |  4 +---
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index d12e1a5f5a9a..b00849ea8ffd 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -614,6 +614,13 @@ static __always_inline void kasan_poison_vmalloc(const=
 void *start,
 =09=09__kasan_poison_vmalloc(start, size);
 }
=20
+void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms);
+static __always_inline void kasan_unpoison_vmap_areas(struct vm_struct **v=
ms, int nr_vms)
+{
+=09if (kasan_enabled())
+=09=09__kasan_unpoison_vmap_areas(vms, nr_vms);
+}
+
 #else /* CONFIG_KASAN_VMALLOC */
=20
 static inline void kasan_populate_early_vm_area_shadow(void *start,
@@ -638,6 +645,9 @@ static inline void *kasan_unpoison_vmalloc(const void *=
start,
 static inline void kasan_poison_vmalloc(const void *start, unsigned long s=
ize)
 { }
=20
+static inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int n=
r_vms)
+{ }
+
 #endif /* CONFIG_KASAN_VMALLOC */
=20
 #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
diff --git a/mm/kasan/tags.c b/mm/kasan/tags.c
index b9f31293622b..ecc17c7c675a 100644
--- a/mm/kasan/tags.c
+++ b/mm/kasan/tags.c
@@ -18,6 +18,7 @@
 #include <linux/static_key.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/vmalloc.h>
=20
 #include "kasan.h"
 #include "../slab.h"
@@ -146,3 +147,13 @@ void __kasan_save_free_info(struct kmem_cache *cache, =
void *object)
 {
 =09save_stack_info(cache, object, 0, true);
 }
+
+void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
+{
+=09int area;
+
+=09for (area =3D 0 ; area < nr_vms ; area++) {
+=09=09kasan_poison(vms[area]->addr, vms[area]->size,
+=09=09=09     arch_kasan_get_tag(vms[area]->addr), false);
+=09}
+}
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 798b2ed21e46..934c8bfbcebf 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4870,9 +4870,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned l=
ong *offsets,
 =09 * With hardware tag-based KASAN, marking is skipped for
 =09 * non-VM_ALLOC mappings, see __kasan_unpoison_vmalloc().
 =09 */
-=09for (area =3D 0; area < nr_vms; area++)
-=09=09vms[area]->addr =3D kasan_unpoison_vmalloc(vms[area]->addr,
-=09=09=09=09vms[area]->size, KASAN_VMALLOC_PROT_NORMAL);
+=09kasan_unpoison_vmap_areas(vms, nr_vms);
=20
 =09kfree(vas);
 =09return vms;
--=20
2.51.0



