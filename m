Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9780818AA17
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2020 01:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgCSAzU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Mar 2020 20:55:20 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:58704 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgCSAzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Mar 2020 20:55:19 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02J0rPeM022514;
        Wed, 18 Mar 2020 17:55:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=691qmdkWO2cqKeM01BWnEZRmn+2bJWgpNbfZpwCVeC0=;
 b=MZhw1FbnUzAxl1qVk0ycWqQkOuKkiiY4KaUTDUAAcaVJQRxS1zMqkdXX6ZOQudMtaevH
 HF9qsbfkt/5q+9DtfHvGrDDl/RbJ7S65B/m02xuea/YUzS+/sSSQRWVIpxMPyoNP7koN
 WqbqyahtlUZBquELU46NFUQefkR4yBhVUtA= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2yua0wwh3c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Mar 2020 17:55:06 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 18 Mar 2020 17:55:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naeWQ3143+DlC1ofEGxW9LyhGPcWG0Tu7MXmrbZ1n4QaqmT7hTRhQ3q1bAk/uBNrOJQfdXTBJ+C4J8fr1ad1Rd12mIh0sPysQg9tjPOzMwyN5BTTV2kqVTEbq9asP7p8etilw9T+EG643sjsco2M2kaJsSqHZHTtAm90mkkdaQr8uKHFM3erXLmqXYDvJyRIVOHbmj3XJDWMeRBlNGOzqNAnPCw82pFhdpm2awK8jhplsHDQ8vGDppFHwoyGN5M7RLojGhyjvxEjCAOc09Ng3uQT1QTP49ZYTISc9AD+/05hQZxIhXssdvpnK1/S7gYLNEGVl+7pFxrQBr0Xcnk49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=691qmdkWO2cqKeM01BWnEZRmn+2bJWgpNbfZpwCVeC0=;
 b=jZPDRSofu6+1ZTTmaUbNQA1LdX3ks9pKWCoMUliJQycCZAi3t3uSJJmc3K8QmEnxwZ/lkCwlhgiUID8OM3xMfS9cBrprn0kQynU4hhT6NHbB5hCoW2NWmgIUOHAR3rIs0bOmiR4sPRULCgVN3Ta9iQ9YVfSdBKTavgyyAHX2c9Wu74+Llc52zy59aZPUtfeuCbywqHFnb8imwBu5e3znuhq9+quYvr9Gdq625aB0Cjy/gwxGXSXiSsS3b11D69fBOrBHhg7DEk4Mim428rr/rGq9LU+hSF39i/V2ZVdyJM9L1D40PbryGAZJ7vfTkb8Shh/7UbE8+DATezJVQoR6qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=691qmdkWO2cqKeM01BWnEZRmn+2bJWgpNbfZpwCVeC0=;
 b=GdROO43zl5eLfg/19VSjFL8ra5sAeN7UDRQlLpAZhgzskU8q4e2ZiZM2h5kGA91+Km02fYJmA/MjhGA703FL4GetLUQnNeVv5oSXzXgfsFA5dVgG2ZvpTfXXzSFh7EXduqO5I713GumK5BfV9P7lCk/8UAD3Kd9crocHOrfdRVI=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB4057.namprd15.prod.outlook.com (2603:10b6:303:47::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18; Thu, 19 Mar
 2020 00:54:45 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::5956:e4d6:26a3:343e]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::5956:e4d6:26a3:343e%7]) with mapi id 15.20.2814.021; Thu, 19 Mar 2020
 00:54:45 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Kees Cook <keescook@chromium.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        "Michael van der Westhuizen" <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>
Subject: Re: [PATCH v2 2/7] lib: prepare xxhash for preboot environment
Thread-Topic: [PATCH v2 2/7] lib: prepare xxhash for preboot environment
Thread-Index: AQHV/L7J3b58/AJhHkqx8p/CYi37fahO9HWAgAAkA4A=
Date:   Thu, 19 Mar 2020 00:54:45 +0000
Message-ID: <CE7DA1F7-651B-4ADF-859E-2AB1E7E4F5FB@fb.com>
References: <20200318002303.977158-1-terrelln@fb.com>
 <20200318002303.977158-3-terrelln@fb.com> <202003181545.B6CBE5FD@keescook>
