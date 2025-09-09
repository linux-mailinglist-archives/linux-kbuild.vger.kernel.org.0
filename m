Return-Path: <linux-kbuild+bounces-8776-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB8B4A531
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 10:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F8A23ACA97
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 08:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE687238C0F;
	Tue,  9 Sep 2025 08:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="euTGL8/A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDB224166D;
	Tue,  9 Sep 2025 08:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757406287; cv=fail; b=kPTYEYp+P4G2vVM5T5vxyjM/AwOjkt4Cl61q0sGGidFHQyjZRTULITAYXY1Y1Pj1b15NK2ykAbdUUfus0VCfmqRHqYAgtCP1hKnWSBg6VRFJsVZc07povIiX8UGFLtCYSNkYW3Ca341qoA9lne6dvIsR85e9AcwIl70XH6ucB7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757406287; c=relaxed/simple;
	bh=/2dPp4K8eNVQMivTr6uw9ptho0fZ1qq2cfcRyZO+T7w=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Tsl7wGbFXvhubUxvhnS4fJAM7eJ05qWDdVS9UrxZAdxVj/dK8djlEYT4CXnW0redXcSy/INQkNQlXHzzmbUQXMcMm9wdu9K22jPHH97aQh/O8ydmj+xGzCvfGsiWQZwpbDrMegJf5QKWnzwK0jh5I2BY04IpqoGjkA3UAbNESwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=euTGL8/A; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757406286; x=1788942286;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/2dPp4K8eNVQMivTr6uw9ptho0fZ1qq2cfcRyZO+T7w=;
  b=euTGL8/A6yFAaOJicT8sIBzSh8UM+SBxBA0KXQreQfHfc5Hk1S5zhUaS
   pG6Lk/vL44fjGkN2HfZjWCDvSQR81IA4XagYjr6fuQw6pABpxQPu4F9Uf
   6w6v07EULxFT48WjXVpnH+C5cmwQOsY1w9djG906Az9hfDhScxfF6JIqw
   A7Mu12Fxe1EuWuecokUkkuUYr6A1wudtNwcLhEh0T8f4hzkfNXK153FCg
   UhMsydvB7SmTbZtTiKkOmYVV7vwmXF3TzrZGfw6Jkg0KNAOBPbwkX0Fq9
   7Hd38ErhfJcu5k+7//9KvMNdRzkjzZBbaNuSy2gCO/CVORDP6TohTXK8k
   g==;
X-CSE-ConnectionGUID: QalOJbOyRSyhoWE/KgiGHg==
X-CSE-MsgGUID: ZjdzSo/YSoeSGgEMJJTrvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59790083"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59790083"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:24:44 -0700
X-CSE-ConnectionGUID: fNox7pAsRKerX1VzZEERyQ==
X-CSE-MsgGUID: fFPPjtSQT3+OAHNvwdJTLA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:24:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:24:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 01:24:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:24:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFByRXHyXYtNw5ekksr5xtNkgl6JrfaAu0ygbxkGoLfCHDJgJZntqXPDfgsr6i7hvv+eulTvPcxsdich6U8ISH2ICVdxnze0W5QmGHePGupGxk4eRyzi/R44oi4HMTcgz4xf4Cg9euzLPgGCzrk/USTFnjS4F/eNuAXidMn5UnNQgXkOpkg1m5LLcrGsk+ItT0N9ZJfuOLrbruHtJMv/ZHtBC3rW4ZFITRywWxKMbqKYkvbhy6ShcxPBLTpm7cErBizeiniw8RwcR8kki2rriB0tOSUD+sl+BGikWtM88CCPhKJU1lZowONAt3tzKxUyyGvxfCAYwIDGDWcSphTZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7XjDntzVSIIjBgxnGAc8Kvz72OGMsj6ygOArYB3LG4=;
 b=fvg8P/QAhWb3gzE/f4E4/LUkZXllGdohiLY3H3947cSwf+6bCg9BTTuyHbTjeivRsUFLjyNUQu0hSq7DccTTyHO3SZhd9/y4cpIkxYcPs2LOYUzeB3gemHuaQK2A7AcgDZF46cEEbbM/aTAODqq/i9qtlNzmwFoT6eqGuZNwSGiuNASZZHgod6jOo3JJATvbtRl6JM0AzzicZwRux5Kf5DAkMuTCs2B7Vw6BZm94fue7r0JurXCDRr8jMdUecLHWRWx3vnmuBSBt1Sx5Dhw5Z00I1MwgZicM8Jga+/VA6CS1Hm6MSbNw/SJiMvSitRudKAR/imxrL+Vc+pR/gBxAdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SJ5PPF263E38237.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:24:38 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:24:37 +0000
