Return-Path: <linux-kbuild+bounces-8820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 425F1B57046
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 08:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED86F16AAC9
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Sep 2025 06:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D14281509;
	Mon, 15 Sep 2025 06:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xws4c1Jx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D35228135D;
	Mon, 15 Sep 2025 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757917821; cv=fail; b=SdTKdYAdVmakcQ02rrIuZMK/s8gQ7K0OLkltd2VqdfPAgTpzy4QSoxUin4u3tTmgcwkauNhUUMbOHLNM7KGZmkTJ7uea7fBnk2fqTgnwRFPT11NcJlt9/tzBrilWi7sn/U1E32t1UCaNGMYGO1qOgQx1Ai4dvL2t3iaEeKoe0RU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757917821; c=relaxed/simple;
	bh=zgkkU30es4AqbIliqf6Vr5BTbE3VP7ZJZN4pAfbcU5Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t86UiJxhyBemIgqBigfCQGWAnK6PaEgw/2w3iHBrtkNU3OqgLWWwN7VWGlyH7MpcTWp/dMLVJlj9nJS27QAi+sTesEYTnqjKjEW9K265fzvBpgzxvmIQxZQXmplpJ2R6m7kTSu9K5B5VaH39aGwH3QQA7T1yh9dFtRvTyWAatR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xws4c1Jx; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757917820; x=1789453820;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zgkkU30es4AqbIliqf6Vr5BTbE3VP7ZJZN4pAfbcU5Q=;
  b=Xws4c1JxPjoiYaLagAr3yC/PXVKivZd31kL+xLBMW2mCcgr4O9gvGwFX
   12arvkPW+rQzjBffEAUbK1VY0mvsh3sSn9M6NrpCb4uxHFAI4F7qSfCgB
   i/yPbP8pQH9fw7ARk1nioY5dlIGGlFwkdBVXrRf4pUU1E9azXUQ2gJHDD
   lOg0qkgMPSXoYJKneN7sMmnKzoHyxvwRq8qQSvbci6GfRvaXfZm4GlBUN
   XDoHMFnvJ+9zDESuUpTbyHZnlT1qZfvtYc2frKEXD1zwYeZvF+m+kDZ/y
   UuywNYarAqGJQSuPSEgMlRXgvc9WKijXUGraRM6B/pj4NnKrFH8thsW9v
   A==;
X-CSE-ConnectionGUID: 8cZLVSgoR2abRnmexolaGQ==
X-CSE-MsgGUID: o0V+WzEJTDmIl0eoLKhPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60230145"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="60230145"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 23:30:18 -0700
X-CSE-ConnectionGUID: YPglaXiURLK6IxonNNhCfQ==
X-CSE-MsgGUID: nB3x1XHNQE2CjfwXGdNYTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="198241415"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 23:30:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 14 Sep 2025 23:30:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 14 Sep 2025 23:30:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 14 Sep 2025 23:30:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3t7kk65Y6E8vFhxKslXk3sdNP6ESmMa0JADIQSOzctMIWaruRfJ9taCWI95I/3knHA24542spqvGBIILk1nEW4+41NWArMHAg0EHJYIdGG8GAI7xr4SpvYaNlf4mbm+u+frpXbvdFc9ESudVA7r210yz9K60TJkZUpq8X/sYssZStU3r7pdqFw9hR7xKc5pQJNhTG1WkyYDY+HmhlLgFqAejVOkATNGN8KXFzjdBepUBL255HM7FfbLb0KMPVlsKP+COKK/bX0bM17raG9B5LQuN3td+dcWjz+hsZlkBzZo5nAXTFxo2EVggV0AgPawaedY6q6fgxs2X0xXS2iB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AExyNjVYALH6TiM2+t8GjqYXFikYOQFQ4NWAMXH/ENw=;
 b=MLQHysb623guZYf/K18yztGGZRBQ5K/gtLTOmTIfBpsUXdc3aUV6hEuLDozAB00W8+LlxDV9v5AcO/WBl2vxZTWJlMAfVXVC19hpDxWB5+t1a+FEozY7MSqdpHFFhh1UNyUOZJTjFsJZuDcbcFV4ln6FfpWImj3vIpNGn1UaBvVozx2pB8rSFq8j8LiLsxYby/fZAs9TprgiFCG0WCQO8gY9gVaHZw5Bq+v/q5fcz3O0ww5nfRxVYDFzKNNODlQJfYij0RRBwXqONovdX+pBQhc+mAi23tcerWE4+R/K2LnHsI2GzIL8ogRQCormeFXA7Mgq9lIuhR3nByMRMYGEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 06:30:12 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 06:30:12 +0000
