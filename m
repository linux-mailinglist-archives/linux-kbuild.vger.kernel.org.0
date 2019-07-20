Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E266EFE7
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2019 17:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfGTPiP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 20 Jul 2019 11:38:15 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:42406 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726020AbfGTPiP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Jul 2019 11:38:15 -0400
Received: from mailhost.synopsys.com (dc8-mailhost2.synopsys.com [10.13.135.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C25BAC0BD9;
        Sat, 20 Jul 2019 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1563637094; bh=3Z7eQsZn6sgJj/f+0tYA3GNk55J7g0XqCGQ4K7HRHck=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=kz5Ro9CbGWMMJw7XYRJVwiKiu4Tr5ROCAbDyte7eIcEoyEPvRTAGiQ6y/v0LeaRbT
         wCVeWXG25qh8q3FrGgnWb5YnM8h2tWBna9ZTmhPOxfTugimFMys7wxXRbps7SeUS+a
         bsNqFZkE+He4OfbXxVF5gYiPXHB912VigdZFyflfTQtsZz3W2THT4hA8ngj5EuEezH
         HmOBaXhMgLfS6cyrtCz0M90DEn5D6iYHw2DSaCatgtrP6Ar3K66fg8FHz7tVDBY9tR
         27swzjy0XizOB1XUKsf2/NWN/vlUijUyV7Fvd30sxOr65vPxBBe4uEfCCLUXJlv6Vo
         NXyHZZGxV4Eqw==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 06F4BA0067;
        Sat, 20 Jul 2019 15:38:00 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sat, 20 Jul 2019 08:37:43 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sat, 20 Jul 2019 08:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHIHz4nvUmqaFd63Akt5hxK3xZiYvZPBr6UxtW+qXRMxFpm2Jw+VKHgKD6tZLWzfJ81VssRJgfQ1IA2rnnFrbIo6l4vB94GCSOCenoTzoonSGxDJE5QMif1rJNV6FYLe06j0Wr7ERInBniHOuo8khiCWtCzgGX46my7aFWqZu1Z95WxMQtIplTOCltP34Jko1jwQiULfI5HlzX+RQCq2K/bRcvZ1azardbbUeMd5vaff0+1a1Ma+AEuNCo/bKs/Kuc2aLjn6pBHhGihEmcHbOJPUxBuTDOjU2Xvdes0mLslQOIJsy1xgN1tWppx4PMdtaCCIvihpqs71qnX+acFjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z7eQsZn6sgJj/f+0tYA3GNk55J7g0XqCGQ4K7HRHck=;
 b=oFnwl+fKRkbMsWXRohlOM+pdKAHN1PMQCHT7U2wY/qvt5eiUi5rW9PipzrTPgbxCRFx97LhtmatJiaEtpzpP5wcEjT7J9vKo/z8d5cTuF24GyWCARv3WwGCuxeqvF6YnRX67vCKsYBLqGCPme6pd8h/TP3ivzGMDoaUufMvR8BgFSwvptA/gmbqgX3sfXVhyl6w7vCf9vlNkMdnvyYC2+7TJR7IciVQ4y2m+wRXmJ82tRM9R2EPIHCvdbIfbF6IZdPdM4su9pXPbGyRH6V5+HrUab8HbB+Td11G1sKQw1U4M0DmH9HkN+d6ydOjb+GTvTlI2LuM9W6zocjAdOjgCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z7eQsZn6sgJj/f+0tYA3GNk55J7g0XqCGQ4K7HRHck=;
 b=K5me4nNeFzCW1ArtnYOcD1mfPIYBG/wjSBRlsxlju40xCPCKeS7cGQJEzVNGsyEufTMIOA1iLeSUzr42uc5PMCxctwa3MMI7qSOSMs5k44MpZX2aJcbmw5ya/CtIhVlOEHYcOFIN2OIiFQexmLXQaFdlmxMUeGTNQgouzkYDkg0=
Received: from SN6PR12MB2670.namprd12.prod.outlook.com (52.135.103.23) by
 SN6PR12MB2733.namprd12.prod.outlook.com (52.135.107.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Sat, 20 Jul 2019 15:37:40 +0000
Received: from SN6PR12MB2670.namprd12.prod.outlook.com
 ([fe80::ecdd:a159:c3f7:67a]) by SN6PR12MB2670.namprd12.prod.outlook.com
 ([fe80::ecdd:a159:c3f7:67a%6]) with mapi id 15.20.2073.012; Sat, 20 Jul 2019
 15:37:40 +0000
From:   Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To:     "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>,
        "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>
CC:     Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>
Subject: Re: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
Thread-Topic: [TRIVIAL PATCH] of: per-file dtc preprocessor flags
Thread-Index: AQHVPmg4jawoiv33Z0C0yAK8hCVHfKbSzE+AgADYbQA=
Date:   Sat, 20 Jul 2019 15:37:40 +0000
Message-ID: <b2f24f32fead8bc9f282d2beb77d58ed3b98850c.camel@synopsys.com>
References: <20190719192824.24639-1-Eugeniy.Paltsev@synopsys.com>
         <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
In-Reply-To: <CAK7LNARJjb3fgdo_dxPSv-vs5x573OHKf-UAUJGMc89Jfmk+QA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=paltsev@synopsys.com; 
x-originating-ip: [5.18.205.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aba2be0e-c3d2-4090-4199-08d70d283374
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SN6PR12MB2733;
x-ms-traffictypediagnostic: SN6PR12MB2733:
x-microsoft-antispam-prvs: <SN6PR12MB27336B696D3B0295648530EADECA0@SN6PR12MB2733.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0104247462
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(396003)(366004)(376002)(136003)(189003)(199004)(66066001)(99286004)(110136005)(14444005)(256004)(316002)(14454004)(53546011)(6506007)(102836004)(2501003)(76176011)(4326008)(107886003)(66946007)(5660300002)(91956017)(6246003)(68736007)(229853002)(86362001)(66446008)(64756008)(66556008)(66476007)(76116006)(54906003)(6116002)(3846002)(25786009)(6512007)(118296001)(2616005)(446003)(11346002)(36756003)(53936002)(71446004)(476003)(8676002)(81156014)(2906002)(26005)(186003)(7736002)(6486002)(8936002)(71200400001)(71190400001)(478600001)(6436002)(81166006)(305945005)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR12MB2733;H:SN6PR12MB2670.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xAEprDNnHSUhMxBcF8HsqGBOfQz5RP3flUqN+p8TNu/4r0oxCFsQSsW+dK1IYSdXZf5DTG6BVlctJc8c+N5s4eRtXdXUmsIw3aSWK7ZcM7cxMVpO7nDq5pQLLurAlS69kUsRQJ7RS3KTJSjEcqoBEh7j/xoXt75RmyP4ft+Yiyq8A/LS1KmjpdTaaA351od07qCdAtQ5C/Gc9VDRioXVW4C0sAr4Tr7qrANd6pF9zCqeI1CbNYJP34aGMr3JaUZj89CHPa8AjTt7TXbxHwLhx+P4RvdimHJDNjRG1vgBS4J4wvkHzOv/uMtZq/1y8dSml/xBodaGGTYQn1Ax5LhUP19NtnpZQzwXzatgNQaQA/F/euzj16hWh7+67Tltuwce5w33jLofdrHXjQUVmbR6HVFgeLYGpyhw7y7/Z1aRbsk=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF127F5F7C65E642B19BDE983CF152BA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aba2be0e-c3d2-4090-4199-08d70d283374
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2019 15:37:40.8325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: paltsev@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2733
X-OriginatorOrg: synopsys.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SGkgTWFzYWhpcm8sDQoNCk9uIFNhdCwgMjAxOS0wNy0yMCBhdCAxMTo0MCArMDkwMCwgTWFzYWhp
cm8gWWFtYWRhIHdyb3RlOg0KPiBPbiBTYXQsIEp1bCAyMCwgMjAxOSBhdCA0OjI4IEFNIEV1Z2Vu
aXkgUGFsdHNldg0KPiA8RXVnZW5peS5QYWx0c2V2QHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+ID4g
QXMgb2YgdG9kYXkgd2UgYXJlIGFibGUgdG8gcGFzcyBjdXN0b20gZmxhZ3MgdG8gZHRjIGNvbXBp
bGVyIGJ1dCBub3QNCj4gPiB0byBkdGMgcHJlcHJvY2Vzc29yLg0KPiA+IFRoaXMgYWJpbGl0eSBp
cyByZXF1aXJlZCBmb3IgaW5jbHVkaW5nIHNvbWUgYm9hcmQtc3BlY2lmaWMgaGVhZGVyIGZpbGVz
Lg0KPiA+IEl0IGFsbG93cyB1cyB0byBwYXNzIGRlZmluZWQgY29uc3RhbnRzIHRvIGR0cyB3aXRo
b3V0IHRoZWlyIGR1cGxpY2F0aW9uDQo+ID4gaW4gc2V2ZXJhbCBwbGFjZXMuDQo+IA0KPiBIb3cg
dG8gdXNlIHRoaXMgb3B0aW9uIGluIGEgdXNlZnVsIHdheT8NCj4gDQo+IEkgc2VlIGEgYnVuY2gg
b2YgZGVmaW5lZCBjb25zdGFudHMgdW5kZXIgaW5jbHVkZS9kdC1iaW5kaW5ncy8uDQo+IA0KPiBJ
ZiB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgY29kZSBkdXBsaWNhdGlvbiBhY3Jvc3MgYXJjaGl0ZWN0
dXJlcywNCj4geW91IGNhbiBpbmNsdWRlIGFybSBkdHNpIGZyb20gYXJtNjQgZHRzLCBvciB2aWNl
IHZlcnNhLg0KPiBUaGlzIHdhcyBtYWRlIHBvc3NpYmxlIGJ5IHRoZSBzeW1ib2xpYyBsaW5rcw0K
PiBpbiBzY3JpcHRzL2R0Yy9pbmNsdWRlLXByZWZpeGVzLy4NCj4gDQo+IENvdWxkIHlvdSBwbGVh
c2UgZWxhYm9yYXRlIHlvdXIgaXNzdWVzIGlmIHlvdSBjYW5ub3Qgc29sdmUgdGhlbQ0KPiBieSB0
aGUgY3VycmVudCBzdHJhdGVneT8NCj4gDQoNCkhlcmUgaXMgdGhlIGV4YW1wbGU6DQoNCldlIGhh
dmUgc2V2ZXJhbCBGUEdBLWJhc2VkIGJvYXJkcyAoaGFwc19ocywgaGFwc19oc19pZHUsLi4uKSB3
aGljaCBhcmUgaW52b2x2ZWQNCmluIFNXIGFuZCBIVyBhdXRvbWF0ZWQgdmVyaWZpY2F0aW9uLiBG
b3Igc29tZSB0ZXN0cyB3ZSByYW5kb21pemUgcGh5c2ljYWwgbWVtb3J5DQpsb2NhdGlvbiBzbyB3
ZSBwYXRjaCAnQ09ORklHX0xJTlVYX1JBTV9CQVNFJyBrY29uZmlnIHZhcmlhYmxlIGFuZCAnbWVt
b3J5JyBub2RlIGluDQpkZXZpY2UgdHJlZS4gV2Ugd2FudCB0byBrZWVwIG51bWJlciBvZiBwYXRj
aGVzIGFzIGxlc3MgYXMgcG9zc2libGUgKHRvIGF2b2lkDQpjb25mbGljdHMgb24gdGhlaXIgYXBw
bHlpbmcpIHNvIHdlIHdhbnQgdG8gYXZvaWQgZHVwbGljYXRpb24gYW5kIHBhc3MNCidDT05GSUdf
TElOVVhfUkFNX0JBU0UnIGRpcmVjdGx5IHRvIGR0cyBieSBpbmNsdWRpbmcgaXQgZnJvbQ0KJ2lu
Y2x1ZGUvZ2VuZXJhdGVkL2F1dG9jb25mLmgnOg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQptZW1vcnkgew0KCWRl
dmljZV90eXBlID0gIm1lbW9yeSI7DQotCQkvKiBDT05GSUdfTElOVVhfUkFNX0JBU0UgbmVlZHMg
dG8gbWF0Y2ggbG93IG1lbSBzdGFydCAqLw0KLSAgICAgICAgICAgICAgIHJlZyA9IDwweDgwMDAw
MDAwIDB4MjAwMDAwMDA+OyAgLyogNTEyICovDQorICAgICAgICAgICAgICAgcmVnID0gPENPTkZJ
R19MSU5VWF9SQU1fQkFTRSAweDIwMDAwMDAwPjsgICAgICAvKiA1MTIgKi8NCn07DQotLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLT44LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tDQoNClRoaXMgcGF0Y2ggYWxsb3dzIHVzIHRvIGV4dGVuZCB0aGUgc2VhcmNoIHBhdGggb2Yg
aW5jbHVkZSBmaWxlcyB0bw0KaW5jbHVkZSAnaW5jbHVkZS9nZW5lcmF0ZWQvYXV0b2NvbmYuaCcu
DQoNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRXVnZW5peSBQYWx0c2V2IDxFdWdlbml5LlBhbHRz
ZXZAc3lub3BzeXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBzY3JpcHRzL01ha2VmaWxlLmxpYiB8IDIg
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLmxpYiBiL3NjcmlwdHMvTWFrZWZpbGUubGliDQo+ID4g
aW5kZXggZjFmMzhjOGNkYzc0Li5mMjU5NWE2MDhkY2UgMTAwNjQ0DQo+ID4gLS0tIGEvc2NyaXB0
cy9NYWtlZmlsZS5saWINCj4gPiArKysgYi9zY3JpcHRzL01ha2VmaWxlLmxpYg0KPiA+IEBAIC0x
NjYsNiArMTY2LDggQEAgZHRjX2NwcF9mbGFncyAgPSAtV3AsLU1ELCQoZGVwZmlsZSkucHJlLnRt
cCAtbm9zdGRpbmMgICAgICAgICAgICAgICAgICAgIFwNCj4gPiAgICAgICAgICAgICAgICAgICQo
YWRkcHJlZml4IC1JLCQoRFRDX0lOQ0xVREUpKSAgICAgICAgICAgICAgICAgICAgICAgICAgXA0K
PiA+ICAgICAgICAgICAgICAgICAgLXVuZGVmIC1EX19EVFNfXw0KPiA+IA0KPiA+ICtkdGNfY3Bw
X2ZsYWdzICArPSAkKERUQ19DUFBfRkxBR1NfJChiYXNldGFyZ2V0KSkNCj4gPiArDQo+ID4gICMg
VXNlZnVsIGZvciBkZXNjcmliaW5nIHRoZSBkZXBlbmRlbmN5IG9mIGNvbXBvc2l0ZSBvYmplY3Rz
DQo+ID4gICMgVXNhZ2U6DQo+ID4gICMgICAkKGNhbGwgbXVsdGlfZGVwZW5kLCBtdWx0aV91c2Vk
X3RhcmdldHMsIHN1ZmZpeF90b19yZW1vdmUsIHN1ZmZpeF90b19hZGQpDQo+ID4gLS0NCj4gPiAy
LjIxLjANCj4gPiANCj4gDQo+IA0KLS0gDQogRXVnZW5peSBQYWx0c2V2DQo=
