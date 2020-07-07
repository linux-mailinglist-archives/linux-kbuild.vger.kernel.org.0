Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3552E217264
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 17:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728330AbgGGPcc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 11:32:32 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:38806 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728575AbgGGPcb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 11:32:31 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 067F4rd4032272;
        Tue, 7 Jul 2020 08:31:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Rt3pjtAMisOfjkyw/WZQ5y38XlK/eNq4CnC25YiRRMg=;
 b=UgdcsmuHgH0383pPgUf6X575J+8x4MtlM4P1xdEfF78XbsMB6cQoHl5BCr9+0LjOZ0um
 jys5tr2+T0DV/LTZLtdyySGZvbL3NwHh25Gwt2UzpKIQgN6lk4GzVZ0yYbrVo+fTyMRf
 QYHMcT7Kokjf2sscqF3sC8RWuWWc7FREwf8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3239rs2bub-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 07 Jul 2020 08:31:50 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 7 Jul 2020 08:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meUyK8hTtjsKfkdtzskyujhKJ6oVllE8bCdBrsawEW4GXYxVYYqsvBE9GUoikf1DzUKydr1uBRb9CT6Qk/Zp1sNvgLbMtIJp1VTk8+C2W6qYuQBI6TbFnyEjMdPxnebQ9wFAxPlVP/ppuqC70xwDlyxlipDVJnC8Vy4dhdaBC1OuWMOUJi1gROm+AKoEsG8nmgfWv6VvuSJzKpAPJ6Mt2WZL9uUGpcK8P0vMLtpkrThirfBgfRl/J3Itgoq82EoGjw+ddDf6guiqmHxoCjApt4rg9vKBYV86RrWqCblp7TONghSahJXgo7ToueZO4way3RP1qDWUHG9iRv2tPGErsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt3pjtAMisOfjkyw/WZQ5y38XlK/eNq4CnC25YiRRMg=;
 b=WVkM3VA/fMwujTELFDL4U7Os/xDv1Ydl/uBLCSLRo6WoogHCMAVlRsdywMf/E7z7Tkr/WYQMrxjf3pTCpyAXLM4hSwvIgQvPJBVGI/Aev0EtuqJZzYKQ0tbYnjQYxIG1/yVSKKbSkocR4wLdMrOzo3diXD0l7z1L0ndogjJhrsDBgdypFGSn+SXD79A4P9T2FrBUjtNCCMG7UPhEZjGVKNmtwsjSwLnK2aPuJ9GKOrmI2oJ4/DDKML+oXCWBxLuxHDpIxOVApyRw9tcc/RNvQaYlrmlS3fHGViZybmTaaWn/4q/ccfRhEYhLA2Jo3ROs0CulfPxmOcM6PzS12DXmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt3pjtAMisOfjkyw/WZQ5y38XlK/eNq4CnC25YiRRMg=;
 b=SUBRN9EBKY/SqdpVBC9aOrWk816b6ZJUrmpXjMWue42R2/VvxNARuKcP8ofzPYc3Ep9GFV9eAcbwG5f9zgBFVISTvkYwQMnPId9M19spBzKgqrM0lpKXJO6R59aE9OvEoXLHCo9XP9kl0OyZgoHVy+dQiQMHSkS3xfnARZrVX9g=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3254.namprd15.prod.outlook.com (2603:10b6:a03:110::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Tue, 7 Jul
 2020 15:31:47 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::993d:262a:f163:ec9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::993d:262a:f163:ec9c%7]) with mapi id 15.20.3174.021; Tue, 7 Jul 2020
 15:31:47 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Norbert Lange <nolange79@gmail.com>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        "Michael van der Westhuizen" <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        "Patrick Williams" <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
Thread-Topic: [PATCH v6 4/8] init: add support for zstd compressed kernel
Thread-Index: AQHWVBHah0xsJt/cakyKnqlA4hkEhaj7tdSAgACJegA=
Date:   Tue, 7 Jul 2020 15:31:47 +0000
Message-ID: <3C253838-35BF-4B0D-AE19-E81B08B3A377@fb.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com>
 <CADYdroOfCsGsjid9aSOLoRf9gycc1iLD9JndH8WF+Rg+a5Gu-g@mail.gmail.com>
