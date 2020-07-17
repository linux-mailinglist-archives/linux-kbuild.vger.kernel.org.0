Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B207224096
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jul 2020 18:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgGQQbD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jul 2020 12:31:03 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:15398 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726393AbgGQQbD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jul 2020 12:31:03 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 06HGURWr022910;
        Fri, 17 Jul 2020 09:30:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=jvJlqsV8kdYfp7GUptRO2KJvFKIuEOFUYlknZ1lm/GU=;
 b=nlHiHfjDuI5GYvLQwGK3RscHY86sVWl7D0JETdfdn8dAa4IT3TLDNydVtz0FcEITmuDd
 Cs7E/HUfOHsNfDdsCP/6YKGZUtsDii8QNR8DgaVkmzFbtmBlFJwWy4uqsnZ6KbC0oU+f
 xzQsPfp2fAH6I0+Iq4RHAfTQazhHi3MEWYY= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0089730.ppops.net with ESMTP id 32afftg8sw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 17 Jul 2020 09:30:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 17 Jul 2020 09:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctr62osc2QkveUM3nCUs2TdMTwFJs5pRMEsZ8R1wJ5LKY9dB9phQ6ZPV5MOQ09OqRMXyjtkWV1xW+wBRUE1oefC4IUpI4rXJrdCqrZK1LzmbQxTyGp+v+dkug7UKC4e6Epdmk8Qg4d0ryoPR+mqlp3AnC9Z3weA/wOY/36mo0hgTy7xqO33eTpoeCbLjGEs0CGX+u+fpiqMvX/OcGzHh6HHGB4YME1Vy6qNaub0p6CEjU+Noq/hfrHdI3AAFwQe9hr8ONbgf44pM3+exINIJV4WBks/i++MDlCPGeZAxNkAYGNWipkyQXZ4V4s1giR2AZIxKKeSbkmeOQv5qZCeZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvJlqsV8kdYfp7GUptRO2KJvFKIuEOFUYlknZ1lm/GU=;
 b=c0Vc0qUDwZQHOVZnKk33cXgCDpbSv8qSffiBGPGBtTYz/Bp4gjkgPreN4VJleIIuCoze58REoJM1BsUeoFEIfj2dIyxOLUtghHwQAbpnPlAthj3Mp0dKtSIon3DRJ6G0aN6sBR0CfJQR7LQ8eWHTYoZmJgFAuZEC+iRk6GV+vx9/u96wmnzIkervMfcvakfbZCn8gdVpQmbT1KFa0odEGLThYwqmw6rGWUmHknRI1OnRxrfV/Q/cCmyAgphtd/4TNo1vG6tICdYHqpcu6t5xeehUsIaV1Mof3Kuk3pBm6+W3RzPrDM0kWldNE5G3vK1/J0TYcfvUBdFboUzWfiX+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvJlqsV8kdYfp7GUptRO2KJvFKIuEOFUYlknZ1lm/GU=;
 b=iWyrWPiyYqIWmXY802+MalSLFtQbc95XfsWorvCaqVF2UuU8valTjXftvi1d+Y+I3NHaWQzYEERx+p44XMVJu479pBp30yZ4NzshtFyxkWCH5yWjI+ArY6mw57ux6fZeSbnoKjQovHKKDf+1TLfy95wzIMXdJ1lufS7Pgi5JGKU=
Received: from CH2PR15MB3672.namprd15.prod.outlook.com (2603:10b6:610:5::14)
 by CH2PR15MB3687.namprd15.prod.outlook.com (2603:10b6:610:b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Fri, 17 Jul
 2020 16:29:55 +0000
Received: from CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::2d7a:edf5:67f9:5446]) by CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::2d7a:edf5:67f9:5446%3]) with mapi id 15.20.3174.025; Fri, 17 Jul 2020
 16:29:55 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Arvind Sankar <nivedita@alum.mit.edu>
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
        "Norbert Lange" <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Alex Xu" <alex_y_xu@yahoo.ca>
Subject: Re: [PATCH v7 2/7] lib: add zstd support to decompress
Thread-Topic: [PATCH v7 2/7] lib: add zstd support to decompress
Thread-Index: AQHWVVlX6culfdHbw0e1K8dCb+GCsqkHpLQAgARfmgA=
Date:   Fri, 17 Jul 2020 16:29:55 +0000
Message-ID: <C5D3AFA3-FAD0-4B31-968B-5106ADC557D3@fb.com>
References: <20200708185024.2767937-1-nickrterrell@gmail.com>
 <20200708185024.2767937-3-nickrterrell@gmail.com>
 <20200714214242.GA1000731@rani.riverdale.lan>
