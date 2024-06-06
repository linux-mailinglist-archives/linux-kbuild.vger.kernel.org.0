Return-Path: <linux-kbuild+bounces-2018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FE18FF372
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 19:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E88DEB26B94
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 17:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B48198E60;
	Thu,  6 Jun 2024 17:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhJ+e8yI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F71E87F;
	Thu,  6 Jun 2024 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693365; cv=fail; b=V5fGqrevHP6lI8KSW9Wx5PD7090qLjyEAylv8WQQ7l13/7klSPYhZUqhh/yV68TW1xZ0pyDxAwnN9R+MvWbIJodoSEZp+eRN4uuELK50X3Vlu6For4aWQZb+D67vqAHDsUBbbDII+An9avLvfWzZibCX4kydzFvJbt8xdNy3UE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693365; c=relaxed/simple;
	bh=xlN4woytFnRe5H9ztUHbqTIbRkIu0xHZ7JAKqreTz14=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KRvwiMHg/f2NusvbfInudmDaatjcAM5+w03q9ymXYxba7rMnsOoqIGtGgIK2rPnUk0Zt5hgyd/WTFx7Y/CdmFsezoL17k7NUoEK3WYRT8LzbXAj/zl0kP+U1qW1Q4E8Md9emANpvaWDEQ9vj6q19YHUPybF1HgdTcRMLxbg5L40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhJ+e8yI; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717693364; x=1749229364;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xlN4woytFnRe5H9ztUHbqTIbRkIu0xHZ7JAKqreTz14=;
  b=HhJ+e8yIbxje9Bl5aj4H+j8dR7bb1kPU4TGGEmYAl5JQAUXVoyx4jUcR
   49VK7ZRXvqTS3kau70ReDvD0RlpyEQf30bN0qjvjEfKUEh4xlZc8EnJ9i
   iCa8WDWWAAsDKAbCgzfvfRnYANmY6sLB3/c3ShvV7uC9AYr0/Vvzui9Ya
   HcrplqoN/RzfgzF1rumNzF7GSXe2DDE9D5cXqhXlSM0Bq4S3ygY42h7iX
   bHxfejtP/yjQTdqGO0coOkO59xmJrRuvkcF3cQDz2RjuraHXlgzVGJU3D
   ZaF979qGojO5ZaJnJaQ/aHV8DHTHz1hM2HNAWH2lxfYKlu4oD7h0YAGbI
   Q==;
