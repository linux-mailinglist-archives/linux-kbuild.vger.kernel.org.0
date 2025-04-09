Return-Path: <linux-kbuild+bounces-6540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA76A82919
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 17:00:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE99178F79
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 14:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0E426E15B;
	Wed,  9 Apr 2025 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewEuy+Pn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3237B267381;
	Wed,  9 Apr 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210189; cv=fail; b=PrpS6DeGlm67M8yNcrlyD8y42pQXUd4JZITml9oh9LCyeKpdke9ytQeDlx+Bv1Acixq2nQkHd0ZvA/c1XKkGdE7Vo/OxhqDK/r/zu1GA1yOGbaPUag2NvBW4utVrgUPEYDGxJiJy+JRAR7We1eL/9tv+h0bW/lBWxrDiG64YHRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210189; c=relaxed/simple;
	bh=2jEOSg+5YCjvgmfMeEh/tK2w2NmxGdSnnNSS5YqpaOQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XXBfRlz6P6JYbt7Yk1v+DkLYtzJHdztZ1tx89DsCrkWIlbOR60aYNWUiAGtyJinTf1lE+6JAyvnwt9VbZ1jrZUe0AtIhPnng6L4oYjF771i+jO5/iZk1RhHbv7z4L6n7WMOY9Y3rrm2QaQARocrfJmnPkz7DaneUrVwWYASRopc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewEuy+Pn; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744210186; x=1775746186;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=2jEOSg+5YCjvgmfMeEh/tK2w2NmxGdSnnNSS5YqpaOQ=;
  b=ewEuy+PnrQGs9U9evBVkA+HgTsIMmfuqljkUgWqBD2LIV6RXhHEYhH4V
   RjrboStBRYgS6DSf6JyGDy0USkCSHuKw5fmf5RiT+ZZBHwqKGeBT99itG
   ZK/uGH0KFIhaeCMg3Q87N9eAIQaxgcLOTOMMg+2Pm3GIu25zGOVKllVn2
   b9lLQvXW8TCX7C7IHx+NU662H+fFn1LwpcpfSQrMPiTQxij+HpEn1DZR8
   IS7Pz+KRsXrRVePi867q4hLqPqcDuD71bmxtqGFqHPiQtNobIpnM73v2s
   r3iHs7aSghLxZ/qrFhNORnMAznP9I5MQnWWXNotvflGHUXHAz+3lb4kHM
   Q==;
X-CSE-ConnectionGUID: 64zot+yNTXKjqfqvhG6ksQ==
X-CSE-MsgGUID: bl9dWC5UQ+qE5J/PP9FY5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="33296493"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="33296493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:49:45 -0700
X-CSE-ConnectionGUID: u5odJqvvRgeBIOQHgKQwKQ==
X-CSE-MsgGUID: T5RBdYERQW+b4byDn7WdWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="159583328"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 07:49:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 07:49:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 07:49:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 07:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx2hpfYSGWugqdX+bKg741aN6wueI/M0U314uzCqAc7QE9kBFHDDFtHPqnETLxYSw5ObuQXWHU/E2oFpsKhETDWbbP7dS8qsGeoaG/3FXyj+Zk0bDtXUA2/GFRsg5g7qhxt1RdqCvjvRg6012QrC1uyxRbSobAG+NwH4AJjYg5cwphWEj46TwyxWXQ6iNjZMQ1SFb43eMbDtkPJO2ZMfJzE9sUisgdk5G5LuDn03AcsnGov1FSRkRfUdb9FEXwbjd8rjsMLtyDrO/IO5gdzYFwFXECwFQT5b1qZ5WMok/+qABjEqoKDHWMpgjcETcMLkaNmoM75JXJKKCLkWURnlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzG3cYdBwO72PLSDMRXLfAigdevmFWr/6L+gdLn8tDY=;
 b=DUfveKKgzqGTH6hzXxgmdPY5SiV4UY6a0ISju+TDG58cIq20Wq63e8FrUuZZUs/aHSGcHARwhaENo23XbyXw/xG3sNb9RPidtf3f7xF/s5VnE2IJpt6yWBLibNO/1bfxNgP2Kece8Co40cgfY3mJXe1sbvEQkema6kbpxIFid+sKUP0o4wfIIDtLujenp9me5sA6bNahgkrozcx9wwk/SttU53Lt/kmcVtc0imJtVzLV3X7olU+PHUM/nRF3u/3Kb+qSQE72tC97ke00RBMn3p/Jqyhi31h0L4yMO19VZmZ8NC3ZrgUTWjMRmHhdfi9B5L29iuc2Li2z7B+YRYcIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 14:49:11 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 14:49:11 +0000
