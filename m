Return-Path: <linux-kbuild+bounces-11081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Lh8EBa5tiWnm8wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11081-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 06:16:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92610BBB7
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 06:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E251230015A0
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 05:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFDD24679C;
	Mon,  9 Feb 2026 05:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="MxuHyUQM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021136.outbound.protection.outlook.com [52.101.95.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5EE220F2C;
	Mon,  9 Feb 2026 05:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770614184; cv=fail; b=IBcZrF+1ddmMiUsgz7Ld5rUinGOSCcichhtTNeJ/PsVGRFSQYkMxSdxUWlxOKosFItwBktgE6zXGb1tebiuEST8nCfz0zyTL4flUoGXSy76DEEV6c1eOAHzgyZ/mqfTnvO+AZAlwzSJw9b8s68kQgDgx5McAeESzekklEt4GH7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770614184; c=relaxed/simple;
	bh=NMWzSwFT0/wR+BYsvEPUfDTjg8ObuKRbKugfweqsq+Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ooCI9ZLNXQ2+ZhV/+WiPQ10QClglHlcp5tBGOGNZ7AAL8aTzfAvToG6NGA8p+y7/IRzqGPZwU6d/qwxtzlaKv7WhwiHsQxlgwSkg2MADCERaMwhM0M8lw0G7+FqEIVm5GzQaNhUeV6MvC7+FeaKsPNXki984De36KD1R1AWr/uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=MxuHyUQM; arc=fail smtp.client-ip=52.101.95.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbaSA45p4JcGAGSFCCBEfbaFgQoEvzHx4P9w95Wl5zAb4VKHhL3b01lvpUqG4BzaGu2vNs0ZJn3/9ElYfZYQzuJtHOdMtZh4FyIHYeVvdp6gV3mzWAAJy76pnzLNEpGD372zqT5K6QDFVkORX2ar6oc7U2z6SqFYv1ATXAEFlH0XjydERFEbyCWFDSpssq65gDF82K5fSHIh3YCQH0WEYvuuYMvWRHAB/ZvcS6iUWGS53HMh5sOQm85LujwUt/yfkmGeOXCS+8SD8qpz0HNFYo+HXkMWfI2uUJ9IzFYqRfFcQ6eX0YwS0iEBayWqev4aXluJJfWyjDPybNfzktBjTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqNmWm84hiNXpcgMJs4JmuoUJLlmhugNjHeTsBa23r0=;
 b=IC6g8hnX8F0OHeUPbyzzJ9EyvYCuIXD+P3ihUfh++EcFLkkAuHvI6YnsMCBDUXUwtkNO0aqXU1ndSBlQAeeooggvNHhiD30jr3cWF+wDwrkLPcaq4OW4N+rMspM4Tjc9SoLcbZQzk4AalTH/y9d1Y0KUt/8AwMK0IHlWTsJHRO8b93f6k8xqA5Roal5ViNRI64muVCUZCHxZOxSS1vl555qzgHCAz5vztDOsCYK/j80s2s7qNBlhh4+XXxjMiCz5cW2DfehcQpTGOVFzysYId0rMJhEVm10q+vGZvGI0PzTYF0Ig4s1lrWhSN9hD8ixWjMysfnAWeh+IpizTw3OjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqNmWm84hiNXpcgMJs4JmuoUJLlmhugNjHeTsBa23r0=;
 b=MxuHyUQMvBVr0QCQLHtxseZw3NxabHPnl7zVExQs0VpHN0ok7grqT1kPDabXEkj6RVmZoQpjFIwdJP4laA2XIi/WxFUWDdRGa8veH9Abd0nNaARuhqIcvx2t7iplbULkRizVhLVwyj9YYtghZhpQiZStzKJXxS3j24dR8OGoZbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5669.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ad::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 05:16:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 05:16:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 05:16:11 +0000
Message-Id: <DGA6C99D24FV.34J2JWKWY08LS@garyguo.net>
Cc: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Yury Norov"
 <yury.norov@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Yury Norov" <ynorov@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
 <DG876SZYRBXB.CO3YI3HOE3FR@kernel.org>
 <DG87KRN75MKZ.1O0TZI77MLIBT@garyguo.net> <aYgmENPRTdD4wCVF@yury>
 <CANiq72k4D0ZPDzBCHY7xq=qOmERHk3e7P8CcKtVHjjjOQhJ+2w@mail.gmail.com>
 <aYj7J0yTJtYlxLt4@yury>
