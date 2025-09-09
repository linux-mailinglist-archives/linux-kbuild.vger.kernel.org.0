Return-Path: <linux-kbuild+bounces-8782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F3BB4A5EF
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 10:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F4BC1B270C3
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF322727E6;
	Tue,  9 Sep 2025 08:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb/aek8y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48A23AB90;
	Tue,  9 Sep 2025 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407819; cv=fail; b=On0BkOjDg8HG0PFes19lqYnLSjzAI2AmfulH7Xj1qksAlVD+mhopO8bEoyuAGN49aGHOpOJzi5Z1qckZEdr/QWSThobz4Lah6AmAYPocUoZHnKKCFB8DltCQ0tO6X0df9kkQpg1aUvvmg3VvWgEKNojNC9n0xS2+CPcLFxCPsoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407819; c=relaxed/simple;
	bh=rQDKiv2ZjAMywqF5PAW/aC/H5f+mp90uRMZAC2XK+u8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IjrFJ9u1XsPOqr5GdgoFDB7Ta+2T5P7TdxuB8dOfAzihpo4f3y+Dis+yXjviwTsoBxRrDmUKUe5y7sWXDtdIVY6Dx+w7OxOxXk1dCGRJhMpces8NQAPfbkOB6zo4qpFTmjpjLEzlgp/pQtauNVLXx6KZgIjOt8m2GhKk29/zYbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb/aek8y; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757407818; x=1788943818;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rQDKiv2ZjAMywqF5PAW/aC/H5f+mp90uRMZAC2XK+u8=;
  b=Lb/aek8ynHXL+X2507iRnWtaHeJ03WeerxAVtJFynjr3F6ESRFVSEUZS
   HUYSFStiz/+7VwwPzXMyQ7D4B9aGusrDaWVRR2BQZIjpUsQh+O9tJEss4
   8sY0iaqvYu1dx4UXHR3+pXrGkFDlVn7ZDNmAU6ukHNi2NMQ8o6I1Rucu1
   TAvLrmQaN1vB9bAEGTZDvdIUQpzN7GiXo5p7VdgZYpVmNaqoGTmhIelY5
   VmjWNFx1LSGWZ+wBOLwL1nrx+WVtJfxZC+kLihWO5zuYtXMXFo7GSeiDK
   ABe6C/Ru4U7ertNORSHj0y5LQtP9FXR88yvfl5AnurzYUHQD6nP81ottE
   Q==;