In-Reply-To: <CADYdroOfCsGsjid9aSOLoRf9gycc1iLD9JndH8WF+Rg+a5Gu-g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [47.26.145.163]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f166ce04-6f28-41c6-45ce-08d8228adcc5
x-ms-traffictypediagnostic: BYAPR15MB3254:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3254AD6ECEFCD27F50DAC95DAB660@BYAPR15MB3254.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0457F11EAF
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ulE1PcG2Qp2NC5BKutJGAod0CmZLiFw8rEO5bvY+n9fOQOrxToNQU7mPtAonx9RHweUJhQZjUBSKNY2VVYtMefbqPAGVvfnz7VpzA9PIC7kOqIWYFoX/lI1D6invQKjiz3lBMgDPn9zplGlfAgtJA0QofVx5Sk6VriLPuzOn98QLztC4qRjcS8CLIrqi7evRh+6h/3SLLEol5FUmaI0dTcmpwTznLd5xMg6SlLzXAuO464d2t2hdaXgFfe3rJ1hBvZdz44Zqm4GZdJN0/QzGMD8ev4U8RMXQmMHvg/IZBIDI3YXXkNxgWYfbtUbsAm5ZK9Rf87Wf+WgrlXOvmHt8Nw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(346002)(39860400002)(366004)(136003)(6916009)(5660300002)(8936002)(316002)(2616005)(66476007)(66446008)(64756008)(66946007)(36756003)(91956017)(86362001)(66556008)(76116006)(53546011)(6486002)(186003)(71200400001)(8676002)(2906002)(6512007)(54906003)(478600001)(83380400001)(6506007)(33656002)(4326008)(7416002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: x7fUgCqM/xLKqUBSfwpwazKGkMgot1J3t9N/YJL5k/OCKr3byXCY7sNArotvCWN3psCiCwXH8kJ/7ie7g0tyuSU8cOIt2UMrSkGGbStsFVQicwcGyRIvvE1qtovg1XgNz560eG2jQSOcdeGYBxTOXrgVbMoWTamWCLWMKhxjcKwmPaC2jrRsPjug5WlL7PCIilP0kyEclbqenA+KAGcXD6wU7aAWD676FO2C28iyZoigKIBgFS31tZHuO2bfQ0A0vccvXgvJ65TFuTmxQcoZcikWJd8fcdaQGEOMtMlsnZVrTv0/RK7wLxZFQ7W00FTCthVNgfONc+0oR2sH5CMlr8azLH6vhviU6bSZyswapN5kbYhsPd4/zI/RCaL9ASGPaFlXCOJrI1hcYHlwqsaLO9UL32agbo5mxnPOxrk+EsgP6/fudMK5qr6PKKDczb9fiJqkrB685iafHr0pX30XZCI7dhe9N8+2vIj0+KIXj/k=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC35105E87ADE94D8AAE6676A617C96D@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f166ce04-6f28-41c6-45ce-08d8228adcc5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2020 15:31:47.5283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o80TtN5uhdLJ24z8eobWp5y4Yydbud5zj2kFVyH9gs/JfoOfcdV/86lWuoRpdxcy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3254
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-07_08:2020-07-07,2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0
 malwarescore=0 cotscore=-2147483648 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007070113
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gSnVsIDcsIDIwMjAsIGF0IDM6MTkgQU0sIE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3
OUBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmVzcGluLg0KPiANCj4g
QW0gRGkuLCA3LiBKdWxpIDIwMjAgdW0gMDU6NTEgVWhyIHNjaHJpZWIgTmljayBUZXJyZWxsIDxu
aWNrcnRlcnJlbGxAZ21haWwuY29tPjoNCj4+IA0KPj4gRnJvbTogTmljayBUZXJyZWxsIDx0ZXJy
ZWxsbkBmYi5jb20+DQo+PiANCj4+ICogQWRkcyB0aGUgenN0ZCBjbWQgdG8gc2NyaXB0cy9NYWtl
ZmlsZS5saWINCj4+ICogQWRkcyB0aGUgSEFWRV9LRVJORUxfWlNURCBhbmQgS0VSTkVMX1pTVEQg
b3B0aW9ucw0KPj4gDQo+PiBBcmNoaXRlY3R1cmUgc3BlY2lmaWMgc3VwcG9ydCBpcyBzdGlsbCBu
ZWVkZWQgZm9yIGRlY29tcHJlc3Npb24uDQo+PiANCj4+IFJldmlld2VkLWJ5OiBLZWVzIENvb2sg
PGtlZXNjb29rQGNocm9taXVtLm9yZz4NCj4+IFRlc3RlZC1ieTogU2VkYXQgRGlsZWsgPHNlZGF0
LmRpbGVrQGdtYWlsLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgVGVycmVsbCA8dGVycmVs
bG5AZmIuY29tPg0KPj4gLS0tDQo+PiBpbml0L0tjb25maWcgICAgICAgICB8IDE1ICsrKysrKysr
KysrKysrLQ0KPj4gc2NyaXB0cy9NYWtlZmlsZS5saWIgfCAxNSArKysrKysrKysrKysrKysNCj4+
IDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+
PiBkaWZmIC0tZ2l0IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29uZmlnDQo+PiBpbmRleCAwNDk4
YWY1NjdmNzAuLjhkOTlmMGM1ZTI0MCAxMDA2NDQNCj4+IC0tLSBhL2luaXQvS2NvbmZpZw0KPj4g
KysrIGIvaW5pdC9LY29uZmlnDQo+PiBAQCAtMTkxLDEzICsxOTEsMTYgQEAgY29uZmlnIEhBVkVf
S0VSTkVMX0xaTw0KPj4gY29uZmlnIEhBVkVfS0VSTkVMX0xaNA0KPj4gICAgICAgIGJvb2wNCj4+
IA0KPj4gK2NvbmZpZyBIQVZFX0tFUk5FTF9aU1REDQo+PiArICAgICAgIGJvb2wNCj4+ICsNCj4+
IGNvbmZpZyBIQVZFX0tFUk5FTF9VTkNPTVBSRVNTRUQNCj4+ICAgICAgICBib29sDQo+PiANCj4+
IGNob2ljZQ0KPj4gICAgICAgIHByb21wdCAiS2VybmVsIGNvbXByZXNzaW9uIG1vZGUiDQo+PiAg
ICAgICAgZGVmYXVsdCBLRVJORUxfR1pJUA0KPj4gLSAgICAgICBkZXBlbmRzIG9uIEhBVkVfS0VS
TkVMX0daSVAgfHwgSEFWRV9LRVJORUxfQlpJUDIgfHwgSEFWRV9LRVJORUxfTFpNQSB8fCBIQVZF
X0tFUk5FTF9YWiB8fCBIQVZFX0tFUk5FTF9MWk8gfHwgSEFWRV9LRVJORUxfTFo0IHx8IEhBVkVf
S0VSTkVMX1VOQ09NUFJFU1NFRA0KPj4gKyAgICAgICBkZXBlbmRzIG9uIEhBVkVfS0VSTkVMX0da
SVAgfHwgSEFWRV9LRVJORUxfQlpJUDIgfHwgSEFWRV9LRVJORUxfTFpNQSB8fCBIQVZFX0tFUk5F
TF9YWiB8fCBIQVZFX0tFUk5FTF9MWk8gfHwgSEFWRV9LRVJORUxfTFo0IHx8IEhBVkVfS0VSTkVM
X1pTVEQgfHwgSEFWRV9LRVJORUxfVU5DT01QUkVTU0VEDQo+PiAgICAgICAgaGVscA0KPj4gICAg
ICAgICAgVGhlIGxpbnV4IGtlcm5lbCBpcyBhIGtpbmQgb2Ygc2VsZi1leHRyYWN0aW5nIGV4ZWN1
dGFibGUuDQo+PiAgICAgICAgICBTZXZlcmFsIGNvbXByZXNzaW9uIGFsZ29yaXRobXMgYXJlIGF2
YWlsYWJsZSwgd2hpY2ggZGlmZmVyDQo+PiBAQCAtMjc2LDYgKzI3OSwxNiBAQCBjb25maWcgS0VS
TkVMX0xaNA0KPj4gICAgICAgICAgaXMgYWJvdXQgOCUgYmlnZ2VyIHRoYW4gTFpPLiBCdXQgdGhl
IGRlY29tcHJlc3Npb24gc3BlZWQgaXMNCj4+ICAgICAgICAgIGZhc3RlciB0aGFuIExaTy4NCj4+
IA0KPj4gK2NvbmZpZyBLRVJORUxfWlNURA0KPj4gKyAgICAgICBib29sICJaU1REIg0KPj4gKyAg
ICAgICBkZXBlbmRzIG9uIEhBVkVfS0VSTkVMX1pTVEQNCj4+ICsgICAgICAgaGVscA0KPj4gKyAg
ICAgICAgIFpTVEQgaXMgYSBjb21wcmVzc2lvbiBhbGdvcml0aG0gdGFyZ2V0aW5nIGludGVybWVk
aWF0ZSBjb21wcmVzc2lvbg0KPj4gKyAgICAgICAgIHdpdGggZmFzdCBkZWNvbXByZXNzaW9uIHNw
ZWVkLiBJdCB3aWxsIGNvbXByZXNzIGJldHRlciB0aGFuIEdaSVAgYW5kDQo+PiArICAgICAgICAg
ZGVjb21wcmVzcyBhcm91bmQgdGhlIHNhbWUgc3BlZWQgYXMgTFpPLCBidXQgc2xvd2VyIHRoYW4g
TFo0LiBZb3UNCj4+ICsgICAgICAgICB3aWxsIG5lZWQgYXQgbGVhc3QgMTkyIEtCIFJBTSBvciBt
b3JlIGZvciBib290aW5nLiBUaGUgenN0ZCBjb21tYW5kDQo+PiArICAgICAgICAgbGluZSB0b29s
cyBpcyByZXF1aXJlZCBmb3IgY29tcHJlc3Npb24uDQo+PiArDQo+PiBjb25maWcgS0VSTkVMX1VO
Q09NUFJFU1NFRA0KPj4gICAgICAgIGJvb2wgIk5vbmUiDQo+PiAgICAgICAgZGVwZW5kcyBvbiBI
QVZFX0tFUk5FTF9VTkNPTVBSRVNTRUQNCj4+IGRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxl
LmxpYiBiL3NjcmlwdHMvTWFrZWZpbGUubGliDQo+PiBpbmRleCA5MTZiMmY3ZjcwOTguLmQ5NjBm
ODgxNWY4NyAxMDA2NDQNCj4+IC0tLSBhL3NjcmlwdHMvTWFrZWZpbGUubGliDQo+PiArKysgYi9z
Y3JpcHRzL01ha2VmaWxlLmxpYg0KPj4gQEAgLTQxMyw2ICs0MTMsMjEgQEAgcXVpZXRfY21kX3h6
a2VybiA9IFhaS0VSTiAgJEANCj4+IHF1aWV0X2NtZF94em1pc2MgPSBYWk1JU0MgICRADQo+PiAg
ICAgICBjbWRfeHptaXNjID0gY2F0ICQocmVhbC1wcmVyZXFzKSB8ICQoWFopIC0tY2hlY2s9Y3Jj
MzIgLS1sem1hMj1kaWN0PTFNaUIgPiAkQA0KPj4gDQo+PiArIyBaU1REDQo+PiArIyAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCj4+ICsjIEFwcGVuZHMgdGhlIHVuY29tcHJlc3NlZCBzaXplIG9mIHRoZSBk
YXRhIHVzaW5nIHNpemVfYXBwZW5kLiBUaGUgLnpzdA0KPj4gKyMgZm9ybWF0IGhhcyB0aGUgc2l6
ZSBpbmZvcm1hdGlvbiBhdmFpbGFibGUgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZmlsZSB0b28s
DQo+PiArIyBidXQgaXQncyBpbiBhIG1vcmUgY29tcGxleCBmb3JtYXQgYW5kIGl0J3MgZ29vZCB0
byBhdm9pZCBjaGFuZ2luZyB0aGUgcGFydA0KPj4gKyMgb2YgdGhlIGJvb3QgY29kZSB0aGF0IHJl
YWRzIHRoZSB1bmNvbXByZXNzZWQgc2l6ZS4NCj4+ICsjIE5vdGUgdGhhdCB0aGUgYnl0ZXMgYWRk
ZWQgYnkgc2l6ZV9hcHBlbmQgd2lsbCBtYWtlIHRoZSB6c3RkIHRvb2wgdGhpbmsgdGhhdA0KPj4g
KyMgdGhlIGZpbGUgaXMgY29ycnVwdC4gVGhpcyBpcyBleHBlY3RlZC4NCj4+ICsNCj4+ICtxdWll
dF9jbWRfenN0ZCA9IFpTVEQgICAgJEANCj4+ICtjbWRfenN0ZCA9IChjYXQgJChmaWx0ZXItb3V0
IEZPUkNFLCReKSB8IFwNCj4+ICsgICAgICAgenN0ZCAtMTkgJiYgXA0KPj4gKyAgICAgICAgJChj
YWxsIHNpemVfYXBwZW5kLCAkKGZpbHRlci1vdXQgRk9SQ0UsJF4pKSkgPiAkQCB8fCBcDQo+PiAr
ICAgICAgIChybSAtZiAkQCA7IGZhbHNlKQ0KPiANCj4gSXMgdGhlcmUgYW55IHJlYXNvbiBub3Qg
dG8gdXNlICctLXVsdHJhIC0yMicgPw0KPiBBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBvdGhl
ciBwYXRjaGVzLCB0aGUgZGVjb21wcmVzc2lvbiBzaG91bGQgYmUNCj4gYWJsZSB0byBoYW5kbGUg
aXQsDQo+IGFuZCBpbiB0ZXJtcyBvZiB0aW1lIHJlcXVpcmVkIGZvciBhIGtlcm5lbCBidWlsZCB0
aGUgZGlmZmVyZW5jZSBpcw0KPiBpbnNpZ25pZmljYW50Lg0KDQpGb3Iga2VybmVsIGNvbXByZXNz
aW9uIHRoZXJlIGlzbuKAmXQgYSBzdHJvbmcgcmVhc29uIG5vdCB0byB1c2UgYC0tdWx0cmEgLTIy
YC4NCkl0IG1heSBzbG93IGRvd24gZGVjb21wcmVzc2lvbiBhIHNtYWxsIGFtb3VudCwgYmVjYXVz
ZSB0aGUgZGlmZmVyZW5jZQ0KaXMgdGhhdCBpdCBoYXMgYSAxMjggTUIgd2luZG93IHNpemUgaW5z
dGVhZCBvZiBhIDggTUIgd2luZG93IHNpemUuDQoNCkhvd2V2ZXIsIHRoYXQgcHJvYmFibHkgaXNu
4oCZdCB3YW50IHlvdSB3YW50IGZvciBpbml0cmFtZnMgY29tcHJlc3Npb24sDQp3aGljaCBjYW4g
b3B0aW9uYWxseSBub3cgdXNlIHRoaXMgc2FtZSBjb21tYW5kLiBXZSBjb3VsZCBnbyBsaWtlIHh6
DQphbmQgaGF2ZSBib3RoIGNtZF96c3RkbWlzYyBhbmQgY21kX3pzdGRrZXJuLCBhbmQgb25seSB1
c2UgYC0yMmAgZm9yIHRoZQ0Ka2VybmVsIHZlcnNpb24uDQoNCkl0IGFsc28gbG9va3MgbGlrZSB0
aGVyZSB3ZXJlIGEgZmV3IG1pbm9yIGNoYW5nZXMgbWFkZSB0byB0aGUgb3RoZXINCmNvbXByZXNz
IGNtZHMgaW4gdGhpcyBmaWxlIHdoaWxlIHRoZXNlIHBhdGNoZXMgaGF2ZSBiZWVuIG91dCwgc28g
SSB3aWxsIGFwcGx5DQp0aGVtIHRvIHpzdGQgYXMgd2VsbC4NCg0KSeKAmWxsIHN1Ym1pdCBhIG5l
dyB2ZXJzaW9uIHdpdGggdGhlc2UgY2hhbmdlcyB0b2RheS4NCg0KPiBBbmQgd291bGQgaXQgYmUg
YmV0dGVyIHRvIHJ1biB6c3RkIG9uIGEgcHJlcGFyZWQgZmlsZSBpbnN0ZWFkIG9mDQo+IHN0cmVh
bSBlbmNvbmRpbmc/DQo+IHdpbmRvd3NpemUgd291bGQgYmUgYWRqdXN0ZWQgdG8gbWluKHdpbmRv
d3NpemUsIGZpbGVzaXplKSBmb3Igb25lLg0KDQpZZWFoLCB0aGF0IHdvdWxkIGJlIGhlbHBmdWwg
Zm9yIGluaXRyYW1mcyBjb21wcmVzc2lvbiB3aGVuIHRoZSBmaWxlIGlzDQpzbWFsbGVyIHRoYW4g
dGhlIHdpbmRvdyBzaXplLCBzaW5jZSBpdCB3b3VsZCBsaW1pdCB0aGUgbWVtb3J5IG5lY2Vzc2Fy
eQ0KRm9yIGRlY29tcHJlc3Npb24uIEJ1dCwgaXQgd291bGRu4oCZdCBoZWxwIGtlcm5lbCBjb21w
cmVzc2lvbi4NCg0KRm9yIHRoYXQgd2XigJlkIGhhdmUgdG8gY3JlYXRlIGEgdGVtcG9yYXJ5IGZp
bGUsIGJlY2F1c2UgaXQgbG9va3MgbGlrZSB0aGVzZQ0KY29tbWFuZHMgcG90ZW50aWFsbHkgYWNj
ZXB0IG1vcmUgdGhhbiBvbmUgaW5wdXQgZmlsZS4gRG8geW91IGtub3cgdGhlDQpzdGFuZGFyZCBw
cmFjdGljZSBmb3IgdGVtcG9yYXJ5IGZpbGVzIGluIHRoZSBidWlsZCBzeXN0ZW0/DQoNClRoYW5r
cyBmb3IgdGhlIHJldmlldywNCk5pY2s=
