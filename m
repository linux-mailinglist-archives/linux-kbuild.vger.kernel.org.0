Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C8E459576
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Nov 2021 20:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238942AbhKVTXW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Nov 2021 14:23:22 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:12230 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239809AbhKVTXN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Nov 2021 14:23:13 -0500
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMF0Px3030628;
        Mon, 22 Nov 2021 11:20:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=DT2TZXxjzgVbZbr2wthtZA7Q8KfMsCoiUFo2dnsRImI=;
 b=KolnLqpyj71RU3W8TyKYTJ8XZ6Iaxz/M8SgqSKmQdzDvLyJvZmNDV02ncy+EmbWIiwDl
 PJ0OYOsFSWrQVgH+M2jQleHyL7PNaXguSINt8Y1L63OKba3GcR21Tv6swHwIHyZ6Rg9N
 o8WaJCzWOUYJRXQP7rOsnNyRHmRz/6sEPwg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3cg5gjcppd-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 22 Nov 2021 11:20:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Mon, 22 Nov 2021 11:20:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwONGt2TS4c3DouyWM8ZZudADKSaqvcWHaEPJuoe3SiCGUE3k7gq59nrUknUah0GE2O38QJTbfC7aFwNFbKmk75TzA+hS8rDSrKAq/OtAmSsBdpLbJWFG+JbDPf9N1hULI5A5C1i6SaxpH2535/aXzjcHLX7yuHsZ5YJ283nbi4bof9BgoqZhGcWKbQVV/Bd7PO7LplT+ROF3MIuMs77G3F/ofWpm/RfbaQRmv+y/0beq/nvPuW7ZhXySqqrk6tLZqKalXdnXvkJHy74oyEy6KvgwpI0ecevIOAuRaNkcaV3F8s2LC+gNS2sTL9M0HLKvudEsaW0v433DWg1AEjzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT2TZXxjzgVbZbr2wthtZA7Q8KfMsCoiUFo2dnsRImI=;
 b=UqoZ2DV4+idW3oPZ+g7X8pYCf9/r8+ijl5RJC8RRJ43uDu9ERHh9RkoV7pGvch0DwtuD4yr/0aEbUONU/T0z5wjyOl8hGuVX0O9Kd7M8E/67GGrkB3TYLS+PuFR5v1U45FoXYr9H3t/7XjiOz16O/0A/WlzGk7wEuL86q7qAfywVMRHAm95DGEVCEqYHHbmE/Sc6+LTtzUc/dyokDniIPsHAdeyZfCaNWzCQWYAMunP6nMJgwN+URLOQYoIVsx5t3mAzLRRnloSYdfkNG9GRh4usG6pYdgptQiCE8IJ5qb9Vqhj9n0xm2qXLzd5hUyTI6q0uMnM0iqG2eZz2Bny7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3510.namprd15.prod.outlook.com (2603:10b6:a03:112::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 19:20:03 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::8d7d:240:3369:11b4%6]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 19:20:03 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
CC:     Michael Forney <forney@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        "Sedat Dilek" <sedat.dilek@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] kbuild: pass --stream-size --no-content-size to zstd
Thread-Topic: [PATCH 2/2] kbuild: pass --stream-size --no-content-size to zstd
Thread-Index: AQHX3i81dIQ883bo1kewH7FXk4GGwqwP74YA
Date:   Mon, 22 Nov 2021 19:20:03 +0000
Message-ID: <221F448E-58B4-42F7-95DC-58AD9CA3D226@fb.com>
References: <20211120165349.99908-1-alex_y_xu@yahoo.ca>
 <20211120165349.99908-2-alex_y_xu@yahoo.ca>
