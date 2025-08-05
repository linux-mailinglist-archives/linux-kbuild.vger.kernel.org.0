Return-Path: <linux-kbuild+bounces-8295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40455B1B6E5
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 16:52:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AAE74E0488
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 14:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A0E278E5A;
	Tue,  5 Aug 2025 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMXFMxbo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BD22264A0;
	Tue,  5 Aug 2025 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754405531; cv=fail; b=dHb216wvvMMhH7l51PY1LKpxmHoO5KFaM0Ea+rtAqbDPbwGGL0n0/xhx9qzOywBbw1CDobiWNGjZ6NgrCilwgh1GnpxziXN4jbd0a3fQt+dozM5LKG5NLte+vYU7JfM4FEDZbQUQdmPO2kUl39kk2kE65oTxtHWYWS2k8Z13uEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754405531; c=relaxed/simple;
	bh=OMfr07qkDcSqrVozxuHWKC+fNXktz4982b1ucsk9LCo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mVvG0PsnfyFr6aUAmldNrKE6pVTiGphGsnIqdN+ykuV9OQmOH8kdjzN/DmaYCR1inJMTtHL+grEmc3+SBp2Fd5tAE65OVk9/MZF3b5AaaH/eLhX5i4OkP7amYB5viQmJKveIPhLppGFFGxA5zgSkg41KNfEjuFzIw+3NYs4Jrc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZMXFMxbo; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754405530; x=1785941530;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OMfr07qkDcSqrVozxuHWKC+fNXktz4982b1ucsk9LCo=;
  b=ZMXFMxboztPdIqilg6wInDy3fkSWLSmPva4dTH2njkVULWGDWUO0XY/X
   8oijw01z0EZsAkD2+TMuPq85ikj54ZvgumXZBEb0bIJJu6yCHNi35okjO
   RcHjP7zztxIwoDVWe6U6oG6Xk+uR6jWiZG2gL3DpLSCX2FYO24T149u82
   avwY+yWPPsclRbC0ASMDg3xRZjTmVwlFuL/q6OMoeZ5Y/mUDIvR7h0II2
   aZKbXZa1oPH1ZMBLA8em9pTT4uae+Mei5tYVCbdjrkNSJFeNkY0jy5zU7
   RJzpql3IuAuRMbfBk81AxoikhJru4FiTbpymq++G8u3U8gNLTICIAFe77
   w==;
