Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E86A35FE98
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 01:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhDNXtM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 19:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhDNXtI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 19:49:08 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C67C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 16:48:45 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id p23so21430938ljn.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 16:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sYrhQ+L0KHq4tveN5clEASWcQ37/wtC32tCYh0nBGLo=;
        b=oVcontEvK+/+8MA7Pe0KxzkdxdTY9uAw/triIXdClbgN0AqR9y8J3vDKWQGZQognij
         Dv00nHR4pwZKbHwSELVW5MrGADWTow2YAHFxLyIaZMUVnYn+HgFQ8m6I4nxQIIa6oaxR
         vZ1zOvsFHhQpoJofcGiYwlm0N3C7yvAyenfpmab9wAukwMa/kcYewOhykPReLODnnHdD
         B/UdliM0FMyAu1rYPLtGw/OMmDtd0yatWxtt6mS1EiYKE4B+p79g4b6MjsuD0Gv3Y+C0
         z7Zo437En5Rw8m6Tf0iCuERtCSm0c+tBNu9xHU8I+jVxM5wFKHnusyAReqAdFalPdrTB
         RNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sYrhQ+L0KHq4tveN5clEASWcQ37/wtC32tCYh0nBGLo=;
        b=KnAGx5vY8J2/xgrChsQzgGMfUZkguIYnwOo9bmab4K0+2M01sVqQMHojTEtXLKs1Yt
         EVdHrDECVg0P+2EPqdD6ube5UrWZKCSvWaOYGRyH7Gbnfjvq8fuNcD11lUT9h/eBcR8q
         utFUr4rnsizzRCqXMmZC6RpYqO5y39Od2Qa7afR4qkmF0vzvz7dJoi34eWjts2L7G9GS
         /WxbrOOv81bKFnllgkjTBBiKdnGPIbLdrQ8OmA+gqWRCI3jcHAJ2uireIRdwoobkPzap
         bBQIxqYq1WmPam8hvnxjSj458/g2CKJEU+2zSRNDnxenyBA07z5JDbC9pwUSrqXXhHpQ
         B88w==
X-Gm-Message-State: AOAM532y14hODR3B1yveDVwOzhQa3PpGqqwZ8yxqBpgRTyKfbg2U7mz7
        sm+J00AgDSK6EQYQmW06AMn0YTb4minqfa0Rs64hAg==
X-Google-Smtp-Source: ABdhPJxDm6QXae66Kp5wtL/ye/7TEOwYZKMxEQuOI5NmLFtK+zp9XBWYUFbSmyJLar215o9dcq4wZWgDF/OjIY+UAhA=
X-Received: by 2002:a2e:5716:: with SMTP id l22mr239987ljb.244.1618444123676;
 Wed, 14 Apr 2021 16:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-3-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-3-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 16:48:31 -0700
Message-ID: <CAKwvOdk+Wya_mhVMPiiv1MVwCGX4DTZ2tX=AOm1-XGOYN5yMZg@mail.gmail.com>
Subject: Re: [PATCH 02/13] kallsyms: Increase maximum kernel symbol length to 512
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:48 AM <ojeda@kernel.org> wrote:
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
>
> At the moment, Rust symbols may reach up to 300 in length.
> Setting 512 as the maximum seems like a reasonable choice to
> keep some headroom.

What are the implications of this change for someone not using Rust?
Does it change the binary size of vmlinux for a defconfig build, for
example?

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
> index 465060acc981..5cdc6903abca 100644
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
> index 335d988bd811..73874e5edfda 100644
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
> index bcdabee13aab..9bab5f55ade3 100644
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
> index efb6c3f5f2a9..5a37ccbec54f 100644
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
> index e56997288f2b..d9c163f3ab24 100644
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
> index d82054225fcc..f5c40325b441 100644
> --- a/tools/lib/perf/include/perf/event.h
> +++ b/tools/lib/perf/include/perf/event.h
> @@ -93,7 +93,7 @@ struct perf_record_throttle {
>  };
>
>  #ifndef KSYM_NAME_LEN
> -#define KSYM_NAME_LEN 256
> +#define KSYM_NAME_LEN 512
>  #endif
>
>  struct perf_record_ksymbol {
> diff --git a/tools/lib/symbol/kallsyms.h b/tools/lib/symbol/kallsyms.h
> index 72ab9870454b..542f9b059c3b 100644
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
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
