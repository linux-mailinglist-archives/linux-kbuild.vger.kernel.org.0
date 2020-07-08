Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 543A7217CE9
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 04:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728953AbgGHCDz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jul 2020 22:03:55 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:63506 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728676AbgGHCDz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 22:03:55 -0400
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0681xuaW015517;
        Tue, 7 Jul 2020 19:03:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=DhojswTe3vvd2EoZ6UipNiqU1QR+aKW/WjmdV+By3zA=;
 b=HtIUal9U64Q+Jz2Pf5TdD2io8+QoCJuQcHVV+muptjF9e4Z2mMMVd0/+zlFfp4vu0AUL
 SsUwWBx5ML5RLmnIwWwVNs97mfeRRSSTny5BPL2v+4ZVlPZucA8sD/DxaY0ZyzKan/ab
 OGSccwzbWNO3lJAAXJ9/BnU7IWKny++KmII= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 322q9vqnd9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 07 Jul 2020 19:03:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 7 Jul 2020 19:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0ZzDXy5WO9V2gOh/LkO4YazYx72S6CQ5ViofH/o48Lvq6A76JWv9Kzzt58Mj9UCB4JH1U25l0mp+S4urj+B001G/EgD7R8Ytt2g69k2XkOBhnILXwgJ04q45fs/ubKzjRoUfTMF3Yw0kSneYrV4M7P38Ml3/BV8fkceAQzXpDnWWD2ituF2jPqUIDjPnrJMn6gxodtFVrwhq1mowJ5xvxTKsXAItPnS5uXPr2b9FsuOcLq5jYhHaX3yv9GpK8Gin8768Jf3BLBX+6/eSGGn94ptSfLQ5nact43QRHSGGv4yT65DGv42Icd0DDvrHzIf1D8mkk0Jk+Mp//o6UiX4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhojswTe3vvd2EoZ6UipNiqU1QR+aKW/WjmdV+By3zA=;
 b=jPOip4YIlp0hRk3BK9bbTBHw/vkPQWYHNAVBAhUKKR4dq1iccaRaCiF7lQXSyfyq9TTQAES3VgtAodWimb+GKQn3O9kVHJz3gp1/t5Yzt7AnVyqxWGxsfU/m10sb9fWtsF8+3Te8cc5Kl/0ez4a69wcb+D4XjWz4b44lTLZyZuU10xThClh8TzRfir25bn/0kt9S3IsBJKTEfyBTBX69qdlccl0v0uMLX72Q/jcKDkquSUILcZ5o14ScvEHRfeu109RjFT50YHOAnZ4BWyk3ur+P0VbCu0NkCXg9nMzQkThxIsK34kbp32F49oGiMQBLoEBOOsjapmyjsxT+WF1gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhojswTe3vvd2EoZ6UipNiqU1QR+aKW/WjmdV+By3zA=;
 b=SxQJCbDDQogdzdzMZjb30Xwpir2i+2EvtUoGiDB1pcsAWDsy9ImusTyJwypgBxYg5i6+H9LWBI9gwtUYSQFGt068zxNFdU35CY24mJceVvkmyjwm99v4/TAcecBbdjM3aoYOcOeZWx+pnvw6spVR86005ROdBlUxqy4j+FpbOO8=
Received: from CH2PR15MB3672.namprd15.prod.outlook.com (2603:10b6:610:5::14)
 by CH2PR15MB3608.namprd15.prod.outlook.com (2603:10b6:610:12::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Wed, 8 Jul
 2020 02:03:24 +0000
Received: from CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::2d7a:edf5:67f9:5446]) by CH2PR15MB3672.namprd15.prod.outlook.com
 ([fe80::2d7a:edf5:67f9:5446%3]) with mapi id 15.20.3153.029; Wed, 8 Jul 2020
 02:03:24 +0000
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
Subject: Re: [PATCH v6 2/8] lib: prepare xxhash for preboot environment
Thread-Topic: [PATCH v6 2/8] lib: prepare xxhash for preboot environment
Thread-Index: AQHWVBHXOKd0s0bOZkueosgUG+r9K6j8q52AgABEKoA=
Date:   Wed, 8 Jul 2020 02:03:24 +0000
Message-ID: <ACBA859B-4BB3-40F3-A6D9-F22A48E5C1E2@fb.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
 <20200707034604.1539157-3-nickrterrell@gmail.com>
 <20200707215925.GA1591079@rani.riverdale.lan>
