Return-Path: <linux-kbuild+bounces-9460-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FB5C434EF
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 22:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 797AA4E8E93
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 21:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EAC299929;
	Sat,  8 Nov 2025 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdDhKs7t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760D029898B;
	Sat,  8 Nov 2025 21:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762636793; cv=none; b=RdHIQjvo0ouGNZJxw10u+TI3Xtuj5dh1GodLWwFoi+SeDsOJt+1Yg8EH9M1tNKNgU+YwwncD1p+91JZgQrCtZGHOIGIpCaTKlOPvw25mJbnLozqZ4IxNfNjwOvqUQhNNsAzDmTcQ6KfD17720WYBbeYoeDweN9HfsNfP+eleE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762636793; c=relaxed/simple;
	bh=kBAZ8AOF544L6vZ+vxvpcNt3XqojsED13+xldvuDG8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3cuNeu0qt1aQfxfpTnLkil9I2Gu3QDoDo4Nn3Istq584qvuCLMWZFFlQ/Dbe1MJCBCZI/C7tmiZZmh1bCE/3nL/JMjASUj0skK+ytIh6A3sK9bl7UYVZyXdRChjKZ6SXNod1wckOXZ0v+yQSkLW0PjDQ+RAS+6QSjj4BGCvy1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MdDhKs7t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859EBC2BC9E;
	Sat,  8 Nov 2025 21:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762636793;
	bh=kBAZ8AOF544L6vZ+vxvpcNt3XqojsED13+xldvuDG8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MdDhKs7ts6uQNBIiTC55xDkfGH8fKCbYLirWzaVhhfYJOlY6K4LPFJDtHiuSanrW2
	 OoMmW8hQBNbcRZWo8iDZpHwmfE1DVwgYzQ2Sf8hpnTm9qeIWKxJ0/GEgHqUMfNcFAy
	 n4mXU69r1ioFEQKK66Xo9SdQga1R1RSHw+xv9e+vvzAj3olUpfbSWwHSICtM7qaNn+
	 TmsmAGoftlbkDXK5QY0Y5sMiWfWZmCaFZDT9Cbo78ZY1Srl60NIGKZF2cNX1pjKKe7
	 hqvy/Lgl1DvXqJ4L0YFSBfYjBUVh+5LsTaaneVKTsto8zS2VI3wAYsn18wxAhgUMir
	 2035eEOuntdPA==
Date: Sat, 8 Nov 2025 22:17:19 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Tom Rini <trini@konsulko.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
	Rong Xu <xur@google.com>, Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <aQ-zXyOr2FPz2V0Z@levanger>
References: <20251006230205.521341-1-sjg@chromium.org>
 <20251006230205.521341-6-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006230205.521341-6-sjg@chromium.org>

On Mon, Oct 06, 2025 at 05:01:56PM -0600, Simon Glass wrote:
> Support 'make image.fit FIT_MODULES=1' to put all the modules into a
> ramdisk image within the FIT.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> 
> Changes in v4:
> - Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
> - Use an empty FIT_MODULES to disable the feature, instead of '0'
> - Make use of the 'modules' dependency to ensure modules are built
> - Pass the list of modules to the script
> 
>  arch/arm64/boot/Makefile |  4 ++++
>  scripts/Makefile.lib     | 10 ++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> index b5a08333bc57..d10c85f96aea 100644
> --- a/arch/arm64/boot/Makefile
> +++ b/arch/arm64/boot/Makefile
> @@ -43,6 +43,10 @@ $(obj)/Image.zst: $(obj)/Image FORCE
>  $(obj)/Image.xz: $(obj)/Image FORCE
>  	$(call if_changed,xzkern)
>  
> +ifeq ($(FIT_MODULES),1)
> +.PHONY: modules
> +$(obj)/image.fit: modules
> +endif

This does not work for me.  I tried:

    make clean
    make image.fit FIT_MODULES=1

but modules are not built as KBUILD_MODULES is not set in top-level
Makefile.  Works for me with the following diff:


diff --git a/Makefile b/Makefile
index d14824792227..e6b8bcbdb073 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,13 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
+modules-targets := all
+modules-targets += $(if $(FIT_MODULES), image.fit)
+modules-targets += modules
+modules-targets += nsdeps
+modules-targets += compile_commands.json
+modules-targets += clang-%
+ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
   KBUILD_MODULES := y
 endif
 
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..f7f0c144908a 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -174,6 +174,7 @@ endif
 all:	$(notdir $(KBUILD_IMAGE))
 
 image.fit: dtbs
+image.fit: $(if $(FIT_MODULES), modules)
 
 vmlinuz.efi image.fit: Image
 $(BOOT_TARGETS): vmlinux
diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d10c85f96aea..b5a08333bc57 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -43,10 +43,6 @@ $(obj)/Image.zst: $(obj)/Image FORCE
 $(obj)/Image.xz: $(obj)/Image FORCE
 	$(call if_changed,xzkern)
 
-ifeq ($(FIT_MODULES),1)
-.PHONY: modules
-$(obj)/image.fit: modules
-endif
 $(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
 	$(call if_changed,fit)
 


Kind regards
Nicolas

