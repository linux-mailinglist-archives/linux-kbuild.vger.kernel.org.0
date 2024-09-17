Return-Path: <linux-kbuild+bounces-3585-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B7997B0C2
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 15:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AD66B2235B
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 13:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1994156883;
	Tue, 17 Sep 2024 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyYXdfvO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCF816B75B
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Sep 2024 13:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726579730; cv=none; b=rb132Z+wIHBWS5lGXh603N7ZBT4GuWcXNDe0nd+n4FCKUynGn8zfe1NBH9xk9H1UAErBz6OuLPNRcGeUbZHTK7fKGJLyryrJaG6fpYCVDOX673UqfEvzVE3iugsBJPMyS8+7bP0lrRrVyxhhY+xr10FH1WUFQd9nZSKkUfimLeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726579730; c=relaxed/simple;
	bh=Xtse8SplEhwkM5t6ZQFuIaF4PKKTn68E37CtYzCjOxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ub3LUjO8uHfDAbLsVxuEvwQwHcRhJreNZX0KhdNogxm4fk2FlV4w9H69mdmxdSDGcFXGh+dTVW+nBKcFsURvxyob4Y+2B3TRMZleADp1OYyDS3jLliBCfhdBZhFH3YaUXQouwWn+7yBv7tK06CZn5QQ6YZldyRW7CLEQ8PfweOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyYXdfvO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC185C4CEC5;
	Tue, 17 Sep 2024 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726579730;
	bh=Xtse8SplEhwkM5t6ZQFuIaF4PKKTn68E37CtYzCjOxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyYXdfvOjBJKQxi/oAIPBC3UGP5bn33Yh6MygZfcOGG1aIGngzSjtNjJeU2qmmwHo
	 /i5fb23lyD0S3lxArn1Jqpmd093n9m3oBP3PLhd+XMpM0qrP3UoRrKp0lrxR0KaQrP
	 K9LZUWpwSRmRk5daSnNDBDkDgVrd8Vo6khBBi4etfToamK/M0GyVD7BGDr0zxadiX9
	 1m4SVkp39MkrqovsX2E2xJDkVqTBIjdm+bgvwPBaudSxXgJoB+NE5GkFLO8E9BielG
	 EXHUDlfzzah4JK8EvCpTulQRqIlAKMR7HjOIiBC8pyDvAmNx1tHl8QHNXMHHCIyd63
	 XxXpgEvOMcFdw==
Date: Tue, 17 Sep 2024 06:28:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Uday Shankar <ushankar@purestorage.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: rpm-pkg: include vmlinux debug symbols
Message-ID: <20240917132848.GA2357574@thelio-3990X>
References: <20240910014327.1726214-1-ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910014327.1726214-1-ushankar@purestorage.com>

Hi Uday,

First of all, you might not get many comments on this patch for several
days because it is conference week (Open Source Summit, Linux Security
Summit, and Linux Plumbers Conference). Sorry for the delay in review as
a result.

On Mon, Sep 09, 2024 at 07:43:27PM -0600, Uday Shankar wrote:
> None of the RPMs created by make rpm-pkg appear to contain vmlinux debug
> symbols (though debug symbols for modules are left in the .ko files in
> the kernel-%{KERNELRELEASE} package). This causes issues when trying to
> run tools like systemtap against kernels produced via make rpm-pkg. Add
> the vmlinux debug symbols to the kernel-%{KERNELRELEASE} package (at
> /lib/modules/${KERNELRELEASE}/vmlinux.debug).
> 
> Signed-off-by: Uday Shankar <ushankar@purestorage.com>
> ---
>  scripts/package/kernel.spec | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index ac3e5ac01d8a..f5d6ce95b4f0 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -60,6 +60,15 @@ cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEAS
>  # DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
>  %{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} DEPMOD=true modules_install
>  %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
> +(
> +	# eu-strip tries to truncate its output file, which does not end
> +	# well with -o /dev/null. so output to a junk temp file instead
> +	tmp=$(mktemp)
> +	trap "rm -f $tmp" 0
> +	eu-strip --remove-comment \
> +		-f %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinux.debug \
> +		-o $tmp vmlinux
> +)

Why not match what the Arch Linux and Debian packages do and just add
the whole vmlinux to the package under either /usr/lib/debug or
/usr/src/debug? This also appears to match the official Fedora package
and it does not mandate the use of eu-strip.

Masahiro might have further comments though.

Cheers,
Nathan

>  cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
>  cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
>  if %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='test -d ${srctree}/arch/${SRCARCH}/boot/dts' 2>/dev/null; then
> 
> base-commit: e3bf4ec9d54ed96fb3eb7dd53edcc9452897604d
> -- 
> 2.34.1
> 

