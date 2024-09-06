Return-Path: <linux-kbuild+bounces-3433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CEF96F736
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 16:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0DC0285636
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 14:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2904E1D1F5C;
	Fri,  6 Sep 2024 14:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AqW6Czgq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bWzMclal"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5A1CEAD5;
	Fri,  6 Sep 2024 14:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725633936; cv=fail; b=GTCm8TTE17BIBSt/JlF1akoaHWBqz9NeJGSOIttuMG5Fm48extHTCdfGYefAAayWdcgED3rJe7lYC7y0c8aBICNahqxgXX3HRplxYSFYwvSZfvMEgrWESO9VxPdqkctn+8jrQyPVvBw7WOccEAnW2NJYmqfSaN4Ap+4mZ1KGLqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725633936; c=relaxed/simple;
	bh=GtNCWN2uAj+dt3q3tMiiL6qzn96CBxWLsB83h7Zba3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mzX4p8SyrVAkewg891TsU8tn990JfUO3L5793u5C7JrEmuQmVzln6kx8w27XGYmEV5m0opFFLE7fA2+4mX25DA9Afn7Bw/uOpI7Mhv4xIXqlZyD305J/2P/rTynwjZukoF4fq4Ug9+941S6Cemv05Pr6rY6tPWEK2VQYdV1Eoxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AqW6Czgq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bWzMclal; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486Cv7gw029038;
	Fri, 6 Sep 2024 14:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=XJzJRP2K5hCzvmIK0haJONrAUZcJIBFI1alLK6i4dok=; b=
	AqW6CzgqrMyeKXf+fhpDpLHtTX536OR/Te/hFW+RNOuXQ/5A7JHAJz7zy6rvdH/G
	SmgIO+EK7uWytPjQHQtG/ptWla6tSsGlUe1atEEx8IKc1fekat9HGVbdjzeYQruG
	VUXyat5qGn9d+2bYXOZTTt1P82XEmwi4RkoZwRHbNI/aN6Hqb8R4m9tSqFmbowP/
	daO85yXgp7rP1Jk2J5M2afgvsblvd9P2YDveAXJPzJSNUEpEp+jDf4VLKcE6O9aR
	Zzmzom0IDPM5NV0h+mBGkEjCxio4yrFQzeyHilTPIxNRdN+XUfN0Qe7GeO9pZtD/
	GgejaKL2lfYYrQEEMBHBjA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwk9t3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 486EMm0p006566;
	Fri, 6 Sep 2024 14:45:21 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyd1hfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Sep 2024 14:45:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjUWR8PGj/HQW+VN92rpSVHoBgt71m066ZS5vSeI470nxwqrb6SenFfLHmNORMQWjxDa8pjFNuWjvSiCUrAUQag3o/ixR+Oq+T0jYOAtKPNXkP+FTrPyAWUtnRneRtTo8uqeAK1g2z+TYH9DTbYSm3L0j4mWmVSXtzb7nS+cIjdG9qzQdQc7RI99azY98LzXVb19QufTAgDi68RS1wxfuewIGsEUrqa5x4MnOwBGRPfFJlutLR7vdQp5r6iCYaXHXeYDWiDG7GvQhKmxOeVSyWomg8oJPBp+sZfD0Mv5aV7RWXHGZ3sJx3yV+3249rJqByeQpiIdJLekwck3tC3u2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJzJRP2K5hCzvmIK0haJONrAUZcJIBFI1alLK6i4dok=;
 b=rt7r1lCnlRPUrrlvZy6edvFiqDm4phfCMWBWfplZZuyFSo+3tQIfW4ljB25Gm5RMvboFijnUiGAcVqV1m2D0JbqfcIrCd23yZxT8UjuAWlPlVhmoxjbZ+mTSlocgM5r1LyaP06xPWpjdUxYiX4OzzSV/zOg9l8HhCVY7T9cSfzp3clWTjU2pfuRUBE14yj8Wu22OpFOHhkiSMoMv8X5/97k82Ovsp2j++GUzOswpW5WE2CKtLA0muXUhwhL3To7fhRpojWiPPnsnK6csgAw6N+r/R6mR0km5mXPQXcWgUoxf42SkqOjBXzls3pj7A51dDSCMeW/OMpjkPpBrHSvcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJzJRP2K5hCzvmIK0haJONrAUZcJIBFI1alLK6i4dok=;
 b=bWzMclalYBW3xhjErSbjQewV3dkqrSpCymPPWO7OHxeNfOs0Pbji4GFEO5PQHmxZxCyn1yd9Y2Pzhir/c40IlwVuVIfIuBBBqPU4coDVAlAIWxdPFHEmUcD2P4YeshHhA8mej0UedgitNMrQVvuFp2ik3Q/O6OPq1+hvLMvuWMs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6752.namprd10.prod.outlook.com (2603:10b6:8:13a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.12; Fri, 6 Sep
 2024 14:45:18 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Fri, 6 Sep 2024
 14:45:18 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v10 1/4] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Fri,  6 Sep 2024 10:45:02 -0400
