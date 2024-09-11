Return-Path: <linux-kbuild+bounces-3516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BC975757
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 17:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11B13286C9F
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 15:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400611A3052;
	Wed, 11 Sep 2024 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YjsLQE8w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240291AB6CF;
	Wed, 11 Sep 2024 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069151; cv=fail; b=TT7k9Z0uEEQAD8B7c+knula/ZKw/wDGbeUhPa1D6xUkhTC7jwTx9V1GL3unCVBMkwaPNWsQH4wPZKORY7K2GLGR7ISgthQLnWjcR25Y8aJPW+2JzBZoOQbTV7jwhz5dT2RJwNfx+pOmeGk1ne5AG/FI+q6csIlKwIgGrt6BaRvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069151; c=relaxed/simple;
	bh=zcplExNYyYBPdFEpyS+SquQ4dD0SDEXYD/z8q/Wc9Ak=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gW+uIYLMTvtXRqxGJ4xR1Dn5VPabUwUSm0paZ6YFcug9uJOUz/lrq7K2Rh/rVCP/8EKk//52xMgYDBiLYVu031DOHYmcXGMcuxnP5QbB4EmEe9AbWRNXEN+rgeP3mHDo+/3gXt1M4VkqDMgy1NV0Aus/Fs6c+LJPPcZXajfTX1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YjsLQE8w; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069149; x=1757605149;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zcplExNYyYBPdFEpyS+SquQ4dD0SDEXYD/z8q/Wc9Ak=;
  b=YjsLQE8wr/xDsAoG9xZj0W1B4Jdr1U4DToo+kArNzffLPcsyoCeKbFiX
   jj5sx6VqSu6Z/LgK4wfehTqBe0uSQoJ/F1pX647np4U+nOmANHe7/aIxH
   iczKIBtF/c+4ndtdCt6Aej695n2OdYehGeSBFf287/fozlu/N0OFe2Qiw
   SCLm5bGpm1JFJTo/ZudzLSOfhWTOqjC0xMDcUtIpyJycrLsWTAmTdaGCS
   rh2sEFpQT/DHj9pneFVMiZzjEdYHaBpqNPQhnQC/TnRf8uZ3K9dAGdyZG
   h5AUhFeFSyp15OQV9F8P+CM/Rj8bBCtJn3fSDxqlgQ9YrGXSpWNv4BoRA
   g==;
X-CSE-ConnectionGUID: qj3YuyCXQCuzhGtuHIS7hQ==
X-CSE-MsgGUID: 9WnsHHXfTyaK+hEo+0rLlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="28655534"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="28655534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:39:09 -0700
X-CSE-ConnectionGUID: /vp9Whl7TOCqxj8TLFNeqg==
X-CSE-MsgGUID: sf/GZa+oTUifieAVa438Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="71782607"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Sep 2024 08:39:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 08:39:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 08:39:06 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 08:39:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 08:39:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o53wjZ3TXz2IsUvSzyDYqsixoRn1rvqOQvsh88htQVCekNKJ2UirPOU/abDs8quCs7b1N/rpySpal4UQ2/YJY6Lc8sq9RPE4rB20YYTceL4mXXL6p2fXDecb3mvXQZzH6B2s9K+WplDbxGB3cqqwaQFd4PdkceQPvEIWz7uWIkbRQfQFxKAwZQgb1JZLAz/JMCW3WvQhS1k7pueZducQduq1FtunDfS0PQBLREKczTvSFZj2p/mCoKnMIy8Tlpyy8NBtBJM9szUFnFu4iEGq9l7RJSD07KZrJ4dChuNz9xUpZHvpu3APuE7LNpsrr1Dv4liocB0pWnml6mnJ62mgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU4YC4NEHTvBU2ZRfM4AYvtOOs3LYe678x7Rkz6EYZA=;
 b=j2lDeILJbf/Nl9sQHEmv1JOe/mXRbYfVXIq8hWqirVzsUm59ilLfreVtXn16fUNmR+STflsmu/bwBPdR9jm6QpjhgtJePZyWV9mWwR3drEq3PmvB5RrJ6GFab8Ladf7/eF/yhmm48xGw9Z9PxuMBBBqcU3VVBkXy9hSNY6dKfOLb5OAEjYJtzTWYOMVPOaCnEkHEPuT1Tj2xq/HpkMmn4/Gc9UC3CKy2qpEXxlyo+vxG3+fCbvm6D3NliYXMX5EI4d2u6qp8qEpGXliPfRMi5XHZ1tFVKHQDywkPzxeE652o62AICWW/oZtsqNSNnXrx2td2ELhKVFc7kcNeHzRC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 15:39:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 15:39:02 +0000