X-CSE-ConnectionGUID: pTx9hVHZSQqzmt6dnYfg+g==
X-CSE-MsgGUID: fHOLkeSRRye18+wLSNQylA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56780944"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56780944"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 07:52:10 -0700
X-CSE-ConnectionGUID: 1h6U0yA/SxWjjTfytx3DSg==
X-CSE-MsgGUID: lOiQG8LgS4y6tNXRKAT+wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="163760625"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 07:52:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:52:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 07:52:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.83) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 07:52:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjjWmvksYCBQqCN4JTtdTLMsnjQyOXp79AY+6Hzqic9pfop9HgIcR8pVEHatbKuNXszlvNr5YDNYjPXvS15IgUU/3SjLPOid0+VCBLMZAGykBkbKjaGSCiuWGXnBiy4cJ+IvI1RzuRyMyrH3WnJgBucAMFzcMZji5K5ewJwU961YO/YwByig+B3D+9vNjysqWfgXOrvZFJmTyMv1Uro8VZX4nlZxEw42ZaaL8MkqWknUce/FWLA45OFfGLE8yXEJuXzo4By+ZOOwMCqHlgS8PDQK+57PZ2UwzlI3CXDxqTkEdFGecHThk97rV6vJ665W22EFmKk6bVURPEE1m+q1Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDBKAv1Qbx58JYw/EXoO6ClBuEtR3I9GstKAynqjPxM=;
 b=wwDdzWMZ/rItr1d5eQoDaRhk0F9Ql7oPBmIWg5Ps7KOs01MNV9M3HaDaqPIJswq3fyKM7Tpnvby448w4ebd5tYR1SCQsbgHTNyUdp7BnZ8Q2wICXAbywxm0epJHhUNpzz+FIVC2rK6Ex7nYp5/W7Bp+o6w/3lYzzfw6zXOKg7t9dlvgVyB+s2e0mqcfnZTss21jDuhDJ3fVcJdR35WqUnwETVsXeB6UYgexgWGUnp+8o5bMiNtYHEa/ZHs+e4lMoz6TMsgm9PeJBgxTUZP4XJ/guUkFSuP05nZ32Wim/aKy4KRVksBRqp4P4SmyE0YLYscNEaa9Pe8pQu2gT3HhhAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA1PR11MB6219.namprd11.prod.outlook.com (2603:10b6:208:3e9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 14:51:24 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 14:51:24 +0000
Message-ID: <e4d801e3-3004-484b-897d-ed43c25e1576@intel.com>
Date: Tue, 5 Aug 2025 16:50:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
To: Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier
	<nicolas.schier@linux.dev>, <linux-kbuild@vger.kernel.org>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-hardening@vger.kernel.org>
References: <20250802184328.it.438-kees@kernel.org>
 <20250803173235.GA716998@ax162>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <20250803173235.GA716998@ax162>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::27) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|IA1PR11MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ed42b6-19f8-4f24-e444-08ddd42f8c9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkNyUkg1c25pdHJNUlVWUEoveHVCNTRsK3RpMTRaZm05MVRuY1RibUwyUUlo?=
 =?utf-8?B?Qm1DVi9mN3djOWkvS2hJM1l4QTZ6RkpWSUVMTnZUZDV4K3hXM3QxTTVjL2px?=
 =?utf-8?B?Y0xscmF4QkhvWUw1SW4xeWZoNDErZkxPaGN2dC92LzE4VkdXbWlQaHk0YW9l?=
 =?utf-8?B?NCtaUmdHZ1g2SHRRZm95NnpaWjc0K2JsMHhLQk02dHlDTTRiakU4RXNDeHZv?=
 =?utf-8?B?b0xRZlBkWkJIRUZMdmpqMTI4NlZyNEdXUkFKanpPT3ZxVEhJc1VFSEFXWWh5?=
 =?utf-8?B?cHd0aWc5VUFNY0FEUHVZcmF6NmhaSFp5MUtWd3pTb3NUWEVXVnpHWElMUUxG?=
 =?utf-8?B?V0NtWjl0djBBNklJbGs2Q251YWM4WStTeGF0dHdjRFhBa2Y2c094MjQrYWVY?=
 =?utf-8?B?dmlVcEdLVjlZOTRlR0lSTzZxME5UVUIzVFN5djR1ODhDVzNuYkhZeDh2dHBS?=
 =?utf-8?B?MEE1cVVRc2E3cVJDdkhUNWljelh0bmREcmhNdXE5Mll5TFU2b1VWby9WMUsy?=
 =?utf-8?B?VmtHMUtBSXd6WHYvOW1DQlpRKzZzRTcvaUp6azhiOXRnYkdHeWwxODBsN0pQ?=
 =?utf-8?B?eXg4ZFJsbWFFWUFNbHNGUG5YVjZGb1YyZ3FMM1J6aHd2U0tjN3dtL0owRHNU?=
 =?utf-8?B?aWJzTTllSUFjdXhEazY1QVhjYVI4MVE2d3lsclE4MG5SMVZ2T2tkNFlxRk5j?=
 =?utf-8?B?NEgybTZvQWJMOGpzTWxKSE9Xc1RCUTR1Uy85aXl6QUs4d3YzUmNnZW5UVFRp?=
 =?utf-8?B?eDlvWFY0cW51aUlLZk9DemlQYTNBNDhXZnZISlZEbEtZQTJrRkNuQVVJN2tT?=
 =?utf-8?B?elhQL2VDaE1HZDVSbnArOExxRGNEVEJBa0p1Z21mdUhQWHZiLzhreHhheFdM?=
 =?utf-8?B?eFZYZW51c2RJcUxicm1JQjQ4T2VSK3hMT0VQNzIreEZZYS9CTjkxeHhvYXQr?=
 =?utf-8?B?Y2c1UUNBSXp4VjBES0R1VTl1d2p5WktEM3pucUpmYnZCRE90RzNGdlJERnZP?=
 =?utf-8?B?STAzT1hvc2Zhd2Q3NEZuYzhNSnEwNFQrQUIvRGFiejRiZ1c1UFU0aXJxaDNU?=
 =?utf-8?B?QmhTOW1ETm52MlZOdlBnU0lXNkFDSzFuV3lXOU9EREVoUDRmdEwvQytreTFH?=
 =?utf-8?B?TUNNcFh0ZVZFQ0lYbmgwbTd2RUFjYUlrVndBckxkUFpySE1yeVVYemhTN3hX?=
 =?utf-8?B?ZEtrcHVRNC8xSEE5MnZRWmpTZCtQcjlxVzJENEcyQlIzLzlwOWY2ZHp5anhz?=
 =?utf-8?B?ZXRCTjE1TEVRSmRXakhIK054YVZxblJlUGdMS2NOSTY5MUN4QjNKb1BOT1JG?=
 =?utf-8?B?NkFQQUZybDVLbzljMUcvdWpWYzZBRHg0NGdtTHZwZzVibGh3TEJINEJMYWs3?=
 =?utf-8?B?TmRraUhmZkJoc3g3Z0xKNW8zRTQvRjFZOFhYMGlrb2ZTeCtwQmhhQ1hIRGV2?=
 =?utf-8?B?aTZyeFg1dDVpMEthc1c4NEFvMTNLVTFtTnZZdlZIb1B2VmYwSlB4UEpqTlN4?=
 =?utf-8?B?RmdpdklCUml0clRNMnA2cXBTazZmTEVYWms3VWh0RXRYUEN0RHl1RGpLMGRr?=
 =?utf-8?B?ek1sNzZNYzVmMm8xa2dSaGRaU0VkTXB1WC9vUjdPUlN5U3dvSFZzMmJOVTVF?=
 =?utf-8?B?T1BlR28zV2l6aitzSWRpRlNFYWxFRVhMWFVRekRwWmxJWGFSb1RUVjg4MnFt?=
 =?utf-8?B?eVBKVGdLNjhIK0JpSzNYQlV6V3VYeUpGM0ZMQTV2amwwMm1UblhkQUhYbzRL?=
 =?utf-8?B?Q2hmQXlrRnZjd1hpVm5CY2ZLcThBdS9JV1Q1L2FqdWg3Z01lb2pxZHRSNGpx?=
 =?utf-8?B?bmtDanBqMzQ0dXJWdUMrS1U4UFNYOTJSdkhIelRlOVllTENWRXc2ZWRLUWNX?=
 =?utf-8?B?czdFMTBRZE9mVyszNG1mNVkxMHVaSkczb2RVeE9pVEhQbVNRUEtEamd2ZjNX?=
 =?utf-8?Q?3xYtivpjUw4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDlDdGNnQitXSEkxT1lSMVZOc0dWMnZ6SGNVS3NFKzlEUzMzOXNleWxtYzFG?=
 =?utf-8?B?SHhnYTA3SVJSbzBqZ0FNUmpiQ0JJUHp0UlpxbC9ZejloWWV3TFZpWVZxUER3?=
 =?utf-8?B?VmZHNXRPYnFweFFNR3NMN09SUXJJM0pCUTA3NjMzRXM3eVczOEdyclRCR1FJ?=
 =?utf-8?B?Z1hFOUR3Z2p0RU5XWHB0ZXBFSmtEaXRRSlN0ZGJtS0VJSGlNdCtlRGlCUFNK?=
 =?utf-8?B?UjFuNktOMWV0Vm9aRmdySW5yRGQvMHI1N1ZTNzJITHVRUnZVNHZvUktiWmFK?=
 =?utf-8?B?c3czenIvbmtsTE9BMVF5WE5jSkhqU1NzSlMzc21FMzAvZ3o0THdXaFZ0bHBC?=
 =?utf-8?B?ZlVJNnlBaTVLd0hxZ1lqSmFVTmRIMis3RjJDZDg4S2Q0U0xRNzlYd3Z3TzVw?=
 =?utf-8?B?RHU2WmUzRzBCRGZZRURRaVRUVGdweVZWbHNvSGl0eXlOdi9KSjBGcFpybFB1?=
 =?utf-8?B?aTRPT0kxbDNpWGlMeERtUStoY2R4M3VFaUtxdUZ4SFlNTDZEUXZpcnNPSi9a?=
 =?utf-8?B?Y1FncXhtelhvNWMyTkQ3cndOOTduT1E2ZzFpZUpjQ1lsdk8vUVdHTHBvWjBj?=
 =?utf-8?B?djdxM1NxcDczNkhocGFyTjdGdEp2RDIzNGNoRVoyNW1sc1hmSHBTaEcrcVlE?=
 =?utf-8?B?OHlUcTYxakxGMElSZkNGZklsbXJBYlYxMHdITHl5M1c3NFpEYUtnUkRDbFR1?=
 =?utf-8?B?S2NkVi9jTWlVcmcrWmVyRzduNjYrUVRjT0dZZmRNQit2TWhaRlhCMy9NUlor?=
 =?utf-8?B?OXRrVG4wdkQ2T3psekpPNW5JZCtyU055djhTMUpQUTNZR0E5WjMrOXR4Ym9t?=
 =?utf-8?B?ZXNwanpxTVl0TE5nRzhOVU9oMnhreTJaaVdEOFUreUcxNm1UeElOYmtWTnht?=
 =?utf-8?B?dHVlM3NvSUh0bFhCcEJjMUJUWG9td3lINGpHKzRQUEJmVnJLMUlPZXd4Ykd3?=
 =?utf-8?B?a29rSi9LeXY0c2d6aFJ0K3JWaFZkQWtxN0N5UDJkV1pQK1VGcUVmcThDNjFm?=
 =?utf-8?B?cC9YRnVZUys0b0Fob3huN0tVU3I2d09Hd1Z2Smdnb256azFiNEZqSFlvWUNR?=
 =?utf-8?B?b3BqNTJISUEzaFRoM3JqWFZoSWZzcTVnd0krRXVnbUlvWklOSlV0bzMxdWJD?=
 =?utf-8?B?WTI1MytCdFJWd1ZMajQvVmVMR213NlVBTWUyZkdRLzZGUEpGZjVrWHJPSW9N?=
 =?utf-8?B?cmRwaHFaNk5LZ1IxVUlwZmdyNXJRMmltVXNpbUh5b3EzOEFYczgzSzdqaDc5?=
 =?utf-8?B?UUhpRytrZjBVY0MwYUFDTkRjTmpTNHZNdFNnSWt5cnBZZGFpSE1Vcm04cTlo?=
 =?utf-8?B?Nzk1eVdxU1JwU3lVODZCTEljMHM3ajVyZFN3aWhWcjY1ZEdRLzlsd3B3aTdO?=
 =?utf-8?B?c1ZMWmZ5RGhpS1Z0UlgrRmQvbVhrbi9NNVhFQWtWWkU1dDNiLzJqdWl0dlFS?=
 =?utf-8?B?d2Jrb1kwbUVlbUhmWFBzNnRWSmxVNm5MZk1EM0VlS1BKTzY1UjJjL3RjRkxo?=
 =?utf-8?B?RmJyeWJGS2grT0dXNXV4VlphTlAvZlJTa2VSZlNJamRtUFVuYTlLSlNOM0xV?=
 =?utf-8?B?VktnSkNwQ29Yem53elUzRi8vMElLZkNmRHJkd0hnNENqbHhDQWJlY0k3eXlp?=
 =?utf-8?B?bDZ4Rjg3VnhveFdpSUI2S2NUZnRwY052WDFSd2J2ajhqYTRTTWQxM3VVcmNH?=
 =?utf-8?B?NjZObHNaalp4UjU2Skw1d204amtydVV5eWhCb0Jnc0dYU0tBWm5FVkRTQ3BX?=
 =?utf-8?B?QWF6UTJHd2x5SEtBTFBONEpQOEI1TzBRS3hpUmoxMlFVNkpLcUxqS1pJZWpT?=
 =?utf-8?B?dFNkYzl6MngzUlRlVFFtbDdTWHo3MzNqcU5Kc2ducWFrRjdiSjRmODVXaWVD?=
 =?utf-8?B?YXpjNGh1LzA4RUtHVzJIZWZaYjB1bDJWd2lvemd6WDNoU1p0bU9CcHBqQk5V?=
 =?utf-8?B?ODcybHRwRDBEUWY4VWJoVWNhSFA0Z2NKdEFycC9ENFBhblR0OFFtTFAwUS9v?=
 =?utf-8?B?R1Z5c0VuOXRWRWJ5U0MraVNpNDdTMEtxamMwU28yYUFBU1NGSEg0d2JXc1pF?=
 =?utf-8?B?SzlKU2FPNzJodVVRdHFTdzM5empuMjEzSmh4MHVxK3d6bHJEbHNtRlZDK29M?=
 =?utf-8?B?b2JGeklCSTNaeVg2Nk92d2FZY3dpai9ucEt3bG1xVlBPM24weUFqYWdkZXlK?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ed42b6-19f8-4f24-e444-08ddd42f8c9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:51:24.7336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20ghpUhWQQZnB9Ve9+FzWFZmEAGXWlbAv1BetQBsve9S0zIcd6O8EGtrRlInLaIoaisPhj8u2PzodKKporjKv68wzDCoZNEgXniozZLqwGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6219
