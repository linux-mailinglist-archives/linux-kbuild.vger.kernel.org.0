Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30AD13113F6
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 22:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbhBEVyJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 16:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232977AbhBEVxz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 16:53:55 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B68C06174A
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 13:53:15 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id f6so8739827ioz.5
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2021 13:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=z1LEn6yxJuon6YlG2B6eLh3pMTBV9iCgiAzgEn6jtMA=;
        b=fwz9o8BDX+Y+8h2cJdzzmdscEDH0HGDbiCkY2n+mZPL7nFIKmEjcH0P88iTFxvGhf3
         c0eQbHkAtdrMg8W/zEy+fFor9Nb2ZAJL5kkO4JqAy0zfdQXjVFkWFI5dxlBysJK737tB
         jMPNuTDv+JvTDJf9RK0H+gdeamej8bHpHo5nYKMoD90/qRwsKtnjzlCClJ0RuluACDDz
         AiFkggPSL+fPR8XmAKfHayssv8LhefP673UKf+qNDf/v0/bu1MmUEK3HbkIwA1CRlwTe
         Ztdmwvc8GlAGYuCkcsqu9+WsCn+P6gStpaP38BXJwRBZPS+roDWB7feV0zpD/TteZFL1
         VH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=z1LEn6yxJuon6YlG2B6eLh3pMTBV9iCgiAzgEn6jtMA=;
        b=Aa83AO+/vAJOL3Blts77xtN4JQSiVFcfu58rIrjmDxHZcS5MLS2HEF2r4A/93f/4cM
         0Fyo/LJUFi1meZC9Uk6b4R+5rTnf/S4J4ttT9+b/O8beTyfDRwtx7Uqq4F1zE0kpe91f
         N86/PctfgK9dvIHj+tX02Y3WQLSEr5AMk7HHkqL0jnxM3FGNFRCzs1s/j2J2xgPpebDF
         72qAAnSdc7qtL3AYrWvmrtz1J1NHi+IR5WCcR3rP8AFo1mltn+oQnMxDn9tZymQgIyeA
         mgOkLjmK2DlA9buh/QQYNr0ERTSwLVKDmqw6nLIpb1Jk6HZsr8pHnlNMnhYtrBAIl2uC
         WDTg==
X-Gm-Message-State: AOAM532orKr3ex8v7PA/Z7OpCf8TsWDuXqkf6KrewQ827VIZR0ZgwCP5
        YErVTWq0F/bV7BlMB3kyZhs15rc62xU+L4AHsGE=
X-Google-Smtp-Source: ABdhPJwBhU2UfooCRZeh6/2OU/2Kw6DWhEKOBzMDYC6e8yDhlwWD7P2KVDARcmGVgKsrt5vvT3w39BM5fpmgCqZ/cs4=
X-Received: by 2002:a05:6638:251:: with SMTP id w17mr6875651jaq.138.1612561994965;
 Fri, 05 Feb 2021 13:53:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
 <20210205213651.GA16907@Ryzen-5-4500U.localdomain> <CAKwvOdk8vp5z71pQHG04REENSy15Z3DvY1MehS_GGVxnhXx_cg@mail.gmail.com>
In-Reply-To: <CAKwvOdk8vp5z71pQHG04REENSy15Z3DvY1MehS_GGVxnhXx_cg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 5 Feb 2021 22:53:03 +0100
Message-ID: <CA+icZUXf0P-Fe00tg1ZqehNf=D6aiJVsy2DH85E_fJF7pPm9dQ@mail.gmail.com>
Subject: Re: Using GNU AS from a selfmade binutils v2.35.2
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 5, 2021 at 10:44 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Feb 5, 2021 at 1:37 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > It is entirely possible that '--prefix=' should always be present though:
> >
> > diff --git a/Makefile b/Makefile
> > index f5842126e89d..409822f45bfd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -562,10 +562,10 @@ endif
> >  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
> >  ifneq ($(CROSS_COMPILE),)
> >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > +endif
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> >  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> > -endif
> >  ifneq ($(GCC_TOOLCHAIN),)
> >  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> >  endif
>
> I'm unsure. Consider the case where I'm building with `LLVM=1
> LLVM_IAS=1 CROSS_COMPILE=aarch64-linux-gnu`, ie. no GNU binutils and
> am cross compiling.  In that case, we should not be setting any
> --prefix or --gcc-toolchain, and yet today we are.  Perhaps that is
> orthogonal though?
>

Nathan and Nick, Guys - you are really great.

Big thank-you for your feedback.
But I am out - the whole today I build Linux-kernels...
"My head is empty." (Kofi Anan)

Today, I remembered it is exactly one year we met in Zurich @ 1st
ClangBuiltLinux meeting :-).

- Sedat -

P.S.: I asked Matthias Klose why binutils v2.35.2 is delayed - it's
ready on <salsa.debian.org> Git.
