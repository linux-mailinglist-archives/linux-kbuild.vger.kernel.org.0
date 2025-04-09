Return-Path: <linux-kbuild+bounces-6528-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAADA81E1A
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 09:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAA544A4761
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 07:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEDF22ACEE;
	Wed,  9 Apr 2025 07:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0ggSOnE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C9882899;
	Wed,  9 Apr 2025 07:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744183115; cv=fail; b=dalYUpQXI5igUgo38bVQd7A6sc6nr4X5Yg4OjwPQ5euf+LqJsrE6CyaVOSC2tPs+gCpmKyU02cUouB590P9rcaQ58c4GpeVwPwCwdbySjGTvFVyr9x/hkw02PGh0pFXjFjMDMPiVxqtvoVeS6U3dBtgOZHIy8qsJxMU/2UzWwYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744183115; c=relaxed/simple;
	bh=UdanWRUgmO0qN8GnuBbYRHw56iM8NdJFoqSqVzKqEU4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cah/bXiLM57kYliJWKa1m5T+W30abEOIZ1dbmYQA+6RZm97naYGuZMWktUDJafyzWqBKPabDAtuH4srRiSLBmV53cqmzHMxte7XP7grPqEUSTb33ExAZEwk7CK3cp1pEjQAhjoAhdBSLDFSSh96kQo64A09hzLwXZOUMpT9MOTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0ggSOnE; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744183113; x=1775719113;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UdanWRUgmO0qN8GnuBbYRHw56iM8NdJFoqSqVzKqEU4=;
  b=l0ggSOnEWMgualYUpsJS254JwZJc6HRraSpZILJpSgbmyrPKsOPoO/5t
   X9waCGxCfnINoTBpQ7xOfQasWiyJ1eRTBHeUP5dA1kYPNN0H//Ui3vasl
   TDf1Qdb2gsBDozgkTzzC5oprjuyvMnOlrf9PIe2yc/z0Nc2ut5CLcqDFO
   B81W2viFKMzRm8dsuZhMwSMWXl4eIbmc6nkU6wo/pchKb6+8w7WM3NEnQ
   +Cs4u0ZVGxLIyPkIA1R5byAS/rNQUXe7RwXEGnPI6RCJG1r1R4OEfy0Kw
   AK2tbjVar+iBwZFHsgbli+x+5Pf/YnJrhVx4iQXW0J89xHtzW+dVv/Hop
   Q==;
X-CSE-ConnectionGUID: dO1G8yuuQIuf8ykYeb6Fjw==
X-CSE-MsgGUID: tqknZqwvQpSomjN5UvgI1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="71017763"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="71017763"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 00:18:32 -0700
X-CSE-ConnectionGUID: L/1XgBfZRwOam+6IuUn/tA==
X-CSE-MsgGUID: afUZTRtHSxqE5HPDJvgVtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133627070"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 00:18:31 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 9 Apr 2025 00:18:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 9 Apr 2025 00:18:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 00:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xT0nE+m5dmVFgSFVBWHqVgmZyHeikRisIwef2RrwVd8gtcQCbnIUxHk7BwJ1ux3kO7f59ctsp2VkvOmmf3DplAhkKx7IzOczvJWWOqrCOCkS4zjJei97RiIt2MH0R4P9otg2YmUWyeTH8NK/lZDGIceUV2UR101AbXXao9E+/bMIEntlmVlRrZ8u/jSeOiiqL/vb5vy3k0Xnvk+rzSDz1TkheOjeSkoLXMnVb9csmjahT4wpU7b6swyzIEq9cd0tfeqNYziKr2IYqdYfj8yMjX4n/Xh8Cd8g+2y5DKC52fulpdBn2PMs0HrzNTqhNZyH0QW+wFcgOF5zliXTjHhceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nuu6YZ1CbLj29m0WU0kS+rT+N3czi33PbUss3Oyz0A=;
 b=tr56J70jZmHg/6BlPgbvRCHfNue+wrUiBKHhK6v4KgK4mgju+X7t000MbKWeWm5K5BZ5OD0zmbh5oz9wFGdFEufyMp7bh9JbB2OjsOlYZLnO86uo7gMEYonYqns4FidSb0wsH0OLSui7Hgf2nz/FSo+uc16ZKEiMlYUOwhNTX90Pt0+91GQr+DYSzwFiy/0C7VZquo2Hr/hkOYAELoQcdx58BTGDqLAiRWnZL11DB5NPTjVkQMJnBTsIdsSGpyzBNS4FrBnESS5k+evXh/WHW06vkNZHHPpnsMYjVsNf3hsAFXYbz81ZU8knijFqKtQEonv86n1yKhhTaoxXXHJ50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Wed, 9 Apr
 2025 07:18:26 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 07:18:26 +0000
