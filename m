Return-Path: <linux-kbuild+bounces-8768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E19B48F05
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 15:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7908F3C5322
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 13:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E552C305073;
	Mon,  8 Sep 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KlzLrT9A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC6712DDA1;
	Mon,  8 Sep 2025 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757337152; cv=fail; b=loOulTq9bJG04AmV1g5kHceWtfwjVC9VssnZEJ6mGeBTZt01uCcH7jL+5vf4o3k7VwOFpqykC6vVJRy7YazE8gNL0+d6BX8PK6iratgMqHL2RzuWsAtDKy5fCcXnD6i5B/s3XyfH3IIUfbRao537xBlTw8NG2zOJuzwjs02ZuKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757337152; c=relaxed/simple;
	bh=9Hspok/f0n/mrgLo9zVxHuBoCgLQXPvcZLz/RtvdtrQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gvl+S/NZ4irPpd/XmyEBeSGy7S//o51mw1yaI2/M2v/qiAHkXCkXvd0jzWxHxQdRcSI9bb6tL6fHPk6+dA8d8esF7OPZqcMXVSo1xJyC46MlguF43SNxAGafvwNwdiNVeLZpE23f1sK40duRet3yLsdgt4Pa7F3CqSrh8VpcrTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KlzLrT9A; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757337151; x=1788873151;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9Hspok/f0n/mrgLo9zVxHuBoCgLQXPvcZLz/RtvdtrQ=;
  b=KlzLrT9AvGwIX8kek4pzlCoGwCj71AuZDgz3D+yoH5o0yAMT0RGeTui/
   K+4zGxtlY1zMcNWXde7WrD9NPywNrgMcr4b80wH3IGJnk0mv52qV8Xbcz
   8vilp4HdFHFKX+9sghBJi/iGPKY4tVa29BtNh2/48Pcm4+xdTzQ1nyXMc
   RovAIrouozUoGvmTOeMhFvF7dCakUwQDQ7oCfFtWma3g134EPjf+KjOjA
   DXyvLBJYH/8ay1pxoo5kklv4axTqE8xUELRJp+Bhzst/Wa8ptm98Ji3WN
   F3S7dOz9OGjBlMN3yhL5XH4CGhelJr1PtkzCJOPn/dyi5Izhldp8jrHWm
   Q==;
