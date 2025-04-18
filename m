Return-Path: <linux-kbuild+bounces-6696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358BA93C9D
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Apr 2025 20:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 219AD462713
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Apr 2025 18:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C857222568;
	Fri, 18 Apr 2025 18:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYTxo33H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890C4221F0A;
	Fri, 18 Apr 2025 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999985; cv=none; b=iKeOcFBHyZeK+mzVHA5YH8bLHwEGK59tEIzUZ08fb3fXo1yFSlzXCrGAubt/qd1SOxmiJfabiSDmEnSXGEF6hHLJv9b930lajc+5sdTxeM6H2per8Q2Pg7DcEcCn8lpFzJlSjCnWE2tBWSgbwyTYUXmc3jjwhfx0q/Lr0w78UJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999985; c=relaxed/simple;
	bh=QmVNNm0yCXUzgegJjSuzQSEat+pAuOJqxBaJs9whs1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kqxpGPprLQEPzjTjoyKGXWfQT4aHIupm1SofLGcC1RlfNDK8P77yqEkTv99XBlUPBgc8nEUvCt6rOcCDR7RGICRCnn799JGbr75uYKEocp373Mt/qKqG+xkNVy5Prqcy6L7NRTU541Pnlz/xneXY4tTNT0fpslsI4M4rxVXL068=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYTxo33H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744999983; x=1776535983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QmVNNm0yCXUzgegJjSuzQSEat+pAuOJqxBaJs9whs1k=;
  b=MYTxo33Hg1Ga+9TeehhmnYx/FQl2pl69VGxcyQordyuCMnwfePlRzkm8
   N6yjPy+DJssbXVvGr8PfsWUP9xg2bK7p9WgRtxK8j/wg4KDtEFm7OHo6Z
   lwLj/W5c2AA4z4Ncn+o+sF4jpYlm+ioya7QBswrR7ldokXYMIyqNaWkph
   dYCGrjoKDgDfBgEIv5XSXWUhx+y3hll4iJHsYO05LhmQsmsoI02KX0WBA
   Gjjm3Y3jXiob7F/g8A9hUZrXaJQnOa+h8J/iZR3ON9Gq0WFwFKNRgEaMe
   k/yJdPeDjRo++rFWdwXH2t/z+peTRcW009pnXZMQ2+dPTe/W5QEivI5Cf
   A==;
X-CSE-ConnectionGUID: 9OwJ7KAqT5i1mHnUEQzheA==
X-CSE-MsgGUID: 6vYWZYubT6e1nC0P/+Ep+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57296072"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="57296072"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 11:13:02 -0700
X-CSE-ConnectionGUID: /IqsmET/QzyMnsLY4JUGdg==
X-CSE-MsgGUID: i6LVBPnvQBGrpL7TnOsFdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="131041341"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Apr 2025 11:12:57 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5qCt-0003Ax-12;
	Fri, 18 Apr 2025 18:12:55 +0000
Date: Sat, 19 Apr 2025 02:12:44 +0800
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
Message-ID: <202504190154.lSj16P1a-lkp@intel.com>
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
[also build test ERROR on drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master v6.15-rc2 next-20250417]
[cannot apply to masahiroy-kbuild/for-next masahiroy-kbuild/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mauro-Carvalho-Chehab/scripts-kernel-doc-py-don-t-create-pyc-files/20250416-155336
base:   git://git.lwn.net/linux.git docs-next
patch link:    https://lore.kernel.org/r/4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab%2Bhuawei%40kernel.org
patch subject: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250419/202504190154.lSj16P1a-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190154.lSj16P1a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190154.lSj16P1a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: -none: command not found

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

