Return-Path: <linux-kbuild+bounces-6531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0D2A82544
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 14:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 030D1461E2F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 12:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F75261570;
	Wed,  9 Apr 2025 12:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2iMraLy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA82725F97B;
	Wed,  9 Apr 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203006; cv=fail; b=S9VvOZtEFWR1c1DoO2IYkjwKeQXFPrtn4Mj8vQHdlQd6UUeDQFUz0RYc3HJ6r3XNOj1TMAR+Ag8+2pesOZyJPNRXjyIiwCvaEGnd8NbK3G0MULypMTpUgbIpqT7mmYmcI/xutV8zLulKYMLYfU/hgW3mE0+2gnE+X9vJeLhO+Lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203006; c=relaxed/simple;
	bh=yG8q1dJ1DkdySBzXpE9ZD1OIOMwOsYLgCtvyoz/SVwk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kwqiXZvypnjSBJIVxyKYZt0rAhQCItbhI6W0z/uwZn0Gjew+GVddH863N0FcvIMpHEeTi/6xKSwdBuZFtWBHnHvaj6p+jpXvFt2fVvE9pQjj0Rq1xidkpBbBicXU3GdnFa85eFE8DeIWoovV/P26y0kmfmE9+n8+HuFrrNboUEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2iMraLy; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744203005; x=1775739005;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yG8q1dJ1DkdySBzXpE9ZD1OIOMwOsYLgCtvyoz/SVwk=;
  b=f2iMraLybMJ2LIFBbUx5NPgBh63I3aqH+TKmPiGQbH0Zmkh8+0UhEp1q
   +nqd1ZPR8UOP9zMQW5xRBZIgzgVrKwqGKYwK4IhVoU3mEiDc419EaeFUj
   pPqskSfrvPa91O6ULh2oEmR4s2JSfx0lf+1Qiu/BCWyRLS5GTMxaGtZTI
   cdt+Ayk1PEgKYZu7pjUxmUmi6L5fqbgcYtTyg+OSBMcSI+eDPoEoqfQoa
   rWM3Isl0mpolKcfphw6zflwbNRKLidpszlltflyChkv1KJKNYKEU36fXB
   l/ikhwtyIpgb+G5DawYI8Zo394LabE6Q8K/kUr4PcZ45xfEXqOBn3NcpT
   g==;
X-CSE-ConnectionGUID: CrXgOEmBQnCVjpmMVM9Gug==
X-CSE-MsgGUID: V6S1V69jRG+t2Yuydv6YMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55854828"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="55854828"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 05:50:03 -0700
X-CSE-ConnectionGUID: 2bMoJDOSRRyxFoCNtLlzOA==
X-CSE-MsgGUID: oxAEaM2CQ+OOtr05NpBUCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="129536587"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 05:50:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 05:50:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 05:50:02 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 05:50:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHvpabmDuO5vqv0+ZJifpnfC7KHnuiaZo3+7GGYsr1r9+b8yhIQKEbkUFv3xEAP+BTMMsMR7iL0m69sHzfei8JzehBzim/cbNbinNC1f2pjjhvUQihmAHBIldCPoLSRXNGbvnESOUjdPRQQHeDpYYPaasoMkv0Y+fZ+T/tctcHHmJT567KF/+xy22Ss+/UQfTBEHm+q1M+lSI+McXBSvoHbRfuFP94yKmdfmgrbQ96y5Zc8xnCOCXr/IukF1UBQA09exl7xAHHO/IIit8/uJrpeULufKeR5B+uI0Mj0h8Nrj9ajrbrRYjrSkJ/pPDb1XDBgyUTOvr1z22LTWPihSZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+wSjB6qIKOKMH5DHKNoY4F0zc/b5aOTn1rW5CT5AbM=;
 b=XVsaYt/Xah+W2vr8VXPjVLI7mLqXazOpi9U322moAUWTaV91uFX+jd1yvUBJH5Skc43xfPavJizmF6ufM1ErJoToLFuXEASai0dstuGD7cHqWFf5i5fYIrke/LyfGUNu09eXhuikWSKGHhnBLYluSaJbT4ziUmFJRmlfg0Ms8EUsQeDzqCUi0Mc/CmuiIOgneF7O3h97bl9718hkSrr7aT/X+/JMeN/IWoJyR+uTebLTDGSr7LV9Ciwxti06e19tsaB7bOs82j1wWLqgooAFd6vPSR2or6nm3gSx4DWD4W6Augg5uZ61aACUcZaP2Bcf5GQuPtXjM0DPj0lof2MfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 12:49:45 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 12:49:45 +0000