In-Reply-To: <202003181545.B6CBE5FD@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [67.188.225.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd47cfec-8594-4b7e-ad6d-08d7cba01e36
x-ms-traffictypediagnostic: MW3PR15MB4057:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB4057F6400E8D43BC905E2BE2ABF40@MW3PR15MB4057.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0347410860
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(136003)(396003)(39860400002)(366004)(199004)(71200400001)(6512007)(66946007)(76116006)(33656002)(186003)(26005)(91956017)(66446008)(4326008)(64756008)(54906003)(2906002)(66556008)(66476007)(316002)(6486002)(6506007)(478600001)(53546011)(5660300002)(81156014)(8676002)(81166006)(6916009)(2616005)(36756003)(8936002)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:MW3PR15MB4057;H:MW3PR15MB3753.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 11IpS4ecb0dwjkEsJFcMg2/87Y3m24D2uqd12c2JtUdCN8jGDAPkX9lExhrVPDfxk1z/7o38pA+eOLifQfDPXrNS+8H83LLT2Y4RTkvxoQSI7N4KuUbwMR18Rn+Hba/RPPWpAQdajeOsIXokRTtSnCUzvgjMcvvVub+xg6YlzuV36jNf26wMzbY+5XmJQ2lkvk+sBPg7+BiDxILnxjEYqtOs/j8wU8E42ResQoijp19yOxe1S3+qrBm1f8TtlU/Cmu5X/Q2z3AUykpRjO5cIyLMrZ8efVDqyANmyY5LpeZXxpYf9nQ0sN4XGnWHebK8f9/C7WJeKui5IWJXHZuYvLV+XvCORrLf9RcP5NXNQI51/9gPfaDh5Dm2VoGQ4rOQDwd40Wx5yJFgQgJUINlwT18d/xkhrbU/wXVvY2txhYn9ZhnssFWVUX6q7vrIbPe6n
x-ms-exchange-antispam-messagedata: 7HCP0cnX3ocJli4o0/LPF6S/5I+40ha3iUVnzi0dQOJzxNo3TSLXrgDFGKMSdDXqo6ctU3LKc74152+8fvWMEmyfuv5nDFTzFagoDFL8BH+h7FHmFVBYWC+zjRlmlZZ70jNhESmlZKc7Bq1QspKLSg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B073666D29D665498C7F109DE5C51AC6@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bd47cfec-8594-4b7e-ad6d-08d7cba01e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2020 00:54:45.6478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lhw+qBaYrAa+yCHaA/xH9R4SmKM8xyB5ayryUtJIeovaCHULLSvX6BUHKropT14q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB4057
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-18_07:2020-03-18,2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1011
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190003
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Mar 18, 2020, at 3:45 PM, Kees Cook <keescook@chromium.org> wrote:
>=20
> On Tue, Mar 17, 2020 at 05:22:58PM -0700, Nick Terrell wrote:
>> Don't export symbols if PREBOOT is defined.
>>=20
>> This change is necessary to get xxhash to work in a preboot environment,
>> which is needed to support zstd-compressed kernels.
>=20
> Hmm, I thought using this:
>=20
> #define __DISABLE_EXPORTS
>=20
> before the #include of the .c files solved this?

I was able to get __DISABLE_EXPORTS to work. However, that still leaves the
MODULE_LICENSE() and MODULE_DESCRIPTION() in. I would prefer to use
the same method other decompressors use, because it is a well tested route =
and
debugging is hard in the preboot environment. If you feel strongly about it=
 I will
change it.

I will plan on submitting a v3 tomorrow morning that fixes the style nits, =
and
splits PREBOOT into XXH_PREBOOT and ZSTD_PREBOOT.

Thanks for reviewing the patches!

-Nick

> -Kees
>=20
>>=20
>> Signed-off-by: Nick Terrell <terrelln@fb.com>
>> ---
>> lib/xxhash.c | 21 ++++++++++++---------
>> 1 file changed, 12 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/lib/xxhash.c b/lib/xxhash.c
>> index aa61e2a3802f..7f1d3cb01729 100644
>> --- a/lib/xxhash.c
>> +++ b/lib/xxhash.c
>> @@ -80,13 +80,11 @@ void xxh32_copy_state(struct xxh32_state *dst, const=
 struct xxh32_state *src)
>> {
>> 	memcpy(dst, src, sizeof(*dst));
>> }
>> -EXPORT_SYMBOL(xxh32_copy_state);
>>=20
>> void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state =
*src)
>> {
>> 	memcpy(dst, src, sizeof(*dst));
>> }
>> -EXPORT_SYMBOL(xxh64_copy_state);
>>=20
>> /*-***************************
>>  * Simple Hash Functions
>> @@ -151,7 +149,6 @@ uint32_t xxh32(const void *input, const size_t len, =
const uint32_t seed)
>>=20
>> 	return h32;
>> }
>> -EXPORT_SYMBOL(xxh32);
>>=20
>> static uint64_t xxh64_round(uint64_t acc, const uint64_t input)
>> {
>> @@ -234,7 +231,6 @@ uint64_t xxh64(const void *input, const size_t len, =
const uint64_t seed)
>>=20
>> 	return h64;
>> }
>> -EXPORT_SYMBOL(xxh64);
>>=20
>> /*-**************************************************
>>  * Advanced Hash Functions
>> @@ -251,7 +247,6 @@ void xxh32_reset(struct xxh32_state *statePtr, const=
 uint32_t seed)
>> 	state.v4 =3D seed - PRIME32_1;
>> 	memcpy(statePtr, &state, sizeof(state));
>> }
>> -EXPORT_SYMBOL(xxh32_reset);
>>=20
>> void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
>> {
>> @@ -265,7 +260,6 @@ void xxh64_reset(struct xxh64_state *statePtr, const=
 uint64_t seed)
>> 	state.v4 =3D seed - PRIME64_1;
>> 	memcpy(statePtr, &state, sizeof(state));
>> }
>> -EXPORT_SYMBOL(xxh64_reset);
>>=20
>> int xxh32_update(struct xxh32_state *state, const void *input, const siz=
e_t len)
>> {
>> @@ -334,7 +328,6 @@ int xxh32_update(struct xxh32_state *state, const vo=
id *input, const size_t len)
>>=20
>> 	return 0;
>> }
>> -EXPORT_SYMBOL(xxh32_update);
>>=20
>> uint32_t xxh32_digest(const struct xxh32_state *state)
>> {
>> @@ -372,7 +365,6 @@ uint32_t xxh32_digest(const struct xxh32_state *stat=
e)
>>=20
>> 	return h32;
>> }
>> -EXPORT_SYMBOL(xxh32_digest);
>>=20
>> int xxh64_update(struct xxh64_state *state, const void *input, const siz=
e_t len)
>> {
>> @@ -439,7 +431,6 @@ int xxh64_update(struct xxh64_state *state, const vo=
id *input, const size_t len)
>>=20
>> 	return 0;
>> }
>> -EXPORT_SYMBOL(xxh64_update);
>>=20
>> uint64_t xxh64_digest(const struct xxh64_state *state)
>> {
>> @@ -494,7 +485,19 @@ uint64_t xxh64_digest(const struct xxh64_state *sta=
te)
>>=20
>> 	return h64;
>> }
>> +
>> +#ifndef PREBOOT
>> +EXPORT_SYMBOL(xxh32_copy_state);
>> +EXPORT_SYMBOL(xxh64_copy_state);
>> +EXPORT_SYMBOL(xxh32);
>> +EXPORT_SYMBOL(xxh64);
>> +EXPORT_SYMBOL(xxh32_reset);
>> +EXPORT_SYMBOL(xxh64_reset);
>> +EXPORT_SYMBOL(xxh32_update);
>> +EXPORT_SYMBOL(xxh32_digest);
>> +EXPORT_SYMBOL(xxh64_update);
>> EXPORT_SYMBOL(xxh64_digest);
>>=20
>> MODULE_LICENSE("Dual BSD/GPL");
>> MODULE_DESCRIPTION("xxHash");
>> +#endif
>> --=20
>> 2.25.1
>>=20
>=20
> --=20
> Kees Cook

