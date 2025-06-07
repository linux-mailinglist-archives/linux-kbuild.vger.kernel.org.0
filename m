Return-Path: <linux-kbuild+bounces-7387-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C64B4AD0AAD
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 02:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D77B170E95
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 00:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85CACBA3D;
	Sat,  7 Jun 2025 00:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UfrpF+HP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3ED531;
	Sat,  7 Jun 2025 00:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749257198; cv=fail; b=uSzTUmP92MYfWJp8X10WUcPzZbMGpbU60fOdEKyxj35kt/RBZZLk4DQFp302jrmuGyl2rVbLFO9CfqdSRdvNSbb2pn4dnS4Hpy6kz2vOAuE6N1CR4i0qiJut4tRA0rRQpDjpSsQWmkgNrs8sl4QgEnHdE2DB/C0c6lwYHdBM0WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749257198; c=relaxed/simple;
	bh=DRdaLavkhIgxsbFLcJLhh9kaDhm15yxEJzux7yzim6s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YCC42bQQG8kfHIDRwqzcSl868j/r24xmftjkFhgrV41/+Wpz1K6bCm7viDeDCOx/2vHMMJsKkGqmmWcqNgTZVAb8MSeeSK/LCU51QsiWje+qFCE4qL5N3ngWcINCOLhaRBDrU3vzgp7UhOJbycThqQDG8TL0jBCbgdQ60M2V4OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UfrpF+HP; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749257195; x=1780793195;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=DRdaLavkhIgxsbFLcJLhh9kaDhm15yxEJzux7yzim6s=;
  b=UfrpF+HPZiE5+909jMUDYa+5tdJQBqMmktF4aOi3CSscaMyvnzhKJ9XS
   g+QdPFUUgqVzXmwJTujwFEACNnYQyApWd9aTveOkZ+ha93G8t+J5fhhmL
   xUdNZAhrGdui4LagIvcDF630kDTu2iueJz0qs937OraXM2y2xxF6oiDqC
   X7VccqyfgHATUKq44wLKRMTpCgslMxEFuExw6mbZJ5YR3lTd+I9AjyMSM
   lscSTWTiRWPVrfyuOIncXA1O3UOmeH13T0gaBVBKF9Am+UTAsDJicN4mF
   nUge0/smwQuqajKwp7tQ67slcZgTclUSnhdayRu1oL+8mbF7UvD4nZsul
   A==;
X-CSE-ConnectionGUID: bQK/d/+HRYOMDbdsmJawSg==
X-CSE-MsgGUID: HYW5GT4DTKSY2o1kceEuvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51406930"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="51406930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 17:46:34 -0700
X-CSE-ConnectionGUID: S61AgUtJSViaflBJFg9BZA==
X-CSE-MsgGUID: dPV8FI73RBmNHLfn5Ym0qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="150802446"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 17:46:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 17:46:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 17:46:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.49)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 17:46:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idUttf3Ld5Atb6Ay5YB6kVH9XS1ikWJima6hU5howXtKX0ul3BDMrCAopV54qhyRThcxZWw+r46KiN/4dmFdCcShRIze1hFoZYqOM2pkbV1jW2WfjM/bUU8+xuz6+qfSoHV+zOUPlotRl9I/LTq9kXhC0vWXUmiWdYBdxhySuBjqop27jgLtwS+AmD1x1rtB2t9BYUZHrUmzJ6/6ZoysKETnT87gSXouTMeWArJukFLHnfur4yUtX652olv5Gt5hsXS7JXxHqTLOeb4/J9Kwi5HN2apwmQFUHcG5pE9aIQgZNXZU1J+oJ/vCqEHGCF3TBGjfdqS+z+bE0SkQ8xdgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhwsORS5LrvotChJ713zVBRWORd3tE1VsHvGNMBN3X8=;
 b=uqXXp59PVnEjal5lQRgQeVkEDhBSEhdCB/z5cT7vHK8m0J6FJS1mokg42GxUurqk9A73D8yO46Jzaj4Gqf3LtZ2FwPE3OGvetR3QTxoZJAmSlJuKFl2dEr5gzub8vcZCgvhYKl+0dkVP0tJ9u0gl4CsanFGqeoFVI7cxHeLhPIFszneUB9UvdXKxcegNp19vFxD9ZOsnjQ9gcm4kOtTXJlwmGzc13BnBuJT1Ec9h5AnSqDtXGl5IkL4ztLzz0/RhYwKpb/d3OaPEpdBaFckQ8HDDyJOR42jvfGbt6pegcnhz9+1GwFqB06ugU7nATX6z5n27ZVxaK3y0S+TSCi3XUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Sat, 7 Jun
 2025 00:46:27 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8813.021; Sat, 7 Jun 2025
 00:46:26 +0000
