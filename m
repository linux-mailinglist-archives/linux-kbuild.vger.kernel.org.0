Return-Path: <linux-kbuild+bounces-8764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB40B48A77
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 12:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349A23C57A5
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 10:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D442F9991;
	Mon,  8 Sep 2025 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZxauAJG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A274211499;
	Mon,  8 Sep 2025 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757328236; cv=fail; b=NabyEwEWUgi93Dl7ZWvaAuJZWzBvt68F7ltLPFSAj1oK6grwLBdeJ2TQT2Xx5MD+x4igenh52JZ9b5uWFWY9pnnwv9Kh5GqviiYxIknc9mBLCIDYQLEj7Eu6XBQZH5c1KU1f5JIF6FaAsTIr2ou0YPdLMJHWVZniliAZwoqoAOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757328236; c=relaxed/simple;
	bh=Qr9LjMjAMgh+P+/phPwGo8HVP4rHmAw7fWDcZ5PQdXk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gaDhUfbC7FNQk7SzFcLfq2m/96jsNWlKucKN+QBD4qHDRLOsxTpUjpHSOjlh3Zqmli2otjV3k5z/6k+UsJ4V3//9JedQZHpCJiEbEa3X17BYVbrL7IiOtC5XakJqwkA7jT0JrN8X+s/lCc/Kw+XLF9f7hSbHpjoMIHrMbqx95k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZxauAJG; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757328235; x=1788864235;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Qr9LjMjAMgh+P+/phPwGo8HVP4rHmAw7fWDcZ5PQdXk=;
  b=KZxauAJG24oo+WDsowYqjAPWnLmWLE0YNO3kqEe8hukL+P3yui5EZnw9
   u1nZZ+UWjifO2KlzpoSQBGei3r1qPUQavD6syh82DitQOZynxiaFbBRQ2
   jNWLG308K/Agx4F7BjntyYdzbPOe8iS1GdtDI3mah4khBcSMmiWA5g4j1
   a7dQ6KqNmRAhwnqfDIu8k4DsWMLNbm85SDhLx9nnk4fh888QtUFLADccb
   M7yOxXQV9GsVLcpbGeXMZU5n6Pkn8WrFoUuL+pcHTbj4CSiL7rAu8BxvJ
   iHGmJ6Lf4CNGC/P+8Tdt6Bp8efG+B+dth2yMXjggNWyAd2HC5Ms0YAL1U
   A==;
X-CSE-ConnectionGUID: LfLGTorlQs2dxc1iW713jQ==
X-CSE-MsgGUID: R+IxCJppTVuE4s5+j8vX0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63408538"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63408538"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:43:54 -0700
X-CSE-ConnectionGUID: x4IWr07FSCeJJCccMe+Yxg==
X-CSE-MsgGUID: +3cpMTneSFi+TuhhcihYng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="173120243"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 03:43:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 03:43:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 03:43:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.83) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 03:43:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjQZKqHL9CuBO8Omqebbn78d58+hvNGyEO3HKzesJ8nP4uBkZiEIl36KWbND68oLI4tpavl11nHBnzQKo+j2A1EW4l7KHzk/YQPWaTesJ3+a4l9OG/y0hp0LfjbnS5JBtlruFHo9vKcPaKXNuQNqF4638hquWJktLJKzlD4CPG3yABBIX3qTKXJbM977mRcw99wrVQgKPzwcpkQ3VJ8hsG8aPMbkqooFqwkrjfybwLURM/0TCA18zpfy9Mc0awPminXUXvSOP/RAXaNJH+YkVJMuDitEfTXoLMW9G6lsMqhv0ckcqjMvogylpC5gJwjYxPRUYyiUlld9LqJohSOdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukCHEWV+nF3IKYMgKGgJX0f25AeGcGOru1biajbzXJo=;
 b=c3I4bTy2xqgx+KfYMmpNEnINC1NEy5W54Y8diOSvD2qIPNQZWOphXy+B17Rk9+MMvAldQjEaR9GFIWV1EWWJdhpww4vNFWF2FEbwa8HsJolG6vmizy93LAgmW5YS2CsXK7IfSKiDUl3wOLhusnS3HX0EJgmKRV4z2+Vt/QgK5gnuoYknM/8gFYjucOszcpr0/pkbiGK4uSeAFHNPiyPn18mI5VH9ciBMHNSvg98+t3MgMrxiTvhBIfNKqNf944Yj8sqkeJC7QiwY+VQVPrjFniODQU+vsK+QG6Y8f4PjlcOVElvo0PKCmZErq3Fi5B3SYvf2tL4BocRW1Z4OkOQsJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SJ5PPF035FE4CB7.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::805) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 10:43:50 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 10:43:50 +0000
