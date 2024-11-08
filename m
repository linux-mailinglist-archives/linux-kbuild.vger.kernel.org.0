Return-Path: <linux-kbuild+bounces-4581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B39C27C7
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 23:49:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 467FAB22710
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 22:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B8D1F26C7;
	Fri,  8 Nov 2024 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eufry5b6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093A21E00B6;
	Fri,  8 Nov 2024 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731106171; cv=fail; b=cQuKEAJFq3uUIOyjokeM9GhxSZACdK6gc1SFS6ogpnMR9+xa6xh/OZCEpaIc8ZZy4Z/j4gam88bd+ATTHDuYDKGfbzPrNWJUOvp6BMU9uGUdnh7eUm0/uCjDZ/kOvQ6ahNP+s+c9wiU7xpYk85AUimNFWmhs5N9fqk6thQrXnYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731106171; c=relaxed/simple;
	bh=dXGGYDRbb2ejOGgV6gZ1Cq5BYSpBxvmk3kJBlavdSmY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HqRjcMmOm189WqSh4RvpoDvRwc+x5NsqTil62Zchcf/WNZhrughjSfPqIJN1AZDqwXP5DFclEQbNDrIYB5ofU/QHJRyczJvVtUYIGrrE0CMqwiVtyQkYXJLrCFe6iRhYs3HarLitwrdgQg8ahEq56NYCvfeNODVe8EdKMnMiQ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eufry5b6; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731106169; x=1762642169;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dXGGYDRbb2ejOGgV6gZ1Cq5BYSpBxvmk3kJBlavdSmY=;
  b=eufry5b6socodoytS4pxLG33EaQ66QOzjKGcbWdrEXO40TISVr/vXnWZ
   WI3CJqvypVF3Nxi0B6+S/BNWrbClync7GJdcuRKEUnADSwkGRiUndgFO8
   iQrb3DOE2Kz1pbxd0lN63my9j7vr80i/JzOnCXp5JqGYCG8FH5ysDQXtZ
   /zVgktB3cHMPdKbWcHyr6mXmmxt/Q2tCyfE5rIWjo2rJ+nmDar4RbZOpS
   x0RmkE/urSVK+isoe9NNPAEo7pAzrBU3VDifPvr0Eax23UzfQkx8EMdNS
   FqTVZh18+62LcVTqpop0rMLVQtkdwrhLuPXCFJWX1FAR62ZKOX1BC8rly
   g==;
X-CSE-ConnectionGUID: iowG5BuJTyuAmK7ZxALwfw==
X-CSE-MsgGUID: Mf4NQfUtR92gQfWTiLwEPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34942661"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="34942661"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 14:49:28 -0800
X-CSE-ConnectionGUID: mloarzzPTo6UZzRKUi2s7w==
X-CSE-MsgGUID: kc4ydorjQuWsiGhFBPmiVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="85267503"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2024 14:49:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:49:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:49:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:49:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLAmaHrcQJ+QPYmdWijDPRq90V/1KLg+23GKyz2VFZ7F2co15pV3AlY2wa6/PQ/lRRXTdgdssgonrO81HpkP42L6LZT5xcwzBHtXxcnle4fbk6ozQCgaFfGDnUbIOD1gJO2Ds8/ynpg7CwDgF1NKIvEwHB1q6I97Gb3fTQCybm28zCJ+yuMEoV2ftDxCUw3HqxVx5x28S5PaXqrKIw/3GpnlCv50k5IgvWxpPrMUzayZt76MzzRu7bsbtt68gL8ujOrXOiq6OrLyLgkisepC9x3XIEF1/cq+zwvHDI8lB3gL4XjO0nq7A6F4BnRJkhhp6iKjUZ2vHFXd9FKyhlskCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5MQzSFeY1JcoAivQi03Xq4vcvGvRIO4FDpO3XFoUCs=;
 b=IVhqxy5Zmf8OYwWKpv0dzuBTgeXUJJfbtdT/Vbpr9GC15ac/+GuRiCS4T7QLdZmxmGE+u2Q7oAS2OClkVRIZiS/6R/Nxw/NKtJdcIpXwTWOC2gvnYixjk6pocQLazlgcczMvvaoHWFjk1fTejNd4ogheJ+o342wiXHMZMBGOLaYcLAqQc2MarmCY4GYSSVZoY2mtAdLtFDo3qTb2Jun70Yzo6dMnWoJCnGc+ILpY0kyp0wCUAK4GJSyc961jbInH++3ETzKVphUTuTIFoIqMK+ihfx2D8a0LJ+v8cRSMRbhhGPwYe1/PyFx0Ng0oDsNcZHAN60DQUXPcfP2TGntfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 22:49:24 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189%7]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:49:24 +0000
