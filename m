Return-Path: <linux-kbuild+bounces-8767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB1B48EDF
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 15:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A38EA161C87
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 13:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD62309F0F;
	Mon,  8 Sep 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntQxTops"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979C72E92D9;
	Mon,  8 Sep 2025 13:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336959; cv=fail; b=jIMaAVLv8dO9UBa3sUSbkEcZIJP6jp5q/eUXhHfRrHC74yZ8vOgi+crItb/PxVYL2X3VKCZvPmG2nTa7y4QHsGCvsLMU712S4gednwp6mecklmPbWjRrm0GC6ohsfa58W45ftgtAU0kZ/Y8ubX9Tic+2ae3RjRCNadKDMK/XL6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336959; c=relaxed/simple;
	bh=Pr+EaIwAvW4IBb++WrtWAL8SkjD7WDJagCPvbHp7ffg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HJ+8RVfjhb7CdsL3zqTo+WD/sgCvOdV4OVsLCW6391oN6g7UprfqExPSQ62HuynNUUN4Tp+EhuzdNhVxrFA9E41F1uYhQxbqzlxm0Vhbq2qxY/xGtwHvSDAaymYfFyT8DcMy8wbFHpU4v2WfmFnt6Va9PS2vhd7c+fd1k8TwfEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntQxTops; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757336957; x=1788872957;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Pr+EaIwAvW4IBb++WrtWAL8SkjD7WDJagCPvbHp7ffg=;
  b=ntQxTopsMCqJZiL1P/6a8ROrR7sLW1Eac3v5qXxFaqeCupp4Tgf4WyKS
   tNwNHw+xxNiQ55GnhvNovxyGGlL2p9yPKK7spJa1jxYnz/uxn5uDdH6SW
   WvknMk9ViCXArWRS9kv2CVM/OCk7iRRf2MKtoLs8dP1/lUFqkCe6gOLo3
   X0jQFgFNRg1S1Gffi2TCMkzSjYxkhk8zkdXH/up8gt4+w25GsQKUziexZ
   eJVj7RVuEsKcOS4VhUWBK1qfPHeTJbMdCQxLsQ7jGnaXbPS+WS24RP9dc
   HXk+L5+neUQ82bbkvGR3UAKFFYXLd1/I5yEyhsF/pWnWkMg4kjnXenz+B
   Q==;
X-CSE-ConnectionGUID: hl50nn0eQX2rLLSX1FK6yg==
X-CSE-MsgGUID: 50XWPyVARXy7tms+fQWBog==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58632642"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="58632642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:09:14 -0700
X-CSE-ConnectionGUID: G+xMS0fpQCiWmIAYqbC3sw==
X-CSE-MsgGUID: T3EE4dq+RReSfVXd9T43pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="196425867"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:09:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:09:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 06:09:13 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.68)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:09:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tg907FeTnUKH9XERy6Uo1b11ANgnLMkpPeeKjZur93b09ZAc60UofAnu1k7FO3iR0OLSVKF0RReiLoJxGu0t0fbreOnARBOdi+uP68RCpZxEasCneX3W4cJVC1I3JOXBQPMVuM25WuH4xIJC9UHenkiw5apJ1PDhKxLHAtCXoiyR556xvTtDnt4EI1Q6fFxnYiu+HRJSXUDhYC16kVwCXvS6V1IRiGE7BaDiIgElc5ShWdb/doagx26ZgCejXDhe7Gwec6uEAeqSYtjM7qqKuH2Y+Miyj8cruMDrh0fCK5LSZPIo9uUbHO50bt5GTxrHDQBBDOjH7cPfYZgRqOnQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjDS2RNuu/O6CJuKey+gDijD5Fc0hZzwS5894PX4Fjw=;
 b=ljIuTdkoFaVuyx8Zwpul1BalCAisYp9ZiIDA6gTwdRTHE7z5O4IDpzt17vj4cd87r80JaoSBw0WYBqQVqeVPtPDIYnwVfj8xETiw+DdLVJ4wFwV4IxIeyB8eDpdO2l1UsOwIPW+BoWsGcn2BPTpYSZujpZR4B+s9matNfXki8n2qZqgYQYDhFcwmWCBqkZp2E3BfZ+1mkaY+xz8SdewqabQWBmrOpAGtMHCMT86rH8iUpl6Jwee3VR5aWgcARsDjO9403sXV6oImUMXE8udWfj1bBXMHFXknyi00RUk3W5PKV2PJGVktMYhE9FiNrrh3jjnVlejL0vXbyLuXZkO79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 13:09:09 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 13:09:09 +0000
