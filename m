Return-Path: <linux-kbuild+bounces-4377-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE99B41B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 06:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF1D21F234D3
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2024 05:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59C3191F88;
	Tue, 29 Oct 2024 05:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T3TpbVRb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF712F56;
	Tue, 29 Oct 2024 05:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730178278; cv=fail; b=RAu7ShGuh5cT+EmxU2zNoqNtICVDkS3YBbhrK6n6d/y4ndEdxQf8GQGhJ5gzjVeimbZa0yLJhWhuvc0iTyoN3+fFB7bmjDwiwpPEXygQWIT9T7BOX5mo3f58l5u83cV4dJO937pZAHKVK5twRaxFSabzRWceuwxYRRDFC2rQLow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730178278; c=relaxed/simple;
	bh=YkmIuF98t0RJ/Dmd4f/g3ZH6qJS4gaZ7PHbOTGneN8A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=a3KsNwoxIZYnUEyuZ6So3COUvFe+aJjAXADFLB4Lx+2IBumqkA02qXnG1imJKKSFkhiujwqnC2IUPk3O/74Vhe4IfeSo87OFz6n5floDUoGKHRjdh56JVQAyf9cmtD7iPeL0/4Njog1msSy0IfLHYdqeSYLypvk/cnyazlR+lSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T3TpbVRb; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730178275; x=1761714275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YkmIuF98t0RJ/Dmd4f/g3ZH6qJS4gaZ7PHbOTGneN8A=;
  b=T3TpbVRbE0dl44RB5Ibwd2XLc3/HPc88MhRBSdnF/IFrX3feg7noWbhw
   ivgqkgVUSREiwhALdbdmOpi2HPiYscAGSHU50hApW6s4NBG6fswjK4gbX
   5hFs7Gif3/mq7SAG9rnCx0k1wpcTqO5I4njpztcXBkCb8ye430HCrjTfr
   HngznPJFQqydIqM4e4LwkFc5hew120aMRn0bLtaqDN8/xthbs3ggr4afM
   OlNOC1eqEdfV6YYkeu1autPCHVRTXMeGlYT+42HEEL/ZG1CFVlAdzzYIi
   MN7Bt3i0AH/4x2XhReCgHr+/1mqb1dKoamMcwD+xFhRl2jqkZSHuNLoDV
   w==;
