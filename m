Return-Path: <linux-kbuild+bounces-1881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ECD8C8078
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 06:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C04B8B20CBF
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2024 04:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F980D524;
	Fri, 17 May 2024 04:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e1s+xsKE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MdPQdAP0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6F3DDB3;
	Fri, 17 May 2024 04:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920376; cv=fail; b=ShuTB2Fy+6NdxkwF73ZglHaTEj0iEFR9Q9HEZGBbTYGxEONXrNw/vxFmatkLBMTofa7j4lMk4kEGSxu1v+I8X6dASvqhf/N6XfJ7muiapyHPxMexP9aYUMFVUavKktIBopcdVPbhoonHqgqaHSrbi4aNCv4LdmeRSlv6G+7eUnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920376; c=relaxed/simple;
	bh=RSoQbeXOQ4VMtzIOo3uukA2lu0WJpM1jTZ9o7ZHlZco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fRCE6aCLXIFzcXSZWyXBXnsYgyls/0lIwvcQ1acYI50f5jfdPwWT2Bik0KgBd8AljcWO9LATj1dkO/iLoaSGrdc7mne+YWwsQLKTIuyLobqqvPPZxrMq2suqLKWqC3QpjYlCc7iIA4ebJElweVhKxmWFAGJs7MqkpS/D2vMydUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e1s+xsKE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MdPQdAP0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44H4U2WE007250;
	Fri, 17 May 2024 04:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-11-20; bh=yn9L6GPjWsxbiOfVlHpDFsyZY3PXsd7EUaFTdzfwZ4A=;
 b=e1s+xsKEYrt8uMD4q61sNPZD9AlWeBqEF4fJAzt0LVoJMBq3+/iGL01Y4YhYnxe4pdMn
 leLosoaoQzxiUn1bLG0znnZGYi6++gyfoqeoHBmSuX1YeT8PjTpUGiIXb+8fghk6iCuc
 /NzBCE8WsEWKU/Bruq66UhcgI9RokBf+gYVuKYgjigCMzcCUZ0346C/yqLMScMPEhHtK
 RXnR5D7Re6Nado1m4npr+wlWCW3HyghBL6JDO2RJ9H58GvBDdsj/siDuOaPKAexH7Tlt
 h2jd2v+pdy5HiN8OyniEsaV951fiAxUFembZgEjYU2uIst40o5gGHwbygZfPSCExKtNB DQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y3txc71s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:32:44 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44H269gF001205;
	Fri, 17 May 2024 04:32:43 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3y4fsudr68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 04:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOFY1EB4KA27rt9O3/tVdM1RWMWJlqPq49jmxGyAETBS6xsYz4uYEratpAJUoUyjhtU0NtylBTzihdDqDX8xAvdbZYNyPHyQDFZH+jC5zv7izMG3H7r+JkPc8ePIF/iD2sDzZWUHvd1D0tZzqaVt69ufg3q6DLpTW7Vv4eWtXmc1g4Ak3mfuFFqgd3PSyr0FowFoESfPIaPqNwjJ6Fd4AQkzoQrPj9o3VmkltFS9Lvbc+WZi9a7E4xUImu/PVWd9IWNzw6Lk7m/VskHDfPgHL9e5BzsQObCrtw2M02xtes07Vga1vY/PZ9kr7qO9R0Gx0zGA5MnMcU91J1BniCa+aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yn9L6GPjWsxbiOfVlHpDFsyZY3PXsd7EUaFTdzfwZ4A=;
 b=KdaPKmHp99/FuHTzqVCsQzEMMw6x2Jg51jUkoawnEKqF6l/y1yPIRgPnOWHdQqlD2Ng6kRh5MGjl3IzCsUtgUgziqlnjAeAuW8lLDvhPi7zeenf7Z093PQ0YnIBLTiFyBpgBkmq4kixmBKAixTr3uhRWTE3hPnDgN8PNPzyuPIyQOsetkD4bjJazmho2pDvJID+XLQVe4QIYwWWhvyO1h4uYohQDKzaXQHMDlpapURbXB/jtqX2j45RK7VYhWs0DXASQ7mj1dPVBzL1CEl0SqZ/pMWGrUshfAgdFxa7Ep9PfyYrRwbM6v+jZHIWeb3+54EUhit+cbLZNJUXoruWvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yn9L6GPjWsxbiOfVlHpDFsyZY3PXsd7EUaFTdzfwZ4A=;
 b=MdPQdAP0/B13xliQn+UYr+r8G4pj+PZA0nPwx0L2CI89k+javVkc/1lEBt4P6XcetTNJCBnHOy+A4TFw1HqOI2ARRWclJzozN0/PbwnUoDtg5ied6g35kQMHca+SqnvSxnNBLeehnCtSQgLf+TWWC+rlyQfhNkRFl56J2G4c4W4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB7746.namprd10.prod.outlook.com (2603:10b6:408:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 04:32:41 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 04:32:41 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v3 6/6] module: add install target for modules.builtin.ranges
