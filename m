Return-Path: <linux-kbuild+bounces-8207-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF196B12C3C
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 22:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2000A177776
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 20:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95852143C61;
	Sat, 26 Jul 2025 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBTimyJT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7E01E5701;
	Sat, 26 Jul 2025 20:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753562366; cv=none; b=OWNx/WcgkQEDSy4fOjX7Sr5ed81QeG2DQRgZUlEncixFrIrJHMie4QPPcm7nEkYSooKDkz9jVAqT965okZKCSs1AbEKQ9JzoMQVmEei+4bHD+5/1XobZzDO4qY1h0wd5g0dNET3vYL5D6n0r9pa+CEGTibrXdwF8GUY3sjaiTpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753562366; c=relaxed/simple;
	bh=ACa4Q4L93Qc5PpnKOItLTHQAxADoXnbi55ttk8gIe8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDWGqZC3Yu3PAqupjAhoXzV6n1W6VnEyy1yms+4Hz8w7zUXFWgpg9i0zDKRpEBNr9m/WLfPDRvKbVc2JfdyVYDGsqjzIzNZt0KVrkcbeogUWapTKmN+v/FjH1WLhZEXYRWB0v1xyyWyAnfFBy3CWS6O3ypexA+6JrwnV/C9hviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBTimyJT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753562364; x=1785098364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ACa4Q4L93Qc5PpnKOItLTHQAxADoXnbi55ttk8gIe8Y=;
  b=dBTimyJToOyOgQ5uNN75keI+aZsA+2oTUtvZVa3XR6u+1cG+1OM7Vp0M
   0zAfX27AIFD5UFJNx2Egm5Khph6o2p67IBwqd45bqwHltaWGaNKiKlKGG
   ztzVBdcrGhC/JwPkjeVqJsJ4ObdOfIyFzKNhR+tHe9B8LD361F+qTfOIS
   LglN4pdPRN+i5wQeIHsEuYrF96WZMtOygOW51j16wRcWjD4COhwbmImMZ
   jevJ5U8hpAlTfHiti8VRAXW2kW2YC/KMQzOM8Qu4i0Z72Jn2F90u3ObqR
   h1mCWFYBwMGdGZAKfXJUGL7pqZvTxA2YVg3PihSHBpyYM76SVHC5WD7JY
   Q==;
X-CSE-ConnectionGUID: 1sn03VsFRaKRgRZnT3BVRA==
X-CSE-MsgGUID: raRSXYnNQLOoXjENF5pN5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="56013148"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="56013148"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 13:39:24 -0700
X-CSE-ConnectionGUID: f9sQQltCSz+dYs/H/yTXaw==
X-CSE-MsgGUID: TmrF0ZqsTzm2R1eWpDK5sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="165869149"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Jul 2025 13:39:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uflfr-000MGR-2h;
	Sat, 26 Jul 2025 20:39:19 +0000
Date: Sun, 27 Jul 2025 04:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>, masahiroy@kernel.org,
	nicolas.schier@linux.dev, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: Re: [PATCH] kconfig: replace strcpy() with strlcpy() in symbol.c
Message-ID: <202507270411.j9vfofzH-lkp@intel.com>
References: <20250726191515.171012-1-suchitkarunakaran@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250726191515.171012-1-suchitkarunakaran@gmail.com>

Hi Suchit,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/kbuild]
[also build test ERROR on linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suchit-Karunakaran/kconfig-replace-strcpy-with-strlcpy-in-symbol-c/20250727-031729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
patch link:    https://lore.kernel.org/r/20250726191515.171012-1-suchitkarunakaran%40gmail.com
patch subject: [PATCH] kconfig: replace strcpy() with strlcpy() in symbol.c
config: arc-randconfig-002-20250727 (attached as .config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507270411.j9vfofzH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507270411.j9vfofzH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   /usr/bin/ld: scripts/kconfig/symbol.o: in function `sym_set_string_value':
>> symbol.c:(.text+0x14cb): undefined reference to `strlcpy'
   collect2: error: ld returned 1 exit status
   make[3]: *** [scripts/Makefile.host:123: scripts/kconfig/conf] Error 1 shuffle=618416945
   make[3]: Target 'oldconfig' not remade because of errors.
   make[2]: *** [Makefile:735: oldconfig] Error 2 shuffle=618416945
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=618416945
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=618416945
   make: Target 'oldconfig' not remade because of errors.
--
   scripts/kconfig/symbol.c: In function 'sym_set_string_value':
>> scripts/kconfig/symbol.c:780:9: warning: implicit declaration of function 'strlcpy'; did you mean 'strncpy'? [-Wimplicit-function-declaration]
     780 |         strlcpy(val, newval, size);
         |         ^~~~~~~
         |         strncpy
   /usr/bin/ld: scripts/kconfig/symbol.o: in function `sym_set_string_value':
>> symbol.c:(.text+0x14cb): undefined reference to `strlcpy'
   collect2: error: ld returned 1 exit status
   make[3]: *** [scripts/Makefile.host:123: scripts/kconfig/conf] Error 1 shuffle=618416945
   make[3]: Target 'olddefconfig' not remade because of errors.
   make[2]: *** [Makefile:735: olddefconfig] Error 2 shuffle=618416945
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=618416945
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=618416945
   make: Target 'olddefconfig' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

