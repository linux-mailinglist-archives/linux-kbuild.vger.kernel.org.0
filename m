Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F880362DB0
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 06:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbhDQEZL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 00:25:11 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51778 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhDQEZK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 00:25:10 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13H4O52o013478;
        Sat, 17 Apr 2021 06:24:05 +0200
Date:   Sat, 17 Apr 2021 06:24:05 +0200
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
Message-ID: <20210417042405.GA13432@1wt.eu>
References: <CANiq72=3zZvdEsp-AH2Xj1nuvfGOQQ1WGmav6i4nFTz-3-_c_w@mail.gmail.com>
 <CANiq72=5pMzSS5V7h-QcQvYgyZUwdE=T705KtBWrNYZPjMYK3Q@mail.gmail.com>
 <20210416220416.GA11872@1wt.eu>
 <CANiq72k3wmuqgPz+WR1=64vr--SFu971P+2Neq+Xe2TUSZFv0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72k3wmuqgPz+WR1=64vr--SFu971P+2Neq+Xe2TUSZFv0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 01:46:35AM +0200, Miguel Ojeda wrote:
> On Sat, Apr 17, 2021 at 12:04 AM Willy Tarreau <w@1wt.eu> wrote:
> >
> > But my point remains that the point of extreme care is at the interface
> > with the rest of the kernel because there is a change of semantics
> > there.
> >
> > Sure but as I said most often (due to API or ABI inheritance), both
> > are already exclusive and stored as ranges. Returning 1..4095 for
> > errno or a pointer including NULL for a success doesn't shock me at
> > all.
> 
> At the point of the interface we definitely need to take care of
> converting properly, but for Rust-to-Rust code (i.e. the ones using
> `Result` etc.), that would not be a concern.

Sure.

> Just to ensure I understood your concern, for instance, in this case
> you mentioned:
> 
>    result.status = foo_alloc();
>    if (!result.status) {
>        result.error = -ENOMEM;
>        return result;
>    }

Yes I mentioned this when it was my understanding that the composite
result returned was made both of a pointer and an error code, but Connor
explained that it was in fact more of a selector and a union.

> Is your concern is that the caller would mix up the `status` with the
> `error`, basically bubbling up the `status` as an `int` and forgetting
> about the `error`, and then someone else later understanding that
> `int` as a non-error because it is non-negative?

My concern was to know what field to look at to reliably detect an error
from the C side after a sequence doing C -> Rust -> C when the inner C
code uses NULL to mark an error and the upper C code uses NULL as a valid
value and needs to look at an error code instead to rebuild a result. But
if it's more:
     
     if (result.ok)
        return result.pointer;
     else
        return (void *)-result.error;
    
then it shouldn't be an issue.

Willy
