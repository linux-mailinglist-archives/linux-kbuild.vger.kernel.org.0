Return-Path: <linux-kbuild+bounces-8601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E9B34BF4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D15189A6D4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAD32367B3;
	Mon, 25 Aug 2025 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G09IcGaH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87F4211A35;
	Mon, 25 Aug 2025 20:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153851; cv=none; b=D2sPqjdALU6pK3+7L2ohAGPsMaRDYVPAquJk6ymgwTUs6PUtJqgOzh6W2OPLII1/guEwqIHXycGR+fRHVQVvVyGAFyc4SB7jOZvwh3bMZ07IrP+pKnqQdMDj8vZEdpGbYSvmb791ekhbAOrgLIWeQINOtEYI0E68vQJ3f0Y2HWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153851; c=relaxed/simple;
	bh=o5F0wPdxTZ0bQcRnx5I19obOwawHIRj4vxPdiutM1tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/LXH6w8aLz6Hkitkzg63mYdz5arHmNU1MdmNranZGQ9k70fRceZeJ5loO3MuWRq8ee7nZgPWrkEy2Ccs+403Xk5BTut4RzDfigF4/z6LjnJIPaX6/YdWiAtlTQaLryc8TRWdNF9V5wzhcHer+GACbAl3PiWb4GT2iVCMg0txic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G09IcGaH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153849; x=1787689849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o5F0wPdxTZ0bQcRnx5I19obOwawHIRj4vxPdiutM1tI=;
  b=G09IcGaHEWHOvCi42j8VS/+9ZbPcjPk8Ym1pDZXiCXq7w1/jnVEP/2u6
   oKfTppAeZKO4IxY6muR5SkutnGyeIJ+k4fe4bz+6d0Ev+DAqlvFWaXaGc
   hlBIuYuQcuqJ84gBX/Y9jxYh9iCC6NQJFK+KCAAILN6/Q7vpCafAoUymr
   XbByucpdy2rYZETqMATxzwmFG81W/ZdxWTz45fMmiqejTCHzAP+gPSMYZ
   HfQU9LPDmBHpAOTKYqvxHCGq4r0q8KOEi1qLySHApU3rLVd1jnuNBEizL
   AifceJTtv0I9ZXMXiIEqkIKEcm3UP/qKtjhxOUKKN1RoVc6XGpWorXtID
   A==;
X-CSE-ConnectionGUID: E0mhD45MQQKeM/JDMlp1Gw==
X-CSE-MsgGUID: QwO4o/oISC6ZHfyLnZXL3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68971024"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68971024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:30:48 -0700
X-CSE-ConnectionGUID: K2BRmtlySGeelzThEKb4eQ==
X-CSE-MsgGUID: X0GDFQZSSQO4ZbqrrO+rdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169780899"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:30:27 -0700
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
Subject: [PATCH v5 15/19] kasan: x86: Apply multishot to the inline report handler
Date: Mon, 25 Aug 2025 22:24:40 +0200
Message-ID: <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
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

KASAN by default reports only one tag mismatch and based on other
command line parameters either keeps going or panics. The multishot
mechanism - enabled either through a command line parameter or by inline
enable/disable function calls - lifts that restriction and allows an
infinite number of tag mismatch reports to be shown.

Inline KASAN uses the INT3 instruction to pass metadata to the report
handling function. Currently the "recover" field in that metadata is
broken in the compiler layer and causes every inline tag mismatch to
panic the kernel.

Check the multishot state in the KASAN hook called inside the INT3
handling function.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v4:
- Add this patch to the series.

 arch/x86/mm/kasan_inline.c | 3 +++
 include/linux/kasan.h      | 3 +++
 mm/kasan/report.c          | 8 +++++++-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/kasan_inline.c b/arch/x86/mm/kasan_inline.c
index 9f85dfd1c38b..f837caf32e6c 100644
--- a/arch/x86/mm/kasan_inline.c
+++ b/arch/x86/mm/kasan_inline.c
@@ -17,6 +17,9 @@ bool kasan_inline_handler(struct pt_regs *regs)
 	if (!kasan_report((void *)addr, size, write, pc))
 		return false;
 
+	if (kasan_multi_shot_enabled())
+		return true;
+
 	kasan_inline_recover(recover, "Oops - KASAN", regs, metadata, die);
 
 	return true;
diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 8691ad870f3b..7a2527794549 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -663,7 +663,10 @@ void kasan_non_canonical_hook(unsigned long addr);
 static inline void kasan_non_canonical_hook(unsigned long addr) { }
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
 
+bool kasan_multi_shot_enabled(void);
+
 #ifdef CONFIG_KASAN_SW_TAGS
+
 /*
  * The instrumentation allows to control whether we can proceed after
  * a crash was detected. This is done by passing the -recover flag to
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 50d487a0687a..9e830639e1b2 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -121,6 +121,12 @@ static void report_suppress_stop(void)
 #endif
 }
 
+bool kasan_multi_shot_enabled(void)
+{
+	return test_bit(KASAN_BIT_MULTI_SHOT, &kasan_flags);
+}
+EXPORT_SYMBOL(kasan_multi_shot_enabled);
+
 /*
  * Used to avoid reporting more than one KASAN bug unless kasan_multi_shot
  * is enabled. Note that KASAN tests effectively enable kasan_multi_shot
@@ -128,7 +134,7 @@ static void report_suppress_stop(void)
  */
 static bool report_enabled(void)
 {
-	if (test_bit(KASAN_BIT_MULTI_SHOT, &kasan_flags))
+	if (kasan_multi_shot_enabled())
 		return true;
 	return !test_and_set_bit(KASAN_BIT_REPORTED, &kasan_flags);
 }
-- 
2.50.1