Date: Mon, 8 Sep 2025 15:08:52 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: <sohil.mehta@intel.com>, <baohua@kernel.org>, <david@redhat.com>,
	<kbingham@kernel.org>, <weixugc@google.com>, <Liam.Howlett@oracle.com>,
	<alexandre.chartre@oracle.com>, <kas@kernel.org>, <mark.rutland@arm.com>,
	<trintaeoitogc@gmail.com>, <axelrasmussen@google.com>, <yuanchu@google.com>,
	<joey.gouly@arm.com>, <samitolvanen@google.com>, <joel.granados@kernel.org>,
	<graf@amazon.com>, <vincenzo.frascino@arm.com>, <kees@kernel.org>,
	<ardb@kernel.org>, <thiago.bauermann@linaro.org>, <glider@google.com>,
	<thuth@redhat.com>, <kuan-ying.lee@canonical.com>,
	<pasha.tatashin@soleen.com>, <nick.desaulniers+lkml@gmail.com>,
	<vbabka@suse.cz>, <kaleshsingh@google.com>, <justinstitt@google.com>,
	<catalin.marinas@arm.com>, <alexander.shishkin@linux.intel.com>,
	<samuel.holland@sifive.com>, <dave.hansen@linux.intel.com>, <corbet@lwn.net>,
	<xin@zytor.com>, <dvyukov@google.com>, <tglx@linutronix.de>,
	<scott@os.amperecomputing.com>, <jason.andryuk@amd.com>, <morbo@google.com>,
	<nathan@kernel.org>, <lorenzo.stoakes@oracle.com>, <mingo@redhat.com>,
	<brgerst@gmail.com>, <kristina.martsenko@arm.com>, <bigeasy@linutronix.de>,
	<luto@kernel.org>, <jgross@suse.com>, <jpoimboe@kernel.org>,
	<urezki@gmail.com>, <mhocko@suse.com>, <ada.coupriediaz@arm.com>,
	<hpa@zytor.com>, <leitao@debian.org>, <peterz@infradead.org>,
	<wangkefeng.wang@huawei.com>, <surenb@google.com>, <ziy@nvidia.com>,
	<smostafa@google.com>, <ryabinin.a.a@gmail.com>, <ubizjak@gmail.com>,
	<jbohac@suse.cz>, <broonie@kernel.org>, <akpm@linux-foundation.org>,
	<guoweikang.kernel@gmail.com>, <rppt@kernel.org>, <pcc@google.com>,
	<jan.kiszka@siemens.com>, <nicolas.schier@linux.dev>, <will@kernel.org>,
	<jhubbard@nvidia.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mm@kvack.org>, <llvm@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