In-Reply-To: <aYj7J0yTJtYlxLt4@yury>
X-ClientProxiedBy: SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) To
 LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5669:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c506ad4-bc62-43c6-73f4-08de679a5c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGxwUTF1YVozVEkzTUlWblN4TnJQWEF1d2NoYnFZYlZmUGtSRGhSSmd2UVQw?=
 =?utf-8?B?Kzc0Vm5KL2ZxVWVMWE0rSnNkdEpCRVJOOEF0UVF1T0hKTTFRR3dSVndGeU9C?=
 =?utf-8?B?cXQ5SUZ6b2JqMTJ2SVpSU3d0OSt4K0JUenA4L2JZNm5wR3Y0dkZpeUNVYzIx?=
 =?utf-8?B?MVBRUkRFR1c4ZnlBR0NtdWhQZmIwZzV0cUJIRXZZN0JrWnlFTm1RbGF6T1Jp?=
 =?utf-8?B?T2gwTENGZVZHbDZsbEY2QzhwT1BVcG9Zb1Zqbm1WcFZrbWhGaFdsMmpyOGh3?=
 =?utf-8?B?d1lwQU16Q2ZFM1NQSTh0ZzFhZ01YU0JnQktiZEpTRktobTFYdnEwZFNzYkpZ?=
 =?utf-8?B?amFkR1FJMDBPOTZmRXFtOXpXUVdVNXBEZ3I0eDVhL2hmallrTzRsRTlQd2hY?=
 =?utf-8?B?S2FQWG5aU3pJdzBGYzN3SWZlazAzUVNpZ0dvUmM4ekdsZklmdS92YzFjcE0z?=
 =?utf-8?B?empoQU1jR2Q1bDFJcmVMeE5kbzBpaldoRnNieFp6UmgyMmZ2bXZGUXhaN0xw?=
 =?utf-8?B?L2grazd3blBjakVLR2ZYTmhld2V2OFJDUjU5cGtlOUdwS3lkL2tQNFdiYTUw?=
 =?utf-8?B?S0xkbHJIc1pCelZhWCs4ZVY5RWJLV3p5Q1hBNkNiVER6cnJidFdpbU9kd2d6?=
 =?utf-8?B?VjFmcGFlaUtqdXRmSDdZTmhBMEZTUjZFejVBaVBObjZJT1Q1Y2RZbExtcndK?=
 =?utf-8?B?MmZLYjlqb0V2Q3pMNzRFWVEvaFZGZ08vMU1hRk5SZHFpRnZVcGZ1T2JwdTh5?=
 =?utf-8?B?U3Bya2JMdnkzUW9VOHNHV3ZNSXpFd0ZZTGV2cUlwdkoxbHgySTJ6c2tWMms2?=
 =?utf-8?B?TTBQbWFZLzNRN1pyYlV3ZllrbnREajAva016NXI4c3VFOEhVa3ZQVmt4RUVG?=
 =?utf-8?B?c3NUSm9sSGJ2N2V0NG9sTkdoOWZmUkJma09ZQ2hTNWxQc1NzN2QvRXFKVnda?=
 =?utf-8?B?QUIvWGdyU3A4NGJNN2QrcUZMdWw5SkVmalRtRnhENERnQXMxemI4cVQ5dWZO?=
 =?utf-8?B?bDZOblV3UXAxMjZHbmplMzFBVngxQ01tcVhNenVMNFI5K0l2TFM4UkUxT2oy?=
 =?utf-8?B?SjQ4S1d1b1dhZnBRL3d3OHpWeVZzdmgxYlF1dERreDN3RFFlVWc4dVN5VG1C?=
 =?utf-8?B?dUV5YU95eURrWTdVcjdLbkpsQ3N3bjA3czM1RnNpc3pySGZTZmIzQ1lrL0Za?=
 =?utf-8?B?Yk1ENlpmdnYrTkY1dCtXaHNrc3pSRE1XUVZhenpZcEJ0d2dCU3ZKczNWWi92?=
 =?utf-8?B?V0FsdkhpMjdEdDcxdGs1N1Z4ZUFSamNFVGl6SU5Jc3hFNkkrLzhiZWpJL0dV?=
 =?utf-8?B?UXVLendRalZIY3RWeHQydWttNVBHU3VxWmcyTytJTmZ2ZWV6Y2N4c3QrakJO?=
 =?utf-8?B?dkVFd0l0OWk4WTE0aThWbmhuM21WdEVHREIzNHI2K1NPZVJ1bzVYbU02ME9z?=
 =?utf-8?B?MUd1NGRvOVgxOFlyOEVSdDdETVU4dWdxZktOLzRrMUMvWDN1Uk9rakhwOXdD?=
 =?utf-8?B?bjE4NWI5bm1Rc0ErN0cxQ1ZGQ0xpOEg2MUMxYjlZbm5IRmpyS0JzUGEvNjhD?=
 =?utf-8?B?UzlEZ3I4c3VsajhOK2t3L3FYK3AzbXpycnNqb09JSGFvYkhYaVVNZzNPcXdn?=
 =?utf-8?B?Z052Qmx6U3UzTFNZNEwwZWFzbitLSzhXTi9pUnZwUXdYdW1Oa2dHZ1J5RjBp?=
 =?utf-8?B?L0hKMEtaMmk5aUlES1VxYlVraEdiZ0FJMVBOSnhYbWJzMVFzTWJQeXpRcGdU?=
 =?utf-8?B?ajJjZE9mTHJ3MFJqb0I5NHVFRVl4aG5CbGJ2UWNNSnRhMGRDQ2dlNmZQc1Q5?=
 =?utf-8?B?bkUzTzJSY1g5dmorUGc4VCszWUVBTHVVK3NZYzU5eG01TVBkZjY0WExIL1RM?=
 =?utf-8?B?RnNMcEQzMVlQcFdKcFFaVElpam9ZR0I1azhpOEd2ZmpVQ2JiRUQ0WG42bWFB?=
 =?utf-8?B?d2Q5S1Z6cXFpMXZjZnJ5c2xTdE5yRTBoSjZkOGNwSGZNOTRqNVQzNlRJZHZp?=
 =?utf-8?B?c0ZUMlV2ajRQY2VTa2RNWHRHYXZxZndJTXJLSzUzRnpWdWNlVVhZbWViTGZo?=
 =?utf-8?B?dnhoWDZaR3VqUERJZWVMc1pTNmUySlRXR1ZpN3lRdjFnTXg5NE1pbWhRelhH?=
 =?utf-8?Q?vJEM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWdFQ0RUbTRXSWNxbzltc1I1eUEvenA5ekNVT0RQZ1NuNXBpS0hKeEdtMzRY?=
 =?utf-8?B?VVZUNkw0WXVWQnYvUDdnTWFJZXMwYzFlNTBDWmZOT3RvbXg5WGQrU3hwQU1p?=
 =?utf-8?B?Q2ZlNGNTQitFbWFRenRiR0pmN3ErM1ZsR2E4ODF3NnQ1NXduVGo0VFVCTGFz?=
 =?utf-8?B?anZKRnVNVFAwOGlHV3BkNE1DdytIdURGZ0UwSmkyMjBlR1F2M1ZjaHlaZVZv?=
 =?utf-8?B?b2huSzVPb1F2Vlp1UDNOcGxnSUliYXdOVWk4ZHFWTGJpMk1QWTg2RkJubzdo?=
 =?utf-8?B?MURsblRCcERHRUZ5V014dk9IVXczS3lVSnJ6ZFBjWnZmN2lEbjVoQjltYjdn?=
 =?utf-8?B?T2p1VzVWNUhLeUdxUWpqRHVMSTVWMDA5aFRDbUpXSWZ2WHIyOWFiay9pNUhE?=
 =?utf-8?B?ZERFUVFpSkxjRWdicXB6QTUvL3haQ0N6TnZOb1MyZjVZY0NyTWlOaHNUUnQy?=
 =?utf-8?B?TnlkWU5NUW1BS0lVWDZkak1LWURsYmsrcmczK0ZXS25HUmhCYzg4dWhlRFdz?=
 =?utf-8?B?bVM5Mkp0eXdBR0pnMERZY2tFNUY1eko2TWs4QTVRUURxVllkb1RvQlFYT2Fq?=
 =?utf-8?B?VkpSUXpLcCtDZW8xeWt4ZEx5dmtZb1RKRi9iamJwZmZ5UW4raEFHS1JST0h3?=
 =?utf-8?B?b05BTllRdTdUUHQ4bXZLUW4xbGVGYUlEUUVnUHI3bEgxeXRpVDBpTTVhRjdJ?=
 =?utf-8?B?U2ovazJySDd1UTZ4K3BHRUtOcnBTbmpNTFhmaE9QaCtTdTN6c0wyQ3JoUTdI?=
 =?utf-8?B?eDBrbDNVNmZBcUptTXBVQzhLUStrd2N2bGRDRkZqRXhEMnBETEJBY0hzblpx?=
 =?utf-8?B?V05tcXRvbko2aG8wWE9mV3Vkcnp1VDhwekRSZ2ZCd3MyYWJsSjdrQ01MR3FN?=
 =?utf-8?B?MStxNDhCMWRUWTZsdXpxSW5IL3JodkwvalcwODJmOVN5MG44bkxHUDBRYjVl?=
 =?utf-8?B?ZEU0WTlSZFBPVnJlWFY5VmNNekhyTk5kMlozdWUvejVCZ2FhVU5kakYzTlpM?=
 =?utf-8?B?M3Z3MStURHoxNFJFQis0RVdVdFFUaDZBZTU2SHFlaXdxb0VYZ3ZaVzZZSTI5?=
 =?utf-8?B?dzNxcmRmcndMVExRMWpmczI3cFdmWTdubXlCQnVRUTgrVUJoalA0ams2MVF0?=
 =?utf-8?B?WGl5VXJQci8ybXZxWlpqSjhSMEVxZmZoQXV4aGp1dDhzSzdPS0xkQ3JYYm01?=
 =?utf-8?B?Q1FmVDAvL0lZL1BrVUlDOUJST0YvYUZxNVNIZDA2KyszYkJ2dHBINkhmM1N2?=
 =?utf-8?B?QjMveXh2cTJ1OFd3NlNkVWVvYllXbm1jeWt4bGxBVWFFYnY3ZGNBWFNBRUNa?=
 =?utf-8?B?YkFMaHkyVVpxbGx1akU1N3o0ZFJhcWkxWXd6V3dKQzBXdHViOFlZZGJiZUlx?=
 =?utf-8?B?NFYyNlB2dEJSZmthUXN5RGtwcXFLQURyV0lmU0xFSTlHTVFNUHlJcUpLKzdX?=
 =?utf-8?B?dEo3NkljWXNxMzVQNjJyY215RzlPaTFrWTFIb0lMZC95MzlJbEZ4S016enk5?=
 =?utf-8?B?SlIraVNRZDhqSy9nUWFPaUt0N0NHOVBweEZZai9VNTNlbXBUdytqb1RxVDd4?=
 =?utf-8?B?cDVTUHdhMDZHNUl6UXZhWThpVTdKbGdkOWJRaVZxWEZ5Y3BJeG8zTGhlcjRQ?=
 =?utf-8?B?bk1ZR0ZUTm90QmZEN1dFb3I2NWRzb1ZaUUR0aGhKa0hPVXpCM3dwUkpCdkQw?=
 =?utf-8?B?R2NmaUtXU0ZLR0ltdm9SdnEwejF0Q2tST1l6Z2poa3FUdWo0S2VwOGJTdlpX?=
 =?utf-8?B?SjIzVUNmSmtPMXBGK01KdWNvdGZ3d09RSlVXU0RJOWwrZHNQci8zeUhMVTNW?=
 =?utf-8?B?Vnd4TnZUMTJZL2RHQ25YQ282aXYvbVg3VTVOeFVuekI3QzhIM3lNSWtNNnFp?=
 =?utf-8?B?NVBoM1VjM2NaRWloSE14UW1sNjJFaXhQYmt6WWdIN3VGREh5dHFTUG5tQlJy?=
 =?utf-8?B?MEtyMVFpTVB0VzBnUk5zTmF6OHJjc2hlUXZOb0VUa253bHo0OEwvKzQvMjhl?=
 =?utf-8?B?VUNKbEgwVHFnQW9wU0xLSXNGRXVIOUo3TkNyWWNkTGxjRnZvUWN6alJEVmtN?=
 =?utf-8?B?V1FOcmhPK0t1dGxjcnhsbkZSWjRod1h1TmpKZTVhb0NVNWJncDZMZ1Y5eVBW?=
 =?utf-8?B?aVNHRVdCem1HQmpwSXFNSDVkV09lM2tnRS9SZUJyeG9sUTlicVM0NUk1ZkQy?=
 =?utf-8?B?bkx4Y2hqeE5iTzhiNExhbGFCY3VTckRNLzhTN2psTXdrdXlBazBKMEVubmlQ?=
 =?utf-8?B?b0dlcXdVNlQ4UjdVek1RenZMS0paY0JNaVBYaEowUWxRMDlTcWM1S1RxZWgw?=
 =?utf-8?Q?2a4KXAVvXGvkadOufG?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c506ad4-bc62-43c6-73f4-08de679a5c48
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 05:16:20.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+DHyEelkqWY/D5CzthTOI4HbfUTTxvbFMe35bXd/vFT8j7r+GJV+uNPp/0E7+DqrG7y2u/Lk2ruLW+wIAIQIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5669
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11081-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D92610BBB7
X-Rspamd-Action: no action

