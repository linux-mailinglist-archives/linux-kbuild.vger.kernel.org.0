Return-Path: <linux-kbuild+bounces-12523-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NS9GOsqzWn7aQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12523-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:25:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4CF37C1B4
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F357330EA968
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 14:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5956406295;
	Wed,  1 Apr 2026 14:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="W2PUSWSZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020074.outbound.protection.outlook.com [52.101.196.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876733E0246;
	Wed,  1 Apr 2026 14:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052728; cv=fail; b=nogqj0q8xEy7i8bIhwK6r5SX2Pzfabxx0XzjLR9kblYZ/RgwdOvGQlQBhDQQ4SyVabcmIu1nmqbROznAFj6XU3A+X+WfCDc4JqoVWzl4R4Y++n09jbeiHPpYEYTeDvHt2tZq000AG4pmFJ8aeSTXpNLAAQnmzK9nOm+fQNirJAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052728; c=relaxed/simple;
	bh=hmy3aoSzlz0iyA0/53jKRgeWoX5VZns2h99ANOEDGVc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=an5bHPVJwYg/K7yeByKLJLoHB+AFgXm0iAv6Hgx/Il02GQPieYisQcVrW+D0giXoFmaBn3R/TN0W/xuaWn5V8aeUCkpw+Znqg+/jb2DX8yLnT8t5Vdv+tD9bRxybLpa3Z6stZ0jTH3zwEyjkEankhrRBdpCJTobnEg8EJuiVohM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=W2PUSWSZ; arc=fail smtp.client-ip=52.101.196.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNnLX2UyGp+IpbaZPY6WgEKPU/K0RnSGqoMlVctXbdHfjkWcZRhvs1bKZndLl3sOIapQLy2t7pfe0N0niozUpFpEFpdjkTej+B8tLC9LYU801ku7/SXIAiuTbSsYlmvUxIwh9deGgWIgRwC8TVABWF3tdux5cqvxDoify8qoINySa45ULAmve/gUIC9MXKl1nwKvrS8lbcKxubyz3RU4uYeC7GxRt4h6HQYtfBlncNqKPekQvRyO+XwONGvZI0cDTAPaSzdigvdIlGnbd+sij0y6F7lITk4vOpkqU3nq9PbMDbo19XE5lB6IU2J4pTPcmlN6uH12w7ei6Mrbj3MwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/iuEh3396NHQWQn/c8Ohg3KH6ScMTVWVZvBXFaLkp0=;
 b=OsBtdL1VK/OkSlNiMOZNJuUpSBnxVAydrbY6Or0QtAJzmP3PfrMqKDSZ80wppIEaYhqCuI3ABrqgwrYqDr4v0oGi55czc1E94WGaQycshpmPAymxtYnhDxESEv3n6OKrd4HQB5uV49F9dSF6O3ZDih2MP9JPICMKGVytXPOnDsxYNUHSM9AbJKcShURmodpzEGoxOEQAboOy5GYgsZ9heiwLOZbo0wXw4brmQwBsSjEsKr0/xWRXcfwIyfH4W8okZZGaAcgHZOM1UzwABiWXTXO5x39qE11DEPeTetSAcmgNNvflJvECIcQaDidwZS4TJnpT0LjEEIfaStLggf5s5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/iuEh3396NHQWQn/c8Ohg3KH6ScMTVWVZvBXFaLkp0=;
 b=W2PUSWSZ3yLPf92Fi6m4A4DwG8TvDr7sW+sPwIMDlHDpNUQsMSoFAN6DZKCcRa++QljT/cJd0tTMuphdJkbdswK/0FpUEoR32sUbnTWGnkwJnad4nsnFvHT2dINcet43XOiR9GeE/T+PNpC+qMgnuFfcoVk3ZkrVYqf9Br5Kybc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB3423.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:199::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 14:12:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:12:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:12:02 +0100
Message-Id: <DHHVOB8OZXCQ.392UNWQKMBARY@garyguo.net>
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
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
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
 <20260401114540.30108-12-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-12-ojeda@kernel.org>
