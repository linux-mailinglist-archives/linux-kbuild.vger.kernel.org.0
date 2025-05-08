Return-Path: <linux-kbuild+bounces-7042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAEEAB007F
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 18:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9FD39C4A3F
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 16:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E9C283FDB;
	Thu,  8 May 2025 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xwlh2Js0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6CE2797B2;
	Thu,  8 May 2025 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746721903; cv=none; b=Qw13BUmuJII1HVSG0r8GOGSATUzK9TgNJt1OkQ8PYBiKheFVDESCGWoQuNvjkqpRfpved+Qg/1mBtjn4CDK145l7rD8imW8sVrHyrLCnxh+1SJWY8DC7dSBuP+eSd0jEZVG8WsE2GncQZPs+9v/xu5Zn8rCXIukwHBBAhD5Hwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746721903; c=relaxed/simple;
	bh=bFjZ5vtNT50m7HAL+XeHBlNBRjs7OdpfXvvzw+mNsfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNAJacexWesRxshmU81tpwYZarw3o6K5vvlR1dFcoZGeOvtPoYxHNDO1vCt9bSfbwYZ3Xal0vRnCvJl0mKFs+WJZAmuF4+yyd32V6Ap11M/FNmekKvpLL0AibH0kZBKR3sIxc/MXYKcHh+JP4jbZnoJYKUEUzS1ckkVUutegnQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xwlh2Js0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E370C4CEEB;
	Thu,  8 May 2025 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721903;
	bh=bFjZ5vtNT50m7HAL+XeHBlNBRjs7OdpfXvvzw+mNsfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xwlh2Js0zVWr0hxhx1Hy9J6IkZh5TR1CcsCMRtHjlUXJCsFBP0sA0vSvaLYdh8EMq
	 yiHzEURcD+SwSk4/5o2T6pfl3KjUOGn1s6zeusAjOpvaRgt6/4QqkWJa2JJY6/9orZ
	 UAZeQiVT5Jd+e3oDVS95XexvAklYgH+j4iY0/mdYxCJVZ4vBzk2APokycX800XqHTR
	 WaKTue6cD47yVL6f4hoP0nMmY9a/9/Rp80TlARy4/Z91zVPrlfNdIN0wpE4qXhDsi7
	 qhIk3XH9FkqJ85Hcg8FNFRmOp/RFGhVClIqjyb/53Sw//XHpX6d13u06ViIiaibqW0
	 DF4atJ5Kn6FBw==
Date: Thu, 8 May 2025 17:31:38 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: [PATCH] extrawarn: Use cc-disable-warning for
 shift-negative-value
Message-ID: <20250508163138.GA834338@ax162>
References: <70AA6123A55FEA70+20250507054705.1196184-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70AA6123A55FEA70+20250507054705.1196184-1-wangyuli@uniontech.com>

On Wed, May 07, 2025 at 01:47:05PM +0800, WangYuli wrote:
> The -Wno-shift-negative-value option is not supported by GCC 5.4.0.

The patch is fine (albeit slightly incomplete because other places add
this unconditionally) but this is not going to matter soon because the
minimum version of GCC is being bumped to 8.1:

https://git.kernel.org/next/linux-next/c/118c40b7b50340bf7ff7e0adee8e3bab6e552c82

Even though we claim to support GCC 5, I suspect that basically nobody
uses it in practice since this flag was added by 1344794a59db2.

> This could potentially result in extra warnings under certain
> circumstances.
> 
> Utilize cc-disable-warning to prevent the following from occurring:
>   mm/vmscan.c: At top level:
>   cc1: error: unrecognized command line option ‘-Wno-shift-negative-value’ [-Werror]
>   cc1: all warnings being treated as errors
> 
> Link: https://lore.kernel.org/all/62726950F697595A+20250507040827.1147510-1-wangyuli@uniontech.com/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/Makefile.extrawarn | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index d88acdf40855..375475e7b3bd 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -158,7 +158,7 @@ else
>  # The following turn off the warnings enabled by -Wextra
>  KBUILD_CFLAGS += -Wno-missing-field-initializers
>  KBUILD_CFLAGS += -Wno-type-limits
> -KBUILD_CFLAGS += -Wno-shift-negative-value
> +KBUILD_CFLAGS += $(call cc-disable-warning, shift-negative-value)
>  
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-enum-enum-conversion
> -- 
> 2.49.0
> 

