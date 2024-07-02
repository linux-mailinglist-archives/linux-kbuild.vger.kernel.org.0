Return-Path: <linux-kbuild+bounces-2316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C9924365
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 18:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3AD4B2172D
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 16:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1C81BC092;
	Tue,  2 Jul 2024 16:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAwYe8iI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0494BA3F;
	Tue,  2 Jul 2024 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719936957; cv=fail; b=mz9QFmQSNoqLv18EjaYfnuVfK1/5o5O5XYQRLz63s4lZHzDIea3Rzk+F/WUFuDfzN21BsK0q1wmRy7v8M4RfJlCWDQvX3EtW9AdPLu9WpZtN/lAiekE9dl6E/OJldXWnmqzuWVQF003I5umajf2VucmWjvc1CSrtCNotrX01kkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719936957; c=relaxed/simple;
	bh=eV7xd6lnwoL8DKwfuLGWI1zbE3/dJT/hxE/kMzV0cRE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bOL7mdQAjuy17XhHBfhL0xOBzqvelctwox8oVSrMooo/hN3VttnA8pW0qemVy2FA7WYK0A2StvneVmvvu8UJOCFE/ujAulisDv+BoScgUYjOT3VReRos7+yxAGMPDZ5DkqqUCpIMsov1nY+qV0x5SBaAJaKuKpQY14pqwgEakDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAwYe8iI; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719936955; x=1751472955;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eV7xd6lnwoL8DKwfuLGWI1zbE3/dJT/hxE/kMzV0cRE=;
  b=UAwYe8iIN4m5UlZX1+LRIkydOD+pfJctdyFUITxrC5zxholXRRhIo+Ip
   aVzGfVOF2Qnn/KaGsC9qsOzVe8i8vdvtseGO8evWh3VWyeKBdcWNUgMdS
   4YKBgRXHDXx1O/hWkHdAhEukRhWQc0B+jyUx0Csq9PQuQPADJNCFxBcp3
   xIybVMu9PdLhDdDfdxJUgusndByuGNh7TWuoDxmPQ51O63XYs1o2WjEmA
   MP/cttB8arzUdtJITsipArO487UpxTK5fFA/Jg39sFmv5HvkkaN/Hw6ox
   zJUUqHd46ClKLzPGlQLoaXCv+vXluA+6tDRi6SJkq+Baf9nFyZkPb8tf/
   Q==;
X-CSE-ConnectionGUID: oGWjLbgBT+KPa17DUfY19g==
X-CSE-MsgGUID: Eemr32gWRLWCds2tON8/4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17337054"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="17337054"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 09:15:54 -0700
X-CSE-ConnectionGUID: 3kI4Zfj4R6GJwLF0n++J3g==
X-CSE-MsgGUID: X0OPuNfhQO2UX7VhZwqOYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50295829"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jul 2024 09:15:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 09:15:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 09:15:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 09:15:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNkFm1nIPIVC1FGm6SEhJGko5/UmHcao7RhIC73UT0xb/By1HDvOsauh0QQmBzHgUiTkkXhZhid+2lrOKp+f7f7l8vQE4rxCqcPBJ/jAx6SN4kAADvlJQQ0KCsQo6SR3FxY/WSkVfNPy1WSMRiH7hy5YvYMsrSmey2ONnPM1ch987/fv8MUml88V2uSPb/Er6GfH2jyXFAM3DP78OAw6FKinisIO1Cb/wUTdPcsrIZRZ4QXqMo9mf7tFXZkaiM5ZYS5etzrDcEPEZzEFOmaRKui2D34KbdqBCj4t+ZlmjD6653erWXU0P00q+UZAnvQdG/gcP+K3t63rX/r5hgHdXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV7xd6lnwoL8DKwfuLGWI1zbE3/dJT/hxE/kMzV0cRE=;
 b=cWpjBk2quubcnzTxTQMqLO2WIsOe9a3oANaPB4uX+QLjLqeKfXuEWeDE7zRDhLxcNvxDqADTezxBHpHSwLRh/RpNfc9Sw0/YBP/fAAP+6t3XeRmdBVXHxz7/FEKP/dn72lHmxxBaL+VaMIOXaCs8s8DSLh6UCIxBZ2+0G1mj/j5C+KrVG7kFPzHsIY+N3uMuXdsCJJXi5KG4aFhdcX9xGYQJ2zKX8TlQI6QbB910yh0ZCohmTCtpsnl3ADSt6Y8u8s4qHsrxlO2jppQAVrkeAPNbMYSG0k6p9S5yEsbRMOLRvxQ7i8pwm+JirhzklBYmSMtoscucF+EgWh3mspaB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 16:15:41 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 16:15:38 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "masahiroy@kernel.org" <masahiroy@kernel.org>
