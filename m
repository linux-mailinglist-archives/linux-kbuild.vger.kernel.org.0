Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B083B326009
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Feb 2021 10:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBZJ2z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 04:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhBZJ0n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 04:26:43 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0632FC061786;
        Fri, 26 Feb 2021 01:26:03 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id i8so8970415iog.7;
        Fri, 26 Feb 2021 01:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=zYcif3lRZCjOeSRt7zkTKeI8391Ir8d0NUzmRV348z0=;
        b=twcv2ssX5+sRxdZfvIE1M+bQ0IbfkjNi3ONEQ99kfPvujoTJR9X8ddfa1SVgp66L/h
         /m1dv2HSBfPQHsyengbhHa5LPYhF70YP+bfWbYB4eRw/eLzhq3FcWeEGbkl9Nk2xyf+N
         OtEcI0Q+RUeIfK0mGHOBa8vvPFX/ju5dOuxyu9gUpUvPErI8XVzP4FkPcJ+MobVRII/u
         EnIXXYASOk7jftra63GLw5zEu4nZMBtoOd012RnG1Fd4OKO67LJmX3KA6fToU7SOLV5N
         I+AuP+veX8CsRe9p67yPuMkda+ZH1r6uSB5DadYHgBI0XgPpffYEXCXVTvgqwmNGlJQl
         KoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=zYcif3lRZCjOeSRt7zkTKeI8391Ir8d0NUzmRV348z0=;
        b=awvxTSyxERqzTsPTU+q6PSnp/MYSogYNShx1NINFvS13Q3pwJNSvn9mlnQc+5rm3vj
         1QAC3nEPGCZ75IUAsCkp4TLkKvgvWoBas8O41/kFJMP61YfDAVZtq7wtU/G6e+F5uEP3
         q9KD7980tzuNH4lJQwHMTD4zvtMzqgbS5+Qk8FyUXCo6CBcBbOEA+nh8zdWr6syQFAut
         Ek/XWFXEvUUU0YEcy/5QCSDN8ueCOqiMJkmVDx3JPWiyBrjcVuLbpHu3Twn2Kwk7Jyjq
         Cj79CEV0Xw39tlad2p5KHAsqdT/hcHiI0rei8sH27nT14WhOTpxFZu8z391QVXW7+/rV
         p4pg==
X-Gm-Message-State: AOAM530zDbhCUQm8nS9VX237ZTpISv72OHpjUUZew/34B/1Cjdw7sHn5
        V5PiQoA6w/7k1h+ZCl0Uxspf9SZ9/4Sy1/cLC1Y=
X-Google-Smtp-Source: ABdhPJxNbxj+HPg7Yb1IrdcdC1w/Z415O+2wl60kM+t2T5pBIdzcnFXh+bCAcGzgTvw00O0FPiWQDjPF/qqIzkICW6E=
X-Received: by 2002:a5e:c10b:: with SMTP id v11mr2059128iol.75.1614331562170;
 Fri, 26 Feb 2021 01:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20210226062548.3334081-1-masahiroy@kernel.org>
In-Reply-To: <20210226062548.3334081-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 26 Feb 2021 10:25:50 +0100
Message-ID: <CA+icZUXYLVjs-hXEu_5Vy=TdNvOHhyiXe=hc-jc7SAU04Dtstw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: fix UNUSED_KSYMS_WHITELIST for Clang LTO
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 26, 2021 at 7:26 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
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
> Changes in v2:
>   - Rebase on top of Arnd's patch:
>     https://lore.kernel.org/lkml/20210225143456.3829513-1-arnd@kernel.org/
>
>  init/Kconfig                    |  1 -
>  scripts/gen_autoksyms.sh        | 35 ++++++++++++++++++++++++---------
>  scripts/lto-used-symbollist.txt |  6 ------

People who want to use their own "white-listed" (allow-listed)
symbollist-file can do that via
CONFIG_UNUSED_KSYMS_WHITELIST="my/own/white/list".
Correct?

Why do you delete the default "scripts/lto-used-symbollist.txt" file
and remove the default in the appropriate Kconfig for people who want
to enable Clang-(Thin)LTO?
These people should now use
CONFIG_UNUSED_KSYMS_WHITELIST="scripts/lto-used-symbollist.txt"?
But again - the file was deleted with your patch.
Do I miss something?

- Sedat -

>  3 files changed, 26 insertions(+), 16 deletions(-)
>  delete mode 100644 scripts/lto-used-symbollist.txt
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 719871f8727c..64c32300d1b4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2283,7 +2283,6 @@ config TRIM_UNUSED_KSYMS
>  config UNUSED_KSYMS_WHITELIST
>         string "Whitelist of symbols to keep in ksymtab"
>         depends on TRIM_UNUSED_KSYMS
> -       default "scripts/lto-used-symbollist.txt" if LTO_CLANG
>         help
>           By default, all unused exported symbols will be un-exported from the
>           build when TRIM_UNUSED_KSYMS is selected.
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index d54dfba15bf2..da320151e7c3 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -19,7 +19,26 @@ esac
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
> +       # ftrace
> +       needed_symbols="$needed_symbols _mcount"
> +       # stack protector symbols
> +       needed_symbols="$needed_symbols __stack_chk_fail __stack_chk_guard"
> +fi
> +
> +ksym_wl=
>  if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
>         # Use 'eval' to expand the whitelist path and check if it is relative
>         eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
> @@ -40,16 +59,14 @@ cat > "$output_file" << EOT
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
> index 406ada65e926..000000000000
> --- a/scripts/lto-used-symbollist.txt
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -memcpy
> -memmove
> -memset
> -_mcount
> -__stack_chk_fail
> -__stack_chk_guard
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210226062548.3334081-1-masahiroy%40kernel.org.
