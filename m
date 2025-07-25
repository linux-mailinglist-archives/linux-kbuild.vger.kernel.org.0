Return-Path: <linux-kbuild+bounces-8185-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B1B122B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 19:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 247AE4E8424
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 17:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BE87080D;
	Fri, 25 Jul 2025 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNeNSc7E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858432EF2AF;
	Fri, 25 Jul 2025 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753463226; cv=fail; b=OAdewyF5g4NWiy8zJcyEhwsPIo1wtKrtU8IBGV2H5dqN+CzBE+VQHmpKu6NUIEIJ8ipQSlB4/+GiASdjE+Ev/TSBxY69AZ+OzlcPPzbq/mqCH4vSwoAVoEZbKSf+Rj1IfrQZjhE8qX0LMxOgVlC89mTyqYzvFnPkOQPCyzKUKVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753463226; c=relaxed/simple;
	bh=5FxnfOP1j8lU7u0nAaaVgOQcHiN85XxFxaAkTlEEAGI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sPVKeUVri8SjaO9B4PhiwKE7vWuqyEwegZ9/C4OKI+SDM62S11jBKKxHKaKC4mrK+pU+d3s7oszzCwdaHGZwX+YrOS+YO2N3NfEbPTYwB3j3c5NVrUCVju70cFjxe8zP7tyay7lHT9OpA2EWIgHV13n4GaVcZOeH4VCB6K3enZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNeNSc7E; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753463224; x=1784999224;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=5FxnfOP1j8lU7u0nAaaVgOQcHiN85XxFxaAkTlEEAGI=;
  b=gNeNSc7EmUXSEnYKgsY8ky6+WWyP+991QohL4eG9ELnvTKdYHngWFeUq
   0BjpY6DkdSx7T0C48GyF/ptjsfHs3qk5DwY+PZNV8b/4qe16Hn+6MZgxt
   6YViRapDXp9KiNSPL+PBKRSzp1WQnUsVsDIdYpbu2X40kNsvrVT7RYYLq
   NAHTZNDFEN4m++k+QV/oAr7Gs204unSbemcDWKKd1P7/EYOyg4mcneW5D
   3oJfD/7qdDPVF2HLvpZ0cZPKycZoJOB3+p7eF3zJR/Sd8d49vh0DJuA/8
   e2SWsVl+EDv+h6L8VgmDqTkDNllqLakVyYBWB/KJqmYur6IiAIOoJLP7m
   g==;
