Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A21926954C
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 21:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgINTMt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 15:12:49 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:21534 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725951AbgINTMq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 15:12:46 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08EJ9eMh029619;
        Mon, 14 Sep 2020 12:12:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=8p2GSGeYhIMJwp9yx6OcaWrEUp1KrWgWtJRbezC6TdE=;
 b=Kefdl2HwwMHZN6NK9vIykkjn3K4UTLIMx25qbgCWIaIXtUCRpsLa9Sp7C3uj1vlX+jVx
 F+bCsdPBJQeDprIrUIEHVOdQSPBwGDnip9mgjAKDIcEBVrJxlnYQ2ZAUqARnUdl7pkGz
 OEkpPqihfH0i3q9ylpIs3izWSvzNyjyv4hw= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0089730.ppops.net with ESMTP id 33gstxttjp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 14 Sep 2020 12:12:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 14 Sep 2020 12:12:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpI/AuQxwcZVcFw1a0i6A1t1rfop0w0QNJaMuX7XNiYciYY+tZtoR8QSUXjwhzDuJnF/Y8i4UXbIPXy3cO7w8DdFQHYo+gvicHY9bjQp37t0Rznw0UAyxX9lUXA5oczMLzAG6g13s9E42ArqFsH0D4+gKAP5Ng0VOeTA+FRGlYZEKgdz8aTeGoepX3GDNG1d4P2wkbf6yw7YLSJHY+XgKV2SlJAPVQf4pEGeKHKYp70NYmgRpFeoZdN6fewi6TANKZPA+UET1MAea5MwpDai86sd/7P+ZyQhlCXD0yWCbsXiivOAzhTu5B4b9cnMavbd14irfDbP16sumL/EWlXBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p2GSGeYhIMJwp9yx6OcaWrEUp1KrWgWtJRbezC6TdE=;
 b=OLs3mJLmQCsbjbpW94RYeUDXDm3IsLIeyxEu3YyhfxWljFKoDPTYNTF5M5PpFlRpZfC7oxKF7oN07STSYLd190CLAWMYWNrLwre4tYH6ggmK8poKO41gzUGYutytMrNP/qoK9DiYrtBJbdieQOkFXiMR5GRKUKChLsovdmfOsSJZM5sBF/K13sUFqPFkIsfENA560+2Tsc92vY58SWeKGO6hcw2OQVjw2JjP9N+O4AQP2gDvvzbvpp7j7OJveFzjlaUVjyelj3kCTad5WtqaRt59yVIe+KaQeSYC5Q6m1GGh/q4+3utAY9lPKT2S6pOicWjVaqaVK5ci9Sd7uPdW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8p2GSGeYhIMJwp9yx6OcaWrEUp1KrWgWtJRbezC6TdE=;
 b=i8usebn5b3epGGYiNO6qfY99CnuEriIEHW+LO560cFDjNhemxyzwP9eghqo4hj2hkO2YVuk8SbwLYxPk/hTcHj8v0lmpQklIQeLveWQqFJLgO+HaknIBfiGeUOd8W90ATMHj9S8jYOgYxExOSPWK2rK7sjDX5GtEZEBgWJ62Gf0=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2774.namprd15.prod.outlook.com (2603:10b6:a03:15d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 19:12:28 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 19:12:28 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Ben Hutchings <ben@decadent.org.uk>
CC:     "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
        "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>
Subject: Re: vmlinux link failure on ia64 with zstd
Thread-Topic: vmlinux link failure on ia64 with zstd
Thread-Index: AQHWigdFs5Gu/R5JIkizCKuPIzSd4KlogeoA
Date:   Mon, 14 Sep 2020 19:12:28 +0000
Message-ID: <6A76267A-6B60-4428-94DF-E05706EB85FB@fb.com>
References: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk>
In-Reply-To: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: decadent.org.uk; dkim=none (message not signed)
 header.d=none;decadent.org.uk; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:83bf]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c767fc87-5cd2-43b5-9537-08d858e21fa9
