Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C2F18AA5B
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2020 02:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgCSBga (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Mar 2020 21:36:30 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:34570 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726596AbgCSBg3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Mar 2020 21:36:29 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02J1XkEZ022492;
        Wed, 18 Mar 2020 18:36:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=9k5t4YAZTbExgEkD6zdNa+JJRjzYjt+fwM1MijQCSLE=;
 b=F7A+kwQIuRWgL9SLHhr8dJdFmyKIxrkeAK275ItLR+q6i6GCM+RhU/yrEnR8m2i9vbgY
 ZJPMQ+SJOINi8mIACobbfkxr9CibJjbEOTUUvGenF3e3U/I4vpOEJVO8nsIkdvX4VCmA
 k0RiMDPs5NPzAT7EXgwNHN9prrgIGvz9QyM= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2yu99b5tvd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Mar 2020 18:36:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.173) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 18 Mar 2020 18:36:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfLoIImghQxv6H0MBfh9qGBlGT+q0y6tHrkc3aj3W5RJ0PGtk+AQLfV3ighExkjoEwRj8oHQjuPZKB6VJtZVoDBRdNdjxy6TXtDD4Djm62CKIJsg78KZPqkfwlXfuwrRcRkyX4/CrnFPjbvPh1hCzr+3hvYhA6dEqntMfLi1n+l2zUfNB3+37XU7JIXUlaBlhXtKsBh02BflxyBLen01yKnX0fhf4suObdT0ftzvRaW48I8PpjAX3jyPiKiMDXlKOaj/F4FnsoyrcaQ1l9kM+SNn7IDecrXKpAPH6CNs9vIk9vUpJ/H4DpA5Z0JEcZ1wUPPPbCKUGagHnHWZ8D3zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k5t4YAZTbExgEkD6zdNa+JJRjzYjt+fwM1MijQCSLE=;
 b=d5L28Ktb2TlGVy2DRuj8pQ3+j6x5lv4sugUQANc7cwIE4fN3yUNKEI7DSkMlxK/KisyPSwYSdEVmiNJzMMwXVE92oy0+5KlmK8GCLGQMXVbkgvlbh68y/rCcweLdLJmWt/jK+Ml8/2Y1K31lDe1B7l6O+rNwxQZSjrt9j3lDQRprUQDDowRBKxSIfeP5WsHRoSmctOc2zbnyzdtTcmyGzmYhZQrv1PAxmsULMzRSnXumrPK5nIptplKTCunpK3KOem8MIhlSViXBk1ATmQRysgMsTBnI14tyd+rqRfI6u7+vHcgRE4uaHpD0rnkCPw448CegRsMkvM4LLRMQTukLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k5t4YAZTbExgEkD6zdNa+JJRjzYjt+fwM1MijQCSLE=;
 b=Mw63F5NmUeoM+67ykbMBEBZLCpK62bEvLS6cCVBG10gQ/KPhBddjQ6ngLLJ6w2b9zeRt+jjw3fDWf3hm7E2Yq8YHB+IZZ5//PXeiN1Emts+YKrds8vWGvS84+1m9ID0UIbGaakRZEMXZ+X8w3ZwHrMYEaBPvNQPkDCiTX9X7xr8=
Received: from MW3PR15MB3753.namprd15.prod.outlook.com (2603:10b6:303:50::17)
 by MW3PR15MB3932.namprd15.prod.outlook.com (2603:10b6:303:51::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.18; Thu, 19 Mar
 2020 01:36:18 +0000
Received: from MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::5956:e4d6:26a3:343e]) by MW3PR15MB3753.namprd15.prod.outlook.com
 ([fe80::5956:e4d6:26a3:343e%7]) with mapi id 15.20.2814.021; Thu, 19 Mar 2020
 01:36:18 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Adam Borowski <kilobyte@angband.pl>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Patrick Williams <patrickw3@fb.com>,
        "Michael van der Westhuizen" <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>