Date: Mon, 15 Sep 2025 08:29:56 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Baoquan He <bhe@redhat.com>
CC: <andreyknvl@gmail.com>, <sohil.mehta@intel.com>, <baohua@kernel.org>,
	<david@redhat.com>, <kbingham@kernel.org>, <weixugc@google.com>,
	<Liam.Howlett@oracle.com>, <alexandre.chartre@oracle.com>, <kas@kernel.org>,
	<mark.rutland@arm.com>, <trintaeoitogc@gmail.com>,
	<axelrasmussen@google.com>, <yuanchu@google.com>, <joey.gouly@arm.com>,
	<samitolvanen@google.com>, <joel.granados@kernel.org>, <graf@amazon.com>,
	<vincenzo.frascino@arm.com>, <kees@kernel.org>, <ardb@kernel.org>,
	<thiago.bauermann@linaro.org>, <glider@google.com>, <thuth@redhat.com>,
	<kuan-ying.lee@canonical.com>, <pasha.tatashin@soleen.com>,
	<nick.desaulniers+lkml@gmail.com>, <vbabka@suse.cz>,
	<kaleshsingh@google.com>, <justinstitt@google.com>,
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
Subject: Re: [PATCH v5 17/19] mm: Unpoison pcpu chunks with base address tag
Message-ID: <ad4qcnuis25tqf3c2is7x2bywgiwhz57mvyrzno2qqwczaofx4@vyehydc4slfv>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <bcf18f220ef3b40e02f489fdb90fc7a5a153a383.1756151769.git.maciej.wieczor-retman@intel.com>
 <aMUrW1Znp1GEj7St@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMUrW1Znp1GEj7St@MiWiFi-R3L-srv>
