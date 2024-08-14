Return-Path: <linux-kbuild+bounces-2986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2859522BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 21:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D471C21C6C
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 19:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43B511BE863;
	Wed, 14 Aug 2024 19:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jj89CwJQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LyCMj9tX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120861BE842;
	Wed, 14 Aug 2024 19:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723664555; cv=fail; b=L+r68nXFaL7ivN4i8ryhxSm8BF0pAnFUUKR5TcWiv3drCl9xOUq8USicJ0shOG1snouOOEVDnf+GFBeq0aNzEHR7UVoQ22t2oygRf5kCfk5A1xFENUfku5dBYoPgjGCG5/T8B5Ypo5K0Nx6rA6s17BvkgHG1f9OOGkJ5BBfhzzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723664555; c=relaxed/simple;
	bh=vQPV4BqDSLHO51Jkj5MDkpix6UVFN+wtA0PzhIIjk+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FCdVO+eMg58Ql/fddBYJwVp4+2Urf1M8T3Tc5j7qaxx+96Yz57VTBenpfHiQFOE3BjzZTJ3hI3aTK8QUkXjTqbrMgm45Ey29ixglSbPdenXqOoEXW6Bz3ZI4oda+feY7zJtYceCAC3JvDqHT+AG9RokDk/Qzk1r30CyDPtWmEB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jj89CwJQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LyCMj9tX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EIBLUM015143;
	Wed, 14 Aug 2024 19:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=u7cOp/weKH91cvU
	knKgKrqMoA05/l5sGGqo4pQRYpr0=; b=jj89CwJQj234Wjs97YDvQ1oy8vh9MlK
	vZ8gyZ+6brPDqKUmO6QOxdX1QeBHU5+vHeegeGC2DQjsDjmeusAmF5NDKQrZCtx+
	2VsxhsaR5HHftRI9QsaT18+Lj6OrpMLEoFNwSeHQ2SUN/AU8MTryNTzAj3B2kw4Q
	ysdmlHPWsaXBT0OI2EFxZmS21gFRM3R7lmu6+TsdpkfurjkCSMnMsKzWxh87bbhB
	Den0SAoB5CyMseNIowLFVIZ6BtjhlFEEKtbUYuOfYfs4+k5v4y5bbIqxZoE/ihPa
	gzWTtkTeazcFkQHqxHGYrqoqIaJjxRmRd+clGMZJyGtvq4d/Iuc4COQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy031axp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 19:42:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47EIpBJO003384;
	Wed, 14 Aug 2024 19:42:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxna9g2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 19:42:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qrYEcq4zoXgEsuinEm3n0K2hRxhVcwdGasgvWApXjIZeTOXdSJf+K4WZUjklo2da4kUI2rghUt+beUIzmEZT5a/aukfxcKUOIDnOP9MiSNzBVn6OSPPl++SdeSNm3hFyyDso39fnp7O+hbgnMsrHOHIKbM/tbLiTQyyctAtCxU+TdqC/IN5K9jd2qlcUUr6kropegHF3d75E1076F9p6f7Dq81bwiRCRdlnyQNwcYg+gkXPV0fF8k1R0vyLLHG5kd+rftDYEulgTq7/a25OveV26yc8DJfvct937D2/Uubajpo9AMTGnyaUQuN62zpawFXw1wMzboRHkI3TyWWBfpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7cOp/weKH91cvUknKgKrqMoA05/l5sGGqo4pQRYpr0=;
 b=lFYNnIzyvCHeY5LIa3A8R3mFGuFeVLwNZUdRv2PkGvVy8Pva2k0j7pD9ndSRHixysJozZWSbAOtFighk0cyd8qfQlrBXDPR0uDsGtABB8Z/dnbxmQoNpT0UbXjAD14jfQ3x2zvdbR5FrOUIi9lOM6rwqW//FGzKxa4CMTQrkQMm8MTgm5+EBC/X28k71ZlwGgK8dkTALAQNPDJmZIbrWLB6aDuUcehvUDGSToqa4apQwG6mdRwu5888vBbPY9IwvyYvGF7qEGUAsPeZSYF4t7SxP9LYpPCqIL3Cz1Vdpm0jOj9cnZ8yhST47KJFo4FtxudQv/G6CGYcFNx2NKCWvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7cOp/weKH91cvUknKgKrqMoA05/l5sGGqo4pQRYpr0=;
 b=LyCMj9tXd5lzOTRKbqDp1neC7ltFVW9r+Aza+3bt04vevwT195+s1v+Gn4S/gGpyLxn0p/eihUuidSPsnHUshOiW86ccEP4wLoMedXuTV93QKLlHngnH/Z5o4lseD15Y5TVnx1VD7uhQaje+QR1dTm55iTKP1aAMZI+/Z1KrLEo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB5162.namprd10.prod.outlook.com (2603:10b6:610:de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.11; Wed, 14 Aug
 2024 19:42:22 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Wed, 14 Aug 2024
 19:42:22 +0000
Date: Wed, 14 Aug 2024 15:42:19 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 1/4] kbuild: add mod(name,file)_flags to assembler
 flags for module objects
