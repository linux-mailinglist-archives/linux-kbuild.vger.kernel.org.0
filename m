Return-Path: <linux-kbuild+bounces-8760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEFB4873A
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 10:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCF70169874
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 08:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D2C1FFC59;
	Mon,  8 Sep 2025 08:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4PlqSs3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A154C1531C8;
	Mon,  8 Sep 2025 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320299; cv=fail; b=lm/6n/YnBRiA4Euw+38M709PQ6fbO4tP7IJEuoyx4QThiSiEuCaAypjlsi83big/bHZKy6JvRPRlpFygJfgKh6+yFFVvvglAJUkbazTqzv418Rd0rEWDRFfBfKkdgp5v29cs93FYl//DRmIvDmiadMiSFKmALN1EbsNGbO81toI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320299; c=relaxed/simple;
	bh=uwgeobY1LOwNR6e+V0U1HjKmCsOclKaJp7hdOiNJXlc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rJdab+PuhXz4tz1mA4cSOdZHt1StexwqoxH9PfvcPafyY0IL/rca4Wz9j3/WQwv6RcxIYJQaIl2bs6J5q2LGtqQQ4hMIWwEbO5zcz3JPaafuln6DT62ks6Ei74ZmNb/yZaCKtT28CkOQjD1RBVeIfAYTFwfoQQ1Pv6Qcwkd/8Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4PlqSs3; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757320297; x=1788856297;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=uwgeobY1LOwNR6e+V0U1HjKmCsOclKaJp7hdOiNJXlc=;
  b=S4PlqSs38MILWVOD8UanQPLOsy7aYHMe3EOxeD8lpZEPIdE1BxnMbadn
   sMJdHpLxnsfTvVsp1kJLJylfZ+PlL8q9Ktc3LhKcSBVThuj9jRZSSpQeJ
   +jYU0BdaBjL+OHKphv9Yj1x5Qmn4vh7icfbPAwkNocQ9tUrEc1agPUqxL
   +AOVO/4jcpwbSzRv/Zu9wpDA5jGTQskdVysAah2dx5f6OqgAaGxGDP84L
   iQypjttvCE74PK3wBPpDOTZ8lkcygUfLwV/ETQ1noSxZrkRQmW5tZ1TV6
   KOkefUhrO5gwVDuWP4rqisKDPOWJAw4Kdl00Ws8qcDWZniVXtl5oqCZ5/
   g==;
X-CSE-ConnectionGUID: RXDfGEVUQh6jbvgN/RxEDA==
X-CSE-MsgGUID: KRLpcXxTSAazpsa7eXhccA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="59645671"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="59645671"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 01:31:36 -0700
X-CSE-ConnectionGUID: Sq+fPGUQQ4aK7u5PgZVBaw==
X-CSE-MsgGUID: RUkcq3XvTIeTWXe9ISaWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="203693515"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 01:31:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 01:31:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 01:31:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 01:31:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdgxFpABNMCUBZBtcsAOv7EUFxLe4H8OdKKB6LAqMV8NhKR2/a9ZnyiT2vTHQdADx9odR3qa57qBXdbb9ww3PNato80vfok4DnxZnp9vd0riT9gou8zJHUIvhtZmL3xxaylACteujcOV8VTYmfnx9NdSpOyRD+YJwX3MTkLylalm9JuwDDjlRamdv4/qTz9u47v7DIVK8exWGNaXOsfZh2El77EyuEYBhJ7ueD76pd6pLu8fQzzPuuSoSJx1x8tKJW4d+npZUn71GDPkwHlFivm5smaWa3ROvq8Yxi+ndstJhhrT/UJMr3u4w6jjtcygoZODkGOlxAnMyJgzvVUmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ue9ZKmmh1ynqDu+DsXP/5on1aNPLKy82SKLkJzSl4cc=;
 b=c9GeZjpYghqeXXy3kqc3AkcFKbt0xwk3OHOh+D/bHddFMDDeLkhpaHG+fcIbqQdwlkg4pCwGkYOgt73bb02ykvNzScR1i0gOsU57SDoLkzBFWE0qFx3yOKDPJfY04DXUUDveR4ykJG62uwlKWcLhC+ym6/UH4Bzxf+Jvxy34BKsb+rePKMJ5/wpQS5wgItnLSF//0hc8ALa/MDuo1JO28vOeeT3e+vuUqfBvjr/kukruvIJxb7blTbxiD/5kGn4GAA13OPqsMPa8CnvKeMsoZbTwFTZtTHpj7G4HJt+YNXk9ELY5Hqs4ClP0l6OZoMJbSavxbR+rPvUBWkdZ+Scqrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SJ2PR11MB7597.namprd11.prod.outlook.com (2603:10b6:a03:4c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 08:31:28 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 08:31:28 +0000
