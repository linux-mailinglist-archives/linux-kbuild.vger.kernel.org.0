Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CACD24DF0C
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 20:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725885AbgHUSCe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 14:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgHUSC2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 14:02:28 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 784C9C061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 11:02:28 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id m22so2805714ljj.5
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 11:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W5jlbfKRCl3JIOGz2Ss/o2Y7bPu9rBvFEngYmreq1Cw=;
        b=XdIrKLreG3mWA0Sd5hGpTYI4JB4BZR668IVI8Q/2P4m+46HsQmwrBjgqHESZb6n9zJ
         QHgdBE8kWpe39ioWRxyYwUfSIq+91IB9t13h/N7011Gb97HTKzOp+ui928AEOkIbRhXP
         QclUoQWTcwkjMCaHsF+xRHWLLfxntTzt9G7EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W5jlbfKRCl3JIOGz2Ss/o2Y7bPu9rBvFEngYmreq1Cw=;
        b=GxaBuNJjvJzMTTyhZrDmMv/a8vSebvF/+e0VYaGGRyUoqV2LoKm57Z1tX+PotwhNbY
         rOWc6umGRyPxK/OJB5i2kekEt7IdBBVgkqVuMP9zZ8j6et8cugQKm1V+iJjJRn/DnqUn
         0ZCTC/MGE+tGeh88VMXBFqYBxYUaAohw95SkKsPhZgTr/dUmTxXdMsI07EcHtQpRc2LX
         cbbOjlsh79avR56xDm4DuzOi1/P1OvGrpRYJW9YeEsH6sEecmUJF7L9JrOqfHrGLOkL8
         R0nVX+RFzPY4blmCKHReMehEMwhMBXHzS7vClOeJr756vZQpqXIugu9bUJUpTmuxalyv
         Ya9Q==
X-Gm-Message-State: AOAM533QU4rGeWgE04PXlEyzS+aW9ZuUxC7I1tr5zShCCkdk6x3Vx9/4
        jTo1WsJ77k2JKElweZ0EytMBE2048s41EA==
X-Google-Smtp-Source: ABdhPJwZKnrnzwTto50Ovi6gDqXKePcYiJPPWldhObWWRyg+j+L9+zFcKDNLpCUBqkhpnjA0fHNBOA==
X-Received: by 2002:a2e:141d:: with SMTP id u29mr1964482ljd.122.1598032946334;
        Fri, 21 Aug 2020 11:02:26 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id e23sm516154lfj.80.2020.08.21.11.02.24
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 11:02:24 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id w25so2775641ljo.12
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 11:02:24 -0700 (PDT)
X-Received: by 2002:a2e:545:: with SMTP id 66mr2226306ljf.285.1598032944089;
 Fri, 21 Aug 2020 11:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com> <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan> <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
 <20200821172935.GA1411923@rani.riverdale.lan> <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
In-Reply-To: <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 21 Aug 2020 11:02:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjVCTjZG0Y88WhJruLdbxF=7q3mmFThD+N5WK0P5giSw@mail.gmail.com>
Message-ID: <CAHk-=whjVCTjZG0Y88WhJruLdbxF=7q3mmFThD+N5WK0P5giSw@mail.gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
To:     Arvind Sankar <nivedita@alum.mit.edu>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
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
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 10:54 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Aug 21, 2020 at 10:29 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > This is why I'm saying clang's no-builtin-foo option is useful for
> > embedded: it doesn't prevent the programmer using __builtin_foo(), it
> > prevents the _compiler_ using __builtin_foo() on its own.
>
> And that's fine. But it's apparently not what gcc does.

Oh, testing it seems to say that that is exactly what gcc does too. I
must have misunderstood some comment in this thread to mean otherwise.

                Linus
