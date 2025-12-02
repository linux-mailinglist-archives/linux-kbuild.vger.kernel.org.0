Return-Path: <linux-kbuild+bounces-9947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C45C5C9CDF7
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 21:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0F8A4E328B
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 20:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A562EAD10;
	Tue,  2 Dec 2025 20:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbahQlR5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F702E0B77;
	Tue,  2 Dec 2025 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764706162; cv=none; b=qrOtbheN/cUR+U8x/3/CVBWCvTGf1ymlv5QtbozM63GwRRUNUNGjqmjJou9qpKB1OZRNSMFuy0uUhZgTzn0BKP9x24VIByFHOqbTb0glLqwHHsGEax3N8pBnZ5Y9ZWJKhBDyuC97E5M7yMsR6pPumrLslnpSElg9ZP9YwJlzLqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764706162; c=relaxed/simple;
	bh=+DASQx3H2/QvXTd/KBI5Sv840TrhTB1nS1k7gndilQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HwGu5p0Ge/iuSaT9XfYFqXbiZds9DSWGRHLOxK51U/7cdDN3qmwcqAENL8IudLAipjZ+xFViNPExqJSlurucLRUL/3C+FDSYboTNk8Zoh+a2t4KW4zzqIqNxGz+wtjxitVzcT4uGJEf1lblW/ZTRNUNcOq6QUEHYE/BtDwFlKkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbahQlR5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB780C4CEF1;
	Tue,  2 Dec 2025 20:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764706161;
	bh=+DASQx3H2/QvXTd/KBI5Sv840TrhTB1nS1k7gndilQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QbahQlR5DQjoKkmnhMHXQxqPXFqL0TSFVifyoaLhhPre+ihqs+Dv2XzGwqyFJoUdo
	 IHFD5ltdINf1/Ftb7d3ILWBkx8YRRYnPjpXsBqNoFtgTjNhhseMPEk7qgmKLMtDY13
	 BVtf+ZEV8poBVP6SvZQtT3cMddjsVTMpGiDD47D+P6MyS44uvS7gldSOXFcM4sEgtd
	 CNWYOWZ9pGWkiO6VSh1QNaFV8Ya9L8SDiZCyVI7TUBKnvoSL4eZ5GZPInz6Jhtpa4C
	 hNb83/TT4G3dJka/t6EPxB8lAbVTka5GEK5FkNKEBhauhkQaYdAhazKAPIpBKPIF37
	 VJgMF2QP07mFQ==
Date: Tue, 2 Dec 2025 13:09:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: linux-kbuild@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: fix compilation of dtb specified on
 command-line without make rule
Message-ID: <20251202200917.GA1959956@ax162>
References: <20251126100017.1162330-1-thomas.de_schampheleire@nokia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126100017.1162330-1-thomas.de_schampheleire@nokia.com>

On Wed, Nov 26, 2025 at 11:00:16AM +0100, Thomas De Schampheleire wrote:
> Since commit e7e2941300d2 ("kbuild: split device tree build rules into
> scripts/Makefile.dtbs"), it is no longer possible to compile a device tree
> blob that is not specified in a make rule
> like:
>     dtb-$(CONFIG_FOO) += foo.dtb
> 
> Before the mentioned commit, one could copy a dts file to e.g.
> arch/arm64/boot/dts/ (or a new subdirectory) and then convert it to a dtb
> file using:
>     make ARCH=arm64 foo.dtb
> 
> In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusion of
> scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS. The
> value of 'targets', however, is only final later in the code.
> 
> Move the conditional include of scripts/Makefile.dtbs down to where the
> value of 'targets' is final. Since Makefile.dtbs updates 'always-y' which is
> used as a prerequisite in the build rule, the build rule also needs to move
> down.
> 
> Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/Makefile.dtbs")
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

>  scripts/Makefile.build | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d0ee33a487be..82a6e328ceee 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -527,18 +527,6 @@ ifneq ($(userprogs),)
>  include $(srctree)/scripts/Makefile.userprogs
>  endif
>  
> -ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
> -include $(srctree)/scripts/Makefile.dtbs
> -endif
> -
> -# Build
> -# ---------------------------------------------------------------------------
> -
> -$(obj)/: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
> -	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
> -	 $(subdir-ym) $(always-y)
> -	@:
> -
>  # Single targets
>  # ---------------------------------------------------------------------------
>  
> @@ -568,6 +556,20 @@ FORCE:
>  targets += $(filter-out $(single-subdir-goals), $(MAKECMDGOALS))
>  targets := $(filter-out $(PHONY), $(targets))
>  
> +# Now that targets is fully known, include dtb rules if needed
> +ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
> +include $(srctree)/scripts/Makefile.dtbs
> +endif
> +
> +# Build
> +# Needs to be after the include of Makefile.dtbs, which updates always-y
> +# ---------------------------------------------------------------------------
> +
> +$(obj)/: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
> +	 $(if $(KBUILD_MODULES), $(targets-for-modules)) \
> +	 $(subdir-ym) $(always-y)
> +	@:
> +
>  # Read all saved command lines and dependencies for the $(targets) we
>  # may be building above, using $(if_changed{,_dep}). As an
>  # optimization, we don't need to read them if the target does not
> 
> base-commit: deab487e0f9b39ae4603e22d7d00908ebfc9753c
> -- 
> 2.51.0
> 

