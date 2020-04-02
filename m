Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40AD219CB29
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 22:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389702AbgDBU0S (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 16:26:18 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:13772 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389523AbgDBU0S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 16:26:18 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 032KOEIX016399;
        Thu, 2 Apr 2020 13:25:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=EnMT3sCxF93aqi9mJtyPl4NtNpSFe92wNja7WvNcn+w=;
 b=JDr43iPX7Qdt2Up/wxJsUPX/BCPnYnU6LIhE7w5FXLKXvwcswsC2Q2FqfOR0HQmUzsBB
 yY7GtLQ7nr5ZzFRBN0z0dnB9W5OzaUkjLcPfdygnGzeG8Q7Xg6nCpTU/ilSgVm070jse
 U3L5lg3AN5OghqrFAZgqU/nGTGzA+B8tUu0= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 304kde9ycy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 02 Apr 2020 13:25:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 2 Apr 2020 13:25:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVrZlSl9V13a9G14Av8pQMAysQw9fsWUGv2/0YNERpJZbUgYCfxXYR1TlvWRZXVDqPvezId3odJOGWwPcBPyu91CHY7u+EE7sTksl0UAAOF/zs4gc1C6ZPLaCwevZgNBbVtsvPAIhNTPOHhmCSzHyhJt7umzxpwVe29jfVdhyHrmcf7BlqT1oAdwArrYk+dK7bEKDQDWkNW0gTJ74guYvzSSvG+kI96X9JWvsyzRTyRXwAC7PLRnTUj64JPQYTTsdx/LsRXNZDOoaJp1UYO8CgkcQx4dm7uD3iPk5zvhcohM7ujUI7zrdt8Ebu6HNO4kGGUtUlTF1EPBVWIG/zhDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnMT3sCxF93aqi9mJtyPl4NtNpSFe92wNja7WvNcn+w=;
 b=fj0gzovZ8Tx9fxRHO8Cl7zKWiJzUU/FXk2PblYzNo/x2T9vSplw+BvD0mwMo7GPsh7ZrKzKVaqw1HtJPDbE+aHkLND0UQc3qDX94RTTewyPgzUjSDjmJJMgcrI6Xycqb+oi/vLYd9p3HUtzNxTelEu0UAezfhhnQDpCONyomkSXmijddmqGtXaCvN5StYgYooecWblH6yuPGurazOkpHgMoDp9HPqgTr26f5j3zoZ1/byu+/vBQJNntlUIK2QrANQeCqd1TcMWvnnm1zJ9tqrup0XnVk3jy7Ikpg3ijrUvn22PFZCEKOK+nXBvEH2W96DwHB3jKOyw2UsOjATAdmPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnMT3sCxF93aqi9mJtyPl4NtNpSFe92wNja7WvNcn+w=;
 b=QQ2ISAVHpSiOFZ/yWuBnBZOQ4JJYDOFJw0Mesza9/qsMXDILoGOo1inSDd4n5VIXrzPwSdNCMtnJDA9rLzc6QzTrT8uH2rdULzN8guqMJtYUZanLk9lVeKHHG0hq3WzUQg7OBxZAuaLQsziwBts1ra7PlkEirerFDB2+YKMLGNg=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3755.namprd15.prod.outlook.com (2603:10b6:303:4c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 2 Apr
 2020 20:25:50 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2878.016; Thu, 2 Apr 2020
 20:25:50 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Borislav Petkov <bp@alien8.de>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Thread-Topic: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Thread-Index: AQHWB+fltnCxU040x0+5fVIQqY0UGKhkAU0AgACGEwCAAXfTAIAASsiA
Date:   Thu, 2 Apr 2020 20:25:49 +0000
Message-ID: <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
 <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com> <20200402155810.GD9352@zn.tnic>
In-Reply-To: <20200402155810.GD9352@zn.tnic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.222.55.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ab31607-7ad7-4b86-c150-08d7d74408c4
x-ms-traffictypediagnostic: MW3PR15MB3755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB37556FE173A09CF0E8DAF0A1ABC60@MW3PR15MB3755.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3753.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(346002)(136003)(366004)(39860400002)(396003)(376002)(186003)(7416002)(33656002)(54906003)(2906002)(4326008)(5660300002)(26005)(316002)(478600001)(71200400001)(53546011)(36756003)(6916009)(8936002)(66446008)(76116006)(6486002)(2616005)(6512007)(66946007)(86362001)(6506007)(66556008)(66476007)(81166006)(64756008)(8676002)(91956017)(81156014)(21314003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dm4qCvJNradnLPqarcQn+qHjiElosYaaNVvgTTN63R6OlXni/OZPRiNnoljTZ/il6AyscNcCiEVVcuhTYOLaJRP4W+wu0nerAMXU4LL1KSxsAqjyO+47Rdwp92Xz4HnWHJk3Y07SHF1G6DW08bvDHcQSrju8lQSzEkTASDPznRe1FtHe+/bqL133oBs+b2OhjURcQ6w7Xi6G9q8DUKbjISNzxJIwld6OFwe00Yly5Jz721fVyKcsgvwh5LX05qDWKqwUv4btGFnrztX6bUgZo9ti33j1OPE8aD8/zwp7TDXfnaUkelc36wM/Ob+y3+GLOPPu60aNMnWPJWBIiQp6i8SiS/EwZ1+efGug1B0T5YPoilKKNW0CLRzaUbt8gvIN5IbfrtibFHu2kOPNXcZPbwm9ABpJzAYVHbT9x6+9FKRHhTyF0EKF9QU4ThiPQSOBYBZmM03CKCq+PNMp7WDpJVjmirYTBFB+eI+TmCgGov/uS1ZisITnAlW8dpRAFydi
x-ms-exchange-antispam-messagedata: 8vcn2FQ0mYfX5kqbEWoAxpazNyWZsoVLyHVI/jnK1k4EbQwA6Q75NKf55KoMRu1Zpu5kCjNmqllhSTeXZQ/7vfO78HHes/DmngdC3w1TPKEan+jOUxMLITbOjwuL1vagIlLRN1X3GY+j2xoUiW1aCA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEB30BF64D2AC240AB499C2CF5EFE247@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab31607-7ad7-4b86-c150-08d7d74408c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 20:25:49.8834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 91A8KjmAZWYTCd3JqgJroPGyBIilvXKPtQkAzagnJmGPRc1XgQa6V5yQSIIW3NUd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3755
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-02_10:2020-04-02,2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020149
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gQXByIDIsIDIwMjAsIGF0IDg6NTggQU0sIEJvcmlzbGF2IFBldGtvdiA8YnBAYWxp
ZW44LmRlPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgQXByIDAxLCAyMDIwIGF0IDA1OjMzOjAzUE0g
KzAwMDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+IFRoZSBjb2RlIGlzIGN1cnJlbnRseSB3cml0
dGVuIHNvIHRoYXQgYWxsIHRoZSBjb21wcmVzc2lvbiBhbGdvcml0aG1zIHVzZSB0aGUNCj4+IHNh
bWUgWk9fel9leHRyYV9ieXRlcy4gSXQgaXMgdGFrZW4gdG8gYmUgdGhlIG1heGltdW0gb2YgdGhl
IGdyb3d0aCByYXRlDQo+PiBwbHVzIHRoZSBtYXhpbXVtIGZpeGVkIG92ZXJoZWFkLiBKdXN0IGEg
ZmV3IGxpbmVzIGFib3ZlIGlzIHRoZSBjb21tZW50Og0KPj4gDQo+PiAjIOKApiBIZW5jZSBzYWZl
dHkNCj4+ICMgbWFyZ2luIHNob3VsZCBiZSB1cGRhdGVkIHRvIGNvdmVyIGFsbCBkZWNvbXByZXNz
b3JzIHNvIHRoYXQgd2UgZG9uJ3QNCj4+ICMgbmVlZCB0byBkZWFsIHdpdGggZWFjaCBvZiB0aGVt
IHNlcGFyYXRlbHkuIFBsZWFzZSBjaGVjaw0KPj4gIyB0aGUgZGVzY3JpcHRpb24gaW4gbGliL2Rl
Y29tcHJlc3Nvcl94eHguYyBmb3Igc3BlY2lmaWMgaW5mb3JtYXRpb24uDQo+PiANCj4+IFNvIEkg
d2FzIGJlZW4gZm9sbG93aW5nIHRoZSBndWlkYW5jZSBpbiB0aGUgY29tbWVudHMuDQo+IA0KPiBQ
bGVhc2Ugc3RhdGUgdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hlbiB5b3Ugc2VuZCB5b3Vy
IG5leHQNCj4gcmV2aXNpb24uDQoNCldpbGwgZG8uDQoNCj4+IERvZXMgaXQgbWF0dGVyPyBJ4oCZ
bSBub3QgYW4gZXhwZXJ0IGhlcmUsDQo+IA0KPiBIdWgsIHlvdSdyZSBvbmx5IHNlbmRpbmcgdGhl
IGNvZGUgdGhlbj8gT3Igd2hhdCBkbyB5b3UgbWVhbiB3aXRoIG5vdA0KPiBiZWluZyBhbiBleHBl
cnQ/DQoNCkkgbWVhbiB0aGF0IHdoaWxlIEnigJl2ZSByZWFkIGFuZCB1bmRlcnN0b29kIHRoaXMg
cGllY2Ugb2YgdGhlIGNvZGUsIGhhdmUgdGVzdGVkDQp0aGUgcGF0Y2hlcywgaGF2ZSBmb2xsb3dl
ZCB0aGUgdGVtcGxhdGUgb2Ygb3RoZXIgY29tcHJlc3Npb24gbWV0aG9kcw0KYWRkZWQsIGFuZCBh
bSBjb25maWRlbnQgaW4gdGhlIGNvcnJlY3RuZXNzIG9mIHRoZSBjb2RlLCBJ4oCZbSBub3QgYSBy
ZWd1bGFyDQpjb250cmlidXRvciB0byB0aGUgcHJlLWJvb3QgeDg2IGtlcm5lbCBjb2RlLiBTbyBp
dCBpcyBwb3NzaWJsZSB0aGF0IHRoZXJlIGlzIGENCnVzZSBjYXNlIGZvciBrZXJuZWwgY29tcHJl
c3Npb24gdGhhdCBJ4oCZbSBub3QgYXdhcmUgb2Ygd2hlcmUgUkFNIGlzIGV4dHJlbWVseQ0KdGln
aHQgYW5kIHdpdGhpbiA2NCBLQiBvZiB0aGUgY3VycmVudCBsaW1pdHMuDQoNCkl0IHNlZW1zIHRv
IG1lIHRoYXQgYWRkaW5nIDY0S0IgdG8gdGhlIG1lbW9yeSByZXF1aXJlbWVudCBmb3Iga2VybmVs
DQpkZWNvbXByZXNzaW9uIGlzIG5vdCBnb2luZyB0byBicmVhayBhbnlvbmUuIElmIGl0IGRpZCB0
aGUga2VybmVsIGltYWdlIGlzIHRha2luZw0KdXAgbmVhcmx5IGFsbCBhdmFpbGFibGUgUkFNLCB3
aGljaCBkb2VzbuKAmXQgc2VlbSBsaWtlbHkuIEJ1dCwgSSBkb27igJl0IGtub3cgYWxsDQp1c2Ug
Y2FzZXMuIElmIGl0IGRvZXMgYnJlYWsgc29tZW9uZSwgd2UgY2FuIHB1dCB1cCBhIHNlcGFyYXRl
IHBhdGNoIHRoYXQNCnN3aXRjaGVzIGFsbCB0aGUgY29tcHJlc3Npb24gbWV0aG9kcyBvdmVyIGEg
cGVyLW1ldGhvZCBaT196X2V4dHJhX2J5dGVzLg0KDQpCZXN0LA0KTmljaw0KDQo=
