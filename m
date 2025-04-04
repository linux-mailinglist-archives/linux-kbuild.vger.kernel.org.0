Return-Path: <linux-kbuild+bounces-6413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1790A7BD6B
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 15:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 165603B85F0
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Apr 2025 13:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441EE1EF368;
	Fri,  4 Apr 2025 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+Wmrqc3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561B1F099F;
	Fri,  4 Apr 2025 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772534; cv=none; b=hOKaLWHboqIST7RA+RQH/BIVU/pSqvMdIohpv323Om2I1YwjyQmixr5d1WAVL0EB4cFYiIVHYGxAR66KSnzVhCrLNU29fJS+LnGjMsfp4Tu5mGWUBNbiBxbrg9tSXGH/MjF/1/GmSB9EAanoZ7emCTHkMOOp1blsbIzhmuOJCwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772534; c=relaxed/simple;
	bh=AJLSjKGgb59TRhfxq8kMEvmnCKnMy4310E2Hut68m+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2QSExrdUkt6hOtJh2e2f4ArYTvCEndMQ9XLFF2QlTP/oCY0NSb4NI+ePzUlsxWzA3nRA2Yl5ivP2RTi0e+CQ8UyoI8X+hQah9gvpMJ4n8wFq6yUA7x/S79wy8O8REEByVtf/7lpIQVxbq886O+cXX4lYDF5Et+RFl24Twuq5o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+Wmrqc3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743772533; x=1775308533;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AJLSjKGgb59TRhfxq8kMEvmnCKnMy4310E2Hut68m+c=;
  b=b+Wmrqc3adqt7PJ8e++LpYm4q/BB+Dsl/qsn81I1zeiXVPvmYKeP2X/K
   Db3sVDsRQJ/y3zhgLGtAib8k1sAYAI2I4C8shzXLUIm0u8hyENH6mrPFE
   u04AbuxZH/yPnZE+di2C0z4KD5WAlC6+cv8SUTAexAdYH/sIprAe/8reh
   YFDcyssH9QwpahIQUB1BPTLMiYhX4tZLNYyZE0oqsLYGxs2W7XCxYVZmp
   GWATnMHoOFS0cr+tTfpVw2jjHB3sRXb/M261/yS0EA2pziWjQPNsEBYRW
   +EgkwvxQEv2L2Ly2ryUoUZvwf9CR7zUmf3RAlBKelhTMJpZFLlbvSTn7x
   A==;
X-CSE-ConnectionGUID: RzQFJRvoQDGZ19kSwlfwiw==
X-CSE-MsgGUID: YdYclYtKS1KYC+H1gEmZTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="55401632"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="55401632"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:15:32 -0700
X-CSE-ConnectionGUID: tH8/P6IgSuuHLhHzruVqJg==
X-CSE-MsgGUID: 0efeALDRQGCxEo3GUCuhZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="128157007"
Received: from opintica-mobl1 (HELO wieczorr-mobl1.intel.com) ([10.245.245.50])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 06:15:17 -0700
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
Subject: [PATCH v3 03/14] x86: Add arch specific kasan functions
Date: Fri,  4 Apr 2025 15:14:07 +0200
Message-ID: <e06c7c0fdbad7044f150891d827393665c5742fd.1743772053.git.maciej.wieczor-retman@intel.com>
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

KASAN's software tag-based mode needs multiple macros/functions to
handle tag and pointer interactions - mainly to set and retrieve tags
from the top bits of a pointer.

Mimic functions currently used by arm64 but change the tag's position to
bits [60:57] in the pointer.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Reorder functions so that __tag_*() etc are above the
  arch_kasan_*() ones.
- Remove CONFIG_KASAN condition from __tag_set()

 arch/x86/include/asm/kasan.h | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index d7e33c7f096b..212218622963 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -3,6 +3,8 @@
 #define _ASM_X86_KASAN_H
 
 #include <linux/const.h>
+#include <linux/kasan-tags.h>
+#include <linux/types.h>
 #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
 #define KASAN_SHADOW_SCALE_SHIFT 3
 
@@ -24,8 +26,33 @@
 						  KASAN_SHADOW_SCALE_SHIFT)))
 
 #ifndef __ASSEMBLER__
+#include <linux/bitops.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+#ifdef CONFIG_KASAN_SW_TAGS
+
+#define __tag_shifted(tag)		FIELD_PREP(GENMASK_ULL(60, 57), tag)
+#define __tag_reset(addr)		(sign_extend64((u64)(addr), 56))
+#define __tag_get(addr)			((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)addr))
+#else
+#define __tag_shifted(tag)		0UL
+#define __tag_reset(addr)		(addr)
+#define __tag_get(addr)			0
+#endif /* CONFIG_KASAN_SW_TAGS */
+
+static inline const void *__tag_set(const void *addr, u8 tag)
+{
+	u64 __addr = (u64)addr & ~__tag_shifted(KASAN_TAG_KERNEL);
+	return (const void *)(__addr | __tag_shifted(tag));
+}
+
+#define arch_kasan_set_tag(addr, tag)	__tag_set(addr, tag)
+#define arch_kasan_reset_tag(addr)	__tag_reset(addr)
+#define arch_kasan_get_tag(addr)	__tag_get(addr)
 
 #ifdef CONFIG_KASAN
+
 void __init kasan_early_init(void);
 void __init kasan_init(void);
 void __init kasan_populate_shadow_for_vaddr(void *va, size_t size, int nid);
@@ -34,8 +61,9 @@ static inline void kasan_early_init(void) { }
 static inline void kasan_init(void) { }
 static inline void kasan_populate_shadow_for_vaddr(void *va, size_t size,
 						   int nid) { }
-#endif
 
-#endif
+#endif /* CONFIG_KASAN */
+
+#endif /* __ASSEMBLER__ */
 
 #endif
-- 
2.49.0