In-Reply-To: <20200714214242.GA1000731@rani.riverdale.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alum.mit.edu; dkim=none (message not signed)
 header.d=none;alum.mit.edu; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c091:480::1:46c4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5ebf8b5-a355-453b-01e3-08d82a6ea3f1
x-ms-traffictypediagnostic: CH2PR15MB3687:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR15MB3687E4D3DFCC4C849738DACEAB7C0@CH2PR15MB3687.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QGnJB+4ObJuDhr/fKjYKORWHBSFl12b5PsMyg34+3bve5mNkDFbRWdQwYw5aQBNY5yMkeogzfroL5CRHvtV4jxY9/Hmmx5+gioc3jCIuoaAgxhORRc3At8EtUX7b6ROS2AwNjSSWvs6TIweiIsWXOgpvpoWMLwZkfLWulNeThMZx3UnuNtgL6g27aXF7iJZNk95yE0TEDmr7zXLC8aW5ZbnDNTzVaDntuWlS7B0v6VGUReo/hS4yzUuWYn2aqk3Vh3PTaI4O1z9BYpcvWM71k41NHLOvUTg3pLMClFk0tXkZyoddxGzAQ5ZrUudJzMEbg8stNVCQOcs3JZwid7izrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR15MB3672.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(376002)(366004)(39860400002)(396003)(64756008)(66556008)(76116006)(2906002)(36756003)(4326008)(66476007)(478600001)(33656002)(66946007)(6486002)(91956017)(66446008)(6512007)(53546011)(86362001)(316002)(71200400001)(2616005)(186003)(6916009)(8936002)(8676002)(7416002)(6506007)(54906003)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: lEbDAqW6scdhEhRjh9m8E+UGJNWy+c6KXj5d+rWtOu8V9sFbjVuXJ0/9uNpqmkQHWediL/nKdTAEiahTnq1ueB+U6rtgBcYMPPn0H3uoZY+MHp0I8kQeNQi4Vg74+XfPdO3oGGPmpGlkxz/0yZanBteFH/7xv4aqgQvg3sgMVLyOmUnSYcUw7NdO/pEOJSfQiKkJLY2IfqQbAyrzA2hcAXzIhQE+lMXZIVNe0uVmxf6IJo0TlM7CqaHcl49eP5WF8C47f9ft00ykormWsm/7qGf4gOtJY4XQcWBpr7LeTibSt8aOlDwfjliLdk3RA1FpMsdM9/oth6MVQln7oaTbkKahNeTo8i3p+e1prJwcR5tPgm60k9aa+qeACkANaBc92TeZmKPnrJhiVURvvOPjPQg/Wgw1ktgJZie0++4T7tVnwUXwDW892L6G0h4TW0CLZb0W3/x//c4GhdpbskqUIfZVkYjBO4etQX076FtBAZOS4XNyNNVzy37pN90B9rQQPPKquAB/kYbxtqVGOgh1iw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6D4507A264E644E9BF5842BCEECF2A2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR15MB3672.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ebf8b5-a355-453b-01e3-08d82a6ea3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 16:29:55.6066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g2Uo5y97QvaBFu09kfeQDMKONoJmdZooJBndbigGSBUTeyy7zXaXN1aUfvD6BvX+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR15MB3687
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-17_08:2020-07-17,2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170117
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gSnVsIDE0LCAyMDIwLCBhdCA1OjQyIFBNLCBBcnZpbmQgU2Fua2FyIDxuaXZlZGl0
YUBhbHVtLm1pdC5lZHU+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKdWwgMDgsIDIwMjAgYXQgMTE6
NTA6MTlBTSAtMDcwMCwgTmljayBUZXJyZWxsIHdyb3RlOg0KPj4gRnJvbTogTmljayBUZXJyZWxs
IDx0ZXJyZWxsbkBmYi5jb20+DQo+PiANCj4+ICogQWRkIHVuenN0ZCgpIGFuZCB0aGUgenN0ZCBk
ZWNvbXByZXNzIGludGVyZmFjZS4NCj4+ICogQWRkIHpzdGQgc3VwcG9ydCB0byBkZWNvbXByZXNz
X21ldGhvZCgpLg0KPj4gDQo+PiBUaGUgZGVjb21wcmVzc19tZXRob2QoKSBhbmQgdW56c3RkKCkg
ZnVuY3Rpb25zIGFyZSB1c2VkIHRvIGRlY29tcHJlc3MNCj4+IHRoZSBpbml0cmFtZnMgYW5kIHRo
ZSBpbml0cmQuIFRoZSBfX2RlY29tcHJlc3MoKSBmdW5jdGlvbiBpcyB1c2VkIGluDQo+PiB0aGUg
cHJlYm9vdCBlbnZpcm9ubWVudCB0byBkZWNvbXByZXNzIGEgenN0ZCBjb21wcmVzc2VkIGtlcm5l
bC4NCj4+IA0KPj4gVGhlIHpzdGQgZGVjb21wcmVzc2lvbiBmdW5jdGlvbiBhbGxvd3MgdGhlIGlu
cHV0IGFuZCBvdXRwdXQgYnVmZmVycyB0bw0KPj4gb3ZlcmxhcCBiZWNhdXNlIHRoYXQgaXMgdXNl
ZCBieSB4ODYga2VybmVsIGRlY29tcHJlc3Npb24uDQo+PiANCj4+IFJldmlld2VkLWJ5OiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4NCj4+IFRlc3RlZC1ieTogU2VkYXQgRGlsZWsg
PHNlZGF0LmRpbGVrQGdtYWlsLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IE5pY2sgVGVycmVsbCA8
dGVycmVsbG5AZmIuY29tPg0KPj4gKyAqDQo+PiArICogX19ESVNBQkxFX0VYUE9SVFMgc3RvcHMg
enN0ZCBhbmQgeHhoYXNoIGZyb20gZGVjbGFyaW5nIHRoZW1zZWx2ZXMNCj4+ICsgKiBhcyBtb2R1
bGVzIGJ5IGRpc2FibGluZyB0aGUgRVhQT1JUX1NZTUJPTCBtYWNyby4NCj4+ICsgKi8NCj4gDQo+
IEhpIE5pY2ssIHRoaXMgZG9lc24ndCBhY3R1YWxseSB3b3JrLCBiZWNhdXNlIG1pc2MuYyBpbmNs
dWRlcyBleHBvcnQuaA0KPiB2aWENCj4gCSJtaXNjLmgiIC0+IDxsaW51eC9saW5rYWdlLmg+IC0+
IDxsaW51eC9leHBvcnQuaD4NCj4gYW5kIEVYUE9SVF9TWU1CT0wgaXMgYWxyZWFkeSBkZWZpbmVk
IGJlZm9yZSBfX0RJU0FCTEVfRVhQT1JUUyBpcyBkZWZpbmVkDQo+IGhlcmUuDQo+IA0KPiBBZGRp
bmcgLURfX0VYUE9SVF9TWU1CT0xTIHRvIEtCVUlMRF9DRkxBR1MgaW4gYXJjaC94ODYvYm9vdC9j
b21wcmVzc2VkL01ha2VmaWxlDQo+IGZpeGVzIHRoYXQsIGFuZCB0aGVuIHlvdSBkb24ndCBoYXZl
IHRvIGRlZmluZSBpdCBoZXJlLg0KPiANCj4gQWxzbywgX19ESVNBQkxFX0VYUE9SVFMgZG9lcyBu
b3QgY3VycmVudGx5IGluaGliaXQgTU9EVUxFX0lORk8sIHNvIGENCj4gLm1vZGluZm8gc2VjdGlv
biBnZXRzIGVtaXR0ZWQgaW50byBtaXNjLm8uIEkgKnRoaW5rKiB0aGlzIGlzIGhhcm1sZXNzDQo+
IGFuZCBpdCB3aWxsIGdldCBkaXNjYXJkZWQgd2hlbiBidWlsZGluZyBjb21wcmVzc2VkL3ZtbGlu
dXgsIGJ1dCB0aG91Z2h0DQo+IEknZCBwb2ludCBpdCBvdXQuDQoNClRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhhdCBvdXQhIEnigJltIHN1cnByaXNlZCB0aGF0IHRoZSB6c3RkIGNvbXByZXNzZWQga2Vy
bmVscyBidWlsdCBhbmQgcmFuDQpzdWNjZXNzZnVsbHksIEkgdmFndWVseSByZW1lbWJlciB0aGF0
IGZhaWxpbmcgaW4gdGhlIHBhc3QuIEkgd2lsbCBwdXQgdXAgYSBmaXggc2hvcnRseS4NCg0KLU5p
Y2s=