X-CSE-ConnectionGUID: ZaUWZqAaRGOKRVlQ+JODDw==
X-CSE-MsgGUID: ddnYcFLQQBOZxX03wCRiQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40380771"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="40380771"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 22:04:33 -0700
X-CSE-ConnectionGUID: RJ5DuBdTQdyWli/ItOp6MQ==
X-CSE-MsgGUID: NNR+G/w6Tf6UGNCvCj94XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="81908228"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Oct 2024 22:04:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 28 Oct 2024 22:04:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 28 Oct 2024 22:04:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Oct 2024 22:04:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzDivs8YqRuBl0x6CRKaemLihNdmeoZh3I2BOXoNN2AZx8ja3LrTmgV690yIpiFbUbpMsKxoULbSu6IYU/f5JBdAp9/QEoLGePH5G43ABNO/CR8lEM1/VS6K0VXlC0MHXWzKNTkaNRfMz1JAeSZdMb0AMONLrG5DXUV0jg7O93CIk3W0cftIYGIVbY4S5Te9mSb1sM7vii8ceoseVnrmxDCVEdJIaMJhH3wCujDmCpcyqDhK7ZjbF3uphmBawJSsrhdOKalzu9gu/w1eMTcdu0iKcNPC/Rds8WgLFo4W17h9Mg96yX4wsDFtofk8i+sT13BlW1KafiJ2bHBt/2zcUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2YhutE/3kRDKgM2DcK4GgbP7GNN69ZPbqVFrXrhpB4=;
 b=qta9MKrT3umfmyS9htCy4GeTQ9rkmrLmdRHspU3NNajfyZ/1Mprnj/pK0oE1nrTuf7XSXqlPXEy6Bxh9t05RDC+p86pT3cxrF20HijVt/0KVmQKXXVXkuKtdN9dbZrYfLUlXdJqdOFstD00EWduGpVS88t76IazWEEOet6TlxN9aNJLkh6KjRLW1qIFBmI4xDDqLtYeXY0Ix9T2Bue+haLnELm2JcEz1TOuQjo1kwWcwJmhBS8uPudmSB0coL5kBAfUIxjMEbICzUI0uNX8+CfYg9MZWKO0qTs36ZoSVWVs+SDc9KBzlv5GrMlpwtPLjeNJgRUhpzgPATo+mxMaIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS7PR11MB6174.namprd11.prod.outlook.com (2603:10b6:8:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 05:04:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 05:04:24 +0000
Date: Tue, 29 Oct 2024 13:04:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kees Cook <keescook@chromium.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	"Peter Zijlstra" <peterz@infradead.org>, Hao Luo <haoluo@google.com>, Marco
 Elver <elver@google.com>, Justin Stitt <justinstitt@google.com>,
	<kasan-dev@googlegroups.com>, <linux-hardening@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [linus:master] [ubsan]  557f8c582a:
 UBSAN:signed-integer-overflow_in_fs/sync.c
Message-ID: <202410281544.bd98d329-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0193.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS7PR11MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 02817213-4765-4537-4968-08dcf7d727d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZtNDTjfiCgocAQEMGmGRLDYEUTt5CzgjYIA7V4ZpOBwmSEuX4RAOxAC9x5p7?=
 =?us-ascii?Q?q2XN5QZacTdPymhW2L1PQ3utH+89nLT3hUEPhixTo1x8H84ruL7Z6f/galba?=
 =?us-ascii?Q?4gwOh96nIsCeIkFuN8vhhZ57d2ar5W+W4/ubZIe5LLsnWk9qQssuUrbf1ie8?=
 =?us-ascii?Q?0s1jQ98zykE8Lluvkpf7cTd3icfD2Q2FL+QaHt4C+lW6DcN2wmhnZ+oSV9dG?=
 =?us-ascii?Q?jYWK3p9mw5RptKOKpwEUE/umKGJYsvhUdNQf1En4oJ6sSZSQxww4aFkWr2lP?=
 =?us-ascii?Q?/VoJ0PSQlHdltbLwRZsWexBt5oVqym870tjvFZUbZ+5pPRJP3wXhsom/R0yK?=
 =?us-ascii?Q?miiLfEkx9YccFxYiOKYcBVwz8tJW68gQFrfrLdWV5bXoLM2yf+z8NG2HsqQf?=
 =?us-ascii?Q?JGcA9PUx+dAKU9IHJq338i6MQOVyjw0yVdAclvhDn7M1XQjlVyUNNiVdwGnv?=
 =?us-ascii?Q?D/2i+bnuvJ/aas+It0m/QhjLUrf9HTLB5OrDrQbSj8J3hKFOC70ROxOjhJdq?=
 =?us-ascii?Q?1RW0qTM73L8w5IRTyFDbzJz6zGzDDX9bXjXvE4RWbKx7HOOvc8qD8PxE5gB8?=
 =?us-ascii?Q?mEK+/iBv15PCjEeLxyq+OpZM0N7IfOgK1d1F6fjHnErd8wp2HANNn0mTpoRm?=
 =?us-ascii?Q?lJGQBvEO819DEghe+puYazdLiQgbSG8j7urz4Hsw4hLdX9f3d62JHnStOzof?=
 =?us-ascii?Q?+ORKmYCebnHnaJBKD/13n0+JHa5J/k/TVAL+vKuupye5YxaHcADhBB7K7C8L?=
 =?us-ascii?Q?QXo6YMNDKgUfE4CW63sKB7BqAJvZVXOQD4w9cCL/WFgt1GJd8Kn8ZAD6x+h1?=
 =?us-ascii?Q?URU933v8XVupyu4pB7VxLuTQboMWNti8u+OsZBOsIab4DCwwyZlTsc9qRIo9?=
 =?us-ascii?Q?Suc6sFmYDDKCJKl36Jk8iWnRpw2R77941siIO5ovud6o16KDBTAmD/21m+eZ?=
 =?us-ascii?Q?tcEoH1PKeloiv+iOi5wEtJq69h8E7XinwFg171aVgS/foZXgaWwsTeXYa+jf?=
 =?us-ascii?Q?T42seRV84tTR/cn8/t95YLaLkevwacI2CjgVnKnFpC9u5KOkgOC/fGUIIr9B?=
 =?us-ascii?Q?prCF1V5ReT1PBGb17ev+EO6SVuS/6d5/oXPybF7VSZfdt0ANDGQbJGUCXMOm?=
 =?us-ascii?Q?JqKuuwEtT0i8+g1tneT4rkeLJSSJZKh7xmz2fbINW+nWeouY+MoVezR5adDx?=
 =?us-ascii?Q?2FNy7YUGoZz/EpIqiUlhWTJfgp8YtzHUDfIg5FRxq8L3Smtvh+BRgk/f34Tk?=
 =?us-ascii?Q?WTKgabhp5sDC/4oYU/Ib4DnErS9mgq7NOaM8FKgmgQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eAXhprWIXjc65GYDsMPECLFvm+oFz+N87d1ZJYFXIAesfqpJBt86sruURMQN?=
 =?us-ascii?Q?XEM6YskoPIYFA4Ifd96ZrYjbTDtH0AqAdNFkZoHFlLzge4s3JLtAzzZzMSac?=
 =?us-ascii?Q?iPQBYajbnGj0E28fFji4dZA89MswmJSJ+GaUdmJvYLCoZ+GpDF4mlvKHzOPM?=
 =?us-ascii?Q?rc2DWjQ3Z81MGOARmFLCVIZQX+jhvkzRh5We3DEDfDGFYsf+DpNv6EdH9+I4?=
 =?us-ascii?Q?WveajbUOydipiBC5q7HwFEiKvh4esqW32zeRyadjkruD+Yz8cMIjzLDbjH0I?=
 =?us-ascii?Q?AMhvof0+YgWSoGYkYYmSh7Ig424HCSULY0ITE41J50fYF04RRWRza3uYDVWL?=
 =?us-ascii?Q?FZqneVVII7iuUDeCRpH2SGF4Eo1+7HQS+HuHyrEh1v8y8P7zHaBzmVoHy51z?=
 =?us-ascii?Q?k0h+5RYd+pVFKKYGZ3B31Yqul3xhc53qoFNk+9U5UOtzV83rI45/npV+4GIx?=
 =?us-ascii?Q?dg5aHK9DQ9ifAoJVA4QfcTv+dZrowgK68AWwhcFPuGCregbKzk5Kw4k5Z9Xr?=
 =?us-ascii?Q?CpXjqpJcyjo9sYar8rhIwUCr2mY6TgNfJ9xVkY0j8q4mgxFcMT/j9ExNTA0y?=
 =?us-ascii?Q?xD3Vb4HJUIWH3kuRHCxK8iWNR3xnf9wUlQKGPEOroDaUC4SO/KvKBUm7qr/v?=
 =?us-ascii?Q?e8Dghh6k+BqGZYENmFoKholWBGpD7Hgt2LydD5MN9auSlHqIuPNgwMueQNac?=
 =?us-ascii?Q?nN6wYxyipH8bD4daFsIBaPFuvjg20p1cziNmW1/mcH//4xpZiMp4LE3OdVx5?=
 =?us-ascii?Q?Bg/FNEsIp4p4MK0veR0oGhVDnXxbfbMFHJ77erulIKB+Km8W2f3SsJIQr12m?=
 =?us-ascii?Q?BCYvno1L0kFHktiCT0JJjqb1+SRrmCBtsiM8czQXaEQqfCp1j+cB8ieCNzgu?=
 =?us-ascii?Q?TGw18cl8GluaOl700LXazhw2vGNwn9qbLa2N/5sRmBOXFG3GVnGoRyA2IBXw?=
 =?us-ascii?Q?kWZIwF3bp2RrlQxC4PneVvLged6CxA6xX8uM+Kdfedh5KWBA315v+StBq9sC?=
 =?us-ascii?Q?loBeP2acvM40r2Gx/dlwHNx6kSjTfC4RHA1b9+CoeN/ALTFY/ErUGjUx6xxa?=
 =?us-ascii?Q?DBZMl4qX2K19qsGOt+9eLp0nmWwAur1GzkpfyRCNbJWW1Jptr0MS9kIXNbk7?=
 =?us-ascii?Q?2DUUBnu1ZSOTaAFtzTI00Jy0GmHF8JDBKTTDFskNobqMhkLUR8StL2wix/fX?=
 =?us-ascii?Q?QyGDsaTqSOFNupMuz3EEOyGs4eUyJO/CwxmpHgxsQ0x9761YsmPD94Ajht0I?=
 =?us-ascii?Q?VwvI5jMZ+gU0A9EZBq9nMERrndJB1ktvj90+xzCZv1ffcNjQ0+6EhSAbWNDl?=
 =?us-ascii?Q?Ah+SPphWgJftEZuBffXG+kL6orlyIoTIRFwYisPGUdXCCPbyo0yYXCLwNeez?=
 =?us-ascii?Q?jE10/xur8ANFzFpIbuhtYqiX1n5NfiScFN9zBs68Ikz6JqujEKrvxU0GmXbS?=
 =?us-ascii?Q?yEHeDQD1vdhQnKdmLf9wtJWoR2x4kQm8wFwhw+YHKlXwo4XRa4xH/lURpOyE?=
 =?us-ascii?Q?Ld370iHyXb3cO8FE/pGn9GZyP8nL5tFesCw+422t1vlpXv/LwOm4XMsTiYqn?=
 =?us-ascii?Q?vmEIlUVePuzMIemz5M9R56hzE+4NCilkAJqhF4RMsUwuemWBdN+rBMGHjstH?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02817213-4765-4537-4968-08dcf7d727d4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 05:04:24.1367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKs375sdMhd92TaaYBgZjyKg8KLxaVifF4dzPiOTpE4zJ0ePm5xF1RE9zp4wyedpv6axMM6EzgGPmDdidgn+UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6174
X-OriginatorOrg: intel.com



Hello,


for this "ubsan: Reintroduce signed overflow sanitizer" change, we really
noticed some UBSAN issues start to appear

918327e9b7ffb453 557f8c582a9ba8abe6aa0fd734b
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :20          50%          10:20    dmesg.UBSAN:signed-integer-overflow_in_arch/x86/include/asm/atomic.h
           :20          10%           2:20    dmesg.UBSAN:signed-integer-overflow_in_fs/open.c
           :20           5%           1:20    dmesg.UBSAN:signed-integer-overflow_in_fs/read_write.c
           :20          50%          10:20    dmesg.UBSAN:signed-integer-overflow_in_fs/sync.c
           :20          85%          17:20    dmesg.UBSAN:signed-integer-overflow_in_include/linux/atomic/atomic-arch-fallback.h

it's out of our scope to backport this change then to find out the real first
bad commits which introduce these issues.

just made out below report FYI what we observed in our tests.


kernel test robot noticed "UBSAN:signed-integer-overflow_in_fs/sync.c" on:

commit: 557f8c582a9ba8abe6aa0fd734b6f342af106b26 ("ubsan: Reintroduce signed overflow sanitizer")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      850925a8133c73c4a2453c360b2c3beb3bab67c9]
[test failed on linux-next/master a39230ecf6b3057f5897bc4744a790070cfbe7a8]