Date: Wed, 9 Apr 2025 16:48:58 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: <hpa@zytor.com>, <hch@infradead.org>, <nick.desaulniers+lkml@gmail.com>,
	<kuan-ying.lee@canonical.com>, <masahiroy@kernel.org>,
	<samuel.holland@sifive.com>, <mingo@redhat.com>, <corbet@lwn.net>,
	<ryabinin.a.a@gmail.com>, <guoweikang.kernel@gmail.com>,
	<jpoimboe@kernel.org>, <ardb@kernel.org>, <vincenzo.frascino@arm.com>,
	<glider@google.com>, <kirill.shutemov@linux.intel.com>, <apopple@nvidia.com>,
	<samitolvanen@google.com>, <kaleshsingh@google.com>, <jgross@suse.com>,
	<andreyknvl@gmail.com>, <scott@os.amperecomputing.com>,
	<tony.luck@intel.com>, <dvyukov@google.com>, <pasha.tatashin@soleen.com>,
	<ziy@nvidia.com>, <broonie@kernel.org>, <gatlin.newhouse@gmail.com>,
	<jackmanb@google.com>, <wangkefeng.wang@huawei.com>,
	<thiago.bauermann@linaro.org>, <tglx@linutronix.de>, <kees@kernel.org>,
	<akpm@linux-foundation.org>, <jason.andryuk@amd.com>, <snovitoll@gmail.com>,
	<xin@zytor.com>, <jan.kiszka@siemens.com>, <bp@alien8.de>, <rppt@kernel.org>,
	<peterz@infradead.org>, <pankaj.gupta@amd.com>, <thuth@redhat.com>,
	<andriy.shevchenko@linux.intel.com>, <joel.granados@kernel.org>,
	<kbingham@kernel.org>, <nicolas@fjasle.eu>, <mark.rutland@arm.com>,
	<surenb@google.com>, <catalin.marinas@arm.com>, <morbo@google.com>,
	<justinstitt@google.com>, <ubizjak@gmail.com>, <jhubbard@nvidia.com>,
	<urezki@gmail.com>, <dave.hansen@linux.intel.com>, <bhe@redhat.com>,
	<luto@kernel.org>, <baohua@kernel.org>, <nathan@kernel.org>,
	<will@kernel.org>, <brgerst@gmail.com>, <llvm@lists.linux.dev>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>
Subject: Re: [PATCH v3 11/14] x86: Handle int3 for inline KASAN reports
Message-ID: <tqlfdijmks6fjcqvfkl75u7dt2ysjak5uqvyco2h6c3qwldcx4@2xuqtek33vaj>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <012c84049b853d6853a7d6c887ce0c2323bcd80a.1743772053.git.maciej.wieczor-retman@intel.com>
 <c797714b-4180-4439-8a02-3cfacd42dafe@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c797714b-4180-4439-8a02-3cfacd42dafe@intel.com>
