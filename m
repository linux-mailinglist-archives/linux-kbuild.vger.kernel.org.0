Return-Path: <linux-kbuild+bounces-7201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FD8ABF0BD
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 12:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3261BA463A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 10:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33963259CA8;
	Wed, 21 May 2025 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXDFqe+h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC8422B59D;
	Wed, 21 May 2025 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821891; cv=none; b=NQFb4GRVQyo08YyPAwyTWj3+pQFxHwtHNI3tGGQUBghb3hYu5vWYf+H0JCfNyUzMjJPrAiz7rk2gGnAtmJhh2XoyKvkaeGzyBhXEP2NTfE/8mN3hvtCdywuaWa6bhpuPc2h/noRDR3uZHrVy6lW33T7p/H67zL7SH7kPzwn7ZfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821891; c=relaxed/simple;
	bh=vS/+CTtAxwz4y5synzPvLNW2wyjb4MRW5uQRuO6Y8rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKR1L+MTSwQIW+Yp/NnIrcKqbDNnC4AUsPJGkFBqTOVzDWSSp3SBchPoitKCXsowmhQQSjDLqMbyV/bfYh0+CTD+b2wHwfjqNnFoJXgf57Et/8aLXv7D0dxcOxXdNxLvDV3kU9T4fOoifT00i6BYkcr0o1eV7eGyxMSI0g9YcHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXDFqe+h; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747821889; x=1779357889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vS/+CTtAxwz4y5synzPvLNW2wyjb4MRW5uQRuO6Y8rk=;
  b=EXDFqe+huKSq3+YzwunSOrBmWjzov53z75CG4jLZ/D42jXDIfg8h70rj
   oTN/g+L+nSzozocrws/fwrxJPHpDmZm+irqq7N1JtvglZCSpJxhjWHne8
   m1xUePiETAi3KG4TQfPNGcUWtWjMWcA0baD33uytOUzklNMSRbUWe/ntG
   pcYMAbMjqdSVEiaKN6Vfi1B3rNUmjRnHgyZqriKEeOAeBTrr98vMMkEvT
   la7BkRu4iQ+UHF2fP2Ei6fL94nr0JVtOo9OblZ1JKYMJJvEjCpgyrUUdQ
   5h8IbMBmkl2zEs8zx3SmR7g+l/C4q2HGhrSW0a2YDPDRfVgc6QkIYBr/o
   g==;
X-CSE-ConnectionGUID: XFNIBfztRPiCbMHPC1Hv3w==
X-CSE-MsgGUID: cxDjEG7wS3m35VCEFqBNHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="72310778"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="72310778"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:04:48 -0700
X-CSE-ConnectionGUID: OynbmfR/QG+ZTFFoHm4ydg==
X-CSE-MsgGUID: nXHpVQeXTpuHGq8bWViLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="170865893"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 03:04:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHgJX-00000003a8o-1UET;
	Wed, 21 May 2025 13:04:43 +0300
Date: Wed, 21 May 2025 13:04:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	linux-doc@vger.kernel.org,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Some kernel-doc fixes
Message-ID: <aC2lO7g_x6oTLYDA@smile.fi.intel.com>
References: <cover.1747817887.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747817887.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, May 21, 2025 at 11:02:12AM +0200, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> That's the third version of the kernel-doc fixup patch series.
> 
> It address the root cause why Sphinx logger was not working: there
> was a call there for logger.verbose(). According with:
> 
> 	https://www.sphinx-doc.org/en/master/extdev/logging.html
> 
> This is a valid call, but it doesn't verbose messages. Instead, it is
> crashing with modern Sphinx versions, causing the log to not work.
> 
> I got rid of it, replacing by logger.info().  I took the time to also
> address an issue pointed by Andy: not having the same log message
> placed everywhere. With such change, we can keep using Sphinx
> logger (which produces colored messages) inside kernel-doc
> classes.
> 
> With that, we have:
> 
> Patch 1:	makes Lore and kernel-doc ML receive patches related
> 	to kernel-doc.py and get_abi.py.
> Patch 2:	cleanup try/except logic and get rid of logger.verbose();
> Patch 3:	fix a KeyError when trying to acess data from non-existing files;
> 
> If you test just patch 1 on the top of next-20250516, you'll see the
> keyerror message (in red):
> 
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	WARNING: kernel-doc './scripts/kernel-doc.py -rst -enable-lineno -export ./drivers/gpio/gpiolib-acpi.c' processing failed with: KeyError('./drivers/gpio/gpiolib-acpi.c')
> 
> And the script doesn't crash anymore. After patch 2, the try/except
> warning gets replaced by a proper message:
> 
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	ERROR: Cannot find file ./drivers/gpio/gpiolib-acpi.c
> 	WARNING: No kernel-doc for file ./drivers/gpio/gpiolib-acpi.c

Sounds reasonable to me.
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