Date: Mon, 8 Sep 2025 10:30:29 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Borislav Petkov <bp@alien8.de>
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
	<andreyknvl@gmail.com>, <jhubbard@nvidia.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mm@kvack.org>, <llvm@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 11/19] x86: LAM initialization
Message-ID: <p447gaopwygjg5tjpnom2lpu2v5ozescujqhrkxkca45pc744u@njkdjpdqkorq>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <ffd8c5ee9bfc5acbf068a01ef45d3bf506c191a3.1756151769.git.maciej.wieczor-retman@intel.com>
 <20250906222420.GBaLy0lL5lHcVlYU0C@fat_crate.local>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250906222420.GBaLy0lL5lHcVlYU0C@fat_crate.local>
X-ClientProxiedBy: DB3PR08CA0006.eurprd08.prod.outlook.com (2603:10a6:8::19)
 To BN6PR11MB3923.namprd11.prod.outlook.com (2603:10b6:405:78::34)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SJ2PR11MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a80773d-dd9d-47d2-1a40-08ddeeb21b1c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OIIpx5zpUzKa0viCVQFlg5Xgi1MHE0wM3qtqF+LZ1RSpLTpnoSP56qAtyO?=
 =?iso-8859-1?Q?BlwU30Fz8B2uE+cx7H9V0yyUcVmUfikgqPHep+jlf+7w1emCfaiKRx35Gf?=
 =?iso-8859-1?Q?WKroYjfIUBhEHTeZkX4IghCmiWDN+5F3uLMp3F0H/IFPKqblZip8WrUKVx?=
 =?iso-8859-1?Q?bUgxjCjFUDS2TGda5gPFPhkGiyM68nqdLfhFz5qD6/eH/EWCG4HYiahFZp?=
 =?iso-8859-1?Q?Wt+FNwWVB2McZe4dxRb1KkQ1Zdh5/S+7u3w1TjKXkndtgrv/DKl4Ri9Bk+?=
 =?iso-8859-1?Q?kaKbR7WggXlKivLlxo9YmZtAxeRZp4MqxiC/3saB63pC7+Kje5XvsSlMR4?=
 =?iso-8859-1?Q?9SPWsthRG/59jkFiYCHh28jiCQT8MIkLO22X2K8iNWCkcbiNZJoRst6YtQ?=
 =?iso-8859-1?Q?z4FHTtDJLjtjr+1aChntoB5fWQkLv/tNymD00Y3kr6CjDVzQd9TgLFuHQU?=
 =?iso-8859-1?Q?zvRpaYu5uxpWaH0LAfIrQnzqUT0BhaP/6EfBAbgZJnYH5SFynVjvvkoes1?=
 =?iso-8859-1?Q?cV3mFjANFL9X3RC/r0Px0ozflvToGEO51+qVUI/yNtU5V3KiurmeswAUuV?=
 =?iso-8859-1?Q?g+nQqZxri0mhVsOp9Va22emKS5GbP0D0bYPHwbL8mvkMh7CpJJ5GWs3hU2?=
 =?iso-8859-1?Q?fs1JXx9zEfhG0Bjt0duzwzxNCRBVWop0IcimzY/vJkbv+F9T9v0DmTfI9s?=
 =?iso-8859-1?Q?KVJudFD7Nz4joyecs0AhEkSaPAPeLqv4iVPmNbalUvvHlcmkdOh401vLRY?=
 =?iso-8859-1?Q?5aeL90U8a1r926ao10b6KeqGJOzgtKqwfX90ijicJ3HAeYNJ+ELbOsjzTq?=
 =?iso-8859-1?Q?qemGvTuUu+uE8LIbTL8NnVsMKVZBOgN5ks5xq82N17BhWfcqykZ1YQ/RDu?=
 =?iso-8859-1?Q?ZiNVV316vwXXNZP7TPdMjHByWmZ8RBX9ZKz4HATlEmT3BGzATQJsZiOA/3?=
 =?iso-8859-1?Q?b/yCfdT+eAK3Pc3dW4/Ob4YCBqfi8+3t2+ROnakCS7Cub+Qsq14w8J1tHW?=
 =?iso-8859-1?Q?+WjunaA3N0M45ji8Omot8w52jDSpDXy3uz/l7UnP0x15yTQ3YuDGz5f0B9?=
 =?iso-8859-1?Q?MmQBN3AYheQ8orc3ph9zE9SQ085CLYred6tcLphdo8z6vVY5jDtDI4ZTsy?=
 =?iso-8859-1?Q?d1aHx1jYYFIDfgFBG1zSBtt4WmCNBgkmUA8vGVbt8+scuLG1aM6Z865WL5?=
 =?iso-8859-1?Q?1LBt5md3a+mN8T45O0BF7JBrz93/i4ys6Xskj3ZmfN+0gVFG7Np4iWuN/O?=
 =?iso-8859-1?Q?DlkmtZyYxdQEPAyQYpHXsw0ngGWDg09buCb3C560LoDSxUkyOkVPOxLFkY?=
 =?iso-8859-1?Q?fsUcMfrvWVneXCU0Ss9YjoTyhvTAdmJBAFJzLAg3WpE+1MskT+Ezl9ztaO?=
 =?iso-8859-1?Q?EiCPDn8Cb6bi2kKrK16qAHAri3SWT4M6CM2yLrYBdi/+yuDbt7vKZdtkuz?=
 =?iso-8859-1?Q?9QLqMEXQ0MYzLB2kvYmfXkPhup0ldpvFM+vcvC8QTBe5AdLm8epcQ1/8T+?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hbO+6FqOl/DwrRQXFfxVnEeJVkZ6Rp/omr5xIdPYRO2sXKg2Vpi6fseB7Y?=
 =?iso-8859-1?Q?rupfLOOcq3S9zLibGs6VWKaW6dPrSG/zzPGs/0wWrWSGnUg8oSUMwV11Q+?=
 =?iso-8859-1?Q?u0/0UZZR9siAw6mqONLsusVxVh4cVBMqk968F6jNrJjZu0oK0BSsusIAC6?=
 =?iso-8859-1?Q?AV02tb0bqk7S7n8CnuS08vhxFti12RdkrH4vU1gCwTIFwqQnb0FmP33YJo?=
 =?iso-8859-1?Q?InBHtddtVUDq8T0cs6tSw2zAj6RhyIOESHmg3wfDVTaPPJQzNJDW6+OIMw?=
 =?iso-8859-1?Q?5dwFzI88y0A+S5+ycBnV9mH5tWjfVeK8YtgbgznNwjQKhyO87K4GLWWOvq?=
 =?iso-8859-1?Q?a8LRMR5VAXT5Hrj+vqeE5K6e83UsbuVtLhqxMFdzLS+2tVmMO9NfTltgR1?=
 =?iso-8859-1?Q?nXo2Jgwb3pFAEWtJf6PnLNyKiTjqM6SlD9iKmh01RhQPfM869WNgJG1YYO?=
 =?iso-8859-1?Q?FluLoL3/aHHCin5Md0laHMkVk4R/CuJVXdzLdV9LkYLG2fbSMjWHHe14pj?=
 =?iso-8859-1?Q?g/Odgwg9J8q8mYgkoWUm/y01iYWWoIY7qXco3ZFOvxYeNdZD0SW7bKZRvR?=
 =?iso-8859-1?Q?JbLRYkGfL9wjU/8fJyhU3Td3U5z8hEoS2uBwztwxUIOcrGRZv5NHPmL29+?=
 =?iso-8859-1?Q?mNRbtnSRNyGS+FRW+36KZkm3cCdsvK9aVy0sTwT4NH6pti4ZccPw+1Mmp6?=
 =?iso-8859-1?Q?qwOo/s7w9fw71gY2Ga+cSEBATwFxKzv/rJTfyygxo/WnaNgz8R/SwLxs8/?=
 =?iso-8859-1?Q?xSFJ0wMM3fT1dtXBlel/cA4edmtOQ26Ivmi58m1BSV1LLaWq1RaAtoHWu7?=
 =?iso-8859-1?Q?KQwAS66/1H7et9Pfi1zRzE8hA5FvamwWbvcCdAuYosLx/RFbI00sJXN6Bb?=
 =?iso-8859-1?Q?aQlV1nyEidKzQ/mfkBiqY0fL/l03s9AJYUX/bmc4T0i/27vsQlcXyUjXhB?=
 =?iso-8859-1?Q?eyOmkxWN4h8xSxcxuAyyULwhNZo4pf1Uvjhi0MMqhHZ2HvzXOkDooGShi2?=
 =?iso-8859-1?Q?8fAWVQftsJyDhho9vlpxNc6XNJd/Wuv6VZqoFrfG1rXEoPiAHEu5SAKtj6?=
 =?iso-8859-1?Q?tdC4o8nliCnw4HggSRNFX3g62mEc4rh6uPxj2jFuaJamfyOhAqkumcpIcl?=
 =?iso-8859-1?Q?c/9pTwhOaer3k3Leukli3ofbgqCeNC8LeomweosZofJR2HyC49ETa7X+aw?=
 =?iso-8859-1?Q?L6FM+qGItAC1d//DM33pwuAXY2m45uQaSmtv9Np/0PQhHgOjTV2isu+NtZ?=
 =?iso-8859-1?Q?uVl34qoE5bxmxNE/wLyqj8zfHCH779HUWEOtmxH17txNY9EktvPNX53K9P?=
 =?iso-8859-1?Q?KggfdGgeEoD0f/oAN9DEI7zZFknSprp6UDV+qDHWhmS8GPR2dKeqacOa27?=
 =?iso-8859-1?Q?eaU74SKCbFK09aNfX344wKiuvii0AeZVO4Xm3zcTGFPqAiX0N/XjiBDDli?=
 =?iso-8859-1?Q?mpUMRFxfzSGPpc1wwSVW9qZ+M1bve6HL2wkvB+Qb5I7UbbPTxTnSc+SYB2?=
 =?iso-8859-1?Q?TBW8xrpwbv8A2c09+5bfhA2fdOI9X3pjzUKOXcKPLgcLARTC/qkGdIPZml?=
 =?iso-8859-1?Q?G1sqyioORrl9mymDGpJOUCSsy0iZWNu8da6dz/IV4s4EdWcBHhz6WWHiur?=
 =?iso-8859-1?Q?6dcmvQIe2dQ89XFzn4fPN3/tYZNzsLp1vQk4lXAlU/KpnLxAUwdMAe7tfw?=
 =?iso-8859-1?Q?dMo4Mx8oVr5z4fURlJg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a80773d-dd9d-47d2-1a40-08ddeeb21b1c
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3923.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 08:31:28.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chpCmWduNQUpLoDsv5Ka2Q5sMd2FqhB/YNfh0boju8tgvdmWxmRQMN8KKTWEkuoHGlc29eiGxJgYrKrYHJITzlsuzV30xO8MCOI1JgJNdQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7597
X-OriginatorOrg: intel.com