X-CSE-ConnectionGUID: 09bzVZhKQwyhALxJniad9Q==
X-CSE-MsgGUID: nIjYge5xTNimjdS8d9AvxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="58423429"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="58423429"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 10:07:02 -0700
X-CSE-ConnectionGUID: g5Nh0hP0Q/Cbjh010iUtZQ==
X-CSE-MsgGUID: XWYbb1Y7TKqR5e8z1Y/O+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160208281"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 10:07:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 10:07:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 10:07:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 10:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBuW+mym152rNfzjAOFFso0NAFLNVZJooWxuTdOQhuKgF8zi87e76wwAOmUQKtvH+VrW8Nqa+x8q1rs7MYGKjAD6Mf04jPP3R/kyDJsOQTt280osL4HXXikChpj1VClRdsxKfAwsy2Fobxjo30nDNZdpf0aq66+1itsz1fWuC4vqcsLXksOdI/M7VEQqnuIn+3Zak2HioROozrthbNl5xLRN+Bz+rATYCFUcpOysNmLBXeYWsaszt7sD/ZQUBD10svghAoqY/kLMyN+lJnqft+/SaQpYPUvyNq+8zSJf05/Hat+xWYRmL36F+t2K4lN/cN8K+olnmw6M6mzbdo3+0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FxnfOP1j8lU7u0nAaaVgOQcHiN85XxFxaAkTlEEAGI=;
 b=RuUmmR1D8vNaa5LL/gsp0Qs+dptoZswg0BwyjotKRwGOR6lWIGhgkIxjEdG0ytQKLCLWKp95UHXiRxXhS3BkxrTJAwvVbIEiMuT4iFjLJjM/xVYFr8hjl9I614XiHmsBEddgqHuAsNmi00jLNaI3VHRO3e+FGcRGVU1q4UjlcvyPgvpYaV4DZpCJFLpUYsKYqzAUdmSU93ufFcXDMx7B1Af3Q+Romq+fMGCUalmqFu0BWCyfaxdAKNwu3pnahAUL2V+4V2gVRcBuNu8ADX8hUt8T12hEt3QuQR+d6zbloLG5L9Dix4HxqrMaJXrRaOgC5HeZTQ2oiYJhjsAVcPaOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by BL4PR11MB8846.namprd11.prod.outlook.com (2603:10b6:208:5aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Fri, 25 Jul
 2025 17:06:17 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 17:06:17 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>, "rppt@kernel.org"
	<rppt@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>,
	"justinstitt@google.com" <justinstitt@google.com>,
	"nick.desaulniers+lkml@gmail.com" <nick.desaulniers+lkml@gmail.com>,
	"david@redhat.com" <david@redhat.com>, "debug@rivosinc.com"
	<debug@rivosinc.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "morbo@google.com"
	<morbo@google.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>,
	"nicolas.schier@linux.dev" <nicolas.schier@linux.dev>, "surenb@google.com"
	<surenb@google.com>, "monk.chiang@sifive.com" <monk.chiang@sifive.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "kito.cheng@sifive.com"
	<kito.cheng@sifive.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mhocko@suse.com" <mhocko@suse.com>, "alex@ghiti.fr" <alex@ghiti.fr>
CC: "andrew@sifive.com" <andrew@sifive.com>, "samitolvanen@google.com"
	<samitolvanen@google.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "bjorn@rivosinc.com" <bjorn@rivosinc.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"heinrich.schuchardt@canonical.com" <heinrich.schuchardt@canonical.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "ved@rivosinc.com" <ved@rivosinc.com>,
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>,
	"charlie@rivosinc.com" <charlie@rivosinc.com>, "jeffreyalaw@gmail.com"
	<jeffreyalaw@gmail.com>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>, "apatel@ventanamicro.com"
	<apatel@ventanamicro.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Thread-Topic: [PATCH 10/11] scs: generic scs code updated to leverage hw
 assisted shadow stack
Thread-Index: AQHb/PPxu9eTHUKFUke14vTmf1bCHLRDEvUA
Date: Fri, 25 Jul 2025 17:06:17 +0000
Message-ID: <3d579a8c2558391ff6e33e7b45527a83aa67c7f5.camel@intel.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
	 <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-10-04b8fa44c98c@rivosinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|BL4PR11MB8846:EE_
x-ms-office365-filtering-correlation-id: 1bbf5399-73fe-461a-22b6-08ddcb9d921d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?emVFbmNLMnVyS00zaEwvSStmay9nb1VRY0dhZHhsNWZTQk1pTW1STTZiQlFs?=
 =?utf-8?B?NlhSRFdXU1pWM1RuejhqaVRXM2RRaERvVTVOL2dxdHN6MFllMEV3RGVOUWQ1?=
 =?utf-8?B?MWpwYThvMGtRaEYxV0pnSmFINlRYQUtwdmI2dDNIQmZlSUdlaGxDY3dHWjhN?=
 =?utf-8?B?d3ZGSk5oZnE1d2dkZ1FYOWVDMXZUR2JXZldvdUZ0K01ra2FPN2dXb3ZWTjNC?=
 =?utf-8?B?dkNycnhSTE5xcUo0UUVDeEthZXBPRzdNdUgxOUhlUHVmSnl5ZXBUWXdtZ2Fq?=
 =?utf-8?B?RGdVVlNXVWM3OG9mMGlOWTh4VnFQWThSY01ZanppVGMreWxsaEVlT0d4Q1Rl?=
 =?utf-8?B?TzljKytiM0RQeWlMR0p0NlZYN1E4UzdQRkpSR1M5UmFXUlg4V3NWRXNub2Ew?=
 =?utf-8?B?b0x1dGlrNFU3dWVYYk5OeEk4NWRoaHJWOWplNDZsRVpwbzFaMThCV3RlWmUw?=
 =?utf-8?B?T2wrMGpqQkl6Q3ZuZkN6eHBNamc1QktWdWdLcXl5TWZKTitoTTJRQ1cxblFp?=
 =?utf-8?B?R1JIOTlMMlJ3RGNRd2g1Qm95ZDBqbDhNa2tHN1pzUkFrb003d0J2dk41bHAx?=
 =?utf-8?B?MnI1N1NheUdXaUNoNVN3ZVdoMUxjUU1COW9OZzBraGdOQTlUVFBIcm8xWjZF?=
 =?utf-8?B?OFlNRmtlVzFROG8wbnZ5c3pZeGxXOVF4RVJqRDdrSkExaUhiTk5MTnZMY0Qz?=
 =?utf-8?B?REVsSWtWbkF0Z0sxVTcydm1rRWhIY2l1TEpWZ1E4UXdJMXNIamczR1MxZ1lW?=
 =?utf-8?B?TmlpRXhJdDlDNUFFRndUMjRqbHVLUTR1WGI2bVdmZXh2dWdlTTVKR2w1S00z?=
 =?utf-8?B?ZTlIYjFNTzFaYnVvclJ3OHdOcGFLeVFpR0Z3WTNEVnhKL3dETmJkSmN5TW92?=
 =?utf-8?B?UGc0b2JQKy94RUtCZVgxeDVHcEREaUdMUFppdEZ1ZTVlQitZU3c1V1BSMlpo?=
 =?utf-8?B?OEJ5T3M4MXpmZE5aTjVoYXBTVjY2OWplNzN6LzUrVHAwR01iT05yZ1JDa3Ew?=
 =?utf-8?B?Nm10NkFBRGFLdTlrZVpUdWtXV1Z1cWplMHEyNXMzUThXaStKYXBsYnQvUHRK?=
 =?utf-8?B?SUZ4anZYbGVNbE5lOUl3RGVWVnUxTXNram13dXZMNWNZMGVaNFNoYlMvUjhQ?=
 =?utf-8?B?ZDZPOFFndjJ2UjZFdW4wVDcxdHpvdldDQ0gzb1FTVzZHWTFYZHNWa0F1d1RW?=
 =?utf-8?B?dnhPT2F1QkdwekkxZFRyUmZ0TWhyaXUrcUN0d1RZL0dnQ2V4Q0VGWGNaWnZZ?=
 =?utf-8?B?TWhLUVZQL0swVitGaWRNVFRFMy91U2t0cGxrNW81VnFZY2tRSFFYUU92dnlG?=
 =?utf-8?B?K0lFU2hyM3FheXQrakVGSWFXZGlQdEVZR2piT3ZyckJiR3JVRHBpbmpNT08x?=
 =?utf-8?B?SmVTMmp3SHRDTmJabzZxWGltYmlRWVFRbVNaNDJqZ3ZmQ1N6WThrbURQVVZq?=
 =?utf-8?B?NHN0Uit1T0Rrdkc0bTJyWEdWcW9wZ3BTOCtBT3lFaVl3cGF1Q1NyK3BsclNH?=
 =?utf-8?B?M1YvNGxRUXEzK1JBaGt6aE1wOXMxNUpBZzQ0ajJHTEZGM1R2bDFVa2dmeHgv?=
 =?utf-8?B?VWM5ejV0czY4ZHkyclFyUUNmT2R2THZIV2Iya2dCZjIwVWppTHFiQlZzbXNW?=
 =?utf-8?B?K0RkeWM5NHgyMlZHbUNvejhsbFJ4MFZaNjVoSXBVUnJyZUxhQ2VvT1FqNFN6?=
 =?utf-8?B?QjNzeGRWSGJLZno3S0VMZU00Y2lmaE9JT0cyNXEzbFhjTWY3czJObHZ5elBo?=
 =?utf-8?B?SHFFQm1IcFFWU1hHbU5aYmRjRkI5cGIzZVBGZjFZWm5VZ0k2bElnOHB5KzNB?=
 =?utf-8?B?c1VzTFIxbDNHanJkYXhtU0ZFUG5rLzJlajJTNnF6ZEZXNDNrZVE3OFora1Bz?=
 =?utf-8?B?MDdBVWU1d3RyRWx6MWt2ZDV4Z2oyS0RzTGpOU1RSazh2YWxBME9GU0VTbTZT?=
 =?utf-8?B?VFAxY1EvOFUvVnVvRHF2TkloTWxEOTNvSEk0MzNTSit6VVdYbUErSldLWVdu?=
 =?utf-8?Q?EgJIGljwhe3FBtBeJmZEX17Viz9zzY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3ZjVEo5WVFkb3pIbmo4bjFMVmM5L1VHUHhtdGRVQjNCZnNZUllCMW13ajFO?=
 =?utf-8?B?MUd5ZzR3LzNKUzIxRHFMeGNhSkZYem4rTkV0Q0dBVFVHY0hJbzh0dS9hdU1K?=
 =?utf-8?B?Q0lZeE80VHNmajFwSUxuNktQZDZiUGIzZzJvTXpSaEdKRkJ0WUxjZlpCMXZp?=
 =?utf-8?B?OW1iSXBkTnlhaEMwaTJWK2hCelo0SUU1R1RNT0JaTnQ5eG5RYVcvU3NDS2pZ?=
 =?utf-8?B?YWhLMUpmVDNHbG1PaTF6bFo4QkE4aktFcFJBN0lHbW9WWnpKaUpKSTdFWFhm?=
 =?utf-8?B?aEVpalRxbi9hWHQwMFRmQ3J3ZXJ2UmFzMmZZT2JGRWJJSHViM2RtREZUdkJo?=
 =?utf-8?B?TmF4ZXVWNTl0WldmbDIzcjRyZGlWZktLYXVsOHMxa0VUOXNMc3c4TTYxNkUz?=
 =?utf-8?B?V2hZekV5bnRDb09HcEwzVkFDUEtQc0x2OXd5RkgyTWYzUTFnLzhPRmV3Z1B1?=
 =?utf-8?B?OE8rZ09HMEpCRC9kOGttcDAyTnBqVTBpUWdITGRiSm8reUdEVUFLQklLMVFx?=
 =?utf-8?B?QnlCU1p5eVM0bVMvcVhGdFJKYUdZM3ZPd2VLQVF5cjdCb3hjZ2dleTgxaGFi?=
 =?utf-8?B?aEJJbjVaeThSYzUwMThrOTJwZXE1Q1QzM29Bai96amxHaVFKYnFJcTY2UlVG?=
 =?utf-8?B?UDhBeEhCVHM5ZDhtWU5WSGdSRzFibStXN04raExrZXBVWDNIdzVUclIySUZm?=
 =?utf-8?B?RTM1b2pQL2l1L3ptSGd4ZERnQUtZQWxFamRmN0psRHA0Y1RrMzc0M3liMXdZ?=
 =?utf-8?B?S1cwcFBsNDVzL3RJVTBaN0ZBRDVlRmczS3IvcFJQck0xcEg5dkw5YitjcEIz?=
 =?utf-8?B?R0dXM2JrTEZhVmE1VmFUN3FtbXl0SXF6YStlbzlSYkJ2WXpSZG5RNmtqYmRy?=
 =?utf-8?B?UHUrdllRdW9tQUhuc0UzQ1UyTjlMdkxLUlFWaG5MckJjWjhMMVFiU3pmeGZM?=
 =?utf-8?B?TTQvT1ZYUWxwWHg2MlpRR0NhQnl3ZEV3Y1N0T0hHbHJYaEdUU0ZEQnVSZ1FX?=
 =?utf-8?B?dGFiaGJ0Q0VQUkp5aUVrRmhVd2NVOThkT25INExlSzJuOWxEbm9GSFFINWlx?=
 =?utf-8?B?Y3BCbkJTVkhzaTh2dU4zU1pkK0pLRkVzYmJXa1pzYXdVeWxOcXpva0RsMkMx?=
 =?utf-8?B?ZUZUVm1yYVBaTEEvbk8rdUh4YXhMc0xNYTF2dFpPb05mbmlNdDJGUlN4Mm9W?=
 =?utf-8?B?LzA2WGNtMXFsOVlMd1BsVk5OeXV6MEJLRmVUQStxWjAyMVorR083YXpUOWll?=
 =?utf-8?B?MWlXNytna2d1eERUaVd6QnV6bmc5cXBHK0poM0lGRk5nam9FM1BxYmlxUjdD?=
 =?utf-8?B?ZFNDOEFrNVR6dkF5dUhmb0x4ZVFSS1BORGIyK1RhQjhZakJGbXA4YlphZERt?=
 =?utf-8?B?a2hZQ2Y4SXZoNTMydG1Ea2VZV21CT2NqZkhzOFpiOFMvZ2t5OEIrWnlRNHdC?=
 =?utf-8?B?VEcwWWxzelBrUnR0RGZ6NU9JWXRYRHNvY1ZSeGtVaS9mUXhXdDVuVkl2ZTlr?=
 =?utf-8?B?QkEwOXdDTXN3QW40RWQwdU9YcGFacFAvVjduUUFicGtlcXRxM3NTS0drSk40?=
 =?utf-8?B?SUdmUmVURXlNTldtL0kza2xyTWs2enI1dUpNUWZURlNjNVdaeGFXSWxUK1Nn?=
 =?utf-8?B?cGpiT1MwK05ZSThmNVpEa2hsYUtmVjg2VUpocmx6cUtLT0dacVYvWm93OGYw?=
 =?utf-8?B?blV2bGZYVDZGaGNaMWRtWU85YnJnUnk3SHdjOG1FY3gyM0RIakhEUmdxNW1s?=
 =?utf-8?B?M1FPbGdldno4UGVuQSsySituSm04Q3pkNTdYWlZIbzhucDR1cTAvU0NyQmZl?=
 =?utf-8?B?NTMyYmtlNEtEaGN1a2kyVkNFVEF4MlJpNnRyczB1L2ZqcldDWHJ3TGd5NnpB?=
 =?utf-8?B?SXpOdGlXSjEwNERnNFB2b1JxUUVBK2Zua2RFYlk4YmRPUzc1YUNUMjJFUFgw?=
 =?utf-8?B?WGJ0YnpTM0NWa05nTzRzdkxvY3BKODFhU1dSaWtrT0N0bU9aRmFMQUFiY1li?=
 =?utf-8?B?bTRGeHZ5eVJtR2xjUUpMcUFVYThGanRLelM1K2cvNkpNVGw1cm1RREFFL0Ja?=
 =?utf-8?B?WWNzOXljNUxkRnpxOHZjVzFJUG9NbjhudDdVV1NXTGZjT2NUM0RRRlFSNkNN?=
 =?utf-8?B?WEcrRUplQng0N3FYOWFoNjhEOHJhb3ZDbVlXbkh2bzBwK2g0am9GYTJ4TmNo?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6926D64E3C3E164B99A9CD7B25F85B23@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbf5399-73fe-461a-22b6-08ddcb9d921d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2025 17:06:17.7603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fi9RQr+VLyVvDM9bOGN1Gf9fKwNGBo0uhIIGEVQgzOfQ5nfKGoEnMNr/5ic2MycBLGXck5ea+Ng6STeGO2YsdkdclOyls3XjVheFBsW7y+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8846
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA3LTI0IGF0IDE2OjM3IC0wNzAwLCBEZWVwYWsgR3VwdGEgd3JvdGU6DQo+
IElmIHNoYWRvdyBzdGFjayBoYXZlIG1lbW9yeSBwcm90ZWN0aW9ucyBmcm9tIHVuZGVybHlpbmcg
Y3B1LCB1c2UgdGhvc2UNCj4gcHJvdGVjdGlvbnMuIGFyY2hlcyBjYW4gZGVmaW5lIFBBR0VfS0VS
TkVMX1NIQURPV1NUQUNLIHRvIHZtYWxsb2Mgc3VjaCBzaGFkb3cNCj4gc3RhY2sgcGFnZXMuIEh3
IGFzc2lzdGVkIHNoYWRvdyBzdGFjayBwYWdlcyBncm93IGRvd253YXJkcyBsaWtlIHJlZ3VsYXIN
Cj4gc3RhY2suIENsYW5nIGJhc2VkIHNvZnR3YXJlIHNoYWRvdyBjYWxsIHN0YWNrIGdyb3dzIGxv
dyB0byBoaWdoIGFkZHJlc3MuDQo+IFRodXMgdGhpcyBwYXRjaCBhZGRyZXNzZXMgc29tZSBvZiB0
aG9zZSBuZWVkcyBkdWUgdG8gb3Bwb3NpdGUgZGlyZWN0aW9uDQo+IG9mIHNoYWRvdyBzdGFjay4g
RnVydGhlcm1vcmUsIGh3IHNoYWRvdyBzdGFjayBjYW4ndCBiZSBtZW1zZXQgYmVjYXVzZSBtZW1z
ZXQNCj4gdXNlcyBub3JtYWwgc3RvcmVzLiBMYXN0bHkgdG8gc3RvcmUgbWFnaWMgd29yZCBhdCBi
YXNlIG9mIHNoYWRvdyBzdGFjaywgYXJjaA0KPiBzcGVjaWZpYyBzaGFkb3cgc3RhY2sgc3RvcmUg
aGFzIHRvIGJlIHBlcmZvcm1lZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8
ZGVidWdAcml2b3NpbmMuY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvbGludXgvc2NzLmggfCAyNiAr
KysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAga2VybmVsL3Njcy5jICAgICAgICB8IDM4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDYwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9zY3MuaCBiL2luY2x1ZGUvbGludXgvc2NzLmgNCj4gaW5kZXggNGFiNWJkYzg5
OGNmLi42Y2VlZTA3YzJkMWEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvc2NzLmgNCj4g
KysrIGIvaW5jbHVkZS9saW51eC9zY3MuaA0KPiBAQCAtMTIsNiArMTIsNyBAQA0KPiAgI2luY2x1
ZGUgPGxpbnV4L3BvaXNvbi5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+DQo+ICAjaW5j
bHVkZSA8bGludXgvc2l6ZXMuaD4NCj4gKyNpbmNsdWRlIDxhc20vc2NzLmg+DQo+ICANCj4gICNp
ZmRlZiBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0sNCj4gIA0KPiBAQCAtMzcsMjIgKzM4LDQ1IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBzY3NfdGFza19yZXNldChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRz
aykNCj4gIAkgKiBSZXNldCB0aGUgc2hhZG93IHN0YWNrIHRvIHRoZSBiYXNlIGFkZHJlc3MgaW4g
Y2FzZSB0aGUgdGFzaw0KPiAgCSAqIGlzIHJldXNlZC4NCj4gIAkgKi8NCj4gKyNpZmRlZiBDT05G
SUdfQVJDSF9IQVNfS0VSTkVMX1NIQURPV19TVEFDSw0KPiArCXRhc2tfc2NzX3NwKHRzaykgPSB0
YXNrX3Njcyh0c2spICsgU0NTX1NJWkU7DQo+ICsjZWxzZQ0KPiAgCXRhc2tfc2NzX3NwKHRzaykg
PSB0YXNrX3Njcyh0c2spOw0KPiArI2VuZGlmDQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbmxpbmUg
dW5zaWduZWQgbG9uZyAqX19zY3NfbWFnaWModm9pZCAqcykNCj4gIHsNCj4gKyNpZmRlZiBDT05G
SUdfQVJDSF9IQVNfS0VSTkVMX1NIQURPV19TVEFDSw0KPiArCXJldHVybiAodW5zaWduZWQgbG9u
ZyAqKShzKTsNCj4gKyNlbHNlDQo+ICAJcmV0dXJuICh1bnNpZ25lZCBsb25nICopKHMgKyBTQ1Nf
U0laRSkgLSAxOw0KPiArI2VuZGlmDQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCB0
YXNrX3Njc19lbmRfY29ycnVwdGVkKHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQ0KPiAgew0KPiAg
CXVuc2lnbmVkIGxvbmcgKm1hZ2ljID0gX19zY3NfbWFnaWModGFza19zY3ModHNrKSk7DQo+IC0J
dW5zaWduZWQgbG9uZyBzeiA9IHRhc2tfc2NzX3NwKHRzaykgLSB0YXNrX3Njcyh0c2spOw0KPiAr
CXVuc2lnbmVkIGxvbmcgc3o7DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfS0VSTkVM
X1NIQURPV19TVEFDSw0KPiArCXN6ID0gKHRhc2tfc2NzKHRzaykgKyBTQ1NfU0laRSkgLSB0YXNr
X3Njc19zcCh0c2spOw0KPiArI2Vsc2UNCj4gKwlzeiA9IHRhc2tfc2NzX3NwKHRzaykgLSB0YXNr
X3Njcyh0c2spOw0KPiArI2VuZGlmDQo+ICANCj4gIAlyZXR1cm4gc3ogPj0gU0NTX1NJWkUgLSAx
IHx8IFJFQURfT05DRV9OT0NIRUNLKCptYWdpYykgIT0gU0NTX0VORF9NQUdJQzsNCj4gIH0NCj4g
IA0KPiArc3RhdGljIGlubGluZSB2b2lkIF9fc2NzX3N0b3JlX21hZ2ljKHVuc2lnbmVkIGxvbmcg
KnMsIHVuc2lnbmVkIGxvbmcgbWFnaWNfdmFsKQ0KPiArew0KPiArI2lmZGVmIENPTkZJR19BUkNI
X0hBU19LRVJORUxfU0hBRE9XX1NUQUNLDQo+ICsJYXJjaF9zY3Nfc3RvcmUocywgbWFnaWNfdmFs
KTsNCj4gKyNlbHNlDQo+ICsJKl9fc2NzX21hZ2ljKHMpID0gbWFnaWNfdmFsOw0KPiArI2VuZGlm
DQo+ICt9DQo+ICsNCj4gIERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShkeW5hbWljX3Njc19lbmFi
bGVkKTsNCj4gIA0KPiAgc3RhdGljIGlubGluZSBib29sIHNjc19pc19keW5hbWljKHZvaWQpDQo+
IGRpZmYgLS1naXQgYS9rZXJuZWwvc2NzLmMgYi9rZXJuZWwvc2NzLmMNCj4gaW5kZXggZDc4MDlh
ZmZlNzQwLi41OTEwYzBhOGVhYmQgMTAwNjQ0DQo+IC0tLSBhL2tlcm5lbC9zY3MuYw0KPiArKysg
Yi9rZXJuZWwvc2NzLmMNCj4gQEAgLTExLDYgKzExLDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9z
Y3MuaD4NCj4gICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+DQo+ICAjaW5jbHVkZSA8bGludXgv
dm1zdGF0Lmg+DQo+ICsjaW5jbHVkZSA8YXNtLWdlbmVyaWMvc2V0X21lbW9yeS5oPg0KPiAgDQo+
ICAjaWZkZWYgQ09ORklHX0RZTkFNSUNfU0NTDQo+ICBERUZJTkVfU1RBVElDX0tFWV9GQUxTRShk
eW5hbWljX3Njc19lbmFibGVkKTsNCj4gQEAgLTMyLDE5ICszMywzMSBAQCBzdGF0aWMgdm9pZCAq
X19zY3NfYWxsb2MoaW50IG5vZGUpDQo+ICB7DQo+ICAJaW50IGk7DQo+ICAJdm9pZCAqczsNCj4g
KwlwZ3Byb3RfdCBwcm90ID0gUEFHRV9LRVJORUw7DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfQVJD
SF9IQVNfS0VSTkVMX1NIQURPV19TVEFDSw0KPiArCXByb3QgPSBQQUdFX0tFUk5FTF9TSEFET1dT
VEFDSzsNCj4gKyNlbmRpZg0KPiAgDQo+ICAJZm9yIChpID0gMDsgaSA8IE5SX0NBQ0hFRF9TQ1M7
IGkrKykgew0KPiAgCQlzID0gdGhpc19jcHVfeGNoZyhzY3NfY2FjaGVbaV0sIE5VTEwpOw0KPiAg
CQlpZiAocykgew0KPiAgCQkJcyA9IGthc2FuX3VucG9pc29uX3ZtYWxsb2MocywgU0NTX1NJWkUs
DQo+ICAJCQkJCQkgICBLQVNBTl9WTUFMTE9DX1BST1RfTk9STUFMKTsNCj4gKy8qDQo+ICsgKiBJ
ZiBzb2Z0d2FyZSBzaGFkb3cgc3RhY2ssIGl0cyBzYWZlIHRvIG1lbXNldC4gRWxzZSBtZW1zZXQg
aXMgbm90DQo+ICsgKiBwb3NzaWJsZSBvbiBodyBwcm90ZWN0ZWQgc2hhZG93IHN0YWNrLiBtZW1z
ZXQgY29uc3RpdHV0ZXMgc3RvcmVzIGFuZA0KPiArICogc3RvcmVzIHRvIHNoYWRvdyBzdGFjayBt
ZW1vcnkgYXJlIGRpc2FsbG93ZWQgYW5kIHdpbGwgZmF1bHQuDQo+ICsgKi8NCj4gKyNpZm5kZWYg
Q09ORklHX0FSQ0hfSEFTX0tFUk5FTF9TSEFET1dfU1RBQ0sNCj4gIAkJCW1lbXNldChzLCAwLCBT
Q1NfU0laRSk7DQo+ICsjZW5kaWYNCj4gIAkJCWdvdG8gb3V0Ow0KPiAgCQl9DQo+ICAJfQ0KPiAg
DQo+ICAJcyA9IF9fdm1hbGxvY19ub2RlX3JhbmdlKFNDU19TSVpFLCAxLCBWTUFMTE9DX1NUQVJU
LCBWTUFMTE9DX0VORCwNCj4gLQkJCQkgICAgR0ZQX1NDUywgUEFHRV9LRVJORUwsIDAsIG5vZGUs
DQo+ICsJCQkJICAgIEdGUF9TQ1MsIHByb3QsIDAsIG5vZGUsDQo+ICAJCQkJICAgIF9fYnVpbHRp
bl9yZXR1cm5fYWRkcmVzcygwKSk7DQoNClRoaXMgZG9lc24ndCB1cGRhdGUgdGhlIGRpcmVjdCBt
YXAgYWxpYXMgSSB0aGluay4gRG8geW91IHdhbnQgdG8gcHJvdGVjdCBpdD8NCg0KPiAgDQo+ICBv
dXQ6DQo+IEBAIC01OSw3ICs3Miw3IEBAIHZvaWQgKnNjc19hbGxvYyhpbnQgbm9kZSkNCj4gIAlp
ZiAoIXMpDQo+ICAJCXJldHVybiBOVUxMOw0KPiAgDQo+IC0JKl9fc2NzX21hZ2ljKHMpID0gU0NT
X0VORF9NQUdJQzsNCj4gKwlfX3Njc19zdG9yZV9tYWdpYyhfX3Njc19tYWdpYyhzKSwgU0NTX0VO
RF9NQUdJQyk7DQo+ICANCj4gIAkvKg0KPiAgCSAqIFBvaXNvbiB0aGUgYWxsb2NhdGlvbiB0byBj
YXRjaCB1bmludGVudGlvbmFsIGFjY2Vzc2VzIHRvDQo+IEBAIC04Nyw2ICsxMDAsMTYgQEAgdm9p
ZCBzY3NfZnJlZSh2b2lkICpzKQ0KPiAgCQkJcmV0dXJuOw0KPiAgDQo+ICAJa2FzYW5fdW5wb2lz
b25fdm1hbGxvYyhzLCBTQ1NfU0laRSwgS0FTQU5fVk1BTExPQ19QUk9UX05PUk1BTCk7DQo+ICsJ
LyoNCj4gKwkgKiBIYXJkd2FyZSBwcm90ZWN0ZWQgc2hhZG93IHN0YWNrIGlzIG5vdCB3cml0ZWFi
bGUgYnkgcmVndWxhciBzdG9yZXMNCj4gKwkgKiBUaHVzIGFkZGluZyB0aGlzIGJhY2sgdG8gZnJl
ZSBsaXN0IHdpbGwgcmFpc2UgZmF1bHRzIGJ5IHZtYWxsb2MNCj4gKwkgKiBJdCBuZWVkcyB0byBi
ZSB3cml0ZWFibGUgYWdhaW4uIEl0J3MgZ29vZCBzYW5pdHkgYXMgd2VsbCBiZWNhdXNlDQo+ICsJ
ICogdGhlbiBpdCBjYW4ndCBiZSBpbmFkdmVydGVudGx5IGFjY2Vzc2VzIGFuZCBpZiBkb25lLCBp
dCB3aWxsIGZhdWx0Lg0KPiArCSAqLw0KPiArI2lmZGVmIENPTkZJR19BUkNIX0hBU19LRVJORUxf
U0hBRE9XX1NUQUNLDQo+ICsJc2V0X21lbW9yeV9ydygodW5zaWduZWQgbG9uZylzLCAoU0NTX1NJ
WkUvUEFHRV9TSVpFKSk7DQoNCkFib3ZlIHlvdSBkb24ndCB1cGRhdGUgdGhlIGRpcmVjdCBtYXAg
cGVybWlzc2lvbnMuIFNvIEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQNCnRoaXMuIHZtYWxsb2Mgc2hv
dWxkIGZsdXNoIHRoZSBwZXJtaXNzaW9uZWQgbWFwcGluZyBiZWZvcmUgcmUtdXNpbmcgaXQgd2l0
aCB0aGUNCmxhenkgY2xlYW51cCBzY2hlbWUuDQoNCj4gKyNlbmRpZg0KPiArDQoNCkkgd2FzIHRo
aW5raW5nIHNvbWVkYXkgd2hlbiB3ZSBnZXQgdG8gdGhpcyBmb3IgQ0VUIHdlIHdvdWxkIHByb3Rl
Y3QgdGhlIGRpcmVjdA0KbWFwLCBhbmQgc28gd291bGQgbmVlZCBzb21lIHBvb2wgb2Ygc2hhZG93
IHN0YWNrcyBiZWNhdXNlIGZsdXNoaW5nIHRoZSBUTEIgZm9yDQpldmVyeSB0aHJlYWQgYWxsb2Mv
ZnJlZSB3b3VsZCBsaWtlbHkgYmUgdG9vIGltcGFjdGZ1bC4NCg0KDQo+ICAJdmZyZWVfYXRvbWlj
KHMpOw0KPiAgfQ0KPiAgDQo+IEBAIC05Niw2ICsxMTksOSBAQCBzdGF0aWMgaW50IHNjc19jbGVh
bnVwKHVuc2lnbmVkIGludCBjcHUpDQo+ICAJdm9pZCAqKmNhY2hlID0gcGVyX2NwdV9wdHIoc2Nz
X2NhY2hlLCBjcHUpOw0KPiAgDQo+ICAJZm9yIChpID0gMDsgaSA8IE5SX0NBQ0hFRF9TQ1M7IGkr
Kykgew0KDQpPaCEgVGhlcmUgaXMgYSBjYWNoZSwgYnV0IHRoZSBzaXplIGlzIG9ubHkgMi4NCg0K
PiArI2lmZGVmIENPTkZJR19BUkNIX0hBU19LRVJORUxfU0hBRE9XX1NUQUNLDQo+ICsJCXNldF9t
ZW1vcnlfcncoKHVuc2lnbmVkIGxvbmcpY2FjaGVbaV0sIChTQ1NfU0laRS9QQUdFX1NJWkUpKTsN
Cj4gKyNlbmRpZg0KPiAgCQl2ZnJlZShjYWNoZVtpXSk7DQo+ICAJCWNhY2hlW2ldID0gTlVMTDsN
Cj4gIAl9DQo+IEBAIC0xMjIsNyArMTQ4LDEzIEBAIGludCBzY3NfcHJlcGFyZShzdHJ1Y3QgdGFz
a19zdHJ1Y3QgKnRzaywgaW50IG5vZGUpDQo+ICAJaWYgKCFzKQ0KPiAgCQlyZXR1cm4gLUVOT01F
TTsNCj4gIA0KPiAtCXRhc2tfc2NzKHRzaykgPSB0YXNrX3Njc19zcCh0c2spID0gczsNCj4gKwl0
YXNrX3Njcyh0c2spID0gczsNCj4gKyNpZmRlZiBDT05GSUdfQVJDSF9IQVNfS0VSTkVMX1NIQURP
V19TVEFDSw0KPiArCXRhc2tfc2NzX3NwKHRzaykgPSBzICsgU0NTX1NJWkU7DQo+ICsjZWxzZQ0K
PiArCXRhc2tfc2NzX3NwKHRzaykgPSBzOw0KPiArI2VuZGlmDQo+ICsNCj4gIAlyZXR1cm4gMDsN
Cj4gIH0NCj4gIA0KPiANCg0K

