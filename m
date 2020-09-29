Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87A627BC50
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 07:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgI2FQn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 01:16:43 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:36292 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725815AbgI2FQm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 01:16:42 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08T5Gb3b024728;
        Mon, 28 Sep 2020 22:16:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=0wT8RqTqaiJk7A3HB+OLmIXPLQ7Jxmu45KVvE/urbpA=;
 b=bXptEfspKBpuWo4dy3voMOhz3H43DiwbVpdvS0HvvMJlBNi5ct7WjvLC81pGqSFfb064
 EZFC3ZmjesmNDtIRO96b5xmlGHr/dNTCt0sBhyICQb6Tw0TGJqPVs7cb/e1yP8rBvt8b
 X1OFKOSpEHqU5E+1O1qnjNtmEGhaUkhTP2g= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 33tn598nyh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 28 Sep 2020 22:16:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 28 Sep 2020 22:15:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8PpyhPCbAccK3dYlVls+UxDZSHqRNeG8Z/IFv6wcoWJ41zFOLJ6LtMl33k44Cxm5TjFHno2zO+il0ZoQzJIRu7iXjBgZnktC5Yzh9WSV4DDzY7lHu5RJG7G6IzW71yNqBaZJpjJK4DU0nMO7AIMFl+CnUNVmuyLkD76TqFzu60GRUxgC9jwwsvOwZDrjRN28VxN+hYHNqXHbZuUz8FjZN2L7igqKrgBOL5MO7EXMtLpDQz0hLFDIzruwZ9QuJqIT/uY/80N9JmWFZylTJpRV6yZZdLhdduKUoi0eZQWn4yERE0KY0CxCvIv35D/FvHzRnLHZMHO59CfqRoPrGmKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wT8RqTqaiJk7A3HB+OLmIXPLQ7Jxmu45KVvE/urbpA=;
 b=PT04kf102XjkcDMJtHUcclwgLAtJxpHZffiTa/xV8gbdE6Z+ZhNR7uBUEWhvPjHbBgZajRKgCJSp/Zr9Cyt8pZ3nvC1P80uLdlpI4EJPt39kmMNPWyqoPF8b2TpIR6Sy2zRdIqsMHgdgxdF2hcB3oyyj4AKyjyYmyQlkuZP6UI+pbAdYnqB9o6FuPblfO3mhbrON6OYFr87tWOU/XWM+wBLFUFd98UOsN86/sPx5BYeAiWk/+jppGOP8xFc2/lNjGwHphBtRjRGblj4JvPmkZt3p4Y7jZxF7gHqhViaBK7ajpRuYAaTMY0d3lIILsf1dCNoxpyRxxnA1tVw+T706zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wT8RqTqaiJk7A3HB+OLmIXPLQ7Jxmu45KVvE/urbpA=;
 b=L92lajStRtDrVC115aiag6tW0m78ATNI0j9PMLf2Jkj8H1Vgcv4BxITMRrNPyNQesrfe6gHs7pra4ud6uhymIrJnRh+SpB/P912RRmKWHBBPsN7RqQqaqoHbxp4UA7Sx/zethi4EbWkvGyet8JRc+ROSfgWOIJUXAxB3oO9eVlA=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3462.namprd15.prod.outlook.com (2603:10b6:a03:112::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Tue, 29 Sep
 2020 05:15:38 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 05:15:38 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Feng Tang <feng.tang@intel.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>,
        "rong.a.chen@intel.com" <rong.a.chen@intel.com>,
        "philip.li@intel.com" <philip.li@intel.com>,
        "Petr Malat" <oss@malat.biz>
Subject: Re: PROBLEM: zstd bzImage decompression fails for some x86_32 config
 on 5.9-rc1
Thread-Topic: PROBLEM: zstd bzImage decompression fails for some x86_32 config
 on 5.9-rc1
Thread-Index: AQHWlXUd/dfvQ2fZYk2nxWB3sbp9DKl+WAWAgAC8MoA=
Date:   Tue, 29 Sep 2020 05:15:38 +0000
Message-ID: <996F1C01-3607-4643-817E-8318DFCE59A9@fb.com>
References: <20200928085505.GA22244@shbuild999.sh.intel.com>
 <74757C2A-7C09-4C2E-9828-E8D12EE4706B@fb.com>
In-Reply-To: <74757C2A-7C09-4C2E-9828-E8D12EE4706B@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 574cae3f-6848-4b6a-5218-08d86436b3e6
x-ms-traffictypediagnostic: BYAPR15MB3462:
x-microsoft-antispam-prvs: <BYAPR15MB3462C02D78A58B83206C503FAB320@BYAPR15MB3462.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9UmrZIli6+Ze9AC6YTurW77WB8LSLUcr7HzlO57IyWCZ3ooPxRAAPC+ASwHGuOdKY5g7dey7qKxB11KRZtTl7iN6O911OVrLbxbfJKk51FEUXZuOUK6sGZQDE2bC/o7mA29qJkeJxrZjLMJUjMhvSmNFyl0E4UmYxXRKpvGa984Llg7yRnbtCgO8HB73cpBgj6dQKAJTRQKJDyHW6aWgS12+NblHFB0eD6TAfcxbyml+8NIRpETHnbZf+Sq0N6tSPy7SpWhc1xDWtGfoCcIXgZjMett9EnBOZDBWK3r7J5Uy9W25k88kPh76+eTKF1U2Cp31pS2Y4ZRsJrwHJVU2dQIVJwxvLID7WwhOzknBRzN/AZw2DIuHYIFdNTm8L6mXf7940teISp3JQ7NwEeoFXiv4akmyRGxXXzPGZD/oCDHSJuEIAEbxDqjL31h76w1/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(396003)(346002)(136003)(366004)(33656002)(478600001)(86362001)(54906003)(36756003)(316002)(6486002)(83380400001)(6512007)(8676002)(6916009)(2616005)(71200400001)(186003)(4326008)(8936002)(66476007)(64756008)(66446008)(66556008)(26005)(53546011)(6506007)(7416002)(66946007)(76116006)(5660300002)(966005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: SQRm/69Ofy7isI2APZ4u7o9ITeDFl9NexrCSxRWXQwBsTHvNeu8EZ0gwdPxffUXefoMqyQkxbw/eYe6T85+X6GKLzdnppzKzSngjy2LRXcvZERosB8/BIvNAckp9VUiP5WmK6rVs0b/dEwD7miEn+lqd9CBBjTUYxSR/oIWxDc5s4NGllvD9dLPWDzkni3b8J7yyAEVbBKAyID2Efkcbh7ARrsRB8FgHYRzRBZRFGB0ntbHqsUbm2d5S3CvlajoTf8Z/Ysp718qhucP7tUBd11i/oagSuq0jXMK5S6IIQpLSQg2OzV+r2D5hZX1tBYcnnmMfvGP2HdXTGUvuDrN1teFQ7bC22EcsCzk0ObTToL/GW+2Wk4cFEz6ubGAk/RuIZM9CTnYrn9tz9G99Fr4GrqfquD5/OfTZ2ABDxV0EPSwm4/yf9AHFB+YxbubjrfBOb4ewZb1iHaYh5nrbvz2ab8DjApnju2983oOa0GyhOQQTaXSSusBKcTzuf9okuY1UnoIjsxV390S9ilGFlCi83JNRfBQUZUIW4pJDgCezlRKXFgR4RiMs82rYurKd726PVARVdc4rlpcEy3F7hVKkmwDRw809kA1vJq79MvqiXJrmBfSQLw2fwjLJO1Aaho5sUtRtQQgfmfuulINcs1Rg+w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2FC960D10EA4484F9F63BBBDD3F216CE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574cae3f-6848-4b6a-5218-08d86436b3e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 05:15:38.0993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHKk90S9499e2NDDkgMAQxjZIqjT4LIFVngRLSJv4ZDei3svHyDDLRPAyth87kgV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3462
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-29_01:2020-09-28,2020-09-29 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009290052
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gU2VwIDI4LCAyMDIwLCBhdCAxMTowMiBBTSwgTmljayBUZXJyZWxsIDx0ZXJyZWxs
bkBmYi5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPj4gT24gU2VwIDI4LCAyMDIwLCBhdCAxOjU1
IEFNLCBGZW5nIFRhbmcgPGZlbmcudGFuZ0BpbnRlbC5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBO
aWNrLA0KPj4gDQo+PiAwZGF5IGhhcyBmb3VuZCBzb21lIGtlcm5lbCBkZWNvbXByc3Npb24gZmFp
bHVyZSBjYXNlIHNpbmNlIDUuOS1yYzEgKFg4Nl8zMg0KPj4gYnVpbGQpLCBhbmQgaXQgY291bGQg
YmUgcmVsYXRlZCB3aXRoIFpTVEQgY29kZSwgdGhvdWdoIGluaXRpYWxseSB3ZSBiaXNlY3RlZA0K
Pj4gdG8gc29tZSBvdGhlciBjb21taXRzLg0KPj4gDQo+PiBUaGUgZXJyb3IgbWVzc2FnZXMgYXJl
OiANCj4+IAkNCj4+IAllYXJseSBjb25zb2xlIGluIHNldHVwIGNvZGUNCj4+IAlXcm9uZyBFRkkg
bG9hZGVyIHNpZ25hdHVyZS4NCj4+IAllYXJseSBjb25zb2xlIGluIGV4dHJhY3Rfa2VybmVsDQo+
PiAJaW5wdXRfZGF0YTogMHgwNDZmNTBiNA0KPj4gCWlucHV0X2xlbjogMHgwMWViYmViNg0KPj4g
CW91dHB1dDogMHgwMTAwMDAwMA0KPj4gCW91dHB1dF9sZW46IDB4MDRmYzUzNWMNCj4+IAlrZXJu
ZWxfdG90YWxfc2l6ZTogMHgwNTVmNTAwMA0KPj4gCW5lZWRlZF9zaXplOiAweDA1NWY1MDAwDQo+
PiAJDQo+PiAJRGVjb21wcmVzc2luZyBMaW51eC4uLg0KPj4gCQ0KPj4gCVpTVEQtY29tcHJlc3Nl
ZCBkYXRhIGlzIGNvcnJ1cHQNCj4+IA0KPj4gVGhpcyBjb3VsZCBiZSByZXByb2R1Y2VkIGJ5IGNv
bXBpbGluZyB0aGUga2VybmVsIHdpdGggYXR0YWNoZWQgY29uZmlnLA0KPj4gYW5kIHVzZSBRRU1V
IHRvIGJvb3QgaXQuDQo+PiANCj4+IFdlIHN1c3BlY3QgaXQgY291bGQgYmUgcmVsYXRlZCB3aXRo
IHRoZSBrZXJuZWwgc2l6ZSwgYXMgd2Ugb25seSBzZWUNCj4+IGl0IG9uIGJpZyBrZXJuZWwsIGFu
ZCBzb21lIG1vcmUgaW5mbyBhcmU6DQo+PiANCj4+ICogSWYgd2UgcmVtb3ZlIGEgbG90IG9mIGtl
cm5lbCBjb25maWcgdG8gYnVpbGQgYSBtdWNoIHNtYWxsZXIga2VybmVsLA0KPj4gaXQgd2lsbCBi
b290IGZpbmUNCj4+IA0KPj4gKiBJZiB3ZSBjaGFuZ2UgdGhlIHpzdGQgYWxnb3JpdGhtIGZyb20g
enN0ZDIyIHRvIHpzdGQxOSwgdGhlIGtlcm5lbCB3aWxsDQo+PiBib290IGZpbmUgd2l0aCBiZWxv
dyBwYXRjaA0KPj4gDQo+PiAJZGlmZiAtLWdpdCBhL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9N
YWtlZmlsZSBiL2FyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9NYWtlZmlsZQ0KPj4gCWluZGV4IDM5
NjJmNTkuLjhmZTcxYmEgMTAwNjQ0DQo+PiAJLS0tIGEvYXJjaC94ODYvYm9vdC9jb21wcmVzc2Vk
L01ha2VmaWxlDQo+PiAJKysrIGIvYXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL01ha2VmaWxlDQo+
PiAJQEAgLTE0Nyw3ICsxNDcsNyBAQCAkKG9iaikvdm1saW51eC5iaW4ubHpvOiAkKHZtbGludXgu
YmluLmFsbC15KSBGT1JDRQ0KPj4gCSAkKG9iaikvdm1saW51eC5iaW4uenN0OiAkKHZtbGludXgu
YmluLmFsbC15KSBGT1JDRQ0KPj4gCS0JJChjYWxsIGlmX2NoYW5nZWQsenN0ZDIyKQ0KPj4gCSsJ
JChjYWxsIGlmX2NoYW5nZWQsenN0ZCkNCj4+IA0KPj4gDQo+PiBQbGVhc2UgbGV0IG1lIGtub3cg
aWYgeW91IG5lZWQgbW9yZSBpbmZvLCBhbmQgc29ycnkgZm9yIHRoZSBsYXRlIHJlcG9ydA0KPj4g
YXMgd2UganVzdCB0cmFja2VkIGRvd24gdG8gdGhpcyBwb2ludC4NCj4gDQo+IFRoYW5rcyBmb3Ig
dGhlIHJlcG9ydCwgSSB3aWxsIGxvb2sgaW50byBpdCB0b2RheS4NCg0KQ0M6IFBldHIgTWFsYXQN
Cg0KSeKAmXZlIHN1Y2Nlc3NmdWxseSByZXByb2R1Y2VkLCBhbmQgZm91bmQgdGhlIGlzc3VlLiBJ
dCB0dXJucyBvdXQgdGhhdCB0aGlzDQpwYXRjaCBbMF0gZnJvbSBQZXRyIE1hbGF0IGZpeGVzIHRo
ZSBpc3N1ZS4gQXMgSSBtZW50aW9uZWQgaW4gdGhhdCB0aHJlYWQsIGhpcw0KZml4IGNvcnJlc3Bv
bmRzIHRvIHRoaXMgdXBzdHJlYW0gY29tbWl0IFsxXS4NCg0KQ2FuIHdlIGdldCBQZXRyJ3MgcGF0
Y2ggbWVyZ2VkIGludG8gdjUuOT8NCg0KVGhpcyBidWcgb25seSBoYXBwZW5zIHdoZW4gdGhlIHdp
bmRvdyBzaXplIGlzID4gOCBNQi4gQSBub24ta2VybmVsIHdvcmthcm91bmQNCndvdWxkIGJlIHRv
IGNvbXByZXNzIHRoZSBrZXJuZWwgbGV2ZWwgMTkgaW5zdGVhZCBvZiBsZXZlbCAyMiwgd2hpY2gg
dXNlcyBhbg0KOCBNQiB3aW5kb3cgc2l6ZSwgaW5zdGVhZCBvZiBhIDEyOCBNQiB3aW5kb3cgc2l6
ZS4NCg0KVGhlIHJlYXNvbiBpdCBvbmx5IHNob3dzIHVwIGZvciBsYXJnZSBrZXJuZWxzLCBpcyB0
aGF0IHRoZSBjb2RlIGlzIG9ubHkgYnVnZ3kNCndoZW4gYW4gb2Zmc2V0ID4gOCBNQiBpcyB1c2Vk
LCBzbyBhIGtlcm5lbCA8PSA4IE1CIGNhbid0IHRyaWdnZXIgdGhlIGJ1Zy4NCg0KQmVzdCwNCk5p
Y2sNCg0KWzBdIGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzkvMTQvOTQNClsxXSBodHRwczov
L2dpdGh1Yi5jb20vZmFjZWJvb2svenN0ZC9jb21taXQvOGE1YzBjOThhZTVhNzg4NDY5NDU4OWQ3
YTY5YmM5OTAxMWFkZDk0ZA0KDQo+IEJlc3QsDQo+IE5pY2sNCj4gDQo+PiBUaGFua3MsDQo+PiBG
ZW5nDQo+PiANCj4+IA0KPj4gDQo+PiA8enN0ZF94ODZfMzIuY29uZmlnPg0KDQo=
