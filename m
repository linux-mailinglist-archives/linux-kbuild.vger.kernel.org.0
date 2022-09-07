Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B9DA5AFB9C
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Sep 2022 07:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiIGFQW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Sep 2022 01:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiIGFQS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Sep 2022 01:16:18 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BB17C74E
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Sep 2022 22:16:17 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id d2so1455115wrn.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Sep 2022 22:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=oU8W6alvDN0OMVZM0L8FwuwK7UOu8fVVSjp4wQjzs3o=;
        b=qR9fdufcCL0/KmxMh+u3ioPLc2LseIuQ8MpL+glsKoOKMKmIFiJaFZAuna3Nj2AXoS
         hs6HlraozgRAQczTYOOZ700HVmk/vlqK3MmWE73qkVk6OPofMtCwekv8GHRMxkySbUIV
         O1pjeOr1TgDAeKIcjdA6pMzKj83ySEGhAQXE88k6/HQT1dSGS3CPNGamFxxILUUWJ8kd
         tbovfin+Ojz2z5rbUbETU8CqwM0DtkiGsAsnjCTRLxXZYZsdzOUnNTEPWVlRXmNq+GCM
         vc04olS0DTy6b7ho5X/v+JXnI0F2nqOtlLaHcWEInAl5mwlDwcoe6zn36nUrAE8rD1Fj
         s6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=oU8W6alvDN0OMVZM0L8FwuwK7UOu8fVVSjp4wQjzs3o=;
        b=HIJ3FxBctic4kYYS04kiGfweqgenL5/b/CYXUVjux1jPy2TyMNmcv7p3dOMxkUd/my
         e/tQj5z8MByoA7IBUw/ZKI2OSJpjOgStR09u5dfnlQup/3u/Z0S/ptY8Aw3J8rHhG1I8
         isUJxT84M23esr02goT6KyQlAEpsZ+R57WVKtDzM0u1b0/FDuj6Nh3DPTvY4ZW7DWHfc
         /0DjF5GeX3NI+xtfrZGUyodiEGkKJ9yCPSeG8dufl8SA7c/jYJ+GneUS1OZqGzbcGJf1
         2Bl6QRsZ3vCap6eKJsETfYNpKyXXlpmtv5kwra/o/4tIBWSTYbT+jeXeLmWh+8Y7LT+K
         2hBQ==
X-Gm-Message-State: ACgBeo0RwSOuMq81jgBDRRu2FobhJl0zXcirrkOWkvwaFDANJkuJggHW
        h4MGdMzNxlL1qXsqmqOIm+6mBat0v9raEP/ORk870C8nShI=
X-Google-Smtp-Source: AA6agR548b8HpDkWKD2Tp4+os6Fv9ujZvK2kY5dylltPshj5HLgw4rnpwTWkpsyCzt71bYdhjtWsWCpCEhAUk06sRnY=
X-Received: by 2002:a05:6000:813:b0:226:da5a:84a9 with SMTP id
 bt19-20020a056000081300b00226da5a84a9mr822661wrb.309.1662527775643; Tue, 06
 Sep 2022 22:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220906184935.1157228-1-masahiroy@kernel.org>
