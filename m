Return-Path: <linux-kbuild+bounces-6671-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA38A915F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Apr 2025 10:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED5F319E0780
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Apr 2025 08:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBCA22A4FA;
	Thu, 17 Apr 2025 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQ82/fUK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53C226CF0;
	Thu, 17 Apr 2025 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876778; cv=none; b=Jaa64iCPVYKFUhx5pjqmhB/B64sJcn8Zu6vzxgyAipErcWLCYBQTWHLL9q0QD8NQLQMENuWkABFaQsh1Jub/B8hNFrvqt7qGLDTFG44vsR4IdQyQaI/ErNow0iMJ1nW1hDBfpvuLbk3XURyiyeJid+XsCLdIM0rPbzBlUgScYQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876778; c=relaxed/simple;
	bh=xNxT5Re1oftjzyxR5Ank9LUV80Pp7dElP2hd70zAJT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0vv8Ds5QKXGi8ccETqh6+iKHbzvTra2jVbVCEudyoyD5LGScz/4t0hCnnHXn4pyAkcqgUzEgBDB1kbgyLwlPrjq2TquQeX7FdVtnTbipcoxQilnORodHp2plNtQnOvCmeJ+xNtZRFl1oNYoYXoXH+TDkBugWFBm2QY/xN7Tmbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQ82/fUK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744876776; x=1776412776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xNxT5Re1oftjzyxR5Ank9LUV80Pp7dElP2hd70zAJT8=;
  b=TQ82/fUKuwUT4pertC8O+jnp1kzIgKa5/PAM/QExOfl+mOVBb3QcXEtA
   8yF9FAMyZNU2EsIv1Wf3ABu0zv0cxn+jaBons77PGuncYRgbcSlEMbWSz
   FQswj9VJ+g3J3OXHWCbEZ3iYDBY8emCIjMMiVpBu4gu4vkFDIWh/qvox9
   LS5VmMcGW8Rt/+KgCQQ81yQF5MY5U92VS1bEjrOP+6TJWc0zyG3cEaQsJ
   XxiJoYJP06Q6HPna+P5lrf1rh98ZhpWT8+XyIErnAipkv+8CSTTjvoxs1
   8VexPY+talRGOeIjQmdaObF4Z0kHcRQth3nHwr3SizCCSudbcFMNvJf4A
   w==;
X-CSE-ConnectionGUID: wAVowEOaR+CghCy1O4bAzQ==
X-CSE-MsgGUID: 4wT+pqRxRYCHK4KHYArr5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68944176"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="68944176"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:59:35 -0700
X-CSE-ConnectionGUID: 8VKL1ubsSFSs14j6RVHMcw==
X-CSE-MsgGUID: mYT5ZLBjQ8iTNwGWZY/5mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="134825813"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Apr 2025 00:59:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5K9f-000LsM-0P;
	Thu, 17 Apr 2025 07:59:27 +0000
Date: Thu, 17 Apr 2025 15:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <202504171512.FiYw2rGC-lkp@intel.com>
References: <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>

Hi Mauro,

kernel test robot noticed the following build errors:

[auto build test ERROR on lwn/docs-next]
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.15-rc2 next-20250416]
[cannot apply to masahiroy-kbuild/for-next masahiroy-kbuild/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-py-don-t-create-pyc-files/20250416-155336
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
config: csky-randconfig-001-20250417 (https://download.01.org/0day-ci/archive/20250417/202504171512.FiYw2rGC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250417/202504171512.FiYw2rGC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504171512.FiYw2rGC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: -none: not found
   make[3]: *** [scripts/Makefile.build:203: scripts/mod/empty.o] Error 127 shuffle=2754938148
   make[3]: *** Deleting file 'scripts/mod/empty.o'
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1276: prepare0] Error 2 shuffle=2754938148
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2754938148
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2754938148
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

