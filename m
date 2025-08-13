Return-Path: <linux-kbuild+bounces-8433-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A7DB24791
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 12:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E56C7B4EA8
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 10:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7F5212546;
	Wed, 13 Aug 2025 10:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CS/WKT58"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E22F530F;
	Wed, 13 Aug 2025 10:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755081658; cv=fail; b=k4JtwXMhbvF+gw3symYSEaWK5pPUfJN8O9x/khQoFRXTeRdHMm8m7SFeIwgrtuYFpVpTbQJ/E2KDULAJuY6t9+F4tOmeJp+Wc76ZFukAElc+tP3ZzB62bh4WFN5oQsXoJCxMo1nHQb8EJHuvKa9k8FAYwB2wvXaIWyuTC7VjC7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755081658; c=relaxed/simple;
	bh=1CpaxJLJaMpje4WQmHqG+CHMByk+bOepWXqIIjHqmsY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fZBQDEB40MiyspqHdeehOxM+0aDp7KHo+6w5qA7QnhPkIFKpAvQDpQPdZPfk+xfVgFcEmq23Ls828pTjv6YDbMtRBRIWt9d3MK0iqWbyD7k086+0nIimBNkY8F9v87DEzwJXFh6L5trBz879gV5Li9zVFRo8+hYutmRPogyB/GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CS/WKT58; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755081657; x=1786617657;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1CpaxJLJaMpje4WQmHqG+CHMByk+bOepWXqIIjHqmsY=;
  b=CS/WKT58zRzp7kPL+vaF0657UHSz+J5fzO7yr9Aj7WYbBkfRIe/IYFug
   HWXYeOyytEbbB3+DfeK8Sc+JEvvdzJOzSOtkhD6e5hQHG8DbE3NKmpkwP
   KcMzY8WkJQyn2vdAtx+WT56idMyIDEzs+cj4FniKth8Pte0uu1dXsx4ut
   j0FQ3nzPpDQgcG/4epGx6zuM4L2UWNpTvJuVYPsrOIVMqPfr4Xxx1A2gI
   b0ZvZF1czgqfeOdC27VTibr1rshfSuOKVtj1VSDQzJpYofm7G9iwmWhNK
   ugTGV7i+r6UYmfXBPt9vvdiRV8z9PTqlldc0HudihBW+NkeJs9gzjoyi5
   g==;
X-CSE-ConnectionGUID: l3s3187CQWqu9/E58brlTw==
X-CSE-MsgGUID: Y98q+AxOSDaA3VjL/xepYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="74817720"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="74817720"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 03:40:56 -0700
X-CSE-ConnectionGUID: 8rQVP2eOSUq42A5Q2xoAQA==
X-CSE-MsgGUID: IyB5qBL0S928kK0Y0bWeCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171764862"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 03:40:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 03:40:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 03:40:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.84) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 03:40:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWsVBLwWbN5fEKHUmd3idmXtSXEvykLmsHfV5PkQX9QFtYD8O54yn5mvEuCesHvsjc5/m8eq/KE8MIQQSEN2/5YR+kqo2ruY51dontnzoDN/p9vZ2AwKJCvaSfZSayuORLiSlmjvHyK2J4HHzyhkDNE0RLob4LflSgPxpMDStOGDb1XROaNel2laQJx7y0GNzVXGH9QHZYfsY3I3wz/RmknAvDpdQv5lb4FVUurSpK72K21SxSuFbN2Ic8XDMTBk1wR1wUPbOQBHGLID64yYOWjc/8OOn8czXRON+L5Tzw5EvlZQZ2ZBj63aM1azyUrP1yr1hJjDqdT53tRxPdrO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rKKY8rznZ41XMPA9SgN9+U2171s46U3wvgnEgor5fI=;
 b=XbQci2+feRX7yt7ZYd0zpiRUBgIPvXYDpPmKc973vwGGgWNBxXLZtKztuOi1ReLZmQBEOTJgjXx3oJsVJzhWaBDXuNHGCQGCWAZv2g/bo8ry1x71uBte1wP1N/vuBZocgQFGrLKnIekt6U0WYfWt/MvqqzJaeBC7yevGTzs4xZBuWZwlrIJ+m1c27zu91tl7P+3vYpDoK73T1igxw8c6f0L9LldBX20eBhu6+E0BCqdnfQe5YSSsPnhDJXjvhbijnlQatE3Chr6aBfoXzmlEeU8xq0JWtSYVLA2voZR11U756DeG7fp1fIFeuNhpYLQQiNfl1Ujc0OuWY2rorARWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SJ5PPF1EED2E381.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::817) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Wed, 13 Aug
 2025 10:40:45 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 10:40:45 +0000
