Return-Path: <linux-kbuild+bounces-8626-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92337B37A54
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 08:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9822B1B6720B
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 06:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA6B2D6E7B;
	Wed, 27 Aug 2025 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgWA5OeB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4930188000;
	Wed, 27 Aug 2025 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756276076; cv=fail; b=EKNye9NvdLWN8A0yANM1Ep32w3sQMXZv5ba2bzZl64ueMc+1PL4OnixYLwoZpZJTffJZpSn8IdjCm8Or2IQVPPwYqfZWwhhAnYQzpmJGsndyTgb9xG5hzXgygUyDca7Rd6Lei32PtgLLR2oCvcD2qZg3I/Fzt2aW2qPPSBH9bBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756276076; c=relaxed/simple;
	bh=KPZrZIUv9EJCyN1pepa5g2AqO71ULOtbbt9NJiC+bpc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YJm9vOIU98qcN2r7gD8q90xDzUffqmIeBpC6WI/V+Wd/sPSlMdJwFihBflmH1jkWQz/sv5pg4wPNtF4ZLskAvQmuZTJyNP2qelCwBUoxHlhI4RjcBMxBLJTyo85glsSp8KH9Q1bJ4lqgW4gqxtHQqiwSfiA3CGKSBepOKdoZp1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgWA5OeB; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756276074; x=1787812074;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=KPZrZIUv9EJCyN1pepa5g2AqO71ULOtbbt9NJiC+bpc=;
  b=MgWA5OeBravnGxtDkS/SgWKWH9cKaqORYEEdLsCGbTtBLJ24mKd823Cv
   yqPBi037fZT72II4BBz30AdxpFvtAmNvIhQetH+b6EGvruTo8d8q3qlBQ
   hJWFxyZZNNI8/mAIt2N0rbZ5hqhrT34LN1i5UERjsK/7QUiioLBlYOs98
   Kk3f/CCB5D9kLNZNpREjGd7veRUtNyXd0z/MDCPM3QQi5l/oiQHHm6Le4
   GUWPzIAnV/R/A9Xs9TevZ68iGyQfFty5LzfhtoGiuJSlCbKGLiHroNSHh
   /su1+vflbw8HJrpnnIZrM0ODMw8JI3Tsz1hz4Urdc8vQ8NLgrNHE6bd+I
   Q==;