X-OriginatorOrg: intel.com

From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 3 Aug 2025 10:32:35 -0700

> On Sat, Aug 02, 2025 at 11:43:32AM -0700, Kees Cook wrote:
>> With the few remaining fixes now landed, we can re-enable the option
>> -Wunterminated-string-initialization (via -Wextra). Both GCC and Clang
>> have the required multi-dimensional nonstring attribute support.

[...]

> diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
> index 55a1a96cd834..05d4323c6a13 100644
> --- a/drivers/net/ethernet/ti/netcp_ethss.c
> +++ b/drivers/net/ethernet/ti/netcp_ethss.c
> @@ -771,7 +771,7 @@ static struct netcp_module xgbe_module;
>  
>  /* Statistic management */
>  struct netcp_ethtool_stat {
> -	char desc[ETH_GSTRING_LEN];
> +	char desc[ETH_GSTRING_LEN] __nonstring;


Hmmm, ETH_GSTRING_LEN is the maximum length of the driver's statistics
name to be reported to Ethtool and this *includes* \0 at the end.
If this compilation flag triggers a warning here, the driver devs need
to fix their code. There should always be \0 at the end, `desc` is a
"proper" C 0-terminated string.

>  	int type;
>  	u32 size;
>  	int offset;

Thanks,
Olek

