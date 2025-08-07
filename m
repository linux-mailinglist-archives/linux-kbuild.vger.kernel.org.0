Return-Path: <linux-kbuild+bounces-8314-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D929B1D91C
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9AC1AA486B
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Aug 2025 13:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417D7253B42;
	Thu,  7 Aug 2025 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQtGmqEM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D879F5;
	Thu,  7 Aug 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754573545; cv=fail; b=bMic471sI2xjpJo4Agnb1B2/UmlZvAzCOE1sV2e9VPJxkdOK/pLDBFcXIfq40UCYmMN9KYS79RbPgTng3mzAaGN+2AOJClvTJXAAu+XYAR8+LHjcgngtgXMeOgBXtOCQXSB49AzDHwvGM/e/zK8Dw3Ioa1f4IMymadlA/dV+Nkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754573545; c=relaxed/simple;
	bh=0szs1Jq8s6h4HKxosYQzJCuyQu1BSQqYigqfgdoj+7Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XeCRmqadfVwcY60cysLGt8Py1ByBnuxWaMu4h9M6rlbvFhM4WfAfXEoX3UahCZmuwiCK+iyI45OJnyPMA2Xvbj37tA3hTbwv6Bs4hJfnvNEZ5qx1PKVM701OsOaDW5xdnaJFBwi2AgKKmxoIUyWJHRMXZWQI1FELCq8yIoWVEwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQtGmqEM; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754573544; x=1786109544;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0szs1Jq8s6h4HKxosYQzJCuyQu1BSQqYigqfgdoj+7Y=;
  b=aQtGmqEMh6/PBAkuv9sGQbg+zBDZI5PksGoffVTOPv9tVyNY41ERms3I
   HTiqR2M3D6s2Y7dpG+mn3VqcJcu7WUtqURTN1xr/5iTh0RqNg01+G8/4e
   BUfZf4NLqlQk1+Rp2gHkbvKBUDuJgma3vvmZO0aOFmMyTqNRGgh03NLva
   PdXOUFYSfk1MUI6ejZrfdpNwll37C+NOyr/MQv4upmd2EPcWGOIsPW8Pe
   xsLFO/eCnRN/RObkEkvHnn1YTQMuOmnP4eFGpzcXJjW9y7jiEzA+pyxD4
   sbG6UJL6R5LmZ+kUnVIoGDRnIsUZZOd7PbtirZ0RLoTFbYSMX2I6zNn9I
   Q==;
X-CSE-ConnectionGUID: wAcr3AQVSoGbEFj481VxVQ==
X-CSE-MsgGUID: KjNFa3/yQgGtlrmQV0B3Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74486556"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74486556"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:32:23 -0700
X-CSE-ConnectionGUID: w1hrpjm5Ri2F21mzBESwQg==
X-CSE-MsgGUID: yVXwhpexQj2GUiXFwZqZPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165070177"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 06:32:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 06:32:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 06:32:22 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.83)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 06:32:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flsKlEFDAwe4gVUeNANY7rJrSxkPM6eDpr0ihpr8xGRo/dqP8XTTNf+0QPOZnAAnLkUdd+dE9WkeYPdEyrcG04Uhti+ck15Ro6bDVIKaYPzCNskO5Jdgvg08ajbHyfDcp+oJSQo26hVh7oAgw4wnJ246kHcaRSC2L6/y0Ca44t+lMpUHcgzZnK11cOrp02JQfOkxFUDk4qZkhsYVhi0dkcT8nmcin4pibFNhWcExkuqlQEljfYUL3VDi9p+a3ZTBOOJSvESy7HNx/WqgHUmx49RFOlfFg5bgoVWDVnMVCFmURhi2YrAosrM1YqwHFeMNxHJFPuU81v9FyTuobjnMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCiv7Q1qhWwrAlW7GUA/XsHsUPv1BFGug5X4fvOO9AI=;
 b=h9x4h7Aw2nJJFb0a7Nx+6mv+8Nn/Dm/A0r4SmkPpZVg5NVwioMm37NCJpVPRlgNUJWCjUagJF92M8FjYaYv+3O5/XN84hfXMxVKjm3WnE/3elnn6yqO/uipZJpXMVTJSfY7N9DctkVzueXTQ56hX58QAfu3CLBsGMIApmhCwXGPi3gFTbwsYVMtJ0DY66bS0gecBl0eIeMtc4iZhDJVezFQ5dT+wXsBsvzpUtHOKrbIYQ46JwGhSkmuiKc1NbAFOLAkJvvcCycQchgOVi24jI97PrHwVq49OIKHXhuqMEw4jNHntlPjtpGCmMpoRPL4YFg65tN1WfyNam0rbU4HQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 13:32:17 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 13:32:17 +0000