X-CSE-ConnectionGUID: rH1NxpjiTIeoC0rQxtJA6w==
X-CSE-MsgGUID: lJdZpCZORm62FTbjD5oj/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14602984"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14602984"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:02:43 -0700
X-CSE-ConnectionGUID: j48CFBFcQoKAiRB+NUru1A==
X-CSE-MsgGUID: onvtz1PSSwe9/nQKW0S8UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42461167"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Jun 2024 10:02:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:02:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:02:42 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jK6sjlPOwZ3QPwuMqe3PPCiVFwbwrbzzCBjv0DXer/m6i0mLxj4PxqSuWWh9ojR1QIXkvgkuuGW1XeB1XjBfinpI2rxvXstPuJxgD2KBKbcxSs1/q6dTHB3wyN9np/+o58QxMoSWf//4soa/BfZsFWm60SxVm6nTY3i1m95KBMbenCV0X4yxjmnNyD5DY3H8LsMG1n32NB3wYG67pjz0jJGW9U2uCljD0ATlqBJscfYf7aUwNp+2uAYRto30DeRe1bbNEjxxeZskmGVyirrVmU8YE5fe5dpRgsA1UV+B9EfgDWf4GqYTuzICKS1GByq7/55EFJNwSxCkaS7zmGOlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cvjGimyqrF34gZh1Lryisu1bwPoTrIDTGK9+nxBPvY=;
 b=k58ybUNtnkGme6OtVDRmSEM2NoqXoGSM80OfqI5/HSIGhHyGONphk9hkYLkAKh9wGdj36483zYwVGrJkqrXRxT/QMnBNmSKNUcsk4KbR+AIcGKXT8o9O+Kh5R50mCNZIr5YEG7a7xkhsh8ppQ8QAUayeQfh84yl7p1B5Uj3he31/KmoUmNIFtuZPTQzlZVWphkcYKcm5myM5kYnECWcUtZwM+xjQo0UHUhuZrj4HpWnM78wMEyASAuVKIxlUb5O1BhZU9szj3tbXGYOPXATckee+WqhjpQCgmpmSC4HKC7mcDGugWfrtwCGxGVMD+5soY2aMavOvz0Et7Fh6O12jxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5186.namprd11.prod.outlook.com (2603:10b6:303:9b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 17:02:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 17:02:40 +0000
Date: Thu, 6 Jun 2024 12:02:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Ilia Levi <illevi@habana.ai>, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
	<linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?4pyXIENJLkhvb2tz?= =?utf-8?Q?=3A?= failure for
 drm/xe/irq: remove xe_irq_shutdown
Message-ID: <efbt3hl22g73r3372agpzowfejrpxzvaiqu2ysscntwa6dtioe@2ao55jz262rs>
References: <20240606124705.822451-1-illevi@habana.ai>
 <171767982099.22567.196132369501507254@a6498e030952>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171767982099.22567.196132369501507254@a6498e030952>
X-ClientProxiedBy: MW2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:907:1::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5186:EE_
X-MS-Office365-Filtering-Correlation-Id: 01de1142-8225-4be6-8594-08dc864a78fa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tQgxGIZAWJRRFFuNLiLxfw9htPRf+aITZo5YjXQrMpNu4uQIeZnFYzzUSwPY?=
 =?us-ascii?Q?3CyF+bGjle0YGre3gqAPL9a/RY17XkjWgPilx1YWmkxeSIttX2TCZ9zS6Gxa?=
 =?us-ascii?Q?qAPCwd/XXJjUR3HiLYHEE1nciSxL6XK46lry58GR+URq5Om6Q2ej6Pp9sRX4?=
 =?us-ascii?Q?pBCI8F3G8UjzdOQHtXslgDEdwXyEKTdjb0ecuIcrEP4ykcPujjtqhoQ/OjPQ?=
 =?us-ascii?Q?kLcZb9/CFgVZ2kZFpgeJobIHyYJjf/6ydP6ww+a77rzlwlb24/+0RfFTisH7?=
 =?us-ascii?Q?5xEu0Lr8QpSxD6+td/RwkBcGEFM+0lcEo9V3tehdmCBeqzA3kEcjF7JDz2tX?=
 =?us-ascii?Q?UatY2UhTgiNgGNpr1xcd+Zu4ck7+FtQ1DuidPz5kTl1d7BAaPQ2FQrLqMmFh?=
 =?us-ascii?Q?BR8+CjY/Lfty8XG4O7GdCMhvjHZ75HvPAaBFShyN8Od+09BIZvruFFpY1W41?=
 =?us-ascii?Q?OUrfDAS3PRurYlKslCxxtWqOMuD4rHmoscW90p8s3sGSJupDEzh6d7kiREr7?=
 =?us-ascii?Q?C7I1TN9BhAiBjiBluO6rUQGQ+9HSOxhobfTcNLG+T0FuVQ2D2q3jDatIrvK4?=
 =?us-ascii?Q?4tcg43jDzrZXaWPZKGj10dvqCiSxeew0l0Ri+g9KxhaSzmPT8sgCI5ha3GiN?=
 =?us-ascii?Q?+pRnL61gTBkxwKkB+09Iq1zS8VZBmPpGB4Xld0ICBf73TIEEN1AcT+MCX0pW?=
 =?us-ascii?Q?PLMbuyYrqdvF8kylAtDIguoT+Mo7gFjYRjxSxMD/2LQ2elGxr7zrJLmFhEvP?=
 =?us-ascii?Q?HbLVKnVwdaS6P6WzUg1UaurxMLIRxiA0vMDR+kb4/jnt/rJcg4PVJ7H+5cih?=
 =?us-ascii?Q?rVLsDQSpLwdYCm2SxdsuRSVBlz3++lSyFis7DG28ByrFymqg5Sga6PZoQd/T?=
 =?us-ascii?Q?fGIQxHFHAILwqlwUiQY7Xv+3LqK3o896S16r69MGT3SZJsqHM0Qzy4gFxHit?=
 =?us-ascii?Q?pvyZIFiby7iIgNnNPwwamuskHTCUlQu3xnQD3y6SMwOdbuPXYspz0kdhn7H1?=
 =?us-ascii?Q?YAHxThouoYWT0snJNp5CPWIFWt4KOWUCitbjn9JAeTbpGWw7JXK/SQ/NSuvy?=
 =?us-ascii?Q?iAHg9xi6qEsIOSXNmrbvQdcNjg46q1hm+309PMNyWgUedolxnnvytr9hWQUz?=
 =?us-ascii?Q?M3o4WNk40J4lcQMYxY4Xsg6kYfm/w4wA+OVUicf8dP1fZm+iStL0XxTVHi9n?=
 =?us-ascii?Q?sNiNKnqm0s0M5Jd5xnOxl+8lps6SyJF1OFhpi9csW2oUASOPPpTXcveZkvED?=
 =?us-ascii?Q?WU3GC4DMRT8vkJjYPl2V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1cV//WOkGnGeL3FQdbIFUMbZzbcL+Gl4DsAOkgNDWVj4oGjf3Y1YqNFGRcY?=
 =?us-ascii?Q?dD7VPbPm3oGZJLWVElQPDfGz+yzPdHsMFeuecLDmvMgb6TCqRldrN2FkP+V6?=
 =?us-ascii?Q?8+/RxYuYdHwng6rcCmNIuE1F6ny0Mfkuf+vuKwoyDRxyr0W/LTtE8uta7ZPz?=
 =?us-ascii?Q?PGyfXCqZjbrIQXxvrQXu7BJwMjM//8axuCScdti6SKgb1iDF8dTJF3ZPngsA?=
 =?us-ascii?Q?x3nFhFHLd/o+3fgqDXPjw3h5ZKXOiv7vD0E+u0kVdEz5wUdSkY1cpife6DGS?=
 =?us-ascii?Q?BaTyQhKCLV8D2y1+h/swIuikxCDOMhk5ZlLETXmVoB7eaNud+yzPlayhjwdg?=
 =?us-ascii?Q?uOLkDq2A15jrpnrCYHdAqtRLAu7tuJwLD0+cwb6FlN94JHnW9bKwnBuS67sn?=
 =?us-ascii?Q?RkInQuFpRmMegS7VqtL7ntRSqENLmoS4X/ZWJvAJeGYyy+ZRz90XkC95PJ2J?=
 =?us-ascii?Q?DooJDCniOd5JYEcEboL4Ne2yz/ttqliF2KpB6iVUd9mTn8dRMPao+fzE0xZJ?=
 =?us-ascii?Q?xAEzPtJGOuBasmBTUpuBBTnc67F09JyAi1CSybOl7dgTT3C1InyJcxfTgIpu?=
 =?us-ascii?Q?GPe7inT788LPY6a8/9n7rfUIPYA71TpBVKBgX2HkGSK4HAlGrs3i4Vb3mE55?=
 =?us-ascii?Q?zXpSh2kGFq7O1DwKt6cA41V0ElCYqrA8YdgsZxO9AOK4YYqrkFbgFW86nj3h?=
 =?us-ascii?Q?jYxkb3WTF+q7ZJAMNQrm57ppZxw061JQRSfBEAo27/C2PvjaX6F5bloHE+jx?=
 =?us-ascii?Q?bNp65vuegWkDiWf0aRvb/imRm++XOyfONrQWSYuad0UIS3wEvz86zSc14xUO?=
 =?us-ascii?Q?DyPPpm464fPawA4xs4yrbo1zL57a5fp0OQHCv1a3qevbcuTc4W21c4F6jxch?=
 =?us-ascii?Q?BWIskXlPs3VmwdgqFnyqE7jmroVOKtz/Mf5D18IUy8BFaGhaFhbprFFAkct5?=
 =?us-ascii?Q?8K6CtJPX5gQkS7I9jIBn6N7ZPXb9gKXx2N2JX4ExW7KW2obE5bQwu+BgLMq8?=
 =?us-ascii?Q?RmWhzG3hlUNRGkx40ZVvzs5i0H2UyUBdXIjdUXor6+CjMzlGy1s0dSZJWxrq?=
 =?us-ascii?Q?VEX3JBixH6jHzBmBes44z+6r68VhWDLHQ0/1Z3hiZfHCbMltIkfBX9X61KFS?=
 =?us-ascii?Q?OMkidz3aVDbkwhEiUSx7cJtTGb9WYI14JXh6lwvlboyyw8dgBe12O+es3YDO?=
 =?us-ascii?Q?N5M3hi+EXJg8C7OM75FXXnu3X6bIINkG1YR9j3ajzqiXthJGKb7/4g9wnVR4?=
 =?us-ascii?Q?SbSj5zW0DkcBH+oeCms3aJPXF+RxHkKGXOp75YXNyd6g46IIKBGomB+Clb4s?=
 =?us-ascii?Q?L1c4ab0HEBw3YmKuULHRgLy5qQ2QjZh8xDi3vuSqxLTZcWq3ObV7jFzvgOTW?=
 =?us-ascii?Q?QSOcJd8x0QW0KA/v/i+ozdv6YeA8BoXOci8w8bPjSg1Q7xtSNIrhhW/1dYqG?=
 =?us-ascii?Q?o/+//oxhenR+TNxbWmXr+WM2GWUMMbPlwHfhSC0XFmfEY+0P7Fx5AO/XuLwM?=
 =?us-ascii?Q?TG1qniZR3+sOtDnyv2whN2K618+WMvbuAaoAg2Cy0TFNCT/xokVSi2mcajpP?=
 =?us-ascii?Q?qu+rC67z+Y4B1JvweCf/o558bHl/LhI9jCURe1LuIR6EpXOOfvhZEOpIdj3Z?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01de1142-8225-4be6-8594-08dc864a78fa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:02:39.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCS6vZXlFVpj4/ufilyYAVVjJkI6tDJa4YMmm74coUJoC0syIR8QDZMYx16h8IF2kWX1eX7+Gy8/PzMctU+cmoUOuou73Cl8jxEGU670vKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5186
X-OriginatorOrg: intel.com

Cc'ing kbuild + lkml and maintainers.

On Thu, Jun 06, 2024 at 01:17:00PM GMT, Patchwork wrote:
>== Series Details ==
>
>Series: drm/xe/irq: remove xe_irq_shutdown
>URL   : https://patchwork.freedesktop.org/series/134565/
>State : failure
>
>== Summary ==
>
>run-parts: executing /workspace/ci/hooks/00-showenv
>+ export
>+ grep -Ei '(^|\W)CI_'
>declare -x CI_KERNEL_BUILD_DIR="/workspace/kernel/build64-default"
>declare -x CI_KERNEL_SRC_DIR="/workspace/kernel"
>declare -x CI_TOOLS_SRC_DIR="/workspace/ci"
>declare -x CI_WORKSPACE_DIR="/workspace"
>run-parts: executing /workspace/ci/hooks/10-build-W1
>+ SRC_DIR=/workspace/kernel
>+ RESTORE_DISPLAY_CONFIG=0
>+ '[' -n /workspace/kernel/build64-default ']'
>+ BUILD_DIR=/workspace/kernel/build64-default
>+ cd /workspace/kernel
>++ nproc
>+ make -j48 O=/workspace/kernel/build64-default modules_prepare
>make[1]: Entering directory '/workspace/kernel/build64-default'
>  GEN     Makefile
>  UPD     include/generated/compile.h
>  UPD     include/config/kernel.release
>mkdir -p /workspace/kernel/build64-default/tools/objtool && make O=/workspace/kernel/build64-default subdir=tools/objtool --no-print-directory -C objtool
>  UPD     include/generated/utsrelease.h
>  HOSTCC  /workspace/kernel/build64-default/tools/objtool/fixdep.o
>  CALL    ../scripts/checksyscalls.sh
>  HOSTLD  /workspace/kernel/build64-default/tools/objtool/fixdep-in.o
>  LINK    /workspace/kernel/build64-default/tools/objtool/fixdep
>  INSTALL libsubcmd_headers
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/exec-cmd.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/help.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/pager.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/parse-options.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/run-command.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/sigchain.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libsubcmd/subcmd-config.o
>  LD      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd-in.o
>  AR      /workspace/kernel/build64-default/tools/objtool/libsubcmd/libsubcmd.a
>  CC      /workspace/kernel/build64-default/tools/objtool/weak.o
>  CC      /workspace/kernel/build64-default/tools/objtool/check.o
>  CC      /workspace/kernel/build64-default/tools/objtool/special.o
>  CC      /workspace/kernel/build64-default/tools/objtool/builtin-check.o
>  CC      /workspace/kernel/build64-default/tools/objtool/elf.o
>  CC      /workspace/kernel/build64-default/tools/objtool/objtool.o
>  CC      /workspace/kernel/build64-default/tools/objtool/orc_gen.o
>  CC      /workspace/kernel/build64-default/tools/objtool/orc_dump.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libstring.o
>  CC      /workspace/kernel/build64-default/tools/objtool/libctype.o
>  CC      /workspace/kernel/build64-default/tools/objtool/str_error_r.o
>  CC      /workspace/kernel/build64-default/tools/objtool/librbtree.o
>  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/special.o
>  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/decode.o
>  CC      /workspace/kernel/build64-default/tools/objtool/arch/x86/orc.o
>  LD      /workspace/kernel/build64-default/tools/objtool/arch/x86/objtool-in.o
>  LD      /workspace/kernel/build64-default/tools/objtool/objtool-in.o
>  LINK    /workspace/kernel/build64-default/tools/objtool/objtool
>make[1]: Leaving directory '/workspace/kernel/build64-default'
>++ nproc
>+ make -j48 O=/workspace/kernel/build64-default M=drivers/gpu/drm/xe W=1
>make[1]: Entering directory '/workspace/kernel/build64-default'
>../scripts/Makefile.build:41: drivers/gpu/drm/xe/Makefile: No such file or directory

This started happening since commit b1992c3772e6 ("kbuild: use $(src)
instead of $(srctree)/$(src) for source directory"). For context: after
building the entire kernel our CI tries to build just the xe module with
additional CFLAGS... in this case by passing W=1.

Trying to build just xe.ko by path doesn't work:

	make O=build64 W=1 drivers/gpu/drm/xe/xe.ko

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
ERROR: modpost: "ttm_bo_vm_dummy_page" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_mode_is_420_also" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_dp_downstream_max_dotclock" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_dp_mst_topology_mgr_set_mst" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_atomic_state_init" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_atomic_set_fb_for_plane" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_dp_remove_payload_part2" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_dp_channel_eq_ok" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_dp_downstream_debug" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "drm_modeset_lock_all_ctx" [drivers/gpu/drm/xe/xe.ko] undefined!
WARNING: modpost: suppressed 507 unresolved symbol warnings because there were too many)
make[3]: *** [../scripts/Makefile.modpost:145: Module.symvers] Error 1
make[2]: *** [/home/lucas/p/linux-dim/src/Makefile:1916: single_modules] Error 2
make[1]: *** [/home/lucas/p/linux-dim/src/Makefile:240: __sub-make] Error 2
make[1]: Leaving directory '/home/lucas/p/linux-dim/src/build64'
make: *** [Makefile:240: __sub-make] Error 2

Alternatives that seem to work:

1) pass the absolute path to M=:

	make O=build64 W=1 M=$PWD/drivers/gpu/drm/xe/

2) just pass the directory:

	make O=build64 W=1 drivers/gpu/drm/xe/
	
I think we avoided (2) due to it not working if we were building commit
by commit and something touched things outside xe. But for this current
use case it seems it's the more correct approach since Makefile says:

	# Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the 
	# directory of external module to build. Setting M= takes precedence.         

Lucas De Marchi

>make[3]: *** No rule to make target 'drivers/gpu/drm/xe/Makefile'.  Stop.
>make[2]: *** [/workspace/kernel/Makefile:1934: drivers/gpu/drm/xe] Error 2
>make[1]: Leaving directory '/workspace/kernel/build64-default'
>make[1]: *** [/workspace/kernel/Makefile:240: __sub-make] Error 2
>make: *** [Makefile:240: __sub-make] Error 2
>run-parts: /workspace/ci/hooks/10-build-W1 exited with return code 2
>
>

