Return-Path: <linux-kbuild+bounces-7257-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F7AC3417
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 May 2025 13:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16E353B3485
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 May 2025 11:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1D71DE3D6;
	Sun, 25 May 2025 11:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fH/nCyFq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0F143748;
	Sun, 25 May 2025 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748171747; cv=none; b=Qa4VD02jc7R8daNib6khirvhhkBtGu0Ft+3AsrL6PV+PIPe0Zp4EGBu8lQYb22u++1zYhCfZkGjUnDjkaIrXAh5WgViQEh0nptAM6iPEXwhVjINff420UWSGDQGpqwZA6KrPePDbyonx2Dn3SaDzxdRGF1KxnqQkSAH31ocqBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748171747; c=relaxed/simple;
	bh=OT/JUaxbumpSuUDNK8SNN2PlfsW6Ib3r801CZFNEln8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPhNcyWJdNfQoxZMQF0rqhqPUoHsFgMDP+OIn6yR8Y/uAEd10Hkm5DFpYl5kj6TC2wz3dnaxXE0lIqsN8aSYPbyBkTC0TgYpYIa4wWO9Ftq/JzRr0ylTUaP/3XtBkCCEOvW+s9NvhkLVbDqB+NGMmeDrgIyPxGFDX5Lo2HIdEbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fH/nCyFq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748171746; x=1779707746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OT/JUaxbumpSuUDNK8SNN2PlfsW6Ib3r801CZFNEln8=;
  b=fH/nCyFq1vEbVlTne5/KRiOpjIxYQz5SPkeN6jxNBqPV9PVr93QMnRNL
   6iugXy+RkgWdQIs+gpPE2Px9W5FEMQ/KtUvU9rfFFJU0lH/IlZSBqPhAC
   0eUmOU1NuzfQZcQXR2dYBAtruwaJt7aNIl0ffGtcUpq+XsBpg/Di1bNg6
   DDFzAna3/rhcfrka3CWGvgZOwsUSG3cMSi6XgfdEsmmugcpZTVQqp9SD1
   ai/905iM2HVQvdRXC/VN/bPY3KFInI+QxbtXMeZyW/NP0Td9hB+qWbUF7
   pvw4ZuQP+mCU46V/QSKLYWc/5J5mlpa2m4AlcX4GvPS37H/UDl0na46cC
   w==;
X-CSE-ConnectionGUID: xeXfenOhTzi6gEpK1gEoog==
X-CSE-MsgGUID: qGgzHQ/8QWWckMpuIiTQ1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="37786213"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="37786213"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 04:15:45 -0700
X-CSE-ConnectionGUID: i7C2EKR5RrafQ/zVUiR9kQ==
X-CSE-MsgGUID: M0vn/PrRSPOp27HiRFbiMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="142488463"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 May 2025 04:15:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ9KL-000Rma-2F;
	Sun, 25 May 2025 11:15:37 +0000
Date: Sun, 25 May 2025 19:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Eric Naim <dnaim@cachyos.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Teresa Johnson <tejohnson@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
Message-ID: <202505251836.qXs81x9F-lkp@intel.com>
References: <20250521213534.3159514-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521213534.3159514-1-xur@google.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes linus/master v6.15-rc7 next-20250523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-distributed-build-support-for-Clang-ThinLTO/20250522-053726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250521213534.3159514-1-xur%40google.com
patch subject: [PATCH v3] kbuild: distributed build support for Clang ThinLTO
config: arm64-randconfig-r131-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251836.qXs81x9F-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250525/202505251836.qXs81x9F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251836.qXs81x9F-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/sparse-vmemmap.c:442:21: sparse: sparse: cast to non-scalar
>> mm/sparse-vmemmap.c:442:21: sparse: sparse: cast from non-scalar
   mm/sparse-vmemmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast to non-scalar
   arch/arm64/include/asm/pgtable.h:339:16: sparse: sparse: cast from non-scalar

vim +442 mm/sparse-vmemmap.c

