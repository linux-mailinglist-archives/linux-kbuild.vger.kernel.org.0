Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD06019A3AD
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 04:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731565AbgDACqn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 22:46:43 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:51530 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731556AbgDACqn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 22:46:43 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0312k2pX026894;
        Tue, 31 Mar 2020 19:46:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=qk9eFGC6ewe2nneocNntwKsE3dCX3jXGWbBoaC+cW0M=;
 b=H+RCy6JHzCEboBcjDFlcW+ifLcrz1Kp5MZkJ5XlPDFYjOFfsx2deqofmWSzCvjNLUNTs
 W8iyWLRtVynClvbrWw+WXibG6jRZpU1RMhz47iIvFYlRvIiwrS8mYvqLoK/2ZXhob+Jl
 A/e+x/3Fz+fYbKb+40BJWO8R1dy/HNmkhK0= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 302pqwjv2u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 31 Mar 2020 19:46:28 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Tue, 31 Mar 2020 19:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9L+d/1edG1Nx/zWLgSysfGH4jL810edsIMVGgq7GoZJ25wZdGlI85k5V0FUplfBynv87UKVXYkmy9+gIMmQl45eV8Ggr4zG2zKJuCxhM99KzohFI741R96/x1H25GxZV0+nFy3Ow6y9zzmAt3y6NJ3k83wdzG9VKbVzraeEzPYZpw0zv+hpRx/oZJEg+8m9okcOBOfBDLEAzHTQFJJuuICEVuDIuT2P+wbqx9HZTUDth2NeD0nTt5NUh605s4BVjo2aCsTfR+W1RZANFG1zOUezhluWZasZ8Ea4XMSUh/a+eYfP9q9yYHkp95EAQHVxiMHQ6b21TESBNoTO2K5R0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk9eFGC6ewe2nneocNntwKsE3dCX3jXGWbBoaC+cW0M=;
 b=ePxKYx01J7IagSSrGumaH0J1pKOzBJqbelg+/xelaRpM18ugdoxfshv6W9MoMG+ieIzKTV+JVya0HyvnoZ6R1JXBdYA/qFR2GFULs/5KcTQxG48IFiGJCql79uulGzI+AeCOoz3csdJlgnEtyP+PgjsWApQ4W4oYV36lP5Sw8yUfs7hNrAOR0QVkHFB0Ye19Bp48lgixH5O9RLYAjF266Zb06PETgXGQOCNfNVv9XMEpOrEfumFZTFBwbdC+87FgMbGdCsbl3eDdxgmwq6kl0Dw32cObBRVuFNcJ7z/CgHkMniQt4cJr5xkHTGIjNRh6KflIQxZZodOsMJaW6JdZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qk9eFGC6ewe2nneocNntwKsE3dCX3jXGWbBoaC+cW0M=;
 b=CQHr+n8Lwg8WxEHye6HhuWBt72JrwPTiEDzp28+arhge4+W2zWFWYzVTqFDSFuIjLCFehy4GSPYTNjWfnPgz0jwkZhKfp93ABnEVl2ZRo0deEQKi2oCEyUeD+Rw9C1IGdEpqEAooe2M/Z01sHUOaV5dcWt7T3XDG4yK9jTHC9MM=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3996.namprd15.prod.outlook.com (2603:10b6:303:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Wed, 1 Apr
 2020 02:46:16 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 02:46:16 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Petr Malat <oss@malat.biz>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v3 3/8] lib: add zstd support to decompress
Thread-Topic: [PATCH v3 3/8] lib: add zstd support to decompress
Thread-Index: AQHWAt/m23+sZPjy5kGvzHRfaAnHI6hbFrwAgAAmGgCAABROAIAISIiA
Date:   Wed, 1 Apr 2020 02:46:15 +0000
Message-ID: <1A4F12DD-680A-4665-B48D-3A9395CAAE70@fb.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
 <20200326164732.GA17157@ntb.petris.klfree.czf>
 <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
 <20200326201634.GA9948@ntb.petris.klfree.czf>
