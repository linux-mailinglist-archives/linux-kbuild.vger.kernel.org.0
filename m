Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5199225345A
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 18:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgHZQFx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 12:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgHZQFn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 12:05:43 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 991A7C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 09:05:42 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id r8so1916894ota.6
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Aug 2020 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=XQWIzYA+p5jxkjHERYth0VEuL1A8bmwnyMAvxJQ2nZE=;
        b=T6p63Hfaspg19v0t6clg79RBCTX7bVDm8W7OfojAh8yRD0ntijWvOLELl0dJWbdM4j
         Y42X/HCYe1f/75MMjxD/DpMqNGqj+9kCWsJgCEJ2B6+u333sb+G3znskP7XOnxVj01LR
         s+VUCO0XuStKYxfOPbPvRC1BVYieT103p2S3I7ZBAmIHgIQ68+AqIi8/5yDyg85hihJ0
         nGvSjU4BBq4H9Zyg00CiU2dzY02/vPraiLsL2I6KM6igWXHs0nh7E3YwC2ZQCKvFsuSC
         +FHrzRAnG8NT2Ln6n06ykSy/urw5PmZMrhcHIppBJfhYtxQNt0R/5hsZY2cNmxxx1Aj6
         H74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=XQWIzYA+p5jxkjHERYth0VEuL1A8bmwnyMAvxJQ2nZE=;
        b=qnP233Dro4ByicYAt1JY2TPSeNQulSyrVdOXq6FYkl4FSAdXG6aVuEhoOPuMCZ6l22
         1A4Kj6fWHUwNT5f2VGYcS4IJFRYT5xPO7QPxlcnYq2M7uneomNlgpESKbMcajyvr1In0
         PDTyIFX5dsOhjsUrZwtYAllreZyrquqSvKYOTJ9mc8tmc1lmccUp3KdUf6SlqYEe9nLm
         8vcImmdB5kH4QaDLpomHvv3jCQl5iDb5cDTJEvnuGf7B67M7lmcbcPHe6XCqxXekhNkR
         PvCjX6z7XqEfiK27LEd1HHqFt5ltDTw7FOUgd0ehkGuQ4QSpjDB0OaXFoNDkknNd7RK9
         FXNA==
X-Gm-Message-State: AOAM53334mYQNr0PLgKWGxTZ/fbtcYZ8SqZ0gYqSkTNot/S3sr8348/f
        f0FfTZ33e/lEJWCP8EdulHKo+Pki62murdZWk+I=
X-Google-Smtp-Source: ABdhPJxhp2tshzU/b9MIDYIQF7lKH64HjNbV5Uy2o0FA0/yNd9ApQV7Gfzf8nboz9lyjmd5y37BD9vmavFV+v8SG/vw=
X-Received: by 2002:a9d:7656:: with SMTP id o22mr9755977otl.109.1598457941888;
 Wed, 26 Aug 2020 09:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUV85LS08Y2qJ-mheecCrzZmCTV4B5x9kh=BGCUzQVOKaA@mail.gmail.com>
 <CA+icZUVatLDOvEZgT19eP6mL7LZoHEA_t_=gy2NTynt3-JYqoA@mail.gmail.com> <CA+icZUUuqg3crJx3svhc-XPE+vFpzYAdee3g9YtiS_+udpzkqg@mail.gmail.com>
