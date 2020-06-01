Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FF71EB170
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2020 00:01:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgFAWBw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 18:01:52 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:41596 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728336AbgFAWBw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 18:01:52 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
        by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 051LsxDN019581;
        Mon, 1 Jun 2020 15:01:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Xa9bZgoQygkKeQ1D3TNNIs5ZVXC0ciEKFn1UiWKR4Ho=;
 b=HwGaDfJPa8nvkGEFvjT80kklgSIMBkSqLKWk7Nhql/Cq8J4Xhh/7lW8hwrGe2UGK0wSp
 GDKhz19sEXb3n0eHaqb7LGHec7QjQzbvA7lzYyvCC4GjSmY8YLygVfR8XUsd/xetReGo
 trfuus6gZHD1X3J6eA0+dZK7a60pjJo1B+o= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0089730.ppops.net with ESMTP id 31bk000wkb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 01 Jun 2020 15:01:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 1 Jun 2020 15:01:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7k3y3LngVZjDlLq0TjjGQmNcwPLmL56BPGbSAU7FQpw9Mr16a2e/laFHmqjTi8UgkrY2Ko/YLrmATEQzvbP2JjYg3ZbDwi0o8+vtU74qcYZjfaVhgp4Y64mlH5J2ptnCsP3SHPJ0s0Imjs7r79OPb5wRUdCFaNnemCXckx4YOuTLNTLaEla/+UVmI3C3pLRiS+ocjSyov6sIzp2+CrBRBrDzrYvUKf1y4iykowMUC7hmzYoC9jkcChDnjipFWk7vFnG4YKzgd2/G+lV2xGO7V/5l7PDbUJcflLnYLgNdJybbI2DdVqnlqeaA+eGX/7uQgIvLfdcVXMIBgWBKwPpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa9bZgoQygkKeQ1D3TNNIs5ZVXC0ciEKFn1UiWKR4Ho=;
 b=eEuYTDdVxRLLZ+4A6fBlYtAqLWE/6vc9+CLpVeH2FjqLRC+Tohs6ZsLvvUoUpvwUrJfex2aIIRWhNsu4jsAyTSqQQcO/g/AKe+DBNzvnOUhfO3yTs+0KwayqvRQVmRJldFODOG7SOd7IUCfXjlL9WS5Ki2FnvHOupnyRB4ZkYZVwBm7J0TkdaVCN+kex4BLPoWwoCZkayF4q8cJ6ZAT5qJLSVZsaSM0VFvBz4F1ie50q2w//b92nq7Hpqzv3IMe3cujXNKTRmRof4fFO+YDtjiJMK9ka5q0xOZQ7Mu+J89aVMTBRKg21WUEWqcPX9HNVVHIktMRhIjKwO//42KTHeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa9bZgoQygkKeQ1D3TNNIs5ZVXC0ciEKFn1UiWKR4Ho=;
 b=bKbuRnM96SUUFaEGAoet/JRy20ZNmz2MxVaPEll4EgdbcYCMARxole1Mc31Oc5xU2dDismj9FwVeR99taoZqSddMBPYuaMxdzcf7usSE9rTE39e5agxFm22d9OzOkPmbRa9UlBCuT3xzy9xg+vGlrXnZLtGPLDfM1ozr3o7glas=
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BY5PR15MB3537.namprd15.prod.outlook.com (2603:10b6:a03:1f5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Mon, 1 Jun
 2020 22:01:33 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::6994:b051:86ba:84f5]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::6994:b051:86ba:84f5%5]) with mapi id 15.20.3045.024; Mon, 1 Jun 2020
 22:01:33 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     Norbert Lange <nolange79@gmail.com>
CC:     Nick Terrell <nickrterrell@gmail.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        Kernel Team <Kernel-team@fb.com>, Chris Mason <clm@fb.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Kees Cook" <keescook@chromium.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mingo@kernel.org" <mingo@kernel.org>, Petr Malat <oss@malat.biz>,
        "Patrick Williams" <patrick@stwcx.xyz>,
        Patrick Williams <patrickw3@fb.com>,
        "Michael van der Westhuizen" <rmikey@fb.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "x86@kernel.org" <x86@kernel.org>
