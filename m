Return-Path: <linux-kbuild+bounces-8783-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79859B4A61A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 10:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6077E3B10B5
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 08:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47A427815D;
	Tue,  9 Sep 2025 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zf+CDuVg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16602750F6;
	Tue,  9 Sep 2025 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408055; cv=fail; b=oalDTu0u4Dh+RcBNmIc0KcGQWkugRjH7be+8I00UgUY1dBOsckQ6XiHtSl1btbX3kF1C9Ck72W8hEHt2Y04DcIrZZXQ16s7MIJliiKJ6lEoC/tXMmxx/A4wE9zKfu485cq/I/lZoaC/QJ1p/D6ELpC3/bdc8ETP3DKQ2DF7PDvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408055; c=relaxed/simple;
	bh=peMEPHXvC3lm0MbHMJ+F/jdS2c1BgjMxUkbRL6kW978=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZfSsRWCYnCCU6Dx0olpTNb6wvXRLPdVw3FsU0pOG0CKwWRZVAQnRx+ukYassPuJnxelt19g40q53FvFjQfUw1dwjLCWANxydSpnXoij+MtjwxFkc9RvXcv/5y1CipGLFkqTrQrWt0M331QoTFmE13a7H+vhLiPOlVF2EsU4Y/HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zf+CDuVg; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757408054; x=1788944054;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=peMEPHXvC3lm0MbHMJ+F/jdS2c1BgjMxUkbRL6kW978=;
  b=Zf+CDuVg7fWzQ12AVtJsGdcjubhugSGLB/8AKIKXbSB7HrCTWe1icdf+
   tKX2zBRVjVniSKh2M5M/Jm2vGwQEMVR9xW/DynIwAbucGc/GmNuT+YeUo
   xT/Nqq8s/i0rgsLt19ziiuHcSI2fXGGRAav3XPPHj8hGUy8GA5hbwtLVH
   /LluNI2KwwLUsyi8SFKFRqwjkHNic3zsSuFhwNDM0v5tJTaxN3AFG8ZVU
   CYPKuQVQdP6W+SiPRbhEOIsoYvWWtMPNfttaSOVyYY0qGIcPYJ01ED940
   YhLlATrNDfYvukFIjPqWay6UO6NQ9ILyOc/+zWsPAJIfAUn/CrOmFHwcr
   g==;
