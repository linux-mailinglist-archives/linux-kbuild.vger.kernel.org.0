Return-Path: <linux-kbuild+bounces-9444-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F28C4197E
	for <lists+linux-kbuild@lfdr.de>; Fri, 07 Nov 2025 21:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C8FB4E11A3
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Nov 2025 20:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CDB30E83C;
	Fri,  7 Nov 2025 20:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sw0lJz97"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ADA27B32B
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Nov 2025 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762548005; cv=none; b=MwFCJcbG99si72eTx//PaYAxwS1aE9VfK0zTAc6VZEDWof8GkoFVTsGYbkfaZoQXXrT8a34GfVjIUq1RaZE8AAQQJcfWy8OGcoeygAvKJJ6TU1rR3qGUdk3+0f9iQ54eh7Pj8JbV8Sxb04u6LlOZWQiMWcKKPziCKn6pj24FVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762548005; c=relaxed/simple;
	bh=fAIJH6niIyqzV/G0nFnBw9WzRN1iK0Gu5rcb2+vzZ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eR5Zr00ABLBkmTrgDpoM50cRtPEGU9Ddv1KOjyim8xnackh7D/pUInjswHudJr0T6+cIMOTiAh8r+ijmtuGWlfBiwhpayjs54/xJsmlbXuvW4rgG9CTvAXP+ON+kZX0knthosJ+dYgnmhc+8m5flAZK9L8ISfQcprUQ6WNNhLRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sw0lJz97; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43760C4CEF5;
	Fri,  7 Nov 2025 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762548005;
	bh=fAIJH6niIyqzV/G0nFnBw9WzRN1iK0Gu5rcb2+vzZ0k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sw0lJz97tcfjPteKxtbkYEWwjn7J+Bt0LC8XwfYseaKjB+keM9X7ZRBKbBmivbwKf
	 1KHVA5tblRkQ3qMgjjru/m4GweH6bFMnj77tPbeUzmb+RMkHkqyfNBWjo9kZfOyGVR
	 5D2X7qk4ClA6D//Jxxp6XigXgPFRd4fL2jqdhmYUct2UnG5jn6W5dK38lySMLrp3sO
	 walFJgDlKv/91oFqvXsFO8B31QIJFmbTjf937h3pIL7Yu886kFYp46YF1Ef7TFOCW2
	 81soOpONfCRie9Pb9OYM0iHGgbim4kEO5zirxM4mH6yZ8mVU54cQX7ht3CYld3X/BK
	 EGmgLzo+drYKQ==
Date: Fri, 7 Nov 2025 21:40:01 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH v2] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251107214001.3b60ab65@foz.lan>
In-Reply-To: <20251107192933.2bfe9e57@endymion>
References: <20251107192933.2bfe9e57@endymion>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 7 Nov 2025 19:29:33 +0100
Jean Delvare <jdelvare@suse.de> escreveu:

> It is possible to force a specific version of python to be used when
> building the kernel by passing PYTHON3= on the make command line.
> However kernel-doc.py is currently called with python3 hard-coded and
> thus ignores this setting.
> 
> Use $(PYTHON3) to run $(KERNELDOC) so that the desired version of
> python is used.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> Changes in v2:
>  * Leave KERNELDOC alone and patch the calling sites instead.
> 
>  drivers/gpu/drm/Makefile      |    2 +-
>  drivers/gpu/drm/i915/Makefile |    2 +-
>  include/drm/Makefile          |    2 +-
>  scripts/Makefile.build        |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-6.17.orig/drivers/gpu/drm/Makefile
> +++ linux-6.17/drivers/gpu/drm/Makefile
> @@ -244,7 +244,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		 PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		 PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> --- linux-6.17.orig/drivers/gpu/drm/i915/Makefile
> +++ linux-6.17/drivers/gpu/drm/i915/Makefile
> @@ -411,7 +411,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmg
>  #
>  # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
>  ifdef CONFIG_DRM_I915_WERROR
> -    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none -Werror $<
> +    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none -Werror $<
>  endif
>  
>  # header test
> --- linux-6.17.orig/include/drm/Makefile
> +++ linux-6.17/include/drm/Makefile
> @@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> --- linux-6.17.orig/scripts/Makefile.build
> +++ linux-6.17/scripts/Makefile.build
> @@ -167,7 +167,7 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>  endif
>  
>  ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(KERNELDOC) -none $(KDOCFLAGS) \
> +  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
>          $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
>          $<
>  endif
> 
> 



Thanks,
Mauro

