Return-Path: <linux-kbuild+bounces-8613-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5144B3566B
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 10:09:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A85C5189BF25
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 08:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C065277C8B;
	Tue, 26 Aug 2025 08:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NltKOG3T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBA62820DC;
	Tue, 26 Aug 2025 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756195745; cv=fail; b=pVpmRN9jjehpEqDAwPItzXGe+dN8BJ8KXndefkGbdVCfNczWXJZMPu1iOeg3Uo+ocIqhgQupATepIf4CkhbPEvSO8Zki1Um/XATbFbedSvi4ye3lhdPDv//c34NzftLpXX5ehdlrtPrZkQOeIv9+qXLdg6tFCTGurqITNyNuov0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756195745; c=relaxed/simple;
	bh=lO5lpWjBKYXVsro/PKMk4bAEOupuNz2u87rGW28cxvw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VtEkOMbAIq8Pom8P07f6PZHAUa3uKbUVHmlPNtqAchqvmz4r5QRBRguZfg+KltbphM751TT+gtD2+LKJwuvlqrxiklEbe4urW4HshkYWXfSXEUWa0MP8q3n3sJ1YJEL/3psjB/cSYDLy9e7JBmNm1fOotjod5enUyV2a2XQgJ0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NltKOG3T; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756195743; x=1787731743;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lO5lpWjBKYXVsro/PKMk4bAEOupuNz2u87rGW28cxvw=;
  b=NltKOG3Tt6rRT4R1joM/2/grcI1fFwuoBYn51hBYKRxIJdynkGVLmmU7
   eqQjHr/CMs9xaVjVQk7KkVo1DK3FIfwDdRRx27TLzB9wuWNr4aTwFq3lS
   CsF4LFWTEegmtSatpAYb19uPzf7S5hf/czHD+jO52keXaRV77kK7BGEWF
   PMfBsiBytj+qNBkxgh4d3oR6Y/51H3bDnUeuZKtaTUftnu+E3t1JJhisG
   j2WTKh+QeLLtfgaTS6oshWwh20da7U+ypipQInRpe4TuS3A1tn4tDb3M9
   XKmvvL+7RC8nhzIB7lrLZH6UCHIz8Nu2ZjUXyZtFZTeQMk8KuxDBFKFiV
   w==;
X-CSE-ConnectionGUID: kk39COY8RKCFb0lrACDMnQ==
X-CSE-MsgGUID: gbQv1NsPQfqZAE1Sh048Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="57622500"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57622500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 01:09:02 -0700
X-CSE-ConnectionGUID: tE+tbY1sTmGJCmXWHuv9Mg==
X-CSE-MsgGUID: YtuUBoX1TeCuKnYL9x0DQw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 01:09:01 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 01:09:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 01:09:01 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.63)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 01:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwLShSAwdYdnIhVsAsot3NV923qztYPOp2O9WZFmBHZIu6O4UmccUFu279D2JEnSt9GdDtMJswjFf7VW5q6y2ewQd2akSjui+rS4OABMMeJl0+8Isg7evQNqbHLPgSnGpqG+FekPSpkfezJu9za28BvVkQjAyb2byErt1wHYHgkNTFAoPzsHJn4hakmFx0RNDpUiPFhBLt/3QAl2y5pC/XfHEz7pQZywltlddK64CdsOY1PVr4JZCz4ZrqdGklMvxFSaPpknDovbWSzTnDJxBeVak1phEjarT60lYkD31X/iyDLcZwgr8noJu3Yasc9+AIHNC9wep7fnb0Y+9L1EFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXAztG1pfak7phDmkZ3uVz9FzMCHfT06yZB6sMShAP8=;
 b=QMxe3cyUuseDK80nexzRYOR1ak4T7Snv7J/Fltsb82UO5Yb+z07SJBbfDbX+ilSEWlLZHtefVjIbfKKR4tdXOx4LZijkznbg7BsZiyYeRPDboTflBnHmDIq1+kqVX4NQIMTHZLhJaZLkQJfMQcUIa5g0AhRl1i84tSV/fOPY4jEI33fPq7N+0ALb2ZjJbivat1yEdxhZBxbDOChjO8tsdjsm4Ff+FdIj5b/uEj8XJ891Qj18Sr+0sy5/+3Y15Me0LEDPczyDV2jyAgzZWhqa1Tk7ARKE1QP5hpPyMydl4UIvyS+pBifCtHCEqS7aCXNjSc/muxw1WFAU1mvF3gs3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 08:08:56 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 08:08:56 +0000
