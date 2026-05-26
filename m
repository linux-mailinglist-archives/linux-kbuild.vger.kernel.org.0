Return-Path: <linux-kbuild+bounces-13338-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM3JKEC6FWrKYQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13338-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 17:20:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607A5D88D6
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 17:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCFC531D8673
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 15:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B77D3D3D09;
	Tue, 26 May 2026 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TES1qhh1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F913FFACF;
	Tue, 26 May 2026 15:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807679; cv=fail; b=eaA2A1bzniGPDJDX6SvqNA1pk4UXiOcIoMQi0XKxjvWZpKgJF0PDrvbH6a3l5+rIf/eBynQS/rrhMwarRc8QSuoxCd88ob8l6rky4bZvvBDPm8+Les44MjkBSQgBU9c+UuxgYTD9mytlyGi5i+TrrDUStVG9E4tRbLewNPG8coY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807679; c=relaxed/simple;
	bh=hod68KfeXlE0Ei0cWq1OZr/ImBWAvU6B9ByiwAv0+Zg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DdPgOjOFUhj4PanFPZO3NDaCXgGzvUnnprUVnN4fWojMi1zXngCY8b204jKD5bqSJpK6km/JiX/y/V9tp7d0KZQB8q5oum63/YWVLuy3I+myo5Cha+QMN26j5c5mydpRDY3X5i00UOia+VNiosJzaU3WeLoB5ykc4FyGMnSGW8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TES1qhh1; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779807678; x=1811343678;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hod68KfeXlE0Ei0cWq1OZr/ImBWAvU6B9ByiwAv0+Zg=;
  b=TES1qhh1kskCAa4n7rLovfG9YjBWT4uN25FhG1uewt59VkCB494t3Vfe
   NTf83AknzZIbl3+IvGPYHfGT5DbT+J3866merPqvtlELpr4sx3A0pxiDZ
   VwX7nuztIxTyIDjdg7jYTPL6l5ZBsylDSOHn0QU9fStTWdyv0uLFj8NUn
   DbgxyLFITX0ukIiRCNgz5ySB8uiprlLlpG29MIQunCKkYOabtZ1buUcyu
   51394KeZ9NKRK03sf5d3cUYRhfrST7qahU5HrmwJqYDDN0sjwlH9gBszx
   DWDronAslwkSPj2FlqXIoJX1yKnyDRlLIb116fuf4AD4gk68DLCTmmzz7
   w==;
X-CSE-ConnectionGUID: JNMQl5MdQACCX8/USqETIA==
X-CSE-MsgGUID: XbBuz0wHTvuoeqXadVuI0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91313974"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="91313974"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:01:17 -0700
X-CSE-ConnectionGUID: AaXH2PWLQyO1IUuCyjOWcQ==
X-CSE-MsgGUID: QwV6Q0fPS2GRvT6wZmb+PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="235591854"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 08:01:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 08:01:16 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 08:01:16 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 08:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlR1OCD+oRPwmfmpZ1gaRgTsN+aC1x7qBeqP651ET87Fnjm2cfia67bQkreyb9ib9jBS/Adm5/ldsXNhi0qYdXxpQc2GXiTvfHCTOJID6aFOHzd7vXA2ns0aUwo2XIMs9ShgYs1g3lrkStw0ghw42CbbqmqDXmuoOLpfPd18eRFXKvRb6w5St18GUC2x2vTBztoY2RSLIKkcvLgZHzMR9zZ6PcP4p74JIwH5hT+H9qyrjfzhXifLFoOcaGEVHFaIBFwIC12JbUfgWA36S4L9qK9WxqGrK/oSeeDAhSsj+TcDZHBoNXyudPs3t8zPTr95qiVgGt+u3SCK05KcGbe16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qb+uFUwwbPIz1JjmiRqIvagrnhKTmwXANjIr16akjJg=;
 b=gkiP6E/LUZ1hWRYWmCh8N2z1ayUPOKU5VeMeOjUhjIG4tp/rW57skJvwJyodXF5cvrF4ICwO8nlKkU9FMieJBWQejEHiWMlitgte+xGzxnUWyKgh5StSxRKqgE6fmJxGeAkjdlgqfmNAukrbC9JGc/JvsOuF/E8EBKaXVrF6gXcAE0Q90yw7gElpAugwLtuurgq2oyjAF0HedjaQFtmJ6DdZNd1+NGCBVBtERBQTiWoY1T7qdy5gkx8OssyPypdPinciQxQow+/Y3lBfXT1W0JtgPRkE5MEG5SwU1391/Vn/cZ6cjLk20UDwoC+znV67cr66H+z0oWGDjB9gv87O2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CH3PR11MB8237.namprd11.prod.outlook.com (2603:10b6:610:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 15:01:12 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.21.0071.011; Tue, 26 May 2026
 15:01:12 +0000
Message-ID: <b5e15330-ed64-4f31-bea2-bb877a24c1ce@intel.com>
Date: Tue, 26 May 2026 17:01:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] err.h: use __always_inline on all error pointer helpers
To: Arnd Bergmann <arnd@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-kbuild@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-s390@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
	"Arnd Bergmann" <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, Christian Marangi
	<ansuelsmth@gmail.com>, <linux-kernel@vger.kernel.org>
