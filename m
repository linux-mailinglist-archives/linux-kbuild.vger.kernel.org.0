Return-Path: <linux-kbuild+bounces-8806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDF1B5111A
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Sep 2025 10:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29E0F464326
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Sep 2025 08:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D11306B33;
	Wed, 10 Sep 2025 08:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n7u26O0m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728682773C0;
	Wed, 10 Sep 2025 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757492638; cv=fail; b=dC/uQQcbxf/3sumRkqAhbHBxzDNoaV/vn6Me5lRIh/7sYZX2Sr+RbVZEwNkgLHDWr3ocxGAUpJMYGlXUkQpNxoHlgfqR+/4bmtMIAW0mMwROjCShXnlA3cQWl04PjCMLJiktXdCSI6V0U7JAQ+YtLTz/2KjhDXsgsco9RRcAV/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757492638; c=relaxed/simple;
	bh=9ATc3NID8XJREDHOudA71wbs04FGbw5KOvS4dpl+r/U=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M7TAnksjq7h06MOK3fchL3Dz1A+Tib7kP3r4rXTyoWTpHz3fVDG6wRPf4SDEJsTEDa6cB9ZntI249WVavY6eiRrBjgQ15Tw578v9xCaI1dCEvziARATzdCBg9601HxBCHArnEjYjSg9oGtwLOrlKEaHp7r1QTn+4V83Kg6wzf6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n7u26O0m; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757492636; x=1789028636;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9ATc3NID8XJREDHOudA71wbs04FGbw5KOvS4dpl+r/U=;
  b=n7u26O0mJAr43/cd9jYJv+MZkAkoh6NOJgjyVXPIs4iaE5h1EZFIMFva
   ZYkLHeQK/yNdmH1w3NadV/NaZ4GG1gjC2McCbK1xuoOhl8aEGBacYob/j
   9ubJVCjUkB7wq4b6z8Iox3iKBbIgoYKRFvLlMKMYo7/PN2UYkghrmqCEC
   Bzof4ucQgnRzsniEJfes0AZorpUmb8oXBkn8p45C3TPu8w2eOq74tvKqo
   K4Q7Q7bS+5q8oJeSlhrWiMLdu2F8NZA3m18JkQBJcvzBvpWOyV53HpFCU
   Zlq8A8e2buyaA6Diw9eoGxXdTPAJuzaRbV+eZfxm3WpkNivfFFMxJ3fYy
   A==;
X-CSE-ConnectionGUID: B3Uwjxo9TEyFPFntVN+VcQ==
X-CSE-MsgGUID: +RKxHy9eSUq+8RXWBiEktw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70414710"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="70414710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:23:55 -0700
X-CSE-ConnectionGUID: vZKvSrNVT0i/+SwV9gVb4g==
X-CSE-MsgGUID: JEagR3QMQEa8FrBcKPaoeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="172894434"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:23:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 01:23:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 01:23:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.81)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 01:23:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTmeLwTPPmcosKjgbXg7DYO2xCMJ7iyYHsUYH+5fVqfxDFuE8Ji5R4LiTr2XMrWXUb8uCnSwDlgJbMK7FRxJGLZ4Uoa5Yz4+fVnsJFPUaum8XdB3ezj5GdTiDGj5SZXv+SbrjNvb0VYpNOhXNS46N/XIXnWqmqYKYC2lQh8ljggoS1PSIi3kN1VBkZIR3NtORaOJHJDxjsro5UTsWLU9fSyxbiAxIOEng0IU5uGu9unadO9mxxJsh4HiMj47mHgRomFV1bivyiGjOkImDkiEkkar2pE31NAodHud9ZCpXEzrhJMHHRRoYLxVXn5mbRiZN8f1VSE6cgSYD3FeqQnFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAaXSaIVoADjoz6HPGtQzawTt9gV+5J32gfTC4nKTbs=;
 b=ijgKlGmSoN2KW/ZFNMkFbNxf5KSGWSBYZ8GY2ft9IOoj30RF3DVl2JvhROUakaBbUNE9xaXCY3unV17/lN9pBRgixJqbUZg7aRllzlTCkTBvsx8bUaYYhKpqwpwg/UfLC0hdP9J87aNv9vO5748L+q9Hl7CYwVDCmKDZexG1eo/pkpnReEhlq0vzVodH6khhp55BOf41Wvo66rEiNUj+mKT73FUvGMUpNz4pCyEhtn7L6UdiV5XjyNRmScjtMJg+14a6weY9v2p68oDNYqijz8Fz/txg/ckJJMwipVZ2Ix+fS6j41byS96ybEf0xojzNUkGoBrn/GwmTR819rcMy+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 08:23:51 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 08:23:51 +0000
