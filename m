Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8AF7362AB3
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 00:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235907AbhDPWFJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 18:05:09 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51766 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234898AbhDPWFJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 18:05:09 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13GM4GQh011937;
        Sat, 17 Apr 2021 00:04:16 +0200
Date:   Sat, 17 Apr 2021 00:04:16 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Connor Kuehl <ckuehl@redhat.com>,
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
Message-ID: <20210416220416.GA11872@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=3zZvdEsp-AH2Xj1nuvfGOQQ1WGmav6i4nFTz-3-_c_w@mail.gmail.com>
 <CANiq72=5pMzSS5V7h-QcQvYgyZUwdE=T705KtBWrNYZPjMYK3Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 11:39:00PM +0200, Miguel Ojeda wrote:
> On Fri, Apr 16, 2021 at 10:58 PM Willy Tarreau <w@1wt.eu> wrote:
> >
> > No, two:
> >   - ok in %rax (seems like it's "!ok" technically speaking since it
> >     returns 1 on !ok and 0 on ok)
> >   - foo_or_err in %rdx
> 
> Yes, but that is the implementation -- conceptually you only have one
> or the other, and Rust won't allow you to use the wrong one.

OK so for unions you always pass two values along the whole chain, a
selector and the value itself.

But my point remains that the point of extreme care is at the interface
with the rest of the kernel because there is a change of semantics
there.

> > However then I'm bothered because Miguel's example showed that regardless
> > of OK, EINVAL was always returned in foo_or_err, so maybe it's just
> > because his example was not well chosen but it wasn't very visible from
> > the source:
> 
> That is the optimizer being fancy since the error can be put
> unconditionally in `rdx`.

Yes that's what I understood as well. I just didn't know that it had
to be seen as a union.

On Fri, Apr 16, 2021 at 11:19:18PM +0200, Miguel Ojeda wrote:
> On Fri, Apr 16, 2021 at 10:22 PM Willy Tarreau <w@1wt.eu> wrote:
> >
> > So it simply does the equivalent of:
> >
> >   struct result {
> >      int status;
> >      int error;
> >   };
> 
> Not exactly, it is more like a tagged union, as Connor mentioned.
> 
> However, and this is the critical bit: it is a compile-time error to
> access the inactive variants (in safe code). In C, it is on you to
> keep track which one is the current one.

Sure but as I said most often (due to API or ABI inheritance), both
are already exclusive and stored as ranges. Returning 1..4095 for
errno or a pointer including NULL for a success doesn't shock me at
all.

Along thes lines I hardly see how you'd tag pointers by manipulating
their lower unused bits. That's something important both for memory
usage and performance (supports atomic opts).

> >      kill_foo();   // only for rust, C doesn't need it
> 
> Please note that `kill_foo()` is not needed in Rust -- it was an
> example of possible cleanup (since Al mentioned resources/cleanup)
> using RAII.

Yep but I kept it just to have comparable output code since in C
you'd simply use "goto leave" and not have this function call to
do the cleanup.

Willy
