Return-Path: <linux-kbuild+bounces-3148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0108995AD2C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 08:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26A141C227E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 06:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA29C136643;
	Thu, 22 Aug 2024 06:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HK6EF8IO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D15512E1D1;
	Thu, 22 Aug 2024 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724306722; cv=fail; b=USvJBOTy2F4dcoNORp8wfGiXBpcXZBlaUiEpDSH+SZXqtmZisWbRVS4ZX+XOuu3IE7tyBZqTPKjLeNS3In1XChdNtM+vOQCO9+QYgjc1laypHwjbmjYvbP6xBQ23ULyACQslJfUcN2Wt7H3icunEybZE8hQgB0iUjC3hsQET3AU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724306722; c=relaxed/simple;
	bh=7ZxOuQwy/cwMhXjcjXUf2kToSGkMV0VZJLBuS9/5tiM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kxZN3xyDaL0VM+5IPvkcrHDW0FC2TqHMrfrk+3AzdlAedLyiE8HTcO1kpGUyy33EGtqFSJmZ/Ef+5olyjJiBSU0fWIIL1mVepG5rNxBAsDpGsAL+92vzV4Ms9+BuSjb7ZJOKaDCr1SElFkhgKpzioXJe4xu2vBAcpdtPqfWYCTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HK6EF8IO; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724306721; x=1755842721;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7ZxOuQwy/cwMhXjcjXUf2kToSGkMV0VZJLBuS9/5tiM=;
  b=HK6EF8IOg/PL89cB0AtOWZHzUVZo4A203WI/bjx6IqVkFfQo651w2Fx0
   BHepVFHEnK0eguz7b5o0Ycx2JqIVTmUsTsNuOUVc+39hH0SVsqQ5ohF+v
   VeXR0vW3p73MeHWbB0AE7BAIICpP4fIU1VOCmWzs631zAJO7IZWq4NjvM
   5DXA55HFlvTFtZrnk6hmB9eI+jeHfBqIAWWBvhsUtLy2TEjpCPLGbH5tI
   kASZD7WKtOu3Tz9IsVOkRRzrZT+W4+FhPGkIYfutb48acuOfubxgl2RWB
   nZk9l7wQweDUEIifz2OLs8wyUHwxcPREQF8zsoUDcBzkyEmaEGDjyA0l3
   Q==;
