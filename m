Return-Path: <linux-kbuild+bounces-3316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC596896D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE8E1C21A2A
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 14:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4CC210186;
	Mon,  2 Sep 2024 14:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KGJgZwAv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XqNX+/Fi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D0D19E992;
	Mon,  2 Sep 2024 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286006; cv=fail; b=b55fsM+rgUnSlqsI//XcHDLk6JvqFm/u9KLbHHmMnp2dnnwBb15jk8cJZf66mhzHZ//EyRsfjEbyf1308nuZyD4RQQfTuSnNMaq5Ut+Zs5tzKbm+QlZ4EEXIL4Fgs3DmBB/npwINmqKmL/OLkBBlTceGtfk+tWms+SzQtToEZxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286006; c=relaxed/simple;
	bh=7OoUV9w4BWDIUNTmbS8RfyjXmedGMe4QtGxsbO3UBQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KOdwLGweDnmmenyBmQioWQ3bZcEIFv0JFifHiRTwXRmeZdf/4r2s6zWOsr951Sh6hk7KXvbDYSwWn7vrsqlAjdXizASweAOw3G1LkAHl+5MVxTsqKRQzI/ZJu4ng7CvL1yQX9n+OSaUm/n35V/HAZUKaoKfDM0GjhxgKioGjcJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KGJgZwAv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XqNX+/Fi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 482DhEQl014238;
	Mon, 2 Sep 2024 14:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=zxirni2OyqutSj6
	6R+UXz2H4XNCn82jxr6pbUYSb1yI=; b=KGJgZwAv+EFneZ9ccLTXR39aighFPtb
	PRckShCI0amUvtcOiSHN9Y2f8iUbEZMtSUV3S1cZrFLB83nzoeq1O0xJiUVJ/L56
	TRtRMDJbDUovGVvOfGaLNPjjUhuDGYSgu/cQuwYj7Pc/W9S4ciCfyZ+hoLigJUHI
	xi0CuYK4SrgJT7AtW3hUwINnFvxP9KV5lmmFrqebWceBORrExT7m0lLHlL0JqX9g
	v5aghpMQaxtt7lOxQ23GVVo+1a+GYGwRdKEEK7SZqx4q04xyHNGsaCwxesW4tZyL
	BIMJR7ZdSnmRuqlfbBn8UiJYE1aLSDyk5HE7+g4t2+jlQM38cRDn+Sw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41deg5g1nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Sep 2024 14:06:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 482Dq3fY016380;
	Mon, 2 Sep 2024 14:06:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41bsmdqt03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 02 Sep 2024 14:06:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3/g64KHU5FQ9MmZW26RZIv50dpPlWZSq/oy907aWyF93xGL+sAQhfBw1YXyUPcEd1sheFQnbxsbI/WsKMg2NFMdRFZF/EUPQEwzDRPwaQcRP2vG2WduNCkKcRBBQcahD7uuTKbGuwGv8DbRnJcUIM+qPRixFU47Ue5zmIxKei0W9EchBgLhOaObaWttEP1qmTwrNi3Adsw56PgtcLinI1eGvQ3nOgEu9azxziyzK+5dYmOCk1Mi6PsIDYbqWhQ/PymwzdSyyxR8hAFLAA9Lo7yUVq3HJx2hIGdNiNc8k5VEsxwNw2sk251TZ7K5xyy0LVH4aybqx+V/eUzi/KpUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxirni2OyqutSj66R+UXz2H4XNCn82jxr6pbUYSb1yI=;
 b=OfI2MOZDhVwYlVhGfzRv16rcLVsJlHQ7wg3p6gnVJjXXUawcTDbiF7pq8FewXtmOmT9BLRD3mzGU/HRmUOP+Dtlc1wQeMguHKXCTtn5fdHc5/31UlmXnsG8yJNNHlvNd4+J9HNNiCLv7yyKRtnUpfF2ZFBtuJqRSzo4BjAVSFXt7HbwYI28909N/tF8n0h2suYWXaxFOE+x6fOO7f50LgpBKr2v8Z/SNaf1xZDAHxATKi3RYy5PwWBhY5FDjcjJcvUXjf4C61vEwWx7rsmtmz0BDNfRjbEf2vjdblSO7FotfOIgkxNI3jKiub4mcbrufIxgYLcLMJvZcf0Fl6L2R6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxirni2OyqutSj66R+UXz2H4XNCn82jxr6pbUYSb1yI=;
 b=XqNX+/Fi19l9jfC2ooSIu3md6n5SBUQt1L2P4qZ4jtmAXsp+CP1ibSXKZSwHDWf+fFGRBJID5Vg3veX10qaoQdKoxNounRHU8ar6iA6tvAu8eZivoC8Tjm+QOOHOmr59yzMShyQb5eEELZH0Ws9L1D9EPZlKro2uJ5iI1XnwlGo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4445.namprd10.prod.outlook.com (2603:10b6:a03:2ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 14:06:31 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.020; Mon, 2 Sep 2024
 14:06:30 +0000
Date: Mon, 2 Sep 2024 10:06:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v9 2/4] kbuild: generate offset range data for builtin
 modules