in testcase: trinity
version: trinity-i386-abe9de86-1_20230429
with following parameters:

	runtime: 600s



config: i386-randconfig-141-20241024
compiler: clang-19
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202410281544.bd98d329-lkp@intel.com


[  215.770370][  T642] ------------[ cut here ]------------
[  215.777621][  T642] UBSAN: signed-integer-overflow in fs/sync.c:240:19
[  215.788285][  T642] 1880844493352075409 + 8608480566024911059 cannot be represented in type 'loff_t' (aka 'long long')
[  215.801598][  T642] CPU: 0 PID: 642 Comm: trinity-c7 Tainted: G                T  6.8.0-rc2-00013-g557f8c582a9b #1
[  215.817967][  T642] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  215.830638][  T642] Call Trace:
[ 215.834397][ T642] dump_stack_lvl (lib/dump_stack.c:107) 
[ 215.839685][ T642] dump_stack (lib/dump_stack.c:113) 
[ 215.844573][ T642] handle_overflow (lib/ubsan.c:218 lib/ubsan.c:248) 
[ 215.850605][ T642] __ubsan_handle_add_overflow (lib/ubsan.c:255) 
[ 215.857665][ T642] sync_file_range (fs/sync.c:?) 
[ 215.863236][ T642] ? do_int80_syscall_32 (arch/x86/entry/common.c:278) 
[ 215.869588][ T642] ksys_sync_file_range (fs/sync.c:364) 
[ 215.875456][ T642] __ia32_sys_ia32_sync_file_range (arch/x86/kernel/sys_ia32.c:107) 
[ 215.886149][ T642] do_int80_syscall_32 (arch/x86/entry/common.c:?) 
[ 215.892113][ T642] ? syscall_exit_to_user_mode (kernel/entry/common.c:215) 
[ 215.899078][ T642] ? do_int80_syscall_32 (arch/x86/entry/common.c:278) 
[ 215.905299][ T642] ? irqentry_exit_to_user_mode (kernel/entry/common.c:228) 
[ 215.912366][ T642] ? irqentry_exit (kernel/entry/common.c:361) 
[ 215.917978][ T642] ? sysvec_call_function_single (arch/x86/kernel/apic/apic.c:1076) 
[ 215.925139][ T642] entry_INT80_32 (arch/x86/entry/entry_32.S:947) 
[  215.931354][  T642] EIP: 0xb7fcc092
[ 215.936180][ T642] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
All code
========
   0:	00 00                	add    %al,(%rax)
   2:	00 e9                	add    %ch,%cl
   4:	90                   	nop
   5:	ff                   	(bad)
   6:	ff                   	(bad)
   7:	ff                   	(bad)
   8:	ff a3 24 00 00 00    	jmp    *0x24(%rbx)
   e:	68 30 00 00 00       	push   $0x30
  13:	e9 80 ff ff ff       	jmp    0xffffffffffffff98
  18:	ff a3 f8 ff ff ff    	jmp    *-0x8(%rbx)
  1e:	66 90                	xchg   %ax,%ax
	...
  28:	cd 80                	int    $0x80
  2a:*	c3                   	ret		<-- trapping instruction
  2b:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  32:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
  38:	8b 1c 24             	mov    (%rsp),%ebx
  3b:	c3                   	ret
  3c:	8d                   	.byte 0x8d
  3d:	b4 26                	mov    $0x26,%ah
	...