Message-ID: <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
X-ClientProxiedBy: DB9PR05CA0002.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::7) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 12af760c-c2b2-4262-b3e8-08ddeed8e5bf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RS8wRjlmZEh6cDloYkZHMENTTzhEQnY5Z2ZJTTQwajBPVWU2aXNLNUs5RnNm?=
 =?utf-8?B?RXhrWFhIVnBVMEFJYUdtWEl3NUJYaytBeHpuOFlMbGNzUmFVdjRERnVVbFBB?=
 =?utf-8?B?QmZOaTgwdkZGYUh5NXVIWkpUdEFXTlFSSGxKWll6dDZHd0dWaVFiZGptbEsz?=
 =?utf-8?B?U2dVSVpoNXhLaEY0cE1TbEtFSTJOT2ppNzZobG1TUDJJbGZERXBzY1BKNEVQ?=
 =?utf-8?B?YVhxSXNNZFN0RUxDL3g4WHRka0xOdG92alQzdzZ2UlFlTWxybmNSeWFWVG1q?=
 =?utf-8?B?Y1hNbTRNSSs5UTFyTG8xSklDaFRJL3BrdG9oOUxNS0VTcTdVc0xCdWFvT01I?=
 =?utf-8?B?TFJNMTYzNllEYko2bjNoYS82dmJWQlp5Z1htMU5MWkQyM3RZT01uL09BeDJF?=
 =?utf-8?B?NmpzYk53NitmTVBpZjgzczUxZmpQWW1ZdTEvVmsxWXltS0tncDhxRXZZM3NN?=
 =?utf-8?B?Sm1oZWFLYUxsSXhhRGE1WkZRakIrL3lZN3dOWTBvUWd4QlhYbjJNb0JTTGV2?=
 =?utf-8?B?K21CYjdSZFNoVjlGRDB0RXZITlA5RGVuNDA3cGRUUFNRTDltckFiYjFNZ1hW?=
 =?utf-8?B?L1BDUmpnTXRib1paaFkxYTVEOFYzS0YycDJNMjVrYmZ4czNqWDlOWDE3RXV3?=
 =?utf-8?B?bW15bWJSOEFadU53NWY2UUNLSlRLdWFqSHN5aTFhWFEzWitNVHBDaEtxWEVK?=
 =?utf-8?B?NlBtdE9YVjVHRGdWQkt2N085UWhpbllaWlNEbU93MlBIYkY0U095VEFaU0Z1?=
 =?utf-8?B?MGprZGl6WFEvNDJCVnpRMThHeEVxSlJqdlNqenloOWZGV1ZiK2l6a0ZFTzZa?=
 =?utf-8?B?VkorTHNsQjluSkMxU3RLK2dRVkRXZUpGNXlpN1RWdENUc1kxeEZzdEN4M3Y0?=
 =?utf-8?B?eGpEVHpSUXZubWo4dklvWEMxeWtkQUdGekVQYmdETElWZWtveU0vMjVxWndL?=
 =?utf-8?B?aTJGaVBlUzltc0JXZlk0Q2FXYzA1Mm8wcXhYZ1l0RVhWZkU1cnhTaVdIS0pz?=
 =?utf-8?B?REIxY2w4VjZsUko5SGNRc1dtTkd4UnBwMkM1b3k4N2NKTVpJN1Y5bSsxblEv?=
 =?utf-8?B?clEzQm1SR0pzckFBOERzZ1FINldTZUxSbk5hL3NiRDl3STg4dVR6VWpmdXF1?=
 =?utf-8?B?SG5WeTJ3K3BVdy9sQ0VOdGE1WURwSExSamFtbFFtMFJ0QnFkMFJKQmNxeldS?=
 =?utf-8?B?QndhV25PTGFZRy9rNW96ZGx6VE5USndTWjkzTTdva2dZY250RFlrdkNTM2dp?=
 =?utf-8?B?ekMvaDlEVzUzZUMyTGM2TkZ2eTVYblZTZnBoaDAwMW9tVC9aQ1kyTGs4YUEv?=
 =?utf-8?B?bGlhVlplZFJjUVczbC8rV1NybStLL2xGWUJlNDJKSzN1V3BEYlhVeXlHMm41?=
 =?utf-8?B?aDNJcm1OeU9kWXRtdWlXaDZCaXNYeGFXZGtiU0FUMUZvVWdBeDhYZU55SlNo?=
 =?utf-8?B?cG11MFBhQW0vVGUzM3c5VmtoWjcxU21mTVVSZTVXU2h1RlVKWU12elhvVHVD?=
 =?utf-8?B?SHFWVUQ2RzVoSFVaa0xtTm4xaE5YZU85WGtuczBGQVhWbEJBRWVtSFpzSlNp?=
 =?utf-8?B?bnVOZWJtR2x4QzJFKzc0bkVYaGFaci9wZk9sVW9NZm5GK2Jud1QwaGdXYk8z?=
 =?utf-8?B?MnRDS095YldNcEtIZWZZQ3cyZXdZV01DNmJJMDJaeDA4RFZCUXdXZTVqTzUw?=
 =?utf-8?B?Q1Z4cy9QWmNyM3hOVXI5TWZaaU1MNXFWeVpIUzloN1UwUXpMcHdkRnlJY0RW?=
 =?utf-8?B?Qk9BRko2aUNEZmVWYjVCYkl4YkxEaDJ0UTZaaTQvbmhENjdOaE1jT0ErYnlX?=
 =?utf-8?B?UDR3Q2lGemkwTlUzaC9iSUx6cUxFbzcwZytFK0RLTHdKWFNHb3EwcE5ha1JH?=
 =?utf-8?B?QmpXK1FIVG43Qi9GTHd4K0hXc1FiaTRTUEJqSGtFbDR3RW03azJaSTY2UHhr?=
 =?utf-8?Q?6iwkNU5kOiM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkxpdCtvV0YzMWRHVktaTGl1SnlrN0MvcW9HQzB6bHFrQUthbkR4TnB4K3pJ?=
 =?utf-8?B?eXlRWTRZOTlRMU9rS016Zmk0TzdyUUdSQmVuN29CQTJuNlVjSFpOTzcvbG5k?=
 =?utf-8?B?eHJKZnNNTWtFZnF1NmVQakxQNUNmalR3V3JUWVloTFhQVHpwcEJjdUdqYm5n?=
 =?utf-8?B?VnF1clFkakZUbXVoYVdLR2FsdWx3SWsxRlNUVkhEQmlDLzBCRGc2SWdKM25l?=
 =?utf-8?B?dkk4VnNiNnlFR2tLcEpHa3ZEWCtaRHU1cUNQdUxHamtWQW5LalRkcldxWkFl?=
 =?utf-8?B?NHd5aGIvc1pPVUJnTHlQdFhkOWtoWGd4RVZiT2k4dDBPWi9EYUJZaDRwcTd0?=
 =?utf-8?B?REVZUm1tc0hYUVRLOFo5OUJ6emFQWjUxVU1HaXBSdDVwUE51NGpvc0djVHc0?=
 =?utf-8?B?NFkvYTJ3M3FsWXFYTklNVFJYalBzWmI0S1h6alVYMDk3ak1FeG1SMHhqd3hj?=
 =?utf-8?B?bzRIaWlMUkdvdk5lYWl0eTRsNHdtMTQ1aE1RdlJHL3h0UjJMbWd3SmlYM1JZ?=
 =?utf-8?B?d3lLRy9vclhJZHpMcUYzdmVVREtCZXFYSW5GT2NTWmgzNFNETkpoQ201QnAr?=
 =?utf-8?B?OVFSSWpZM2w5bkZYY0JRMzN2YlI3UHdJcXlOcm9vaEtOclVzR3Q1YThCUGU2?=
 =?utf-8?B?emhmQkhXby9uR2VNa1VTaTliMktpa2FMcDEyV1RidzRibjZnMDdYZFVaV1Zr?=
 =?utf-8?B?YTRSRGF3cDRxLzFSdGxpZFBFWlZydUl1WnFDSjI1MWdNV3lLTVFMY2tYWWcy?=
 =?utf-8?B?WmdlQ29CWU4xbm04cGdsZ1c0eUNFb25hYUh6bHVNZ2g1R1F1MWRUbHE2Y2c3?=
 =?utf-8?B?L3FxcGdTWlVxOTNIOG9XM3U0eFFyenRUM05nOUFmdjNWZUlXQzIwT1doQTd3?=
 =?utf-8?B?OHJ4VnVjbE93WEQ5T3oxRkN1Vkw3YUF4YVJsZDd3a3MvNFpoZjZtcFkvbXps?=
 =?utf-8?B?Um5vNDk0WXArQ1ZuclZwS0xIcG5MNEdraXJ1QnYyYjBPTmcvMXRrMmVaTUVJ?=
 =?utf-8?B?ekpLVFJvaWVPcWlvZ3ZFMGZmcUZ4eU83WVJBNEhLdmxqOXp6dGY5b1F5WEk3?=
 =?utf-8?B?SGo2eG1ZSjc3am5OMWpGOXBlZW0vRTVmeUdEUTdzZmF4cGhUSFpmUk5YeTJ6?=
 =?utf-8?B?blVSUDdaN2RvOGhLL3FLcVVqNnpaaEY1VktEdkRpUVo5b3lSVzV3TjFwb3d1?=
 =?utf-8?B?TkxSRCtkNzNRQ09ZbmZseHpWYm43R1NTYWhCZElORVIrYU9xd0JjOWJES2ZV?=
 =?utf-8?B?N1k5c21qVWpBYWdtQ3IyV0tMdzBueXBya0tHMkdHQm43WlJ5OGRLY2ZoaWhy?=
 =?utf-8?B?cmpoMTZvMDhXSHplbHRkYzFqU1BlSXVWOTdSc2dsV2dmS3NRSHNZVXJ3dmxL?=
 =?utf-8?B?ejlVMnNNTnZVQ1ZhZFpCYkZUYjVzQWRwZ2pkM0Z6aFJGVU5GdHVjYXNVWWhp?=
 =?utf-8?B?eGFvOS9XM0RiR2xlUEViM3NIbXMzRjN3SEFtOEE0bGs5SEtSWXE5RFJHbjky?=
 =?utf-8?B?NUZoMDN2dkxpdW4xTnpBelRZRVhjSStHeE5kQThXSUJCSDdFMHlKQzdHaGxX?=
 =?utf-8?B?c09zMkwwN29GVzNrV0hkMXY4VEZMK09mbjh3aVFzVEhtN0lVT1FYK21BUkd5?=
 =?utf-8?B?dzhqVEhIOVU1a2U0T21OWGJPRUxTYkVOTG96a0VvSDVKT0xPRGlIMFgvcVNj?=
 =?utf-8?B?M212Q3JLSWJOQTBEK2pKTEdOZUxVT2tmZ0tqdkdIakMzWFBXdGpOM3I3WXBI?=
 =?utf-8?B?MW9SZlZHa3lPbjV0T01tcndVR1dQZGJBRFpZM1RyamI4RWlMcVhOcU9JOXRi?=
 =?utf-8?B?VnpvRWc1UGhWbzhDZ0F1WUcralhjUXp1clFUZzdEOVZHUFZEbTRqNTZHNDZq?=
 =?utf-8?B?VWo2ZzNmYStZcVFtTVZxOG5LTHBOWUxrMjVsUk1tRDY1d09YbUhBdUhWRlAx?=
 =?utf-8?B?eVpzMTZuQWpaQXdMK2VNTHBOZGdtY3ZvNjZ4dHBwcXFabzBBc0dYNEdqRlVn?=
 =?utf-8?B?Y3UrN25HTzNwRDdXRTVVUUJEMEExRXo0YVpmTFI5eWc2ckVCRkJEZVVmcFpM?=
 =?utf-8?B?U044QmxHbWFRYUdUeXJSZG13amV6TmptaldQb3hndGpaU1Q5MVVpWER3REl3?=
 =?utf-8?B?YUVUMmczejFxSER0bndranEyU0RUOVJvdjRrRTlTcGFhZjJmZGMzTzRRZkZV?=
 =?utf-8?Q?acsPwr7Lt8SC6BkMEqMRz2A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12af760c-c2b2-4262-b3e8-08ddeed8e5bf
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:09:09.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 085ghfueQO9Rendb+Qnh4CjbQQ8ddOgfISxHA8ZuHjuMesSghAML8P9qIjJ2pe1dE3o29DMVVU/L5f4IRrEBhzD2i6YS4K75isHisTP9UGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-OriginatorOrg: intel.com