Date: Fri, 17 May 2024 00:28:39 -0400
Message-ID: <20240517042839.544650-7-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517042839.544650-1-kris.van.hees@oracle.com>
References: <20240517042839.544650-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0013.prod.exchangelabs.com (2603:10b6:208:10c::26)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: a4fdb8cb-66e5-4f04-de38-08dc762a63b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7L3bjdL7tFaMcirl93shJRATkOTGDUwt0Z/AzHCP1kJ97oz91m/glL7w1bOQ?=
 =?us-ascii?Q?BblyN09WrfgwDtwJVZIuN2Roi1eX59xVo4fCZJ3wgbK3vlzuX/As57eyw1oM?=
 =?us-ascii?Q?1Z4Qp/pSrnPGCeKta3Fg8iNfzo8uebtfF5+v3bzU8wslU3B6xwtVs6plFPFp?=
 =?us-ascii?Q?QFVFGAPUeL6fvcdXr7NUGoHZeflWjkJ3Qb+lH83py6tGQftIQaL2nEifUgHP?=
 =?us-ascii?Q?+j/d5QRBbeeqlarYQzCuvWDFgQrgHncRj6ywscB/c7lCcPi3Vqzh/BUbhSZM?=
 =?us-ascii?Q?hKrB2RCL/fTPUCDIEm2PPfGLvY4WdvFft21JQPu1cXgojVd6keqQoQvyxOw3?=
 =?us-ascii?Q?J2xkAJL36V3gCvKLmExYMOR0h+wQbkHUzUEbHLIbMkeE6jP19DSttFCAEqTb?=
 =?us-ascii?Q?I+maVkfrLR9jT5VMz6930gZQOEsTZc8rPPW0PsxNx3m+NwFu3TZvMvOB3m3D?=
 =?us-ascii?Q?E5xh7ANQiivAfM/bosHGQoO36ZWi1Zxpmcj96n1JaC2wBaxN/X0VgbKtmlhq?=
 =?us-ascii?Q?H/sakyUltHn6mVasSN+ldBr7ydMT4E98DfpwUEYFzWnFUwIJjkQIGwZ0dxAW?=
 =?us-ascii?Q?4w86KCQbWScG3FPVNLUAUA1ht7GFcyGMwOH9vhOQ8ja42ror9b+MR+XYh0ku?=
 =?us-ascii?Q?n+CxLBNWXllegezP6YVQiI9FYUvQK/rMualeDJ4Eo1nXtQ5qpAB2mbuP19lZ?=
 =?us-ascii?Q?EB2Anu/9tU9wwkUgdxJrYhDE5h3ivsT4Rjs4+CWkQOs9s+EiJoE5JjRnho+z?=
 =?us-ascii?Q?N6THRGZZsIbjXpG7A+btzSZyVTHtjXi0jKc72wGboEuPCLr/IDfWutvhd15M?=
 =?us-ascii?Q?uAm36csZ9cBbfkahpW8B68BoNltslG0SaT05wrycbW3+pGsz6CLDa5c6n/OF?=
 =?us-ascii?Q?AqBYcTDZ+AMwscmjPp+vV7GuVaCY4441G65qiGEnOsL+Jv6Tf/kFSL/1Gy3I?=
 =?us-ascii?Q?QRfm5l+UnOVFVpu3w7ApXzQP0Hatya/7O5Nav/HMkUcjxr1MsrgLfsC2T+mr?=
 =?us-ascii?Q?njeHYpdfEXKxZOd4QO8EoYOB4HExLdyv3fdzVIVuhtp0rk0xcZ0PXKZspcN5?=
 =?us-ascii?Q?VOhxMu0OQWSuWVq9LOC3brqBWtmcZqNu/+tHtM65GNxvIRhOA+DBstG9GwqU?=
 =?us-ascii?Q?Z0o1qK4iTYj4LacURnY2onbYvZ/Qhhzz9NWDKyU4jsk7WnJlwpcg2Twe8w4G?=
 =?us-ascii?Q?pudzzS8MDhRE3dYraxUc81cKUAzzI8MEL6wn5FcR86CupN7Jary5OCqHkFje?=
 =?us-ascii?Q?GPElwndIpmT0iOlToXrSsvRRHYVKRtG8rlQxvVZ5fw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z4Vc9Cus3+ia47VRWN5C3tG8RuNZu6GBVuRSUNDjIgbBTRabPNkvE9tJQe+e?=
 =?us-ascii?Q?RLoWEJarWUsw69ClpTPsZw0m5wBdqicNz1WVlTF/Xun3Iqa1SzOi9Kby6R48?=
 =?us-ascii?Q?EhkzwMTbX44Jbe5XbJs3EmuTwAqiibeOB7+i7mLCX80VEAuJj3HoY0CKBcGm?=
 =?us-ascii?Q?BKh725DYvpHLVIAAN1uKdAjO5B0PgD5JbPOI3bSuRw47mUfL+WKiqG5oWYuw?=
 =?us-ascii?Q?pBeTj+1IA+uid77LzVH4jX1Bz5z87NNoUGKHuzzR8vjV0SUTspfAFJciEm/1?=
 =?us-ascii?Q?pSVr9Lc+/f0NjH9w0xPYD+bSKP/WM8FGHZccmGHnEUzk19Md0LPFv6xQd58b?=
 =?us-ascii?Q?pg/sCiyF6sbxZk0vKu1AmjaTcm7LNldhNciumfyXF8tMixBLBeiMj++D70lZ?=
 =?us-ascii?Q?luCXL7nrxQSzf1cst76ZQrndarja1KFXNJTWnZFYM+DMCgkH13MVH5gtMHAQ?=
 =?us-ascii?Q?Vu2+w1SjmsGGLWl438mDl6HXEQ7ZCk02pCnEeB+xZ6mrTiWE1rZYKSi+qMMW?=
 =?us-ascii?Q?hH5Uvf5Qp2coUmA6FOVneJ+w39oEKVhRind3OytADqZT8o2K09M8Wm56jNgE?=
 =?us-ascii?Q?Mer8vDtJR6t2TbP+vr4F1V3Wfth6DJ15nM0DEG6LlD2yd0fQEq+agC5nQha2?=
 =?us-ascii?Q?GjdQSIsOiwhf96PZIO4SFtL5Qrv6tdNvV9lqkd6vc6eT7w7fRfb/Yh4shkgO?=
 =?us-ascii?Q?78q2eG9jHaGJvVZAPxXkGs5T09lKB84E0Jv/d8Qj2WioB1qwk20lHsUbtlec?=
 =?us-ascii?Q?7oZfnIlgxETAWfxVQqZwzZjOPeUATTVcqRANDCcwbMVMd57qYf/oIkdzWt3S?=
 =?us-ascii?Q?YqH+yhl/II/ldP3W6x1VFltkBv3Z6+suXqRm3xFz8WgMVTdbL2RkIraX8HOJ?=
 =?us-ascii?Q?tEdvhLc9M+wPxsOjGPpfJjQLbK6eY00lFMMZLPOtHkmdqnjeAYFn3ntOCkAx?=
 =?us-ascii?Q?9tY8OW3vGOtMOEVh10lsrJbaz36w/7jmxhxXxxf3BEqdN4ptyrOsmLHAkplz?=
 =?us-ascii?Q?FOYoKPUweWMbgEUHFjITp3jAuIcB2eORfM3FM8axQt7yTkQyE3NV933YaGmD?=
 =?us-ascii?Q?b6rcXr4Fsou3UNmihKoXqArXKa5pltMa0snrSPu4xFMPMazhNRQOiKSMY43h?=
 =?us-ascii?Q?BZBRaq0vLuMBp8BtAp1BV5KJoWgYEvKcFORtSpnttmAseo2iYg0QQMSlSMFN?=
 =?us-ascii?Q?SAOzK8+Eo5QOJWDxra/9vAVP0a9s9xo4PSCWEZHT2D4suUi5J7iH8m08yzzc?=
 =?us-ascii?Q?c7Y9VW7MMMmuObLhZPGxXNC0ZFKagENhf2SnnqDjNnvOiKsU8llw7CuXUSaR?=
 =?us-ascii?Q?UMdELJfEAwVAhIot0G8zXPzm+U9M3slIjit5pyd/hiQS1ASx1gE34tCLebSC?=
 =?us-ascii?Q?r/1cEP5AXOE5lXEa1ebtDzmmAkQrJf5Qs4Y9SSOPgo8GQsGn9DwU7ZF+QKuA?=
 =?us-ascii?Q?7zXLCBqQ83p6N5iljRKTVJZgHjETH9X1gfGZOviIFXHjmYwVCbImY946jgCy?=
 =?us-ascii?Q?cNHMh5wyaMQPMQ6OQzU2/bw9RY/Pna8cGqPTn4XTNOJwXYzVRed91DW+E/dU?=
 =?us-ascii?Q?mDSXMLwSqcp0xPEyVpdCaD4itN8aDQo0aE4ORt9ojT5d1Y2g+aV56YPbC7+O?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0tscfQ/4YQyBKxnAX27GoihDPhva2SRItTn12QExxY5jei6K8SrRYKQK7itetKyJl/bDKvaae3nyomlzmjeoQfsQeQqMAwPduMUdRJ1PzCnyGCWBu3FIbJuJ/F85h5sEd1cO4RpRK2uFCLSrvZygTko02sQI0YylIOpDY28CJoNCFFIvLtWZ7PC8SjF06DtIGZDBpSQuFsRYS/ztenRPzJ6HaB3VdMIs/gOy1aMouybbmkZr6MuLBXIXOBZ2uLSnSycu+4xBArW8UY/RZKoAMJCEo1nAxGmRGSCkqZOeX6xTkRYzmdiB6kck83bNSHGASScRo3NofgJuJHZe8v6z5eYYdmbRq0GoM/igceFV8FlPBFrK8PKLdL6pYz9UxLDXFoQHm3LMFf/tXKYRIEVzLzRqQEBX9vbJr8rMLLf+u5TVKLUZbYgT4lmQQNL+TARLPtYX6z9YRaKKtywLL72eraHliY4DWlLmlK+hMfyIs1DEEQPsf1z3lk4gV3QnigUXqxbqbtHvE4QVUzY9pM1ZsNlzu/NIuymco/9i33x1O7wAMv8blOiNSYvquzrrewcLhvQwA5mLUfCl/WPI31eUOyqLp+I/69PASwgO908TYI4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fdb8cb-66e5-4f04-de38-08dc762a63b1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 04:32:41.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLGVdYnrpsZeATwTMSI+tvNFBICVhQ7H/LFt0K3U3SNginE0yVV91/sV0qZ4kiCGXhV8xK385nKiocSbdhneHCAiclUmmGiCF7z4Eu3nVKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405170034
X-Proofpoint-GUID: -C4Q__ThmRctru9jqpePB4W5S7CYIAQY
X-Proofpoint-ORIG-GUID: -C4Q__ThmRctru9jqpePB4W5S7CYIAQY

When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
file should be installed in the module install location.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
Changes since v2:
 - Include modules.builtin.ranges in modules install target
---
 scripts/Makefile.modinst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679f..f5160ddd74239 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -30,10 +30,10 @@ $(MODLIB)/modules.order: modules.order FORCE
 quiet_cmd_install_modorder = INSTALL $@
       cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@
 
-# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled.
-install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
+# Install modules.builtin(.modinfo,.ranges) even when CONFIG_MODULES is disabled.
+install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.ranges)
 
-$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo): $(MODLIB)/%: % FORCE
+$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.ranges): $(MODLIB)/%: % FORCE
 	$(call cmd,install)
 
 endif
-- 
2.43.0