Subject: Re: [PATCH v2 8/7] .gitignore: add ZSTD-compressed files
Thread-Topic: [PATCH v2 8/7] .gitignore: add ZSTD-compressed files
Thread-Index: AQHV/YnaffSvexmGMU+5AI/32amqG6hPIn2A
Date:   Thu, 19 Mar 2020 01:36:17 +0000
Message-ID: <0CFF6F19-AF18-4B5C-8EEE-71B8E64EAD4E@fb.com>
References: <20200318002303.977158-1-terrelln@fb.com>
 <20200319010015.26880-1-kilobyte@angband.pl>
In-Reply-To: <20200319010015.26880-1-kilobyte@angband.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [67.188.225.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29f33c5d-f90d-4c59-5fb6-08d7cba5ebab
x-ms-traffictypediagnostic: MW3PR15MB3932:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR15MB393232250AAB5CD4CDDEA35EABF40@MW3PR15MB3932.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0347410860
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(366004)(39860400002)(346002)(136003)(199004)(64756008)(66946007)(81156014)(6916009)(478600001)(81166006)(6486002)(33656002)(54906003)(36756003)(53546011)(2906002)(6506007)(316002)(5660300002)(86362001)(26005)(8676002)(186003)(91956017)(66476007)(66556008)(66446008)(76116006)(71200400001)(2616005)(4744005)(6512007)(8936002)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:MW3PR15MB3932;H:MW3PR15MB3753.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VfS/ijO+CZaZikCt4fOeBf4YkW6rMxQk4z+3coXQixDGuGQW6PWyibv3ASKEIlE729kMSKP/Hd6R2/L1D+waUyDlCceh2WL2l2wq1kaLu9KvmKobWdf0an/81MO9U7FKEJ+1c7JHrdyGnsybEqdqPdP2Dez6vwtBt6PeNfkcb1PAiL1ZTrz3TXkN6LRgJhDsVK2V8qF+Ugb6VqrnsAHncJzmTYPkqETwD/dVsQCpy7J2q6Xz1fLzWu83+zSeiTPhjw7JKgzOUd6QnODOdSsO6bm7Oot7wpFNmWW6UzGBD/Xcjr/olt0V58h5GzYZtLWdO8tvmtEr8232grehhQ7EOmGVvGhIbM0wgN6ztjBvbotedEugR3/NQzwJJVKCNVkTeimvrmh4WqSSIeunvUpA2+oGbJZ5o590oD99IHBFbrZp1GT3MNJtI9DgPVEsqbvd
x-ms-exchange-antispam-messagedata: wFdpcNOr4BuzmklQR0hfEjanxVkV2Nd04AdqLkl5C0Z4t2HjKQqLy/u0FVfRsMyxWbNG2jcfXY0ATyKT5aPfCvvKzyEygb7NPNl72GQ0wOH76T0keHGtqKDkAaSldgoSsC5okDZ3sZxY3UOMt6jjAw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A85907ABA10B074C91C8AE46816F4640@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f33c5d-f90d-4c59-5fb6-08d7cba5ebab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2020 01:36:17.8092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MU+JmgGi1H+xXEbExahxbZdH+gu6CrUqehjYAgK4j6HYpKIhT+fyvFMHQWNdcSzh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR15MB3932
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-18_10:2020-03-18,2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=875 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190005
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Mar 18, 2020, at 6:00 PM, Adam Borowski <kilobyte@angband.pl> wrote:
>=20
> For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably mor=
e
> will come, thus let's be consistent with all other compressors.

Thanks for the review, I will include that in v3 tomorrow!

> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---
> Otherwise, "git status" will complain.
>=20
>=20
> .gitignore | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/.gitignore b/.gitignore
> index 72ef86a5570d..edb0191c294f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -43,6 +43,7 @@
> *.tab.[ch]
> *.tar
> *.xz
> +*.zst
> Module.symvers
> modules.builtin
> modules.order
> --=20
> 2.26.0.rc2
>=20