X-CSE-ConnectionGUID: l3Zo5faPTlmzbR0hUvCigA==
X-CSE-MsgGUID: 2GXbNkgjQcKhMCthGq9vpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59831011"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59831011"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:54:12 -0700
X-CSE-ConnectionGUID: xJqo95yjT+Cs6HxHQlcsnA==
X-CSE-MsgGUID: A3Hb8INSQUykvyoQMLvN1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="173493999"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:54:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:54:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 01:54:11 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.59)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:54:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjlvYNBQy8h1imCkV0QVlhg+7gbKSKWp4QVmdPN8tJmJt2rD2UgGxbR+XmgYG1C9qm4/lN8qaq0FGG019U2VVeLj/PIUjGuRFcwwgIPNUR83iKQbB+TgSDwRSrYXY7W7kVB8UM93mPVf0nVRxGTXzHWHPtrmpazJqiDzuBuC9XOwFgA1N/XgYX+yt5RUbumld+fOxSJOisHzbE+DW1PjGSiI8Dmpuk5istGGZpmBceXPazquXQ0YvrxbP/7IUh2ebHBqwaE9hK2Kn+cCmEL7VSVhZrP2eRezjxTxMmDavSQOyVx4nDdmAHF0Sl7oO5gHsNkNMWbgYfnuAT6QYi2QDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSQGm55NyRV3vwmZjBzOCDU/H5qZ8W8i1JEkgogs6bA=;
 b=yxFLP3nJDbMTwZkJPG2UWrVEfpiPE6VTdi9c2ZnLOQ/tYSTITjkxayTtxAjvPOWeL0VUB4FM06ZigoK/JBNfbt/vvx2fqb+fbsC7fEhTKAXA1yfZaIIxpaCaMBHXXWRbz2JAUNCN5MaE8i6838dQywAsDrYgQtUOw/Av3/+kN5pKfNZ+w8JV2a3jVWGH8o4pZDKPHFJgRYpXZ+Q5unDQNsi3i1MKpXOX92MyIOiCcWx7K0UqtIe/SDIQx5uFzIDbJCJjvFS3iSihpboNuRwHyadfHk5v+LHuilAj94V0Si5SwRu09B/0epQhK2fHjvGej560UWPyk+fqsi9HZgYbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by MN6PR11MB8104.namprd11.prod.outlook.com (2603:10b6:208:46c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:54:08 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:54:08 +0000
Date: Tue, 9 Sep 2025 10:53:51 +0200
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
Message-ID: <47ip2q7fc3q2igjjjg24bl3gwlpcr5y37pahkqb63ridzj262u@augjvsnpq4kz>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
X-ClientProxiedBy: DB7PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:10:36::22) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|MN6PR11MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: a7acf006-d1f5-4f70-55d3-08ddef7e700d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUFWS1lVYWJEdXJoaW1GUzFLZllZTWFFbGRrU2lFOUJMbGYyN0xUbFdVbEc4?=
 =?utf-8?B?WXJpRE9sWVFKZmc0MEpoOTE3ZmFqS3FQenMrUjNRZElreVYycWYwd3ZDWHg0?=
 =?utf-8?B?NTRrNjNOYWRTeWtKYVdiUC9VdWppY3laY1pLaWFML0g1WDNwakc0UDNiRFhy?=
 =?utf-8?B?QkJ5OXFvWFZXTHFHV3cyUWZvZ0NUa0RLdXVTZFBnQlNCTktwNUpxZVY1UWxP?=
 =?utf-8?B?Mi9XUnU1eUtiQW1yMzkzQThXb0FhajIySzdDc2tCSjFIdDB4aVRleUZlR3N5?=
 =?utf-8?B?RGtoRjFjOVFDbFlyY3c0MTBFY0lRQmlsNjl2em9xUFFCNXdiVWpueWZjeGZm?=
 =?utf-8?B?S2hKcmluYTE0MkNuUHBjQzF3cDJVejVIRGRpNEFPK0hvSzV2cjdGa05MbFFr?=
 =?utf-8?B?ZkJycHNYb1F3RkZrZy82L0xkSXhaSnRyWFRKMWUwME1GSUVSTVhKZ1hudCtB?=
 =?utf-8?B?MjNMT2twblFmZDRvKy80Q0tjQ3FucjNwTzVCQm4xSUxsNWFRQWo4bnNlaGlw?=
 =?utf-8?B?bjVsZjIyMnNMaFRIZW5rUFRuZE1XZzE2b1lrMGNxMm93dFVtbm1FM3BqeTRH?=
 =?utf-8?B?MmdnWnVrdEdBY05XRkNNOVl2Z3A0dmxQcS84M3cyN0o0ellJUVpPMUV0dkdG?=
 =?utf-8?B?VVpHYWVHdXVWUmcwRmFqdlVINnlVUE10Uy82K1pMV2NFRVhLOTZZNXNVMDJ2?=
 =?utf-8?B?MVdlcWwrckpNR05KdVREODdnQUxta29Ya2VabVV5R1M2RFcwWTB1SjFkUG1v?=
 =?utf-8?B?ZmFHeVpnc2haUEcxYlhvem5zZGhhYXJ6TjlpcU9vSkUvdmtJK2haYzBZL1BC?=
 =?utf-8?B?b0VlcHpOMXJuZ0FLZGNJL3d6MWV0dUlnUjlZaHlPY1NDZWczdmVCZmpUcGhD?=
 =?utf-8?B?WjZ5ZHAvbnpiUk5vd05aczJRMGMxQ0ZXL1NzZG1aRDl0VjZjcGlZNmJSMXdE?=
 =?utf-8?B?N25leENTdW9IMnNMTDdRQ0duVldXKzJ5cXU1aVNzbHlDamIxOGdjS05yTDZa?=
 =?utf-8?B?QUZzc0dZR3lRK3I2NjZwL3JJUktZQWJiaERiS2xPUSswVzd5SlNEQVpNQ0RX?=
 =?utf-8?B?OEZyZCtDOHl1cFIrRll1R2dZWEViTGx2YnZNeVRjU0k0a2Y4T1FqSVdUajFj?=
 =?utf-8?B?Mk5CLy9NVUJ0U2UvWDlRUzhhenFabEJXdlFBMXRuYWh5MHNVaWJjWnIrOWtR?=
 =?utf-8?B?SHc3YlBwU3VLOW1SVjEyblMvaDZsNEJTTThudUNIQ1BwaXdYZUcyMnF4SkVS?=
 =?utf-8?B?MzUwV21WVWg1YnlKVDg5NDN5ay95Q3BCbjNCMDU3U1RURlJKMEVXZ3JXSkV5?=
 =?utf-8?B?QkJiZURXSjRFcXRwNjBCTjZxa0JQenQ5NCt2MkRsMG4yRHdkTGhFR085V0lF?=
 =?utf-8?B?Vlc2aHIwak1aa0grSW9kOFhxTlBFK09UL1dWNUNjY3l6RGM1VWx6dlhidllm?=
 =?utf-8?B?cmZlbk1qVkRhd0MvbytSc1ZkdUFpWmVwOER5bGMrUFhuZ3pjOE1URkdqai9H?=
 =?utf-8?B?Vi9pNlZHREc4aUNFWlRUQ3NhTHNwNGwzano2K1Jlemdqamp4UzhvRTBCaFow?=
 =?utf-8?B?MCtpMWZkVE1BWVhBbmdycUF5cnREQklML3NCTWdRNHRZNkg1Z3E0R25iN1Rq?=
 =?utf-8?B?eW5VYWFqOFFRcmdUbkJENXZhZG5IL1NDSGl4ZU5LdW9MT1lEcTBwU1Zod0FS?=
 =?utf-8?B?NlAxU250Rkt0a0VwSFprdkU3Z3Z6V2s1aU00VHlkSjNwTGUrbW1YdGhGRnVX?=
 =?utf-8?B?OXY5ZXFLR3dLY2tnL1RreTUwSmxCcTF2SGVWOWp0MVBNRmpZSklEUmxqUmpX?=
 =?utf-8?B?LzQ3eGNGRXdyQlNGNXYwckJ6enpjMlJxQUwyU2RUOWF6UGNQQysrb1dsQ0sv?=
 =?utf-8?B?bjh3TUhIZkkyU05kcng0bGRGNnJTeWVRT1RuVTFKUmZhMTdueUVZNk95OUxZ?=
 =?utf-8?Q?xhPRHofcL7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGM1QVRTV0RPSWd5U2JZWkMzRVg4T1VPZllVdjhPN1NIdjNvT3pWa1BBODEr?=
 =?utf-8?B?Wm4vSUtBa0ZHMTJUd1YzRGd4QnVGSVFBb21yZG5icUtaek1VMFZNdzNHcEp2?=
 =?utf-8?B?MjFtTDdXSklOcmFzUWtvTlhVSU1PMnYwdnJCQ0VWVTFlUmluUWIvTFJhRnZi?=
 =?utf-8?B?TXZxeWRVSmZHSmVyZW1pemhRZWcxaktIVjM4cWR6Rk9YeitwOFIvWGJWQ1NM?=
 =?utf-8?B?ZEROK1lhZjF1M1ZZWVh1NzVtRXI3S1FFcXpDTC9MK1VQSytuaDZwVFY5NlRj?=
 =?utf-8?B?ZlZzdnFWbndPVnVTUHNOUlQzRlBzL1VlY3N1V2xXSmJFR294M1h1SXFWZmlz?=
 =?utf-8?B?b2xqczR6cWE4cC96Y2l4bGxwS2FBVW5tR1VldjJGeFhldktrMUV6ME41Ri9q?=
 =?utf-8?B?b09XKzc2ZkFCZ1hLazB1U1F3SHBGeXp5Z2p5QmhlQ2EyT2twTmpSU21odHln?=
 =?utf-8?B?TUtWYWRIc3BsR3gyb01LemJTUzhaZUE3WjZ2cjF2UzVqODRBcDB0MWcyRGNN?=
 =?utf-8?B?bVpDTjc2dHpqcGRSNzFyOWZxaml5RFlXTUV0eGNBckE3cW9TWlg3NnlSZTZx?=
 =?utf-8?B?bmh5eWcxRUszVnBjbWZXbERqZUl6Qk1pWGtzVFQ5aFhIR3ZtZlQ1T3Q1dHRE?=
 =?utf-8?B?Rm8yWkNDY2ZmWjNlNnBwQ2ZrcnQ1d3FhVlNhQ2RLU0FtYzRXaE4zUzRBL3B2?=
 =?utf-8?B?OG5namRpN09LTVRwMTY2YURCaXZXTUhtcldsM1BrMzhhNUhJeUhPOXFObU14?=
 =?utf-8?B?VWp3TGhySVJJcitlN1lmYzNIeFNhZWcwdkNnVFVPVE1TUjJIR1phZ3MyWG9a?=
 =?utf-8?B?cmE3cG1jTlpRUWJ3cmNEVXhJNmQvVkUxM21aTEl6aktNU3l0M2Y5c3VnMmE2?=
 =?utf-8?B?dGc3ejJ6TXByeU9aK0tMaGRyWkhnNnhJMGc1U2RXajI0Z1Zqc0UzcExCY0pE?=
 =?utf-8?B?cmdaTDdiRzJUZE5RNFVNWW9DYTEzd2x1RFhGSzNmNkdldEVxd0ZvVWRNS0Ny?=
 =?utf-8?B?YklPOTNzdU9kenZjbTVxOEloeHZiRWhKTWdaMUhCdlYraUIzZWsxRjJtY3VY?=
 =?utf-8?B?UzVCSFNiaWlWMU55dFRiWmpScVMrdkhqTk9NcUJ0anBmTzYzSjZwUzlVc21y?=
 =?utf-8?B?L1h0d1FITzBRWlBrWGVQTEx5a013NDMwWlBFeGovWkh4U0xaZWh5QVV3dHYy?=
 =?utf-8?B?ZnFnQ2xIdWFJVzZTZVZJU3gySzNUTkZVZWhBV3VvM25mU0IvdU5aWmF5ZEJL?=
 =?utf-8?B?YkZJZTQwYmN0cWpMZTBZV1pUNUFzNnU1L3F1N0M2djJwRU9Kd3RYSDRLOWdt?=
 =?utf-8?B?dTlVNXR0aU82dXVUc01KaUFMcVZXUzNjRHlhNXdXVjczTktscG1rcWtsTHlz?=
 =?utf-8?B?a1V3ekdFRS9UelM5azNmeFB4R3FwRFlGSmlzbjNEM1ViOHJyemFhY1lCNFVV?=
 =?utf-8?B?OTM0L3lFWkdtbjB0TDdzNXF6Z1dWVGEvQlRZWWtjVUhwTUg3S1JHWVRpUEZD?=
 =?utf-8?B?TDhsSEdoRk1tUEsvNnJmT2hBN1BNaGgvMmtMNWs4czNLUnkzNVpDbkxUZ2V5?=
 =?utf-8?B?dGdzZ3JqZ1lVRUhuc1Z4bE1VSzJFKzF3bHpsWHF0cW5zUlRwL2RvcFVxckxx?=
 =?utf-8?B?SGhJenVxdDZKOXpHaWY5dXlDM2FYalhIb1VCMEk2d1ZYNUFXbFFtWTcvTUF4?=
 =?utf-8?B?UVdsb21sNFNpczJxcTlMUjdIL3gvRUZTSjRsOHJUV05KTXdvaGFVWTQ2SEFW?=
 =?utf-8?B?NjlFallzUU5zbTZtTlpxMHJSK015d2E3bTB3bWhHT3A0SkhJWjB6MnUxMlQv?=
 =?utf-8?B?UHpFV3ZrQTh4Z2hKcWNjaER5S0NaeHI3TUlvK1oyako2RDVieHNjZTJTeW5C?=
 =?utf-8?B?NkpFakZKL2tlMk5jc1VQbEJ1VlUya0RLYm5DMlZpYTFseGMzMWZoa1N4cDNv?=
 =?utf-8?B?MHZQVFltcUlTVlRuQmREdTduMkJhZSs5YldQQnR4UGl5UmQxdlNHcWJ4Yk5W?=
 =?utf-8?B?REQyU3l6M2JQZHcyeFdJWFdDeHhDeVNKM2p4cGt0dkc0SnUrSHF3QU8vdE9U?=
 =?utf-8?B?R01rSmVWWkd2U2pVb0lqUVRKeFJobFFYMVhlaDlISC96NDAxdWdZT2dSeTlp?=
 =?utf-8?B?Y0ZVSjdISXBkeXpUakRkbkY4YnhLZ3pxRWcwaHR0aUdaT0o2OFRlbE9EbFRJ?=
 =?utf-8?Q?RUseUmse+Key+zigZYduZM0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7acf006-d1f5-4f70-55d3-08ddef7e700d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:54:08.3164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XlI/GDwuZ8iSUXnHzCiKbvijQAY10UGvFRj+fLo8RLpG9RBweQDFLs6CrjeDCBWyzP3UdbOibv3yWblUj/LkwuPPLe0WLbx5SBjRVa4mLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8104
