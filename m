Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E81672BD1F
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 11:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjFLJxm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 05:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjFLJxH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 05:53:07 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23754692
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 02:37:19 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35BNxBqo030855;
        Mon, 12 Jun 2023 09:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2023-03-30;
 bh=oP0c+EZubzllJnKOYSUbk7v6nCfpVw46+6+iTTfyddg=;
 b=fReTOslbTeNpkxcobDhFX5swWpDymlZzZtEXgfdQfcSghN2/2TGv7nlUnGHghHYHoM0O
 3RJa1LObTstEH6CtAp8bRKoGPYTqQGpikKJwt/sWpTDjIDey+ZWMDsHnm0HUtObNClqA
 s4dEnMiwTLakZZBQAPBMYSEk+np01AXF1db2npZcQLX/0tDS+zxF3RAVgzez9qxZ7mNS
 m/2Q67i32/Pe3kMe8H8AT8GCpfQ0OA74r7cyfjw1vzstjfjdo8ym+e2kjWiF+HfBdynZ
 BnjrmvJLTUNDckPsRSbvzRrMxfAvlyw7vCIR9D/cAGP2QT8kq49VFoAtgXxHhSQGB4Xr Jw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fy3agcv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Jun 2023 09:37:08 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35C9GZl1008273;
        Mon, 12 Jun 2023 09:37:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm8t4tq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Jun 2023 09:37:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnyVGKMfMqtqfY0iJ1imBE+OeQpbdxBS4MskjlHJQdPcDROmL2tN0nmPH8d94qMDNxdW6//GTpjBPlokMtcoIHu6DRy5zPb3zIzxvYprG/Yng0iwqbe0dwhNB0amS8R+liJpajbc0RUPRQvK29MC4YYCzvMsOqf4TKA4yrxbQitYd2TTSHwr7QXj69p9eoioX0VciTPUMHM9BM1DJjcHTILsvjfaO4XIBCsNNyDiNhQ6isQ6D2p3IP0uNYgZGPmN7J89hyC9hBHbqA4qak1rbzx6U0myk9J3uQMkLzyqTi8/Hzc1jhsNCSKIunMQ9xM1eSTIDfnGME5I4Av9uWFLwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oP0c+EZubzllJnKOYSUbk7v6nCfpVw46+6+iTTfyddg=;
 b=h72gZJu4qGGno5G6xEg2VCVwCRaB9o3t2SqodFHRKagW+73fuvA7vNU4V5T5ek2mCmKFcRxUSC+mIyuvy3PDUIrySfFUGGHCaK0RTMtdWGhE2VgTDyRmGAYasb6Pm+fnVLD4Cedn3RiwxWBkGbXzmEkpsEvK0qxVY7uvTzvEHdUPNuM0htjtNXn9mc1vIrW97yAGU7VYzEmdgwawSJN53HF1XlJmDkF7ESPcBoanOKGNDG7OVbxkjZM8g8t8JJUSNJZqejiZT6ffGbsSrQ+qxhMo9AKbw0QguE6dwmGwkyuii1EJOHW+nbSNUoFKpXtCcVa+HuymKoqRgllliVqmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP0c+EZubzllJnKOYSUbk7v6nCfpVw46+6+iTTfyddg=;
 b=EHmnF72wZfE9DHTRKKVp2RfE1aGufG0yEOcj9+mzEptl3sVvuLzUEdceSwInayqb+UcJ/03lqSjyquCUCwFId72XgleI3+TYSqVbdAOVFqpDJ06Zm5y11+1/t9CDAF9oLHlxAB19LqD59qGKvQL27HjOZZ8c42ud1Xet9onowRQ=
