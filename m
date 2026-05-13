Return-Path: <linux-kbuild+bounces-13144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG3KH8zwBGr7QQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13144-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 23:44:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1153B27C
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 23:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E62EE3025493
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 21:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F79B3C1412;
	Wed, 13 May 2026 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XX3k/FZm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25943AF67F;
	Wed, 13 May 2026 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778708682; cv=none; b=AMNz7QbwDG28AJcGITEfjSWp9cU9l11uyUPVkgufWWF2n9Ijtq1N9GfFJfv45z29lYPMy+2SnYUI2warS+8k3mDlvx8CYJd2jck9Kalc+moxD3YZsWjNhO9Dovt2GWQc32qbLZ3kYSTkt6rzkB0+tQ+bWdkrtk20xCzn7Yy6bsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778708682; c=relaxed/simple;
	bh=wYzxGTy+44nLLkhiakpJMOtxOhtr2ZTmxdIcqb1/E3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iX+Z8refd4Hj+Iu+Xxem8oFvEIcHCUlwwfiqD+j633hYzOwIfuumP6p/TUxtzskzG3VxEKXqZg1fvCrZXVt+rHok7iWFrPzevcirrtOqa1szBiRVPzHam7emuZfy/yihBkL7ClAGc7/4lRnVvG2s47+7LRBlgf5x4d9cTSJCYJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XX3k/FZm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778708681; x=1810244681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wYzxGTy+44nLLkhiakpJMOtxOhtr2ZTmxdIcqb1/E3E=;
  b=XX3k/FZmB0wm5OlTVm62RweHlOLpu+yy7kj3Jp6PSGqmiM13VL95Q30z
   cDk+LkWJKkPiJOOyyBmyEqjQefCngLlKp7rOSYNvNcGMe42uzVMkVQcz+
   g8DPWC2fj8quwU9zIxxt8vSc24SYdr8vRyahY9geulZaxHl7eAKd9ot96
   mk/0w0bBsVj2GOaMWXEuEva8EZTMH+Qth+UbRcCXDoDK1koMsYHatCac/
   QJSSvJBX2hctGUyJ84WHHd0wKACmcIjQNlQr0i+U7FrcUx3y1e7Y8WrA2
   wrV10fg9AepD3MN+6mppWUAvSKQ+A/wUE3Pw3s/Dn35EybFaL+RWI8f/e
   g==;
X-CSE-ConnectionGUID: JkNF5bEHQNarETw3nLYvCA==
X-CSE-MsgGUID: UIpvRPK3Ru63B7X6PU4AUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="102314840"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="102314840"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:44:41 -0700
X-CSE-ConnectionGUID: fIX4G5DoQ/ifWlcqLsUjxg==
X-CSE-MsgGUID: JIYGGEY1RTWF0Geffvxy5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="238443522"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.244.106])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:44:37 -0700
Date: Thu, 14 May 2026 00:44:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andrew Jones <andrew.jones@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <agTww2dMmZSd25w_@ashevche-desk.local>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513210329.637892-1-andrew.jones@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: E1E1153B27C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13144-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,ashevche-desk.local:mid]
X-Rspamd-Action: no action

+Cc: Randy: FYI.

On Wed, May 13, 2026 at 04:03:29PM -0500, Andrew Jones wrote:
> Add 'make kconfig-sym-check', a static checker that finds Kconfig
> symbols referenced in expressions (select, depends on, default, etc.)
> but never defined via config/menuconfig anywhere in the tree. New
> dangling symbols are reported as errors (exit 1) unless they are
> listed in an exclusion file, e.g.
> 
>  KCONFIG_SYM_CHECK_EXCLUDES=sym-check-excludes make kconfig-sym-check
> 
> The checker also warns about uppercase N/Y/M used as tristate literal
> values following the same logic as checkpatch.
> 
> This new static checker is the script used for [1] with a few
> improvements to avoid some false positives.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



