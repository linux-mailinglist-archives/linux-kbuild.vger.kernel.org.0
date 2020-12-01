Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DDE2C95F4
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 04:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgLADni (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 22:43:38 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:27722 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbgLADni (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 22:43:38 -0500
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0B13gSOW012615;
        Tue, 1 Dec 2020 12:42:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0B13gSOW012615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606794149;
        bh=BWVC7RRUjccNiBhgYJa1yg1OZmjJwaBDhMFEUkAYcN4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JEK9kZtFFmaSXOAhh+Z65KvyTutJYBHPKO6AW23p1sFWtiT+usxWWP//lcjnmlGss
         JgwkMoAiauLqiuVfo98fq+OAUsLmJV++U4/peWfcHOC9HX1Qgp0W2pc8k6ebQCpIzl
         yPweBO0wYilGJlvuwXoMv5Bjc/fs83ufoDjLSNKk0bAuRolpQVYwgWw5VsS82mS90I
         lu4hpW+lDmw94FmbvOo1pU6+UR966WnmDtWqsetUVjltDcfCMyGrIRF4iZPkOFI6F5
         AUYcWRlWEgC3k0x76WlvSe2XZ3RSoDQq/FUvKSrDfJ9lwt3eGgiZJmNs0K6rdc7V1/
         55bF8QukxE25A==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id l4so394456pgu.5;
        Mon, 30 Nov 2020 19:42:28 -0800 (PST)
X-Gm-Message-State: AOAM532eTAMAl28DcSvLG9M/WLDnBivn0griXAhmJdg+dcwj1a77+/h3
        NoyAAE/RFah/FJ1DNqEegQVbIVOAy5hoaM/y4hA=
X-Google-Smtp-Source: ABdhPJw8A81Y8/Np9Cv+CBx/1Qpock66ZEd/FSphSJcX/t31cIp72/nzgCgbffh2CUigq3Km1etdD76ChTglzTmazGE=
X-Received: by 2002:a63:4821:: with SMTP id v33mr557464pga.7.1606794148022;
 Mon, 30 Nov 2020 19:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20201201032748.486928-1-masahiroy@kernel.org>
In-Reply-To: <20201201032748.486928-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 12:41:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+rWTku5Lz+by3vEzsWNsdOpO30phkdwCvzJf28aXiUw@mail.gmail.com>
Message-ID: <CAK7LNAR+rWTku5Lz+by3vEzsWNsdOpO30phkdwCvzJf28aXiUw@mail.gmail.com>
Subject: Re: [PATCH] Remove $(cc-option,-gdwarf-4) dependency from CONFIG_DEBUG_INFO_DWARF4
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Fangrui Song <maskray@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Peter Enderborg <peter.enderborg@sony.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 1, 2020 at 12:29 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The -gdwarf-4 flag is supported by GCC 4.5+, and also by Clang.
>
> You can see it at https://godbolt.org/z/6ed1oW
>
>   For gcc 4.5.3 pane,    line 37:    .value 0x4
>   For clang 10.0.1 pane, line 117:   .short 4
>
> Given Documentation/process/changes.rst stating GCC 4.9 is the minimal
> version, this cc-option is unneeded.
>
> Note
> ----
>
> CONFIG_DEBUG_INFO_DWARF4 controls the DWARF version only for C files.
>
> As you can see in the top Makefile, -gdwarf-4 is only passed to CFLAGS.
>
>   ifdef CONFIG_DEBUG_INFO_DWARF4
>   DEBUG_CFLAGS    += -gdwarf-4
>   endif
>
> This flag is used when compiling *.c files.
>
> On the other hand, the assembler is always given -gdwarf-2.
>
>   KBUILD_AFLAGS   += -Wa,-gdwarf-2
>
> Hence, the debug info that comes from *.S files is always DWARF v2.
> This is simply because GAS supported only -gdwarf-2 for a long time.
>
> Recently, GAS gained the support for --dwarf-[3|4|5] options. [1]
> And, also we have Clang integrated assembler. So, the debug info
> for *.S files might be improved if we want.
>
> In my understanding, the current code is intentional, not a bug.
>
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=31bf18645d98b4d3d7357353be840e320649a67d
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  lib/Kconfig.debug | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index cb8ef4fd0d02..7f80c25497a1 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -258,7 +258,6 @@ config DEBUG_INFO_SPLIT
>
>  config DEBUG_INFO_DWARF4
>         bool "Generate dwarf4 debuginfo"
> -       depends on $(cc-option,-gdwarf-4)
>         help
>           Generate dwarf4 debug info. This requires recent versions
>           of gcc and gdb. It makes the debug information larger.
> --
> 2.27.


Maybe, this can be squashed into Nick's patch.




-- 
Best Regards
Masahiro Yamada
