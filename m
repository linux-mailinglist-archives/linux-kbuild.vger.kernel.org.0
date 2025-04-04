Return-Path: <linux-kbuild+bounces-6423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B8A7BD8E
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA9C47A72DD
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B101EF096;
	Fri,  4 Apr 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TxAEQ/4R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3001C84BB;
	Fri,  4 Apr 2025 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772685; cv=none; b=FdmCqr9OURZ10RCxrJ+hty5dID230I5cUBlebPQcfBea5HtWs/pQ+598qdPjgtmxU+axX0unN3RCoXu5nG2D6MwIRNnIeMZGLJeDgEzhhXLTRDLH1cVwnwkBfa+RUaPi104Yq9pSaN+XGwZQLDE0gQEB7aJmjhYNXI9BwDIL37Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772685; c=relaxed/simple;
	bh=ZsxDv6qG66vEKuwTwHaEtrjd9tBd4kf+DSHvVgMU/8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyg06oaxCxwwgObVk8f0Yu7v7PRqC5ZMS1e2MhXtOzoObqUR0b+HB86vtmppWYBYHIkIZ6hmNSpiQOISevEvf+f837XpGRdXMcmOxXuFY5DbY5z4F1ZyFMPZ3FO9p9SioYJh9yY6kPhzyR/wVm3k7EBAoX3CzNJ9Fc7IxA7XMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TxAEQ/4R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743772684; x=1775308684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZsxDv6qG66vEKuwTwHaEtrjd9tBd4kf+DSHvVgMU/8M=;
  b=TxAEQ/4R18hnxXB6PEObElYLuxXH3ldaq2s30PWyVF7aCpiTgCw1juN7
   rD2+Np3y3zsn116thisjH1UGyxtyoJwYwcr03QIzRc223kencs57Fz/BD
   tebWBeblRYOX3/KQbYxGlRo88MPCnpI1sLyvlJLlqpydTIh5YX66nAVyy
   nOefgasHKas7DGJNf9+7vr7YET0NW2ZYyqIEWdrhVRtBSvhPSmkPrOMcF
   pOiofdiAwxX2SggAWMUjXz3mHqD+5Su4C/nqqDJi5+jnzahqAZtscwOa7
   g3s20NlmLbJmmW+nS8PrnF6z11G7UKEOSflOz1YPC9SfEzTlf1HLt63M4
   Q==;
X-CSE-ConnectionGUID: i0RY0CfRRYu185alh2o7uw==
X-CSE-MsgGUID: /qq0/LSnTJyu0BnAkBd+vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55402059"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55402059"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:18:03 -0700
X-CSE-ConnectionGUID: vtMsu7eRSsCTmkinYXKa3w==
X-CSE-MsgGUID: mneJnZk0QlShqxm/wu1ARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128157400"
Received: from opintica-mobl1 (HELO wieczorr-mobl1.intel.com) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:17:48 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: hpa@zytor.com,
	hch@infradead.org,
	nick.desaulniers+lkml@gmail.com,
	kuan-ying.lee@canonical.com,
	masahiroy@kernel.org,
	samuel.holland@sifive.com,
	mingo@redhat.com,
	corbet@lwn.net,
	ryabinin.a.a@gmail.com,
	guoweikang.kernel@gmail.com,
	jpoimboe@kernel.org,
	ardb@kernel.org,
	vincenzo.frascino@arm.com,
	glider@google.com,
	kirill.shutemov@linux.intel.com,
	apopple@nvidia.com,
	samitolvanen@google.com,
	maciej.wieczor-retman@intel.com,
	kaleshsingh@google.com,
	jgross@suse.com,
	andreyknvl@gmail.com,
	scott@os.amperecomputing.com,
	tony.luck@intel.com,
	dvyukov@google.com,
	pasha.tatashin@soleen.com,
	ziy@nvidia.com,
	broonie@kernel.org,
	gatlin.newhouse@gmail.com,
	jackmanb@google.com,
	wangkefeng.wang@huawei.com,
	thiago.bauermann@linaro.org,
	tglx@linutronix.de,
	kees@kernel.org,
	akpm@linux-foundation.org,
	jason.andryuk@amd.com,
	snovitoll@gmail.com,
	xin@zytor.com,
	jan.kiszka@siemens.com,
	bp@alien8.de,
	rppt@kernel.org,
	peterz@infradead.org,
	pankaj.gupta@amd.com,
	thuth@redhat.com,
	andriy.shevchenko@linux.intel.com,
	joel.granados@kernel.org,
	kbingham@kernel.org,
	nicolas@fjasle.eu,
	mark.rutland@arm.com,
	surenb@google.com,
	catalin.marinas@arm.com,
	morbo@google.com,
	justinstitt@google.com,
	ubizjak@gmail.com,
	jhubbard@nvidia.com,
	urezki@gmail.com,
	dave.hansen@linux.intel.com,
	bhe@redhat.com,
	luto@kernel.org,
	baohua@kernel.org,
	nathan@kernel.org,
	will@kernel.org,
	brgerst@gmail.com