X-CSE-ConnectionGUID: sX0N4583Q8qcawBirwVPNg==
X-CSE-MsgGUID: XhZr4XC1SGurXhJPAKzcUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="68793044"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="68793044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:27:53 -0700
X-CSE-ConnectionGUID: lDlwUV6VRQmZfNG/Em730Q==
X-CSE-MsgGUID: xJ4vvhNARniivyoKtrt0yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169282837"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:27:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 23:27:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 23:27:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.88)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 23:27:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vINRHoRpojvcpAkkGb6akgenB3uNiD25VFfNnVrgCloPUdmIT3+5E3FjFZYd8N1xrJAtcab69SN1g7NSv0KjHfInebkOQTa7KnyoVZV11D1wyKcvQ7iyrNBF2/bFg4DrQDXXUdhv+NGhdaRPey82Ehu3daVlAnlWWFDA0oxgMxUAUOlEHyoB9O64Gv/+9wRDCiBeeEawAgUMdUHx8BonRaylWlHNFUCT9UqluW4ZnYccxeWBaU/yJDykw2LwSUZ8PIqee/RmXzKqXZKoa1trL90R2z/oZdQC3iLa5bkKuAc42ImD43cQgK0/ZQuDzsDm+o2kQu5t+UxaPMi4LEYGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVpgQuu4a18qaU1w6d1i9ExUt4jSKqQzEQxvdVOOTXo=;
 b=A6nHjYU4Nu+mpWIc8tOPmAwOiBtUC8ZmEHX/XbB5TV5NX3ehQNxjvHaA7OOXmH09vTdhRGd/48eMzzBFs9FYGq0Flk+FT3gV1APpGb3ubhyHrOIM6OsSyhtLcMQgUSPRf8ZD14OHusjCe2R8wCJ/MiuILBtHm8yutqwotbz322cKFM+YdmMdGct6KpZrcNUzJu2TPMdS/aRhtIHfIeQpKVLwUncaz7K5oeri4pmNleP6goYuDcsrhs2T/D/vuiA3TUCABsblwWcuCJn7+WhhWlyujL6DKMxFlKZPUdjCgBJlVWRQIBUD5s56N5wo5h7r1oSQZsT9gdTvJs9f1dw6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by SA0PR11MB4527.namprd11.prod.outlook.com (2603:10b6:806:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 06:27:42 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 06:27:42 +0000
Date: Wed, 27 Aug 2025 08:26:57 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
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
	<alexander.shishkin@linux.intel.com>, <samuel.holland@sifive.com>,
	<dave.hansen@linux.intel.com>, <corbet@lwn.net>, <xin@zytor.com>,
	<dvyukov@google.com>, <tglx@linutronix.de>, <scott@os.amperecomputing.com>,
	<jason.andryuk@amd.com>, <morbo@google.com>, <nathan@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <mingo@redhat.com>, <brgerst@gmail.com>,
	<kristina.martsenko@arm.com>, <bigeasy@linutronix.de>, <luto@kernel.org>,
	<jgross@suse.com>, <jpoimboe@kernel.org>, <urezki@gmail.com>,
	<mhocko@suse.com>, <ada.coupriediaz@arm.com>, <hpa@zytor.com>,
	<leitao@debian.org>, <peterz@infradead.org>, <wangkefeng.wang@huawei.com>,
	<surenb@google.com>, <ziy@nvidia.com>, <smostafa@google.com>,
	<ryabinin.a.a@gmail.com>, <ubizjak@gmail.com>, <jbohac@suse.cz>,
	<broonie@kernel.org>, <akpm@linux-foundation.org>,
	<guoweikang.kernel@gmail.com>, <rppt@kernel.org>, <pcc@google.com>,
	<jan.kiszka@siemens.com>, <nicolas.schier@linux.dev>, <will@kernel.org>,
	<andreyknvl@gmail.com>, <jhubbard@nvidia.com>, <bp@alien8.de>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>, <linux-mm@kvack.org>,
	<llvm@lists.linux.dev>, <linux-kbuild@vger.kernel.org>,
	<kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 01/19] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <cwxjbxch5mu6ji7dhus2kfygys2kky2agu4gqrusnz2autk22t@k2cq7qgqmmvm>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <7e314394fc5643def4cd4c6f34ebe09c85c43852.1756151769.git.maciej.wieczor-retman@intel.com>
 <aK4MlVgsaUv-u7mS@arm.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aK4MlVgsaUv-u7mS@arm.com>
