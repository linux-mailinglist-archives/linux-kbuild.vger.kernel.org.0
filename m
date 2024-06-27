Return-Path: <linux-kbuild+bounces-2267-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FBC91ADB3
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 19:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A0C82842B5
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 17:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA843198828;
	Thu, 27 Jun 2024 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhGC5VnW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90CA197549;
	Thu, 27 Jun 2024 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508442; cv=fail; b=BdMqyB322uTzhFYRt+g+71mk03gipNRSKLAcGjruRmaiXLT/ssA+ZIozdlmGupaJWs+RRyfM5QnvxgVkJb53I3MKgsPtbgrs9Qrf2QS+2aHtYt8QmRWfjs050QMINwLSSqXcenbHzzh5Y3BE+4fF4jeE87P5mFDVm2ajBMEa9y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508442; c=relaxed/simple;
	bh=BbQeoW2ipjac3Pm8QI1ymMOmvCpWBwmxdtaxSsb7QfY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GOS1fhAAPb/HJ8NOLzodVyCWUVqrA5ycai2xLBMdnsMT5+utBJi/gUh3WS+dP+6hNFW/BX2KO8VXatECzUrU2M+qKbNGUY/1PDAZB1GNyhnycj8j5KZ/rUCbhJW+eSdrQqGJeuDl5w2OZXtWu0wtyeH64PKCNX4rlVZIfopykEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhGC5VnW; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719508441; x=1751044441;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BbQeoW2ipjac3Pm8QI1ymMOmvCpWBwmxdtaxSsb7QfY=;
  b=MhGC5VnWimFC2M/RrHtOuzf0rQHo42nETb9/Vmw0WMdXW0pwRbONHjnj
   BUOHUDcCRtLe8IK+7bAPLxE65yUcoaWvMQUSfRLON1p64VAdXlQARh/pI
   fj2s6cTbGsl9OhD+G+hba8LN0LcCKu+OhJcSMpd1HLijsFSqSQomPPprU
   w3/us5nryln9aExQEqw5rI5WhUkiUhkjtBq2CkQJPrHXYwngsu2HcoGLe
   spQT4lnSMBb/LGkEoIa2xnEVpkch+O3ifJGne85H4e++xIE8/U3u4s6Lt
   c2sd9nMQ3Xbqcvi5dlfTIpuIf8cu2utqjt+Y+18bnbmgiOMxs5I/mQplO
   w==;
X-CSE-ConnectionGUID: XJvSYtCZQMixXK/DtRQJhw==
X-CSE-MsgGUID: Be+xXc+TTkCt4jPN8RdA6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16788880"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="16788880"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 10:14:00 -0700
X-CSE-ConnectionGUID: FkqYSg1JSReCzrivmeGnhg==
X-CSE-MsgGUID: ct6ao0hzRoiEsTnyFqMrYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="49413826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jun 2024 10:14:00 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 10:13:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 10:13:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 10:13:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3EJNSJyVnhYyj5tY6WihGyWuOhjEd7OnWWjZa5fXDVMsHE/ePU1jp66HpoxI9X8nDApha3MNqMqPfRg1sVbo9SEP4CWvx1+AFv9+8vsjDBYtUm1whkq1nLeldjnRxFIwjjV0T30Vm5byU3oNqlrKTNrDGeBuCoKE1LlawKBB3W14vZKYtO9zW9kbLAmMfRl9uYuqeHeMchQQ7W1gAYJBLNIMiJuzVJ3D5mB9mOj6fPU2S0ghQ9fullycF2HPyopGfqgzezr5udIfofEfFTREcPCBeCLYCUoTXTruBubYRaLtNq27YzqTzejBPFWLZulNC4LMBYp2fmA14kqfnzCnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbQeoW2ipjac3Pm8QI1ymMOmvCpWBwmxdtaxSsb7QfY=;
 b=Jb1RiFvo7jRVzgCmW/PD1DSCYA8bpP+dF/k7+oA2r0xlsdECnTybwS/c2AGs5nHPnmdTf0KFg2p47f/0ZicGf2AKOVCOVHNou/fSBJ5dwNoOur3SV11kJ8SqpVN6z5HmjvL9oVM4KKIForLlq+fO0JyNbxLddt9J1WxafsKDqoMVQ2eGnVwGRCnfhET+4RdrZnyEp0Ryp4jKTG/138+22ug+wh5orcJZG4p9BYhlk/BQiK5y8RC6KxEfQ8K1fHvwQxmXnXNMAtgyZylwllHlCfoEAa5bs63LdhQp6ejoOzpDiXRLt/0TKXKGN8o52BglYtJqN/3SqtS2qnI2KImFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 17:13:51 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 17:13:48 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>, "krzk@kernel.org"
	<krzk@kernel.org>
