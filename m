Return-Path: <linux-kbuild+bounces-3191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C7795DB0E
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 05:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 566AF1F22B87
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 03:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4FAA282F1;
	Sat, 24 Aug 2024 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q2IGU5xm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QsD2XwtC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B1A26AFB;
	Sat, 24 Aug 2024 03:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724470706; cv=fail; b=pTddtuMGF95ag+JZgwkwwYzI/BLVw4F43IW0urun29wFsjD7D2RgJLuICJCaSR/voKF7Cpinmt+mdYZQ/yjrInK3Q0eEk/W1gzcztZ4Tn4+kE1A8FA8c3M73Q/WoG0Lc61yPGalDneXWzsGJPLRXK3Go2PYfz3CKt0GaUKJjGXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724470706; c=relaxed/simple;
	bh=33y95mB/DzsE4xb4hj9GK+8VGJdU9OMMqIrTdY70R+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P2cE5WOV8MzjCV3tWreWM3NdSshwu5e3gsgKML6Wce+yjOAd9d7/WWmCPbGNcQhnCiQLwxoFzIlrp94SK1Ajp0gfawazplnLwyZWaRLqBU3JQ2KJ7Zd2xjytqIhZQU8aBHATbWPyaawyMrc2YE/tEgyAe58Hom2sSOZGacv81z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q2IGU5xm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QsD2XwtC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47O3SKtt014477;
	Sat, 24 Aug 2024 03:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=B8kwHHRUqQRpzk0HAeWFGSJ2cyutYZ8YBNXT5RK7ntY=; b=
	Q2IGU5xmYjWu0exQ4Duo8fgTBg2/haCHY/0TgAobp3Iz15NFiuJzACALqNOGA7PY
	RQABqujlE7sEljzkr/OdvEKGbNalJjPFAIM1pESOp/d6VDkaZLRFqnhaGK2IWQIq
	JtAsioLzx6YKKJym1MgRPNOIaypykOO5ja2s3VZhy9IaJqf9XWSwNcB//g95MhnR
	XL9i5r5na63sRprOtBS+/NHsjYgQ+rSavGEEnzI0gyGdeB5B620VynjIoHI3sDJ5
	pMtymuYmS1XA17Hv3gIAOksDItn+z3dx50w3+r328c3s2WMs6Jq2X92VHDQePsvK
	Tz1AeqlCViwgkvlKHWryWw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177n4007c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47O2H0IH027642;
	Sat, 24 Aug 2024 03:38:16 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4176kgh9r2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWr6Fz6DXTJeCjARrDU8o6VXCrE9AZLEId4gL44A4PbFXuMDAdfXn1m4UHmo/4M5oDq6TUyghoTTC4XAFwzgOk50q0xMez6e/RYAVSy4D4kNSSedtsC6jaqb8YLBiKqe8IXQ+ECI6g0hZs7fnvrIJoOnymCkPXdbcLNlH+80pfNTeNaGvBuxDEGFb9k7Oa9Wi+/EecxlL8Pu/TBAlFyuQSCfVJZNczb4Bxelxub6h6TncYlBflvGrFa00qkEP/etWPVszXCMn0O/ujQe+X1niKB8EXxA+sb4y7i90m3D5cs7b1LsPq0f2GYcmii5pjCRo5miOx2qPtAdKY7HVxi7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8kwHHRUqQRpzk0HAeWFGSJ2cyutYZ8YBNXT5RK7ntY=;
 b=tMRZoocUDxmGYj9BhH0YLEyZn2Z+MhpywJcLbAOjEZt9rieovXhEWE5nqoW+So5p2Mi6ExATVad3hrqQ8zT/iC/ark6aXM5v1GTplVdGynmgNwx0d35sj/KCkw5cFgZl0wt3oVF5A4RpZUhIokwNSExTlvQ2UyknLlLrzfY7yvpJgo0uOZ1mL7awEhTtoQdZgaOhr4AvUrOZOvZKshKPth7gpy9fsrcLHU6k4fFhmL/xHgC1Sz0Z3QY0OBFiCOSwu+HW4x7Jxo8F3EdM8IgRdxTObV6/Je5zrwqqDQJNCd55OTEFJZhMdBkRIOPtNdWs2Z+ShiaEk6UNuYDe5vHzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8kwHHRUqQRpzk0HAeWFGSJ2cyutYZ8YBNXT5RK7ntY=;
 b=QsD2XwtCjly40dSD9rfqcIX8SarpNh5ZTo+c1re2qG1Lsfmvf8xwAp6OOB67+CoGpZG9SpizS7rnuaH+MdRagqVbgfjWsvATDbYzkgynMVwkERMepQdeu81bL6jr93yn97On1ghekkgeYPj521KzksFEv9wf10k8Wwx/ps2Q/PU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5171.namprd10.prod.outlook.com (2603:10b6:208:325::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Sat, 24 Aug
 2024 03:38:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.011; Sat, 24 Aug 2024
 03:38:13 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v9 1/4] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Fri, 23 Aug 2024 23:37:54 -0400
