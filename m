Return-Path: <linux-kbuild+bounces-3195-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1261495DB1A
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 05:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 436A3B2283F
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 03:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F8D3BBF5;
	Sat, 24 Aug 2024 03:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O/BQHPCj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IJpUZLPa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3658236AEC;
	Sat, 24 Aug 2024 03:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724470710; cv=fail; b=NlFBoFlIlUFBUGcg+KRTDMR/kI3wrIsDHql6yJnWvy3Y9n2DHrFlE7Z/v2XI7QDtQPsGtrZa+F9QuSGmm2YOo269XbCyNALawN8IUfxklqgwT01HYxzOJRGE9lTM6UUUDhIWFY9Y2XxteVTrLQ3lBJleVHyEiNtl789iNWpFCaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724470710; c=relaxed/simple;
	bh=xSsMh9h0mXsaB9S/lB9Oie7GIv4O7VyFHS6uV9U4uVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OxnHJpYun8OIh1tmD84490Z1fj3QcCn04B3c17Lr/H1GH70CvDNqdIWLPJZY3IgxRNGXn3nvdzCulEFsfIxyN2RXeU0iPBo3j2GK36EJJoGaE3fqYJbuxWJ+Z4xNfuVSqoeSnqWtrN0CBBTLY+9FI1cK7thy7UdOex5ZH9nOhpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O/BQHPCj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IJpUZLPa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47O3UMq1029505;
	Sat, 24 Aug 2024 03:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=+TefRTRsmdVPo/y0xXsaIEPlOQPhpw8XyOGGdQctnxs=; b=
	O/BQHPCjX0xiSYHJ5sdHULTQRq8mBrNLP4OLjvNlFc5Ao0hkhgyVBrYWfzCNlFkg
	ZHk6GSyMOVfYRK8NApddnST9eOoCohyi/MEXa2Ot863vsD1msDvUOyR1Ai0c6Mec
	shdQrWsw+TLjZ7jbj/EjbFnVRvNFKdQSsBEU+FldCZaRln9llN6jjawVAApPaOU/
	N5ctd4DTTm4wTCwNhq84Ydfa3RICr8/GQimk7vU8xxyb6mHjlRYrIYa4V0Hgv3H+
	B6NGFAGwcdZh8QkPbYdV2NkbsuKybjfurF8U/b1r8hlT3zPblamWp58vFt52Bbtq
	nosgyI5MZqMzDTOQpZsgHg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177nw006e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47O2H5XB027814;
	Sat, 24 Aug 2024 03:38:18 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4176kgh9s0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 03:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTd0DJFg4vewZXI/Un8NrWr3fwAU8GcrB3SWTtjeASXNV1CsCR5QjJ2AW9Tjm2WPStZU3QkZ28nhxfamwnsKPFUjbD6L5I2fTp7PzQtO193UjNGbR+NkNW/CCmSzrrai8tSMo9+E2cZFbUuss7Nbni9avajmAIMCXhM4PeFVI2HHm8IlxK0I3ugQxXuXrf0P9rtZ2btKhlzMkeVVzp6zxNVDVP7FVZ9EaaLyGo27OB8iMH6j0hDDkxuDqwqYn/H8/a0ZNB6XiP5NQ3LFeCRXzSyGgLGnxBrna0ccEuouf8Rp2wTmnXOizswIQpHeZb+rNrV/n425KhF8145rj6ceCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+TefRTRsmdVPo/y0xXsaIEPlOQPhpw8XyOGGdQctnxs=;
 b=Pc9VBCEE5ABBscVt2B48QAuHZqxUfYc5CWyTqBHESolkxytGLOQpa7hi2D39FvX+muqb32KYBLiJ1xH0T0N1rtbHKQalynQOvbn5VtR+RwQt+pzbQ+x6T4EOwmp5G2T1h6DnZSITR2X4FjxeacDSNzMZk+PVxJvtClWnCeDx6UWlWqAStpyAqSB7vZPGefGm2VBd4EusRWBK/3f7itHkFoKfszRCduj5x9Va06T0ggOPbJotNP0CZLnQ9StRk+zG0PPcOMLc4AeXDdQIm0T+VKHbyUGoDlUV87+im/h/gyv8HmjhtwH1wTjbQNKNuwjwxT3G/xG6/vPPxCIXbAbjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+TefRTRsmdVPo/y0xXsaIEPlOQPhpw8XyOGGdQctnxs=;
 b=IJpUZLPaCURb8cxvWTqLibmVDyX+86L+vIWHXzdbXTYYcLcMrCnvw58WlFAehRcAAsV0FTuTKQ2B593r8Av4kt5MnNeXYcLXfyk/TwOUdTTZpb6+XVhJiWTOnNWhuWh0lQXXJ4G/piToy1/wWERxVGN3W6fLnE/f/xD5zj4klow=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5171.namprd10.prod.outlook.com (2603:10b6:208:325::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Sat, 24 Aug
 2024 03:38:16 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.011; Sat, 24 Aug 2024
 03:38:16 +0000
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
Subject: [PATCH v9 3/4] scripts: add verifier script for builtin module range data
Date: Fri, 23 Aug 2024 23:37:56 -0400
Message-ID: <20240824033757.52005-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240824033757.52005-1-kris.van.hees@oracle.com>
References: <20240824033757.52005-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:40::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b155f08-1e89-4621-05d2-08dcc3ee3045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OlS47Xu07i/HzC6GjqABDlngMvhxK8mtlS3dNo5hzsuIUpWvE9N7DM+K53Kh?=
 =?us-ascii?Q?VRKy9+uEZsqbQBc1t1ePkJi9XtqL/GjjNqbpkIwNntAOmg56x7851mZUIzkw?=
 =?us-ascii?Q?jRnK9m37tUfHlWY1l2OUtEQpnrQfOPBJXjXnRYi2pqZQqqSppxNfx9y7lkHt?=
 =?us-ascii?Q?3hgeOjY60MX+3i34VZ56tqzN6Wr7Svbsx9Fbnroz8Ftk/ReV2gmYY8Z1XFax?=
 =?us-ascii?Q?EI69sT1T2cjwCXtUa6o/v4dWBVZMSHYEBWKQiQBZ753F3ao90sR9Mxu7/IIh?=
 =?us-ascii?Q?fOKSJ987DwJ5+RKltzf9FHxfrANtxR8yNB2qSVce1UUOz5RWdN1Bhu3XJK1B?=
 =?us-ascii?Q?7uf8JbG6rPneUFA8aBqXznyVMuUA+GbRN+7pHy+UOxKq0Suu16siAsLU8Sqs?=
 =?us-ascii?Q?LDZnkNlredg1doTZIFY6YQMPtGmxC8fX96E/ZPJLa1+P4E4hKlXoAVdn3pWB?=
 =?us-ascii?Q?NB9x//bQrg1wixTIgzyYeERnBCVu5xnLSmdLkZ2o51cEY4P9BjlkBBf10gZK?=
 =?us-ascii?Q?XS0y1mBfTrFl4ityZUDE0oVsYi4XZlVTe2TfASlWtJw1R4OgNDpkOdNys86L?=
 =?us-ascii?Q?dlO4kqrZMfD3i58TUR22lnpebuyXIYOWrgjB9Alhi5mn0h0zxvYehQL7aoaE?=
 =?us-ascii?Q?c6l5rxg7XxnmvEgMni/dJMXYOAfgYL0QEjAIVSNFEkvStj7NGQw75VFp3Z/a?=
 =?us-ascii?Q?rjb1zwvxXRi6D91z9nKbzUU6Z+kZageS9ntJ0u8uVPWyyrIeFsxeV+IN1GtL?=
 =?us-ascii?Q?+l6WyXkVhho8h77TyE2nJYeVOwRdQBeztA5qLrYF/+4PGFvhSeU4ARWuSv3I?=
 =?us-ascii?Q?Z09GWyycV4bPWBVdBNxL/Fv53J66ghw+4dOuwm3VatRqMe2fFJ9hTzOWLckh?=
 =?us-ascii?Q?spngCA5dRUp3EEezm3+nOmMgn+wMBqvPda4RygQGrglXT2kUdotlfHUTpm09?=
 =?us-ascii?Q?TZX/yKAJdn6Ja5QEWsxCynAH0YQnxqwGWOxJOP/qH1pcfr5JotEVs5OO4Kkf?=
 =?us-ascii?Q?0iyr857d6y13FnBbJFJWtvOHhvErwa/YJcEjvbbal1U71nRZpDCOJwW5bsYq?=
 =?us-ascii?Q?E2gonO9xXDuOT8abNOJrW5O7JAiDF9RCtBXj65nYikNK6XHJdGilSnMtOapO?=
 =?us-ascii?Q?9xdEXm0t/KRUVQXvHVmt8QFEObzxmc9ReHC3hoXjV2iuZiSyiAK7OknUomTw?=
 =?us-ascii?Q?J2/CxDU2Zre5xAAbmx+YvqA1KsTG2Gmy9Ash/eNP1JZfjJxer+7+UujjK04J?=
 =?us-ascii?Q?DS1cA3yLlBr0VBuKnOeYff40XEMb9cSJKJ9Sg1O3yo3RjyRplUp5kgcBOn4c?=
 =?us-ascii?Q?Y8KqjemzlJY/DVTwG7QmEGSXcLJV5ErauLz0wQPCcJaG1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L+iv2Zk955wRcNmsD72/Mh5WjkwsOoYzBoBZpUBd+uz1b62u8yVYlnnskaJ4?=
 =?us-ascii?Q?CX4DP1NIVDPzuMVLo2qIEOnVCzfoKXui0LfeOCtcXsoc4AvEqZ43REWpeb7q?=
 =?us-ascii?Q?2jTFgJ3JTdDeQPhdgdKlu2C482J5/whsoTGIMRr9VYppNbdbO/H0h8LIzP11?=
 =?us-ascii?Q?bHKDnlwbJGTRiqw50Ml3FbQd7gMN1o7FmQ7Z9UZDBAMhSfoxZqFo1a2UWqPG?=
 =?us-ascii?Q?sBmKZxtCfsr/fWY3wRaFcyPda39/xQVG7nlXkwTidup+KdtX1zfRqkbu5BLq?=
 =?us-ascii?Q?pHg3Qg5ums4bQfByHo6wPUYXOLmWoW10F8FaklnBU3hoTf5eXzdtYgIAoYlN?=
 =?us-ascii?Q?MatavbZ4jAEqt9lYFtJ82xb2hFssxI7W89h4maognaUURHb2YUtwHymWwtDY?=
 =?us-ascii?Q?T88Hcdtrwgo9ZdDVRgoYFnCMy5sQNIFzzCf9nFaehYQkocTjl7tqpE9Om2pS?=
 =?us-ascii?Q?Lm7hyaPQGrL2ooYUGklgkel6T3ALguD7fspMMy7IZyCCrwhmBYRc2NuMBefL?=
 =?us-ascii?Q?TY9paaVrVS08O5iMRWznEGOYHvQqnpGhhxz8z4ZDhYUcYxw8pH/Mpny8vIlO?=
 =?us-ascii?Q?nGZ0veGT6RMVDuy2gr728Qx+rAkhgaysSEMKF5zA9R/yREhzgwFH8lG3DJDh?=
 =?us-ascii?Q?a34/rdpcudMxalMSEWpDv5DdKkg0fdtTTiSyxCpm6YEm8fahDeRTc6BTM+wO?=
 =?us-ascii?Q?3ll6LzSYvQ57rBM5SWJdFEpO5FOYsB7E3iMe3eMNrwl3nKNbkQHcuwmYUnJh?=
 =?us-ascii?Q?szih9hVutBX16RB1EnldSMajRMp8T52VokfFyHf1soTrtRROntCVEg6cYMYL?=
 =?us-ascii?Q?6wAtmAtcFdxaEt+3+mO76wQHF0+UtOJxteWErexi0n6uP2+NAN3QazGLzDMc?=
 =?us-ascii?Q?TG2msHVRvqaXpO0Q5y6gtcBJHKUXevqS8yzVpDyedjwoFpuL7FeeUnDF14s1?=
 =?us-ascii?Q?jOumdLEJElcCPTcotyy0MtU5aBZbQkC1izmoKvaYVOic53Vqq6bMu/wjWCFe?=
 =?us-ascii?Q?OAtte+ax7QpTjRC1WjpdhbfHeDXxmh0gcGZ9IuNIvhIyT8X25qZeC3cDBiaT?=
 =?us-ascii?Q?W98CwkpN4Ai6AI2ARb+TgXpZEPSF38QFcmaHq5K2nqnAA/2f0Ed7EN1ohaG5?=
 =?us-ascii?Q?/i7YUIN/VvlI59DCm5XPFcRIEqXXjRLUEozpYpUTh2obHIWfrmGKzD4tCU7c?=
 =?us-ascii?Q?usriVMo+ZbEhj3o2whMSKp1dnKx+YBqPhS4ohQVlGORuyHzmwSkWg5ZFKq3a?=
 =?us-ascii?Q?iiGa1v9Rk1HsiRYO2mR74VqXUDRtCu2Q/RDsiBK9kyQlhR1asyEXaCzuXsjU?=
 =?us-ascii?Q?uz4JX7iPTm+5bNeKxFDgZBOCWLjF1s5ZVelfrjP3UhNihgbowjQesN7Fh8Uw?=
 =?us-ascii?Q?Sv0WiiHlTpSqdGOKgpwgrbBFWqhQApyoSBrzUAqJp2TCrUmqVCF5IL59DJdu?=
 =?us-ascii?Q?yzXeTxHdsabRLm2ZfvIBS27UQygkI8zwyW7qw9NCLi/OQYzxD5oswapC+1yL?=
 =?us-ascii?Q?MxFqy9IT4MPgMeW5NwGf9y0oJYW5ixXPAtYBhpJOe/jOfp5nw3K8v2835NfH?=
 =?us-ascii?Q?8o7CxLB+6qQSc8Xlj5ijswqLVHDqPuEUStxFrKK3ZJxge8I1s+6zACeAnRIe?=
 =?us-ascii?Q?cemBt8TkJ3dD3c2hrRJXMI0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T+eC5+acYjhib+9k8hj1GEoZgamDZS/HxzWwTav0k/97is0ybVyBNt8c3VnyaGW+bS3g6inAJ9saQaPBIFjHrZzBQsznEoJ7Pp16fGdZRSzwcdDvQC88WBVFPgSL5Ws2RuQBfqaj+ED5SmjCTvUUQyGTavGQdIwi13ZGV9YJzUchH3wl4Iki1Bg6xmGApfndXlAV8sFHdVgo13elir6TK5Ym4Z8wLejA15fsE4+6CNURWsetNresczg7BUtLvfC0PCOmm2BAtHc78f32q1cWySQ8h3PKOTxKtcf84ysED/5gvKfhk1m3eiN8+9hU/d08wa2KSQzodTvoV5jhAi1OunKGOYgLXGZ+Yk6j/yV8eCFCcnIIwSoby5UbGvv7lFiHlV9s+CcsmWr2SuGlg/b81n7lqow8GfNI66SkUNqGzz8VR+XlL/oUQ8oyH2Z4zli42ShS+mKySB6okOgTuqmAOvIe74/riLfVe8a/FZnHQXR3NphV5Rm/yNnp8Nu1LbOW2IsmcYxPvvYpQcWeS/4RtY30JmO+NiE6uj28zPpIwCtp5CsCUy4rwDXvKeD9nNh1vDpSS1jj6JsPvQSk04rzBR2VSdbjPaoOFQTg6XBNzF4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b155f08-1e89-4621-05d2-08dcc3ee3045
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 03:38:16.0383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNNL6ATCDWpjSZLv683DxndBEXZoKX4OqTTOCZBMHDk4z+oWAP+1rPAUcK1aZgDyXDU/F5nL/nhHucI84FSJF243yf/dI+XM7y0F0766QqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_02,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408240019
X-Proofpoint-GUID: SZ0hlynHl5U0BGqEc74li0aiCPpDqZOb
X-Proofpoint-ORIG-GUID: SZ0hlynHl5U0BGqEc74li0aiCPpDqZOb

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
    Changes since v8:
     - Added support for built-in Rust modules.
    
    Changes since v7:
     - Removed extra close(fn)
    
    Changes since v6:
     - Applied Masahiro Yamada's suggestions to the AWK script.
    
    Changes since v5:
     - Added optional 6th argument to specify kernel build directory.
     - Report error and exit if .*.o.cmd files cannot be read.
    
    Changes since v4:
     - New patch in the series
---
 scripts/verify_builtin_ranges.awk | 356 ++++++++++++++++++++++++++++++
 1 file changed, 356 insertions(+)
 create mode 100755 scripts/verify_builtin_ranges.awk

diff --git a/scripts/verify_builtin_ranges.awk b/scripts/verify_builtin_ranges.awk
new file mode 100755
index 000000000000..f513841da83e
--- /dev/null
+++ b/scripts/verify_builtin_ranges.awk
@@ -0,0 +1,356 @@
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
+function get_module_info(fn, mod, obj, s) {
+	if (fn in omod)
+		return omod[fn];
+
+	if (match(fn, /\/[^/]+$/) == 0)
+		return "";
+
+	obj = fn;
+	mod = "";
+	fn = kdir "/" substr(fn, 1, RSTART) "." substr(fn, RSTART + 1) ".cmd";
+	if (getline s <fn == 1) {
+		if (match(s, /DKBUILD_MODFILE=['"]+[^'"]+/) > 0) {
+			mod = substr(s, RSTART + 16, RLENGTH - 16);
+			gsub(/['"]/, "", mod);
+		} else if (match(s, /RUST_MODFILE=[^ ]+/) > 0)
+			mod = substr(s, RSTART + 13, RLENGTH - 13);
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
+			mod = "";
+	}
+
+	gsub(/([^/ ]*\/)+/, "", mod);
+	gsub(/-/, "_", mod);
+
+	# At this point, mod is a single (valid) module name, or a list of
+	# module names (that do not need validation).
+	omod[obj] = mod;
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
+# and we record the object name "crypto/lzo-rle".
+#
+ARGIND == 3 {
+	sub(/kernel\//, "");			# strip off "kernel/" prefix
+	sub(/\.ko$/, "");			# strip off .ko suffix
+
+	mods[$1] = 1;
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


