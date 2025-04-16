Return-Path: <linux-kbuild+bounces-6637-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F6A8B58B
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 11:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32937444C44
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 09:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEA5236421;
	Wed, 16 Apr 2025 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxWf1NcZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC13C2356CA;
	Wed, 16 Apr 2025 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796177; cv=none; b=sUwfhuXnapWyj8cG783/WnYFxfNom9MObZikt6WTl5Gupn1fk9AgvMRuPv/2w4Fnn6fonbp9pi0Uvvo4bYVcNPoywfFhWFS7BDyuI3iesg4FteoG+AkGuh9PmlA7XELrCYjrovZe+hY3iWqfMlRNcBwzKRuI/jcOnSSWe7QugFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796177; c=relaxed/simple;
	bh=SgispnRGiERs1+W7dul4dADQxU06rFDdSLdU3q+mB2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCwT7l3ljJiEFis6+jIm5bAR6vlXCAVvB5Q7vT6SQelhIFddZM4sbQSePTilw42HGRxksjk/knnqpVOSurt+j5lK7XhvatKxTl/zSTmcmR7v5AiccpISmXoGu4ESlKLYiG2QEEJYORtln8Tj9QPMjQwnTN9vMGosypvDxjSxgzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxWf1NcZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744796176; x=1776332176;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SgispnRGiERs1+W7dul4dADQxU06rFDdSLdU3q+mB2I=;
  b=gxWf1NcZwYBCorZ/5yojgSmnFsiDTOlyP3Ed7/eWPoOKlGLUws/x2myH
   1aFnAV7eGLPusKDL5K8cZjOohr/Oi8vKcEw3PwQ0tp1AD1T3EjMwvwoGC
   03kpi2JIEKYuzx0o7F9zVlpK22Ew6JZfBuTOVlEvA58I4Bf63m/IO4mhn
   PVL17QkcA67tpQYarWzyZVtL/GUZuqbmkvkF2JG41kHEXl0EVOQsJFMVe
   2WPW8LdGGcjyyuRMPidfmPJHGh5wFfFZ98vcTMP2qxVUJL7DLBuUpqSW/
   Co0+jEtUG5IlEmnV0vTLeOOdxaxQ7tAAHlVNdCsok2EyQJtKV74vGIS/+
   g==;
X-CSE-ConnectionGUID: BzSbrL/wReqHp1OqlBzTJQ==
X-CSE-MsgGUID: G5+SnEPhTam4QStJnj3qwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46496637"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46496637"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:36:15 -0700
X-CSE-ConnectionGUID: mTkNxxr4Qca0mpnG0U7HTg==
X-CSE-MsgGUID: pmEeVo+zTE+6jbTbe8oO7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130360013"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:36:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4zBe-0000000CoGG-4B1K;
	Wed, 16 Apr 2025 12:36:06 +0300
Date: Wed, 16 Apr 2025 12:36:06 +0300
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
Message-ID: <Z_96BpMMOzcotJqI@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com>
 <20250416171917.0985c0eb@sal.lan>
 <20250416172901.60104103@sal.lan>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416172901.60104103@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 16, 2025 at 05:29:01PM +0800, Mauro Carvalho Chehab wrote:
> Em Wed, 16 Apr 2025 17:19:17 +0800
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> > Em Wed, 16 Apr 2025 11:34:16 +0300
> > Jani Nikula <jani.nikula@linux.intel.com> escreveu:
> > > On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

...

> > > >  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
> > > >        cmd_hdrtest = \
> > > >  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> > > > -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> > > > +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \  
> > > 
> > > KERNELDOC is not set here.
> > 
> > > 
> > > /bin/sh: 1: -none: not found
> > 
> > Weird. This is set on Documentation/Makefile:
> > 
> > 	$ grep KERNELDOC Documentation/Makefile 
> > 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> > 	...
> > 
> > drivers/gpu/drm/Makefile should be able to see this variable there...
> 
> I suspect that the building system tries to confine variables to
> sub-directories, so maybe one solution would be to move it to the
> main makefile.
> 
> could you please check if this patch solves the issue?
> 
> [PATCH] Makefile: move KERNELDOC macro to the main Makefile
> 
> As kernel-doc script is used not only on Documentation, but
> also on scripts and drivers/drm Makefiles, move it to the
> main makefile, as otherwise sub-makefiles may not have it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index c022b97c487e..7a2069e87dbd 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -60,7 +60,6 @@ endif #HAVE_LATEXMK
>  # Internal variables.
>  PAPEROPT_a4     = -D latex_paper_size=a4
>  PAPEROPT_letter = -D latex_paper_size=letter
> -KERNELDOC       = $(srctree)/scripts/kernel-doc.py
>  KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)

In this case the _CONF makes sense to move together as they are coupled
semantically.

>  ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
>  ifneq ($(wildcard $(srctree)/.config),)
> diff --git a/Makefile b/Makefile
> index 38689a0c3605..c8e46f0c1f63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -458,6 +458,8 @@ endif
>  HOSTRUSTC = rustc
>  HOSTPKG_CONFIG	= pkg-config
>  
> +KERNELDOC       = $(srctree)/scripts/kernel-doc.py
> +
>  KBUILD_USERHOSTCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
>  			 -O2 -fomit-frame-pointer -std=gnu11
>  KBUILD_USERCFLAGS  := $(KBUILD_USERHOSTCFLAGS) $(USERCFLAGS)

-- 
With Best Regards,
Andy Shevchenko



