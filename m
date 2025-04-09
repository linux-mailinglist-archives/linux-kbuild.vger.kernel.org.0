Return-Path: <linux-kbuild+bounces-6529-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF1CA81E67
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 09:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3713D3A1CCA
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 07:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A4325A2DF;
	Wed,  9 Apr 2025 07:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDUzJHss"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB0025A2D1;
	Wed,  9 Apr 2025 07:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744184258; cv=fail; b=RjnDPohSFK3DfwWzxWMnZwh/rXRjWk7CD5j50gB4Y3J2g0KruhKExAyIM+KXVjhkDe7MrTlRWIayICisdnCKmel2AqTia5oiXsmvy97fAkNvsfR1wQ+kfQ+cAVH07J+EMSucx1DS17Aul3x4xUizoh8jLh6U7uXbSxnp0TatJiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744184258; c=relaxed/simple;
	bh=tHSswy6XsMRK6kuFhq3NUaq3M2JEu62sA7RjcVDgH20=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JaKwlW4G07FqJ8SpyF4vK7Jgz9Mosvs4cel7tbrKzAeU/kiRZZzRtPtcu+1VHXXI6ZfSLADW8NByv9889C0Eb8UOq2KFbvJJtok8N8JD9ecWzZTkEsz+Emlf9lnFihagvlY/DgBA6oyIeh2x32v5iz6YJqpmmczCC6uAEOWJvRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDUzJHss; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744184256; x=1775720256;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=tHSswy6XsMRK6kuFhq3NUaq3M2JEu62sA7RjcVDgH20=;
  b=MDUzJHss2HYifTMuzAemqedljI3skRs2ctEO6aWLyr16cJxCbNqKej27
   nN81UaLSK5QfMx+2d7v3Ee7ZdNhFJYkvPMDIxGIaxBaHu3gpdjDPMQPWP
   GZ+IKzM4E9iU++X25gxTqp5o+y3w7Lq1+7KFhTrSIxsEb98u06gW52xae
   dl9AYns65ih+4hbkYBfnapphCmLTscDSEe69YOYogc0Fn/E+Sd9AmhqA6
   UCCxm2f1C3sUCi/PL3HuY7Gkbt+mmN3+utOR3ndYGRCwxr/wBLd0zl6EF
   XeatKG5jnd6qvRW35YfnmlbdpFJfG+f+eiAn6qst4mM0afpkFTZzqRxet
   Q==;
X-CSE-ConnectionGUID: rj+q02JSRLSdOFaiSsHfLQ==
X-CSE-MsgGUID: A7ZqOhadROS7IIfp/eVgzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56311022"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="56311022"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 00:37:35 -0700
X-CSE-ConnectionGUID: 8d+NmMzzRNy/C25VpsmJAA==
X-CSE-MsgGUID: eIOmOAbZSQm4giJyrdYA4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129451211"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 00:37:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 00:37:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 00:37:34 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 00:37:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muvyeM0aN0r8xS2TKcM+CCaw+aQEW1w6IQaGvPUjVQ39QMVu4+UQ2Qmug2uydxk9GLK8BJwm+GjwLZpIjKko63Qnw5Cm0rcvL93u1Gr3r9XIL/q2GS6mNtD6F6Nq4+x0nj+ZuM/5XKRlSljxtecL3nG0B+euIVaHzlWqs8LamAACqnioO3vruq0z6jlz+lwwlhZ7ABTyqDoCeW6n7baVBrasktSgWW9rzw5iDOyqp3DypNb9dEsh3XPo49F8E1+WsEbR82gr52/mhuKO0YYTrLtaSukX7exU2oLp0MbdK69m5NqKQNrZTVr+1MEOILL3SD6BvJsxqRPw5ja7x6qvsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJ6CzhN92oiB5Hct6GpQqdmjuoXgYOgmYkJTHKLM4Ls=;
 b=HfwM8bOflHoy5ccWQm2+zPT1sDGkePTSpZTCc2LswNzGRLvfZPXLoIkBXgxc8G3AOvBKVlq5bRXHABdRRPQUigB4HdFMQ+TZaKtrHo4TGporvAlPOluSSQiAO7/uVcHvwFtNPxUvzHc0/kA/amr1FoQl8XGjBb3TzXCpBorjgH84Q6tW9Fg/2lWKcbBjMcm/mVNJYRhjREsAcxlBey3SZJ+okRElU/JJONiXOigLhw5v+Rp3Ja0D7gIRdAis0Mwm6Lenl4Krm9hYLQ+3tggBOGeAEXwC2okIMOyJJWp7t7HbsgSyFMpg3kWjjFxcUxQogcRV2Nbmi6lBLwEbIWS5Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 07:37:18 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 07:37:18 +0000
