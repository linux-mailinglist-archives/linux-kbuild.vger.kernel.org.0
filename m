Return-Path: <linux-kbuild+bounces-13357-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIL0N+H7FmrwzwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13357-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:12:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CAD5E5ABB
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD2B030589D2
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 14:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039D321D590;
	Wed, 27 May 2026 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DI9XWTW3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EB431F9A6;
	Wed, 27 May 2026 14:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890793; cv=fail; b=YNxhyG6AkB4HtLE85q2iRm7vpY9Sgke4+vkV46LcELs+FCDDKlu3Mg4BteImLXMt2Y5ImFGj4y/XNn2UQ+OmDg1RRT/DgAddinjl1rNHYLsSuoEcIAKds8qe/HkxuJajPPp9UAkFPvQSGJyVc6jJJ2mX9XqGk5ue4rqBq4lyZfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890793; c=relaxed/simple;
	bh=gToWz2EUPbWGHtmQVYsWIrjEnj5Xd06zyh/nvsukrL8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZW6ni+D6vaYw1xouuD1JbGU8+aFHdv+XunTfXkvCodIwPJM8KVMcWTi0ukbxGHzHMto5gwkr1uPqSK61N+Lylem3WoSWoHD2GwETUkK6OWIERBonUxf/CvhlWIkRCHbkHhjg5+FrTMpHYSblK+pNTJCCHxFz2zarBZPb/2TQkEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DI9XWTW3; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779890792; x=1811426792;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gToWz2EUPbWGHtmQVYsWIrjEnj5Xd06zyh/nvsukrL8=;
  b=DI9XWTW3Y3tfcBdaBmKSyXaCWDdJtZT/VGu5b/+sQD0Nc5PYLlmG3T4F
   USMi/U3o0qX5C1W9j78DH4ADtl8gsK4N/ZmWzs71v1TW21gBnFs/HBp7F
   ITP1DmYiXCptAau2PiaPsA7TIcFkfxH0rpEAXFlthSS9AVlyjSJbp1v55
   StY3kY/wPRqLoxj04J+o9ghmNxIZPM/JUFbTisXxahGVx2ma8QMGqyHnZ
   eXbu20rfwX1N36ozoZ3VWvtozwmc7P5aHhIaXrkhUbWxgZry69/q0p+UQ
   nm6JcNqRUHjOstF0cFobh9enkMkggIrIGcDtwWiVRNQNfp37iqLJFPIbf
   Q==;
X-CSE-ConnectionGUID: bpEUxdfRTIOwfwowBtAyfg==
X-CSE-MsgGUID: KvD4V+XOQxKOcM83qD9MHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="83299310"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="83299310"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:06:31 -0700
X-CSE-ConnectionGUID: hAyD1Z+BQcOxdqDgIw6PwA==
X-CSE-MsgGUID: kTsHwlTSTfeVwzNVOws0IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="239250229"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:06:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:06:30 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 07:06:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:06:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEz6Ec29zrgfJXiI3Hy/RXXOrtN4oCaiJ/2JyJt0WphaVrVTD++frHRQUnLY0ShjO452G8eHvzlQ5/YVV5500L5N1ruXWTBd9zISa2JiZVG83i6seraMR2IGRuf+DbeBxH3+Jlm4QqV57QOkT7dmGa2q5YEiXMyjmVR7IB1tJnPFVEDm5jkUpCp8xX9F4LyxGsg7/O+Bvi5yaNwLdZgJe8ooQplV2D0SRk55fuWvW7lOTLZVjmH8h8p54AE6LAb0zZ6Lz3OXJ3M64EVxMeVHsJB/fJ//upwJh/w3xNA4S7tTpNGc3NzFf5gIKDmEIP0D8B7kmdfV2IZRSsSzrRwdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66hHKuAU07eFWIH6swXlHsTD2Z5x02Z6nz6/uMup44g=;
 b=yUtBEktUApQ9ImDMJb92DnbIiDnkcCGXQq8lleWlL8aszeyY9MjF1ZV3rKtroyojofMA0Xd4xF4qrJl8Ee9G307WQTQ5iJnOA6iqjzOncQWqn+6lVzeK7/EpRgo7jMih+mxW9v5SrGaok4jPRkOlIa1zb0tfPWxNy9wZ3guecBov7AUf+0H99LiiZ8iWlHugvMHhX6xX5frIElD3qkz6jYF7qZrGp8GxrTb1t6VV5IOE9YYQx05wSLFrIsTxTGKe9ovG73wIOnxw6xPaJD0BGa+HbacGBvlhkMEujNzpJgFTY7XgqSS1Wc6BAQzZ/k0YBQO2rnyZ0cw/RY6HWqASaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CY8PR11MB7084.namprd11.prod.outlook.com (2603:10b6:930:50::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 14:06:26 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 14:06:26 +0000
Message-ID: <9398ee4c-3b51-4a00-a0d5-3674ce1b1081@intel.com>
Date: Wed, 27 May 2026 16:06:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] err.h: use __always_inline on all error pointer helpers
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-kbuild@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-s390@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
	"Bjorn Andersson" <andersson@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Christian Marangi
	<ansuelsmth@gmail.com>, <linux-kernel@vger.kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>