On Sun Feb 8, 2026 at 9:07 PM GMT, Yury Norov wrote:
> On Sun, Feb 08, 2026 at 11:35:51AM +0100, Miguel Ojeda wrote:
>> On Sun, Feb 8, 2026 at 6:58=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wr=
ote:
>> >
>> > This is confusing. You begin with "const_assert!() is more powerful",
>> > and finally recommend to use a less powerful option.
>>=20
>> The goal is that users use the least powerful one that applies, not
>> the other way around, because the least powerful ones fail earlier and
>> are generally more robust.
>>=20
>> I think the first example is intended to show the different ones, but
>> I think the wording can be improved -- the one in the existing
>> `build_assert!` docs is a bit clearer.
>
> Can you please keep more context? It would be easier to refer to an
> example if I have it on hand.
> =20
>> Gary: perhaps we could factor out the explanation/examples to the
>> module-level docs, and then link to it from all the three asserts.
>>=20
>> > I don't think this compiler implementation details should sneak into
>> > the kernel. The compiler may get changed, or whatever else, and this
>> > all will become just non-relevant.
>>=20
>> How do they sneak into the kernel? Gary is explaining why it is not
>> called "link time", precisely because that would expose more details,
>> not less.
>>=20
>> Regardless, that "link-time" vs. "build-time" discussion is
>> independent of this patch, because those docs already exist in the
>> tree.
>
> Again, more context would help. So this is the original comment from
> Benno, and Gary's reply:
>
>   > I think having "Build-time check" here is a bit confusing, how about =
we
>   > change it to "Link-time check"? Since a "Compile-time check" also is
>   > done at "Build-time"
>  =20
>   This is the intentional phrasing that I used for `build_assert!` when I=
 created