Date: Wed, 9 Apr 2025 09:16:44 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Dave Hansen <dave.hansen@intel.com>
CC: <hpa@zytor.com>, <hch@infradead.org>, <nick.desaulniers+lkml@gmail.com>,
	<kuan-ying.lee@canonical.com>, <masahiroy@kernel.org>,
	<samuel.holland@sifive.com>, <mingo@redhat.com>, <corbet@lwn.net>,
	<ryabinin.a.a@gmail.com>, <guoweikang.kernel@gmail.com>,
	<jpoimboe@kernel.org>, <ardb@kernel.org>, <vincenzo.frascino@arm.com>,
	<glider@google.com>, <kirill.shutemov@linux.intel.com>, <apopple@nvidia.com>,
	<samitolvanen@google.com>, <kaleshsingh@google.com>, <jgross@suse.com>,
	<andreyknvl@gmail.com>, <scott@os.amperecomputing.com>,
	<tony.luck@intel.com>, <dvyukov@google.com>, <pasha.tatashin@soleen.com>,
	<ziy@nvidia.com>, <broonie@kernel.org>, <gatlin.newhouse@gmail.com>,
	<jackmanb@google.com>, <wangkefeng.wang@huawei.com>,
	<thiago.bauermann@linaro.org>, <tglx@linutronix.de>, <kees@kernel.org>,
	<akpm@linux-foundation.org>, <jason.andryuk@amd.com>, <snovitoll@gmail.com>,
	<xin@zytor.com>, <jan.kiszka@siemens.com>, <bp@alien8.de>, <rppt@kernel.org>,
	<peterz@infradead.org>, <pankaj.gupta@amd.com>, <thuth@redhat.com>,
	<andriy.shevchenko@linux.intel.com>, <joel.granados@kernel.org>,
	<kbingham@kernel.org>, <nicolas@fjasle.eu>, <mark.rutland@arm.com>,
	<surenb@google.com>, <catalin.marinas@arm.com>, <morbo@google.com>,
	<justinstitt@google.com>, <ubizjak@gmail.com>, <jhubbard@nvidia.com>,
	<urezki@gmail.com>, <dave.hansen@linux.intel.com>, <bhe@redhat.com>,
	<luto@kernel.org>, <baohua@kernel.org>, <nathan@kernel.org>,
	<will@kernel.org>, <brgerst@gmail.com>, <llvm@lists.linux.dev>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>
Subject: Re: [PATCH v3 03/14] x86: Add arch specific kasan functions
Message-ID: <kf7vx6xgyh3o72qy5uade5lxc2htwsr5yucs7yclm5atcrwppp@lvfqi7tupefn>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <e06c7c0fdbad7044f150891d827393665c5742fd.1743772053.git.maciej.wieczor-retman@intel.com>
 <3fd46452-fc96-4d50-9c40-a8a453d58f40@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fd46452-fc96-4d50-9c40-a8a453d58f40@intel.com>
