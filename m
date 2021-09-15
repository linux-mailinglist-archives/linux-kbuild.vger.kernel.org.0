Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F336C40C333
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Sep 2021 12:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237143AbhIOKDB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Sep 2021 06:03:01 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27986 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbhIOKDA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Sep 2021 06:03:00 -0400
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 18FA1SSg012501;
        Wed, 15 Sep 2021 19:01:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 18FA1SSg012501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631700088;
        bh=wp9HdqRiV5c4MgPEn1AmkZJuSoNc1KqDtu2wyZund3I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CiTfzkGDxBFjrgjd/TYw1evotQSFwFxDfqE88vcjMZm9z75WjrSEv/VsYx5KiX1B7
         hZ0YwdQ2xHFHjNTbQHBcg+fKeWpUL3Wjuq7bwilVBI/Uw5W8z42XvWUQJfxuiuB32Q
         a6hxouxgPoxrCVPt8PUWyBS7xjTBSMbAPQLQ+puTx7QW5l8+q6x9EncJWHIsVSvwuT
         pFf7Sl5xOARbD3rS+HqGhYjxpbdAtDhGfGr9viBj7HnML30U9vOs7OYpnE9seyzaAq
         M1hg4sgfUdvktZrDR6wAPHzPrThCw7qzRrs8Tib0sfo8GLP96ahh47lWmp9Wbd8sQ7
         E0fBcofGZdiHQ==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id bg1so1271434plb.13;
        Wed, 15 Sep 2021 03:01:28 -0700 (PDT)
X-Gm-Message-State: AOAM531R0XXKztICRFbJB+248gxVcNFultOPNKziNq7B0BaM5rnYYghv
        17gGvGDaC2b1T1Qu/oey3Df7Qf/4lZmq+UvudDM=
X-Google-Smtp-Source: ABdhPJxhpv67mIZuzKiMEp2IM4AmOq1JSne7wJlif1rNVg0xcjvnFKIuUeIil66XMCDuzReptcGHVLnyj2nqVo5nHaE=
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr7549265pju.144.1631700087759;
 Wed, 15 Sep 2021 03:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <1631697827-96324-1-git-send-email-ashimida@linux.alibaba.com>
In-Reply-To: <1631697827-96324-1-git-send-email-ashimida@linux.alibaba.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 15 Sep 2021 19:00:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqqSRSnDmsNnbPdp5_gmAvSWTShWJaqWaE362n64yh3A@mail.gmail.com>
Message-ID: <CAK7LNATqqSRSnDmsNnbPdp5_gmAvSWTShWJaqWaE362n64yh3A@mail.gmail.com>
Subject: Re: [PATCH] [RFC] Add additional include path for gcc plugins
To:     Dan Li <ashimida@linux.alibaba.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 15, 2021 at 6:23 PM Dan Li <ashimida@linux.alibaba.com> wrote:
>
> When kernel enables gcc plugin, some header files are missing in some
> tool chains (as in the following example)
>
> These header files can be found in other toolchains, and sometimes
> the md5hash of these files are same(in most versions).
>
> Should we add a parameter to plugin to allow users to import their own
> header file directories?
>
> ---
>   HOSTCXX scripts/gcc-plugins/stackleak_plugin.so
> In file included from scripts/gcc-plugins/gcc-common.h:103:0,
>                  from scripts/gcc-plugins/stackleak_plugin.c:30:
> /workspace/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/../
> lib/gcc/aarch64-none-linux-gnu/9.2.1/plugin/include/builtins.h:23:17:
>  fatal error: mpc.h: No such file or directory
>  #include <mpc.h>


gcc-plugins are compiled by the host compiler (usually g++).
Kbuild already provides 'HOSTCXXFLAGS'
to pass-in additional flags to it.

But, if you need to tweak include paths, you are already screwed up, maybe.

Some time ago, I got a question about plugin builds failing due to missing gmp.h
but it was solvable by installing a package.

https://lore.kernel.org/all/CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com/






> Signed-off-by: Dan Li <ashimida@linux.alibaba.com>
> ---
>  Makefile                     | 3 +++
>  scripts/gcc-plugins/Makefile | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 09bb314..e6134f3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1036,6 +1036,9 @@ include-$(CONFIG_UBSAN)           += scripts/Makefile.ubsan
>  include-$(CONFIG_KCOV)         += scripts/Makefile.kcov
>  include-$(CONFIG_GCC_PLUGINS)  += scripts/Makefile.gcc-plugins
>
> +GCC_PLUGINS_EXT_CFLAGS=
> +export GCC_PLUGINS_EXT_CFLAGS
> +
>  include $(addprefix $(srctree)/, $(include-y))
>
>  # scripts/Makefile.gcc-plugins is intentionally included last.
> diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
> index 1952d3b..0b3e27a 100644
> --- a/scripts/gcc-plugins/Makefile
> +++ b/scripts/gcc-plugins/Makefile
> @@ -23,7 +23,7 @@ GCC_PLUGINS_DIR = $(shell $(CC) -print-file-name=plugin)
>
>  plugin_cxxflags        = -Wp,-MMD,$(depfile) $(KBUILD_HOSTCXXFLAGS) -fPIC \
>                   -include $(srctree)/include/linux/compiler-version.h \
> -                  -I $(GCC_PLUGINS_DIR)/include -I $(obj) -std=gnu++11 \
> +                  -I $(GCC_PLUGINS_DIR)/include -I $(obj) $(GCC_PLUGINS_EXT_CFLAGS) -std=gnu++11 \
>                    -fno-rtti -fno-exceptions -fasynchronous-unwind-tables \
>                    -ggdb -Wno-narrowing -Wno-unused-variable \
>                    -Wno-format-diag
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
