Return-Path: <linux-kbuild+bounces-9188-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39524BE12A8
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 03:30:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCCB2541E81
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Oct 2025 01:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2DC20ADF8;
	Thu, 16 Oct 2025 01:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZXINPNQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC7E1FF1C4;
	Thu, 16 Oct 2025 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760578206; cv=fail; b=JhhM2mpBfqIjMDPcNmstv9a/n3FHin0k4Rqvd/F+XGuj5I/WduvU/dMH8w9Jwlykv8qu4IJ2ri+BQvWCbGpPgt5bsgz/uG1Eq6373Qur5Wh0WYiWMNASYRCKNpDY7LrS8BI+8pmIha3kvt9jupc6AyElwIdUW7WCzsrW5YwVKbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760578206; c=relaxed/simple;
	bh=0pCxU4br174KIiBNuU6xzFHwe/TOJx90lwpkW8m3ap4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kuRFRPYK7AQufBmJibln8TBi8nBBeiXpxLteL04/IM8nb3ECUOPR4OacFnaLqg6/E2EZIq47kg0pHQGM6WaCFsFNPs49bGZxu9F4/dIqJVfkpUvynHmNJZGCC4muWkavGE6K7t6tJ3vonkjF9Tz+bMp6+8lC0NgKNp9VU/YOG78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZXINPNQ; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760578203; x=1792114203;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=0pCxU4br174KIiBNuU6xzFHwe/TOJx90lwpkW8m3ap4=;
  b=XZXINPNQOIufAcqZNsgnjJ07N1LzjhXTSYWDcj5Mqm/v5v1Uz6WD9bNT
   6+5AmljQxYQovzst22qErkHhztu9bBIXlbHL6ejybGucyYYa9syJDD98c
   YlT7Z+oC6GffC9HA2J33EOtrv7TzcfhSACXJYWwTIUujACCnTdAxL+I4X
   OIDf1ug3r6sL5dU/QG0q4V2wfLtyibYVd8y8MLAz/xEf0MRcKkG6GVB/x
   dLgA70/j7z7pcXyg8ufmCNcNNBIR+7r0aGZR6VDmzEH97LM3RVXKE5vdP
   ZN0zqqjRb+VVVxP6G/5JGogHzoU6O6Ezb6zAHta6yXQTXvIBbXHLcjhA8
   w==;
X-CSE-ConnectionGUID: 42NPWLIvSUuwqFgfbxGOOg==
X-CSE-MsgGUID: P/OqoOkeTGmKDRqlB2x1CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73874001"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="73874001"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 18:30:02 -0700
X-CSE-ConnectionGUID: UJg8u99XTRO0UURHjG/nBA==
X-CSE-MsgGUID: Ldl/uZH8QgiGxrnhpEIezQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="186724693"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 18:30:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 18:30:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 18:30:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 18:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek4jfJCuMKJG9B4cMh6lzyv2TjfHbNXmgIl119ipi42kbr6bimpE4vmLYSmqRWtEPiuhC/v24og10dv4Hu71M7Eu4o4lskSZ9ySRJHpASzcjz9SxUWoZ/VzKN15w69wQrBmuQiht9NtCpsYYlMhldb2ng9wnOT4nSz3nww+lepIJFovWOLyKp9ct6Fg649nDLUka08AVjcJ5UcXIX+4EHOWOs6XZhdIS/evbo/yWzJLMOuKDo/xlYyL4eU1NFV1jBF0Rf70Nqo/X3P2rKBbmRkAESrhtV2/iqHFgswD6fsdQOzcbA0ig68UPd9MgyHhsFQOLuwHc24w4pzTAb9rtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnFlauM44OqSKId59avWxZHA7YMgBkyPatnfh+VNGSc=;
 b=RongxW+WHjaZb3DS/dVxegPR9ez/ulPD+GyMoXh88lg3rG6VJFyX14sot9gaTu6OGrr74Wtiuvzcb+w2O4K2a48yiZFKebXTV1V6YNr4Bm0Lcgfz6FcGOjhbtwI76PrGFdpOI23f3z9CDy552KLZGS/Bsx7ZVexxFM2kexo86nt5+50+CRhGwqeMCw2mmdJwQuCZU/FM3M0oXk4YPnf8BpQA6kk3nccloQ90UijfUZGfgDvIy6HWnG/yj+zdqydM/WXrwdx7utpq+AnIsRGyu9UTKcTGBZwRIBUWSq7apa7Q6hyWsOaAtK71oJuW+h+L0JqiiHIhoxNJB6eWczwlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 01:29:54 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 01:29:54 +0000
