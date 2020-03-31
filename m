Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBA3198B17
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 06:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbgCaEPd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 00:15:33 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:13044 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729813AbgCaEPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 00:15:32 -0400
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02V4EYMM029553;
        Mon, 30 Mar 2020 21:15:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=FygILm7lc8gDJZ6VmyesLqjhlKzuBSSfWm37+vwXj58=;
 b=R7DqVX6IrFBLHvj9yJPSPXL24fE3g12ryg/7r6GP+sGCemwK9ZJuurbNqguOREwcdcX2
 qI8qGrQRYdJBq3CM/WPJ6iltHuJVJpOlQ3jVSsL0dMKrIoZCCzwoHz+vBOKbzBGc4hUj
 n8FUuYjB/5W3nOlWv8zhppZV02nFD0v3mKU= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 3024dgpaq9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 30 Mar 2020 21:15:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Mar 2020 21:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qo0RX/mY8s/Ac5daSP0bS3/ek09dK2H+ZCm5jb/VSTDR+iqA0KVJULz6X6vfO1Mkyplg2d9XWHN5uZu3XeBXcBBhk4Kq/DECcR0NWhtU8e1/jNWUK36ywTd/mDhIzEsjyJT5C7pFaAFTRCxVEvwDVfbYrN+6L52ijlmjYBR+ZeOFAkZA5fup8L4WPbVJHD70HZVvpCNSvtuPBsyuIA9e7NJrcEbkwq2IwfQQ/Avov4dDlbMp9ZgHMp6ipqYaxntPG94KaXyzhY1TjqlWdqJGRlG92WbYWXNEtDwKdwqzpFfNuWl0Z1PtGDrcrtc3aeQOD+ag02Tt0UIr4RaGN7uGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FygILm7lc8gDJZ6VmyesLqjhlKzuBSSfWm37+vwXj58=;
 b=G1jUm/U6SsOX0np4TokW1o6dbNQAzPOlFHY+Q2LaZxXPVnRzNLJg/G6GBlESkNZBfNpUBAaeFLTRv/t6qM+ZCXHd6mu6/iCfao9MBmnXSsOMPFriTiCpnBtdVbnQB3xdQFl4AOPt0693GUiu6uDOonyV/fCC1fE/zSD4UE7IS6KVJ84wDoKWUMMK4rixb6wuyH4AfjHxPEgGo8YBbJAcbW09kKPFw2zzxxv7TgRdOUw2lGrustVN69PvmwTSADyQZ1RO5d4bi9ewH0xoLLevFyI0lwSLDns54vl64Pr6hMF+0x8/jQBVtxVzv0L7OD6Ll6nShSOMHo1pdrqnGtZiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FygILm7lc8gDJZ6VmyesLqjhlKzuBSSfWm37+vwXj58=;
 b=jZVz7wofNxyTXs7YNcJ20ka+5+I0YVXyyeIKQ4yFdCDNTo5Od/WpKhmXAsqASqeLOhBdWkI3+A/+bDeBVuG0r1mZnrvh7UEwsgxyoFIvcMCJkVDJ2uxW0LF9e5lBGFHVeLTSbXa3hMiA70MGu5Hhi0kWnuu6Ke4xFZgpEqLAVUQ=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3835.namprd15.prod.outlook.com (2603:10b6:303:50::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Tue, 31 Mar
 2020 04:15:14 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::3517:e69:6e78:4f7c%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 04:15:14 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     "sedat.dilek@gmail.com" <sedat.dilek@gmail.com>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Thread-Topic: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Thread-Index: AQHWBeEQDgWL3aTsC0eAZqS0g1IF3qhiGjEA
Date:   Tue, 31 Mar 2020 04:15:14 +0000
Message-ID: <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
In-Reply-To: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [67.188.225.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d50f459-101d-4f9e-728c-08d7d52a1cfd
x-ms-traffictypediagnostic: MW3PR15MB3835:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB3835E9A9762E372AC949AF46ABC80@MW3PR15MB3835.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3753.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(39860400002)(346002)(366004)(136003)(376002)(66446008)(64756008)(71200400001)(66556008)(2906002)(6506007)(91956017)(76116006)(66946007)(53546011)(66476007)(4326008)(7416002)(33656002)(6916009)(6512007)(5660300002)(81156014)(81166006)(2616005)(8936002)(8676002)(186003)(26005)(316002)(86362001)(36756003)(6486002)(478600001)(54906003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B0CFByCHaoCxGKupY31JZLO624baKuQR1r21HJqPvmKf3lO5Z0HwNPO1K+Qvx7rHhJyG7LkYZ93jsB3Ue028YCskxSRdh8Ib1jXBNyM560ElIX95DBSE31azNDLslvMm2LQVGXqTh+rx68SRGq0X7TdMh2cebQb+neIIq1UeSoDCae3qIcYYQyGehXzEZL07prKcFnwRAS9HjwgDybXAW0KBh3WURPW43NHHVf9qi/uEPwkDbkwKMC7i+Jm69giuUbBQn9Jsx7edexsLfqn3wp+atf/losrbxcMf9b0jxCsifWU5ghZN/P0nLH6bfy/IRZ3XO8J5FGm6TZNMY15vUAo4BvpxC0GA5n8jK1hZZQ8zT/UPKncdcE8nAVVYZBoZ9lWdYkH+7jzb5e08AJPVITPL1Ii6L788DtWYA3qkNoKpl29Lk2MhLqJBk5XawIHe
x-ms-exchange-antispam-messagedata: 8ZntYrDmNu7a9e/uX43L8OvpyHMJen1g0pS1/e46jRJGJ2IkvoSEyvCgMj2FDxfurdz5U4F6dS4hdrRx/C6UqgNxXwZMZO2sNwLvaZ/19eGTOIJpK/AqxxvlMRLXt3CnuX+R1anWpljS8PCoTqwpnw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FEED80B093E22C4884948E4AFC9AE77A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d50f459-101d-4f9e-728c-08d7d52a1cfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 04:15:14.6465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8cfBD8oLesN6ifPaJbK9nUhyo24Q9fLZO7GOOm9rTFbXRJiTVqbDa4IBkBxnRHq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3835
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-03-31_01:2020-03-30,2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310035
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Mar 29, 2020, at 8:45 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>=20
> [ CC: Nick Desaulniers ]
>=20
> Hi Nick,
>=20
> I have tested your patchset v3 on top of Linux v5.6-rc7+
> compiled/linked with Clang/LLD v9.0.1.
>=20
> My Linux system is Debian/testing (will be "bullseye" aka version 11) AMD=
64.
> I used zstd package version 1.4.4+dfsg-3.
>=20
> I have no big numbers for you expect a comparison of initrd.img files
> compressed with GZIP (default by Debian) and ZSTD:
>=20
> root# du -k /boot/initrd.img-$(uname -r).{gz,zst}
> 29272   /boot/initrd.img-5.6.0-rc7-1-amd64-clang.gz
> 23540   /boot/initrd.img-5.6.0-rc7-1-amd64-clang.zst
>=20
> I needed to do some modifications to stuff from
> initramfs-tools/initramfs-tools-core (see end-titles).
>=20
> Do you plan to push this for Linux v5.7?

I hope that it will be accepted. From my point of view this patch set is
ready for merge, except for the maximum window size increase
requested by Petr.

> Feel free to add credits for the whole series:
>=20
>   Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Thanks for testing the patch set Sedat!

-Nick=
