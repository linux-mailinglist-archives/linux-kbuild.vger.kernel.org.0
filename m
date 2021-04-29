Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42FC36E6F7
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 10:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhD2IS5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 04:18:57 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:30783 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232714AbhD2IS5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 04:18:57 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-6-vki8S8smMJidjW5qU1ql5A-1; Thu, 29 Apr 2021 09:18:08 +0100
X-MC-Unique: vki8S8smMJidjW5qU1ql5A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 29 Apr 2021 09:18:07 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 29 Apr 2021 09:18:07 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'mceier+kernel@gmail.com'" <mceier+kernel@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
CC:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXPLdzOFPh/tHqwUWOAL+H8MAuYKrLJmrA
Date:   Thu, 29 Apr 2021 08:18:07 +0000
Message-ID: <a5e90fededc64ca2b8a29245a7d1d798@AcuMS.aculab.com>
References: <CAJTyqKMLaav7VCAZS9p8wh0UamACYq9p6h=LsyrCeLqG_O2Jcw@mail.gmail.com>
In-Reply-To: <CAJTyqKMLaav7VCAZS9p8wh0UamACYq9p6h=LsyrCeLqG_O2Jcw@mail.gmail.com>
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

RnJvbTogTWFyaXVzeiBDZWllcg0KPiBTZW50OiAyOSBBcHJpbCAyMDIxIDA2OjIxDQo+IA0KPiBP
biAyOC8wNC8yMDIxLCBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4g
d3JvdGU6DQo+ID4gT24gV2VkLCBBcHIgMjgsIDIwMjEgYXQgMTE6MzQgQU0gTWFyaXVzeiBDZWll
ciA8bWNlaWVyK2tlcm5lbEBnbWFpbC5jb20+DQo+ID4gd3JvdGU6DQo+ID4+DQo+ID4+IE1heWJl
IGl0IHdvdWxkIGFsc28gYmUgd29ydGh3aGlsZSB0byBtYWtlIHRoZSByZXF1aXJlbWVudCB0aGF0
IHRoZQ0KPiA+PiBrZXJuZWwgbXVzdCBiZSBidWlsZGFibGUgd2l0aCBmcmVlIHNvZnR3YXJlIChu
b3QganVzdCBvcGVuIHNvdXJjZQ0KPiA+PiBzb2Z0d2FyZSkgZXhwbGljaXQgPw0KPiA+DQo+ID4g
VGhlIGtlcm5lbCBpcyBhbHJlYWR5IGJ1aWxkYWJsZSBieSBMTFZNIChhbmQgY2xhbmcpOyBpbiBm
YWN0IEFuZHJvaWQsDQo+ID4gQ3JPUywgYW5kIEdvb2dsZSdzIHByb2R1Y3Rpb24gc2VydmVycyBh
bHJlYWR5IGRvIHNvLg0KPiA+IGh0dHBzOi8vY2xhbmdidWlsdGxpbnV4LmdpdGh1Yi5pby8NCj4g
DQo+IExMVk0vY2xhbmcgaXMgbm90IGZyZWUgc29mdHdhcmUgKGl0J3MganVzdCBvcGVuIHNvdXJj
ZSksIHNvIGl0IGRvZXNuJ3QNCj4gbWF0dGVyIGlmIGtlcm5lbCBidWlsZHMgb3Igbm90IHdpdGgg
aXQuIFdoYXQgc2hvdWxkIG1hdHRlciBpcyB3aGV0aGVyDQo+IGl0IGlzIGJ1aWxkYWJsZSB3aXRo
IGF0IGxlYXN0IG9uZSBHUEwgY29tcGlsZXIgbGlrZSBHQ0MuDQoNCkkgc3VzcGVjdCB0aGF0IHdo
YXQgbWF0dGVycyBmb3IgbW9zdCBwZW9wbGUgaXMgd2hldGhlciB0aGUgcmVxdWlyZWQNCmNvbXBp
bGVycyAoZXRjKSBhcmUgaW5zdGFsbGVkIGJ5IGEgZGVmYXVsdC1pc2ggaW5zdGFsbCBvZiB0aGVp
cg0KZmF2b3VyaXRlIGRpc3RyaWJ1dGlvbi4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRk
cmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBN
SzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

