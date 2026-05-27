Return-Path: <linux-kbuild+bounces-13360-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFyqD4AAF2oJ0QcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13360-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:32:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2E5E5EB2
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 314F730125F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 14:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D08366045;
	Wed, 27 May 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSX0zvDG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC2E1C695;
	Wed, 27 May 2026 14:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779892251; cv=fail; b=Sk51MFwHyVriAXLkNO+KwdKHzK0T5jTAJ4B9zDJhXobHqsj7p3RNJXA3Fep67q/F0rc4aFXLsoXPqx2IKmeaGQ7lCYp1nHG2++FWVpbBSMCXamV3V2Pyb7HHUKn7gWZz12TjCFSzk3hh2tpzNhwXWXqOAGjpXHHyvtNhbkIgaVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779892251; c=relaxed/simple;
	bh=Q5yhWnMSnkj+ocKRKAHLdVcSObOfbJGVSopUWg6GwJ4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pS7QdfvKAnVHCn+GBKTZHke8L180alme1ijV0NOmYt9TCgyzhPeuQ26JzPiqp+Z0uJqHCBqJ7fOgP57HiJ/JH3tdmsnbmhYGxl9FkgYzZPurdGq0XXe3a0PXvhSnOssUdcpI/Dbsb6DyLcpWwhcKUXFpNoPlb+Q3pGMX7POFD5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSX0zvDG; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779892249; x=1811428249;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q5yhWnMSnkj+ocKRKAHLdVcSObOfbJGVSopUWg6GwJ4=;
  b=lSX0zvDGO95KPtAcd0X627oS1gjphzcAXZd7h0o4Uc+uds5KZcxQLnDP
   NWsFkTa6PLoxqi9hLxDHXecRp6r1xvBsfJTo+Aft2RYtXfkr9gqYZcBzE
   qF1OjGDtgCq+z7yoSlZrwfFPs1eMRFBWHEuTdi9zeZWbuz24ruJyE/F6i
   Uvtqzov1C0nveO6lT6xnCqYKTHMf2qZr5f8Fefe/V7M0eQSAOAYJoTmZd
   J1dqstMBa1r6yAlWD8ElgP6WtJjvtLPinqu/laryI/JClWE/ybpSHJHqv
   pHroCyeP5SqSMiwfqx8LS+SXPrvZKNlTrPF1J/wGXJTOl+QNrlB9XFL0W
   Q==;
X-CSE-ConnectionGUID: qkGp1WYrREynkU5EBoLjKw==
X-CSE-MsgGUID: Z/trgljKQa+vK5V8K9dGbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="92109992"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="92109992"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:30:42 -0700
X-CSE-ConnectionGUID: UPZ1arN5R16J8SXTTLok/A==
X-CSE-MsgGUID: zjTNDB7tR96o/oa+joFaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="265861585"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 07:30:40 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:30:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 07:30:39 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 07:30:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja/fjHjzV6uf35Z9xS8/zinKP8+MIcn07QziEfaKKhdSxfXwLoZZmQKLfaFGOy4MSoPD/EoUgD5/qB9MYVRBEOy/xSZoYYbLgfXwUsPyqSFIdtanP+CxHtxt4VN3SGO4Or2LWfjvezxr7mOa8eu7uMciQQ4Z1rK1l7/09jaDbtHv23iKVxF0S2AZXWUMP/IOK+nM6mckpF06p/VYzmkcZJXKHmx0k5N+2ItP1QgaLZjYExpFYTmVk0Dfw88HbNES7xp0s6zi/sN1s5OMGI+U9rIHfLVDSR6ogs3aSSSCIfSeKm0B+rvn3vwVlYIfi5uUQUEkgYQGPe5tvtwDmyKNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZlRMgEojmpF94ao60gpgt0aH3A2wSlG6Gj70rI9jvM=;
 b=tZKxuIUfXH/NgtlG1FHqsPkcruEFcCN1TE4Z4rChccUzZzJg9jcXwmeXP6957C6dmmiKFRecWQya0EAXX8vW3EDu5n3Gd8+ZTgs3un+0qfdEE0MJNGgMOD0JMhsOVnY4bFZt/DOEDZyGVkqvhZU2EBHNgogenPuAF683Mgdfd2b3NCjK3V2XqdYulVY2mWuOpONK1tYW6/Y/bG9xdCTbVQw/Xz6Un45rhGVj3/t7pXkdNSlmWXgmOce56h6QXZvfIr9MBgz3fxNGy2uTzheyHXpCGSWbw1fpcjrXDwbFT1nmFhtnzOcxyEgKlTrEffa5xa6OTZx+4cEXfzjRI6OzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by SA0PR11MB4589.namprd11.prod.outlook.com (2603:10b6:806:9a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 14:30:35 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 14:30:35 +0000
Message-ID: <305fbfaf-a4a2-41e1-805d-5141fbfa8e57@intel.com>
Date: Wed, 27 May 2026 16:30:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] err.h: use __always_inline on all error pointer helpers
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-kbuild@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-s390@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
	"Bjorn Andersson" <andersson@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Christian Marangi
	<ansuelsmth@gmail.com>, <linux-kernel@vger.kernel.org>, Steven Rostedt
	<rostedt@goodmis.org>
