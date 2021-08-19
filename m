Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A31E3F13E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 08:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbhHSG7k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 02:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbhHSG7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 02:59:39 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA31C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:59:04 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id k24so4979362pgh.8
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z7kmamtsFLaM9G/N0adEqCxiung+DUmrpekphu6Qphw=;
        b=UXAunTYD28GELTeDOtmOfXw0Dq5cq0j/o3nlyDqPjdvWaAzht2TL96DApAlCfvMrjv
         OfbyuRHTh4o7EeBU1hzEItXWSqFktqPX81WkTOz/Ut4gs1Hg7XHPlcxFJyfK/Evs8Zp4
         zNp480tMj4APOHJ8MhnXbBif6puOun5CUNdIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z7kmamtsFLaM9G/N0adEqCxiung+DUmrpekphu6Qphw=;
        b=azXEk2FWJ60DithiqyYFH83DBYQkSwBq1cLU5BBsHbgsT3ccT+0ppMq0+PEEuNviqf
         YiAPkSi/AcW8hcwzg7QZWDqjn6pTR9xfCLLtaKPojC/ja9YKyFpndu9S7xSPhW04zDUI
         8Dx5o55v0lni/E8W9ySqfNPtInh0NfA1HJPKNMXdklAnd3PLG3OzSMMCh/9kRYakiLHL
         0dD/6YUx46+AznncOSGtsYz9TNPcfQ1U+JRCWFqSlaTdhAJQM9sp/BYGQiUpIFse5hMy
         yZVtaQl1H/zX2sl9Ejr5+SeSaw+aETDDV4TCW/gdiAMoiQO2EPavl1md4UP/MW+JMsxl
         YIow==
X-Gm-Message-State: AOAM531uA8JHSbvvLDimZ8C7GXxnSlNyJuAMhz6Ot6tdgoEU4/3xzZ/B
        diQIPWVhxwFQfsSMgj7ni7wqLg==
X-Google-Smtp-Source: ABdhPJzkvF0qigtdfuRBVUeIXrhVZriHw/k6TpXwLF7Z9km9Fx2crhJebhJtne+y1a9m49jQNpJ2cA==
X-Received: by 2002:a63:d456:: with SMTP id i22mr12747816pgj.421.1629356343545;
        Wed, 18 Aug 2021 23:59:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q18sm2086961pfj.178.2021.08.18.23.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 23:59:03 -0700 (PDT)
Date:   Wed, 18 Aug 2021 23:59:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH 10/13] kbuild: build modules in the same way with/without
 Clang LTO
Message-ID: <202108182348.715797A@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-11-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-11-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:41AM +0900, Masahiro Yamada wrote:
> When Clang LTO is enabled, additional intermediate files *.lto.o are
> created because LLVM bitcode must be converted to ELF before modpost.
> 
> For non-LTO builds:
> 
>          $(LD)             $(LD)
>   objects ---> <modname>.o -----> <modname>.ko
>                              |
>           <modname>.mod.o ---/
> 
> For Clang LTO builds:
> 
>          $(AR)            $(LD)                 $(LD)
>   objects ---> <modname>.o ---> <modname>.lto.o -----> <modname>.ko
>                                                   |
>                                 <modname>.mod.o --/
> 
> Since the Clang LTO introduction, ugly CONFIG_LTO_CLANG conditionals
> are sprinkled everywhere in the kbuild code.
> 
> Another confusion for Clang LTO builds is, <modname>.o is an archive
> that contains LLVM bitcode files. The suffix should have been .a
> instead of .o
> 
> To clean up the code, unify the build process of modules, as follows:
> 
>          $(AR)            $(LD)                     $(LD)
>   objects ---> <modname>.a ---> <modname>.prelink.o -----> <modname>.ko
>                                                       |
>                                 <modname>.mod.o ------/
> 
> Here, 'objects' are either ELF or LLVM bitcode. <modname>.a is an archive,
> <modname>.prelink.o is ELF.

I like this design, but I do see that it has a small but measurable
impact on build times:

allmodconfig build, GCC:

make -j72 allmodconfig
make -j72 -s clean && time make -j72

    kbuild/for-next:
        6m16.140s
        6m19.742s
        6m15.848s

    +this-series:
        6m22.742s
        6m20.589s
        6m19.911s