Message-ID: <Zr0Im8k6KSqfZLyp@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
 <20240716031045.1781332-2-kris.van.hees@oracle.com>
 <20240814131746.0a226e34@gandalf.local.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814131746.0a226e34@gandalf.local.home>
X-ClientProxiedBy: BN0PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:408:ee::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB5162:EE_
X-MS-Office365-Filtering-Correlation-Id: 929bc664-00ae-48e3-7f78-08dcbc993704
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5T/sJNod5AKJexiNa33879XxLFZMxQ1oBcuXEHbxpL2oB+1b6dMmZVWJlHPM?=
 =?us-ascii?Q?e7j53QQINPqv0Se7gTgMHonTVArjx3YJBFkEejtmLyYypiG0dhYr1UwjqeQ5?=
 =?us-ascii?Q?77wG8rBbAIKcYpwK+onY9UU09YRAlNEsSHcLXFON488EYzQJujPlZ+z4KHhq?=
 =?us-ascii?Q?m4fe6J1rhjLdnpTXe7yj336IoaT0f60vjtqUr7HrJ9SDD4Cxb/SEpVfXCvYH?=
 =?us-ascii?Q?H8iT5CND43A6o8pbJ/8hu4YHWpiCudZBnB8fZQF2RKbulQMX18Gj5JLJJ/Df?=
 =?us-ascii?Q?LTNXZuJtztr8rxN3y2aZbcF/Zcq465LIXs09YgFJv/8U15VuGnlL8AkPza9Z?=
 =?us-ascii?Q?By+Wy3D7MYLMTobklBo8eBdj/NplAWX/gipoiLFAQkKLQiTdl54+fHFrfFLV?=
 =?us-ascii?Q?sKl9lAR40sVao8ByHkiB/OeaUupkOKVDsF/gaAnQFzyL6egPA76phwM8lqlo?=
 =?us-ascii?Q?7jqbMLd2ZjNdzUbz5sNvg6u99vscPVwp63zV0H/Oo3UNBgOdIkdN5FGVlGMl?=
 =?us-ascii?Q?uLMWCiH3RroHEh8c8/1VUIUWsIJiCniS2olecVv3RP3/sQ4kM1UYneLiT+M4?=
 =?us-ascii?Q?h3kfBzOGRN4g/OYm1mhK+zSVWbGwMltgBb6lQS9zB3Ox89nYmWFuzcGPu4qD?=
 =?us-ascii?Q?E16VkNXkgEFzeGrME2teI4FHvjeTkKJi9F8h0xvsji/16GTavqrqfO9TQcZG?=
 =?us-ascii?Q?E/UW9yd9sI0fhoukfFgmqipzIvnvnE8esXxmlKWhJYbiyoKr9bXEFUisBWIa?=
 =?us-ascii?Q?d6t6KdBqWMzvAiEu4IFWiNpOl2ChydB7pqdOrDpChmri3gBvM1295+jj3OzH?=
 =?us-ascii?Q?Zfvomf/R3pv3Va6rQW+Cl4CKFU0ZSgCy+evIizxhecxbVgvsjBdMPrEALyUB?=
 =?us-ascii?Q?xLWUQLOQX7tDeu475TfyvPvqsl0cyxq4RNSU8x+TfwnQvxkjzvYdOhbLvqjH?=
 =?us-ascii?Q?fq40YO0P/l0nlqhTqr1kerLPKOcoWCvfjYG22YjEMa42ha8BciBOxb4CQFbG?=
 =?us-ascii?Q?OZS7kmYZ0b9AjVTLFJoYzDaTc8qaNOfoA9OJ+tCvyObmT5BmLg34vbtX8zY6?=
 =?us-ascii?Q?dM5LjfZpk88D5vBFROj2Lc8Wus23XUkkb5quh+ZA7lXVQD92z6/WgodzBGqH?=
 =?us-ascii?Q?Bs7cK9mZ2S0ka8414MHei5QrKDQlANh4g2ojrA+riwPhqOSD8v7N0WKXbo8w?=
 =?us-ascii?Q?pneUoZtxONzoH9rW91XpPo0YeCzTnfrWJv5ic6mt86sGmH5PnrtdccA4MxhG?=
 =?us-ascii?Q?M+4KWtjr7/L/1oO0P5IOn0912NJeonlvzqkXeNkON241RvFHNSwCU8u/dPFs?=
 =?us-ascii?Q?CcT3HP8Mx6SXQ2nFS2dc1tzdn5ZcP4cSQ57/gE6RmlYMaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hBxsBM39crH+N283nvOfKuXK/wEdtllM0YxRxSVFla95d/H+uuOEZl4gOrlc?=
 =?us-ascii?Q?k3F8yyuD/JnAGWhEspxMLlF0CwowSQvUOr0UE7sjh4sodgHNdgbwyXBMKPKj?=
 =?us-ascii?Q?+RGnmKBMwXG2yBxAiuZaBXxM7Nd1ilxNB0vPzfLMQZ2dKvMzfHS2CcYgc9b3?=
 =?us-ascii?Q?WbnVNHqqE/gHsGbP+H3JKcZCqgWhw1rK+FTL2OXuIeVyhZwh4puI+oak0aWb?=
 =?us-ascii?Q?yNUTVhAADHjBc8odjYm7T9Wn9v5dujtESgY+jRPOsKuBf4+Bw2ampF2bxSGd?=
 =?us-ascii?Q?6o6qaCwTxMvC5zNYwcOKmHUpnhjycQVLQ90ZHlpjzdVgY9o1Ff8WwFH0D5rz?=
 =?us-ascii?Q?TnRnBjPdveABMyD3dVbg84OywGHfvrH5eC4XM36uKZIk1FB0lHmg+haC3lDB?=
 =?us-ascii?Q?QYR/BfCjc4NVliquGdKOhLT74FWYA8LowSm7GdJrwdcgIMVKTU5uPLYBJrKK?=
 =?us-ascii?Q?y1ROhNhk81kS787j1/2EfsYPTBcpQVOIhJ0Y5Az/c4CG7SEPAGiaAiCpqC4k?=
 =?us-ascii?Q?k3RP1lcHuehW8GJl1Fz9dgq+U6A7K/+Y65Q1kjowHcadzDrEfYXpLfzhwSVe?=
 =?us-ascii?Q?zu9A53y9SKeEWLnA43rvC+guMMpwq782qxUE2B8Zb53aX4aAGrxHoG3e6oTj?=
 =?us-ascii?Q?RfcBCN8+O7JCepstjV+1L6Jcl94P3XUevnS+oc1+EFHRT2ZP0iHPn4NdDWMZ?=
 =?us-ascii?Q?L4UCNtU1x0Xy0qumGa5f3XQxqquAf5NRcWSkOr18JINFFUOA/NznsGvsXISK?=
 =?us-ascii?Q?eRLgrLyZTOmaqdi64lGA9cWoO1ORWKwVWbnSh2bbjaecnoaz0iVy6WgOEPKx?=
 =?us-ascii?Q?gkYxvXvlQpIe3utJ5tMtjHeQTdI4qYDZI1PtZ9FJ9hJcDjmdiVMvXW71wrOM?=
 =?us-ascii?Q?poGUWu2fKn99xUGMs+Ea5Z+J+KoPt1QFSc5NqMbUr9pFG7knQeGLeK+rxBCU?=
 =?us-ascii?Q?A7zybeLRpIuBPylKIqwzvg26v0GHcH6R8UbT2UorhiGW8FX8F4//etcIKDYQ?=
 =?us-ascii?Q?uMoKFUltyJ7blngmLUMYw05OLLN8OHXP99jhY+LtqkakU1S4YU41J0mj8JT/?=
 =?us-ascii?Q?ONmpkFEOZyH9sEhZPZf8s43pRe8rNo79CtK3K0/6jtDyCH9G3KPENSGDMBjq?=
 =?us-ascii?Q?95Ijlcx0UKev+v4qbuV8sSxv4ZqXZo7APMV/uJR/Qg8ZFXDGe+I+CTXm5xLc?=
 =?us-ascii?Q?a/Fb6VapWX5K1veQezjpuHsqiYpuODvA+K3tdCpIONes0xYaPemyFOQjAvt3?=
 =?us-ascii?Q?eM9hBcM0YBaSTHJHGqUFTbv9UAegikQ5uxd2U7VWYINO4j1Dgk7PZn3rz9Vz?=
 =?us-ascii?Q?pRn5lg24grrfRuueEa1bnvKQhRQt0NwdFB7hNM/64y08WhdM0vExp9YIQoT5?=
 =?us-ascii?Q?hlcBx/f2twcKVvNYBrwT4kLotQvkh2KiqKFxXme3R5cGRl/lUHydtng0JLh5?=
 =?us-ascii?Q?TtmLZz1F/ETdohapuwkxr0jXt8X+J/Fv+xtWSexHwfLIuaXh0uNFd+MswGI4?=
 =?us-ascii?Q?FzCSwdugVwMOHAgk08D+pBSIRsm5EM7eToZocewvLsmYLHZBnWMt63T3RDYQ?=
 =?us-ascii?Q?XAv8PPg6yOsTRzf/eGekctakszJI4+d5vb4/qTr/yQ+XThKxsbFaCrKMJk7m?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eKJNVQYnft9888G5+O55hvmCjXKevmfHkeIHP9k0wEXYiuHrBQfQdyi20K2je2iqQiDK3HZnxXyLUuvLfBR2HAczaBriwGfwfbuwyXXOtZhtls3tr2UhLvpvOZ9nU5ackpnGyhxjhM831EqKePavfOgkSSgdSEmKvRIRCkc6mFNayok3jRLXyZdyzT15YDh7PuuGfoCnZWErwVdC9Vl6+onw/OSUpSzD77wKsrEiGmN9LRCpPYuaqX9L1PBj3dSn525vz8xjUo1IB+XwvN58D/nk4DhyfBC3WzuUaOlqfsxmys3dWUh9yDBYsJdqxX5ehlmdzs8iO1NaJTHTkjK2lQrqoMVRzg3u17cShZv7W25GcAu/EQV37CI3cmlBwNwfUhOTSnSreZIH72G1kwceRZnqzQiA9NKiYNsExyWgm41nKSr07mVLgjIItf151WXK8JnsL1uIuwCCnhpv4zNfY8+OdRIoZVr99s1/C5OEhs42WK1KTRha3bDm6CnGAipWnALqfErqkFMJRQ0hmRaS/FqcgBLAtUv0TrYlaksW/9BUG7l1ZVdS0UzDDwpibujY40nwgK6KSdKEy9WBxuzgiN9AbmzfiK/6zLCTJWP2Hcw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929bc664-00ae-48e3-7f78-08dcbc993704
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:42:22.0056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XexjxBO+zKPfEK19uJuWFZluXPpzQ9jucOWiHSTN3JTloga7zbL/xpH3Tt9GEVBws9WcSmDTGW2enBZnOJUgZaL09xfkS8iP1i2Omt3XRtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5162
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_15,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=914 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408140134
X-Proofpoint-GUID: l4oS4LdqCjK54LxOzJm4xx4Nvn7w3E0A
X-Proofpoint-ORIG-GUID: l4oS4LdqCjK54LxOzJm4xx4Nvn7w3E0A

