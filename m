Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 926413629C9
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 22:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244074AbhDPU7H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 16:59:07 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51754 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236340AbhDPU7E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 16:59:04 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13GKwCKQ011673;
        Fri, 16 Apr 2021 22:58:12 +0200
Date:   Fri, 16 Apr 2021 22:58:12 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Connor Kuehl <ckuehl@redhat.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
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
Message-ID: <20210416205812.GA11655@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
 <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
 <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk>
 <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
 <20210416202215.GA11236@1wt.eu>
 <efe80452-fac9-247a-1e2b-a73553f605e8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efe80452-fac9-247a-1e2b-a73553f605e8@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 03:34:50PM -0500, Connor Kuehl wrote:
> On 4/16/21 3:22 PM, Willy Tarreau wrote:
> > So it simply does the equivalent of:
> > 
> >   #define EINVAL -1234
> > 
> >   struct result {
> >      int status;
> >      int error;
> >   };
> 
> Result and Option types are more like a union with a tag that
> describes which variant it is.
> 
> struct foo_result {
>     /* if ok, then access foo_or_err.successful_foo
>      *        else, access foo_or_err.error
>      */
>     bool ok;
>     union {
>         struct foo successful_foo;
>         int error;
>     } foo_or_err;
> };

OK.

> > [..]
> > 
> > So it simply returns a pair of values instead of a single one, which
> 
> It will only return 1 value.

No, two:
  - ok in %rax (seems like it's "!ok" technically speaking since it
    returns 1 on !ok and 0 on ok)
  - foo_or_err in %rdx

However then I'm bothered because Miguel's example showed that regardless
of OK, EINVAL was always returned in foo_or_err, so maybe it's just
because his example was not well chosen but it wasn't very visible from
the source:

     bar:
             push    rbx
             mov     ebx, 1
             call    qword ptr [rip + black_box@GOTPCREL]
             test    al, al
             jne     .LBB2_2
             call    qword ptr [rip + kill_foo@GOTPCREL]
             xor     ebx, ebx
     .LBB2_2:
             mov     eax, ebx
             mov     edx, -1234
             pop     rbx
             ret

Willy
