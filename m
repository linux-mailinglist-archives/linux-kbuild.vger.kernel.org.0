Return-Path: <linux-kbuild+bounces-9624-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB60C5C12C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 09:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6222E4E53F1
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 08:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B942FFDE2;
	Fri, 14 Nov 2025 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT5DOL1c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408932FA0C4;
	Fri, 14 Nov 2025 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763109936; cv=none; b=WC++9o+fvTF/cMGmBbRYvMMdFI1PiaB/mvxYEk2izdSYegK/FJThNJ9q0ecO2ZvYHc4WolYDtdD8z8cpzxQuCR9AH5NRfEuY0COkcqdwyQ4s3xsj8z15c+m5ctE7qjpYnCHb+43kkR2Vk6SzhTNzMhyN/PCMGtmIkZHjckjhQYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763109936; c=relaxed/simple;
	bh=DTA3TxtfcQ+fVJMWo0ftlacmxwLy+Ik6rOLuDRX47Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnuqfHVAYpTSiK+Arqm3UA9T6xOF8kEW4GXWPjddXlL2u5LYtlv5Jnai88KDzgKsicE4jsKpEbd7p0Y/r2RVselygYchnOlzW5kB8yU4aGa0erl7W5wBIhe/zdSdbWo5aazlQEhILR/TYOekg0N3vytXo5ro7WimiUKMjKf0zTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT5DOL1c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD2A8C16AAE;
	Fri, 14 Nov 2025 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763109935;
	bh=DTA3TxtfcQ+fVJMWo0ftlacmxwLy+Ik6rOLuDRX47Bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fT5DOL1cOqCBSTmrq9rki9PJXa1Rf6akWSjKw9q/mMp/Qi0G4bi7OW+oTYaxHhzcu
	 fzNnTR1uLsAkpFPFI+zOyghGN66WQ638AH/TNQ45sydMfAz8m4VAONobOTPFJMG2pX
	 O2qj0r6g9G5PPyXaBr8lDpPHGgcWr4z9cx1wsKww+B1EPv7wzVui/WAfeCzRAN1tLe
	 QqFxoQMvOip3q4B2LdM2C5YHTzPgHUFxQzz4ysnMZbhV7Gcb+YGLeONLWUZSxIotL1
	 p1pjLUMYNbHGXnY6UeIMUi5wYRyVRNliFRREBII2FYFm/5uqOqNlxUJwK5Dwy5FJ4c
	 vJxfuDH7QsBhg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vJpQz-000000003Q6-1rnX;
	Fri, 14 Nov 2025 09:45:33 +0100
Date: Fri, 14 Nov 2025 09:45:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <aRbsLU-5KDN3HLDE@hovoldconsulting.com>
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

Sounds good, thanks.

Johan

