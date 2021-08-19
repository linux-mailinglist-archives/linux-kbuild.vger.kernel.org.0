Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF903F1085
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 04:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235679AbhHSCqK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 22:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhHSCqJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 22:46:09 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43579C061764
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:45:34 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x1so504387plg.10
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CSaGB3k7M6BK7DdRWWMnUwx7S+7PIDCc8H9F6AQI7Ko=;
        b=Te/Kit9LTOJpgzvCvQ4D7iEhZigPhamI41CWBfK1ejgCiZNYgT9evw9SIQ/tIwEhEW
         sWktd6u+iNT1ulXUhCgPSgcEwRGWnuCqtSqbhi0m4yTKeWlN6zOigSPQY4/Wrdw3RNaq
         MUBsdTaoC3WhEKdJ/gX606xiN58jXJ8YZvhTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CSaGB3k7M6BK7DdRWWMnUwx7S+7PIDCc8H9F6AQI7Ko=;
        b=hMijAMuZvUUjl1+kiJsN33bgv3hky1/U8gf03N877OtPzt/KHb9Y09FMsKIkuYJVJK
         fFH2Pl7wVigkBi9f04Y8ldSJbADFnbgdYdI2pJ0uV3zkFy/mmfluOJCC4sBQ4clAgwAX
         P2HD03UziTZsqHZlqDFgeEGLRLijVHVG2Vbm81I5YU2Vfhubb7R3W+0w68Yt4FQ7dREI
         ZNwDNwPrdP6Of9Wh+NGM1v6jvqwgXKtocNo4NJyJ/c+r21cDdI19aoM/LikI1bbQVRQE
         nM6/WOC8KP5wg3+p8OlH1S25cOsWZyPrCWjxjPK6gKNdkhgI6MBHD9lmhGpN6k+NS0pl
         ikfw==
X-Gm-Message-State: AOAM530xKfTWDLraEmTixd3657Uo66yj1+SswSATSE9AHE6mMwH85zJF
        Y8LQh75GZlJ8crNuIVwxIqkDrQ==
X-Google-Smtp-Source: ABdhPJzc2/w5A7yHUB1LmMxy6GwFAGJY5KD4HDcBRNq1GXSWmG+1E1YYGsT87VlXr5u4zpNfDBnmqQ==
X-Received: by 2002:a17:902:db0b:b0:12d:bd2c:6e6e with SMTP id m11-20020a170902db0b00b0012dbd2c6e6emr9537018plx.26.1629341133775;
        Wed, 18 Aug 2021 19:45:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v25sm1154428pfm.202.2021.08.18.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:45:33 -0700 (PDT)
Date:   Wed, 18 Aug 2021 19:45:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 01/13] kbuild: move objtool_args back to
 scripts/Makefile.build
Message-ID: <202108181944.C6006C032A@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-2-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:32AM +0900, Masahiro Yamada wrote:
> Commit b1a1a1a09b46 ("kbuild: lto: postpone objtool") moved objtool_args
> to Makefile.lib, so the arguments can be used in Makefile.modfinal as
> well as Makefile.build.
> 
> With commit 2b1d7fc05467 ("kbuild: Fix TRIM_UNUSED_KSYMS with
> LTO_CLANG"), module LTO linking came back to scripts/Makefile.build
> again.
> 
> So, there is no more reason to keep objtool_args separately in
> scripts/Makefile.lib.
> 
> Get it back to the original place, close to the objtool command.

Ah, yup. Good point. Nice cleanup.

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build | 13 +++++++++++++
>  scripts/Makefile.lib   | 12 ------------
>  2 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index ea549579bfb7..31154e44c251 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -222,6 +222,19 @@ cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),
>  endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>  
>  ifdef CONFIG_STACK_VALIDATION
> +
> +# Objtool arguments are also needed for modfinal with LTO, so we define
> +# then here to avoid duplication.
> +objtool_args =								\
> +	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
> +	$(if $(part-of-module), --module,)				\
> +	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
> +	$(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)),		\
> +		--no-unreachable,)					\
> +	$(if $(CONFIG_RETPOLINE), --retpoline,)				\
> +	$(if $(CONFIG_X86_SMAP), --uaccess,)				\
> +	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount,)
> +
>  ifndef CONFIG_LTO_CLANG
>  
>  __objtool_obj := $(objtree)/tools/objtool/objtool
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index af1c920a585c..34c4c11c4bc1 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -232,18 +232,6 @@ ifeq ($(CONFIG_LTO_CLANG),y)
>  mod-prelink-ext := .lto
>  endif
>  
> -# Objtool arguments are also needed for modfinal with LTO, so we define
> -# then here to avoid duplication.
> -objtool_args =								\
> -	$(if $(CONFIG_UNWINDER_ORC),orc generate,check)			\
> -	$(if $(part-of-module), --module,)				\
> -	$(if $(CONFIG_FRAME_POINTER),, --no-fp)				\
> -	$(if $(or $(CONFIG_GCOV_KERNEL),$(CONFIG_LTO_CLANG)), 		\
> -		--no-unreachable,)					\
> -	$(if $(CONFIG_RETPOLINE), --retpoline,)				\
> -	$(if $(CONFIG_X86_SMAP), --uaccess,)				\
> -	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount,)
> -
>  # Useful for describing the dependency of composite objects
>  # Usage:
>  #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
> -- 
> 2.30.2
> 

-- 
Kees Cook
