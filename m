Return-Path: <linux-kbuild+bounces-7174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D98ABDD49
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 16:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22C94500569
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 14:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4162424886C;
	Tue, 20 May 2025 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCDXh0r8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866A222D794;
	Tue, 20 May 2025 14:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750955; cv=none; b=KjCqlbinJZPVDGb8SrmD6fPOQChQb8pOjtJ+jPCTdzHLlKpYzm2jrurxhHRFSE7eC+I4k8FMq/qjzRuvCzalhVR+i6Um0jX5RoakofRR1EYTkhK4ddq3YVi+aAaz7I0d9w8RyFNS9YkwmjOSxNipAcVtElzOcQdd8PBrp7JjnjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750955; c=relaxed/simple;
	bh=Ii306wnrKpiX/43hTmXSOYB+7DgIU5Oc/UC9CBk2GlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X62W9DbJPuDubh5lUtMeWfrCa6Y1tolf+e3hBxwhpebfRoJl9CwgVgM8wHRw8KXYZ306HCxHtRHayzYdggEConeablNDmnsOxnOJAjybTfoSFueTBcSNCrk5V0kCUvYTa5wcC/TOXuLubksXNl7fxpGyIMP4aooUW5Pyx8Xtz9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCDXh0r8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747750954; x=1779286954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ii306wnrKpiX/43hTmXSOYB+7DgIU5Oc/UC9CBk2GlI=;
  b=MCDXh0r8x2VfUbtyEO8v5+/+Efyf1ewT7H3/Ab0OoQdBsDAjLI9XEVXm
   IKfnpLRmkcap/nyk0fCkjJ1P0uIr8gs8ofRqjqRbJ0hVVtgz5K1eWI0c5
   VB+/78Gbr1kYr8yBngetbAx7L114apfPeZG/mEjA94b2GOV3yOaxnApvX
   QoUTKNe788VOzEgNm5HDuupLCm7rIh/I8NGrEzxYkweTlGXscLdM3pKet
   DdeBzhWF60KP280MmsD6O8pOC7bH80FJbVhVELU+yM44g96cXxTPKgOdY
   qDkD8KJAaMVX5a2Eg58WnZWd4+THvdiskxHXGiLrXuTjLCceXAZ6Fc+1f
   w==;
X-CSE-ConnectionGUID: HJaAsjmISO62oEvD059umg==
X-CSE-MsgGUID: d6tMv4VHQdaodFjVO6QvlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49388756"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49388756"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:22:33 -0700
X-CSE-ConnectionGUID: 3X6mf2+VRhCP4Eh0BhbDiQ==
X-CSE-MsgGUID: fXfQNXEbRVmudCwsVRoqBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="143700819"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:22:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHNrP-00000003LSd-1mL5;
	Tue, 20 May 2025 17:22:27 +0300
Date: Tue, 20 May 2025 17:22:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Kees Cook <kees@kernel.org>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] docs: kerneldoc.py: add try/except blocks for
 kernel-doc class errors
Message-ID: <aCyQIwBnSiPLPrDo@smile.fi.intel.com>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
 <064bac2f462c13f56154891d8f3fb788db94f325.1747747695.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064bac2f462c13f56154891d8f3fb788db94f325.1747747695.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 20, 2025 at 03:33:08PM +0200, Mauro Carvalho Chehab wrote:
> Replicate the same behavior as what's done with kernel-doc.pl:
> continue building docs even when there are exceptions.

...

> +            logger.warning("kernel-doc '%s' processing failed with: %s" %
> +                           (cmd_str(cmd), str(e)))

> +                logger.warning("kernel-doc '%s' processing failed with: %s" %
> +                               (cmd_str(cmd), str(e)))

The prefix of the message is the same for different (semantically) places.
Is it okay? (I would expect them to slightly differ, but I dunno if
cmd here is the same, perhaps that's enough for distinguishing the two.)

-- 
With Best Regards,
Andy Shevchenko