References: <20260526101851.2495110-1-arnd@kernel.org>
 <b5e15330-ed64-4f31-bea2-bb877a24c1ce@intel.com>
 <8e50449f-66f0-4e85-aefa-7016697fe722@app.fastmail.com>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <8e50449f-66f0-4e85-aefa-7016697fe722@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0149.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::42) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CY8PR11MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: 625b978f-f09b-4023-96cc-08debbf9245f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|6133799003|3023799007|22082099003|56012099006|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: X099fd8iyIKOOkPtlVT1ahQ12txspSKMei+7gN4PtJ8wO9Dp01GhSGI2VH0F32bgnw4aC6M8UcZppOTt937+XKBR3MV+p4Vv3yi8/MvjYO9VVwiRV+MvdVdmUeS0fs6XYkG/94/86ikv7ViYLaS4j2dy4pL0M0MoNMN58Uc/BrOrzKx6jaXZy5UDljgxZm0fy/CU759v3mGVSP+3vBIUqcfb+rZ7iwhKf+IGncSBuaz1FlKfbjOaP1gy4moQhnTMVI1TZjJAXpjpsFUjsuA3rAJyzYvDJx1NEbZVJW24vNQMs6wSpDA5Erwlb4CgK+m0OeTmPN9zWz6QZYdhh5uOQYKYrbVBVq8S1XJQ0cuefu0169j560XtYICiuguev18gAbl3ovGjv6prQDiqtT1Jiu6Di/Hv91whrrhkj2wTHTTc13TmTgyjM8M6rfbPWnIiUNfHH9uHjTHWbDOL8GX1Xry/na8WXOhNB3aBAcmBA/z/k630agdZyN8NwCj1iON+XJxFCEKKETj6F2196wr20cWuu9FMgU2g42pfMf4GaHvi36fLusbfiFG9/FwSv3C3vVBi0yOemtSn408rc1obnk8cdqA6gpvrORCHtqJA+cR4hnscKW9Tdj4CRuRWAbi24GzB2AQhrcxcfe0pRLqErrdG3pbk3fgOrGcEYN5bLhgTjduUTJudZl9cMXCWnrPM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(6133799003)(3023799007)(22082099003)(56012099006)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXJCeXIwTC9peVhXVVFkQUZESXYyeU9xcE9MK2lkVnJuY0x0T2xYaDh5ODls?=
 =?utf-8?B?Z1Bldjk2OFpEY1ZtSDIwR3RQVUhpNFNSS1hHczFjdkFYUUVsN09TMzZtTFAr?=
 =?utf-8?B?ZjZ1N0RuQnFkM3gyaDM5aG1sZDlSZllMWGhvRVdEMXQyaDcxQXFZREthMmhU?=
 =?utf-8?B?UnBLemFQckZKM0pTMDJHUVNaZkxDRnFhYkI5L3BDZ0R6QTZGZXVPYWc2eVFG?=
 =?utf-8?B?VGM4WUtyTDZtc2RySXZxbVZjMVRRMVZCVEY5N21ZWG1hcUtVV1Q1UXZCNGZR?=
 =?utf-8?B?MEh4b3JwWDY0OE9VZWpnWGJsTy9QWFJvZUpoRVBOYjVwUWZJVGtmcjI3SHFy?=
 =?utf-8?B?NnhvRU15QmVnZXY0WTc0OFQ1Mkx6NUdqRzk5QVVOTWdMZ0FvRlRabDhGV01N?=
 =?utf-8?B?bG9CSFM5UWg4Y1pZdkhHRFhaUGVtL2NaZXB5RUpqRk9yZFVJNnRSYThyemxF?=
 =?utf-8?B?MU03d1BsSGxzd2FjRHRDVWcxaGhMaGlCdEhsdEMwb2VvRnI3TWhLM2hnODZH?=
 =?utf-8?B?RVVSeTVxVm5IT2tHT095TG5FOGp2VGJjUnorcERIVzM0WUVERjl0a0xaQXQv?=
 =?utf-8?B?VnFpNnAxbHNTSlg3WVIwZkRiQ1Z5b2VrYm1NQ3ZXQ2RiRlVoSnU5UUxySDB2?=
 =?utf-8?B?N2paSS9obVh4SjBCVWZDQml3TDVtaFFia1daQ3NYQktHSTM4dEliSFFVMVJL?=
 =?utf-8?B?RzBYTWxFSTNPZlM4d2dSc1A2aDFteFQxK1FNcStlaTNhL2tXVXJ2UEs1S080?=
 =?utf-8?B?RVB2Y21XUEJvRFF1a0sySytKcDdrcXV0ZXpPY3RIM3lKd2VwUi9nWXF6eWQ5?=
 =?utf-8?B?YW5wc1d5bHN6VmJNTEdCQTNhL29yQjBybWdtQzYrQ1dpRnp0RlRQUXluV2wv?=
 =?utf-8?B?RDlMRFFmUDQ3UDBGZ25obDZzVURNdUkvZE12OUs1RnAvWGFwT1ZqTVI5ZkIr?=
 =?utf-8?B?dkJFMjJMeldwUzZzdE55TFIzNFBXZHJOKzczMkx3dmhvRTlkcXV4ZHM5R2Ew?=
 =?utf-8?B?VTFQbERnTDhmQ215UnMybjVSdWFwd1lBaTloSEVCMmVWWG9WamJKNnZ4UTgr?=
 =?utf-8?B?Mjd3cDlyNFYxTHhXME9Wems2dzgyTXF0a1RhdGdqM2I4a1dRSG5tQzlQSHow?=
 =?utf-8?B?WlpNcHNzTlBXQzM5NS9XcEJ0NFJIWFljdktlaFBMR0c1TUlrOU8vUHYrd2Jz?=
 =?utf-8?B?MmQ0akdLbE9Ydm9yQys0ZUpLTURHdGxDdEJIS1JzanNIenFCbE5iWmhmS1Fs?=
 =?utf-8?B?dGpqQ3FVaGxWU0tVUjduVjJzazdicXJoLytMbmhvTjRsR1V3WFdGQ01ETmdK?=
 =?utf-8?B?ampVWmZRaU1WOHNoN2F6UTRQS3BsUUsxM21waVFjcldUM3dqVjluWGtQdGRs?=
 =?utf-8?B?ZyswaVdabWNXZ3gwUDV4RDdnamdTekJNTThtYUUvaWRPWWc5eGhEbmFpTy94?=
 =?utf-8?B?MU9RbE1nN3B6dDg5RjJFQXpOMVMyU1pyYzFyaDlWSVBMU2FPYlFJWG90bmp3?=
 =?utf-8?B?Rkx0RlVHcTRoRlJjbTF4d21qYjdOWkhFMFVLRnY0WlM2QWFJTERwOGZxWCs4?=
 =?utf-8?B?R25JODlKT095QmVGNG02Kzd5eGFkbVo2eU1hZnlzamQyMmU4c3Y0UC9LUHU0?=
 =?utf-8?B?UHp5bmlZSG53V2YvMENuQmpZTXV1NWZybTMyS2gxNlZUb1ZiSEtDTXJjYmVk?=
 =?utf-8?B?VW1uYm9jUnJwZzRreEpNam9tR002MWRqcFcxc1g4ZnVzeFkxU25QeEdIRit0?=
 =?utf-8?B?bTFjeG50T2d6bkRiSzVDcGxGS3RZVTl3OG1lWUk0THViT3kwdEJSK2FEa0Z6?=
 =?utf-8?B?dVd3VEJwVnMySnJISTlIVk0yalMwS1FOQjQ3K0pNZFl3ZmQ1UHA5dWszWUVh?=
 =?utf-8?B?OGJON2VSRms3Tk14VHl5eHE2am5yVXVIeGYxUmlzakV2MEVQYUlZV3I4Wmkw?=
 =?utf-8?B?TkFOWWVOYlJ4TUlveWdnTXExVzN0MGUwa0dMdlozUXFKaWljSTlncC9sYlky?=
 =?utf-8?B?bHY0WC9McUNzSC9qNUgwNWxObGdMTkJGRDFOakdHVG1vYkZpMXFHc1J0czNC?=
 =?utf-8?B?K3k0NTZIVFJscWZsQ3RVZEw2by9aTWhqWWFub1A3S1E3SGFmbkIyLy9WcUV2?=
 =?utf-8?B?VEVGajhGeXBUU3NLV3hhNjk0U1B6LzBFVzJiMTJiaHRVMzVIa1l4THhFOUsz?=
 =?utf-8?B?OUEva3BDbW1yaFlJY0RpT1JZbXd3ZXppMnRuRWVzVk5aVThmSHJXQTY3cHY5?=
 =?utf-8?B?ekhNRjZZYXNka1RUcVlteS83NFJxZVZkTUNiRFR4UGluaGVkN2laQ050SDBr?=
 =?utf-8?B?cjFrcmdFM0M2T21TK3EvZ2N6Lzc0bWhYMmxMQU0yaDJKc1NkZnRhbVljSE92?=
 =?utf-8?Q?m5m3akch7fOpC+7w=3D?=