X-CSE-ConnectionGUID: 316ZLG35Rl2pN21viPfd2g==
X-CSE-MsgGUID: PujHJAMpSleBVwYZFqa7Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59290035"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="59290035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:12:28 -0700
X-CSE-ConnectionGUID: PVvD2I9lQ6CBhoXxmk3rDg==
X-CSE-MsgGUID: bbs5i4KTRRWNqcsES/09VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172713282"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 06:12:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:12:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 06:12:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.63)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 06:12:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6thjIgeY3wLtDNOhceLbjAR0jZEp4vk7rmIJ9X/tCeCttS5Bb9UWh5mgOTwEYf5BpRopJaOhBpHE2AtcW4e+9Q1Q2N7cm4IaisP+iYM+6UGbHztM3V+fiwR4IBz1aB90oZiXUJmz1I/7wDJDRxqa1kP+VgLoHJfKxxRYK0IM0W1Rewl/7kUsm+mvFsvjQylo/SLnFwqZPe9oeSB2cFySbKIqBsDtsMILjeuZnPUnoNWzMSIIfqblGM3iTRvc/PP2BmT2BNaeVBe1OjwEy9je/UbGWr7ncBwgCg8zTGDsauXoi7O7kXPJwpIsQ8MIrl5yv75gy16NX+UPdpES7czsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CnOrV0w3m8NGdv/cZSt6OBHmv6PyEmy2jyvM+8oe9Q=;
 b=UtNdOR1i7IrobOZK4ZKYQQb4i1lj7Wd/TZ5a75DlZ9/Qh0jvO/DNqgAf2HJw7COcAZCUt2cvEkk+QoYQxluUOhd9NFwNeqmiZjs29xfAOikerKoc/mpC0V24vNNNFL/sFx5ZqWCKu9HnvuczKxYd1Zp2YZ2RKTQSJPBib0zVNx9lx+s3DqtPvS8u6hyvYzxeDpEia095PhxSVTf2oUIuEGZPC71NAA9irM5b9eMY82XtUUoRqoD7b1NCbgJWJrL8pcv+xsX5xeLuI+fs2C8TC13fY45OXgnYUkSlRttBqNw8AS0BgBOtGXa26U5mpHAJoPseAiWHrAKAdQE+PZwr+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SJ0PR11MB5024.namprd11.prod.outlook.com (2603:10b6:a03:2dd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 13:12:17 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 13:12:17 +0000
Date: Mon, 8 Sep 2025 15:11:17 +0200
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
Subject: Re: [PATCH v5 18/19] mm: Unpoison vms[area] addresses with a common
 tag
Message-ID: <2xfriqqibrl7pwvcn6f2zwfjromyuvlxas744vpqrn2jthbzu6@nrhlxafjpfnr>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <3339d11e69c9127108fe8ef80a069b7b3bb07175.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZedGwtMThKjFLcXqJuc6+RD_EskQGvqKhV9Ew4dKdM_Og@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZedGwtMThKjFLcXqJuc6+RD_EskQGvqKhV9Ew4dKdM_Og@mail.gmail.com>
X-ClientProxiedBy: DU2PR04CA0335.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::11) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SJ0PR11MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7b93bf-0aeb-44c1-3c13-08ddeed955e9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkJDYVFwWk5TaWlCcnp1TWxwRmluR21NZDhpWGdCellERFhZYm9QVXRvV3Fq?=
 =?utf-8?B?ZEkzajMxa2RRV1Z2R09TWWwyckQxQVVrZWZIcmtyb3FhWUsrbDlLenJIR0lV?=
 =?utf-8?B?R3AwY0RQS3NTS0V3Mk03Q214NFk0SFoxd0ZYZVE0cG92a2lHTktJMjBQQXZr?=
 =?utf-8?B?ZUZOOWZDTWk2cDVub3dQbGp6MGNKVmZTVHNyVzR6NEtZQUZHb3lMVHVDODh2?=
 =?utf-8?B?dkJERmtKaWVYcmw2UkQxZjlWR0tLN3RrWDNjemg0b3ZSMUxaVUtCb1NJaThW?=
 =?utf-8?B?cVh2ZUNQM1VUMkVDdjlicC95TlNDczBzNXBKT3VNT0Izamc5d1pZdUFwbEV6?=
 =?utf-8?B?MU9vYnR4NVRpMlJSaVNhQ2t4S2xwTU51RUJnZ0cwbWhYbUhBOFYzZjAwanJa?=
 =?utf-8?B?NEd2amxuQWlyRzZ1eFdsUkZ4bWdTSFdsOHZ1VEY5WlhuaHREYkUrTXRPck5O?=
 =?utf-8?B?WkpHZ1duSXlNU3pWVXdSSW4vRmxKU2YrWVZDYXZNbzdTbmV3OStGaDJkOC9i?=
 =?utf-8?B?RjZObUZmMml5amxIYXlLTWxSV3ViMjk2UmlYOVN5WmRsb0xNaHRSSFhqbEIy?=
 =?utf-8?B?Ukl3eEVwQTAvU2R2bm5tMGtjWE1xbmdYNnNkc1U4TmV5OVZ3Tk1NNDRMVHBr?=
 =?utf-8?B?VVhJOFJvSElkK2tCU2oxeVd5QjQ0M0svcFJuaDhnY1Q3bVp6M2c0SFUrRnk1?=
 =?utf-8?B?UkIwaVBtbW5lbGhtMXFTbjlCTXJEYzRpQm1mb20rOVpGYkJja3o3TXk5UGJC?=
 =?utf-8?B?d1FkSXBWVGR2M0pBWm5Vb04zMWE5cGo5aFc0ZlRaY2tEYWFqSnNoM3V1bFNz?=
 =?utf-8?B?WVZYejJvUG9HWHlBaW9sMDdjNGNrbVREckVmcFVJaUpLb1JrenRXU2o5TmQy?=
 =?utf-8?B?TXBidjh1Yjk5R2xya29xVDIyam1DUkJpTTB6ZXYxdy9PbE1xYzg5VE5WUldX?=
 =?utf-8?B?UW9nVnlaYVdSOEh3NXRKWWF1QWJOYmFPS2pBbk9hcCtiaGVKUDI3UG9keHBZ?=
 =?utf-8?B?cWJtOVhjVGcxVUphOU1henNKR21XOUZ4MGVhYko5Y2pnck5YK2t0d1FGR3Jt?=
 =?utf-8?B?Y2c5WFhaQ05NTy9FME9jUUhtY0lCMlVrWmMxdmg3b293SWJzVkM0djVjU2lR?=
 =?utf-8?B?d2J4NldwaWdSbEZkM2FleFM4UnliSlRvTVVsMm1mL3NObXVxWkM2RE5OTGJP?=
 =?utf-8?B?MnB5R3dVMTMrN1FHZ2Y3OTloZHlvZ0xxdWpoOWQ4M01kalRFY2cvbHhmQm5i?=
 =?utf-8?B?OVRjalJNNnFNbjJEZ0UvT3RSK253aHhGbUg4S3kyK25YZ0w3ai9GK2lpOTRT?=
 =?utf-8?B?aW9QY1J6WFRqWTJqbXZwV1dNM1QzeW5SUnBKRC8wL1ZuV0gvRTVaM09zVEFI?=
 =?utf-8?B?bytNUDVQL0ZsYTdDWFZKM3VlQjJkdXg3cHBjaHo1UlFDa3NXOU5GQWk2RjlZ?=
 =?utf-8?B?MmkveVltTkxzQzJiWDA5aTJPaTNFYWh6L3ZLNVBoY1Nwa09UaXMzSEhxeHN1?=
 =?utf-8?B?M3JsV01mcExjZDhnUTZzZ1NDcXdxTEFWdHpMb3QvRHpWdEVtcUV6Q3JaSDB5?=
 =?utf-8?B?NHlRdkRDWXRocGhMTEVuU2JpUzdwQnNnWXlOWGx4YmllRm9JNWc5eVBSU0w5?=
 =?utf-8?B?aUo4QTZyNm1UMW1MMU5sbk1wUlpFYUNiOWpDUGIxQkJsbDU3aHZpOHBUZk1L?=
 =?utf-8?B?QkxMS2FRaC9ZS1BZUUxSajB4NTZLdTUxaWRMUWJsT1Y4WXZtUTNhMTZ0c01x?=
 =?utf-8?B?U2daYmZHOXpaMGJyL1ZPbjQ4dS9IbElmZXZsdkRERW4xYUhSZy9rRXRiYWk1?=
 =?utf-8?B?VjNZWkJIZ2FHUXdtaXBSanRQRFZCWnU1cDY3QmdSOXcwamFNQTVkV0hERVlC?=
 =?utf-8?B?K2dZR1FIMk5GMkdYdkh4RWhoYU50RGJ6MWl2K29Ya2VXNG5LUSs5V3E1UWQz?=
 =?utf-8?Q?hxPWKyCwzjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akpFMFc5eUxFMzZXZEoxdCtYcldrUUowVVVJNU5DRHorbTJFRTVaSTEycmxz?=
 =?utf-8?B?RWljcVBBcWhVZFdla1FBVStFSXFDazlPK2VMZE1ha0RraTNBRzNPQUkzN2Ni?=
 =?utf-8?B?V0g1ZnhiTGVwbEdYVVMrYUNGT1JKc1FNM0xhSHU5WVBPK3pndWg3eDcyei9U?=
 =?utf-8?B?U3MzTk4vS1U1T0Njb0dQL1NRSjltS3JlNnQ5UmhhMmNIRkFhM3RBcU1IN05k?=
 =?utf-8?B?WUNwc2ExTndSMGxjQXk4OHZtVkV1YkVoZmgrcEZtdVdtNHl6R0k3ZVVRWWNp?=
 =?utf-8?B?TWJNc0NKZTZFSTdwVWRUZE1BSXE0akYzbmE5M29CdTR5QmJPdktvcTlsdEVX?=
 =?utf-8?B?NFp3UjZzN2pSc0JIQ2Q5Qmt4UmV5ZzFnUDlQWFdXcWxpZUFsVXZtbFB0bm9K?=
 =?utf-8?B?L3R4WHJkdUVFbUxlNkxFZjdlZ0RPSW5veElFb0ZkeTlvcXhvMUtTMFJMZHdN?=
 =?utf-8?B?a291eE95NG02eGFlcXlxdm1hZk9YdTI1eEhNZlhYdUxCN3RIY1psRldGZGhD?=
 =?utf-8?B?S28zTzRONU5YNjZmOHUxRjB4SGN0amRTUWNTanFHeWwxOEpBZXd6QXRtVXJl?=
 =?utf-8?B?QmhhemI0UkVvS2ZaQWhvT25FNWxSbkdvVVhBOG5xdnZwb1dKank0cUZOZ1lW?=
 =?utf-8?B?S01sNy9ZdElhc0JqeUVJWHpXSzUwWitXSXkvZ1IvMHZDQ3hoMFlkSlJhRG9T?=
 =?utf-8?B?R2YrSVhrN29MMjBITVh6L3JKVnprQmZROCt6Wldjd1RvYVZydjlTQkV5dzhJ?=
 =?utf-8?B?V01vRFdiVU40MFl4Z2MyQ2RTeGJTRDMyOTF0RjFUTUxrSm9PNHNYc29xUEpy?=
 =?utf-8?B?RjNuOUpWNFpiZnFMR3lpZkR1M2NJbkJ3WEI5WDFFS25Lazc1TXF0Vk8rdkxm?=
 =?utf-8?B?Y0ZVQXJtaVROU2pUYTI5d2JiQ2FibCtRai9EaHFpdEljRTUxYnJ6dnNTQXRQ?=
 =?utf-8?B?bHB1a250emF4T3ZQcGlZeWcxWkFkbDRob0g2RDFRSTZiUWozbDBuWTJwRHp1?=
 =?utf-8?B?NFl5MWdJY1dzNnpGZ3NZSVZlSXdtNFh1citzc0ozaFpuZmlkWm9mU3I5M011?=
 =?utf-8?B?alJNYzFTRkppOU1aanprYk5aNmRiK09iWmpPWWE2ZW9yWWNJSHVqSHYvOTc3?=
 =?utf-8?B?V2ZXa1U2aUswc0I5cFZQSG81UWZGalhnR25sUFVTdWNwQnFYQ1VySlhWT2Rq?=
 =?utf-8?B?WDFscXNnNTMweXBhbCtlbHRlNzFiRTBGcmNKalVoY24xLy9SZjd1OUlwTW1P?=
 =?utf-8?B?UjhvY1NKRUovUFRuaWZ5ZmpOUW5WUDk4a0tCaGxHbWlveERMbktLQ0psYlNj?=
 =?utf-8?B?M1I5aVp1dFRtOUNvUk1wTkNGNVZ6YjN1WFRMSlRXeG8rTWxCWUNlYkdrUmdH?=
 =?utf-8?B?MGl1bUg4NGRTbHBXT1IrSDJrYlJGaGpMQnlHSUpxOTZVNllGVFFKb3NxNmlN?=
 =?utf-8?B?TGkxL2J6OENkU1VZZ0lmSWZSMDNLZW9Dc3o4bDAvVm5zNWZ4eTluaTR4L1N2?=
 =?utf-8?B?cDBKclkvSUg1WmJjV1NwOEZKSlRwVjRibUo4NzNlZmQvRmhDOFNxaGY2eTFW?=
 =?utf-8?B?cTJDbmRMSXI1d0VTSmwwcm1VTngrYUxybkN5UWN4TmxxVGVNTzhLOVFvWmRN?=
 =?utf-8?B?SVFPVnRrK0txYUl0aUxzcEx3MHljU2ZPR0FtR3EzSFpWMXBrMmo2TGpGQzRt?=
 =?utf-8?B?NG02TzRvME9qWVc2bXI1ZDJzZTFoS1JaTU5BYVdJWko2NTVtb09INGVZWGhX?=
 =?utf-8?B?MFd5TmUzYm9Pa25LK3lJTHNXaVBoZDVrV013N2ttbkw1d0JCb1pDVVBBWU1B?=
 =?utf-8?B?NXdxaS9ZWmhST2tGSlVwbXM1K1pETjdvQXREVnV4UHhMVkE4am5rbW5DTVdr?=
 =?utf-8?B?NWlXSU1zb1I4RzhXQ0hjdnRyNE9TY3Y3QTcwMGFTVEZGT3dFSlFpaE1BQVVv?=
 =?utf-8?B?eXpic1dBb29tZUM3QUZ5UjBFYmR5RmlsNVN5bTlBcU5oQWgvSUpLR3FTaklF?=
 =?utf-8?B?WTlPYU5TODlSR2pBRGFwRkdnSVU2aFJOMjl0c1N5QTBZTExhYlduWDF2NlVo?=
 =?utf-8?B?eVJrSFI1NmhmQVNKd1ZRNmlnUjNMQ1piKy93NkpLbUNnZEl2SzFta1hyVUR2?=
 =?utf-8?B?c0ZFU2hNSkdXNGFLRHFlOFFIWDNyWDhpQmJjWkJrbEU5YitsV0M3VHNYdjZE?=
 =?utf-8?Q?RnD2E8gurjeg9Ugkw42wS1A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7b93bf-0aeb-44c1-3c13-08ddeed955e9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:12:17.5270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pF6GhCj61xp2BHSxtlV3729/SuXP2aumzWH1O04uC7c3cXkAazyyREMCZPfOIqFY3FWuzLLwT8pwPS2yCKJ03rDZ9ZewqSYxbBTqbxv+8u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5024
