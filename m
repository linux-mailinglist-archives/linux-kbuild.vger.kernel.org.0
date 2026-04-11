Return-Path: <linux-kbuild+bounces-12764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id o9fLKvZX2mkm0ggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12764-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 16:17:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A8C3E047B
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 16:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56BFA300CBF3
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2026 14:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6CF3845C4;
	Sat, 11 Apr 2026 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U78tNUKT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F5A37D107;
	Sat, 11 Apr 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775917043; cv=fail; b=XWPhgaBTR+p8T/YdLyTI25z06BlKz5kPFy+L8krVmqA+ymhwFu0dqw0YCD1kzCYzm2E914jGsOxtNmvz3jqjdwKKN9oNEV6I/DJXX3jMkIHEtJUnAp7kAgkOyXahdpl+mBF9btG6qoRt7TqRoTSu7fz4JECS0DjgC8pgvNko8ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775917043; c=relaxed/simple;
	bh=/HYKisi0To3TOVl32B6xK2xB1o2yI0Ik3iHk+5TlHFI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hQDpTnssWqk9dFvjVIH/0z5LfbCOHTBjrrnAm+7rqeEC0BccKFhb6IBopmXsB9ZuHd4gtnZAQEoNW6eEmrr0HxUDbP7Stlh2OM6SZzpF/iaUiPocBcwiemwW7tWpGo/WfSgRr5oY3PgJ9p1deovH2siMA2LSWBpYt6ceNYE22/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U78tNUKT; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775917042; x=1807453042;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=/HYKisi0To3TOVl32B6xK2xB1o2yI0Ik3iHk+5TlHFI=;
  b=U78tNUKTeoix4RiAO0iITtwUULrBr8ymWrVogamp9ypTaQtoPeQdciVv
   8xgL45X8nxO70uyT7iL/pPk3mfO3DFluI0g5gzAhN49Dft57qwmmXqT92
   3cQXQs5Q9bLRpeBkUUI/oy2eHdeS/mdrCHly6HuP1bjsJnNb85E9nbM36
   Vz36l2Zes10X5nZjmajpTEPgWtlMb+IUyoRbvfaY7aVm1FxevdwWHXZzl
   WBCNJbnKLra9U2TkWBBXZSgq3BifpPUUH8JivupILmUMiTIVECJpdrn+Z
   4b9D88E1F/HVfZWRTk4UoNsliSc0xWkXYJjRhNPAS/FnVS9U7hNSshBoH
   Q==;
