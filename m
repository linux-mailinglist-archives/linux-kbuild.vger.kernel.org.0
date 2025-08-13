Return-Path: <linux-kbuild+bounces-8435-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6FFB248AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 13:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 834DD4E3561
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDB12D062B;
	Wed, 13 Aug 2025 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kE8NSE1N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A32D94B0;
	Wed, 13 Aug 2025 11:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755085484; cv=fail; b=WbfflfYO9j3JYthNq2SWn6vXzvkNfqVIdc1qwdDMNorPdtybDDwdIjan5lsJA9zzTaB6fra6SNRRibyKYxHql48/sSqsWtK7fhy58BzBXwVxBxXJQXH1aM0+9A5Y9WBKNxbMKEbIed19CvuIgPNUc66gunxg6+UCP/186ndfB/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755085484; c=relaxed/simple;
	bh=mx1sj/6s4tVWUubNKOB9VYCygnoXWYdaWIXxM0em7rs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m6BOanYy7yBhrncXCf+lvYXJFHALQCDR7RW2BDshtv7fhVW4N6BjyCTV4SW3KLs1TJW65j6mw2yQ3J4lGibG5p/Gvw1ryTM6MCDqC8ivfzhgF7gdYm1u/TxdeBdCAnfiXMhZcQxxfJDGP8xRqzY7km8HVDJN4W1DzZNADxx929c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kE8NSE1N; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755085483; x=1786621483;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mx1sj/6s4tVWUubNKOB9VYCygnoXWYdaWIXxM0em7rs=;
  b=kE8NSE1NpO0yk3OjsvKf42h2PDubStT0DZ1db66wC2m+RFv6Votp9GER
   GImygAYXBkDSo2glVBsu7QGpEVJCJGXzd49evTkw9UiIqnSe7FNaU1kxi
   TLN2/S9eavQ1bNIRchF+B/6/IyCn+HMlKB8v6hJ0Aj/5j35m9lv/vCtQP
   +xyxAiLeg2iKzec4ZEc6Wot2NR5ErAC2NEJlzdgShlmUgYrwF0Yj+cd1e
   CU0OSm5n8acxlB3MwVUTA63dyiWMmaD7IQtnInZPkAJVCf05D/F2iLNTO
   C7oF7HRf3y3ZjaidtjYYH9AdaFMpsdcC3BD5sYGPDWQPUN4urAEtQQcDp
   w==;
