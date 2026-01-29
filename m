Return-Path: <linux-kbuild+bounces-10922-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN4nBQWxemk79QEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10922-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 01:59:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D06AA72D
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 01:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D13302E874
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Jan 2026 00:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8115B2FC004;
	Thu, 29 Jan 2026 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="BnWzjddS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB59309EE8;
	Thu, 29 Jan 2026 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769648359; cv=fail; b=MitzhLDl01WjaYHJ4Ty27PRDxHoR2pOFYNSDK2dua3OggIrXVcDTfb5z2aFFaaxWBYZ+ZEiUfLpTSuZ2kG9YwMAum5VVZQ0i26DXDXLg9b3MCnMpKGqn6aYtz2PAwSgQIx3hTzPbwPBj951iBOxKHLAbbCdNgMYIiudFJ08NJPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769648359; c=relaxed/simple;
	bh=ajHiITKNwaqWt45sf3arIGmrXCq/xrywlTazigouXtA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=dWJ3HQR6ZFb4E7diroZ7nwEHLk1MLPd5+YJSU8S0aZU7J4XuTtZZFzveobXvkJfmBlUhbOR36veB5zavBruRkkiTVbz75Z6dqrW+kWlCjmLuy+BUcP877mpi1YXi3pTqN/gQge+GLViHp5rm7soDkCBBWvtRFchHDoBzLwphhSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=BnWzjddS; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+1yvCkhhOWvcfEIxcciyHRYQKrPqnMdKfkLMqBNtjQDcGqmeK/mCDlMHbX/DxqbvVSLtwDVqQu7BwRhE5MncIjcrL8IO61errgM1w9M57td9qpsPGjb82X93lweI+cZj547ojP/Ow7+TXz0wL5EQiaA0Fx7fn5g0dNEaZhms6vHmifgw0wsMENe4BnX22w5T9cX52It1YXX5msMgU/rEipmssLc56eeIkX8OtjKtikZCh3MnHYQZCXjNKVwIjyaToR+RRaiYVUXLGfMOX7fPon6BVQOdCunbHfbtJFyi0bMQsi0uZfYShQ0kFv1nj1J79S2x4ux2lHUJIYmKSF+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmgT8f8tJlHUt83njXXQJqGFjhvlTgjICBxLqFZNNX0=;
 b=nsm4SDk4Z+HQtI6WeqP2Ebo0uIkl7/lyXrvi+BhQYRCEOrqXNXbfn0tJqGtPD/1g3FXR8c6FrW9WGJ8rIwT+ApfbBKjGFHs+w0HvLj9WiiMgRWQ4G8Vgo0uzGlqRwwvC1/vdjtRfwJAVjPAykk0HB207jrNOrFLnbEOJnGsx4XsJa6CW2xd1H6ZWNjtKMIMYNvNIro1HOPAcAgeYfAG7R55JQhE++uvONUvuzb+CP8Pbl9S3zWMB7ZNk+QMYhHbYrLYsZGAQEgMxALm5bg0JW1UNqLdUULHqZRmXw2E2yPEvajf1VA4l//Rg58yPaJWj08w8kCEGG9PkbrohcmHLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmgT8f8tJlHUt83njXXQJqGFjhvlTgjICBxLqFZNNX0=;
 b=BnWzjddSd7YYnjbY9OrsPYXIwyFuyjvTsqAqaplV6XwFq2nvjclGphfjpmp74yUabPxPEwjCxZIGJUZtkWTfAkmj7/sRGmCVBV5eMHtUaUZ6HfpTh2YR2yADRV5cydTB/7oFGd8bJUK++cW3UzyJRHUhWCCTshzQOxgZN1dLBAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5603.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:25e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 00:59:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 00:59:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 00:59:13 +0000
Message-Id: <DG0NZIBS97TA.1C8VH8IUQGR3B@garyguo.net>
To: "Nathan Chancellor" <nathan@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Masahiro Yamada"
 <masahiroy@kernel.org>, "Kees Cook" <kees@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide
 CONFIG_FRAME_WARN
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org>
 <DFZSRE43IHOU.2OZNE9IFIO3UB@nvidia.com>
 <DFZTOMSDPOQM.3QW4TZ52N4MKZ@garyguo.net> <20260128220217.GA2129077@ax162>
