Return-Path: <linux-kbuild+bounces-8766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F3B48EA6
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 15:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7763189A279
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 13:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA7930CDA1;
	Mon,  8 Sep 2025 13:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRBx3GCr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993DC30CD97;
	Mon,  8 Sep 2025 13:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757336681; cv=fail; b=mveWwdI9H0VHoilcALCzz+icsMoB38NrWRfhnkoY1h6LPL1/ZSABp4ZPehYRSNBnpHo51/Qj8nMkjQqydUIXNDkj58XjTXWyHBFLXTcv7LJFiGv60DUL3WMDFyY3SQTmbUlZmX7lgVtZBDu2qQJ41g9j5t05K+iPw2nI6i7rkjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757336681; c=relaxed/simple;
	bh=ushb4rqSlCtSgPAqQ/mHGqZh3m8toMcFte1O7yu5wVI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gZcUkrq0G/2o/5CgEM5EYpUuE+LmtRx8h+cTtTKjy62xG2kHo3bW+HUtTEiI/nih3FZDmJsXJH3ECjjDb02HDFYgiGdJaiMHVJSiuqIUzK2MrlakF5YEYUFnDqtWmKAnnAnDfBNoG6MLK5vOFjxtJ8Ad3PhMs1XgYpsSspLvVQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRBx3GCr; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757336679; x=1788872679;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ushb4rqSlCtSgPAqQ/mHGqZh3m8toMcFte1O7yu5wVI=;
  b=CRBx3GCrn+YsEfgb/utPJHuc0Hc9SGTHDLehWXN25pyRfPDQacr9Ia/m
   zJQUrSujZyVE7GiJNEee6qMzB1iP2blozNI5Onidhod7da6v6kNAU4VDM
   8RKLzxl5eNhgNyBFBl9iOGu6eMR0SFo/nfcfoEZTldpVxQY5WHimNig5k
   vXeQEg0UQ2cCX3s8m4UL02sXrQpNx6txHegKLeCBV9+nhC1xnOawFj29B
   v4+67coGB0pBmUhegtsJvsLPn0Y8iJXC9ozh77/gp5M6YOUTFQS25dBtE
   L44saKRFlaJSTDXGAkjozDWKe2vHFm/zdyYb/4xvtL6l6n8i61Sq/MaRj
   Q==;
X-CSE-ConnectionGUID: j598YYyDSAS9Zam9Gq+kEw==
X-CSE-MsgGUID: jYaXAH3MTnqzLg+5kNKMMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85035916"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="85035916"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:02:56 -0700
X-CSE-ConnectionGUID: zYMlOg6aSOWYtptEVUwvkw==
X-CSE-MsgGUID: iHXG9GNeSHimfqp9HHUseQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="176840452"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:02:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:02:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 06:02:53 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:02:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tx9v3Jdw7OGtV1D36caeiNEgS536QM9qcIbOaUNzMrCEYAv90uqXwvS1gOOhpNKdHPsVGbIVQFFPDDYzjipF3+ntAKAu+VnJaMOBF2IRYe+xJaIxGQKnJK2cLJ0mTRoHQndgladrBEzXbbKhCDrXVbnjTAN05HhdjcM3VrlV24urFYRO2EDE0BEGE6nQ8cZ9pMVfMrpIAx5wRUnxiJjn9nvWRmDSOE4Yz14JxZXfv5Ve6paGb4dGd4JsrYOL8IcmToJXwp37i0BATF7JHcivfflxFXMg7QHZ3+ZYyhUsLoRO6EX2WHbteBvenhvNVZfUTbWp0nWN8NKsrlj+JmKuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zfYWlENM8bWu7VIu5wR/Rw0FbwzREZIPHOD+qXFrZM=;
 b=Iuz06LIz1jiZdIAnd0yqfiDuWIAD8I7LNHAglmkOy3vzOP0khYu0FEwcV2RE9OQsnlvwkLsgGaVVUtDSVs6vDhWS+bDRlp+AArPe5eKdp2Xk1JccIOw5CK/CFqlHdddlVSVIOKOEEE367zWvvsFIpivOv2lZwgN2I9g7GveBGl3hXVskIHEUDGtyMTl7D8+JVYUfeWVHLujKgwReuVo+H9okRlsiV2NERGK9ZdBQRnckFGoVQx0GPZwJ1V6nBXNsDARyKPEo6HX93drMk+bPBrPfz5nHS6JdMZWheHE2JGswL8QF+C1Ja1qUEqTG7S46+j3JSfmCYVX88Sj8c3uhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 13:02:47 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 13:02:47 +0000
