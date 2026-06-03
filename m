Return-Path: <linux-kbuild+bounces-13547-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M48kLLBoIGo73AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13547-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:47:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6763A42F
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:47:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=z9H5Vghj;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13547-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13547-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C027F3020295
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 17:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C51481FA1;
	Wed,  3 Jun 2026 17:44:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DCB481AB5;
	Wed,  3 Jun 2026 17:43:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508640; cv=fail; b=REZ6Ho8AaOknCA/HFW+LMxgXi2CPpFjPFU3PIOReB/J5OlNLDYavElaVjRilsl3V1XjH7wFlMaHHDr3S7lS4/JkeQ8TSHFIRVSJj2CdfqTLG7FzytJ+FSmiHAP0oymHyt0hANaM8a/+HTSYYFu0GGoQTFt9nOyEWAwvjbYK5lHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508640; c=relaxed/simple;
	bh=syIiSLzTslOa/iARhIAEp1YxcgsuWQ88mMQyVHe0HuY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nHwEFi6fPSSV7H403n/X0SgavIBHaZMubMlUHIDc7velBvLgCCboxLclhio7CUGSaDR4yR4nrAs96IpSBGvQnoRM84eTLs39baiAXqWgSlkKrQaItmh189QsTs0BABSlqlZmDpDbhef22Wt/hgxl1nYk6z7Lnx6PDJN6jlhYEMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=z9H5Vghj; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJr5CT1TwO/1XYiRfxRRYgItgjnUvhU1p8cYQKQMD5SvGIB8HoOEHuBvS6FH/ccSH4ZUjPmMR9PDj2cIssihpIzpl9VvdZeiFOv+Ak/KtTA89veyEF8+T3cbkWJhJEEqjssQlanVQtawhVfLhODTer23Dlc/iD8KOmCrorOHFi1JqfWCYM+zFM4/YjgHkyn9nBiJ39b5+4XnaTO/I+k4cAhnvkQvLii9nL29Lotc3STMUFNX5aKUro6g0YIHDd3Gqc/Q/HEwi6m9AygZtNFCQGY5oKQGL6GGMMU9iGFyjJdiTmEl7hxwPIEB9jsjtF1W4azdI3vZCP0TFmyuhOEdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e09OlxeWLs2PvX07k0LCCp/tdU+Z4gcnbWiixtMl0ls=;
 b=riEsfIxQ7e4yYnIJrFLleOfRekIsIJEOSURQTfbhoFmL1vF75bEl0qQxHiks2DNB8aH7UwkdaFpu+1d4DD2Ptgnp4uVVs+Q02VvfYoR+WM3BVkFDf/LIzp72DoWtdwx0nKvHxndaEnv7gBKEw2ntS2UpPyo/v1UpBC1c4qgrLW1NEBoRPZrQ3VzCLzh4TvTHsUWzUzThBQMPL4ZJcdWAgxGdlhlmOm6KXqwhCITMeHAiBb1v9fdhX8yIU9/DyOZx+VGytnkOlg+at+7HJo1ux1vhsOmAResAiPurfsnzxdGzCDODjv3PyWKS2S6NZGr9DkTPl0ZpBdpfrZpei9cJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e09OlxeWLs2PvX07k0LCCp/tdU+Z4gcnbWiixtMl0ls=;
 b=z9H5VghjFZxUQ2Z+Y47f7e5niqdRarI63QEN0H/MqWpTVmg6kvF/LJ+PO0cOUUtiF4+4i9+r4JECX01VCPObp9SC6tPmNx+Z2RDjb907tUM/JpqXeuvuYalErUm4KnI30z3kfW4M+n6+0wP32zqSKWDwGSgexJKuQQ92WMOOCOmkqJpItLdDD+o0+KtUojLwuO+yfvlYnfsSj7UQGNhA8hLGPu1KgWGXUQxDFmcwqzYXGckFVZhEh5emBBgIQjmpgHW58Eo7Wd03N9L2jEEmHw22meYYp8i4pwCip98nJQKyWWXYDJ0w7xrEsDJ9LFbkw+384/zhI09ohOdIZ/FSbA==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0616.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:43:55 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:43:54 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 19:43:32 +0200
