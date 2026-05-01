Return-Path: <linux-kbuild+bounces-12968-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8sN/HEsd9Gks+gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12968-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 05:26:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4AE4A9E8C
	for <lists+linux-kbuild@lfdr.de>; Fri, 01 May 2026 05:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B2D4301703D
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2026 03:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EA42FFF8F;
	Fri,  1 May 2026 03:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DVgTp1nx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35D2F6586;
	Fri,  1 May 2026 03:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777605960; cv=fail; b=NucY5WL8lh0ZRx++7IbiqWYpOLnb93HlvTeSiDx6NX68aAQiO+rM++2Fadbi0LKk45oKvoAjGWOZRR4Y7+yoiQQE74v9MjvTWGn4OMIYDMCtpnGqD5xQE4azJj7hLjYMi3WpqrQJ3i7kSy90tGBjTVXMjctCVy1DjuRIJclAqao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777605960; c=relaxed/simple;
	bh=RyeFBmMDvy+UVeIR2aJLo362vxcHBjT5NG66IVgIf8A=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=saiveZxEdHPAA7biVAqF0WZeu2ZDozDkpSA62hQD3T/NyzycdsM2LEyN157Fkni+E4dFQS8+9FD7OQMwqoyMAvgmI53jCSIatzAD36yaIx3I439cd5FT9ItoiCeCFFBT+aHj2vM6g3m7xEZlRKWroB6RzwnpXflEbJ8MWRQuEQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DVgTp1nx; arc=fail smtp.client-ip=52.101.52.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhvThDwo64H3PTbX75tD1gG80H0D2vv5W8Y0tzSz6w9nuHpQItVPlgRxwWBpSVVXR37JSMxV9OR3AgJqTWKml5j66Aqy9X50K2zqc8lNBynwQt1HGcOdDh/FD5yoO2ZBhKwUEZZnsRRGaNBXNtnq6PKQAI/CAyVx9WOxjkBWMrz7FGqOu2HF+tUlV2IxGL8BrXcMf+0vyqkkZ5gLwz5WwpdTg8dybjbmIYUXBmscdVahJRhWla8ZPphNXi1XlqufUv72xBLsDQMETwNcogArMCNEcg7wBXj9Evzaw6X2hBdNfIV65oNY9A4T/TJ8UVd/gUTaksk5uAcdVqBXDPH3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCM/RSp9P/1w5lbIa41ts1TDKQGRm6P9r53yJu7UTUo=;
 b=ZPQeljS0N4UpWkI05t4EMcxsF55MLpon3m3GdhPM26zsjBsbm9E6m2KONaS77RZFDlyjtvJ0NLnYAvvFcn0OAuQ1wYuSHexIRxDcLIIurcRzv+Q+uQdvmQcezhxl2WVM5ns/y82FfFBhibowmSMydsjjNyy4ftF3oY8ZCZ5mJwPCoqq0Ispq79DRxbX1lij+x1C0+dBm3EurviuF1sz2L8ukIIi9PmWQnOEq+wYH9kk4d8piybfI8uyIO1DqEARF5e7ntlMQXbQsTGYJEgxhz672VbSjYk9teDGQzwbo/dqObPwu+KgpuuSD5naOMKOmkFUcGciQm/c3wbkXIwhoGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCM/RSp9P/1w5lbIa41ts1TDKQGRm6P9r53yJu7UTUo=;
 b=DVgTp1nxwu4nl09g+Vei8kICK2tZHHnxdxvmHSEtrV/ys7stvwQxVAUL9beUpyuH7gtwKuXN44NRCsCMgZzbynAV/WgmnUxRaM5s7sHuDKAJRZHB64KHE9/VqsZYKieCmNJfTEYz7GXQb4HjTmNPGnf1VjMQwLR0p7ukdYSJhzBaPui/3Dy1lRE3mieIUWxxCyinh+hOHNJokN0cOYwtA/l3xGntf/k6k+exjfeJ+4264M9C3g+VWP01Qu9Pu2CttFiw9L7y1RXk1evlyQVFhLrabCXfM4WVGL5jU5QtSrJI+0Ii6iigNKAzBW29JFj/v5QxOuIv5w/8L2NcZ0G6bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8689.namprd12.prod.outlook.com (2603:10b6:a03:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Fri, 1 May
 2026 03:25:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 03:25:52 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 May 2026 12:25:48 +0900
Message-Id: <DI70PV5V3W38.ZVD5ZE6027SD@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] gpu: nova-core: rename module from nova_core to
 nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-3-7ca31664e983@nvidia.com>
 <e0301888-940a-49a4-8a3a-47960162819f@nvidia.com>