X-ClientProxiedBy: DUZPR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::12) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 704d1a6b-4b64-4316-ec9f-08dd7775b04f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8vRvKgG1umdUecJDh7V3c9yquLeFZ0tWoCVRHmT9pAAvXgWwadOH7b5BPT?=
 =?iso-8859-1?Q?t/h6mcAf3vd8wHMgQRn5ty/JUIN6CpgHVVAoS5k1RiA+zK60otScWzRZge?=
 =?iso-8859-1?Q?dQSivIdxl2FbVVdXVEbioTq6D2g7OlhHefS6azMQmuSb9w4MWg08OIfbVc?=
 =?iso-8859-1?Q?FTd7vhrt26trUf0+fazlYtW7+vCP0k/jZc91yXCuPlmF0CSJu5rlIhnc6u?=
 =?iso-8859-1?Q?VEVq0qHMH9Tyw3wGh84zLzPw7j8/KVklb2F0ycRyrx3cN4PfG0CH4H/Hzg?=
 =?iso-8859-1?Q?WswIUpHQnWjLPxdFfE/60nAy9bbulM/3g90dT4fpTK0vZV0TMB20UEi3Pm?=
 =?iso-8859-1?Q?jiYRMDZRr+qxCjmLtUIJgr96yUgvrmMeFbODrUfBeQE3+FqPhFi8m4mn9j?=
 =?iso-8859-1?Q?7ImGwqeXdfvV9A3Nu2ZxQ6nD/sfJ1XRFif7t1uD4SzXhy4rEbJhPY8r9cz?=
 =?iso-8859-1?Q?l1Uy8BnpHguXe4x2gMZ9vQwXhpJw5oGEHiGc5jJ85mfnOl0+ZiEs1s/CP1?=
 =?iso-8859-1?Q?WOLQxnIyGERphVgNgMtDvZA2HqAvu8HjkplCU+7C5FDBrw7t8tbuNXwBmJ?=
 =?iso-8859-1?Q?ZoU/OZFJtbROJ86Fhst9hbUsajbu1o2Mrmd874iRkXrthzZG7a5zVlNtAo?=
 =?iso-8859-1?Q?LXQoI61zKtv+x3/2EBgJnp8Q3FsIr2hjbIytCKwv3UTk7CyGNVd7sX11cU?=
 =?iso-8859-1?Q?u/O1PSqWmbHxa08a6t0jg80x8jmWlDuWLIUzL5GEHtwSvyfdkYutzC9I+6?=
 =?iso-8859-1?Q?UvxN1MicZK98Qrlp3qKjrNchIfYyg2ug4k8ZYqKhHoOrHs+oGn/tKaB04V?=
 =?iso-8859-1?Q?4DZF5LHl9r5ZxBSDQBYIqSox3by/x+ingA5qqJwCV9UW67wb9cTRLRzRXB?=
 =?iso-8859-1?Q?Eg8F5zTgYEyif+ElS6yTakTXwrKYX0ajZ0g+6vPeC0f1HIUNBom7mutHAN?=
 =?iso-8859-1?Q?jwl26NOuYXNMqhxqHC58seCinEsDoA3jrlCjkEZ4s9VJh0lasQwidCv8PB?=
 =?iso-8859-1?Q?P+x+ndUy4MXCW7qfD5+/qXOmkCCL7xHQzkIGcumq7BpSsLASB6v/mIsV9G?=
 =?iso-8859-1?Q?qytO8LGOXKfErLbGWXNtW6x/736DE2dRfQn3Bpdg+usCECARe0olJWTRC7?=
 =?iso-8859-1?Q?mVtSYC6aMZO0iuhi/oXiM+DP5iP65RslSEFl6eucA0/IYeCpG3fnGsLVXj?=
 =?iso-8859-1?Q?9f876Qr63b1k8xm4tL1r+VK0M7cxFrH2PIjstpJlYIz+WqqKukUHqBuMv5?=
 =?iso-8859-1?Q?gVpusHS1gzt/pR9sXuvRoXzBLg9Q0JN4ZPbFuxWBYZh9JpeAkdzlkmmQ8i?=
 =?iso-8859-1?Q?5G9xWjEYTHPyvRGFPI8SdoOf2K2N0Qn4l0+hw2J3snkT4ECboeAIHBgo8+?=
 =?iso-8859-1?Q?LjFvse0uZviplxE8aKghm0lT6ZUz4i4DFo1H0hiw4awNyN9Wu9hN8chjc/?=
 =?iso-8859-1?Q?FgBv/fA73tIHIDEkFF6Pm43dvZDHu89eiaAwhRYVF8vambH/pOFWRELb/O?=
 =?iso-8859-1?Q?U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8DTpMCOxKcC9zCHyOQn9sBmRqRE9gi+cQ+yWG6XoacgjQKckzdhxwkt1Ze?=
 =?iso-8859-1?Q?+bstmi4qBJzHALSC3/Zby88Q2blz2ehMozYkDB/ipvRWgOpZjx2cKapGtQ?=
 =?iso-8859-1?Q?YlLqLN8SM/1KBooD7PrBGF7TuJijs0IZYx5MpTdocR2oZd9z70FS0/AoOD?=
 =?iso-8859-1?Q?U+rpTNFZx6ODOvVvt2Mjxh8/Pinu3KpCC5nDIjfEeB540GCoBQ4p+kGAKF?=
 =?iso-8859-1?Q?uHx3QoiWTQ3aR1uUJ9i4SQ5sHkuVNYowMfOWTapb78xV6JrZjeRf54Mdct?=
 =?iso-8859-1?Q?QP2Umxx6SvjERNTuUIjDihRcbheFiDCg3Zh6/FIQOU+iMzk7P8awlxZGTk?=
 =?iso-8859-1?Q?O7iIGBQCpBeiSDU/vQ7UfRmUDS0KVd3RsAwz7hwgHScta6027uELZV3oO0?=
 =?iso-8859-1?Q?/ft9y61mFKykUh8b7en1bbLjiF1y9VpbG/hgw0NhpH1v+iyiklExuDn9do?=
 =?iso-8859-1?Q?TM40uJ/ilQyPqfSgbi2CaQf3ZLZHrmFD7UeoH1B+vJFn62JXLHd1og50QY?=
 =?iso-8859-1?Q?ab/shhP7hT0L5X0ZIb2ht113T0Pr2WaJxGIDsPzWs7ajy7Tlg/uS4EzmuB?=
 =?iso-8859-1?Q?evWdW0yil5T4l4UQrmvrAPXv8kEbH+eKjukGeEsnh3vrW1DOAYGbitYKZ9?=
 =?iso-8859-1?Q?PciKcq6vM9gTIlqLX+r+j2IukaxpI9kIBBIUSWVhs6UZKZxBVRHPUy3cfB?=
 =?iso-8859-1?Q?c+2QZPm7B+S8xk/Z0RoKQee1JuYhT/enCG15x2IA+4h5ltv9PhYSYezjjN?=
 =?iso-8859-1?Q?EQh+jzrzOhAV0JGj0vEvc14rY333HFVwLzApdz3bEnA9YUhLcjeGniDdad?=
 =?iso-8859-1?Q?QHYiFiD1xluy0k2DOWkZxaRMCFbqWgnDjavzTizZVRNXanlQY35usvBqKr?=
 =?iso-8859-1?Q?ZvX0O4KWhuV6DHC0QGWy3Qtlq8zqEMX+iba5FaY7BRfGN6NFUFm4JLq+Ro?=
 =?iso-8859-1?Q?0BfFoGTKSDxTY9x3HfCKWO8PhALmpRfH/7i2h8FhSk5tx+6JLvz2RDmBCr?=
 =?iso-8859-1?Q?5gxdt+cYZa24TJKFdaE7iU79IppEZn7U5sZ8P25aptRJZTpxIXB7xe4pNE?=
 =?iso-8859-1?Q?6uR8ind0d6DGuvVmlDgh0rYdC7bpBArhRYFbCyCz8dXAZDKqIxbTg4gLyw?=
 =?iso-8859-1?Q?3PnreJM6Y894XeP8/SfGk9AKRGWVBhkBp2GNH0bUz+7bUBYP7ivYeOsN0j?=
 =?iso-8859-1?Q?csEEzfnDqTe/5k6A6and5Khx/HCOz2GNxbklxz22UQn2QZSbb+8MDtrFGr?=
 =?iso-8859-1?Q?5bT2IZ0ASVN1BsEMd5jl/EQBsHzNcOudYhuZUABl1U+KUHfDEF6Cippg7t?=
 =?iso-8859-1?Q?hd3GTrNbos42kux8eRs4fmzefMwaQZnD9zLQ2HbsKzUYd26c+DhxLuLXJT?=
 =?iso-8859-1?Q?cbwXgWoLTvhXMK7AVnIg2T+Lllpyv9pu0uULsk86R6YKb7flFtVjVvNqbt?=
 =?iso-8859-1?Q?GM62Gujd/2O6lYM7HR3CVgKUjHoeHwDOvD+dDvQodFjo9ezNUJ+sZOhBrn?=
 =?iso-8859-1?Q?+C06BZwVCSB0fIUfS9UBWa5GDZD4Vp/+e7pWJsbvtYJoFAfaXadcY/aJcA?=
 =?iso-8859-1?Q?GWkDTyT+hp6ICWfaobw9ro4d1NVYHSlt74im5TOB8nSDvuWB5eojhqWe/7?=
 =?iso-8859-1?Q?Xwvib7S0e2Uj+U+upuXVkLz08TUxApGMf6/I92OoduAC7P9WwbE1yhHCtx?=
 =?iso-8859-1?Q?Q6nuK98vtGOAusdBKk0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 704d1a6b-4b64-4316-ec9f-08dd7775b04f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 14:49:11.1393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElTqV2GOykO6W8MNVcTeIulNL2XFhe4QRmb72/uKGyEIgqpCWH1/m67aO6zSkAtwlOjSoD6d3L0w5ciimM7mB/pauAHeyEu5MfiVb+KQSNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
