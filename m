Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AE53CBF89
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Jul 2021 01:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhGPXDL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jul 2021 19:03:11 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:52592 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhGPXDL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jul 2021 19:03:11 -0400
Date:   Fri, 16 Jul 2021 23:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1626476414; bh=r4eIb85gpwrzPUYTj2NVSS19F0NHWELbLKozaebxMLg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=cfLJGf5nNPz74ME+dzg2g6nzhbfHTwrgtPDJlAG7gI9fa1bWc3Kg+yyeTPWg93kIE
         tVrPFjgueCHWHh4s7QmQWQPD+Z8ugGjTSwW0lD6v352yXXDCkXRNPCd6vbkfFwOA3K
         no+53emH6W7+eaCDqOLxGrY79gorX65ROdUtxLXtEw1VV//HjBWAp3SvJqEaLXYqYn
         4YrzCzSJ4fgPGeKN7Ntpzq7W/PdGrgHhNRuTjJ2p3KiEcKYLfSpOnbj4KFAMZlilUn
         Rfi+Hlmits0tKPsP7QMczWAvFEbaA/QqcqlaCd4stlKOrw9NqeKgsiDO/NdYr5OXjK
         /hZ0rVsIVUd/g==
To:     Sami Tolvanen <samitolvanen@google.com>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
Message-ID: <20210716225245.67939-1-alobakin@pm.me>
In-Reply-To: <20210716204545.3536354-1-samitolvanen@google.com>
References: <20210716204545.3536354-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Fri, 16 Jul 2021 13:45:45 -0700

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
> ---
>  scripts/Makefile.build    | 25 ++++++++++++++++++++++++-
>  scripts/Makefile.lib      |  7 +++++++
>  scripts/Makefile.modfinal | 21 ++-------------------
>  scripts/Makefile.modpost  | 22 +++-------------------
>  scripts/gen_autoksyms.sh  | 12 ------------
>  5 files changed, 36 insertions(+), 51 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 10b2f2380d6f..80e0fa810870 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -202,6 +202,7 @@ sub_cmd_record_mcount =3D=09=09=09=09=09\
>  =09if [ $(@) !=3D "scripts/mod/empty.o" ]; then=09\
>  =09=09$(objtree)/scripts/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)";=09\
>  =09fi;
> +/

Seems like a leftover or a random typo here.

>  recordmcount_source :=3D $(srctree)/scripts/recordmcount.c \
>  =09=09    $(srctree)/scripts/recordmcount.h
>  else
> @@ -271,12 +272,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(ob=
jtool_dep) FORCE
>  =09$(call if_changed_rule,cc_o_c)
>  =09$(call cmd,force_checksrc)
>
> +ifdef CONFIG_LTO_CLANG
> +# Module .o files may contain LLVM bitcode, compile them into native cod=
e
> +# before ELF processing
> +quiet_cmd_cc_lto_link_modules =3D LTO [M] $@
> +cmd_cc_lto_link_modules =3D=09=09=09=09=09=09\
> +=09$(LD) $(ld_flags) -r -o $@=09=09=09=09=09\
> +=09=09$(shell [ -s $(@:.lto.o=3D.o.symversions) ] &&=09=09\
> +=09=09=09echo -T $(@:.lto.o=3D.o.symversions))=09=09\
> +=09=09--whole-archive $^
> +
> +ifdef CONFIG_STACK_VALIDATION
> +# objtool was skipped for LLVM bitcode, run it now that we have compiled
> +# modules into native code
> +cmd_cc_lto_link_modules +=3D ;=09=09=09=09=09=09\
> +=09$(objtree)/tools/objtool/objtool $(objtool_args)=09=09\

Now $(part-of-module) inside $(objtool_args) doesn't get expanded
properly, because previously it was being called on x.ko, and now
it's being called on x.lto.o. $(basename $@) returns "x.lto" instead
of "x", and Make doesn't find "x.lto.o" in $(real-objs-m).

An example of objtool args dump:

  LTO [M] fs/btrfs/btrfs.lto.o
Call: ./tools/objtool/objtool orc generate --no-fp --no-unreachable --retpo=
line --uaccess fs/btrfs/btrfs.lto.o
fs/btrfs/btrfs.lto.o: warning: objtool: static_call: can't find static_call=
_key symbol: __SCK__might_resched

As can be seen, objtools command line no longer contains "--module".
And this warning about "can't find static_call_key" can appear only
in case of !module -> no -m|--module param was given.

As a result, modules get broken and the kernel panics after loading
initramfs.