Date: Wed, 9 Apr 2025 09:36:32 +0200
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
Subject: Re: [PATCH v3 05/14] x86: Reset tag for virtual to physical address
 conversions
Message-ID: <a7imdoiu4dpypmw2rp25j3vmmuvvzhg6bcx5wtt2dgukg5u7cz@nuyvc77cdmvb>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <a8332a2dc5b21bd8533ea38da258c093fb9f2fe2.1743772053.git.maciej.wieczor-retman@intel.com>
 <257b39a5-69bf-4e6d-844b-576e9c9d2e7d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <257b39a5-69bf-4e6d-844b-576e9c9d2e7d@intel.com>
X-ClientProxiedBy: DU6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::19) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|PH0PR11MB5109:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e111d9d-67ec-4cd2-178a-08dd77395ae2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gm5JE6RvxiT9WvVipGtIkxidrz/iwVRUEMEDY/zKEki8ruDYBhp2XycuKh?=
 =?iso-8859-1?Q?67Wviz7oahrFb+BJtk9lEcbo+xWASo2UJvZto01sWa1dawjvyhJMV1brUT?=
 =?iso-8859-1?Q?t7dZvpqHqE4C4D9rN4U+M1IRZxb0cswFSVAcA9un5N0R4/0jXWAoW6PDHT?=
 =?iso-8859-1?Q?pD5dvqunmiDj4lqbegV5d7+FnlPqIgoP6CBnheSJk37+BAqHKFOzBBRHOq?=
 =?iso-8859-1?Q?0CWOcJeB7idYRohHcSpe9Qk+lPJ8VZkByfWFaki+z9fMekOx+cIw7Q30/t?=
 =?iso-8859-1?Q?GsS7r7Hl5EtfVWzUMe+jpfHR7/4m4x+99GQ2cFNeKDGi6Y04PZOdvBpX2L?=
 =?iso-8859-1?Q?FRwsz+ffwY4pcrAnpfXn2IB41NRbiT78BkqyoKS3sCRabhEAbHu/QNosUl?=
 =?iso-8859-1?Q?aE8vQbxT/EArHB+BIOaVoc+0mvYkGETPCclNL89LHFKAhrv4IYcPRsf4nZ?=
 =?iso-8859-1?Q?j3IKKhCzsD3JzbvrU+96aha/NtgjRKhwkb/Q3OxcH6fE33SUQro5wGmC3x?=
 =?iso-8859-1?Q?UVlnoRSvtZvIBvQ+sj+4fApFTrpWdxBI3GOSAgUZvBnPK7E1u+Xpn0y0sd?=
 =?iso-8859-1?Q?tx+dwr6VbyJVI9Qi9X/5kXuMOaiMbSFMqmFnggM/oVC2VA9x4/jSYLSvtj?=
 =?iso-8859-1?Q?mKs3nhrWYfSRkZsAqgbrC6qmyh0VFG0Fot/uyjiOkrooiN9Ffr5EYFi5t1?=
 =?iso-8859-1?Q?LyQk2hDKYOw6lLxlP1Zs9fkxnLn5kqYnTNMQZNu0FCeXxtquYpDOQVgOzC?=
 =?iso-8859-1?Q?ODKV8TumU2TUxwaRVMZyAy7qyo7mDmv6kOGZmm/x253aTmfjIlbo6U5Ceg?=
 =?iso-8859-1?Q?L+u00NqwngBpq3wKV3sxPCEljf3TxXNwKrF86qtA6M8PmS75A0wTOdWQIv?=
 =?iso-8859-1?Q?PoXddF9c2Gc8L1e4BkC5Jwap8Qe3vxytwTp9t312sBXG+9WBtjFeCgUete?=
 =?iso-8859-1?Q?ro9B5KqkvZ6DcPoAY3FHsiNjHDNbrREY9bwbGc3n/GRUNbJz/G+jf8cTen?=
 =?iso-8859-1?Q?sS6LVZk8Hr/XojYJhZNnnp2FN/DDxEAumQeAMs7zZsTdWeeZNDeo7JudKs?=
 =?iso-8859-1?Q?+DGFZvaDhEG/mM0F7EkEuQbefwhWPYzE0TgKPSfR2+s7JJowDPYLA/wgiF?=
 =?iso-8859-1?Q?vHgF6cIFoWe1bVf+XNc6S7S2djPEyXQmu62PfwJmB/jMjSp8ohmGELBkAy?=
 =?iso-8859-1?Q?1wlKVoFQgjFokmsXE7rNycK8xQhqgAeataKp54S7sEO5HnC+TJ0x97zMAy?=
 =?iso-8859-1?Q?8odjXmtmTU2+lwxenkIQYTEJAVejskMi/J5er29N2uQlhvdqdg6qfk1k3i?=
 =?iso-8859-1?Q?JiEKmsxLmcOYSUyuFVoy9mMmdfkmgIp875sDPyNrBmf0LqZUX5nQIq2j/4?=
 =?iso-8859-1?Q?gv/f9J+Ox6eXFXwGHsCXqGHTdKZs5AT+lxvIz1EwQ9hd2RqRVmqHxo/NWI?=
 =?iso-8859-1?Q?iDjafMhPJqixjgjf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fV5eZ4juin3bW3Ae4NYIjGjWhGTeRU+u2uA6No9eHcoA6i8n+0D9bK64ju?=
 =?iso-8859-1?Q?Omabk2vT1nvo31qHX0EJPh/DKcD1UspudA2VTKj9x+iSQBmd8XdljwBmyX?=
 =?iso-8859-1?Q?wTOxB54Id7kliWCgXLWwhLN43Ri5YEChduHATc58Ik0xaibxs/Y5OBfnE6?=
 =?iso-8859-1?Q?AB04GyXnqspwhfNgz7RdqPFBVvxAA7H4PwPQzahGQgXymBed68i9uImCC8?=
 =?iso-8859-1?Q?JmOtEVzpSsbEGBhY+wj+qgyBxEzSMKgnXNM5uHhwCAfjBorAkagtr8NDoU?=
 =?iso-8859-1?Q?gcTxO9nW0VMg4soMCxXuGxDiMOgNtkgC9keRbbXWcTrgi1wTDOsa2bTlzw?=
 =?iso-8859-1?Q?6D0anjRmwx7/p4cimi5dSIiJxVxLI1st/EjV7jJbECCGOxmuBslqn56/1c?=
 =?iso-8859-1?Q?UAbi04S5CQH16UAOddglh7IDZt5+ssY6HGHnpYxzJU+Pvgoz12w97KkbRK?=
 =?iso-8859-1?Q?oEPJygqTYg7MUhXjkJBeqjGhN6G21KkgCbK6CGvkY5GV+Ncbx5c9rXwv2W?=
 =?iso-8859-1?Q?iwzbFvbNs8qVP9JmLHezEulRg+Wz1nqHERhgt4Bbo5dW0301j9jr5uJE8M?=
 =?iso-8859-1?Q?Y3qLJqApgJidhUSG0EWWPaTU+SbC47tTNnKdG4I4HmzyJJ9a52NrWPT/oF?=
 =?iso-8859-1?Q?QzLSR82lNzVNyYTubxb2n9aSvhfwHUNBjA79VHeJPdEAJk7kIGr6HoIiGV?=
 =?iso-8859-1?Q?2DiQkOvwj1XRA6jwaRYbOPuFNQS4C13ChiZG7CHJUnkVsTB6VKW8dc2Sl2?=
 =?iso-8859-1?Q?3PxB5aKwlRr80ReT/hFLMaZ/XdUbcH81ESip45IqzY8O9/k0jA4irc9NnL?=
 =?iso-8859-1?Q?Ad9BqaAeDOawAeqsXD0EWhqn+bKEWJuI3sfGMj0f1E/157x2A5jwSi0ubt?=
 =?iso-8859-1?Q?BUDJ262Wtpbajo/QFk0iBDLpqipabSknqVL4GSfUidO/6bWdhzRjXvC3Bb?=
 =?iso-8859-1?Q?ETkIuavuqR6GPI+f1aBO7hkFmqaATuas3Iz//Yy2j8P6+1kIMDtaqY2NeR?=
 =?iso-8859-1?Q?H0Zz/tTAathyqzKZ5dBCdDLO+dGAYdqYHkCAv7I0dIVGzlV2mErStmaa1e?=
 =?iso-8859-1?Q?x8YNWiDyykCN9cOtBCjonqs9rAhAwcQcg45T0qrCicGLxA65Wf9f0dfy6p?=
 =?iso-8859-1?Q?uchwWl60Ym5jUsJ0JMTrB7cl0IsO52rQuC+51dVxEm4CI7nsaJViO7Oiyp?=
 =?iso-8859-1?Q?9vlisHK7X1jhkPGk0lIjIYasiA+d+kBjPeqAaAjw/lN1/QvMiBUf7jO+y7?=
 =?iso-8859-1?Q?U3vWL5B8OkYwhuh2w8JdmWnmAhpgAndEEbtP3pKL5mUUZ/WR/OZ5CgIZaH?=
 =?iso-8859-1?Q?k/MxLlWyr32K8BYyfjsqVbgCWvDCSQTll/ApIrTC4ej7R3quTjGLzfSwmM?=
 =?iso-8859-1?Q?zagR166KwMRd/yz+HOgWuUgsKXq+rLTD9+CNGBFpf90+hSuN9W412yxNu9?=
 =?iso-8859-1?Q?xeQ+LSTXJEZG8DxYas6vpmVv1lIQZeD7TVLgkjP252Ljc/WdZ3ZXjD+kw/?=
 =?iso-8859-1?Q?51WCeXU7FMxa3SypO4fkUVR/UB18t4zcNPRCavfKSHL+L7JANN2dR6+3aJ?=
 =?iso-8859-1?Q?HvG+LlTTcYRxw9F6P9S+BXrJFHQ5O70cqPaKuuurSnS2mD4eZTJauuikrG?=
 =?iso-8859-1?Q?mFhL9EDGEWzzU48/qCl2ffznUCSURWUYhzqR1G0aUZdcKhUmxxalLAhCuY?=
 =?iso-8859-1?Q?pf/r+7zXKnFzA91sNmA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e111d9d-67ec-4cd2-178a-08dd77395ae2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:37:17.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t06MeM8qBfZRbbYIen/iGGo9063ePKWL9qn8UiL3A2SyU2iPV6iElez1g8jERQaAjVlmdZygmUDne1LzA14lxZ8YGTd1/W6Vlho/fR+bQ0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
