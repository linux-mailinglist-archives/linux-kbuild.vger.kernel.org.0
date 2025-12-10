Return-Path: <linux-kbuild+bounces-10048-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF8CCB341C
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 16:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76C66303DD19
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F3F3043B4;
	Wed, 10 Dec 2025 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXEzYG+S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A75273F9;
	Wed, 10 Dec 2025 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765379267; cv=none; b=WUq3lCctxyUMC108b3MSuDr41SefDrkjslIEIObdTVvB2Tr2t3ibaYQxXD0AleRqXXxxVMpKBC1FQbKa/qtrLhDBcfI8YfsGd0rl8WRF4QD41ceM0LagMv6WRJ+WOX9RdydQtHx8R3DnXh+VPf0cyz69dzeKWT+qbVKBCW7tZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765379267; c=relaxed/simple;
	bh=17xZlvkUXXHzNJZd4GeJRilz36tlFCvDgKcKsA+LsIQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K/a2oS38Yxh8Mf/XBNK2N/qC20EiTtYMSPm9uJVwZrD7C23AG8/pFVwmVfgwbwUGFxp5kYcVJb17bk+XTy8+4eupuTI+LyI1iabvNmKri69RF7beDiZjujdcmQWDCtCLgWvHYfuGiLGjrTg4V5TMiFWKL23T3ReurDpiLr4Z7c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXEzYG+S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765379265; x=1796915265;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=17xZlvkUXXHzNJZd4GeJRilz36tlFCvDgKcKsA+LsIQ=;
  b=XXEzYG+Suhcw6TkVV037029qlLf8x9prHmYi5O/6VvjGZRl5aO3B42kC
   tAmyHWC9yMdtZviIU0Ih4ZzOKebPn080jk7TV2bCIHNpLQ2mA3jp9Sn6u
   lGed30SIw8qlzcgvqr6XLxfRtXZETYGSUO//ZXAc5U9bYvaSYVLhQVf3r
   sFHJGTPfdqXwLkrl0UsE7lmMYA+fWOQiVgLgJ6y4lWcdJuc//NU2bTnsL
   Y69KK3JIDljMSiC3tndFahFgmQdcxfQODPuJbOWApGvM0xT1Rix+ZOT26
   T5bXvYHDgo/MdHTgYqaf6fjYHRrAta86VQ2mmra9X1nrh9Yc1vOi2QYhD
   g==;
X-CSE-ConnectionGUID: nyY4Bg+tT/i+f9S+2ly6Yg==
X-CSE-MsgGUID: OkCNY7HqRpipOp7ChY5TLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67238082"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67238082"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 07:07:45 -0800
X-CSE-ConnectionGUID: oRy5so8fRfKPZ1O/bwi4lg==
X-CSE-MsgGUID: WLTa0OqqQM6JQ9KR1wR82g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="195800782"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.207])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 07:07:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Graham Roff <grahamr@qti.qualcomm.com>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre
 <nico@fluxnic.net>
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
In-Reply-To: <20251205182334.GB3974306@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
 <20251205015352.GA2060615@ax162>
 <b4be7637-9446-47d0-9a8c-3fd0f55a27b9@app.fastmail.com>
 <20251205182334.GB3974306@ax162>
Date: Wed, 10 Dec 2025 17:07:39 +0200
Message-ID: <1f2376e39dc46772e630e2cc9f9b40a2ef20993d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 05 Dec 2025, Nathan Chancellor <nathan@kernel.org> wrote:
> On Fri, Dec 05, 2025 at 09:01:51AM +0100, Arnd Bergmann wrote:
>> This is the bit that frequently confuses developers with the
>> current syntax, and I agree it would be nice to have a better
>> way,  but I'm not sure the proposal actually helps enough to
>> warrant a mass-conversion of existing Kconfig files.
>
> I do agree that the 'depends on A || !A' syntax is confusing and that
> this does not really address that but I think that is besides the point
> here. I also agree that it is probably not worth converting existing
> users to this syntax (unless there is solid reasoning), I would not want
> to see cleanup patches of that nature, just use in new code.

I think "depends on A if A" is an improvement over "A || !A". But not a
drastic improvement.

I think the question is, can we figure out an even better syntax for
that use case? Something that conveys the "optionally depends on A"
meaning? Is there something so good that it would warrant cleanup
conversions just for the improved clarity?

If we can't come up with anything, let's just roll with what we have
here?


BR,
Jani.

-- 
Jani Nikula, Intel

