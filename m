Return-Path: <linux-kbuild+bounces-9275-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B2C03656
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 22:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8B23A5E51
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Oct 2025 20:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FCF2C15BB;
	Thu, 23 Oct 2025 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RL30q1tE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8332C0307;
	Thu, 23 Oct 2025 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761251506; cv=none; b=AVH5hHieQFbK+GiJJ98Bk8H5O7tYLEC6l1kgIVpX68cV62lNu80Dd9ojge8LGdiwpXy1b82DYGqYhcYFKalV23LBpY3zT92UD7JDwdQmvpDvoSK0Sey/bdPAOtdvWdixWzTxsmvmToZtKwnopYOMEpY9VsoSPZvYQpYahZPtgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761251506; c=relaxed/simple;
	bh=R2rC4KhW3p8atPtsSCJVqd6Y9QCcH9VfYIFOolx+srY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3F+TlmGuAswvCT0lbkXUFahv7AfZtRxPVwl/u0++jnuQEnMbBqQb5cFgcWHNfHq1xEAOMeiFdnKMM5NhUzdW1Lq47d3XytbX6cwozINQeMKSTUto8VX//zoLtGrydeR4oZ2IfqGWe3cl9vGZFB+1pxs5eH+KgVCfJOnWEnJESk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RL30q1tE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7BFC4CEE7;
	Thu, 23 Oct 2025 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761251506;
	bh=R2rC4KhW3p8atPtsSCJVqd6Y9QCcH9VfYIFOolx+srY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RL30q1tElvR+XqArR14c9XhG4BGbvs9ypYxV9O7iKQgOsgn2j1neSe+TdinnRGfxr
	 SdY2/vf0mFY70Wfrz8oypBXImPjjFuK0iriEIXz+XwSHRppFgJ4RrB9lhzpYjaasTG
	 xYlk9STMaFdbFgw0cQ5/gj7xs+6tasnI/oaH5hZkrO3REjxYBLuos6IoMidxnFrcd3
	 2zLd0ggdvQH7HNn4phtrbrdYlokhWx38f5OO6STZ+yqPkotdcfK7u8u4A1hrWnSdWX
	 bDlEZ+zXiGuFMMIvCvkG3+N9VnsSDUle9v/L2OhzGomGip4qLFm0D00yTRDw1wjQm8
	 J3ESWoSgwm5UQ==
Date: Thu, 23 Oct 2025 21:55:31 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Kconfig section
Message-ID: <aPqIM40N-2YBEmVk@levanger>
References: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-update-kconfig-maintainers-v1-1-0ebd5b4ecced@kernel.org>

On Thu, Oct 23, 2025 at 09:25:20PM +0200, Nathan Chancellor wrote:
> Masahiro Yamada stepped down as Kbuild and Kconfig maintainer in
> commit 8d6841d5cb20 ("MAINTAINERS: hand over Kbuild maintenance"),
> leaving Kconfig officially orphaned and handing Kbuild over to Nicolas
> and myself. Since then, there have been a few simple patches to Kconfig
> that have ended up on the linux-kbuild mailing list without clear
> direction on who will take them, as they are not really sent to anybody
> officially, although the list is obviously watched by the Kbuild
> maintainers.
> 
> Make Nicolas and I official maintainers of Kconfig in "Odd Fixes"
> status, similiar to Kbuild, so that the subsystem has clear points of
> contact for contributors, even if significant contributions may not be
> accepted.
> 
> Additionally, add the Kbuild tree to this section.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> We are going to de facto maintain this so we might as well make it
> official :) I will take this via kbuild-fixes at some point.
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 545a4776795e..1471e1bf1510 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13415,9 +13415,12 @@ F:	mm/kasan/
>  F:	scripts/Makefile.kasan
>  
>  KCONFIG
> +M:	Nathan Chancellor <nathan@kernel.org>
> +M:	Nicolas Schier <nicolas@fjasle.eu>

yes, that seems to be best for now.  Can you please use my @k.o address?

M:	Nicolas Schier <nsc@kernel.org>

Acked-by: Nicolas Schier <nsc@kernel.org>

Kind regards!

