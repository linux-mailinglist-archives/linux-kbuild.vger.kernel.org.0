Return-Path: <linux-kbuild+bounces-8401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C0B228C2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 15:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A7C171AE5
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 13:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960A12820B6;
	Tue, 12 Aug 2025 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L+LGP85a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7828153D;
	Tue, 12 Aug 2025 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005260; cv=none; b=V3Flz1CQZM+a1tXNtgN/T89+d2ucDID4sfPHTBC0dBYZSWOaUwqWw0Y4ihxwSpwB535YpuBwJwsOjnUdlPST2VpU2JtpwDAIetcsBLtWfsb6GfwN8XPZ6ugE3pU4es3n5X2QqQvHhbP1RN76AwCXj9pY2WAfTLeEmchM/U8UFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005260; c=relaxed/simple;
	bh=WytGKsbpVx+YjGfDckn4ztihfy/XnHxiwtMc2ueYMYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+etjhFto/14X5RNk7wkoOglCNmIIK9Geh4M8PjZ/cxxgGHiEuVGBG1Ynabu6o6nsFiq/oBzzshsMFKF1kn8ZTpxIb9MmZ57CGYe6GaY/LRrw6nViwtjzoBQ84HCXsHxtnjNDccL3xmUrnRTA6VrwRfEsnaXkO8KKmvJrwLnGO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L+LGP85a; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005260; x=1786541260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WytGKsbpVx+YjGfDckn4ztihfy/XnHxiwtMc2ueYMYI=;
  b=L+LGP85alfWS2LanLsShitiahDbLftGu7ZecMK0HXqFNaSw3HO4Iip3I
   m6NwRizP9z4xuMZ+882UPYJJ03fNabxlypK/CRQBGgh6BnIeBRYCp/XCR
   9t9q72HQBBHKv9Q3G9yma8IcF0DvCSQdevDDt6GaS3951q3p9LCQauh/W
   zDHWM/o0ZZX9LzHAjnWHLXPel1Bu10Anh1jk//fSfeMAdkBKlQz+YbYHC
   A8+vzyl9M+baH1yOdgwWKnhlndEw3meGpuGAir+0Pey2RITTIq+p00DiV
   IeGiYDpDxB3MRd3gUquvPDAAy5VmN8cl0sWrBU/N3PoBGytPH1A2SXR3g
   A==;
X-CSE-ConnectionGUID: ear2osQsTqavaX3FvMQjnQ==
X-CSE-MsgGUID: FZ9oKwwxQACeIwU0fg3RUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60903512"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60903512"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:27:38 -0700
X-CSE-ConnectionGUID: 7sr1bGkITqqOrRUhUWybYQ==
X-CSE-MsgGUID: Oy2/bGKxRJGKw5AHGzSS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165831445"
Received: from vpanait-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:27:16 -0700
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
Subject: [PATCH v4 07/18] mm: x86: Untag addresses in EXECMEM_ROX related pointer arithmetic
Date: Tue, 12 Aug 2025 15:23:43 +0200
Message-ID: <aa501a8133ee0f336dc9f905fdc3453d964109ed.1755004923.git.maciej.wieczor-retman@intel.com>
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

ARCH_HAS_EXECMEM_ROX was re-enabled in x86 at Linux 6.14 release.
Related code has multiple spots where page virtual addresses end up used
as arguments in arithmetic operations. Combined with enabled tag-based
KASAN it can result in pointers that don't point where they should or
logical operations not giving expected results.

vm_reset_perms() calculates range's start and end addresses using min()
and max() functions. To do that it compares pointers but some are not
tagged - addr variable is, start and end variables aren't.

within() and within_range() can receive tagged addresses which get
compared to untagged start and end variables.

Reset tags in addresses used as function arguments in min(), max(),
within() and within_range().

execmem_cache_add() adds tagged pointers to a maple tree structure,
which then are incorrectly compared when walking the tree. That results
in different pointers being returned later and page permission violation
errors panicking the kernel.

Reset tag of the address range inserted into the maple tree inside
execmem_cache_add().

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Add patch to the series.

 arch/x86/mm/pat/set_memory.c | 1 +
 mm/execmem.c                 | 4 +++-
 mm/vmalloc.c                 | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8834c76f91c9..1f14a1297db0 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -222,6 +222,7 @@ static inline void cpa_inc_lp_preserved(int level) { }
 static inline int
 within(unsigned long addr, unsigned long start, unsigned long end)
 {
+	addr = (unsigned long)kasan_reset_tag((void *)addr);
 	return addr >= start && addr < end;
 }
 
diff --git a/mm/execmem.c b/mm/execmem.c
index 0822305413ec..743fa4a8c069 100644
--- a/mm/execmem.c
+++ b/mm/execmem.c
@@ -191,6 +191,8 @@ static int execmem_cache_add_locked(void *ptr, size_t size, gfp_t gfp_mask)
 	unsigned long lower, upper;
 	void *area = NULL;
 
+	addr = arch_kasan_reset_tag(addr);
+
 	lower = addr;
 	upper = addr + size - 1;
 
@@ -216,7 +218,7 @@ static int execmem_cache_add(void *ptr, size_t size, gfp_t gfp_mask)
 static bool within_range(struct execmem_range *range, struct ma_state *mas,
 			 size_t size)
 {
-	unsigned long addr = mas->index;
+	unsigned long addr = arch_kasan_reset_tag(mas->index);
 
 	if (addr >= range->start && addr + size < range->end)
 		return true;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6dbcdceecae1..83d666e4837a 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3328,8 +3328,8 @@ static void vm_reset_perms(struct vm_struct *area)
 			unsigned long page_size;
 
 			page_size = PAGE_SIZE << page_order;
-			start = min(addr, start);
-			end = max(addr + page_size, end);
+			start = min((unsigned long)arch_kasan_reset_tag(addr), start);
+			end = max((unsigned long)arch_kasan_reset_tag(addr) + page_size, end);
 			flush_dmap = 1;
 		}
 	}
-- 
2.50.1


