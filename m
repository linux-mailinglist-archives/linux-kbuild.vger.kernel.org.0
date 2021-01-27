Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C883306707
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 23:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236697AbhA0WLH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 17:11:07 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:40531 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236696AbhA0WLD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jan 2021 17:11:03 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-144-olLfPvOBNhiMAsAWFz1jNg-1; Wed, 27 Jan 2021 22:09:25 +0000
X-MC-Unique: olLfPvOBNhiMAsAWFz1jNg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 27 Jan 2021 22:09:23 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 27 Jan 2021 22:09:23 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Josh Poimboeuf' <jpoimboe@redhat.com>,
        Christoph Hellwig <hch@infradead.org>
CC:     Kees Cook <keescook@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Justin Forbes" <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Thread-Topic: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Thread-Index: AQHW9N1iS8d19DyYhUmaAJxxd6lVCKo8BhIg
Date:   Wed, 27 Jan 2021 22:09:23 +0000
Message-ID: <453ab26cafc247dbb1a019e6b8c24cf1@AcuMS.aculab.com>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210127180215.GA1745339@infradead.org>
 <20210127183856.moe3p5pxw6bbtunk@treble>
 <20210127184327.GA1755516@infradead.org>
 <20210127185113.c3est2vssf5tlyyq@treble>
In-Reply-To: <20210127185113.c3est2vssf5tlyyq@treble>
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

RnJvbTogSm9zaCBQb2ltYm9ldWYNCj4gU2VudDogMjcgSmFudWFyeSAyMDIxIDE4OjUxDQo+IA0K
PiBPbiBXZWQsIEphbiAyNywgMjAyMSBhdCAwNjo0MzoyN1BNICswMDAwLCBDaHJpc3RvcGggSGVs
bHdpZyB3cm90ZToNCj4gPiBPbiBXZWQsIEphbiAyNywgMjAyMSBhdCAxMjozODo1NlBNIC0wNjAw
LCBKb3NoIFBvaW1ib2V1ZiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgSmFuIDI3LCAyMDIxIGF0IDA2
OjAyOjE1UE0gKzAwMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiA+ID4gPiBQbGVhc2Ug
ZG9uJ3QgYWRkIGFsbCB0aGlzIGdhcmJhZ2UuICBXZSBvbmx5IGFkZCBpbmZyYXN0cnVjdHVyZSB0
byB0aGUNCj4gPiA+ID4ga2VybmVsIGZvciB3aGF0IHRoZSBrZXJuZWwgaXRzZWxmIG5lZWRzLCBu
b3QgZm9yIHdlaXJkIG91dCBvZiB0cmVlDQo+ID4gPiA+IGluZnJhc3RydWN0dXJlLg0KPiA+ID4N
Cj4gPiA+IFRoaXMgaXNuJ3QgbmV3LCB0aGUga2VybmVsIGFscmVhZHkgaGFzIHRoZSBpbmZyYXN0
cnVjdHVyZSBmb3IgYnVpbGRpbmcNCj4gPiA+IG91dC1vZi10cmVlIG1vZHVsZXMuICBJdCdzIHdp
ZGVseSB1c2VkLiAgQXJlIHlvdSBzdWdnZXN0aW5nIHdlIHJlbW92ZQ0KPiA+ID4gaXQ/ICBHb29k
IGx1Y2sgd2l0aCB0aGF0Li4uDQo+ID4gPg0KPiA+ID4gRWl0aGVyIGl0IHNob3VsZCBiZSBzdXBw
b3J0ZWQsIG9yIG5vdC4gIE1ha2UgdGhlIGNhc2UgZWl0aGVyIHdheS4gIEJ1dCBJDQo+ID4gPiBj
YW4ndCB1bmRlcnN0YW5kIHdoeSBwZW9wbGUgYXJlIGFkdm9jYXRpbmcgdG8gbGVhdmUgaXQgaGFs
Zi1icm9rZW4uDQo+ID4NCj4gPg0KPiA+IEl0IGlzIG5vdCBzdXBwb3J0IGFzIGFueSBraW5kIG9m
IGludGVyZmFjZS4gIEl0IGlzIGEgbGl0dGxlIGFpZCBmb3INCj4gPiBsb2NhbCBkZXZlbG9wbWVu
dC4NCj4gDQo+IElzIHRoaXMgYSBqb2tlPyAgSSd2ZSBuZXZlciBtZXQgYW55Ym9keSB3aG8gYnVp
bGRzIE9PVCBtb2R1bGVzIGFzIGENCj4gZGV2ZWxvcG1lbnQgYWlkLi4uDQo+IA0KPiBPbiB0aGUg
b3RoZXIgaGFuZCBJIGtub3cgb2Ygc2V2ZXJhbCB2ZXJ5IHBvcHVsYXIgZGlzdHJvcyAoc29tZSBw
YWlkLA0KPiBzb21lIG5vdCkgd2hvIHJlbHkgb24gYWxsb3dpbmcgdXNlcnMvcGFydG5lcnMgdG8g
YnVpbGQgT09UIG1vZHVsZXMgYXMNCj4gcGFydCBvZiB0aGVpciBlY29zeXN0ZW0uICBUbyBzYXkg
aXQncyBub3Qgc3VwcG9ydGVkIGlzIGEgZmFyY2UuDQoNCkluZGVlZCB0aGVyZSBhcmUgcGxlbnR5
IG9mIGNvbXBhbmllcyB3aG8gcHJvdmlkZSBrZXJuZWwgbW9kdWxlcw0KKHdob2xseSBvciBwYXJ0
bHkgaW4gc291cmNlIGZvcm0pIGZvciB0aGVpciBjdXN0b21lcnMgdG8gYnVpbGQgYXMgT09UDQpt
b2R1bGVzIHRvIGluc3RhbGwgaW4gZGlzdHJvIGJ1aWx0IGtlcm5lbHMuDQoNClRoZXNlIG1vZHVs
ZXMgaGF2ZSB0byBjb21waWxlIGFnYWluc3QgZXZlcnl0aGluZyBmcm9tIFJIRUw2ICgyLjYuMzIg
YmFzZSkNCnRocm91Z2ggdG8gdGhlIGN1cnJlbnQgLXJjIHJlbGVhc2UuDQoNCglEYXZpZA0KDQot
DQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwg
TWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2Fs
ZXMpDQo=

