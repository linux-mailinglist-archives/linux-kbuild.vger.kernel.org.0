Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABF4D4351CF
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 19:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhJTRsj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 13:48:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231425AbhJTRsE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 13:48:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38F77611C7;
        Wed, 20 Oct 2021 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634751950;
        bh=6FFtYVTMs5VxUoN/PJRKD1y8Z7V3rM+KFsxoD3doo5Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D1cmrXcBkVR8o69ab4FwSusT9UlwFA3kFQ5NISY7yh23A938955Vv4iM1kxtJKTAp
         f3flx6msgAUQkV/UE2BIsidAvOfTU8pPCihQd1X1iTRji3TlHj+U3mPExoyE2KdP2V
         neropzxmFFDzU/vAz24v+Pgo1677pfk+c0f4YilLX8olohHYZajB1TLh2BnCGus8AE
         mu7M48LyXIjHXxzY4LnmdQKd7jwRzMnqnf8yennPQjgamLtEOqiCjLQbRUaqNTUnwC
         sbCVA5z+zpf4rA2syfIibzx8nPVkTWJ7NvlSjyPVXC7tDSIULSeAsRHYPKDFFMp3ne
         Xj6xDgifIZ3qQ==
Date:   Wed, 20 Oct 2021 10:45:43 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
        llvm@lists.linux.dev, Dan Li <ashimida@linux.alibaba.com>,
        ardb@kernel.org, ojeda@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
Message-ID: <YXBVx+0YjoMtQ27T@archlinux-ax161>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020173554.38122-2-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 10:35:53AM -0700, Kees Cook wrote:
> GCC plugins should only exist when some compiler feature needs to be
> proven but does not exist in either GCC nor Clang. For example, if a
> desired feature is already in Clang, it should be added to GCC upstream.
> Document this explicitly.
> 
> Additionally, mark the plugins with matching upstream GCC features as
> removable past their respective GCC versions.
> 
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>

Seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

One comment below.

> ---
>  Documentation/kbuild/gcc-plugins.rst | 26 ++++++++++++++++++++++++++
>  scripts/gcc-plugins/Kconfig          |  4 ++--
>  security/Kconfig.hardening           |  9 ++++++---
>  3 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
> index 3349966f213d..4b28c7a4032f 100644
> --- a/Documentation/kbuild/gcc-plugins.rst
> +++ b/Documentation/kbuild/gcc-plugins.rst
> @@ -32,6 +32,32 @@ This infrastructure was ported from grsecurity [6]_ and PaX [7]_.
>  .. [7] https://pax.grsecurity.net/
>  
>  
> +Purpose
> +=======
> +
> +GCC plugins are designed to provide a place to experiment with potential
> +compiler features that are neither in GCC nor Clang upstream. Once
> +their utility is proven, the goal is to upstream the feature into GCC
> +(and Clang), and then to finally remove them from the kernel once the
> +feature is available in all supported versions of GCC.
> +
> +Specifically, new plugins should implement only features that have no
> +upstream compiler support (in either GCC or Clang).
> +
> +When a feature exists in Clang but not GCC, effort should be made to
> +bring the feature to upstream GCC (rather than just as a kernel-specific
> +GCC plugin), so the entire ecosystem can benefit from it.
> +
> +Similarly, even if a feature provided by a GCC plugin does *not* exist
> +in Clang, but the feature is proven to be useful, effort should be spent
> +to upstream the feature to GCC (and Clang).
> +
> +After a feature is available in upstream GCC, the plugin will be made
> +unbuildable for the corresponding GCC version (and later). Once all
> +kernel-supported versions of GCC provide the feature, the plugin will
> +be removed from the kernel.
> +
> +
>  Files
>  =====
>  
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index ab9eb4cbe33a..3f5d3580ec06 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -37,6 +37,8 @@ config GCC_PLUGIN_CYC_COMPLEXITY
>  
>  config GCC_PLUGIN_SANCOV
>  	bool
> +	# Plugin can be removed once the kernel only supports GCC 6.1.0+
> +	depends on !CC_HAS_SANCOV_TRACE_PC

This symbol is not user selectable and the one place that does select it
only does so when !CC_HAS_SANCOV_TRACE_PC so this seems pointless to me.

Keep the comment, ditch the depends?

>  	help
>  	  This plugin inserts a __sanitizer_cov_trace_pc() call at the start of
>  	  basic blocks. It supports all gcc versions with plugin support (from
> @@ -83,8 +85,6 @@ config GCC_PLUGIN_RANDSTRUCT
>  	  the existing seed and will be removed by a make mrproper or
>  	  make distclean.
>  
> -	  Note that the implementation requires gcc 4.7 or newer.
> -
>  	  This plugin was ported from grsecurity/PaX. More information at:
>  	   * https://grsecurity.net/
>  	   * https://pax.grsecurity.net/
> diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> index 90cbaff86e13..d30c6225de74 100644
> --- a/security/Kconfig.hardening
> +++ b/security/Kconfig.hardening
> @@ -53,7 +53,8 @@ choice
>  
>  	config GCC_PLUGIN_STRUCTLEAK_USER
>  		bool "zero-init structs marked for userspace (weak)"
> -		depends on GCC_PLUGINS
> +		# Plugin can be removed once the kernel only supports GCC 12+
> +		depends on GCC_PLUGINS && !CC_HAS_AUTO_VAR_INIT_ZERO
>  		select GCC_PLUGIN_STRUCTLEAK
>  		help
>  		  Zero-initialize any structures on the stack containing
> @@ -64,7 +65,8 @@ choice
>  
>  	config GCC_PLUGIN_STRUCTLEAK_BYREF
>  		bool "zero-init structs passed by reference (strong)"
> -		depends on GCC_PLUGINS
> +		# Plugin can be removed once the kernel only supports GCC 12+
> +		depends on GCC_PLUGINS && !CC_HAS_AUTO_VAR_INIT_ZERO
>  		depends on !(KASAN && KASAN_STACK)
>  		select GCC_PLUGIN_STRUCTLEAK
>  		help
> @@ -82,7 +84,8 @@ choice
>  
>  	config GCC_PLUGIN_STRUCTLEAK_BYREF_ALL
>  		bool "zero-init everything passed by reference (very strong)"
> -		depends on GCC_PLUGINS
> +		# Plugin can be removed once the kernel only supports GCC 12+
> +		depends on GCC_PLUGINS && !CC_HAS_AUTO_VAR_INIT_ZERO
>  		depends on !(KASAN && KASAN_STACK)
>  		select GCC_PLUGIN_STRUCTLEAK
>  		help
> -- 
> 2.30.2
> 