X-OriginatorOrg: intel.com

On 2025-04-04 at 10:55:09 -0700, Dave Hansen wrote:
>On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
>> When a tag mismatch happens in inline software tag-based KASAN on x86 an
>> int3 instruction is executed and needs proper handling.
>
>Does this mean "inline software"? Or "inline" functions? I'm not quite
>parsing that. I think it needs some more background.

Both software KASAN modes (generic and tag-based) have an inline and outline
variant. So I was referring to the inline mode in software tag-based mode. I'm
mentioning "software" since there is also the "hardware" mode.

>
>> Call kasan_report() from the int3 handler and pass down the proper
>> information from registers - RDI should contain the problematic address
>> and RAX other metadata.
>> 
>> Also early return from the int3 selftest if inline KASAN is enabled
>> since it will cause a kernel panic otherwise.
>...
>> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
>> index bf82c6f7d690..ba277a25b57f 100644
>> --- a/arch/x86/kernel/alternative.c
>> +++ b/arch/x86/kernel/alternative.c
>> @@ -1979,6 +1979,9 @@ static noinline void __init int3_selftest(void)
>>  	};
>>  	unsigned int val = 0;
>>  
>> +	if (IS_ENABLED(CONFIG_KASAN_INLINE))
>> +		return;
>
>Comments, please. This is a total non sequitur otherwise.

