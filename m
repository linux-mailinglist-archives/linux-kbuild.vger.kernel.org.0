Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBF2233830
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jul 2020 20:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbgG3SNz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jul 2020 14:13:55 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:14916 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726343AbgG3SNy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jul 2020 14:13:54 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06UIDFX4012232;
        Thu, 30 Jul 2020 11:13:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=iRcJYr1zkhzCasQJtaVqUCELqv9qKbYKnGu+XXFDQMc=;
 b=KhHHz4BvIOZN+7DJqnc4LFYaZ+OANp1laZb6mdVOXop4pt5EUTHHECrYqkBVpYXyFpaA
 O9GNw1byE+EwHanJQOTrdYpjf3/khp1pd4IhPmrvrC+8+Tbuz+amL39U9hSiE/iH8cPE
 LWhPv3ug8JydWfuJAKKyz0liBD8vq5bLsK0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 32k7hw7dgs-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 30 Jul 2020 11:13:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 30 Jul 2020 11:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9GpUeBxfA1xnW5rIRgwipNoZTRS7gOAkccq+4BEnMt3FMD84qCwMr1IPZletOD1iiowbWg9gqku7gqpB0yZmW4zGHR1UH6nWdJoGfaRO0leyuZVZwAt/7uVQmBdQCQE/tz9cEs41tnXME6z/7yrqKf/07f1A2ixRhgPsPBYTUHb8O4e1iWd59mcTozXaejCcvQDMwrPoNmjLGDaVWz/X2HbaiuDW3atpwgaDUb0+A5OT6Rl32MiUBB2IpyHDlVjy3JTuvOjwm8/9JnWI4GcMhuLq5LArC3SLHEW83VjPAh/0gyuAlNoAYxnx9nUemrdzZ9ThhFNQBO/S8sdr/nMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRcJYr1zkhzCasQJtaVqUCELqv9qKbYKnGu+XXFDQMc=;
 b=PK2rYNO3ATm442RFu3PhLpY16o9R9g/csSZrJTJWq8Tx1f6SJZdqg5QVhKArph+Dey1v3khqjEDsdRWRZcqY3ug9oMKfu7uSiFC9aEcpGgcLMSZL27X+SVD/t9A4Ula15h5icHuWE8zHGtbtsRnD1WdsZZEo+YXzxeKXeuZGxG0NKpBNgPPCxkRn9qeG1kUluOgFjPABDp1oeKVKdhNcZtsy0a1VHfb22llY+lEsT2GZW4fuAKK35mtCSexL6DY6Psl0UAOLR5A4wp44HjUyDJtmfTWPVYkDSswIe39VPkuwdRbZSe/EpJo+FOi8RTYYWRYXFP8zfvTzXAPwpExefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRcJYr1zkhzCasQJtaVqUCELqv9qKbYKnGu+XXFDQMc=;
 b=e4CnuqOSnd5XV0Px6cfZ3pxI2Lyg86M0L9YE/6ck3dVdzGp15kH3NqTSH93qyDtYEZCPhIwXZzPjAg3005P0BA5OR99HSJxC/OWY8ie22csmGyYyfRnrDcPv1HjldcAbjWSeER6Fs2/7KyPMPagWY30RHGDkwphgoBlR4Xgs47c=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BY5PR15MB3571.namprd15.prod.outlook.com (2603:10b6:a03:1f6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Thu, 30 Jul
 2020 18:12:45 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::f4b9:8011:9aaa:e4ea%3]) with mapi id 15.20.3216.034; Thu, 30 Jul 2020
 18:12:45 +0000
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
        Andrew Morton <akpm@linux-foundation.org>,
        "Alex Xu" <alex_y_xu@yahoo.ca>
Subject: Re: [PATCH v9 6/7] x86: Add support for ZSTD compressed kernel
Thread-Topic: [PATCH v9 6/7] x86: Add support for ZSTD compressed kernel
Thread-Index: AQHWZGtJP6i+3aGT+0aLlu4R7hiSkqkcQ4EAgAQtswA=
Date:   Thu, 30 Jul 2020 18:12:44 +0000
Message-ID: <8CDBA7E1-B456-439B-86F7-363EFDF127F2@fb.com>
References: <20200727230606.906598-1-nickrterrell@gmail.com>
 <20200727230606.906598-7-nickrterrell@gmail.com>
 <20200728022408.GA3553606@rani.riverdale.lan>