Date: Tue, 26 Aug 2025 10:08:17 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: <sohil.mehta@intel.com>, <baohua@kernel.org>, <david@redhat.com>,
	<kbingham@kernel.org>, <weixugc@google.com>, <Liam.Howlett@oracle.com>,
	<alexandre.chartre@oracle.com>, <kas@kernel.org>, <mark.rutland@arm.com>,
	<trintaeoitogc@gmail.com>, <axelrasmussen@google.com>, <yuanchu@google.com>,
	<joey.gouly@arm.com>, <samitolvanen@google.com>, <joel.granados@kernel.org>,
	<graf@amazon.com>, <vincenzo.frascino@arm.com>, <kees@kernel.org>,
	<ardb@kernel.org>, <thiago.bauermann@linaro.org>, <glider@google.com>,
	<thuth@redhat.com>, <kuan-ying.lee@canonical.com>,
	<pasha.tatashin@soleen.com>, <nick.desaulniers+lkml@gmail.com>,
	<vbabka@suse.cz>, <kaleshsingh@google.com>, <justinstitt@google.com>,
	<catalin.marinas@arm.com>, <alexander.shishkin@linux.intel.com>,
	<samuel.holland@sifive.com>, <dave.hansen@linux.intel.com>, <corbet@lwn.net>,
	<xin@zytor.com>, <dvyukov@google.com>, <tglx@linutronix.de>,
	<scott@os.amperecomputing.com>, <jason.andryuk@amd.com>, <morbo@google.com>,
	<nathan@kernel.org>, <lorenzo.stoakes@oracle.com>, <mingo@redhat.com>,
	<brgerst@gmail.com>, <kristina.martsenko@arm.com>, <bigeasy@linutronix.de>,
	<luto@kernel.org>, <jgross@suse.com>, <jpoimboe@kernel.org>,
	<urezki@gmail.com>, <mhocko@suse.com>, <ada.coupriediaz@arm.com>,
	<hpa@zytor.com>, <leitao@debian.org>, <peterz@infradead.org>,
	<wangkefeng.wang@huawei.com>, <surenb@google.com>, <ziy@nvidia.com>,
	<smostafa@google.com>, <ryabinin.a.a@gmail.com>, <ubizjak@gmail.com>,
	<jbohac@suse.cz>, <broonie@kernel.org>, <akpm@linux-foundation.org>,
	<guoweikang.kernel@gmail.com>, <rppt@kernel.org>, <pcc@google.com>,
	<jan.kiszka@siemens.com>, <nicolas.schier@linux.dev>, <will@kernel.org>,
	<andreyknvl@gmail.com>, <jhubbard@nvidia.com>, <bp@alien8.de>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <linux-mm@kvack.org>,
	<llvm@lists.linux.dev>, <linux-kbuild@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
Message-ID: <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
 <c68330de-c076-45be-beac-147286f2b628@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c68330de-c076-45be-beac-147286f2b628@intel.com>
