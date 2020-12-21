Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC0A2DFD0E
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 15:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgLUOw7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 09:52:59 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:47969 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726841AbgLUOw6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 09:52:58 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-114-ZT--plLVNhuSAIaNfelOAQ-1; Mon, 21 Dec 2020 14:51:19 +0000
X-MC-Unique: ZT--plLVNhuSAIaNfelOAQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 21 Dec 2020 14:51:16 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 21 Dec 2020 14:51:16 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Masahiro Yamada' <masahiroy@kernel.org>
CC:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "Dominique Martinet" <asmadeus@codewreck.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
Thread-Topic: [PATCH 3/3] kbuild: rewrite ld-version.sh in shell script
Thread-Index: AQHW0KfRQeCeMjpix0eG5Uz36Tqg2qnz/UVAgA2stgCAAAFxEA==
Date:   Mon, 21 Dec 2020 14:51:16 +0000
Message-ID: <2a0911ccea3d47e0bfa5ab6ca2d26bb5@AcuMS.aculab.com>
References: <20201212165431.150750-1-masahiroy@kernel.org>
 <20201212165431.150750-3-masahiroy@kernel.org>
 <ff1adc79f7884ba1a1dcbdd806e81d7b@AcuMS.aculab.com>
 <CAK7LNAT0-_C3N1AO9uPV-G9U99YMeusD5HULnSmX2CfswQsuYQ@mail.gmail.com>
In-Reply-To: <CAK7LNAT0-_C3N1AO9uPV-G9U99YMeusD5HULnSmX2CfswQsuYQ@mail.gmail.com>
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

