Return-Path: <linux-kbuild+bounces-2588-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EC69343AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 23:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511382841E1
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 21:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ECF1822D7;
	Wed, 17 Jul 2024 21:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHvAfAxb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1523B784;
	Wed, 17 Jul 2024 21:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721250815; cv=none; b=McW7xAUa04KF0yiV2xYxymRm01zRM7PawxHgmZJr0Pr8/gkeIDdqIfE8diVgBEIn62d5Wmd65951N4a/EV6vbW1P4+m/3n+zzpVk27SAyXWLpLJ2+mReAilQeu+yCK3HjTQ6viyRMewFHTaVyD2vYSMhUBdu9U5MP0jZda8U1Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721250815; c=relaxed/simple;
	bh=e/y3oPbg9Mw3iw15ThuGCqBzPrLKHMJP3QzdK6NS6s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hlm2TX3fzYwm//KNQMjvGg1Adq0XO8k6BXB/ibzDvyr3zV0QiHmulTFHtdNaRNlu2BZ2d8ye46SgBmJjFuoCVGLvPU5nCpFBM3g/i63V/YPt5l/w0R4kELltCWsHS3C2JeyElVY6ZGmcaxketa+rLaqF1AqumWcLQmEvC5I0n+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHvAfAxb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDF7CC2BD10;
	Wed, 17 Jul 2024 21:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721250815;
	bh=e/y3oPbg9Mw3iw15ThuGCqBzPrLKHMJP3QzdK6NS6s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHvAfAxbWMqb8L0dXKZtAZRBkb15K2PGRo9AI2ICsVUCuhZ/taLR8iv8HHue8MZW7
	 6B7ANNduuBboFvJiSH++X55gG7AJQ/9fNwRmzCYD9K0inO2qmoQd71Yx3ISu9D5CPA
	 Lzz60JTMTNT+jx0h+07p7eN8540RH3PeZe/681kWKSNPSKgKTAyiRNDSHdN7BVhvAe
	 1GIaxR/pybdyoAuJb4+ewlpDQ9Pv2vtrf0fhZnrTHi62hseWJKTeSwXXeCpWBVOnCE
	 IyW1Wrg0dhez0/lIgfbaNYzArBG4PY49FKjdBJ/DKzH+jg2HtMc4NiHcWoXOurejAd
	 EBBjESrq8P2eA==
Date: Wed, 17 Jul 2024 14:13:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Christian Heusel <christian@heusel.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <20240717211333.GA901230@thelio-3990X>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <e8786093-384a-4a7e-a536-3915cd4f933f@heusel.eu>
 <c61c5996-592d-4669-a991-d9eb22cca88d@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c61c5996-592d-4669-a991-d9eb22cca88d@t-8ch.de>

On Wed, Jul 17, 2024 at 06:26:29PM +0200, Thomas Weißschuh wrote:
> On 2024-07-17 15:48:05+0000, Christian Heusel wrote:
> > Also is there a canonical way to be notified whenever people report
> > issues with this or there are patches to it? I'd love to help out if
> > that is desirable from your side ..
> 
> I've added you to my Cc list.

Another option would be adding scripts/package/PKGBUILD in a separate
section of MAINTAINERS, so that Christian could be added as a reviewer.
FWIW, I would also be interested in patches touching this (although I
should get notified as is since I am a Kbuild reviewer but still).

Cheers,
Nathan