X-ClientProxiedBy: DU2PR04CA0246.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::11) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: fb78fb8a-92b2-4b79-319f-08dde477cdf1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Yhy+t+NKimrjMgXSPwdL1SWd+yVea1M7LcwQVgv22EKqX/k9h2Vvs1+ybE?=
 =?iso-8859-1?Q?uvrNe57gnhJ4cDmRswqhIyzSPjzKlRAm6AVHTeGwvd5wed238QXoCA2PFL?=
 =?iso-8859-1?Q?YA441gciBRhfj4iGbG9HnN85wp41gIUUngBNw+KKZNjG2dLpg4SyYFhHF/?=
 =?iso-8859-1?Q?BOz79JMY23bFCfuCwLElMLwXcejk7YQIHBgXXRSevZr47O8cGd1yj80Dv7?=
 =?iso-8859-1?Q?3wUCrFi55P/Bt32SmlRLidimxqwUrzoVaf+/mVHteuOqfTXkcszY0/bwzm?=
 =?iso-8859-1?Q?O9RYQ4L4fLACLhMCi4Z98/ALVQatRFN1XJyE+ieNYLOd219k1pOzW4GIkf?=
 =?iso-8859-1?Q?SdJ2W2/O/KyriRXV4/LTW6qu5fqjtDaYAVzVt/HFrFfJ4nTuYfpycrSUbI?=
 =?iso-8859-1?Q?LD1tdWUIBaMnw4lxuqqNixvIQbjjYpqoJdrqdIQewPd+a2RMWhuhjVbeYM?=
 =?iso-8859-1?Q?KzqNZh8om0KpvtOUpg7ucJftKQNR6IE9siGtxsLgxOX879t/B6PdJ+YTNr?=
 =?iso-8859-1?Q?t1b0sQdti8cOtieRffm++1sKTboDt+hk6S5j2xpBTRJCQs2O/BVwfkX77x?=
 =?iso-8859-1?Q?72r2rjt964N6/m+4mRQCEPo4Hq0u7mlJVM5iSulJPW+4tW7X1vOVJJiC9I?=
 =?iso-8859-1?Q?Onfb5WjUSsGxaU/FQEd8AvI5Oot4pUw4pjElK0YKFxl8w+82GZMMUUlDAQ?=
 =?iso-8859-1?Q?aixwY8O+b/xTY/1WtJQ381OslsiImm4NBKis4oPfaaVzO0hW5XjmH9tbrg?=
 =?iso-8859-1?Q?DU8LbbYBDEdrDgXSuSzBmxuxBqKZAGuOQjLYsUD0oNeyJGWBs6HgfNKYa9?=
 =?iso-8859-1?Q?Tc/ZsRWrOxfmte91gCmZh0PNwhqwN05+fPOkKPFBKdEm2WFl4kjPKMwuAq?=
 =?iso-8859-1?Q?HdvL8ZW+t5Wsroo+GXdu3ST9Er1WpawVKb9c4IKs60kJfJ6wddTIQYwINg?=
 =?iso-8859-1?Q?jdAfQfhbSAHi58sXVqbXGgeOtHRVpdP7UF8Fn6e9zaZNxnP7Oiz7asYagw?=
 =?iso-8859-1?Q?mPk9W1zMtGx8nhO1PZv0a4plND6kw3lNK5vhmyUaHK8VOlTajMTwPKxtEK?=
 =?iso-8859-1?Q?eFu0cu4lUoSG9yCztA7YJ6Yo/QJ3xDHh4ajIjmCe7zEBhNnzlCbtEqiUwK?=
 =?iso-8859-1?Q?5tuePgJ1IPb0zOcSrvR+K5tzRed38qMUbBukrM8g77UHqvgbcNfbLRftYX?=
 =?iso-8859-1?Q?PQjRBt047BJ/2Idi+v1/lhxtwDXHFYRgwT8BkoSv9H2ZCu10ZnL3R5PjCm?=
 =?iso-8859-1?Q?+gCM7ZczKdbK7udwfLLMpa37Hf2XrghJqSQUJnLGqwHgWFNcqfbn4UMplw?=
 =?iso-8859-1?Q?xrnTVswVeXYhsM9wtHNAfRlAIAK1RwuPFOdiOYHQ3EX9gQIvrf/IoFgfmv?=
 =?iso-8859-1?Q?et5yEikPVJ17Kfzi/1jgiQyQZkcTdgx93Vlg5MkM1Zggm6fAzGLWul9K/R?=
 =?iso-8859-1?Q?x3MeGIniBnzkWTbs8wxeyW8EGr8MADEudqqnIA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UETUxd56y5zgBEZDV0psvtQHQs8cC/p+8kGGsCYLq7Y5w3u8pU2GvLkRa5?=
 =?iso-8859-1?Q?WbU0Oc2yDw7qErqavuI1bgLkzJe3K8LP0zUy2gCkGngNIcrLxQtXksXp0F?=
 =?iso-8859-1?Q?0W/+UBN64AMQMxKP1Qn+E4fSoreXaLKkfHCxozJEJuc+BBhp00f+4yQprb?=
 =?iso-8859-1?Q?yEf/dKKgv0xujoprmW30ixMe9xQ4n7FWvUvmod4oPRNe/fQD5uUlfdHDXQ?=
 =?iso-8859-1?Q?L3/5zgtBmS4w3C+/C9pNefPscfAdh0UC7iy2keoG2bsHIm/4BJTar7eOot?=
 =?iso-8859-1?Q?HkUG0M6vsv0iB5PWx0F4ndkWKzB+AT/CGBj4zKYG5uoSkV2OPIoAIBJcDH?=
 =?iso-8859-1?Q?rbT8mRXV6RHUy+7yUYDRxVKzminlqdJ6lbbZ5GnzfUA1ye/NQAc7VJiqnv?=
 =?iso-8859-1?Q?JMBPO7dowYSFMoM/P8y+wdrOtoi+K/b4RISg0cjfZDXiruF0HfEAXGDVlM?=
 =?iso-8859-1?Q?AezlZvKCxm6o4RgFkyc+jlXegWX+2kk9X0FYUaC8CKPQJCMSlpMk8sYF3c?=
 =?iso-8859-1?Q?++mvDHfsdCYa/c1oN4YbIlAWrOQvRgKhR0dKm3Mcrri7pRYtzLf0nAFH/D?=
 =?iso-8859-1?Q?RpBh43Igij9LY/LgNwlPxcSOU8/9UvPqDfDLAZ8by6oCLuVIwIQe76FyHW?=
 =?iso-8859-1?Q?BiHX3C+kdG3phPeyHIrJ/8mO4h9XaYtwgRsF4TvNpHUsXXt7PfvKZA0Ziq?=
 =?iso-8859-1?Q?2N9RBkisgBTLZVBpPPsTfRwhQfl6HNPue3Icz72GxHky+HkcXnD5TFa8TM?=
 =?iso-8859-1?Q?zdxCaty8aRMbJF9BnQ8aojLkm29HqcXC2zo1AlmI/l5aiC9BJnMKuZjtc7?=
 =?iso-8859-1?Q?7Q3/ra3G6urfeOOZ/9D6tj1NMxF3Du5CBkEp5OpkMbPx1Jz7jcSnjV4cdb?=
 =?iso-8859-1?Q?clt9g93OrKj56dRkemMI5881UWlz0k4UDp8ncvzy1G3SfXQPpBtBJ/3zcA?=
 =?iso-8859-1?Q?cjTaa4RkfaT4UasCjjcLH7OGVkE1RNmOsDdDZ/s+yowahOE3+JzRp4ymKK?=
 =?iso-8859-1?Q?1RgX+hKglQwjLENK0rNNn/KyEC/Vl8S4oppBdvedMdLVNaRnaX9Y8Eu2ZM?=
 =?iso-8859-1?Q?xkFM4yWEj/uOdWBq4C/vNOfjwVW2uyb5PadMg9rod4lQDFZt4GjgZKiUnA?=
 =?iso-8859-1?Q?YzmVJgn4efaZKD/gErwhsE4iO9+8eCvzJO5patFvRPRRVf3UV35uRllVuM?=
 =?iso-8859-1?Q?oivYPprg+FgoutD2hvAa1z5ornn7a3AeCwiHW8Zl0Ol2YwHkZZa15JYFEH?=
 =?iso-8859-1?Q?q98q6O8MdJAD8Dof7mj3cFhQvpMZKysFo5sB0rnmj7uXd86rToaXTmGSX4?=
 =?iso-8859-1?Q?l8N15bugcFMhNJ9DrDrCIOjFaQqIBbrYu9ylig1SWmoetKc76ylLYr42xo?=
 =?iso-8859-1?Q?n4SaEH/KsPeqMe1KzGycNYQlMTvC+t31qgNmM6nwZVgkZw2uhTkdmr4q/u?=
 =?iso-8859-1?Q?zvCvLsWXBHPual3XEnqH3MzwJXctOkaNqDj21lUiGfafpbzthyF3wUJ8or?=
 =?iso-8859-1?Q?zO6WM5eMzT6S4mCUILeMgL//6F2oebJA5UQotnSckoQauEX67JcngEQgXX?=
 =?iso-8859-1?Q?6GXMNugPxQYWtkVoIarRzgsPVzOMfDjZhKshPAVHV+Fna4rLjI/Uz3pCTx?=
 =?iso-8859-1?Q?imq7Zwj4lPh+EAC87I8WlV+2RjZshP3tyuQkC12dx08+X5IcuCvsd9gVxo?=
 =?iso-8859-1?Q?BuOTQbxyb3UPiMXI82I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb78fb8a-92b2-4b79-319f-08dde477cdf1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:08:56.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsbR1631Oh+jOi13LRqR8gMDmyTI7WBthML40+quydiUbywwPEyeAURAVORes/vpmlylUWWXbtgYI5E7CzhJ0wRvX2f5/uGX2LWh6vBNr5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