X-CSE-ConnectionGUID: +8qJHJNVQCK8cMlOXOz5tg==
X-CSE-MsgGUID: BduTY7bNQS+svrIYcae9dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56586287"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56586287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 04:44:41 -0700
X-CSE-ConnectionGUID: K5agJHgMQFaaMHizXl83yA==
X-CSE-MsgGUID: EEi7JZIhT2Wq/rMKioh+QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="167240485"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 04:44:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 04:44:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 04:44:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.52)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 04:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxBNXcLCPlMqHG/OXutxRYko0MZTNNJuQFUPvpnYYIdJHkgIEQn64cE5Y6iMYETu6xULcXxpIbB785anV7eFRMa7oUwfGL/UCvUrMMMH5tqGfBotr1Y5yDMVP4yZZWPdc2MmV3/i6fCdWux0DKx2tv2T49Gg8vdJuKJUEt0IGlHQ91sUBioyb5Pk6SU73maooNZhgksT36/29YnTRtAK6LYBhwyFmALe08PDZ/Hf8gLkC4s5gk377PHRyCbmmnv4qeICdhBLcr7s6jn5qOh+/n/pC7qIgGryE6rVYNI0KbbS/+kFMT7S/WDELE+iA71dYdKCd046tCK50pcVNjsUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCY2xioaOZZ0eIx3IJXs43PtynuXv28d/Le9lAtm9AI=;
 b=PPz4bJeX5wF6B0k7M9reChMmnUPRcjQePQz325D1C4tPDlXthqUxqdKUd4FjWA7hzYdyGuFNXzMyderk7iWkyi303HkRtBCQjn6rqBRXxkzztqvHzyZbybuhAf3NcXQM8j0ZP6b8jHZ+nAOLXIkZufJPErwP6Tsw/e6haBKCcumU4iklAL3NBC7Rc6sQ1/62RR0sUW/HuXI0DCLXqjx8aiKWBIYqlkNEDF5u9a47nNwg3MFNV0tX+vbdBhDXz9YE5vGw+VwJ6/pC2dGKnbuokxkvXgBPYEgX3qgbBeFthcefWM6t84uk5LTLJj3r1mMttgHTrspwW1R4o8u2OaXz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SA2PR11MB5050.namprd11.prod.outlook.com (2603:10b6:806:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Wed, 13 Aug
 2025 11:44:38 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9031.012; Wed, 13 Aug 2025
 11:44:38 +0000
Date: Wed, 13 Aug 2025 13:44:21 +0200
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
Message-ID: <4oiaqaiqvxgswebgm63mtyv3pxuhsx2jo5lade56flgz7laoem@au6ltbbzmvoy>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <mt3agowg6ghwhvcjqfgqgua3m3al566ewmvwvqkkenxfkbslhq@eun5r3quvcqq>
 <rzlimi2nh4balb2zdf7cb75adoh2fb33vfpsirdtrteauhcdjm@jtzfh4zjuwgl>
 <ebl5meuoksen5yzpzbc5lcafcgzy3esfq7c47puz4tefeskkos@f5wzzg4fjrfz>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebl5meuoksen5yzpzbc5lcafcgzy3esfq7c47puz4tefeskkos@f5wzzg4fjrfz>
X-ClientProxiedBy: DUZP191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::28) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SA2PR11MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: 6735fae1-f688-4b91-0dfb-08ddda5ec831
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CGHIQ5piAHsXhj5B9Oezf4sPUol1XanMtIMBtz+Fsni6BPnXwiMGyNp6YA?=
 =?iso-8859-1?Q?+FbtZlDP99AjnJFdJ0d2sDcVuC5RDgDXPh+Q+vKuNE8d40N6DTEbjZwkEO?=
 =?iso-8859-1?Q?zbNxnkIM/sVRlfUBICUoeKHum+XLhfo9RXrWEg75ude4hL5BAKJ5BH0Emu?=
 =?iso-8859-1?Q?EsvQNYB8Ifgfq6IZsNmkBy238lPGUE/I4brhaaG98Vz4koEnoD0QeRLn7U?=
 =?iso-8859-1?Q?pxA3QarWhD87LzhMfE6iPjeKSdjxwhBzVgzOU3S36Xl/RaVXaP0+dWUP11?=
 =?iso-8859-1?Q?/hHWWvquhCKcEYDOlx2PQ3PK688WEfmwyz5l6syWWBIouZcwJtP6enPquu?=
 =?iso-8859-1?Q?XIni5Y4lcFs1pJNt+vsrLq7J9wE1T569OpAmHBPg4Lhz7tLNAvR4qaRboj?=
 =?iso-8859-1?Q?xEXfZ1vI4tx0DaLJB+GixevKfI+cip93QgIb7UF4UvTins2/dTmiKMHElw?=
 =?iso-8859-1?Q?iTYvQ7GHOKPuw1N8g+9PaxNp50G4ukiNHFHlyMHJtaFuxhYkocf9GOhwpY?=
 =?iso-8859-1?Q?6l5OBruPBzv2AkAp3sEXh2OjqmLRMKulTUVpbxREhZHVnbLNDokGfn2jwy?=
 =?iso-8859-1?Q?ZQVonzjJRq5oC+G8K1+bl1i2YF+ofBGwcAI5E/K9spikNUTyyTUPobaEbn?=
 =?iso-8859-1?Q?ecaizAhBSMgqKLzzXgFdX1ayoKODjZE36z/E0CmkfbdzzTVz7JzpnXVNh5?=
 =?iso-8859-1?Q?ipRHIyt2nXWlDN2DZITrWDfG6G+Ud55qx0+KZeKkTHDQoML/GiFoIPWEPa?=
 =?iso-8859-1?Q?ZwphxWgjujAo39VQoPA/vXDgC0YfeYNcENmMdD7oZS65UoyH6wf7yuxj1g?=
 =?iso-8859-1?Q?8gwDUnoNHhjKSVtUpnum4Gex1wTiE9yQDWUXVm+mrC7aD+ibaGfkjA0bxK?=
 =?iso-8859-1?Q?68a7F/sDm6TSxxPhVh6MQYPW1t229eZ8UOZT1ibM4lJCJCSB+GdFtQ0+iV?=
 =?iso-8859-1?Q?LfFSpiWEDX2bbdIqseLTWsyrdDRDR0vXFO5Ss6wEwuhEVTd60/o5PuYb8u?=
 =?iso-8859-1?Q?aDxnn9lJSvBtZZlwNRus7uGfDOXQPmcd+sVLelCkIGyzUZY3/Vp3v3cxbS?=
 =?iso-8859-1?Q?Rt8PA4j/5Vy+dShHgREtuOtSHawpZdkqdPqtsF8ZcI5aEMnlf4E4885JDL?=
 =?iso-8859-1?Q?kmRoXCfg9TJ3shg3oh9gvkb6L69JQzBAl9iWFZOgAIGbDOEMXtLvjyWzmo?=
 =?iso-8859-1?Q?lUbMFxymDxKIStKvN60Itcb+qePW9XRKLVM8IUFFpMC4MgRjt9V/ILaYfP?=
 =?iso-8859-1?Q?B5hvWljrhOPddXprym1Ze63wXVkZS5ws8GBXxgf28drvvb5yUNziNINF6t?=
 =?iso-8859-1?Q?GZpdt927G++TKfsIWe1YWmEjYYP+zs14o9cO5ECW5rUKiW1ruVt1OljBJf?=
 =?iso-8859-1?Q?bHf/SgksV/ejGcsQH9KNDoh6k98IPJnr3A9JQ2bJUdasQCe563Dspj1de1?=
 =?iso-8859-1?Q?ERVYPkFCoWAVs1tzsTzCdGvt8+CQfNAjhVoft5BmraeLgNG7aGA6mp3yMh?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ncrgWSQ6zz+5YTRKqnQedbzmne2xBiXqRL/Ji/IzxSSKjUBxUUexJyKhQV?=
 =?iso-8859-1?Q?cxV3iMJtCx8GO9sYM8P/D/kC2+9+YeZuJhYtH0ldNF4vIR2c6FUqjLBIT7?=
 =?iso-8859-1?Q?Bsf4PFPbMCHAYWBf6YxzC0F80K0qtDCoKe2gOXGbpAdxM07kXylDZ/PsV+?=
 =?iso-8859-1?Q?ErVCanlHiJMuoKQebN+RWmzVzcnFf18ipQopeFUVbil/sUxS1y7oipJmJo?=
 =?iso-8859-1?Q?2BUbnVkMKDz/srkp7m1dcJkkkkMSVfnbEm3wZzdFg816/F+mumDqslVL0C?=
 =?iso-8859-1?Q?s//H0qai4C+KL7PXZkJifKx5K1j55cnjVBD4lKjGDOkyYlaob6OJfgImtb?=
 =?iso-8859-1?Q?yF9xDrkHVMZKQW06jsznKRA22ho1SQ1T3Sya3bCZ3o6tRDhRTjkI5NaFO0?=
 =?iso-8859-1?Q?6D0DK52qp+AQ2AfEolVgdnXJ/63A4wpkLeCSNKkX0qYLe73whup98e5wN4?=
 =?iso-8859-1?Q?00YC8TqtPemOcdnsG3WgduEzJ4a8RACqrS5uKEaprE2sdpDCMAw/2eZKPC?=
 =?iso-8859-1?Q?410EhsGKwjO2V3pgAhzN/0KooNb0Iu1GjSV5y6JH9XoJkGtZHvONHlbCcI?=
 =?iso-8859-1?Q?rnfpAV808x134sGmZLzCda9rUPT16qVUl5S/z4C9WhvYmXMUjn1j0omdR1?=
 =?iso-8859-1?Q?W+kRNKLFMBkV3DfwmFP5+Ogg2Onj4g49Jssi0bEg8whReH1r2kGFW5sOBA?=
 =?iso-8859-1?Q?UlB4vc2hK/XTAP+IOsHgLELu5dbxZB4hfublMSafJiLniRFfWn0Sa97Eiv?=
 =?iso-8859-1?Q?ywxKJcNXkEjE1tE78UOB8XLV2PelyHyeeX5/jJaWJ6etajG/CB18VVKO56?=
 =?iso-8859-1?Q?6QrZ/F3aymSydts4pgZdER4wq9jYdsdT0l9ea8+6Pz+rnDkgHp1avmgeYZ?=
 =?iso-8859-1?Q?j06N0RifbInmqGzq0lK2XNx+JvH7XLWhAAc1bpVjJ1cEb+0mXhEJkXhyWf?=
 =?iso-8859-1?Q?QAX9qLksuU56d3hV/+mDin+gH0F/Gq+K/vhICwSPRNhKHXnksuwMI8gBBS?=
 =?iso-8859-1?Q?Oy3kopNvF1dHe1b1KM0Gj4gZQbKt4J8yAAaix0Ayzmk+W6CQzcBfeJXy9E?=
 =?iso-8859-1?Q?XgYlhkY6twKL5smOrVaOI+LU8CEiwXOgWcsMtJc2uOg6SnU/xjcZ3+FzNM?=
 =?iso-8859-1?Q?MSg3lJQ/Pa0cNWhaqHpRpRwfHn2ZDMeUOewHZh7A0b+dUVDnTZZiBiSmO5?=
 =?iso-8859-1?Q?NjXeODJRVOcw1pRnz6FE34/mxB7ZsxbVYJGn/r+sKpwhJyYpJNnAWzDt2l?=
 =?iso-8859-1?Q?rljKIEXKKK654po2Ivo1TLlh9VNykDf9zHOawrxw1i6d9pPYl16pZHwGp2?=
 =?iso-8859-1?Q?kJIqKrjQ5wEEh4SyLIQYnXgLDNUwrlN0Wz3Sepfl/qi71da//1CvVQ37qm?=
 =?iso-8859-1?Q?FWUFfP5L11Oiscu1rkGydlmeqskqbCZfCVXrzjzhZI2zXO3sOCk04NnpPp?=
 =?iso-8859-1?Q?bd2uBnnYHhHl2ixABlJeI4j1NJuX5ORiqlO94OTGNyW59VNJBBl9faCDCo?=
 =?iso-8859-1?Q?QMcWxSo82MPW3s/94GHMS7hNMaaTmhn8hijW6nJfHJmXGmiM8+7eWrSBui?=
 =?iso-8859-1?Q?/wgMc1NQSRupkcettwKEN1HRhlOu/uolcJDuJsDx+xNiH18W4t5fbCN/KN?=
 =?iso-8859-1?Q?wOorHYxTXbowrhHBan+pOp+4BiacL3OgEKqyxBmEE548nlAV2zBe48ft1z?=
 =?iso-8859-1?Q?sUY/fIomFdwvfGZvbgE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6735fae1-f688-4b91-0dfb-08ddda5ec831
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:44:37.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAsf9xjzU49MdbVT9LKN8H4y/IW+vTEbdL36OUtjD4EHk2BltPCgCmsFOxJ7zGFCfvceo3NhE7pozZcZutAs7tLgXlzGhs8nGLvwbZAE7Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5050
X-OriginatorOrg: intel.com

