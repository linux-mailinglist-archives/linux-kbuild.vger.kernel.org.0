Return-Path: <linux-kbuild+bounces-5552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517E0A1A74E
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2025 16:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 152133A1452
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2025 15:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3272620C489;
	Thu, 23 Jan 2025 15:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IlreTp6z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A8E288A2
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Jan 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647447; cv=none; b=pKBy5d8/bmgv18BLGmMDydNi4/jZHmItp+nfOiNc1ofcIsCfZOo7a3ZxJrLnB++9GX4kLjcrKVbnLdsSIZdIlTWLBPethhxTCsQ/sbplmg6UqGqDjRZKPt4j1ZxB/c2sGioNdvYpn4LIGgoeDBTMiew2dLJszyiRkVhQIc/gRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647447; c=relaxed/simple;
	bh=ffZWQhPDZ44gsmQhgiqILWwPr9q8fjjwOq+iIgoCVBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8jnbyZssT0ldTTlLz+fzR0fGubaLI7Nybv9r1IDVlFAlSzU9Ct/FrqRYRWuTXeWu1heHBbMaf+OngTkGjF9yWxgBLe7LCr80yMge3Z9Bm5jtRTohp4F0DcszRsnukEDNUCKJRTpHdholxWrnFtvqe4kWBL7+gUWJjtc+p47Eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IlreTp6z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737647445; x=1769183445;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ffZWQhPDZ44gsmQhgiqILWwPr9q8fjjwOq+iIgoCVBo=;
  b=IlreTp6z/KZwM6jFGMnXCTW94xVJbQvcp+y+h2A55lhfC3yc7BUvbgii
   RXqd1ENxeWAMNyygdQWSI23wV16i7NNpxQjdNqU9ExnWG1RzGiXF3E+K2
   aBy0h2+jrGV58FPzS2EAnf5ctosVNo6Y72/zkLpW40jCA240P2S9joFHX
   6OohcGfzkAoZ2OsSN9Vt7tJCoroTnOapTQk7k8bTnN8kMTu7ruq2oEoQs
   JEtOdWjSLvHt/F+4Haa0oCTg2xFKD3nogR5hq/h0IKcXpct/wnlKS1roQ
   Qpq/Hj6C73c54AHYVEbOq3gykz1X43szqYjM4PWc7SE5wd4yS/vsQt5Ws
   g==;
X-CSE-ConnectionGUID: ocPoLFxxRbyEYpg6L9VSvw==
X-CSE-MsgGUID: yAg4BoeqScS7DTixmwrOXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49565372"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49565372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 07:50:43 -0800
X-CSE-ConnectionGUID: l1boX3miQ5209gfLvghAiQ==
X-CSE-MsgGUID: 8AmZpTHDTEaMf2s/8tHceg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="107412228"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 07:50:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tazTa-00000004S3L-0prz;
	Thu, 23 Jan 2025 17:50:38 +0200
Date: Thu, 23 Jan 2025 17:50:37 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] modpost: Warn about unused module namespace imports
Message-ID: <Z5JlTd-qCif4a5W2@smile.fi.intel.com>
References: <20250123110951.370759-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123110951.370759-2-u.kleine-koenig@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jan 23, 2025 at 12:09:50PM +0100, Uwe Kleine-König wrote:
> Symbols can be exported in namespaces and to make use of such symbols,
> the namespace has to be explicitly imported. Importing a namespace
> without actually using one of its symbols is likely a mistake.
> 
> There are a few offenders for an x86_64 allmodconfig build, so the
> warning is (for now) only enabled for W=1 builds.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> one of the offenders is drivers/pwm/pwm-raspberrypi-poe.c (
> 
> 	WARNING: modpost: module pwm-raspberrypi-poe imports namespace PWM, but doesn't use it.
> 
> ). The issue there is that on x86_64 CONFIG_RASPBERRYPI_FIRMWARE is
> always disabled and so devm_rpi_firmware_get() returns always NULL which
> makes raspberrypi_pwm_probe return an error before the pwm functions are
> used. So the compiler optimizes out all references to pwm functions and
> the warning triggers. I didn't look into the other problems to check if
> these are similar half-false positives.
> 
> Still I think this is a useful check?

This will require to add a number of ugly ifdeffery to the kernel code like

MODULE_FOO();
#if ...
MODULE_IMPORT_NS();
#endif

I am definitely not okay with that.

Maybe you should introduce the MODULE_IMPORT_NS_IF_REACHABLE() or so to hide
this or whatever equivalent there?

-- 
With Best Regards,
Andy Shevchenko



