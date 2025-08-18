Return-Path: <linux-kbuild+bounces-8496-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF26B298EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 07:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC7CD7AD9B6
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 05:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5360C26E6FF;
	Mon, 18 Aug 2025 05:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P46gGi3S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E19625E816;
	Mon, 18 Aug 2025 05:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755495106; cv=fail; b=N698sUtvfBoJtOLRuQu/1QwRuFnX9g+HIhNp/FHguS8pGxWbRwhsbo4iQGxQlcslTkZW8mQgmfkKsc1PVncLbZsjDQcuA0tFdMJl9ITWjzghGFAimIFzNWgg91wL01z7mYYg5kqvqTHfL17MWcC0us35yFX6KPXLufDG/mhrNVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755495106; c=relaxed/simple;
	bh=mA6VB3txEeXianMJHU36PkNUJhj/vCvz7xtZuICQoH4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HXXinpOEr8OL4InRiF20e3mOiY0os8db+KsC+KMVrEXlGUx3T1+IqcB1s1tmP8a6HAhezPd6G946YFte5S5P8puq/uPUkBHV71HhkFDXKNDAMfuPReiotTI/A6FplqH5G483XwKjH2G2bht/QxTn7llum9LZdqWczpmeFUTQBs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P46gGi3S; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755495105; x=1787031105;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mA6VB3txEeXianMJHU36PkNUJhj/vCvz7xtZuICQoH4=;
  b=P46gGi3S2m1x/ZUi6kRB9+vJRLZh4kE+YRzFUzEtQrfJo1I2FK3fRVP7
   UmCmTuPJF45mdj3E2/4Ti+znGoDRzVrkbqnGy8LHGtITO2rednlrvqgO3
   wJX4q+HHLmWnHyTNhHazlJXwtgSrlEF0iDcDa8dPSMZktVYPF9BXjcZCy
   /yfNR4J+3pG1IhB70YyvpR7xyg/0T7Z8qB5mtFnTXxNtmD1zIdzJtuKe5
   ZiKDiccMr4wlffI+8Yvh3qUSH61m1CkBG4Hk7vq8reLxqO2cIqR16/rrj
   UDl916DZCdjePgsbY8B4icg6za2M3yve9Z+Yfj8i/Y3vc6zPLQQrDTQB6
   g==;
