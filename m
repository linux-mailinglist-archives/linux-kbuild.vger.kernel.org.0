Return-Path: <linux-kbuild+bounces-2287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE291C812
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 23:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 820E5B23243
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 21:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90B47D3EF;
	Fri, 28 Jun 2024 21:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGypgcv7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5D200C7;
	Fri, 28 Jun 2024 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609845; cv=fail; b=Vsc0Bl0CqRZ7MQkrlhz6kfPrPzuWPSLx5dDbB4Oi2ATDQgjQt8PysDyv/EpiqrF3GXUcYaaNG3ErNIrgpEDBHk9n6bXdtBo9Ey+G+Sb5v+wQUIo87QQSKb9HeVe8D6+MT3rH5h2UF6J56dLPs8JCmV4NjKXll6S21wi+J242Mfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609845; c=relaxed/simple;
	bh=Z4vrNul94cUBFgDyUKCK/coX5mO69w+5NKZKkQ1ZG8k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HNZQHAFv6DcLPTCjnGO6fvMpALvapkWQmLGXharDpdMPkHTlTqXImhsO/+MWJ/4orQGycl/vVLK4X7Zl6A09az4ocmV/c5NCfJPbIIctEm6A1eVErI3vFNPboLDi52Ad/XQ0h+f17vGwxeM7G3LhBe3kcD4RWc/8bKM01f+Tdj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGypgcv7; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719609845; x=1751145845;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Z4vrNul94cUBFgDyUKCK/coX5mO69w+5NKZKkQ1ZG8k=;
  b=UGypgcv72ALMKOhtkI5UyTtj7x8OYj4ozs+VWW3iDEZET5Uv/BlyZVtN
   4aZZy6O83FvHnVK/YORh+6RydDY6MPGWBr2JwY0dHx5V3eFTVRHjP64zb
   uuH34Y+nFYXS/uGT2wu6I5irhgNAI73BmVm05q6ySxR7wX+ktyrLlnLNg
   RorEys4wvQr0sgBghZ8kXPD9Js7WWuMXWxwjt1TyN2XBjGgZoHNvsr/mc
   YWWSTHz9rQvk7itgGPFQX+SXIXvTfXmqSt5h65w3aWTwzg2pIWjED3adj
   AeM0CLcDGj4nLVUFuqRVCdxtgRgjj76Wn9qgta1CrRURItNN4r+AEZ72h
   A==;
