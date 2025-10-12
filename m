Return-Path: <linux-kbuild+bounces-9098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC327BCFE91
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Oct 2025 04:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A2D63BCEBD
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Oct 2025 02:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD0973451;
	Sun, 12 Oct 2025 02:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4UZTd8/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FBC185B48;
	Sun, 12 Oct 2025 02:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760235231; cv=fail; b=rjWN60LKl5TS3/2O+O7u+r5XLjh7fdQdSkKnkUxS1TZtGtUdDvaq8hwHoFOsXaygJlhsq2DSZbUgWUtBylwIrcGANEVEFW4tGadz8Rn4TGA2MhHZep+/8HhMu5MyhWXzhM1Ruz873e1c38ayDMdTVWQnhlDDYqeZD+VsFu0thWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760235231; c=relaxed/simple;
	bh=msmMJ+fWQqbLVOl/rPdEaRPDzIAc09CHDO3tYUerrWE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VustM62pjo/TXzYkAL9G6kRQEM4mzlYcqSpPteUTrivHaAlQVhF1tPEED9DowaMJCWvMZvn95IG30eAIWeFRFkwEch8tse3QyRsC1y8BeQAePvOQ6d9Lz0dWJbeu6b4vKjs+k3shViGhjiWkIL+h0Nb4OAgfWvEiH4C888MLvXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4UZTd8/; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760235230; x=1791771230;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=msmMJ+fWQqbLVOl/rPdEaRPDzIAc09CHDO3tYUerrWE=;
  b=m4UZTd8/L8vXN23hVoX/iJYsuWsgf7POqWA5NapNtT4mys3qgFSjOXg2
   B4PoPwtvtO0GlzcwyiVvLcrCkKtVjCeYfOafZGG0ujzyDMqYEAvFkskjn
   OGwWz0E+uNHBYphGCqijnTAKvSIMrlfyNpFwvJvVhpfMhovGRmYcEMFnk
   +K6+qJUFQulSQGf0FRQqsdYark2NtqMpotNRpXsTuoLKoeBM8Dn1NwAK7
   JxuLSXwio+Nprp/ysvL8R0kIYUlGeXC6PR1LOhqb/KxOKxqkSjIvRL61P
   tC8VRAJqc4GLnvPxzdA3bRoKnqNJXLsB+EFEk8UwDuMzZwYMNyrfsOPhx
   Q==;
X-CSE-ConnectionGUID: ++reKaUJSvakKAOVUuPHMQ==
X-CSE-MsgGUID: 8i1E6Gu4ROabI8l92U/cgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="72666405"
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="72666405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 19:13:49 -0700
X-CSE-ConnectionGUID: 5VPf6pwLQeKHrIN0VlLA5Q==
X-CSE-MsgGUID: Np++vidYSfWCwDUgUqLUrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,222,1754982000"; 
   d="scan'208";a="181240733"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 19:13:47 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 19:13:46 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 19:13:46 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 19:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQ3NpuGSRxexgrIBci194wJGL9YWjcbD3PDX1H2eUz96ZtHpML5oegTPyfvyV7SGJ7gkBFOyJoT7vJFOzgaU7qaHiViq+5zM1fpvwYVmK7kpPU1DiNnuLOPqReryKSvWNBzZc6ptDw9hcalkcv/bmcnYHkQX/PZdGUncaH6WNuGsqN6wNLdivM6DjlX07/Y5cLiDgl2lnaFTde6VcMxDraEGZn0y3l267+1VwaruOUipawFkFvF4oxjJJ+qkxv2eAUmpbX9gTLIHrdVnYwq54OYguAI6KMq3ks78GP9pdC8AtC5tALBERyDjFBiDnt83Kt1WCIFyoaxQ5XO8bCBD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KS/UUeY1LWq0qS8UUpc5sMKwZJFcgs1gRuPrvhRwvY=;
 b=Pp/fW585m5rpgbAKqHJ6qkYWfuW/mAvsACJoNfcBCGZc3s+1GhSvh/rEo/n7r212QA5fbGQRfMGtGnG2dMEUM+MUtJHb1abrsmeBiZl1YHSibBlXdeRR+/K5/x4u7Nze7+QjkFrYBSHMuiEOnxqGlDR4pXE5ae8nlceK/VvPLEQ5gFtUDyLNQw55guYQjCfahtlkUg0zmah477fBSWaM+AEpY0qxywhF6RfP5+zG8xxR5VpEVoHHmKwYKoAdZ2UU6cHQXy+4RjHi6h28AoxT5uWE3jFgON8mz+3KMNnQ6CpgzgGW215wY5ZCIjRdDmolerzogNFlsouMt4suhBb5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sun, 12 Oct
 2025 02:13:43 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 02:13:43 +0000
