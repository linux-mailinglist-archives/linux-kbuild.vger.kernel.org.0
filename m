Return-Path: <linux-kbuild+bounces-3499-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B31F973940
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 16:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F9711F2222A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2024 14:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC012943F;
	Tue, 10 Sep 2024 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AljNMTz3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9053428389;
	Tue, 10 Sep 2024 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725976878; cv=fail; b=PKp17xvAzEcii19ynbINafBj6DyxzN9BLEA1raGDAntsdDDiyO/i8d3VS+/HUrTEU9CzQHstDSXv3NZKB6iyld7iDF1zWx4xBTL81sA5oM4/l5pH2hptKOVDH1QFKzow/yvKgjs4E/tTUp0fhcbqCxeO0zNRItJVpDBOjScJEqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725976878; c=relaxed/simple;
	bh=rAdunga8w3Zscn0chyy16NyjH78hF7ms1o/4pz0+JX0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QY5xdR5MHnJ0tLX+vzTDXpZMseyXDD/5oGliCHhiY2gAYj41QSUTfRW2G2NBhnD3qIEXWDiByV0j9+sz6BLEBo44z4MiobOd6qU/qUmro55MzatTvjIHDu/qUWVV/9b9k0nBY5M4qjAe8dUt39xB6o1SYHEeZUp+2qjaUc9Vgp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AljNMTz3; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725976877; x=1757512877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rAdunga8w3Zscn0chyy16NyjH78hF7ms1o/4pz0+JX0=;
  b=AljNMTz39SbkeiMYCDrgTZjAcswRlZnp8WiSPPOq7XvsDOAHQBjb1uha
   w9LV0xSzrbzs8kYXaPS+FkFPZULneSokm8F2YoUjbiFrdyeJYZPBAD7qY
   NGAZnrcpa9El48acJUR5ZO07rb7+TwTl2+Z6dGCNjNalN+yRoUYFB20Yq
   i2UEDxNhwj956x62j8cJtCU5N2MYYrFAEiwSstzo1Z0yrW4n3EG96WURq
   oNK3L0jAIARN8GEwN4ELlV6yP03rGrpkL0ews+/9YjkfvrARYWxEz0IE5
   2mtotrt271oExyb8HaYnXwRUFW9gQh3YfDa8IGJOjjqvPVcdpxlXisaPV
   g==;
X-CSE-ConnectionGUID: yyJj/AezTnOP7AHVsbnJJQ==
X-CSE-MsgGUID: GAslNZpuS96foOG8A6h+gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35320656"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35320656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 07:00:37 -0700
X-CSE-ConnectionGUID: SIsocsBURhicHzY3h15zwA==
X-CSE-MsgGUID: DgyDKLl3Tnetcj02KorHoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71430756"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2024 07:00:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:00:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 07:00:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 07:00:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 07:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaumhH2uANVWcZXMZgxncUeCq7Vyt+Wtxi4yAwDrhz7LWMqU7CQUS1AbPMFC0FdrQChnwVhGMn0pnFmrH9+c2TE9uoSeBAh+yd0DrsqVdDF0zfScDbP+7c9nPdEpXrKeoSj7TsbdP9XAUE1PAQSQRLl6GcNpDHFHSbtIfsWWE7Ice1C/QTH/BOTEnbctocXvo3Ss/mfNbwZD64m3aOCrrcY3eqZ2h26NITzTFctM2MOfuod1nfgB1/0mgKWiJDAAROOgvCL+i0w+psrEhFvnDgdmE+xDjQv07DRoTur440yx0//CvFGqa/CRTZwH8hdoY6O8uDDNTv2Otb3dVgIt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCKB3+ETEvL6BfAnP0/fR4DLfRUKb3hTa8MgmtNm0Kw=;
 b=iAyjAFAq975jkal8pEzkwwYGwMeBi0B7lvzBgl1W/EOPUvFk5+2p/zKThsrG6aBof5PJ2EnRgBYetKetTrawyu6aTlxX1L1gkJTzy9WpCX9Qjx0co5xG5mVN8yhjozXsA+jRztuNortgBqFKw3VX7buwfWJlSblsV18C2AtCW2oy1yvz2HvQ20H9SaXCKq8AJWf/1WbyBZj+xD2ZvyKcm3nC7/p4jBroiMRwViAgt2Khj87MkXe6Zgfb0O2SugOCjneU1dvOhp9ZaZH7Fh3zVvN6zKw4+pkT488X/Ym0DXAVvG2alwktbeHKmWMBk5yhkcz2tv8p/IVvQhDO4PAleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.33; Tue, 10 Sep
 2024 14:00:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 14:00:32 +0000