Sure, will add.

>
>>  	BUG_ON(register_die_notifier(&int3_exception_nb));
>>  
>>  	/*
>> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
>> index 9f88b8a78e50..32c81fc2d439 100644
>> --- a/arch/x86/kernel/traps.c
>> +++ b/arch/x86/kernel/traps.c
>...
>> @@ -849,6 +850,51 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
>>  	cond_local_irq_disable(regs);
>>  }
>>  
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +
>> +#define KASAN_RAX_RECOVER	0x20
>> +#define KASAN_RAX_WRITE	0x10
>> +#define KASAN_RAX_SIZE_MASK	0x0f
>> +#define KASAN_RAX_SIZE(rax)	(1 << ((rax) & KASAN_RAX_SIZE_MASK))
>
>This ABI _looks_ like it was conjured out out of thin air. I assume it's
>coming from the compiler. Any pointers to that ABI definition in or out
>of the kernel would be appreciated.

I'll put a comment that it's related to compilare ABI and I'll add a link to the
relevant compiler file in the patch message.

>
>> +static bool kasan_handler(struct pt_regs *regs)
>> +{
>> +	int metadata = regs->ax;
>> +	u64 addr = regs->di;
>> +	u64 pc = regs->ip;
>> +	bool recover = metadata & KASAN_RAX_RECOVER;
>> +	bool write = metadata & KASAN_RAX_WRITE;
>> +	size_t size = KASAN_RAX_SIZE(metadata);
>
>"metadata" is exactly the same length as "regs->ax", so it seems a
>little silly. Also, please use vertical alignment as a tool to make code
>more readable. Isn't this much more readable?
>
>	bool recover = regs->ax & KASAN_RAX_RECOVER;
>	bool write   = regs->ax & KASAN_RAX_WRITE;
>	size_t size  = KASAN_RAX_SIZE(regs->ax);
>	u64 addr     = regs->di;
>	u64 pc       = regs->ip;
>

Thanks, I'll apply this.

>> +	if (!IS_ENABLED(CONFIG_KASAN_INLINE))
>> +		return false;
>> +
>> +	if (user_mode(regs))
>> +		return false;
>> +
>> +	kasan_report((void *)addr, size, write, pc);
>> +
>> +	/*
>> +	 * The instrumentation allows to control whether we can proceed after
>> +	 * a crash was detected. This is done by passing the -recover flag to
>> +	 * the compiler. Disabling recovery allows to generate more compact
>> +	 * code.
>> +	 *
>> +	 * Unfortunately disabling recovery doesn't work for the kernel right
>> +	 * now. KASAN reporting is disabled in some contexts (for example when
>> +	 * the allocator accesses slab object metadata; this is controlled by
>> +	 * current->kasan_depth). All these accesses are detected by the tool,
>> +	 * even though the reports for them are not printed.
>> +	 *
>> +	 * This is something that might be fixed at some point in the future.
>> +	 */
>
>Can we please find a way to do this that doesn't copy and paste a rather
>verbose comment?
>
>What if we passed 'recover' into kasan_report() and had it do the die()?

If that doesn't conflict somehow with how the kasan_report() is envisioned to
work I think it's a good idea. Since risc-v will soon add this too I imagine? So
it'd be copied in three places.

>
>> +	if (!recover)
>> +		die("Oops - KASAN", regs, 0);
>> +	return true;
>> +}
>> +
>> +#endif
>> +
>>  static bool do_int3(struct pt_regs *regs)
>>  {
>>  	int res;
>> @@ -863,6 +909,12 @@ static bool do_int3(struct pt_regs *regs)
>>  	if (kprobe_int3_handler(regs))
>>  		return true;
>>  #endif
>> +
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +	if (kasan_handler(regs))
>> +		return true;
>> +#endif
>I won't get _too_ grumbly about ti since there's another culprit right
>above, but the "no #fidefs in .c files" rule still applies. The right
>way to do this is with a stub kasan_handler() in a header with the
>#ifdef in the header.
>
>Actually, ditto on the kasan_handler() #ifdef. I suspect it can go away
>too and be replaced with a IS_ENABLED(CONFIG_KASAN_SW_TAGS) check.

Okay, thanks for pointing it out, I'll add the stub and IS_ENABLED().

-- 
Kind regards
Maciej Wieczór-Retman