Date: Wed, 13 Aug 2025 12:39:35 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
CC: <nathan@kernel.org>, <arnd@arndb.de>, <broonie@kernel.org>,
	<Liam.Howlett@oracle.com>, <urezki@gmail.com>, <will@kernel.org>,
	<kaleshsingh@google.com>, <rppt@kernel.org>, <leitao@debian.org>,
	<coxu@redhat.com>, <surenb@google.com>, <akpm@linux-foundation.org>,
	<luto@kernel.org>, <jpoimboe@kernel.org>, <changyuanl@google.com>,
	<hpa@zytor.com>, <dvyukov@google.com>, <corbet@lwn.net>,
	<vincenzo.frascino@arm.com>, <smostafa@google.com>,
	<nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
	<andreyknvl@gmail.com>, <alexander.shishkin@linux.intel.com>,
	<thiago.bauermann@linaro.org>, <catalin.marinas@arm.com>,
	<ryabinin.a.a@gmail.com>, <jan.kiszka@siemens.com>, <jbohac@suse.cz>,
	<dan.j.williams@intel.com>, <joel.granados@kernel.org>, <baohua@kernel.org>,
	<kevin.brodsky@arm.com>, <nicolas.schier@linux.dev>, <pcc@google.com>,
	<andriy.shevchenko@linux.intel.com>, <wei.liu@kernel.org>, <bp@alien8.de>,
	<ada.coupriediaz@arm.com>, <xin@zytor.com>, <pankaj.gupta@amd.com>,
	<vbabka@suse.cz>, <glider@google.com>, <jgross@suse.com>, <kees@kernel.org>,
	<jhubbard@nvidia.com>, <joey.gouly@arm.com>, <ardb@kernel.org>,
	<thuth@redhat.com>, <pasha.tatashin@soleen.com>,
	<kristina.martsenko@arm.com>, <bigeasy@linutronix.de>,
	<lorenzo.stoakes@oracle.com>, <jason.andryuk@amd.com>, <david@redhat.com>,
	<graf@amazon.com>, <wangkefeng.wang@huawei.com>, <ziy@nvidia.com>,
	<mark.rutland@arm.com>, <dave.hansen@linux.intel.com>,
	<samuel.holland@sifive.com>, <kbingham@kernel.org>,
	<trintaeoitogc@gmail.com>, <scott@os.amperecomputing.com>,
	<justinstitt@google.com>, <kuan-ying.lee@canonical.com>, <maz@kernel.org>,
	<tglx@linutronix.de>, <samitolvanen@google.com>, <mhocko@suse.com>,
	<nunodasneves@linux.microsoft.com>, <brgerst@gmail.com>,
	<willy@infradead.org>, <ubizjak@gmail.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <sohil.mehta@intel.com>, <linux-mm@kvack.org>,
	<linux-kbuild@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <llvm@lists.linux.dev>, <kasan-dev@googlegroups.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 00/18] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <rzlimi2nh4balb2zdf7cb75adoh2fb33vfpsirdtrteauhcdjm@jtzfh4zjuwgl>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <mt3agowg6ghwhvcjqfgqgua3m3al566ewmvwvqkkenxfkbslhq@eun5r3quvcqq>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mt3agowg6ghwhvcjqfgqgua3m3al566ewmvwvqkkenxfkbslhq@eun5r3quvcqq>