Date: Tue, 10 Sep 2024 09:00:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <3090101217@zju.edu.cn>, Michal Marek <michal.lkml@markovi.net>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Linux Kbuild mailing list
	<linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Jing Leng <jleng@ambarella.com>
Subject: External modules with O=... (was: Re: [PATCH] kbuild: Fix include
 path in scripts/Makefile.modpost)
Message-ID: <aowpzz4rbedjkwkl7b4a2f5pf2p5cgsu6knsgxnayckhbumxf3@aznrm7oliydb>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
X-ClientProxiedBy: MW4P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f485c9-d0a3-40b2-dde5-08dcd1a0ef7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5dY5WTE/apPg+yctbUH49xZMlU975C4nFb2J5ZmTLWxCAxkV3Zji2A2U2GVY?=
 =?us-ascii?Q?13RbKF+06xmDjx4l5Pg2Z93jUK2rlHz0ZCEgHDD9jGXbFW2UWenPWHwMxFMb?=
 =?us-ascii?Q?B5EKB78+fuJEUfhkDWocCuzYVO9Es1U2iuSF2frJ1W0ocW9res294rKB+iKK?=
 =?us-ascii?Q?2uIPLlx6w3Xar+JGEGd4dRTK0GbIRBVat6YkRTtQ6FoFGgkSNeiSbfEs3HPa?=
 =?us-ascii?Q?j9UsZFqGsIcgwURnLXx3pVeFl+FRnWVnDBEu+itJDaEHHL9B6tGpYH6xaCEf?=
 =?us-ascii?Q?UvRKTocRG1c0Gdn8td8pf0SeKNb1btu1LzjxtizKLthOOeCNKQc6qUv0SOVt?=
 =?us-ascii?Q?QLdontnoa7KP+rjCHNC7VYADiWwINjQS87nbVKbHSbyAi3E6BwHSrADyk82X?=
 =?us-ascii?Q?99bJOhaXIBgXP1Uw5su1yPu3d4lmmf84ASdtzeCSelmTIFyUVD1C9JWHQsbP?=
 =?us-ascii?Q?p9wsHk9Ds0BeAF5PkwWPO9vyG6ii7ciKIHmsVx3+Tfo3ulILN+yotCtBxxsh?=
 =?us-ascii?Q?RkyfVoPVM1+So5+iUYPsPy8GFutU9q+s93DUQiN0krTmWAuRNTHO3gRQe/EP?=
 =?us-ascii?Q?qz9AZA0X5CwHZAu3uAm9OQQMPTQbweTasF/1l5C1N4j5X7UXJn/9yi3I0kZ+?=
 =?us-ascii?Q?iPtHHP8NfCuVomT/9f5a55ZBBPqoMqSZu9O8TVoUeHl/5Qog9I0apIr8q76a?=
 =?us-ascii?Q?YjeR/odJITQqINpyUDBRvtAsZ9yyxGm6Wld0aoh/X+o0tuFLIpZzt/0mmZJO?=
 =?us-ascii?Q?lL6wc9HQzcVTPtw5oja6W3eRnorK3QTh+iXVF5dp8RQd2i4nNE8rwgf0NAE7?=
 =?us-ascii?Q?Zxg7qYpy03qu1DUdTGWO922qQ817Xt+WOULCZ9zqYz/GQ0uykmMvToHfMl3I?=
 =?us-ascii?Q?IFEt5qIA44doWcQpViUoMrlKp20ZYQzHSmxIv1dFMKz8mSKSQnOjNWfKNM9w?=
 =?us-ascii?Q?WqP3G06tdLZ0NIJ2rq/imkiO5sLJ8rj88a2g63BZm4/AgpbPgybgJvsC+sFM?=
 =?us-ascii?Q?7Xh8eWn5c98+DjNSw+2BskuXO7mZRMmX+G2PDX008kgSLOT887sdTKkXJFmK?=
 =?us-ascii?Q?LuusSZqXZ2ppWNa5FQNLeQjoilFzcJwYUAsdpT2JN69KOs3efTL+sA/WeO33?=
 =?us-ascii?Q?j0FFMWCNy9k22fLBb+fXG5bX8mIWWS111J8gy+q13JqRit/VWurfofwHUdGp?=
 =?us-ascii?Q?3ZvhrphucTcueEFWaNVLuqWwegEQ4Yaew8OUN+F1XPy+tKaxX/2WSD0LCp8r?=
 =?us-ascii?Q?VfAduE9WOSLrjwBrBzTaHxw1b1tsK4wDnR3E8UTnB+4nPRfAMcznQhUr/BXQ?=
 =?us-ascii?Q?079Y/NU77JvWSuvjkC4WU3EFDikE6lPx/l6AlkPaZauBj9ysbcCjg1/W/lah?=
 =?us-ascii?Q?owuNj+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJk6UScrF9yxt00DI52EGueCZdxiACToOPaUys+aHIb3B56g5NJK8NaDvwBF?=
 =?us-ascii?Q?p+77L/qawgqcSx4+mIeW9TVrda7iELDegrAOyv17zThCiFD1LMoIWPf0jmpA?=
 =?us-ascii?Q?nk/gSAGDkHL45gU9xaYrDUfXFxve1uGcJssala5iT9IuNXqElE/KUs2gqHO+?=
 =?us-ascii?Q?HKA0POvtf0BSanrI5neTdnDP4anY43FZx3OUiCvI+PvnAmQd+2qnkHA6wXTY?=
 =?us-ascii?Q?QorDsH45n2lu4vKZ1wk9sL3rX1cwBJC9H+9nEMCM09+rEJCQL/zPH5BPv8IX?=
 =?us-ascii?Q?e5MhiyLZ87rU/x6xBMgM5b1MQzQF7zYOt56HAxr8+GPLPwGHccTZ7W4+haFc?=
 =?us-ascii?Q?sryWmoETl/NJJFA1EPEwvNVf0z8fy7WO+mbmFVwaw13qkNVKEz39xMaPaTzx?=
 =?us-ascii?Q?xaHaM2Ja0HVifCsu0fumuNsT+CS4Z/LpShPsCiQBupc1/dvgV9SsTCzRT7Iq?=
 =?us-ascii?Q?EdzmHec0CLqIfKcIPYVoKkHOA5S/uSV9wBsS7RwHN5W+ZcfM/N1UgbFNoNej?=
 =?us-ascii?Q?i82fT/Ymeyy78fN5DWajYrJF55xSELC/fndfTP6Z9tRJe2FS0XZR42wpXDGl?=
 =?us-ascii?Q?3v7O2qPQTU9pClwSz5cZ+FWQ02op1rtTwvx/ptdHhc7TuD4bPhauJoap6Y7D?=
 =?us-ascii?Q?tAP7N+boPdoTNyxmjvYkB4vcwedEWOzbFdG/9fgWBEYSTiihP9pfXHA9MIbT?=
 =?us-ascii?Q?vx7sfOwjqhgKvHr2FZFhJVjlYUXZ4sERxq9r9dwJQtk0eTgZbr8NaDb54owu?=
 =?us-ascii?Q?+PzGyZ7Ez2F8HdEGw3mze9iIUd0BQqQMzHI7ssERMJ1GzKZt3L0Fxo87bOQQ?=
 =?us-ascii?Q?6knVKsOGQTffdCFxLEcUOujQDuR3bTIX0i6boOvZSS8RUXk0qvQpg1hrkCqc?=
 =?us-ascii?Q?4HMQd8gqAnCiTpG+LfyplRZQsnB9aNfvaSq+ivMY+8u0fySCjKAA2FLJszUq?=
 =?us-ascii?Q?ly1HLVReLgIOBxiiqVjjQu+iW90CsQDmYK5GtxL0tRRtjWGK8dhtUwo4I83m?=
 =?us-ascii?Q?dCE1ouT4SyjHnjy5ErBYWP/iR0IQH/3/7BfDuRYk/QpQTLolOWohaMQ9corE?=
 =?us-ascii?Q?zF5JlJUcRmIVdXb4tb1EaqebWn0+Km6+EBowAqZ7ObEXVy/k7hDMNCdEuaMh?=
 =?us-ascii?Q?sqM2k5MfMb57fhYPSeUUW8Lmjysi2AcAtZDkGb7WaMKE7Gwhw4wH+ePpB59C?=
 =?us-ascii?Q?GQWyXh0VVP4qImtfKj4uYK2qwm6w49VByjlnVmohgTFBno+h7fS7WDuBAhJh?=
 =?us-ascii?Q?euaBS/DkpHdUq+O8LHs4exoRmNBRVFU6W9vigY5IR294D/fvE4Ec5lOrXEtQ?=
 =?us-ascii?Q?JnvgeeSY6MruqbjjZai6+iNedL14JXnOxopaiEdU0kpNbLIJlqRsAGJ5MS0j?=
 =?us-ascii?Q?37D77f1poFnAhAX338ngDerkYXx+uzuRLIgKuKywZEQCu+vYrj81IaTNoYxh?=
 =?us-ascii?Q?oq9zG59+3LzndbHMLX9eIXS/r1G4yJ7UVIHIfSYjBL4IRJhhHfcDcFzO5br+?=
 =?us-ascii?Q?Kkr2fLZn9O6nMCNAlYWBz0CrgY+KMBMyM2BNesit1Yc/JaVXGTXITgk2vE0D?=
 =?us-ascii?Q?8HByjTEwH8NiCfN+RApskJyoS6FwloINBf+720QV9IT0mEH2rr++bnsEKJjz?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f485c9-d0a3-40b2-dde5-08dcd1a0ef7d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 14:00:32.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKPIB0FsYqwn+TIvvZ1eC1ObN9yMUyJSHCm9Z8KB09C6SwXOkMLK5NkY6ZrVH1/8bT1v5v5eu6gzR2E5uQFL9vO2m/LQ68hccuh2/PFVuDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