Date: Wed, 10 Sep 2025 10:23:37 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>, <sohil.mehta@intel.com>,
	<baohua@kernel.org>, <david@redhat.com>, <kbingham@kernel.org>,
	<weixugc@google.com>, <Liam.Howlett@oracle.com>,
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
	<hpa@zytor.com>, <leitao@debian.org>, <wangkefeng.wang@huawei.com>,
	<surenb@google.com>, <ziy@nvidia.com>, <smostafa@google.com>,
	<ryabinin.a.a@gmail.com>, <ubizjak@gmail.com>, <jbohac@suse.cz>,
	<broonie@kernel.org>, <akpm@linux-foundation.org>,
	<guoweikang.kernel@gmail.com>, <rppt@kernel.org>, <pcc@google.com>,
	<jan.kiszka@siemens.com>, <nicolas.schier@linux.dev>, <will@kernel.org>,
	<jhubbard@nvidia.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mm@kvack.org>, <llvm@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
Message-ID: <63ocq6aadqn74e7g57a6p3cqkr3sf4hmejfp6hxmuju2b42iny@2du24bomvk4n>
References: <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n>
 <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
 <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
 <ra5s3u5ha6mveijzwkoe2437ged5k5kacs5nqvkf4o7c2lcfzd@fishogqlatjb>
 <20250909083425.GH4067720@noisy.programming.kicks-ass.net>
 <20250909084029.GI4067720@noisy.programming.kicks-ass.net>
 <xeedvhlav5rwra4pirinqcgqynth2zrixv7aknlsh2rz7lkppq@kubknviwhpfp>
 <20250909090357.GJ4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909090357.GJ4067720@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: DB9PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::21) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d615ce0-7877-4c1f-6a3f-08ddf0435f8b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?O1j00+Ekys610nz9REzx+VXDlQGjEkDQkGiIRP5HYqYOTbTsyDS5q7jIez?=
 =?iso-8859-1?Q?jRfl7ulWLJgldc9EczPIQTxKQAJYM9bZNPTHT/STZJ85BPvfCoYHqXNi3j?=
 =?iso-8859-1?Q?cKTt0E6iLfJkR11xj0LeTohE2EfWyPkqMZZXQxDuTzR60Y+xJfVYVGs9Da?=
 =?iso-8859-1?Q?Ewx4jWs8scC7TpOkCz4QYh4YR238G9/MLqv7DS2zsnaU102ccnMcjIH841?=
 =?iso-8859-1?Q?vE8dfRZ6rgUvu7/auypVTkymorbBJIsbdq80GmFIUxu/ALRmqVmC4cPcVG?=
 =?iso-8859-1?Q?hty8+CiDaniDUDbFqLeLNjDVv3I7lR1F2otPp2UhoosEgCK4v6W4n57PSp?=
 =?iso-8859-1?Q?8OEdBFJTlqGUvolVD/AfUcEFdGQbvJTqDaQLGrivb/ELik8h5jVXXoiKp2?=
 =?iso-8859-1?Q?U+dchHEahE1HORDx1t7WnaFpq/zfAEy1jrKuJeZJd0GUr3Y1BvKyP3tIfY?=
 =?iso-8859-1?Q?PGdphGOYUoIVR957d3RMYFU8fn8gQxTRWI/GYZbfFc8lgYJP/lOwCVVIz8?=
 =?iso-8859-1?Q?uW3+MJIaABb6m2dWRf1ZIqNKoVdfgtQsXnmnu3kiLPlC66btKvyVLGCiNl?=
 =?iso-8859-1?Q?5vRQB/J+lOhvoww0ZDUfRBm90YERc9ZYVpenK72WGPXQJlwWXrZBmk316i?=
 =?iso-8859-1?Q?Lm2bVo2oytiG0YJ3XZU6sCgNCKBw++b8JWF3WoiC+1fxVZdpxLpk5omik4?=
 =?iso-8859-1?Q?aaEyy4wXUYa2QAYaNX9XJqiiTeQwmh6rbz1FeY7S/6edI0JC6BnQMS+ue+?=
 =?iso-8859-1?Q?jQdWkll+vEdA2r9lVglKDoF/6bHASuF4l7akCc81h9h2RnPk0I3KCukAbW?=
 =?iso-8859-1?Q?fChbpgaMSOQS5aKLE285IU4U183jRj4MGKokDXuSX3b+vlpDf+f+wFdkMv?=
 =?iso-8859-1?Q?AEZRvKIGZxAoWRUbE+ihYm8hg9DVP63r5Gf9CGP3lsnKyUD2R8209aT+x2?=
 =?iso-8859-1?Q?ucROp0pQEJxcG01dQBhtjhl+DiJAvpFmYGVAbR4P6dbrupu5yPYQ1LIMbh?=
 =?iso-8859-1?Q?l7jH+fvBFz8CJ8kb9Ws2RA9HlMU7msKU/GomCYvNwGTh35kZHt25kHCBWd?=
 =?iso-8859-1?Q?6avYhAZtJQpjv7+eqOQgdzr+ZiLLyBvvn1Gixh8deR3jnWqZNY6RXiyKYu?=
 =?iso-8859-1?Q?Frg+rbwapGNACM4WwOOH082XB8LwvuNSqNySxmmoAaEjV3lyTQCN9P8meC?=
 =?iso-8859-1?Q?uMIXGLvy3ZMEMuhzccDNm4xdYogWt7nIpd0x9yUwqmecPwWnw1tW8KHNg1?=
 =?iso-8859-1?Q?XcOpXX1w8sgS8AvqJmxHERQTFJToYieoSlyl2LfjiI2Wbm7qF40BHwBkE7?=
 =?iso-8859-1?Q?H/jQjwmrhdRr2/gCdhRvkvWKF4zJDVrs7v+8sPHKuHpTzR52ho4wxTA8ab?=
 =?iso-8859-1?Q?TXHlsZoarITgH2rn51VF+lP8D7zPbj4YAEFVHCEHGtfJhIXprPwX1fbQE1?=
 =?iso-8859-1?Q?LToKZCIhzA/26DcHVoffptrCAipesoEnzyVR8s3noA6JRbQ9/AUc9i5rOD?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e++uzuqBO2cjbBlUfDsfx5XzXUmH+faLilMr+EIYnrqrfbPmZiOZOPJ+7W?=
 =?iso-8859-1?Q?kQ3/D/H/aHK43WDEFBb3DUhhb545HToI1jyZG3Fm1GjkaU8XnYBpCKyjwU?=
 =?iso-8859-1?Q?kkD/oeO9uNTEWDi7n2IKKaxeYOFcGiKhOrapItCrNtisJ1dkRPsviKECK5?=
 =?iso-8859-1?Q?8AAvKQhJOcgvMhUhnQR6F8KudLDQCLNliWs90/GiPTQ2ytiJk0/blj9RoB?=
 =?iso-8859-1?Q?AZYBBNQbX5z7E7J07s66P52/M5yXlYBdqEonHCCwvly2vPb9X8sNpNrbL/?=
 =?iso-8859-1?Q?u1fYcNEt1qEWUk9shV2CAimTIDHMgRqGzapo1IuFjq57I3Ep68q52Ma3+D?=
 =?iso-8859-1?Q?xkLyoB3EuFATsAASYTdfrSZPydcAPP83mdhcHFYoPzf+7jsHv83XBhhdjg?=
 =?iso-8859-1?Q?14kbL2eCfkSaGS4w4OTUVui37heeZsIZjCgk+Gsh6B0Fv3g5GfM/IQ8fuN?=
 =?iso-8859-1?Q?NSjiEM8bFH4q6WaBuucnm0oN24+oQTt94RuAG0dVm8A3YXFP+zGfH8/RFg?=
 =?iso-8859-1?Q?jrrp4W9DJSs6YsqAYFT2e5ZOIktvDOpSgJLFI6E+1QBsWfE7bmgS9gwS/d?=
 =?iso-8859-1?Q?C+doNSddKOiCNvdfuWPuPzz+hy4qWkBW4bsuA3Mprh+HE9WCIOAyHFyBRs?=
 =?iso-8859-1?Q?18Ava7Gw/hvflMYbK4LGD+y8CQqsuomOmm9ljLHgVRPLxEfOs1KOf0m4mr?=
 =?iso-8859-1?Q?uyChuLsDu8HE5enztKCmgN8JNTXqVZeB7txpSGiSHka1MurFywrPULnRdV?=
 =?iso-8859-1?Q?ZUGZo4mGPzINld3oruplBL5uodz/OFEVzvnbWvGIwDKT6vtuWlxlIC8cN5?=
 =?iso-8859-1?Q?k+HuiOCQ+uR8qu7/scYURmMXtxf9osMOG3QSQKRaJvmHTgRu4Nn+lRyRBE?=
 =?iso-8859-1?Q?S/oj+sk6oaVEtRZljX/4AVoxyA9hMR32Yl+mkmsiLYi5/2gGIMIe03wyK/?=
 =?iso-8859-1?Q?OY0tRJjbzBMoLFL695/02akQYk1TXPD/KyPQvo7ITtpowTX64JNjJ42VAD?=
 =?iso-8859-1?Q?Dmc9+405fmYXTORjJBNQZwWIulJXBfEaMhkg/PTmCrDWVxOK8I9xnOmPyk?=
 =?iso-8859-1?Q?BgCtXHSPlWpm9ixvFdZ5z3cDb0JPjZ3RzcKkaCqwvkPWZmOnbVx0dnyUBx?=
 =?iso-8859-1?Q?CRAQ0Zzr6e3lDxgCMDVOLem4tbWOatn23oFu3/+SU7Yr0rcr542+ylQS8l?=
 =?iso-8859-1?Q?oXwe2G/dclXYaO0hZAJAkA2g/FRdUuUQJ0zQXxifG7p5umfD5/NBFCCqWQ?=
 =?iso-8859-1?Q?3st1iX++AHaz9TuwpAAqoRG/jwHnMyUUfe3xwFPSIMvuPUNX2I21TuVjMF?=
 =?iso-8859-1?Q?bg0j9zJma25eJykcCplO2xMfBYjmVHSdPHfL077VRxsCDRwWdvC5K0S8MK?=
 =?iso-8859-1?Q?9Q5k2i0yAQsua40EENs7SQz5SlpDIbCEaLOgicjKruKLlLAdEfRpTKvWV8?=
 =?iso-8859-1?Q?0zbKRcuQDauxo4LnfajhBqcf5Vqfc8YxN8TXzLKrhvhalOsbDZBFjHRrl7?=
 =?iso-8859-1?Q?08gvXqtwNEMOyJu9qGK1I7H7xoEAMV1Sf7CfLu+rayWI6PRA4x/VDGuQmR?=
 =?iso-8859-1?Q?fwuX034WzVVS4I5pQ/ICKpydxzLj3Lk7S1lUdvyk+DDwNtqkUdoagdlQBn?=
 =?iso-8859-1?Q?+v5ROGw3Yx+f7/Rab3MmJbUBKcZAEFUgXkn0ltrbVXxBWk1vDzXq+0Rs31?=
 =?iso-8859-1?Q?wbWAtWFi0zzIyG16Fwk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d615ce0-7877-4c1f-6a3f-08ddf0435f8b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 08:23:51.5114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWUa+B/zhAfZlX9LY1imQIDvmNagix3F3GeEUAbXvvB7+dXBkkEMWlLRhLfgK6BuEAlxVeB+lxhbflBZCW7IbwIAC1Z3mfGjQE/3W1hRNp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-OriginatorOrg: intel.com

On 2025-09-09 at 11:03:57 +0200, Peter Zijlstra wrote:
>On Tue, Sep 09, 2025 at 10:49:53AM +0200, Maciej Wieczor-Retman wrote:
>
>> >Specifically, look at arch/x86/kernel/traps.h:decode_bug(), UBSan uses
>> >UD1 /0, I would suggest KASAN to use UD1 /1.
>> 
>> Okay, that sounds great, I'll change it in this patchset and write the LLVM
>> patch later.
>
>Thanks! Also note how UBSAN encodes an immediate in the UD1 instruction.
>You can use that same to pass through your meta-data thing.
>
>MOD=1 gives you a single byte immediate, and MOD=2 gives you 4 bytes,
>eg:
>
>  0f b9 49 xx -- ud1 xx(%rcx), %rcx
>
>When poking at LLVM, try and convince the thing to not emit that
>'operand address size prefix' byte like UBSAN does, that's just a waste
>of bytes.

Thanks, that's good tip :)

-- 
Kind regards
Maciej Wieczór-Retman

