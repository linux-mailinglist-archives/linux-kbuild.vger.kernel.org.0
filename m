Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C7A362FF0
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 15:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236357AbhDQMmA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sat, 17 Apr 2021 08:42:00 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:54184 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236356AbhDQMlx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 08:41:53 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-269-mzuI8SJoOCStQ2el4rM6Jg-1; Sat, 17 Apr 2021 13:41:23 +0100
X-MC-Unique: mzuI8SJoOCStQ2el4rM6Jg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 17 Apr 2021 13:41:23 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 17 Apr 2021 13:41:23 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Peter Zijlstra' <peterz@infradead.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
CC:     "ojeda@kernel.org" <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXMst1R6TAvlURwUWbKsHSAM883qq4pSfA
Date:   Sat, 17 Apr 2021 12:41:23 +0000
Message-ID: <39b8cbb2cfba4a5ba913311cb2448f50@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
In-Reply-To: <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Peter Zijlstra
> Sent: 16 April 2021 15:19
> 
> On Fri, Apr 16, 2021 at 02:07:49PM +0100, Wedson Almeida Filho wrote:
> > On Fri, Apr 16, 2021 at 01:24:23PM +0200, Peter Zijlstra wrote:
> 
> > >  int perf_event_task_enable(void)
> > >  {
> > > +	DEFINE_MUTEX_GUARD(event_mutex, &current->perf_event_mutex);
> >
> > There is nothing in C forcing developers to actually use DEFINE_MUTEX_GUARD. So
> > someone may simply forget (or not know that they need) to lock
> > current->perf_event_mutex and directly access some field protected by it. This
> > is unlikely to happen when one first writes the code, but over time as different
> > people modify the code and invariants change, it is possible for this to happen.
> >
> > In Rust, this isn't possible: the data protected by a lock is only accessible
> > when the lock is locked. So developers cannot accidentally make mistakes of this
> > kind. And since the enforcement happens at compile time, there is no runtime
> > cost.
> >
> > This, we believe, is fundamental to the discussion: we agree that many of these
> > idioms can be implemented in C (albeit in this case with a compiler extension),
> > but their use is optional, people can (and do) still make mistakes that lead to
> > vulnerabilities; Rust disallows classes of  mistakes by construction.
> 
> Does this also not prohibit constructs where modification must be done
> while holding two locks, but reading can be done while holding either
> lock?
> 
> That's a semi common scheme in the kernel, but not something that's
> expressible by, for example, the Java sync keyword.
> 
> It also very much doesn't work for RCU, where modification must be done
> under a lock, but access is done essentially lockless.
...

Or the cases where the locks are released in the 'wrong' order.
Typically for:
	lock(table)
	item = lookup(table, key)
	lock(item)
	unlock(table)
	...
	unlock(item)

(In the kernel the table lock might be RCU.)

Or, with similar data:
	write_lock(table);
	foreach(item, table)
		lock(item)
		unlock(item)
	/* No items can be locked until we release the write_lock.
	...
	unlock(table)

You can also easily end up with a 'fubar' we have at work where
someone wrote a C++ condvar class that inherits from mutex.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

