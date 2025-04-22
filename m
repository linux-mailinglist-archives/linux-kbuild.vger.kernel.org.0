Return-Path: <linux-kbuild+bounces-6720-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1AA96048
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 10:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0577D173061
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 08:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B32255247;
	Tue, 22 Apr 2025 07:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hv5iWqod"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5BF2550CB;
	Tue, 22 Apr 2025 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308664; cv=none; b=MqKebkE+4K3MeiwvJJfjGqFamsxH0slHzUrUTr5Fvr23byQRSYAtA0BlTCriSDvYcrtvFUHoa+/EazWZ9w6RCoAwPmI7193nw6hIIluCrZhvXtxWsxj4ZZrGkY4YK0Ry+Otamx6CAIbtp5mCSsXUSfY7cGzEhCAskYI4dJ56LGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308664; c=relaxed/simple;
	bh=/lTSfM6Y/HISGvvFEVe3OPn45W9JT8OSQOcThg92+mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvpQ4dVsiaGfKvPdmD5X0ALFZgYr9puanPh4fxDz/HEj0GzmHHrTJjW6EfHOFJefjichLVV9Opa1sjRXA+0CHdg+WTB4hLvjHNu+54+ab/xXohjRZ9RXBWNtCee+/5AH2mKVG41e7EzWagzk3tRi1bv0mV4Kc7mQ7QKCKQ96rXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hv5iWqod; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745308663; x=1776844663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/lTSfM6Y/HISGvvFEVe3OPn45W9JT8OSQOcThg92+mw=;
  b=Hv5iWqod06gdT5NsWNoxKFkLSmvCo6uE/yY3jMvI5z52sdWqeNN/fgi4
   c99FZq8X6KLTLUnsYgCmXGISXtT8vV1FlzVFppkh89EU0vThGBnVbeiY2
   Lm5dq8/82d1FCXdMZUqxh4xY+WRxTJhrFSI+5heTU5+pSaTGlx5xtLDcr
   lq5fqK5nEhDsYN7Vjr5tkW3RuQ3ba6VCubYUKCNDHcDCTbjpg5pW0/F1s
   ND8cjTAPSnM/F9LsRxup4H46jtwkrZ0232VycMaRCqrvEh72jR6carr2h
   fG25k/yfLa47rAYyhV/gcZFOo1OsUzOCWS0AaP4XhXEeoVNDxv4ohDpbQ
   Q==;
X-CSE-ConnectionGUID: tq1hDP6ATqOPN26irKqN0w==
X-CSE-MsgGUID: qNsyz1wdRrGUEmtrkVnpqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="45975715"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="45975715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:57:42 -0700
X-CSE-ConnectionGUID: VwpwCzHATKWg4vMQsHRvBA==
X-CSE-MsgGUID: rRtq3f3OR6ypAGEepqkY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="132482014"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 00:57:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1u78VZ-0000000EfNZ-26c4;
	Tue, 22 Apr 2025 10:57:33 +0300
Date: Tue, 22 Apr 2025 10:57:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
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
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
 <87bjspzd4e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjspzd4e.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:
> > On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:
> >> 
> >> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> >> when W=1. Due to Python's normal behavior, its JIT compiler will create
> >> a bytecode and store it under scripts/lib/*/__pycache__. 
> >> 
> >> As one may be using O= and even having the sources on a read-only mount
> >> point, disable its creation during build time.
> >
> > Would it be possible to properly support O= and create pyc / pycache
> > inside the object/output dir?
> 
> I have to confess, I've been wondering if we should be treating the .pyc
> files like we treat .o files or other intermediate products.  Rather
> than trying to avoid their creation entirely, perhaps we should just be
> sure they end up in the right place and are properly cleaned up...?
> 
> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
> should do the trick?

It's not so easy. The Python is written in a way that it thinks it will never
runs object files separately from the source. Hence that variable sets only
the folder per script as _home_ for the cache. It's completely unusable. They
took it wrong. It still can be _painfully_ used, but it will make Makefiles
uglier.

-- 
With Best Regards,
Andy Shevchenko