Message-ID: <ZtXGYoexkGO7AwbA@oracle.com>
References: <20240824033757.52005-1-kris.van.hees@oracle.com>
 <20240824033757.52005-3-kris.van.hees@oracle.com>
 <CAK7LNASKaCcmyTJPV+PhNyNu2ogFMU4OzgM0UncLRSoZa64ejA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASKaCcmyTJPV+PhNyNu2ogFMU4OzgM0UncLRSoZa64ejA@mail.gmail.com>
X-ClientProxiedBy: BL0PR1501CA0021.namprd15.prod.outlook.com
 (2603:10b6:207:17::34) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: 73e51668-6f04-430c-3004-08dccb587150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cc9sj8mfiT+Kp0YgfKdqypaI7w24CzHyL9LoxtqPqUWq9oBQeks7082rCvJa?=
 =?us-ascii?Q?s5uGeMaPrq+xuHAX3swVZzkJTJ9p8yKTDkmF4+i6ZwvgPqcuwcYlUDmoeyFb?=
 =?us-ascii?Q?ImhwlEgfiii/dDOxJx1x/s8mjVszu5m+Qwn6J2HPg/UH5eYJ0lcAkJA0hEEr?=
 =?us-ascii?Q?15ggKpaM6k2MwvL/u0QyNdU9psm2t/c6XXwqHaYf9BYWRFwW+IF58BQ2ur2M?=
 =?us-ascii?Q?lQLYtohCnRKlYnxKSqqgBWpg6B2McKfb/EJZdXIOTiHpkD/OuqcOrhFBS67+?=
 =?us-ascii?Q?X0tepKpczAzYvfuiBsJ6AQn+5d+7aI3bRzo5NXfAvyZ1q/5K95M12RIda2C9?=
 =?us-ascii?Q?lZT4QX1sNglZ/O1dvHXHPtpiiZ4pSYlY/aP7g2nYryK4uOKF2vxkXFwtB+E7?=
 =?us-ascii?Q?T3UeaP0QULn3HywxRljJ+9h29c87KYMQAEqUSXAfVxn+EKAwebJz6DUz33vl?=
 =?us-ascii?Q?hT0gmKInUanoEdsKmeksQ40e9CZWbIdfW7X6gJRf5rBYbBXTSu5yzNyHA3Sb?=
 =?us-ascii?Q?YaNZh/8ZYvXy04l+q3u6U78GwHv/HW38jQk24MD/LWjGw7rqeTq+SKlre44F?=
 =?us-ascii?Q?RWpvU88o/16iysird1OgapueyoQ6lUx2Vcus1pEjV1g7Q0tbm/kj/xHACGhw?=
 =?us-ascii?Q?4mqj8DxbaorUGY77VNw0BQ+Lh3rpQww5J2RSO7KX0T/OFYeeZcAYqy35uRJ3?=
 =?us-ascii?Q?Rb11dlTxEFvwoLAxbd1/5N2Qif2dqDDWxgJ+3EQGtiuvzIrkDaxnVRjLoh7K?=
 =?us-ascii?Q?oSf+QdGTr4zUYjRutvgp7JF4+LSNzFV6TJ4QRdU0ghexPRCYZkNPrQEjHxX2?=
 =?us-ascii?Q?F+4EHP0lb3M6Yzo8zB29VrmgMerjPwMOJVEVBD50mWXSIs8/FHUsfr1uplGA?=
 =?us-ascii?Q?aBZEwy13LW+PTo8nofs6BvYNnAsA116puybnBX/VsgpUkHxgcN1sO6H7D+JB?=
 =?us-ascii?Q?XD8Qh6r6grQ+BbZBJZ8UsgxMcbLL9E+uhWOBlp8eiPzWbNutjT4N4FdcaMVl?=
 =?us-ascii?Q?MFx69g/+HrJUPUu7ME4a/6aihORzPbbtiTsMFRMV/7Q5C7Z7WhqnNoZxWbsm?=
 =?us-ascii?Q?iIPVeoc4pS+g904H7IvpXJuA7RR3Jeq6/fPO7EYoQyhzcSNb4Bth90782VJP?=
 =?us-ascii?Q?j8p4FzLTyDlFnojIhxlFGxBEHe3KFOtfu/CVpMAGf4gJw+UPPRHStBHKbdQ5?=
 =?us-ascii?Q?lCV5VeWDZAs2nqdufQ6LSvmt5pkf6EZFY1eLuglvYzaMACJ/oRK0rHyfw7Qe?=
 =?us-ascii?Q?YAO9SYIVq7d2ScnvhOQNSsrkgFoUzz1g28xeTsFbToOQlviOSzVU/hJEqlIE?=
 =?us-ascii?Q?S7VQXoEJJzXXmj7TPDbibYZuRA8Rq95GSOj8DbwyHQk+jg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UIqQjFJaXFnVRtK33DYBKHVUXATbwA+PagF/KCgtoGC5dOgat5RQ8ceTjeT+?=
 =?us-ascii?Q?2qVfKDK+ICVT9nNsX0Msag57+5dQfJClCtM2bt+9Ia/smqfp2bT0CthTIYkH?=
 =?us-ascii?Q?hHkSdUjM8qVXejYyxhmTTiiuSCXfQu4HqbxWrH7pOHW2/96URXiNGujTTrOA?=
 =?us-ascii?Q?k/ExUTFDiar7FCjAlcte40gC6/1PWirTQUdNT0lu/U1JT3YhPpZWLAAPWnq/?=
 =?us-ascii?Q?d6qMVYQH58j4nNnkmMKrPs32f+Ty3x7Alg+lHy0GJuvZbGwNYzTeRon0HNjP?=
 =?us-ascii?Q?PmG/mHFMOccsuXec/AxUC2Hh7tf0DB2d8zkS6fJn6R+3Th9U9P6ir/EZO4QA?=
 =?us-ascii?Q?LKkPfJds7OqecBcew9QNSg2zFfWRyeUNbSkcOkqcD8gmtdmEMwOZ4LmP9B0I?=
 =?us-ascii?Q?PV88urqqUGqItfXTQdi/VcJ14B8I0ypQgUZkFe7ncIXFdOLWauscCnfC804G?=
 =?us-ascii?Q?n+8bALDcv0DeAIW86BhdVlNl0gxH1z8aKP4QicqRSr/MvR7MLB7itrnPn6f1?=
 =?us-ascii?Q?9yz99GTEYD9LvR4U3Plw7ov5fZk7LFl9hTRxUTjcbJjg/vTDC4jeszyARrMi?=
 =?us-ascii?Q?pwEw3+S+uxCW1OLzfCmFZiLX8ATw6wqN5tKpffcYkk8zwmAEZgITA9wf1TuE?=
 =?us-ascii?Q?OKpM62NQrIWPCGheOFV1i5BZluvl2wi3MXatIHPj3yoTveLoRvUDhP5fHWur?=
 =?us-ascii?Q?8LzvxQKRugXq/zZn+I31hlKDJbEd4+/Bgww+Yy7PVpz1BCNjszxNuI0UkK5M?=
 =?us-ascii?Q?VJBHp+IOsN7AKljQlvaeWKTGjpaNLGTshMQiMaPzsHzmquIOv9kIvMmsDFPj?=
 =?us-ascii?Q?8DGCID86Ti7PxQfa0xquWKWgolY45aTidBtqaY+CZT4VxIfggAOFBroXayTt?=
 =?us-ascii?Q?7t4K45/uBxvRaG8zaggo/PyaJS/zSnRet3eoOBuFT10Gh2wvnsGm6HALBW66?=
 =?us-ascii?Q?yR79Y4cOFr59ko5NA2bOBtKbIi5kw9VMvn5F4B8MxKxSn3PhLwyxwkMF+TCb?=
 =?us-ascii?Q?BAAA7QpIM2Sbhec1qvwiLP6B1lobwyaHRyrY/tzxuqVVg1jWRg1qJnQBXxqc?=
 =?us-ascii?Q?AixPUaS1A5m5teRHELBuU1FQSLg8buZwdQdxQZBCtejVFF1Awcv7efCwIN1l?=
 =?us-ascii?Q?oQNZuowJ4MDJmPPDfmsyWx+NoPX8bbu9stgLJJ2iBxmjzbhFL7rqTOZ0qRol?=
 =?us-ascii?Q?T+XmytfkMbWtreYjR4pMKMfYJw23/5mgpi0T6GIc7SjTNljMb67TSd94dTuN?=
 =?us-ascii?Q?R02m8ETTeABifB4I9K8F5cHq2kuLvyPLHW3f3M8LUM18fuOcfPaeYLTp/vac?=
 =?us-ascii?Q?XoJyrT0UvVa9bE2A+bd12tyY51sNyk/KHzTJPXoaU4cpPx4QET0grUJXzsFA?=
 =?us-ascii?Q?dEQP7Sxo/P+CvFol66WwYw/nR2tLxKl2FlmBlOyQUuxR1CXnUz/O6hUz9KCn?=
 =?us-ascii?Q?AUI7MFRaufBOkYDjDUOBbEK2XXS+P9Tld+UfsSdTASIHeg+ZZmadjBu1UwHs?=
 =?us-ascii?Q?122OHJXhTdgHF8X0Oj3XcBRB8V1b7Vs1wG7qHz/Qadk3Fn8EH5zKZCvLGHUy?=
 =?us-ascii?Q?Og6D+tVBfod07/tg0N6N9jgkvCoCK0RUbbaSXeSv+UVU8lRYBwAV+a2T08AF?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VVLFiPoa6j6eRVDW7frwzoDqse7XWvnuhVo7Y97XDXkBRc2ABlsuCHSYC/ygOJyG9H8cbpU5mp0LWcRheV6C/q+8Fc3sX12gmjWG1jgvqmmB4EmRdgkNkNU89VI7xy3uoWG0BynAWBXavKpWpMMhPrvcLxPG6rMb6ZRkyzKUobu+0txSvXTFkSdkccdlOXgh3W4BASbVVTImPgueCnF9TjMj4GtSdZIdPdc0N/EIjFRwXuxBQPJZKclvRUTtw1KzdosDSdH7qjfLBmhDdGv5uBr1DKnRxIOkzBc2rBhewMHvt349a5rRnqd4gSZYmaBk61670OWHKJ83j8RIJ7hyGU9vgPQMbY9ATCpTjaJbgWbHO72TFRgmQQVhZBc3P9sEVxGGW+0rOUaDKnB3QBgrmT5h9mC4qJWdIfhLCLLLrv8ysdv/asEYUJuVup7yX62n3U2cJULOJTP/efJdklsA8h+M9xdo9TvOfAqDyAkXVw0CCXdf0H1RZs2igConrznMh9AFx2mMtkrJ7ksDs6Y9T33bxDGeeeWK220W7dsQpasf5AW7j/QvcQGjZ0p1tPYwsj/e/cn37vrwhUUq09j4fZupFFAKQgkZ04YaXzK1+/0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e51668-6f04-430c-3004-08dccb587150
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 14:06:29.9840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrhsI/TzifV8OduNAgRRErDoTA5uaEtz2c6ATM1dDhx51RasxttBwaoJIzVyF+t35w5zQndlUsRoHsxXNGT295DabV1iZk9TmMrCtUlHkeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4445
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-02_04,2024-09-02_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2409020112
X-Proofpoint-ORIG-GUID: 2oza22HZnxxnBoOUO8v_M-HKNharK0Sd
X-Proofpoint-GUID: 2oza22HZnxxnBoOUO8v_M-HKNharK0Sd