X-ClientProxiedBy: DB9PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::12) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|CH0PR11MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cfd24ac-15f1-42e0-0c25-08dd7736b854
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?SFXebPQiak0lNJSESiRb/r4cX/Ha7PvQfTOCMxu+qz2qgCWXAVuFA+5X4J?=
 =?iso-8859-1?Q?HA9rrBY1+WSZDYwRl/MEAOGjcLyjZLb7CR1Xo2fbLLQ5krCtTxPwQUmUux?=
 =?iso-8859-1?Q?BSesz4gKyJd2LWURqxCLWFl3l0E+n2qtttc6+ncLBsPz99LDNHEy94xIdZ?=
 =?iso-8859-1?Q?2zMy9WXPrcEBZVqEs7AaCIkE4/sR8wD19g/dLz2bPtkwH6TR4nbTtid9zZ?=
 =?iso-8859-1?Q?pHIpan2/QYBPTSSwmZGOkMbqZkYVlfTekwa6ZxCzmY4ElNigrClsYcrf9C?=
 =?iso-8859-1?Q?dNjStDhkcwyAQjdTZaS3/zL+p+ACMf95DUmAYgT2pxNAXZ0abd1mgCSLTR?=
 =?iso-8859-1?Q?jkcFUluEPf+JuTT/gtQ2lbHV8qBO9dY/0NQScb/wSSH6xqM6IKiHmKKeKv?=
 =?iso-8859-1?Q?iQaMVM7EkMjQTuB+YM2l/aOYVnHJ5aCHXSt3xnCheK0fzQ0XkiEH38OGY0?=
 =?iso-8859-1?Q?fS/jRk0SE2I5j8xN9eHkRsNtwl5ofuPdMQlQ7u6hXKzi30UBHEQobQ0q09?=
 =?iso-8859-1?Q?gKTnd41IlCz6AqnT6l0koAVDXnznEfHsLXkjEawl3hWA/MI7d2jqLHh2ZM?=
 =?iso-8859-1?Q?X6nMbJL4EKsL6Q4/+u+thCyvQr0HxeyZJxvxDBQHw2F0jOYl2HU+uvs8f3?=
 =?iso-8859-1?Q?nbgzG6swEK9erDsYcKGpfjdnALGNnlDA2bIl4ZJUji9TdlsAvZbjQAqH1S?=
 =?iso-8859-1?Q?nLnjOLNZcK3I2I2HfcMFZXkXq0GX02EhMYmBYRPcHTVGsOPojELgu3ojK6?=
 =?iso-8859-1?Q?5tkm9u+HTCwcVRjCb59JVFHm80wlbO+8elHXfQhGu8il45f5CR2koBsvd8?=
 =?iso-8859-1?Q?VFGWPXrTgXrCrr8ACGkarbJZ/5BB2aY23BVy5nvho4YvAeX+Aj4yQLIOWW?=
 =?iso-8859-1?Q?9h7pisSBEia7R1fvHG6q5L7FHDcv0hzu93x58b3xm7WGKMQE9Oge0Usytl?=
 =?iso-8859-1?Q?PgQn8iWVZL0zoGuScm8f+ApJZOIr+4Dj93Ibq/h5QM5raUb7gsIRfWCPm3?=
 =?iso-8859-1?Q?awvuwjGPc/XjCu+HfNDpHscQbvxZT8zLDNk3x6spLXWvcjfW57hjJFAT6d?=
 =?iso-8859-1?Q?CEyXStSX/0g/ni7RfN5F/LfjXZnVzyRfKc86CxfsItV5bUtanoR5Y+GmuL?=
 =?iso-8859-1?Q?gfxCVOyIUCp+eXdsxbGe1PJiZ3uX4ETKMJCylvN5RIK41T0pM11HhccTka?=
 =?iso-8859-1?Q?Eqbf/jvXishlMFVl8Nd7R7f1W9MkiYixmBEc9a6UJhn8ip7rkwvywaol9R?=
 =?iso-8859-1?Q?FmvWSbAkU518s2MCcA7ZJNcGl0qH3ZjybLqPIKjumJxVZAaYiNR+0XBzdL?=
 =?iso-8859-1?Q?9PIdfeQmGWVeG9j9kmLI5Q5Dv+WkGMz0lQ2VS2O8bhKjy2c7I8gG7yV7Xh?=
 =?iso-8859-1?Q?iRuEOQH2EBRP0KZexppS9gmQ8GdDsjyVjM1HRDS90uLo7RIFDbWKnScfbP?=
 =?iso-8859-1?Q?AYa/ZLY3iJfo2Qk9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zGpZPz94OpD6q1vxz1IyChvV7bY4c0jfHCxoNSkCvCTlxQll+vtMMTnUBS?=
 =?iso-8859-1?Q?Jkk3Oq4ZSJAfgjRREG8rDRZ9ZMnf/91OWCUf8KNVYarymVJvuzCNaDtkPy?=
 =?iso-8859-1?Q?at2w3wcUTZpYsha5vyMC9oCKXVtccEn5EZDV/GJSP9O1nciiYfe7m3xUew?=
 =?iso-8859-1?Q?+tMV0/v8LGljwx1AG02b5XffuejVCdH2WSlsofkpKJ1svmeXPNECFPqPgq?=
 =?iso-8859-1?Q?SZUgT+8s6kmU4mtkceBrom/rMoP+azsBrrNnEQaT1utGIoW8ETJFrIxOcE?=
 =?iso-8859-1?Q?Jp2MZ7GA7I99VMaGJBABgk5AbHrNze7APo+OwRMb+ioJT+1WkfHwAEYpd4?=
 =?iso-8859-1?Q?tj6MTUipJhfkzYtCLvyvei+nlxmM0IIOyfYtSpEhKY4VQCwvzCAv6DYEg6?=
 =?iso-8859-1?Q?hMe6s/qRKOzPGHbXLSTw1ucbCEeDlIczfxSHPIEVzj6FQU6V77vDZqgHDH?=
 =?iso-8859-1?Q?Y6ZK1J12qgdEJer9UXT00U5KaQomOZl+P2F7F5uSiUWYsgbl8mHKWbnKb3?=
 =?iso-8859-1?Q?r/XEivGGPK4MtBSWT+39BVBVZSWhrc0qP/DHIHiIN9XN9TRQqrw/9zYzEG?=
 =?iso-8859-1?Q?sXOMm2rXABY5fVQi0wHVuH1dS8LgNnuTT9uXLOqT2h6zyjgjnrKwSP84OK?=
 =?iso-8859-1?Q?1BxKffD7OohGFGZl6eaFtEveE5jHyskkM7DuXkUhqcBASOSdDQayp0enEw?=
 =?iso-8859-1?Q?fm+XQZRuUBiFDeuwgn1jY02uHfsmVBV0PYmHoWeGeurahvv9hdOdFRn9oH?=
 =?iso-8859-1?Q?egwCJkAgzSTXvN6dPQjTt4ttP0RC8iK8MgaXgnUHUhEke3ICYFeqOWZGgY?=
 =?iso-8859-1?Q?+CoFoDAb8hgR0Tov2B2L84DHy5XoH0vC45QKrhAY/jsqLWKECmWxlyt4Yw?=
 =?iso-8859-1?Q?RikfrV1N5REwdJS68RQyvWVs4iBE9SU4E0Cea4rfCFtCdvXN0hkL7AT7nL?=
 =?iso-8859-1?Q?PV/MqgyeAj3nq3lGJ54p34Uv/FydtuSPbU/XOm5psLTv7kzYsQvcfFpa5x?=
 =?iso-8859-1?Q?SdjRG7QnuIQaORE99hH7v4fvnnOo+0EbivTk1kVbrRm6Qdv4rLwyYei6Gz?=
 =?iso-8859-1?Q?WkRE4/t1xXYPR1KbF7T4bjoFwDyrGd7bo4HgE8GR2XWanmu5wVYWyjErd/?=
 =?iso-8859-1?Q?q2DPW/3m5zMNWy6R3vL6buJ2XTrDW6W/U4Kgnps8mYNgntIPnzJ0thA6aj?=
 =?iso-8859-1?Q?0FCjdNTxLM+2EGwm3BBjkbTMJnMLgWCwBq5kwGOnipeVXNWL6lKX19XmIK?=
 =?iso-8859-1?Q?fHtyhf9wLYDNzBo3gOx9DwDlGiiW6zEaeSYuWlzvteQMvxFCqNyTYN99Si?=
 =?iso-8859-1?Q?LIR9QeDaQkrXCqVKCTuR2EHRFO6p71gu7gptNi9aAvVyGa+v8stBvRAVYm?=
 =?iso-8859-1?Q?HCUZPnTYS4oeMrc9O4UWRjujWVdHk4ExRT+ceKjd/otSMm2GpdSp+M3eCP?=
 =?iso-8859-1?Q?taniXhUmPlqhxFN1GHm95VjNB6xTobBVLWaVgIBXQzE5NWhaxiQaF65PvA?=
 =?iso-8859-1?Q?mVeQX/oTIC8zMaU6fQ77O7iPGyUWDmPOraMNwBW4aBVRLb+mvvEwdPz6+1?=
 =?iso-8859-1?Q?qNkuC6Q7GcLplGf+zOkqk04OPaqK8ZEPaeTCaCNe/+P8tMLgrBhjz8Hy5K?=
 =?iso-8859-1?Q?j8vIkZW3RYKv4NYY72WgSXqDyTiBJur4ZimQqEBhwXHa0KwlS7NfXK84jo?=
 =?iso-8859-1?Q?GHlWA5CXIlYkpKS0Up0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfd24ac-15f1-42e0-0c25-08dd7736b854
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:18:26.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jJ8tYqVpCxkU0mX3VQ6DQ5XFbIkIaUhEn9UIXZIC5QYY+gHkWwGN1wgyLJuvO8/kVnXg2DFnzCJ37P5zgF5+9To8r5/l8SOiYah+h07QCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
X-OriginatorOrg: intel.com

