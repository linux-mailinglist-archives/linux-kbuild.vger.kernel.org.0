Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1403D201ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2019 11:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfEPJAz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 05:00:55 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:25423 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbfEPJAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 05:00:55 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-29-QTC7KcOOO2udt3W1q3ypsw-1; Thu, 16 May 2019 10:00:51 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
 (fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu,
 16 May 2019 10:00:50 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 16 May 2019 10:00:50 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Masahiro Yamada' <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>
CC:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        "Linus Torvalds" <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Michal Marek <michal.lkml@markovi.net>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH] kbuild: check uniqueness of basename of modules
Thread-Topic: [RFC PATCH] kbuild: check uniqueness of basename of modules
Thread-Index: AQHVC0duCQWaXGJR5Uu8WNOo32As+qZtcj3A
Date:   Thu, 16 May 2019 09:00:50 +0000
Message-ID: <5e6999f3d0b349bd86a32a612cff7b4b@AcuMS.aculab.com>
References: <20190515073818.22486-1-yamada.masahiro@socionext.com>
 <CAK7LNAQgBKq9JDGtQUD1kgKrfLZ4jOjuLJi7_tpSPLJZsWtmag@mail.gmail.com>
 <201905150913.C23BD99AD@keescook>
 <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
In-Reply-To: <CAK7LNARezpQgcK9O9K3ZFeebMVNroWStno_brvSLadsKXVfm-Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: QTC7KcOOO2udt3W1q3ypsw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

RnJvbTogTWFzYWhpcm8gWWFtYWRhDQo+IFNlbnQ6IDE1IE1heSAyMDE5IDE4OjU1DQouLi4NCj4g
PiAgICAgeGFyZ3MgYmFzZW5hbWUgLWEgLS0gfCBzb3J0IHwgLi4uDQo+IA0KPiBTb3JyeSBmb3Ig
bXkgaWdub3JhbmNlLCBidXQgY291bGQgeW91DQo+IHRlYWNoIG1lIHRoZSBlZmZlY3Qgb2YgIi0t
IiA/DQo+IA0KPiBJIHNvbWV0aW1lcyB1c2UgIi0tIiBhcyBhIHNlcGFyYXRvcg0KPiB3aGVuIHRo
ZXJlIGlzIGFtYmlndWl0eSBpbiBhcmd1bWVudHMNCj4gZm9yIGV4YW1wbGUsICJnaXQgbG9nIDxy
ZXZpc2lvbj4gLS0gPHBhdGg+Ig0KPiANCj4gSW4gdGhpcyBjYXNlLCB3aGF0IGlzIGludGVuZGVk
IGJ5ICItLSI/DQoNClRoZSAnLS0nIHN0b3BzIGdldG9wdCgpIGZyb20gcGFyc2luZyBhbnkgbW9y
ZSBwYXJhbWV0ZXJzLg0KVXNlZnVsIHRoaW5ncyBsaWtlICdncmVwIC0tIC1xJyB3aGljaCB3aWxs
IHNlYXJjaCBmb3IgdGhlDQpzdHJpbmcgJy1xJyByYXRoZXIgdGhhbiB0cmVhdGluZyBpdCBhcyBh
IGNvbW1hbmQgbGluZSBvcHRpb24uDQoNClRoaXMgaXMgYWxsIG1hZGUgbW9yZSBob3JyaWQgYnkg
YSBkZWNpc2lvbiBieSB0aGUgd3JpdGVycw0Kb2YgZ2xpYmMgZ2V0b3B0KCkgdG8gJ3Blcm11dGUn
IGFyZ3ZbXSBzbyB0aGF0ICdvcHRpb25zJw0KY2FuIGZvbGxvdyAnbm9ub3B0aW9ucycgaWUgaXQg
Y29udmVydHM6DQoJcHJvZyBmaWxlIC1hcmcNCnRvDQoJcHJvZyAtYXJnIGZpbGUNClRoZSBvbmx5
IHByb2dyYW0gdGhlIGhpc3RvcmljYWxseSBhbGxvd2VkICdsYXRlJyBvcHRpb25zDQp3YXMgJ3Js
b2dpbiBob3N0bmFtZSAtbCB1c2VybmFtZScuDQpUaGlzIGlzIGp1c3QgYnJva2VuLi4uLi4NCg0K
CURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBN
b3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAx
Mzk3Mzg2IChXYWxlcykNCg==

