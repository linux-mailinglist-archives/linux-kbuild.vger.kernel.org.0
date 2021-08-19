Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7832C3F10D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 04:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235734AbhHSC4P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 22:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235729AbhHSC4P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 22:56:15 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4783C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:55:39 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id t42so1564279pfg.12
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SpO4zVjYq8QRtiKEjtYxq4fX0EEjRRcWTkj2XegThk8=;
        b=ZqC32LZY+kzLJnTJLhmz9pjR2eGYLS5XBhY9GhqjVu4ggYlx7FUQC0fu4JmdxwOrYv
         BY4XVcVDz/kzVrtVj/MBfssJuOt/6Ze3fVoKUzSFx9dijmSmD9WWnTTX345X3zhYC2pb
         8dhcIRZB9u/HM2MFBBhcMqW6r31VvhK3gI4K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SpO4zVjYq8QRtiKEjtYxq4fX0EEjRRcWTkj2XegThk8=;
        b=FTF0iCOTtwxzBgR4DPCD99N9OgEHjmOvblqTLHvUNo5/BnpiJUzKyDGB2tsGK5lqrD
         3PLKCb/gLeP/enUdOYKiEgrynSv1/qOFZGQ+d9WtsGgNktNguR1wnmaTGe+FlLZSRIwG
         NUnY+zqcuicqZpyU4tGn8ZqXMGPSMdKjBO5rCTFcNmoxO/nHSLJiyrdSVaBwrkScskso
         tDejgN7ZSdWmkWFVMgwTl6pRhT1hCaE4LhKOSfQvqNlo3aokt9PRwM8LTZMu7BqSt9Zu
         /JsYHXCH34ZsBUrIfrJToLSAHslkRQK5V1NqhpQdC6fGDNDplAlqs9HojASC57BEsIPi
         1umw==
X-Gm-Message-State: AOAM533tPSGg9civ08FNehzoKO8Xt5W/HmRWhby/KloL6aVCYv3cd2iU
        ZRpWLx0zqu/K55SPRhMqTJrgWA==
X-Google-Smtp-Source: ABdhPJyU9aMAeT2FUHWBGCmKtgiDn2VEGfBASi0J1fJUW4IZxIISqvlqwne0EJK5dYtLN2BzvFp9OA==
X-Received: by 2002:a05:6a00:a8a:b029:356:be61:7f18 with SMTP id b10-20020a056a000a8ab0290356be617f18mr12455153pfl.29.1629341739268;
        Wed, 18 Aug 2021 19:55:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i11sm1423517pgo.25.2021.08.18.19.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:55:38 -0700 (PDT)
Date:   Wed, 18 Aug 2021 19:55:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 03/13] kbuild: detect objtool changes correctly and
 remove .SECONDEXPANSION
Message-ID: <202108181952.14AEEED@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-4-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:34AM +0900, Masahiro Yamada wrote:
> This reverts commit 8852c5524029 ("kbuild: Fix objtool dependency for
> 'OBJECT_FILES_NON_STANDARD_<obj> := n'"), and fix the dependency in a
> cleaner way.
> 
> Using .SECONDEXPANSION is expensive since Makefile.build is parsed
> twice every time, and the escaping dollars makes the code unreadable.
> 
> Adding include/config/* as dependency is not maintainable either because
> objtool_args is dependent on more CONFIG options.
> 
> A better fix is to include the objtool command in *.cmd files so any
> command change is naturally detected by if_change.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build | 28 ++++++++++------------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 31154e44c251..3e4cd1439cd4 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -155,7 +155,7 @@ $(obj)/%.ll: $(src)/%.c FORCE
>  # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
>  
>  quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
> -      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
> +      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< $(cmd_objtool)
>  
>  ifdef CONFIG_MODVERSIONS
>  # When module versioning is enabled the following steps are executed:
> @@ -223,6 +223,8 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>  
>  ifdef CONFIG_STACK_VALIDATION
>  
> +objtool := $(objtree)/tools/objtool/objtool
> +
>  # Objtool arguments are also needed for modfinal with LTO, so we define
>  # then here to avoid duplication.
>  objtool_args =								\
> @@ -237,26 +239,19 @@ objtool_args =								\
>  
>  ifndef CONFIG_LTO_CLANG
>  
> -__objtool_obj := $(objtree)/tools/objtool/objtool
> -
>  # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
>  cmd_objtool = $(if $(patsubst y%,, \
>  	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> -	$(__objtool_obj) $(objtool_args) $@)
> -objtool_obj = $(if $(patsubst y%,, \
> -	$(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> -	$(__objtool_obj))
> +	; $(objtool) $(objtool_args) $@)

This is extremely clever -- pasting commands together. :)

Does this correctly propagate failures in the first half of the command?

For example, now we'd have:
	gcc flags..... -c -o out in ; objtool...

But I think objtool will run even on gcc failure, and "make" won't see
the failure from gcc? I need to go test this.

-Kees

> +
> +# Rebuild all objects when objtool is updated
> +objtool_dep = $(objtool)
>  
>  endif # CONFIG_LTO_CLANG
>  endif # CONFIG_STACK_VALIDATION
>  
> -# Rebuild all objects when objtool changes, or is enabled/disabled.
> -objtool_dep = $(objtool_obj)					\
> -	      $(wildcard include/config/ORC_UNWINDER		\
> -			 include/config/STACK_VALIDATION)
> -
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>  cmd_gen_ksymdeps = \
>  	$(CONFIG_SHELL) $(srctree)/scripts/gen_ksymdeps.sh $@ >> $(dot-target).cmd
> @@ -270,7 +265,6 @@ define rule_cc_o_c
>  	$(call cmd,gen_ksymdeps)
>  	$(call cmd,checksrc)
>  	$(call cmd,checkdoc)
> -	$(call cmd,objtool)
>  	$(call cmd,modversions_c)
>  	$(call cmd,record_mcount)
>  endef
> @@ -278,13 +272,11 @@ endef
>  define rule_as_o_S
>  	$(call cmd_and_fixdep,as_o_S)
>  	$(call cmd,gen_ksymdeps)
> -	$(call cmd,objtool)
>  	$(call cmd,modversions_S)
>  endef
>  
>  # Built-in and composite module parts
> -.SECONDEXPANSION:
> -$(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
> +$(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
>  	$(call if_changed_rule,cc_o_c)
>  	$(call cmd,force_checksrc)
>  
> @@ -367,7 +359,7 @@ $(obj)/%.s: $(src)/%.S FORCE
>  	$(call if_changed_dep,cpp_s_S)
>  
>  quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
> -      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
> +      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
>  
>  ifdef CONFIG_ASM_MODVERSIONS
>  
> @@ -386,7 +378,7 @@ cmd_modversions_S =								\
>  	fi
>  endif
>  
> -$(obj)/%.o: $(src)/%.S $$(objtool_dep) FORCE
> +$(obj)/%.o: $(src)/%.S $(objtool_dep) FORCE
>  	$(call if_changed_rule,as_o_S)
>  
>  targets += $(filter-out $(subdir-builtin), $(real-obj-y))
> -- 
> 2.30.2
> 

-- 
Kees Cook