X-CSE-ConnectionGUID: 19Ew80VGSmSYoHickgBXbQ==
X-CSE-MsgGUID: 8HCUijxMRZqvQ4pvm2VhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="56738760"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56738760"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 22:31:42 -0700
X-CSE-ConnectionGUID: LIn+Oy5URz+3yGfCseAZ8Q==
X-CSE-MsgGUID: mtUPVEPEQoGGQI1nkK8+Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166714805"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 22:31:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 22:31:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 22:31:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 22:31:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Auw0QDy47r5JH7yd6gQeiSNpysKlitb92Wu1OI+Cx0WtSJTkPFZSl+QSwlIlLPaCQCaWShmkUhXvHKf2zaBQmUjrd1XGu2w+0Lrdjr/lSnXTlnEXR0lK8uoBgPa6VCNG83j2zoP1mMQfCw6KicCbBiU23gbvpHQlaE9DKKo5/zSG4Au3dEKFQSgnnzlcatjw5kqN1asoT+XXYAmjyNSOIsQP2c4i0uceSv2x1ANsQqIWGmf+5KY2D0HFn1A6ULRdPLaMvVdTqNMKCFp/V/B6IBOD5DAn4u3OSmu7XtZpUsZSkzT4c9+MOW9opfts8PKelE4xpvSjxi0ulPkE585c4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaUKubvxpufWioL8U2vmrgRQn1nfJpgwPvmZ0KwS6y8=;
 b=SJ/it2h/q2jr4UoalSwrxCUHSTbqZ/yZC5HXcO0utsUwa3k2O7d3k+461xKf6xeTNX8Atk8eEEJwslWnc9/mRYS5cuCMNCgXoA8mjbwZIUqNUt839Q6nZtpHkghWUti8sZs/lMwwOw28fJtPSnymQ0md1q55fnNMhDf9fQkQ7ob8d3Fgy/1tkkueksbzbAmvEjeGFFpOHzJP/ARk36E0ATerpJgk3yx31O9tdIzX/bTHXUbAH13w+b+aZhCvKvsvCUpj1bJwCCXYn56xD5AGhs3FD+ojSOfCmmvVlwVxMDDagd+geWwdPEYry1moTTsBCTILrKBI8ZPV3uV9nmo+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by DS7PR11MB5965.namprd11.prod.outlook.com (2603:10b6:8:70::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 05:31:21 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 05:31:15 +0000
Date: Mon, 18 Aug 2025 07:29:29 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <nathan@kernel.org>, <arnd@arndb.de>, <broonie@kernel.org>,
	<Liam.Howlett@oracle.com>, <urezki@gmail.com>, <will@kernel.org>,
	<kaleshsingh@google.com>, <leitao@debian.org>, <coxu@redhat.com>,
	<surenb@google.com>, <akpm@linux-foundation.org>, <luto@kernel.org>,
	<jpoimboe@kernel.org>, <changyuanl@google.com>, <hpa@zytor.com>,
	<dvyukov@google.com>, <kas@kernel.org>, <corbet@lwn.net>,
	<vincenzo.frascino@arm.com>, <smostafa@google.com>,
	<nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
	<andreyknvl@gmail.com>, <alexander.shishkin@linux.intel.com>,
	<thiago.bauermann@linaro.org>, <catalin.marinas@arm.com>,
	<ryabinin.a.a@gmail.com>, <jan.kiszka@siemens.com>, <jbohac@suse.cz>,
	<dan.j.williams@intel.com>, <joel.granados@kernel.org>, <baohua@kernel.org>,
	<kevin.brodsky@arm.com>, <nicolas.schier@linux.dev>, <pcc@google.com>,
	<andriy.shevchenko@linux.intel.com>, <wei.liu@kernel.org>, <bp@alien8.de>,
	<ada.coupriediaz@arm.com>, <xin@zytor.com>, <pankaj.gupta@amd.com>,
	<vbabka@suse.cz>, <glider@google.com>, <jgross@suse.com>, <kees@kernel.org>,
	<jhubbard@nvidia.com>, <joey.gouly@arm.com>, <ardb@kernel.org>,
	<thuth@redhat.com>, <pasha.tatashin@soleen.com>,
	<kristina.martsenko@arm.com>, <bigeasy@linutronix.de>,
	<lorenzo.stoakes@oracle.com>, <jason.andryuk@amd.com>, <david@redhat.com>,
	<graf@amazon.com>, <wangkefeng.wang@huawei.com>, <ziy@nvidia.com>,
	<mark.rutland@arm.com>, <dave.hansen@linux.intel.com>,
	<samuel.holland@sifive.com>, <kbingham@kernel.org>,
	<trintaeoitogc@gmail.com>, <scott@os.amperecomputing.com>,
	<justinstitt@google.com>, <kuan-ying.lee@canonical.com>, <maz@kernel.org>,
	<tglx@linutronix.de>, <samitolvanen@google.com>, <mhocko@suse.com>,
	<nunodasneves@linux.microsoft.com>, <brgerst@gmail.com>,
	<willy@infradead.org>, <ubizjak@gmail.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <sohil.mehta@intel.com>, <linux-mm@kvack.org>,
	<linux-kbuild@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <llvm@lists.linux.dev>, <kasan-dev@googlegroups.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 06/18] x86: Reset tag for virtual to physical address
 conversions
