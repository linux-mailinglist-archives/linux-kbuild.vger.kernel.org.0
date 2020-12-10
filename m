Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98532D6B3C
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 00:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbgLJW56 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Dec 2020 17:57:58 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:59637 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727022AbgLJW5i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Dec 2020 17:57:38 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-141-It5R_dMHNwKIf0Xeoz5iHA-1; Thu, 10 Dec 2020 22:43:29 +0000
X-MC-Unique: It5R_dMHNwKIf0Xeoz5iHA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 10 Dec 2020 22:43:28 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 10 Dec 2020 22:43:28 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Dominique Martinet' <asmadeus@codewreck.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
CC:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: RE: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
Thread-Topic: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
Thread-Index: AQHWzlMiS9jNVW0o7U6RgrmdYSfLQqnvTUdggAD1DgqAAKpa0A==
Date:   Thu, 10 Dec 2020 22:43:28 +0000
Message-ID: <a9bc168cd2b84cc29e6cd4d25387a4f4@AcuMS.aculab.com>
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
 <69c82aee-59ec-f8d8-9546-b38f85bf08c0@arm.com>
 <20201209174252.GA27721@nautica>
 <5ca5c3bb23614af0a35f01f1e3a84ead@AcuMS.aculab.com>
 <a68a09ce-f172-bfb4-6422-b1776d798f5f@arm.com>
 <20201210122202.GA8323@nautica>
In-Reply-To: <20201210122202.GA8323@nautica>
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

RnJvbTogJ0RvbWluaXF1ZSBNYXJ0aW5ldCcNCj4gU2VudDogMTAgRGVjZW1iZXIgMjAyMCAxMjoy
Mg0KPiANCj4gVmluY2Vuem8gRnJhc2Npbm8gd3JvdGUgb24gVGh1LCBEZWMgMTAsIDIwMjA6DQo+
ID4gT24gMTIvOS8yMCAxMDowMyBQTSwgRGF2aWQgTGFpZ2h0IHdyb3RlOg0KPiA+PiBXaHkgYm90
aGVyIHdpdGggYXdrPw0KPiANCj4gSSB3YW50ZWQgdG8ga2VlcCB0aGUgcGF0Y2ggbWluaW1hbCwg
SSdtIG5vdCBvcHBvc2VkIHRvIHJld3JpdGluZyBidXQNCj4gdGhhdCBhbHdheXMgcG90ZW50aWFs
bHkgaGFzIG1vcmUgaW1wYWN0IChhbHRob3VnaCBhcyB5b3Ugc2F5LCB0aGlzDQo+IHNjcmlwdCBp
cyBzaW1wbGUgZW5vdWdoKQ0KPiANCj4gPiA+IEkgdGhpbmsgeW91IGNhbiBkbyBpdCBhbGwgaW4g
YSBzaGVsbCBmdW5jdGlvbi4NCj4gPiA+IFNvbWV0aGluZyBsaWtlOg0KPiA+ID4gCXJlYWQgbGlu
ZQ0KPiA+ID4gCWxpbmU9JHtsaW5lIyMqKX0NCj4gPiA+IAlsaW5lPSR7bGluZSMjKnZlcnNpb24g
fQ0KPiA+ID4gCUlGUz0nLi0nDQo+ID4gPiAJc2V0ICRsaW5lDQo+ID4gPiAJZWNobyAkKCgkMSox
MDAwMDAwMDAgKyAkMioxMDAwMDAwICsgJDMqMTAwMDApKQ0KPiA+ID4NCj4gPiA+IFRoYXQgd2ls
bCB3b3JrIG9uIGFueSByZWNlbnQgc2hlbGwuDQo+IA0KPiBXb3JrcyBmb3IgbWUuDQoNClRoYXQg
d2FzIGEgdmVyeSBxdWljayByZXdyaXRlIG9mIHdoYXQgSSB0aGluayB0aGUgYXdrIHNjcmlwdCBk
aWQuDQpIb3dldmVyIEkgdGhpbmsgdGhlIHZlcnNpb24gaXMgaW4gdGhlIGxhc3Qgc3BhY2Utc2Vw
YXJhdGVkIHdvcmQuDQpTbyB5b3UgY2FuIGRvICh1bnRlc3RlZCk6DQoJcmVhZCBsaW5lDQoJc2V0
IGxpbmUNCglzaGlmdCAkKCgkIy0xKSkNCglPSUZTPSIkSUZTIg0KCUlGUz0nLi0nDQoJc2V0ICQx
DQoJSUZTPSIkT0lGUyINCgllY2hvICQoKCQxKjEwMDAwMDAwMCArICQyKjEwMDAwMDAgKyAkMyox
MDAwMCkpDQoNCk5vdywgaWYgeW91IHdhbnQgYSB2ZXJzaW9uIHRoYXQgd2lsbCB3b3JrIHdpdGgg
YSByZWFsIGJvdXJuZSBzaGVsbA0KKHRoYXQgZG9lc24ndCBzdXBwb3J0ICQoKGV4cHIpKSBvciAk
KHgjI2J9IGl0IGdldHMgbW9yZSBpbnRlcmVzdGluZy4NCg0KWWVzLCBidXQgZm9yIG5vdywgcmV2
ZXJ0IGZpcnN0Lg0KSXQgbWlnaHQgZXZlbiBiZSB0aGF0IHRoZSB3aG9sZSBmaWxlIGlzbid0IG5l
ZWRlZC4NCklmIGl0IG9ubHkgdXNlZCBmcm9tIGEgTWFrZWZpbGUgaXQgY2FuIGJlIGdvbmUgd2l0
aCBnbWFrZSBjb21tYW5kcy4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtl
c2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBV
Sw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