Cc: llvm@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	x86@kernel.org
Subject: [PATCH v3 13/14] mm: Unpoison pcpu chunks with base address tag
Date: Fri,  4 Apr 2025 15:14:17 +0200
Message-ID: <61033ef5b70277039ceeb8f6173e8b3fbc271c08.1743772053.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The problem presented here is related to NUMA systems and tag-based
KASAN mode. Getting to it can be explained in the following points:

	1. A new chunk is created with pcpu_create_chunk() and
	   vm_structs are allocated. On systems with one NUMA node only
	   one is allocated, but with more NUMA nodes at least a second
	   one will be allocated too.

	2. chunk->base_addr is assigned the modified value of
	   vms[0]->addr and thus inherits the tag of this allocated
	   structure.

	3. In pcpu_alloc() for each possible cpu pcpu_chunk_addr() is
	   executed which calculates per cpu pointers that correspond to
	   the vms structure addresses. The calculations are based on
	   adding an offset from a table to chunk->base_addr.

Here the problem presents itself since for addresses based on vms[1] and
up, the tag will be different than the ones based on vms[0] (base_addr).
The tag mismatch happens and an error is reported.

Unpoison all the vms[]->addr with the same tag to resolve the mismatch.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Remove last version of this patch that just resets the tag on
  base_addr and add this patch that unpoisons all areas with the same
  tag instead.

 include/linux/kasan.h | 10 ++++++++++
 mm/kasan/shadow.c     | 11 +++++++++++
 mm/vmalloc.c          |  3 +--
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 54481f8c30c5..bd033b2ba383 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -613,6 +613,13 @@ static __always_inline void kasan_poison_vmalloc(const void *start,
 		__kasan_poison_vmalloc(start, size);
 }
 
+void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms);
+static __always_inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
+{
+	if (kasan_enabled())
+		__kasan_unpoison_vmap_areas(vms, nr_vms);
+}
+
 #else /* CONFIG_KASAN_VMALLOC */
 
 static inline void kasan_populate_early_vm_area_shadow(void *start,
@@ -637,6 +644,9 @@ static inline void *kasan_unpoison_vmalloc(const void *start,
 static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
 { }
 
+static inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
+{ }
+
 #endif /* CONFIG_KASAN_VMALLOC */
 
 #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 88d1c9dcb507..9496f256bc0f 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -582,6 +582,17 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size)
 	kasan_poison(start, size, KASAN_VMALLOC_INVALID, false);
 }
 
+void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
+{
+	int area;
+
+	for (area = 0 ; area < nr_vms ; area++) {
+		kasan_poison(vms[area]->addr, vms[area]->size,
+			     arch_kasan_get_tag(vms[0]->addr), false);
+		arch_kasan_set_tag(vms[area]->addr, arch_kasan_get_tag(vms[0]->addr));
+	}
+}
+
 #else /* CONFIG_KASAN_VMALLOC */
 
 int kasan_alloc_module_shadow(void *addr, size_t size, gfp_t gfp_mask)
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 61981ee1c9d2..fbd56bf8aeb2 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4783,8 +4783,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
 	 * non-VM_ALLOC mappings, see __kasan_unpoison_vmalloc().
 	 */
 	for (area = 0; area < nr_vms; area++)
-		vms[area]->addr = kasan_unpoison_vmalloc(vms[area]->addr,
-				vms[area]->size, KASAN_VMALLOC_PROT_NORMAL);
+		kasan_unpoison_vmap_areas(vms, nr_vms);
 
 	kfree(vas);
 	return vms;
-- 
2.49.0


