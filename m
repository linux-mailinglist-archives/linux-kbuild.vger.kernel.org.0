Return-Path: <linux-kbuild+bounces-6110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A453A5E918
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 01:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E2A17A532
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Mar 2025 00:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CD34A3C;
	Thu, 13 Mar 2025 00:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+Y/+Xzn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D13211
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Mar 2025 00:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741827102; cv=fail; b=XlV3sZvkDjUn4aHKaJEiC1WRB8Ktgh6yaayfG4ndSuWHDaKNcESDQRF7s6IdLWu4ox2RutauefkWdWSG3JaEU67XkqZiJl0g/vo4LEdTwhbMgN97cOnpZ9a0g+Sb7hyzSuFHpcQVu+iEQnoAIQtXOAmqvG6sxiusP+/Gs3G/xhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741827102; c=relaxed/simple;
	bh=rNxb18NRw6JoRuHZhdqbcoiaL45kw1jGzAS+OLefDOY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XvM+UhjVzT0rI95+lNbc99W6CJOGxWCTA4eiWrMj0SvqR9H41BLXLSSyTwnmLH0Z8YeaSVr45Tccpvv1sigVkUNfX/SCdXMFYY7OWQ9Zdl43FgC35s4ukFC+GRcUwomxYwZ0tQozuUjDfPBIgieXoq/FzmgQpO5qEUUrFw7jk9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+Y/+Xzn; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741827101; x=1773363101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rNxb18NRw6JoRuHZhdqbcoiaL45kw1jGzAS+OLefDOY=;
  b=D+Y/+XznmH1l51HUjjg65g8c3dwbi1x1ihZxTY6NZ4cwjx3Oc7IvxOq9
   zgRAyQX6XOVtKGKXdyRnIlSz7xKCchhpakcU4a4FuroFrMYaOztkniogt
   L+gilRE3+Fdmss6R+QlAsQsfTcTGezQKAAFomCfnTW+SPrT7bfRZmI40+
   07S6R526s0MD8pq8De66nkwTPSHdhZEEhDJfZ8KTW/dSwz9ZjqIz6ZtrZ
   pzQfcnKipgXeki++UFaoz+4KY7vtiSL53cE6+TZfNt3CL3DEgOPevFPhc
   xFJTQL1svDIsCnLkRyfbWB6+z58ub5hWb4RJOyWa9XrqNtsTuyM+8l00f
   w==;
X-CSE-ConnectionGUID: s1AF6hOwTx+KEWTUsz4iZw==
X-CSE-MsgGUID: kmmPdOYqQ5yovyRm+x5WKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53578905"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="53578905"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 17:51:41 -0700
X-CSE-ConnectionGUID: f07zDi1tQVSNAg88p6GLqw==
X-CSE-MsgGUID: 6p8TrT82TjOCE+pybyaS3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125982989"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 17:51:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 17:51:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 17:51:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 17:51:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERKoBvwXoBHGSL2xQM66QYo7ukUmjuJC4m3w8yZcFnLorgP2LAe13jlaJ1I3I5pw2yFikq3+VMz7E0QX09V2sXJiq+btmIKB5CaU/LaTu+Pj11+du6ijrjXqtcNaWZfZfmiIgjhyLYr+05ASW03aXVWUopkOo8QthJbmy1I4r/HB3zVN8wO4OQ5vOwXC3G1EANFGTSv2mW8/vOSDqVxXZUwfJQOWJ3TkceYtTDHpxtyLDMhjWt+0thvLUf46L1L0OdECjfn0YNlK7yO9QEVnpFgOqZM8IAkAzUFd/R5BJeA5UNMWYSBNEGibrfcBFXsr9dXlJZ1yPOs99GpE2zpAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=si13sQtLm0JgxoVchOT5x5+yui82/CuPLd3AacupoUk=;
 b=k9XCQ32qTEM1wIzpIiXejy9JVUeCQgcqqtzDSkEPqIxl53OrYwM0gkqeds3RLik1kDAKyK/JORUub8ywLIxvAJJ4k/WixigwVK6HqiITcFgCUA/3agsw+SxxIWXSGiRUwDhkxUhLp/sjJUkl/3Cl9PN1zbvDin9m06e10meNxK7ttEH1if4zwXxPr9CAdxECYsoI27/RzAArhMZljltUdnOJY0OoFni8xBTwG4M8mBeetDnXcyFa+oTrAw2DeSVaSrSamotMTfMSji4SMlzxaWPgyoPHwWhdYO8Q9ht8ccMR4g6mHp/rV6YWQUx6E+mpIw4X094CYai/4WNL6lnaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 00:51:37 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 00:51:36 +0000
Date: Thu, 13 Mar 2025 08:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Subject: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option:
 'remap-path-prefix'
