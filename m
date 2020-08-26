Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70E07253174
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 16:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgHZOgy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 10:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbgHZOgx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 10:36:53 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32B85C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 07:36:53 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id k2so1667619ots.4
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=1YS+DvTAsf442aKAgp6chxfy9XhEmO3VE8ZtS9/M5Ts=;
        b=Put5MUHwSkqb6Uco3ZLOmMw0dBVhVcRJICA9oUYwOcnHK7aikScEYXlsSjuocO0lm2
         MTnCtvMmPvdzppKTsdmKqK2Cl9Ujcs0oII2K/afIOgZYqIzaPRmGABdshAEFCFzGITKR
         W/tFH/SbkfaCyyNzmIreRFWEmtSdzno5xNJLsFAex2Rn9n3Ybw3c2RYnIRmDKYWvXufk
         LBj878hY+pTeoEELJRHa+yr7TbXyNeYw7Tf6w06Gz1rZyx+CM+nNe29iJnce2TGV5oE8
         awteLeVkSyg0QBNjLrAHmJUVYQUd+ACIL1H/pJSUK+1LZK4e0y4DgHjE24TriRAf5bQy
         u9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=1YS+DvTAsf442aKAgp6chxfy9XhEmO3VE8ZtS9/M5Ts=;
        b=GGFdtKhnaHCxMBq/faRsAMy7XVGTFldHAmCEEH2di6oWVYr5/bB1kJmzOq0ULshGfC
         vBxs6GQIKmPpolskLf8V/sU8b0lzs4/cM1CAKNGcLUDghln3xIDzBBVh6Hmud1urEzAS
         EqN+S7XXRWYWQBr8XU3wV6kma6wzhhgfOpkkd5Eh/1+BfGehl6Zld1cLxnotxFs4fand
         DSI5R3W6ZsHlxfYQOKixdpT7g3w8VT+Hc6IxOAafbhaDErHN0A/nYKNvgoJBhhGMkvXy
         tq8NaKWzOdqi5TC3AEenXyks5FgH9IvZWZLU5yUXF1Yd3w3yQh8ETYJsjEkyJyiL7gVf
         Cuhg==
X-Gm-Message-State: AOAM532td1Ms10iWl5DC7Te+euwRDxbyRyPHx88qWUi3R5oSH2Ps0Abj
        bqBWnoOutfPayWOZnip6r9IhYz4DoykQ8ojqshk=
X-Google-Smtp-Source: ABdhPJyd+B8Q9XZbQTeNx+j1Np+yFbfZh2iKieodp0JpQ2dDdzNwtBZd8SeC6O2iOVDlB3Gir0ZMbNdTTLYb/cFH9iY=
X-Received: by 2002:a9d:7656:: with SMTP id o22mr9531927otl.109.1598452612553;
 Wed, 26 Aug 2020 07:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUV85LS08Y2qJ-mheecCrzZmCTV4B5x9kh=BGCUzQVOKaA@mail.gmail.com>
 <CA+icZUVatLDOvEZgT19eP6mL7LZoHEA_t_=gy2NTynt3-JYqoA@mail.gmail.com>