Date: Wed, 9 Apr 2025 14:49:02 +0200
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
Subject: Re: [PATCH v3 09/14] x86: Minimal SLAB alignment
Message-ID: <czzcsmwaf42v47arvmwgrh4p7h3misoarremtc7r2cme2ceuud@yya5jfuqhuye>
References: <cover.1743772053.git.maciej.wieczor-retman@intel.com>
 <173d99afea37321e76e9380b49bd5966be8db849.1743772053.git.maciej.wieczor-retman@intel.com>
 <ceade208-c585-48e7-aafe-4599b1a06b81@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ceade208-c585-48e7-aafe-4599b1a06b81@intel.com>
X-ClientProxiedBy: DU7P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::30) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e18844b-ba91-402b-9155-08dd77650102
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?imjJxwCpI+TuynxPLBMNDqmrizIGQls6YCqn+64TwlAOa1FJFjDqVk1GXs?=
 =?iso-8859-1?Q?ex39CwCM9mO2boqn6LifdHRu8lpis/pT2MOyjFod2n3azZklLEnfoXTzcC?=
 =?iso-8859-1?Q?DStWIj4jcQ7r+e0G5gnIQ9eZQ9QofHVOgmMJS7tKRfW5qy3MGxXxK8mDRX?=
 =?iso-8859-1?Q?f+q4MFOokIo9Ej5Ba3TJvF9g8/KhfmV6yo4K0uNtYtAQW9XwKYnFnaw5TE?=
 =?iso-8859-1?Q?GJU3yHqYGqwADVyNhlgruB8Tc10SBJVsqZ0aIY/fw9mxCFOcvTzdU69qxC?=
 =?iso-8859-1?Q?zBj5xcLZ033VTnPhgTOR3nAv1O/s9YO3soSXcV8vvdxSZ/z0SEj9ubgKj2?=
 =?iso-8859-1?Q?fwwlxhDt++8I98lal4lKik9gxawa/OV7OOaGhDgD4UgkXR03SGcWDa5QnO?=
 =?iso-8859-1?Q?mGA2PBkqLah8UFifanijT53PZMmmuapNfvJ2fYI31/VFXrkOhtHwNvFKXZ?=
 =?iso-8859-1?Q?D7r1seWPWTg+TzPWhU1cVqpQf926oR+qBEUKZzswe+wnr0BZpLN+HqMYr1?=
 =?iso-8859-1?Q?2rHlFEYZBhkOwHQT2XRargHazjhEzg9MpUZDHagxIAdqjpNHJjHJ3nQSlO?=
 =?iso-8859-1?Q?hzPb04h9jggs1B6n0AdP5h4e68diUce7gcY7vUJ/EkNjpK6cG+6M7ItQOK?=
 =?iso-8859-1?Q?ZjOnEO56zpUzGUnw9pFwtAhB3P86ktE1oSFSEvaV6XVJk/gHndFikGWchF?=
 =?iso-8859-1?Q?HCKmucUZfT7Jet7Yy9LT+IECpWzZvkG40boy0b+7I/zd41dR12/rzvyPOI?=
 =?iso-8859-1?Q?UjmHJpojjlZ7oOJHcB5Atp+IHd/9Su0QyLguqInKiUDdgN9KCV9TI4R3kH?=
 =?iso-8859-1?Q?Dbugg/C2niLvIA/IdizNtpeCvb35ztptmK6pVdyUZSajP6cXQMJIbOSlH3?=
 =?iso-8859-1?Q?T2tfeNB5f+nSD/Y0DgnJt2RAaVrkjBgGdXLp2wOIiTZpUEvZtW7za50+Jl?=
 =?iso-8859-1?Q?++AqV5QqU7sODnc7EmJiDERAJZP4O/bUa3ZzNmTOHW16mTboXhCfUtb4lP?=
 =?iso-8859-1?Q?hH/m8eeo4Rpt4PfZhDW5Kdw8UZlSNo3pcxGh6dJgryKfW/0lj3or2yzH1L?=
 =?iso-8859-1?Q?lZdI5crYcgvC1pvCZwlS6vPHi8hGqQ4SFPVCN9dIu3k1XtffyMev6dHdr0?=
 =?iso-8859-1?Q?Z0vf8ToCqcnJTG8JNjWaIqzDsBpcucEuvGm86nzmJ0NF70QHh08452zyRK?=
 =?iso-8859-1?Q?XvqQe2yAy4x11QQes5W/gQmgyEkWrU+mBSMLtLREp3aoSOKBs6cQP7OvG+?=
 =?iso-8859-1?Q?hhwsK6z3qz2Tl7mWY9c6u0tvrAmUHF8S9jSHkX0y5FloN/vClsytDkVDTL?=
 =?iso-8859-1?Q?i7n4isWSM3RIGYbwdxi7ov4kQyWZs+jpV3LPpzHUNOoovvsSjQy2u5ieP2?=
 =?iso-8859-1?Q?Jkk68It7Jje0p4UFEiqqMoocehJ2zEHCaDstxcKW5spw4VEXFkhZaVJXOc?=
 =?iso-8859-1?Q?NOqw8A23mkcDUKek0EKUhSz17toMtgZ+AiqinGVzgXty/JNxKGyDnhsHyb?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?nxGd/wXidfYHDVO3dk6ZKuvFe2kdk2malkHzj199WFo3GFWHhNnyTmfbj9?=
 =?iso-8859-1?Q?jzGARqv2Q3wLy7SH+0ERDlxNWssRaix/Y34aaBk34jhU6flvRoZGub31If?=
 =?iso-8859-1?Q?SuwzzZvEn3adUEm3d+R8xBdmyI8xnQAN90ITrJyxiuP2dCCZ3XuUnLVOZW?=
 =?iso-8859-1?Q?fZkOaKqUpfQ/VEqHoN5gt0XLy/H59/X8HlAL992xhqTMqWcDKMY57IjlQP?=
 =?iso-8859-1?Q?y/wv/cKn/uLowwycbgVpCeCVLl0yJ0CGROCBNMK+gGhyXL+J1zIUpju020?=
 =?iso-8859-1?Q?n5UFe80IfXmUjMKO82ITlvfdsgb3EChS6V/mxLRfLTThcNoJc/2V9iep+c?=
 =?iso-8859-1?Q?gGR70WLLS3mvqhDCFWGYLVFwzEVqboBArU7kxK3EFXIajdavHvkXMMfdk4?=
 =?iso-8859-1?Q?eFnKvzHnNNn97IxxOmcnZksegckrZ7iKgq+feMTAOrexPo7pjXuyNA5OV+?=
 =?iso-8859-1?Q?EvLGK3nBmZDiuRCE8oDwkEZ3DKyzUpomnq/ol/daPehI/8jHARnsdPWG1H?=
 =?iso-8859-1?Q?zv1HFJM0uEo8xfTOJjVDFTscIQzYTwIZqMeTsaOmnOg86XY4EymOZvg4K/?=
 =?iso-8859-1?Q?/RE9bld1azPULq8fL/Pi6YggA44gypv+W+rIJnQCEAz1FoX6e2qd2sTJg6?=
 =?iso-8859-1?Q?HAG8LOGISLCashMwKKZY1480bC40rJtlcQmytLBPjVLBJO960Mm1Pe+LaM?=
 =?iso-8859-1?Q?DIBd9WnnHqQNqIrhaEory8Z3cR+yj9n86N1NC9OkkDER4zcJ91VgVEOajw?=
 =?iso-8859-1?Q?nLg+IVXDFAXXzC0r4c9dlCGZH+6OBnn9a4fxHBRFqUfeaSYWcJYtFa9VZd?=
 =?iso-8859-1?Q?Uq1Y8RD5lB80Rqt/nY0zl1VMD//MEL48BLBpcwqUvmx1jOAsNkvk7wD/7R?=
 =?iso-8859-1?Q?R5BqfoeLqanmU8ppyUNGB8AMUibyaGoqnSGpZr7KaRZAVc6rhaxdf9zHQ1?=
 =?iso-8859-1?Q?2GzEVOL7sVFPnhamLGfZO9W3rcsXjDhByY73MdacwRHEjl+GyiGodWW0/B?=
 =?iso-8859-1?Q?YPNqBGJCqb8CuZ/FEboiLbx1CCkkWDfQrYxerODTgU/C5/p6JJqJRI8Cev?=
 =?iso-8859-1?Q?qqtoBZuM+NTVc7QLP5qAmdCf6iijhmCEDk+lLdBbdn8DfxzmzEJsupD8zx?=
 =?iso-8859-1?Q?tEMpGrgXqfi3FEJOSyTIaNAlOTkYL1wLNrBTl4PFkmympDIgK+8kpFlenv?=
 =?iso-8859-1?Q?pnk9cJ3TX1WCZChhP2nMrGK7BwvqWuh+Ln/B8oWae668GWLUbaD+UxQH6I?=
 =?iso-8859-1?Q?7xeu6GwCAM5q87AKolUHScJyBHPqgFDFPe7ycK1tbYc5eYagdTSWgG9akX?=
 =?iso-8859-1?Q?h8Mz7gDlliDb7WQ/q98A+8PR2FbY5CzXFq2D3fQxQrSltIJFZOFYGvxY5x?=
 =?iso-8859-1?Q?WgKuNt5Ed9VaSVE5J2a938LPCAVPa5JFvXbAwWibCCwl9ggitv2ykU+a5S?=
 =?iso-8859-1?Q?Mfoj20lBqoZHYK+O07NUmwuF0HkAmDnPwIL0EDfnOFOzfGFPW2Pzdzpne1?=
 =?iso-8859-1?Q?go2t230NBBebwhTRKgCuwsWXBiFVppG7SrIwJirUmfNsOcCUHzBpj3x7hk?=
 =?iso-8859-1?Q?LqQcevO//qt3SvPd9eZ7UiYBbb9asDsBf+PtS1wslnFXz/WY/M1s2tenGT?=
 =?iso-8859-1?Q?zbQIXyE+gZB1fKMu92+5g3sC3XQe5hC/9nDX1rYuEe5CdB87Z7vVKQgouY?=
 =?iso-8859-1?Q?7FbhCNVMcmQCXht1b+Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e18844b-ba91-402b-9155-08dd77650102
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:49:45.0939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +R/rhFy7+NQzkPQhm3au0nWsO1sdgR8yNy12I90g3/24yJYnMqhI2sBFCc9xMGGggwMzy40IiGW4cWPCK7BQh2MV7/KCR7kDhpDVsA2riyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
X-OriginatorOrg: intel.com

On 2025-04-04 at 09:59:49 -0700, Dave Hansen wrote:
>On 4/4/25 06:14, Maciej Wieczor-Retman wrote:
>> Adjust x86 minimal SLAB alignment to match KASAN granularity size. In
>> tag-based mode the size changes to 16 bytes so the value needs to be 16.
>
>I feel like we need a _bit_ of a discussion of the impact here. We are,
>after all, trying to get this feature into shape so that it can be used
>more widely outside of just debugging environments.
>
>What's the impact of this in a production environment?

I tried booting a fedora 41 on a Sierra Forest system with KASAN disabled
(disabled only the reports so the 8 byte alignment doesn't cause a wall of debug
information). Did so for both 8 byte alignment (default) and 16 byte alignment
(added by the series).

The differences looked mostly like noise, sometimes the higher alignment would
use up a little bit less memory, sometimes a little bit more. I looked at all
values in "cat /proc/meminfo".

Is there some slab/slub benchmark for the kernel that would make sense to
checkout here?

-- 
Kind regards
Maciej Wieczór-Retman