On 2025-09-08 at 14:54:32 +0200, Maciej Wieczor-Retman wrote:
>On 2025-09-08 at 12:38:57 +0200, Maciej Wieczor-Retman wrote:
>>On 2025-09-06 at 19:19:01 +0200, Andrey Konovalov wrote:
>>>On Mon, Aug 25, 2025 at 10:30 PM Maciej Wieczor-Retman
>>>> diff --git a/arch/x86/mm/kasan_inline.c b/arch/x86/mm/kasan_inline.c
>>>> new file mode 100644
>>>> index 000000000000..9f85dfd1c38b
>>>> --- /dev/null
>>>> +++ b/arch/x86/mm/kasan_inline.c
>>>> @@ -0,0 +1,23 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +#include <linux/kasan.h>
>>>> +#include <linux/kdebug.h>
>>>> +
>>>> +bool kasan_inline_handler(struct pt_regs *regs)
>>>> +{
>>>> +       int metadata = regs->ax;
>>>> +       u64 addr = regs->di;
>>>> +       u64 pc = regs->ip;
>>>> +       bool recover = metadata & KASAN_RAX_RECOVER;
>>>> +       bool write = metadata & KASAN_RAX_WRITE;
>>>> +       size_t size = KASAN_RAX_SIZE(metadata);
>>>> +
>>>> +       if (user_mode(regs))
>>>> +               return false;
>>>> +
>>>> +       if (!kasan_report((void *)addr, size, write, pc))
>>>> +               return false;
>>>
>>>Hm, this part is different than on arm64: there, we don't check the
>>>return value.
>>>
>>>Do I understand correctly that the return value from this function
>>>controls whether we skip over the int3 instruction and continue the
>>>execution? If so, we should return the same value regardless of
>>>whether the report is suppressed or not. And then you should not need
>>>to explicitly check for KASAN_BIT_MULTI_SHOT in the latter patch.
>>
>>I recall there were some corner cases where this code path got called in outline
>>mode, didn't have a mismatch but still died due to the die() below. But I'll
>>recheck and either apply what you wrote above or get add a better explanation
>>to the patch message.
>
>Okay, so the int3_selftest_ip() is causing a problem in outline mode.
>
>I tried disabling kasan with kasan_disable_current() but thinking of it now it
>won't work because int3 handler will still be called and die() will happen.

Sorry, I meant to write that kasan_disable_current() works together with
if(!kasan_report()). Because without checking kasan_report()' return
value, if kasan is disabled through kasan_disable_current() it will have no
effect in both inline mode, and if int3 is called in outline mode - the
kasan_inline_handler will lead to die().

>
>What did you mean by "return the same value regardless of kasan_report()"? Then
>it will never reach the kasan_inline_recover() which I assume is needed for
>inline mode (once recover will work).
>
>-- 
>Kind regards
>Maciej Wieczór-Retman

-- 
Kind regards
Maciej Wieczór-Retman

