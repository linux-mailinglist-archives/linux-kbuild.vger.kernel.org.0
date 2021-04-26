Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF7936B4D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 16:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhDZO1F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 10:27:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhDZO1F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 10:27:05 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60671C061574;
        Mon, 26 Apr 2021 07:26:22 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id p202so21400563ybg.8;
        Mon, 26 Apr 2021 07:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EI9jo4JQbH631Mr5edp7e5oY1tsC6XRF7V3bc4iK7PM=;
        b=GHQzBr2BT8TdDjgJyFpEopKcJGUo+cXX4cWVoPGwWJe2PwsVurB29beqxgJxfLEsNI
         c2EVMIs3/HepVNEQ+33CAuGX9LFHPwRErm9LbqQ5rO7+VuEtV0/shUpmi8gwXm6TbOhD
         Lu9pMg6FB4m6q84hIdJyC2mfjZHsvhpGMXhYYmFy4usNgJREUeYa0YfapfyFUUrfLDyr
         pGJeCL0ddxViFxj0m7P7pEEThoVARbzjv74pjgaY6mEhYWesaecysfnl1h2qfw8tzWtf
         QPY3mt5rJ3mXQ/c4tGESCd3ZSmAkV5qYxLzYd0tu2azeFfIGcdZ7yoDz8k105/RUW9FU
         RNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EI9jo4JQbH631Mr5edp7e5oY1tsC6XRF7V3bc4iK7PM=;
        b=EekvFnregseSNMPUYIGpgBjoN9heWvPjkFB7BDHZIhARZB9yFzNT9/BjMBOUH+PiXp
         MDsxdBz2vSQQoifshvuSUoQWK5Y6CFKDnW9CUIKMy+HWl2mg2UO8lKtRYXvCElog6QPK
         qn7y3yvjp6H9i5jS7elAbClnlw4ROk1PBq0kfJr6fJco0xrjfvUSdHxuK5/B1w8JjZ4x
         /61CWj4XwIO254+zPmhUmaAAeZKtkDlVIUQ3DPd3N/9J6uyHJBjF2b4e+XyCJzBTpCT3
         oSZMVOkytAhzTIe4AVx4N8fmNbxbKqNxp0ZebPG52CmzV5k0bC8BD4AguD706YUVD9zK
         jK6A==
X-Gm-Message-State: AOAM531qPnLL1xiJ3C3hFdfnayCJoVvXMzfC0L+n9sFUlAzZFYcYratH
        D0z7NGgds7eVmENsRTKxNaDuHE4cMKYBq86Ljqc=
X-Google-Smtp-Source: ABdhPJwpj1gBQzkgi5Ndo1XHqsRqeOCUn8/2Im8QwYEvk7md0IjHHix0LNkneQ5rI3jPCEhh1+7IPrk/7TE5/poGODY=
X-Received: by 2002:a25:23d7:: with SMTP id j206mr2090556ybj.247.1619447181629;
 Mon, 26 Apr 2021 07:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <YIGVFCymUn+4HBIj@google.com> <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
In-Reply-To: <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 26 Apr 2021 16:26:10 +0200
Message-ID: <CANiq72m_rzWEZ2Z1vWF79OtTvpuwaB1mAKihjY=VqRv+vtWQYA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

On Mon, Apr 26, 2021 at 2:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I try to provide a good answer so I did sit down and look a bit more
> at rust and looked over your Binder example to at least reach the
> level of "a little knowledge of something is dangerous".

Thanks *a lot* for having spent some time to get to know the language a bit!

> For the record I kind of like the language.

That is great to hear :)

