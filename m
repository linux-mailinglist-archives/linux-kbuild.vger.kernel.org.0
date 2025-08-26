Return-Path: <linux-kbuild+bounces-8618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB8B3724B
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 20:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E75864E12BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 18:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475642F0C50;
	Tue, 26 Aug 2025 18:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tw8rO4AX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6B3299957;
	Tue, 26 Aug 2025 18:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756233521; cv=none; b=rZDkr2dYIVWuLrR8Ckt8SeUpJU/MGIcu26X2odVF5553oR3KYVqjFMQStBAhJf/AEf1KOqpvVmCLtMBs/8DQLCPNhQMPLf6/qIYsoZm5TzJ7ULgkxDmLVqzCwBkJm/1O2RsmpUWxBL06rgkDFIBRivUhOjTzSYivUY7VjnP1R1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756233521; c=relaxed/simple;
	bh=I3ZmJOTeI5U0UWdxXYHroNtLPixbix3GWAcILqmBLz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUbHm4i+Qcd3ARKlCU0roowDo1z+q1cH4EW/h3FsBNxPOulnoULcZuvZPy7SMoI8/ntXplz3aTTJm82G2QX3S/4oeQ2BlRMr7VPHwUTETRQ8RF6mu5ZOUdKpAGl+qETdL3YQgzUYRMtlBSlVjLtxqX3o91b1IQv34Njc8h+NHrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tw8rO4AX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05373C4CEF1;
	Tue, 26 Aug 2025 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756233520;
	bh=I3ZmJOTeI5U0UWdxXYHroNtLPixbix3GWAcILqmBLz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tw8rO4AXOfA8dpc65nMg5u/wXw/WAZjn7kZBMuMnXKjSu2lklLg+zuJBg0HchBIZi
	 Kau44OkrJIcWM29VFSkyHhd3KJFHlGO3s0Edom62ZIqdclXPnq18DPzHzpdMReCDa6
	 jCmcTBQznsjABaE1LfJe6J6jUWQH5REodrD28b4wg+1A1YyVFuRRCk9e/5KxBIAvPi
	 zwj7IVEOBv1Rhr0kdDjyAlecRcJWFNgmiqCwi2zI9zG39AE9/ic9xmmiHy6uEQKUkk
	 X3kOdXATrvYUpo4WlCK446VJyIlnIIbl2pMklQeOsQ0tYsTDu6lS2JlMkBLdoeDOgG
	 IKKxtWUtfsC4Q==
Date: Tue, 26 Aug 2025 11:38:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts/misc-check: update export checks for
 EXPORT_SYMBOL_FOR_MODULES()
Message-ID: <20250826183836.GA3422853@ax162>
References: <20250825-export_modules_fix-v1-1-5c331e949538@suse.cz>
 <20250825170710.GC2719297@ax162>
 <aKzFfToXptoHnrxI@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKzFfToXptoHnrxI@levanger>

On Mon, Aug 25, 2025 at 10:20:13PM +0200, Nicolas Schier wrote:
> On Mon, Aug 25, 2025 at 10:07:10AM -0700, Nathan Chancellor wrote:
> > On Mon, Aug 25, 2025 at 05:00:37PM +0200, Vlastimil Babka wrote:
> > > The module export checks are looking for EXPORT_SYMBOL_GPL_FOR_MODULES()
> > > which was renamed to EXPORT_SYMBOL_FOR_MODULES(). Update the checks.
> > > 
> > > Fixes: 6d3c3ca4c77e ("module: Rename EXPORT_SYMBOL_GPL_FOR_MODULES to EXPORT_SYMBOL_FOR_MODULES")
> > > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > > ---
> > > I've missed these new checks when renaming the export macro due to my
> > > git grep being too narrow. My commit went through Christian's vfs tree
> > > but seems the script is part of kbuild (which is currently Odd fixes).
> > 
> > If this needs to reach Linus's tree to avoid warnings, it could go via
> > another vfs fixes pull request with our ack or we could ask him to pick
> > it up directly (as I am not sure we will have a fixes pull request this
> > cycle). If it is not urgent, I can pick it up via kbuild-next for 6.18.
> > I have no strong preference.
> 
> Hm, you're right, the check will issue false warnings (and misses to
> warn when it should) without this update.  Therefore I think it would be
> good to get the patch merged soon - even though the warnings are only
> issued with W=2.

Oh, I forgot that these warnings were downgraded to W=2 in commit
a6a7946bd691 ("kbuild: move warnings about linux/export.h from W=1 to
W=2")... I thought these were in W=1 still.

In that case, I do not think it is really imperative to fast track this
to mainline. We are not and probably never will be W=2 clean so the
presence of new or missing warnings is not a big bug to me. I will apply
this to kbuild-next later today but I can drop it if someone wants to
fast track it.

Cheers,
Nathan