In-Reply-To: <20200728022408.GA3553606@rani.riverdale.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alum.mit.edu; dkim=none (message not signed)
 header.d=none;alum.mit.edu; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:aaef]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c15e8e21-3a10-4162-c14c-08d834b428a2
x-ms-traffictypediagnostic: BY5PR15MB3571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB35712B71DC64303C586167ADAB710@BY5PR15MB3571.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tXrTLiIREdd1j9/xk3p1whKJLwDx3sx08JUOi1Xa5BKwQqoiVKiCmK8MNKpyZtbJy2eRfQLMuii/L0Gi8zmuAH1A7fWPAAWPkTqhCQeiysuCkk0pqslm4etbbpUSy0SCjGZMyzzQYesCtpueHCBDNevmeJPUG5ZXHq/xXDle1mxDGo8KAlogAZZyTycJLaLFYgHshkSp5TeAv6qdPZN4FCXEZbc3v+qBlINXjti/is8L2wXft6UGIJxc0kaAvPkQRWTzxnhQdQjw1zkRgnFtSu1VunnE39yhoRSed5+zfm/9vMaB6aGv15wsb/2hJrWT1F54tv+qfp7bQT+j9+0U0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(136003)(39860400002)(396003)(366004)(66946007)(6486002)(478600001)(4326008)(33656002)(2906002)(86362001)(6506007)(6916009)(6512007)(83380400001)(76116006)(53546011)(5660300002)(316002)(8936002)(186003)(8676002)(54906003)(66556008)(71200400001)(2616005)(66446008)(36756003)(64756008)(66476007)(7416002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: NzZd6veRbQw/onsDGLbW5UPxtTRjhi29HsaRgxG/YWVz0W32psjJIk4esnXTJOZPCE1UI8N95p9aAWXm2rTNd0Orge50gZh5i39dCKdMYUl34Ilef4KCwXIGX37dqlfP+eWhGhTWHH6XwNhc135kZePybOTdPw7JMQffTq1JFbdKkeHytnR9+QYugHKoDcl0dYOcsKG5nhUsWRwO0vtS2lp/TdfvsstLzCPgwPk0c6pZ5IMzOgswlpAXziv1uPLwHWLfhrbVIzgDuxQRb3+sYAnym0R4iZkUzHFrvJy+g+cM4wFRcjVnguy+UGf8z6Q7pagnC21Jyr9zk1V/+MmHvf/mvSNpPZTDdBbVoE5EyZYWvvP7+LEmpnhDdsA2lfLVOFFw+QRjLht+mBErktwiaalBAp+lKcmVZVtpt3t7VL925G64PaikBZ95JZkjHEZxdFLUPbzvCDd92Us5/mpeCltPhxUdvW5AxmPAArV+4jcemcCMSruhpsHrcea0lfZ7euKmZephchu+pGMImloIS7hPeSukKCY4JqwjWXNzkRDGB951P3HgElEevdIuL+13I5nr/r2edfiVwGF/Z2nnu26UvZ7bCygCUoBkfuIWzRLaolD/Bh5nJmqKVOUmlOMgCJhg8Z5huGlBeGAzz12GTxZiNOyn1+nGr3kTX6SXOGpVtUu/TZ8hkcySGrON0/Cf
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BDAF2659D000794283223659FF11EB8E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c15e8e21-3a10-4162-c14c-08d834b428a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 18:12:45.2318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGuEFetKF5UrG/H0MdhB58EasXyNxA232gad7zrMn1D2BnoM5auY6QGFmA+M3ROK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3571
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-30_13:2020-07-30,2020-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007300130
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Jul 27, 2020, at 7:24 PM, Arvind Sankar <nivedita@alum.mit.edu> wrote:
>=20
> On Mon, Jul 27, 2020 at 04:06:05PM -0700, Nick Terrell wrote:
>> From: Nick Terrell <terrelln@fb.com>
>>=20
>> * Define __DISABLE_EXPORTS in misc.c
> ...
>> __DISABLE_EXPORTS is defined in misc.c instead of the Makefile because
>> kaslr.c defines __DISABLE_EXPORTS, and defining it in the Makefile gives
>> duplicate definition warnings.
>>=20
> I think the commit message missed getting updated?

Thanks! Putting up a reworded patch now.