> A typical example is the way device drivers talk to actual hardware:
> readl()/writel(), readw()/writew(), readb()/writeb() for memory-mapped
> IO or inb()/outb() for port-mapped I/O.
>
> So there is for example this (drivers/gpio/gpio-pl061.c):
>
>         writeb(pl061->csave_regs.gpio_is, pl061->base + GPIOIS);
>         writeb(pl061->csave_regs.gpio_ibe, pl061->base + GPIOIBE);
>         writeb(pl061->csave_regs.gpio_iev, pl061->base + GPIOIEV);
>         writeb(pl061->csave_regs.gpio_ie, pl061->base + GPIOIE);
>
> We write a number of u32 into u32 sized registers, this
> pl061->base is a void __iomem * so a pretty unsafe thing to
> begin with and then we add an offset to get to the register
> we want.
>
> [...]
>
> How would I write these 4 registers in Rust? From the actual
> statements down to the CPU instructions, top to bottom,
> that is what a driver writer wants to know.

A function that writes to unconstrained addresses is indeed unsafe.
However, if one constraints them, then the functions might be able to
be made safe.

For instance, we could have a macro where you describe your hardware
registers and then code is generated that only allows to write to
those addresses. Not only that, but also make it properly typed, do
any needed masking/bit twiddling/unit conversion, etc.

This would be very similar to other code generation tools out there
used to simplify talking to hardware and maintain HDL mappings.

So instead of:

    writeb(x, pl061->base + GPIOIS);

you could say something like:

    pl061.write_gpio_is(x)

and the generated code should be the same (in fact, the Rust code
could forward the actual call to C to avoid rewriting any assembly --
but that can be done too if needed, e.g. if cross-language LTO does
not manage to inline as much as we want).

> If the result of the exercise is that a typical device driver
> will contain more unsafe code than not, then device drivers
> are not a good starting point for Rust in the Linux kernel.
> In that case I would recommend that Rust start at a point
> where there is a lot of abstract code that is prone to the
> kind of problems that Rust is trying to solve. My intuition
> would be such things as network protocols. But I may be
> wrong.

We may have some constructs that cannot be reasonably made safe, but
that is fine! As long as one needs to spell those out as `unsafe`, the
safe/unsafe split would be working as intended.

It is likely that some code will be written in "C style" nevertheless,
specially in the beginning. But, as explained above, we need to have a
mindset of writing safe abstractions wherever possible; and not just
try to mimic the kernel C side in everything.

It is also true that Rust brings some features that can be very useful
for non-HW-IO/"pure" code (state machines, ser/des, net protocols,
etc.) -- if someone wants to use Rust there, that is great, of course.

> I worry that it may become evident that introducing Rust
> in device drivers is *only* suggested because the number
> of affected platforms can be controlled (lacking some
> compiler arch targets?) rather than that being a place
> that needs memory safety. And then I think it is just a
> playground for Rust experiments and need to be proposed
> as such. But the idea was a real deployment I suppose.

We are proposing "leaf" modules not just because of the platforms
issue, but also because they introduce a smaller risk overall, i.e.
Rust support could be more easily dropped if the kernel community ends
up thinking it is not worth it.

If some platforms start seeing benefits from using Rust, it is our
hope that compiler vendors and companies behind arches will start
putting more resources on supporting Rust for their platforms too.

> It reminds me of Haskell monads for some reason.

Indeed! Result is pretty much Either.

> This is true for any constrained language. I suppose we could write
> kernel modules in Haskell as well, or Prolog, given the right wrappers,
> and that would also attain the same thing: you get the desired
> restrictions in the target language by way of this adapter.

You can indeed see Rust as a language that has brought some of the
"good ideas" to the systems programming domains.

However, while other languages can do all the fancy type things Rust
can do, the key is that it also introduces the necessary bits to
achieve manual (but safe) memory management for a lot of patterns;
while at the same time reading pretty much like C and C++ and without
removing some "down to the metal" features needed, such as raw
pointers, inline assembly, etc.

> The syntax and semantic meaning of things with lots of
> impl <T: ?Sized> Wrapper<T> for ... is just really intimidating
> but I suppose one can learn it. No big deal.

That syntax does take some time to get used to, indeed (like any other
generics or parameterized system).

