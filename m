Return-Path: <linux-kbuild+bounces-8313-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 259CCB1D60A
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 12:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5156F1613FF
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 10:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EBD225413;
	Thu,  7 Aug 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vfr7E9Zr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8007F204F93
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Aug 2025 10:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563930; cv=none; b=dv/iT+R6RSWaWaTRLlEWmSkztLzv8+QXizUl/AoNAe21ejGbrgx0rgKrQ+33ImXpSTO2f3GW0+zt3tWLTajp70MTxXoMmTI1wEZyR1JSuuBJ4kyL7iwotQieGh2AR11T6Nki+yZekagwgsvcyI0ftEXGrFmpGWcsJiGFw8DpLeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563930; c=relaxed/simple;
	bh=hfglwkMvFhGOn4QWj+g72ZNFRcXszfY9LNm2lHtcgys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fg5wH5iOAHZsXmgoaJBSWrfX2r1PsPvIEbUF9uSuNlxWzTyfnPlGyrXKS3VxYUfcYkzLFgpnq7C92KO1p2O3ujXYE7UjXyJ50hlxBv0X4lqkMgcPC/wB4lQb7Zbz9Gh3aP8FqnyLmup5vrKp1qsUy5S2W+sAfkss2KdvaTzloXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vfr7E9Zr; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 7 Aug 2025 12:51:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754563923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xqe6q9lfo06sDNWQSsMLztyPkdiJPfGU7rsiVJ59AjM=;
	b=vfr7E9ZrPSOIdsUhfSvWrORcBxJ3ivRs2hs6UtCvr6ljhjb+aCQwIe83ZFLLG5l5wJJ0Ll
	Jwsqqu1YHXpU7an9hjahZh6KJIqroTCTslRaM+Z+sXVlsauXPWJ9ZSA39qf2KKygnnSiHj
	pekcmzKuI+EekDOYXt/n2HaHqfATxXA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Haoran lee <470658536@qq.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mod/modpost: For CentOS 7/old binutils
 compatibility
Message-ID: <20250807-elastic-transparent-kingfisher-8f7ada@l-nschier-aarch64>
References: <tencent_6FE857803A1AAB21B71853A2E89626ABA407@qq.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_6FE857803A1AAB21B71853A2E89626ABA407@qq.com>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 29, 2025 at 12:19:46AM +0800, Haoran lee wrote:
> 
> Signed-off-by: Haoran Lee <470658536@qq.com>
> ---

Please note that empty commit descriptions will not be accepted.


>  scripts/mod/modpost.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 5ca7c268294e..216647e2f301 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -30,6 +30,32 @@
>  
>  #define MODULE_NS_PREFIX "module:"
>  
> +/* CentOS 7 / old binutils compatibility */

Since v6.16-rc1 the minimum binutils version has been lifted to 
binutils-2.30 [1].

Which binutils version do you have at CentOS 7 ?

Kind regards,
Nicolas


[1]: https://git.kernel.org/torvalds/c/118c40b7b50340bf7ff7e0adee8e3

