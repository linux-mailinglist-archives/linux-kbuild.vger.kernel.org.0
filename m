Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE7E35FCD5
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 22:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhDNUrP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 16:47:15 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:40119 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbhDNUrP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 16:47:15 -0400
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 842FDC15D0;
        Wed, 14 Apr 2021 20:35:41 +0000 (UTC)
X-Originating-IP: 50.39.163.217
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A9393FF804;
        Wed, 14 Apr 2021 20:35:15 +0000 (UTC)
Date:   Wed, 14 Apr 2021 13:35:13 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>, ojeda@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHdSATy9am21Tj4Z@localhost>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414200953.GX2531743@casper.infradead.org>
 <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 01:21:52PM -0700, Linus Torvalds wrote:
> On Wed, Apr 14, 2021 at 1:10 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > There's a philosophical point to be discussed here which you're skating
> > right over!  Should rust-in-the-linux-kernel provide the same memory
> > allocation APIs as the rust-standard-library, or should it provide a Rusty
> > API to the standard-linux-memory-allocation APIs?
> 
> Yeah, I think that the standard Rust API may simply not be acceptable
> inside the kernel, if it has similar behavior to the (completely
> broken) C++ "new" operator.
> 
> So anything that does "panic!" in the normal Rust API model needs to
> be (statically) caught, and never exposed as an actual call to
> "panic()/BUG()" in the kernel.

Rust has both kinds of allocation APIs: you can call a method like
`Box::new` that panics on allocation failure, or a method like
`Box::try_new` that returns an error on allocation failure.

With some additional infrastructure that's still in progress, we could
just not supply the former kind of methods at all, and *only* supply the
latter, so that you're forced to handle allocation failure. That just
requires introducing some further ability to customize the Rust standard
library.

(There are some cases of methods in the standard library that don't have
a `try_` equivalent, but we could fix that. Right now, for instance,
there isn't a `try_` equivalent of every Vec method, and you're instead
expected to call `try_reserve` to make sure you have enough memory
first; however, that could potentially be changed.)
