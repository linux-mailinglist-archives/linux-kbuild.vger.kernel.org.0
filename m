Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8E33C6ED4
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jul 2021 12:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235733AbhGMKtF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jul 2021 06:49:05 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45777 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235669AbhGMKtF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jul 2021 06:49:05 -0400
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 16DAjwGT028532;
        Tue, 13 Jul 2021 19:45:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 16DAjwGT028532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626173159;
        bh=+svtoajNYpBbeswP8VRHWjbPN7Mwn71IcUxSdOvYYRw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WIxeqi7ujMMMDlMLSvXa+6y4daMI4auS5+S99bpyyz72Uw++5f1rgsLgyLeP/074p
         v2mgGrU8wCICRjVtmB/ZUW0WMzrKHXDTdIpRAS30MCIu/goV9PffhIXxUupgBHsZf8
         c8q+qBmOEQOQZZcTfs9nNnZBlTRt2stqReHgFgwCoqXJQHrWLAKccA2ss2wZxq8VTS
         AuVtfdMZ8ASQCK/Fu/vsCpRShboIzlOMGJB3KgPOqGzn3TYTQxTKIFtpLNYR1uxGWY
         J5n8vRkk5lw2luZkjG1r1iEV/ulfwWrW5beBVvfXkYpI32/KMXnAISLt/a034Ktxmi
         5K/zsBFPdI/5Q==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id v7so21256369pgl.2;
        Tue, 13 Jul 2021 03:45:58 -0700 (PDT)
X-Gm-Message-State: AOAM533+NezI5HYEYRZayyxtQ6UIyYJfVcAKwcAWe05qOSaOzeaSTZoT
        6vVv6cJ8iObJ7U/BokchfJw7cuHyfxo+DwSENKs=
X-Google-Smtp-Source: ABdhPJzT8YYPsrA/tRV2GsNJszdAtIewLzHvqbB0CLRXbYuiXtV87DWVQ2kMZYdodA6VATLGTrN0/wmcLBbkMY9dqAc=
X-Received: by 2002:a62:1d84:0:b029:304:5af1:65f6 with SMTP id
 d126-20020a621d840000b02903045af165f6mr3832354pfd.80.1626173157865; Tue, 13
 Jul 2021 03:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <b45b2430-3670-b310-b6ad-2d6db50c2d18@mailbox.org>
In-Reply-To: <b45b2430-3670-b310-b6ad-2d6db50c2d18@mailbox.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 13 Jul 2021 19:45:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3bAg164L7mWDk0sfsvxZvMukezSSu1BYu3M425SWeaQ@mail.gmail.com>
Message-ID: <CAK7LNAT3bAg164L7mWDk0sfsvxZvMukezSSu1BYu3M425SWeaQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Kbuild, clang: add option for choosing a ThinLTO
 cache directory
To:     Tor Vic <torvic9@mailbox.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 12, 2021 at 8:10 PM Tor Vic <torvic9@mailbox.org> wrote:
>
> On some distros and configurations, it might be useful to allow for
> specifying a directory where Clang stores its ThinLTO cache.
>
> More specifically, when building the VirtualBox extramodules on Arch with
> its proper 'makepkg' build system and DKMS, against an already installed
> ThinLTO kernel, the build fails because it tries to create the ThinLTO
> cache in a directory that is not user-writable.
>
> A similar problem has been reported with openSUSE's OBS build system.
>
> Add a Kconfig option that allows users to choose a directory in which
> Clang's ThinLTO can store its cache.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1104
> Signed-off-by: Tor Vic <torvic9@mailbox.org>


I do not understand.

Currently, .thinlto-cache is created in the same directory
as the other objects.  (right under $(KBUILD_EXTMOD))

If you build in a read-only directory, you cannot put
any build artifact (not limited to the thinlto cache) there.

Why did changing the location of .thinlto-cache
solve your problem?



> ---
>  Makefile                  |  5 +++--
>  arch/Kconfig              | 10 ++++++++++
>  scripts/Makefile.lib      |  4 ++++
>  scripts/Makefile.modfinal |  4 ++++
>  4 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c3f9bd191b89..472bc8bfff03 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -932,7 +932,8 @@ endif
>  ifdef CONFIG_LTO_CLANG
>  ifdef CONFIG_LTO_CLANG_THIN
>  CC_FLAGS_LTO   := -flto=thin -fsplit-lto-unit
> -KBUILD_LDFLAGS += --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
> +export thinlto-dir = $(if
> $(CONFIG_LTO_CLANG_THIN_CACHEDIR),$(CONFIG_LTO_CLANG_THIN_CACHEDIR)/)
> +KBUILD_LDFLAGS +=
> --thinlto-cache-dir=$(thinlto-dir)$(extmod_prefix).thinlto-cache
>  else
>  CC_FLAGS_LTO   := -flto
>  endif
> @@ -1728,7 +1729,7 @@ PHONY += compile_commands.json
>
>  clean-dirs := $(KBUILD_EXTMOD)
>  clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
> $(KBUILD_EXTMOD)/modules.nsdeps \
> -       $(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
> +       $(KBUILD_EXTMOD)/compile_commands.json
> $(thinlto-dir)$(KBUILD_EXTMOD)/.thinlto-cache
>
>  PHONY += help
>  help:
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 129df498a8e1..19e4d140e12a 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -696,6 +696,16 @@ config LTO_CLANG_THIN
>             https://clang.llvm.org/docs/ThinLTO.html
>
>           If unsure, say Y.
> +
> +config LTO_CLANG_THIN_CACHEDIR
> +       string "Clang ThinLTO cache directory"
> +       depends on LTO_CLANG_THIN
> +       default ""
> +       help
> +         This option allows users to choose a directory that stores
> +         Clang's ThinLTO cache.
> +         Leave empty for default.
> +
>  endchoice
>
>  config ARCH_SUPPORTS_CFI_CLANG
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 10950559b223..bca87a6aa35b 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -197,6 +197,10 @@ endif
>  part-of-module = $(if $(filter $(basename $@).o, $(real-obj-m)),y)
>  quiet_modtag = $(if $(part-of-module),[M],   )
>
> +ifdef CONFIG_LTO_CLANG_THIN
> +KBUILD_LDFLAGS +=
> --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> +endif
> +
>  modkern_cflags =                                          \
>         $(if $(part-of-module),                           \
>                 $(KBUILD_CFLAGS_MODULE) $(CFLAGS_MODULE), \
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 5e9b8057fb24..ab0d72e21318 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -35,6 +35,10 @@ ifdef CONFIG_LTO_CLANG
>  # avoid a second slow LTO link
>  prelink-ext := .lto
>
> +ifdef CONFIG_LTO_CLANG_THIN
> +KBUILD_LDFLAGS +=
> --thinlto-cache-dir=$(thinlto-dir)$(extmod-prefix).thinlto-cache
> +endif # CONFIG_LTO_CLANG_THIN
> +
>  # ELF processing was skipped earlier because we didn't have native code,
>  # so let's now process the prelinked binary before we link the module.
>
> --
> 2.32.0



-- 
Best Regards
Masahiro Yamada
