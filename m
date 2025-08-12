Return-Path: <linux-kbuild+bounces-8403-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A1B228E5
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 15:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43411582564
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 13:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9ED281370;
	Tue, 12 Aug 2025 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JavcaNMc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A3628000C;
	Tue, 12 Aug 2025 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005308; cv=none; b=W9CmOCqv9LD3bzyrtzF+y2aE4kz8HBM3HgWMUVPbX6ACplJE6MxbDdN/n13JlcII+daT5L/wYtsjEk69XT6c7X1mh3Ga/wnJBXPt7sfTcVvE61e95aPOo6jyLCC7ev5fqvuCYwNOMjjxyxbyBiUkndBlTs5zS3y4uHFs27LZTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005308; c=relaxed/simple;
	bh=c7Af/YAFKCbSIcmDUGPF1EcBvvAVYWDWdLscrGxcJaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJ8tZHQqYzPn7fht83aowl7hKdKxmmsBAAa4HQ/8lMwjqAdNZ1ThkuXsxvfGjiL/FYxeRvjmeoL3QrOMIerz9tBPIFy7AVH4i8zl4USg2b4G8AIaQTveI/l31S0gKRmW8n6wLXmbCYzq9vHXJvXtZMSz3GPi60b6+X1oByuEPxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JavcaNMc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005307; x=1786541307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c7Af/YAFKCbSIcmDUGPF1EcBvvAVYWDWdLscrGxcJaU=;
  b=JavcaNMcPItqXKs1C0i8eeXgPQfbvEmU0NFw0fXXlg2xKV/p76Gi76kQ
   wK2dP3q8n597kyBV604FfYr38AcBD4Hqkg/uULEHHD0fTSasg4WWADZ/z
   q4yl7MY6gnQDNVa0JnA4aKjVluwIYncvs/N9tZQKlVRWB/+1LteZl1ZWH
   CSfSbNo1tc0g7iWvKRc+5NUUJPMT8U/FBNeogaJv92Am1n4LiHe3vM9OS
   TYnM28dUL9Ao/7MsEyC3HoWyTVr0jDo3opZNpRU5cSlr+Bf4VEyWulnWB
   Hnkn4Lf4xajhs2FLQN7oBsb0qQnHx8uOcCqGCASwEtJVmjKGx6nv5x6qv
   w==;
X-CSE-ConnectionGUID: hiQ+PCM2S1avnaAzypLirA==
X-CSE-MsgGUID: yq5Ai1tsRpCtKW4gDCY3fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60903623"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60903623"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:28:26 -0700
X-CSE-ConnectionGUID: RvG1WbQvQdy6dQLlny3rTg==
X-CSE-MsgGUID: gCS5TnjYQ6isOtqp7VNDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165831505"
Received: from vpanait-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:28:02 -0700
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: nathan@kernel.org,
	arnd@arndb.de,
	broonie@kernel.org,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	will@kernel.org,
	kaleshsingh@google.com,
	rppt@kernel.org,
	leitao@debian.org,
	coxu@redhat.com,
	surenb@google.com,
	akpm@linux-foundation.org,
	luto@kernel.org,
	jpoimboe@kernel.org,
	changyuanl@google.com,
	hpa@zytor.com,
	dvyukov@google.com,
	kas@kernel.org,
	corbet@lwn.net,
	vincenzo.frascino@arm.com,
	smostafa@google.com,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	andreyknvl@gmail.com,
	alexander.shishkin@linux.intel.com,
	thiago.bauermann@linaro.org,
	catalin.marinas@arm.com,
	ryabinin.a.a@gmail.com,
	jan.kiszka@siemens.com,
	jbohac@suse.cz,
	dan.j.williams@intel.com,
	joel.granados@kernel.org,
	baohua@kernel.org,
	kevin.brodsky@arm.com,
	nicolas.schier@linux.dev,
	pcc@google.com,
	andriy.shevchenko@linux.intel.com,
	wei.liu@kernel.org,
	bp@alien8.de,
	ada.coupriediaz@arm.com,
	xin@zytor.com,
	pankaj.gupta@amd.com,
	vbabka@suse.cz,
	glider@google.com,
	jgross@suse.com,
	kees@kernel.org,
	jhubbard@nvidia.com,
	joey.gouly@arm.com,
	ardb@kernel.org,
	thuth@redhat.com,
	pasha.tatashin@soleen.com,
	kristina.martsenko@arm.com,
	bigeasy@linutronix.de,
	maciej.wieczor-retman@intel.com,
	lorenzo.stoakes@oracle.com,
	jason.andryuk@amd.com,
	david@redhat.com,
	graf@amazon.com,
	wangkefeng.wang@huawei.com,
	ziy@nvidia.com,
	mark.rutland@arm.com,
	dave.hansen@linux.intel.com,
	samuel.holland@sifive.com,
	kbingham@kernel.org,
	trintaeoitogc@gmail.com,
	scott@os.amperecomputing.com,
	justinstitt@google.com,
	kuan-ying.lee@canonical.com,
	maz@kernel.org,
	tglx@linutronix.de,
	samitolvanen@google.com,
	mhocko@suse.com,
	nunodasneves@linux.microsoft.com,
	brgerst@gmail.com,
	willy@infradead.org,
	ubizjak@gmail.com,
	peterz@infradead.org,
	mingo@redhat.com,
	sohil.mehta@intel.com
Cc: linux-mm@kvack.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	llvm@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 09/18] x86: KASAN raw shadow memory PTE init
Date: Tue, 12 Aug 2025 15:23:45 +0200
Message-ID: <38129f9031dfefc3e9465a0bf06fd32256cdc157.1755004923.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 0539efd0d216..e8a451cafc8c 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -34,6 +34,18 @@ static __init void *early_alloc(size_t size, int nid, bool should_panic)
 	return ptr;
 }
 
+static __init void *early_raw_alloc(size_t size, int nid, bool should_panic)
+{
+	void *ptr = memblock_alloc_try_nid_raw(size, size,
+			__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+
+	if (!ptr && should_panic)
+		panic("%pS: Failed to allocate page, nid=%d from=%lx\n",
+		      (void *)_RET_IP_, nid, __pa(MAX_DMA_ADDRESS));
+
+	return ptr;
+}
+
 static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
 				      unsigned long end, int nid)
 {
@@ -63,8 +75,9 @@ static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
 		if (!pte_none(*pte))
 			continue;
 
-		p = early_alloc(PAGE_SIZE, nid, true);
-		entry = pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
+		p = early_raw_alloc(PAGE_SIZE, nid, true);
+		memset(p, PAGE_SIZE, KASAN_SHADOW_INIT);
+		entry = pfn_pte(PFN_DOWN(__pa_nodebug(p)), PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
 	} while (pte++, addr += PAGE_SIZE, addr != end);
 }
@@ -436,7 +449,7 @@ void __init kasan_init(void)
 	 * it may contain some garbage. Now we can clear and write protect it,
 	 * since after the TLB flush no one should write to it.
 	 */
-	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	for (i = 0; i < PTRS_PER_PTE; i++) {
 		pte_t pte;
 		pgprot_t prot;
-- 
2.50.1


