Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E86DC43F94C
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 10:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhJ2I7E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 04:59:04 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:28117 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229986AbhJ2I7E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 04:59:04 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-10-CZTnxGVeNEOTatoMgxGNcw-1; Fri, 29 Oct 2021 09:56:33 +0100
X-MC-Unique: CZTnxGVeNEOTatoMgxGNcw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Fri, 29 Oct 2021 09:56:32 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Fri, 29 Oct 2021 09:56:32 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Nick Desaulniers' <ndesaulniers@google.com>,
        Peter Zijlstra <peterz@infradead.org>
CC:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [PATCH] kbuild: Support clang-$ver builds
Thread-Topic: [PATCH] kbuild: Support clang-$ver builds
Thread-Index: AQHXzFN5HqGTEoayakmj+rTeL/YbtKvprCbw
Date:   Fri, 29 Oct 2021 08:56:32 +0000
Message-ID: <65a89f36d36443af9b13c1b121731ef1@AcuMS.aculab.com>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
 <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
 <YXrhZoOgv5dtFMTs@archlinux-ax161>
 <20211028204855.GP174703@worktop.programming.kicks-ass.net>
 <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
In-Reply-To: <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
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

RnJvbTogTmljayBEZXNhdWxuaWVycw0KPiBTZW50OiAyOSBPY3RvYmVyIDIwMjEgMDA6MjgNCi4u
Lg0KPiA+ID4gMi4gVXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uIHRvIGRlc2NyaWJlIHVzaW5nIHRo
ZQ0KPiA+ID4NCj4gPiA+ICAgICQgUEFUSD0vdXNyL2xpYi9sbHZtLSMvYmluOiRQQVRIIG1ha2Ug
TExWTT0xIC4uLg0KPiA+ID4NCj4gPiA+ICAgIHRyaWNrLiBUaGlzIGhhcyBiZWVuIHRoZSBwcmVm
ZXJyZWQgbWV0aG9kIGZvciB1c2luZyBkaWZmZXJlbnQNCj4gPiA+ICAgIHZlcnNpb25zIG9mIExM
Vk0gYnV0IGl0IGhhcyBuZXZlciBiZWVuIGRvY3VtZW50ZWQgYW55d2hlcmUuIFRoaXMNCj4gPiA+
ICAgIHdvdWxkIGFsbG93IHVzIHRvIGtlZXAgdGhlIGN1cnJlbnQgYnVpbGQgaW5mcmFzdHJ1Y3R1
cmUgd2hpbGUgZ2l2aW5nDQo+ID4gPiAgICBwZW9wbGUgY2xlYXIgaW5zdHJ1Y3Rpb25zIGZvciBo
b3cgdG8gaGFuZGxlIGRpZmZlcmVudCB2ZXJzaW9ucyBvZg0KPiA+ID4gICAgY2xhbmcuIEFzIFBl
dGVyIGhhcyBub3RlZCwgdGhpcyB3b3VsZCByZXF1aXJlIHBlb3BsZSB3aG8gYXJlIG5vdA0KPiA+
ID4gICAgZmFtaWxpYXIgd2l0aCBidWlsZGluZyB3aXRoIExMVk0gdG8gYmUgY29uc3RhbnRseSBs
b29raW5nIGF0IHRoZQ0KPiA+ID4gICAgZG9jdW1lbnRhdGlvbiB0byByZW1lbWJlciB0aGUgY29t
bWFuZCB0byBpbnZva2UsIHdoZXJlYXMgd2l0aA0KPiA+ID4gICAgTExWTT0tIywgaXQgaXMgZWFz
eSB0byByZW1lbWJlci4NCj4gPg0KPiA+IFJpZ2h0LCB0aGlzIGlzIG5vIG1vcmUgdGhhbiBhIGNy
dWRlIGhhY2sgYW5kIGlzIHN1cGVyIHVuZnJpZW5kbHkuIEl0DQo+ID4gc2hvdWxkIG5ldmVyIGhh
dmUgYmVlbiBhY2NlcHRlZC4NCj4gDQo+IExvdHMgb2YgdG9vbHMgbW9kaWZ5IFBBVEggaW4geW91
ciBgLmJhc2hyY2Agb3IgYC56c2hyY2AgZXRjLiAgSSBkb24ndA0KPiBzZWUgaG93IHRoYXQncyBh
bnkgZGlmZmVyZW50LCBvdGhlciB0aGFuIG9uZSBvZmYgY29tbWFuZHMgaW4gd2hpY2ggeW91DQo+
IGFjdHVhbGx5IGludGVuZCB0byB1c2UgYSBzcGVjaWZpYyB2ZXJzaW9uLg0KDQpOb3RoaW5nIHNo
b3VsZCBiZSBtb2RpZnlpbmcgdGhlIGRlZmF1bHQgJFBBVEgsIGVpdGhlciBieSBoYWNraW5nDQpt
eSAuYmFzaHJjIG9yIGFueSBzeXN0ZW0gZGVmYXVsdCBmaWxlcyB0aGF0IGdldCBydW4gZmlyc3Qu
DQoNCkl0IGlzIGFzIGhvcnJpZCBhbmQgYnJva2VuIGFzIHNldHRpbmcgTERfTElCUkFSWV9QQVRI
Lg0KRXZlbiBsZGNvbmZpZyBpcyBwcmV0dHkgbXVjaCBhIGJyb2tlbiBpZGVhLg0KDQoJRGF2aWQN
Cg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZh
cm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYg
KFdhbGVzKQ0K