X-CSE-ConnectionGUID: FvTyOUBVQIq2tfgnEgZ6qg==
X-CSE-MsgGUID: falYu5DxQLKp2ro1HxnXRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="58723317"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="58723317"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:50:17 -0700
X-CSE-ConnectionGUID: s+D5nECRTk2xz1MJ6JZOCw==
X-CSE-MsgGUID: w0kHetB4T+WPq9fMFqD8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172295204"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:50:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:50:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 01:50:14 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:50:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVDZNd7745nt+LmrQgMpm9OAxYfC7N6iT/RBHAM5q/mnemJF1o7Su/kC3DJl2097XSu6sOQrRbv80D2QhDQXMBLgyBEATBqAefmlNKKOx9VPSZqIuG2IfhvlXtOjPF+OgXIasn0sPiI9KdbgotV5S/vU6I2ES+lyq5S8/7AcMS65HEOOMYuqH594MPZxsKWKqS8HT9D2+GyaCxoboxS2BY4emBNzNCRIngZQAVSo6U+1k2CP2C6rB1kApVaH/ebPX4kMB0TaQUotpc91sADu8cOzsIFcQHAjrowqTlfHBdUjM8jmejHvY8ZIPVBriFcGloSpyG37o3FY5EBToBIsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+0FpqfXm8Wo4jiPA9d/magNB/aiw1qqIac3pLFvB90=;
 b=p1g9+SCO8yo7vVhx+PmOWW1FaZ39iHKZpJWt2X0ZEtjox0uALf3YhBPPM6lDk0iFhl/ORlOfQKZb+6sQ4NSTqidNBmGiMe4MTGiBl2dlWCII58nf35T2qd4ifgn28sEq5168DwPMPVvdP3iqOa8jwZyQOWtsN9e9Qnlv1PmbgzPQ7XDb4wZtMmU1Dy9klbP4ZrQ79idLfkqEtsqOjpmD/8FbRtl9ozrKnrVczoihQH/aZuFDemkucf4reJzEDjj11t8e0m37gZp4uzb23zQYSnScuYcGn/XBDiVZdLepIPLU8laqu6xhuUvghSKm1rNG5WTa4JmxwTm7P/taPB3C9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by DS7PR11MB6013.namprd11.prod.outlook.com (2603:10b6:8:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:50:10 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:50:10 +0000
Date: Tue, 9 Sep 2025 10:49:53 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>, <sohil.mehta@intel.com>,
	<baohua@kernel.org>, <david@redhat.com>, <kbingham@kernel.org>,
	<weixugc@google.com>, <Liam.Howlett@oracle.com>,
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
	<hpa@zytor.com>, <leitao@debian.org>, <wangkefeng.wang@huawei.com>,
	<surenb@google.com>, <ziy@nvidia.com>, <smostafa@google.com>,
	<ryabinin.a.a@gmail.com>, <ubizjak@gmail.com>, <jbohac@suse.cz>,
	<broonie@kernel.org>, <akpm@linux-foundation.org>,
	<guoweikang.kernel@gmail.com>, <rppt@kernel.org>, <pcc@google.com>,
	<jan.kiszka@siemens.com>, <nicolas.schier@linux.dev>, <will@kernel.org>,
	<jhubbard@nvidia.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mm@kvack.org>, <llvm@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
Message-ID: <xeedvhlav5rwra4pirinqcgqynth2zrixv7aknlsh2rz7lkppq@kubknviwhpfp>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
 <20250909083425.GH4067720@noisy.programming.kicks-ass.net>
 <20250909084029.GI4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909084029.GI4067720@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: DU2PR04CA0244.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::9) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|DS7PR11MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: b64eeb11-3e99-45ba-14a4-08ddef7de25c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDZyK05qRmVhY1JjOURxeUVKbTZ4amI1eURDZkQ3YXdFRVRlSEhETjJnUTJv?=
 =?utf-8?B?U3pPT0JHUzNuN0d4QTVuUVhDTHBRay91WUhYZ0dNbWNUMHhDNmZpdzYxbWNh?=
 =?utf-8?B?UWdFWnp1eTVNWTFhendiNmcyNlNoTUhSVEQ1T2k1Ym1vVGN1T1Rzc0U0VStQ?=
 =?utf-8?B?SU9Lb0l3c25sRE5oRjlBYjlRUHQrOTJGWi92VWFiS2dXcXVRQXhUY0RSNVZz?=
 =?utf-8?B?MnNXZG1XWjhERG94NEdpd0lUYy8rWmxUUGZ3OHg2WjZyQWR5WTlZdWUxaktV?=
 =?utf-8?B?UWdWR3lRNmZhcWxrL3Q2dEN0TjBDdmUzUHRzVFdiS2J1NHJrQ0w0SnRDc3Y2?=
 =?utf-8?B?M3piSllOaWVJWFdKK3ZrQllocEJhS0U0b0dQaENTRzljRUpnQms4YThEK1ZS?=
 =?utf-8?B?eGUzWEZhNkdsUkFVSE83K3pjK1ZIS0NLblE2dWNTZUZKcThMaGJJSTgvdmhh?=
 =?utf-8?B?N1pMaHdHZGhTREUwSUVrWTNVVUdIcE12c2o3bkx6ZUp1ZGZveDZXUHNvOUhk?=
 =?utf-8?B?UlpSTUgrdCtVd2RkbnJ2OCtiNkdremgvaGs2cGs2cGFOVHlIK3BZNnhoSnVS?=
 =?utf-8?B?OVVQVmFyUDU4R3dWeER6dWY3dGhKMTZsWDF2STEvdmk4UFI0WXFiQ1pscTM2?=
 =?utf-8?B?aC9iVTBMYStRWk5XMEtmTkg1MHRyMCtnMTQ1bHBYYmpRTmRzR1hVS3NUYjZW?=
 =?utf-8?B?aW1YNG9vZFUrbDNtQm5OejJIZldnQmxuaFdpa3hyc3BtZkEzOVNxTjVOUWRB?=
 =?utf-8?B?OVA0aDlLNEU2NW1TQm5ob29EK0NxaFVOWExuZ1BJVmNEZ2lMaEp4NlZLaTgv?=
 =?utf-8?B?RFB3OTkySlVybGVNKytSZTFUSkhUYVdYM2JlNFNud0h0bmtIUnlBSWhvZnlD?=
 =?utf-8?B?VlM4SEZHY1kzaWJYSklYUUdldWJHT2hjL0c5UDFITmt6TzE3Lzg4d0tqaVRR?=
 =?utf-8?B?K01wamRiRzdQaUxjbnczZG05UGlKUUQ2V3dGTFRmWC9JSTMzTVBVWHB6RU1B?=
 =?utf-8?B?LzVHRG5USHhreFVoTWF3VE9BUjBHdWVseldMUlpRbzlXMjRTSUxQOXFHRmpw?=
 =?utf-8?B?K1lpUGNBM3VGamp0ZDU4eEljZmtrNHlnWWlvNDQ2Y0cxY2J6Z0xFbUl4anZr?=
 =?utf-8?B?cTFIcUF0NmVzRlZHOWpTZGpHMWc0MGEveS85TnVaYi9UbGVuSXV4Y2pDSjI2?=
 =?utf-8?B?UUZnNDdqMnVDZ0FEWmlrMStLdVEyaXBtTlhvZENlSE54SmRzaGFCSGtWSGkx?=
 =?utf-8?B?ZVlPcEI2cFliTDVXTmc3OXpobUw2OVBPUkIrMW9sdk84U3ZscHR1RGhDR2Y3?=
 =?utf-8?B?UTVJVjduUjd4cmxhRno2amdmalRPdERWUDZueVZDOHlsT0Y3dXFWQVJRYnNL?=
 =?utf-8?B?Q2I1TVhac1pzTDE4WCtpSjA3Z0FoTElRWmZYcVNDdVZZZXBURGpsUlo2dnJr?=
 =?utf-8?B?SXdDaW5JVTJkdmVxV2VxUW41Z1ZhUFpDWjdwODJsOCtUbGhOQ0h6NTR2WTdo?=
 =?utf-8?B?eElKTFFnYmVNczNQNFVtNmxwZGFyS25tYzRNTlNteHdwWW1SVm1ZYUpxdXBG?=
 =?utf-8?B?bGVqWkJLK01VZERaNis2TVFCdjJJNy9WNDM4TUpNb1E1SFJ2SGpBV3JLQjF6?=
 =?utf-8?B?SkFlL1dOM0Z3T3NSeXFRR2NzS2dDRVpKRVFHL0RVQjA4WEF3alExRy9XN25u?=
 =?utf-8?B?c0F5YVdHb1JVR1E2dDBnbzlwWWdzRVFHblFVWHRzSUE5aUhGUnF5M0VtV0Iw?=
 =?utf-8?B?R1lIMnBTdmNFU2Z6c3FGMXdkSEFsMk1yRDBNbTIyeEpHS0JhcFE5RUZEUDVI?=
 =?utf-8?B?NXZEUERWVXF2ZjNQa1lpbEZZL01SQ3BIZTFHQXM3bCtITUh6TmkwN1ByUWVW?=
 =?utf-8?B?dzhRMjFHNzhXZncxYmh5YXVzYTdrQ0tmTnJWQWl0VnBTWTNRbXFQd2ljVUpP?=
 =?utf-8?B?VE9aMG40SVlHdWQ2TktWanU3M0FKQVBORUlWaVFucmY0aGpuTEpxeFFTZC9w?=
 =?utf-8?B?QVYzeDVxNG5BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW8veU1ocmE4bVFvaDkyWkNWMHp0OTQyM3NXQTlXRDJ1aGJOMEw4RDFxc1Iw?=
 =?utf-8?B?UTBsMmZkazIzeVpxbFRQUll0blRhNUpkUFpaeVBkZ0hPK2NRSHpVaGJHTVFz?=
 =?utf-8?B?S2ZvYjNoQlRLR2NicVFYaDBRNjAzaGtvdmQ5aklSN2NBVUlrNkRzV3Y1MmxP?=
 =?utf-8?B?NnJ0TjlWQjI5KzNhNTJKTFNKU2Z1K2MwbUxVdlluZ3ZJUFJNTWMrQ0FOTUdN?=
 =?utf-8?B?cisvSFRtRENMenhmSW1QcktZUURqb0RDYmcrbjZjMU10aGxsODgvVE0raTl3?=
 =?utf-8?B?Tk5RTW5Qa0UyZGk4WGlMVlFEbHJiRTk0Tm0vRkxhOGhRVUFFL1VSVG5jZmFw?=
 =?utf-8?B?M0RSZHJIRWRSa0RsWU1PcURJb25xN2ZNMTFleGRpc2ZKc1ZjdlVpaTJYL2xH?=
 =?utf-8?B?Nkt3VnlxQ295QlNCU2tBTFJKT2F0R1l4aUlKbHBYZ3JiZUFlVUxDMWVUTDZC?=
 =?utf-8?B?aEwvOFlMTHc4WVQ3OEQ2S3BtTW4yTXAxVmRwY0FYYWgweW10VENYVVJYYUc2?=
 =?utf-8?B?UG1CTU1ERHpiZVNBVmVzRHllVi84R3daOFpRN3h1Wk01R0NoUWRBZVhSa1JD?=
 =?utf-8?B?SzZsWHJTTjJuOWN4cE1vbzQ4bjNlSm8wNGRXOFJIeFhLWncyRnd4QmpZRGN3?=
 =?utf-8?B?WG9NVGtGQm9vZmdCK1pDU3Y3RUdWeW00VzBoQ3MrMlIyVEtyMDF0SDJSOU5t?=
 =?utf-8?B?bklkWUNTTXU4MzVOTWc1cFNpQlBBZHJZNVIrNndaVDRiVGt5NjkweHZiWllh?=
 =?utf-8?B?Tys1QzNwbXFES0k2YlpITEJOeHk1MjZCWGxCb2dsazJySFNHbmFGa3FMWFlT?=
 =?utf-8?B?cFc2SU1nMnRlMFB3SjQwcUpCWUVLMi9scm9rQ1AwQVlBQ3c5VHM5T1hOZTZq?=
 =?utf-8?B?aW9LN3RVMzhvdEtGTlU4NERKMW1PcDNMVDZORG5oQzd4UW9vdkJyUmRyVzJ1?=
 =?utf-8?B?eEx0ZHBLS2U4ODdMbkp4UTZ3Vlh2QmlkZ1FxdGlHTVo1ZU5td0h6dkpMTVZy?=
 =?utf-8?B?WjBYZjJFclBtd1B4T0JNa2JiQzJCZU1nbzRXcnFIWEhkcldoSlJhckV6b1NU?=
 =?utf-8?B?bFNVRVFlNVdWQ2lKZy8xYlRZWGNMUHV1WG13Y3hmMTlFZHM2ajFNeElKNDhL?=
 =?utf-8?B?cnl2elVUOC9tQ2dwQW8wQ2U5YkRId1FQY3NPWnhLNGpNVFQ4UnRTQWRudHhu?=
 =?utf-8?B?V01IV0ljU2VVaGgydzhtdjlweUFpN0dYM2J4M2g0TXJuaWtXaVpPZDU4K2ZR?=
 =?utf-8?B?V2xvRTFBeTY0dzVlTUljQU4zWlhTNXd6QXlWa2xGVWZVSVROcER1MHU2ZG5T?=
 =?utf-8?B?T3hWZzdubmFaR1RmcHlJd0V0VGtybGE3WkVPSXRyZlptSjhMY09GTnludC9x?=
 =?utf-8?B?enJPK2IzcmpHTmdQUWtnUUJ0dTZVMmhqOXZ1N2pzOXlQbFB3NjBxTHNJc0pm?=
 =?utf-8?B?eVRSZWU3Y3cxbGpOcmlWK1FsbUdXSnJ4b2Q2Ym14VnRVeUVkVkxhOUdZc1gw?=
 =?utf-8?B?aFFJOXFkM0RnT2RlQkhXZ2phVHJ5VkROVUlXbXFScUtaVFFpQkRDRHJDYTQr?=
 =?utf-8?B?Qi95cHN0aHJOdkhkUlR5Q0xLQzNjV25hemErOWhCWFp3a0ptWk4xMVpEOVNX?=
 =?utf-8?B?ejJtTFNRZGg1dmpaVWM2TmxRVS9DbW01SWdFdUVZTXd5MGJSeWI1cGZRZy9M?=
 =?utf-8?B?Tm02VnJmaHBISWpYTFVVV1RPNXo5U2ZUOVJwZ0t1bGRtdDVaV285VXBTMlFX?=
 =?utf-8?B?cjhVREZBSk9OcXBxSzNxbnEyaXhTL1lFOFBhZFNjblBGNW9tQmNuTXFCbnRK?=
 =?utf-8?B?UFJLR2Z3S0o2QnN3NjFzVWtROUZpMWxSZmtERTVQM0k5NnJnc0RyTFNsemRi?=
 =?utf-8?B?K05jRTJtLzduRFU4VlgwVGV5R0RTdjkwNE9NamZ0UERYUWtKUE1XbytGM29R?=
 =?utf-8?B?VmgzS2s3dkJFaXF3M0QvVWoyVEdpWlFMaFNpbDA3Sm1KWHhWTjdHZmRGd1VJ?=
 =?utf-8?B?WmhvSmxKVmJyT3NsUnpoc0F3VVlhVlBLZmZYZ25LczhLTkVhdTY4eFh6T2FY?=
 =?utf-8?B?WlQrU2F5VnVMZzV4N3FSdXdxNjlNU040YmNkTCtCQ2xxYlpsYXpYdThxMXVl?=
 =?utf-8?B?RnlBNmN3SmUrSzdvRlBYVDNGYjRaN1dRTGg1L3JwMkpmMmExTHF2Z3pvbTdL?=
 =?utf-8?Q?v0tmgP7WgJhKgtbhhXFiOOo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b64eeb11-3e99-45ba-14a4-08ddef7de25c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:50:10.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMNZzrut4Ym3tP8atNJcvlHmlCUDvzf4SPAjtd+Ziv0z7aeGTHOog3KNFKHU+sS5QHjqCMlMOCICTFMx2fpCWMrO0DDXbmu4QFEVXpIiFUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
