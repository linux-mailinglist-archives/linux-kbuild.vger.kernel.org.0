Return-Path: <linux-kbuild+bounces-4454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D4F9B7E2C
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 16:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B086A1F211A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 15:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731921A303E;
	Thu, 31 Oct 2024 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cA+ygh9I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0240E19E99C;
	Thu, 31 Oct 2024 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387965; cv=none; b=BYyVF224TkwLicTtP20torgYetKx00rj8Pd5qhgy7XPT96hBgxXjayRPLo1PE/pKsZ1t3yY9XP6eWeK8wG6gd7mjKYv5pfOBb0ZSWe5JXiq48CQ613/ZIQ2/1uiySm66yAK/belOn6QFdM6JkFm9e6gSfEcbjaHZrXRTfW72B8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387965; c=relaxed/simple;
	bh=hj4TfqQsU5dDVy49jKTs6xRNQRgB9p+1kQ8sSzWwBN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtWbKMZxgV4HWIZv0BR6oT+Zv2ADtpoYCx/TuLZxGFFL+E4dY9Sltb55u+b48ovqm1ppQFnAEAewlxyIJJ/sOAlXgBkJNy/mx048vRi03qU72fixfXWKwFFqgIPla5duukVh+JdCIM63lMpZwxL6zIFRI/ml7NzPYbV48Bij7j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cA+ygh9I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730387963; x=1761923963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hj4TfqQsU5dDVy49jKTs6xRNQRgB9p+1kQ8sSzWwBN4=;
  b=cA+ygh9IbEjeUX5GYyrsFMaMw2GrsslKuq2gf2mz3H3sJ1iDcOcWahkH
   auc2h2gMKT+uMGB7Qnochflmn/lIiU5T5dfQpP0EpvfW9tyUldrqR3T4O
   A1SZjIMx4d/TDQYLow0Gui10hjVJIDQI+vv3QbcA3kvnsSxwkwbj3dhv+
   gG1h+YmYtpvYJBDvbzHY55AQQTIgBvkBl9xcfDT+xZsImax1LcU5h//hR
   YBGWeY+VYf+WvrIMTIBHWmUf9DS5KDkz4f4LZjyXqPNbaVQ+IEEgWq9p9
   D1cohsdqKB4pt9C7yo6iIohJQl631y1CbROoO7o4Fl0nzxY7IWEHY4lme
   g==;
X-CSE-ConnectionGUID: 5KmpDv7pQ5Kzssk2XiYSLg==
X-CSE-MsgGUID: 4z0kw7GxTPKfZHPHkzk16w==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33934023"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="33934023"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 08:19:21 -0700
X-CSE-ConnectionGUID: o8LocKcGQU+qXrKF7qYFqg==
X-CSE-MsgGUID: EuKuJomdR2+t+e4LIGJnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82819867"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 08:19:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t6WxA-00000009h2t-03nw;
	Thu, 31 Oct 2024 17:19:16 +0200
Date: Thu, 31 Oct 2024 17:19:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 1/1] platform/x86: intel: Add 'intel' prefix to the
 modules automatically
Message-ID: <ZyOf8_mBMS5nuigt@smile.fi.intel.com>
References: <20241016105950.785820-2-andriy.shevchenko@linux.intel.com>
 <Zx9uSIWOwTgclmBF@smile.fi.intel.com>
 <CAK7LNAS1xg2CLvTB-9dwGikAGNZRFOhknE_sbkxqyw=f6BNNog@mail.gmail.com>
 <Zx-MLAyyNWiQg-sq@smile.fi.intel.com>
 <77eaee7a-4544-01e1-44b9-9173e670679f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77eaee7a-4544-01e1-44b9-9173e670679f@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Oct 31, 2024 at 04:39:53PM +0200, Ilpo Järvinen wrote:
> On Mon, 28 Oct 2024, Andy Shevchenko wrote:
> > On Mon, Oct 28, 2024 at 01:49:52PM +0100, Masahiro Yamada wrote:
> > > On Mon, Oct 28, 2024 at 11:58 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Wed, Oct 16, 2024 at 01:59:51PM +0300, Andy Shevchenko wrote:
> > > > > Rework Makefile to add 'intel' prefix to the modules automatically.
> > > > > This removes a lot of boilerplate code in it and also makes robust
> > > > > against mistypos in the prefix.

...

> > > > > v2: fixed obvious typos (LKP), Cc'ed to Kbuild ML (Ilpo), dropped RFC marker
> > > > >
> > > > > Note to Kbuild people: TBH I rather want to have something like this
> > > > > to be available on the level of Kbuild for any of the subdirectories
> > > > > in question.
> > > >
> > > > Anyone, any comments on this?
> > > > This already passed a CI tests without failure so far. Perhaps it's good
> > > > to apply to show the demand of such a feature in Kbuild in the future?
> > > > Because I want to do the same for various */tests/ folders where we have
> > > > tons of test*, *kunit modules effectively duplicating the folder name.
> > > 
> > > I do not like what you are doing here,
> > 
> > That's why the question is to Kbuild if it's possible to have this feature
> > available treewide for users in a form that you like?
> > 
> > > but it is up to you whatever you do in Makefiles you maintain.
> > 
> > Thanks! Ilpo, what do you think about applying this in its current form?
> 
> I applied this patch now to review-ilpo branch. Hopefully we'll one day
> have a generic mechanism for this but until then this will have to do.

Yeah, that's what I want to have as well...

Thanks!

-- 
With Best Regards,
Andy Shevchenko



