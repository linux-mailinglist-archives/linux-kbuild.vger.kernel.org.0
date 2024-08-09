Return-Path: <linux-kbuild+bounces-2917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2695194C7E9
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 03:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD943283C6E
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 01:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B400E33D1;
	Fri,  9 Aug 2024 01:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A84LwnBR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E378BEA;
	Fri,  9 Aug 2024 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723165987; cv=fail; b=FpFw3nQ5y+URAjeY40I6kZJC4Hpxif8/oDApjmZewk6f0MezcyWm9yTCX69EJ6lpyTuLTNN/E3hlwdSqwrQQPnNjmvhg3f94eSVG4Dn4+cm4xcaZ5rtWAeqP4EhFFrfHX4B6+gRIzZEbn6MmEPt/DafoBKXq3p/5cofkrQshCqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723165987; c=relaxed/simple;
	bh=aQwDt+fuJYMw4buUt9HyTG5B3cCy00VVyMxhRb7Q/1w=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pXlwMFDvEccmQMGDjRpukI9RMbPwE19EUBRASrsc2iGyDZzabLHSgVjvJk0iMk368I+vvLEdASHJB9eJrLt5Og37lOk3LRuqotZDS+hwGxsMbWV05Y5pTdXpuIDbBwZHeRpyUHSBhV7aZEDyp0FeBBpzERITOP6UGDgIpNSjoZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A84LwnBR; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723165986; x=1754701986;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=aQwDt+fuJYMw4buUt9HyTG5B3cCy00VVyMxhRb7Q/1w=;
  b=A84LwnBRbxUQyykOYhUa0UzZwIbwC8bCCR4aJID0kxH8YEhmFCvfJtOp
   /CE/I7JACP+cxfFOTDU/u6J1wShdeOwXZ5s5fJkXh2+1rzoxxhOTHo2/+
   i/IquRdnOoERVx7BLf/J0Ua9rfY4Aj3ssQ+v1kyAfo9o45HS2yChpv3II
   ry10W4KjVqiZlHdWz4LwsxQ30G0dQl8tOIsZ12bqUJLDG4dajnDHQqP4z
   6G7lXmiOyFqf0x6ELS8SlarSARGlMTsYZ6EXtkuc5D9JcRPrtD4gcSDlE
   tPpeC7QvEJTQOhU1BKKoG13jGC8VmVybR4P+aXkDeEwb6ljnkb7WLtWWE
   g==;
X-CSE-ConnectionGUID: QISIPCzlQ5Kb1IPgcHbcVA==
X-CSE-MsgGUID: is8iZlz1T+ivqnjbCaAPUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="24233297"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="24233297"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 18:13:05 -0700
X-CSE-ConnectionGUID: fADpxBfpSTush487Z+C2YA==
X-CSE-MsgGUID: zl9YqbZsQGG6Zg3JuCwXmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62047905"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Aug 2024 18:13:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 18:13:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 18:13:04 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 18:13:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxcW3SHwNeCSP4D1B+fb4wKHXlxFRgJA2GqpQxl6NPs8z3yjazdZ/xRYPt84uZ4srwLo7V6ktQxidT+75/iqgLMTw+n07xpqUJzUKRWIf+YuAbfb1P1TfX5AToLtGItLQLE7w7btS+LaOlZtyk89+NyaMCbFzxrB1kIwwM7UbjpMgs7DVGTAihD+zWUPeuPukphT/oWfQmeol6UqbGrocw79maqM+11fDIAa8yM8qdDt58Hi2BhB+oLZkplu6n7MXzTCDIyC9hkOaWMbBBlTixEIWMdCCvIMXVorFxPOhYM0963Rn1YBDF0sW1uzf4IsGppycJbADYW6HXEo0ObmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arQJZ1Nfqo4SvrSikpkUXtdkNhVzEMnFAvizoqnkZRc=;
 b=vjhS/sZH8hltyJi2dxu8hSgUig6g0MYxolnw0cbHZmdDZwrC2ewloUBSDOjO943KTDtw3v5OiATV2c1S6U6+vIw8uNByj2hmrWbSW8TcbkgUaByNRCDX5n49q64GZUtsLX3p+MPtUQMx4JCvdlSDjYVUiblfOgpmv8RNG+7yi+etHzDfY3aWCKfxMnrBaVyuHr3wOtWTQBHdETagkwXTkHgmxSGsLppqEGm7PSjGJjhRSZmvazEYbe5QiuCDxQvkox2csJY8p8MW911/00eCSH0iig+p0jF47LaVjLCrFa909z/hcWyLjUlxySrTZaRuo5kD6Y3uEKYdxSDOrBL40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Fri, 9 Aug
 2024 01:12:58 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 01:12:58 +0000
