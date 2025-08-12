Return-Path: <linux-kbuild+bounces-8408-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A045B228BF
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 15:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384CB6247E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 13:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8B1283CA7;
	Tue, 12 Aug 2025 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8BjC18w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB40D283C9E;
	Tue, 12 Aug 2025 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755005425; cv=none; b=SSAlmkooWizOUHcTpY1Uczewrl95jOY3LcaY5f+Ix+xixapVgDbtnu5EYfVqY04G2hQ+gEx9GJT8siD+R/9Qm8Tn7DzdAHu4p0lzr8P2qLWaI6Mv5Hi1fyv40GH/1k0jxk8/5OEe1zWyxE5+sQml73oDSaDyEpmxxMOeQ+JgIfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755005425; c=relaxed/simple;
	bh=Z/kDn3NFABCWRH7hqk/aYpfugnY8BGjn3l5jxoLYjts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaAMNnrgOhTAc7nS6C5Mis3kg7eSTazI8SUrhbsq+uNodu7m8mi3GT2SGh64gXSTnaomRkmIl77hbYpw1yyJlmTqLNMqhiOfpacI4H8d7aDcs+qB+fr91McpPlCe7ffXVh467JXZXNFgdm1BWdvZokGXs7bk6TEeC+AKv8y/XPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8BjC18w; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755005424; x=1786541424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z/kDn3NFABCWRH7hqk/aYpfugnY8BGjn3l5jxoLYjts=;
  b=T8BjC18wBYWexyUPECVg0o56O98qxKgdIHfcXcTCX9QJVEt6SXddG+eG
   +XBQo7bgXyZ70ZOtWFRfpF3kj42fYCOdVs2YwZnEhmLfzhXm+VHh4ypyK
   VnyXuyd6VARecvJmzxUewg8W/WDcaZSKBczUfix6WoxrjZXaQ/kmImKXz
   U4gTlpMR/SLzjZ9zKGdSrxW4RFFymDfjwYFuzpKipmi6WcJtETZM1CrDu
   2PazCBLxg7ZNdRYltqgN40l+TSVBd6uTpppO8KjGyHXPoFfMb59q9vH87
   6S0jqHmuBe8zu2cVmed0zuaQs9NiAAaD5JgYrzYyJT+a1mq4M/6gK91Ss
   A==;
X-CSE-ConnectionGUID: xwnm88smQEmhn+HIZ/MVZg==
X-CSE-MsgGUID: 85EmKvBZS++yfZQfnlO1+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="60903934"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="60903934"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:30:24 -0700
X-CSE-ConnectionGUID: O4o3sBLXTKmQMTR9muYdMA==
X-CSE-MsgGUID: lT/GoXCxT2av3FFB71gMVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165831775"
Received: from vpanait-mobl.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.54])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 06:29:58 -0700
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
Subject: [PATCH v4 14/18] kasan: x86: Apply multishot to the inline report handler
Date: Tue, 12 Aug 2025 15:23:50 +0200
Message-ID: <8ace14464d88b51f309b289874760b5d6265e438.1755004923.git.maciej.wieczor-retman@intel.com>
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
index 93c6cadb0765..cfa2da0e2985 100644
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


