Return-Path: <linux-kbuild+bounces-9598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBABC53B47
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 18:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCE83503B6F
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Nov 2025 16:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FF2311C1F;
	Wed, 12 Nov 2025 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONiq9J/n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB72D130C;
	Wed, 12 Nov 2025 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762966103; cv=none; b=K8yoONJ96WlAk3Q/ktvhots212ElYcGNoCE+RoUOMVPcLehHGbqcq7h0X2SttK2U/UpAhLF4ZOn5kJqZXGdvkx3ODc+1/tPt9gMaxMzKBcmDSKwVrAdvF2sb3oBDVzx4pDOfcoDOdbBxB9d8/lbWkH6w5c0bZy5SyGwaDdeGqUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762966103; c=relaxed/simple;
	bh=jNXBwcauIctGxZlYI7hnjg2/rQapqiJy1yTJJHRlDGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAxLyoWJ1pdzEKKiacUOX7XW0GTgL/25lO4mQpZOtgvgIpFhgYwlONIUrdfw727kO9UIUE4dmq7l5phgJeGQinvQdtF9a4u36pOy2c2amAswWgtFtx897JrNwnyyJP7H4+sInwf81QLFCDiRFnXWJanYKfYwRxSC81vJfZS0GA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONiq9J/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFDEC4CEF7;
	Wed, 12 Nov 2025 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762966102;
	bh=jNXBwcauIctGxZlYI7hnjg2/rQapqiJy1yTJJHRlDGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONiq9J/nOYCU6JIsjV6en5nGh0WX/LkzKvKhs2tOxHnJZu1BLYUBrLW7EIBnRHqnZ
	 4FSoHQxhcCyhy+XBsZB6lDf2/Bj4kIBQ5WtQ1+uHvBnl+jOt1nEeSujImRug3xm567
	 LMtGvGIk4oDbA4tUk4Yb+6+tI2l2UlYfLlhvSAU6PBwMJR/pyiWfa666NNXxH0caSo
	 rgORdw8NH66/Wc8d9DW/n+pHGysjx6oMdla5IHnxk9x97UrvW7bXx1U6j2MBclLXfI
	 ZN8ODIPV/g5dTzXxnAgTsj4CRlFUs4Vw2b8loiPc9Hn2OBcshgJuYrCdWsgAOvfuEv
	 RWrz8s3sKUduQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vJE17-000000007Kr-3lAr;
	Wed, 12 Nov 2025 17:48:22 +0100
Date: Wed, 12 Nov 2025 17:48:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <aRS6VQCKB7dXGbXx@hovoldconsulting.com>
References: <20251020091613.22562-1-johan@kernel.org>
 <20251022203955.GA3256590@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022203955.GA3256590@ax162>

Hi Nathan,

On Wed, Oct 22, 2025 at 10:39:55PM +0200, Nathan Chancellor wrote:
> On Mon, Oct 20, 2025 at 11:16:13AM +0200, Johan Hovold wrote:
> > Several symbol patterns used to be whitelisted to allow drivers to refer
> > to functions annotated with __devinit and __devexit, which have since
> > been removed.
> > 
> > Commit e1dc1bfe5b27 ("modpost: remove more symbol patterns from the
> > section check whitelist") removed most of these patterns but left
> > '*_probe' after a reported warning in an irqchip driver.
> > 
> > Turns out that was indeed an incorrect reference which has now been
> > fixed by commit 9b685058ca93 ("irqchip/qcom-irq-combiner: Fix section
> > mismatch").
> > 
> > A recently added clocksource driver also relies on this suffix to
> > suppress another valid warning, and that is being fixed separately. [1]
> > 
> > Note that drivers with valid reasons for suppressing the warnings can
> > use the __ref macros.
> > 
> > Link: https://lore.kernel.org/lkml/20251017054943.7195-1-johan@kernel.org/ [1]
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> > 
> > As mentioned above there are still two drivers relying on the "_probe"
> > pattern to suppress valid warnings so perhaps it's best to hold off on
> > merging this until the corresponding fixes are in mainline (e.g. next
> > cycle or so unless Thomas can fast-track them).
> 
> Yeah, if it were fast tracked as a fix for 6.18, we could either use
> that tag as the base for kbuild-next (as we have not take any patches
> for 6.19 yet) or if they are 6.19 material, Thomas could provide us with
> a signed tag or stable shared branch so that we could take this for 6.19
> and have a clean tree. Whatever works.

Daniel has queued the clocksource fix for 6.19 now so I guess we can
just wait until both fixes hit mainline and either send this one to
Linus after that for -rc1 (or -rc2), or just wait until 6.20.

I'll send a reminder when both are in Linus's tree.
 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for reviewing.

> >  scripts/mod/modpost.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 47c8aa2a6939..5c499dace0bb 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -953,7 +953,7 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
> >  	/* symbols in data sections that may refer to any init/exit sections */
> >  	if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> >  	    match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
> > -	    match(fromsym, PATTERNS("*_ops", "*_probe", "*_console")))
> > +	    match(fromsym, PATTERNS("*_ops", "*_console")))
> >  		return 0;
> >  
> >  	/* Check for pattern 3 */
> > -- 
> > 2.49.1
> > 

Johan

