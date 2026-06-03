Return-Path: <linux-kbuild+bounces-13544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N1guNuVoIGpE3AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13544-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:48:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6A63A43A
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:48:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=moHX5J3D;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13544-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13544-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4ECA730008BB
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 17:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E0844D013;
	Wed,  3 Jun 2026 17:43:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F18453495;
	Wed,  3 Jun 2026 17:43:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508633; cv=fail; b=vD1vrVv6sQPQkfe7xu3OAiT5X/gpUTQPFMeIEmfCkHEWv+p41LkKCGxMyuP12YpSbkRr3G4hSAi/b0tWdBNcJYMSyobr+fwpDpmpGjdqe+zk7OILlXMhBjDL8iiYZQCNYg9VhIMe16Jkhi/v7qYQ8eiSivCHYVuHI3pJ5GKic6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508633; c=relaxed/simple;
	bh=t4ne+rbpe7Er/mY/UQq9toK9844yPlpn7fPZ5NmAUuM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LO6v9lyvAeCdQ0ZHI2/BOIK8Kg4Jf0c+saVaLYVD/kbg6rdWpp/xxvOwSfUJdDA0aDnzg3gh40By3gY1ZR2T6ZcGVs0qElWvPgtW7jEs+T31QOWP3DZ19audDyeoOZQZqHawc36ovsoELyD2GSx6CJ+AqTVpjb5z74A511/u0+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=moHX5J3D; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNuhMr2dZifI9al1KsPCjzaKzgr8wPwEiDImyHldBJrigYlM4nMF3GrIdd2LO23tGUlQV/LUqIMRiaIyYl67svbmNEvf2dNyfCvCXWWifVQCLGVtOkMpAhNdZvuGmXMexIrv9Dsf8SO+oz4u+vI+OpXXtpOorufW2HKFlmt6Yx2m7RNBdQldKsKTWoaIPfTYM6ZpOe6BWiqBvKU1Sr+ieV2JI/NTuOGhGQB77JH8STq9zS+Kke18mKB9UY1rtyH+T/mlHAAzHmbYh5T7hqj+lD2QJSJgo0ChW4JNjQKwkpojoYfSwg81bYYrKYoDB2Pj8iuLz3SD5JcqLLTZUqPOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwfJzZY8C57sWivUEr4WS37gZF+YigpqadsWzsCMwVU=;
 b=AbA8ElmEz5CGg7JIhubxwdkcQJ3wEBgB5NGMidmDYSKxAzG75MCjQVoQF1K6ihoYYM208oRLMl6mZo4nhVMGC/2ruamLi19xnG5//B38Z0fw8JqbADTdh1iE40/aduwwFwXvcWbItnHrMiZRGEsXQiUu8GB0cgjJZhGMnaqbAkz0fAbZ/rR+jmiXEQPuGB6Eay01VULZWQX5s+5YLkPQhhwepepEwn6GH9AZzWFweZu/A2DZb9BhrayMAI5AosaMRuciL3NT8E6dEV/RS5xDn3ogbN/34wRoG3ST9hHWL5YOcZmTpOQMcL7N+uB0l4pKxubB2p73DwbTHNv+0E0CsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwfJzZY8C57sWivUEr4WS37gZF+YigpqadsWzsCMwVU=;
 b=moHX5J3DTEAgZwvRD/i9i/QFc/XKXh+YqAGvb/QTczOs3G4qcFUl5H+wcJY22AZQ4vMTr4dgCfMdO7PtL4cphHQemsS5QiTkMcKgHuSQV8hy1lu4ooO20j/bxhAyShN7bFeAkSsfzUXordXyQwXWR0cgAOChGz6NCKqprtijSEI25MPNalx57No0jauE0D3rfYP123g3F72kc8rr1plNRZUasSjK3U7OXmX+8hTEKruAJbyp2+NkbfxkZYVsdxPyx2KBDGYZXbcyTzKeUV4p0LPcQ3Y/5BDZyaeSG/Dry26JQs5hpaNppIg57Srji3NDxYkdAz1kp4SrkTm6c6xCAA==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0929.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:43:48 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:43:48 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 19:43:29 +0200
