Return-Path: <linux-kbuild+bounces-8625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C8B37A2A
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 08:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6D211B64305
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 06:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63A02E1EF2;
	Wed, 27 Aug 2025 06:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJ+h+xEf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D1328725F;
	Wed, 27 Aug 2025 06:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756274948; cv=fail; b=pHZBOnUlU2jtdY/H+jjClpDcZ84giN/SLmjdHZPgEj5aZXqPh07i7jtXfFmwfTUg65buRfTLOnM+1IO8Nxinzs8CB9LBPRoNOv3QsSjt2sb3+nvtL1fscMOUzlGoAzNid4IkBPXaygul0ISIVeg+qrGKNimUlS9109ggVybm48E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756274948; c=relaxed/simple;
	bh=4jpuok04Autft2sL7oaNLA/GwN5pkIklHgHTMHUOGMI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R+l5oVJQzCHNkpKE0su+EADJmUlvaNd6upoH84XJzek8u9RsmFVUO8eWHUxbgZ0B5HoREpOQPAiUsylTzgBKa2cZaeS2uozSunEu4weDkMq8/0mBE0L33kL3FlJZ6yxTEVvu0yQZXP0ND+yRsEKQCohmlCV1f7tPh+2BT3oODtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJ+h+xEf; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756274947; x=1787810947;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4jpuok04Autft2sL7oaNLA/GwN5pkIklHgHTMHUOGMI=;
  b=ZJ+h+xEf6XZGcu4LlWZk4gz4fkHVq94SlqFyujN8KRjQSOTJadsI4QYy
   npK5C9ORm6cmcVlRomcLr8ouEAmF0Gxjn2NaVaKvXEvZrAfccMu0uYWoF
   M2jWY/NQv6CA+BUrsC61Uw2Rh8KKNvsKOwhiL17vkFRsPfobdZMrE8lkv
   +v39JSjLqx5KyXEDBeJF5H+kHuQ9vyWT7K/FqslfODktX7mrfrikc1cgW
   fUIOOq8hQzmtvCYARM+u0RDAhNmH65Q4DQwzpp1vS0ZVPxHS+Oa/8HCa/
   xiW1veDwz3PQlqdAJWXU7v61q4NkQ3bwTRbdPClGRRHcFc3zPo/ou7/b/
   Q==;