Date: Mon, 8 Sep 2025 15:02:32 +0200
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
Subject: Re: [PATCH v5 15/19] kasan: x86: Apply multishot to the inline
 report handler
Message-ID: <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com>
X-ClientProxiedBy: DB8PR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::42) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c77717e-1147-438d-b867-08ddeed801f1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGVLL3g4ZkZSUVJNYmxLQVVRZncwVzFRMUJmNVQ2VUIyek9DcGRqVk9tamg0?=
 =?utf-8?B?VTgzbzRUYWlsZnZiSHI1OVZFZHNDTXc1MEl6UUJVb3AyV1VYOUdiWGpKOTRB?=
 =?utf-8?B?cThYdmR1N0g0WnQ0eXQzRjhQaHVqaGp3VGR6bEdXSVBMQTQzVTFIMklkaGht?=
 =?utf-8?B?RWRrcmFUVDdXbGtBM2RrWlJhOXdwN2Z2T3FSSXpxOXVacCtrWTY4UUxCcmg2?=
 =?utf-8?B?NmFzYVFjRVJPOVA5enBvWlBDNHIvTlNOeGlOTVpiaDkzYVRmVlFOL1d2dzBF?=
 =?utf-8?B?eGR4Y0FVZnF5V09ieHZsNG52clByMWJxTXpyeGF5aUNTWlJKN2xldVo1QlpR?=
 =?utf-8?B?VjJ1VDJYbVMvUnBRcURXMXZaTGl0QXIwcUNYUzZMTXR3UElkbXByK25qOUJG?=
 =?utf-8?B?aWsvUnhTdDdtQ2krL3kzaWlDT1AwdGFlYVBEK3lNbjgwRFliYnkzcDBmZ0Vn?=
 =?utf-8?B?Qnk3MG5ZRUhTOWxYTjgyRFkxQ0cvQVpjZFdDSHVPM0I0RzZZVjFhRG8vQVJ3?=
 =?utf-8?B?SjZHS2lCbUJtd1RIUE1TcXhzclYwamJKZTkyZHlUdU1oTUEzTGFGQlErZktB?=
 =?utf-8?B?YlpUa1Z0YXVzZEZzRUZRSmI1ZU9GYnZvd0YwRk9wTU5kanlPMDREWEFiVUh0?=
 =?utf-8?B?NDhYQzhSV0RxdTRrejFQcUR1a0ZXNnJiN2NlV2haaHZvejVuVW56dUhDTEto?=
 =?utf-8?B?ZE5jeDlHRENLbTdMclc2cklITy9sMEZsWTQ1eTBDUVY3MFJVVHExRzJqNUQ5?=
 =?utf-8?B?UUF6bXhQdUROeW5hcFlXdVFuUkpkczNUbWVmQ01yUDNsK3pJdExNNHRsdyth?=
 =?utf-8?B?aTA5L1k2L0d5RmI1VURMdkpDQVZHNE5TSWhtUEphb1RZSVUwNzIwK213VzFG?=
 =?utf-8?B?d2RSMU9hQnRWaXB5U1ZMREs4enBQUUhpckJ6SzY0ei82cUlnTXpjK2p4QVNX?=
 =?utf-8?B?QktUekhsQ1dkdFVVVkdsNFZBdml4ZnJuaythZDNYZHFoM2NHbjhKOE40a3Q5?=
 =?utf-8?B?bVpuUU13bWNMelBhc0VudmlDT1pZYk01VlZGZUlPRXFyeXU3TU1BbjVXUHRM?=
 =?utf-8?B?MUttWUZVSzhlaW1MTWk1UGZxa0hpeWRJcysvK0sxd1ZjY2R5MUkxbGx0QzZm?=
 =?utf-8?B?bGdjazU4NC9LQm5wQUt2YTBtK1Vva3c4ai9lTFdGYWlPVjZ5OU8wcXZBdmtl?=
 =?utf-8?B?Z2dJT0FUYnM3T2xuZ1lhTGp1TWpnWU9UOGNCZHV3dlNFSzNldS96VnJqVVRM?=
 =?utf-8?B?T3JDNUkvL2hzQmk2UDRHbXQvQXdLbXF4Z1hKYXduc280bGlYSExYSHI1b3Qw?=
 =?utf-8?B?ZWlnb2tjcFJmOGhFVUt0am1PL0pCNkVEYmlXMUZDQk93QkIzdndld2dIR1J6?=
 =?utf-8?B?dDd5NFFnYnN1S1pQNjJjb0pZcnRwM2RRYWVkZkxzY0hjbHJPbTNNb200Uis1?=
 =?utf-8?B?V3RaNlBsRW1NbEdVRjUwekVQcG9zZGVBMUQ1Nk8zRzlteG92cEk1OVNvd3lX?=
 =?utf-8?B?c21JZ0JhZm1EQzNWaUE3Y044TWtyWXp5OE9ndlVpNlhTdzQ5Sk9nV3NqY0RK?=
 =?utf-8?B?S2k4T1ZLNUNDcWIwNzlVSHkxQ1dsbm9JY09VZ3JGTmk2d1o1a01EMGxQL0Uz?=
 =?utf-8?B?U3o5YVYreDZ4NVVZcksrWml0alZ0QnJGdHJoZzBuMllaNW9tL2dFZkJtbEl2?=
 =?utf-8?B?MEkva2hIRFM2WVNmbUlEZ1JtbG1jUFpZNzhpbzFxRWFSOTB2M2NUcHdpamRr?=
 =?utf-8?B?L0tRbnpFbkRGVjBNemh3Y2lpWi9xc2IrOHVxVGpWR0FOZzJESjlnNytJU3dP?=
 =?utf-8?B?dVEwZjEvakNtaGFGc0svblh2Z2lYdm04aXJvcm45VjRpbnRLMnRSL0RNcnB4?=
 =?utf-8?B?QnJsdkVXRWpiN05PTkk4enVYQ2wrSHRrbExNb1AwdDh6NWx5eU9INU5xcURV?=
 =?utf-8?Q?q/ZG9VWlkhI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFpWNXpvSUhTbUtFOWRlN1kxUTZieUZFUFl3dE5wUlJsRDhVNWVaNTlrRFdI?=
 =?utf-8?B?Z3ZDcThoOFhHTUlETzZhWEx4WUk3OGhiWlJrRUx3Y1VpcnZScjlucXRWb0dR?=
 =?utf-8?B?VDVUOWdsRlBjZTdscnRQNG1aYUlaY1BJcmk0MUdZTjNxVEg2cHlOWFVQYkR1?=
 =?utf-8?B?TE9xMENOSFlwRDF2WENUZWkxTUw0T0FLUnE1QUtqWDVzMng2dThNcWFxaW5G?=
 =?utf-8?B?aTJ0V2ZZWUdVOTlYYjdjOVRwQ1JZeUZpRnNid3ZhWENxSk1YaTcxSndlWm9j?=
 =?utf-8?B?K3NRTkEySCt2eDF3aEhUT1ZiSS9tZ1NBUi9WM0IvcUROR0ZaMjdINGt5ckVj?=
 =?utf-8?B?dG15Z0QwSG5XSmNhSDBPa25YZ2dNUGF6cUNuTHVkN29oZ2QzdXZpYW03aEV1?=
 =?utf-8?B?cEYyNWwrNUVFTkF3d2RTeFJOY0VDSEVGMnZhYmRMMzVqUjA2b1gxbWZqSjBj?=
 =?utf-8?B?c3hHRHl4RTJtTitCN1BNWXJ5MlkrTTVXS2Y0UDMxMG4wbGROWk9aQ3ZGVE1W?=
 =?utf-8?B?bm5JbTJlNmlWZG9WZnVSamNDSmoyMEFybnBVV2lIVDVkZnpYRHpnWWU1WERy?=
 =?utf-8?B?aFZrM1dUSkRIUTBjejdwZ3lFSXAvZmNQbk5zZUx5blVYN2xsRE1qditkbDR0?=
 =?utf-8?B?WHJQVmxkRVNNOGY1MUFSZnhwVFpBVm9aZjE4WDJQZzBjVCtrdDE1L1hzT0pj?=
 =?utf-8?B?S2dEYW56QVM0UUx2MWhZQk5HeHBBUkFQSG5NV255dWw5cXdRTGIxNkI2dmlS?=
 =?utf-8?B?bWVYeFFsZkUwejNjYmhOOTNYd3gwQjFBU1hyOTNmdGZpc2lBcnBQODl6T29s?=
 =?utf-8?B?WE9sYzUrTWJDeEhCQW5YVHlra202M1RZcEJ1a2VnN1E5N1RoTmJuRUd6dGhj?=
 =?utf-8?B?ckoreGN0TFY3cGxIVzZmRG1zWnVlbmt3WEMvWFRNME8xR0MyWTZYajZhRytz?=
 =?utf-8?B?UDk5ZEZZbm1lVUVFTmR3WlozUURnR1AvaHk5U0J4VkN5RFVmZC9SM0pDUTR4?=
 =?utf-8?B?SStQampFUEd0bmNMb1c1bkhlK2VTaUZrS2JXWjBSa2Rwdi85eEtWdm15STZF?=
 =?utf-8?B?RnZaR0tkUjN1UFRZNE0rODRpYTdjZlIwMFd6ZXpEcDJrc2J0WFR5TEJoa2ZQ?=
 =?utf-8?B?Qk5mSWtIU0FpSktWUXBPTTZTcmhadlNqa1lDWUtpSkJIYUZtcFBBeUxhNXpE?=
 =?utf-8?B?T0JEbHpIRm1KZXdMSmh1ckdjK01ZOTVJNk9EN2tRQUdoRFNBdDNKS3NLdHZa?=
 =?utf-8?B?L3BtRHhDc0p4aUVtbDZwTkp1NGU0UnFNWUpjTkUxQThpdENDRXdrZHNHdWlW?=
 =?utf-8?B?aGxmWXJpUTdneEVmNTNzbU4wMTRsNlU2R3I5UC8zVWNpY0xoZ1pFaVZxSUNr?=
 =?utf-8?B?K2FYcG1rLzBPcVBUakhMTTBmWUI4SXJFNFEzQmlhQW80dkxYWnYvRkNtbFVq?=
 =?utf-8?B?WlFSN1M3VVpiUnRSdnlaTFZDS1ZiUVp4TkFBTDQ4L3VZdDlEUVp5NjlpQXk3?=
 =?utf-8?B?L0lETllxTWZCRmVuN2RFZjhBVWFPcW5iUnR1MVQ5eWxqeVNSejkyYmIwZmxn?=
 =?utf-8?B?YlNjS3l6d1RJN0V4QVFQa0VRek9mYWc2KzZUeWVuMHNtZmIxMk9LaW9yVDFS?=
 =?utf-8?B?NUYzTC9Cc3duUFhwc3Z5UXdFTDE0MGhXNm84dmdCSmxmbVNJazg0NVJlMmVa?=
 =?utf-8?B?NlpORFduYm5Ob3crSE1OY3IycVBuL1Z2K3RFbnVpc2c4cnJaRVpSQXpwbExF?=
 =?utf-8?B?QWJRMW8reGV1VHZxRWgyYk5xeFAwZk4rV1hwS0hzclIxK1ppNVR6c1lucG9y?=
 =?utf-8?B?MHdmeVhSd0t0bysxbHhlSW4vOGtvbjRzTGNISnJ2djdmNVl2a3pQWHUxNERl?=
 =?utf-8?B?bndwOGM2Q3pMK05tWkpvaFRZWXRYZ2xlVkRmaHdtWndlUjd1dHRPSDYvWG1l?=
 =?utf-8?B?TFNOS3ZGZjJJR0tWOS9FMXlTczRjVktZVFlzWUUzcnV2bC9janZSZld3R29U?=
 =?utf-8?B?UGJqVjRIdjVtNDZ5bWl0UVNzRWdSdXRPaUl3NkE5Rmtjc0ZQVUdMcXFJblBD?=
 =?utf-8?B?ZXVxRnViOTdlZlFHNUFmU3BjZHVlN01tY09md1haeE5wVW9uK3FqVHZ4dUlI?=
 =?utf-8?B?VEZ6b2hjQTBMYXRONGlCelBJSTcvS3MvWWxHZituaHp3NWRnTzd2S0lPaHJr?=
 =?utf-8?Q?+j7R8j37HhRAJQ8HxeYwIcY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c77717e-1147-438d-b867-08ddeed801f1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:02:47.4439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4n8jsz5p7JwQt4U3sxkngiEb2dWgk+O+0HlrtfcYcWu33cE5JV/CZjZWAip4UsT4pixvQRh4A8y5gvN5yS/pfNeKiPbBmDMDxsk2eKqz+54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-OriginatorOrg: intel.com

