Return-Path: <linux-kbuild+bounces-10104-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36738CC06AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 02:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7E5930133A3
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Dec 2025 01:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7B6158538;
	Tue, 16 Dec 2025 01:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+wUjIj3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E891A2E413;
	Tue, 16 Dec 2025 01:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847334; cv=none; b=rcHS0ebLb+nGEO4ZBKQsVAaAKKpPz1x6WKYXBSDVT73satpZJ6zcZcjGIhl1YkgJn6IwYmwyx0eU5rzmk7hJ2ZXGVUBxy1Iw0AvHYy7ghhxTWJTIFD/s4R9hRhxON96ftZ34VSYLKFn67/RVinMZX/QxhhQUq0mErGo7h2P/BlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847334; c=relaxed/simple;
	bh=umWKNAzVFhlwWU1gbKAdZskDZmZ9iKgEcTH3qrfbyjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQYnPW9Qb8wlsvCcX1+o5MH2veZss20S2xaVIPZB4dDufw2zPZfpBbj1dpTv1uKxr2/SA1gh6patQjIDyV+vllKaT2S7TuHQHKAhu5QeHOvOCCHU2dvfNp560X99qUnStHMANZLUAEIZXooFR90/F2ufNHHxqkF+35hnAo+bt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+wUjIj3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60075C4CEF5;
	Tue, 16 Dec 2025 01:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765847333;
	bh=umWKNAzVFhlwWU1gbKAdZskDZmZ9iKgEcTH3qrfbyjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+wUjIj3CTyvJ0HRNLCrLE9CZSmMBO1ZDf9XOGOeKP/93IyrCyG90qQeDzK0cHzoF
	 nt12zjbhUDAYCaRXdK/HK6oRsE0LF4kvg4OGyLsLw3bwvSbtAig7e4sWh0X/19OoQZ
	 nj4Hs1EyXpFJ0Z/GevuLqccuetrOo3o8uxCYk1msW5OJ7BXyNr3Dv+QVR2xcNfglrX
	 0edGb0eqJe2OcqNvZ9ihERU/A3s5YlJc2v0pIb1+WRdTPZWU/8iYbw63rD5Wurco4O
	 DDrmin/9/zNchyS6ZZ+AMDX0wbyKQHxqDhgFaz+vhMbIn2zWwp0lgu1VhLVyNb/4Mm
	 Wr7ZpdOtNQd1w==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vVJbb-000000000k2-36YK;
	Tue, 16 Dec 2025 10:11:59 +0900
Date: Tue, 16 Dec 2025 10:11:59 +0900
From: Johan Hovold <johan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <aUCx3948XuXmpWPo@hovoldconsulting.com>
References: <20251020091613.22562-1-johan@kernel.org>
 <20251022203955.GA3256590@ax162>
 <aRS6VQCKB7dXGbXx@hovoldconsulting.com>
 <20251114041628.GA2566209@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114041628.GA2566209@ax162>

Hi Nathan,

On Thu, Nov 13, 2025 at 09:16:28PM -0700, Nathan Chancellor wrote:
> On Wed, Nov 12, 2025 at 05:48:21PM +0100, Johan Hovold wrote:
> > Daniel has queued the clocksource fix for 6.19 now so I guess we can
> > just wait until both fixes hit mainline and either send this one to
> > Linus after that for -rc1 (or -rc2), or just wait until 6.20.
> > 
> > I'll send a reminder when both are in Linus's tree.
> 
> Thanks for the heads up! I think I would prefer having it bake in -next
> for a cycle so I will plan to apply it to kbuild-next once 6.19-rc1 is
> out. Then we should be able to catch any instances that crop up in new
> code from -next testing.

Both fixes are in rc1 so you should be able to apply this one now.

Johan

