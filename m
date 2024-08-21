Return-Path: <linux-kbuild+bounces-3133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5107395938E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 06:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6139D1C20E76
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 04:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E751586C0;
	Wed, 21 Aug 2024 04:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C5uJmcJM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hOVwphAH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938413D8E;
	Wed, 21 Aug 2024 04:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724213481; cv=fail; b=UllWpCuaj3eBSJzC1MboGmKf3ANqfjfcJseumH4QAo3PxoYVklHGhDo9v1ZChxYEZlYeuUQ6S4Krme47VN5We+63CemgpA5lIOgJOEsR7lOMiEnbLD3I6/WO0o8lVxbe5jvEFeM8ru4dk5nDvulH7/sn/gx/a12+dE+Zy7be7SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724213481; c=relaxed/simple;
	bh=YrmsrHdvhN6Bi3OLDiVY61cRYA/t9f/Heq9ACtkmqXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hbXngDFsYKtAqJ4dgv0IZpb9sQXwOzZ0CWBXOkeAD+tfBbliSQZezUgwqMM3WBOJuefb9nB2SSOF8/AhCOCdpJht9wzoLRDkKQU9TpKsAoai10Vcz7Qf39EB5WtGLl/cP9CnxglEUVXLd7jFyDr0yI4ReqCXcGWxHU8k6n8ToRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C5uJmcJM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hOVwphAH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L0tYkx008398;
	Wed, 21 Aug 2024 04:07:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=; b=
	C5uJmcJMySgzxhP/9TWfBA994Dto8QZhwV0fJ9DaE5gcs0eGa3hCpanieea9qAtd
	CR0eU+PCkrnlbt6/ahuRJ5YJp1+5yVQrPq2jRou1SRYCZOrJIXPK8USHVJ0tY6Px
	yiWtlVEnbt+3KoW6grGtASspw8zkYx1H+JyTxBf59EKL3l1BeeY29/X0nwwWEkuy
	qMjJn4UNIkSGes90XmwVhQaOoNBIZuKCk8X7R+1pNvzsPMT0jl1WL4r3r99usHYd
	KBRRnSmJLJ8UuamLK51AhreB6ANw/z1pRh/hZYmMARbB4olHwZpffyNgBiUYcLRL
	0kf+Hb+oUXnzQvXqxpAPJw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 414yrj0urs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 04:07:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47L2pdia036843;
	Wed, 21 Aug 2024 04:07:25 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4157tv1ke4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 04:07:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEwpSbHLTSbZLoWKoN3PFbcLuegaOrciHZzbK+EmZix2QtxBglhofWwE6ZDp9jJzax7Ey5yDX8hjSxkrqncyESi71QariSA9SbL1m1PqMzSWdz2ns9K8J7Ml6o/kFK1Ug/nQX0uon7ZEUdzIXEcUVMwiCIFC34Sf1B/T+FJ1SZVAz/ZpEJpUiFyGxxQ1IQMLGANIbWECBR7rT745siVJf4H0L/EsMeDVVjX3rcA9YCco7qvzn48Jpvlo1bf8j4bMqB4DLCpe5iaalU6OccfDBFgENcyT23SG08LxyJr3ojMVwA2a52iLBBqnyBDHyFQ7h/0eynpc5cOWCTX2+LPppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=S5wA/fzhjLckL71nLJVPNDFjWnHQ1dJnG+pKTkp6Nz82WJy8W96AX8wi0bGYNkQRTTZYAfVf91THC9I68Kx/x25giNvYUua0tzLfM6usDlQtp3eMDxWFOKWi/Jph4BteFDysunTFagfAVYCWkj+TOSjWhtBEEKRfSfPlQe/MZ4EWesM/3fLJcB8XBifN+hQSp/p8s4PrNp3OKcbEm0LmLjWdi3AEI7cY31A+L8GPRKMYKW0U1OL0NwoFa5C2dW8zIej7cx48FqeVY6UjWEA6b8o3oktzH06Jyk/II6QZ3Cn/UOrgK6zyKdAM7b7dKMtZyd2mlBYNDoSxezTo6DOBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8mEcHIT6tdZ0c01dmwaG/cUG0iTf3Q7Vxz9YBAujs4=;
 b=hOVwphAHLvXVpwsBayNvW4uicajXV6cdlARfMb3I4nBrmGd1WEOLdXao3W2AnrYCzeV4o14bdhg7jllSbrTRudD+ompOcwlgaBx1TcTVVBc/WGgwPjXs3JtF0ldK1we7JUmMkniwwoFG1Co6YH2N8wvVjisZ/laRdYjWgnmq1UY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB7481.namprd10.prod.outlook.com (2603:10b6:610:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 04:07:23 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 04:07:23 +0000
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
Subject: [PATCH v7 4/4] module: add install target for modules.builtin.ranges
Date: Wed, 21 Aug 2024 00:07:00 -0400
Message-ID: <20240821040700.1919317-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821040700.1919317-1-kris.van.hees@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::7) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: ee4246da-b049-43d8-1484-08dcc196c29b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?prda0MuP4Y5LrfMB2K+H8acMNhDC+foTaf1Od3Kd6UMpqrD1Af3gtUHJogFf?=
 =?us-ascii?Q?2U4ayvgeFpVRFMqsVBDNe//CWcI3orbuHBCS9H4MzN9Viw0GCo2SXz8xtEOX?=
 =?us-ascii?Q?Ivw7Q9iWJfuiRheTriLg8r+oDAPVdcSxzLhOSRHuanD56hb53AZtsxQILtC4?=
 =?us-ascii?Q?bl6nir3+V8lsGxg90xNYeobi4dhafI1xbiwl2vtHGhLoywei6trdQLB2bZAW?=
 =?us-ascii?Q?U0laUH4ke85aHcJ5mMDy/tcJQLBy3vMmBdLy7qxvsmWtc2jGmYjP8ZrEotfD?=
 =?us-ascii?Q?X4Frm1XD75o5MGnjO3aG3ITh8yamijGtkyamegXvUjUuMOEamaiAabiaLgxY?=
 =?us-ascii?Q?5jLPO4x/aiztXQSDdOIX0MlqindefkJcVZmm9/mQ6Ntj769LU4u1+9kqft2M?=
 =?us-ascii?Q?HQVPuj44OvQ5KF+jyxTCtbEKe22rD5Up8MiSBDWAm/v/kCxjm2WStshaO7lZ?=
 =?us-ascii?Q?YOa0mD0FHoWmVgGGe+diiGK2TK8Ue+8d5BIVJYJOkduVsP2GkDoP4mXjj8ZU?=
 =?us-ascii?Q?Qt0OEY4CyPdYPVv6BI7vgWp6MoNb4pXSnpzWRvmNNIHO99OOoxAZ142/gAD3?=
 =?us-ascii?Q?2SpUoaoZuHwVJPvjvXNLxnTFV2MlwUr0XJS9vBUIeRpqttGp9jn+RrtyGw65?=
 =?us-ascii?Q?0ZyEro8CtRomCoLYTpU3V+YmGlJzBrcsthO/BYAaX58y4SEBeAy/Gv7svuiA?=
 =?us-ascii?Q?TQvsWerL5vh6HCgeKCvvLxoZHANh8ClDd1qncuczDUmlfhje4HO9wayjWNM/?=
 =?us-ascii?Q?IDonoWmc5eQGapnuWhCb+0Lk55rgP1wtPmZA1x9b+tbt1q4zlB3FhwrR8GQH?=
 =?us-ascii?Q?bE8TMHsgGKifYFIzqH8Q9bsnnotC/ZNDEFsoyg3/TY1OYH5qyOy84qd2r019?=
 =?us-ascii?Q?Eo9/M4LFBU/xhrEeBZsjRmJM8yL+Wehj0befG//uSS9oNlC3/wLmIwbO477J?=
 =?us-ascii?Q?s7VV3ss4yfCqHAwHO+ZuBWpk9ttz6VjBsyh+tluLSBcXFWHblGrdeTmhjKhG?=
 =?us-ascii?Q?t8P9UWiHDLxqqCMSQtSI61FVGMmoNkP5YClcwGJKa6ly++L+dLkvDhaYGbqP?=
 =?us-ascii?Q?XxyRqRrr2Kgk0lpVPMuLzseJI9g6ZCnQWqdRMyJ48spTHDE6vTRLN2NOYmSS?=
 =?us-ascii?Q?xa4/13gK58xLO2h1l6gWFb2eTYmOVSrvpC0YpLxmZmkHvTpgMjkjSDkqUYT4?=
 =?us-ascii?Q?qhZwickjUriexTDOLQ2IoRpwXo3R1UQyD69kh/rrBcKAzNSijCB3CssjtP0z?=
 =?us-ascii?Q?miPABMKXbBtBD6u7JZRcK0N0dVO2YWpL8TXhKGGfN+CZNClbTdMZcoItluQv?=
 =?us-ascii?Q?wK3YlJLK3Z8R7ohR6IssvVEG25APyAy3EARUJIhhp/XWGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TifUbLGCyJva8wTxgoMOyi+ulFoVSKEhQWlsRLCvojWc5XRgPUNL9Mcsvxh/?=
 =?us-ascii?Q?n3l1lT7ohFgIDFZQWA/fGI13g3jY3Q6O2ao/Yvc6nkzRIpAI7cJ2Rf88n6wZ?=
 =?us-ascii?Q?F2dvy4K5T24O34MGFlxxgCEw1Ma9ApuGv2wMAjsCv77SB93X8nJR9ZWDQ5iM?=
 =?us-ascii?Q?5S1xveOADyRE78mEcDWYoR4R8a6N5xjqO33KGCAEuKKmJ70bes/aXMP9uPhQ?=
 =?us-ascii?Q?T82DTKA62VtIR8P7ZKfvd3FM8tbDJkTT2IXDKSdAmALU/4PMzyj3Wlk6UYFQ?=
 =?us-ascii?Q?uDPS2wIH0OQEPqsyOkLLvtutPEEC3L2m1pqWG/9T0X8Ba2oVyY+KvB2Z/h1S?=
 =?us-ascii?Q?fQW5g9uv2joNjOUZ1KknxR8ZtkAVV98kRYoBXz2DAlFPgAyDHnf5KmV2D0ps?=
 =?us-ascii?Q?NIIZk6m0bPbLcLsiR3yEBg1J5EqaczGFGIbFvWsOd5E4Fvjzb/Ad+20x/LGT?=
 =?us-ascii?Q?RMuloezcFKUwHF2HemiA+U2OXbcKWSRTgE05IUFhySDBflXUFOP58v5HSl3Y?=
 =?us-ascii?Q?I3E+L7HbnBB4HC9RIF/fGBhFqFPE4IWzLnZNCbSNaSf0Eatygj7aSTJpg/he?=
 =?us-ascii?Q?7KND0LKA+M8Kgr7v/Pnq2DQOQ8cXHlsjKhl/3DLBxkAHKuXnQKdyAtcvJXjO?=
 =?us-ascii?Q?5nL4QszyQsyAJQoRLAkoJtZSifimbIJ5W5IR+npk9fm8kdvWxw2mGcU24m6Z?=
 =?us-ascii?Q?uqNgODXcECIIOlOAGTbdDdwLbPWs2xkKtOmODULT2EMK3Q0G/hpWMgznSOdZ?=
 =?us-ascii?Q?k/85FUhTSlKUzeHHLlhD6uaQZW60AeVEkZPF1aqYhsXodxLXSwqkMPeSEI5i?=
 =?us-ascii?Q?9MrXgTCVGES2pDzo9uAH9ooGvDHROO5Mn08Uut2lclmXHlo0ay/cH9hxo6oM?=
 =?us-ascii?Q?cdQsZlDcaXMHM1M6swCa4tpsGtLEw6lB0f1UZXiCE+OgVxmDZ9uKHIbfLcty?=
 =?us-ascii?Q?IJsTTwV+40PdOycoF16YXTFVyi2LWFIvlbDkoxWu6aZU9LRzAPcEFtQWDwrY?=
 =?us-ascii?Q?qjLfFG3aFlx8G1vJfQQKb9CyhbiCEuOISydon5p2d5wCkta1eE9nxvVMm9JV?=
 =?us-ascii?Q?fNcD5q8050D3BYBUiE1qOZs2D6Wim+F3H93fmODjxRCnQZF7Evx1gNTlSyUA?=
 =?us-ascii?Q?4Rl7VU8vD6wvN4IwkjLfb6jbjhG7W2BHcBzLatEvtZ3CVLh+nkgePH3P9+Tm?=
 =?us-ascii?Q?kj4vCXxHd3XhpgjDxD6R6KYEJJMIdzAl4zYp9Zj5y8XGxq8+3/jDFhRIz7O9?=
 =?us-ascii?Q?GIvdDLKaO8/oM6z/S/7wCK2w2m2b/CPYMrZFexqqtIJqGkwbLYcNX1N1MchA?=
 =?us-ascii?Q?df7xabwKv0QUnxkAYu3RgTFJvVImebPeUABMKH3OUZ3qcd8SUEwKhv3ypPVj?=
 =?us-ascii?Q?SJjc1QAKScp99XFLp6WRP2rfp08TWrX4qjXLfseHIQ1dBWHysTkq/Uppklnd?=
 =?us-ascii?Q?YWeuk42Dx+JmcHmvpdo54Kn2RmjNX1YrWwxN3KxvpIqrtSrcdhrhJaxIjGh4?=
 =?us-ascii?Q?BBZL0Upbxlyp0tcMHVMN3FCmpfA270zcGUY2f4s3rcnFFsPkJxiNIi5npwro?=
 =?us-ascii?Q?6nVJI7BxZrXTAxmSPHRmD0Pw4ADqElyI9ASd9z8Bic9RuAcXfsUgBInBBGRQ?=
 =?us-ascii?Q?4zDT+HG32GUvqZAjmM1OJPI=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ArvhcTLEH7/7spLXtQxL58JF/AqjWTBY5Nh10ZYrv+ZNzE8dOOEFOWE2W7YdX0wm51uCOhWCnOUSmfe31PaQBSO2ozasCE7P+/EOTYKby+TmgQekKUZtMgQR34b7DR2bXECQN7oJGJpBQyiXu6iMztU/gtAQ20UVJz6M+AYRH5V38nwrQB6EpnGfw0gkQm5JjMwMgxNEmSJ9qv2+ARlAMIdJx4X+A6xz41c4L38a3SE2ok0iSo0Zsh0Fc7AX+vRXSksV+YvCsty8zqKDhDt/qPdHXJ0CtaOHwm4G+oWIfvhPaOwoI4van/yq00xoMjlZbY4bLmc67+xDrByIU8g8aTTCc0U6Yn4NTNKuNbcNk8TOJxyiZzjNYiqlaBkX84D5r0eJtef8g1Bh5QFQGGoy7Rsm3ovykEXlM4/YqfBDBWUCcs55h8n5bfmmbmGaZqCdTSyCKQ4Heff+XLcLY81JaAGaEqxfFN5zZNhtiJxsLASN6Aqf9DlkF99TtEL8efrT2fbQUxaOLKySuwljAXscD+Rj9gi+ClSWlhOnhtkhbnqTmwvGLYcIsgzg6ZMXdSMW8wgIIThFDy9D70YL0h/fzewI3kCvHVO0F3A196Qs9+M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4246da-b049-43d8-1484-08dcc196c29b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 04:07:23.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DejU4Yc3BEH4x4h/EgTIQ5+yFuoxDCKSORAb97/QE2dwGo8s8v746HTptFUfTia1ug8RqRe0Fpv2ab3Glga2eroXID+DptWq2Vqi4RFiPbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7481
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_04,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408210028
X-Proofpoint-ORIG-GUID: Of3bIGqZH23vVpz3_edkmeWMQ-etedPm
X-Proofpoint-GUID: Of3bIGqZH23vVpz3_edkmeWMQ-etedPm

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


