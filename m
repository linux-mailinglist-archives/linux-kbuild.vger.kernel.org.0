Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36934351F77
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Apr 2021 21:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234268AbhDATTE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Apr 2021 15:19:04 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:39560 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234160AbhDATSt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Apr 2021 15:18:49 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 131JGU6Y020036;
        Thu, 1 Apr 2021 12:18:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=hdX67VgaWxjxzGDcr9gBmkCHh9NkX5bKTCxLwunvzNE=;
 b=MzCwBEmtYKBbbCc3E+HY3iJP3+8txIQDISZFB6HA2ojvKNd+nhc7FtjoGS712PQICyal
 ED/bMKyPGxnfe3s2nTVB9kaMrEgF19ppvgmYF6YRjEGMiohDO8nRErbqsXeapGYI7Hf2
 F7LQdhgiat0i6JPO0Ti6RNckw4ynT09rR6A= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 37n2yuddv9-9
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 01 Apr 2021 12:18:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Apr 2021 12:18:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S562p0u0tCROZegRPloXRwA9Ck583sDIUdbWbre+SGwlZXQIDhtTwS1w8meCzdDXcbx92RA6H6NDX2pKprTbTIC6+JP/yoOvZslppyY+DKpaXUFX8Y8W4Mf1qGCqNtddxIYEbhDdg3ev6AGKnbqVP/V3AiTyB6ckytyLf0+yyHCriNgyE2ZxE8Zy46AsMzHWQ2fFcuKE2B/UDpz7kXtnDWW/1Z/AH7340/KsAgn6dps5gMsl9+Zq6gMeitIC/sIwNDzfhrX4SK8Y8IdWMNaUWlqlxBIuPbpE46ak+J2hAxhxen/1euX4QqZnLPznQ7rqVJxI6jjO8sMXYMBZUHGzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdX67VgaWxjxzGDcr9gBmkCHh9NkX5bKTCxLwunvzNE=;
 b=jSNo7awUkfr4IJSZ5RHKJfpsJaAvVK2bMf8LKALRjKKJlEaRhTF9BVqBirxjoJvZ0RKmirio8epUxaNztU36K0ZUZOcM6rdVxRtc3jv/XQZVDgHu/5D51vBtO3udTitf8Jf0xULmxdzj1S096SWgfXaUEO6hw6m+JzWbfvTtSW+AquYPaDscRCWhHCLgWYJ0B7w9wQIIsAWrz8AvH7DsuJjQutZBfE2Whqhk2JTjJyi+q667WTUgGYRU+JMSwGB/YpxTyauJnQs/IVoDfriUledbG+keeMjh20pvmTw2ihOGJIjP5m8CRUGabH3ubgrh2cbzdCCdAdBbqMDXvO0iTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BYAPR15MB3254.namprd15.prod.outlook.com (2603:10b6:a03:110::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 19:18:24 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::b9fc:cc5b:5e55:492b%4]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 19:18:24 +0000
From:   Nick Terrell <terrelln@fb.com>
To:     "torvic9@mailbox.org" <torvic9@mailbox.org>
CC:     =?iso-8859-1?Q?Piotr_G=F3rski?= <lucjan.lucjanov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "masahiroy@kernel.org" <masahiroy@kernel.org>,
        "oleksandr@natalenko.name" <oleksandr@natalenko.name>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>
Subject: Re: [PATCH] init: add support for zstd compressed modules
Thread-Topic: [PATCH] init: add support for zstd compressed modules
Thread-Index: AQHXJsw7/R3J18BAv0qAIoSCht+fZqqgCfiA
Date:   Thu, 1 Apr 2021 19:18:24 +0000
Message-ID: <B25BE8E0-14AE-44EA-9A30-F6FED2B6567F@fb.com>
References: <722602000.5829.1617263646814@office.mailbox.org>
In-Reply-To: <722602000.5829.1617263646814@office.mailbox.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mailbox.org; dkim=none (message not signed)
 header.d=none;mailbox.org; dmarc=none action=none header.from=fb.com;
