Return-Path: <linux-kbuild+bounces-4692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F79CFB47
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 00:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BCAA1F244DF
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 23:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDCD1A00FE;
	Fri, 15 Nov 2024 23:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjeFb1nQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C14198E80;
	Fri, 15 Nov 2024 23:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731714264; cv=fail; b=X4AMMFAXg+7eiMNUcW+Xy2AWb9YoNli8EjcPE8G51pNV9Tj66oUcJCKHEOym2KkdZ22J4T+qQQprMGQkBvtPf8Kq5LusYPoJCp3HB86jzjKS3m0YP//mvBv3NH1ePx0aZw+/gT7S0yFfPqPF5chcz3hjYvLui1+P/2bL5j0Kj4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731714264; c=relaxed/simple;
	bh=73Lhw/sKw9c8YYM5TXR+35gF1PVdtHSwM9U8j/KDggg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sbkNybi+fg+Yax5gixqwS/6TJc5FHuhPKkMiusn96xfVKDEaaiGIjEOxF87mjMObJ5MqJyVj5bDIUJQC5+iAbm+3G1Ve1u5dWZquQgLak7pmw4gKASqzmcteyd9hvNenZb/uSqY3oNH7tm3M/JXysRseK6MGZvZpF8ePINjRgqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjeFb1nQ; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731714262; x=1763250262;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=73Lhw/sKw9c8YYM5TXR+35gF1PVdtHSwM9U8j/KDggg=;
  b=cjeFb1nQF3OExsmEPYqJruYSoZLYXsjHeQy81uOM3FjBdvbHB5ImUtfk
   My1rzgQFAYPceg8erFhYo+l+c+tHnMySTdR3lqbQPOuqwrQIpvoXW+odP
   OANy7yEpcpqbAYnZQka+caKBSukk/j3QWcJOllKTHSJnrJVRNlqlenROc
   VtpxpF0ofwF1U9H+NbQbtC93L8D8Obl9Axi54nUtMEGOHFUEmxYlHeCml
   t28yuZn3lTPtNnjscT1Ma8Yi1SLDCttFtUIHHoiFKY3K0mJ2lm93L5KZh
   lGTt+SSlviA1MrmhFM+s10+uBP6h3MIvDQ1QWu6pqz7okUGGW+e489N+4
   A==;
X-CSE-ConnectionGUID: 84Dy+RhYTIyjxMaLc2Yz2A==
X-CSE-MsgGUID: +O8HJEGvRnmpInu9AgVF9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="19348369"
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; 
   d="scan'208";a="19348369"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2024 15:44:21 -0800
X-CSE-ConnectionGUID: 3D2WDu9yQIiR9aE0WM6GOg==
X-CSE-MsgGUID: k6QtZ/b5STes+vJjzqwoaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,158,1728975600"; 
   d="scan'208";a="88278688"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2024 15:44:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 15:44:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 15:44:20 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 15:44:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYMrJTb4njl1tObWVi1tfoddAp40/EEPt3vKhU4H1c0e/IfFThTvzxGw2tfKaIJh529fugWjy8WsLqFXmOD9FWCaoDa8IAbRMTJd7QQQh+zCi/9Oj2FwvXAulu5JM/sJQ/imdBRaJn0r3r4w/DN0aBba1T9DDmpBypI8Vo6bYQIOqkeVm6+Yt5Q+iFEO7osBrFsAaQcc/RX0w75XbJ9A6V6nYGlo+SjehIi3H/FFEDg4u4fZ+gQEa4LshaEsWvAOaWMLH8CrU60OhqFzOr3B/HO7qvzM6DNqwC03c+ryvdVhj+14mVUIdNRTA+/QFIsC+XAfWIZOfEQoM5BxQawPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpzGt7LVQYFvSxJ6r/88oaOSQdtkO21tWycJ06o01ic=;
 b=oGg6H4j+ca97vdwwcUbonkpuiXhk2K0LPNLUATCutnxsw1xvqbWL0RTeBzAqND4h1CbEDnxABziGvGtYqUZ+IT4iHhzjniHEYBZLgpUOFm/O+JGEJdycU/Ffq9neT5vOwv4icp7VGl9Y3TBrVcKo2Ly48QIG7vA3R4FKVdNYGHAQECH4os38jxZengwoUkFnOmGg/eVGSYUSwZfljmJJBCHTAwvcHeiBPUDoDqwSHmYCRxxFOJW4atmvl98FMwrlqteUQ6NBaMi9Uejg6r6LJrpFIE98Ntb1EBYhAHk/1wXuODSwNY6y93mWSrBQdl89TH9m9cV1BfvMo2JVOX2BGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by MW3PR11MB4603.namprd11.prod.outlook.com (2603:10b6:303:5e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 23:44:12 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8158.019; Fri, 15 Nov 2024
 23:44:11 +0000
Message-ID: <0083a475-a573-44bc-8f8d-595b0bd3b675@intel.com>
Date: Fri, 15 Nov 2024 15:44:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and
 unpack_fields()
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Vladimir Oltean <olteanv@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	netdev <netdev@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Vladimir
 Oltean" <vladimir.oltean@nxp.com>
References: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
 <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>
 <CAK7LNARAsyOparQ1YxgPh9S4A-uzF04k+91t7Xy1jdTy6uT+Vg@mail.gmail.com>
 <5a666ac7-4026-4d4f-b2dc-74a124055f21@intel.com>
 <CAK7LNARhMDEMZFjC1tU5oHefGocxwBC5=Vyy9Q=bx3VvQyssVQ@mail.gmail.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <CAK7LNARhMDEMZFjC1tU5oHefGocxwBC5=Vyy9Q=bx3VvQyssVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:a03:331::15) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|MW3PR11MB4603:EE_
