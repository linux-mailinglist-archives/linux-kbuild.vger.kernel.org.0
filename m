Return-Path: <linux-kbuild+bounces-8306-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E0AB1C8BF
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 17:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 533BF188D517
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Aug 2025 15:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A74221F15;
	Wed,  6 Aug 2025 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUgGx26U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CFC2E370A;
	Wed,  6 Aug 2025 15:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494266; cv=fail; b=EqciQ/9PCcJ9GAkVSUDof+66VZOFOFLZpYDiiVicEWBqclA1+eZcgm6cQ04WFLwoOLg6+EN8ARQkGvhmhBjr/DJGge1SKsY7J3057xvfZClGCvsSIZ0oyw9LcQXy4OK+x51v2yAd/4TrS2vO+N/s0x9v6lZCFXMKUpPrkC/utXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494266; c=relaxed/simple;
	bh=fct6Gxm8MLlLKmaWleSTK4ceXpHScTv+aWYPS5lC51E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rlZP2DEkCQ/Fu7f+LYtxj/TLzbbisNDgqvkJ6p/x+rlhxXK32FJxXkKptZvAkASxORkqlCKwyYeJ49n2nTbPOA8yXXc03NwA/DdincvxDa9CV2Eyh5OQ4CUZXLyJA6UBjmc4zcvDIlG90FkRH61rf8pZav/7+4zc0cRhqh50c18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUgGx26U; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754494265; x=1786030265;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fct6Gxm8MLlLKmaWleSTK4ceXpHScTv+aWYPS5lC51E=;
  b=EUgGx26UJVW49m3ON/mfKZnMIulEFLcmrBdWP73XdpIHCv8pn4h6c/or
   RP2yiD+Sxz0KCWZg9sSHMTX9uzX9VDOn2qU+ZyOsTuTWgDSK17foQpiX3
   Ug7UWzaUVlz+FlyScOfqow9sjQgVOLlCQxuo3dciUkc2xr+kW9aJr1GV/
   XvvpOPTRm7t7Z54N7/HNyqQrKdEfQsmLu052Wwl4r8JpwaFCkqGhY2ex0
   DtLSEpxaqz9zGZ/4oNmRVzgnOQTikc2qYqmb+Y3M14/UcYmd7VWqaUfGM
   jKzlWRPaX1zEkcyrSOoUDUF4SGf6Yabi/3jTTLcfArZN5ZoA0WIvzPMic
   g==;
X-CSE-ConnectionGUID: LA0OhFqERAOKRgq+gHxPFQ==
X-CSE-MsgGUID: 1r1V8FB1SHqf50TjlcfaCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74396800"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74396800"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 08:31:04 -0700
X-CSE-ConnectionGUID: XfqOhUkMRrabs4qSgbGCzA==
X-CSE-MsgGUID: 2ALcnMSPTzSA3qORjvT+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="168926006"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 08:31:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 08:31:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 08:31:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 08:31:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exjEkw+oM+DbQjou+ZzZlcgh6/4sYoISe58izN8BFbuzZtajrp1tUMu3zD611HDj7pSSeWJ+3L6+o8fsSogWIw+7FxOuGHE84POhUYUkIkFRZPAwGU+Qt/QOboWm+X2uKj8/MJMKKBOtxwQuP82FoPwiggClUbiXprPuA2rmgQmhZBRLLFtjt42vQMEEH8PRJKbDrXb4ZRolU2l/dfqwJJoTjcb7TQkga3arbwPP8tUpOe+fHAtwpd4t/PbchhGj76Mt+GYRVsTZWZPTkM/bWfVE5cXAvYNnxJu9mYm3SM/B1L1h0zL89XsoTVHULoO4H8AgzmICSS+aklp7q6X3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUNzJtPogor4/NqaswbS0PRwr6dhLSvxQ7cOsHXlTYE=;
 b=o/0Y2Rr63YL63IEmmZfS9f7o2CeczE1jsM7dsRGpzn+j8ukRvW3q7ihHDKBlOP5baLs5Ie+nsUJjHOO624tPDUPKNfNSxxeWqDZoJOAtDSSSZFMFv1//YqyapVMBAJeiXg8X3p1I+tfFM8qunwP/XXvBIIOd3c/k7Y34ALV9ndk32soi08vY7sfkB+Ue1QN1tWU8wvUU1U17t28kMseu2egNm8YjBg6u87trUYo83sk8eEOrBXiiyh+jq6Tb/o9ituaYMZhJFfr+uXngOR3ilfK/3Xjbjuxu47exeDWGEVBaTgaVRpCOMoHhfKREc1npFBwbbgZBGhZStgNbiN3Ffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA1PR11MB7317.namprd11.prod.outlook.com (2603:10b6:208:427::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 15:30:59 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%6]) with mapi id 15.20.8989.018; Wed, 6 Aug 2025
 15:30:59 +0000
