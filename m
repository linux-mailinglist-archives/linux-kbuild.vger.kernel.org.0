Return-Path: <linux-kbuild+bounces-8341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99DB20BE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 16:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 850431699ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 14:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1EF24DCFD;
	Mon, 11 Aug 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gehVdNHY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E467C2459EA;
	Mon, 11 Aug 2025 14:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922439; cv=fail; b=VPTKWgl+pBiLCdtIqOYavDghDN70/wjfgLyua0LmQG6UuR+I4Dh/Iq7I3M//nCyXWePnwzT2msa0+PDUqwsH5lhwIH1ekrXU6Z6jLzXI17cXbb33wQuGQ6BMWDlRYExzEpyBjxVUsWPcLjbnLiAoM61gKJ0k2q2r6fWDGifN/Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922439; c=relaxed/simple;
	bh=vlNAdV6CJQBhbK2OVqd2k3929VaFO12lPG/vXUa6G14=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AzSKgDa+whtN36nIGzdOFCAZhhWyVCuzYfnisdkL/hyDs4ptF1/t5e8cu5fnUYknyO70ZrAhtf4fVaY2C5mzWabXGdoerH1YF4jolLQ4hjyz8EuRdwzEjMZR3us096WURstpa/jTu36lpqvO/upVMLbzmZCKK87UwVz0YNiKPsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gehVdNHY; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754922438; x=1786458438;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vlNAdV6CJQBhbK2OVqd2k3929VaFO12lPG/vXUa6G14=;
  b=gehVdNHYdVdOUFUJUMwxeCuRB2q/WjyxDnnqfUQPfsnktRUgpgWC92y9
   qpFHKiqhki0/sZdn6wfQGzgriAQhMCehMQxbtEnhlxhA+j+kT4UHYZHoC
   Afti6kAFcSEa3uiEQcIMFSU3QXMjJwL3eXJC1FZ3EnXAeyOjBKQFkwP9D
   HQIQ1T5sax0yjlw3wrXfmnFCAP9t0zeCUK2Vkm3sEznp+CE+Ml5P82xDz
   nAup24Ie+7o01v772a/gWWxLnNFg0jNa19hjd/9AAlAi+nBAgwCkfElZ5
   YhvRoBkz0eFIbHoeNFuAtEewPX8uI/RVyjbNQBT6QqeKKQ2xf0WBldO98
   g==;
X-CSE-ConnectionGUID: qHadAkQzQ4SYJi5oIbmFPA==
X-CSE-MsgGUID: 0SZt8pdlTdS97vzxsyXPrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="82617237"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="82617237"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 07:27:17 -0700
X-CSE-ConnectionGUID: up9DKSooSzih1A4uPbN/CQ==
X-CSE-MsgGUID: G57TEPV6SlmJgsIykkAWWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166726122"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 07:27:16 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 07:27:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 07:27:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.89) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 07:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHON87QhQp2yoKbY9fRZ1jlW/EyNDqoA86hPhJgTZFPKwuPCDQyrNIWhFBHoCC/5eio1HiEPO4Mx5/JnYGdiW3sW9orShF83UKOb9xGNhQkPKGd7np7GtEMU0hHi8J5Xdy65d4lbH/DtjG1SG8CsmcFuKpTRCUcY1NEGwyzXjdAZGeBfVGund6LYCwZbHQmChYL0oOzYWKIAGzyFVxCJod88J6aiHie2HM6+AkL2bGQtK2TCMmW8aneSHPcs+GSOy/ijy/J8uE7tSThsqf434bdSLiglPZP4MaydLpauZ57eUl8rWW77x0mMwIu1CELBoTyeBN9pT1ERLpbCXO3gTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyaqDvYkwxIiwPmpRI87MRVNYs8yIyo3G8hU3ns2Yns=;
 b=x8yBkHoPyKmdYEvWg0q1QV41h88zMa4M0KVLMg+YIxxO8PjnOPwoZ9aT3mwBfM9uN/cRzABAm2o2bpzypeUgLz+s8Ocg8I5p+eJVEYqjHZvGbPzAopTvRKamAhN7rIE/8FxMRYWKHFf1peSk/VIUG5+nBrFFA4rCr0CcqHVZe9VU32qM6fgc6Yt5SGL+WKnkCfgIs8cfbHsoOcmOnafxl2fb5fkMWuOIcmZyuF9NTBWIFrkTOWtE+ZLfPHZA7pqaQkylRQqnZgM7wERRdSOFrc7sqEtEqGQjP7d4Ooh/6qtuin+Lf+3CDWCO6vBVoY8QA3sojEYYHw8ea0JCbv/HJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 14:27:11 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 14:27:11 +0000
