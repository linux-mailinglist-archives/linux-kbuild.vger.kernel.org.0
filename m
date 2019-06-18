Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED3CB4A4FD
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2019 17:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729247AbfFRPRH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Jun 2019 11:17:07 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29790 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729174AbfFRPRH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Jun 2019 11:17:07 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x5IFGimp017286;
        Wed, 19 Jun 2019 00:16:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x5IFGimp017286
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1560871005;
        bh=7AZO0VG0I7tsiq/Lkpzrlmlqoc3LKhdGlnJR85JzF2U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fPlmWY+vJnU74G2GAGxiBH/KwQfJkt3ZFNLCkAsByvOWspkNIzSefyJshXKUNR7wh
         pZMfOAcQ73LzkFCKvPgXzyWhuoBkFXVZUqJY5tZVz6snXDKEp9DVrz0VUGLsuzxdkL
         GQSTaRsH82QR+1K/sZsEDYg5etvKNIXTCmcONrmIrWzjoyZy1j2WVxIifpRhujTkey
         Y/bUCRVEv4z6RGz7XGo6g8zNf4alAzV6mMonczuSW20aDBcGEHffUa0pwRpFhp1LAH
         1yB69RMvPrbsP3VOBQ4i/ya9d06YoIR9h/yiSwoI0YD8s5DnQQ377oTtqCiE31B91d
         NcAnDlZ0xvWSA==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id f20so6369779ual.0;
        Tue, 18 Jun 2019 08:16:45 -0700 (PDT)
X-Gm-Message-State: APjAAAWu8Jva4mfhKHT+i41gaeamg/U/qnzZ5GbDToa5hsRoZGgeXwst
        03iYaDq20UC3b3HCpCHETNmobiPeEDq55nlsRdo=
X-Google-Smtp-Source: APXvYqwaO5vOJsCMQR5xHEwpoEIi1qipnKqSKubJ1d9ndQvCL7cFc6NUrpM6yUq3eaBiQ07vuLvcGJcUH5DdbQMOcXw=
X-Received: by 2002:a67:de99:: with SMTP id r25mr63949010vsk.215.1560871004108;
 Tue, 18 Jun 2019 08:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190606203003.112040-1-rrangel@chromium.org>
In-Reply-To: <20190606203003.112040-1-rrangel@chromium.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 19 Jun 2019 00:16:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASnG26_McrN8w3wHbzVU1+rHsKwY4Gu4xp7ff8wyCdu+g@mail.gmail.com>
Message-ID: <CAK7LNASnG26_McrN8w3wHbzVU1+rHsKwY4Gu4xp7ff8wyCdu+g@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Add option to generate a Compilation Database
To:     Raul E Rangel <rrangel@chromium.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        zwisler@chromium.org, Joe Lawrence <joe.lawrence@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Petr Mladek <pmladek@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 7, 2019 at 5:30 AM Raul E Rangel <rrangel@chromium.org> wrote:
>
> Clang tooling requires a compilation database to figure out the build
> options for each file. This enables tools like clang-tidy and
> clang-check.
>
> See https://clang.llvm.org/docs/HowToSetupToolingForLLVM.html for more
> information.
>
> Normally cmake is used to generate the compilation database, but the
> linux kernel uses make. Another option is using
> [BEAR](https://github.com/rizsotto/Bear) which instruments
> exec to find clang invocations and generate the database that way.
>
> Clang 4.0.0 added the -MJ option to generate the json for each
> compilation unit. https://reviews.llvm.org/D27140
>
> This patch takes advantage of the -MJ option. So it only works for
> Clang.
>
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> I have a couple TODOs in the code that I would like some feedback on.
> Specifically why extra-y doesn't seem to work in the root Makefile.
> Also, is there a way to add the correct list of prerequisites to the
> compile_commands.json target?
>
> Thanks,
> Raul
>
>
>  Makefile               | 20 ++++++++++++++++++++
>  lib/Kconfig.debug      |  7 +++++++
>  scripts/Makefile.build |  9 ++++++++-
>  3 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index a61a95b6b38f7..06067ee18ff64 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1663,6 +1663,26 @@ quiet_cmd_tags = GEN     $@
>  tags TAGS cscope gtags: FORCE
>         $(call cmd,tags)
>
> +# Compilation Database
> +# ---------------------------------------------------------------------------
> +# Generates a compilation database that can be used with the LLVM tools
> +ifdef CONFIG_COMPILATION_DATABASE
> +
> +quiet_cmd_compilation_db = GEN   $@
> +cmd_compilation_db = (echo '['; \
> +       find "$(@D)" -mindepth 2 -iname '*.json' -print0 | xargs -0 cat; \
> +       echo ']') > "$(@D)/$(@F)"


Using 'find' has the same problem as
scripts/gen_compile_commands.py does.

Unless we start build from the clean source tree,
compile_commands.json will contain stale entries
from the previous building.

The motivation is
to replace scripts/gen_compile_commands.py entirely?

Generally, we do not need two ways to do the same thing...





> +# Make sure the database is built when calling `make` without a target.
> +# TODO: Using extra-y doesn't seem to work.
> +_all: $(obj)/compile_commands.json
> +
> +# TODO: Is there a variable that contains all the object files created by
> +# cmd_cc_o_c? Depending on `all` is kind of a hack
> +$(obj)/compile_commands.json: all FORCE
> +       $(call if_changed,compilation_db)
> +endif
> +
>  # Scripts to check various things for consistency
>  # ---------------------------------------------------------------------------
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index eae43952902eb..46fceb1fff3d9 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -238,6 +238,13 @@ config GDB_SCRIPTS
>           instance. See Documentation/dev-tools/gdb-kernel-debugging.rst
>           for further details.
>
> +config COMPILATION_DATABASE
> +       bool "Generate a compilation database"
> +       depends on CLANG_VERSION >= 40000
> +       help
> +         This creates a JSON Compilation Database (compile_commands.json)
> +         that is used by the clang tooling (clang-tidy, clang-check, etc).
> +
>  config ENABLE_MUST_CHECK
>         bool "Enable __must_check logic"
>         default y
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index ae9cf740633e1..0017bf397292d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -145,8 +145,15 @@ $(obj)/%.ll: $(src)/%.c FORCE
>  # The C file is compiled and updated dependency information is generated.
>  # (See cmd_cc_o_c + relevant part of rule_cc_o_c)
>
> +ifdef CONFIG_COMPILATION_DATABASE
> +# TODO: Should we store the json in a temp variable and only copy it to the
> +# final name when the content is different? In theory we could avoid having to
> +# generate the compilation db if the json did not change.
> +compdb_flags = -MJ $(@D)/.$(@F).json
> +endif
> +
>  quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
> -      cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $<
> +      cmd_cc_o_c = $(CC) $(c_flags) $(compdb_flags) -c -o $@ $<
>
>  ifdef CONFIG_MODVERSIONS
>  # When module versioning is enabled the following steps are executed:
> --
> 2.22.0.rc1.311.g5d7573a151-goog
>


-- 
Best Regards
Masahiro Yamada