RnJvbTogTWFzYWhpcm8gWWFtYWRhDQo+IFNlbnQ6IDIxIERlY2VtYmVyIDIwMjAgMTQ6MjkNCj4g
DQo+IE9uIFN1biwgRGVjIDEzLCAyMDIwIGF0IDY6NDcgQU0gRGF2aWQgTGFpZ2h0IDxEYXZpZC5M
YWlnaHRAYWN1bGFiLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBNYXNhaGlybyBZYW1hZGEN
Cj4gPiA+IFNlbnQ6IDEyIERlY2VtYmVyIDIwMjAgMTY6NTUNCj4gPiA+DQo+ID4gPiBUaGlzIHNj
cmlwdCB3YXMgd3JpdHRlbiBpbiBhd2sgaW4gc3BpdGUgb2YgdGhlIGZpbGUgZXh0ZW5zaW9uICcu
c2gnLg0KPiA+ID4gUmV3cml0ZSBpdCBhcyBhIHNoZWxsIHNjcmlwdC4NCj4gPiAuLi4NCj4gPiA+
ICsjDQo+ID4gPiArIyBVc2FnZTogJCAuL3NjcmlwdHMvbGQtdmVyc2lvbi5zaCBsZA0KPiA+ID4g
KyMNCj4gPiA+ICsjIFByaW50IHRoZSBsaW5rZXIgdmVyc2lvbiBvZiBgbGQnIGluIGEgNSBvciA2
LWRpZ2l0IGZvcm0NCj4gPiA+ICsjIHN1Y2ggYXMgYDIzNTAxJyBmb3IgR05VIGxkIDIuMzUuMSBl
dGMuDQo+ID4gPiArDQo+ID4gPiArZmlyc3RfbGluZT0iJCgkKiAtLXZlcnNpb24gfCBoZWFkIC1u
IDEpIg0KPiA+ID4gKw0KPiA+ID4gK2lmICEgKCBlY2hvICRmaXJzdF9saW5lIHwgZ3JlcCAtcSAi
R05VIGxkIik7IHRoZW4NCj4gPiA+ICsgICAgIGVjaG8gMA0KPiA+ID4gKyAgICAgZXhpdCAxDQo+
ID4gPiArZmkNCj4gPiA+ICsNCj4gPiA+ICsjIERpc3RyaWJ1dGlvbnMgbWF5IGFwcGVuZCBhbiBl
eHRyYSBzdHJpbmcgbGlrZSAyLjM1LTE1LmZjMzMNCj4gPiA+ICsjIFRha2UgdGhlIHBhcnQgdGhh
dCBjb25zaXN0cyBvZiBudW1iZXJzIGFuZCBkb3RzLg0KPiA+ID4gK1ZFUlNJT049JChlY2hvICRm
aXJzdF9saW5lIHwgc2VkICdzLy4qIFwoW14gXSpcKSQvXDEvJyB8IHNlZCAncy9eXCheWzAtOS5d
KlwpLiovXDEvJykNCj4gPiA+ICtNQUpPUj0kKGVjaG8gJFZFUlNJT04gfCBjdXQgLWQgLiAtZiAx
KQ0KPiA+ID4gK01JTk9SPSQoZWNobyAkVkVSU0lPTiB8IGN1dCAtZCAuIC1mIDIpDQo+ID4gPiAr
UEFUQ0hMRVZFTD0kKGVjaG8gJFZFUlNJT04gfCBjdXQgLWQgLiAtZiAzKQ0KPiA+ID4gK3ByaW50
ZiAiJWQlMDJkJTAyZFxcbiIgJE1BSk9SICRNSU5PUiAkUEFUQ0hMRVZFTA0KPiA+DQo+ID4NCj4g
PiBIbW1tbS4uLi4uDQo+ID4gWW91J3ZlIG1hbmFnZWQgdG8gY29udmVydCBhbiBhd2sgc2NyaXB0
IGludG8gc29tZXRoaW5nIHRoYXQgcmVxdWlyZXMNCj4gPiBzaCwgaGVhZCwgZ3JlcCwgc2VkICh0
d2ljZSksIGFuZCBjdXQgKHRocmljZSkuDQo+ID4gUGx1cyAocHJvYmFibHkpIGEgZmV3IHN1Yi1z
aGVsbHMuDQo+ID4NCj4gPiBJdCBpcyBxdWl0ZSBlYXNlIHRvIGRvIGl0IGFsbCBpbiBhbGwgaW4g
dGhlIHNoZWxsLg0KPiA+DQo+ID4gICAgICAgICBEYXZpZA0KPiA+DQo+IA0KPiBPSywgcGxlYXNl
IHJld3JpdGUgdGhlIGNvZGUuDQoNCkkndmUgcG9zdGVkIGEgY291cGxlIG9mIHZlcnNpb25zIGJl
Zm9yZSwgaG93IGFib3V0IHRoaXMgb25lLg0KSSd2ZSBhZGRlZCBhIGZldyBjb21tZW50cyAtIHdo
aWNoIGRvbid0IG5lZWQgdG8gYmUgaW4gdGhlIGZpbmFsIHZlcnNpb24uDQoNCiMgR2V0IHRoZSBm
aXJzdCBsaW5lIG9mIHRoZSAnbGQgLS12ZXJzaW9uJyBvdXRwdXQNCmlmIGlucHV0X2Zyb21fZnJv
bV9zdGRpbjsgdGhlbg0KCXJlYWQgbGluZQ0KZWxzZQ0KCUlGUz0nDQonDQoJc2V0IC0tICQoIiRA
IikNCglsaW5lPSIkMSINCmZpDQoNCiMgU3BsaXQgdGhlIGxpbmUgb24gJ3NwYWNlJyBhbmQgZ2V0
IHRoZSBsYXN0IHdvcmQNCklGUz0nICcNCnNldCAtLSAkbGluZQ0Kc2hpZnQgJCgoJCMgLSAxKSkN
CnZlcnNpb249IiQxIg0KDQojIFNwbGl0IG9uICcuJyBhbmQgJy0nDQpJRlM9Jy4tJw0Kc2V0IC0t
ICR2ZXJzaW9uDQoNCiMgVGhlIHRocmVlIHZlcnNpb24gY29tcG9uZW50cyBhcmUgbm93ICQxICQy
IGFuZCAkMw0KIyBzbyB5b3UgY2FuIGRvIGVpdGhlcg0KcHJpbnRmICIlZCUwMmQlMDJkXFxuIiAk
MSAkMiAkMw0KIyBvcg0KZWNobyAkKCgkMSAqIDEwMDAwICsgJDIgKiAxMDAgKyAkMykpDQojIGJv
dGggYXJlIGJ1aWx0aW5zIG9uIHJlY2VudCBzaGVsbHMgKHByaW50ZiBpcyBtb3N0IGxpa2VseSBu
b3QgdG8gYmUpLg0KDQpTbyB0aGlzIHNob3VsZCBiZSB0aGUgc2FtZSBhcyB0aGUgc2NyaXB0IGFi
b3ZlOg0KDQojISAvYmluL3NoDQpJRlM9Jw0KJw0Kc2V0IC0tICQoIiRAIikNCiMgVGhlIGxhc3Qg
d29yZCBjb250YWlucyB0aGUgdmVyc2lvbg0KSUZTPScgJw0Kc2V0IC0tICQxDQpzaGlmdCAkKCgk
IyAtIDEpKQ0KIyBHZXQgdGhlIGZpcnN0IDMgcGFydHMgb2YgdGhlIHZlcnNpb24NCklGUz0nLi0n
DQpzZXQgLS0gJDENCnByaW50ZiAiJWQlMDJkJTAyZFxcbiIgJDEgJDIgJDMNCg0KU2VlbXMgdG8g
d29yayBmb3IgbWUuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUs
IEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJl
Z2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

