Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A246A36C46C
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Apr 2021 12:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhD0Ky5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Apr 2021 06:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbhD0Ky5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Apr 2021 06:54:57 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10B6C061756
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Apr 2021 03:54:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 4so33120565lfp.11
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Apr 2021 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Uof3OJe3mG35/imq3sgIVS+8XIlB2ckEhhpQXn71h5c=;
        b=UhklAwuq8Sv1ZQ0UlY56W3wpHrGtBzklhG4rsBlOKXCChRLAkICflSsiH6egfKzHsj
         ZQ0pQyLC0TyLR7Jjyd9LwMKMjJjo3mj2U2yPNrL8cT7Vbd49aGSTVXlyKU8iwo3p5Rch
         UmuN/HHzFMZYteNPzo7xa4SbtvMGbzR2LZ82NJNTbEuLTDrpsDicMU0pkX7gHWa1HTnE
         yziehy3iDgttBXjgASzZRCA0zj7BAYdapn1a0utL5eh9bWYsRzbTrdPEhJjnBR3nouTP
         HVx1jQEyFx9JKtA7vMthdn9hQnp4NiEzyffzm+RZI1P+kZFA2fniXL3STor+W/IDafQr
         Urrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Uof3OJe3mG35/imq3sgIVS+8XIlB2ckEhhpQXn71h5c=;
        b=pPWb9y5wGJsVy+liBL6OtycRFXaVyJ6r1MxKx84bV3AyDfTvCLrm42L0v0bcSAsB7v
         /0m26yG1ExBcf/jSpANPECV891bW4cioIjjZ2cJsKVhfUJPQCqfYJx9oOp0x6P5meqmE
         bfmthiJPF3/p1TTMu5zMSkn1gj0QcFS9+1bsnZfwuoifne5PCA4gzbmGJ/hMCrlOFdIa
         /VQ3f72BN+Txzs4AeZWBWJDUSgXdobyjE702Pgx2embU8qcvYCjorpgAsZGH36Q5YpX1
         r1jQ81Hh99hm0PD5L4mGI7x/iXoiXAo+PH43Okta2pCGSU3WhqKRSQm/GerTRIqXFDSP
         fpTg==
X-Gm-Message-State: AOAM533QR3iXDN8vgCnMHaxYaft+zA6tVeJq34AEfC1MvJQOHFkuc/oc
        yY/YCr3VzqN8vSJ1c0W2Dzl04GmwVlnlkFpYB+IpeA==
X-Google-Smtp-Source: ABdhPJyTqh1WIkgiZJKDUBEpybQl+5HFdt1eKuhtClUTXKUd54WBvbFHdeOD+wqwzKocYmJOJ2qmZtk5QUfs/F2grEo=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr7426040lfl.291.1619520852121;
 Tue, 27 Apr 2021 03:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <YIGVFCymUn+4HBIj@google.com> <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
 <YIbQ3dHOpyD/yymW@google.com>
In-Reply-To: <YIbQ3dHOpyD/yymW@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 27 Apr 2021 12:54:00 +0200
Message-ID: <CACRpkdYM5DFLa5=t2NRnZh_TC4KXJYOuXL0oP6xcbifuNjegUg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Wedson,

thanks for your replies, I have a bigger confidence in Rust for
drivers after your detailed answers.

On Mon, Apr 26, 2021 at 4:40 PM Wedson Almeida Filho
<wedsonaf@google.com> wrote:

> Note here that we encode the size of the block at compile time. We'll get=
 our
> safety guarantees from it.
>
> For this abstraction, we provide the following implementation of the writ=
e
> function:
>
> impl<const SIZE: usize> IoMemBlock<SIZE> {
>     pub fn write<T>(&self, value: T, offset: usize) {
>         if let Some(end) =3D offset.checked_add(size_of::<T>()) {
>             if end <=3D SIZE {
>                 // SAFETY: We just checked above that offset was within b=
ounds.
>                 let ptr =3D unsafe { self.ptr.add(offset) } as *mut T;
>                 // SAFETY: We just checked that the offset+size was withi=
n bounds.
>                 unsafe { ptr.write_volatile(value) };
>                 return;
>             }
>         }
>         // SAFETY: Unimplemented function to cause compilation error.
>         unsafe { bad_write() };
>     }
> }

I really like the look of this. I don't fully understand it, but what
is needed for driver developers to adopt rust is something like a
detailed walk-through of examples like this that explains the
syntax 100% all the way down.

We do not need to understand the basic concepts of the
language as much because these are evident, the devil is
in details like this.

