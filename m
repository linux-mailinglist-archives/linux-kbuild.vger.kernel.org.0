Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9DD71F7A5B
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2020 17:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgFLPJq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 11:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgFLPJq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 11:09:46 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9913CC03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:09:45 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t8so9064845ilm.7
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=CdpLzJ9i3UZ9URUnuQf3pO9S/JKIGeM7wnwdGp+s3GI=;
        b=UBEo64CWNdrvTW+LCKj447CUD2jxYhsphUD02Gzn377imO7enEhR5CTc2tFj2d8EWt
         91MD8GPxPvTWtnRyKy6ygHWu77CPGk4K/emBu3/nSx4W+N3QH1+cbL3TpuMnQMvxfxul
         WV+rb4CFW2ObjZ1GDlvjWD1H9efy93ttToLtRF1lfmP9HBvhk6KdvX6atHS4BTN30KNH
         a3Zg8iFnXTtfeiaywzl9NoikEC5vf7vloIg1x4EZwoapbn3law1tys/PVA2nCEAi5WLA
         5zL0yMAaTVnBFPA0XuIXoDcTUZekrLeqx4mezXKveV6DjQERpQlDIl0cYX0GXgWXi9HL
         ub6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=CdpLzJ9i3UZ9URUnuQf3pO9S/JKIGeM7wnwdGp+s3GI=;
        b=hbKgftzHUQ/cgfCFoGVBI3RaZV5Pg4vNyzva9r4grV3+3gcpi9cIdUrzfAwnWPF0Cw
         MHVixxwB9b9tsqnZNCJ/MXS5IQTPfAqVDowgiiWpjtuOBzoljZNjE2btxcu3Solpdicn
         R6ayhhtF2PcHmlirT1A/fPZ2xT8xMb3mPlQoBPx/bOMsyltXHrJP2BOcTKk6XopfmyYg
         wBbUClXP4+lIqK8iX9Dev0k29qvlkxzMKLY6x5597JX2NBWwR/jptrKvkLqAAmZDYQ+a
         1m4zVvZtRjMvVLkUWjw4wJ9ImkbJByEYw75OTvbScFvQRmkFi/rWNUTmy/C3Yt4FSGVz
         9fxQ==
X-Gm-Message-State: AOAM531DhwZR6DAWg56ML0Y/444yw9OAMLzu2gTrTg4S/wORDAPXDWaJ
        tchqKwL3coi5OARRTnKCOYs5pWLmi0LGfbOxr30=
X-Google-Smtp-Source: ABdhPJw6jmnaQOMEwHZLsKTiiVcwxEdcyCKUl77PXhXOhS+dsoZ+E8adj3LzkABKAXV072ycolxYUOLC+WE2Zxyq59g=
X-Received: by 2002:a92:498d:: with SMTP id k13mr13781323ilg.226.1591974584188;
 Fri, 12 Jun 2020 08:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
In-Reply-To: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 12 Jun 2020 17:09:32 +0200
Message-ID: <CA+icZUUhq5cbUV+_pd6SxKbj__OFcpZEvRA9Op7eGMGbvJRb=A@mail.gmail.com>
Subject: Re: x86/crypto: Set -no-integrated-as for specific object-file when
 building with LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 12, 2020 at 4:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
>
> On Fri, Jun 12, 2020 at 10:47 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > I am trying to build with clang-10, ld.lld-10 and LLVM_IAS=1.
> >
> > I fell over some problems in x86/crypto area where I have found fixes.
> >
> > But how on hell can I set -no-integrated-as for specific object-file?
> >
> > [ arch/x86/crypto/Makefile ]
> >
> > ifdef LLVM_IAS
> > KBUILD_CPPFLAGS += -no-integrated-as
> > endif
> >
> > ...at the top sets -no-integrated-as for all object-files.
> >
> > I have two broken object-files (or more exact the corresponding *.S
> > file is broken):
> > #1: aes_ctrby8_avx-x86_64.o <--- FIXED
> > <https://github.com/ClangBuiltLinux/linux/issues/1008>
> > #2: crc32c-pcl-intel-asm_64.o <--- PATCH exist - does not work for me
> >
> > I tried...
> >
> > CFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> > CLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as
>
>
>
> The source file is .S (assembly file),
> so
>
>    AFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
>
>
> Or,
>
>    asflags-y += -no-integrated-as
>
> , which is effective for all .S files in the directory.
>

It worked - here adapted:

git diff arch/x86/lib/Makefile
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 619107bec0d9..ff6ae9ecb0ab 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -3,10 +3,6 @@
 # Makefile for x86 specific library files.
 #

-ifdef LLVM_IAS
-KBUILD_CPPFLAGS += -no-integrated-as
-endif
-
 # Produces uninteresting flaky coverage.
 KCOV_INSTRUMENT_delay.o        := n

@@ -39,6 +35,9 @@ obj-$(CONFIG_SMP) += msr-smp.o cache-smp.o
 lib-y := delay.o misc.o cmdline.o cpu.o
 lib-y += usercopy_$(BITS).o usercopy.o getuser.o putuser.o
 lib-y += memcpy_$(BITS).o
+ifdef LLVM_IAS
+AFLAGS_memcpy_$(BITS).o += -no-integrated-as
+endif
 lib-$(CONFIG_INSTRUCTION_DECODER) += insn.o inat.o insn-eval.o
 lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o

So, only memcpy_$(BITS).o is built with -no-integrated-as flag.

Thanks.

- Sedat -

> > or
> >
> > CPPFLAGS_aes_ctrby8_avx-x86_64.o += -no-integrated-as
> > CPPFLAGS_crc32c-pcl-intel-asm_64.o += -no-integrated-as
> >
> > or
> >
> > cflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> > cflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
> >
> > or
> >
> > cppflags-$(CONFIG_CRYPTO_AES_NI_INTEL) += -no-integrated-as
> > cppflags-$(CONFIG_CRYPTO_CRC32C_INTEL) += -no-integrated-as
> >
> > All above also with "-fno-integrated-as" at the top and at the bottom
> > of the Makefile.
> >
> > Can you give a hint?
> >
> > Thanks.
> >
> > Regards,
> > - Sedat -
> >
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1049
> > [1] https://github.com/ClangBuiltLinux/linux/issues/1050
>
>
>
> --
> Best Regards
> Masahiro Yamada
