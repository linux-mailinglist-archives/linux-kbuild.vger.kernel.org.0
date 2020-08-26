Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B10E252E52
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 14:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729916AbgHZML7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 08:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729912AbgHZML5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 08:11:57 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3542C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 05:11:56 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id t7so1302397otp.0
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=jhaI3AGFdu2xKsOd6n5bu0fLJE9fB5xI4G49Uqw6xFg=;
        b=PbH9azvVvEfkD/HgJlUzLxBaZnz6T617XQy3ux94k6U3C4LgWYkbhQkJl1xaBCSy23
         ceRT64iiNbNr1EdiQMekjmOzmAZNV+m6bxM2f883fAtzzxXbrDbDjyJ41xPE0sh/DjtH
         YwEi9yWnNi8lSMipAUBSvL78r89Yg0uqbH9QYUbY9PcbsuSS85JZWj9fqw9AaoCzHDPE
         U80tnz2Zf6oOVMjvXPyRs8tozA5pWA7GmP5DdVlvgC27APLscQ94MOPlcM8V083LhB3+
         G6wwG6OhgXcYatRPlj/KgUm0FyMcQf3ZIAK2/oS0TkOvwNOaJPtiZZRIBWnu+iuPOlvG
         upOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=jhaI3AGFdu2xKsOd6n5bu0fLJE9fB5xI4G49Uqw6xFg=;
        b=HbtOtPKOKOG1dYeWOU3VhgVXMOBlCmDRfGOBM9nyMZGxKgSEg/+FshjuOgbkjYf8jN
         HJ1VJViWUDSSbhmTOf0byNZ7NmM3ZT0xANDAl0rpmFdVjPjzapbPmqrzC3j/+ShcK1i9
         otfsHHhE9IO11jUZErY2yQWh89l/qRykYpRc1J3aUAFxQDWqrud8/Uiasqt4c5jKebAm
         b4mJEvvgLC/3rZbQ31FYHtGg1MiYJWxxoqZfXCYdVf7gyh6lXnp2mB+2WGKUU8Rkj5EI
         mqwD/NAFk/xEMBPYK8xsZni159DVJ4vNOIas4P7O8RXjEG9kKyheLCoGn8xA/DXjusJO
         peZw==
X-Gm-Message-State: AOAM532u84TidqKVZtGn+uNNCospb+JKlX2phBhK1mc6tRKG2aOqIno7
        cVVJUWfA1OAhbyq1yunJJMTSGJGrOLNvYaprqoI=
X-Google-Smtp-Source: ABdhPJxSFkGrIY0zB9ZkZWb7t1g68CGzaNT9k+HLS1+H9QH/HQQf/lzQIPL/0KngXW4Er2xNBrByBvJ1eF9sadRcbjM=
X-Received: by 2002:a05:6830:1147:: with SMTP id x7mr10383845otq.28.1598443915551;
 Wed, 26 Aug 2020 05:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUV85LS08Y2qJ-mheecCrzZmCTV4B5x9kh=BGCUzQVOKaA@mail.gmail.com>
In-Reply-To: <CA+icZUV85LS08Y2qJ-mheecCrzZmCTV4B5x9kh=BGCUzQVOKaA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Aug 2020 14:11:44 +0200
Message-ID: <CA+icZUVatLDOvEZgT19eP6mL7LZoHEA_t_=gy2NTynt3-JYqoA@mail.gmail.com>
Subject: Re: Introduce CONFIG_DEBUG_INFO_AS_DWARF2 and CONFIG_DEBUG_INFO_AS_DWARF4
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 16, 2020 at 2:14 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Masahiro,
>
> I wondered why my generated linux-image-db Debian packages were so big
> when I use GCC toolchain instead of LLVM toolchain.
>
> It turned out I mixed both...
>
>    KBUILD_AFLAGS += -Wa,-gdwarf-2
>
> ...together with...
>
>    DEBUG_CFLAGS += -gdwarf-4
>
> ...when CONFIG_DEBUG_INFO_DWARF4=y is set.
>
> So I hacked up something like the following to prevent this:
>
> diff --git a/Makefile b/Makefile
> index 24a4c1b97bb0..e7a8e47b0e34 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -815,7 +815,11 @@ DEBUG_CFLAGS       += -gsplit-dwarf
>  else
>  DEBUG_CFLAGS   += -g
>  endif
> +ifdef CONFIG_DEBUG_INFO_AS_DWARF2
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> +else ifdef CONFIG_DEBUG_INFO_AS_DWARF4
> +KBUILD_AFLAGS  += -Wa,-gdwarf-4
> +endif
>  endif
>  ifdef CONFIG_DEBUG_INFO_DWARF4
>  DEBUG_CFLAGS   += -gdwarf-4
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 9ad9210d70a1..9f11fc71462c 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -257,10 +257,23 @@ config DEBUG_INFO_SPLIT
>           to know about the .dwo files and include them.
>           Incompatible with older versions of ccache.
>
> +config DEBUG_INFO_AS_DWARF2
> +       bool "Use DWARF-2 assembler option with debuginfo"
> +       depends on $(cc-option,-Wa$(comma)-gdwarf-2)
> +       help
> +         Set DWARF-2 assembler option with debuginfo
> +
> +config DEBUG_INFO_AS_DWARF4
> +       bool "Use DWARF-4 assembler option with debuginfo"
> +       depends on $(cc-option,-Wa$(comma)-gdwarf-4)
> +       help
> +         Set DWARF-4 assembler option with debuginfo
> +
>  config DEBUG_INFO_DWARF4
>         bool "Generate dwarf4 debuginfo"
>         depends on DEBUG_INFO
>         depends on $(cc-option,-gdwarf-4)
> +       select DEBUG_INFO_AS_DWARF4
>         help
>           Generate dwarf4 debug info. This requires recent versions
>           of gcc and gdb. It makes the debug information larger.
>
> NOTE: This is on top of Linux v5.8 vanilla.
>
> NOTE-2: When building with LLVM toolchain v11.0.0-rc1+ and especially
> with LLVM_IAS=1 (and LLVM=1) DWARF version 4 is a good choice.
>
> For details see below links.
>
> Thoughts?
>
> Regards,
> - Sedat -
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/1086
> [2] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674503335
> [3] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674517876

