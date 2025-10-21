Return-Path: <linux-kbuild+bounces-9229-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BBBF422D
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 02:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A552B3506C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 00:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8378A1AC88A;
	Tue, 21 Oct 2025 00:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFRu75AO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8FD1A317D;
	Tue, 21 Oct 2025 00:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761006039; cv=fail; b=GHQA8viRH0P0858bKEAHTA7+RgBEgb259resRfFue/gQQolMDr4OYttJmXp/CzZKHthsGOYW6mYCd1Gtzoo5H0xOzlUKGa1SiinUkn5DeySTvAybcxu+I8rACO6I9HwhDqZFbMblylSkkcWmI4Rul3LcRXaX/SuNCv1BdUFSHEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761006039; c=relaxed/simple;
	bh=Ss9Hhf12o+RadTEk+IS3/XHf0ZthImRoVgINvKGtpsI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iTXmcwUQZFUBVDfKeHcp01uAG4uz6qjrXpY54e4ESD8aja/gWvwUlhki/LA8QAi6KQ3aG4Ewoq3T01XeHpLp1Jbo1tshYu6gK+ClmtUYJy2kHzHLeeIOBZ/wcv1Kd9xYDuig3D4awcJ7e9tJuTfPlHHlsIF+2/tyrSw/w03Tlh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFRu75AO; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761006037; x=1792542037;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=Ss9Hhf12o+RadTEk+IS3/XHf0ZthImRoVgINvKGtpsI=;
  b=OFRu75AON6Ec4tTZ1zPxr9GGbvslNZwatefwJ27z1iULqPLmQQc/jQnW
   0XtFqqG41ig/rWZJWw64NhNeq2I45UZ6227ZvQgQzLOP901s9nsyO44L2
   TUsUJOFCdFZNinHfnY7v9NVKrv7djauo7B3FlTMSk+0WAYrF/AexDTJFf
   2k6dl9F0EgVxCBqstZF1ZVfx0W2T/96ut+c0vcFInP6Hdw18qr1yon7Si
   ymym1SKDn8VjKCM1DIUTCLrDSPmMOyTwVEVB9VYY3TMeRlRJEpmjpg1jo
   LPnC5b/tzH1cqIdEeI1ngnm4IIcjgXooZmscly7/Ti7iaYKNYj4RPoJEi
   w==;
