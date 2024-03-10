Return-Path: <linux-kbuild+bounces-1209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A51478777AD
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 18:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8629281429
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Mar 2024 17:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BD439ADB;
	Sun, 10 Mar 2024 17:02:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C3339855
	for <linux-kbuild@vger.kernel.org>; Sun, 10 Mar 2024 17:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.86.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710090156; cv=none; b=n6Raih3sxbszn8YfDQS86dTfJACJ8Ged3nHeCqkNiGSVgt2oSPoXvi6y9xL1xUmZGZNYkX1yJf7tDYYmZ+/+8a9GKQZrPVaWoJoKFujZBfS3cdfsXb9oD0Qin+2Wez77Byoq/CEKBuTMs8bjubcfoNJkYaSJMIlArO3BDJB/DsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710090156; c=relaxed/simple;
	bh=I9x7BdyUUczq88YNuTHstKnsDTlJVDfJv3A8utHm/1w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=tgJu3ULySqGz1HFDym8l1lFWoYw8Ersw4VtHkV7gVlkrZoY7K8o1tIQHaZp7FQZWVjjYm7X1GjJjepD8Gz+EKa/SjRymggmxea65gfPAgqx7goEGfy9hcpDL6UqVYmILId+9ZqX09HhZKfE1Cd+vB8bmH/w3s3394J94OXtR+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.86.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-169-FjRJos4bP-SvaGBz03k0zA-1; Sun, 10 Mar 2024 17:02:25 +0000
X-MC-Unique: FjRJos4bP-SvaGBz03k0zA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 10 Mar
 2024 17:02:35 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 10 Mar 2024 17:02:35 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Nathan Chancellor' <nathan@kernel.org>, "masahiroy@kernel.org"
	<masahiroy@kernel.org>
CC: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "ndesaulniers@google.com"
	<ndesaulniers@google.com>, "morbo@google.com" <morbo@google.com>,
	"justinstitt@google.com" <justinstitt@google.com>, "arnd@arndb.de"
	<arnd@arndb.de>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2] kbuild: Move
 -Wenum-{compare-conditional,enum-conversion} into W=1
Thread-Topic: [PATCH v2] kbuild: Move
 -Wenum-{compare-conditional,enum-conversion} into W=1
Thread-Index: AQHab0pcJ+ohPpECwEa4FIxcfG/R2bExObUA
Date: Sun, 10 Mar 2024 17:02:34 +0000
Message-ID: <8a7d0115e41949429e43e06b9479a781@AcuMS.aculab.com>
References: <20240305-disable-extra-clang-enum-warnings-v2-1-ba529ec15f95@kernel.org>
In-Reply-To: <20240305-disable-extra-clang-enum-warnings-v2-1-ba529ec15f95@kernel.org>
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

RnJvbTogTmF0aGFuIENoYW5jZWxsb3INCj4gU2VudDogMDUgTWFyY2ggMjAyNCAyMjoxMw0KLi4u
DQo+ICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvaW50ZWwvaXdsd2lmaS9tdm0vbWFjLWN0eHQuYzox
MTIwOjIxOiB3YXJuaW5nOiBjb25kaXRpb25hbA0KPiBleHByZXNzaW9uIGJldHdlZW4gZGlmZmVy
ZW50IGVudW1lcmF0aW9uIHR5cGVzICgnZW51bSBpd2xfbWFjX2JlYWNvbl9mbGFncycgYW5kDQo+
ICdlbnVtIGl3bF9tYWNfYmVhY29uX2ZsYWdzX3YxJykgWy1XZW51bS1jb21wYXJlLWNvbmRpdGlv
bmFsXQ0KPiAgICAxMTIwIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwKSA+IDEwID8NCj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+ICAgIDExMjEgfCAgICAgICAgICAgICAg
ICAgICAgICAgICBJV0xfTUFDX0JFQUNPTl9GSUxTIDoNCj4gICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gICAgMTEyMiB8ICAgICAgICAgICAg
ICAgICAgICAgICAgIElXTF9NQUNfQkVBQ09OX0ZJTFNfVjE7DQo+ICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IA0KPiBEb2luZyBhcml0
aG1ldGljIGJldHdlZW4gb3IgcmV0dXJuaW5nIHR3byBkaWZmZXJlbnQgdHlwZXMgb2YgZW51bXMg
Y291bGQNCj4gYmUgYSBidWcsIHNvIGVhY2ggb2YgdGhlIGluc3RhbmNlIG9mIHRoZSB3YXJuaW5n
IG5lZWRzIHRvIGJlIGV2YWx1YXRlZC4NCj4gVW5mb3J0dW5hdGVseSwgYXMgbWVudGlvbmVkIGFi
b3ZlLCB0aGVyZSBhcmUgbWFueSBpbnN0YW5jZXMgb2YgdGhpcw0KPiB3YXJuaW5nIGluIG1hbnkg
ZGlmZmVyZW50IGNvbmZpZ3VyYXRpb25zLCB3aGljaCBjYW4gYnJlYWsgdGhlIGJ1aWxkIHdoZW4N
Cj4gQ09ORklHX1dFUlJPUiBpcyBlbmFibGVkLg0KDQpJJ20gbm90IHN1cmUgd2hhdCBpcyBiZWlu
ZyBkb25lIHRvIGF2b2lkIHRoaXMgd2FybmluZy4NCihBcGFydCBmcm9tIG5vdCB1c2luZyBlbnVt
IHRvIGRlZmluZSByZWxhdGVkIGludGVnZXIgY29uc3RhbnRzLikNClVudGlsIHRoZSBjb21waWxl
cnMgZ2V0IGV2ZW4gbW9yZSBjbGV2ZXJeV3N0dXBpZCBwZXJoYXBzIHRoZQ0Kc2ltcGxlc3Qgd2F5
IGlzIHRvIGp1c3QgYWRkICcrIDAnIHRvIG9uZSBvZiB0aGUgZW51bSB2YWx1ZXMuDQoNCkluIGNv
ZGUgdGVybXMgaXQgaXMgbXVjaCBzYWZlciB0aGFuIGFueSBjYXN0Lg0KDQoJRGF2aWQNCg0KLQ0K
UmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1p
bHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVz
KQ0K