CC: "nicolas@fjasle.eu" <nicolas@fjasle.eu>, "conor@kernel.org"
	<conor@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kbuild@vger.kernel.org"
	<linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Topic: [PATCH v2 4/4] kbuild: use $(src) instead of $(srctree)/$(src)
 for source directory
Thread-Index: AQHayLVfl2uFd7lKFEy9THA08Pzt97HccBAAgAFBeQCAABlUgIAFZHEAgAB1bYA=
Date: Tue, 2 Jul 2024 16:15:38 +0000
Message-ID: <c485326b640ae6f79582155c31ecaf4a1230b1ee.camel@intel.com>
References: <20240427145502.2804311-1-masahiroy@kernel.org>
	 <20240427145502.2804311-5-masahiroy@kernel.org>
	 <ea24aa9b-291d-47bc-98cf-5893926ff8da@kernel.org>
	 <CAK7LNAT5_pDn1ZOfm8TzubH-s2HR4DQu9eEx0RgdJ3s4Cmxqow@mail.gmail.com>
	 <9771d50d95e508bf8971a36b6475c782c42b46a1.camel@intel.com>
	 <CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7JYuHTWzgGL2Zjg@mail.gmail.com>
	 <803eabc8e2fa5dec950d149f83027fd204d5ef69.camel@intel.com>
	 <2ada559c1a4517ed879bb662689815b4357674ac.camel@intel.com>
	 <CAK7LNAQ47bZpE6c6Yoz-jQS78uU611oZwU8bH+7e=p5zSyADJw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ47bZpE6c6Yoz-jQS78uU611oZwU8bH+7e=p5zSyADJw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH7PR11MB6931:EE_