Message-ID: <Z9IsEPOnC+MGSAEA@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf93708-4bb3-4049-3417-08dd61c9354a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wUb43WrfZjkur9D5YKh3Q1oCBgIplQH1AfNP2mcGwCK8o8qwJXQzLdjnUmmj?=
 =?us-ascii?Q?JvkqBNkAAhdm7sGS2ZYUIEiIfY/3hpEKS5oPcA4iQf3ZesEwj7XWpNDa+EzE?=
 =?us-ascii?Q?fiLTNjFAHy+x9sEf2M5fSzO1hcpOfpYxgfYaM22vp/BxbIIdJbmGmGoAecEo?=
 =?us-ascii?Q?0QQ0JQtNJsZvtAhx/IgB0EPlxrwTV6BGh2ZadLaqRpfMD8wIZ3n3RarJUbjn?=
 =?us-ascii?Q?C7J7tkOkfffEwKi0ia7zNRWRg0/Y/sR/88dUT71TzeuYTFAjgUZqNxbRYLxh?=
 =?us-ascii?Q?5Mv6bpKExO25ElX6PFuShGJjQF880ZmZUPbVfMhXICs9mpBzvu/C59Z/G4t9?=
 =?us-ascii?Q?pw7ZLBAFip4RYPwHI4+3HbC9iafpuvbu8ue/oJ7VRxUCldVBJcN72ZF3J7uO?=
 =?us-ascii?Q?k9sDYbm5o9wTb8gr05iYeV7DOpUN2NGBFy7e03MpnjuI9JrLERYfWvUHZSV5?=
 =?us-ascii?Q?wzbgton8Bj4RNjrb6PtcKAxOaslZ0WCPm1OM1B3oypypO0mrtpcFWv8QFVsO?=
 =?us-ascii?Q?qSYzEk4T/mmFFY1GkMnOEnduCVDzNQJpXDC5ZBrc/N/DgnTLzemnoDHNnWnI?=
 =?us-ascii?Q?mDKapneMiutodMeBhAk2WJQHhCYx5S+TXvO1JRdH8zwPCjoP+jTwKrBsUy//?=
 =?us-ascii?Q?uSpR5qKuLAE0SsCVg+ZFdoKDyh4k2NPKqNJiuCfyORlMvfRRISfgK0zXbbla?=
 =?us-ascii?Q?p5rFiJKREehcRgwt9YO7dQfvEZxhaCA7OMvVLBAuDYF5jtp0rXP8toU8N7a3?=
 =?us-ascii?Q?hbKnKLUX2OFEZn8/jAQ56S7W1pjAnVApTra7Dp9/213fnJ8eJT5nzIkAaqdT?=
 =?us-ascii?Q?3PaVX4t9TiQ4GnmZqK10XPFupPT2ZEBBTotfAS1/OoA9JLbshr77P6pSH9Cg?=
 =?us-ascii?Q?WNrf+sJv8fU5n5gc+pqF1y1hrxJQBtyPOh/h41svxfKFZXzRQC11ih+RvEPK?=
 =?us-ascii?Q?P9bnA4d8lb+q4L29rWWriwgqF9xVgtMYKcTBt3vNKwqQKzM0tJrtCNGgPAfE?=
 =?us-ascii?Q?o0PFyK1YsU3ZwT+DVBNxPqiyYhBahhOmtZ78Yaiq5X9F75bBlMpAb1tcUNce?=
 =?us-ascii?Q?39kb5aVgRE1pXDZLHLrQWvsgAbMOjdpiW43HaMOCpj+IUPzGpzrt8rvCUFTp?=
 =?us-ascii?Q?XXQn80ZE0Q8VyNTb4IB5oFCty0iogGFjJxC6Rmt+0igXiWl0tR0J4rgwMqVf?=
 =?us-ascii?Q?ooI0037gg/vt8ZuTbUmO4J58aan3kUj0sIti3h+U20ndRJnqa0o2LMGb5OsJ?=
 =?us-ascii?Q?dh2HYQbC54yd0DCbinVX0QhQHk1nEdKossEu+x9YCuEmYVCgPfuU+muYb+29?=
 =?us-ascii?Q?QuId7rMakura4BqEcJuMVFvbgA8VjRt5cpvBNide1Um84DsSHIKzL2LpPFKW?=
 =?us-ascii?Q?sVIXvAv1JFvFqWNc0k0+b1rHMcjrFXhJuZ7YBz5K9hbwxMll9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Per/m9rPB83/6205/mmivcxsdXz6JgbsAcOwPQGAiBMMQyOE9zRfmd6NxfY9?=
 =?us-ascii?Q?gRNTKieGwa7YUneIcyLmrzv/yTkC2gtmBcPprGTolx+IhaA/tx4+VWtgYUV7?=
 =?us-ascii?Q?VR4B/d/ZeoJB9mvtkjwGkha7eI2kZkhD28PkpU8a2kpgVbZtcv6nXiG2csQm?=
 =?us-ascii?Q?ETkfmEDVsV2Ha4fHJMMPjNpvBwo0UapgAbJyUYhBeZjGMQVMCUHHu7w39dtr?=
 =?us-ascii?Q?ZUP+EUdWZmgS7U6q80sUAEdENX0P2+D2VAbVhvFkdKJt5/4JDLZFHkpyllXn?=
 =?us-ascii?Q?6gekGDDzpTY9/jT8GQ3ESY45YtNNs2OJ6hXeqqnG3axbZ9TjuJ0P1uJaQZdB?=
 =?us-ascii?Q?xeuke0+s4dbiZgVRieSt2JGm/UxjA2/+0fPH0816RvNpNqwLb1JMXOc+62/x?=
 =?us-ascii?Q?LWy69uU3+9pbSFXjHxMwlgX3GA+X/TvT0zdkCHeUBhLDPG7gmk7S3ia6urF+?=
 =?us-ascii?Q?Uq4BgabbQtst9iez8TXnawPlg1vi0wPAoFa0jTwLn0tZlvbRTS3ajCFEPBzJ?=
 =?us-ascii?Q?cO74DhUxWjZ482sUNcCbbp+pnTFSKSlAeu43WVSP6H7oZTESRDm3vDEGaV+c?=
 =?us-ascii?Q?EOjoYUfvYjaMIK3SqVuVaKZ1djo+6yqGx53/g9LkP87lVl8F+JKV4PnhHoyd?=
 =?us-ascii?Q?C+0mEJhvdkBe8RyptjN+/w+r/J8U/YMEXvN+AAwZsvPbQ3QaQsSVIdZFf5Xu?=
 =?us-ascii?Q?8ECIAYWC8hC1qmYeRXroHoj/Txj3iyUMzq2b4DqPye/rGBlotNvwu7cOfn8l?=
 =?us-ascii?Q?wUTbwGBF93U0TGxtX2pYi23K3JBChs1Gg2ZZYhFq6c8iORqWH8yyta3luV4b?=
 =?us-ascii?Q?ZUporinTrjUyjrJoUxYbvqXhh9qCj0bCqUFXCyJxQfpoIubaNoCAcYpoHOwD?=
 =?us-ascii?Q?MjxtGdTflkMuVaLLAAAL9Ktv94YtAmwnV0z9RtHBeHUL5/49ozb2XFlSnJc/?=
 =?us-ascii?Q?FVRgP+NZzMXs+fm2npYN3bwulj9q3ripI49+KUr5aQu88xS0xGymwk5G3fcw?=
 =?us-ascii?Q?TIP7GmL9GCUPGgPVdCmomAF9a+tp8qfM4AmjirANChlR3cbkK4cicLkWenZ/?=
 =?us-ascii?Q?d0QOy4G1/nAFgeCvA0OED9hoo8V0LPj6YlbX8lQRsTSzQPZXS0wB8SDA9iEl?=
 =?us-ascii?Q?ZQguvtKWpN7Zm28VnR/EhWOABH4r2TWYg1MsXLJHleKYiV/uulNWTRgnWyLu?=
 =?us-ascii?Q?ZZME6HPKRLSkZhx+JbcKZz2sD4tYIj7zohCepxpfyP+Ri7OK0isBO4fXTMo3?=
 =?us-ascii?Q?ZxFrbf7iHNCXw5nwJczScZLWNhUcxDGMor8AwUFd6AIw7NYMOKVF1+om0inw?=
 =?us-ascii?Q?n1a+hUAIlX1E3/fhzrODIrZsaa+e3Fk1fncA3AEJ69vbGEzKJ5NQ4NTCTFWj?=
 =?us-ascii?Q?p34kbxdpLXdztI97iDwTMWJsoiy7cx79MsDFUYYGNZ9YzoRAqQ0Bth+eujQk?=
 =?us-ascii?Q?D883AU/dJiFWXYDVXsbrChupD/0tWli/V7LpzEjvt1meqQwq7AO1eQ5sahFl?=
 =?us-ascii?Q?hYtdWXJYQP83qZW2f0Iy9TCuCa0zgiMeJyabedDgfr5bD0NLjSr7jcWInJwV?=
 =?us-ascii?Q?K7IUL7snTLfQd+F2NPqWP5RRN1t8d8ZYDIIcrvDN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf93708-4bb3-4049-3417-08dd61c9354a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 00:51:36.7844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8ONedRDln9MMwul/RxoKzWgwwv30f1PiwtSt/nRDHTnZlNpVlOr47J6VNOPxx5nTxIl6xI+RRMcby2SCoxpzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   bc5431693696b3f928b0b7acf8d7a120127db7a4
commit: 6b5747d07138f8109b1a150830f1d138de146ac2 [15/20] kbuild, rust: use -fremap-path-prefix to make paths relative
:::::: branch date: 24 hours ago
:::::: commit date: 30 hours ago
config: x86_64-buildonly-randconfig-004-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130111.NH87la6s-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130111.NH87la6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503130111.NH87la6s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: Unrecognized option: 'remap-path-prefix'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