X-OriginatorOrg: intel.com

On 2025-09-09 at 10:24:22 +0200, Maciej Wieczor-Retman wrote:
>On 2025-09-08 at 22:19:05 +0200, Andrey Konovalov wrote:
>>On Mon, Sep 8, 2025 at 3:09 PM Maciej Wieczor-Retman
>><maciej.wieczor-retman@intel.com> wrote:
>>>
>>> >>I recall there were some corner cases where this code path got called in outline
>>> >>mode, didn't have a mismatch but still died due to the die() below. But I'll
>>> >>recheck and either apply what you wrote above or get add a better explanation
>>> >>to the patch message.
>>> >
>>> >Okay, so the int3_selftest_ip() is causing a problem in outline mode.
>>> >
>>> >I tried disabling kasan with kasan_disable_current() but thinking of it now it
>>> >won't work because int3 handler will still be called and die() will happen.
>>>
>>> Sorry, I meant to write that kasan_disable_current() works together with
>>> if(!kasan_report()). Because without checking kasan_report()' return
>>> value, if kasan is disabled through kasan_disable_current() it will have no
>>> effect in both inline mode, and if int3 is called in outline mode - the
>>> kasan_inline_handler will lead to die().
>>
>>So do I understand correctly, that we have no way to distinguish
>>whether the int3 was inserted by the KASAN instrumentation or natively
>>called (like in int3_selftest_ip())?
>>
>>If so, I think that we need to fix/change the compiler first so that
>>we can distinguish these cases. And only then introduce
>>kasan_inline_handler(). (Without kasan_inline_handler(), the outline
>>instrumentation would then just work, right?)
>>
>>If we can distinguish them, then we should only call
>>kasan_inline_handler() for the KASAN-inserted int3's. This is what we
>>do on arm64 (via brk and KASAN_BRK_IMM). And then int3_selftest_ip()
>>should not be affected.
>
>Looking at it again I suppose LLVM does pass a number along metadata to the
>int3. I didn't notice because no other function checks anything in the x86 int3
>handler, compared to how it's done on arm64 with brk.
>
>So right, thanks, after fixing it up it shouldn't affect the int3_selftest_ip().

But as Peter Zijlstra noticed, x86 already uses the #UD instruction similarly to
BRK on arm64. So I think I'll use this one here, and then change INT3 to UD in
the LLVM patch.

-- 
Kind regards
Maciej Wieczór-Retman