Message-ID: <546c9819-20e7-4474-9281-5d1567263637@intel.com>
Date: Wed, 6 Aug 2025 17:29:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
To: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>, <linux-kbuild@vger.kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
	<morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
	<linux-hardening@vger.kernel.org>
References: <20250802184328.it.438-kees@kernel.org>
 <20250803173235.GA716998@ax162>
 <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>
 <20250805214823.GB200407@ax162>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <20250805214823.GB200407@ax162>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|IA1PR11MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: d70ef8a2-2766-4217-5557-08ddd4fe3e63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzZ1dkM0c2ROZ2lqbnByNjlVLy9rQ0ROWEFBbXdtMm02NmhtY0pDSTJQN2Nx?=
 =?utf-8?B?SXZnUGEvMDZtSmorUnpETmt2ZVNrNm9tdHA0bVBzTWEwalBsRDJLdHhoaHU5?=
 =?utf-8?B?SHBiMjlpWjNpU3E3Y0NmaHFYTHUreDh5aHNWYXFuMGtKMHJKTWgwT0dBYW8z?=
 =?utf-8?B?RjVPTFM3M2toUTEzS0RBVUZCZXpjTUx3b21ZQUY4cUY0LytoS2QwUVkySGxa?=
 =?utf-8?B?MGJ0d0d4Mys4Sk13T0VBU1laREZPYTdWbmVoQmZKZjF1MmU4VEw0L3NqY2JW?=
 =?utf-8?B?NmNpQi90UjNhbVVFWEdjeGNTUDcvcHZQSjB4aXdnTHZBTVI4cDhEd0JKbkhY?=
 =?utf-8?B?RjhqRWc5SzFqb1NLcFA4azRBdUdqYjJrRkhuNDc2c0xWTm5yM3ZyZVpJdFNF?=
 =?utf-8?B?cmJCWHpzRUdqR0J1M2phS1NNcE8wVG5jZVRMdHFMSnRydEFLNmJIMU9GMDJN?=
 =?utf-8?B?RGVqOVJLRnV5T2xIY1M5TTQwUi9NVm1nTEQzVGlMTUczdTlnbXh3eTBwN1o1?=
 =?utf-8?B?MWY3TmN2TWs1WkVYd0EwZUtaM3hmSHNNZVhKMTRnbEY3Zm5Hb0U4UkVaaWJ2?=
 =?utf-8?B?RUhMVHc0SUNtTFkrdW9kc1pjalJna1F2NzNlVG9USnh4NDNsZW5kekNtN1Rw?=
 =?utf-8?B?RDlZVml5dGIxOVVkd0NiM1krZmpZbTNjQ2FyaThJMHhFdkhYOG0xU2xrZ2Rs?=
 =?utf-8?B?MVltNXJmRUZUZit6amdSNitQckVPK3IwMFhxM3hja2ZCNW1JdW02amRzYzZi?=
 =?utf-8?B?T1NlUE5wN3hQMWhVSW1sOUo1N3d4L0tOUzYrQ3hzM0RJcEJ6V1lvcCtvM2xx?=
 =?utf-8?B?c3Z6MEthRzJ4eHorQTJyNWF2QXR1NjZTQ1E3akZwOVRVTGVpRHFPb2NxWUVu?=
 =?utf-8?B?UW9LMlpBd1d3MFVHemJDTFdUMVgrcEpZaFlEeGlFODBQenN5VmMyMnIxbWti?=
 =?utf-8?B?c0UzT1B6R2lnV0NDY3hmY1RQVGdHYndUM3VOQUZFZGVMSDdGcGEyRTZpWXMr?=
 =?utf-8?B?MFZ3L2Q3V1U2cDVZd3lnejFWVWJkbzBsdmZMeDl3SFJxRnpuTGtSdjJaOE5W?=
 =?utf-8?B?c1ZzcWY2UHlQSDN2VXZqeEVEbEdCd016OEh3YzlGODlyWWFmMUxXclhsWmh5?=
 =?utf-8?B?aGNpM0FFQzVNVUFVcmVIMm1kdGtsSEJqUTFsa1RCZCtzVHF4cVV6eExXTDdm?=
 =?utf-8?B?aVM0dTFSTnZEK2RHN2FRdUFlaVJKNmZBcWIyLzEzOUtvR3FaT0Uzc0NLeFhp?=
 =?utf-8?B?T0pqaFBkQVY5MkFOVGRCbzJDNEtrSC8ybHFRdEV3OXZkR0RYYzRPQlNKT1RY?=
 =?utf-8?B?MzB6RGw1T29mb2RUby82NC9UbkI3ODFrQzduNTdOQk9jOEg0SzdhNEpiSkRz?=
 =?utf-8?B?SjNueHZQbUtPdDdrMkNKOWhoRzF6N0cvRmJYSGtNVjE4cFYwZVZiSnJqL3No?=
 =?utf-8?B?RkYwMmUrNzFXaGxzMnkyOEgxZ3lUZVVBQXNNNjdYalFkMFhvdE9wTjR3Tm5E?=
 =?utf-8?B?L3ZzMWlTVWRTQWg3cloxa1NjNW5lQ1NRb25zaEt2SG1mbHdRRG9JU2JNQ1Bm?=
 =?utf-8?B?SVM3NW1LTGJhZ2NQMC8zNEVreGRsWS9udHZlZGVlL2M3UnVCZG4wcXdFalRU?=
 =?utf-8?B?R0h6bVRrVUZoMzdjeXBlVVY1VzI5b01oNVVCSWs4K0RpQWJBeTZpNVBxdTJZ?=
 =?utf-8?B?REpVaysyZU9DZFBvL3AvYm8zVnFSdG03RDhRNndWSXpvbE5obG10Q0htdUh2?=
 =?utf-8?B?NEYvMmVsMzc1Q1RYaVRmVXMwK3hEZWp2dUN5bG9xRWZPR1NBQWVPM2RkRUp3?=
 =?utf-8?B?djMvNnhEVkxOaUV6WVBIc2YzVERlbWdsV0xXL0M0UkIvQ2d0S2VwUVRqOERh?=
 =?utf-8?B?bHpINW9CVm1FRnJtcXJhNE9CWkcrc25XbHlldDIzRTV4cUhpTExHYnlNU0NR?=
 =?utf-8?Q?gp3fdqV9LfM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODREYUhBZ0lJdXdhb2diMmJvQkxTYjJMcS9CdXRNYkhJYmI3OW1QR05pV1Vv?=
 =?utf-8?B?NmdGcEU5Z0o3dkg1c1k1OTJYN1FEVFR0aW9abjNJNjgrZm9tR005UW92YUhi?=
 =?utf-8?B?dU43S29jOHhxN1JMeEVHaE9od0lwWmZHSGhxWTRYRTlXcnpCNGw5dWpxOFpt?=
 =?utf-8?B?K3phM1drUkhINjhyMVFpdk8xYlJydEovcWpKeFNrRndhTWdSVWM2U2F3QWdD?=
 =?utf-8?B?NkhPOWF4U0MvZ01pckQ0VjFiSVZGeTQ0Ti9KRE5Vd09SenJldFVuY0lLSUtB?=
 =?utf-8?B?VWt2b291QmdrMEdhMEI2b21WcmRkZmdyT3dnamFBdHR5QSt2eThDUXg2UnFG?=
 =?utf-8?B?MGFqa01jUmhkR0hIbVBmWk1uMm5pNDlBbGtlL09qYlVNNjhweml5QXJMeUNr?=
 =?utf-8?B?V3V3U3NmQ0JtUUNXbEh2Z3VCeXlabmpIYUNYUVE0allIUThIZTlYNkcrb2Zq?=
 =?utf-8?B?TzRvbEpWSzNNZkRCNEtWUEdDTGJtZmgyWjdmb3ZIYVMveWc0Tyt0WXpBdnZy?=
 =?utf-8?B?NjZIVFEyTmlwYzBjOUppckNCdURuTk5FMi9DL1IweU50RkVwQ0s1VmpqWW1C?=
 =?utf-8?B?NkMwUWhCU2JaZXJWUGN6cjlDSklwQ0s3b2Y0M0J0UEFxUlgxbkFQcnRBS1ho?=
 =?utf-8?B?blRUYVk5cGsxaS8rajlVZUMxclBQNzVuMXFEbXQzQUVZU3NPT0t6Y2tWY2hD?=
 =?utf-8?B?dS9NY01TYXhyQ000RDJ0cUcxWlA1WHFUREwxcVFZNE9PMzBwUXI3Uk5PMWFa?=
 =?utf-8?B?YmJNSzhhSm1WQUpNQVpodGw5OWJEMFlzSTl3RmF6ZGxUNjU1S254Uk9FMndm?=
 =?utf-8?B?elU0MlJ3Qm91bENWQmNrc1k5eDhsd0NKV2ZaNTZJQXpyVVI5OUpzTkh3Y01p?=
 =?utf-8?B?UGNGRUQwdW5lSW1icE9VYTZ3U1ptMW9ZM1hCUWgybTEyc0lPSG9sQmMxdis3?=
 =?utf-8?B?L1lCVGVsTmlFSjFNcll4TEFMUWtYcmI0MHNBZnVHSmpSSzV6Z0orZUcyeUMy?=
 =?utf-8?B?aHRMdFk2eVBZc0gwWmxxZFpyRWM5OElkekFLRWhtZXEzYXduZWlYSVBMNTBC?=
 =?utf-8?B?TlhkS1FLeVhBWlF1ZnJ3NmU3aXY3aFUvbFRzSXN6cUszOHBPdFFUZ3dNVUYx?=
 =?utf-8?B?eWN0Yzdlb29KYU42TFFGbzV5Nm5LTzZONXZSV2g1MzhiMmpKakdRM1loRi9i?=
 =?utf-8?B?NUpFeVNad2JrdVFkQ21pSmpiNDcyWkp6QUYxelpST2MvSSs4cWx1SUJxeU10?=
 =?utf-8?B?Q2wyL0U0YzVBdk91Z096Q2JzTXovQWFJR1A1cG9PY1pLSXFLQnVCRGJtTWd6?=
 =?utf-8?B?Tkc0ZmFrUnBIUEVQQW0xK2lpbFhyTHc3VE5GOFRLYitSdDdNUWR4d24rWnB2?=
 =?utf-8?B?NmlLQlFrTGpTUzBta1BsWDlUOFE5VW1wR0dZSFJtSUFSdGNUWnpIUWdFY1BY?=
 =?utf-8?B?em8yZUJCd04xamhoMk5paVhGbkd4Qy9TVmhBbmlUMTNSWndjZCtwQTJpYWs5?=
 =?utf-8?B?dnNuQlpOeXliZVVnSUgwOTl2SHFLMzBoMlQvUnhwd2Q1VHg5SUtWQld0dWJa?=
 =?utf-8?B?bEtsdlUzQlZBRWkzM0UxYVQ4VTc5R1lVMmxuSFlNejFpM2FMa0lMa0pzMksy?=
 =?utf-8?B?ckF0c3V0eU43THdaVVZGcklMMWlQWWQzN1c0QVM5bWZGYUU0dEVHY0Ztb0hK?=
 =?utf-8?B?M00wU3pFVFV1OHJuMTVZVmlaNE1DOVdvZ2lJTXJIT3BkMnNOMENacVdiVjBK?=
 =?utf-8?B?MWRITFpzT1lYZFJNU2IzZ1B1QjkxYUsxczMvVURpRkRvN0Y5WUlWMnJLQVR6?=
 =?utf-8?B?cGZ0eEoyb3V2VEMxWHhWenZlMCtnS2JOMkJtZnc5RG1PVHNqM25MRW5KMkxu?=
 =?utf-8?B?MkhYYm9YVWhOZnNaVXc1UE5iMU9ab0tsc0dWZjJZNUhRMWNqbEhZVEJUR3Q5?=
 =?utf-8?B?SWttQkc1Z3FnZTNOSVprN1RNeXE5MmlJY0xHNHdFR3VWTFA1R2VaVi93WkhT?=
 =?utf-8?B?VVRBL1NJSGhHUzFoL0E2UU9ObE9sQTR2di9JMWo3b3YzRXBsVWFqUEdkbi9E?=
 =?utf-8?B?MGl4ZkVQSUtid3lxeVBjREhmazZBTm9VOTJ2OHVQM1ZTL1ErclNvY1ZJZWdy?=
 =?utf-8?B?ZmtiZ1J1R2xOUjM1bEJwMnBLZlVlRjdxcGdjNm1IL0NMOUY5bDA5K3I2MUts?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d70ef8a2-2766-4217-5557-08ddd4fe3e63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:30:59.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VN1jU/GaVzIaHhoc5qOi+1xN0NuFOvb/QV+kkTznMg+47DqSFESouZO3+rhM9w9pNNoeB8vvw1s0aPE4XjEiu3MzxbCh9yUYPIamMg8pdEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7317