On 2025-08-13 at 12:05:47 +0100, Kiryl Shutsemau wrote:
>On Wed, Aug 13, 2025 at 12:39:35PM +0200, Maciej Wieczor-Retman wrote:
>> On 2025-08-13 at 09:16:29 +0100, Kiryl Shutsemau wrote:
>> >On Tue, Aug 12, 2025 at 03:23:36PM +0200, Maciej Wieczor-Retman wrote:
>> >> Compilation time comparison (10 cores):
>> >> * 7:27 for clean kernel
>> >> * 8:21/7:44 for generic KASAN (inline/outline)
>> >> * 8:20/7:41 for tag-based KASAN (inline/outline)
>> >
>> >It is not clear if it is compilation time of a kernel with different
>> >config options or compilation time of the same kernel running on machine
>> >with different kernels (KASAN-off/KASAN-generic/KASAN-tagged).
>> 
>> It's the first one, I'll reword this accordingly.
>> 
>> When you said a while ago this would be a good thing to measure, did you mean
>> the first or the second thing? I thought you meant the first one but now I have
>> doubts.
>
>I meant the second. We want to know how slow is it to run a workload
>under kernel with KASAN enabled.

Okay, thanks for confirming, I'll run these compilations on the system with the
tested kernels and attach results to v5 of the series.

>
>-- 
>  Kiryl Shutsemau / Kirill A. Shutemov

-- 
Kind regards
Maciej Wieczór-Retman

