Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB67C42FD3D
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Oct 2021 23:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhJOVLq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Oct 2021 17:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234257AbhJOVLp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Oct 2021 17:11:45 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93F0C061570;
        Fri, 15 Oct 2021 14:09:38 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id r134so9173265iod.11;
        Fri, 15 Oct 2021 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=YNpQQVSWroKAuwC5UuKPiU7mURzWsyubKVyYeWLs8+g=;
        b=oi1+0T20an49s5CDeWeeJydx7NnCyGlYcNCY8HrZXBcSv9xoZQQnFi9ywLRriPGdr6
         qudl1OOjImSiBDWFed1YW6Id5h2UY45MqQn0rh0hsk10se0Ow3NtdmoYie6Wf/A+T9+t
         orjszynzQ0gDabjt6gvL/77sYF83TQRQwNwRToZNsOU6pNZMXKXBZD9iJkXBvZTbuOMN
         PL45gIzU8Jv9zN1hciWKxGKdY6LFjNec0ymQq4byhP34RPVWS0JiPQyOhUTt8d2Sww9e
         6sJ1Eks+EnGj8i2ownluYmcU3kQwoGc4wzPLYh00SzycqEO81Dumx6K5WQVbh82NDcMs
         d57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=YNpQQVSWroKAuwC5UuKPiU7mURzWsyubKVyYeWLs8+g=;
        b=Nvb77/R2UC361LRYuzGuYqJERI2XJhm4M3LzkCdnvIBnEmlyEPD9GPugZBtXF5+2zW
         0CKMJw8hJ0RQH1PNZNgTfOHbVGmxoMeI7F5fPiA3MrLFt8fE1ZmegQHOpWgHFveb0lxu
         SQg0CP5r9DXuX0MoRaCJeseOmldrGChazh8tfDNOZi07mxWcv7wGIHjR5OmQ4pXlkdl9
         lMTtq4zlSjVcbg2T4ulSt399JKxqUSev6QGJVv2NJmP+CEhmI5Y0Pm6L23MmzMmIihH4
         txhXOIyHWdedE7p2zh7cuRh8XV1VLW7PWdcmAhS5POcJETbbCjLks6hP4GBkW3+aesiV
         C+Rg==
X-Gm-Message-State: AOAM531iIA+gTccFPqeYuXAYAm6munEjYTufeUCQf72XrqDAyjWfxXWw
        qQxS+m01s8F3l8+fm3BQvB4lrrR5pDJoLLfab3o=
X-Google-Smtp-Source: ABdhPJwNHMuJdFv5OsLXSbaXl6t1UaleaMHzJy6EthxddRG46f4m4rR0YdTy2mlgiRyrZDlIM8Rf+ky5htBI36XHwA4=
X-Received: by 2002:a05:6638:1192:: with SMTP id f18mr9632310jas.114.1634332178263;
 Fri, 15 Oct 2021 14:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211012032503.459821-1-masahiroy@kernel.org>
In-Reply-To: <20211012032503.459821-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 15 Oct 2021 23:09:01 +0200
Message-ID: <CA+icZUV=XTDSiZQwg7=kMkqkS1hyST_yqAwm+6Zd3_X6ApHbbA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: split DEBUG_CFLAGS out to scripts/Makefile.debug
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 12, 2021 at 5:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> To slim down the top Makefile, split out the code block surrounded by
> ifdef CONFIG_DEBUG_INFO ... endif.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Nice.

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

> ---
>
>  Makefile               | 39 +--------------------------------------
>  scripts/Makefile.debug | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 38 deletions(-)
>  create mode 100644 scripts/Makefile.debug
>
> diff --git a/Makefile b/Makefile
> index ee5896261d2f..8e3224470dc1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -847,44 +847,6 @@ ifdef CONFIG_ZERO_CALL_USED_REGS
>  KBUILD_CFLAGS  += -fzero-call-used-regs=used-gpr
>  endif
>
> -DEBUG_CFLAGS   :=
> -
> -ifdef CONFIG_DEBUG_INFO
> -
> -ifdef CONFIG_DEBUG_INFO_SPLIT
> -DEBUG_CFLAGS   += -gsplit-dwarf
> -else
> -DEBUG_CFLAGS   += -g
> -endif
> -
> -ifndef CONFIG_AS_IS_LLVM
> -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> -endif
> -
> -ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> -dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> -dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
> -DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> -endif
> -
> -ifdef CONFIG_DEBUG_INFO_REDUCED
> -DEBUG_CFLAGS   += -fno-var-tracking
> -ifdef CONFIG_CC_IS_GCC
> -DEBUG_CFLAGS   += -femit-struct-debug-baseonly
> -endif
> -endif
> -
> -ifdef CONFIG_DEBUG_INFO_COMPRESSED
> -DEBUG_CFLAGS   += -gz=zlib
> -KBUILD_AFLAGS  += -gz=zlib
> -KBUILD_LDFLAGS += --compress-debug-sections=zlib
> -endif
> -
> -endif # CONFIG_DEBUG_INFO
> -
> -KBUILD_CFLAGS += $(DEBUG_CFLAGS)
> -export DEBUG_CFLAGS
> -
>  ifdef CONFIG_FUNCTION_TRACER
>  ifdef CONFIG_FTRACE_MCOUNT_USE_CC
>    CC_FLAGS_FTRACE      += -mrecord-mcount
> @@ -1033,6 +995,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
>
>  # include additional Makefiles when needed
>  include-y                      := scripts/Makefile.extrawarn
> +include-$(CONFIG_DEBUG_INFO)   += scripts/Makefile.debug
>  include-$(CONFIG_KASAN)                += scripts/Makefile.kasan
>  include-$(CONFIG_KCSAN)                += scripts/Makefile.kcsan
>  include-$(CONFIG_UBSAN)                += scripts/Makefile.ubsan
> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> new file mode 100644
> index 000000000000..9f39b0130551
> --- /dev/null
> +++ b/scripts/Makefile.debug
> @@ -0,0 +1,33 @@
> +DEBUG_CFLAGS   :=
> +
> +ifdef CONFIG_DEBUG_INFO_SPLIT
> +DEBUG_CFLAGS   += -gsplit-dwarf
> +else
> +DEBUG_CFLAGS   += -g
> +endif
> +
> +ifndef CONFIG_AS_IS_LLVM
> +KBUILD_AFLAGS  += -Wa,-gdwarf-2
> +endif
> +
> +ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
> +DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> +endif
> +
> +ifdef CONFIG_DEBUG_INFO_REDUCED
> +DEBUG_CFLAGS   += -fno-var-tracking
> +ifdef CONFIG_CC_IS_GCC
> +DEBUG_CFLAGS   += -femit-struct-debug-baseonly
> +endif
> +endif
> +
> +ifdef CONFIG_DEBUG_INFO_COMPRESSED
> +DEBUG_CFLAGS   += -gz=zlib
> +KBUILD_AFLAGS  += -gz=zlib
> +KBUILD_LDFLAGS += --compress-debug-sections=zlib
> +endif
> +
> +KBUILD_CFLAGS += $(DEBUG_CFLAGS)
> +export DEBUG_CFLAGS
> --
> 2.30.2
>
