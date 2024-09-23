Return-Path: <linux-kbuild+bounces-3660-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104D597E4D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 04:35:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A24EB20A44
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 02:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2232F34;
	Mon, 23 Sep 2024 02:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7tF4lfG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDDA1FA4;
	Mon, 23 Sep 2024 02:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727058949; cv=fail; b=WsKZT0iom/L16at/9MqsnL7UkPaZ8yq1IDs6ppVo0lYkcIyfpxncvcvS9VPm9gZDCFSvIEil+tCpqrfjrhmu4P/y4fwP3VhOTbGZ85ottKC+65hRcWiJ8k0mnLS6yeXEty4ASPq86lMUBcp1k9FAITAhWh4rAJlNXzF3LEMmu8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727058949; c=relaxed/simple;
	bh=hAKbk6LX0WjWnXHrJojE9YybIqi507NfMbzsTx1HP08=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ivMjifOf7zSwpVyCSM8Ih415ISPZ1+mXl9ijQuXJKo8Z7VQoelwdteBRE3R8EArqa3gfFGWoCObO+kZWIO7ZvbgL195QXJOjPKeKGZe5W2eNlBI6XopIqp3Fd8omewDWeYWa8ypOCQ+vPlh4qAWjVmfeUvTPkwiTZDUF+nR1nzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7tF4lfG; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727058947; x=1758594947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hAKbk6LX0WjWnXHrJojE9YybIqi507NfMbzsTx1HP08=;
  b=b7tF4lfGIXVDlp3zdb0/ua7o7k5XjYE8yhNo445ET969u1Lzd3Lur/VE
   OSmPNxZsiZhhrDU1GyDc7M+i0odM+ZsKqC7wt7mOW+G+1Ov8idllcxaEl
   bDCaWviNgeYp2Ei86Sj38OINx9HWoH6ugpdOmZJoXcmCjLoki362FtDCb
   Ryq+AaeizqkpSQffdaAAWtARpyoOwRG/rok3UZUjRNwUAP212AX59w+aj
   lTctD86C40HINN1bvmFg6+o/RNpeSe/qf0onabpilE5znaA9HwOH7Yv0E
   f9jL7IFrCykSmGSGKkCdYIPb3ujMMjdnuS5Zp90DmOwyxXUN+u4nbuSdG
   w==;
