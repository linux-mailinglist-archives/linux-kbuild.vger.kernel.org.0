Return-Path: <linux-kbuild+bounces-4669-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0079C7D4C
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 22:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04631F23890
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Nov 2024 21:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5842038B1;
	Wed, 13 Nov 2024 21:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/HN2wwC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D3204021;
	Wed, 13 Nov 2024 21:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731531868; cv=fail; b=DCMobsCrgWiRXoTKJBtp+FzbydqR1n41h7WYC9ixPKTIfzIkOWJmXb+TG0q2WdoSkFMEOapnoFmFNIFU03daUUxyIkIBf7hMnyre+HzYk+d2dY6nQoKyQLR1evYHyRGe/fHERPS1LGy0s/1asBxGxUYDF3n824+ITrk3FwR+CRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731531868; c=relaxed/simple;
	bh=lZFC+bhgeqJSRFTQF7upCNaB8SJTkpDNOE017bhTPwg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ye5xb64d0RWicCOlmSDG4oXtDZsFPJXn1VUdBQWA5KwZ1GCO5jgN808dzqcLlD41VgKCt2oj1d/qSJZ4A84nWX1QVoMoS7axBznMPxcAJ5oY5h1JD57HiLnnUHdX59nzLVA2RzoD7t4GXUdtT6skuCDM2ixKcyBwoqpDtR7RqoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/HN2wwC; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731531867; x=1763067867;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lZFC+bhgeqJSRFTQF7upCNaB8SJTkpDNOE017bhTPwg=;
  b=m/HN2wwCNy8sZbn5iVcGgX1ajBLZYRJqnXmvwNPjO4O+DhXTLuDkG3ZR
   3PVQrEVTNUIGUJzl7sLt3tHyaB3FrgETNLzPQMxVh+v9tT8/tXrKuaJfD
   kjBouxM8knyK1fYVv69H5ujwIb2fh1tCXPFj+YYKJuVgFDmrM291hz4O6
   Z6vutuIzVSEqcWihguEB89SsOfg9AASr46k0nloV2RD4GDgqjdZVtDBe1
   c3FuVJZBTNlZWWcY4CdepDNkrMw4dOF1bTRTs/y80Ae/+rgb2I3HzWTHW
   03ay+l7HYyJNNHwG8S3xFAmOwkx45HqfPI/0tO/t3vac6IDSwM/iw07RR
   Q==;
X-CSE-ConnectionGUID: q2IdhhUhQdiigPuRXy4AHg==
X-CSE-MsgGUID: iueHEO1MSt2wdXsVLIa2lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="34312447"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="34312447"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:04:22 -0800
X-CSE-ConnectionGUID: JkM/y43pQ/+7+Bq5LvsgDw==
X-CSE-MsgGUID: 5j+ApCTLQLKq9Rv73Xe7zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="87973654"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 13:04:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 13:04:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 13:04:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 13:04:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ki4xyPagKDwNNvIuWlM38XTlaFVSPK93kpYZC328EV2fsNclMxfMrwV6Ff7GQScVxxE2PYwC+Q9k1FsvYDujD+EPlfA7mgJiyWga1f18/iZOBzYWu2RF7LIT1H1DJ1RkxdTUcBeB24UMALJMHCiJTd45j5Qjwl8LkoR9z1CED++WukUlaU1NAQ+7Pi5l/h2ZK/eCKxMV56qsZRoM+/GZh2a8JB5/csriAzKJcBaTvoO3U2Gkmbg2hJiEWKcLR1x2iAVw4YKYRSwAVL71uubLS0d3D+vFjXw0sZea/b7DRXhh85oQYqrZxaZBSh+V1E5JQ0x5Fa+/nOlgch6ZN2TU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSuDDZF4TZLmZ/WNNjafDLfjaGeyM2ZGwKSHCWpNI2Y=;
 b=jFQO7fJvAuuh2mWUyNfJTjRapeq2Wa7FWdPiI1Zp4wLUayDopayG3vIVU3jc9ki9HSapdIaaDB5WcgmDP4kaJpu6f+nw0A+gw0hBL+j/iP8j/LLg1pdgQPacw9lyuEqgQSn2NfU4viK6S50npOm+q/akBImUDwojocubCnREjQL2U4pdz99AAREykHx146TeF5jCf2bFRoVivqk6iKPlhAefMnxIyuaI1nzNDGj+oUN8ecBJGJXBxGonKNDW+44sp9LOeJXRQ5Xp8NZcF0WIyfc9gak27F3R96Ze8rL7CSZflstLUarVAXwMEElRpgvemsUJTTQViqyro2z/kE2LqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5089.namprd11.prod.outlook.com (2603:10b6:303:9b::16)
 by IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 21:04:18 +0000