Since one cannot introduce UB by mistake, it is "safe" to "play with
the language", which makes it way easier than e.g. some C++ features.
Plus the compiler is quite helpful.

> I have no idea how to perform this in
> Rust despite reading quite a lot of examples. We have
> created a lot of these helpers like FIELD_GET() and
> that make this kind of operations simple.

Bit twiddling and working with raw data can be done, e.g. take a look
into `u64::from_be_bytes()` or `core::mem::transmute()`. Things like
`offset_of`, `container_of`, intrinsics, inline assembly, etc. are
also possible.

In general, everything low-level you can do in C or C++, you can do in
Rust (and get the same kind of codegen).

When needed to simplify things, macros can be introduced too (we have
a few of those already, e.g. to declare a kernel module, to declare
file ops, etc.).

> 1. Expressiveness of language.
>
> If you look in include/linux/bitfield.h you can see how
> this is elaborately implemented to be "a bit" typesafe
> and if you follow the stuff around you will find that in
> some cases it will resolve into per-CPU assembly
> bitwise operations for efficiency. It's neat, it has this
> nice handicrafty feeling to it, we control the machine
> all the way down.

All that is fine in Rust (see above).

> But that took a few years to get here, and wherever
> we want to write a device driver in
> Rust this kind of stuff is (I suspect) something that is
> going to have to be reinvented, in Rust.

If you mean it in the sense that we need to have "similar" code in
Rust, yes, of course. But we can also forward things to the C side, so
some things do not need to be rewritten. The standard library also
provides quite a few utilities (more than C's), which also helps.

If you mean it in the sense that "Rust might be too high-level", not
really (as explained above etc.). Rust was designed with this usage in
mind; and is being used in embedded projects already.

> So this is where Rust maintainers will be needed. I will
> say something like "I need <linux/bitfield.h>
> in Rust" which I guess will eventually become a
> "use linux::bitfield" or something like that. Please
> fill in the blanks. In the beginning pushing tasks like
> that back on the driver writers will just encourage them
> to go and write the driver in C. So the maintainers need
> to pick it up.

We will try to help here as much as possible :)

This should also get fleshed out more when we have a couple drivers
that talk to hardware directly.

> 2. Duplication of core libraries.
>
> I worry about that this could quite soon result in two
> implementations of bitfield: one in C and one in Rust.
> Because the language will have its preferred idiomatic
> way of dealing with this, on the level above the
> per-arch assembly optimized bitwise instructions
> that need to be wrapped nicely for performance.
> Which means wrappers all the way down. (Oh well.)
>
> But double maintenance. Multiply with the number
> of such kernel abstractions we have. So it better not
> happen too much or pay off really well.

The Rust abstractions should reuse the C wherever possible. So it is
not a very big concern in that sense. But, yes, we need to have those
wrappers.

We expect that some modules will be easier to write than others,
specially at the beginning. So some subsystem may start to see some
drivers if the abstractions are already there or are easy enough to
make; while others may take longer.

> 3. Kickback in practical problem solving.
>
> Believe it or not device driver authors are not mainly
> interested in memory safety, overruns, dangling pointers,
> memory leaks etc. Maybe in a perfect world they
> would/should. But they are interested in getting hardware
> to work and want a toolbox that gives the shortest path
> from A to B. Telling them (or subsystem maintainers) all
> about how these things are solved elegantly by Rust is
> not a selling point.

Some of those (overruns, leaks, etc.) can turn into functional bugs
too (e.g. crashes), so even if some companies only care about "making
it work", they are still a good thing to eliminate (from their
perspective).

Even outside the memory-safety topic, Rust provides extra features to
make things reliable easier (like the strict typing and the error
handling guarantees with `Result` etc. we discussed above), so
companies should be up for it -- assuming the infrastructure is there
already.

But, of course, in the beginning, it will be harder for everyone
involved because we are not accustomed to either the language, the
utility functions ("headers" like `bitfield.h`), the way of writing
drivers in Rust, etc.

Cheers,
Miguel