Subject: Re: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel
 and initramfs
Thread-Topic: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel
 and initramfs
Thread-Index: AQHWOF/oid8sBRPmvEq8M4eDflitSqjET6sA
Date:   Mon, 1 Jun 2020 22:01:33 +0000
Message-ID: <D0196413-4195-4F80-89B3-59859C1515AD@fb.com>
References: <CADYdroP0zdz=QtuDFCXpkDohEAgGOc7hDHT8_NnqKuvi979J5Q@mail.gmail.com>
In-Reply-To: <CADYdroP0zdz=QtuDFCXpkDohEAgGOc7hDHT8_NnqKuvi979J5Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:27b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3181110-2cd8-490c-c9db-08d8067758fe
x-ms-traffictypediagnostic: BY5PR15MB3537:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB3537E351EF2762EFF4201F5CAB8A0@BY5PR15MB3537.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0421BF7135
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: djw31F513Wnk+GnA40YKTRuVlhw4U1MikZ1DwmBTdZ/SHvD5TuIrBEmChMsu2cH5Q8xvlZ4hOfBhtvm3v4tEC/7LNdRE4/AnS0Ht4UOJOwCN4sZ0wFlMRp/MC55PNNxadUDLMfJucN6qb3RMvv6dfS1KsIrFO2My0OWaG1jly4cjSvKRSzsIq4mkqHl16bbsYBO0EBc30QHNIbt3+i5JnEB2/DYZ1i6Ftdb7Ff6MY/mYQlv5UYIaQPsHDebsREu1OUzA4JXZUomlvCTWI7VeNGyCJD8W6OQijD/RAxLfV8uGIPo7GBdVO6pHGOROHRsxpEsGnrv3EBdt8kyMIVChRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(136003)(396003)(346002)(376002)(366004)(71200400001)(2906002)(4326008)(76116006)(66946007)(2616005)(66476007)(66556008)(64756008)(8936002)(8676002)(6916009)(66446008)(33656002)(5660300002)(7416002)(86362001)(53546011)(316002)(54906003)(186003)(36756003)(6486002)(6506007)(478600001)(6512007)(558084003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: CkZTuDAXImnlLbQW9shyZT5nZVsI8efEXwHU5gL+jfruriUxCy/yhInspH2w8XRTK4Y2DruhSI5dRSB2tMEtY0KtO+jcOlKFP6nSFjiAYfz+hhv7vE0pD6iNsNcwFeZWD7N1NO8UAaF18k7mteFb7YsjKua7bU1XYjcJV5k0XbfCv6544BcdzfbSp150DXYH2B5tSpX9yIO+sZFw6rdEbR6EFoYJ/EcQJHMlZxwxFmuSf8RrU4HnhDSr5m8Np+FB5KMwG6eE3hjnXESwTNYD0G+ZTDATP4bd3yNpBos1HuQDCXGOeHU4gWjCCY7QKQRikwIk4CtNSeYClgI/7JsThZT8POAYZKUIoLLS0K9ZMvBe6JxIG5SYAZpkSNZ4j3oH0dLFsd+wvc3VO4XxVIarHSxe2x2gsWv4FcXB1O3HPMPK9HNkh+y+3QDQvYalIt358CfXvNBEYmtrNVo5bDXzqiANjK0S30ErzQsMVsFm17aex3hgCnpsH+EsapAQoKA/3wTojBN22RgtenFzmHC24w==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8D732577A7258B41B87D12AE2856297E@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e3181110-2cd8-490c-c9db-08d8067758fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2020 22:01:33.4584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apAQAqlNqFLFikN2TNjKn1nAsgck9dvDrZU/mTB7Mi7ycZwuwUHqPl1EYaGBy6Pq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3537
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-01_12:2020-06-01,2020-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 phishscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 cotscore=-2147483648
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006010158
X-FB-Internal: deliver
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Jun 1, 2020, at 2:58 PM, Norbert Lange <nolange79@gmail.com> wrote:
>=20
> The series seems to be stuck in limbo, and I got the hint to bring
> this to Andrew's attention [1].
> Hope this will finally end in upstream, been using these patches for ~2 y=
ears.

Thanks for the CC!=
