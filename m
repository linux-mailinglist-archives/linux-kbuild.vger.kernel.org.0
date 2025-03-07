Return-Path: <linux-kbuild+bounces-5995-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59454A56E63
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 17:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E45A188DF9A
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 16:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BEC23C8BE;
	Fri,  7 Mar 2025 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jJxs1Viw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S04f1jgA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962662DF68;
	Fri,  7 Mar 2025 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741366455; cv=fail; b=Aw0lt8LFI06uZYmh0nWv7IJ7KElQLmo0mhzx8cBpmaYHin/QlB6bEJAtrFpe91i1UZLMYBMgeULgPZqYKMT8aJ4ht3e5bmuK8zlCu+UQBUZdc12E9J1yvGew2FYrUQ9n6/UjQl4kJj564zNEd/B5Yx3QFr9WNOaBj3OnN9HYSeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741366455; c=relaxed/simple;
	bh=UqJkjsIjjwtLRz4wkFBAZgFAPYCTYYPjz0+SYQkE0gE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U767z3lHLDkY8uclBJbkUCqQeyQwz65ECx4QdwM11Dduk5SedbGEspc5CXRiipoZne13u/1zMk5kBmoeF/6ycz7nyymP47EuhCI/RSYN5qD8N5z9Y7rKgDIXJOoh5hdDjlLtZ6RnuRvBKNvTHmG80TmeESs/hb+uqB06ne5FLaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jJxs1Viw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S04f1jgA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527GflrR028009;
	Fri, 7 Mar 2025 16:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=MYMDMenBVMcgkc9q
	MCUnzzmsMDF3gYrF6Org+YLDQ1E=; b=jJxs1ViwZXSHzIQhBT2NQNDus0++s+7f
	FsbIn/Ffzrw2ZW9KLnIudgFR3ZNotZQnMaY9VFOG+chS88k8F9VRj0LrBPFT+t04
	l6RDiDciBVebJVsl9x21K2QvrpQHwfJo2kf2QirgALXsa9/dZxcOsEF3FDN5/DlG
	1WYkiRMgpWRuAFuWVKr54vqRVlOdtm3wsLE84DoV8usQIBqGlJQBhtEWm2a+uIj0
	x5X5dVWqXNGihWC1ZcjAcXO8ATd6xYs1I6UrWJWGcu4BEjLwscpZIYc8LqRtFJRo
	N5UU7idF7kgUCQ+eSzERfhnNMTzEc4A+DJuR/1C0xMkY/vYz8T70uw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453uaw4m8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Mar 2025 16:53:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527FxDLJ011011;
	Fri, 7 Mar 2025 16:53:56 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpfcetr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Mar 2025 16:53:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8K74Reizx/VoYcbZGs2adlql+n7nhfzh3UKVpWCiRFEH9c0UyFJEAYiTFrfBZfd0861cU/Ud4eUavDGmpeRivfhLhIHBkotujn86Bl1IZilkP13zNAtrFoeB4qakvdzhnQW/BDIZYvm1qvtEa+shZNg1kuWUKhWEr5iCKynLRpI+AEaugXsLL7fk3tMiUm66QXhDYbtIA9lCWk0+7wRw+013A8xk4C9L0yfL0zJMGos9oM2uWafpP2I68YFWEaL+Z43VXKoK/ibd3ogoHwSivwu4cUEd70akAlA+3rQFdqttgZUY7wMVR855tTzLwwkDAfXnUzXBL88ohb0QpiRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYMDMenBVMcgkc9qMCUnzzmsMDF3gYrF6Org+YLDQ1E=;
 b=YA3QTOvmbPFtrVrXtoax8ZNOk66fhuqgjhHxWniLAkd8xqd+VK+qnVw0AFrCbUlUwQpRKlrz7ew5rSAW12Ga4jalSau+8M23tlaARRM86foRyWlbmhw5FiTbU4+XF5LZ0hewd3efo8x55s9zILkOf3yDHtabm7qfSetQhaWZgXRm+HuO6TulETToK4FVOgBp+0kReXcYy/Imh9ZEN5bgX0vSUAoS4SFzDrFRnHPr/+kIIfy3y9trxgTd/SY5fjmug7fBJgGjDtftquQkvk4szbvYDeHTYydBG2OKZwwC7TkL6XdLG+jgZwDPdcHceMIayafi+V9t/iNISqzpwRgnCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYMDMenBVMcgkc9qMCUnzzmsMDF3gYrF6Org+YLDQ1E=;
 b=S04f1jgAlh3Q1tS4VtdpXTp092vbBGhbJ3mdh30JiNz6uBOV0xJtwv256bDxyvxal4PyG7y/pm5RoEZcBzu4grwVjk78aBEUXrx5d1uc+h3hhKahvZxLlQbIy8Hws0ZKbUboBmejgCZXR+iEC2ud18NPcoEZJbx1rg6HwGC9Rnw=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BLAPR10MB5122.namprd10.prod.outlook.com (2603:10b6:208:328::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 16:53:49 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 16:53:49 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>,
        Daniel Gomez <da.gomez@samsung.com>, stable@vger.kernel.org,
        Jack Vogel <jack.vogel@oracle.com>
Subject: [PATCH v2] kbuild: exclude .rodata.(cst|str)* when building ranges
Date: Fri,  7 Mar 2025 11:53:28 -0500
Message-ID: <20250307165335.3110476-1-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0056.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::31) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BLAPR10MB5122:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bb40e2-20cf-4a43-25a8-08dd5d98a245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hZW8QLw2IRYx3LY8TM/y1z3S8DxU5n+xsPQHj/AT8PwhzTDyytZQedh2JILj?=
 =?us-ascii?Q?XyYuQcgl3+B+1SZof62iOlgPDbk8ItuLb150aWvRYQ+TFRx/m7C7oJPQwRhS?=
 =?us-ascii?Q?fS+G19nOMLy9JoHZvbz+uXG/MXLPhNnYVzkh24GXSkZhQZThGds25MiNf7Cq?=
 =?us-ascii?Q?jtpFAiEPBCDs7mVLx+lN7V83Wqk9O0xbpLkDTEymIG0RBS/iK4gNkiSehX+p?=
 =?us-ascii?Q?C+aSe/UU+5YUritdJh3Wdawi9AQ/ZbvUFl9Dr0GllT58TN1dMMTULwhpsK8f?=
 =?us-ascii?Q?9k9lzGVEVn9oEHUIJhW66zASXZqvG24bA4H9NmNP6rK2eDtCLNmgujgxYguy?=
 =?us-ascii?Q?28NzF88bcFAykHvn5JT3KZsKA33ZxP9AoRIY1RS1hOIzSc1G/1Uz15igtoDM?=
 =?us-ascii?Q?aGa+Sewz/6v0+Toh9+5v3dd1y7AIBZsxKpn7kxijFpeBStHQXEejWvoeBtsr?=
 =?us-ascii?Q?kztTfqPVF4ICr2tT7O1ZYT04UJzZg70gtsyfx9pF+PstnE2ctE8A7Df8/TJc?=
 =?us-ascii?Q?FwaMsatZTbIF/GzVdsYlVuTIQTeSe/IM9FitLlHT8X6mrjWqlnq2jkZHPj9u?=
 =?us-ascii?Q?4RT8RVnCa0KRcihuwvNgrrd7I30V+mImGwsEVFB45k61glJeFdT4hoXldAa8?=
 =?us-ascii?Q?z7awET/mWAHHQkklvJFSQIAq2AG5shJFDJKAzuPVAMkUg0O8QTzAMjfEtH/1?=
 =?us-ascii?Q?qvkGKGnfr59OeAfsumCtVT8ceo+aaYogK2K9MZip2+jQJgneFH81k+EM7fbV?=
 =?us-ascii?Q?6AOg3IZCUJfIi+NgZq/Z/juaXtmCUeqc7FHp3WcMZhOuI0fPoBPCOFP1JRY6?=
 =?us-ascii?Q?aTRrTzdIH97SIWUQK8uJf+8aY+ahbuDjvZPJVEl8pMLWSIbnvFaz59k9NHZK?=
 =?us-ascii?Q?Gw64h5GuowtX/HLl1nEcqZ2wNOkinZ7A+r5JG8NLY80d14W2ykc0cFiCbsX2?=
 =?us-ascii?Q?MJSF1/Dus9njIpF9wMep3HwmV2iJolGtOJUa15Nm/fEPllIbAcA37899c8mJ?=
 =?us-ascii?Q?/uiRoiZcIzpi04dYIbH0jZUlctKsXUlW1hq32Eki3ygQp6emMejce0OH9iTR?=
 =?us-ascii?Q?/Jb++Y0pbfZnwQHjHg9cPUDt9JyCBPHP1qOw26TWwutYABEIBspl97uZWUqe?=
 =?us-ascii?Q?zHs1xQlnX118UQVKGOKtH74owkjwPKlpcvG5OD1WG0YjaFQYjKDpnBj9OkOI?=
 =?us-ascii?Q?U+k8upqU4aDITsy/3TRRTpQ3CIeu67pzN4t6yWDlzOzbFE7l0tYZen+NKhTC?=
 =?us-ascii?Q?FzQxh2T/9x0xHco6Rl4SX0SJxjSZwodg+CMB0ajkycOzyUR7sbxkAHbVxSWI?=
 =?us-ascii?Q?+58WnR+z3qpDTFodeY7OqguroHQBzeIoRCIpVFGXcsmlBlG72KnctOB9I3P+?=
 =?us-ascii?Q?Ztn1akoOku5xiFYr2SAj8j3I0UdB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XM33iPwXBNbF9Ikut33uF9WEj6VKFLuQtt1LaRzH8Cq8eMtbihQHM5Hw17nt?=
 =?us-ascii?Q?m/ZugGrDffiAXB8Zs1AiLsXcQiSxOB/s7xiOS9X/xmdhaHWy7Mubxj/b6s1z?=
 =?us-ascii?Q?C3voj8XhIqtJQk/Z1pGvTyjDFmDR4srWpBBVYRe8ToWgK0WDySi2Av6WMy7X?=
 =?us-ascii?Q?yUe+NxjsFjO7CYgA8RtLNuMlh8J4CFV+FoRTSsZ+AMs5+0xHLKvsKIUKvK8a?=
 =?us-ascii?Q?R5W3ZuuWXreG5Pc1fxnZdba004Qzxb10LrmNsB5I/5efsg1XJFCBWsvzJplM?=
 =?us-ascii?Q?vq1WrmUEgN+BOfSKGpKdSdbsSjFh7c/CZuxvu/XMFRSY5I1PSIV/NvjSc7KL?=
 =?us-ascii?Q?LuCKgoLVQSxpm/LGVvBtLi3FC8BEP+DVkpxk8c04EYajO5bDyEYmy5pCi8Gf?=
 =?us-ascii?Q?B7sKgod/gGm2L0JXS5qzs8AjauwteUmqkKKf6nUFKwFQijQYhsCB+1YxwzfU?=
 =?us-ascii?Q?AZYD/kwr8jugA9UCs79rrnpabEJgdSLZyswt57O1BmFNUmR4yBcz1GKKuH5p?=
 =?us-ascii?Q?hsHjSylGYQF+Kqa0sRClgPTAMWnZCmJO7I7Dqe0WsQTASgCDzi5HlYKmb8r/?=
 =?us-ascii?Q?FnYF3Y58hJ1b5BQLNHDQL0i5qfEkkxfepBiDAzjXRTQO0sSBRxD9BB+xxRxs?=
 =?us-ascii?Q?10eBwx7ZD9KaU/4G6swn5arOS2LZ6fGmfnCtOmER8io6Q9QUW+m6ZZax7Vkh?=
 =?us-ascii?Q?tY3fb6lLq5azMm12uPm80p6lJUzZ+jvkQZKL5+/Z9DHa/AI8pMiCkqhVJskL?=
 =?us-ascii?Q?VQ7HGDIAHKhQ3Nr+QwV7YHuhwcSFmqULRl1iS/+YfdwMKcHo9GMs8c49oPNB?=
 =?us-ascii?Q?UoqiFg4azUkpSXsnoJPM42v6gbvj9mCPFAPSyd58NYukO4V7GTp0m41nWVQ0?=
 =?us-ascii?Q?IKsMKQth8a8P1Lp47PtYRawrtTcDyqAKItADtJF0Z7QuUJmriSiv25MaZ0w9?=
 =?us-ascii?Q?+TNE9++oZ7t3r1tMSsebFj4z9ggpLHlL+XKZNXSAYU6eU18qgDWaX8mWT15s?=
 =?us-ascii?Q?nu3ZxzXMaQfzCVCpm+HsEUMjp4Q/oMQdeoVi13prNPbKJ9W6gSpRU8yyiB4r?=
 =?us-ascii?Q?lk7x7PefOIRW0eycH8AQHkTgBDoBFBGE1RQ8MInEp0Ld3zvB3quAQda2lZ4m?=
 =?us-ascii?Q?k+PUJZRyoQBVdMIBElHgLKJ4LDtCik5aC08mYEJfw3eth8M7UZJyFu/6Nf8N?=
 =?us-ascii?Q?Ms5SJh7Q5Knrn4bM2EcyOgXqZRoyuODYqR7QUniPnKrg2MENCARSP+SHSVtM?=
 =?us-ascii?Q?mmbf8ZYdZWW4PM7MXfREHOO9CdgxjJsWrsySq1OLiCEsDs6pgcf3//U/OHLN?=
 =?us-ascii?Q?is9ZKj6mtyT8aphXTikmSTfJ2FPUaaB3G4Ou+H7FY5PMWgezS+oR/OeHlS1P?=
 =?us-ascii?Q?m5/mWPsD62bte9+bDNx7ykvnlZMmnyLSrASXWcZp9Z/+QlH4ooOYdGpilRxs?=
 =?us-ascii?Q?dBkeSP5drlLtzt5H967tZmyLamRt5z8L2bJhEnkaRAV7BlEhPnQ80OAp0i23?=
 =?us-ascii?Q?wUAeKYRISLg1wTtQhzQdrVb1LejVKpfznZ7eE3OgIi8OdPFAsYxiIZL/DYO3?=
 =?us-ascii?Q?ugvZ2r5HlkBHkAsfpCTJBDhumK414P+/hcyfKkKHjWs8XV976UxT1/oLF+nl?=
 =?us-ascii?Q?H3XvgYUCPkpXXTqoadd3E+Y=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O8VD2HZjNVt0oLPZ2NA4IkCbkW3ZTZl2pLd4bLCZ7Du8yffA3s0KQAYwjCEWjlIjHtoABr17zeIEMWMajjgple/utYq3Xi3HYmZRYPimMN6dkvoDE12VfaQufXZrqLoL4cO/yreIFanpxO1z5oxZQpZE+oNrHFaJwZencz7o6Jv29KI1ZARYzjqWhJSbnLTNbPafXDul8vPYaCMX5e5p9lumaz3nvs/i0QDvgFGdgUvXU+5rCPgt1FAKMrMxV55FjoVT50MX+RbbZ0hFiWn/4E6wTCw5TScwa7SRwgbkLsnRBZ8j7eWXPDwScQOA+iBdV6zsCpnWqTlu+/oA73FF/hrZyhb2T803NSt11C3WQdyrg2TPq0bKiTielDkVwUKcrC6oVmDaN9OR09QA4YymmvjZJCXj5zNbvlQYVXoUrnV2e5i7vC5tRWUsgguEfZq0/a6CRQew9eKgvp+4O3BSWxR4tu90b2T++WizWOToBGxuNibkriue/lqhjjT8s7g9KETFxI9eeLL5dKnkv8wrp+eC8mHnlTpzP9CyYcU85RnUb4k9okhn8NFJdB4oHnOuqxMtlIUgmxhV5asVTbOgoxL5vr/U38i1DD7fWTvFaoE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77bb40e2-20cf-4a43-25a8-08dd5d98a245
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 16:53:49.6753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lfwu5jEp0ImOXGC56j0mjqsfJAg9LAVKdnRk8Eq0RJzFA7McipGZNCHUd9ywJHvhPGAa8h9GRRhXVT07mr0c+P9dsMGzdvP+QRbRxZIRgng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5122
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_06,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070126
X-Proofpoint-GUID: sumNZVnN0XK9BluaHI3mbk5lfQuLPSAk
X-Proofpoint-ORIG-GUID: sumNZVnN0XK9BluaHI3mbk5lfQuLPSAk