[ CC Sami ]

Hi,

while playing with Clang-CFI I needed this patch to fix these warnings:

$ grep DWARF BROKEN_DWARF2-only-supports-one-section-per-compilation-unit.txt
arch/x86/crypto/twofish-avx-x86_64-asm_64.S:17:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/twofish-avx-x86_64-asm_64.S:22:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/serpent-avx-x86_64-asm_64.S:17:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/serpent-avx-x86_64-asm_64.S:21:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/serpent-avx2-asm_64.S:18:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/serpent-avx2-asm_64.S:23:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/serpent-avx2-asm_64.S:28:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/des3_ede-asm_64.S:534:1: warning: DWARF2 only supports
one section per compilation unit
arch/x86/crypto/camellia-aesni-avx-asm_64.S:577:1: warning: DWARF2
only supports one section per compilation unit
arch/x86/crypto/camellia-aesni-avx-asm_64.S:717:1: warning: DWARF2
only supports one section per compilation unit
<instantiation>:2:2: warning: DWARF2 only supports one section per
compilation unit
<instantiation>:8:2: warning: DWARF2 only supports one section per
compilation unit
<instantiation>:13:2: warning: DWARF2 only supports one section per
compilation unit
arch/x86/crypto/camellia-aesni-avx2-asm_64.S:610:1: warning: DWARF2
only supports one section per compilation unit
arch/x86/crypto/camellia-aesni-avx2-asm_64.S:618:1: warning: DWARF2
only supports one section per compilation unit
arch/x86/crypto/camellia-aesni-avx2-asm_64.S:625:1: warning: DWARF2
only supports one section per compilation unit
arch/x86/crypto/camellia-aesni-avx2-asm_64.S:754:1: warning: DWARF2
only supports one section per compilation unit
<instantiation>:2:2: warning: DWARF2 only supports one section per
compilation unit
<instantiation>:8:2: warning: DWARF2 only supports one section per
compilation unit
<instantiation>:13:2: warning: DWARF2 only supports one section per
compilation unit
arch/x86/crypto/cast5-avx-x86_64-asm_64.S:183:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast5-avx-x86_64-asm_64.S:187:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast5-avx-x86_64-asm_64.S:191:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast5-avx-x86_64-asm_64.S:196:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast5-avx-x86_64-asm_64.S:200:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast5-avx-x86_64-asm_64.S:204:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast6-avx-x86_64-asm_64.S:213:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast6-avx-x86_64-asm_64.S:232:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast6-avx-x86_64-asm_64.S:237:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/cast6-avx-x86_64-asm_64.S:242:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/aegis128-aesni-asm.S:27:1: warning: DWARF2 only
supports one section per compilation unit
arch/x86/crypto/aegis128-aesni-asm.S:36:1: warning: DWARF2 only
supports one section per compilation unit

Can you please review?

Thanks.

Regards,
- Sedat -

P.S.: With the help of Sami I can now build and boot into Linux-kernel
with Clang-CFI support enabled.

[1] https://github.com/samitolvanen/linux/commits/clang-cfi