Thought with not so many modules, it's within the noise:

defconfig build, GCC:

make -j72 defconfig
make -j72 -s clean && time make -j72

    kbuild/for-next:
        0m41.579s
        0m41.214s
        0m41.370s

    +series:
        0m41.423s
        0m41.434s
        0m41.384s


However, I do see that even LTO builds are slightly slower now, so
perhaps the above numbers aren't due to the added $(AR) step:

allmodconfig + Clang ThinLTO:

make -j72 LLVM=1 LLVM_IAS=1 allmodconfig
./scripts/config -d GCOV_KERNEL -d KASAN -d LTO_NONE -e LTO_CLANG_THIN
make -j72 LLVM=1 LLVM_IAS=1 olddefconfig
make -j72 -s LLVM=1 LLVM_IAS=1 clean && time make -j72 LLVM=1 LLVM_IAS=1

    kbuild/for-next:
        9m53.927s
        9m45.874s
        9m47.722s

    +series:
        9m58.395s
        9m53.201s
        9m56.387s


I haven't been able to isolate where the changes in build times are
coming from (nor have I done link-phase-only timings -- I realize those
are really the most important).

I did notice some warnings from this patch, though, in the
$(modules-single) target:

scripts/Makefile.build:434: target 'drivers/scsi/libiscsi.a' given more than once in the same rule
scripts/Makefile.build:434: target 'drivers/atm/suni.a' given more than once in the same rule

(And I saw the new "FORCE prerequisite is missing" warnings, but those
are in kbuild/for-next and not new for this series.)

Anyway, this is a great clean-up; thank you very much for finding the
time for it! I'll keep poking at it tomorrow.

