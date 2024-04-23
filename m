Return-Path: <linux-kbuild+bounces-1661-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA28ADC0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 04:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE38A284AE8
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 02:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6693FF4;
	Tue, 23 Apr 2024 02:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kT9qrc0a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F8C1AAD3
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Apr 2024 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713840837; cv=none; b=S+4ZuPZfk6V4ZOHefA0NfIRuzuLAHdY+A09BCSIPxJVhoBTZACbJqnT9LZg8aWlbKuw2THtoEiiXR15pupmTMfG9N0prRUzpTl/+vntKYCnbrLsndDVxYvy+sKxfrjkoMN+4PEIqidFYx8LfDGG8B84l4JfuyhBIM1kMib8u2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713840837; c=relaxed/simple;
	bh=mq+A6Yb8sVplRvxuERQ/KltlHUkttb3OfeiFlmJGv7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mbz9UCapjcKoszk4F2WPoHE881HbqDMRlZGJjrtstConcWtdEc7TAjjQ+2Mlp6w3alvn16k1E30eJ4rdZz60pDnaIkh1q1iYlTGbjrAVL9mr5g8oYncLD6lTNzQm7MzgcM9/w1oznnU5lHcHNxl0tFcWquZZsXrLuCnA/lHh/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kT9qrc0a; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713840835; x=1745376835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mq+A6Yb8sVplRvxuERQ/KltlHUkttb3OfeiFlmJGv7A=;
  b=kT9qrc0as7jw2xMgl8ociQ4iJT9WCPIaHYap2mOGATlN/CjTAJPGqX9A
   B22dNXHj+anffPrALPltsugbyePuAobUEPhDfVcUgqQStC60v4LkHVoid
   l4JDOp+deycsPKoCKjQ8HOh1VpRLcg7JD5Tr6zpuWCXCAcrPR5qPZqR7g
   8ZEpFKV2JnF0iLwyYZ7QtQwsxE/pY80MtFIMKaQ+a3C5mi3/LqBMT6dI6
   nHjU3i0N397DcjL0CoNUAMd6cNL5GS6p6gef6TX2jCx+CY9TniDGDA+sl
   BdeFDfMaDlM8j5JfvODCDmKEakV8+nm6Ey0SaQXNLAVPGzI1HicmQjdTc
   A==;
X-CSE-ConnectionGUID: mU3yCEiHQF+xvSTex1B5jg==
X-CSE-MsgGUID: PMO1UwdJTIKR1vjwVOxUgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13240961"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="13240961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 19:53:55 -0700
X-CSE-ConnectionGUID: b9j/fc8pRfCyHFq1Iz+bsw==
X-CSE-MsgGUID: dysfd3nnRG+6EJyymRAdSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="61669787"
Received: from lkp-server01.sh.intel.com (HELO 01437695816f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2024 19:53:53 -0700
Received: from kbuild by 01437695816f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rz6I2-0000QW-0m;
	Tue, 23 Apr 2024 02:53:50 +0000
Date: Tue, 23 Apr 2024 10:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [masahiroy-kbuild:kbuild 5/7] kernel/kallsyms.c:181:56: warning:
 array subscript [0, 0] is outside array bounds of 'const int[1]'
Message-ID: <202404231047.eZ27wCnE-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20240423 (https://download.01.org/0day-ci/archive/20240423/202404231047.eZ27wCnE-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240423/202404231047.eZ27wCnE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404231047.eZ27wCnE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kallsyms.c: In function 'get_symbol_pos':
>> kernel/kallsyms.c:181:56: warning: array subscript [0, 0] is outside array bounds of 'const int[1]' [-Warray-bounds]
     181 |   return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
         |                                        ~~~~~~~~~~~~~~~~^~~~~
   kernel/kallsyms.c:48:18: note: while referencing 'kallsyms_offsets'
      48 | const int __weak kallsyms_offsets[1];
         |                  ^~~~~~~~~~~~~~~~


vim +181 kernel/kallsyms.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  173  
30f3bb09778de64 Zhen Lei       2022-11-15  174  unsigned long kallsyms_sym_address(int idx)
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  175  {
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  176  	if (!IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE))
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  177  		return kallsyms_addresses[idx];
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  178  
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  179  	/* values are unsigned offsets if --absolute-percpu is not in effect */
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  180  	if (!IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU))
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15 @181  		return kallsyms_relative_base + (u32)kallsyms_offsets[idx];
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  182  
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  183  	/* ...otherwise, positive offsets are absolute values */
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  184  	if (kallsyms_offsets[idx] >= 0)
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  185  		return kallsyms_offsets[idx];
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  186  
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  187  	/* ...and negative offsets are relative to kallsyms_relative_base - 1 */
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  188  	return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  189  }
2213e9a66bb87d8 Ard Biesheuvel 2016-03-15  190  

:::::: The code at line 181 was first introduced by commit
:::::: 2213e9a66bb87d8344a1256b4ef568220d9587fb kallsyms: add support for relative offsets in kallsyms address table

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

