Return-Path: <linux-kbuild+bounces-1662-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CF8ADC71
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 05:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6F161C217C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 03:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF891C2A3;
	Tue, 23 Apr 2024 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQP1h7hg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61C0101E6
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 03:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713844204; cv=none; b=OfCpzOpUbx2FfbX0ftbuHBXxgzrJxI6VCPyJlm0U0TEjmF4PDW0nlJg1j72fTP4FF449GvUDYTs62f9hSJgOyzfdW6uJth23gsh096PaShzR3Zn9XisAd5dgn9pq0pcbOhpSlAkPTiYjppl2GWKN9KLulaP+R0JglVFdPTkl2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713844204; c=relaxed/simple;
	bh=SW1uUva28m6fZLY/Q6Mzlip7Ay6SHu5Aoxsxr2nLIM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIEpR0ATQbS11R7EPtGBkG5B5fXZDZZsK7waB5bOXcENvud5yM1Pr9lP1uNXYQDC7XUB3+eLFmDUeEdS+kNBP+u4i0Gpn1xwuF1lIVQLQbTKPTG/AGOylZKzBy57UyWm64LWQiJ0rCSMuVhu9pXkgGmcpMsm/TCFKb/jVkx/YUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQP1h7hg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713844203; x=1745380203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SW1uUva28m6fZLY/Q6Mzlip7Ay6SHu5Aoxsxr2nLIM4=;
  b=BQP1h7hg/9zWVdbyhFa6Dq81h/vDgI4LFzC9/KxCky2ZbyDbix/b+swx
   xNhK2ACBo0Z+SM89e3chMPUxC7iI1haLIcjNIZzOZBBdGOFJJDTEDgk4j
   ax4VgN0H43sFwyrX19+5fKkltB+oRo51qzsKZxgK7T81PH1m5D7qY8ckE
   W7IE92u0K8oo4Hdib9X60eCuUD+8p3nZIo6AAaxNKalyO9vYSB5nRiPqH
   4pBqnwWWWW29iGHcJCqMameiYvkWcJ/nSbimZqyNLjh6bQVJ2z7TQhqpM
   2IKHvOPryMnRS/afImYi99McqQLmKq9t6sJqP3LGhikQt29y/gMadG5RX
   w==;
X-CSE-ConnectionGUID: ZxXULZKCTwacTh6AsTmwiQ==
X-CSE-MsgGUID: LNcLtua1SMeKbhVT2VLPGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9949951"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9949951"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 20:50:02 -0700
X-CSE-ConnectionGUID: q4ttJj9gTP6cV1EuSSJKtA==
X-CSE-MsgGUID: ibjXuYY0QC6DiaVuLfWpCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55168596"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Apr 2024 20:50:00 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz7AL-0000Sg-28;
	Tue, 23 Apr 2024 03:49:57 +0000
Date: Tue, 23 Apr 2024 11:49:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [masahiroy-kbuild:kbuild 5/7] kernel/kallsyms.c:181:56: warning:
 array subscript is outside array bounds
Message-ID: <202404231102.r0G0StUJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   8246a1e9b922c0e797ec28d8a602de1384ff8140
commit: 0bdad28369fc5e93de39b5046228ed78e982fc71 [5/7] kallsyms: Avoid weak references for kallsyms symbols
config: i386-randconfig-001-20240423 (https://download.01.org/0day-ci/archive/20240423/202404231102.r0G0StUJ-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231102.r0G0StUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231102.r0G0StUJ-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c: In function 'get_symbol_pos':
>> kernel/kallsyms.c:181:56: warning: array subscript is outside array bounds [-Warray-bounds]
      return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
                                           ~~~~~~~~~~~~~~~~^~~~~


vim +181 kernel/kallsyms.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  173  
30f3bb09778de6 Zhen Lei       2022-11-15  174  unsigned long kallsyms_sym_address(int idx)
2213e9a66bb87d Ard Biesheuvel 2016-03-15  175  {
2213e9a66bb87d Ard Biesheuvel 2016-03-15  176  	if (!IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE))
2213e9a66bb87d Ard Biesheuvel 2016-03-15  177  		return kallsyms_addresses[idx];
2213e9a66bb87d Ard Biesheuvel 2016-03-15  178  
2213e9a66bb87d Ard Biesheuvel 2016-03-15  179  	/* values are unsigned offsets if --absolute-percpu is not in effect */
2213e9a66bb87d Ard Biesheuvel 2016-03-15  180  	if (!IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU))
2213e9a66bb87d Ard Biesheuvel 2016-03-15 @181  		return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
2213e9a66bb87d Ard Biesheuvel 2016-03-15  182  
2213e9a66bb87d Ard Biesheuvel 2016-03-15  183  	/* ...otherwise, positive offsets are absolute values */
2213e9a66bb87d Ard Biesheuvel 2016-03-15  184  	if (kallsyms_offsets[idx] >= 0)
2213e9a66bb87d Ard Biesheuvel 2016-03-15  185  		return kallsyms_offsets[idx];
2213e9a66bb87d Ard Biesheuvel 2016-03-15  186  
2213e9a66bb87d Ard Biesheuvel 2016-03-15  187  	/* ...and negative offsets are relative to kallsyms_relative_base - 1 */
2213e9a66bb87d Ard Biesheuvel 2016-03-15  188  	return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
2213e9a66bb87d Ard Biesheuvel 2016-03-15  189  }
2213e9a66bb87d Ard Biesheuvel 2016-03-15  190  

:::::: The code at line 181 was first introduced by commit
:::::: 2213e9a66bb87d8344a1256b4ef568220d9587fb kallsyms: add support for relative offsets in kallsyms address table

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

