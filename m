Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4021E250695
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 19:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgHXRgl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Aug 2020 13:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgHXRez (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 13:34:55 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA50C061573;
        Mon, 24 Aug 2020 10:34:54 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id r19so4098751qvw.11;
        Mon, 24 Aug 2020 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=R/gjJ6j/FhaneyBpj6umF/HqEi7YvQW6Fq+8r2981jM=;
        b=d8erb2eTlwZ4WAHJZlxNDI0FqxDuU1CBLpFiKi/vhcy2efTmjgZOPAvl0ShimQe6Nr
         hS1JmW55UDx0ClxiyolNWUCthFTJg5VZW4q6hag+yBmcM07jq0+IPO6ZWBIxOMQ1K1L+
         irMnwBPwVdbXoKhNT6VKo9E/iSGUhQL4Fu2uYM6Aj+Cw37uPrXTRye9DC7rXKWxvCeQk
         XeUgGfkEtMqJZt4vcp99utQH7hDdRX1MHJxkBXbWIqdjUmymdKtuNI9sUmBnUd4ZnW4K
         UkZ76NfS2AlW/XXvy8VJQtQdrky3zBcoyoLmPDTZGZLjjHWGotKMUQpq0XLKjKrDiuRh
         U1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=R/gjJ6j/FhaneyBpj6umF/HqEi7YvQW6Fq+8r2981jM=;
        b=mMxzlLnlWYSxsA3aYzIAkXlQleb7W6d9fOOZ2Ad5nykSKROXbiUf2fd+UVZrE9XiEk
         troc9kvtbcbWd/wnm7mUTYU2HwnNv0I0Xrpja4Z/L/qYOd6fYsau9AENF/YRJU3JbFXK
         IzNlr9C8zfOIYcSPmmMzouTFb2umHi2mLgQ3A0LLWYshAsUxL+5xtRrPF+aJc95Vz7tH
         zm54sIpMAVLfxgtK1sFh/1FEwSA1I0wHWUex3mA0GlvR5KVLtcZ0TY+t6chhfssghe4l
         kXQ7RBv5F/hnlim5p1xrRXTGpdr4vzggBVtWGGGYX+7uCU1zgWw8i9YjM3tqx0ezIF+4
         KrLQ==
X-Gm-Message-State: AOAM5329f1YHYdL2lM0BfoqSo7CZuAAbjTRxHnz2G6HUp7EuZIlg2w0a
        2yU4sdGJFeEblMjIZ9sdqzE=
X-Google-Smtp-Source: ABdhPJzMpu2lu0shOslZt9c27kd6KgRSA79fzx/p2mRpGxB9rGahuMot4Eed2b46wQK147HqDIaprg==
X-Received: by 2002:a0c:d98d:: with SMTP id y13mr5968347qvj.203.1598290493720;
        Mon, 24 Aug 2020 10:34:53 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id d202sm249016qke.38.2020.08.24.10.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 10:34:52 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Mon, 24 Aug 2020 13:34:50 -0400
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
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
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200824173450.GA4157679@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan>
 <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQmWBPV4nZ0xPdSHEt=DipHmR40co827voGOFN=2j47BQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 25, 2020 at 12:57:22AM +0900, Masahiro Yamada wrote:
> 
> 
> To prevent transformation from foo() into bar(),
> there are two ways in Clang to do that;
> -fno-builtin-foo, and -fno-builtin-bar.
> There is only one in GCC; -fno-buitin-foo.
> 
> Is this correct?
> 

It looked that way from previous experimentation, but...

> 
> 
> I just played the optimization
> from printf("helloworld\n") to puts("helloworld").
> 
> https://godbolt.org/z/5s4ded
> 
> 
> -fno-builtin-puts cannot prevent clang
> from emitting puts.
> Is it because clang does not support
> -fno-builtin-puts?

Ugh. clang doesn't have __builtin_puts() but it optimizes printf() into
puts(). It doesn't have __builtin_putchar() but will optimize
printf("c") into putchar('c').

And it has .. half of __builtin_fwrite()? fwrite() of a single byte gets
optimized into fputc(), fprintf() of a string literal gets optimized
into fwrite(), -fno-builtin-fwrite prevents both optimizations, but
__builtin_fwrite() gives a compile error.

I give up.
