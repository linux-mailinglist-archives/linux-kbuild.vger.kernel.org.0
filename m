Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F8730306E
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 00:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732584AbhAYVSr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 16:18:47 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64935 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732444AbhAYVR5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 16:17:57 -0500
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10PLGee1021843;
        Tue, 26 Jan 2021 06:16:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10PLGee1021843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611609401;
        bh=UBtSR4SngVZcF8xuMqiB6wAgmObrFSnj0hR3SZnjGx0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fW3IypG7DU0Sy2lJtuivc8NXYOkwYgV1o24luqg5jMlQ7htBZVHMwK1Bg+83r1pZX
         XU1ojvBCOeiW6XLA8AUFPtvMILO1Zzy/w4jaYAuqh0sQD0bXQiXUArRl2jZ9uO0LA6
         GwwHRaBChHy2gH7+l+cqefFpB3/kTTJbcTNwH/Hqpqo9d4m7fIRGGTap/fcXErVJoh
         BKbTy/7Y8ztwNzH/aS0NLbVjcih88Gzwqxp+kl5XjU0MhCJj8olKks2xBqphOQRrlG
         d8gJFMz7qLN396NBHwtMwuLwHjtVVbHN5bN6dv0gYLyG2Ih/kA4lB0VLlOb+IYvH4T
         pjafarslnPZdQ==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id l18so425615pji.3;
        Mon, 25 Jan 2021 13:16:40 -0800 (PST)
X-Gm-Message-State: AOAM531aIFflY0j4930lDxf+sxYAFpQIbvXlkL+p40BNs4wq6xLkpvgM
        fA64PJiXkMvCQ9xOdDD2hStH4Z9dsDKGR6KFxFE=
X-Google-Smtp-Source: ABdhPJwDImYxkIOjCoi/rm0VtnjdA+o6S7kwL7EOOzfsdixXundNyzEhU5nkidT+65Dzvl7m9J+3VoyUG6AYLNoHq1U=
X-Received: by 2002:a17:90a:5403:: with SMTP id z3mr2231069pjh.198.1611609399736;
 Mon, 25 Jan 2021 13:16:39 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
In-Reply-To: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 Jan 2021 06:16:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
Message-ID: <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 5:42 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> When building out-of-tree kernel modules, the build system doesn't
> require the GCC version to match the version used to build the original
> kernel.  That's probably [1] fine.
>
> In fact, for many distros, the version of GCC used to build the latest
> kernel doesn't necessarily match the latest released GCC, so a GCC
> mismatch turns out to be pretty common.  And with CONFIG_MODVERSIONS
> it's probably more common.
>
> So a lot of users have come to rely on being able to use a different
> version of GCC when building OOT modules.
>
> But with GCC plugins enabled, that's no longer allowed:
>
>   cc1: error: incompatible gcc/plugin versions
>   cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so
>
> That error comes from the plugin's call to
> plugin_default_version_check(), which strictly enforces the GCC version.
> The strict check makes sense, because there's nothing to prevent the GCC
> plugin ABI from changing -- and it often does.
>
> But failing the build isn't necessary.  For most plugins, OOT modules
> will otherwise work just fine without the plugin instrumentation.
>
> When a GCC version mismatch is detected, print a warning and disable the
> plugin.  The only exception is the RANDSTRUCT plugin which needs all
> code to see the same struct layouts.  In that case print an error.
>
> [1] Ignoring, for the moment, that the kernel now has
>     toolchain-dependent kconfig options, which can silently disable
>     features and cause havoc when compiler versions differ, or even when
>     certain libraries are missing.  This is a separate problem which
>     also needs to be addressed.
>
> Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
> ---


We are based on the assumption that we use the same
compiler for in-tree and out-of-tree.

If people use a different compiler, they must be
prepared for any possible problem.


Using different compiler flags for in-tree and out-of-tree
is even more dangerous.

For example, CONFIG_GCC_PLUGIN_RANDSTRUCT is enabled
for in-tree build, and then disabled for out-of-tree modules,
the struct layout will mismatch, won't it?


This patch is ugly, and not doing the right thing.




>  scripts/Makefile.gcc-plugins | 19 +++++++++++++++++++
>  scripts/Makefile.kcov        | 11 +++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 952e46876329..7227692fba59 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -51,6 +51,25 @@ export DISABLE_ARM_SSP_PER_TASK_PLUGIN
>  GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
>  # The sancov_plugin.so is included via CFLAGS_KCOV, so it is removed here.
>  GCC_PLUGINS_CFLAGS := $(filter-out %/sancov_plugin.so, $(GCC_PLUGINS_CFLAGS))
> +
> +# Out-of-tree module check: If there's a GCC version mismatch, disable plugins
> +# and print a warning.  Otherwise the OOT module build will fail due to
> +# plugin_default_version_check().
> +ifneq ($(GCC_PLUGINS_CFLAGS),)
> +    ifneq ($(KBUILD_EXTMOD),)
> +        ifneq ($(CONFIG_GCC_VERSION), $(shell $(srctree)/scripts/gcc-version.sh $(HOSTCXX)))
> +
> +            ifdef CONFIG_GCC_PLUGIN_RANDSTRUCT
> +                $(error error: CONFIG_GCC_PLUGIN_RANDSTRUCT requires out-of-tree modules to be built using the same GCC version as the kernel.)
> +            endif
> +
> +            $(warning warning: Disabling GCC plugins for out-of-tree modules due to GCC version mismatch.)
> +            $(warning warning: The following plugins have been disabled: $(gcc-plugin-y))
> +            GCC_PLUGINS_CFLAGS :=
> +       endif
> +    endif
> +endif
> +
>  export GCC_PLUGINS_CFLAGS
>
>  # Add the flags to the build!
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 67e8cfe3474b..63a2bc2aabb2 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -3,4 +3,15 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)    += -fsanitize-coverage=trace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   += -fsanitize-coverage=trace-cmp
>  kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)         += -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
>
> +# Out-of-tree module check for GCC version mismatch.
> +# See the similar check in scripts/Makefile.gcc-plugins
> +ifneq ($(CONFIG_GCC_PLUGIN_SANCOV),)
> +    ifneq ($(KBUILD_EXTMOD),)
> +        ifneq ($(CONFIG_GCC_VERSION), $(shell $(srctree)/scripts/gcc-version.sh $(HOSTCXX)))
> +            $(warning warning: Disabling CONFIG_GCC_PLUGIN_SANCOV for out-of-tree modules due to GCC version mismatch.)
> +            kcov-flags-y := $(filter-out %/sancov_plugin.so, $(kcov-flags-y))
> +        endif
> +    endif
> +endif
> +
>  export CFLAGS_KCOV := $(kcov-flags-y)
> --
> 2.29.2
>


-- 
Best Regards
Masahiro Yamada
