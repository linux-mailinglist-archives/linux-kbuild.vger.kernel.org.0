Return-Path: <linux-kbuild+bounces-8594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BABB34BD4
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 22:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6283BF860
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 20:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D869328C5A4;
	Mon, 25 Aug 2025 20:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVCpFbD7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D978635C;
	Mon, 25 Aug 2025 20:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756153702; cv=none; b=iV+X5T3qQ+4WWsIbGMHh4g3tosgq+ae09h+1He5RMAObwl2Y8I0D9/2acF/XFu7OjHYY40mvQY+HYWOP6KeqA5EbiHzlEHbokSdo50Nmk/1epEO+3aRoSJ2rOsjzUc1Xhj1UMbcf7hHih1TbQZu+S3c9yewW/4IbzLADPBf4AuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756153702; c=relaxed/simple;
	bh=lO1wQ1uF80MsG8cgULvpACCbJsuEPvTrA5VlE9nVfaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qo1G+g9RJJ1hjAvT0Hz4UV6s0M6w3KfT23mNGtVxDqi9UC7t2HQEoNH9vk7HVcYZwRJc/QnF/AEIEQyrWp0OUZbNpLTKNxC9FO8VkGSmdfsgkR2jtkSl9XXUplZGAEtuqjQhSVvJrgDFV1QfMvcMG8ngj0TFSjmvCzIDl1B6IMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVCpFbD7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756153701; x=1787689701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lO1wQ1uF80MsG8cgULvpACCbJsuEPvTrA5VlE9nVfaY=;
  b=BVCpFbD77G5kGVyyU8uCwnV00XF5Be5KPWwwlZCPDAi5hsNdKs5mHvSj
   7mT+yW0IfNXMU++CkhMM+wXiyTPK5/mrvoV5v9vutqECF27bVgMJuh/DY
   ASewFHhwRumn6dagx44NZsc3MJmDVD8Vwh4LD+R8qSztkiOfKxOnbB0YA
   odkXBNMZG01lkxkW2Obl+ruWzVT+FLdXP6k0xCwP+agcQQuY6Ksuwpqi8
   +OgYo1jJkVdR4UpjJf36OYjkdSluxzFaPynSHRcveptfL3iAh30BamqIn
   QxNH2HmNV6/0wbP1zSEcMTgZhBI0gHgM7UR7Zzl7+vGlnT/gAxVWcAMHE
   g==;
X-CSE-ConnectionGUID: XdhscU/fTqa6qmAQ7s9XXA==
X-CSE-MsgGUID: ikalLsvmR+iz0N2wuZQjJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68970592"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68970592"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:28:20 -0700
X-CSE-ConnectionGUID: BTOD3xT1SsCYAVcn5cBJcQ==
X-CSE-MsgGUID: Ag3FqLySS2u86QrmhSMmLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169780435"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.245.6])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:27:59 -0700
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
Subject: [PATCH v5 08/19] x86: Physical address comparisons in fill_p*d/pte
Date: Mon, 25 Aug 2025 22:24:33 +0200
Message-ID: <308f29aa95ebf7b293b6c2970384a2c2b34a64ef.1756151769.git.maciej.wieczor-retman@intel.com>
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

Calculating page offset returns a pointer without a tag. When comparing
the calculated offset to a tagged page pointer an error is raised
because they are not equal.

Change pointer comparisons to physical address comparisons as to avoid
issues with tagged pointers that pointer arithmetic would create. Open
code pte_offset_kernel(), pmd_offset(), pud_offset() and p4d_offset().
Because one parameter is always zero and the rest of the function
insides are enclosed inside __va(), removing that layer lowers the
complexity of final assembly.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v2:
- Open code *_offset() to avoid it's internal __va().

 arch/x86/mm/init_64.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 76e33bd7c556..51a247e258b1 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -251,7 +251,10 @@ static p4d_t *fill_p4d(pgd_t *pgd, unsigned long vaddr)
 	if (pgd_none(*pgd)) {
 		p4d_t *p4d = (p4d_t *)spp_getpage();
 		pgd_populate(&init_mm, pgd, p4d);
-		if (p4d != p4d_offset(pgd, 0))
+
+		if (__pa(p4d) != (pgtable_l5_enabled() ?
+				  __pa(pgd) :
+				  (unsigned long)pgd_val(*pgd) & PTE_PFN_MASK))
 			printk(KERN_ERR "PAGETABLE BUG #00! %p <-> %p\n",
 			       p4d, p4d_offset(pgd, 0));
 	}
@@ -263,7 +266,7 @@ static pud_t *fill_pud(p4d_t *p4d, unsigned long vaddr)
 	if (p4d_none(*p4d)) {
 		pud_t *pud = (pud_t *)spp_getpage();
 		p4d_populate(&init_mm, p4d, pud);
-		if (pud != pud_offset(p4d, 0))
+		if (__pa(pud) != (p4d_val(*p4d) & p4d_pfn_mask(*p4d)))
 			printk(KERN_ERR "PAGETABLE BUG #01! %p <-> %p\n",
 			       pud, pud_offset(p4d, 0));
 	}
@@ -275,7 +278,7 @@ static pmd_t *fill_pmd(pud_t *pud, unsigned long vaddr)
 	if (pud_none(*pud)) {
 		pmd_t *pmd = (pmd_t *) spp_getpage();
 		pud_populate(&init_mm, pud, pmd);
-		if (pmd != pmd_offset(pud, 0))
+		if (__pa(pmd) != (pud_val(*pud) & pud_pfn_mask(*pud)))
 			printk(KERN_ERR "PAGETABLE BUG #02! %p <-> %p\n",
 			       pmd, pmd_offset(pud, 0));
 	}
@@ -287,7 +290,7 @@ static pte_t *fill_pte(pmd_t *pmd, unsigned long vaddr)
 	if (pmd_none(*pmd)) {
 		pte_t *pte = (pte_t *) spp_getpage();
 		pmd_populate_kernel(&init_mm, pmd, pte);
-		if (pte != pte_offset_kernel(pmd, 0))
+		if (__pa(pte) != (pmd_val(*pmd) & pmd_pfn_mask(*pmd)))
 			printk(KERN_ERR "PAGETABLE BUG #03!\n");
 	}
 	return pte_offset_kernel(pmd, vaddr);
-- 
2.50.1


