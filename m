Return-Path: <linux-kbuild+bounces-9764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A2C7B948
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 20:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2152C4E9EBC
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 19:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F93F303A3C;
	Fri, 21 Nov 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vA0nnPi2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2A3302CAB;
	Fri, 21 Nov 2025 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754424; cv=none; b=gOsy/bkLkDZyDcj1+9s5HI0CH2r8zTVdDScJfOXGF4g/McZNBeQsEOaB3xTkMYOwrRTHWcL6Y0TF0SkIxin53Q8e4tTa6u5G7u1+TD9o6MVKXYeUGtgIb2Mo9iLeta2D7FJ86WRWW+nibc0kIVQESZuqhm8FEEfS1w3/3wn48/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754424; c=relaxed/simple;
	bh=G12g/v72rpg6oHwIsKwW7r2AWt7vFH3TU2TWjKKMmTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLzRHgy3G4Ecb97SgHqWO3SE3OjjWcQMCa+qh/SaMUlCijq3oWVZ1PqPl54Zc6AHLA21HKlCENH8dEBqQPPejgtTmDfoXdgwDYNJb+8ttr/xQe2JOCNARfydg84Mi4pV7f5+sN001n+vdYh8zf22XgPTGQC5m7xvEhdS+aHDCJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vA0nnPi2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A08C4CEF1;
	Fri, 21 Nov 2025 19:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763754423;
	bh=G12g/v72rpg6oHwIsKwW7r2AWt7vFH3TU2TWjKKMmTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vA0nnPi2O04n7Q5BW039HbXJtxLU0zsf+WGFpaPBzSwMaFdCStHsyGV0r4EQ5NcmW
	 4AljIb7Mm8w1Q+0QbxTmLUGLDFa5TD8/PckwsAoc8Qvqkho6HvGFTwQV+7Do4HJfiK
	 x6deAs6N7fhGNP9OQAnilEPoP5YuXB63Kzv/W8lEG0z5ExpFFFG02OQLB6QctjxKhn
	 XV3tRvRC85odnCZjI6kHSTii8AHOMQbn2wsPmvUjoez117IMuoEobrkNkMMlycU9/M
	 Lx6YmzfEgfrlezTqXCmHQBSRwR8tibr8smfoshaPW8yOJt0kJIAR1+pFJkYe7oXByZ
	 37JqUibbW9QOg==
Date: Wed, 19 Nov 2025 21:20:32 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>, Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <aR4mkHDgVOj3715A@derry.ads.avm.de>
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-7-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119181333.991099-7-sjg@chromium.org>

On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Add image.fit as a target which requires modules, so that modules will
> built automatically when using FIT_MODULES is not empty.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>

I think the

Reviewed-by: Nicolas Schier <nsc@kernel.org>

is enough :)

Thanks.


> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> Changes in v6:
> - Mention that FIT_MODULES just needs to be non-empty
> - Make use of modules.order instead of using 'find'
> 
> Changes in v5:
> - Build modules automatically if needed (fix from Nicolas Schier)
> 
> Changes in v4:
> - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> - Use an empty FIT_MODULES to disable the feature, instead of '0'
> - Make use of the 'modules' dependency to ensure modules are built
> - Pass the list of modules to the script
> 
>  Makefile             | 1 +
>  arch/arm64/Makefile  | 1 +
>  scripts/Makefile.lib | 6 +++++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 8cd46222fc48..4eccaef95826 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -773,6 +773,7 @@ endif
>  # Just "make" or "make all" shall build modules as well
>  
>  modules-targets := all
> +modules-targets += $(if $(FIT_MODULES),image.fit)
>  modules-targets += modules
>  modules-targets += nsdeps
>  modules-targets += compile_commands.json
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 73a10f65ce8b..7036f251ab40 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -174,6 +174,7 @@ endif
>  all:	$(notdir $(KBUILD_IMAGE))
>  
>  image.fit: dtbs
> +image.fit: $(if $(FIT_MODULES),modules)
>  
>  vmlinuz.efi image.fit: Image
>  $(BOOT_TARGETS): vmlinux
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1d581ba5df66..28e0cc0865b1 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -398,11 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
>  # Use this to override the compression algorithm
>  FIT_COMPRESSION ?= gzip
>  
> +# Set this to non-empty to include an initrd with all the kernel modules
> +FIT_MODULES ?=
> +
>  quiet_cmd_fit = FIT     $@
>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> -		--name '$(UIMAGE_NAME)' \
> +		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> +		$(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>  
>  # XZ
> -- 
> 2.43.0
> 

-- 
Nicolas