Date: Thu, 16 Oct 2025 09:29:37 +0800
From: kernel test robot <lkp@intel.com>
To: <xur@google.com>, Alexey Gladkov <legion@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, Bill Wendling
	<morbo@google.com>, Han Shen <shenhan@google.com>, Ingo Molnar
	<mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Justin Stitt
	<justinstitt@google.com>, Kees Cook <kees@kernel.org>, Linus Walleij
	<linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, Nicolas Schier
	<nicolas.schier@linux.dev>, Peter Zijlstra <peterz@infradead.org>, "Tamir
 Duberstein" <tamird@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas
 =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>, Yabin Cui
	<yabinc@google.com>, Sriraman Tallam <tmsriram@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, Rong Xu
	<xur@google.com>
Subject: Re: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <aPBKgTyyAH1rpVN8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014191156.3836703-3-xur@google.com>
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: d54dc214-1c9b-4995-1f02-08de0c538135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wfzoBF+JUhjTomgEkakWlbngebkOyLroN9tiKgV5TOGZbd490MeKf7hj1Jr8?=
 =?us-ascii?Q?c1+mKX7OUM4Ed1nMGkf7E+shc7uxBE2NsUZ4FcwCBTyYQu143om3V3Bo2e8Q?=
 =?us-ascii?Q?/HT/4pfNHdYSYSJvCZL41W1d600wPiLoC5orqXUFQAq0zasPNMQng5Z1u8OK?=
 =?us-ascii?Q?yXN4yNzewhwl5rLB+U5JzrvGXxh1hQXiYr4zKPCyYXfcGYE8GFz0DYCebryw?=
 =?us-ascii?Q?ucwHuFtTw6rcHjfDWTPio7sRkhEwUkt9+AkzbYilFcyanskfsN0mWn/k4Zon?=
 =?us-ascii?Q?Qfhds7j2u6s5DFfoTy0DVV1xK0Un1uEcYtX5bMvfhlTsWoRX3JcoNNhEIfdH?=
 =?us-ascii?Q?Z3M/Sy2d0ISHoBreJnBh+mkprGMjEMTZGxhFfSgQp4PoLqxm/gGcZM5yvMSr?=
 =?us-ascii?Q?5F6PibKg+o/IX4EJKcTNUtqB2Rpl/uF122p34tXs7An/43RZQjgJ1GJnfcl6?=
 =?us-ascii?Q?XB0IVDAKwEHh7iB+NC0dBlmdjDynr5B/lwMnN31j9IOyglq/s2NWbKLyo4pn?=
 =?us-ascii?Q?Tgnr0C/H1drpCnJyd62b0K5VMQ1NJhZMMjq6sHXB9VOL1vn6GRrAjW+aiJGT?=
 =?us-ascii?Q?gEP6XWCVS7NLSJQpG0yhz2sFPHAfk/sxAzIJ9im8PrVtW1IdZ5izccjw8ade?=
 =?us-ascii?Q?a6zD5IzVq4fSVeCKH/6dk3sAd/dh7UrUHlad2wDkjVeN6CQ2AeC7jAYAm5/p?=
 =?us-ascii?Q?NTEoheKIUh6muNz5yvkiBydFMhh+WlgRcHr4Z4r+ATnO0gX6/+dkX/CadIGi?=
 =?us-ascii?Q?tC0OgKA4ygwZEDZTq9gvf+zyuMqNxQbMVlL+27bQ6ENNybr89PxZHriGuPlz?=
 =?us-ascii?Q?GxmHuw4RQ7rfj7gr5m2eOkeBO38C+qD+pgH2U+ZzwMxYEidX6Uu+Lsz9N0Rc?=
 =?us-ascii?Q?5+QuvxM0w3DMX2dCx6R5WAWYuyPDAi6qgSJOeyIGcQG+d6yOZRmlvPp8T8Iv?=
 =?us-ascii?Q?QLQ1BfSbMTdRal+aeVlw7cyuuDwFIEEy7XuVJE54Ia2ETkkCBZp96tqv5zHK?=
 =?us-ascii?Q?dTx5OZkVIW6qiuLl04dpGrI56KRUDECMXFv8nyljzSyhh48aop2d4lQF/upl?=
 =?us-ascii?Q?JoUles6cYtUAC6yicbKIBdu13Mb/CnoqWQdYckCvPhJUABpNFPtRWQ52xcot?=
 =?us-ascii?Q?h7eGcSOSyAQIL/LZ4Xji0RnsEIF6i3RMNYHHBJklmxLc8zq1RmZUylll8bDo?=
 =?us-ascii?Q?rl87Nnldito49iC3GbN2S9daqEE7y8NNDCeyatw2emJR7Tg8nJOrHK2vDRKI?=
 =?us-ascii?Q?/Hv5A1bo+wMyTKisZ7f8mMX8UseFygVDQYLGt7pfCtakEs9Ufghhd4bGHJ3F?=
 =?us-ascii?Q?Dzg1DdZAFqRbliWWJBfhK45syCWa/dTzPfNXTeYzX9Zx1HZRUR4A8yEcvwOm?=
 =?us-ascii?Q?rkvhyi+aPxWv9DCBdtPMKLLWH/MGKUsDX7oz3cPkli4eLUAjgbyQVrwFkjwZ?=
 =?us-ascii?Q?C+3q+68r30FUzIT/++MYZqnkElHV19kJpOhwDe+xq8R3mg/gBGOdAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+6h2K0caXwxN1DFRkT4voPyMrFQBo3X/G+nbEyy+kWlvUoJC2sxKSAn8Sm8/?=
 =?us-ascii?Q?TyOalktVk2yY+awBv4XFa8y5l8QHdSuPOD8s/JeddyxcoGT7RahoLl4upiPi?=
 =?us-ascii?Q?eLB1l1TAAFU6Zk5Rka6qnOVRsrDrfMY1rqxNGrFf5h4cAekarwfYugpXArYA?=
 =?us-ascii?Q?W6XmW9sOxuz6x5lLcHsNT84VesZcLjhZWiI682slTHpht4grty21KYtNqBl2?=
 =?us-ascii?Q?LtDmLphQc3dH0g3GQXHTVpD5d9yUtlCyOPAWb6Vp7XCh0y2hamV8hC6wKz1K?=
 =?us-ascii?Q?c+iiY7IdSHSdGFlRB6MKDJn+M23q2nAl9r6Y8OsWuhobfpFL/TCQyFvaHQ1E?=
 =?us-ascii?Q?UR0UG8AK/lEjgO8al9vFiVPBiaStRHmINtTSk7km8DSYuP6xmCVmldQkA6t/?=
 =?us-ascii?Q?cwklMFdDxc94DAK998MpE1ELUlZDt9quvS4gV/hnTEscKdGR97BXnOnjr6K5?=
 =?us-ascii?Q?ZVLLPJGbw5BuxPaHVBMX/CYULKyOpPQc4rS2qxK2NLzI6BL3dzhSTtmP/p5O?=
 =?us-ascii?Q?9juWgzX2Bt2yvAbwy3uM4xhTVI6PbuECCARXI0MYgPY3c7zyaomG2e+nA1Ye?=
 =?us-ascii?Q?wvqIO/u4tcUDkm8RJfMTug6r1/ChoF/MbYgMFtBcIQc0YIoTzqPxkfukV7FU?=
 =?us-ascii?Q?uMexdnn7a+qfJ16u9tkG02JegNb5KtzQzLYWX71ViH7FZIhBq9IJKKiuRnyP?=
 =?us-ascii?Q?EvqpcN4YhmFMXguPkZUaNSk53ir2Mq3putbC7MtAU0Ktz+3BvG8NS+LHgUYo?=
 =?us-ascii?Q?aSAbfZhpGvhEmd7QtE1OSLffUNVKIVCZEKWy6ADCZiwvnFTeOuvU2GKxzP6s?=
 =?us-ascii?Q?vjOmrQRVY+US3xefs5eSF+KQMnwaFGUBapvxMqrQiJ1TtOdWnuE5n/Xstk5n?=
 =?us-ascii?Q?GOjqoCvhLbPpKfV6XM0MvQrZwnP2pi6WJn+y+aC8nriN0O8a3J2j6IgUuUMt?=
 =?us-ascii?Q?uoNYrTfQDGb4rXg61Yvz5Ehl78AWojqMklGkUIPMEy3pPNV/YJtr4ntMvKTC?=
 =?us-ascii?Q?a4xSsq8Bv0cx0wyUKFiwyu3lawdlbeWKu29Z5k6H+hK5boXaEap88pzRFkuZ?=
 =?us-ascii?Q?xW1VZNQ/fzkCRM2lrkN/zb4+prjMg5TLhtWnFOSxzG3eqx9o62he/d9HDtw8?=
 =?us-ascii?Q?d4sL7OqIgVLVjC9DUvMPqIxDgGt+TIkmHzbEWJZa7jdptKiFQ3M2hsAIROJa?=
 =?us-ascii?Q?WvSiN+sbghq1Se50dl1mDhv+fDDj0U4navWKdw8kUK6gSzfnH1fwid2Lt2uj?=
 =?us-ascii?Q?wt5+TMoqKfMubz1xIFGwtNHna3AYEvj4SnGRHrT4FTVuHIp7hKu0RNrogNCw?=
 =?us-ascii?Q?2147VYnL/sYFnSwGKwP+p5ILg20OXaEiFMWdvgmFfVuN2SUJ1IXWsS2mAeBj?=
 =?us-ascii?Q?gvl4xrvcDsL5QOva7fTUKdAiI+ZPrG+UPvaSQlI202h7H2KKGOFZD6MpBVLD?=
 =?us-ascii?Q?sxXHItuUXo/FDhSALjJ1MbqKuxu1BAGjW8INqfrzJ9bEBntyUo+lLTahENA6?=
 =?us-ascii?Q?3NKzID5la/XE0VCn7am4wUi6p9fzgZR5zKy/ufhXaMfs8iSP9Dcz1FIyxP3D?=
 =?us-ascii?Q?ZMn5/EAEBBZa1NQHgGaqjXcL33wjedO4ZhSAoVsl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d54dc214-1c9b-4995-1f02-08de0c538135
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4172.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 01:29:54.1656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjwId5yud0EYRKEWd4OjBEFAYCE8kL9XGJFqOz8d9kU7nJGqfum4HrDhzqTGUjigTLvL5cNLj9KgYaNw+MAQGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
X-OriginatorOrg: intel.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9b332cece987ee1790b2ed4c989e28162fa47860]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-Fix-Propeller-flags/20251015-031420
base:   9b332cece987ee1790b2ed4c989e28162fa47860
patch link:    https://lore.kernel.org/r/20251014191156.3836703-3-xur%40google.com
patch subject: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-buildonly-randconfig-001-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152308.eqq7in1N-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510152308.eqq7in1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510152308.eqq7in1N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: orphan section `.init.ramfs.info' from `usr/initramfs_data.o' being placed in section `.init.ramfs.info'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/entry/entry.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/entry/entry.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/entry/entry.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.export_symbol' from `arch/x86/entry/entry.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.entry.text' from `arch/x86/entry/entry.o' being placed in section `.entry.text'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/entry/entry.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.entry.text' from `arch/x86/entry/entry_32.o' being placed in section `.entry.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/entry/entry_32.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/entry/entry_32.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__ex_table' from `arch/x86/entry/entry_32.o' being placed in section `__ex_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/entry/syscall_32.o' being placed in section `__jump_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/entry/syscall_32.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/entry/syscall_32.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/entry/syscall_32.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/entry/syscall_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/entry/syscall_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/entry/syscall_32.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/entry/syscall_32.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/entry/vdso/vma.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.smp_locks' from `arch/x86/entry/vdso/vma.o' being placed in section `.smp_locks'
   ld: warning: orphan section `__bug_table' from `arch/x86/entry/vdso/vma.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.text' from `arch/x86/entry/vdso/vma.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/entry/vdso/vma.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.initcall4.init' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.initcall4.init'
   ld: warning: orphan section `.init.text' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.setup' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/entry/thunk.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.export_symbol' from `arch/x86/entry/thunk.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/core.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/core.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/events/core.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/core.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/core.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/core.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/core.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/core.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/core.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/core.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/events/core.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/events/core.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/probe.o' being placed in section `.export_symbol'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/probe.o' being placed in section `__ex_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/probe.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/amd/core.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/amd/core.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/amd/core.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/amd/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/core.o' being placed in section `__bug_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/amd/core.o' being placed in section `.smp_locks'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/amd/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/core.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/core.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..once' from `arch/x86/events/amd/core.o' being placed in section `.data..once'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/amd/core.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/amd/core.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/amd/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/amd/core.o' being placed in section `.init.rodata'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/lbr.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/lbr.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/lbr.o' being placed in section `__bug_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/lbr.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/lbr.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/amd/lbr.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/lbr.o' being placed in section `.init.text'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/amd/brs.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/amd/brs.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/events/amd/brs.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/brs.o' being placed in section `__ex_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/brs.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/brs.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/amd/brs.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/brs.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/brs.o' being placed in section `.init.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/brs.o' being placed in section `__bug_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/brs.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/events/amd/power.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/power.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/power.o' being placed in section `__ex_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/power.o' being placed in section `__bug_table'
>> ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/power.o' being placed in section `.altinstructions'
>> ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/power.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/amd/power.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.exit.text' from `arch/x86/events/amd/power.o' being placed in section `.exit.text'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/amd/power.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/power.o' being placed in section `.init.text'
   ld: warning: orphan section `.modinfo' from `arch/x86/events/amd/power.o' being placed in section `.modinfo'
   ld: warning: orphan section `.exitcall.exit' from `arch/x86/events/amd/power.o' being placed in section `.exitcall.exit'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/power.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/amd/ibs.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/events/amd/ibs.o' being placed in section `.initcall6.init'
>> ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/ibs.o' being placed in section `.altinstructions'
>> ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/ibs.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/amd/ibs.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/ibs.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/ibs.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/ibs.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/amd/ibs.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/ibs.o' being placed in section `__bug_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/amd/ibs.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/ibs.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/amd/ibs.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/amd/ibs.o' being placed in section `.data..percpu'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/events/amd/ibs.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/events/msr.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/msr.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/events/msr.o' being placed in section `.init.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/msr.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/msr.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/msr.o' being placed in section `__ex_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/msr.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/msr.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/intel/core.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.initcall4.init' from `arch/x86/events/intel/core.o' being placed in section `.initcall4.init'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/intel/core.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/core.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/core.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/intel/core.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/core.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/events/intel/core.o' being placed in section `.init.data'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/core.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/core.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/core.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/intel/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/events/intel/bts.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/bts.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/bts.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/bts.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/bts.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/bts.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/bts.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/bts.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/bts.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/bts.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/bts.o' being placed in section `.data..percpu'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/ds.o' being placed in section `__ex_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/ds.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/ds.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/ds.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/ds.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/ds.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/ds.o' being placed in section `__jump_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/ds.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..once' from `arch/x86/events/intel/ds.o' being placed in section `.data..once'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/ds.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/ds.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..percpu..page_aligned' from `arch/x86/events/intel/ds.o' being placed in section `.data..percpu..page_aligned'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/knc.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/knc.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/knc.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/knc.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..once' from `arch/x86/events/intel/knc.o' being placed in section `.data..once'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/knc.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/intel/lbr.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/lbr.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/lbr.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/intel/lbr.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/lbr.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/lbr.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/lbr.o' being placed in section `__bug_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/lbr.o' being placed in section `__jump_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/lbr.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/lbr.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/lbr.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/lbr.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/lbr.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/p4.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/p4.o' being placed in section `__ex_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/p4.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/p4.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/intel/p4.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/p4.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..once' from `arch/x86/events/intel/p4.o' being placed in section `.data..once'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/p4.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/p4.o' being placed in section `.init.rodata'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/p6.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/p6.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/p6.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/p6.o' being placed in section `.init.text'
   ld: warning: orphan section `.init.data' from `arch/x86/events/intel/p6.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/p6.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/intel/pt.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/events/intel/pt.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/pt.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/pt.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/pt.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/pt.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/pt.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/pt.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/pt.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/pt.o' being placed in section `__jump_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/pt.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/pt.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/pt.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/events/intel/pt.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/zhaoxin/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/zhaoxin/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/zhaoxin/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/zhaoxin/core.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/zhaoxin/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/zhaoxin/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/zhaoxin/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.init.data' from `arch/x86/events/zhaoxin/core.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/zhaoxin/core.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/zhaoxin/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/realmode/init.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `.init.text' from `arch/x86/realmode/init.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/realmode/init.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/realmode/init.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/realmode/init.o' being placed in section `__bug_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/realmode/init.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/realmode/rmpiggy.o' being placed in section `.init.data'
   ld: warning: orphan section `.bss..brk' from `arch/x86/kernel/head_32.o' being placed in section `.bss..brk'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/head_32.o' being placed in section `.init.text'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/head_32.o' being placed in section `.init.data'
   ld: warning: orphan section `.ref.data' from `arch/x86/kernel/head_32.o' being placed in section `.ref.data'
   ld: warning: orphan section `.bss..page_aligned' from `arch/x86/kernel/head_32.o' being placed in section `.bss..page_aligned'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/head_32.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/head_32.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/head32.o' being placed in section `.init.text'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/head32.o' being placed in section `__ex_table'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/head32.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/ebda.o' being placed in section `.init.text'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/platform-quirks.o' being placed in section `.init.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/process_32.o' being placed in section `.export_symbol'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/process_32.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/process_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/process_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/process_32.o' being placed in section `__bug_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/process_32.o' being placed in section `__jump_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/process_32.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/process_32.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/kernel/signal.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/signal.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/signal.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/signal.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/signal.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.setup' from `arch/x86/kernel/signal.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/signal.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/signal.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/signal.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/signal_32.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/signal_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/signal_32.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/signal_32.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/signal_32.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/traps.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/traps.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/traps.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/traps.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/traps.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/traps.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/traps.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/traps.o' being placed in section `__ex_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/traps.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/traps.o' being placed in section `.init.text'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/kernel/traps.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/idt.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/idt.o' being placed in section `.init.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/idt.o' being placed in section `__bug_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/idt.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/idt.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.bss..page_aligned' from `arch/x86/kernel/idt.o' being placed in section `.bss..page_aligned'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/idt.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/idt.o' being placed in section `.init.data'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/irq.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/irq.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/irq.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/irq.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/irq.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..percpu..hot..__softirq_pending' from `arch/x86/kernel/irq.o' being placed in section `.data..percpu..hot..__softirq_pending'
   ld: warning: orphan section `.data..percpu..shared_aligned' from `arch/x86/kernel/irq.o' being placed in section `.data..percpu..shared_aligned'
   ld: warning: orphan section `.data..percpu..hot..hardirq_stack_ptr' from `arch/x86/kernel/irq.o' being placed in section `.data..percpu..hot..hardirq_stack_ptr'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/irq_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/irq_32.o' being placed in section `.rodata.str1.1'