References: <20260526101851.2495110-1-arnd@kernel.org>
 <b5e15330-ed64-4f31-bea2-bb877a24c1ce@intel.com>
 <8e50449f-66f0-4e85-aefa-7016697fe722@app.fastmail.com>
 <9398ee4c-3b51-4a00-a0d5-3674ce1b1081@intel.com>
 <21f771b5-b8fe-4357-b081-ae83a39df485@app.fastmail.com>
Content-Language: en-US
From: Alexander Lobakin <aleksander.lobakin@intel.com>
In-Reply-To: <21f771b5-b8fe-4357-b081-ae83a39df485@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI4PEPF00000150.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::868) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|SA0PR11MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: 66859cb6-9398-4c8b-e3fd-08debbfc8390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Z+n4P1tbs+WZ7rzw7lo0LPp4ORmm4K+aivpyFRtPk6jQV+hPM1nY+r7178p4svCf/wNk/UzjVZ9+9VKlrm8yafrVhPh5wUn26tHeGPIA29khxaFqGIvCGw4zgIi7mxcC1LHq3ahIHhKfHho/rEqcu1cJvBqII2hEvLgztCH7OGa829KzxS0dNdF2FPsxkCQogujRP/GGJsDOfQRCiGNhkrxcS4O9dlxobJl2rdo3paauzFSmtTDuKeL62LILLRdZgVC95miW1rCH8T8jodjx5EwlkjOYyooYGPp/2dKA0w/sriPb4xDHMIHBcrk4sq/O57RfShisWRX7rpsF7xTBVtjDcnb5l3isQ1Wd6uqyywEdMBP+kPXuI4p3v5gpa9okd1J8YcmhJCJaztw63lB+6Er92xMOZYgQhDrI6MxPejxKBcZI7Vx10Da26oRtqnWy3OrnJ/JmEB8vvKhj7WHvZWsaHnW0WPmtuz5H916Vdlu9EPHAcOzPjqFRs/yackKSVKAzKw0URxf+MPQMfL1hrb+e9qsdFrmPrs32A8lNXHJ2KujwOD0lcd+IctRKLJxpqbI/ExnCrijrs4i4p0/VKCOcxwNc7SO1Smi9HNuGaQVDYotRub0uDJbXWdFU3GRqTSzeL46HCLHkhaTtJI507SQDxMa6BAkxlmK69k0KNKTp9ldDD4KjxvIAgOn7cq9E
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVRb0lmMUhjVDkrOUFxaUsrOTNEb01sSllIekJVZnhQY1oxZDAzUnFQLzYw?=
 =?utf-8?B?U2ZHK1J3RGI0SjUwSm42cm9mVU1yVGt6Q2xCZEx6OGQvVDY0OGxDOUY0cEhk?=
 =?utf-8?B?K1pwSTBmcWpKQmEwMlBVaXg0M2Zic0pCRmx1VWV1N2R5UmN0VEF5RXBHMUdm?=
 =?utf-8?B?NVdaMzdPK2x0Nk1oc3oydElaeTl1Z1JiMTl4eHF6Y0swYnlVRTNVYUVlcktT?=
 =?utf-8?B?ZUdLU3FrQzdGdWsrajNVY243ODNmQkV5MkVtSjE4aE44VFFEdjRQaW5EYnVH?=
 =?utf-8?B?S1QreUYwUHlvYmJvVGloOEZpR0V1QXdVbUN6S2dIVDJyeGNTZUVZVlBLRFc3?=
 =?utf-8?B?QXlua2FBMVNnVklFSmdmRU1vK2VBUXNsVUh2TDUxSERJcFRqaHcwckZpa0xw?=
 =?utf-8?B?NWF0MzhhMUkrQWphdklFdzdzN1hGVGlBRkJTaGtJVFRmMTJHT0NyV05jTHZm?=
 =?utf-8?B?cmpMS3lzOXBjbXFWMVBNdFgxekpSUXNZZ2YzY0NRTWViNXNxNGNIOUJTVGZE?=
 =?utf-8?B?ODlNalZYQUdxOHVjbzRNRTNHUVVvUG1NM2gvbERsdzl2NUZvaTF2dGFlMGx3?=
 =?utf-8?B?VzlVZHdmMW9ST01LMlUzTnZNQlJjZisxRFlaQ0JRVFJrYmhtU0greHJvU3gz?=
 =?utf-8?B?em5lWEYzK2ViMDdjdHN1bUlrUWQ5SG1MNTVrWW9FdjRLT1RwWHhrSlZKa3Rz?=
 =?utf-8?B?TWl2UkE1dWlhbnRzVzU3NzN2bU45SXRyVi9sRFl4QVllUiszZ1lrek42b1dN?=
 =?utf-8?B?cmpsVEFKZURuR3BxMDZoYlJ3dDdwRXdRMXNjckRvWjd4YVg2VUltTlhNcTho?=
 =?utf-8?B?VnFWd2hySzdDYU1qalJxaHZKNUdXc3NhN3hGZkZNWllGeHFna2MzL3hRRG5o?=
 =?utf-8?B?Rnp0R2FqMFpLbmxQdVRwT1d2TFJ4emQ5V0JZMGJpMkhHa1BUMVJtN3VoaHNk?=
 =?utf-8?B?YlYxTFZHUlMweDQ4K1l2d2l3aU82OEhIcUQzYmptR085aDVWY2w4dUpmKys4?=
 =?utf-8?B?cSt4QWZwa1pJa2R6dStLNFdmZ0M4alM0QTM2Y0RoeHp0eVpMVkg4RjY5enRl?=
 =?utf-8?B?V2doc2d0UlhzRm42UXAramEvVUgyU3VXMDZMRy9MUzZZTTdjWmRoSzE0Tms4?=
 =?utf-8?B?RDlLRitDWFcrdnB4RE1WVWZuME9ZRURtVlFMYythMzZ0TFlRaTF6ekEzeDkv?=
 =?utf-8?B?WmFaMGdnaTVlbjdGLzh1WllhSW9TSWxqOGtrUWdOLzV3aUJtVVRuTkZOZDdz?=
 =?utf-8?B?SU0vdThRTHBXUnppZXpYUXRjQUdzbWhEZ29oa3RKNFJmWXlseG5xVmJOdklB?=
 =?utf-8?B?WmhJVFBQRTE2NS9yWDBMK1VXQjUxOE83TnhFUXBUQ0wwQ2RURTZuZkQvZmYw?=
 =?utf-8?B?Mzd6WmIwTkNnUGQ4cW55RkhvbzBIcEdBTVFkb04zNy85V2ZvQUR4RWZyRlJ2?=
 =?utf-8?B?MnoxYjBQeCsrTlJDU2RJclRWZ1R0NzdOWnpuOEtNVHY1dWV6WjlsZXV0LzFa?=
 =?utf-8?B?MytDMlk0MWVZT2pxcVptelFDWHlQZXZJN0pnN1NBeWw0VTlwNEVLRnd2Qm10?=
 =?utf-8?B?bHQ2aXBZQlFxNEE1U2JDVDlWQWp6dVRjQ2QrNjNDWWVJWWdNRDlYSGRxcVFa?=
 =?utf-8?B?dkRReGZJOS9wdjJaclZSdWZySGlNT2JMMi9DYzk5SjNYdzhsb1FFUmZTSzkx?=
 =?utf-8?B?TDB6djh4eVFuc3hoNTlab0xQR2dOVTJ3K0ppR0ZrdWRhOHpKVGUrMWdndm10?=
 =?utf-8?B?Y0FuTi9pelVwd1RDK1VwcjR5bVAxRXgxeUNEWVZsdWxFY204bmU0Z0k3b1Nx?=
 =?utf-8?B?bEUrT2ZhQS9QNjJld3JNM1VOandPVVU5SEFkRWVzZzhJc2U1ZHpSU04zN1Mx?=
 =?utf-8?B?Y2dURzI0Uk9sWDEzemtqdnhaQVZFREd1aS91WVB2V0p0OUpFUTVRZVBjR0RZ?=
 =?utf-8?B?TzJRMTFYUGlybmNYV2M3bVB5MVdvbmJHVXBVWFdlT29ha042czZSNS8wTHNr?=
 =?utf-8?B?WXNHMmVnSVJiTVF5SnAyVVV0dTU1ZG9LYjJuNG5OVlFuMEVFR01MVHRoTjZN?=
 =?utf-8?B?S3U1bE5jTFFpTmQ3ZTJWZEhFS2JVaVhpamlDUnA4VGwyV2RWOWlhSzlYY0E2?=
 =?utf-8?B?bDBnUUx1eHdNT2hmRGtRRHZzWnpjcWV2N3RXT0ZQckFoWitoRi9KWjZLTzlQ?=
 =?utf-8?B?TTBDRkErTkhta1RmOEZqNkltR0FkS1E1aHpEb1prYm83dEdEaFR4T3NsNk83?=
 =?utf-8?B?bmJUZ3RaNitLZFhOL05id0xVZmhZaTVmNW5QMXh5R3FMRnl6RWY4N25idkM2?=
 =?utf-8?B?a3hLdUx0bmVRVTdqVjgxL0xiZTk4NjNaSDFSY0Rzc1NKVFcralhDVitBL0Y0?=
 =?utf-8?Q?RhGZVgaG7xUMF2Dk=3D?=