Message-ID: <a01cb1af-8f17-42c0-815c-f9c44a399cbf@intel.com>
Date: Thu, 7 Aug 2025 15:31:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
To: Kees Cook <kees@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
	<linux-kbuild@vger.kernel.org>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-hardening@vger.kernel.org>
References: <20250802184328.it.438-kees@kernel.org>
 <20250803173235.GA716998@ax162>
 <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>
 <20250805214823.GB200407@ax162>
 <546c9819-20e7-4474-9281-5d1567263637@intel.com>
 <202508061158.49E749B46@keescook>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <202508061158.49E749B46@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0040.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::24) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|MN0PR11MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a247c10-59d7-4b9e-ea72-08ddd5b6d396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGx6ejNlSHFkOEFRb0ppZXVBdkJ5N1FRa3cwQkFwRHM1Z0ttRkttckRNMklY?=
 =?utf-8?B?OXZnV1p3T3U2SHFvYUdIajhvU3hWenk2Ulh2YUZGTGV6TXFoRDVZOElDcm13?=
 =?utf-8?B?M1ZJTlQ5R29kTi9FdldXMjNjaDlKN25NYXo5L3dDOUJkYmpIcElkMTc2VjZB?=
 =?utf-8?B?VHg1Q3N1T1hVdWxCMUszamJRMlJOMXphbXRzRW1MNFlLM1d2WDlkeFJzTE1t?=
 =?utf-8?B?WDByTmVsYldTRTBVSGZLS1JteTQxQjV0RUtHRHNzUTFVRUoxbFNZWDlNTS80?=
 =?utf-8?B?RnRQT3pPSXZCWC8wZ1NpQ0VIRnY4NGl3Q21KWm9PMHI4ZDVIaEg0em9CdXIy?=
 =?utf-8?B?eUpraFYvbXRsVmllUHZwZHA4Ynd1QklvNE5rS2I3enFLSlBCNFRWaE91TUEx?=
 =?utf-8?B?QXhxMVp2Y243dVdsb2VCdXA0RzZqOVVDOVZMTmZ0ZFR2T0JZMWhQa0FLbDFQ?=
 =?utf-8?B?ekQrTSt1cnNnV1FKRWVnT1BzUmRYTHpPQ2kyZGdGalljRVg1emxtM2ptWld4?=
 =?utf-8?B?YS81NVBDMElBZ29GU2h0czlZVXZBSm5pbFhYZUlWZXovVVMyWko0WVFyZHhV?=
 =?utf-8?B?QkJHRmw2a3hwdzhkWStRODd2SEJ4TDZWcVpvTTlCc3dKdis4QmhqV05hY1Jo?=
 =?utf-8?B?VEtuVXMzbnVvcWpKNmJ0K0dMMitRNmdGem5GL1ROSVJ2YlUwRUhhcHZTVnYy?=
 =?utf-8?B?M05heWFGZXFGdEpMNThjUWZiKzIvSnhOVHhubzd1R2lrYW1pQnMzc215aHRU?=
 =?utf-8?B?Zk1hd1hWMWVJZ25iOXdleFl6MStZYm1UaGFKR1hLUGpwSStDVTNpTWk2bEFO?=
 =?utf-8?B?Wk9haWgrdTNoUS9YditHOWZDVkN0MGFvdlZDd2QyVkl3OGRKeUJ2MysyYXdH?=
 =?utf-8?B?NEpMeWNGcTdZT01wWURmUVFmWTJURGwyZUgvWDBrd3h1cTdvR2FYbUhiSGp4?=
 =?utf-8?B?V0tOUFFYc1hPNFRGc21CZVl3UDd4cS9PeC91b3NueEtGM2tvYlc0RXN5bmIy?=
 =?utf-8?B?ZmhSSGMrYTFIYWlQZTkwY3hLWjBVNkdHQ1pZMGZHWUp3MytwWGQ0VTA0ZG5u?=
 =?utf-8?B?NzB3WXZZeUMwTjdwTE83N2IvOUM2ZGZreFVrQU5sMkVLUGNGRkFRS0YxZHc5?=
 =?utf-8?B?RDRBcVFEWitKZUZvT0tiRzZBRGV3bUJ3SGZJRXFHWkFxRzRsbm5FeWhJdEJC?=
 =?utf-8?B?dVRBS1R2K1dJUGZQQWpFU2x3ZFIrWHNGZUVzSDJReGcxNzNlRjJrS0g0bnRU?=
 =?utf-8?B?bG95cllyb2xHSDR0OURBYkQ1Z0k2NGE0cUFnSmtKbnE3VEN6YmZTeVdLZGFu?=
 =?utf-8?B?VEdXUlN1K21pZyswWEZveEFwZDRFcEpWc3hTMy8yVUFHa2dNdktWOVhVNTFl?=
 =?utf-8?B?OVVsWU9maThwZDdsQlI5aVhYdGl4WU1hcXVSWlBUQzRZWCtiWnRZQUt6OGlV?=
 =?utf-8?B?dUhCMkR0dW5NOGUyc0tIMHdKYTRJWW5INzZacnlnc1BaTUtXTGNZUExDbEZR?=
 =?utf-8?B?T2pCS3dSbWRjSEQwMlJGMDUvQW9tODVTWGM1STBGOVR1dlFkNW01YTNEQ0tQ?=
 =?utf-8?B?ZVFvNmxXbjBPZkhxZ0U1Y3hvTi9rR2ZXV01qNVh6a01OdXNFU0lCYW9rZW9R?=
 =?utf-8?B?dG5ZL2tJWE1ZblFkQUdWejhML1lhdW4xZ1ZLdythOTNlck9PUG5zRDBNYnhJ?=
 =?utf-8?B?M2hSZFBBanIzUjZwWmxvMEpSVndxcGpOZWthVERzQVBQeHNTaTZ4NVkyV2Z0?=
 =?utf-8?B?V0MrNStHMEoyaUdQWUU0SHRLdkFBMU0yQm5McmNsQ3hUUlhEWTdsTFVPWkFW?=
 =?utf-8?B?dk1Ha0IvbUczSTB1RFhSWDk4NGg4anVLS21hUFM0T3d0WENkSWJDZzZuVmhq?=
 =?utf-8?B?RDdnSVlqV0tMZFdPLzh3VStpbytxQmIzMng1dlIrVmMxWEZZTiszRWltN2pS?=
 =?utf-8?Q?9DoqgpwEbbk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDcwOTRuZWxPT25HT1hBSWpLOXQrUWEzRjRzMktZaktqT0tkcCt3K1B2MURD?=
 =?utf-8?B?WEhSK3RuZFU2dGdDdGV4Vm1td3lwVHRDenZ1V0V3ZGVubXpPTjV2T2xCSTFm?=
 =?utf-8?B?ekQ5WVIzbjgveUZEbDY5bjhmSmUrM3lPZzV1OFhzM3ZlNkVibHZDajVxR0cz?=
 =?utf-8?B?d1FDcmszR2p5Mkp4cTNsMEdnQ0J6a0FaTnFtUmo0by9JV2lNOXJLMnZBaWlU?=
 =?utf-8?B?VWlCQTFwK3VMUm1wTGtSRDIvWm5icVM2bU5ZTXpVSU1yYVovbENKUnlsQ0I4?=
 =?utf-8?B?YnBuY2xtVkp5RGN4c2RreUROLzlzTXFTOHdqbVlUWW5JRU1WdXJoanNtOUdq?=
 =?utf-8?B?TDNMU1Z1TG5BYnh1Rklzb1RveW5nM1paWFdkaDBKWmJ0dWhRVk4yQndzdC9G?=
 =?utf-8?B?cERpOVBBYnp3aFR1dHBHRUdYZUw5MzBQeW0zU1ozUW8rNStBbmUyQjNaSGcv?=
 =?utf-8?B?OXM5RkI1K3NnaEd1MXFhYnFMWDB2RWFISitwd08za1dRZ25GY1liODNmZitD?=
 =?utf-8?B?QkttazU4QmFDVEZhVG5TZW9hamlXNG5hclpyS1pmWmM5a1hvSEpqTnE0bHNW?=
 =?utf-8?B?OHp1WkVsQ1laQUc4OXBKbWJLaEl3UEtOSTM2MkhpMTRDbXltRzQyVFMzMXYx?=
 =?utf-8?B?eWdDbXhXQ2ZGUW0zMmF6K2hLTlF2WGxkYUxOa0JKYUZteWZXL2hGNys4VWhx?=
 =?utf-8?B?cmlwN3hKRWwrVTNSeHRiVUZBVnVXVW1lOHQ0bHNnT1dHY0xOUW1aU1BkVDE5?=
 =?utf-8?B?M1MyK3VKaFB1eGRrNExxOXNwYlE2Y2lCM25YM3FxZlFTbFZ2RW9UV1lPc0Vk?=
 =?utf-8?B?RWRrZnZXTkFWRkFTWTBlZHRkT2tGNkU5SjlVTnJxOHVQS2U1NEhNc2FIUmJP?=
 =?utf-8?B?OVdCa3pyTEllTXFuVExWb3JmZHJOQVJSeVV1ODNwaXVOR1VuU3BOSVp4VEM4?=
 =?utf-8?B?QlM0MzFFSmZUSFVQcFBiL1crOUZlbnQ4ZE9SY0xocnBEbjRKdFdtSmFFaHA5?=
 =?utf-8?B?VTVZRlYvOEpzYXcyV1V6SFBFcnF3SzlhVEZZdTlOS3hSL2l4a3liT1VWQUpR?=
 =?utf-8?B?L1dVK0x0ckNhWnJZWmlCMEZFSjhSdlF0cWZFMDkvOTJpUEc1NmxSQnhSNFRx?=
 =?utf-8?B?UVdGa2pEbXdqYTc3blRjZ2wyd1AxTng2cnN4MVJ0aEZuL2YxbWh1RG9Bb200?=
 =?utf-8?B?RzYzVnNidkFQbDFTNDN4dzVqY3VmUm56NS8vaGxYRWg4NlZUYy8xcFVudTVy?=
 =?utf-8?B?SWZjRmxBUFVIMUZ0dHJCc0tjRy81eWVkUXBTUzlDZ2pwazJjMEFyaDBNWVpy?=
 =?utf-8?B?dElId2JIbkJ6OENkcDhkcElDWXhPdWpaVFJKNHdaN3VRV3liT24xY015N1VB?=
 =?utf-8?B?cTEyNE5kZ1VRemFpLzN1LzdkU25BQ1BtNytqMmdYdjMzbkRNQjRXVVZOU09r?=
 =?utf-8?B?QTkvTjZaSU0xNFM5dWRZU2xkN1Z0RjBmNG1jT21jU21JTyt5aFBQYVExbjRy?=
 =?utf-8?B?elllUHZmQXRWRjl1NWNCNGRIa0lKUXFUOCtXZzNVak1iU2lkTk1wTTBMR1JT?=
 =?utf-8?B?bTdCSXhIc00vZjhrdmZVTjJrZGQ4c0x4OFhMN0Q0aTJQWXJoTDZlY3JWeUFF?=
 =?utf-8?B?NklpL2tsL0pUbVRTdXBmSDZaTFBoTEVRaFNLeXh0VWh3Uzk5Wkd0dEJVbjEy?=
 =?utf-8?B?RzgwSEh6SWliQnpzOTMxQ3FFeEpmWVl5QmRaRUlGRm9lbXE0bWNtYzhDRE51?=
 =?utf-8?B?ZTY5TUxDalJEK2NNTHNUaFZIa0s4bkV3ak5PZjZmc1JCdXIwdC9IbFA4UGdz?=
 =?utf-8?B?bGxDSXFqT2dKejlrWlZyNnNpRkV1N1ltZ3hZQTlBUEJ0c1ZtcjREVmd3OHRJ?=
 =?utf-8?B?NmFqeHBaU2djV3RQYUJ2QnRQcmowSkErMFE1b1RxQnZidTcyR1ZOSlZoaGpL?=
 =?utf-8?B?cTVPa2t4MmdvTEY5SGJvN1luZFFyMmx5UjRKSERtM3loZm5CN3p6cUdTWmpL?=
 =?utf-8?B?WFFieVJyNGVNNmU0Y1ExbDRYcjlyc1RXbERFREoxbmV6VVlvUEF1TExocVNz?=
 =?utf-8?B?bTBxUkhDUFh5aVV4OEhscWR2eW5PRE9mejR6MWVEamprWVg0YVc0RUEwWEFY?=
 =?utf-8?B?TE0xcG5IRE1GZEtNRHhteVd6em9sTlRiQWRxVkZHR2FUY0ZWV2wvMUtCK3RR?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a247c10-59d7-4b9e-ea72-08ddd5b6d396
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 13:32:16.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gj3HgmjKvmAWrWbxkDJinbgTbRmD/6Y0l3MKGaKbda0Kl9wznEMZAy3qGxmoJP9iJJjDRzprm2oEH/K55IoFaZRLjAmEdiFRR7RQ4xFHrmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6304
X-OriginatorOrg: intel.com

