Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9EC3C8ABD
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 20:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhGNSYt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 14:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbhGNSXu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 14:23:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D6FC06175F
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:20:58 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x25so5141491lfu.13
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YIyhhFVB7lAJhhYlHC8Aypf2fwXB60EEf6/ds0a06qs=;
        b=WjWBbDP+tcAoBdyhzpem1Lt+enhBtxIdl7M/LZz7pvw2fcnfLkxB9LPDvEnrEoF1d7
         cN7vgiiYCkEXNbXuCy8FBQx+2pKOOHn8AUC2EyBSHQD1NnfdhyiW8CQNXiExKTPcfWh5
         HHek690m5HL4ZA6zm3mVcPfE3SwmsNv2kAgTEb2QQ8PszDqWMmFrSzSNrigP9XtUcSRA
         huzgAwiB3oced8ka9MN9OPRc2k8ZBQvS/jcroEw+iI0hJAd6d9S+6F3eaw7fDlQC1//i
         AVFxM4Us8XoLCmwsvE5u8YxooJy5tSa40XWL6dn57LJ/g0HJtaLFUZejCGKjq/Ebzyz5
         mijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YIyhhFVB7lAJhhYlHC8Aypf2fwXB60EEf6/ds0a06qs=;
        b=qTXeN68yS4OLHzhfqysORDkcqaXY9ngE8y2beJJFnZvNoZu+mGsM2DgJHvP6oKXQjq
         PuzOI/ATJpc/mKaUG6FdoTccXrm/+mm4j4E2m3W+2UnGCXhQWCKV5m2P1bXAKFco7QUY
         dg2JCssVPy6cfqQIFKyIuUhDmTXxiEIiYlFsx1OouWIiejXjcyt+VsR76j5NXl4JWp2T
         P+gd+R3QxxALH5FRa0ZQIX+yea+HEStnwaKQVuRS57f9FLUcwnaFLPKK10Ynk/NXvsFX
         Q6N4vHfrb7eqDGcODoPI/iywFomY/im1MTfe1CmiyWl96kwfsKDMxPiyLzOXHpT65qCR
         89eg==
X-Gm-Message-State: AOAM533ovCMOFjeVQSkU24Si/plqat0sCnelSeEz4nFbJ1uo0MLfe96N
        TEgcGpYQa7zZonketKwD/BSkrtgNK29+qRMUod8r3w==
X-Google-Smtp-Source: ABdhPJxnH4NvQGYqbyk8YkNhDQI/yZpwt8HCAd8tHuT3h7Tmoj24r5uK2DyIdsNuBU+BZee+ngnFx20Yy8qqdce7lNY=
X-Received: by 2002:a19:4916:: with SMTP id w22mr9201976lfa.374.1626286856158;
 Wed, 14 Jul 2021 11:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-3-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Jul 2021 11:20:44 -0700
Message-ID: <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 1:28 PM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> Rust symbols can become quite long due to namespacing introduced
> by modules, types, traits, generics, etc. For instance, for:
>
>     pub mod my_module {
>         pub struct MyType;
>         pub struct MyGenericType<T>(T);
>
>         pub trait MyTrait {
>             fn my_method() -> u32;
>         }
>
>         impl MyTrait for MyGenericType<MyType> {
>             fn my_method() -> u32 {
>                 42
>             }
>         }
>     }
>
> generates a symbol of length 96 when using the upcoming v0 mangling scheme:
>
>     _RNvXNtCshGpAVYOtgW1_7example9my_moduleINtB2_13MyGenericTypeNtB2_6MyTypeENtB2_7MyTrait9my_method

For C++ demangling, we have c++filt.

A quick search turned up: https://github.com/luser/rustfilt

but if the v0 mangling scheme is upcoming, I doubt a repo that hasn't
been updated supports an upcoming scheme.  Is there a more official
equivalent?

Do we demangle rust symbols when printing a trace from a warn/panic?
That would be nice.

