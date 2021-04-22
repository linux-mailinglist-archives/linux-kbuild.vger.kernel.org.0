Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B08B368223
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Apr 2021 16:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbhDVOKK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Apr 2021 10:10:10 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:44050 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236395AbhDVOKJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Apr 2021 10:10:09 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-282-h23dZCneOHWWwBdb6SzMnw-1; Thu, 22 Apr 2021 15:09:31 +0100
X-MC-Unique: h23dZCneOHWWwBdb6SzMnw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 22 Apr 2021 15:09:31 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Thu, 22 Apr 2021 15:09:30 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Linus Walleij' <linus.walleij@linaro.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
CC:     Peter Zijlstra <peterz@infradead.org>,
        "ojeda@kernel.org" <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXN17Az8CFzDjGVk2RBMeMGwuyearAkXcA
Date:   Thu, 22 Apr 2021 14:09:30 +0000
Message-ID: <b6bddd3ea41644b0a353b8a4b7028bdc@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
In-Reply-To: <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
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

RnJvbTogTGludXMgV2FsbGVpag0KPiBTZW50OiAyMiBBcHJpbCAyMDIxIDExOjAzDQouLi4NCj4g
SSBnbyB0byBwYXRjaCAxMi8xMyBhbmQgSSBzZWUgdGhpbmdzIGxpa2UgdGhpczoNCj4gDQo+ICsv
Ly8gQSBkZXNjcmlwdG9yIG9mIHdyYXBwZWQgbGlzdCBlbGVtZW50cy4NCj4gK3B1YiB0cmFpdCBH
ZXRMaW5rc1dyYXBwZWQ6IEdldExpbmtzIHsNCj4gKyAgICAvLy8gU3BlY2lmaWVzIHdoaWNoIHdy
YXBwZXIgKGUuZy4sIGBCb3hgIGFuZCBgQXJjYCkgd3JhcHMgdGhlIGxpc3QgZW50cmllcy4NCj4g
KyAgICB0eXBlIFdyYXBwZWQ6IFdyYXBwZXI8U2VsZjo6RW50cnlUeXBlPjsNCj4gK30NCj4gKw0K
PiAraW1wbDxUOiA/U2l6ZWQ+IEdldExpbmtzV3JhcHBlZCBmb3IgQm94PFQ+DQo+ICt3aGVyZQ0K
PiArICAgIEJveDxUPjogR2V0TGlua3MsDQo+ICt7DQo+ICsgICAgdHlwZSBXcmFwcGVkID0gQm94
PDxCb3g8VD4gYXMgR2V0TGlua3M+OjpFbnRyeVR5cGU+Ow0KPiArfQ0KPiArDQo+ICtpbXBsPFQ6
IEdldExpbmtzICsgP1NpemVkPiBHZXRMaW5rcyBmb3IgQm94PFQ+IHsNCj4gKyAgICB0eXBlIEVu
dHJ5VHlwZSA9IFQ6OkVudHJ5VHlwZTsNCj4gKyAgICBmbiBnZXRfbGlua3MoZGF0YTogJlNlbGY6
OkVudHJ5VHlwZSkgLT4gJkxpbmtzPFNlbGY6OkVudHJ5VHlwZT4gew0KPiArICAgICAgICA8VCBh
cyBHZXRMaW5rcz46OmdldF9saW5rcyhkYXRhKQ0KPiArICAgIH0NCj4gK30NCj4gDQo+IE15IEdv
ZC4gTG9zZSB0aGUgaG9ycmlibGUgQ2FtZWxDYXNlIHRvIGJlZ2luIHdpdGguIEkgaG9wZSB0aGUN
Cj4gbGFuZ3VhZ2Ugc3BlYyBkb2VzIG5vdCBtYW5kYXRlIHRoYXQgYmVjYXVzZSBvdXIga2VybmVs
IEMgc3R5bGUNCj4gZG9lcyBub3QgdXNlIGl0Lg0KDQpUaGF0Og0KDQoxKSBMb29rcyBhcyB0aG91
Z2ggaXQgY291bGQgYmUgZ2VuZXJhdGVkIGJ5IHRva2VuIHBhc3RpbmcgaW4gYSAjZGVmaW5lLg0K
MikgU2VlbXMgdG8gYmUgZnVsbCBvZiB3aGF0IGxvb2sgbGlrZSBjYXN0cy4NCg0KSSByZWFsbHkg
d291bGRuJ3Qgd2FudCB0byBidW1wIGludG8gbXVsdGlwbGUgY29waWVzIG9mIGl0Lg0KDQpUaGUg
b3RoZXIgaXNzdWUgaXMgdGhhdCAoYWxsIG1vc3QpIGFsbCB1c2VzIG9mIGEgc3ltYm9sDQpjYW4g
YmUgZm91bmQgYnkgcnVubmluZzoNCiAgIGdyZXAgLXIgLS1pbmNsdWRlICcqLltjaHNTXScgJ1w8
c3ltYm9sXD4nIC4NCm9mdGVuIHVzZWQgYXM6DQogICB2aSBgZ3JlcCAtbCAtciAnXDxzeW1ib2xc
PicgLmANCg0KQnV0IGl0IGxvb2tzIGxpa2UgdGhlIHJ1c3Qgd3JhcHBlcnMgYXJlIGdvaW5nIHRv
IGJyZWFrIHRoYXQuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUs
IEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJl
Z2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