The .rodata.(cst|str)* sections are often resized during the final
linking and since these sections do not cover actual symbols there is
no need to include them in the modules.builtin.ranges data.

When these sections were included in processing and resizing occurred,
modules were reported with ranges that extended beyond their true end,
causing subsequent symbols (in address order) to be associated with
the wrong module.

Fixes: 5f5e7344322f ("kbuild: generate offset range data for builtin modules")
Cc: stable@vger.kernel.org
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Jack Vogel <jack.vogel@oracle.com>
---
 scripts/generate_builtin_ranges.awk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/generate_builtin_ranges.awk b/scripts/generate_builtin_ranges.awk
index b9ec761b3bef..d4bd5c2b998c 100755
--- a/scripts/generate_builtin_ranges.awk
+++ b/scripts/generate_builtin_ranges.awk
@@ -282,6 +282,11 @@ ARGIND == 2 && !anchor && NF == 2 && $1 ~ /^0x/ && $2 !~ /^0x/ {
 # section.
 #
 ARGIND == 2 && sect && NF == 4 && /^ [^ \*]/ && !($1 in sect_addend) {
+	# There are a few sections with constant data (without symbols) that
+	# can get resized during linking, so it is best to ignore them.
+	if ($1 ~ /^\.rodata\.(cst|str)[0-9]/)
+		next;
+
 	if (!($1 in sect_base)) {
 		sect_base[$1] = base;
 
-- 
2.45.2


