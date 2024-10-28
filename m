Return-Path: <linux-kbuild+bounces-4363-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E01359B2E45
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 12:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D94E1C21FD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2024 11:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6E01DD88F;
	Mon, 28 Oct 2024 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbvh8JFn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC91D5CD3;
	Mon, 28 Oct 2024 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730113104; cv=none; b=O0XcW48XNQ10gtiuTcWctGXUz1y8QiEJswBg6EfQJgqy0BMHH5km2gkXPMNf2HIX+O6Shf0ShhNjMT6/qQiwvUenwD5TKzGMEkN2GAZejBaKl3LbnzMXWkZbyIYaw03i84MoHHYqpKjzLzGs+H4m41qUfcnPo3DrOUrNslEDR+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730113104; c=relaxed/simple;
	bh=B+KjeCsXxwZWAdYZAfeBkrJopsMVECXbceBduFTZdBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFup0qeaUZgnTNwb4asumUM24ttYmomuM9E1HT+nvC7K9dVK3DaIgvldB+ggDuvawf3oUpwfuXq8CDjLL4H4A/xmpCdSygEzFcIKWmVt8Z14xCYZPcI3H01+zSx/IDw3O6f7LdXGJT0gaD/Jn2xXyK6nZ8j3LFs62O4U+8tMDUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbvh8JFn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730113103; x=1761649103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B+KjeCsXxwZWAdYZAfeBkrJopsMVECXbceBduFTZdBk=;
  b=dbvh8JFnS2TeVGGFcYfZfzq868arHq2i0XyflNtZMSbyy5nFABgeilV1
   W2lG5h1xXzdG9eSbc3v6Y1sRaMwbnq7quTRTpdEcuoqUlhbVbzO+yH6+M
   IjK+y5cf6HzVbGGAsLSZ6ridJfvKW7dCRTOA+OGYU3bSnShIDIhzg7GIG
   FtcDmMXxA3XfHsIeJKdtPAomuprnrFJY2j6VQ7D7w1Ti9y1gNafp3bTWf
   Yl+5Cxc8LY9LC36RyuhliHf2J8y0sGkjfpAiDqX9pYY+tryrSTzQ3zhqk
   /4hM+XLrOnGWUQM4zsSFIlcTos6qaUWeJOuxa1KC9f6YEAmLxAyW6zJqY
   w==;
X-CSE-ConnectionGUID: ne4ExaFKST+6AABoprM5xw==
X-CSE-MsgGUID: jVgCX6UeR+aPpd4RrjVNtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52256479"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52256479"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 03:58:22 -0700
X-CSE-ConnectionGUID: D8J/N7OAS3WvSVWALB/CTw==
X-CSE-MsgGUID: /Q08lrUJQWOtM1NvI4edKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="86158696"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 03:58:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t5NRw-00000007v9B-3Yr3;
	Mon, 28 Oct 2024 12:58:16 +0200
Date: Mon, 28 Oct 2024 12:58:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Gow <davidgow@google.com>
Subject: Re: [PATCH v2 1/1] platform/x86: intel: Add 'intel' prefix to the
 modules automatically
Message-ID: <Zx9uSIWOwTgclmBF@smile.fi.intel.com>
References: <20241016105950.785820-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016105950.785820-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 16, 2024 at 01:59:51PM +0300, Andy Shevchenko wrote:
> Rework Makefile to add 'intel' prefix to the modules automatically.
> This removes a lot of boilerplate code in it and also makes robust
> against mistypos in the prefix.

> ---
> 
> v2: fixed obvious typos (LKP), Cc'ed to Kbuild ML (Ilpo), dropped RFC marker
> 
> Note to Kbuild people: TBH I rather want to have something like this
> to be available on the level of Kbuild for any of the subdirectories
> in question.

Anyone, any comments on this?
This already passed a CI tests without failure so far. Perhaps it's good
to apply to show the demand of such a feature in Kbuild in the future?
Because I want to do the same for various */tests/ folders where we have
tons of test*, *kunit modules effectively duplicating the folder name.

-- 
With Best Regards,
Andy Shevchenko