In-Reply-To: <CA+icZUVatLDOvEZgT19eP6mL7LZoHEA_t_=gy2NTynt3-JYqoA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Aug 2020 16:36:41 +0200
Message-ID: <CA+icZUUuqg3crJx3svhc-XPE+vFpzYAdee3g9YtiS_+udpzkqg@mail.gmail.com>
Subject: Re: Introduce CONFIG_DEBUG_INFO_AS_DWARF2 and CONFIG_DEBUG_INFO_AS_DWARF4
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 26, 2020 at 2:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sun, Aug 16, 2020 at 2:14 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > I wondered why my generated linux-image-db Debian packages were so big
> > when I use GCC toolchain instead of LLVM toolchain.
> >
> > It turned out I mixed both...
> >
> >    KBUILD_AFLAGS += -Wa,-gdwarf-2
> >
> > ...together with...
> >
> >    DEBUG_CFLAGS += -gdwarf-4
> >
> > ...when CONFIG_DEBUG_INFO_DWARF4=y is set.
> >
> > So I hacked up something like the following to prevent this:
> >
> > diff --git a/Makefile b/Makefile
> > index 24a4c1b97bb0..e7a8e47b0e34 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -815,7 +815,11 @@ DEBUG_CFLAGS       += -gsplit-dwarf
> >  else
> >  DEBUG_CFLAGS   += -g
> >  endif
> > +ifdef CONFIG_DEBUG_INFO_AS_DWARF2
> >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > +else ifdef CONFIG_DEBUG_INFO_AS_DWARF4
> > +KBUILD_AFLAGS  += -Wa,-gdwarf-4
> > +endif
> >  endif
> >  ifdef CONFIG_DEBUG_INFO_DWARF4
> >  DEBUG_CFLAGS   += -gdwarf-4
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 9ad9210d70a1..9f11fc71462c 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -257,10 +257,23 @@ config DEBUG_INFO_SPLIT
> >           to know about the .dwo files and include them.
> >           Incompatible with older versions of ccache.
> >
> > +config DEBUG_INFO_AS_DWARF2
> > +       bool "Use DWARF-2 assembler option with debuginfo"
> > +       depends on $(cc-option,-Wa$(comma)-gdwarf-2)
> > +       help
> > +         Set DWARF-2 assembler option with debuginfo
> > +
> > +config DEBUG_INFO_AS_DWARF4
> > +       bool "Use DWARF-4 assembler option with debuginfo"
> > +       depends on $(cc-option,-Wa$(comma)-gdwarf-4)
> > +       help
> > +         Set DWARF-4 assembler option with debuginfo
> > +
> >  config DEBUG_INFO_DWARF4
> >         bool "Generate dwarf4 debuginfo"
> >         depends on DEBUG_INFO
> >         depends on $(cc-option,-gdwarf-4)
> > +       select DEBUG_INFO_AS_DWARF4
> >         help
> >           Generate dwarf4 debug info. This requires recent versions
> >           of gcc and gdb. It makes the debug information larger.
> >
> > NOTE: This is on top of Linux v5.8 vanilla.
> >
> > NOTE-2: When building with LLVM toolchain v11.0.0-rc1+ and especially
> > with LLVM_IAS=1 (and LLVM=1) DWARF version 4 is a good choice.
> >
> > For details see below links.
> >
> > Thoughts?
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1086
> > [2] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674503335
> > [3] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674517876
>
> [ CC Sami ]
>
> Hi,
>
> while playing with Clang-CFI I needed this patch to fix these warnings:
>
> $ grep DWARF BROKEN_DWARF2-only-supports-one-section-per-compilation-unit.txt
> arch/x86/crypto/twofish-avx-x86_64-asm_64.S:17:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/twofish-avx-x86_64-asm_64.S:22:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/serpent-avx-x86_64-asm_64.S:17:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/serpent-avx-x86_64-asm_64.S:21:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/serpent-avx2-asm_64.S:18:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/serpent-avx2-asm_64.S:23:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/serpent-avx2-asm_64.S:28:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/des3_ede-asm_64.S:534:1: warning: DWARF2 only supports
> one section per compilation unit
> arch/x86/crypto/camellia-aesni-avx-asm_64.S:577:1: warning: DWARF2
> only supports one section per compilation unit
> arch/x86/crypto/camellia-aesni-avx-asm_64.S:717:1: warning: DWARF2
> only supports one section per compilation unit
> <instantiation>:2:2: warning: DWARF2 only supports one section per
> compilation unit
> <instantiation>:8:2: warning: DWARF2 only supports one section per
> compilation unit
> <instantiation>:13:2: warning: DWARF2 only supports one section per
> compilation unit
> arch/x86/crypto/camellia-aesni-avx2-asm_64.S:610:1: warning: DWARF2
> only supports one section per compilation unit
> arch/x86/crypto/camellia-aesni-avx2-asm_64.S:618:1: warning: DWARF2
> only supports one section per compilation unit
> arch/x86/crypto/camellia-aesni-avx2-asm_64.S:625:1: warning: DWARF2
> only supports one section per compilation unit
> arch/x86/crypto/camellia-aesni-avx2-asm_64.S:754:1: warning: DWARF2
> only supports one section per compilation unit
> <instantiation>:2:2: warning: DWARF2 only supports one section per
> compilation unit
> <instantiation>:8:2: warning: DWARF2 only supports one section per
> compilation unit
> <instantiation>:13:2: warning: DWARF2 only supports one section per
> compilation unit
> arch/x86/crypto/cast5-avx-x86_64-asm_64.S:183:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast5-avx-x86_64-asm_64.S:187:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast5-avx-x86_64-asm_64.S:191:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast5-avx-x86_64-asm_64.S:196:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast5-avx-x86_64-asm_64.S:200:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast5-avx-x86_64-asm_64.S:204:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast6-avx-x86_64-asm_64.S:213:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast6-avx-x86_64-asm_64.S:232:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast6-avx-x86_64-asm_64.S:237:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/cast6-avx-x86_64-asm_64.S:242:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/aegis128-aesni-asm.S:27:1: warning: DWARF2 only
> supports one section per compilation unit
> arch/x86/crypto/aegis128-aesni-asm.S:36:1: warning: DWARF2 only
> supports one section per compilation unit
>
> Can you please review?
>
> Thanks.
>
> Regards,
> - Sedat -
>
> P.S.: With the help of Sami I can now build and boot into Linux-kernel
> with Clang-CFI support enabled.
>
> [1] https://github.com/samitolvanen/linux/commits/clang-cfi

Some more informations to clarify this is really needed.

I switched over to DWARF version 4 when dealing with Clang-IAS
(integrated assembler).
And saw similar problems.

This was always with...

CONFIG_DEBUG_INFO_DWARF4=y

There are 156 places here on x86 64bit...

[ Clang-CFI ]

$ grep '\-Wa,-gdwarf-4' build-log_5.9.0-rc2-5-amd64-llvm11-cfi.txt | wc -l
156

[ Clang-LTO ]

$ grep '\-Wa,-gdwarf-4' build-log_5.9.0-rc2-6-amd64-clang-lto.txt | wc -l
156

- Sedat -
