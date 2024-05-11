Return-Path: <linux-kbuild+bounces-1830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CFC8C348F
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 00:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D611C20FB5
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 22:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BD120B04;
	Sat, 11 May 2024 22:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i+iOiTKw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AOFnULqy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917AA1DDE9;
	Sat, 11 May 2024 22:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715467431; cv=fail; b=OS8BJ0MQ5y3qQqFb4HuiqhoDkjrRjYWltzghUG9jTXObVZo/Apbj71Q4Jycuc9Bfi2iCWJ97qAgEUBaooypWvnGcJvp5btmfNsQROgqpujhPR0a20Mun+X8R0WSpGQNMMvZNwO65zd8puKKPIjzR7YBjRw9fkQndbZ8QB+Ct/Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715467431; c=relaxed/simple;
	bh=2ba3c4KvTWaO3iw1OTRTy+wkumwJAh2PxkieTUp3yt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r9jzEUKO9YNkH31FniMk+IuaSBk0eIlgVry0vKJtAzZsg3wEiSvL1P/g/4iRQzZkeaSQ8nOLmqk4MEv+0D9ejdNd6y0AzAmS/OT4i/JOikY8wLQjRPJc4h58Is5mtBW0iV8/KANPxgmUKVspK1IefWytcuZZj29OsXuqE3kYWto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i+iOiTKw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AOFnULqy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44BMhSob010025;
	Sat, 11 May 2024 22:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=ibUgblhNVWqtyNJINxj7/jQRYmpXLKPpoF2q7wcbtt0=;
 b=i+iOiTKwaiiLP9hwL3h/6e6ZOiwAZH71paJIHFRwDRHAvGKoPpwO2+16WZ9HNVASHM+x
 +BLyd25mQIcUrjN9HPuNswjJ8n+R68PEL8RRdL4IKktfizOLYgKu+q4ruV8MlqArVUCH
 DwkinuDSpcsVH35mVLcuhrLlaC/gPCTKF0Mid6pJAqDNByped/y9dA73Wi4EAXMR+fbz
 LUUhy5DDdtQhSXZaEEHmU8gkUStz4d9SueX3xurjJMWIXv1Ni5bA41nS4CvgIW461FKV
 siFQZliBW587TlOAg0BY3fP2RYbd4ZKYrsZwwM7BysnpFCDtQ+yK/luX29UWajFVAzP+ vA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y2grbg100-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:43:44 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44BHeMOA001707;
	Sat, 11 May 2024 22:43:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y1y44h6t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 May 2024 22:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVoLHzLT0rq8ZwkpZVHTbqGhHhw54hxm25dc7dA02z44cGBl27fANJm8SBbIbzd7Q/3eim0UEvSiYOpuAT0QtihG6WU/7JnCMPfmh2dJtzBIvVQBIjgSrTPzAI4qyCbSahkyPU1VYMXGkizUF9HyxDZEgFMtE5wix4PVVyAAyLspnQiKxQNPjiSk4QF7Pye7bIpvA/2eKAR4ZcOP7BPve6DMpsHWSp99uFgQqtrlIulFdxAnHr6v8r/eYpLT9P8MDm8kpZ1/czy6oRjvkyKd8b1BiHshW77jleH0+iIsVC/nxskt0vSuXN+N8hsoeKzJz5y6a87+YitgHwSGGmc/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibUgblhNVWqtyNJINxj7/jQRYmpXLKPpoF2q7wcbtt0=;
 b=k8W9C2bvUZcS/K3mccUIIXE9Xt4ejkQpjoowLUtoptP49FFrigS1KoMi+3fhjd60SAbSNnR+vbqFpe5miH4IyoIoDAMSj45azTUJgkWw3aD+Y4VEyHd+Yd8DXQamQHzp8danPyIyTn2NqF/NrvlREI89jkTDSSvUHE5ydsNA2W8XieEW5GuHqSE2bGgncc4Qq5yu+OJrZgsv+Jy+oOBc8hOzbOTKHFCRsUWvqg+Hwf55LlWABv5DstkdWDH+BcJSwkssTh7bRhnjCgF6CaJHVdl4pgjDcrK0YYENR+FwX62hCEIyEDJdqxnwnb0UhuSRCprIOFl+O2TO4n9TP8jQnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibUgblhNVWqtyNJINxj7/jQRYmpXLKPpoF2q7wcbtt0=;
 b=AOFnULqyTJIEB8UPfH0+8Y6iCQKc9IwjHSuMzMhkIRfgvwW0YiODslc+6SRSa8pjIqQImtnWK5vME2pS5xQDgnZn+1Mi66Z1+jERy8hNCpgAc1tJZS/VCFZNb5NtXXoBwB8/nel7ZESGOXkPoEEnmenJx3NOMQzPDCucYe70+kk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS7PR10MB5184.namprd10.prod.outlook.com (2603:10b6:5:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Sat, 11 May
 2024 22:43:40 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7544.052; Sat, 11 May 2024
 22:43:40 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v2 4/6] module: script to generate offset ranges for builtin modules
