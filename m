Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA193254B6
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Feb 2021 18:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229466AbhBYRqw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Feb 2021 12:46:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhBYRqu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Feb 2021 12:46:50 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3291BC06174A
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Feb 2021 09:46:11 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id g4so3335706vsb.11
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Feb 2021 09:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iZdQVu0YTjgvqWM6YV5GN6FZiLrUPo1sTuUcqvtmiDE=;
        b=Yl7XrfEW2Oji49LODi01o9FSSvX1xrX9nmypHSJUdSqC2NK/eS7S55RPjU1AGdqp6y
         ZNMHd8Uwzefgteu2i4yj2/YkfEW1+QoKQ5dE7uiyCDmcxo4VGAF32nnvtj/SHAXkbLKl
         rlgiro0gCBTamkfpitYRXRIUs4O/4/5V08G/KGYGoSPqBDQwQkzY7jgm39AbxJTwO+/2
         PEfuX6KZIQYFvNEEtFLvGTSH6AWkrXK6h06hGuoZoGxNaXypvczNPM25HPKKdfUn6PRs
         EO5j3jDQI+tsqdkxD3As4oOqr3SRZs52lgDIPTmzTfz+lO/KLcZDpQ+P0NgJXXzHk89P
         UFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iZdQVu0YTjgvqWM6YV5GN6FZiLrUPo1sTuUcqvtmiDE=;
        b=mEghibkFUjRhOqYiaZOrii6RKpdoLlTbWfhrlqAJ1DdZ6MbzUXtRnXuIZQP1M3D7sm
         KEulh8tFfKbvxd6yDkcOc/zgFAGpjcpav1n1Ua351n4Wen7f52YUNap6RoLpeyfZwmrI
         AmW5eGl/Kw1g7w5EtFzuf75x9MHs5RL72N+FsztWfATztIefSvTMucXR56/kqNFMlrAg
         +9Y8YO0kOHReCs9p7I0+YjYIq3fgXbY8a98AEgqD5O+hBvVyRx9IT2iWhoLsqvaz0lWE
         Hv5/JgMfm/HiU8X6mm1/aazm9aXtbhFC3AiPXVg7lqx5ciHC3n8XZBoLdV269bMujSTO
         MyIg==
X-Gm-Message-State: AOAM533bo8LSBGhVjU6kinskEOTqRRUaAftJh9GxM9qU5hTA6GFDXTtv
        tWQRru3MuwX98hYB+7kM84+jChJzrMhfscAEUaVjzg==
X-Google-Smtp-Source: ABdhPJwd6hMIAmoKxZSKz8FdWCcoFufcn1uWAoOht9xhyg7s548LRUcVB4PQ1EWppzTIGJi3PPVbFa1HgM9E6i75jQg=
X-Received: by 2002:a67:ed4a:: with SMTP id m10mr2621118vsp.14.1614275170095;
 Thu, 25 Feb 2021 09:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20210225160247.2959903-1-masahiroy@kernel.org> <20210225160247.2959903-2-masahiroy@kernel.org>
In-Reply-To: <20210225160247.2959903-2-masahiroy@kernel.org>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 25 Feb 2021 09:45:58 -0800
Message-ID: <CABCJKufovCMH9iyA9hFjq1Pt4VNWEPid+rqNWtTvYPTC19LfeA@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: fix UNUSED_KSYMS_WHITELIST for Clang LTO
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Thu, Feb 25, 2021 at 8:03 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> does not work as expected if the .config file has already specified
> CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list" before enabling
> CONFIG_LTO_CLANG.
>
> So, the user-supplied whitelist and LTO-specific white list must be
> independent of each other.
>
> I refactored the shell script so CONFIG_MODVERSIONS and CONFIG_CLANG_LTO
> handle whitelists in the same way.
>
> Fixes: fbe078d397b4 ("kbuild: lto: add a default list of used symbols")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  init/Kconfig                    |  1 -
>  scripts/gen_autoksyms.sh        | 33 ++++++++++++++++++++++++---------
>  scripts/lto-used-symbollist.txt |  5 -----
>  3 files changed, 24 insertions(+), 15 deletions(-)
>  delete mode 100644 scripts/lto-used-symbollist.txt

> +
> +ksym_wl=
>  if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
>         # Use 'eval' to expand the whitelist path and check if it is relative
>         eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
> @@ -40,16 +57,14 @@ cat > "$output_file" << EOT
>  EOT
>
>  [ -f modules.order ] && modlist=modules.order || modlist=/dev/null
> -sed 's/ko$/mod/' $modlist |
> -xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> -cat - "$ksym_wl" |
> +
> +{
> +       sed 's/ko$/mod/' $modlist | xargs -n1 sed -n -e '2p'
> +       echo "$needed_symbols"
> +       [ -n "$ksym_wl" ] && cat "$ksym_wl"
> +} | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
>  # Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
>  # point addresses.
>  sed -e 's/^\.//' |
>  sort -u |
>  sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
> -
> -# Special case for modversions (see modpost.c)
> -if [ -n "$CONFIG_MODVERSIONS" ]; then
> -       echo "#define __KSYM_module_layout 1" >> "$output_file"
> -fi
> diff --git a/scripts/lto-used-symbollist.txt b/scripts/lto-used-symbollist.txt
> deleted file mode 100644
> index 38e7bb9ebaae..000000000000
> --- a/scripts/lto-used-symbollist.txt
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -memcpy
> -memmove
> -memset
> -__stack_chk_fail
> -__stack_chk_guard
> --
> 2.27.0
>
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 0bf5b340b80e..351161326e3c 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2277,7 +2277,6 @@ config TRIM_UNUSED_KSYMS
>  config UNUSED_KSYMS_WHITELIST
>         string "Whitelist of symbols to keep in ksymtab"
>         depends on TRIM_UNUSED_KSYMS
> -       default "scripts/lto-used-symbollist.txt" if LTO_CLANG
>         help
>           By default, all unused exported symbols will be un-exported from the
>           build when TRIM_UNUSED_KSYMS is selected.
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index d54dfba15bf2..b74d5949fea6 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -19,7 +19,24 @@ esac
>  # We need access to CONFIG_ symbols
>  . include/config/auto.conf
>
> -ksym_wl=/dev/null
> +needed_symbols=
> +
> +# Special case for modversions (see modpost.c)
> +if [ -n "$CONFIG_MODVERSIONS" ]; then
> +       needed_symbols="$needed_symbols module_layout"
> +fi
> +
> +# With CONFIG_LTO_CLANG, LLVM bitcode has not yet been compiled into a binary
> +# when the .mod files are generated, which means they don't yet contain
> +# references to certain symbols that will be present in the final binaries.
> +if [ -n "$CONFIG_LTO_CLANG" ]; then
> +       # intrinsic functions
> +       needed_symbols="$needed_symbols memcpy memmove memset"
> +       # stack protector symbols
> +       needed_symbols="$needed_symbols __stack_chk_fail __stack_chk_guard"
> +fi

Thank you for the patch!

Arnd just reported that _mcount is also needed with some
configurations. Would you mind including that in the next version?

https://lore.kernel.org/r/20210225143456.3829513-1-arnd@kernel.org/

Sami
