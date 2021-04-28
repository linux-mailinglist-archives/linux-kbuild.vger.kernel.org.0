Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F6E36E0E0
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Apr 2021 23:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbhD1VWK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Apr 2021 17:22:10 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:53238 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229805AbhD1VWI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Apr 2021 17:22:08 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-25-QA2xojGMO0i6L1EhNbPR8w-1; Wed, 28 Apr 2021 22:21:20 +0100
X-MC-Unique: QA2xojGMO0i6L1EhNbPR8w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 28 Apr 2021 22:21:19 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Wed, 28 Apr 2021 22:21:19 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'mceier+kernel@gmail.com'" <mceier+kernel@gmail.com>,
        "ojeda@kernel.org" <ojeda@kernel.org>
CC:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 00/13] [RFC] Rust support
Thread-Topic: [PATCH 00/13] [RFC] Rust support
Thread-Index: AQHXPF0cOFPh/tHqwUWOAL+H8MAuYKrKb1Ew
Date:   Wed, 28 Apr 2021 21:21:19 +0000
Message-ID: <acce51322e1249f888e7d2815228e7af@AcuMS.aculab.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
In-Reply-To: <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
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

RnJvbTogTWFyaXVzeiBDZWllcg0KPiBTZW50OiAyOCBBcHJpbCAyMDIxIDE5OjM0DQouLi4uDQo+
IA0KPiBJIHN1Z2dlc3QgdG8gd2FpdCB1bnRpbCBmZWF0dXJlZnVsIEdQTCBpbXBsZW1lbnRhdGlv
biBvZiBydXN0IGxhbmd1YWdlDQo+IGlzIG1hZGUgKGFzc3VtaW5nIEdOVSBSdXN0IGlzIG9uIHRo
ZSB3YXkpIGJlZm9yZSBtZXJnaW5nIGFueSBydXN0IGNvZGUNCj4gaW4gdGhlIGtlcm5lbCBhbmQg
d2hlbiB0aGF0IGltcGxlbWVudGF0aW9uIGlzIGRvbmUgbWFrZSBhIHJlcXVpcmVtZW50DQo+IHRo
YXQgYWxsIHJ1c3QgY29kZSBtdXN0IGJlIGJ1aWxkYWJsZSBieSBhdCBsZWFzdCBHUEwgaW1wbGVt
ZW50YXRpb24uDQo+IA0KPiBNYXliZSBpdCB3b3VsZCBhbHNvIGJlIHdvcnRod2hpbGUgdG8gbWFr
ZSB0aGUgcmVxdWlyZW1lbnQgdGhhdCB0aGUNCj4ga2VybmVsIG11c3QgYmUgYnVpbGRhYmxlIHdp
dGggZnJlZSBzb2Z0d2FyZSAobm90IGp1c3Qgb3BlbiBzb3VyY2UNCj4gc29mdHdhcmUpIGV4cGxp
Y2l0ID8NCg0KT3IgcHV0IHRoZSB2ZXJzaW9uIG9mIHRoZSBjb21waWxlciB0aGF0IHdvcmtzIGlu
IHRoZSBzb3VyY2UgdHJlZQ0Kd2l0aCB0aGUga2VybmVsIGFuZCB0aGVuIGJ1aWxkIGl0IGFzIHBh
cnQgb2YgdGhlIGZ1bGwgYnVpbGQuDQoNCkl0IGlzIGVub3VnaCBvZiBhIFBJVEEgaGF2aW5nIHRv
IGZpbmQgbGliZWxmLWRldmVsIGluIG9yZGVyIHRvDQpidWlsZCBvYmp0b29sLCBuZXZlciBtaW5k
IGhhdmluZyB0byBmaW5kIHRoZSBjb3JyZWN0IHZlcnNpb24NCm9mIHNvbWV0aGluZyBlbHNlLg0K
DQpnY2MgdGVuZHMgdG8gYmUgYXZhaWxhYmxlIGFuZCB0aGUgdmVyc2lvbiBkb2Vzbid0IG1hdHRl
ciB0b28gbXVjaC4NCkJ1dCBldmVyIHRoYXQgZ2l2ZXMgcHJvYmxlbXMuDQoNCglEYXZpZA0KDQot
DQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwg
TWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2Fs
ZXMpDQo=