X-CSE-ConnectionGUID: ewAzLkR9RtOyvPEoZBoCFQ==
X-CSE-MsgGUID: P5W3uUd1SJO+6k8dORu7ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87994704"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="87994704"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 07:17:22 -0700
X-CSE-ConnectionGUID: fP0kaJfQRo2SgJdysY9nQg==
X-CSE-MsgGUID: re9+1Ev3QBW7BjxN++2yoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="234340626"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 07:17:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:17:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 11 Apr 2026 07:17:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.33)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 11 Apr 2026 07:17:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUk9WtzvRU3gAnDfNoVI30N5Pso7lCzkdRLRL9cK8gODNtdXSfAwe/VJGeKOrkIPBPnyZr7VMcukSz7Dte0VtaOIP4gv4bdPv2FWyf4zocl4PVlqwskaisLoJ0Av3g54htFS+7ACJ9xPTImgficjhy48Egg/sPiy5ugioD92+cU6A6bBVzQAVfh3eHxC69pUi2RW/2ahoNsXpUSUnD2Dabr5g81P8UHJm2euL+BHw/PVPFqH1EFWVElzgKYhfF+zAuKFG6rves9gAJzxA9zb1hwLggRkUGt4biSXYkG5VQ3cmL3D+ijyr5MghstzdXeHjfWfSnqZg9+AmSN0SOUsxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j20hjZabvCg2B0isUJ7M+GyUvVBkMpYKz0hoaVcT6NY=;
 b=Vra80xxOE3CdvS3AwxQf349N6856HCuvCV57rBWHGh9Mj4vvNxH0MJEOCYj5yaxqX5J6PMDHfUpxlIzYoVBRe3I8v+on4JNEkyn/j+rHxNGK+OrzbO7MRhEU6MR1M7c73Wh097jssBZ/+lEa5b5jrR5NUWqtIDSi2M1TCGS0NuYTUML1ao1CjTcHaA6S2oBXJN++wNQOTRmLHuo6Sv8Qud7Kj6gcalSypYG49nD6Q/qMdFG8gFNyqTQ8eFvfjBOtHVNkKg2s+al2b2vnQ+3S4Bvb0gaaG28/9rotsCuHp9UaglYnQnHyfATn0cSKxOgT3gYTotcEL725VQeFi6eyog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SN7PR11MB7637.namprd11.prod.outlook.com (2603:10b6:806:340::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Sat, 11 Apr
 2026 14:17:17 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.044; Sat, 11 Apr 2026
 14:17:17 +0000
Date: Sat, 11 Apr 2026 22:17:05 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Khorenko <khorenko@virtuozzo.com>, Peter Oberparleiter
	<oberpar@linux.ibm.com>, Mikhail Zaslonko <zaslonko@linux.ibm.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Arnd Bergmann
	<arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, Konstantin Khorenko
	<khorenko@virtuozzo.com>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>, Jakub Kicinski
	<kuba@kernel.org>
Subject: Re: [PATCH] gcov: use atomic counter updates to fix concurrent
 access crashes
Message-ID: <adpX4W4rEQm4OUlu@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260402141831.1437357-2-khorenko@virtuozzo.com>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SN7PR11MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: cedda10c-e38f-4da5-e061-08de97d50926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: SzsaI9b4+XewBEOo2VMY8LXWw8UhRUhhDLSncC2K4Cg/EuurNk+vgTXHyEXms2TzzRl8pmv4dD4VKA4vsViT+tJ5X4a1u3aWmv4HZKhWUEi5Bp++3WDqZnfTdtlfe1hHmHs0uF0SC/ISdND5cCA4xBREwaSUher9i6eULzDKfCP8h111wtGGAnP13wtUdbeA1dB2HWkXeVe4nwtZZo5hTrZF2iqSkByoJ6o5I1/KWL8qsR/eRbcxIPs6zAJ4bWaxs5ckOWh8FMyv+qY+iHBlYOxz7AV6Dy4lGWA1kvm3rDeBLXIso1CdCfJDsPPWKLXDBTrwHh+oVvt0ZahsClZMAvwB5AJ0i371b2TO+CK5+qsIZT88TOtYZSzUXzPBvYCcjbqo5dwl3XmWpeJtTAO27d8gNcXcPu2gDODCh2YOOVwpVoQJPbGQ0TNggiyqT2Q5P3A9qemjBU+zdhj4bC3qfttXawiJcZ9mxs8PhaTKF8PLYxkS0IskV2/Qa/gAeH9UK4N5aqZraodTUCKTksyNBa22NvSJUiVQG+P1aD0s9/U56egk1/1punxgajg2Tfg15m6eD86XUBdRGnf+T2Svv3X84/mC43ZIFvvEjMHh6fdHjj4zyvw/q6WuvN5l0vbrv3ykBAhLszs6fonT8deDBB/pJb/BjjuHcHoDYBgYZzR8s7dEc7x712g7UGcVpd6aHZYAFoO5ND6cf/R+Ae5Peg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4t+qKU5ZkjO0XcuDl0DrfFg2mmM1aptSKeutyz+Lj58FZRyG5OQT5IzKYmR?=
 =?us-ascii?Q?/M6kdepThTjffmZs9Qdf7Gs91qlQuFXAAgZDtwrfdrUt6EmzA7OEysM3Ci9P?=
 =?us-ascii?Q?gZ4gO2KlvAgds2BKVo9UcyfwuvyhLgOcBQYwUx/Ka0AXvJ04UUt8a6K8vy9j?=
 =?us-ascii?Q?YTWdGFfDjMT9zcZtY9KDfdHFwMGlmmBHbshVeFvUWZ4sN9KRF9bt1lcC2ExI?=
 =?us-ascii?Q?fewtj4+DbbhRH/7SbxhMyq0vcHI/KGJLT5zICmSSYitnObyxBp99OMGpPIj1?=
 =?us-ascii?Q?qD+IfahkuZYCa4T7NMZ8bF/7RFHpEOcNMhNZQmwfL+wWWLY97UuQi/Exr6/4?=
 =?us-ascii?Q?LAERC0x6x2n8l5cIAcjLXwi/Mew9CDng2BIqA+hwnLUh9wx0wZSaJkd1Bugb?=
 =?us-ascii?Q?/y1Z0zdKptyyp3X5h6yXv0r3pPXrZcYwJ9PyZWraAx8iV8vKzDUDLpqvGyuO?=
 =?us-ascii?Q?mj51cOqp1PwfzRX0JZhWjzA5r8QlPqig39NutjkWHT3cSGv0LHfJwCf+O3zV?=
 =?us-ascii?Q?WGvL4Ivv9dsextf9+k/uiI59MYg8pJJ8fobEujHYMLnwKfMeclkx4vGFIfz/?=
 =?us-ascii?Q?mQQZv16tpUkQkqajdo0zPvxAP6Ob0IRF+o+qR2CRkKTGglydtlmjU/Ariyi/?=
 =?us-ascii?Q?ROc0XQHYrCEx3o7GmXXSuFq/Yb83E+hUaXiBAGeFbSfeHKUaOjIC4BxgtPlL?=
 =?us-ascii?Q?84w2Zg2xIIptLPaxsi/ROXnS+3H57CM5IGdhC3WjBMRRFmiBhQG+CfLYQKqu?=
 =?us-ascii?Q?ChGiDUXJA96R8Wp6wIuytatOPWE3xLHCiu67Qia00+D6ZwNXvCunygCqOvkr?=
 =?us-ascii?Q?QOY7f8eo8JvKhKqcPCmEWX4f/dtUSPvJF6UGIRkLEWoPZq3oP4YBB5eHI4sS?=
 =?us-ascii?Q?qN98orZGgKFAiYVncgEe5H9m8jB5vajIdF0UYlsah58IVr5SS83NbEXmPqGI?=
 =?us-ascii?Q?LfPLOOSmpDGd2rXfhnyycJmYVkkZjW9enRgTIkZZh1vNc7zfa0e1cn6CxTwT?=
 =?us-ascii?Q?sGl3MXJYzQJbF5M9dzQVJQGq8y8amX04maSi2catLnrIeeyQhEoP338xjKWV?=
 =?us-ascii?Q?EG+dHij+/heJrO3eAqh41LSEn8djTD7SCqzU+y391v0UqEpfe3TmYd8FqH0e?=
 =?us-ascii?Q?HzQpC9BK9H7ej5ta/9A4bYyFtpBONw7x7yzG27BL+JRwKleXzQVeRH2eKqVq?=
 =?us-ascii?Q?WBqxmxh/o9sxhybwI6JvDgH0ZwQf6NFxyE8WC2Z39mUyyAZ61PmYWLo8JTPC?=
 =?us-ascii?Q?CCqjLnMF/FjhU9NLZh3Wrl2otxhwTE+4edwy5xmLyevQiFBaLFwonDAvqi7M?=
 =?us-ascii?Q?KS8f+UXS9j45vl77VbA/Tt/iSRDKG0DUDSF9L92uH2reBxOt/jA0ickN3xwr?=
 =?us-ascii?Q?8kUB06aO10XPM0nxqYay/vS9Ezr4dWBazkplMMXs0WmVubLWHHbKElJ7yMrm?=
 =?us-ascii?Q?PZLC8iQhHp7TKhSXfQ6NLTub9bSWqUSO1lVqfQcqZbgCYqaQH3UEsmXxbXG9?=
 =?us-ascii?Q?VC0jQGX/I7qJMSyoRV1nGNH9pMff0C0qB3pwgZb2VFNN8hZM8iCkcb2RGT2K?=
 =?us-ascii?Q?NQD7pC9jfQIBukcfFElX7zg/dkN4Oj5hjzAoiecT9U1fSsAtVwvVBYSATL/W?=
 =?us-ascii?Q?RF8gSZRY0sITqKqUVcDQ+iyi3I4KBvo+j15dF6ghnKvlWRF8BybzuWPlRxPH?=
 =?us-ascii?Q?jZ7RThfQM85gnkpW0aP/VL1bsUo6ZUYR3wa0e3wwkOjssvtkdllFj5kEn+60?=
 =?us-ascii?Q?QaFaNmPwRg=3D=3D?=
X-Exchange-RoutingPolicyChecked: uYqkKIJvfJGIzw/PgBwE76uJQlhbCxS4B36uEGj+8Vk8zvxiYFbd+P8nKbncQUvtdEpJ3FFTHMvZwEhTkFa+f4uIsXQutbRIpIAk7loVvHhjt+q4NkT38cn62HNWnzBcVMxaWP+8cL3fKnp/WiG0PKPbKYBgaeWV69PmfqTXZLYaXbsWLDigXS7Ea7OW+8xd1TlKOjo4Od8wyglQ7G14TGWJfIQpLfgfmhEUhhrLQLVtcet1Y0qFOGwMGn6OIgRed1K7bSURVzWxEds/yghZvnjsBHTKaKdtC1jsNCRAf1/ADMyasudox2mAsTIUQN5gStCJsn6/jRFFeb73x5H7Zg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cedda10c-e38f-4da5-e061-08de97d50926
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 14:17:17.3256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KoYdRAm3Y05GfuYVxEnhrfsBJ8E8nr6W7kNbN9EMaw44tdWA3Uf5xhzTQOLlxtUe3y1uKnd4FXYCOOAf4Wv5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7637
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12764-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,git-scm.com:url,intel.com:dkim,intel.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D4A8C3E047B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Konstantin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Khorenko/gcov-use-atomic-counter-updates-to-fix-concurrent-access-crashes/20260411-133428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260402141831.1437357-2-khorenko%40virtuozzo.com
patch subject: [PATCH] gcov: use atomic counter updates to fix concurrent access crashes
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604111946.Erd3tguU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111946.Erd3tguU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111946.Erd3tguU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:3224:1: warning: target does not support atomic profile update, single mode is selected
    3224 | __initcall(io_uring_init);
         | ^~~~~~~~~~
--
>> io_uring/opdef.c:890:1: warning: target does not support atomic profile update, single mode is selected
     890 | }
         | ^