X-Exchange-RoutingPolicyChecked: nVSWLD9Pwd7LbOysSRYegHe0KlOaHX4y75dbH8qvBMsW0Sgqk1mtXvjEpLCMniEAQ/0LSzqzkluo8ZBFCCUBukCR7iPlLecTdvrNByX1iyiaSn7HN23X5fH3qVy4hKJdkiUsHXZTw5nrDPe/UqMonlnibg+W6Ofjns1Auyx4kdg5DxyFNmZ7TrOdYOaK/Nb6Dn2aloDu8k1YcntLxlKke+WJF1R+D2vQbyjCLEHq01SEn5igvwN/DMJ0D4oHW0UTk6uFDpjkGhdPnXhA1vn30YjdQyXE9edkDP+/6b44exnj1VWj7kQrkQjBS4Rp1MpY4ZfoWvYUY2DdWUHlPwYUcg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 625b978f-f09b-4023-96cc-08debbf9245f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:06:26.7081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: puvPVeHFY6YFzNqXH7umiFTT4nmWLStqDPGNjdZUWKAnQ7pTQi5EVKme4cSkZZktviLGLPatXolsTMjCeY+HH7QPKQG/eSDO2nwj4zUBlo4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7084
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13357-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,kernel.org,linux.ibm.com,linux.intel.com,gmail.com,goodmis.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arndb.de:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aleksander.lobakin@intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 77CAD5E5ABB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 May 2026 23:03:50 +0200