X-OriginatorOrg: intel.com

On 2025-08-25 at 14:36:35 -0700, Dave Hansen wrote:
>On 8/25/25 13:24, Maciej Wieczor-Retman wrote:
>> +/*
>> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
>> + */
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>> +{
>> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
>> +}
>> +#else
>>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>  {
>>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>>  }
>> +#endif
>
>This is the kind of thing that's bound to break. Could we distill it
>down to something simpler, perhaps?
>
>In the end, the canonical enforcement mask is the thing that's changing.
>So perhaps it should be all common code except for the mask definition:
>
>#ifdef CONFIG_KASAN_SW_TAGS
>#define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits-1))
>#else
>#define CANONICAL_MASK(vaddr_bits) GENMASK_UL(63, vaddr_bits)
>#endif
>
>(modulo off-by-one bugs ;)
>
>Then the canonical check itself becomes something like:
>
>	unsigned long cmask = CANONICAL_MASK(vaddr_bits);
>	return (vaddr & mask) == mask;
>
>That, to me, is the most straightforward way to do it.

Thanks, I'll try something like this. I will also have to investigate what
Samuel brought up that KVM possibly wants to pass user addresses to this
function as well.

>
>I don't see it addressed in the cover letter, but what happens when a
>CONFIG_KASAN_SW_TAGS=y kernel is booted on non-LAM hardware?

That's a good point, I need to add it to the cover letter. On non-LAM hardware
the kernel just doesn't boot. Disabling KASAN in runtime on unsupported hardware
isn't that difficult in outline mode, but I'm not sure it can work in inline
mode (where checks into shadow memory are just pasted into code by the
compiler).

Since for now there is no compiler support for the inline mode anyway, I'll try to
disable KASAN on non-LAM hardware in runtime.

-- 
Kind regards
Maciej Wieczór-Retman

