Return-Path: <linux-kbuild+bounces-9936-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40498C99990
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 00:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA68E3A149A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 23:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F9A2877E8;
	Mon,  1 Dec 2025 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arSFJ0KH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59176192B75;
	Mon,  1 Dec 2025 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764632219; cv=none; b=IRNIGKRDfjLmS20y5r0n4QFLY67d3XZ0YMKQw0E4yv3lbhHBFybnA1KE9hrcj6nOLuZ4nLHZLDmI+qPa7YJ3hJU0En3Wuj/y2CplPRrtT2AD5oYpMiN+nis2OLH7+7+xx4bse8XcF/p04AhUQNUDZ5S4MkHW/IePZQPctYMhyKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764632219; c=relaxed/simple;
	bh=Nv42c72d7HMMy+9VNtksidEP/EgKDQ53P/Uj+NgeGlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIYvqIw5CzYUFYC9XLz+xwQ4WYbKjV5bXfnkEigGvVxgG+LGBxDEqbxj13XvWx6iIc3QHWzllIN7liFeF0eXEBEDk4uNW4D/d88R35f4JJ4iC2xBYQ/tn60IWYZiOd5go+z/ddLQItK912GMwQsxAOMNUnCnOtIIZELL8bSHhNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arSFJ0KH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59780C4CEF1;
	Mon,  1 Dec 2025 23:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764632219;
	bh=Nv42c72d7HMMy+9VNtksidEP/EgKDQ53P/Uj+NgeGlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arSFJ0KHc+VGyp3C470dWYNqtj6/kseC4IdBAu75x480mgmbxMKVTcNC03Cixpb+L
	 IanDN0tQHcprlnhmnnV4pBLQuBmhssQtyRdGCu69hvGd9gGJR9qjH68X5FpysHpZxn
	 HwRuimRTV6TE1LiUN6vf8SqD3oNjMV1DThvpqQ+dtgEK0DvhQ4SS5R+EDuz3bsrtf+
	 DFstlLm7m2XtIOEP4m7jErZebBkFjlCChitm9Av979dphEe2vU6AxzWpXmybiVUiY8
	 DemCaiwJiq20Y7pkrU/jRRM0v89B4qm4DyOSlat7cn8gALZFyf6FAHOOXXBPFxCGcl
	 6h4J9SeysBD+A==
Date: Mon, 1 Dec 2025 16:36:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: Add top-level target for building gen_init_cpio
Message-ID: <20251201233654.GA2018462@ax162>
References: <20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-v1-1-84c63a8fc8d4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-v1-1-84c63a8fc8d4@kernel.org>

On Fri, Nov 28, 2025 at 09:01:55PM +0100, Nicolas Schier wrote:
> Add a top-level target for building gen_init_cpio to prevent re-entering
> kbuild for 'modules-cpio-pkg'.
> 
> The recently introduced target 'modules-cpio-pkg' depends on
> gen_init_cpio but there is no simple way to add this dependency as a
> prerequisite that can be built in parallel to other recipes.
> 
> Introducing the top-level target, enables fixing this and also prepares
> a possible move of gen_init_cpio from usr/ to scripts/.
> 
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

Do you want to take this for a late 6.19 features pull request or should
I pick it up during the 6.20 cycle?

> ---
>  Makefile                 | 6 ++++++
>  scripts/Makefile.package | 1 -
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 17cfa11ca716..d5750e5bd633 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1383,6 +1383,10 @@ ifdef CONFIG_HEADERS_INSTALL
>  prepare: headers
>  endif
>  
> +PHONY += usr_gen_init_cpio
> +usr_gen_init_cpio: scripts_basic
> +	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
> +
>  PHONY += scripts_unifdef
>  scripts_unifdef: scripts_basic
>  	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
> @@ -1635,6 +1639,8 @@ distclean: mrproper
>  # Packaging of the kernel to various formats
>  # ---------------------------------------------------------------------------
>  
> +modules-cpio-pkg: usr_gen_init_cpio
> +
>  %src-pkg: FORCE
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
>  %pkg: include/config/kernel.release FORCE
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 83bfcf7cb09f..0ec946f9b905 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -201,7 +201,6 @@ quiet_cmd_cpio = CPIO    $@
>        cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
>  
>  modules-$(KERNELRELEASE)-$(ARCH).cpio: .tmp_modules_cpio
> -	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
>  	$(call cmd,cpio)
>  
>  PHONY += modules-cpio-pkg
> 
> ---
> base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
> change-id: 20251128-kbuild-add-top-level-target-for-building-gen_init_cpio-6401e0ee0710
> prerequisite-message-id: 20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de
> prerequisite-patch-id: 9132e567c46357daaf2bd728ff18bfda1c51a9cb
> prerequisite-patch-id: 0dfe03db654169d314d3baaba8536a9bfc9bcc70
> 
> Best regards,
> -- 
> Nicolas
> 