Date: Sun, 12 Oct 2025 10:13:29 +0800
From: kernel test robot <lkp@intel.com>
To: <xur@google.com>, Alexey Gladkov <legion@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, Bill Wendling
	<morbo@google.com>, Han Shen <shenhan@google.com>, Ingo Molnar
	<mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt
	<justinstitt@google.com>, Kees Cook <kees@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Nicolas Schier
	<nicolas.schier@linux.dev>, Peter Zijlstra <peterz@infradead.org>, "Tamir
 Duberstein" <tamird@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas
 =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Yabin Cui
	<yabinc@google.com>, Sriraman Tallam <tmsriram@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, Rong Xu
	<xur@google.com>
Subject: Re: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <aOsOyf3HHzTy23+b@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251010210134.2066321-2-xur@google.com>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e231ae-62b2-4ce5-a9e3-08de0934f706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wcTKv3MVBa28jFzhO+CU1uMjYv/SsVqqo7GCJ1nryWToERzbg3Ifw/TPovVm?=
 =?us-ascii?Q?zUVMt8b0n56XrHxcCSFIFdSM6rHQVjDpNW1FEfaic56Df7l+lBtbqTWydutl?=
 =?us-ascii?Q?EgLb84l0n15Z67l0MRSEMgUI624CYsBD1F7MO0XIfJkeBxAnfw4x4XENkCwJ?=
 =?us-ascii?Q?12zKw4cd0dUjlLPwk8DfpVoZBPjGrV9OCpM9MwmwwTZRxsAQVZn1AxsDUCKJ?=
 =?us-ascii?Q?gqqc4ewZ7EwsjwT0MH5tp8fvhxDx4IX5BuDa52bsnSghv7w88S/zSf1cvqyB?=
 =?us-ascii?Q?bNmzbSaQPlVOA21UEpsMVtGl2B9WVJk/mRUO/7YJ1QsQp9/9rzqq2M3odcdj?=
 =?us-ascii?Q?XWI0nOcHtGqoAMiS8YEZNxlxoRn5N0cdB8H8mmRAsadl6QWOc5D5YIz41FW7?=
 =?us-ascii?Q?RkkiFn0Us2eX/g9HgON5xNspr0MMVRiKjbra3BPLVhsrK7vK1pSeIVQOpWSu?=
 =?us-ascii?Q?eTUWy7ngFgXpLEepwSDBQPYnISVHpE11bBAaghvrZBW0q8QvxgGrY9GZrfMQ?=
 =?us-ascii?Q?Ls3dMiZ5VBIJSqaWFIl0u1tvLTSRekCybNkAunjAdfQaKDf/c+iqKNuo9i/3?=
 =?us-ascii?Q?o3ijWVPuDkM6qG8l1UCYxT/gCJkXTev0jyRSKrLmvnE6ITPlvurHraSQG/Fj?=
 =?us-ascii?Q?mzlNyT3i0LZD5rS2juVCdFd3I2qTvchWa4e0PaTh1raQ4qH80FhhuW3LsMvB?=
 =?us-ascii?Q?ai8+3pGlskQ2cghAtZuxBM8w0dyfaE1t7rt2eRgmvdDUmSN742E6qcYwuTh/?=
 =?us-ascii?Q?gF/0McyGQyXYv/+igSZV1My/5cLI4qkY1x0WZivRSNCqNlywRIb1etBfuZS6?=
 =?us-ascii?Q?LgA9WFNatm91uGFso7NRyzN6m/YhYI4Sn6RC3J0Yo9WAIIB8nteBK6fdzf1/?=
 =?us-ascii?Q?75hrdsQYJ/amq0P0X1g24em4VckDAupENVea6dh4mjgjbJ2B5m1NXurVOfek?=
 =?us-ascii?Q?awrgePjGhnnFopdWin15SJ+8gQ7SaGM7NDyDmPlhtUUbrAJugIC35Yw64O+8?=
 =?us-ascii?Q?aVbyuZsOkQxD0i/amMtjI8C9sXL6UdUdyyrXGZV3HCsChoBIAGryqY0SsZEp?=
 =?us-ascii?Q?nbRToQzzsVkgGYswXBSyHEbKD88tGUpxR7pttyD7rbyAVtHxVKmHaXqDf7zA?=
 =?us-ascii?Q?KWZexPytCEiqpt/RXEp+A/94OJ/8aPjfoZn9O9BHp74JRejNmD7I1yFNoz7/?=
 =?us-ascii?Q?tP5sLmU4xt1aKPzbnqNJhNHmV5rVoYQ0iYoNPKIY1MxSCooJsS7VRQugLZ+2?=
 =?us-ascii?Q?uhJZwnMNApPfe1MQ0b4C/49rzQt8GSI6rHPODJF5nNSVWbj+Px08etvS0eKq?=
 =?us-ascii?Q?evkcahgWOHoKdEYGOxIsAc/7u2lJJEtLZQ6E0JBYhMegeBK08Bzsd1zkj5V3?=
 =?us-ascii?Q?9Ur6RBayF7+I7nEIoDil3Aiqn8kI7L2G7UZ4naY7ffVL6/I8/ETkme/7ZJH3?=
 =?us-ascii?Q?Ml1hjYllIem9Jo8FT0PR0k159G/USbgxe1eWRn6SvYrIwIg7csYGMQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pQRnyotZ3xRrDWalye4Roya9ZRTfPeF3sJEc8Cm4gifvrMtO5dgr46IkrqC6?=
 =?us-ascii?Q?Sim9XPuu+sqaGn1pN6jdKZzHTkeoQ0z/YV5Uxl2mXaIBe+RbWr4Ypd3nm2Jn?=
 =?us-ascii?Q?eToJVtuFnizMDwervPGdfVQ0eaDu8bpq/g4JZ284i/OvMVW/oUEAPVJzVRVY?=
 =?us-ascii?Q?/nmWCwLXFuTJSsOscjL0WckFQlV7yatvohqdV/y/8poH3KWfu/FisD1VqJSo?=
 =?us-ascii?Q?8H1zupqGz5LEeUMXVMOGv8be3KPB9LaglJZicqOKr14O+7NAHVIlsYuVTz/b?=
 =?us-ascii?Q?ASClaz614o86q2184F2VGWGJfiAGc/0gOuwZjBr7vySN7sB/Jk65k+sM6y1v?=
 =?us-ascii?Q?TkIoQH2N18LqEADuDW4IUiRS60Y5QjfNw52Sqx3D3Pp/P6EqKP1rHseeAs0I?=
 =?us-ascii?Q?drdUNzUiIpasTi9j2bxNM/fYUUQNzIg2DlYTxzORbW6anmpq0J72jhPd18ZJ?=
 =?us-ascii?Q?zMdgfxwc/Zgkf4ODUTNLdhXB+a/6aM+h22+iAiYleMYdSjbc2h+swFykNmsq?=
 =?us-ascii?Q?OQPOECZOHuD9hF8n7t03VfVT5ZmKlUD4hM+R6pQznqX5ilHjzLRsqQTGlHBe?=
 =?us-ascii?Q?S2kA47UQcDMrquAlZytfNETQ2FpTC7Kd+9HSBBJ1XXfRYCf1prkUD0mvJrJ2?=
 =?us-ascii?Q?OaomT8mM53qs92Rd9RYAFgsn2I6ruDrxQIMFA177i0g/QcoGDjkjoNIzbrtd?=
 =?us-ascii?Q?weLEMVgkzx07ynL23BONXHhfmQIltIXsBA9mRGnL4Ovt+1S6BrT/Nmw16y+F?=
 =?us-ascii?Q?8h2LZf/OXL1fO3HRrLrguYhjKibeWYVVQ/YFLCyxzD7uNjvC8OXMBvhTeZx2?=
 =?us-ascii?Q?6tKmqpRZFv+h0WSeAAjrdLBl1838sGrQCMb2AAtzABTU8RT6ljsTRMIzYczr?=
 =?us-ascii?Q?gTt2EXWIqHtuGAuSwgGAML1tdM5IuBoSEwv+NBu0/u5wGBeRbHcVYugSZnE5?=
 =?us-ascii?Q?R5iCDZSBWuanDGVil0sVIijLec1+RyWXC2mLm6mvIJTbqouo2llUXB1saCuk?=
 =?us-ascii?Q?QAN3ic95wo0sKbVtDel2rJmqxvsteQ80ollJfOl9rvIjaQeR15hkfPvOMbnf?=
 =?us-ascii?Q?VW66UL1H9B1AQBesPQipUG97QY2LHbb/oFsuSRO/wCT/5cnwfRQZKEMZACqD?=
 =?us-ascii?Q?CGWaNTD9Bjb+3WfEVwPE1GC0Teyr1GuNnCtGz3mXGdjyRaDCvGDK2uNjjis7?=
 =?us-ascii?Q?dSrnQXPRHW58OY4fu69Luq+xx9lNN3c2h9DkhUmnEkenmkMDHCqZwcnagbAC?=
 =?us-ascii?Q?JlyEys2rQMlYE+9bFYJToMogWpM1rLzukA6ncxwWhvf4P2zCiccuTLXsdO2x?=
 =?us-ascii?Q?NxZZ/QCFpsclv/gGDz6l8Tgygp5TC06UT2yFkSukIG0PC88DkIZBev4+hYOY?=
 =?us-ascii?Q?dAa1HcDtnoSp0FgAz1e5jatO4dU4yzUQ3Gp3FAFaxPmy+4xS+NfSyBfP9rSM?=
 =?us-ascii?Q?tHhxEBpCZ7orvYRWYK+L9i/9JutsyaBcDYTAIw3x14LE5yRCMBnNsUUlIqLK?=
 =?us-ascii?Q?18kDzm/4V/EbXqz+9rjc5f6l9eAHhIe+d7kuHra0Y2nB8MRP85dYDMcT8AOc?=
 =?us-ascii?Q?KrkJEW/pddLhFEqwTiDi0EBBqExBl7Z0joU8WqYf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e231ae-62b2-4ce5-a9e3-08de0934f706
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 02:13:42.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTo9dScQxk5Bahw33/+OkO3a38/dcsmi2Nt1QmHd9GD7fVcthg659ToHzndGBXrfTWkF4ubwcriHykMpAQZhSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
X-OriginatorOrg: intel.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/kspp]
[also build test WARNING on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-Disable-AutoFDO-and-Propeller-flags-for-kernel-modules/20251011-050345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20251010210134.2066321-2-xur%40google.com
patch subject: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251012/202510120641.H3SMaB6Q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120641.H3SMaB6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510120641.H3SMaB6Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.head.text' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `.head.text'
>> powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `__ftr_alt_97'
>> powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `__mmu_ftr_fixup'
>> powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `__ftr_fixup'
>> powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/fpu.o' being placed in section `.export_symbol'
>> powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/main.o' being placed in section `.export_symbol'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `init/main.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/main.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `__bug_table' from `init/main.o' being placed in section `__bug_table'
>> powerpc-linux-ld: warning: orphan section `.ref.text' from `init/main.o' being placed in section `.ref.text'
>> powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/main.o' being placed in section `.text.unlikely'
>> powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `init/main.o' being placed in section `.data..read_mostly'
>> powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `init/main.o' being placed in section `.data..ro_after_init'
>> powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/main.o' being placed in section `.discard.addressable'
>> powerpc-linux-ld: warning: orphan section `.init.data' from `init/main.o' being placed in section `.init.data'
>> powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/main.o' being placed in section `.init.rodata'
>> powerpc-linux-ld: warning: orphan section `.init.setup' from `init/main.o' being placed in section `.init.setup'
>> powerpc-linux-ld: warning: orphan section `__param' from `init/main.o' being placed in section `__param'
>> powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/version.o' being placed in section `.export_symbol'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/version.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/version.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/version.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/version.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `init/version.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.note.Linux' from `init/version.o' being placed in section `.note.Linux'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/do_mounts.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/do_mounts.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/do_mounts.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.init.data' from `init/do_mounts.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/do_mounts.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `init/do_mounts.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/noinitramfs.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/noinitramfs.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcallrootfs.init' from `init/noinitramfs.o' being placed in section `.initcallrootfs.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/init_task.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/init_task.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/cputable.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/cputable.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/cputable.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/cputable.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/cputable.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/cputable.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/cputable.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/irq.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/irq.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/irq.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/irq.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/kernel/irq.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/irq.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.static_call_sites' from `arch/powerpc/kernel/irq.o' being placed in section `.static_call_sites'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/align.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/align.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/align.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/signal_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/signal_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/pmc.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/pmc.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/pmc.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/pmc.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/vdso.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/vdso.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/vdso.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/vdso.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/kernel/vdso.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/process.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/process.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/process.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/process.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/process.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/process.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/process.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/process.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/process.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcallearly.init' from `arch/powerpc/kernel/process.o' being placed in section `.initcallearly.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/idle.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/idle.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/idle.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/idle.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/idle.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/idle.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `arch/powerpc/kernel/idle.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/signal.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/signal.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/sysfs.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/sysfs.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/sysfs.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/sysfs.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/sysfs.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/kernel/sysfs.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/cacheinfo.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/cacheinfo.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..once' from `arch/powerpc/kernel/cacheinfo.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/time.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/time.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/time.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `arch/powerpc/kernel/time.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/kernel/time.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/time.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/time.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/prom.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/prom.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/prom.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/prom.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/prom.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/prom.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/prom.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/prom.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/traps.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/traps.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/traps.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.noinstr.text' from `arch/powerpc/kernel/traps.o' being placed in section `.noinstr.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/traps.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/setup-common.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/setup-common.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/setup-common.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/setup-common.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/setup-common.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/setup-common.o' being placed in section `.init.data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


