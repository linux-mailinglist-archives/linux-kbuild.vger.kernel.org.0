Return-Path: <linux-kbuild+bounces-6730-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70176A99533
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Apr 2025 18:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB69F4463C8
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Apr 2025 16:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AFF284685;
	Wed, 23 Apr 2025 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKlNJc0I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5493279792;
	Wed, 23 Apr 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425908; cv=none; b=NrfWmEKf26H1okRsGcSH4bIxV6axXM4wOaj4ELFGfSI3MfUfkUI/K6KFZ4zSenVq/uRMKl1q7G4opgUFVusujiORCda5EKWYM28HIvhAHdGPDXrlSaCstfCN0p9oF9kdvtGSJVqQ2+fiH7x+FRB8z+3od4O6QuL4z0onsYIS/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425908; c=relaxed/simple;
	bh=rHHe/8RhyPpADAv2wMNhicCGW725SUetgJ9BCqcDqjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn86VGb6Lsn22yaUrR4XQrPCDVxfnUDlTfVkwWWyX2VmI/kL5wf9yl74LZQ1AhERJ0ZvDnCVpLs7TCpYouyMhxZW1QBBtYC6VgYm3amsGwh0V+JCMf/uz4fdrtJXTUKV0XbQAUPb6dDPJc0niFsFcHOHoeW2+8e95QPNXHcHrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dKlNJc0I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745425907; x=1776961907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rHHe/8RhyPpADAv2wMNhicCGW725SUetgJ9BCqcDqjo=;
  b=dKlNJc0IvbmmAyofZ7iTd30HJ5sHFdVdNzx4gw3xxUpopM1s5CKNUDl7
   MTHIsjg8v7jcRg/I+vhTB7lI/85xMkIELks0IuTaezBKOSTarnpMftkkC
   p09LfxsYplpctRMfR+iuiVYuGVLWyCcAoODJzntdkLE0TypqmW8k6ypZm
   wR/YLYYbNf/8JbbAX0HtqdT4aYjBvXvi5VU2fV2CkLp3B9ctHZZEsR/45
   wwb3IH+B4XgBCaAhJB1Qv09iIjjKX96vNZlcTHiEDq0rZbbtgH0fbaw9w
   LJ1P8luN87/uZGms9Dd4zNfyojD0IhRc6cl/HnAopfUfdJfM7UO15Ltfq
   Q==;
X-CSE-ConnectionGUID: YGQPh+OuQA2Ke3+5AZg3YQ==
X-CSE-MsgGUID: Sf6uv61fS7aUY6N5nWX66A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50830447"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50830447"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:31:46 -0700
X-CSE-ConnectionGUID: uLr7sJu1QAGKYY4H1GMrRw==
X-CSE-MsgGUID: Rzl/IukPSwmtIFv8RfavZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137220613"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 09:31:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u7d0a-0000000F7Fm-3nZd;
	Wed, 23 Apr 2025 19:31:36 +0300
Date: Wed, 23 Apr 2025 19:31:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: airlied@gmail.com, corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	masahiroy@kernel.org, mchehab+huawei@kernel.org, mripard@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
	simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
 <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Apr 23, 2025 at 06:30:48PM +0900, Akira Yokosawa wrote:
> On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:
> > On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
> >> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

[...]

> >> > Would it be possible to properly support O= and create pyc / pycache
> >> > inside the object/output dir?
> >> 
> >> I have to confess, I've been wondering if we should be treating the .pyc
> >> files like we treat .o files or other intermediate products.  Rather
> >> than trying to avoid their creation entirely, perhaps we should just be
> >> sure they end up in the right place and are properly cleaned up...?
> >> 
> >> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
> >> should do the trick?
> > 
> > It's not so easy. The Python is written in a way that it thinks it will never
> > runs object files separately from the source. Hence that variable sets only
> > the folder per script as _home_ for the cache. It's completely unusable. They
> > took it wrong. It still can be _painfully_ used, but it will make Makefiles
> > uglier.
> 
> But, PYTHONPYCACHEPREFIX can be set as an environment variable.
> 
> For example, try:
> 
>     export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"
> 
> Wouldn't it be good enough for you?

Of course not. We have _many_ scripts in python in kernel and having a cache
there for _all_ of them is simply WRONG. You never know what clashes can be
there with two complicated enough scripts which may have same module names,
etc.

-- 
With Best Regards,
Andy Shevchenko