Date: Sat, 11 May 2024 18:40:33 -0400
Message-ID: <20240511224035.27775-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240511224035.27775-1-kris.van.hees@oracle.com>
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0016.namprd21.prod.outlook.com
 (2603:10b6:a03:114::26) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS7PR10MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d728b5b-1d7b-4f66-cfc9-08dc720bcde0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oEDIVcSBT8503or3F2/bFIeATwwqGg1UuudfEB6hRovLvmuKmTRkv3qD0DEf?=
 =?us-ascii?Q?VpH1DDVTVdD8RjNCCCxa7pzLrk+DBd5DaP0B652w7YTf8tdf6i9LB7wXdZxn?=
 =?us-ascii?Q?Fd7TwH26eF+tMdV4SMjeYtJC573lcg0lpsseaS5UkdcDJRd31KfPUL0JDud7?=
 =?us-ascii?Q?CAG7/rvL8+SYX+HXt6LXxujJg5J/OG1o04YOVVj79BvFFRjzmS+eLFqEKsQE?=
 =?us-ascii?Q?cGZPYT7PNL+yPL/L09/lM39xRJz4b7L80fgY6R1BqGxGskJ8MZ8bDYdSFY+a?=
 =?us-ascii?Q?Z37uO16sZHIHz7UspGLXbaN7dwJVbKhYZrwR8WDKaV662+j4nJeh5O9r5hp2?=
 =?us-ascii?Q?6R0ng0cLdEEv3DrrCfuclIfwf9my6vWDKvDovLdxK1MQRdQkZSusCkzph7xD?=
 =?us-ascii?Q?jOidfpBxANOCDX+6Wf8mKBJJu9f0wd3K5gt2E4ywar8YVwHHRs+L+Y6twVOr?=
 =?us-ascii?Q?V53JQ1zAkECUDknAzf4tr+oVn7LjYHw0A8b0cA/Ykm2xlAZn0/spv+HWgMEP?=
 =?us-ascii?Q?vGKkDelZl9PmBaFCn6zPq1lJpPsiLbDq1XpNuQXC0KjakEyX8/LDWQOHsP6/?=
 =?us-ascii?Q?YcutRJg3sIED8bQ474F5Ze5Z9VdQS6FKHDkrNcoJn3HHQIWf9vxdqAm0lTgE?=
 =?us-ascii?Q?KAC6sag4z7xxqvjnFxz37uPBeLgpFNyAPpDzPQP1zSf5drN/9ko2hCzCdTo3?=
 =?us-ascii?Q?iaBsYbc/7TMYeNw9sPjvTw/ELHD+h8bdCb7GOaypSg7+8OvEQ2OO94o9fMqV?=
 =?us-ascii?Q?xrZOpj72xm4WHL6gjYSbl0OYXRWrcYdOCLEZ/JDIVuRljHJ4O4Lse8xbH9cT?=
 =?us-ascii?Q?zoIvmSszSnsDPDqh3aVNXe2HmqZiSgz5HnqcNLE7u4RAlPZvO0Q4fnwvIdSi?=
 =?us-ascii?Q?Ry6VDFS3/HeH/9qnPCXobyNL6bE0MECgijh9TXuAmQPbFIh0LG45kEQfE26f?=
 =?us-ascii?Q?XUEi8Oi5f05IofAEdDn+VM5i9Vsq6XzA3oLGB9MQbfFfxEOEiFSB9xg7FtoG?=
 =?us-ascii?Q?AlbOXAjs4L3m7KcwfPr5aPzfxOcNuUFM5ufMTXndx1yfssFp1S5DuxpDk42S?=
 =?us-ascii?Q?8zxs8YAWgskWjS+IXbAYc12oqrhZ83IH1lefLPQeBapSlUNYH6PhTbsBvw8j?=
 =?us-ascii?Q?vfWeNba3PEUGzS97uRbFgOYRH04YuTrDxLcBz7uJZ6jAfSNAbFg3SXZBRDH/?=
 =?us-ascii?Q?t7xTG99FC5yq2CQcN5VRp1yWeMqs36fk2e3+5GF54SkS9nmgr1aPpkCIlYvJ?=
 =?us-ascii?Q?fQgaAe0/mINs8MDmvLg+7/Q8T2YNf8YntuzAiHa6KA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4+bhG52UuyiLWmDl2zURmxzToR01Bg7ynZfGtrIB3jtYgG0iQKOdiuxz3gEf?=
 =?us-ascii?Q?Csof51fsBHjmDCQkItGuCDW2G7LN+ADrjWhwb1UXFIbHg27wZTBEqCkchOGc?=
 =?us-ascii?Q?ZSak9YHdzrMa66W6fKz8hTGEekTGZZVv+9rRnI37z4JGpgreCH3xAxOydztt?=
 =?us-ascii?Q?+9Wn/tByzQs2/EnBhHD9JDh4fyBylROpCY1hVQXwmqpkKNT8sdf+D1NyK33k?=
 =?us-ascii?Q?j2uA3epbPF7bkz95U4As3A5/45HTGWDh7oY/K2QJ8jRhqn8YlRLBTowkTqel?=
 =?us-ascii?Q?fW+7vyPGV0anI9rwMDS3dC/WjbsLf6YYvEnAytOWxDaLZrVJvpkCatWNBJBS?=
 =?us-ascii?Q?ph8lAoLL+zd+NTi+EJrY4zL0T0YXO4FtXHHBBdtnpd85pWkie07lfMLHEvrU?=
 =?us-ascii?Q?nHzaFPxX3rlpaKlCnEABfCyAIM4bzb8Q+8ZyMz+9TvXPzaPDjdTNReOEfWX1?=
 =?us-ascii?Q?RoKQfTITA2vQBqUzY6uU8T3izfuuxJwkgfUZyTylZTNlroiea0SsWkj3PQmw?=
 =?us-ascii?Q?h2qjT2s9blDAydGtr6rEHg4IchpW7iSrH7BJe4Jd5IZN8DXhoeLizuo4oseH?=
 =?us-ascii?Q?epePzVFv+793ur6jX2IHzo6exaHEqR4JEdE8tuoTadSsXRLSdCybzF1fEnnQ?=
 =?us-ascii?Q?TU08+0IXwRPsCuc4UdwTpdmAEsckNJAk7KUSp1LpnnmyEtvquUNQC8CjkIgT?=
 =?us-ascii?Q?dehlQXZHuA8t1JTmRHW0nVdN4HyPdN8zJsu52do2rKA4abvVC9d7Otatzfwo?=
 =?us-ascii?Q?9uO7eq2rJCtz28iKcIBUCSfotFevaS1CjcZ+pMJzRwYxaNidWSEPnNzSieUv?=
 =?us-ascii?Q?LPhK5iGl6Oa3rMrQaMIb01cVarRdAyQdwal1fKxxn0VBJNdX/94PZP2jRGPH?=
 =?us-ascii?Q?u7ewlqzje6EXinZciPTBK3ojhroFtv6rQQvMgTishKWqlHlEurVU3xoGQbgs?=
 =?us-ascii?Q?H8GLE9lFTr1mrAsfbj+m/1i9X4YwzQU4CI/wcmHTBHHRmVJgwTcPFDvkHDIm?=
 =?us-ascii?Q?UDW6D/rl0Olt9xuWZnnW+QGkUYsaTokvceLUTuAC0hweEVQgwFirg/GBlFgY?=
 =?us-ascii?Q?k2eahP5X1Re2xcfobZv+IaVnZ2/jJixpHUn0lBEOLE2xOfzf6vmLSYWZyZiw?=
 =?us-ascii?Q?G7wcpilpHAhbhkqlnf82qXAs3hplmMRxdd9qsj+a+qEy0wUFwX+adLMWarGJ?=
 =?us-ascii?Q?eQTX8h15Qd9XonLARlH4wrk6OhA4fHvmjti/ShgH7vdV/q3a2F4Qlzmh5l8R?=
 =?us-ascii?Q?cPP4MXNtgMyk53oO0p3ng/D98maRn8IXcC/Ay6cVTGKC9DUctmKmPT11KIDF?=
 =?us-ascii?Q?AvCkiirNydS/A/NYXlMmCr8iwHPjlXc2QBf5d88uwoP7Uyc259wMfOlhO5VW?=
 =?us-ascii?Q?uTAWYcv7UAGH7/dlzGQfB7KUbOybsNrXNLiqNKgWJNPB1iOcdL0lZvP5VnxY?=
 =?us-ascii?Q?/KXEYPz04PRGdDi6uYiVk9kRDpy+QWhN7137VcDsL3d3D5RnCMnN5ekhzEdG?=
 =?us-ascii?Q?qLqQDO4lHCiUdhKOrXNhWfLv1/0zAsMTSTceJdnyyxUmsHt5w43+RsiohT3R?=
 =?us-ascii?Q?p57+Kk/zRL2hsEw4/9iz2G4fA9Heen9eG7IRSUHa6AgIzHZdabflTZnYzhLB?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	FeS2l/wKAjZS5cgzEzRIHgAHLiWQ/nYZt3VfazmyPOQSQrH7rN9SCztgI/PzPQ/QIe73l+JIKhgY3Q1CzI3IqpxqBlVXOSr/azJ31rnVv++gFwcPh9GdqizAhcDhENvyTyMZci0vbLuoPEH7v3Jj8GG9IhTCIr4lrYZDznH8JK/wwWyKhueJGlyvA9DCJbt+FuVz3R1jQS6qMJlKzR3B8mfHR9o+/w5tmane8dRH7dg++AVhPatpA6bFz4rO2OUYK1uwNLhqU/eUE9aSPJuEPVavgQdZ4j+54NPWdMCmHnBqIyuR1jA2Bi3qVgiQTe9e3s3sFAcVoDOv5rMPDvsm7C2OwlTINvLcxa3i+DSvcOcTuVpFMcWXZ9LVWyTKwIWHMpFepqIY4Gjwa2KOTAxClNtByL/Lj5sZugOal+pJ7SnQ54tfXNcg/yYhcgNkG+7YdBQ5t+mS79YMA7nmQdqdHEHBiFBcP0f8rtvyJ/mOzjawpiO/oz33esBbAXdYSiAN+w1VrpxHCJJ9ZY7QfmomtlS4Mcy3nr2A83jXFGkefgp+S42L980VaJPYWmdZ1jop8OcRdi+dHsSHdmoyMSACofrz+0xEy35hezl5MNWa+rM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d728b5b-1d7b-4f66-cfc9-08dc720bcde0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 22:43:40.4693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNv+UAphJUcxjUmQvKdYnooazqeyePSxiuZSOiLurKJd6BXCdD3A3n8PpmkFegWYoBmJeUvuxz3Ztpv7bOtC1ELUJACuXIxNTZNrrprnza4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-11_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405110171
