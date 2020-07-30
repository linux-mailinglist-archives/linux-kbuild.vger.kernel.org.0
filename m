Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E535233832
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 20:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbgG3SOP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 14:14:15 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:11688 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726343AbgG3SOO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 14:14:14 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 06UIDtLu018998;
        Thu, 30 Jul 2020 11:13:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=CUDgbKJ4PrTmpPV+hPUQ3VnpzZD9aw+Np10wUL0uIW8=;
 b=XL9ecv8ftwn6veneSoWhIX9OqWw7tS/DgkN+MVrJx2M4vsucXhtCMem4XfnjmUrdLFTi
 yB91J8XdX8215JbA1CtRpBlfxYQogCt4AAKpirx1tlHJ+Vv1VU24q4qLuiQtmMDuRUCj
 gVy5I742tJyEm9GyJbbTwcmxf44boYcOQeQ= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0001303.ppops.net with ESMTP id 32m0b1h73u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 30 Jul 2020 11:13:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 30 Jul 2020 11:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWT7ntfA4PnUHudXEzRK6uV8vqgKHTrbL7G2vyooQNe249KMJkew2FJUsQn1DfevHl4R/3ZBEAjHdUxyU8b/t/8yqIFB/R6nBbfLrWdpnQy2pstwHG1V/0uFrxEPC+/zc05ioQAzSANMIwWbkCU2LsC48G0ZXfT1o0lfLWwDt1/I9T27ekCGniZfnrwZCVsecFP75I7Qj6chN9GgneGZgLCgpjOuMjrCpJVRXZ62+04PzMuEzVgZpyHHoYenfJeP0oCSjyM+FQ/iAAC5OevGe1swv0g4JyXFtmyh4H3u525zmRVKuaDXvQQZJ1dai/+5VeyCFJCUdG5pOe5iq11UFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUDgbKJ4PrTmpPV+hPUQ3VnpzZD9aw+Np10wUL0uIW8=;
 b=mpC0lRZypjoCIfdEBKKfvd6Jqo8JK7jUfLcRIDoiwh/YNazJGy2leFpCSvst1ASs0AbRS0Er+ctOTB+16+rVHq4JnMBep2IOvSaBkMs9X6iowab0p0u/g2236yQWEGGbv826/lAUEsSgoOAymiR8iM78a9NSia3GaxLm4o6W2pOSsSPbgIk2WCqFg6mWYO5Y6pK7a/30m2f7ZH4QJfXM4hXneZKg4q9EBUibEFMJ3d9d3e3c+HkefJh+HpYMwN6y3Z0ZKUEV7pTGscQMM8Uqlfzp0kEFjDTqK//IFCiZ/rmtHmpOCgwdSltL7Z3sh36dBbjeMps7dHxKnk2LcSLMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUDgbKJ4PrTmpPV+hPUQ3VnpzZD9aw+Np10wUL0uIW8=;
 b=ADvQj2MmdJdocF6Rkj6V59TAOireaWFDte5Vstct/NUuMcuOWb4eC2om+guyQQHquoOFhMxwmcvZZuNd/pPEDLz++4EUvjuOa46E0/RBu97if3zbWR2chvMapdFbl0L8+Ww2BejbBM74U38qWr3yrRtNflwTo26Cvaj6bNAahnI=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3416.namprd15.prod.outlook.com (2603:10b6:a03:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 30 Jul
 2020 18:13:25 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 18:13:25 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>,
        X86 ML <x86@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>,
        "Kees Cook" <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        "Michael van der Westhuizen" <rmikey@fb.com>,
        Ingo Molnar <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH v9 7/7] .gitignore: add ZSTD-compressed files
Thread-Topic: [PATCH v9 7/7] .gitignore: add ZSTD-compressed files
Thread-Index: AQHWZGtJmxgsOYryuUm7L41JepBoG6kcOuYAgAQ2fQA=
Date:   Thu, 30 Jul 2020 18:13:25 +0000
Message-ID: <122D43A9-7F77-4965-ACDE-9200DC062688@fb.com>
References: <20200727230606.906598-1-nickrterrell@gmail.com>
 <20200727230606.906598-8-nickrterrell@gmail.com>
 <CAK7LNATHBfYHXoz5=b8hc7c61JeZP6UiJjOX3r+S3WHRwnUm6g@mail.gmail.com>
