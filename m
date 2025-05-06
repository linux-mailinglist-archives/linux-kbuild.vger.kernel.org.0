Return-Path: <linux-kbuild+bounces-6969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C915FAAC1C3
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 12:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC3581C20D30
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 10:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEBA224250;
	Tue,  6 May 2025 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VTyXDrG5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B254201270
	for <linux-kbuild@vger.kernel.org>; Tue,  6 May 2025 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746528786; cv=none; b=MkfjGPUwK/PSw6qCF7YSRsNTR+le/SO8k8YvrrWnTLIKCfpRma4k7ckQrjcmpyNAYpB6DIqXhK75vSHUTSMsFjHl8OF9hxQzqyi7ZvrzvTE4bfzQZCikRmcDq+4Roc7VZ0oFdB/lavSwQGTJ1y6/jo3EsNpIGs5nPM0Op/boBCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746528786; c=relaxed/simple;
	bh=PqVE2APaMCqMuLTh5NVRFJ1V9QEBK9Puom2aWtqglXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8rQdXev+cdTyoBuIRfuRs1/wgwIUm2luFuvz+jtd1FJwLdRdXwpQLsbB07ipbl/2WhOzMyqG7Bh/otTNZwmteZyy0FCgrWsVW+AUMng9XBcKXots0V7Bc1NFNrdTnqz/pHblp9IcBiyvNTqswyeTmIBGUPgoTbdTIvk5blf5gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VTyXDrG5; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 6 May 2025 12:52:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746528769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6MuGPS2ySSDlOXD7jSIEnkN4LXNgvummQIZto8RtO/A=;
	b=VTyXDrG59T5tyP6Rs9eEqTTHJxK8Tf+aNyp5H7Kap14LChkQyPU/rQPkFih+dJ9gTTwTnD
	gl6sw9KY8ssLno1yasZPvURFGE64lkPaM7FJb1+liF2dl+vuA7YyIR2ZagnfZ6zFI6hv04
	I3I7fFkU/0LrJy3tm9CaMjCsjuy0KnE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org
Subject: Re: [PATCH] kbuild: introduce include/generated/global-rebuild.h
Message-ID: <20250506-innocent-calm-grouse-ebbc2e@l-nschier-aarch64>
References: <20250503084145.1994176-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503084145.1994176-1-masahiroy@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Sat, May 03, 2025 at 05:41:43PM +0900, Masahiro Yamada wrote:
> Sometimes we need to trigger a global rebuild of the kernel tree -
> for instance, when any of the GCC plugins changes. [1]
> 
> This commit provides a simple mechanism to force a global rebuild
> using a single header file.
> 
> The top-level Makefile creates include/generated/global-rebuild.h if
> it does not exist, and this file is included by all kernel sources.
> 
> You can touch it in a build rule when a global rebuild is required.
> 
> The following is an example change to the GCC plugin build rule.
> 
>   quiet_cmd_plugin_cxx_so_c = HOSTCXX $@
>  -      cmd_plugin_cxx_so_c = $(HOSTCXX) $(plugin_cxxflags) $(plugin_ldflags) -o $@ $<
>  +      cmd_plugin_cxx_so_c = $(HOSTCXX) $(plugin_cxxflags) $(plugin_ldflags) -o $@ $<; touch include/generated/global-rebuild.h
> 
> Link: https://lore.kernel.org/linux-kbuild/CAK7LNATDbxc+3HQ6zoSk9t-Lkf4MSNmEUN6S5EqoVWnBQw_K6g@mail.gmail.com/T/#me069145443a17f0b464c13814424dbba0d970863 [1]
> Cc: Kees Cook <kees@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile         | 9 ++++++++-
>  arch/um/Makefile | 3 ++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 

Looks good to me, thanks!

Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Nicolas Schier <n.schier@avm.de>

