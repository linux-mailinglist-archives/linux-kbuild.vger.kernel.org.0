Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2225936306D
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 15:46:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbhDQNqr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sat, 17 Apr 2021 09:46:47 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:32243 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230442AbhDQNqr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 09:46:47 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-111-IAuWgVVUPrqCWucM5QzTnw-1; Sat, 17 Apr 2021 14:46:17 +0100
X-MC-Unique: IAuWgVVUPrqCWucM5QzTnw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 17 Apr 2021 14:46:17 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 17 Apr 2021 14:46:17 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Peter Zijlstra' <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>
CC:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Willy Tarreau <w@1wt.eu>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXM3s7R6TAvlURwUWbKsHSAM883qq4tusA
Date:   Sat, 17 Apr 2021 13:46:17 +0000
Message-ID: <302c00b5de4d4320b8770aae7d84e175@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com> <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <YHnG+GRwiMqgHGs5@hirez.programming.kicks-ass.net>
 <20210416180829.GO2531743@casper.infradead.org>
 <YHrDwdQwEk2mSQWa@hirez.programming.kicks-ass.net>
In-Reply-To: <YHrDwdQwEk2mSQWa@hirez.programming.kicks-ass.net>
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
> Sent: 17 April 2021 12:17
...
> > (i'd argue this is C being broken; promoting only as far as int, when
> > assigning to an unsigned long is Bad, but until/unless either GCC fixes
> > that or the language committee realises that being stuck in the 1970s
> > is Bad, people are going to keep making this kind of mistake)
> 
> Well, I think the rules actually make sense, at the point in the syntax
> tree where + happens, we have 'unsigned char' and 'int', so at that
> point we promote to 'int'. Subsequently 'int' gets shifted and bad
> things happen.

The 1970s were fine.
K&R C was sign preserving - so 'unsigned char' promoted to 'unsigned int'.
The ANSI C committee broke things by changing it to value preserving
with the strong preference for signed types.

Even with ANSI C the type of ((unsigned char)x + 1) can be unsigned!
All it needs as an architecture where sizeof (int) == 1.
(sizeof (char) has to be 1 - even though that isn't directly explicit.)

Of course, having 32-bit 'char' and 'int' does give problems with
the value for EOF.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

