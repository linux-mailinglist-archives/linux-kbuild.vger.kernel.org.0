Return-Path: <linux-kbuild+bounces-6763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC410A9E96E
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 09:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 540BD16945A
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 07:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EE81A2390;
	Mon, 28 Apr 2025 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/o+5q3/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F982866;
	Mon, 28 Apr 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825727; cv=none; b=Ote06Oc9hPQTPUe+sdDwFyR0iBnRa14kczG/dt696pn5bUkDgmvj8hCJQ6RgDC4fHyFNxMijLOfB0lBdvuPJsrYyFwSe3XRfIcoBOJi9trNtSDOBU3nG7PGtwkqfdPwWRxqkhenzsMDs8goIL9qBBp+vaNo3DI+Kw53lp+1mbM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825727; c=relaxed/simple;
	bh=mxdki93guRrPUqMnNg4vPPRG6mXLaz09PPXd+0S8V6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLNibOVDvuxfTln550qTIflM5NkQJdaA377rYCqE+t9pDfcI8zov/LX7KDP+xIAaJe06CWFaUr+hGRLe4eZJzGELL+EM7aXniM4Hi3jwe2gHQ4wQ6K9xrpideK6/3Mp6wm7CZUDTMk06Xb64w1k+Ngxo/3AdyLLsD96RFXZ4lGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/o+5q3/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745825726; x=1777361726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mxdki93guRrPUqMnNg4vPPRG6mXLaz09PPXd+0S8V6E=;
  b=K/o+5q3/oZSZ9H2GvLBUCgsdkIhrr7HyGZSiYuhvZJpMHF61piITfezC
   6PTJXhm/EY6HscEGeMpWku0d+EylG+7DAqiUE6HxhQe2bFtraR4hhnU0P
   M0t3goahERIA3ioUvKmqQwAbF8WIG4y07OyuhUoxZ16mUlcrjwX8ME7ug
   lX6LJFk3Spn6IJQTbsvlXDr3gdeeJfL32PZYtewemEbYYWqTk6ZVNg4hG
   /K3BNFt+/4drPHLb9vbPtW5iMNDfhg8stsijFlNe0Kkjxdh2AkC4tZWmZ
   AJvA2QpWUS+/fXtrmwgITvjzjfgW4ualidysPT9mJn8HiOxsfElkk4lUI
   Q==;
X-CSE-ConnectionGUID: jcHnSpGGT5G2SK6lT6dfAA==
X-CSE-MsgGUID: pY3iLgfvTimKgtxNqFkubg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50058862"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="50058862"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:35:24 -0700
X-CSE-ConnectionGUID: tFG6ORSjTd2nkwZlwgLrJA==
X-CSE-MsgGUID: vdPhjXp7RgOB/g6AJCI/RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="137491544"
Received: from smile.fi.intel.com ([10.237.72.55])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:35:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u9J1I-000000011Cw-0lnE;
	Mon, 28 Apr 2025 10:35:16 +0300
Date: Mon, 28 Apr 2025 10:35:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, airlied@gmail.com, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	masahiroy@kernel.org, mripard@kernel.org, nathan@kernel.org,
	nicolas.schier@linux.dev, rodrigo.vivi@intel.com, simona@ffwll.ch,
	tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
Message-ID: <aA8vs8gw75aAfwYb@smile.fi.intel.com>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
 <22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
 <20250426205708.4f90a83d@sal.lan>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426205708.4f90a83d@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Apr 26, 2025 at 08:57:08PM +0800, Mauro Carvalho Chehab wrote:
> Em Sat, 26 Apr 2025 11:39:05 +0900
> Akira Yokosawa <akiyks@gmail.com> escreveu:
> 
> > Bothering with might-become-incompatilbe-in-the-future python environment
> > variables in kernel Makefiles looks over-engineering to me.
> > Also, as Mauro says in 3/4, it is incomplete in that it does not cover
> > the cases where those scripts are invoked outside of kernel build.
> > And it will interfere with existing developers who want the benefit of
> > bytecode caching.
> > 
> > I'm not precluding the possibility of incoherent bytecode cache; for example
> > by using a shared kernel source tree among several developers, and only
> > one of them (owner) has a write permission of it.  In that case, said
> > owner might update the tree without running relevant python scripts.
> > 
> > I don't know if python can notice outdated cache and disregard it.
> > 
> > In such a situation, setting PYTHONPYCACHEPREFIX as an environment
> > variable should help, for sure, but only in such special cases.
> > 
> > Andy, what do you say if I ask reverts of 1/4, 2/4/, and 3/4?
> 
> Patches 1 and 2 are, IMO, needed anyway, as they fix a problem:
> KERNELDOC environment is not used consistently.
> 
> Now, patch 3 is the one that may require more thinking.
> 
> I agree with Andy that, when O=<dir> is used, nothing shall be
> written to source dir.
> 
> There are a couple of reasons for that:
> 
> 1. source dir may be read only;
> 2. one may want to do cross compilation and use multiple output
>    directories, one for each version;
> 3. the source dir could be mapped via NFS to multiple machines
>    with different architectures.
> 
> For (3), it could mean that multiple machines may have different
> Python versions, so, sharing the Python bytecode from source dir doesn't
> sound a good idea. Also, I'm not sure if the pyc from different archs
> would be identical.
> 
> With that, there are two options:
> 
> a. disable cache;
> b. set PYTHONCACHEPREFIX.

Thanks, Mauro, for replying. I'm with you on all of it.

> We're currently doing (a). I guess everybody agrees that this is
> is not ideal.

Yes, I also prefer to have cache working if it's possible. The only BUT here is
that users should not suffer from it.

> So, ideally, we should move to (b). For Spinx, the easiest solution
> is just to place it under Documentation/output, but this is not
> generic enough: ideally, we should revert patch 3 and set
> PYTHONCACHEPREFIX when O is used. Eventually, we can apply my
> patch for Documentation/output, while we craft such logic.

-- 
With Best Regards,
Andy Shevchenko



