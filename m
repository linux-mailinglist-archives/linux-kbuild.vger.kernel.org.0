Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2FF43E9A3C
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Aug 2021 23:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhHKVIH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Aug 2021 17:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbhHKVIH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Aug 2021 17:08:07 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D94AC0613D3
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Aug 2021 14:07:43 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gz13-20020a17090b0ecdb0290178c0e0ce8bso6999040pjb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Aug 2021 14:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gtzTdYy8PUd+fsEC4iyKlDQnUGB4u43misFQsmm4WUQ=;
        b=faQ1VqT220rG5p2qAd4oJXyDy74R1L4u4mCNXXz4Pt0yJZQostBx0s5XE4Bm5w+nPG
         NS1F8FAVck+KgTztr4+8hFXP+Zh/zZW9qD3P0HSrEMwAGWVVwAX/S1qPd1MlBfObile9
         Vv1k5Ejrqsqr5Ejivk436J5TONeVLN4+74NAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gtzTdYy8PUd+fsEC4iyKlDQnUGB4u43misFQsmm4WUQ=;
        b=YWIrjwA7sj8d7c9VKZkYw/5Cb1ppZgHbKJzX0HCynZqiKWjtFINFJr6yKSiMrK+P+K
         TNd3Ojc95WLFxY8RvhGUte9wcLKPHdRqKpl7BsmsPTKyHs2+rt/wX5gBzhw3Tbuq6AOY
         hrFuN7ZwzQRtuKzgtqY5FOW7SzDohSzJ8PNBdUS76sT+O4U74eDW/hBwDaCicUe6kkO0
         rvGezwzGft81ZdnW0GHgnNREQfPAkWZo9u5XSuNE58zbO9v4louhuRRLtv0o+4XfnV1w
         N/GyHXz1J4GMxjMefPhs1PTJOVSOJp3nNxc5neNK77DSUO2pYgdF53VLRU6o2zDkGTa3
         n/tA==
X-Gm-Message-State: AOAM530bjJ9XWb5ZPHvZGMWeW6/RGQ6h158FOkzeH6rHo2tuzOrNJjY5
        uMgcVq6NaGvNaqkHjY8C0pkH2g==
X-Google-Smtp-Source: ABdhPJzVIOrm0mU0oZmGzPgkmftgGUUneEtiQ1+raq92w2cy9++TP96IpHMDbfzm9pTEGMJIilpRrA==
X-Received: by 2002:a65:55c6:: with SMTP id k6mr627068pgs.129.1628716062547;
        Wed, 11 Aug 2021 14:07:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b17sm439416pgl.61.2021.08.11.14.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 14:07:41 -0700 (PDT)
Date:   Wed, 11 Aug 2021 14:07:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Alexander Lobakin <alobakin@pm.me>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
Message-ID: <202108111403.DA451C8A8@keescook>
References: <20210811203035.2463343-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811203035.2463343-1-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 11, 2021 at 01:30:35PM -0700, Sami Tolvanen wrote:
> With CONFIG_LTO_CLANG, we currently link modules into native
> code just before modpost, which means with TRIM_UNUSED_KSYMS
> enabled, we still look at the LLVM bitcode in the .o files when
> generating the list of used symbols. As the bitcode doesn't
> yet have calls to compiler intrinsics and llvm-nm doesn't see
> function references that only exist in function-level inline
> assembly, we currently need a whitelist for TRIM_UNUSED_KSYMS to
> work with LTO.
> 
> This change moves module LTO linking to happen earlier, and
> thus avoids the issue with LLVM bitcode and TRIM_UNUSED_KSYMS
> entirely, allowing us to also drop the whitelist from
> gen_autoksyms.sh.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1369
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Reviewed-by: Alexander Lobakin <alobakin@pm.me>
> Tested-by: Alexander Lobakin <alobakin@pm.me>
> ---
> Changes in v2:
> - Fixed a couple of typos.
> - Fixed objtool arguments for .lto.o to always include --module.
> 
> ---
>  scripts/Makefile.build    | 24 +++++++++++++++++++++++-
>  scripts/Makefile.lib      |  7 +++++++
>  scripts/Makefile.modfinal | 21 ++-------------------
>  scripts/Makefile.modpost  | 22 +++-------------------
>  scripts/gen_autoksyms.sh  | 12 ------------
>  5 files changed, 35 insertions(+), 51 deletions(-)

Cool; this looks good. (It even makes the code smaller.) I can take this
in my tree if you'd rather not carry it Masahiro?

-Kees

> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 02197cb8e3a7..778dabea3a89 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -271,12 +271,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
>  	$(call if_changed_rule,cc_o_c)
>  	$(call cmd,force_checksrc)
>  
> +ifdef CONFIG_LTO_CLANG
> +# Module .o files may contain LLVM bitcode, compile them into native code
> +# before ELF processing
> +quiet_cmd_cc_lto_link_modules = LTO [M] $@
> +cmd_cc_lto_link_modules =						\
> +	$(LD) $(ld_flags) -r -o $@					\
> +		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
> +			echo -T $(@:.lto.o=.o.symversions))		\
> +		--whole-archive $^
> +
> +ifdef CONFIG_STACK_VALIDATION
> +# objtool was skipped for LLVM bitcode, run it now that we have compiled
> +# modules into native code
> +cmd_cc_lto_link_modules += ;						\
> +	$(objtree)/tools/objtool/objtool $(objtool_args) --module	\
> +		$(@:.ko=$(mod-prelink-ext).o)
> +endif
> +
> +$(obj)/%.lto.o: $(obj)/%.o
> +	$(call if_changed,cc_lto_link_modules)
> +endif
> +
>  cmd_mod = { \
>  	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
>  	$(undefined_syms) echo; \
>  	} > $@
>  
> -$(obj)/%.mod: $(obj)/%.o FORCE
> +$(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o FORCE
>  	$(call if_changed,mod)
>  
>  quiet_cmd_cc_lst_c = MKLST   $@
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 10950559b223..af1c920a585c 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -225,6 +225,13 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
>  		 $(addprefix -I,$(DTC_INCLUDE))                          \
>  		 -undef -D__DTS__
>  
> +ifeq ($(CONFIG_LTO_CLANG),y)
> +# With CONFIG_LTO_CLANG, .o files in modules might be LLVM bitcode, so we
> +# need to run LTO to compile them into native code (.lto.o) before further
> +# processing.
> +mod-prelink-ext := .lto
> +endif
> +
>  # Objtool arguments are also needed for modfinal with LTO, so we define
>  # then here to avoid duplication.
>  objtool_args =								\
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 5e9b8057fb24..ff805777431c 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -9,7 +9,7 @@ __modfinal:
>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>  
> -# for c_flags and objtool_args
> +# for c_flags and mod-prelink-ext
>  include $(srctree)/scripts/Makefile.lib
>  
>  # find all modules listed in modules.order
> @@ -30,23 +30,6 @@ quiet_cmd_cc_o_c = CC [M]  $@
>  
>  ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>  
> -ifdef CONFIG_LTO_CLANG
> -# With CONFIG_LTO_CLANG, reuse the object file we compiled for modpost to
> -# avoid a second slow LTO link
> -prelink-ext := .lto
> -
> -# ELF processing was skipped earlier because we didn't have native code,
> -# so let's now process the prelinked binary before we link the module.
> -
> -ifdef CONFIG_STACK_VALIDATION
> -cmd_ld_ko_o +=								\
> -	$(objtree)/tools/objtool/objtool $(objtool_args)		\
> -		$(@:.ko=$(prelink-ext).o);
> -
> -endif # CONFIG_STACK_VALIDATION
> -
> -endif # CONFIG_LTO_CLANG
> -
>  quiet_cmd_ld_ko_o = LD [M]  $@
>        cmd_ld_ko_o +=							\
>  	$(LD) -r $(KBUILD_LDFLAGS)					\
> @@ -72,7 +55,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>  
>  
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -$(modules): %.ko: %$(prelink-ext).o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
> +$(modules): %.ko: %$(mod-prelink-ext).o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
>  	+$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index c383ba33d837..eef56d629799 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -41,7 +41,7 @@ __modpost:
>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>  
> -# for ld_flags
> +# for mod-prelink-ext
>  include $(srctree)/scripts/Makefile.lib
>  
>  MODPOST = scripts/mod/modpost								\
> @@ -118,22 +118,6 @@ $(input-symdump):
>  	@echo >&2 '         Modules may not have dependencies or modversions.'
>  	@echo >&2 '         You may get many unresolved symbol warnings.'
>  
> -ifdef CONFIG_LTO_CLANG
> -# With CONFIG_LTO_CLANG, .o files might be LLVM bitcode, so we need to run
> -# LTO to compile them into native code before running modpost
> -prelink-ext := .lto
> -
> -quiet_cmd_cc_lto_link_modules = LTO [M] $@
> -cmd_cc_lto_link_modules =						\
> -	$(LD) $(ld_flags) -r -o $@					\
> -		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
> -			echo -T $(@:.lto.o=.o.symversions))		\
> -		--whole-archive $^
> -
> -%.lto.o: %.o
> -	$(call if_changed,cc_lto_link_modules)
> -endif
> -
>  modules := $(sort $(shell cat $(MODORDER)))
>  
>  # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined symbols
> @@ -144,9 +128,9 @@ endif
>  # Read out modules.order to pass in modpost.
>  # Otherwise, allmodconfig would fail with "Argument list too long".
>  quiet_cmd_modpost = MODPOST $@
> -      cmd_modpost = sed 's/\.ko$$/$(prelink-ext)\.o/' $< | $(MODPOST) -T -
> +      cmd_modpost = sed 's/\.ko$$/$(mod-prelink-ext)\.o/' $< | $(MODPOST) -T -
>  
> -$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=$(prelink-ext).o) FORCE
> +$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=$(mod-prelink-ext).o) FORCE
>  	$(call if_changed,modpost)
>  
>  targets += $(output-symdump)
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index da320151e7c3..6ed0d225c8b1 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -26,18 +26,6 @@ if [ -n "$CONFIG_MODVERSIONS" ]; then
>  	needed_symbols="$needed_symbols module_layout"
>  fi
>  
> -# With CONFIG_LTO_CLANG, LLVM bitcode has not yet been compiled into a binary
> -# when the .mod files are generated, which means they don't yet contain
> -# references to certain symbols that will be present in the final binaries.
> -if [ -n "$CONFIG_LTO_CLANG" ]; then
> -	# intrinsic functions
> -	needed_symbols="$needed_symbols memcpy memmove memset"
> -	# ftrace
> -	needed_symbols="$needed_symbols _mcount"
> -	# stack protector symbols
> -	needed_symbols="$needed_symbols __stack_chk_fail __stack_chk_guard"
> -fi
> -
>  ksym_wl=
>  if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
>  	# Use 'eval' to expand the whitelist path and check if it is relative
> 
> base-commit: 761c6d7ec820f123b931e7b8ef7ec7c8564e450f
> -- 
> 2.32.0.605.g8dce9f2422-goog
> 

-- 
Kees Cook