Message-ID: <744be353-e45e-463b-9f87-973d978fae0d@intel.com>
Date: Fri, 8 Nov 2024 14:49:21 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 3/9] lib: packing: add pack_fields() and
 unpack_fields()
To: Vladimir Oltean <olteanv@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, "Przemek
 Kitszel" <przemyslaw.kitszel@intel.com>, Masahiro Yamada
	<masahiroy@kernel.org>, netdev <netdev@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20241107-packing-pack-fields-and-ice-implementation-v3-0-27c566ac2436@intel.com>
 <20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436@intel.com>
 <20241108112407.3mg2aspg5h2vas4c@skbuf>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241108112407.3mg2aspg5h2vas4c@skbuf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0026.prod.exchangelabs.com (2603:10b6:a02:80::39)
 To PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cb158b-b543-47c8-327a-08dd004797a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVp4U2RXOHgvNlp0MTc0ZGV1WkxyNjZpUERpa2ZuK3h6cFlQUnQxNXoySEZ4?=
 =?utf-8?B?RUlsTi9RQ1MvTDloKzZLeUxyQkhINWN5TFFHc2dNT3YyQks3OVlHUEs3YURx?=
 =?utf-8?B?Ui9iS0o3VlB3MXRZUVdlOXdTWjRGZGcrU01JazFiQ25DSGI1VjlBdm1vRkh6?=
 =?utf-8?B?ajNVZFo0em1WUzhSdVZYQkNrcmVKR2dWdE40QXZ4NlBwNWpyY1dxeHlJRmZZ?=
 =?utf-8?B?bHlMQVdaTW1EeU9HbS9QZ3Nrd2lPYzFFKzdWWWFDTXZqNGd6UFl4dWxRRjVz?=
 =?utf-8?B?cGExRjFMU0hDbXF4VGNQM2FmTnR6Nk40MEl5VzVOeEhWUWJsWGFhMk9GZ0hp?=
 =?utf-8?B?K3didk55UldKR0xlTnIxZDNuemw5YnUrYTRQdnJIYjIvYlhWNDFqbHhBMWRL?=
 =?utf-8?B?UW1sTWJ3MTFUOHlpaWhGNVJZNytVK1pHeUFYcEFsZzRDeE82Mkk5YXRNMllu?=
 =?utf-8?B?aVpKOHUxYWhINzZLRCtBYWRZTjU4NE5BK1hRanJFNGhLZEY1dlZrRVF2TXkx?=
 =?utf-8?B?WE5meHVwYTd2QW5hcHl1Wlh0aTNTMXg3OUplV0pqd1F1OG9MLzhmMU1VbVhx?=
 =?utf-8?B?d3cxeDVEQVZQdGFmZ1M5dlNocTZnMzRxcmR4MGEybmJTTFJSbDlIVnI5Qzh0?=
 =?utf-8?B?WmU4cmpSdSsvb1A2UnBuZ0Q4TW9VL2E4WStCUFV6di96NlhoU2RtYUFLS2pE?=
 =?utf-8?B?M1R4VkhXczhXV3FLVm0weVNOSHNFSk82em1RS0crVm8yZVA4QlRFb3pSU08r?=
 =?utf-8?B?NTVBcjJyZDJ0ZFZVZGcrcTI4TURCZTk3czhqdXlZUXg4ZVNLSEVrMTN2dkYx?=
 =?utf-8?B?L2krcDNzUUlpaElzNjhrNWMyT3NibXNwVVIzWXJKMTRlZ2E4bGs1YytGRkJk?=
 =?utf-8?B?TEZURmFncGl5S0o4VVlIU2JQcUkrY1NZbGVoTXE2blRWWnQ4MmNCZXFpU1Jn?=
 =?utf-8?B?aktDcnlXNEdWL09zMmlnakM3ck5OdWVkS3pTRXl3SnJFRzV5NGpFZlVhTGNu?=
 =?utf-8?B?K01KYTNjd0ttSEtCWjhoeE5oT0JLRnIwa1g4U3loVW1LQTVTc3NYS2gwTGFJ?=
 =?utf-8?B?QTdsY0tHVTA0bGdVcGF6MUQxZ1IzYURFR1BveXJZZ01aNElwbFNZUVgzK05E?=
 =?utf-8?B?K05GMGhZeFY0ckNWWFEyS0NVb0pWd04xZVI2bkVlME96NDIzYmdFRndRVmNQ?=
 =?utf-8?B?b25JZlJocHF6Y1dYSkVhL3c1MkpJM2hVTVpMK2hjRFRBTHMyejhnMnQ0Tnov?=
 =?utf-8?B?MlNDOXdwNEJqaDZjNHBRNkhBbWhRTHV4Y1pLang2a3Y1Z2VWV3hnVVR6aFZu?=
 =?utf-8?B?STlTUGo5Vk5RN1gram84Q0p1ek5xd0U3ZDN1QzZkdG9VbmRrY29GZTFqQ1VL?=
 =?utf-8?B?OGJxK21mOEN2RG9IMkg5Z2NndUcwczhIQUtSRzBKMW4vbHhQaDVGelhPZm4y?=
 =?utf-8?B?SUVWdGdFUUJOaGgyZkZkOUY3WW93WEh2b0NRclJZNlpLN0MxbG8xMkgrZ1R5?=
 =?utf-8?B?VEtkV0t5SVZWRDFLWXVFanB0Q1dLVng5ZkxxY1kzMU4rZHZhdXo3S3NwS3ZF?=
 =?utf-8?B?WlcwdVNlUFdVbnVUQ1J0M09WRldaOTVSdXhQdlQ4NEFjbGlPNFdQYTlOUmVP?=
 =?utf-8?B?L3h2cFRzOFVJWWRwb1lNUjZad2xvR24vNCtCV24rTjZpbXAvVzZNSHF5Nyta?=
 =?utf-8?B?WHMvSVRvTFBZU0NsUjZ6c2UvNmFONU1EaFBKVkpXaVJlUzgzQWkrbm1zVDk0?=
 =?utf-8?Q?abv/kr3GsPlHSLTNExA/fB/TzhY72nd284uzaVK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5095.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHBVcmVrNWxCZGliVWlxaXVRd0c4cmxFdStIRWF1NlhCMmVod0lYVE9DNENM?=
 =?utf-8?B?bnkwRFhiR1dLZGFyOG16SGVVc2tuenh1dTFTenYwa0ZVMHEwZGU4Y25NZFJ0?=
 =?utf-8?B?aHJ2VFN6N3FUK3JzL0JrTkYxdlQ5dm5QalR3K2RldjdJL2xueXNQN0NZSjh5?=
 =?utf-8?B?bnVCSmovQ0o3ZytOaU94b2FqRTBvMmd4Y29Sc05XZGxEZnY1dWVvdFpDSDFY?=
 =?utf-8?B?WmZMcjhITDYzSVZPcys2NzJmd2hLZ0NFQmlwYVdwNVVlMmY1YnVZWXhvdTNZ?=
 =?utf-8?B?cDRnVEl2SXZLNW0wMmR1YTZ6VThTb1RrUVBIRHpkTVdGN0dlTjA3Yi9WMmxK?=
 =?utf-8?B?a0FNSGRzanVTVkdnTzFMOFI3VjJ2VW84MU9RSzRyS0RtK0dpME9GK1oyMVpn?=
 =?utf-8?B?cnh5RUtNcGs0OWZ1VXVOMEtFNnBnczgwWmZaUkVBcm9wNFBCNjdMVmV1QlJN?=
 =?utf-8?B?V0o5Q2c4aFgvTXhMR0tTNE9neUswN0RxUmdkczFUSlVINllvYVVrT0V6emkw?=
 =?utf-8?B?TWJoYXFmRjVuemNnaWJKaEJodi9pTU1GT0JTWjh5aVBCaEQ3ZytqRVJhZTFh?=
 =?utf-8?B?SnppZ0JsemQvVkhzYjltM1N4czlUb1pUQkU1Nk82UExpUEJHbHdzS1ZaeE1F?=
 =?utf-8?B?eWJobG9RKzFIRDhYRnQ3ckZDSGVBRndSQ2dOOEhzSEhHV012U0s5OFRqMTVr?=
 =?utf-8?B?ZFhzaGtYSThFbkxFU2V4NUMwRnVpR0ovdWtUQXl0NVpEYkI0SkxYMmphdWhC?=
 =?utf-8?B?VXF2a2lwTWo1Rkhpc1BDUW5SUFNZd29aSnV0RElXamtCamFzOG5VMUtVamdT?=
 =?utf-8?B?QTd5Q3NhM0wwZVJwSFhFU0NlYm9mQXAyOHdKTlE4WGlzUGRscEJPQlJQeFg1?=
 =?utf-8?B?L2kvVEtDVE5qWjZ4QWExT0IxZ2hMRVdEcWEydFphYTNCUjhsYjZrc3FWTlZh?=
 =?utf-8?B?amVONDVpcEJOdTdMR3VGdm8vMFdHUTBjeW8yKzk3djlIRkZUKzVkdnZ5R2w0?=
 =?utf-8?B?OVNSNVNsa2s4MXVOMWM0NTZSZlZOaml6d1MwZlI2RkpFbWFzbEtKU3dQbnNX?=
 =?utf-8?B?ZXVacG1KZkhHV3Ezd1dxL3dwVWVzdXlLdHE1Rmpwb2FBSHhIL29jRFQ5OHFV?=
 =?utf-8?B?TGpQWktpTjYrSFROeFgvOWthaEVFNGVnNDJwN3JObnhzei9FQnFWbEphM0gr?=
 =?utf-8?B?TFViU2wrK3lQK3NEc3Z4ZVByejM0N0lZUEluTm14YkFGN2lZd0c3NWdpc1h0?=
 =?utf-8?B?TURNalkwYzJZQTFXK3MzZWtKN0dNSWhudVF3a0MxYjRxOU1JRUxDV0pQQWJo?=
 =?utf-8?B?ZXRWTXJLRW9HeXFwcGE0a1piWG9QeHdTVGxxRUVwbDJOUHZoLzdZT1BjU0J1?=
 =?utf-8?B?MVlOOVVvRmllaDJ6TjJMelpkWTlCMDJ4bStzSUVFOUpwQ0Vhdk5jeW93VGdP?=
 =?utf-8?B?ZlhIdTk0WmFoNGFVbnpncnJSam0rdm1qa3ZVQjk0QmgrY21NNVZPakNURjBp?=
 =?utf-8?B?Q3MyM24rWFUyYWlYSkFiK0Q2MVV2cFROb2xhSkEyeFFlVUFteWJvMS8vTnVR?=
 =?utf-8?B?cE5MK29nWDhLQUhvU0VVbVZESmpKT09IeTRkRktSaUpxVU1iM253bXZKWkhQ?=
 =?utf-8?B?RnlBRklFZFhUVkh5c2hIQk9HS1NCYWxmQmVrcVgvcUkyT2kzaXM2dDdNVlln?=
 =?utf-8?B?RUZoaTI5T3FycElLVVMzclQrcTlidWF2cjlHM1NwTW1NSjdubXFGdndFS2Ns?=
 =?utf-8?B?SkFKYmQwSUVIcnVtakxMY1U5TzlDWTVmKzJ5RGlqWGVRN2VhVTIzcXUwV25i?=
 =?utf-8?B?cE5RbC80a3hFSzJqVnUxR3lUQTNzbCtpbjdzT3FEdlVOV1ZqWmdjMnhCK2VO?=
 =?utf-8?B?VlYxUVVHZTUwQlJ4Z242QjEyblpnaXZIaWczaFRrVkdNaGZrOXFsaSszRzRi?=
 =?utf-8?B?NDZ0MEVVckNZbnZPQ1FuQVVDZytUTU1BMVZrOGdwdHhQdWRjTXYwWEU5VXR3?=
 =?utf-8?B?QTJlbjkrNUE4WUNwemV4TTZhUW5HeGh1dmYyT1VQODk0eFVKYmcxVkJJTDFY?=
 =?utf-8?B?TGRORnB6eUtzZVVxSlo3Sm5HM29JcE8rT3dLYnFRMFlkaDN6Rlg1RXhxMGo3?=
 =?utf-8?B?cDI2M3JqYmF6Q0xXQ1pxbm1BRGRackt4MmlUanJGVVRBMGpMTFh2dXJ1VnhM?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cb158b-b543-47c8-327a-08dd004797a9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:49:24.5198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8IfGBKRk9OymFjhi+FDpfmjy9OoZfiQq/eCFXFoz0NuuStj3/7RMZm0chHi4DEYUg6fhmItGKsGog2FkLpoJWxxcO2QMdzBQgPWCPlPJyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