Date: Tue, 9 Sep 2025 10:24:22 +0200
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
Message-ID: <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::18) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SJ5PPF263E38237:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ed005dc-cbf0-46d5-ec0a-08ddef7a505c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm8wOEMwUEh6eFpMZFBDMnprVE4yTWtXampFdS9BbENyM0k4S3hDdkpZd1NL?=
 =?utf-8?B?eXdPckZ3bzU5dWluTlZlWVd2WHFBNVBqcXUvYmI5SjJZZElpemdWWWo3SDly?=
 =?utf-8?B?SVh2djRRcDhaRnFDM0ZXWGhjVzc2dmRVVTh1ZHI0OSt4a2UzcGJUSHdmWFVG?=
 =?utf-8?B?NG9ORzdvWVVNUnRVVGllUVlwRFprQldkdG5HRzlIWXNzOWp4V1IzcUlidVM1?=
 =?utf-8?B?NHhzYU1oQnJnM1V1dld2T0Q0Wms3QlNwOGQwcjdRS3NzaW9Vb3VFaVF0S1RV?=
 =?utf-8?B?QUplNUFxcEZta3NLZVhDZ3ZGK1dkcjMyc0J2ZGFFZm02NHBCY1hhSzh6V2dZ?=
 =?utf-8?B?elpLL2E5MnFvczdYdmdlUWMrTll0a0pBcUhMa1JNZlF2dkd6Z3lINmNxamFB?=
 =?utf-8?B?bjRtZVE2T1dXUDJzWXJidE9KemJTUWhqRkd1WmZkTCtRWmlMTzd1NVhRTWJW?=
 =?utf-8?B?WGt3bGFuMUM2aEdwRTdsM3NycVNRdjVYdW1sYnlCU0FDdkdTbXVBbTFuc0NW?=
 =?utf-8?B?TUR5VktWYy9sSkRrMy84bUJTTU50R3FGWVdZd05udTNxdDVKTWhGWExaLy8x?=
 =?utf-8?B?UFUwdHgrOXlodG01eHJCMmZpQkx5MTVLWlN6MlB0Q29TekFWMlY3WVFxVUJQ?=
 =?utf-8?B?TTNZSk5EM2dza21zMElKTHVQSGttWkpscHdhRnNCeTcyMlhUVEUvbDRtSUtW?=
 =?utf-8?B?VVBSeGdMOXB2b004MHg2Y1U5Qk1PUVg0alUvWmVmcVBRZmxTYjZKdHR5OXEz?=
 =?utf-8?B?MzUwWGhYQmxRQWF2cE8va1UwR2U2djVFRUlJQWo0SHIyUzZITXUxdmxIWHQ4?=
 =?utf-8?B?VDVYdjhFQzVSaWNub2F2V0Y5VC9aVDY4Mm5yQzNlbVcwaWVjaTJMRE56THgy?=
 =?utf-8?B?QWs2dXJpbU41WWg5aFpGd2dDUDd4a0F4NTBKRVBHZTdaZks1blFPRVBPbEV1?=
 =?utf-8?B?ekR1MUE5VU1SK1NYQUFzUXR1Y2NacHdsR2l0VmNCR2ovT21xN0dqQzQ0b1pi?=
 =?utf-8?B?N0lISGU5cmwvb25ibno0aFBZVzV4bVV4MGRZOXJVVlhaQjRMc28zRFNQeFda?=
 =?utf-8?B?ZUhNVElKckhKUENUWExoTDJORDErTS9veDhsSS9DcURDQmk0TnJ4Rmg5Rlli?=
 =?utf-8?B?STR2b0llOXZOMkpzK29aamtOM1NNdVpLQmV1ZXkxajAyUUM4Ky9zSDh6a0Jw?=
 =?utf-8?B?SVBZQWU5MGY3bUFkNHRQb0Nxb1B6VHFma3VVbHZ1T05iS2wwblBONkgwS0tG?=
 =?utf-8?B?MUV0Y2dTR0VuaEk5RFZoMHptdFBCMi9HRTZUcE4rK3A1elBMeTYyeU8yTzNX?=
 =?utf-8?B?SmNWN1c2ZjhWRHRYcTdJdlJXTDBIK09ueW01amo1TWFrWEYvZ2ZTdFRqbTJJ?=
 =?utf-8?B?V2pqMnJncXhTWUVzYlczcmkwamxlNW1Jd2JZYzZRV0JWdnhhanpHQXJKYmVB?=
 =?utf-8?B?Rm1EeUE2blZuOEw5MXRkLzQvQTNIbHkycGFnbHROYmx4OG1Md2dReURELzl4?=
 =?utf-8?B?MXVxRWJjVlAxVUwxQW1ZOXI2TkpKeG4xcHIzZktEM2wxWVBIMGRtYmZCb1Nx?=
 =?utf-8?B?a252UGhGTytncTE5WHZUVTdETmhRWWNubHN3UW9BWEFSZnlLczlwdUVpLzVz?=
 =?utf-8?B?WGFvSHVqN3J1VG0wczhaWk8rQ0oybWdTNmxnclpIUi84ZXQreERqU1dYdVRP?=
 =?utf-8?B?V2xTcjB5RCtlNmMzZHhwdDFVa1c4MTlEMXgvcXdJZVZLdkhYQWk1OTBCV2pG?=
 =?utf-8?B?Ri9Sa2xyMFNPQUF5MnJjVkdnMlZiRVR6Mkk5RjhjL1ZSNkl4NGpzd0Y1R2Z3?=
 =?utf-8?B?aWlZOEdkTTkxMjhYVDhhR05DMnVSc3JDYmJVRjVZNTVrNHR0U3Q4RTVhWUFh?=
 =?utf-8?B?YjFlWldja3owbHBEcTk2bGtGamhaVW40TmpoZG5PTU5FY3U5UlpDLzRtbkVs?=
 =?utf-8?B?ejRXaW05ZlZQNndPT3dpb0c2d21EQks1K1JlR0Z6YUJzM1YrV0hoZzV1Vkdp?=
 =?utf-8?B?MEZMQ3lncDlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVJLRldpY0ZlamhrUVZnUmtDcitpMDBPY0JQM2tXTCs0dTM4N0pRcDZLb0Vl?=
 =?utf-8?B?eWI5SnovQ0lkOGpienFtb1Z1L0ZLR1U0eG5OR1BseEFJZFJaNGI4RWo2ZUMr?=
 =?utf-8?B?RlpQYlpDczJEUmVCd1FnTWJyMldwL3ltTUgyT2Y1QmhPT2RnVVNpcm0zOFZq?=
 =?utf-8?B?blpNcFhKbzdTcms1Y3VDeVduZWRQUTYyUzhOWC9CWWxXRExjNVN5dEhXaFlM?=
 =?utf-8?B?amFVb1U0ZTZpdFE3OTNvZCszZUdZczd1L1oxamdCY3F5WFpYcFdlMnpwQllO?=
 =?utf-8?B?UGtYb1RpNm1jUzdIVWxVV054ZjJlbEZBbUdtM1QwdEE3ODdNMjN4MHBxanlT?=
 =?utf-8?B?WkNvSTNPbDFDY0R2M2tjeTZUd1R4T2wwME5QcnFTKzlaNDFlS1ZhWVJIZlNM?=
 =?utf-8?B?aVc2RlE5bWJ1cXRGbFRvYURVdmorUUtuN3ZtaU5UTldZUEI3b01QM2ZWUjRp?=
 =?utf-8?B?WEs0NjNlelBtRGtWVzhaMTN5amVrWXdJN1BHMU5DUzFkUEZHTSt2ams3dk1j?=
 =?utf-8?B?MW5GMUl5SW1tbXpVVWN4allyeTRtbldVTEllZDdqbWcxc3hKc3UwVi90RzZp?=
 =?utf-8?B?dkpKNm4zTWFLcE44K2VPRVB3V3lmbUNVWCtKdktsSW9RS2YweFdYcC9yMGxv?=
 =?utf-8?B?QVMvZFlvUlh4eVkwMjRIMDRhZGhuNitoNW5KdGFZQmJabjRHNjBIajlKK3dJ?=
 =?utf-8?B?bjBhV0FmVVVPNE9TdldKbll1Tko4SUE4Z3VDU3FiR3Vtak5sUVE0SWJHSFl3?=
 =?utf-8?B?OXBYZ3R2OHJHbVVQSjlMUWV3MldYSS9aWGp1R2xEeHg1a1E0WUJUTTFUMXdw?=
 =?utf-8?B?TUVkb1R4UVRWYXJUUkNpUEJaY0ViMGI1TlVFdGxBYitXQ0VJVzJBTUNrWjM3?=
 =?utf-8?B?NWJFdGpLMmVnSVZtWllwSFZXMHV1czM5S0IxQzc0c2VJTEcwbzBzNFBwOTBN?=
 =?utf-8?B?V2pGRXZuRmhJSjA3RnZxZGU5THd0RUMzVzF5RER6UE5SSmpEWm9PTGVRTjdh?=
 =?utf-8?B?UVpVTGNPbUZyY3NZRmhaUFdTR3RVMEhSSFBrOVhtRlI1S21mZzA0TnBQMlNK?=
 =?utf-8?B?QjhlWDRzSDEreVN4VzBBOE5xZXNIdkk5UE9sME91SXRsaXpwUXpGbDZwdGkx?=
 =?utf-8?B?YkRKL1kvdzMzcDJDOHhqZk9oSUt0TnBQZ0ZDaEl3ZlVyNkMzZTY2aEdMMk1k?=
 =?utf-8?B?dUQ0NXNGWkxDeXNaa0U1UUlpOXVIQU9xeUw4T0hhbkZSa3FzY2ttZVpTcThz?=
 =?utf-8?B?eTNaTjFpNjIxbXE5dGg1bTJGeXFrVUxWVDlIaXAwMmdVdElZQzVmb1RSL2pQ?=
 =?utf-8?B?WGJCdCs3VmtEcDZRSHo4T3EwR042UndVbUFoa2JvVWZBRVA2UEpQanhwS25r?=
 =?utf-8?B?TUsrbkVaWWZoWlEycTdNY0RiTG1hSlhGZUxkWEp1SVJrRldkTnlaWmRlTHgw?=
 =?utf-8?B?aFp4M29XRmRTS1JLalN6UlJGbWdpc0Y2VDY2MVFHRXROM1NvMmtLd0R3Zkxi?=
 =?utf-8?B?Z2RLWjdRYk14NzBKWE1lQ2lWYURqYTUzYXVVUVVERTU5dFZRWjZEa1IvVXUx?=
 =?utf-8?B?QnVYZU9TckRWZW1uY3ZhNVJobWd0NGl2c2ZlSlk1aUxyWnpjN0dwVW1ZZmN5?=
 =?utf-8?B?MzlUVW9OL2lUNDE0ZEZtSWZDcUJyWlF3N09QTStwUVdZVENzN0VKRVgvbS9K?=
 =?utf-8?B?WnZWQW16SC9vMlFuOTdTekpFVWsxMm1iSU5DTWJsL0FhSG5CenJKQTh5QlpX?=
 =?utf-8?B?TmdQVGcrOEVXZi9MME14OVdnc2lDWG9mNHFpUVVkZFJkaW5YT0YwNURyZ1g5?=
 =?utf-8?B?anJYUXU3dmp3YkZGM3V1ekIzenF6NkMwT254d2s5LzUxRk5Rai8zc2hRU21S?=
 =?utf-8?B?MWZPYXR1VVVES09PQkNmdmJZZy8yNm52dnJ1bGlMYVZDOGZuZXJRbUtaUDZq?=
 =?utf-8?B?T3BRekVUajZ0aTdRVXJpdUhBMCtGODlLUFQ2R1c0WjR3eFNjZmZEZ25kMVJ5?=
 =?utf-8?B?bVRva3RmWVordE93YzFGRTNDSGtKMTc3VzdlMnNFRmFZT3N4RWhFaHhrRk4v?=
 =?utf-8?B?YmVteTR4Z0tUUlVWV1grYzIrSnBheFlPRmc3L09RNVl2d2ViemFmcEx6Qjdk?=
 =?utf-8?B?ekI1ZmtkT0FobGlMSUt1anFXWTY4Y29LbW5odDBKN2tSazFRdElaU1dtZUZL?=
 =?utf-8?Q?6ndQGXzIxTF51DzFfxYxQtk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed005dc-cbf0-46d5-ec0a-08ddef7a505c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:24:37.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqXKHmCrLodauCiDBDWs6U5AYbVwU/KtCMTV5S50CLdjPTL62kDc5aVufRrASWi4R6ZBfWOab9YM9tplG/rFIyA5994r8GvpfURwqVkuihU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF263E38237