> +=09=09$(@:.ko=3D$(mod-prelink-ext).o)
> +endif
> +
> +$(obj)/%.lto.o: $(obj)/%.o
> +=09$(call if_changed,cc_lto_link_modules)
> +endif
> +
>  cmd_mod =3D { \
>  =09echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $=
($*-y) $($*-m)), $(@:.mod=3D.o)); \
>  =09$(undefined_syms) echo; \
>  =09} > $@
>
> -$(obj)/%.mod: $(obj)/%.o FORCE
> +$(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o FORCE
>  =09$(call if_changed,mod)
>
>  quiet_cmd_cc_lst_c =3D MKLST   $@
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 10950559b223..ee985366dddf 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -225,6 +225,13 @@ dtc_cpp_flags  =3D -Wp,-MMD,$(depfile).pre.tmp -nost=
dinc                    \
>  =09=09 $(addprefix -I,$(DTC_INCLUDE))                          \
>  =09=09 -undef -D__DTS__
>
> +ifeq ($(CONFIG_LTO_CLANG),y)
> +# With CONFIG_LTO_CLANG, .o files in modules might be LLVM bitcode, so w=
e
> +# need to run # LTO to compile them into native code (.lto.o) before fur=
ther
> +# processing.
> +mod-prelink-ext :=3D .lto
> +endif
> +
>  # Objtool arguments are also needed for modfinal with LTO, so we define
>  # then here to avoid duplication.
>  objtool_args =3D=09=09=09=09=09=09=09=09\
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
> @@ -30,23 +30,6 @@ quiet_cmd_cc_o_c =3D CC [M]  $@
>
>  ARCH_POSTLINK :=3D $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postli=
nk)
>
> -ifdef CONFIG_LTO_CLANG
> -# With CONFIG_LTO_CLANG, reuse the object file we compiled for modpost t=
o
> -# avoid a second slow LTO link
> -prelink-ext :=3D .lto
> -
> -# ELF processing was skipped earlier because we didn't have native code,
> -# so let's now process the prelinked binary before we link the module.
> -
> -ifdef CONFIG_STACK_VALIDATION
> -cmd_ld_ko_o +=3D=09=09=09=09=09=09=09=09\
> -=09$(objtree)/tools/objtool/objtool $(objtool_args)=09=09\
> -=09=09$(@:.ko=3D$(prelink-ext).o);
> -
> -endif # CONFIG_STACK_VALIDATION
> -
> -endif # CONFIG_LTO_CLANG
> -
>  quiet_cmd_ld_ko_o =3D LD [M]  $@
>        cmd_ld_ko_o +=3D=09=09=09=09=09=09=09\
>  =09$(LD) -r $(KBUILD_LDFLAGS)=09=09=09=09=09\
> @@ -72,7 +55,7 @@ if_changed_except =3D $(if $(call newer_prereqs_except,=
$(2))$(cmd-check),      \
>
>
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
> -$(modules): %.ko: %$(prelink-ext).o %.mod.o scripts/module.lds $(if $(KB=
UILD_BUILTIN),vmlinux) FORCE
> +$(modules): %.ko: %$(mod-prelink-ext).o %.mod.o scripts/module.lds $(if =
$(KBUILD_BUILTIN),vmlinux) FORCE
>  =09+$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
>  =09+$(if $(newer-prereqs),$(call cmd,btf_ko))
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
>  MODPOST =3D scripts/mod/modpost=09=09=09=09=09=09=09=09\
> @@ -118,22 +118,6 @@ $(input-symdump):
>  =09@echo >&2 '         Modules may not have dependencies or modversions.=
'
>  =09@echo >&2 '         You may get many unresolved symbol warnings.'
>
> -ifdef CONFIG_LTO_CLANG
> -# With CONFIG_LTO_CLANG, .o files might be LLVM bitcode, so we need to r=
un
> -# LTO to compile them into native code before running modpost
> -prelink-ext :=3D .lto
> -
> -quiet_cmd_cc_lto_link_modules =3D LTO [M] $@
> -cmd_cc_lto_link_modules =3D=09=09=09=09=09=09\
> -=09$(LD) $(ld_flags) -r -o $@=09=09=09=09=09\
> -=09=09$(shell [ -s $(@:.lto.o=3D.o.symversions) ] &&=09=09\
> -=09=09=09echo -T $(@:.lto.o=3D.o.symversions))=09=09\
> -=09=09--whole-archive $^
> -
> -%.lto.o: %.o
> -=09$(call if_changed,cc_lto_link_modules)
> -endif
> -
>  modules :=3D $(sort $(shell cat $(MODORDER)))
>
>  # KBUILD_MODPOST_WARN can be set to avoid error out in case of undefined=
 symbols
> @@ -144,9 +128,9 @@ endif
>  # Read out modules.order to pass in modpost.
>  # Otherwise, allmodconfig would fail with "Argument list too long".
>  quiet_cmd_modpost =3D MODPOST $@
> -      cmd_modpost =3D sed 's/\.ko$$/$(prelink-ext)\.o/' $< | $(MODPOST) =
-T -
> +      cmd_modpost =3D sed 's/\.ko$$/$(mod-prelink-ext)\.o/' $< | $(MODPO=
ST) -T -
>
> -$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=3D$(prelin=
k-ext).o) FORCE
> +$(output-symdump): $(MODORDER) $(input-symdump) $(modules:.ko=3D$(mod-pr=
elink-ext).o) FORCE
>  =09$(call if_changed,modpost)
>
>  targets +=3D $(output-symdump)
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index da320151e7c3..6ed0d225c8b1 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -26,18 +26,6 @@ if [ -n "$CONFIG_MODVERSIONS" ]; then
>  =09needed_symbols=3D"$needed_symbols module_layout"
>  fi
>
> -# With CONFIG_LTO_CLANG, LLVM bitcode has not yet been compiled into a b=
inary
> -# when the .mod files are generated, which means they don't yet contain
> -# references to certain symbols that will be present in the final binari=
es.
> -if [ -n "$CONFIG_LTO_CLANG" ]; then
> -=09# intrinsic functions
> -=09needed_symbols=3D"$needed_symbols memcpy memmove memset"
> -=09# ftrace
> -=09needed_symbols=3D"$needed_symbols _mcount"
> -=09# stack protector symbols
> -=09needed_symbols=3D"$needed_symbols __stack_chk_fail __stack_chk_guard"
> -fi
> -
>  ksym_wl=3D
>  if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
>  =09# Use 'eval' to expand the whitelist path and check if it is relative
> --
> 2.32.0.402.g57bb445576-goog
>
>

Thanks,
Al