X-Proofpoint-GUID: _x2xKzDl1T_IsNbQELeUBeoBzdimXOWP
X-Proofpoint-ORIG-GUID: _x2xKzDl1T_IsNbQELeUBeoBzdimXOWP

The offset range data for builtin modules is generated using:
 - modules.builtin.objs: associates object files with module names
 - vmlinux.map: provides load order of sections and offset of first member
    per section
 - vmlinux.o.map: provides offset of object file content per section

The generated data will look like:

.text 00000000-00000000 = _text
.text 0000baf0-0000cb10 amd_uncore
.text 0009bd10-0009c8e0 iosf_mbi
...
.text 008e6660-008e9630 snd_soc_wcd_mbhc
.text 008e9630-008ea610 snd_soc_wcd9335 snd_soc_wcd934x snd_soc_wcd938x
.text 008ea610-008ea780 snd_soc_wcd9335
...
.data 00000000-00000000 = _sdata
.data 0000f020-0000f680 amd_uncore

For each ELF section, it lists the offset of the first symbol.  This can
be used to determine the base address of the section at runtime.

Next, it lists (in strict ascending order) offset ranges in that section
that cover the symbols of one or more builtin modules.  Multiple ranges
can apply to a single module, and ranges can be shared between modules.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
Changes since v1:
 - Updated commit msg (vmlinux.o -> vmlinux.map)
