Return-Path: <linux-kbuild+bounces-3507-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B02F974844
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 04:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B0981F2176C
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 02:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FFB29CEB;
	Wed, 11 Sep 2024 02:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CV8rOyn+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCA6225D7;
	Wed, 11 Sep 2024 02:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726022604; cv=fail; b=kNpbCyHn8Lk4C4sRriVkvuMN6dgItpGM+Q4jkKk86MZvuPnaIqko3qsELz+eYLz6Z7V81wOXzm9FhV7IhD4v3aihu1CqlgncdJ6gAUgsqn3M3EyEytAATVXSvi6nrekRK/sXsQpjX6/lBjobyf53kzfktFuB44ApgMliciJw1DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726022604; c=relaxed/simple;
	bh=BcOM9brcQUNjdFLo5Q5sbZCEGoS6I+tcyVfg0sLHHH8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cMskpktxh4sk5+X5z2Fs6msECh+DBmI5+kS4fGFRFRKMWTgtQW0/tcdZBj6uL+h8c3W2ZabfI9nD6KAXYbV+AwF0x3X7W3wJd9KMwfusMoNE0gLi0dwl9jH/CanJ4NxK0yMcZ82yZgcpYELHmiuRrSx8S11Ft7NEmhQyFLMnA8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CV8rOyn+; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726022602; x=1757558602;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BcOM9brcQUNjdFLo5Q5sbZCEGoS6I+tcyVfg0sLHHH8=;
  b=CV8rOyn+JrzH87fd6ZBeM0NAZvCNs89j9q/3Wyt0TeCIhu7s22i3HIL5
   CWjWB7yhF/3TwzWGJl4GCxmxPUiZQMmQPAr4XJ+mAHkADhx6Zeqqp4cIc
   qHMyv5qHQJFA3BIf01uq4ZScqSVsppbSycZ1MLnXkz3NapQnESY7XTDnJ
   qNMD5/2Lcjzfb6nUyDgaAJZGf0JTSmZtFNXiQO9GARDVxE7S0JiHEbXpK
   0kcYzqSVn3pT/UjqL4TbfqZsOfrKybh1DtXSoP4dl//W6b6P9Gayn4Vvm
   jXy54DlCiC3qS6jGtgE5ug4ERo8bpO6zfgappwnooX0+f9etq4Ar/EcTw
   A==;
X-CSE-ConnectionGUID: pbBl7NnMRoqx36vzba8+Yg==
X-CSE-MsgGUID: VoMimVc+S4uhq85q/rEcDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42279541"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="42279541"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 19:43:21 -0700
X-CSE-ConnectionGUID: peqMnoBSQGmTl2/wXwJ64Q==
X-CSE-MsgGUID: cYnJo0r9S7WPNklD6TFGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="71829546"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2024 19:43:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 19:43:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 19:43:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 19:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwEKVXR20D0G46XRjvQ/zNdZWlHyc6a0zyWBNKPSFX3NEp1pZb18GOxWT6B+kz3qDPUf/aDBZDlI0hxzqWmMmgyrVTIcUTycw6uq+pbeZFiRaGt1nNPaUB/d/PnvEGdrpJr3WmmN7d5YMvRhwcZ2Bu/WVOigjo3zcojuC3qBTYyKmfkKgr3ezH0ec0/aiHou0doA85aN02mZDp4hlkfxTA1BEQCT14NVifX5gHMdppgcmkQ5TQaHV5mv77vk1v29qA+Q5Uxwj3XQGLIv78wwkafY84oI8gckkhJmnBKuIQJC6ozTdrY98eO0io1WFtdwtxl0WFfOuGUxxnmXBUD2uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhEpsqgxVOTWkEvBhCiKh/Yad/7ZxcKik4kCG2t205w=;
 b=ljBK87w+9dk9l60RZc2y9UeJzXiTPPnx+0da18puijZeogZO1tmUYcpnlSrjNFGJ0o7MP0dDJTknCdJ7MEWTdt7KvYJa03hscmHWHP/9GDRAGpcOSBqAPmk45Qr2jV8JVG9RSeQyA7svDi9I21vFD/r+9IiCSq1HCf3EN8/6PdvFsQhHcYyoKnZ+oxGf0YedtaZhNA5SSKYA7pHsPOyAgCQa0NE0x97dkUBlHow4YyPuKuUX+6dycS4J6qSas/oh3690dCsoYQ+ZlKlqErZ57YTW6oI22H6To2/NWccaE698HM6kal4YnnyZ/W2YWi7uiqYlddC78szmfg3KVv7EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Wed, 11 Sep
 2024 02:43:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 02:43:19 +0000
