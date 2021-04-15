Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923333611A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 20:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234369AbhDOSEB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 14:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233687AbhDOSD7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 14:03:59 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF98BC061760
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 11:03:35 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x19so10175104lfa.2
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 11:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F59qFWjXIgpvV4ZN+CZ30hb3C7uuWkssKg5Jbmq7Ww8=;
        b=G/NT4J14rCpD8NA8d8MBv0FXKoPW385KyYuoW969O2aWtfyO/hJZYF+odetZ4qBA6e
         E0z4YmLm/kz2oIhJ/BszpZQKX4R9gcEbhdh6mqRAnU+ANIaPsfPe3x/4qbyVWqBVIaY4
         hdNfhxkMIek13GWVpyLWEEh/nj+CipxPHh7d0/ZMEqamPRTHJ8OP9Dpy5Mq3TiulmxqO
         XXsMSaNvN06qzDkqa5eIxaDM4kY8HgKk4nza/Y++YEZ9QmbYM10J1qaUTNEJmIKBrMzR
         lKffAR9VeBNvYyU/+eyPVugQv5g7b5T7fqposkOYVpxU4YOE3sCROkgwggF44eli2Qxe
         V3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F59qFWjXIgpvV4ZN+CZ30hb3C7uuWkssKg5Jbmq7Ww8=;
        b=pSiXFzds0PTXJ9lkFklnNqGNEbrv/aSzrLdipT1Xa9V8ve8H5LHvJIo9sXCUolOwwK
         ElafnAF3gx8ffxSfRa4sLYIVuvcPIXOca9EERhmxZo4viouZ5FOsqFCiGxWNXSlPd0UZ
         xplyNPRzDZOSfVQq/UZKnFotto60V5G9/KzhBkAqRbKcIA3pYbbb5RSK23T4OAu0XOce
         6H+M2984D8xt+lH6PmN8iJJ4rxaxbBp0ilyYvns1G5SIYEGTwO3OXzwElwkGNiYVBRI7
         LmfMbWvUz1i2qCQ0Htsm4Gr/laGoPEAPjNAhkI5joWVQ7hqs7g7i2sWsbO1pitioDy32
         0qqA==
X-Gm-Message-State: AOAM530+CvOm68XKobr90x4KCyumLDUeOt6CEtiHse/2tWdylPD0rT6J
        6KRTgW4BU80eW9OGAA0He+6aNwD7HlZ+dF8loRpQOg==
X-Google-Smtp-Source: ABdhPJySCFix/QLobkMr+mNd4p1eh6+V52WoYufupnbXAoEB0kYBV4dx1xGZvJwbl8wweHAwSTgTOP9NMCfUKyp9nvs=
X-Received: by 2002:a05:6512:1046:: with SMTP id c6mr238636lfb.297.1618509813998;
 Thu, 15 Apr 2021 11:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <CAKwvOdkjttdX83tL4pw+J5EnHM1MgEYDPp=YTpEagV4RrhdxwA@mail.gmail.com> <CANiq72ksLeuL_uqoqbf3fhLP7M0j-7TdEvRDDmxThdmrEqD2Lw@mail.gmail.com>
In-Reply-To: <CANiq72ksLeuL_uqoqbf3fhLP7M0j-7TdEvRDDmxThdmrEqD2Lw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 15 Apr 2021 11:03:22 -0700
Message-ID: <CAKwvOdkyRkR0Jj5w5HWJ+o4YpOrLfTY1Vjho0bDn60fgRE-pkA@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 5:43 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Apr 15, 2021 at 1:19 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > -Oz in clang typically generates larger kernel code than -Os; LLVM
> > seems to aggressively emit libcalls even when the setup for a call
> > would be larger than the inlined call itself.  Is z smaller than s for
> > the existing rust examples?
>
> I will check if the `s`/`z` flags have the exact same semantics as
> they do in Clang, but as a quick test (quite late here, sorry!), yes,
> it seems `z` is smaller:
>
>       text data bss    dec   hex filename
>
>     126568    8 104 126680 1eed8 drivers/android/rust_binder.o [s]
>     122923    8 104 123035 1e09b drivers/android/rust_binder.o [z]
>
>     212351    0   0 212351 33d7f rust/core.o [s]
>     207653    0   0 207653 32b25 rust/core.o [z]

cool, thanks for verifying. LGTM

> > This is a mess; who thought it would be a good idea to support
> > compiling the rust code at a different optimization level than the
> > rest of the C code in the kernel?  Do we really need that flexibility
> > for Rust kernel code, or can we drop this feature?
>
> I did :P
>
> The idea is that, since it seemed to work out of the box when I tried,
> it could be nice to keep for debugging and for having another degree
> of freedom when testing the compiler/nightlies etc.
>
> Also, it is not intended for users, which is why I put it in the
> "hacking" menu -- users should still only modify the usual global
> option.
>
> However, it is indeed strange for the kernel and I don't mind dropping
> it if people want to see it out (one could still do it manually if
> needed...).
>
> (Related: from what I have been told, the kernel does not support
> lower levels in C just due to old problems with compilers; but those
> may be gone now).

IIRC the kernel (or at least x86_64 defconfig) cannot be built at -O0,
which is too bad if developers were myopically focused on build times.
It would have been nice to have something like
CONFIG_CC_OPTIMIZE_FOR_COMPILE_TIME to join
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE and CONFIG_CC_OPTIMIZE_FOR_SIZE,
but maybe it's still possible to support one day.  (=C2=BFPor qu=C3=A9 no l=
os
tres? Perhaps a false-trichotomy? Sorry, but those 3 are somewhat at
odds for compilation).

Until then, I don't see why we need to permit developers to express
such flexibility for just the Rust code, or have it differ from the
intent of the C code. Does it make sense to set RUST_OPT_LEVEL_3 and
CC_OPTIMIZE_FOR_SIZE? I doubt it. That doesn't seem like a development
feature, but a mistake.  YAGNI.  Instead developers should clarify
what they care about in terms of high level intent; if someone wants
to micromanage optimization level flags in their forks they don't need
a Kconfig to do it (they're either going to hack KBUILD_CFLAGS,
CFLAGS_*.o, or KCFLAGS), and there's probably better mechanisms for
fine-tooth precision of optimizing actually hot code or not via PGO
and AutoFDO.
https://lore.kernel.org/lkml/20210407211704.367039-1-morbo@google.com/
--=20
Thanks,
~Nick Desaulniers
