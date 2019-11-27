Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2525610B1D8
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2019 16:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK0PFl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Nov 2019 10:05:41 -0500
Received: from mail-eopbgr80120.outbound.protection.outlook.com ([40.107.8.120]:28737
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726537AbfK0PFl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Nov 2019 10:05:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1VoGfZQj1BVFUcPssE+E67fFm0WJ1wHnmsdFxfzp0vHp8TPBK2deChTHjXdBuVELrw+W5Lqgwdu0emd0anpoMX3e36YfzUf3cw0D07VGUcS6qyLLdGqfL2QulF7oTKAgleqcsBw8R+vk2gFS5mVI56RPMRrDgueD1oeILSArvxj+oNhtqvTCfsz1wHETA9NVaG5rr+v+LUYr9MsDLlhjvK0KcQHDfO5+R4HB2NpdYoHQRiGytw284ln1/lRYIVkqx6HzKiQHzk14htl3KRYXDL3CiyXikTvUQ5Oy9cMaOazui6NkJ3e3oSga6d44Wyj5kmQnwg5jCegfnsjEvC89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO2CyQOtMn9k3n0/fs4YTzSJKxkt/CcT3V/vchlJym4=;
 b=bNkK8foM3+e3Kz3mP/AFqzMTZTA/NMABuX1g+rJDKfpcADzRzIao/xcmqE7ZEYqrofq3tWl/81S2K/PNB7t1n65Bb8Q3sMMlb9gOIwuQjXCn7u8YGzuyxu6I3pf9WmCsEsTI8SBVUzjVtQjJzuz5Yz7dyPLbyNWiZAmAUvMgfOG9P9t9XxpkG4h4COobwge9zL+qsjVwH6dggIzfVIlp9N7sc56khbb77kk6nLmyfYTSSyNZy+RyI4925aMdn8X8De3MrK+YR3krUmcT6abm66ljzb7Dk1Xm5k70SWUOGMtMPAaGajep6rs8JiTZMysJG9ch8U+VKuTUC6CEfzsN+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criteo.com; dmarc=pass action=none header.from=criteo.com;
 dkim=pass header.d=criteo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criteo.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bO2CyQOtMn9k3n0/fs4YTzSJKxkt/CcT3V/vchlJym4=;
 b=Ro2z5Cuy/JaLbZsuzf4bDLbAwtdXNBjkysyl2glaZK+eiNi2cYmh9/jFSNgG+rtXA1Z/2wUTs1nYeZlUCoyX1I526YWn4UXSxBQKJe1SO66We1FRkBAjuRUClyw9aPPqmJ3rsd4AA0AtCvGrkrojlpcI4lH8fUvvB3EBCXXdnEM=
Received: from AM6PR04MB4918.eurprd04.prod.outlook.com (20.177.33.157) by
 AM6PR04MB4775.eurprd04.prod.outlook.com (20.177.32.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 27 Nov 2019 15:05:37 +0000
Received: from AM6PR04MB4918.eurprd04.prod.outlook.com
 ([fe80::5c98:951f:588a:ab5a]) by AM6PR04MB4918.eurprd04.prod.outlook.com
 ([fe80::5c98:951f:588a:ab5a%7]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 15:05:37 +0000
From:   Erwan Velu <e.velu@criteo.com>
To:     Jean Delvare <jdelvare@suse.de>,
        Erwan Velu <erwanaliasr1@gmail.com>
CC:     "Robert P. J. Day" <rpjday@crashcourse.ca>,
        "David S. Miller" <davem@davemloft.net>,
        Changbin Du <changbin.du@intel.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] firmware/dmi: Report DMI Bios release
Thread-Topic: [PATCH 2/3] firmware/dmi: Report DMI Bios release
Thread-Index: AQHVbgW0/JEk553yuUqUo8yFqG5pSadlYoSAgDopOAA=
Date:   Wed, 27 Nov 2019 15:05:37 +0000
Message-ID: <5781c7dd-c19d-7664-4022-6e86e405f0f5@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
 <20190918094323.17515-2-e.velu@criteo.com> <20191021165321.60be88cd@endymion>
In-Reply-To: <20191021165321.60be88cd@endymion>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0347.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::23) To AM6PR04MB4918.eurprd04.prod.outlook.com
 (2603:10a6:20b:6::29)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=e.velu@criteo.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.242.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d04a40f1-ca2b-4694-1e27-08d7734b4284
x-ms-traffictypediagnostic: AM6PR04MB4775:
x-microsoft-antispam-prvs: <AM6PR04MB47758B0CDDFDF481FB60120BF2440@AM6PR04MB4775.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(199004)(189003)(51914003)(3846002)(71190400001)(71200400001)(6436002)(102836004)(6486002)(81156014)(229853002)(81166006)(25786009)(5660300002)(31696002)(8676002)(86362001)(52116002)(478600001)(8936002)(305945005)(76176011)(7736002)(256004)(6512007)(6116002)(386003)(6506007)(53546011)(4744005)(2906002)(186003)(54906003)(66446008)(64756008)(66556008)(66476007)(4326008)(66946007)(2616005)(14454004)(110136005)(11346002)(6246003)(31686004)(7416002)(316002)(446003)(99286004)(26005)(66066001)(36756003);DIR:OUT;SFP:1102;SCL:1;SRVR:AM6PR04MB4775;H:AM6PR04MB4918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: criteo.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jfaYIPQWpf1Qw2R6XJRwNr4qt5PstY9k5kuG6bNwboQqhOCHsd/mF25HbHPV47qGO6ZQ76+7oiUdZg4oYt/97YkoeQOqA3HoOg9KrjoCcTnUiThaXl8qutsRFw2qEJ/sag9lW5kEs6Jj0zp7ytg6vvOctl5rPqk0kzeg9QMfZ0E7xP718LFr6SOALrTF7kNQzF/OGmTwkwbHXSw9q5FUhB5gcJY4g2aQTGmryt0mg5nkJqd9/UKkZ/2QW842PL9ddCra7rIQrI+YY5AnF5mzBW4gDdRAjuViD21TeRWT2vtqGKcdzidhl09rPfkaALCcvJx6xNx4OUPY/DLVWN0924RlkafLoIT3WMpRIu60RfcN4x4xsVvg/ZUMfgq/72ruOsRZN4e6yAO/0k43o4zqEZoIVr6/PVV/Dafp9uV9GYySda+Pmz+OlgTNDNz1A7dl
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF7B0D68FB12AD41A57EF625DCA0634A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: criteo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04a40f1-ca2b-4694-1e27-08d7734b4284
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 15:05:37.3419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2a35d8fd-574d-48e3-927c-8c398e225a01
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 498vujkgf3shQuXyb6mqdcYEvaMfrOty8YXwmUkraoKiGEAE+rpbJUaRzCGfNAU3IzZcLPZ9y3y9dPHmak1N6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4775
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

T24gMjEvMTAvMjAxOSAxNjo1MywgSmVhbiBEZWx2YXJlIHdyb3RlOg0KPiBUaGlzIHdvdWxkIGFs
c28gYmUgaW4gbGluZSB3aXRoIGhvdyBpdCB3YXMgaW1wbGVtZW50ZWQgaW4gZG1pZGVjb2RlLiBJ
cw0KPiB0aGVyZSBhbnkgcmVhc29uIHRvIE5PVCBnbyB0aGF0IHJvdXRlPw0KDQpUaGUgbWFpbiBy
ZWFzb24gd2FzIEkgdGhvdWdoIGl0IHdvdWxkIGJlIGVhc2llciB0byBjb21wYXJlIHJlbGVhc2Vz
IGJ5IA0Kc3BsaXR0aW5nIG1ham9yICYgbWlub3IuDQoNClRoYXQgaXMgcHJvYmFibHkgb3Zlcmtp
bGwsIHNvIEknbGwgc3RpY2sgdG8gdGhlIHVzdWFsIHdheSB0byByZXByZXNlbnQgYSANCnJlbGVh
c2UgaW4gVjIuDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldywNCg0KRXJ3YW4sDQoNCg==
