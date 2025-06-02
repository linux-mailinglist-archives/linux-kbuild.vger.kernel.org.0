Return-Path: <linux-kbuild+bounces-7355-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E55ACBBCC
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 21:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B211518848B1
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 19:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB221A3150;
	Mon,  2 Jun 2025 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6HTNgw9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06771A0BC9;
	Mon,  2 Jun 2025 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892924; cv=fail; b=rTuYaOhqVStpyHGjZnm7rEZbgXC6DlmDyTGSmdPUZ3aqCSE0EBTUuCZKafcEk5uO1fQOM3FxxGArmZoUPYuod/wu17O8xZOUQ8kwnXLZhBYSl5znEd3H+ImkT5FkVbaDfwXUAHpe64N8BbPIQsaPtxGny1ub8o5DQjBf/dBtV3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892924; c=relaxed/simple;
	bh=z2rata29oQeXBZ7Bas9jCIEbHjuUAyGuhGO9HJaQZXY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DNvGy1AMwrzM6HPnNmfMENm/42zgJ8LUxXrvefooiCrdn8xGJc0if2UrHcZqT4STOTfnMeL11eyR2fQ1VHGwV4zzfMYU7t/yipCaq/YPWH/bXE+ERZkURQjZ9IYjr7o6U5FNAHBpB4Q3Ore6QRGHHZBFyIwLhTBgxQCfTz/rGA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6HTNgw9; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748892922; x=1780428922;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z2rata29oQeXBZ7Bas9jCIEbHjuUAyGuhGO9HJaQZXY=;
  b=b6HTNgw9qzgnZs2KEVR9Jhh1roKmU+KV34UcZIh32NLFRNfa2BLatNPw
   mtQehUEJV2RX5CkiRQICx8H2ZHBtn8GympXFZm1Z3JG8mDufLkh5IF6jH
   tM85I8gr5CrKFr0I80vFfZEByynWlCDx7yJpTrFJVUjeytsAiNkeywnpe
   lKC4v7f7suVHdIgDgnO/z6I8t1tAPls9j13mDdd15LnNk4LtfH/J4gIjr
   S/xwWpi4oBmGwt5IkzJG2jqYJys/GdcHr6XVqaoKAvYZk3GHqIQQuBqYH
   TE3GlS3PalXsu9esTkIWH37jsXStB1gYyXo04Rsw33wgBcHvkwfQxKkSL
   w==;
X-CSE-ConnectionGUID: vws0Oa+7R82caZQBl7ABJQ==
X-CSE-MsgGUID: P575ZEN5Rq265qGIBxTCXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54712842"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="54712842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 12:35:22 -0700
X-CSE-ConnectionGUID: ojPGiMW7TVKPGxht++ocOA==
X-CSE-MsgGUID: G1a/Uw+CSJ+PhaZ2krOseg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="145579107"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 12:35:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 12:35:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 12:35:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.40)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 12:35:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONdlV4xHzz7UUWNyLF3d86ARwvEb2bQbBjvA96L4y4+Jr7quL24e/8jRz1fdFaHa2Tdkksa2vaM5B8azfjtbGKB6L+5gz6ZHBQMEZjp7CpcIXzpOgYBIXG++fKwVmUWM0psmeyxO1371k//qvljZV84NZiFdFr/fSzcwrAvEOqJT1dgn87Fr7kwnEZuB3KMVBM/ySDvwJVDx6na07CyvySklKYP+ez3HKMPeQFeaGoTPk5z0fT5M+2pkCZkizU9kDRNAvFwl8p1Wx9SDNBPDqFg3TDAiDYE7sBf0//8Qbv8CrIaLIjXAKibVrd+6pCgG6AlMeYOjzgje/97TxmA7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3Yqmnt8E2MJmFhthEnEZNnWC50GfPOfEeCNIlarv9k=;
 b=ANL/XNCHb1SmK3/a2MMFH2zZ3CAG6SoEt2PioQht7zmT+wbd3pysJsj9ML/g04q4V8bmzMq/O5+8H2QDdDIS0Svrerxrkpo0ihRkLVzglgbSeAI445l5uPwcbllKqNJoQIKNATIbe2RI+5IZ1ZuQFlyV0M2nUsRZqdDjWEqII7/gXhyz8+Rjm6ATHcGNpEhUhktAgk+8rmsVsxE7t/f/eDn7AkSOPlm2gjbnzSh+Xg23kffBmOCN2W3XEy7WwGcFUHi3G3pwf8wK20L4NJ7VCffvV3C95URpkIQrbYekJ/osQVrg1PYPREzcOWPk4VLuUSbXwBXOEygXt2FX/b5bkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 2 Jun
 2025 19:35:19 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 19:35:19 +0000