Message-ID: <20240906144506.1151789-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906144506.1151789-1-kris.van.hees@oracle.com>
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:a03:117::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc34fe4-1e4d-4094-fcf3-08dcce82869f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H0Toxe9PHMx6D1/b5MM7qWXhwxYVeBfq5D98AX/PBfjbvpGNMPQ2DhNRbreu?=
 =?us-ascii?Q?3vB5T/DysAld8fK4utfwVWMKgLHV+3MxiEASqehVqXot2u9LzHzB8oRkizF+?=
 =?us-ascii?Q?c61/64mdaB93NXGjbbRIBCbWuJODav8liOYOOYNEfeZ0Pa4LA0VaAdbki8dw?=
 =?us-ascii?Q?doTCdpeFoeJAaxNphH4nKMJAbtvvyLh7CkEsRahOd45XQeB/4/KjssD/HrBs?=
 =?us-ascii?Q?PKzw4qbfavT/aEbS/P1JDDSGWrb1fscsrydzXHSq5gGTSlNXwrqpkXFKhiYo?=
 =?us-ascii?Q?1LvCETRGsEGDI8ruvsvT53ovOn1tcc68fZRGSJBWQ4oJImwrbqaTDIqRrK0o?=
 =?us-ascii?Q?ijIocMbiscpy0KEWCU0uTf0J6nQ0DJ2nf8iA9dClYF8eovPsL6LpYWM5TZx6?=
 =?us-ascii?Q?1PiIE49JRUnjiMamnweL4qTCvfG8mAoz229bammEqSRsDA34D47suq1Tibca?=
 =?us-ascii?Q?fjKL/k7zypmw1zP//WYQaO8NOWCl4xQh0LXSAk4A9dMlmGvgWeNijQ1jois4?=
 =?us-ascii?Q?xZUd0sX3iDMBuYn3M2RLqe7ofTFcYkWRajyp5ASZjjE8YVUWUqVD//fKjvP7?=
 =?us-ascii?Q?wDb0U/JVGBckFPdC/PDDZ2DapSUZs15Dq48diymIjaxqNbmPZVlxnn8YNFst?=
 =?us-ascii?Q?3JPHIB8g3PVxCFVIK2vNBVxZpaHQo3aCUianCkQmYhKVz49qYD9GmwzKhDG8?=
 =?us-ascii?Q?ZT7R4MY70mEJyHdQVyz48EUfO0ixtPoQ+YTkf9FXNX1Z8Js178bfAxa2bIXe?=
 =?us-ascii?Q?dtI/FnD3sJ3QciN8ui6SH8cOpurO7NLnJAzkTLbyCg/0rwzDzf/BS//ybvdu?=
 =?us-ascii?Q?OKipewciYdKsbJUJywZjPhc9wUgnoP+dVpwDtsSXP6yFMXKsLvMZvo1/uPrZ?=
 =?us-ascii?Q?Bq/y4cVPSypChtks0bBtFxs5eEeB6SdD4W1BcR2Xy15tOaleVmck4fa0U8LJ?=
 =?us-ascii?Q?JBLE54xBD2vybO+x5egSbNHPd48LBFGkm5RcbRoW1ooPMujLo9SFpNMG8kCG?=
 =?us-ascii?Q?b0HZS21ljeG6+3CFNZabiy9bhRVFrBaPFruWFRM5b3BiAkUIFumnpoBxkKQ4?=
 =?us-ascii?Q?W74qTICO555akRGiPMQWsewRSFYhkmfGJwOGrSE1cHU28xeuhxj0y9VBAkSl?=
 =?us-ascii?Q?z8RzTi6NjCjGNXujxan3hKgY1dr9Tp1cUMN987NFPa5TiEwbhITGMEEcqLVI?=
 =?us-ascii?Q?VeeInw1XS5SAU4VP2s8keFJWB2YWQ2HvVAaoFemflucmE8oYwoCXlck1MRIz?=
 =?us-ascii?Q?punCF880NrecGX9zVnME6OuO8ZgB6cGvAse3J0B5GnffCfWlsNCmDbJXxhiH?=
 =?us-ascii?Q?8zhyJ6CDNQN5tHqC/qQInSBHYCkaERhc0Qiglj3Q424eLQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Jd65oWBSbqV+FHx+BrbBbQ/B5/7ZEVDQLh2/0VLavkwt93hLWt70GNQTQsk?=
 =?us-ascii?Q?jWM1oDitiqezzIh9tXsgkz7ccp1NsSYOvSCLKOFuRHVLv04Ym5s2KOYLBYu5?=
 =?us-ascii?Q?QMNMBjEZGYWQmrkeHrfA89b1Z18YOZkHQevSEKKFKKQWaRlSpzjC+Rs7z2Jw?=
 =?us-ascii?Q?HT1hLTo1VLt6wgidMg/g7fgDlSE4DxlXnm3HqojtWKo8XpLtQHLwwyht6Dr9?=
 =?us-ascii?Q?Pbu0fxknPnEBVsrDHhHZyuXOosNPZKET2L8QDQg2PZblcOLhnWttzZ+3SotG?=
 =?us-ascii?Q?Qj0kPdfjd2aWTWVp2FHCINwh7mfGBVq8/vN+pyv4oDmZ0gTdlu3pzCYGQP92?=
 =?us-ascii?Q?d19EXUVvMeymcEMljcC39i1joQqwsDJHqU2vKMnlCxgXMPBxdA1bRdzPKRJs?=
 =?us-ascii?Q?I+8nUtGp8nr0whQUGbf6A2pEvn3ZSe/rmpxpnFM3gUV371+vZ005MYBJbaZN?=
 =?us-ascii?Q?srs9RTRU6gUPotx+2/Gkzz4XiJIyE60K5uDh/UAG6DLqtdgcGgLZ7Z63AjlK?=
 =?us-ascii?Q?vmoj64IURXdlgymzpzJOmKyY7dJtGZerT88KpU6CTDXFz/0tOoGIhdi/+YA7?=
 =?us-ascii?Q?ubfQwnYAomYzoOrpR/na2s7e0/EVCcFiwXdCkvKOZjCBM9RYk5LvGyMKN0fW?=
 =?us-ascii?Q?RN943UPR+SHGooCOkt6vW3MimWBUPvU4/pYFzDgsW9Unp5HIw8NUVXt4sbVT?=
 =?us-ascii?Q?i1Tjrheq5fDwjWXFfEzOkFiaQCKjVW0CcA9mOVnfTx1ErsTUlokasSZt95bj?=
 =?us-ascii?Q?RS4fYaXSdQAw19e/ZJN0JMMYOUCVxc2aBoCoY+VGHKZ1SO8uBqlJkWQ/agDM?=
 =?us-ascii?Q?OLgTbllQKrYq0O2YjDAz8X9BVjq4LEOqgBdL+yc2jWIvae397ZO2B3sDMuLP?=
 =?us-ascii?Q?hglUml2kDvBbWwMJN0bLNdKs38x7TvLXJUAW1+oLFxmTf2i9J1hjAn1fS4tz?=
 =?us-ascii?Q?ZnsjgP+08SQGXrsWeSr7ADDb3SEINbL7GWx6qXfG35Hy0G9AGi7p8p2V23R8?=
 =?us-ascii?Q?Q62DcS0NolcRXEAlWrKoF7xC0qUCQm90PI51iP3jgUk26oz1+8sLiy6gObZ+?=
 =?us-ascii?Q?FULqo1/tA9U8tgjt4UBLdiwxYtLT8y5K5GzwPZcaxffUgHu1ynjeU2wvUUkM?=
 =?us-ascii?Q?4LeUHG01y0wLw8yxzpns4TraX4I3bQdLukKg8mnuV6SDprrES1+eN+dJ7CTF?=
 =?us-ascii?Q?3JtFN5FCry7gp8VkkCr92Tj6vykRnEka427S0l612VDB5wRVpNYy3q7EGfRJ?=
 =?us-ascii?Q?rVIWCIg1IkSLj7Q93liB2fEaDDNDx3hj76/W7jYJs5Tlh36QOo5gnH42vIZs?=
 =?us-ascii?Q?IL36JA/ZqDPqCDPlh20PVvLL8ci9CSClU80cWVL2cAKRgbuTPdH1aMowadcM?=
 =?us-ascii?Q?V/Hg6CQBPa32XUFE6eVg+z5a2BzVWVzJvtQUfYIYe6TkUQ1rDZQIRi4QKNr8?=
 =?us-ascii?Q?kUpOl4JioZcfV4zqO+1rY1hhqrNfM5ssNGWDDG2UgLlJ5U4vf7vv175891G3?=
 =?us-ascii?Q?OP8W4ZhsidbAiTB82GAcJsMigHzbxJMejds4CeI9t62jtnDjGZNslEC54XMD?=
 =?us-ascii?Q?IRKxSqvnbt1NZdqs7NJu76P5huAQGcoQPu4mD1IiuK8ZRZkzii34obtoIhpe?=
 =?us-ascii?Q?PEAEdVQWP3TNnaRWItq6RBw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bfOIntJPibemBZNLSJZ2ihh/zAZdhIy9oWKWxbS7WxLnyXWQYmXiKPkSN7iqFTZXCWansMqkesGiVrsTMWY3mJWOdRQH8Bpv8VSW7plI1PBiv0kEDmU97ow81dtpJxvIEp24577JRMxUBPmWmSDqx8xnJdG593L3kJb8wF/s/C8cxqaq3lNatZSnl+qqFXEcEcC/s2cYvL08fuO0OYhRp25H0YUByuH7f8maijwE3Z2RY/fJJ+ybJ5bRWppnkozmwevBgwlSb3sv/nFLH5tL6tqedfzFjlRMhKoxo7RLSydprrR0MVJ+F8ny6fVp2BWgi1kmo2Ry6JoeDbZ0WJjsyGFj4r/JmWzeOZrLtBZi/GTAGYuNOQtQmkAIzcuI/vCa7No319EyUPpVCrnMZPMFP6OFQPvXX85NendhpbHHeoCCOnLqqx34UhYGHtGotDB0ia0TbG4ga+8TUDbe7QfpCwCgfEHYHA618wc6QU4eJxB2L1WSAS222SxqWOJJb1lL0oIR5hU4YNUN6gtasx/bXb5dlsMMBqcTkGwKPthLGbIWNqspF7IPwsbNklytG3q8jIRWVkT3nJYZxqdhOt+QGRQumMUlu3IbXw3HuLkafnI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc34fe4-1e4d-4094-fcf3-08dcce82869f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 14:45:18.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8YEYVDucgfYjjFqRmXbKXSRMF4TvOCDbHlZRmw6HjzjGovsG0U5PEla0UcoC4A7LPO5QKbjwtbmb4fnpu2QFIN2hOTj/bnjvDfJVLdOZVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_03,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409060108
X-Proofpoint-ORIG-GUID: KJF_wU1DXjktWIiDsNrYRjSVvTQIMFh9
X-Proofpoint-GUID: KJF_wU1DXjktWIiDsNrYRjSVvTQIMFh9

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
Tested-by: Sam James <sam@gentoo.org>
---

Notes:
    Changes since v8:
     - Fixed typos.
     - Explained KBUILD_MODNAME being added for consistency.

 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 207325eaf1d1..feea1c6c11db 100644
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


