Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C352FAD99
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 23:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390611AbhARW4U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 17:56:20 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:35058 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390593AbhARW4T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 17:56:19 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-195-EiLjVQKyMlKNguDyTOLLNQ-1; Mon, 18 Jan 2021 22:54:39 +0000
X-MC-Unique: EiLjVQKyMlKNguDyTOLLNQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 18 Jan 2021 22:54:38 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 18 Jan 2021 22:54:38 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Masahiro Yamada' <masahiroy@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     Sasha Levin <sashal@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
Thread-Topic: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
Thread-Index: AQHW7YhKcfmCLj+UKEqQJ9L4NS8n/6ot/Bvw
Date:   Mon, 18 Jan 2021 22:54:38 +0000
Message-ID: <42c0c7a2a3944eeaa868dd35dd5b6e81@AcuMS.aculab.com>
References: <20210118014951.250815-1-sashal@kernel.org>
 <YAVTDETPaJuaRPfc@kroah.com>
 <CAK7LNAStfNj0hvotctFonezQKQSbJfxU1HrwzWmyDc0+68fQ4Q@mail.gmail.com>
In-Reply-To: <CAK7LNAStfNj0hvotctFonezQKQSbJfxU1HrwzWmyDc0+68fQ4Q@mail.gmail.com>
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

RnJvbTogTWFzYWhpcm8gWWFtYWRhDQo+IFNlbnQ6IDE4IEphbnVhcnkgMjAyMSAxMDoyOA0KLi4u
DQo+IEl0IGhlbHBzIGV4dGVybmFsIG1vZHVsZXMgdG8gYmUgY29tcGlsZWQgZm9yIG11bHRpcGxl
IGtlcm5lbCB2ZXJzaW9ucy4NCj4gDQo+ICNpZiBLRVJORUxfVkVSU0lPTl9DT0RFIDwgS0VSTkVM
X1ZFUlNJT04oNSwgNCwgMCkNCj4gICAgIGNvZGUgZm9yIHRoZSBrZXJuZWwgdmVyc2lvbnMgb2xk
ZXIgdGhhbiA1LjQuMA0KPiAjZW5kaWYNCg0KSSd2ZSBqdXN0IGRvbmUgYSBzY2FuIHRocm91Z2gg
c29tZSBkcml2ZXJzLg0KVGhlIG9ubHkgY2hlY2tzIHdpdGggYSBub24temVybyBzdWItcmV2IGFy
ZSBmb3IgMi42Lm5ubi4NClNvIHByb3ZpZGVkIEtFUk5FTF9WRVJTSU9OX0NPREUgaXMgY2hhbmdl
ZCB0byBtYXRjaA0Kbm90aGluZyBvZiBvdXJzIGJyZWFrcy4NCg0KSSd2ZSBvbmx5IGZvdW5kIHRl
c3RzIGZvciB0aGUgZm9sbG93aW5nOg0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9W
RVJTSU9OKDIsIDYsIDI4KQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9O
KDIsIDYsIDMyKQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDIsIDYs
IDM0KQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDIsIDYsIDM2KQ0K
I2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDMsIDEwLCAwKQ0KI2lmIExJ
TlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDMsIDE3LCAwKQ0KI2lmIExJTlVYX1ZF
UlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDMsIDE4LCAwKQ0KI2lmIExJTlVYX1ZFUlNJT05f
Q09ERSA8IEtFUk5FTF9WRVJTSU9OKDQsIDEwLCAwKQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8
IEtFUk5FTF9WRVJTSU9OKDQsIDExLCAwKQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5F
TF9WRVJTSU9OKDQsIDEzLCAwKQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJT
SU9OKDQsIDE3LCAwKQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDQs
IDE4LCAwKQ0KI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDUsIDAsIDAp
DQojaWYgTElOVVhfVkVSU0lPTl9DT0RFIDwgS0VSTkVMX1ZFUlNJT04oNSwgMSwgMCkNCiNpZiBM
SU5VWF9WRVJTSU9OX0NPREUgPCBLRVJORUxfVkVSU0lPTig1LCA3LCAwKQ0KI2lmIExJTlVYX1ZF
UlNJT05fQ09ERSA8IEtFUk5FTF9WRVJTSU9OKDUsIDgsIDApDQoNCkFsdGhvdWdoIHNvbWUgc2Vl
bSB0byBiZSBhZ2FpbnN0IFZFUlNJT05fQ09ERSgpDQpyYXRoZXIgdGhhbiBLRVJORUxfVkVSU0lP
TigpLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K

