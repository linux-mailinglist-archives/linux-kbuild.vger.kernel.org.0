Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F081A78912
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 12:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfG2KD3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 06:03:29 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:38228 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfG2KD3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 06:03:29 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x6TA3GJv016075;
        Mon, 29 Jul 2019 19:03:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6TA3GJv016075
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564394599;
        bh=PQ1lW8hCACRopxeIn1rb+/2MV5nijDnDrawKlmXu17I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XzIN/vRMjOijsDNhisvnc4aUdwKr/dcy46qdcN2Xiyz+SvX72V01JLM2nDDYioti7
         n9BvyWFahfhyoDgCpv3Xu7ODX91pQzULJb+isYtlqLfW/wdXWoMGXNvNyhBqEHW++e
         2DaxgolkZRklDFiXQcM+G2hBkqmHdsh92g0AmBPBaaIwIm37wt7F/oU/mkfufVA44K
         Co82KSVOCporsFryVQ0pO6nv6O8raiGEjGwkRMOFS8IzUceEDjveVUTXt2RhwKlY/v
         TOGvEhnPwvEIDMnmT8GmDLRAgdD7VcnKsPBDhzCabtiDEyidHjktzQ6lVjhBNlAJCr
         a1KGAmy1CbMUQ==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id 34so23728578uar.8;
        Mon, 29 Jul 2019 03:03:17 -0700 (PDT)
X-Gm-Message-State: APjAAAVZEoLu9uAC8heDqEQreFNKNP22ks5xbDr2c0LqSTQ5eq6NHrDx
        igZVXPe8RhvQA8av4MhrFFL0ybEPJzSOMs+SUjc=
X-Google-Smtp-Source: APXvYqw4vC3/3fwo2wuS7rX2cAwonROKMI6xSAnOW2aAWfuyPqZyUqLIZcZCYKk3ctXgRTAxR7LyhJ/GR0sqCnexC7M=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr38875070uao.25.1564394595901;
 Mon, 29 Jul 2019 03:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190725154730.80169-1-swboyd@chromium.org>
In-Reply-To: <20190725154730.80169-1-swboyd@chromium.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 19:02:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
Message-ID: <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Check for unknown options with cc-option usage
 in Kconfig and clang
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Smith <peter.smith@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Fri, Jul 26, 2019 at 12:47 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> If the particular version of clang a user has doesn't enable
> -Werror=unknown-warning-option by default, even though it is the
> default[1], then make sure to pass the option to the Kconfig cc-option
> command so that testing options from Kconfig files works properly.
> Otherwise, depending on the default values setup in the clang toolchain
> we will silently assume options such as -Wmaybe-uninitialized are
> supported by clang, when they really aren't.
>
> A compilation issue only started happening for me once commit
> 589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
> CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
> compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
> leads kbuild to try and test for the existence of the
> -Wmaybe-uninitialized flag with the cc-option command in
> scripts/Kconfig.include, and it doesn't see an error returned from the
> option test so it sets the config value to Y. Then the Makefile tries to
> pass the unknown option on the command line and
> -Werror=unknown-warning-option catches the invalid option and breaks the
> build. Before commit 589834b3a009 ("kbuild: Add
> -Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
> but any cc-option test of a warning option in Kconfig files silently
> evaluates to true, even if the warning option flag isn't supported on
> clang.
>
> Note: This doesn't change cc-option usages in Makefiles because those
> use a different rule that includes KBUILD_CFLAGS by default (see the
> __cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
> variable already has the -Werror=unknown-warning-option flag set. Thanks
> to Doug for pointing out the different rule.
>
> [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> Cc: Peter Smith <peter.smith@linaro.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Thanks for catching this.

I wonder if we could fix this issue
by one-liner, like this:


diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 8a5c4d645eb1..4bbf4fc163a2 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)

 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
-cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
+cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c
/dev/null -o /dev/null)

 # $(ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise



This propagates not only -Werror=unknown-warning-option
but also other clang flags to Kconfig.


Currently, we do not pass the target triplet to Kconfig.
This means, cc-option in Kconfig evaluates the given flags
against host-arch instead of target-arch.
The compiler flags are mostly independent of the architecture,
and this is not a big deal, I think.
But, maybe, would it make more sense to pass the other
basic clang flags as well?


To do this, the following is necessary as a prerequisite:
https://patchwork.kernel.org/patch/11063507/

Anyway, uninitialized CLANG_FLAGS is a bug, which must be
back-ported.


Thanks.








> Changes from v1:
>  * Reworded commit text a bit
>  * Added Reviewed-by tag
>
>  Makefile                | 5 +++++
>  scripts/Kconfig.include | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 9be5834073f8..28177674178a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,6 +517,8 @@ ifdef building_out_of_srctree
>         { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
>
> +KCONFIG_CC_OPTION_FLAGS := -Werror
> +
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    := --target=$(notdir $(CROSS_COMPILE:%-=%))
> @@ -531,11 +533,14 @@ ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
>  CLANG_FLAGS    += -no-integrated-as
>  endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
> +KCONFIG_CC_OPTION_FLAGS += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
>  endif
>
> +export KCONFIG_CC_OPTION_FLAGS
> +
>  # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
>  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
>  # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 8a5c4d645eb1..144e83e7cb81 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)
>
>  # $(cc-option,<flag>)
>  # Return y if the compiler supports <flag>, n otherwise
> -cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
> +cc-option = $(success,$(CC) $(KCONFIG_CC_OPTION_FLAGS) $(1) -E -x c /dev/null -o /dev/null)
>
>  # $(ld-option,<flag>)
>  # Return y if the linker supports <flag>, n otherwise
> --
> Sent by a computer through tubes
>


--
Best Regards
Masahiro Yamada