From: Kees Cook <kees@kernel.org>
Date: Wed, 6 Aug 2025 12:05:32 -0700

> On Wed, Aug 06, 2025 at 05:29:55PM +0200, Alexander Lobakin wrote:
>> From: Nathan Chancellor <nathan@kernel.org>
> 
> Thank you for the fixes Nathan! I'll dig through these and get them sent
> out before I try to land this patch again -- "But COMPILE_TEST is never
> wrong!" ;)
> 
>>> [...]
>>> descriptions expected to be stable once they are released or are we able
>>
>> Ethtool private stats are not "ABI" at all. Moreover, if they result in
>> incorrect code, this needs to be fixed no matter if someone already
>> wrote scripts dependent on these names or not.
> 
> Internally there isn't an ABI, but the userspace interface effectively has
> an ABI: the strings are fixed-size and NUL-padded but not NUL-terminated.

Ooops, maybe I missed something. I mean I know that Ethtool passes one
big array of 32-byte-sized strings, but is it fine if some of these
strings won't be NUL-terminated?

> 
>>> to adjust them? We could maybe shave an 'o' from 'unknown' to easily
>>> resolve this without losing much in the way of quick visual processing.
>>
>> I've no idea why it's popular to define Ethtool stats names in drivers
>> using a fixed array of ETH_GSTRING_LEN and then do memcpy().
> 
> The above is why: they are fixed-size, non-NUL-terminated strings, so
> many drivers use this memcpy pattern. But not all.