In-Reply-To: <20211120165349.99908-2-alex_y_xu@yahoo.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bafb1c89-92a8-4d59-7ae9-08d9aded15b4
x-ms-traffictypediagnostic: BYAPR15MB3510:
x-microsoft-antispam-prvs: <BYAPR15MB35107A9F056902F6A1214047AB9F9@BYAPR15MB3510.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Igxx7AYJhtTznSXXfAasLf1dXNWE6fUWmQl7Wq+TZNVteqx6xJFivszRFOKdtQsh1veu/Pob9xRWfJwBCVRK3h+80GuG2f36t0BHdNK4bJ/j8w4UE33FTIJrvvPrK+AMBEFOZ6IGH7KEJMXnej1hwx5UamWreSe5EfvJyz/Ius7tibi6zn5/OUpfK+V6Hlv+K/Qrh/XcS21cWB7JalDMEnzbekgbwzVGmWsvdybW6VysmughO0QeFjwB/oinme1ljy9bMx6cKS6o3egJkt/cSu9KaLS0v/mT+qewApo+NPNGPQezRPb3nXQS+Dp4YHzG46oEZGaNhyVFOwWxr2LsvseIky5ZT2Qbfx+qWyzUBiAQS8vLfrhJpeg+wTEQbavCIHe2KekQjvnVc0cRualOeZJ1b1fGahnBI5P03ie764Yuj47G5jNM6E8OXEZo5ufyvs0F0kbhLCkbTOrmS0Y3ug9JJOfVbEZrLdFQtfQwP+nMaEZYz1sO3NK7WaadKAwSXn+EkjLndnGDQTZ0zhmDx3HkDs2ACemjwXlfXvO0h99ELrAKa7DN4iOkwsKN0zyC8TJCShBPZeiqrC+hJVLvx2dc6ffIRqXHbKriCVpCC+cDDU75SU5/HQX6GNfpy99uEQ1td5fPpzG9JsiGaJ5ECLfxcsmqUFGYaBUeS4a55z0Oc1eJ+lqC3L3Rz5V62M+QE32EOYNbhl26QQpHJRvurMhgkOfjB1kCJwYQ9dNJEFySD7fGiIs8JmRbrT3ZcWBWBMcWWghwl6FwupZJ+mH2WP7WVqN+HfrmZ96ecjGfvD76oY89DjFhF0xpEeKhcHt4E+Ip02U7WS1QFbbfqlTQsWtq4GAURcuqm7zMrWzxHcxPZQbohDvqOPpWAiqDWeSi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(6486002)(54906003)(33656002)(5660300002)(186003)(8936002)(83380400001)(508600001)(71200400001)(2906002)(316002)(122000001)(4326008)(86362001)(91956017)(38100700002)(64756008)(76116006)(66946007)(38070700005)(2616005)(66476007)(66446008)(66556008)(53546011)(7416002)(966005)(8676002)(6512007)(6506007)(36756003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmxxaVk3ZE4rWkpsZjMrc1dqTVhUaVN1OFVQL296K1hNd01jc0w2WGFWY28w?=
 =?utf-8?B?S0JUNWU5OWVkajdJaDZKWlF5clJZQXZBR2pSV0hmcVJuSFYyaEVyeHdKOFNq?=
 =?utf-8?B?T0dyWDgwb0hsUWVrVTBucFhZYmtxRWNjVWoxQmdxUVQ4M2lvekNmQ2FhLzh3?=
 =?utf-8?B?aFk1UllZdGFKclJtaUlrZDl1Z09seUQvaTBjbEh4eXhORThsMlBYK2tIZkZR?=
 =?utf-8?B?bDQ2TWxJSHpMNWN3U3QzWE5WN0Q2WjQ4bHJrQURSN0dreGRNSXZ1NldjMllK?=
 =?utf-8?B?clJjQmE4Q0NYTTlGNU9VTTdLYmtvK0NTaGJKTFdHVXhnMEtVSlp1dERmRkJm?=
 =?utf-8?B?QUg1cVg1VmltbkJ2ZUF4MXVadXg4RW0ybG1xQlJmbjVsSmloRjRVZEc1RU4x?=
 =?utf-8?B?Z0EwRHByMUFSbkx3b0ZWS3VEOGlwTGkxZ1o2bWFBc3VpVDZEV2UzRXFRWXNw?=
 =?utf-8?B?S2d6SGV5Ny9Rei9YaS9LMFhTWXZ5TFQwZml4RkhEMGNoamorZnlHWVZMOFF6?=
 =?utf-8?B?SkwvdnoxeW9lT29BcGxvQ0lYZEh3WXNKbTBKZVAvcWhBei8rVi8zalNjaCtt?=
 =?utf-8?B?SlFNN2tzUFpUb2Q4YnAvazlpOUtOMCt4TUp4RlFpNG9GZzVMZTR5VC90Ukk0?=
 =?utf-8?B?d2tBaXJBamRONkFDR0Y1WnF1OFdwV2NJdlI3aFQ4MTFoYjVSWjJjM2h2Z1dl?=
 =?utf-8?B?SEtZSzFza0x3dmNEQ0YzZnMzMjRnSVBHMzFyYitFUWNaUXovREdCN20zZXds?=
 =?utf-8?B?cWpjR3JQZXIybmRYZllNYmVkWkJDT2g1bDA1c3NnalNvTDNBYUFnM3lTNERm?=
 =?utf-8?B?VDNpZzdIRkMrcm9telh5QlkrNmNYZ2tid0RMWW9rOFJwTVVLS3QwRHVuNkNI?=
 =?utf-8?B?THcrcEhsOG5PL3Rkc050OVYxbndBK24yRHNuQ0VIeHhqL1FTNVFraWt3aE9Z?=
 =?utf-8?B?dXlVSklQamoxSDV2SDNuM0dBK2tsWE9xb3JqckZlV1lzUmZtTzVodkZDSWhl?=
 =?utf-8?B?a1hXbC96S0dwRGhhUE1DQXc5TkxFa0dLdDlPT0xiQ3NncmJhZi9wcFFrUGp5?=
 =?utf-8?B?RmU1WHVUeWZzUGJOejQvTXFTM1p3R3QzQXh4Rm5yZDRKRXIycVVzR1RCSnF2?=
 =?utf-8?B?T1F2amV6M1I2ellvNXNYV0RBS1paK1A1clpXc2VvVTVLNFNHZmJjMmxDZUxk?=
 =?utf-8?B?clpTTjhobUt2T3krcFhhVkVEZTY0U1diMDRwaWlFSUdUVVpsNHdZaWJPQW8z?=
 =?utf-8?B?L3NFZHVKK2FtTUJxVjVPWnZ2TjVCdEE2dDk4MmhiM3dGL0M4ZUdSQSs0OHBP?=
 =?utf-8?B?MUlaY3laajBjQ0ZGVWUyZm1OVnJCdmdZVG9CTGorbmEzbVFReTQvWmxWU25S?=
 =?utf-8?B?RzhyT1JncnRpWU1obEg2VXJxVWJCRjloNUlvdDBPK01CbGhYN3RjVVcyRFBW?=
 =?utf-8?B?UnFab01YRjBTK1JwZitTU1ZuYURVOEtqVlVSU2IvR2d3WHFHNG1pY1huNm53?=
 =?utf-8?B?Smwwd2c1T2xCdlUyeFdRYlordGpyYlhYeXlGVG9tdFR1UlI1VzVVSG5rV3dJ?=
 =?utf-8?B?Ymp2WUNPLzBIV1R1T0tmd2Y4Z0dLZWk4Q0trcXRzdnVpVkpzRTlCRWsxSUp3?=
 =?utf-8?B?TFR2T1BhRHhRYXZWMGhrSGk4Wk42Y0g1VGZmaWtINXdxNHVHOHZDNFRjcW55?=
 =?utf-8?B?TGtMR2cyc3hGaDVTNzlxUWVjU2F6Y1ZVSSsvT1pmYzVhZ1pFb05PRTVOdWFZ?=
 =?utf-8?B?cG9DaGpJVjRybTlNd1hNN1Fuc3BSeFBMa0NjakNXbXBDL0F4NDN0a214Y1ha?=
 =?utf-8?B?TTZoSXh4MFRERFpXc2pyOW41QUdOeHFrSEtSbUw4VnpZYlY3VDlZM2VvTW5n?=
 =?utf-8?B?SU5aZ3J4MjROK3d5NHQ0ZVpaSktkK24vVmpkTUF1STBvckhRK0hoeFBWZVEx?=
 =?utf-8?B?ZGlCLzNRb01kd1pNdmUwN2tacDFsSXdweVV2OUZJbXVVUUYrUVVRYk82VHlm?=
 =?utf-8?B?K2VYRFBkRldMUEdaR2tqS2EydnRpcCs4blhmbTlWaGxTOG9FNURmWWZSVmNT?=
 =?utf-8?B?alUySUlGU3NhNFZzeFFlRHYzN3REQzBOTnhYOUtPVnpQb0x0anFTWW92Vm9Q?=
 =?utf-8?B?cnhPTUFGQmhsWXQyRHNvc2hqL2JSOHYwaXdldkFGK1BURWtqMWtEbTJyejAw?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <851C4B102EDCC045B232FCF6AEF8DEBC@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafb1c89-92a8-4d59-7ae9-08d9aded15b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 19:20:03.0900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RG8SvLM+affMN2J/dTYuqRiZuzHSXnNzWgswfjhfchzsH4LiLUe/KY2nLcSI6Wab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3510
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: xlZjgA3p_3w9MOdmWA36kioa_AZFXvqV
X-Proofpoint-GUID: xlZjgA3p_3w9MOdmWA36kioa_AZFXvqV
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_08,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220097
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gTm92IDIwLCAyMDIxLCBhdCA4OjUzIEFNLCBBbGV4IFh1IChIZWxsbzcxKSA8YWxl
eF95X3h1QHlhaG9vLmNhPiB3cm90ZToNCj4gDQo+IE90aGVyd2lzZSwgaXQgYWxsb2NhdGVzIDIg
R0Igb2YgbWVtb3J5IGF0IG9uY2UuIEV2ZW4gdGhvdWdoIHRoZSBtYWpvcml0eQ0KPiBvZiB0aGlz
IG1lbW9yeSBpcyBuZXZlciB0b3VjaGVkLCB0aGUgZGVmYXVsdCBoZXVyaXN0aWMgb3ZlcmNvbW1p
dA0KPiByZWZ1c2VzIHRoaXMgcmVxdWVzdCBpZiBsZXNzIHRoYW4gMiBHQiBvZiBSQU0rc3dhcCBp
cyBjdXJyZW50bHkNCj4gYXZhaWxhYmxlLiBUaGlzIHJlc3VsdHMgaW4gInpzdGQ6IGVycm9yIDEx
IDogQWxsb2NhdGlvbiBlcnJvciA6IG5vdA0KPiBlbm91Z2ggbWVtb3J5IiBhbmQgdGhlIGtlcm5l
bCBmYWlsaW5nIHRvIGJ1aWxkLg0KPiANCj4gV2hlbiB0aGUgc2l6ZSBpcyBzcGVjaWZpZWQsIHpz
dGQgd2lsbCByZWR1Y2UgdGhlIG1lbW9yeSByZXF1ZXN0DQo+IGFwcHJvcHJpYXRlbHkuIEZvciB0
eXBpY2FsIGtlcm5lbCBzaXplcyBvZiB+MzIgTUIsIHRoZSBsYXJnZXN0IG1tYXANCj4gcmVxdWVz
dCB3aWxsIGJlIHJlZHVjZWQgdG8gNTEyIE1CLCB3aGljaCB3aWxsIHN1Y2NlZWQgb24gYWxsIGJ1
dCB0aGUNCj4gc21hbGxlc3QgZGV2aWNlcy4NCj4gDQo+IEZvciBpbnB1dHMgYXJvdW5kIHRoaXMg
c2l6ZSwgLS1zdHJlYW0tc2l6ZSAtLW5vLWNvbnRlbnQtc2l6ZSBtYXkNCj4gc2xpZ2h0bHkgZGVj
cmVhc2UgdGhlIGNvbXByZXNzZWQgc2l6ZSwgb3Igc2xpZ2h0bHkgaW5jcmVhc2UgaXQ6DQo+IGh0
dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9vay96c3RkL2lzc3Vlcy8yODQ4Lg0KDQpJIGxpa2UgdGhl
IGNoYW5nZSBpbiBnZW5lcmFsLiBIb3dldmVyLCBJIGhhdmUgYSBxdWVzdGlvbiBvZiBwb3J0YWJp
bGl0eS4NClRoZSAtLXN0cmVhbS1zaXplIG9wdGlvbiB3YXMgYWRkZWQgaW4genN0ZC0xLjQuNCBy
ZWxlYXNlZCBOb3ZlbWJlcg0KMjAxOSBbMF0uIFRoYXQgbWVhbnMgdGhlIGJ1aWxkIHdpbGwgZmFp
bCBmb3IgcGVvcGxlIHdpdGggb2xkZXIgenN0ZA0KdmVyc2lvbnMuIEFzIGEgcmVmZXJlbmNlLCBV
YnVudHUgQmlvbmljICgxOC4wNCkgaW5jbHVkZXMgenN0ZC0xLjMuMywNCmFuZCBVYnVudHUgRm9j
YWwgKDIwLjA0KSBoYXMgenN0ZC0xLjQuNC4gU28gQmlvbmljIHVzZXJzIHdpbGwgaGF2ZSB0bw0K
aW5zdGFsbCB6c3RkIG1hbnVhbGx5IHRvIGJ1aWxkIHRoZSBrZXJuZWwuDQoNCknigJlkIHByZWZl
ciB0byBlcnIgb24gdGhlIHNpZGUgb2YgY2F1dGlvbiBmb3IgcG9ydGFiaWxpdHkuIEnigJlkIHNh
eSBvbmNlDQpCaW9uaWMgaGl0cyBlbmQgb2YgbGlmZSwgaXTigJlkIGJlIHNhZmUgdG8gcmVxdWly
ZSB6c3RkLTEuNC40IG9yIG5ld2VyLg0KSG93ZXZlciwgSSBzZWUgdGhlIG5lZWQgdG8gcmVkdWNl
IG1lbW9yeSB1c2FnZSwgYXMgdGhpcyBpc3N1ZSBoYXMNCmNvbWUgdXAgYmVmb3JlLg0KDQpDb3Vs
ZCB3ZSBkZXRlY3QgdGhlIHpzdGQgdmVyc2lvbiB3aXRoIGB6c3RkIC0tdmVyc2lvbmAgYW5kIHBh
c3MNCi0tc3RyZWFtLXNpemUgaWYgd2UgZGV0ZWN0IHRoZSB2ZXJzaW9uIGlzID49IHYxLjQuND8g
VGhhdCBhZGQgc29tZQ0KY29tcGxleGl0eSwgYnV0IEkgdGhpbmsgaXQgd291bGQgYmUgd29ydGgg
aXQuIEp1c3QgYmUgc3VyZSB0byBkb2N1bWVudA0Kd2h5IHdlIGFyZSBkZXRlY3Rpbmcgc3VwcG9y
dCBmb3IgLS1zdHJlYW0tc2l6ZSwgYW5kIHdoeSBpdCBpcyBpbXBvcnRhbnQNCnRvIHBhc3MgdG8g
enN0ZC4NCg0KQmVzdCwNCk5pY2sgVGVycmVsbA0KDQpbMF0gaHR0cHM6Ly9naXRodWIuY29tL2Zh
Y2Vib29rL3pzdGQvcmVsZWFzZXMvdGFnL3YxLjQuNA0KDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXgg
WHUgKEhlbGxvNzEpIDxhbGV4X3lfeHVAeWFob28uY2E+DQo+IC0tLQ0KPiBzY3JpcHRzL01ha2Vm
aWxlLmxpYiB8IDQgKystLQ0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvTWFrZWZpbGUubGliIGIvc2Ny
aXB0cy9NYWtlZmlsZS5saWINCj4gaW5kZXggY2E5MDE4MTQ5ODZhLi4xM2Q3NTZmYmNkYzcgMTAw
NjQ0DQo+IC0tLSBhL3NjcmlwdHMvTWFrZWZpbGUubGliDQo+ICsrKyBiL3NjcmlwdHMvTWFrZWZp
bGUubGliDQo+IEBAIC00NjgsMTAgKzQ2OCwxMCBAQCBxdWlldF9jbWRfeHptaXNjID0gWFpNSVND
ICAkQA0KPiAjIGJlIHVzZWQgYmVjYXVzZSBpdCB3b3VsZCByZXF1aXJlIHpzdGQgdG8gYWxsb2Nh
dGUgYSAxMjggTUIgYnVmZmVyLg0KPiANCj4gcXVpZXRfY21kX3pzdGQgPSBaU1REICAgICRADQo+
IC0gICAgICBjbWRfenN0ZCA9IHsgY2F0ICQocmVhbC1wcmVyZXFzKSB8ICQoWlNURCkgLTE5OyAk
KHNpemVfYXBwZW5kKTsgfSA+ICRADQo+ICsgICAgICBjbWRfenN0ZCA9IHsgY2F0ICQocmVhbC1w
cmVyZXFzKSB8ICQoWlNURCkgLS1zdHJlYW0tc2l6ZT0kKHRvdGFsX3NpemUpIC0tbm8tY29udGVu
dC1zaXplIC0xOTsgJChzaXplX2FwcGVuZCk7IH0gPiAkQA0KPiANCj4gcXVpZXRfY21kX3pzdGQy
MiA9IFpTVEQyMiAgJEANCj4gLSAgICAgIGNtZF96c3RkMjIgPSB7IGNhdCAkKHJlYWwtcHJlcmVx
cykgfCAkKFpTVEQpIC0yMiAtLXVsdHJhOyAkKHNpemVfYXBwZW5kKTsgfSA+ICRADQo+ICsgICAg
ICBjbWRfenN0ZDIyID0geyBjYXQgJChyZWFsLXByZXJlcXMpIHwgJChaU1REKSAtLXN0cmVhbS1z
aXplPSQodG90YWxfc2l6ZSkgLS1uby1jb250ZW50LXNpemUgLTIyIC0tdWx0cmE7ICQoc2l6ZV9h
cHBlbmQpOyB9ID4gJEANCj4gDQo+ICMgQVNNIG9mZnNldHMNCj4gIyAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gLS0gDQo+IDIuMzQuMA0KPiANCg0K