Message-ID: <tnswzssq2kyt3sla5enhzjmqh7m2xum6y7lprrimvrcajbqe7j@3cdk6tcdyjjy>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <01e62233dcc39aeb8d640eb3ee794f5da533f2a3.1755004923.git.maciej.wieczor-retman@intel.com>
 <aJ2M_eKPvBluyLKJ@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJ2M_eKPvBluyLKJ@kernel.org>
X-ClientProxiedBy: DBBPR09CA0024.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::36) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|DS7PR11MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: ae908470-7a49-45d7-c36a-08ddde187361
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?McwExDk10W7A1ubcJebC2Ciia49cGvGrT7h7Kr9KaSXlfS7/zgZTyXAj/J?=
 =?iso-8859-1?Q?+WndzBowSC09EA4QZ7Gj+EtdVneHj38FFPUOWCqsFCDSuwH0sscXgarreT?=
 =?iso-8859-1?Q?mBHgOVbTuapFJFqo8oL1hqSm0m45gg94x2SVy6Va6yOz7JEYBgJdWqkDAe?=
 =?iso-8859-1?Q?c8o+2GDwZrJF67m4DzRMMqzbeWxZ/vQ0Qdk5FQ7ZBAKn9rwwivmF5Xzh97?=
 =?iso-8859-1?Q?ov+NZRDrpnirXEeNJR4eDR+vMgeb9ghhgOipYVhu1JHGh3sPSM5U4l3s1r?=
 =?iso-8859-1?Q?oxXxicBks0tZgLeeC5WMRyfGk6KaYm9UjiC4FXAeJYtwuqSK6EyPkhHO+e?=
 =?iso-8859-1?Q?ZIHjCOYh+rfzYEMfzuPGxfOIcHbWnCkxm0+jbLRWTTpH9saTCT/fEyiZTW?=
 =?iso-8859-1?Q?CNV4Yfm9WV4M0cJNU4ritVYZY1Jjr3/2FcC9HoEaJ2hQgLk60ZxL+BOG+S?=
 =?iso-8859-1?Q?l59wXn6YZKBnD64hqIHXP0khEC3UP9OgwByuu8it3SXfjxPzE+jKJDUSw+?=
 =?iso-8859-1?Q?6oPmKUWess6xQF3SPj2Ky1MWBD2lTvJy9Pq6u8TWYIrtIfCGL7wa0o+Pn5?=
 =?iso-8859-1?Q?rjzc4zu9LNN6RED/Fn/X0FTKq36V+Ege5GTklmOLgYYzgxZOAJe1eikt9J?=
 =?iso-8859-1?Q?WbaDOYBR6KoehzCXzBfiGV/GWkR/nXMnrz3rCO51/fdqMmath3koURTbTA?=
 =?iso-8859-1?Q?+w6tfNiloMmanZxgR6GBKQ0omhaItlR+gMNxDe8l4PcA15cWtEBMBfW342?=
 =?iso-8859-1?Q?aXMfDTi0kGg6qD9Oju/t6ZIi+MjM7OXpV7+PMTvlEuyIVX/OE9IStl+1Nj?=
 =?iso-8859-1?Q?Ri031iZgk10t0lkpbS5P4d7AaiU5mzg2mZg9vSzByADMPRDXx0MouPjf0p?=
 =?iso-8859-1?Q?oPmj16awG3xGwV5eyYF1bO0qTkru+RMz9o49B7Y69FyTHQk6F+C0vld+MO?=
 =?iso-8859-1?Q?HSZE7oYiNEXkhlTbmBCu/0xGRfFr7L84jX9Zld1DZsLb/jhxDka9VazR7Q?=
 =?iso-8859-1?Q?HpO5moSNAqmTRJA4UwwS4+k9JSnW+j/qp6AtZV3SuhEX+JQl4l/4xnsSZC?=
 =?iso-8859-1?Q?sCc3AG6mryKEeKYAKb1HSQN5VG13XBotZ3VbE4j/iABIDedQmjSU6tqKke?=
 =?iso-8859-1?Q?LJGLtmivZYmfBLoMPrpbihTbNPDO/8U7mDtKm5sABiq6/dEIxHSYEV/s64?=
 =?iso-8859-1?Q?SLbmSYNki/fd75EsBObcipNFpNFk4YF5p2w86c8mOq+2UKeIKj0p2IdO5O?=
 =?iso-8859-1?Q?YBfGXG0aWvWGn9ixamXrhV0VLn3quawBMpIrLEAO+oHB32QKsbP6pM1TCi?=
 =?iso-8859-1?Q?lgymMRW8EPIFkcx8bWqEbvuXqYLYHIMi0avr9zVngUB20dhnbo4Pfv24Yq?=
 =?iso-8859-1?Q?fys5yPzWEAVWMGC8H4MSQT26tIZ+ryle9IZp5eIkV+bm73m0A/WqNW0bH2?=
 =?iso-8859-1?Q?hFbPtP7abjWlN1rm1DXNsqg+girzwVVuJRankQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pXjtlX1/LdtCLxvEvuP7NU8CI1tJ4aca2k9AZb74bHMhE6qhIa60SRhxLT?=
 =?iso-8859-1?Q?5VsZZq2xHqCxlvvc1ONZnZJdWpYvwU3oeWn+JcA43LiCBoXRovDyf3HZOf?=
 =?iso-8859-1?Q?8CugB4ar1LjB8WBy5c5hdGdF7pe3iyVKiUZs1I6ihCfLkivHX7iWH2ntl1?=
 =?iso-8859-1?Q?lOnyeH4hNhjhfvadyivJZWy7m0diPmVnYwo+3GZTEY6NhFjujRWAAd+3Qv?=
 =?iso-8859-1?Q?7i/HtFlKQqic4OLAQc7u6IelzGzrnQwAT8Wm1kKIEX47bbAn69vaLSZdjz?=
 =?iso-8859-1?Q?HqGgqmTWflTl0k1Cavn+d3zgY5sfDiW40K5rdNMyxQMsuZDsWKE+YqwxQu?=
 =?iso-8859-1?Q?v4kp+MvhfGTLVlc5oInmBamYmY2po9M89cafERUcE6fAXkh4atrktgAujU?=
 =?iso-8859-1?Q?p4QxY/buffS9YbHz1NrSl4fmLBYZHjlxY+12mRcGW+/dV6kRP4tqYTolVm?=
 =?iso-8859-1?Q?43B87oT3tHgUsTmcItUXHIj5kh5Vkq1QPnnm0yWeo+EO+J/l4flJKJ+cTu?=
 =?iso-8859-1?Q?OKvTyjgAAtv5gJkXL2gAyWZ6G6/CNa620MB3Ud9bJEeDkoUXXsE9H94aiP?=
 =?iso-8859-1?Q?jud5d60sES68QIvo+ZdOaL2FPTwCpsAtRA9wZJSj3zb20GT4dMSa9wrcr3?=
 =?iso-8859-1?Q?ZMwvhujiHX7SoFrJa8xARDCHXqPsgyyRecVgA8K+ncwcasgTx1puz6Utfx?=
 =?iso-8859-1?Q?+qOnwkP5i6p+FeZM7euOE9OIBTyQUHQMmHH7OtxYk9aNUCAVdFJbDzHxRO?=
 =?iso-8859-1?Q?odK8NSTgMsl6low9bW8tveTJXoiboI2RHKXaFNSkyLw6CUsGwzlu8SxmX2?=
 =?iso-8859-1?Q?X7H/HnGCojtiXKjHI059G3w3SP/viKzR7JsiVMvghGqJon45z8NrkySr25?=
 =?iso-8859-1?Q?WHqsIK1cNoPq9vjmXoMso7xVuYPQuOuKeLAnzc3ScGWOHrDsn4rcEFgMFC?=
 =?iso-8859-1?Q?F2l4j7RBSGJirXFjQ8o5kODHHkCtwWIW2jkSH8Fz3XY/ce8QCN65mtip6M?=
 =?iso-8859-1?Q?5OrJzvlAC2jrzqaSY+UNlhGIqUzzuiBCZ2UNTKK0LTXnQzdDn3EdTZuDmw?=
 =?iso-8859-1?Q?Jgv7GTffqhj8jD7CIl+ZQ4tq2EP7x5mKGTM+MkYxk5jN2Rk3TsDqg3nn7I?=
 =?iso-8859-1?Q?Z7m4vigkWWyPA7q1R/jQ7ePRg844MzvHS6VoFHpH8NQq01KA4HzgfYcZHZ?=
 =?iso-8859-1?Q?xkNCnJ6h9L4R6TORNcpHe/XmxzAViUnv1ergx822snPC/SwZvcnymFysjD?=
 =?iso-8859-1?Q?IJiLUreYvSAwTO/anAfOUxKKmB/dDel7Mbmi3XM4fILZ1vnhIE7lnt6d8G?=
 =?iso-8859-1?Q?zkdwWjgynmoL+gBUKUZogoFI6ZFbbfeZSDorlifUH3Mg5I7OGLiRE5ksRC?=
 =?iso-8859-1?Q?b4wpOds51ny9VNsHObEoqeEIpo5jXSeIo/ZGB3ov9M7mq985NWNfo0zmG7?=
 =?iso-8859-1?Q?vNucDKz+MFdQ4rKGlDSCzxIiLcWX52iPRwcNx34M+tbD7LY22RCQaZqVm8?=
 =?iso-8859-1?Q?0W8OYZrLb5+ntX7+EOMdzRjAi46BCsztTb2IqJ1QGiG5+gkiClQQ9Al1dD?=
 =?iso-8859-1?Q?rNez4a5CI1OYfL9bcM5xPU9zDmjzsXn+E4KPNg7KaP2VNLV5spY9+UNDyT?=
 =?iso-8859-1?Q?Qr8+rQ9q7Bal+OfwsNFzqsoiCYeq+ygTKqL3XrzCvLtBiPwKP+pIH9PCGf?=
 =?iso-8859-1?Q?tgfn0SL0Nw52g+gG7gI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae908470-7a49-45d7-c36a-08ddde187361
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 05:31:15.5941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4rljHcyBBvnMc2KbXxIWvuTItiyI9xobfyBjR50r0knG7M3oVxHeSzbqTQHIadOjk4L4Kqnh6/IGrrCEifR8rxA7gfxJRaITvPILVGeOdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5965
X-OriginatorOrg: intel.com

