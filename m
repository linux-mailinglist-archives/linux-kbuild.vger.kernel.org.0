Return-Path: <linux-kbuild+bounces-3164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F337295BE27
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 20:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7223285C54
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 18:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1A0E1CFEA7;
	Thu, 22 Aug 2024 18:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TiUcjDAM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fgA7wIdW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD851CF2BC;
	Thu, 22 Aug 2024 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724350866; cv=fail; b=AFEcTmrnCNRmbCmm+au7xXdRnnSIZXXQJa5/vHBMiBDWSfHNYdF5XYn01RiBKkcULYwFGsWkgBaYwiHjsBsQd9/2ofj8Rjbg1d/4knTiYjPm3SJmVDe3HUsBo0SmEXC1/N+SzsCj0Kf92gCj94MoZ0xNufyhfO/D/weOECI5Tjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724350866; c=relaxed/simple;
	bh=cEONTywy9PC2pn0ZQd0GmZMKSqurVf+mxXj7SbHYHng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DSSM8SjN0TZBpU5+S6j6I/sGXLrhKIkQny8FAQ5LBq8eMvxKya3xqD6Tkkl6qucajTR95+5aOghXFzABfpp8nrUdYFXU6m2Hlewn0C7mAel9g4nbIiu1RfhHL44aznkocXjLcyXMrkw/YxspqI0QG5rdKbzuBZHbIRRxL/SbCWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TiUcjDAM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fgA7wIdW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MEQb5x008194;
	Thu, 22 Aug 2024 18:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=; b=
	TiUcjDAMSFs5ShJ++MhEIca0Fn+/LCsmJCxO/4B6s5c/JmTEsgWJ0B5ZO5AFtsWO
	F//6+bC8QtABfRZVgR/sMJb0SQqKDSYJe9nULIbEbFCtBhAd+88Kb1YZdZNmy+bq
	efsmzUJd3MA3KizHKz+dU+PvD8S4GxU1LsPLflZg/8iFfH6Nb4dE5uWCbSbeh05t
	LQQ15ageEWYaU2Sq+GHa7X8Nu/7QsD/kHab85tsi100qa/aVqHEsMkhK5TrJX9XD
	bJk9zcxKfsBIphymI6HSCdtmLYF3GHe+/CyWI2UCq2yHmPv+Opt3GLy5OWyE5BuP
	iVHNjG8gLrJzi0OlXm6zQw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412mdt2rn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:20:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47MIBfgq027517;
	Thu, 22 Aug 2024 18:20:54 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 416947mbg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 18:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm+U2Mes60UzyD4t6d46BcpFYWTdda2rqn/MjGxjKgZNKnQfdVrFtqSkGomxJF3XM0Tl/EvLoSGk655eqy+tijIKx4fWB/yZnCEy4DujcLf/Ti8ox2pmEz6o2GOlK6e9Bscbvt8Nv2jsa2oF1qxtrjWJEl5xww2hIxqeeUkBzmNkZ5vKP2MSJYaTuKIBKSSmfVmH0O3cV17Y61ZiYeCRA0FwqbpDxuxCsoV42BEnyPKRY/W+Lvh+DfNz6RxykhdIBiShFjuY+ojSzYhGAhlJjd5AQQdZk8Ov7uI22A4O5q9uXHmbgkb7EZTBqlpKOGJ2pIembDQ5zl1M4/SFAnLr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=;
 b=Cg+lY2NgpcbFiVK8Iw32LBl4pa9SJ1W5Vfh6d13gaGcDTIm4Z0EfaGf1Go89oRCZD4Fiijmo7ZWRlviYhNah9n/RLms1biN5SDsUDuxAkyTqwl5R3Nwc9UJ4WZlEqAVDrbpEPgWOyWTdsovj3/59HtpiLsRrUS4q+DzdRwrbHp3PP1mjAk3rECOoIlga86VU3Cs2oXfEumIxLrl3FpmYncupmrBBmZIB9Mn34M+R/sys2dWp75x47c5U/8btJJu59Hbxdcd9qWk5XDkpbmtDYpSReACN1IyZt3M8KPK/428+VCSl8IKsRAdqCPLw998LMdfRWimJbj+M6zwTvSV8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=;
 b=fgA7wIdWMVhnK9PqE6qbD9ZCadWuFsXU4Ltrz8z6cIzZKGoeeGSRU7oiIE3gPFdxZcyhIQ/p9T7FVM891LNsuDxXYC/00h1xZwFg+/E4sHWddfoq/OHN3FBIgsU6qeW5cxW+5iEkw2oubV4h1PhNiULKRvwLqe8t29ypWLWD9E8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB5004.namprd10.prod.outlook.com (2603:10b6:610:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 18:19:51 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 22 Aug 2024
 18:19:50 +0000
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
Subject: [PATCH v8 1/4] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Thu, 22 Aug 2024 14:19:38 -0400
Message-ID: <20240822181942.2626536-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822181942.2626536-1-kris.van.hees@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
 <20240822181942.2626536-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB5004:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af56128-1bae-4aa5-dc4c-08dcc2d70189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SQ6IdGemHiMM7fmY6NjTI0tbsmYyMpfHYMSpRfJRYNQ9ih4XaJmU9nKwUWLp?=
 =?us-ascii?Q?28oj0PbBLsp5engZ3u8y3vx6OzjIqJzpWmRyGgEjoZNaH9hXkmYshzYrqLn9?=
 =?us-ascii?Q?jVv2bnIaUGzCG9GZdD38Vprr77eZ7g9PZafCrGF5tKM7nggzFe6Py9mtT5UR?=
 =?us-ascii?Q?DYC2pPkHU7Hfgtcb1lARHwnr4J2e0mTVX1JVh6fZeNGd5Yq2kvrl/8UtJYGX?=
 =?us-ascii?Q?VEO+ooC88l/GtN0GDAsMXROZHmdfZiAOyTbyj51lQ1Q2d6g0LuCCkfpgL74G?=
 =?us-ascii?Q?l1i5Qt3wWfuFEWJnAmXinCudOWo/h6zTqUgvQS5Eo/Fdn5W0YJj9sQ3otrUF?=
 =?us-ascii?Q?6fta9YPY99Uq1SH+QgFbfU1257uAvGJ9iuJv+9lwxDJUbgw+XCnUEyhkYRkJ?=
 =?us-ascii?Q?fkkFylE3yTnVqfFVikvL2vF1KRTKM3GKKrijPuyLTT4CrVhqr897cSGuPrIz?=
 =?us-ascii?Q?mriT3435RmSPgH+sbVCoofWEXnwCa+1XzTSTe5FsU42s/+20TPvm7QXJh5mO?=
 =?us-ascii?Q?U2ZkeXtX8+WmYHiuGF9NagIsfq3MzuF0PeEVeNKmwNyWed5q/V93xLicXNfa?=
 =?us-ascii?Q?uz0uXr4T+wTO2bAxMpr0+SlB0m5nhSpvgO/92enPsvI7kEVxn591TUGCK0NU?=
 =?us-ascii?Q?fvEZh+J3J3KyZ1wsg/3nXB7zylbVfz3ERyG9nH9c8FfPp57g+bjdrbpyEbAD?=
 =?us-ascii?Q?8rY7/l9j+dv6SM8YSlrgotlxmpk8cNBitsDFqQFHaBxC7pHbGjs7duBI2T96?=
 =?us-ascii?Q?T4BYxuEARr0R1I7ltifTaxPmzB42hEqwX4sunVwxLWhu2QI/TNB+rFcZqf5/?=
 =?us-ascii?Q?zpZeRho8sSlkdlYEWMDar9YSh2FOzRfw5w1/sywfVMv+ImAKif47u1hcqbry?=
 =?us-ascii?Q?u1ia0EPy8Iu+XX/EuYcZS72bpGVr1Fld6qKMpLOfsWMPjTywyLFrDAQ4mSPp?=
 =?us-ascii?Q?xg6MigLihEDE8AwRXQwV9NE6PaeNuU8srGz8G24+FpbKidzbWiGK97WQai+w?=
 =?us-ascii?Q?hHyFRX85PywOng3SiHfk06jGnXiD0EmqaHyXh0Si1B5Nv1Rg8usIOH391RAM?=
 =?us-ascii?Q?ljvpKOZ7wCzWTW83G4OvvtTHqbiDgoZe/0i55XKqvskiMoK0zdsIdawkdMCf?=
 =?us-ascii?Q?PeJ2KFiKTFHkMg6frA+oxgwRvXC3DGc09bji/ueFRz8JWX4+FKHBQvB+pU/w?=
 =?us-ascii?Q?Ekh0uUSX0yYDp2yA7FRcpH20XjdVM5xfplgShOCpXO00si9TZsdTQbTX+R50?=
 =?us-ascii?Q?hDAWFDbYpVcapbzs/P7GzdxEcWIWvyid38ZgU0AxVQpHGd8w/nnA2NbNkZHN?=
 =?us-ascii?Q?g6OVBQfDQq4ZlYeq3j/gtKuiF4WehIYgZDwX08OuwBAyQw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dyJYNW/ibhynA0JT/SJ9cg6cPva+cPmL3un2QwFFSgQpeTDH7LSJC7qPLhFO?=
 =?us-ascii?Q?lhRkuoSCnzDHBP2YMwU0mpIuBqxDu9AJTPGuk3fNGiAKRoRUiZaDDhrRlTYo?=
 =?us-ascii?Q?hT7AITASlgzA6oj/ixX5XXiypwAANmUl8BpIQrnmbK1s+xnk4+BhLn1Mg8ml?=
 =?us-ascii?Q?olV6rFCN3F6bxevf6ygtKHyucF54HWRylTX+UcwMEKlOVWJUzZLb2viDTCPq?=
 =?us-ascii?Q?UipfncLrzx0uPYqZEqXpgEZuxW3U25csBUpl5Jm5YMi+VTbgfPUioeD9sNt7?=
 =?us-ascii?Q?W/V+cyyW+pD98MS/s0ZZP9mbalRe2L2bBgKUN8/5UcaJUYTBKg12cdey7A5q?=
 =?us-ascii?Q?cIQVEWzpD8sEcarS4oBBeyoTUmbu9IPojY22k+oO/i9GDLOJ3BCDfPJrWhvH?=
 =?us-ascii?Q?6qx6NuCcf6C9tkIRzhql+l5mTgkNGoyqt56iDNNft6r1KaJRKvj3zc/mwuBt?=
 =?us-ascii?Q?QsOAEN1qh22eR5qU6o1kovFHBrfRMK6GL1K+A4xnj06kiyZlQE+Sq8XgQeXB?=
 =?us-ascii?Q?7aeWa16ULKKFKPm6N0mbiRsZaoW9JQwVpTEvz4AgMR0cz4fQ+GhD9z5OPio3?=
 =?us-ascii?Q?pFj2+g82wsE4bNTNj+xinnb6pMpdp3lF+MdWXN0OeKApWGA6DWn/FSv0RFJx?=
 =?us-ascii?Q?d+7k+KDSy/XU9ZT/uZaiefH6qQnnQYRfz7dXL6oc/yJbZLv0HvcGeHMVwnm6?=
 =?us-ascii?Q?l05r/kT9hW/6M/9oVkmvuM0z5PX8ozoYUd/ljyZePhI6Hnm1F0v6+d4OaePX?=
 =?us-ascii?Q?hmd3jDrsaX0Q1PkBBsgghNenBqHP2EvXFoMcGaKGtcFFkAHlYkDutM80srW2?=
 =?us-ascii?Q?Q39LSZTNo8banPzQLL2CeQTOJ1FRrPEp1dcQ7dr5aFdB4/OGEwoIi5ve67Dz?=
 =?us-ascii?Q?9z48O87O/40FUEEH6wJ7Sa3gOgxL9IgaZdD/0udj0X1Nj2SuM9xsaMVnWZEg?=
 =?us-ascii?Q?91Am9941ugLav3ZXv/TmA4L5YekOTLPrY/20e2BeF/3hYzyi/nSsvrS2dd1H?=
 =?us-ascii?Q?C04YYepx4Eqiug9rSVEXnay1eL2wKC/cDsLwI/kwHgYzOXdQ0i4BACfbFHpx?=
 =?us-ascii?Q?e3s7oFJMKs32+WuD/UL08knx5H39OdhFSCMSWkdRaaCEzKRcoxF78Jf3xBgB?=
 =?us-ascii?Q?Z1o4l4fzPOu1+t8pj7vXsspDwm/a1H1SER3UXozHlKoWPaY6JNVFi3ZVaSU9?=
 =?us-ascii?Q?zRH5jWCPsiDkxknp5WrYAM0OfyPZZW4TX/GdjsjnOSwQ/ihBZEOcEiDDJ87w?=
 =?us-ascii?Q?HkHXj0cMKETGyQsyXTc7819iai7Yg+Ff2BjqbCoKmRz0bo23SI8R01zQeBfW?=
 =?us-ascii?Q?oKBXcISI41MJeFkhHSVgZMU2Tg0zLs+r6L/57HyUx/tyttClWxypFTWc16FB?=
 =?us-ascii?Q?u1C59NOgU3v+X6coLjTiwZu+rYeZFch2vIN0br61UyozQSBmFar5ljagNKPb?=
 =?us-ascii?Q?9v/o6erJPTNQzvSt2LIiTDiNx0Kq1JTtCgXFJeGQMKI9CB22kK8e9QUrJI5O?=
 =?us-ascii?Q?GI/OG+TXElXoTQ2qZlo9gmC1Ci87f1WlEFOHNZVFSS1sISDx0lU7khs4FOb8?=
 =?us-ascii?Q?6Sp23cGLae5n5Ue6L+S1ZeBc22XBFfPPRFAx3qhClYPMcLqwS2dQIhCg8yKt?=
 =?us-ascii?Q?vL7dVqbZJqfxW5EoELSHdWM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BpvyEUo5prBE9dZcrIzF6FoNZ8yHyOWxWdJOSPXU1wFc9hrO6WmxDdKrEh6MpffcregunLWc3Gaj+rjWes3HQuZaSTebBKCbLq341MzpHYOEfUdKiEdlGZaQ7YVyTHr9lVRbmGs3jO3IOsehP4X0OD1ESPMXz5+jHUXfRuY7NyPvnWOfYRwV8E/1jEbCsy6EQZEMPmjpuBS+VLDiCnPkIUtkcgkX4balZcTzU1cwqI7yxuJNPB0lS8grDLPIf25+wvjEvAU9kSIM9DaClnkI2Dz8HgY+l/DlhPGVN/0YRdw+U1UGQpCQYdV/qqY8T8QrtuIRnKD08fS2kdvvkJ0EDJNtV7LRFdN9T53ww0S0iKp7x3zCL+4Efgf9RfNrxO7qK5Sb6xjIzms/t+ISr9+VkCNlSQhRttM1pZsJZh4g8cbQ3GYWCntOneNnRhW7Nry/tvLy3HrBunGixLmxb3FEdvojKtTg7fgYEedbPGz+73c9g4coc4vkt/e/WamQQhHK56rYjy32xRE9JhkjgIfSR0likSwiGq/tfnwb1SsdHBqaoLGJF+9dw8cW7p2NQMOZqfHthZqXxaG7WhgXRJlnid9ElgGHbWg41thi+Xj4eUo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af56128-1bae-4aa5-dc4c-08dcc2d70189
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 18:19:48.0223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/tPuF8z/8lxSUNrsZxxjIhC7QLFxVQUbXAecYsqRoWSV5rBhziIAkAT+8Kfmmhp3flopVDj+A55pPIKyq99h1YOpUJHJtZWzixA+FlScwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5004
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_12,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=908 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408220137
X-Proofpoint-ORIG-GUID: pqDio7yPn2YW08FGxIoeI7f4CTnADzye
X-Proofpoint-GUID: pqDio7yPn2YW08FGxIoeI7f4CTnADzye

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

Adding $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
adding $(modname_flags) to a_flags (similar to c_flags) makes it possible
to identify which objects are compiled into modules for both C and
assembler soure files.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
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