X-OriginatorOrg: intel.com

On 2025-09-09 at 10:40:29 +0200, Peter Zijlstra wrote:
>On Tue, Sep 09, 2025 at 10:34:25AM +0200, Peter Zijlstra wrote:
>> On Tue, Sep 09, 2025 at 10:24:22AM +0200, Maciej Wieczor-Retman wrote:
>> > On 2025-09-08 at 22:19:05 +0200, Andrey Konovalov wrote:
>> > >On Mon, Sep 8, 2025 at 3:09 PM Maciej Wieczor-Retman
>> > ><maciej.wieczor-retman@intel.com> wrote:
>> > >>
>> > >> >>I recall there were some corner cases where this code path got called in outline
>> > >> >>mode, didn't have a mismatch but still died due to the die() below. But I'll
>> > >> >>recheck and either apply what you wrote above or get add a better explanation
>> > >> >>to the patch message.
>> > >> >
>> > >> >Okay, so the int3_selftest_ip() is causing a problem in outline mode.
>> > >> >
>> > >> >I tried disabling kasan with kasan_disable_current() but thinking of it now it
>> > >> >won't work because int3 handler will still be called and die() will happen.
>> > >>
>> > >> Sorry, I meant to write that kasan_disable_current() works together with
>> > >> if(!kasan_report()). Because without checking kasan_report()' return
>> > >> value, if kasan is disabled through kasan_disable_current() it will have no
>> > >> effect in both inline mode, and if int3 is called in outline mode - the
>> > >> kasan_inline_handler will lead to die().
>> > >
>> > >So do I understand correctly, that we have no way to distinguish
>> > >whether the int3 was inserted by the KASAN instrumentation or natively
>> > >called (like in int3_selftest_ip())?
>> > >
>> > >If so, I think that we need to fix/change the compiler first so that
>> > >we can distinguish these cases. And only then introduce
>> > >kasan_inline_handler(). (Without kasan_inline_handler(), the outline
>> > >instrumentation would then just work, right?)
>> > >
>> > >If we can distinguish them, then we should only call
>> > >kasan_inline_handler() for the KASAN-inserted int3's. This is what we
>> > >do on arm64 (via brk and KASAN_BRK_IMM). And then int3_selftest_ip()
>> > >should not be affected.
>> > 
>> > Looking at it again I suppose LLVM does pass a number along metadata to the
>> > int3. I didn't notice because no other function checks anything in the x86 int3
>> > handler, compared to how it's done on arm64 with brk.
>> > 
>> > So right, thanks, after fixing it up it shouldn't affect the int3_selftest_ip().
>> 
>> Seriously guys, stop using int3 for this. UBSAN uses UD1, why the heck
>> would KASAN not do the same?
>
>Specifically, look at arch/x86/kernel/traps.h:decode_bug(), UBSan uses
>UD1 /0, I would suggest KASAN to use UD1 /1.

Okay, that sounds great, I'll change it in this patchset and write the LLVM
patch later.

-- 
Kind regards
Maciej Wieczór-Retman