Date: Mon, 2 Jun 2025 14:35:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Lucas De Marchi
	<lucas.de.marchi@gmail.com>, Daniel Gomez <da.gomez@samsung.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>, <linux-modules@vger.kernel.org>
Subject: Re: [PATCH] kbuild: stop module name mangling
Message-ID: <yqulldhantbedsau6bn6tht4pvco3ywqfqdpdglik4g6nererd@iapbwfhfrr2o>
References: <20250602130609.402581-1-masahiroy@kernel.org>
 <CAK7LNATBCmhf_yT+1nkULwRZgQ3QJ6PDbUSWAPOvYZT478M07A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATBCmhf_yT+1nkULwRZgQ3QJ6PDbUSWAPOvYZT478M07A@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0300.namprd03.prod.outlook.com
 (2603:10b6:408:f5::35) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA0PR11MB8377:EE_
X-MS-Office365-Filtering-Correlation-Id: 0527f13a-2c85-4e37-8583-08dda20c9b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUhpVVVXejRpMm04Z0U4ZzR0TGJxeUhPWlQ0SjZucUpYSFpsUk5wNUsvbVRI?=
 =?utf-8?B?SWMvYVJkZ2sxbGV1akNjcWVYL3g5djB2aWF4bzJ2enlYZHZyeXROdmVjT0pq?=
 =?utf-8?B?ZGdNQ2VVTkJkR0VNZjRrN0NVMHMxemorR0VncVZMQldLWmxlcnAwOHJ3cGNP?=
 =?utf-8?B?azFjVnR1UkNWUW44cG9DTDAxUFhyZVZtM2FDMTFNZUMzWEkrQkw2SmcxeTl3?=
 =?utf-8?B?cTIwZzFneUtFTWtyWklqNGlNWUVPMVhBTjd3Y2wxT3R6cGFJVktZQUpoM2Nz?=
 =?utf-8?B?cW5idi9PbWhhYlNpK2p6aEtleTlOTFgwcy9DNDdlcTUzY3lOajM2NEpDRWZS?=
 =?utf-8?B?NFlUQWZqdjJraUFCeElScDh5c2g0WC92Y2JDMU4zKzhuYy9nbmw4WWJES1dP?=
 =?utf-8?B?UTZUTmxrd2I2YVNNQ01SU2NpS0pHdSsyaG9tOXFxU0IzZVVFTmlOSEZTQXA4?=
 =?utf-8?B?em1tbE11VlVWMXE4Q08yek8reTJVc1RQNklXdHNnQlpQUWhWV0R5ck5OZTEz?=
 =?utf-8?B?dSs1aC8wcEVmS1VmVmJsbk5BSU5VR1lwZzR0KzV4WnliR2pCTzBzYWZ5VDNy?=
 =?utf-8?B?ZGlIMHVLbkZ4L0dWYmFuOVNiK1ppRUp6Wllpd293T0V1QlczeXpSZzR5S3lp?=
 =?utf-8?B?NDd4Tzh3WFhySi9qWXNLN2F0cVd4ZDl0VDNqek90Tll4R1k2eHVNUDFWWUxO?=
 =?utf-8?B?bE9BcWpyYVNOS2JvY21YQ0xVSzdTMlhWc2xjZ1dKb01MallPMDdrTExENnFS?=
 =?utf-8?B?d3ZEUXFlKzVacmRtWFd1c1k0L1MwRXQ0dmpRQlJTWjFsNThQd2lzczhUZ0FQ?=
 =?utf-8?B?WnMzK0ZFNkMrV0dkejVDS1ZZYXp1NWErMU4zc1pIbUo1MWhTYmlyY2NCb1JX?=
 =?utf-8?B?MG9VMldXTUtDZ3p5RlozTlVQUkpBNy9EdVQ5MklzUFpTbGhmVHlxdEE3YjE4?=
 =?utf-8?B?dHdrSG5lMGMwaDZFNkxQTk1EOHBVWXAxdHZONTMwdi9VdFk4UitLZUtseDYz?=
 =?utf-8?B?RXJtbi83SDZBUWI3RklWQis3SlBOT21Ia2pNOVFZM1RpallxMlJEcjdZdEdj?=
 =?utf-8?B?ZVQ4cmxTenllcnEwTUJFYlJuWk55ME9GWDVOK3p6ZDJRYWFoOXdTelBvcDZB?=
 =?utf-8?B?ZWtRKzZ5UFVQRWkvVTlsdWNMZXBxZlppZWVLOFZRamZ6UklEWEprYjdVcEhl?=
 =?utf-8?B?bUlxOUo1aTNicjVxZjVLajdsWG56WnoyWVl6T0NxTXJwYlZxSEs3MFJvZzd0?=
 =?utf-8?B?MVk5M2N5Wk1WTGlOb21LRFdpdTU5VHpCUXJ3WUtmSmxVTmllUE9GZDZoYVZ6?=
 =?utf-8?B?WXdyMUpEeUprdVlpQmgra0RrVGlybGZPUXM3dTNYVjgrT2RJMVNDR0dTdlZ3?=
 =?utf-8?B?eDc5b1UvTkdJUVF3ZnIvb09lSlU2Zm1QQm1CRllzTWpHTmdmVk1aanpHVmto?=
 =?utf-8?B?dVRPS3k1ODUzSm4wZi85U3JiaWZOUEFxdzdOcmZNZC9VZ01Jb0tpSGNrVnVn?=
 =?utf-8?B?WE1tVkNWc1RhZWZiNnI0ek41SzE5ZHNLbVVSRE5BNGJDTjJycTdKUlhVck1a?=
 =?utf-8?B?dkRUNEIzeXdtK01IQlZrOGVvVnhpd2xvaGVZUnZMM3g0RGN4dWhFRk94U2ww?=
 =?utf-8?B?bmNNUm9mZmlLaE02RmpHRGFBM2lwVlpFcU0rVmVoQ2NxWEFJVkJkUEFXVXN3?=
 =?utf-8?B?VzYvdzF5Q2NVYmE0SUplbnZPcTJZOEY1c2RYQWRjZjdqdmJXSGZvUEZHQ2Zi?=
 =?utf-8?B?TVExVG5QOEJ0elM3NFRDbGxNSTFtcENKYlkvdzBUaDB3UkljR21hNjJLZis5?=
 =?utf-8?B?TUZ5WWVZbzhPd2ZwaUgydDFJK0syU2ZCZUhGT01wS1FJakRmMWY4SzI4eGlF?=
 =?utf-8?B?SUlyYkswU01PSmpnRklETFhOSm9YYUJMZDczSHkxTXU1d3BHMzVCV011SnJN?=
 =?utf-8?Q?fWwZIZhQqqc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6135.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emJJaXdiWE1vTGVMS0ZxUTlodFNMejhGRTJFRXF1SXRWMEV1NVlhQTRDL3ZT?=
 =?utf-8?B?dTR5SzZRMjVBZ2diZDZucGs2eWlXTll2M2xERi9yMUlHS1B5Y2l0UXdoeVgz?=
 =?utf-8?B?b3gxNGJQcUdIczhBbml5UDUzTjJHS3YzalNMY0hXZjRsVHRzZy9jakZObWlE?=
 =?utf-8?B?ME5yNU51ZHo4SHV2U1FnVXlmenczYW5vMzl1OHI2WVZ1bHp1UmRPWjFMcXNZ?=
 =?utf-8?B?T1dwZlNoc3hOQmhxVEhObzZIL2Nzc3Z0K0FCVE5NRG5Yb0E0N3BMb1NtUGZK?=
 =?utf-8?B?a01PZHMxdStjY1ROakkxaElYNDRXeDY0N2xiZEhwMDF6alBzOG5id1g3YkZq?=
 =?utf-8?B?UTBMaHQ5ZmRVeGlEcEtGb1JiWXozeUoxTitsRnhvOG5LbE1mZ3NJTUowVnBC?=
 =?utf-8?B?dkl6YUdDM2w3Mm1JUmJPMGo5QXU0QXNTOEQ5Mnc4aHRJVUxvSEV6a1dMOEZa?=
 =?utf-8?B?R1ZVQ1pTamxDdTNIcFFIL3NFV29kL0ZDbzBnM0NyN29GUTZreXJ2RVNIUUNM?=
 =?utf-8?B?djgzc2pOWmlMOVRSZGdQOEx3M2lXU2tEaDZNTS94bnY3MTJ6Qk9HeEU4MVIv?=
 =?utf-8?B?N083aEE0QjNBTVRFWWd1QW5HOWRVc1pjLzVnTlVmQjdZOVBidDZrVGZPUktv?=
 =?utf-8?B?NXJBWEUrb1NadHRSTUpuaENIMXhzalRWRXIxRWdvTWpkY2lNN05kd1M4VExZ?=
 =?utf-8?B?WUM3dUVsdjZ0SVowbmRzeHJBczZYa01NaDM4UUN6MWMxbnIrdGhTZ3ZJKzBX?=
 =?utf-8?B?ZjNZQkROUlRaWkVnZi9SWTBFWGZlNWtmampiZVZtdWtZMDdkc3AraG1tTW93?=
 =?utf-8?B?R3p6dS9xZXAwS0tSaHRlYkREaXdpcWI0QTBHa2t4U2VvTnF0dEhoR1M5aERJ?=
 =?utf-8?B?alBsUGozeGZCMlZ5T2xGaUE3VGN2RU1JZGxyRlFtZit4T2FJVm9mZFdMMW1i?=
 =?utf-8?B?YmNKbWNqQnQ0QStxNThQTVAvQzJpMk11OHNVWmZsMTUyYVJHMGFpZ2dUWnAr?=
 =?utf-8?B?YnRPL1p3Z3BBQkZ1anRXOTZzeldxU1VXYW0zdzhKWk81MnVOeEE4dEVJdlhY?=
 =?utf-8?B?cHB4U1habmVaVUVOLzdtdGxWbCtGUjZEeVl6NjNBclZyNFU2ZUZTVkt5M0sw?=
 =?utf-8?B?SUErc3lnc1d1djVRTjVYSHlRZzQyWmJPeDlTVjdUZXBJMTJRZGN5ZlZwN0c1?=
 =?utf-8?B?d09UN3BrOG1yNW0wTERua2VZaDJaMVVEQlMxS1d0Z0pSd2FxNlFENGJmeThq?=
 =?utf-8?B?NHJOLzlrVlZkcGxkb2NaVmIwMzZib200K3lMM2FxdWc5Q3V3OVMxZC84SXNq?=
 =?utf-8?B?eUp0NmxTcHpyQStHK2FwSmtBQmhFUEZMTWk0TnVMdW4wS29zaGgwZnYwaC84?=
 =?utf-8?B?S21NS1ViV1E4WXU0VVd4ZmxoekF3Tjd0ZzU0SHFHREFoLzc1MGJKY0xJVjIx?=
 =?utf-8?B?QXd2bnpTd3ZaZ1FITmJIWmxIZk5xaEZDYlRNSXBjTGZaZjJiWmNoOWQxQTFV?=
 =?utf-8?B?UllWQjhwcmZKR1RjZEx3WExQdi9temlxTTV4OXRtaGNvcll0R3hhMERxcWlz?=
 =?utf-8?B?SmhLRTBqdEFOOUdiSnU5UlYvY0lET1gzQVhFTWcvMVVwNjJsWFRqMHVpVURH?=
 =?utf-8?B?cjQ2bVQ1bFpaQ281cFJsUWQxZnZlWFppKzFrbi9BblZhS3lVN3d1T1Nmckdy?=
 =?utf-8?B?b1RKQUZ6TloyQ1p2cXd4Tkx1MWtOaHVFcGpSZVRoRVZQTEpOMkJkVDUvQ0x4?=
 =?utf-8?B?azMxcmJ0Z05qVWhSbGV3TFBkRkM2RFpvRHdDMHJ6YXJ1QllYeDBFZ1BMdnRL?=
 =?utf-8?B?cnE4elBhd1ZxY0Y4b1RVaVZReW1oMUZiWmRFL2RrSW1sSW1oUTk2M0tEOTdq?=
 =?utf-8?B?Tno0cnUyN1R2dU1KOFl5N2xlTGg4UGxrNnhLOStMR2thY1FyYnFQQkd2VU9w?=
 =?utf-8?B?RkxwcnVqU2Z4TU5NZGgySkg2emExdzF3dUVLRjZpVnU4WGlxNEg2RmE3M2s1?=
 =?utf-8?B?cjl3aklqVnk3M2JETTYxL0pOZzlVT1F6ZlU2clZBa2ZXUENNODBRZTEyRERY?=
 =?utf-8?B?eEZPR0dtM3Y4L1Z3TCtjeHdOOGZtUTJNZy8vZUZyN0ZoalpibzZQNDZUS2xX?=
 =?utf-8?B?ckE5Y3ZkZVltTjNPZG9VOXBSV3Avek1uSm9vNDdXWE5ESlUvVmFMdnZqeGFQ?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0527f13a-2c85-4e37-8583-08dda20c9b56
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 19:35:19.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+iu9muQsomPG5gklWYDKWn6Zmgt/XcY4tI4V6J/odqh90uUDc1k+jOVeYV0xHMgPCunmUP8E64vspwVCsV5fq3TxWXSYQHE3Fae+6qH2/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
X-OriginatorOrg: intel.com

On Tue, Jun 03, 2025 at 04:00:30AM +0900, Masahiro Yamada wrote:
>On Mon, Jun 2, 2025 at 10:06 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> In the old days, KBUILD_MODNAME was passed to C without double quotes,
>> and then handled by __stringify() on the C side. This was the reason
>> why KBUILD_MODNAME was mangled: characters such as commas (,) and
>> hyphens (-) are not allowed in C identifiers, so they were replaced
>> with underscores (_) in Kbuild.
>>
>> Since commit f83b5e323f57 ("kbuild: set correct KBUILD_MODNAME when
>> using well known kernel symbols as module names"), KBUILD_MODNAME has
>> been passed to C as a string literal, which allows any characters.
>>
>> Aside from this historical behavior in the build system, there is no
>> longer a reason for mangling. In fact, it is rather annoying, as we
>> now need to convert between hyphens and underscores in some places,
>> but not in others. See commit 0267cbf297bf ("module: Account for the
>> build time module name mangling").
>>
>> This commit eliminates that oddity, so the module name will now match
>> the filename. For example, the module name of "foo-bar.ko" will be
>> "foo-bar", not "foo_bar".
>>
>> However, this oddity persisted for so long and also affected the
>> userspace. To adapt to this behavior, when a user runs "rmmod foo-bar",
>> kmod converts hyphens to underscores, and passes "foo_bar" to the
>> delete_module syscall.
>
>Hmm. That was modprobe/rmmod from busybox.
>
>kmod tries to open /sys/module/*, and
>hyphen/underscore conversion happens everywhere.
>
>libkmod: ERROR ../libkmod/libkmod-module.c:2039
>kmod_module_get_holders: could not open '/sys/module/fo_o/holders': No
>such file or directory

the dash to underscore is done everywhere in kmod (and previously in
module-init-tools), otherwise we couldn't reliably compare modules by
name, open the right sysfs file, etc.

$ git grep underscore
libkmod/libkmod-config.c:               if (underscores(modname) < 0) {
libkmod/libkmod-config.c:                       if (underscores(alias) < 0 || underscores(modname) < 0)
libkmod/libkmod-config.c:                       if (underscores(modname) < 0)
libkmod/libkmod-config.c:                       if (underscores(modname) < 0 || options == NULL)
libkmod/libkmod-config.c:                       if (underscores(modname) < 0 || installcmd == NULL)
libkmod/libkmod-config.c:                       if (underscores(modname) < 0 || removecmd == NULL)
libkmod/libkmod-config.c:                       if (underscores(modname) < 0 || softdeps == NULL)
libkmod/libkmod-config.c:                       if (underscores(modname) < 0 || weakdeps == NULL)
libkmod/libkmod.h: * it's always normalized (dashes are replaced with underscores).
man/modprobe.8.scd:(automatic underscore conversion is performed). *modprobe* looks in the module
man/modprobe.d.5.scd:them: both are interchangeable throughout all the module commands as underscore
shared/util.c: * Replace dashes with underscores.
shared/util.c:int underscores(char *s)
shared/util.h:_must_check_ int underscores(char *s);
testsuite/test-util.c:static int test_underscores(const struct test *t)
testsuite/test-util.c:          assert_return(!underscores(val), EXIT_FAILURE);
testsuite/test-util.c:DEFINE_TEST(test_underscores, .description = "check implementation of underscores()");

I think it's reasonable to apply
https://lore.kernel.org/linux-modules/vqeq3ioklrgrf227zgdfho4virh74qrt5reoyptmzgktyronbr@c2mw32pqikft/
otherwise there's also an implicit conversion needed for '/', probably
moving string_is_vfs_ready() to kernel/module/

Lucas De Marchi

>
>So, we may need to carry this forever...
>
>
>
>>
>> Therefore, the mod_strncmp() needs to remain in find_module_all(),
>> otherwise, we cannot unload modules.
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> ---
>>
>>  kernel/module/main.c | 8 ++++++--
>>  scripts/Makefile.lib | 4 ++--
>>  2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/kernel/module/main.c b/kernel/module/main.c
>> index b8440b0887e3..1fa90a95e0c5 100644
>> --- a/kernel/module/main.c
>> +++ b/kernel/module/main.c
>> @@ -410,7 +410,11 @@ struct module *find_module_all(const char *name, size_t len,
>>                                 lockdep_is_held(&module_mutex)) {
>>                 if (!even_unformed && mod->state == MODULE_STATE_UNFORMED)
>>                         continue;
>> -               if (strlen(mod->name) == len && !memcmp(mod->name, name, len))
>> +               /*
>> +                * For historical reasons, kmod passes a module name with
>> +                * a hyphen replaced with an underscore.
>> +                */
>> +               if (!mod_strncmp(mod->name, name, len))
>>                         return mod;
>>         }
>>         return NULL;
>> @@ -1135,7 +1139,7 @@ static bool module_match(const char *modname, const char *patterns)
>>                 if (*sep)
>>                         sep++;
>>
>> -               if (mod_strncmp(patterns, modname, len) == 0 && (glob || len == modlen))
>> +               if (strncmp(patterns, modname, len) == 0 && (glob || len == modlen))
>>                         return true;
>>         }
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 336fb0d763c7..e37e2db5f528 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -18,8 +18,8 @@ target-stem = $(basename $(patsubst $(obj)/%,%,$@))
>>  # end up in (or would, if it gets compiled in)
>>  name-fix-token = $(subst $(comma),_,$(subst -,_,$1))
>>  name-fix = $(call stringify,$(call name-fix-token,$1))
>> -basename_flags = -DKBUILD_BASENAME=$(call name-fix,$(basetarget))
>> -modname_flags  = -DKBUILD_MODNAME=$(call name-fix,$(modname)) \
>> +basename_flags = -DKBUILD_BASENAME=$(call stringify,$(basetarget))
>> +modname_flags  = -DKBUILD_MODNAME=$(call stringify,$(modname)) \
>>                  -D__KBUILD_MODNAME=kmod_$(call name-fix-token,$(modname))
>>  modfile_flags  = -DKBUILD_MODFILE=$(call stringify,$(modfile))
>>
>> --
>> 2.43.0
>>
>
>
>-- 
>Best Regards
>Masahiro Yamada