Subject: [RFC PATCH v2 5/6] kcov: add interrupt context guard to
 kcov_df_write()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-kcov-dataflow-next-20260603-v2-5-fee0939de2c4@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780508619; l=1825;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=syIiSLzTslOa/iARhIAEp1YxcgsuWQ88mMQyVHe0HuY=;
 b=WkgWVJI13YtXgbZRBMyilflGfOSTfXAgAORyoMhok5V5YVsa8u0vKi4D8B2gbxsVFm3fyHNcI
 RO3s+88kwo2Bq0bdlreLjFLNBWpyublMl48WDxwG9uyHg0uAi1JP5hq
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DB8P191CA0020.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::30) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0616:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f20328-31e8-4cc7-e6bc-08dec197ae98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|921020|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	sLkTx17tbmetY3BgEaJDquyeS7sHSAoMBy6UqAEsjrkMMkMVjIO88pD1AoFKlCuRBkbAaZSqBCKL8WDufXF2JgwOEvIP0mpmBSln6vYcuuTNqlDQLrbW35wMmpotMConDj8wEOqv4YygaCDImYG5dHyZHm09KcHnKlT4BzfKgoE8AXQTo8gwra8ul9FqwI0Zr50CjW/b+aXUH1IIHNawknhMOpM5L0hzcUhjEdI9mGFdWm4POPJ4XDA/gIRYBvgsqfEl69XBU8hG9LEt0Orgi42KVkzzBnGAytQlSIxh8QM9QZ3nfunQzQ73P2WijhCS331MbVCa7mnRBiWEC6SIf1OeoRH2x/YnXmpSD43N32lHDUhdqRyrDTocWFfXBXUb7mlv7uv/dK5dOcrp7Ucp8EuS9UQnsshQ/cGKKoHTA3a0tpimizSftleawb6h/5A4z5SW1Bv3czPsKFAvQh2Page4dLgqMEykfwP2F9qoZV889GoI1msnYPId39T9kOkDdEOPfMQdoqDmxFHHTuGc1viHtMiYILo7mO/c/dQNari8R6DaTPEPeFbN/ed7BEJe11zBBc8ktlOTybgQeaEqW7YJ1rnl06c/x5A93E9yH9Vb4yIrrvVnS/+uMohMLzxWGxeR5w1bm0Ous5mP54aj2MRzR5oSefzla1k+XuX7J9BxiSOy+eG6yRpVdRBzs+ghGgelMeyphNt2v2HMFpkQ2DnyRHFSxgfoxlcKrsWbz7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(921020)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1FBMUdpYVVrM2lpdHZTVmFPMnA2bllaeUtscmhYRFB3VCtpV2U2VlVqbmM3?=
 =?utf-8?B?ZXVaUFMvMmVoZlgraWtHS2g4NlRtMk5hQUUxVW11QWVodW90bFZ5MEVsNmc0?=
 =?utf-8?B?bUI1TWtVeWhXMy9hVFRUR0d5Z1JxSERHaWVJYTI0MmVMdnc1Nkk0MEhIREdK?=
 =?utf-8?B?K0VLQmxETUtwTVBSTDNPRWtaaEVWcnNtRHZ5SVNBa3p0elVEWEpuaW9vL1Ux?=
 =?utf-8?B?MmhBQ3hjTGFQNFk4amRQa2o5Z0lhQUZMdzViZEkzRlc1d2VaSjRYV3grYWpL?=
 =?utf-8?B?VHZla24rRENIU01HcTM3QzRUNmxHN3pVdDQ1OGZvYjcyR2QvYmhscXU2a0Zs?=
 =?utf-8?B?bVNOeThHSGJrd01KQ0pGVTFCdEFKbnd6NFJreHRIMysxYlM0YW9UV2QxNjJX?=
 =?utf-8?B?K1FhNDJxUisycVBTZm9RcnRIelhoVm1QQURTSUZ0N01SOGpUSnE5eGxCQzlB?=
 =?utf-8?B?RDI2R0FpTWRnNS9nVFZDM2NGVitXd1hoOERiMUxCcCtaeGpWSjFQb25jSXZp?=
 =?utf-8?B?Y2VhOEhJcUdHaWlodXFGY3UxQjVzeC9yOGpUM2xMVDZFbnhnY0JYb2h5VVBw?=
 =?utf-8?B?MzRLeXczblhIWGhxVXZQamJ6Yk9ESWFhVGxRYVlWUEJhRDgweDFSNEVwVkgv?=
 =?utf-8?B?b1JPMzJOU2RiSmx3eWpFd2c1OUY5ajVaemMrZEpkTFF4dXdxTXByalg1VnZT?=
 =?utf-8?B?cnZ6UFVaZmdleXdVNkNNUXJPdDdQc2daSHI0REZhcG1WWXNjeWJxZG9taThS?=
 =?utf-8?B?ZDhhNmwrWDcyQ1Q2SUF6ZXNBQ080cWxLMjlPMnQyVmp5U0UwamUrOVNDaEFt?=
 =?utf-8?B?MmhTU3BpVFJxNmhkdGsrbzhqMWc4RUhaWU1YWXlwQzAwR2VEY25CZTJRVHJr?=
 =?utf-8?B?MGVScmhzSFNleGZISWxRV090aXB5VUVRYnBySVFZWi9TTVR5V25IM05kOVhk?=
 =?utf-8?B?WUVhQzNzOTJxRHpKSjJnRCtCRmx6OUlDUDNubHZpRVdub0hkaUtCVkRDTzhQ?=
 =?utf-8?B?dnJBUlB3TUJES01nQkg4YTdvazc4UTFUL25jUnR6SkpxbjhucnAva2JHMUMx?=
 =?utf-8?B?YTczbVp3M1pvV2VoWEFUbDUyeW1XUTNyaDlDVFg2YmZRY3IvVTdYSDZRdUNY?=
 =?utf-8?B?NS9xOWhwZEdjMXBwRk9mOGxuei9ETURnZ3o2bmNjUGtnbGgyT3B1K0VYRzRB?=
 =?utf-8?B?bktjZWxPa1ZvRFdoOC91QVc1SzBYd3FTWGwxK3BsaUk1WnJpSUQ3TXZ2emlH?=
 =?utf-8?B?cFpibjdGOGhtRFdMOWxCc2FVaGNEK2xWTWxMOTczKzQ1dGI3RUdEZlYvZ0gx?=
 =?utf-8?B?WEp1WVJIVnNwWFZUWk0yVzJjMEM2T2IzV1EzRGxXRksvRkY3c2hTaTB5dlVk?=
 =?utf-8?B?N0VMdVNOSEFCTHltd2loV3JjMFpaNUpubDVWd0ZtTitWeENVVDcwMjJKaUcr?=
 =?utf-8?B?QmV4UGlXS3ZVQnBvcFZicnlzanlWdWNqbTZiaHN0NWZJU3F5M2x6a3NSZ3o5?=
 =?utf-8?B?bHdrdklYRVQzeHMrcDZId1FVckprS01SaVRTekJMQUV5ektxbFM3a0dzQWts?=
 =?utf-8?B?NzlvUVdKYzFOb016VGRvai85K0NhQzV1Z0RnNE1lOTNvNnRGTnBDUC9UVUlZ?=
 =?utf-8?B?YXJXclYvUzRjZzV2T0tLRlRHOE5sQmJmVEdNQTBiblM1NzIyZkQ5Wm5yakVi?=
 =?utf-8?B?anFqMDR5L2NMaGMwMklEaHlzU21CT1pMbjVsM1I1ckFaa005U2djdW9RSmdk?=
 =?utf-8?B?ZERjc21NVzZVanBpaFI5T251T0xCUGo3SlpLVDlsWmtiT0dNRlRKVVNPTXpL?=
 =?utf-8?B?SjBRa201QjQvRFM3U2s0TDJORStYTUhacTJyZkcwRFU5akM5RExaYUZKQjBB?=
 =?utf-8?B?RU9QcU5KZmg5U1Q3ZWJTclhWcVliV0ZPS2ZYSXFNVHFpcnNFYm13VnRSQjNl?=
 =?utf-8?B?dWFJbGVDSngvSng5OU5idkMwb1dMRWI0TE4rcS9PT1d4eFViTGN6NWNHNUlD?=
 =?utf-8?B?OURoY25xaFY3OFl6UXpxUmYyb2VFb1ZyMU56U2RURW9zQStVV2lwcXQrRGli?=
 =?utf-8?B?WTZaQ0JIMFdJZjZOemJreU9KSW1IMk9hQTJuZ2VCMzdCZGtZUWw2eXVKN2FH?=
 =?utf-8?B?Vm16ZXJPaUd0MUtySmJPdlpYS2F1WFVPSmpqWTZ1RzM2ckhJeHZuSEcvVnhL?=
 =?utf-8?B?dkc3UGUrUC9vbCs5dXlHSnFXaUNMRnlWNGFTNmNQaVA0K3J5d1VFYUFrNG1O?=
 =?utf-8?B?T0htTFV0UlNZemoxY0VWSEhHaS94Z0NJU3gxQm13bXZiRHlQK1hGWFIxcGtm?=
 =?utf-8?B?bjlrdGJSR0hidXpZcVlTZzVHekV5bGhtMzRTNkV1WlJHOWNPcElwUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f20328-31e8-4cc7-e6bc-08dec197ae98
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:43:54.7837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /j62YgOyZvu6zqBj8cXjp+Y0HJbFUVbKo61d+QIMWuYptKit09HfEUwH/ONvhAIJ7xzzTtU6lxoi3M5ftFqL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0616
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13547-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,est.tech:mid,est.tech:dkim,est.tech:from_mime,est.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95C6763A42F

