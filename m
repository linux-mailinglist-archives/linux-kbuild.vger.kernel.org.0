Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD317362927
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 22:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244861AbhDPUXM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 16:23:12 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51740 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234654AbhDPUXM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 16:23:12 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13GKMFDa011534;
        Fri, 16 Apr 2021 22:22:15 +0200
Date:   Fri, 16 Apr 2021 22:22:15 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
Message-ID: <20210416202215.GA11236@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
 <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
 <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk>
 <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 08:57:07PM +0200, Miguel Ojeda wrote:
> On Fri, Apr 16, 2021 at 8:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > How well would ? operator fit that pattern?  _If_ it's just a syntax sugar
> > along the lines of "if argument matches Err(_), return Err(_)", the types
> > shouldn't be an issue, but that might need some fun with releasing resources,
> > etc.  If it's something more elaborate... details, please.
> 
> Yes, it is just syntax sugar -- it doesn't introduce any power to the language.
> 
> It was introduced because it is a very common pattern when using the
> `Result` and `Option` enums. In fact, before it existed, it was just a
> simple macro that you could also implement yourself.
> 
> For instance, given `Foo` and `Bar` types that need RAII cleanup of
> some kind (let's say `kill_foo()` and `kill_bar()`):
> 
>     fn foo() -> KernelResult<Foo> {
>         if black_box() {
>             return Err(EINVAL);
>         }
> 
>         // something that gets you a `Foo`
>         let foo = ...;
> 
>         Ok(foo)
>     }
> 
>     fn bar() -> KernelResult<Bar> {
>         let p = foo()?;
> 
>         // something that gets you a `Bar`, possibly using the `p`
>         let bar = ...;
> 
>         Ok(bar)
>     }
> 
> This reduces to (full example at https://godbolt.org/z/hjTxd3oP1):
> 
>     bar:
>             push    rbx
>             mov     ebx, 1
>             call    qword ptr [rip + black_box@GOTPCREL]
>             test    al, al
>             jne     .LBB2_2
>             call    qword ptr [rip + kill_foo@GOTPCREL]
>             xor     ebx, ebx
>     .LBB2_2:
>             mov     eax, ebx
>             mov     edx, -1234
>             pop     rbx
>             ret
> 
> You can see `bar()` calls `black_box()`. If it failed, it returns the
> EINVAL. Otherwise, it cleans up the `foo` automatically and returns
> the successful `bar`.

So it simply does the equivalent of:

  #define EINVAL -1234

  struct result {
     int status;
     int error;
  };

  extern bool black_box();
  extern void kill_foo();

  struct result bar()
  {
     return (struct error){ !!black_box(), EINVAL };
  }

  struct result foo()
  {
     struct result res = bar();

     if (res.status)
        goto leave;
     /* ... */
     kill_foo();   // only for rust, C doesn't need it
  leave:
     return res;
  }

So it simply returns a pair of values instead of a single one, which
is nothing special but not much conventional in the kernel either given
that ultimately syscalls will usually return a single value anyway. At
some point some code will have to remerge them to provide a composite
result and even take care of ambigous special cases like { true, 0 }
which may or may not indicate an error, and avoiding to consider the
unused error code on success.

For example some code called from mmap() might have to deal with this
this way:

   if (result.status == (void *)-1)
       return -result.error;
   else
       return result.status;

But possibly a lot of code feeding this result struct would be tempted
to do something like this to deal with NULL returns:

   result.status = foo_alloc();
   if (!result.status) {
       result.error = -ENOMEM;
       return result;
   }

And suddenly the error is lost, as a NULL is returned to the upper layers
which does not correspond to an failure status. Conversely, with a unique
result you'd do something like this:

   result = foo_alloc();
   if (!result)
       return -ENOMEM;

So it might possibly be safer to stick to the usually expected return
values instead of introducing composite ones.

I tend to agree that composite results can be better from new projects
started from scratch when all the API follows this principle, but here
there's quite a massive code base that was not designed along these
lines and I easily see how this can become a source of trouble over
time.

Willy
