Return-Path: <linux-kbuild+bounces-13209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLGqAhI4CmoLxwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13209-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:50:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F72564146
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 23:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A0053004263
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 21:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C9B3264FF;
	Sun, 17 May 2026 21:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7CqxgsP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38C548EE;
	Sun, 17 May 2026 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779054605; cv=none; b=CwuWI+1XdqhHs/wYLaiREa15ZYBJZEJzv50Vdx64Spb6jJRG2Ckghfs6i1MKvNzjibjVKRTDRPiEruRGw3EpAEcUUSN73OBdnAmpDoUncVxx0EjyOOuzYBsTEWUqIlFOAW+kiJtH4SUq7yHlgTgYESHo1IWvtQ+oDJ1X5hajybI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779054605; c=relaxed/simple;
	bh=t37Dk8fj4QBF5EQz+smB8MADrU5icFYGLnT6FJ/aTCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8kp8rhb55Rockdkl6wZbK61U1yVzo0I/ZfZeFhIuhf20+O40VXRFYe6S91WwFdc9eYC4qAaGFifunhGyyBLk/SHjONs6nFkae/EVViLlr4m4DpZ9TQgSVTsoX8o+RBy3Xaky/lYypriWWcyxrx24yyZRbwU1kr6+nP+EeUoXNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7CqxgsP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB19C2BCB0;
	Sun, 17 May 2026 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779054604;
	bh=t37Dk8fj4QBF5EQz+smB8MADrU5icFYGLnT6FJ/aTCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7CqxgsPNFB39/DiPVXFw4gJ2CbJNJ29k0G7j70J8RRBgffGlb3QDM6x4ghwR3Sl3
	 gGaqxMliQYptLjo7B8jkovu1hRNTAeeWpUS02A7L1P7OvmJd5SZFcaS8HBoSNzuHll
	 NwVeU8/LrNTtJbRwp4X00ld3bIRSXZnPeI9l9uGqHnJbcqQPv4stOnMgLpR+gNIaPI
	 sPx58QVujXRTr6uIMBnMVDcy8KovMuLgNSd7KH/f8HM2+3GmFXToswD09Aw9fvuD5E
	 8Z1DQE2IhABX8HdM9tl2sqkEeeumnhkzhJzwd7Zey72Dmpp4Nopkw4B7qx/hJyfcTv
	 GSHvx9IHDUiOg==
Date: Sun, 17 May 2026 11:50:00 -1000
From: Nathan Chancellor <nathan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Schier <nsc@kernel.org>, Andrew Jones <andrew.jones@linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: add kconfig-sym-check static checker
Message-ID: <20260517215000.GA1202663@ax162>
References: <20260513210329.637892-1-andrew.jones@linux.dev>
 <177876553250.305249.17848321995033732158.b4-review@b4>
 <agdvF1g0jSp3A6EP@levanger>
 <20260517042607.GA1534263@ax162>
 <aglc1wxyLtEWX2qW@ashevche-desk.local>
 <20260517091128.GA3773662@ax162>
 <agmRSOEqwmgGJH_K@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agmRSOEqwmgGJH_K@ashevche-desk.local>
X-Rspamd-Queue-Id: 75F72564146
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13209-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 12:58:32PM +0300, Andy Shevchenko wrote:
> On Sun, May 17, 2026 at 06:11:28PM +0900, Nathan Chancellor wrote:
> > but I
> > am not sure that it is an obvious one in the grand scheme of things.
> > 
> >   $ hyperfine 'git ls-files "*Kconfig*"' 'find . -name "*Kconfig*"'
> 
> Does this makes caches cold before *each* attempt?

No but if I do so via the '--prepare' option, I see a similar
difference.

> >   Benchmark 1: git ls-files "*Kconfig*"
> >     Time (mean ± σ):      24.6 ms ±   1.0 ms    [User: 18.0 ms, System: 6.1 ms]
> >     Range (min … max):    20.5 ms …  28.7 ms    120 runs
> > 
> >   Benchmark 2: find . -name "*Kconfig*"
> >     Time (mean ± σ):     222.9 ms ±   4.5 ms    [User: 80.6 ms, System: 140.1 ms]
> >     Range (min … max):   216.0 ms … 227.6 ms    13 runs
> > 
> >   Summary
> >     git ls-files "*Kconfig*" ran
> >       9.06 ± 0.43 times faster than find . -name "*Kconfig*"
> > 
> > But I don't know how complicated such checking is in Perl, so I would be
> > willing to see what it looks like.
> 
> 1. Call `git ls-files`,
> 2. if the above fails, call `find`.
> 3. `find` never fails (okay... :-)
> 
> In any language it shouldn't be much code.

Yeah, I guess I would look for '.git' before calling 'git ls-files' but
that should work as well. It's up to Andrew.

-- 
Cheers,
Nathan

