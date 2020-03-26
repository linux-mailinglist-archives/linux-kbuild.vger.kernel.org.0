Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 322EF194B04
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 22:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgCZV7O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 17:59:14 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:49936 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726260AbgCZV7O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 17:59:14 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02QLuO8a012424;
        Thu, 26 Mar 2020 14:59:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=btULhVNZ+FcsHMbgEadVs6xowHHuhCtXKovdGRDiq1M=;
 b=q0DrcVUnhBSzM8m5LOl+eo8D7V9kbdP7SLJvCwgYYRh5eVj9DAoPVUeDUSlH6scoQw95
 JHQ2FRkLCNIF9qVOh+ky4flBPjRgFaEaoKlzmBAlYnX409loVMO7Ben8Ich6+vXUiwSB
 0SlzPIjokkHhQmEEf+Z244j0BRU514Y6Z4Q= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3010021pq8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 26 Mar 2020 14:59:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 26 Mar 2020 14:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPvThokSx1rcLvpfsoCBClxFfy6rKgwM90XzM9M+ZQd7TPXY//cRpByrpmTq7WkOKxUyQmPkiAO2e32/d4C+jz56LvvR4CZxl0EXIUF6By8jwvGCuvE+oBpdP23dgqeSCO3DAXlFblRQkl7xX9PqyGEGvyIFz0IwSJkdCqzJ1JijCzBHFByCVHB4oKrS5uSadc3FE60DzR9OK9a3KKQAjdhS8gt/iD+MMFwQbPK5elXYjy3/GSh/SAKyPK7bEoRghzfciBjltDAPalbYUjBy00Jh+jnPWsyO9O0G8Ongt4SzGucb/wydsVVJ5KIASqMth9pAV1ZBcM4NnwS/8G/+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btULhVNZ+FcsHMbgEadVs6xowHHuhCtXKovdGRDiq1M=;
 b=jvjNlcEjOupfDeSD04vE2mnh+Amjp58jZYElpuPZevTVotNhcwbqKGsOqO2MqHRL7uNNCpB8e4YKFkFN9A9fFnmFGR+raO5dnvMtXEgXPYkaGQCByHv1yCUq086dgmZeV4PCNHF1yxgLL5dXYijlBOKORKHXPyzE6d49CfuSoKqDknUl0XtcooU985YusVKVdEcXbnmLRlEOS1cdhnzF0Hcx+3u+A30oO+IDgZ2OMRd8q2bO0nRYw98o4kNZh6NMzcsIhmcgUEWQzVgjyv1eapBPxUWpw10lOl6He5ggEriaPalx4hXLE0rLuRcbomMkK66JAN+1iO3iTLYCptxPCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btULhVNZ+FcsHMbgEadVs6xowHHuhCtXKovdGRDiq1M=;
 b=M6qFnMshS3ilokIBwA/WcmvmZp81GaarArA0Zb51O5MNxM1kvMCR0SByMMjosrUl9Na/XnhWEMZeGhGrzc/BokqqHItRxVkxM52xYF0cWU1PXyEBx+g0fRBQ+DIYQwpRlJod996fhGn3vI2vurMeSzsA32IA5ytVhdoNXgATMEE=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3884.namprd15.prod.outlook.com (2603:10b6:303:42::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Thu, 26 Mar
 2020 21:58:59 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 21:58:59 +0000
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
Thread-Index: AQHWAt/m23+sZPjy5kGvzHRfaAnHI6hbFrwAgAAmGgCAABROAIAAEAIAgAAIgoCAAAQZgA==
Date:   Thu, 26 Mar 2020 21:58:59 +0000
Message-ID: <48A06739-A73B-4AE3-80A2-3F490B78404B@fb.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-4-nickrterrell@gmail.com>
 <20200326164732.GA17157@ntb.petris.klfree.czf>
 <611A224B-1CB3-4283-9783-87C184C8983A@fb.com>
 <20200326201634.GA9948@ntb.petris.klfree.czf>
 <ED5FFEDC-A3B7-470E-95AE-B60EB1E6AE64@fb.com>
 <20200326214419.GA13249@ntb.petris.klfree.czf>
In-Reply-To: <20200326214419.GA13249@ntb.petris.klfree.czf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [67.188.225.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 162c8664-c840-4af8-8b3d-08d7d1d0e3af
x-ms-traffictypediagnostic: MW3PR15MB3884:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB3884B23BED671B96D2095BF5ABCF0@MW3PR15MB3884.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(136003)(346002)(396003)(66476007)(91956017)(6506007)(33656002)(26005)(76116006)(66556008)(4326008)(6916009)(36756003)(53546011)(66946007)(64756008)(66446008)(86362001)(7416002)(54906003)(6486002)(71200400001)(81166006)(8936002)(81156014)(6512007)(5660300002)(2906002)(316002)(2616005)(8676002)(478600001)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:MW3PR15MB3884;H:MW3PR15MB3753.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zELHJzu+QVxXymu3Jm+pWYwn4RmVwUMnwAccEwRk75YN7CLAzT3tWBsogzJybjCJHLQZ/uGyH39mu2wSOyGteKWxtyEcFELRRfiuEYAUrkgHYM3nZiHbk6QqmmqNl9jYIJv6G6deNt1NNwf8Hxdj5dXW2eKDXuIEOJxevVxzgKJAH5VkiRlp7uElEFcEX9XWcdw/wZ1uQTvdr5e6avprcXcJU5zIkpiK/r25yPm/Nu5tDSxIHdiNW3u3GSGlHXbJpvkAxzyfnrSxuh9y3maEc8PZya6u3v+tdzetColBXPlu6Qo3FpE7/mnxLO4NIRDBL5GmZPwCkVHgGbwM84ZwOIEBF5C6WaeuzmPV3ijjXr8Qus3gXCliF9dJym5hdnDoKDd1Ynq2SYtCGJOg9mRHaWE+m6edxBm13K/kmms6+7/0t9c4E+WBmvVZVZqbTilJ
x-ms-exchange-antispam-messagedata: PRNo3QxOu2fofxCpITaIwGMs1bCuUrzULHwI7pjlrRCccgGR46SCbsKyocFyspjiY4EVNW9sohpT4XS0zaR/89zU7Lq9EwTS0ZFlnz214wR0/WrXKYaVqWPRjFDFy59itsV9pjAiZUej0GTfBxzv6w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <062C362D7CFD85429D95828EDC6128A8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 162c8664-c840-4af8-8b3d-08d7d1d0e3af
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 21:58:59.8354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t26e8yNQAe8srUP6ylPXQ3NrkOfcof7QWHfFGn57i9kEzN4ePSjJeH8jPoUVFZ+6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3884
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-26_13:2020-03-26,2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 adultscore=0
 mlxlogscore=849 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260160
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gTWFyIDI2LCAyMDIwLCBhdCAyOjQ0IFBNLCBQZXRyIE1hbGF0IDxvc3NAbWFsYXQu
Yml6PiB3cm90ZToNCj4gDQo+IE9uIFRodSwgTWFyIDI2LCAyMDIwIGF0IDA5OjEzOjU0UE0gKzAw
MDAsIE5pY2sgVGVycmVsbCB3cm90ZToNCj4+Pj4gV2hhdCBkbyB5b3UgbWVhbiBieSB0aGF0PyBD
YW4geW91IHNoYXJlIHdpdGggbWUgdGhlIHRlc3QgeW91IHJhbj8NCj4+Pj4gSXMgdGhpcyBmb3Ig
a2VybmVsIGRlY29tcHJlc3Npb24gb3IgaW5pdHJhbWZzIGRlY29tcHJlc3Npb24/DQo+Pj4gSW5p
dHJhbWZzIC0geW91IGNhbiBhcHBseSBteSB2MiBwYXRjaCBvbiB2NS41IGFuZCB0cnkgd2l0aCB5
b3VyIHRlc3QgZGF0YS4NCj4+PiANCj4+PiBJIGhhdmUgdGVzdGVkIHlvdXIgcGF0Y2ggYWxzbyBv
biBBUk12NyBwbGF0Zm9ybSBhbmQgdGhlcmUgdGhlIGRlZ3JhZGF0aW9uDQo+Pj4gd2FzIDglLg0K
Pj4gDQo+PiBBcmUgeW91IGNvbXBhcmluZyB0aGUgcGVyZm9ybWFuY2Ugb2YgYW4gOCBNQiB3aW5k
b3cgc2l6ZSB2cyBhIDEyOCBNQg0KPj4gd2luZG93IHNpemU/DQo+IE5vLCBJIHVzZSB0aGUgc2Ft
ZSBpbml0cmFtZnMgZmlsZSB3aXRoIDIgZGlmZmVyZW50IGtlcm5lbHMgZm9yIHRoZSB0ZXN0LiBJ
IGhhdmUNCj4gcmVtb3ZlZA0KPiAgaWYgKHBhcmFtcy53aW5kb3dTaXplID4gWlNURF9XSU5ET1dT
SVpFX01BWCkgZ290byBvdXQ7DQo+IGZyb20geW91ciBjb2RlLg0KDQpUaGFua3MgZm9yIHRoZSBj
bGFyaWZpY2F0aW9uLiBJIHdpbGwgdHJ5IHRvIHJlcHJvZHVjZSB0aGUgc3BlZWQgZGlmZmVyZW5j
ZSB5b3XigJl2ZQ0KbWVhc3VyZWQgYmVmb3JlIHN1Ym1pdHRpbmcgdjQgKHRoYXQgZGVsZXRlcyB0
aGUgd2luZG93U2l6ZSBib3VuZCkuDQoNCkluaXRyYW1mcyBwYXNzZXMgdGhlIHdob2xlIGlucHV0
IGJ1ZmZlciAoZG9lc27igJl0IHVzZSBmaWxsKSwgYnV0IGRvZXMgdXNlIGZsdXNoLg0KWnN0ZCBh
bHdheXMgZGVjb21wcmVzc2VzIGludG8gYW4gaW50ZXJuYWwgYnVmZmVyLCB0aGVuIGNvcGllcyBp
bnRvIHRoZQ0KWlNURF9vdXRCdWZmZXIuIFRoYXQgbWVhbnMgdGhlIG9ubHkgZnVuY3Rpb25hbCBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3bw0KdmVyc2lvbnMgZm9yIGluaXRyYW1mcyBzaG91bGQg
YmUgdGhhdCBJIHdpbGwgY2FsbCBmbHVzaCgpIDQgS0IgYXQgYSB0aW1lLCBhbmQgeW91DQpjYWxs
IGZsdXNoIDEyOCBLQiBhdCBhIHRpbWUuIE5haXZlbHkgSSB3b3VsZG7igJl0IGV4cGVjdCB0aGlz
IHRvIG1hdHRlciB0b28gbXVjaCwNCmJ1dCBJIHdpbGwgbWVhc3VyZS4NCg0KQmVzdCwNCk5pY2s=
