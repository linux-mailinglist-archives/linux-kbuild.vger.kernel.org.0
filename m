Return-Path: <linux-kbuild+bounces-4582-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 001FE9C27CB
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 23:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFD71B22680
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Nov 2024 22:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC69194C83;
	Fri,  8 Nov 2024 22:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="II3adMy+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342E918DF86;
	Fri,  8 Nov 2024 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731106406; cv=fail; b=EKdgC1dlCc+N4MsO21zBTRxJu9HVTj8PLrYNHVDnfgiB2qq9xzmxJKcpZPiPTCsWcBc3ZQIn1aiFGzQeA4K0T1qvEje/lxEjOMgx8aHHCJjXac+/qfBDn635tTEtsRgyMP/TOv7C08tRePU5gIhlTZwQbi9W7pZmoH0LNkheP34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731106406; c=relaxed/simple;
	bh=BYlzsR9RNXnS69AI/VW+wKsyI6uw/0fQHTWNGHtCh4M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lCAbCR40DvIqvIFFx7OVUVYXfxUF+JGc4KG/o19lkjCW/Jtn9z/P0kGQLHy8jln7XnKShhGpUEJEL0sJz+ar3ehKMR3SYzrpcGkU/OHkEtyQYnoks2dp4sBYRkGcc56/Vli5iidtY6Dtm3S/VWwW5wrqnpqLKYfoiMfZQLdrtW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=II3adMy+; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731106404; x=1762642404;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BYlzsR9RNXnS69AI/VW+wKsyI6uw/0fQHTWNGHtCh4M=;
  b=II3adMy+VnCCzCkuE1STMhlqSVLfm3CIgsmNW5/IVFi1xh+Jn+GNkMmu
   +h/EvMyTgXInD9izViJIYw+VwsbxeWTGghAD7Ln+xYTIy8SoLrYxnrwND
   poRvTNQZYwEd76NhkVi6zOddLddmQWYFmOWBZLbIK+l5mIOIs08d/KNIJ
   AQB4gk7/g32F5A3CBTeLbglRlzyRfdnGWy/kxAHP4TVFgJjwAu7BHlxKu
   oxGbPc9oJMznDMYj+pWA1LMe7FujCumD7rwxrBfidjn56LTq4cExsSdmu
   +JzAU2i2n2yUoaXoWa8NEY/AmY8JKYGo5VEgi7RfGct/metr5+JHUrfqk
   w==;
X-CSE-ConnectionGUID: TidGTLF+TlKcobs2hZlxqw==
X-CSE-MsgGUID: mtniq3CFQpSNGU2P+DlpBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30861817"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30861817"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 14:53:24 -0800
X-CSE-ConnectionGUID: kZGlRpvfRRS6DVXLIT0wtQ==
X-CSE-MsgGUID: QsWEneiTQ9iM3cMnOWOexA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="86136441"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2024 14:53:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 14:53:23 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 14:53:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:53:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkVX9Gh/j2HhO/CfHxb78mqdICxLqiiTM819re3U4epiz9GqrQ/lUu2gHLVRL62KOU06WTvaLKTiIdNW4neqooiS4UneUse6qNqalxj89EAoTVBgJOsWwyRUKGN9fFU5y4V0sDF+pKYYBz6yw6xkuzm2Ouh4/ZXCZ3VlLRV2NOOq9wwFvDaiyy1qQptUv4Vw4mnaBey+s21iRwfix2fvQDzvriCQU2inYVU/kYASpI7EKbFkDlBbVaKECb4oyLWFuNXqof2DpgoEmJPsJTXMogZG4PuEQTL/B5AK+w1laEctLXSXS+A0m738FoXdnfXOg7ZrpSvGunhuHeDu1WXTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57qDn4+pzuchfIr1lV3/2eYy5hvFrRRNf+Y5abFxTss=;
 b=R1wYRL4TXhRPHSMBIIWkCRmtBSXYfwNmVWkHeioPqd2b9PdNrUd97BrWGc+Zel8rKIQHuQd/30Bjy1FOUEDlwaaexkMHDj9ZQiaAuzs2qbxcF4ejXQkdW26E0CiO99YQqPH43v5V3+qHKOsY/WIwU4kY4j81He1nOPOpIPSpQwUNbeNof3Djfqs0TiLnacymI/prTmxkvytn8cP0BQwmfCwFiGNQ5dVOLIQjcFDxTRteU1dO6G8OxSnZFT08AVG5DD1Xt9WnP7Kg1tHEeU5CPkvzJtY65CroXd+w3uEijY5/cyL4jBg6RO/113Df4/6Gv+bM9+OqH7xLPz1S+uEkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 22:53:15 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189%7]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 22:53:15 +0000
