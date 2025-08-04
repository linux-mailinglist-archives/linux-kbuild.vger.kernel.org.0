Return-Path: <linux-kbuild+bounces-8287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF3B1A8D4
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 20:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FB151808A1
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 18:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3141AC43A;
	Mon,  4 Aug 2025 18:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="dlbMZ9QV";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="JRcJC1O8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765C380B
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2025 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754330602; cv=none; b=QUjKI8eZUu7/WsVMPC3An71nxxFJvUTqyw60PvWJ0Cq9/dnUfiVBedMJGGQmswusUfhHet82MoyuWDOpax1DXCPJqBebo6EpO6+i7J91FA+IdidCEFTujYiKY89LIOHwuMt1xAXNf3TtdqhSIHCZsSZ4m3ZRat9otuj20ERJioQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754330602; c=relaxed/simple;
	bh=+rtdkAkeAsEvT3rbhK68CZ+79amRgl2+bzbp24jzet8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/MJxeo6BvMVWXTEvZvL6or+Wh77SPXd+6064kdM5tmOekGzbYlseb1iHPMtaiMhcJC1dleg1NI2qhQkZqsJRtlyi7DqZRFoUOiWFv2UvEGMmZck3+eB1JWq6WDeBgIE8UJ+nGjfHVNda/mWxWUkdrYL+8qIhrUXHFh0b2+mI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org; spf=none smtp.mailfrom=ravnborg.org; dkim=pass (2048-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=dlbMZ9QV; dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b=JRcJC1O8; arc=none smtp.client-ip=46.30.211.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ravnborg.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1754330529; x=1754935329;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=1lpDC4cH3BTs6BuyJ75CqHsc1dvi+9ejQ/xPgMRN/xk=;
	b=dlbMZ9QVshk1aGtgb+7m0s0SmprfLyZm08t6oYKH7CV4RmNj57ztxKx/M/NWn+FuMFkO2IBzQ/t3i
	 Js+GDk7ktP5vDHAZ28SrU3FFDiyHj12l+Y33zQoQaBkQkyNgVpn5xr8yUiamNxRU1XWe6PnmnJvn9m
	 Tr6ZxxdqvoGdXLgc93ZNiJ5V0ohgMddfjD0VlGhrROXJwiffHEB7cSCpfARcu51XF99ujN7JWvhcrZ
	 2dX3Tb0zhJ4xE0jvMIpbiJmMYcjH2nChfGfiML+3wy5xYx+8Jggydmqab1zRY1Z0qtnLmNZsL3F3jv
	 uNN8wL+kdMMkTQ9GSWEbMcJ1DvAoqIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1754330529; x=1754935329;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=1lpDC4cH3BTs6BuyJ75CqHsc1dvi+9ejQ/xPgMRN/xk=;
	b=JRcJC1O8ZYPNLm0p15mm4nP4044OtQqdynzKEeslzubpcNCSnViBr5DrACmE13Qk9UCQ22jzso757
	 osb67BrAQ==
X-HalOne-ID: 22958868-715d-11f0-8750-f78b1f841584
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net [2.105.16.150])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 22958868-715d-11f0-8750-f78b1f841584;
	Mon, 04 Aug 2025 18:02:08 +0000 (UTC)
Date: Mon, 4 Aug 2025 20:02:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] MAINTAINERS: hand over Kbuild maintenance
Message-ID: <20250804180207.GA191455@ravnborg.org>
References: <20250804142007.776418-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804142007.776418-1-masahiroy@kernel.org>

Hi Masahiro,

On Mon, Aug 04, 2025 at 11:20:07PM +0900, Masahiro Yamada wrote:
> I'm stepping down as the maintainer of Kbuild/Kconfig.
> It was enjoyable to refactor and improve the kernel build system,
> but due to personal reasons, I believe it's difficult for me to
> continue in this role any further.

You have done a fantastic job and you can be proud of the improvements
and the differences you have done.
But technical stuff aside, it has also been a pleasure to see how you
have dealt with the leadership side of your role, mentoring and assisting
countless people on your way. Impressive and an example for others!

When you took over from me 8 years ago the kernel ecosystem was very
lucky, they could not have wished for anyone better to do the job!

I wish you all the luck in whatever the future brings you!

	Sam

