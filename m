Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602CF24E16E
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 21:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbgHUT50 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Aug 2020 15:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbgHUT5U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Aug 2020 15:57:20 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248A4C061573;
        Fri, 21 Aug 2020 12:57:16 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id x6so1165831qvr.8;
        Fri, 21 Aug 2020 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k+4XZNh46tQodzmg/xUy/8GIixmIB+1d/WsBtrZ1Ubg=;
        b=Z4B9tAPgW5SvcHiOzgbxc/F4zHF/I+bki4RLmgcHk+0onqv9UteNNJ3rSul7lzVfEl
         kSJvvr/Vev023ltyYllnmUlFPc12nWDrRxWTfIhhrP2gHFZ+m9fw6oULpKjCM0kvQKyG
         Bm8h561pW/Kfo1p+wuo5A2GmbZn3mG3yZRGwFbs4t6sxLlejz9rGHNuKRnI3y5Qn2jLZ
         KMi7jLZxaXg1Fs9tOhQOJL8z/3RDv/frISZrV0YuaboGBe4fGsft2qKWOhcQLK1+LBUp
         C3yjcc00TgL++Y7AOxnRmZihHcb/XUjNuZbw9JSDpbEziiY7TWgUurLvoG01ekfQtMMv
         9erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=k+4XZNh46tQodzmg/xUy/8GIixmIB+1d/WsBtrZ1Ubg=;
        b=dGMnp5t/iMgaNhPTQDGav+VWacoBhV6Fh5NT/TBYHerz16+gsEe0vuqDEFI+3F9Czh
         /rBhDM/LdEbqJeHZbKh2q0Y9JcknH05xV/SzZWaNhXuxEntCJIp2fbR+1OPasBFG34As
         WObXGQY+51GEtZlnMIgllALGEo9IAVPf5WPFyD4MVEqCC1kR8yda3bFSXTCAjhbhuJPO
         5q83+/smE7Wr0kM+k9UcK6nXwG2OjZ7PEyP/gtNfPlgBEY63m82R1E9gpjOV4D2yW9Cj
         kdhfXUUJl9iEZyjJcxLE57lFGF2hgSMYVBZVx5IMVkkWZq6132O+7V1/w58CpTnNEMNs
         FcJA==
X-Gm-Message-State: AOAM532YyeEJ05l3mKri5X+H/0KCbMw/MPjsCMvQQZMPK99v6UcgHVJg
        9Bdv36sYarsVfLPgHoKGfTE=
X-Google-Smtp-Source: ABdhPJwPhTsTYDyqXS8gWAoUUBdvx2Y91gJoiZM3uyZwFSX4luTmMYsb1GBGDxNiRNSlmjmD3L7t+A==
X-Received: by 2002:a0c:ea45:: with SMTP id u5mr3736023qvp.191.1598039835149;
        Fri, 21 Aug 2020 12:57:15 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id m17sm2973705qkn.45.2020.08.21.12.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 12:57:14 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Fri, 21 Aug 2020 15:57:12 -0400
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
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
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200821195712.GB1475504@rani.riverdale.lan>
References: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan>
 <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan>
 <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
 <20200821172935.GA1411923@rani.riverdale.lan>
 <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 21, 2020 at 10:54:57AM -0700, Linus Torvalds wrote:
> On Fri, Aug 21, 2020 at 10:29 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > This one is slightly different from the previous one. The first case is
> > really a call to __builtin_free().
> 
> No, the first case is a disgrace and a compiler bug.
> 
> We've had a situation where gcc complained about a static function
> called "free()", without any header file inclusion, and then
> complained about it not matching its idea of what "free()" is.
> 
> Which is pure and utter garbage.
> 
> It's like you have a local variable "int free", and the compiler says
> "hey, this doesn't match the prototype that I know this name should
> have". It's BS. You just saw the user not just *use* that name, but
> *define* it, and do it in a scope where the complaint is irrelevant
> and stupid, and when we hadn't even included the header that would
> have resulted in conflicts.
> 
> IOW, it's an example of a compiler that thinks "it knows better".
> 
> It's a broken compiler. And it's an example of the kind of breakage
> that compilers absolutely shouldn't do.

That's -Wbuiltin-declaration-mismatch, and can be turned off, and it
won't warn if you have -fno-builtin-free. I don't completely agree with
you, though warning for static functions is a bit overzealous. For an
external function, especially something more obscure like stpcpy(), I
appreciate the warning.

> 
> The second example is from clang doesn't something horribly horribly stupid.

Calm down man :)

> 
> > This one is turning something that wasn't a function call into
> > __builtin_bzero(), and I would hope that no-builtin-bzero would stop it
> > as well. OTOH, the compiler is free to turn it into memset(), just like
> > it could for structure/array initializers.
> 
> The whole "the compiler is free to do X" argument is pure BS. Stop
> repeating that bogus argument.
> 
> Of COURSE a compiler can do whatever the hell it wants.
> 
> That doesn't change the fact that certain things are broken beyond
> words and utterly stupid, and a compiler that does them is a *BAD*
> compiler.
> 
> Turning four stores into a memset() is garbage. Just admit it, instead
> of trying to say that it's allowed.
> 

Look, four stores into memset(), yeah that's a bit weird. I didn't think
you meant "four" literally. But in any case, that has nothing to do with
the topic at hand. It would be just as bad if it was a 16-byte structure
being initialized with an out-of-line memset() call.

But coming back to the actual topic: it is fine if the compiler turns
four stores into __builtin_memset(). A size-16 or -32 __builtin_memset()
will get inlined anyway. There's a lot of garbage here if you look
closely: check out what gcc does to initialize a 7-character array with
zeros at -Os.