Received: from CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8]) by CO1PR11MB5089.namprd11.prod.outlook.com
 ([fe80::7de8:e1b1:a3b:b8a8%4]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 21:04:18 +0000
Message-ID: <5a666ac7-4026-4d4f-b2dc-74a124055f21@intel.com>
Date: Wed, 13 Nov 2024 13:04:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/9] lib: packing: add pack_fields() and
 unpack_fields()
To: Vladimir Oltean <olteanv@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, "Przemek
 Kitszel" <przemyslaw.kitszel@intel.com>, netdev <netdev@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Masahiro Yamada <masahiroy@kernel.org>
References: <20241111-packing-pack-fields-and-ice-implementation-v5-0-80c07349e6b7@intel.com>
 <20241111-packing-pack-fields-and-ice-implementation-v5-3-80c07349e6b7@intel.com>
 <CAK7LNARAsyOparQ1YxgPh9S4A-uzF04k+91t7Xy1jdTy6uT+Vg@mail.gmail.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <CAK7LNARAsyOparQ1YxgPh9S4A-uzF04k+91t7Xy1jdTy6uT+Vg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:303:b6::20) To CO1PR11MB5089.namprd11.prod.outlook.com
 (2603:10b6:303:9b::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5089:EE_|IA1PR11MB7388:EE_
X-MS-Office365-Filtering-Correlation-Id: e9534bd4-77f1-47e8-f580-08dd0426bd04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWtwQ0NmSVNaL3NoWlNucUl0OFZmdHdtb3hIRC9ieGVyWWM4TjhOemM3L0xp?=
 =?utf-8?B?ODMyaThxZUIvSXNrUGxJZjVGTDY2N2pBNTliQnFidWphTDZmY0J6d1VvUDZy?=
 =?utf-8?B?WUIvL0dtTkJGekRUNUN1Qi8yOEM1Z0ppNkJWNVg0Njd4d0t5bjlNeWg1Qkh4?=
 =?utf-8?B?L0pYRzROTG1VMmdnODZ0dnpYL1Z3cFVtZlhtS1crdWh0MURvdjl5NWRhekV5?=
 =?utf-8?B?K1MwYWhmK2F5ejFXeTFZMElscjVrU3ZZbFpmR1hvMEdtbUFWNnYxUGd2ZkVY?=
 =?utf-8?B?OFNCRmRPcmlCUVZISGM0eVI2WXNXTXVyaEdLNU5rTEpveE9MMk9hN1hrVFhU?=
 =?utf-8?B?TnVDeUdCWUZlaTNHcGNIUU5IZy85LzFwWHZLeUl0bUhLMjRWTHVoQlNVNStV?=
 =?utf-8?B?cGNIZE41bkEyazBQKzFSazI2eDBGdUpEcTJlem03TmlPRXA3S2hDQ0xGbmZu?=
 =?utf-8?B?OVFhRHF2MGdhRHpBNDRJcllUMTNLNVAwNTZoTGFISjJxZjE3ZjBkeWI0TFZQ?=
 =?utf-8?B?YUZrU1JuZDR4cGtNbVNVTmdYYnpkbldJcUFqWGpIVVdyS1A4VUg3U1FZTnh0?=
 =?utf-8?B?dUN5WU5iYU9LZTBMQXhpT3FNdk9JK2xzdXNkdkJUY2FmWVBKdWxmOVJZU2JY?=
 =?utf-8?B?N28xMkk1L0p2TGcwaCtOWFZmWk1ZL2ZjRzFKUFlaOHBzRnI2aCs0ODM0YnRK?=
 =?utf-8?B?QU1raFUySi94UUllV2IwRUtCdGd2bjNDakFBbVVjY0NMUDczS0NjSlJ0NnJy?=
 =?utf-8?B?YUI5M2VKWWJadlF6TkxMNjJoMEZJdDZCTmxtNkFiNWlpQkdnRVR2MFVKVDRV?=
 =?utf-8?B?OWZqdndKUWZJYTZuc1hoSnJucFEwTE1kUjIvWG91bkk2NWkxdW5McVM1VGlR?=
 =?utf-8?B?RlNYdzRmYmtzcFM4SU4va1huNis5WDMyc0c3eldwTDBUU1U2TzZ3cmhKK256?=
 =?utf-8?B?R2xhTFRrbndrWTJYL3dUMUQvbndpeHFCWWtLUWhjRWFiN2FnWVlDVVlEdTVS?=
 =?utf-8?B?akxrajdtanV5bVh4bzloZEZKeTdHd1gwTFZ2N1dudkRYaHVpc2ZVRldsd3Zy?=
 =?utf-8?B?RllUS2M2c3B3RWVvRUl4R0hMWEJyYm90SVJPSTZLZjJuZEd3bi9YdlFMSWN0?=
 =?utf-8?B?aS9nQ0FEMkhFRmlSdE00N0dJZS9ZSmNneW4rbERxamdEdFd3akRPOFlqWllv?=
 =?utf-8?B?NmVMT1paaGlLVk9idEJZbHRYaWJmSjNBUS9XSnBXLzQ4OFFHdjFXSEt4L2p0?=
 =?utf-8?B?ZkppM2ZGSHZyaUdIOEtBZXFEOXdlMEw2bkZweEUrYyszMHJkd0NYUEI4YVA5?=
 =?utf-8?B?SXpySkVSS21zMXBXU3daYTAxTFN3cXFJOEp4RC9BODRCNUZUZ0dUcEVFejdh?=
 =?utf-8?B?cVQ1ZE9YdjZVMDZCRkNDQmR1dXJOaU5WSFhoWTFoQ0dlcW5rTnpSQm1PMGdY?=
 =?utf-8?B?VUs3UlIxSCtCUlhlMjFPZHB1a2xGbmZrczlaRlg0bnVKUlpNZUoyVnJQR1lF?=
 =?utf-8?B?NE5lTVczcG9ROUNhODdBRlh2ZzFpWE5kZ3RZNzBGRGtVUUlhenFPc3Z4SXc4?=
 =?utf-8?B?dWdTY1hpeGNUMTFwTk5LT1JJZGtwZ3RoZnd4MVhhYjQxSFRkVmlJTG5yWldu?=
 =?utf-8?B?WGJoK1RGeitqbitRaTVWVkRqa1ZYQkZaQVVXM3M3NXpoNFZYUVF4Tm1qaUZR?=
 =?utf-8?B?cDF5MUYxbm04ekRoTnJTMWxMTkljVmlEZ2krZndrNm1BRnc0NHBPdVJxOHIv?=
 =?utf-8?Q?i/gGqSI/zsNxTCbytTmMl5TViPPEDHT+3nI5Nkx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5089.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0Rzbm8yc2krWTExNHlma253NEx6TEhBTkErVFoxMVhFZTg1amJnUTEvU0hK?=
 =?utf-8?B?ZGhWV1NYQ09QRHo0bTVkM2FTanEvQ2RxTXhrTzhPOVYrVTdkNmZNQm1nQ1Zu?=
 =?utf-8?B?TlpUUFUyc0lDRU9WSndWODF6MXVxanByN1VjckFscUdwYStKR2NWUVBSaEsr?=
 =?utf-8?B?Q05qNkF0S3RUM28zTFo0cnpkeXpWb0xUeUt3ejh0VjRNVmh6b0VyaVNRaklJ?=
 =?utf-8?B?dWpFajlCSnJlZzZHa3VwT2xYMmVRV3pScjFMREFUYTZFOVh2TnFSNmJXTSsy?=
 =?utf-8?B?cHdvLzUvM0E1ZWNHeGtSd1MxRlNaTERNWkZTNmVyTlRWY1ZqaXlMa1RNa1U0?=
 =?utf-8?B?VGU1MDlQUFk5ZE1FS2poZGdCTlhlZW5WblVkeURsR2ZVUTI3RDd6RFNzTCtM?=
 =?utf-8?B?K0RyUkhLYmRYcndycW1ocUVrTFBXT3JEUFk3U210S0gvVDlVRy9DWmROYVBl?=
 =?utf-8?B?dHdJUTJrUTNFeDVDb2JQeGxnQk5CQ1JlbU02MDR3Tmt3UEZaeUFiM0E4a3dq?=
 =?utf-8?B?OWNubjg3RkVJQlFreUVnci9PelFHbHFwNWZwZkhtVU5KelA0Qi9ITERNNzd5?=
 =?utf-8?B?RjFZUkE5RGtiOG1vMDN2S2Z5T3I1eEwrcEkrQitBTGVQSERtK08wVUl3RnUx?=
 =?utf-8?B?ZHhWMVEyVFhRQkViREkzTGkvdE51ZU43SUQxa0hUZ29QRVFLd0NWdEY4TVp0?=
 =?utf-8?B?WmRNVmNnZFlXbktiZ3B1TzgwWGNRUmJhNUZITVY4dFVsSEZRTVB1VkZSdlo4?=
 =?utf-8?B?K0JaOXltSDRzUHc5c0doa0F3b0dKMDNJTFVYeStSaVR2U1N6MGRDcHB1YW1Q?=
 =?utf-8?B?OFhrbVl0d1hwS2VIaWwwR2FuNEc1UnV5S0dMaVBpSEZkZStnVzlJN0NBMVRa?=
 =?utf-8?B?ZUlvQkdiRjRpTDRqZGhWZHZOVnBxbEhReWtkZ0RQZjh3N2hYS0c3aHJoL3RV?=
 =?utf-8?B?bFpEd3FtaHpEdWQ4VW9NVVZaU09MVXQ3VHR6bGkxVVNFcmVKcWl3bGNGVDho?=
 =?utf-8?B?aFcvR0VXaWhGQW1kd1duSVowU0E2dXZRMEhJYkhFUjQ4cmVBNVA4M3c4WnRk?=
 =?utf-8?B?Q3BNUnh1b2RmejVtUzB3QnVHd2N6QlBnTXpvMkM2WEJ3NGRuQ3BmY2drU0hn?=
 =?utf-8?B?eng4VTY0bithTnVCT2szekF1Zkk0S2d4Y0lpdW5IZDdjN2FhL2pGUlFaYnNW?=
 =?utf-8?B?TnY0TkQ1MSt4SnRKZ1d4VkxpYVE0Wlgyd1Bya2hVU0tjNHFGTG1nbUFkQWVY?=
 =?utf-8?B?cVdLYVJJSzZkeTFtbUpMNlM0VERPNjlTWVNRN2N6eXRxRDFQcUJxNDB3OHky?=
 =?utf-8?B?clVaOUlYQlRwS0NLcE56VHZzaEFBZk1tMGRRcFZNN1pBRFZsbG56QkhqbllD?=
 =?utf-8?B?anduQ0JDdzZBc3NndjIySVBmcTIrMm1UM2Q3MHJtcmd5TDA3NW1sbi9tY29G?=
 =?utf-8?B?N2pWRk90TnJTOG1ab2lpMXJIZnFBSkhwcWZvenZEallQd3hRTzlJN1cyZUhI?=
 =?utf-8?B?Z2ltQWYrdW5nUXFQaVJRZWVVbktZTG8vSmJjbnF4OEtwSWZmM3RqZ0tCZU1n?=
 =?utf-8?B?Q1o3ZGNkTkhVckR2ZEx4OXZxT20vK1JINXZTYmtvM1RzNElQRG42S1Ewd1lO?=
 =?utf-8?B?amtYeUx1QzUxck5HMkZyRUhEQkR5NzMxM0xkS3N6SUFwTUx4My9PRXYyeXZQ?=
 =?utf-8?B?ajhjMVljaVFrSS9wWUxWTTgxTGJ4Tld2Tmk4QjkyL0pLaWNqSjBLMS9EbU5K?=
 =?utf-8?B?R3BRZTNjSUlRakNrWnNhZmNEQjlrSzlqNHVuZmVYa3A3aWFJNlhXVkNzT3dL?=
 =?utf-8?B?aFVSNGd2RU1hVjlRbEI1Q29oK2FZaXQvQktUWG5EYVRzZE5icEVOdVA5UkFv?=
 =?utf-8?B?Uy9KbTdYZ3ZERU1ZeE5GK2JlbEUvQnVYWWpSalM1cWVsNlVEUUFYd3BXek1a?=
 =?utf-8?B?K1RBUHV0MlAyOGRaaU5RN2JiVlFYZUg2djU0RzlNYmh4MzV3NXk4eFNTZHg0?=
 =?utf-8?B?ZGFFWXRHSlovZWpVVmZaVmVqN2dDOUhocCt1c2NqbFFBVGNwVFpnRmo3U1ND?=
 =?utf-8?B?emdLMDJlZ242b1VwTTUweVZOcUJKL29hbDF3ZkNXSGZsRUVPUUgrdjhOYXRS?=
 =?utf-8?B?QysrcUg1QmJnVWJ0UUorNDMxVWxZVW1TanYrVGdWVFJIa2RSMzVvcGRvcjdE?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9534bd4-77f1-47e8-f580-08dd0426bd04
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5089.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 21:04:18.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjB3segsxZ+atwdFWQ7isLo+wF+QRarDpfrLArE4ThDMzyrJKTyNdMaB8MOOgEBT2pjQpfMXY2Jab+g9ftvkvqMFXYaYMllqem4/M2Kopvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7388
X-OriginatorOrg: intel.com



On 11/13/2024 12:32 PM, Masahiro Yamada wrote:
> On Mon, Nov 11, 2024 at 5:08 PM Jacob Keller <jacob.e.keller@intel.com> wrote:
>>
>> From: Vladimir Oltean <vladimir.oltean@nxp.com>
>>
>> This is new API which caters to the following requirements:
>>
>> - Pack or unpack a large number of fields to/from a buffer with a small
>>   code footprint. The current alternative is to open-code a large number
>>   of calls to pack() and unpack(), or to use packing() to reduce that
>>   number to half. But packing() is not const-correct.
>>
>> - Use unpacked numbers stored in variables smaller than u64. This
>>   reduces the rodata footprint of the stored field arrays.
>>
>> - Perform error checking at compile time, rather than runtime, and return
>>   void from the API functions. Because the C preprocessor can't generat
>>   variable length code (loops), we can't easily use macros to implement the
>>   overlap checks at compile time.
>>
>>   Instead, check for field ordering and overlap in modpost.
> 
> This is over-engineering.
> 
> modpost should not be bothered just for a small library like this.
> 
> Please do sanity checks within lib/packing.c
> 

With the goal of maintaining compile time checks, we end up either
needing to use generated macros which are O(N^2) if we allow arbitrary
overlap. If we instead allow only only ascending or descending order,
this would drop to O(N) which would avoid needing to have 20k lines of
generated code for the case with 50. I think we could implement them
without forcing drivers to specifically call the correct macro by using
something like __builtin_choose_expr(), tho implementing that macro to
select could be quite long.

Otherwise we can fall back to either module load time checks, or go all
the way back to only sanity checking at executing of pack_fields or
unpack_fields.