In-Reply-To: <20200326201634.GA9948@ntb.petris.klfree.czf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:400::5:365f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f70be45f-ee81-48ae-1953-08d7d5e6d958
x-ms-traffictypediagnostic: MW3PR15MB3996:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB39961EF3C206F53CC169240CABC90@MW3PR15MB3996.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3753.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(346002)(136003)(376002)(366004)(39860400002)(186003)(6512007)(6486002)(66476007)(76116006)(6916009)(966005)(36756003)(2906002)(64756008)(478600001)(54906003)(8676002)(316002)(66946007)(7416002)(66446008)(66556008)(4326008)(86362001)(2616005)(81166006)(71200400001)(81156014)(8936002)(5660300002)(6506007)(53546011)(33656002)(343044003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PU3ik+dEgy9KLaoEDqMdoE69VW+QpRq/gT6NrD44JdOxzhmPF5yWdXoDsSKlCffjrNWpoHKJSENR8nKaGVk5utHb+9IgiJAA1u/aD3fnEkXAeDE+FSO2fDtt+jLGQ3NJ6+NjlLwzCKESt6LI5W8rMySvJXUWt9cEQELoD4RgIpGiny5n3BgsRZAso+suVVflM/H5fovyBlwSilMpuPvQYmFNCirYNDrFyLbEKQP/gKA5o1LzP5VOT1uLp0Y8lTHddMCAcjYn9Wxmdw7CQLnzlF3EEVNWrtp80fFmtvxipOEQWKmB05TAvUEl157mkOChewuTRIhnakvtD9eVAcKx1Q337kAHKqNTHIwbRbsU65kNImLJD2wtVUYTjV4kxm+pNtgFy+P6zK4PLho9ZU05vValGoJnu0uFTbAhRbpuQjaIM2suxJiljSGRzGEDvSZuKiYmqfCjR4nCAgB3ZlEs8vzd5F0lwo2LGGZpJ2kpydTyZzL0UAy7S6r7rG4jyyHsZsy+0Y0445c0BLFnvbIBN2JYOSOqZ/5XIxjevf0dQEcVOCr69l9+TEeWCz0F9x5k15CiPkmow2O/Q17hlbzZ/g==
x-ms-exchange-antispam-messagedata: Aa2FG58igKtvFFgvCxPy4YmqLbhOSr7meaZ0aRTVpvE7qSxAvpEyl5ewd0FFAn8Nbt5hOuG97sT1tRGB5XtxBSdcXPCYnC24JytHwRTtkkCH0+hLo07oV1cv0e3l2bvkIaPpp1CrylBBVxpg5c2eGTJBfqXHVEN2LanLCK9KiZws2Pp5C0JEAL2cqJnL2aUP
Content-Type: text/plain; charset="utf-8"
Content-ID: <55ED55147C71CD419EC55805CB5E3C65@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f70be45f-ee81-48ae-1953-08d7d5e6d958
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 02:46:15.9677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8KOKRD12v8dQxUyRUVuquwZyAV3W9YEA7ZM8Gzg68fdsRY9q1w7+Lm1IAoy2/FjL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3996
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-03-31_07:2020-03-31,2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010024
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

PiBPbiBNYXIgMjYsIDIwMjAsIGF0IDE6MTYgUE0sIFBldHIgTWFsYXQgPG9zc0BtYWxhdC5iaXo+
IHdyb3RlOg0KPiANCj4gSGkhDQo+IE9uIFRodSwgTWFyIDI2LCAyMDIwIGF0IDA3OjAzOjU0UE0g
KzAwMDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+Pj4gKiBBZGQgdW56c3RkKCkgYW5kIHRoZSB6
c3RkIGRlY29tcHJlc3MgaW50ZXJmYWNlLg0KPj4+IEhlcmUgSSBkbyBub3QgdW5kZXJzdGFuZCB3
aHkgeW91IGxpbWl0IHRoZSB3aW5kb3cgc2l6ZSB0byA4TUIgZXZlbiB3aGVuDQo+Pj4geW91IHJl
YWQgYSBsYXJnZXIgdmFsdWUgZnJvbSB0aGUgaGVhZGVyLiBJIGRvIG5vdCBzZWUgYSByZWFzb24g
d2h5IHRoZXJlDQo+Pj4gc2hvdWxkIGJlIHN1Y2ggYSBsaW1pdGF0aW9uIGF0IHRoZSBmaXJzdCBw
bGFjZSBhbmQgaWYgdGhlcmUgc2hvdWxkIGJlLA0KPj4+IHdoeSBpdCBkaWZmZXJzIGZyb20gWlNU
RF9XSU5ET1dMT0dfTUFYLg0KPj4gDQo+PiBXaGVuIHdlIGFyZSBkb2luZyBzdHJlYW1pbmcgZGVj
b21wcmVzc2lvbiAoZWl0aGVyIGZsdXNoIG9yIGZpbGwgaXMgcHJvdmlkZWQpDQo+PiB3ZSBoYXZl
IHRvIGFsbG9jYXRlIG1lbW9yeSBwcm9wb3J0aW9uYWwgdG8gdGhlIHdpbmRvdyBzaXplLiBXZSB3
YW50IHRvDQo+PiBib3VuZCB0aGF0IG1lbW9yeSBzbyB3ZSBkb24ndCBhY2NpZGVudGFsbHkgYWxs
b2NhdGUgdG9vIG11Y2ggbWVtb3J5Lg0KPj4gV2hlbiB3ZSBhcmUgZG9pbmcgYSBzaW5nbGUtcGFz
cyBkZWNvbXByZXNzaW9uIChuZWl0aGVyIGZsdXNoIG5vciBmaWxsDQo+PiBhcmUgcHJvdmlkZWQp
IHRoZSB3aW5kb3cgc2l6ZSBkb2Vzbid0IG1hdHRlciwgYW5kIHdlIG9ubHkgaGF2ZSB0byBhbGxv
Y2F0ZQ0KPj4gYSBmaXhlZCBhbW91bnQgb2YgbWVtb3J5IH4xOTIgS0IuDQo+PiANCj4+IFRoZSB6
c3RkIHNwZWMgWzBdIHNwZWNpZmllcyB0aGF0IGFsbCBkZWNvZGVycyBzaG91bGQgYWxsb3cgd2lu
ZG93IHNpemVzDQo+PiB1cCB0byA4IE1CLiBBZGRpdGlvbmFsbHksIHRoZSB6c3RkIENMSSB3b24n
dCBwcm9kdWNlIHdpbmRvdyBzaXplcyBncmVhdGVyDQo+PiB0aGFuIDggTUIgYnkgZGVmYXVsdC4g
VGhlIHdpbmRvdyBzaXplIGlzIGNvbnRyb2xsZWQgYnkgdGhlIGNvbXByZXNzaW9uDQo+PiBsZXZl
bCwgYW5kIGNhbiBiZSBleHBsaWNpdGx5IHNldC4NCj4gWWVzLCBvbmUgbmVlZHMgdG8gcGFzcyAt
LXVsdHJhIG9wdGlvbiB0byB6c3RkIHRvIHByb2R1Y2UgYW4gaW5jb21wYXRpYmxlDQo+IGFyY2hp
dmUsIGJ1dCB0aGF0IGRvZXNuJ3QganVzdGlmeSB0aGUgcmVhc29uIHRvIGxpbWl0IHRoaXMgaW4g
dGhlIGtlcm5lbCwNCj4gZXNwZWNpYWxseSBpZiBvbmUgaXMgYWJsZSB0byByZWFkIHRoZSBuZWVk
ZWQgd2luZG93IHNpemUgZnJvbSB0aGUgaGVhZGVyDQo+IHdoZW4gYWxsb2NhdGluZyB0aGUgbWVt
b3J5LiBBdCB0aGUgdGltZSB3aGVuIGluaXRyYW1mcyBpcyBleHRyYWN0ZWQsDQo+IHRoZXJlIHVz
dWFsbHkgaXMgbWVtb3J5IGF2YWlsYWJsZSBhcyBpdCdzIGJlZm9yZSBhbnkgcHJvY2Vzc2VzIGFy
ZQ0KPiBzdGFydGVkIGFuZCB0aGlzIG1lbW9yeSBpcyByZWNsYWltZWQgYWZ0ZXIgdGhlIGRlY29t
cHJlc3Npb24uDQo+IA0KPiBJZiwgb24gdGhlIG90aGVyIGhhbmQsIGFuIHVzZXIgbWFrZXMgYW4g
aW5pdHJhbWZzIGZvciBhIG1lbW9yeSBjb25zdHJhaW5lZA0KPiBzeXN0ZW0sIGhlIGxpbWl0cyB0
aGUgd2luZG93IHNpemUgd2hpbGUgY29tcHJlc3NpbmcgdGhlIGFyY2hpdmUgYW5kDQo+IHRoZSBz
bWFsbCB3aW5kb3cgc2l6ZSB3aWxsIGJlIGFubm91bmNlZCBpbiB0aGUgaGVhZGVyLg0KPiANCj4g
VGhlIG9ubHkgc2NlbmFyaW8gd2hlcmUgdXNpbmcgdGhlIGhhcmQtY29kZWQgbGltaXQgbWFrZXMg
c2Vuc2UgaXMgaW4gYQ0KPiBjYXNlIHRoZSB3aW5kb3cgc2l6ZSBpcyBub3QgYXZhaWxhYmxlIChJ
J20gbm90IHN1cmUgaWYgaXQncyBtYW5kYXRvcnkNCj4gdG8gcHJvdmlkZSBpdCkuIFRoYXQncyBo
b3cgbXkgY29kZSB3b3JrcyAtIGlmIHRoZSBzaXplIGlzIGF2YWlsYWJsZSwNCj4gaXQgdXNlcyB0
aGUgcHJvdmlkZWQgdmFsdWUsIGlmIG5vdCBpdCB1c2VzIDEgPDwgWlNURF9XSU5ET1dMT0dfTUFY
Lg0KPiANCj4gSSB3b3VsZCBhbHNvIGFncmVlIGEgZml4ZWQgbGltaXQgd291bGQgbWFrZSBhIHNl
bnNlIGlmIGEgdXNlciAob3IgbmV0d29yaykNCj4gcHJvdmlkZWQgZGF0YSB3b3VsZCBiZSB1c2Vk
LCBidXQgaW4gdGhpcyBjYXNlIG9ubHkgdGhlIHN5c3RlbSBvd25lciBpcyBhYmxlDQo+IHRvIHBy
b3ZpZGUgYW4gaW5pdHJhbWZzLiBJZiBvbmUgaXMgYWJsZSB0byBjaGFuZ2UgaW5pdHJhbWZzLCBo
ZSBjYW4gcmVuZGVyDQo+IHRoZSBzeXN0ZW0gdW51c2FibGUgc2ltcGx5IGJ5IHByb3ZpZGluZyBh
IGNvcnJ1cHRlZCBmaWxlLiBIZSBkb2Vzbid0IGhhdmUNCj4gdG8gYm90aGVyIG1ha2luZyB0aGUg
d2luZG93IGJpZ2dlciB0aGFuIHRoZSBhdmFpbGFibGUgbWVtb3J5Lg0KPiANCj4+IEkgd291bGQg
ZXhwZWN0IGxhcmdlciB3aW5kb3cgc2l6ZXMgdG8gYmUgYmVuZWZpY2lhbCBmb3IgY29tcHJlc3Np
b24gcmF0aW8sDQo+PiB0aG91Z2ggdGhlcmUgaXMgZGVtaXNpbmcgcmV0dXJucy4gSSB3b3VsZCBl
eHBlY3QgdGhhdCBmb3Iga2VybmVsIGltYWdlDQo+PiBjb21wcmVzc2lvbiBsYXJnZXIgd2luZG93
IHNpemVzIGFyZSBiZW5lZmljaWFsLCBzaW5jZSBpdCBpcyBkZWNvbXByZXNzZWQNCj4+IHdpdGgg
YSBzaW5nbGUgcGFzcy4gRm9yIGluaXRyYW1mcyBkZWNvbXByZXNzaW9uLCBJIHdvdWxkIGV4cGVj
dCB0aGF0IGxpbWl0aW5nDQo+PiB0aGUgd2luZG93IHNpemUgY291bGQgaGVscCBkZWNvbXByZXNz
aW9uIHNwZWVkLCBzaW5jZSBpdCB1c2VzIHN0cmVhbWluZw0KPj4gY29tcHJlc3Npb24sIHNvIHVu
enN0ZCgpIGhhcyB0byBhbGxvY2F0ZSBhIGJ1ZmZlciBvZiB3aW5kb3cgc2l6ZSBieXRlcy4NCj4g
WWVzLCBsYXJnZXIgd2luZG93IGltcHJvdmVzIHRoZSBjb21wcmVzc2lvbiByYXRpbywgc2VlIGhl
cmUgYSBjb21wYXJpc29uDQo+IGJldHdlZW4gbGV2ZWwgMTkgYW5kIDIyIG9uIG15IHRlc3Rpbmcg
eDg2LTY0IGluaXRyYW1mczoNCj4gIDMwNzc1MDIyIHJvb3Rmcy5jcGlvLnpzdC0xOQ0KPiAgMjg3
NTU0Mjkgcm9vdGZzLmNwaW8uenN0LTIyDQo+IFRoZXNlIDclIGNhbiBiZSBub3RpY2VhYmxlIHdo
ZW4gb25lIGhhcyBhIHNsb3cgc3RvcmFnZSwgZS5nLiBhIGZsYXNoIG1lbW9yeQ0KPiBvbiBTUEkg
YnVzLg0KPiANCj4+PiBJIHJlbW92ZWQgdGhhdCBsaW1pdGF0aW9uIHRvIGJlIGFibGUgdG8gdGVz
dCBpdCBpbiBteSBlbnZpcm9ubWVudCBhbmQgSQ0KPj4+IGZvdW5kIHRoZSBwZXJmb3JtYW5jZSBp
cyB3b3JzdCB0aGFuIHdpdGggbXkgcGF0Y2ggYnkgcm91Z2hseSAyMCUgKG9uDQo+Pj4gaTctMzUy
ME0pLCB3aGljaCBpcyBhIG1ham9yIGRyYXdiYWNrIGNvbnNpZGVyaW5nIHRoZSBtYWluIG1vdGl2
YXRpb24NCj4+PiB0byB1c2UgenN0ZCBpcyB0aGUgZGVjb21wcmVzc2lvbiBzcGVlZC4gSSB3aWxs
IHRlc3Qgb24gYXJtIGFzIHdlbGwgYW5kDQo+Pj4gc2hhcmUgdGhlIHJlc3VsdCB0b21vcnJvdy4N
Cj4+PiBQZXRyDQo+PiANCj4+IFdoYXQgZG8geW91IG1lYW4gYnkgdGhhdD8gQ2FuIHlvdSBzaGFy
ZSB3aXRoIG1lIHRoZSB0ZXN0IHlvdSByYW4/DQo+PiBJcyB0aGlzIGZvciBrZXJuZWwgZGVjb21w
cmVzc2lvbiBvciBpbml0cmFtZnMgZGVjb21wcmVzc2lvbj8NCj4gSW5pdHJhbWZzIC0geW91IGNh
biBhcHBseSBteSB2MiBwYXRjaCBvbiB2NS41IGFuZCB0cnkgd2l0aCB5b3VyIHRlc3QgZGF0YS4N
Cj4gDQo+IEkgaGF2ZSB0ZXN0ZWQgeW91ciBwYXRjaCBhbHNvIG9uIEFSTXY3IHBsYXRmb3JtIGFu
ZCB0aGVyZSB0aGUgZGVncmFkYXRpb24NCj4gd2FzIDglLg0KDQpUaGFua3MgYWdhaW4gZm9yIG1l
YXN1cmluZyB0aGUgc3BlZWQgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgdHdvIHBhdGNoc2V0cyEN
CknigJl2ZSBmb3VuZCB0aGF0IHRoZSBkaWZmZXJlbmNlIGluIHBlcmZvcm1hbmNlIGJldHdlZW4g
b3VyIHR3byBwYXRjaHNldHMgaXMNCmNhdXNlZCBieSB0aGUgb3V0cHV0IGJ1ZmZlciBzaXplLiBJ
IGV4cGVjdCB0aGlzIGlzIGR1ZSB0byBjYWxsaW5nIGZsdXNoKCkgbW9yZSBvZnRlbiwNCnNpbmNl
IHRoYXQgaXMgYSBjb21wbGV4IHN0YXRlIG1hY2hpbmUgaW4gaW5pdHJhbWZz4oCZcyB1c2UgY2Fz
ZS4NCg0KSeKAmXZlIG1lYXN1cmVkIHRoZSBzcGVlZCBvZiB0aGlzIHBhdGNoIHNldCAodjMpLCBj
b21wYXJlZCBhZ2FpbnN0IHRoaXMgcGF0Y2ggc2V0DQp3aXRoIGEgMTI4IEtCIGJ1ZmZlciBzaXpl
IChaU1REX0RTdHJlYW1PdXRTaXplKCkpLCB2cyBQZXRy4oCZcyBwYXRjaHNldC4gSeKAmW0NCm1l
YXN1cmluZyBvbiBhbiBJbnRlbCBpOS05OTAwSyB3aXRoIHR1cmJvIGRpc2FibGVkIG9uIENQVSAw
LiBJ4oCZbSBib290aW5nIHRoZQ0Ka2VybmVsIHVzaW5nIFFFTVUuDQoNClRvIG1lYXN1cmUgdGhl
IGluaXRyYW1mcyBkZWNvbXByZXNzaW9uIHNwZWVkIEkgbG9vayBhdCB0aGUgZGlmZmVyZW5jZSBp
biB0aW1lc3RhbXANCmJldHdlZW4g4oCcVW5wYWNraW5nIGluaXRyYW1mc+KApuKAnSBhbmQg4oCc
RnJlZWluZyBpZ25pdGVkIG1lbW9yeeKAnS4gVGhlIGluaXRyYW1mcyBpcw0KY29tcHJlc3NlZCB1
c2luZyBsZXZlbCAxOSwgYnV0IHJlc3VsdHMgZm9yIGxldmVsIDIyIGFyZSBzaW1pbGFyLiBUaW1l
cyBhcmUgcmVwb3J0ZWQNCmluIHNlY29uZHMuIEkgcmFuIGVhY2ggdGVzdCAzIHRpbWVzIGFuZCB0
b29rIHRoZSBtZWRpYW4gdGltZSwgYnV0IHRoZSByZXN1bHRzIGFyZQ0KdmVyeSBzdGFibGUuIE9u
IEFSTSB0aGUgaW5pdHJhbWZzIGlzIDI2IE1CLiBPbiB4ODYtNjQgdGhlIGluaXRyYW1mcyBpcyA5
NyBNQi4NCg0KQXJjaAl2MwkxMjgJUGV0cg0KQXJtCTEuNjcJMS41MgkxLjU1DQp4NjQJMS43Ngkx
LjY5CTEuNjYNCg0KVGhlIHJlc3VsdHMgZm9yIG15IHBhdGNoIGFyZSBzbGlnaHRseSBiZXR0ZXIg
b24gQVJNLCB5b3VycyBhcmUgc2xpZ2h0bHkgYmV0dGVyIG9uIHg4Ni4NCkluIHY0IG9mIG15IHBh
dGNoc2V0LCB3aGljaCBJIHdpbGwgc2VuZCBvdXQgdG9uaWdodCwgSSB3aWxsIGluY3JlYXNlIFpT
VERfSU9CVUZfU0laRQ0KdG8gMTI4IEtCIChhcyB3ZWxsIGFzIHJlbW92ZSB0aGUgOCBNQiB3aW5k
b3cgc2l6ZSBsaW1pdCkuIFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3VyDQpyZXN1bHRzIGFsaWdu
IHdpdGggbWluZSBvbiB2NC4NCg0KSeKAmXZlIGFsc28gbWVhc3VyZWQgdGhlIHg4Nl82NCB6c3Rk
IGtlcm5lbCBkZWNvbXByZXNzaW9uIHNwZWVkIHVzaW5nIG91ciB0d28NCnBhdGNoc2V0cy4gSSBt
ZWFzdXJlZCBpdCBieSB0aGUgdGltaW5nIGJldHdlZW4gdGhlIOKAnERlY29tcHJlc3NpbmcgTGlu
dXjigKbigJ0gbWVzc2FnZQ0KYW5kIHRoZSDigJxQYXJzaW5nIEVMRuKAnSBtZXNzYWdlIHdpdGgg
dGhpcyBzY3JpcHQgWzBdLiBJIHVzZWQgdGhlIHNhbWUgdGVjaG5pcXVlIGZvcg0KbWVhc3VyZW1l
bnQgYXMgYWJvdmUuIFRoZSBrZXJuZWwgSSBhbSB0ZXN0aW5nIGlzIGNvbXByZXNzZWQgYXQgbGV2
ZWwgMTkgd2l0aCBteQ0KcGF0Y2hzZXQgYW5kIGF0IGxldmVsIDE5IHdpdGggYSB3aW5kb3cgc2l6
ZSBvZiA0IE1CIHdpdGggeW91ciBwYXRjaHNldC4NCg0KSSBmb3VuZCB0aGF0IG15IHBhdGNoc2V0
IHRha2VzIDcwbXMgdG8gZGVjb21wcmVzcyBhbmQgeW91cnMgdGFrZXMgMzE4bXMuIFlvdXINCnBh
dGNoc2V0IGFsc28gdXNlcyA0IE1CIG9mIGhlYXAgbWVtb3J5LCB3aGVyZSBtaW5lIG9ubHkgbmVl
ZHMgMTkyIEtCLiBUaGUgZGlmZmVyZW5jZQ0KaXMgY2F1c2VkIGJ5IHR3byB0aGluZ3M6DQoNCjEu
IG1lbWNweSgpIGlzIHJlcGxhY2VkIGJ5IF9fYnVpbHRpbl9tZW1jcHkoKSBpbiBwYXRjaCAxIG9m
IG15IHNldC4gVGhpcyBpcyB0aGUNCiAgICBjb3JlIG9mIHRoZSBkZWNvbXByZXNzaW9uIGhvdCBs
b29wLCBhbmQgd2l0aG91dCBpdCB0aGUgY29tcGlsZXIgY2Fu4oCZdCBpbmxpbmUgbWVtY3B5Lg0K
Mi4gTXkgcGF0Y2hzZXQgY2FsbHMgZGVjb21wcmVzc19zaW5nbGUoKSB3aGVuIG5laXRoZXIgZmx1
c2ggbm9yIGZpbGwgYXJlIHByb3ZpZGVkLA0KICAgIGxpa2Ugd2hlbiBkZWNvbXByZXNzaW5nIHRo
ZSBrZXJuZWwuIFRoaXMgc2F2ZXMgdGhlIDQgTUIgb2YgbWVtb3J5LCBhcyB3ZWxsIGFzDQogICAg
c3BlZWRzIHVwIGRlY29tcHJlc3Npb24gYSBsaXR0bGUgYml0Lg0KDQpCZXN0LA0KTmljayBUZXJy
ZWxsDQoNClswXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS90ZXJyZWxsbi85YmQ1MzMyMWE2Njlm
NjI2ODNjNjA4YWY4OTQ0ZmJjMg==
