Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C38E03FCC7D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbhHaRrf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhHaRrf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:47:35 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46517C061575
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:46:39 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id k13so535409lfv.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fNJZhJ+8+J9KlQKUE/9+J95AuiLd/rxK54Vkl1lgTIE=;
        b=jhmaXh0EXdMSY2VaEwzzNTKTTb2xpmQE0jLj4r5kLPBVlCH5xCq/SUsqWhd3xgbJ5Z
         8b1TyvdyiPwDertqoOm04rgQOO1qzg40AMa2IABZSh2pSFTjw6nxcjAVUT1cGUZFicm1
         yM7c/M0q0fIrR4LCS/lCGp2MqB6Z9SFLJ/dKzUsCsE9B48NwmKBDCvV6d29m136AXCOs
         yfqmWdmuiWH89pNKLSXvOj132HQGLJzC2QtFCiInQ6SVb6V0G3q+OH+gSEHXjrdxaGx2
         MWuwG68Q2t1CMFWprVEp661/Wy4nR+UxNgnkz3Z2X6ewr3LgmR9ui3dx33aM/rPp0XdX
         183A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fNJZhJ+8+J9KlQKUE/9+J95AuiLd/rxK54Vkl1lgTIE=;
        b=D4/RABsaBM0ER5NFAOBNlEF7pM7OySncf3h8CI95SrkUh7Tk4okQ+YrnYCqAu0v+sH
         i+mMf+5frP+EpSFV2TpL0eKuOqL2OSdngs0GHAN8dGga3ZpIT/T07lNcahmUugQ5t3V/
         1mt6mndiLHL4dENoxiCQNMutWWnO9Bxim55OIodPLHBAxas7S2YFqWi2HCOXuSUcMK+C
         nMGbW9Dlev4NMsfpu9O8C+VpeXhgNDWMS14VuWJWP1C+V2WhiU/XiiImgV9E5deV+Ik0
         cw/YMXQTWWjH/RipUyVycK2M2wCSU2E6QH8dJ3prZFKib19+Mh/sXh1ddrqa6bG26LgS
         LoJg==
X-Gm-Message-State: AOAM530daVUF6FlRQQM0z/tZf1a2/4W9Vac8pyhEscwO6bHMk/6eHCAp
        BQI5wQE7RGXc0qEygm81YgipPw4EUoeWNB4BTlwo3Q==
X-Google-Smtp-Source: ABdhPJzmOa6YN0wP2kWFJKTqSrJ/r+jlydmeu3j31PmBKd5Co10DhVJJWnMmHPTFp+zQrkEQSpCeQGKytOXe6aTQcLY=
X-Received: by 2002:a05:6512:3e22:: with SMTP id i34mr22596968lfv.374.1630431997110;
 Tue, 31 Aug 2021 10:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org> <20210831074004.3195284-9-masahiroy@kernel.org>
In-Reply-To: <20210831074004.3195284-9-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 31 Aug 2021 10:46:26 -0700
Message-ID: <CAKwvOdnuwORVSSqsrw1=DRXWXAah3+jmkP5sBUXfG8P=LmFBaQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] kbuild: build modules in the same way
 with/without Clang LTO
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
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

Is it worth modifying the diagram to note that objects in non-LTO
builds are <objects>.o, while for LTO builds, they are <objects>.bc?
If we're not using the .bc file suffix, can we?

>
> Since the Clang LTO introduction, Kbuild code is complicated due to
> CONFIG_LTO_CLANG conditionals sprinkled everywhere.
>
> Another confusion for Clang LTO builds is, <modname>.o is an archive
> that contains LLVM bitcode files. The suffix should be .a instead of .o
>
> To clean up the code, unify the build process of modules, as follows:
>
>          $(AR)            $(LD)                     $(LD)
>   objects ---> <modname>.a ---> <modname>.prelink.o -----> <modname>.ko
>                                                       |
>                                 <modname>.mod.o ------/

And here, too.

>
> Here, 'objects' are either ELF or LLVM bitcode. <modname>.a is an archive,
> <modname>.prelink.o is ELF.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/Makefile.build    | 100 +++++++++++++++++---------------------
>  scripts/Makefile.lib      |  11 ++---
>  scripts/Makefile.modfinal |   4 +-
>  scripts/Makefile.modpost  |   7 +--
>  scripts/mod/modpost.c     |   6 +--
>  5 files changed, 56 insertions(+), 72 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3ad1b1227371..cdc09e9080ca 100644
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
> @@ -243,9 +241,12 @@ endif # CONFIG_STACK_VALIDATION
>
>  ifdef CONFIG_LTO_CLANG
>
> -# Skip objtool for LLVM bitcode
> +# Skip objtool LLVM bitcode

