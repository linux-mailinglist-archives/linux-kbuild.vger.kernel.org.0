Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A66249837
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 10:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgHSI1A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 04:27:00 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:54910 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726414AbgHSI05 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 04:26:57 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-239-zGAGPmDnP7qGOI4O4PkF1A-1; Wed, 19 Aug 2020 09:26:52 +0100
X-MC-Unique: zGAGPmDnP7qGOI4O4PkF1A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 19 Aug 2020 09:26:51 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 19 Aug 2020 09:26:51 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Arvind Sankar' <nivedita@alum.mit.edu>,
        Nick Desaulniers <ndesaulniers@google.com>
CC:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "Ard Biesheuvel" <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        "Vamshi K Sthambamkadi" <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        "Eli Friedman" <efriedma@quicinc.com>
Subject: RE: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Thread-Topic: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Thread-Index: AQHWda6CCHxBBIXDc0qCyrHmyOJpJ6k/GFlg
Date:   Wed, 19 Aug 2020 08:26:51 +0000
Message-ID: <d865ceb8ef534c21b82f205635426101@AcuMS.aculab.com>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <20200818222542.GA3254379@rani.riverdale.lan>
In-Reply-To: <20200818222542.GA3254379@rani.riverdale.lan>
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

RnJvbTogQXJ2aW5kIFNhbmthcg0KPiBTZW50OiAxOCBBdWd1c3QgMjAyMCAyMzoyNg0KLi4uDQo+
IGdjYy0xMCBvcHRpbWl6ZXMgdGhlIGdlbmVyaWMgbWVtc2V0IGltcGxlbWVudGF0aW9uIGluIHRo
ZXJlIGludG8gYSBjYWxsDQo+IHRvIG1lbXNldC4gTm93IHRoYXQncyBvbiB4ODYgd2hpY2ggZG9l
c24ndCB1c2UgdGhlIGdlbmVyaWMNCj4gaW1wbGVtZW50YXRpb24sIGJ1dCB0aGlzIGlzIGp1c3Qg
d2FpdGluZyB0byBiaXRlIHVzLg0KPiANCj4gaHR0cHM6Ly9nb2Rib2x0Lm9yZy96LzZFaEcxNQ0K
DQpHYWgsIGlmIEkgd2FudCBhIGNhbGwgdG8gbWVtc2V0KCkgSSdsbCB3cml0ZSBhIGNhbGwgdG8g
bWVtc2V0KCkuDQpJZiBJJ20gdHJ5aW5nIHRvIHplcm8gYSBzbWFsbCBudW1iZXIgb2YgYnl0ZXMg
SSdsbCB3cml0ZSBhIGxvb3ANCmJlY2F1c2UgaXQnbGwgYmUgZmFzdGVyLg0KDQpJIHdpc2ggY29t
cGlsZXJzIHdvdWxkbid0IGV2ZW4gY29uc2lkZXIgdGhlc2Ugc29ydHMgb2YgJ29wdGltaXNhdGlv
bnMnLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K

