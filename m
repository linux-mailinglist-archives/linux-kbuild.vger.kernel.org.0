Return-Path: <linux-kbuild+bounces-8781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF63B4A5DE
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 10:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63A6B1C217D4
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 08:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21BA2586E8;
	Tue,  9 Sep 2025 08:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iJySXalw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F344826FA52;
	Tue,  9 Sep 2025 08:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407674; cv=fail; b=Ub1c0ZHGX4wuy9SBqQ7H8l9BB+neMLSUJwX+Gt7Bo78wkAe+d3IWbsTVaiCUfQEaprbYPZTt7JiPSYsRNsZ6Aa3D9y4gDKUGfo25+ZU48hqC6xB+3kfflTE8KN6RPmckbAHesItYO85FON/tlfUvtCuyckJFzCAbmOfx2byi+iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407674; c=relaxed/simple;
	bh=FaEAfUCIBE1z9Vd+wCzB3koMtoim32MPlVX8FQQNhWw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lubiv4m4xJwxIgC/Idjk5r7OYG0WtGDi5CJY8qFViI42F6yB4HoGWmAdUmiS5hEG4uKDAfXFn85l4a/hN5AFV5InD+xSLYlDRx6fJgRs7mN9Z2Es8BqP91IGKiesP08AbZ+l2oOJ2OQpahf20/Sd5eZ/eGuAlJO/t926E24GbRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iJySXalw; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757407674; x=1788943674;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FaEAfUCIBE1z9Vd+wCzB3koMtoim32MPlVX8FQQNhWw=;
  b=iJySXalwVuNfRd7/794FtskKIukP1IXuuJ0HjgcG419wcfxs9LMWgzD9
   6aH78icMcyvIRbDm7XTEsw7JWy/kaKNt6+PD5IyC6/+FfyZBCqQt7NR6b
   ZKFwJZ+/iRQWVnudD1sujxd+3ln5fIEloA4PQq72OjT9GomX5taT22Qrj
   qONzHsClj2j2hvsXggL9+r436tOqa6tAklFP7xWEjovIKvtcqvAlHKri1
   1s6SOGck8YEFxm8rdS0CgOm9fMxR3swMvhEcRdXBvisgEFHPTEaaUolbn
   ZQbk9Gvt0homFO5UGK1HbwDQSPk3B9aA0nLpDpMnKUxIlHXslACwxohyX
   g==;
X-CSE-ConnectionGUID: GFIen4k4TTm6229HUeyxYg==
X-CSE-MsgGUID: CQL7G/0bQyW4Pct9IuKlDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="77140342"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="77140342"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:47:53 -0700
X-CSE-ConnectionGUID: opB8O2YiSx+jxqCJMTi0rQ==
X-CSE-MsgGUID: yfKXkOmvQNGD9vj9URK71w==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 01:47:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:47:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 01:47:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:47:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkD01FZnfExfLSUShDPcfTMTKeKdeswzH/jNxzrXJlfRNQQk78WoyzxDue61gCrX1xNVkphem4VfLUxtpd8LdP221HmcIBh2P3yvU5TktLsrXqUIwWdRzrD44qKqSnUoUOMvlDlDDLcaq784r6RivVmIiojK7hoAQzL02UB4RpBhHkKVJij9snQxfC5xQykVKx50cSWKRr65xxtPZDO1czxLJsi86fHOSnOF5ekKoXJBPVM8Ui3wJP9o5DPa1E7lg3J8TML2koLRV463+yAnPaYb/Awbkp9mc3I4Un40AR4TnuwnxN5P/tT66xSeYzzfwIesmjiP1ryeKUt1Hjvx1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KobCM3CtN8LFDrrSOzNMBgFZphHRc2385ed6fj+IAw0=;
 b=rmgBczwmc5dbNXkQPuY9i9GnJeeH4oQ6cHdoMhclRfZBuasIUEUi3Sj4FYmmQC0+44QqlGI9In9DWXZPd+GPDxHEkC1ekQnKJT07TrcMinci7nZmwISc3zvccgeePwNAhkAO0VWajRV4tH5jlvzVSFG7pludzIZDwYnVFXgk0lf4j3wvKYnx32JH2iLUIS/ab5rwHJCJAXrTgs5nHf+Pmirfa2d2JAqebS8A+/L3Lr1QuadwvI78c+9UH5PL+gcE1JINE4vbtxEs0k2q26fIzJ7mkXI7Dm8ooFRWLPch7kRUJend0bE6AuAmxC6s6MLa1dIp3WzMfoRAkyJMCLjrDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by DS7PR11MB6013.namprd11.prod.outlook.com (2603:10b6:8:70::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:47:45 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:47:45 +0000
Date: Tue, 9 Sep 2025 10:47:27 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
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
	<willy@infradead.org>, <ubizjak@gmail.com>, <mingo@redhat.com>,
	<sohil.mehta@intel.com>, <linux-mm@kvack.org>,
	<linux-kbuild@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <llvm@lists.linux.dev>, <kasan-dev@googlegroups.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 13/18] kasan: arm64: x86: Handle int3 for inline KASAN
 reports
