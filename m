Return-Path: <linux-kbuild+bounces-8597-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7763AB34BE3
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C35A243A10
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:29:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E13228A73A;
	Mon, 25 Aug 2025 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMNcrVXW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8A62248A8;
	Mon, 25 Aug 2025 20:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153765; cv=none; b=UGW/55HFfwSi+w5FOecrp0Ns8dMbiBzRNzbLrxRb408Nv4G8kp6mRZh3pi3Hs3jaZwBRe1o7nVSAqgEaUDhVOBTSb1qbGxFcLVzZaZJ6eBeubZvZONbawLAwQTOhh4mp89G+lvq6rwEWDl6W0a1twBGKKEVZaVbH+0TOYEJYjwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153765; c=relaxed/simple;
	bh=UlbhFGz226HIxGPpl32TNHWjf4s+OegZMHU4Z5wVVAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4MFEAcrISnYXjqvp1+LKpcq6mI9HMhf0Wf+jO584RCOyayLDbofGgKlMYtGnAkamGowRIEwvlHssJfq06MQNjjTV1w5nTapKwIx8xY97eGBV2NJqBkLQLoOna9rjBel8Z8KzOWGgIhYakITHHoSItzgWod04faZDFtI5APAftI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMNcrVXW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153764; x=1787689764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UlbhFGz226HIxGPpl32TNHWjf4s+OegZMHU4Z5wVVAQ=;
  b=dMNcrVXW2dqdFKO6K2QFPU+qRTx7jq/G1YGWVNuiHBmgkb8OmUvT3Xbu
   z8ahOiGiwnzbd4zsrS9W9bXMCiYdzIOy5njTcX/3Dt6mLzSxxE+WsvI3L
   pqWbRU77SQxO67weVtQy/rqpYgiMZL8eHtTN3Il+rMjcfIIhL4Ge2yIqE
   SzFllKAIfyZsS/Ky6F4GlXRpnaxurCzq14U6j5kJTj1nbp6DNkHs2anYJ
   Q/UH1PMoBj0dVZV+ZdrTWSciJW6Xe8qZYF/FenwOykZrjX2UrwjNzeaKa
   EYwihvBROPo9T19rgmUEKHPS9hRL9LzveOTSZnDZ4WZCGSdGBdP+3MD4q
   A==;
X-CSE-ConnectionGUID: S/+rfpyQQ9WcUMRZ57CdSA==
X-CSE-MsgGUID: hF2oMWLMSUmlLzjuOPyH1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68970761"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68970761"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:29:23 -0700
X-CSE-ConnectionGUID: 2iU/MAdEQzuCmnajWPCpwA==
X-CSE-MsgGUID: Li6ndXn4Q1+50YJZ69xiow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169780561"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:29:02 -0700
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
Subject: [PATCH v5 11/19] x86: LAM initialization
Date: Mon, 25 Aug 2025 22:24:36 +0200
Message-ID: <ffd8c5ee9bfc5acbf068a01ef45d3bf506c191a3.1756151769.git.maciej.wieczor-retman@intel.com>
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

To make use of KASAN's tag based mode on x86, Linear Address Masking
(LAM) needs to be enabled. To do that the 28th bit in CR4 has to be set.

Set the bit in early memory initialization.

When launching secondary CPUs the LAM bit gets lost. To avoid this add
it in a mask in head_64.S. The bitmask permits some bits of CR4 to pass
from the primary CPU to the secondary CPUs without being cleared.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/kernel/head_64.S | 3 +++
 arch/x86/mm/init.c        | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 3e9b3a3bd039..18ca77daa481 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -209,6 +209,9 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 	 *  there will be no global TLB entries after the execution."
 	 */
 	movl	$(X86_CR4_PAE | X86_CR4_LA57), %edx
+#ifdef CONFIG_ADDRESS_MASKING
+	orl	$X86_CR4_LAM_SUP, %edx
+#endif
 #ifdef CONFIG_X86_MCE
 	/*
 	 * Preserve CR4.MCE if the kernel will enable #MC support.
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bb57e93b4caf..756bd96c3b8b 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -763,6 +763,9 @@ void __init init_mem_mapping(void)
 	probe_page_size_mask();
 	setup_pcid();
 
+	if (boot_cpu_has(X86_FEATURE_LAM) && IS_ENABLED(CONFIG_KASAN_SW_TAGS))
+		cr4_set_bits_and_update_boot(X86_CR4_LAM_SUP);
+
 #ifdef CONFIG_X86_64
 	end = max_pfn << PAGE_SHIFT;
 #else
-- 
2.50.1


