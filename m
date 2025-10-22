Return-Path: <linux-kbuild+bounces-9251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDE4BFE316
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 22:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EA463A5760
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 20:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CFD2FC02D;
	Wed, 22 Oct 2025 20:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPPDAOuU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C99D2FC014;
	Wed, 22 Oct 2025 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761165600; cv=none; b=SyHBnTFTe57IILxV4qd9yZ+Dz2fELRS5HemzWQddHu9/2xDqp2igc8cBgQ16y8kReBLkUkN35y0MHFVrzdjcG7U8h5ankDn3o6R7oQwuTzr9tYQ3ezPJSGfYGd5HoyJj9Oqa1rq5QxN9GYsEOJU5D/my8WaSuhBEGmcPydBcfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761165600; c=relaxed/simple;
	bh=AevBZfXR7mA8ZnH9HWgorzVav2B7P6NBElfvYO+vjlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdVxeIk2TSs/H7MZhRgN81s7lbJMYFugGVbW4ZcqQShDXj1B/CGjfnGrztoWPj3x64mD0CsJtARXvw8CFTYaR7b3Jk1XAaXKLWG4EvYmNVsGQaPkI/C+0tP0LTQXrXEoxmNtMwimCgMvxCx1V1j6iMljZSfuTdGz/sILtNNLgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPPDAOuU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5087BC4CEE7;
	Wed, 22 Oct 2025 20:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761165599;
	bh=AevBZfXR7mA8ZnH9HWgorzVav2B7P6NBElfvYO+vjlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPPDAOuUvFY0jCYru+MHrPI93MylUWaXw777ymJyl9vpVwt8WWpsQQWwhEFbgxQLY
	 upYRPmL7ID+lSpFamhWUBQJqLzQiDC1PLx+ilTtE/hh9MqjTSwuCienC9/exfo0Rsv
	 Ose7y9fR3PVBQy2y59EI7QG4UkcyZy7h94SGxT/ATSdk9+XX5cfLwUzfRhWiUn49EZ
	 vfaN8w1SWkMmtAXdoOLlwWP/GxgDOxVvkTqWJuDMMo9jrgQozPh0+Jpus0wo3OzGSp
	 AqhbxRUblMlvpajd1dT6OKda2dFEM1/zxm4VVYb5GiTbsyEmQo+hEfpgv5U5zgxz8/
	 icHcCiGr45FFw==
Date: Wed, 22 Oct 2025 22:39:55 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <20251022203955.GA3256590@ax162>
References: <20251020091613.22562-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020091613.22562-1-johan@kernel.org>

On Mon, Oct 20, 2025 at 11:16:13AM +0200, Johan Hovold wrote:
> Several symbol patterns used to be whitelisted to allow drivers to refer
> to functions annotated with __devinit and __devexit, which have since
> been removed.
> 
> Commit e1dc1bfe5b27 ("modpost: remove more symbol patterns from the
> section check whitelist") removed most of these patterns but left
> '*_probe' after a reported warning in an irqchip driver.
> 
> Turns out that was indeed an incorrect reference which has now been
> fixed by commit 9b685058ca93 ("irqchip/qcom-irq-combiner: Fix section
> mismatch").
> 
> A recently added clocksource driver also relies on this suffix to
> suppress another valid warning, and that is being fixed separately. [1]
> 
> Note that drivers with valid reasons for suppressing the warnings can
> use the __ref macros.
> 
> Link: https://lore.kernel.org/lkml/20251017054943.7195-1-johan@kernel.org/ [1]
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
> 
> As mentioned above there are still two drivers relying on the "_probe"
> pattern to suppress valid warnings so perhaps it's best to hold off on
> merging this until the corresponding fixes are in mainline (e.g. next
> cycle or so unless Thomas can fast-track them).

Yeah, if it were fast tracked as a fix for 6.18, we could either use
that tag as the base for kbuild-next (as we have not take any patches
for 6.19 yet) or if they are 6.19 material, Thomas could provide us with
a signed tag or stable shared branch so that we could take this for 6.19
and have a clean tree. Whatever works.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 47c8aa2a6939..5c499dace0bb 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -953,7 +953,7 @@ static int secref_whitelist(const char *fromsec, const char *fromsym,
>  	/* symbols in data sections that may refer to any init/exit sections */
>  	if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
>  	    match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) &&
> -	    match(fromsym, PATTERNS("*_ops", "*_probe", "*_console")))
> +	    match(fromsym, PATTERNS("*_ops", "*_console")))
>  		return 0;
>  
>  	/* Check for pattern 3 */
> -- 
> 2.49.1
> 

