Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5581472BF51
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 12:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbjFLKkt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 06:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236143AbjFLKkQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 06:40:16 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FAB410C2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 03:24:26 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CAIou0020264;
        Mon, 12 Jun 2023 10:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=lJHRuH1n7V9jLl8ry59S0LN8U9W6MEkOWtrqNcdUC/8=;
 b=32VixzS067MZa/Z0niDAUOPPu+DGK5QSSs6BbBaQN/9z5ApOaSqxnP3nELD3S0uG92XE
 fdZgaZ4qHe1TvsK7YIjdCvNVPdN8LoG8gpNqts8ylourYhC+1TO40Cm/MFqbA9isLW5J
 5AhBiDlKqh/LLotv57ALCvqWPWifRSOQSsB3n10uUiFOEHxfCWpUTLHeGQFZfRlufDR5
 v25JTh6Kd7ljBtMT1g5ldwt7jwnAuv7QK3iIFdIZl/RwdsSnPTHdHJ1nvV6hHm6aLu7w
 TNDRyNKg+P3GIpYX1KA06XBZRph7iCouusrB1LyZ2Wj6swygkNf5tOqurSR1dt/Qzozb KA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h2ajkee-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Jun 2023 10:23:00 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35C95NN0021593;
        Mon, 12 Jun 2023 10:22:59 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm2kuux-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Jun 2023 10:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAmlooS1ceNzh/5Fk2UwmKIi9Qbti3j2CwrbJefgPouI+w6qAC+iMLYLpQ9e8Fj2TAKduCRSKSxNaCqH3rWnCSBMc6yrNWhuLWJ8YfMgK4w4lBWxxNcZ+XBIj5JEByvEqPqF2alYyPvKDQmXoV7NFt5nPmt8W+zPppU7y1sJ+uATuLysE0hmOHOBYPCOcu52nxJCT/ihZmgAq2pqEk7Vxu5CRdU8y6AHQXf9lxuuq4q53d0qOmKonxn0CoQS8VwpmFxCad8Jp8e2Lvn5u3fftNXOASjm9lhtw5DK/W1M0CUZEjvR7ABOT9L9EP57A9DsZBY4f4e8NSK6f8jG6dk47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJHRuH1n7V9jLl8ry59S0LN8U9W6MEkOWtrqNcdUC/8=;
 b=PRDz8Tms0lVPIHuthaTzJXKPCwL6N5ELzM0BTIBkjehhNKUfH6aKhDKDL2xIL23aNIT2Q3D+LrjJDN7ikttuNzn9Ehx4UIKJsrhT2eNUhXYtAFNeciEMmUghcvnZEoqW2XJaP6PiUevyTcsZhm/+yHdPPv4wHAFrJFSUGiC/YGP93CgzPyeYSNQTG6eqgKz3IR4/uIVL/zz3By5XAqg7OMBBhhdl2VXvlo86k6nX7el0/+x5RVrw6tkkh4tkipRv0NUn0Kl/wQ7K9sO0z3rpt5VQ4O+FDLGpHlBNbrzb52hPMINCjOe22qs9Js8PbWzWDsDhgd5hZt5CuK1TpwSfbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJHRuH1n7V9jLl8ry59S0LN8U9W6MEkOWtrqNcdUC/8=;
 b=gebhrwmmDkex7NvlNMCR4ljayB+EnPX8ld7YGTIw6mXkuSGP21Cl2Cbj0c/Gy027iURcL7ijFFTa8ZmUZrqL6DujhC2NUvDjq6ZEYulaRzo6Epzv5ZFPyMGVzKwY0LtOuYINfL6ZRiRv1FKg5owXNqxX6YH1WoyExa3HQ3hXUrU=