Message-ID: <xootngkjxd7xgsccvyvd2jxko4ujvnglf4qclo7b5226yvq24x@hbeuu3terjbo>
References: <cover.1755004923.git.maciej.wieczor-retman@intel.com>
 <9030d5a35eb5a3831319881cb8cb040aad65b7b6.1755004923.git.maciej.wieczor-retman@intel.com>
 <20250813151702.GO4067720@noisy.programming.kicks-ass.net>
 <nuzda7g3l2e4qeqdh6m4bmhlux6ywnrrh4ktivldljm2od7vou@z4wtuggklxei>
 <20250908154052.GG4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908154052.GG4067720@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: DU2PR04CA0332.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::20) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|DS7PR11MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9ad147-e535-4f94-93dd-08ddef7d8b89
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eq5p3eg1CROg3uOMXqu+NSSXTfIPvitKnORrvuRy1ylYYkautHS3iCg2mY?=
 =?iso-8859-1?Q?rfts8zyV05Ti+E3LmLsGBtyjcyju/9Or8/KG+yGcTAj7tqhDPv2D8OKOIE?=
 =?iso-8859-1?Q?V6pvwo0a+821NATxhi7RhUD907r22QSG3ZE2dfo/kH4CoSPYTa8+MzD5aI?=
 =?iso-8859-1?Q?86N6nmOQnu4z5nxDRQ5VxGNROcMeIhqFUDtekaZt2zOJ++TDVG3zNT8s2O?=
 =?iso-8859-1?Q?liavEQkmUtrkiHref/Mlhitf0EcMBdG0+SOtD7AkOgkYUVro+pgENmbnWg?=
 =?iso-8859-1?Q?22fmDFJpOYi/d26zMaKzHm7eS4jYL28ekYyp9BO4w4+Sryj4i4hKaIt8Yl?=
 =?iso-8859-1?Q?Jvwdxv/givIoCECZuwGdIyTmL15CyRXMBrZDWWZxMb/N2Y34gMMwBW7jcE?=
 =?iso-8859-1?Q?VboN1d+XlPeKDn7OvdnvZtUAHgdg9+bxLQKPQePDWV/6YgnqC5e36+KDSk?=
 =?iso-8859-1?Q?yN5sRutvL0BSiWhW9szMxmQ74qq++8ESoZzwDxWdHK8OtsbCc5699S0F2C?=
 =?iso-8859-1?Q?JeSPDXh0b/sYyuI6HLqNgTP5gGnZlsnmQ4CXSWpXy3inOs+7GAOAeF/pBS?=
 =?iso-8859-1?Q?fVgD5z+UTZp055/aawFzmAJBqZWkRLBmcnOSFhZ8j9a54f8XpwHODUuT/r?=
 =?iso-8859-1?Q?hBKw6MoQ5Jom8U8TudrjHGwsa8rTRdMiuij6/hEuUgCkokxRIvVypElJbr?=
 =?iso-8859-1?Q?HuUL/nAVce2jgh2dRj1p/M8Jhx9xSImayQWBw0nLx+j0a6pJqseGeW7YL6?=
 =?iso-8859-1?Q?qmnUY6MnUDKkqyMyKewsLWkzlcFY1Vly/NAmEkeJB9wlTeBXo603R4PF0K?=
 =?iso-8859-1?Q?hUNMQT3uPYNeL77x2FGUAf8MvRYuPeUeBKBEQo7m6qR/YG5IIhmo1GnbvI?=
 =?iso-8859-1?Q?67sHhkqN7Fl0c4diJBzkMHYKgCVMXrncaM0D9utv47NwsZBSnSVKksFaxF?=
 =?iso-8859-1?Q?lZgw6kGKsKryVJmWrU7Ed8tYxI1MWhTlm7o1HKPnp2UgMRa7trb2tFBWuN?=
 =?iso-8859-1?Q?T9k5G4RC2auQH2uSRRsL2sTmMpS//ACmQPZbVz25xlOq7cx9Ipt9/Q2xXM?=
 =?iso-8859-1?Q?+AA0nHnHo2aCXl/jdKWR29NPWW9SGORGUW6VhH7lr+7rieyY6zwDCHMMbG?=
 =?iso-8859-1?Q?HlghcSiNKPDGjjriEcpx0XresRb0JY/MiQwdkezuUxOt0zH+6WdgGirKBW?=
 =?iso-8859-1?Q?j2q4Ek2c3ZSWJyrJxBfjCk/P4y4aQgQ9Lb1M5fB07DmnoIcl1rev6+rLeg?=
 =?iso-8859-1?Q?ORzFQeO+KKucmHGwmu8rLWdEx/cNraOaeSfXPmzSs/iEyXCvunvuRqwdLW?=
 =?iso-8859-1?Q?mSZLou8ivZhi/bsnZfoEodt1xrHFp1K3ggjSz+qDtIfR4bsyODLyM87zeD?=
 =?iso-8859-1?Q?LgAfrVBHTu9+Ku+7PUuO1JkrotU+O47pjPxwewcOUm8vDOlcDrzjnG3onz?=
 =?iso-8859-1?Q?IXwQyrGmDJxrB/WAgHiFWQq4OV7iLDbcYoYUFhpaHexeyCZarpOOi5S8Yw?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k7alex307kwnIcJAQ2qpKcr6fW6ZJIYDo2mFfOI7VAZbguhtkTEwnPHAbx?=
 =?iso-8859-1?Q?P5HXuGn6jGVxk0mIjRaiO+1Lh5N7eaaPWGtN7ssAvJ56LRr+T7KuGOgFVn?=
 =?iso-8859-1?Q?mNEZtGZCHjo1HRfoY+KjCDAF5BmPR7prxd+Oxv/FSVpfEap3cZpqfMK7g7?=
 =?iso-8859-1?Q?8lUy4XBBcbe8lYk7yO95BcszOD3NrEFHgQAP4MvsI+fRW4ymYEMe14fN9s?=
 =?iso-8859-1?Q?4PELjI1J1ooERYUpdgStIaiaklIebv8CXWFNUgKy0miAWuuUa57bbaTmsX?=
 =?iso-8859-1?Q?qysGbQZNX/qxVVThTD+iTj9XPRkrd8OqBTQH/FLG1UzQCjCtmG5NL+zL/g?=
 =?iso-8859-1?Q?88FkAtvdM0Y/gsjUY6cMwzaoc49y0uK+roKHTJmQkkItRLI8NDnepWN6m0?=
 =?iso-8859-1?Q?Iz6Do0Y1Sbq+3L8gakOb8TbQpNwytArI0QuNvYHNAKE6SuDCVzMe94+Nmr?=
 =?iso-8859-1?Q?7B5ytmga4lsorkzNbm48qjjNIxKkykW0fojNTu3UfdUiGWDnyckA1X0joP?=
 =?iso-8859-1?Q?FGNlHAyZk27HwZ+daCvmOxlMgMuQZ28vQRkXBInjlUQsAwERxHYaWDZnqQ?=
 =?iso-8859-1?Q?AaJvO+k1iR9spbI4edzIPZvQrhFWYeGQbaRgF3KtRYxa4xSRoqvL0kRGVM?=
 =?iso-8859-1?Q?Uz6poSANRV9eo57G9qCAfpSkJq8EkH0nx4kls7k33IDiyyZCzFqsjkEJWD?=
 =?iso-8859-1?Q?sNGTzQc2QYOBo00g9f4mNTNzfnKJmMLbK9cglr4VyPJvTO2npEXnJeY0RO?=
 =?iso-8859-1?Q?tKY7bF4TDLP9zlJgGCYqCltVrSNy73ut4ULuWVAn9H0flVpDG81AvhCskb?=
 =?iso-8859-1?Q?/oQ+/d3SYZGe2YfyJH/C+edJsnDIjG9JDZEOLVYGS7BZIuroDTfI8cH0og?=
 =?iso-8859-1?Q?QBsy0j/Dc968twib7wKy1HeE2XLkrocsrlG0XRl5cSSFuC1uW1JwP+nz+8?=
 =?iso-8859-1?Q?Ucg1QrsCzmew65T19Yi/eLkrCYfosEYfJ3lJPcK1xWHnp9+uubr2lF1VNy?=
 =?iso-8859-1?Q?paPlFK67W+mVY4MoFjFqolJIntgen0ZX4EZJ0bRZboBJuSsQ+PvyuVef/x?=
 =?iso-8859-1?Q?y+5/RNWEgbW85U5OO1zl45n+z8HDw3zpr4wXk6+TLRM9Ug9rJFTANGZomQ?=
 =?iso-8859-1?Q?3oWmnMr/hNMfqOvH9jWbmpBTA7lsKIYostPNdmwyBcmYPUGeHMLz38kewJ?=
 =?iso-8859-1?Q?2w9VjorlKP1TZbHOB+m8PjPRlGjha1RbKIoCdKJBweOrvtEyziRYY0MgQV?=
 =?iso-8859-1?Q?afF6319EbpgPT69wU/Ky578yES+jwld39BM/ZhhN34sSivgfxUCzcY/f1L?=
 =?iso-8859-1?Q?JhAF7qyWOR05fmK+S8ihcPdzNfpZnF8nWW8GMlVfVEaXFA4CWGizU0OnBE?=
 =?iso-8859-1?Q?pM/iATbaaqVyOb5orD34G2/r417Uy5btygSoQScQGzX64w/Ky0zuLLgbOO?=
 =?iso-8859-1?Q?yloP/odCFMs2L/gMCUrlsihXSaVWdsqtL6NHJsye88OaDoVQZjditrcbVP?=
 =?iso-8859-1?Q?7rTZcaMNi8N/bMCziUK0hwWSwXHmXGuhFLmQpg2tarPOYQBTeAknUr8x/L?=
 =?iso-8859-1?Q?XwoKU2ATfWrGAlZUx4iRLNhjqK3mseeoncj7tbadoyu1paAwV/0V5MY/0U?=
 =?iso-8859-1?Q?qJgeSK1Euxi98GpRKVCbjUuAg63KzenzD700M9hBYVjatTafys6w/pl7GU?=
 =?iso-8859-1?Q?BElD2iyfGRXsQBPQStQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9ad147-e535-4f94-93dd-08ddef7d8b89
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:47:44.9842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRTcfbtgiKYt2wdCBaPk+kx2oFsLUQKRBtTgFkvrS8Xhvpr+yj+APAocWrTamreEaMt76JHNlflR5yhMAUNguor7+IuHe3AzAOdW0z650AU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6013
X-OriginatorOrg: intel.com

