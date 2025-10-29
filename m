Return-Path: <linux-kbuild+bounces-9315-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C6C1CF21
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F4144E9964
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 19:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F45B35A146;
	Wed, 29 Oct 2025 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IJcPNw3y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953663596F1
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 19:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761764882; cv=none; b=eN3AlA3uUt+raaPVNPpsWbvVBKyTLDw0Yzu5vVxtDCxxUhPu0Vq4XXnl7pcRWdN0XUigA0JTU+kNSKOpiEqIN87s3+xjHzPyKVXWS2VVZu8uUun/cb7j9Ak2T6sCMPGUjJlQcMoETuYjw+Q4QB5TVVhGaoMoPhFQWEjTZDok7Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761764882; c=relaxed/simple;
	bh=+Go/spjpR5TeE/IjzS8oR2CgyekBuI39XLFNABje2C0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xl/hnXSCog0hE+bfn8dfm4XHW6HQxNW3y4KuxhhIWDwdVyFcCMuKwCW5AV2Dg1EXP3zSGwfkUuTvdEVw4lLjF0krWrIEqTUxqphFL6+4/RUPhRM5mQ5Xfw1Le3Vchixop75aANMszpldkorcvUeegL7X2kECMpo3Yv/zndeC3NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IJcPNw3y; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761764878; x=1762024078;
	bh=wC6RWC0BysYEjK4tLyl5sRrziRZnxpuWzjQ8a6tBeM4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IJcPNw3yh2TNHyjZf2+7PCXVO4q2xt+d6RxGzTh3Nu9x6lPPz5KLDRfUUfHQdlsKV
	 wpWXVbuGFSvXG6l3dJVLam23As54rJ+3MbI3AG03fI4SYHJDfUZql6kA9SeuWdefRC
	 5+jMHJpl7Ynw68PwkNnrvsAcORWvFbm1k8DSjDHbQ+xpmJaeKE1oSCduAyYgtUMcxp
	 5c/Y6liDXu9mw7a4gi1lz/+DQQLpT0qHscmGiFFf4YATArppuRqPL0lVDXIuQMCAOk
	 bN6yhswOyjHR0i79XSrB7Y/Xm+Xr4dmniCQDAvXrEx+6zarj5Hj/TzoELeXGT328Cw
	 zjj5lDm5ggAKQ==
Date: Wed, 29 Oct 2025 19:07:50 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 09/18] mm/execmem: Untag addresses in EXECMEM_ROX related pointer arithmetic
Message-ID: <d6443aca65c3d36903eb9715d37811eed1931cc1.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 63b0d2f639705dfa0c06cb457ca2d9660abebfed
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

ARCH_HAS_EXECMEM_ROX was re-enabled in x86 at Linux 6.14 release.
vm_reset_perms() calculates range's start and end addresses using min()
and max() functions. To do that it compares pointers but, with KASAN
software tags mode enabled, some are tagged - addr variable is, while
start and end variables aren't. This can cause the wrong address to be
chosen and result in various errors in different places.

Reset tags in the address used as function argument in min(), max().

execmem_cache_add() adds tagged pointers to a maple tree structure,
which then are incorrectly compared when walking the tree. That results
in different pointers being returned later and page permission violation
errors panicking the kernel.

Reset tag of the address range inserted into the maple tree inside
execmem_vmalloc() which then gets propagated to execmem_cache_add().

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v6:
- Move back the tag reset from execmem_cache_add() to execmem_vmalloc()
  (Mike Rapoport)
- Rewrite the changelogs to match the code changes from v6 and v5.

Changelog v5:
- Remove the within_range() change.
- arch_kasan_reset_tag -> kasan_reset_tag.

Changelog v4:
- Add patch to the series.

 mm/execmem.c | 2 +-
 mm/vmalloc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/execmem.c b/mm/execmem.c
index 810a4ba9c924..fd11409a6217 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -59,7 +59,7 @@ static void *execmem_vmalloc(struct execmem_range *range,=
 size_t size,
 =09=09return NULL;
 =09}
=20
-=09return p;
+=09return kasan_reset_tag(p);
 }
=20
 struct vm_struct *execmem_vmap(size_t size)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 934c8bfbcebf..392e3863d7d0 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3328,7 +3328,7 @@ static void vm_reset_perms(struct vm_struct *area)
 =09 * the vm_unmap_aliases() flush includes the direct map.
 =09 */
 =09for (i =3D 0; i < area->nr_pages; i +=3D 1U << page_order) {
-=09=09unsigned long addr =3D (unsigned long)page_address(area->pages[i]);
+=09=09unsigned long addr =3D (unsigned long)kasan_reset_tag(page_address(a=
rea->pages[i]));
=20
 =09=09if (addr) {
 =09=09=09unsigned long page_size;
--=20
2.51.0