X-CSE-ConnectionGUID: 6mXphIDOQbaVd7NooO8r1Q==
X-CSE-MsgGUID: utGIxOBjSYiieWqOZdEHcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63027246"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="63027246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:20:37 -0700
X-CSE-ConnectionGUID: 8CmFbZtnSeaEOR0Tm6jkyQ==
X-CSE-MsgGUID: hbc8d48KSaSZBfSrThSRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183865617"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 17:20:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:20:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:20:35 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:20:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oz/7BV9zVxuBxKAi/LTgRHW5Gpaq7JbDWM6V8tXSTz5k+N/MnSfoxFDYtvRzxYDOKVuBQjFRU1VMElIoXLVqWemgOhtOf8l60HjUqhOT7i33IgqTfNJGNOguRxmym8yAQ8DVcDcc3UOTujJxsY3UmeZRUmlfx5fv7US67jhOOUjauxVL25buVvcD9xPOi5OAXCLKmXOXcejZFiiS1+OalX2cbAyOQ/7zPpdwaT+3zqE1AbKX1JiX0pXZZra0opAzbkOyK93VmXkCvRIFxsrsJMwZ+EVTdbj7RTV1lr0JUYU8JBfK8iVZ1cTVGpsetsPBAMJ/aVRKqA1b6DslPQ9zFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvQ/DP+stG20uJeiW1KVXDXDwAQr0LNiecAtnRGWTpo=;
 b=RcbqBULtvBHUC/VSO5ynAuNfNVVBAcoD9AittHRK4eb1Mva9P6AKK2ReVUne4XzO34d2Hr+uSHVESYorIL9IkUIU0NZmV4G97SBxy3dczJR8u6CKhv3m5XIMReiudzpj+M+n7LbehzZI40TudguH/cH80E+NXNy+pHOdTsamVunjIxkNgmI56THLFpvL8HyvUqFtstKQUP5QfA98epa4Uc+2RCQxUM+lyObEZSFid6C5wWIaLj5U3ZxPvnwq2ly4cIV9E/37HbSTtfgU8DGXXsriU8H8OWIbvx2Hn9cPwI8K5gMtE++/A8QfJIil23XGsoRF6BgJYjfaoQHobwgeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DS0PR11MB8231.namprd11.prod.outlook.com (2603:10b6:8:15c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:20:32 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:20:31 +0000
Date: Tue, 21 Oct 2025 08:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>, Masahiro Yamada <masahiroy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] modpost: drop '*_probe' from section check whitelist
Message-ID: <aPbRxnyo1FDFBx8h@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251020091613.22562-1-johan@kernel.org>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DS0PR11MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: b9964b7d-07cf-4896-e66b-08de1037a4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ozcHSJwSygbalwoluxQ+tOaKc86TY9KUZHVEcE5IQjZ+kUP/7Kp7uvEYCKGI?=
 =?us-ascii?Q?HBMIUCNHMYk6zRR8ze8buds7F1kov0uEAcJybU9yuWPXla1QbPVk/jbBr+1x?=
 =?us-ascii?Q?70nxLRE59yr/+4xk/c3IdZd3YSRd0uPALMhCGEj7j13uS1yUrUhIPfat2wYM?=
 =?us-ascii?Q?w34oF4oJMNTaeRLniS3+oRf+3AEAZVkAvvTQbF8jWVW0n7GFLOvJgwe+Ku2o?=
 =?us-ascii?Q?J38Jn4ljR/HE2WucQTXGfWiCmtweFFgY3EV1bkBAnkm3E8JEYOfgOX4uGalm?=
 =?us-ascii?Q?JB/w80u/5ci3kAqt66Ow5C3y+9DT7smDTz6NU5s1CAWqa9trPhSIFpo7HW9u?=
 =?us-ascii?Q?is9A4D/CzQkH5cVoqxPxJHqcLhEDMOMpNXa/7qAj/xIU1+O16CsIqhlOL4WR?=
 =?us-ascii?Q?NeBmpXrRUgvDCHjt+pdSk8dFRSNkX7Gaez22lIccz8pjBwJKbqcH0hlE52qr?=
 =?us-ascii?Q?yWLf3HH3gP5DUIUsmyuCSIcNVBS445pQxkaHbU1nbKjBdGUurD5urYmMlK2w?=
 =?us-ascii?Q?TaKSnKAgmgAZc0apFiOtMHld7O9oJkYW7fGrVsRA1Vn5rQ0SbNf1NBC3DR18?=
 =?us-ascii?Q?kXNzhl1TXheZuMt5MV5sOGCQHWfvUY1Niz+SBjiXobJ83pWPIFswJV4OVmc7?=
 =?us-ascii?Q?oigS7jJ99b8zQGA6CjR1/d+vKZu2rgIRht7mxWI3Dp0PXhksTJeMT1npWYWl?=
 =?us-ascii?Q?KZlkCv22nYPhJVNrTXGXFoRXEiDC8TZdR1PzbCGxOpF5QWQH2DZrkFTzjD0V?=
 =?us-ascii?Q?B/IaPKWvAWjNwYaPQSXCNO4WDAHOEOndrJFsR0JxTkBqzcCbG1MlpBO6TNm/?=
 =?us-ascii?Q?dIpBsd3rO+cftIK5zTX+Q4/Bb+RchSMD7bKceAGcCMFr7uVtIA7fhpmob4O1?=
 =?us-ascii?Q?U0O2PMDt46Y3J7nl/G66rjfo1plmEngJ/BWUV8t7BXgK1CVMYOR1vDQgFQsS?=
 =?us-ascii?Q?S7XPuEtafGmfiluciTzauhPUB4iM5isr5YoRBfJ8lGfGQUKbm+4mPt24f+a5?=
 =?us-ascii?Q?OSih+Z6Rijs5LUc+JwWM7Gl2XupARTNX3i18OGQ9gIUMkqZb24FNGJESp1KR?=
 =?us-ascii?Q?qM2+JHLoZODkkR6pdacvSLPkPoZUuldouTcT/7UcASIMZqN+JOiScK2B/son?=
 =?us-ascii?Q?IG5V5yFWSHl/idFdYHJpmXOkmnC0DKTyUr8B/B0XuBGwa/0ov/GEUMrzWa+9?=
 =?us-ascii?Q?VOEASK73CbziGi+Lh8D6o4Zm5sSC99uFwcboG0y52ihuhbsUrg3W9GHG5ZYE?=
 =?us-ascii?Q?OU9jv9dAc+SSk7SG2P/MFi92F1itXksW8us7QgTwzpFt/vU257t6lfc+cCU6?=
 =?us-ascii?Q?z/ZDvIh3Kxuxqxlp4nWcb4F61oRdVlBDQwwX4C1htEFnBhF5BDuIvQFsuVd+?=
 =?us-ascii?Q?4t8mwsoEPbj0GMRpHkQr600l4lSoQ63+HlXkBqQj8yS0sQuW/s1VnIEUQfKC?=
 =?us-ascii?Q?AxxGZeJ9DmNZzBkpMTr77fWH2FNifTI0WrOZfJoOSV7QVad1wEYWgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WI7LYyqGAcZ7+7TTErZI0n0hrYIE272p6HI4kkCRXi48rKVcJni7Z77XGDLP?=
 =?us-ascii?Q?mB1vjT0nLi61JvRM3HeibbI4HOjNUTc1KPac8GpfhIopubXwex0bA9hw4Afm?=
 =?us-ascii?Q?xI/gksgVXimmR7Qrnz/yDcuiPV8NiUbDs70umB2hNDthtgQ16SwQBCOOTBq8?=
 =?us-ascii?Q?Qs4n6MDNJnSwTfq0fzUkr+bnxkaqmVCEwsvkQJpGDEU8Cy7X46IDjfcUDfOm?=
 =?us-ascii?Q?kyNC9G4yd7FFeoMdc6m3VMIoq+44zEs0UWjprH8y4NOQE6uMiyCwiuaVEnoB?=
 =?us-ascii?Q?IZKWB6Fyb17xcJqiniMQ26dddoZXw9irvujvkVMwl23MNFk/HiRAToyreHFz?=
 =?us-ascii?Q?kKtVsD+IcRa2r+nLTCLMyHFd+6P+GS7aZ3Dj1/ZdS+hl4lKi2WrrqHD5TjLB?=
 =?us-ascii?Q?aIFs50j5nvdRfTO9cturKXHr8TyU6MNRaj2brb8OD9a8tDTgyJwlrrDHCzr1?=
 =?us-ascii?Q?Zm6ioJYzA+8cbva2gfj59wARE4vSkSdbvvPn5KHzku+NSNzsd6E0FWBawtg4?=
 =?us-ascii?Q?Q/vr5KGEJsHWAe7Y26uawbnlIe9dC3+SHLNGM+PK1FWISs+FAIqFc7osqi3Z?=
 =?us-ascii?Q?f2E0Gi0Yb+WLG+ibgdCa+swZhXfaDdd5wtwlxnb3ShEBSTGY0w2BY+7wOnTz?=
 =?us-ascii?Q?2nuYK74ioOcxGq1aZDu2V2Q5NyVwi1M0UjK2HXAKqi+ZF9La5Ax7TGCSyQd4?=
 =?us-ascii?Q?HhNrhQXxLxvpMGuBl29Cf3uFFyi8tGnvPtwS8cuPxIa0d8yOZUFq3Pz2nkpV?=
 =?us-ascii?Q?lfpC44VKycyIeKxsgQ8HEyP3txW5fp+qLT7T55O7QuuW+DCQ7TS7Okey6kSd?=
 =?us-ascii?Q?3QjPmQyM01n2mSkEEOqgkBh4a/Ci5KVeT3R+cOQ9Rybijfh3LMuKkc1T1NJv?=
 =?us-ascii?Q?KozrneFaiWZoos8SRgRzeI8uEv0XThwnk3HSpws2l6Lp2w5eE4Qawz3yHCMh?=
 =?us-ascii?Q?OJfMDkm7LTAu9F3KiVZ+rpok4+zZ4pAtKSmUhsBNPi8UGGxzH1sPFyFMan0a?=
 =?us-ascii?Q?+OU1khydH/PMcXzA4Dz+avJgPaRz0PADMZwujC0v3C2J6MVKKIcm9ve5FRIl?=
 =?us-ascii?Q?2Zu3aNasi1L8DYa2LX8xON8t/h2nf9Xkgq5Da+Zyqd2Jk0VIfhgV7sirG/UA?=
 =?us-ascii?Q?uCysGDGGbNIjqW7IdLzPl6EVCxhPw2nDsVADyUd2FcqTHH/pJtVh++RlOp/I?=
 =?us-ascii?Q?RWQqxpDLNzJPI3oJwMGPY9yvuKvEjBvxYng/FpDbbu2SSLAlhpRX0khaOvPQ?=
 =?us-ascii?Q?I6gmMMlRI4OFhJG9OCVaOa8xqMPl6QJ/R3KQbeCZsMkZ9HddGdEIzUclEllQ?=
 =?us-ascii?Q?pqs2ZvbX/Uasrn+UA8G+rVIvpnPLRBYqstdxe4OVIFHzwDg0U4XjSgfCutZM?=
 =?us-ascii?Q?M7Qh6nWSvTkWaoBZskgfZbxepvHnXtJMxxn6Q/sYYtIxptjtE4iJwxfjD0jA?=
 =?us-ascii?Q?lCWVmX6S9ySAmXXVkZmRayJkeFtjP2x6lHXTw+3fLp70Tp5zGAcbK9tDvvv1?=
 =?us-ascii?Q?kA+R5MxEqgX44aIf/8VJ0Mxx+S4/5JI5KylAeMqha+kFLAeXeKPKHZJlCGH6?=
 =?us-ascii?Q?rIm6KD3+Y+rh/YvMxR8gTXhVjuv2lTy1kw+JWd5+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9964b7d-07cf-4896-e66b-08de1037a4e8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:20:31.8934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZw9sf15Lqq0DM7hdxwERPjzC2NMIAG23OiyrmVu+2+QR5mcacUCOplHUnDTrJgWIdbjQAkAKi9hcl87u/M7xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8231
X-OriginatorOrg: intel.com

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18-rc2 next-20251020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/modpost-drop-_probe-from-section-check-whitelist/20251020-171732
base:   linus/master
patch link:    https://lore.kernel.org/r/20251020091613.22562-1-johan%40kernel.org
patch subject: [PATCH] modpost: drop '*_probe' from section check whitelist
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-buildonly-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510202339.CiYSDt6j-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510202339.CiYSDt6j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510202339.CiYSDt6j-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: nxp_stm_probe+0x0 (section: .data) -> nxp_stm_timer_probe (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