X-ClientProxiedBy: DUZPR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::13) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|SA0PR11MB4527:EE_
X-MS-Office365-Filtering-Correlation-Id: 15383612-209b-4714-8cfe-08dde532d40c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?fT5bBLm23rX6Auf5KPDQwPGN+axElsWmRu8oSKqwKCSehhzShBiSiDYyfx?=
 =?iso-8859-1?Q?pT3nIPOMf5vG5c2GGFErRbR5wjb/8lPbggFY4mR/Chw85GDU0hxcSziZGp?=
 =?iso-8859-1?Q?cZrOhn3SUnzwuuO5QOczMKOyrfyQTd9ceLkccHmXqOZ6M20fhw7OMIK4+P?=
 =?iso-8859-1?Q?OyMeQEMkogW2TnqB1ozWZaICilLN0tL0TUV7R1zBURqKhXps67qq75iViW?=
 =?iso-8859-1?Q?06heReNhZt2zNbVJDTzm+vxJTxB7ne/Yhi5gHvgiNmdrX+7YQ6CH4Fk1Z5?=
 =?iso-8859-1?Q?purz9HNcNw5N6Eph/nDDF7VVFOt70Gtz7Dqx0zr2DX5D1/Dqy8NfCSEzPC?=
 =?iso-8859-1?Q?0/jGw1+YWRcmazMpRSDupKU2IFoXgiwyIeeK6aQLCEnlKkmpeWo/SuUXOX?=
 =?iso-8859-1?Q?MQ7Od0j+2zJY3qrlaCobFgpa+1depuRMDy+wiS1Axii9Fyna6DV+Prk6TJ?=
 =?iso-8859-1?Q?MhQUCwFCdgHxuj+Hl11DHUDlbZ3G5P2pli1k73o4iYq5+mMEiOmDvfT7hS?=
 =?iso-8859-1?Q?W1U1ScFd5Cab9u43pfsq8WmRemoovcl7/3tLfTDqUzaPeKqMQNuL2t41mM?=
 =?iso-8859-1?Q?UBeCZ9zBcQ9iA0fZp9gm9F2CARODLUl+KhzlsFM+QsWZCgPb1zT/BPE5kn?=
 =?iso-8859-1?Q?yFfVTlUhhJM7xJ+ilL6jLLqz3Hd69uZH3dQPN6Noj7qoKwfzN+QtzGWaVO?=
 =?iso-8859-1?Q?Z3VpXOM8vBkWbXEaCpK66m7qWNuAvtyoBU0DxdwioAZ6532UoGynix/4sw?=
 =?iso-8859-1?Q?yRCxUj9viREzoijuLmrKrdqR+PLddv77xdsFUXlGsSt94cNhkJiG4MkFwS?=
 =?iso-8859-1?Q?zaLOJc+fXGZfxr/z+A6jjdiCcvlYnZDi63iWy6uSsvfjnSvArlkyURPfdk?=
 =?iso-8859-1?Q?9YUkgwDAObeUQ4YDPBJrwC0MyZxE483kgyRMgXg89cOQk1QKe192lUpyd7?=
 =?iso-8859-1?Q?OCzUsjwjlU+5ku9Yos57SIkgVf/4yKxEzb05tLtcsmDyy5TAWDGNQR/Te2?=
 =?iso-8859-1?Q?fY+BHh9HoQuq2bKn37Xl8wtn1/yETYdrTBnw/SNflf6zYjhfpS1hdQYQtq?=
 =?iso-8859-1?Q?LOMMhJHsJD6h2e4ziAv3sBQkI2/YaINVZKiSg0nXgXaE/sqKU61LA/gtvg?=
 =?iso-8859-1?Q?eJ0plP6dJLSU6LZOxYe5aUIqpSQcytxe3LdFdfsxumh9cYcK5K84TfQbTN?=
 =?iso-8859-1?Q?OR3VDQd1N2yWmYt1YTbe4j/nz+oWWR/iqMVjwsIcBldUpwUjGKuCsc59dh?=
 =?iso-8859-1?Q?2sdZiK0RsNBwe9VIx/dcy4J0wgC1gOufGRE1huSYbzrA9jP8OhjPQoXR0E?=
 =?iso-8859-1?Q?rSkNPLbg4MWRIgFTLHEGX1gzQoulcBMTmXuKmqalWMpGLIV1JCod1jSeid?=
 =?iso-8859-1?Q?7jUi8pq0NsSGnmSBHB2EFWW0MwEymMAEhgEv7ybtyMaKXrgodQyq2lEHSy?=
 =?iso-8859-1?Q?p+7oAMUmKjJR07OyPssf54rxoTj9C4o+f6yYT7TcGUoKUDmP/G8xRxgec1?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sRJpjmF2TPhOSFBW0EZPcQnkPMTHh6ok7SDGyELJr3xrUeHD3WbTZyTDWt?=
 =?iso-8859-1?Q?w7qe8z+wSYlusmleHbhowdJ3uqElF4qzDvHoE1FpTSxhcSFXwelsKI4alv?=
 =?iso-8859-1?Q?3o+YdaObrdyH+oHTV2NqqFRUeiaScEhqR4ljLoPcQBBjDsAWAnOLfQVT03?=
 =?iso-8859-1?Q?P7YlRYYOZOkfe07GAcMBUNJkDZ8KVlE7ewDaIpao0mWfurVBTuwOIQ5D6+?=
 =?iso-8859-1?Q?HC78YyshcT27QNVERGcUwHK6gRcz6X4eyWiO5OAAm7+8KB42LUDeSrk+o7?=
 =?iso-8859-1?Q?/wbBJOQiAHPrkGhWzCNtKu5EhwbLL2BFyNsgBKijwyrZABapI3yuaxt6Xb?=
 =?iso-8859-1?Q?X45O5fuSx0RQVCJtouNuAcamvzZ+rJp8BDXU+vaS+uwdgxyeCmmy04yYgQ?=
 =?iso-8859-1?Q?rNWKjttO/OREFyOOQSHePpb7HVIXBrQslwLM3gQrZF4GWzn5ppFaUEoPLh?=
 =?iso-8859-1?Q?jAJ3ITvy2H+WMUvY0zDj3fx2KnjMbCD+YKGsymtqcMKGL6gJplhcsFwcI5?=
 =?iso-8859-1?Q?EjZZB8C4uofbQf6fos43o+v/Ke8kf29EgxdessMxi3pOhx5ntk75KZtoLX?=
 =?iso-8859-1?Q?CqCM1vMhbE1kpY4W3+dtEw8RAJNBZFxbLMZm5KerymC4XcuO6O62i2w6Bh?=
 =?iso-8859-1?Q?kYvfIudFseor0XDi2aqRArvdRPsR6s14JY4lHYL5FEnN2Mbf2MeTteH1d8?=
 =?iso-8859-1?Q?bujm/s66kIv9VbUHlUMC1ZoVG0WH9F+9KyGPusGIhGjZW5v8DBY1U4DQMH?=
 =?iso-8859-1?Q?Bzl3nvg+M8OrCCOg6mOEh6Rox9EhHZeNRFro7A+6Z6vkXV3oamB74EZNBx?=
 =?iso-8859-1?Q?TlEpMbKLIh2swzC7aPeQV3lblaXo3E5trRorn1KdEzpV8CDai/Vdj78j1g?=
 =?iso-8859-1?Q?daQPcb/2c+ZlGH6OQlGeflgwhsSBPUL7qPZM4fiygZHeyCURMqNS04CKLT?=
 =?iso-8859-1?Q?E1UhvARP5GS09RvGAbcsSDDtpL1joK8FOcqD8XchPnd56DG62cR8f7Kby9?=
 =?iso-8859-1?Q?jsCyYB6RzLk6qf7C9qe9Wk/v4tjBat3zfeKH9UDf4bMtXRNpkXC2JzQltv?=
 =?iso-8859-1?Q?8eHiSLaOjKYgNtYADODaSa6jIZxbaXesYxt2Dyu25sY8OIr+Jh73iEK6cQ?=
 =?iso-8859-1?Q?C30/NYa6AFACxrG6TFraR27asjbgRXTjBhRAgj0LQUbkYDmvu6nQSftYnP?=
 =?iso-8859-1?Q?rAPOGyutJmZvXUmfjor53YEQHMGRmk46/7Y3tst+6dYeEqcrKmyTiC1t3P?=
 =?iso-8859-1?Q?SYAM8WXrYjaH584LwFu4fdBWKjEiPZvafineY0VGop+Wy2pwDxSjNYWPlL?=
 =?iso-8859-1?Q?u3hHGJz3+P7ztLubSBfjTs6q9bxEbKvhST306rt7PXRSRNFKgVFTJt1YwR?=
 =?iso-8859-1?Q?9J0RCazgNZ0qGf3MkliB/UhfO0ekc3G542ZZ54unIyNpl/Y/kUp84AI8Dv?=
 =?iso-8859-1?Q?ub6mQ0URqUOg3D5bNqugI5nB7ki1wmI/wOEHX8JXGi2PFB1QvbJ8/5I/HA?=
 =?iso-8859-1?Q?Hk7EGmL10F4HRSoOVxRnUkFyplqHlEyBpts+523Kt128xltaQrzNLRPZyV?=
 =?iso-8859-1?Q?XgGAtKuShQKh9iF+dtE4oMR4y8PfZwN182P6xxnlU+agU8jSvi3f1PesWH?=
 =?iso-8859-1?Q?04vL8vn7b20RJbh/P01m2BpUYTeOwg6rhpwdWWPdbDVRgdq1zwS44r1PlQ?=
 =?iso-8859-1?Q?0AQMH44nCCEFeD9cJAA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15383612-209b-4714-8cfe-08dde532d40c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 06:27:42.7355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8z+9UnGK4WCySK15LQLISgdosoGoW01wH3bshDOyqSxxhx36p//3GPdVPX22t9vb98rxhapvs5bB+AczScPamOhRz5eT06Ssi5XF2u2PnE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