Received: from IA0PR10MB7255.namprd10.prod.outlook.com (2603:10b6:208:40c::10)
 by DM4PR10MB6765.namprd10.prod.outlook.com (2603:10b6:8:10f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 10:22:56 +0000
Received: from IA0PR10MB7255.namprd10.prod.outlook.com
 ([fe80::6f12:fcdf:da87:2bfe]) by IA0PR10MB7255.namprd10.prod.outlook.com
 ([fe80::6f12:fcdf:da87:2bfe%6]) with mapi id 15.20.6455.037; Mon, 12 Jun 2023
 10:22:56 +0000
Date:   Mon, 12 Jun 2023 12:22:51 +0200
From:   Quentin Casasnovas <quentin.casasnovas@oracle.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Quentin Casasnovas <quentin.casasnovas@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org
Subject: Re: [bug report] modpost: handle relocations mismatch in __ex_table.
Message-ID: <ZIbx+y42dwjhiIW+@chrystal>
References: <ZH7uxFaLhjul0jp1@moroto>
 <ZIbnPPQbrtmmRiQO@chrystal>
 <cfabde17-49b1-457f-89b1-f13ec36be1c6@kadam.mountain>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="trI+Skgl2S12dsNw"
Content-Disposition: inline
In-Reply-To: <cfabde17-49b1-457f-89b1-f13ec36be1c6@kadam.mountain>
X-ClientProxiedBy: LNXP265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::31) To IA0PR10MB7255.namprd10.prod.outlook.com
 (2603:10b6:208:40c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7255:EE_|DM4PR10MB6765:EE_
X-MS-Office365-Filtering-Correlation-Id: 90fdf77c-39fd-4a0f-a4bc-08db6b2efcfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vQkgvfaoQ4KK9UNIblE+6BYhEqQJxKLsHGe+KgrHbGEjIIC10r3gXKJ0/NHkjaao9l2kE9C3BZcFfYz7rOukivlskcEYBK5s+t9ZOE9P7YOa6xxgUON1IKpZf2Rdtvs8fHQz/hzbL0rA9uP6xjsyRc7jYPA8bzDtmLbZmhqrU5cLDKBU9B5N4Eoz5WL/uBxRKm2z3/53m9ReJx8SaqlyiAsk/PPYQhdROXfdHbWTA2d0T6j+u/4D85fY5GUXYTe+ZIvkeETj4dhhngoZDoUFNYGfnrLtEaQY5NRQDIaR8QjvI1ypixF9WV8oRwFblExr7sIbRcjbSxIMUBWeGbPBNW30p+gtG9NfhDISyGd2etZOMg7xhtC6J6EmgGFwNDtsn7xPQN3ZuqIV7YKqgql5LzSmTo77oe8Y25MW1pi16creWx78pXdq/iUOeBwD2xBrv5H1ER50pEecqmQ9xW6Oc0BQPZcsT3sqxrJYW30xlED1EMkFXmhRTHae40Puwnm8KXpaYVTDp9bIjfgbXrHwvWJAx+fFu/e5WG0FHSwZD/jrCbuq47jLTQxAMPsjrTzN0XCtJ5LSFe4W+bulIkspgIv1BSjFSdVwt7BcAZ8TkX3mAnwB6FxzKbf96q7vi+L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7255.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(39860400002)(366004)(346002)(396003)(376002)(136003)(451199021)(478600001)(6486002)(6666004)(66556008)(2906002)(66946007)(66476007)(44832011)(8936002)(86362001)(5660300002)(38100700002)(8676002)(4326008)(316002)(41300700001)(54906003)(44144004)(26005)(9686003)(6506007)(6916009)(6512007)(21480400003)(33716001)(186003)(83380400001)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lndiwaOfKrhV+zjle/RrLSHcItsgLz7/0wkn6wdvO0bShPMLpUwwt+/5liAS?=
 =?us-ascii?Q?R6TsMs35C2hQAJqxd9U60mD5T4273FgDqYz86X4PT+w6H5HinXBamKJdoioA?=
 =?us-ascii?Q?EoxSuxW5T8VvyWCBw13qc548s8ufqoqDU0L11CAB871XUFUPdNctE3NnoSsI?=
 =?us-ascii?Q?oyIgb6NPkyGe9tT5Jf3Li/mwFS1WMCvi9qBvCc5CEsM4A4QzbPJJfsDePTkG?=
 =?us-ascii?Q?xg0zrSQQA6JkoA3yXNUlcoypiqi+B9hg9VU1Tb9EujqvVNIyVOEdhBI3+cZ5?=
 =?us-ascii?Q?DrVyAL5OYTqjMAyJtICgX1GIwwDUVcoy4kfYL3mZOgEv7ZIox8fgf9hO8YjN?=
 =?us-ascii?Q?GPgCzd0i8UWmoS4R3BT4cRkEzxLsF84jnB3kg4BOoPoIATCXaswk+xJXD2OA?=
 =?us-ascii?Q?CfEJQmfaHjgVuUv9f8rpQMPbOqAyCT+tS/2+BTXYuoS1CVIHDCU+0QiZ9vkZ?=
 =?us-ascii?Q?Lb6jfjEVgiz103foebF1gOXq+/haOEl04nK2lI235W3qCt7ckWhZq2f07IEh?=
 =?us-ascii?Q?/Jqbf5Ep1sdzKRQ51kfthuVSqwkb13+Bm4sFWoj/qkFQud3/CP6dRtseacZ8?=
 =?us-ascii?Q?yrWpdw+we8+MDWTg3yr+Rdcm42KS6ge4nc+s+aGiwPs15Q8E6REGd17+Ekbf?=
 =?us-ascii?Q?VB/cZH29v0MoCdAa5TEQa61FbpW2HtSuBq5Qr4YJVoHWWvTtTXq55+p58MHr?=
 =?us-ascii?Q?WKHR5aXioY1F9N/+qaM0VQg1MDU+rnUTTn+Avze8sty9JGAELWrttIsIK5Vq?=
 =?us-ascii?Q?uIroGnVemhXFkEJbiBRBRn5jw+luydo+/GFt4vymyhUgNGSZDNnvXrVQieSX?=
 =?us-ascii?Q?KyRr8jvlFsq1QnUv2exBwOA0xZeTyUPKJfN2FpQk25l5/OxiUCQ4bB/En5pP?=
 =?us-ascii?Q?6LYKx80EZxRPIL+Wdl9TpDPnKNe//58HB1V8vV5mNJfDit7PdTa1OWjXezU8?=
 =?us-ascii?Q?VSMX8zXuGX0ufruTZUSB1cIOUoBbjGKM44Xl9m7Ii3Vr5JUF+m7uXEg+hN+8?=
 =?us-ascii?Q?ce9BkJ6y3mXy7lMIqjyOt1/9+eMB6gFwxY+hQ+Q9nfXhMKRR0DvpE9wsydFY?=
 =?us-ascii?Q?ErZNIyvA7s5rRdbv7vil6VsVhxRphWdL0SDi/7tymfUA6ema0vl+6nrCCo4o?=
 =?us-ascii?Q?N2rmeDOc9b9CeZGsGD6lVpzLpWzaTymMOmJ6SOluCJhEYcpWFJFQZH1KwPb2?=
 =?us-ascii?Q?5epA9Y/pldF2I6XBciBtYiAhPe6DCRYPU6TQ8Ac22UbZ74liwbdHW0DuyMxC?=
 =?us-ascii?Q?jBm0p2z0jiFrRhHng4ngwF1PHGIwiSgg0mOaKzuHYqgZpKJg2XFOJsISjJ6d?=
 =?us-ascii?Q?w83Oii3yik0yToQgkOY5RUm2XbfsiQuO5SQy0n9nso84kvT7gcNBz8JxuMPX?=
 =?us-ascii?Q?120bioVruMgSWdpGU33fDi/5HcVgtUPT4BM4pWx7Vf4NTLmy1x3lXmoN/24X?=
 =?us-ascii?Q?Idi+Gjgrqlb6EFmyL7XEn1hf5tPocT5Q2n8uIWHclCpRkodWS+4IbU6aXBc1?=
 =?us-ascii?Q?X2XPcuIhn99gUP8ZoHzw13oq+a942Mfpps/614D3PTLyarDfdU9HgCwHKkLU?=
 =?us-ascii?Q?Jh4pcFkCm4pO63pMGv8hdPvl31bYcxFupc8uIIDrzP/cpldag1GZGza5RG3N?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: brSI6srdGQHnHyUP+7NfyPNkEBH6Cl7X1j4ujqsP3VBt289tZWVXnTTFLdD73RAWveQ7n9TPEtf/hKh10KqCgd04CT5oiy4ZiqeYBKx0ag8FR/hSz3JwToEVN0sexn48rp9C/7o5vqHxTjVJfDerrtchBKdJ4FSm2iOMF6sJoCS8+erVSUr+Rh2VdjCt0HjgFLR7njBQnEnP5u5MAZC8z6aE7fkIo5l1NyqGb3XGQdkR3PJiYBrD4e9inaQ33k5Q/DHjxXboxSU+RaOL91e/D8LylL011XPymatVe0ziuOTjSO/BHpE3S9s7ch9ZAjUe/opAk5A3w3iITn1sFez/XO+ngezADwRh0/UZOQyhGMa1t7MrLnRgCAFJo0okVG3PFYIX2f4Xaf99k9Jy9zWAwPUHCPPfob2fR5fY8tYBlWwhrIilufzoxK4q+n5KPkKgZIxU0RdI0ORZFqiBDxao6EgOyVH4k0PrfYdkBQoH6JQX4xMrDZGhY2+fKzd4oR65dcOVkztbJq76waGxX3kXRjssHF7aBQE2gkWgSMGnciQ6SigJ9r6A1EBZoA6wUtzogM0nV/R8UYOImGL58VrnQZDkh7HPzoqqW5pUvvp8TUE9OywAHI3nbfZWVtQiQmGh6KV+CPU5YT+Wza+zJOSfhML8VStTUxx05JvTPE+DGPo3rhTkZyitDbVnE9fk2XD0nqw3Og5luPxb+sg2aiuUMFY8+oN4dRjSo5mvJJyOwBqsR0r5sEpgsj2RaQPqEzMau5iRuBh2LnozMXD/ZRgFaIoCAZAZoaxQpQ4a+BM2ieXNKjjJl8yWZe3JbePRFmukT9SYMHcx7+zJvSQUffwmFj0exfm/qrd9UifCZm+idRmuCaPZFu0N323caSEl6Hd3
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90fdf77c-39fd-4a0f-a4bc-08db6b2efcfc
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 10:22:56.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XW9Chpx+/iBGfn5FeUpe+MRTECe3tcUNccGwbJP8n26zTYSh+U1bhroQTPGEXHojrx4GfMU0Ax5H7UyefoVNogfyi/nB/prLEpyFHT5EVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6765
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=792 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306120089
X-Proofpoint-ORIG-GUID: VqJ5jvaV1wKIBt5yxlfv0Ee5EqxyACME
X-Proofpoint-GUID: VqJ5jvaV1wKIBt5yxlfv0Ee5EqxyACME
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--trI+Skgl2S12dsNw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 12:51:40PM +0300, Dan Carpenter wrote:
> On Mon, Jun 12, 2023 at 11:37:00AM +0200, Quentin Casasnovas wrote:
> >=20
> > Have you already prepared a fix or shall I send it over?
> >=20
>=20
> I sent the fix on Thursday and Masahiro Yamada already applied it.  I
> Cc'd you but probably you're like me and respond to email in the order
> it's recieved?
>=20

Indeed, I just cleaned up my mailbox and saw your patch.  Thanks for the
fix!

Q

--trI+Skgl2S12dsNw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3Qb0Ymptb2fJafIXHlO3TWmj1w0FAmSG8fsACgkQHlO3TWmj
1w0HCRAAlm9t8gHCV67Qdn9Pw/aOiFyGPb1IimsmN1E2E+dVe5NGCahlv7TFMxYx
nAH57lQFO8CnTw4i5tsMt9q4/UJcK5nuthATUHMGRpPlnyVKq56Wu7cYGo3B47yi
u0GBy/gaXAq5hM0x7Kr+eX7GN3x2DN/2ftQBdWBIMdDB0Fqnkf/of5qYIE8cX1On
tx6QrSy2qBWocN9SBFOdkqkkIwmmo3y4eOUDpDiYXshnsQgNPbc969G4JzSPxQtP
wji/6wWXuTKUmFFSOy7zyzDTGxSl7w4OVxV/qmWqHR6TeNZzAKl4h57NzB3WT5ul
Qr2mwF8wKYduwFHgj48gqqrFr0Kon42pERAWHEHZDTdU7bYQOJW6mBuKlPPUTpvO
yayX8JOcWG6M83Tj6Q/R0M0RKSQXkAjp6/lrK5TboE8QOpM+GK8KbYU/m0ZLGGLR
SJK9l1GpRBanTw20jfQWGj6FR6gDM4s09JNqaZfrP2sChgQMMNgf5kTxab3u2O7D
/C36gfvcNfgpKMLSrx5UiVbaGQeP1ZRNkyzTT+emuaz7rwzh/TQaTYsN2nLn6KGa
bkWRvtCgB4BJjQxBGyGtAHOs+Zt+QpN4Jojhu2gaabq8itms/RYff45qL6zMdXt6
ckClpJFFMaD7ARHcxGpzH+y6E1hPeNV5x8PJaTi5SRJE3TQDBV8=
=NVz1
-----END PGP SIGNATURE-----

--trI+Skgl2S12dsNw--