X-OriginatorOrg: intel.com

On 2025-09-08 at 22:19:05 +0200, Andrey Konovalov wrote:
>On Mon, Sep 8, 2025 at 3:09 PM Maciej Wieczor-Retman
><maciej.wieczor-retman@intel.com> wrote:
>>
>> >>I recall there were some corner cases where this code path got called in outline
>> >>mode, didn't have a mismatch but still died due to the die() below. But I'll
>> >>recheck and either apply what you wrote above or get add a better explanation
>> >>to the patch message.
>> >
>> >Okay, so the int3_selftest_ip() is causing a problem in outline mode.
>> >
>> >I tried disabling kasan with kasan_disable_current() but thinking of it now it
>> >won't work because int3 handler will still be called and die() will happen.
>>
>> Sorry, I meant to write that kasan_disable_current() works together with
>> if(!kasan_report()). Because without checking kasan_report()' return
>> value, if kasan is disabled through kasan_disable_current() it will have no
>> effect in both inline mode, and if int3 is called in outline mode - the
>> kasan_inline_handler will lead to die().
>
>So do I understand correctly, that we have no way to distinguish
>whether the int3 was inserted by the KASAN instrumentation or natively
>called (like in int3_selftest_ip())?
>
>If so, I think that we need to fix/change the compiler first so that
>we can distinguish these cases. And only then introduce
>kasan_inline_handler(). (Without kasan_inline_handler(), the outline
>instrumentation would then just work, right?)
>
>If we can distinguish them, then we should only call
>kasan_inline_handler() for the KASAN-inserted int3's. This is what we
>do on arm64 (via brk and KASAN_BRK_IMM). And then int3_selftest_ip()
>should not be affected.

Looking at it again I suppose LLVM does pass a number along metadata to the
int3. I didn't notice because no other function checks anything in the x86 int3
handler, compared to how it's done on arm64 with brk.

So right, thanks, after fixing it up it shouldn't affect the int3_selftest_ip().

>
>> >
>> >What did you mean by "return the same value regardless of kasan_report()"? Then
>> >it will never reach the kasan_inline_recover() which I assume is needed for
>> >inline mode (once recover will work).
>
>I meant that with the recovery always enabled, it should not matter
>whether the report is suppressed (kasan_report() returns false) or
>printed (returns true). We should always skip over the int3
>instruction and continue the execution.

-- 
Kind regards
Maciej Wieczór-Retman

