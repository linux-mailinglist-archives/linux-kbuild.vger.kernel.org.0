Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88972303CD3
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 13:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392455AbhAZMU5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 07:20:57 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:36138 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392530AbhAZMUu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 07:20:50 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-92-_CQph3GUPdygY-lzfZs3PQ-1; Tue, 26 Jan 2021 12:16:07 +0000
X-MC-Unique: _CQph3GUPdygY-lzfZs3PQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 26 Jan 2021 12:16:08 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 26 Jan 2021 12:16:08 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Masahiro Yamada' <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>
CC:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: RE: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Thread-Topic: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Thread-Index: AQHW889wS8d19DyYhUmaAJxxd6lVCKo50Rhg
Date:   Tue, 26 Jan 2021 12:16:08 +0000
Message-ID: <e3fbf778e64f4402b37c878dec580ba0@AcuMS.aculab.com>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <202101251401.F18409FDD1@keescook>
 <CAK7LNASOf=B_j5o=L=BL+vz_JK_d3QYUuHg8h+3SP6qOyYD86A@mail.gmail.com>
In-Reply-To: <CAK7LNASOf=B_j5o=L=BL+vz_JK_d3QYUuHg8h+3SP6qOyYD86A@mail.gmail.com>
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

PiBXZSBzdGFydGVkIHdpdGggdGhlIGFzc3VtcHRpb24gdGhhdCBtb2R1bGVzIG11c3QgYmUgY29t
cGlsZWQNCj4gYnkgdGhlIHNhbWUgY29tcGlsZXIgYXMgdGhlIGtlcm5lbCB3YXMuDQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC84MzYyNDcvIzEwMzE1NDcNCj4gDQo+
IE5vdyB0aGF0IHRoZSBjb21waWxlciBjYXBhYmlsaXR5IGlzIGV2YWx1YXRlZCBpbiBLY29uZmln
LA0KPiB0aGlzIGlzIGEgaGFyZGVyIHJlcXVpcmVtZW50Lg0KPiANCj4gSW4gcmVhbGl0eSwgYSBk
aWZmZXJlbnQgY29tcGlsZXIgbWlnaHQgYmUgdXNlZCwNCj4gYW5kLCB0aGlzIHJlcXVpcmVtZW50
IG1pZ2h0IGJlIGxvb3NlbmVkLCBidXQNCj4gdGhlIHNhbWUgY29tcGlsZXIgc2hvdWxkIGJlIHJl
cXVpcmVkIGZvciBDT05GSUdfR0NDX1BMVUdJTlMuDQoNCkhtbW1tLg0KDQpJZiBJJ20gYnVpbGRp
bmcgYSBtb2R1bGUgdG8gbG9hZCBpbnRvIGEgZGlzdHJvIGtlcm5lbA0KaXQgaXMgdmVyeSB1bmxp
a2VseSB0aGF0IEknbGwgYWN0dWFsbHkgaGF2ZSB0aGUgc2FtZSB2ZXJzaW9uDQpvZiB0aGUgY29t
cGlsZXIgaW5zdGFsbGVkIGFzIHRoYXQgdXNlZCB0byBidWlsZCB0aGUga2VybmVsLg0KDQpBZGRp
dGlvbmFsbHkgc29tZSBvZiB0aGUgLm8gZmlsZXMgKHRoYXQgZG9uJ3QgcmVmZXIgdG8gYW55DQpr
ZXJuZWwgaGVhZGVycykgbWF5IGhhdmUgYmVlbiBjb21waWxlZCB3aXRoIGFuIGVudGlyZWx5DQpk
aWZmZXJlbnQgY29tcGlsZXIgYWx0b2dldGhlci4NCg0KV2hldGhlciBhbnkgcGx1Z2lucyBhcmUg
YWN0dWFsbHkgaW5zdGFsbGVkIGlzIGFub3RoZXIgcHJvYmxlbS4NCg0KCURhdmlkDQoNCi0NClJl
Z2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0
b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykN
Cg==

