Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731CB22FC59
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 00:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgG0Woi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 18:44:38 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:30116 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726171AbgG0Woi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 18:44:38 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06RMgxSA012358;
        Mon, 27 Jul 2020 15:44:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=525sqUTcYb5GHN00Wyx31GhV58UMsp2kUidyci9tEbg=;
 b=DKfvvjESaD97aeFbr6c3CxDNOQfjVbETskLAdR+EB3OIRQA+X5Ykehup2FrGuWpqLy+P
 KB1WX0X9L8sbyo05S+vpxOlrBzHnuAVPgsWITmkK9qH74i9U1krgpRsAicTMm/3n162W
 M65jo5Jvms3M70hdIfttPIaQ353t2t93n1M= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 32h4q9eusq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 27 Jul 2020 15:44:00 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 27 Jul 2020 15:43:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLZ5UcTA1uS5k/ukLZPorYHVNi0KKHYfoLTw+Q2nbxWEDPcGzdT9v8dkGwWe5ENO4lroyYAOyxdKKWOgD1lmY3ZG0OFCGJUvddt6MvlCfVr/L6j9/DQa/jVn/8+A5l93nG+pCNgf/HSYfskX5gX1cXGt1mFKuUx+prWgT3Txp/BOOdQmOPXJXv5+bTbAG9InaoDDyf7I0K2l/Mrwvux2lTrwVyh+k0Re26NN+jh1/PtdXyADjInuS0oEG/Xcdcttq0LG+mVoB7XR6103oSIPKsO+PiezW4u8rNICZhrE0iVSgSjhviNI/rpiwjt90WTe4YR4FMPLj+Jbha+JcDnGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=525sqUTcYb5GHN00Wyx31GhV58UMsp2kUidyci9tEbg=;
 b=JVXHzwYKRQxM9PUY84RQvTGqNWY+IqIBo1my+5INGpITSn2Ayrrf7/j1SJKZ7QTpsp4mEOkzMJWrw4Q4m5kTQzDgVbGxjFVYVVPIk3GQYzp23kTqVXtsmSWEd01gXyk+xUOBst+XmhHZCpU9svE20TKPc5oPC5IBPI10wp96A9ok7I4AAHeTd4391oD0BcY5bkSPODLlLs0/j6wnSyzPNi8g0IwkgI2EnquTs+KITLp8nDW+wdf3wZcxCn6J2Z1a9gnQvqapZkg3d8+rVYG2GLI1nLwzrP5/pFainncIVv6tiuzHNbPpauJft9+xBR0VSvq9UT7YoS/Y+CkwmbhuOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=525sqUTcYb5GHN00Wyx31GhV58UMsp2kUidyci9tEbg=;
 b=h5UW3YNpBfD82XzKfJF+htXtKkss41wXeHZlgVVlzQnSVDopuuJ2XXz5+YmGFLBh2mVt4QigaomRgGly0fcAVSuDExwGwtOEsWWsqwXdEoR6irrAfDqPb0WMqZ5GvK7QuQMVfteltLOykI4kZyRR1U9gjaUZgsmZzfMD0u7bk0U=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2950.namprd15.prod.outlook.com (2603:10b6:a03:f6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 22:43:54 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 22:43:54 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Ingo Molnar <mingo@kernel.org>
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
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Thread-Topic: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Thread-Index: AQHWYSfJcwxv6ZmoP0i5UtMjZQMfxakWqQ0AgAVjcwA=
Date:   Mon, 27 Jul 2020 22:43:54 +0000
Message-ID: <AC589A09-D0F0-4E24-A431-C3601370B2E7@fb.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-7-nickrterrell@gmail.com>
 <20200724122640.GC632343@gmail.com>
In-Reply-To: <20200724122640.GC632343@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:c3fc]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b69d4dc4-acb6-4f31-846d-08d8327e8ad7
x-ms-traffictypediagnostic: BYAPR15MB2950:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB295020899C176A2B65CE01B5AB720@BYAPR15MB2950.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PaDRMBcl3ExuMh6M8ChYvKexiguO9UJJV1+aWiV3j/9FruKfAHGJxCz3nTWdLGmOzF5PzHMk5cd5x6aUULh9h18syjAMj0H4nOrnSg+EfgBwpmKkoNjMiQxGyRqVfLBPDDNJBl729j0HZxqWWAU/T0JAo2/QXGgDH01yuAYqNWY2aDe5MXkDtQOLqQlrRjQe0NqGC2I+Bt+AW7qS2yHUS37lF+I7UHZSB9LsSO/9nMOU+/u+vFo5yKrIf/79zP9vydL6WGfk2XAJLZPs+9Rkkj8HItjiYYMHfsF5/XwlkO6hMUTb5Sl1Q3kzy4qewVuW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39860400002)(366004)(396003)(376002)(346002)(33656002)(6486002)(6506007)(6512007)(8936002)(66476007)(66556008)(53546011)(66446008)(64756008)(2906002)(6916009)(66946007)(478600001)(76116006)(86362001)(5660300002)(8676002)(71200400001)(4326008)(54906003)(83380400001)(36756003)(186003)(2616005)(316002)(7416002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: QmnVl3eGQBnvwOAyFQhdyS1sANuox8alkGZeFgqWyPWO1qFjrIf4b2W9zr4Z66Q95cGVadiDnzEqm162VDBiAQyKaTFm6Yh+TECQeFonOuW0oE9aXTgft3FPHVQs+OJD7fn8Etp0EOGS3Sax2MJ5alYjplwfRY6aOXY1FsE8j2l5weYUUGUttOsBgSTwRk9e8OkaKE3725Epx8quX+i44/UqvJoVoukNfkDov+7gsUwWgkSRil4YfS4N5j7pbt/YCw/S/QuWJR9GwyDI3QnkBnMaLPSms9LHD+FuXKG0I6ZMsb4/1jadRGF6xVNse49b5k26kigUDra/dupoKHNm699ycnsHEAGeVYk0/re4uRJ7Z2f5rjyfFomZURL4BfEvTV++orCZ6/3I2gIU4p7Hcwji6ZIyeDzy23MX3pz/czom9deanrN7i5d9eJF6p5hX2+5cwK1OGvCvQ2QJChnztxfBDAnM/muRjJcFZF2//C88qS5DzCoB2FrmlR8Sqe/ZW15qA7cn3sZfZ1Ac2/SDkQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FA23E57C076A4A4F8873FC60CBF9D5A4@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69d4dc4-acb6-4f31-846d-08d8327e8ad7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 22:43:54.7034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ca+y2RGv68xa/dDgTp2hSeNGfmslSaiXL78+tiWqYOU1ih41HiVarLCM1zgagovU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2950
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_15:2020-07-27,2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 spamscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270153
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jul 24, 2020, at 5:26 AM, Ingo Molnar <mingo@kernel.org> wrote:
>=20
>=20
> * Nick Terrell <nickrterrell@gmail.com> wrote:
>=20
>> --- a/arch/x86/boot/compressed/misc.c
>> +++ b/arch/x86/boot/compressed/misc.c
>> @@ -12,6 +12,11 @@
>>  * High loaded stuff by Hans Lermen & Werner Almesberger, Feb. 1996
>>  */
>>=20
>> +/* decompressors bring in EXPORT_SYMBOL which is meaningless and will
>> + * cause compiler errors in some cases.
>> + */
>> +#define __DISABLE_EXPORTS
>> +
>> #include "misc.h"
>> #include "error.h"
>> #include "pgtable.h"
>> @@ -77,6 +82,10 @@ static int lines, cols;
>> #ifdef CONFIG_KERNEL_LZ4
>> #include "../../../../lib/decompress_unlz4.c"
>> #endif
>> +
>> +#ifdef CONFIG_KERNEL_ZSTD
>> +#include "../../../../lib/decompress_unzstd.c"
>> +#endif
>> /*
>>  * NOTE: When adding a new decompressor, please update the analysis in
>>  * ../header.S.
>> diff --git a/arch/x86/include/asm/boot.h b/arch/x86/include/asm/boot.h
>> index 680c320363db..d6dd43d25d9f 100644
>> --- a/arch/x86/include/asm/boot.h
>> +++ b/arch/x86/include/asm/boot.h
>> @@ -24,9 +24,11 @@
>> # error "Invalid value for CONFIG_PHYSICAL_ALIGN"
>> #endif
>>=20
>> -#ifdef CONFIG_KERNEL_BZIP2
>> +#if defined(CONFIG_KERNEL_BZIP2)
>> # define BOOT_HEAP_SIZE		0x400000
>> -#else /* !CONFIG_KERNEL_BZIP2 */
>> +#elif defined(CONFIG_KERNEL_ZSTD)
>> +# define BOOT_HEAP_SIZE		 0x30000
>> +#else
>> # define BOOT_HEAP_SIZE		 0x10000
>> #endif
>=20
> So the other patches explain why the decompression buffer extra space=20
> was increased from 64k to 128k, but is there a similar=20
> calculation/estimate for bumping BOOT_HEAD_SIZE from 64k to 192k?
>=20
> Admittedly the BZ2 exception doesn't set a good example, but maybe we=20
> can do this for ZSTD?

Yup, the next version will include an explanation. Thanks for the review!

