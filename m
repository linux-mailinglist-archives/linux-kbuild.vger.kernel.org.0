Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA301E548
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 00:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfENWqx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 May 2019 18:46:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36879 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbfENWqx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 May 2019 18:46:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id e6so289203pgc.4
        for <linux-kbuild@vger.kernel.org>; Tue, 14 May 2019 15:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SB/GaKUPZ9drIILKtfO141NqoI9UYS/XADh4R9X0GN8=;
        b=rbhoLPTDosnfXVYvhUia77mlOfX6WMwhmLfj6XzcWyIJTjPmzHi/avLOHKstrb0dtF
         ckwrB2CelU+kS5urLSixvlsHBZfsygzddMrSvq+bpW3Z9rJXly92YepoIrt0acZGGGPc
         hL4qxLvVlXzu08OsDwz3b1WDgm+ZvWxcy06DE+I+xSyzrXdwY675mP8sCr4UZFap1Oo9
         /xK9pN1p6ZLGc1jUjnINb4CyXkHLoi9vC5viVuYqndygFUUscdfF0a75aJVm0Q2qXxvR
         pl8wFdcfK66G/BlMq8KMFNZ/U/6RT0JZyhgyKfVtlLS50B46MZdvyYONHZQujdgPBOsN
         RJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SB/GaKUPZ9drIILKtfO141NqoI9UYS/XADh4R9X0GN8=;
        b=VG4U8R8uannpgBf771RtzlN0hl8nFFfnJlmRSMMrj0aL5rJZGFl5P8BskF5TL4L1j8
         14Y754qx6tHjo//xfK8gc8sB+4WfjN5s9a/uSPq7oB1NFZyF89Ism0MEDlpna2y+vDBF
         ddjzqsb6GFpWIIQ5rz2ERT3vwYNOEiYLsRiDWBTGT6FL/DeYw5s7wIT5Kzs+nDeKK+SO
         msXQDfz1sNdbZW0vW280GQYkKnTIHv7648DXg28THm+UdT9Qt2cT8DITVUi9IxWT/Ps4
         Twsd/94mnpfGRecbLN2FGu5JuPBoS234tnpjnKw9MAb37E/9/avkx4cSBHxTlwvUDQ2K
         JyeA==
X-Gm-Message-State: APjAAAWGkajU4saD2en42+ionuP9Lv+SJd+8F9ix7iT5ixJQnuadvHj/
        qwLRn9H962JJQaRUtVFmRE1KjgaCASUr/+llzALcysL42q8=
X-Google-Smtp-Source: APXvYqxHAUMyM5v7d4gVftLvNhzAZuJAWiQJ/8g/8Kha/jDtvYekW4ICYKoKEhK3RpCEdj5oXiWKIedno4VZm0D3ZpM=
X-Received: by 2002:a63:441c:: with SMTP id r28mr40571374pga.255.1557874012465;
 Tue, 14 May 2019 15:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190514224047.28505-1-natechancellor@gmail.com>
In-Reply-To: <20190514224047.28505-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 May 2019 15:46:40 -0700
Message-ID: <CAKwvOdk1Zr+YJc8Q5YNi+48K_ib9qJ1WPww8QWir=EWhqBaNvw@mail.gmail.com>
Subject: Re: [PATCH] objtool: Allow AR to be overridden with HOSTAR
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

.On Tue, May 14, 2019 at 3:41 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Currently, this Makefile hardcodes GNU ar, meaning that if it is not
> available, there is no way to supply a different one and the build will
> fail.
>
> $ make AR=llvm-ar CC=clang LD=ld.lld HOSTAR=llvm-ar HOSTCC=clang \
>        HOSTLD=ld.lld HOSTLDFLAGS=-fuse-ld=lld defconfig modules_prepare
> ...
>   AR       /out/tools/objtool/libsubcmd.a
> /bin/sh: 1: ar: not found
> ...
>
> Follow the logic of HOST{CC,LD} and allow the user to specify a
> different ar tool via HOSTAR (which is used elsewhere in other
> tools/ Makefiles).
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/481
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  tools/objtool/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 53f8be0f4a1f..88158239622b 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -7,11 +7,12 @@ ARCH := x86
>  endif
>
>  # always use the host compiler
> +HOSTAR ?= ar
>  HOSTCC ?= gcc
>  HOSTLD ?= ld
> +AR      = $(HOSTAR)
>  CC      = $(HOSTCC)
>  LD      = $(HOSTLD)
> -AR      = ar

+ Kbuild
Seems to match what's going on in tools/perf/Makefile.perf and
tools/build/Makefile. Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers
