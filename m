Return-Path: <linux-kbuild+bounces-2905-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8993C94B847
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 09:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C2C92825CA
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 07:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C49188CB6;
	Thu,  8 Aug 2024 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alvfCmVw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30378F7D;
	Thu,  8 Aug 2024 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723103629; cv=fail; b=dLk1Q8G+R6nVcViw1avMErU4fM9w//ic1Z8IFY04r+aC9tJUZQwXq2rInP5mJlCpdZV5I/7kP8HA56DJ4BAky8RFoKhULviN1W9Q4NzYN/2uCF0E6xAbKVviUx5P3PPTq44c1VVqV8OF5TXcDWpJKwpT8RjRrckN724WgLg/BCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723103629; c=relaxed/simple;
	bh=gWIjrBxdiscOhM9khjqm9jsvqAvfj04Mc3PbfyvwLeQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OrsB742BiGf3Ti5kXkXXXjf5RCwa5B+qHUdn6OaA23cidKptsjuUJn6edW77gzzdCjXBXADFa1uRmTnNbnCJQ1pbRquTJipGl4x8bjmCBUpQMcUQEaaS9SU9FwP0MjlZLfbAeoscGEXlQ6dPx1qXqTec+lJv2kEhhaCxoM1j6mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alvfCmVw; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723103628; x=1754639628;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=gWIjrBxdiscOhM9khjqm9jsvqAvfj04Mc3PbfyvwLeQ=;
  b=alvfCmVweNt5SQoYT5DlF7Sg9w0zpEnU3WelppcEfd4OiO0LdYS+lNO1
   /OGFMODGF7nrk9zvvY6pXSqLdXcylIWyeAgk2jm2XPJ+jije/BNtA3SFM
   qMM5SrQtXJsgF+qpVxsZHQo+/gv4baF+F4iv2ap90Hy8geM3fV+6vG5ad
   owo/bUpGbSCHXJ/IjDkp8V6PeElrPW+op83zBjFSuGxu0/mTBm4vi/qCd
   rQ9DVmY5dbwVfecGI6xhs4FHQz3XRhCDPf7uZWp1ClhC8o96ygVQ28txr
   oqIkUAC/y3VQMm0qIkBVv4ovz1ZidB/vLhnrfOqBwHwkqzwXZMCaPPzP9
   Q==;
X-CSE-ConnectionGUID: y1FP+B2cTbCIwgV4xqLmSw==
X-CSE-MsgGUID: UU8sHE+1SgyM5QBOVgXOYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24122682"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="24122682"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 00:53:41 -0700
X-CSE-ConnectionGUID: TARhcKwSS1uX4Kd5U+ZhBg==
X-CSE-MsgGUID: ndtsE+L7SrukSpVolfM3NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="61781705"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Aug 2024 00:53:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 00:53:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 00:53:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 00:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFfUXKhG7UImi8jheMPd/GqW/LCyaHGlJiLHhgXzLrOFmyCWDAjTyogGDwsSMFCa2Cg2m1hLYduZ73tT5/9S8UYyVuF+iAOqCPcnxjyZiIfJCB6bO89AN8chmtdWAQNH8qRjn54cOFdN1+seUdwgNZtmYgLqPgbC6jw9tobQjlyLVmLKLZcfqmvfOz70HOlqT+yqDiQpOWinIFzNpD2vfIIfHqXIZTE95L7DPS9+7VtL9BOAFMBUzUZEhXLPwCi+8T71PjZyWblJ8z1ulXkDsoOagvCprspKEXV4TdUpe7/nkVXcuD95B09DM1v5UDSGgHeF5bUD7CR7SUck2egxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnsDwr+ndtpQ2VyxaQpL0Mkw4Ir5Tjm1psmSLSYelSY=;
 b=St7v2S8ZyJMKdPIEArCDZ19XfKZpMTBK+V5Z/pbQtjM8D9miYt2VN/uDAsDdFYbnFFbcwsQPfNL0mT0wUEXkokIuriu9N3IEOfuxgosdvV8fScyJdQrg4D0GgncT1cLcKDoIP5L/6piagk8iJjQyE8YkEu/hK4TUcNGs5ieWBnlayrscMezQ49CbXXh51XUQRZo+zC5uTJMA8+JizPFkdpSfWpsHy1U8OWhKCsanRXrlFxnERllD9wGvq7hjIoldgtl+z69KPIpBO5FnpDLRGpwoEDpuGySGl22LGTuml+0tBhYgJHOQ5js2dURQuqF1Fgse1+h2lACMKTfIhN2eSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 8 Aug
 2024 07:53:32 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 07:53:32 +0000
Date: Thu, 8 Aug 2024 15:53:23 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<linux-kbuild@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: [linus:master] [kconfig] f79dc03fe6: segfault_at_ip_sp_error
Message-ID: <ZrR5c1p1fPffFeB2@xsang-OptiPlex-9020>
References: <202408061634.fe6be94-oliver.sang@intel.com>
 <CAK7LNARnytQTW5vE+u+ez1pHuSVS34cQ0+xK+MLyfLp05GjoaA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARnytQTW5vE+u+ez1pHuSVS34cQ0+xK+MLyfLp05GjoaA@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: bc17a3c2-b2e2-4458-9d2d-08dcb77f32f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlExWE0xTXhhWWJRUUM3MG9nZmExRDRseVphQTZ4ZVNtWE0rcmw0S2EwM2Ri?=
 =?utf-8?B?bDdkZnZrY2xnMDRFR0JyU0lMOGhGajNVNGtkMEZETWRSTlpEQkFxQyt2bXA2?=
 =?utf-8?B?aHJ0d0Z2a0FuUGc4V0NjZFdyazc5SnZwNXRncm02TEcrV1ltN1dXOWN6dURm?=
 =?utf-8?B?T29vaUprTHp5N1NDa1o3cG1XUTdVQ2xHSjczQmIwaGtzcU9tTEtFZFFtaWZt?=
 =?utf-8?B?L3ovbVFvRGZoWE5EeGl1Q0lHVVU2QU9vL01La3hNajNybGRyVzlBdW85OTlm?=
 =?utf-8?B?K3hqMnhYOHI4VTRXR2czU1NRRlg4RUhpMy9NTERkM3cvRGRkRHA1NnMwM1Zw?=
 =?utf-8?B?a1I2eElnU2R1YzZJU3liQVBlYXVYWUFzUlJQWGpuSzhsQk5NK2tKZHRBN1N5?=
 =?utf-8?B?WUZ5NmJiSXlTYUd6Q3h6YmdJU3ZpRzhad1M5WEdMQ2twNGNla0N2M1phY1ow?=
 =?utf-8?B?RTdhZ3hFQ3lPYUlJRk1SUmNRL21JOWNqRVp1Y1ZScUJKYnU3VzZmcVlFR3R5?=
 =?utf-8?B?Rmp1UWYvTjN1akRzbitvcUhJM3VtN081N0lXaTcyRmREbHFYeDA4SnZORXNW?=
 =?utf-8?B?UEpoeVppVUxEcVg3OEFWR3NZSUFWeWFJUzdwNUUrcjZmVk94alNXQmVYN3lL?=
 =?utf-8?B?VnhuN0t1aUpGeTVIMjZYU0hhM1pwS3JrOUlpL0RMU0MrbXBOK2JYK2tGbXlz?=
 =?utf-8?B?VW55Q3Rid3RLdWM4QkJlVk1Yc0gzVVdHWTVBcWc5TjlSWmRCRmxmRlFjcDhj?=
 =?utf-8?B?bkp2eVJmSlAwdjNiSDYwR2x3R2l0bGowNXA1MzM1K1lMbzhaMXpQbEtzME4x?=
 =?utf-8?B?REFtU1pXWThleFZGYTZnd1Nzdk9YUEFMTU5HalVKbzIzOTgvSk1Dc3R0ME5R?=
 =?utf-8?B?Qyt3bWVmZXI4bm9PbGloS2tDcnM2UFJRLzBHeUg0cmlVb0RURzJmNjY2SkFv?=
 =?utf-8?B?OVNURVFpcXprbGhsWllORTlKWTJPeGVXNlVNdnRGRXNBM29nQ2FNcUZrTmJR?=
 =?utf-8?B?UStaQWZWbEFJcVFiaHY3Z2doaVkrRGlGcjN1bnNKdGM1RThjbFdEdkdsdmRD?=
 =?utf-8?B?ZlNCUjBlMVFwL2pBZ2I3UmR3N2NnaXVmbERGN0UvdmNaU3NCaE9IYmUwMXpu?=
 =?utf-8?B?Y0dWVUlPYnlJOXF5WDA2ZWNTNmVGWEdrRDQrV0VPVlBCMzMyRDJ6UVl1OFdV?=
 =?utf-8?B?T0FSdm1PcDA5UTEyaWRsM3djZTA4bk5KelRhVzlBWHZTbHZuUEMxWWJHbGJl?=
 =?utf-8?B?cDI2K3JWSk94RStTMk9hdzgxQUhPWEVFY3Bzd0pFVkp0LzZaajlrY0N2VnNJ?=
 =?utf-8?B?U0VCN1EwSnFjbTBuTDNTaFlOUUtCcjNQMVRWTVBGRVAwckwzK2xDQ05WR0FB?=
 =?utf-8?B?bU5RZ3VDaER3RkVlTDRhQUVVSUZWYTQ2SmZsWExZR29vR3JQdTV6MWM1R2xQ?=
 =?utf-8?B?aUthZmdzUnN1T2xOUDJNZmV4RmorNGRrTGdKaGxjcllGcFFMN2lSRURsc0pN?=
 =?utf-8?B?WFRWMGRqbVZtYlRCUWFENXJxNGloL0xEMXBVUHovQzlqcnVFQi9NOXo2cEho?=
 =?utf-8?B?N1dGY1pLUkZtUk5jR2xlTzZiaDRzamFhQXVzdS9GVFlVVHFvSjZZLzE0dnY3?=
 =?utf-8?B?US85djY4RkcyQTByRUZvZUJLYWpQdkUwenRhOUpsTXJnMEpBUW8zb1F4WTVY?=
 =?utf-8?B?NmM2Q3A2RlRxWVZUNkRkZ2I4bnpnajVHem9MR1ZubUJHb3cxU2RiMEJQUFNG?=
 =?utf-8?Q?bWXxBE8hDrZ815qBFzVbxFbg0rKhrZ/Uq8Mq4w7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWZwcFZUeEd0Uk9jOERUMk9xVEZ5N25ZamJrNitlMitQbDJuTHNiN1dYeHdq?=
 =?utf-8?B?MG51NWFoNUx6T3ZvMGxFbDhXc1U1NXJJZURsblllVURqUWh2RVNCRW5pbFhQ?=
 =?utf-8?B?V0hRS2NXNmZxL2lsQzJ0Ym8vSUhCdTZzTVpGSFF3VFJpRGZocm94M2p0MDFm?=
 =?utf-8?B?VEdSZ3B3L3E0RW1PVW9Xb1pQL1JHWWkwSUljejFFMUNwaHBwUXBSbis1RWNW?=
 =?utf-8?B?ckt6SVVkKzhHcVBCcllJWkR0TjRUSENLMlJYWno0ME1LazNqWjhUWFlEcFpx?=
 =?utf-8?B?cS8xOU05dDA3YmU2UElQZXVraTRHK1lEM1BtSzJ1T21LMm9lcDYvbkpRSkt0?=
 =?utf-8?B?SThySXV3cHBYUVJIT3hZYVkzWWw1V1crZHczdGdWQkxyQ09YUWFzYTh3MURJ?=
 =?utf-8?B?TWJ2UkJjTE9qUWpya2VIT0ljSlc0ZFNobEYrbFJ2aG9KYmUrcjZMODhKSlBh?=
 =?utf-8?B?SlZjaVFYN1VKdW4vR1pYa2JEOXBtSWM4b3hLYzdzemZHRkhkRnR1cEdwSFRk?=
 =?utf-8?B?anR0U2V6QWFEZmIwSXpvbTRWVURMOUozNHJUK1dRQU1QZjFwVitLTk5BbmIv?=
 =?utf-8?B?TWlXVk1VNTZraW1DZFh6ZFBZcExHOWthVmQyRjZHVWxvbVVNcUJ2SFpSaVM3?=
 =?utf-8?B?aGk5djFmd2kyRG05dkF1N3BjNE5PcHRRRXIwRGJUVEJQRjlMQXVnUXRjYmRj?=
 =?utf-8?B?dVpHZE0yYzN1MzNUMVl6VHVBS2Z5Y25HODNNRzc2MlFBNzFkeitLNVJRY3Ex?=
 =?utf-8?B?dXpSSmRUT0c3bmlabVVTZXBKK0tydHFSR0grZXlXYmRzSkNmM3dKNlJBUysr?=
 =?utf-8?B?ZTA2M3FCdHdHOHB5YUVWRmUzQWhCWEpLNTdHb1QxWGhZbWtHLzR6NlUwdDlq?=
 =?utf-8?B?aFJGOU8vY1RtWTFybUNYdjF3SHQyUHN2VzJGNGZuUkFOZHF2bUZxQ3JtVThH?=
 =?utf-8?B?ZUxxVC8rWUZueWZ5WS8zRDVFNkIrVWs5Z3FWTEJoZlJMU0lLR1JkaGxMb1dR?=
 =?utf-8?B?Mk1NVllIbExqVEFpT0M3Nm9BNnhWdUNCSlErUHU5YitiU2JOZEorTnFQS1k3?=
 =?utf-8?B?SW5nTUhhcHlUemFjbHYvVlFPRUE3T0tOd2RIZWx6RGtpQXZZdmFZQndDazA2?=
 =?utf-8?B?YnRRNzNiUHpZN2dKcXN3TmVDSTBzeUQydldqWng4a1VDdUx5K1l1aUw4d3Vj?=
 =?utf-8?B?Wkw1emZ5bnhvWktTS0dpVjIvNEdiRW8wUjdRWjBEZTBqSFdmSVZ5Nnl2ZThB?=
 =?utf-8?B?aDFjbFFrZzJPd0JzRmw4bk03MFpLWTFmS0RyZjZIQkVtc0l3WFp0TmVGdWQ3?=
 =?utf-8?B?aE5kUzBSdHFmRkdYdlorS0FOSlByTVl2alhZbmdZZnFlMVdhZGs1bFdBbXlo?=
 =?utf-8?B?ZC9DV21tZy9VN0dPSVpwRHp3L2dTWWFINVM3TXFCaGJDUXQwcmVBNlFmYy9y?=
 =?utf-8?B?MlN5RWM1U3pWeXZyY2MzQndyNEJGSjBUckFzM2lJelVocW56bEg1TWZTbmpo?=
 =?utf-8?B?NU1Yakh0cjBXYmt2RjF3TWhidktENG8rQ2FRWnF4T2kxR2NDWE95YnR3L2lm?=
 =?utf-8?B?TFVHUDh3WURXKzUySms3T25MS3FRVVMvSmx1SjlHRXhxNkdhSkNUcDJMcjRu?=
 =?utf-8?B?SkVReFk4N1YwZzFNcmxQT0pkZ1N1K2tFa1BaMUlIWlpUT1gvMnJFM29WSW9k?=
 =?utf-8?B?cUFJV29USmtuUjdIZ2pvY3dUeXFvTFVyVnkraEN3bWl3Rm8ySXl1K3hNR0dB?=
 =?utf-8?B?TmVPN1N6MXpJdXR2N1JoSDNFS1Z3cFFOU1B2U1NXN3k5QkI5NE9RNHR1Q0k2?=
 =?utf-8?B?MGwwZDJyajdVSm9XOGJzUjU2SEJieDVRUHliZURkKzUvSU9EMEpZNm8vTlcw?=
 =?utf-8?B?NzJsUlFEeDA0Sloxd0ROY1BlQ1YwRHFSMStoK1crODBDSmRqZG9sNFpwdEtz?=
 =?utf-8?B?T3BWUTFxdnlYQTdlUUkwVzZyRkVwVCt0dHpyd25qd28zTDhxanZ0WFpxcHZU?=
 =?utf-8?B?YnQvRnZBb2xmeG45end0cnZkcG1Bb0E4bzFYN21aeG1FeE1xNzZEdlRuOE8w?=
 =?utf-8?B?aEM2cEZpenhDMGg5b1RYa00xMjZhcUFFdFRlc2ljdDdFNVNmSlBGdmpVOWcv?=
 =?utf-8?B?aVVGWjFqTGhLdkRYZkkzcmlSdGpvVDdVVHlPc3dzd3YzUG5NVUExeSs4WUlQ?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc17a3c2-b2e2-4458-9d2d-08dcb77f32f0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 07:53:32.4694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Npc3Eecyn7CMJ5FgUzD+7kYVJqfoR79vBdLC7AaIKzS9jcx6FuxMs2XIJtc/hflygcmF2txokOmfd4t38jdqow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
X-OriginatorOrg: intel.com

hi, Masahiro Yamada,

On Tue, Aug 06, 2024 at 05:57:47PM +0900, Masahiro Yamada wrote:
> On Tue, Aug 6, 2024 at 5:21 PM kernel test robot <oliver.sang@intel.com> wrote:
> >
> >
> > hi, Masahiro Yamada,
> >
> > the config for this test is a random config, by this commit, the config has
> > below diff with parent:
> >
> > --- /pkg/linux/i386-randconfig-r032-20230623/gcc-12/ee29e6204c32dce013ac6d1078d98dce5607ce86/.config    2024-08-05 12:56:30.744686432 +0800
> > +++ /pkg/linux/i386-randconfig-r032-20230623/gcc-12/f79dc03fe68c79d388908182e68d702f7f1786bc/.config    2024-08-05 12:56:37.620536644 +0800
> > @@ -770,14 +770,14 @@ CONFIG_MODULE_UNLOAD=y
> >  CONFIG_MODULE_SIG=y
> >  # CONFIG_MODULE_SIG_FORCE is not set
> >  CONFIG_MODULE_SIG_ALL=y
> > -CONFIG_MODULE_SIG_SHA1=y
> > +# CONFIG_MODULE_SIG_SHA1 is not set
> >  # CONFIG_MODULE_SIG_SHA256 is not set
> >  # CONFIG_MODULE_SIG_SHA384 is not set
> >  # CONFIG_MODULE_SIG_SHA512 is not set
> > -# CONFIG_MODULE_SIG_SHA3_256 is not set
> > +CONFIG_MODULE_SIG_SHA3_256=y
> >  # CONFIG_MODULE_SIG_SHA3_384 is not set
> >  # CONFIG_MODULE_SIG_SHA3_512 is not set
> > -CONFIG_MODULE_SIG_HASH="sha1"
> > +CONFIG_MODULE_SIG_HASH="sha3-256"
> >  CONFIG_MODULE_COMPRESS_NONE=y
> >  # CONFIG_MODULE_COMPRESS_GZIP is not set
> >  # CONFIG_MODULE_COMPRESS_XZ is not set
> > @@ -6201,7 +6201,6 @@ CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA=y
> >  #
> >  CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
> >  CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
> > -# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> >  CONFIG_SYSTEM_TRUSTED_KEYRING=y
> >  CONFIG_SYSTEM_TRUSTED_KEYS=""
> >  CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
> >
> >
> > we are not sure if these are expected?
> 
> 
> This is expected.
> 
> f79dc03fe68c79d388908182e68d702f7f1786bc changed the way how choice is
> calculated.
> So, the randconfig from the same seed can result in a different .config file.
> 
> 
> 
> > we are not sure either if the issue in below report is caused by this config
> > diff. just report what we observed in our tests FYI.
> 
> 
> I believe it is a different issue.
> 
> It is just a problem with the combination of depmod
> and CONFIG_MODULE_SIG_SHA3_256=y, isn't it?