In-Reply-To: <e0301888-940a-49a4-8a3a-47960162819f@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 71da6506-7a30-498e-3eb2-08dea731589c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lRYkaqFeFbDDy77Dq+HQdBlZEWffOlgmK3oqG0nb5dfsH7hEcR+ldTnGw7neWieMN/gQECuBuqPEkkXT/y9JHBDC2g4EYAb7FPcjBMD00QSOpWY2KXadJBQjt9x32doVSZKvjCptRV7FsrLrbYjYwg8IxXmuKK9IBvO3PhmVrJRr5pY2hty2qBQ3cNyOF8tj4h9IXpLKaJeZE2pZ2KeugZBexS0kKJSYdLeIPWoLbrA0GUdaYx/drhfJrBFcYUa0N+BqOYOIdr2vR66k7eX8v7mC/1wVT3m1R9rrEBgm/GDSZCNW5zlmRFouRhK7xIXzOqyOJxxwqqKLDWvKXwjrxLHcWKGQDPU1NtTLX08zZ8g5WciADO6u9n15aU7MoTyPM2Dlia01VY9H2FU/5JomJcctHiDa4FUlY+EilcK8cDP8kpwjUB8QnW25Fu9mr+T3/8oQT35450jKunfVahHYJRWzw5Xd2tk0Nq8/TXX++AelJZ1NOPhgcZ0023wt5fPL+08KPJ6J6mp09pQh4H+7g60XLakJZFJYtfpj9nGS5bxCmyHcK+abcVTBlynIjwSJPyLkeBop1dS5wjbnqlLQ6Ihdr6sLvExMDU1KiPnWJ6P0Bib3XY/trTEwiahmce+FR1PWjjmm3hjpkLd+Qohbb/cxcB0EevWx8omoVZ720f/ef74BTxRKJiCQb3Z+fN7N
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWpOUlJIeGpSMm5HSGtyQkNvY3ZZbmlRbmtRWTdjSHE5NUZzckIvZnZyb3hX?=
 =?utf-8?B?UTUvZTArMkhKS2tnYjlYWnl2YXkrbnRPbzFEUURBeFQwVGIxcmVUSlFBTnJ1?=
 =?utf-8?B?MzlTVE5rR1U2OCtiS0Nlamx0OFlwYURKVlJPaWhFZlpXdmRWeGJkbWl5UWNL?=
 =?utf-8?B?YW1mcURTSU8wQzd2MThpV2phTTVBZHpnaEhQRnVlU1ZCU0MwT3VneXAvS2hV?=
 =?utf-8?B?bXIzSnAwZklLRmp6NjhIaDc4Yk1MSmE1bW16WWJLTmg5azFIZHVIU3lFWUxQ?=
 =?utf-8?B?a0tnN3czdTFkL2VBcFN3cHRmS3hkSTlDeHdhSDdTQUlLZnRoeHlydGo2c2JE?=
 =?utf-8?B?OFdqOGhuWTVrRGorcmN5V1ZmWWFWZHczY3d0TUtQbHhxcFZtbW5wcExnemNH?=
 =?utf-8?B?QkFyNzFIREpib1J0QnBEa1B2a0dkQUQyV1VFNExUNG5pazZxTVlnWTE1ZENZ?=
 =?utf-8?B?Z016cEhreEpkd0pkQjY0STAzNHEwRWxENktsQ1F5aGlrZDZxbGtrdDIyV3d6?=
 =?utf-8?B?Tll6Zm03NTNvcmdCc1BUS3VxVThDY2pjZGxBYnk3ZFUyMnBSMXcwRlNERytB?=
 =?utf-8?B?VVc3a2xSYlY0OFdzZDZmTkdmN00rNi9TVVNzWDh0Y2szdmhrT2wxelZlUzMx?=
 =?utf-8?B?aFVaRmQrN2FXYTN1M1BkYlQ2KzJsTzlIUjkrQzVmNVg5aEE5RHZWaXh2c0J3?=
 =?utf-8?B?MzdVRGtBVkppQUw3L3lDOG9PcldVaFVkVTh3aWw1cVhsUG1YU0JubUpqdXhC?=
 =?utf-8?B?TElhblY5RWoydXNvQUh1Z0ZtNXY2V21ocUVpVDF2RHdqMFYwdjRnY0FQclNn?=
 =?utf-8?B?eit5U0VlUGtpU0ljL1NmTTllNC83cHZMTGpQeENjMWdRd2NTMkRYRXRUaWNy?=
 =?utf-8?B?TjB6Mk1WMU96QUpZSFpsTHo3KytaUThrR1FTSm5nbWk3S2ZSRUVFMnlZS2FW?=
 =?utf-8?B?RndiMFRHVE5nMUw5dmhXdFIwNXpSOXVUemFCekJwcU1kaWJoZVVrYjRoTGY5?=
 =?utf-8?B?TlU2VUJBTkpIZzdvbkFqQ0lpVWExbVZQQnBJK3lDUHo4Yno5Szd0ZU1aS2s5?=
 =?utf-8?B?K0NNdmRCY3lCbTkwMlNmekRwNEx0dkhVWCt4TFVPUERRbmpYdG5zZ1FtR0NY?=
 =?utf-8?B?aFJxUk1teWxlU1l2K2taV290OHYyNFdZcTh0SGN5SGIyT3o0QnZXaU1TdkJp?=
 =?utf-8?B?ZldGcTQ4VUYvNHJ3N1Bkdng0NloyMVI0bVdjaUxJV3laQXdpS0ozdTAwbVFK?=
 =?utf-8?B?R0ErM2orRWZRRUJ1b3BQYldjYzVZUk1zSDd2bmxhMkt4MG1CNzVzcVRHb2JK?=
 =?utf-8?B?WG5LV1o4alk2Zm1BKzBZdldJcDkzVnVORlh6S3lHcUJqYzRENnpBR3lyUG5K?=
 =?utf-8?B?K2J1azZ0eTNTcjhHcDFwQ1duNEJTU3pRL21JQ3Z2RWNKS3NRMHNiaVduV29u?=
 =?utf-8?B?MU44c1laQUgxYWZoYnBUVGFPcHVWWk9HNGg1QTY0dlZHN1grb01aWTBkSDVS?=
 =?utf-8?B?cENCRGVJREthc0thejdRMEw1Y2tjZUt1TVBvQmNxQ3JsaFJ3V0ZmME9Cc3Nk?=
 =?utf-8?B?SUZwME1rQW13NEJQL2VLeDRQcUdaUE5mZXJGUmNiWWQyamEvbXk4K1lPazBH?=
 =?utf-8?B?ZU5VcmxYemFISUJaUUZKdnczckpVUTFEWTBYTWRFK25CSk1OMHBYUkNjeW5J?=
 =?utf-8?B?L1NLWFZOWmRWNlllWFdTZ2JKM0JLVDhCUEk2ZXdFUytxNDBsYm9kMFlpcSsv?=
 =?utf-8?B?aFFnRmVaYkdZd1YxL1pDSHZLVHZja3VISTY2L2lySUFub1RzbkRxQ1A2d3dN?=
 =?utf-8?B?RHU0bUN0aFVCNFVBVnlBU1IyN3VEUWZRMHVtMUdFNy90RTFPZ0dHZkx6MFdo?=
 =?utf-8?B?NUp3Zm01Z1JBTmV1T2RwSlRJa0xhSTFiODd3YWt3S0RHUjZOeDdLWnl4cWpR?=
 =?utf-8?B?OU9mSXRQWFNKclFTNjBYUXNkdVduaVMyYlJOMlBzRUZ1Mm5WRkRRVUNmNUc3?=
 =?utf-8?B?L1ZPQWxZRzNEMU9FQUZoc1QxNFhoMjkvRWZsK0NZLzhHZFg1TTBHTTd4d05a?=
 =?utf-8?B?UEh1L3QwUFNIWWFJVVcwYzBwSGZTZTJrQnBhMGNZOVQ0TGV5SWszV2h3TXVK?=
 =?utf-8?B?SmtCRnN0eVV3Mm9EeUZ4cUtIVzNwc0QrUlJNTVNycWNEdklXWVNZKzFVMDFZ?=
 =?utf-8?B?VENUQnVKMytEbDhZWjA4ZFZ5d1BoUXBzTzZ0SUJPRnlyVWZ6MEtFRlpaTmlj?=
 =?utf-8?B?bnJUbGZoUmRiZjR4M1hyVUNvQ2krMldiaXdBWDVkUWh1aFFveVRsdzVPODlT?=
 =?utf-8?B?TkR0SlFqbVM1Z2lzenBzZ3VCWk1uYmxUbENhS0UvYVhFRHZpNWxub0Rvajdj?=
 =?utf-8?Q?LpxMdsX4B2uAIQ0aTrSnDDOwfMdKw9q9TJBs9/bnkVWXb?=
