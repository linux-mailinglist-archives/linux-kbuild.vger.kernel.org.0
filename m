Return-Path: <linux-kbuild+bounces-7173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94097ABDC6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 16:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA2661BA3208
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 14:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C7F252909;
	Tue, 20 May 2025 14:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5QbyuDy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B29922D787;
	Tue, 20 May 2025 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750684; cv=none; b=JlV/cuHTYcJB85q5e6a0hMyLb9sJeGuAE4XwZXa9LKeDuxt6T/KLOe8/vGXgpAVLjwxM4cTOAichL/D9s+eWaV1xFzMLqEyhYWj1hOZZLzbxqOPUxQTk5kOgVfvdDryrLM2Qgxd0uwaBvtZZ6N5+EEOPRfQm2PvlsCssBzu3bcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750684; c=relaxed/simple;
	bh=eC9fXZcLgrkduXdrhf8gr0JxS85xyQcb+dyW51Km4ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uEXyMNaSjood0S+KWRenHgkjP8zEBjJO+X+GtB15kR2IjJ31DrXQQcQ2cZ+lpE6m/s76dkjhJrNJLFSIY+d2NFi06MVsX5eUypAKIjjMYvNdZNcKtgEFUKjPPGOPBKT8NIklFAjF7cofWdK41tDJ6ncguauK12q9IBjvQLfHNYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5QbyuDy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747750682; x=1779286682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eC9fXZcLgrkduXdrhf8gr0JxS85xyQcb+dyW51Km4ew=;
  b=f5QbyuDyYOahC1fhG85f5GDegwaONo87Jz/0SRJ/s29uO8CNIJQuZbEC
   hR23OQdA+ra7WbZ+lQHSzLvgqO7PGJT6vcayHIbcPJvbpovedIq6WtXNx
   oUhm9t9iFu5AuHfAp6g+/garPQrjD2h8h/n9vWJrtMcoSQOwhUOQavfP5
   1oshpaK1FiPx+EKzSdTOLZpcPjec6lKB81GWVcYCi9zYHLoZujD8aTzH3
   VZwMp5phDpNd/tdULlLz9klHaID55ArVCS9sm2NQ7AT4SXcoXKGhd18G+
   P1L9FppJJVLBlyQ2ZVVO4GSdq9VyuHIoHhzLArRDhzjjnlC1apJC4qg9Q
   w==;
X-CSE-ConnectionGUID: dVKkDzRyQvy7xu/jb8YyKA==
X-CSE-MsgGUID: xYDeDGlsQcmOx2FmJ9Ox4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49788758"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49788758"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:18:01 -0700
X-CSE-ConnectionGUID: ncukOrUSR32wBqUaLPb9+Q==
X-CSE-MsgGUID: PdX/Vsv5RG2QWonmixk12Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140124486"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:17:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uHNn2-00000003LPE-1FWt;
	Tue, 20 May 2025 17:17:56 +0300
Date: Tue, 20 May 2025 17:17:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Akira Yokosawa <akiyks@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Some kernel-doc fixes
Message-ID: <aCyPFAKhSQIFR_lJ@smile.fi.intel.com>
References: <cover.1747747695.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1747747695.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, May 20, 2025 at 03:33:05PM +0200, Mauro Carvalho Chehab wrote:
> Hi Jon,
> 
> Let me consolidate some patches on a single PR to make life simpler
> for you. Those should address Stephen and Akira's concerns with
> regards to KernelDoc class usage via sphinx kerneldoc.py extension.
> 
> Patch 1:	don't let Sphinx suppress errors/warnings;
> Patch 2:	fix a KeyError when trying to acess data from non-existing files;
> Patch 3:	add try/except blocks to avoid crashes when handling bad
> 	kernel-doc markups;
> Patch 4:	makes Lore and kernel-doc ML receive patches related
> 	to kernel-doc.py and get_abi.py.
> 
> Patches 1 to 3 were already submitted on separate series. Patch 4 is new.

Can we actually utilise CONFIG_WERROR to fail the build. If yes, the build will
be failed. This is in align with the warnings in the C code.

-- 
With Best Regards,
Andy Shevchenko



