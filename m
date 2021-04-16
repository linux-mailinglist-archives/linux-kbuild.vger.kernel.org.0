Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48147362375
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 17:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244955AbhDPPE6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 11:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233916AbhDPPE5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 11:04:57 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A7AC061574;
        Fri, 16 Apr 2021 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=25hrGU9VZ2QV0c5Hbqrxi9yE5aGpd22JKZJ3w+lQJU8=; b=hyDSOZjdKvkPuQFyX/T/VJ+RAY
        JmxcWLT61fI68EtDrTVEbvD9gyEHmqmR0wPScYyqUJK21c90XaKL5tz0pckVtWtmXspROR1d2d/hH
        rKLmRBvPOSaQsaZmUbnNFYOmjxwT6abcBWOgjjNU3cEBpliOCmBgP93NV2Jwwr/waAIIfjgNOUHVI
        ejz3P+H//G5rqwyl0cN8rNOSX1zqhML0z9hyPzwA4YGrKEIjQSklN3YTSxZQI8rWoSWHgREChCD59
        ZmDqCAx2pn2RR0ytLxo8lVpgKeXl7EwYh92v4LOtLL0LeDr15+BoZNpavY4CBerRZXEju/y9TIun4
        J2ssLwuQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lXPzv-00A5sI-KB; Fri, 16 Apr 2021 15:03:37 +0000
Date:   Fri, 16 Apr 2021 16:03:07 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210416150307.GJ2531743@casper.infradead.org>
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

Well, we could do that in C too.

struct unlocked_inode {
	spinlock_t i_lock;
};

struct locked_inode {
	spinlock_t i_lock;
	unsigned short i_bytes;
	blkcnt_t i_blocks;
};

struct locked_inode *lock_inode(struct unlocked_inode *inode)
{
	spin_lock(&inode->i_lock);
	return (struct locked_inode *)inode;
}

There's a combinatoric explosion when you have multiple locks in a data
structure that protect different things in it (and things in a data
structure that are protected by locks outside that data structure),
but I'm not sufficiently familiar with Rust to know if/how it solves
that problem.

Anyway, my point is that if we believe this is a sufficiently useful
feature to have, and we're willing to churn the kernel, it's less churn
to do this than it is to rewrite in Rust.

> Another scenario: suppose within perf_event_task_enable you need to call a
> function that requires the mutex to be locked and that will unlock it for you on
> error (or unconditionally, doesn't matter). How would you do that in C? In Rust,
> there is a clean idiomatic way of transferring ownership of a guard (or any
> other object) such that the previous owner cannot continue to use it after
> ownership is transferred. Again, this is enforced at compile time. I'm happy to
> provide a small example if that would help.

I think we could do that too with an __attribute__((free)).  It isn't,
of course, actually freeing the pointer to the locked_inode, but it will
make the compiler think the pointer is invalid after the function returns.

(hm, looks like gcc doesn't actually have __attribute__((free)) yet.
that's unfortunate.  there's a potential solution in gcc-11 that might
do what we need)

