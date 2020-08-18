Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDA6249062
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 23:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHRVyE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 17:54:04 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:21275 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726783AbgHRVyD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 17:54:03 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-78-s7zujxQ1POq9Y79k-1joAA-1; Tue, 18 Aug 2020 22:53:59 +0100
X-MC-Unique: s7zujxQ1POq9Y79k-1joAA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 18 Aug 2020 22:53:58 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 18 Aug 2020 22:53:58 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nick Desaulniers' <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
CC:     Linus Torvalds <torvalds@linux-foundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "Kees Cook" <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        "Vamshi K Sthambamkadi" <vamshi.k.sthambamkadi@gmail.com>
Subject: RE: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Thread-Topic: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Thread-Index: AQHWdaJrCHxBBIXDc0qCyrHmyOJpJ6k+ZqBw
Date:   Tue, 18 Aug 2020 21:53:58 +0000
Message-ID: <4f00a6bafca04f4ab2e070427cf9c2cc@AcuMS.aculab.com>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
In-Reply-To: <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

RnJvbTogTmljayBEZXNhdWxuaWVycw0KPiBTZW50OiAxOCBBdWd1c3QgMjAyMCAyMTo1OQ0KPiAN
Cj4gT24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgMToyNyBQTSBOaWNrIERlc2F1bG5pZXJzDQo+IDxu
ZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4gd3JvdGU6DQouLi4NCj4gPiA+IC1mZnJlZXN0YW5kaW5n
IGFzIGl0IHN0YW5kcyB0b2RheSBkb2VzIGhhdmUgX19idWlsdGluX21lbWNweSBhbmQNCj4gPiA+
IGZyaWVuZHMuIEJ1dCB5b3UgbmVlZCB0byB0aGVuIHVzZSAjZGVmaW5lIG1lbWNweSBfX2J1aWx0
aW5fbWVtY3B5IGV0YywNCj4gPiA+IHdoaWNoIGlzIG1lc3N5IGFuZCBhbHNvIGRvZXNuJ3QgZnVs
bHkgZXhwcmVzcyB3aGF0IHlvdSB3YW50LiAjcHJhZ21hLCBvcg0KPiA+ID4gZXZlbiBqdXN0IGFs
bG93aW5nIC1mYnVpbHRpbi1mb28gb3B0aW9ucyB3b3VsZCBiZSB1c2VmdWwuDQo+IA0KPiBJIGRv
IHJlYWxseSBsaWtlIHRoZSBpZGVhIG9mIC1mYnVpbHRpbi1mb28uICBGb3IgZXhhbXBsZSwgeW91
J2Qgc3BlY2lmeToNCj4gDQo+IC1mZnJlZXN0YW5kaW5nIC1mYnVpbHRpbi1iY21wDQo+IA0KPiBh
cyBhbiBleGFtcGxlLiBgLWZmcmVlc3RhbmRpbmdgIHdvdWxkIG9wdCB5b3Ugb3V0IG9mIEFMTCBs
aWJjYWxsDQo+IG9wdGltaXphdGlvbnMsIGAtZmJ1aWx0aW4tYmNtcGAgd291bGQgdGhlbiBvcHQg
eW91IGJhY2sgaW4gdG8NCj4gdHJhbnNmb3JtcyB0aGF0IHByb2R1Y2UgYmNtcC4gIFRoYXQgd2F5
IHlvdSdyZSBpbmZvcm1pbmcgdGhlIGNvbXBpbGVyDQo+IG1vcmUgcHJlY2lzZWx5IGFib3V0IHRo
ZSBlbnZpcm9ubWVudCB5b3UnZCBiZSB0YXJnZXRpbmcuICBJdCBmZWVscw0KPiBzeW1tZXRyaWMg
dG8gZXhpc3RpbmcgYC1mbm8tYCBmbGFncyAoY2xhbmcgbWFrZXMgLWYgdnMgLWZuby0gcHJldHR5
DQo+IGVhc3kgd2hlbiB0aGVyZSBpcyBzdWNoIHN5bW1ldHJ5KS4gIEFuZCBpdCdzIGFscmVhZHkg
Y29udmVudGlvbiB0aGF0DQo+IGlmIHlvdSBzcGVjaWZ5IG11bHRpcGxlIGNvbmZsaWN0aW5nIGNv
bXBpbGVyIGZsYWdzLCB0aGVuIHRoZSBsYXR0ZXINCj4gb25lIHNwZWNpZmllZCAid2lucy4iICBJ
biB0aGF0IHNlbnNlLCB0dXJuaW5nIGJhY2sgb24gc3BlY2lmaWMNCj4gbGliY2FsbHMgYWZ0ZXIg
ZGlzYWJsaW5nIHRoZSByZXN0IGxvb2tzIG1vcmUgZXJnb25vbWljIHRvIG1lLg0KPiANCj4gTWF5
YmUgRWxpIG9yIERhdmlkIGhhdmUgdGhvdWdodHMgb24gd2h5IHRoYXQgbWF5IG9yIG1heSBub3Qg
YmUgYXMNCj4gZXJnb25vbWljIG9yIHBvc3NpYmxlIHRvIGltcGxlbWVudCBhcyBJIGltYWdpbmU/
DQoNCllvdSBtaWdodCB3YW50IC1mYnVpbHRpbi1iY21wPW15X2JjbXBfZnVuY3Rpb24gc28gdGhh
dCB5b3UgY2FuIHNwZWNpZnkNCnRoZSBhY3R1YWwgZWxmIHN5bWJvbCBuYW1lIHRvIGJlIHVzZWQu
DQoNCkkgd2FzIHJlY2VudGx5IHRyeWluZyB0byBjb21waWxlIGFuIGFwcGxpY2F0aW9uIHNvIHRo
YXQgaXQgd291bGQNCnJ1biBvbiBhIHN5c3RlbSB3aXRoIGFuIG9sZCBsaWJjLg0KQXZvaWRpbmcg
ZXhwbGljaXQgY2FsbHMgdG8gbmV3IGZ1bmN0aW9ucyB3YXNuJ3QgYSBwcm9ibGVtLCBidXQgSQ0K
Y291bGRuJ3QgZG8gYW55dGhpbmcgYWJvdXQgdGhlIG1lbWNweSgpIGNhbGxzIGdlbmVyYXRlZCBi
eSBnY2MNCmZvciBzdHJ1Y3R1cmUgY29waWVzLg0KRHVlIHRvIHRoZSBzaWxseSBnbGliYyBmaWFz
Y28gd2l0aCBtZW1jcHkgZ29pbmcgYmFja3dhcmRzIEknZA0KZWl0aGVyIG5lZWQgdG8gZm9yY2Ug
b3V0IGEgcmVmZXJlbmNlIHRvIHRoZSBvbGQgdmVyc2lvbiBvZiBtZW1jcHkNCm9yIGEgcmVmZXJl
bmNlIHRvIG1lbW92ZSAtIGJ1dCBuZWl0aGVyIGlzIHBvc3NpYmxlLg0KDQpJIHRoZW4gdHJpZWQg
YSBDKysgcHJvZ3JhbSBhbmQgZ2F2ZSB1cCBiZWNhdXNlICdjaGFyIHRyYWl0cycNCndhcyBhbGwg
ZGlmZmVyZW50LiBJIHRoZW4gcmVhbGlzZWQgSSBuZWVkIHRvIHJlbW92ZSBhbGwgcmVmZXJlbmNl
cw0KdG8gc3RkOjpzdHJpbmcgdG8gZ2V0IGFueSBraW5kIG9mIGVmZmljaWVudCBvYmplY3QgY29k
ZSA6LSkNCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxl
eSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0
aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