In-Reply-To: <CA+icZUUuqg3crJx3svhc-XPE+vFpzYAdee3g9YtiS_+udpzkqg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Aug 2020 18:05:30 +0200
Message-ID: <CA+icZUU2L0AXSHgLaW-+g7QQsmWohanAHSF_3LEc3GDWU-ENqg@mail.gmail.com>
Subject: Re: Introduce CONFIG_DEBUG_INFO_AS_DWARF2 and CONFIG_DEBUG_INFO_AS_DWARF4
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 26, 2020 at 4:36 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Aug 26, 2020 at 2:11 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Sun, Aug 16, 2020 at 2:14 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > Hi Masahiro,
> > >
> > > I wondered why my generated linux-image-db Debian packages were so big
> > > when I use GCC toolchain instead of LLVM toolchain.
> > >
> > > It turned out I mixed both...
> > >
> > >    KBUILD_AFLAGS += -Wa,-gdwarf-2
> > >
> > > ...together with...
> > >
> > >    DEBUG_CFLAGS += -gdwarf-4
> > >
> > > ...when CONFIG_DEBUG_INFO_DWARF4=y is set.
> > >
> > > So I hacked up something like the following to prevent this:
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 24a4c1b97bb0..e7a8e47b0e34 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -815,7 +815,11 @@ DEBUG_CFLAGS       += -gsplit-dwarf
> > >  else
> > >  DEBUG_CFLAGS   += -g
> > >  endif
> > > +ifdef CONFIG_DEBUG_INFO_AS_DWARF2
> > >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > > +else ifdef CONFIG_DEBUG_INFO_AS_DWARF4
> > > +KBUILD_AFLAGS  += -Wa,-gdwarf-4
> > > +endif
> > >  endif
> > >  ifdef CONFIG_DEBUG_INFO_DWARF4
> > >  DEBUG_CFLAGS   += -gdwarf-4
> > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > index 9ad9210d70a1..9f11fc71462c 100644
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -257,10 +257,23 @@ config DEBUG_INFO_SPLIT
> > >           to know about the .dwo files and include them.
> > >           Incompatible with older versions of ccache.
> > >
> > > +config DEBUG_INFO_AS_DWARF2
> > > +       bool "Use DWARF-2 assembler option with debuginfo"
> > > +       depends on $(cc-option,-Wa$(comma)-gdwarf-2)
> > > +       help
> > > +         Set DWARF-2 assembler option with debuginfo
> > > +
> > > +config DEBUG_INFO_AS_DWARF4
> > > +       bool "Use DWARF-4 assembler option with debuginfo"
> > > +       depends on $(cc-option,-Wa$(comma)-gdwarf-4)
> > > +       help
> > > +         Set DWARF-4 assembler option with debuginfo
> > > +
> > >  config DEBUG_INFO_DWARF4
> > >         bool "Generate dwarf4 debuginfo"
> > >         depends on DEBUG_INFO
> > >         depends on $(cc-option,-gdwarf-4)
> > > +       select DEBUG_INFO_AS_DWARF4
> > >         help
> > >           Generate dwarf4 debug info. This requires recent versions
> > >           of gcc and gdb. It makes the debug information larger.
> > >
> > > NOTE: This is on top of Linux v5.8 vanilla.
> > >
> > > NOTE-2: When building with LLVM toolchain v11.0.0-rc1+ and especially
> > > with LLVM_IAS=1 (and LLVM=1) DWARF version 4 is a good choice.
> > >
> > > For details see below links.
> > >
> > > Thoughts?
> > >
> > > Regards,
> > > - Sedat -
> > >
> > > [1] https://github.com/ClangBuiltLinux/linux/issues/1086
> > > [2] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674503335
> > > [3] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674517876
> >
> > [ CC Sami ]
> >
> > Hi,
> >
> > while playing with Clang-CFI I needed this patch to fix these warnings:
> >
> > $ grep DWARF BROKEN_DWARF2-only-supports-one-section-per-compilation-unit.txt
> > arch/x86/crypto/twofish-avx-x86_64-asm_64.S:17:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/twofish-avx-x86_64-asm_64.S:22:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/serpent-avx-x86_64-asm_64.S:17:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/serpent-avx-x86_64-asm_64.S:21:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/serpent-avx2-asm_64.S:18:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/serpent-avx2-asm_64.S:23:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/serpent-avx2-asm_64.S:28:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/des3_ede-asm_64.S:534:1: warning: DWARF2 only supports
> > one section per compilation unit
> > arch/x86/crypto/camellia-aesni-avx-asm_64.S:577:1: warning: DWARF2
> > only supports one section per compilation unit
> > arch/x86/crypto/camellia-aesni-avx-asm_64.S:717:1: warning: DWARF2
> > only supports one section per compilation unit
> > <instantiation>:2:2: warning: DWARF2 only supports one section per
> > compilation unit
> > <instantiation>:8:2: warning: DWARF2 only supports one section per
> > compilation unit
> > <instantiation>:13:2: warning: DWARF2 only supports one section per
> > compilation unit
> > arch/x86/crypto/camellia-aesni-avx2-asm_64.S:610:1: warning: DWARF2
> > only supports one section per compilation unit
> > arch/x86/crypto/camellia-aesni-avx2-asm_64.S:618:1: warning: DWARF2
> > only supports one section per compilation unit
> > arch/x86/crypto/camellia-aesni-avx2-asm_64.S:625:1: warning: DWARF2
> > only supports one section per compilation unit
> > arch/x86/crypto/camellia-aesni-avx2-asm_64.S:754:1: warning: DWARF2
> > only supports one section per compilation unit
> > <instantiation>:2:2: warning: DWARF2 only supports one section per
> > compilation unit
> > <instantiation>:8:2: warning: DWARF2 only supports one section per
> > compilation unit
> > <instantiation>:13:2: warning: DWARF2 only supports one section per
> > compilation unit
> > arch/x86/crypto/cast5-avx-x86_64-asm_64.S:183:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast5-avx-x86_64-asm_64.S:187:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast5-avx-x86_64-asm_64.S:191:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast5-avx-x86_64-asm_64.S:196:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast5-avx-x86_64-asm_64.S:200:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast5-avx-x86_64-asm_64.S:204:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast6-avx-x86_64-asm_64.S:213:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast6-avx-x86_64-asm_64.S:232:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast6-avx-x86_64-asm_64.S:237:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/cast6-avx-x86_64-asm_64.S:242:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/aegis128-aesni-asm.S:27:1: warning: DWARF2 only
> > supports one section per compilation unit
> > arch/x86/crypto/aegis128-aesni-asm.S:36:1: warning: DWARF2 only
> > supports one section per compilation unit
> >
> > Can you please review?
> >
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > P.S.: With the help of Sami I can now build and boot into Linux-kernel
> > with Clang-CFI support enabled.
> >
> > [1] https://github.com/samitolvanen/linux/commits/clang-cfi
>
> Some more informations to clarify this is really needed.
>
> I switched over to DWARF version 4 when dealing with Clang-IAS
> (integrated assembler).
> And saw similar problems.
>
> This was always with...
>
> CONFIG_DEBUG_INFO_DWARF4=y
>
> There are 156 places here on x86 64bit...
>
> [ Clang-CFI ]
>
> $ grep '\-Wa,-gdwarf-4' build-log_5.9.0-rc2-5-amd64-llvm11-cfi.txt | wc -l
> 156
>
> [ Clang-LTO ]
>
> $ grep '\-Wa,-gdwarf-4' build-log_5.9.0-rc2-6-amd64-clang-lto.txt | wc -l
> 156
>

Hi Masahiro,

I would send a proper patch with all related information when you
agree with the handling of CONFIG_DEBUG_INFO_AS_DWARF{2,4}.

Just as note:
I tested this also with GNU/ld (BFD) version 2.35 with preliminary
DWARF4 support.

Thanks.

Regards,
- Sedat -