CC: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "conor@kernel.org"
	<conor@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Topic: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Index: AQHayLVfl2uFd7lKFEy9THA08Pzt9w==
Date: Thu, 27 Jun 2024 17:13:48 +0000
Message-ID: <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
References: <20240427145502.2804311-1-masahiroy@kernel.org>
	 <20240427145502.2804311-5-masahiroy@kernel.org>
	 <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
	 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
In-Reply-To: <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 223cc09c-3bb0-4762-e506-08dc96cc8271
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dzVMSmc2RERuK0FmeUhOaWgyRzRDNW1kQTltTHR5VGNMaWxzZXlHWGcrM0RZ?=
 =?utf-8?B?Z0RBaFI5NWYrZ2ZTOXp4U2F5SE5WZ1NHb043R1o1WDZXYncxZlRONDVENURz?=
 =?utf-8?B?UTc0U0Nadkh2T2w5Z0RaUUVRWWYxbm5rNzI5VFRMOFNOMUFuVHZDbGV0RGY5?=
 =?utf-8?B?WkpXQlo5YVkrRVpuV2sxQlg4T3drMUZjMGpMR3BzN3pvRkRSZzdZcyswNXlt?=
 =?utf-8?B?UWdyejRtZHRUMXp3N1NHblptSHNNZFRMVmd1QlowOU04R0x3ZXdLTElBTzNz?=
 =?utf-8?B?dDlUUGFTN1ZnMVArdEY0cllZOWJCTG1TZlVrbzM2d1VWVjMwZDdmcUszZVR3?=
 =?utf-8?B?bDJvdElMbUVCbCt3Y1htNUgzTGgyQVlVVXdRZTNxMUVXb3RhZmhEUXBYWTA3?=
 =?utf-8?B?a2FWRW44enJ4SC9oSWF3elhLTFhjeEFSdGhrbCtQWk1rcERQMVNYZ200US9i?=
 =?utf-8?B?WVJ3Y2JyMU0vcUV5QisveTZ4ZmxZRm5oTE8rQ2JSeW1mZG10ZDlFcE1yZUFt?=
 =?utf-8?B?bTB2VzBXTHpjNm15ZUpiRUd4K0xicDFDQVcyeTVjUVJZcjFmbmJ6dTEvMXlC?=
 =?utf-8?B?TEZnUVNUOWNwODZwVEJZNjE1TjZmazk5VFNuLzZ2VjBpYWRwQThpOTRyN2x5?=
 =?utf-8?B?blN1L1JNWEUyWGlnWE5EQnZrMnFkUE1KeWdaU2QrTEYrbGYvbFRlYUdkZmpO?=
 =?utf-8?B?VU5CdGhDYUs5Qy9ONjZzN0R0OHZDaUVVaDNlOVl3bzljVDcyM3ZKK3JBZGhr?=
 =?utf-8?B?QU0xbmpPSHJ6SkVLMVFZNzhWL0VHNDNpekdmZU5tbmF1QmpQWFRTc2JDbkVt?=
 =?utf-8?B?NUFmNXIwWWxBdnZPN2t3VzVFVFFqSFBDOVFWOGJXVUhhL1JGWnM5NHZlMDJJ?=
 =?utf-8?B?akRHYVJwenRiN0xtZXdUT2FDZUJ0S2l5bERxblBrWkhPWi9FN1J2cEptR1Jw?=
 =?utf-8?B?ek54UmwvS2lzWTN3SE1aSjVtVEt4THpQWEl4cGR5Q0pocnA1MGpJbE5PSjZw?=
 =?utf-8?B?WHpIY0RRY3gvZi85SHdPZEFWZ0dQTW85U0dQZ0hsaTJLT2o2MlU1Vkp2N2FI?=
 =?utf-8?B?R0QxdmhNeWUxM2RjRFozOU1hT2YzR21nTE04dVA5NkEvYjJIclNNYnFkaFFs?=
 =?utf-8?B?RnFyNkkwTTBUeHM3R0p3a1kwdkR6WUhFam8vaHZwRlhzR1hHNW1sSGRmTHBI?=
 =?utf-8?B?Y25kYnhtaE12RUN2N0JMbHpkK0FuVXlYVXFWN3BqendYMnkwbThraHo1MmxO?=
 =?utf-8?B?OWdjNVFEN3RNUXY0ZERxSjVHdDFiNVNHbzFLR3cxZWZwajJZQkM4bE9DRTE0?=
 =?utf-8?B?NDBMVC9zbEZEQzRsZUpCYWd0bDJEL0xlNHNBSzYvSG5uTHNERkJUaEVOOHpE?=
 =?utf-8?B?WGY2VUxuQ1UrR1BnQTFySS96S0RFam9BbWdiMXBjZUNNQUtoYmQrY21OMFFy?=
 =?utf-8?B?alhRdWpiTXM4YUtWQTUrdWd0Z01SbmM0cmNvUmpSUVFFT2xxTjJ6WlVvOWZM?=
 =?utf-8?B?WHZFNVZOVStEdFl6cmJZL2RDemN1ZnV1WXN6OUVMOTJ5OGZLOUJZK1ErRHdj?=
 =?utf-8?B?QS9YYW9XUjBFZjdwR1BlYjY3NGlmQkltd1kxSk8wZkR5QzhlTVVObTlzeVdD?=
 =?utf-8?B?RklPbmxudjFsOTkrcmlDRHZXeVhLOXYvSjB2R0JMOFlvTDQ0N1kxdnJMUWJy?=
 =?utf-8?B?QWU0ZkErNjQ4aWJuSjNWVEp0eWljbkRSWjgvK1pVNVpNSHQ5czFETFlpK3JT?=
 =?utf-8?B?OTAveTlSeXZEa1FUeFBMOG9OUXhtNHF0TkZSaFVEU3hpbmRJSGdSRVJURlVq?=
 =?utf-8?Q?AohkAlBNHzhauXtNGpqYumDHJSitGMaW58fmU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVhMUys4RllOYWVpUlhBOFJoSWtjbjFKaUNlUUdacWxKeVo4cVN0SFlBRldl?=
 =?utf-8?B?QldCRUtOZGlsZFhnTHA5VmhMWUpIMURsaHNiYTRVWmVGVU1RZ0FkdzlHZWdH?=
 =?utf-8?B?V3U1TmpxSE55dGV1MFRDRGdVUllpZGFrU2o2T0JvYmdxNEJ1QS93c0ZyYjVR?=
 =?utf-8?B?bExtSkpwUkc0Q0tWZUxsc3VNeFFuWFphWjluNzk2cDI5Znkvb29yMTErUXRW?=
 =?utf-8?B?VXJCRVJEWFd2NWxubUVaUFFNb3Q4U0JMR0UvL3Y1RFRIVTJSejVuSkJ4cFpI?=
 =?utf-8?B?eUk3YkRIbTJ0MWoxb0Y2Z1psVk9Od0Vsb3pPOEpqQ05aY0hmOE90ZVFxb1Ez?=
 =?utf-8?B?Tjg4MTUyUlIrNDNlMGVCK24zWnhjUkF4SS9RSGJGSXo2M2dkaHF0R3RiQS96?=
 =?utf-8?B?bnFRcFhxdEkxVHNhZjNDOXRuYldTcVBpUnYzMjNBTTJjWm5TQ2plRVI5Y3Yw?=
 =?utf-8?B?QktIdGsyN3N0Rzlod2NJNEIrdTVZbTZ0ejU1cW1abXk4SkhQSldyWGIxUTc1?=
 =?utf-8?B?NEdES3U3UzMxbHE0Uk5vUWYyeGJ2bHcxN0ZOQWY2bUJISE5ibFdMRHRTbE9I?=
 =?utf-8?B?ak5hRlhFSWZCRzVKZlY1U0tPL2VyTTFrZHp1T0p4YmhnbnI1Vnc3K1czQXRM?=
 =?utf-8?B?OW1uUEh1U3ZDUVJWMDVudmErYWloYnFnTkh0Y3pxWXFZNXd6NUZBNjZwZzhi?=
 =?utf-8?B?alJUeFpzSHB4dmZnNWVBSldnRjhYbnB1Y0xzYTNEKzUyUUkveW1QamRYN3VC?=
 =?utf-8?B?SXkycXk0MEtMN0FzNGdDYnZFc1B5MzdqWGJBU0RZTEo4cTgzaGVGUE5hTURl?=
 =?utf-8?B?a2lQK3R3TDRSWkIwQmpCSnNBSU0waTBBbnBWUStEb09BNGNzdHBIaEJTZHFr?=
 =?utf-8?B?SGhNdDhLQzQyd0U4ZS9ZK29ZOFBlNnljQ09NQjZWV250a0dleXJET2g1Wmoy?=
 =?utf-8?B?N3p5Sk5lbVlIOFJVTGtFeWZkSDdoajd0eGY1b0U0RjRBL240Z0hjRmhrZ0xD?=
 =?utf-8?B?WU1IS3YwZGMwQ2xTcW8zcU9idHUxYWpzd3ROU0h1RUlwVE1vWGhzK2tRUkdr?=
 =?utf-8?B?Sm1hNUdqZERvV3dSc0FwUmhPSGlhVE5IaUlUQzF3MkJPRnBuVXNRZit0UFJP?=
 =?utf-8?B?ZEFTdmswcjRLclFPaHppdjVpdjl0aVZUYm9QandRSHV3b2FnS09CWVFibk1L?=
 =?utf-8?B?WG02eTRqaG9DNGRQRkhPRkdPQWlJNzZ0MVp0ajNTWG1LcWt0WlIrMnNDVUZq?=
 =?utf-8?B?ZWVuKzN1aUsvTW56K3Q1a0NzdytYOWpHdTlYMUhSVUZNK3hmdkFYQ1VZRFNE?=
 =?utf-8?B?MkJXb0dsUGRyZ3FiemV2bDVQeG01NkJjd2o1cG9Ta0tOWlFGcElrN3NmR0V1?=
 =?utf-8?B?bTlHdHdpZFpxeDhpbGxkTVFtSkcyMWxsbUFMU3pZZ2RYWmYrNlJudGVSQTdv?=
 =?utf-8?B?ZnNJZWtJdDc0YTNndktEYTA5Vk8rb05heWI3SzM5S3BkSEU5OFdueUtYNHdC?=
 =?utf-8?B?b2Q0d25VaklRR0s5dk81TTdlRjhIaFNrWlo5NE5RSUlIQXJtZFFTTDB0dGRD?=
 =?utf-8?B?a0cvU3FTRjF3bmcydFhVcWJITzF6MlkyMXU1U2dLWFhCT2RzTzZGV3lRTS8x?=
 =?utf-8?B?clNVaU9SNE8xZ1lCbk9BbjJGQTM1MWI2M21PTDVZbFlhYitCZ2RtMHNhTGdS?=
 =?utf-8?B?SUJESW9qZVhFeW5TSSt6Yy9DdGlQNTBmS1NpSWFweEpuSWdySytDeFJKTmJZ?=
 =?utf-8?B?MS8rS2IzM2lhSW9ra1h0aGo5VnZ2WVp4UVdUM2l4MEVtbllpT21MdEpCdXpa?=
 =?utf-8?B?N01kSExHNWNGVnNoUU1iTGZ4ODhJTmdrdjMyT0h3YllKQjMzWDMwSUZ0QkIr?=
 =?utf-8?B?cUJmQzhzZUFhS25hbWpWYTBLUmZJQ1ZKc1ZsdzRvNHNZK3JaWEF1cUJzUTE1?=
 =?utf-8?B?djVvYThuTXN1RDBHM2hua2d4UzlnMXladWJKaUdaeG9GWWFKeEVJUTFqN3Bp?=
 =?utf-8?B?Wk15bGpsMC8ySlpNeTcxcXdLcjVyUHFxWEVNengyWFRWaGhSWE5YdG1DWVFz?=
 =?utf-8?B?VnIzMzcrVEVuV05hMEYzb2FSYk5NMnJXQ0c2UHZWZ0liRGNqSnppQXY2Szhy?=
 =?utf-8?B?SWo0TlJsUkFYbmJiM3gvS25NQXRtZzNreDRMU25pR2FPaUhBS3B6SWp5V0JO?=
 =?utf-8?B?UkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB1491634D2380478C087CAA40592E2C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223cc09c-3bb0-4762-e506-08dc96cc8271
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 17:13:48.5304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZtF9/5M5lyPdKE+jETXTvi2Xp8RCt8KTk3VUpCGeYj+xdhxYvcqZUJnIcDrqK9KMR4a6zhv3NpQzKtDxhChf4mLRSVkUYCxD6tuxedAWA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI0LTA1LTEwIGF0IDA0OjM2ICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
DQo+IA0KPiBPciwgZml4IHRoZSBjb2RlLg0KPiANCj4gDQo+IE5vdyBmaXhlZC4gVGhhbmtzIGZv
ciB0aGUgcmVwb3J0Lg0KPiANCg0KSGksDQoNClRoaXMgY29tbWl0IGJyb2tlIG15IGJ1aWxkIGlu
IGEgc2ltaWxhciB3YXk6DQptYWtlIEFSQ0g9eDg2XzY0IE89Li4vbGludXgtdGR4LWt2bS1vdXQv
IC1qMzYgTT1hcmNoL3g4Ni9rdm0vDQptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy9ob21l
L3JwZWRnZWNvL3JlcG9zL2xpbnV4LXRkeC1rdm0tb3V0Jw0KL2hvbWUvcnBlZGdlY28vcmVwb3Mv
bGludXgvc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0MTogYXJjaC94ODYva3ZtL01ha2VmaWxlOiBO
bw0Kc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KbWFrZVszXTogKioqIE5vIHJ1bGUgdG8gbWFrZSB0
YXJnZXQgJ2FyY2gveDg2L2t2bS9NYWtlZmlsZScuICBTdG9wLg0KbWFrZVsyXTogKioqIFsvaG9t
ZS9ycGVkZ2Vjby9yZXBvcy9saW51eC9NYWtlZmlsZToxOTM0OiBhcmNoL3g4Ni9rdm1dIEVycm9y
IDINCm1ha2VbMV06ICoqKiBbL2hvbWUvcnBlZGdlY28vcmVwb3MvbGludXgvTWFrZWZpbGU6MjQw
OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUv
cnBlZGdlY28vcmVwb3MvbGludXgtdGR4LWt2bS1vdXQnDQptYWtlOiAqKiogW01ha2VmaWxlOjI0
MDogX19zdWItbWFrZV0gRXJyb3IgMg0KDQpUaGlzIHBhdGNoIGRpZG7igJl0IGZpeCBpdDoNCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA2MjQta2J1aWxkLWZpeC14Y29uZmlnLXYx
LTEtN2MwNmVhZTZkM2FhQGF2bS5kZS8NCg0KQnV0IHJldmVydGluZyBiMTk5MmMzNzcyZTYgKCJr
YnVpbGQ6IHVzZSAkKHNyYykgaW5zdGVhZCBvZiAkKHNyY3RyZWUpLyQoc3JjKSBmb3INCnNvdXJj
ZSBkaXJlY3RvcnkiKSBkb2VzLg0KDQpJJ20gZ3Vlc3MgaXQgaGFzIHNvbWV0aGluZyB0byBkbyB3
aXRoIHRoZSAiTT0iIG9wdGlvbiBiZWNhdXNlOg0KbWFrZSBBUkNIPXg4Nl82NCBPPS4uL2xpbnV4
LXRkeC1rdm0tb3V0LyAtajM2IGFyY2gveDg2L2t2bS9rdm0ua28NCmFyY2gveDg2L2t2bS9rdm0t
aW50ZWwua28NCg0KLi4ud29ya3MuDQo=