---
 scripts/generate_builtin_ranges.awk | 150 ++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100755 scripts/generate_builtin_ranges.awk

diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
new file mode 100755
index 0000000000000..d5d668c97bd7f
--- /dev/null
+++ b/scripts/generate_builtin_ranges.awk
@@ -0,0 +1,150 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+
+FNR == 1 {
+	FC++;
+}
+
+# (1) Build a mapping to associate object files with built-in module names.
+#
+# The first file argument is used as input (modules.builtin.objs).
+#
+FC == 1 {
+	sub(/:/, "");
+	mod = $1;
+	sub(/([^/]*\/)+/, "", mod);
+	sub(/\.o$/, "", mod);
+	gsub(/-/, "_", mod);
+
+	if (NF > 1) {
+		for (i = 2; i <= NF; i++) {
+			if ($i in mods)
+				mods[$i] = mods[$i] " " mod;
+			else
+				mods[$i] = mod;
+		}
+	} else
+		mods[$1] = mod;
+
+	next;
+}
+
+# (2) Determine the load address for each section.
+#
+# The second file argument is used as input (vmlinux.map).
+# Since some AWK implementations cannot handle large integers, we strip of the
+# first 4 hex digits from the address.  This is safe because the kernel space
+# is not large enough for addresses to extend into those digits.
+#
+FC == 2 && /^\./ && NF > 2 {
+	if (type)
+		delete sect_addend[type];
+
+	if ($1 ~ /percpu/)
+		next;
+
+	raw_addr = $2;
+	addr_prefix = "^" substr($2, 1, 6);
+	sub(addr_prefix, "0x", $2);
+	base = strtonum($2);
+	type = $1;
+	anchor = 0;
+	sect_base[type] = base;
+
+	next;
+}
+
+!type {
+	next;
+}
+
+# (3) We need to determine the base address of the section so that ranges can
+# be expressed based on offsets from the base address.  This accommodates the
+# kernel sections getting loaded at different addresses than what is recorded
+# in vmlinux.map.
+#
+# At runtime, we will need to determine the base address of each section we are
+# interested in.  We do that by recording the offset of the first symbol in the
+# section.  Once we know the address of this symbol in the running kernel, we
+# can calculate the base address of the section.
+#
+# If possible, we use an explicit anchor symbol (sym = .) listed at the base
+# address (offset 0).
+#
+# If there is no such symbol, we record the first symbol in the section along
+# with its offset.
+#
+# We also determine the offset of the first member in the section in case the
+# final linking inserts some content between the start of the section and the
+# first member.  I.e. in that case, vmlinux.map will list the first member at
+# a non-zero offset whereas vmlinux.o.map will list it at offset 0.  We record
+# the addend so we can apply it when processing vmlinux.o.map (next).
+#
+FC == 2 && !anchor && raw_addr == $1 && $3 == "=" && $4 == "." {
+	anchor = sprintf("%s %08x-%08x = %s", type, 0, 0, $2);
+	sect_anchor[type] = anchor;
+
+	next;
+}
+
+FC == 2 && !anchor && $1 ~ /^0x/ && $2 !~ /^0x/ && NF <= 4 {
+	sub(addr_prefix, "0x", $1);
+	addr = strtonum($1) - base;
+	anchor = sprintf("%s %08x-%08x = %s", type, addr, addr, $2);
+	sect_anchor[type] = anchor;
+
+	next;
+}
+
+FC == 2 && base && /^ \./ && $1 == type && NF == 4 {
+	sub(addr_prefix, "0x", $2);
+	addr = strtonum($2);
+	sect_addend[type] = addr - base;
+
+	if (anchor) {
+		base = 0;
+		type = 0;
+	}
+
+	next;
+}
+
+# (4) Collect offset ranges (relative to the section base address) for built-in
+# modules.
+#
+FC == 3 && /^ \./ && NF == 4 && $3 != "0x0" {
+	type = $1;
+	if (!(type in sect_addend))
+		next;
+
+	sub(addr_prefix, "0x", $2);
+	addr = strtonum($2) + sect_addend[type];
+
+	if ($4 in mods)
+		mod = mods[$4];
+	else
+		mod = "";
+
+	if (mod == mod_name)
+		next;
+
+	if (mod_name) {
+		idx = mod_start + sect_base[type] + sect_addend[type];
+		entries[idx] = sprintf("%s %08x-%08x %s", type, mod_start, addr, mod_name);
+		count[type]++;
+	}
+
+	mod_name = mod;
+	mod_start = addr;
+}
+
+END {
+	for (type in count) {
+		if (type in sect_anchor)
+			entries[sect_base[type]] = sect_anchor[type];
+	}
+
+	n = asorti(entries, indices);
+	for (i = 1; i <= n; i++)
+		print entries[indices[i]];
+}
-- 
2.43.0


