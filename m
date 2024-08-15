Return-Path: <linux-kbuild+bounces-3004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7795369A
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C19E3286082
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 15:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35711AE84C;
	Thu, 15 Aug 2024 15:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FV+sEew1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gl6WvI5l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9A21AD9D9;
	Thu, 15 Aug 2024 15:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734270; cv=fail; b=T1E/5TUJb32b61MHK+3sn64t7dQKp8ouqvpNtv1xTN5W6NAmBZ4fRm0zTeL1o6RHJeivKgBmsjbyKwbtrNdTutl6aQWiJlnl2hmEq76iWkCfCfTi8InonfAn26q/jRnG39oSBMg/xp7D9jBLblzp4AwHw00bzMTDtnazGg1+4CY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734270; c=relaxed/simple;
	bh=ftSiw6pJwtJSBUEnrSMTon6hGKj2JCRrSdZcHLKbfjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OByWY64uiOPR3v0xurndhKd0A2bmH1IR46wA9g9hGgqk4o6Mmyf22B73T7pG2wb7vARYfX38KMe4y2Hf9Wza1hfkpEr44q2plouMrM8N7aF/wAmcVN7iuEFEE3Dle7AZWjneYQ7lrIbkdWVaSnVvRFdGKoSyTQ04UYDO9i/KfTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FV+sEew1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gl6WvI5l; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEtXJt016195;
	Thu, 15 Aug 2024 15:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=PxilyXXdM6Ve7rkFM6qZeXu7Rm7nXpj1Ft7ycoSTWvY=; b=
	FV+sEew1wfYaR7KC97KQ8iOG9LBQB0qxTefKNpDi4VtZzXbxuXeMqIV6l/rPPPR0
	oNLlC0jOuKbSVCEAG8vx7P9fpVCyT5nI8etdTQlKBJdqdQI9nfPI8o2MfgzxFjNt
	0oxz2bY/tofGvo5ckebWLoGSqZfCg0qEL5Al6nvy+NEcBUvxhMWKKump7ZnJsLWW
	8MdzOIlT0wk71uljtdISm0uqRZqpI+4Prkbbn7LBRUIAPJ6EwfaJ5gaFifawiqGf
	CQdlI3QlbUH75UqpMfsNTgtlnBPEyl/wkoDRwTSgLOD4SfV5bKKBwZKYiO97udt3
	qnxc1S2HsI1riMHn+xPPMg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wxmd2huv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FDbUPO021064;
	Thu, 15 Aug 2024 15:04:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnhqu05-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tC1yvZOaB1pMmWcpXZU8O5B0Rs7vFZLFxythR7vv+wl9NLhGLW7l1stp/iZ1PbkQpOVy0pFrPe6nvBGcAWRhlUVNJ2DnjNrYPgRVJlWt0UxRDc3EWvrc9p6mudFAhs8laQwW6qgXYOVUHeAJ6kMHuJBXwQyHtNby7m89Rni7lHWPQKu8XxW82SAVJ7R6saujnBw0BRSwOHs1Oo3q3zIPKNUPNCH0UbMRODm/TeI9e3QQQCKP6gdYhf5zLz/x58bpJ62Putfz8hVJDU+FeRGrwonu54Hodg9O6C4x+BoaiY8magUUCe0EoZvon9bGxwtwVoi/+3QdUBcQEkjRk/ljTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxilyXXdM6Ve7rkFM6qZeXu7Rm7nXpj1Ft7ycoSTWvY=;
 b=KfJloRyjJcaIVYlp3Q5VLUWSMh0aIEDIdlXTcC4LM1Mi3WwV57mJhRlmxGDfx1pkAEXeOuYlA/Taco797iIi+5r9/hF1W26YGBCCZk0FRii3Zi8E69/fH/p15zBsH2kH4LDSU+RuNRorJevkVAMx6IWbEYfVojQx0CBam09xJULXeDnFQtzIM3VCeAxR+azr42T6zoselKhJROlRhnrzJVJx3xXaummoe1kaZCcdsDneKBwynNJ7sLznALNRcEinKYQC+aSdoSkW2alkV/FZz9U6WN4OLoXyh677a2I8hhtPDEXi2MIT7f54dvff4XoYZkQiTKzg9cTKL+fayVNTrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxilyXXdM6Ve7rkFM6qZeXu7Rm7nXpj1Ft7ycoSTWvY=;
 b=gl6WvI5lT0cZTQAzxc/+quMxrAwy5uSMKdffxHjpWZS+ET6JJAhkNJC8mYJSiEt3JFumlXUAKMjiYqM4IzPLhPaKEOPvC50kbfhfcsM0jmlF4Sni/v95s+nPBOOSb7UwlbTSj+/0e+hc3W8kVOSvE4TmaJ5+CXc5KOV81re4XcA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6657.namprd10.prod.outlook.com (2603:10b6:930:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 15:04:10 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 15:04:10 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: [PATCH v6 3/4] scripts: add verifier script for builtin module range data
Date: Thu, 15 Aug 2024 11:03:38 -0400
Message-ID: <20240815150339.1564769-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240815150339.1564769-1-kris.van.hees@oracle.com>
References: <20240815150339.1564769-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBP288CA0014.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 082b28f7-5afb-4f99-3b86-08dcbd3b8453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RByFlOvPP8MOPJ3WpGBXooEd2mZAlUAn4clPhgo2ER/ApA60S/Z6VYNVplCA?=
 =?us-ascii?Q?4/Tv/u1U5QttTQESZOX5wjLKMVj2rYhIC7ZXPXgiqhwUCGHZiAqlaP4tFwBb?=
 =?us-ascii?Q?befEoM8tNXVrQ3s/BXcFnZgQAPcTccrSdVeVJM9CZIN7RywmTC4twHriDjgw?=
 =?us-ascii?Q?L6syPZP/tqwNCk7igBhwOPdpnBxsMTQfkVaCuXqXOrvzuJH88+tDZjnOF933?=
 =?us-ascii?Q?TgivW+o0x8+GoBQX+hOxxG3CCDwUzMAuD/Xw4cx4iZfUwm7W6uHbxNXvUYO3?=
 =?us-ascii?Q?hKlY35P9eSkTHPE/tijf+EqFZfYzMbNSmfZ+qkAIoPQAaSb8B2m7aasJ9tOw?=
 =?us-ascii?Q?aDw2YcPjR8kUYVNNCW0rvMc7ekLQ4Y3quWNbUhrOvXKLiOcgwTIelfycLlQW?=
 =?us-ascii?Q?7Q157AozE6jJ4YU2C4FR/4Hqd4TQ44XPpFouOrrHZI0zXq1VQ8w/oVDc9WVQ?=
 =?us-ascii?Q?LVNa80zdiX12vqucg8A3cNk01Ms5h+dgIwA3lNAMdSPlgXR5ojkBHw4AEyhw?=
 =?us-ascii?Q?vowiESp0SufyIAbPBJMk9b5FWzmhDJBeMgEdLpjPjXbe5cCI5gpEYP2yqsR3?=
 =?us-ascii?Q?m82rNsgYPhunzmmds7/uMT8HuKXtlaYFCFVP+OqwXPqNVuA24Ugl8vhwYh7P?=
 =?us-ascii?Q?3NWeLAn4fGw1wIOHRAR++7zHCw2R8wPv6Ud9zu94vdduPWSK9TVMOw0/1774?=
 =?us-ascii?Q?SuLOsQKmQYNH2W2GYbS97d4kSQDUBPRiluWFTo97q5Mr81IV5AtJ+Q2nD3Hh?=
 =?us-ascii?Q?9qHcO6FYLJZPU5k68gAqpBpPHP1Ybxpa855lINx6KKrlajKzk8FtVCKjdOzZ?=
 =?us-ascii?Q?qLegZe7e3JQ5FKpRjZM0qDoVSQjhAdCoCv/yVKeilIV/SqBFiMz7QHiPgbs8?=
 =?us-ascii?Q?wJhn2FCiSAsPrdGiVtgnsdZt4Ve8Vja/ssauwnKt/FVSpuk0glm2AyDGG9ue?=
 =?us-ascii?Q?bIagHrzlq5fWXg8p8e6A5cBkf02t4AMuvmCHNwfxnS75vRMIdA73r0CjhhFe?=
 =?us-ascii?Q?X/OyjdOnLQpe1yi1h3xCShog9Gf4UhLs9urAm2dpWE865rLgNKL5cNVc3EaF?=
 =?us-ascii?Q?z384bcU8HhDvRmTvmyHWNLSpcP9mWNuLxOeh4O5gttmNG5kTYdCxkgBlhH7H?=
 =?us-ascii?Q?o6zLjMEh/3CL0vSLM/zDh1AeLabaTe+R2pOmASzzo0+9dOqjYTj7ucKJ2+JY?=
 =?us-ascii?Q?Xj70hl1qphxLl7oKFvnkWzWLIpnIS22Cgknh+LkElhouG5yTEd4YdSI4Pc/t?=
 =?us-ascii?Q?cQTkDiI1INJmCxvOGw+FGsxy/Xv+1fzDAzSRXkkA69l8sXFauQDKSZIWXubG?=
 =?us-ascii?Q?8XSxDKzbCsCMjQeujaaqL0968FV2gb51lotUWWY72oRbnw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9bnhbpvPIfJOLsw4ebeze8HjPhdMAcFoEssTxuEuwY0AxpTRutyMQVQY21W5?=
 =?us-ascii?Q?JTJiuEB+ZlWDtXj6VZBXmVJHGxBl3gUAwkjSM/sNyDH+XaZrHfmDfWApB/Ba?=
 =?us-ascii?Q?0BowbDpXSc3lyIl8/MeUasz//rMB0DMabMSLEXnQSHiCNaYR09BhXsX+4EDU?=
 =?us-ascii?Q?Sy04/mf5oqguot9GXYtM0FtHZ3IHSsVzvn0Av7SSgzlVwlrMfeX/5UU8dr8U?=
 =?us-ascii?Q?DApqkWb53PPMvozq/t3OlL7eD7i3obIuLzWMZMAowQoWzLFkO7OOx0ycAaKR?=
 =?us-ascii?Q?YK32fg5uRWmCRxHZLIo8LQUir1qc+CKtwtuqm5wJXdCNK9sNa+RH75AOM/1K?=
 =?us-ascii?Q?zFUJIxwHLRFs0BWA5MBaKfF4YJWJDV1y7BMIyKouXqyjO0TKRs+Xi5L39MtD?=
 =?us-ascii?Q?XbbdrRHa5PelMUDwd4d4pbrbWKsNabcv9RQNX1NllXsfPQQ1lKJuexhJH5QM?=
 =?us-ascii?Q?xzOvrfo/SxvlMInUEgjD1+mHHo5rJWTNC66OpFIrdUEJrJCqeJz0abgwAb9w?=
 =?us-ascii?Q?ndM2t63CmYoT/ehb6JutpyuOoQ8VMgYwbaUCCeRtKKgtaP4X3qb/Xx4CYrlj?=
 =?us-ascii?Q?TUyoWYVmizw9XmnUMIWSMjhimdN0wDwFJOOMTdYsDVVQpeLZCuyEQrjQd0Vr?=
 =?us-ascii?Q?uoMKM0TxBoSNSCnaA21Awb3aoRaNZEo7JJ6IYtQSpXCIj7HTamvrBA/N4y6j?=
 =?us-ascii?Q?du49/4r3G+GFVV0ZaZCs2HmmLnUYvyuC5GfKQ3yT05Nt02bsSaPHo7SIHNqX?=
 =?us-ascii?Q?s1FIgXEONOBW4SBLdM6CS7ubR4yAXRTR5G8d0s2ojdn/q7IrUcNz00OKsM4+?=
 =?us-ascii?Q?Vt7cYTKsYrSg5po9oBuWrWnUpIULVjbb10ntLDvzIlZSmnBhO8f4TivaCNkh?=
 =?us-ascii?Q?yaF1mFlzuEobYCdZWXgSX4sd5adQ4Xd5s116pPc1ZTpmAfR9Im7/Jw7dQbgW?=
 =?us-ascii?Q?utgCDmQzOY9gKvSa/oaTsgjt7N3LS1eFGyhmSIhnBGJOndzHJKk4BM+jdSfZ?=
 =?us-ascii?Q?X/mfnnfymfxvpB4YDtXRIfoRctgLS447QPCtys593DPV9UL+zKUH08onp/8t?=
 =?us-ascii?Q?dPv/0sQmlSpd1WCQxXBAl+bFiyXl2Z/zokCPZS9nIl3/n1LsMPZsiQ5L+r86?=
 =?us-ascii?Q?kcC+Oj+yV3e3p7pVdjxJpMhc1qHmMue+XH/ThzgkjF2+b606Sm873979GJPE?=
 =?us-ascii?Q?X70AtwGD8Dwu71BuRtaEnQ1uyuGvOLNCWbdmsbs8NkHh+25FfJSAEaSLPegc?=
 =?us-ascii?Q?815KTYXkQBzOmr5MIc5jvuM8D+fJaaKBt9DcS6/9SZlVaSWfRl3wvJ1ysuuJ?=
 =?us-ascii?Q?kVPy2erJBUc6UpTojtMO/rudwNoAeESh/GyYTh4+EyEMVjmQjtrSeN6OAapO?=
 =?us-ascii?Q?eW4hsQyTuNuR0FA8HwLTONQYgd2wYTpuqDpm6s3ilqx+MHJhNlVKnFUANdYV?=
 =?us-ascii?Q?ypaU16mFonscig4JX6nkGdiaLSzJcVVUjoq/jGbuqkl8wPzuuNEOc2tb+AlD?=
 =?us-ascii?Q?MD84Xfj9iVu57EfbM1JxoSuzFEckrA1eLQGzQVmVnQ99ykt59MCghS0WSsKm?=
 =?us-ascii?Q?RIIub2ltwH5rUaRVh4Rehby84ACdqednXAK6YjsHIVo2WX8EO2Hgjg9me6aR?=
 =?us-ascii?Q?4Jj2hxRNdEUPTEfgyiB4hQg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SpuogbzMcjGM3l79e5UKJw9lZm6kIDaH2P6o8QrIyB/1Wi1GMFBatd7BEL/o1gBTW/Vbt3FAmsN0jmA33IUb1/5Zt8+EWwuyeB4RD9weB3NfcYvmpkoEFDpCPyjJYFhCr659BslMuzBCOhsz13JprW/jVfCDQ6zs2DP/mBy4qlhD3i7hrlv4V7vyPWA0Msjh4GUnnnOApYfOzJDqcG9HqLAd0wc/xZKcLCVdpZh3mUEpRgd+CmC8kYfdM5l59h/Og8KpGRdEi4HIWjHVnPqB+Jlw4Jy2NlKIGCfhnu9JypggjKAC9Srkhp4IMTZF5WG+mOggIydiYSgGhfBAObiSgGo0Kq8GjIF48EJR5DXi7X5LHeiTn/VF5V5phIpGQQUMFYkBnWi5y5NAndSNItu6eVOvyy8aHu0tCPmyj3OPC9vno/bxWjaIeqTUWmEKJSW8zv/wVWCJDAGCgGXrJUtRq71NRGF5mzrENc+WAipghTe47HHrq+77j0+Y8bTjvIso0YsJ9qzFbFHFlv/IDdCFk/RQf3+/mV8O2b4lkjIlc0xGfHL3oTjL5JC6L2PwiKKsVn0mkgd/Lf3kUMOALtHGiogV8fjgR0fxoXzrS4rHkn4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082b28f7-5afb-4f99-3b86-08dcbd3b8453
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:04:10.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QImydNtPPb2QLibdae2OFg7i6R1buPSd/oP8tn73MWOtkll38G2kHlcymoI2zfbGU40TmfwoQhF5SkusWi5c0EtTXKoLfY2GrPVQykqIhHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6657
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150109
X-Proofpoint-ORIG-GUID: DFW-iZCXOjOmk8yPftHR_PkPht07pJEO
X-Proofpoint-GUID: DFW-iZCXOjOmk8yPftHR_PkPht07pJEO

The modules.builtin.ranges offset range data for builtin modules is
generated at compile time based on the list of built-in modules and
the vmlinux.map and vmlinux.o.map linker maps.  This data can be used
to determine whether a symbol at a particular address belongs to
module code that was configured to be compiled into the kernel proper
as a built-in module (rather than as a standalone module).

This patch adds a script that uses the generated modules.builtin.ranges
data to annotate the symbols in the System.map with module names if
their address falls within a range that belongs to one or more built-in
modules.

It then processes the vmlinux.map (and if needed, vmlinux.o.map) to
verify the annotation:

  - For each top-level section:
     - For each object in the section:
        - Determine whether the object is part of a built-in module
          (using modules.builtin and the .*.cmd file used to compile
           the object as suggested in [0])
        - For each symbol in that object, verify that the built-in
          module association (or lack thereof) matches the annotation
          given to the symbol.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
    Changes since v5:
     - Added optional 6th argument to specify kernel build directory.
     - Report error and exit if .*.o.cmd files cannot be read.
    
    Changes since v4:
     - New patch in the series
---
 scripts/verify_builtin_ranges.awk | 365 ++++++++++++++++++++++++++++++
 1 file changed, 365 insertions(+)
 create mode 100755 scripts/verify_builtin_ranges.awk

diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
new file mode 100755
index 000000000000..b82cf0a0fbeb
--- /dev/null
+++ b/scripts/verify_builtin_ranges.awk
@@ -0,0 +1,365 @@
+#!/usr/bin/gawk -f
+# SPDX-License-Identifier: GPL-2.0
+# verify_builtin_ranges.awk: Verify address range data for builtin modules
+# Written by Kris Van Hees <kris.van.hees@oracle.com>
+#
+# Usage: verify_builtin_ranges.awk modules.builtin.ranges System.map \
+#				   modules.builtin vmlinux.map vmlinux.o.map \
+#				   [ <build-dir> ]
+#
+
+# Return the module name(s) (if any) associated with the given object.
+#
+# If we have seen this object before, return information from the cache.
+# Otherwise, retrieve it from the corresponding .cmd file.
+#
+function get_module_info(fn, mod, obj, mfn, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	mfn = "";
+	fn = kdir "/" substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mfn = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mfn);
+
+			mod = mfn;
+			gsub(/([^/ ]*\/)+/, "", mod);
+			gsub(/-/, "_", mod);
+		}
+	} else {
+		print "ERROR: Failed to read: " fn "\n\n" \
+		      "  Invalid kernel build directory (" kdir ")\n" \
+		      "  or its content does not match " ARGV[1] >"/dev/stderr";
+		close(fn);
+		total = 0;
+		exit(1);
+	}
+	close(fn);
+
+	# A single module (common case) also reflects objects that are not part
+	# of a module.  Some of those objects have names that are also a module
+	# name (e.g. core).  We check the associated module file name, and if
+	# they do not match, the object is not part of a module.
+	if (mod !~ / /) {
+		if (!(mod in mods))
+			return "";
+		if (mods[mod] != mfn)
+			return "";
+	}
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
+	close(fn);
+
+	return mod;
+}
+
+# Return a representative integer value for a given hexadecimal address.
+#
+# Since all kernel addresses fall within the same memory region, we can safely
+# strip off the first 6 hex digits before performing the hex-to-dec conversion,
+# thereby avoiding integer overflows.
+#
+function addr2val(val) {
+	sub(/^0x/, "", val);
+	if (length(val) == 16)
+		val = substr(val, 5);
+	return strtonum("0x" val);
+}
+
+# Determine the kernel build directory to use (default is .).
+#
+BEGIN {
+	if (ARGC > 6) {
+		kdir = ARGV[ARGC - 1];
+		ARGV[ARGC - 1] = "";
+	} else
+		kdir = ".";
+}
+
+# (1) Load the built-in module address range data.
+#
+ARGIND == 1 {
+	ranges[FNR] = $0;
+	rcnt++;
+	next;
+}
+
+# (2) Annotate System.map symbols with module names.
+#
+ARGIND == 2 {
+	addr = addr2val($1);
+	name = $3;
+
+	while (addr >= mod_eaddr) {
+		if (sect_symb) {
+			if (sect_symb != name)
+				next;
+
+			sect_base = addr - sect_off;
+			if (dbg)
+				printf "[%s] BASE (%s) %016x - %016x = %016x\n", sect_name, sect_symb, addr, sect_off, sect_base >"/dev/stderr";
+			sect_symb = 0;
+		}
+
+		if (++ridx > rcnt)
+			break;
+
+		$0 = ranges[ridx];
+		sub(/-/, " ");
+		if ($4 != "=") {
+			sub(/-/, " ");
+			mod_saddr = strtonum("0x" $2) + sect_base;
+			mod_eaddr = strtonum("0x" $3) + sect_base;
+			$1 = $2 = $3 = "";
+			sub(/^ +/, "");
+			mod_name = $0;
+
+			if (dbg)
+				printf "[%s] %s from %016x to %016x\n", sect_name, mod_name, mod_saddr, mod_eaddr >"/dev/stderr";
+		} else {
+			sect_name = $1;
+			sect_off = strtonum("0x" $2);
+			sect_symb = $5;
+		}
+	}
+
+	idx = addr"-"name;
+	if (addr >= mod_saddr && addr < mod_eaddr)
+		sym2mod[idx] = mod_name;
+
+	next;
+}
+
+# Once we are done annotating the System.map, we no longer need the ranges data.
+#
+FNR == 1 && ARGIND == 3 {
+	delete ranges;
+}
+
+# (3) Build a lookup map of built-in module names.
+#
+# Lines from modules.builtin will be like:
+#	kernel/crypto/lzo-rle.ko
+# and we derive the built-in module name from this as "lzo_rle" and associate
+# it with object name "crypto/lzo-rle".
+#
+ARGIND == 3 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mod = $1;
+	sub(/([^/]*\/)+/, "", mod);		# mod = basename($1)
+	gsub(/-/, "_", mod);			# Convert - to _
+
+	mods[mod] = $1;
+	next;
+}
+
+# (4) Get a list of symbols (per object).
+#
+# Symbols by object are read from vmlinux.map, with fallback to vmlinux.o.map
+# if vmlinux is found to have inked in vmlinux.o.
+#
+
+# If we were able to get the data we need from vmlinux.map, there is no need to
+# process vmlinux.o.map.
+#
+FNR == 1 && ARGIND == 5 && total > 0 {
+	if (dbg)
+		printf "Note: %s is not needed.\n", FILENAME >"/dev/stderr";
+	exit;
+}
+
+# First determine whether we are dealing with a GNU ld or LLVM lld linker map.
+#
+ARGIND >= 4 && FNR == 1 && NF == 7 && $1 == "VMA" && $7 == "Symbol" {
+	map_is_lld = 1;
+	next;
+}
+
+# (LLD) Convert a section record fronm lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && /[0-9] [^ ]/ {
+	$0 = $5 " 0x"$1 " 0x"$3 " load address 0x"$2;
+}
+
+# (LLD) Convert an object record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /:\(\./ {
+	gsub(/\)/, "");
+	sub(/:\(/, " ");
+	sub(/ vmlinux\.a\(/, " ");
+	$0 = " "$6 " 0x"$1 " 0x"$3 " " $5;
+}
+
+# (LLD) Convert a symbol record from lld format to ld format.
+#
+ARGIND >= 4 && map_is_lld && NF == 5 && $5 ~ /^[A-Za-z_][A-Za-z0-9_]*$/ {
+	$0 = "  0x" $1 " " $5;
+}
+
+# (LLD) We do not need any other ldd linker map records.
+#
+ARGIND >= 4 && map_is_lld && /^[0-9a-f]{16} / {
+	next;
+}
+
+# Handle section records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && !map_is_lld && NF == 1 && /^[^ ]/ {
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# Next section - previous one is done.
+#
+ARGIND >= 4 && /^[^ ]/ {
+	sect = 0;
+}
+
+# Get the (top level) section name.
+#
+ARGIND >= 4 && /^[^ ]/ && $2 ~ /^0x/ && $3 ~ /^0x/ {
+	# Empty section or per-CPU section - ignore.
+	if (NF < 3 || $1 ~ /\.percpu/) {
+		sect = 0;
+		next;
+	}
+
+	sect = $1;
+
+	next;
+}
+
+# If we are not currently in a section we care about, ignore records.
+#
+!sect {
+	next;
+}
+
+# Handle object records with long section names (spilling onto a 2nd line).
+#
+ARGIND >= 4 && /^ [^ \*]/ && NF == 1 {
+	# If the section name is long, the remainder of the entry is found on
+	# the next line.
+	s = $0;
+	getline;
+	$0 = s " " $0;
+}
+
+# If the object is vmlinux.o, we need to consult vmlinux.o.map for per-object
+# symbol information
+#
+ARGIND == 4 && /^ [^ ]/ && NF == 4 {
+	idx = sect":"$1;
+	if (!(idx in sect_addend)) {
+		sect_addend[idx] = addr2val($2);
+		if (dbg)
+			printf "ADDEND %s = %016x\n", idx, sect_addend[idx] >"/dev/stderr";
+	}
+	if ($4 == "vmlinux.o") {
+		need_o_map = 1;
+		next;
+	}
+}
+
+# If data from vmlinux.o.map is needed, we only process section and object
+# records from vmlinux.map to determine which section we need to pay attention
+# to in vmlinux.o.map.  So skip everything else from vmlinux.map.
+#
+ARGIND == 4 && need_o_map {
+	next;
+}
+
+# Get module information for the current object.
+#
+ARGIND >= 4 && /^ [^ ]/ && NF == 4 {
+	msect = $1;
+	mod_name = get_module_info($4);
+	mod_eaddr = addr2val($2) + addr2val($3);
+
+	next;
+}
+
+# Process a symbol record.
+#
+# Evaluate the module information obtained from vmlinux.map (or vmlinux.o.map)
+# as follows:
+#  - For all symbols in a given object:
+#     - If the symbol is annotated with the same module name(s) that the object
+#       belongs to, count it as a match.
+#     - Otherwise:
+#        - If the symbol is known to have duplicates of which at least one is
+#          in a built-in module, disregard it.
+#        - If the symbol us not annotated with any module name(s) AND the
+#          object belongs to built-in modules, count it as missing.
+#        - Otherwise, count it as a mismatch.
+#
+ARGIND >= 4 && /^ / && NF == 2 && $1 ~ /^0x/ {
+	idx = sect":"msect;
+	if (!(idx in sect_addend))
+		next;
+
+	addr = addr2val($1);
+
+	# Handle the rare but annoying case where a 0-size symbol is placed at
+	# the byte *after* the module range.  Based on vmlinux.map it will be
+	# considered part of the current object, but it falls just beyond the
+	# module address range.  Unfortunately, its address could be at the
+	# start of another built-in module, so the only safe thing to do is to
+	# ignore it.
+	if (mod_name && addr == mod_eaddr)
+		next;
+
+	# If we are processing vmlinux.o.map, we need to apply the base address
+	# of the section to the relative address on the record.
+	#
+	if (ARGIND == 5)
+		addr += sect_addend[idx];
+
+	idx = addr"-"$2;
+	mod = "";
+	if (idx in sym2mod) {
+		mod = sym2mod[idx];
+		if (sym2mod[idx] == mod_name) {
+			mod_matches++;
+			matches++;
+		} else if (mod_name == "") {
+			print $2 " in " sym2mod[idx] " (should NOT be)";
+			mismatches++;
+		} else {
+			print $2 " in " sym2mod[idx] " (should be " mod_name ")";
+			mismatches++;
+		}
+	} else if (mod_name != "") {
+		print $2 " should be in " mod_name;
+		missing++;
+	} else
+		matches++;
+
+	total++;
+
+	next;
+}
+
+# Issue the comparison report.
+#
+END {
+	if (total) {
+		printf "Verification of %s:\n", ARGV[1];
+		printf "  Correct matches:  %6d (%d%% of total)\n", matches, 100 * matches / total;
+		printf "    Module matches: %6d (%d%% of matches)\n", mod_matches, 100 * mod_matches / matches;
+		printf "  Mismatches:       %6d (%d%% of total)\n", mismatches, 100 * mismatches / total;
+		printf "  Missing:          %6d (%d%% of total)\n", missing, 100 * missing / total;
+	}
+}
-- 
2.45.2