Received: from IA0PR10MB7255.namprd10.prod.outlook.com (2603:10b6:208:40c::10)
 by IA1PR10MB6687.namprd10.prod.outlook.com (2603:10b6:208:419::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 09:37:05 +0000
Received: from IA0PR10MB7255.namprd10.prod.outlook.com
 ([fe80::6f12:fcdf:da87:2bfe]) by IA0PR10MB7255.namprd10.prod.outlook.com
 ([fe80::6f12:fcdf:da87:2bfe%6]) with mapi id 15.20.6455.037; Mon, 12 Jun 2023
 09:37:05 +0000
Date:   Mon, 12 Jun 2023 11:37:00 +0200
From:   Quentin Casasnovas <quentin.casasnovas@oracle.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     quentin.casasnovas@oracle.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org
Subject: Re: [bug report] modpost: handle relocations mismatch in __ex_table.
Message-ID: <ZIbnPPQbrtmmRiQO@chrystal>
References: <ZH7uxFaLhjul0jp1@moroto>
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qVILmR+AH3mk1ntg"
Content-Disposition: inline
In-Reply-To: <ZH7uxFaLhjul0jp1@moroto>
X-ClientProxiedBy: AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::23) To IA0PR10MB7255.namprd10.prod.outlook.com
 (2603:10b6:208:40c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7255:EE_|IA1PR10MB6687:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e8d99b-2ccb-41d8-7a88-08db6b289530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qy29bPw8R5BcrxRUDUN9N2Ae3AFoKLTHVZ3HXbGik4BL8hpt16A5/yYisuTB5uquGLrW14gXSrgur2hMUeSh2kRc2A04154tnFumcPTyWL4H07rids6OcKWCG/109p68a2KCnSETcyKk2DoDmWPl7ZiNQ+BYt82I+DZ4csl6Z6JfRKkZ0hFzKSQFmktTwHlv90+u7sA/6teVmSJvtF61fae7gxArFssDRd3NT9cg+AyWfFibYHhTQBBEPWTzeSP2jB4ns1JhAGD6HgD2Mx/8a3D/+zISY/WmVkWOz196CIPS0YAbhK+14c9QCl9/7jeY6viymW7kxzITESE/JIRVgP1bUKf7HHXgy1s0ouNHV+eZL3KEglBJOsbGhuCJ1ymI8KeQQNV8xGoKDsU3Yw/RvS49OdI4BH9Z2diKWjA9cLzqIbDrBDKx5yyvs4H+Dkcdpymn8vcrWfNN4s3t1fQvYpwI0M/mj8Sl3ZfaSoi9VBE39F6aC5kX6V8eEzhE7qESljdpTickx5scIjtVrrMsecyNy1d7187l2gLYaNr7BrZOi+knfry4/Lo71jhmU+/86hDjjwcDEiIyU7YvRjDHG6DGKv/v5wtzFuzDh94+R4Si/xAKqbL0trPLodXhEuk6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7255.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(86362001)(66556008)(6916009)(478600001)(4326008)(54906003)(316002)(6666004)(66476007)(66946007)(44144004)(6486002)(8676002)(8936002)(41300700001)(5660300002)(2906002)(44832011)(33716001)(38100700002)(6512007)(26005)(9686003)(6506007)(186003)(83380400001)(21480400003)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GBs+0kjT4cySZl+unejpvFkIuLrZ/SdlvlAH9gRcQVbpKllv4lHaX/nhY37t?=
 =?us-ascii?Q?URkK3+RBZXJRcNp2yIps/CLoRyOtAaBDNl/QtwTr66odugQcTexPKk+2y7cF?=
 =?us-ascii?Q?a1Oklag9Udxuk75CAHAQig3IO6JCb9faPmq1ixipj1U4XMsdNrDLWHlGoZPk?=
 =?us-ascii?Q?XywXNUNJe+GQDfHW6C2GA2wl8ZjvsTtry0aOED3eram7gY67BlIFLx+j+yUR?=
 =?us-ascii?Q?mOScWxEqTDJdR4JRvT/ssk3fpemXJOYUTOU9Ti4dx5/x3Ph3NA5hOBE0kAXj?=
 =?us-ascii?Q?La52q05bEoPG/wcUYssTa7Ze95XBQ9BPtEPWuxT/BB8aCcDqomJOvi0s7im7?=
 =?us-ascii?Q?FcM3dLgcCj08/Ejh5Yyp7VovOaxaTRlL+Cw8fC199Gt330LmMWdXjlsc0trQ?=
 =?us-ascii?Q?4CefF4CXlRc1OxpZNFhNhzPtkqqDHnIPq4EQa5Lnbqo7oaPVLQa/1XD9J2+t?=
 =?us-ascii?Q?/9BsEM3nW1VItWalUZCHN/Fh/BK+aUn4a3zo1yUeXt1rMRO1/N/X6Miuao/6?=
 =?us-ascii?Q?GUMvS7GDGIMx4q/YIUk/rkdpvKTyIFjanA2q+au2Pb5UVw08Jnk5EzMGZOhn?=
 =?us-ascii?Q?TSc1WrcvyaFZgvNtbHxDyuEJrduRbStK/oNE6qyt7hvemTPAvcW0SpG2ihYW?=
 =?us-ascii?Q?kjaaZZzdh/CnWZRbUDgcNecbDAcN2VxyN9XEY/afmGixlg46w/3ElCh3LiBZ?=
 =?us-ascii?Q?iTZq/WGC2sSq1B4lh2KFhN1MuVx3b2gnofEGEBUsAMmH8wTR10B1rnGfRqWb?=
 =?us-ascii?Q?GMpcYeWRO1yxrmX5lypABYiFU+7n/x8Z7zZyr1m3dX+U629xYjCClhl67JzE?=
 =?us-ascii?Q?rMLoWb6ufKBmqbT49Fe9m+te01GKfMnY3b4GBHWL/0iL/aJyUib5wigHws5X?=
 =?us-ascii?Q?85g7FcmLsXGli8yhrQLMeuyHnUjfggc9L0F4eBO6fSDGOnDKIL+mC2RUucO7?=
 =?us-ascii?Q?UvAfYG5DIbi8d6Ln8JuQuVctbd5epxvrGwQ3XHf5hqVyefqpxaSoTf/KlxbI?=
 =?us-ascii?Q?tElybWKNw7hoDMxmHmaOCBioCDsKCPeiVdfSPOv4c0OIVx3NqbcPkmKstRan?=
 =?us-ascii?Q?N8ReSdUVPEDVN35DbeAmj62vYcBJtnZZsYo2Ety3X+dUqo+BuSVKgOgdVqEu?=
 =?us-ascii?Q?SH5aJAzT9RjiXsXMn5Jdgi/WwxzyBTeQq3VQunJ7M6ST/+O+a3c6NAQWcy1z?=
 =?us-ascii?Q?OQHM54S08ZXbKaNu2yYg5nHIm25yZwxl2LuCSaU7aTtKWI5y71DugqoLl8jy?=
 =?us-ascii?Q?K7SNz5Lqrg7S9PT2l7utSE7xNsBiA72SJqVpWKE/iNt59OXAelS8FVUZR6Ho?=
 =?us-ascii?Q?pfYHF9S3lPpnOEbQNqX0uT9ZZrsOZxln5xireWXybzc8oAr4q4Tjho8fS4+t?=
 =?us-ascii?Q?rzrMvVvg1co+pm9aJc1fcCWafOzpZQqoh1tfCR7KX+QJ6x+TFNSBbW5ultSb?=
 =?us-ascii?Q?HcOn58/lE5/V8+e+axN+TQEGs+GszLnUMlncwiIO1uaroNhkrBLQLU4Dan6Y?=
 =?us-ascii?Q?1PAqdC190XSZBTDrgO/OhhqWJx4iFHw+4z4UgRVwwA8LHNfs4pgwvgO3ZFEt?=
 =?us-ascii?Q?OHuFVfQV14Faetne2OAbG9tRXKBZ+KVMFiDor74BJMRhdtQ4r4JNJojBiQ3Y?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YZoF1iA7j2a9szAwD7WNwN0cbP1xAoLnKMC5CcTj6tHatJKtYxrKBCUMJ6kAacX0fIGcfihAwIZUJHAbcUrFffSUHgeush9Gq6zgVIFA85CkbTc44ZMddb+/QZ9Ujj8Z6DZspqpWU36cPDJlvA4Ln2TzStaJSQ1g0NJuKROLytKBXw1OVv7OV8DIG3Ydnesv06Y5MRCdu44u5J0UsmM6xfPLUHKwaWQxtHXFVLLqCd4BDUuwGOABey/MJsB8xUvvZOXpCQmZQtREBy2rZBQu66K/1Mcb+0jx3dQdg8ujVjwUSGj/IGwgY7v+HTFw/MA/U8/JlCjA05lYaSNov4/SdOAjhfQhHmSobqiECoVeDBo5Q1Cgk3EgMpV2LtfRHruOSNuOSLP3qGp5p4+vmeL46Jw1ITBKm4bKfjF35DuLf8NqVIkE6zffNpLx7W4+HLL9en/vbfPRpnklHIpTK4xAGOtUsHkQ8efTPHfPJ9ZkbGEI5Ja0vEFoKstRPTS4YtTn/HWpVNCpFGCbdvbGYfVf7CXc4v7pbxTjdl10qZaD8EofiBDuypDbM7BRExfwxzCXIL5PGvweMWlH6YWTN3Le8sTbZxz1eFJsmq48SXGE+phxKd/FH/MWuR1bQyrL5Anc4MA1ZKXM+ApF/rTsnuUdSpW3x42oOUvMblbnEYqrpknMN/Mc3I+HMqG+29ss2CKHZZuRsdLoLx5O6r8MPonQ6gafx42jFTxkIC1UFNbfGoSozJB9Z6+RVG+cwZLi+e7+l/p4mfm5G9bXdwIpPkBIZlfot3AoF0SzUB0c5LYAU9NMEv4oH8sss2csxDW79iiSYQcPfq1g1ppivScqazJZL5Iz4AtXXoW9u/vLVr/yd6YpLAV3t51aNDdxq5VIr9lF
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e8d99b-2ccb-41d8-7a88-08db6b289530
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 09:37:05.1877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9jS9srT5C/SpFWxa2qnptpMYGFvvon9b8naRieAQ3PNyYjsNzJNUOG1/1hi0DT9TX0ajfJjs3ZuQrzn5d78lLEY5HY3DjxJwnxom4v4ePI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6687
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=807 phishscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120082
X-Proofpoint-GUID: Qpk0p2XyawPtgz2dbl2Bd3X-ECgJzvu1
X-Proofpoint-ORIG-GUID: Qpk0p2XyawPtgz2dbl2Bd3X-ECgJzvu1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--qVILmR+AH3mk1ntg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 11:31:00AM +0300, Dan Carpenter wrote:
> [ Ancient code warning. - dan ]
>=20
> Hello Quentin Casasnovas,
>=20
> The patch 52dc0595d540: "modpost: handle relocations mismatch in
> __ex_table." from Apr 13, 2015, leads to the following Smatch static
> checker warning:
>=20
> 	./scripts/mod/modpost.c:1154 is_executable_section()
> 	warn: array off by one? 'elf->sechdrs[secndx]'
>=20
> ./scripts/mod/modpost.c
>     1149 static bool is_executable_section(struct elf_info *elf, unsigned=
 int secndx)
>     1150 {
>     1151         if (secndx > elf->num_sections)
>                      ^^^^^^^^^^^^^^^^^^^^^^^^^^
> I'm not positive, but I think this should be >=3D.
>=20
>     1152                 return false;
>     1153=20
> --> 1154         return (elf->sechdrs[secndx].sh_flags & SHF_EXECINSTR) !=
=3D 0;
>                                       ^^^^^^
> out of bounds read.
>=20

Oops, that is embarassing - thanks for catching that!

Have you already prepared a fix or shall I send it over?

Q


>     1155 }
>=20
> regards,
> dan carpenter

--qVILmR+AH3mk1ntg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3Qb0Ymptb2fJafIXHlO3TWmj1w0FAmSG5zwACgkQHlO3TWmj
1w1dUBAAhJaAQC4e06lamXwpwH9u82fEbXrTxglcLdsNyGESOmidYGtcp8kQxafm
gYu4QOZmDvXLWaRbJf42SPlUrDXRGImXZ3H8tERZ90QmAhbwrPRkh3UjM+j6iIqW
L665UW2qRZgSP5hiqYxxkEhHqcOl1uyByKbAVd/U8EnQ2ujESt9EjALUPt6W4uKM
s2K4Y1kdH8I5TjOXQYX6eAe5gyNOfNer/ofT2oD1cE8pWblUDeD560Bnx6FuX3yH
7baIzSf4U7o9jevxT0yWDxjs/xGgpyvbwsX3s9YvgL93PhrZcjBJS73XyF1uK+wC
gj8mVFnPK0xyrcicW70EM6ekPAhYosu6DbgWsMmoA1II9Fhl85/BsbHRVppRAU+6
tMtyV36egNfTdiDdKzqew0Utqk6ZwE/XbFBI+PiC5TAH5RF0az+/PU9MhV/QSfCv
jC6EF0Vk7bTUNMzi1BmtwXOC622Nwy4jYnmGsmgBbybx1vDoL7m9rC68CMDOveZK
7Ex81/ACCtVwU9cPeN0bTqvsVRtw4r2ZDKf2soEsBnsQFgwVwCko2gMQOOCGyu3v
W6tE48fc57mKo1GnISrdQzYd4aYVD55kHqmy5k5+XupBUOOw2MFbDRWISnkTvOEV
rghMlsz9IBhb7e0xSVwD+dGE6lLjttrVrOq9nEH7J6+IhpsQeP8=
=jIRE
-----END PGP SIGNATURE-----

--qVILmR+AH3mk1ntg--