X-Exchange-RoutingPolicyChecked: cDWQNnalSrRgNJp6dFQz9PTkQkjx/BXbhL6Q9TZasyNv8FfrOLSIuWyevVSeR4vlu3Qm2Jl+P5ShNNvivaLgTgfjeEAAbiU1Dtw/a7Egvztb+eNn0bqj2Fa9ABilW6Du7lsxKw2CBVEtQtX+X8FkUgg9bI9/BY+3mApRZBcyfczqD6bShmiXGe31Kojxl1b0uySfFv+CEuHvLYmFZtXwkpJFS6XQc578kpgsOYIF3rGTKl8mP9TkMXmizP8UYnuDTE1PA7NK3QMasK8JkHPjkqoXhRp7dzqcXRWdQcyJ+/tALK+DkbR5tekr21vC4QGyYRpg4ahMqoYVtrx8NXObQA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66859cb6-9398-4c8b-e3fd-08debbfc8390
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:30:34.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EON4FbvmlEailyhRqae5pmHG8LfOIDyE8tSG/cI4SMuehDWSGy3qZ99yS+Fzo8sXkLhgpXDm2P5PrhJ6KcoLHUO444WVpgMH27XGcdELByk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4589
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13360-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,vger.kernel.org,kernel.org,linux.ibm.com,linux.intel.com,gmail.com,goodmis.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,arndb.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aleksander.lobakin@intel.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 64E2E5E5EB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 May 2026 16:25:41 +0200

> On Wed, May 27, 2026, at 16:06, Alexander Lobakin wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> Date: Tue, 26 May 2026 23:03:50 +0200
>>>
>>> Without CONFIG_PROFILE_ANNOTATED_BRANCHES, the changes are
>>> very small, with around 100 functions growing or shrinking
>>> by a few bytes.
>>>
>>> I don't think we care much about the size increase when that
>>> option is enabled, but I do wonder what behavior makes more
>>
>> Yup, and even without this option, __always_inline is better here
>> regardless of how it affects the size. Such oneliners must be
>> transparent to the compiler
> 
> In general I would trust the compiler to make the right
> choices here, but as I have shown it makes very little difference.

I would, but I had a couple moments when it was uninlining
almost-oneliners resulting in several Mpps network throughput
decrease =\

Thanks,
Olek