2045a3b8911b6e Feiyang Chen 2022-10-27  415  
2045a3b8911b6e Feiyang Chen 2022-10-27  416  int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
2045a3b8911b6e Feiyang Chen 2022-10-27  417  					 int node, struct vmem_altmap *altmap)
2045a3b8911b6e Feiyang Chen 2022-10-27  418  {
2045a3b8911b6e Feiyang Chen 2022-10-27  419  	unsigned long addr;
2045a3b8911b6e Feiyang Chen 2022-10-27  420  	unsigned long next;
2045a3b8911b6e Feiyang Chen 2022-10-27  421  	pgd_t *pgd;
2045a3b8911b6e Feiyang Chen 2022-10-27  422  	p4d_t *p4d;
2045a3b8911b6e Feiyang Chen 2022-10-27  423  	pud_t *pud;
2045a3b8911b6e Feiyang Chen 2022-10-27  424  	pmd_t *pmd;
2045a3b8911b6e Feiyang Chen 2022-10-27  425  
2045a3b8911b6e Feiyang Chen 2022-10-27  426  	for (addr = start; addr < end; addr = next) {
2045a3b8911b6e Feiyang Chen 2022-10-27  427  		next = pmd_addr_end(addr, end);
2045a3b8911b6e Feiyang Chen 2022-10-27  428  
2045a3b8911b6e Feiyang Chen 2022-10-27  429  		pgd = vmemmap_pgd_populate(addr, node);
2045a3b8911b6e Feiyang Chen 2022-10-27  430  		if (!pgd)
2045a3b8911b6e Feiyang Chen 2022-10-27  431  			return -ENOMEM;
2045a3b8911b6e Feiyang Chen 2022-10-27  432  
2045a3b8911b6e Feiyang Chen 2022-10-27  433  		p4d = vmemmap_p4d_populate(pgd, addr, node);
2045a3b8911b6e Feiyang Chen 2022-10-27  434  		if (!p4d)
2045a3b8911b6e Feiyang Chen 2022-10-27  435  			return -ENOMEM;
2045a3b8911b6e Feiyang Chen 2022-10-27  436  
2045a3b8911b6e Feiyang Chen 2022-10-27  437  		pud = vmemmap_pud_populate(p4d, addr, node);
2045a3b8911b6e Feiyang Chen 2022-10-27  438  		if (!pud)
2045a3b8911b6e Feiyang Chen 2022-10-27  439  			return -ENOMEM;
2045a3b8911b6e Feiyang Chen 2022-10-27  440  
2045a3b8911b6e Feiyang Chen 2022-10-27  441  		pmd = pmd_offset(pud, addr);
2045a3b8911b6e Feiyang Chen 2022-10-27 @442  		if (pmd_none(READ_ONCE(*pmd))) {
2045a3b8911b6e Feiyang Chen 2022-10-27  443  			void *p;
2045a3b8911b6e Feiyang Chen 2022-10-27  444  
2045a3b8911b6e Feiyang Chen 2022-10-27  445  			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
2045a3b8911b6e Feiyang Chen 2022-10-27  446  			if (p) {
2045a3b8911b6e Feiyang Chen 2022-10-27  447  				vmemmap_set_pmd(pmd, p, node, addr, next);
2045a3b8911b6e Feiyang Chen 2022-10-27  448  				continue;
2045a3b8911b6e Feiyang Chen 2022-10-27  449  			} else if (altmap) {
2045a3b8911b6e Feiyang Chen 2022-10-27  450  				/*
2045a3b8911b6e Feiyang Chen 2022-10-27  451  				 * No fallback: In any case we care about, the
2045a3b8911b6e Feiyang Chen 2022-10-27  452  				 * altmap should be reasonably sized and aligned
2045a3b8911b6e Feiyang Chen 2022-10-27  453  				 * such that vmemmap_alloc_block_buf() will always
2045a3b8911b6e Feiyang Chen 2022-10-27  454  				 * succeed. For consistency with the PTE case,
2045a3b8911b6e Feiyang Chen 2022-10-27  455  				 * return an error here as failure could indicate
2045a3b8911b6e Feiyang Chen 2022-10-27  456  				 * a configuration issue with the size of the altmap.
2045a3b8911b6e Feiyang Chen 2022-10-27  457  				 */
2045a3b8911b6e Feiyang Chen 2022-10-27  458  				return -ENOMEM;
2045a3b8911b6e Feiyang Chen 2022-10-27  459  			}
2045a3b8911b6e Feiyang Chen 2022-10-27  460  		} else if (vmemmap_check_pmd(pmd, node, addr, next))
2045a3b8911b6e Feiyang Chen 2022-10-27  461  			continue;
2045a3b8911b6e Feiyang Chen 2022-10-27  462  		if (vmemmap_populate_basepages(addr, next, node, altmap))
2045a3b8911b6e Feiyang Chen 2022-10-27  463  			return -ENOMEM;
2045a3b8911b6e Feiyang Chen 2022-10-27  464  	}
2045a3b8911b6e Feiyang Chen 2022-10-27  465  	return 0;
2045a3b8911b6e Feiyang Chen 2022-10-27  466  }
2045a3b8911b6e Feiyang Chen 2022-10-27  467  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