References: <20260526101851.2495110-1-arnd@kernel.org>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <20260526101851.2495110-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::23) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CH3PR11MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: f9518722-98db-49dc-3e55-08debb37a072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|11063799006|3023799007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: cdWzSIWs2E7FSDYq4MceXMqKjjxY6N+nJUOBNmat8oZPNoaD7pr16UIoLpkSs5ALR3a9V7s+xMBj0RVq5SGPcKoUQ9q+bfgmnuUKXuqetx+hhBwt9fd70m+ekecBYP7B/pese+8w2nrcMbq72SZqcN9LxzFRQ2bUBy7toh989bV9HKiyMmSknYkEGSEeSMTiqrQ4f7JEBJcV4DwWP+E2oZhROfCuGe2sUphH9hppJypAxIdpqGeFEXf3+ksaGSNOEPSpnbTjR9p7dHjoBKxDQQiD1vXjBpn+FqrHYgPOBuy5fZh8OumjUqcHimm+nEdRxx3M2WGSuafodSptz+xbCz3wlmYPWfv08wVWyov/TrSPxkjMbjesuiYID7dy+HtJYKy1DuGjlKw4dzq9Ecbz3hbiGyInsnQ7F0bnXL4edLPcNiK+DwwYd/B2SXoDKQK7FfwE9Q1X8VbR45P5EmYFWziEK4Ca3L/FiNKdBwWB4GSbtQtcijBPtxFpXvWKpIsijM0AKEbhQQLDaskXboGhM2QYWwUJz1BmJf6aDg33bDS1yZl1x98646ocY4Mj+6Cn7lPV576YXKmvF5v8of4ye2V6DF/czaQVFd3iLDeYTA0+C1teYc+xj6fXopIvjw4z/lJCB9cbMKNmKXY3VFolObF4jnDTGYvoxQqa3RmL0K3QGBAtLFmielpdTL1wkW8/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(11063799006)(3023799007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlJNc1NvUVdrNzVWMU43ejlWR1FjUTNYVEUwZVlLQmtSMFJEWG5IWUpVUDB0?=
 =?utf-8?B?NTlNWnVuRGlqQlh1UUxKZVdFRVVyaGk1VnVRUEsvMzlUM3gweklUdlRCV3VF?=
 =?utf-8?B?L2FSay9WQ0lCMUkrVkNEVFhXUVV1TmdkNERqcDhxa0VyZS9NT1NhaktOKzd5?=
 =?utf-8?B?OTNpUytUSnBDVzFFVnozSlh2ZXZuMk1RcjdYMkhkYmFQQkt3UmlHZXNOVVdO?=
 =?utf-8?B?NFczdzA5YWtvSWN6cTBib01WOTkydStWaXJEdlM2RUtuUW1DOW50WWhSbDBa?=
 =?utf-8?B?SlZDYjRRMWpXY2lJei82c3BBbEtiTDg4VEI0K0xsYXZNby92dmFaT1J6VzRS?=
 =?utf-8?B?dSsxSWZWb05aSGxaSVJabzZZMGcyVThodWp6ZitOMEhUSTZkcnJQbGliM2FY?=
 =?utf-8?B?TWtuQXlvSlBLL2VEQTBHRjR3SnBlazU5anpadTVOVFVYS05DWGZNZHRpYjZz?=
 =?utf-8?B?UEQ3QzJsNFlBWUo5Tld4bmJ6SlV1N0c1eCtXckt3SWorOFUyUDNIUWxsR3hV?=
 =?utf-8?B?UXMyVVREMmtVYXhSanRna0hGclFPRFF3NldYV3VzWWJvb2xyR0Nkc1Bqb0da?=
 =?utf-8?B?NDJIRnRnYUpJUlFhdHhodkU1YXBmTy9sSGNyeW53TC93eUc4LzQ2cXBuTmt4?=
 =?utf-8?B?eEJSRDFER05ZMDYxYTcxcUVWYnJ0S3h2d0ozc1d6QXZWV09EUTNvQ1JOYTZo?=
 =?utf-8?B?Z0FRU1Zha01VelFvZjdiM0p2eWwvZDBvQk9ZYnZNUSsxVUNraHZUblN2a3ZS?=
 =?utf-8?B?NGczVkxLanU3cklOKzVyQTJHcjVQdEVNUmVkQWQrVEhTNm9sZTNEeFU3YWRN?=
 =?utf-8?B?ZEFseFVpbUF4WHlGbXlsRVc0TnV6ZEpKUnFGcFVHTXJOVHNKdTdISWFFdXlY?=
 =?utf-8?B?Vk1EUk5mNnhSWmhmZEhVbEFUSHNWOW5WV1RSM1pCZnRReHhTN2pJTEQvaUZz?=
 =?utf-8?B?QUZ6bi9sdmF3WjRkWkpjZXZCZEJQM3hUTzY1RWRsMU5pcVpyL1hTVHhZTHkx?=
 =?utf-8?B?elpPU2RSZlorN1hNT3Y4bnZ4UFMvMXV4c3VsMHV5dVA3aHB0VFhMa2hNNklE?=
 =?utf-8?B?V3JrNDE4Qm9ZeVNROEVMOHc5QTVWcDJKUG5FdzZKRUxFWUFGWEgwR3hvM3VO?=
 =?utf-8?B?dVNuS0lvbmhwV0hmTXBtcitmZHp4Mkl0bDVsQmtEREwrUVVYZ3VQNHhnenE5?=
 =?utf-8?B?c1pYRmF3UVdaTTV2TmhzNmVZVFg0U3JrVWpuWGJWcjhFcFllcjVPbUF3NkNl?=
 =?utf-8?B?RjVoQ3Nub3k0U3BkTTNaUllSSGNVMm15MkpxakNqaTNQNVZ5a2E1UjJvUHdp?=
 =?utf-8?B?TmpQREtQSlpMV1QzS3ZncklZU0JNM0RaZVMvUE5vcVhxenBvOFpyM1pGcE9Y?=
 =?utf-8?B?ekFvVzZQWkZHY1BHOVJFYzJWV3l6NG40cVNRZTVVcmRJYUxkT2N2T011QU0v?=
 =?utf-8?B?TkN1aGlacVhrbDlUQThuczZaNERvSVBkRlhNL253R2FmYkptR0tQaGJwTE5S?=
 =?utf-8?B?WHQxWnc0dUZDTVliK0Z5a05US3UxcHc0Q3dqTE44U1U5N0lGcE5FRld5SkhY?=
 =?utf-8?B?bVpxUU9WWlBJVDd3VzNNKzBSSFRwQ1MyaXl2czZSZ1BBV3d0Vlp6QmxhZ295?=
 =?utf-8?B?Vkc1KzZMNkIvcy9wdzZBU0k0dTViYXV6a0RzTFNib1JPemNEWWRlaW5rcHA3?=
 =?utf-8?B?dXEwb2UxdkZ5bnJOUjR1Ky8yZS9Wb3UySWo3TC9LQnd3MlM4amlkeWxLUEpr?=
 =?utf-8?B?OU1pcndqbC9sZnZ5NE5EUFdBWHBocmllNko2V2VFenhFczlZRGdvdFF3TVRo?=
 =?utf-8?B?clIzKzA1VWFnOTNGRnZnNG9BR2NydnRWYnRBcVdQQjZmU0l4TzQ0YTlwVUFt?=
 =?utf-8?B?amUzT2hzUVdHaVgxdlE4Z3hIZ1RGd0d4VTU1UklsUS92VktsdWphT0E3cHVl?=
 =?utf-8?B?WmZ1VmxwWHhzR0NkNk1tUVpuUGlXWlFyVUNlejczaUNrOXRsZlAvdEdqM2hv?=
 =?utf-8?B?bzNIOFZYUmg3NzM1c1A0Z2NLZ3BEbytRaldMZVYwbHdIaHJSYlhackNRWUsv?=
 =?utf-8?B?TGY1SVZEU0ZXNWtnQ0Z6R3cyaDU2SGJkUEZhbVE0SGx3R2pBM3EyMVRDa3hN?=
 =?utf-8?B?R1B6K0VYOWwrWTNoY0ZiaWVYamxmMDVvQVVueWZSWTg0MGJ2czBkZDlxcFZC?=
 =?utf-8?B?cUhhdFZmdXNNczgvTUQ1VzVvS2VwYmUxbUhzVEJteDY5L2RydnpqcmdERXlh?=
 =?utf-8?B?dElsdHgyai81dGlUL1k4clhvRFVDMHlzR1RHQnFFTHdtT1FnWU9GVWZ1L2M5?=
 =?utf-8?B?WHNqc2x2RkNHZXJ4enB3TmNVQytYdTJWb0tvdGdJckxJK3hQcFY0VFBmSlBw?=
 =?utf-8?Q?x7GbElLfc4LGks9I=3D?=
X-Exchange-RoutingPolicyChecked: EQGOtAyxT7HNVpoGNlPivPd5nMlQrWncyMt8vZos+MB0yYbJlYKhiYSl8046gU+SzQPWolAlnJr4yTgtdnPkCsfh4SB3qXxO0j+CJluVUNI73q4GXWPz/N/W83USZdD0UzFiK/sVFlVEcJvvodA6wIR09nHi8f6kNzG2QAwhOZJFQ0ZHcPAOKLRYliShNFWkLdQWUD8BxYB9Etl5TRov7rjFUw0RkqEhE6BE6PJn8vSpLz1r7qCfyI0QHxOCR5mpvECwMYZ/jI9nGGjid6stFo8UR2yJbKmaSKTyu3QKWi/Bi+a9LiINhI31aK5X0A2yWJJNwyja3ubZpF2fFHkahg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f9518722-98db-49dc-3e55-08debb37a072
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 15:01:12.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7Y3QEhbjOkG0Z3kA+iaN1qEIug+20iF9sOWiLNu75GZCsW/1uqUBCXHJnlZnW1lRTOV7LZVemepBAPIqJil92ywA5nkUd4rm6Hqbb8sSEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8237
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-13338-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,kernel.org,linux.ibm.com,arndb.de,linux.intel.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aleksander.lobakin@intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0607A5D88D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 26 May 2026 12:18:41 +0200

> From: Arnd Bergmann <arnd@arndb.de>
> 
> While testing randconfig builds on s390, I came across a
> link failure with CONFIG_DMA_SHARED_BUFFER disabled:
> 
> ERROR: modpost: "dma_buf_put" [drivers/iommu/iommufd/iommufd.ko] undefined!
> 
> The problem here is that IS_ERR() is not inlined and dead code elimination
> fails as a consequence.
> 
> The err.h helpers all turn into a trivial assignment ot a bit mask

                                                       ^^
                                                       or

(nit)

> and should never result in a function call, so force them to always be
> inline. This should generally result in better object code aside from
> avoiding the link failure above.

bloat-o-meter would be nice to see but optional, it's obvious to me that
these helpers should always get inlined.

Not sure why compilers sometimes decide to uninline a couple
instructions (feels like there's sorta dumb logic "oh it's used more
than X times -- uninline no matter what").

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Thanks,
Olek