On 2025-09-06 at 19:19:06 +0200, Andrey Konovalov wrote:
>On Mon, Aug 25, 2025 at 10:30 PM Maciej Wieczor-Retman
><maciej.wieczor-retman@intel.com> wrote:
>>
>> KASAN by default reports only one tag mismatch and based on other
>> command line parameters either keeps going or panics. The multishot
>> mechanism - enabled either through a command line parameter or by inline
>> enable/disable function calls - lifts that restriction and allows an
>> infinite number of tag mismatch reports to be shown.
>>
>> Inline KASAN uses the INT3 instruction to pass metadata to the report
>> handling function. Currently the "recover" field in that metadata is
>> broken in the compiler layer and causes every inline tag mismatch to
>> panic the kernel.
>>
>> Check the multishot state in the KASAN hook called inside the INT3
>> handling function.
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v4:
>> - Add this patch to the series.
>>
>>  arch/x86/mm/kasan_inline.c | 3 +++
>>  include/linux/kasan.h      | 3 +++
>>  mm/kasan/report.c          | 8 +++++++-
>>  3 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/mm/kasan_inline.c b/arch/x86/mm/kasan_inline.c
>> index 9f85dfd1c38b..f837caf32e6c 100644
>> --- a/arch/x86/mm/kasan_inline.c
>> +++ b/arch/x86/mm/kasan_inline.c
>> @@ -17,6 +17,9 @@ bool kasan_inline_handler(struct pt_regs *regs)
>>         if (!kasan_report((void *)addr, size, write, pc))
>>                 return false;
>>
>> +       if (kasan_multi_shot_enabled())
>> +               return true;
>
>It's odd this this is required on x86 but not on arm64, see my comment
>on the patch that adds kasan_inline_handler().
>