In-Reply-To: <20220906184935.1157228-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 6 Sep 2022 22:16:04 -0700
Message-ID: <CAKwvOdnH8TKTFxFTN3fQB=dXFHrd+54zbs4kcc2KeZ+w9cLpSA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: use objtool-args-y to clean up objtool arguments
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 6, 2022 at 11:50 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Based on Linus' patch. Refactor scripts/Makefile.vmlinux_o as well.
>
> Link: https://lore.kernel.org/lkml/CAHk-=wgjTMQgiKzBZTmb=uWGDEQxDdyF1+qxBkODYciuNsmwnw@mail.gmail.com/
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - bug fix
>
>  scripts/Makefile.lib       | 31 ++++++++++++++++---------------
>  scripts/Makefile.vmlinux_o | 15 ++++-----------
>  2 files changed, 20 insertions(+), 26 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9bdc9ed37f49..3392721e1355 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -231,25 +231,26 @@ ifdef CONFIG_OBJTOOL
>
>  objtool := $(objtree)/tools/objtool/objtool
>
> -objtool_args =                                                         \
> -       $(if $(CONFIG_HAVE_JUMP_LABEL_HACK), --hacks=jump_label)        \
> -       $(if $(CONFIG_HAVE_NOINSTR_HACK), --hacks=noinstr)              \
> -       $(if $(CONFIG_X86_KERNEL_IBT), --ibt)                           \
> -       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)             \
> -       $(if $(CONFIG_UNWINDER_ORC), --orc)                             \
> -       $(if $(CONFIG_RETPOLINE), --retpoline)                          \
> -       $(if $(CONFIG_RETHUNK), --rethunk)                              \
> -       $(if $(CONFIG_SLS), --sls)                                      \
> -       $(if $(CONFIG_STACK_VALIDATION), --stackval)                    \
> -       $(if $(CONFIG_HAVE_STATIC_CALL_INLINE), --static-call)          \
> -       $(if $(CONFIG_HAVE_UACCESS_VALIDATION), --uaccess)              \
> +objtool-args-$(CONFIG_HAVE_JUMP_LABEL_HACK)            += --hacks=jump_label
> +objtool-args-$(CONFIG_HAVE_NOINSTR_HACK)               += --hacks=noinstr
> +objtool-args-$(CONFIG_X86_KERNEL_IBT)                  += --ibt
> +objtool-args-$(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL)       += --mcount
> +objtool-args-$(CONFIG_UNWINDER_ORC)                    += --orc
> +objtool-args-$(CONFIG_RETPOLINE)                       += --retpoline
> +objtool-args-$(CONFIG_RETHUNK)                         += --rethunk
> +objtool-args-$(CONFIG_SLS)                             += --sls
> +objtool-args-$(CONFIG_STACK_VALIDATION)                        += --stackval
> +objtool-args-$(CONFIG_HAVE_STATIC_CALL_INLINE)         += --static-call
> +objtool-args-$(CONFIG_HAVE_UACCESS_VALIDATION)         += --uaccess
> +objtool-args-$(CONFIG_GCOV_KERNEL)                     += --no-unreachable
> +
> +objtool-args = $(objtool-args-y)                                       \
>         $(if $(delay-objtool), --link)                                  \
> -       $(if $(part-of-module), --module)                               \
> -       $(if $(CONFIG_GCOV_KERNEL), --no-unreachable)
> +       $(if $(part-of-module), --module)
>
>  delay-objtool := $(or $(CONFIG_LTO_CLANG),$(CONFIG_X86_KERNEL_IBT))
>
> -cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
> +cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool-args) $@)
>  cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
>
>  endif # CONFIG_OBJTOOL
> diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
> index 81a4e0484457..68c22879bade 100644
> --- a/scripts/Makefile.vmlinux_o
> +++ b/scripts/Makefile.vmlinux_o
> @@ -35,18 +35,11 @@ endif
>
>  objtool-enabled := $(or $(delay-objtool),$(CONFIG_NOINSTR_VALIDATION))
>
> -# Reuse objtool_args defined in scripts/Makefile.lib if LTO or IBT is enabled.
> -#
> -# Add some more flags as needed.
> -# --no-unreachable and --link might be added twice, but it is fine.
> -#
> -# Expand objtool_args to a simple variable to avoid circular reference.
> +vmlinux-objtool-args-$(delay-objtool)                  += $(objtool-args-y)
> +vmlinux-objtool-args-$(CONFIG_GCOV_KERNEL)             += --no-unreachable
> +vmlinux-objtool-args-$(CONFIG_NOINSTR_VALIDATION)      += --noinstr $(if $(CONFIG_CPU_UNRET_ENTRY), --unret)
>
> -objtool_args := \
> -       $(if $(delay-objtool),$(objtool_args)) \
> -       $(if $(CONFIG_NOINSTR_VALIDATION), --noinstr $(if $(CONFIG_CPU_UNRET_ENTRY), --unret)) \
> -       $(if $(CONFIG_GCOV_KERNEL), --no-unreachable) \
> -       --link
> +objtool-args = $(vmlinux-objtool-args-y) --link
>
>  # Link of vmlinux.o used for section mismatch analysis
>  # ---------------------------------------------------------------------------
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