X-ClientProxiedBy: DB8PR09CA0025.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::38) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SJ5PPF1EED2E381:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f7127c-56fb-415b-aa13-08ddda55dbdc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zh2OKw1mNTYyc7MpM7Gp3Ntsu+ttLa+1Kurrk2+Tntx294FdCv0sB3mUsX?=
 =?iso-8859-1?Q?k6EZutKfpNPlFOtPcJyifPdwTQeFpzzcQXL0BHiRZdBxEV4+0WXK5qNBAu?=
 =?iso-8859-1?Q?SG+1F6uYKGPpmeI66vjq/0xjuFv4FIF8YlbnNhehGZI6trCMeqwcR/sQX4?=
 =?iso-8859-1?Q?31E20VrXo7SLTxuUJ3owLM2Mjgo1tVgMHl7nCwgphJ40tnMzveBvPZ9LOL?=
 =?iso-8859-1?Q?ROAbeKuAT079MxOPUsa2rTJ7tl30mcrbIZoTtBlOZrXJToa/ENbgwSUeFz?=
 =?iso-8859-1?Q?KqzRdwIrhXOlc0dHcEa7xMmwjpTR/3cBXjRbDRSpnsE5pIb4hYwfbUWx9V?=
 =?iso-8859-1?Q?f4Y+U2AVe1XMVG2kHJ32oip+0Eintr3kLXsgJUOvxD9IvUZhbNbhSxkJG+?=
 =?iso-8859-1?Q?5PDI3QPslFQDUsscdsiiITO30+T3htRWJ/zYzfESZx9ckBC+Hnt0Plu44Z?=
 =?iso-8859-1?Q?y2z67aRVwU+KT6/qH2vhEGkiFlQl4TqXiGbnFxHDxOwgLF3ANXpymz05yS?=
 =?iso-8859-1?Q?1cGqo2NAtacyFkTVeZlyURlMHgEc86gCdC/Ooz+JvfDGVf1Hzguj0quGVe?=
 =?iso-8859-1?Q?dXjft/NyZ+NDu0fqxhqbbshdUCSpXL2tV7TneMjuxS9NQm/31/LxY5tb8I?=
 =?iso-8859-1?Q?rRxAGpyQcPFqXH3uz+p9TGheL5GXCG7Tz8t4t5nxtZ9zz6Y6hMYe47eFrR?=
 =?iso-8859-1?Q?ef7+dCMptuWx81oCI5UchOFPhLlE6ThkfMmkB5DbD8brdiZ1Fv2dxHft/o?=
 =?iso-8859-1?Q?zwLlXT7+gP593OhnktHntVFH5pzgzf90mom8p3JDtnsv6G5rc9P8ydTk6H?=
 =?iso-8859-1?Q?QQMUyFqD/fmC4k3tICN/KfT8ujhsVHL6VFPsoN3TW2DBx6nQVSI22aW8sp?=
 =?iso-8859-1?Q?YhGiDOembMYJlEQFRJzTWU6ORLRaYzB/1t/1iSoVH8f2rMSUp6FiDcah7J?=
 =?iso-8859-1?Q?MnV5dVowmgJr04pHueXajQnyn+hvhiiDmKT2+zkSXFMtQsQZ8kZ+JXppuo?=
 =?iso-8859-1?Q?mSXqkXgoZEdfFhXoiB/s16yLN46lyDpZudG5f/jwC6eDUZKbYFVvZL3au2?=
 =?iso-8859-1?Q?DDCVx3tM/mvXcyDn8qwMrp8FKmUWBKk5lpJ4wYXph/iwC77/Wc/9ty39Zz?=
 =?iso-8859-1?Q?Rnh9sUggPiKykTdfyml2RpoUmLwbL1tb5X4iEZPJj4vRIhCt7+7D45izoD?=
 =?iso-8859-1?Q?KqXh8OA+0N/FEUP5EKiSHa4kUko8F8aUCVqwWEwsnO5LQz25t5M4vZzpEY?=
 =?iso-8859-1?Q?/icEE+pK4NdyLMsHwZjMo9P6qT72nfeB09Ok6c1bhJBGwhEWle2FgvksSD?=
 =?iso-8859-1?Q?Z6QND9/8B9h0yRMigqNAUbw2XdNmC2u5zyb46IgpEOKIAFiEPEG0aZO7dl?=
 =?iso-8859-1?Q?PPQAU/GByudllVLHl1SWtjAB5+kdtQ/PrSx334apG28q8GGtfdr5Tj5klX?=
 =?iso-8859-1?Q?C2GQByXCob6cxfM7V6WZXOyE1yeb3vpJWQj2axFGbJ2Mqp3eH1wk+pgJJs?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?omvumtEPIXVSB7pAd+6zqooALYnvYne1GFMQSFPdxc/d7Zdbibttr9LXzV?=
 =?iso-8859-1?Q?vPYNFayQWTeJF4foLzFioaXwHiuGAEmLTnwa+lRp6KgMbH8aoUmCxZ7QtW?=
 =?iso-8859-1?Q?AarwtANXq4Vjc2dVCvYQVX/A5fe3fP1wxQQ+1/8kND6SlHjT9tapCg8syX?=
 =?iso-8859-1?Q?g+9l/Xq/GgZ3Q7i/XlyueOY+/U16WgqpFdAuBArkkaMmfrE1/Pvuw3gbTi?=
 =?iso-8859-1?Q?6IYuyKVEyWRvDSaskxIozgeEJpsT4BQPtHjiZzstDctUpyJfX99WWfHc5W?=
 =?iso-8859-1?Q?606PhEU5+2ZFLgqWPq37tAoKsHKR/wzC7sD4YAF1Ntkx3tboyqKpzUPUm0?=
 =?iso-8859-1?Q?D8MwmsECsLaEQoT9Ivb1K6dimsuXu8qWZrCcwuK87oprrUR0Y+/q2XJJ1Q?=
 =?iso-8859-1?Q?UhfqZJs0XVnQJ+rkD7QSFyQ3802gNN5gCXguldfQ5Gt9tPxSeb1Bm3GiyY?=
 =?iso-8859-1?Q?iZ7GAYeweELvkUjqiqreJuoz/GsfZ7xKAe7oYkEeNjVBca620r6T06yCO0?=
 =?iso-8859-1?Q?tvhpfTnjM9xNDHIqYUO4JAdJTcsQidka7RO8eiR2mxlZbFsiJ7+puyETE/?=
 =?iso-8859-1?Q?BnrnGDOfEi6HWxYdrXSRBvsu3oGyu1+HhnvN2crN1asIZbcTBqaV3OBVtY?=
 =?iso-8859-1?Q?4A1Vva6E090imZz8WAj/INCftXloSLdaa2OT+PYy/rHOvdWNLgYy5GODYG?=
 =?iso-8859-1?Q?juZroSN+g0fmm/OUv3BEZ+Nk+yckNmwhuVGIKpnNrKFAE+1E7XoMvotV7/?=
 =?iso-8859-1?Q?wJIHGWkQ2c1LOovjPdm8QKl+C+6mgDLAkP47xX4UPsD4Y/0ZxKvie5O3Kp?=
 =?iso-8859-1?Q?oVkjllqYs2Mhm2v+QD87V1QyGBCX3WiEbWQ98y3QhDEbMqEEtoLgs9U4Ec?=
 =?iso-8859-1?Q?V8cndjvC9IAjRVo8XtS9Ns+DLEdA8yzwilg9uqPGtU4S5Gl13chqAJ6SUU?=
 =?iso-8859-1?Q?zJ4sdltdu1TCmg/jQ+RGDl5200LCIIBpw3rP4SJgM5tq72+mLGRDVkvTJJ?=
 =?iso-8859-1?Q?0OYC04UWzR12XaCXNp9n5ZPaXWWjiNTUwZdpHeRZFMsLK3euY/JOsE6bVT?=
 =?iso-8859-1?Q?iPulZqXLXI9GWepN2B/d6GFfEV6SEl38qFHpr2VlMujUd7lPcSsxDGNBR0?=
 =?iso-8859-1?Q?aDZAOIu3JxjJw64/oWUh3Bi0ZOK0MR4UR4ofVeh9E15MUsxVbr9e0xXhfn?=
 =?iso-8859-1?Q?aYmEujNYGusfyw4fHC6aCnV+sOareCwoAe990t+VcPuXImM7y3Bbbj16eL?=
 =?iso-8859-1?Q?Q+IknWieQsM7SallgGF4bEXBbVIXYKDDuUZwOZFOZzRpSjeL4EXHyV+BDf?=
 =?iso-8859-1?Q?QEOHJo6oOI3pn9IFWHZzJdMhovacE2Oahfc1lW9cH8BuZCzDeM6achSBcy?=
 =?iso-8859-1?Q?xQkhBS3MCHGQNJG69SjL7wvu46hBIgW+7JuAzv6D6BctglvYXVighIru0n?=
 =?iso-8859-1?Q?NKww3tcXZ7s5mLWvEoTHhjVHipTCv0QG8gPCrDvNJxA0kum/y4Eb/+qUqf?=
 =?iso-8859-1?Q?OMzvipj37aCdd9LZ0RgBcrc2rAA9qHOnjePCvz/GymYG1etvHc2zyHRwZg?=
 =?iso-8859-1?Q?XZU2btE9c20kE3snhwj00r8M6v/K1ApIHc9Z9m3OO9Bo9kBEmsoKvVXBYa?=
 =?iso-8859-1?Q?d8ScPLgP6XtPNoM2W8lfm2SmfrITgyofx7MULYVv6DcX/d61B32GXiVrtg?=
 =?iso-8859-1?Q?k7gGVF7yReA1JeFYaSY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f7127c-56fb-415b-aa13-08ddda55dbdc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 10:40:45.4279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92nhxj/q7p2coUNxRgPTLosXiLtwNOFn1Z9oRuJtqFwKB2xMMLwEuPs65YzpzE3mTtiq9CJSBNUZlE0qs/kgIxPeATfVJ6IotW0bERjOfUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1EED2E381
X-OriginatorOrg: intel.com

On 2025-08-13 at 09:16:29 +0100, Kiryl Shutsemau wrote:
>On Tue, Aug 12, 2025 at 03:23:36PM +0200, Maciej Wieczor-Retman wrote:
>> Compilation time comparison (10 cores):
>> * 7:27 for clean kernel
>> * 8:21/7:44 for generic KASAN (inline/outline)
>> * 8:20/7:41 for tag-based KASAN (inline/outline)
>
>It is not clear if it is compilation time of a kernel with different
>config options or compilation time of the same kernel running on machine
>with different kernels (KASAN-off/KASAN-generic/KASAN-tagged).

It's the first one, I'll reword this accordingly.

When you said a while ago this would be a good thing to measure, did you mean
the first or the second thing? I thought you meant the first one but now I have
doubts.

>
>-- 
>  Kiryl Shutsemau / Kirill A. Shutemov

-- 
Kind regards
Maciej Wieczór-Retman

