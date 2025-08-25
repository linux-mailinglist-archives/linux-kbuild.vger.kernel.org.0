Return-Path: <linux-kbuild+bounces-8596-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D1B34BE0
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70AA11B229B4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4195288511;
	Mon, 25 Aug 2025 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0+tyzln"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F382882DE;
	Mon, 25 Aug 2025 20:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153744; cv=none; b=aD3B4Bblrf5eC8+axGl9PvEJSS1WblWiVgSRUykq8+fnEZXbTqA/SQDwgtHhj0bF9nm0tcvoXpLS7lDb5+XJ5V2/+txzEsG7dM6bB6a8X596hJjfjmMCi72581lsEzM9+NVDH0eUsxLGo90YqMwDrfvWaQj2IxqwfXhsBKunl9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153744; c=relaxed/simple;
	bh=/h/qS5k+guufmpe0QiUnjnkdA3RIS+RF1dHh88nhkcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIvaOgSR7ZgPyzH4TPrTQL+dNWIRhxj/src1OKx8/bAi3pB/NW9Uj6bOaVtLUVopEaTsF6Ktv4ip057Ht5vpMazXLjvQXYuIOacAAzM3JOZPjhmdL7lsSzucPyXkibmc1ouhOtbqUTkLlTXxhBIrhgX4wI4xj3baqaIZ+secq9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0+tyzln; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153743; x=1787689743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/h/qS5k+guufmpe0QiUnjnkdA3RIS+RF1dHh88nhkcM=;
  b=R0+tyzlnURCKzVOH/YG3kG49QFxq2Y4bOq+w7PPo3XB5TY/4kinlKdaE
   btSLNDGxYsreS2vFj2xmqZEqeUlYu82mvrH1vOkPgQx6zIdY/zrXdduBs
   X5kwYP90cntW/nNrQ/ycMNqbtb9Pc3D7wLyTw/FaNS7uvUMdZNvRq6ZdA
   7FvAGFYJliMiWAdn6K105Ys09W4BsdIFtHdxDFAgovFO1CDZrq4sM2t/t
   5/Qdbaf/YNM4UcPmHr3iw/sh/wUK+G4vxB7OUeVo0ctZAQr7ek6pSRZkP
   o3yJgAK3KoMGOkUyN6kTQKJamsAmnrwXNdRz25ENHGyeAlZZYKMnk6XBn
   g==;
X-CSE-ConnectionGUID: AzjvU4CeTNOYEStVQSOeYQ==
X-CSE-MsgGUID: 862WwDapRz6Wofz44UnUSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68970693"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68970693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:29:02 -0700
X-CSE-ConnectionGUID: w+rKNHaARBe+f4eoM8vVOQ==
X-CSE-MsgGUID: /Hw/gZN7R822ANQdWoGk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169780519"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:28:39 -0700
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
Subject: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
Date: Mon, 25 Aug 2025 22:24:35 +0200
Message-ID: <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
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

For an address to be canonical it has to have its top bits equal to each
other. The number of bits depends on the paging level and whether
they're supposed to be ones or zeroes depends on whether the address
points to kernel or user space.

With Linear Address Masking (LAM) enabled, the definition of linear
address canonicality is modified. Not all of the previously required
bits need to be equal, only the first and last from the previously equal
bitmask. So for example a 5-level paging kernel address needs to have
bits [63] and [56] set.

Add separate __canonical_address() implementation for
CONFIG_KASAN_SW_TAGS since it's the only thing right now that enables
LAM for kernel addresses (LAM_SUP bit in CR4).

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Add patch to the series.

 arch/x86/include/asm/page.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
index bcf5cad3da36..a83f23a71f35 100644
--- a/arch/x86/include/asm/page.h
+++ b/arch/x86/include/asm/page.h
@@ -82,10 +82,20 @@ static __always_inline void *pfn_to_kaddr(unsigned long pfn)
 	return __va(pfn << PAGE_SHIFT);
 }
 
+/*
+ * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
+ */
+#ifdef CONFIG_KASAN_SW_TAGS
+static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
+{
+	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
+}
+#else
 static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
 {
 	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
 }
+#endif
 
 static __always_inline u64 __is_canonical_address(u64 vaddr, u8 vaddr_bits)
 {
-- 
2.50.1


