Return-Path: <linux-kbuild+bounces-8743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A2B45D50
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 17:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28967179B8D
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 15:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2637A31D74E;
	Fri,  5 Sep 2025 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3BLjbQ+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACD931D72E;
	Fri,  5 Sep 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087956; cv=none; b=S3bs/iDDQOhvrJwqepBCZmo4EL2OaBmkH1YapROYpRtrvYHqumQDdfDvzPH4hP3rGzAUmGYCGTMCNxmteFcem2c9VaGyvled9VJbsDmrnFDLo+WtQwQF9jTILfIhrzQpJXDSoxBJXRLWXNnZ2iMJ3XXBhodnFJyaujgDcHIzZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087956; c=relaxed/simple;
	bh=eSR4TUXkvx/9lqvlUc87GuT3m88dAjDqGBb9KS2uelY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WESsFAxkMMrQwX67TSccUWTz7vQ9GbXt5raqzYoJCGw0OJBzInMSiNvzsP7fSboYAqWjjKnkdoxLXmw0Yx/rSXm7UMF6RFpEc+5y2Blp5DawJRlEX5hgSz2LSsV20FmqGgo7WDVqmaNoqJ9dCvtkcTMpoLOEClSsljg54pqDtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3BLjbQ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77101C4CEF4;
	Fri,  5 Sep 2025 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757087955;
	bh=eSR4TUXkvx/9lqvlUc87GuT3m88dAjDqGBb9KS2uelY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3BLjbQ+8OkT8qvpn4s3NSjeQidQ2M7anZICert5+EGY0zu8wPr2u7XU4+cBjW5Wu
	 fPY7IePrZr1wkXMOCb/t0Uz0Fg1tca/5mDSGiL1TRE/W0hfBy3W0E1a95UwZpYIMGX
	 8qgOrhFeWJwLSMl+4KH8IAHcWVt9K2k4JraCMY6qo9VdtBNHhO/4NulSKIIgMElOOJ
	 TuA8jWLgtBUs63qB4o4HWd0USFli9kZY6eBz+qDgWUK3rZ1dB7xPd7XO5hNDIYVasy
	 QvK0lGpOdbnNHOL8bE9ZRiCrQ6KPzE+i4MuKwNear/aScZbMezE4aKLronoh52A4fp
	 PPiqX70ygaAag==
Date: Fri, 5 Sep 2025 08:59:15 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <202509050856.E5D810BC@keescook>
References: <20250802184328.it.438-kees@kernel.org>
 <20250803173235.GA716998@ax162>
 <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>
 <20250805214823.GB200407@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805214823.GB200407@ax162>

On Tue, Aug 05, 2025 at 02:48:23PM -0700, Nathan Chancellor wrote:
> On Tue, Aug 05, 2025 at 04:50:28PM +0200, Alexander Lobakin wrote:
> > From: Nathan Chancellor <nathan@kernel.org>
> > Date: Sun, 3 Aug 2025 10:32:35 -0700
> > 
> > > On Sat, Aug 02, 2025 at 11:43:32AM -0700, Kees Cook wrote:
> > >> With the few remaining fixes now landed, we can re-enable the option
> > >> -Wunterminated-string-initialization (via -Wextra). Both GCC and Clang
> > >> have the required multi-dimensional nonstring attribute support.
> > 
> > [...]
> > 
> > > diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
> > > index 55a1a96cd834..05d4323c6a13 100644
> > > --- a/drivers/net/ethernet/ti/netcp_ethss.c
> > > +++ b/drivers/net/ethernet/ti/netcp_ethss.c
> > > @@ -771,7 +771,7 @@ static struct netcp_module xgbe_module;
> > >  
> > >  /* Statistic management */
> > >  struct netcp_ethtool_stat {
> > > -	char desc[ETH_GSTRING_LEN];
> > > +	char desc[ETH_GSTRING_LEN] __nonstring;
> > 
> > 
> > Hmmm, ETH_GSTRING_LEN is the maximum length of the driver's statistics
> > name to be reported to Ethtool and this *includes* \0 at the end.

This is not true. ethtool uses non-C-String logic to report these values
in userspace. These are _not_ C-Strings -- they're NUL padded to
ETH_GSTRING_LEN, so some drivers _happen_ to use C-String APIs, but
they're "wasting" a byte.

> > If this compilation flag triggers a warning here, the driver devs need
> > to fix their code. There should always be \0 at the end, `desc` is a
> > "proper" C 0-terminated string.
> 
> Ack, I had misunderstood a previous fix that Kees did for a similar but
> different instance of the warning in another Ethernet driver and I
> did not look much further than the driver copying these values around
> with memcpy(). This does trigger a warning, from the original message:

These don't need to be renamed -- they just need to use memcpy instead
of C String helpers.

ETH_GSTRING stuff is not NUL terminated.

-Kees

-- 
Kees Cook

