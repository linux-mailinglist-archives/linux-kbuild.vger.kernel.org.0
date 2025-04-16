Return-Path: <linux-kbuild+bounces-6635-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D4A8B53D
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 11:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0F3B5A0C49
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 09:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C57323815C;
	Wed, 16 Apr 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwJTco6I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D899A2356CA;
	Wed, 16 Apr 2025 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795392; cv=none; b=Kl8ROKf7BaVlorYYv/PoVJ8JcPZUIMSr1KbkyyLzWBTDVkHBxVH6jSR+eq0+8gpVUhoJGl3+PpVvLBGBGA0IdY/GlIA0SXSSDn+IOmberv06ndjNpcSCEe5h59THdtwFwBkbiNhPukjxsJpdbKXZm373d3mq5lHLKSnRetd3uXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795392; c=relaxed/simple;
	bh=/tufIAG+VUZJC7b6YakwZhHyHBhfxxSru8ER1OFHfdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tvd3XG/R4lC2H4zkBHJ4La+pJhcD0U1WMKbgEOGg3o2nYjWGu4wSBuZmU9uh4l8meyTkD/GdZwTG9fDOkDwV6IKXlNNRWjcdJKINLbrm4olkBP0mdExvYNaJv+y02wNNvL95JPk7akZ2shpdZzNpXIx3+RFIToOIvIkEklsVD44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwJTco6I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744795390; x=1776331390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/tufIAG+VUZJC7b6YakwZhHyHBhfxxSru8ER1OFHfdc=;
  b=HwJTco6IlTn/EeeWKTLZ/zSeULdXNnJvtItdeVyB/ot9Xrva51uyf1cc
   iYiD4MSsgZFn8vCuWMjV2hjS2Qg7L8CH9vXvezcOfbJy/DodCsfasuNbs
   fjywDKJkpN1D1WORQAgnSqcO0SQayeQiMoSxf2c+WgIw0tG4HeD6r5EYb
   HALkrkdlyB1JP0Eo4boQ7ZCk3tFwP0ys3hGp9umi+nmpP6GpJ0YyAF/T/
   vgj8/OniLPMUNuDKBNvSPFYjRmj8ytZS7AOTmm1JmBT+oFg8OGOxZxNL0
   vUEm5I9Gbw2TfWeMTH96yCTdkArcsHiGfDQwcd+E/uuEPeX9TVDnVzqkq
   w==;
X-CSE-ConnectionGUID: veMJLjxpSuyo2/W2wBdeKw==
X-CSE-MsgGUID: sjovWhO4R02+LTomiqncDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46495059"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46495059"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:23:09 -0700
X-CSE-ConnectionGUID: i+2ZkBenQFK9UjPDvAV82Q==
X-CSE-MsgGUID: byr1DdO/QXmCIVsDDjNGWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="153605640"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:23:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4yyz-0000000Co6S-3lv7;
	Wed, 16 Apr 2025 12:23:01 +0300
Date: Wed, 16 Apr 2025 12:23:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
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
Message-ID: <Z_929c1XSfeSi3QD@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com>
 <20250416171917.0985c0eb@sal.lan>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416171917.0985c0eb@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 05:19:17PM +0800, Mauro Carvalho Chehab wrote:
> Em Wed, 16 Apr 2025 11:34:16 +0300
> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

...

> > >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > >        cmd_hdrtest = \
> > >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \  
> > 
> > KERNELDOC is not set here.
> 
> > 
> > /bin/sh: 1: -none: not found
> 
> Weird. This is set on Documentation/Makefile:
> 
> 	$ grep KERNELDOC Documentation/Makefile 
> 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> 	...
> 
> drivers/gpu/drm/Makefile should be able to see this variable there...

Does it work in the case of `make drivers/gpu/drm` ? This is probably how Jani
tried it.

> > >  		touch $@

-- 
With Best Regards,
Andy Shevchenko



