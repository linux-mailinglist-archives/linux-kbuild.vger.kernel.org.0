Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1251362780
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 20:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237955AbhDPSKr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 14:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237802AbhDPSKq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 14:10:46 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1451EC061574;
        Fri, 16 Apr 2021 11:10:21 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lXSul-005p9O-6e; Fri, 16 Apr 2021 18:09:59 +0000
Date:   Fri, 16 Apr 2021 18:09:59 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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
Message-ID: <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net>
 <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 07:47:32PM +0200, Miguel Ojeda wrote:
> On Fri, Apr 16, 2021 at 7:05 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Typical Rust error handling should match the regular kernel
> > IS_ERR/ERR_PTR/PTR_ERR model fairly well, although the syntax is
> > fairly different (and it's not limited to pointers).
> 
> Yeah, exactly. We already have a `KernelResult<T>` type which is a
> `Result<T, Error>`, where `Error` is a wrapper for the usual kernel
> int errors.
> 
> So, for instance, a function that can either fail or return `Data`
> would have a declaration like:
> 
>     pub fn foo() -> KernelResult<Data>
> 
> A caller that needs to handle the error can use pattern matching or
> one of the methods in `Result`. And if they only need to bubble the
> error up, they can use the ? operator:
> 
>     pub fn bar() -> KernelResult<Data> {
>         let data = foo()?;
> 
>         // `data` is already a `Data` here, not a `KernelResult<Data>`
>     }

Umm...  A fairly common situation is

foo() returns a pointer to struct foo instance or ERR_PTR()
bar() returns a pointer to struct bar instance of ERR_PTR()

bar()
{
	struct foo *p;
	struct bar *res;
	.... // do some work, grab a mutex, etc.
	p = foo();
	if (IS_ERR(p))
		res = ERR_CAST(p); // (void *)p, internally; conceptually it's
				   // ERR_PTR(PTR_ERR(p));
	else
		res = blah();
	.... // matching cleanup
	return res;
}

How well would ? operator fit that pattern?  _If_ it's just a syntax sugar
along the lines of "if argument matches Err(_), return Err(_)", the types
shouldn't be an issue, but that might need some fun with releasing resources,
etc.  If it's something more elaborate... details, please.
