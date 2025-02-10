Return-Path: <linux-kbuild+bounces-5693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12014A2E996
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 11:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAD53A5294
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 10:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426241D88DB;
	Mon, 10 Feb 2025 10:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p5LTBiFd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ReHUFUaL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B85F1CEE8D;
	Mon, 10 Feb 2025 10:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183712; cv=none; b=WtEg/PU65X9mmzAFI4a3ouxjezL37Bk9NUrRgyT+T4E4NJY99KhwybE/DotHF3saafMCRDIlO0G40t7UWpGsdQIu1ZAbf7aM/kzBYLaDdun38bn5923BkRh/kOg/yL0xJ1h1Ek2J3mDgV25PMrSap/PD61rLABIPNvvKVvyO5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183712; c=relaxed/simple;
	bh=YEMKeszrXUMcpfiOUXrt67jneVtBnvYlfw6DsYnrqb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irFtxt4I7A+lLBTius8wp/ZNlcGYLuABmmCq5+O2gCQmWpJQ9Ta5zymzFN5AFlRG5d9MRwYeONe+0OPxJ5WwImOxBBKBN1AgaXxs6liSR7hvVgVfoIFxsGyWQyeH8gnwQMXnEj7+MeFt1MOgw35xjEbKA4e1P3OkC2lFg2PJgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=p5LTBiFd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ReHUFUaL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 10 Feb 2025 11:35:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739183707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQvWHbqQ1oU0BRSvuh6FKtLz69JAB2Uemf0dV2VdZSg=;
	b=p5LTBiFdGC+JWfR93RqG3xKHPIna61cLNRK9OJ0l8JBxQvflN1pYW32ZAPUog6Nzelkn0T
	hN8tQiScAEyJlWT6AE/z/2n7Hdi77tCb8gFFzU46bhLZe/Vn3meODnENRbVvQ5WLWbCU3r
	UOyIAn7bsP1FlVL5AAyv6yJ5d0/l+h2OJUGnI/WMpCJEm4LB9N4dIVu32YUGmsGl5+W6pK
	iNYOmaZAvc5Q5I1qItl9tu5u3NPxYCdNyqKXyfmbTPrZ4zyNXGBKuXks6yOoN2vgrNwhpm
	vU2pCwy+dB46qjh3w/beVGKOUF/qa4y/YnvX2QdY/sIDhK26U9x7wlWbDI7rjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739183707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQvWHbqQ1oU0BRSvuh6FKtLz69JAB2Uemf0dV2VdZSg=;
	b=ReHUFUaL1ozfoHZDgFLGhNibTyTK8aMZ9CaMNtIuu1bMP7GbFLsbyh17EYT4fbcsKjlCEe
	PRZPQKVAg1BGDdAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Add kconfig utility scripts
Message-ID: <20250210112547-66c11bee-38d4-4073-b2db-938a0cf674e3@linutronix.de>
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
 <20250108-diffconfig-validate-v1-1-4b3d8ee489da@linutronix.de>
 <CAK7LNAQm4v6yNq_EwGhY765f_D302aPgPfyxVDRqYMXpwpx=pA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQm4v6yNq_EwGhY765f_D302aPgPfyxVDRqYMXpwpx=pA@mail.gmail.com>

On Mon, Feb 10, 2025 at 02:23:41PM +0900, Masahiro Yamada wrote:
> On Wed, Jan 8, 2025 at 9:34 PM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > There are various utilities in scripts/ which work with kconfig files.
> > These have currently no maintainer.
> > As most patches for them are applied through kconfig/kbuild anyways,
> > add an explicit maintainership entry.
> >
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 30cbc3d44cd53e6b1a81d56161004d7ab825d7a9..2bd414fb3e6d6515b57a57a5f3d4d735137edcce 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -12385,6 +12385,9 @@ Q:      https://patchwork.kernel.org/project/linux-kbuild/list/
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> >  F:     Documentation/kbuild/kconfig*
> >  F:     scripts/Kconfig.include
> > +F:     scripts/checkkconfigsymbols.py
> > +F:     scripts/config
> > +F:     scripts/diffconfig
> >  F:     scripts/kconfig/
> 
> 
> There are a number of random scripts I am unfamiliar with.
> 
> I have never used checkkconfigsymbols.py
> 
> I may happen to check patches for such tools very reluctantly
> and very lazily, but it is daunting to endlessly extend
> my obligations, especially to the point where I lost interest.

Understood.
My intention is not to extend your obligations beyond your interest.

However I am not entirely sure from your message if this holds for all
three of the added scripts or only checkkconfigsymbols.py.
Until further notice I'll assume it affects all of them and the whole
patch should be dropped.


Thomas

