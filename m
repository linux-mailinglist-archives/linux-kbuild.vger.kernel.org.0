Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7661F36129C
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 20:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbhDOS7d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 14:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234130AbhDOS7c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 14:59:32 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0672DC061574;
        Thu, 15 Apr 2021 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=w2Mkbwrn1dHZMYrzDYquD56pzzON3G9dft7HA6GsbfE=; b=nVahZHaWDDx0RjtMba1ns9aOWa
        lfxb7S57Dd5zX7yFCVTl9Y4BPg8hlk3nD5zkeNe+tRF6yFmQpAgbxW3ddWMrz0JWjY/zNehzBuJME
        qdRj3UIja7HYU2XOwO2FpmJblU0B6SbgZceORtO5Y+WVBsvsa7mH41sB5oQzW1tEA4bLvkfKJ7tVc
        t/5pv8xKEz/ILQQIsIgKyF6TpvCb13Y3Re5u0u0WQTPFRBsGyaTnLtmOG+5FEAqr4RrZ2ymNCLYzo
        AQ0Bc2aP+GZm7qZkFQXCnk5oNN/x6tcE2SUucIC/WarGUuiHHOQg7Z6qLVQ8tiuZIRdCP7QeZiypI
        yVPu18Zg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lX7By-008y1B-3a; Thu, 15 Apr 2021 18:58:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 350B1300209;
        Thu, 15 Apr 2021 20:58:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 274082C7727AD; Thu, 15 Apr 2021 20:58:17 +0200 (CEST)
Date:   Thu, 15 Apr 2021 20:58:16 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:

> Rust is a systems programming language that brings several key
> advantages over C in the context of the Linux kernel:
> 
>   - No undefined behavior in the safe subset (when unsafe code is
>     sound), including memory safety and the absence of data races.

And yet I see not a single mention of the Rust Memory Model and how it
aligns (or not) with the LKMM. The C11 memory model for example is a
really poor fit for LKMM.

> ## Why not?
> 
> Rust also has disadvantages compared to C in the context of
> the Linux kernel:
> 
>   - The many years of effort in tooling for C around the kernel,
>     including compiler plugins, sanitizers, Coccinelle, lockdep,
>     sparse... However, this will likely improve if Rust usage in
>     the kernel grows over time.

This; can we mercilessly break the .rs bits when refactoring? What
happens the moment we cannot boot x86_64 without Rust crap on?

We can ignore this as a future problem, but I think it's only fair to
discuss now. I really don't care for that future, and IMO adding this
Rust or any other second language is a fail.

> Thirdly, in Rust code bases, most documentation is written alongside
> the source code, in Markdown. We follow this convention, thus while
> we have a few general documents in `Documentation/rust/`, most of
> the actual documentation is in the source code itself.
> 
> In order to read this documentation easily, Rust provides a tool
> to generate HTML documentation, just like Sphinx/kernel-doc, but
> suited to Rust code bases and the language concepts.

HTML is not a valid documentation format. Heck, markdown itself is
barely readable.

> Moreover, as explained above, we are taking the chance to enforce
> some documentation guidelines. We are also enforcing automatic code
> formatting, a set of Clippy lints, etc. We decided to go with Rust's
> idiomatic style, i.e. keeping `rustfmt` defaults. For instance, this
> means 4 spaces are used for indentation, rather than a tab. We are
> happy to change that if needed -- we think what is important is
> keeping the formatting automated.

It is really *really* hard to read. It has all sorts of weird things,
like operators at the beginning after a line break:

	if (foo
	    || bar)

which is just wrong. And it suffers from CamelCase, which is just about
the worst thing ever. Not even the C++ std libs have that (or had, back
when I still did knew C++).

I also see:

	if (foo) {
		...
	}

and

	if foo {
	}

the latter, ofcourse, being complete rubbish.

> Another important topic we would like feedback on is the Rust
> "native" documentation that is written alongside the code, as
> explained above. We have uploaded it here:
> 
>     https://rust-for-linux.github.io/docs/kernel/
> 
> We like how this kind of generated documentation looks. Please take
> a look and let us know what you think!

I cannot view with less or vim. Therefore it looks not at all.

>   - Boqun Feng is working hard on the different options for
>     threading abstractions and has reviewed most of the `sync` PRs.

Boqun, I know you're familiar with LKMM, can you please talk about how
Rust does things and how it interacts?
