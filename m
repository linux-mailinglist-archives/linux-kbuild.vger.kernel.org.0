Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBDC35FD93
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 00:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbhDNWJF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 18:09:05 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:31966 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229601AbhDNWJE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 18:09:04 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-278-COdCX1_0NSOkN3DKPxuSAw-1; Wed, 14 Apr 2021 23:08:39 +0100
X-MC-Unique: COdCX1_0NSOkN3DKPxuSAw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 14 Apr 2021 23:08:39 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Wed, 14 Apr 2021 23:08:39 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Linus Torvalds' <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
CC:     "ojeda@kernel.org" <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXMWvcR6TAvlURwUWbKsHSAM883qq0kO+w
Date:   Wed, 14 Apr 2021 22:08:39 +0000
Message-ID: <62371527c2a74bce82881a8a09d65e10@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414200953.GX2531743@casper.infradead.org>
 <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
In-Reply-To: <CAHk-=wgdhVW3+YFHG5Le=mZMYf3mGjgv1f-Td=254bj9fYd7fg@mail.gmail.com>
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
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMTQgQXByaWwgMjAyMSAyMToyMg0KPiANCj4g
T24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgMToxMCBQTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5m
cmFkZWFkLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBUaGVyZSdzIGEgcGhpbG9zb3BoaWNhbCBwb2lu
dCB0byBiZSBkaXNjdXNzZWQgaGVyZSB3aGljaCB5b3UncmUgc2thdGluZw0KPiA+IHJpZ2h0IG92
ZXIhICBTaG91bGQgcnVzdC1pbi10aGUtbGludXgta2VybmVsIHByb3ZpZGUgdGhlIHNhbWUgbWVt
b3J5DQo+ID4gYWxsb2NhdGlvbiBBUElzIGFzIHRoZSBydXN0LXN0YW5kYXJkLWxpYnJhcnksIG9y
IHNob3VsZCBpdCBwcm92aWRlIGEgUnVzdHkNCj4gPiBBUEkgdG8gdGhlIHN0YW5kYXJkLWxpbnV4
LW1lbW9yeS1hbGxvY2F0aW9uIEFQSXM/DQo+IA0KPiBZZWFoLCBJIHRoaW5rIHRoYXQgdGhlIHN0
YW5kYXJkIFJ1c3QgQVBJIG1heSBzaW1wbHkgbm90IGJlIGFjY2VwdGFibGUNCj4gaW5zaWRlIHRo
ZSBrZXJuZWwsIGlmIGl0IGhhcyBzaW1pbGFyIGJlaGF2aW9yIHRvIHRoZSAoY29tcGxldGVseQ0K
PiBicm9rZW4pIEMrKyAibmV3IiBvcGVyYXRvci4NCg0KSVNUTSB0aGF0IGhhdmluZyBtZW1vcnkg
YWxsb2NhdGlvbiBmYWlsdXJlIGNhdXNlIGEgdXNlciBwcm9jZXNzDQp0byBleGl0IGlzIGEgY29t
cGxldGUgZmFpbHVyZSBpbiBzb21ldGhpbmcgZGVzaWduZWQgdG8gcnVuIGFzDQphbmQga2luZCBv
ZiBzZXJ2aWNlIHByb2dyYW0uDQoNClRoZXJlIGFyZSBhbGwgc29ydHMgb2YgcmVhc29ucyB3aHkg
bWFsbG9jKCkgbWlnaHQgZmFpbC4NCllvdSBhbG1vc3QgbmV2ZXIgd2FudCBhICdyZWFsJyBwcm9n
cmFtIHRvIGFib3J0IG9uIG9uZS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBM
YWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBU
LCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

