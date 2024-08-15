Return-Path: <linux-kbuild+bounces-3003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC9953694
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B4A32854FF
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 15:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA601AC45F;
	Thu, 15 Aug 2024 15:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZKIf5YHb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ak1aFiGJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964411ABEA5;
	Thu, 15 Aug 2024 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734265; cv=fail; b=DBiw5UzXeKiLDzhY3y01jAd30D7C9/3QenRVOxuyQbCU8HXLtwuGubU/ckr154LM6kwuNkIEoffX3nCxIE98wOp2ETq5rcCKgPoYTK3E2pw8EsqYl9ncO8bNF1yR1VaRcbIHLapyAjvbxUhTM3TCdB2eM/1VuWHLgHxK7XqI4tA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734265; c=relaxed/simple;
	bh=YrmsrHdvhN6Bi3OLDiVY61cRYA/t9f/Heq9ACtkmqXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qGMDGpk0wVUwSoWf0qEx6463q44VIv7LZ8RzWbwMf61Wm6m8w5LvxgFhRcZYabeeSEbGLvDH4vHMAVkEuCBTVhSFIZPeP0k9ZkeX5toMQguGJ2DH3+aRyqQ8h0kr3EXiyGip0nG5+efWKxwsT84/QaMzdFEW+6vifSKEvhawT2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZKIf5YHb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ak1aFiGJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEtaKG007707;
	Thu, 15 Aug 2024 15:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=; b=
	ZKIf5YHbmbFJNQKzOUW69yTACmA0SboEfLKAAjXPlcQEuobmzwoxVlLa86coxLAK
	jWqIoqRAZcPvOUZjp60mhf0vo2m7MwqZHQjCAAea41NVXV0gNsV3+mYV6a7juebn
	Q1e8u1m1fykla8BWGQ34pI/KELmAzwoVFa/8QojmOCg1Tdfe14ksTEYqRL2WRiJ+
	m+KCzfY4mcKhNXla488Z9hcOdWAKCUfOBVWopMgNicl/fchUoFzVvI8Ylc3ulmrL
	AqH9GBHNEqleKBSMyvaJQkht4c/lHk4l/6qUCqQUZUJzL7SapmXLGVALavT6F2+s
	fPYmHfcB033LCnt6H9F2wg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x039ag05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FEgHYU003739;
	Thu, 15 Aug 2024 15:04:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnc7ka2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8NwsjTujiaatljV/Ed0EYfKJ2tIqgYFFJYRvnbcuiuw6mXrRDP+OqCN3YTNF03Gts5+2zFRSOly1dzPyw+EdnKUGzlXz1KIYshJabsUZVbFToScKB33EmaWc+PAx9pVza9FBi7cv5ueeN7wutNIIE4UiKpvpp0tQyTw8PHwyAd7Iru28e0JSaszfRHXzA9TaXa3dJjdfXKWbDtA9K84480zgp6Szl9CmMney6aatn4y6oNrYERSpBNQX+1Cs7SJ9gqc8efU9y98jglSKCXvX0msc+4ksj0CBNnlZNZO1hvRzcq7+iJQ6WOevkXQbHI9N9qI6yD7eKzfdlP/7uVxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=HF964ZbDYVgQXqbvNyIoXMohnCavrnAhYljZ218w7BOZEiVo54yWxJZTqyYwzfcE4lWlXJVuTVtG+Sh2cd7mmv2Ttz/MPrjfe6IJ7szVDatF12poZfENWS11rXE1CMAZOItAYU1MP2WetIFQlw8VqfKY0x5YXZt8wAPoZUJWaOl1bUP6bUrfDIWU26kzaAw7lYGIO/VRe404jWKgTc+z3lkSmOk7xqEQLbAZENnpzdGJZpyoObf1EohJo3+MzNbDsSFSToRLu3zRa1BKLHVA7FItHDvn8WeWm8Pcrh4uKMj9TGcgrTqsMUxoT7v+Q8Hhl6EQLThfxz8GD2Ka1yL9jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=ak1aFiGJx8lB+oOP6OrjilAMjl5xpWx3DNQUwnt/gYbwUNdfkBF1TZLHXu9IgpjhR7tVJ8jfb69Jg3PQ7VN50XVNzeEdppVuGk61cDi8kDjabCd8Nl0IHzOIrDTDjzQdbVJB9CymIaZS2ziryFlyEHnddpntl7WN+h1Ugs2mD78=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6657.namprd10.prod.outlook.com (2603:10b6:930:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 15:04:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 15:04:13 +0000
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
Subject: [PATCH v6 4/4] module: add install target for modules.builtin.ranges
Date: Thu, 15 Aug 2024 11:03:39 -0400
Message-ID: <20240815150339.1564769-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240815150339.1564769-1-kris.van.hees@oracle.com>
References: <20240815150339.1564769-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::11) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: c98c1f42-6c48-4c28-a4cb-08dcbd3b8616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cRxNxB2DmgameLUGtpYiXs48PmG2YJH9+c46mPC2ubK/A05oU3TstsNm2yNJ?=
 =?us-ascii?Q?x1R6qczUGvqOVpeLEojRJNMMdSQXGtuI074Eh7Mkxk1Ylw2gZeAH++WdoH0p?=
 =?us-ascii?Q?UftUW30SdHNBeXus+Dwjs4/1zVQ/dUObMZeFelCTAY0862TEi4JnR/Py6+EQ?=
 =?us-ascii?Q?P/BBxPe2gL1TUJGSsts08ytbv0EnXADJttIjuxQ0jfFpNhKE5Lw8NZT163CA?=
 =?us-ascii?Q?CnTP1Q7NWRZ8EeDgUYmvvoc6En/qzquUf5vOXAB7NS7wfcMlOTw24yjtIY1x?=
 =?us-ascii?Q?kITeKizF1IABWoMBB2MVF4REr8h7g2qRsfyYeb140gTZDYl7pYFOrNImOysd?=
 =?us-ascii?Q?d08hn8Ke1cxyW0gerwdIq5w1xd5nBEybLy7YKyQleILRHMBpgJEj6f4o3jb3?=
 =?us-ascii?Q?dXPJiA9zsqS7hLZS61zbp14RwmMUZDbcoj0er1V31c1865nJMiqRd42+C9go?=
 =?us-ascii?Q?miITpcOaJYodZZupjz+kg6u6Mor2ecSM6Bxo7Sf+EBus0zGaFYuHD3m+3dG+?=
 =?us-ascii?Q?eFOZ7Se+U6MoaPN06QbJm2etrrI+GULtNg3pBD9V28prMKbe2moCiztOWCDC?=
 =?us-ascii?Q?uUrzeOAe6oOwg0awb5K40nDJkcjV7ta1sEGL7tYnG4EjwY7Xd9nfCcW44+Ml?=
 =?us-ascii?Q?ZbPzMuw3mu9/daFWGD460xYCX7OKUXNPJGgIBVS/RXLoBoVIuMu84fYJDJSS?=
 =?us-ascii?Q?ab5kTbacdXg1VwKVnVJ9Wpn0rQdhtHNiUSBBezf4AKcq0+wV3+nM6nMKuA2p?=
 =?us-ascii?Q?Qb1VDgjIw+AxJ4IMEGGadCbUfqPjy5Xw6Ee34KtGisrb5q9f2mntD/Fp9KXs?=
 =?us-ascii?Q?iRTCIJKvfJe4ivVKGm2rgEgPiNGcp7B1kdwGPo9oMgtAhWtfwfVi3gqiLeEc?=
 =?us-ascii?Q?GLDptJNDUQ4TT4Y8TDqqxr8DmZtwnlgULnrj6LmcvDtUc1GYZQmM5DcO7mvb?=
 =?us-ascii?Q?oo9YbDSkXq7Xb2LsaAvBz/1YmDeAh8v0m1mDSNodNaQ7wtHVDMamgXOAyLE/?=
 =?us-ascii?Q?bx6l6S7NGV2g+UneWr4eFrH6Ju77VhZ4QiAp8Puda9qWhBQx29RXhJmF7DC/?=
 =?us-ascii?Q?Pvcz9ZdmKLtatYUO0s24aDJcIhnbMDPqZRC8DMkPNL0FtbgUyR9+Mi0uJU6z?=
 =?us-ascii?Q?C9MWmNTgL3AZkdsnTOYigKo2y2yEhQmDYN3B7X7dEU+hlql+VkGZ7IfiSekV?=
 =?us-ascii?Q?Mb8hoUuBjSHUnGYW/LpG4aDCI70kR8mprwHOnmZI/1yqXaXr4oahSm7jy0TM?=
 =?us-ascii?Q?OlDykdqJL6/C2Min7yuRKWQ2xbqOwWLvAwGunkr3IrpEh0LcK6q4aTkIAYNh?=
 =?us-ascii?Q?vjODzKr2NX7GTCDRDVostbHUBZNZ2sS4m/zkXpD0ep4AEA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Inq1VPeIGcJslGfVbwugX2nDnVo6FnLGdIT3TyQV7AP7oqJ5X5Z5iolsq/Zh?=
 =?us-ascii?Q?kQXVKQ9qT2rXgxqrqlJJMC1RccHjDd9qMJws20QU0gNbHEGrSOTkrXL6DLWO?=
 =?us-ascii?Q?WJT8ZbXW7vqoKQNPjLc+JAldog8gkcbW/nOFkCbi1zpdxM4Nmzi/ERDtb7Ud?=
 =?us-ascii?Q?gGIN/0d7nJf/ROxZIbqM2QhbnbRwMg+8DitE9dE/6C3N1QzTUCfnzOIzYVlb?=
 =?us-ascii?Q?qUtcAwZ/+672Y4SrWxSDiX7gzA+pNZVg9FVpCwACYCHR7wERMFrvt3M918yc?=
 =?us-ascii?Q?DPTw2U0U3Ikpi0CJ/XP+0l54jQai80Eoev8csE3xYiZvxN+Z37TIUn3M1O5L?=
 =?us-ascii?Q?ftrjpD4c9UmuPjr5SnBLRxwitj059V72SSikcUSh8h8dCQ9QS/PlgSYaGbhT?=
 =?us-ascii?Q?7Mcw/bBRV/mhl3M/yCp9Rynyk5jxySJKZqTjGAwKP5I2yuxPjK5Y/rTbcc8D?=
 =?us-ascii?Q?r2LE3SjOgqKhxEefjTSn9hXwN+/tMJU/iNfGqp/gfYN/LunWgx8DqZO/qYMU?=
 =?us-ascii?Q?/ruD/wCIWrf1sX0IrCgoByjgC7PNXakJRaVXWAslXD9v8zk9Ns0cUqxfDVDP?=
 =?us-ascii?Q?5Nt8qdzt1uzB5QQPGLzjhH47E7MBkR2XQMzHbKh+7MQRUenpI+R150uAZB2q?=
 =?us-ascii?Q?kDni3KUt8eBu0YR1ot9qGFodwpV2u5+7nVj9P77Kl4oL40BnAYveFTmoqsY3?=
 =?us-ascii?Q?2ZZleiBe2YK3FGu+cperRc6B/RZvdv3NhYuxFVeKa17MichFHwcDBW7hxyWz?=
 =?us-ascii?Q?oAsijALA1LnISoS/YQcaq944GM3u8QQv8E5516woOz9SOXA+/gEYbG1VACEI?=
 =?us-ascii?Q?LHy+tGMkKcfia3SfxIY5koKMlUzT20/kDLqF8UjNwBtSfFPDQhWFl7DgK/7I?=
 =?us-ascii?Q?LHMddwRZ4Flisee8f4N1Pn7ptGXLcb76YOQ2O2af/n/8x7gD8f+roAZmZTuf?=
 =?us-ascii?Q?K8715+Kykut7h7cx/X0UpiZpTSXoOiTc1JN8ynaSXaGz2IenR3KxJ9Gciqft?=
 =?us-ascii?Q?h+ikkAEVycNQut9VR6SsJy70xQ05Au7DlUX1v0P1hDVKnY3TZytA8BM3nIXr?=
 =?us-ascii?Q?duA/yuX4mDRwLiZwopyH7wDMuGfMk+nsTWZGPhIrX263pTDid2GOjTC0YFnq?=
 =?us-ascii?Q?fNmHbjq8+PvQU8SvfFxolKXYRY/25opsNjC+GUw4c4Cy2h4awSxa6NjmGVln?=
 =?us-ascii?Q?KZYikjoAje/RMLeAP6u/zGfTkdZ1nJU4CVEzMk1v8j95lrk73MwvAP7FdMam?=
 =?us-ascii?Q?dPiFlPEXrTd+XmUajfwARiTJ8yxC/yuz9lPm2rUKC3GOXPc1l0/1uPBEzpYK?=
 =?us-ascii?Q?zJkXHz+6FjO88sd2qlHqE2Gn8DneUhUtNH+JXAndmf7KCVwQG0dELLOlx/5o?=
 =?us-ascii?Q?xmriD4Ap3V6FeXgRPBHmYGj8V7WA8nvxIBpkYPKejNyM+e1IWLnzrKzkBe7L?=
 =?us-ascii?Q?RfrRLdpLYSRY/uFMlVBtl5Pgl/zk+FydSex22Ncsl9vroCBhVqwz2/T5tE3f?=
 =?us-ascii?Q?RBpde2S+8NvhGG9PrfGw6JYXn9q0yUjOHcYCYZV6nP0iY/32WeTDUXC3CZm8?=
 =?us-ascii?Q?Epy6oyFSj7HRyM3alUIMCVQeFVn/1/7Q+2YB75nPfKyKH3pR1z0ZE1uStCyp?=
 =?us-ascii?Q?DCQd0kMBBiAE/Ep4M4/O4uI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ODVsc19ibhLrQxfm+SjEcQfzlIzk3SNJwnQ1/dZPqZ4LV4uKTihSf/vy8fPMnMznJns/YGO9Nxzxa+ZNBLwcd2OmpepIR0KtbxoTECHJnqi8iYooat6zAB7PB0lLT5gQRj6nBS2I6AlVTJ/H19S81xzswODyOKUrFuQocGidRXIyy5BhSHyz1vZ1lnYyJMWT0irpspXyvLjOFksh+b2dRtI4kKXSTLjHdy7JdSztfogCAYI16WGoMzutXktBxlYIyKqRSclGD5k9ZAnp0DfGg5TiJ/VqPND1uqG8XGugk18yfcEu6+NPjcKLBlkhZ4LujZOGG5EAV9gMJZozlNyMfTJLwlnts4yP25H9XNYSIWTdr/kSlcW5yDQkZJVwGSrjaGCUd0KnsWhf8km8VN9f7cQpbXg6DV4HhXCv0jiyr/SwaZ20Tr6CEzP+snJS9FYPj+m0oEllxWCe6gTxDapISN3JjL6lsBirNr4lzQ3kwUbnCf9m45BvdADWc/Up9got/TVbTK6BFhEqdfPaO4krWTd+lG4I7tALYhQUCJEd47lQpzjn4ARtFGdYO1dTVlAdbv69owmpkwMB8dQKIwCW6lidNz1erBJ3Tar2Fy/+Zd4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98c1f42-6c48-4c28-a4cb-08dcbd3b8616
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:04:13.0923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKa/zpmBW4IWmH3vxcWH09+Ao01i9uUtSPuOFfbVagi46xNXh+SDz4pQFBrU89FX0ZtwJyCU2g6RhhW9h0hzIN/WgEGtKtKu2slUH/SHtB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6657
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150109
X-Proofpoint-ORIG-GUID: VYyLpHOSjLrqggb0GtATgjIBuowpAZJH
X-Proofpoint-GUID: VYyLpHOSjLrqggb0GtATgjIBuowpAZJH

When CONFIG_BUILTIN_MODULE_RANGES is enabled, the modules.builtin.ranges
file should be installed in the module install location.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
    Changes since v3:
     - Only install modules.builtin.ranges if CONFIG_BUILTIN_MODULE_RANGES=y
---
 scripts/Makefile.modinst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 0afd75472679..c38bf63a33be 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -30,10 +30,12 @@ $(MODLIB)/modules.order: modules.order FORCE
 quiet_cmd_install_modorder = INSTALL $@
       cmd_install_modorder = sed 's:^\(.*\)\.o$$:kernel/\1.ko:' $< > $@
 
-# Install modules.builtin(.modinfo) even when CONFIG_MODULES is disabled.
+# Install modules.builtin(.modinfo,.ranges) even when CONFIG_MODULES is disabled.
 install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
 
-$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo): $(MODLIB)/%: % FORCE
+install-$(CONFIG_BUILTIN_MODULE_RANGES) += $(MODLIB)/modules.builtin.ranges
+
+$(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.ranges): $(MODLIB)/%: % FORCE
 	$(call cmd,install)
 
 endif
-- 
2.45.2