Message-ID: <20240824033757.52005-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240824033757.52005-1-kris.van.hees@oracle.com>
References: <20240824033757.52005-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: c194b853-dd4c-4817-3b02-08dcc3ee2edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WBBCsZ3+UImjidoFPjUzihy8tUSNidIZxfvjzs5EkaI0A8C1ZHvZ4XKsJ96T?=
 =?us-ascii?Q?CZ8dz5SNouHukX8332MWWY/NLzAWN/fHkkbDrErqz+M6y4CESjerTCjC/wsY?=
 =?us-ascii?Q?wdgUC2l0uZz5nAZbKIJdq5gWC7WmBmPMGwEy0IFQ745dZ6cNgjym2QWkxB7I?=
 =?us-ascii?Q?SOOIFKGOiODJJi1FHiU8u8meEgwY+6zr5Ai7q2IjGJq9CNN9F/WQk1A/IxjB?=
 =?us-ascii?Q?15I+TkAUotlw+j4+LrxWun4jtTS1iBLOpJQYLitM1UGWdiBYr3TG1aDmomm8?=
 =?us-ascii?Q?/8NUyW2bWBXksYTpWG9QYAFJ1VCG0/4KDPs94x6NBCnu4hL2zyP1DudpGkrF?=
 =?us-ascii?Q?JbgdwbrchxVN2LInxyaMe4T/0u3yWoymkd8Bj3gUSM3Lz6qgm8LOBT3wid7Y?=
 =?us-ascii?Q?kiJpwoCrE4SDLE7/xQypUVH3UffbGNbMZT08KAOT+UksEHnKU+gkBaJf5u+c?=
 =?us-ascii?Q?zLO2U3UCk/1dOyiaqTjWNuF5+4xtcxLS1Lwz9f8Yfk2GP2HOBSTLQj65BRsI?=
 =?us-ascii?Q?KSeJCFhtSjrxR/IIWtmh2sxTo3v9ixIXiRsrt8XeckHE+chr2hcJIYDJo0AB?=
 =?us-ascii?Q?8k/Wd9JXuhsSIaVNIvnX6jgAW0cqt7HlyJ3b+m0RmL3dqrGz6ctRs9fmkuv1?=
 =?us-ascii?Q?RDwg8qbbO9NqfZVS1+zbt+1jYeKu41JBPwpCAH8KUSe0HdPcOWR6FGpvSEvr?=
 =?us-ascii?Q?3HpZhJz4CBrAc3IC78n2i1XpFHr1aUWhLnkeH4Vo8QWMbxe6pROjYu4CwagF?=
 =?us-ascii?Q?XVtsMera13uFhvvMdxkZnoDqTpNg/788LKl4cNp69cyR0uObP5FH0SljFbJL?=
 =?us-ascii?Q?ODS0gZdYId9aNFyzna4B2f0FuXeVef2u97Kdl+xLHQ7nWVEWGaIWo+9Pakbx?=
 =?us-ascii?Q?L3xLoWxwWqLld5omgmlD3YDG4INm/6MXubOYa33SSZ+DuiLUkqyMhmt5WkDM?=
 =?us-ascii?Q?dXnIGn/m+3wGSd2MG4p5zEjyjOdmZ3Ir7AgmzSnNIV8t+tYvA7CQamtbLKJc?=
 =?us-ascii?Q?mPMXaTxt1mDH1Q211MNmMmOtPO6GMIVyu8sQi1AH7vXcsV2lo+8bm7uhD3Yc?=
 =?us-ascii?Q?+oADCDPC6NFpN9rAwQ5mbg5ByZ/CeQI/bm+sz4xGpESrCGXxmWHKmyNqdJmn?=
 =?us-ascii?Q?7mQFUUL5zOcdDEWYJaqSc2Y9MILgWl69vf1LuCGz4QgJiPY0Seh2Kikp093x?=
 =?us-ascii?Q?aFuAebbns9bN+NRE7g7reZn7EPteyyxRzsCAvn+UHsgXQs2vBMVgG2HlZ+X+?=
 =?us-ascii?Q?9vaI3hL9u0vYzJ9zkw5TgsaigNgrLf9md4rjZJnNUa/pSqRFBg3YEipwOeKv?=
 =?us-ascii?Q?7iCkYs0YdL+Xo5LwWzn9zopvMw+IZ5BnwFedl/pAUq+PPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pc0PVTOYfFvWYZ+sYoJJa7RKEw/Jj3kaEIiHxtna4y9N+R3ddC+tYzptzw7/?=
 =?us-ascii?Q?I3Lxgo0vAzf4XFYYf1veq2qusM3H1Y7iHphwAjov42sNSILuBZf5urw2HymT?=
 =?us-ascii?Q?bQlflCkHo6ZttQYlib3PmFwQjrK2ZPzLnpMA4wvXnl8ZIvMIE8Fx3kSzIiZf?=
 =?us-ascii?Q?kbQ73eFXI6fV6Y0o+uFSAe8QROiqhDBrzH3bJFAXfPQkCnUPBb7z40NRIcG2?=
 =?us-ascii?Q?jG39lmym5iDE9OvuGUw6oTD+6BcKlnq8FgXWqUj3UWttGgF1UtW+/mWUSwRN?=
 =?us-ascii?Q?XUy5k8RzE8wmCHlk1b0NnpM2UVWF6odqo/vLu9Hc04+KOiv5vyZvBHktAaMd?=
 =?us-ascii?Q?yFCSaihuRQJFw2UvSqzzjr4eH5vQyHnzLkRQ4UJspO/izqdhEO875o/A8xzO?=
 =?us-ascii?Q?F3MN4/uvOWG9WJ3icm2Kpf0VllpJX5ndqEZVCsyQJDzPa6zqlH5N1gyS6EO6?=
 =?us-ascii?Q?7saC7KaOxetwJjki7QPhfZmDe94wsiJjwuU1NaupYknXIHpcdEcnoV+whgjF?=
 =?us-ascii?Q?uG6aQZyrETVAka/UwsJ2IQvs6y9pUZaKCHuH5xTk3kurDD6y+yRB7bvxtfe8?=
 =?us-ascii?Q?TqNzqMnKsHMwZvXBw6KtIOrTtsfH8M5FH1P9v+mP8ICVvEBa2BMM1JcXSB8Y?=
 =?us-ascii?Q?OqTOjJS48XS3RKL/vpyhEO6G5D5IEjI7UkYsNRx439Ld0oTwCxeWS8kW9nbD?=
 =?us-ascii?Q?pw2P9qgGX+jYPtWs3gxTRas3s7+w+jCCIu/4hBBye+M24LauYwSK8ciDF6B6?=
 =?us-ascii?Q?Sn1x9H3JiBfWP3mb3v/CV5gCORBRVPNxckMYSM2OrhLzsBQuczL3RgzXgqKG?=
 =?us-ascii?Q?erD6Au46eKUG2NU6vfDQUmbUdn4P1FuScEWRu3UWTBZ8Nc3JvcDsIMGco7tc?=
 =?us-ascii?Q?7hT4M5XtYLkaZcTrOfd+2ptsGziTNSoJBON+tfEO6as4j8ZTLt9CsXbBed/4?=
 =?us-ascii?Q?cSdqUOYy/2EB+WIwx+n3uoPmzgLuw1BjcNKX0ts+hibyvgFNaUHMh7cWK+l4?=
 =?us-ascii?Q?S/49QCEe6wvnh+V/VmYqZQwS7riae3wXE7DofLQWJp13PLV917FMqRjAdMI2?=
 =?us-ascii?Q?j5eqUouF0wIxFWdPQ0J8hW/GEf1novhQ001ksQrpLOQRgWdbpW00iimin9OR?=
 =?us-ascii?Q?Ib9zKCq7CWIG/2wLfGV0E52F5wZpxaA9e7slzqtRcWZLQ6+KwbN4NAmoAmKl?=
 =?us-ascii?Q?YWx5PlYJ4kfhXmcyJ2E43bznSe00k6TtfB41QE4KxzD73DIFLa0z+gkXVjY6?=
 =?us-ascii?Q?Q8026DgJ2zh7OKcghYy1SSvaBPS9B54KN5WJ4yJWL0xBACmjPqAoNZRl7lO5?=
 =?us-ascii?Q?i4c3vdJHWHe1E9tFfOxeZQX1gfKSJVDbypjmstt499+f9/JMi2dBGSpT1aMm?=
 =?us-ascii?Q?m6YgL6fAOzhUsv1k9kL/QaTsioAI+HzSeR+64Swrn+Em+NtVqmCE5zmOkcuk?=
 =?us-ascii?Q?ajpsU7RL/ov9vevzthSvEd6wQGKmuF9xRD3bkv9Gtdle8jWdBZk10hhnaSRO?=
 =?us-ascii?Q?qH61xrVHhmT858WxMSGXx3ZqkiNcdWa3WDr/grJKl2WyKrnCJ/CbWTwg5FgU?=
 =?us-ascii?Q?r45HmqeP33k8YyBzZsN0QbeQzq02EGxN2skmNMfUJNxOafcwwIYw6232754Z?=
 =?us-ascii?Q?k6H300dGR7uG/mdmxF/IXes=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rkm/TfuhTffsn4I9TYK87gtR2rXCOy1v43kAnYyIDjvdIDf8mJFLduE7WKho1vQwF1/DBnHXD96p++4kdrDay2/cn3EOkHXTwjBDIAPqEEtQeMCsQuHgimrFMMYjksnPfpwurt65jUZcf65EdYh4CrQXpTG4ul8a5B6+gYM57JR5q38vZQCCD0bXheghjDe90wK0Ys6g1BQMwjiZrvZIs0bssMo9z2Dui3uO6EJD/KpM+BNhFogr4yVIt9PscRaYrodgcaaZe1FUSclsELHa/dYs1TwlnupmmTHOHMFCx/bvbLS3Y+fIZc26YDmQVdIoi/LZRekUms4IJpeHeXidAN+tNtK4FSI+ucKmiMUyvenky5Tv9cMxDvgO72cEt9MHe81cWVG0TzMjU+LHKtErYOjWxf4kDa1vAoPfHdHRjy/ba+UHOMH3/eUkYylV7QDJ07i4jU8Hj2lQwHj9o2sqCUYn4z+vTAhhqWambuPPvCzJj93dsobv359sLBA7uFOU8OAj4rO8nxGFwxuAzFSBE4Ov5dWCqun+bzfALShBvbiIaMYAxueMjm718PNUtvVoW1HYAol6J8chsZSstGLE4oHPdaS0OU57hNAcenFGXDQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c194b853-dd4c-4817-3b02-08dcc3ee2edb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 03:38:13.6178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOEB27nKrNmEYkewGRT9jLcTAJJY/Q26VHhVN9uI4Pa+zOYfetdg1RWLF7clCs5bfh+nOeQTw4SNglFjdUpi1eOERpnKjKHFd1vUTLXezDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_02,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408240019
