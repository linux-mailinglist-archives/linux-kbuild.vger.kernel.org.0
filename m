Return-Path: <linux-kbuild+bounces-8604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1CB34C06
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0A6A1B22C8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215DF1EE019;
	Mon, 25 Aug 2025 20:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDtkLOyt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84518211A35;
	Mon, 25 Aug 2025 20:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153915; cv=none; b=gDgBfUl9mU5MoyJ0gzXd5msNuNaKFLGIPq/e+GO2a5Dz6vFoX1MbUkk32B00+Bj4FVOW/Vx2kNPr4MXVaUkPG8YzbmYdzrUXANmwR+/Lp/bN9OFZax7kx/6PXWOubjU4MaWuFnDJIgKrKWQBewcCZPvHHzsb0TDOQHOTk95scRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153915; c=relaxed/simple;
	bh=okYAGWwGwYjZD7NZd1rejvGMvVZcH4Qcm5xKkCEr0jA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSu/oAB1yf642bC+j1YfLtgXx2OChPN0HHglsTYxn5RGyzmYZwI/pCyjtG1ShnULML30d/QS/8KT3O6ersBD/2l4ToeT0nKK1toBKQN23pM6oDYVadKEItekboWL7IudkAOBa7w7Lp6/bkSCGa+EKe2lR/6Iz0NGFGeH2vLRn3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDtkLOyt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153913; x=1787689913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=okYAGWwGwYjZD7NZd1rejvGMvVZcH4Qcm5xKkCEr0jA=;
  b=kDtkLOytQ35WsxbKNPfg10H+h0WNOtcHEqfhlwPBy39m0ngjzTso102e
   tZnUsyNGPCCU/2EwduErFuE9z1iPR8XYdR5drHP8J4wu5r++0fWiAIGuA
   8+1H0UlDqm4xPnK7924cjW5/csaQEbCZKYLlBwoaru4Q/l7Rv0+z4DNev
   OMUE5RHIuJRy9/dwalGckVMYTlYTHLGn259d6BeiINt1kzqD2ziqhEI/c
   d+CUdPrIHrkCpDQ23EhTBVYrTgB7OTUqBJCJ429Vecx8nUVUpWlXxyPsq
   9wEDCnbl7IPQIMm/b/exqpPlvzX5eBprPiB/oMxnG/nOOqYnfc+jKTsjp
   w==;
X-CSE-ConnectionGUID: kDjXDv5WTIWisN0jDOvBTg==
X-CSE-MsgGUID: qziRgjGzReauoN8bNXhr5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68971194"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68971194"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:31:52 -0700
X-CSE-ConnectionGUID: Z6d3VSXbRamxE0DAKuvOBg==
X-CSE-MsgGUID: HqbNGGRlQTeuW6G+Ue7lgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169781025"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:31:30 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: sohil.mehta@intel.com,
	baohua@kernel.org,
	david@redhat.com,
	kbingham@kernel.org,
	weixugc@google.com,
	Liam.Howlett@oracle.com,
	alexandre.chartre@oracle.com,
	kas@kernel.org,
	mark.rutland@arm.com,
	trintaeoitogc@gmail.com,
	axelrasmussen@google.com,
	yuanchu@google.com,
	joey.gouly@arm.com,
	samitolvanen@google.com,
	joel.granados@kernel.org,
	graf@amazon.com,
	vincenzo.frascino@arm.com,
	kees@kernel.org,
	ardb@kernel.org,
	thiago.bauermann@linaro.org,
	glider@google.com,
	thuth@redhat.com,
	kuan-ying.lee@canonical.com,
	pasha.tatashin@soleen.com,
	nick.desaulniers+lkml@gmail.com,
	vbabka@suse.cz,
	kaleshsingh@google.com,
	justinstitt@google.com,
	catalin.marinas@arm.com,
	alexander.shishkin@linux.intel.com,
	samuel.holland@sifive.com,
	dave.hansen@linux.intel.com,
	corbet@lwn.net,
	xin@zytor.com,
	dvyukov@google.com,
	tglx@linutronix.de,
	scott@os.amperecomputing.com,
	jason.andryuk@amd.com,
	morbo@google.com,
	nathan@kernel.org,
	lorenzo.stoakes@oracle.com,
	mingo@redhat.com,
	brgerst@gmail.com,
	kristina.martsenko@arm.com,
	bigeasy@linutronix.de,
	luto@kernel.org,
	jgross@suse.com,
	jpoimboe@kernel.org,
	urezki@gmail.com,
	mhocko@suse.com,
	ada.coupriediaz@arm.com,
	hpa@zytor.com,
	maciej.wieczor-retman@intel.com,
	leitao@debian.org,
	peterz@infradead.org,
	wangkefeng.wang@huawei.com,
	surenb@google.com,
	ziy@nvidia.com,
	smostafa@google.com,
	ryabinin.a.a@gmail.com,
	ubizjak@gmail.com,
	jbohac@suse.cz,
	broonie@kernel.org,
	akpm@linux-foundation.org,
	guoweikang.kernel@gmail.com,
	rppt@kernel.org,
	pcc@google.com,
	jan.kiszka@siemens.com,
	nicolas.schier@linux.dev,
	will@kernel.org,
	andreyknvl@gmail.com,
	jhubbard@nvidia.com,
	bp@alien8.de
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 18/19] mm: Unpoison vms[area] addresses with a common tag
Date: Mon, 25 Aug 2025 22:24:43 +0200
Message-ID: <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The problem presented here is related to NUMA systems and tag-based
KASAN mode. It can be explained in the following points:

	1. There can be more than one virtual memory chunk.
	2. Chunk's base address has a tag.
	3. The base address points at the first chunk and thus inherits
	   the tag of the first chunk.
	4. The subsequent chunks will be accessed with the tag from the
	   first chunk.
	5. Thus, the subsequent chunks need to have their tag set to
	   match that of the first chunk.

Unpoison all vms[]->addr memory and pointers with the same tag to
resolve the mismatch.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Move tagging the vms[]->addr to this new patch and leave refactoring
  there.
- Comment the fix to provide some context.

 mm/kasan/shadow.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index b41f74d68916..ee2488371784 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -646,13 +646,21 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size)
 	kasan_poison(start, size, KASAN_VMALLOC_INVALID, false);
 }
 
+/*
+ * A tag mismatch happens when calculating per-cpu chunk addresses, because
+ * they all inherit the tag from vms[0]->addr, even when nr_vms is bigger
+ * than 1. This is a problem because all the vms[]->addr come from separate
+ * allocations and have different tags so while the calculated address is
+ * correct the tag isn't.
+ */
 void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
 {
 	int area;
 
 	for (area = 0 ; area < nr_vms ; area++) {
 		kasan_poison(vms[area]->addr, vms[area]->size,
-			     arch_kasan_get_tag(vms[area]->addr), false);
+			     arch_kasan_get_tag(vms[0]->addr), false);
+		arch_kasan_set_tag(vms[area]->addr, arch_kasan_get_tag(vms[0]->addr));
 	}
 }
 
-- 
2.50.1