In-Reply-To: <20260128220217.GA2129077@ax162>
X-ClientProxiedBy: LNXP265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::24) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3df697-9fd2-4a2e-1bab-08de5ed19eaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUwvODB4VThaQUlJN0J6cWF0Y3JTNU02RmVvYnZOUnZMZnlnS0gyTSt0V0Jo?=
 =?utf-8?B?aDJlZlNYcHNrYzFIYU5wMVViMEVUR0U5SDBKQ3piNk51OFRTeVREd21GK1Bu?=
 =?utf-8?B?MXN2L0Q2LzYrMTZtdklOa0dQaVY2dDdpT3U1NFhGZkNaZVNtR1AvWjJiUzBr?=
 =?utf-8?B?cGZicmp4WlFkLy80czl3NXFGbit6S3NFOEFQaWI2ZnMvdjREU3dYcFVGSk41?=
 =?utf-8?B?SnNuVEgvWDdocTF6WU5oTGNReGEzRTZSdDhJZEdXSHY2WTJEbm9IVk9PQnhN?=
 =?utf-8?B?Ymc2dnVya1VmVkwwcWUxR0NlYzJua0k5ODZrdlVPMmVaZEhEWURYS0xLZ0Fm?=
 =?utf-8?B?ZkpzSjlhakJ5Q3VOdmROVVJPbUZRLzVxV3hSeTFaOUNhWk5sd3RObHRNaWlZ?=
 =?utf-8?B?NUIrcmU0UXJMbGVzOTl0VUZLeS9LZDNvbFkrZGduLzUvdDZTL081Q1lmaG45?=
 =?utf-8?B?ejdsOTViRTZrQ1pqZUkxbHVXSXdGQVA5Z3E3TzZZNDNSVWRCZnVrYXB1WVFU?=
 =?utf-8?B?ZXA1a1FFTTNhcGNYUXNEak9UU3dEY0YvSUpGbHptb0xuSTJ2bUFFQXNXVnJu?=
 =?utf-8?B?ei9GL3FMNFpiVlJwT01YbHkvTU9CWkFyOWpPVTNCSGJLaklpb0M1WHM4K05j?=
 =?utf-8?B?bk80N2JGN0dBVFQxQ01IOFRFNmdTdEU5R3VzTnRuT0JMejFPMGZaRVMzQ2Zi?=
 =?utf-8?B?ZXo3TlN3eEJiNFgrT1hONmh3UjlhZXF4Q0IxaW11NWxRMHpUTTdkU1hVZ2Jm?=
 =?utf-8?B?ei9ld1hwcjY2SWx2RDRBbGJqajlZOGxlOVpOVkpjSnNvVXplZ3ZjVnd1ZXQr?=
 =?utf-8?B?SUxVanNOWENoV2NvQVZKMGlsQ01oU1p3aHdtSjRTaFNQWmNzUGVid1MyeE1a?=
 =?utf-8?B?d3pNYTZlTGx3Yk1FQlUwWWp0R1ZYUmR1dTlqZVlyaVNZOVQwWnducnFua0xI?=
 =?utf-8?B?dCtiVzA1Q2kxT1JCcVJpb1Q2WFd6akl1dGlyZE4vaXVPS3FlQUpOVGN2bW1O?=
 =?utf-8?B?VG5ReGZDMk04czdpRXJXRDRnYmxldDUvMG9zTVBsS1hRc04rc2YxME9UTW51?=
 =?utf-8?B?Y205TGtBN2VPb1FzWkNpekRNelMrUFV1eENHMkc3UmtPTHlZY2hmRVFTNDJT?=
 =?utf-8?B?VUN3eEpxeWIwazl1YW5LYzA4eW1pTjVseGdqSlFtWnVJNk5sS0MxSXBuSEN5?=
 =?utf-8?B?RThjWjZFNk0xRnFhZHptb25IYmsyUlpPWTB4M3JRcUNNamI2Tko5b0R5TnJm?=
 =?utf-8?B?OVJ3S0V4MTBxWTZEY2llQmdkRDdHR0xSVXdvamZHUEg3WkxJRlRnSmFIVlNX?=
 =?utf-8?B?S2tuQnYxR3dKN29NaVdmd0x2d1ZEKzFQaGV5MFRubFdsdXFNNDhzOVlkWU0r?=
 =?utf-8?B?RHhNQjViWEExT2JiYWp5TjU1S2Y2bG1aY0NVaVRlY0FxUUpQQSt6VkwxY2lU?=
 =?utf-8?B?SC9oYjZsM29NTWEzTEVqcEdXbE9nTEJnSm5yc1lUM05ieXNtS1lnR2pqcVh3?=
 =?utf-8?B?Ly9xeTZDVnlQT2tEUGJCa0dnRG8xQlp1bitKOUVnRFNySitwb2tSbFZxOXUx?=
 =?utf-8?B?bTlkalZtSHZPQUJIeWtUakRFNG5zTnRScHpuL1kxVmpHRlZwMHhWTmg5K0NI?=
 =?utf-8?B?ZzNUaWdFZ29ySlNLQXdhU0pvdUVOTWN6SHM5Q0lrVytSd1NKc0NDR2hZZ0xD?=
 =?utf-8?B?QWtUMHQwU3ptTzJlYXh1eHFLWVJoY2t1aHI5VjNuRVZTM1BJMkNkbDNnc2Vu?=
 =?utf-8?B?ME1ERE9Xbkk5czU2KyttYmcya29wR2pBanhLRW9YVEprSDZEUGpSNUFXQjNU?=
 =?utf-8?B?TUxrS3FXYzVtRWxMWUE5cEFNYk56ZnN2bmZwd09YQ2lYbVdEcFh6TGNxdFU5?=
 =?utf-8?B?aGJZbm81NnNqTGI1NGlmbUsxbWpRZEM3bDUxcFk5MzJYWWdZcE9sbU03aFdP?=
 =?utf-8?B?SnBkdW1GZFVjQldSeG5maHFKWU9XSW84cE1FZTl2anZYUDU2Yk0xN2VXRWxs?=
 =?utf-8?B?aDF4MUFWdXE1b2Myb1Y2Tmo5SkpTU25aNDdiNmxnTm1JWk91R3F4cDk4TTBG?=
 =?utf-8?B?MFd3YjNDOGwrbnRBL2pNaWNYR1hvQ2ZZTzFlS2xQT2x6YjFpS1hQc3Iya3dw?=
 =?utf-8?Q?JoOc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWEwMVZFZVVmVHVHMWlUSGFSSTZWdjRMYXBpUENXa3BQcXJaMktFL25RdjRY?=
 =?utf-8?B?OFVGNWdpcXlvY0o0bFRZeitjbEx5OUpNa1BFaEVDSm5reS9wb2l0WHJuSDVQ?=
 =?utf-8?B?Um1WMldzZ1N2Yk5ZcGhmcWJhcUNIeEcxZm16dU5wdy90TFRCWkNPcUlrcm8w?=
 =?utf-8?B?d0xHcTc0Rkl0NUxleG0xRUdxd1cvRzhEZUR6TStBNi93Q0Q1S0tWbUZ2cmtz?=
 =?utf-8?B?RlBIZDE0KzRkNXRmNUV4ZHI0SmZEaHBaK0l4SjIwVlRWbGlCWWR3U3RDQm05?=
 =?utf-8?B?Smp5UWFQQlU1c1Z2VmV0RHRTTms1QTlVQWJteXVsZjQ5Lytkclp1aDZDZFpt?=
 =?utf-8?B?eDlieHJGUFRaK1ZJZXBJc2xIRHdYbnNUcGVEWE45QWtvR0k5bFVYM0Mydm8w?=
 =?utf-8?B?aktkS2w5OENkTm4vTnh5Q3kxV0hWQzg4WC9abThzNC9relNQekFYalMrd0Ro?=
 =?utf-8?B?aWVkaERPSWVRbzJad3JqcEltdFNHdFFOZkwvMzlXOVVCRWV3Z0tMOGJhMEdX?=
 =?utf-8?B?Nnl4L2pOdHlhQzZQSHpDSXlXTjNDSlFQRWdNOWVYV0RHS2EvTG9Jd09WOG1o?=
 =?utf-8?B?TmpLazViS3pMTXFqdm9VaFIzYXZBbGNnQlJzYWw4Y1ZQM0RMY1YxZW12cmh6?=
 =?utf-8?B?bjJldFVGRWc2UjBjVDVPeEFQZzRhVjlnNW04MUlWcG40U0hQNzhJdlF0SVF5?=
 =?utf-8?B?MFA1b3JXL3FZL1FEald2SGlHVk5IQ0d6cmxuV1ptSHRJaXlDSHVEbHl0bzlW?=
 =?utf-8?B?L0Y1KzF0MUxGbVh6VEV1SXFySVFZVjYvdU01OHZRYldBVmcyZWZjVXlrc2hF?=
 =?utf-8?B?Tk9pQkFYK09xdXNjajdYSUExU2QrTkdmTjlOUWRERW9CK2JhZmVFVFA0NXdq?=
 =?utf-8?B?VjA4dTFGYk5VUkQ5N3RuNCt6bjNTanZpSS9HdmJvdjYvZHkyQTEvTDNxVkE4?=
 =?utf-8?B?WHF5OUNxYS83djJJbVU0UUFuN2d0Yk9DZ09vMnR5OGJzVmNMdUhCenNWZ3BX?=
 =?utf-8?B?eVhoQ1pnS0JTN1JtaGRqWWVqdjk5dE82NFpycWl4UUg3RUI4QllYYSs2YWs5?=
 =?utf-8?B?Yzd1b0F4U3dZZDlPUm40VlBQSWhwOVdxSTJJMVArZkxVeHpSSmszR2l6U3gr?=
 =?utf-8?B?VzhCSCtFdmtJUUQvZDNWUWwrTGV4UkFUR3BkOFk4b1JlZ1huUE1PUWhhTkVH?=
 =?utf-8?B?eEJhM2RTcHV4MW5oS0RwVTVQNERveDlpK2hOL0VoSHQ0WWVHR2hoUnNUNkRE?=
 =?utf-8?B?T3hrRmVLMmFWbzNKVkI4OGlyeE44YURQOTlRc0E2UktSTHFVY3NRMW81TitI?=
 =?utf-8?B?Z0ZnU2ZGVk41U3JlSFBTNVVrTytCTWpWQU41d1JtejdtQzg4OGF6NmVyZjRF?=
 =?utf-8?B?Kzd4K2F2TlBTbmhQQTRQaURkRHQwbFZEOUVuQ3pTdTZ3QVRYY00zQnVPalNL?=
 =?utf-8?B?OWdKcjhBMjBPbUtkNHpzd2lyM3N1eDFSVWNWL3RwWlhnb3JVcnlncUt1bUJ5?=
 =?utf-8?B?alphczEzSlVXaGU4Rmxack5USTlmNnZhUzZkem1pdGtuRkhPR0ZURUFMcm12?=
 =?utf-8?B?UHg3eWJuZmR2S0RGU0UzdHVpL3Vxa3FiL0ZtS2VldmQxbzh4WVljMzhiN1pk?=
 =?utf-8?B?ZDIzYVJ3anBkVmFMVUFnbnRMTXNqQ2RTZVdIOGY3dnFtRHZNVlNabzNCV3VM?=
 =?utf-8?B?b1ZzeHBlRFd0dG9iNlNwWmZqeTVqd012amNnQk5nSU04V0YraGtWY1dONjRL?=
 =?utf-8?B?M2RZOEc0ZzF0eG4wVnNqNGpQT1dQdXNjc3dtbU1mUERCV0Z4Zi8reXhlRlIv?=
 =?utf-8?B?cmw3ejVvZ1pPem85dFlkSU9MamNxeVhzSjBrbVVWR09kelpDSlh3RVBRWGlm?=
 =?utf-8?B?L2o1d1JPS2w0K2NsK1Y3cEZQcGNMOGJ0bzVGSlVkenRpMUFhWjRFUlc2OFRZ?=
 =?utf-8?B?YmVkYVVtNXVvK3ZQMWdSajBESW9VdGkzK21ZVXJiNFpFSFV0akdITGFSN2Q1?=
 =?utf-8?B?ZE95Ylprd0U4QXFZYUFzUndmMlgxZkFwZnBHNU85NEUyK3IrOHZxMGtrbVRP?=
 =?utf-8?B?UzBwa2lCQkxYUjYwOTNTN0YzNFdwOElpdG9aQzNIY1lZOWFIU2tmRTRYWHAx?=
 =?utf-8?B?Mm1nTHRKOVVGL0prU0VsT21KREV6R2FNUkNhN0RqUWJsQW1nNVpDdld4NkE0?=
 =?utf-8?B?K2FhdlF4bW9BZjNMdTc2bStEL00weTg0eEpGdGEza3RVbGQyMGJQWjZoRk5F?=
 =?utf-8?B?aUExcEpKWHhjWit3cExEQjIrbWNpTXVycjVqSjkxYjhTMkovYjNoTzJ1dFYr?=
 =?utf-8?B?WW5KUkZqRVhIaVpWTDVBR3pjNW5GbjhzbWFPNVU5OWNIV1NSbGVjQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3df697-9fd2-4a2e-1bab-08de5ed19eaa
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:59:13.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3YB/o/xMem6N6L3YB8EeJLyjTT/0i704GMY25aH59npojArzGAtX4xcTBnslo/HDq36GWGNaD6bYDcg1sqo9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10922-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,protonmail.com,google.com,umich.edu,weissschuh.net,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0D06AA72D
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 10:02 PM GMT, Nathan Chancellor wrote:
> On Wed, Jan 28, 2026 at 01:14:27AM +0000, Gary Guo wrote:
>> It might be possible to do more detailed analysis by checking what is us=
ing the
>> stack (e.g. perhaps recovery variable -> stack slots using DWARF if full
>> debuginfo is enabled, or find out the instruction that first touches the
>
> Yeah Nick wrote a Python script to use debug info to give a better idea
> of stack usage to help us debug these warnings from clang:
>
>   https://github.com/ClangBuiltLinux/frame-larger-than

Tried to run this on nova-core.o, but it didn't print anything apart from
function name.

I've made this change to allow it to recognize mangled names but this doesn=
't
seem to be sufficient:

---
@@ -58,7 +58,9 @@
=20
=20
 def get_name(DIE):
-    if 'DW_AT_name' in DIE.attributes:
+    if 'DW_AT_linkage_name' in DIE.attributes:
+        return DIE.attributes['DW_AT_linkage_name'].value.decode('UTF-8')
+    elif 'DW_AT_name' in DIE.attributes:
         return DIE.attributes['DW_AT_name'].value.decode('UTF-8')
     else:
         return '{anonymous}'
---

Looking at the LoC it doesn't seem to be too complicated so I could potenti=
ally
integrate some similar into klint. But as you said, it's hacky.

>
> It is rather hacky and feels like there are a number of corner cases
> where things don't look quite right but it is better than nothing.
>
>> specific stack location and map it back like that), but doing so is quit=
e tricky
>> and the marginal benefit is less than pointing out there's an issue to b=
e
>> investigated in the first place.
>
> Does Rust have the equivalent of '-Rpass-analysis' from clang? There was
> '-Rpass-analysis=3Dstack-frame-layout' that was added in LLVM 16:

No, Rust doesn't expose such mechanism. As a matter of fact, klint is backe=
nd
agnostic so in theory it is supposed to work with rustc_codegen_gcc, too.

So far I don't have plan on adding LLVM specific analyses as doing so is qu=
ite
tricky with the modular backend design in Rust (I would effectively need to
replace the entire codegen backend with a patched rustc_codegen_llvm).

Best,
Gary

>
>   https://github.com/llvm/llvm-project/commit/557a5bc336ffb9b03c53d4d13fd=
8f0bc9418ec96
>
> I assume that could be used from Rust as well since it is in the LLVM
> backend? It does not necessarily show exactly where the stack usage
> comes from aside from variables and spills but still, some information
> (especially accurate information at this level) is better than nothing.
>
> Cheers,
> Nathan