> On Tue, May 26, 2026, at 17:01, Alexander Lobakin wrote:
>> From: Arnd Bergmann <arnd@kernel.org>
>> Date: Tue, 26 May 2026 12:18:41 +0200
>>
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> While testing randconfig builds on s390, I came across a
>>> link failure with CONFIG_DMA_SHARED_BUFFER disabled:
>>>
>>> ERROR: modpost: "dma_buf_put" [drivers/iommu/iommufd/iommufd.ko] undefined!
>>>
>>> The problem here is that IS_ERR() is not inlined and dead code elimination
>>> fails as a consequence.
>>>
>>> The err.h helpers all turn into a trivial assignment ot a bit mask
>>> and should never result in a function call, so force them to always be
>>> inline. This should generally result in better object code aside from
>>> avoiding the link failure above.
>>
>> bloat-o-meter would be nice to see but optional, it's obvious to me that
>> these helpers should always get inlined.
>>
>> Not sure why compilers sometimes decide to uninline a couple
>> instructions (feels like there's sorta dumb logic "oh it's used more
>> than X times -- uninline no matter what").
> 
> I've run bloat-o-meter on the vmlinux.o file now and indeed it shows
> what is going on: the configuration that triggered this has
> CONFIG_PROFILE_ANNOTATED_BRANCHES, which turns the unlikely()
> bit in IS_ERR() into two extra function calls, so my patch does
> end up adding a bit of bloat (see output below):
> 
>    text	   data	    bss	    dec	    hex	filename
> 20159943	5630468	16199728	41990139	280b7fb	build/s390/0xCED6EE04_defconfig/vmlinux-old.o
> 20217607	5630404	16199728	42047739	28198fb	build/s390/0xCED6EE04_defconfig/vmlinux-new.o
> 
> Without CONFIG_PROFILE_ANNOTATED_BRANCHES, the changes are
> very small, with around 100 functions growing or shrinking
> by a few bytes.
> 
> I don't think we care much about the size increase when that
> option is enabled, but I do wonder what behavior makes more

Yup, and even without this option, __always_inline is better here
regardless of how it affects the size. Such oneliners must be
transparent to the compiler

> sense regarding the annotation for every single IS_ERR(). 
> Does it make sense to have every instance get its own counter,
> or would it make sense to actually try to reduce these
> when profiling the annotations?

I'm not familiar with branch annotations, but from the stats above, it
really looks like it adds a lot of code bloat. Plenty of branches in
the kernel are sorta pointless to track (the ones which trigger once
in a thousand years, the unlikely() ones etc.), I guess.

> 
>        Arnd
Thanks,
Olek