Date: Tue, 10 Sep 2024 21:43:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jing Leng <3090101217@zju.edu.cn>
CC: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek
	<michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "Linux
 Kbuild mailing list" <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Jing Leng <jleng@ambarella.com>
Subject: Re: External modules with O=... (was: Re: [PATCH] kbuild: Fix
 include path in scripts/Makefile.modpost)
Message-ID: <lnizw6jklneisxkhah7ezy4tcrn2wpm52ibh5euz7ipyfansde@kc4onuvrrmxr>
References: <aowpzz4rbedjkwkl7b4a2f5pf2p5cgsu6knsgxnayckhbumxf3@aznrm7oliydb>
 <442e8058.43a4.191dea175d7.Coremail.3090101217@zju.edu.cn>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <442e8058.43a4.191dea175d7.Coremail.3090101217@zju.edu.cn>
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ea5a36-5aea-4785-35ae-08dcd20b7e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R8j/GsQYoThcUgDO3UikAGPOGq2inYjElCuZHSDQEMol+bDy3B2vgQSg6F6r?=
 =?us-ascii?Q?669KlgUQVnfPiO/kH5nuc03V2S1BEDPa5XLcX8wnjq+LBsRd6N/pZZ8nHf4Z?=
 =?us-ascii?Q?hde2BZ2qkfVF40Fnyfg/xy/GKYHnFdXglA37iLInpB73S+IOCXPW4KTIGD3s?=
 =?us-ascii?Q?/vh9wrZ2wBBc//Im3WEUgVQgconD3EtYPftBjVun3lFl9lQLfz8fqpRTINYQ?=
 =?us-ascii?Q?EyFRvtPicMLjuhDp2JLYyIzp7mOdCjDXYxUTDQZocBikIwlrxtUAvEB9De/O?=
 =?us-ascii?Q?KhFYbwU58yHkKuNlgg+yDaHMDbOujv3DC4K1V1VMh1wPHBtuphgpox9J6mYC?=
 =?us-ascii?Q?L34EFdGvnX9rv7+SzQxxmdhELNxWLoVkzvuH+FrUGH+mY0AnAgCSPox/V+IR?=
 =?us-ascii?Q?5YxPlJoPpaufWMP6FXsAS9thfkRlfS371eAhnv8rWIsyMPLd7xrpc4nvQcj1?=
 =?us-ascii?Q?hav3e59IlntUJRylFQi59SoiQ0YlM4rOXEPae4P9kDD4wpZy8h1nwjlr6Giw?=
 =?us-ascii?Q?iX9OWXvLNSRP7UQI0T6b44CEWPThKjNk+wSvTGj1Efvz0f4wJwDl8BHBLJ70?=
 =?us-ascii?Q?6N08m1DQfRZf/MnZ3UjWpa5bWGqr3QNiuT3tp0XEzl32xR6x1B4EptaAoYf0?=
 =?us-ascii?Q?mv76u6P/bocYr96vN1Osbawyscmxmuwlx9I/WdwuuCNcmhQ/W9XkrBtrM76o?=
 =?us-ascii?Q?ijlVTADHSIBQWydeCVzDUX5ktqs8qMyXk9KqchA3OKWauAA5DPZBfvMSzdf6?=
 =?us-ascii?Q?dTq994HjpdwVpDVdUc1SBmKTN2/eUPqdnDs0owJ3XA/q/ldp8uuIbuypvZLu?=
 =?us-ascii?Q?OKVXM+mUCi8CprpdkBf3ieeYJtKiUprGTkgrRxcY6wxbTt/+ZR4oH9dBhRdz?=
 =?us-ascii?Q?k6P3HuayEpkIKn914X1+NBKspW1JLn7wafvtAqEArx+NzUjOC8u6XXCNuCX9?=
 =?us-ascii?Q?WAXlu+gdWxhUUBd4AFgI3Fynz3HKuAOUSPGTrZA0DdeJ30HUjMAD8BwlOIJP?=
 =?us-ascii?Q?9m+lGn5SljP1qz/KvKeo61lRI13v+MH2czNaas3hgpDVuASLjwdK+dJg/9+A?=
 =?us-ascii?Q?JN3OiyQY06i/8DOABGx6pi4be3Sm4ox22wgKMPFuEqwhcUMECZOugd+phK5n?=
 =?us-ascii?Q?4e5FZ8UjjLXJ0iMHcr6jEtoimYjG1h8aD9z46HMXewL/a0m418AeBPwNWCSx?=
 =?us-ascii?Q?iVHKUS9KLomMFAROOT7peV4uBQcR6XCuxdR4i6f+Bwqog2rm7fTb1Mq+VOy/?=
 =?us-ascii?Q?i4qbsTk04S6GC+2jpCzqJz+QgcFWY64p37zgzItMPFERGL9rNJaXTAp7rg9W?=
 =?us-ascii?Q?hivShB+AX3eUIYuzr6iIUyVK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FYXC/9lnNXx2tr2GfoZbJv6gQ7T6gouuN38yv64YRrURX+oLvZKlJtDv7PSP?=
 =?us-ascii?Q?yeyWuPoNGtoHWwGH1ZRtR4sEhmmNW1e1yJCR26Y3ayN+SnZ9jA3T9MwMdOYV?=
 =?us-ascii?Q?Hyw2QuaIEQ5FTii+h4MyoOeYvPjYTpl5eirGtuWRTUL4FJc3cAtj4uzWKSma?=
 =?us-ascii?Q?GGtAo6eN+YO75OvBW8N6fQ2UPEePynvoDnT+KcSAxUKLmyAhNQzGSTWXnTAJ?=
 =?us-ascii?Q?0KV7DkRwi4dkAlVrzRuwGwj8q5etigzR5cQA/aa6DPSPY8cvKXyodu7mhw0Z?=
 =?us-ascii?Q?sSFB1OerRO6Jh32jl9TbCvPDnurffueUBjDGZfktulZlTZj1vPxh+pDwIb8N?=
 =?us-ascii?Q?ZBrl/XHDVgKs03/jqp8t7YAtxyfmhnP5ycn0fbgOlIMUoKp04iW9wURSadqo?=
 =?us-ascii?Q?eJ0vs5acAg69ZJhFi/hMLNPx3FTFk7cxoW4qBbcRDib2ZKh96zFlL3Kd9OuE?=
 =?us-ascii?Q?v/esZQuBh3iocpmCG5zKgEUw3VHKHlK3FzcwyMobAdkZt9MHQMwD/MmP23sP?=
 =?us-ascii?Q?mCvjnXWuFHUHOw5fjc95q+d0wO6EzMTdB8BJeGNY4QB0zUYh9Ppm8MQIBQvE?=
 =?us-ascii?Q?h1jvB7RRe8UB/3FsioSTxH9h10U6VzGzavcc1+hpHh5aYd0yYZ1gAxQw5f6q?=
 =?us-ascii?Q?jT3q8u4wfGzqspVlHLevFzmw5RO7wvvgZ3rz+XtWS6jSDSa/QkKWqZ4LH7fF?=
 =?us-ascii?Q?+hlFG3lw00yp1yQtktn1xBQoaTI1B4t0Z2VzHCq361jH5HWz9lMoJ5WrT/3A?=
 =?us-ascii?Q?fcXOqdi0gKw3Ml/xgeFrHiRTo8eTIoAHYqX6zUaxv4zwdYvOg20gxFenUspY?=
 =?us-ascii?Q?AM54u7dCvT/PIORkHCAbRNkkWaVL7C6LjMtvZSCB44vK+0FiTwTzSkLRuBhF?=
 =?us-ascii?Q?seNPEDp6icWscgmqm8RqKOc98Q1kGqH9pkvcTIUSljfolQT8z3Q1QSxY/EPO?=
 =?us-ascii?Q?XZuZRnofDVQFcgPUHfC4rnHwaDGXcTHn0TnohY1YogWflPeu7Jxw0NWDnZQK?=
 =?us-ascii?Q?Lu0DXso4wLvkRCuEdgqdXaVUIqFG2/gjL7dykzYua1Apje2VaolILGqLj2eX?=
 =?us-ascii?Q?EdkCcMG5TZMp4X857wNnECBXcN7aXsbVg8zlfUOamzNnSUjE8jEHCElAJkiU?=
 =?us-ascii?Q?l0wl+g8/6sqKqRZipgddb8aZIv+5YN5wj/vjGoOH3D0l/oGJg2HouxaLPjcm?=
 =?us-ascii?Q?ByH6Rm4zQ/InWmbDaGLgUiGdESmAS6JdYWTmFxcFcdymnNYtjWAK9ZNF+kmw?=
 =?us-ascii?Q?8NCjRC+RG2ByMsb/K+gdafcAE/zwDnVawNyqOQkyB9FMOUpK6Rm7fEgZDaqA?=
 =?us-ascii?Q?heMpGZaZRZGtJAwV33SsYOjFljznsuOdPX9t/dYh3Y0B+JTgY/d/xxNhKSLu?=
 =?us-ascii?Q?rfgViShQK3EGnlflsJt1qFaWIIff7H2MDJvOk6Sm6WBsHOVAk2nazzoUScuX?=
 =?us-ascii?Q?eil9yHaDcYg/rHdoHfYxtEBIbnTB+RyZ+h2S4j8X2+5sifea8jbewb9M/WA2?=
 =?us-ascii?Q?0EKshj90XuGjMp+uSOZbyjWdiNjFewQzYPjcXlmj76aXfuArQO4tbDK98wnk?=
 =?us-ascii?Q?th6jrLnrw7VAQuG+EhcDI4naSMYEcYNutW/Fl08qOLWRVHlJnlxUTF/BSrmA?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ea5a36-5aea-4785-35ae-08dcd20b7e7b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 02:43:18.9663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BdrePoJnpKPIkXjFvmxXsIgTM1+/WWivnAoV4ItEA2EjLF+MPznLkFTEYRwFYbr0qwBwexLquhg4qOWI4iFl7YZRI1HjYzNORl9L251TWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
