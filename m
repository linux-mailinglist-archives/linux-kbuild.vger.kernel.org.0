Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD32E3C7C03
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 04:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237703AbhGNCuP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jul 2021 22:50:15 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:43013 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237711AbhGNCuP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jul 2021 22:50:15 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 16E2kpEp022366;
        Wed, 14 Jul 2021 11:47:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 16E2kpEp022366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626230823;
        bh=LnUl50BHavFxu7eFMFZuwtQbwZaQ3SxkzsrU6pPoM7I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Psy593hpyuA7XOSRMzLMTnIeUC25fyGRxvJibNDgsQjrqHZnaNDKKrN20sKNAZkes
         r5scIcpH+sssgVPnbqdapUVPjk1bXKq21cEVedya811OPMq6RU4+GTssyJbmLtH1+k
         VhA8McCMD4e6sdjhXW2yiQ8LRtKmnB46TxqoEDwQxIvRgwa6nGzb1GKegIjvrgWwUw
         MTPNHDmOVAtJHcxTJLnaHl6rnKeff9/4oRTCsXg4xy6WZe3+ILQ9RWUF3LL8fEgXbQ
         Hnutfpn4CiOeDBxtUxIO2spRVzu9S42+cTE215XZwoMfJjtpSTZq2PzoD32oTykbr0
         GMqE8rFGKo96A==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id v14so717196plg.9;
        Tue, 13 Jul 2021 19:47:02 -0700 (PDT)
X-Gm-Message-State: AOAM533fEbf4QTfEhx+yg1q5rEcScgs1lFGQG39UWVA50ZmZxlNxipwF
        VPZF/n+RHCF9587igrUxIc9ArvMxN4iWDs2hzV0=
X-Google-Smtp-Source: ABdhPJwwKKjEscz68JVWRgG4ZYpXN5JKyz17jntsgNjmA2/okmM6afoXWFQVE2RdaNpdPicvxh19YzCCS35gVawEM2Y=
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr1447795pjt.198.1626230811130;
 Tue, 13 Jul 2021 19:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <a6eea2c4-6d90-3ddf-33d6-973d1ae917e7@mailbox.org>
In-Reply-To: <a6eea2c4-6d90-3ddf-33d6-973d1ae917e7@mailbox.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 14 Jul 2021 11:46:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT9oMkSthmCJ9sq3PFRcYgZoC6O0o==WQnKOU0znzT6hQ@mail.gmail.com>
Message-ID: <CAK7LNAT9oMkSthmCJ9sq3PFRcYgZoC6O0o==WQnKOU0znzT6hQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Kbuild, clang: add option for choosing a ThinLTO
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

On Wed, Jul 14, 2021 at 1:41 AM Tor Vic <torvic9@mailbox.org> wrote:
>
> On some distros and configurations, it might be useful to allow for
> specifying a directory where Clang stores its ThinLTO cache.
>
> More specifically, when building the VirtualBox extramodules on Arch with
> its proper 'makepkg' build system and DKMS, against an already installed
> ThinLTO kernel, the build fails because it tries to create the ThinLTO
> cache in a directory that is not user-writable.


Again, I do not understand.

Is this fixing the root cause?

To me, it looks like
"Anyway, this worked for me" patch.

Besides, 'make clean' will never clean up the
cache directory.





> A similar problem has been reported with openSUSE's OBS build system.
>
> Add a Kconfig option that allows users to choose a directory in which
> Clang's ThinLTO can store its cache.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1104
> Signed-off-by: Tor Vic <torvic9@mailbox.org>
> ---
> Changes from v1 to v2: remove unneeded changes in scripts/Makefile
>
>  Makefile     |  5 +++--
>  arch/Kconfig | 10 ++++++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
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
> --
> 2.32.0
>


-- 
Best Regards
Masahiro Yamada
