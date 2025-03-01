Return-Path: <linux-kbuild+bounces-5935-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D67F7A4A893
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Mar 2025 05:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 674D07A6E25
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Mar 2025 04:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2864D1519BE;
	Sat,  1 Mar 2025 04:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="akqztUmN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0015B2C9A;
	Sat,  1 Mar 2025 04:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740803158; cv=none; b=ua6CRMhySu0d1w7RqTvastkVhx1TVwd5EuZ0xL+GMdanZUImLMMRYklaoS7xpKc0LFZKc4pWjiVninFpxggVd29xz+B1c95BfC6KSwadcw5uXGB83KO2dq8xTHZlysf6F5pdTc1VhzEyvQie+6vYoQ2onhagsamcvsTnpLyqJVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740803158; c=relaxed/simple;
	bh=pWaCimXUsHigEq/oorBCKxI41iZIQds1Cj6USoZA9wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dgfy1IYm7HV4DFefiGv6ecbmQ2JAGSG+VVNJ9Htdb1FmSJ6ze9Ha3fVtdckeEVKpBNr9ODNplp7g24i7mDsB/Km/EW4HPhIrGVHI2ZFiCjllRiIBZXLrUVDgzTCR2hZwYzZTelVpo0pNSrXWySXGw9WhvNhr53Hj2M0WkldoaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=akqztUmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF431C16AAE;
	Sat,  1 Mar 2025 04:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740803157;
	bh=pWaCimXUsHigEq/oorBCKxI41iZIQds1Cj6USoZA9wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=akqztUmNh3pE5H4039Ogzdf2oxsmAfzWBob1fVnONnq7gI+bQ7WlASXy+JZnnD+9+
	 Ks/tOeXHyrB1zi8zFyBF8ywtjv1Q6I1XM6lEJT4bDvyXV+JuAh1QekMkZnw1PqapWG
	 tW0nOaiOkiuL1WBqaJvZ5H6EpbozMwSD7TTUD+kYKxYwDukPOGfGfmmz0yHHLswy4B
	 aVEY9fkXwyBaHIIKAWAkMKToTfuKWAr2oZNyfkbBVwKPAXTQwCBO2ZrE0BtgUgoCc6
	 XtJTnVtQPpUrmkVI2f7gIbgLciMDTuY/aMf+jnzCOZE495E+In7e2iUIpRaAj3B4rh
	 SZJHh+AXmttTg==
Date: Fri, 28 Feb 2025 21:25:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, chenhuacai@loongson.cn,
	kernel@xen0n.name, revy@deepin.org, zhanjun@uniontech.com,
	niecheng1@uniontech.com, guanwentao@uniontech.com,
	chenlinxuan@uniontech.com, Shiwei Liu <liushiwei@anheng.com.cn>
Subject: Re: [PATCH] kbuild: deb-pkg: add debarch for ARCH=loongarch64
Message-ID: <20250301042551.GA3565873@ax162>
References: <DB8BF02DB314013F+20250224182619.1557027-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8BF02DB314013F+20250224182619.1557027-1-wangyuli@uniontech.com>

On Tue, Feb 25, 2025 at 02:26:19AM +0800, WangYuli wrote:
> Fix follow warning when 'make ARCH=loongarch64 bindeb-pkg':
> 
>   ** ** **  WARNING  ** ** **
> 
>   Your architecture doesn't have its equivalent
>   Debian userspace architecture defined!
>   Falling back to the current host architecture (loong64).
>   Please add support for loongarch64 to ./scripts/package/mkdebian ...
> 
> Reported-by: Shiwei Liu <liushiwei@anheng.com.cn>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/package/mkdebian | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index b6dd98ca860b..0178000197fe 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -77,6 +77,8 @@ set_debarch() {
>  			debarch=i386
>  		fi
>  		;;
> +	loongarch64)
> +		debarch=loong64 ;;
>  	esac
>  	if [ -z "$debarch" ]; then
>  		debarch=$(dpkg-architecture -qDEB_HOST_ARCH)
> -- 
> 2.47.2
> 