x-ms-traffictypediagnostic: BYAPR15MB2774:
x-microsoft-antispam-prvs: <BYAPR15MB2774A8C0E9E5785241C581CAAB230@BYAPR15MB2774.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:644;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gtESJTPIl+vru51BfCjFt7zmysexWGref8VTG40TuWYA4kZAEp2trVnVE5/u3KoRBfUD7ynTOuLDm3s9h1aHV9PBhFYYSnYe8JRrbkf15a15FBTPtQFACQo8oCL+FfFBc2ZubmNA73t16DyDE9gE2YvgjvA9EaEmUicI0WAfcPYQ91lcaDul1kK9rkoq3eEYXTWmySqMM6cz3KPYsnDeuQOnYoM3GMwjLbzktxeKYojGz1kRkUCALZQ4G1NwA6tpJIJjOmFbePCuQA7NcJAHYhyYh6cn+SYcFoHPchbumfyjcgzpSG728K+e/cCNAkvRV6PUczRsTGMwXsVJmQobdXE1NMFOTLB227l9H/ylnQUYqSRhi/yv9LMGGsATbH9LOLNQ16Exk/Gxa4tK9L6IZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(396003)(136003)(346002)(83380400001)(53546011)(36756003)(8676002)(6916009)(6512007)(6506007)(5660300002)(966005)(16799955002)(2906002)(66946007)(71200400001)(33656002)(66446008)(54906003)(66556008)(64756008)(186003)(2616005)(4326008)(91956017)(76116006)(66476007)(86362001)(6486002)(8936002)(316002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: VpF5M8jQMHKAHMOCt0X9Iy8JV7WjVEXDO5tLWJkM+oOgdsYaAvFPoH4qP1Gu5abfncDnqzlDzavskNPEQsxWHZ+gns4FxpFIGB4RdjigLqdl7AqTUigQ+NDmwSyCtYLEnW7SXQzJ0jMvhq5kGXSx6ah1D8czfyOOboMmwzJdtcdJb5MJZijZRggFCZZpv1W8MtycJv2inHXNiTJqfcbE0YY4UeYrfgr96+oM0KXndVA6Oqh+xYyqSuKqUX4UTA6GMRTy/4XBTJfoXv6f8sNoGWgEUSXoAchDjOzjPmREV3yGv8Xheab21Zsc5gfjUrQME4xlisqa+RbosFVGLD5Y/+IBAE5JPBt00EQg3frjFXCEWciyjBvY6BfacinCW28rWBlNYpLRXcDqYQL2ddKHrhaXtwmYya3WYXnaUrd0tmDWLUMhBfkvIiFpdwBMobD4TsP/serT6NnHNrspuqQ2KayRj97fnmvkJWxYc3qzKug6RqDPxg/DbXrZTqgveFTl3A+m8+6F56ZQ1HkmeHOLrI+ripw94cW/p+Wtdx0YPzUTvUwnUKvNHOwzHI993Njl7QHXXQvsmW4gJ6RIRL4GD7EeJr0xqbJCmi7g7FSFaA6DBXxVtctVAJ7UKcDximodmsEnqXChEOzbjsdP5irELaubXNfz8M6x0w/As78PZjX/S0rtKkAZia0N1BU5s3tf
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F2A9DF5059E0F40B7FB4D4CEBF47D90@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c767fc87-5cd2-43b5-9537-08d858e21fa9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 19:12:28.8816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3hfqTcVjg7ZCZQ9x++kYlr9Ch6TNoVV9xbztFpLG/l1gbI0dibp7PS0/wK/F2YY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2774
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-14_07:2020-09-14,2020-09-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 spamscore=0 clxscore=1011
 malwarescore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009140149
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gU2VwIDEzLCAyMDIwLCBhdCAxMjo1MSBQTSwgQmVuIEh1dGNoaW5ncyA8YmVuQGRl
Y2FkZW50Lm9yZy51az4gd3JvdGU6DQo+IA0KPiBFbmFibGluZyBDT05GSUdfUkRfWlNURCAod2hp
Y2ggaXMgZW5hYmxlZCBieSBkZWZhdWx0KSByZXN1bHRlZCBpbiBhDQo+IGxpbmsgZmFpbHVyZSBv
biBpYTY0Og0KPiANCj4gKyBsZCAtciAtbyB2bWxpbnV4Lm8gLS13aG9sZS1hcmNoaXZlIGFyY2gv
aWE2NC9rZXJuZWwvaGVhZC5vIGluaXQvYnVpbHQtaW4uYSB1c3IvYnVpbHQtaW4uYSBhcmNoL2lh
NjQva2VybmVsL2J1aWx0LWluLmEgYXJjaC9pYTY0L21tL2J1aWx0LWluLmEga2VybmVsL2J1aWx0
LWluLmEgY2VydHMvYnVpbHQtaW4uYSBtbS9idWlsdC1pbi5hIGZzL2J1aWx0LWluLmEgaXBjL2J1
aWx0LWluLmEgc2VjdXJpdHkvYnVpbHQtaW4uYSBjcnlwdG8vYnVpbHQtaW4uYSBibG9jay9idWls
dC1pbi5hIGxpYi9idWlsdC1pbi5hIGFyY2gvaWE2NC9saWIvYnVpbHQtaW4uYSBsaWIvbGliLmEg
YXJjaC9pYTY0L2xpYi9saWIuYSBkcml2ZXJzL2J1aWx0LWluLmEgc291bmQvYnVpbHQtaW4uYSBu
ZXQvYnVpbHQtaW4uYSB2aXJ0L2J1aWx0LWluLmEgYXJjaC9pYTY0L3BjaS9idWlsdC1pbi5hIGFy
Y2gvaWE2NC9ocC9jb21tb24vYnVpbHQtaW4uYSAtLW5vLXdob2xlLWFyY2hpdmUgLS1zdGFydC1n
cm91cCAtLWVuZC1ncm91cA0KPiBsZDogbGliL3pzdGQvZW50cm9weV9jb21tb24ubzogbGlua2lu
ZyBjb25zdGFudC1ncCBmaWxlcyB3aXRoIG5vbi1jb25zdGFudC1ncCBmaWxlcw0KPiBsZDogZmFp
bGVkIHRvIG1lcmdlIHRhcmdldCBzcGVjaWZpYyBkYXRhIG9mIGZpbGUgbGliL3pzdGQvZW50cm9w
eV9jb21tb24ubw0KPiBsZDogbGliL3pzdGQvZnNlX2RlY29tcHJlc3MubzogbGlua2luZyBjb25z
dGFudC1ncCBmaWxlcyB3aXRoIG5vbi1jb25zdGFudC1ncCBmaWxlcw0KPiBsZDogZmFpbGVkIHRv
IG1lcmdlIHRhcmdldCBzcGVjaWZpYyBkYXRhIG9mIGZpbGUgbGliL3pzdGQvZnNlX2RlY29tcHJl
c3Mubw0KPiBsZDogbGliL3pzdGQvenN0ZF9jb21tb24ubzogbGlua2luZyBjb25zdGFudC1ncCBm
aWxlcyB3aXRoIG5vbi1jb25zdGFudC1ncCBmaWxlcw0KPiBsZDogZmFpbGVkIHRvIG1lcmdlIHRh
cmdldCBzcGVjaWZpYyBkYXRhIG9mIGZpbGUgbGliL3pzdGQvenN0ZF9jb21tb24ubw0KDQpJ4oCZ
dmUgbmV2ZXIgc2VlbiBhbnl0aGluZyBsaWtlIHRoaXMgZXJyb3IgYmVmb3JlLiBJIGRpZCBzb21l
IHNlYXJjaGluZywgYW5kIGZvdW5kIHRoYXQgaXQgbWF5IHNob3cgdXAgaWYgYW4gb2JqZWN0IGZp
bGUgaXMgZW1wdHkuDQoNClRoZXNlIHRocmVlIGZpbGVzIGFyZSBhbGwgaW5jbHVkZWQgaW4gYm90
aCB0aGUgenN0ZF9jb21wcmVzcyBhbmQgdGhlIHpzdGRfZGVjb21wcmVzcyBtb2R1bGVzLiBXZSB1
c2VkIHRvIGV4Y2x1ZGUgdGhlc2UgMyBmaWxlcyBmcm9tIHRoZSB6c3RkX2RlY29tcHJlc3MgbW9k
dWxlIHdoZW4gYm90aCBtb2R1bGVzIGFyZSBidWlsdC1pbi4gQnV0IHRoZW4gY29tbWl0IGRjMzVk
YTE2YTJlMiBbMF0gcmVtb3ZlZCB0aGF0LCBiZWNhdXNlIEtidWlsZCBpcyBzdXBwb3NlZCB0byBo
YW5kbGUgdGhhdCBjYXNlLg0KDQpJZiB5b3UgcmV2ZXJ0IGNvbW1pdCBkYzM1ZGExNmEyZTIgWzBd
IGRvZXMgdGhhdCBmaXggdGhlIGlzc3VlPyBJ4oCZbSBhdHRlbXB0aW5nIHRvIGJ1aWxkIHdpdGgg
SUE2NCwgYW5kIEnigJlsbCBsZXQgeW91IGtub3cgaWYgSSBhbSBhYmxlIHRvIHJlcHJvZHVjZSB0
aGUgaXNzdWUgYW5kIHRlc3QgaWYgdGhpcyBmaXhlcyBpdC4NCg0KQ0M6IE1hc2FoaXJvIFlhbWFk
YSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IGF1dGhvciBvZiB0aGUgY29tbWl0IGFu
ZCB0aGUgbGludXgta2J1aWxkIG1haWxpbmcgbGlzdC4NCg0KWzBdIGh0dHBzOi8vZ2l0aHViLmNv
bS90b3J2YWxkcy9saW51eC9jb21taXQvZGMzNWRhMTZhMmUyM2RiMDQ4MjJmMDEyOWNkNWIyOGI3
YjBlNzJiNA0KDQpCZXN0LA0KTmljaw0KDQo+IFRoaXMgaXMgc2VlbiBvbiBEZWJpYW4gdW5zdGFi
bGUsIHdpdGggZ2NjIDEwLjIgYW5kIGJpbnV0aWxzIDIuMzUuICBBDQo+IGZ1bGwgYnVpbGQgbG9n
IGlzIGF2YWlsYWJsZSBhdDoNCj4gaHR0cHM6Ly9idWlsZGQuZGViaWFuLm9yZy9zdGF0dXMvZmV0
Y2gucGhwP3BrZz1saW51eCZhcmNoPWlhNjQmdmVyPTUuOX5yYzQtMX5leHAxJnN0YW1wPTE1OTk5
NTUxNjYmcmF3PTENCj4gDQo+IEJlbi4NCj4gDQo+IC0tIA0KPiBCZW4gSHV0Y2hpbmdzDQo+IEh1
bW91ciBpcyB0aGUgYmVzdCBhbnRpZG90ZSB0byByZWFsaXR5Lg0KPiANCg0K