X-Proofpoint-GUID: 7B55O_YvCxQkv24RFs6qwSyDuLvHKsxC
X-Proofpoint-ORIG-GUID: 7B55O_YvCxQkv24RFs6qwSyDuLvHKsxC

In order to create the file at build time, modules.builtin.ranges, that
contains the range of addresses for all built-in modules, there needs to
be a way to identify what code is compiled into modules.

To identify what code is compiled into modules during a kernel build,
one can look for the presence of the -DKBUILD_MODFILE and -DKBUILD_MODNAME
options in the compile command lines.  A simple grep in .*.cmd files for
those options is sufficient for this.

Unfortunately, these options are only passed when compiling C source files.
Various modules also include objects built from assembler source, and these
options are not passed in that case.

Adding $(modfile_flags) to modkern_aflags (similar to modkern_cflags), and
adding $(modname_flags) to a_flags (similar to c_flags) makes it possible
to identify which objects are compiled into modules for both C and
assembler source files.  While KBUILD_MODFILE is sufficient to generate
the modules ranges data, KBUILD_MODNAME is passed as well for consistency
with the C source code case.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
    Changes since v8:
     - Fixed typos.
     - Explained KBUILD_MODNAME being added for consistency.
---
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index fe3668dc4954..170f462537a8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -238,7 +238,7 @@ modkern_rustflags =                                              \
 
 modkern_aflags = $(if $(part-of-module),				\
 			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
-			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
+			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfile_flags))
 
 c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 -include $(srctree)/include/linux/compiler_types.h       \
@@ -248,7 +248,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
 
 a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
-		 $(_a_flags) $(modkern_aflags)
+		 $(_a_flags) $(modkern_aflags) $(modname_flags)
 
 cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
 		 $(_cpp_flags)
-- 
2.45.2