X-ClientProxiedBy: DU7P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::35) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|PH0PR11MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: b30f52d3-9e80-4ddb-defe-08ddf42152b9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OuuNNUkgS8ym/4YAYfE1XoJ9lYrDcS2GVwn1FEs+XeNvNxBp5jm+mQTJ1A?=
 =?iso-8859-1?Q?0fYTiUXsDr/42Cw3WdyOUi+CPkI90xbvJ2KT4Ojjj6EuvfQAanMlQ5mH84?=
 =?iso-8859-1?Q?b8vga5hXO4cluAwIHm+g6E4T9zofX1R1zOCBdjwaQk3LFMcUsEkfI8/dsS?=
 =?iso-8859-1?Q?MQkxijTBzY2AsMhcDt+mv7L3q6V0ocKi+PeyTt8l1bYvF3QW8uS7AdEHlM?=
 =?iso-8859-1?Q?I/31jSJne1uh8ObcOa3xGCIaDVgNm4qlKR4hWyQ5f8RcMH8nMfR5O5GQme?=
 =?iso-8859-1?Q?NZom5BUFgmdQq+2nn1HsWRS6UNiUifwXR8awxTr0rE0LDg3PlC6aj3LM6p?=
 =?iso-8859-1?Q?iD0nHo+TvNB5YfAQW/MPweOM7bo2XKCT3H4TgdjcjAzu0ujl5UEZ0vCbo+?=
 =?iso-8859-1?Q?HRcQcWrv7xPH7wrhbihE8xhtGBp5rDu0RD+tTXuRcKGTPQolwttpt3ehip?=
 =?iso-8859-1?Q?aKD0z4ZMviRbHQRl/EZMw5zJ5qU9zeeAaO5EW9fR8drEeUf+RnUVeBJIne?=
 =?iso-8859-1?Q?Ith63KayxkDH1pZdsmWqpTraff+IQwyn7iG3EPw22n+fEsiOv5VHSHw2wt?=
 =?iso-8859-1?Q?x5026mr2LN8l3MpAnUSBW5bMNqOVUpxhggH1f6TZXE8nw9NinvT4TNiDFO?=
 =?iso-8859-1?Q?myVnt2mlHspUqw8EUfLtqtoL76YoJ/1ta7ZqERIWB/2xfTmKS3k9mc0MVj?=
 =?iso-8859-1?Q?mXS6LLDTgSD2QuTeDOG4kyZXJv7Gn73VCu0smVYe8ryVeSm7sFFtN1Ylb+?=
 =?iso-8859-1?Q?nnLPyPU79YM+umLqoalmYsv4Tucb0Ivlspiy8aJH/KkFPWRI1/8yox5B3C?=
 =?iso-8859-1?Q?XlQc/PR3+oGUAluCC3zzX7RkWcrjgH4qI9/C0dWCn+/kRqwhinRYbh10Ok?=
 =?iso-8859-1?Q?2lw/XjsSEI0eG/IaXtg+ibl9EVeSi/Ugf34LDC+Mge5EcmnehXifhOUkNd?=
 =?iso-8859-1?Q?gUvh4FC3qpGtf62ao0SPoyTGYXH39RnDlZs6+hUvebMipWdB9Z6oi79Xrk?=
 =?iso-8859-1?Q?y7DLy62aLrWUgGxUSV8CTaqm14RlcptDjooAnEbcOgtbctFYJVXrosgP8+?=
 =?iso-8859-1?Q?q1JhpH25QCWqgh7LGfrdZXVwodD9svN0f8k5fs0IJimf174hTfJC7iLNjx?=
 =?iso-8859-1?Q?VyU+cbk5YuucwUp4yWrm1ryt6NXBxmiKVezhzk3AzONBFl6nWdNIWPSuD0?=
 =?iso-8859-1?Q?6vhFOxjMlnUu1cTK3NpinV98g1wMlZrG0yeifWwnXF1/5dpm2mVbSgg140?=
 =?iso-8859-1?Q?wwAywqBNUaiUzXGyoolXnR8V6qm7sGVw6cDVlDHwT/FcRoQLAUSIrsbZm0?=
 =?iso-8859-1?Q?WDBxUI9LBfat/+1XB3IrjCWn48EGpXkMawMvYIHj/D6gu4m9DkjQojj8b6?=
 =?iso-8859-1?Q?y8AreuW6e/XnRcZX8iscKLJmcWZjHI98RJtZoAIRIEBZHBYGPXkEQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uX3h2UAj7R639aOiNaoMOriZEE61QYfTyEGhJGpRXSv4G8UzeFcuzWhtby?=
 =?iso-8859-1?Q?yGViFvQKz6Qg4+cQoI9lC3L4yCxfoKVwnX8ZhmKkwurZDUmDP5z1mfm84F?=
 =?iso-8859-1?Q?UVgLATmWIb/hPYGrc5/Esjbb+FbaNG9vqICYUxWhcR2ihAI9auBBrWsuDZ?=
 =?iso-8859-1?Q?t0n/+buJH+Pe5FZKjMIcHPRt4EBY4FPGy4iLfa/LWOzF/lvtdT53XRAank?=
 =?iso-8859-1?Q?tvswFhrkJUtOuK5yn+dcYqLg0H7zOMjzSSbIlLPbBFGFcS+N2B2/OD4Vix?=
 =?iso-8859-1?Q?2LLD+I5VUBZGQsanD7M1eWJ/nByXgDtffsXvNfCYZ1UH6mS/YGZphFRGBX?=
 =?iso-8859-1?Q?8+Xt+ZIyinorg2aPpd9lXIE3pxbRdfzB2LhMvzIMs7fQyFndvy7GlA2crI?=
 =?iso-8859-1?Q?8zvj8o7+zCwUPoiGdKHq+Pj5yrf4wVuYm1wx3fPECCTKsICoQwxbiL6w+/?=
 =?iso-8859-1?Q?mh4JzP2oEFjkh6jk8m/jV6KGXaNB+8NHhZx8P63XENdBXvgBiZAZItePBX?=
 =?iso-8859-1?Q?ZJ8ecG0VNOZlIPYZ2TCSzqfK5N5n1Z4rbjlgbcUSDkuxc4UrEfzkoYq7n6?=
 =?iso-8859-1?Q?oUHKeL8XNMUX6GSF8kWg4wo0l8SMaq5BmNw3ThODpRvR6qw7svrxe5MM/F?=
 =?iso-8859-1?Q?07kNRedQUPhYgqdKUfeQ9em01a2Thvh7nZGuuInCLP/UqMCtyhMMvu89YU?=
 =?iso-8859-1?Q?w3LJ/ltYYrGZMr9b9wMx3z3lUcQHm9dtgz7fbRgd5mEtIsSP2r3b7tWz6e?=
 =?iso-8859-1?Q?FGgzqI8qylIg9afMDIRs4gik1oIaEKmigYSVwwj+DDeGozW/SfoixcjD+E?=
 =?iso-8859-1?Q?khP0G9k+fX4ftLAhnEWNXqDTqw446LZIet+0gYFMUNqWRDg6hTnJXRN1rc?=
 =?iso-8859-1?Q?3L/QgZT+RhQxja5gi5PYTFOlW1ahECbnn+YgygrlCxsn092afbW4ai3Kju?=
 =?iso-8859-1?Q?Iwaah8jZO4axHD8boI/wqrPL09A6vLL4rv1ZhUr9BhZ764VxNR0WhnmOyP?=
 =?iso-8859-1?Q?fUskYUfLuZVuCNBCgJ0hGK2JM3lSu6lcUwE7kV08eR6W0AsOEqHn30jcmj?=
 =?iso-8859-1?Q?KfOzGlRB1dpAcfVbXbxuQlXwH4G8AtrEGbHMXXmeaaNFv7APqk3fdJGWKb?=
 =?iso-8859-1?Q?lo/vEvw++SkbE7W+PNLguotnyX5Q6Fp56ITKZSDYd732elqWlom202/MXa?=
 =?iso-8859-1?Q?u/sg13+9A7I1MJ274wJLUa/LW/e0FG0Ap0Tz81yeiC6OJIrOb0DFaW1uJT?=
 =?iso-8859-1?Q?ueJeCTrOf/6/TLAf+I1VL6OTVA51wgiGnFn+ED5PG5UWSUYtyPiuEwbvAT?=
 =?iso-8859-1?Q?cUfRUjdjtueFFy19tMz4tUY++9xzBVLSqzYDpKPk6giWg2li3fMlPFSRCe?=
 =?iso-8859-1?Q?88AJvHblEQUxDStJB0c2iegImeUFiF0QPj0GylthjDClqfwOP/HV9uQdEw?=
 =?iso-8859-1?Q?TRZZO5FmAHaaBvMG6gZcdwA3v6gdCvfLWmBFo+yidOurZhDFWCVweaH9tH?=
 =?iso-8859-1?Q?DMdqjGKb5GwKPtMdjO5jRPdFaGiB/u0SFn+l44+PlAO2BVqEmVfN5EVWfI?=
 =?iso-8859-1?Q?2pRlGADPE1mo8ZEGNIeo8pRpVECHtftTkBUpE6TqVIC+BRoU0NhMUVn98m?=
 =?iso-8859-1?Q?pr9xrQ2EO6c9t5HAhseVPh9X1hjRBFlvdegz2VmwgFRswb+D4h1no4J+rL?=
 =?iso-8859-1?Q?tZLQX8ToDjb2vg165hY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b30f52d3-9e80-4ddb-defe-08ddf42152b9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 06:30:11.9099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7DY98IZy5VWHfdespKMhAd1SC9r54ga1l+JU2dF99LGRGsMKGglS9b5MHGfCFMgkHABhMfHpapeL2YX5BSly06X5tV07cXbKjeQd3Qcmwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
