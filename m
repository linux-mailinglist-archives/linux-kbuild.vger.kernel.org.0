Return-Path: <linux-kbuild+bounces-6189-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CBAA634FB
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 11:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD8DD3AD44C
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Mar 2025 10:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5DF19CD13;
	Sun, 16 Mar 2025 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lwf5wtP2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A551819CC0E
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Mar 2025 10:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742120402; cv=none; b=qVna1s+3cfkALNp3d+iiykqCJKevfnDsUvlW7FqmBZrOGMOaUHKlSYh2Z8NbqtEsl4Bqw8Y0p6zxRpONNWVay/G/aIFdw9VYTNkAuaOpVOL0ldRnNBfQpscwAzSY1f8ali7yXFd/RktYUQ10jCWTGiM78JqBJDXm9xpqwQ+t4Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742120402; c=relaxed/simple;
	bh=Xdmg43ISeY/zhPp/oieiyUtJBWbxcat9k15Qqw0k/7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dtRvJrn8rvEqsLu9ZsLl+E9BPlEYNZuFgcKxI2sNRXwkgh/HPT1q23lNR82Z1swOSZ8qdU+eOGGHgXN4yHIlcJeO++Bnt9gdawpR1sdo+SVtjKyQ2hlwijYBl7xwkVLbfoTxc5e/DaxGN0aeraNOEhNBC8sLBTrhBRkGHrtWCpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lwf5wtP2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742120401; x=1773656401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xdmg43ISeY/zhPp/oieiyUtJBWbxcat9k15Qqw0k/7o=;
  b=Lwf5wtP2nV81gtl/CoHKErSLVoiI9gwHScVbHgnLiDi8xr9lsBTo1GuV
   ucC+jEsI5c9B2QnNRcbu6vXyxUuuc8hy67i7vyz7iVsM6Thsk4V5Rthud
   5W4bzvqN/COas6Pk9ca00zMaHCn2eEdmS+6936w5a2/7sJoRbZbBZGm1k
   HOIxDInPNyMjV3X2XsL1YMVnQE7uakPojs/IZskKxLueKs2R5K8GT6gV1
   Trxz/cLA2PQfA3w7+za6KP6HI/+P/3gLNVb751A24L341ZvOEbeui/LtJ
   Q4v/OXKz3ssXSTMOcmRFfwipPS+Sw940X5fYZJsZ4n4gr8cKcCPZ+ypJY
   Q==;
X-CSE-ConnectionGUID: 1/myv+2YRdq52l1UOzu7cA==
X-CSE-MsgGUID: C+0Y4yXYSO+oU0fo+YcFwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="43134825"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="43134825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 03:20:00 -0700
X-CSE-ConnectionGUID: q5Qql8e8Q82NFOSVi/rbhQ==
X-CSE-MsgGUID: bz5MseJRTa6WvPlKZYrIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="126326026"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Mar 2025 03:19:58 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttl64-000Bwl-1i;
	Sun, 16 Mar 2025 10:19:56 +0000
Date: Sun, 16 Mar 2025 18:19:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [masahiroy-kbuild:kbuild 25/35] FAILED cannot open vmlinux: No such
 file or directory
Message-ID: <202503161833.ytx1ivfu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   e3de46f775ec29a17f671523798c28222a4ce818
commit: cac289e2b2b0909b52c0a694c4469a9ad9f03764 [25/35] kbuild: Create intermediate vmlinux build with relocations preserved
config: i386-buildonly-randconfig-001-20250316 (https://download.01.org/0day-ci/archive/20250316/202503161833.ytx1ivfu-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503161833.ytx1ivfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503161833.ytx1ivfu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> FAILED cannot open vmlinux: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

