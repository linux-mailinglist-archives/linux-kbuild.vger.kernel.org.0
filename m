Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D7E36E317
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 03:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbhD2Bxb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Apr 2021 21:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhD2Bxa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Apr 2021 21:53:30 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A66C06138D
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Apr 2021 18:52:44 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id n4-20020a05600c4f84b029013151278decso9834631wmq.4
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Apr 2021 18:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Z5QgDM+I2C6Hs4bMlAREKhvOvSoohgfPlmAYHKBQSac=;
        b=wFJzphLMhpNV3HJcNbszgJWUQQ5CB2rRQ5bjSrZdr83GkfqSRBhtz7ZMMH0hpjQkyB
         jgaS/mCGWkAmly4Oek4eXoSPOw+p/ysz/hBNsCH3ubP9pImRHtXj8IvLQZjErsWDeh+7
         LIztEJskO7o9E695JhLZAxhqUXTFrBAVhKn4OEBlV5suAvf9Rbr7/bTEJkns0w062zf/
         3ocmVA3fQtfN/sZdPexq7kTwPT3ZgMM0/xvoOjI8LvYv0UCZlODD5wHewbHke8xF6IBu
         X00WdH4KYgdR6c5SRz7nJP11d8D9BSo5PsfLm4SlZT2WbvGeh964ConPMMkuG6vhRyLF
         RRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Z5QgDM+I2C6Hs4bMlAREKhvOvSoohgfPlmAYHKBQSac=;
        b=JXy2HXeoxWeFg6j+WrSRWJu1Y4uFS1cfxZZA61X1icsGHfZFDIxDIwaa0u/sQ69hkH
         TvtOcEH/7xMg4hXFw++GGAmrbqBepirYWhd/AwRudd6miKkj4SrVtRRV5ZZMPWaa0vUc
         fDRmnYH+KpT0YOCB/kT08nXtkR63ledbzhNskWEKYB9NmW59m5JK89UKt257039uD90V
         abFP1pxT8clV9RBaqkrKcX5OiW7RhPuQ/0AajYeDLBUJMhrplKToYImON/DTTHXf9rIP
         YiqjXzC1nuz2JYjU5KwYDMiGeKsijH1EE6djbMsEx3Qn7RmzdZln0z/DV2w0yPbTk8Z+
         6IRA==
X-Gm-Message-State: AOAM5314Q4Byu+Nl7U0d1F2HME3qqplcHNT84M6h48Px1+MNpAl7Tjzz
        VOwqwD+GB6GqPWJAHJMO6fCS
X-Google-Smtp-Source: ABdhPJxgLwUIMsb3SdFRZxYYgRWiO68DdgpipoFzoKf0OjSBvPyEMbT2ZgKwov6fK6KiP4ScBS+6Hg==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr7519773wmj.155.1619661162897;
        Wed, 28 Apr 2021 18:52:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:ee88:aba3:edd5:1bd6])
        by smtp.gmail.com with ESMTPSA id f7sm2361837wrp.48.2021.04.28.18.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 18:52:42 -0700 (PDT)
Date:   Thu, 29 Apr 2021 02:52:38 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YIoRZizWTn7LrEuz@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <YIGVFCymUn+4HBIj@google.com>
 <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
 <YIbQ3dHOpyD/yymW@google.com>
 <CACRpkdYM5DFLa5=t2NRnZh_TC4KXJYOuXL0oP6xcbifuNjegUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYM5DFLa5=t2NRnZh_TC4KXJYOuXL0oP6xcbifuNjegUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 27, 2021 at 12:54:00PM +0200, Linus Walleij wrote:
> I really like the look of this. I don't fully understand it, but what
> is needed for driver developers to adopt rust is something like a
> detailed walk-through of examples like this that explains the
> syntax 100% all the way down.

Do you have a suggestion for a good place to host such walk-throughs? Also, do
you have other examples in mind that might be useful?

Have you had a chance to read the example I posted in Google's security blog?
It's not particularly complex stuff but touches on some relevant concepts:
https://security.googleblog.com/2021/04/rust-in-linux-kernel.html

> This looks good, but cannot be done like this. The assembly versions
> of writel() etc have to be used because the compiler simply will not
> emit the right type of assembly for IO access, unless the compiler
> (LLVM GCC) gains knowledge of what an IO address is, and so far
> they have not.

That code does not preclude the use of C/assembly wrappers. One way to do it
would be to define a trait that allows types to specify their read/write
functions. For example:

pub trait IoMemType {
    unsafe fn write(ptr: *mut Self, value: Self);
    unsafe fn read(ptr: *const Self) -> Self;
}

Then we restrict T in my original example to only allow types that implement
IoMemType. And we implement it for u8/16/32/64 as wrappers to the C/assembly
implementations.

> One *could* think about putting awareness about crazy stuff like
> that into the language but ... I think you may want to avoid it
> and just wrap the assembly. So a bit of low-level control of the
> behavior there.

Yes, I'm happy to have C/assembly be the source of truth, called from Rust
through wrappers.

> > 2. The only unsafe part that could involve the driver for this would be the
> > creation of IoMemBlock: my expectation is that this would be implemented by the
> > bus driver or some library that maps the appropriate region and caps the size.
> > That is, we can also build a safe abstraction for this.
> 
> I suppose this is part of the problem in a way: a language tends to be
> imperialistic: the developers will start thinking "it would all be so much
> easier if I just rewrote also this thing in Rust".

I'm not sure I agree with this. I actually just want to hook things up to the
existing C code and expose a Rust interface that allows developers to benefit
from the guarantees it offers. Unnecessarily rewriting things would slow me
down, so my incentive is to avoid rewrites.

