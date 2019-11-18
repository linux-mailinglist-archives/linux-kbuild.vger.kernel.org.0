Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7F0010020A
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2019 11:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbfKRKFH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Nov 2019 05:05:07 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:55130 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726814AbfKRKFG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Nov 2019 05:05:06 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-124-75K_-0LxPeummalnrpAD_w-1; Mon, 18 Nov 2019 10:05:02 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 18 Nov 2019 10:05:02 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 18 Nov 2019 10:05:02 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Josh Poimboeuf' <jpoimboe@redhat.com>
CC:     'Shile Zhang' <shile.zhang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "x86@kernel.org" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: RE: [RFC PATCH v3 7/7] x86/unwind/orc: remove run-time ORC unwind
 tables sort
Thread-Topic: [RFC PATCH v3 7/7] x86/unwind/orc: remove run-time ORC unwind
 tables sort
Thread-Index: AQHVm4CqL2sS2uy4n0+BG1AUQK0Os6eMck/ggAAP/4CABDTuEA==
Date:   Mon, 18 Nov 2019 10:05:02 +0000
Message-ID: <5fe9024bc69c4a4eb115b3c2f3f9bcd1@AcuMS.aculab.com>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
 <20191115064750.47888-8-shile.zhang@linux.alibaba.com>
 <893d3caf85cd4ed0921fab84cfe28cad@AcuMS.aculab.com>
 <20191115174649.ldif5o7xqo5ntxeo@treble>
In-Reply-To: <20191115174649.ldif5o7xqo5ntxeo@treble>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: 75K_-0LxPeummalnrpAD_w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

RnJvbTogSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+DQo+IFNlbnQ6IDE1IE5v
dmVtYmVyIDIwMTkgMTc6NDcNCj4gT24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDQ6NTE6MjRQTSAr
MDAwMCwgRGF2aWQgTGFpZ2h0IHdyb3RlOg0KPiA+IEZyb206IFNoaWxlIFpoYW5nDQo+ID4gPiBT
ZW50OiAxNSBOb3ZlbWJlciAyMDE5IDA2OjQ4DQo+ID4gLi4uDQo+ID4gPiAgYXJjaC94ODYva2Vy
bmVsL3Vud2luZF9vcmMuYyB8IDggKysrKystLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rZXJuZWwvdW53aW5kX29yYy5jIGIvYXJjaC94ODYva2VybmVsL3Vud2luZF9vcmMu
Yw0KPiA+ID4gaW5kZXggMzMyYWU2NTMwZmE4Li4yODBkYTZmYTk5MjIgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9hcmNoL3g4Ni9rZXJuZWwvdW53aW5kX29yYy5jDQo+ID4gPiArKysgYi9hcmNoL3g4Ni9r
ZXJuZWwvdW53aW5kX29yYy5jDQo+ID4gPiBAQCAtMjczLDkgKzI3MywxMSBAQCB2b2lkIF9faW5p
dCB1bndpbmRfaW5pdCh2b2lkKQ0KPiA+ID4gIAkJcmV0dXJuOw0KPiA+ID4gIAl9DQo+ID4gPg0K
PiA+ID4gLQkvKiBTb3J0IHRoZSAub3JjX3Vud2luZCBhbmQgLm9yY191bndpbmRfaXAgdGFibGVz
OiAqLw0KPiA+ID4gLQlzb3J0KF9fc3RhcnRfb3JjX3Vud2luZF9pcCwgbnVtX2VudHJpZXMsIHNp
emVvZihpbnQpLCBvcmNfc29ydF9jbXAsDQo+ID4gPiAtCSAgICAgb3JjX3NvcnRfc3dhcCk7DQo+
ID4gPiArCS8qDQo+ID4gPiArCSAqIE5vdGUsIG9yY191bndpbmQgYW5kIG9yY191bndpbmRfaXAg
dGFibGVzIGhhcyBiZWVuIHNvcnRlZCBpbg0KPiA+ID4gKwkgKiB2bWxpbnV4IGxpbmsgcGhhc2Ug
Ynkgc29ydHRhYmxlIHRvb2wgYXQgYnVpbGQgdGltZS4NCj4gPiA+ICsJICogSXRzIHJlYWR5IGZv
ciBiaW5hcnkgc2VhcmNoIG5vdy4NCj4gPiA+ICsJICovDQo+ID4NCj4gPiBIb3cgZmFzdCBpcyBz
b3J0KCkgaWYgdGhlIHRhYmxlIGlzIHNvcnRlZD8NCj4gPiBSZWx5aW5nIG9uIHRoZSBrZXJuZWwg
c291cmNlcyBhbmQgYnVpbGQgc2NyaXB0cyBhbHdheXMgYmVpbmcgaW4gc3luYyBzZWVtcyBkYW5n
ZXJvdXMuDQo+ID4gUHJvYmFibHkgYmV0dGVyIHRvIGxlYXZlIHRoZSBzb3J0IGluIGZvciBhIHJl
bGVhc2Ugb2YgdHdvLg0KPiANCj4gVGhpcyBwYXRjaCBjb21lcyBhZnRlciB0aGUgYnVpbGQgc2Ny
aXB0IGNoYW5nZXMsIHNvIHRoZXknZCBiZSBpbiBzeW5jLg0KPiBXaGF0IHdvdWxkIHRoZSBjb25j
ZXJuIGJlPw0KDQpNb3N0bHkgdGhhdCBpZiwgZm9yIGFueSByZWFzb24sIHRoZSBidWlsZCBzY3Jp
cHQgY2hhbmdlcyBhcmUgbWlzc2luZyBub3RoaW5nDQp3aWxsIGRldGVjdCB0aGUgZXJyb3IgLSBi
dXQgdGhlIHJlc3VsdHMgd2lsbCBiZSB2ZXJ5IGNvbmZ1c2luZy4NCklmIHRoZSBzb3J0IGlzIGZh
c3QgZm9yIHNvcnRlZCBpbnB1dHMgKHNvbWUgYWxnb3JpdGhtcyBhcmVuJ3QpIHRoZW4gbGVhdmlu
Zw0KaXQgaW4gd29uJ3QgdGFrZSB0aGF0IGxvbmcuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVk
IEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5l
cywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

