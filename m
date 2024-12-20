Return-Path: <linux-kbuild+bounces-5217-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D59799F8DD9
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 09:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F4CC168965
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 08:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF9F1A0BD7;
	Fri, 20 Dec 2024 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz6jQMsE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531719995B;
	Fri, 20 Dec 2024 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734682862; cv=none; b=DfhOUYX4Jjd3PBKz6o4tdhK1PvfDmkpaSM5SrP+NmLSS6/zmuKlee0CX7MPdyQMe8cQmkGzjJn6zkkAjYqbAqioBqDsluONwgmId78M3uagsG8fUlznQM7veMKUPYwHXt9Mya28Q5t+AIyhWY5M1kKQS2Zatzv+GyekKK/7qAW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734682862; c=relaxed/simple;
	bh=7QB9U52qCfo8wJbE0m45A2xve0YqZ1ZALCoixFcC4Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+lHcODSh9kPplvvxTwHQ8URrb7K2ntAeF9/BlTxeT3zP7SU0ExojIC/+ESJRzfFCuUT21nly5xR5zVpoggzg2BbjC7mFbDCGL+Ihfxr7xwtQOxuo4dm9bSGayCuZGXncM2vl5yxlyTntyqy8fgyCoRADpF58jKESsQArHfjEu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz6jQMsE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734682859; x=1766218859;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7QB9U52qCfo8wJbE0m45A2xve0YqZ1ZALCoixFcC4Qc=;
  b=Cz6jQMsEYJFtPiAaBDpfyXjz8JARGZVceArSIeJwb8A6UIhg0rOMX/5V
   c7attwnpdDSroWO/hEJm+l13nkzjgOiyi2BVIsoXzpopdNStPgn8PzjHr
   mGFSVxtXm/4kzAQ28gK201A2RWj8wdO7qAMERGYulAhRIvPj64DXE7Law
   H55mYOpissTlbWzjca/8Gpir62/jZXD8TIF6LDTA9GkA5phz2MsMrrVSp
   JNjQAGXsyttHMjLwFqGseP3FcBnGJlyHjeYKUdxQGgD7zcfIAcLo6PnHK
   4Ilix2btMarxRxJSMvLQnOsH5aoBS90r3WIXi8Z6yqNaC8No+eV4crlOG
   Q==;
X-CSE-ConnectionGUID: oMsPqpzlQruU6GZl6T9SfA==
X-CSE-MsgGUID: T4rnMN4EQ5K0Ul4w5dheoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="46234371"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="46234371"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 00:20:59 -0800
X-CSE-ConnectionGUID: +wZfxHiFRr6zpjrADKw71Q==
X-CSE-MsgGUID: 3b9UCKNXRIK6GzqzmeFTSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98516727"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Dec 2024 00:20:57 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOYFi-0000y3-1H;
	Fri, 20 Dec 2024 08:20:54 +0000
Date: Fri, 20 Dec 2024 16:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] kbuild: Drop architecture argument from headers_check.pl
Message-ID: <202412201643.PR8VVmEL-lkp@intel.com>
References: <168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert+renesas@glider.be>

Hi Geert,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on linus/master v6.13-rc3]
[cannot apply to next-20241219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/kbuild-Drop-architecture-argument-from-headers_check-pl/20241210-165347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/168b2cb09f09ec3cead8a6b1e726ac76f5d06171.1733820553.git.geert%2Brenesas%40glider.be
patch subject: [PATCH] kbuild: Drop architecture argument from headers_check.pl
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201643.PR8VVmEL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201643.PR8VVmEL-lkp@intel.com/

All errors (new ones prefixed by >>):

   make[1]: Circular tools/testing/selftests/alsa/global-timer <- tools/testing/selftests/alsa/global-timer dependency dropped.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
>> Makefile:47: *** Cannot find a vmlinux for VMLINUX_BTF at any of "  ../../../../vmlinux /sys/kernel/btf/vmlinux /boot/vmlinux-5.9.0-2-amd64".  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +47 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  46  
3812b8c5c5d527 Masahiro Yamada 2019-02-22 @47  # Do not use make's built-in rules and variables
3812b8c5c5d527 Masahiro Yamada 2019-02-22  48  # (this increases performance and avoids hard-to-debug behaviour)
3812b8c5c5d527 Masahiro Yamada 2019-02-22  49  MAKEFLAGS += -rR
3812b8c5c5d527 Masahiro Yamada 2019-02-22  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