>
> At the moment, Rust symbols may reach up to 300 in length.
> Setting 512 as the maximum seems like a reasonable choice to
> keep some headroom.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
> Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  include/linux/kallsyms.h            | 2 +-
>  kernel/livepatch/core.c             | 4 ++--
>  scripts/kallsyms.c                  | 2 +-
>  tools/include/linux/kallsyms.h      | 2 +-
>  tools/include/linux/lockdep.h       | 2 +-
>  tools/lib/perf/include/perf/event.h | 2 +-
>  tools/lib/symbol/kallsyms.h         | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
> index 465060acc98..5cdc6903abc 100644
> --- a/include/linux/kallsyms.h
> +++ b/include/linux/kallsyms.h
> @@ -14,7 +14,7 @@
>
>  #include <asm/sections.h>
>
> -#define KSYM_NAME_LEN 128
> +#define KSYM_NAME_LEN 512
>  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s]") + (KSYM_NAME_LEN - 1) + \
>                          2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + 1)
>
> diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> index 335d988bd81..73874e5edfd 100644
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -213,7 +213,7 @@ static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
>          * we use the smallest/strictest upper bound possible (56, based on
>          * the current definition of MODULE_NAME_LEN) to prevent overflows.
>          */
> -       BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 128);
> +       BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 512);
>
>         relas = (Elf_Rela *) relasec->sh_addr;
>         /* For each rela in this klp relocation section */
> @@ -227,7 +227,7 @@ static int klp_resolve_symbols(Elf64_Shdr *sechdrs, const char *strtab,
>
>                 /* Format: .klp.sym.sym_objname.sym_name,sympos */
>                 cnt = sscanf(strtab + sym->st_name,
> -                            ".klp.sym.%55[^.].%127[^,],%lu",
> +                            ".klp.sym.%55[^.].%511[^,],%lu",
>                              sym_objname, sym_name, &sympos);
>                 if (cnt != 3) {
>                         pr_err("symbol %s has an incorrectly formatted name\n",
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index bcdabee13aa..9bab5f55ade 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -27,7 +27,7 @@
>
>  #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
>
> -#define KSYM_NAME_LEN          128
> +#define KSYM_NAME_LEN          512
>
>  struct sym_entry {
>         unsigned long long addr;
> diff --git a/tools/include/linux/kallsyms.h b/tools/include/linux/kallsyms.h
> index efb6c3f5f2a..5a37ccbec54 100644
> --- a/tools/include/linux/kallsyms.h
> +++ b/tools/include/linux/kallsyms.h
> @@ -6,7 +6,7 @@
>  #include <stdio.h>
>  #include <unistd.h>
>
> -#define KSYM_NAME_LEN 128
> +#define KSYM_NAME_LEN 512
>
>  struct module;
>
> diff --git a/tools/include/linux/lockdep.h b/tools/include/linux/lockdep.h
> index e56997288f2..d9c163f3ab2 100644
> --- a/tools/include/linux/lockdep.h
> +++ b/tools/include/linux/lockdep.h
> @@ -47,7 +47,7 @@ static inline int debug_locks_off(void)
>
>  #define task_pid_nr(tsk) ((tsk)->pid)
>
> -#define KSYM_NAME_LEN 128
> +#define KSYM_NAME_LEN 512
>  #define printk(...) dprintf(STDOUT_FILENO, __VA_ARGS__)
>  #define pr_err(format, ...) fprintf (stderr, format, ## __VA_ARGS__)
>  #define pr_warn pr_err
> diff --git a/tools/lib/perf/include/perf/event.h b/tools/lib/perf/include/perf/event.h
> index 4d0c02ba3f7..095d60144a7 100644
> --- a/tools/lib/perf/include/perf/event.h
> +++ b/tools/lib/perf/include/perf/event.h
> @@ -95,7 +95,7 @@ struct perf_record_throttle {
>  };
>
>  #ifndef KSYM_NAME_LEN
> -#define KSYM_NAME_LEN 256
> +#define KSYM_NAME_LEN 512
>  #endif
>
>  struct perf_record_ksymbol {
> diff --git a/tools/lib/symbol/kallsyms.h b/tools/lib/symbol/kallsyms.h
> index 72ab9870454..542f9b059c3 100644
> --- a/tools/lib/symbol/kallsyms.h
> +++ b/tools/lib/symbol/kallsyms.h
> @@ -7,7 +7,7 @@
>  #include <linux/types.h>
>
>  #ifndef KSYM_NAME_LEN
> -#define KSYM_NAME_LEN 256
> +#define KSYM_NAME_LEN 512
>  #endif
>
>  static inline u8 kallsyms2elf_binding(char type)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