I agree with Kees here; drop this comment change.

>  $(obj)/%o: objtool-enabled :=
>
> +# Run objtool now that we have compiled modules into native code
> +$(obj)/%.prelink.o: objtool-enabled := y
> +
>  else
>
>  # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
> @@ -255,6 +256,8 @@ else
>  $(obj)/%o: objtool-enabled = $(if $(filter-out y%, \
>         $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n),y)
>
> +$(obj)/%.prelink.o: objtool-enabled :=

Can we use the canonical .bc file suffix for LLVM bitcode, rather than
.prelink.o?

> +
>  endif
>
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> @@ -287,32 +290,12 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) FORCE
>         $(call if_changed_rule,cc_o_c)
>         $(call cmd,force_checksrc)
>
> -ifdef CONFIG_LTO_CLANG
> -# Module .o files may contain LLVM bitcode, compile them into native code
> -# before ELF processing
> -quiet_cmd_cc_lto_link_modules = LTO [M] $@
> -cmd_cc_lto_link_modules =                                              \
> -       $(LD) $(ld_flags) -r -o $@                                      \
> -               $(shell [ -s $(@:.lto.o=.o.symversions) ] &&            \
> -                       echo -T $(@:.lto.o=.o.symversions))             \
> -               --whole-archive $(filter-out FORCE,$^)                  \
> -               $(cmd_objtool)
> -
> -# objtool was skipped for LLVM bitcode, run it now that we have compiled
> -# modules into native code
> -$(obj)/%.lto.o: objtool-enabled = y
> -$(obj)/%.lto.o: part-of-module := y
> -
> -$(obj)/%.lto.o: $(obj)/%.o FORCE
> -       $(call if_changed,cc_lto_link_modules)
> -endif
> -
>  cmd_mod = { \
>         echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
>         $(undefined_syms) echo; \
>         } > $@
>
> -$(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o FORCE
> +$(obj)/%.mod: $(obj)/%.prelink.o FORCE
>         $(call if_changed,mod)
>
>  quiet_cmd_cc_lst_c = MKLST   $@
> @@ -416,17 +399,6 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
>  $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
>  $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
>
> -# combine symversions for later processing
> -ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
> -      cmd_update_lto_symversions =                                     \
> -       rm -f $@.symversions                                            \
> -       $(foreach n, $(filter-out FORCE,$^),                            \
> -               $(if $(shell test -s $(n).symversions && echo y),       \
> -                       ; cat $(n).symversions >> $@.symversions))
> -else
> -      cmd_update_lto_symversions = echo >/dev/null
> -endif
> -
>  #
>  # Rule to compile a set of .o files into one .a file (without symbol table)
>  #
> @@ -446,10 +418,10 @@ $(obj)/built-in.a: $(real-obj-y) FORCE
>  # modules.order unless contained modules are updated.
>
>  cmd_modules_order = { $(foreach m, $(real-prereqs), \
> -       $(if $(filter %/modules.order, $m), cat $m, echo $(patsubst %.o,%.ko,$m));) :; } \
> +       $(if $(filter %/modules.order, $m), cat $m, echo $(patsubst %.a,%.ko,$m));) :; } \
>         | $(AWK) '!x[$$0]++' - > $@
>
> -$(obj)/modules.order: $(obj-m) FORCE
> +$(obj)/modules.order: $(modules) FORCE
>         $(call if_changed,modules_order)
>
>  #
> @@ -458,26 +430,44 @@ $(obj)/modules.order: $(obj-m) FORCE
>  $(obj)/lib.a: $(lib-y) FORCE
>         $(call if_changed,ar)
>
> -# NOTE:
> -# Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
> -# module is turned into a multi object module, $^ will contain header file
> -# dependencies recorded in the .*.cmd file.
> -ifdef CONFIG_LTO_CLANG
> -quiet_cmd_link_multi-m = AR [M]  $@
> -cmd_link_multi-m =                                             \
> -       $(cmd_update_lto_symversions);                          \
> -       rm -f $@;                                               \
> -       $(AR) cDPrsT $@ $(filter %.o,$^)
> -else
> -quiet_cmd_link_multi-m = LD [M]  $@
> -      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
> +#
> +# Rule to prelink modules
> +#
> +
> +ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
> +
> +cmd_merge_symver = $(PERL) scripts/merge-symvers.pl -a $(AR) -o $@ $<
> +
> +$(obj)/%.prelink.symversions: $(obj)/%.a FORCE
> +       $(call if_changed,merge_symver)
> +
> +targets += $(patsubst %.a, %.prelink.symversions, $(modules))
> +
> +$(obj)/%.prelink.o: ld_flags += --script=$(filter %.symversions,$^)
> +module-symver = $(obj)/%.prelink.symversions
> +
>  endif
>
> -$(multi-obj-m): FORCE
> -       $(call if_changed,link_multi-m)
> -$(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
> +quiet_cmd_ld_o_a = LD [M]  $@
> +      cmd_ld_o_a = $(LD) $(ld_flags) -r -o $@ --whole-archive $< $(cmd_objtool)
> +
> +$(obj)/%.prelink.o: part-of-module := y
> +
> +$(obj)/%.prelink.o: $(obj)/%.a $(module-symver) FORCE
> +       $(call if_changed,ld_o_a)
> +
> +quiet_cmd_ar_module = AR [M]  $@
> +      cmd_ar_module = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
> +
> +$(modules-single): %.a: %.o FORCE
> +       $(call if_changed,ar_module)
> +
> +$(modules-multi): FORCE
> +       $(call if_changed,ar_module)
> +$(call multi_depend, $(modules-multi), .a, -objs -y -m)
> +
> +targets += $(modules-single) $(modules-multi)
>
> -targets += $(multi-obj-m)
>  targets := $(filter-out $(PHONY), $(targets))
>
>  # Add intermediate targets:
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 34c4c11c4bc1..5074922db82d 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -106,6 +106,10 @@ multi-dtb-y        := $(addprefix $(obj)/, $(multi-dtb-y))
>  real-dtb-y     := $(addprefix $(obj)/, $(real-dtb-y))
>  subdir-ym      := $(addprefix $(obj)/,$(subdir-ym))
>
> +modules                := $(patsubst %.o, %.a, $(obj-m))
> +modules-multi  := $(sort $(patsubst %.o, %.a, $(multi-obj-m)))
> +modules-single := $(sort $(filter-out $(modules-multi), $(filter %.a, $(modules))))
> +
>  # Finds the multi-part object the current object will be linked into.
>  # If the object belongs to two or more multi-part objects, list them all.
>  modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
> @@ -225,13 +229,6 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
>                  $(addprefix -I,$(DTC_INCLUDE))                          \
>                  -undef -D__DTS__
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
>         +$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>         +$(if $(newer-prereqs),$(call cmd,btf_ko))
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
>  MODPOST = scripts/mod/modpost                                                          \
>         $(if $(CONFIG_MODVERSIONS),-m)                                                  \
>         $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)                                        \
> @@ -128,9 +125,9 @@ endif
>  # Read out modules.order to pass in modpost.
>  # Otherwise, allmodconfig would fail with "Argument list too long".
>  quiet_cmd_modpost = MODPOST $@
> -      cmd_modpost = sed 's/\.ko$$/$(mod-prelink-ext)\.o/' $< | $(MODPOST) -T -
> +      cmd_modpost = sed 's/ko$$/prelink.o/' $< | $(MODPOST) -T -
>
> -$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=$(mod-prelink-ext).o) FORCE
> +$(output-symdump): $(MODORDER) $(input-symdump) $(modules:ko=prelink.o) FORCE
>         $(call if_changed,modpost)
>
>  targets += $(output-symdump)
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index a26139aa57fd..56cd9b7a5dd0 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2000,9 +2000,9 @@ static void read_symbols(const char *modname)
>                 /* strip trailing .o */
>                 tmp = NOFAIL(strdup(modname));
>                 tmp[strlen(tmp) - 2] = '\0';
> -               /* strip trailing .lto */
> -               if (strends(tmp, ".lto"))
> -                       tmp[strlen(tmp) - 4] = '\0';
> +               /* strip trailing .prelink */
> +               if (strends(tmp, ".prelink"))
> +                       tmp[strlen(tmp) - 8] = '\0';
>                 mod = new_module(tmp);
>                 free(tmp);
>         }
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