X-OriginatorOrg: intel.com



On 11/8/2024 3:24 AM, Vladimir Oltean wrote:
> On Thu, Nov 07, 2024 at 11:50:34AM -0800, Jacob Keller wrote:
>> +#define DECLARE_PACKED_FIELDS_S(name, buffer_sz) \
>> +	const size_t __ ## name ## _buffer_sz __pf_section_s = buffer_sz; \
>> +	const struct packed_field_s name[] __pf_section_s
> 
> This will need sorting out - how to make this declaration macro
> compatible with the "static" keyword. The obvious way (to group the
> field array and the buffer size into a structure) doesn't work. It loses
> the ARRAY_SIZE() of the fields, which is important to the pack_fields()
> and unpack_fields() wrappers.
> 

Yea. I didn't see any static warnings on my setup but i forgot to check
with sparse.

> Maybe a different tool is needed for checking that no packed fields
> exceed the buffer size? Forcing the buffer size be a symbol just because
> that's what modpost works with seems unnatural.
> 

True, I could move that check to a different spot.

> If we knew the position of the largest field array element in C, and if
> we enforced that all pack_fields() use a strong type (size included) for
> the packed buffer, we'd have all information inside the pack_fields()
> macro, because we only need to compare the largest field against the
> buffer size. We could just have that part as a BUILD_BUG_ON() wrapped
> inside the pack_fields() macro itself. And have the compile-time checks
> spill over between C and modpost...
> 

