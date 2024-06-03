Return-Path: <linux-kbuild+bounces-1985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A66738FA580
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 00:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6A4E1C23A3D
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jun 2024 22:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7C713C805;
	Mon,  3 Jun 2024 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLUN3IOT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7638522E;
	Mon,  3 Jun 2024 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717453498; cv=none; b=crSgZjTNMpsKd1BUKUZtQDelQ2yhQtwfwJUlTsI7if/rsc/vgyp4pH3hDUzHhU+iZXgJPmb/daYIXTXh6SGVf+T3Io284nRypZfKw0Nt+pVYBezXuIZRqSV0IG8NWkSgqIbEaMLGZthEe1opbQRDO3GlQX2ibpiqLVsLyFk53q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717453498; c=relaxed/simple;
	bh=VUzLKH/jLd+2yyr8nQdfcdBS1mhd68VfVk1ylPUG3WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LERdSQ/Wq2ItF8VaBU+FFxEOUEz9snfAFQs1llYa9cp7O4oYlI5gwCmKa53URRJAG9SWgT2cdrZ1i3X273QqQ3UbUULMd16txApUS3rclIE1+A8v1y7691Rx8oOOAK+wGUCw/wocKNgruFTPuV7d8gH90ClDZ3znu/XJDUlYb1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLUN3IOT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02515C2BD10;
	Mon,  3 Jun 2024 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717453498;
	bh=VUzLKH/jLd+2yyr8nQdfcdBS1mhd68VfVk1ylPUG3WY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLUN3IOT5S6CGY6XpDOCocLLCLDgiskYA1XNACHrZSwjdKY4MmQua7CJ6t1phSbsZ
	 aa2DvSKbiNTc6J5wwIDPX/RP9IidpzfcWVu9LOJTi8l5Q/NWLZoTw8qbR9H0RSPqPw
	 QSUXwdFTTFpECxJdJm41eGPc38DnKS0FiF/ooGW71faeR8Wxo+rPp2iC6/wqVVmBBM
	 TMddDYUmf3IqrnCfHFR4tNtWlV+Kp1v//tqdqguapEbJe1D/v6bZLAupzt4wi/GFKi
	 oHbyurzqdlaD7OYY2GwDCgEcOSBWOliXEnT91i90LtYGJANPh708Efh4iqImYDY9WQ
	 k8JBJ9URfEXZQ==
Date: Mon, 3 Jun 2024 15:24:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] usr: shorten cmd_initfs in Makefile
Message-ID: <20240603222456.GA1802995@thelio-3990X>
References: <20240531122825.699771-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531122825.699771-1-masahiroy@kernel.org>

On Fri, May 31, 2024 at 09:28:25PM +0900, Masahiro Yamada wrote:
> Avoid repetition of long variables.
> 
> No functional change intended.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  usr/Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/usr/Makefile b/usr/Makefile
> index 132ef7e96e6d..75224d927025 100644
> --- a/usr/Makefile
> +++ b/usr/Makefile
> @@ -62,9 +62,9 @@ $(deps_initramfs): ;
>  quiet_cmd_initfs = GEN     $@
>        cmd_initfs = \
>  	$(CONFIG_SHELL) $< -o $@ -l $(obj)/.initramfs_data.cpio.d \
> -	$(if $(CONFIG_INITRAMFS_ROOT_UID), -u $(CONFIG_INITRAMFS_ROOT_UID)) \
> -	$(if $(CONFIG_INITRAMFS_ROOT_GID), -g $(CONFIG_INITRAMFS_ROOT_GID)) \
> -	$(if $(KBUILD_BUILD_TIMESTAMP), -d "$(KBUILD_BUILD_TIMESTAMP)") \
> +	$(addprefix -u , $(CONFIG_INITRAMFS_ROOT_UID)) \
> +	$(addprefix -g , $(CONFIG_INITRAMFS_ROOT_GID)) \
> +	$(patsubst %,-d "%", $(KBUILD_BUILD_TIMESTAMP)) \
>  	$(ramfs-input)
>  
>  # We rebuild initramfs_data.cpio if:
> -- 
> 2.40.1
> 

