Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5502CE4DF
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 02:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730013AbgLDBTa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 20:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbgLDBTa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 20:19:30 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27426C061A51
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 17:18:50 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id v1so2129437pjr.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 17:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yQuebzesxwMf25Xr/dPzPPrev+UQ6caZgGfIyyfOgUQ=;
        b=AdkoRN88dIF1YoC+j+aM1MY8e4XAHgHr6Qm5ePGGxeJct5eWZOVDW4q1D9C3LLa8zH
         RxD3jXqbRv5xVOt4NKZl2X85VY5mDaNFE137cL5vRPDT2YIwl3XP02aPJnOzuMiEfFCJ
         O2TNDBVmha6FCUh+WQdrQlptKhjeZpCVpH73ZXoybiTe/PlYuwNJCwp2VrH53850FJH2
         515PbH93kp5tcNbwWioEzPCr6SkI3K2AM3MZJNXulV6TKLA75OeqUeP/IdZHXyGpg2cN
         mECH8bNGs2Ccbo/RE7qyO/wLu3aIg5949CJ/5j5iRyVF3VvBW8JViOTw7u21du6GrAF3
         +3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yQuebzesxwMf25Xr/dPzPPrev+UQ6caZgGfIyyfOgUQ=;
        b=MUkaO/srvvfxGhhC3tapR8ChOxFdcM8KpwkYx6QpikH9MYo56RVWkirmcculoQz3vH
         hzLa8EKpoy5Ms2E1hRKcm4YO+WyE5ZDFedo2W0AMFnfom87XOOPVD/Na6G4P+J7fEWFX
         wrv6Xh9lxFEfrj9z6emx6GX5KRKsTThvPRX3aGM+fbtpghF3q+R7sE7OnrD2IHehaUp0
         JmOi6gvo0TKNoemh5OsaJlnsnE58fZwp0dMt90tRs4BFI8D1LH+EkkhNcqJXKjlawwat
         guOCDH5HoEAZjUg+H2Z+KUosJagBlAfUijwzCBn16JLOK5eW0PdM/RXSLu/VyM6q4k6S
         0xIw==
X-Gm-Message-State: AOAM532Y+qOukn2KHTkIXjJdxKkXvR0N4DqXZkvIAjXYITzFAnr2M1QT
        k48rd4wO6GlfF4qKqNlbjAv+2+nQcEU9sxVyxhNPew==
X-Google-Smtp-Source: ABdhPJxAPcbI+OagIFgVil1xtoTesXiqZ4HHblGMTwSpODVAZ4Hx3JK5B4cAfBjOSJNFeeL+sVqWNXjR9yrFBsLuFe8=
X-Received: by 2002:a17:90a:6fa1:: with SMTP id e30mr1854582pjk.32.1607044729507;
 Thu, 03 Dec 2020 17:18:49 -0800 (PST)
MIME-Version: 1.0
References: <20201204011129.2493105-1-ndesaulniers@google.com>
In-Reply-To: <20201204011129.2493105-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 3 Dec 2020 17:18:37 -0800
Message-ID: <CAKwvOdnmhguTTt7_xJJXH=m+JwEaZK1=hFhso3FF1Co+u8wkhw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] Kbuild: make DWARF version a choice
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Clifton <nickc@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(minus Chengbin due to bounces)

On Thu, Dec 3, 2020 at 5:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice. Adds an
> explicit CONFIG_DEBUG_INFO_DWARF2, which is the default. Does so in a
> way that's forward compatible with existing configs, and makes adding
> future versions more straightforward.
>
> Suggested-by: Fangrui Song <maskray@google.com>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile          | 14 ++++++++------
>  lib/Kconfig.debug | 21 ++++++++++++++++-----
>  2 files changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a2ded5029084..2430e1ee7c44 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -826,12 +826,14 @@ else
>  DEBUG_CFLAGS   += -g
>  endif
>
> -ifneq ($(LLVM_IAS),1)
> -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> -endif
> -
> -ifdef CONFIG_DEBUG_INFO_DWARF4
> -DEBUG_CFLAGS   += -gdwarf-4
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> +DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> +ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
> +# Binutils 2.35+ required for -gdwarf-4+ support.
> +dwarf-aflag    := $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y))
> +DEBUG_CFLAGS   += $(dwarf-aflag)
> +KBUILD_AFLAGS  += $(dwarf-aflag)
>  endif
>
>  ifdef CONFIG_DEBUG_INFO_REDUCED
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 0c7380e36370..04719294a7a3 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -256,14 +256,25 @@ config DEBUG_INFO_SPLIT
>           to know about the .dwo files and include them.
>           Incompatible with older versions of ccache.
>
> +choice
> +       prompt "DWARF version"
> +       help
> +         Which version of DWARF debug info to emit.
> +
> +config DEBUG_INFO_DWARF2
> +       bool "Generate DWARF Version 2 debuginfo"
> +       help
> +         Generate DWARF v2 debug info.
> +
>  config DEBUG_INFO_DWARF4
> -       bool "Generate dwarf4 debuginfo"
> +       bool "Generate DWARF Version 4 debuginfo"
>         depends on $(cc-option,-gdwarf-4)
>         help
> -         Generate dwarf4 debug info. This requires recent versions
> -         of gcc and gdb. It makes the debug information larger.
> -         But it significantly improves the success of resolving
> -         variables in gdb on optimized code.
> +         Generate DWARF v4 debug info. This requires gcc 4.5+ and gdb 7.0+.
> +         It makes the debug information larger, but it significantly
> +         improves the success of resolving variables in gdb on optimized code.

^ I kept the previous help text, but while this may have been the case
when DWARF v4 support was first introduced in GCC, by my (lone)
measure of x86_64 defconfig with gcc 10.2, this doesn't or no longer
seems to be the case. See patch 2 for measurements:
https://lore.kernel.org/lkml/20201204011129.2493105-2-ndesaulniers@google.com/.
(also, missed the cover letter, here it is:
https://lore.kernel.org/lkml/CAKwvOdkZEiHK01OD420USb0j=F0LcrnRbauv9Yw26tu-GRbYkg@mail.gmail.com/)

> +
> +endchoice # "DWARF version"
>
>  config DEBUG_INFO_BTF
>         bool "Generate BTF typeinfo"
> --
> 2.29.2.576.ga3fc446d84-goog
>


-- 
Thanks,
~Nick Desaulniers