I think thats reasonable.

> Not to mention, pack_fields() would have one argument less: pbuflen.
> 

Yea, I think enforcing the sized type like that via structure is a
reasonable restriction.

>> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
>> index ada3a36cc4bc..013bf4be2642 100644
>> --- a/scripts/mod/modpost.h
>> +++ b/scripts/mod/modpost.h
>> @@ -160,6 +160,19 @@ static inline bool is_valid_name(struct elf_info *elf, Elf_Sym *sym)
>>  	return !is_mapping_symbol(name);
>>  }
>>  
>> +/* This is based on the hash algorithm from gdbm, via tdb */
>> +static inline unsigned int tdb_hash(const char *name)
>> +{
>> +	unsigned value;	/* Used to compute the hash value.  */
>> +	unsigned   i;	/* Used to cycle through random values. */
>> +
>> +	/* Set the initial value from the key size. */
>> +	for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
>> +		value = (value + (((unsigned char *)name)[i] << (i*5 % 24)));
>> +
>> +	return (1103515243 * value + 12345);
>> +}
>> +
> 
> Code movement should be in separate changes.
> 

Sure.

>> diff --git a/lib/packing_test.c b/lib/packing_test.c
>> index b38ea43c03fd..ff5be660de01 100644
>> --- a/lib/packing_test.c
>> +++ b/lib/packing_test.c
> 
> I appreciate the test.
> 

