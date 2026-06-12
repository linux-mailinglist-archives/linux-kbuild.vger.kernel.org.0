Return-Path: <linux-kbuild+bounces-13740-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vLPSLN0GLGp9JwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13740-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 15:17:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57D679B21
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 15:17:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=R93ruRrr;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13740-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13740-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52B3D3484E7C
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 13:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EE13E959A;
	Fri, 12 Jun 2026 13:11:37 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897823E9C1C;
	Fri, 12 Jun 2026 13:11:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269896; cv=fail; b=TsIe6uy8Fx6BHjisItT7VzVGXd+XoUU4UdX8JWEJ3ROafGQQY/YD4Nvr96nLpthEztrjpxIqoGmTiigrbt92HGFZG4ERaM0OdxGZi8Z0lVahe5ZUhlZlxPEw8f8LGt2auB3Q51JmRaBtHKYh/zeeuy7PNbPdFgVbfaF1NQCXzWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269896; c=relaxed/simple;
	bh=Q3Tfb03njXf+/e/LLWRMFEGwgElERiVP25dEeg4DjSc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QeVvn7fWfOf5INoF11/f3PJxYk6V0TwiyhrLHrzw4xNPAB1YQeg+sBWdBWyccKtsV8myo08jXmcgis8wJT+rd61R5ea+oiwxX4QxsQSutslcwJSW/whnpABaNlYkcULVYR01YA6pUW4uhssvLuCyTVGNh9IAeEDRsgZq4jMrlBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=R93ruRrr; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHTk3v0H7C2/JOahRdHIqg03H0kURjJFwuElMph5osEOzxJYyCh/q8RLqUXN7RZGps6+eymf6R1Jj1rFdk6oK44rcpjVfJSWgHgldJNNYCYOlYcirKWKNmqTIXnotNBwmb1sxzkL+xqMyQS7EZf2UoqV7g4S3Af4gta26RaPUHwSI7OuGxI29TdlMtIOhZCtNagmhaR4gFkGfKChAAt2AHwikxUJJg46/gnNIlxNpN9DnlS2Wk5/d75JeNs2N47UXZQEKXUq6Z944XoCYsjID+sZ6srwUR9MSfIgzYmQmxgHqXlGDORbkOALkWmlazgQMcyxj7xt58SgsjVIj6QW2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3Tfb03njXf+/e/LLWRMFEGwgElERiVP25dEeg4DjSc=;
 b=bYAUhqBFAZFJnjyy1UZyv4b/OBzY47bD+IanCqHDbhBCCLuuZn+VvisyiCB2/K3s7gWtJ8YYkX8He2dQ6rxuNKAZUwopMskV9CFZVZaYJsrG6pg+DnF2IJJsJWhhBNBa22sKM6Tq984/WC7mgy+iDdgAIBpLCNWrvu4WtDuJb6D/HKUHEZ11l9dPpplgEZ5cNhKAhbyijunqThzcnCtTHp6Hg0tldJXLoauXtRX3DhjMwv+JxxqyLGSelcpevdmGusbhI78wjzt55kE7vPBNhVVAmvdS71BoepXtK0a+plZ2ZO2QnY1BOtsx2qQfOZZNACTu+LX7/NMEdZkCwl28vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3Tfb03njXf+/e/LLWRMFEGwgElERiVP25dEeg4DjSc=;
 b=R93ruRrrhsac4RHK7l6UzcRn5d6j3Kp/61QEDdAk3UR0Jptwz2P6DBIDEbBzgLLG14c6WUdkvuHGb+ylBT0fB7L928DaTpfnxCyde8kXQq6w8xL+BKZ5WqP/cR7Qr2Kfyg0HI5gCmcul4oTkTvVmyeTwIbKErH/wBR7L4tre82YlAfVga+svtLbx4zdRqSsp18ITY8qpv9Thy3FVgWN6YIphHyCTw4hvE/EuP9xx5lX6MwUuo1cm2odD0dN8yjDdaF2fpytNLlXN6pmFLbaq/RGg8RctILzMwMu5BWIW7i5t1whslifnv4JE6iGrSeP10SDF2XrqFogZhuTjN76x8w==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB9P189MB2025.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:390::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:11:31 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:11:31 +0000
Message-ID: <de02f0dc-8840-446d-8661-928a49bb2caa@est.tech>
Date: Fri, 12 Jun 2026 15:11:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Alexander Potapenko <glider@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 sashiko-bot <sashiko-bot@kernel.org>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
 <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
 <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
 <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::21) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB9P189MB2025:EE_
