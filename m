Return-Path: <linux-kbuild+bounces-9636-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED08C5E441
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 17:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 396444E4F0B
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 15:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054F733030D;
	Fri, 14 Nov 2025 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RnUY5rWI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O85WkXy/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BE232ED3F;
	Fri, 14 Nov 2025 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763134177; cv=none; b=TRi8rDiybnlZA2LmvjSryrokUdbwNcA3KFWqAJ6cxxXBY0IdUoK+l29Ph9PjGKUaCxq0BgUpNK8bUjKKZ0vLEzs9s2ehYB75tG956lDGgkGEgQ0atVTLHP4LHAPc54SoYJVNxqNmdKWp0mAnTj2n07Ic2S0axPIl8Np5EfZwuEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763134177; c=relaxed/simple;
	bh=uGlugLJp0oJz+0iX1oKvz7hIsU8pjgt6mOhc/fYtG9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDzFFnijx5WkYVtYaw2TYHESsXJynE7yRsmtIu6cq9+Kek44LmpwqrOnzvevfW94Ve9iC1k7c+Y/+UF8FGPOHiHSKY5nVbYogrBRNvK4+XnXmlgUx1WVMEb9G3hPp+eb3PL11wCqpX2f4u46RHjqIl3z/qXmaofXn4Dd7KtcY5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RnUY5rWI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O85WkXy/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Nov 2025 16:29:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763134174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoyLw1vBRzfbe7y18qv3BekspAvWvfPmLJaNDkdEegI=;
	b=RnUY5rWIqJEh3dj9C7DXa7u8wSk/KK5l0Gkawp1HjwW5YwZ398UBLl7sh5FrIMlETbTeHq
	zMVUYBL1C5xOBj6nNNOoK/m6qXc38hzlycsirEcVjPil9YMucIdrdASId0L/FgDW/TW2tW
	asE4tN1dHC+psx6l0PvYCpIqQ6g2JWZZp+BSwq7EHBREaNSntivO4tjoWqVDYo/Z9Nn6mn
	N48ZG02WTGd+2eeR7iXOxawGiZaPZ8EPBzl6yGbKoLujw5OaJxFkYJee29FLVM+Fv7rXc4
	Idf5KH1HzrI0dOgxy6EKRNO/ZtGMS8yfSy17nJFHNrJ5AzNA0KzgIqYu0KVKjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763134174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HoyLw1vBRzfbe7y18qv3BekspAvWvfPmLJaNDkdEegI=;
	b=O85WkXy/vomNF9nDuy6zVsOWSErHJa0CNPb3rgZbOgbNIgJgbI4226HrXfvTbc+iJj6WcL
	AdIM3wKwbzE7JrBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Parth Pancholi <parth.pancholi@toradex.com>, 
	Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251114162255-10e006c6-dadc-44df-a8ed-ab4a00fc6402@linutronix.de>
References: <20251114142741.1919072-1-sjg@chromium.org>
 <20251114142741.1919072-7-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114142741.1919072-7-sjg@chromium.org>

On Fri, Nov 14, 2025 at 07:27:32AM -0700, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Add image.fit as a target which requires modules, so that modules will
> built automatically when using FIT_MODULES=1
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
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
>  Makefile             |  1 +
>  arch/arm64/Makefile  |  1 +
>  scripts/Makefile.lib | 10 ++++++++--
>  3 files changed, 10 insertions(+), 2 deletions(-)
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
> index 1d581ba5df66..c6a3aa653035 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -398,11 +398,17 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
>  # Use this to override the compression algorithm
>  FIT_COMPRESSION ?= gzip
>  
> +# Set this to 1 to include an initrd with all the kernel modules
> +FIT_MODULES ?=

'0' will also trigger that behavior.

> +
>  quiet_cmd_fit = FIT     $@
> -      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> -		--name '$(UIMAGE_NAME)' \
> +      cmd_fit = $(if $(FIT_MODULES), \
> +		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \

This will include stale module files. You can get an up-to-date list from
$(objtree)/modules.order with a bit post-processing.
Maybe kbuild can be extended to also create a list of the .ko files.
(I would be interested in that for my own usecases, too)

> +		$(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> +		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
>  		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>  		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
> +		$(if $(FIT_MODULES),--modules @$(objtree)/.modules-list) \
>  		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>  
>  # XZ
> -- 
> 2.43.0
> 