Date: Fri, 9 Aug 2024 09:12:49 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>
Subject: Re: [linus:master] [kconfig] f79dc03fe6: segfault_at_ip_sp_error
Message-ID: <ZrVtEbZjRYmCGS5t@xsang-OptiPlex-9020>
References: <202408061634.fe6be94-oliver.sang@intel.com>
 <CAK7LNARnytQTW5vE+u+ez1pHuSVS34cQ0+xK+MLyfLp05GjoaA@mail.gmail.com>
 <ZrR5c1p1fPffFeB2@xsang-OptiPlex-9020>
 <CAK7LNARFuUHiEVDF3O-aFc+awXM5QdCUCUu5wqbTcZQgLLWsuA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNARFuUHiEVDF3O-aFc+awXM5QdCUCUu5wqbTcZQgLLWsuA@mail.gmail.com>
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec6f8f7-a964-4373-0348-08dcb81067e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dqD5vh8zjYbzbhg66N8pmHPHb96seq/8b2VpsEHwI9Gh56zg+ZvpXdpwW/3E?=
 =?us-ascii?Q?TVCAvIrFpPiQNUT8wHreFLavSeTWvcZt1YmaWCNrgf69TxKvMXyloOrMxN6i?=
 =?us-ascii?Q?a3H+z8rbpdBoZ4YZZ7Tg+7w5DM1ZHH7qd9jaWS+iRH85gUisxx+2h/GW5SGg?=
 =?us-ascii?Q?w4TyHxhBHEbiG6W6YpsWY1rkcBMYTTSVPasjAKXYz6YNmMQm9KRRK2uMwe7o?=
 =?us-ascii?Q?ow28XYL6ZZDA7b5XH7zvQhqo8ua+zDSEMPU0z+A5Rg4mFCaVgbASRAq/kfvF?=
 =?us-ascii?Q?DsihU+xhI9Uq8JCGMyqoaLv4hLQhXSnkm8sSBTrKSF00HjAAPRngNnRM3tri?=
 =?us-ascii?Q?I9Ddm36OVqiO077hjJ8Js5NtTUrWjzCGeoezAqo7YhKNMnXNACgssdo0LBTj?=
 =?us-ascii?Q?kQz68BZ8686yrFFhwKZ7oK5rY6CTJr823WcEj38dwjjRSV7OiVgyrCg3WTSn?=
 =?us-ascii?Q?9hSI50E8k80R+wGEYvzFVqAqj+pVaJ98j3zTYEKjcJjMBpyCauXQu3lsxwxm?=
 =?us-ascii?Q?I/eozz3AXZuz1O7WaHpogvQNjLgmHEJjghT4gh8mHLxRZzbU6CmGNTozQzdF?=
 =?us-ascii?Q?hLxZ/gHw3SUjgIBS6PijSGRBThmAZf65Flq5FUGfnOjrstMNsAFHMX9fwNvL?=
 =?us-ascii?Q?9IXVCP6BiLJAq/irU9gNlI81b5ffMVOwK9kfzYoPgRhEWnnVfwn1BCXEVWZM?=
 =?us-ascii?Q?ETA7K8pXy2QZ8HAZ8v9a3bklTm0na4Yrc3dcEYoUf3xtQE4IjS9kZZQKCEs5?=
 =?us-ascii?Q?YGTAAJMCjZcKYJD4UR4/ktshBMHdoDB9RMPjpRGgtrMcj7kFqSLt+HizbXCz?=
 =?us-ascii?Q?2M7I1TioWInrGcXlPnzerJT7SDOehhopPZL1ufdOiSMPn9bQIOj1wMVPG+jg?=
 =?us-ascii?Q?Sa72RbXUKB+VriJxZFo5bIJKAGPq5cI8Zs7y1UkeLE3l0ous4gH5qFPzaRKn?=
 =?us-ascii?Q?EVPgedWnUqPoa6xS2h11/zvPQJzLQX1FII0epC0VSUvAbdhjVgCTZZWGTlcX?=
 =?us-ascii?Q?r6vrg31efrEVqvrdqnc+IFHcgkkty5hTmonvXHknHYZF2H2u1cnzgx/8BtxD?=
 =?us-ascii?Q?m0D3SBNWGYNEQ8uFMjpPiabPC9a+7iCJGUk2xz/Ngwol5qgLzpKxJtuVqqR9?=
 =?us-ascii?Q?kQY8b10fAMGWcTVSApG0VJBmc4jyBXrVtTSJMXrAHLBIHq5SF3Sv88YWkVmh?=
 =?us-ascii?Q?e+zhtDBXBCsYsJL/oeF4JYCnrZ5Fm8KOU1zztEuS9nyb/dA2qnWzufrMJBJT?=
 =?us-ascii?Q?GAejgS6UI1s8WGHCX9rghdmrLzX7DFt6x/jRCcJLq4orC45HRBVS8v7mQd3t?=
 =?us-ascii?Q?JBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZW8cM7vMQsMcOJk4lRIDDj6q8t0Ydw41Gj+fU7A8x1Q9ZVpWwbsBXhAIDU+3?=
 =?us-ascii?Q?v3jm/DihBKic1XQJEU2w0fbydbKVUbsALARF4V/AaooQ5IwnzXEyx4eUFcIY?=
 =?us-ascii?Q?uidNKBzNnRVUYTDyvesSEuheIhbdmLIj4wGh5ZyYp1nvLdONKuJzlQgmW4xF?=
 =?us-ascii?Q?vaiCABKjB1s244x5g37I2tq8hfXhD7o+p/SwuGXk1PyjhlpgUkpc9YWqpSVY?=
 =?us-ascii?Q?gh9mF1+Sn32tQsB+GZ89mjX+ohgmRJ8tEUPj0El5qLe0yKND17oWZAXsmeaj?=
 =?us-ascii?Q?IZ14va7JxQm1A6dxHll2lw7HTVIzzSMZC58bS0rRY0v1inVP5z39XP1kgKGF?=
 =?us-ascii?Q?Pnu3NVLXadgxTmAUB1cJGNnEZvkdytsxzHDB0VDrpkGT7jvPAG57rztgajKU?=
 =?us-ascii?Q?u6hbcb6iXEApNi7XMCXMfUIDyhlcLsqrmJUIKSrcUUmGwPIqbaTeFAWW0jZm?=
 =?us-ascii?Q?QEtYT8Df/oF2HqXDaCG/WzB+dCL7lzhG2KUu/YkpcSs0Rox9mnR+006AGCor?=
 =?us-ascii?Q?LLFPEvwJe8x/7C9OmiLYV3GTkuCJfaFi3dcxgsZvPIxWx/bAgn0oWu8fj+LL?=
 =?us-ascii?Q?j0K4g740Julj1+kUln24I2fizy9ZDnWQaDSWMl7MKCiDZp+MmNGeV/ep8NMg?=
 =?us-ascii?Q?rysVfnSzzHTbF9qGdvLaN6VtnClwGk4FISVXkd28QbseCLrA2VbBWCoJzbYW?=
 =?us-ascii?Q?tl39ZJNfH+IYTYsJvfSd9hnhJYrjrO9dNOo4VFvPRV3LNRyWkqjboq3ixFDU?=
 =?us-ascii?Q?qBdJXTmFBURTsLVC3ZL39Eps90q0dtE2qr9N+9eS/gOC6+qBEIBYKD+99sNE?=
 =?us-ascii?Q?/els2LplkTLG6F2OS0PC5Xa71Oa5FsoeLpRD4HtPY7hojcaTBRa0JysoMrib?=
 =?us-ascii?Q?ppIeEnuGWUdzbpikKQcyo43cSILrYc1pqcnn8HiRrIQI8uGTVSJM59lkgU1g?=
 =?us-ascii?Q?sliB2dqbQNoHTVsvWy/o1K6o/DYhJ0ULQTTdk3y5YMIWYVU3ButjeAOj+u9F?=
 =?us-ascii?Q?lMNLk+RPfZLvai+cjeGURuZVbK8e75gs75oj7ELaG1fWc9Vm3OGVWbWwaRmL?=
 =?us-ascii?Q?oqG1ll1NFzzk//OcYpsNzWUEHNxl1NhY6AXOfGF5XZUTw4Vf3nXbWGlpZEDT?=
 =?us-ascii?Q?eL33I+wbVsFI8WlKFY5S9lnVFQgLWGsNgm2copDowopJCEQ/YFzkSEH3iPNa?=
 =?us-ascii?Q?7PpbW7F8MgHzUHdcUxZx4n7wJBLwfcsBD1z2u7yBcg8huhGbqk2o0Y3D71qR?=
 =?us-ascii?Q?06qo1qs8N46kHSXvyI294w7/Tx1IqjvDc7qtlpss2nX5Wie1xXgyh9GWwJ+5?=
 =?us-ascii?Q?Ekbr4WsD24CcwDw6S2qw1iRgA3l6FjDLr7ReLa1YAX5JggMTedRwwASFH9y4?=
 =?us-ascii?Q?4eTY/gp6s4wpKrMOJ84I7VmhlZjkDbr7UPKuk8FtXKwB3tPVOtVz4VYPxsU2?=
 =?us-ascii?Q?wtefRQCtUvdJBcq+NBCWfidg6jyCDvpT7Xf9ACcF2hpqHjiTIbkBZhpB9Vu7?=
 =?us-ascii?Q?JY1fgDEaS38c52a/ezFDX4clC2S5UIiX9ARXnSakVriGFUL4J1jzWqaFeb2L?=
 =?us-ascii?Q?tQ83pJsz6nRD2Z0IUdVJdbFsod0AK2SxnCsvHPB0+aIyiae4aJbhEvw4TExG?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec6f8f7-a964-4373-0348-08dcb81067e6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 01:12:58.2760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+MO246JepCeUGydKQIxSTYZvw8tXZ6mLKPvBcn1ygAta7mo85HLX1cOZw67GYASKhR4KIoL+KWhZ3jlDPgcxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
X-OriginatorOrg: intel.com

hi, Masahiro Yamada,

On Thu, Aug 08, 2024 at 05:27:40PM +0900, Masahiro Yamada wrote:

[...]

> See this line in the error report:
> 
> [   15.209351][  T483] depmod[483]: segfault at 0 ip b7abe4f6 sp
> bfb00aa4 error 4 in libc-2.31.so[8c4f6,b7a4b000+155000] likely on CPU
> 0 (core 0, socket 0)
> 
> > > What is your depmod (kmod) version?
> >
> > our kmod version is 28
> 
> See this again:
> https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk/
> 
> It clearly explains when the issue happens:
> 
>  When using the SHA3 module signing options, kmod 28 segfaults during
>  "make modules_install" on the build host.
> 
> If you are using kmod 28, upgrading it will presumably fix the issue.

thanks a lot for guidance! we will follow this.

> > >
> > > The crash of kmod<=28 with CONFIG_MODULE_SIG_SHA3_384=y is a known issue:
> > >
> > > https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk/
> > >

