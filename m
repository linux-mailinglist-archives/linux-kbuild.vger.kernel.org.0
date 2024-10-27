Return-Path: <linux-kbuild+bounces-4345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E549B1FBA
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 19:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E334F1F2131A
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF6E126BFF;
	Sun, 27 Oct 2024 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io7ZiTud"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8974059;
	Sun, 27 Oct 2024 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730054121; cv=none; b=bEhyLTFAaVUmfrbTzxqlXuby4Ds37LDooPzKoltOdY5BbjqFyEUkjGy9f1THvlAQIpwDnJs3ncXhENsUUQtq+WwdEMCmCfIJhjdoFd4OvXBlt9g5z6MGCSW9j70LKsqY8OoT7jERM4KUFIyHYJbVTz4HBSFW7ew0Pfk/WGnfw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730054121; c=relaxed/simple;
	bh=hgF8oAOUHTxYFJuG6PZcIEkjAcfoOHQyOIInrNpRCco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxcQm1ex6H5Gjf8X0flfGQid1SloxNgt2IY6OqTlUv2IfTbXSDKJZY2yhoIT8r2QV4b5wJswcW2CTeMY4CHx1WIFlq8t/XElYklW9+9GPyasFbjwp9FrU39mnTsCPhuSSBhlJQSAh70NmoIXky1sNzgOWp2/46XMfclZ9WBhV6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Io7ZiTud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6424C4CEC3;
	Sun, 27 Oct 2024 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730054121;
	bh=hgF8oAOUHTxYFJuG6PZcIEkjAcfoOHQyOIInrNpRCco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Io7ZiTudYMkxQRff64k97SWbVCqov77hqxZ01lv7HwBCqh3t9cIORs2GYGaNsxJp9
	 hhFbAWIbuHboN3lqnSmR5nlKDXu/W0Ys7qAQmgQ4k/KmVZWkNbptXz+d4Q4rOP7bu/
	 bavfydbA+sM7BBicnKdaBV8NuIB4WK7AjVHryq2XMj9r4b8Ztot0Dvd/GOuuwOWxfS
	 s3CYvpyVO3jde9GNl30W5oUcWZZHC7sg1O/KQNe5y5hk4+1gly114uZVlnQRyCDh6O
	 fmeOKHzI+LIHbhrspFYVlelsjl+vvmrvmH6s3zL3tRTPtKqlSiQMsodvGPMyBsMn44
	 QbcbeFzKfWsQQ==
Date: Sun, 27 Oct 2024 11:35:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <benh@debian.org>,
	Ron Economos <re@w6rz.net>, Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kbuild: rpm-pkg: disable kernel-devel package when
 cross-compiling
Message-ID: <20241027183519.GB2755311@thelio-3990X>
References: <20241022181703.1710116-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022181703.1710116-1-masahiroy@kernel.org>

On Wed, Oct 23, 2024 at 03:16:57AM +0900, Masahiro Yamada wrote:
> Since commit f1d87664b82a ("kbuild: cross-compile linux-headers package
> when possible"), 'make binrpm-pkg' may attempt to cross-compile the
> kernel-devel package, but it fails under certain circumstances.
> 
> For example, when CONFIG_MODULE_SIG_FORMAT is enabled on openSUSE
> Tumbleweed, the following command fails:
> 
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-suse-linux- binrpm-pkg
>       [ snip ]
>   Rebuilding host programs with aarch64-suse-linux-gcc...
>     HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/kallsyms
>     HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/sorttable
>     HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/asn1_compiler
>     HOSTCC  /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/sign-file
>   /home/masahiro/ref/linux/rpmbuild/BUILDROOT/kernel-6.12.0_rc4-1.aarch64/usr/src/kernels/6.12.0-rc4/scripts/sign-file.c:25:10: fatal error: openssl/opensslv.h: No such file or directory
>      25 | #include <openssl/opensslv.h>
>         |          ^~~~~~~~~~~~~~~~~~~~
>   compilation terminated.
> 
> I believe this issue is less common on Fedora because cross-compiling
> user-space programs is not possible, even if the gcc-aarch64-linux-gnu
> package is installed. In other words, CONFIG_CC_CAN_LINK is unset.
> 
> On Fedora 40, the package information explains this limitation clearly:
> 
>   $ dnf info gcc-aarch64-linux-gnu
>       [ snip ]
>   Description  : Cross-build GNU C compiler.
>                :
>                : Only building kernels is currently supported.  Support for cross-building
>                : user space programs is not currently provided as that would massively multiply
>                : the number of packages.
> 
> This commit disables the kernel-devel package when cross-compiling
> because cross-compiling RPM packages is somewhat challenging, and I
> did not come up with a better solution.
> 
> Fixes: f1d87664b82a ("kbuild: cross-compile linux-headers package when possible")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/Makefile.package | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 11d53f240a2b..b9a4b0c8b8a0 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -72,7 +72,8 @@ rpm-pkg srcrpm-pkg binrpm-pkg: rpmbuild/SPECS/kernel.spec
>  	--define='_topdir $(abspath rpmbuild)' \
>  	$(if $(filter a b, $(build-type)), \
>  		--target $(UTS_MACHINE)-linux --build-in-place --noprep --define='_smp_mflags %{nil}' \
> -		$$(rpm -q rpm >/dev/null 2>&1 || echo --nodeps)) \
> +		$$(rpm -q rpm >/dev/null 2>&1 || echo --nodeps) \
> +		$(if $(cross_compiling), --without=devel)) \
>  	$(RPMOPTS))
>  
>  # deb-pkg srcdeb-pkg bindeb-pkg
> -- 
> 2.43.0
> 

