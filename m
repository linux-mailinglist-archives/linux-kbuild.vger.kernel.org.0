Return-Path: <linux-kbuild+bounces-10363-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54846CE9120
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 09:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C6A0303365A
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 08:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015DD308F1A;
	Tue, 30 Dec 2025 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WWZf/nX/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD62B308F02;
	Tue, 30 Dec 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083599; cv=none; b=q+AHo69P93NBye1jHRMPaxk+FOpNYRR+d5HcL6QOP127mCU0rGhAncrElnPY7nqDt0eo8TWzZraZrsIQshdjsHT6me5x+X+e8N4+Zx/q93vpaiadmL7HFXMZ1SByWkHZ0qsuvmstK2B4xP3mdPJlhDttXwIFe5bVfDKwDtE2QKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083599; c=relaxed/simple;
	bh=hi0ZTCP5djjCekQmBKPciWSIq9l79uooXHA1bygfsdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZB2XL2hntnkFI7BaQ+spDc26s6km6paL2yM1wiLIUX2yiT2mOi8G+gCSiYa3TtHnu+FG2iJg5cx3LlgYPieQJ3bf2Q831cihDqDWKDeuH3OJoVuIVYq2GB0OoxO6XXvH0pAu/pv9TXpQWJob7e/JCwuQEDUmWvsWMQHGw74QXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WWZf/nX/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4551C4CEFB;
	Tue, 30 Dec 2025 08:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083599;
	bh=hi0ZTCP5djjCekQmBKPciWSIq9l79uooXHA1bygfsdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWZf/nX/Subi2R9RM0/47n9LFyyh6iQMG8EPLNHePRq0El2u6VA1Vf91If/47nRBR
	 o6TMri3hM8+59+51wE+b/OvyedoyHdVf9yDHkLajatiV6sbzeocG650L2hhw81D+QQ
	 n3W5ugiiRK1g68kgTyAk8t0ZbC8ES8B/fgc4WHpuZ6ghWAG8PE3yCkvFbzML0j/OOO
	 VP6/j9RfuWYRHCZOWL4Sf/n+gg5gFWgqx5hMry+W2c+clJnk9bFADD0kXfAfiOMUrv
	 +j+hzFXlB1xXigcSnMoHThl15ef1L7mI/xccf+HqEUCcj+izfruOHRILd0oeBag4mX
	 vPwV4ChHibAoQ==
Date: Tue, 30 Dec 2025 09:27:53 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: uapi: Drop check_config()
Message-ID: <aVONCfcaIelceeVE@levanger>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20251230-uapi-check_config-v1-1-00ecec109f39@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230-uapi-check_config-v1-1-00ecec109f39@linutronix.de>

On Tue, Dec 30, 2025 at 08:09:29AM +0100, Thomas Weiﬂschuh wrote:
> headers_install.sh already tests for CONFIG symbols. It does so in a
> more comprehensive way, by only checking for references in code and
> also running even if CONFIG_UAPI_HEADER_TEST is disabled.
> And check_config() has been disabled any case.
> 
> Drop the pointless check.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  usr/include/headers_check.pl | 8 --------
>  1 file changed, 8 deletions(-)

Thanks for spotting!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

