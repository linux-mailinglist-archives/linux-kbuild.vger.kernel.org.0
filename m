Return-Path: <linux-kbuild+bounces-8494-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 839D6B29821
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 06:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24FE44E6E02
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 04:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6E2218AAD;
	Mon, 18 Aug 2025 04:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHU++Srz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1B1DF97D;
	Mon, 18 Aug 2025 04:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491180; cv=fail; b=fsC1GKayUz9FbB0uGzLAS9Wzq4s1futmycRoxbV59FXsklwupIAiLZ4zmK/p/m5witUXDV0qST0UFk09Y6pWTGkYrvsGt6rOzWqTbqJp5TTn/595mTCbWHpbmKIxsBP8yWIX1ku/QWfrJj2hXR0B5IjheXFjDHOHlWp5gkb7hOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491180; c=relaxed/simple;
	bh=rKWss+1mSD9PjzoJ6wK/cqyTPKnFTVS7pPhiH0htuEc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tWfgNAbOGypktH58pAvL7mrvaeJsHP068KjXA36neVWjEMKzLbubPABdZQ62uf+Yijanhk2nEjGRXjM5VJn+Dx/bHZoa0Hef4ruvLTJjTQUfOF3Eiv0Fcppwer9aMqYdsgQzBx3VrbPAfjEjOXB7lWYtfULS48EXIxTQunn3K2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHU++Srz; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755491179; x=1787027179;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rKWss+1mSD9PjzoJ6wK/cqyTPKnFTVS7pPhiH0htuEc=;
  b=OHU++SrzfXENh84+8MMutgBhNWvjMKsq2Wnq1dQ3rqjSANvvmhNqRssQ
   2zPB+nuYqJkZp2Bq20Pt/HFZdClfgeDPWLxPBmbEbMQ7sLwbQf62pDOzE
   lshp2H4rIvPcY/ZZXs/qgUf31+2sPlbmsrRATkUyFGbn6wxjHDkYfSvpn
   M5o5aK8lhQIafpXLk4AEUho/gmm5M4OPmfutcoW+0Rb0M9AAtHocmanJW
   3xAUXblad752cj4Ace4Uk9eIit+osx62dmdkeMkgqMLaDjE9FfPonMs/r
   W5twoRzl61Y3r+PUa9avrBZ4CplbFiuk9AmlqVtgYI27ACmx03v925jyq
   A==;
