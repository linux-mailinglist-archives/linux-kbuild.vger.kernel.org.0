Return-Path: <linux-kbuild+bounces-6702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FEA9446F
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Apr 2025 18:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E2B1894360
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Apr 2025 16:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B98C1DF26F;
	Sat, 19 Apr 2025 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpswxk4u"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769E78F77;
	Sat, 19 Apr 2025 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745079303; cv=none; b=YMwrUyFAx6CgyZtRdbsqiJ/jertatyS/X2gRe+jSESH0LVe4kiDNGceLSqNA67Xy+t+R/w+Y+TsyhcGAlDZnXWOlaDf/pgZf7TLw6A1gzlz5glp2xryIZRPNyyj0fMovLvVKyiPPXHhXeX0K0pkj1OWv35ztwlhbNNZ5KZPrBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745079303; c=relaxed/simple;
	bh=1lL19XfUqEwKIcHE307+MGee0gbFnU3PXLODld9yEr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDoiUHcBRiq4E0enJcVEhYjQzCklTiNWbP7fUshB62dP1j1rEiPiEp72rWrO6YXLH7Jkb4mVpxCQ9wnUlM06lEDTY71w/f+YzNw9HFADhR7IUcsJyAOq17+RrHX8tEfOg7d2t4AGqLfpfWeeWO0L2SRSxi3p1OEylkmJveXovyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpswxk4u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745079302; x=1776615302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1lL19XfUqEwKIcHE307+MGee0gbFnU3PXLODld9yEr4=;
  b=cpswxk4uvpxeFH8nVzdWNb/IRFHHfjT6citcEIHf0wDqKdQZ6zfYbdwQ
   j74UXCpkFbH+f79YCRqKxg2CqYKXis0Vh9q3aUBgJhJgxZwLXpMpOmOON
   mnude6Nr2u8RfTaP4wM2fuWHhNjgct9WzfsuOFwoMOpu3h+lXYjGpqgmU
   vVpT1PPoQuboe4vHbb4FfIbKgaJ87VNJfy0Fxyis6PS2gfr4162jyemM3
   ybr8v49MfPLUGYhdX+MfMQZ1NglVvnvaZZrC0Blf4dy6RDMLuJfOmGx/p
   vX57S0uOqcUfIg3CVXp5TtJU5tAZ9JTRhCUYZo/OOofrAVqjZdeBz72Ta
   Q==;
X-CSE-ConnectionGUID: HYs6uEQFROyYyH2dQQ1wYg==
X-CSE-MsgGUID: W5cW4sGMTTy3x//Ep9pCxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="58059149"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="58059149"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 09:15:01 -0700
X-CSE-ConnectionGUID: 8p+RqmlBQMuXCyHFW50Q4g==
X-CSE-MsgGUID: fVr3TMPGT+u/BT4PcUDyEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="131920411"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 19 Apr 2025 09:14:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2B1A9170; Sat, 19 Apr 2025 19:14:54 +0300 (EEST)
Date: Sat, 19 Apr 2025 19:14:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
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
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Don't create Python bytecode when building the
 kernel
Message-ID: <aAPL_hKx8cxypHe6@black.fi.intel.com>
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745019660.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Apr 19, 2025 at 07:50:01AM +0800, Mauro Carvalho Chehab wrote:
> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
> O= and even having the sources on a read-only mount point, disable its
> creation during build time.
> 
> This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
> where the script is called within Kbuild and when called via another script.
>  
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
> 
> This series contain 4 patches:
> 
> - patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
> - patch 2moves scripts/kernel-doc location to the main makefile
>   and exports it, as scripts/Makefile.build will need it;
> - patch 3 disables __pycache__ generation and ensure that the entire Kbuild
>   will use KERNELDOC var for the location of kernel-doc;
> - patch 4 adds *.pyc at the list of object files to be ignored.

This one works for me, thanks!
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



