Return-Path: <linux-kbuild+bounces-841-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD084ABA3
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 02:35:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E87C1F24FDF
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Feb 2024 01:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00E0EDF;
	Tue,  6 Feb 2024 01:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtM5IkFT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4CED9;
	Tue,  6 Feb 2024 01:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707183311; cv=none; b=BZK7SSEj3mL0zVlAZIpiLVBuRsNLw2+BtXk0GPD3KmqKD4LcLZgZYJL6MHqf92+rI9mThXIST2RJWNheazXxaqiciZhOObkY9xFIvriM8LP68qCVlbeyfLmBgYHYiy8QjmVEcDecuImjw7IJ4wkpdPqC1Mm+fG7DgLYU8fs3P6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707183311; c=relaxed/simple;
	bh=nxiuL3ikLLQlErz9ldxF1gm9uIpqXguVlOjsCUXQYjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAGgUIeqvC0EnXyhIKKXWM9jUwQ7gksK2ze7ENkgu6i7vjqLMEARHlSttvjLnHLQ7SoT0/uaWTbiVb9BO7x9OjQmI9G9pZ2pyD5qgsupibdrdzSvH1okYv/Hd8Imi4k+xrYdNnREn312/OV86CspGQCCzZQTXZOD0K6l9CPQfL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtM5IkFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D705C433F1;
	Tue,  6 Feb 2024 01:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707183310;
	bh=nxiuL3ikLLQlErz9ldxF1gm9uIpqXguVlOjsCUXQYjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtM5IkFTnjk5ZpDHC788Rxt38lwYYMfr/VRkFbM3m/CepnPLZmp9tzM+HBbk5jBSa
	 RZtCHE52oMUBQ13Kog7H2s7k1noO3CulClCMA+lQlvHu5j6zp2PvlDLBdSad2usOaV
	 QC/+zlUYn2AqL6RHJIa3zlO6oNjbreiKjUl1Hc1nIIx2rw7evrcxOFzACaBqo9AYuR
	 mSw5x2NeJKuFST0GKLRpMMcziAMOqsr9ZgCOjQor6N9sD8jIHFaEobfBuAK5YKl2lc
	 qKyJl8z/cz0/aYUVFgeZAqQtNgJg5WcJvLBQfCZfEVIYwTdYWPmLwSowg53DGAivu9
	 LD80M3+6rzq2g==
Date: Mon, 5 Feb 2024 18:35:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] kbuild: rpm-pkg: do not include depmod-generated
 files
Message-ID: <20240206013508.GA3151678@dev-arch.thelio-3990X>
References: <20240202133520.302738-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202133520.302738-1-masahiroy@kernel.org>

On Fri, Feb 02, 2024 at 10:35:17PM +0900, Masahiro Yamada wrote:
> Installing the kernel package is fine, but when uninstalling it, the
> following warnings are shown:
> 
>   warning: file modules.symbols.bin: remove failed: No such file or directory
>   warning: file modules.symbols: remove failed: No such file or directory
>   warning: file modules.softdep: remove failed: No such file or directory
>   warning: file modules.devname: remove failed: No such file or directory
>   warning: file modules.dep.bin: remove failed: No such file or directory
>   warning: file modules.dep: remove failed: No such file or directory
>   warning: file modules.builtin.bin: remove failed: No such file or directory
>   warning: file modules.builtin.alias.bin: remove failed: No such file or directory
>   warning: file modules.alias.bin: remove failed: No such file or directory
>   warning: file modules.alias: remove failed: No such file or directory
> 
> The %preun scriptlet runs 'kernel-install remove', which in turn invokes
> /usr/lib/kernel/install.d/50-depmod.install to remove those files before
> the actual package removal.
> 
> RPM-based distributions do not ship files generated by depmod. Mark them
> as %ghost in order to exclude them from the package, but still claim the
> ownership on them.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/package/kernel.spec | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index f58726671fb3..aaedb6d1b26f 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -66,6 +66,20 @@ ln -fns /usr/src/kernels/%{KERNELRELEASE} %{buildroot}/lib/modules/%{KERNELRELEA
>  %{make} %{makeflags} run-command KBUILD_RUN_COMMAND='${srctree}/scripts/package/install-extmod-build %{buildroot}/usr/src/kernels/%{KERNELRELEASE}'
>  %endif
>  
> +{
> +	for x in System.map config kernel modules.builtin \
> +			modules.builtin.modinfo modules.order vmlinuz; do
> +		echo "/lib/modules/%{KERNELRELEASE}/${x}"
> +	done
> +
> +	for x in alias alias.bin builtin.alias.bin builtin.bin dep dep.bin \
> +					devname softdep symbols symbols.bin; do
> +		echo "%ghost /lib/modules/%{KERNELRELEASE}/modules.${x}"
> +	done
> +
> +	echo "%exclude /lib/modules/%{KERNELRELEASE}/build"
> +} > %{buildroot}/kernel.list
> +
>  %clean
>  rm -rf %{buildroot}
>  
> @@ -78,6 +92,9 @@ for file in vmlinuz System.map config; do
>  		cp "/lib/modules/%{KERNELRELEASE}/${file}" "/boot/${file}-%{KERNELRELEASE}"
>  	fi
>  done
> +if [ ! -e "/lib/modules/%{KERNELRELEASE}/modules.dep" ]; then
> +	/usr/sbin/depmod %{KERNELRELEASE}
> +fi
>  
>  %preun
>  if [ -x /sbin/new-kernel-pkg ]; then
> @@ -91,10 +108,9 @@ if [ -x /sbin/update-bootloader ]; then
>  /sbin/update-bootloader --remove %{KERNELRELEASE}
>  fi
>  
> -%files
> +%files -f %{buildroot}/kernel.list
>  %defattr (-, root, root)
> -/lib/modules/%{KERNELRELEASE}
> -%exclude /lib/modules/%{KERNELRELEASE}/build
> +%exclude /kernel.list
>  
>  %files headers
>  %defattr (-, root, root)
> -- 
> 2.40.1
> 