X-CSE-ConnectionGUID: Bw9ugJCNQUuNKPCIhCT9lA==
X-CSE-MsgGUID: UmAruX6FSuy7KwELJ8IQzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="28197170"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="28197170"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 14:24:04 -0700
X-CSE-ConnectionGUID: 1aXhOlIuTQKijk9pvFie0w==
X-CSE-MsgGUID: CK6m42ZeREOU1XEhy5TIpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44974915"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jun 2024 14:24:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:24:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:24:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 14:24:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 14:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMHNpXDyzlgIjoLzoWt9T0rR7xzdO424+T0iT3Z+bFNMbCnZJrLshGpyTM+Z203rI1gf8JvsKBxhMu2dtRKmFdKYWF/X7FNGRmKs4mAXUm3+eP5SLY1TEh9tD/OV8uBkNdbXc+HPcnLpr7iF0KEIOMkSRCRyXlWisUq1pa1Lzmja066IFgJsIMIKXL3HrC7gQgJ185F7hl/WHFydq4lz65HNjj5LzrhSpph6tN76lMLDS71Kjtlly6wkLgaIyJ/Bh6gnZM9heMUA3rY20fRI+j7fAAdX/6j/NBTwJxNtODuk/E6jQDKPbaIZ7TGWuEWNd1Nq33uzayiweNkNpS3EJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z4vrNul94cUBFgDyUKCK/coX5mO69w+5NKZKkQ1ZG8k=;
 b=j88qCdMgHidli2/G1pYZ1vIq6NvE+yFkX/Hwke73af2VPBApivkxpyEisttoiCICWMo1DPZR3cKH+hI1twpDsrYN3scUmXi+22OLg5lYjW8aNPlRKMLhZnL05BtngckHvqnvspBxOOgZSNpotM4/jYw9F3NngHfXOJAuFEt/oFOrhHgVo2fyAftOmqmKPTymOKPAJJV1j+L+qQnYL4I3mGIJ6oA41dAb4uWLDXQ8yTjdNxbaN3QEO21fQvPQtwYipHqeayaJz9ieqYKjdwUEGhf8mk1moXZBfHN90MX3FGVjXkk036JcGl4pOlwxOxGldB0rAhr/0L2KYZbsNfUHgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DS0PR11MB7631.namprd11.prod.outlook.com (2603:10b6:8:14e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 21:23:54 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 21:23:54 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>
CC: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "conor@kernel.org"
	<conor@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Topic: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Index: AQHayLVfl2uFd7lKFEy9THA08Pzt97HccBAAgAFBeQA=
Date: Fri, 28 Jun 2024 21:23:54 +0000
Message-ID: <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com>
References: <20240427145502.2804311-1-masahiroy@kernel.org>
	 <20240427145502.2804311-5-masahiroy@kernel.org>
	 <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
	 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
	 <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
	 <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
In-Reply-To: <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|DS0PR11MB7631:EE_
x-ms-office365-filtering-correlation-id: 0fa2111d-5448-4389-9345-08dc97b89d4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S3pJRko4T2UyTTZhS3c3bGtNK1JDMzhtdkNXQjBHVG5DMnlXOXNDOURsRTRM?=
 =?utf-8?B?YXZ0YkN0d3BoanpzQVR4OVk3NkU5Z0EzSDMwZUw4L1RSWkxwVHZ3ekRjbkhr?=
 =?utf-8?B?cWZGNDBZMWh6VFZzNUlwUXdick0vN2VKR1lQQlhGT2tpSmtydi9qcjFGQ1lr?=
 =?utf-8?B?WGlCTjU1U0txamdnekdMb2oxQWhkMDBkLzVwY2lENUVDTVQwbEFzZ29XeWhk?=
 =?utf-8?B?VkZKOGxzaktOUTRLalNUcHhtZ0hTL1pzdmx1aU1za3UxT09mTGhsUDFSRjlK?=
 =?utf-8?B?cHZ3bmFLWFE5MHdncW5Gay9OSEpweEhkVFR5ODVhd1VvS3J3THZGVXNVYmJL?=
 =?utf-8?B?Q1V1MlZScTNZcUoxc1ZUeVpJYWtqdThmUGNNb2ZRNEd6V1VWb3lGb0dkUkpE?=
 =?utf-8?B?cGcxV3JJOG9NSzB6YmIxbnJML0trUHJVQWRBTndmelQ1aVZDWitnc2wxa2tC?=
 =?utf-8?B?clk0Z1pqR2gvMzV0LzBZeHlJVjNYcmNvYkVHaTdtSFRNU1o5VStsS1dyWSs3?=
 =?utf-8?B?Q2g2L285c0hqV3BZNU5CVUZuT0pXVkZpVEsyd2N4VGpYVUcrQ3dHVEdtQ09V?=
 =?utf-8?B?YW16Y051eThGVE1PQy8wR25QbGQzbVFlMWlZNlh6c0dWcktKaDFWdlRUTFpn?=
 =?utf-8?B?UVN3QzFYVWpvUFJjR2hvZVFHTEhSU0NjSHBIdjRsQnV2dU40NEluM2gyVDFk?=
 =?utf-8?B?MkVLbHBmTXNMbGJlbzVIMW9JQnZHVFMvYjlHZmQ0NXZJVGJrVEI2c2NZdUM5?=
 =?utf-8?B?WHVZSU03SGhCdXU2amxOaklXbFJ2U3FPSVIydGFJb1JGeE5FbVAxbFU2WVU1?=
 =?utf-8?B?aUVnRzc3V0Fudy9kSHJpb0ZGbC9oRTMwWVZhWVhUUG4rNEVuS3JPQjFHQ2Ri?=
 =?utf-8?B?b1BIRkJPb2FvWk9BVy9QWTI1TU1sWVdRY0s4cThtOVlOeVM3clA4dXNmTFlm?=
 =?utf-8?B?bU9oNWluSmpKYVFqSEc2OStrOThQNEpzSnErQXFwamI2MFhybWFDOG9ET1p3?=
 =?utf-8?B?akRhdlE4NytTc3QzNUJ1clAyU0p4aDY0dEp6Mkh5UVFzTDgvRjhnWUYzbUNV?=
 =?utf-8?B?b25jb0RSR3RtQXJmV201S3cwNzlLMW4zcWR6UERpSndHUzBqSktOU2tZc2tW?=
 =?utf-8?B?RENmbEVSNFV5eVJpZDVPYWxqQXZKdm9uYXRJWnRyd1BoTW50MVVUKzRORGtY?=
 =?utf-8?B?YXA0S2NrZ3BkdHhFSGpUenN1Y1BCTFUvQ1o5b1JPZys3YjhleTErVkZJVldk?=
 =?utf-8?B?cnFXMXkrT0ZSMUtwS3c0SkxjNjVWYy9PTkRBdFNOVTlqNWlUdk1zQkpqM1lT?=
 =?utf-8?B?TUlZNm9zOFJmaTJrSXF1NlZDL2tsUGhMVG5aZ3dYdk5NblFTakhnWHlSa2lY?=
 =?utf-8?B?anZhVElPZ0t1czNGZVltUEErZW8zSzh2bEo3RzJPKzRaOTFheFlHeWxhQ2pB?=
 =?utf-8?B?eUJhUUxibTZVVzZjY1U4N2NXMkcveDhiTFpwajExakE3U1F5ZUt1VXFrQ0cy?=
 =?utf-8?B?M1NFU3lneUptakpNY2VkZlFqZXArdHViWm5kZUFJQlRxM1Z5c1ZGNUNSMFE3?=
 =?utf-8?B?R0NYNUhobDBXdnZOSWRVWklIUjFGVGJrYTZ6TG42WlNtczQzYjRLN08reTFJ?=
 =?utf-8?B?YkxzK2xPSTlNRGIvOWhVMzFiV0FVa2tncllkTlhTczhWSml5VmIwVHFvVVdo?=
 =?utf-8?B?czNsM0tpOWRrMXNaNmpoSmVsUWc1L1luZnZENDNGNFJBQ2paa3VxWjJyWDUw?=
 =?utf-8?B?WkpPU056MHphYWE2VnhLUGVENTNhZUhJRkZKaVlUZWxTY1FyUEJoVkFJWkRn?=
 =?utf-8?B?UHhmOFZxcVlrNTBUckxjQkJwUXErYkZlTGhVc1czMkJTN0VmbHJobWRaYmhr?=
 =?utf-8?B?aXFYdm8zNUhndkgrL1hoZ28vWDZaTkxwbWhWTThZaDIvQkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0pYZUpkdXRSUlk0bWpUSVE4YTBjTVdNMDlpS21paGNDTk1sK3ROanNqRU53?=
 =?utf-8?B?aDY2d1ZVaHBIa3FRYXFaU3BvODViTzBYUS9jZ05SZjZPbjlWNTY4Q1ZycjFv?=
 =?utf-8?B?RDU3b01rQ0loemxsTWo0MncwNzhqMTRDRXYxWXVvUVphcFpseGdHSU52UVZk?=
 =?utf-8?B?dDlRMUg3dy9GQ2g4OTIyMkNkaW9ueE1GV3FySlhWZVZhZ1V0dHpaajV2QWRG?=
 =?utf-8?B?QmVmbnBUZXVwdXZHMXRPRTgrbGdZMm5aWEZ2VzkxTTQvZTFOTy96ODM0Snlx?=
 =?utf-8?B?MElhc2J2elZaRUdEMTNHUVpmOHMydytVR0dYZjdvZnEzWTYrZEo3NUh2RFhY?=
 =?utf-8?B?QUYxQ0JZQjdVSExLNHU2U3dlbmdMaEc2SGs1OG81b0plZGVIdUVGSHBaNFhr?=
 =?utf-8?B?WlhQZlpWbkR4NWVkWE44QTV4azZSY2RhQ1JhOGgxdTFLSDBxeW9XcWhMU29W?=
 =?utf-8?B?Yk9uOEJvM3cvRTdOZVo5T3hFQUQzb1FzaDRCeXhaQTV3WUtkOUJVa0RENTRq?=
 =?utf-8?B?VEgybWJ4WHJQVHFZVWxjMk1qL0M4K0ZSY0lQQjVjSGlvZDBObVVVeGpTeS9O?=
 =?utf-8?B?VmJYK3h5MG1vQzJkTFFPUFd1d2VQTXJ0SVdOb1J2WmVwK1pzdGdOeVRVZjB4?=
 =?utf-8?B?Y0RvQWk5eWpYZlJpTVRpSDJ4TnU4ZWpJM2JPN051U0VISkp3UDdHMGpzbC85?=
 =?utf-8?B?Um5WU0UydVg3SjF4NTd2K0hlU2w5cVZjZFJGdzBTZDVPUzhKZlZzZ2RqNDd2?=
 =?utf-8?B?V0ZoN3p0VDBNK3VDSnFqWDN4NzZuMlE2TVZtYmhmRkpPMm5oN2g2Q1lmNHVo?=
 =?utf-8?B?MEo3b2Q1ckZzU1EveGQ1TWN6L0tSbWpmUGs1L2JUZ2doVlV2d0wwZVpZOFpO?=
 =?utf-8?B?Q1VPUFRQT1B1SS9KS2l1V2xsTjlvYm1wRDhMcGtTUGhXRnBOK1N5SGpYVHJN?=
 =?utf-8?B?Zk1WL1RSbzllOFRLRUpHQzU0LzJTL01veFNBQi9vOVFxdVdoWW9qRXZTaElG?=
 =?utf-8?B?T0NEYm5VMCsrS0Q5UGNPTWFNRHRGaUZ0UFpWSVVCbE41RlFrMnZjSmpsUzJV?=
 =?utf-8?B?OFdaaUVmRnZZWW5WdFc1R0g3NEd4REZDOVpIN2RXbHdvZzBqbHM1VW4vYXVE?=
 =?utf-8?B?MXExbmk3UFpCc0pNeHJ1cW96MS9vbGFnaVlKamZqR3l0MkRUOVVSb0lDci81?=
 =?utf-8?B?QXpjaDg1Y1VqbGNGNVhCdVNDOEJmbzB5YkNXcjQyNTRndWFtLzJRdjBhcCtD?=
 =?utf-8?B?cjJiMUg5NU5IdVo3bTRXakYvL3dlYjB0QVlpVGdQYVRiQ2N0SGZ3K2VWaVZO?=
 =?utf-8?B?WDNML3lFOGlCOWdKd3pmR1Y0U2I2bzdna0QyUXRPMUFtZUxCamtpd01DcFhj?=
 =?utf-8?B?c3h1UGxlMXQrME45MEJzdjRUV1UvcVcrYk1iZitQVUl3eWNZRkRKUTFUaUlo?=
 =?utf-8?B?SlhPSmw1WU5EVmNBVHR5TVFLV2dsc0draUJ0dENwTzZBSk9JZ3VMZmNOVUxX?=
 =?utf-8?B?UFZMV21PdHJIcXJrc1dYUjZjejBKRkdoRXdKemQ3WGk2RmJBR1hzNklVMjdl?=
 =?utf-8?B?MEhYSjQyU2V2UHd0Nkl3L0d3ZW8zUUhaTTM3bTU1eUVtcHpKRzV4bUFZeGJ6?=
 =?utf-8?B?eE5OckpXSktTQXhUYUJmZUhqYW5pMWNTaS8zWlY4eDZJaTBBQ0lHVVlKZXh4?=
 =?utf-8?B?Z3pFM2M2YzEyL1VvVFBYRG1ONjdwcE1GeDRHQzZFaWJyNVJzb21PQmdRbEVX?=
 =?utf-8?B?VVZCU2lobHlzeUpzNGxMUXdmNmFnV2E5cjVXK2NZb2R1Mks0aTZJVk1kWU92?=
 =?utf-8?B?bmNqMlNiZ0dTWTBGZ2drRHEvM0ZSQnI3VGU4MWdLN3VCL1R4ZkVIV1NXYTl3?=
 =?utf-8?B?N2xuRm1MVVB5QUM2aTNVNVdMeHNLeXRMelRrOUc4MUFRWnRuWitGenFwZmtq?=
 =?utf-8?B?NldiTkVCd1p5NCtydU1nNmJFZFFYT2JDOTFuTExxTW8yYTZUa0Vhck01U2xv?=
 =?utf-8?B?a3ZUcWxPdERZVVN4U1NKSGNSaWY3VWwrZk5nQitsRWhET0F4Mlc4QTdEZ1NV?=
 =?utf-8?B?Y2pmRGh5YUdrYVpnY2ZZa3lkUW5YeVp4d3E3ejQyM1JSMzZNNS8vYTVtRU1s?=
 =?utf-8?B?blhmL0ZzTlQwWUZ0bWxMbzVETEgzT0tBYmZYYVZERlp2QnpPVVJydE5oUGNi?=
 =?utf-8?Q?/d6rtbPV9NWgsB8irqueh2s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9467BCB58F54E4884A7773478AB1205@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa2111d-5448-4389-9345-08dc97b89d4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 21:23:54.8304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3jXq3sOw29H5Lcm4+YWNDpTiRDL6x8PHmNNcxtgk1+ZHgAY6oDfUkDhNSDsssOz2rH/HuZrEKTreDoVubryfhCTf3Hk726vxsPEv9CxHOJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7631
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI0LTA2LTI4IGF0IDExOjEzICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
DQo+IFRoZXJlIGFyZSB0d28gc29sdXRpb25zLCBkZXBlbmRpbmcgb24gd2hhdCB5b3Ugd2FudCB0
byBhY2hpZXZlLg0KPiANCj4gVGhlIG9mZmljaWFsIHdheSBpcyB0byBwYXNzIHRoZSBhYnNvbHV0
ZSBwYXRoIHRvIE09DQo+IChvciByZWxhdGl2ZSBwYXRoIHRvIC4uL2xpbnV4LXRkbS1rdm0tb3V0
KQ0KPiANCj4gVGhlIG90aGVyIHVub2ZmaWNpYWwgd2F5IGlzIHRvIHBhc3MgVlBBVEguDQo+IFRo
ZSBleHRlcm5hbCBtb2R1bGUgYnVpbGQgZG9lcyBub3Qgb2ZmaWNpYWxseSBzdXBwb3J0DQo+IHRo
ZSBzZXBhcmF0ZSBvdXRwdXQgZGlyZWN0b3J5LCBidXQgeW91IGNhbiBzdGlsbA0KPiBkbyBpdCBp
biB0aGlzIGNhc2UuDQo+IA0KPiBbMV0gd2lsbCB3b3JrIGxpa2UgYmVmb3JlLg0KDQpUaGUgYWJz
b2x1dGUgcGF0aCB3b3JrZWQsIGJ1dCB3aHkgbm90IG1ha2UgaXQgdXNlIHRoZSByZWxhdGl2ZSBw
YXRoIGJ5IGRlZmF1bHQNCmluIHRoaXMgY2FzZT8gImFyY2gveDg2L2t2bS8iIHNob3VsZG4ndCBi
ZSBjb25mdXNlZCB3aXRoIGFuIGFic29sdXRlIHBhdGguLi4NCg==