Yea. I figured the addition of a test is good, though I didn't see the
need to compound it with tests for every combination of the flags, since
we cover those with pack() and unpack() tests.

>> @@ -396,9 +396,70 @@ static void packing_test_unpack(struct kunit *test)
>>  	KUNIT_EXPECT_EQ(test, uval, params->uval);
>>  }
>>  
>> +#define PACKED_BUF_SIZE 8
>> +
>> +typedef struct __packed { u8 buf[PACKED_BUF_SIZE]; } packed_buf_t;
>> +
>> +struct test_data {
>> +	u8 field1;
>> +	u16 field2;
>> +	u32 field3;
>> +	u16 field4;
>> +	u8 field5;
>> +	u16 field6;
> 
> If you group the u8s with the u8s and with the odd u16, and the
> remaining two u16s together, you should get a structure with less
> padding.
> 

I kept them as ordered by the order they appear in the packed data, but
yes re-ordering is safe, and does safe a few bytes.

>> +};
>> +
>> +DECLARE_PACKED_FIELDS_S(test_fields, sizeof(packed_buf_t)) = {
>> +	PACKED_FIELD(63, 61, struct test_data, field1),
>> +	PACKED_FIELD(60, 52, struct test_data, field2),
>> +	PACKED_FIELD(51, 28, struct test_data, field3),
>> +	PACKED_FIELD(27, 14, struct test_data, field4),
>> +	PACKED_FIELD(13, 9, struct test_data, field5),
>> +	PACKED_FIELD(8, 0, struct test_data, field6),
>> +};
>> +
>> +static void packing_test_pack_fields(struct kunit *test)
>> +{
>> +	const struct test_data data = {
>> +		.field1 = 0x2,
>> +		.field2 = 0x100,
>> +		.field3 = 0xF00050,
>> +		.field4 = 0x7D3,
>> +		.field5 = 0x9,
>> +		.field6 = 0x10B,
>> +	};
>> +	packed_buf_t buf = {};
> 
> Reverse Christmas tree (should come after "expect").
> 

Good point. I'll fix these.

>> +enum element_order {
>> +	FIRST_ELEMENT,
>> +	SECOND_ELEMENT,
>> +	ASCENDING_ORDER,
>> +	DESCENDING_ORDER,
>> +};
> 
> If you still keep this for next versions, this should go at the top,
> before function definitions.
> 

Sure.

>> +
>> +static void check_packed_field_array(const struct field_symbol *f)
>> +{
>> +	struct packed_field_elem previous_elem = {};
>> +	size_t field_size = field_type_to_size(f->type);
>> +	enum element_order order = FIRST_ELEMENT;
>> +	void *data_ptr;
>> +	int count;
> 
> Stored as signed, printed as unsigned.
> 
>> +
>> +	/* check that the data is a multiple of the size */
>> +	if (f->data_size % field_size != 0) {
>> +		error("symbol %s of module %s has size %zu which is not a multiple of the field size (%zu)\n",
>> +		      f->name, f->mod->name, f->data_size, field_size);
>> +		return;
>> +	}
>> +
>> +	data_ptr = f->data;
>> +	count = 0;
> 
> Initialization be wrapped into the declaration.
> 
>> +
>> +	while (data_ptr < f->data + f->data_size) {
>> +		struct packed_field_elem elem = {};
>> +
>> +		get_field_contents(data_ptr, f->type, &elem);
>> +
>> +		if (elem.startbit < elem.endbit)
>> +			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") must be larger than endbit (%" PRIu64 ")\n",
>> +			      f->name, f->mod->name, count, elem.startbit,
>> +			      elem.endbit);
>> +
>> +		if (elem.startbit >= BITS_PER_BYTE * f->buffer_size)
>> +			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") puts field outsize of the packed buffer size (%" PRIu64 ")\n",
>> +			      f->name, f->mod->name, count, elem.startbit,
>> +			      f->buffer_size);
>> +
>> +		if (elem.startbit - elem.endbit >= BITS_PER_BYTE * elem.size)
>> +			error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") and endbit (%" PRIu64 ") indicate a field of width (%" PRIu64 ") which does not fit into the field size (%" PRIu64 ")\n",
>> +			      f->name, f->mod->name, count, elem.startbit,
>> +			      elem.endbit, elem.startbit - elem.endbit,
>> +			      elem.size);
> 
> elem.size is in bytes but the field width is in bits. The error message
> is confusing because it's not clear what is wrong.
> 

