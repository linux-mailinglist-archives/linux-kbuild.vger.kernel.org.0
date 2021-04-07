Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0664935736A
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 19:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348171AbhDGRqM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 13:46:12 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:9622 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1348078AbhDGRqL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 13:46:11 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.43/8.16.0.43) with SMTP id 137Hgu7O007687;
        Wed, 7 Apr 2021 10:45:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=xYWVeiAdQy1cx7hX0AIKN7tZJNL3J8w/mQE7aeP4BrQ=;
 b=gHJCERQkx5AqLfY4cOcFOLf4thM0Rcf7nbI6CaH4U8xJdNgy8TgXexlHqmUY89Ov6Wxf
 /GHTu3HpT4Lexn3PazMDv4krgqK9f88OQ/Ju3tvWg6qO9PYDX0kje9G7Rilzl/teMxOv
 Lbt4yVFWi1JdjjjGYDFeq7f/Zr5ta/pRKB8= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0001303.ppops.net with ESMTP id 37rvd4e802-8
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 07 Apr 2021 10:45:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Apr 2021 10:45:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaxSrt69Tw6dXgX52upd8DNc1OgE8IDm5g1qdwySBdzPO2imhJd0EuE4aN4pb7eNG80n1h/gzmRYdjLZv26iJgjVWOFbTWWssi2Z/a/tgWDaBX7DKJVay3WHs1okBRTfGMEQ38nQmfSTSSB9UcEXbXsSbNWhlUNbkT1UsFhdVPNvRilBDKveYBLXwsmsFuYCMrHlSV1dmhXxhED8eS7oVrHCWMu/1Q+rPLhXK06N2gsistlArNcYtBXN2/ky4R+vTuvRQAOExbyIiXPf/Osou1Mg8mNzsxso0ax8pq5eew7vLd+MPvUUTOLaatYTS0FaAaplQlRz3aB7Ly/Clqmufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYWVeiAdQy1cx7hX0AIKN7tZJNL3J8w/mQE7aeP4BrQ=;
 b=CSBCSoeza3JYZpz4CbWYsubONygIHmx/JQZl4ZmwbpI/hg11GBteZvY/QR1txTbXnhi8cSAyr+Na3RKEHj/1f8C0g5BXqWBQNkgT5X3kQxOkWTrP96stSrvNDcshqz7n1CvI3rbJf5frMN8SihlWqsPM8jUzRi44sDcgVMGGD+WHplg/eiib8XVueq5paM2CHx0xlj52HL2ufqt0RSSUY98Atw3BLmSymyiGCqPDhIhwLt12e51J0hUrjaMcliM4D8emwiF3QnkNjxbo0jJBpx3lamZwA1URCBfIeQXKF41lCX0OXIddjpUsxR8oES/KctiEeKqTGm5yDbe/dnD2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by SJ0PR15MB4389.namprd15.prod.outlook.com (2603:10b6:a03:35a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 17:45:15 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b%4]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 17:45:15 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Kees Cook" <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "Daniel Borkmann" <daniel@iogearbox.net>,
        Valentin Schneider <valentin.schneider@arm.com>,
        "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>,
        David Howells <dhowells@redhat.com>,
        "Johannes Weiner" <hannes@cmpxchg.org>
Subject: Re: [PATCH] init: add support for zstd compressed modules
Thread-Topic: [PATCH] init: add support for zstd compressed modules
Thread-Index: AQHXJVrjTl/b3y00YEOpOt7F0WiTWaqeXt4AgAAChgCAABnkAIAKpO2AgABAnAA=
Date:   Wed, 7 Apr 2021 17:45:14 +0000
Message-ID: <8EC13983-4A78-422B-BCA4-16A250B7B5FC@fb.com>
References: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
 <20210330115023.qt742qsdekwiroey@spock.localdomain>
 <33D7F6C9-6F53-471A-A146-7F128F6918F5@fb.com>
 <20210331174826.uhunfmkhlpyteb3d@spock.localdomain>
 <5288EB41-5257-4B4C-9D37-3C314FA90573@fb.com>
 <CAK7LNARiB5mDJGjg1Fi1iAHbiP99Z=0_uC9069mQhZ86hE4Vtg@mail.gmail.com>
