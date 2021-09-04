Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86E11400B7D
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 15:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhIDNYg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 09:24:36 -0400
Received: from gate.crashing.org ([63.228.1.57]:51486 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233703AbhIDNYg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 09:24:36 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 184DJCVJ031110;
        Sat, 4 Sep 2021 08:19:12 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 184DJBeH031102;
        Sat, 4 Sep 2021 08:19:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Sat, 4 Sep 2021 08:19:11 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Florian Weimer <fweimer@redhat.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210904131911.GP1583@gate.crashing.org>
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com> <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com> <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878s0c4vng.fsf@oldenburg.str.redhat.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 04, 2021 at 10:01:07AM +0200, Florian Weimer wrote:
> * Nathan Chancellor:
> > We set up the linux-toolchains mailing list after Plumbers 2020 to
> > have a common place that kernel developers can bring issues and
> > discussion to both clang and GCC folks. I am not sure who exactly from
> > the GCC world is subscribed but I have added it now to see.
> 
> Someone said that they “agree with the reasoning”, but the original
> patch does not provide one.  It looks like it's about preventing the use
> of compiler-supplied header files, but even that doesn't really answer
> the question: why?
> 
> Especially since some parts of the kernel actually need some of those
> header files.

Let me quote the original mail (I had to dig it out of the archives as
well, no nice threading, too lazy, sorry):

> On Thu, Sep 2, 2021 at 4:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > I fixed the warnings observed in the previous PR.
> 
> Ok, let's try it again.
> 
> >  - Add <linux/stdarg.h> to the kernel source instead of borrowing
> >    <stdarg.h> from the compiler.
> 
> So I certainly agree with the reasoning, but this worries me a bit.
> 
> stdarg is truly intimately an internal compiler file, in ways that
> stddef (to pick another example) isn't.
> 
> Yeah, yeah, offsetof() is "kind of compiler internal", and we end up
> using __compiler_offsetof(), but in the absence of that we *can* just
> do it by hand. So offsetof() really is one of those things where we
> can just do our own version if some compiler is being difficult.
> 
> But va_start and friends absolutely *must* match the exact compiler version.
> 
> It does look like both gcc and clang have just standardized on using
> __builtin_xyz for all the different stdarg things, and so I approve of
> what that <linux/stdarg.h> ended up looking like.
> 
> But at the same time, it does make me go "ok, this is a big new
> assumption that we've consciously avoided for a long time".
> 
> Nick is already on the cc here for other reasons, but let's add the
> clang-built list and Nathan explicitly. Because this basically
> codifies that
> 
>     typedef __builtin_va_list va_list;
>     #define va_start(v, l)  __builtin_va_start(v, l)
>     #define va_end(v)       __builtin_va_end(v)
>     #define va_arg(v, T)    __builtin_va_arg(v, T)
>     #define va_copy(d, s)   __builtin_va_copy(d, s)
> 
> being the way all the supported compilers work.
> 
> Did people talk to any gcc maintainers too? We don't have the same
> kind of "gcc kernel people" list or contacts. The above builtins have
> been the case for a long long time for gcc, so I don't think it's
> wrong or likely to change, but I think it would be a good thing to
> just make compiler people aware of how we're now relying on that
> explicitly.
> 
> (Side note: Linux using the compiler <stdarg.h> goes so far back that
> it very much predates all those nice builtins. I still have memories
> of <stdarg.h> being a collection of nasty per-architecture messes back
> in the bad old days. So I'm actually happy we can do this now, but
> there most definitely was a time when we really really had to use the
> compiler-provided stdarg.h).
> 
>                 Linus

<stdarg.h> is a header that any C implementation is required to provide
to give some certain functionality (one type and four macros, in this
case, mentioned above).  No implementation is allowed to put anything in
those headers that can conflict with anything in user code or in some
implementation's internals, and I haven't heard of any implementation
breaking in that way for decades, there is absolutely no reason not to
use <stdarg.h>.

It is one of the few headers required from freestanding implementations
even (and <stddef.h> is another for that matter: the full list is
<float.h>, <iso646.h>, <limits.h>, <stdalign.h>, <stdarg.h>,
<stdbool.h>, <stddef.h>, <stdint.h>, and <stdnoreturn.h>).

I recommend using this.  It is what it is for.  It works in all
compilers.  Not using it is not writing in C.


Segher