True, I can convert everything to bits.

>> +
>> +		if (elem.size != 1 && elem.size != 2 && elem.size != 4 && elem.size != 8)
>> +			error("\"%s\" [%s.ko] element %u size (%" PRIu64 ") must be 1, 2, 4, or 8\n",
>> +			      f->name, f->mod->name, count, elem.size);
>> +
>> +		switch (order) {
>> +		case FIRST_ELEMENT:
>> +			order = SECOND_ELEMENT;
>> +			break;
>> +		case SECOND_ELEMENT:
>> +			order = previous_elem.startbit < elem.startbit ?
>> +				ASCENDING_ORDER : DESCENDING_ORDER;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +
>> +		switch (order) {
>> +		case ASCENDING_ORDER:
> 
> I don't see why ASCENDING_ORDER and DESCENDING_ORDER are handled as part
> of a different switch/case statement.
> 
I wanted to check both start/end bit at the SECOND_FIELD case, because I
had naively assumed i was covering overlap with that... :D Should have
thought through it more.

>> +			if (previous_elem.startbit >= elem.startbit)
>> +				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element startbit is %" PRIu64 "\n",
>> +				      f->name, f->mod->name, count,
>> +				      elem.startbit, previous_elem.startbit);
>> +			if (previous_elem.endbit >= elem.endbit)
>> +				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in ascending order, but previous element endbit is %" PRIu64 "\n",
>> +				      f->name, f->mod->name, count, elem.endbit,
>> +				      previous_elem.endbit);
>> +
>> +			break;
>> +		case DESCENDING_ORDER:
>> +			if (previous_elem.startbit <= elem.startbit)
>> +				error("\"%s\" [%s.ko] element %u startbit (%" PRIu64 ") expected to be arranged in descending order, but previous element startbit is %" PRIu64 "\n",
>> +				      f->name, f->mod->name, count,
>> +				      elem.startbit, previous_elem.startbit);
>> +			if (previous_elem.endbit <= elem.endbit)
>> +				error("\"%s\" [%s.ko] element %u endbit (%" PRIu64 ") expected to be arranged in descending order, but previous element endbit is %" PRIu64 "\n",
>> +				      f->name, f->mod->name, count,
>> +				      elem.endbit, previous_elem.endbit);
>> +			break;
> 
> The end goal was never to enforce ascending or descending order of the
> start and end of the fields. The point was to enforce that the fields do
> not overlap, which this does _not_ do. The rule for detecting overlap of
> intervals [a, b] and [c, d] is that max(a, c) <= min(b, d).
> 

I do think that keeping them ordered is a good thing too.

> Enforcing ascending/descending order is just a way of reducing the
> complexity of the overlap check from O(n^2) to O(n). But the overlap
> check itself is missing.
> 

Yea, you're right.

PACKED_FIELD(64, 30, ...),
PACKED_FIELD(60, 24, ...),

which would pass the test, but which overlaps and is wrong.

If I put the overlap check to a check outside of the switch, then just
keep the ascending/descending checks in the same switch case we should
be correct?

