Return-Path: <linux-kbuild+bounces-9690-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8554DC725B4
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 07:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B1695350B0C
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 06:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CF221B9FD;
	Thu, 20 Nov 2025 06:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9OPOdaL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A1D531;
	Thu, 20 Nov 2025 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763620781; cv=none; b=hPVAD8Ua0OZQvEadJ3gVOcggQjKTSVNucbeEmijhHa/jpbnuA/mjx5lSRm1ZzgXOVzh5+udD1i6Qi0gXjMq5FReZQ8Y/75jmG5y02KtgbZd4mNhV45WNTxtqMcgKPj+4It5U91WTEXtDLajoDDOv3NILUoQHsTvclbw+BjKiFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763620781; c=relaxed/simple;
	bh=Bjr1f4LmqAuec76mt0wT0PB8XOyz0eLzrvfzrgqunq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYF2Yrh+dI5C0npTOpSTmYU2r4/MLCC5TIv/dvCsFFfU7y2wjN3g6bbbECDU0YT3e98IIUa+2Jqk4RcXL8wFrfoTK0r91ZLXll/j6/VsEGsHnEbUgnWnQevp8qVuQ0Qc5b3xcmrgJ5b35v9Pbv/XCQ9ju5ixVTfzr1pzeI7IX7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9OPOdaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 867DAC4CEF1;
	Thu, 20 Nov 2025 06:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763620781;
	bh=Bjr1f4LmqAuec76mt0wT0PB8XOyz0eLzrvfzrgqunq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9OPOdaLUYkzJlf5NWp9uq2CTRT1/ggyuMegH97WcPLLAOkxhs6I5IHE3G1bmp8sA
	 q0aGTWGkpxv2bRjL8jdMIVvh4HG7c5UX3q3+ZkJqtlIw1qV7ZH7igUsTNT49l/ZHK5
	 NvdPoB6mlUVUG9Obdud1LmxdcVrUsf+tbmOgsxwh9qr4Lfh8BsgJNJ9EhKmWMWnxFQ
	 hiAYhfIsJwhH9QobBbeXyWVSX1ujXtrClE36Wfyn2TcpqdO6VfXTIXarQjmfVlE2ZJ
	 OfTnEGbVfRsW6Ju7rInxIPeTAbscRAN6yk7UlO0YeSJe6ge5x74N8nzsHCLFxztIPS
	 Zee2E75CfE7SA==
Date: Wed, 19 Nov 2025 23:39:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] kbuild: add target to build a cpio containing modules
Message-ID: <20251120063936.GA3321365@ax162>
References: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>

Hi Ahmad,

On Sat, Nov 15, 2025 at 03:21:51PM +0100, Ahmad Fatoum wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Add a new package target to build a cpio archive containing the kernel
> modules. This is particularly useful to supplement an existing initramfs
> with the kernel modules so that the root filesystem can be started with
> all needed kernel modules without modifying it.

Yeah, I would say this is pretty useful, I have already used it while
triaging another issue.

> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Co-developed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  .gitignore               |  5 +++++
>  Makefile                 |  2 +-
>  scripts/Makefile.package | 17 +++++++++++++++++
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index 86a1ba0d90353962183b47c0c657ec877e5b2f9f..764d115400d90f0904b8f60ea8851a7860c16411 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -96,6 +96,11 @@ modules.order
>  #
>  /tar-install/
>  
> +#
> +# modules directory (make cpio-modules-pkg)
> +#
> +/modules-install/
> +
>  #
>  # pacman files (make pacman-pkg)
>  #
> diff --git a/Makefile b/Makefile
> index fb4389aa5d5f1776f7bb5988102ed54f92491de7..19c7900d02ed5eee06f00820c138591b42e895e1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1583,7 +1583,7 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES += include/config include/generated          \
>  		  arch/$(SRCARCH)/include/generated .objdiff \
> -		  debian snap tar-install PKGBUILD pacman \
> +		  debian snap tar-install modules-install PKGBUILD pacman \
>  		  .config .config.old .version \
>  		  Module.symvers \
>  		  certs/signing_key.pem \
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 74bcb9e7f7a4516473481468a0fcf700c3bead33..20eec9e2dec4dda3fa0ef64a15b80dccdcb55f90 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -189,6 +189,22 @@ tar-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar
>  tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>  	@:
>  
> +modules-install: FORCE
> +	$(Q)$(MAKE) -f $(srctree)/Makefile
> +	$(Q)rm -rf $@
> +	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> +
> +quiet_cmd_cpio = CPIO    $@
> +      cmd_cpio = $(srctree)/usr/gen_initramfs.sh $< > $@
> +
> +modules-$(KERNELRELEASE)-$(ARCH).cpio: modules-install
> +	$(Q)$(MAKE) -f $(srctree)/Makefile $(build)=usr cpio-data= usr/gen_init_cpio

This seems like a bit of a hack to generate gen_init_cpio this way but I
am not sure it is worth moving usr/gen_init_cpio.c and
usr/gen_initramfs.sh elsewhere (scripts?) to make it a most accessible
hostprog right now... Nicolas, do you have any opinions on this?

> +	$(call cmd,cpio)
> +
> +PHONY += cpio-modules-pkg
> +cpio-modules-pkg: modules-$(KERNELRELEASE)-$(ARCH).cpio

I think it would make a little more sense (and match the style of the
perf package targets as well) to name this target modules-cpio-pkg.

> +	@:
> +
>  # perf-tar*-src-pkg - generate a source tarball with perf source
>  # ---------------------------------------------------------------------------
>  
> @@ -245,6 +261,7 @@ help:
>  	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
>  	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
>  	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
> +	@echo '  cpio-modules-pkg    - Build the kernel modules as cpio archive'
>  	@echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
>  	@echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
>  	@echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'
> 
> ---
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> change-id: 20251115-cpio-modules-pkg-70d85a69892b
> 
> Best regards,
> -- 
> Ahmad Fatoum <a.fatoum@pengutronix.de>
> 

