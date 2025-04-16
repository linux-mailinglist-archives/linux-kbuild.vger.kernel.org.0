Return-Path: <linux-kbuild+bounces-6633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C791FA8B3F3
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 10:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 244BD18962D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 08:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FEB22FF5F;
	Wed, 16 Apr 2025 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPoYFEk0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA022DFB6;
	Wed, 16 Apr 2025 08:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792469; cv=none; b=CtELXYFp1ONP5kEJoiUFVCPyEiMlVrC2blcR+UwzCqBCIvODz88ILsc9knAIhpuj/2Nn7+b97HUnaRtwOPkKPGnUA+b4Uik6LabS1iwCXCYDrtIiYU0Y/vKT5fwvHsRS8DpoX7JdkO7NmGS2aC3Kqz7GGgYUeOmz/iCcwhrnFvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792469; c=relaxed/simple;
	bh=ndLpCVsPDQ53RFlJHDrB2oFUglcdoN6fweLm3J6ZP5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hwtaGjkcoE4bUw0fMl3+fFU/DACe+HDEaJzfeiyRd+A/fhTbYdD4O21KSYMtfotRJyAIeow8xTyJgAJT8QdwnMInQT5QIZrCEIWS5OoJ5eFS5/joOeKx/CaNdXlHbtYnfQTkuP/T3wKt7fwTOqYpPwj1ZlI8xMhx7MvqLbqxMhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPoYFEk0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744792467; x=1776328467;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ndLpCVsPDQ53RFlJHDrB2oFUglcdoN6fweLm3J6ZP5k=;
  b=BPoYFEk0e8ffHbG05RvKyMKcuxqUPulXk3kkUn8VDrvYhWaIpfC+F0kR
   /VPSnJCRUQRjsXkDDjuV0M5DBtxjKH451EFSRbMfEgszk73NH9B9LChbx
   4Vi07XsFTpmQLjpSq75z8ernBDxGUSj+pcicq8OSKCNTcn4UmC4/sqYkU
   Hnk7HJe1xDrEc7xjWp8FtX4WvgDgnojtnfFAkCruEFmEBsoDp02SvWuCq
   9ao6aSvspeTcAjV80LTN2HHj6xcGH3Ec28og1mY/DMtjIup33mXWhLg4q
   xYRg2aXHLeIr14I3tvsAaXgCP/xVWwrAan3CWUgdzHA669bWAIpn3+YHi
   g==;
X-CSE-ConnectionGUID: rw7bEigiRnuDq9Vq8/fLsw==
X-CSE-MsgGUID: WBzoMjVRSLCTjiAuEWxQIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57322877"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="57322877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 01:34:26 -0700
X-CSE-ConnectionGUID: 44MKtmDVR8GjGPYWbh7Ddg==
X-CSE-MsgGUID: gO7j7/VySBmt52m/Rwfmug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="153593714"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.96])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 01:34:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, David Airlie <airlied@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
In-Reply-To: <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
Date: Wed, 16 Apr 2025 11:34:16 +0300
Message-ID: <87tt6opks7.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> As reported by Andy, kernel-doc.py is creating a __pycache__
> directory at build time.
>
> Disable creation of __pycache__ for the libraries used by
> kernel-doc.py, when excecuted via the build system or via
> scripts/find-unused-docs.sh.
>
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/Makefile      | 2 +-
>  drivers/gpu/drm/i915/Makefile | 2 +-
>  include/drm/Makefile          | 2 +-
>  scripts/Makefile.build        | 2 +-
>  scripts/find-unused-docs.sh   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ed54a546bbe2..d21d0cd2c752 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \

KERNELDOC is not set here.

/bin/sh: 1: -none: not found


>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ed05b131ed3a..ab6b89a163e7 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
>  #
>  # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
>  ifdef CONFIG_DRM_I915_WERROR
> -    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
> +    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none -Werror $<
>  endif
>  
>  # header test
> diff --git a/include/drm/Makefile b/include/drm/Makefile
> index a7bd15d2803e..1df6962556ef 100644
> --- a/include/drm/Makefile
> +++ b/include/drm/Makefile
> @@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 13dcd86e74ca..884dc86ce04e 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -83,7 +83,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>  endif
>  
>  ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $(KDOCFLAGS) \
> +  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(KDOCFLAGS) \
>          $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
>          $<
>  endif
> diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
> index ee6a50e33aba..d6d397fbf917 100755
> --- a/scripts/find-unused-docs.sh
> +++ b/scripts/find-unused-docs.sh
> @@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
>  	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
>  	continue;
>  	fi
> -	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
> +	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
>  	if [[ -n "$str" ]]; then
>  	echo "$file"
>  	fi

-- 
Jani Nikula, Intel