On 2025-04-04 at 09:06:51 -0700, Dave Hansen wrote:
>On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
>> +static inline const void *__tag_set(const void *addr, u8 tag)
>> +{
>> +	u64 __addr = (u64)addr & ~__tag_shifted(KASAN_TAG_KERNEL);
>> +	return (const void *)(__addr | __tag_shifted(tag));
>> +}
>
>This becomes a lot clearer to read if you separate out the casting from
>the logical bit manipulation. For instance:
>
>static inline const void *__tag_set(const void *__addr, u8 tag)
>{
>	u64 addr = (u64)__addr;
>
>	addr &= ~__tag_shifted(KASAN_TAG_KERNEL);
>	addr |= __tag_shifted(tag);
>
>	return (const void *)addr;
>}
>
>Also, unless there's a good reason for it, you might as well limit the
>places you need to use "__".

Thanks, the above looks better :)

>
>Now that we can read this, I think it's potentially buggy. If someone
>went and changed:
>
>#define KASAN_TAG_KERNEL	0xFF
>
>to, say:
>
>#define KASAN_TAG_KERNEL	0xAB
>zo
>the '&' would miss clearing bits. It works fine in the arm64 implementation:
>
>	u64 __addr = (u64)addr & ~__tag_shifted(0xff);
>
>because they've hard-coded 0xff. I _think_ that's what you actually want
>here. You don't want to mask out KASAN_TAG_KERNEL, you actually want to
>mask out *ANYTHING* in those bits.
>
>So the best thing is probably to define a KASAN_TAG_MASK that makes it
>clear which are the tag bits.

Okay, that makes more sense. KASAN_TAG_MASK already exist ((1 << TAG_WIDTH) - 1)
in include/linux/mmzone.h. I'll move it to include/linux/kasan-tags.h so it can
be included.

-- 
Kind regards
Maciej Wieczór-Retman