x-originating-ip: [98.33.101.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07cf91ea-b4cb-429d-aa00-08d8f542ebeb
x-ms-traffictypediagnostic: BYAPR15MB3254:
x-microsoft-antispam-prvs: <BYAPR15MB325465997DD5AC66D85F47B2AB7B9@BYAPR15MB3254.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U7zIy+FohCro6u+duElQM0eq/L5RcgCaJb+xP8/JZ/EfxxSz7qpEtybg4osIW2j7pdShIatqdDSrS1CWlrNRHijytaiVwmqnq9Sv3KpXiwdoBFGMT91lGsj/uhFkR34HyNIqSeuNVEQNw+vsoCNWwenaIg+n9vjbgupVneLYqM2iCzLa6leedfjGiU4LCzowlHZbO/cCMpUvEx0MoHJmTt+MeXPi0dFFV6GxIyyQVX0mI+bsgepzzEpWB1QtEiLa0cegxhbAUGndNtLJnkHnyPudZptUvoqQCZgWV1AozFEr7xF9ebfDjW26h4gBa0VECY43XEANmQNyP0TFhQbRipa/ZbNiDjJc2ZVBoGGTSwz1+1UBE0b0dSUlaEC8QMh1UesNJL5aSgoQiLqjhADB94H5uMff12MUH71nHoXCHBKWSmBt+lveJNVw4ZwAQfa8hgUddQENni0h33bt1PBwkJfH/vbLNk5dtl5sgLI2IXUIzmKc+hIDKN/GhSGEghG5mtd8AqVuRb58JoM1yBBfq5eNWyzw/ESt3LNJEXy5qb34doAs70oE7giEQWNZcUx5vciq1Uu80DxgwcLc/kAYsh/qdNYJ31czaVrQ03ukxp7/DSf4uUxM8PSbk9Xg/ZaiSnsZYdyqXcI+3AVHQdNAD1TSXcZzwbgr7F3rwfVonI2rFoAY3VHz+XS5EQpcNxZn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(39860400002)(366004)(376002)(2616005)(66446008)(64756008)(66556008)(66476007)(38100700001)(76116006)(6916009)(71200400001)(478600001)(66946007)(4744005)(36756003)(6486002)(8936002)(33656002)(316002)(8676002)(5660300002)(6512007)(54906003)(53546011)(6506007)(186003)(4326008)(2906002)(83380400001)(86362001)(26005)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?de/EibdeSJKvLzukNE7gEsa9n/qyMAw2IiYXaqAxINZGdNQzMKgxmDv6xd?=
 =?iso-8859-1?Q?2qiX4SY8mXF6i8flii5yPnlpwIfwtEZ8bqBNbW27RgkBgbhi+0N2ObLwTi?=
 =?iso-8859-1?Q?jENye5BNgUdNWJ2SAT0Vuj+PAMmxL6hQu13ZO5GJPi5ps5bcoahh9Lofjb?=
 =?iso-8859-1?Q?1qs+Rt1ni7ztXPisT3U3VeQY8ucRZi9Fjd+fL42xfAapmH09b2Ds9S1npY?=
 =?iso-8859-1?Q?XLMWSQCq0AdidklJQajRqoB6/00kw8ZBVtayiyxk3ZLStBj6exAI4xj35w?=
 =?iso-8859-1?Q?990lKaM6j4WR6Ms3KFrlNI9H0qARiEP9u9Pr2meT7dVJqCgVu5irmEh7i1?=
 =?iso-8859-1?Q?klesChu5BE52koOwjfcYxkJmuqUriPyjQfqdA1Z6InhUVNedenwonU1Wnq?=
 =?iso-8859-1?Q?QgRuehX3tbyK4WzOn64Qx9jFkKBq9ePAn+S6syVaW+YfLYaMdU0CN/ra+O?=
 =?iso-8859-1?Q?sYDzNAuZhLoZuXq4oJtWqqJihO8tPOe2/XEa17XvYWs7gsqp0u8sC5Y9Cu?=
 =?iso-8859-1?Q?IaGw3E9BMfkFkO21sZ2TbspssNHq9Cd1i0mGkcuzIu16M/iLE+NJjCWKjE?=
 =?iso-8859-1?Q?B3OGtx37+9nuSni63MfoX4Vh+ArrwT4LZA9LWtEW24+BC+5754yCtshmlq?=
 =?iso-8859-1?Q?EOVy7glyOg+jfDSRnflUaHQ+PUe6y+W4dNvwyaf/ZvCHtwEpGL1SvpRkR/?=
 =?iso-8859-1?Q?72AuWTegBnVCPMNP3/A+3qmqTsxkkLrgEjFNeGp7HOHDhnCTj4fvfysu7x?=
 =?iso-8859-1?Q?ACCGeoXSJr2k8eRy6njhy5ewqX+5pcw+f3eGYhQI5+qe+Dnhu6LW+f/4be?=
 =?iso-8859-1?Q?onWkOPI1/nsRSG5st7i+iEuarwLrrFp/sv7F52Wk4D/xz75aguIgaDPFlf?=
 =?iso-8859-1?Q?VJv+MaYNHl3QRvpdi8gmXbAheII0cC4Nsn9nozKsLXo1ZQjt1WISHFw8JX?=
 =?iso-8859-1?Q?OM+5pYCTmLO//7gQEwdS92EfJV26ITbrjxAOP0qWzEvGpdWMgQlvqkkOTr?=
 =?iso-8859-1?Q?0i77VXC93c3XaoWh7er/sMvNsrU9xMFlWd2QJXeE4TjJkgtM//GFVQnqCS?=
 =?iso-8859-1?Q?s2mhs0V8eFR4mQEcMfel9WSZyJlsT3S12IDr7KnY7hBdLxP1GB+TNk2Zlh?=
 =?iso-8859-1?Q?wnJJsKWEChpgBtmji8U3TMudya3tXi7UMMsfewOnpat38Op+jM/+nlilWv?=
 =?iso-8859-1?Q?VuO7NWi4o7karthrtRlc9FFBZ2DIi2Xk8UqHyq0xYVveEeoJs/TkQEkq4t?=
 =?iso-8859-1?Q?IoAVMUC/6SLCOiFcBV8J5p1yKPmQJOa2trWP2Ai1+4kMVEHI8ijOuZi3Jk?=
 =?iso-8859-1?Q?rZ/98nnij34FKm7IZzq5ud7FtFHlT4kmI24mWEkmjXleDENYcKrm4PPrE1?=
 =?iso-8859-1?Q?z17pjeii0c?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3DE321696536E7498EAE5B3932FD4D1A@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cf91ea-b4cb-429d-aa00-08d8f542ebeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 19:18:24.6882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiq+iJJODJmgxWat+yt7LsSI3USTrgoPMP38reopb5seLu2OIjOTIqFfex+OOMtR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3254
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: 0vCQ1CD-p5zJ4ihGjCvcr1LSrWyDseCL
X-Proofpoint-ORIG-GUID: 0vCQ1CD-p5zJ4ihGjCvcr1LSrWyDseCL
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-04-01_10:2021-04-01,2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 phishscore=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 priorityscore=1501
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010125
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



> On Apr 1, 2021, at 12:54 AM, torvic9@mailbox.org wrote:
>=20
> Thanks Piotr, good work!
> Question: Is `-T0` really faster in this particular case than the default=
 `-T1`? Are modules installed sequentially?

The zstd CLI produces deterministic output regardless of the number of thre=
ads used. `-T1` (or not specifying `-T`) will produce the same output as `-=
T0`. `-T0` will be faster for large files (at the default level, multiple j=
obs will be spawned for files > 8MB), and be just as fast as `-T1` for smal=
ler files.

Best,
Nick

> I also saw that Masahiro did some work on modules_install, moving MODULE_=
COMPRESS from the base Makefile to scripts/Makefile.modinst, so perhaps thi=
s should also be moved there at a later point.
>=20
> Tor Vic

