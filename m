Return-Path: <linux-kbuild+bounces-9548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9EBC4C14A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 08:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076DB189B410
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 07:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5663491CD;
	Tue, 11 Nov 2025 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gP9Y1QBi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EAD3446A3;
	Tue, 11 Nov 2025 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762844823; cv=none; b=fuuHhmgh9/FPG6XKLo99+qJfSCQRRbqgcjoBsd+AGALkhWwTXsuBd1bfD7Sz4gjqiLDY8nEAe03YlFVoVSjkctO1UBW8HFq0VfKlsgCFV5HC9e9rAzCIx7bvIqEBmR2odqNSracPhFDpydcKHaUPdXL4GSKXYFyslV4EPPh6csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762844823; c=relaxed/simple;
	bh=fEVLyoHERpbLkNGNixCQ4TJv8vApe1EZElDIqlwTkEc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MM4dDzLRqIXNMdtTG21AOKOO8YYaFGllyRwGqCjpNhMeib7AJZvaSsNNteb6IICne2wTj51f1Ki0Ehfr4y52LCskWl2HPh3OITgLbTx84zprS08+0NEzZYyzr59Z2cz0mu1Tl4ED0AZFWUWErsQmBuBoc0BWoXUVjJl9/TJiMLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gP9Y1QBi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762844822; x=1794380822;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=fEVLyoHERpbLkNGNixCQ4TJv8vApe1EZElDIqlwTkEc=;
  b=gP9Y1QBiWH+n9QhtE0rNE0cbOqDquZG2p3p+EDEUMW5DdzSJIwZkPCrt
   sZ66a433n82dLqnBpjIduLSTVIVj4SIq2FybK1tHR3QwFI0MllS2FgmuO
   cvuvVhgGLGDoBQfrK9SfAE4iPjbUr6ScLOKLtpq+o8uj5SMeTRbSld4Sm
   5hfMZ7RFuLAnJ+ADoHf5B/8lSmzJBIz1bL2KVBOEd/gldMdmKqrp+btrL
   DwXxFjRIbEa1pb7dM/SFP4+cn2YgyZNMfPCOy/taSw6gSHkbhDSf3Mh5r
   JulnAcTKyEkjQgIS1pWR5MtdMK92LbvrGczhX02xRLdsqriHJUq6yguJ0
   A==;
X-CSE-ConnectionGUID: or7G79X6SSmKltVGVuoyog==
X-CSE-MsgGUID: lXaxC92ESIKPhZOyytl8nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64110566"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="64110566"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 23:07:00 -0800
X-CSE-ConnectionGUID: ElOUZcYgSHeHp5zM4vAvQg==
X-CSE-MsgGUID: A9sdPkNGSimlf/QVpoAykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="193009436"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.239])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 23:06:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Graham Roff <grahamr@qti.qualcomm.com>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Pitre
 <nico@fluxnic.net>
Subject: Re: [PATCH] Support conditional deps using "depends on X if Y"
In-Reply-To: <20251110211549.GB302594@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251107-kconfig_conditional_deps-v1-1-aff22199ec0b@qti.qualcomm.com>
 <20251109232922.GA2977577@ax162>
 <82317993284703834a7b1d8d5ca05b7c646f2795@intel.com>
 <20251110211549.GB302594@ax162>
Date: Tue, 11 Nov 2025 09:06:54 +0200
Message-ID: <e5ef3c59bc100cb44adae6ef624da83af8bce299@intel.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 10 Nov 2025, Nathan Chancellor <nathan@kernel.org> wrote:
> On Mon, Nov 10, 2025 at 10:48:59AM +0200, Jani Nikula wrote:
>> "depends on A || !A" (or A=n) is the most common pattern in Kconfig,
>> which literally means "depends on A if A".
>
> That is totally fair, I did not try to actually search for the idiom. I
> will say I do not find that either expression in Kconfig easily
> translates in my head to "this dependency must be built in if the symbol
> is built in, modular if the symbol is modular, or disabled" but I guess
> that is just lack of familiarity with these idioms. I just want it to be
> obvious to folks writing Kconfig when something like this is appropriate
> to use but I guess with that being the most common usage in the tree, it
> is fine as is.

Right. I guess it takes a while to get used to the idiom A || !A. But
then is it counter-productive to add an alternative that is apparently
not much more helpful? And then we have two ways to express the same
thing.

So the follow-up questions:

- Can we come up with a more obvious alternative to the specific case of
  "A || !A"?

- Can we have examples of conversions from "A || !B" to "A if B" in
  kernel Kconfigs? As in, don't add features without users.

My point is, there are like 10x more "A || !A" than there are "A || !B".
Feels weird to advertize and document the thing for the latter, when the
former is the more prevalent case.

$ git grep -E "depends on .*\b([A-Z0-9_]+) \|\| (\!\1\b|\1=n)"

I'm not at all opposed to the change per se.


BR,
Jani.


-- 
Jani Nikula, Intel