X-OriginatorOrg: intel.com

Hi, I was pointed to this thread since I'm trying something similar
in kmod's testsuite. See below.

On Tue, May 24, 2022 at 02:52:45AM GMT, Masahiro Yamada wrote:
>On Tue, May 17, 2022 at 7:51 PM <3090101217@zju.edu.cn> wrote:
>>
>> From: Jing Leng <jleng@ambarella.com>
>>
>> When building an external module, if users don't need to separate the
>> compilation output and source code, they run the following command:
>> "make -C $(LINUX_SRC_DIR) M=$(PWD)". At this point, "$(KBUILD_EXTMOD)"
>> and "$(src)" are the same.
>>
>> If they need to separate them, they run "make -C $(KERNEL_SRC_DIR)
>> O=$(KERNEL_OUT_DIR) M=$(OUT_DIR) src=$(PWD)". Before running the
>> command, they need to copy "Kbuild" or "Makefile" to "$(OUT_DIR)" to
>> prevent compilation failure.
>>
>> So the kernel should change the included path to avoid the copy operation.
>>
>> Signed-off-by: Jing Leng <jleng@ambarella.com>
>> ---
>>  scripts/Makefile.modpost | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>> index 48585c4d04ad..0273bf7375e2 100644
>> --- a/scripts/Makefile.modpost
>> +++ b/scripts/Makefile.modpost
>> @@ -87,8 +87,7 @@ obj := $(KBUILD_EXTMOD)
>>  src := $(obj)
>>
>>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
>> -include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>> -             $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>> +include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, $(src)/Makefile)
>>
>>  # modpost option for external modules
>>  MODPOST += -e
>> --
>> 2.17.1
>>
>
>
>I do not think "M=$(OUT_DIR) src=$(PWD)" is the official way,
>but this patch is a clean up.

I tried what is in this patch and also tried to find an official way in
the docs.

In kmod's testsuite we build dummy kernel modules to exercise the API.
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/testsuite/module-playground

This works:
	make -C /lib/modules/$(uname -r)/build M=$PWD

This doesn't:
	make -C /lib/modules/$(uname -r)/build M=$PWD O=/tmp/kmod_test_modules

I also tried the variants above with setting src, but all of them give
me errors - I used 6.10 and 6.11-rc7 for these tests.

Is there a way to do this?

thanks
Lucas De Marchi

>
>Applied to linux-kbuild. Thanks.
>
>
>-- 
>Best Regards
>Masahiro Yamada

