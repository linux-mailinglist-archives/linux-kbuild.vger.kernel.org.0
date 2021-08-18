Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F140B3EF81D
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 04:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbhHRCfU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 22:35:20 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53389 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbhHRCfU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 22:35:20 -0400
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17I2YKKh030317;
        Wed, 18 Aug 2021 11:34:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17I2YKKh030317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629254060;
        bh=tSrtc1Fo6BTES2NTrunR7VHJaBchrQC+4v/A753o6u4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KseHonVk1PAeD+2DVeiGZN9kt976s4Hetk4gPMW9LKLoEiFXqDWtjARCL/x1usvzh
         pUpTKSb0gM7SEZ4MWqAy+13aP54D6cK7WwyvkOUmp/67/GgZJfJLBq7EsDm1rfONBX
         s5gjMgoE6NA7RFI0G65NCUFcomoIuiuDowyYWaAM2fVLiVApIqWlgoXj2CD3a7c0P7
         O5P/Rjkc0GDBgyG+m0Y2iV4IcpkkoBh+65Xd06ytuDo7S1XYW3VTSdIxmvCt3rpsvD
         XA32+TAnMMhps0YxmUsDLruySgqFSswC2mzOME9cowZi5LhzIm1TGhf/M7LpYpM1wc
         75oMJdGy2iytg==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id a21so656701pfh.5;
        Tue, 17 Aug 2021 19:34:20 -0700 (PDT)
X-Gm-Message-State: AOAM5306G9iDV/m+8uV6LEwZ5LdEIMtBDbxOvgqdUQM/FXvso6f7TS6S
        P+DqF/rfW2MbRBqe4+eckQ56kKuwEPv+P3YBUnI=
X-Google-Smtp-Source: ABdhPJwBHodEUpjXcVpwPs2tREgkr0VLZPBxe5MPj8qkKS95sxf+EypEr/EHKEkfFNPij57GqQ4CjUioPpPTacWQx9Q=
X-Received: by 2002:aa7:94ac:0:b0:3e0:f21a:e6ff with SMTP id
 a12-20020aa794ac000000b003e0f21ae6ffmr6607968pfl.76.1629254059709; Tue, 17
 Aug 2021 19:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210816180519.1021311-1-samitolvanen@google.com>
In-Reply-To: <20210816180519.1021311-1-samitolvanen@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Aug 2021 11:33:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASAHN=-uj73Uwk10aXbsR8AkUM_P=3NX_dq2SiFTqUctg@mail.gmail.com>
Message-ID: <CAK7LNASAHN=-uj73Uwk10aXbsR8AkUM_P=3NX_dq2SiFTqUctg@mail.gmail.com>
Subject: Re: [PATCH v4] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
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

On Tue, Aug 17, 2021 at 3:05 AM Sami Tolvanen <samitolvanen@google.com> wrote:
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
> Changes in v4:
> - Added .lto.o to targets to actually fix the use of if_changed.
> - Replaced an unnecessary mod-prelink-ext with .lto.
>
> Changes in v3:
> - Added missing FORCE.
>
> Changes in v2:
> - Fixed a couple of typos.
> - Fixed objtool arguments for .lto.o to always include --module.
>
> ---
>  scripts/Makefile.build    | 28 +++++++++++++++++++++++++++-
>  scripts/Makefile.lib      |  7 +++++++
>  scripts/Makefile.modfinal | 21 ++-------------------
>  scripts/Makefile.modpost  | 22 +++-------------------
>  scripts/gen_autoksyms.sh  | 12 ------------
>  5 files changed, 39 insertions(+), 51 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 02197cb8e3a7..a6f43afd09bb 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -88,6 +88,10 @@ endif
>
>  targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
>
> +ifdef CONFIG_LTO_CLANG
> +targets-for-modules += $(patsubst %.o, %.lto.o, $(filter %.o, $(obj-m)))
> +endif
> +
>  ifdef need-modorder
>  targets-for-modules += $(obj)/modules.order
>  endif
> @@ -271,12 +275,34 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $$(objtool_dep) FORCE
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
> +               $(@:.ko=.lto.o)


What is this "$(@:.ko=.lto.o)" doing ?

The target is already suffixed with .lto.o
so $(@:.ko=.lto.o) should be the same as $@


Shall I fix it locally unless
I find more questionable code?





> +endif
> +
> +$(obj)/%.lto.o: $(obj)/%.o FORCE
> +       $(call if_changed,cc_lto_link_modules)
> +endif
> +


-- 
Best Regards
Masahiro Yamada