X-CSE-ConnectionGUID: vmVyEeUzRFW8U3czw4W3DQ==
X-CSE-MsgGUID: +OUgPWF+R9KhBmi1XcSq+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68797707"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68797707"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 21:26:17 -0700
X-CSE-ConnectionGUID: 6b4qvhTjSkqaCKeGR4bDeA==
X-CSE-MsgGUID: KTT+J61jTGSl2wqWdcBC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167449412"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 21:26:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 21:26:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 21:26:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.45) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 21:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jxb3JQSu1ODQbcXqtqf0JhAtZ+ZmI+8D8CSCb+V8ph9LPXjfrwCHyplJJJzUZt99gCHKJhQAFpOdUdfEJ+4Vx35NqzHCv8kOZ/noc1Y9Pz0xaUgD7XdsoEEDAshChd1CZlYi3mAfjyKZ2BVR7BiIY4PWtTdOcgnBnW/IategP14CsdyY4EBtRjpYfKJ/v8dP3gzZGY1U0aCqVGLqmdk9Ti9NLXsukSjNVk9yUXCkY0RJUWKLLh1Rr9g9FFxYGHJUP93O2+8zV9pw2z8Ot+Tn+v6Tm5GTwjWJQC2x53xb1+cvhHPtQLTNsolDux4lim1XfxSJhYDpfPKWCSLvuc2sRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56kmjPSgiKy2l/WQHdzZAjlNCu2Uae2yrfhn6+CGtoM=;
 b=Pc+BfvpmjXFgme75YF5k4wa6HjOloPqR+6jPKCJ35nhTXmAqmi6aXWqZImFz2oZ7vx1gKg5p9wYdgaFIXfCk5/o/2xwp7xf+6R8yCGIFX5dP4Z9XjqIFNK79CkDG3yz7pOVmruejp0/agUx8mS7PxCbO3MwKAVTSjs7zMPfiaEB8aFcpXZI1zHg+AC8s0fPnIjZEqr3thvEQqc0Cvs6fc8GXkOQyvBW3UVWR3Uo7MAJSmtEgwcJfCzwxdF4ATEXELk++5rGg3xleWRtmRqg+uMpLu0U9HjIVguRsAE+a9fBEU9BILRZr4hgmhOda7fJv0Q0tR9HQZFoyetxZHJdJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by IA1PR11MB6419.namprd11.prod.outlook.com (2603:10b6:208:3a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Mon, 18 Aug
 2025 04:26:06 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 04:26:06 +0000
Date: Mon, 18 Aug 2025 06:24:44 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
CC: <nathan@kernel.org>, <arnd@arndb.de>, <broonie@kernel.org>,
	<Liam.Howlett@oracle.com>, <urezki@gmail.com>, <will@kernel.org>,
	<kaleshsingh@google.com>, <rppt@kernel.org>, <leitao@debian.org>,
	<coxu@redhat.com>, <surenb@google.com>, <akpm@linux-foundation.org>,
	<luto@kernel.org>, <jpoimboe@kernel.org>, <changyuanl@google.com>,
	<hpa@zytor.com>, <dvyukov@google.com>, <kas@kernel.org>, <corbet@lwn.net>,
	<vincenzo.frascino@arm.com>, <smostafa@google.com>,
	<nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
	<andreyknvl@gmail.com>, <alexander.shishkin@linux.intel.com>,
	<thiago.bauermann@linaro.org>, <catalin.marinas@arm.com>,
	<ryabinin.a.a@gmail.com>, <jan.kiszka@siemens.com>, <jbohac@suse.cz>,
	<dan.j.williams@intel.com>, <joel.granados@kernel.org>, <baohua@kernel.org>,
	<kevin.brodsky@arm.com>, <nicolas.schier@linux.dev>, <pcc@google.com>,
	<andriy.shevchenko@linux.intel.com>, <wei.liu@kernel.org>, <bp@alien8.de>,
	<xin@zytor.com>, <pankaj.gupta@amd.com>, <vbabka@suse.cz>,
	<glider@google.com>, <jgross@suse.com>, <kees@kernel.org>,
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
Subject: Re: [PATCH v4 02/18] kasan: sw_tags: Support tag widths less than 8
 bits
Message-ID: <g4fm3avej2ss3am377ebv5og4kl5crano4n7gwl3hwxff4gx7s@uq2hb3egscno>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <780347f3897ea97e90968de028c9dd02f466204e.1755004923.git.maciej.wieczor-retman@intel.com>
 <cae90aa0-9fa6-4066-bbc0-ba391f908fb2@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cae90aa0-9fa6-4066-bbc0-ba391f908fb2@arm.com>
X-ClientProxiedBy: DUZP191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::8) To BN6PR11MB3923.namprd11.prod.outlook.com
 (2603:10b6:405:78::34)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|IA1PR11MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: aad6271b-dd35-4c10-3c82-08ddde0f5925
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GwXtDYWN0/6A2zzfTqVA5WvFstj1NyikNtG3DXi9uXbL5s5oDPS/zZagJK?=
 =?iso-8859-1?Q?134yH/V+W2L3yHItDh7R/uRu616KzKTk3h3T1oOwokD0RqVcbuX7rOsS9u?=
 =?iso-8859-1?Q?LsFcvqgLgjH6szVRttMk6lEb/x9Oo1jaDYyfsbHsOr/c5qWaEnoRZ1SPtG?=
 =?iso-8859-1?Q?teqrWWMJiVnNcNTsh0c4dpQRcLfENDaORMjg/g1z9nR08iZe9KVXdJq84j?=
 =?iso-8859-1?Q?1o/8QDOSD5F4sp2VP7Guu9m2sKX+gTB/llqiuX90+xQWDPcMNWIszpnW6b?=
 =?iso-8859-1?Q?IB4IyT2niFdvnr5mNifFTpLYeC0R7t5nqUS55dIdtoczcrSMd6diafRHpo?=
 =?iso-8859-1?Q?qCHDt2YsnK5A0rFBAJ15PZnOglw2gYCt2lbGK6kWztBQ3/VxqVSYzF0Yuk?=
 =?iso-8859-1?Q?lA0AjzBa9HMnkpTAjYui3XyvsKWzKy6ewgd8pHOdntDTa8Oge3alHV7WsY?=
 =?iso-8859-1?Q?dsixhmRHDeQlapTkJQ0jfcduYHetQc7tyj6yVL9TzsW8eIRM/QKF88lW1b?=
 =?iso-8859-1?Q?/Zcz+RwbELimtfLoPfkNjcAnfuTeHW7YUA1uTYaFWbb8sK5kmQAI3A9fyp?=
 =?iso-8859-1?Q?2nOGkzs5FZkhj/XhPNjQauHZ1Q11pNr+bHjZGVO6sH2UfdBWJ96SaG7jkY?=
 =?iso-8859-1?Q?WJUhigPq/kyok8O0qP9mjKX2H/ZR9473ygCdeMk7GfU24JtcDLlB/PYG8A?=
 =?iso-8859-1?Q?pZi/Xq/37NSJ1bXQxVar6iszPJFp2cj+poW0OlIAoKSB2v++FdTwkGK3E1?=
 =?iso-8859-1?Q?dgrLdzj3cJtfJWr6+T8HGx6IJWB96BmLlv1Ab71XIVaJmHVvjAISIliVdV?=
 =?iso-8859-1?Q?bK7Wx+MFiazNgCBNcQOoWLCCRDgWJTQtbwfzamdqQVSba6obU9fVhj9s80?=
 =?iso-8859-1?Q?ieihFa3nKJqP2vXV6tF80exXTUQRH3tyJFaEfBYXmFx+8ePYNaPagj2IsY?=
 =?iso-8859-1?Q?ySB83PvJ2f4aLT+YkyVbBO0uvmYTUoP1P9GpTmL+KChqqNziY0S05eW3Yh?=
 =?iso-8859-1?Q?efe+Z1HIEbFC70unGMrnrVgrWgignKG8gp3h+TEzdo34bE1wfJYHAPlQlH?=
 =?iso-8859-1?Q?OoWIU1E7VSL5kccpq7lXhFwD/+pkgfpusirzVGFZ+WjYAE3iE0OqmFWOau?=
 =?iso-8859-1?Q?jTk+SagSVk/3FP9NfLpgQAAPFQqYJBNOoFmj7AxAQF2pKFo7DnathFU/pb?=
 =?iso-8859-1?Q?zzGTBTETesy6K4w4ty7RwKn2gjwakFxcrlc3KQNlqwre6EChiDk4eMNTYm?=
 =?iso-8859-1?Q?TwXs0Kz5ri5O1C8VKTF2yooyxZTfwBiACXna6DVHWUOtd40CiuBb+/7XEh?=
 =?iso-8859-1?Q?dZbDqn7iIZOOQHCjrxjn+it2i6zVnx+Cu/WoGXh0v88RHwCliMPwjhZzSA?=
 =?iso-8859-1?Q?iSUbELtWCPVdryFFe9VeaUQRDbBV4fi9L0nOITcEFaNFJt9Alm/1q80Mz0?=
 =?iso-8859-1?Q?ND9Y0uUC/mAtX4k1mzoTfTES9qYPBvUeHDvEOOo1dpME3SMrjLY0oLK9bT?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rpdnBcSo+bh/nWFcoNHSMawTtYqAFDAbrnBKzFRAscpGhiIWSql8xQehWh?=
 =?iso-8859-1?Q?3TtComW9vhC7+ItLwWjPq2IOFl7Mp5TqDAFeFHywB4JCWFIh2foSYiBmJN?=
 =?iso-8859-1?Q?eRkr+kZLwyzqneRtNE5TIJ7u6Lio/Fx6H4g0kXo3aAAZZk4Q8LilyWoREW?=
 =?iso-8859-1?Q?UYblEVa3K1S7dZ+ivA3hlJCuUM+3LI6ED4Eb3TfgYdr2ThMApCl/fB5eSj?=
 =?iso-8859-1?Q?hGGVS1ZLBUN/rYG8fxYtcqVUtcxAUoyd/qnjyPwispoZW6APDcTiZ3LXrV?=
 =?iso-8859-1?Q?CFR7S+Wa5SNMwq18wCRbexfbHLpQxRw7Iev6hY+T4CDIvHTdItTlSJo/Yq?=
 =?iso-8859-1?Q?gzWD16Jqvbig52YEWQocSRtErb1QegImYqyvPzzb9OKFe5vPanYrgbesPE?=
 =?iso-8859-1?Q?2KnMpaD2ih4aKxMF36bVvFgPRwH6O+Wcx/unF938s7Y5dVv42jj/R2r2sX?=
 =?iso-8859-1?Q?VrsUIxCTzY0RcvwJoMSX8SXXPJfY6U8CColv/8AUSYvl9klTBaKy72XSj3?=
 =?iso-8859-1?Q?NkLOqWmjOsI4dhVQDIyHZyLxKIGwSxUHtsJCd/rQdxYukWCf5M8hRGKUmN?=
 =?iso-8859-1?Q?PudwmYB004OW1DC6KJAs6jR0T/DwFYhlMHX/kli61YJ4XXhCDqL8qZwKmT?=
 =?iso-8859-1?Q?J1Bbq/KzurJhr9TlPaLK+fMzNE0LSzErIcZ/EHwM4YWjzHs7LTkciHoDdU?=
 =?iso-8859-1?Q?nLQT/bvN9qmVksDLVFQYhH+ThvtxZ+MUPlHrgNhk29N4EhMMSn2aRgOKYw?=
 =?iso-8859-1?Q?reKE0NjP3EbVl5qloVOfGvwt3cULlH2Vlx2k9fqc++PYxydEEDMmUJbpWL?=
 =?iso-8859-1?Q?R3RmPyQo5K37L0JZD95d73zbFsQ8AnEQ+ir5xQmnB2yBhS7Cu+NOG2NZx5?=
 =?iso-8859-1?Q?1MOc27pRc0+xQNIGTrPgLCnei5mp4cxu7brAq23cstnVNhUBOuOlIFj+pd?=
 =?iso-8859-1?Q?N84RuNmBiz/mkA1TKdCwgPWxPD/1T9ADqi0lweO1nXEOqVQZoN3bmEnUux?=
 =?iso-8859-1?Q?eOgWjzR6IYrIsDhW0XCf0Art47Dq8pxbIHTurv1WDNjJuZmZNwj+IOTQAB?=
 =?iso-8859-1?Q?fKiFnlBsDD1PngwF5mn4G+dEM7CWHeUi41GXGBSLLSNVQrvxPghn/4Aunb?=
 =?iso-8859-1?Q?ssLJdp6uD1AbguYWErQi1yUC5SUiYDQ9pjtK6NOCavq9/bNgbFIvxaPwz9?=
 =?iso-8859-1?Q?UalNwGn3LdX7iyIQdvUXxfWxETh8l8ji3oYqAOgCGFSV/d+j89TdsWWMVC?=
 =?iso-8859-1?Q?xJAx0CFhobo2yk8UQNbIc5A8uIU4lTYzWKt/5oFRrm2aexTUsoq5qus6ef?=
 =?iso-8859-1?Q?7PaL6eyOPfQDF3C5GewZfz2S1GzeAt9ECJspxGEtuggTYMg1lh09m2S0kz?=
 =?iso-8859-1?Q?GaS/JFksUTiWDKlK3iL5lA5SachdS0EJsiL6gWy/r0LLfzCIPBOCyhtTEP?=
 =?iso-8859-1?Q?8D+VBoxarKtw5uJd6vs93bnZWUd6NA0HBkzh/SutGr366dyzbYK9qkbnH4?=
 =?iso-8859-1?Q?lVXpospx9oGA2hSWlc832P9NeEWPVzGwjcOvUWNFkzHVuZ7ZVAtmvuMA8z?=
 =?iso-8859-1?Q?wkLjuvrcm92CHLPooB0Acg2WxT6XIJkqu9taD6OCpNPmvuY7OXBm8Ob2zM?=
 =?iso-8859-1?Q?kFyiqGXjgR/EPuXDr541XSQMnNtjv/Y9j4GW2GDpJ4MMJDN8xzL1tykDyV?=
 =?iso-8859-1?Q?2COyqA6PUr/7+f3UTJ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aad6271b-dd35-4c10-3c82-08ddde0f5925
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3923.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 04:26:06.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2G59WhXEHdomVpYxHPAKIMI+x35k0cfpH4LIEk3m5r82zBtfwNmQtv8q6ddhlKgimoyomRyC1nK5rNhHyBrfQ/VAIUTCvUu9/yGac+LnuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6419
X-OriginatorOrg: intel.com

