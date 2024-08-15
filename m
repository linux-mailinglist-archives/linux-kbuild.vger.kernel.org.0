Return-Path: <linux-kbuild+bounces-3001-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6A495368F
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 17:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02AF81F22768
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 15:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4CE1A76A0;
	Thu, 15 Aug 2024 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y7ZRlttH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wrt5zJ0v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D1F1A7068;
	Thu, 15 Aug 2024 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723734261; cv=fail; b=uw25+emeJZgL04HPtaSS72ZXNqPJYxJhJT+79KoXiDPkyjKgp9QJ/BCAxw5SDupjMVze4/oaBmbGJe/nsF06DIRONkMg9OJQnzxvXQ7hQCQlAmLX2I1RlxdvpL5Fvyl6JfJOkILAGB+EbkuvfHQyMJloYheS1bFXQzGuyboCqM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723734261; c=relaxed/simple;
	bh=cEONTywy9PC2pn0ZQd0GmZMKSqurVf+mxXj7SbHYHng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tznDMo50hujXm8p2cuxsNmJmDeLhPiuBQejrhPitY8F7Ly3hpkHM6Ru5hry8CM9M0ovuNmZagN4KR/52tL6yAq7OSnelprXFFhS2kXagZMADTGyBolV5SzBVpq8buHhi3yhzKJzJD4pFqEwlcCbCndI3NVQk4ru65PouJv8yOMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y7ZRlttH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wrt5zJ0v; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEta6S007719;
	Thu, 15 Aug 2024 15:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=; b=
	Y7ZRlttHPmCL//nipRMknsz/FWVy+ALeiago5gTuOEveNHAapxXCG8atXpcCJexr
	A8Z2fGlCWD8OykHtQN9mypYzeTmRjrVSjB8DI7gHgoIdH+alHscQo+pJDhxfD4vT
	fWDFZYKxihCp6ESqF1j3UpeAH7q1+ek9NvEAZ11kVF0zsW0Pfx3yjICjhGCFfUNb
	G/16Mb3F0myPEpsA2aQwn9vKhhzdupyw5rzDgFGsv+iGsv27IyxfwVFiwSYp/BCW
	LEiXw45Bzwtf5xiqo9B6gQsYJuPkRsoQyavKaNoeqmUbBTFIje3jL6Eq220XEDwF
	aRS2k+Ig0pJx9H6rxoIKsg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x039afyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FErl7Y003532;
	Thu, 15 Aug 2024 15:04:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnb4abf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Aug 2024 15:04:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaB2JXI/MwQRxh4w8/pM2i1ZmUUPbb9KrNRcQueVXMDe6KR32/e/3utw4DYwLAKtKm2kRhAR52sN7EVHUAvI0N4Z4yjucvbhiOcAZwNjimZEFgGlPFJBn1szgectaKBmKUxzdEjqVUD+tgL1wIqnEqKL4j2Js1of1CYu6k1wkiOuscfo6nLbguOWgtSNFZchA/AuyHPZgBuypBVQDa3FNxLXlYbLyBXhAX4lTAb6pcN9hylpxZ7WzYbJOnSWPxurkicB6oHCwgoqcWSHP47hw2MMm26mTel2oQU4X6gzrwEV7OLVhC9mO8dRHwtCR4b/6wLsygE8YXJLs4MrG4u8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=;
 b=vqQbmJ6Ddzm/DmeSeiw8RK9vnge2fw1EylcDE16UQzDNBoVtKOodA8X27ARXxU5z0kUAmNIH5navAafW/778guszGsTs4c4gMIhhumWTaa1D/HB78BWXoCJOQmbar/IsXKS01LAuG7HqarWvF9H0FOiFTvfUbd9D9c9Q5AkjATYJbBGVena2wBAWDXh+EMtLDkIIfuZred6CgZd2/88LTOJ2yAaCB8aGa5lZfGESKgswreMo/MDZKx1vy0SggDuTwXS8yupAueLYGqb/u3fPc1jfreVMii5crdFT+r86h5dMneIYfDjj5NVtaZ7UGu8kPNm0WkOnfxWB5vx6a2Ecvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YixqDMhab5DwvjOPkCCMuSsunYvDC0NxdMbagT+VLjc=;
 b=Wrt5zJ0vVhu450OaGtPGOtJDvdfFucnHD7RGew9Z/WpDTf2uVKzSNrjRqst+9WGpDyl/61dG+pppxhMtqrDjFSaa5ot9TFFKXUgVmavdTdeimaz7knnKbDJMqosSPuwBZruHAQGdCnCCTXVnONlsRkP6BpAG5DdqrZQupeyw+TM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB6657.namprd10.prod.outlook.com (2603:10b6:930:55::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 15:04:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 15:04:04 +0000
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
Subject: [PATCH v6 1/4] kbuild: add mod(name,file)_flags to assembler flags for module objects
Date: Thu, 15 Aug 2024 11:03:36 -0400
Message-ID: <20240815150339.1564769-2-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240815150339.1564769-1-kris.van.hees@oracle.com>
References: <20240815150339.1564769-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT4PR01CA0375.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::10) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 81de72d2-1528-4522-b3ec-08dcbd3b80f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oN66G1oeLfHth622dANd4qj3R5iYCkaQxMjoVhnjYdHdSk3JiJxtKbH1QS63?=
 =?us-ascii?Q?h86W+VKTcvFWf/q1g7q3AGF59cgXXVsNii1cNmN4fGS7ZJ1VTMHO7KZ5yVO+?=
 =?us-ascii?Q?Uqf9DGm/AhINDSKvexfRQQOTG2OQnxQV3B/KccZE/RIMV3O8I+CAcz2/eAFS?=
 =?us-ascii?Q?N4IFA06wEsUtLMSng/JwlMsIoFWNaakFGSunV9VT0OV1vNewca+DilCN3HyT?=
 =?us-ascii?Q?0z2+uYP1HUjZGb/stqk0SP6bWMqmzb6+aFA9rikdPqS08CuoMr2Q0XKYgzj5?=
 =?us-ascii?Q?JwpyfDfkUVbEyC6+V8UXUrDD3A3rS1+VyjeaAA5waRvYMODHjKebX3YAwoAj?=
 =?us-ascii?Q?q/0diIUTYPyuwC7UEp8iuo1BhLoP2tLJmY6i56Xj4nfoxqUJaGrS5nZJalSi?=
 =?us-ascii?Q?6yEUNY+bCFg1uUnab8lIlrVEBnTjLllY/ADxgSXMu+uLYJZijWEBkocqmUEj?=
 =?us-ascii?Q?50BWreGg69EauJO6elkh106C7JBY0kwQi8NCgf7Lbl2wYY3pZSC9k3bp41tJ?=
 =?us-ascii?Q?BlC/YqrKKm29sEE3m+3xahaneGTLHfH4ImwfU/X8dml7G8wYlc8hyfyk9Bx9?=
 =?us-ascii?Q?c8tMfXoBPU4cxAj+tfnQT4N5zaxN+y0F6GmaorH2ZCttC0cXzD40wHSFwcx8?=
 =?us-ascii?Q?y69HpjLeXB9m0DSOiVFapbdDGAb7ZuqDDnTvDVgA8RZxxFEfxpp/LNC0wCns?=
 =?us-ascii?Q?BI6tsNDQXuNvFc5aFq07zvRhZ2wULhvq6Se9t7zBu1IXyXCKTrtriM7K5X64?=
 =?us-ascii?Q?tf/MdMw7M/Rnk/WzCJe6MOyyxzceTpLJHMlwhqDsBjRIaoI6z6k1+TpEiRvY?=
 =?us-ascii?Q?6Y3kMkXCT1XoFf0Fqj3KJefn5WHOJ5o46mxnV4wu10DquuyobIJmwh5+P1+C?=
 =?us-ascii?Q?eOmTQIXo+qFctfyR29FwX1CqUOQ40nq9oaDTPAPvPEhHqrXuvS5B+BRKopCL?=
 =?us-ascii?Q?BwTymWWTMlpYgKu6ZDyUtJUq7JtTflma56OqFZlaUCR7a0dOSEkPMY9S0QOJ?=
 =?us-ascii?Q?WxwCrnYzAolDp4Zbzx3mKOAGJRQN1d6sNLfsY0oSFOTobik6641Tfn05jixi?=
 =?us-ascii?Q?8jnUtknViLfqJcYK6p34xVWsfwyInwyHIy/yGioxWYSFeLiwKRNJidxtm6Ev?=
 =?us-ascii?Q?6mVA9x5Hdgqz1AtxEWcfRXxdkjad61bRzmbCoLIboMZJPDpQCrZqbvUuOYYk?=
 =?us-ascii?Q?nw7lpQ3m37f+0unwsN7DbVkKRlctfQmhpSnbOw9PxgoyPwFtxM1N4DhZuqpN?=
 =?us-ascii?Q?WZRICKgJbH2407XgGW8WbOZiLfDJvuNSiQniYBovLbQTPmYiHEDnBGOpEXwG?=
 =?us-ascii?Q?MN31Q9NLxca2ANTSK3zGhIKODds4/vRB1u9jzNMi6q/r3A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0BJ21Yw8DeVKZBfpmzQY55HDb28vqoC2zzQKwijpVFGOLw4GAnzC8JOV4Rug?=
 =?us-ascii?Q?elhY5tS0xYHvioaR+kPec5NpeWXnJ7Qg+CxUFEtu0fhTNCqPamwn83IXISdC?=
 =?us-ascii?Q?toqRTp+YTaNqezok4TM4TmlSpn767D2TVkc9+hCdBuaABUotkZciPRVSBOaI?=
 =?us-ascii?Q?s2+iVD8TTi4gn66qvUXQru9t91v8jv5DfqRJQW8ogJDHqcRvjQTFEDMKX5Ve?=
 =?us-ascii?Q?Dw42tJvMSqsz9dUxNso9a22qHp/PUj/NSG1R4DVW8A5DWrQW+lN4dl8Cf48t?=
 =?us-ascii?Q?bzAmE+WkXLE65BuoO9wYhiNasSDfUmqTzUPF5XaHV8PWrlG2Z6dcBL/+ZuWf?=
 =?us-ascii?Q?7DcJ8rKsTLjirf6g6QB/exBEAZ/qFZ8RTlLxRamvNjZars1hP9eJCUV7mFkr?=
 =?us-ascii?Q?VoHgVALkjT0Ixn6KVrd0/scXQHX3/2lG2Qe8BalqENAJU1NYSwmV14uOcJIX?=
 =?us-ascii?Q?wAjDCmUf2E2K9Z3MFSvOZrtKniVVZ2PWEetGzGqMWvZJPCFrWnI75Fgz7ysl?=
 =?us-ascii?Q?Be2O3Aas5Dg2m616+0waHxJ+W53Q7oM/gQQd3BEAl9WN+Dvqh3dmrgDnB7o4?=
 =?us-ascii?Q?Z1oheZtLT1jQVe/7tIB6Hi4inmygw1aP3EyitMsoJFwJOEdz9pZvvfQd1yFE?=
 =?us-ascii?Q?6EP2bxVVchiuj8g4BIf7vH7Tg3npl/Pb92N+fsRD+m1Ievm1Gok+8J011uYo?=
 =?us-ascii?Q?WEFRPqUEDTzHZZbPjJFZ3wme9QRTFtYBK3jDwwXMZO7kbGd52/2NBrxTNG62?=
 =?us-ascii?Q?1RKSw1ZpVKyu20MuRVZsAevAosUeDx5JmmvwJr+NcG5Z5m0Eeb/EAaUXrj3y?=
 =?us-ascii?Q?WRwWftUQkYYDdxuUwycFSTkkhVsuF7ZjRYZGcWKG2UBkLDJgxAFQX7pLx6gx?=
 =?us-ascii?Q?la9F5WSthqCRTf0rBHGAF6SYQgnVCevyDep50nuylnq8QqB1jO+JSd9xmkoM?=
 =?us-ascii?Q?lks/Y8JUkHf7/ZppmpDrBOEeTihXsTERLVlYlGm/K09YWfm99dCNFwgi3430?=
 =?us-ascii?Q?Z4D75M7jnj+WG3keOqWadx/ihwpxexCu1i9BIAaguVzzoKT7fp+4r5TCNl3o?=
 =?us-ascii?Q?VqXOPVprDiY0lcHqNy/hMgRiF3pd4SNkHI0L7rlhv0lbPPz4xNNjrP+NCLLs?=
 =?us-ascii?Q?LLgtfMKgSy0jgCj/EdpJVaibN8LjLbonG1fB8v2CxdVIPG0eQoxMDW6c7B27?=
 =?us-ascii?Q?zSRoyVgTC5fg2vvEO827D2fJP4Sv5mIkzEs4EFLcCp99qKRv3wSCjLWyGoUA?=
 =?us-ascii?Q?kNH/hIF5IqvwD0jgqZgXClLXYtcihfK6BBVX3v9z+NJ3Ft0rgJhkHwZ1qt8n?=
 =?us-ascii?Q?jOin4h3mbUvBLey+wBWLu2z1I43WkGMH3AR5GL3pTConYnF1IFu5txPJyv5w?=
 =?us-ascii?Q?ygzOQWJwJ+iViS6ZjYbvUN2YGiMJ+nB1w1r2DrsyudNtctro9Sv3PJu7w3FN?=
 =?us-ascii?Q?yuf94CGfmCPEvC8+Ypf02NuyDz7BK6bIcFRwTrztU4yTX/M3NmR5UtS89ItT?=
 =?us-ascii?Q?ZEAJy+uw3tbKASBp/+okJPORLR5Tg+9GXCdT+06GDBxFk+F+oKEmNHDlOTMq?=
 =?us-ascii?Q?7RZa15loWvkmAKmd3eMu1nJTlIzthZ4x1+/roWj9nsgW77+D4geicry/6ZJD?=
 =?us-ascii?Q?9+AuAHhUP7upkYsaRp+Etyg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f6NczJiDywG9wRIgSZfBnvPkDDdjgLNhkQoHaNNk0EAa3R5j7lL2ESTBf3Fd3Of6uxU5VRexf1uttvROm7AZ7v6VnZDJuREd9sHsoqsaA+3raetd8oyiKrcCZbAWilu3vNeauUKOC4k4yvMaU7bgUzo/zUlgF3x6t354uknH8NmFR7DdzQXvSbAuyPUrDi6Lqz2GX3UyirXOrFWm3F+iMMFLjhkhqGsehbg0MsdvI6Yv54sgn9MGNRpD1sUVFhmAWB2H/nHgo2X4ViNWPo45Uq8s00UiMRXoLbbYXv4QtAgd4ZxoVV+W8QYwjCZQESxTfrB/rLRhNbQb39I6VuPkHjL4Et/G6nqizDE5FBplLuZPjcYZk07VpuNEjk67Yy3YBNzouGQGMJEkjkm2EZGg6UvScV7FwkDSdIWBDXYuHL7YOswLFE+Del4lX1gZ7GLIKU3XoWce/FGrfUvKrLryv7NehzCzQ17Rcaw8ggL/8kAUVn3fI7c/rxSMQckP/Q/XTjlvQrsU1dtgYisyMy7/rfilAGhWJNsw+njuAZ3lq0r1G6ZlYNs64QKZpTjE8AO72D1Uj5vKDDTIWCQRp2zPcgb9n1SJU+ruv7G00E6YJSc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81de72d2-1528-4522-b3ec-08dcbd3b80f3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 15:04:04.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nkzOdCghf1uTXc6DRg5BBmotwW66z93lzm0RMPurcoLtRizT/edAWzpzFJx5lPAQcWqqlCpFPHHqzveC/faZA0w10UHE8Kd2YdPecM/xFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6657
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_07,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=909 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408150109
X-Proofpoint-ORIG-GUID: DQEv1WEQz0p2kOMEqJ3PEHCmVAg5f9Uq
X-Proofpoint-GUID: DQEv1WEQz0p2kOMEqJ3PEHCmVAg5f9Uq

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