Subject: [RFC PATCH v2 2/6] kcov: add build system support for dataflow
 instrumentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Yunseong Kim <yunseong.kim@est.tech>, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Yunseong Kim <ysk@kzalloc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780508619; l=2724;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=t4ne+rbpe7Er/mY/UQq9toK9844yPlpn7fPZ5NmAUuM=;
 b=LDpTwQAz+pbub5nkL4XVGGf1e1nGMWyYSGf3YuDpS0iyfTPHVzg08aTPrqW25Pb86BIw3u0wp
 zpu8Kw5/PU3DFL3pmwHYfjd+6CeCaAd0M8AotBHNP9XktTGy7+1VggE
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DUZPR01CA0260.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::8) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0929:EE_
X-MS-Office365-Filtering-Correlation-Id: babcf569-8ed4-48c8-66e7-08dec197aad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4MkQtKd9zlc3K7KUIn7E//uW/ww2/fcUZHmvmGnqHzhq7pQKF+rTmWS8TlSn3PSLBdmQ+wvWKJ6Oep4ua6H8lqmDkQXzSKliiNtYrhluDINvstJK4Rw4piSIfvEgIFxPk2NJSIW0Uhs1r6YIxLS57v4NZQKBoImJml3EGk64HH0TP7FiSfL6ECNyqet5WEDBNKiK4EI2nokDD43tuONvJRBk1SnCLUk/I8jLutXdoG4eBdYWcs5Kqxk+uZa+l7mulJpYI9WfXvDyV6k4yq9IowxlGus61XzSrrHy7wruccpbcRfNa7UZYB1t8E7kte5s4hNqkkY+jREi+aCMWrWspRodOblijbBvESE9+H0vepMUJKY9VM60+DI+KRb+SPlJt0g1PKTTrSj4tId8Mus9MMbUwsT1WzxPPBwi/cFpgdoXmzE5tdAugmuFEXidcmnf45JnA4hksIm6wZ1ZyqZBUqIr3S57c0PiWby9QTY+DOg4MkCyRzApwTibnu8EZK5XeReX2BJVFysXL2xRtzZhDMrO4vcNbhEs+VzqLEHVY97u4mWAsnvzPba5XCrnsvLmnkYPr3lDJZ9C5R3DOdK36MHSCzjxYdXE/l266IL+VOwBrOfqhvYm5YMIjKVGqZfPCUWrY6teAe5jd5EPuMhmNEOZsMtRgIX8SEgHY2GjtY2w1jU5qGV9y9fqYsMXDtGtzWlwqW5VTin3e1gDXigJf+30HUl4CzxThPxUK7K6gfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUx2SXNpMzVYSWhLcThjelY0Ym1CZWM5bzZ2M1dMMUhSMCswMjkwUW9jUGhN?=
 =?utf-8?B?eXZyY1dTNGd1L0EyQngzSTFjWGNrMXU1M05GMngzUWVKY3hIOTVpY25Rc3J1?=
 =?utf-8?B?Y2todEtGZURmZkdKdTljSGJQWWtaY0thOEhxeUZzc0N4Tkc5RjlSL3IxZFdw?=
 =?utf-8?B?VHRvWHl6b051RkY4ZmxvUHZOTVJtZUdjZGlGV2FHamxXRmpnaDBIcVh2S0FZ?=
 =?utf-8?B?WFRKQU82MjJGdFpaZ2hLNzFjVjZBdENqQ2tNT25RY0J3UllTQ3g3MUVTbWlT?=
 =?utf-8?B?NzZ3OG1vNm9MUmhVTHBSVG1KK05uWEJ6dWk0NnUveFhNQWh1cWdiQ2FWR2Rv?=
 =?utf-8?B?WHFGelN5RzY3SHhFckRLOHUwQkhIb2V3bFdieEpjSGFMMlRQMlpYTlRycHZ0?=
 =?utf-8?B?QjZya3VOMTkvS2xOTGI0aHVNRmFGYWNUZ1lOWVhFdUFRTlBtZjMrMTVBNVFT?=
 =?utf-8?B?WVJNaWQwenVSblRBY0g0VXZVeUUxemVSWjNjMnJyZ01mOWdGVFlQM1FQdGZl?=
 =?utf-8?B?QTAxM0RENWoxaGFoQjRSelB0QWVkK1VtMjFBbkxSNlNzejdEenNuVlBzb1Mw?=
 =?utf-8?B?c1ZqWjFUaDlaS3JNUXlRRTU2Nm9LdldtZGhZVGF2c0NlSnlWSUhIUEZXblhs?=
 =?utf-8?B?WGtVNHU4bWloSDBIMWZPSW1OeVB5WWFwQVVIY1FFbXFCOEoyY2ttWnE1MVNW?=
 =?utf-8?B?Y2FvZ3lOYmJoTmRnK3crb2djT0lsRm1Xd1RqdzJqeVRjNFV6VE15QmRKam5P?=
 =?utf-8?B?a29lK08xU2t4emVzK3ZOeVh3VjByeGVFaHBCeE50RlhRaGltcWRRc1NOMm9K?=
 =?utf-8?B?SU0reW4yTE5PendjRXAvK1VMclpwTVIrT1F3N25Dc1VhR1IxUWZxTDU5Nkt2?=
 =?utf-8?B?aFVKYVJwSHJiMFhEdWVoSXdxVFFoamtXSEJGdFhzM2dva3BLc3hGYjRWWWtj?=
 =?utf-8?B?MWJ3UTY5MDM3M2JYL0t0WXdtc1RvK3NzaGw5d0haTlFqSFpOR1FST0IyVTlU?=
 =?utf-8?B?S1psRHUyTzZHUXlOWGtjRS9NR0xveDE5NEpIOUt1Sk9nR1lUYVFEc1JpeVJC?=
 =?utf-8?B?ZDRsak8vcjN2eVlnTVlzK0kxRE9nNlZEUjNIUWJmdXllaHozN1FJeFRrT0pT?=
 =?utf-8?B?Q3ZlOWFGZlhBWnFSazVsLzNDYzRJZlJSOFJtUUdaRmw4aTkvTEVNZG1ZNjZn?=
 =?utf-8?B?UURHdmUzUXlUK3Zta2NoaGU2QlBQZ3R1TGV6YWYxN1M1a3hSeGgyRUNzMFZk?=
 =?utf-8?B?ZCtlQkxtNFZGby9ra2poVVFBdjV4Q0dKV1daTGo5T3NoVnpjUXVDdW9CbjY3?=
 =?utf-8?B?UC9UMjF3dW5LRndtR1pPeGx5b2dGcXN1OW96LzdWWERSQ3NBWXkwaWNUOTAy?=
 =?utf-8?B?bWJWOWVPMFlrYmNLKzRVUVpyZXVMUzZzclYycWJQb3JlT0pZOFBKbHhIbTcy?=
 =?utf-8?B?QjFtUzArSnNIa2NqcllHRVF0MjdkZ0wyd0JLYTF3MnphbVJnd2ZSZnBkSjYy?=
 =?utf-8?B?OHVxQVYzazFCd2x5UmFmbGNhS0ovN2ZqY2ZQZU9uLzI4U1FJWTFnblpoQnBS?=
 =?utf-8?B?clBMNzRPSkZhV0JlODN5b1BtVzRwMWttNmJYZHcyT01RQ251aStRQnRjNndj?=
 =?utf-8?B?YlFhak15aHc0c3Q0bW95RDZtWHRZNnJqQWx0STViWnBmckl2K0F3bGl5TjNn?=
 =?utf-8?B?VWEvS2JZc0hVMXZ3YkdGK05QWUJVUDhQSWpzaXRmaXczOGJTNVdLNit4Rkxy?=
 =?utf-8?B?WUJuVUlHSFhNR1hobmI3NzJoMnpQNmZzbzd1MC92alBhaUdvWG02TXN3SnpL?=
 =?utf-8?B?RkROVUgxRTJvWldBL2J1WXRIbGJqM1Zud283QkY4bjdLcDlDWmpwWFg3eGp4?=
 =?utf-8?B?eDh5QjZ1MXJDOUU4eisyWjJxM2w4QW5NYXVLczZwbFVOWDJ1RUFJU2h5TFg1?=
 =?utf-8?B?ejdKRm1LR0NRQk5uTUloTFc4cmZzcTEzQ3dLQU9wWFlJZ01QdWl4TE8vMVRp?=
 =?utf-8?B?M0FNK05oazlrQmFScE5aMTJuWTBoNkcxZEdIOHZtYzBRMFVrRElCZHJiSk1x?=
 =?utf-8?B?M2dYbStGdDRxRUIvOHo0Zm81V3dTbUlRQXI0UHBMUXcyMFN5ZThNT0JFNWJt?=
 =?utf-8?B?VlRTUUJKUUlqWEhWN1VPTlEzU0RDWUlFaGVnbkxOT0lmVjZ4ZXJUNzdqT3BQ?=
 =?utf-8?B?OXQ0TGFxY1FzeWJjUWFDZktuYXI1TGQxWjhUeENRRDlINXRhWjVONFViL0hv?=
 =?utf-8?B?eDR2cXFBUkZJeUphWjBqREFKWGM5YUQ2UXlmZk1TOFIrcDFQTFVqMVgvQWlm?=
 =?utf-8?B?alVzM0d5NlE3Z2NhV1BYSE5Vb1hkMHF2cFV0MXoyOW52WW9lTDRoUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: babcf569-8ed4-48c8-66e7-08dec197aad0
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:43:48.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbNM/uO/xfTp6VGI428hTjlde0D9bj2uF8xewZWIk57aWRGtehr8K/zd4yoyq214pmXZimy2OYU4N7LIGInl6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0929
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13544-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org];
	DMARC_NA(0.00)[est.tech];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[est.tech:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,est.tech:mid,est.tech:dkim,est.tech:from_mime,est.tech:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEA6A63A43A

Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
scripts/Makefile.kcov, containing:
  -fsanitize-coverage=dataflow-args,dataflow-ret -g
  (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)

scripts/Makefile.lib applies these flags when a module's Makefile sets:
  KCOV_DATAFLOW_file.o := y   (per-file)
  KCOV_DATAFLOW := y          (per-directory)

Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
The flags are only applied to kernel objects (same guard as basic KCOV).

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 scripts/Makefile.kcov | 6 ++++++
 scripts/Makefile.lib  | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 78305a84ba9d..101173fe194b 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -2,10 +2,16 @@
 kcov-flags-y					+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 
+# KCOV dataflow: trace function args and return values
+kcov-dataflow-flags-y := -fsanitize-coverage=dataflow-args,dataflow-ret -g
+kcov-dataflow-flags-$(CONFIG_KCOV_DATAFLOW_NO_INLINE) += -fno-inline
+
 kcov-rflags-y					+= -Cpasses=sancov-module
 kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-level=3
 kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-trace-pc
 kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -Cllvm-args=-sanitizer-coverage-trace-compares
 
 export CFLAGS_KCOV := $(kcov-flags-y)
+export CFLAGS_KCOV_DATAFLOW := $(kcov-dataflow-flags-y)
+export RUSTFLAGS_KCOV_DATAFLOW := -Cpasses=sancov-module -Cllvm-args=-sanitizer-coverage-level=3 -Cllvm-args=-sanitizer-coverage-dataflow-args -Cllvm-args=-sanitizer-coverage-dataflow-ret -Cdebuginfo=2
 export RUSTFLAGS_KCOV := $(kcov-rflags-y)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 80e127c75a93..519bf651cdcf 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -88,6 +88,13 @@ _c_flags += $(if $(patsubst n%,, \
 _rust_flags += $(if $(patsubst n%,, \
 	$(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
 	$(RUSTFLAGS_KCOV))
+# KCOV dataflow: per-file opt-in or global via CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
+_c_flags += $(if $(patsubst n%,, \
+	$(KCOV_DATAFLOW_$(target-stem).o)$(KCOV_DATAFLOW)$(if $(is-kernel-object),$(CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL))), \
+	$(CFLAGS_KCOV_DATAFLOW))
+_rust_flags += $(if $(patsubst n%,, \
+	$(KCOV_DATAFLOW_$(target-stem).o)$(KCOV_DATAFLOW)$(if $(is-kernel-object),$(CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL))), \
+	$(RUSTFLAGS_KCOV_DATAFLOW))
 endif
 
 #

-- 
2.43.0