>   it, for the reason that `build_assert!` ensure that it will fire, at la=
test,
>   link time. However, if you actually use such methods with CTFE, it will=
 error
>   earlier. So it is "at latest link-time check", so I decided to just use
>   "build-time".
>
> I agree with ""Build-time check" here is a bit confusing", and the
> following indeed looks like a compiler implementation discussion. So
> I concluded that the difference between build_assert and const_assert
> is not visible from programmer's POV. Please correct me if I'm wrong.
>
>> > On the C side we've got similar statically_true() and const_true()
>> > macros, but they seemingly have a different meaning:
>>=20
>> > Is it possible to maintain consistency with C on rust side? If not,
>> > can you take those C comments as the reference for what level of
>> > detalization is desired? Maybe pick different names then?
>>=20
>> Please explain what inconsistency you are seeing here.
>
> OK, maybe it's just me, but this is how I build a map between rust and C:
>
>  - Plain BUG_ON() matches plain assert!();
>  - BUILD_BUG_ON() is compiletime_assert() and matches build_assert!();

These two are correct.

Notably, `build_assert!` uses the same mechanism as `BUILD_BUG_ON`, i.e.
generating a undefined symbol reference is it failed to be optimized out.

>  - BUILD_BUG_ON_ZERO() - same as BUILD_BUG_ON(), but can be used in
>    initialization constructions, like GENMASK(), i.e. rvalue. No direct
>    analogue in Rust;
>  - BUILD_BUG_ON(statically_true()) - allows runtime conditions, like
>    "true || runtime_cond", and matches static_assert!() in rust;

