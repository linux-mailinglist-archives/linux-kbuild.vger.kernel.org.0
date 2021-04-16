Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC02B3624C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 17:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234323AbhDPP6v (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 11:58:51 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:45829 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S236485AbhDPP6u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 11:58:50 -0400
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 13GFw586010940
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Apr 2021 11:58:06 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
        id 409B115C3B0D; Fri, 16 Apr 2021 11:58:05 -0400 (EDT)
Date:   Fri, 16 Apr 2021 11:58:05 -0400
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHm0DYB08ZI2kuZm@mit.edu>
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
> > On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
> > >   - Featureful language: sum types, pattern matching, generics,
> > >     RAII, lifetimes, shared & exclusive references, modules &
> > >     visibility, powerful hygienic and procedural macros...
> > 
> > IMO RAII is over-valued, but just in case you care, the below seems to
> > work just fine. No fancy new language needed, works today. Similarly you
> > can create refcount_t guards, or with a little more work full blown
> > smart_ptr crud.
> 
> Peter, we do care, thank you for posting this. It's a great example for us to
> discuss some of the minutiae of what we think Rust brings to the table in
> addition to what's already possible in C.

Another fairly common use case is a lockless, racy test of a
particular field, as an optimization before we take the lock before we
test it for realsies.  In this particular case, we can't allocate
memory while holding a spinlock, so we check to see without taking the
spinlock to see whether we should allocate memory (which is expensive,
and unnecessasry most of the time):

alloc_transaction:
	/*
	 * This check is racy but it is just an optimization of allocating new
	 * transaction early if there are high chances we'll need it. If we
	 * guess wrong, we'll retry or free the unused transaction.
	 */
	if (!data_race(journal->j_running_transaction)) {
		/*
		 * If __GFP_FS is not present, then we may be being called from
		 * inside the fs writeback layer, so we MUST NOT fail.
		 */
		if ((gfp_mask & __GFP_FS) == 0)
			gfp_mask |= __GFP_NOFAIL;
		new_transaction = kmem_cache_zalloc(transaction_cache,
						    gfp_mask);
		if (!new_transaction)
			return -ENOMEM;
	}
	...
repeat:
	read_lock(&journal->j_state_lock);
	...
	if (!journal->j_running_transaction) {
		read_unlock(&journal->j_state_lock);
		if (!new_transaction)
			goto alloc_transaction;
		write_lock(&journal->j_state_lock);
		if (!journal->j_running_transaction &&
		    (handle->h_reserved || !journal->j_barrier_count)) {
			jbd2_get_transaction(journal, new_transaction);
			new_transaction = NULL;
		}
		write_unlock(&journal->j_state_lock);
		goto repeat;
	}
	...


The other thing that I'll note is that diferent elements in thet
journal structure are protected by different spinlocks; we don't have
a global lock protecting the entire structure, which is critical for
scalability on systems with a large number of CPU's with a lot of
threads all wanting to perform file system operations.

So having a guard structure which can't be bypassed on the entire
structure would result in a pretty massive performance penalty for the
ext4 file system.  I know that initially the use of Rust in the kernel
is targetted for less performance critical modules, such as device
drivers, but I thought I would mention some of the advantages of more
advanced locking techniques.

Cheers,

					- Ted
