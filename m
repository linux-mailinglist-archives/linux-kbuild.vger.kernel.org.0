Return-Path: <linux-kbuild+bounces-13202-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N1VKFWRCWrIfwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13202-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:58:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 691245605B8
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 11:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6CD430041E3
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 09:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E7E351C28;
	Sun, 17 May 2026 09:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIneNqOQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE591348866;
	Sun, 17 May 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011918; cv=none; b=WUvNIFNGyya5UBT+TwH88gblVQzyfzOD51x0vbQyoz6Esk4kY0r8U7UookdCY8q1AAFT+F3lMbzp/aioWxPTiDbHTQHVtOSLCKSyiAVC3knyh7aSYvGTtz0wwQCB+q1EaJ9o7IxV0g1i4AXEBFVriHt6zn+XvCrq6TJn0nZzcLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011918; c=relaxed/simple;
	bh=uxrJBoBs/OUJH9MjR2XbmepwO0id9oMEQLa981zUw80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OHQNDbs4BA+0GTvDEjztiM62W+wIRN7A2DVY9yeOx9f74o2h9nlTd5cEqmdBv0GMvDLgG84ZJHq1dwycbOEcZOUR961z5coyEk49DO+sZaNox8LEGge1iRhEKS9ms/vUP3xEEVWo6JXyS9F9BEedNBFkwV3ddQTaAW2/+VUYv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIneNqOQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779011917; x=1810547917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uxrJBoBs/OUJH9MjR2XbmepwO0id9oMEQLa981zUw80=;
  b=HIneNqOQ4+NOpjNE3gb8N7jYYRYfSx30ClyBtlVXkb8jzgbsvHMFa3D1
   H6DKDNRQvldY2nkIODW1XNDucsxbG81N5T5HURZo7FUIjbQ1G9BPk4WIh
   OnEKI40kNISCnvZkiL2cydekgRxIdOAY5Qbf+neujprpLAajkOtrKRVgO
   dx6fFAz12A32Hhj7bevAHFDLXHzuP1CL5x6nOD33CEgUcGeOxTZMBTxCe
   gMsD4vd74Q30hfD/20nV75ouLyw9xb/Zm+Ug7IQlAd7K8e3xC7CMJttF6
   1FS0FoK2kdR3eeGOMG9WQxKYDOlp3fjsACdGoPklLRMwpQyEQExl4uYaS
   A==;
X-CSE-ConnectionGUID: oe6h6w6YSNuBYXDid1SGRA==
X-CSE-MsgGUID: jIahIpX5QL2gmwlbq/1jsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79938284"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="79938284"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 02:58:37 -0700
X-CSE-ConnectionGUID: +CTXMtoeT56/CyUc1nbBFw==
X-CSE-MsgGUID: jFn42dyiR1CQZDO5Qmk3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="239242406"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.182])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 02:58:35 -0700
Date: Sun, 17 May 2026 12:58:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <agmRSOEqwmgGJH_K@ashevche-desk.local>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
 <agdvF1g0jSp3A6EP@levanger>
 <20260517042607.GA1534263@ax162>
 <aglc1wxyLtEWX2qW@ashevche-desk.local>
 <20260517091128.GA3773662@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517091128.GA3773662@ax162>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 691245605B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13202-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@linux.intel.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ashevche-desk.local:mid,intel.com:dkim]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 06:11:28PM +0900, Nathan Chancellor wrote:
> On Sun, May 17, 2026 at 09:14:47AM +0300, Andy Shevchenko wrote:
> > On Sun, May 17, 2026 at 01:26:07PM +0900, Nathan Chancellor wrote:
> > > On Fri, May 15, 2026 at 09:08:07PM +0200, Nicolas Schier wrote:

[...]

> > > Ah yeah, that is definitely worth keeping in mind for the future. I feel
> > > like 'find' is not "more complicated" than 'git ls-files' in this case,
> > > so I will assume that such an objection would not really hold here
> > > (especially since it would help people with development of fresh Kconfig
> > > files that have not been committed yet). If we did want to rely on 'git
> > > ls-files', we should at least error gracefully if we are not in a git
> > > checkout.
> > 
> > Can we do both depending on the environment (if we are in Git, do that,
> > otherwise fallback to `find`)? `find` uses FS, while Git uses index, which
> > is much faster.
> 
> It feels like that starts to get into the complicated territory for
> little gain, considering there is indeed a performance difference

I tend to agree, but it depends on how complicated the things really are if
implementing both.

> but I
> am not sure that it is an obvious one in the grand scheme of things.
> 
>   $ hyperfine 'git ls-files "*Kconfig*"' 'find . -name "*Kconfig*"'

Does this makes caches cold before *each* attempt?

>   Benchmark 1: git ls-files "*Kconfig*"
>     Time (mean ± σ):      24.6 ms ±   1.0 ms    [User: 18.0 ms, System: 6.1 ms]
>     Range (min … max):    20.5 ms …  28.7 ms    120 runs
> 
>   Benchmark 2: find . -name "*Kconfig*"
>     Time (mean ± σ):     222.9 ms ±   4.5 ms    [User: 80.6 ms, System: 140.1 ms]
>     Range (min … max):   216.0 ms … 227.6 ms    13 runs
> 
>   Summary
>     git ls-files "*Kconfig*" ran
>       9.06 ± 0.43 times faster than find . -name "*Kconfig*"
> 
> But I don't know how complicated such checking is in Perl, so I would be
> willing to see what it looks like.

1. Call `git ls-files`,
2. if the above fails, call `find`.
3. `find` never fails (okay... :-)

In any language it shouldn't be much code.

-- 
With Best Regards,
Andy Shevchenko