X-MS-Office365-Filtering-Correlation-Id: 020bc220-cef9-45de-11cd-08dd05cf67a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1Roa0ZmVHp0TlBkb2ZqQUtBdXBKVG5xdkY4Tks5dzM2VXFEd1Y1UjV3RnVM?=
 =?utf-8?B?UWVoTHNiR2YrZ0x0K1d1OW5rN29jTEd4RFdPTUxXakVlcFI2MFJPZkFIWURr?=
 =?utf-8?B?QnpMQVgyZURXTmZDVjRIU1A1RStjSzB2WU9WeS9sSEpGR2g5aDl0SllUdTN6?=
 =?utf-8?B?ZlFNRm9YT3BlRXd3VXowY1VRMEo2aXJWY2ZTa1A0ZHBFZDJ2KytIVm9QUGtk?=
 =?utf-8?B?cU4rRnAxZDRIcjJieTJZVUl0UlMwUGMzZzBUeDZBeDRhL0xTRkNvRGVhWDF3?=
 =?utf-8?B?ZXVzeW9Pa2R6ektMTmMxNGxjVjkydDMzUDUwbmpZNzVoTmhKTllxcUdmdFJ5?=
 =?utf-8?B?WG5EUEIyK0h3L0tQdi9FbEoydHI5NEIxelVqWWJhbUowalh4ZjFlL2c4YlBX?=
 =?utf-8?B?NW9CYlJWdERqUXg5RGhhN3hocDdCdjdUci9YMXRmV05QK0loYkhGblRveGh2?=
 =?utf-8?B?ellxa050QTNFbGxQZWxybGtOeEJQYlFMcmdBdnk3YXcyV0ROa2RBcmQyaStr?=
 =?utf-8?B?MHRrazRwWG1hbHN1Y0FVS3dLc1lJMGxQZlhlMExSY1FPL1JjcDhlb05sMkJG?=
 =?utf-8?B?N1pJTkNQaGphWTVGVU9Ld3VmVG9qRFpIQ3huSmVJZDI4ZGlKdVRUUVBTSWZB?=
 =?utf-8?B?azZuN2hWM3hxTGRDN2dyZnFJYlVHV0pxZWkxOUhCVVZ1R0RFSEdnSFNlOXBv?=
 =?utf-8?B?cm9lVGR6YkI0ZGlJa3RrdWd2VFBlN2dQS3ZCYW5FeTcwRWlpcmVvUXE3N1Bm?=
 =?utf-8?B?TGJydlE4NlRyZzdlbWRiQXN5TmVDVWNZRUJ5cG0rbEY5US9BenBGK09WOUJF?=
 =?utf-8?B?dmxZYjFYdnZBaERvVjcxSVcva2xYSlRVaHIxd1RDOVV5MFcrRHg0L2RRRTU2?=
 =?utf-8?B?ZmIvNWxTajNncG96K2c3K3VSaTk5VGpVY0lycmd4K2dvWlhKSGxzdk5JRXJS?=
 =?utf-8?B?a2ZHbU5HT1VyUS9PL2xSeXJpa3k5QzZIeVFvSkVKRndBdE5ndFR3Yjdna29a?=
 =?utf-8?B?cjAxUUhIbk1NbEFseE00ZkVkRHF3UmlQclIyQWU3d0FFd1pUUzZLei9QN2lY?=
 =?utf-8?B?a2dVYkY2UUZOSTd2UlZFTDVyckl1Zkl0K09ab0FqQ0ZOUFlvdU9kN0N1eGZ1?=
 =?utf-8?B?Q25rV1JlSCsyRDA5dElkUzdLUTJ2S000RDNacDFLanJlTDYwSnVFdDg0R0xr?=
 =?utf-8?B?d29PbTBMYk80SnZXN0oxUnZONWZwUWtZU2RhVkZ0Y1NRd3I0UzlCRU85dE4y?=
 =?utf-8?B?Q0liY3lIbW1xekx2Nzh0MjdGeFMzQTV3T0ZpWmYzcVg0TzVWSGU1Ymgwakov?=
 =?utf-8?B?RkJGSEI1R250OCtTNFphNGY4Z2hZYmpvK0xXOXRkdEVzRzJIdGkzMUtEUDJB?=
 =?utf-8?B?cDkwWlk2VUNWU3F5TTdJSnFweXhQM05Gemc5WEZVa1MrNlJUSW0vSGF1L1Jw?=
 =?utf-8?B?TGxqSldKVkV0ZXJhZTFGM0I0V0lsUllMUU1UdWJnZUlmNDI0akh4SEdjeDdN?=
 =?utf-8?B?cS9NSEd3dDJleG5PblhNRjBaQkQzTzhRd1BBMXRUK1daUUN1bXh0OTN4VFAx?=
 =?utf-8?B?MklrcDJNZ2c4ZDJSWVdoRWVzRnFEZjJubXJsYXduNVRiSlhOVUxhU0J5eVlZ?=
 =?utf-8?B?VXpDdzR5SURRYW5nc1MzdU9UUG5DSWJSeCswbG01S3dHYU41VE1lamZXeHA2?=
 =?utf-8?B?ZzFmN0RXdC8vaXl3dmh4dFBRNUtJbFBEd2ZkNnI1SlZYMXFRZEx5OVBDYnNr?=
 =?utf-8?Q?Xm/NamkvtqmSw68hNxqUHUMO23hkhULNFHi0+QL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXlydC9LdHdkaWxYZ2JSVGNnS2F5dUhpNUpYaUpFY3FFVHpiNTkzVXIyTzUx?=
 =?utf-8?B?cjczdGJ6OFZjTm93YURIRExQcWFuanM2dGFCRmRyK2RzWDhaNjlIVXVaeFdN?=
 =?utf-8?B?M1oxY2lMREZXTGtwK1NNQ1FWWEhjRnR4bTVpUm02azkyckdXV2cxeERpZnhy?=
 =?utf-8?B?S0dMdVZ6MUFaWU9TVW0vajNBcWlNQjFGSTRtU0pyRVBCRWxQSi9oS1F0anRP?=
 =?utf-8?B?RklkRGpWaGZ5T2dER20xenEwYmI1Qi84NkFidnN2U0tJcVpoT1Y4VUZ3WUQz?=
 =?utf-8?B?OGdhU3BQZVZXektyT1N6RW5sK2h1bkYvcXVYYjBuNUVQRm40aTZYeW1tL1RU?=
 =?utf-8?B?b0FFck0xekZwaE8zMUdpMStQemgxdUc2RmdZU0c2cjV4S0JBMDNBb2Q1U21V?=
 =?utf-8?B?RFlEWDNIRHNIZmRjMTBKcFh6MjFHTTN1VmtvVG93QzNLQ21BT2ZPdzJURDZD?=
 =?utf-8?B?dVpTeE0veXhWemVDWnFuYTY5WmNGdFNvbnQzc1dQY0RwT3V3OENyNUNUZnBR?=
 =?utf-8?B?S1l0Y2JDNHI0Tm9rdndPNDhzZnZ3STdBL1Z1K2h4WDJHUGFPM1ZCZ09KdTh6?=
 =?utf-8?B?R0tPOWtyWExJazRQTGFLb3AxOUZRVHdIdkVDVTFxSjhTVjlGYzlPK1c4OWoz?=
 =?utf-8?B?RE1pSkRnQ2ovcHRVbW9KSFVlRnFZOS90TkFIK0oyUFNHNWdVUlRWQVJvZmdZ?=
 =?utf-8?B?amVQekdudGxkN01xVmFzQzUvRXdTdkg2Wm9ZczBldGpqMzhoVG55VS80ejBF?=
 =?utf-8?B?eDBNeU1hQ29FY2U1MHFqWmJtUEJJMmwxYm9janM2d3lrSGpqZUwrSnpjQVRo?=
 =?utf-8?B?M3pHcVdRTG11ZUtvMStDb3MvMk5DRnVUT3Y3c054T3g2VDVOYVJ1SStaUXli?=
 =?utf-8?B?K3h1bGtTM1ltc1NkdDFFVDJhZWlydFBNck9xckJjWk1lZzBLY3V6VlVMMFll?=
 =?utf-8?B?TzQ5WVNva3VMTnBuTkwyNVVrWFZXTWUxTDllY05tN1NIYmkzOUJ3aVN6eSsy?=
 =?utf-8?B?YTZORHZncmUzUE03VCtDc0RMTHE0S2dmUzNnWUVnbEdLaTZ2ZUtUbEVzRGZJ?=
 =?utf-8?B?cis5KzZDSmdQNXkvVEhLWlUrdnFkWklBWGorWGljYWxlNENGZnBPL1IvZHZP?=
 =?utf-8?B?ZllJbkptMmxCbFNkRXkxWk96aHFyZEZIUkFNQzdGbDFyT21UTUZaaVgydEVI?=
 =?utf-8?B?TDM2N3lMaTR6Nm5LOVZKeG1Kb0ZScGhqTnJHamhvZmdya0luc0Fkc2Y4Z1dD?=
 =?utf-8?B?b0liMVcydVFvZ3hmMVcvaDJuTTlsRXZQVjVkZitOY2RGb3g5TWVyODY2NjJl?=
 =?utf-8?B?VVA2bTI3TVdUbFVUWDdIQm8wNWVZam9JS2FzdW9PcnZZY1BBcUlqWDZGb29w?=
 =?utf-8?B?ZVc3ZnJhODZJZTNIMkVlZUxHNkhrbS96dmgzbTRha1BQZEhaL1RjZ0pFbDVB?=
 =?utf-8?B?SjVhZE5ZWEpZUlIza1dlZzdPM29WekdJM0JRN1IycTJqRVVNSkk4MmthTGRG?=
 =?utf-8?B?SWQ1cW1TbUtUS0pocyt6Z0ZqTlIyZm1taVJUK1VacVFEbSs4OEFyRUpuaTBR?=
 =?utf-8?B?NmRhYWlkTXNuMTZpVCs4eTBTSjhWeVNlSDYxdHk5Y1g3dDBlMHBRK21RS2pD?=
 =?utf-8?B?OTk5Q3Y5M1ducjhma1JsR3JaTFQ1Z0ZlbE5LQUQ4Q3hmRHZidEpXaUF5ZDhr?=
 =?utf-8?B?TCtOUnRkNnVIWWE4K3h1N1ZnVlNqYjN4Wml6QWZ4a3NxUWx0MFc0L2tJT0xt?=
 =?utf-8?B?ZGhsdGd6YmxhUEowUktZa2RabWluZmN0KzdHbEpRUU1FdEExL0g2Wm8ybW9q?=
 =?utf-8?B?T2tvL1NPSzh2MXc4ZmFLNFJtL04zNWNhYi9Ub1M3cGNkZzZ4UURsRXFBaFFH?=
 =?utf-8?B?eVBVM2Z4VE5YVFMrRXNMcGRSZi81RU91N0tZQXp1VTJEaHhVdGFsSXdialpS?=
 =?utf-8?B?Wmdwc3RsalFyN3dhUTFMZUpWMFZ6VEprdE9IZFVFVWgwREt6Nm1HZUNLVGhQ?=
 =?utf-8?B?TlpYMFhTenFTc2JFQ3ZjTVBGU09LTVlWK0k1a0JIS2srREo4SkRVa3NKdElZ?=
 =?utf-8?B?M2ZnUHU0ZHFSTjVyNUkwSlJNZnYzWkxDSGxvYmpZTkZYMDREakxocWc4SVEy?=
 =?utf-8?Q?q+Rd3U7AbD7qk1Sq74v3D88mV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 020bc220-cef9-45de-11cd-08dd05cf67a0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 23:44:11.2740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmnZuka0FKLOcWCH7zLxsLsWrauGl5avyIyDgize1o5YIhzizwGOWSc+Kr4P82pQX5hcICjZ8T0lHN9lGdEQ4sxyEDV5dDsSyEV2kqZBNZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4603