On 2025-09-08 at 17:40:52 +0200, Peter Zijlstra wrote:
>On Mon, Aug 18, 2025 at 08:26:11AM +0200, Maciej Wieczor-Retman wrote:
>> On 2025-08-13 at 17:17:02 +0200, Peter Zijlstra wrote:
>> >On Tue, Aug 12, 2025 at 03:23:49PM +0200, Maciej Wieczor-Retman wrote:
>> >> Inline KASAN on x86 does tag mismatch reports by passing the faulty
>> >> address and metadata through the INT3 instruction - scheme that's setup
>> >> in the LLVM's compiler code (specifically HWAddressSanitizer.cpp).
>> >> 
>> >> Add a kasan hook to the INT3 handling function.
>> >> 
>> >> Disable KASAN in an INT3 core kernel selftest function since it can raise
>> >> a false tag mismatch report and potentially panic the kernel.
>> >> 
>> >> Make part of that hook - which decides whether to die or recover from a
>> >> tag mismatch - arch independent to avoid duplicating a long comment on
>> >> both x86 and arm64 architectures.
>> >> 
>> >> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> >
>> >Can we please split this into an arm64 and x86 patch. Also, why use int3
>> >here rather than a #UD trap, which we use for all other such cases?
>> 
>> Sure, two patches seem okay. I'll first add all the new functions and modify the
>> x86 code, then add the arm64 patch which will replace its die() + comment with
>> kasan_inline_recover().
>> 
>> About INT3 I'm not sure, it's just how it's written in the LLVM code. I didn't
>> see any justification why it's not #UD. My guess is SMD describes INT3 as an
>> interrupt for debugger purposes while #UD is described as "for software
>> testing". So from the documentation point INT3 seems to have a stronger case.
>> 
>> Does INT3 interfere with something? Or is #UD better just because of
>> consistency?
>
>INT3 from kernel space is already really tricky, since it is used for
>self-modifying code.
>
>I suppose we *can* do this, but #UD is already set up to effectively
>forward to WARN and friends, and has UBSAN integration. Its just really
>weird to have KASAN do something else again.

Ah, I see, the handle_bug(). Then perhaps it's better to move the kasan
handler there and then patch LLVM to use #UD instead. Thanks!

-- 
Kind regards
Maciej Wieczór-Retman

