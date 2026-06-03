Return-Path: <linux-kbuild+bounces-13548-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Jh+KgxqIGp23AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13548-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:53:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E0563A4B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:53:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=oC36zDkt;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13548-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13548-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC4713027964
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 17:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B69481FC1;
	Wed,  3 Jun 2026 17:44:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BC1481FA8;
	Wed,  3 Jun 2026 17:44:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508643; cv=fail; b=c8c7nhKAmRdiiQY267Xn4CxxO5hCfDeioidN+dvJ7f27cuhVYLSH3oMZjNxz4Un5I3QTJPtxkmGKKVQCFostPnYELrN0Eza8eBDZBYqIb8unwAQRpRvLkurHFnihv/CWE81Rvo1kk3TV4CkndE6wiLkow7Ylq3fgJG4PWOdJdDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508643; c=relaxed/simple;
	bh=Z4sgMzoY8wD282Gwg8b+W22TpdV2LyIiGtQaFuQdeKg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=knJCDbTkDzm1cEesw3GWcat7jplsMEQRhsGwoq3GUoyK+RjMDIq6zZhAZewGCADc2JnvOi6qrm3uzkzPKmOzzRTNaBD5xTx+4rnhkEy64Qtxb6SP3LGI8vBFsKkF/QTnvAss3K+604fH+wit7t6Jou9G3X/4tLhfKYe1mMFgJ+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=oC36zDkt; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1VCf+dLjQR/ibqSca1GdyoKdQlAWxEIX55HbNpDZShA8ehAiMi+ocwXWBcJfnXzg47hhFXkvj8KfXY0aAHpw/eL0GBcEyu7mfW3C+XF4gV6CVS2GlGBSIg8jYdfeo7yGxTtl6HUjbePGttaPV+B/wffXJnZLHakNdtZGp/WrQTbaSM8JZCD6TNEKl+aZujMK2kR9i9BOlWQuATfNm+Tzi0CPyNNdjC1+4b1Po/caQ+j4fT1trnouvKMAgM1nAXbCIXEHFLOiyYsRkvaQ0fQT2OQ8+9zpypUXk2UnC9RCQhRvXJa+hicNCGjYDBybcY9SPnu8PO6i0Jg1H5PwUo1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+eDkjlnysriWd90gMNIlPdPm/Ukypuqt08m3Oa9Dfc=;
 b=Ynwqfvg3xGB8JASCYL2exq8viyDu6nUncQ+ufie/zLtmnuLiqmCbYikSDIZOaEbJQEPZH/9aoEKRHVnOhCI9FL08EPyI3i51Bo5qp5XkoU5HCt5gwuc2KgI6D5Q3gP8BRvsdYjDppra3YYlGNnGVuTC7x7CY4gLvZOqym1QEIiXh65JejHcRenhMTzqgHeveHQcEcCVhbOe2eB50aQIu2bLqMoEN22UyBbnJo3pUdJpy6h/cqaMrUQ0/bri/OFPisiaxu7PEzCh1jkCnNOol5OVs5yvAeDuWURMgHatdcvtSSYOuP16ymWyXwlhXVp1ja3o4ptsFDVi/H5Wf1Rzr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+eDkjlnysriWd90gMNIlPdPm/Ukypuqt08m3Oa9Dfc=;
 b=oC36zDkt57+XutoxBJMvlWo+CNb5UuijjDkTBT/2MjmprWHeNpK27W7/pr9ISY3thgRvK9thpD8he93uuxv45K0+cGqk9BTGlvOD4lL/LbA3mwRBTsCw4ayI1f5SzUHwKWdVevdiWjpIru3GYWKRv4XNdvexeFKVUH/1ogi/yMocE/dErUMbjah23uoBPV2mTChkBXujxOugLhnQry5/ZM262XUQ+dENxk4oPcpKN/Ub6GToh5rwUU62Ze8gD7PfGWZhm7+WZBHX9w4bsFck9bt9u5Nw+G4d4cmMMBJyB9rntnPRs7FUKCGj10Hempq8+g8yCJ/mt9yHhfyE+3RjYw==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0616.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:43:57 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:43:57 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 19:43:33 +0200
