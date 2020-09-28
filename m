Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E798A27B3FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 20:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgI1SCj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 14:02:39 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:44252 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726821AbgI1SCL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 14:02:11 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08SHvJLm019564;
        Mon, 28 Sep 2020 11:02:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=EMyLvjQb/Rouz6Hj2QUcYqKMIJAexTw0/D8URuGs66Q=;
 b=nX25bN8v0e0nzHvWBW5FtKvnjrhHFnnLWF/zZPfnavZhoxiIvLYE55Y6wJF9VkLiasyX
 mHVlBLm/KLYag2LGQa+m7ML85FgJlWLlzMORBCwaGL5NkSJo19SNEPx0kz+CFMZ/AY4S
 dXeexIrwBVydZYc3dJ+1NXB9NQynh9znEQo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0001303.ppops.net with ESMTP id 33tshqwejq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 28 Sep 2020 11:02:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 28 Sep 2020 11:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7GTurky3XQMSH5MyvaXLTBzGHZ8fVLPZ8w9c2bYCswVIOIP24igtDQ7g38mcu370kIdjvptxcaqyaP1skmt6HbscEL1eT/otl60hQfmZ4NVjjUuHJW0Y/kIEj+GopYgMTUBGo4v02Y3CZQtFhNWHi7rVze1nxs6V1Al5osNhjEKY87/pr9wFqjXGNQA+Xll7sex1Fi1IAtMq9nU4YZBUCfdNP6Ts7h5BUCl/fUMaey/VM/sq/HsCkkOewt090rIqmzIae4OntIdxxChCiYyUcthxmJiU8kH2WVdjNA4pMjUvYM0KL7fLWVYs0H/wFdIuqMCNeFoaAHmS6gqk7bnHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMyLvjQb/Rouz6Hj2QUcYqKMIJAexTw0/D8URuGs66Q=;
 b=kpOwUF6wTdyF/YzYj94URgO6jfgDBnd0C9bzcGwKi9LBHy+Bc171edEmAksWnyGDf5NvnwXNWNb0g4TwT/aC4a9Us17KvgUQmOetWRgbEeA3+f8nHi2AVPb9rXLsOD3j+f0/iBJj0gd/Qot8f1ory6kBzVygUtOeXyLoYTB86vj443LAIFu8gcv7iE1BOwTvOSLpwzY8hun9Xa2EWyzlAOy/cOPfNE/INaluBZVi4KesoeH4LLSdXak8nQ2bTGMP2xMWx4jsDkoFEiwxvhKHo4UsUoneGkwAiKIZUwQFRoPoaEkLxpVl+vzzNRiZW5Aw0vOpkbt5AVvRhEl6zhJjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMyLvjQb/Rouz6Hj2QUcYqKMIJAexTw0/D8URuGs66Q=;
 b=VBczxEob2lqJCJ6mMXv6dJTCZFrMxTUfH17p8JI9HVcuBSMhx2cBO/ewjGOIfRjRwfHrjJAMR0XOu/eLCpFP3528HFRZ8CrgtbuDD0wePPDPBsXItBtAY6MKpo+KkXLE1e1nwJexWTQM3DZRRdZjyK8kXYrCQMmrlsqg16PWuQk=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB2199.namprd15.prod.outlook.com (2603:10b6:a02:83::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Mon, 28 Sep
 2020 18:02:03 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::2d08:987a:126:1c9c%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 18:02:03 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Feng Tang <feng.tang@intel.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "rong.a.chen@intel.com" <rong.a.chen@intel.com>,
        "philip.li@intel.com" <philip.li@intel.com>
Subject: Re: PROBLEM: zstd bzImage decompression fails for some x86_32 config
 on 5.9-rc1
Thread-Topic: PROBLEM: zstd bzImage decompression fails for some x86_32 config
 on 5.9-rc1
Thread-Index: AQHWlXUd/dfvQ2fZYk2nxWB3sbp9DKl+WAWA
Date:   Mon, 28 Sep 2020 18:02:03 +0000
Message-ID: <74757C2A-7C09-4C2E-9828-E8D12EE4706B@fb.com>
References: <20200928085505.GA22244@shbuild999.sh.intel.com>
In-Reply-To: <20200928085505.GA22244@shbuild999.sh.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6239dd6e-26c0-4ad9-cbe7-08d863d89b08
x-ms-traffictypediagnostic: BYAPR15MB2199:
x-microsoft-antispam-prvs: <BYAPR15MB219975A828D8B3937805FD01AB350@BYAPR15MB2199.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N6xlN11qEcuewm9+E6XCvlqaaW+ySDvQe2YXvYKOGAfPKgRakgUulvjwIKFLwgI6dN0ysRrdT8rauReNrdMXzVYBF3WSgrGvLmpHSb2YiUbYi3iIaMvMVvBvy4T+VhihNpyyw4RYDxBUQ0o2EHJ/lajvXlkS08aqWIGFyfB34D9f+dmTvkhJBIUwVqHx8BUdMsaQvRm2EcqmIUOkXesrT0YSWIw3VRNuyEHA/tTo44Z7OekUTEuiQnNLY/n+Fslro1v7wc6YPSF7s812/33qrRImxbIYMbjG7IyJObjw9njMs5fri3MF+coCUDyNFLqQQ1czas+F529xaJz42UFtIkD7SFgYkcBYcBAHrAotaxdrBTtTX3E4Yreeu2ql9yPt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(346002)(366004)(376002)(54906003)(36756003)(6506007)(6916009)(66476007)(66556008)(66446008)(64756008)(186003)(86362001)(8676002)(6486002)(26005)(53546011)(5660300002)(71200400001)(2616005)(478600001)(2906002)(316002)(33656002)(76116006)(6512007)(66946007)(4326008)(8936002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: EgA6678K69CcGMuIVnffbZABfelQXUl8wwNoeR7JWtzgpGlby6RwTawQaZJUPQb3H/dHcOVAkVc6QioNAS2nfUGLlrIDBrXRoQ6FxqhlDpBWIaWkkcUJKx+J9w2bmQbqS6hBqmAItRWEE3yUwckO3Jsw3nWkPG3pDN9VpntdTrwGaidDK1Mijm4m3TkLrDUUc2mU6n0z95Ss3pdOhwQGKCXLdg6UKCB92RtL2tfCOh+Ws0L6Ir+2nlguVZtuvmiqvKLd1VA8DKn5wBK36pGHWiW4sIelxEZwuB0dBbXqoFAzYG7pUxu9gDe/OM5ucCmSlDUWGk7C8NgxTS7YhqFfPSI/L0sBv5KFJGxyzFb7v5obti1mGeBVuib2B+EBKLUzxo+lazD0jwRZKcig7rNxMpEjXAD6dfmiYRdf2O4Lol1CoxEyJIz2Kyv4aqm3xDOllAottf00E7AYCUI6IBlt/WZl3ks5IRIJowQ25HNmu0vRn+e8rGcKcnVMvPaV0HyHHTWgYyJ7pczBrGTeWjtqE23nCl02XKn3sJ0CAKxGOvjuxisisdkmkD0YnLBFQDrodzcpwTzcwo6cD8gAhAVDe80SWeK0rirTltKMLdaAO1TKCXJBCt5q1lk0Y4MwF3jTVup2MYlJEZbW3BNbMeDbgA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <79D9A78EAB20564F9AAD9B499466E59E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6239dd6e-26c0-4ad9-cbe7-08d863d89b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2020 18:02:03.6806
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QrTzxVDVZhgMGY1FEjq4H6hSVC0JdSFtxJkzXeB6JxnxbvMHXEFX8fX19XLb8gek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2199
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-28_16:2020-09-28,2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 mlxlogscore=989
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009280140
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Sep 28, 2020, at 1:55 AM, Feng Tang <feng.tang@intel.com> wrote:
>=20
> Hi Nick,
>=20
> 0day has found some kernel decomprssion failure case since 5.9-rc1 (X86_3=
2
> build), and it could be related with ZSTD code, though initially we bisec=
ted
> to some other commits.
>=20
> The error messages are:=20
> =09
> 	early console in setup code
> 	Wrong EFI loader signature.
> 	early console in extract_kernel
> 	input_data: 0x046f50b4
> 	input_len: 0x01ebbeb6
> 	output: 0x01000000
> 	output_len: 0x04fc535c
> 	kernel_total_size: 0x055f5000
> 	needed_size: 0x055f5000
> =09
> 	Decompressing Linux...
> =09
> 	ZSTD-compressed data is corrupt
>=20
> This could be reproduced by compiling the kernel with attached config,
> and use QEMU to boot it.
>=20
> We suspect it could be related with the kernel size, as we only see
> it on big kernel, and some more info are:
>=20
> * If we remove a lot of kernel config to build a much smaller kernel,
>  it will boot fine
>=20
> * If we change the zstd algorithm from zstd22 to zstd19, the kernel will
>  boot fine with below patch
>=20
> 	diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compresse=
d/Makefile
> 	index 3962f59..8fe71ba 100644
> 	--- a/arch/x86/boot/compressed/Makefile
> 	+++ b/arch/x86/boot/compressed/Makefile
> 	@@ -147,7 +147,7 @@ $(obj)/vmlinux.bin.lzo: $(vmlinux.bin.all-y) FORCE
> 	 $(obj)/vmlinux.bin.zst: $(vmlinux.bin.all-y) FORCE
> 	-	$(call if_changed,zstd22)
> 	+	$(call if_changed,zstd)
>=20
>=20
> Please let me know if you need more info, and sorry for the late report
> as we just tracked down to this point.

Thanks for the report, I will look into it today.

Best,
Nick

> Thanks,
> Feng
>=20
>=20
>=20
> <zstd_x86_32.config>

