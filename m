Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13A3EAB71
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Aug 2021 22:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbhHLUDE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Aug 2021 16:03:04 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63399 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhHLUDD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Aug 2021 16:03:03 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17CK2QXi022177;
        Fri, 13 Aug 2021 05:02:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17CK2QXi022177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628798546;
        bh=B2s6IPDU0ZhP9PTPZ+IHCIeZhp+kPml77B3svXFqvxs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vF7+DlT5VspEoottraQN6vL4780Jf6ZqoY1TXrU9KJ3E+DHlx+YxusTqWIWrdm77c
         A1GUIqGl5sWexFRyr1YzhV8zOJ+BoIc+0X4swgLRfeclaA/TsFFDzPGzXQapRWcRFY
         scRiWo8K3GO9QKWBMjVlf3Z+Oax6DOGnvy33rf4qHUoTgFjr2LFajetI3tIqzVOyVu
         e+HKGU/eg/XvS/QjwIUOT6VfFbh7juPkETas5OwDtf8+OuKOOrPwJ3WMymaKo0yQmy
         2CyaI/J72nghrF8JrMAoNEcicxqaZ8ViL5FOzeCA7f8a3j/WTGSEfOBBhCt2Y24ax6
         e9mPmt8uqThjw==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id e19so8717720pla.10;
        Thu, 12 Aug 2021 13:02:26 -0700 (PDT)
X-Gm-Message-State: AOAM531kkKIkzVKqI2lay7y5eNVx3cRRoizBA7DvieWEOa64ULjv0qaq
        2u5XlYOCoAf6LdS1T1cQGC4RAu2KPtPxy6crVCs=
X-Google-Smtp-Source: ABdhPJyAGsclF1gCXQl9VFeDdpJdj+pm9U3a7RM3tixuBRgNiz4O/Gv+JAxx0xWqHLTDNNPiqUFEV3t1TCrbnCPulus=
X-Received: by 2002:a65:6459:: with SMTP id s25mr5400881pgv.7.1628798545805;
 Thu, 12 Aug 2021 13:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210811203035.2463343-1-samitolvanen@google.com>
In-Reply-To: <20210811203035.2463343-1-samitolvanen@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 13 Aug 2021 05:01:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7Hf19wxebY70jK0TsebmfUpdh5AMo5W21PEjEXOERTw@mail.gmail.com>
Message-ID: <CAK7LNAS7Hf19wxebY70jK0TsebmfUpdh5AMo5W21PEjEXOERTw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
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

On Thu, Aug 12, 2021 at 5:30 AM Sami Tolvanen <samitolvanen@google.com> wrote:
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
> index 02197cb8e3a7..778dabea3a89 100644
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
> +               --whole-archive $^
> +
> +ifdef CONFIG_STACK_VALIDATION
> +# objtool was skipped for LLVM bitcode, run it now that we have compiled
> +# modules into native code
> +cmd_cc_lto_link_modules += ;                                           \
> +       $(objtree)/tools/objtool/objtool $(objtool_args) --module       \
> +               $(@:.ko=$(mod-prelink-ext).o)
> +endif
> +
> +$(obj)/%.lto.o: $(obj)/%.o
> +       $(call if_changed,cc_lto_link_modules)




Documentation/kbuild/makefiles.rst says:

          Note: It is a typical mistake to forget the FORCE prerequisite.


The current code in scripts/Makefile.modpost is also wrong, though.








-- 
Best Regards
Masahiro Yamada