Hi and thanks for looking at the patches :)

On 2025-08-14 at 10:15:09 +0300, Mike Rapoport wrote:
>On Tue, Aug 12, 2025 at 03:23:42PM +0200, Maciej Wieczor-Retman wrote:
>> Any place where pointer arithmetic is used to convert a virtual address
>> into a physical one can raise errors if the virtual address is tagged.
>> 
>> Reset the pointer's tag by sign extending the tag bits in macros that do
>> pointer arithmetic in address conversions. There will be no change in
>> compiled code with KASAN disabled since the compiler will optimize the
>> __tag_reset() out.
>> 
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v4:
>> - Simplify page_to_virt() by removing pointless casts.
>> - Remove change in __is_canonical_address() because it's taken care of
>>   in a later patch due to a LAM compatible definition of canonical.
>> 
>>  arch/x86/include/asm/page.h    | 14 +++++++++++---
>>  arch/x86/include/asm/page_64.h |  2 +-
>>  arch/x86/mm/physaddr.c         |  1 +
>>  3 files changed, 13 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
>> index 9265f2fca99a..15c95e96fd15 100644
>> --- a/arch/x86/include/asm/page.h
>> +++ b/arch/x86/include/asm/page.h
>> @@ -7,6 +7,7 @@
>>  #ifdef __KERNEL__
>>  
>>  #include <asm/page_types.h>
>> +#include <asm/kasan.h>
>>  
>>  #ifdef CONFIG_X86_64
>>  #include <asm/page_64.h>
>> @@ -41,7 +42,7 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
>>  #define __pa(x)		__phys_addr((unsigned long)(x))
>>  #endif
>>  
>> -#define __pa_nodebug(x)	__phys_addr_nodebug((unsigned long)(x))
>> +#define __pa_nodebug(x)	__phys_addr_nodebug((unsigned long)(__tag_reset(x)))
>
>Why not reset the tag inside __phys_addr_nodebug() and __phys_addr()?

