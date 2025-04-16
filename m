Return-Path: <linux-kbuild+bounces-6639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC1A8B5AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 11:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BB257A9499
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 09:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F082356DF;
	Wed, 16 Apr 2025 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXu6k4xm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8CC2356A5;
	Wed, 16 Apr 2025 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796359; cv=none; b=vA5XV/5phTsvbZuPq9M2F+tuluxy/o9IXRAWyL9Ghnc9D588JySdhOsQ56dLHq73+vyr8WGMf2LvDp3RduQjw3+DlGGkiSqZ9nxlLczFUGBdDZY7QitX2I0D4yFBOJvr1fS/3Wces0Ta2xKqtYSV5JO/V+UUTvFLOtVGA5+ushQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796359; c=relaxed/simple;
	bh=9fdBsleaD8dgnq57jOyrHHe3KA3jPINhieNOqKGD4VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CvS2kp4wh0jh3GatebMhNRBOEjmFERlVkxx5phgOli4uwyN9sP9vlVNYNFLEBxsGveqE2kTZggpyeoKGfDn61WRvi25X+cvm3Q4XZMixh0TlGoLM88u1kz9JfHmhDVsXktM8CzTHYzoIJjS4w71q7iNxjonnVH2UIRyRjuTXs+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXu6k4xm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744796358; x=1776332358;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9fdBsleaD8dgnq57jOyrHHe3KA3jPINhieNOqKGD4VA=;
  b=FXu6k4xmjoUcDQqLa7FuXdBg3PUZLl5/XARLUKkzqsBNv++7XaZujvwH
   iWCICmJCUuD4u8IT6DKmoxSMY18ojVPTi2jmfLJl93o1aenL+FtLuY8Bv
   3+kZdVUdoCv2doovHxHIGqI7UzEXtCWHEmml/T74MEPD1xWZfo0bDmMCd
   h0gxRqvfHNYh/6e6tmvoqAbBq3kmNSS3Jfz5u8U1rp38StW+oziAG/Rjs
   GD1siO0of8RE3PXDMXYQ734xbVqrXBQmhcV3vraJLC8K37XGCs96ivNYV
   E+l4wdjE6gxm/XsG+p4Fa4YM7IczeO3qK1jDBFLZpmf7QZ35Olw2BvYKk
   Q==;
X-CSE-ConnectionGUID: YFVUGpXiTwSay9kAKpAeTw==
X-CSE-MsgGUID: sC7tJ58AR3SePEsiximfhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46497309"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46497309"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:39:17 -0700
X-CSE-ConnectionGUID: WTSAaOr3Qf+M/8N6Ta0UMA==
X-CSE-MsgGUID: DOyLZq5mRLuMjO3OY4M6FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="153610408"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 02:39:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u4zEb-0000000CoKF-1MhN;
	Wed, 16 Apr 2025 12:39:09 +0300
Date: Wed, 16 Apr 2025 12:39:09 +0300
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
Message-ID: <Z_96vRs03t4gkFoR@smile.fi.intel.com>
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

...

> could you please check if this patch solves the issue?

Doesn't work for me.

-- 
With Best Regards,
Andy Shevchenko



