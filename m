Return-Path: <linux-kbuild+bounces-8312-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75111B1D4A1
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 11:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 563477B30F7
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 09:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EC280BEC;
	Thu,  7 Aug 2025 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nrC4afab"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F84824B29
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Aug 2025 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754558265; cv=none; b=IM4/Cuqn985r30v1HWHqA2zxU4ADqanUtwVWspVP0fZle6bQcnMlrJ1EeQIqFvfR1uhS3Nin6GgtAd/s+V4uZKP+CBJosVGUu6oLjALykQRnhXD4KAjDgsKr5f8UuaBJCWrp3MtRb2PTH1sMKJzlWNX6pzyvczOItWXziK2UreI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754558265; c=relaxed/simple;
	bh=0zUxW8m/mOPoNNP6vroWtbgSbFrqqnjFkA4aVh0zoO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuH8JSeaPx/8E6xR1cPiMbuQFNXYIdxolI6gMUQz8yPIGcmQySNAC20qFhNtii4B61MIzq7sMVWEmRAKeauMGKVb6gX2QBq6dOxoURmorOHOyO9goLLFl4GX9gM7PMs/3DM+ccBgX/xQUxlWKK339NrgNnhf46tdNVHpNLX4iL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nrC4afab; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 7 Aug 2025 11:17:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754558260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mwbW4f0KXuVWV5s+001Rqv82hgjpPTxoUsBswshTMUc=;
	b=nrC4afabMCyaCN0ckW3AG837KGnwOf0PhsefEhDpxVDQfx0ReJbaQrbpA1vcpfvnOumPir
	MLEekOTFSMX3q/vfilRKmOY78HX5bevh3SB0sPIssp+xXDubP9GRB41sD8caVWByHavWiE
	rD8bFK/iVFwtYaQSjmg6/BB/tZ7EGt4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: "David F." <df7729@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: 6.12 and 6.15 building fixdep / modpost for amd64 instead of 686.
Message-ID: <aJRvL2UwDBVJ967k@fjasle.eu>
References: <CAGRSmLtTCUoV66PAJ2VCBz70VNVKxhJHGbBFt9GXQdOP6z5KLg@mail.gmail.com>
 <aItVnueRx5QW2Zds@fjasle.eu>
 <CAGRSmLuAKjg=0P=67_M2d1bfDNwWpyHQAuZZCmY=ZNNC62BW5Q@mail.gmail.com>
 <20250731-attractive-lionfish-of-love-a01cd7@lindesnes>
 <CAGRSmLs6O+yvxQusQVRWCRiavZu_5qhTTLNqLkFHV6SEjKx_6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRSmLs6O+yvxQusQVRWCRiavZu_5qhTTLNqLkFHV6SEjKx_6g@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

(please reply below relevant quotations, cp. "Use trimmed interleaved replies
in email discussions" at Documentation/process/submitting-patches.rst)

On Wed, Aug 06, 2025 at 08:46:24PM -0700 David F. wrote:
> Sorry for the delay, had to work on some other stuff..
> 
> The output is below, it build it as ELF32 as it should.   I do note
> that your build command was like:
> x86_64_defconfig CROSS_COMPILE=x86_64-linux-gnu- bindeb-pkg
> 
> I don't have that, is it something new that is required, I just have:
> 
> extraversion="EXTRAVERSION=-amd64"
> make -j$(nproc) ${extraversion} bindeb-pkg
> 
> Here's that output that worked:
> 
> 
> # make V=1 scripts/basic/fixdep
> make --no-print-directory -C /usr/src/mydisk/kernel/linux-6.15.6-64 \
> -f /usr/src/mydisk/kernel/linux-6.15.6-64/Makefile scripts/basic/fixdep
> : "  SYNC    include/config/auto.conf.cmd"
> make -f ./Makefile syncconfig
> make -f ./scripts/Makefile.build obj=scripts/basic
> # HOSTCC  scripts/basic/fixdep
>   gcc -Wp,-MMD,scripts/basic/.fixdep.d -Wall -Wmissing-prototypes
> -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu11
> -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64  -I ./scripts/include
> -o scripts/basic/fixdep scripts/basic/fixdep.c

I am afraid, I lost track of what your actual problem is.

It looks like fixdep is built the way it should, so the next step would be
running bindeb-pkg with V=1 and finding its gcc call for building fixdep and to
verify both calls.  They should be (at least almost) the same.

Kind regards,
Nicolas