Date: Wed, 11 Sep 2024 10:38:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Jing Leng <3090101217@zju.edu.cn>, Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list
	<linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Jing Leng <jleng@ambarella.com>
Subject: Re: External modules with O=... (was: Re: [PATCH] kbuild: Fix
 include path in scripts/Makefile.modpost)
Message-ID: <oli5wymvdxrk4ds54yh65s4cewztn4daxujgjfprzw2f2ozqqi@35kdsvivgrzw>
References: <aowpzz4rbedjkwkl7b4a2f5pf2p5cgsu6knsgxnayckhbumxf3@aznrm7oliydb>
 <442e8058.43a4.191dea175d7.Coremail.3090101217@zju.edu.cn>
 <lnizw6jklneisxkhah7ezy4tcrn2wpm52ibh5euz7ipyfansde@kc4onuvrrmxr>
 <mesi5e46iumhgdbvzl2gfwdamtv34baydb5d4pmud4fu7n4dto@fewx4uzbtjl6>
 <CAK7LNATDVN9ukAJdztobZ=aMLvfgE_wW1N_gsB-x3OiRE-Jrog@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATDVN9ukAJdztobZ=aMLvfgE_wW1N_gsB-x3OiRE-Jrog@mail.gmail.com>
X-ClientProxiedBy: MW4P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: bb627fb7-04a1-4ed4-4824-08dcd277dc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTJCcTVoQ2RZQzhQQXhUSzdOR29jVFhZNWM0cFVKdDY2cUc0cEFVL1ZmeGQx?=
 =?utf-8?B?MHVrOTBpQ0Fldk00MHZONzErZTBZTzA4bTlMbXcycXBud09JRVRJRHdtR25D?=
 =?utf-8?B?enlpVURXQVAvU3FXQ0Q4MHdZUFRKcmh5WHlVUGZLZjdNWVBrUTV6dy93NzNO?=
 =?utf-8?B?SWtJYVBJYVBJU2gwTUFpTTRtQTd2Qkh2WjdvaGhGYnkzNng0WGNhYndxRXFS?=
 =?utf-8?B?RzAxRTBQTUlJalROenV0UkxJSUVaWDZ5c3IrOEhwd0tPZENweHhLNURHYVk1?=
 =?utf-8?B?QmtJRjhpMEVHb0V4Q3BMMkljazFaV014T2ZOakZMSUlHNHRzd2gzdzVjbCti?=
 =?utf-8?B?QTVDTU1Cek5DWmV6eXBtSnJKSElXcXRBTEZvb2NQUllUckY2Z2tzRzNtOWoz?=
 =?utf-8?B?aXZvQnVsM2pPdUFIdkhQL1AzaEhWTllocWpLalZuUjRNZVhuaTdOd09HcTM2?=
 =?utf-8?B?QStoODVkRjZrRmNuUlp3THcrLy9JTDJaTkY2NXNqU2NRa3VrNS9DdVFwMUla?=
 =?utf-8?B?MGpTUzRSZ2doWVUzMVNFdmYzSVVnNVhxVWlQWWE4VENqODM0RW51aFNiRmYw?=
 =?utf-8?B?ajcwTDN0UFBSTkdiZllqY1ZIMU50QUhvWWpCRkJoMktWWGZDSHhoTGFxTjR5?=
 =?utf-8?B?a3RRRkhhZWppa3BSMis5QXRlUVpKZEx5cmk0dGt1bTVXS2lRLzVYejhIWExN?=
 =?utf-8?B?bzZxQmRVMm9XTFpJUzZYTUk1Q0tITU1oKzROQ3RlcG5yTUhBWmF3bVhEUG8y?=
 =?utf-8?B?UUp4LzU4QXVuMkJvM0R6QXhHemRHMm82QXpORVI0RUpiMEg4LytMbnRETStV?=
 =?utf-8?B?aVB5T2FGU1FUNDVrY21UcjMwU3lNM1lDY3BpRnUyTStPd05uVVhKTXVZRld5?=
 =?utf-8?B?TnFLdDJEcVpieU1VTkZWMGZrOXBIQVBLY3VORmlHQU1NRXNpZXBadjU4Y3kx?=
 =?utf-8?B?VlJLTE9Sb2kyK3hvOWhyWi92NHVnUzdqU0ZPR1d3T0pZV0xicm1rVlFFSll0?=
 =?utf-8?B?VXg3VUtoQUo0U21sVTZuSEtZai9tVHhWZW5oV29OVnVIakZQSFNmNDhMREFt?=
 =?utf-8?B?M2RMM0svNWdzZVE3TUxKUXBTbU5QdDVLVEYyNis5aUtRbXVVQ1gxZXN4Y1V0?=
 =?utf-8?B?YVlVZ0FrS1lwclpkY1hWbSt1SDBDQXM0ZXZXOXA1ZFo2bGk4QWtqSWpYNCtq?=
 =?utf-8?B?aTdLSFRCQ1dUdXJCQWxLU0NQOXZWSTUvbkQ3REZkVldTWlQ1SC8yUUZUNFZ0?=
 =?utf-8?B?N005Mm5uMk50UTNDdHVOMERDTGdPT290c3U2YzdRNjE5eWxWUlN0OFhBZzY4?=
 =?utf-8?B?emo1eUtoMEx2dFJDTlErRTZDNEpsRTJXRlFITzhhbytiblM0ZFdBbGRRU0Ev?=
 =?utf-8?B?R1FtdGc5bUJEUHM5b3dOdUlVaFNyUlU5ejN5NUorT2tOdlhiemo0bkZpMDB3?=
 =?utf-8?B?TkFQYVNqcEZxTEswN1RnYjlhMldBUDZHZUZqUGRkZ1A4amUvZFVwbnNycWdo?=
 =?utf-8?B?RW9Hc3l6dUtKMXhUWmFxMGxmTlNTUkhIS1F4WmlDOU5vZGtYVVFrYkNhUVNT?=
 =?utf-8?B?MGRZbGRJU2ExL3ZpWlp3Uy9DMjJxL1NGSys4disvV3VNUGJBVW9KckpUZ08r?=
 =?utf-8?B?d2o5aWNSYzlCVTZTbGVPR2E0RUlQL2hNdm5mYXVpbFQrSlNwMDZJNTBKaHBs?=
 =?utf-8?B?emhTVHpxRDF0dTRDQVl1UWtmajlNNzc5dm9CYmRGOGJUNkV6aHovR2lkZnBa?=
 =?utf-8?B?dDdxNWgwODNWR3QxQ3ZKL3IzNXdtVHhPaWNaWkI5aFFrY0Voa1NFOWhaRFRH?=
 =?utf-8?Q?nhQpjD6C35jSmteCfpBdnT6HywmqIHxzfOeGo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDlOcHpIWXlOTit1WHg0SVFaajF5UHdBcVNxTlZwaDNqQnVha1pxb3BEajZQ?=
 =?utf-8?B?bm9FNndJdWkwMmovOCttMWVoa3VadEN0a0NLdTRid2hyTy9uOEdkQ25LQ2xv?=
 =?utf-8?B?VUlmRUF4ZGY5bkVIMGIxcFpPa1dOTTBWeHp3L2tFKzAraXVzOWR6VVZIQTZq?=
 =?utf-8?B?R21mcURQVkhxRFN0WjgvcWpDL0lkanBuRGdWZ2dWY0dOYUJ4U0liOXJwZURH?=
 =?utf-8?B?M0ZYRUJqZndYRlFWR2VUdXEyY09WbmdSR3N2MHFuRm1KOGk0VzZpYXdSSUcr?=
 =?utf-8?B?Sk00dW9MdGRRQXNHQk5YMERUcUVvSjBCLzYvRXVtQm9HMTJOalNnUnduVE5u?=
 =?utf-8?B?bHRHSURKbHhTU09BZi9FS3c5S2s1N1UrSWx2Q3B5aEVuNzM1RHVENElmTEFj?=
 =?utf-8?B?amttL1JjYjBQcitHUTRhZzZOSHROUUtOdXBHNDBuRzZCeFp6TDExaWVvVDR2?=
 =?utf-8?B?Nzg4NUpTWHhRUmZ2M21TN29pUmlKLzN1S2dud2VRMDF2aE1lOFVldjNVejVR?=
 =?utf-8?B?bTdiSDhrWFBjT2tlTm1WOWpPRHE0QXVvWWxmSVo0bFR1WG1uaGNCL2l1M3lm?=
 =?utf-8?B?Um9vc1Mvd01wSnBnWGRrc1FrUTNFSVVmc2FzelN2UkVmSGFVZ3JKV2x4YW4w?=
 =?utf-8?B?SnQrOTFLK2ZBR0VlQkUxQzhMM1JEOHk1RXNwWGwzMmpWY1N1eXBndTg2dUNP?=
 =?utf-8?B?SEpKWHYyWVRoQndZWUFaNlpRQkhpdGJLa1dNL1FDaEdha09mdldMUHhOZHdC?=
 =?utf-8?B?U2U5RjN2eFFqQmswNFBHbjAyYUg1YVhSQnhSZStvUzFyc2haZU5jMjhnRGNY?=
 =?utf-8?B?RmdZUk56cnozQkN5UXBXcTVDODgzU0N0Nkd4dVRJTzc3MEFMeGRjZjhtUVBY?=
 =?utf-8?B?UVMyWG9vcVc3OUVBRTcxdm1YOXNKUWZoSEZwRDlTOWxrU0JYazlOZVRYY3lo?=
 =?utf-8?B?UnFXd3VpQjNPSlEwTkR1bWU1V3R6QUxicnU1ckcrQ1AybWh1blFnNkxLbUlq?=
 =?utf-8?B?NFJZWXNJY25UZmlnM3RYejRHZENOR3R6MzhISWRhRWFFeGNScGFQZEkyRUVx?=
 =?utf-8?B?aTZTYmtlNGRnU1RndG42azJzTlhXd3FaRUZSS25kSGs0MHVaN1FjSXMzYk0y?=
 =?utf-8?B?dUlkUHlLWVlWZ2k2cFRiTGdKc3JRRzB3V3JZay9WVURxdXNFQXVXQVYxMnQ2?=
 =?utf-8?B?eUZYb0ZtaWU4SVhzM2xDS1lmbEFUbFZ4aWllV05IbUpYU2lCcVJyQTRING93?=
 =?utf-8?B?amZkOVZmZzJPVzJSWUJYWWFzdUJZY21uaVo0UElmdHUwSkxuSGdCR3dkOGhj?=
 =?utf-8?B?aTYxZzAvaUhNbDRNTVhEYTR6dlRsQlNTVUltQ1d1WktSZnBKNFhIZXNnMkpN?=
 =?utf-8?B?cUpnRWhEcWhMeWZvR2ZrKzB5MVE1aldxTlY5VTd0QThubHFlaUZSY2FiczJU?=
 =?utf-8?B?U05oZ1I0bk5RYStVNzIzeDBIZ0wvYmJzTUw4VGE1OWVDK1k3MXV5N3dJRE9J?=
 =?utf-8?B?eUZYcXU1WXc1d2FWc0h2MjRMbjRRRzlmNmV6bjdhZUZaSklEK0c2bDk2YnVr?=
 =?utf-8?B?WFBrR1d0cjdwNGtDWnltK2RZekZYL216VW0zQ0FNeWNyRGloOUdqV2JFN1l3?=
 =?utf-8?B?dDF5d0p3Z1VJRnFDQnUwRVJ4cjV0TXlwMVdUVHhMWGtmTzhiY1RpQ1hYaWQ3?=
 =?utf-8?B?MTd3WUhCNFE0SjNWckZ0d0dDMUYyYVRnb1VvYmEyZnBOdXU2YzhSbW1wZmM2?=
 =?utf-8?B?LzhPeHEvRkNNUlFFelBhTUpBRnd5dEEza2ltL1h5VEpuYmIzZ0RoUHlJZXg5?=
 =?utf-8?B?aEFHY0J1L3RSYlVBVWxMSFVyQWdUdFFNa0FaSEtmQ282S00zOFlkUmVxbWx1?=
 =?utf-8?B?WWNxeWhkTjdEK0VhN2d2M3V5c0JQczBycU9zeXV6MzRHUjZKcW1oN3hDK2VT?=
 =?utf-8?B?dURpSUJXN0Rld3ExZXJiNkJTcXFDbEE4TTBMWmFrZVllM1pqeDc3aTRENlFN?=
 =?utf-8?B?MnowSHVsb2JtblhYUHpxWmJvWHhOaWM1RUcxYlBhTy9XM1ZaMW96ci9CMFA0?=
 =?utf-8?B?dStTWHhPbnBDcGlOenVsQ0RkdmVwLzVvbkcvMzlVVmxMZDhyUlAvaEtUbFNV?=
 =?utf-8?B?UC94TDdGeVg5STNwRDZHVmVkRGRCZm9hVXJKNVBkUnJhM2hLZGtnUGhuZjdr?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb627fb7-04a1-4ed4-4824-08dcd277dc73
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 15:39:02.3480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iSu0XFCVZh46C2RvexabOBecNa81I9CoKckC+gUVrTGp0DVAnDhzWbjBdANwbjEX5qQGfekj8By7Ua06sREHQCFBbdU3pgb5Ib2lR3YwcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
X-OriginatorOrg: intel.com