X-CSE-ConnectionGUID: U8g56RR9Sia1YSdT8NXCZQ==
X-CSE-MsgGUID: aDI7QsLDRaOItiCBwG40yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26143042"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26143042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 19:35:47 -0700
X-CSE-ConnectionGUID: c84AaQ/6Q72DFxTFZlE7NA==
X-CSE-MsgGUID: LRdWgJpXRlmP3n6AWoD3iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="101767359"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Sep 2024 19:35:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 22 Sep 2024 19:35:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 22 Sep 2024 19:35:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 22 Sep 2024 19:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LF05OQZ8Li3KA4OeEAY71mAG/Tcqq6Ht6RUrBG7VTsCVfwzpj6K60ALFBuV2wN7K4WNl9Pjqs2VDJ6xcfINBIFiWArGgtH0jDHyvxyCgH2stBqweCx6PKnyMpgy5gPbJbHmgl/6FLFznQISNxI6pUmPYZRDr+CH1fXtnFitODh2NmKLwSIRyhkql69zfeAUL0RyAbatvogDQJtvV/nAJCbPQpp3Z876wqbL7q8kzPAQr97iSwjG75ByJC+jfpK3B5+AAYzygVsGJmWJ1FlMYpx1hxvNhrcuTbXvbGVOtHc+At2CBMOvICKx6BWHsO17LLSCMEsr2kZNgN0TSAlLk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmP2mXaF9J9Cw1+koH5p/JopOXJXwHv9hnNRIkrob4I=;
 b=Bzw2e4T5zSyxC7Sa3OMdNxgy+hD6dZtyTdQTA6HHCfiZfURbp5m4KphwwR1VKZFfdhyurhEfPdCXXTZF/NoKy+G1R01odswDo8xV9IqNvLXIjRc2YP8j5q4kF2XEmvfKOzHNbzcjcdfaBb+9zGEGFZ7JH7Dm5PuN7OWTL6x1aZJyl14g+KXQtMNHbzAvbDgmp5NvHUcM9fmAbcSyO9rkatMmy6EhfOgPEp2z/gw9NY9UIpf0vjdjgczDLrabvmk7EgO+nECaD+mParyrQRUAm6K/Yqa1fX1oQPQYgbZRja7nATfpq/nORLsXmDeSqjsJMATwPF3c/w7eoYmbLIporw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN2PR11MB4662.namprd11.prod.outlook.com (2603:10b6:208:263::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 02:35:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 02:35:35 +0000
Date: Mon, 23 Sep 2024 10:35:24 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, "Kees
 Cook" <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [cfi]  ce4a262098: CFI_failure_at_do_basic_setup
Message-ID: <202409231044.4f064459-oliver.sang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN2PR11MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ee9337-158a-47c9-ba8d-08dcdb786733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jIoFxQ6LiEdOPNP1L6XlqZ7+JeZbrYDa/k/SHM5H2taT6ApInabPPTmzqUHj?=
 =?us-ascii?Q?j95M02Ks5iXvc/T3tUd37Pt1nn+374CAE/LeGxIQhUdHRUqs6+Wipy1iNcM0?=
 =?us-ascii?Q?3YwskJvKEOsEflYBZRvK1D517wk9t7YSfbY92+dQ6NtpjSewvOEG4QIHWblk?=
 =?us-ascii?Q?QQKgXOT+U6xCJb/SVOGiehH1ZEl6GB4OmbENIajki1I4jq/7GGiJhYf0Zq5f?=
 =?us-ascii?Q?GTAEZ2J/ZhkuJyUvlNidFP/PYe2Q2JzufN8/RtGXKU99u2jOPStFVCi4cI63?=
 =?us-ascii?Q?ttord16iSYNUjRIxrmuOj3WuLP1mtjaIQoOI1AXmtp7VvZ4DNsmpY8rT9d8+?=
 =?us-ascii?Q?M/wiLky/fBjSc2Z+xmI90B5HqXD3DCENfvq9++92MUsitUfY29E4PTGZxh31?=
 =?us-ascii?Q?jjxC/ky6W8sSSFZ1eZwqWzTee0+R2vUbXuv43bTQnlDkJAuRdNm4fliM0dWx?=
 =?us-ascii?Q?hhnGFyKODrmAhv6NJydyboDq+vSe18WvH8o7b5X0VN/FFUuL4AVMxZszJOjW?=
 =?us-ascii?Q?WNgvW9rwQMHW6v6HWs2p48Z3vtBZK94IBPZmgMOWu1kWOeKqgaYCDf1wy6Oh?=
 =?us-ascii?Q?MPs+lAs7gFwP42+AKc6MmlmhPU9HLEQA9Ps8n+3AJ8R9Ae2gSXPAiqyWuak6?=
 =?us-ascii?Q?SwRQ0Jn6lCYQaPieYaqW0phenJL6nD+cuJmhL04cjxzup3xuEi2q+FjngrM0?=
 =?us-ascii?Q?utl+zQYZlg4FXPEDeZzLc8RngboDhV7Wt+i9PkG5rYEHQIxydXSHno8RTCSY?=
 =?us-ascii?Q?xSQK9Swd9gB58JHDMl67yo3QdIAkIvnlNVA/6SZFM9gU5wexrOEzlk/mpqo6?=
 =?us-ascii?Q?GWjqP5E7K5/fDJz5T01/z7Ej13qQTN/N1WXyDYNJBZshlteWDjMV+f/GE9Bk?=
 =?us-ascii?Q?1hIA4rYRkGsU5GbAb6pUSqa5IbySGe7QyoSOp6TP3bjcqPLGxJNPXQb8SfcB?=
 =?us-ascii?Q?9vsBIGphDmUPlTvbyTfaRBcIyuWhxUFm210lBr6Y+WqBkpyPufr0kekee7Ui?=
 =?us-ascii?Q?EDM26Q0AtZ4gbVGbHNkTKdyGy5nnBAS/5RtC+ZU5oHy2hW7IOOMLcXMTpy16?=
 =?us-ascii?Q?RpMPKL6Xk+UEjjOtTc1IYBrwioCa3+rtQLz9jMeSKg7g20flE0H/CU6mwSXd?=
 =?us-ascii?Q?PxAdmpT8zEZltHXJpkY2VInhd1z4xgfW8X0BPU4UFyu4Bk9SMoonE2CZ94VD?=
 =?us-ascii?Q?jScoMrVaE05msqv7lC0oKYZPy7coPgGqHCluAuM+fphJkH0/Fczaa35JFq/d?=
 =?us-ascii?Q?njwL0fmAOeub+A5/hCAVYnFcVXsrYHImiIXsJi2GrzMn7qWfMVnhbo8AMzuw?=
 =?us-ascii?Q?lUj3xmTRVFWDSI+W8K80yUmiYELxjHdLK3tndkWwU35V4mBkcAFxLQk4gvy1?=
 =?us-ascii?Q?92c5S/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?utSMav0ExoXhyk61nzcWHMR+zvbb9mAo78dNB7vy8iemGHUBK0y5eK42DqaC?=
 =?us-ascii?Q?lbsE0qAePifNJcVF46z/KK1CUCT7coxxSdIgoeG313yR7f807AGQpVsSSLGQ?=
 =?us-ascii?Q?bTfVl5T6vilg2BuKAHMg+K2efo09BPGMIqV/9GdwddFR6UtErkTS4ib3SAzq?=
 =?us-ascii?Q?baQwdzQHe7IY/pnT6gh0LSoc8cbTirE0e8VfRqHoaHwUGFYzRTeg3vLdfvX1?=
 =?us-ascii?Q?mRDV0tbgLYD/5WjDA2q3OCzJeNRQYmDTa5MHD2AMXEveRWQlp8mtRFAa162X?=
 =?us-ascii?Q?SbAydBYGRfzKCafujzJllQf0LYNmCmQB2smwFmuXilElewkY+3+Cx10OAS1f?=
 =?us-ascii?Q?CsyNu1kGmPboDU1Sa9S1XSlNNa72qWA/OEOyRq77e9JtW5G4FzwCvtgyrAUN?=
 =?us-ascii?Q?XXUk2ourhysGHJJ427B2CEzLBQTEXV83xVd3eE5sUD7rcwe3DvZEtNOVt4NV?=
 =?us-ascii?Q?IyL2TzOguuCnbtVRX+U7/WqX8WwKsGY6PsGLjzDPjkU1P0QM5EyAVntIzkce?=
 =?us-ascii?Q?0geQhBJQ2xSUQnfa3yKOOgrQk5GCdNfsd9GBEWl5eTY2yrpOZtl8/ZgIsNDE?=
 =?us-ascii?Q?UJwmlDQPYMXbjnIvpXH7KPQEkKYyVO28QV5Xxu85M5Lua7pBinh/ezgowNGa?=
 =?us-ascii?Q?lqXYds4/r+fbULP95HDnb81ceF/93HROUhX00wcUmxkjsZJk994GKEjSh1P/?=
 =?us-ascii?Q?Nn69+hR1BhKh1oHQmSjqutg2WM7oreoHH00Yhun5HmAPh00FJvA/MNGGCGfk?=
 =?us-ascii?Q?UyAmvx5YehgmARiKJ8Pze1yqqxbh7cvIQHPeAZPuRnf0Ing4p+meXSb6xjI/?=
 =?us-ascii?Q?snnIWxkG6hP0PM0K9jOETgeXlhymE6kq6Omi5vFa+kl0C7X3bF65GgqIReP4?=
 =?us-ascii?Q?JxZZbgHOwLFd9JbJuake6LeBCh803HNUpdYCuoFXRNIRilHcOEXsHbd5i4mr?=
 =?us-ascii?Q?y2chsHCgPtqAMlUomi7LwtXT9IPyn5k1/59z4eEVCnSU5zrnvDdpfdJSWrX1?=
 =?us-ascii?Q?fSBMln4km1nWxU6jC/N2IYD0aoxbyYUlzZAh0UMH9cHXWzqB2TmM+ZId1WUg?=
 =?us-ascii?Q?d/sxHiTRRxUFJHVkecTH5T0XyVyFsFcPlohQqjesb+VeStBiie5laoz5q5wh?=
 =?us-ascii?Q?uvtn/YMnmdBhx3N115Lg+BZ1EpRPLyJLm9Bt5RtYRyFCSF2SF5wOeagMM8NG?=
 =?us-ascii?Q?fCbCgqnXgy2S0MOI+guO56yAKl76ifGXEiulxFhmRoe39UzsdMaBLVToyM6U?=
 =?us-ascii?Q?34JZU94w/++kWFWQiDK93swWgHawLTu1mwl/0pIWEE+oOO8/pm25WsyHwuGR?=
 =?us-ascii?Q?3ZSKPzOk1ENfvM2hPoTWXGL6bp/7eI89CrieMVUpv1fCFl3djtFlRqgQxOGi?=
 =?us-ascii?Q?Bax+2g7yKrWia/cIaDh0/l3TZjP+2tryc4T/WqjmJ9d4h+0ve0WOfKW06u4m?=
 =?us-ascii?Q?zErwVnGzbiTRjiq6HGvysaU6GhAKGbN/gUEH0FV5NcD2qLKjoFt617XV0bQG?=
 =?us-ascii?Q?TykMpg4TpjKtTy38Dn5YyHmmBb/tXxxlNhbUq1Lk6srNYwuyXzKfc1OB4Lz+?=
 =?us-ascii?Q?jDpeSXKSWVNERk5T62O7KNwnWwj67Mc8WJyJJG3k6hF2NJTAv0AG772VrjXs?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ee9337-158a-47c9-ba8d-08dcdb786733
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 02:35:35.5443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmvNL3tSM8/fTU63oRcXYKZoUhKAVSfpWKsBeFdKTpLn6mmnjGPWJi4/zYrUeUR1tvlI3yxJUpOBdsq346T76A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4662
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "CFI_failure_at_do_basic_setup" on:

commit: ce4a2620985cdf06c200ec0b6dce80374237697c ("cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 62f92d634458a1e308bb699986b9147a6d670457]

in testcase: boot

compiler: clang-18
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+------------------------------------------------+------------+------------+
|                                                | d077242d68 | ce4a262098 |
+------------------------------------------------+------------+------------+
| boot_successes                                 | 24         | 0          |
| boot_failures                                  | 0          | 24         |
| CFI_failure_at_do_basic_setup                  | 0          | 24         |
| WARNING:CPU:#PID:#at_do_basic_setup            | 0          | 24         |
| RIP:do_basic_setup                             | 0          | 24         |
| calltrace:irq_exit_rcu                         | 0          | 24         |
+------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409231044.4f064459-oliver.sang@intel.com



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240923/202409231044.4f064459-oliver.sang@intel.com


[    4.352313][    T1] CFI failure at do_basic_setup+0x64/0xa0 (target: asan.module_ctor+0x0/0x20; expected type: 0xe5c47d60)
[    4.354089][    T1] WARNING: CPU: 0 PID: 1 at do_basic_setup+0x64/0xa0
[    4.355754][    T1] Modules linked in:
[    4.356607][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.11.0-rc4-00048-gce4a2620985c #1
[    4.358002][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    4.359086][    T1] RIP: 0010:do_basic_setup+0x64/0xa0
[    4.360669][    T1] Code: 00 fc ff df 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 84 92 83 fa 4d 8b 5e f8 41 ba a0 82 3b 1a 45 03 53 fc 74 02 <0f> 0b 41 ff d3 49 81 fe 48 0f 0c 87 73 0f e8 51 c3 47 fa 48 83 c3
[    4.362089][    T1] RSP: 0000:ffffc9000001fea8 EFLAGS: 00010286
[    4.364097][    T1] RAX: 1ffffffff0e17434 RBX: ffffffff870ba1a0 RCX: 0000000000000000
[    4.365952][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    4.366959][    T1] RBP: ffffc9000001fec0 R08: 0000000000000000 R09: 0000000000000000
[    4.367972][    T1] R10: 00000000bf7be9ac R11: ffffffff84506250 R12: ffffffff85c3cac0
[    4.368942][    T1] R13: 0000000000000000 R14: ffffffff870ba1a8 R15: dffffc0000000000
[    4.369883][    T1] FS:  0000000000000000(0000) GS:ffffffff85cbf000(0000) knlGS:0000000000000000
[    4.371041][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.372747][    T1] CR2: ffff88843ffff000 CR3: 0000000005c9f000 CR4: 00000000000406b0
[    4.373960][    T1] Call Trace:
[    4.374550][    T1]  <TASK>
[    4.375524][    T1]  ? show_regs+0x8d/0xa8
[    4.376619][    T1]  ? __warn+0x113/0x218
[    4.377594][    T1]  ? do_basic_setup+0x64/0xa0
[    4.378629][    T1]  ? do_basic_setup+0x64/0xa0
[    4.379650][    T1]  ? report_cfi_failure+0x8a/0xa8
[    4.380566][    T1]  ? handle_cfi_failure+0x166/0x258
[    4.381648][    T1]  ? __cfi_asan.module_ctor+0x10/0x10
[    4.382675][    T1]  ? handle_bug+0x4e/0x80
[    4.383622][    T1]  ? exc_invalid_op+0x1b/0x58
[    4.384650][    T1]  ? asm_exc_invalid_op+0x1b/0x20
[    4.385613][    T1]  ? __cfi_asan.module_ctor+0x10/0x10
[    4.386629][    T1]  ? do_basic_setup+0x64/0xa0
[    4.387588][    T1]  ? do_basic_setup+0x1d/0xa0
[    4.388679][    T1]  kernel_init_freeable+0x117/0x1c0
[    4.389628][    T1]  ? __cfi_kernel_init+0x8/0x8
[    4.390665][    T1]  kernel_init+0x22/0x1e8
[    4.391588][    T1]  ? __cfi_kernel_init+0x8/0x8
[    4.392676][    T1]  ret_from_fork+0x67/0x98
[    4.393594][    T1]  ? __cfi_kernel_init+0x8/0x8
[    4.394618][    T1]  ret_from_fork_asm+0x11/0x20
[    4.395674][    T1]  </TASK>
[    4.396559][    T1] irq event stamp: 14815
[    4.397628][    T1] hardirqs last  enabled at (14837): [<ffffffff812dc7c5>] console_unlock+0xdd/0x188
[    4.399014][    T1] hardirqs last disabled at (14848): [<ffffffff812dc7aa>] console_unlock+0xc2/0x188
[    4.400057][    T1] softirqs last  enabled at (14832): [<ffffffff811f6caf>] handle_softirqs+0x48f/0x5e0
[    4.402041][    T1] softirqs last disabled at (14823): [<ffffffff811f6f50>] irq_exit_rcu+0x58/0x88
[    4.404031][    T1] ---[ end trace 0000000000000000 ]---
[    4.405190][    T1] CFI failure at do_basic_setup+0x64/0xa0 (target: asan.module_ctor+0x0/0x20; expected type: 0xe5c47d60)
[    4.406971][    T1] WARNING: CPU: 0 PID: 1 at do_basic_setup+0x64/0xa0
[    4.407755][    T1] Modules linked in:
[    4.408609][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: P                   6.11.0-rc4-00048-gce4a2620985c #1
[    4.410097][    T1] Tainted: [P]=PROPRIETARY_MODULE
[    4.411648][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    4.413089][    T1] RIP: 0010:do_basic_setup+0x64/0xa0
[    4.414673][    T1] Code: 00 fc ff df 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 84 92 83 fa 4d 8b 5e f8 41 ba a0 82 3b 1a 45 03 53 fc 74 02 <0f> 0b 41 ff d3 49 81 fe 48 0f 0c 87 73 0f e8 51 c3 47 fa 48 83 c3
[    4.416088][    T1] RSP: 0000:ffffc9000001fea8 EFLAGS: 00010286
[    4.417598][    T1] RAX: 1ffffffff0e17435 RBX: ffffffff870ba1a8 RCX: 0000000000000000
[    4.418979][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[    4.419917][    T1] RBP: ffffc9000001fec0 R08: 0000000000000000 R09: 0000000000000000
[    4.420972][    T1] R10: 00000000bf7be9ac R11: ffffffff845062a0 R12: ffffffff85c3cac0
[    4.421928][    T1] R13: 0000000000000000 R14: ffffffff870ba1b0 R15: dffffc0000000000
[    4.422962][    T1] FS:  0000000000000000(0000) GS:ffffffff85cbf000(0000) knlGS:0000000000000000
[    4.424092][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.425752][    T1] CR2: ffff88843ffff000 CR3: 0000000005c9f000 CR4: 00000000000406b0
[    4.426963][    T1] Call Trace:
[    4.427557][    T1]  <TASK>
[    4.428538][    T1]  ? show_regs+0x8d/0xa8
[    4.429613][    T1]  ? __warn+0x113/0x218
[    4.430599][    T1]  ? do_basic_setup+0x64/0xa0
[    4.431655][    T1]  ? do_basic_setup+0x64/0xa0
[    4.432641][    T1]  ? report_cfi_failure+0x8a/0xa8
[    4.433650][    T1]  ? handle_cfi_failure+0x166/0x258
[    4.434671][    T1]  ? __cfi_asan.module_ctor+0x10/0x10
[    4.435681][    T1]  ? handle_bug+0x4e/0x80
[    4.436640][    T1]  ? exc_invalid_op+0x1b/0x58
[    4.437654][    T1]  ? asm_exc_invalid_op+0x1b/0x20
[    4.438665][    T1]  ? __cfi_asan.module_ctor+0x10/0x10
[    4.439666][    T1]  ? do_basic_setup+0x64/0xa0
[    4.440569][    T1]  ? do_basic_setup+0x77/0xa0
[    4.441644][    T1]  kernel_init_freeable+0x117/0x1c0
[    4.442656][    T1]  ? __cfi_kernel_init+0x8/0x8
[    4.443645][    T1]  kernel_init+0x22/0x1e8
[    4.444623][    T1]  ? __cfi_kernel_init+0x8/0x8
[    4.445863][    T1]  ret_from_fork+0x67/0x98
[    4.446596][    T1]  ? __cfi_kernel_init+0x8/0x8
[    4.447615][    T1]  ret_from_fork_asm+0x11/0x20
[    4.448666][    T1]  </TASK>
[    4.449532][    T1] irq event stamp: 15431
[    4.450600][    T1] hardirqs last  enabled at (15443): [<ffffffff812dc7c5>] console_unlock+0xdd/0x188
[    4.451996][    T1] hardirqs last disabled at (15454): [<ffffffff812dc7aa>] console_unlock+0xc2/0x188
[    4.453041][    T1] softirqs last  enabled at (15378): [<ffffffff811f6caf>] handle_softirqs+0x48f/0x5e0
[    4.455033][    T1] softirqs last disabled at (15361): [<ffffffff811f6f50>] irq_exit_rcu+0x58/0x88
[    4.456998][    T1] ---[ end trace 0000000000000000 ]---
[    4.458130][    T1] CFI failure at do_basic_setup+0x64/0xa0 (target: asan.module_ctor+0x0/0x20; expected type: 0xe5c47d60)
[    4.460087][    T1] WARNING: CPU: 0 PID: 1 at do_basic_setup+0x64/0xa0
[    4.461699][    T1] Modules linked in:
[    4.462586][    T1] CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: P                   6.11.0-rc4-00048-gce4a2620985c #1
[    4.464096][    T1] Tainted: [P]=PROPRIETARY_MODULE
[    4.465630][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[    4.467090][    T1] RIP: 0010:do_basic_setup+0x64/0xa0
[    4.468658][    T1] Code: 00 fc ff df 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 84 92 83 fa 4d 8b 5e f8 41 ba a0 82 3b 1a 45 03 53 fc 74 02 <0f> 0b 41 ff d3 49 81 fe 48 0f 0c 87 73 0f e8 51 c3 47 fa 48 83 c3
[    4.470088][    T1] RSP: 0000:ffffc9000001fea8 EFLAGS: 00010286

... (and lots more)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