On 2025-09-07 at 00:24:20 +0200, Borislav Petkov wrote:
>On Mon, Aug 25, 2025 at 10:24:36PM +0200, Maciej Wieczor-Retman wrote:
>> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
>> index bb57e93b4caf..756bd96c3b8b 100644
>> --- a/arch/x86/mm/init.c
>> +++ b/arch/x86/mm/init.c
>> @@ -763,6 +763,9 @@ void __init init_mem_mapping(void)
>>  	probe_page_size_mask();
>>  	setup_pcid();
>>  
>> +	if (boot_cpu_has(X86_FEATURE_LAM) && IS_ENABLED(CONFIG_KASAN_SW_TAGS))
>
>cpu_feature_enabled()
>

Thanks, I'll correct it.

>> +		cr4_set_bits_and_update_boot(X86_CR4_LAM_SUP);
>> +
>>  #ifdef CONFIG_X86_64
>>  	end = max_pfn << PAGE_SHIFT;
>>  #else
>> -- 
>
>Also, for all your patches' subjects and text:
>
>Pls read
>
>https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject
>https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
>
>and fixup.

Thanks, I'll recheck all the patches with that in mind.

>
>Thx.
>
>-- 
>Regards/Gruss,
>    Boris.
>
>https://people.kernel.org/tglx/notes-about-netiquette

-- 
Kind regards
Maciej Wieczór-Retman

