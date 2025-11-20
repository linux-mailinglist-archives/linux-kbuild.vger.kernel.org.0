Return-Path: <linux-kbuild+bounces-9692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF2C729DE
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 08:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A827F4E5F0A
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 07:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691EF1C7012;
	Thu, 20 Nov 2025 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nWsyWNvt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4k3UswuL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82285288C0E;
	Thu, 20 Nov 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763623976; cv=none; b=r3OTk6r5Wn6PRKJMi7sNB9entVI2oFPAWvy+jKtfjiTP3Z/aQX/z6AFA+DERZe4/u/7ZJHr7/rQpmnKLPmbSmW0KRbA0J/8ne23TpYjmYZL3YDO6wFtLf58vSkUgXFOeuPEUYQSIxZl9ct0Tky1621ZxyyBHT86sm0d2N2e/zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763623976; c=relaxed/simple;
	bh=dZGBEy3Bvu6uEuEM9hwXHac9y0d4YBVelDsWfe1BGdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/vkPqNnqJKaqah57B637INL5lszzn4Wik+FUglbJ6mplcy1vDlB+TlQ2frVvLhuGv9idedrXsMJi8axV+lWRzpoek0uWkA/y8RUNkraGoGrfCFJnXM4K19J7+7kmkMsUkB6XKIxR+F98u/1/8+yHqb0VAL8JHnuqlK6+2uDEtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nWsyWNvt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4k3UswuL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 20 Nov 2025 08:32:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763623971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upnGzJ32pXzCZAuawCDaWe2EF3jV5yEify4Jlhb+N38=;
	b=nWsyWNvtVkFsWDacwMbrR5W0ZLlBoTImOVLTo3Bb0gGr//fsegBsEIhnrsGDI/IWv3bVfM
	fLmywQfiEBeiKELearX3rgs1whPd/4aKmVTdKDFlF4X5iFu94LxVjgcy0SGmZfsKKwySlT
	lnSEm/nPFqbB8Az3zmLRQaAffIBDCM1p/GkmhdbghI7H5aCBymIJZ92x4e0A2ZNVOgwTP+
	LVaCtnpvCv2kIz0jycMvhG2yIQmlJwe2BNd3zFTVSWRKO11fLSL+LO5rqREpovHkJPz68v
	ktJoave92TwF8bJy0rKWU/24qZKzKo1BtOskqAJhBF0J5WhXf5l17+JWq03eUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763623971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=upnGzJ32pXzCZAuawCDaWe2EF3jV5yEify4Jlhb+N38=;
	b=4k3UswuL5q14EbFqvA/FxG9kh189A6jTsgBonFfWJylfR4mO/Jonwkg7QtnaJZqt18qv80
	0QvyjFzSZDuhDIBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Simon Glass <sjg@chromium.org>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] kbuild: add target to build a cpio containing modules
Message-ID: <20251120080325-536d8deb-fdfe-4dc0-9687-d5d73006376c@linutronix.de>
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

On Sat, Nov 15, 2025 at 03:21:51PM +0100, Ahmad Fatoum wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Add a new package target to build a cpio archive containing the kernel
> modules. This is particularly useful to supplement an existing initramfs
> with the kernel modules so that the root filesystem can be started with
> all needed kernel modules without modifying it.
> 
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

The other package targets have a separator and documentation comment.

>  
> +modules-install: FORCE
> +	$(Q)$(MAKE) -f $(srctree)/Makefile
> +	$(Q)rm -rf $@

We have the filename prefix ".tmp_" for temporary files and directories.
These will be automatically ignored by git and cleaned up by "make clean".

> +	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> +
> +quiet_cmd_cpio = CPIO    $@
> +      cmd_cpio = $(srctree)/usr/gen_initramfs.sh $< > $@

Use $(CONFIG_SHELL).

Using '-o' instead of redirecting stdout to the output file should enable the
usage of the recent copy_file_range() optimizations in gen_init_cpio.

> +
> +modules-$(KERNELRELEASE)-$(ARCH).cpio: modules-install
> +	$(Q)$(MAKE) -f $(srctree)/Makefile $(build)=usr cpio-data= usr/gen_init_cpio

Drop the explicit '-f'; $(build) overwrites it.

Is the cpio-data= intended to make sure the line 'hostprogs := gen_init_cpio'
is executed? I don't think this works as usr/Makefile will overwrite 'cpio-data'
in any case. But it should be fine to make hostprogs definition unconditional.

> +	$(call cmd,cpio)
> +
> +PHONY += cpio-modules-pkg
> +cpio-modules-pkg: modules-$(KERNELRELEASE)-$(ARCH).cpio
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