-Kees

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.build    | 103 ++++++++++++++++++--------------------
>  scripts/Makefile.lib      |  11 ++--
>  scripts/Makefile.modfinal |   4 +-
>  scripts/Makefile.modpost  |   7 +--
>  scripts/mod/modpost.c     |   6 +--
>  scripts/mod/sumversion.c  |   6 +--
>  6 files changed, 61 insertions(+), 76 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 37d6f6da34d6..957addea830b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -88,9 +88,7 @@ endif
>  
>  targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
>  
> -ifdef CONFIG_LTO_CLANG
> -targets-for-modules += $(patsubst %.o, %.lto.o, $(filter %.o, $(obj-m)))
> -endif
> +targets-for-modules += $(patsubst %.o, %.prelink.o, $(filter %.o, $(obj-m)))
>  
>  ifdef need-modorder
>  targets-for-modules += $(obj)/modules.order
> @@ -282,33 +280,12 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
>  	$(call if_changed_rule,cc_o_c)
>  	$(call cmd,force_checksrc)
>  
> -ifdef CONFIG_LTO_CLANG
> -# Module .o files may contain LLVM bitcode, compile them into native code
> -# before ELF processing
> -quiet_cmd_cc_lto_link_modules = LTO [M] $@
> -cmd_cc_lto_link_modules =						\
> -	$(LD) $(ld_flags) -r -o $@					\
> -		$(shell [ -s $(@:.lto.o=.o.symversions) ] &&		\
> -			echo -T $(@:.lto.o=.o.symversions))		\
> -		--whole-archive $(filter-out FORCE,$^)
> -
> -ifdef CONFIG_STACK_VALIDATION
> -# objtool was skipped for LLVM bitcode, run it now that we have compiled
> -# modules into native code
> -cmd_cc_lto_link_modules += ;						\
> -	$(objtree)/tools/objtool/objtool $(objtool_args) --module $@
> -endif
> -
> -$(obj)/%.lto.o: $(obj)/%.o FORCE
> -	$(call if_changed,cc_lto_link_modules)
> -endif
> -
>  cmd_mod = { \
>  	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
>  	$(undefined_syms) echo; \
>  	} > $@
>  
> -$(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o FORCE
> +$(obj)/%.mod: $(obj)/%.prelink.o FORCE
>  	$(call if_changed,mod)
>  
>  quiet_cmd_cc_lst_c = MKLST   $@
> @@ -412,17 +389,6 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
>  $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
>  $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>  
> -# combine symversions for later processing
> -ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
> -      cmd_update_lto_symversions =					\
> -	rm -f $@.symversions						\
> -	$(foreach n, $(filter-out FORCE,$^),				\
> -		$(if $(shell test -s $(n).symversions && echo y),	\
> -			; cat $(n).symversions >> $@.symversions))
> -else
> -      cmd_update_lto_symversions = echo >/dev/null
> -endif
> -
>  #
>  # Rule to compile a set of .o files into one .a file (without symbol table)
>  #
> @@ -442,10 +408,10 @@ $(obj)/built-in.a: $(real-obj-y) FORCE
>  # modules.order unless contained modules are updated.
>  
>  cmd_modules_order = { $(foreach m, $(real-prereqs), \
> -	$(if $(filter %/modules.order, $m), cat $m, echo $(patsubst %.o,%.ko,$m));) :; } \
> +	$(if $(filter %/modules.order, $m), cat $m, echo $(patsubst %.a,%.ko,$m));) :; } \
>  	| $(AWK) '!x[$$0]++' - > $@
>  
> -$(obj)/modules.order: $(obj-m) FORCE
> +$(obj)/modules.order: $(modules) FORCE
>  	$(call if_changed,modules_order)
>  
>  #
> @@ -454,26 +420,55 @@ $(obj)/modules.order: $(obj-m) FORCE
>  $(obj)/lib.a: $(lib-y) FORCE
>  	$(call if_changed,ar)
>  
> -# NOTE:
> -# Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
> -# module is turned into a multi object module, $^ will contain header file
> -# dependencies recorded in the .*.cmd file.
> +#
> +# Rule to prelink modules
> +#
> +
> +ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
> +
> +cmd_merge_symver =					\
> +	rm -f $@;					\
> +	touch $@;					\
> +	for o in $$($(AR) t $<); do			\
> +		if [ -s $${o}.symversions ]; then	\
> +			cat $${o}.symversions >> $@;	\
> +		fi;					\
> +	done
> +
> +$(obj)/%.prelink.symversions: $(obj)/%.a FORCE
> +	$(call if_changed,merge_symver)
> +
> +$(obj)/%.prelink.o: ld_flags += --script=$(filter %.symversions,$^)
> +module-symver = $(obj)/%.prelink.symversions
> +
> +endif
> +
> +quiet_cmd_ld_o_a = LD [M]  $@
> +      cmd_ld_o_a = $(LD) $(ld_flags) -r -o $@ --whole-archive $<
> +
> +$(obj)/%.prelink.o: $(obj)/%.a $(module-symver) FORCE
> +	$(call if_changed,ld_o_a)
> +
>  ifdef CONFIG_LTO_CLANG
> -quiet_cmd_link_multi-m = AR [M]  $@
> -cmd_link_multi-m =						\
> -	$(cmd_update_lto_symversions);				\
> -	rm -f $@; 						\
> -	$(AR) cDPrsT $@ $(filter %.o,$^)
> -else
> -quiet_cmd_link_multi-m = LD [M]  $@
> -      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
> +ifdef CONFIG_STACK_VALIDATION
> +# objtool was skipped for LLVM bitcode, run it now that we have compiled
> +# modules into native code
> +cmd_ld_o_a += ; $(objtool) $(objtool_args) --module $@
>  endif
> +endif
> +
> +quiet_cmd_ar_module = AR [M]  $@
> +      cmd_ar_module = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
> +
> +$(modules-single): %.a: %.o FORCE
> +	$(call if_changed,ar_module)
> +
> +$(modules-multi): FORCE
> +	$(call if_changed,ar_module)
> +$(call multi_depend, $(modules-multi), .a, -objs -y -m)
>  
> -$(multi-obj-m): FORCE
> -	$(call if_changed,link_multi-m)
> -$(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
> +targets += $(modules-single) $(modules-multi)
>  
> -targets += $(multi-obj-m)
>  targets := $(filter-out $(PHONY), $(targets))
>  
>  # Add intermediate targets:
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 34c4c11c4bc1..f604d2d01cad 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -106,6 +106,10 @@ multi-dtb-y	:= $(addprefix $(obj)/, $(multi-dtb-y))
>  real-dtb-y	:= $(addprefix $(obj)/, $(real-dtb-y))
>  subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
>  
> +modules		:= $(patsubst %.o, %.a, $(obj-m))
> +modules-multi	:= $(patsubst %.o, %.a, $(multi-obj-m))
> +modules-single	:= $(filter-out $(modules-multi), $(filter %.a, $(modules)))
> +
>  # Finds the multi-part object the current object will be linked into.
>  # If the object belongs to two or more multi-part objects, list them all.
>  modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
> @@ -225,13 +229,6 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
>  		 $(addprefix -I,$(DTC_INCLUDE))                          \
>  		 -undef -D__DTS__
>  
> -ifeq ($(CONFIG_LTO_CLANG),y)
> -# With CONFIG_LTO_CLANG, .o files in modules might be LLVM bitcode, so we
> -# need to run LTO to compile them into native code (.lto.o) before further
> -# processing.
> -mod-prelink-ext := .lto
> -endif
> -
>  # Useful for describing the dependency of composite objects
>  # Usage:
>  #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index ff805777431c..1b6401f53662 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -9,7 +9,7 @@ __modfinal:
>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>  
> -# for c_flags and mod-prelink-ext
> +# for c_flags
>  include $(srctree)/scripts/Makefile.lib
>  
>  # find all modules listed in modules.order
> @@ -55,7 +55,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>  
>  
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -$(modules): %.ko: %$(mod-prelink-ext).o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
> +$(modules): %.ko: %.prelink.o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
>  	+$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  	+$(if $(newer-prereqs),$(call cmd,btf_ko))
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index eef56d629799..11883b31c615 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -41,9 +41,6 @@ __modpost:
>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>  
> -# for mod-prelink-ext
> -include $(srctree)/scripts/Makefile.lib
> -
>  MODPOST = scripts/mod/modpost								\
>  	$(if $(CONFIG_MODVERSIONS),-m)							\
>  	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
> @@ -128,9 +125,9 @@ endif
>  # Read out modules.order to pass in modpost.
>  # Otherwise, allmodconfig would fail with "Argument list too long".
>  quiet_cmd_modpost = MODPOST $@
> -      cmd_modpost = sed 's/\.ko$$/$(mod-prelink-ext)\.o/' $< | $(MODPOST) -T -
> +      cmd_modpost = sed 's/ko$$/prelink.o/' $< | $(MODPOST) -T -
>  
> -$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=$(mod-prelink-ext).o) FORCE
> +$(output-symdump): $(MODORDER) $(input-symdump) $(modules:ko=prelink.o) FORCE
>  	$(call if_changed,modpost)
>  
>  targets += $(output-symdump)
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 270a7df898e2..8c63c52af88d 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1991,9 +1991,9 @@ static void read_symbols(const char *modname)
>  		/* strip trailing .o */
>  		tmp = NOFAIL(strdup(modname));
>  		tmp[strlen(tmp) - 2] = '\0';
> -		/* strip trailing .lto */
> -		if (strends(tmp, ".lto"))
> -			tmp[strlen(tmp) - 4] = '\0';
> +		/* strip trailing .prelink */
> +		if (strends(tmp, ".prelink"))
> +			tmp[strlen(tmp) - 8] = '\0';
>  		mod = new_module(tmp);
>  		free(tmp);
>  	}
> diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
> index 760e6baa7eda..8ea0f7b23c63 100644
> --- a/scripts/mod/sumversion.c
> +++ b/scripts/mod/sumversion.c
> @@ -391,14 +391,10 @@ void get_src_version(const char *modname, char sum[], unsigned sumlen)
>  	struct md4_ctx md;
>  	char *fname;
>  	char filelist[PATH_MAX + 1];
> -	int postfix_len = 1;
> -
> -	if (strends(modname, ".lto.o"))
> -		postfix_len = 5;
>  
>  	/* objects for a module are listed in the first line of *.mod file. */
>  	snprintf(filelist, sizeof(filelist), "%.*smod",
> -		 (int)strlen(modname) - postfix_len, modname);
> +		 (int)(strlen(modname) - strlen("prelink.o")), modname);
>  
>  	buf = read_text_file(filelist);
>  
> -- 
> 2.30.2
> 

-- 
Kees Cook