X-ClientProxiedBy: LO2P265CA0353.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::29) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB3423:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a377499-6a1f-4970-5ddd-08de8ff8a5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	erD7DTPG4FdWKB4HR8AlpsetK4pXOHvDYNSiTq3oP9NMXrB8YcZuPDVj7pN6EMLGj4s6qiBo4SqVynFS5CjtlGTLX8sMvkn/RxEXTcT7w6xeZpff5zON3g+/e0ppiT0IroO+uf5QTlBIi5XeE/kAk74EyVeUtprVYiFfv7rfXWGrJwZZA8YajJyPOK38y7ZiN3DagCXc7ZmGznGTWlydpXjuE3O5r7bLHY6gb5Um/THhD0OM27B7V2VR3WCs0cppOig9ZSHsApM9N7FCyZ26bhgrd2pWKDQICEOhIxFP9kS0PyCjSBLMAEW0FEK+nKwn5GCbdW5ZKFftkRvRuU3+ZYF271dKsIRlCDHrSeHZIC7VD+ySacQ1wWvvfUQ1GiW8N0+EETgDrqzwNCFTyY+OZB/ks3c5f1zNavYaxgiHQZ1HE++mPdysqppxvMFbcNlTXZWaU+bop3XRNhlHjANuhTEGD9+1KL9koXDLa/H4ZamtKtyrf03a7diCTBDtXLd7IdJQuBXX2QHXZY3Rjof/rIbFiveZ2AwnfXdzUKOunINmX8gx0otwt7yx4yPOVr2Efm8tRXry0juGBiBG+iKy0Bnrkm6kr8oHgXSY93dfmoK56YNIC+ShAvYXKCm+AE/FY19w2F0BOcbe/KjdLqK9PNLFR7o8Dko21ow/Q2w5PfNTUQh8Qjg1kWfFc0Hfqr8atxP2T1byQIv0Qcr+BdEmS/GFq36PdkVAcBd7PRcCQZbj+f2CYgFG72Pf4yPKNsO7zMkCxSim6m4ReeoK+SiXTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm9QNHBkOG1JQTZ5VURONHErZU1DcjZHU3BKbEEwR1VSSGpEdTVKNWRyeGZ4?=
 =?utf-8?B?N0txYmxwQStpT2xUNUpRL3FqSkRibHYxcTNVTjVGd0hjWmJoR1MvRm53UmxW?=
 =?utf-8?B?UkFoSnFKOGtWK1g2U1ZyQndMSklmU1lvNlNYTTl6MDJqN1dBU0NnSnlnREhO?=
 =?utf-8?B?end3VmpuMGlLbTgvM1lHMk1ZSlVFUXFVWEd3UGpYYTk0ZS9oZ05uT2VHNnNU?=
 =?utf-8?B?NmFJeE15bm44VzRMM295dTM2bGh0YndQZUdFMURtc1hzRUZmSkJOUm9qdnJW?=
 =?utf-8?B?anNFRitrbGNRVlIreUhDQVQ3bWxSQzRsY1UvMEJ6VUV1MXozaHN4NE4vVVNI?=
 =?utf-8?B?c0tmckpPTjBJMzVIaW9nMWhDSDVsQWtjdVpwZTk2Rjk0ZjRwSWdNK0VYWkM4?=
 =?utf-8?B?Mm5MY3Y4K1I4TkRoY1E2SzZoa2F1bTF4SWNDc3ZyQlJkRXpqUWs3ZWczRkZs?=
 =?utf-8?B?ZjJUS0R1Q0hENHJLMEprckJiOXJOTHdOVU9COTdaOUhJMGNtN1NIVkVKeDJt?=
 =?utf-8?B?NWxTeEcrTkQvNUdxcDVCOU9URlVPVWEvUFlxQ00zZTExMDFSWWxiUm1uOEV4?=
 =?utf-8?B?ekU1a1RrMStBdEZYeHFuZzB4MnphNDZvTUxIUnRCOUdibUZXUXl6ZVYyaEJO?=
 =?utf-8?B?OVJBUC94dTFnZ1Z5REtDK0VLZjZzeWI3bFZQK0VkbzdESkNIMjdiQXJxZUNG?=
 =?utf-8?B?V0F5ZVJheGRBcFJPZFBFMDV2M1RUVFByS1F3V1lqeVFvSm5jNzBDVVZhMmlk?=
 =?utf-8?B?QXYxY3UyL0JtWkgvV3lzaEhrQ2E1L3hpR1JhTlR5VXk3R2NYcWhFY1I3Mjgx?=
 =?utf-8?B?c1lUQUNjY0pnZnVtSDUwZTVIcEY1MjFPYzNHanJwd0QyRXJ0R3VLVlFKY0xD?=
 =?utf-8?B?THNjOVI3SFl5bGRPY1R4Nm5FTHplNnBVdWY1NVR2U1Z2bVd5VE4rT0F0K21N?=
 =?utf-8?B?OURqcjhZb05JQU84MWFNbllyWU95OGFGZ1pDeHVRQmp0elRjUXBDazJlN1RK?=
 =?utf-8?B?bERqZ0ZLT2xHcEEzTlQwcUYwSXZJN0NVbE1pU3NnZC9HUjlBci9JZ1ludDdt?=
 =?utf-8?B?WDBoK2tzdDRiRmxZQWE4MGpBeURzWFNiTnh3TDBYTzg0ZXNYaXJ1NGRDd2d5?=
 =?utf-8?B?RGNFem9oWTBEd0UxZW9TeW5NTlZpSW1qdU56MXNKRGtYTnpPY2x5ZG9ROERx?=
 =?utf-8?B?TWpsRXlGNGFER1BSRTQ4cVQ1aWM5bnY3L2FyYUxBcXdhNkFzdVY0OVh3Uldh?=
 =?utf-8?B?bkhGQVlsVTdXUFptTjY4VWpkRnV0ZUVyQ3hYb2V0SjJiMEEzM0QvMHludGFP?=
 =?utf-8?B?SFZGM0pQd1h6Q3Nzbml4di9Ea1FjRTZpbXp3dEY0bU4yM3NmQi9mNWN2cWl1?=
 =?utf-8?B?ajNhM2pFVG92T2dhT3F2OVNsNUVlVEx5RGN6UTB4NlVHY1N3Z0pEUmtwb2NX?=
 =?utf-8?B?YmVvQmVDRm0zVW4vdE5PNnU4ZWtHTm9UY2ZrTXIvMVMvcnd4ZWNDUTRCeVZU?=
 =?utf-8?B?NDROWXZDaEFnc2k1S1pWUFRUQ0xJbmhSU3N4OS95b2NubCtqVTdmK2pZT0NE?=
 =?utf-8?B?REdiT2FSblJZNmE1OVJFVVlQd3VPZnJZeURKTzArY0haa2FyQmxubm1hTUdK?=
 =?utf-8?B?RElta09XdnhFOStRTGlwOUJjNVF0Mi91SlpQMmJaUUQ0eDlEOUhSdUFjQnB2?=
 =?utf-8?B?ZkdldnVnVFZsM1YrT2xQZHYrQW9SdjlBWXRIdEQ3S2tSTElSaU1yemFPT29v?=
 =?utf-8?B?NjQxSzlTSEFjRmlXSmdXVVBKcXJDNjAxbXJnMGt5a0tITytLb0JjRlgyZkNa?=
 =?utf-8?B?OVh4WFZWS29FTFlZc1lKOS9aeERSeHpmb2ZaQm5yc05DTlgxK1RkTHlIbnBK?=
 =?utf-8?B?VlN3UVhObWgxK1Fab3QvSXJWb05oL2xhamEwZElsSmJFT01nV0h0WWkzb0hk?=
 =?utf-8?B?NkhOSWkzakNZZFQyTk56RGpHa3dnUVVYREY2QTV0UlQxZGxaeHR3LzlOYkd1?=
 =?utf-8?B?NlFXSEhiMjlaUk1leEhiekpJa3pTdHV3RGZzUlRvMytHKzVlMGk0czdOSGhv?=
 =?utf-8?B?OWpBUEFuMTRvSVZ4TXUxZWR1SS85RTE2V0JCQVZLakQ3R1ZmVlB6L0NlYXQ1?=
 =?utf-8?B?a1k1bHBMZVBIQVlQeC9xTzk5OGgwQ0NTSExSeXc5QnJJV01kUlFQbzJzZkpO?=
 =?utf-8?B?MWRGNzVFZE4yQmVHUlBYOVRrQWVuRmVWVERRVEV3VFcvTDJmRUNxL24xYkJS?=
 =?utf-8?B?d3ppTGFBcjJwN0dSbFNOQ0hvc2tBeUJPTDdodGJqdWpkQ05JL252RURNK08y?=
 =?utf-8?B?TEhyRCtmNm5tNFM3Qk5hbEJGeWU1dG4wZU5TOXpFOEVkZ21NbVZLZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a377499-6a1f-4970-5ddd-08de8ff8a5fe
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:12:03.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PdqxHdHCxxnEZdu2HW0+qHu8gST8Omv26qlaORpflyfe4FuE+KcOlmU+nLrUSeFEgJOVpUDDpq8vT3zgF5DWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3423
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12523-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: CD4CF37C1B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> Currently we need to go through raw pointers and then re-create the
> `NonNull` from the result of offsetting the raw pointer.
>=20
> Thus, now that we bump the Rust minimum version, simplify using
> `NonNull::add()` and clean the TODO note.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/alloc/allocator/iter.rs | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)


