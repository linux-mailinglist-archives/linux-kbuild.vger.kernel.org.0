Return-Path: <linux-kbuild+bounces-1377-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C1988FD96
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Mar 2024 11:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E611C218AE
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Mar 2024 10:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99FCF7BAE4;
	Thu, 28 Mar 2024 10:58:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35687CF17;
	Thu, 28 Mar 2024 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711623482; cv=none; b=Ml4SxUTe4hYZk/wJhAf3hn4b9kye09luQP8S5bIbgyZXlEgGc07e8SKId0zuwDwotifOMkxenl7TGnB3p1BvwwxhSZKF13nmKjVpNifppX3wzfyKRzC9SFOmUja69uFzq0uyFHdHCGlZXxfA2g6bItLhonkJ+aYluztgjaJv2Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711623482; c=relaxed/simple;
	bh=Ma4M1824d7XwsjxVxKW/3LNHMZIfVD2AB8pr97ZGCVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddtSDyNgpWewM166vq0zDiPkQRDSXcUS7vNGCFjb1LfzsogmP/1ZJGcNCHC/uVCpgoxYC69w4i4pfjVbZsioR9tqcJhWlhHGkVZlOv/2U5ApOmgOrTyf674fOtihAW1mW/Bxl4vuUbjCpl/22On7PfP9B6uwqGN+b0MbZVORfyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rpnS8-00C8Xu-4S; Thu, 28 Mar 2024 18:57:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 28 Mar 2024 18:58:04 +0800
Date: Thu, 28 Mar 2024 18:58:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Olivia Mackall <olivia@selenic.com>, linux-crypto@vger.kernel.org,
	kernel@pengutronix.de, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] hwrng: mxc-rnga: Drop usage of platform_driver_probe()
Message-ID: <ZgVNPH0EuGAjz/9R@gondor.apana.org.au>
References: <20240324161227.239718-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240324161227.239718-2-u.kleine-koenig@pengutronix.de>

On Sun, Mar 24, 2024 at 05:12:26PM +0100, Uwe Kleine-König wrote:
> There are considerations to drop platform_driver_probe() as a concept
> that isn't relevant any more today. It comes with an added complexity
> that makes many users hold it wrong. (E.g. this driver should have mark
> the driver struct with __refdata.)
> 
> Convert the driver to the more usual module_platform_driver().
> 
> This fixes a W=1 build warning:
> 
> 	WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in reference: mxc_rnga_driver+0x10 (section: .data) -> mxc_rnga_remove (section: .exit.text)
> 
> with CONFIG_HW_RANDOM_MXC_RNGA=m.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> while I indeed fixed the mentioned warning in (implicit) v1, I
> introduced another one because I failed to drop __init from
> mxc_rnga_probe. :-\
> 
> This is fixed here.
> 
> Best regards
> Uwe
> 
>  drivers/char/hw_random/mxc-rnga.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