Date: Sat, 7 Jun 2025 08:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, "Alexey
 Gladkov" <legion@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
	<linux-kernel@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 4/4] kbuild: extract modules.builtin.modinfo from
 vmlinux.unstripped
Message-ID: <aEOL2Jf5GuCiMGd3@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250606041029.614348-5-masahiroy@kernel.org>
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: 1540eeb6-1e19-4a8e-3c12-08dda55cbbe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EJyXGXZnh5mODpqsg/xpUG84wwCn8Usww+egBUgOihqrze4lQGq0ee7v7spP?=
 =?us-ascii?Q?UrnA+qkGkywcvVZ3gYXfpSb4YB021W0jJj1Rwxb6wGEAU244GUc2FZh79Qrl?=
 =?us-ascii?Q?xdubvFzboXZPxhvU/KhfdG3bX9BRqMzOuM528MmiHtyzKsvM9ZIVmn4gJXKW?=
 =?us-ascii?Q?rZ3nBvo7TNWd7e9zB5EhWd2Cg9KvCT5ZQ2mOQE3aesPNKcELN5DlEJYxDihU?=
 =?us-ascii?Q?yg0BNwVp+MfSZO/n+oUCspvHRIv1QsKey2As8e0Irmnjpoc3YcopaUry0c7S?=
 =?us-ascii?Q?xEdmGV86GOjPg5PZarRTSwLU1HIXvuWd7PuTcKlpCqrl6inIZqfMlxuWVclP?=
 =?us-ascii?Q?HzAoca/tZ6oMLz8RHTbRkZrrCqMcGKmVO9pIEj/hBBfPtrujL3JzXBz6jXQt?=
 =?us-ascii?Q?B1nJkOHeA0eHy5tH5dX9JVckxIfGvASFkpftcbfGWeEkKW3DbYxg298VQpBV?=
 =?us-ascii?Q?JTq5Ze3budyruzPSSJ+IuYNDXyNFWAFax5wnotDvMxK/Pn6A9XfXcoj525uH?=
 =?us-ascii?Q?By0Zjvr0ByRTi3m0NLTcrhx/kEoQOnwftxsqz+oMTYLGHcLleProArFQXI7O?=
 =?us-ascii?Q?0GHHIBYLfUh5ctYxLubHGPSCFzHDZ99MyppbIOywf3mfgIsVoLreIw0CoYRa?=
 =?us-ascii?Q?pn1klUG1ndboZDP0i3AHbGPbQ6bMxg7xH2JL7xYRjzq99xxmW5uVrDf766Nr?=
 =?us-ascii?Q?BZQs7Rq95R9lYKGPdQktaoZnssWZQLKxv/eDN5P6/7vfOZ7SrbGF7SIce0ey?=
 =?us-ascii?Q?Zg2DuOCJaCDm6QbhdOTYTABya08TnYJ1nyHTrCuhykGs5+D/zzXlyclRC70x?=
 =?us-ascii?Q?86QcA52bbNC58mHSeTdMZXxBu3PVqtZSbm7fylNjIs1zdwxz00fY7ouqDTCW?=
 =?us-ascii?Q?cZLrmw6M/y9oDkLuP4fkvXjfQTNtFdVLjNoDMDfjeS+uX0JC3AQ9PrcI4m7H?=
 =?us-ascii?Q?3yO9kYYj87k8XFzeVj/kOfEoBIEicE7dQ1q7BCUOSVJ0gjDYXuyR1ICPe0eD?=
 =?us-ascii?Q?nJ7JDgFFSLoDeKKTIUKvh9J/LJVXH1tSiv+jQrdA6NzGBta+LTvGE/AJsPlO?=
 =?us-ascii?Q?xRypEgb7qAIYNUCJwmgJabXHNUFnFuFjQEZaakl3kEXGCKdrwPYsy6QkpHfL?=
 =?us-ascii?Q?jk51GAL6JbSVbUwBTG5Ooxp1hHQh6peXh80jNQecH19NaUiex3yAn3UEWNCf?=
 =?us-ascii?Q?X763p3YkjJqbOL71gIZng3K9AN2ltJ31YREnvokhMjnE1D6GNy7+QnlnqYTl?=
 =?us-ascii?Q?rPvG8XJWk36/bLAHerCBtclYz2sCOMeDtWa0Jm/t3ZkjiX+DNtLXwa8x6BFS?=
 =?us-ascii?Q?hVKgrW+ALGvFfLHNlcQrjhZcKHvCgcFVlSK3UnlZ1Z58ZachRbVXRQRHb18q?=
 =?us-ascii?Q?kgDgWwgI/IXrMDGOqTh4NBlTGmCh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fvkpbYbutB+79asGSqEttlzhRWhcVcHUnr/RoUX+oTvBi0HpMaq3mWcwPQRq?=
 =?us-ascii?Q?EgBZs3EbMc9BWbBORLzVEGfkN4ULIjFvZe16UonQsM69ZZeUqjXmvNHpkX5E?=
 =?us-ascii?Q?NiumA13K5MlLagJdwniKLg2TG0655rqX6WH2SQrw1Vfasnfjovj2g09OoAoE?=
 =?us-ascii?Q?4TAU4QSo5cjQDAkK1OyA92wcWYt2S7KoEr4QnCQgWV+8Mx1Vo+nrGotLR38j?=
 =?us-ascii?Q?JITBGT/hUVdGLytKsb7W0lF0VDmQUzFmqBqiDE6sks29JzdrEJRvsjNEasnM?=
 =?us-ascii?Q?Wmop3BEz71f+j9oEceWF1DQTbigD7ntu46lEgpZdiVDYnc2X8c3LlobB7p1L?=
 =?us-ascii?Q?CbJWWTEFqdwrxLQKX4LJCrUTjkmGY0PmMLXIbieVN3gAp6LqjxQFM9hVTa/A?=
 =?us-ascii?Q?NjZc5YfqOdw/54ds466QQtqhnZWO9zf/v4bUcOuixzteCrg/7WW7TjG6zjs0?=
 =?us-ascii?Q?qJC4J08kkWfu32Dbfe8ZZNFuWHOq2qJ4Mi2ldVAGlpBAzHLVkR4pUnTe94MN?=
 =?us-ascii?Q?xWMrW3dgNVCDIUpXU9VuefRCylJqKVw6I1C4SWDfgQAPyVrpjyqbqJLxh13v?=
 =?us-ascii?Q?r+e6/qXvOj2jRzcSKf5dQSOISQY15Gr3Nmjtc5OQ4Y5KvUfhPDy5EtazWWaU?=
 =?us-ascii?Q?CK2NxAgIPdfXOiZhOlt1NO7bEaB+PttwzB2USLD6Sd6/wxBH8h15ECniQvMm?=
 =?us-ascii?Q?e8QRwk4cm+D5BUGM2q01TwIrnMLo4yUPTOO23YWsEwyWUU4SFtLKPZGj/kyq?=
 =?us-ascii?Q?HxIRYI09RHFLmCYaW+YDCqYm1NCo2mPoqmLw4InG+oQQ3Q1pKRo99CetM59t?=
 =?us-ascii?Q?qvzIncc7MCR4pxGP7/zEdrx+NPdmMIhV1PQqtqZdzPDkfzpJv7m/lVabaxdT?=
 =?us-ascii?Q?j30H5GNdrfPuGQhgjFxvwhhZJA58YXU1wXPFdxN/0GwXscA52hZHLicO86JV?=
 =?us-ascii?Q?nsK7HpTgT+5KJZ7m1N7J/E+e8CdPzXd/gKn6rOyPu7HcudOYlAbaDyOuKzfH?=
 =?us-ascii?Q?w2zykeJl/VisEiwN8fFC0sQi8EmSKQgF585WuJK+PLYIH///q0dAADrJRcLF?=
 =?us-ascii?Q?09ijbbiBBeeXjFsJ1W3zsCSf9/jfmQxWlY3FmOFqXwI8B80pYVtIbDqmmHT9?=
 =?us-ascii?Q?Aob3Hw9Zi5a35FU3KuThTGmvhZLoGeqal7MMYWmTIQ7a+uCVVa/7/2neP3XP?=
 =?us-ascii?Q?SDqplKGKiP/EG6Qx7LyUmZZB5HMx5gl5EKQIscnwPx8R+44GGofjnr5gRlFt?=
 =?us-ascii?Q?XYOGVxubv1Dygqpi6h6P3pCQRA+H1NOIHzirTrQAXdcW6rl1OkwwgeqH0Qsx?=
 =?us-ascii?Q?SUIv0CX+8619WnX4bgZUpeRTwZIKLQK0eaIQN7+Is4d7+2ULfpv+wlsq3pNV?=
 =?us-ascii?Q?ddqpZUa9hl2C8438Su/hv5t1V8DCGg9zbspRqnE4u2bayfI8LmTnQX0Z8fzx?=
 =?us-ascii?Q?WagHLPX0B/IOjGZPNILR4WZcQY539HTMDDYyKefisvqTAtO4BbSE3bJlCqW6?=
 =?us-ascii?Q?DH/f13xqf+Zfb4zXLEFPvKRTF4rxl0p4+E+nBN4ZR9PkFod6kDXDGgOXNHqv?=
 =?us-ascii?Q?3yiWL6kMly6oz8D0XgtAGwN1gTIlJxajC9q0T4map19jg4eb/J/2qz/wm6vk?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1540eeb6-1e19-4a8e-3c12-08dda55cbbe7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:46:26.7829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smed9JHUk6BhLrjY69sROJwZGrhuAnhjDZN8CW1UKunCLu++sIiq+WdzcoN2FsMFsqY/qk50Oyyr14JwR4uyTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
X-OriginatorOrg: intel.com

Hi Masahiro,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15 next-20250606]
[cannot apply to herbert-cryptodev-2.6/master herbert-crypto-2.6/master arnd-asm-generic/master mcgrof/modules-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Masahiro-Yamada/module-remove-meaningless-name-parameter-from-__MODULE_INFO/20250606-121255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250606041029.614348-5-masahiroy%40kernel.org
patch subject: [PATCH 4/4] kbuild: extract modules.builtin.modinfo from vmlinux.unstripped
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: i386-buildonly-randconfig-004-20250606 (https://download.01.org/0day-ci/archive/20250606/202506061718.9bJ7PyNy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506061718.9bJ7PyNy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506061718.9bJ7PyNy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'vmlinux', needed by 'arch/x86/boot/compressed/vmlinux.bin'.
   make[4]: Target 'arch/x86/boot/compressed/vmlinux' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


