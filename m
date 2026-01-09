Return-Path: <linux-kbuild+bounces-10448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 81135D06D86
	for <lists+linux-kbuild@lfdr.de>; Fri, 09 Jan 2026 03:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 794D23019BD2
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jan 2026 02:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46CE3033C6;
	Fri,  9 Jan 2026 02:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iqgIqHzW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF5730DD2F;
	Fri,  9 Jan 2026 02:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767925312; cv=none; b=pbN7Qg3rrAfhtIi4lmtCDzN1Z7CeW8TGxMCLIl7IMLlxvaX/+q9j40NbJ3DH09CJwy25OyhiE3jhrz1JD+4xfYkAzykyg4f5A5PPkixBnyJnAuQbKWHCWx+8IY5NjFJSSUsLtDqgqTwWTxQCcWfrVZlRYJJ2Ib7PZwI2izYnZ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767925312; c=relaxed/simple;
	bh=zcH313QWQ24pL1QlL9W4cZPOigVmIDErCdOJ5bFttJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVGY6khhfKgg91VKCNKWP7xT0uIAFWdxaYYX7gJw1sBSt/zvV1Y3Nf8nYy2ATp9cJQeXYNR5DFjtULxUwLkNTm+vYnn6Sv9ZBBvEwZaTdP1TKD62tOlDtm2Dm39qN0teAn/2sIb5gw1EbS8mjjHKLmeOXDP5/vjSUNR+ZjcK3NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iqgIqHzW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767925301; x=1799461301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zcH313QWQ24pL1QlL9W4cZPOigVmIDErCdOJ5bFttJs=;
  b=iqgIqHzWRP+RjGXrw3gaZiYQcmzZcJnam5gG5Y3r3m7gTwuJzJEAIQNY
   AoYpoRDlH/oW9JYwAWsDGbXzA6Wo20yBUh33PIZI1LEONPUek+TEBEArY
   i2wiR4acSFl09xvOrlLbkkYY/3EF/WGNTQuQH/D06R4n+DY4JrrkuMrE3
   vmIgsJ0f0tca3jyndSllL3Xq+BvJ4tfFejNULWogKEbUXFucDP23ROmht
   C3dvfaycdB7U2i9Lz84C6bVrJy7EqsGrbLLlfblM5xqFbd/gBcIYcYVW4
   Pj2WwSMwfgLs+VZ+gGCinfJaxJBbpNdXEMC+N+9mAehHnMscTfGaKilNY
   w==;
X-CSE-ConnectionGUID: a9ijKPXCRkShv3ts9Q1KqA==
X-CSE-MsgGUID: jdXhonyKSgun+4JkMlZmwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68312855"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="68312855"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 18:21:40 -0800
X-CSE-ConnectionGUID: 5a/Mw41bT3y1AsMb6koWyw==
X-CSE-MsgGUID: ZIpaxJy2S3WJSknVd69/rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="207834175"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jan 2026 18:21:21 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve27l-000000001vc-3wPH;
	Fri, 09 Jan 2026 02:21:13 +0000
Date: Fri, 9 Jan 2026 03:20:44 +0100
From: kernel test robot <lkp@intel.com>
To: Jihan LIN via B4 Relay <devnull+linjh22s.gmail.com@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jihan LIN <linjh22s@gmail.com>
Subject: Re: [PATCH] Documentation/kbuild: Document gendwarfksyms build
 dependencies
Message-ID: <202601090349.xxTPrbB1-lkp@intel.com>
References: <20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70@gmail.com>

Hi Jihan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1]

url:    https://github.com/intel-lab-lkp/linux/commits/Jihan-LIN-via-B4-Relay/Documentation-kbuild-Document-gendwarfksyms-build-dependencies/20260108-194655
base:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
patch link:    https://lore.kernel.org/r/20260108-documents_gendwarfksyms-v1-1-52b1f9c38c70%40gmail.com
patch subject: [PATCH] Documentation/kbuild: Document gendwarfksyms build dependencies
reproduce: (https://download.01.org/0day-ci/archive/20260109/202601090349.xxTPrbB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090349.xxTPrbB1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: No kernel-doc for file ./include/linux/hid_bpf.h
   ERROR: Cannot find file ./include/linux/hid.h
   WARNING: No kernel-doc for file ./include/linux/hid.h
   ERROR: Cannot find file ./include/linux/i2c-atr.h
   WARNING: No kernel-doc for file ./include/linux/i2c-atr.h
>> Documentation/kbuild/gendwarfksyms.rst:18: WARNING: Title underline too short.


vim +18 Documentation/kbuild/gendwarfksyms.rst

    16	
    17	Dependencies
  > 18	-----
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

