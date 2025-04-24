Return-Path: <linux-kbuild+bounces-6738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 294EEA9A7B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 11:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 837F77A6225
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Apr 2025 09:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA4E213240;
	Thu, 24 Apr 2025 09:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zw1plqQ9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC0A2101AE;
	Thu, 24 Apr 2025 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745486927; cv=none; b=IrElMYpUMCn/31YgUUeUmpN1XepG+4oOu1Q6sXLGjXtt+veCVtsYJXqJ8IFCd6279nG1zISh4wvBVA9pJxTQ92Gi6DTq6KHzK04s/A/o93dGrxmNwCiIXb7sUg03LFspjuyv1DVGu5/0pt9gKxL/zH+lUkMcTXVHAPNNx4H+cww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745486927; c=relaxed/simple;
	bh=lvBQ66pt/udkrLBjna1M6i4Wpfg3z6AE7kjI76to8a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0wvTW2gftlK1hUMlmIons9sxTDB7JfNstJ8uIKb5xd6v/2SiKgMQ8KaJdGGLAlFc3X3mhmrTGjO+6HFdggVdK0mGqhEVHxg/g9qexftbK63RdylvFttRNT/rR2Gy4cEXFtKsO0NBjmxURWsb/AN5vMq/O5Bmpt1n8jSf2LwHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zw1plqQ9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745486925; x=1777022925;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lvBQ66pt/udkrLBjna1M6i4Wpfg3z6AE7kjI76to8a0=;
  b=Zw1plqQ91yolxXUehoph/l8mrRsvnXusNg+ieZVuxR2mtv/qPrdXt6/o
   txxdjHD9S1s/cgbQax/U0CWPm0YsIbxc6fnpUk6i1/pYUa+71j+ohf9cI
   NUgQtgTovcBcHRgXnuFaVK61Txmv7G22d74XAFKBNKGNQHgxpWu7dhW20
   C/Uqo+V+X0ADDQAyAbfiN1IHlurGbTDS1oJfxv+WzmVw/xhCM35fiF+HB
   hGRtzMY0cjURD6j481cahF1p6IITdYwAnpH2PWRJbPXK7wS30dI2xyLNh
   jew/8KGVOcDk19RhvklRFq/13bjMCPcsQLXHGJGygVYLcA+yN3opssRoe
   Q==;
X-CSE-ConnectionGUID: KEXe05ccTFuwKF4lHqcyWA==
X-CSE-MsgGUID: 7GpuFiK1S8GnrVAljkGl9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58481361"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="58481361"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 02:28:44 -0700
X-CSE-ConnectionGUID: Wep8dTg7TPKjSc7+x7CFww==
X-CSE-MsgGUID: LaIxPgO8Shi/KWEgmHWHfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132446437"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 02:28:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u7ssm-0000000FW1S-1urP;
	Thu, 24 Apr 2025 12:28:36 +0300
Date: Thu, 24 Apr 2025 12:28:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: airlied@gmail.com, corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	masahiroy@kernel.org, mchehab+huawei@kernel.org, mripard@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
	simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <aAoERIArkvj497ns@smile.fi.intel.com>
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
 <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
 <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
 <5a8f0fc7-a2aa-4554-a603-3537d735dc9f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a8f0fc7-a2aa-4554-a603-3537d735dc9f@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 24, 2025 at 11:07:05AM +0900, Akira Yokosawa wrote:
> On Wed, 23 Apr 2025 19:31:36 +0300, Andy Shevchenko wrote:
> > On Wed, Apr 23, 2025 at 06:30:48PM +0900, Akira Yokosawa wrote:
> >> On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:
> >>> On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
> >>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

[...]

> >>>>> Would it be possible to properly support O= and create pyc / pycache
> >>>>> inside the object/output dir?
> >>>>
> >>>> I have to confess, I've been wondering if we should be treating the .pyc
> >>>> files like we treat .o files or other intermediate products.  Rather
> >>>> than trying to avoid their creation entirely, perhaps we should just be
> >>>> sure they end up in the right place and are properly cleaned up...?
> >>>>
> >>>> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
> >>>> should do the trick?
> >>>
> >>> It's not so easy. The Python is written in a way that it thinks it will never
> >>> runs object files separately from the source. Hence that variable sets only
> >>> the folder per script as _home_ for the cache. It's completely unusable. They
> >>> took it wrong. It still can be _painfully_ used, but it will make Makefiles
> >>> uglier.
> >>
> >> But, PYTHONPYCACHEPREFIX can be set as an environment variable.
> >>
> >> For example, try:
> >>
> >>     export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"
> >>
> >> Wouldn't it be good enough for you?
> > 
> > Of course not. We have _many_ scripts in python in kernel and having a cache
> > there for _all_ of them is simply WRONG. You never know what clashes can be
> > there with two complicated enough scripts which may have same module names,
> > etc.
> 
> Interesting...
> 
> I'm suspecting you replied without having tried the setting...

I tried before, but I admit, that I have missed something. It was a mess
in that case. Now I probably can't repeat as I don't remember what was
the environment and settings I had that time. I'm really glad to see it
is working this way!

-- 
With Best Regards,
Andy Shevchenko