X-MS-Exchange-AntiSpam-MessageData-1: 0yMGBgToh1U/9w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71da6506-7a30-498e-3eb2-08dea731589c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 03:25:51.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWU3NmoJJMleP4+1fKACw1WvPFkXgIFfeUff3042adCYoBPM6lslIodumtWaXCHjOSY5vwY4zcVNB8/43AI38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8689
X-Rspamd-Queue-Id: BB4AE4A9E8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12968-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]

On Fri May 1, 2026 at 12:07 AM JST, Joel Fernandes wrote:
> On 4/30/2026 10:55 AM, Alexandre Courbot wrote:
>> Rename the kbuild module target from `nova_core.o` to `nova-core.o`.
>> This avoids a name collision between the module target and the Rust
>> crate object (`nova_core.o` from `nova_core.rs`), allowing the driver to
>> be built as a composite module.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/Kconfig  | 2 +-
>>  drivers/gpu/nova-core/Makefile | 4 +++-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconf=
ig
>> index d8456f8eaa05..f918f69e0599 100644
>> --- a/drivers/gpu/nova-core/Kconfig
>> +++ b/drivers/gpu/nova-core/Kconfig
>> @@ -14,4 +14,4 @@ config NOVA_CORE
>> =20
>>  	  This driver is work in progress and may not be functional.
>> =20
>> -	  If M is selected, the module will be called nova_core.
>> +	  If M is selected, the module will be called nova-core.
>> diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Make=
file
>> index 2d78c50126e1..1f794baadc86 100644
>> --- a/drivers/gpu/nova-core/Makefile
>> +++ b/drivers/gpu/nova-core/Makefile
>> @@ -1,3 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> =20
>> -obj-$(CONFIG_NOVA_CORE) +=3D nova_core.o
>> +obj-$(CONFIG_NOVA_CORE) +=3D nova-core.o
>
> I think a more descriptive name would be better than relying on dashes ve=
rsus
> versus underscores, that's super confusing, how about:
>
>> +
>> +nova-core-y :=3D nova_core.o
>>=20
>
> Lets make this: `nova-core-y :=3D nova-core-mod.o`?

We would have to rename `nova_core.rs` to `nova_core_mod.rs` though.

But your argument has a point generally speaking - if there wasn't
any underscore in the module's name, then we would have to pick a
different name anyway.

Another option would be to use the Rust-idiomatic `lib.rs`. That's what
the kernel crate and others do.

Danilo, WDYT?

