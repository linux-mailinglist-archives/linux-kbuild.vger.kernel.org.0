Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62BE75203CE
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 May 2022 19:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239770AbiEIRzB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 May 2022 13:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235921AbiEIRzB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 May 2022 13:55:01 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26D041613
        for <linux-kbuild@vger.kernel.org>; Mon,  9 May 2022 10:51:04 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id v4so17973209ljd.10
        for <linux-kbuild@vger.kernel.org>; Mon, 09 May 2022 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z6h/UbBcSsy6Cwv/zRBUg+8oIkiwnR5qcB1QDqTp6w8=;
        b=lOajRfE7fyP+ep3MKFGW9mQh4e9I1Uiq21usbZezTUhM7EFdhg1SnvvNjY4eG59ULs
         V4Owko+szwUqUWwUMOPZ7L4L7x5m3g1Mm7rbCdqAjqtaLm5FvW/K5dfZdN0XW5hf65HO
         78imLtJfT6cP2hesjWXVSZsQU4pIUmnZcKDPw9almOyM+aeGj7565UrKRLWpVcmNrEwe
         xJkgCcUXrlopAOgqZYayw1LQ0mSuw5EChiwGNUaBuTsB3BXNrjGOYu+K76TLXsRGHsBe
         eQK1QSxvGw/P89SyjP0B19ZHce6iDYv7Nz+kMtnMo+aOblb0/ntvWz3HsYVV84q3HMkk
         YVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z6h/UbBcSsy6Cwv/zRBUg+8oIkiwnR5qcB1QDqTp6w8=;
        b=ROLiZC1zKC9StNwHfqsf7m/t23pxK0zdYlohXcJis/LT1qICnmlZ76ac75AZZq54G5
         peOMCTNX/tmIrN4ihIqWQYXQq96oadKfIgSJL7hne4PnaEM8vyU1+uqTP1figsettDog
         stLFDEyzPUcX7NpjF31dGgSylMRwdlnyiSEVsoQwf4RPiN3uA3OPAXmHH1PU27ADqphb
         rzPc2h+yK9/vKh9YaAnEZXmBwDBUEmhEgu4fK2HJ0tQxzzNr+HAHlcoZOTnibjM8aYaG
         aGUqdw4OjAq+LbHGa1D1XfkfbE7zqXYvGGnQL/4duWem+WdPanMGCKT+NOPnTHT/EQn6
         PYBw==
X-Gm-Message-State: AOAM531SZwcZLypgtJG9BIoSr4ZS5AYecVYBcg6Zs7uH9a+gqYoU8dlb
        lLzSv6C0K5rxBdvgRFhvkpqDu2Sot5nXUImT8np82g==
X-Google-Smtp-Source: ABdhPJzH0GFY+4K8szx4KHcz2z6G62DNfHvef1hX/KTMFMx//VA0v3aill5VeXt5HmS0uJd9IHn4xVPu7N0kN8BJZnI=
X-Received: by 2002:a2e:a7c8:0:b0:24f:700a:4df5 with SMTP id
 x8-20020a2ea7c8000000b0024f700a4df5mr11176691ljp.472.1652118662391; Mon, 09
 May 2022 10:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-7-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-7-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 May 2022 10:50:50 -0700
Message-ID: <CAKwvOdm_oSLHddWWSzF5UuYrLCsAwF8AwbUGotUnPvV+6JkSkg@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

 On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> diff --git a/include/asm-generic/export.h b/include/asm-generic/export.h
> index 07a36a874dca..51ce72ce80fa 100644
> --- a/include/asm-generic/export.h
> +++ b/include/asm-generic/export.h
> @@ -2,6 +2,14 @@
>  #ifndef __ASM_GENERIC_EXPORT_H
>  #define __ASM_GENERIC_EXPORT_H
>
> +/*
> + * This comment block is used by fixdep. Please do not remove.

I don't know much about fixdep. How does that work, if you could summarize?

> + *
> + * When CONFIG_MODVERSIONS is changed from n to y, all source files having
> + * EXPORT_SYMBOL variants must be re-compiled because genksyms is run as a
> + * side effect of the .o build rule.
> + */
> +
>  #ifndef KSYM_FUNC
>  #define KSYM_FUNC(x) x
>  #endif
> @@ -12,9 +20,6 @@
>  #else
>  #define KSYM_ALIGN 4
>  #endif
> -#ifndef KCRC_ALIGN
> -#define KCRC_ALIGN 4
> -#endif

The #ifndef is there because arch/m68k/include/asm/export.h:1 defines
KCRC_ALIGN. You should delete that, too.

> diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> index 4827c5abe5b7..6e6933ae7911 100644
> --- a/scripts/genksyms/genksyms.c
> +++ b/scripts/genksyms/genksyms.c
> @@ -33,7 +33,7 @@ char *cur_filename;
>  int in_source_file;
>
>  static int flag_debug, flag_dump_defs, flag_reference, flag_dump_types,
> -          flag_preserve, flag_warnings, flag_rel_crcs;
> +          flag_preserve, flag_warnings;
>
>  static int errors;
>  static int nsyms;
> @@ -681,10 +681,7 @@ void export_symbol(const char *name)
>                         fputs(">\n", debugfile);
>
>                 /* Used as a linker script. */

^ Does this comment still apply?

> -               printf(!flag_rel_crcs ? "__crc_%s = 0x%08lx;\n" :
> -                      "SECTIONS { .rodata : ALIGN(4) { "
> -                      "__crc_%s = .; LONG(0x%08lx); } }\n",
> -                      name, crc);
> +               printf("__crc_%s = 0x%08lx;\n", name, crc);
>         }
>  }
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index eceb3ee7ec06..6aee2401f3ad 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -88,11 +88,6 @@ modpost_link()
>                 gen_initcalls
>                 lds="-T .tmp_initcalls.lds"
>
> -               if is_enabled CONFIG_MODVERSIONS; then
> -                       gen_symversions

^ this is the only caller of gen_symversions, right? Then
gen_symversions can be cleaned up, too?

> -                       lds="${lds} -T .tmp_symversions.lds"
> -               fi
> -
>                 # This might take a while, so indicate that we're doing
>                 # an LTO link
>                 info LTO ${1}
> @@ -183,6 +178,10 @@ vmlinux_link()
>                 libs="${KBUILD_VMLINUX_LIBS}"
>         fi
>
> +       if is_enabled CONFIG_MODULES; then
> +               objs="${objs} .vmlinux.export.o"
> +       fi
> +
>         if [ "${SRCARCH}" = "um" ]; then
>                 wl=-Wl,
>                 ld="${CC}"
> @@ -312,6 +311,7 @@ cleanup()
>         rm -f vmlinux.o
>         rm -f .vmlinux.d
>         rm -f .vmlinux.objs
> +       rm -f .vmlinux.export.c

Probably can drop the `rm -f .tmp_symversions.lds` here, too?
-- 
Thanks,
~Nick Desaulniers