> > 7. We could potentially design a way to limit which offsets are available for a
> > given IoMemBlock, I just haven't thought through it yet, but it would also
> > reduce the number of mistakes a developer could make.
> 
> The kernel has an abstraction for memory and register accesses,
> which is the regmap, for example MMIO regmap for simple
> memory-mapped IO:
> drivers/base/regmap/regmap-mmio.c
> 
> In a way this is memory safety implemented in C.

I wasn't aware of this. I like it. Thanks for sharing.

> If Rust wants to do this I would strongly recommend it to
> try to look like regmap MMIO.
> See for example drivers/clk/sprd/common.c:
> 
> static const struct regmap_config sprdclk_regmap_config = {
>         .reg_bits       = 32,
>         .reg_stride     = 4,
>         .val_bits       = 32,
>         .max_register   = 0xffff,
>         .fast_io        = true,
> };
> (...)
> regmap = devm_regmap_init_mmio(&pdev->dev, base,
>                                                &sprdclk_regmap_config);
> 
> It is also possible to provide a callback function to determine
> if addresses are readable/writeable.
> 
> This is really a devil-in-the-details place where Rust needs
> to watch out to not reimplement regmap in a substandard
> way from what is already available.

At the moment we're only providing wrappers for things we need, so it is mostly
restricted to what I needed for Binder.

If someone wants to write a driver that would benefit from this, we will look
into it and possibly wrap the C implementation.

> Also in many cases developers do not use regmap MMIO
> because it is just too much trouble. They tend to use it
> not because "safety is nice" but because a certain register
> region is very fractured and it is easy to do mistakes and
> write into a read-only register by mistake. So they want
> this, optionally, when the situation demands it.

In Rust, we want all accesses to be safe (within reason), so we probably want to
offer something like IoMemBlock for cases when regmap-mmio is too much hassle.

> It looks nice but it is sadly unrealistic because we need to wrap
> the real assembly accessors in practice (write memory barriers
> and such) and another problem is that it shows that Rust has an
> ambition to do a parallel implementation of regmap.

There is no such ambition. The code in my previous email was written on the spot
as a demonstration per your request.

> > Would you mind sharing more about which aspect of this you feel is challenging?
> 
> Good point.
> 
> This explanation is going to take some space.

Thanks, I appreciate this.

> I am not able to express it in Rust at all and that is what
> is challenging about it, the examples provided for Rust
> are all about nice behaved computer programs like
> cutesey fibonnacci series and such things and not really
> complex stuff.

I'm sure you're able to express functions and arguments, for example. So going
into the details of the code would have been helpful to me.

> Your binder example is however very good, the problem
> is that it is not a textbook example so the intricacies of
> it are not explained, top down. (I'm not blaming you for
> this, I just say we need that kind of text to get to know
> Rust in the details.)

Do you think a write up about some of what's in there would be helpful? I was
planning to publish some information about the code, including performance
numbers and comparisons of past vulnerabilities once I completed the work.
Probably not to the level of detail that you're seeking but I may look into
having more details about the code if there is demand for it.

> What we need is a good resource to learn it, that
> skips the trivial aspects of the language and goes immediately
> for the interesting details.
> 
> It's not like I didn't try.
> I consulted the Rust book on the website of coure.

Did you run into 'Rust for Embedded C Programmers' by any chance
(https://docs.opentitan.org/doc/ug/rust_for_c/)? It's not all up to date but I
found it useful.

> The hard thing to understand in Rust is traits. I don't understand
> traits. I have the level of "a little knowledge is dangerous" and
> I clearly understand this: all kernel developers must have
> a thorough and intuitive understanding of the inner transcendental
> meaning of the concept of a TRAIT, how it was devised, how the
> authors of the language conceptualized it, what effect it is supposed
> to have on generated assembly.

Perhaps we need a 'Rust for Linux Kernel Programmers' in a similar vain to the
page I linked above. 

> The language book per se is a bit too terse.
> For example if I read
> https://doc.rust-lang.org/book/appendix-02-operators.html
> 
> T: ?Sized : Allow generic type parameter to be a dynamically sized type
> 
> This is just self-referential. The description is written in a
> strongly context-dependent language to make a pun ...
> I think every word in that sentence except "allow"and "to be a"
> is dependent on other Rust concepts and thus completely
> unreadable without context.
> 
> Instead it is described in a later chapter:
> https://doc.rust-lang.org/book/ch19-04-advanced-types.html
> 
> This is more to the point.
> 
> "Rust has a particular trait called the Sized trait to
> determine whether or not a type’s size is known at compile time."
> (...) "A trait bound on ?Sized is the opposite of a trait bound on
> Sized: we would read this as “T may or may not be Sized.” This
> syntax is only available for Sized, not any other traits."
> 
> But Jesus Christ. This makes me understand less not
> more.

I had similar frustrations when I started on the language, which wasn't that
long ago. One thing that I found useful was to read through some of the RFCs
related to the topic I was interested in: it was time-consuming but helped me
understand not only what was going on but the rationale as well.
 
> What I find very disturbing is that the authors of the Rust
> language did NOT write it. I think this may be the source
> of a serious flaw. We need this information straight from
> the horse's mouth.

Perhaps you're right... I don't share this feeling though.

> I would strongly advice the Rust community to twist the
> arms of the original Rust authors to go and review and
> edit the Rust book. Possibly rewrite parts of it. This is what
> the world needs to get a more adaptable Rust.
> 
> I understand this is a thick requirement, but hey, you are
> competing with C.

I don't think of this as a competition. I'm not arguing for C to be replaced,
only for Rust to be an option for those inclined to use it.

Thanks again,
-Wedson