Message-ID: <1b5543ee-c460-4b3d-8a93-a51c9a5d82f1@intel.com>
Date: Fri, 8 Nov 2024 14:53:11 -0800
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
 <20241108183104.wfzvav42zgslqofy@skbuf>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <20241108183104.wfzvav42zgslqofy@skbuf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d4b125-b26b-4f9b-face-08dd00482156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDZVVFBycWptanA0b2RyTHdySE1YckFHdktvYkhVMk9GODZGNlA0cE1PaE4r?=
 =?utf-8?B?MVhKZk92eFBiajRxdnE5KzdMQ3RnalNSZGx6UEJYUjYrMUprQ3Q2ci91YTBk?=
 =?utf-8?B?d3BaZ3ZpNVljYXh3Mkd3U1UrVEJ4aTlDYkYzcWc2TGRkMno2di9xcEliU2Ey?=
 =?utf-8?B?RklnY0U3VEdseHJEeGJaR3F5eE1JVzVjcS9MUFU1Uk9QQ3J6SEpQM21rdVZ1?=
 =?utf-8?B?MVlnWHBSNS9PU1RLSTlPK3IreEI1aGtRNUtRSmFpZllFcnBFZGlVUWh0bDAy?=
 =?utf-8?B?TnFtNXZGcE9QYTZwU0RFVGhUUkFWMUVTU0tON3VhWE0vejBRWTIvcy85QU1W?=
 =?utf-8?B?Z295U0tPVGRJWTIvK0kydi8yWkRpQitUZFhmSEpyekhzZHI4dDAvTUJYL2dB?=
 =?utf-8?B?dEgwemJBRktCUlJTM3hlWStKejR2TFJ2MFl5b2JGTlpFbjBQTmo5YVlIV1ZD?=
 =?utf-8?B?b1BSV2RKY0oydGR2alZyTmtFMGdCRldtY2hWS0h1dWlpWi9GdGg1dFBEN3gx?=
 =?utf-8?B?L1BVc1NVb3hlV0VSUHJzY09IOTFZcFJPRFVZMGZqbkRUbHEyQ2JnRXJiNm53?=
 =?utf-8?B?UE5qSHhzTUE5N2lhSEt0QnBGR054Tk8wUDZkUVVHMFR5K0IxK2dRZ2cwVTF2?=
 =?utf-8?B?M0Raczl1TTV1bndwYmtIWGlKNktNd3BtN1pvUzY0cUdzOHAwamFlcUtZaW9u?=
 =?utf-8?B?ZDEwRXUwZm9pdkZlTkhwb2pBL3RmbXZuWmY2KysxTE44UlduNFRSc09wU3NX?=
 =?utf-8?B?NnJGbzVxMVZITDRuaStBaVlmZDVXTjhPcDAxNEM2TGx5U2JIUGJ1OU1vRWNn?=
 =?utf-8?B?aHpyWllZS0RybTFEVlcvdlBjZGZLZ2FMdmVNWWJQaG4rVzNWcTRIL1BqeXJD?=
 =?utf-8?B?ZVF5dklsTTFQVEdaM29QdCt4MWVYQTFyeEMvWHQ1SDBhV3RxV3oyTUpmYVFm?=
 =?utf-8?B?dEp6VVhjUDlpcGNFQitKK3M3TEl2Y3FNUG1LNFVEN25MVldzTElXNEpuY2lX?=
 =?utf-8?B?VGQyVVQwZkFTWTNyaDRsR2EvVkhvbExmVVNtQ3dHNm84TmNnQ1dKMzRYK0tp?=
 =?utf-8?B?SFBvVVFhbS8wUzlKTEkwSjNoVWNqVmg3WFhMTnROTWsxSHRsREhVbTN4cUJP?=
 =?utf-8?B?NWFEUU8xbktRMERLZkQ4TTZlRDJSOGdwQURYVHk1OGIveHFRSEV1ZFVEcWdP?=
 =?utf-8?B?SURwT3d4d1pydGtNNlZ3clhIV3RyLzRHK3RBT3ZKdVhYYnlxRGlQNGFzY0Zw?=
 =?utf-8?B?MXpBK3FYTHVRQVFEdnRuREordXdSQXYwRG53WVY2U1dDWnJaV0ROcmsyYnU3?=
 =?utf-8?B?ZlNhSkVQNmFFT1Bpakt5MmEzVi9lSUwwM3dJZ3NDMGc4VzMzR0ZQTWx3OE9w?=
 =?utf-8?B?dXdmdEdDSlA0UnNPUnJEblJodW9WTm5XRGtKTVFoQkhXQWx6ZGtSQTN6Z3Mr?=
 =?utf-8?B?Z3pnMjFGR0FERkdpby9rb3ZtYmdudEpZZWtmSHF0aVFTdXBQRTRVK1JRYWFS?=
 =?utf-8?B?Z2duLzVuaGhIZVJ0Q3RsemEyK0pFQXhjK0hzc3ZneWdIVG1XZlhtMzUxM2xP?=
 =?utf-8?B?dFA1L3RYSHl1bThIYjBSdG9HNTJPYmxJTUg0Mm5pR1dMQ0FqL0RxK09kN1I3?=
 =?utf-8?B?YWoyS3FmWHc2ekM1c213U1VIMk9Sc1dCZXlDNEo5NGVmZnAwSHZKMytld3Fm?=
 =?utf-8?B?UDhRaUFXQkxnbkhVa1VRV041VUhCa0pzeWoya1RxN2I3OENod01VWjk2dFE4?=
 =?utf-8?Q?9cpJhh53+I3HNPiChkeZf5JqwYGvPO3qGr2KJAv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5095.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnlNTW5jSldObjBOUU8zYjlicmZVMiszSTR4RTVLYXhGVXk1TmI0MHc0dWxT?=
 =?utf-8?B?YmhUcW9TbnlhUEpMNS9CYXFHK3g4OWpJNEtsMGoyb0NaWHJmbWRCbXZubjZK?=
 =?utf-8?B?Z2pOcnpoVGRKRkJyeVNoVXlGNTZ1aWRYZHo0OWd1TlJocERVdTVYZzlld25O?=
 =?utf-8?B?MmFLSnJLemFxWWNBQnUzSE9uenkyOWN1NlVUbjRpUXptczlpYjQzLzdTaWl0?=
 =?utf-8?B?eEE2cWw0SHA2MTdZdEZDTVVvTS90Lzk2V3RJNTFzQmI2RGZaVnk5WWxTMC9L?=
 =?utf-8?B?UlJKVXVGSEtkRVorY05pVVlDdUdRNldBbWM3M2dFejQzY3JReE96cnk5NFlx?=
 =?utf-8?B?aG9xSkhMblhuWUVhSDdPYkZXK2YreG5YeE5WakdoeG9zN21SZGZXOUp2UkNz?=
 =?utf-8?B?Q25qN08yUzVZQ05nVzRpbFkzdUNEaGF3WEd5VkNUNEhobmpWd2pZZkVNRkoy?=
 =?utf-8?B?Um9XT2RtRUl1N1NYTjRndEhISDdOejU0dWFselRQZndhalEwekxxVm9xSkZs?=
 =?utf-8?B?ekdWTGROeVBrWVUvZEtVN01GbjhUQ2xTcWs0cSs0RXoycmV4R09BV1Q2b0Rj?=
 =?utf-8?B?c25RMG1aMkNWeHNlK3dIUFNHZndxRUF1ZGpGTGppeDhTclh2dVVDbkpWbmF2?=
 =?utf-8?B?YTVwNjFjcCtHVkdpUEJTSlRrQ2phUFBFUjU4cmhmNzYvQlBob0s4eXN5OE03?=
 =?utf-8?B?bWUwUEFUV1ZLaXl2a2EzUU9UZ1pTSmpkN1V4OVRBS09JcWRQOXJtYjUzcGJM?=
 =?utf-8?B?Y052WE9aT1E3RzljVE9yRGc1TVIxa2VsRnBvU3djdFlLZmIremRiMndkWWI3?=
 =?utf-8?B?L01kb3VnU0I0VTJkS0hhQUduanlyejRsaUNIRm1hN1ZkUXVtdFhKb0IveU5R?=
 =?utf-8?B?Mi9OenlnNUpoL2RQVEVwT3IwUmh4Q0ozSWJPdDZnNkUwUCtseHBCYm1oOGhk?=
 =?utf-8?B?OGZVVVV1RmJ2WVJGQmQ4d3hpeGsvZnRHWkYxLzhGeVc5QnVuYUQ1cVVDSnps?=
 =?utf-8?B?aUdTN0RNZEloT1hLL2UvMjcvTDVxMVJkLytGeWlic052QW1UVy95bUhUakFu?=
 =?utf-8?B?bTBUaHIrejN4YlNqdXRkVWZQNHc5OXEyd21jOUNVRDZZUTFRMTVDOVlLMEFE?=
 =?utf-8?B?L3duR2pQbVl0SHBtalVkaUI5VG1Ua3pqaGlyWVhJaWxIQm9pMEZ3OG1JRklZ?=
 =?utf-8?B?QnhFcTlmMjhpRnlvMnpabFpKZjVLTDlhWUEwL1JFODB0ZzlPKytXNmw1RSty?=
 =?utf-8?B?VDVtYnNZV1BySkE0OFNlcEIvVFdxWkloN3FNazhPVjJNdVdzNXlNWXlPYWRm?=
 =?utf-8?B?OWpwUnZsRk5QdDRlYmFpVFZLaGVycnhTeTZDZER3L21lbFJaWEtuQVpTQnF6?=
 =?utf-8?B?RnVDRnhNZjA2bldwcFZXaEUxZnJ1TzR5dkdCZkM1THo2RkJEdXNXQjFKazhj?=
 =?utf-8?B?RU1tSjBPSzd4VTRIb0xKUmlVUXF6Rm4zUUhCdTkzcW9mNzBCQWh4aFRrdnlM?=
 =?utf-8?B?RHZWSEZLOE4xb1k1K05yQkVhWldlaHBFU1RiQlJydGkzZ3g3MEEwa1JhZWFq?=
 =?utf-8?B?VkZyTS9RRHZUTzRNRXJJWGRpRXgwUnkrMTdoK0ZzZlJoVjhuRGZ2QTk1ZE9F?=
 =?utf-8?B?NGdmRHp0R0JkMTE5WGZKaWZrVThUaXVUbkEvdDRFUVo1Q2xEOHBNekxSSTAr?=
 =?utf-8?B?MkFPMlRGQkpJbTJZMm5DRXFjcjZ5MXh5QXhEN3dWUGlvSG5TMEJGT2s5VGJV?=
 =?utf-8?B?TEJMU2NKYnZZbHgyMm1xY3JEUW9WT1cxRE80dWw0Y2huc3AxZk84a0loaDNm?=
 =?utf-8?B?ajZRbnM1YURnZlBuVnlCSnVTa0hubGtUNndRMlc2T3l6aklzcmFxUjAvNUVX?=
 =?utf-8?B?TmpDQUt1MVBDNkFMMUczVkFPWlkxNzNnQVZnaGU0bWJBYmZ2TFJTL1JQV1VK?=
 =?utf-8?B?ZHRjU1ZJQTkyNkdnYm1uQmRYelRpWnlYcGgxUWxuRGprWWVhckc2U1djN090?=
 =?utf-8?B?bG5kbDZxWko2L1lxK29XckxuRWFYRDBrUXl0dGdXN0locXRicGJJSXFQYzJG?=
 =?utf-8?B?TndnK1ZFREJvOUFIT1U2YXRQV3JoMHJVVTF3eFFkRGtOUms0NnlrT0pDQmNB?=
 =?utf-8?B?VCsrejZtV0FBSnNDeEhBZlpqTXdWbFdSN2djUGxYQjdSaW1EVGNiNWhOSklz?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d4b125-b26b-4f9b-face-08dd00482156
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 22:53:15.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8LQWKsVhajBe69m/dpEbNPd4RgO2AhskUlL7WffwxKJtDTm24GCcRjTwTtnECh46ujAESRGURWAAVOq6YgQReGZ78A1YkXZWHyTcq6cuug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
X-OriginatorOrg: intel.com



