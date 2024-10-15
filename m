Return-Path: <linux-kbuild+bounces-4128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9399F87F
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3806B1F22B54
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 21:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C581CBE8A;
	Tue, 15 Oct 2024 21:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="LR3EeD3j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839C1B6D04
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 21:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729026114; cv=none; b=gL+OeUdBkw8F4+gnzd/9OFLe/S+nu9deaMAfWPAHGn18tpbPEgKKZWsCAtokFmTf97pIrbsk9OUzGPDfgz6vI0S3aokWg13angqmm3oH9rjyJb3Z8NoOgpQ7aIFnAAFbXDH0UhBZXT0FjxdQbMdhqz5CWy2eiwGoLb16rQHBz1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729026114; c=relaxed/simple;
	bh=MZpiEl9+p1+8tohkeplA7FfFnOl9tmF6blXh1D3ylwc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KWZzthdxLOZJNONIMJDdt7f1rWFHXV8L+eQRmsENgruB2cVsA9sCfFaYzaUKSTeJw7w9ccabB/1V8lB5gyTBXR97C+99Qq3R1nSD8e9U859C9gYf8OZ1frlUx+OMp2NArM67Ogq65A9Z1Z/pUIX68GnQGek1TgvJy/j1HzrWkio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=LR3EeD3j; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8145B2C03CB;
	Wed, 16 Oct 2024 10:01:43 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729026103;
	bh=MZpiEl9+p1+8tohkeplA7FfFnOl9tmF6blXh1D3ylwc=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=LR3EeD3jVJUbtC74r8VOEEBDYDwzAbh0lmQmczn5c5D69dfzReB8inCvJ/QXTJ7RD
	 fbPxNNcM8lT/bd8oBSZc03YU5BEHB1WQ4fkAbJmfMeEIt81hI19NDtxyAztwQsE2yh
	 El35bTKx+EK0CArIwY8DlQpkVe2W+BPI/nYdMsTqvPf3Ugc1RzF6oQkVHE6gSYAzst
	 kavvSKh4Ea6AOIHVDg2vKGlURvaowHOr+rDQmAa2Geh5yXGP60etRaXn3WPd9cV8CW
	 YKlfd/YV7mL57oDO9OIH+fez8Wr+FvHkMyaZAAratLPkLcuc3MuqIqzitK1RRlXMwc
	 RVvBBeEx43URQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B670ed8370000>; Wed, 16 Oct 2024 10:01:43 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 16 Oct 2024 10:01:43 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 16 Oct 2024 10:01:43 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Wed, 16 Oct 2024 10:01:43 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "Masahiro
 Yamada" <masahiroy@kernel.org>
Subject: Re: Building out of tree dtbs
Thread-Topic: Building out of tree dtbs
Thread-Index: AQHbHz8ShM93kB+1lU6CdSd0a3sZxrKHcnIA
Date: Tue, 15 Oct 2024 21:01:42 +0000
Message-ID: <2a2be28c-fd5e-45b0-8834-611d35c5e6a6@alliedtelesis.co.nz>
References: <269854a8-1041-4ba6-b022-ba8ec15c6b78@alliedtelesis.co.nz>
In-Reply-To: <269854a8-1041-4ba6-b022-ba8ec15c6b78@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <29306E9582879B409922E33C57C3D3CA@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=670ed837 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=p0WdMEafAAAA:8 a=YRHvXXt1AAAA:8 a=cBH9McE8t2GGkYx7cgcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9bw_jnHfPby8klRCszyn:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxNi8xMC8yNCAwOToxNiwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4gKHJlc2VuZCB3aXRo
b3V0IEhUTUwgcGFydCkNCj4NCj4gSGksDQo+DQo+IEkganVzdCBub3RpY2VkIHdpdGggdGhlIGxh
dGVzdCA2LjEyLXJjIEknbSBubyBsb25nZXIgYWJsZSB0byBidWlsZCBhbiANCj4gb3V0IG9mIHRy
ZWUgZHRiIGJ5IGp1c3QgY29weWluZyBpdCBpbnRvIGFyY2gvJEFSQ0gvYm9vdC9kdHMgKGF0IGxl
YXN0IA0KPiBmb3IgQVJDSD1taXBzIGFuZCBBUkNIPWFybTY0KSBhbmQgcnVubmluZyBgbWFrZSBt
eS1ib2FyZC5kdGJgLiBJIA0KPiBiZWxpZXZlIGJ1aWxkcm9vdCByZWxpZXMgb24gdGhpcyBhcyB3
ZWxsWzFdLg0KDQpBIHNpbXBsZSByZXBybyBpcw0KDQptYWtlIEFSQ0g9YXJtIG12ZWJ1X3Y3X2Rl
ZmNvbmZpZw0KY3AgYXJjaC9hcm0vYm9vdC9kdHMvbWFydmVsbC9hcm1hZGEtMzg1LWRiLWFwLmR0
cyANCmFyY2gvYXJtL2Jvb3QvZHRzL215Ym9hcmQuZHRzDQptYWtlIEFSQ0g9YXJtIG15Ym9hcmQu
ZHRiDQoNCj4NCj4gSXMgdGhpcyBhbiBpbnRlbnRpb25hbCBjaGFuZ2U/IElzIGl0IHRvbyBsYXRl
IHRvIHVuZG8gaXQgKG9yIHByb3ZpZGUgDQo+IGFuIGFsdGVybmF0aXZlIHdheSBvZiBoYXZpbmcg
b3V0IG9mIHRyZWUgZHRzIHRoYXQgbWFrZSB1c2Ugb2YgaW4tdHJlZSANCj4gZHRzaSkuDQpMb29r
cyBsaWtlIHRoaXMgaXMgY2F1c2VkIGJ5IGNvbW1pdCBlN2UyOTQxMzAwZDIgKCJrYnVpbGQ6IHNw
bGl0IGRldmljZSANCnRyZWUgYnVpbGQgcnVsZXMgaW50byBzY3JpcHRzL01ha2VmaWxlLmR0YnMi
KS4gVGhlIGNvbmRpdGlvbmFsIGluY2x1ZGUgDQpvZiBNYWtlZmlsZS5kdGJzIGlzbid0IHNhdGlz
ZmllZCB3aGVuIGJ1aWxkaW5nIGFuIG91dCBvZiB0cmVlIGR0Yi4NCj4NCj4gVGhhbmtzLA0KPiBD
aHJpcw0KPg0KPiAtLSANCj4NCj4gWzFdIC0gDQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL2xpbnV4L2xpbnV4Lm1rP3JlZl90eXBlPWhl
YWRzI0w1MTYNCj4=