Message-ID: <3fd91204-629f-4024-8d49-c76c7b344735@intel.com>
Date: Mon, 11 Aug 2025 16:25:26 +0200
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
 <a01cb1af-8f17-42c0-815c-f9c44a399cbf@intel.com>
 <202508071458.A97B471@keescook>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <202508071458.A97B471@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB7PR05CA0053.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::30) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 908250b2-08b1-4811-de5b-08ddd8e328e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHVMN1NyQXoyOTI0aWU3VFpPaEc3UlpDS2VXV0E0QTNVL3pUYmpwTUVpemhD?=
 =?utf-8?B?ZUpEdG4xdjB2MzdLWE5zYTc1WXlvZ204YkxPaVFrNHVCK3p3SEdGQ0tCREZW?=
 =?utf-8?B?U1F4UmQzazNDOWJvVXJITlFteDZzKzluWkRSb050MjRFek9CMitzME9wRGUv?=
 =?utf-8?B?V0lZTktVUkh2R0dFY2VZcU96d0p3Yng4UkkxL3EyQ1lkZGw3cTBvZ25Nb2Rw?=
 =?utf-8?B?WUxLMHJhTFNEY2NMc1Y3OXZHYlQ4SnpLUWZSVnlxekdSbXlvRU80cVliYklP?=
 =?utf-8?B?QXNiT3BSaDBQK1JQV2plT1ZjVHNhVk15SXlodHRhNUhBODU2Y3RtY0Y4QnJz?=
 =?utf-8?B?ZFhNVmdjY1VXV00xdW5aNHYxZE5mR2xESmFhQm4yRUFOdFE4amhlZzNUbGRR?=
 =?utf-8?B?Vzc5dldiNWRPUkJLNWZQZ2phSmttdCtacFRoUHZrRGhYWldCeUZRY0FDb0lp?=
 =?utf-8?B?Z05UT1NQaWtFUC8rZHQ1a1FJUDhlMkVFbHJFRm5WREdaQ3RNRUN0ZVRqN21X?=
 =?utf-8?B?MnVETFJnbElsQ05tcG1sdlZQYWdLQ3FvQnRSM29ER3Z5M2x6dzNoUW1xeDJj?=
 =?utf-8?B?WUZCRTBEMk0yQitrRTJUS1dIMlFWQWI2NitkbFNLU01DYzJ5L3FBR1RCYVdE?=
 =?utf-8?B?TjJlVm9ZTHJXeWhzdE84RTBGSWxpcllNSWdFdXY2VFkrdU1CQXhoRTdoeUdh?=
 =?utf-8?B?cm9UN2p3TTEyQXVSa2pQTklWVGtvY00wcE52TERzZmRxVldjUklXRFpIR3Bw?=
 =?utf-8?B?S1RwaVlVdnF3RVlZQ1lwcjFPL0FadFRJTUc0Z0xOUHVET3UwNmlnbllzQmpS?=
 =?utf-8?B?dU5uU0VZdTlkVG42eFhTbm05UVp6VktrS0trZEE5ZWZadDVScFo2ODh5QjlZ?=
 =?utf-8?B?cmtXczBDVlVsYmhUdnJuZitEQmVDNEt0bjNGSmtMNVhGemE5Q0VBZk0yQit1?=
 =?utf-8?B?NkxtUE8xY2ovZHVhTVExeEFhWE5NRkFxaVhJRkFUejBVbHFVQm1nYkR0VW1o?=
 =?utf-8?B?dHpTV0xFeWZDWFp6YWZGUWxabE9sWUNZOXdweHVVdUoxcDYxeUZxSVJzdHNv?=
 =?utf-8?B?d2Fra0FCRHhhQkxPaURRNGJFVEU1UTFyZVBNT1lhMTFYY0p0dGFDRy8yelRW?=
 =?utf-8?B?ZTZqSEJDZSsxMEk0RjZ0MlEzTlRuaEw5WXg3UTJuVkE1MTN4czRCV0dXRkpI?=
 =?utf-8?B?UzhuYWJ6aC9PSFdoUXgxSlc3SUFxaE5FbmNYL2E5UDBQbE9VVFdJMFRkdFd4?=
 =?utf-8?B?Njlab1FoVVZDcEthRE9iRUNiVnlud3RDRG5jdnhGWlE5V1RZOHJoVU9QeW1I?=
 =?utf-8?B?eUg0QUpyVVFZVFRVTWhBV0FlbFhLZmh2YWxGZzVGZEZhUVA1OTlLYmU2RmNp?=
 =?utf-8?B?OTNWVWRGaHRpMzBpSTFRRjV0akVtSjdKMitnS00ydEd1bXBaVWpFSzFFdGR4?=
 =?utf-8?B?N2ZJc0hxQW1DYmIxa0l6RTFCTWdkUEZMUVovdVQvQ3hibzFwMHZzdFFIeUVj?=
 =?utf-8?B?MG5HNzc0M0s3VGxFMkp2QmF6dzNkbnVTbERmYjRRZWEzdkd2YkU0TjlSWVE2?=
 =?utf-8?B?aHdWZjhkYm56a0JKaDg2YlRlb0hMRjJsTnlHQm1BdFpGVGtrdUdxWW1BdlUy?=
 =?utf-8?B?RndxcnZuVmQ2Njl5RlpjcjRrb29wYXpMcUhPaHVpMU0xa09tdDFDbFExb3Vy?=
 =?utf-8?B?aEt0MEZkd3k0OTdzRzJrVlNUOGY1N2FGZS9XNGhiSWJ0VDk0d3p5ZlZ1cExT?=
 =?utf-8?B?Vk1URWZsQkl1VGltVHlRN1VzOFRLWEVhWXdmS3ZPS1BMbndFdkhqNGRvaWtl?=
 =?utf-8?Q?NUGNZxFtC6XvSBWn8cSjfjxy2sRwYbpVo1WBY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azVLRHVHYlUxWklhcEMzNFo1dCtTVHJpWll4UXNpanVNQ3AvdlZ1eTVLUG9o?=
 =?utf-8?B?UFk5anJPTXg4SXRNM3RMZHM4MUNWVnI3VTNOWUE3UVRER3hJaGVuckVMTXU5?=
 =?utf-8?B?UURZMDZSeTNsTGw5ZFpNaHBadUkweW5UMm5IakNVNkE2SDI3SE1UdUFOMThY?=
 =?utf-8?B?N0FzWWdFWWZkbDVqdTJjY1BJbHk1Z1Evd0ZsSGx3MHdjMGJoelpFU1RqTkJL?=
 =?utf-8?B?Y1JkanNwUkRYdzUwWk1MRUtGNUlaYWF3b2YyN2hDdjhiZHNWOElyOTRrZjFa?=
 =?utf-8?B?TCt2bmRMMnFDMnM1bC8zTUd4NXB2NSs5RUlpOU1FbnZTamM4YTNoKzBmUm41?=
 =?utf-8?B?YUY0dFJKZXlpSTI4amFySVQzdEx4V21QajFVUkVRN3RaMXpxMXdISys1aWtz?=
 =?utf-8?B?VTBBUWtQemtvRXBVU0FKbVRkTXk2SjYzYUdnaFNBOHQvbStVeUZyWXE5SXlt?=
 =?utf-8?B?S1BRTWNSK0h2TnpWU3pweHMxdFo0aFpLdmpTenpNL2NmaFNERjZyQVdHaHd4?=
 =?utf-8?B?blE4bHRZUWNaUng2L1o3OG11Zm9Vc0U3MGFsanBiSnR1TVV2T3pTclNUQnVt?=
 =?utf-8?B?TlpROWNIMWdFWTZJMml1RTF5NHNlUVIwQXFwOW1RYXVnUXZ2RlBGZXN1S3VS?=
 =?utf-8?B?UWFNazhTS2xSaWVDNmFSM2xTelRUZFlybkZKK0x4dzU1OFBBMGptTFdBSmhT?=
 =?utf-8?B?MG8yZ2FpKzNxcEsrbnlleStHN0J5TVBURlNPL08xbkFGaGhFNGM5OFRKVlla?=
 =?utf-8?B?dGtNY0NmV2lpbHM2YjdWVURXWnYzRVVnZHlkSTNpd2FOS0gveEJnRHZYOFpG?=
 =?utf-8?B?cnZxLzZQb2p2bGJEZXpOWlZIdG1Ed05rNjd0SVhpSGFSZGhSd1RpV1lIOTIx?=
 =?utf-8?B?Yk0wSTJtNVh4eHR2SE02ZDhTV0EwWjM2L0lXSmVWNitFWCt2dTFDTmFYK3JI?=
 =?utf-8?B?ZFRsc3hMeW8wRmVKY01oZXJLa2hiL3UyWWF0b3VlMkl6YTBGQmIyWkp6MXFj?=
 =?utf-8?B?RjdwSGVtZmNBbUE1RzJaWmRrNzFwaWFlMXQ2UXkxWmtGTjYyNmplY2hXUUw5?=
 =?utf-8?B?UE5LSEUvZ0cybjVCVjUxZnJ1dkF0Z0RnTll2VjZUWUVWeXVyaElncUx6WGd0?=
 =?utf-8?B?dGtLNWc1czUwejNGd1hPZUw4ZWF1YmNKcXBTMGJYODROYmlETnczSHJxa0sz?=
 =?utf-8?B?OW84YmhXZWM3aVI1QmlNdmlkRGxHdUZTb3dWRTVWTXR0TWluL2JDUVhLaFhU?=
 =?utf-8?B?bDZzZ01TenE3NnJSM2RuKzJMSnVMN1gyUVBQdnp2US9nODhZcVZ5UVh5YU8r?=
 =?utf-8?B?bmhtVGZEcHV2dUpPbWZDaHNxM3l4SlliOURRbUFKUG9aSkE5RVc4UHJWMldU?=
 =?utf-8?B?S2VQaUsrd3VuWUxJaWQxZ1I3NmVvYmJ0VTZ2TFA0dUhHZ3FCR3lNd2E2U2tv?=
 =?utf-8?B?SW9yRm5KNVRBNW5FRWsrY0ttZWIyemVycThaNkdZdWpUdmEyMlJHcmpIUUxE?=
 =?utf-8?B?NUlob3JRcmVXTUJzY0lXb1ZMSitEdFpmRTFydzdlRm1DV1lBSzhBWWwvc2dz?=
 =?utf-8?B?bDhHYU8vVWtBMGlzbDhPSUpqd1FocU1GWXJLbG1VdkF3Zzc1U0RuWThrU3lu?=
 =?utf-8?B?VzczWFVaWHpDZkFtaHVMMGRBQkNHZkZpWmN1YUpqNmcwbENteVNpdFFFbDY3?=
 =?utf-8?B?Y0dNbEZEWk1rYlFUSm56MHZiOE9Da3FBVm8yU3VraUJQZ0x2ZTdqZlN4ck56?=
 =?utf-8?B?aXhPcnJhZnlMcUExVnFrcUNvclJrY3lqeHhXQjVPdXpac0ZZV1E4RDNPOGFY?=
 =?utf-8?B?UUhRTnlyOFJtT0p3eHp4dEpraFVUOTl6NW9QYUFsTW1rRCtPaGdCMi8rTUFV?=
 =?utf-8?B?WnFoRXQrN0lEeWRuWHYvMlNDajFzN2h1OHRhWjVWSWNUdEtteFYxdHZSdVFv?=
 =?utf-8?B?YXRIZ0hBMDA1L3hGbHhyaS9BcFlCVHJFODVkQ1RvK2xLODlZZE1oZS9lRzJY?=
 =?utf-8?B?VGZkeHFBckdQRWcyU3htTGJQMmp1bjJqY2ZDU296b1c1eGhlMFlmSzl2OGJ4?=
 =?utf-8?B?dHZvKy9peDZNVUtJWkpFck1aM3d2SXV4engyT2hzdnB3ejhOTEpzemlHWkho?=
 =?utf-8?B?aW1jN1BBcDRDYTZ1dExteUYyN2xMNXB0enhtdEdLajREckltSzBRaXNjOVEz?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 908250b2-08b1-4811-de5b-08ddd8e328e6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 14:27:11.4552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8qZAMCbr1RPyKXnGUM5yK3iZcDGR5y937Udy7A5vVJg/p6TckuQrESxZJxUFTB3PaF3znH/16rXv9l1V/i1PSZPxAq0/oPb6Jh9Lc5A7yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
X-OriginatorOrg: intel.com

From: Kees Cook <kees@kernel.org>
Date: Thu, 7 Aug 2025 15:00:24 -0700

> On Thu, Aug 07, 2025 at 03:31:05PM +0200, Alexander Lobakin wrote:
>> Sure, lots of drivers uses normal string copy functions etc.
>> But Ethtool strings *must* be NUL-terminated, so this fixed-size +
>> memcpy() only hurts.
> 
> This is the misunderstanding: they're only NUL padded, but not strictly
> NUL terminated. You can see ethtool itself has to be careful with the
> strings, limiting the fprintf to their sizeof():
> 
> https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/ethtool.c#n1013
> 
> or using strncmp everywhere.

Maybe we should add a check to the Ethtool core that every 32-th array
symbol == \0 to detect misbehaving drivers like this one :D

Thanks,
Olek