X-CSE-ConnectionGUID: wAOMuSWYS0SZF55t2OPMxw==
X-CSE-MsgGUID: Dqit7sSrQciKn3SSFm5kew==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22570708"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="22570708"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 23:05:20 -0700
X-CSE-ConnectionGUID: ipogic1uSgqaSJXBY7Kzng==
X-CSE-MsgGUID: AEn38FXuTRGYDsP0pJOKnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="62061805"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Aug 2024 23:05:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 23:05:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 23:05:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 23:05:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 23:05:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYZTCOz7wTKAiUpYelgCWt2ZsBurYRiF7nE9NlsxzXHdOEpqIEldlv5rIuo6e0z+YexpIVr3lecZKqnatRkVhXDT+V3u00zkeHkbf1VvBF4QzJjRGjzX/Lt8yYJL07pcfyMbb76dOKnVzzBXgyg3OaUNYBXcFoOxuKeEEwcT1IK0GCBi1SqH7di6TcR8pU4FQ1YASqejks5Emlm7IR0udPynP0l7JNPCk8zkea3XBRfyKMPlHgAWFbTNIfXLuS8cmglp8GZhekuyrNW7xm8Adwxt1ZoWjkVrGIdveGAJNJfc5unrdc4dm3GlyLNLnXznOtdQkg5WJ1RatH8IS0Ri6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eWBVIkmv5fBf05hsFFDRq4bzJiZfTFl36HUbtLMNICo=;
 b=sGWsKRE8A6Pzfh2m+qykA5ogM1YrDBbLcNfaDN4N5gnWFWKwObrr3O1drNe/t+EUtpXjqa7YOex0S79ez2e2OI2svRpnKjgNSHSYv+R5F3N3sLGxcSKc1v9PVGa1pQTmSSAI9tB6nEBclZTy7tTJV1tH4zYQmSdj0L2gfFDVsh5MXWfNEIj8igx9JYvRMwv6QmG/MiSQnKzzQGx+Yci7BuPVgNPaXupyyu8tDfrNe3G0VdGaHyJtuNF40atHFr0GHa1hlQVeMAacKTYghwEF3tuMe0mYRQ579N4BULTGdV5zbtqhrCf9em0HVmeQSIZRvlo0/EuRJWoar6uCKcuDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6459.namprd11.prod.outlook.com (2603:10b6:208:3be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Thu, 22 Aug
 2024 06:05:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 06:05:14 +0000
Date: Thu, 22 Aug 2024 01:05:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Michal Suchanek <msuchanek@suse.de>, <linux-modules@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Jiri Slaby
	<jslaby@suse.com>, Jan Engelhardt <jengelh@inai.de>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Nicolas
 Schier" <nicolas@fjasle.eu>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] kmod /usr support
Message-ID: <5gx6vt4tzgk4zvboxrrahexr4ja6zm6fisjshdvnlfihsysqzb@quhp42ydtvh2>
References: <e3yow7ih6af2hxzkmjay2oan3jypmo4hda64vxvpfco66ajcew@i3zewn4nbklf>
 <cover.1699618135.git.msuchanek@suse.de>
 <xbgto5tttcah4mrtyjih72ubod3qb375ww6e2fd4pi342rg4eg@wipwd57q43cc>
 <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARYK-xjBS8puEM9xFtmjBNW6KJ2Qd6f7diZkdEEbUgVHA@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d14bb7-ac2e-4e37-4bbb-08dcc27063b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFlpejE1NXlsQVdPMW9hb2dGQlVscHN0aGhwTjRGSzVLcFBkbmZKd2x5MGxx?=
 =?utf-8?B?OEU0T0V0OUFvWDIrWkxNRWpWMHV3RG9KVVRSWFo1aWdIOVRlbkJJNTBMYmFT?=
 =?utf-8?B?SVRwaWp0MmdnWDNlOGJObm41dHF5b2Q2eHVtS2RadEViT1p3aGx0elYyR1Y0?=
 =?utf-8?B?Mjd4SHR2VUhNbFNRbGx5UzhaS0M4L2pVbGdRbW9XdWxVNGRldC9lZnRnenQ2?=
 =?utf-8?B?b1h0MFBmekIwTi9oQnB2cnRHRzdXdjFnZ3Vwbno2ZUtKYUExWXBiemVmTFJR?=
 =?utf-8?B?TEErdHgzMUJDak8xVmp0QzVzU2ZHV1pTbnZZYW9JZXZmRnFqUWJYMmpDRXRa?=
 =?utf-8?B?eFVBYVVUNU83NkxXeEdOdkFCRU51OHh6ZGp4OTlub2g2Y1k1dm1WMjV3c2V1?=
 =?utf-8?B?a0xJbi9EQk4vNWpxdC81VU04VU1kMDE3UjhZSW5aRlU2T1Y0dGlqK0pGODFI?=
 =?utf-8?B?a2JXOFFDV2xuSDBidWR4cG1MdEpiTVdxanFibUEzTm92RXFVWXRvemdXWjVk?=
 =?utf-8?B?ajhZd3ZrNzZDa2JGTVNWeHdrZmVTUDB1c21SdTNabTM5QmRGZ2lRcjJSYWZ6?=
 =?utf-8?B?QncvMllxNUVvcWQ2eng2R0tSTGV5YUZJU3QwaWp4UkNEU1k4MWJLK0xvam05?=
 =?utf-8?B?cjN5VTlVdVI3ellTeFNMQkVlSWN3MUFMSG9qRUd4cmZTVGdTUy9NRlYyYWpN?=
 =?utf-8?B?K2Zlc0pmdzdMcm5rRVZJRXJXNWloeSswWk1VNXl0SVFRU240T0xLMUJ5WnBx?=
 =?utf-8?B?Y3JnMWcwZ0phV2tZMU90RmQ0WUlHUVVreFdwTHdxQXpuakprdVRsWWtONkNT?=
 =?utf-8?B?UnU4SFF0bEQwRnBqUm1XcmNMZmpoYkpPVUpyRW1BQ0ZZTFhld2d5UWNMdTdU?=
 =?utf-8?B?R0hvNHRZeExlRDhhQmx6ZHJCT0JlbFBSZnNySGNBNllJUldwZ2NDcWErSTNj?=
 =?utf-8?B?Qm8xRmwrbXdPUGNtSzlWd1ZrZkVtcHFzSlVhSGg4aHBNTU5BRW9OUlA3dGh2?=
 =?utf-8?B?K1NMT3h2WVRUVjdjanh6UVowWmlWUnZpQU1lRXFPREVab3JyUXVMYkYvSDVL?=
 =?utf-8?B?Q2NROHR0K1g2aGtDbVB0SVdPUDJTQVE0b1JwblRJSS9Wc1lTRlh0eWpVV3Q1?=
 =?utf-8?B?SVA0MmlGOHdMZ1hqYnhTejA4cXpZeVpTbjM0elA1eTBPZ1Q5MlVma21ocity?=
 =?utf-8?B?SnFaaHBDRTNBRzBoOWxnQnAzY0dGeUp2UWk5NCtrNGpCOGtPMEh6NFlZVjBU?=
 =?utf-8?B?YXpqQmlQaFhqZXJ0dFBINWZQV1lyMlFGcTQ2VmhkbTZRZ21oVmQ4bmRBVGZz?=
 =?utf-8?B?MEZobGE1bGtyMGZqWG5nck8wSm9uQkpTNkduZXQ5UmFsTExMZkpQZFcvZ1Bi?=
 =?utf-8?B?N09MWENhVWd1QUhXMDNXZi9ia0RWMDlrRG1peUVvUTBXQjdZNVM5ZEZwaXRJ?=
 =?utf-8?B?ZHpwaDEybG01cXFXM0JORWNKZTdrRWk4YVQxRU5Ed2ZJUlcrTDVyMGVEcGpW?=
 =?utf-8?B?OW1RZmlkbnBWbnViMDNkUkFlUzNLRzFLLzJQT2laV1R1Sk5LbEhLZTRpYmpt?=
 =?utf-8?B?akxCemx2b2FjMU1QQXFoZTlDRWRoS3pNNzJHMW1XdE02UkdMWjhmWGJtcWh4?=
 =?utf-8?B?MDVmOW1YQTNicHFCc01mUERqWmpOcm8zTVBnQVg2eHduY2VZbkcyTUV6dTF1?=
 =?utf-8?B?VU9GUWFBYi9xdUlZcEVNWllPb1h1Uk5lNllBd2xlYjZiUGJyYlRjdDhxZXAx?=
 =?utf-8?B?bmtkdWQvQnFremcrUDEvTENhVTRYbHR3aVZ3ZlZNdUkvcUJwakpzQ3Z6cE42?=
 =?utf-8?B?c3pVS3pkUlhWNm05dDJLdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmhTdjJRTmdWZHJ6MmNPMFRhOUEwazE1cGFsdVRzUzlBajRlUldkYjZHTVlI?=
 =?utf-8?B?WmNVS3BxK1pVMlVDMWZtZkM5TkU1R3pUZFBqWGEvemh5QVhaWmhmeVArKzlW?=
 =?utf-8?B?TUdKTHhKTWY3ZkhPTEVxM0Raa0YyRCswbldjMFRXR3N3UlNkVTEwandoN2g2?=
 =?utf-8?B?S1B4OGxmNnFkZ0o2RHJQZ2FBa0pMK2xKd3V2YXJBZVpzb2pjM1ZxQUhQeG9w?=
 =?utf-8?B?K2xTNy80ZEhGMWpLQUhPT3krSlVyd0x3aDR4T083Y25laXBWa2NUeWw2U2JK?=
 =?utf-8?B?elR1TlVwaWlYVHAxV3hhcnJPOWt3Mm1ScnlJeDNZb0I4YXM1US85UlVmYnEr?=
 =?utf-8?B?UFd4MWlEUjNrNHRobC9WU3cwNHV6Sms4RjlEOGlrdC9sL2sxOGROS0FPeWxJ?=
 =?utf-8?B?QnVrRFlUNHR6WCtFNURoTTBYelJqazlmNjFJbDFSSzUzT2VqNndOelZKaGdn?=
 =?utf-8?B?cjdIdkxjM2ovWFFFVnpHMGwxSGMyTnJKWFd3R3JWVFdzaDdQMmMyWCtRSzVN?=
 =?utf-8?B?ZXdLeVZsL0NQVmEvYVdiWnVseU91cWpzRHI3b3dQVWtOUEJ3U3hOdGpPODJ2?=
 =?utf-8?B?aFBsOWphRjJIeXU2TEFFNkxsUzlJWTF2cjNxSEV0OW5EZ1lBd2RuN2dXTms4?=
 =?utf-8?B?d09wRzhFS2p2c21hZnY3dVQwT2s1ZStoSWptMWJSNjQ0UWtGNk9JOHc4eEt4?=
 =?utf-8?B?OXNlUXNqRTRKZzhueXVKT3VLSW9sTUdwLzlRRFFRMUwrU0RFdW1vMWJhLzhO?=
 =?utf-8?B?VTNXbFB3bCt2TjdLdzRpQTNiSFRvVWdRUlo5Y3NoVU5wMWYxYUR5amRVZXVE?=
 =?utf-8?B?WHdYS1lKbDc1MXJzY3dqaVUwbXJ5K1BXRitBcDRFNHRPN2Vnd3ZOc2VMQk5w?=
 =?utf-8?B?dll1SmE1cVh6aS8zMG9WcFdoTG04Tmw5MWVqNTdDRXJ5Yk40SXVnb295K1FC?=
 =?utf-8?B?WWZBeS84QUpHcHNGOFdVWU8wdVdBRng2ZTRLb2U0M2RIQkp4Qm5rNU5WUVZ4?=
 =?utf-8?B?SVNabm51LzlydzIxS1lnN28wMWQ5UThZOUlFcy9sQmZybjhKMURkZlAySU1k?=
 =?utf-8?B?K2R6SGUzMnNISGczRUZVOVhONzdqRzllSDhpRDJ2em9jTTc4UHk0UEdCOE5E?=
 =?utf-8?B?bzArc2U2MHUrMXRjeXhkc2lsMjlZdjY2QXVWVFg1Q2NYd1JkbzJGanlsMXZP?=
 =?utf-8?B?Q0JJYyszZXdCZlZ0TWRLTzBQWlNNRjlod1ZBdkxKS09uLzI1bG5jMnp4OS9t?=
 =?utf-8?B?VUdTMW5aVjY5c1JxdGxIcE91Z1FZeW9jK0JUWDdBcjNNL0ZNeVI1MEdXN0dE?=
 =?utf-8?B?TkhnQUw4eHhibU01NC9JMTRCZko5K2tSUkJXY2p2cnUvelpLSEkxWGF6QjVh?=
 =?utf-8?B?Y2ptNjRibEVGazI1MGFEb0hxaSt2eVZKQ1kyb0todkFYSnBMUDc0VHFHVTcr?=
 =?utf-8?B?bVZWbkhITDhqNjFYT3VNRDZrQ0VjK3NUak1ubS8xZHlCYnpIL0ttc3gvRjZV?=
 =?utf-8?B?eE1XWGFSQlN3eDAvNEZQV1RtT3FDbWVuQnloZzlxU2YzcVhBNUNTckdhNlRJ?=
 =?utf-8?B?aXVOUXNaTFJSY293SE5tMXEwUGlYcldmeHdZSFJoZXo1OWZoalYxU2I1SzFL?=
 =?utf-8?B?ZWFTT1Z1RFJrKzd5ZElQS0hrVm90RExqNkhJaWEzajUzM1JNZGwyMVNBQXJT?=
 =?utf-8?B?bzVoUHJnaS9JM3NqLzBkN0k3NDVuTEk0N0VRcEoxNUpBdDNYTHpLV3FnSTFD?=
 =?utf-8?B?elliWlkrb1ZwYmdZcEt1Qml3SnQ3dTZlOGFmckExSjlHZXNZVmNIeitrZ0w4?=
 =?utf-8?B?RzJFaE1yVGIwQ2dvS2FxaDVNR0dhcDdoYzVKZnlCZVhUNzk5U2RkQW5MVGNN?=
 =?utf-8?B?NlVXSXQ0SmFyUncrdGNESkRFVWZFVE1xY0RESDR5ajBwTTd5azdrTUduOUEw?=
 =?utf-8?B?TU85ZWNPOTkvOVE2WDY2cEY4ampzU3NTQVZNUVhycEVadXg5b1U0R2pPSXR2?=
 =?utf-8?B?RHRpazgyTGloM0NDL0tDeDI5dXBXUmhBU2Z0b2p2TXhFbEFqNzNKditaZ3JI?=
 =?utf-8?B?WS9KYWhTWWlpR2hkS2tVdE50L1pGdVNhY01uTlBRdktZQkkvcEZhcUdwd2Rk?=
 =?utf-8?B?dTF1SDV5WjlyalNrTE9TL1UvMEtCL2dKdUxJaXV3eTFQdHZIeVVKanJ3OUFt?=
 =?utf-8?B?WXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d14bb7-ac2e-4e37-4bbb-08dcc27063b1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:05:14.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dgpwv/8WBkM7dUY0VWIe0pRWLxOa5aw3wrzLFscqJ/hscPCHbaO3enPIks53j+yxQEMWyzgKZkh6+zPIOPKrRFycK3C3BAfhqZPAoMHWdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
X-OriginatorOrg: intel.com

On Tue, Dec 19, 2023 at 05:37:31PM GMT, Masahiro Yamada wrote:
>On Thu, Dec 7, 2023 at 3:37 AM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>
>> On Fri, Nov 10, 2023 at 01:13:53PM +0100, Michal Suchanek wrote:
>> >Hello,
>> >
>> >This is resend of the last patch in the series that adds prefix support
>> >to kernel module location together with additional patch for validating
>> >the user supplied input to options that are interpreted as directories.
>> >
>> >Thanks
>>
>> applied, thanks
>>
>> Lucas De Marchi
>
>
>
>If I understood this correctly, MODULE_DIRECTORY is determined
>by "configure --with-module-directory=...", and there is no
>way to change it after that.
>
>
>If so, how to work with cross-building?
>
>Cross-building is typical when building embedded Linux systems.

I was thinking the `pkg-config --variable=module_directory`
from the target would be sufficient, but... 

>
>
>Consider this scenario:
>
>- Your build machine adopts
>    MODULE_DIRECTORY=/usr/lib/modules
>- The target embedded system adopts
>    MODULE_DIRECTORY=/lib/modules
>
>(or vice a versa)
>depmod is used also for cross-building because
>it is executed as a part of "make module_install".
>
>
>The counterpart patch set for Kbuild provides
>KERNEL_MODULE_DIRECTORY, which only changes
>the destination directory to which *.ko are copied.
>
>You cannot change the directory where the
>depmod searches for modules, as it is fixed
>at the compile-time of kmod.
>
>
>
>
>In this case, what we can do is to build another
>instance of kmod configured for the target system,

the target system may not even have depmod actually, so using just the
host one seems more appropriate. But target should have the kmod.pc for
the pkg-config call to work.

>and use it for modules_install:
>
>1. In the kmod source directory
>    ./configure --with=module-directory=/lib/modules
>    make
>
>2. make modules_install INSTALL_MOD_PATH=<staging-dir>
>     KERNEL_MODULE_DIRECTORY=/lib/modules
>     DEPMOD=<new-depmod-you-has-just-built>
>
>
>
>If you use OpenEmbedded etc., this is what you do
>because host tools are built from sources.
>
>But, should it be required all the time?
>Even when the target embedded system uses
>busybox-based modprobe instead of kmod?

no, I don't think we can rely on depmod from the target.

>
>
>
>depmod provides --basedir option, which changes
>the prefix part, but there is no way to override
>the stem part, MODULE_DIRECTRY.
>
>In the review of the counter patch set,
>I am suggesting an option to override MODULE_DIRECTRY
>(let's say --moduledir) at least for depmod.

ok

>
>(Perhaps modinfo too, as it also supports --basedir)
>
>
>
>Then, we can change scripts/depmod.sh so that
>Kbuild can propagate KERNEL_MODULE_DIRECTORY
>to depmod.
>
>
>if  <depmod supports --moduledir>; then
>    set -- "$@"  --moduledir "${KERNEL_MODULE_DIRECTORY}"
>fi
>
>
>
>Does it make sense?

yep

thanks and sorry for missing this reply

Lucas De Marchi

>
>
>
>
>-- 
>Best Regards
>Masahiro Yamada

