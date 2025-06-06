Return-Path: <linux-kbuild+bounces-7384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67917AD029B
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 14:53:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2ECA3A80C5
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 12:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3AC288514;
	Fri,  6 Jun 2025 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WluuDH+C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286F3287515;
	Fri,  6 Jun 2025 12:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214430; cv=none; b=laDGaDuYsWjci79M60WzZoc70JR5uXVK8QG1ZWHLfCHrkgu1VEbODp8Qr4J4/deImTfErvXcH8Gk9LT882OVaD7f3l8dvXkwzN0b2KNdzeX4e0yl0mmKrHIkZtJ3vouWQVjet3KsE2GmomV6+w1GiQ+UiV6mjZXty37AsMTyRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214430; c=relaxed/simple;
	bh=n1wykN0q4zEYvLq7DTQo3g0PyzEzM3Sutii1zJAfHIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8VWm8LNnjhnl8W6gORhpCPSEu7orXQwmJO8WP+4C1FkZy9Sh3HJ5y/CVZVv+d08Y1dDtsmYxNRds5nv9w7EKqmsd1p2wPSUoYQRdSewxS6beL1YlYaFZ8+Al2ROUQa6FKHMUvMJSXlP6qWjzoFsU9pN0MR0SWV/nqDdTRl4+jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WluuDH+C; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749214429; x=1780750429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n1wykN0q4zEYvLq7DTQo3g0PyzEzM3Sutii1zJAfHIY=;
  b=WluuDH+CPB477xP4ido3tnucJrMFa3GY47k/qn+O5i2UlMJdpo5IvcVw
   C6cric8SLZgRPXjJVj/n1jhPRE0+mo7yrU50REj/sar4QpSgROzgaUbQx
   KbsHUmQURLiPUdkBuf7cZ6fObrdmcFpP//DM/HG3PqwFzwCvdchtypYFC
   Dj+m33JbfQFkNzE5tFtxOIsJgX0id6V43a3yawSHpBcpYjqGbKEfL64Tl
   enwqHyLtHS+Khn8amTuvMklq6UzSGUQeC42IAYYM7Vj+5l+llnH0e7QdJ
   P6f1CBUEPaYmkU49y8yqi2vAJEU8wEW1Fkb0nDBlRAQJaRTuINTrLCOfR
   A==;
X-CSE-ConnectionGUID: 8z9dY4TaR2iV8SLF2aMU/Q==
X-CSE-MsgGUID: 6e8OgLxAToeMKTvy/YGOPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62409313"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="62409313"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 05:53:49 -0700
X-CSE-ConnectionGUID: PBzPIMJlR4+S61gzOioHKA==
X-CSE-MsgGUID: yWnVIu1CTEK2prYn7GVKXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="176771560"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jun 2025 05:53:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNWZr-0004zB-32;
	Fri, 06 Jun 2025 12:53:43 +0000
Date: Fri, 6 Jun 2025 20:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 3/4] kbuild: keep .modinfo section in vmlinux.unstripped
Message-ID: <202506062053.zbkFBEnJ-lkp@intel.com>
References: <20250606041029.614348-4-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606041029.614348-4-masahiroy@kernel.org>

Hi Masahiro,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes linus/master v6.15 next-20250606]
[cannot apply to herbert-cryptodev-2.6/master herbert-crypto-2.6/master arnd-asm-generic/master mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/module-remove-meaningless-name-parameter-from-__MODULE_INFO/20250606-121255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250606041029.614348-4-masahiroy%40kernel.org
patch subject: [PATCH 3/4] kbuild: keep .modinfo section in vmlinux.unstripped
config: s390-randconfig-002-20250606 (https://download.01.org/0day-ci/archive/20250606/202506062053.zbkFBEnJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506062053.zbkFBEnJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506062053.zbkFBEnJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> s390x-linux-ld: .tmp_vmlinux1: warning: allocated section `.modinfo' not in segment
>> s390x-linux-ld: .tmp_vmlinux2: warning: allocated section `.modinfo' not in segment
>> s390x-linux-ld: vmlinux.unstripped: warning: allocated section `.modinfo' not in segment

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