In-Reply-To: <20200707215925.GA1591079@rani.riverdale.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alum.mit.edu; dkim=none (message not signed)
 header.d=none;alum.mit.edu; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:8186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13e8d3bc-fc94-4424-8393-08d822e318e4
x-ms-traffictypediagnostic: CH2PR15MB3608:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR15MB36089F929B5E0152BE7F3AB4AB670@CH2PR15MB3608.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04583CED1A
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NQOZciPufLY6RGT2FdE6JK11tXQBgYA5F98Lr5LYTEz1rjSFVszU5Zkk6/7Mq2irvoNzn8uVmOfH2xi6wR+UbhZVrLEnGzd92KUH3bgtBenpVHKlmt5w067R3ZNM1zEXL3NSOa/L8jV5YB7BwJ4kZAxmB99qzx/3QnIPOx5k7Yfz0TKn4bk0r+znkJreYNvaHGX8h4Vcs+3FZR835VHyRzREIvDiHRj4tgsgV+oYQOJBQIIVguSadnhdAa7skpd+zxphVL3od4eHE09k5xjETDqMvo6N0n5sXROuzKInSEhGQBoEDgyuhEm1nkjvQ3rq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR15MB3672.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(396003)(376002)(39860400002)(346002)(76116006)(91956017)(66476007)(6486002)(64756008)(36756003)(66446008)(66556008)(66946007)(4326008)(6506007)(53546011)(2906002)(6916009)(5660300002)(33656002)(4744005)(186003)(8936002)(478600001)(8676002)(316002)(71200400001)(6512007)(2616005)(54906003)(7416002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 9tQSIPtzd38M06kFSlzdCMHZy5BLcTz2jcPbcrYuRhIYnwX/oINwOdeWnm/9DkvGqlmm8l/gHxrXsXXZQUd6p54vse24z6lZ3OVcyKrGyoMCHwBILFYIjZITNkWJEDMdtrWNyqySI2wnnPYzGtKz7af8op/BOU9S1wdkZTEYK4jG/YH+PAfwHlh3W0bZxmE8cURq98rcF6vhHWnh0CX2lxEBIwC5Emn7WFiaw26OwKiKp0eCspqTajD5VQ5gxjWfFTLDfA6UsNdqmBVjVVSaH2fpBo5GJckdAUfs/UDgbcnmt9Y9kIoZqWIdrFM8TO/+sldAcRCYCWCzDNlVDFNk2pbl9TJtCmOvHDwzL0mt21gqJ1a3MJqhbIyO3Ta9Lu9bLDonOYlyEPgrqadX08fUjtjL/4La4WjMN9VCiCWmFRo2FBd+ZNIxGzC/oaYz8VjLHhsb/Wynlgv+j4Bea0U8M/smVQ5IiS6x71Ao8BR7AMskD9RSJHU9H7kr6X57mC38yffuiBzy4tD7Woz8Gs8/Dw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E13629502AE10640976B1E9A4203D7C5@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR15MB3672.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e8d3bc-fc94-4424-8393-08d822e318e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 02:03:24.1755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rf5JcCBvcdCNC9FNjVAROdsQiMfiMQhwQcGxszPYweFRHGjr1+8Yq3uQzZZntQOi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR15MB3608
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-07_15:2020-07-07,2020-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 clxscore=1015 cotscore=-2147483648
 suspectscore=0 impostorscore=0 mlxlogscore=816 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007080011
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jul 7, 2020, at 5:59 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>=20
> On Mon, Jul 06, 2020 at 08:45:58PM -0700, Nick Terrell wrote:
>> From: Nick Terrell <terrelln@fb.com>
>>=20
>> Don't export symbols if XXH_PREBOOT is defined.
>>=20
>> This change is necessary to get xxhash to work in a preboot environment,
>> which is needed to support zstd-compressed kernels.
>=20
> The usual way to do it is by adding -D__DISABLE_EXPORTS to the CFLAGS, wh=
ich will
> cause EXPORT_SYMBOL to be stubbed out. Doesn't that work here?

I can do that. I did it this way because this was how other compressors did=
 it.

Thanks,
Nick=
