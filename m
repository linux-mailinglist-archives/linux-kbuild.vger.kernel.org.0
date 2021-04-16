Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825FE3621FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 16:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244522AbhDPOTi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 10:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235593AbhDPOTh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 10:19:37 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F1EC061574;
        Fri, 16 Apr 2021 07:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=SeU+uqvVi1fmEW1Z95Wp1qwWAFy1Vp389yWgFiKUAeA=; b=GeJtVe5y3hVLo4XVhBu95Ze+TF
        fz/5WZHm3RpxQCMAevsOLZQsDACizUJ1W9gnWK2C4dhB8x4Cbkh+ghITeColIxFHZ8DrGAxBAtJ1W
        NR5CYBOGg6hXdldrzjyFvJWBgny0AVKrgmBCGBu3e5BeTDVUi8WkQJSNkyEFHHAOx8t+IA3y2Tg8y
        vF+wGL56zLnN5AJn7C5QIeCr9j9WkRC8OE/jC7vrnw6zkV4mRyacVc47beAORsDErvcOTvI+7SDLu
        tAxTscURR9iDxHqNxNnGg8c4mlYIuA/l+nIEs9tpg6a9zmLmCod66+seZM8ahmbs9DIznjm8Hm3yr
        MAakXBZg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXPJM-002NAa-4U; Fri, 16 Apr 2021 14:19:08 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A28F33001FF;
        Fri, 16 Apr 2021 16:19:07 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 88E6B2BE61367; Fri, 16 Apr 2021 16:19:07 +0200 (CEST)
Date:   Fri, 16 Apr 2021 16:19:07 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHmMJWmzz2vZ3qQH@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 02:07:49PM +0100, Wedson Almeida Filho wrote:
> On Fri, Apr 16, 2021 at 01:24:23PM +0200, Peter Zijlstra wrote:

> >  int perf_event_task_enable(void)
> >  {
> > +	DEFINE_MUTEX_GUARD(event_mutex, &current->perf_event_mutex);
> 
> There is nothing in C forcing developers to actually use DEFINE_MUTEX_GUARD. So
> someone may simply forget (or not know that they need) to lock
> current->perf_event_mutex and directly access some field protected by it. This
> is unlikely to happen when one first writes the code, but over time as different
> people modify the code and invariants change, it is possible for this to happen.
> 
> In Rust, this isn't possible: the data protected by a lock is only accessible
> when the lock is locked. So developers cannot accidentally make mistakes of this
> kind. And since the enforcement happens at compile time, there is no runtime
> cost.
> 
> This, we believe, is fundamental to the discussion: we agree that many of these
> idioms can be implemented in C (albeit in this case with a compiler extension),
> but their use is optional, people can (and do) still make mistakes that lead to
> vulnerabilities; Rust disallows classes of  mistakes by construction.

Does this also not prohibit constructs where modification must be done
while holding two locks, but reading can be done while holding either
lock?

That's a semi common scheme in the kernel, but not something that's
expressible by, for example, the Java sync keyword.

It also very much doesn't work for RCU, where modification must be done
under a lock, but access is done essentially lockless.

I would much rather have a language extention where we can associate
custom assertions with variable access, sorta like a sanitizer:

static inline void assert_foo_bar(struct foo *f)
{
	lockdep_assert_held(&f->lock);
}

struct foo {
	spinlock_t lock;
	int bar __assert__(assert_foo_bar);
};

Such things can be optional and only enabled for debug builds on new
compilers.

> Another scenario: suppose within perf_event_task_enable you need to call a
> function that requires the mutex to be locked and that will unlock it for you on
> error (or unconditionally, doesn't matter). How would you do that in C? In Rust,
> there is a clean idiomatic way of transferring ownership of a guard (or any
> other object) such that the previous owner cannot continue to use it after
> ownership is transferred. Again, this is enforced at compile time. I'm happy to
> provide a small example if that would help.

C does indeed not have the concept of ownership, unlike modern C++ I
think. But I would much rather see a C language extention for that than
go Rust.

This would mean a far more agressive push for newer C compilers than
we've ever done before, but at least it would all still be a single
language. Convertion to the new stuff can be done gradually and where
it makes sense and new extentions can be evaluated on performance impact
etc.

