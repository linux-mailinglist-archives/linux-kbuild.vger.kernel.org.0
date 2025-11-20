Return-Path: <linux-kbuild+bounces-9693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C339CC72A64
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 08:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 806562A578
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 07:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBE01C7012;
	Thu, 20 Nov 2025 07:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="36gIT7nE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+im0up9G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27F6D531;
	Thu, 20 Nov 2025 07:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763624958; cv=none; b=kx6FDNp3QpScXahJZU9sEW9nkJVOj9Jtnx6+vJHOjTjb0QEw4lJKB1BHE8lBmGbFamwQvNxHJExOqyVt+azzHjrXVncrvqUVObsZYkQW3oQtYyZJwHxHU4buNGHXi0ALdLYRP5J5eAfJuOTS65RxF/27mu56b9zslNJAxJsUfTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763624958; c=relaxed/simple;
	bh=ms1Moo/6odqd3J1ShMUHrLxS3ADporEnRdtApNSbnyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6f9BaGaruop0QZ5ZUt7t/exHqTeRmAK4aBumYtcE2ssBd+JgycE/ZKa5/dVGjhQly2cbbq5FtjFPcisyCDA+hcJxPIRogcoiVh4NnZDn2bqdJY3WGvIZ09ZHZ2ZTbc72XrBK+QpenClyLuoqrD/kMfybJkvVI+YBNPgfC3Mrso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=36gIT7nE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+im0up9G; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 20 Nov 2025 08:49:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763624955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pN66/aziM8FLBGXMDRc1fqp3c53JCtA+Qj3cip4GEus=;
	b=36gIT7nE+F2U/HaP/Jhq3JbpOhAw4ZuqDQVvZFQtIw3D8UAsv252FfYz4j4Z+J6tVJvfuY
	PqN2VIFAkDgQeKBTQ6BU+k+hoaUyQ1D3VmqyhvUmS/xz6Fk5yoYSh/rHEd8ziRaFh6NoMt
	1a7FcmxXSv4/LIBKPzvoDFxgok0dKHzxLLUukxYXT5eEZ8k0cypAFvR5DiXGpX8G9eC1lG
	+6Uqf7NfwtFxxANxhakvRl9kpLyaL6/5DDODyBMpI4vceYn6vWLMULYxvLGqhczfSrusNn
	LA9fplqBf48XcjTXQKbQEs7Iel2qJWIsLWXriF7sVFsh++huHEwGcYOBVbk9YA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763624955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pN66/aziM8FLBGXMDRc1fqp3c53JCtA+Qj3cip4GEus=;
	b=+im0up9G77Lr415VNwNxEueuVq7kWcvxeyn3rWfiWgn1DP998nkfcdF5RPWdFy/OHHsBan
	TBRA6O3UyutwcADA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>, 
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
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

Remnant of a previous revision?

>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> +		$(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \

I am wondering how module dependencies work without the depmod invocation
and modules.dep file.

>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>  
>  # XZ
> -- 
> 2.43.0
> 

