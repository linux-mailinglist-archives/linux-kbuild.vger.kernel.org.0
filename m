Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E566401DCA
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 17:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242243AbhIFPwO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 11:52:14 -0400
Received: from gate.crashing.org ([63.228.1.57]:56697 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231359AbhIFPwO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 11:52:14 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 186Fkn6J005485;
        Mon, 6 Sep 2021 10:46:49 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 186Fkmi9005477;
        Mon, 6 Sep 2021 10:46:48 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 6 Sep 2021 10:46:42 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210906154642.GV1583@gate.crashing.org>
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com> <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com> <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com> <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com> <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com> <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 04, 2021 at 12:58:50PM -0700, Linus Torvalds wrote:
> On Sat, Sep 4, 2021 at 12:18 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > And the C standard requires you to use these headers to use some
> > features of the C language
> 
> That's really the point here: we don't care AT ALL.
> 
> The C standard headers are simply not relevant for the kernel. Never
> have been, never will be.

Yes they are.  It is the single standard way to get the functionality
you want.

These are not library headers.  These headers are provided by the
compiler itself.  (The one exception is limits.h, but you have no use
for that in the kernel anyway).

> We care about the low-level compiler infrastructure, not the standard C headers.

I don't know why you think you can separate that.  Take <stdarg.h> --
there is no other (portable, standard) way to implement receiving
variadic arguments.

Yes you can mimic what GCC currently does in its <stdarg.h>, and hope
that keeps working on later versions of GCC, and on all older compiler
versions you care about, and that it works on other compilers as well.

> Those standards are designed for - and try to cater to - a completely
> different audience.

"""
  This International Standard specifies the form and establishes the
  interpretation of programs expressed in the programming language C.
  Its purpose is to promote portability, reliability, maintainability,
  and efficient execution of C language programs on a variety of
  computing systems.
"""

Is the kernel not written in C?  The C standard is not the POSIX
standard, or anything like it.

> We do our own type system, and again, we don't care at all about the C
> "official" type system and odd name rules that change from one version
> to the other.

<stdint.h> has existed since C99, and has not relevantly changed since.

And you *do* care about this feature, deeply.  That is why the kernel
has u8, for the exact same reason standard C has uint8_t: to get exact
width integer types.  The kernel could just include the standard header
and then
  typedef uint8_t u8;
instead of the dance it currently goes through.

> We generally *cannot* use the system header files, because they bring
> in things that the kernel simply cannot handle.

Like?

These header files are part of the compiler.  The compiler is required
to provide these to be a C compiler.  Without using those header files
there is no portable way to use some important features of C.

These are not library headers.  These are not headers provided by some
third party.  These headers are an intricate part of the compiler
itself.

> > You also need <stdint.h> and <stddef.h>.
> 
> No, you really don't.
> 
> We avoid those intentionally, and always have. Because the system
> header files have never been a good match.

Linux re-implements all of it.  It *does* need it, it just has its own
implementation if it.  It needs the features it provides.

> But it does look like gcc and clang have both ended up exposing the
> interfaces the same way, using the __buildin_xyz model to just wrap
> the standard names in a namespace-clean way.
> 
> That really wasn't historically true. Back in the bad old days of
> varargs etc, you literally had "va_list" be a "char *" and the
> accessor functions were magic macros that updated things by hand by
> the size of the arguments etc...

Before C90 there was <varargs.h> instead, and that was like that indeed.
The standard C <stdarg.h> header *cannot* be implemented in terms of
other building blocks in C.  This is the underlying theme of all
standard C headers.

> In ways that a lot of other "standard C header files" very much are
> *not* - many of those are about the types that the system provides.
> 
> And in fact often the kernel is the *source* and definition of parts of them.

That is not true at all.  These headers in no way depend on Linux or any
other OS.  Some of it is mandated by the C standard, some of it is
mandated by the low-level ABI used (the size of an int for example, that
kind of thing).  But none of it is from any kernel.


I get that long ago in the dark ages Linux had to implement many things
from scratch.  And that implementing things from scratch is more fun
anyway.  Also, everything seems to work now, tinkering with it is not
necessarily the best idea.

But that does not mean that if you had to start over you should not use
the standard C headers, or that it would be a bad idea to use them more
often now.


Segher