--
>> io_uring/kbuf.c:740:1: warning: target does not support atomic profile update, single mode is selected
     740 | }
         | ^
--
>> io_uring/rsrc.c:1555:1: warning: target does not support atomic profile update, single mode is selected
    1555 | }
         | ^
--
>> io_uring/notif.c:141:1: warning: target does not support atomic profile update, single mode is selected
     141 | }
         | ^
--
>> io_uring/tctx.c:388:1: warning: target does not support atomic profile update, single mode is selected
     388 | }
         | ^
--
>> io_uring/filetable.c:158:1: warning: target does not support atomic profile update, single mode is selected
     158 | }
         | ^
--
>> io_uring/rw.c:1397:1: warning: target does not support atomic profile update, single mode is selected
    1397 | }
         | ^
--
>> io_uring/poll.c:963:1: warning: target does not support atomic profile update, single mode is selected
     963 | }
         | ^
--
>> io_uring/tw.c:355:1: warning: target does not support atomic profile update, single mode is selected
     355 | }
         | ^
--
>> io_uring/wait.c:308:1: warning: target does not support atomic profile update, single mode is selected
     308 | }
         | ^
..


vim +3224 io_uring/io_uring.c

76d3ccecfa186a io_uring/io_uring.c Matteo Rizzo 2023-08-21  3221  
2b188cc1bb857a fs/io_uring.c       Jens Axboe   2019-01-07  3222  	return 0;
2b188cc1bb857a fs/io_uring.c       Jens Axboe   2019-01-07  3223  };
2b188cc1bb857a fs/io_uring.c       Jens Axboe   2019-01-07 @3224  __initcall(io_uring_init);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