On Wed, Sep 11, 2024 at 04:28:30PM GMT, Masahiro Yamada wrote:
>On Wed, Sep 11, 2024 at 1:36 PM Lucas De Marchi
><lucas.demarchi@intel.com> wrote:
>>
>> On Tue, Sep 10, 2024 at 09:43:14PM GMT, Lucas De Marchi wrote:
>> >On Wed, Sep 11, 2024 at 09:10:09AM GMT, Jing Leng wrote:
>> >>>-----Original Messages-----
>> >>>From: "Lucas De Marchi" <lucas.demarchi@intel.com>
>> >>>Send time:Tuesday, 09/10/2024 22:00:29
>> >>>To: "Masahiro Yamada" <masahiroy@kernel.org>
>> >>>Cc: 3090101217@zju.edu.cn, "Michal Marek" <michal.lkml@markovi.net>, "Nick
>> >>> Desaulniers" <ndesaulniers@google.com>, "Linux Kbuild mailing list" <linux-kbuild@vger.kernel.org>, "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, "Jing Leng" <jleng@ambarella.com>
>> >>>Subject: External modules with O=... (was: Re: [PATCH] kbuild: Fix include path in scripts/Makefile.modpost)
>> >>>
>> >>>Hi, I was pointed to this thread since I'm trying something similar
>> >>>in kmod's testsuite. See below.
>> >>>
>> >>>On Tue, May 24, 2022 at 02:52:45AM GMT, Masahiro Yamada wrote:
>> >>>>On Tue, May 17, 2022 at 7:51 PM <3090101217@zju.edu.cn> wrote:
>> >>>>>
>> >>>>> From: Jing Leng <jleng@ambarella.com>
>> >>>>>
>> >>>>> When building an external module, if users don't need to separate the
>> >>>>> compilation output and source code, they run the following command:
>> >>>>> "make -C $(LINUX_SRC_DIR) M=$(PWD)". At this point, "$(KBUILD_EXTMOD)"
>> >>>>> and "$(src)" are the same.
>> >>>>>
>> >>>>> If they need to separate them, they run "make -C $(KERNEL_SRC_DIR)
>> >>>>> O=$(KERNEL_OUT_DIR) M=$(OUT_DIR) src=$(PWD)". Before running the
>> >>>>> command, they need to copy "Kbuild" or "Makefile" to "$(OUT_DIR)" to
>> >>>>> prevent compilation failure.
>> >>>>>
>> >>>>> So the kernel should change the included path to avoid the copy operation.
>> >>>>>
>> >>>>> Signed-off-by: Jing Leng <jleng@ambarella.com>
>> >>>>> ---
>> >>>>>  scripts/Makefile.modpost | 3 +--
>> >>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> >>>>>
>> >>>>> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>> >>>>> index 48585c4d04ad..0273bf7375e2 100644
>> >>>>> --- a/scripts/Makefile.modpost
>> >>>>> +++ b/scripts/Makefile.modpost
>> >>>>> @@ -87,8 +87,7 @@ obj := $(KBUILD_EXTMOD)
>> >>>>>  src := $(obj)
>> >>>>>
>> >>>>>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
>> >>>>> -include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
>> >>>>> -             $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
>> >>>>> +include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, $(src)/Makefile)
>> >>>>>
>> >>>>>  # modpost option for external modules
>> >>>>>  MODPOST += -e
>> >>>>> --
>> >>>>> 2.17.1
>> >>>>>
>> >>>>
>> >>>>
>> >>>>I do not think "M=$(OUT_DIR) src=$(PWD)" is the official way,
>> >>>>but this patch is a clean up.
>> >>>
>> >>>I tried what is in this patch and also tried to find an official way in
>> >>>the docs.
>
>
>There is no official way.
>
>> >>>
>> >>>In kmod's testsuite we build dummy kernel modules to exercise the API.
>> >>>https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/testsuite/module-playground
>> >>>
>> >>>This works:
>> >>>     make -C /lib/modules/$(uname -r)/build M=$PWD
>> >>>
>> >>>This doesn't:
>> >>>     make -C /lib/modules/$(uname -r)/build M=$PWD O=/tmp/kmod_test_modules
>
>
>
>O= points the output directory of the kernel,
>not the output directory of the external modules.
>
>
>/lib/modules/$(uname -r)/build
>is the clean source tree.
>
>/tmp/kmod_test_modules
>contains the build artifacts of vmlinux and
>in-tree modules.
>
>Then, the command you gave would work.
>
>
>
>
>
>
>> >>>
>> >>>I also tried the variants above with setting src, but all of them give
>> >>>me errors - I used 6.10 and 6.11-rc7 for these tests.
>> >>>
>> >>>Is there a way to do this?
>> >>>
>> >>>thanks
>> >>>Lucas De Marchi
>> >>>
>> >>>>
>> >>>>Applied to linux-kbuild. Thanks.
>> >>>>
>> >>>>
>> >>>>--
>> >>>>Best Regards
>> >>>>Masahiro Yamada
>> >>
>> >>Hi Masahiro,
>> >
>> >I guess you meant Lucas :)
>> >
>> >>
>> >>I think your intention is to separate the source code from the compiled output.
>> >>The correct command should be:
>> >>   make -C /lib/modules/$(uname -r)/build src=$PWD M=/tmp/kmod_test_modules
>> >
>> >oh, looks like this works. Apparently my mistake was trying to set O=
>> >like I normally do for in-tree modules.
>>
>> spoke too early... It worked because I was in another machine pointing
>> to a 6.8 kernel. It seems like something broke between 6.9 and 6.10.
>>
>> Running a quick bisect, it's pointing to this commit:
>> 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern rules")
>
>
>Overriding 'src' from the command is not allowed. That's why.
>
>
>> Error like below:
>>
>> $ make -j$(nproc) -C ~/p/linux-dim/src MddPWD/build srcx=$PWD
>> make: Entering directory '/home/ldmartin/p/linux-dim/src'
>> make[2]: *** No rule to make target '/home/ldmartin/p/kmod/testsuite/module-playground/build/mod-simple.o', needed by '/home/ldmartin/p/kmod/testsuite/module-playground/build/'.  Stop.
>> make[1]: *** [/home/ldmartin/p/linux-dim/src/Makefile:1922: /home/ldmartin/p/kmod/testsuite/module-playground/build] Error 2
>> make: *** [Makefile:240: __sub-make] Error 2
>> make: Leaving directory '/home/ldmartin/p/linux-dim/src'
>
>
>I suggested M=relative-path + VPATH=
>but I do not know what you want to achieve.
>
>https://lore.kernel.org/linux-kbuild/CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com/

but that is only for in-tree modules, not external modules, right?
Quick reproducer on what I expected would work:

	git clone https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git
	cd kmod/testsuite/module-playground
	make -C $KDIR M=$PWD O=$PWD/build 

So... did I get the below statement right?

	There never was an official way to build external modules with
	source and build in different directories. Up until 6.9 we
	could pass `-C <kernel_srcdir> M=<mod_builddir> src=<mod_srcdir>`
	for unofficial way. After that there's no alternative.

thanks

Lucas De Marchi

