Return-Path: <linux-kbuild+bounces-3135-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E8959393
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 06:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8CD4284FE5
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2024 04:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC2215F40D;
	Wed, 21 Aug 2024 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="blGgOnvY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jwvt7Tdo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9612515855F;
	Wed, 21 Aug 2024 04:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724213482; cv=fail; b=N1R66l+sh2b7pVMj+1nja4kaetp149DQhlsyRDs5CPJzLDn9L/lrJIxKganSP/+QEauU8QSpuc5ACwVpe3lzuWXwvrdECXTsfw2dIC6H2ohWYy/9vL975o8iWzy7HGq3rtODPP0MazOjfJttnPLaloV480GnOk76QwfZa5zh7T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724213482; c=relaxed/simple;
	bh=WZC33waV8GmM4WK1y5US4SmCkOL1VtCUiHQAw9pVayw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IqD83/y4AnDE+1e8nYpQ7ovXu1HcmLFmJixh5VcQjMbMYmWoICtyBOQPpjQimNK8QG2mOn82FTSijrU/m6zwsnXg1wEhwcZ/0TZba9zE8vY4nDnwO7zFzHLzDOXHusSwpPQ7G1ClgLmqqGDtt7sPUpCrpkjnV7AnSeDHQkYgcXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=blGgOnvY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jwvt7Tdo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L0ta2m012438;
	Wed, 21 Aug 2024 04:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=WYJ01sVjQB9+3I3VVt4RhjcZCBjuDxoEILd7ZM9sMoo=; b=
	blGgOnvYXYOEUanWCC/hvleRQ0/BxyCxN0Q4TNWzW1I95Lm39SjcHSJlqBYgtVMh
	LnguzBBxVS9QmjMqrUfiIEEmmreRwx1w3qS3q4nIsoQInF1js1a5y4WqIrbhOUID
	uaLkeVukAzggaSFN1VTk8PuM6VsGZQ/Bslw6yOKIMIH2NgaKFBbeSVJZ2CW9cvAe
	okCplUxXu4OZRzoDocHTgwF57yOSn9bf3cWLHGVxaBBKxVc46WhWtikGJtSYv0fw
	V1KZfmzks41YxtnBcaomqfjr7L32PsIs/8bLSFPcThpIXaz2cu8Wm5hU7iC8QZUe
	jXTQJhhaELhX0h0lYg3qSQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m4uxjj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 04:07:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47L42LM0015912;
	Wed, 21 Aug 2024 04:07:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4158v0836b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Aug 2024 04:07:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBClMi9A8eKjnjEkJGUVweI8AkdRfa3JWtXMFwQSThfT+Wfyx5qV5xuxxO/g8tJYMgTqlf9bJOo/Q6M8DHOg1Kf99FVucO0b3JPqxvgVjklTAdf+8PAq520ufTONAl4X9vv6Yhr1OogZWD9TQa8pqCOOMKYZOIjYFhQxLEA2GR/jjSSuIe5y5epotqzHQsyVTnUN6CypNpEnFycS3keppx1GOTUAxkMLSGpw+uT1RnxbZjLKAut7vZA5J/VFceYhdF4pWXpjyPmlJAs1t/doIPu47T6q6h0Vdf/2MecXfVzT4o8gKM5tUOnlvqs0DfovSWNAnx8sB+DT+fxI6B0EEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYJ01sVjQB9+3I3VVt4RhjcZCBjuDxoEILd7ZM9sMoo=;
 b=zSX41qBmvDkn/L0tJ8/4FWBMI3JaDO4xTn3kCWHjlIOuYKmrnjxa23CsanhCHFNhfmprmE0/w3siVfsPwqyfhirmK+BzAdoX+lTJcars1ZewCbP2CPVqFjsQew9TkF2I0DqJ8p0ldohvI3m3EzrSWZK2XRruxJ33GloC5pe/g5WXDKzYRwBFZfuRBBR/+AiKooSYVjZAfZoOpG8NaV0DmpGnzEWVHDEysL2KVcONyxIUk4C5YqJcttsivNP9DtXRLYa6iQVtzDp8eIJg7zhLuYHu60BdRtoHvjClztea+k1VV/HZsAaBMgwGxnywV1JDesRsrBaP1V5ny0kBP3l8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYJ01sVjQB9+3I3VVt4RhjcZCBjuDxoEILd7ZM9sMoo=;
 b=Jwvt7Tdo2Qw85mfcKjTPleY+YJWkYT+201YdFtU45G5VqGVLl6A9EJUH6VSlhf2mtLs+huUuzx5m3Z3n+E+Br0DT6LyeFxrBl2MowwUu44mmhAEoie9sk0IrI2ZfmnN4TTAM6T77Xoe12W7dlgkgEhuORF4eYMeiyVZUOPZL7UY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB7481.namprd10.prod.outlook.com (2603:10b6:610:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 04:07:21 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Wed, 21 Aug 2024
 04:07:21 +0000
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
Subject: [PATCH v7 3/4] scripts: add verifier script for builtin module range data
Date: Wed, 21 Aug 2024 00:06:59 -0400
Message-ID: <20240821040700.1919317-3-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821040700.1919317-1-kris.van.hees@oracle.com>
References: <20240821040700.1919317-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:408:e6::26) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB7481:EE_
X-MS-Office365-Filtering-Correlation-Id: 57894707-2bee-4755-8c21-08dcc196c132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Its9rO/SXmFJ0hqof5LI4M0LMC2H8xcFTu4Ug1IE01Y2TdiUD2xPkf87IieG?=
 =?us-ascii?Q?HV+OqkS5ofPOlJ7tGeGoYUktJpPj8IZ0svqaBAbtgSuerwh0A270KE+hvgnY?=
 =?us-ascii?Q?mj6q9KvQUpvOQ8ekkj0iaQQu38aB6ahaGcENzJicMFARL6nJ05MGfa4EAtqs?=
 =?us-ascii?Q?j1hKbi5/ztq40yosrFyoSjLxhLDZIUNuGqptrgihqZ8rjs5mV5IM8JNygdrs?=
 =?us-ascii?Q?WCjnStQzGpxAgAjyCKsv6D30Q3vDWHinUMDN8uPrL6AM9c3WhcNSa/NutGob?=
 =?us-ascii?Q?PTm85vogAJkwKGDw/UccFMVr8S/xESiBr5WrofwlBklBCcgxwnIofft2Asfs?=
 =?us-ascii?Q?cb1Q5zuNIs/dc8Bc/RqAwfy2IrJvsI8knflK/N0R1Rloah8sk8FGMx4H6cWG?=
 =?us-ascii?Q?8lty3tfr+NxlRYBYbNqZwm9Sofggm/FhMi6LDOJzBG4Aka/dluZUEbmS6ZY+?=
 =?us-ascii?Q?Y7sXLCdvi6eCBTSQQCU8rr/o0qTweyP0LI6lfF6Bfs6lu4snacatDT2+Jrro?=
 =?us-ascii?Q?M82ua31BJ7XtTF9G8b849vfFhtYh2Re1wQ/+3v5NgGsQWDPxV2oATfuRSgmv?=
 =?us-ascii?Q?ImWLBrw5YBumvJhcvTVpWlo++BGHwBStlcGPTqw3khr46EmONLoposPpB1rv?=
 =?us-ascii?Q?EX925Zm5LFeYcdp9jjP+hGseYQcwNbXgZ9FbgeY5fKsapIcup1AE+K1m8j3A?=
 =?us-ascii?Q?pCuRZYj2OGB3pI4U9zae8fugFs6nsyY/52etvYgXOo742zoA/3ZEdLwqr9C6?=
 =?us-ascii?Q?xjVi+KuwLFlX69DthlbPvW/SdYNjgEA404hmcCO2ClFZEUVsufoBTtHf6eYp?=
 =?us-ascii?Q?pvzG7xKEsle7KbmqEogQhs2ZpMNgUYLDg7tSmd0maSNmGByXjMXSYn8LUDKu?=
 =?us-ascii?Q?eG9sYtwqsZee1vanq7Q9p3F6JmI0dyKHmq1ibdarfkV29vpQUhBhb4WyA+Gv?=
 =?us-ascii?Q?CuM11mRu0K/1j0nPgHweH1CEkBUuqokOsqn0194hkOwSivNuWnHBanhHkePr?=
 =?us-ascii?Q?H09bEAFEQI7VUNIq2kf3UcTkBmEJcAN8OS5/a5mkJ9+DbXW70QkxGYKbXPtc?=
 =?us-ascii?Q?2nWkeaTMmASVslPv278yA2+Uzp75ly5ezB2+9x9H6Ji5u8xcMx5eyhkrMf7e?=
 =?us-ascii?Q?QmalizNF1Fg/jhYymihgpl0zGxhJjvHlKuAtBuTVFLUSO9EZ6yUnQelzlQ3O?=
 =?us-ascii?Q?nsb/paVuF1sH19ZE5J+bcfy/m5pbZo7XqLxvt6pC263rIJhzKLfYYUW/cLjj?=
 =?us-ascii?Q?XrjTLS6PZZ5krNwnG+lFklsQWkCXkV46OuzKZsu2odcc1YpuxbCyXPitZFkv?=
 =?us-ascii?Q?8xVNhpk1B1rb3H4KPSVzx4WctacJ9rSy1c5KwntR9GQR5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BWCPxYjtWOqpq8O4JwIEsIJzsUZ3co5Pa4hxiGwSDecPfr+1LxMnEXnkB/LQ?=
 =?us-ascii?Q?VasWlI5gNLjBV5wicpYeeV0CLxdLQpYo4mDJjqapcaG7ysbaawhBEI/F4vxc?=
 =?us-ascii?Q?CrfMFB+ro9gZtxCBP9hlgNR4lYJmdRjkcCxDvgAr2UDU8fhvoSw8uk706BcT?=
 =?us-ascii?Q?ZyuiV7UJZuxZfa5dYGLyLAT4DchhuYImG4e7xEz+GWy5SGflBnKdCLXYCGb1?=
 =?us-ascii?Q?a8qsf4dMyC6fU99xgtHN08mPRdsT0rzwJm9mTwCn2HAhJuUMjeONQQ/CRWTE?=
 =?us-ascii?Q?MKu4WJ47+FKOklySVqr9B8zA5YaM/9fuRp+Q3E6AYbLpNW4fA50q1/RBtLZY?=
 =?us-ascii?Q?ttGyXMZFv8tV4aTDj/4fWwZW68xZ2sQy3bXRu4OsxGpBJ3XegnnHB5hzy8xJ?=
 =?us-ascii?Q?1gPFkUNYU8QHH4XhcQYRJxN549UbVsTlEgOUbc0xokl1WUD5VMw9guT5E++X?=
 =?us-ascii?Q?oFw2yDyVbAOwVlu+ta7mhYO0gaUIgS5y17YDgb4cGSOPabwSwC+C/QIfs3Kw?=
 =?us-ascii?Q?i3IZN/R5D926jlUYCoTka99+hwVo6yq9g54lC785Bs/yOMdLm8JpfmeEXpaa?=
 =?us-ascii?Q?kmUOXrvsoWzCmhfNV44gnaCAc/uDKiuATKIIBeURHrJyGTSxI0HR+KdLxN5T?=
 =?us-ascii?Q?9J7nq31V/5s+L0AdI3/CYY0xL56w3WJbrSKj0Nj7hKklkxlRIUjHHzsdSwUw?=
 =?us-ascii?Q?3T+qdXr5ryu/HpMbb+jI8LTQYN397LKv6wotcZHHcVh47P9bTmITN8mq8lMV?=
 =?us-ascii?Q?WNv2q5APFL79anTooxU81X8qYaaB8Vs1aQ2LvqFH3Jla0lq5QVW9BPJ5++rH?=
 =?us-ascii?Q?6KKLCPdTeeAp083T9rqB+4d+ArrKUPSod+KafsRr792ELzzB3IbCRr1zLqF7?=
 =?us-ascii?Q?EU5ak+2X5L4gBp8rbQ96dxLmz9O2SRQuY88uqPSD2+zMIVuY74TqG4OU0GAL?=
 =?us-ascii?Q?wJF0+2mC7T1XXG3O8v8kioMNHc1mgzUkaeQ8C2h7CKBlnjpBjszN8nOHYNdp?=
 =?us-ascii?Q?VxXmjc09AiOJC5t19DKvPcH5s5emzq/gt+KUzQtK9/gPAMmRsDAzgiZpdKqY?=
 =?us-ascii?Q?xFe5JHusge14r7zTQbH33d9M6Sh4y2znWiUeeLLfkyRN32g4cIY3BvYS8jve?=
 =?us-ascii?Q?aDan6ldqkHy6wlw3RRFwZXEn8M0PHGWFDTPO2tdrbNa3RdGUxTkr3VRr1+Qa?=
 =?us-ascii?Q?YuCNtj1MfslQFQbQJcHd3vZsFt4PStpRBzjprzHDCUeOkDBJ3c10q6mFOS1a?=
 =?us-ascii?Q?lrslKJ92sBhK3hf5tWX0FFoofjNgI1QbJsNFBaDgmOfZ1iQvrVm40hXDUZ8u?=
 =?us-ascii?Q?sEy9eW5yu1vUzaX6xVi/ijMtBEm2uqr9KWVB2yKXMuOswZbNgr3XZT6JCxV2?=
 =?us-ascii?Q?TkriqeNNvGNReedXjlhtG4fnxTeojmY2l0zVQmDxd+lpg0DPdGgYqdYWFNjC?=
 =?us-ascii?Q?I+CpIh3B7rL5X2uXN1VwsKa2culLYP9IcIjSwoY+cOtieLD/4G3hqSz9Qq66?=
 =?us-ascii?Q?YUtevYm0TAD9FkKMzgFOmt+Idboigr8wxgmkAq7wCxFHibBPmTP0LgMRcrby?=
 =?us-ascii?Q?iucBz5nSqtOx8GcnZJcyf4xP0Ufk8GK0yyAvRa/UX8byBIE8+5VjKo0M4314?=
 =?us-ascii?Q?N7ph6xuS0GdlmQrfdr6A2W8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	73xg6tPlxZbkzhbm1Gf0ygsWgEhA36C/b3faTJHpr6Fkik0AkPt5El3fVK4HTCNbJyGlBF+VdOxIQaAiAKrOuIOV/IUE8caJYjovrK1MimXRNvOH9YNk6x6YhccUTtto1mqEWlJNEowe0kE7Atk48DuIjdl0ZzoA3/V7kRDsnlCF1dgzYA+Qf1zRlY5hjZk8/YqJ45SvwFvqX8ICm69gSNB94lNUTQiDR0KjXfVOw4pFzCNqAQ9TOAiy1t5s80013OyM4JQ9gdTlBNHmyM37K8K7gsE5KuTo2qTkkUfiIumQpTHDUA2lnxExDEUI01Mt+dyFR3OPlUylktXh+Ap+9d5O2duKymwitOkqcRFeLyx5fMCe9WdTDe9rEElfCunqXKbq7mkQ+1eBGyx75tt7Nwn2YcrzfKMY4pd0iA65bKQ6tebgMQecKIGMi40RXuYziOn7pxUyytgIx2SIu1B/nZQ6D8IF04NQg1hABtqq0xiPMtY4PzGiI6miq5oyv3jgTn/IShnkw0+lxhxI0fjdd8a/6NKwgBLd472PPYzrkjg7L55qqH/yyIUdHek74hA7JWxv/dBqhPrR7KNAvgrZWYp5fWJVufMdUQnqIlzRdyo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57894707-2bee-4755-8c21-08dcc196c132
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 04:07:21.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8VlGlAH59I14WwaNCVonoDj4rceGiXP6sg+MXJLPQ8QOPTO+KkhvGaOgDLwT+UrMxas5D3uEJ/NPaI2FzXWRAiTPLMBrY26eS7cYW8spi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7481
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_04,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408210028
X-Proofpoint-ORIG-GUID: ciZ4jBkbv1PLXSVh445jLQIDsWAEfl_r
X-Proofpoint-GUID: ciZ4jBkbv1PLXSVh445jLQIDsWAEfl_r

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
index 000000000000..93f66e9a8802
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
+			mod = "";
+	}
+
+	gsub(/([^/ ]*\/)+/, "", mod);
+	gsub(/-/, "_", mod);
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