X-MS-Office365-Filtering-Correlation-Id: 023d9b6a-e6db-4a07-7f21-08dec8841ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wDbgI3n6vNz81aIr8zy8kaXv+0aEjafBO0NBeAz4ANYqVcKfvLKpVQlouJtuvUXbqD2GgcstNw0/AyfYeHiQiOGgK2POzKVsAxsoB7aaANQEN/ErIxeZmE3UmQiMcN9M+vuUXp3G89LUqxwXxrO17tjQMcUhNEpq3ntpaogXE4kF8JbK/Xzol/2MRypXVHFrY5M4tCQ4VNEQ29JbrMPj4imsc5g4+rAkqiMHIeiMcx7Yx3QWbWBk6S+tDxHIPHtka4OKBwBvDt6eBbEITU4gasToTSCVLVWn+dpFAkwUte7PYSEwebFNzepMnCn85XCVWhBlRu+5YzhEb5WhMTn6tBiwwVKDK+W5VSq5GPWodywdqvi53fetR8RR+vk5LR0G/e+xUtgDsfmcX8sPWte9oQopdGFeCRYPDpJ6DX9bcKpEUrudDjDiNuwkDo/1Yv8cHwpzIMT0k6ix7KyBkCDXvCEonLAxzKPQ/3hOP5cATdCZZCAWTzUjzRU2owt7JyIGmgArPrz1DXXofc20QULqPnCu4aj0rKeUaoxmU1rIyl3/BfcjC/T9D4zGz6ELpqd7WInON62+KhDJpP3MZMS9EbccaSXc2l8FP+UrAHRQkSrpzDUo0+pyyWjyzhhjau1rfRMDOAOOvhTzArM/u8MkTRnGvbNUMHCR11v5JBQGn5HSgjbn13vxlgBdOutrX46T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGlQaUdzU2tYS2tlK2xwb3RIY0NTSWxtUGRwaXdzVUV5NU5Xci9LR2pPMU4x?=
 =?utf-8?B?MG5DMzdLYTFqcEFGVXNpVWVNZ3FHVkZycUlTeDRLbi9leWdrVTFZeUEvQ3lW?=
 =?utf-8?B?ZmhLUHZCTGhEUmVuK2dIS3grSFlMR2ErM2lGbjJZbGNaN1RTN2xpTzJLcDRZ?=
 =?utf-8?B?TU9NcExYWmRlMEVRSmN5NTBJTC9uS0REY3ZxZmFuM05ZdktlOXhVT1AwelBH?=
 =?utf-8?B?UXNtaHNReGhUYzY5STRoZmFVU2NXY1hMdlpzSHNjR3dMUmNobWpPekFTakJn?=
 =?utf-8?B?cUNmY2JVaWgxZ2ZKd05rVVgvbS8rbUVPT09aRWVEUjdTcm53R21JR3hTOUVT?=
 =?utf-8?B?MHp3dGtoU2hGYmFuRm45ZUdnOENIYWJDSmJJYmVwbnVWRDRBR2VaL2ErZXhw?=
 =?utf-8?B?ZE9ZWEROdndQbmMyVGRKNnRUenI1RENiUlhYMUI3V2duWjU4eEkySHhCY2w2?=
 =?utf-8?B?Q0FWRUVFRUt4anhuZW9yZExhc2ZVTnd3UWM4L2NWUjE4TFIvYnRReXRmV0hx?=
 =?utf-8?B?c1VSR2w0TXg1anRjaWIvSE9mMzlyVFV5a0ROMWU2TTM0d1FlZGVEUWdEbGZE?=
 =?utf-8?B?cnB5dXhFYnJhZHRhcksrMCsxRjJ6L0RNdUxldmZWalU4ZnhuYmV1ZEF0ZjVF?=
 =?utf-8?B?L21Cb2NvdGMyejhaV1JTODd4dEY5aFZybko1c3c0ejZFZE82bTlLcXZiTG1t?=
 =?utf-8?B?OHJpQ0M3TElTdFVsQXBmZ01BY1ZTQkxLVTFaaEJUVFJhV3BrT1h2azFjUFlu?=
 =?utf-8?B?K3FlWmVaY05kL0hLclltZVZzQVRVK0RqRVNrRUpiWkE3T3g0TURBbzlrWDZE?=
 =?utf-8?B?UWtNMTlwOE1wMWJqMGdHZ1hWUTJZV3h3WE0rbjRrTG94RGVQTWtSZ0pBOHIv?=
 =?utf-8?B?MXFhZy9FTkFYc0NJOElpNWlXbkhKcjVTbUlqb2dJbkJqbjJ2a2xoMDUxNEFY?=
 =?utf-8?B?QWVFQzBPVlZ2U1ozTzdIYUxFc1daSWtHWkxMenVsYm9IVHYzbzd1YU45TFFw?=
 =?utf-8?B?bjUrcjhONG5BNnJFcmYzRWRsbHJBL1kyOThtZEMvVFk3Nm5FaGh4WFBoZVgy?=
 =?utf-8?B?R1ZSWGpVNGUyVWI0QWRpR3h5SzQxVXl6eW9CY1FBRFowY3RMRjhiNGt5MENl?=
 =?utf-8?B?V01OVS9yUU1ZK3JSOWZGTWtQbVFLM3dBNVhZVlh5WFIyY3o4cXE4cGNCcWZH?=
 =?utf-8?B?R2dNb1dKbTB5NEtKSG1BY0tRSDN4Uyt4eGxETTk0ZVZUVVR4dWNnNHRac2Nu?=
 =?utf-8?B?ZkV5SVlnRDZaTSt6cXQwdVduYTJuWWlnS1oyYzFCYWJPVmRUQ3YyMytiVHlC?=
 =?utf-8?B?eUdWdjBWRTVFbWEwdDVmeFFWaGtBaVV5MmZBU0RoM1hlbTBaeDlla1hNRXlx?=
 =?utf-8?B?ZE81UEUrTVdaVWdSWmhGMkVleG55OVE5bzRrZVNHbWFoSGI2VHJUMUcxQmZM?=
 =?utf-8?B?ZFpiNUJVWG5tNndrblFIZjZ6VlhhNWNRVWFxRExQTjBVT09YUkROQ0JWOFU3?=
 =?utf-8?B?dVBUbjJvRVlKeEYzMkp6amF3MllUbDRRUStBOEQ0cGpSWkNiYnJvOEltcGpl?=
 =?utf-8?B?VXd4a1dnbTJ5enYyOUxwK2h2Q2RJUFEvRDhQS3hRM3hxNW9zczhoZDc4VkRh?=
 =?utf-8?B?eHNLd1JxV2dGVTJaMlo0Z2RPREF3Sy9vWExjdkVUYmE0bSs5eFlqalVkR2lk?=
 =?utf-8?B?dEwvYWhLUGpPTFZFY1lLZ0xIK3g2dVB5OEVHT3EzV055OTJTZ2MrUjV0VW1m?=
 =?utf-8?B?NnF5T0tJMy96MG5VVkNhcXFtMTA5eU5BVnhRc3FWYXc5U1FEUnRHSUlhajYv?=
 =?utf-8?B?S2tCa3BFZndJM0lZam5ObVBEYTlJMFlFRXVOVlFnZ1F4NjRWUGFNYkU5eWpy?=
 =?utf-8?B?cUNaNkV4cHRCSk5uZEl4SEN2bklDNTBMS2VIZnhEVG1qRFRGOHNuOVYxY3Rp?=
 =?utf-8?B?eHFWUWJMZ2Z2NDhVT0c0OGppUGFRdE83TzVXMFFvcGFIKzQrTmdMYlNCdVRM?=
 =?utf-8?B?OUN4azhlMGhZKzE4Z1BCRnd6TjdTMDg5QzhsNndDeDhCZFVTaE9YbHdRek5v?=
 =?utf-8?B?MWFLWExQbWlrVVZMSHZ3Q0ZYcGFDTTMxa0txRDIxVmh0Wm9HRW90ZFBqb2Vp?=
 =?utf-8?B?V1UwUkFGL0dEYzNKNXZyOVBZYjdBZU5ucW96TzMxY08ybEVJaHJDL1hjQ3pm?=
 =?utf-8?B?ZmxtM3hRQ1V4OVFkNk5jREdDcXdjcWdZWjQ0YS9BanFNVEIzZmU2bm15dG93?=
 =?utf-8?B?cXVUdE1OdkpMR21XbnNHNDQ0VmJ1Tm5JaXJYNkFESnBCWnZBTHcrR0hrY3Bw?=
 =?utf-8?B?Y3NjUHBJQlFwb3pXcUgyanhnMXJuN1h0enRRNnY5bjFnNWVLNC9vUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 023d9b6a-e6db-4a07-7f21-08dec8841ec3
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:11:31.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaBvngE+jWO8OmOKJbYaVnQO2G6ot5zAc1NzGJ3RuoAjJG0P5RjTpNdCLmsvpPDRX89pyEL7rX0W7UZ0BmQmGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13740-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:glider@google.com,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:llvm@l
 ists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[est.tech];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[est.tech:+];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C57D679B21

Hi Alexander,

> On Fri, Jun 12, 2026 at 9:25 AM Yunseong Kim <yunseong.kim@est.tech> wrote:
>>
>> Hi Alexander,
>>
>>> On Thu, Jun 11, 2026 at 6:21 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
>>>>
>>>> [snip...]
>>
>> Thank you for your guide. I'll remove it in the next patch set.
> Also please make sure to update the patch version. It's really hard to
> distinguish between "[RFC PATCH v2 n/6]" and "[RFC PATCH v2 m/14]"
> when both series pop up in the inbox.


My apologies for the noise in the v1 (Mistakenly sent v2).

I will ensure the v3 patch is thoroughly cleaned up before submitting.

Thank you again, for the review.

Best regards,
Yunseong