we are not sure. we just use randconfig to run rcutorture tests.

> 
> 
> What is your depmod (kmod) version?

our kmod version is 28

> 
> The crash of kmod<=28 with CONFIG_MODULE_SIG_SHA3_384=y is a known issue:
> 
> https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk/
> 
> 
> 
> >
> >
> > Hello,
> >
> > kernel test robot noticed "segfault_at_ip_sp_error" on:
> >
> > commit: f79dc03fe68c79d388908182e68d702f7f1786bc ("kconfig: refactor choice value calculation")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > [test failed on linus/master      de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed]
> > [test failed on linux-next/master d6dbc9f56c3a70e915625b6f1887882c23dc5c91]
> >
> > in testcase: rcutorture
> > version:
> > with following parameters:
> >
> >         runtime: 300s
> >         test: default
> >         torture_type: srcud
> >
> >
> >
> > compiler: gcc-12
> > test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> > +-------------------------+------------+------------+
> > |                         | ee29e6204c | f79dc03fe6 |
> > +-------------------------+------------+------------+
> > | segfault_at_ip_sp_error | 0          | 30         |
> > +-------------------------+------------+------------+
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202408061634.fe6be94-oliver.sang@intel.com
> >
> >
> > [  OK  ] Started OpenBSD Secure Shell server.
> > LKP: ttyS0: 263: Kernel tests: Boot OK!
> > LKP: ttyS0: 263: HOSTNAME vm-snb-i386, MAC 52:54:00:12:34:56, kernel 6.10.0-rc7-00022-gf79dc03fe68c 1
> > [   12.271477][   T23] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input3
> > LKP: ttyS0: 263:  /lkp/lkp/src/bin/run-lkp /lkp/jobs/scheduled/vm-meta-59/rcutorture-300s-default-srcud-debian-11.1-i386-20220923.cgz-i386-randconfig-r032-20230623-f79dc03fe68c-20240805-47158-x4nrel-3.yaml
> > [   15.209351][  T483] depmod[483]: segfault at 0 ip b7abe4f6 sp bfb00aa4 error 4 in libc-2.31.so[8c4f6,b7a4b000+155000] likely on CPU 0 (core 0, socket 0)
> > [ 15.210249][ T483] Code: 5b 5e 29 f8 5f c3 66 90 66 90 66 90 66 90 66 90 66 90 66 90 56 57 8b 7c 24 0c 31 c0 89 f9 83 e1 3f 66 0f ef c0 83 f9 30 77 17 <f3> 0f 6f 0f 66 0f 74 c1 66 0f d7 d0 85 d2 75 73 89 f8 83 e0 f0 eb
> > All code
> > ========
> >    0:   5b                      pop    %rbx
> >    1:   5e                      pop    %rsi
> >    2:   29 f8                   sub    %edi,%eax
> >    4:   5f                      pop    %rdi
> >    5:   c3                      retq
> >    6:   66 90                   xchg   %ax,%ax
> >    8:   66 90                   xchg   %ax,%ax
> >    a:   66 90                   xchg   %ax,%ax
> >    c:   66 90                   xchg   %ax,%ax
> >    e:   66 90                   xchg   %ax,%ax
> >   10:   66 90                   xchg   %ax,%ax
> >   12:   66 90                   xchg   %ax,%ax
> >   14:   56                      push   %rsi
> >   15:   57                      push   %rdi
> >   16:   8b 7c 24 0c             mov    0xc(%rsp),%edi
> >   1a:   31 c0                   xor    %eax,%eax
> >   1c:   89 f9                   mov    %edi,%ecx
> >   1e:   83 e1 3f                and    $0x3f,%ecx
> >   21:   66 0f ef c0             pxor   %xmm0,%xmm0
> >   25:   83 f9 30                cmp    $0x30,%ecx
> >   28:   77 17                   ja     0x41
> >   2a:*  f3 0f 6f 0f             movdqu (%rdi),%xmm1             <-- trapping instruction
> >   2e:   66 0f 74 c1             pcmpeqb %xmm1,%xmm0
> >   32:   66 0f d7 d0             pmovmskb %xmm0,%edx
> >   36:   85 d2                   test   %edx,%edx
> >   38:   75 73                   jne    0xad
> >   3a:   89 f8                   mov    %edi,%eax
> >   3c:   83 e0 f0                and    $0xfffffff0,%eax
> >   3f:   eb                      .byte 0xeb
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0:   f3 0f 6f 0f             movdqu (%rdi),%xmm1
> >    4:   66 0f 74 c1             pcmpeqb %xmm1,%xmm0
> >    8:   66 0f d7 d0             pmovmskb %xmm0,%edx
> >    c:   85 d2                   test   %edx,%edx
> >    e:   75 73                   jne    0x83
> >   10:   89 f8                   mov    %edi,%eax
> >   12:   83 e0 f0                and    $0xfffffff0,%eax
> >   15:   eb                      .byte 0xeb
> > [   15.251290][  T487] torture module --- srcud:  disable_onoff_at_boot=0 ftrace_dump_at_shutdown=0 verbose_sleep_frequency=0 verbose_sleep_duration=1 random_shuffle=0
> > [   15.255881][  T487] srcud-torture:--- Start of test: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0
> > [   15.258765][  T487] srcud:  Start-test grace-period state: g0 f0x0
> > [   15.259257][  T487] rcu_torture_write_types: Testing expedited GPs.
> > [   15.259713][  T487] rcu_torture_write_types: Testing asynchronous GPs.
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20240806/202408061634.fe6be94-oliver.sang@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

