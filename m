Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E3D194A51
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 22:14:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbgCZVOv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 17:14:51 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:36700 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727606AbgCZVOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 17:14:51 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02QLDCQP020756;
        Thu, 26 Mar 2020 14:14:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=cJYxvRqK5l5Q/ZS3jLKksXa0JqOqObo7pnAPSdQxHJ0=;
 b=VEGwIA2u81Eh4rEhvlzG2W8zw3r4K0/FWLovTAjJ1OL9yHyrxJR3wq/zuAOwePt+XOu0
 DdiZn21trFQvEkqox0QrC9CVND/zSidqL0xvl7ixLlGmOhzQECDxDOMaDNKTmtBY3rpV
 S17Nv/m+AR4Fk6OCXho8rU8Wo71sBA4FlWc= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3010021gpd-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 26 Mar 2020 14:14:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 26 Mar 2020 14:14:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbqCbY3Rz5mVSqi/8XiDskvdu8Hxnb3mVj/NQbXVeXWLSvObnDRVa9kzMb1Bk36uDSzHFWTJBfJcZwLMb/M1MT1qqCAWGjEUesQ3BJOqKJHxGvfjJrSyYYKPWXn8k0FXOKj4gCZBrSGa/tqp1wX+KQpgN93oqDfc7bNz9oIBMJDD49GQvtI/nspPn55AVbbAWCQJJFcO7fUHc+1FEm/jvESCoWUE95x9D3iTYYl1RAJITsKNk2PHODfUeLst9SncuULqo0/6iRlEdmR5xO1dHwCsLFxdFrHGogzpxuKxVy+DBeF+gVLV8uU6NHsfUj1eF0en6SJsuhE005EXWoOWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJYxvRqK5l5Q/ZS3jLKksXa0JqOqObo7pnAPSdQxHJ0=;
 b=CMPZRLMHgzXhnxq29JBasORiPCPQftAc7UT011MDLZ3hEZRk9sjp0l7FJZZcUG9MhEwTLNeVhcAoIAFNNIEd6qCkiBrFCw53l5tNLLTDdZgAR3EGbv1BmDti98yw5U9LXBxJBL9gzWu8RAjd3EJH1W45vDpx7YmQxtAQMmcdXfbM0KExzJAA6NBUyAja37naUNHOaTqDgsc8q/yXUazH22U8VqsLHucca2JXfHKouO5+/86podm7+4yonNzduhIuZVMNsJRJWOGcxfGwtVPdfE/cnn4Z6Hf9RYnikp0qNg4Abf9Hd1G9vpxnPHuHCE0Ie19g6nR0QxxULMddE0PDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJYxvRqK5l5Q/ZS3jLKksXa0JqOqObo7pnAPSdQxHJ0=;
 b=PhywvB+foclmb/TWimo1RyvZLGY3dHcYY+pWplY3JQJxAWKn6BL7eus3aSU557E/bmruvpq0UFWvZYCI7ciStYyLzaAP3kqj4P2BuCkM2Wa0qm0vBVpzus4Ny7gd91Vw+EnQAaxSLXtcEbT+FlhV7H+ggC+Mf8j20qyYdXgby1s=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3898.namprd15.prod.outlook.com (2603:10b6:303:43::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Thu, 26 Mar
 2020 21:13:54 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Thu, 26 Mar 2020
 21:13:54 +0000
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
Thread-Index: AQHWAt/m23+sZPjy5kGvzHRfaAnHI6hbFrwAgAAmGgCAABROAIAAEAIA
Date:   Thu, 26 Mar 2020 21:13:54 +0000
Message-ID: <ED5FFEDC-A3B7-470E-95AE-B60EB1E6AE64@fb.com>
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
x-originating-ip: [67.188.225.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c2adac1-b8ae-4b1e-84e1-08d7d1ca9719
x-ms-traffictypediagnostic: MW3PR15MB3898:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB3898A8F1287EA9FC4213C5CDABCF0@MW3PR15MB3898.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0354B4BED2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(396003)(39860400002)(346002)(376002)(2616005)(66476007)(6506007)(8676002)(478600001)(66556008)(66446008)(76116006)(64756008)(71200400001)(8936002)(91956017)(81166006)(81156014)(53546011)(6512007)(66946007)(6486002)(5660300002)(316002)(33656002)(6916009)(26005)(36756003)(86362001)(186003)(54906003)(7416002)(2906002)(4326008)(343044003);DIR:OUT;SFP:1102;SCL:1;SRVR:MW3PR15MB3898;H:MW3PR15MB3753.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q6uWSAS7hqK/CZQbT2jVZA17jsKnZ6OxgLeL0z+gHaC7GvhnAbJcnEi/seIZ3OMCHvKu8AbC+daDHsKmVw7yic38QfLyWhmsNbB9SMrgdxCOolqb0MiTDovXIg/8uaY/XZ2nbOAhOz2nX6rOjP2XAhp3LxSEgdOROg+i6/g4Sg1YebQe1e40UUhzrZVPoAwj+JP1w1p1bRjLjNHz8lD3Dj3oDXyipTETYtLhvMBR/bL1yHhitJN5lj6iBKiE+id/aJSG8A9CB2ELy73PcUPRJKG2NB6yA1whCAXOV4xzWbCUvSFHnfC8SlA+I0pCxKDtzjH1m5plU3sEj16JaCyLtlaNt+r54x4rOLnKFd2eOwwkd7u0F/cp5oDzDS1ejWbUfA8lL1UqzoxiCkoPHoqZk8xCo7Ph6+8q5wy10BwVAEgsShTxVAyX47Yr3yuH/rfJPUV+A9dHGK7YAkxPklgYZJ3AuVLJzcdn16+pJWMy145CcoPKL+OCx1RkxJ8kHZmt
x-ms-exchange-antispam-messagedata: kR7hrLheBPGQ22g6BikrtQiyrRZVhm0zh1W54aCCsdi3HFuMcuCczktJN4K/8bbEgpEhqS4nc2oBKRIuLwd2fkc2m1zPbUaAuMKGZ3s0n+o5tZpe0pFnsIAmKN8oe3jWrMDl2Q13SEn3GcKYR7LgGQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <20D121B17023F949B1351E412714FE51@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2adac1-b8ae-4b1e-84e1-08d7d1ca9719
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2020 21:13:54.3680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i9oAQ47EWejs7o36IbeESq8/qj6qxjUbqi4X9bgA58N3WwxksNwlh/Dj0kczc8Fr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3898
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-26_13:2020-03-26,2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 adultscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003260154
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gTWFyIDI2LCAyMDIwLCBhdCAxOjE2IFBNLCBQZXRyIE1hbGF0IDxvc3NAbWFsYXQu
Yml6PiB3cm90ZToNCj4gDQo+IEhpIQ0KPiBPbiBUaHUsIE1hciAyNiwgMjAyMCBhdCAwNzowMzo1
NFBNICswMDAwLCBOaWNrIFRlcnJlbGwgd3JvdGU6DQo+Pj4+ICogQWRkIHVuenN0ZCgpIGFuZCB0
aGUgenN0ZCBkZWNvbXByZXNzIGludGVyZmFjZS4NCj4+PiBIZXJlIEkgZG8gbm90IHVuZGVyc3Rh
bmQgd2h5IHlvdSBsaW1pdCB0aGUgd2luZG93IHNpemUgdG8gOE1CIGV2ZW4gd2hlbg0KPj4+IHlv
dSByZWFkIGEgbGFyZ2VyIHZhbHVlIGZyb20gdGhlIGhlYWRlci4gSSBkbyBub3Qgc2VlIGEgcmVh
c29uIHdoeSB0aGVyZQ0KPj4+IHNob3VsZCBiZSBzdWNoIGEgbGltaXRhdGlvbiBhdCB0aGUgZmly
c3QgcGxhY2UgYW5kIGlmIHRoZXJlIHNob3VsZCBiZSwNCj4+PiB3aHkgaXQgZGlmZmVycyBmcm9t
IFpTVERfV0lORE9XTE9HX01BWC4NCj4+IA0KPj4gV2hlbiB3ZSBhcmUgZG9pbmcgc3RyZWFtaW5n
IGRlY29tcHJlc3Npb24gKGVpdGhlciBmbHVzaCBvciBmaWxsIGlzIHByb3ZpZGVkKQ0KPj4gd2Ug
aGF2ZSB0byBhbGxvY2F0ZSBtZW1vcnkgcHJvcG9ydGlvbmFsIHRvIHRoZSB3aW5kb3cgc2l6ZS4g
V2Ugd2FudCB0bw0KPj4gYm91bmQgdGhhdCBtZW1vcnkgc28gd2UgZG9uJ3QgYWNjaWRlbnRhbGx5
IGFsbG9jYXRlIHRvbyBtdWNoIG1lbW9yeS4NCj4+IFdoZW4gd2UgYXJlIGRvaW5nIGEgc2luZ2xl
LXBhc3MgZGVjb21wcmVzc2lvbiAobmVpdGhlciBmbHVzaCBub3IgZmlsbA0KPj4gYXJlIHByb3Zp
ZGVkKSB0aGUgd2luZG93IHNpemUgZG9lc24ndCBtYXR0ZXIsIGFuZCB3ZSBvbmx5IGhhdmUgdG8g
YWxsb2NhdGUNCj4+IGEgZml4ZWQgYW1vdW50IG9mIG1lbW9yeSB+MTkyIEtCLg0KPj4gDQo+PiBU
aGUgenN0ZCBzcGVjIFswXSBzcGVjaWZpZXMgdGhhdCBhbGwgZGVjb2RlcnMgc2hvdWxkIGFsbG93
IHdpbmRvdyBzaXplcw0KPj4gdXAgdG8gOCBNQi4gQWRkaXRpb25hbGx5LCB0aGUgenN0ZCBDTEkg
d29uJ3QgcHJvZHVjZSB3aW5kb3cgc2l6ZXMgZ3JlYXRlcg0KPj4gdGhhbiA4IE1CIGJ5IGRlZmF1
bHQuIFRoZSB3aW5kb3cgc2l6ZSBpcyBjb250cm9sbGVkIGJ5IHRoZSBjb21wcmVzc2lvbg0KPj4g
bGV2ZWwsIGFuZCBjYW4gYmUgZXhwbGljaXRseSBzZXQuDQo+IFllcywgb25lIG5lZWRzIHRvIHBh
c3MgLS11bHRyYSBvcHRpb24gdG8genN0ZCB0byBwcm9kdWNlIGFuIGluY29tcGF0aWJsZQ0KPiBh
cmNoaXZlLCBidXQgdGhhdCBkb2Vzbid0IGp1c3RpZnkgdGhlIHJlYXNvbiB0byBsaW1pdCB0aGlz
IGluIHRoZSBrZXJuZWwsDQo+IGVzcGVjaWFsbHkgaWYgb25lIGlzIGFibGUgdG8gcmVhZCB0aGUg
bmVlZGVkIHdpbmRvdyBzaXplIGZyb20gdGhlIGhlYWRlcg0KPiB3aGVuIGFsbG9jYXRpbmcgdGhl
IG1lbW9yeS4gQXQgdGhlIHRpbWUgd2hlbiBpbml0cmFtZnMgaXMgZXh0cmFjdGVkLA0KPiB0aGVy
ZSB1c3VhbGx5IGlzIG1lbW9yeSBhdmFpbGFibGUgYXMgaXQncyBiZWZvcmUgYW55IHByb2Nlc3Nl
cyBhcmUNCj4gc3RhcnRlZCBhbmQgdGhpcyBtZW1vcnkgaXMgcmVjbGFpbWVkIGFmdGVyIHRoZSBk
ZWNvbXByZXNzaW9uLg0KDQpJ4oCZbSBoYXBweSB0byBpbmNyZWFzZSB0aGlzIGxpbWl0LiBJIHNl
dCBpdCB0byA4IE1CIHRvIGJlIGNvbnNlcnZhdGl2ZSwgYnV0IEkgYW0NCmhhcHB5IHRvIGluY3Jl
YXNlIGl0IHRvIDEyOCBNQiA9PSAxIDw8IFpTVERfV0lORE9XTE9HX01BWC4gSSB3aWxsDQpzdWJt
aXQgYSBuZXcgdmVyc2lvbiB3aXRoIHRoYXQgY2hhbmdlLg0KDQo+IElmLCBvbiB0aGUgb3RoZXIg
aGFuZCwgYW4gdXNlciBtYWtlcyBhbiBpbml0cmFtZnMgZm9yIGEgbWVtb3J5IGNvbnN0cmFpbmVk
DQo+IHN5c3RlbSwgaGUgbGltaXRzIHRoZSB3aW5kb3cgc2l6ZSB3aGlsZSBjb21wcmVzc2luZyB0
aGUgYXJjaGl2ZSBhbmQNCj4gdGhlIHNtYWxsIHdpbmRvdyBzaXplIHdpbGwgYmUgYW5ub3VuY2Vk
IGluIHRoZSBoZWFkZXIuDQo+IA0KPiBUaGUgb25seSBzY2VuYXJpbyB3aGVyZSB1c2luZyB0aGUg
aGFyZC1jb2RlZCBsaW1pdCBtYWtlcyBzZW5zZSBpcyBpbiBhDQo+IGNhc2UgdGhlIHdpbmRvdyBz
aXplIGlzIG5vdCBhdmFpbGFibGUgKEknbSBub3Qgc3VyZSBpZiBpdCdzIG1hbmRhdG9yeQ0KPiB0
byBwcm92aWRlIGl0KS4gVGhhdCdzIGhvdyBteSBjb2RlIHdvcmtzIC0gaWYgdGhlIHNpemUgaXMg
YXZhaWxhYmxlLA0KPiBpdCB1c2VzIHRoZSBwcm92aWRlZCB2YWx1ZSwgaWYgbm90IGl0IHVzZXMg
MSA8PCBaU1REX1dJTkRPV0xPR19NQVguDQo+IA0KPiBJIHdvdWxkIGFsc28gYWdyZWUgYSBmaXhl
ZCBsaW1pdCB3b3VsZCBtYWtlIGEgc2Vuc2UgaWYgYSB1c2VyIChvciBuZXR3b3JrKQ0KPiBwcm92
aWRlZCBkYXRhIHdvdWxkIGJlIHVzZWQsIGJ1dCBpbiB0aGlzIGNhc2Ugb25seSB0aGUgc3lzdGVt
IG93bmVyIGlzIGFibGUNCj4gdG8gcHJvdmlkZSBhbiBpbml0cmFtZnMuIElmIG9uZSBpcyBhYmxl
IHRvIGNoYW5nZSBpbml0cmFtZnMsIGhlIGNhbiByZW5kZXINCj4gdGhlIHN5c3RlbSB1bnVzYWJs
ZSBzaW1wbHkgYnkgcHJvdmlkaW5nIGEgY29ycnVwdGVkIGZpbGUuIEhlIGRvZXNuJ3QgaGF2ZQ0K
PiB0byBib3RoZXIgbWFraW5nIHRoZSB3aW5kb3cgYmlnZ2VyIHRoYW4gdGhlIGF2YWlsYWJsZSBt
ZW1vcnkuDQoNClRoYXQgbWFrZXMgc2Vuc2UgdG8gbWUuDQoNCj4+IEkgd291bGQgZXhwZWN0IGxh
cmdlciB3aW5kb3cgc2l6ZXMgdG8gYmUgYmVuZWZpY2lhbCBmb3IgY29tcHJlc3Npb24gcmF0aW8s
DQo+PiB0aG91Z2ggdGhlcmUgaXMgZGVtaXNpbmcgcmV0dXJucy4gSSB3b3VsZCBleHBlY3QgdGhh
dCBmb3Iga2VybmVsIGltYWdlDQo+PiBjb21wcmVzc2lvbiBsYXJnZXIgd2luZG93IHNpemVzIGFy
ZSBiZW5lZmljaWFsLCBzaW5jZSBpdCBpcyBkZWNvbXByZXNzZWQNCj4+IHdpdGggYSBzaW5nbGUg
cGFzcy4gRm9yIGluaXRyYW1mcyBkZWNvbXByZXNzaW9uLCBJIHdvdWxkIGV4cGVjdCB0aGF0IGxp
bWl0aW5nDQo+PiB0aGUgd2luZG93IHNpemUgY291bGQgaGVscCBkZWNvbXByZXNzaW9uIHNwZWVk
LCBzaW5jZSBpdCB1c2VzIHN0cmVhbWluZw0KPj4gY29tcHJlc3Npb24sIHNvIHVuenN0ZCgpIGhh
cyB0byBhbGxvY2F0ZSBhIGJ1ZmZlciBvZiB3aW5kb3cgc2l6ZSBieXRlcy4NCj4gWWVzLCBsYXJn
ZXIgd2luZG93IGltcHJvdmVzIHRoZSBjb21wcmVzc2lvbiByYXRpbywgc2VlIGhlcmUgYSBjb21w
YXJpc29uDQo+IGJldHdlZW4gbGV2ZWwgMTkgYW5kIDIyIG9uIG15IHRlc3RpbmcgeDg2LTY0IGlu
aXRyYW1mczoNCj4gIDMwNzc1MDIyIHJvb3Rmcy5jcGlvLnpzdC0xOQ0KPiAgMjg3NTU0Mjkgcm9v
dGZzLmNwaW8uenN0LTIyDQo+IFRoZXNlIDclIGNhbiBiZSBub3RpY2VhYmxlIHdoZW4gb25lIGhh
cyBhIHNsb3cgc3RvcmFnZSwgZS5nLiBhIGZsYXNoIG1lbW9yeQ0KPiBvbiBTUEkgYnVzLiANCj4g
DQo+Pj4gSSByZW1vdmVkIHRoYXQgbGltaXRhdGlvbiB0byBiZSBhYmxlIHRvIHRlc3QgaXQgaW4g
bXkgZW52aXJvbm1lbnQgYW5kIEkNCj4+PiBmb3VuZCB0aGUgcGVyZm9ybWFuY2UgaXMgd29yc3Qg
dGhhbiB3aXRoIG15IHBhdGNoIGJ5IHJvdWdobHkgMjAlIChvbg0KPj4+IGk3LTM1MjBNKSwgd2hp
Y2ggaXMgYSBtYWpvciBkcmF3YmFjayBjb25zaWRlcmluZyB0aGUgbWFpbiBtb3RpdmF0aW9uDQo+
Pj4gdG8gdXNlIHpzdGQgaXMgdGhlIGRlY29tcHJlc3Npb24gc3BlZWQuIEkgd2lsbCB0ZXN0IG9u
IGFybSBhcyB3ZWxsIGFuZA0KPj4+IHNoYXJlIHRoZSByZXN1bHQgdG9tb3Jyb3cuDQo+Pj4gUGV0
cg0KPj4gDQo+PiBXaGF0IGRvIHlvdSBtZWFuIGJ5IHRoYXQ/IENhbiB5b3Ugc2hhcmUgd2l0aCBt
ZSB0aGUgdGVzdCB5b3UgcmFuPw0KPj4gSXMgdGhpcyBmb3Iga2VybmVsIGRlY29tcHJlc3Npb24g
b3IgaW5pdHJhbWZzIGRlY29tcHJlc3Npb24/DQo+IEluaXRyYW1mcyAtIHlvdSBjYW4gYXBwbHkg
bXkgdjIgcGF0Y2ggb24gdjUuNSBhbmQgdHJ5IHdpdGggeW91ciB0ZXN0IGRhdGEuDQo+IA0KPiBJ
IGhhdmUgdGVzdGVkIHlvdXIgcGF0Y2ggYWxzbyBvbiBBUk12NyBwbGF0Zm9ybSBhbmQgdGhlcmUg
dGhlIGRlZ3JhZGF0aW9uDQo+IHdhcyA4JS4NCg0KQXJlIHlvdSBjb21wYXJpbmcgdGhlIHBlcmZv
cm1hbmNlIG9mIGFuIDggTUIgd2luZG93IHNpemUgdnMgYSAxMjggTUINCndpbmRvdyBzaXplPw0K
DQo+ICBQZXRyDQoNCg==