I think this is needed if we want to keep the kasan_inline_recover below.
Because without this patch, kasan_report() will report a mismatch, an then die()
will be called. So the multishot gets ignored.

I'll check what happens on arm64 when a mismatch happens with inline mode +
multishot.

>
>> +
>>         kasan_inline_recover(recover, "Oops - KASAN", regs, metadata, die);
>>
>>         return true;
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index 8691ad870f3b..7a2527794549 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -663,7 +663,10 @@ void kasan_non_canonical_hook(unsigned long addr);
>>  static inline void kasan_non_canonical_hook(unsigned long addr) { }
>>  #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
>>
>> +bool kasan_multi_shot_enabled(void);
>> +
>>  #ifdef CONFIG_KASAN_SW_TAGS
>> +
>>  /*
>>   * The instrumentation allows to control whether we can proceed after
>>   * a crash was detected. This is done by passing the -recover flag to
>> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
>> index 50d487a0687a..9e830639e1b2 100644
>> --- a/mm/kasan/report.c
>> +++ b/mm/kasan/report.c
>> @@ -121,6 +121,12 @@ static void report_suppress_stop(void)
>>  #endif
>>  }
>>
>> +bool kasan_multi_shot_enabled(void)
>> +{
>> +       return test_bit(KASAN_BIT_MULTI_SHOT, &kasan_flags);
>> +}
>> +EXPORT_SYMBOL(kasan_multi_shot_enabled);
>> +
>>  /*
>>   * Used to avoid reporting more than one KASAN bug unless kasan_multi_shot
>>   * is enabled. Note that KASAN tests effectively enable kasan_multi_shot
>> @@ -128,7 +134,7 @@ static void report_suppress_stop(void)
>>   */
>>  static bool report_enabled(void)
>>  {
>> -       if (test_bit(KASAN_BIT_MULTI_SHOT, &kasan_flags))
>> +       if (kasan_multi_shot_enabled())
>>                 return true;
>>         return !test_and_set_bit(KASAN_BIT_REPORTED, &kasan_flags);
>>  }
>> --
>> 2.50.1
>>

-- 
Kind regards
Maciej Wieczór-Retman