X-OriginatorOrg: intel.com

On 2025-08-26 at 20:35:49 +0100, Catalin Marinas wrote:
>On Mon, Aug 25, 2025 at 10:24:26PM +0200, Maciej Wieczor-Retman wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index e9bbfacc35a6..82cbfc7d1233 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -431,11 +431,11 @@ config KASAN_SHADOW_OFFSET
>>  	default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
>>  	default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
>>  	default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
>> -	default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
>> -	default 0xefffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && KASAN_SW_TAGS
>> -	default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
>> -	default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
>> -	default 0xeffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
>> +	default 0xffff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
>> +	default 0xffffc00000000000 if (ARM64_VA_BITS_47 || ARM64_VA_BITS_52) && ARM64_16K_PAGES && KASAN_SW_TAGS
>> +	default 0xfffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
>> +	default 0xffffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
>> +	default 0xfffffff800000000 if ARM64_VA_BITS_36 && KASAN_SW_TAGS
>>  	default 0xffffffffffffffff
>>  
>>  config UNWIND_TABLES
>> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
>> index 5213248e081b..277d56ceeb01 100644
>> --- a/arch/arm64/include/asm/memory.h
>> +++ b/arch/arm64/include/asm/memory.h
>> @@ -89,7 +89,15 @@
>>   *
>>   * KASAN_SHADOW_END is defined first as the shadow address that corresponds to
>>   * the upper bound of possible virtual kernel memory addresses UL(1) << 64
>> - * according to the mapping formula.
>> + * according to the mapping formula. For Generic KASAN, the address in the
>> + * mapping formula is treated as unsigned (part of the compiler's ABI), so the
>> + * end of the shadow memory region is at a large positive offset from
>> + * KASAN_SHADOW_OFFSET. For Software Tag-Based KASAN, the address in the
>> + * formula is treated as signed. Since all kernel addresses are negative, they
>> + * map to shadow memory below KASAN_SHADOW_OFFSET, making KASAN_SHADOW_OFFSET
>> + * itself the end of the shadow memory region. (User pointers are positive and
>> + * would map to shadow memory above KASAN_SHADOW_OFFSET, but shadow memory is
>> + * not allocated for them.)
>>   *
>>   * KASAN_SHADOW_START is defined second based on KASAN_SHADOW_END. The shadow
>>   * memory start must map to the lowest possible kernel virtual memory address
>> @@ -100,7 +108,11 @@
>>   */
>>  #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
>>  #define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> +#ifdef CONFIG_KASAN_GENERIC
>>  #define KASAN_SHADOW_END	((UL(1) << (64 - KASAN_SHADOW_SCALE_SHIFT)) + KASAN_SHADOW_OFFSET)
>> +#else
>> +#define KASAN_SHADOW_END	KASAN_SHADOW_OFFSET
>> +#endif
>>  #define _KASAN_SHADOW_START(va)	(KASAN_SHADOW_END - (UL(1) << ((va) - KASAN_SHADOW_SCALE_SHIFT)))
>>  #define KASAN_SHADOW_START	_KASAN_SHADOW_START(vabits_actual)
>>  #define PAGE_END		KASAN_SHADOW_START
>> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
>> index d541ce45daeb..dc2de12c4f26 100644
>> --- a/arch/arm64/mm/kasan_init.c
>> +++ b/arch/arm64/mm/kasan_init.c
>> @@ -198,8 +198,11 @@ static bool __init root_level_aligned(u64 addr)
>>  /* The early shadow maps everything to a single page of zeroes */
>>  asmlinkage void __init kasan_early_init(void)
>>  {
>> -	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
>> -		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
>> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC))
>> +		BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
>> +			KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
>> +	else
>> +		BUILD_BUG_ON(KASAN_SHADOW_OFFSET != KASAN_SHADOW_END);
>>  	BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS), SHADOW_ALIGN));
>>  	BUILD_BUG_ON(!IS_ALIGNED(_KASAN_SHADOW_START(VA_BITS_MIN), SHADOW_ALIGN));
>>  	BUILD_BUG_ON(!IS_ALIGNED(KASAN_SHADOW_END, SHADOW_ALIGN));
>
>For the arm64 parts:
>
>Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks :)

>
>I wonder whether it's worth keeping the generic KASAN mode for arm64.
>We've had the hardware TBI from the start, so the architecture version
>is not an issue. The compiler support may differ though.
>
>Anyway, that would be more suitable for a separate cleanup patch.
>
>-- 
>Catalin

I want to test it at some point, but I was always under the impression (that at
least in theory) different modes should be able to catch slightly different
errors. Not a big set but an example being accessing wrong address, but
allocated memory - on Generic it should be okay since shadow memory only says if
and how much is allocated. On sw-tags it will fault because randomized tags
would mismatch. Now I can't think of any examples the other way around but I
assume there is a few.

-- 
Kind regards
Maciej Wieczór-Retman

