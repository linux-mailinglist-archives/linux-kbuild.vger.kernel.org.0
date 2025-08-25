Return-Path: <linux-kbuild+bounces-8589-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5C2B34BBC
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D4047A9DCA
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DA027EFF1;
	Mon, 25 Aug 2025 20:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8t0eNQP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B962288511;
	Mon, 25 Aug 2025 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153600; cv=none; b=qq8xzIHJYcsBhkb3xrnfavebSYft7m5NckbleENCyx/UH3vULpJw4v7051vAbSzrNuJjpsBPQMMkuJyV/UjApGfWFyLQZkIlKcmejCXRy/CNnHPARAmRZZbVkAEPVKyHu8b6Uw4qRRAn337IGJ2oioBjRybSShu08ORX3J1nU0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153600; c=relaxed/simple;
	bh=svwcdRMIJEw5xAT6fmvSyI7M9DNKZMAHSataOorEZqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z985FIMW3Cm1C1kopoRU5DGiKYnhHrHjUJ5c2YEw/Biz7wcDAaXeUAdD/ukgTjAMTomz3AdxR73/MAKYEzkGe/pjnVOe5mT8804BVB5JYT6V/Vk54HbH8k4zS3qBJjz6GScNqN/jNkLOAXofs4/Ve2Y/3oKiREx5C2Fl89Er+4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8t0eNQP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153598; x=1787689598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=svwcdRMIJEw5xAT6fmvSyI7M9DNKZMAHSataOorEZqU=;
  b=c8t0eNQPj3+03qRZLXNo+r+wYG8Lvuo6W//D8f4b/ALWs1cP58yK3ooj
   BAWO3TGLNaoVi7nKSHBBoIhI95YzMUVstYMTWIYQMXa0nl1vPiTSi/gCx
   8ufUaBwRo1L6KDfdr99g4xqWavSEYJ/pmi1R3l9v96yUlnhBHnZx0bmPg
   LudFLoZ0kvyIo83t0nRIFddbKidJAENd24A5yWAefwN/JgG2CW2vYuDwO
   DDDiN0Y4t6R4cVnLPkyBBSbCFPr6OLU5hGTzzd0wGA7j4vwLUrAgW/1l+
   5iphpjI9jSX+4mPog2gmg37pAY0eXviZRMGh1KYKUTuI4axSTHSVxTiHS
   A==;
X-CSE-ConnectionGUID: 3DZkxKq7SRqoDi43gKmUaA==
X-CSE-MsgGUID: 2HMhNSidSKGO6qHOKDyhDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68970348"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68970348"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:26:34 -0700
X-CSE-ConnectionGUID: iIqUDEsESZCpnMn6v7RjVA==
X-CSE-MsgGUID: 2PEh8pueQKehSA2GUwmUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169779925"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:26:15 -0700
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
Subject: [PATCH v5 03/19] kasan: Fix inline mode for x86 tag-based mode
Date: Mon, 25 Aug 2025 22:24:28 +0200
Message-ID: <98d2c875da80331a51a5c61e8a67ca43fc57cbd3.1756151769.git.maciej.wieczor-retman@intel.com>
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

The LLVM compiler uses hwasan-instrument-with-calls parameter to setup
inline or outline mode in tag-based KASAN. If zeroed, it means the
instrumentation implementation will be pasted into each relevant
location along with KASAN related constants during compilation. If set
to one all function instrumentation will be done with function calls
instead.

The default hwasan-instrument-with-calls value for the x86 architecture
in the compiler is "1", which is not true for other architectures.
Because of this, enabling inline mode in software tag-based KASAN
doesn't work on x86 as the kernel script doesn't zero out the parameter
and always sets up the outline mode.

Explicitly zero out hwasan-instrument-with-calls when enabling inline
mode in tag-based KASAN.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Add this patch to the series.

 scripts/Makefile.kasan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 693dbbebebba..2c7be96727ac 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -76,8 +76,11 @@ CFLAGS_KASAN := -fsanitize=kernel-hwaddress
 RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
 		   -Zsanitizer-recover=kernel-hwaddress
 
+# LLVM sets hwasan-instrument-with-calls to 1 on x86 by default. Set it to 0
+# when inline mode is enabled.
 ifdef CONFIG_KASAN_INLINE
 	kasan_params += hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET)
+	kasan_params += hwasan-instrument-with-calls=0
 else
 	kasan_params += hwasan-instrument-with-calls=1
 endif
-- 
2.50.1


