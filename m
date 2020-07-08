Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBB4217CE6
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 04:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbgGHCCY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 22:02:24 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:34984 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728973AbgGHCCX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 22:02:23 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0681x1x0030145;
        Tue, 7 Jul 2020 19:01:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=TJtFxJDfUfd57qPUvcbQgKr0oK9nBTT4RTKa37Na8mg=;
 b=g5NfoxZYvV1J2OGBSW2QYo/fUZPZC7in3QUK+qKLayYezZ4ARtF+EMNQ8g6eLGpKHp8J
 PZyKGni3cZpvMBV7qFedJvdrXWSy3cMdHJH5B0qlZlP+kqubbChNjsX3VR4RMmCDvCbl
 ZWWMU7FGpVZmvFHeq1x6T3Acx5mfyTNave0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3239rs4y84-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 07 Jul 2020 19:01:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 7 Jul 2020 19:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WB3SUyKw8kBnqQHArc64owI8fV266BnoOBAK3fHXVrsBs/hqTJ2cy0CY/l7ukSa0gDg8JyoROjtKoyZjbCK6FTgdaRdKvM74bSe4cwvf7HyPaIVBLC1PORDxKlBOgPcm+XRVV8OTrETNJtq3K15baNZZ8v2MPZwAElvCXU+GS1mWZ3Z6J1GMgcQEiJnxLQ8QpippbpaJJyRnf7KM+oaHVkeBqoBHrF4tmAX26QKpGT9Yfz79amw9xyiKVnuRq5VF1eBdEO7MKlG/UiX2O63CFpICuRljYCq66Vh50PypljIoeyIdcU5wObtzQy5ic90hiFoxSRm580ndFOrSpMHulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJtFxJDfUfd57qPUvcbQgKr0oK9nBTT4RTKa37Na8mg=;
 b=VQgXgrJ1omTiIwOX9ptOGd2JF7LwI/Eairyj265pwcAvVyt3CxbXbiGtld/adjyJ5pXD7qPh9E5tYITqCXFSfz/HhFc/lcc6BZCz81EhMMPz95RQvy+rNzYmgHi7hAWuVi60foDj76pdfIMqVi6mgS34fJVrKY4DprXORDiSoNuw33Hg8Ogh4pf2kMSUTO6C75213E4G88hK8msZ38tIPkvaYZC7EpWjy5qOEfYW4+m+EZ/VPZ6+kgp+wYlrrvGq88gcnlzYKGskkZcWAPDmqjxMunUDnTYF4jlTPVDnGlwgiP4gDxS5UB0Z/S8Qy6XhpH0r1yjT29EU23mtISD9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJtFxJDfUfd57qPUvcbQgKr0oK9nBTT4RTKa37Na8mg=;
 b=OUcXsmi5QZsr+nD16L0W8wiIMxEWZXoHRb2DYrLDr1fgI1pE1MLLgYaQxCZkq60SppGSNE3piYnk2Vrb7prnpxyfA9r8hB0W0xrYtrrb1T/gDKsXD2jlut+j+TnGi8++Fv7S93loqb+7kpZwOSaqoAeiaepaalVGzMprbCXv9MU=
Received: from CH2PR15MB3672.namprd15.prod.outlook.com (2603:10b6:610:5::14)
 by CH2PR15MB3670.namprd15.prod.outlook.com (2603:10b6:610:a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 02:01:50 +0000
Received: from CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::2d7a:edf5:67f9:5446]) by CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::2d7a:edf5:67f9:5446%3]) with mapi id 15.20.3153.029; Wed, 8 Jul 2020
 02:01:50 +0000
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
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
Thread-Topic: [PATCH v6 4/8] init: add support for zstd compressed kernel
Thread-Index: AQHWVBHah0xsJt/cakyKnqlA4hkEhaj8rv0AgABAWoA=
Date:   Wed, 8 Jul 2020 02:01:50 +0000
Message-ID: <BFD3E8B0-4BAA-4E3A-AF16-FB17E88BECFE@fb.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-5-nickrterrell@gmail.com>
 <20200707221130.GB1591079@rani.riverdale.lan>
In-Reply-To: <20200707221130.GB1591079@rani.riverdale.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alum.mit.edu; dkim=none (message not signed)
 header.d=none;alum.mit.edu; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:8186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 482ac2a4-4eb1-43f5-9d0e-08d822e2e131
