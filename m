Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3AC19B621
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 21:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732219AbgDATAh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 15:00:37 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:63010 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727661AbgDATAh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 15:00:37 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 031IwA7p007426;
        Wed, 1 Apr 2020 12:00:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=mvbQVexcAdK+82bRBGd/HI+MSUPA3JDpm+y+Qzae+CU=;
 b=DESDSzzVr+sKpy+BQq9Uc1UhUo1Pu1+jyHt1ZejBYzpD/OQg4X3MnWeoMSmZt1YV/fBm
 /IY+syzrvWRctC18ljt9KRIDTMMP/7JlnYnNvj0OTHNFu0EDrh7J8FuT0Lrg70DfOLFZ
 doBQZ1YmazBpHuUkvGbHN+TT/HzG48L3dvg= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0001303.ppops.net with ESMTP id 304wbb95dv-17
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 01 Apr 2020 12:00:20 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 1 Apr 2020 12:00:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mptgWkzgWc58THdKXb9yeQ/XYJyE+xFjvFiPPL+QLZYOkfIKXqU8H2ryU0YLyxpQv0hM0TQTssFB8RNiV0+SXzY16thOUorZUEYof4NqUTagOfibl0LQpiDajPaFs1QXuwXJbipSD69OT7OQBYIjYajEgN34jXXyl61VKvqhYv6hl7PpVQwz5Gp+p/W7BDbJrfkmVvK1Dx/84qGd1fa9fTvX1dYQv7whHbA08B70Z1vbqRS5FnzZ1/EVsG0t+XeXo+riTthZN0jA4kBCkaGy8HC5aV2Y6/PB0KLClHu0dSGMJjH7RBX/JlywgTT046YGw+retgVy8/jF4dhC+eTuMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvbQVexcAdK+82bRBGd/HI+MSUPA3JDpm+y+Qzae+CU=;
 b=igDheenVNu3qhmXfDvvluopJ8qVMCkJ5aMnX3M4bV2P2JMU65O4cbmz/MbgF6q2Id38iKMcOMz8iRe5sELTVzqx9RaEdzfnbvHApHpPBtQWz2GtvidDR71q6Td10WcSI09vLbC9jmleV+Lv3yjCwX+noo8uX4jsEwbHOYSaS6cY4PS7bpa/kWrHjsXYPbwVMUwZmcYlK2W1gyozrm3qQtB7X8chB5rt7/OT5YPjHTXQacEYH9Ujv/ly3A77WBgtJE+Uu6/jfwZHT6xyz75VEuYNwgHVgZNm5rjsWGumeRJ0LUL2WGOh7t/LkkuqnZM1L8+ClYe5JLt5sYENr4RrxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvbQVexcAdK+82bRBGd/HI+MSUPA3JDpm+y+Qzae+CU=;
 b=Bi1EP6hVVA5FmI9CJqQJUx5ncI9wxauUi3LB7XCObpKA+tGBtvYIX8Ea101crcAosSQBX0NuiTm7MhTsOU+WRcQ+FiJPI9YWQr5+ExstfC4tlTLqlH74lOZV+ZwVSNvsAOi7wQF3t48zCVPLwzC7iVSZV9RAusoHL+XdZU9r/l4=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3755.namprd15.prod.outlook.com (2603:10b6:303:4c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Wed, 1 Apr
 2020 19:00:04 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 19:00:04 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
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
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Thread-Topic: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Thread-Index: AQHWBeEQDgWL3aTsC0eAZqS0g1IF3qhiGjEAgAC3YoCAAMO5AIAAdP+AgACZcoA=
Date:   Wed, 1 Apr 2020 19:00:04 +0000
Message-ID: <CC22D163-BB96-42F5-88DE-BD203860E7C2@fb.com>
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
 <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
 <5F9D2C8D-B1DE-4F95-992E-524E02851CF4@fb.com>
 <CA+icZUXxwkPcfKgaaEaV4XhQseK--N3a=ffh=kU-C84BcFuhrw@mail.gmail.com>
In-Reply-To: <CA+icZUXxwkPcfKgaaEaV4XhQseK--N3a=ffh=kU-C84BcFuhrw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.222.55.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0b24aae-4a28-4c84-43c3-08d7d66ee33e
x-ms-traffictypediagnostic: MW3PR15MB3755:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB3755318509B62D0CB96A8F27ABC90@MW3PR15MB3755.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3753.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39860400002)(366004)(376002)(396003)(136003)(346002)(4326008)(7416002)(81156014)(26005)(71200400001)(2906002)(2616005)(33656002)(186003)(36756003)(8936002)(6916009)(86362001)(478600001)(53546011)(76116006)(6512007)(81166006)(316002)(8676002)(5660300002)(66946007)(66476007)(64756008)(66446008)(66556008)(6486002)(91956017)(6506007)(54906003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RM1HjWdXZ/is7bKH3/WSAPmXeNjLLKUvjKuXuyLU1ai48lnw3nYI/3bda9PdYz483g5S8uTbYp+k1wTqsxpBz++DEC4H2GgKRBac0XEtBgQXcb/81JoApDJ0x3DF54pqLUPUrDg+ZF51A7ziji3aioTwsKOYA/FdKGPLU9eHmL24Ct8HNKNkYQThwFmUu+CxHJcnLioZfDdGXBdjrOI/L4JyPreEPEoEN/tHRp9xnj0NWuRL4xuAuuNiiSW/TqEiKgB3TM8+s7EM4PCjxgmeTqn6bVPvJE85Lk4caqfZyrOFhjyo+jU/BF+QAPu9I3vAFUjFZGmyZk0o73XHrCoYJheUYsHukMPaJac0tFVEVpjCyWs03+JamaPKxmOqEaDfpv5pr2MLYC1w815ZplDkPaUlwUT/8wprbB/zUkczcYL9g3+mksQsVamL0R850SxO
x-ms-exchange-antispam-messagedata: 3pNlW/dSLdv0vHnsW1SxzCQ1VZXX7lQ7iMiDSTVNwa4/zjsWgDXtuBSQyoXxl8Hjl+wuqJ1fCkGxP1MFwO5xb4wnL7W0NHFC8DKT1/Jme0EAGmRNZl6BT4JA65RBb6RVhth3uFIvw7URnD98CZ6SEw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED8B7B0A0D110C49B3B4C5C4F84AD313@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b24aae-4a28-4c84-43c3-08d7d66ee33e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 19:00:04.1826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dSCQ6g1EqW0mjOsevNYuLOvCiXabce26c5WJdWfJjlx2iQ3x1+L5DwXFTUX6itY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3755
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-01_04:2020-03-31,2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 mlxlogscore=760 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010155
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

PiBPbiBBcHIgMSwgMjAyMCwgYXQgMjo1MCBBTSwgU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIEFwciAxLCAyMDIwIGF0IDQ6NTIgQU0gTmlj
ayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4+IE9u
IE1hciAzMSwgMjAyMCwgYXQgODoxMSBBTSwgU2VkYXQgRGlsZWsgPHNlZGF0LmRpbGVrQGdtYWls
LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gVHVlLCBNYXIgMzEsIDIwMjAgYXQgNjoxNSBBTSBO
aWNrIFRlcnJlbGwgPHRlcnJlbGxuQGZiLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gWy4uLl0NCj4+
PiANCj4+Pj4+IERvIHlvdSBwbGFuIHRvIHB1c2ggdGhpcyBmb3IgTGludXggdjUuNz8NCj4+Pj4g
DQo+Pj4+IEkgaG9wZSB0aGF0IGl0IHdpbGwgYmUgYWNjZXB0ZWQuIEZyb20gbXkgcG9pbnQgb2Yg
dmlldyB0aGlzIHBhdGNoIHNldCBpcw0KPj4+PiByZWFkeSBmb3IgbWVyZ2UsIGV4Y2VwdCBmb3Ig
dGhlIG1heGltdW0gd2luZG93IHNpemUgaW5jcmVhc2UNCj4+Pj4gcmVxdWVzdGVkIGJ5IFBldHIu
DQo+Pj4+IA0KPj4+IA0KPj4+IEhpIE5pY2ssDQo+Pj4gDQo+Pj4gdGhhbmtzIGZvciB5b3VyIGFu
c3dlci4NCj4+PiANCj4+PiBEaWQgeW91IHNlbmQgb3V0IGEgcHVsbC1yZXF1ZXN0IGFscmVhZHk/
DQo+PiANCj4+IEkgaGF2ZW7igJl0IHNlbnQgb3V0IGEgcHVsbCByZXF1ZXN0LiBJZiB0aGF0IGlz
IHNvbWV0aGluZyB0aGF0IEkgbmVlZCB0bw0KPj4gZG8sIG9yIGlmIGl0IG1ha2VzIHRoZSBwcm9j
ZXNzIGVhc2llciBmb3IgYSBtYWludGFpbmVyIHRvIG1lcmdlIHRoZW4NCj4+IEkgY2FuIGRvIHRo
YXQuDQo+PiANCj4gDQo+IFsgQ0MgIFN0ZXBoZW4gUm90aHdlbGwgKG1haW50YWluZXIgb2YgTGlu
dXgtbmV4dCkgXQ0KPiANCj4gSGkgTmljaywNCj4gDQo+IGFzIEFkYW0gcG9pbnRlZCBvdXQgaXQg
bWlnaHQgYmUgZ29vZCB0byBhc2sgIlN0ZXBoZW4gUm90aHdlbGwiDQo+IDxzZnJAY2FuYi5hdXVn
Lm9yZy5hdT4NCj4gdG8gaW5jbHVkZSB5b3VyIEdpdCB0cmVlIGludG8gbGludXgtbmV4dC4gU3Rl
cGhlbiB3aWxsIGdpdmUgeW91IHNvbWUNCj4gaW5mb3JtYXRpb25zIGFib3V0IHRoYXQuDQoNClRo
YW5rcyBmb3IgdGhlIHBvaW50ZXJzIFNlZGF0IGFuZCBBZGFtISBJIHdpbGwgcmVhY2ggb3V0IGFu
ZCBhc2sNCmFib3V0IHRoZSBiZXN0IHdheSBmb3J3YXJkLiBJIGRvbuKAmXQgcGFydGljdWxhcmx5
IGNhcmUgaWYgaXQgbWFrZXMgaXQgaW4NCjUuNyBvciA1LjgsIEkganVzdCB3YW50IHRvIGVuc3Vy
ZSB0aGF0IGl0IGRvZXMgZ2V0IG1lcmdlZCB0aGlzIHRpbWUuDQoNCkJlc3QsDQpOaWNrDQoNCg==