In-Reply-To: <CAK7LNARiB5mDJGjg1Fi1iAHbiP99Z=0_uC9069mQhZ86hE4Vtg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:6be]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01743e3c-03e6-463d-c12d-08d8f9ece6a9
x-ms-traffictypediagnostic: SJ0PR15MB4389:
x-microsoft-antispam-prvs: <SJ0PR15MB43890C96A5DF65304EB72522AB759@SJ0PR15MB4389.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ARYQDfi75XPjK9HNmEj5yWrqSHwxnma2fPVdHtzenM049YSzmhpYanXLpl28rCNNhBc3EsQaEY3umAGCy2VXQ6LdeN9Ud5JE8QhqbZvelC1SMUOsU5x/0kWuIGP3xQo9fnszEa+lk6QCkZDlKdfwSCwDIgGEhBavVPAqOjq7449Oo7SaoRE2+qoju/T+Epadwn51HrYTroHq43Ylii7NWojQOMn+Bn9pKJZaD6eetR3KEihEk+FigtaglIoSWFiIeBgp4mfEQBOk+AFYo69nAdXCfMgsRKvkE5mttmPaEfP8oUd4TDoRv0kiHpTbOPRQUbhfDv2csn2Wk8dysfFHouT+wey1LEIU38uJhMy7lf78ilKozvV70bhC0+2h8Ds4PT48b0+3ZDy+GOk1l7NNEZmDcNx1AeLuPLka9pf975x/Z+istNNzyjPDlJX/ILydUfkVopkAKUT+00jIwtDRfUa7IMMXq7ZPoDNVnzRUF9r7giA+q58z/S9OZfg3izVGo0JfYp25dtl0txsOsXuTXgosruncpteTA0US3PfgsRhnYmPfcxMV7dj34+dGAjlUHlxeOQLkllwojLEDMySWpvUMdIr+86QWn+Bq9CgYui+euCNLLa3c9nfdLHggcl/aYgmMqJvXwpBfLHyz1myOGv1yhOP/OqbCciKS3DJ3bHdrRSo1ldEzEGae0gXXtXkTdjWmeYQC4hMRB21421xwfuzuKWDEd5l2GCPL427UEDaWhmw+B/W/SjkTSkmJswyfStvbl8Tj7WYgSslMMYJEEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(376002)(366004)(39860400002)(38100700001)(4326008)(66946007)(8936002)(66446008)(66476007)(8676002)(76116006)(91956017)(6916009)(6506007)(64756008)(66556008)(83380400001)(966005)(86362001)(53546011)(6486002)(316002)(5660300002)(2616005)(71200400001)(54906003)(36756003)(478600001)(186003)(33656002)(7416002)(6512007)(2906002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dDNFaVdGaWpGV3ozL093alhvMVVWNThONlMrWUFLSjlkMmpXcHZiN2hmWU52?=
 =?utf-8?B?UW5UdE9zdUtuVjFtVnpiVnM1NS80QVphSVFpcGUwWStqNTRZNE1jZ2NURmFk?=
 =?utf-8?B?TlF4TmpoNHJoWWhFUEd3dTlVUXY0T3JkT2N0NnZRYit3eTNyazc2TTl6SVIr?=
 =?utf-8?B?ZUdDbEY3K1VqOEwzYUI4cmUxRnordkRvS29pVzJjTFpCVzRoY1VKazUxTzF1?=
 =?utf-8?B?djFFUjhzdlpHWnJYY050WERDN21oeDZVaTNLV0FqL3NWR0N0NVFjaHNzaWtp?=
 =?utf-8?B?Wm1QUit5ZlRZekQycFJZVG1zOG9jTWFGTVJTeU5yVVA3TnBxQUhXTnlLY0Mx?=
 =?utf-8?B?dUlYOGVMWk5yRnVwVC92NkViclVDRjZEeTZlZGxacVRnMUd6NjN0QThKaC9s?=
 =?utf-8?B?M3hqWTZsclZyZVFmRStWVjIweVAwN20yT1hJT3ZLcFZ4Umk0NndXOUJsSjk3?=
 =?utf-8?B?WjdMZW5vdzZNbUFTTTlGa3oxS0lhQjZveGdKcHRZSEsrTVRjSjFCL3dnemhV?=
 =?utf-8?B?aHoxTzFSbDZCVUplOGdVTTcxRDBIN1pkc0lZRW5oUk1GOHl6RWdDQVZqRVhF?=
 =?utf-8?B?TEsyajk3KzZveFI4OERsbUUwMDhGZ2ZDeDN5a2hCUXZEaHRLUEM1eFZ0b3JZ?=
 =?utf-8?B?SHZ4SmQzczhUMFEvL0hGcHpERkYwN09YUW00OENqcDJmZXpYazlKUm0vWGxM?=
 =?utf-8?B?UzRTTWgvRlZWVEQwU1I0L3ppaGVMR1NxK2FZODdLeS9HbnJCNUFyK2YvQlZB?=
 =?utf-8?B?eHdNM210Kzd4bUxyUENpeTVyNE02QjVYYUF2TDVDMzM3RGNHa0RiUlVtSXNw?=
 =?utf-8?B?UG1QTlJLVXpiVmVUWEswOXhXN3UvWi9CL2VjNVlzUWF2RDIybGY2Q2lwUmVw?=
 =?utf-8?B?cnUram9GVndHSmhrTTVZVEMrRzJveG5VRFRaaDFRWndpL2dJYlVXN0pIZytT?=
 =?utf-8?B?MVdOUnM4cmdsMUV5SjZ1eTNqYmxRSVFYZlVtM2YrbVZlZVBPRlpURWlQczBl?=
 =?utf-8?B?TVdWTjRKWFY2OHlIek1YRGJXbTBaVTNxOG0xbzNJNXNEZDg3NS8zNVdvc3FG?=
 =?utf-8?B?QkF3TCtoeFFYTnVXeUtjTEFTWmQ5OHJRNnpXNmpOa3ZIQzJ6V0tsKzV3MGo3?=
 =?utf-8?B?aWV4WmFWYWgxVFp5NzBRampvTTRwZlJ3L1RNbzUzMnYvT0RWQXkzS0dnSTl1?=
 =?utf-8?B?ZU4zVFN2OHh0dHVLQ21KeFlmRVhpWmhiMi90SENBTSttOHUrNjlMTXpkWFVi?=
 =?utf-8?B?MHIvWFRTYUxiaUhLY0hKY25OaHZoSWlqN3ZleHVYNGxiUWJMVHV1WWlTK3Z2?=
 =?utf-8?B?RmdiUmg5Q1FhWVhqb3ROYyt3WnZucy8rNW1qRFVXV1czYWs4SmdNUUdtTEZI?=
 =?utf-8?B?RFRPTmx5Q1dWNGpoQU9tTEM5SlA1eEYxSlZ1QmMvQmlkaE5POUpMZ2NYMmcw?=
 =?utf-8?B?ODU2N2xrUktmcld5eFlUSEV3OUVQcWtBNXl2YXlVQzMyeVNwWG9kajlWU1Q3?=
 =?utf-8?B?NVFYVGtvMzNLcjVaSjNhV2IxQzFLTE4rTkE4Rk1DZ2FsUyt5TE9hSlNaeFA4?=
 =?utf-8?B?NEZVV2JicFh1R1I2Ym5sUFI5bDdiVGs3ejFoNlI5VUxuWUxmb2J3K0pFeFBF?=
 =?utf-8?B?WnI3YXNaZlcvYlEwOHZLYnRKKzFrNERzVXVtdnI1SmlsdDQzM3JTS1RRY3Ny?=
 =?utf-8?B?MUN0cU9tQzdoRGtPaGdrOWUrVzkwNGNFeEtTODU4bFp5REM3WHlCdkpEL2lj?=
 =?utf-8?B?cGpobXY3eTFsVmxTNkw4V1lWZnB1Ni9xbWJJeHhNejROY1R2OWlCZnEvQ2gy?=
 =?utf-8?Q?03EGe38DvOFavogbVBMOhOw8KmcYn1VTEf/hg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED8CDB009EB83A4D8E1D117D31C00E72@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01743e3c-03e6-463d-c12d-08d8f9ece6a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 17:45:14.8948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vdXoUD8/KcRlZYV8JEEHa0WGFRZf9+z7+bfH7tzqkPJeKsGAfrKDOc/5LP74Ux7j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4389
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: aHU8iI_EtiwrFULk5jgSQZ-9HIURKZnM
X-Proofpoint-GUID: aHU8iI_EtiwrFULk5jgSQZ-9HIURKZnM
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-07_09:2021-04-07,2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070122
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gQXByIDcsIDIwMjEsIGF0IDY6NTMgQU0sIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhp
cm95QGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCBBcHIgMSwgMjAyMSBhdCA0OjIx
IEFNIE5pY2sgVGVycmVsbCA8dGVycmVsbG5AZmIuY29tPiB3cm90ZToNCj4+IA0KPj4gDQo+PiAN
Cj4+PiBPbiBNYXIgMzEsIDIwMjEsIGF0IDEwOjQ4IEFNLCBPbGVrc2FuZHIgTmF0YWxlbmtvIDxv
bGVrc2FuZHJAbmF0YWxlbmtvLm5hbWU+IHdyb3RlOg0KPj4+IA0KPj4+IEhlbGxvLg0KPj4+IA0K
Pj4+IE9uIFdlZCwgTWFyIDMxLCAyMDIxIGF0IDA1OjM5OjI1UE0gKzAwMDAsIE5pY2sgVGVycmVs
bCB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+Pj4gT24gTWFyIDMwLCAyMDIxLCBhdCA0OjUwIEFN
LCBPbGVrc2FuZHIgTmF0YWxlbmtvIDxvbGVrc2FuZHJAbmF0YWxlbmtvLm5hbWU+IHdyb3RlOg0K
Pj4+Pj4gDQo+Pj4+PiBPbiBUdWUsIE1hciAzMCwgMjAyMSBhdCAwMTozMjozNVBNICswMjAwLCBQ
aW90ciBHb3Jza2kgd3JvdGU6DQo+Pj4+Pj4ga21vZCAyOCBzdXBwb3J0cyBtb2R1bGVzIGNvbXBy
ZXNzZWQgaW4genN0ZCBmb3JtYXQgc28gbGV0J3MgYWRkIHRoaXMgcG9zc2liaWxpdHkgdG8ga2Vy
bmVsLg0KPj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBpb3RyIEdvcnNraSA8bHVjamFu
Lmx1Y2phbm92QGdtYWlsLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBNYWtlZmlsZSAgICAgfCA3
ICsrKysrLS0NCj4+Pj4+PiBpbml0L0tjb25maWcgfCA5ICsrKysrKy0tLQ0KPj4+Pj4+IDIgZmls
ZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pj4+PiANCj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQ0KPj4+Pj4+IGluZGV4IDUxNjBm
Zjg5MDNjMS4uODJmNGY0Y2MyOTU1IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL01ha2VmaWxlDQo+Pj4+
Pj4gKysrIGIvTWFrZWZpbGUNCj4+Pj4+PiBAQCAtMTE1Niw4ICsxMTU2LDggQEAgZW5kaWYgIyBJ
TlNUQUxMX01PRF9TVFJJUA0KPj4+Pj4+IGV4cG9ydCBtb2Rfc3RyaXBfY21kDQo+Pj4+Pj4gDQo+
Pj4+Pj4gIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTLCBpZiBkZWZpbmVkLCB3aWxsIGNhdXNlIG1v
ZHVsZSB0byBiZSBjb21wcmVzc2VkDQo+Pj4+Pj4gLSMgYWZ0ZXIgdGhleSBhcmUgaW5zdGFsbGVk
IGluIGFncmVlbWVudCB3aXRoIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUA0KPj4+Pj4+IC0j
IG9yIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfWFouDQo+Pj4+Pj4gKyMgYWZ0ZXIgdGhleSBhcmUg
aW5zdGFsbGVkIGluIGFncmVlbWVudCB3aXRoIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfR1pJUCwN
Cj4+Pj4+PiArIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1haLCBvciBDT05GSUdfTU9EVUxFX0NP
TVBSRVNTX1pTVEQuDQo+Pj4+Pj4gDQo+Pj4+Pj4gbW9kX2NvbXByZXNzX2NtZCA9IHRydWUNCj4+
Pj4+PiBpZmRlZiBDT05GSUdfTU9EVUxFX0NPTVBSRVNTDQo+Pj4+Pj4gQEAgLTExNjcsNiArMTE2
Nyw5IEBAIGlmZGVmIENPTkZJR19NT0RVTEVfQ09NUFJFU1MNCj4+Pj4+PiBpZmRlZiBDT05GSUdf
TU9EVUxFX0NPTVBSRVNTX1haDQo+Pj4+Pj4gICBtb2RfY29tcHJlc3NfY21kID0gJChYWikgLS1s
em1hMj1kaWN0PTJNaUIgLWYNCj4+Pj4+PiBlbmRpZiAjIENPTkZJR19NT0RVTEVfQ09NUFJFU1Nf
WFoNCj4+Pj4+PiArICBpZmRlZiBDT05GSUdfTU9EVUxFX0NPTVBSRVNTX1pTVEQNCj4+Pj4+PiAr
ICAgIG1vZF9jb21wcmVzc19jbWQgPSAkKFpTVEQpIC1UMCAtLXJtIC1mIC1xDQo+Pj4+IA0KPj4+
PiBUaGlzIHdpbGwgdXNlIHRoZSBkZWZhdWx0IHpzdGQgbGV2ZWwsIGxldmVsIDMuIEkgdGhpbmsg
aXQgd291bGQgbWFrZSBtb3JlIHNlbnNlIHRvIHVzZSBhIGhpZ2gNCj4+Pj4gY29tcHJlc3Npb24g
bGV2ZWwuIExldmVsIDE5IHdvdWxkIHByb2JhYmx5IGJlIGEgZ29vZCBjaG9pY2UuIFRoYXQgd2ls
bCBjaG9vc2UgYSB3aW5kb3cNCj4+Pj4gc2l6ZSBvZiB1cCB0byA4TUIsIG1lYW5pbmcgdGhlIGRl
Y29tcHJlc3NvciBuZWVkcyB0byBhbGxvY2F0ZSB0aGF0IG11Y2ggbWVtb3J5LiBJZiB0aGF0DQo+
Pj4+IGlzIHVuYWNjZXB0YWJsZSwgeW91IGNvdWxkIHVzZSBgenN0ZCAtVDAgLS1ybSAtZiAtcSAt
MTkgLS16c3RkPXdsb2c9MjFgLCB3aGljaCB3aWxsIHVzZSBhDQo+Pj4+IHdpbmRvdyBzaXplIG9m
IHVwIHRvIDJNQiwgdG8gbWF0Y2ggdGhlIFhaIGNvbW1hbmQuIE5vdGUgdGhhdCBpZiB0aGUgZmls
ZSBpcyBzbWFsbGVyIHRoYW4NCj4+Pj4gdGhlIHdpbmRvdyBzaXplLCBpdCB3aWxsIGJlIHNocnVu
ayB0byB0aGUgc21hbGxlc3QgcG93ZXIgb2YgdHdvIGF0IGxlYXN0IGFzIGxhcmdlIGFzIHRoZSBm
aWxlLg0KPj4+IA0KPj4+IFBsZWFzZSBuby4gV2UndmUgYWxyZWFkeSBkb25lIHRoYXQgd2l0aCBp
bml0cmFtZnMgaW4gQXJjaCwgYW5kIGl0DQo+Pj4gaW5jcmVhc2VkIHRoZSB0aW1lIHRvIGdlbmVy
YXRlIGl0IGVub3Jtb3VzbHkuDQo+Pj4gDQo+Pj4gSSB1bmRlcnN0YW5kIHRoYXQgYnVpbGRpbmcg
YSBrZXJuZWwgaXMgYSBtb3JlIHJhcmUgb3BlcmF0aW9uIHRoYW4NCj4+PiByZWdlbmVyYXRpbmcg
aW5pdHJhbWZzLCBidXQgc3RpbGwgSSdkIGdvIGFnYWluc3QgaGFyZC1jb2RpbmcgdGhlIGxldmVs
Lg0KPj4+IEFuZCBpZiBpdCBzaG91bGQgYmUgc3BlY2lmaWVkIGFueXdheSwgSSdkIG9wdCBpbiBm
b3IgYW4gZXhwbGljaXQNCj4+PiBjb25maWd1cmF0aW9uIG9wdGlvbi4gUmVtZW1iZXIsIG5vdCBh
bGwgdGhlIGtlcm5lbCBhcmUgYnVpbHQgb24NCj4+PiBidWlsZCBmYXJtcy4uLg0KPj4+IA0KPj4+
IEZXSVcsIFBpb3RyIG9yaWdpbmFsbHkgdXNlZCBsZXZlbCA5IHdoaWNoIHdvcmtlZCBva2F5LCBi
dXQgSSBpbnNpc3RlZA0KPj4+IG9uIHNlbmRpbmcgdGhlIHBhdGNoIGluaXRpYWxseSB3aXRob3V0
IHNwZWNpZnlpbmcgbGV2ZWwgYXQgYWxsIGxpa2UgaXQgaXMNCj4+PiBkb25lIGZvciBvdGhlciBj
b21wcmVzc29ycy4gSWYgdGhpcyBpcyBhIHdyb25nIGFwcHJvYWNoLCB0aGVuIG9oIG1laCwNCj4+
PiBtZWEgY3VscGEgOykuDQo+Pj4gDQo+Pj4gV2hhdGV2ZXIgZGVmYXVsdCBub24tc3RhbmRhcmQg
Y29tcHJlc3Npb24gbGV2ZWwgeW91IGNob29zZSwgSSdtIGZpbmUNCj4+PiBhcyBsb25nIGFzIEkg
Y2FuIGNoYW5nZSBpdCB3aXRob3V0IGVkaXRpbmcgTWFrZWZpbGUuDQo+PiANCj4+IFRoYXQgbWFr
ZXMgc2Vuc2UgdG8gbWUuIEkgaGF2ZSBhIGRlZXAgc2VhdGVkIG5lZWQgdG8gY29tcHJlc3MgZmls
ZXMgYXMNCj4+IGVmZmljaWVudGx5IGFzIHBvc3NpYmxlIGZvciB3aWRlbHkgZGlzdHJpYnV0ZWQg
cGFja2FnZXMuIEJ1dCwgSSB1bmRlcnN0YW5kIHRoYXQNCj4+IHNsb3cgY29tcHJlc3Npb24gc2ln
bmlmaWNhbnRseSBpbXBhY3RzIGJ1aWxkIHRpbWVzIGZvciBxdWljayBpdGVyYXRpb24uIEnigJlk
IGJlDQo+PiBoYXBweSB3aXRoIGEgY29tcHJlc3Npb24gbGV2ZWwgcGFyYW1ldGVyIHRoYXQgZGVm
YXVsdHMgdG8gYSBoYXBweSBtaWRkbGUuDQo+PiANCj4+IEnigJltIGFsc28gZmluZSB3aXRoIHRh
a2luZyB0aGlzIHBhdGNoIGFzLWlzIGlmIGl0IGlzIGVhc2llciwgYW5kIEkgY2FuIHB1dCB1cCBh
bm90aGVyDQo+PiBwYXRjaCB0aGF0IGFkZHMgYSBjb21wcmVzc2lvbiBsZXZlbCBwYXJhbWV0ZXIs
IHNpbmNlIEkgZG9u4oCZdCB3YW50IHRvIGJsb2NrDQo+PiBtZXJnaW5nIHRoaXMuDQo+IA0KPiAN
Cj4gSSBkbyBub3Qgd2FudCB0byB0YWtlIHN1Y2ggYSBwYXRjaC4NCj4gTWVla2luZyBldmVyeW9u
ZSdzIHJlcXVpcmVtZW50DQo+IHJlc3VsdHMgaW4gYSBiYWQgcHJvamVjdCBmb3IgZXZlcnlvbmUu
DQo+IA0KPiANCj4gRG9lcyB0aGlzIHdvcmsgZm9yIHlvdT8NCj4gDQo+IG1ha2UgbW9kdWxlc19p
bnN0YWxsIFpTVEQ9InpzdGQgLTE5Ig0KDQpZZWFoLCB0aGF04oCZcyBwZXJmZWN0LiBEbyB5b3Ug
dGhpbmsgaXQgaXMgd29ydGggbWVudGlvbmluZyBpbiB0aGUgZG9jcyBmb3INCmBNT0RVTEVfQ09N
UFJFU1NfWlNURGA/DQoNCkJlc3QsDQpOaWNrDQoNCj4+IEJlc3QsDQo+PiBOaWNrIFRlcnJlbGwN
Cj4+IA0KPj4+IFRoYW5rcyENCj4+PiANCj4+Pj4gDQo+Pj4+IEJlc3QsDQo+Pj4+IE5pY2sgVGVy
cmVsbA0KPj4+PiANCj4+Pj4+PiArICBlbmRpZiAjIENPTkZJR19NT0RVTEVfQ09NUFJFU1NfWlNU
RA0KPj4+Pj4+IGVuZGlmICMgQ09ORklHX01PRFVMRV9DT01QUkVTUw0KPj4+Pj4+IGV4cG9ydCBt
b2RfY29tcHJlc3NfY21kDQo+Pj4+Pj4gDQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luaXQvS2NvbmZp
ZyBiL2luaXQvS2NvbmZpZw0KPj4+Pj4+IGluZGV4IDhjMmNmZDg4ZjZlZi4uODZhNDUyYmMyNzQ3
IDEwMDY0NA0KPj4+Pj4+IC0tLSBhL2luaXQvS2NvbmZpZw0KPj4+Pj4+ICsrKyBiL2luaXQvS2Nv
bmZpZw0KPj4+Pj4+IEBAIC0yMjUwLDggKzIyNTAsOCBAQCBjb25maWcgTU9EVUxFX0NPTVBSRVNT
DQo+Pj4+Pj4gICBib29sICJDb21wcmVzcyBtb2R1bGVzIG9uIGluc3RhbGxhdGlvbiINCj4+Pj4+
PiAgIGhlbHANCj4+Pj4+PiANCj4+Pj4+PiAtICAgIENvbXByZXNzZXMga2VybmVsIG1vZHVsZXMg
d2hlbiAnbWFrZSBtb2R1bGVzX2luc3RhbGwnIGlzIHJ1bjsgZ3ppcCBvcg0KPj4+Pj4+IC0gICAg
eHogZGVwZW5kaW5nIG9uICJDb21wcmVzc2lvbiBhbGdvcml0aG0iIGJlbG93Lg0KPj4+Pj4+ICsg
ICAgQ29tcHJlc3NlcyBrZXJuZWwgbW9kdWxlcyB3aGVuICdtYWtlIG1vZHVsZXNfaW5zdGFsbCcg
aXMgcnVuOyBnemlwLA0KPj4+Pj4+ICsgICAgeHosIG9yIHpzdGQgZGVwZW5kaW5nIG9uICJDb21w
cmVzc2lvbiBhbGdvcml0aG0iIGJlbG93Lg0KPj4+Pj4+IA0KPj4+Pj4+ICAgICBtb2R1bGUtaW5p
dC10b29scyBNQVkgc3VwcG9ydCBnemlwLCBhbmQga21vZCBNQVkgc3VwcG9ydCBnemlwIGFuZCB4
ei4NCj4+Pj4+PiANCj4+Pj4+PiBAQCAtMjI3Myw3ICsyMjczLDcgQEAgY2hvaWNlDQo+Pj4+Pj4g
ICAgIFRoaXMgZGV0ZXJtaW5lcyB3aGljaCBzb3J0IG9mIGNvbXByZXNzaW9uIHdpbGwgYmUgdXNl
ZCBkdXJpbmcNCj4+Pj4+PiAgICAgJ21ha2UgbW9kdWxlc19pbnN0YWxsJy4NCj4+Pj4+PiANCj4+
Pj4+PiAtICAgIEdaSVAgKGRlZmF1bHQpIGFuZCBYWiBhcmUgc3VwcG9ydGVkLg0KPj4+Pj4+ICsg
ICAgR1pJUCAoZGVmYXVsdCksIFhaLCBhbmQgWlNURCBhcmUgc3VwcG9ydGVkLg0KPj4+Pj4+IA0K
Pj4+Pj4+IGNvbmZpZyBNT0RVTEVfQ09NUFJFU1NfR1pJUA0KPj4+Pj4+ICAgYm9vbCAiR1pJUCIN
Cj4+Pj4+PiBAQCAtMjI4MSw2ICsyMjgxLDkgQEAgY29uZmlnIE1PRFVMRV9DT01QUkVTU19HWklQ
DQo+Pj4+Pj4gY29uZmlnIE1PRFVMRV9DT01QUkVTU19YWg0KPj4+Pj4+ICAgYm9vbCAiWFoiDQo+
Pj4+Pj4gDQo+Pj4+Pj4gK2NvbmZpZyBNT0RVTEVfQ09NUFJFU1NfWlNURA0KPj4+Pj4+ICsgIGJv
b2wgIlpTVEQiDQo+Pj4+Pj4gKw0KPj4+Pj4+IGVuZGNob2ljZQ0KPj4+Pj4+IA0KPj4+Pj4+IGNv
bmZpZyBNT0RVTEVfQUxMT1dfTUlTU0lOR19OQU1FU1BBQ0VfSU1QT1JUUw0KPj4+Pj4+IC0tDQo+
Pj4+Pj4gMi4zMS4wLjk3LmcxNDI0MzAzMzg0DQo+Pj4+Pj4gDQo+Pj4+PiANCj4+Pj4+IEdyZWF0
IQ0KPj4+Pj4gDQo+Pj4+PiBSZXZpZXdlZC1ieTogT2xla3NhbmRyIE5hdGFsZW5rbyA8b2xla3Nh
bmRyQG5hdGFsZW5rby5uYW1lPg0KPj4+Pj4gDQo+Pj4+PiBUaGlzIHdvcmtzIHBlcmZlY3RseSBm
aW5lIGluIEFyY2ggTGludXggaWYgYWNjb21wYW5pZWQgYnkgdGhlDQo+Pj4+PiBmb2xsb3dpbmcg
bWtpbml0Y3BpbyBhbWVuZG1lbnQ6IFsxXS4NCj4+Pj4+IA0KPj4+Pj4gSSdtIGFsc28gQ2MnaW5n
IG90aGVyIHBlb3BsZSBmcm9tIGdldF9tYWludGFpbmVycyBvdXRwdXQganVzdA0KPj4+Pj4gdG8g
bWFrZSB0aGlzIHN1Ym1pc3Npb24gbW9yZSB2aXNpYmxlLg0KPj4+Pj4gDQo+Pj4+PiBUaGFua3Mu
DQo+Pj4+PiANCj4+Pj4+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vYXJjaGxpbnV4L21raW5pdGNw
aW8vcHVsbC80Mw0KPj4+Pj4gDQo+Pj4+PiAtLQ0KPj4+Pj4gT2xla3NhbmRyIE5hdGFsZW5rbyAo
cG9zdC1mYWN0dW0pDQo+Pj4+IA0KPj4+IA0KPj4+IC0tDQo+Pj4gT2xla3NhbmRyIE5hdGFsZW5r
byAocG9zdC1mYWN0dW0pDQo+PiANCj4gDQo+IA0KPiAtLSANCj4gQmVzdCBSZWdhcmRzDQo+IE1h
c2FoaXJvIFlhbWFkYQ0KDQo=