Date: Mon, 8 Sep 2025 12:38:57 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
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
	<jhubbard@nvidia.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mm@kvack.org>, <llvm@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
Message-ID: <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::20) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SJ5PPF035FE4CB7:EE_
X-MS-Office365-Filtering-Correlation-Id: 93340e04-db99-4ca9-b959-08ddeec498a4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmpvSktiS2RTQ0w4QWxxRkRQVnBlbHJCUGQ0N0JWUFdCczNnbUhPSjd3QnM4?=
 =?utf-8?B?ajhLQTBjcUFadlJZQUVWa29yNVdsdGdPQnRFUENFTTN6cWZRcHR6R2V6NENF?=
 =?utf-8?B?aHZBUkx3ZDJvSVAvc3VYU1gzUENad0hXZ3JDUjhlSGZwZVVCZVNIOFV6SjhI?=
 =?utf-8?B?RTZweG9RVTBQTWw4M2JiSGhZVC9YRkVxb0tsWm5LTDJ3ZStxc2o5NitGWUFE?=
 =?utf-8?B?dkQxRGVyNEhjZ0h2NEEzUVh3NWlGZ0wzdjFVZU9jUFpXM1REQjBmcVNEMjQ0?=
 =?utf-8?B?Rk9XaGkwdDgwb2E4NzdETnp5NW5mUmVGcitMVkxqbEN0OTVuMGp2NzVhVENQ?=
 =?utf-8?B?RHdLVWxidFRINHRvQVE1cVhabjFzYjdlZTd4NnJtVytPS0dkaDl0bE9YWmVo?=
 =?utf-8?B?VGdUUHFKUE16RmZNN3FwWXE1RGJocDVsNFRmb1FQeFpYVld0cVRmSUE1QkNY?=
 =?utf-8?B?NFoyZWQrWW1iWU1VNXRiMUpkcDdDZmI4RUhqQ0YwYTkwdGtYd3BMWEdIQkc1?=
 =?utf-8?B?SHA5ZGRNTFZVWEFzbCsyb1UxQTF6TnJGd2VLRXN3NW5xQi9jSE1IVHBqTlZk?=
 =?utf-8?B?elB1UTBXekxRNGUxTy9EaVBmVDBKaDhaZTVhdkxKTnkvclJrZEY3QUpzcGhh?=
 =?utf-8?B?VTlXWFFVZWdxOGd3NlNYaSthZ2p2RGJpdGZ0ZDJyMEVMSG5Tdm5VOXRXNW9C?=
 =?utf-8?B?QXkwWXJPeXpCV25Ed2YrR0Z4em5hR21rQ0dZbEdjSjJxL2lKcmhuZEMzcE4x?=
 =?utf-8?B?dUZMT1ZvMWJJQmhnWTB2M04zbDUvNWJQZGl6b1lXZlAvWXI2YXpoeU03MHBO?=
 =?utf-8?B?cG1rTDdneUx2UEF3VWF4U3BoZzhST0FldG9RWlZoUUJzdXlTZklPVXc3VXlu?=
 =?utf-8?B?eEVrcUdsMCttWnh4bDNIS0VJQ0FVNzd2ak1jTzV1OVVhUFNaMFlTM1hmM0la?=
 =?utf-8?B?Zm1SdnluWk9CRlphSXhlU2dCa1g0allvckRMNjRVYjdyaVR1L1dNc2RJTzhI?=
 =?utf-8?B?dzFjaEh2UnF3Q3M2c2pNb1A4ZVRzMFZWSEJRaGNmNlJpTEFjMGhNS0lBb21R?=
 =?utf-8?B?VGRpRDdEcGhPMmkyQnJ2WkVhYVJEZXI2eVE1UE5YbGdwYU52Y2ZOZVFLSWto?=
 =?utf-8?B?cDBVc3BCbkR1YmxpSlhoeHZnYVl6ZVduOHVNQVZrdmNVTUZHTmVDQitYajF5?=
 =?utf-8?B?ck9MSW0vSnN3Z2hEV3JBWktzWVlZdXZnRTI2ZHlYNkJvK3JvQmlJbXlhcVlD?=
 =?utf-8?B?ZDFTak9TNWxGWXhQK2NYNDRsR2xxVW0vUGo0ZzY5ODBXSm9UUFdZSk9aUnRu?=
 =?utf-8?B?MFgwYjhjME5lTnVETXNkRW5hZjJKZFpBWVN3elI2aUtBWWJweDhkRVpyQkdj?=
 =?utf-8?B?R1J6NE5Pa0pzaWttRjBKaCtwMEVTY2c0c2kvQVpaWXBBMjZrT21WeXd5MGtH?=
 =?utf-8?B?SFBQRmVrZVd2YXBVQ0VMbWEzMmJUV3NKUGhSTklEOTExZ3lVYjlCd1FHV3F6?=
 =?utf-8?B?UGRKeXhFTjQ2M2g0U1dvZ0d4blN5RXR4VHRwUEpDZU1zNys1blZ2NkJyZGRO?=
 =?utf-8?B?RFBmSjlhUWVyemdtS3J6ckhDWURqVnhPZHhvU2t5bU1ubTExVkNXcDB2VjdI?=
 =?utf-8?B?d3hzaDcvem1XTm5XK0pzMVB4a2ZhenVVelRSa0tXS3RaUlArWlEwNWJHVjVm?=
 =?utf-8?B?YnMwT3dsZ0hSU0lselgvRDVtSnAvYWNqSDU4aTNQVDJLUWJ3Z0NwNVNuS0F1?=
 =?utf-8?B?Y0JBWURSTDZzQUFaSzUwRDdWb2k4VnlTV1JFc0xqUTNQLzRiTnFXbDU3VlB2?=
 =?utf-8?Q?JmXQs5asPFhgeQBlSL3JbtMDvBAcaJPKLfK2E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBKbEpzWnk0cDBVR21IQ2pGMTdMOUhQdVcxdGNrU2RnRWorYjFFcUFEVXdN?=
 =?utf-8?B?THlmWFZJZUVHOUI3TUk3RDgvbk5NOWlMK1RZUVR0TmU0REtIdkltN2owK1lH?=
 =?utf-8?B?M2hpR0ZSTXQ3Nm5TSDRodi9ZQXMzN2t6S0lPVlI3L1doOXp1b2lGVXpwVUdR?=
 =?utf-8?B?cVNRSUhzRUJ6bTgweHpuSmkxOUcrck5JY3FwSllPUEo2OXdraC9naWpJZy9p?=
 =?utf-8?B?M0JEenVkOUxlcFkvSmUvZklLR3B6eVAwVU9HVEtzMHNSMlZ4QlZxeGxQUXgz?=
 =?utf-8?B?R011UFhjUGxjYzIxcEF1MjN3UENJTnYyYTQxdUdkUzkwUUQ4WFZaRFo2b04x?=
 =?utf-8?B?eHVNWHlySmt1TmR3Vm9KcVdlWXM1Qk1WNUxkQmQvTkc4NitqT2Q5TzZjK0tv?=
 =?utf-8?B?OGQvRjdsWi9aZ2h6cW85TmZnYnFqUUxvMTFGZnN5NnY3N2NlZUZMUWQyMmFT?=
 =?utf-8?B?SC9DWFpmbS9TdVdJcWRIajZIUWxyb2JWekI5VVMrTXZXclhLSGRVa1cyREJm?=
 =?utf-8?B?WkJvbmFXTE9KQjlkclF1VC8ya0t2aUx0eW91Y01oWDFzNzFtS2pLdkEzZDgy?=
 =?utf-8?B?V3ZIL3NBZFpkNW0rdUdsUXVpMzdqdjY3NjQxbGFFT2NrRGlMai90dVYweXBF?=
 =?utf-8?B?SGsza3l6SmVDL1cwcS9kL2ZZVHZ6S1FWbnNDbXM4U1FNYkdaVGhrWktBd2xw?=
 =?utf-8?B?SVFneEk3dmptbFAxZlYvUEdienNyQ2N0RmdGK3FZZkdhM29aMjliVEVnV3lH?=
 =?utf-8?B?RVd3bVRnV3duZDVuSEpvUEhlY0MvRTBxY2ROandmSjZVemRvMW51OHI1cDZk?=
 =?utf-8?B?ZmU4bGM3SldUbklscTg4NElLS1ZQYmlTVFJjVUl0L1VGYkRmZ25QTHhkaTBr?=
 =?utf-8?B?SmczYkl1MCtpaG1tL2NhQkxWNUhQd0s2UnkxY3ByN2Z2OTJucGN3VFJ2UWJn?=
 =?utf-8?B?NkpkUGZ3OXAwRmhaZXI1dXRoc3lhbWRKQVQwakhVL0tOK1kzTFhNaklMaEZ0?=
 =?utf-8?B?L09aTjI3MlVSV3p2a25YV2FoUnpwajRPU08rNUxFN1FMY0ZSV0tQSXpMb1Rl?=
 =?utf-8?B?L2FpTEM5bGg5UitqYlpxTFZjUXN6d0YralVKNUEvKzMyQ1c3YktGZmIyMDV0?=
 =?utf-8?B?Q1BRY2FtaDltWUpSb0JRTU02ZjRucVRNMU5aL0tuVFUrMi8rTkQvRURxeksv?=
 =?utf-8?B?NGxsTk0vNkpEQ2NZa1NYMGZmbG9Fd0hqTzZ1dGJBeVZrelJGSjl0QVR1d0tp?=
 =?utf-8?B?RjNpWldnbndkL3FjcWk5Um9oZWp4Y00zK2hLM3krL09rTGltNmFSMVBmYmRl?=
 =?utf-8?B?cnVmOTcxOVlDM0hyWUppZGJ4VlhKMmwrSnhpY1g2NUJGbG5qNTgyOWlmYTZM?=
 =?utf-8?B?MjBieTNtNjkzODVMV3NlaTR4a3NEdGlkcGx0K0RHVGVzU2svakYyOFlTbzdz?=
 =?utf-8?B?bk0yTGVXUk9uTGlVZEtQeTl3a1U0ZHk3aldSZlJsZUVLR1J0VzQ1TWVFbENi?=
 =?utf-8?B?NFFqS0NweXdIeS9SamxHZ3o4ZlIwY3FLU054TldwNnZ6S21PdnB1cEFqaUty?=
 =?utf-8?B?aUwwNll6ckdHV3lvdTF0Y0RZYnROTG55SWZqckg2KzFKMnowRnJvZElXWFpQ?=
 =?utf-8?B?Mit1dzJPQnk4Y2MzOXdMLzZDaGVVcVJnVVZ6NHdKbWJodEdrUVNWT0I5aXor?=
 =?utf-8?B?ZUxOWGpZWm9KTzdmdmpDTmZoZENmdzdCeE45UEJXdDZqSnZJVmJ1R3BoQWdj?=
 =?utf-8?B?Mjh5MStFaWVHdHZWNk9HaEF0a0huaDZGYjhmcWlUeW9aSUtMOE1tazZHdjV0?=
 =?utf-8?B?MlVkcXIvdEhHV1pqSUR2dmJ4RnB0bE5yK25rZ0E0UWYrMWtUeVZoY2xFcnNv?=
 =?utf-8?B?c21FY2VhTERGaDBuRk5sK3NoUlRjNzhENVN1ampwblhjRmMrbitZOWx3cXND?=
 =?utf-8?B?Z0QrbTFaYSt2c2gwaHJwUk1BaFFiSytKc0NRbmgxaTNManUwbXdhL0NKQWFn?=
 =?utf-8?B?NHBwWHpSdXNORXlDTVU5MDVaWXBJWXFyYlJsR3BzTUlMS3BxZ213Wm85Wm1U?=
 =?utf-8?B?MG1GMTlFRlpoNGFZQUh3OC9EZ2FMR1gxUWdKd2FMSmp4WW52M3lUSDhTTXNx?=
 =?utf-8?B?elVjRUdPN2pycVRrVUtNcCt2Z2hiK1NWcTRqSFYwZ3dObGliTi9YNmZIaWp0?=
 =?utf-8?Q?yd9mmuZkhvAP4XUoKi4DkRY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93340e04-db99-4ca9-b959-08ddeec498a4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 10:43:50.0485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9cTDkTAA5L6GyRW58lfREpKHBsmgNie33/CvPUwZT7hmuVJbWjlLsdSm4HewB7eN9g9iOetJPASSCXQmd4b+Ldh1DdLdhxDpNJjtGgfPSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF035FE4CB7
