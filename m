Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F67269EE0
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Sep 2020 08:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgIOGwx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Sep 2020 02:52:53 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:40624 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726035AbgIOGwv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Sep 2020 02:52:51 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08F6pTLE011850;
        Mon, 14 Sep 2020 23:52:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=wgAL4069TK+SRtQ8lWlsvRZsCAVCywbtbae3NnkIbDI=;
 b=FfhiSRkhVr8KXR43iCrfVMuQ9+3FZuCiqCS8uIGJqa03TnJ+7rTWHHW0OmN7qPG+HoT9
 VrK2CWFhEoV3KAlSXxBgLtkLIKWOWu0LSu9BBywH7atGVh7tCQzqwncXz7EXi7Bt+mDh
 X4rFwIqfj44Y2eG01W7zNYG7cK14KwCDu8I= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 33hdtttkeg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 14 Sep 2020 23:52:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 14 Sep 2020 23:52:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayMUH2DRljmTugbOXqLmDra/w9WPstlYW5f18CU2/OHX+1fPbMuQPA869iR+ghzi2mzsfgT+rYtEsLOgTSe4ZL+xFbJF6csdF3ZcZ87cm3FMd99lFjk1KAxHnR0lGG6+5wH+/+TOMkWL0g/tskJVFtfKlYSpueqW3j4+0S7FLgDkBv6gBU0CiFfTOfX/jZ9LAFilmHKvLRWfdsI03oVw8wfaH9tasN42TYSBac8qFShQWddCWx0qYPJGvXUBr611M3rGMly6QyodNGRqTGTT0klHY0YqhGKyQUVjiBH8VeasAid9km2pd2elFEtdkhgZ1ByK3mbygK7dtLvW6x4WuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgAL4069TK+SRtQ8lWlsvRZsCAVCywbtbae3NnkIbDI=;
 b=oeHPKYta1/fKJ2QTbDwo6DfyuK0QehEKqYMZsjq5JjlfOE0V8BAtUN5fvngMJ/PPzJmEFsfSnLUwi+YH01HTKO37BEqmCIC+Uo7UmWY4RwLPzRr4qznQnyJSBnXatxa34TS+shpfStW/V8LjbpJmZYE8NZXAq4gBbtOULhdJXvP83J6pqLegbrQW0Ybo8VjYgvW7fNRDAU2j7mapv3wGGSKKGsaPQf/s5Ha1oc1KIsrKVTERMpY8PXfWh11aaWl8DITSxq7t/xkZCYh2g0OWt8xhK0dj98hHp3ktjejKlOexjBPB7ga77icdFiEmqbhrrx4rtiMZMP5SYEerEpj3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgAL4069TK+SRtQ8lWlsvRZsCAVCywbtbae3NnkIbDI=;
 b=LCOq+yGmuBmBqo+LrvmT+2uajC+t5mxraeigJrSrj3nCro40BIOvmpudqjX9YAhZ5sB05unGfmQrqrpFDdyrqklrpMnD0+sx5rHAqsdb2ERuYVbq68epYvlksnNI7xieEhxEfefZF8QiCJlnA5QG7SlvuBYlUe0rYQ1Mif7F/ls=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3366.namprd15.prod.outlook.com (2603:10b6:a03:10d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 06:52:43 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 06:52:43 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     Ben Hutchings <ben@decadent.org.uk>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: vmlinux link failure on ia64 with zstd
Thread-Topic: vmlinux link failure on ia64 with zstd
Thread-Index: AQHWigdFs5Gu/R5JIkizCKuPIzSd4KlogeoAgADCfoCAAAEnAA==
Date:   Tue, 15 Sep 2020 06:52:43 +0000
Message-ID: <7A672D9C-A3A7-456D-BF2E-758566DC2A54@fb.com>
References: <f0a93b2d435252b3878ce821142677754f5e434c.camel@decadent.org.uk>
 <6A76267A-6B60-4428-94DF-E05706EB85FB@fb.com>
 <CAK7LNAToB3n9Y9OPXR55VKbDAkYgm1kUDO8gUu0Ak_+=6AhzCw@mail.gmail.com>
In-Reply-To: <CAK7LNAToB3n9Y9OPXR55VKbDAkYgm1kUDO8gUu0Ak_+=6AhzCw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:ba86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cdc9390-30e2-41b7-7a1d-08d85943f24f
x-ms-traffictypediagnostic: BYAPR15MB3366:
x-microsoft-antispam-prvs: <BYAPR15MB3366A9B3390EAE98018EE192AB200@BYAPR15MB3366.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:390;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sZFpLEbB3T9vgEneMLZ89p8dw2k7ClN3RvgHS7RXcFdxdnEHwCOkN8+XCpxqRSXaQS9+ZRH2v/sE3nCZoAnmYshtNuGpt7Ej9u6RTjUL/U55MW6AAZWDQx6d7NLVpPHcHdQGZc2xjeDY1G0FmQvPbfWuO4DsANaiQDYNaOOiA+VWM207VlGJ3Ju3m6G74nuNkGg1Nevg4bGo4icWmYK3Veunxs1wuF6n2xr4lBeNB0Rf8wqDYfGe68yMDtCAZgvEU3PxQMvTCi8o1Pz0awQwV6df6CqEdxlmFSNCERG4Ko81MMLjm8EGHCgWCiAhIhyDjvMEFbJMBqo38uRguo5Le5MfMsHcfmm6+IpQcjB3eaAvO5IirZ9i5x973YyJaXhcwh42+TXqHMYPlZ03p8zHnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(39860400002)(396003)(136003)(366004)(8676002)(66556008)(66476007)(2906002)(53546011)(6506007)(83380400001)(66446008)(64756008)(33656002)(71200400001)(8936002)(2616005)(36756003)(478600001)(6512007)(91956017)(76116006)(6486002)(66946007)(186003)(5660300002)(6916009)(966005)(54906003)(316002)(4326008)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qYlLolJMh82RJb3Xeok+sojb0j7LvPl9e9/1VMSeluZERKiYsXyPdx9klxhSIXGrurUqnHn0/Hql8MrdHoTkrKRoxRN7gFYeEZPkCRdVeyBMbwn7iiiFUSV9811OJRgo4tkbjPs4dyEM+ySwINx/HMgb3zmS9zI5FYclyYdyUzm1Ovv/IjaJSJZiQPHHnKbNu0KrjgZqAbkOmftvE31rcxipORs6K7dLU1a7ZHdhXgnE0k1o8giWU51Brl2UN6Fn2xSjO3tzVSpDlYxn2LaZA+iRCo0Yq1VItZ89l7pCU+CFmhgmiMtr02ChQXzmjVrMhQrb50pHBz6EGO1gjzLPUY0yQtHiPbe98lka9//xJT7aSDhGlBA7YyNIP8ilZi32nS5kSzlyNJcS2ZtrwVknxvoCx+yZnnp5bizmnEraKNtsE591nIDUSvehjiEy3ce5o1/Vg+6b6MawVKmDYLikdFsXPPDmoqueUILnLr15zCcChxbnR8xnoIGwdSedz+Jsp9IBrZdbS52iMOTuWnh3nTYcm8+pkNGdySkAdzxlqMmm7Z1+mHi2mZTkGeSPD1Yt22eCZbdjMg+/FKjWULMNjOlxbe6E2Pvlud3Wr9LhJxJ6q1L0ADZFtmCd1KZk19KoSpRRRSwNYNUjE1uJ6xVGLIP3B2xxsmdJzOyvMmaPEO9sd8ouZgD3iWEQq5h59MfC
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9896B225BEBD4B4CA5FC2296B6017848@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdc9390-30e2-41b7-7a1d-08d85943f24f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 06:52:43.4012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzNcTaCvSkHLJ7+Z+02s6zaV4sYGCXLkShAYJFEVQjkUqX7e4aXl6PAaJaf38Ief
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3366
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_04:2020-09-15,2020-09-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 mlxlogscore=827 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009150062
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gU2VwIDE0LCAyMDIwLCBhdCAxMTo0OCBQTSwgTWFzYWhpcm8gWWFtYWRhIDxtYXNh
aGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIFNlcCAxNSwgMjAyMCBhdCA0
OjEyIEFNIE5pY2sgVGVycmVsbCA8dGVycmVsbG5AZmIuY29tPiB3cm90ZToNCj4+IA0KPj4gDQo+
PiANCj4+PiBPbiBTZXAgMTMsIDIwMjAsIGF0IDEyOjUxIFBNLCBCZW4gSHV0Y2hpbmdzIDxiZW5A
ZGVjYWRlbnQub3JnLnVrPiB3cm90ZToNCj4+PiANCj4+PiBFbmFibGluZyBDT05GSUdfUkRfWlNU
RCAod2hpY2ggaXMgZW5hYmxlZCBieSBkZWZhdWx0KSByZXN1bHRlZCBpbiBhDQo+Pj4gbGluayBm
YWlsdXJlIG9uIGlhNjQ6DQo+Pj4gDQo+Pj4gKyBsZCAtciAtbyB2bWxpbnV4Lm8gLS13aG9sZS1h
cmNoaXZlIGFyY2gvaWE2NC9rZXJuZWwvaGVhZC5vIGluaXQvYnVpbHQtaW4uYSB1c3IvYnVpbHQt
aW4uYSBhcmNoL2lhNjQva2VybmVsL2J1aWx0LWluLmEgYXJjaC9pYTY0L21tL2J1aWx0LWluLmEg
a2VybmVsL2J1aWx0LWluLmEgY2VydHMvYnVpbHQtaW4uYSBtbS9idWlsdC1pbi5hIGZzL2J1aWx0
LWluLmEgaXBjL2J1aWx0LWluLmEgc2VjdXJpdHkvYnVpbHQtaW4uYSBjcnlwdG8vYnVpbHQtaW4u
YSBibG9jay9idWlsdC1pbi5hIGxpYi9idWlsdC1pbi5hIGFyY2gvaWE2NC9saWIvYnVpbHQtaW4u
YSBsaWIvbGliLmEgYXJjaC9pYTY0L2xpYi9saWIuYSBkcml2ZXJzL2J1aWx0LWluLmEgc291bmQv
YnVpbHQtaW4uYSBuZXQvYnVpbHQtaW4uYSB2aXJ0L2J1aWx0LWluLmEgYXJjaC9pYTY0L3BjaS9i
dWlsdC1pbi5hIGFyY2gvaWE2NC9ocC9jb21tb24vYnVpbHQtaW4uYSAtLW5vLXdob2xlLWFyY2hp
dmUgLS1zdGFydC1ncm91cCAtLWVuZC1ncm91cA0KPj4+IGxkOiBsaWIvenN0ZC9lbnRyb3B5X2Nv
bW1vbi5vOiBsaW5raW5nIGNvbnN0YW50LWdwIGZpbGVzIHdpdGggbm9uLWNvbnN0YW50LWdwIGZp
bGVzDQo+Pj4gbGQ6IGZhaWxlZCB0byBtZXJnZSB0YXJnZXQgc3BlY2lmaWMgZGF0YSBvZiBmaWxl
IGxpYi96c3RkL2VudHJvcHlfY29tbW9uLm8NCj4+PiBsZDogbGliL3pzdGQvZnNlX2RlY29tcHJl
c3MubzogbGlua2luZyBjb25zdGFudC1ncCBmaWxlcyB3aXRoIG5vbi1jb25zdGFudC1ncCBmaWxl
cw0KPj4+IGxkOiBmYWlsZWQgdG8gbWVyZ2UgdGFyZ2V0IHNwZWNpZmljIGRhdGEgb2YgZmlsZSBs
aWIvenN0ZC9mc2VfZGVjb21wcmVzcy5vDQo+Pj4gbGQ6IGxpYi96c3RkL3pzdGRfY29tbW9uLm86
IGxpbmtpbmcgY29uc3RhbnQtZ3AgZmlsZXMgd2l0aCBub24tY29uc3RhbnQtZ3AgZmlsZXMNCj4+
PiBsZDogZmFpbGVkIHRvIG1lcmdlIHRhcmdldCBzcGVjaWZpYyBkYXRhIG9mIGZpbGUgbGliL3pz
dGQvenN0ZF9jb21tb24ubw0KPj4gDQo+PiBJ4oCZdmUgbmV2ZXIgc2VlbiBhbnl0aGluZyBsaWtl
IHRoaXMgZXJyb3IgYmVmb3JlLiBJIGRpZCBzb21lIHNlYXJjaGluZywgYW5kIGZvdW5kIHRoYXQg
aXQgbWF5IHNob3cgdXAgaWYgYW4gb2JqZWN0IGZpbGUgaXMgZW1wdHkuDQo+PiANCj4+IFRoZXNl
IHRocmVlIGZpbGVzIGFyZSBhbGwgaW5jbHVkZWQgaW4gYm90aCB0aGUgenN0ZF9jb21wcmVzcyBh
bmQgdGhlIHpzdGRfZGVjb21wcmVzcyBtb2R1bGVzLiBXZSB1c2VkIHRvIGV4Y2x1ZGUgdGhlc2Ug
MyBmaWxlcyBmcm9tIHRoZSB6c3RkX2RlY29tcHJlc3MgbW9kdWxlIHdoZW4gYm90aCBtb2R1bGVz
IGFyZSBidWlsdC1pbi4gQnV0IHRoZW4gY29tbWl0IGRjMzVkYTE2YTJlMiBbMF0gcmVtb3ZlZCB0
aGF0LCBiZWNhdXNlIEtidWlsZCBpcyBzdXBwb3NlZCB0byBoYW5kbGUgdGhhdCBjYXNlLg0KPj4g
DQo+PiBJZiB5b3UgcmV2ZXJ0IGNvbW1pdCBkYzM1ZGExNmEyZTIgWzBdIGRvZXMgdGhhdCBmaXgg
dGhlIGlzc3VlPyBJ4oCZbSBhdHRlbXB0aW5nIHRvIGJ1aWxkIHdpdGggSUE2NCwgYW5kIEnigJls
bCBsZXQgeW91IGtub3cgaWYgSSBhbSBhYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgYW5kIHRl
c3QgaWYgdGhpcyBmaXhlcyBpdC4NCj4+IA0KPj4gQ0M6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRh
Lm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IGF1dGhvciBvZiB0aGUgY29tbWl0IGFuZCB0aGUgbGlu
dXgta2J1aWxkIG1haWxpbmcgbGlzdC4NCj4+IA0KPj4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9jb21taXQvZGMzNWRhMTZhMmUyM2RiMDQ4MjJmMDEyOWNkNWIyOGI3YjBl
NzJiNA0KPiANCj4gDQo+IGRjMzVkYTE2YTJlMiBpcyBtb3JlIHRoYW4gdHdvIHllYXJzIG9sZCAo
aS5lLiB2NC4xNykNCj4gDQo+IEFyZSB3ZSBkaXNjdXNzaW5nIGEgbG9uZy1zdGFuZGluZyBpc3N1
ZQ0KPiBvciBzb21ldGhpbmcgdGhhdCBhcm9zZSByZWNlbnRseT8NCg0KSXQgYXJvc2UgcmVjZW50
bHkgYmVjYXVzZSBJIGJlbGlldmUgdGhhdCB6c3RkIHdhc27igJl0IGVuYWJsZWQgb24gYW55IElB
NjQgc3lzdGVtcyBiZWZvcmUgcmVjZW50bHkuDQpCdXQsIEkgYmVsaWV2ZSB0aGF0IHRoZSBjYXVz
ZSBpcyB0aGF0IHNvbWUgb2YgdGhlIG9iamVjdCBmaWxlcyBjb250YWluIG5vIHN5bWJvbHMsIGFu
ZCBiaW51dGlscyBjYW7igJl0DQpoYW5kbGUgaXQgb24gdGhpcyBhcmNoaXRlY3R1cmUuIEnigJlt
IG5vdCAxMDAlIHBvc2l0aXZlLCBiZWNhdXNlIEkgaGF2ZW7igJl0IGJlZW4gYWJsZSB0byByZXBy
b2R1Y2UgdGhlDQppc3N1ZSwgc2luY2UgSSBoYXZlbuKAmXQgeWV0IGJlZW4gYWJsZSB0byBidWls
ZCB3aXRoIElBNjQuDQoNCi1OaWNrDQoNCj4+IEJlc3QsDQo+PiBOaWNrDQo+PiANCj4+PiBUaGlz
IGlzIHNlZW4gb24gRGViaWFuIHVuc3RhYmxlLCB3aXRoIGdjYyAxMC4yIGFuZCBiaW51dGlscyAy
LjM1LiAgQQ0KPj4+IGZ1bGwgYnVpbGQgbG9nIGlzIGF2YWlsYWJsZSBhdDoNCj4+PiBodHRwczov
L3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2J1aWxkZC5kZWJp
YW4ub3JnX3N0YXR1c19mZXRjaC5waHAtM0Zwa2ctM0RsaW51eC0yNmFyY2gtM0RpYTY0LTI2dmVy
LTNENS45LTdFcmM0LTJEMS03RWV4cDEtMjZzdGFtcC0zRDE1OTk5NTUxNjYtMjZyYXctM0QxJmQ9
RHdJRmFRJmM9NVZEMFJUdE5sVGgzeWNkNDFiM01VdyZyPUhRTTVJUWRXT0I4V2FNb2lpMmRZVHcm
bT16cXFBbDV5SWY3WFFWLVFyVlh3Y3U4OGNqcnFMZjlRZWRTTXNnMjE2UlBvJnM9ZHBLdW9RQkZB
TTFaNHE5WEQ5YlNhU3BLM280V1NFTHF5emU4bk1zeFJnSSZlPSANCj4+PiANCj4+PiBCZW4uDQo+
Pj4gDQo+Pj4gLS0NCj4+PiBCZW4gSHV0Y2hpbmdzDQo+Pj4gSHVtb3VyIGlzIHRoZSBiZXN0IGFu
dGlkb3RlIHRvIHJlYWxpdHkuDQo+Pj4gDQo+PiANCj4gDQo+IA0KPiAtLSANCj4gQmVzdCBSZWdh
cmRzDQo+IE1hc2FoaXJvIFlhbWFkYQ0KDQo=