Right, this should be one less line in the changelog and no behavior changes.
I'll fix it.

>
>>  /* __pa_symbol should be used for C visible symbols.
>>     This seems to be the official gcc blessed way to do such arithmetic. */
>>  /*
>> @@ -65,9 +66,16 @@ static inline void copy_user_page(void *to, void *from, unsigned long vaddr,
>>   * virt_to_page(kaddr) returns a valid pointer if and only if
>>   * virt_addr_valid(kaddr) returns true.
>>   */
>> -#define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
>> +
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +#define page_to_virt(x) ({							\
>> +	void *__addr = __va(page_to_pfn((struct page *)x) << PAGE_SHIFT);	\
>> +	__tag_set(__addr, page_kasan_tag(x));					\
>> +})
>> +#endif
>> +#define virt_to_page(kaddr)	pfn_to_page(__pa((void *)__tag_reset(kaddr)) >> PAGE_SHIFT)
>
>then virt_to_page() will remain the same, no?

Oh, yes, that is redundant with __pa() resetting the tag. Thanks!

>
>>  extern bool __virt_addr_valid(unsigned long kaddr);
>> -#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long) (kaddr))
>> +#define virt_addr_valid(kaddr)	__virt_addr_valid((unsigned long)(__tag_reset(kaddr)))
>
>The same here, I think tag_reset() should be inside __virt_addr_valid()