Code starting with the faulting instruction
===========================================
   0:	c3                   	ret
   1:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
   8:	8d b6 00 00 00 00    	lea    0x0(%rsi),%esi
   e:	8b 1c 24             	mov    (%rsp),%ebx
  11:	c3                   	ret
  12:	8d                   	.byte 0x8d
  13:	b4 26                	mov    $0x26,%ah
	...
[  215.959775][  T642] EAX: ffffffda EBX: 00000167 ECX: 00000091 EDX: 1a1a1a1a
[  215.968070][  T642] ESI: 11c4b8d3 EDI: 77777777 EBP: 00000000 ESP: bfafd7a8
[  215.976212][  T642] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000292
[  216.099174][    T1] sbc7240_wdt: timeout value must be 1<=x<=255
[  216.190859][  T642] ---[ end trace ]---



[  274.950074][    C0] ------------[ cut here ]------------
[  274.956226][    C0] UBSAN: signed-integer-overflow in arch/x86/include/asm/atomic.h:85:11
[  274.966763][    C0] -560020972 + -1641070746 cannot be represented in type 'int'
[  275.004321][    C0] CPU: 0 PID: 1058 Comm: trinity-c4 Tainted: G                T  6.8.0-rc2-00013-g557f8c582a9b #1
[  275.014695][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  275.024834][    C0] Call Trace:
[  275.028200][    C0]  <SOFTIRQ>
[  275.031444][    C0]  dump_stack_lvl+0x77/0xb0
[  275.035949][    C0]  dump_stack+0xd/0x14
[  275.039999][    C0]  handle_overflow+0x279/0x2a0
[  275.044833][    C0]  __ubsan_handle_add_overflow+0x10/0x20
[  275.050399][    C0]  __ip_select_ident+0xe1/0x100
[  275.055298][    C0]  ip_select_ident_segs+0xb8/0x110
[  275.060353][    C0]  __ip_make_skb+0x257/0x390
[  275.064951][    C0]  ip_push_pending_frames+0x1b/0x40
[  275.070103][    C0]  icmp_push_reply+0xc8/0x100
[  275.074775][    C0]  __icmp_send+0x47e/0x4d0
[  275.079534][    C0]  __udp4_lib_rcv+0x609/0x6e0
[  275.084394][    C0]  udplite_rcv+0x17/0x20
[  275.088608][    C0]  ip_protocol_deliver_rcu+0xe4/0x390
[  275.093960][    C0]  ? ip_local_deliver+0x150/0x150
[  275.099299][    C0]  ip_local_deliver+0xe8/0x150
[  275.104613][    C0]  ip_rcv_finish+0x73/0x90
[  275.109057][    C0]  ip_rcv+0x1f/0x30
[  275.112983][    C0]  __netif_receive_skb+0x6e/0x120
[  275.118031][    C0]  process_backlog+0x1a7/0x250
[  275.123224][    C0]  __napi_poll+0x2a/0x1f0
[  275.127626][    C0]  net_rx_action+0x138/0x2a0
[  275.132262][    C0]  __do_softirq+0x11f/0x41f
[  275.136794][    C0]  ? do_softirq_own_stack+0x55/0x60
[  275.141921][    C0]  ? queued_write_lock_slowpath+0x13c/0x13c
[  275.147853][    C0]  do_softirq_own_stack+0x55/0x60
[  275.152840][    C0]  </SOFTIRQ>
[  275.156181][    C0]  do_softirq+0x46/0x90
[  275.160351][    C0]  __local_bh_enable_ip+0xe0/0x110
[  275.165410][    C0]  local_bh_enable+0x12/0x20
[  275.170019][    C0]  __dev_queue_xmit+0x5bd/0x950
[  275.174874][    C0]  ? read_seqbegin+0x78/0xc0
[  275.179543][    C0]  ? neigh_resolve_output+0xec/0x180
[  275.184754][    C0]  ? trace_hardirqs_on+0x56/0xa0
[  275.189687][    C0]  ? of_get_ethdev_address+0x50/0x50
[  275.194928][    C0]  neigh_resolve_output+0x133/0x180
[  275.200083][    C0]  ? eth_header_parse+0x30/0x30
[  275.204881][    C0]  ip_finish_output2+0x598/0x6c0
[  275.209806][    C0]  ? ip_finish_output+0x47/0x110
[  275.214703][    C0]  ? __local_bh_enable_ip+0xb0/0x110
[  275.220076][    C0]  ip_finish_output+0x47/0x110
[  275.224815][    C0]  ip_output+0x49/0x60
[  275.228926][    C0]  ip_local_out+0x74/0xa0
[  275.233397][    C0]  ip_send_skb+0x18/0x110
[  275.237738][    C0]  udp_send_skb+0x2d7/0x350
[  275.242281][    C0]  udp_sendmsg+0x9c2/0xa70
[  275.246883][    C0]  ? udp_sendmsg+0xa70/0xa70
[  275.251648][    C0]  ? udp_cmsg_send+0xd0/0xd0
[  275.256670][    C0]  inet_sendmsg+0xa6/0xb0
[  275.261266][    C0]  __sock_sendmsg+0x48/0x80
[  275.265773][    C0]  ____sys_sendmsg+0x13b/0x1e0
[  275.270597][    C0]  __sys_sendmsg+0x18b/0x1c0
[  275.275597][    C0]  __ia32_sys_sendmsg+0x1a/0x20
[  275.280454][    C0]  do_int80_syscall_32+0xe7/0x12c
[  275.285440][    C0]  ? syscall_exit_to_user_mode+0xf0/0x100
[  275.291087][    C0]  ? do_int80_syscall_32+0xf1/0x12c
[  275.296333][    C0]  ? rcu_lock_acquire+0x30/0x30
[  275.301222][    C0]  ? syscall_exit_to_user_mode+0xf0/0x100
[  275.306894][    C0]  ? do_int80_syscall_32+0xf1/0x12c
[  275.312116][    C0]  ? do_int80_syscall_32+0xf1/0x12c
[  275.317262][    C0]  ? syscall_exit_to_user_mode+0xf0/0x100
[  275.322879][    C0]  ? do_int80_syscall_32+0xf1/0x12c
[  275.328094][    C0]  ? do_int80_syscall_32+0xf1/0x12c
[  275.333216][    C0]  ? irqentry_exit_to_user_mode+0xe4/0xf4
[  275.338851][    C0]  ? irqentry_exit+0x56/0x88
[  275.343455][    C0]  ? sysvec_call_function_single+0x30/0x30
[  275.349279][    C0]  entry_INT80_32+0x125/0x125
[  275.353945][    C0] EIP: 0xb7fcc092
[  275.357581][    C0] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 f8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
[  275.376574][    C0] EAX: ffffffda EBX: 00000134 ECX: 01f07b00 EDX: 00000000
[  275.383603][    C0] ESI: fffffffc EDI: 85858585 EBP: fffffffe ESP: bfafd7a8
[  275.390502][    C0] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000292
[  275.400392][    C0] ---[ end trace ]---



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241028/202410281544.bd98d329-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


