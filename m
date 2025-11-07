Return-Path: <linux-kbuild+bounces-9443-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B34C41513
	for <lists+linux-kbuild@lfdr.de>; Fri, 07 Nov 2025 19:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCD5E1896A45
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Nov 2025 18:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE7F32860F;
	Fri,  7 Nov 2025 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv8lSd2H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A82E040D
	for <linux-kbuild@vger.kernel.org>; Fri,  7 Nov 2025 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762541022; cv=none; b=FjVc4nnFNtEmJZyW0X6ec2OcJ4hqqeD1C9oK03ixj4CqyqiUbF6BCob1gpdbXCFkkWGuIzRPepfcUbPh2uFvCDK9NiTr056TdAcN+7eC2k2e8RMx19oWnsmuugWAvkfaTrjMmkLMgwlElxuV83hbb7TtANV3fXSW2AglMDT/C48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762541022; c=relaxed/simple;
	bh=QhwoD/SkXfj3MPkCbSD6w0UQt66HdmkGvottRWfhloQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGbsBzQMTH5leOK3pOxWa/B3ECtK+LczkxyRic4iXTp0XQTMYBNtIXU/0Q+eniBcyjcgF20fqSk4324iTqh1Tf079QwhawO+u0sX0rZkr5qs0Zl8TBtomAjQp1PmEM3H3vVvykOqGJWsP1jJujJ/oh/Yernt3m6w4ROSso8TItY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv8lSd2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7287CC19422;
	Fri,  7 Nov 2025 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762541022;
	bh=QhwoD/SkXfj3MPkCbSD6w0UQt66HdmkGvottRWfhloQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mv8lSd2H4k9FdZpJ2jGG8FXthsG87fuTVl7ENK5hs3pXbb4OohCnpoksiDrUR95y9
	 Xj/1SEUhChkFFbD+uSgL48xJ3fkwHcL7c3TeiLVCX5gYQS79rZ1d0bZ2VW5J/Op/YB
	 OykWuk037KrIhGEwfSjslhr9f2qm5366vezcO3PshhWtx/Lg7eq8QO9H60WpRwf0jt
	 pomtusXQb8uGwg+V1VljnmM4raJT8Z+vWQJNA8TuIOKnB0gAxGJFv46ioEc7yiDF83
	 gsZF5L8ApMY13UFCEgW9ZCAmsU3L01tiT3YcOERppoXsUuQqDQGWYyNccOnRVBC0Xs
	 HgpAbXP/95Cug==
Date: Fri, 7 Nov 2025 11:43:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251107184338.GA502997@ax162>
References: <20251107192933.2bfe9e57@endymion>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107192933.2bfe9e57@endymion>

On Fri, Nov 07, 2025 at 07:29:33PM +0100, Jean Delvare wrote:
> It is possible to force a specific version of python to be used when
> building the kernel by passing PYTHON3= on the make command line.
> However kernel-doc.py is currently called with python3 hard-coded and
> thus ignores this setting.
> 
> Use $(PYTHON3) to run $(KERNELDOC) so that the desired version of
> python is used.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> ---

Thanks, I can take this as a fix for 6.18 since it results in warnings
in your environment. I will give it a day or so for folks to comment for
review.

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
> -- 
> Jean Delvare
> SUSE L3 Support