Hi, thanks for pointing it out :).

I'll cross compile for arm64 it with different KASAN settings and fix any such
errors. I did this a while ago and it went okay then, but there were so many
rebases in the meantime I must have missed something.

Kind regards
Maciej Wieczór-Retman

On 2025-08-13 at 15:48:32 +0100, Ada Couprie Diaz wrote:
>Hi,
>
>On 12/08/2025 14:23, Maciej Wieczor-Retman wrote:
>> From: Samuel Holland <samuel.holland@sifive.com>
>> 
>> Allow architectures to override KASAN_TAG_KERNEL in asm/kasan.h. This
>> is needed on RISC-V, which supports 57-bit virtual addresses and 7-bit
>> pointer tags. For consistency, move the arm64 MTE definition of
>> KASAN_TAG_MIN to asm/kasan.h, since it is also architecture-dependent;
>> RISC-V's equivalent extension is expected to support 7-bit hardware
>> memory tags.
>> 
>> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>>   arch/arm64/include/asm/kasan.h   |  6 ++++--
>>   arch/arm64/include/asm/uaccess.h |  1 +
>>   include/linux/kasan-tags.h       | 13 ++++++++-----
>>   3 files changed, 13 insertions(+), 7 deletions(-)
>> 
>> diff --git a/arch/arm64/include/asm/kasan.h b/arch/arm64/include/asm/kasan.h
>> index e1b57c13f8a4..4ab419df8b93 100644
>> --- a/arch/arm64/include/asm/kasan.h
>> +++ b/arch/arm64/include/asm/kasan.h
>> @@ -6,8 +6,10 @@
>>   #include <linux/linkage.h>
>>   #include <asm/memory.h>
>> -#include <asm/mte-kasan.h>
>> -#include <asm/pgtable-types.h>
>> +
>> +#ifdef CONFIG_KASAN_HW_TAGS
>> +#define KASAN_TAG_MIN			0xF0 /* minimum value for random tags */
>> +#endif
>Building CONFIG_KASAN_HW_TAGS with -Werror on arm64 fails here
>due to a warning about KASAN_TAG_MIN being redefined.
>
>On my side the error got triggered when compiling
>arch/arm64/kernel/asm-offsets.c due to the ordering of some includes :
>from <asm/processor.h>, <linux/kasan-tags.h> ends up being included
>(by <asm/cpufeatures.h> including <asm/sysreg.h>) before <asm/kasan.h>.
>(Build trace at the end for reference)
>
>Adding `#undef KASAN_TAG_MIN` before redefining the arch version
>allows building CONFIG_KASAN_HW_TAGS on arm64 without
>further issues, but I don't know if this is most appropriate fix.Thanks, Ada
>---
>
>  CC      arch/arm64/kernel/asm-offsets.s
>In file included from ./arch/arm64/include/asm/processor.h:42,
>                 from ./include/asm-generic/qrwlock.h:18,
>                 from ./arch/arm64/include/generated/asm/qrwlock.h:1,
>                 from ./arch/arm64/include/asm/spinlock.h:9,
>                 from ./include/linux/spinlock.h:95,
>                 from ./include/linux/mmzone.h:8,
>                 from ./include/linux/gfp.h:7,
>                 from ./include/linux/slab.h:16,
>                 from ./include/linux/resource_ext.h:11,
>                 from ./include/linux/acpi.h:13,
>                 from ./include/acpi/apei.h:9,
>                 from ./include/acpi/ghes.h:5,
>                 from ./include/linux/arm_sdei.h:8,
>                 from ./arch/arm64/kernel/asm-offsets.c:10:
>./arch/arm64/include/asm/kasan.h:11: error: "KASAN_TAG_MIN" redefined [-Werror]
>   11 | #define KASAN_TAG_MIN                   0xF0 /* minimum value for random tags */
>      |
>In file included from ./arch/arm64/include/asm/sysreg.h:14,
>                 from ./arch/arm64/include/asm/cputype.h:250,
>                 from ./arch/arm64/include/asm/cache.h:43,
>                 from ./include/vdso/cache.h:5,
>                 from ./include/linux/cache.h:6,
>                 from ./include/linux/slab.h:15:
>./include/linux/kasan-tags.h:23: note: this is the location of the previous definition
>   23 | #define KASAN_TAG_MIN           0x00 /* minimum value for random tags */
>      |
>