X-OriginatorOrg: intel.com

On 2025-09-06 at 19:19:11 +0200, Andrey Konovalov wrote:
>On Mon, Aug 25, 2025 at 10:31 PM Maciej Wieczor-Retman
><maciej.wieczor-retman@intel.com> wrote:
>>
>> The problem presented here is related to NUMA systems and tag-based
>> KASAN mode. It can be explained in the following points:
>>
>>         1. There can be more than one virtual memory chunk.
>>         2. Chunk's base address has a tag.
>>         3. The base address points at the first chunk and thus inherits
>>            the tag of the first chunk.
>>         4. The subsequent chunks will be accessed with the tag from the
>>            first chunk.
>>         5. Thus, the subsequent chunks need to have their tag set to
>>            match that of the first chunk.
>>
>> Unpoison all vms[]->addr memory and pointers with the same tag to
>> resolve the mismatch.
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>> Changelog v4:
>> - Move tagging the vms[]->addr to this new patch and leave refactoring
>>   there.
>> - Comment the fix to provide some context.
>>
>>  mm/kasan/shadow.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>> index b41f74d68916..ee2488371784 100644
>> --- a/mm/kasan/shadow.c
>> +++ b/mm/kasan/shadow.c
>> @@ -646,13 +646,21 @@ void __kasan_poison_vmalloc(const void *start, unsigned long size)
>>         kasan_poison(start, size, KASAN_VMALLOC_INVALID, false);
>>  }
>>
>> +/*
>> + * A tag mismatch happens when calculating per-cpu chunk addresses, because
>> + * they all inherit the tag from vms[0]->addr, even when nr_vms is bigger
>> + * than 1. This is a problem because all the vms[]->addr come from separate
>> + * allocations and have different tags so while the calculated address is
>> + * correct the tag isn't.
>> + */
>>  void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
>>  {
>>         int area;
>>
>>         for (area = 0 ; area < nr_vms ; area++) {
>>                 kasan_poison(vms[area]->addr, vms[area]->size,
>> -                            arch_kasan_get_tag(vms[area]->addr), false);
>> +                            arch_kasan_get_tag(vms[0]->addr), false);
>> +               arch_kasan_set_tag(vms[area]->addr, arch_kasan_get_tag(vms[0]->addr));
>>         }
>>  }
>>
>> --
>> 2.50.1
>>
>
>Do we need this fix for the HW_TAGS mode too?

Oh, I suppose it could also affect the hardware mode since this is related to
tagged pointers and NUMA nodes. I'll try to also make it work for HW_TAGS.

-- 
Kind regards
Maciej Wieczór-Retman