`static_assert!(expr)` in Rust is equivalent to `static_assert(expr)` in C.=
 This
means that the expression is evaluated by the compiler.

There's no equivalent construct of `statically_true` and `const_true` in Ru=
st.
Rust intentionally avoid providing the ability to observe different behavio=
ur in
compile time and runtime. These macros simply return `false` if the
evaluatability is not met; Rust's `static_assert!()` (and C's `static_asser=
t!`
and the `const_assert!()` will fail the compilation with a compiler error (=
not
an assertion failure) if the expression cannot be evaluated at compile time=
.

>  - BUILD_BUG_ON(const_true()) - doesn't allow runtime conditions.
>
> I expected that const_assert!() would be an analogue for
> BUILD_BUG_ON(const_true()), but it is seemingly a different thing. Or
> am I wrong?
> =20

Let me give a summary of the three assertions in Rust:

`static_assert!(expr)` is equivalent to `static_assert` in C. It requires `=
expr`
to be a constant expression. This expression cannot refer to any generics.
When you write a `static_assert!(expr)` in a program, it is always evaluate=
d,
regardless if the function it appears in is used or not.

`const_assert!()` has no equivalent in C, because C does not have generics.
However, you can treat it as a more powerful version of `static_assert!()`.=
 We
need it because it has the ability to refer to generics. It also requires t=
he
expression to be constant expression. *However*, because it can refer to
generics, it is inherently tied to a specific instance of a function. So if=
 you
