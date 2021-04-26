Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE29A36A9FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 02:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231422AbhDZAT2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 25 Apr 2021 20:19:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhDZAT1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Apr 2021 20:19:27 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A232BC061761
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Apr 2021 17:18:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id h36so31464084lfv.7
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Apr 2021 17:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AWQimjr1/3NEWgx+Y6ewI7TbJwNR7gcB9q2LG7gEjIQ=;
        b=LDcZnkLrdjY8jqjspwarkt7eBqa5s21uRFGvBwknYGLRI/rbk+sMdszV++3f7bdcCt
         pQiVvT3AB+7VjUOkVypRXWc9FB10gx/6cgK6viSlcEdVdlicBrA9Y8vLsFLXY6GeW5PS
         J4seFLA9JIkom2iSXstoRBwUtHnBfWIcq55VtIUtoiRRUn+EguPPfr9SHMbSWsvv9U7Z
         ZEgshUsEhRgIEAU5oZIbGVHXs3pa0SRLZ5MeIg/1zDCc4Hs/K8ilC0P3hHsK+PDXuK3m
         zv6t1Lu3A5zCXj+w8WWdP7m2HOUOWqfv7tu21Rn7NhlycbRr/ihujnzztL0MObEEZQVU
         C+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AWQimjr1/3NEWgx+Y6ewI7TbJwNR7gcB9q2LG7gEjIQ=;
        b=G2tDjac+q5eOm1nuvdNgdKbDjzJJhGG67FMRQm7yi9yeDhTGjMRCRd+xZDmI+cCyfi
         uwwT3Vf5uPSYtp3JeVSBTmG9lCl0LvhiOiFh9nKuECDB2DH2HWnqr3Jl6e6ZN67pYv9r
         OATQreL6OLnFhmNFUd84QpjTGcYUHeotxyOxFNvDzreZRMMmqDbLpFKrllMz6pgqTGUT
         RI7/JbUV2JOVBFbYWJu6gWOxnRS03GY1wj+xqwl9b+yPmJNvTBrsbB+x2WOOis/CoNG3
         o+MwGa1AShUxbdIZqqlBbpsDafKUEeWW20Xt6rpPfRQZojNWe5OBkuK5xVirx8KCcg7H
         /Byw==
X-Gm-Message-State: AOAM5318dvfJ1evsxKfM3lH2Znvfnt37UbhX5UCowIm3qekkPtPY0JZi
        y0jLQZVYwUjGHd0c6jzJgY4TdcVAGd5nSk+8RUMcVnj5L1Rr4w==
X-Google-Smtp-Source: ABdhPJwgs9EXAtFCx4KZKaSQ6pFD5LevLbllV1m2Obw1ZJ7bF4n1WFrcD1Xs0/HPtCMtNEwSgS3uUHGW2PeODiWLEWc=
X-Received: by 2002:a19:ec13:: with SMTP id b19mr10508532lfa.649.1619396324797;
 Sun, 25 Apr 2021 17:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <YIGVFCymUn+4HBIj@google.com>
In-Reply-To: <YIGVFCymUn+4HBIj@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Apr 2021 02:18:33 +0200
Message-ID: <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Wedson,

I try to provide a good answer so I did sit down and look a bit more
at rust and looked over your Binder example to at least reach the
level of "a little knowledge of something is dangerous".

For the record I kind of like the language.

On Thu, Apr 22, 2021 at 5:24 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:

> > We really like to change the internal APIs of the kernel, and it sounds to
> > me like Rust really likes a rust-side-vs-C-side approach to APIs, requiring
> > these wrappers to be written and maintained all over the place, and that
> > is going to affect the mobility of the kernel-internal APIs and make them
> > less mobile.
>
> The Rust-side-vs-C-side is because we want to provide an environment where we
> can write kernel code (e.g., a driver) and if we stick to safe code (i.e.,
> we don't use the Rust keyword "unsafe"), then we can be confident that our
> code is free of memory safety issues (assuming, of course, that the abstractions
> are sound).
>
> Calling C functions directly would not allow us to do this.

I get it. I think.

> > If it means I need to write and review less patches related to NULL
> > dereference and use-after-free etc etc, then it may very well be worth
> > it.
>
> Indeed that's part of our goal. A class of vulnerabilities is removed by
> construction; others are harder to create accidentally. Reviewers would also
> know that unsafe blocks need extra attention.

Fair enough. What we need to know is what these unsafe blocks
are going to be.

> We want the runtime overhead to be zero. During development, as you rightly
> point out, there is the overhead of creating and maintaining these abstractions
> for use in Rust. The code above is not a good example of a wrapper because it's
> not wrapping kernel C functionality.

For device drivers you will certainly have to wrap assembly as well.
Or C calls that only contain assembly to be precise.

A typical example is the way device drivers talk to actual hardware:
readl()/writel(), readw()/writew(), readb()/writeb() for memory-mapped
IO or inb()/outb() for port-mapped I/O.

So there is for example this (drivers/gpio/gpio-pl061.c):

        writeb(pl061->csave_regs.gpio_is, pl061->base + GPIOIS);
        writeb(pl061->csave_regs.gpio_ibe, pl061->base + GPIOIBE);
        writeb(pl061->csave_regs.gpio_iev, pl061->base + GPIOIEV);
        writeb(pl061->csave_regs.gpio_ie, pl061->base + GPIOIE);

We write a number of u32 into u32 sized registers, this
pl061->base is a void __iomem * so a pretty unsafe thing to
begin with and then we add an offset to get to the register
we want.

writel() on ARM for example turns into (arch/arm/include/asm/io.h):

static inline void __raw_writel(u32 val, volatile void __iomem *addr)
{
        asm volatile("str %1, %0"
                     : : "Qo" (*(volatile u32 __force *)addr), "r" (val));
}

This is usually sprinkled all over a device driver, called in loops etc.
Some of these will contain things like buffer drains and memory
barriers. Elaborately researched for years so they will need to
be there.

I have no clue how this thing would be expressed in Rust.
Even less how it would call the right code in the end.
That makes me feel unsafe and puzzled so this is a specific
area where "the Rust way" needs to be made very tangible
and easy to understand.

How would I write these 4 registers in Rust? From the actual
statements down to the CPU instructions, top to bottom,
that is what a driver writer wants to know.

If the result of the exercise is that a typical device driver
will contain more unsafe code than not, then device drivers
are not a good starting point for Rust in the Linux kernel.
In that case I would recommend that Rust start at a point
where there is a lot of abstract code that is prone to the
kind of problems that Rust is trying to solve. My intuition
would be such things as network protocols. But I may be
wrong.

I worry that it may become evident that introducing Rust
in device drivers is *only* suggested because the number
of affected platforms can be controlled (lacking some
compiler arch targets?) rather than that being a place
that needs memory safety. And then I think it is just a
playground for Rust experiments and need to be proposed
as such. But the idea was a real deployment I suppose.

> A better example is Pages, which wraps a pointer to struct page:
>
>     pub struct Pages<const ORDER: u32> {
>         pages: *mut bindings::page,
>     }
>
> If you call Pages::new(), alloc_pages() is called and returns a
> KernelResult<Pages>. If the allocation fails you get an error back, otherwise
> you get the pages: there is no possibility of forgetting to check the return
> value and accidentally dereferencing a NULL pointer.

This is really neat. I think it is a good example where Rust
really provides the right tool for the job.

And it is very far away from any device driver. Though some
drivers need pages.

(...)

> Anyway, what I'm trying to show here is that the wrappers are quite thin and are
> intended to enforce safety (where possible) and correct usage. Does it make
> sense? I'm glad to go into more details if desired.

It reminds me of Haskell monads for some reason.

This is true for any constrained language. I suppose we could write
kernel modules in Haskell as well, or Prolog, given the right wrappers,
and that would also attain the same thing: you get the desired
restrictions in the target language by way of this adapter.

I don't have a problem with that.

The syntax and semantic meaning of things with lots of
impl <T: ?Sized> Wrapper<T> for ... is just really intimidating
but I suppose one can learn it. No big deal.

What I need to know as device driver infrastructure maintainer is:

1. If the language is expressive enough to do what device driver
   authors need to do in an efficient and readable manner which
   is as good or better than what we have today.

2. Worry about double implementations of core library functions.

3. Kickback in practical problem solving.

This will be illustrated below.

Here is a device driver example that I wrote and merged
just the other week (drivers/iio/magnetometer/yamaha-yas530.c)
it's a nasty example, so I provide it to make a point.

static void yas53x_extract_calibration(u8 *data, struct yas5xx_calibration *c)
{
        u64 val = get_unaligned_be64(data);

        /*
         * Bitfield layout for the axis calibration data, for factor
         * a2 = 2 etc, k = k, c = clock divider
         *
         * n   7 6 5 4 3 2 1 0
         * 0 [ 2 2 2 2 2 2 3 3 ] bits 63 .. 56
         * 1 [ 3 3 4 4 4 4 4 4 ] bits 55 .. 48
         * 2 [ 5 5 5 5 5 5 6 6 ] bits 47 .. 40
         * 3 [ 6 6 6 6 7 7 7 7 ] bits 39 .. 32
         * 4 [ 7 7 7 8 8 8 8 8 ] bits 31 .. 24
         * 5 [ 8 9 9 9 9 9 9 9 ] bits 23 .. 16
         * 6 [ 9 k k k k k c c ] bits 15 .. 8
         * 7 [ c x x x x x x x ] bits  7 .. 0
         */
        c->a2 = FIELD_GET(GENMASK_ULL(63, 58), val) - 32;
        c->a3 = FIELD_GET(GENMASK_ULL(57, 54), val) - 8;
        c->a4 = FIELD_GET(GENMASK_ULL(53, 48), val) - 32;
        c->a5 = FIELD_GET(GENMASK_ULL(47, 42), val) + 38;
        c->a6 = FIELD_GET(GENMASK_ULL(41, 36), val) - 32;
        c->a7 = FIELD_GET(GENMASK_ULL(35, 29), val) - 64;
        c->a8 = FIELD_GET(GENMASK_ULL(28, 23), val) - 32;
        c->a9 = FIELD_GET(GENMASK_ULL(22, 15), val);
        c->k = FIELD_GET(GENMASK_ULL(14, 10), val) + 10;
        c->dck = FIELD_GET(GENMASK_ULL(9, 7), val);
}

This extracts calibration for the sensor from an opaque
chunk of bytes. The calibration is stuffed into sequences of
bits to save space at different offsets and lengths. So we turn
the whole shebang passed in the u8 *data into a 64bit
integer and start picking out the pieces we want.

We know a priori that u8 *data will be more than or equal
to 64 bits of data. (Which is another problem but do not
focus on that, let us look at this function.)

I have no idea how to perform this in
Rust despite reading quite a lot of examples. We have
created a lot of these helpers like FIELD_GET() and
that make this kind of operations simple.

1. Expressiveness of language.

If you look in include/linux/bitfield.h you can see how
this is elaborately implemented to be "a bit" typesafe
and if you follow the stuff around you will find that in
some cases it will resolve into per-CPU assembly
bitwise operations for efficiency. It's neat, it has this
nice handicrafty feeling to it, we control the machine
all the way down.

But that took a few years to get here, and wherever
we want to write a device driver in
Rust this kind of stuff is (I suspect) something that is
going to have to be reinvented, in Rust.

So this is where Rust maintainers will be needed. I will
say something like "I need <linux/bitfield.h>
in Rust" which I guess will eventually become a
"use linux::bitfield" or something like that. Please
fill in the blanks. In the beginning pushing tasks like
that back on the driver writers will just encourage them
to go and write the driver in C. So the maintainers need
to pick it up.

2. Duplication of core libraries.

I worry about that this could quite soon result in two
implementations of bitfield: one in C and one in Rust.
Because the language will have its preferred idiomatic
way of dealing with this, on the level above the
per-arch assembly optimized bitwise instructions
that need to be wrapped nicely for performance.
Which means wrappers all the way down. (Oh well.)

But double maintenance. Multiply with the number
of such kernel abstractions we have. So it better not
happen too much or pay off really well.

I would be worried if we need to say to a submitted device
driver written in Rust: "I know better ways to code this in
C so rewrite it in C". That's not gonna be popular, and
I would worry about angry Rust developers being required
to reinvent the world just because of some pesky review
comments about what we can do in C.

3. Kickback in practical problem solving.

Believe it or not device driver authors are not mainly
interested in memory safety, overruns, dangling pointers,
memory leaks etc. Maybe in a perfect world they
would/should. But they are interested in getting hardware
to work and want a toolbox that gives the shortest path
from A to B. Telling them (or subsystem maintainers) all
about how these things are solved elegantly by Rust is
not a selling point.

So if Rust makes it easier or at least equal to express
the logic with less lines of readable code, that is a
selling point. (Less lines of code that is unintelligible
and hard to read is not a good sell.) I am not referring
to matter of taste here: let's assume intermediary
experience with the language and some talent. There
will always be outliers and there is always a threshold
with any language.

One way of being better would be through me not having to
merge patches of NULL checks and misc things found by
static and dynamic inspection tools such as smatch,
coccinelle, KASan, ... etc etc. I think that is where Rust
would provide real kickback. Make
these never happen. Create less of this. But incidentally
that is not very common in my subsystems, only one patch
in 100 or 50 is about this kind of stuff.

So I do see some upsides here, maybe not super much.

> There are other possible approaches too:
> 1. Explicitly exclude Rust support from certain subsystems, say, no Rust USB
> drivers (just a random example).

With the wrappers being written and submitted to the subsystem
maintainer their buy-in will be the only way in, as our little
ecosystem works that way.

> 2. Maintainers may choose to not care about Rust, breaking it on api changes.

It's not like people don't get annoyed at us for things breaking
already. And I already care about Rust since I am writing this reply.

The maintainers are not going to have a Rust sidekick for their
subsystem, they simply have to understand it and manage it
if it is a supported kernel implementation language.

> Agreed. The only part that I'm not sure about is whether we need to put all the
> burden on a single person for the rest of their career. In the beginning, of
> course, but over time I would expect (hope?) experts would emerge and some of
> the load would be distributed.

People will pick up on it if it delivers expected improvements.

We (we device driver maintainers) already
had to learn YAML (see Documentation/devicetree/writing-schema.rst)
and that is certainly much more cognitively demanding than Rust. But it
made things so much better so it was worth it. In short: it delivers
expected improvements (formal validation of device trees, rooting
out nasty, buggy and incoherent device trees).

Have you tried to just sift through the kernel git log and see what
parts of the kernel is experiencing the kind of problems that
Rust can solve? (I haven't.) But if a certain area stand out,
that is likely where you should start. But maybe it is just
everywhere.

Yours,
Linus Walleij
