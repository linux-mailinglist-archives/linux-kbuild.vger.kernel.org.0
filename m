Return-Path: <linux-kbuild+bounces-13738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BiSuDc4BLGrYJQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13738-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:55:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5A16798A1
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:55:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=zmbFX05k;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13738-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13738-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC02E303CF09
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD233DC4C2;
	Fri, 12 Jun 2026 12:51:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5E3E3179;
	Fri, 12 Jun 2026 12:51:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268693; cv=fail; b=Z3pmCG2YJhKJWyveOz2M9PDsQ7ogl2EC5C+pz6BM+tzw49yp82wjcMX2VI08Dib1836UGOImbhOH3sQ8sqi9XpuBveDC8ptHaLIU6dARKEYVbi/ansdp/7dKBfxiegcnSy2/+S2YP5jhpdxNmgJ316usEAzxLqvg4/tNmXLKwvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268693; c=relaxed/simple;
	bh=Is1Bnqw/5MiY1cDHmKmRqOQdWioUGo2/RZA49JAYI6g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zx68FGyG4sOvpedTIZFIA3oRp1sah7qOy3lj1hdvujr3LCNFDfUge3QBzQqOdKwYfEHuOsu46FTKxkWX2PlwTjhKLTKBJSeRZY+zc+davOP3etPVyIPNFseQr+M9ltEGjp7RrTG6GFdypXAFbpqmvJJ99bJTf6NqjBNg4t8y75c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=zmbFX05k; arc=fail smtp.client-ip=52.101.66.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPmrRJZwGPiMi4IDVR4jCiBG/juj4CQNgv0rmoikBxN7Oi8xLlHAyUKVn/49nxkBuViMKOAE+ZOimNpGVh0Ic+gSsM7CM80+HgRatg0NiM9pfYyE52mJM/gJ+z4wnNHbGaJdbe0bTGVDaCmTmQ3HiN18C0mXwZKvGMsvP7MlkStTFQ6ulUXuctPFrwCotmnLn8+jxbtyoo4lOI5HgJbWsOwv6e3L0WTt3Kii041ohMeyJftaLJTWamfGdlSHFsifF/U4c5QR4Aj6D7CsoSzNKVxbzwc7X5vuPswJettLA0Eny5RwleLEDBWlHFYeBJ2QDKj7EHfGRIw9VcBNPanUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbgjOD9s/DYH429AkZYSZ95JcwLqIKgcINL/rYXrulo=;
 b=Adu9MsgfSXmlt1vzLZOAVBV/PZtreBg8OSQEOrzA/PMDikoQO1IUrQKyDA2TtXphXnN924/iDlF+ZpfuG2T9n2sWPFFVuaTOZCH+cxPZyC2XGwJlQbO8REkoK3j/Dycaulud2PG2QVmQ5baN23ZefJrnami2/HZpchd63qOREsQvu2jiy0mhgypfRb1Z6o5qEb5l0Z4/Yu0sZ6W/ri3wqXc8nGYrm3PFm8XIMEU1zloH3DyTnLUQDi+MCQ4hq2UW8dxzjJZNvfTfEqyLcSUWiFz0gD8MsuS9oAQ0EQda90J13HrjbbCMZSw5HsD9BOGmefKljrUheteu7hkrr+qinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbgjOD9s/DYH429AkZYSZ95JcwLqIKgcINL/rYXrulo=;
 b=zmbFX05krU4qDkplw89c5pOp9JeHoCpeLd8xaMD0zNJQstrY5i2AdCvwmz1R/FkaKt5TwbenwffOMhzonAygHgFgUWN6vmgy4nvKlxl4Pl4FjrDLddp6UVW2JDoUFxZKgbAQAvtQDLKs+gIUdnSRxEysUTuAk4o2rlXRWuZBw/cBztaXztRsdTSKEKq5SeQ3klMGfKdbbqAwfeUIkX5rbBXbwSXwJN80P4cKyylYtu4xqhYvuPAbRrAAJyQy8JmAPbHfCthq+EYGsuVskqnNPzXU+L64YkpHOhY74NNcD3A3m3SuCaz+OjFkEw2ZRuiASlsfRGiimof8Lao9UsNCJw==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by GV1P189MB2012.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:51:24 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:51:24 +0000
Message-ID: <9ef3ee07-34dd-419d-86ba-a8217893259e@est.tech>
Date: Fri, 12 Jun 2026 14:51:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
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
 Yunseong Kim <ysk@kzalloc.com>, Yunseong Kim <yunseong.kim@ericsson.com>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
 <CAG_fn=WYdnX_09RNs3sTQWn+KZZaw+X9a=s1Uk1bqd3gW04h6Q@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <CAG_fn=WYdnX_09RNs3sTQWn+KZZaw+X9a=s1Uk1bqd3gW04h6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0651.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::17) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|GV1P189MB2012:EE_