Sure, lots of drivers uses normal string copy functions etc.
But Ethtool strings *must* be NUL-terminated, so this fixed-size +
memcpy() only hurts.

> 
>> I've been always using just `const char * const[]` + strscpy() (then
>> switched the latter to ethtool_puts()/ethtool_sprintf() -- we even have
>> special helpers for that). In case some name goes past ETH_GSTRING_LEN,
>> it would just be truncated, but always have \0 at the end.
> 
> Unfortunately this is not true: not all sources are NUL terminated.

I meant the following:

Imagine a driver defining its stats string:

static const char * const arr[] = {
	...
	"some_stat_that_goes_above_ETH_GSTRING_LEN",
};

Then, if this driver copies that string using ethtool_puts() or just
strscpy(ETH_GSTRING_LEN), the string will be truncated, but \0 at the
end is guaranteed.

> 
>> Plus most of the names are shorter than 32, so defining such arrays of
>> 32 just wastes space in .rodata.
> 
> That IS true, but many drivers just keep giant blocks of data they can
> memcpy. :(
> 
> Regardless, I will double-check this and see what needs to happen here.
> I've fixed a lot of these already[1].
> 
> -Kees
> 
> [1] https://lore.kernel.org/lkml/20250416010210.work.904-kees@kernel.org/

Thanks,
Olek