>> ld: warning: orphan section `__jump_table' from `arch/x86/kernel/irq_32.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/irq_32.o' being placed in section `__bug_table'
>> ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/irq_32.o' being placed in section `alloc_tags'
>> ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/irq_32.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/kernel/irq_32.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.data..percpu..hot..softirq_stack_ptr' from `arch/x86/kernel/irq_32.o' being placed in section `.data..percpu..hot..softirq_stack_ptr'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/dumpstack_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/dumpstack_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.data..once' from `arch/x86/kernel/dumpstack_32.o' being placed in section `.data..once'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/time.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/time.o' being placed in section `.init.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/time.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/time.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/time.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/time.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/time.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/time.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/ioport.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/ioport.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/ioport.o' being placed in section `.rodata.str1.1'
>> ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/ioport.o' being placed in section `.altinstructions'
>> ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/ioport.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/ioport.o' being placed in section `__jump_table'
>> ld: warning: orphan section `__bug_table' from `arch/x86/kernel/ioport.o' being placed in section `__bug_table'
   ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/ioport.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/ioport.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/dumpstack.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/dumpstack.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/dumpstack.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/dumpstack.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/kernel/dumpstack.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.initcall5.init' from `arch/x86/kernel/nmi.o' being placed in section `.initcall5.init'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/nmi.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/nmi.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/nmi.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/nmi.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/nmi.o' being placed in section `__bug_table'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/nmi.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/nmi.o' being placed in section `__jump_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/nmi.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/nmi.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/nmi.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/nmi.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/nmi.o' being placed in section `.data..percpu'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/kernel/nmi.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/nmi.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.setup' from `arch/x86/kernel/nmi.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/nmi.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/kernel/nmi.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/ldt.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/ldt.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/ldt.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/ldt.o' being placed in section `__bug_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/ldt.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/ldt.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/ldt.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/ldt.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/ldt.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/setup.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/kernel/setup.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/kernel/setup.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/setup.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/setup.o' being placed in section `.init.text'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/setup.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/setup.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/setup.o' being placed in section `__bug_table'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/setup.o' being placed in section `__ex_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/setup.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/setup.o' being placed in section `.init.data'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/setup.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/kernel/setup.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.bss..brk' from `arch/x86/kernel/setup.o' being placed in section `.bss..brk'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/x86_init.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/x86_init.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/x86_init.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/x86_init.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/x86_init.o' being placed in section `.init.data'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/i8259.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/kernel/i8259.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/i8259.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/i8259.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/i8259.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/i8259.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/i8259.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/i8259.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/irqinit.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/irqinit.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/irqinit.o' being placed in section `__bug_table'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/irqinit.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/jump_label.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/jump_label.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/jump_label.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.ref.text' from `arch/x86/kernel/jump_label.o' being placed in section `.ref.text'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/irq_work.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/probe_roms.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/probe_roms.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/probe_roms.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/probe_roms.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/kernel/ksysfs.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/ksysfs.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/ksysfs.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/ksysfs.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/ksysfs.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/ksysfs.o' being placed in section `__bug_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/ksysfs.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/ksysfs.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/ksysfs.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/ksysfs.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/kernel/bootflag.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/bootflag.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/bootflag.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/bootflag.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/bootflag.o' being placed in section `.init.data'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/e820.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall1.init' from `arch/x86/kernel/e820.o' being placed in section `.initcall1.init'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/e820.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/e820.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/e820.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/e820.o' being placed in section `__bug_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/e820.o' being placed in section `__jump_table'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/e820.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.setup' from `arch/x86/kernel/e820.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/e820.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/e820.o' being placed in section `.discard.addressable'
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


