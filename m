Return-Path: <linux-kbuild+bounces-8602-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A9EB34BFE
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189BA205F10
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FD61F419B;
	Mon, 25 Aug 2025 20:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/ljeTl7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BA923A99F;
	Mon, 25 Aug 2025 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153874; cv=none; b=V5dIJIs9TDm7xEWCnlblSVoM5QOo7oGudv/cJkLzIbN6ofMY1Q3PUNy0uBUovJcB6WtJl3zfBJTHp34/CxL5b02tTES97aJQow4v4hs3QU/WrP3ZCSgMv8JPatPOM+6LUiViVUE/Pj8Kqf3IzzPOvwUbMuuJNci4cAdFHxc2f24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153874; c=relaxed/simple;
	bh=J8CXiM6R9Pwi3hQrlGW0UyxoKzu/ihlIQqlipezAJ2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewTLCbfXV7SFlTJIXVYmVKcueYMzokXwcsVNZdFZO3bUOMioRrvuomDxRWEDck1dvt1JVUs+wMa6YHdJvPRWWpnNUblakv1rQmr2tZHQ2/0eMK5w1LyJqWlcIfzWuhxJNpAmUdSr+oABpajkRzvcu7QaMyf22lt9yH3rBHfTCF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/ljeTl7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153872; x=1787689872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J8CXiM6R9Pwi3hQrlGW0UyxoKzu/ihlIQqlipezAJ2A=;
  b=D/ljeTl7eg9GbdqzETKDyh7t6ctyr+niU882eJaWAbJ5hSvEc7At5nt4
   9SmMOxEkuAyrZyQY9n+h8a1vkqwfcAaePcsXoYx6V3pHDD+/u3ehKxOlA
   kzI+DXMtM+PP7RqmhVDa7qdHaBa/tsm+EybW21T+DSyqve+pCJ2uSd92w
   PobbiWBdbJNeiNUu1oZd3koIlxWlsg/3uQjoCRN8sTTSYGvXXALnx0JMt
   P1buh+TwSujSx00XEgbJyXjnnbD8ohqBrR3ddLvUcVcAFsCoTA+KT+z9B
   on65lWzy9gybQ2M5kYoGXTQygip4QYTk5slVJo/j1XTt6S1RrNPybw0cw
   g==;
X-CSE-ConnectionGUID: Znxs1Yg0Q0es3zSbg8h64A==
X-CSE-MsgGUID: s6mG44VGQfGCx9mBaEry+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68971083"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68971083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:31:11 -0700
X-CSE-ConnectionGUID: MQA+TzInQqevwz5W19OOTw==
X-CSE-MsgGUID: GAgjeP88RDmDgTZRoDSocQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169780957"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:30:49 -0700
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
Subject: [PATCH v5 16/19] kasan: x86: Logical bit shift for kasan_mem_to_shadow
Date: Mon, 25 Aug 2025 22:24:41 +0200
Message-ID: <169510f5490cba60916b144398543a489c31e2c1.1756151769.git.maciej.wieczor-retman@intel.com>
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

While generally tag-based KASAN adopts an arithemitc bit shift to
convert a memory address to a shadow memory address, it doesn't work for
all cases on x86. Testing different shadow memory offsets proved that
either 4 or 5 level paging didn't work correctly or inline mode ran into
issues. Thus the best working scheme is the logical bit shift and
non-canonical shadow offset that x86 uses for generic KASAN, of course
adjusted for the increased granularity from 8 to 16 bytes.

Add an arch specific implementation of kasan_mem_to_shadow() that uses
the logical bit shift.

The non-canonical hook tries to calculate whether an address came from
kasan_mem_to_shadow(). First it checks whether this address fits into
the legal set of values possible to output from the mem to shadow
function.

Tie both generic and tag-based x86 KASAN modes to the address range
check associated with generic KASAN.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Add this patch to the series.

 arch/x86/include/asm/kasan.h | 8 ++++++++
 mm/kasan/report.c            | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 5bf38bb836e1..f3e34a9754d2 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -53,6 +53,14 @@
 
 #ifdef CONFIG_KASAN_SW_TAGS
 
+static inline void *__kasan_mem_to_shadow(const void *addr)
+{
+	return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
+		+ KASAN_SHADOW_OFFSET;
+}
+
+#define kasan_mem_to_shadow(addr)	__kasan_mem_to_shadow(addr)
+
 #define __tag_shifted(tag)		FIELD_PREP(GENMASK_ULL(60, 57), tag)
 #define __tag_reset(addr)		(sign_extend64((u64)(addr), 56))
 #define __tag_get(addr)			((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)addr))
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 9e830639e1b2..ee440ed1ecd3 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -648,13 +648,14 @@ void kasan_non_canonical_hook(unsigned long addr)
 	const char *bug_type;
 
 	/*
-	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
+	 * For Generic KASAN and Software Tag-Based mode on the x86
+	 * architecture, kasan_mem_to_shadow() uses the logical right shift
 	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
 	 * both x86 and arm64). Thus, the possible shadow addresses (even for
 	 * bogus pointers) belong to a single contiguous region that is the
 	 * result of kasan_mem_to_shadow() applied to the whole address space.
 	 */
-	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
+	if (IS_ENABLED(CONFIG_KASAN_GENERIC) || IS_ENABLED(CONFIG_X86_64)) {
 		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0UL)) ||
 		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0UL)))
 			return;
-- 
2.50.1


