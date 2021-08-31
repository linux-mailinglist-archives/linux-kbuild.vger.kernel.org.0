Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D883FCC65
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240032AbhHaRg1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235078AbhHaRg0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:36:26 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625B9C061760
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:35:31 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id j2so11088161pll.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zFaMu2sNRv+V3KA3jKCPARQc5wW0g1ezbq25T+FrX+A=;
        b=CJcVxB94cBu0KfWCRZRFyIAWe/YYDrVhIm2EZ0+KOYmz161+pmjleqYePf8EnrtFkP
         uJsgnQJeeu5s/UANwJSDEbygl1uMyyXueCJ/zKbGMrg9fMhiAmp3+kMLGVKM9tVG+9Zb
         cWfT+eOuYbqb87p8i0XyN7/FEhS7Vt3CtBh5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zFaMu2sNRv+V3KA3jKCPARQc5wW0g1ezbq25T+FrX+A=;
        b=ZXD9RfbaZqZoitBlB9HZPfbF+jqrP/sxRYMtaBTUWxYjFf+FgYavC3rpjcDCs7rJr9
         Yvpp2SPwvMr12Q3XdgdVe09GJGrHpEwWgiom73AY9OJA5/xqi3fQYGEwmeBHTovx48gN
         PSxJiHYK32yg9Kmgp9S3qRaaQHuMpU1REHAquWdudF6/1oHTAVf8Dq34Me+r03RtW6qi
         UcA6+RfcJMJRiCN1YHvtOZkUxOxcKQXKQleY11Pd+TM7YI7qDH9tBxQT7ByE/LTPS0pp
         UPCMjiHMrf9VvVl5WNk2ZI3UX5B+qLJdxQh6akpapiuTuCKcFZ/Im5iGZra98LBJzU+Z
         5UrQ==
X-Gm-Message-State: AOAM531cRr+x2nlJrFVqOH0f8qtvdG5+ZsQ2iN1F78YyosJHiYnLcTXs
        sHH6p1lcJ1++kdHtZx/sUAYspQ==
X-Google-Smtp-Source: ABdhPJxxBobqX14JN0kSgwykqoly1SD2goFOFtoe60Me1gVeAUqUnE9gLRM75UOV7/qHlGsbELi09w==
X-Received: by 2002:a17:90b:103:: with SMTP id p3mr6813846pjz.157.1630431330746;
        Tue, 31 Aug 2021 10:35:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t13sm3418724pjg.25.2021.08.31.10.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:35:30 -0700 (PDT)
Date:   Tue, 31 Aug 2021 10:35:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/13] kbuild: reuse $(cmd_objtool) for
 cmd_cc_lto_link_modules
Message-ID: <202108311034.D4B1410@keescook>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-7-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-7-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:57PM +0900, Masahiro Yamada wrote:
> For CONFIG_LTO_CLANG=y, the objtool processing is not possible at the
> compilation, hence postponed by the link time.
> 
> Reuse $(cmd_objtool) for CONFIG_LTO_CLANG=y by defining objtool-enabled
> properly.
> 
> For CONFIG_LTO_CLANG=y:
> 
>   objtool-enabled is off for %.o compilation
>   objtool-enabled is on  for %.lto link
> 
> For CONFIG_LTO_CLANG=n:
> 
>   objtool-enabled is on for %.o compilation
>       (but, it depends on OBJECT_FILE_NON_STANDARD)
> 
> Set part-of-module := y for %.lto.o to avoid repeating --module.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 21b55f37a23f..afc906cd7256 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -236,20 +236,26 @@ objtool_args =								\
>  	$(if $(CONFIG_X86_SMAP), --uaccess)				\
>  	$(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
>  
> -ifndef CONFIG_LTO_CLANG
> +cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
> +cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
> +
> +endif # CONFIG_STACK_VALIDATION
> +
> +ifdef CONFIG_LTO_CLANG
> +
> +# Skip objtool for LLVM bitcode
> +$(obj)/%o: objtool-enabled :=

Is this intentionally "%o" instead of "%.o"? (And it later overridden by
the "%.lto.o" rule?

> +
> +else
>  
>  # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
>  
> -objtool-enabled = $(if $(filter-out y%, \
> +$(obj)/%o: objtool-enabled = $(if $(filter-out y%, \
>  	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
>  
> -cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
> -cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
> -
> -endif # CONFIG_LTO_CLANG
> -endif # CONFIG_STACK_VALIDATION
> +endif
>  
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>  cmd_gen_ksymdeps = \
> @@ -289,13 +295,13 @@ cmd_cc_lto_link_modules =						\
>  	$(LD) $(ld_flags) -r -o $@					\
>  		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
>  			echo -T $(@:.lto.o=.o.symversions))		\
> -		--whole-archive $(filter-out FORCE,$^)
> +		--whole-archive $(filter-out FORCE,$^)			\
> +		$(cmd_objtool)
>  
> -ifdef CONFIG_STACK_VALIDATION
>  # objtool was skipped for LLVM bitcode, run it now that we have compiled
>  # modules into native code
> -cmd_cc_lto_link_modules += ; $(objtool) $(objtool_args) --module $@
> -endif
> +$(obj)/%.lto.o: objtool-enabled = y
> +$(obj)/%.lto.o: part-of-module := y
>  
>  $(obj)/%.lto.o: $(obj)/%.o FORCE
>  	$(call if_changed,cc_lto_link_modules)
> -- 
> 2.30.2
> 

-- 
Kees Cook
