Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BAD248EC7
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 21:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgHRTfY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 15:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgHRTfW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 15:35:22 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6689BC061389
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:35:22 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id s15so10216366pgc.8
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Aug 2020 12:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u9n/mt8PXTBKmKuG3o+opVNeX/HejppKa6InUAJeA7Y=;
        b=fBeobjx20ZvqgMFkaNVq/ELQ1v5ovZ0pyk/PpsBmxpi2EOtH/EHH8lueVPAsHLePxq
         YDawcnBGnH+daZxg1HfI4B8CtdqRIK/gYql0D3xoQ0TUhfRELDBak23SSWlBBE4LbVjM
         GOcdv6i+CQyzRwJ8cpK17uf4nYxuLU6W0cMliF4pcpfMawc+sGUahhJuln49rIcQqoHm
         OSxljVm9vdqfUgJmt4mCJKFsl9lTEDSfZgznOdmKH74aSCTe9uYNY2txxR95Y8g9Wf3o
         hYgPfBsNJXhBJN8HzVJWdZxcdF4KCntNSoxeabAYJ+OODBWch4MTEyN02YpX5m3Otqjx
         1jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u9n/mt8PXTBKmKuG3o+opVNeX/HejppKa6InUAJeA7Y=;
        b=PXl0BFjQaKCluDKDsOy15hIu1+mSP+bIfl++AX07uErHURNR8HRihnNMKF5eHEv6PX
         grWn9zjkdEUCgBO8e5XwrDveZPuCsBtBWlOXaw0LmVYPp4TJUUBS14Ib2BCTiqpdrps9
         bdhB0eahL6IJxqdncFecxybBUdBmZvD393Ta1ZXL5GYJre+oOdvltTkIoNMvSdxJTAHz
         /xWes/wVhxpGF9o4IPWV8krlaYTeVH54GDaFP/H0DoPdd6VlUcjXGRdQ6EoRgg6rEiJZ
         e8PXcUSVrQqbBMaJf5fFUvb5PIrUkeKgb33OZr9tNCNnAh2jIcNQopVExOj2RrIxGJB7
         2w4Q==
X-Gm-Message-State: AOAM5304iUBPpW+h8PtVYrbokXIJrpUiy6YCW55Etfbps/Ovr0EITBsM
        s/SMtL+fS2oqirO0xKwv/EvqvT3y9lk5w6xgReAmBw==
X-Google-Smtp-Source: ABdhPJwg/txuAGDnuge1cNZ+FrLSNw6Czt9c1sqa0XhG3sA4ynkEYxXs89gPXSKRX1CqOZzs+gt2l8OQKyvMRO6DFvg=
X-Received: by 2002:a63:7d8:: with SMTP id 207mr14800708pgh.263.1597779321639;
 Tue, 18 Aug 2020 12:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com> <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
In-Reply-To: <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 18 Aug 2020 12:35:10 -0700
Message-ID: <CAKwvOdmUB1VtfQNJaRgK-KKOyyhzP3XbcnH818gb_RygYFRUqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     "H. Peter Anvin" <hpa@zytor.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 18, 2020 at 12:03 PM H. Peter Anvin <hpa@zytor.com> wrote:
>
> I'm not saying "change the semantics", nor am I saying that playing
> whack-a-mole *for a limited time* is unreasonable.

Ah, ok then.  Sorry I mischaracterized your position.

> But I would like to go back
> to the compiler authors and get them to implement such a #pragma: "this
> freestanding implementation *does* support *this specific library function*,
> and you are free to call it."

I think the first thing that would be helpful is some more detailed
write up of the problem statement, and analysis of why the current
provided tools are close but not enough.  Maybe filing a Clang bug
would be helpful to get more feedback from additional toolchain folks
than just me (https://bugs.llvm.org/enter_bug.cgi?product=clang "new
bug" component).  Alternatively, if you're planning on attending
plumbers next week, I plan to propose a "kernel toolchain" mailing
list for folks with whatever background to discuss future GNU C
extensions and how they might be used in kernel development.  That
might be more appropriate than a Clang bug, but it doesn't exist yet,
and feedback might be that it's a terrible idea for some reason.

> The only way we can get what we really need from
> the compilers is by speaking up and requesting it, and we have done so very
> successfully recently; further back we tended to get a lot of
> language-lawyering, but these days both the gcc and the clang teams have been
> wonderfully responsive.

Just trying to avoid the shoe, again.  I'd really like to get to the
point where we can untangle putting out fires from implementing
feature requests though.
-- 
Thanks,
~Nick Desaulniers
