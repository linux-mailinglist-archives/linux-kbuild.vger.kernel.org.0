Return-Path: <linux-kbuild+bounces-9189-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BA6BE14D7
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 04:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 147BE540F7C
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 02:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89E6213E9F;
	Thu, 16 Oct 2025 02:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFA+fBbB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FC11DB377;
	Thu, 16 Oct 2025 02:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760582333; cv=fail; b=PwYFWquiGz/fJRE8/6DyAWO5Sh6fXTd6udZZajAWin1G78sfmZ38G98xgS6CEx5gCeYv2rhN7WVZFFfp4T9fynSh53zCms7xQ9KcE9N21F/SX+XJRyzBQv5t8jEwQz7IYBrTrhsurXvXJ9xrJ2FxFcV8q7wCJsJFkcVT0ZN25Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760582333; c=relaxed/simple;
	bh=aNv02BhY8Q0UWlsK3c5hBl4lN+OqtHoS91ATp9+qbf8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M/yM4t0eZ3yG+nUWLngYRcWIK/S2c32tSpM9i+CyDJ/AtoKnHeCbBNYBnCb8hxeCQ44X/W1HaOEoSXDo8dH6XKxJMLDUTE6LEYSGmIQrrQ8wqMxIDRTpieTUY3I9I6ltc5OBWxS9J6e9iCeZeIfQbn/80jdzy0IEoph4bQEeBm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFA+fBbB; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760582330; x=1792118330;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=aNv02BhY8Q0UWlsK3c5hBl4lN+OqtHoS91ATp9+qbf8=;
  b=aFA+fBbBpNa/KehhnhN6Je/Az5/W3E4QFSHERJkTSEQghPhNokpULGDU
   v4W83VhYnNdMWtEklaxHGICJ4wyeyrfLHq3Tt84PgbnG3NZ40cPNK2d8k
   lxyKXn8tvIOGbc7dvQKST1symN+3raitO6m7Jo0pwMquq/vMAIfZSDSUL
   9+hTbPqtDOPXb0HibM1LfAjQLfAgJLYrvwSc0RFGtJFnRkAyE7JlwzZpz
   fe5kmPE6cCKlUlPqEneDed3vfTuewWFn7gVAZMVPnZwkLQJzuznxwwy8x
   A66IX0nqhYtEAX4NEpQnMVeQVvyX/qunf2ShrTOZ1Owup8KStviyLl7xU
   w==;
