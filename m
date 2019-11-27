Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06AC110B1D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2019 16:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfK0PEk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Nov 2019 10:04:40 -0500
Received: from mail-eopbgr40113.outbound.protection.outlook.com ([40.107.4.113]:12257
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726558AbfK0PEk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Nov 2019 10:04:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BswuJtgFXX84iHNJOi3rh86xazRsnM6g5sK6kL8fuzsF02n4COp6Z+lk7RkC82azIWlrqFAQZ9yvTxFLgM0EhsrTQMOc//Hv1LmyCfsWVtjU/HH1o4UlHlzhSzAf0L8B3Y2OCrRWiI5WwsYOftRImyjmhHYME/Q6084JSusP2BNvviGfM4rSX/O203AT8CCvil+A9PXzbVOI0uJk5KPROnvjDa7Mt1Oyo6BLpG01mISIqSKlPw+hiJtvDscehqyzAKLdwj17CesrE9KKuH1PKfKBlo3woHu1kYqmWamIXXSNbDJyN+neYAWU6GdBnodb+xGcWQ8j8GCXxC+EqHOwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TAinqsNTPunVKjCn4OWmG+WCuHEvdjkZSJ02GiLzcg=;
 b=SQWL9/cza2CGTQA7Pq1+1fIhghKeS0lpnN2YbFlowRqb+DC2ZD1LQpi65FyQFBA8+O/hBDcjDNLNZTAP7c5qPNepB9mls4HpIlCXKT3ZJA/20bJ4ZHIF/ezPeOvpGWLSUCBzhGY+PauqOTzlPrYuV/LdQm5HrDQqwWX/tit9B6dH8/TmUZpMk/SdhK7W34qs/UBEOmEgA7dyCHIRWkvvcQvBwan1HsVEdPEKAUmbcghJ4D3dLA4aUa19nGU3wNpmujdyIKNmjc2Fb2koGFxJHd8QFoKZuMk0cb37jmTOD5xcRpxjg9u/fd3Cp2GPQfqaSOrS2NWIlNp2qRSxW95xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criteo.com; dmarc=pass action=none header.from=criteo.com;
 dkim=pass header.d=criteo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criteo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TAinqsNTPunVKjCn4OWmG+WCuHEvdjkZSJ02GiLzcg=;
 b=ol1/1mX57SbWuC7EwXMI/nWbdYT3dapNGPkKi4UECwgaO2GCpiURs2ECn2TUUOgtIq/FS5CG0e1OX9Pmojk7mUPDeDmafWzzkNXD2/OzMefWmhMG4BSkZZpIp8LPjxUqh5SsOdtiuemB2jsFebz8kMztRMgNhJJopMcQtSQToE0=
Received: from AM6PR04MB4918.eurprd04.prod.outlook.com (20.177.33.157) by
 AM6PR04MB4775.eurprd04.prod.outlook.com (20.177.32.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 27 Nov 2019 15:04:34 +0000
Received: from AM6PR04MB4918.eurprd04.prod.outlook.com
 ([fe80::5c98:951f:588a:ab5a]) by AM6PR04MB4918.eurprd04.prod.outlook.com
 ([fe80::5c98:951f:588a:ab5a%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 15:04:34 +0000
From:   Erwan Velu <e.velu@criteo.com>
To:     Jean Delvare <jdelvare@suse.de>,
        Erwan Velu <erwanaliasr1@gmail.com>
CC:     "Robert P. J. Day" <rpjday@crashcourse.ca>,
        Changbin Du <changbin.du@intel.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] firmware/dmi_scan: Add dmi_save_release to save
 releases fields
Thread-Topic: [PATCH 1/3] firmware/dmi_scan: Add dmi_save_release to save
 releases fields
Thread-Index: AQHVbgWw0wN+uehLTUK/Oh6WnVmkDqdlXJcAgDou2YA=
Date:   Wed, 27 Nov 2019 15:04:34 +0000
Message-ID: <c1dce47f-f772-b6a9-745f-49a39788b276@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
 <20191021163208.5cd03d59@endymion>
In-Reply-To: <20191021163208.5cd03d59@endymion>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0403.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::31) To AM6PR04MB4918.eurprd04.prod.outlook.com
 (2603:10a6:20b:6::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=e.velu@criteo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.242.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1bcad889-9a42-47e3-5ad2-08d7734b1d26
x-ms-traffictypediagnostic: AM6PR04MB4775:
x-microsoft-antispam-prvs: <AM6PR04MB47755C37BD75CFC43310A89AF2440@AM6PR04MB4775.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:76;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(199004)(189003)(3846002)(71190400001)(71200400001)(6436002)(102836004)(6486002)(14444005)(81156014)(229853002)(81166006)(25786009)(5660300002)(31696002)(8676002)(86362001)(52116002)(478600001)(8936002)(305945005)(76176011)(7736002)(256004)(6512007)(6116002)(386003)(6506007)(53546011)(2906002)(186003)(54906003)(66446008)(64756008)(66556008)(66476007)(4326008)(66946007)(2616005)(14454004)(110136005)(11346002)(6246003)(31686004)(7416002)(316002)(446003)(99286004)(26005)(66066001)(36756003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR04MB4775;H:AM6PR04MB4918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: criteo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0mhn/QRW5N9REnvRHIFk7ketdLnDjwKE1owBVKXOJIcrMNMdXsHp0vzeOgBpVb0WILQxO0SVG4ijoU1lj5TTVYr+TFWVW7oGGTaUfBXBtx7NGtaY20/VmFgGo4f5hOSrheWj1C1EuiSAtE0cITHYiW3kLSeD3gfwGwjcZT4g8wH2rJJerZBvnPUO157Me+5Sfnlm//btQWUpRLuHW+hKb7XlD76f3CdGzB3NNpoA58muDu6fJO5Sxp8gkaeLxDptm6E7OpWSoaQyV9ShU3nfA5GptIAphYWqAgi6PL5mmkl3aoiAolReTSGCbAoOyYg2BDIpkh/2C1wEvQovI5P5BOEYdW3LymZEcV02NEwL8mSx9S5pDTL8ANJ+fKfc0YJtqOgIHVeODe5/6+lQGb8DhPykTamwrlGqXZMinSg67H2ogVosnthtubxviIOjWGC9
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6A98BB875B3AC24EA7B7A6693A7C01DC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: criteo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcad889-9a42-47e3-5ad2-08d7734b1d26
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 15:04:34.7157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a35d8fd-574d-48e3-927c-8c398e225a01
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHgyV7yPqWVa/KCqExWze2KcLlVRKMZvG7V3dL4rbxOq3Aul+YFoa6wQOWXCHvSB9KEBMfKKF9DVy4MZqg1/WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4775
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

R290IGFsbCB5b3VyIHBvaW50cywgc2VuZGluZyBhIFYyIHdpdGggdGhlIGZpeGVzIHlvdSBhc2tl
ZC4NCg0KT24gMjEvMTAvMjAxOSAxNjozMiwgSmVhbiBEZWx2YXJlIHdyb3RlOg0KPiBIaSBFcndh
biwNCj4NCj4gU29ycnkgZm9yIHRoZSBsYXRlIGFuc3dlci4NCj4NCj4gT24gV2VkLCAxOCBTZXAg
MjAxOSAxMTo0MzoxOSArMDIwMCwgRXJ3YW4gVmVsdSB3cm90ZToNCj4+IEluIERNSSB0eXBlIDAs
IHRoZXJlIGlzIHNldmVyYWwgZmllbGRzIHRoYXQgZW5jb2RlcyBhIHJlbGVhc2UuDQo+IGlzIC0+
IGFyZQ0KPiBlbmNvZGVzIC0+IGVuY29kZQ0KPg0KPj4gVGhlIGRtaV9zYXZlX3JlbGVhc2UoKSBm
dW5jdGlvbiBoYXZlIHRoZSBsb2dpYyB0byBjaGVjayBpZiB0aGUgZmllbGQgaXMgdmFsaWQuDQo+
PiBJZiBzbywgaXQgcmVwb3J0cyB0aGUgYWN0dWFsIHZhbHVlLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IEVyd2FuIFZlbHUgPGUudmVsdUBjcml0ZW8uY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMv
ZmlybXdhcmUvZG1pX3NjYW4uYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspDQo+IFRoaXMgcGF0Y2ggaW50cm9kdWNl
cyBhIHdhcm5pbmc6DQo+DQo+IGRyaXZlcnMvZmlybXdhcmUvZG1pX3NjYW4uYzoxODU6MjA6IHdh
cm5pbmc6IOKAmGRtaV9zYXZlX3JlbGVhc2XigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWZ1bmN0aW9uXQ0KPiAgIHN0YXRpYyB2b2lkIF9faW5pdCBkbWlfc2F2ZV9yZWxlYXNlKGNv
bnN0IHN0cnVjdCBkbWlfaGVhZGVyICpkbSwgaW50IHNsb3QsDQo+ICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn4NCj4NCj4gYmVjYXVzZSB5b3UgYWRkIGEgc3RhdGljIGZ1bmN0
aW9uIHdpdGggbm8gdXNlci4gSSB1bmRlcnN0YW5kIHRoYXQgeW91DQo+IGFkZCBhIHVzZSBsYXRl
ciBpbiB0aGUgc2VyaWVzLCBidXQgaXQncyBub3QgT0sgdG8gaW50cm9kdWNlIGEgd2FybmluZw0K
PiBldmVuIGlmIHRlbXBvcmFyeS4gSXQgYWxzbyBtYWtlcyBsaXR0bGUgc2Vuc2UgdG8gc3BsaXQg
dGhlIGNoYW5nZXMgdGhhdA0KPiB3YXkgYXMgdGhlcmUgaXMgbm8gd2F5IHRvIGNoZXJyeS1waWNr
IG9uZSBvZiB0aGUgcGF0Y2hlcyB3aXRob3V0IHRoZQ0KPiByZXN0LiBBbmQgaXQgbWFrZXMgdGhp
bmdzIG1vcmUgZGlmZmljdWx0IHRvIHJldmlldyB0b28sIGFzIEkgY2FuJ3QNCj4gcG9zc2libHkg
anVkZ2UgaWYgdGhpcyBmdW5jdGlvbiBpZiByaWdodCB3aXRob3V0IGFsc28gc2VlaW5nIHdoZXJl
IGlzDQo+IHdpbGwgYmUgY2FsbGVkIGFuZCBob3cuDQo+DQo+IFNvLCBwbGVhc2UgbWVyZ2UgYWxs
IHRoZSBjaGFuZ2VzIGludG8gYSBzaW5nbGUgcGF0Y2guDQo+DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9maXJtd2FyZS9kbWlfc2Nhbi5jIGIvZHJpdmVycy9maXJtd2FyZS9kbWlfc2Nhbi5jDQo+
PiBpbmRleCAzNWVkNTZiOWMzNGYuLjIwMmJkMmM2OWQwZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZmlybXdhcmUvZG1pX3NjYW4uYw0KPj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9kbWlfc2Nh
bi5jDQo+PiBAQCAtMTgxLDYgKzE4MSwzMiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZG1pX3NhdmVf
aWRlbnQoY29uc3Qgc3RydWN0IGRtaV9oZWFkZXIgKmRtLCBpbnQgc2xvdCwNCj4+ICAgCWRtaV9p
ZGVudFtzbG90XSA9IHA7DQo+PiAgIH0NCj4+ICAgDQo+PiArc3RhdGljIHZvaWQgX19pbml0IGRt
aV9zYXZlX3JlbGVhc2UoY29uc3Qgc3RydWN0IGRtaV9oZWFkZXIgKmRtLCBpbnQgc2xvdCwNCj4+
ICsJCWludCBpbmRleCkNCj4+ICt7DQo+PiArCWNvbnN0IHU4ICpkOw0KPj4gKwljaGFyICpzOw0K
Pj4gKw0KPj4gKwkvLyBJZiB0aGUgdGFibGUgZG9lc24ndCBoYXZlIHRoZSBmaWVsZCwgbGV0J3Mg
cmV0dXJuDQo+IFBsZWFzZSBzdGljayB0byBDODktc3R5bGUgY29tbWVudHMgKC8qICovKSBhcyB1
c2VkIGV2ZXJ5d2hlcmUgZWxzZSBpbg0KPiB0aGlzIGZpbGUuDQo+DQo+PiArCWlmIChkbWlfaWRl
bnRbc2xvdF0gfHwgZG0tPmxlbmd0aCA8IGluZGV4KQ0KPj4gKwkJcmV0dXJuOw0KPj4gKw0KPj4g
KwlkID0gKHU4ICopIGRtICsgaW5kZXg7DQo+PiArDQo+PiArCS8vIEFzIHBlciB0aGUgc3BlY2lm
aWNhdGlvbiwNCj4+ICsJLy8gaWYgdGhlIHN5c3RlbSBkb2Vzbid0IGhhdmUgdGhlIGZpZWxkLCB0
aGUgdmFsdWUgaXMgRkYNCj4+ICsJaWYgKGRbMF0gPT0gMHhGRikNCj4+ICsJCXJldHVybjsNCj4g
VGhhdCdzIG5vdCBleGFjdGx5IHdoYXQgdGhlIHNwZWNpZmljYXRpb24gc2F5cy4gSXQgc2F5czoN
Cj4NCj4gIklmIHRoZSBzeXN0ZW0gZG9lcyBub3Qgc3VwcG9ydCB0aGUgdXNlIG9mIFt0aGUgU3lz
dGVtIEJJT1MgTWFqb3INCj4gUmVsZWFzZV0gZmllbGQsIHRoZSB2YWx1ZSBpcyAwRkZoIGZvciBi
b3RoIHRoaXMgZmllbGQgYW5kIHRoZSBTeXN0ZW0NCj4gQklPUyBNaW5vciBSZWxlYXNlIGZpZWxk
LiIgU28gdW51c2VkIGlzIHdoZW4gYm90aCBmaWVsZHMgYXJlIDB4RkYuIFlvdQ0KPiBjYW4ndCB0
ZXN0IHRoZW0gaW5kZXBlbmRlbnRseS4NCj4NCj4gU2FtZSBnb2VzIGZvciB0aGUgRW1iZWRkZWQg
Q29udHJvbGxlciBGaXJtd2FyZSBSZWxlYXNlIGZpZWxkcywgZXZlbiBpZg0KPiBpdCBpcyB3b3Jk
ZWQgZGlmZmVyZW50bHksIHRoZSBsb2dpYyBpcyB0aGUgc2FtZS4NCj4NCj4+ICsNCj4+ICsJcyA9
IGRtaV9hbGxvYyg0KTsNCj4+ICsJaWYgKCFzKQ0KPj4gKwkJcmV0dXJuOw0KPj4gKw0KPj4gKwlz
cHJpbnRmKHMsICIldSIsIGRbMF0pOw0KPj4gKw0KPj4gKwlkbWlfaWRlbnRbc2xvdF0gPSBzOw0K
Pj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgX19pbml0IGRtaV9zYXZlX3V1aWQoY29uc3Qg
c3RydWN0IGRtaV9oZWFkZXIgKmRtLCBpbnQgc2xvdCwNCj4+ICAgCQlpbnQgaW5kZXgpDQo+PiAg
IHsNCj4NCg==
