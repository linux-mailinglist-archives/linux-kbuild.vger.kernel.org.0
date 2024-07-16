Return-Path: <linux-kbuild+bounces-2557-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FC932F66
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 19:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B35D282C5E
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2024 17:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDE11A00E6;
	Tue, 16 Jul 2024 17:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2WiZAo5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230DA1A00E3;
	Tue, 16 Jul 2024 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721152274; cv=none; b=FTixgBuTrIrYikFv6SBWOBPxL/Xql5gUYC8tgA86czVoCyr3ZnK4zfBbw/OEMWCtW2vJM93H7gA1O+TY9GC0/esl0fD4pA5DHROfTqqc861WZcl30utEwimsgiWkXFBuKoTL1LPtnR/yLfCiJ1nZ3pFxMWDa35qO5JKUmu+Ghgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721152274; c=relaxed/simple;
	bh=vVztFECHj5A5lDM1edvCHwH4SGqeskbjWvte3GbWgm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYsOfR9lBfwZnDuvxeRi9iRhTdjEOjWV3ETEtUwnHXOG84H2trJNBQSdF3jXavY/A9N8i1dDejc1IcMze/U6sJAoNwyFn+LPjuOVJyfSEBnnfQGNBKJ0nCEaGUuLIX34izqKF0iQoQjtDNB4qYli9/32J15f1000IpHWU1pvpAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2WiZAo5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721152273; x=1752688273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vVztFECHj5A5lDM1edvCHwH4SGqeskbjWvte3GbWgm4=;
  b=k2WiZAo5onKtWcS7rrs4IxYHYyjSRXb2S1QPBK5zkebr87Y20LX3Xowz
   BJgzJmfclpDMIzAedrCXBetRtnD9J5aXghfCQkFDQ43ORkoAzM94KMYX7
   9cYGogwx6ca1tWAbQa8AVDXY6G5PKT+tS7tpuldHUShCh5Jsuxh7Tje99
   XExjOXztlU/gEJYXJutGn5cuHN6sHh2UH463IoGAxOtk2sqHIMAnyAlmU
   +fyhAlc3ElVyjSd7cRjkZxOAwl+1L8x3YruE1LZGeTZE0kyhta6pBw8oh
   y44lRdp4cVQj0hM2TU+qkPrGuZ9kuC8Af+14HrA4hXuCeZSjVrrU92cEB
   Q==;
X-CSE-ConnectionGUID: C/xMyRqgScmzLWO05DHDhg==
X-CSE-MsgGUID: a5pu0/gPT3aoqWBLY82Ymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="22475938"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="22475938"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 10:51:12 -0700
X-CSE-ConnectionGUID: TvOZy+QYTjKtTS+txJxKYw==
X-CSE-MsgGUID: QnmizcwqSTa1q5PEJuOYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; 
   d="scan'208";a="55250475"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Jul 2024 10:51:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTmKS-000fUy-20;
	Tue, 16 Jul 2024 17:51:08 +0000
Date: Wed, 17 Jul 2024 01:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 1/3] fortify: use if_changed_dep to record header
 dependency in *.cmd files
Message-ID: <202407170104.dCe5MKsA-lkp@intel.com>
References: <20240715144529.101634-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715144529.101634-2-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10 next-20240716]
[cannot apply to akpm-mm/mm-nonmm-unstable kees/for-next/hardening kees/for-next/pstore kees/for-next/kspp]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/fortify-use-if_changed_dep-to-record-header-dependency-in-cmd-files/20240715-224820
base:   linus/master
patch link:    https://lore.kernel.org/r/20240715144529.101634-2-masahiroy%40kernel.org
patch subject: [PATCH 1/3] fortify: use if_changed_dep to record header dependency in *.cmd files
config: i386-randconfig-004-20240716 (https://download.01.org/0day-ci/archive/20240717/202407170104.dCe5MKsA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407170104.dCe5MKsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407170104.dCe5MKsA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fixdep: error opening file: lib/test_fortify/.write_overflow-memcpy.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.read_overflow2-memcmp.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.read_overflow-memchr.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.write_overflow-strcpy-lit.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.read_overflow2-memmove.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.write_overflow-strncpy-src.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.read_overflow-memcmp.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.read_overflow-memscan.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.write_overflow-strcpy.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.write_overflow-memmove.log.d: No such file or directory
--
>> fixdep: error opening file: lib/test_fortify/.write_overflow-memset.log.d: No such file or directory
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