In-Reply-To: <CAK7LNATHBfYHXoz5=b8hc7c61JeZP6UiJjOX3r+S3WHRwnUm6g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:aaef]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d28ea43a-f20a-4c0e-39f4-08d834b440a9
x-ms-traffictypediagnostic: BYAPR15MB3416:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB3416EA151F4C54B185249304AB710@BYAPR15MB3416.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QkPxnHSkFF8JvbuTUgKLWoUKSKrnuy4SBZZ0pFuiryEIHwHd4NgRY6pVgmfsi3MwAmMgba/91AP4Q8jnbNBJxGyyQNywSY5h20rZER7+UQzJiHOHoonK+/97GPPLPMHI34sThstUG+ljIfji/fXLWx97qluX3JhsdaIXrKtgJ0HZGOofBKGkSMLl4Cza9gDy9gXAZoZO+fmKYsz0tQrN1BpDg2TXdmndefemlaLRn565NUaaq0FxaaQraxBTscr9silQof0FIrSNBXO4/oOnVNaILWL/ueQgXepY6Du9o05VH48ZDyX61a7Ozm0yy344VkBa4kGMC18suRJcO4j+Dg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(396003)(136003)(39860400002)(66946007)(54906003)(71200400001)(4744005)(6486002)(86362001)(2616005)(64756008)(66556008)(66446008)(76116006)(2906002)(66476007)(316002)(4326008)(478600001)(36756003)(53546011)(6506007)(6916009)(83380400001)(8936002)(33656002)(8676002)(5660300002)(186003)(7416002)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: RcE6OKDzs9Ycs3HzoVgJ2bvAv0gS1fVHpnnKBOlLA7xZ9vxLv6ars5eG65PCuIrV0YegBh/2GuVdMWXrU6Jgsw9Nt7NlyLUFT1OlegY5ywqGJ9KSN04awS2RqfhMxZkx31WwSO/BTxQv0qCXMISvgRGi7gKE7oHkz4aXLRvoHJ6RNKGTiAriyT87nOQ5Uk6kd8vQTmqou2LvnTnpQCcP5yAdjwsUFZWsmvN9XgZi4rnCNmRNAeUIG4u8ttdtftSjl3+6BwM5IHXk+gqInFANu3LIyw5zddv0c8m0sgX8dKr7koYiGzDiGmqlUVz4lAtxE8X572T/lW/7ytlZT/OC5dH4sjZD5y648/0egjYbTEYa/CnzMCcuKhdB1Ks4G20EPDy3lyehIMM3pwlw0uE1PQCtRTc8D+PGmenEky82BrJt02baqlVlEVKHCcGwfwOlyXL2/QCAZJDjmJuzhvRV6DKtdDLaTTPGbVlJA8G6FUh/5h6B4mx7z5OppBOqvJddD9YvsEaDYfVObb0NseFNjw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CAB725B4BDBDEC48B5CBDD93B204CAE8@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d28ea43a-f20a-4c0e-39f4-08d834b440a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 18:13:25.5835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ns0udL1xdY/FfUz7UScfwpBNnHBMQQz2PicYYEvsvUicLHbym6HXvhhQekTsnHZv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3416
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-30_13:2020-07-30,2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300130
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

DQoNCj4gT24gSnVsIDI3LCAyMDIwLCBhdCA2OjUzIFBNLCBNYXNhaGlybyBZYW1hZGEgPG1hc2Fo
aXJveUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgSnVsIDI4LCAyMDIwIGF0IDg6
MTEgQU0gTmljayBUZXJyZWxsIDxuaWNrcnRlcnJlbGxAZ21haWwuY29tPiB3cm90ZToNCj4+IA0K
Pj4gRnJvbTogQWRhbSBCb3Jvd3NraSA8a2lsb2J5dGVAYW5nYmFuZC5wbD4NCj4+IA0KPj4gRm9y
IG5vdywgdGhhdCdzIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC92bWxpbnV4LmJpbi56c3QgYnV0
IHByb2JhYmx5IG1vcmUNCj4+IHdpbGwgY29tZSwgdGh1cyBsZXQncyBiZSBjb25zaXN0ZW50IHdp
dGggYWxsIG90aGVyIGNvbXByZXNzb3JzLg0KPj4gDQo+PiBUZXN0ZWQtYnk6IFNlZGF0IERpbGVr
IDxzZWRhdC5kaWxla0BnbWFpbC5jb20+DQo+PiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVz
Y29va0BjaHJvbWl1bS5vcmc+DQo+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIFRlcnJlbGwgPHRlcnJl
bGxuQGZiLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFkYW0gQm9yb3dza2kgPGtpbG9ieXRlQGFu
Z2JhbmQucGw+DQo+PiAtLS0NCj4+IC5naXRpZ25vcmUgfCAxICsNCj4+IDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvLmdpdGlnbm9yZSBiLy5naXRp
Z25vcmUNCj4+IGluZGV4IGQ1ZjQ4MDRlZDA3Yy4uMTYyYmQyYjY3YmRmIDEwMDY0NA0KPj4gLS0t
IGEvLmdpdGlnbm9yZQ0KPj4gKysrIGIvLmdpdGlnbm9yZQ0KPj4gQEAgLTQ0LDYgKzQ0LDcgQEAN
Cj4+ICoudGFiLltjaF0NCj4+ICoudGFyDQo+PiAqLnh6DQo+PiArKi56c3QNCj4gDQo+IA0KPiBJ
ZiB5b3UgaGF2ZSBhbnkgY2hhbmNlIHRvIHVwZGF0ZSB0aGlzLA0KPiBwbGVhc2UgcmVtZW1iZXIg
dG8gYWRkICcqLnpzdCcgdG8NCj4gRG9jdW1lbnRhdGlvbi9kb250ZGlmZiBhcyB3ZWxsLg0KDQpU
aGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0ISBJ4oCZbSBwdXR0aW5nIHVwIGEgbmV3IHZlcnNp
b24gd2l0aCB0aGF0IGluY2x1ZGVkLg0KDQpCZXN0LA0KTmljaw0KDQo=