x-ms-office365-filtering-correlation-id: 233ff28e-a580-49dc-3de5-08dc9ab2364e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QzJpMTlBbFFSenZjdUpZK2hwR0M4ZnVkeW5mcGY4dVR4TDFzenVtMTcrejdG?=
 =?utf-8?B?R01LMVBpbC9qTkFIbkcvRE1DMDJkREhqaTdjNEFORCtrbzVCRFZadW9EbjBl?=
 =?utf-8?B?aU5uZXI3UCtEV2Vqbk0raG5ZMkMzSzlOS0toaWRjOW5vMU10Tnd4UWlFQ2hL?=
 =?utf-8?B?VWdzTGlvd0xWQitJa2VnT0FwTnhuR3B6b29lYUFEU2svdU9CY202OVFWaTQ0?=
 =?utf-8?B?aXBGUzRORTlPOFlsbEsxZE40ejdKYWNFTnRONDVtaFdSUTF4ejJpQkF6Lzgz?=
 =?utf-8?B?RVdZR0JvTW9RMzRDWUw0L3FhWEJvRkpVSlcrVE9Xdy9TY3RCR0xweGlsUWZ4?=
 =?utf-8?B?emJKQlp6dmtjRGVSVVh4THoyUWgxclpPVWJYcG5ZUDVqdCt1NFpHbXJXb0tS?=
 =?utf-8?B?VkNIcWRCdWRLZ1pkWW1kZ1RXcGZvemoyczdHSllZZXFVR3lTWkVmTVV4UFc0?=
 =?utf-8?B?UVdLOVppcmpsb0JieTZ4R0MxZlFJcm5JMWNJQnlLN2xGUVRZUHhiYjBPUjg5?=
 =?utf-8?B?d2h5bUtkTWNSWjdJSU5qZnQ4Z3pxSGtWTXJLcEdCMHVtTEc5VG5JbzFVNTBJ?=
 =?utf-8?B?MmxvR3dWMUg3Vjg0MEFORUFuYnZYdlppbmZ2cUxTUVdvWkJaYVJlVXRiTFFU?=
 =?utf-8?B?Q011SlEyNVRKVm1KTXVOSkpzU2oxbHVSdDk3K0FFN1RkL2twUWN2dkJVdUlX?=
 =?utf-8?B?cHBsVEV0UlQvV2FSaFFudGIzQ1NvYi90bHRNV3k4cllER1A4N3hxT24yVjdB?=
 =?utf-8?B?ZVVwaDMyaHFWcGFiUHc2MTV6aTVCQ0cwaTlUTFdYMm16Z1ZGdDBjejZhTURp?=
 =?utf-8?B?a0ZlZ1hXdW9tTXVsYmRIWEdvR0poaXAvQlBLVXdhU1VYdHNvME5hRG1uakpD?=
 =?utf-8?B?Y0VONDZCTHgxbkNaKzAyU0VlNVhUcWczNHVOQkFKS1VBRkxEYmhWeXgzakxl?=
 =?utf-8?B?dlJxUFlmS0h4RVNLVnBwMTdIZm9SVUFrYUZUd2NtU3B1QzYxcjAraVg5dSt6?=
 =?utf-8?B?UEhRNzJXanYzOU1aa1RKR1dBdWxOUUNiaERSN3djT0VlUFQ0ajBRcEJ2aWh1?=
 =?utf-8?B?T3BHRlI2dmdBZ3p1NjBXN0h6d2FETFViTThxRUhRRnJiUE5WaUp0eHh6U3A0?=
 =?utf-8?B?cGpoMW5NenBrUHVoa3FWUXdDT2dYSUU0N0IyRHZNYVJkRERZQitPdHpTYTJn?=
 =?utf-8?B?ZmFxTVBTQ1dGV1U1R0VzeEpEcHJPNThDazZCcHhYZWl3L2FVWUdLUmtpSU5B?=
 =?utf-8?B?eTROMlFqUU92d05QMGtydndBVVptNlhyMWFoYmdxVnc0NW9lbVgvZU9zdm5H?=
 =?utf-8?B?V3Q0VExwbzMrYUxzR3lCaUJIcnlZejh4d0kwN2lIcFhuRlpTRkhDZUEydU1C?=
 =?utf-8?B?SjRqY0ZsdThXSWVIeHc0enhwQVFyWlRwY3Z0K2xzNkV0UTVPc0dXMjdwR1RP?=
 =?utf-8?B?RHJPK2lMUzhsTXZXTDJsbXNRZGNUNXpPVUl4NzhyMFQwY2svWG1UZVhONzJQ?=
 =?utf-8?B?aW9YM0FpUmNpQ2c4dUhrd2ZaNXVtQm1uSlkwclQ1em9MK0poVEFOaTRvOTZ0?=
 =?utf-8?B?N3pvdUlxcDVmMEVnUzdRdkMyOFNPdzFTU2JtUEhXQjd3eHgyMWUrSjE4a2FP?=
 =?utf-8?B?bVZrOXJ2RHFnbC9Xa0FHWGZoN0o3emRsVysreUlkYUQrOThQaWZUZWdqc1hG?=
 =?utf-8?B?T3lIR2hsZTVKZTZVQkwzelQwZWpna3hVNExvT3hobHR5Mm5ValA2dHUvTksr?=
 =?utf-8?B?OHhNMUxZNjI3R3JtN2tXaUxPdzRWeXVYTmRCYmhqRzJ3R2QzRUdBYjUxNUlS?=
 =?utf-8?B?bmc5amlvSjFFYlVJa1NXc2MwUWRrdjNQRU9IVm0rTFo0aCtsb1VDYVJ1bVVO?=
 =?utf-8?B?bkpJLzR5S0VlWGNxK0ErenZLNnlFU2h0SWJqTkFmRC9wMnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjhqUCsrWHlEcEhGM2xpSy9GNng5MDQzUUxnTThPREFPdXE0ZnQwVjlMOERC?=
 =?utf-8?B?cXZmcXRZVmhsMitibk4zRUY0Y25UVlNkeWszcXc5dUdSbzV0cnNKSVd0VDBO?=
 =?utf-8?B?TWg1RkUrMjZWS3VuRWQwR1BBZEFXU0ZoOGVWTUNGMUdLallneXdXTEorRHVu?=
 =?utf-8?B?S09HR2ZjTlJXMndpZm9BTlM5eWJQT2E3L0d4dktzbVhIbG9pR3I3VEQ1Z1pI?=
 =?utf-8?B?SVJxekw2aEdwZUdNTmhRazhSdzM3VGZhN1FlZysrNERENy9LVDFQV2ZLeE41?=
 =?utf-8?B?ZUFpaHBrTHYycE0vMWdoZnp1WTJER1NXR3VXVEpNSHQyZGt5bmVGeXlFWU83?=
 =?utf-8?B?d2tNT1NYcjFtTzRsRFZLTTF2dkM3TmNpWHZXL2RMUnVxaFZ0Z09BL2dNbHJo?=
 =?utf-8?B?a1dFVlRZRitidk9DU0RUWlVkczN0dk0rNVJTSzBNcFNxL3RXcjZDWjliSHF6?=
 =?utf-8?B?a0t3ZTZDaEwvQkVaU2lDd1BGVy9JMnJhZWZlUzQ5cFc5ejlzUjBLMFNBZmNq?=
 =?utf-8?B?Nk9rNnE4aWdEVUptSnBPdUQ0anZvVkQvWFRqZVRxaHhNbE9lM1JHdG52Z2pF?=
 =?utf-8?B?V3RQbGpBWTFQNTM1R3ZURFRXbFpsQ09BeWxMc2FMWXp1a0xHQ25RS3VZZFFu?=
 =?utf-8?B?R25EaUVNdHVsYTVYWm80SFMvQzh5TTVMMlJEcjF1alQ4VThjRnpKQ2E1aEJz?=
 =?utf-8?B?UFhiL1FsbldGbGdXYTNUUVVWaGRqWm84c0VPdG9vUkkyckZ6ak1Hc0tLL1ow?=
 =?utf-8?B?Q0Rua0tIY3RGQXM0SE1pWFpydWlqMi9VTnpIS3ZPcTJXcm9LT29xU3VTVjha?=
 =?utf-8?B?Ry9wYkZKWWtSSE51MmNkWWtoZk1YNExxYldIYUtpWm1hVk8xYyszTGkwRTBQ?=
 =?utf-8?B?eU5RZG15eFU1K1JjQnJQeklzQXVEM3RpSktxUzJ6QW1BS0RVSEQ3MUdJd1o2?=
 =?utf-8?B?S0x0RXlEdkpRcEVtSTBmd3QyenJtZGdqN09BbWNMWWFDVGoxcGF1TEZnK1Bh?=
 =?utf-8?B?eVBRUlY5Tkt5clZoelZWOThIa3F6SkhwOWJIa0JLblZBbUNoVWl6cTI1Q3k1?=
 =?utf-8?B?NUZQMzNJUDRKdS93cDlHbENVcXJpRXk2SEwyaTQ1M0tBWUtjdlpvRnVHL0hj?=
 =?utf-8?B?QU1RYkk1TlRWQS96K2U5eFVtR1JvZGNBWEg1V3ZreS9wQzNOVnFZeVE3TEp4?=
 =?utf-8?B?eGU0SHVXL2UxVmNhU2VqNERSVmNQbHBDR29QVDVrR3BFSHgveXNTZ1RKNnR6?=
 =?utf-8?B?Qk8rc2ZROTJGY3FnY3RYd2VadGlabENzUnBtYUpiZkRibkhxeWFadGVaYVhT?=
 =?utf-8?B?cENuRnJqUDdGZVNFOWxLZzBVcFlKR0V5emVaMWVSZEZ6RDhGL2VmS0JwR2Rw?=
 =?utf-8?B?UkZkSnArN3k2QUdMN1N3eVlNajVqS0ZwRFczQ3o4ZWlvUzg1K0lCYnpMTmpF?=
 =?utf-8?B?RC9VSmtNRVN6SmJvdloydmNDcjZ1eUdyVlg2QVcvZzFDYkk3M2h6NnNxODZ3?=
 =?utf-8?B?SzhocWNLK0QrRGNGalU3anBSVGNYWi9RTzVVcnJaNElJQzNvZnFxOTJYa055?=
 =?utf-8?B?cTFqLzZYZHh0cTZJWVZRMWllZXNjemF5VnBsd25nK3FRTXc4Wi92OXhRQm1Z?=
 =?utf-8?B?V3hHaVpweXZ4Vm12LzBoRkljbkxiTlhkSERaUy9rNFJ4dHVGVmQzT3ZkVFVn?=
 =?utf-8?B?VGhxUVM0MHJWOXZSbDVnM0dCRGUwNmhjVlpsRExtNi9jQmorYUZaZEMyQXJt?=
 =?utf-8?B?VElqbGhhaEhsMTBaQTlkaGs1S2pTNDQ4MC94am0vYlNmYnQ5M1lBakwrZytH?=
 =?utf-8?B?Z2Zpc2JhYUt2N2E5Q1JkL1B0YklteDZkZm9WQ3lEd0lTUHNMb2tBb2xGSERj?=
 =?utf-8?B?elYycXpuM29uVzBnMlpFdHM1M2tUSGY0OCtRczl5ekovSGtBTEg2SGlaNnIw?=
 =?utf-8?B?QkRBejQ1RHJrMWlQSW9QMHRVVldCR0Y0MU1OS1VFMjhieWVjdXlyUmd5eWUr?=
 =?utf-8?B?eU1BZG9kcks4WEZWNC9qMWxsaDdMYUtmOEZvckE0Uy9zanFGdTFwOTEyVlZ1?=
 =?utf-8?B?M05Sc2o5R2habGorS3RrVXVmbmdWcHIrbzgvNUlRRWYvbGdZOStkOWJkbGVQ?=
 =?utf-8?B?SzJKZkJjTWlESWRJZjQzWnhMOHBjeDV4aDdiMUlqQWpOZzdaK2Q1NE9pbE9p?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E522B31305AF0C4BBDAFFC4361B310FE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233ff28e-a580-49dc-3de5-08dc9ab2364e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 16:15:38.5521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cl57w6+BbcDtn5IE0xcz49Qal1OuU3TvvY/tSQzdIsBr6rzBqfdtDE5eLza3ekKY8q7hADvYHri76p4f5F+PQhoCWt2MP+6G0AJLGbyJj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI0LTA3LTAyIGF0IDE4OjE1ICswOTAwLCBNYXNhaGlybyBZYW1hZGEgd3JvdGU6
