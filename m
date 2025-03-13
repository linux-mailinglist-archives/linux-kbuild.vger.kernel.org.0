Return-Path: <linux-kbuild+bounces-6115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C0A5EF71
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 10:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D82B1680DF
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 09:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FF3206F3D;
	Thu, 13 Mar 2025 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQGBB+6w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988881FA14E;
	Thu, 13 Mar 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741857702; cv=none; b=upoJOjoCBzbm8oR57lHQ4zYCi2IczNZbYJD2AofQVwL1qmqVYdK0qh8UmybPdRhu5tmw5JsHdKk8yWtcq9hh0MMu/waeaDoPXD3D0+21Cj/LhwSbmh+37AoBVz5vKNTLLJuhivBzCcCskW7T/I65xO4UdfgCxV9VgOD3X85ZCL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741857702; c=relaxed/simple;
	bh=hCJZTlrjR72fQw95LntGtZB0qmUyY1a+nfigglPfBWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqOHHHL+YczgOp3Fta5ZtYKEEmioZUfp7tMWEjdfYKifk0pX0RxMJKjEdSi/gbQQaa0PzZ/HGMk5Szek+fMlPUmGqABoB753i3DzeVhTCEZofV16MngRq7XDDp2eBwaJHmKkDBuHBcOlnNR91v4HCkrIfN4u8p71eRC8f9sCCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQGBB+6w; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741857701; x=1773393701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hCJZTlrjR72fQw95LntGtZB0qmUyY1a+nfigglPfBWA=;
  b=nQGBB+6wCqjOtKCOuwJzQ0LBjctVse9Lj5xn6oh5rMGHHjkjKuyTw5bi
   pYtQdU38JKtYzWJvBf+YD1tKwnCsuBfwfV7lgXaDywFCTkXLzRo8snUFM
   gDjTQvBPNQZONDrHE4hareQGtT+R8vQ8NhxkkaDfz7l8e2cKiBn69ZY94
   ntTDYMOHD7bZUlmSoiXF1OiY4UuKcx9Lw76yFrLZu4xDk5GHq47P7XIDM
   79WOn79ZDgET2avCHJP0EcBxs3OwzTC+W35IOAF+GVWGAWmetS6d2j0Hz
   eYcg1gc847vaHD9UuWDNBmTIp82M91QNq+sLLL2Z/4lNM6LZlTeLa19OP
   g==;
X-CSE-ConnectionGUID: t+WARYvdTZulktqmqOnAHA==
X-CSE-MsgGUID: Yb7XKHQUTwy6jOIB3iverw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60364255"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="60364255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:21:40 -0700
X-CSE-ConnectionGUID: 8TakgNW9SYepuCpnh98+ew==
X-CSE-MsgGUID: gulqS8XZQ626iRofm+J3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125772051"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 13 Mar 2025 02:21:38 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsekx-0009HE-2N;
	Thu, 13 Mar 2025 09:21:35 +0000
Date: Thu, 13 Mar 2025 17:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kbuild@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
Message-ID: <202503131715.Fb6CfjhT-lkp@intel.com>
References: <20250311110616.148682-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311110616.148682-9-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes tip/x86/core s390/features linus/master v6.14-rc6 next-20250312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/Kbuild-link-vmlinux-sh-Make-output-file-name-configurable/20250311-190926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250311110616.148682-9-ardb%2Bgit%40google.com
patch subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with relocations preserved
config: x86_64-randconfig-076-20250313 (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503131715.Fb6CfjhT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503131715.Fb6CfjhT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> gawk: scripts/generate_builtin_ranges.awk:82: fatal: cannot open file `vmlinux.map' for reading: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

