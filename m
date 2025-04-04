Return-Path: <linux-kbuild+bounces-6420-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5CA7BD96
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02BF11B60E33
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439461EF0B4;
	Fri,  4 Apr 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WoK+9TVn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E401EB5C8;
	Fri,  4 Apr 2025 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772640; cv=none; b=UDUhXGUs65oxkS4IsZN8OKzqi6TdJptPAno3btyhLP/zOe3TcM4iayc8iYF6MXwW5tE6iTfo9Gwxg8xbn7ltU+b4G79r9oZ47LXs2xdqmoWQ3vI0L0L4HMa2mDKm03VIlaZDZWhenpojwEFHqvmps7Mq2joqxdfPdSJkinXQ25Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772640; c=relaxed/simple;
	bh=SGBIaGE4wssEPedJ31N8z8fzvg1X3QBHbqhKaFUlYMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V7vC34Psc2HUR1JP0euYhue03ezkHIVLVAY5qOHnKv30OCfh++u1YYBswgPF0NRRROKB9F4vRgPGJ/XXmphT83BfTx2DQwj1tPcKDJmRaSya/62QqFCXZiahEynqsCsuEsZWqJq/zoENLf0SQpQeRUU8mkXKvBxsrhjVHTSd5DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WoK+9TVn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743772639; x=1775308639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGBIaGE4wssEPedJ31N8z8fzvg1X3QBHbqhKaFUlYMU=;
  b=WoK+9TVnk+qS01utTMpyrI2j9gkql3B5jpmNWOXYLp7KQ6eFEV57Jcg4
   3ImY4YwO8SFSPXQPk/sJ4mYYixv03Ra2KJq7Lxl2H03HhHmxq0X/mw4NY
   Ugq30q/GjJRw8ewS37ubQFvKTrzm+2FwXX1pPvFZoEdWfAs1sVMSNYuO/
   xWuvp2PqEQ1oG26ARU7kmyrqbvPcy35DkUFklzpmsV0c6AjdiXOYG+XTX
   SapOGdkLOT831Q+fQb5cv0PS/4OYNCCGzwf6tRhhZkxKC8UrTzGKx7l4m
   HjsBf3vqC4HS4XLzmjIlue3gO7LnA+CzczqYrrbuIToPG9FLssHh82kMH
   g==;
X-CSE-ConnectionGUID: Fx4bPcCdTUaFqOpEIsIkOg==
X-CSE-MsgGUID: /FNge4PASSeTQ1O1LQijGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55401938"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55401938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:17:18 -0700
X-CSE-ConnectionGUID: fsVEwllhSRmFPFm7kCxT5g==
X-CSE-MsgGUID: rCQHxZP4R6qYhcSTuBxnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128157312"
Received: from opintica-mobl1 (HELO wieczorr-mobl1.intel.com) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:17:02 -0700
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
Subject: [PATCH v3 10/14] x86: Update the KASAN non-canonical hook
Date: Fri,  4 Apr 2025 15:14:14 +0200
Message-ID: <c37c89e71ed5a8e404b24b31e23457af12f872f2.1743772053.git.maciej.wieczor-retman@intel.com>
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

The kasan_non_canonical_hook() is useful in pointing out that an address
which caused some kind of error could be the result of
kasan_mem_to_shadow() mapping. Currently it's called only in the general
protection handler code path but can give helpful information also in
page fault oops reports.

For example consider a page fault for address 0xffdefc0000000000 on a
5-level paging system. It could have been accessed from KASAN's
kasan_mem_to_shadow() called on 0xfef0000000000000 address. Without the
kasan_non_canonical_hook() in the page fault case it might be hard to
figure out why an error occurred.

Add kasan_non_canonical_hook() to the beginning of show_fault_oops().

Update kasan_non_canonical_hook() to take into account the possible
memory to shadow mappings in the software tag-based mode of x86.

Patch was tested with positive results by accessing the following
addresses, causing #GPs and #PFs.

Valid mappings (showing kasan_non_canonical_hook() message):
	0xFFFFFFFF8FFFFFFF
	0xFEF0000000000000
	0x7FFFFF4FFFFFFFFF
	0x7EF0000000000000
Invalid mappings (not showing kasan_non_canonical_hook() message):
	0xFFFFFFFFF8FFFFFF
	0xFFBFFC0000000000
	0x07EFFC0000000000
	0x000E000000000000

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Move the report.c part from first patch in the series to this new
  patch to have x86 changes in one place.
- Add the call in fault oops.
- Extend the comment in report.c with a graphical representation of what
  addresses are valid and invalid in memory to shadow mapping.

 arch/x86/mm/fault.c |  2 ++
 mm/kasan/report.c   | 36 +++++++++++++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index 697432f63c59..16366af60ae5 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -511,6 +511,8 @@ show_fault_oops(struct pt_regs *regs, unsigned long error_code, unsigned long ad
 	if (!oops_may_print())
 		return;
 
+	kasan_non_canonical_hook(address);
+
 	if (error_code & X86_PF_INSTR) {
 		unsigned int level;
 		bool nx, rw;
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index f24f11cc644a..135307c93c2c 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -700,7 +700,7 @@ void kasan_non_canonical_hook(unsigned long addr)
 	 * operation would overflow only for some memory addresses. However, due
 	 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
 	 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
-	 * the overflow always happens.
+	 * the overflow always happens (for both x86 and arm64).
 	 *
 	 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
 	 * possible shadow addresses belong to a region that is the result of
@@ -715,6 +715,40 @@ void kasan_non_canonical_hook(unsigned long addr)
 			return;
 	}
 
+	 /*
+	  * For x86-64, only the pointer bits [62:57] get reset, and bits #63
+	  * and #56 can be 0 or 1. Thus, kasan_mem_to_shadow() can be possibly
+	  * applied to two regions of memory:
+	  * [0x7E00000000000000, 0x7FFFFFFFFFFFFFFF] and
+	  * [0xFE00000000000000, 0xFFFFFFFFFFFFFFFF]. As the overflow happens
+	  * for both ends of both memory ranges, both possible shadow regions
+	  * are contiguous.
+	  *
+	  * Given the KASAN_SHADOW_OFFSET equal to 0xffeffc0000000000, the
+	  * following ranges are valid mem-to-shadow mappings:
+	  *
+	  * 0xFFFFFFFFFFFFFFFF
+	  *         INVALID
+	  * 0xFFEFFBFFFFFFFFFF - kasan_mem_to_shadow(~0UL)
+	  *         VALID   - kasan shadow mem
+	  *         VALID   - non-canonical kernel virtual address
+	  * 0xFFCFFC0000000000 - kasan_mem_to_shadow(0xFEUL << 56)
+	  *         INVALID
+	  * 0x07EFFBFFFFFFFFFF - kasan_mem_to_shadow(~0UL >> 1)
+	  *         VALID   - non-canonical user virtual addresses
+	  *         VALID   - user addresses
+	  * 0x07CFFC0000000000 - kasan_mem_to_shadow(0x7EUL << 56)
+	  *         INVALID
+	  * 0x0000000000000000
+	  */
+	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_X86_64)) {
+		if ((addr < (u64)kasan_mem_to_shadow((void *)(0x7EUL << 56)) ||
+		     addr > (u64)kasan_mem_to_shadow((void *)(~0UL >> 1))) &&
+		    (addr < (u64)kasan_mem_to_shadow((void *)(0xFEUL << 56)) ||
+		     addr > (u64)kasan_mem_to_shadow((void *)(~0UL))))
+			return;
+	}
+
 	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
 
 	/*
-- 
2.49.0