X-CSE-ConnectionGUID: dCEyAH19RwCbPKz77R5SyA==
X-CSE-MsgGUID: 64dRgWmwQFSjGaOd6I7bMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62676571"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62676571"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 19:38:49 -0700
X-CSE-ConnectionGUID: 371jSSRbSGWs76Biq7Ebgg==
X-CSE-MsgGUID: cQIigXRyRVGosvJkI5a6VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="183123532"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 19:38:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 19:38:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 19:38:47 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.15)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 19:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waZLjx+jxhcMf1Q4pEUcI5g1AR4XHDQCVV5DkPLFsEA27gMFIetez5jk+XWUDhiVlYWwxoE/Yww9DQqzjKsspzLr7Z/Ui4ZjF+mcffVqGgsYa7vjupaGCp+7TW2HJQLNnuLesbQn0yX3JATaYXE0cvmYtSN5LOJtA8L51jjXpvFYyq+qMoHwDKGH+V98vn3J/NYmsJuW1+b2J935kSd5zLwABSCJ2qx4f5YTMXGHLDW5r0rEzaeROh5yTR53lfQ5Hni2d4XcGEWNvcEpsTY4bt2KgbGPUdT1CMF/EkDef/V89iQ9KE3GDiXGYxkdfnXZGdLfWi49MVpa4mq8m/RVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeI38cWIAnM85WjjALgwtN1c9G30Jd9F4uAv+R/2JxU=;
 b=qqDw9EZDLayN9CeqRPBiRDe3BjT+3vvfApjS5QMuAD+Jal+0PWfJZYUyBDZfVfi1RD8HLOy20Vf94Q1st2DGCUC/3Nq3XFSMsNUVJ+wD3ckSAeX2aDEh5IbmSrwCEFhqzCxbhM3660EuHKAKyp2Fsc63EafEyBNDgJd3ikzUbZ4LmeHrZmggZcJDx/OxCrA/Gyse3Ihwd2dAS+BNxMo6KFOb29kDW/jmHsOa0mEK0+lrQp1Cgq950ChKWsq+aw77y0srKfQ0BRALk5sDGG6KV5B7i9q6XBMcAS/LuW51x8r6U3HBf5xY3Tuz5aJVTZ/7RLRNLRaxpVaplbvqtnf6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SA1PR11MB8858.namprd11.prod.outlook.com (2603:10b6:806:46a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Thu, 16 Oct
 2025 02:38:39 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 02:38:39 +0000
Date: Thu, 16 Oct 2025 10:38:25 +0800
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
Subject: Re: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <aPBaof4moOnOgI1A@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014191156.3836703-3-xur@google.com>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SA1PR11MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: ba893988-72d9-4d21-ed1c-08de0c5d1ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gDhG/17CXdg7Cxfvj3jui8RHR/C2OeJSKd5fH+UNbNji6pqG2ZcG+7eYJeG3?=
 =?us-ascii?Q?R0nEbfm/atIi8gbGvwhWe1R4OEeGTUmatUj+2jNRMrQFwOcnWlhsVNPpVhyl?=
 =?us-ascii?Q?kVqOWufkAvAdnXVCxt1voh9W10ffrzVHIS3U2tyfrCL/K10EjOOqKvDTRrYW?=
 =?us-ascii?Q?d23et4crNPMobtGWz29ltxIhjTYzB904A35ovpir62I+t6vXaiFBpRAsbtAF?=
 =?us-ascii?Q?8Zi4raOi8sWypa6gSnvPZSjdySust31ZEBB4ut/hrwn0K2sKi9uXfqIaKd+J?=
 =?us-ascii?Q?mevDiBj68WVWcytvQFVqm/uoD5bU5x6eFQ7073+5GYjR8hJze5TPtqzFfQue?=
 =?us-ascii?Q?7bkD+VN4xvuOSOrW3/zh6wHoLJ0RyRXLMRYHiBZ98+Y65Uv4noskfNKH6Wpq?=
 =?us-ascii?Q?3s+uDRaPjX1/rqwKJliWDzXlXjqoOy0wseB5mtkzAfTs6orlalzdtfYuHqhp?=
 =?us-ascii?Q?+iH7PW8J7wZx+4djCrSeAnX+OFrWqHTZBXsxwLSWlMUaQzdyxI5eHchNW3nQ?=
 =?us-ascii?Q?i/gjaG3/zO09+2zu5lvitVy0X//8/c1SISW8RDltRVTmUF83bEM2MmVYHKCK?=
 =?us-ascii?Q?BXLfmnappif4i+cVQe73+7Te7NmizG5OeV5pnLaGtG2xoF06oayOds57Aaiz?=
 =?us-ascii?Q?PPoBx77TKkTQHonJwSVmcQ8MIbDmmDMWsBRwWXsU/9JmqW1PwFGcx5icbgyn?=
 =?us-ascii?Q?OT0UMF7teY22ytgJ+1x2O2/DrbWwQEBF5K3fFdMfPVNlAX2zdG7HBxh47lIj?=
 =?us-ascii?Q?ai3c/Avbj4DUr9NpevbrKUUY1RBjed/ggV6pEgSwSnCwWBwLMViII9fFVYV3?=
 =?us-ascii?Q?W7DaSYZZkk1Rz4JERHjJTlhhyNrDJmvojHN0BNjnZ1lUDzFHhQYIekqaW73T?=
 =?us-ascii?Q?+mIwPEblbWMCvrXFWQSAh5bDcZfa4Jk5QMmiJkWfyBpu4K0BTVb496gXxNAi?=
 =?us-ascii?Q?3UfGw8TapfT2fEU0enhlA1IseXXDgKWewvU2oMksZkyyQF7oP7jb170ZDLt+?=
 =?us-ascii?Q?toKmHsjwuHj8Sig1SO4n0YZADkrhMdprMjtJZ6e5lp0chwApL5LRGshEyTLs?=
 =?us-ascii?Q?BOK1Jol6MU+bTSNPuWUx0mpb1IdKyS4D3c6y0Sdyx/fBKfOJdLpmvMsi98zN?=
 =?us-ascii?Q?KoBybc2/MXN3Vh2Np727s/S4TLfzMvm5JUCnhIApQ6GYko2CzoftBN/Ys/NQ?=
 =?us-ascii?Q?W+ukkO8PPHrevmJkEwf43pMhwmsrbVUEVBxZkZzZ2sR9v9r+deJrtw0PwDrV?=
 =?us-ascii?Q?W2zbmjAjYbYx9m6hMg2F4x4HW6WBtWul7y7iF2jnU5mQeXcuZgApe0YThOcN?=
 =?us-ascii?Q?HuslAsn3GBENqo72txAlRGuVxlX8E2smTmQmshAdPLrhgGtw0zee3dhwkCdf?=
 =?us-ascii?Q?m69C9DvTl5CnRgej5ra9SGBAmfjqIr/kx9XomxA1mHvWTPBgfHbyhpyWs6Y4?=
 =?us-ascii?Q?86MWb8riF8NO2ADLKr39sjbctP7sMV+N2kvVqzRE8So8ee90Z7xXwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dz1cxnN/z69/l8UdFP6nK2TsO6byg3V7OsWoXxKSd4R+fAP24wuuR8lfdclN?=
 =?us-ascii?Q?KEqWeTaP8X6aC6sUrrj5gPh0F6j/8H/aOTo7u+26ZskFA6uj/Ru79gYRQqtc?=
 =?us-ascii?Q?V2I3ANBhTJRz+8SMD/G8FmpFOA8fvrvfITW95ibaPJ6tJZbz+4+zCpqHsg5P?=
 =?us-ascii?Q?kUIviEPbP6QpP29IFF7F74xBxxqodi1bFbsermsjK/pGafwPw5IQydnj8TyL?=
 =?us-ascii?Q?nWG/h6gugi/+Gjg01DYWkDfE1X+5khL4849J0sMqLVz2LQbMG2+qZ1YXP01i?=
 =?us-ascii?Q?nbyAs7WPgdvkNvQmXlEkn7+Km3hj68jZHecBRTpPdVoMVNYdL33johccUTpC?=
 =?us-ascii?Q?VYzwoozIN6YcmyjTkC8M0Jnr0vT3MDCrw3+lUf1YnRjUTDTH1yT2t8W9ISP8?=
 =?us-ascii?Q?l3kFJ42N22XG1vgdCp9Jf5c+79DIXIOfhHKE0Ui+GSZUFq8xrGKUSrBLsynl?=
 =?us-ascii?Q?Id/vPnTfEdEv265xiByByJj7mppAf/wMoNftyj4adjKg+LeziXV5trYUkBDi?=
 =?us-ascii?Q?CWB7wFead+PrE32O/cpiNWO+1MYReY+SgQ35S4pqTvCrhhdMnukw8KCU+Uxo?=
 =?us-ascii?Q?vmvgYL9ZKbWioIvHtucKCKrJE2NCCGbWJshfMzA2n/oe5GQ4vZKr/Gwy78gI?=
 =?us-ascii?Q?1UJNgVk+VEdGIFh+gJ/1r1AbZjmgmV8FF/T77vgsHSqtWu0ZHM/Zn/NaNXlH?=
 =?us-ascii?Q?5R04kWXEc4vNchSlbThmb8IV54GgkSL6bLmrPO9PUxzVAMe3iXGu7NHSTxvu?=
 =?us-ascii?Q?czxRqT3aD8Uft3FpDWOEe83uLsCEirNV+QCEILNucP8lo0MgyWHAMwzrJQlP?=
 =?us-ascii?Q?ZKYAbwf9BWeMPCSxcMA5cAY1r3WVIcW3CPqgp8U1AgtVxmYbyKyMYHUOvwr/?=
 =?us-ascii?Q?KwfDN0kkXay0ZzbB1QbasI1p9jpd564zgLPBFa4rnXAD9EwZU58eS3Wvhflz?=
 =?us-ascii?Q?WN0tMFfLmgFS6ttBLFLm/EMjRvr93bm+zlmK1iYVwemo/kTX4b33BbZQECLj?=
 =?us-ascii?Q?qOvG5awkNS59KJb/31KyYUfckheHts7VUOEmvxMlLVQTDGUYqs+b8A+gijOu?=
 =?us-ascii?Q?zqlEAfweReJ7PLhxK3y7YGIcUD08b0KuiyVBWMuuv5J4Xkt+n+U8TwqYPPHZ?=
 =?us-ascii?Q?mdZFxby7FpCDfkSWdVuOzB74HpRbdUmz/KwTwABB7WO0YamYniXq31E++47d?=
 =?us-ascii?Q?3DX0Er1XQvm6mNm4sZQsMz8PdMqEorWYXDDXxgioKjJDnFXrffpAVvLQFJ/W?=
 =?us-ascii?Q?xpIHBdXiGrBr/UwbqZUaIF31FfcCTgI9L7P/fpEfWIHYyhSWQAabg5XQIpvb?=
 =?us-ascii?Q?dAe9Ek+EZP3LuADIIawaD3kSIcWO3dH83PLxRLtSlEqN0lg3Xrm9Nas9cykK?=
 =?us-ascii?Q?QfWvMY0IMzjO8dIjz2YgfWBH1VyrUnr1AX9zz3mYMHKgq9XFjJ0aZgruUDOS?=
 =?us-ascii?Q?te4dmGbtw7Y4lJsmwVDUDDW3Xwc6hiDW9pZipZXsHCnA4RmC/zEFm8Skme7z?=
 =?us-ascii?Q?iiXbwyVjEweGl0wpuxRpS23NDRF1qA8eDhUR3xjjZS079vkIcGHUe0exo1VG?=
 =?us-ascii?Q?coY59WpyMcLsPSJLJlsv3HOJ8PH+O7w6HtoLDLlbxBSS/hPwf6EBllHWimit?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba893988-72d9-4d21-ed1c-08de0c5d1ca3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 02:38:38.9430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdEfsZriodMo3kwHRik0z3QOCrzTlWt9KYUff3MUdZ12RYaAn7F9tDA8hh+3JApFHng9u4ffQO1cXI+mPAQq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8858
X-OriginatorOrg: intel.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9b332cece987ee1790b2ed4c989e28162fa47860]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-Fix-Propeller-flags/20251015-031420
base:   9b332cece987ee1790b2ed4c989e28162fa47860
patch link:    https://lore.kernel.org/r/20251014191156.3836703-3-xur%40google.com
patch subject: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: powerpc-adder875_defconfig (https://download.01.org/0day-ci/archive/20251016/202510160643.8sg6iGo3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160643.8sg6iGo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510160643.8sg6iGo3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.head.text' from `arch/powerpc/kernel/head_8xx.o' being placed in section `.head.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/main.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/main.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/main.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `init/main.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.ref.text' from `init/main.o' being placed in section `.ref.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/main.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `init/main.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `init/main.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/main.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `init/main.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/main.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `init/main.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `__param' from `init/main.o' being placed in section `__param'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/version.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/version.o' being placed in section `.rodata.str1.4'
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
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/irq.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/irq.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/irq.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/kernel/irq.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/irq.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.static_call_sites' from `arch/powerpc/kernel/irq.o' being placed in section `.static_call_sites'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/align.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/align.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/align.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/align.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/align.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/signal_32.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/signal_32.o' being placed in section `__mmu_ftr_fixup'
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
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/process.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/process.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/process.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/process.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/process.o' being placed in section `__mmu_ftr_fixup'
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
>> powerpc-linux-ld: warning: orphan section `.initcall6.init' from `arch/powerpc/kernel/time.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/prom.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/prom.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/prom.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/prom.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/prom.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/prom.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/prom.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/prom.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/traps.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/traps.o' being placed in section `__mmu_ftr_fixup'
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
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/udbg.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/udbg.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/misc.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/io.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/io.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/misc_32.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/misc_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/prom_parse.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/hw_breakpoint_constraints.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/hw_breakpoint_constraints.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/hw_breakpoint_constraints.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/interrupt.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/interrupt.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/syscall.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/syscall.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__bug_table'
>> powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/ptrace/ptrace-noadv.o' being placed in section `__ftr_alt_97'
>> powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/ptrace/ptrace-noadv.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/ptrace/ptrace-noadv.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/vdso32_wrapper.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/proc_powerpc.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/proc_powerpc.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall1.init' from `arch/powerpc/kernel/proc_powerpc.o' being placed in section `.initcall1.init'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/entry_32.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/entry_32.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/entry_32.o' being placed in section `__ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/setup_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/setup_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/setup_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/setup_32.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/setup_32.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/setup_32.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/setup_32.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/kernel/setup_32.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/early_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/static_call.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/static_call.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/static_call.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/iomap.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/iomap.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/fault.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/mm/fault.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/fault.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/mem.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/mem.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/mem.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/mem.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.bss..page_aligned' from `arch/powerpc/mm/mem.o' being placed in section `.bss..page_aligned'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/mem.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/mm/mem.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/mm/mem.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/pgtable.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pgtable.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pgtable.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.bss..page_aligned' from `arch/powerpc/mm/pgtable.o' being placed in section `.bss..page_aligned'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/pgtable.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pageattr.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pageattr.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/init_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/init_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.ref.text' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.ref.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pgtable_32.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..page_aligned' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.data..page_aligned'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pgtable-frag.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pgtable-frag.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/ioremap.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/ioremap.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/ioremap.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/ioremap.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/ioremap_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/ioremap_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/ioremap_32.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/init-common.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/init-common.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/init-common.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/init-common.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/mm/init-common.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/init-common.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/mm/init-common.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/mm/init-common.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/drmem.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/mm/drmem.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/drmem.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `arch/powerpc/mm/drmem.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/cacheflush.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/cacheflush.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/cacheflush.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/cacheflush.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/nohash/mmu_context.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/nohash/mmu_context.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/nohash/mmu_context.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/nohash/tlb.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/nohash/tlb.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/nohash/tlb.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/nohash/kup.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/mm/nohash/kup.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/mm/nohash/kup.o' being placed in section `__mmu_ftr_fixup'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.ref.text' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.ref.text'
>> powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `__bug_table'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.init.data'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/hugetlbpage.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/hugetlbpage.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/mm/hugetlbpage.o' being placed in section `.initcall3.init'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/dma-noncoherent.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/dma-noncoherent.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/lib/code-patching.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/lib/code-patching.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/code-patching.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/lib/code-patching.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `arch/powerpc/lib/code-patching.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/lib/code-patching.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/lib/feature-fixups.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/pmem.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/lib/pmem.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/lib/pmem.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/lib/pmem.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/string.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/memcmp_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/strlen_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/copy_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/copy_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/checksum_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/checksum_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/lib/checksum_wrappers.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/lib/checksum_wrappers.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/string_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/string_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/sstep.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/lib/sstep.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/lib/sstep.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/sstep.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/lib/sstep.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/lib/sstep.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/lib/sstep.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/sysdev/fsl_soc.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/sysdev/fsl_soc.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/sysdev/fsl_soc.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/sysdev/fsl_mpic_err.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/sysdev/fsl_mpic_err.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/sysdev/fsl_mpic_err.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/sysdev/cpm_common.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/sysdev/cpm_common.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/sysdev/cpm_common.o' being placed in section `.initcall4.init'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/m8xx_setup.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/platforms/8xx/m8xx_setup.o' being placed in section `.text.unlikely'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/m8xx_setup.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/machine_check.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/platforms/8xx/machine_check.o' being placed in section `.text.unlikely'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/pic.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/pic.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.machine.desc' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.machine.desc'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/fork.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/fork.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/fork.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/fork.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/fork.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/fork.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `kernel/fork.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/fork.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.data..cacheline_aligned' from `kernel/fork.o' being placed in section `.data..cacheline_aligned'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/fork.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/fork.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/fork.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/fork.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `kernel/fork.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/exec_domain.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/exec_domain.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `kernel/exec_domain.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/panic.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/panic.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/panic.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/panic.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/panic.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.noinstr.text' from `kernel/panic.o' being placed in section `.noinstr.text'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/panic.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/panic.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/panic.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `kernel/panic.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/panic.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/panic.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/panic.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `kernel/panic.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `kernel/panic.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `__param' from `kernel/panic.o' being placed in section `__param'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/cpu.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/cpu.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/cpu.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/cpu.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/cpu.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/cpu.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `kernel/cpu.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `kernel/cpu.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/cpu.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/cpu.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/cpu.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/exit.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/exit.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/exit.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/exit.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/exit.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/exit.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/exit.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `kernel/exit.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/exit.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `kernel/exit.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/softirq.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/softirq.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/softirq.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/softirq.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.softirqentry.text' from `kernel/softirq.o' being placed in section `.softirqentry.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/softirq.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/softirq.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcallearly.init' from `kernel/softirq.o' being placed in section `.initcallearly.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/resource.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/resource.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/resource.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/resource.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/resource.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/resource.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/resource.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall5.init' from `kernel/resource.o' being placed in section `.initcall5.init'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `kernel/resource.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/sysctl.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/sysctl.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/sysctl.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/sysctl.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/sysctl.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/sysctl.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/capability.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/capability.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/capability.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/capability.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/capability.o' being placed in section `__mmu_ftr_fixup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


