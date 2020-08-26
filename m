Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F327252DAA
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 14:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729645AbgHZMEg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 08:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729639AbgHZMEf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 08:04:35 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A55FC061574;
        Wed, 26 Aug 2020 05:04:35 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id k2so1269333ots.4;
        Wed, 26 Aug 2020 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to;
        bh=H42To0Ot/qKyLOPGuE85SNu+0SkA0I/INYqpJsqvgsc=;
        b=KEM9ob7lUvneiK7C8F85XB+lZbIJwGILMyE3JLGHxlx1sCAJa6oAIGuo97jGgYrMpu
         uOz7VZ9lWJHk0WmusJF/jyOgZfwLebK4Dn/7KI/bfngOnt5+1vVvH86P6YxBI/wf/pEq
         RaTmElS8ZR8fq0NLAlG+7t9mTb+iEDuueyKU/EMJzs6gM2aUUHEuzWT+XjVq4RsRHZd8
         6mGwpJjBayNOQXmIJOGKIFTpgNzXyJn931wgpF8ihHS8xoScRUoZKeF1+CVOqqY3qZKB
         04YcZxto9VVki3wl79SnCLEBF2TV77DJX5Fidk160S5S+cwAw5DMgq9lWSPnF6nLtiY9
         NLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to;
        bh=H42To0Ot/qKyLOPGuE85SNu+0SkA0I/INYqpJsqvgsc=;
        b=oyas1xK7zPiFYaHqkN6xJu9x5ryFeEXBb4+ZMWOVUNhPW8be/BxDnoPmPQnCSSAnpR
         EnqJZmCEplJj1EUmp7bJTHPkg2sGzFbup3k3zSLZhSGaX7egG7jfNhwMaxsN45/9e1OG
         I+2k3e48JywJGMh+WbIXEIiuRdlOw6wXWskqd/54HMxgCdVXvSK+S+OcTMkl0COoC7Bw
         49rL0q7hPuPMMk0lp7kZUSsrO/a4eNqlQmfx0K14Q/DlmRwx1/gMbxh4F5Jnx0WwAbi9
         QL0vhIJaIyXY0CzO6jGG9qCFzB1/2pus7+C8OCslD5jxAiV1mzDPaDDhIRNhRHskwKmP
         BBeQ==
X-Gm-Message-State: AOAM533otXD8Vu+IfspZ7ZknWVy9qkq0Ey+aBKqygRZwQsJjSCay6lXT
        NiHq3hP284rXR8EZhvvUYb2DQRytJBVoiu8uKVY=
X-Google-Smtp-Source: ABdhPJzCuDvkPvtoeoC1Hv8vDbP0LNmo0Whoc6GAv6tXuG9z1c2BfKjQ1r7gofSPeldiPXEx9jfMo1Swv5mhZJioDzM=
X-Received: by 2002:a9d:7656:: with SMTP id o22mr9125655otl.109.1598443474719;
 Wed, 26 Aug 2020 05:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200816123248.97770-1-sedat.dilek@gmail.com>
In-Reply-To: <20200816123248.97770-1-sedat.dilek@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Aug 2020 14:04:22 +0200
Message-ID: <CA+icZUUnP5JQCzMG=pMQFwqQBHy78au6E0eJCod0YOARbHoLrw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Simplify DEBUG_INFO Kconfig handling
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just a friendly ping.

- Sedat -

On Sun, Aug 16, 2020 at 2:32 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> While playing with [1] I saw that the handling
> of CONFIG_DEBUG_INFO can be simplified.
>
> [1] https://patchwork.kernel.org/patch/11716107/
>
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> ---
>  Makefile          |  6 +++++-
>  lib/Kconfig.debug | 10 ++++------
>  2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 24a4c1b97bb0..f7af83393a49 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -810,13 +810,15 @@ endif
>  DEBUG_CFLAGS   := $(call cc-option, -fno-var-tracking-assignments)
>
>  ifdef CONFIG_DEBUG_INFO
> +
>  ifdef CONFIG_DEBUG_INFO_SPLIT
>  DEBUG_CFLAGS   += -gsplit-dwarf
>  else
>  DEBUG_CFLAGS   += -g
>  endif
> +
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> -endif
> +
>  ifdef CONFIG_DEBUG_INFO_DWARF4
>  DEBUG_CFLAGS   += -gdwarf-4
>  endif
> @@ -832,6 +834,8 @@ KBUILD_AFLAGS       += -gz=zlib
>  KBUILD_LDFLAGS += --compress-debug-sections=zlib
>  endif
>
> +endif # CONFIG_DEBUG_INFO
> +
>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
>  export DEBUG_CFLAGS
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9ad9210d70a1..19930c412b93 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -212,9 +212,10 @@ config DEBUG_INFO
>
>           If unsure, say N.
>
> +if DEBUG_INFO
> +
>  config DEBUG_INFO_REDUCED
>         bool "Reduce debugging information"
> -       depends on DEBUG_INFO
>         help
>           If you say Y here gcc is instructed to generate less debugging
>           information for structure types. This means that tools that
> @@ -227,7 +228,6 @@ config DEBUG_INFO_REDUCED
>
>  config DEBUG_INFO_COMPRESSED
>         bool "Compressed debugging information"
> -       depends on DEBUG_INFO
>         depends on $(cc-option,-gz=zlib)
>         depends on $(ld-option,--compress-debug-sections=zlib)
>         help
> @@ -243,7 +243,6 @@ config DEBUG_INFO_COMPRESSED
>
>  config DEBUG_INFO_SPLIT
>         bool "Produce split debuginfo in .dwo files"
> -       depends on DEBUG_INFO
>         depends on $(cc-option,-gsplit-dwarf)
>         help
>           Generate debug info into separate .dwo files. This significantly
> @@ -259,7 +258,6 @@ config DEBUG_INFO_SPLIT
>
>  config DEBUG_INFO_DWARF4
>         bool "Generate dwarf4 debuginfo"
> -       depends on DEBUG_INFO
>         depends on $(cc-option,-gdwarf-4)
>         help
>           Generate dwarf4 debug info. This requires recent versions
> @@ -269,7 +267,6 @@ config DEBUG_INFO_DWARF4
>
>  config DEBUG_INFO_BTF
>         bool "Generate BTF typeinfo"
> -       depends on DEBUG_INFO
>         depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
>         depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
>         help
> @@ -279,7 +276,6 @@ config DEBUG_INFO_BTF
>
>  config GDB_SCRIPTS
>         bool "Provide GDB scripts for kernel debugging"
> -       depends on DEBUG_INFO
>         help
>           This creates the required links to GDB helper scripts in the
>           build directory. If you load vmlinux into gdb, the helper
> @@ -288,6 +284,8 @@ config GDB_SCRIPTS
>           instance. See Documentation/dev-tools/gdb-kernel-debugging.rst
>           for further details.
>
> +endif # DEBUG_INFO
> +
>  config ENABLE_MUST_CHECK
>         bool "Enable __must_check logic"
>         default y
> --
> 2.28.0
>