X-OriginatorOrg: intel.com

Thanks for testing the series! And I'm happy the fix was useful :)

On 2025-09-13 at 16:29:15 +0800, Baoquan He wrote:
>Hi ,
>
>On 08/25/25 at 10:24pm, Maciej Wieczor-Retman wrote:
>> The problem presented here is related to NUMA systems and tag-based
>> KASAN mode. It can be explained in the following points:
>> 
>> 	1. There can be more than one virtual memory chunk.
>> 	2. Chunk's base address has a tag.
>> 	3. The base address points at the first chunk and thus inherits
>> 	   the tag of the first chunk.
>> 	4. The subsequent chunks will be accessed with the tag from the
>> 	   first chunk.
>> 	5. Thus, the subsequent chunks need to have their tag set to
>> 	   match that of the first chunk.
>> 
>> Refactor code by moving it into a helper in preparation for the actual
>> fix.
>
>I got a boot breakage on a hpe-apollo arm64 system with sw_tags mode, and
>the boot breakage can be met stably. The detailed situation is reported
>in below link:
>
>System is broken in KASAN sw_tags mode during bootup
>https://lore.kernel.org/all/aKMLgHdTOEf9B92E@MiWiFi-R3L-srv/T/#u
>
>After applying this patch 17 and patch 18 in this series, I can confirm
>the breakage is gone. Thanks for the great fix, and please feel free to
>add:
>
>Tested-by: Baoquan He <bhe@redhat.com>
>
>========================
>CONFIG_KASAN=y
>CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
># CONFIG_KASAN_GENERIC is not set
>CONFIG_KASAN_SW_TAGS=y
># CONFIG_KASAN_HW_TAGS is not set
># CONFIG_KASAN_OUTLINE is not set
>CONFIG_KASAN_INLINE=y
>CONFIG_KASAN_STACK=y
>CONFIG_KASAN_VMALLOC=y
>CONFIG_KASAN_KUNIT_TEST=m
>================================
>
>[  100.907469] ==================================================================
>[  100.907485] BUG: KASAN: invalid-access in pcpu_alloc_noprof+0x42c/0x9a8
>[  100.907509] Write of size 160 at addr 10fffd7fbdc00000 by task systemd/1
>[  100.907524] Pointer tag: [10], memory tag: [5b]
>[  100.907532]
>[  100.907544] CPU: 229 UID: 0 PID: 1 Comm: systemd Not tainted 6.16.0+ #2 PREEMPT(voluntary)
>[  100.907562] Hardware name: HPE Apollo 70             /C01_APACHE_MB         , BIOS L50_5.13_1.16 07/29/2020
>[  100.907571] Call trace:
>[  100.907578]  show_stack+0x30/0x98 (C)
>[  100.907597]  dump_stack_lvl+0x7c/0xa0
>[  100.907614]  print_address_description.isra.0+0x90/0x2b8
>[  100.907635]  print_report+0x120/0x208
>[  100.907651]  kasan_report+0xc8/0x110
>[  100.907669]  kasan_check_range+0x80/0xa0
>[  100.907685]  __asan_memset+0x30/0x68
>[  100.907700]  pcpu_alloc_noprof+0x42c/0x9a8
>[  100.907716]  css_rstat_init+0x1bc/0x220
>[  100.907734]  cgroup_create+0x188/0x540
>[  100.907749]  cgroup_mkdir+0xb4/0x330
>[  100.907765]  kernfs_iop_mkdir+0xb0/0x120
>[  100.907783]  vfs_mkdir+0x250/0x380
>[  100.907800]  do_mkdirat+0x254/0x298
>[  100.907815]  __arm64_sys_mkdirat+0x80/0xc0
>[  100.907831]  invoke_syscall.constprop.0+0x88/0x148
>[  100.907848]  el0_svc_common.constprop.0+0x78/0x148
>[  100.907863]  do_el0_svc+0x38/0x50
>[  100.907877]  el0_svc+0x3c/0x160
>[  100.907895]  el0t_64_sync_handler+0x10c/0x138
>[  100.907911]  el0t_64_sync+0x1b0/0x1b8
>[  100.907925]
>[  100.907931] The buggy address belongs to a 0-page vmalloc region starting at 0x5bfffd7fbdc00000 allocated at pcpu_get_vm_areas+0x0/0x1da8
>[  100.907963] The buggy address belongs to the physical page:
>[  100.907970] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x8811a35
>[  100.907984] flags: 0xa6a00000000000(node=1|zone=2|kasantag=0x6a)
>[  100.908006] raw: 00a6a00000000000 0000000000000000 dead000000000122 0000000000000000
>[  100.908019] raw: 0000000000000000 b4ff00878bce6400 00000001ffffffff 0000000000000000
>[  100.908029] raw: 00000000000fffff 0000000000000000
>[  100.908037] page dumped because: kasan: bad access detected
>[  100.908044]
>[  100.908048] Memory state around the buggy address:
>[  100.908059] Unable to handle kernel paging request at virtual address ffff7fd7fbdbffe0
>[  100.908068] KASAN: probably wild-memory-access in range [0xfffffd7fbdbffe00-0xfffffd7fbdbffe0f]
>[  100.908078] Mem abort info:
>[  100.908083]   ESR = 0x0000000096000007
>[  100.908089]   EC = 0x25: DABT (current EL), IL = 32 bits
>[  100.908098]   SET = 0, FnV = 0
>[  100.908105]   EA = 0, S1PTW = 0
>[  100.908111]   FSC = 0x07: level 3 translation fault
>[  100.908118] Data abort info:
>[  100.908123]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
>[  100.908130]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>[  100.908138]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>[  100.908147] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000008ff8b76000
>[  100.908156] [ffff7fd7fbdbffe0] pgd=1000008ff0299403, p4d=1000008ff0299403, pud=1000008ff0298403, pmd=1000008811a17403, pte=0000000000000000
>[  100.908192] Internal error: Oops: 0000000096000007 [#1]  SMP
>[  101.185060] Modules linked in: i2c_dev
>[  101.188820] CPU: 229 UID: 0 PID: 1 Comm: systemd Not tainted 6.16.0+ #2 PREEMPT(voluntary)
>[  101.197175] Hardware name: HPE Apollo 70             /C01_APACHE_MB         , BIOS L50_5.13_1.16 07/29/2020
>[  101.206912] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>[  101.213877] pc : __pi_memcpy_generic+0x24/0x230
>[  101.218418] lr : kasan_metadata_fetch_row+0x20/0x30
>[  101.223299] sp : ffff8000859b7700
>[  101.226610] x29: ffff8000859b7700 x28: 0000000000000100 x27: ffff008ec6291800
>[  101.233758] x26: 00000000000000a0 x25: 0000000000000000 x24: fffffd7fbdbfff00
>[  101.240904] x23: ffff8000826b1e58 x22: fffffd7fbdc00000 x21: 00000000fffffffe
>[  101.248051] x20: ffff800082669d18 x19: fffffd7fbdbffe00 x18: 0000000000000000
>[  101.255196] x17: 3030303030303030 x16: 2066666666666666 x15: 6631303030303030
>[  101.262342] x14: 0000000000000001 x13: 0000000000000001 x12: 0000000000000001
>[  101.269487] x11: 687420646e756f72 x10: 0000000000000020 x9 : 0000000000000000
>[  101.276633] x8 : ffff78000859b76a x7 : 0000000000000000 x6 : 000000000000003a
>[  101.283778] x5 : ffff8000859b7768 x4 : ffff7fd7fbdbfff0 x3 : efff800000000000
>[  101.290924] x2 : 0000000000000010 x1 : ffff7fd7fbdbffe0 x0 : ffff8000859b7758
>[  101.298070] Call trace:
>[  101.300512]  __pi_memcpy_generic+0x24/0x230 (P)
>[  101.305051]  print_report+0x180/0x208
>[  101.308719]  kasan_report+0xc8/0x110
>[  101.312299]  kasan_check_range+0x80/0xa0
>[  101.316227]  __asan_memset+0x30/0x68
>[  101.319807]  pcpu_alloc_noprof+0x42c/0x9a8
>[  101.323908]  css_rstat_init+0x1bc/0x220
>[  101.327749]  cgroup_create+0x188/0x540
>[  101.331502]  cgroup_mkdir+0xb4/0x330
>[  101.335082]  kernfs_iop_mkdir+0xb0/0x120
>[  101.339011]  vfs_mkdir+0x250/0x380
>[  101.342416]  do_mkdirat+0x254/0x298
>[  101.345908]  __arm64_sys_mkdirat+0x80/0xc0
>[  101.350008]  invoke_syscall.constprop.0+0x88/0x148
>[  101.354803]  el0_svc_common.constprop.0+0x78/0x148
>[  101.359598]  do_el0_svc+0x38/0x50
>[  101.362916]  el0_svc+0x3c/0x160
>[  101.366061]  el0t_64_sync_handler+0x10c/0x138
>[  101.370423]  el0t_64_sync+0x1b0/0x1b8
>[  101.374095] Code: f100805f 540003c8 f100405f 540000c3 (a9401c26)
>[  101.380187] ---[ end trace 0000000000000000 ]---
>[  101.384802] note: systemd[1] ex
>** replaying previous printk message **
>
>
>> 
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v4:
>> - Redo the patch message numbered list.
>> - Do the refactoring in this patch and move additions to the next new
>>   one.
>> 
>> Changelog v3:
>> - Remove last version of this patch that just resets the tag on
>>   base_addr and add this patch that unpoisons all areas with the same
>>   tag instead.
>> 
>>  include/linux/kasan.h | 10 ++++++++++
>>  mm/kasan/hw_tags.c    | 11 +++++++++++
>>  mm/kasan/shadow.c     | 10 ++++++++++
>>  mm/vmalloc.c          |  4 +---
>>  4 files changed, 32 insertions(+), 3 deletions(-)
>> 
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index 7a2527794549..3ec432d7df9a 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -613,6 +613,13 @@ static __always_inline void kasan_poison_vmalloc(const void *start,
>>  		__kasan_poison_vmalloc(start, size);
>>  }
>>  
>> +void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms);
>> +static __always_inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{
>> +	if (kasan_enabled())
>> +		__kasan_unpoison_vmap_areas(vms, nr_vms);
>> +}
>> +
>>  #else /* CONFIG_KASAN_VMALLOC */
>>  
>>  static inline void kasan_populate_early_vm_area_shadow(void *start,
>> @@ -637,6 +644,9 @@ static inline void *kasan_unpoison_vmalloc(const void *start,
>>  static inline void kasan_poison_vmalloc(const void *start, unsigned long size)
>>  { }
>>  
>> +static inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{ }
>> +
>>  #endif /* CONFIG_KASAN_VMALLOC */
>>  
>>  #if (defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)) && \
>> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
>> index 9a6927394b54..1f569df313c3 100644
>> --- a/mm/kasan/hw_tags.c
>> +++ b/mm/kasan/hw_tags.c
>> @@ -382,6 +382,17 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size)
>>  	 */
>>  }
>>  
>> +void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{
>> +	int area;
>> +
>> +	for (area = 0 ; area < nr_vms ; area++) {
>> +		vms[area]->addr = __kasan_unpoison_vmalloc(
>> +			vms[area]->addr, vms[area]->size,
>> +			KASAN_VMALLOC_PROT_NORMAL);
>> +	}
>> +}
>> +
>>  #endif
>>  
>>  void kasan_enable_hw_tags(void)
>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>> index d2c70cd2afb1..b41f74d68916 100644
>> --- a/mm/kasan/shadow.c
>> +++ b/mm/kasan/shadow.c
>> @@ -646,6 +646,16 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size)
>>  	kasan_poison(start, size, KASAN_VMALLOC_INVALID, false);
>>  }
>>  
>> +void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>> +{
>> +	int area;
>> +
>> +	for (area = 0 ; area < nr_vms ; area++) {
>> +		kasan_poison(vms[area]->addr, vms[area]->size,
>> +			     arch_kasan_get_tag(vms[area]->addr), false);
>> +	}
>> +}
>> +
>>  #else /* CONFIG_KASAN_VMALLOC */
>>  
>>  int kasan_alloc_module_shadow(void *addr, size_t size, gfp_t gfp_mask)
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index c93893fb8dd4..00be0abcaf60 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -4847,9 +4847,7 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>>  	 * With hardware tag-based KASAN, marking is skipped for
>>  	 * non-VM_ALLOC mappings, see __kasan_unpoison_vmalloc().
>>  	 */
>> -	for (area = 0; area < nr_vms; area++)
>> -		vms[area]->addr = kasan_unpoison_vmalloc(vms[area]->addr,
>> -				vms[area]->size, KASAN_VMALLOC_PROT_NORMAL);
>> +	kasan_unpoison_vmap_areas(vms, nr_vms);
>>  
>>  	kfree(vas);
>>  	return vms;
>> -- 
>> 2.50.1
>> 
>> 
>

-- 
Kind regards
Maciej Wieczór-Retman