> Now suppose we have some struct like:
>
> pub struct MyDevice {
>     base: IoMemBlock<100>,
>     reg1: u32,
>     reg2: u64,
> }
>
> Then a function similar to your example would be this:
>
> pub fn do_something(pl061: &MyDevice) {
>     pl061.base.write(pl061.reg1, GPIOIS);
>     pl061.base.write(pl061.reg2, GPIOIBE);
>     pl061.base.write(20u8, 99);
> }
>
> I have this example here: https://rust.godbolt.org/z/chE3vjacE
>
> The x86 compiled output of the code above is as follows:
>
>         mov     eax, dword ptr [rdi + 16]
>         mov     rcx, qword ptr [rdi]
>         mov     dword ptr [rcx + 16], eax
>         mov     rax, qword ptr [rdi + 8]
>         mov     qword ptr [rcx + 32], rax
>         mov     byte ptr [rcx + 99], 20
>         ret

This looks good, but cannot be done like this. The assembly versions
of writel() etc have to be used because the compiler simply will not
emit the right type of assembly for IO access, unless the compiler
(LLVM GCC) gains knowledge of what an IO address is, and so far
they have not.

I mostly work on ARM so I have little understanding of x86
assembly other than superficial.

Port-mapped IO on ARM for ISA/PCI would be a stressful
example, I do not think Rust or any other sane language
(except Turbo Pascal) has taken the effort to create language
abstractions explicitly for port-mapped IO.

See this for ARM:

#define outb(v,p)       ({ __iowmb(); __raw_writeb(v,__io(p)); })

So to write a byte to a port we first need to issue a IO write memory
barrier, followed by the actual write to the IO memory where the
port resides. __iowmb() turns into the assembly instruction
wmb on CPUs that support it and a noop on those that do not,
at compile time.

One *could* think about putting awareness about crazy stuff like
that into the language but ... I think you may want to avoid it
and just wrap the assembly. So a bit of low-level control of the
behavior there.

> 2. The only unsafe part that could involve the driver for this would be t=
he
> creation of IoMemBlock: my expectation is that this would be implemented =
by the
> bus driver or some library that maps the appropriate region and caps the =
size.
> That is, we can also build a safe abstraction for this.

I suppose this is part of the problem in a way: a language tends to be
imperialistic: the developers will start thinking "it would all be so much
easier if I just rewrote also this thing in Rust".

And that is where you will need compiler support for all targets.

> 7. We could potentially design a way to limit which offsets are available=
 for a
> given IoMemBlock, I just haven't thought through it yet, but it would als=
o
> reduce the number of mistakes a developer could make.

The kernel has an abstraction for memory and register accesses,
which is the regmap, for example MMIO regmap for simple
memory-mapped IO:
drivers/base/regmap/regmap-mmio.c

In a way this is memory safety implemented in C.

Sadly it is not very well documented. But regmap is parameterized
to restrict accesses to certain register areas, using explicit
code in C, so you can provide an algorithm for which addresses
are accessible for write for example, like every fourth address
on a sunday.

A typical usecase is clock drivers which have very fractured
and complex memory maps with random readable/writeable
bits all over the place.

If Rust wants to do this I would strongly recommend it to
try to look like regmap MMIO.
See for example drivers/clk/sprd/common.c:

static const struct regmap_config sprdclk_regmap_config =3D {
        .reg_bits       =3D 32,
        .reg_stride     =3D 4,
        .val_bits       =3D 32,
        .max_register   =3D 0xffff,
        .fast_io        =3D true,
};
(...)
regmap =3D devm_regmap_init_mmio(&pdev->dev, base,
                                               &sprdclk_regmap_config);

It is also possible to provide a callback function to determine
if addresses are readable/writeable.

This is really a devil-in-the-details place where Rust needs
to watch out to not reimplement regmap in a substandard
way from what is already available.

Also in many cases developers do not use regmap MMIO
because it is just too much trouble. They tend to use it
not because "safety is nice" but because a certain register
region is very fractured and it is easy to do mistakes and
write into a read-only register by mistake. So they want
this, optionally, when the situation demands it.

> > What I need to know as device driver infrastructure maintainer is:
> >
> > 1. If the language is expressive enough to do what device driver
> >    authors need to do in an efficient and readable manner which
> >    is as good or better than what we have today.
>
> What do you think of the example I provided above? I think that generics =
give
> Rust an edge over C in terms of expressiveness, though abusing it may
> significantly reduce readability.

It looks nice but it is sadly unrealistic because we need to wrap
the real assembly accessors in practice (write memory barriers
and such) and another problem is that it shows that Rust has an
ambition to do a parallel implementation of regmap.

> > 2. Worry about double implementations of core library functions.
>
> This indeed may be a problem, but I'm happy to have Rust wrappers call
> C/assembly functions. With LTO this should not affect performance.

Yeah see above about regmap too.

