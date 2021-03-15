Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA2533B076
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Mar 2021 11:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhCOK6Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Mar 2021 06:58:25 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:44428 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229624AbhCOK5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Mar 2021 06:57:53 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-225-HPXRzdpYMDacC0wfCCXGQg-1; Mon, 15 Mar 2021 10:57:50 +0000
X-MC-Unique: HPXRzdpYMDacC0wfCCXGQg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 15 Mar 2021 10:57:49 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Mon, 15 Mar 2021 10:57:49 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nick Desaulniers' <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     Sami Tolvanen <samitolvanen@google.com>,
        Candle Sun <candlesea@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: RE: [PATCH] Makefile: LTO: have linker check -Wframe-larger-than
Thread-Topic: [PATCH] Makefile: LTO: have linker check -Wframe-larger-than
Thread-Index: AQHXF2kAjNB5JXKr7kq0KcwGISzjWaqE5Fyg
Date:   Mon, 15 Mar 2021 10:57:49 +0000
Message-ID: <45f3e718a0c046f9a11f49eb199d425c@AcuMS.aculab.com>
References: <20210312010942.1546679-1-ndesaulniers@google.com>
 <CAKwvOdnPhpKRs6SePCUCPs_2MUFbWgJiaf9F9J+aQZGESSQ9yA@mail.gmail.com>
In-Reply-To: <CAKwvOdnPhpKRs6SePCUCPs_2MUFbWgJiaf9F9J+aQZGESSQ9yA@mail.gmail.com>
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

RnJvbTogTmljayBEZXNhdWxuaWVycw0KPiBTZW50OiAxMiBNYXJjaCAyMDIxIDE3OjU1DQo+IA0K
PiBPbiBUaHUsIE1hciAxMSwgMjAyMSBhdCA1OjA5IFBNIE5pY2sgRGVzYXVsbmllcnMNCj4gPG5k
ZXNhdWxuaWVyc0Bnb29nbGUuY29tPiB3cm90ZToNCj4gPg0KPiA+IC1XZnJhbWUtbGFyZ2VyLXRo
YW49IHJlcXVpcmVzIHN0YWNrIGZyYW1lIGluZm9ybWF0aW9uLCB3aGljaCB0aGUNCj4gPiBmcm9u
dGVuZCBjYW5ub3QgcHJvdmlkZS4gVGhpcyBkaWFnbm9zdGljIGlzIGVtaXR0ZWQgbGF0ZSBkdXJp
bmcNCj4gPiBjb21waWxhdGlvbiBvbmNlIHN0YWNrIGZyYW1lIHNpemUgaXMgYXZhaWxhYmxlLg0K
PiA+DQo+ID4gV2hlbiBidWlsZGluZyB3aXRoIExUTywgdGhlIGZyb250ZW5kIHNpbXBseSBsb3dl
cnMgQyB0byBMTFZNIElSIGFuZCBkb2VzDQo+ID4gbm90IGhhdmUgc3RhY2sgZnJhbWUgaW5mb3Jt
YXRpb24sIHNvIGl0IGNhbm5vdCBlbWl0IHRoaXMgZGlhZ25vc3RpYy4NCj4gPiBXaGVuIHRoZSBs
aW5rZXIgZHJpdmVzIExUTywgaXQgcmVzdGFydHMgb3B0aW1pemF0aW9ucyBhbmQgbG93ZXJzIExM
Vk0gSVINCj4gPiB0byBvYmplY3QgY29kZS4gQXQgdGhhdCBwb2ludCwgaXQgaGFzIHN0YWNrIGZy
YW1lIGluZm9ybWF0aW9uIGJ1dA0KPiA+IGRvZXNuJ3Qga25vdyB0byBjaGVjayBmb3IgYSBzcGVj
aWZpYyBtYXggc3RhY2sgZnJhbWUgc2l6ZS4NCg0KV2l0aCBMVE8gdGhlIGxpbmtlciBvdWdodCB0
byBiZSBhYmxlIHRvIGRvIGEgc3RhY2sgZnJhbWUgY2hlY2sNCmFjcm9zcyBtdWx0aXBsZXMgZnVu
Y3Rpb25zIGluIHRoZSBjYWxsIHN0YWNrLg0KDQpDbGVhcmx5IHJlY3Vyc2l2ZSBjYWxscyBjYXVz
ZSBpc3N1ZXMuDQpJbmRpcmVjdCBvbmVzIGFzIHdlbGwgLSBidXQgZG9lcyBDRkkgaW5jbHVkZSBl
bm91Z2ggaW5mbw0KYWJvdXQgd2hhdCBjYW4gYmUgY2FsbGVkIGZyb20gd2hlcmUgdG8gaGVscD8N
Cg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2Fk
LCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5v
OiAxMzk3Mzg2IChXYWxlcykNCg==

