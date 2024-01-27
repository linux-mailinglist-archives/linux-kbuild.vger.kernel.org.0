Return-Path: <linux-kbuild+bounces-680-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A949583E8C4
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 01:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BD23B25964
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jan 2024 00:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB621FAF;
	Sat, 27 Jan 2024 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZQnSWAFG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ADF199;
	Sat, 27 Jan 2024 00:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706316769; cv=none; b=ZF7gzFgblBGpTekBfANqRiCyBie1WZDi016ck8cCOTEF7HVKid4QY7wHkd8PoD7RS2CYY5slcOFCPLnRd2kc2Cex7sSABUQprUaVIO5fvpCyK3tAxj4E+lNs12IghD/ghbnkw852jc5kvfZrezb27OxyUgjvC8r1IotOtqfzuU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706316769; c=relaxed/simple;
	bh=RohiRduCZDhu1mva0s61yl4yuysjE3+49ErZTdVjkNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuFmnjBxZzJFbwPoT0DhsEdIgCLOpGKE5Li6trGFhgmyfzUETzlBnQMIvIfpZj0zUxKW0qeRBb97h0aSFJAzo/mEaRxQPXc2iWKcnPU2X2Qd6Rnz/lxyk3uDbm3+1dN2F47QdQJh0bONcZvYQnxdrc25RZyEVCJtuVpbzRAWnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZQnSWAFG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EE0C433F1;
	Sat, 27 Jan 2024 00:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706316768;
	bh=RohiRduCZDhu1mva0s61yl4yuysjE3+49ErZTdVjkNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQnSWAFGeGWy7MU0zFIGG/icKSXF0E0aHOFilBQpFfYNfyiR67arTnxzW90DzCbO3
	 Qs8LZ4R1gf7uuG+X/dXDRZg7Ou5206t6HAKwbjUS+b8Ng5v5NRVeDkOTb9iJaAp8UM
	 pYylThzRaMV58pM3h625BBc6LxdIubDALLMIydR4=
Date: Fri, 26 Jan 2024 16:52:47 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: sashal@kernel.org, stable@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 4.19] powerpc: Use always instead of always-y in for
 crtsavres.o
Message-ID: <2024012640-macaroni-earlobe-bec5@gregkh>
References: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>

On Fri, Jan 26, 2024 at 10:36:31AM -0700, Nathan Chancellor wrote:
> This commit is for linux-4.19.y only, it has no direct upstream
> equivalent.
> 
> Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
> hostprogs/always-y"), always-y did not exist, making the backport of
> mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
> instead of extra-y") to linux-4.19.y as commit b7b85ec5ec15 ("powerpc:
> add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
> build with linkers that need crtsavres.o:
> 
>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
> 
> Backporting the aforementioned kbuild commit is not suitable for stable
> due to its size and number of conflicts, so transform the always-y usage
> to an equivalent form using always, which resolves the build issues.
> 
> Fixes: b7b85ec5ec15 ("powerpc: add crtsavres.o to always-y instead of extra-y")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Both now queued up, thanks!

greg k-h