Subject: [RFC PATCH v2 6/6] kcov: add recursion guard and documentation for
 kcov-dataflow
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-kcov-dataflow-next-20260603-v2-6-fee0939de2c4@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780508619; l=13948;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=Z4sgMzoY8wD282Gwg8b+W22TpdV2LyIiGtQaFuQdeKg=;
 b=ZL1EUqK0zMn7j8bvNzWgcgG1GOe7pLCuajiKrc6E3jBgeo6TQIJQF3kRvWo/QeYEWBncV/jMi
 ye7Ux/u8vbTCFRFhqLT42KPb1dv9xVm0Wz4w1rURQShktxhLvfkkcpU
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0616:EE_
X-MS-Office365-Filtering-Correlation-Id: d41c520c-fce2-4c5a-d245-08dec197b03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|22082099003|18002099003|921020|11063799006|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	iIIGoaExvmNChIWBL6p3Db97qvRDLF6NUMCzOdj9jBwKJP/dr1Gr/N5H7hVP6CmTUwdFlaugSVzmD6hyrIw7r6CugOglnYfdXg+CAR+/WskHG0XA0raCJvfmycahGHe8Cnu0B6BOswZFVonpslx41toSDbp7/q/qYLNz3tlsuOnqIeXh7Awg4XZs61k0QrANeF4vKrdSuTJ88011Bd92HsYHQMS7xql1EGj/3oaeJQRndHcEfAL/O3XMac16o2akLjy9fj/cnc936pSFUVqk4rtvHd/+teyzlYusldolamn2gXfWo4/Q0ZrHWY0FxZzHhgSeIKmJhK3rmNKMmF8moZJe3QC+xv4lOHlhrUYA8hMy46FyBYIjDQMdI2E9nAKLY0HMV+dz/R0tYjzjUtOnrUawVFfp7QRjtlWwit5ScN9RFzvjV6vD3y5T9NjVYEyhDT1+KPW1D+gAZkThsiNsr1o387+PNXWIgXzjQ5tZTLtVF/s84OmyGQctN4udbYL15KOR5ebtnXrKeo6u+yO0lBErPeUYkUob9kpDw853+pbCn0U/dh8g5NF0c8K7XA0bamMKDOOt4M+XFylaJlCcfDcZyREsGBHORDzzqWF9OcgQYhzHhf0S2ZSc2TGaJiT7vy5oXOqBTlEVqVQ+z1BC2Nl1TVNX9f5KcapvWG/XBNs4n+XzhM5gV/Qin4zkeeyVQrCBgaBkkwwjp6cnFGi12TdxbiPPmb5bEJtl9FaNPVc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(22082099003)(18002099003)(921020)(11063799006)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHpZYnhaRlhNTk9BNHdTajFrT2wzM241eStaNzlEckJldWlucityR2NtbVFY?=
 =?utf-8?B?VEM3dktZa2dzdzRORHRMSUpLUjdoSUlwbkxJc2Q5enBTTzNiQnRJZEZzemo5?=
 =?utf-8?B?SGRTQ24yeFhnY3Q4N0xuUDBoZ1NzbTQ0QnRKczY0bEt1L0FuL21JcytjdmNI?=
 =?utf-8?B?UENGR21SblQ1OUExKzVaSG9menFiSGJWd2UyRm8rVWpuRGtuMkJWcGkwMnFi?=
 =?utf-8?B?LzkybjFKYzBNS0tEZitOd21PeFJWdklUWmVYaHJMcWNHL0phUmVQTlR5eFFY?=
 =?utf-8?B?OWhFekZ3bVdnMU0yVWF1b21DRTRlcWk1N09SV044Y0N1OHExK0pGZjgzS3lr?=
 =?utf-8?B?dUZlNFRLUzNkQU8zVlNwbDFvUnBFNElCWGtDVHd1MVRTVEJCWHRWT21DYzZV?=
 =?utf-8?B?OTIxZEo5R2R0N1VtTktmZFhBNXk2RVcrcEhkTWMzVmFld1JmZXJra0tsT2xU?=
 =?utf-8?B?SllHWjVubG02WjEraEJrVzRQdVFBTzZiQ1hpN2JEVUN5N01aT3RheUpmVkk4?=
 =?utf-8?B?KzBhNnJ5MDZzUHJMQXZyR21rVlFxR2VSdVdmZzhBdWpieWpPNjh4WW53M3F0?=
 =?utf-8?B?cHpjWEF5R1NaMFJ3SXdlUVJEaE91SktzVFJ4bmxKanFMT05CL1E3ODN0N3h4?=
 =?utf-8?B?VEd1R3krV1RRUmpvZkVvOVF3NXpvY3R4eXJYNkpnWWlwdXQvazFVbWhMMGxB?=
 =?utf-8?B?REZJcStUM0xtdFFXOWdoYTVsMHhLbHlLT1pNaTNUZUg4SktvcjJqRzR1aUgv?=
 =?utf-8?B?UlhueStRQWVhUjJrTmFyaGNPOEVJQXlOOERKNm4yTjdUZ0RTSnBUSFVpdEtK?=
 =?utf-8?B?ZnNVZmZqK3I5Z05heFN1V21rMGFSV0ZtWHVUQjVmRXFDNXZiSmExaW1VLzlm?=
 =?utf-8?B?YjdkYUd4Z1V4blRqNjNaWkw5Z3AybnhJMWt4K294dlphS2lHcU5aZndrdmF3?=
 =?utf-8?B?REwzNE51TEhUOTc4cFEzTEFOdEZScXNDQkpkVVNVWmxVQ2tCcHBZR0hDeDlF?=
 =?utf-8?B?UENWT25tWDc5UURMSVg0NkJHYUlDdTZ3QTBTWWNQVlpkMmVIaDdieXJOcDhw?=
 =?utf-8?B?bEtjelJ3REltNGdyaDV1NEJPY2FkY05Sd2lOUFFFeFg5cUJ1MEoyZWdhMUZo?=
 =?utf-8?B?ODBDMVlkK3p6MXplRUM0UTJMM0ljOGFEZ29uL3Z0NGI4THdIVFNQZjRBNVd5?=
 =?utf-8?B?bk96RTZxUEdSSm9JUFFYd0dvcnJra3NGZk5HWG9FTjkwUTRPb2F3UFJPblBQ?=
 =?utf-8?B?b3VkaW1ycjB1YnF6UGdqMzhwR2Fjd0NjMkR0UDNITjhCNGl1NS9GRDlkREpa?=
 =?utf-8?B?ZmEvZXErWEphWVpEdDVMallCckdqM0lOVGhkNml3bm9kTml2Qkk5VWFOTUhp?=
 =?utf-8?B?eUpzTno4dTI0V1ZlNFNCRmF4dm1CcXhRVTRibUVEYytsTzZqTDY1MlFld0pQ?=
 =?utf-8?B?d0lGQUFCVjRTYmZsVERmUnNBTlhjdXNpckJJR2N0WENrSDhWVUxFM0FkYVRI?=
 =?utf-8?B?Q3E5SzRoTTZSUVhzeVNSbXpnOTd6WG03LzFpQVNxNHBqZ1BSeVJlLzFlaUw4?=
 =?utf-8?B?SnpDOVZDd2IreXJ4amNoVnd0YmdlZHE0WjN0d3BINWZzNCtRRitYL0xwR0hI?=
 =?utf-8?B?NE1FOXJtSTdGeUNJUEV3RGJrRFIxSmFCZDZxcVZtKzEzUVcyZngwTzUwWTQv?=
 =?utf-8?B?bkVNL3RiandGMzh3VzNZQmc2OTcwSS9SM2E0cnFQYkgyNkIwajVBVHA4Slkz?=
 =?utf-8?B?VDVBa0JMZzJZOHRIUDVHNlgydHFObDhqT3lhNFJtS3RMRmQ1cGNqMXo4MFZ4?=
 =?utf-8?B?dldpaXBGVU9WclJPaTJjRE1sQkVKdkcxYXpLZ21IVUlIMkNaWXZ1bXp6b0JR?=
 =?utf-8?B?aTBoOHNkN2xzT3doUkxmWUM4alZzcmUvbSsvaEhQQllueUtUWEpvSzBGTFhp?=
 =?utf-8?B?K0hHR001b3BQZWw4NlB5MVplSzZyTXVKNlYzeWUxR3VCcnNsWHB4YmFCdS9j?=
 =?utf-8?B?Q2xZb3ZyYnoxS1RxTTBmcmJqVkZZUnhJamdOSHk3aCtUTGVkTFVXa3NHMVNY?=
 =?utf-8?B?ZkhMejJhbnM2Q3drWkFLWW5MeUlUS0ZsYnlYRWFCNUxyTDAxWmI5SU1oV094?=
 =?utf-8?B?eGpIdnU2OURURWhNc3NpaHFHL2F3YW81VWRzcnRyMVIzeDBaU1NXbVhxTGJq?=
 =?utf-8?B?Q3loZnNPUVhnNCs2QUFtRllhOVovd0E5UTErbXNoS1VnUzBEN0k0YjlXSmVY?=
 =?utf-8?B?TzBrTEhlREFvTmQ3QS9lNTBDeW5KYjNGa0tlb0JVZ3c4dmVOQlh6ckRsWGc3?=
 =?utf-8?B?Y0JxcTdSTWowQnY5TmgvY2szZlR3aFp5OUozYSt2R1JnVXgzak5Ndz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d41c520c-fce2-4c5a-d245-08dec197b03d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:43:57.6241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24xydKFSLb0ky1BgYVzrbVexjfOV+JcWTNVUaLZl4kPith3HceLugwCQCocaC/Sm+U76MaMyYDIxA8QDH7qNpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0616
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13548-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[est.tech];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	FREEMAIL_TO(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[est.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08E0563A4B3

Add a per-task recursion guard to kcov_df_write() using the high bit of
kcov_dataflow_seq. This prevents infinite recursion when
CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL is enabled: functions called by the
callback itself (copy_from_kernel_nofault, xadd helpers) are also
instrumented and would re-enter kcov_df_write() without this guard.

The guard uses the sequence counter's bit 31 as a re-entrancy flag.
The low 24 bits (used for TLV record sequence numbers) are unaffected.

Also:
- Exclude kcov.o, extable.o, softirq.o from dataflow instrumentation
  (same pattern as KCOV_INSTRUMENT exclusions)
- Add Documentation/dev-tools/kcov-dataflow.rst with:
  - Prerequisites and Kconfig options
  - Per-module instrumentation instructions
  - Complete C example for data collection
  - Ring buffer format specification
  - Ioctl interface reference
  - Fork interception example for child process tracing
  - Rust module support via post-compilation pipeline

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 Documentation/dev-tools/kcov-dataflow.rst | 282 ++++++++++++++++++++++++++++++
 kernel/Makefile                           |   3 +
 kernel/kcov.c                             |  14 +-
 3 files changed, 298 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kcov-dataflow.rst b/Documentation/dev-tools/kcov-dataflow.rst
new file mode 100644
index 000000000000..5941df9f29e6
--- /dev/null
+++ b/Documentation/dev-tools/kcov-dataflow.rst
@@ -0,0 +1,282 @@
+KCOV-Dataflow: function argument and return value extraction
+=============================================================
+
+KCOV-Dataflow captures function arguments and return values — including
+automatic struct field decomposition — at instrumented kernel function
+boundaries. It provides per-task, lock-free ring buffers accessible via
+``mmap()``, enabling data-flow-aware fuzzing and post-mortem contract
+verification.
+
+Unlike KCOV's ``trace-pc`` which reports *which* code executed,
+KCOV-Dataflow reports *what values* were passed and returned. This is
+a completely separate device from ``/sys/kernel/debug/kcov``.
+
+Prerequisites
+-------------
+
+KCOV-Dataflow requires Clang/LLVM with the ``dataflow-args`` and
+``dataflow-ret`` SanitizerCoverage extensions. Standard (unpatched)
+compilers will not expose these Kconfig options.
+
+To enable KCOV-Dataflow, configure the kernel with::
+
+        CONFIG_KCOV=y
+        CONFIG_KCOV_DATAFLOW_ARGS=y
+        CONFIG_KCOV_DATAFLOW_RET=y
+
+Optional: instrument the entire kernel (significant overhead)::
+
+        CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=y
+
+Coverage data becomes accessible once debugfs is mounted::
+
+        mount -t debugfs none /sys/kernel/debug
+
+Per-module instrumentation
+--------------------------
+
+To instrument a specific module, add to its Makefile::
+
+        KCOV_DATAFLOW_my_module.o := y
+
+For example, to instrument the Android binder driver::
+
+        # drivers/android/Makefile
+        KCOV_DATAFLOW_binder.o := y
+        KCOV_DATAFLOW_binder_alloc.o := y
+
+For Rust modules, add to the crate's Makefile::
+
+        # drivers/android/binder/Makefile
+        KCOV_DATAFLOW := y
+
+To instrument an entire directory, set the variable without a filename::
+
+        # fs/Makefile
+        KCOV_DATAFLOW := y
+
+The build system automatically adds the required compiler flags
+(``-fsanitize-coverage=dataflow-args,dataflow-ret -g``).
+
+Data collection
+---------------
+
+The following program demonstrates how to collect function argument and
+return value data for a single syscall:
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <stdlib.h>
+    #include <sys/types.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <unistd.h>
+    #include <fcntl.h>
+
+    #define KCOV_DF_INIT_TRACE  _IOR('d', 1, unsigned long)
+    #define KCOV_DF_ENABLE      _IO('d', 100)
+    #define KCOV_DF_DISABLE     _IO('d', 101)
+    #define BUF_SIZE            (64 << 10)  /* 64K words = 512KB */
+
+    int main(void)
+    {
+        int fd;
+        uint64_t *buf, n, i;
+
+        fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+        if (fd == -1)
+            perror("open"), exit(1);
+
+        /* Allocate buffer (size in u64 words). */
+        if (ioctl(fd, KCOV_DF_INIT_TRACE, BUF_SIZE))
+            perror("ioctl(INIT)"), exit(1);
+
+        /* Map the buffer into user space. */
+        buf = (uint64_t *)mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+                               PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+        if (buf == MAP_FAILED)
+            perror("mmap"), exit(1);
+
+        /* Enable data-flow collection for this task. */
+        if (ioctl(fd, KCOV_DF_ENABLE, 0))
+            perror("ioctl(ENABLE)"), exit(1);
+
+        /* Reset counter. */
+        __atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+        /* === Trigger syscall(s) here === */
+        read(-1, NULL, 0);
+
+        /* Read how many words were written. */
+        n = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+
+        /* Parse TLV records. */
+        i = 1;
+        while (i < n) {
+            uint64_t type_seq = buf[i];
+            uint64_t pc       = buf[i + 1];
+            uint64_t meta     = buf[i + 2];
+            uint32_t type     = (type_seq >> 28) & 0xF;
+            uint32_t seq      = type_seq & 0x00FFFFFF;
+            uint32_t arg_idx  = (meta >> 56) & 0xFF;
+            uint32_t size     = (meta >> 48) & 0xFF;
+
+            printf("[%s] seq=%u pc=0x%lx arg_idx=%u size=%u val=0x%lx\n",
+                   type == 0xE ? "ENTRY" : "RET",
+                   seq, pc, arg_idx, size, buf[i + 3]);
+            i += 4;  /* minimum record size: 3 header + 1 value */
+        }
+
+        if (ioctl(fd, KCOV_DF_DISABLE, 0))
+            perror("ioctl(DISABLE)"), exit(1);
+
+        munmap(buf, BUF_SIZE * sizeof(uint64_t));
+        close(fd);
+        return 0;
+    }
+
+Ring buffer format
+------------------
+
+The buffer is an array of ``u64`` words::
+
+        buf[0]: atomic counter — total words written
+
+Each record occupies 3 + N words:
+
++--------+------------------+---------------------------------------------+
+| Offset | Field            | Description                                 |
++========+==================+=============================================+
+| 0      | type_and_seq     | bits[31:28] = 0xE (entry) or 0xF (return),  |
+|        |                  | bits[23:0] = per-task sequence number        |
++--------+------------------+---------------------------------------------+
+| 1      | pc               | Instrumented function address                |
++--------+------------------+---------------------------------------------+
+| 2      | meta             | bits[63:56] = arg_idx (0 for return),        |
+|        |                  | bits[55:48] = size in bytes,                 |
+|        |                  | bits[47:0] = raw pointer value               |
++--------+------------------+---------------------------------------------+
+| 3..N   | field_val[0..N]  | Struct field values or single scalar         |
++--------+------------------+---------------------------------------------+
+
+Magic values:
+
+- ``0xBADADD85``: field read failed (pointer was invalid/freed/poisoned)
+
+Safety
+------
+
+- Callbacks are ``notrace``, ``__no_sanitize_coverage``, ``noinline``
+  to prevent recursion.
+- All pointer reads use ``copy_from_kernel_nofault()`` — survives
+  freed, poisoned, or unmapped memory.
+- An ``in_task()`` guard rejects calls from hardirq/softirq/NMI context,
+  preventing reentrant buffer corruption.
+- No ``printk`` or allocation in the data path.
+- When not enabled for a task, overhead is a single boolean check.
+
+Ioctl interface
+---------------
+
++---------------------+----------------------------+---------------------------+
+| Command             | Value                      | Description               |
++=====================+============================+===========================+
+| KCOV_DF_INIT_TRACE  | ``_IOR('d', 1, unsigned    | Allocate buffer           |
+|                     | long)``                    | (size in u64 words)       |
++---------------------+----------------------------+---------------------------+
+| KCOV_DF_ENABLE      | ``_IO('d', 100)``          | Start collection for      |
+|                     |                            | current task              |
++---------------------+----------------------------+---------------------------+
+| KCOV_DF_DISABLE     | ``_IO('d', 101)``          | Stop collection           |
++---------------------+----------------------------+---------------------------+
+
+Compatibility
+-------------
+
+KCOV-Dataflow is completely independent from legacy KCOV:
+
+- Separate device: ``/sys/kernel/debug/kcov_dataflow``
+- Separate ioctl namespace (``'d'`` vs ``'c'``)
+- Separate per-task buffer
+- Both can be used simultaneously without interference
+- syzkaller and other KCOV users are unaffected
+
+Rust module support
+-------------------
+
+Rust kernel modules are supported via a post-compilation pipeline::
+
+        rustc --emit=llvm-ir -g module.rs
+        opt -passes=sancov-module \
+            -sanitizer-coverage-dataflow-args \
+            -sanitizer-coverage-dataflow-ret module.ll -S -o module_inst.ll
+        llc -filetype=obj module_inst.ll -o module.o
+
+This is the good method for capturing Rust function arguments at runtime.
+
+
+Tracing child processes (fork interception)
+-------------------------------------------
+
+KCOV-Dataflow is per-task: after ``fork()``, the child does not inherit
+the enabled state. To trace child processes, re-enable on the inherited
+file descriptor in the child before ``exec()``. The ``mmap``'d buffer is
+shared (``MAP_SHARED``), so both parent and child write to the same ring
+buffer atomically.
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <stdlib.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <sys/wait.h>
+    #include <unistd.h>
+    #include <fcntl.h>
+
+    #define KCOV_DF_INIT_TRACE  _IOR('d', 1, unsigned long)
+    #define KCOV_DF_ENABLE      _IO('d', 100)
+    #define KCOV_DF_DISABLE     _IO('d', 101)
+    #define BUF_SIZE            (64 << 10)
+
+    int main(int argc, char **argv)
+    {
+        int fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+        ioctl(fd, KCOV_DF_INIT_TRACE, BUF_SIZE);
+        uint64_t *buf = mmap(NULL, BUF_SIZE * 8,
+                             PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+
+        /* Enable for parent task */
+        ioctl(fd, KCOV_DF_ENABLE, 0);
+        __atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+        pid_t pid = fork();
+        if (pid == 0) {
+            /* Child: re-enable on inherited fd.
+             * The shared mmap buffer receives records from both tasks.
+             */
+            ioctl(fd, KCOV_DF_ENABLE, 0);
+            execvp(argv[1], &argv[1]);
+            _exit(1);
+        }
+
+        waitpid(pid, NULL, 0);
+        ioctl(fd, KCOV_DF_DISABLE, 0);
+
+        uint64_t n = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+        printf("Captured %lu words from parent + child\n", n);
+
+        munmap(buf, BUF_SIZE * 8);
+        close(fd);
+        return 0;
+    }
+
+Note: the child's ``ioctl(fd, KCOV_DF_ENABLE)`` will fail if the parent
+has not yet called ``KCOV_DF_DISABLE``, because only one task can be
+associated with a descriptor at a time. For true multi-process tracing,
+open a separate ``kcov_dataflow`` fd per child, or disable in the parent
+before the child enables (as shown above — the parent is blocked in
+``waitpid`` so it generates no records during that time anyway).
diff --git a/kernel/Makefile b/kernel/Makefile
index 1e1a31673577..9c56421c5390 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -37,6 +37,7 @@ KCOV_INSTRUMENT_extable.o := n
 KCOV_INSTRUMENT_stacktrace.o := n
 # Don't self-instrument.
 KCOV_INSTRUMENT_kcov.o := n
+KCOV_DATAFLOW_kcov.o := n
 # If sanitizers detect any issues in kcov, it may lead to recursion
 # via printk, etc.
 KASAN_SANITIZE_kcov.o := n
@@ -207,3 +208,5 @@ $(obj)/kheaders.md5: $(obj)/kheaders-srclist FORCE
 	$(call filechk,kheaders_md5sum)
 
 clean-files := kheaders.md5 kheaders-srclist kheaders-objlist
+KCOV_DATAFLOW_extable.o := n
+KCOV_DATAFLOW_softirq.o := n
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 373b8034ca5c..8d9d5e33549f 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -413,6 +413,16 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
 	if (!in_task())
 		return;
 
+	/*
+	 * Prevent recursion: functions called by this callback
+	 * (copy_from_kernel_nofault, xadd helpers) may be instrumented
+	 * with INSTRUMENT_ALL. Use a per-task guard via the sequence
+	 * counter's high bit.
+	 */
+	if (t->kcov_dataflow_seq & (1U << 31))
+		return;
+	t->kcov_dataflow_seq |= (1U << 31);
+
 	area = (u64 *)t->kcov_df_area;
 	if (!area)
 		return;
@@ -449,7 +459,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
 		if (KCOV_DF_IS_ERR(ptr)) {
 			for (i = 0; i < num_fields; i++)
 				area[pos + 3 + i] = KCOV_DF_MAGIC_BAD;
-			return;
+			goto out;
 		}
 		for (i = 0; i < num_fields; i++) {
 			u64 off, sz, val = KCOV_DF_MAGIC_BAD;
@@ -469,6 +479,8 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
 			area[pos + 3 + i] = val;
 		}
 	}
+out:
+	t->kcov_dataflow_seq &= ~(1U << 31);
 }
 
 #ifdef CONFIG_KCOV_DATAFLOW_ARGS

-- 
2.43.0


