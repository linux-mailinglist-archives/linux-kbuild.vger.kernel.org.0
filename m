Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1533EC5F2
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Aug 2021 01:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbhHNX2D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Aug 2021 19:28:03 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48735 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233223AbhHNX2C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Aug 2021 19:28:02 -0400
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 17ENR3F9016741;
        Sun, 15 Aug 2021 08:27:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 17ENR3F9016741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628983624;
        bh=7z+omtu8gmqaOgMf41PFzvC+a++lkF72UQ6ovQ7SYtM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gAk2iqYKYlL5djzwU9V9CEFlUcdvR1rXne8LxZF27Id3LPl178D7A0B1ZkRyxCmw1
         FuXF8c7XzoMuyxP4IV8zF/fp4nJu5os5j70CnkTHD6VkhSpzavn9UyoBT83tN8j4+l
         ZtCz2XmcCG2BeNmGLPNRZvNyR3WcyifOWdFDgMzkkg26GQHwumnZ+wLVc0s9ulMj88
         V9vL8LJLoBAQtnkC1WoRlB5SSBP8MuMXYizGaSTCzfF86nq5E4YtMZSrFZgZdQbKXy
         6phlr0PU7+3xZ3htr2s+uAb1KCos2HOV4dcci2PzYDWvB8/Vv/rXO4/kMmyKowHSa0
         3fb9HPgaql8+g==
X-Nifty-SrcIP: [209.85.214.169]
Received: by mail-pl1-f169.google.com with SMTP id q2so16470699plr.11;
        Sat, 14 Aug 2021 16:27:04 -0700 (PDT)
X-Gm-Message-State: AOAM532YOWc5t7v/FP/L1osdbC1Ds9taYUC80rnFicYve/4OhSRHvzsg
        lSm9IYVF+F2Jws24Ei6qfdealMcOu9Zq0CN2Fl8=
X-Google-Smtp-Source: ABdhPJwtxVPWxqKubL4jUEY9FYp4nG3g60OA5ZtmvJTETngsClsH6k8brZlgIsWPU7lZjg/lopntRjp2lST4Jv/t1u8=
X-Received: by 2002:aa7:94ac:0:b0:3e0:f21a:e6ff with SMTP id
 a12-20020aa794ac000000b003e0f21ae6ffmr8732818pfl.76.1628983623343; Sat, 14
 Aug 2021 16:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210812214614.1797845-1-samitolvanen@google.com>
In-Reply-To: <20210812214614.1797845-1-samitolvanen@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 15 Aug 2021 08:26:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8Ucg=ZrEtMUCMkq3wonZqaijtrqbeUBod6DLERrp=zw@mail.gmail.com>
Message-ID: <CAK7LNAQ8Ucg=ZrEtMUCMkq3wonZqaijtrqbeUBod6DLERrp=zw@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Alexander Lobakin <alobakin@pm.me>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 13, 2021 at 6:46 AM 'Sami Tolvanen' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
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
> Changes in v3:
> - Added missing FORCE.



All the modules are recompiled every time.




masahiro@oscar:~/workspace/linux-kbuild$ make LLVM=1 LLVM_IAS=1  -j24
  DESCEND objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  LTO [M] net/netfilter/nf_log_syslog.lto.o
  LTO [M] net/netfilter/xt_mark.lto.o
  LTO [M] net/netfilter/xt_nat.lto.o
  LTO [M] net/netfilter/xt_LOG.lto.o
  LTO [M] drivers/thermal/intel/x86_pkg_temp_thermal.lto.o
  LTO [M] net/netfilter/xt_MASQUERADE.lto.o
  LTO [M] net/netfilter/xt_addrtype.lto.o
  LTO [M] fs/efivarfs/efivarfs.lto.o
  LTO [M] net/ipv4/netfilter/iptable_nat.lto.o
  CHK     include/generated/autoksyms.h
  MODPOST modules-only.symvers
  GEN     Module.symvers
  LD [M]  drivers/thermal/intel/x86_pkg_temp_thermal.ko
  LD [M]  fs/efivarfs/efivarfs.ko
  LD [M]  net/ipv4/netfilter/iptable_nat.ko
  LD [M]  net/netfilter/nf_log_syslog.ko
  LD [M]  net/netfilter/xt_LOG.ko
  LD [M]  net/netfilter/xt_MASQUERADE.ko
  LD [M]  net/netfilter/xt_addrtype.ko
  LD [M]  net/netfilter/xt_mark.ko
  LD [M]  net/netfilter/xt_nat.ko
