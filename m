Return-Path: <linux-kbuild+bounces-3621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA7897C893
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 13:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69D701C24315
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 11:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBC319D06E;
	Thu, 19 Sep 2024 11:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="V9FR4baU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D93119D075;
	Thu, 19 Sep 2024 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726744987; cv=none; b=L3g8PehvyeGMH5fDrsZ0DI6VWID9xJtRHFfVnnv2FLNfg9f0UHQRQhdwkVio25kmHkef85dMmYQ8opRtETgYQ1vA6RmcZC8gWEP2QLjxzE013ExBHfaMXLlOzX5PYzYAa2ygy9Yg4zRtLf9d52+JQ9+F+Fn4tx2Un2Be+yRtJMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726744987; c=relaxed/simple;
	bh=2GcU97FWBzcutfhJlOlsgw8NOSC3pVOmgDLZMGtqtCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWdu/iysDxrsehaCiDbnBJb6p9enrNPJktYX0lGniEN9AEogT7JoGIHof7oCXZmS2motcCnRZoAc8G/BNPBQsei9Cm2T5Ncv+Mx6WkS3jx1vf5EPx7snTazy+n2lSxUgIV7rF7vBs3a5M8kWZHpjiN60lre7K96j/me7l+dURKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=V9FR4baU; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726744982; bh=2GcU97FWBzcutfhJlOlsgw8NOSC3pVOmgDLZMGtqtCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V9FR4baUo+eGIGwGcTm9cL5MOtiaoW1TQbbuXugV3FzcmvoA+pM8FArQZfkLbOglR
	 +lgen5s7MqtAsNAr+CroAciJ/TEzMeiqgdNRHPtcVOQYgcRWoy8zU/15ThS9cIjfAd
	 DqZ6+cuYyar0EbSfg2vU38optsdFCHYC4OHF0HBU=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 19 Sep 2024 13:23:02 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 112D8807BC;
	Thu, 19 Sep 2024 13:23:03 +0200 (CEST)
Date: Thu, 19 Sep 2024 13:23:01 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 07/23] kbuild: remove unnecessary prune of rust/alloc for
 rustfmt
Message-ID: <ZuwJlaeFfo7CW5dC@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-8-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-8-masahiroy@kernel.org>
X-purgate-ID: 149429::1726744982-91B09E44-B3F29078/0/0
X-purgate-type: clean
X-purgate-size: 357
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:35PM +0900, Masahiro Yamada wrote:
> Commit 9d0441bab775 ("rust: alloc: remove our fork of the `alloc`
> crate") removed the rust/alloc/ directory.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Nicolas Schier <n.schier@avm.de>

