Return-Path: <linux-kbuild+bounces-2977-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15934951D02
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 16:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 980841F20C9E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 14:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E811B32AF;
	Wed, 14 Aug 2024 14:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BMSp/+jT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iq4T0VVY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C91D1B14E8;
	Wed, 14 Aug 2024 14:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723645474; cv=fail; b=MGGecBdflEvgrfWrw6KrCCRxaRIPJQSa0D4PhyhCwbxWxqeIauZjTwRWqkoqzO/ZHJedpXyCh84UK+ECzkAWg+xTyGYr6SoaMI8AOj+xXtel+ar7D4mIBedMrVfWmMDQsQMWBo1CipiXGXee8ToOdM32xR6VZJxzUKJeU1eyjgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723645474; c=relaxed/simple;
	bh=E3xhPHZRLwEDsWpgc+RcDs8Uk72s55WrEDkdxrIZWC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Th5s9849A5XZMOH9ElFvNQsG/TzfOsRfd2WN6t5Exfc2yC3TBxXq4exhNKBn/cGp5r1BbA9iVufbrOV5wEz6h+srvRs5P1yYeZ+g1zyJQe5IRWXdujZvoxzjd1QQtdSRT5whJlPeu9vklW+778mK5OFIRFZHHd0VS1nuQW8HfFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BMSp/+jT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iq4T0VVY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EBtWIW015155;
	Wed, 14 Aug 2024 14:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=jxWUGilYA5BODKq
	lSRk+V6lmlL/SuHK0QtcaACFSJjU=; b=BMSp/+jTIXFMv9Qhu+QlsfiqGua8DWc
	qS+8G/AZw3itOLwYnPaf+DAC3I6M0UVmo4mtchTxNjL2sOUF/ErJfM9pgZrLDjRj
	L/E1DajbAA8p963fbA7SBiXM5T9NYGoeJYsxld4ZmnUXglM+OfJ9spQJ3zV2G3cJ
	41wGr/n26XIRQTxGrwjeGhZTSnehPpEG/ciKGRdLtsBvDD3n4l+D4kuGi4KL8y4G
	dZy4c+XwyDocmKHU7h9viHZNsaNI4As3LCsfIlsJYwVVXkBEbrC6W3jUMAJeLSUP
	Mw2nMG+2SlJtvR8cNHog2qjzkIgYBSFG0wK1i/q7TDhaw/4Krm4g0+A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy030j11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 14:24:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47ED5ANJ021071;
	Wed, 14 Aug 2024 14:24:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnggd8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 14:24:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guOqFr2UfUCJTDAb+INB5v6vC/9LYg9XbDLqquUlKgzv7rJw8YVnjB8Z+RStlq3Rbvu3DEPePPFPUwlyqN3v3r+0WT+E6GMU56XiPPMNuzdCnsYZOIYz0IjYi/FOsEJYEpb6f2pgkiIEfdNmjhHpsNK7qra2dKH1Va4+wt2/bKJu4ygoW4MwBZDVDsGpKUDTQXwG5pYMlQbFT5C03rXr/+860nccOcx4i0Dm2TE1Sx5bjoagpaUtfrf1nVzzafzOQpGmwTQE5+nnG6ARWSpvHGzoY2gqKRkuEvJsgDusgllLQ0CAxHr3CFjinNKR1Ov6kqiVJ9QfBitFKyLg86RLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxWUGilYA5BODKqlSRk+V6lmlL/SuHK0QtcaACFSJjU=;
 b=e1QPEZFySQzEVvjYKz1VxoiLnlnHiZqZviZYJbA/qG18e7G2mHQKhfQmlZAQ4zhz/ruHZz18bFXzGbVxxnFgDo/RwYGr51iBEWzTSdJ95CfvwGmA5FjvAZLxWq0EZkZl+WsDEUKyDI5wRlD7fbM9ZKt4lNHjFGAMpChfnmzclPhazrRp0eQxqVkTrnXDQJAEg/F7pP02pUSTAILpmry63qGetVMEKZ8tfiUCP62yDZVsdOErHjJeoM6Z0E8cWhJsL1Zi+a5p6HoPxy+bnJiarnF0QsnG1ZCEZGhraLh4qlPk3/iJ+NmrU36jwBHJ+fU6IhVNyeSFbkvc+vDUi9a5ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxWUGilYA5BODKqlSRk+V6lmlL/SuHK0QtcaACFSJjU=;
 b=iq4T0VVYfSHl/fX31jBtNFJcTnFCBMcIgRrdo5aPxrlxqlPISVBQSfeax9AMlPMgNTHQ55UCAia5XPOugFXBbnVkHNCbpMYPxO5fT/zj9X6/ruuCZoOgiT6dMmaY7JWez0t5DjtIAUYh726/taO+Q8Rnex06Yah2WMYXPSZFL6k=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA2PR10MB4539.namprd10.prod.outlook.com (2603:10b6:806:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.16; Wed, 14 Aug
 2024 14:24:15 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7875.008; Wed, 14 Aug 2024
 14:24:15 +0000
Date: Wed, 14 Aug 2024 10:24:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Nick Alcock <nick.alcock@oracle.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Olsa <olsajiri@gmail.com>,
        Elena Zannoni <elena.zannoni@oracle.com>
Subject: Re: [PATCH v4 2/3] kbuild, kconfig: generate offset range data for
 builtin modules
Message-ID: <Zry+DNhZcXTDY9lj@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
 <20240614171428.968174-3-kris.van.hees@oracle.com>
 <ZnHYooN7o2JEgsWA@bombadil.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnHYooN7o2JEgsWA@bombadil.infradead.org>
X-ClientProxiedBy: BL0PR1501CA0032.namprd15.prod.outlook.com
 (2603:10b6:207:17::45) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA2PR10MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: bfcecc2c-e753-4ee6-3f82-08dcbc6cc68c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2OsXPRSxuaSfMuKyjFkgnXTeiqNYIe44xdWelqjrONz12vdhinyUuyd7K61+?=
 =?us-ascii?Q?f6OnGSE4aO00d+/cddhskybdCXyQS7L0gxre12cFZ4N1/Tz/IiG5k/88a3qS?=
 =?us-ascii?Q?/uLrCq410qVwYKx+ktql1EU+h4Fghtbf5EUKo+ahFSwXiCwXcxzbVwE8fdOV?=
 =?us-ascii?Q?LoNUhGK2pmTLFSOOR9E3ac9wQyqEwDLQnMDAI6Yk5OeohczM6W+XFMJMA+K1?=
 =?us-ascii?Q?4dAV5g/YtR1ieTH7Vy5gprCh8SDmUkDyJTWERJzdkzpGQP4llpDsoQvcdEO8?=
 =?us-ascii?Q?e6EGUE1oy8j5+Frn0Su4OEbaD+Atbqiyw6wgkqXzdkrrs7johP3TBJfCfumX?=
 =?us-ascii?Q?xaQrWe/7oI1FIL1Zu9GQSv8OK8/q9G9cNzvrIprze4PCI7EC7UK6Nr0omPP3?=
 =?us-ascii?Q?mS4Dwp2VinCf0WI77Nwkm4O0RR7yfmwan5cYVRfRet4+lzuaJZrvcDqgQ7Pi?=
 =?us-ascii?Q?26fCoutjSRaJsFkknpFiXEnUSkclVAeSAXm9Erw78UTdrVlL5LCrZ9Qdj6XM?=
 =?us-ascii?Q?5pNeNTW8ZHSCkF/Y14+2KglBmn9fZuhTh33IwtRZYz4qUtRqawdgPteqRSBu?=
 =?us-ascii?Q?zrwl+uLkkhKZWyvGk2SdZbyeEj67qOPaVzP6QfraD7klW4/q1cCTmdLwFi6g?=
 =?us-ascii?Q?Xx3Ur73FhUaaZPQbGaWfq7hLfCeGwlO8YeSBq4JUWvF0yY5fbRdVnvg8fS8k?=
 =?us-ascii?Q?1TS+kdFEw/WS6eOfZiOvVFSfXJjaEMy4IUsfXLFbL+vI+rFw8ELV9vBRyH+k?=
 =?us-ascii?Q?ZNQBdCKTkntGejSdfB+d6MaEjDQcoMY3h8AlMwweek67qZHG8qcyOPeZST2W?=
 =?us-ascii?Q?pbZPzvFV6mcrYMnW5jFcr1WB50wrlsE5v7x/DqYVOEh3hpaOztavnpXKDpeR?=
 =?us-ascii?Q?UHWoRBwOSOASRRZIHhd9l5fDzCMobM9lH5S6F/NEoOMwWhU39IfSdcXcWfrS?=
 =?us-ascii?Q?r1DNVM473cs+1p9KX+nlrclzlkQPfPEnC+zdZegH4SS+caERktBU3fsHov5Y?=
 =?us-ascii?Q?zBMm1K4oFBqf9HQvbm9PoE0boDALUO2jrUte/rpk7BuCgQmUlI7PBv6OwbzG?=
 =?us-ascii?Q?SIiO0p+QFYwkT8jgWtY43enW19ei6SHLKdJ9AyiBulI0rJ0iz4QxrxfXu4E+?=
 =?us-ascii?Q?XGY/ciW7hr+7bqd5sJUv2OcBzFnDdUAK6Ssn6xqqR9xRHKAzl0a2JR88UlKT?=
 =?us-ascii?Q?Egf4Ur8Kv2Z3QrKo++Hl65n5oizVMCg3p3GfMf5o+G91WB1e20cradO1REEr?=
 =?us-ascii?Q?qkXqoEtTphaa9c4CV5Y9AnYmsjFOANqTOgjoatjSKwLQTdaXRZwn+fqxwWWY?=
 =?us-ascii?Q?zxA3iIPDHLIdgf9o9uZuS0Rk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?agAoeoOthxh5Y/7xxC913CE1i+Sm3qztKkJAYXIYpQyz3AZYqCNRsxxrYkTl?=
 =?us-ascii?Q?LzMdHsHPFc0Tz8SBUs7yfOMmMOMsnr1jQFcFOsWbo3G+PbHEbkGyVYXvg0yG?=
 =?us-ascii?Q?7MQvTu7FXL8JDQZK7bk8We1PHqCMlWuONpyj3o+7nGgRNMD5TGi6DZsU3oOv?=
 =?us-ascii?Q?+3hQLePak4bw9/dRnPCKsNdFPbnWFkwcizdN6uQopdeWu0OrY0gLOEgr4Oai?=
 =?us-ascii?Q?/BBnmg90w83+0UOR07QKJYcB6kX9Sb3P01xPW6zCAxb1PTQhXtFDpf4HtzKV?=
 =?us-ascii?Q?MHODIpi84S1JnY543yzG0ZSQmRT+8sAtv5yDdlFJB+kcubZPtnGwizB2BNg8?=
 =?us-ascii?Q?TY1Z/OOXPGk3oh24enQJ8fdK6YZ7zLs6bbCm4R3nJSMq0itLIwKOnEBIKsRP?=
 =?us-ascii?Q?iIX7CvVe2VW4gMqBDX4LWipBWDrSV8Ob6HHniwN1+9w1dKm2AjsHCYiQfWK1?=
 =?us-ascii?Q?GUb0PTyEQ4/dozVjNv9M8WzQZMEWxGUGqF8phXasxtj2hyZDRozcmOvwehQk?=
 =?us-ascii?Q?4xr6WYeygaLzibFlppXicRHVOA40iBgwWeSyXLTkkTSypxFznS3cJYZrzGyI?=
 =?us-ascii?Q?ryxWqGdWonhkmg+gBJPPLq4LdFvjhYUvKOjESvFZF2sK8m3+2Z9nD2NVrXKA?=
 =?us-ascii?Q?Rd4BlqCyEKoI0DNcElezi/WYlX9PVK1MBerqUmfKOY9WFQgIm+TeShZEbfEj?=
 =?us-ascii?Q?/dxPDYBY/yZFIDJEM7UOvLypjdTznqMDvRFqwCqaodUd+JrXJVjP6zMFTiHo?=
 =?us-ascii?Q?Kb5TqolwXpqAembFNRA1s3n8rzzqAqDEi16psXwlWtnmctkB6pArcf8YxGzL?=
 =?us-ascii?Q?HULEQ2Hw1tFEMm4h/BnU9BOv0BjpQjebnq0AKLRvbsC3Iu2wZHmKnK+ZIgLj?=
 =?us-ascii?Q?6BV88ZckVC/4I3mMxRy7qSqaY8keVsLEda4lxtWJO3fLHfYsI/5W0a7dPQTj?=
 =?us-ascii?Q?9aX7cBk+CH1oqDs9VILfynYgCJrRdFgRjx738D789/xItkC0kwIXCMuFzpFs?=
 =?us-ascii?Q?eaFfi8APviZi6T3IsbJ3UoRUKgh8OBnqMHQKtaQO33WXDbG41/RF8A9vTsKy?=
 =?us-ascii?Q?t2eh0i5bdjiWNXYMhtjkwz76AO4Ac4tHRd23v7HL3wf+zYI7Cy0WvVHkcKW/?=
 =?us-ascii?Q?1JfrKXDJU+UV+yDlvbNt1HyyRjY19xlABq5JFekxbkBegw1pzr5P8e2T8cJA?=
 =?us-ascii?Q?crofbmDpZ0/JjMB0S577Szonux5aMpLqHarGhj7spG9Vh3jRbkRHGAEQ+0Dx?=
 =?us-ascii?Q?XYxmOLKBaIb3oZQVU2s0QBoQ4N73M2cl/VMDP93spY/LJ1j3cometM8ed1Jz?=
 =?us-ascii?Q?W63JzdBuF2+WCiFyMbXwsHmlEk1ueDiDQKEMKwAnN9mSQAAvFZf2hA9y2aL6?=
 =?us-ascii?Q?tAPT1awFfuCGclpeT42DnfZNOM1KfX5xAZgrGEeLLGrtssjbjvTJKomlSHag?=
 =?us-ascii?Q?rQT/fQ2xnK/4VnGOXxVMbKshOeKSBP3CivbAPAmXP4IhsCAWEUp63ixvkaDT?=
 =?us-ascii?Q?XL0qdVb7h6SWtiq5LhQ39or5E3oE4lJaYhMHgY2j0glivARik6xDK43WXb/6?=
 =?us-ascii?Q?hsC0ktMjqyu2pojItLIcKPZZjnj2gJHNovkzdJ1ihPJv7GZNSk/zLSoXgyUz?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5WDusKKzPrBEAmCC4p0vyJis/wuIEufOqegcBdZtGDNF63vMsfrXWQGMYgLle+RPG5ENjSho/Guyq2U2P3/nZpDDsNjZtF4/l3Z8yDzO2hOcpg1Vla7tQWMEFAGJrqLzrfIJkGDNS6tYItkuz0RiQcG2xlzTJLQ3Sjay21PNa+7DdN8389LSXvEcS6tKxIiua4DiUOo4h/a8iknI2XB98M1U7FtnUWJgLexcDXhNHNd62KiIRXbXzOkPN0M21s2R7BZpPgHIGbXh3wMB4wG/EsmtpbKDbhz0qYIKCgGFdI+FXZGtJKKf+Ul4/KVEotZIbdb7MVCr7alI68frU/0hSZOnYn3IBHWtC1l0WtkSFdxw0YcPWwqWEdAX6NSpEKtklBnsodIxngUQbiN8sSDDJcZq1RXBiCFuwEEWB3wxmElxd3MhUAjqMxab+wIUuKZAte6gunIUvrkjkYtp56AVcMmjQFYCYE1TMePCy6xTUyXiCRk2RIJhO2SO73CWVYvrnQKjYDYBJtel4Ka5UoZdesZjWyck7/1ClRtuhYCZVwEyvOtAgodpQ36rdKixt3qVgaIWznIIYIH4gjZ5qjV854B1pqdLEMExRrvevu/NLWY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfcecc2c-e753-4ee6-3f82-08dcbc6cc68c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 14:24:15.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln96Y8f88NYXcQHESdJD0aJ6BZixiCUcalQIrfJhAz7dGX9a83UegeRpYIL0TeP9r9Q/9SBH87vhQ5LSRrLuKVa++nksT6PHW536KvJD+S0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_10,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140101
X-Proofpoint-GUID: rtIdoJ_7oi35FVAYsiU6XFzqtvit7fVu
X-Proofpoint-ORIG-GUID: rtIdoJ_7oi35FVAYsiU6XFzqtvit7fVu

On Tue, Jun 18, 2024 at 11:57:38AM -0700, Luis Chamberlain wrote:
> On Fri, Jun 14, 2024 at 01:14:27PM -0400, Kris Van Hees wrote:
> > The offset range data for builtin modules is generated using:
> >  - modules.builtin: associates object files with module names
> >  - vmlinux.map: provides load order of sections and offset of first member
> >     per section
> >  - vmlinux.o.map: provides offset of object file content per section
> >  - .*.cmd: build cmd file with KBUILD_MODFILE and KBUILD_MODNAME
> 
> What tests do we have to ensure this is working correctly and not
> spewing out lies? What proactive mechanisms do we have to verify the
> semantics won't change, or to warn at build time that this awk script
> will break upon new changes? Is this just best effort? Is that good
> enough? Why?

I posted a new patch series [0] that hopefully addresses your questions.  Most
specifically, I included a patch with a verifier script that validates the
generated data.  It is available for use but is not automatically executed
because the modules.builtin.ranges data is not required for proper kernel
operation.  After all, the generated data is there for tools to use and is
not critical to the kernel itself.

While there is always the possibility of something breaking in this generation
due to future kernel changes, I'd say that this same issue applies to pretty
much everything in the build process of the kernel.  Some changes will always
require other steps to be updated - I'll be happy to maintain this contribution
to help ensure changes are addressed.

The generated data depends on 2 main things for its correctness: the data that
is found in the linker maps, and the logic of the script parsing that data.
The logic (documented in the commit message and more in detail in the actual
script [1]) is pretty straight-forward because it is all based on a linear
walk of the content of vmlinux (using vmlinux.map), collecting the start and
end offsets of each object (CU) and agrgegating this information based on the
built-in module(s) the object CU) belongs to (if any).  For the case where
vmlinux was linked using vmlinux.o, the script uses vmlinux.o.map data to get
the actual content of included sections.

The documented limitation is (of course) that if no data is available to
associate addresses (or offsets) in vmlinux with the source objects (CUs), it
is not possible to generate modules.builtin.ranges data.  That is reflected
by making the config option to have this data generated conflict with using
LTO_CLANG_FULL or LTO_CLANG_THIN.

But again, given that the generated data does not directly impact the operation
of the kernel, the impact of possible breakage is minimal.  And like any other
kernel feature, it will have to be maintained which I will happily do to ensure
this works and keeps working.

Kris

[0] https://lore.kernel.org/lkml/20240716031045.1781332-1-kris.van.hees@oracle.com/
[1] https://lore.kernel.org/lkml/20240716031045.1781332-3-kris.van.hees@oracle.com/

