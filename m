Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1148F234A24
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jul 2020 19:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733055AbgGaRSG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jul 2020 13:18:06 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:25004 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732872AbgGaRSF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jul 2020 13:18:05 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VHEg9i021888;
        Fri, 31 Jul 2020 10:17:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=ek2QvP50qx5pRgxYs61DqFK+Ez9nF3eDGkjYO/fWa20=;
 b=aa+669yQJDyoUhYwj5LD5YRQ15zP7PcXT3ouMUB2+a0fZccA2YtpaDy2rJ8mxv2GCUUY
 R9RBAN2VCatp2yNp/TqRXu3FS1yvaLSmEFVMRczbGIOf5HB8vbTxKpJbgRhBAcY+mE91
 5mRYBLTXKBvsfXzxr+uKh+woHbFbbJQ9YOw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 32m35fd78b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 31 Jul 2020 10:17:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 31 Jul 2020 10:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYI7LPxqEWl1L9zIXQ8G/5DR1ap00G1P+pC918sRTrUO/mi07Gc/1b0IOFBAkL/YodcOgVPfjtY332hy390x3iF5YSbaXLDy4dSYleL8K6wzd8/RYXJIK9kMM0Yq6aBicXIIFEhlT75Wu3Sff/2TV3lM8LIK/fwcqW+JGjX/zUpJGl459M3bBss/zf7DI4qb4cfBlNhWUHr0JHaL29PSAj0OjR1plyR2rnCgeEJ3ueF9w/OVklWOpcOZz6N8QuvL4Mwu4WxlTnpiPkdhOv+xzIs/UniQzBv0dCiL+/m8nnWVPJqXgIo0q7rYBZTOssq7ocoQmU3r8y0lsGPuqsrrUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek2QvP50qx5pRgxYs61DqFK+Ez9nF3eDGkjYO/fWa20=;
 b=KyVn1RVaVd7tgmKT/tdjfpfQQ2zC8nsfEG5OXPe5YYQTCfytWomIRZAZWwfXRMnuVVpW3a97Bih5YidZiYWQ8s0PhP8PnKsFRfJ8r8RDGGXJd5k0eHqChS2ojnhxJOLg4NQb2IJB8K9lNY4n2rZDvsCzCD/m6uoFMVMjbwTzoGB7OZkYbV5D1ywhgODuA0TatvPuHXtqd8X4t8HYYCL5uwjtkF1mfW+A8s1K1zaRRXxbomunIrPCk5JboyGB52sqHotnwWTZPnzzjomBEFTrCZwvmEVhcTErobbVsXrmZC3TlWh3DE2NXSVaZ62imuv3k71RiNnN9rNhY9DaeBGJsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek2QvP50qx5pRgxYs61DqFK+Ez9nF3eDGkjYO/fWa20=;
 b=eNxHvIT7gBZIMoiFyHavJbUNf/pekfFxa9s5liLrmaRKi41aaY6tIUvoIfjCFCr6eEtlxtrCtxvqaD9XgmIF28fz+o3wNPvLSfwTEPBPbJMvpzISjzn6aPHY4DKQlG3LRsqMG9/6xP8PdUjMAKIcGnfPkwnmsC4RyAKB5D43ugk=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2773.namprd15.prod.outlook.com (2603:10b6:a03:150::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Fri, 31 Jul
 2020 17:17:24 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3216.034; Fri, 31 Jul 2020
 17:17:24 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Ingo Molnar <mingo@kernel.org>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "Patrick Williams" <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "Norbert Lange" <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Alex Xu" <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v10 7/8] .gitignore: add ZSTD-compressed files
Thread-Topic: [PATCH v10 7/8] .gitignore: add ZSTD-compressed files
Thread-Index: AQHWZqVOTZAFAcUlT0WSOyEBD0eCNqkhcssAgAB804A=
Date:   Fri, 31 Jul 2020 17:17:23 +0000
Message-ID: <BA74ED3F-CC1C-4294-A3A0-2591B9FA6387@fb.com>
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
 <20200730190841.2071656-8-nickrterrell@gmail.com>
 <20200731095038.GA15126@gmail.com>
In-Reply-To: <20200731095038.GA15126@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30264857-df99-47d1-91f1-08d83575976b
x-ms-traffictypediagnostic: BYAPR15MB2773:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB2773120452D5E8E2DAEC732BAB4E0@BYAPR15MB2773.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VDDIVw1aYpNpFyHzPrWXDnnxJv+6/LYnmGj2j+byxzXyPUKK/81jOgQ1kE0LUq0eiwQCJpRffyEzSYBuDsVM4PaeS/rTtV1vyhDwkvxPaNyCbRjJYpA7S0OATLdf4H99anaBbywqseNuJrC/VKHN/if6dQ0Z8h/mHOmB+Bte2pHlgY3wyccHQ7a496OQf9vQhFBmtKV5HQuql+XH3da3OEc4T8lJ7hlv+lBxTxBg8v9hBJRPkCk3W9HlX9UmDD4DwKg+oCYYH/KI1+vHzLrV/7rg7rnlQ570ZLHUAY1pqFSar8VloOqvOXjsjAqMGzNU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(366004)(39860400002)(136003)(376002)(346002)(26005)(2616005)(83380400001)(33656002)(5660300002)(66946007)(76116006)(66446008)(66556008)(86362001)(186003)(36756003)(64756008)(6506007)(4326008)(7416002)(4744005)(53546011)(2906002)(66476007)(6512007)(8676002)(316002)(6916009)(8936002)(478600001)(71200400001)(6486002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: OlaoW/+j2YHTEhROMfIOOe/Wcfc/mw15emO2yVs/ypmrFJczpApEOboEWItDNb1yyD0ArmkH9xLbbUXuUuYLSqKU2/wXKtWA/mOXKT3FmJoDhlwBW5CnESJKSzy0PYFhKRyaEA/86YuaumpFCuuX0rZKZG+8v7kxq1zsWfdYWBh80qzBOwRO5hRBsYBxvx4ipQEf+lWlpptP9swCk00fbjoHx6fz8+lEQcRSwgJBr44+W3GaTsibQcIirldH3J+RuZ86P7F0wQj/AtcpekRZ+ODks/XdP59FAcgTlRtFNSyvLJHHYrrcjBB65p3ZZoTyLv5Iav4sOXi4hNCtOWdO3+q7DUsKsT/pYlyuZ3nNj5lS2EjdC9K1IHgp2sZfefWKEBPL5HPF+f7eY7HKeguTs1Ft91w9tUcn0eYWoRldYJ61+Ioef/eimCxu+iLt7BWmsQ0yOoBjoJp4YYIRqlGgF35bS+EjHYBF86xoZYUNeTY=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <476881A058A23D45B18F333D6720962B@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30264857-df99-47d1-91f1-08d83575976b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 17:17:23.9041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2ZqpxwyDz8ATEuBJvm/p9jWLZUwV7ij/U7h2XdVDiAD+0Z/lOZbF2knivkfFtE5p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2773
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-31_06:2020-07-31,2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 mlxlogscore=773
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007310130
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jul 31, 2020, at 2:50 AM, Ingo Molnar <mingo@kernel.org> wrote:
>=20
>=20
> * Nick Terrell <nickrterrell@gmail.com> wrote:
>=20
>> From: Adam Borowski <kilobyte@angband.pl>
>>=20
>> For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably mo=
re
>> will come, thus let's be consistent with all other compressors.
>>=20
>> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>> Reviewed-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Nick Terrell <terrelln@fb.com>
>> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
>=20
> I presume Adam Borowski's Signed-off-by was intended to be added as=20
> the first entry of the SOB chain?
>=20
> I've added it, please let me know if that's not OK.

Yeah, it was. If a new version is needed I will update it.

