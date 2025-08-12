Return-Path: <linux-kbuild+bounces-8406-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B9EB228BE
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 15:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04656188913B
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 13:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375742857C7;
	Tue, 12 Aug 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxXQMyrK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD6B1FDA94;
	Tue, 12 Aug 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005376; cv=none; b=ekghHj2P7u7ZAdLabVFzpHT7vyGVxLrMkBkPk0MLGUPH0EXw+jUutmslaFxfUfA1phogqM+QhnFUO8Xj/24JWAhV0Ct4FuM9cLJ1gna0/bX5YoMEKo3RBp4OIaLtkyutn34uFwSMSzbPuGZ55Duysr16FCH4pnVU1bLtKNU7zrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005376; c=relaxed/simple;
	bh=9AhOaWTatNb4QMfmox2H6CEYyqT3KnhFIot1r52xKmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJoElwlB/GlZpH8FwhqRFK+/j4YK9luQvorkfPK+XFkTcrbygm2UvYsi6CWwCmXzt9b06sz+S8tWFImeMF5YMAzYjC8u84FncgkrwdFl7z0WafZL1p0kX/wyFwdgAS3KeSWKQynKtQFTGosdoljS67t/RrRW85uI1GZC5qQD+Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxXQMyrK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005375; x=1786541375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9AhOaWTatNb4QMfmox2H6CEYyqT3KnhFIot1r52xKmg=;
  b=dxXQMyrKsH7Jyak4u9OBrQP/i1i2aALoCY7NNFLedp5Yz2g2X6+qQeGo
   nNbBcK72oWlAnAvSZ9a8a13qaGZu+A6TSif/ucrF89EDeFDmDMBo3I1pu
   d4dkksejp/LPcMYE1iObLcsvrUjHp1r2s2ZF801R/Y1Y0jvrydkApyoRG
   EprNjezSdDQrxfX9ku/ZRi2Zr80jttaeJk4g9XZ2me6Ppez15+0dfcTqM
   bZqdvCgZ+Pkv5DTY2WW/0myjmyFFnZg7IaUZwDllTduSawyyoERDk/197
   1hcSWfaf/uRxu0HVcPfHKZFOhvajoOGezVF5LeQzXtWq2hxppub35S1FD
   A==;
X-CSE-ConnectionGUID: iTkOM0YRQ8Kj38R4ZT19Bg==
X-CSE-MsgGUID: 0VoXRUPYTLeBIRb0ccFt6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60903795"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60903795"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:29:34 -0700
X-CSE-ConnectionGUID: t6kjFU4oRZiLZmMpMij85g==
X-CSE-MsgGUID: TDLcIyj9Qy+UaemOVoZKVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165831582"
Received: from vpanait-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:29:12 -0700
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
Subject: [PATCH v4 12/18] x86: Minimal SLAB alignment
Date: Tue, 12 Aug 2025 15:23:48 +0200
Message-ID: <a765e38bdeae15193215bb8fd713df9350048edc.1755004923.git.maciej.wieczor-retman@intel.com>
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

8 byte minimal SLAB alignment interferes with KASAN's granularity of 16
bytes. It causes a lot of out-of-bounds errors for unaligned 8 byte
allocations.

Compared to a kernel with KASAN disabled, the memory footprint increases
because all kmalloc-8 allocations now are realized as kmalloc-16, which
has twice the object size. But more meaningfully, when compared to a
kernel with generic KASAN enabled, there is no difference. Because of
redzones in generic KASAN, kmalloc-8' and kmalloc-16' object size is the
same (48 bytes). So changing the minimal SLAB alignment of the tag-based
mode doesn't have any negative impact when compared to the other
software KASAN mode.

Adjust x86 minimal SLAB alignment to match KASAN granularity size.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Extend the patch message with some more context and impact
  information.

Changelog v3:
- Fix typo in patch message 4 -> 16.
- Change define location to arch/x86/include/asm/cache.c.

 arch/x86/include/asm/cache.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
index 69404eae9983..3232583b5487 100644
--- a/arch/x86/include/asm/cache.h
+++ b/arch/x86/include/asm/cache.h
@@ -21,4 +21,8 @@
 #endif
 #endif
 
+#ifdef CONFIG_KASAN_SW_TAGS
+#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)
+#endif
+
 #endif /* _ASM_X86_CACHE_H */
-- 
2.50.1