X-OriginatorOrg: intel.com

On 2025-09-06 at 19:19:01 +0200, Andrey Konovalov wrote:
>On Mon, Aug 25, 2025 at 10:30 PM Maciej Wieczor-Retman
><maciej.wieczor-retman@intel.com> wrote:
>>
>> Inline KASAN on x86 does tag mismatch reports by passing the faulty
>> address and metadata through the INT3 instruction - scheme that's setup
>> in the LLVM's compiler code (specifically HWAddressSanitizer.cpp).
>>
>> Add a kasan hook to the INT3 handling function.
>>
>> Disable KASAN in an INT3 core kernel selftest function since it can raise
>> a false tag mismatch report and potentially panic the kernel.
>>
>> Make part of that hook - which decides whether to die or recover from a
>> tag mismatch - arch independent to avoid duplicating a long comment on
>> both x86 and arm64 architectures.
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v5:
>> - Add die to argument list of kasan_inline_recover() in
>>   arch/arm64/kernel/traps.c.
>>
>> Changelog v4:
>> - Make kasan_handler() a stub in a header file. Remove #ifdef from
>>   traps.c.
>> - Consolidate the "recover" comment into one place.
>> - Make small changes to the patch message.
>>
>>  MAINTAINERS                   |  2 +-
>>  arch/x86/include/asm/kasan.h  | 26 ++++++++++++++++++++++++++
>>  arch/x86/kernel/alternative.c |  4 +++-
>>  arch/x86/kernel/traps.c       |  4 ++++
>>  arch/x86/mm/Makefile          |  2 ++
>>  arch/x86/mm/kasan_inline.c    | 23 +++++++++++++++++++++++
>>  include/linux/kasan.h         | 24 ++++++++++++++++++++++++
>>  7 files changed, 83 insertions(+), 2 deletions(-)
>>  create mode 100644 arch/x86/mm/kasan_inline.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 788532771832..f5b1ce242002 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13177,7 +13177,7 @@ S:      Maintained
>>  B:     https://bugzilla.kernel.org/buglist.cgi?component=Sanitizers&product=Memory%20Management
>>  F:     Documentation/dev-tools/kasan.rst
>>  F:     arch/*/include/asm/*kasan*.h
>> -F:     arch/*/mm/kasan_init*
>> +F:     arch/*/mm/kasan_*
>>  F:     include/linux/kasan*.h
>>  F:     lib/Kconfig.kasan
>>  F:     mm/kasan/
>> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
>> index 1963eb2fcff3..5bf38bb836e1 100644
>> --- a/arch/x86/include/asm/kasan.h
>> +++ b/arch/x86/include/asm/kasan.h
>> @@ -6,7 +6,28 @@
>>  #include <linux/kasan-tags.h>
>>  #include <linux/types.h>
>>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +
>> +/*
>> + * LLVM ABI for reporting tag mismatches in inline KASAN mode.
>> + * On x86 the INT3 instruction is used to carry metadata in RAX
>> + * to the KASAN report.
>> + *
>> + * SIZE refers to how many bytes the faulty memory access
>> + * requested.
>> + * WRITE bit, when set, indicates the access was a write, otherwise
>> + * it was a read.
>> + * RECOVER bit, when set, should allow the kernel to carry on after
>> + * a tag mismatch. Otherwise die() is called.
>> + */
>> +#define KASAN_RAX_RECOVER      0x20
>> +#define KASAN_RAX_WRITE                0x10
>> +#define KASAN_RAX_SIZE_MASK    0x0f
>> +#define KASAN_RAX_SIZE(rax)    (1 << ((rax) & KASAN_RAX_SIZE_MASK))
>> +
>> +#else
>>  #define KASAN_SHADOW_SCALE_SHIFT 3
>
>Putting this under else in this patch looks odd, we can move this part
>to "x86: Make software tag-based kasan available".