On Wed, Aug 14, 2024 at 01:17:46PM -0400, Steven Rostedt wrote:
> On Mon, 15 Jul 2024 23:10:42 -0400
> Kris Van Hees <kris.van.hees@oracle.com> wrote:
> 
> 
> As mentioned before, should start off with the goal.
> 
>   In order to create the file at build time, modules.builtin.ranges, that
>   contains the range of addresses for all built-in modules, there needs to
>   be a way to identify what code is compiled into modules.
> 
>   To identify what code is compiled into modules during a kernel build, ...

Ok, I see what you mean.  Fixing that.  Thanks!

 > In order to be able to identify what code is compiled into modules (even
> > built-in modules) during a kernel build, one can look for the presence
> > of the -DKBUILD_MODFILE and -DKBUILD_MODNAME options in the compile
> > command lines.  A simple grep in .*.cmd files for those options is
> > sufficient for this.
> > 
> > Unfortunately, these options are only passed when compiling C source files.
> > Various modules also include objects built from assembler source, and these
> > options are not passed in that case.
> > 
> > Adding $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
> > adding $(modname_flags) to a_flags (similar to c_flags) makes it possible
> > to identify which objects are compiled into modules for both C and
> > assembler soure files.
> 
> The rest looks good.
> 
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Thanks!

> 
> -- Steve
> 
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >  scripts/Makefile.lib | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 9f06f6aaf7fc..f4aec3553ff2 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -238,7 +238,7 @@ modkern_rustflags =                                              \
> >  
> >  modkern_aflags = $(if $(part-of-module),				\
> >  			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
> > -			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> > +			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfile_flags))
> >  
> >  c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
> >  		 -include $(srctree)/include/linux/compiler_types.h       \
> > @@ -248,7 +248,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
> >  rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
> >  
> >  a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
> > -		 $(_a_flags) $(modkern_aflags)
> > +		 $(_a_flags) $(modkern_aflags) $(modname_flags)
> >  
> >  cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
> >  		 $(_cpp_flags)

