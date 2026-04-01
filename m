Return-Path: <linux-kbuild+bounces-12522-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kwg4GfApzWn7aQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12522-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:21:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C998237C0EB
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04138313A666
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 14:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC9C451068;
	Wed,  1 Apr 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zd9VqGr0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022131.outbound.protection.outlook.com [52.101.101.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A356144D039;
	Wed,  1 Apr 2026 14:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052664; cv=fail; b=p/ah4PYgyY5xpKjt9DrXwrBdOliBHEqdYBlC931ifT5jWJ1xJlLg3pGSkDHkyeIwMTGH9xAnVByMh2BjU7zDggyjF5trgSpR8sXe9YMBI7rVj1jfCS0oZssQc9eyEKGypvyD3QIJGwA9D1ZlWgIo8Bp0IWfykt8qayiXZpPoxvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052664; c=relaxed/simple;
	bh=Mv3D/NsPQXucDco8XJZ2rGV+WvNHcJUKd4XjwCUbr4w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=f2gwG3VtkS2fa603JQrU0X412OZ+EmCue3oDlD0VhoEFHleYCMQfpyLoro0Bhgtn4v0vprhRD8ImeH10F6eNGKsIHIxud/x1PbyRxr0E1NupaHENqPd6NrUrABX1s9EEyIQgSyLyC8GktE3tWX7HHPjN5LidSorf0L4Nj163haU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zd9VqGr0; arc=fail smtp.client-ip=52.101.101.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzLFrawO7ITAXuj81RrPgIbhl8yrRfvMgYTgdmwA4CfoVRWqD+rhoXh3d4VMV7DnY+3gpaoU8x7xSQpwjte4GSG35ENtStmGG0NZC/L462FbUO5iMYYBSw0Vu0UX3yiDnxwtheKXKy0dt295sQ4gACRpi5skxgGs5Y3ehTvfizTOxlaowpRMtfAYGxcZG4CDmLCgqbLY8DKOaQZDcnhvqHayra1p3cfW1EoQ0iydokaW+cyYMzMYgIBK6AXBzS6JCun9jdrunh9DQhgFe/QS6DYc3ZFluCgK+BmJzewtMysrIEOz9PiBYmVsJ49p37AgAm1pU+/X85wzJnuoveiWkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTAOait/Ei6XeI9JIrslmORBpM1kCqoz1yiKsUX9CwA=;
 b=knE0w9iqJVJLYEfxS1LpTBxeQcoI7wTLDscajvMwb7Xw+NJIkvhJQ9QpEEMA6VUo550gnEYrezNEnuaD/8VR2/voKwX38994yPxSwQHqI0c0MQ/R5GR/hh+LuwZEQnJxrSA9zu+JeKaSfKhgqXs2RtFl3AJw5HSdnhYlwZad1aLKTmoKsibdjItQuCZucU1Yuolouk8Jea+NwyoB6vl9koqmFu8ptqcJwkMcIDyVaUI+2v8kvtd72VTu1qfC0UlOEBm5fsa/dxLasQ5+BMuSunh2XVPrj6R4oWsUA3q+nyZ1tjbqtfSLcFmeCBBV+mwlqCrFibsi0gKQ4hHod3UPEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTAOait/Ei6XeI9JIrslmORBpM1kCqoz1yiKsUX9CwA=;
 b=zd9VqGr0q5lMIgS13UBxtIdSrJqMERwYyZgCI9iglAk6deb1itqWg4HRvbbTVERNkOiyM10etI8jazF/oJm86svr+zfrbUO9ukrVUDRcz6okoTn0Q1e/9topOm3aiFt0P044KWbtiyq9dn2PMvo4dwjxDNiE8Nnd166cPBSArHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3423.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:199::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:10:59 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:10:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:10:58 +0100
Message-Id: <DHHVNHVHWO9O.1NCHKQ8SDVNAF@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0
 `split_at_*checked()`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-11-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-11-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0303.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3423:EE_
X-MS-Office365-Filtering-Correlation-Id: d4f41b4f-3584-4030-0fae-08de8ff87fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oUwFZpcO8JmYscJk93cfsLhQD8ZjFrOMoVhbY6FGw8fx2cfqaAIEWlYi56sY2iI3LCmIhOv7Xtq0KVXrdGxQ8JXuMrI4eBqipgEtyMgV5IpohzHh4lzCFDRo+NalkpkdlVk9IuzaCvXB6gbhUbSAAPTRt3bve9pzaZg9aePdRuOJKL5lyMRjKh+tQQz2iuuRwtRocaMYfWeeMQ7gzW1+D9H51mt79xfE8fet54cBEyTvULAXUa6AA14X9OzM9sZ9LXFklb0gsGHAMxvoYXgTJdt6i14bi9uV5Fo+HsjDWbJsSTIWWULf33HD0yhWiIT3x38QpvBDyhC31q7zVifQV46/PhoOAVtoT78hXThqbm8aM/vESq3WJtV/cORDpyqDe5QVoLzoV5LOE/Lm7P3wumU8kTARy4FFzOpMKa4CJXmtcAvEq+WXLWLlPufc1AL/+ljeofSv6UqQCjW8ahKf/LdeJ99TnsbfWLFY7FM4r6GRB/Y1QzJL7+JNud9Cth3l9GglYQYtERGKtyPp5xJ2/Fs9hPpq2+Ntir7bh7gJdTps25wAFIUSyuhC2bY6FVuy/9ad5wPLQf4Hoks2UUyQraDOICFMHdMq84vqT0caZRwJQeVLA/y9YOW2U7hk7qKK4s672FjDOEp3+Sd5nL4PkHuq6m0xgu214F2ltRTmR9tDEI4UOsuj//CN2+3O/MgL2OD6eb2Fw1AKtUlohEEK8ZU5cgavXxmwCusTrZgDj1xPg83CWVRDS0hX1P7yCR31exTLg7fvmh3NB86mn2OcDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlBXSmJQUkJQTm1vQlR6LzlhTmEvZWVkNkVLUXZsNGpDaHRFVEsyMHd6RW9Y?=
 =?utf-8?B?a3JEbG5tb3ZpUXhicXE4MGVVWmx6ZEVpdW83ZHJCNmRWdWtiV2VNSi9UTmRU?=
 =?utf-8?B?ZHNUZ1RMb0VKMmp1dkRXUDBDV3o4VnhDQmNubUtVNmJoK3g4bGZMaDdUS1U4?=
 =?utf-8?B?blhmWW9kVGp6dW12UFB0emdDUUQ5dGo4QW40cU5FKzZqa1VMUm04aDI0MVdu?=
 =?utf-8?B?TnRXSUgxQWMwTm9KWnM2NjhLV2JvR2JhR3dhaUZOeVNCYURCb2VqK3dhcXNC?=
 =?utf-8?B?MXRIVHVyRHJITXlQWGV3aHJWT3ZyMFp0dExldno3STliVGt4SXJyQnpLazFu?=
 =?utf-8?B?U1VJNEJucTBKN1hPa00zckRhWUZXK050UGViaTlqVHZSWjRCK0lmbHAzeFg2?=
 =?utf-8?B?VXM4UFRSWU8wVG50VE1OOGduUDRydFQwYVJNL0c3dWxsUkJIL2kveC9wbU10?=
 =?utf-8?B?WGhLRmZMTjRBNWN3dTllaVVDSHVhTTVad1ZpZlJESHF4MEVxWEJ0bnNBYi9S?=
 =?utf-8?B?S2FTV3B2ZXdxZXgxZjFBaUpyaGFWbGU1UTAxdzRnR2tNc0c5WUJMSDNreXRG?=
 =?utf-8?B?dWFHa3llai9GVjNvRklvWS9zREI2T2lFM0duS0cwbGVEVjFpSUprQ0o3cmk4?=
 =?utf-8?B?b0tTbWh5ejY3ak1pdmhMcytzbjJ1WGEvcmxsVjlGT3FmY2VUcW9yWERqbjV5?=
 =?utf-8?B?dmlId1k1aXB1L1dHK3BJd2ZTU1ZYekFvLzY3RE1KOE1TWHNkTGZuSk5vQUty?=
 =?utf-8?B?ekR5YnZRbWJqQ2duWlFFNjh5MXg0dUZlYUgvNVF1Y2N6T1BaajlmdVgrOVE1?=
 =?utf-8?B?N1pFeXdQSVQvbG1BcGk4dExxcTV5ZVRuOEs4TFhTSW5Kd1Zta09nWVpHcXM2?=
 =?utf-8?B?VjZQa2N2YkdwbDNXRExJMjNoUVhoZ0tJMm9saVhUQVhGa1FTK09KUmZReHpl?=
 =?utf-8?B?L3pzd0k0Q1BQYStBcnI0SmhQcnJpSytyeGZscFFhL1FUWU5QYWl3b3NOYUEy?=
 =?utf-8?B?WVRCMEhMWGpEYit3TThOLzVXVlZmc2FMR05Rd2owaCs5d05nTUhMZGlNMDh0?=
 =?utf-8?B?QTNWd2NOUHZpRFVrTGVXM0RqQ1JPdHM2ZkRtbFdnYW54SzlXVlNrVk5QRXJI?=
 =?utf-8?B?MWJjWm4vSFg3aldRVzZkemZDam9YSHNZK0JWSFJRMjh2cTcycm1LTVZIZUVD?=
 =?utf-8?B?eitkZVd3QVBsTnpJK0V1dUpWVmE5VllDQlYvdm14bFdSbjlvVWtUenJUUTNt?=
 =?utf-8?B?OTNHcXorNVlZYnFPbjBBMzY1OUh2Um1hVUF3Y2hHT3NEbzRWVFRrc2ZEU2FU?=
 =?utf-8?B?ZzZzSnJtNDJ6Zmg1OVY1YmsvaXNtengrVDJOMVVoY3VwalUyNVZua05JTkpY?=
 =?utf-8?B?M3hjSGVHYi9iUUJ0SVpKQzZvTHJ3ZWFjQk1odUdMSEV2TFlCMjhqdjk0VUQ0?=
 =?utf-8?B?NkxLSjZrVGZ6bFFnSnJTMk1KVlVvRGY0bGxHV0t6Sjl2SFhDRzBPZkZrbEgx?=
 =?utf-8?B?VFJ4NHYyUVpHUTZVNFJKUGFVNE5XbFpzdDN0a1lXbEo5VnhYTzZ3RFRYcml3?=
 =?utf-8?B?eXI0eE5zVmwvOWNqVkJmU2ljUDVxNXRvTDNKSkJJT0tIaFQ4VVdybmJ4T3Bx?=
 =?utf-8?B?c1ZqcEhRcm5TNktRdU9DTGY3bU5aNTFCVnJXd0xuZGdXRTNObGJvV243TlVx?=
 =?utf-8?B?Z2gzYmt2NTIwYkx0VFpIalI3L1VOdG52djRjb1d4TW1MbzVrak5nL1NzaVVR?=
 =?utf-8?B?aTd0WUV3UjV2T2tLOUx6QU1Ib3RGMjRVUEVlUDM1ZE1XZ2t4RHhzeDM4R25Q?=
 =?utf-8?B?Yi9JR1pveE1zUXozUS9OWTlRSTFuTXRIb2ZHcXBRVlR1UElrZEd1eERCVjJK?=
 =?utf-8?B?VmtHT01udTNncU9QaXpic2ZmK2dFUTcxeEhNOC80QmJmSlBYcUR1VURtaVU2?=
 =?utf-8?B?LzA0b0Y0czBSM0x5ZExBTzRCY1BsQUpNcVhCMmREUGRuU0VrRmYzZzd2ZE1J?=
 =?utf-8?B?RmIxN3cyUVgxYWpodmtmMzB3NUxxZEUyV2lKZTZ0UC81eTI3QSttS1lkOG1D?=
 =?utf-8?B?TUJUM1RxUTRmYS9LMlNhY3VpL2RmTGFVRXlyWTVCVnZKN2g3U2NLalRod1Ry?=
 =?utf-8?B?TXpBclBRSVVtM2drS296YmNtYWwzaHdsRU9QTGxuaVg5UmdYWGp5VEdPUkd6?=
 =?utf-8?B?NURyY3J3ZSt1ejFpcjU4YjRxdmZNSHlpYTl3WFNsMEdMSG8rZXcwQWY0anRX?=
 =?utf-8?B?eC8vdEhVVjNzaUk5NFJ2bEtFRGJ2S2cwSXc4ZTdvYnM0V3RoNFlzNkNXLzB3?=
 =?utf-8?B?dXRUSURadGg2R21vbDVwb05TN0Q0Zk5aRkVXRjdtanlvMHhWSW85UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d4f41b4f-3584-4030-0fae-08de8ff87fd5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:10:59.3333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjMx10W9Vb+bESz+ezSQ5YMIm9X7Bippdaq6R6jKLekvr5BkMfovlNBVK1T5rrPl8q/bReAcgaNWYrLS2M3+JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3423
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12522-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: C998237C0EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> `feature(split_at_checked)` [1] has been stabilized in Rust 1.80.0 [2],
> which is beyond our new minimum Rust version (Rust 1.85.0).
>=20
> Thus simplify the code using `split_at_*checked()`.
>=20
> Link: https://github.com/rust-lang/rust/issues/119128 [1]
> Link: https://github.com/rust-lang/rust/pull/124678 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/transmute.rs | 33 ++++++---------------------------
>  1 file changed, 6 insertions(+), 27 deletions(-)


