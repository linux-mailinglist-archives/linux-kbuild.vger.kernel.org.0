Return-Path: <linux-kbuild+bounces-2401-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A6928CE1
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 19:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 18322B26C72
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 17:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02AD515FCE9;
	Fri,  5 Jul 2024 17:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8kjjRWy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D069616B3BA;
	Fri,  5 Jul 2024 17:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720199105; cv=none; b=BpRa8fXAiAcpUM3zp3WXgPCWwomEn2MJdY65ZD+G8V6Osf4WQngt3DCUHmlDlVx6LcAvgR3iJ329XX/G3etmhuqNGz/jAO3lx49cH8Gm6pV2kPzysi6ETxVIPHY3HiDO8yBd6Lg8h1rqxguCw5OGGPw6o/9Bgckxr3dBdZHUZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720199105; c=relaxed/simple;
	bh=4H3njO1TFz8XMqqJNfUcSob1nCHHbNmLuzpsrUX0InA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuINXLVRuGRJkT+/aVrvDlj0JQXlJIekCJdZbh/FfL/R2F9pBGIOrVFXmbR7ID+FeRDC2Bkz2mxFT7ZeXx4sdwFT1rKZOrSoBVT1f7Fu5CtnSW7wDvLtoTq6x68/sqvkWWC/HoLDrFeo+1CRV2dP9fROebu+m41rTL354Ks/kts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8kjjRWy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1813BC116B1;
	Fri,  5 Jul 2024 17:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720199105;
	bh=4H3njO1TFz8XMqqJNfUcSob1nCHHbNmLuzpsrUX0InA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8kjjRWyokWHBvzdc+3ogllGEqwEUjW/0SkCdvQyKFT5M7K0HoCOmBrVw0irc6sXc
	 do0CgHOFYD0Yglo0MznBqYcR/9cl8bbpuQ62KUyvo3LA+OJCMUJ6/l7iEW48JJ47S6
	 L6baU9tgtcy0BXzGTd3HFsqZcTtSAV7/RcXDEyJ2t97p/w6L9IOiywYcnTj0Kv+ymA
	 5KURh5Ot2MR0kQNcGSWfXWJqwgWxOoAirlitgJRS+HAbfGjpCMhuO74NDt87lTz1fj
	 WR/oy5seUahgiTHkEK0Bw0rBAQg/pNvSTdeCqgfMFY1p/Fs7XFzTqDgttaj3YY60Vi
	 TGqbRFMeOItkg==
Date: Fri, 5 Jul 2024 10:05:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: deb-pkg: use default string when variable is
 unset or null
Message-ID: <20240705170503.GD987634@thelio-3990X>
References: <20240704152400.1527619-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704152400.1527619-1-masahiroy@kernel.org>

On Fri, Jul 05, 2024 at 12:23:32AM +0900, Masahiro Yamada wrote:
> ${DEBFULLNAME-${user}} falls back to ${user} when DEBFULLNAME is unset.
> It is more reasonable to do so when DEBFULLNAME is unset or null.
> 
> Otherwise, the command:
> 
>   $ DEBFULLNAME= make deb-pkg
> 
> will leave the name field blank.
> 
> The same applies to KBUILD_BUILD_USER and KBUILD_BUILD_HOST.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Yeah, it definitely does not really make sense to let someone do that,
although I am not really sure why anyone would...

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/package/mkdebian | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 0cc1913aad30..196b14e8ad47 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -125,12 +125,12 @@ gen_source ()
>  rm -rf debian
>  mkdir debian
>  
> -user=${KBUILD_BUILD_USER-$(id -nu)}
> -name=${DEBFULLNAME-${user}}
> +user=${KBUILD_BUILD_USER:-$(id -nu)}
> +name=${DEBFULLNAME:-${user}}
>  if [ "${DEBEMAIL:+set}" ]; then
>  	email=${DEBEMAIL}
>  else
> -	buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
> +	buildhost=${KBUILD_BUILD_HOST:-$(hostname -f 2>/dev/null || hostname)}
>  	email="${user}@${buildhost}"
>  fi
>  maintainer="${name} <${email}>"
> -- 
> 2.43.0
> 