Kernel: arch/x86/boot/bzImage is ready  (#20)




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
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 02197cb8e3a7..524701d9896b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -271,12 +271,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
>         $(call if_changed_rule,cc_o_c)
>         $(call cmd,force_checksrc)
>
> +ifdef CONFIG_LTO_CLANG
> +# Module .o files may contain LLVM bitcode, compile them into native code
> +# before ELF processing
> +quiet_cmd_cc_lto_link_modules = LTO [M] $@
> +cmd_cc_lto_link_modules =                                              \
> +       $(LD) $(ld_flags) -r -o $@                                      \
> +               $(shell [ -s $(@:.lto.o=.o.symversions) ] &&            \
> +                       echo -T $(@:.lto.o=.o.symversions))             \
> +               --whole-archive $(filter-out FORCE,$^)
> +
> +ifdef CONFIG_STACK_VALIDATION
> +# objtool was skipped for LLVM bitcode, run it now that we have compiled
> +# modules into native code
> +cmd_cc_lto_link_modules += ;                                           \
> +       $(objtree)/tools/objtool/objtool $(objtool_args) --module       \
> +               $(@:.ko=$(mod-prelink-ext).o)
> +endif
> +
> +$(obj)/%.lto.o: $(obj)/%.o FORCE
> +       $(call if_changed,cc_lto_link_modules)
> +endif
> +
>  cmd_mod = { \
>         echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
>         $(undefined_syms) echo; \
>         } > $@
>
> -$(obj)/%.mod: $(obj)/%.o FORCE
> +$(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o FORCE
>         $(call if_changed,mod)
>
>  quiet_cmd_cc_lst_c = MKLST   $@
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 10950559b223..af1c920a585c 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -225,6 +225,13 @@ dtc_cpp_flags  = -Wp,-MMD,$(depfile).pre.tmp -nostdinc                    \
>                  $(addprefix -I,$(DTC_INCLUDE))                          \
>                  -undef -D__DTS__
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
>  objtool_args =                                                         \
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
> -cmd_ld_ko_o +=                                                         \
> -       $(objtree)/tools/objtool/objtool $(objtool_args)                \
> -               $(@:.ko=$(prelink-ext).o);
> -
> -endif # CONFIG_STACK_VALIDATION
> -
> -endif # CONFIG_LTO_CLANG
> -
>  quiet_cmd_ld_ko_o = LD [M]  $@
>        cmd_ld_ko_o +=                                                   \
>         $(LD) -r $(KBUILD_LDFLAGS)                                      \
> @@ -72,7 +55,7 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>
>
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -$(modules): %.ko: %$(prelink-ext).o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
> +$(modules): %.ko: %$(mod-prelink-ext).o %.mod.o scripts/module.lds $(if $(KBUILD_BUILTIN),vmlinux) FORCE
>         +$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>         +$(if $(newer-prereqs),$(call cmd,btf_ko))
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
>  MODPOST = scripts/mod/modpost                                                          \
> @@ -118,22 +118,6 @@ $(input-symdump):
>         @echo >&2 '         Modules may not have dependencies or modversions.'
>         @echo >&2 '         You may get many unresolved symbol warnings.'
>
> -ifdef CONFIG_LTO_CLANG
> -# With CONFIG_LTO_CLANG, .o files might be LLVM bitcode, so we need to run
> -# LTO to compile them into native code before running modpost
> -prelink-ext := .lto
> -
> -quiet_cmd_cc_lto_link_modules = LTO [M] $@
> -cmd_cc_lto_link_modules =                                              \
> -       $(LD) $(ld_flags) -r -o $@                                      \
> -               $(shell [ -s $(@:.lto.o=.o.symversions) ] &&            \
> -                       echo -T $(@:.lto.o=.o.symversions))             \
> -               --whole-archive $^
> -
> -%.lto.o: %.o
> -       $(call if_changed,cc_lto_link_modules)
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
>         $(call if_changed,modpost)
>
>  targets += $(output-symdump)
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index da320151e7c3..6ed0d225c8b1 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -26,18 +26,6 @@ if [ -n "$CONFIG_MODVERSIONS" ]; then
>         needed_symbols="$needed_symbols module_layout"
>  fi
>
> -# With CONFIG_LTO_CLANG, LLVM bitcode has not yet been compiled into a binary
> -# when the .mod files are generated, which means they don't yet contain
> -# references to certain symbols that will be present in the final binaries.
> -if [ -n "$CONFIG_LTO_CLANG" ]; then
> -       # intrinsic functions
> -       needed_symbols="$needed_symbols memcpy memmove memset"
> -       # ftrace
> -       needed_symbols="$needed_symbols _mcount"
> -       # stack protector symbols
> -       needed_symbols="$needed_symbols __stack_chk_fail __stack_chk_guard"
> -fi
> -
>  ksym_wl=
>  if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
>         # Use 'eval' to expand the whitelist path and check if it is relative
>
> base-commit: f8fbb47c6e86c0b75f8df864db702c3e3f757361
> --
> 2.33.0.rc1.237.g0d66db33f3-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210812214614.1797845-1-samitolvanen%40google.com.



-- 
Best Regards
Masahiro Yamada
