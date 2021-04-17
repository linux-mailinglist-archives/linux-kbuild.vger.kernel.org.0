Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40747363000
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 15:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236377AbhDQMrB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sat, 17 Apr 2021 08:47:01 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:46555 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232844AbhDQMq4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 08:46:56 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-59-3IFj0E0yMgO1leGLHdDhvw-1; Sat, 17 Apr 2021 13:46:27 +0100
X-MC-Unique: 3IFj0E0yMgO1leGLHdDhvw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 17 Apr 2021 13:46:26 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 17 Apr 2021 13:46:26 +0100
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
Thread-Index: AQHXMo9gR6TAvlURwUWbKsHSAM883qq4qPLg
Date:   Sat, 17 Apr 2021 12:46:26 +0000
Message-ID: <ed47452ebe0b4f0db7e951572cbb7676@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
In-Reply-To: <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
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

..
> The more you make it look like (Kernel) C, the easier it is for us C
> people to actually read. My eyes have been reading C for almost 30 years
> by now, they have a lexer built in the optical nerve; reading something
> that looks vaguely like C but is definitely not C is an utterly painful
> experience.

I'll see your 30 years and raise to over 35.
(And writing code that accesses hardware for 6 or 7 years before that.)

Both Java and go can look more like the K&R style C than any of the
examples from microsoft - which seem to utilise as much vertical space
as humanly? possible.

Those rust examples seemed to be of the horrid microsoft sytle.
Nothing about that style makes reading code easy.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

