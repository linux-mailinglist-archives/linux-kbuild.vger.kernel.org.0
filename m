Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139253505AA
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 19:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbhCaRki (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 13:40:38 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:37480 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233935AbhCaRkZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 13:40:25 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12VHcrdh032520;
        Wed, 31 Mar 2021 10:39:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=lmAHSw7AYUX6fqWRVUkOnRcAQohlWXTHMWsnWs24Tvs=;
 b=UKIIOdilZUwxq5JAUNFXnnploUvQuaKh8app6X8W9qCcC4Bs7mIudvXa0Q0d6UOSjUa0
 A5ufXhwb49bCsyTT5kET1O1Y0lT7LPdQDclIWHJNCvYX9i4ysfMHKUVBPE1iaa6ACWmj
 SJ6Iy3ZK6eJH9aSA2ov2zs0rjwIOky6fAgo= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 37mqdqjakc-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 31 Mar 2021 10:39:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 31 Mar 2021 10:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DX68w1QfkVEhmbLLfSN5/D/xTn6ORpZ/zzY7KCkJx3l6JOehHjFMhBXJS9NFhFglAsMBEjYLxfL91kecxBjyV0Dj2kLVZhFT01182o4CkLmN2GOzXdiJBcDlPDc+nLUUNS5GSFFUdsTFJwIdgfelbiocsPvEuzu5tn+KCRlGaqU0g9XKFUFrviiI2gWjaX67t3NcSVa+IzrNGGOOlQZr1Gq5U6QsOUzyuB7dg+rYhmELgqdB25P+pJF3KRfhp3G8Rp8bAnaeSp/ChU8OBmSEtz+gctKDzBAgJTThpA9Eq2DknUGBNxyj2E3xJXeQ57D7mK2RRXTYTEIJThVPx72pQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kp0U4vxoBlYl4OdHWdQ+VbADTLlj70ENY/aKVeeU0s=;
 b=GkGJbHPZH8QdsHucUeRXhsPK2fsu8F2lcGIhMAwhxs4WOv+7/JQ2lK/gXHzDVAyAA2ADNiUb2sxoaYLAcwEhf3JxI/rpLo5LE+U0xVe3ndEr2eEXYTtNSdXk7iHypmC+d5h/gz6Ogjy3xYk98gyKx/qqHU713d2iJ1IzhBJlZqNIgUKuupUKfqZeHRJoIFlesTFvDt/z19/l4zN5L9drp3fo92ZXhART1jNOkCjKRk49BgOP9NX7SQCndjbSVNrwvfiSI3IadLHNDR60p43aEzayITutdZlNUn7nZV4DgHaYkZhZ3RIg9KUClMv38h4qvFWUzWdHRTtOIqjjJQUz9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BY5PR15MB3618.namprd15.prod.outlook.com (2603:10b6:a03:1b0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 31 Mar
 2021 17:39:25 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b%4]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 17:39:25 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Oleksandr Natalenko <oleksandr@natalenko.name>
CC:     Piotr Gorski <lucjan.lucjanov@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        "Nathan Chancellor" <nathan@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Valentin Schneider <valentin.schneider@arm.com>,
        "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH] init: add support for zstd compressed modules
Thread-Topic: [PATCH] init: add support for zstd compressed modules
Thread-Index: AQHXJVrjTl/b3y00YEOpOt7F0WiTWaqeXt4A
Date:   Wed, 31 Mar 2021 17:39:25 +0000
Message-ID: <33D7F6C9-6F53-471A-A146-7F128F6918F5@fb.com>
References: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
 <20210330115023.qt742qsdekwiroey@spock.localdomain>
In-Reply-To: <20210330115023.qt742qsdekwiroey@spock.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: natalenko.name; dkim=none (message not signed)
 header.d=none;natalenko.name; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:31f0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1313b89-550e-4aec-e3eb-08d8f46bed92
x-ms-traffictypediagnostic: BY5PR15MB3618:
x-microsoft-antispam-prvs: <BY5PR15MB36185703C3CBE3B41DBB8FFAAB7C9@BY5PR15MB3618.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c1zXFp981HZygTKzSZTzgP/V0dbx93yWmEfjZPwfRpX/ycG/c3WdM9O8A3a8wlcdn0pveBulmAb28Ro+9/l76w0XywaZ0VGh4sQTkZ9eu8DaxzX454DREB8MDLr/amE7U8YD5o6Hhr+E2akEfXRSFlBQ9lp//njrjtvzgF6DBLU4W19tQcDGPraqad6+OTSF5yPEHp5gsuU+S8M5KH7KqfdRwyBotZbyCxl3TJt0HwHHoTQr/C+c3MZC2uyWFxoPZVX8fiejZ0KOcYAK0Sa8t2huY+tZmF4ZKpmwGQuSRc/8ECa6DaYnMenvf7ua/rmRfPsI0zgZ99WsazpacqwBir0x6Tm3NHXk93QSguQnueo2qWrB+h/seZaJWqbAXpKvAJVZzeBdwiOJL52Ma8INooUNXAxYUqXddk6dPl8p81+z4IhDR+vnDB/jz7tnG5WMZEBGAA5ZERopB4htHT20WA7u6Q1lPhUkD+6k6EEjefJ1gJhsvotJ6UBG9Wn/s6UEL2YFlXXC1GJ8Hn+hNTGfa/4XCSmcgyfe7lX+aXfmurTjS3IrMOp2By5QF2/gcCoQLSUgC0MGc3UbRgrfTKpQnakyXGR6l46IY6ETiHxiOBTD34TmpY+1I7BVqC/jxii672WRC6icV/x0ozGXd5JwRvpP+4JL+IW+C7bI0pkj0eG7oaM59Zx8BJF+pfe9ii4D6WHnJjTc0BYqyPVT8ag4KxSJbOTCclRlL7pPRp04dMLmv+nanmTARiM55fXG78WEhSluxlN7Qptm/WqPIcIMZQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(396003)(366004)(136003)(2616005)(6486002)(54906003)(66476007)(478600001)(6916009)(66946007)(66446008)(8676002)(83380400001)(71200400001)(316002)(33656002)(38100700001)(91956017)(64756008)(66556008)(76116006)(2906002)(4326008)(86362001)(5660300002)(6506007)(8936002)(53546011)(6512007)(7416002)(36756003)(966005)(186003)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tmOVBp5hAL8glUxuDmHcq931P/t4dusTDr7NzYnGzQGcnjvPhTTIfTpwhgc9?=
 =?us-ascii?Q?Dv55scA4824powynn3i9KVMCTD429l2mOTz1Ti/MdGeqxy//bjjdwnOMZDZP?=
 =?us-ascii?Q?YY61c2v0R5xRhozh4JHeAuriaxeXPi1LdGlgLQXzlvDV77zV7ioc0JsJwD7s?=
 =?us-ascii?Q?HbScFtgsWnNn0l86rAlnrNmesObGtkzToCq4BVeiX9o/nS77F5RxCJs6J00O?=
 =?us-ascii?Q?NsU1pMyCUTz3HYlEI9weoD6ufrAlmtaY7731AtfM/X4TD8AoOtObMObMBaKn?=
 =?us-ascii?Q?xUertBSJc5IKWObyLdD+2vhLEldB0h3HlHETVAV3J0/Maq9EKnc2iVBxRNof?=
 =?us-ascii?Q?67bVcoGvwyXrdxNTvwhKyjxcIkeXXkI+CDkiIABt3s0ipxP4M/GUZVq+0qVd?=
 =?us-ascii?Q?6NZ3dFzynEZv66qIRn8WPUt3UYEi9+QMRL3DBmlP0HBPDcv6WTNfxOA1zDE3?=
 =?us-ascii?Q?TXHB0z3auTVL1RW0jTz4vm/M5pBxCc2hMsmmZgSpdFJCGowmIxzm+gpVHPzQ?=
 =?us-ascii?Q?6M1DBF9Q+bX3dVXhe8oPY0Oew5YiwREX7hrHc1WJLTwDjCRunZ4QjZnp1sFI?=
 =?us-ascii?Q?p+GqQaNRCBFvdMgSJCF9BNHsBb8UL6Ah0krqHukelFF2Ii1/zr22nHbylzTR?=
 =?us-ascii?Q?s1pUZu08UWc9TbPp24z5UXmk8CAA0bJ2Pq4hHKSBA9ltF57rNItJQC2zZ02U?=
 =?us-ascii?Q?j8uysx9cRU7Ck5OAIvpaLBusPo4L39sUyPRqIjbtGPd1Ts3D5YAyo05g0qs/?=
 =?us-ascii?Q?uryxkxVrY5czmTlEyE3qupZ4sDmol5Xuj8B8pdh8OwHdZK1+9AbSlgjIh0y2?=
 =?us-ascii?Q?RfhSXnik5D7bHui3Hdn1prlCR5t4UjrSzTHSa18jASm0B2El6xmxRsmomdT7?=
 =?us-ascii?Q?7ckc9iTxm780+5V+nbZBLqs/9RdoCQ7Wsa65LCLKpAx6n2rzjg6VmmRmhIhU?=
 =?us-ascii?Q?lEseIS/eoXoszQ3pQSSzKX2F67qvkb3r7XqcFzirNQCMwGWi4kb8jygQvwuD?=
 =?us-ascii?Q?8pSN9pKNNS9r0zFDwqe0pv2BwddronOHegoNMMiQESBxzQLAapYSHMy53ftA?=
 =?us-ascii?Q?seMYh5wwiNC4p8BuJ8gnqTroVEyY1R67pTZxqL84kymp70qYAdwf8vw9ePzk?=
 =?us-ascii?Q?iom7kRavgPkRMqGBaf6+lahJ6nsekz+q54j29DoEVxg1umpnxTTEnAn+4iR8?=
 =?us-ascii?Q?4AElgMOM7cG2vFZUjxi7CqwyxYVslsoaoZJANTE0WX/gOZeZYVSHPbcVFm+l?=
 =?us-ascii?Q?Eyi2oJhZ8svrsDJ2YzNjlvfCjVOVFPwFhufCEzOGbTH+vYDUOs6xGjBVTyKq?=
 =?us-ascii?Q?ezdw+FuTIVqu5IclpQlZDQIhVT5uPkAFA60dPtm/q6dmFOurR8oT7nYAiwyI?=
 =?us-ascii?Q?/mLuM40=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27848AA768DEEE439474A8D41AD6DE47@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1313b89-550e-4aec-e3eb-08d8f46bed92
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 17:39:25.5091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mwf5eJcsf+Y96HMgLg7co9lOHgblhJCz1jicGWkVQoogPjp1dp38R8bCVbk5UgU3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3618
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: psKsCM9V9n1uzG1jYC_uESzSNpMHMvHN
X-Proofpoint-ORIG-GUID: psKsCM9V9n1uzG1jYC_uESzSNpMHMvHN
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_08:2021-03-31,2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310122
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Mar 30, 2021, at 4:50 AM, Oleksandr Natalenko <oleksandr@natalenko.nam=
e> wrote:
>=20
> On Tue, Mar 30, 2021 at 01:32:35PM +0200, Piotr Gorski wrote:
>> kmod 28 supports modules compressed in zstd format so let's add this pos=
sibility to kernel.
>>=20
>> Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
>> ---
>> Makefile     | 7 +++++--
>> init/Kconfig | 9 ++++++---
>> 2 files changed, 11 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/Makefile b/Makefile
>> index 5160ff8903c1..82f4f4cc2955 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1156,8 +1156,8 @@ endif # INSTALL_MOD_STRIP
>> export mod_strip_cmd
>>=20
>> # CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
>> -# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
>> -# or CONFIG_MODULE_COMPRESS_XZ.
>> +# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZI=
P,
>> +# CONFIG_MODULE_COMPRESS_XZ, or CONFIG_MODULE_COMPRESS_ZSTD.
>>=20
>> mod_compress_cmd =3D true
>> ifdef CONFIG_MODULE_COMPRESS
>> @@ -1167,6 +1167,9 @@ ifdef CONFIG_MODULE_COMPRESS
>>   ifdef CONFIG_MODULE_COMPRESS_XZ
>>     mod_compress_cmd =3D $(XZ) --lzma2=3Ddict=3D2MiB -f
>>   endif # CONFIG_MODULE_COMPRESS_XZ
>> +  ifdef CONFIG_MODULE_COMPRESS_ZSTD
>> +    mod_compress_cmd =3D $(ZSTD) -T0 --rm -f -q

This will use the default zstd level, level 3. I think it would make more s=
ense to use a high
compression level. Level 19 would probably be a good choice. That will choo=
se a window
size of up to 8MB, meaning the decompressor needs to allocate that much mem=
ory. If that
is unacceptable, you could use `zstd -T0 --rm -f -q -19 --zstd=3Dwlog=3D21`=
, which will use a
window size of up to 2MB, to match the XZ command. Note that if the file is=
 smaller than
the window size, it will be shrunk to the smallest power of two at least as=
 large as the file.

Best,
Nick Terrell

>> +  endif # CONFIG_MODULE_COMPRESS_ZSTD
>> endif # CONFIG_MODULE_COMPRESS
>> export mod_compress_cmd
>>=20
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 8c2cfd88f6ef..86a452bc2747 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -2250,8 +2250,8 @@ config MODULE_COMPRESS
>> 	bool "Compress modules on installation"
>> 	help
>>=20
>> -	  Compresses kernel modules when 'make modules_install' is run; gzip or
>> -	  xz depending on "Compression algorithm" below.
>> +	  Compresses kernel modules when 'make modules_install' is run; gzip,
>> +	  xz, or zstd depending on "Compression algorithm" below.
>>=20
>> 	  module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
>>=20
>> @@ -2273,7 +2273,7 @@ choice
>> 	  This determines which sort of compression will be used during
>> 	  'make modules_install'.
>>=20
>> -	  GZIP (default) and XZ are supported.
>> +	  GZIP (default), XZ, and ZSTD are supported.
>>=20
>> config MODULE_COMPRESS_GZIP
>> 	bool "GZIP"
>> @@ -2281,6 +2281,9 @@ config MODULE_COMPRESS_GZIP
>> config MODULE_COMPRESS_XZ
>> 	bool "XZ"
>>=20
>> +config MODULE_COMPRESS_ZSTD
>> +	bool "ZSTD"
>> +
>> endchoice
>>=20
>> config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
>> --=20
>> 2.31.0.97.g1424303384
>>=20
>=20
> Great!
>=20
> Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>
>=20
> This works perfectly fine in Arch Linux if accompanied by the
> following mkinitcpio amendment: [1].
>=20
> I'm also Cc'ing other people from get_maintainers output just
> to make this submission more visible.
>=20
> Thanks.
>=20
> [1] https://github.com/archlinux/mkinitcpio/pull/43
>=20
> --=20
>  Oleksandr Natalenko (post-factum)