On Mon, Sep 02, 2024 at 04:26:48PM +0900, Masahiro Yamada wrote:
> On Sat, Aug 24, 2024 at 12:38???PM Kris Van Hees <kris.van.hees@oracle.com> wrote:
> >
> > Create file module.builtin.ranges that can be used to find where
> > built-in modules are located by their addresses. This will be useful for
> > tracing tools to find what functions are for various built-in modules.
> >
> > The offset range data for builtin modules is generated using:
> >  - modules.builtin: associates object files with module names
> >  - vmlinux.map: provides load order of sections and offset of first member
> >     per section
> >  - vmlinux.o.map: provides offset of object file content per section
> >  - .*.cmd: build cmd file with KBUILD_MODFILE
> >
> > The generated data will look like:
> >
> > .text 00000000-00000000 = _text
> > .text 0000baf0-0000cb10 amd_uncore
> > .text 0009bd10-0009c8e0 iosf_mbi
> > ...
> > .text 00b9f080-00ba011a intel_skl_int3472_discrete
> > .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_tps68470
> > .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> > ...
> > .data 00000000-00000000 = _sdata
> > .data 0000f020-0000f680 amd_uncore
> >
> > For each ELF section, it lists the offset of the first symbol.  This can
> > be used to determine the base address of the section at runtime.
> >
> > Next, it lists (in strict ascending order) offset ranges in that section
> > that cover the symbols of one or more builtin modules.  Multiple ranges
> > can apply to a single module, and ranges can be shared between modules.
> >
> > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range data
> > is generated for kernel modules that are built into the kernel image.
> >
> > How it works:
> >
> >  1. The modules.builtin file is parsed to obtain a list of built-in
> >     module names and their associated object names (the .ko file that
> >     the module would be in if it were a loadable module, hereafter
> >     referred to as <kmodfile>).  This object name can be used to
> >     identify objects in the kernel compile because any C or assembler
> >     code that ends up into a built-in module will have the option
> >     -DKBUILD_MODFILE=<kmodfile> present in its build command, and those
> >     can be found in the .<obj>.cmd file in the kernel build tree.
> >
> >     If an object is part of multiple modules, they will all be listed
> >     in the KBUILD_MODFILE option argument.
> >
> >     This allows us to conclusively determine whether an object in the
> >     kernel build belong to any modules, and which.
> >
> >  2. The vmlinux.map is parsed next to determine the base address of each
> >     top level section so that all addresses into the section can be
> >     turned into offsets.  This makes it possible to handle sections
> >     getting loaded at different addresses at system boot.
> >
> >     We also determine an 'anchor' symbol at the beginning of each
> >     section to make it possible to calculate the true base address of
> >     a section at runtime (i.e. symbol address - symbol offset).
> >
> >     We collect start addresses of sections that are included in the top
> >     level section.  This is used when vmlinux is linked using vmlinux.o,
> >     because in that case, we need to look at the vmlinux.o linker map to
> >     know what object a symbol is found in.
> >
> >     And finally, we process each symbol that is listed in vmlinux.map
> >     (or vmlinux.o.map) based on the following structure:
> >
> >     vmlinux linked from vmlinux.a:
> >
> >       vmlinux.map:
> >         <top level section>
> >           <included section>  -- might be same as top level section)
> >             <object>          -- built-in association known
> >               <symbol>        -- belongs to module(s) object belongs to
> >               ...
> >
> >     vmlinux linked from vmlinux.o:
> >
> >       vmlinux.map:
> >         <top level section>
> >           <included section>  -- might be same as top level section)
> >             vmlinux.o         -- need to use vmlinux.o.map
> >               <symbol>        -- ignored
> >               ...
> >
> >       vmlinux.o.map:
> >         <section>
> >             <object>          -- built-in association known
> >               <symbol>        -- belongs to module(s) object belongs to
> >               ...
> >
> >  3. As sections, objects, and symbols are processed, offset ranges are
> >     constructed in a straight-forward way:
> >
> >       - If the symbol belongs to one or more built-in modules:
> >           - If we were working on the same module(s), extend the range
> >             to include this object
> >           - If we were working on another module(s), close that range,
> >             and start the new one
> >       - If the symbol does not belong to any built-in modules:
> >           - If we were working on a module(s) range, close that range
> >
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > ---
> >     Changes since v8:
> >      - Added support for built-in Rust modules.
> >      - Added optional 4th argument to specify kernel build directory.
> 
> 
> When is the 4th parameter useful?
> 
> The map file knows all object paths.
> 
> The object file and its .*.cmd file exist in the same directory.
> 
> I did not find a use-case where the kdir prefix plays a role.
> 
> Did I miss something?

I added it as an optional parameter in case there is a reason to run the
script manually and the kernel was built using O=<objdir>.

	Kris