X-OriginatorOrg: intel.com

From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 5 Aug 2025 14:48:23 -0700

> On Tue, Aug 05, 2025 at 04:50:28PM +0200, Alexander Lobakin wrote:
>> From: Nathan Chancellor <nathan@kernel.org>
>> Date: Sun, 3 Aug 2025 10:32:35 -0700
>>
>>> On Sat, Aug 02, 2025 at 11:43:32AM -0700, Kees Cook wrote:
>>>> With the few remaining fixes now landed, we can re-enable the option
>>>> -Wunterminated-string-initialization (via -Wextra). Both GCC and Clang
>>>> have the required multi-dimensional nonstring attribute support.
>>
>> [...]
>>
>>> diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
>>> index 55a1a96cd834..05d4323c6a13 100644
>>> --- a/drivers/net/ethernet/ti/netcp_ethss.c
>>> +++ b/drivers/net/ethernet/ti/netcp_ethss.c
>>> @@ -771,7 +771,7 @@ static struct netcp_module xgbe_module;
>>>  
>>>  /* Statistic management */
>>>  struct netcp_ethtool_stat {
>>> -	char desc[ETH_GSTRING_LEN];
>>> +	char desc[ETH_GSTRING_LEN] __nonstring;
>>
>>
>> Hmmm, ETH_GSTRING_LEN is the maximum length of the driver's statistics
>> name to be reported to Ethtool and this *includes* \0 at the end.
>> If this compilation flag triggers a warning here, the driver devs need
>> to fix their code. There should always be \0 at the end, `desc` is a
>> "proper" C 0-terminated string.
> 
> Ack, I had misunderstood a previous fix that Kees did for a similar but
> different instance of the warning in another Ethernet driver and I
> did not look much further than the driver copying these values around
> with memcpy(). This does trigger a warning, from the original message:
> 
>   drivers/net/ethernet/ti/netcp_ethss.c:1049:2: error: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Werror,-Wunterminated-string-initialization]
>    1049 |         GBENU_STATS_HOST(ale_unknown_ucast_bytes),
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
>     956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/ethernet/ti/netcp_ethss.c:1051:2: error: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Werror,-Wunterminated-string-initialization]
>    1051 |         GBENU_STATS_HOST(ale_unknown_mcast_bytes),
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
>     956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
>         |         ^~~~~~~~~~~~~~~~~
>   drivers/net/ethernet/ti/netcp_ethss.c:1053:2: error: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Werror,-Wunterminated-string-initialization]
>    1053 |         GBENU_STATS_HOST(ale_unknown_bcast_bytes),
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
>     956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
>         |         ^~~~~~~~~~~~~~~~~
> 
> So it seems to me like this is a legitimate problem? Are these

Yes, it's not a false-positive. I don't know how it worked at the end of
the day, may either the kernel Ethtool core or the userspace Ethtool put
\0 at the end (or maybe it was just luck or nobody tested Ethtool stats
on this driver).

> descriptions expected to be stable once they are released or are we able

Ethtool private stats are not "ABI" at all. Moreover, if they result in
incorrect code, this needs to be fixed no matter if someone already
wrote scripts dependent on these names or not.

> to adjust them? We could maybe shave an 'o' from 'unknown' to easily
> resolve this without losing much in the way of quick visual processing.

I've no idea why it's popular to define Ethtool stats names in drivers
using a fixed array of ETH_GSTRING_LEN and then do memcpy().
I've been always using just `const char * const[]` + strscpy() (then
switched the latter to ethtool_puts()/ethtool_sprintf() -- we even have
special helpers for that). In case some name goes past ETH_GSTRING_LEN,
it would just be truncated, but always have \0 at the end.
Plus most of the names are shorter than 32, so defining such arrays of
32 just wastes space in .rodata.

> 
> Cheers,
> Nathan

Thanks,
Olek