X-CSE-ConnectionGUID: biIhl6b0Tey5NktFPgl6Uw==
X-CSE-MsgGUID: kaaqmkLeRtiacDeG3IAZMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="57724914"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="57724914"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:09:07 -0700
X-CSE-ConnectionGUID: D3iUhNgzQYSP0N31xmhv5w==
X-CSE-MsgGUID: dE9TQyEdSHSZq59mu2qZog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169369128"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 23:09:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 23:09:05 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 26 Aug 2025 23:09:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.72)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 26 Aug 2025 23:09:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJm0ohcOG1soB4TLlEn135MGOrEMqJQuzYItr/pkit+LEdiLKvaA2tf0V4gh45p7dlwMmsA8ZT76WLHqHugyms3Oup7HQxio3HU0SmH1VzUs41VHNnbwyRQc0Yd7pxTijfGk9GjMAnSxQFY/XCNyMvpm9PydhDHaX4EeumkJjoB0TeTdJb7jcJb6GCRIQk3quWBBqnUJta/vuaD0Z7XpBTw4ZWrga9zFOXX++q4NXOntUw9wn+PN94TQWxkrbfPPVsT9rXtFHbVPhUJ5z7TT/+9D933CX836uGLNkOeFGffAux9r9P1pN+2j4V2sQxH9a+2wcKycI/4T0coFyCGQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK3HH92O00VpZRiOdtNfl93guRSUK5PuZfDfcXy2YKI=;
 b=NTRhTw/noMzAHptu4zyKpMksFVzGVMIJ02i0/NNoN9NHbYsFFY/cjYsZ2kuH60DmXIbtyzBNrYEbnES4r9wbe+zu8gYaCwfaJ6FhZVCAfOYazdm6ZgniUYs6GseBRVQHdy1zAyJzqIUm8dThXM7WIYQ/e+Rp1n7GwRyAOQqwfirqxgtec5tNV6ZvYFZCNbKiVTBhbqEqJyooGmMsoPxPNWuMUplYxhwtqB/vQgk9g0xQXtQ+Dbr4yNukrLTpGJdsJJ85c79zu4jlMRC7GMIp+aHvmginegdapKPXLvfjxbjW4AKJfROci7BxekjLvit8oa64E8Vy+uYD/ZHix7Olhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN2PR11MB3934.namprd11.prod.outlook.com (2603:10b6:208:152::20)
 by IA3PR11MB9349.namprd11.prod.outlook.com (2603:10b6:208:571::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 06:09:03 +0000
Received: from MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2]) by MN2PR11MB3934.namprd11.prod.outlook.com
 ([fe80::45fd:d835:38c1:f5c2%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 06:09:03 +0000
Date: Wed, 27 Aug 2025 08:08:30 +0200
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
CC: Dave Hansen <dave.hansen@intel.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mm@kvack.org>, <llvm@lists.linux.dev>,
	<linux-kbuild@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
Message-ID: <gcpw2nrwltvgatdjcu2at6hpse42iudy5dqx7rv5m427dommwg@akooygrdmfvf>
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
 <c68330de-c076-45be-beac-147286f2b628@intel.com>
 <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
 <2e9ee035-9a1d-4a7b-b380-6ea1985eb7be@sifive.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e9ee035-9a1d-4a7b-b380-6ea1985eb7be@sifive.com>
X-ClientProxiedBy: DUZPR01CA0103.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::15) To MN2PR11MB3934.namprd11.prod.outlook.com
 (2603:10b6:208:152::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3934:EE_|IA3PR11MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f6cc0d5-53d0-4a07-d5f3-08dde53038d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/OIBpjR6XkYn0b1X5wB13Iy9hW2CBOpikVO/Oj898U+a0FzdbTUvHJLUAT?=
 =?iso-8859-1?Q?IX0Tc/mRuYef1mEzfxzFy1L/x8rkXewbJujnYJZgrdKMJ7okK/2yK6xCGD?=
 =?iso-8859-1?Q?msizSfRvKvkyTkJScMX9IygogMbo0S+cu9vObvFg3AA39AjQ9brLXAGWZe?=
 =?iso-8859-1?Q?3ciGXXY735NoTUjTAx4jCff5FKgXVAuXkBUKTLLDdfiVzKksRslc6TueRK?=
 =?iso-8859-1?Q?jR7Bo+pJ+2c0WH9R/mDvZgCIUMWkAv979G7suCGJu5p4J9biWIuKuYnWUf?=
 =?iso-8859-1?Q?ecjGdBiiCrehvXwj3DoLpNkImBTZXUpaZA0EPbXLz9ra5NP2Xl8erPRaQm?=
 =?iso-8859-1?Q?oUNM2nX+iOjuc6nrmLSasMwgbjpnjsXWezlobF/rqhAq3uGl+5i930VrqF?=
 =?iso-8859-1?Q?iqf6u9hstUThSkYGNkFqk6pHj5+vhqDJnDL/O8gTxoC8Uzwfsae4KOgIiU?=
 =?iso-8859-1?Q?Lv+FQvbeMN53PhhkptAXsCD6ARnTDzz6Lrx60Xwx4eOGphff8GlYldJ1VQ?=
 =?iso-8859-1?Q?h9gqhJLbNLSUfYq/cqsyjwheuylpvEJmCfmcyAy3aV3Ds9cbnFaEb4Vm2m?=
 =?iso-8859-1?Q?OpTz9X9As9+/A6qi2hGkD5GJp3qukToM5S6nNZgk5HtQbfF8V85PksUamO?=
 =?iso-8859-1?Q?Il4IuQlEuIob583/PspRQBpF/7C+iVflrISKtjiGE3UtAiZywxQiTOxppd?=
 =?iso-8859-1?Q?IdPrU+IcPFu0dvd1YdU+DM/v+7oF+26WaPi3gXZvejV/tDVZxgo8YSlE5R?=
 =?iso-8859-1?Q?0pS5UyLLIeXtoviWXbK4jVRpwFVxt1b1HiItZcUlrZPSxFhWYx3bImVSa9?=
 =?iso-8859-1?Q?zoHGoza7v99cGqzKRCKkIzGvYID+y5+ELcJMr4rp49s46bLFCiWgF/FZRU?=
 =?iso-8859-1?Q?8THT8kdeQX77c8zQBk8OzQUDvdchloJ/RyoXnCRX2iYKr07MVWZUm4f1Zk?=
 =?iso-8859-1?Q?8rnrHhOKGwkcO11GIWkamhM1+H6a2QQXq/Hbqlr7tN+Sk1Y5oMIrFqXGrC?=
 =?iso-8859-1?Q?zTGTW4hgZRGYRZIktyoTgmJx3lMyBvvbMXulvOxSmB1XdNM+b1AiDaPmpM?=
 =?iso-8859-1?Q?ciJHJn2JMRVNYIuRq4+x3TL7/+jXLx+ouUAu0eK8b+7uPtbRIo9h7CltgA?=
 =?iso-8859-1?Q?+K6L5PkxMoMZ+goOKCNtLA/NyZQRyjhj0kZdqvaMrp8vhjrBwJ5JcJMgNL?=
 =?iso-8859-1?Q?ZuHKUsaq0Ue9LmNvFCGM3V9wTnB1ZCqVDB+fL4vjDikRSE6I2+RiieRiLk?=
 =?iso-8859-1?Q?7aEP8Slft+bRReSHbWQ7wnJZQZ3nTQmwesFskrSFFQ9l/6oE3ZcJ9cRjIs?=
 =?iso-8859-1?Q?hrEgUHbhx/RYEq48z1NMG3OJMY2g2MtbaVJOleD453QfVGNzDO4PDm1Lpa?=
 =?iso-8859-1?Q?uJV+ZKFd0dtjkq4rxx3wBLFhgt8cjnvs1XbSzZb1Ito+DejrttPEh1tCDP?=
 =?iso-8859-1?Q?/CTh2GSgVl7HcM4vO4fFOob/BlJe8qni2XcCxGfK1zrViK0lsZjLxFHfLT?=
 =?iso-8859-1?Q?QgqX4A6qcrSGvAHRdoMUUW6PTMJRYpPrK8aS9ahl0lxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3934.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EwmElDDC2dNIkiL20YXAKgLRZcGLtBE5gKfara5+e1RzY+MKq1ZJLnx9/g?=
 =?iso-8859-1?Q?jc8EKtY/gB/cCykFfAv/huBlmrKA1XvqNQ9vahK8/v17Ww3BHpXX3prAjE?=
 =?iso-8859-1?Q?j32gN0NCEsHdpJqCvpO9/gql/sVS4wKUjt8KBo6KzqD7sWegN7/syk7Fzl?=
 =?iso-8859-1?Q?/ZkT5D9IbaUBmXUwIBmq5zqCpiMRWdtLYS7ySGaGTPn12VgM9gHwGNmqDg?=
 =?iso-8859-1?Q?rNQSBhJTVp5cKavv2i1Tk0zdK21wOww2nLBKWa2BnexUpr/xr8qrZPn/08?=
 =?iso-8859-1?Q?cMKP8GfVzF3FEU4Lzpt/Y2lwRM6dGNcS5KsDezx6zFpxpAQKihT6JoYUNJ?=
 =?iso-8859-1?Q?1TtNd5KMW6N3jW4YSwSJvIzEedVK2RD35/VRx7wtgSVAdAM/I8oxupfCIO?=
 =?iso-8859-1?Q?co9DDOzeYAmpjzDVHvTIAQAyGhVjcBTG4J6sILxcdxoCqZ8Sjzhv7aniNJ?=
 =?iso-8859-1?Q?nC7zjeKvZZYyiPaLJ6+zxIGD+vAu5hkaifB6Yr9Vpvtom4jP72Ls0Eaczk?=
 =?iso-8859-1?Q?L8jbxE5/av8qRQD9x701rtohCNbxBOcte1aMcF/pTdQ5zpM8a4vVx5Z9Az?=
 =?iso-8859-1?Q?nPPoKIxVRZ+yWsSqhn8OOsPJt77u9QkJ3ljoNQmTRxQ87xHaoUMGxnojCu?=
 =?iso-8859-1?Q?dX9A5V/rN0YDRUA6kU1SliKG7LVZunmEa3mFYWWjM2gyC0WMIDA/jxbuPH?=
 =?iso-8859-1?Q?wLs2xkJ8B+Wvv9P9BowmXOJ9r7f7R4dAoSFoNpbXmDK4EE27OF6Sd7e7vE?=
 =?iso-8859-1?Q?xdL/tfeIRxhAgIJZUEgIPctsOdy2VXQDTgfDwXkpPFgbURIMvrFswkm5DB?=
 =?iso-8859-1?Q?DbXfcipzEVnizRU3CJNE01NfCch/XC8vVjVcZ6pJ54b1+Z4Z6pBpaCdcS7?=
 =?iso-8859-1?Q?3S/Z3bsEx5kOGVJ9SxPv/4LzOd57MqOXLmhPclnLkPwDOWVfZzL0xByr8+?=
 =?iso-8859-1?Q?g8qJhX3KPnEdVMmNfk3eDHqdgVlLkY96W+3xhOk8BTqrkge6FEyvuQ83wA?=
 =?iso-8859-1?Q?XAw0kfJdsjR/iSuRU4jLr/QfLhlyA+py+1u1uP9UIJ/OGmv5ZN2VIlXAUa?=
 =?iso-8859-1?Q?Dq+9uUelsf/TFjwKzUmbTUgzAdXDyfAv+0IjiVaveilO4O72R8Ftvt95O7?=
 =?iso-8859-1?Q?O63YhSUITcRp00GgbvFjN/moJN8ZtuTb4iaadqFiJUIXMd0cX5oRwpieZO?=
 =?iso-8859-1?Q?hfjEsrk+cRC7AElhjs6A9k6PCzF1rXzA3RmCsh2SpKIuZHCFgqEAKI5QzK?=
 =?iso-8859-1?Q?D9TK2Cq7s84r6WbbMFkyRj3bfYagXOoBhZwuJx65r7iXub6qZytGH7xgRG?=
 =?iso-8859-1?Q?jLwXeWRnGXTJXLbU+QfuCCYofhT6KVIk+GYgTt9dMRPewwvAFtli2cU6FJ?=
 =?iso-8859-1?Q?0bjygSRJsrXh/xJK7n9lJC3si6pteF/LbZgq+QSGDFhHPsbTnJJ9vsiISQ?=
 =?iso-8859-1?Q?kiCWUVVIyGe4CMiv2fCEwPajaMHeD5iyE5bIOiBQZVjo862RQ2ubFwvLR6?=
 =?iso-8859-1?Q?a8g1whgF7NQCdS1czxa5RDq7x8XloIrrI2K/MRUkCTu00KTM19bmpNivOK?=
 =?iso-8859-1?Q?uVXooMSUhXXdYDHVneuiwHWqsscrpaiEprwZlEbsg/h+dBwIf6FlA7IavC?=
 =?iso-8859-1?Q?+NPXprx7agmhsSrVS0xYRGAC9t9QEp72lA25ggsyWjMs2ICxBLeIuBgqcE?=
 =?iso-8859-1?Q?JVl9oJJY7QjqmT/ExpA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f6cc0d5-53d0-4a07-d5f3-08dde53038d9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3934.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 06:09:03.3838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aplAYVEN7LwEi94pirUyRYIzoEGo2AMl3KuwfxLMlCOG0TtUZkbNH1ySigp7qy6WWfPtfXJcOiS+Xjz+kJJP0DDjpu5IijidDpCrD7GGfqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9349
X-OriginatorOrg: intel.com

On 2025-08-26 at 19:46:19 -0500, Samuel Holland wrote:
>Hi Maciej,
>
>On 2025-08-26 3:08 AM, Maciej Wieczor-Retman wrote:
>> On 2025-08-25 at 14:36:35 -0700, Dave Hansen wrote:
>>> On 8/25/25 13:24, Maciej Wieczor-Retman wrote:
>>>> +/*
>>>> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
>>>> + */
>>>> +#ifdef CONFIG_KASAN_SW_TAGS
>>>> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>>> +{
>>>> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
>>>> +}
>>>> +#else
>>>>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>>>  {
>>>>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>>>>  }
>>>> +#endif
>>>
>>> This is the kind of thing that's bound to break. Could we distill it
>>> down to something simpler, perhaps?
>>>
>>> In the end, the canonical enforcement mask is the thing that's changing.
>>> So perhaps it should be all common code except for the mask definition:
>>>
>>> #ifdef CONFIG_KASAN_SW_TAGS
>>> #define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits-1))
>>> #else
>>> #define CANONICAL_MASK(vaddr_bits) GENMASK_UL(63, vaddr_bits)
>>> #endif
>>>
>>> (modulo off-by-one bugs ;)
>>>
>>> Then the canonical check itself becomes something like:
>>>
>>> 	unsigned long cmask = CANONICAL_MASK(vaddr_bits);
>>> 	return (vaddr & mask) == mask;
>>>
>>> That, to me, is the most straightforward way to do it.
>> 
>> Thanks, I'll try something like this. I will also have to investigate what
>> Samuel brought up that KVM possibly wants to pass user addresses to this
>> function as well.
>> 
>>>
>>> I don't see it addressed in the cover letter, but what happens when a
>>> CONFIG_KASAN_SW_TAGS=y kernel is booted on non-LAM hardware?
>> 
>> That's a good point, I need to add it to the cover letter. On non-LAM hardware
>> the kernel just doesn't boot. Disabling KASAN in runtime on unsupported hardware
>> isn't that difficult in outline mode, but I'm not sure it can work in inline
>> mode (where checks into shadow memory are just pasted into code by the
>> compiler).
>
>On RISC-V at least, I was able to run inline mode with missing hardware support.
>The shadow memory is still allocated, so the inline tag checks do not fault. And
>with a patch to make kasan_enabled() return false[1], all pointers remain
>canonical (they match the MatchAllTag), so the inline tag checks all succeed.
>
>[1]:
>https://lore.kernel.org/linux-riscv/20241022015913.3524425-3-samuel.holland@sifive.com/

Thanks, that should work :)

I'll test it and apply to the series.

>
>Regards,
>Samuel
>
>> Since for now there is no compiler support for the inline mode anyway, I'll try to
>> disable KASAN on non-LAM hardware in runtime.
>> 
>

-- 
Kind regards
Maciej Wieczór-Retman

