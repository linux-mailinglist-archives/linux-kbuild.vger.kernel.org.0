Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2A433C26D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 17:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbhCOQq6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 12:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbhCOQqh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 12:46:37 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F14C9C06174A
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 09:46:36 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t18so10142514lfl.3
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Mar 2021 09:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFhPUblHKp6tXfbrK0cixR+M4AcUyTbmqfJOgtbPZ+E=;
        b=QBWm3ofujajBUk2Fj4lwKDdvOqWj/MpHuqSovTqoj033RnfCBUJTs1Ut84kd8/REC5
         z+3IAldsYXNwjt0aEo27a+Yursi32i6coIKAACAT2vtWSdIfyFN6Vp9ITTwNDXt9gKDe
         o11G79mfOuwAVoqnZNhB3tPc36l/mrdaVgOWrD1hvtnPTNrBss1ZlJw0ViXL+Q8qrble
         ZHKfScI73mgWKcPXK/4jfnWy+a+nKG9BgM0PN+Urj4mk8y2YcqtKP/jDFlDvisf1t1h1
         6SqkVhVT7/11SppVwNtg1nOrYgKPKbSKY4e1NcGNicD0QtpYg1Sch1xaqiRBbGiQxu8z
         XqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFhPUblHKp6tXfbrK0cixR+M4AcUyTbmqfJOgtbPZ+E=;
        b=TGxpY2MTKEXkzNQImX3FpMmD2RCtefgDs+/PTflUJO+xuKE2Q33bDFLcLhbzs+gkLA
         HxO1TGyy4xLJ76hullWnOeN3Pstti1wNAVismovpDkV7+7f39u3EmN3/PMdzDUTY84y+
         rZus3rSdlXLn967qXHrdHS0GtMjRF/Pwyg5FFmT5LwBrqLyy0Ny0LGbc5re4tsr80a2t
         0AzNbZyWlLwucyeXloJFXjpqPBLpjdeL+iju90sS+LBIpMhrt12WjCdeIroYKQ2nTHvR
         QgwXFjCVG7bh9RuazG38lszvCkRj83a5w8cb0WrY6BpqaIfbPWiOKwSjPPexghnzJJYh
         Zusg==
X-Gm-Message-State: AOAM532ldRzoEa4Z2GGYlK6UVMvRqTEldauCPmfB1qFeTvoItTFScVnh
        rzJSSQ3nw6+E/cCMUdXoYuCGqF/tvhe+WauWyPDWhQ==
X-Google-Smtp-Source: ABdhPJzNV9gWP/pht4xV+/j0WfvJQ/v09PRN5JyUBIIuFKGRL9R97RQT73CP/MV1GdANmkmEOE/UbLRDBgEWki84b+I=
X-Received: by 2002:a19:8c19:: with SMTP id o25mr8602912lfd.547.1615826795278;
 Mon, 15 Mar 2021 09:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210315161257.788477-1-masahiroy@kernel.org> <20210315161257.788477-3-masahiroy@kernel.org>
In-Reply-To: <20210315161257.788477-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 15 Mar 2021 09:46:24 -0700
Message-ID: <CAKwvOdmyw+v5tD9t3ZKwPB-Gor2OcZoRPPEHW_OT1ZJJ727tbw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kbuild: dwarf: use AS_VERSION instead of test_dwarf5_support.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Enderborg <peter.enderborg@sony.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Wei Yang <richard.weiyang@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 15, 2021 at 9:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The test code in scripts/test_dwarf5_support.sh is somewhat difficult
> to understand, but after all, we want to check binutils >= 2.35.2
>
> From the former discussion, the requirement for generating DWARF v5 from
> C code is as follows:
>
>  - gcc + gnu as          -> requires gcc 5.0+ (but 7.0+ for full support)
>  - clang + gnu as        -> requires binutils 2.35.2+
>  - clang + integrated as -> OK
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - fix typos
>   - simplify the dependency expression
>
>  lib/Kconfig.debug              | 3 +--
>  scripts/test_dwarf5_support.sh | 8 --------
>  2 files changed, 1 insertion(+), 10 deletions(-)
>  delete mode 100755 scripts/test_dwarf5_support.sh
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index b479ae609a31..c85d5f7a1aeb 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -284,8 +284,7 @@ config DEBUG_INFO_DWARF4
>
>  config DEBUG_INFO_DWARF5
>         bool "Generate DWARF Version 5 debuginfo"
> -       depends on GCC_VERSION >= 50000 || CC_IS_CLANG
> -       depends on CC_IS_GCC || $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
> +       depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
>         depends on !DEBUG_INFO_BTF
>         help
>           Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
> diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> deleted file mode 100755
> index c46e2456b47a..000000000000
> --- a/scripts/test_dwarf5_support.sh
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -# Test that the assembler doesn't need -Wa,-gdwarf-5 when presented with DWARF
> -# v5 input, such as `.file 0` and `md5 0x00`. Should be fixed in GNU binutils
> -# 2.35.2. https://sourceware.org/bugzilla/show_bug.cgi?id=25611
> -echo '.file 0 "filename" md5 0x7a0b65214090b6693bd1dc24dd248245' | \
> -  $* -gdwarf-5 -Wno-unused-command-line-argument -c -x assembler -o /dev/null -
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers

On Mon, Mar 15, 2021 at 9:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The test code in scripts/test_dwarf5_support.sh is somewhat difficult
> to understand, but after all, we want to check binutils >= 2.35.2
>
> From the former discussion, the requirement for generating DWARF v5 from
> C code is as follows:
>
>  - gcc + gnu as          -> requires gcc 5.0+ (but 7.0+ for full support)
>  - clang + gnu as        -> requires binutils 2.35.2+
>  - clang + integrated as -> OK
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> ---
>
> Changes in v2:
>   - fix typos
>   - simplify the dependency expression
>
>  lib/Kconfig.debug              | 3 +--
>  scripts/test_dwarf5_support.sh | 8 --------
>  2 files changed, 1 insertion(+), 10 deletions(-)
>  delete mode 100755 scripts/test_dwarf5_support.sh
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index b479ae609a31..c85d5f7a1aeb 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -284,8 +284,7 @@ config DEBUG_INFO_DWARF4
>
>  config DEBUG_INFO_DWARF5
>         bool "Generate DWARF Version 5 debuginfo"
> -       depends on GCC_VERSION >= 50000 || CC_IS_CLANG
> -       depends on CC_IS_GCC || $(success,$(srctree)/scripts/test_dwarf5_support.sh $(CC) $(CLANG_FLAGS))
> +       depends on GCC_VERSION >= 50000 || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
>         depends on !DEBUG_INFO_BTF
>         help
>           Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
> diff --git a/scripts/test_dwarf5_support.sh b/scripts/test_dwarf5_support.sh
> deleted file mode 100755
> index c46e2456b47a..000000000000
> --- a/scripts/test_dwarf5_support.sh
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -# Test that the assembler doesn't need -Wa,-gdwarf-5 when presented with DWARF
> -# v5 input, such as `.file 0` and `md5 0x00`. Should be fixed in GNU binutils
> -# 2.35.2. https://sourceware.org/bugzilla/show_bug.cgi?id=25611
> -echo '.file 0 "filename" md5 0x7a0b65214090b6693bd1dc24dd248245' | \
> -  $* -gdwarf-5 -Wno-unused-command-line-argument -c -x assembler -o /dev/null -
> --
> 2.27.0
>


-- 
Thanks,
~Nick Desaulniers