X-OriginatorOrg: intel.com



On 11/15/2024 12:48 PM, Masahiro Yamada wrote:
> On Thu, Nov 14, 2024 at 6:04 AM Jacob Keller <jacob.e.keller@intel.com> wrote:
>> With the goal of maintaining compile time checks, we end up either
>> needing to use generated macros which are O(N^2) if we allow arbitrary
>> overlap. If we instead allow only only ascending or descending order,
>> this would drop to O(N) which would avoid needing to have 20k lines of
>> generated code for the case with 50. I think we could implement them
>> without forcing drivers to specifically call the correct macro by using
>> something like __builtin_choose_expr(), tho implementing that macro to
>> select could be quite long.
> 
> 
> WIth Clang, the following check seems to work,
> but with GCC, it works only when the array size is small.
> 
> 
> #define PACKED_FIELDS_OUT_OF_ORDER(fields) \
> ({ \
>         bool res = false; \
>         for (unsigned int i = 1; i < ARRAY_SIZE(fields); i++) \
>                 res |= fields[i - 1].startbit < fields[i].startbit; \
>         res; \
> })
> 
> #define PACKED_FIELDS_OVERWRAP(fields) \
> ({ \
>         bool res = false; \
>         for (unsigned int i = 1; i < ARRAY_SIZE(fields); i++) \
>                 res |= fields[i - 1].endbit <= fields[i].startbit; \
>         res; \
> })
> 
> /*
>  * Clang cleverly computes this at compile time.
>  * Unfortunately, GCC gives it up when the array size becomes large.
>  * Turn on this check only when building the kernel with Clang.
>  */
> #ifdef CONFIG_CC_IS_CLANG
> #define PACKED_FIELDS_SANITY_CHECKS(fields) \
>         BUILD_BUG_ON_MSG(PACKED_FIELDS_OUT_OF_ORDER(fields), \
>                          #fields ": not sorted decending order"); \
>         BUILD_BUG_ON_MSG(PACKED_FIELDS_OVERWRAP(fields), \
>                          #fields ": contains overwrap")
> #else
> #define PACKED_FIELDS_SANITY_CHECKS(fields)
> #endif
> 

This definitely seems compiler specific.

> 
> 
> 
> 
>> Otherwise we can fall back to either module load time checks, or go all
>> the way back to only sanity checking at executing of pack_fields or
>> unpack_fields.
> 
> Is it a big deal?
> One solution is a run-time check (for GCC), which is a one-time
> for booting or module loading.
> 
> Another is to rely on CICD running with Clang to detect overwraps.
> 
> 
> It is horrible to include kernel-space structures from user-space
> programs that run in a different architecture.
> 
> file2alias.c does this because it is only possible at compile-time,
> but it is always the source of troubles.
> I am search for a way to generate MODULE_ALIAS() without
> including mod_devicetable.h from modpost.
> 

Yea, I agree modpost is pretty ugly, and I'm happy to drop it.

I think I've managed to get something that works in GCC and Clang with
~3k lines of macro vs the original 20K lines we had for sizes up to 50.

The version I have now works, but does require the 3K lines of macro to
effectively unwind the loops.

Its also slightly brittle because some slight alterations of the checks
no longer get detected by GCC as compile-time constants :(

I am not a huge fan of only testing on CI, since not every developer
will have things go through CI, so we end up with late reports.

I'm going to post the next version which uses the macros again, but
manages to limit things so that the calls are all done from within
<linux/packing.h> without driver intervention, and seem to work reliably
on my test systems.

> 
> 
> 
> --
> Best Regards
> Masahiro Yamada