Sure, that does sound better.

>  
>>  static __always_inline void *pfn_to_kaddr(unsigned long pfn)
>>  {
>> diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
>> index 015d23f3e01f..de68ac40dba2 100644
>> --- a/arch/x86/include/asm/page_64.h
>> +++ b/arch/x86/include/asm/page_64.h
>> @@ -33,7 +33,7 @@ static __always_inline unsigned long __phys_addr_nodebug(unsigned long x)
>>  extern unsigned long __phys_addr(unsigned long);
>>  extern unsigned long __phys_addr_symbol(unsigned long);
>>  #else
>> -#define __phys_addr(x)		__phys_addr_nodebug(x)
>> +#define __phys_addr(x)		__phys_addr_nodebug(__tag_reset(x))
>>  #define __phys_addr_symbol(x) \
>>  	((unsigned long)(x) - __START_KERNEL_map + phys_base)
>>  #endif
>> diff --git a/arch/x86/mm/physaddr.c b/arch/x86/mm/physaddr.c
>> index fc3f3d3e2ef2..7f2b11308245 100644
>> --- a/arch/x86/mm/physaddr.c
>> +++ b/arch/x86/mm/physaddr.c
>> @@ -14,6 +14,7 @@
>>  #ifdef CONFIG_DEBUG_VIRTUAL
>>  unsigned long __phys_addr(unsigned long x)
>>  {
>> +	x = __tag_reset(x);
>>  	unsigned long y = x - __START_KERNEL_map;
>>  
>>  	/* use the carry flag to determine if x was < __START_KERNEL_map */
>> -- 
>> 2.50.1
>> 
>
>-- 
>Sincerely yours,
>Mike.

-- 
Kind regards
Maciej Wieczór-Retman

