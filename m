Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90A8836F721
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Apr 2021 10:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhD3IbF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Apr 2021 04:31:05 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:29373 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229628AbhD3IbB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Apr 2021 04:31:01 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-40-Np76YJq-M2y5OMSF4pVFtw-1; Fri, 30 Apr 2021 09:30:08 +0100
X-MC-Unique: Np76YJq-M2y5OMSF4pVFtw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 30 Apr 2021 09:30:08 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Fri, 30 Apr 2021 09:30:08 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Thomas Schoebel-Theuer' <tst@schoebel-theuer.de>,
        Kajetan Puchalski <mrkajetanp@gmail.com>,
        "mceier+kernel@gmail.com" <mceier+kernel@gmail.com>
CC:     "ojeda@kernel.org" <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXPYuWOFPh/tHqwUWOAL+H8MAuYKrMuQKA
Date:   Fri, 30 Apr 2021 08:30:08 +0000
Message-ID: <ac41b3c803364f0cbc6c931449c2a51d@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <878s51e3jc.fsf@gmail.com>
 <7999ba57-9b95-265e-a189-d9ca01304b13@schoebel-theuer.de>
In-Reply-To: <7999ba57-9b95-265e-a189-d9ca01304b13@schoebel-theuer.de>
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

RnJvbTogVGhvbWFzIFNjaG9lYmVsLVRoZXVlcg0KPiBTZW50OiAzMCBBcHJpbCAyMDIxIDA3OjQw
DQouLi4NCj4gSW5kdXN0cnkgKHdoZXJlIEkgYW0gd29ya2luZykgb2Z0ZW4gcmVxdWlyZXMgYSAi
c2Vjb25kIHNvdXJjZSIgdG8gYXZvaWQNCj4gdGhlIHNvLWNhbGxlZCAidmVuZG9yIGxvY2staW4i
LCB3aGljaCBpcyB0aGUga2V5IHBvaW50IG9mIHRoaXMgcGFydCBvZg0KPiB0aGUgZGlzY3Vzc2lv
bi4NCg0KVGhlcmUgaXMgYWxzbyB0aGUgcmVsYXRlZCBwcm9ibGVtIHRoYXQgeW91IG5lZWQgdG8g
YmUgYWJsZSB0byBjb21lDQpiYWNrIGluIDUgeWVhcnMgdGltZSBhbmQgcmUtYnVpbGQgdGhlIG9y
aWdpbmFsIGltYWdlLg0KWW91IGNhbiB0aGVuIG1ha2UgbWlub3IgY2hhbmdlcywgcmVidWlsZCwg
YW5kIGhhdmUgYSByZWFzb25hYmxlDQpjb25maWRlbmNlIHRoYXQgdGhlcmUgYXJlIG5vIHNpZGUg
ZWZmZWN0cy4NCg0KVGhpcyBtZWFucyB0aGF0IHdlYi1iYXNlZCBhbmQgYXV0by11cGRhdGVkIHRv
b2xzIGNhbm5vdCBiZSB1c2VkLg0KRXZlbiBhIFZNIGltYWdlIG1pZ2h0IHN1ZGRlbmx5IGZhbGwg
Zm91bCBvZiBjaGFuZ2VzIHRvIGh5cGVydmlzb3JzLg0KU28geW91IG5lZWQgdG8ga2VlcCAoYXQg
bGVhc3QpIDIgc3lzdGVtIHRoYW4gY29udGFpbiBhbGwgdGhlIGJ1aWxkDQp0b29scyBqdXN0IGlu
IGNhc2UgeW91IG5lZWQgdG8gZG8gYSBtYWludGVuYW5jZSBidWlsZCBvZiBhbiBvbGQgcmVsZWFz
ZS4NCg0KQnV0IGV2ZW4gdGhlbiB3ZSBjYW4gbm8gbG9uZ2VyIGJ1aWxkIGRyaXZlcnMgZm9yIHNv
bWUgd2luZG93cw0Kc3lzdGVtcyBiZWNhdXNlIHdlIGNhbid0IHNpZ24gdGhlbSB3aXRoIHRoZSBv
bGQga2V5cy4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJh
bWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0
cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

