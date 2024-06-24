Return-Path: <linux-kbuild+bounces-2245-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CF9157C0
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 22:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82C37284D4A
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 20:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6084642D;
	Mon, 24 Jun 2024 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giHbMji3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825291A0717;
	Mon, 24 Jun 2024 20:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719260301; cv=none; b=TazONW3pyxI8Hm24dkYvpg49dFf6ThjzaE0CtMD7t1HnuYVHl01YHEHxGBvRCgVU/e0vNqd5gX81m8AvW+x/UxxJ2srirDp6xUWzN5eGqjKUaXrAQ6bVY4u3O2feNN5dK6BBGRn6Y44/SPjRvAHlx5KIYbk6YQjvH/SfqRW5oFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719260301; c=relaxed/simple;
	bh=DO3F18f5SP8f/MW8gwjfbWiSJPAYVs+z8iZoxQFISiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptRyn/7301eDuGO/cwEqR5nkmDxLBYOrO5dCR4E9iY7Lyqe+RYGDhP/gcylnoeTieYE6WrF3BQer//WuML0+H/9m2F6ejH04BEUrtAFdxEi4X0KLHz9Cj73wGqjoewTzyPRO/RFqp4psAFZnMG0rmsfamx2mVqnBNpv38Vgf+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giHbMji3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6997C2BBFC;
	Mon, 24 Jun 2024 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719260301;
	bh=DO3F18f5SP8f/MW8gwjfbWiSJPAYVs+z8iZoxQFISiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=giHbMji3CYwfeiqD8pY4mqugoWrrhHgw1f0I5G/R/+73iM4AbHSlk1xqzuYBgIxqU
	 DDiTPV4F/GgmGykqWHjliMsgEoMhxKVrGp1wlEfpBcyUob91Fqm8WlRIh/hEqvVZf8
	 uHMhux0uUfvAYo9lYpB3D+BZZ7K/1co85GPpwUREey7A7LgLO8MweyOZkzToBfkbsO
	 OMyU8L8YQbK4z8LTYPQiMgq4DLyyWwiBS327C0G4eAESnjFxiTksHaqWQh5Kc8malm
	 O//xzbkwjW0/OuqWNjA+TwTGHDrO4+Wk0s3ArKJVpprzyI0326JZ0LinY1LHO5Ro6+
	 LiXA2mYAT0cFA==
Date: Mon, 24 Jun 2024 13:18:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH v2] kbuild: rpm-pkg: fix build error with CONFIG_MODULES=n
Message-ID: <20240624201819.GA783641@thelio-3990X>
References: <20240618110850.3510697-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618110850.3510697-1-masahiroy@kernel.org>

On Tue, Jun 18, 2024 at 08:08:43PM +0900, Masahiro Yamada wrote:
> When CONFIG_MODULES is disabled, 'make (bin)rpm-pkg' fails:
> 
>   $ make allnoconfig binrpm-pkg
>     [ snip ]
>   error: File not found: .../linux/rpmbuild/BUILDROOT/kernel-6.10.0_rc3-1.i386/lib/modules/6.10.0-rc3/kernel
>   error: File not found: .../linux/rpmbuild/BUILDROOT/kernel-6.10.0_rc3-1.i386/lib/modules/6.10.0-rc3/modules.order
> 
> Specify the directory path, /lib/modules/%{KERNELRELEASE}, instead of
> individual files to make it work irrespective of CONFIG_MODULES.
> 
> However, doing so would cause new warnings:
> 
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.alias
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.alias.bin
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.builtin.alias.bin
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.builtin.bin
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.dep
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.dep.bin
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.devname
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.softdep
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.symbols
>   warning: File listed twice: /lib/modules/6.10.0-rc3-dirty/modules.symbols.bin
> 
> These files exist in /lib/modules/%{KERNELRELEASE} and are also explicitly
> marked as %ghost.
> 
> Suppress depmod because depmod-generated files are not packaged.
> 
> Fixes: 615b3a3d2d41 ("kbuild: rpm-pkg: do not include depmod-generated files")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Changes in v2:
>   - Do not run depmod
> 
>  scripts/package/kernel.spec | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index e095eb1e290e..fffc8af8deb1 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -57,7 +57,8 @@ patch -p1 < %{SOURCE2}
>  %install
>  mkdir -p %{buildroot}/lib/modules/%{KERNELRELEASE}
>  cp $(%{make} %{makeflags} -s image_name) %{buildroot}/lib/modules/%{KERNELRELEASE}/vmlinuz
> -%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} modules_install
> +# DEPMOD=true makes depmod no-op. We do not package depmod-generated files.
> +%{make} %{makeflags} INSTALL_MOD_PATH=%{buildroot} DEPMOD=true modules_install
>  %{make} %{makeflags} INSTALL_HDR_PATH=%{buildroot}/usr headers_install
>  cp System.map %{buildroot}/lib/modules/%{KERNELRELEASE}
>  cp .config %{buildroot}/lib/modules/%{KERNELRELEASE}/config
> @@ -70,10 +71,7 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
>  %endif
>  
>  {
> -	for x in System.map config kernel modules.builtin \
> -			modules.builtin.modinfo modules.order vmlinuz; do
> -		echo "/lib/modules/%{KERNELRELEASE}/${x}"
> -	done
> +	echo "/lib/modules/%{KERNELRELEASE}"
>  
>  	for x in alias alias.bin builtin.alias.bin builtin.bin dep dep.bin \
>  					devname softdep symbols symbols.bin; do
> -- 
> 2.43.0
> 