X-OriginatorOrg: intel.com

On 2025-04-04 at 09:42:55 -0700, Dave Hansen wrote:
>On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +#define page_to_virt(x)	({									\
>> +	__typeof__(x) __page = x;								\
>> +	void *__addr = __va(page_to_pfn((__typeof__(x))__tag_reset(__page)) << PAGE_SHIFT);	\
>> +	(void *)__tag_set((const void *)__addr, page_kasan_tag(__page));			\
>> +})
>> +#endif
>
>Is this #ifdef needed?
>
>I thought there were stub versions of all of those tag functions. So it
>should be harmless to use this page_to_virt() implementation with or
>without KASAN. Right?
>
>I'm also confused by the implementation. This is one reason why I rather
>dislike macros. Why does this act like the type of 'x' is variable?
>Isn't it always a 'struct page *'? If so, then why all of the
>__typeof__()'s?
>
>Are struct page pointers _ever_ tagged? If they are, then doesn't
>page_to_pfn() need to handle untagging as well? If they aren't, then
>there's no reason to __tag_reset() in here.
>
>What was the thinking behind this cast:
>
>	(const void *)__addr
>
>?
>
>Are any of these casts _doing_ anything? I'm struggling to find anything
>wrong with:
>
>#define page_to_virt(x)	({
>	void *__addr = __va(page_to_pfn(__page) << PAGE_SHIFT);
>	__tag_set(__addr, page_kasan_tag(x))
>})
>
>... which made me look back at:
>
>	static inline const void *__tag_set(const void *addr, u8 tag)
>
>from patch 3. I don't think the 'const' makes any sense on the return
>value here. Surely the memory pointed at by a tagged pointer doesn't
>need to be const. Why should the tag setting function be returning a
>const pointer?
>
>I can see why it would *take* a const pointer since it's not modifying
>the memory, but I don't see why it is returning one.
>

Right, yes, both your page_to_virt() and removing the const from __tag_set()
return seem to be working just fine. Thanks for pointing it out.

With the macros I was trying to do what the arm64 implementation did assuming it
had some significance that wasn't written down anywhere.

I recall lack of the const thing was giving me a compilation error a while
back but now it's gone. And I didn't think much of it since arm had the same
thing.

If Andrey Konovalov is reading this: is there a reason the __tag_set() on arm64
returns a const pointer? And the page_to_virt() does the __typeof__()?

-- 
Kind regards
Maciej Wieczór-Retman