DQo+ID4gU28gdGhlcmUgaXMgbm8gb2ZmaWNpYWwgd2F5IHRvIGJ1aWxkIGp1c3QgYSBtb2R1bGUg
dG8gdGhlIG91dHB1dCBkaXJlY3Rvcnk/DQo+IA0KPiANCj4gWW91IGFscmVhZHkga25vdyBob3cg
dG8gZG8gaXQ6DQo+IA0KPiAjSSdtIGd1ZXNzIGl0IGhhcyBzb21ldGhpbmcgdG8gZG8gd2l0aCB0
aGUgIk09IiBvcHRpb24gYmVjYXVzZToNCj4gI21ha2UgQVJDSD14ODZfNjQgTz0uLi9saW51eC10
ZHgta3ZtLW91dC8gLWozNiBhcmNoL3g4Ni9rdm0va3ZtLmtvDQo+ICNhcmNoL3g4Ni9rdm0va3Zt
LWludGVsLmtvDQo+ICMNCj4gIy4uLndvcmtzLg0KDQpUaGlzIGNhbiBidWlsZCBqdXN0IHRoZSBt
b2R1bGUsIGJ1dCBub3QgY2xlYW4ganVzdCB0aGUgbW9kdWxlLg0KDQo+IA0KPiANCj4gDQo+IA0K
PiA+IEFuZA0KPiA+IGl0IGp1c3QgYWNjaWRlbnRhbGx5IHdvcmtlZCBhbGwgdGhlc2UgeWVhcnM/
IElNTyBpdCdzIGEgbmljZSBmZWF0dXJlIHRvDQo+ID4gaGF2ZS4NCj4gPiBJJ3ZlIGVzcGVjaWFs
bHkgZm91bmQgaXQgdXNlZnVsIHdoZW4gZG9pbmcgdmlydHVhbGl6YXRpb24gZGV2ZWxvcG1lbnQg
d2hlcmUNCj4gPiB5b3UNCj4gPiBuZWVkIHRvIGJ1aWxkL3Rlc3QgZ3Vlc3QgYW5kIGhvc3Qga2Vy
bmVscyBhcyB0aGUgc2FtZSB0aW1lLg0KPiA+IA0KPiA+IE9yIHdhcyBpdCBqdXN0IG5vdyBkZWxl
Z2F0ZWQgdG8gdW5vZmZpY2lhbCBzdXBwb3J0IGFmdGVyIHRoaXMgcGF0Y2g/DQo+IA0KPiANCj4g
Tm8uDQo+IFRoZSBNPSBvcHRpb24gaXMgaW50ZW5kZWQgZm9yIGJ1aWxkaW5nIGV4dGVybmFsIG1v
ZHVsZXMuDQo+IFlvdSBqdXN0IGFidXNlZCBpdCB0byBidWlsZCB0aGUgdXBzdHJlYW0gbW9kdWxl
cy4NCj4gDQo+IEtidWlsZCBoYXMgbmV2ZXIgc3VwcG9ydGVkIGJ1aWxkaW5nIGV4dGVybmFsIG1v
ZHVsZXMgaW4gYSBzZXBhcmF0ZQ0KPiBvdXRwdXQgZGlyZWN0b3J5Lg0KPiANCj4gDQo+ICJkZWxl
Z2F0ZWQgdG8gdW5vZmZpY2lhbCBzdXBwb3J0IiBpcyBhIHdyb25nIHN0YXRlbWVudCwNCj4gYXMg
aXQgaGFzIG5ldmVyIG9mZmljaWFsbHkgc3VwcG9ydGVkIGluIHRoZSBwYXN0Lg0KPiANCj4gDQo+
IFlvdXIgd2F5IGlzIGEgd29ya2Fyb3VuZCB0aGF0IHBlb3BsZSBmb3VuZCBoYXBwZW5lZCB0byB3
b3JrLg0KDQpUaGUgbWFpbiBwb2ludCBpcyB0aGF0IHRoZSBvbGQgYmVoYXZpb3Igd2FzIHVzZWZ1
bC4gSXQgc2VlbXMgdGhlIGNoYW5nZSB0aGF0DQpicm9rZSBteSB3b3JrZmxvdyB3YXMgaW50ZW5k
ZWQgdG8gbWFrZSBpdCBlYXNpZXIgdG8gbWFpbnRhaW4gb3V0LW9mLXRyZWUNCm1vZHVsZXM/IElm
IHNvIHRoZW4gYXJlbid0IHdlIHRha2luZyBhd2F5IHVzZWZ1bCBiZWhhdmlvciBmb3IgaW4tdHJl
ZSBtb2R1bGUNCmRldmVsb3BtZW50IHRvIGhlbHAgb3V0LW9mLXRyZWUgbW9kdWxlcz8NCg0KQ2Fu
IHlvdSBhdCBsZWFzdCBzdXBwb3J0IFZQQVRIIG1ldGhvZCBnb2luZyBmb3J3YXJkPyBBbHRob3Vn
aCBJIGFtIHN1cnByaXNlZCBJJ20NCnRoZSBvbmx5IG9uZSB0aGF0IGhpdCB0aGlzLiBJIGFzc3Vt
ZWQgdGhpcyB3YXMgYSBjb21tb24gdXNhZ2UuDQo=

