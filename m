Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D1C24E2C6
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 23:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbgHUVjj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 17:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbgHUVjj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 17:39:39 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06E0C061573
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 14:39:38 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id t23so3418301ljc.3
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fmQQDVMXbn1xkliDoKeEU74auHxtHQpL4ZkAUewHmqw=;
        b=gfwHC9xeYNz7EUpsz/d5a69ffJsRioVxivkh2vW/TF4IoWRw3IP7tqtfK1M2BdovRD
         BqR5TXoGfgnoGPiVUutu4293iBXetWkpFRZW47K9qMBDXtc3lD7qcD5MTZFqIHAqEy7Z
         fvQROxcppyhgOJ17j77yZkQ1SOQxSLwO/qOY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fmQQDVMXbn1xkliDoKeEU74auHxtHQpL4ZkAUewHmqw=;
        b=EGfcwaHy5xkrOo6jLFaoNwtPr3Y1nZi0c6zMsoYdiHger95gYX9UmnVlvKjs2IJdAw
         9XVcdwYo4bC+GbRTgNRGevgrf4SvPU4WB2xmb4SX0lylhTr5zEZHihkY8aolfP7ddci8
         vzh4acMj/R2U0isaHBLXQLmIDaqHONj3tdOxRRqXtBTvNfVT5R1iAcUdfgVrmh3tKibJ
         5yGqtrMGOxqvZLx6apPuOdG3i5L9zyEDgjIPher8Ju9j1cLF4Q0SpnzjW8GAwGS3NYVR
         08xgkzYgN06zfDD2bbcCfhrfHEPn5hFMDB+0XD7VOI4gkWz5E33tHAr7DAfEGaX/doa7
         bDVQ==
X-Gm-Message-State: AOAM530koHq8aZrRxLn3dMLhRoJMdYEYEQI9gC7XFsv5EaUhkf6XRXMb
        kH6WO7SNisbIixXK+ZLceHIWZgRf5yOhQw==
X-Google-Smtp-Source: ABdhPJzGBkK8HeVBX67VdWYdu3hUX27cXW7R/TyyGP7x9w2y7KmiaU1nyv2oNBq04gjpcCY0hsaQXw==
X-Received: by 2002:a2e:a49c:: with SMTP id h28mr2438099lji.234.1598045974997;
        Fri, 21 Aug 2020 14:39:34 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id x14sm627042ljd.1.2020.08.21.14.39.32
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 14:39:33 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id i10so3419034ljn.2
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2020 14:39:32 -0700 (PDT)
X-Received: by 2002:a2e:7615:: with SMTP id r21mr2253045ljc.371.1598045972531;
 Fri, 21 Aug 2020 14:39:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan> <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan> <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan> <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
 <20200821172935.GA1411923@rani.riverdale.lan> <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
 <20200821195712.GB1475504@rani.riverdale.lan>
In-Reply-To: <20200821195712.GB1475504@rani.riverdale.lan>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 21 Aug 2020 14:39:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgXHhN5MSOLeE_7rMPoGknrSxmOOJVLBa4jkz38J4gHgg@mail.gmail.com>
Message-ID: <CAHk-=wgXHhN5MSOLeE_7rMPoGknrSxmOOJVLBa4jkz38J4gHgg@mail.gmail.com>
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

On Fri, Aug 21, 2020 at 12:57 PM Arvind Sankar <nivedita@alum.mit.edu> wrote:
>
> Look, four stores into memset(), yeah that's a bit weird. I didn't think
> you meant "four" literally. But in any case, that has nothing to do with
> the topic at hand. It would be just as bad if it was a 16-byte structure
> being initialized with an out-of-line memset() call.

Actually, I mis-remembered. It wasn't four stores.

It was two.

We have this lovely "sas_ss_reset()" function that initializes three
fields in a structure (two to zero, one to '2').

And we used it in a critical place that didn't allow function calls
(because we have magic rules with the SMAP instructions).

And clang turned the initalization into a memset().  Which then
triggered our "you can't do that here" check on the generated code.

This is the kind of special rules we sometimes can have for code
generation, where the compiler really doesn't understand that no, you
can't just replace this code sequence with a function call, because
there are things going on around it that really mean that the code
should be generated the way we wrote it.

> But coming back to the actual topic: it is fine if the compiler turns
> four stores into __builtin_memset(). A size-16 or -32 __builtin_memset()
> will get inlined anyway. There's a lot of garbage here if you look
> closely: check out what gcc does to initialize a 7-character array with
> zeros at -Os.

Yeah. The reason we had to make -Os be a non-preferred thing is
because gcc has some really sad things it does when optimizing for
size.

I happen to believe that I$ matters, but -Os made _such_ a mess of
things that it was untenable to use ;(

              Linus
