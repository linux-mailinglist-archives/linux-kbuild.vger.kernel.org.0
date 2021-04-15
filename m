Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 200D236043C
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 10:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhDOI0s convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Thu, 15 Apr 2021 04:26:48 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:40453 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231534AbhDOI0r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 04:26:47 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-130-oIZcnRhLMq2oldGnfAngVw-1; Thu, 15 Apr 2021 09:26:22 +0100
X-MC-Unique: oIZcnRhLMq2oldGnfAngVw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 15 Apr 2021 09:26:21 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Thu, 15 Apr 2021 09:26:21 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Kees Cook' <keescook@chromium.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
CC:     Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXMZgZR6TAvlURwUWbKsHSAM883qq1O6Fw
Date:   Thu, 15 Apr 2021 08:26:21 +0000
Message-ID: <8eaa65020c0d44ed9122fed5acf945a0@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
 <CANiq72mSMtfdRFPGJKuoqCBFdsa_xHvx9ATjcB7QSunQdDHBuw@mail.gmail.com>
 <202104141820.7DDE15A30@keescook>
In-Reply-To: <202104141820.7DDE15A30@keescook>
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

...
> Besides just FP, 128-bit, etc, I remain concerned about just basic
> math operations. C has no way to describe the intent of integer
> overflow, so the kernel was left with the only "predictable" result:
> wrap around. Unfortunately, this is wrong in most cases, and we're left
> with entire classes of vulnerability related to such overflows.

I'm not sure any of the alternatives (except perhaps panic)
are much better.
Many years ago I used a COBOL system that skipped the assignment
if ADD X to Y (y += x) would overflow.
That gave a very hard to spot error when the sump of a long list
way a little too large.
If it had wrapped the error would be obvious.

There are certainly places where saturate is good.
Mostly when dealing with analogue samples.

I guess the problematic code is stuff that checks:
	if (foo->size + constant > limit) goto error;
instead of:
	if (foo->size > limit - constant) goto error;

    David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