On 11/8/2024 10:31 AM, Vladimir Oltean wrote:
> On Fri, Nov 08, 2024 at 01:24:07PM +0200, Vladimir Oltean wrote:
>> On Thu, Nov 07, 2024 at 11:50:34AM -0800, Jacob Keller wrote:
>>> +#define DECLARE_PACKED_FIELDS_S(name, buffer_sz) \
>>> +	const size_t __ ## name ## _buffer_sz __pf_section_s = buffer_sz; \
>>> +	const struct packed_field_s name[] __pf_section_s
>>
>> This will need sorting out - how to make this declaration macro
>> compatible with the "static" keyword. The obvious way (to group the
>> field array and the buffer size into a structure) doesn't work. It loses
>> the ARRAY_SIZE() of the fields, which is important to the pack_fields()
>> and unpack_fields() wrappers.
>>
>> Maybe a different tool is needed for checking that no packed fields
>> exceed the buffer size? Forcing the buffer size be a symbol just because
>> that's what modpost works with seems unnatural.
>>
>> If we knew the position of the largest field array element in C, and if
>> we enforced that all pack_fields() use a strong type (size included) for
>> the packed buffer, we'd have all information inside the pack_fields()
>> macro, because we only need to compare the largest field against the
>> buffer size. We could just have that part as a BUILD_BUG_ON() wrapped
>> inside the pack_fields() macro itself. And have the compile-time checks
>> spill over between C and modpost...
>>
>> Not to mention, pack_fields() would have one argument less: pbuflen.
> 
> I was thinking something like this (attached). I still don't like
> modpost more than the assertions in C code, because it imposes more
> constraints upon the library user which didn't exist before. Though
> without the extra restrictions added in this patch (just ascending order
> for packed fields + strong type for packed buffer), I don't think the
> modpost variant is going to work, or is going to become extremely complex.

To me, the restrictions seem acceptable. You can always wrap an
arbitrary void buffer into a sized type via a structure.

I do agree that modpost isn't perfect with respect to the C code, but I
dislike the sheer size of the macros generated and the complexity added
to the build system.

My preferred solution is unfortunately not available in C: having the
compiler evaluate a constant function. There is a C++ extension that
does that, but it doesn't seem like GCC has enabled such support in the
C even as an extension.

I'd prefer to keep allowing both ascending and descending order, because
I think those are both valid orderings depending on how you're thinking
about the fields (little vs big endian).

