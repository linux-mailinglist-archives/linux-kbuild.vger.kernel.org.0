Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D6CD19B4B6
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 19:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732583AbgDARdp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 13:33:45 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:23440 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732279AbgDARdp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 13:33:45 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 031HCAo6002668;
        Wed, 1 Apr 2020 10:33:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=GXl+5FewZrGqUYBV804rKS/dWeyKdoKhb2Ge9vGCCFg=;
 b=RSB2GN2XyHgg5MWZdhmXwceC2iTSysDob39E/+RbO4QH3s+Ujb/zIF5+NqH2aHsiiyoj
 jmfFeU4pnfapcTDWzxeU5HySX1VuhjeJ/Hg9BfShJuaXZVf7TlKwrp8rRrvxABzxg/i9
 jYhw7VdsJK666feNqzPTDwM0UDwT6E4t76Y= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0001303.ppops.net with ESMTP id 304wbb8qt5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 01 Apr 2020 10:33:19 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 1 Apr 2020 10:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKs3d+5yAU0kAzpDNjbDLBGPBnbn8BT/symPVJ0F715PYqlEEZ9VgEnYRadEu0Y/RfsPFdo0C8VNqG1dTjghMYB+PYUq2XIqfv5Iwoe+4/GhyJV+tkTBlTNHEi08Vxk8lLJEISmo5maweTEdzfygcteo1siZjStiNErgH9h+y8mw5n8/NBbno2hjauydOg3e1NW6YH69BJyPFlY3/I7r2hGD9WfOOAUhnpNGXZ6TrmmxQqjnW/V2NBs3DJ7/yTKMywaq7Zfe5f9i8+DNTNXfIcsFy3UN3xhKZ5xXhghmK+HyEH4tfFm/BKupQPQHkj8YhsB7lu0gNEypZC1Q2qODaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXl+5FewZrGqUYBV804rKS/dWeyKdoKhb2Ge9vGCCFg=;
 b=XIcTS55fGd53Dli2BRcJrwRcWkG6VutuTf2ltoDeyF9ujT2IqTLAOF1fo+O59VMs4N5dm5enUldY3lFxu2arDHrzd54nXjNsX2cFZWft5zEw9zvy1xDU34Jk4YRDg3Apzu/F6upCZ4UJpZVIQ1uI8ADF0qUNCTcDEBmPbYnJjHpHHTDckcShK0UWxHSOubnp1LuXGyWSoVwLOawqdfUOP+JdBCogw0YDn9bbpdn8OXkos4YtL4fMkl2vYMCiLpc1JS1ded87SQbuKh86kOWso3ukQPiPYOxuElkSHdOrq91aBYGGcuIB/GxQcy1r9re/JhiYq9jWAibmyUTmNmlK2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXl+5FewZrGqUYBV804rKS/dWeyKdoKhb2Ge9vGCCFg=;
 b=KNAn60N2J42p59R6XXNSiXfx5WeGtsXjTp1tYL30SD4qhT4Yt2LJdXCaR/TKTcy8Lwo9AMhpm+pF0ZRfv6SP+iiLKkF+Y4L7Qvd8JlXRpvhU4tYAzWrg8nNF4UlliSTkgSx/plPz1QVh226kcQORwSyPMBTg+A7LXgpw0NUSYTA=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB4012.namprd15.prod.outlook.com (2603:10b6:303:47::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Wed, 1 Apr
 2020 17:33:03 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 17:33:03 +0000
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
Thread-Index: AQHWB+fltnCxU040x0+5fVIQqY0UGKhkAU0AgACGEwA=
Date:   Wed, 1 Apr 2020 17:33:03 +0000
Message-ID: <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
 <20200401093310.GA13748@zn.tnic>
In-Reply-To: <20200401093310.GA13748@zn.tnic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [73.222.55.223]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 615cf14d-c6c2-497b-50c4-08d7d662bb5a
x-ms-traffictypediagnostic: MW3PR15MB4012:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB401291A5343E7506288AD7C4ABC90@MW3PR15MB4012.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3753.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(346002)(136003)(39860400002)(366004)(376002)(6506007)(5660300002)(4326008)(36756003)(8936002)(2906002)(33656002)(6916009)(6512007)(54906003)(316002)(2616005)(81156014)(66946007)(6486002)(64756008)(71200400001)(91956017)(26005)(66476007)(53546011)(186003)(7416002)(81166006)(478600001)(76116006)(66446008)(86362001)(66556008)(8676002)(21314003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wms/TCWzQHZSUgINn/8uv94/NTOUPwzxo0N9TV9N6A/TxscBzZAK3oD7aVQu7qUqoYMcmG0qYwkxp2pAXxwB6jvfG/m5KZZhUY6h9/B5ynpU1oMN54sOrR8a6Bk1y1boEBcldQWAgS56c92jgYaaflBdPsFjgtiB9ueviQy5/b+G4xQL8J9OUMOgLt5sackJhTp4UqxCNndLSx4myzVcgOCQbBujylF7W4RcobpKSlCIHcwneLhINYB1bT9DHPSSpB+PRWyjzxQk/TXN+vqDk9rNiaOMFtHSamKMYlA+2x1qqqFfrXvY9UMd72buXRcF46NEZHDPru1bSw1U7wq0WW8NIYIMR7el8F8Bn+ZiH/PXDOXsLsMGmftkgL8klCZvAa6Bp2bHARIJko2Q5d1wHnquhWGyEkueBqBHm7WJ4MvhCPiVUiO3l1JV1Cf+uoMMN/KXQ+KprTIG6cbkTeRl+2GlMtbKdyl4agBPy+U5zMRoa3NeRcp9lGBllYObOOpc
x-ms-exchange-antispam-messagedata: o3wAig5XgNdNxiOpsqe23lgyeCGb7A9QZ1gwzub3noo6Rb4EFWAlbpX7Ee/sbOyqoaEtlstGAcS40EMimwON+XtDqeO7F1hp3IB90kfyLG4419lic1G0ZQR5CVCbyhShuUb2/ueRXI70b25ocl02yw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC898B513727BF4F9F52406FBEF90360@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 615cf14d-c6c2-497b-50c4-08d7d662bb5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 17:33:03.2760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fXlvPwsgLaLZd1z3cxbNzyj7gerAjca/p+K9+v8PQocZkEpxj9ij0uY0kDcJj9Q5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4012
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-01_03:2020-03-31,2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010147
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gQXByIDEsIDIwMjAsIGF0IDI6MzMgQU0sIEJvcmlzbGF2IFBldGtvdiA8YnBAYWxp
ZW44LmRlPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDEwOjM5OjExUE0g
LTA3MDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+IEZyb206IE5pY2sgVGVycmVsbCA8dGVycmVs
bG5AZmIuY29tPg0KPj4gDQo+PiBCdW1wIHRoZSBaT196X2V4dHJhX2J5dGVzIG1hcmdpbiBmb3Ig
enN0ZC4NCj4+IA0KPj4gWnN0ZCBuZWVkcyAzIGJ5dGVzIHBlciAxMjggS0IsIGFuZCBoYXMgYSAy
MiBieXRlIGZpeGVkIG92ZXJoZWFkLg0KPj4gWnN0ZCBuZWVkcyB0byBtYWludGFpbiAxMjggS0Ig
b2Ygc3BhY2UgYXQgYWxsIHRpbWVzLCBzaW5jZSB0aGF0IGlzDQo+PiB0aGUgbWF4aW11bSBibG9j
ayBzaXplLiBTZWUgdGhlIGNvbW1lbnRzIHJlZ2FyZGluZyBpbi1wbGFjZQ0KPj4gZGVjb21wcmVz
c2lvbiBhZGRlZCBpbiBsaWIvZGVjb21wcmVzc191bnpzdGQuYyBmb3IgZGV0YWlscy4NCj4+IA0K
Pj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPg0KPj4gVGVz
dGVkLWJ5OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogTmljayBUZXJyZWxsIDx0ZXJyZWxsbkBmYi5jb20+DQo+PiAtLS0NCj4+IGFyY2gveDg2
L2Jvb3QvaGVhZGVyLlMgfCA4ICsrKysrKystDQo+PiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9ib290
L2hlYWRlci5TIGIvYXJjaC94ODYvYm9vdC9oZWFkZXIuUw0KPj4gaW5kZXggOTdkOWI2ZDZjMWFm
Li5iODIwODc1YzVjOTUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3g4Ni9ib290L2hlYWRlci5TDQo+
PiArKysgYi9hcmNoL3g4Ni9ib290L2hlYWRlci5TDQo+PiBAQCAtNTM2LDggKzUzNiwxNCBAQCBw
cmVmX2FkZHJlc3M6CQkucXVhZCBMT0FEX1BIWVNJQ0FMX0FERFIJIyBwcmVmZXJyZWQgbG9hZCBh
ZGRyDQo+PiAjIHRoZSBzaXplLWRlcGVuZGVudCBwYXJ0IG5vdyBncm93cyBzbyBmYXN0Lg0KPj4g
Iw0KPj4gIyBleHRyYV9ieXRlcyA9ICh1bmNvbXByZXNzZWRfc2l6ZSA+PiA4KSArIDY1NTM2DQo+
PiArIw0KPj4gKyMgWlNURCBjb21wcmVzc2VkIGRhdGEgZ3Jvd3MgYnkgYXQgbW9zdCAzIGJ5dGVz
IHBlciAxMjhLLCBhbmQgb25seSBoYXMgYSAyMg0KPj4gKyMgYnl0ZSBmaXhlZCBvdmVyaGVhZCBi
dXQgaGFzIGEgbWF4aW11bSBibG9jayBzaXplIG9mIDEyOEssIHNvIGl0IG5lZWRzIGENCj4+ICsj
IGxhcmdlciBtYXJnaW4uDQo+PiArIw0KPj4gKyMgZXh0cmFfYnl0ZXMgPSAodW5jb21wcmVzc2Vk
X3NpemUgPj4gOCkgKyAxMzEwNzINCj4+IA0KPj4gLSNkZWZpbmUgWk9fel9leHRyYV9ieXRlcwko
KFpPX3pfb3V0cHV0X2xlbiA+PiA4KSArIDY1NTM2KQ0KPj4gKyNkZWZpbmUgWk9fel9leHRyYV9i
eXRlcwkoKFpPX3pfb3V0cHV0X2xlbiA+PiA4KSArIDEzMTA3MikNCj4+ICNpZiBaT196X291dHB1
dF9sZW4gPiBaT196X2lucHV0X2xlbg0KPj4gIyBkZWZpbmUgWk9fel9leHRyYWN0X29mZnNldAko
Wk9fel9vdXRwdXRfbGVuICsgWk9fel9leHRyYV9ieXRlcyAtIFwNCj4+IAkJCQkgWk9fel9pbnB1
dF9sZW4pDQo+PiAtLSANCj4gDQo+IFNvIHdoeSBpcyB0aGlzIGNoYW5nZSB1bmNvbmRpdGlvbmFs
IGlmIG9ubHkgdGhpcyBjb21wcmVzc2lvbiBhbGcuIG5lZWRzDQo+IGl0Pw0KDQpUaGUgY29kZSBp
cyBjdXJyZW50bHkgd3JpdHRlbiBzbyB0aGF0IGFsbCB0aGUgY29tcHJlc3Npb24gYWxnb3JpdGht
cyB1c2UgdGhlDQpzYW1lIFpPX3pfZXh0cmFfYnl0ZXMuIEl0IGlzIHRha2VuIHRvIGJlIHRoZSBt
YXhpbXVtIG9mIHRoZSBncm93dGggcmF0ZQ0KcGx1cyB0aGUgbWF4aW11bSBmaXhlZCBvdmVyaGVh
ZC4gSnVzdCBhIGZldyBsaW5lcyBhYm92ZSBpcyB0aGUgY29tbWVudDoNCg0KIyDigKYgSGVuY2Ug
c2FmZXR5DQojIG1hcmdpbiBzaG91bGQgYmUgdXBkYXRlZCB0byBjb3ZlciBhbGwgZGVjb21wcmVz
c29ycyBzbyB0aGF0IHdlIGRvbid0DQojIG5lZWQgdG8gZGVhbCB3aXRoIGVhY2ggb2YgdGhlbSBz
ZXBhcmF0ZWx5LiBQbGVhc2UgY2hlY2sNCiMgdGhlIGRlc2NyaXB0aW9uIGluIGxpYi9kZWNvbXBy
ZXNzb3JfeHh4LmMgZm9yIHNwZWNpZmljIGluZm9ybWF0aW9uLg0KDQpTbyBJIHdhcyBiZWVuIGZv
bGxvd2luZyB0aGUgZ3VpZGFuY2UgaW4gdGhlIGNvbW1lbnRzLiBJZiB3ZSB3YW50IHRvIHJlZmFj
dG9yDQppdCB0byBoYW5kbGUgZWFjaCBjb21wcmVzc29yIGluZGl2aWR1YWxseSB3ZSBjb3VsZCBt
YWtlIFpPX3pfZXh0cmFfYnl0ZXMNCnNtYWxsZXIgZm9yIG1vc3QgYWxnb3JpdGhtcy4NCg0KRG9l
cyBpdCBtYXR0ZXI/IEnigJltIG5vdCBhbiBleHBlcnQgaGVyZSwgYnV0IGl0IHNlZW1zIHRvIG1l
IHRoYXQgcmVxdWlyaW5nIGFuDQpleHRyYSA2NCBLQiBvZiBSQU0gZm9yIGtlcm5lbCBkZWNvbXBy
ZXNzaW9uIGlzbuKAmXQgc3VjaCBhbiBvbmVyb3VzIGFkZGl0aW9uLg0KDQpCZXN0LA0KTmljaw0K
DQo=
