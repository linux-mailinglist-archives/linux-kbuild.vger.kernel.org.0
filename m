Return-Path: <linux-kbuild+bounces-9466-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3908C44A50
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 00:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6412C4E5278
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Nov 2025 23:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECC8264617;
	Sun,  9 Nov 2025 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EauEK2GZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B9217BA6;
	Sun,  9 Nov 2025 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762731688; cv=none; b=dJozMea/Af4QRqCFEUlG8hr9VrAWWMW0w1WZdtt1UDqXgHtg/BAPqP7h5FzcER7eObEVqtZak8bqc0qNWOGrk0wS2ah3wWNg961oTw/lX3OArMiIoDxBGYnQ7Bu/YRBQqlgPb7/lsPchmj/8daDXgiwd/UaavyoTdZLkmKzlU3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762731688; c=relaxed/simple;
	bh=0wF84APrxubzArteAOWnoZ0P/v9FkuqpylIB7ZFP/gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tckWwjjWkOrVMbhFZRKKHjdwt/CbIzksPTsLNPcsXp/bHYlARAC9KeMbzjB58ywbtnXO+7gRVfSFSvM8jmG5uLxmMJ3AkcHeaBMie+vdpAayUtqMGGvaJH3cnYt1pY7AkoKR7ZDSMD+ppxw54CVvJdiRmr2uAessyA8TnE2MPLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EauEK2GZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D747BC2BC86;
	Sun,  9 Nov 2025 23:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762731688;
	bh=0wF84APrxubzArteAOWnoZ0P/v9FkuqpylIB7ZFP/gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EauEK2GZKicKuk0+c3vNLnyrfRPHeRzCQnjMTsGKWWZWYLywOLEp1BQVchjNZNT/j
	 hP2eIodwHX59ppm+H5RkOhwH98Tjgw0M69H94/g+EPnaGN8dU03Y5rUiCbvYv8R5wW
	 MaxttRNS8hG4MemwDFs7hHGmrgfYThVDHLsjBlGQOIyiqfaV3B4rbQiJL4PeC3NK8g
	 7tvMP0GaOUF5eUZrZU4kGgs8MSm6s9s5S6L+otComXMSrr2qDjmNIUuHnQH3Mi5Gy6
	 kgf7htwMVsOsO1MCR+Gp1SCam4UeHiLST+f1hv9O4Orgr/H7TwACGlzhNpoE7SasCs
	 QeFIioxvC0fYQ==
Date: Sun, 9 Nov 2025 16:41:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Properly fix CC expansion
 when ccache is used
Message-ID: <20251109234124.GC2977577@ax162>
References: <20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-kbuild-install-extmod-build-fix-cc-expand-third-try-v1-1-5c0ddb1c67a8@linaro.org>

On Mon, Nov 10, 2025 at 12:26:31AM +0200, Abel Vesa wrote:
> Currently, when cross-compiling and ccache is used, the expanding of CC
> turns out to be without any quotes, leading to the following error:
> 
> make[4]: *** No rule to make target 'aarch64-linux-gnu-gcc'.  Stop.
> make[3]: *** [Makefile:2164: run-command] Error 2
> 
> And it makes sense, because after expansion it ends up like this:
> 
> make run-command KBUILD_RUN_COMMAND=+$(MAKE) \
> HOSTCC=ccache aarch64-linux-gnu-gcc VPATH= srcroot=. $(build)= ...

Yup, good old shell quoting... :(

> So add another set of double quotes, this time escaped, to make sure the
> aarch64-linux-gnu-gcc isn't expanded to something that looks like an
> entirely separate target.
> 
> Fixes: 140332b6ed72 ("kbuild: fix linux-headers package build when $(CC) cannot link userspace")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  scripts/package/install-extmod-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> index 054fdf45cc37a8717444b8094daf3e1150a8ccf5..6cce5c41552d520bf069487352fd26417b0b3899 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -63,7 +63,7 @@ if [ "${CC}" != "${HOSTCC}" ]; then
>  	# Clear VPATH and srcroot because the source files reside in the output
>  	# directory.
>  	# shellcheck disable=SC2016 # $(MAKE) and $(build) will be expanded by Make
> -	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='"${CC}"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts
> +	"${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC='\""${CC}"\"' VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts

Can we avoid the need for escaping the " by just moving it to the other
side of the '?

  "${MAKE}" run-command KBUILD_RUN_COMMAND='+$(MAKE) HOSTCC="'"${CC}"'" VPATH= srcroot=. $(build)='"$(realpath --relative-to=. "${destdir}")"/scripts

This whole command is really hard to read but I don't really see an
obvious way to simplify it.

>  
>  	rm -f "${destdir}/scripts/Kbuild"
>  fi
> 
> ---
> base-commit: 9c0826a5d9aa4d52206dd89976858457a2a8a7ed
> change-id: 20251109-kbuild-install-extmod-build-fix-cc-expand-third-try-2cb1540cadbf
> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 