Sure, will do!

>
>> +#endif
>>
>>  /*
>>   * Compiler uses shadow offset assuming that addresses start
>> @@ -35,10 +56,15 @@
>>  #define __tag_shifted(tag)             FIELD_PREP(GENMASK_ULL(60, 57), tag)
>>  #define __tag_reset(addr)              (sign_extend64((u64)(addr), 56))
>>  #define __tag_get(addr)                        ((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)addr))
>> +bool kasan_inline_handler(struct pt_regs *regs);
>>  #else
>>  #define __tag_shifted(tag)             0UL
>>  #define __tag_reset(addr)              (addr)
>>  #define __tag_get(addr)                        0
>> +static inline bool kasan_inline_handler(struct pt_regs *regs)
>> +{
>> +       return false;
>> +}
>>  #endif /* CONFIG_KASAN_SW_TAGS */
>>
>>  static inline void *__tag_set(const void *__addr, u8 tag)
>> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
>> index 2a330566e62b..4cb085daad31 100644
>> --- a/arch/x86/kernel/alternative.c
>> +++ b/arch/x86/kernel/alternative.c
>> @@ -2228,7 +2228,7 @@ int3_exception_notify(struct notifier_block *self, unsigned long val, void *data
>>  }
>>
>>  /* Must be noinline to ensure uniqueness of int3_selftest_ip. */
>> -static noinline void __init int3_selftest(void)
>> +static noinline __no_sanitize_address void __init int3_selftest(void)
>>  {
>>         static __initdata struct notifier_block int3_exception_nb = {
>>                 .notifier_call  = int3_exception_notify,
>> @@ -2236,6 +2236,7 @@ static noinline void __init int3_selftest(void)
>>         };
>>         unsigned int val = 0;
>>
>> +       kasan_disable_current();
>>         BUG_ON(register_die_notifier(&int3_exception_nb));
>>
>>         /*
>> @@ -2253,6 +2254,7 @@ static noinline void __init int3_selftest(void)
>>
>>         BUG_ON(val != 1);
>>
>> +       kasan_enable_current();
>>         unregister_die_notifier(&int3_exception_nb);
>>  }
>>
>> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
>> index 0f6f187b1a9e..2a119279980f 100644
>> --- a/arch/x86/kernel/traps.c
>> +++ b/arch/x86/kernel/traps.c
>> @@ -912,6 +912,10 @@ static bool do_int3(struct pt_regs *regs)
>>         if (kprobe_int3_handler(regs))
>>                 return true;
>>  #endif
>> +
>> +       if (kasan_inline_handler(regs))
>> +               return true;
>> +
>>         res = notify_die(DIE_INT3, "int3", regs, 0, X86_TRAP_BP, SIGTRAP);
>>
>>         return res == NOTIFY_STOP;
>> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
>> index 5b9908f13dcf..1dc18090cbe7 100644
>> --- a/arch/x86/mm/Makefile
>> +++ b/arch/x86/mm/Makefile
>> @@ -36,7 +36,9 @@ obj-$(CONFIG_PTDUMP)          += dump_pagetables.o
>>  obj-$(CONFIG_PTDUMP_DEBUGFS)   += debug_pagetables.o
>>
>>  KASAN_SANITIZE_kasan_init_$(BITS).o := n
>> +KASAN_SANITIZE_kasan_inline.o := n
>>  obj-$(CONFIG_KASAN)            += kasan_init_$(BITS).o
>> +obj-$(CONFIG_KASAN_SW_TAGS)    += kasan_inline.o
>>
>>  KMSAN_SANITIZE_kmsan_shadow.o  := n
>>  obj-$(CONFIG_KMSAN)            += kmsan_shadow.o
>> diff --git a/arch/x86/mm/kasan_inline.c b/arch/x86/mm/kasan_inline.c
>> new file mode 100644
>> index 000000000000..9f85dfd1c38b
>> --- /dev/null
>> +++ b/arch/x86/mm/kasan_inline.c
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +#include <linux/kasan.h>
>> +#include <linux/kdebug.h>
>> +
>> +bool kasan_inline_handler(struct pt_regs *regs)
>> +{
>> +       int metadata = regs->ax;
>> +       u64 addr = regs->di;
>> +       u64 pc = regs->ip;
>> +       bool recover = metadata & KASAN_RAX_RECOVER;
>> +       bool write = metadata & KASAN_RAX_WRITE;
>> +       size_t size = KASAN_RAX_SIZE(metadata);
>> +
>> +       if (user_mode(regs))
>> +               return false;
>> +
>> +       if (!kasan_report((void *)addr, size, write, pc))
>> +               return false;
>
>Hm, this part is different than on arm64: there, we don't check the
>return value.
>
>Do I understand correctly that the return value from this function
>controls whether we skip over the int3 instruction and continue the
>execution? If so, we should return the same value regardless of
>whether the report is suppressed or not. And then you should not need
>to explicitly check for KASAN_BIT_MULTI_SHOT in the latter patch.

I recall there were some corner cases where this code path got called in outline
mode, didn't have a mismatch but still died due to the die() below. But I'll
recheck and either apply what you wrote above or get add a better explanation
to the patch message.

>
>> +
>> +       kasan_inline_recover(recover, "Oops - KASAN", regs, metadata, die);
>
>Maybe name this is as kasan_die_unless_recover()?

Sure, sounds good

>
>
>> +
>> +       return true;
>> +}
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index 54481f8c30c5..8691ad870f3b 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -663,4 +663,28 @@ void kasan_non_canonical_hook(unsigned long addr);
>>  static inline void kasan_non_canonical_hook(unsigned long addr) { }
>>  #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
>>
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +/*
>> + * The instrumentation allows to control whether we can proceed after
>> + * a crash was detected. This is done by passing the -recover flag to
>> + * the compiler. Disabling recovery allows to generate more compact
>> + * code.
>> + *
>> + * Unfortunately disabling recovery doesn't work for the kernel right
>> + * now. KASAN reporting is disabled in some contexts (for example when
>> + * the allocator accesses slab object metadata; this is controlled by
>> + * current->kasan_depth). All these accesses are detected by the tool,
>> + * even though the reports for them are not printed.
>> + *
>> + * This is something that might be fixed at some point in the future.
>> + */
>> +static inline void kasan_inline_recover(
>> +       bool recover, char *msg, struct pt_regs *regs, unsigned long err,
>> +       void die_fn(const char *str, struct pt_regs *regs, long err))
>> +{
>> +       if (!recover)
>> +               die_fn(msg, regs, err);
>> +}
>> +#endif
>> +
>>  #endif /* LINUX_KASAN_H */
>> --
>> 2.50.1
>>

-- 
Kind regards
Maciej Wieczór-Retman