use it in a generic function and the function is not used, the assertion wi=
ll
not be performed. `static_assert!` is recommend over `const_assert!` if pos=
sible
for this reason. It also has a limitation that it is only usable inside a
function (strictly speaking in Rust term, bodies).

`build_assert!()` is equivalent to our `BUILD_BUG_ON`. It is even more powe=
rful
than `const_assert!()` because it is supposed to be able to check tautologi=
es
that depend on runtime value (similar to C). However, as the assertion fail=
ure
mechanism is undefined symbol and linker error, it is not developer friendl=
y so
it is recommend to avoid it and prefer other two assertions where possible.

In summary:
`static_assert!()`, `const_assert!()` and `build_assert!()` in that order h=
as
increasing expressiveness, but decreasing robustness and the checks are
performed later in the pipeline. Hence, the suggestion to use the least pow=
erful
one that still works.

Regarding the name:

`const_assert!()` has it's name because it is literally

    const { assert!() }

where `const {}` is a construct in Rust which says "this must be a constant
expression and evaluated at compile time". The names here refer to related =
Rust
constructs rather than `statically_true` and `const_true` in the C side.

Best,
Gary



>> Also, please note that two of the three names have been for years in
>> the kernel tree, and that standard C also uses `static_assert` as a
>> name. `const_assert` fits the pattern and it literally expands to what
>> it says.
>>=20
>> Moreover, `const` in C is not the same as `const` in Rust. `constexpr`
>> in C is closer to `const` in Rust.
>>=20
>> By the way, I am not sure why you suggested `const_true` for the name
>> of that C macro -- I think it should be `constexpr_true` instead,
>> which is closer to what it does, and it fits the pattern on the C side
>> better, too. So that would be more consistent.
>
> I suggested const_true() over the original underscored _statically_true()=
,
> and this is an obvious improvement. If you think that 'constexpr_true()'
> would add to explainability, please submit a patch. I have a weakly
> negative opinion on that.



>
> Thanks,
> Yury


