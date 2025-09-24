Return-Path: <linux-kbuild+bounces-8956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82962B9AED5
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 18:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43BE54C724D
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 16:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534F5314A65;
	Wed, 24 Sep 2025 16:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXNRVo90"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3C73148CD;
	Wed, 24 Sep 2025 16:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758732902; cv=none; b=EeK/Eu8F4k4Kf8ilRdn0YbsWOzIIm9wuwFiVzxXXjR9oMbL2pQo2dv7+pOxzlWPC1MAWMYTQgCQhGUm7Fv0DIvEP9ikgBVuRk33u+zBr/U4+CyH4YVL5IHGyycJGDxi4R89MgHjr1F5MqpOimrISOzHmFZF7i51OfiSPsXeoifM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758732902; c=relaxed/simple;
	bh=ZSuvPKo4zP1BolcgaK42uPifYCuhAjff2p5QUMlhvj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyF2/Avs8UCp7h1amSfLjS9cqNBQe5JZAaq5n7g9WpUM2SmOOsHe5YLVFS3WutzWm3yse0X25zDwQRFj3IelEMFWoIHgpmhA6uwSQXi9U4Ag5SrHDLs7L0xGesWPFbST5UnpSexLxJZUeWYIOrHTc7AwZObw+wWt6H+rli8h/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXNRVo90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA2BC4CEE7;
	Wed, 24 Sep 2025 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758732901;
	bh=ZSuvPKo4zP1BolcgaK42uPifYCuhAjff2p5QUMlhvj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXNRVo90ZhjkmSGghzeTg1AwA9xcxiXQgqZpgm5694xcVDh65DWhbtAbUuhvC4kW2
	 S9G9l6hbYLvXkhR22gbdk2HIL56L42VvBvOoDLKFBJsSSHik/yXb5ga0Hdc85cVbfp
	 9jyZRYcEt70BjMBoUv8akRa2oY1lI8k56rOqHlCCb21jS2T2sxXBfflXO/31EzPRbf
	 /3DgBIfF8p8LJG0whLwQzeyC/17xUvzlLw8l5G/UO3K5Et7wSie3pYZBhCm0pXCBxd
	 Nr3u4c2rFgOBlW1liOJDY8TUbC5O2PDnYRB8S64t97UTzCvygkoORljvPSPHAS9Trp
	 hqFj+McS5Oc6g==
Date: Wed, 24 Sep 2025 09:54:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Ard Biesheuvel <ardb@kernel.org>,
	Han Shen <shenhan@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20250924165455.GA1445061@ax162>
References: <20250922224835.1918759-1-sjg@chromium.org>
 <20250922224835.1918759-5-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922224835.1918759-5-sjg@chromium.org>

On Mon, Sep 22, 2025 at 04:48:32PM -0600, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---

Acked-by: Nathan Chancellor <nathan@kernel.org>

>  scripts/Makefile.lib | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1d581ba5df66..2e880d9b4706 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -398,9 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
>  # Use this to override the compression algorithm
>  FIT_COMPRESSION ?= gzip
>  
> +# Set this to 1 to include an initrd with all the kernel modules
> +FIT_MODULES ?= 0
> +ifeq ($(FIT_MODULES),1)
> +EXTRA := -B $(objtree) -m

Not that I can imagine it being a big issue, it would be nice to
potentially namespace this variable, like MAKE_FIT_EXTRA or
MAKE_FIT_FLAGS?

> +endif
> +
>  quiet_cmd_fit = FIT     $@
>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> -		--name '$(UIMAGE_NAME)' \
> +		--name '$(UIMAGE_NAME)' $(EXTRA) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> -- 
> 2.43.0
> 
> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> branch: fita3

