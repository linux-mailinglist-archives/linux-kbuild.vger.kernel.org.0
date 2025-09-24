Return-Path: <linux-kbuild+bounces-8958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D4B9C751
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Sep 2025 01:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4161B2E8211
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 23:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54D1298CA7;
	Wed, 24 Sep 2025 23:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="5Glodb/2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D13028B4F0;
	Wed, 24 Sep 2025 23:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758755758; cv=none; b=ERVONYhzn4Q6S71xPjBN0g2t/WYEErqE3of2MtGHwSF64PrXV038e04pWxsRwa9JaYrPYg2p5s0oR/z5KquAY26tJ0Ro2eE2cDO92hG2cwOyhXs1CFnTJdnxC1SA2mj1R7SbDYGj9snsSU3KT4mBGpzFrrsiKOGeBRIRR/WoN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758755758; c=relaxed/simple;
	bh=duhZyVBvEqlTiPX0Msmh/jbu1wDbaagJAcH8ohV2TSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBYfmWQlI6Gvk4Y1pGFrpdtVXWEYB3GheVBC4eFVTtjZ9qIU6CjFL9PL10mLokR/foXbkaO//YPLlKdK4IMfno/uivxheMaW9MU4qCIhkIOStouJqwFTe0Q/qaBxjFbdzgccy7A5UWp34AASRKFP5jrM3FoI4aPMhujz5/fehuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=5Glodb/2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5pK/9jCfPYrzn9NDHa/mSQuL/1mONzWqtOvuQ3f0ah8=; b=5Glodb/2IlbfHspmM1yP6VAzt+
	XtFBgQ1GpP/vk4g5SI5TQrL9TeduNrdAX9Id8ckm5E10ZqBbdYQ9229EU9W0DLO+z3XmuDcE7Mcor
	SNVxhhqON8WyGKHktHwQts7MH5wyXPxqfIN9vzmEZcTdk4XHjSVJ6/a8psZ6hz4H0/x512GD43wIO
	EiII0y9ItTh2LLDA89rAN8SZER/4w6dXaVdUhYx3+QM1HLcEcReF9omdnvcX9MVsjg5ouGXNDcXYX
	pMLTq5nN91df6MaaYy886bwjjYQrEAIAu3tkgkYfFYRIxx8cYgcQxSZPavMb5zFYL+aTjRaMXhTMn
	B9mz4fMw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1YiK-00000004auO-1UGy;
	Wed, 24 Sep 2025 23:15:56 +0000
Message-ID: <e11c90fa-0363-4092-863f-240b31504209@infradead.org>
Date: Wed, 24 Sep 2025 16:15:55 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: kbuild: note CONFIG_DEBUG_EFI in
 reproducible builds
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ben Hutchings <ben@decadent.org.uk>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-v2-1-d2d6b9dcdb7d@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-v2-1-d2d6b9dcdb7d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/24/25 12:47 PM, Nicolas Schier wrote:
> From: Masahiro Yamada <masahiroy@kernel.org>
> 
> CONFIG_EFI_DEBUG embeds absolute file paths into object files, which
> makes the resulting vmlinux specific to the build environment.
> 
> Add a note about this in reproducible-builds.rst
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v2:
>   * Fixed a grammar typo (Randy)
>   * v1: https://lore.kernel.org/linux-kbuild/20250625125809.2504963-1-masahiroy@kernel.org
> ---
>  Documentation/kbuild/reproducible-builds.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> index f2dcc39044e66ddd165646e0b51ccb0209aca7dd..96d208e578cd53d3f0c4a24ec983a9179260345d 100644
> --- a/Documentation/kbuild/reproducible-builds.rst
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -61,6 +61,9 @@ supported.
>  The Reproducible Builds web site has more information about these
>  `prefix-map options`_.
>  
> +Some CONFIG options such as `CONFIG_DEBUG_EFI` embed absolute paths in
> +object files. Such options should be disabled.
> +
>  Generated files in source packages
>  ----------------------------------
>  
> 
> ---
> base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
> change-id: 20250924-kbuild-doc-config-debug-efi-in-reproducible-builds-eb7489a8d185
> 
> Best regards,

-- 
~Randy