x-ms-traffictypediagnostic: CH2PR15MB3670:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR15MB3670D396C70318BE0FDF89C6AB670@CH2PR15MB3670.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ocLsk+HhBoIC5SvWm90nQ2JXH5JMniZF2+QvbX7TvupBV2wIY0ddgGBCWX4KFzthTTnyqCMrMN0YMmQVue8om26SVACoeAMJ8uRMSuswq9x6eNG6GtYMYeKsC43Raw6n9o1Uc8XIZWgm3mkOSJl+0Op87iNFZnSDH9M87YZJQzZCfYsJnUA6p0eOOZR5vrdfX1IxDEOtzFy8Mx0EtAPF2BLAvh2ho3Zrjv3V4CGH14o0UL6nQP0id2cXHuVpoIMzlAk2aEJQP1QzFTdz6Hx58ifms6CUls2dS6ET6jNZWU+qG9DVmjShjwv5RxL/SwT9Lj2ftabxmgVmer3b0QQxFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR15MB3672.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(396003)(39860400002)(376002)(136003)(316002)(83380400001)(8676002)(5660300002)(6506007)(71200400001)(8936002)(53546011)(54906003)(64756008)(66446008)(66476007)(478600001)(66556008)(36756003)(76116006)(2906002)(6486002)(91956017)(186003)(2616005)(6512007)(6916009)(4326008)(66946007)(7416002)(33656002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: wfO7VKk0osYYDGYwJqwxt/NNyoZmGFFRYSMh9UQ6PxmkWFp8JBs+X+T6UM42c7JKigu78ZTePlykvUj6CqEBvlQmCCa6oAAMCbDZaXKKfmW5Oh02l0joDMMlMDIKLdbAnhqjvNoqBcCYiMz2wuPGRYr1/eaYTRb4GT9mHimOddNy9kkjIpSMjWrngvHMyaoXnhkqTxUKxuo0w7Fg26yL3qWi7yszgYvrmmTWy0vTU1UeQKNuWB26ymCXSN3o8bwe1Dlqh9jlAqthP1w2j277OC1wTVebipLlcO9c15MFfDbvEKlb1gO4AFdIoVKhVf1eWxOm0zB++Y3kEOmQfN1UUgKV8QNngfKq3UhtGqZks2HXK/MIt8VdcB96So0GQllmkV35bpKpqSCNXdadfLxJVvg3lq+TarQms4JLV74rIPAc1LedEXivADwv7Pt19vSNXhb/kmoDY1q53M6vO1VO43Sc3ONVzPA1LV9p0gh80Y6/S3tYkeE61BK1c3ec6qzUz5Yq+mXA+5EA4Vf6NBRXkQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A44DE559F25940449F9AB288F69D74BE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR15MB3672.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482ac2a4-4eb1-43f5-9d0e-08d822e2e131
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 02:01:50.7964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZMPykZ50QKBhHmprTgdh6UUctdRTET6iw0EXyQJDkIxPGMojvBBb2NYSX3B64VK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR15MB3670
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-07_15:2020-07-07,2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0
 malwarescore=0 cotscore=-2147483648 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007080011
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jul 7, 2020, at 6:11 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>=20
> On Mon, Jul 06, 2020 at 08:46:00PM -0700, Nick Terrell wrote:
>> From: Nick Terrell <terrelln@fb.com>
>>=20
>> * Adds the zstd cmd to scripts/Makefile.lib
>> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
>>=20
>> Architecture specific support is still needed for decompression.
>>=20
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 916b2f7f7098..d960f8815f87 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -413,6 +413,21 @@ quiet_cmd_xzkern =3D XZKERN  $@
>> quiet_cmd_xzmisc =3D XZMISC  $@
>>       cmd_xzmisc =3D cat $(real-prereqs) | $(XZ) --check=3Dcrc32 --lzma2=
=3Ddict=3D1MiB > $@
>>=20
>> +# ZSTD
>> +# ---------------------------------------------------------------------=
------
>> +# Appends the uncompressed size of the data using size_append. The .zst
>> +# format has the size information available at the beginning of the fil=
e too,
>> +# but it's in a more complex format and it's good to avoid changing the=
 part
>> +# of the boot code that reads the uncompressed size.
>> +# Note that the bytes added by size_append will make the zstd tool thin=
k that
>> +# the file is corrupt. This is expected.
>> +
>> +quiet_cmd_zstd =3D ZSTD    $@
>> +cmd_zstd =3D (cat $(filter-out FORCE,$^) | \
> 		   ^^ should just be $(real-prereqs)
>> +	zstd -19 && \
>> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> 	   ^^ size_append does not take arguments. It's used as just
> 	   $(size_append) and will always output shell code to print the
> 	   total size of $(real-prereqs) -- see other compressor command
> 	   definitions.

Yeah, when I wrote this code, this was how the rest of the compressors were=
 implemented.
I noticed that they had all been updated when I was responding to Norbert L=
ange earlier.
I will submit a v7 shortly with the updated command.

Thanks for the review,
Nick


