Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 997911F7A40
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2020 17:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgFLPBF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jun 2020 11:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgFLPBB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 11:01:01 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03387C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:01:01 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id c75so9029692ila.8
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 08:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=N44kAK+uP3YOLDUXcbbAUJDZ6TyjvXSVhvt8s8v7zVA=;
        b=UuuQOeECEsZobMiFVN7sIPGrmX2x9xErIXkelH8gd/TfsAgN4cT0d3ff+3W/PLj/iY
         ouLlJPtbBFJb2wzhsohwOen4uYrxVGnTr3Ejv38891fvTa77/AVe1tFrpjio7QNpybfz
         H5ftQaLu8zmanHdV4PviLI7KYfsLMu2jnyWDcT/8WQ4PglboFiBErVfk3xS7lbHn82AU
         JqJ6V/ZKAkeIrHt4Svp4kjajuVAi9FgD50nt/mwMPIkRQZ+fC2wXrOXToAKFF2kHGPU6
         sdBfk21q6FoOri4ivaRvIX9ovVUrTcjYoUcVkts/MwykaoWSWVWEqU24pC14SEpUnXq/
         t49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=N44kAK+uP3YOLDUXcbbAUJDZ6TyjvXSVhvt8s8v7zVA=;
        b=A26nnI5TbQgvdVgy8p+eDdR/ErFR8Bpc3/l8Na5dUb0GtZITDVeiwZRp84U/1v24sb
         5pGKtIWMZFno3CUt+rm5M87WQZ9WJsiA84JkaOMqC45QrWUrxqBj74OgezmU0QT/2xmL
         ogxwDYisFijkyFR52PCJMvlXLtEkI0rSBfMxws2VCJYAGioi96OyQKuKRqNMiiYiUuYg
         kqFekvHoUPW2eC0icq3XaWL4Sc3W4Ia1I0C6EDKqxHlup/fYi5/rktnTf1x1b0JBHqm4
         tZaf9b6pFlOHxeUXHD3CsLx6N9Qg7xn8LlAG7OYxzHE5L66BwQWQlLW+/HcveSLvT4zF
         ccug==
X-Gm-Message-State: AOAM530Bn4PR1mGf27h3yUsjvJa9DVpeeAoZ7nC9hjg3O0g/Y+os9gON
        Izuwkx4+72LcPXz9nUKd+LrlIWym9RS744Ko0bMdrMMT
X-Google-Smtp-Source: ABdhPJxcZMDQ1fCIv+Rb16a0enR4nWNq4wESI+XqtbSMsl1HdByhVFf1Ugw3+mPq9qejn02e5BplLD2WxSdEiQ/4edA=
X-Received: by 2002:a92:3646:: with SMTP id d6mr14010082ilf.255.1591974059033;
 Fri, 12 Jun 2020 08:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
In-Reply-To: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 12 Jun 2020 17:00:47 +0200
Message-ID: <CA+icZUW8JF+2-+U4=EuvF=HgjN18P7BnfhLpMvmWxA-G7Hak_g@mail.gmail.com>
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

Hi Masahiro,

thanks for the feedback.

I could solve all breakage in arch/x86/crypto - for one issue I needed
OBJDUMP=llvm-objdump in my make-options.
So, I keep this in mind.

Can we document this in llvm.rst kernel-doc as "troubleshooting"?

Hope you are well.

Regards,
- Sedat -

>
>
>
>
>
>
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