> > The syntax and semantic meaning of things with lots of
> > impl <T: ?Sized> Wrapper<T> for ... is just really intimidating
> > but I suppose one can learn it. No big deal.
>
> I agree it's intimidating, but so are macros like ____MAKE_OP in bitfield=
.h --
> the former has the advantage of being type-checked. Writing macros like
> ____MAKE_OP is a hit-and-miss exercise in my experience. However, I feel =
that
> both cases benefit from being specialised implementations that are somewh=
at
> rare.
(...)
> > I have no idea how to perform this in
> > Rust despite reading quite a lot of examples. We have
> > created a lot of these helpers like FIELD_GET() and
> > that make this kind of operations simple.
>
> Would you mind sharing more about which aspect of this you feel is challe=
nging?

Good point.

This explanation is going to take some space.

I am not able to express it in Rust at all and that is what
is challenging about it, the examples provided for Rust
are all about nice behaved computer programs like
cutesey fibonnacci series and such things and not really
complex stuff.

Your binder example is however very good, the problem
is that it is not a textbook example so the intricacies of
it are not explained, top down. (I'm not blaming you for
this, I just say we need that kind of text to get to know
Rust in the details.)

As device driver maintainers we especially need to
understand IO access and so I guess that is what
we are discussing above, so we are making progress
here.

What we need is a good resource to learn it, that
skips the trivial aspects of the language and goes immediately
for the interesting details.

It's not like I didn't try.
I consulted the Rust book on the website of coure.

The hard thing to understand in Rust is traits. I don't understand
traits. I have the level of "a little knowledge is dangerous" and
I clearly understand this: all kernel developers must have
a thorough and intuitive understanding of the inner transcendental
meaning of the concept of a TRAIT, how it was devised, how the
authors of the language conceptualized it, what effect it is supposed
to have on generated assembly.

The language book per se is a bit too terse.
For example if I read
https://doc.rust-lang.org/book/appendix-02-operators.html

T: ?Sized : Allow generic type parameter to be a dynamically sized type

This is just self-referential. The description is written in a
strongly context-dependent language to make a pun ...
I think every word in that sentence except "allow"and "to be a"
is dependent on other Rust concepts and thus completely
unreadable without context.

Instead it is described in a later chapter:
https://doc.rust-lang.org/book/ch19-04-advanced-types.html

This is more to the point.

"Rust has a particular trait called the Sized trait to
determine whether or not a type=E2=80=99s size is known at compile time."
(...) "A trait bound on ?Sized is the opposite of a trait bound on
Sized: we would read this as =E2=80=9CT may or may not be Sized.=E2=80=9D T=
his
syntax is only available for Sized, not any other traits."

But Jesus Christ. This makes me understand less not
more.

So I need to understand what traits are. So back to
https://doc.rust-lang.org/book/ch10-02-traits.html

This chapter is just *really* hard to understand. I
can blame myself for being stupid, but since it is
more convenient to blame the author I'm just going
to complain that this chapter is not very good for
low-level programmers. I'm probably wrong, this is
obviously a personal development exercise.

OK I will give it several second tries. It just feels
very intimidating.

To me, the Rust book is nowhere near "The C
Programming Language" in quality (meaning readability
and ability to transfer complex detailed knowledge) and
that is a serious problem.

Sadly, it is hard to pin down and define what makes it
so hard, but I would take a guess and say that
"The C Programming Language" was written by low
level programmers implementing an operating system
and the Rust book was not. I.e. the authors concept
of the intended audience.

So this is where we need good inroads to understand the
language.

The quality and versatility of the K&R book about The
C Programming Language has been pointed out by
Kernighan in "UNIX: A History and a Memoir"
and I think the Rust community needs to learn something
from this (page78, praising himself and Ritchie):

"We made many alternating passes over the main text (...)
It describes the language with what Bill Plauger
once called 'spine-tingling precision'. The reference
manual is like C itself: precise, elegant, and compact"

I think a main obstacle for getting Rust accepted by kernel
developers is not the language itself, but the lack of textbook
with the same qualities as The C Programming Language.

This is a serious flaw, not with the language itself but with
the surrounding materials.

Kernighan writes about *forcing* Ritchie to write the book
about C ("I twisted his arm harder and eventually he agreed"),
after implementing it, and this made it reflect the
language from the intent of the author and OS usecase
very well.

The Rust book is written "by Steve Klabnik and Carol Nichols,
with contributions from the Rust Community" and I do not mean
to criticize them, because I think they had very clear ideas
of what kind of people were going to read it. And I bet they did
not intend it for OS developers.

What I find very disturbing is that the authors of the Rust
language did NOT write it. I think this may be the source
of a serious flaw. We need this information straight from
the horse's mouth.

I would strongly advice the Rust community to twist the
arms of the original Rust authors to go and review and
edit the Rust book. Possibly rewrite parts of it. This is what
the world needs to get a more adaptable Rust.

I understand this is a thick requirement, but hey, you are
competing with C.

Yours,
Linus Walleij