X-OriginatorOrg: intel.com

On Wed, Sep 11, 2024 at 09:10:09AM GMT, Jing Leng wrote:
>> -----Original Messages-----
>> From: "Lucas De Marchi" <lucas.demarchi@intel.com>
>> Send time:Tuesday, 09/10/2024 22:00:29
>> To: "Masahiro Yamada" <masahiroy@kernel.org>
>> Cc: 3090101217@zju.edu.cn, "Michal Marek" <michal.lkml@markovi.net>, "Nick
>>  Desaulniers" <ndesaulniers@google.com>, "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>, "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Jing Leng" <jleng@ambarella.com>
>> Subject: External modules with O=... (was: Re: [PATCH] kbuild: Fix include path in scripts/Makefile.modpost)
>>
>> Hi, I was pointed to this thread since I'm trying something similar
>> in kmod's testsuite. See below.
>>
>> On Tue, May 24, 2022 at 02:52:45AM GMT, Masahiro Yamada wrote:
>> >On Tue, May 17, 2022 at 7:51 PM <3090101217@zju.edu.cn> wrote:
>> >>
>> >> From: Jing Leng <jleng@ambarella.com>
>> >>
>> >> When building an external module, if users don't need to separate the
>> >> compilation output and source code, they run the following command:
>> >> "make -C $(LINUX_SRC_DIR) M=$(PWD)". At this point, "$(KBUILD_EXTMOD)"
>> >> and "$(src)" are the same.
>> >>
>> >> If they need to separate them, they run "make -C $(KERNEL_SRC_DIR)
>> >> O=$(KERNEL_OUT_DIR) M=$(OUT_DIR) src=$(PWD)". Before running the
>> >> command, they need to copy "Kbuild" or "Makefile" to "$(OUT_DIR)" to
>> >> prevent compilation failure.
>> >>
>> >> So the kernel should change the included path to avoid the copy operation.
>> >>
>> >> Signed-off-by: Jing Leng <jleng@ambarella.com>
>> >> ---
>> >>  scripts/Makefile.modpost | 3 +--
>> >>  1 file changed, 1 insertion(+), 2 deletions(-)
>> >>
>> >> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>> >> index 48585c4d04ad..0273bf7375e2 100644
>> >> --- a/scripts/Makefile.modpost
>> >> +++ b/scripts/Makefile.modpost
>> >> @@ -87,8 +87,7 @@ obj := $(KBUILD_EXTMOD)
>> >>  src := $(obj)
>> >>
>> >>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
>> >> -include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>> >> -             $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>> >> +include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, $(src)/Makefile)
>> >>
>> >>  # modpost option for external modules
>> >>  MODPOST += -e
>> >> --
>> >> 2.17.1
>> >>
>> >
>> >
>> >I do not think "M=$(OUT_DIR) src=$(PWD)" is the official way,
>> >but this patch is a clean up.
>>
>> I tried what is in this patch and also tried to find an official way in
>> the docs.
>>
>> In kmod's testsuite we build dummy kernel modules to exercise the API.
>> https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/testsuite/module-playground
>>
>> This works:
>> 	make -C /lib/modules/$(uname -r)/build M=$PWD
>>
>> This doesn't:
>> 	make -C /lib/modules/$(uname -r)/build M=$PWD O=/tmp/kmod_test_modules
>>
>> I also tried the variants above with setting src, but all of them give
>> me errors - I used 6.10 and 6.11-rc7 for these tests.
>>
>> Is there a way to do this?
>>
>> thanks
>> Lucas De Marchi
>>
>> >
>> >Applied to linux-kbuild. Thanks.
>> >
>> >
>> >--
>> >Best Regards
>> >Masahiro Yamada
>
>Hi Masahiro,

I guess you meant Lucas :)

>
>I think your intention is to separate the source code from the compiled output.
>The correct command should be:
>    make -C /lib/modules/$(uname -r)/build src=$PWD M=/tmp/kmod_test_modules

oh, looks like this works. Apparently my mistake was trying to set O=
like I normally do for in-tree modules.

Thanks
Lucas De Marchi

>
>You also can refer to:
>    https://github.com/lengjingzju/cbuild-ng/blob/main/scripts/core/inc.mod.mk
>1. The complete command is as follows:
>    make -C <Linux kernel source code directory> O=<Linux kernel compilation output directory> src=<Current driver module source code directory> M=<Current driver module compilation output directory>
>2. If the <Linux kernel source code directory> and the <Linux kernel compilation output directory> are the same, <O=xxx> can be omitted:
>    make -C <Linux kernel source code directory> src=<Current driver module source code directory> M=<Current driver module compilation output directory>
>2. If the <Current driver module source code directory> and the <Current driver module compilation output directory> are the same, <src=xxx> can be omitted:
>    make -C <Linux kernel source code directory> O=<Linux kernel compilation output directory> M=<Current driver module source code directory>
>
>Best Regards!
>Jing Leng

