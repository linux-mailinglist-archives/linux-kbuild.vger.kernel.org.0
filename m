Return-Path: <linux-kbuild+bounces-1210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC9A877805
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 19:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FE1C1C20753
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 18:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A57E22324;
	Sun, 10 Mar 2024 18:37:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF9E3A1AC
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Mar 2024 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710095844; cv=none; b=SVDA3zxWilM2j81UsojL+cmdch4vkEFYERB7L9nQgWVW/4UXjBwjKrHl8m6AzgvyH9v7tZamtqaD1SVi+wvJlUyKGh7pH8Xdd14PdhyHDix0fhnqUR48kGSXbHvEpmcATr8bJ+W+9AGrk2LbZ7lhhUkFWRbf4f2SOmppA/c/Htw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710095844; c=relaxed/simple;
	bh=kbWGHOTGHPftct1YqUNqJ7ouPJ1OedgTOSV8N4+yFF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=H4v0IgRAWINtvMFWHmriR94BCTCIlE4tep2twNNyo4ooZsayG0hmeWT/5WhOliDptNu3buId3m3xW7l0uHbVPcy5E8xsw9MkN1tXQn9NmZWmVmmO2l4OQ+q5JtG1Ylt+7XTT6LjXGY+N7sDgy+a/MaCFR59+UmKAXCp23h+1Op4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-248-YiiRSlQpNdS9qY0k5gpFOg-1; Sun, 10 Mar 2024 18:37:18 +0000
X-MC-Unique: YiiRSlQpNdS9qY0k5gpFOg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 10 Mar
 2024 18:37:27 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 10 Mar 2024 18:37:27 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nathan Chancellor' <nathan@kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>
CC: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>, Nick Desaulniers
	<ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: RE: [PATCH] kbuild: remove GCC's default -Wpacked-bitfield-compat
 flag
Thread-Topic: [PATCH] kbuild: remove GCC's default -Wpacked-bitfield-compat
 flag
Thread-Index: AQHab+ZnjkGcfLRbvEm2I9CKWI0+3rExU5Uw
Date: Sun, 10 Mar 2024 18:37:27 +0000
Message-ID: <74e770fb614c41208203732b095bd20f@AcuMS.aculab.com>
References: <20240306124709.324448-1-masahiroy@kernel.org>
 <20240306164950.GB3659677@dev-arch.thelio-3990X>
In-Reply-To: <20240306164950.GB3659677@dev-arch.thelio-3990X>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogTmF0aGFuIENoYW5jZWxsb3INCj4gU2VudDogMDYgTWFyY2ggMjAyNCAxNjo1MA0KPiAN
Cj4gT24gV2VkLCBNYXIgMDYsIDIwMjQgYXQgMDk6NDc6MDlQTSArMDkwMCwgTWFzYWhpcm8gWWFt
YWRhIHdyb3RlOg0KPiA+IENvbW1pdCA0YTU4MzhhZDlkMmQgKCJrYnVpbGQ6IEFkZCBleHRyYSBn
Y2MgY2hlY2tzIikgYWRkZWQgdGhlDQo+ID4gLVdwYWNrZWQtYml0ZmllbGQtY29tcGF0IGZsYWcu
DQo+ID4NCj4gPiBHQ0MgbWFudWFsIHNheXM6DQo+ID4gICAiVGhpcyB3YXJuaW5nIGlzIGVuYWJs
ZWQgYnkgZGVmYXVsdC4gVXNlIC1Xbm8tcGFja2VkLWJpdGZpZWxkLWNvbXBhdA0KPiA+ICAgIHRv
IGRpc2FibGUgdGhpcyB3YXJuaW5nLiINCj4gPg0KPiA+IFRoZSB0ZXN0IGNvZGUgaW4gdGhlIG1h
bnVhbDoNCj4gPg0KPiA+ICAgc3RydWN0IGZvbw0KPiA+ICAgew0KPiA+ICAgICBjaGFyIGE6NDsN
Cj4gPiAgICAgY2hhciBiOjg7DQo+ID4gICB9IF9fYXR0cmlidXRlX18gKChwYWNrZWQpKTsNCj4g
Pg0KPiA+IC4uLiBlbWl0cyAibm90ZTogb2Zmc2V0IG9mIHBhY2tlZCBiaXQtZmllbGQg4oCYYuKA
mSBoYXMgY2hhbmdlZCBpbiBHQ0MgNC40Ig0KPiA+IHdpdGhvdXQgVz0zLg0KPiA+DQo+ID4gTGV0
J3MgcmVtb3ZlIGl0LCBhcyBpdCBpcyBhIGRlZmF1bHQgd2l0aCBHQ0MuDQo+ID4NCj4gPiBDbGFu
ZyBkb2VzIG5vdCBzdXBwb3J0IHRoaXMgZmxhZywgc28gaXRzIHJlbW92YWwgd2lsbCBub3QgYWZm
ZWN0IENsYW5nDQo+ID4gYnVpbGRzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8g
WWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4NCj4gDQo+IFJldmlld2VkLWJ5OiBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+DQoNCmdjYyBnZW5lcmF0ZXMgcHJldHR5IGNy
YXAgY29kZSBmb3IgdGhlIGFib3ZlLg0KY2xhbmcgaXMgb2sgdW5sZXNzIHlvdSBleHRlbmQgdGhl
IHN0cnVjdHVyZSB0byAzIGJ5dGVzLg0KU2VlOg0KaHR0cHM6Ly9nb2Rib2x0Lm9yZy96LzljMWNz
b25ZOQ0KDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1s
ZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJh
dGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=