The KCOV-Dataflow write path (kcov_df_write) only checks
t->kcov_df_enabled before writing to the shared ring buffer. Unlike
the standard KCOV check_kcov_mode() which rejects interrupt context,
kcov_df_write() has no such protection. This means instrumented code
running in hardirq, softirq, or NMI context that interrupts a task
mid-write can re-enter kcov_df_write(), causing:

 - Data corruption in the ring buffer (interleaved records)
 - Out-of-order sequence counter increments
 - Potential faults from nested pointer dereferences

Add an in_task() check to reject calls from non-task context, matching
the safety model of the standard KCOV tracing path.

Also suppress -Wmissing-prototypes in the eight_args_c test module
Makefile, as the exported test functions intentionally lack a shared
header.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 kernel/kcov.c                             | 4 ++++
 tools/kcov-dataflow/eight_args_c/Makefile | 1 +
 2 files changed, 5 insertions(+)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index d3c9c0efe961..373b8034ca5c 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -409,6 +409,10 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
 	if (!t->kcov_df_enabled)
 		return;
 
+	/* Reject calls from hardirq/softirq/NMI to prevent reentrant corruption. */
+	if (!in_task())
+		return;
+
 	area = (u64 *)t->kcov_df_area;
 	if (!area)
 		return;
diff --git a/tools/kcov-dataflow/eight_args_c/Makefile b/tools/kcov-dataflow/eight_args_c/Makefile
index de35bb541f07..038775b49435 100644
--- a/tools/kcov-dataflow/eight_args_c/Makefile
+++ b/tools/kcov-dataflow/eight_args_c/Makefile
@@ -1,2 +1,3 @@
 obj-m := eight_args_mod.o
 KCOV_DATAFLOW_eight_args_mod.o := y
+ccflags-y += -Wno-missing-prototypes

-- 
2.43.0


