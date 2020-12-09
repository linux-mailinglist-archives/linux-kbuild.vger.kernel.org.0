Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F602D4D36
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Dec 2020 23:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388414AbgLIWEo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 9 Dec 2020 17:04:44 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:48803 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388410AbgLIWEo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 9 Dec 2020 17:04:44 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-263-hAptJ3fgMkqTIdgJqXFORA-1; Wed, 09 Dec 2020 22:03:05 +0000
X-MC-Unique: hAptJ3fgMkqTIdgJqXFORA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 9 Dec 2020 22:03:05 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 9 Dec 2020 22:03:05 +0000
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
Thread-Index: AQHWzlMiS9jNVW0o7U6RgrmdYSfLQqnvTUdg
Date:   Wed, 9 Dec 2020 22:03:04 +0000
Message-ID: <5ca5c3bb23614af0a35f01f1e3a84ead@AcuMS.aculab.com>
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
 <69c82aee-59ec-f8d8-9546-b38f85bf08c0@arm.com>
 <20201209174252.GA27721@nautica>
In-Reply-To: <20201209174252.GA27721@nautica>
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

RnJvbTogRG9taW5pcXVlIE1hcnRpbmV0DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMjAgMTc6NDMN
Cj4gDQo+IEkndmUgc3VnZ2VzdGVkIGVpdGhlciBqdXN0IHJldmVydGluZyB0aGlzIChJJ2xsIGtl
ZXAgbXkgbG9jYWwNCj4gd29ya2Fyb3VuZCkgb3IgZ29pbmcgdGhyb3VnaCAvYmluL3NoIHdoaWNo
IGlzIGFsd2F5cyBzYWZlIGxpa2UgdGhlDQo+IGZvbGxvd2luZyBwYXRjaCAtLSBsZWF2aW5nIHRo
aXMgdG8gbWFpbnRhaW5lcnMuDQo+IA0KPiBUaGFua3MhDQo+IC0tLS0tDQo+IEZyb20gZDUzZWYz
YjRjNTVhYTJlYTVmOWFlODg3YjNlMWFjZTM2OGYzMGY2NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDENCj4gRnJvbTogRG9taW5pcXVlIE1hcnRpbmV0IDxhc21hZGV1c0Bjb2Rld3JlY2sub3JnPg0K
PiBEYXRlOiBXZWQsIDE1IEp1bCAyMDIwIDE2OjAwOjEzICswMjAwDQo+IFN1YmplY3Q6IFtQQVRD
SF0gbGQtdmVyc2lvbjogdXNlIC9iaW4vc2ggdGhlbiBhd2sgZm9yIHNoZWJhbmsNCj4gDQo+IC91
c3IvYmluL2F3ayBpcyBub3QgZ2FyYW50ZWVkIHRvIGV4aXN0IChhbmQgZG9lc24ndCBvbiBlLmcu
IG5peG9zKSwNCj4gdXNpbmcgL2Jpbi9zaCBhbmQgaW52b2tpbmcgYXdrIHRvIGhhdmUgaXQgbG9v
ayBpbiBQQVRIIGlzIG1vcmUgcm9idXN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG9taW5pcXVl
IE1hcnRpbmV0IDxhc21hZGV1c0Bjb2Rld3JlY2sub3JnPg0KPiANCj4gZGlmZiAtLWdpdCBhL3Nj
cmlwdHMvbGQtdmVyc2lvbi5zaCBiL3NjcmlwdHMvbGQtdmVyc2lvbi5zaA0KPiBpbmRleCBmMmJl
MGZmOWE3MzguLjAyZGJhZDdiNTYxMyAxMDA3NTUNCj4gLS0tIGEvc2NyaXB0cy9sZC12ZXJzaW9u
LnNoDQo+ICsrKyBiL3NjcmlwdHMvbGQtdmVyc2lvbi5zaA0KPiBAQCAtMSwxMSArMSwxMSBAQA0K
PiAtIyEvdXNyL2Jpbi9hd2sgLWYNCj4gKyMhL2Jpbi9zaA0KPiAgIyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMA0KPiAgIyBleHRyYWN0IGxpbmtlciB2ZXJzaW9uIG51bWJlciBmcm9t
IHN0ZGluIGFuZCB0dXJuIGludG8gc2luZ2xlIG51bWJlcg0KPiAtICAgICAgIHsNCj4gK2F3ayAn
ew0KPiAgICAgICAgIGdzdWIoIi4qXFwpIiwgIiIpOw0KPiAgICAgICAgIGdzdWIoIi4qdmVyc2lv
biAiLCAiIik7DQo+ICAgICAgICAgZ3N1YigiLS4qIiwgIiIpOw0KPiAgICAgICAgIHNwbGl0KCQx
LGEsICIuIik7DQo+ICAgICAgICAgcHJpbnQgYVsxXSoxMDAwMDAwMDAgKyBhWzJdKjEwMDAwMDAg
KyBhWzNdKjEwMDAwOw0KPiAgICAgICAgIGV4aXQNCj4gLSAgICAgICB9DQo+ICt9Jw0KDQpXaHkg
Ym90aGVyIHdpdGggYXdrPw0KSSB0aGluayB5b3UgY2FuIGRvIGl0IGFsbCBpbiBhIHNoZWxsIGZ1
bmN0aW9uLg0KU29tZXRoaW5nIGxpa2U6DQoJcmVhZCBsaW5lDQoJbGluZT0ke2xpbmUjIyopfQ0K
CWxpbmU9JHtsaW5lIyMqdmVyc2lvbiB9DQoJSUZTPScuLScNCglzZXQgJGxpbmUNCgllY2hvICQo
KCQxKjEwMDAwMDAwMCArICQyKjEwMDAwMDAgKyAkMyoxMDAwMCkpDQoNClRoYXQgd2lsbCB3b3Jr
IG9uIGFueSByZWNlbnQgc2hlbGwuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3Mg
TGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQ
VCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

