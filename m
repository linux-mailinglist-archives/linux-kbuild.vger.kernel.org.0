Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F4724E75A
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Aug 2020 14:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgHVMUZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Aug 2020 08:20:25 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:38456 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726704AbgHVMUY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Aug 2020 08:20:24 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-270-qZwqjJrpPHqWcJjZWqiVug-1; Sat, 22 Aug 2020 13:20:19 +0100
X-MC-Unique: qZwqjJrpPHqWcJjZWqiVug-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sat, 22 Aug 2020 13:20:18 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Sat, 22 Aug 2020 13:20:18 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nick Desaulniers' <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        "Eli Friedman" <efriedma@quicinc.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
Thread-Index: AQHWeBjoCHxBBIXDc0qCyrHmyOJpJ6lD/ZLw
Date:   Sat, 22 Aug 2020 12:20:17 +0000
Message-ID: <ad72b37c132e41f6a74766c27a27d7f6@AcuMS.aculab.com>
References: <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <20200818214146.GA3196105@rani.riverdale.lan>
 <df6c1da4-b910-ecb8-0de2-6156dd651be6@rasmusvillemoes.dk>
 <20200820175617.GA604994@rani.riverdale.lan>
 <CAHk-=whn91ar+EbcBXQb9UXad00Q5WjU-TCB6UBzVba682a4ew@mail.gmail.com>
 <20200821172935.GA1411923@rani.riverdale.lan>
 <CAHk-=wi8vdb+wo-DACDpSijYfAbCs135YcnnAbRhGJcU+A=-+Q@mail.gmail.com>
 <20200821195712.GB1475504@rani.riverdale.lan>
 <CAHk-=wgXHhN5MSOLeE_7rMPoGknrSxmOOJVLBa4jkz38J4gHgg@mail.gmail.com>
 <CAKwvOdnHZfVz8grK-SD6jTT1ggQNQ-RRduRdAG0nShqeitpgpg@mail.gmail.com>
In-Reply-To: <CAKwvOdnHZfVz8grK-SD6jTT1ggQNQ-RRduRdAG0nShqeitpgpg@mail.gmail.com>
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

PiBGb3IgbW9yZSBjb250ZXh0IGZvciBmb2xrcyBhdCBob21lIGVhdGluZyBwb3Bjb3JuIGFuZCBl
bmpveWluZyB0aGUNCj4gc2hvdzogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9s
aW51eC9pc3N1ZXMvODc2I2lzc3VlY29tbWVudC02MTMwNDk0ODAuDQo+IEFuZCB0aGF0IHdhcyBz
cGVjaWZpY2FsbHkgd2l0aCBLQVNBTiBlbmFibGVkIGFuZCBkb2Vzbid0IGFwcGVhciB0byBiZQ0K
PiBjb21tb24gYmVoYXZpb3IgaW4gY2xhbmcgb3RoZXJ3aXNlIChoaWdoZXIgdGhyZXNob2xkKS4g
V2h5IHRoZQ0KPiBoZXVyaXN0aWNzIGNoYW5nZSBmb3Igd2hlbiBpdCBzZWVtcyB0byBiZSBtb3Jl
IHByb2ZpdGFibGUgdG8gcm9sbA0KPiBhc3NpZ25tZW50IG9mIGNvbnRpZ3VvdXMgbWVtYmVycyBv
ZiB0aGUgc2FtZSBzdHJ1Y3QgdG8gdGhlIHNhbWUgdmFsdWUNCj4gaW50byBhIG1lbXNldCwgYW5k
IDIgbG9uZ3Mgc2VlbXMgdG8gYmUgdGhlIHRocmVzaG9sZCBmb3IgS0FTQU4sIEkNCj4gZG9uJ3Qg
a25vdy4gIEJ1dCBJIGFncmVlIHRoYXQgc2hvdWxkIGJlIGZpeGVkIG9uIHRoZSBjb21waWxlciBz
aWRlLA0KPiB3aGljaCBpcyB3aHkgSSBoYXZlbid0IGJlZW4gcHVzaGluZyB0aGUga2VybmVsIHdv
cmthcm91bmQuDQoNCkdpdmVuIHg4NiBoYXMgaXMgYSBzaW1wbGUgMy1pbnN0cnVjdGlvbiBsb29w
IGZvciBtZW1zZXQNCnRoYXQgd2lsbCBkbyAxIHdyaXRlL2Nsb2NrICh0aGUgbWF4IG9uIGN1cnJl
bnQgY3B1KSBJDQpkb3VidCBpdCBpcyBldmVyIHdvcnRoIG5vdCBpbmxpbmluZyBtZW1zZXQoKS4N
ClRoZSBvbmx5IHJlYWwgc3BlY2lhbCBjYXNlIGlzIGxlbmd0aHMgPCA4Lg0KDQpGb3IgS0FTQU4g
SSB3b25kZXIgaWYgc29tZXRoaW5nIGlzIHN0b3BwaW5nIGl0IGlubGluaW5nIG1lbXNldCgpPw0K
U28gd2hhdCB1c3VhbGx5IGhhcHBlbnMgaXMgdGhlIHR3byBzdG9yZXMgZ2V0IGNvbnZlcnRlZCB0
byBtZW1zZXQoKQ0KYW5kIHRoZW4gdGhlIG1lbXNldCgpIGdldHMgaW5saW5lZCBiYWNrIHRvIHR3
byBzdG9yZXM/DQoNCk9UT0ggYWxsIHRoaXMgZmFmZmluZyBmb3IgbWVtc2V0IGFuZCBtZW1jcHkg
aXMgcHJvYmFibHkgYQ0Kd2FzdGUgb2YgdGltZS4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQg
QWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVz
LCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