X-MS-Office365-Filtering-Correlation-Id: 64383ddf-c2d4-4971-a1e9-08dec8814f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	19EoHnULwshmmueBRtpd878pOTvpsgCsyUgdRVpEE8nvIxSzSPck73EoQqJw0JNzMSM4xr4dbJ/Dd/+ZfjP5rx9vg+0fvH4//Kupf83DK4qDNUECAlq977kFtxzlr6wMXn/tMoycTFu3vFjmTy1M627xWWM7lsY1OtarUAREA1dYxL2VOuOf1x4wRrVrx6SLH3jiXXQL0Ajpb1UnV7yu4pfyLc290G3BwL6Qk0IeLcIR0SdOmvIlgsKRMwvkUwzw5M7MJ8YWMF4g/43aVO0sjHbRlzlrFANkyfYwSTbto+a1rAdSXBxBRC+EdJX4hbbz4XjuEX0tE7UksGfVQRQM7tG/XnmvR5GvASP7CmcA/o5HniKhLIvDB8o4rK1N9WDwKs9aJrn1R675bVVh9HZxWFuH/rXeGfhh/km6TYPUx+JutPyaNEMPYn0Em5efjq9pTtUOS0ECW1kMSIxCd2uku6oA8l0hnkkrR1auFnH0Et4w37Gtsh+blFchCnhXiPR2mYKfGFTmc2WAfn+yHBg8vRnT3op3dtK2jR5rYN60yKZac42CoOahoeC4gNFikugfvcflN1F6/gaxJQJv9AfsjX8Z89V5Uuu6sJiQU8V/WuakOUJBTDZqXOVrrIXm11Tvwav9f8Zr1GEo1q/mVhm/LGKh5aksSyyyFroPpRcGUtANJTk+b5eQ2oXSlAOaFMXN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2dLSFhtRm04K3lyb1N5TlNKVEg3UU5DMmhua1loNjlMQWpnRlhKQ3pCVWtU?=
 =?utf-8?B?NGw4aE92eVNGeEVhaDZKaFNidWwxRzIxR1lGNko4ckp6eGZmTDQxcjR5NFBq?=
 =?utf-8?B?R3g1dkZqQTNWMGlBaHFDR2tMUjZJVGFlRnBhbGR1QXdPcTNXWEhaSkFQYWhy?=
 =?utf-8?B?Zy9adlhMd1drRkRRQWlVSk5mcGx4RDF6NE5YTjE3SE1sQ2RkZ1lGL2ZsaXRZ?=
 =?utf-8?B?RWhud3Z2ZEF5RkFMSjZKUXRWcElhZTZPQjFzekxVWkxQZEg0UlltNzIrQ0lr?=
 =?utf-8?B?dkxUa1UwRFkxblNrSWtCcDh5aGFhZ3BDQVI4QWNxMmdYTEpMb21qVFc0S1Vp?=
 =?utf-8?B?QXJuZ0NkcHJ1NERCL0FCSW92d2FTTlkxRUUrRHVnZDV1N1Eyd1E4U1JIdUM2?=
 =?utf-8?B?TzVvbEhpWGxpNDQ4cnAyWEh4YWtYekp4ZWVTUDZGdEJjOUVjaGVlbjY3Q3lv?=
 =?utf-8?B?U3FDbmVLSTF4SHp4eTl1V3BKY29yUlhDSUVRVDR5cTdDMS9KVnVqU0pqV2pF?=
 =?utf-8?B?QXNNdzQ2d2VjZWpzN1ZJMGthSDgyei9yT2VCcm5DZnNLcTZhV1k3UUphb2lm?=
 =?utf-8?B?RHVoYTdkbGE1bXpVaW5jc3JSTUlERkpzeWJXVHBDRnluWHVZUmdqWGN0eW9X?=
 =?utf-8?B?RzlVM3BMMjN1UEZiOUEvSGhCKzFGaVpISVpvNVdGc2JHd2RFN1lROGNxdFBL?=
 =?utf-8?B?ZkNmOGN2cEdrN3l5dHREb0NBcjZUakhVMWxUWk5lV1FrZm5YdjJnOUJCVzJV?=
 =?utf-8?B?V3V1U1VNcHY5cXF0STRGMWliWVFjR0VYQmp6MkxucmJhWGovRnQycU9BL3F1?=
 =?utf-8?B?OWx2dnNid3l0a3p6dEZ2SC95SkJySWpYZERMZnN0ZklYMFVVaHB5dElvbkRX?=
 =?utf-8?B?RXNzVkRXWWlkclBWYzdQR0tuektnR2ZpNjloaGlHT2dlOE9paGhVczRNeDdS?=
 =?utf-8?B?bVRFb3JvTUsvOGIrdEhkZ2Qwd05XR1B0QlNRd3dXUXBiaHpXZ05uT3p0TFdF?=
 =?utf-8?B?SE54dlFwK3F6TmRRSG1Fak01blMvK1R3bzk4UzNmUkNaQUkyMXhUUEFNN1FD?=
 =?utf-8?B?eWxIZzJQc242VCtWSno2OU82cFFQVWRZT3NsRndEUFNIYWtjMlB3K0wxUHFH?=
 =?utf-8?B?VU1KU2l4aE1DOEFPOW1lWnJwMmVFcDJZOEZqVzkyWWU0aG9QNFNwZGIyb1Rm?=
 =?utf-8?B?cU9MT0hFQUVtZFFzRmhZVXRnZjM5N0NMbFRFREhiL0twdkRSYzl6bjNRQ0tk?=
 =?utf-8?B?dmdtQlNvN1ZGdGZ3Q3E1SU12Sk9yVlJMWTB3L1kvTHo4dUtNL3RoT2oxOGEw?=
 =?utf-8?B?c3hxUUNoTXVVRHZtYkQ0VmEyVVUrVG5xNk5lWlRFcVhtNXB2SkozVm9rcXlX?=
 =?utf-8?B?QnZTbFpNWDcwa1dNRk9yMnFXeUJsVDJhSTZsZjZ0MlE3cDROenM0QVV4bDVH?=
 =?utf-8?B?OHNlSno0aEcwVm85Y2dMVjhmakJzT1BacUJDQUVLZFUvVEJ2VUpiNllYM3Qr?=
 =?utf-8?B?YkFMWGRnRVBUQVBoR01KQ2NuQzl4ZmtwSXFpL0RRM2krTzR6dkczdjQrRXly?=
 =?utf-8?B?RTA0Ny9TamlkYW85MGRJTmNseU94ZW9RQWI2ZnJPVlJ6QnJsSVIvU0Zla3lS?=
 =?utf-8?B?RXFvNlRRY2lqOUNEN1c1b2FIaUNZY3ZvdjMxSFRheFY5YlRCQ0wzMXFiajhx?=
 =?utf-8?B?STRlb1BuaEJqMDdkZ3RLd0Y1THA5c0FiMkZONzNwajhZUEI0cytvTk1uTkYx?=
 =?utf-8?B?R29pKy8zK3JKSmtVTzZEem83WlY1aWRuY3VzdkFXUkVXTUxQTEhSby9tdHBP?=
 =?utf-8?B?S0dHNWdtVVFMR0h3UWEwWExVQTdSRDRHSkpZQnRwanhMTXI2VWhEOWVPb3R1?=
 =?utf-8?B?U2NnejRJRkZ0U3FjMlpibEY4MzhXemZiZ2czdXBjNDZ0RGwyYzdoNm1OMFBG?=
 =?utf-8?B?VjU1bmpOb0NSZ1BOd2NzNVRtMGdpbEJhR2NHQktRaGo3VFlMT1k3ZUV5WENM?=
 =?utf-8?B?UWtyWHFMdUFFWmIyM1EwWDYvOW54ZEN4WldkS1lvaG9zdTNTUmNUUGEzcTlR?=
 =?utf-8?B?d2FRNFlRVzYyckN4bWpGeDdiNlZrRGVYaWpROGpJekpFNUYzUmlnUFAyM2Vw?=
 =?utf-8?B?cTlvcmZBMXk4UTFGNnVQT2VhYTBzKy9YR2hWWFR6WDVzakZKa0ZmMnBlS0E1?=
 =?utf-8?B?SzB5a28vMUJqdkNYeC9ka3UrNldxVjhLK00wQ2xzQlVnbS90SUtLSjRPeko2?=
 =?utf-8?B?ZjMxdW1vUUtWN1JPYWppcHVuVjQ3ZWpWd0syd2xqMG9qZ0lYMHdvKzljVk5C?=
 =?utf-8?B?Zm9pOXZMOURXbkRDOCtTY2dueUFEeDlmeHpKL25GcG5rU1BSLzF3UT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 64383ddf-c2d4-4971-a1e9-08dec8814f6b
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:51:24.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBsOjCgOnvln6gwkfs9miwfsiGao0dy+UTA46WdNuknU+C0+UXUuT5fEFC/pp6TQUK1H6Y0/xFRsJPgdjNQMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2012
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13738-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:glider@google.com,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:llvm@l
 ists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:ysk@kzalloc.com,m:yunseong.kim@ericsson.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[est.tech];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kvack.org,kzalloc.com,ericsson.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[est.tech:+];
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C5A16798A1

Hi Alexander,

> On Thu, Jun 11, 2026 at 6:21 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
>>
>> [snip...]
>> ---
>>  include/linux/sched.h  |  10 ++
>>  kernel/Makefile        |   3 +
>>  kernel/kcov.c          |   2 +
>>  kernel/kcov_dataflow.c | 324 +++++++++++++++++++++++++++++++++++++++++++++++++
> 
> I think the total size of kcov_dataflow.c doesn't justify splitting it
> in multiple patches.

Thanks for the feedback. I'll combine the changes into a single patch for the              
next version.

Best regards,
Yunseong


