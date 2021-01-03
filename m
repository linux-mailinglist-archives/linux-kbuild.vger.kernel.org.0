Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244802E8DAA
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Jan 2021 18:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbhACRlb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Jan 2021 12:41:31 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:53501 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726026AbhACRla (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Jan 2021 12:41:30 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-191-SEkvrg5vNi2DwVOKN-8MHg-1; Sun, 03 Jan 2021 17:39:52 +0000
X-MC-Unique: SEkvrg5vNi2DwVOKN-8MHg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sun, 3 Jan 2021 17:39:51 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Sun, 3 Jan 2021 17:39:51 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Bernd Petrovitsch' <bernd@petrovitsch.priv.at>,
        "sedat.dilek@gmail.com" <sedat.dilek@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: Linux 5.11-rc1
Thread-Topic: Linux 5.11-rc1
Thread-Index: AQHW4PeFLgQEBm/mQk6hoWV3rGbJe6oWKwGQ
Date:   Sun, 3 Jan 2021 17:39:51 +0000
Message-ID: <3f76e002f96b43de903133b5cd053012@AcuMS.aculab.com>
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
         <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
         <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com>
         <20210101161435.GA344@duo.ucw.cz>
         <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
         <CAK7LNASQZ7SWrAykdH71iq6SyLj=gG-EGhCy8SHkDz_bdq2BMw@mail.gmail.com>
         <CA+icZUXyfv0sOP=UG6oeoxpHbEpOrufJzzUWb3ZOpE_TMQerwQ@mail.gmail.com>
 <b9d3c1063d4c3f9a0cb71442cc92ad77a859d438.camel@petrovitsch.priv.at>
In-Reply-To: <b9d3c1063d4c3f9a0cb71442cc92ad77a859d438.camel@petrovitsch.priv.at>
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

RnJvbTogQmVybmQgUGV0cm92aXRzY2gNCj4gU2VudDogMDIgSmFudWFyeSAyMDIxIDExOjA1DQo+
IA0KPiBPbiBTYXQsIDIwMjEtMDEtMDIgYXQgMTA6MTMgKzAxMDAsIFNlZGF0IERpbGVrIHdyb3Rl
Og0KPiBbLi4uXQ0KPiA+IFRvIGJlIGhvbmVzdCBJIHdvbmRlcmVkIHdoeSB0aGVyZSB3ZXJlIG5v
IG1vcmUgcmVwb3J0cyBvbiB0aGlzLg0KPiANCj4gUGVyaGFwcyBJJ20gbm90IHRoZSBvbmx5IG9u
ZSB3aG8gaGFzIC9zYmluIGFuZCAvdXNyL3NiaW4gaW4gdGhlDQo+ICRQQVRIIG9mIG5vcm1hbCBh
Y2NvdW50cyB0b28gKGFuZCBpZGsgd2hhdCdzIHRoZSBkZWZhdWx0DQo+IGJlaGF2aW91ciBvZiBk
aXN0cmlidXRpb25zIGlzIC0gbXkgLmJhc2hyYyAiZml4ZXMiIHRoZQ0KPiAkUEFUSCkuDQoNClll
cCwgSSd2ZSBwcmV0dHkgbXVjaCBhbHdheXMgYWRkZWQgc2JpbiB0byBteSBub24tcm9vdCAkUEFU
SA0KZm9yIG1vc3Qgb2YgdGhlIGxhc3QgMzArIHllYXJzLg0KVG9vIG11Y2ggc3R1ZmYgdGhhdCBh
ICd0ZWNoaWUnIHdhbnRzIHRvIHJ1biBub24tcm9vdCBpcyBpbiB0aGVyZS4NCg0KL3Vzci9iaW4s
IC91c3Ivc2JpbiBhbmQgL3Vzci9saWIgc2hvdWxkIGhhdmUgZ290IHJlbW92ZWQgb25jZQ0KZGlz
a3MgZ290IGxhcmdlIGVub3VnaCB0aGF0IHRoZSBib290IGRpc2sgKGFrYSAvKSBkaWRuJ3Qgb3Zl
cmZsb3cNCnJlcXVpcmVkIHNvbWUgc3lzdGVtIGZpbGVzIGJlIG1vdmVkIGludG8gdGhlICd1c2Vy
JyBkaXNrLg0KKFRoZSBsYXN0IGRpc2tzIHRoYXQgd2VyZW4ndCByZWFsbHkgYmlnIGVub3VnaCB3
ZXJlIHRoZSA2MDBNQiBvbmVzLg0KVGhlIHVzZXIncyBob21lIGRpcmVjdG9yaWVzIGNvdWxkIGdv
IGludG8gL3VzciB3aGVyZSB0aGV5IGJlbG9uZy4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQg
QWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVz
LCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

