Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DF73C61CE
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jul 2021 19:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhGLRZj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jul 2021 13:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235038AbhGLRZi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jul 2021 13:25:38 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE10C0613E5
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jul 2021 10:22:49 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id y4so16485577pgl.10
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jul 2021 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vJSus6xqz4Py/YBsR2PyDSFXECwi8SLf51Zt42z9NT4=;
        b=Mmcvc7l5nHdDlEh0IVqZJc5w8y60uSbHCff6KeC5Jkl14UYWGJpRd6DGrn/7aSy0jH
         /ppNubSXnDqrbctFIwoOwew8asmkJjWJJw8zZSLfC5cnx1Ol8I0j/BP+hoo39m4jPp/x
         xrJ7JhwedpqtUTVCf02vJjcsV83MQAKp6+cmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vJSus6xqz4Py/YBsR2PyDSFXECwi8SLf51Zt42z9NT4=;
        b=YInaR7quOdng27BaVWTYUbZTpZ/NDqHw3re8UGyuxv7Vo0L3TJ/KZatUX5KfHiojZu
         RpTp182bYwI7z9TpBDNTD4VbZFwsPi2UFVZtB8h4GihWP5mllJyLdl9cntJQcWdXQ4PA
         WE7hM+SCTp69iFpxh61j+FdjoHA+mfUkubEIt7e4tLNb1aXxhXZiJt6/LVYfHLtnjKZ9
         38BNIo8HvkQMITqUx55yBm3tg2SHYF9BL7UyRTJei+wMjaRDDVdaapV70/wjrFQbbArK
         QgxVNcHguMzTz2R7M9yZjIXHVbl5zZ4WCmQnNlCmRcGoATe2udxvXe7GEeWnTyyKInVD
         CNkQ==
X-Gm-Message-State: AOAM530FL31POriYkASeUyAb9QVNgjwUameDhRcG/Rn8BbEIWQh3UHpv
        C/Slgm5tuCWK/wPbbiinCwKkRg==
X-Google-Smtp-Source: ABdhPJwEK/MTOfB3M0UIkkrsItNGKnJCb+XUM5JvODCmpd9ql1wqJdZo6sDgmolg4Wk0Zsz+NGL4GQ==
X-Received: by 2002:a63:1a12:: with SMTP id a18mr165366pga.269.1626110568824;
        Mon, 12 Jul 2021 10:22:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i8sm46529pjh.36.2021.07.12.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:22:48 -0700 (PDT)
Date:   Mon, 12 Jul 2021 10:22:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Tor Vic <torvic9@mailbox.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH 1/1] Kbuild, clang: add option for choosing a ThinLTO
 cache directory
Message-ID: <202107121021.38F447EBE4@keescook>
References: <b45b2430-3670-b310-b6ad-2d6db50c2d18@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b45b2430-3670-b310-b6ad-2d6db50c2d18@mailbox.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 12, 2021 at 11:10:04AM +0000, Tor Vic wrote:
> On some distros and configurations, it might be useful to allow for
> specifying a directory where Clang stores its ThinLTO cache.
> 
> More specifically, when building the VirtualBox extramodules on Arch with
> its proper 'makepkg' build system and DKMS, against an already installed
> ThinLTO kernel, the build fails because it tries to create the ThinLTO
> cache in a directory that is not user-writable.
> 
> A similar problem has been reported with openSUSE's OBS build system.
> 
> Add a Kconfig option that allows users to choose a directory in which
> Clang's ThinLTO can store its cache.

Ah-ha, good idea. Thanks! Question below...

> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1104
> Signed-off-by: Tor Vic <torvic9@mailbox.org>
> ---
>  Makefile                  |  5 +++--
>  arch/Kconfig              | 10 ++++++++++
>  scripts/Makefile.lib      |  4 ++++
>  scripts/Makefile.modfinal |  4 ++++
>  4 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c3f9bd191b89..472bc8bfff03 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -932,7 +932,8 @@ endif
>  ifdef CONFIG_LTO_CLANG
>  ifdef CONFIG_LTO_CLANG_THIN
>  CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
> -KBUILD_LDFLAGS	+= --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
> +export thinlto-dir = $(if
> $(CONFIG_LTO_CLANG_THIN_CACHEDIR),$(CONFIG_LTO_CLANG_THIN_CACHEDIR)/)
> +KBUILD_LDFLAGS	+=
> --thinlto-cache-dir=$(thinlto-dir)$(extmod_prefix).thinlto-cache
>  else
>  CC_FLAGS_LTO	:= -flto
>  endif
> @@ -1728,7 +1729,7 @@ PHONY += compile_commands.json
> 
>  clean-dirs := $(KBUILD_EXTMOD)
>  clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
> $(KBUILD_EXTMOD)/modules.nsdeps \
> -	$(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
> +	$(KBUILD_EXTMOD)/compile_commands.json
> $(thinlto-dir)$(KBUILD_EXTMOD)/.thinlto-cache
> 
>  PHONY += help
>  help:
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 129df498a8e1..19e4d140e12a 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -696,6 +696,16 @@ config LTO_CLANG_THIN
>  	    https://clang.llvm.org/docs/ThinLTO.html
> 
>  	  If unsure, say Y.
> +
> +config LTO_CLANG_THIN_CACHEDIR
> +	string "Clang ThinLTO cache directory"
> +	depends on LTO_CLANG_THIN
> +	default ""
> +	help
> +	  This option allows users to choose a directory that stores
> +	  Clang's ThinLTO cache.
> +	  Leave empty for default.
> +
>  endchoice
> 
>  config ARCH_SUPPORTS_CFI_CLANG
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 10950559b223..bca87a6aa35b 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -197,6 +197,10 @@ endif
>  part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
>  quiet_modtag = $(if $(part-of-module),[M],   )
> 
> +ifdef CONFIG_LTO_CLANG_THIN
> +KBUILD_LDFLAGS	+=
> --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> +endif
> +
>  modkern_cflags =                                          \
>  	$(if $(part-of-module),                           \
>  		$(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 5e9b8057fb24..ab0d72e21318 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -35,6 +35,10 @@ ifdef CONFIG_LTO_CLANG
>  # avoid a second slow LTO link
>  prelink-ext := .lto
> 
> +ifdef CONFIG_LTO_CLANG_THIN
> +KBUILD_LDFLAGS	+=
> --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> +endif # CONFIG_LTO_CLANG_THIN
> +
>  # ELF processing was skipped earlier because we didn't have native code,
>  # so let's now process the prelinked binary before we link the module.

Why are these changes needed in Makefile.lib and Makefile.modfinal?
Isn't KBUILD_LDFLAGS already populated from the top-level Makefile?

-- 
Kees Cook
