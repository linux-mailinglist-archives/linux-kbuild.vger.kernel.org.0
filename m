Return-Path: <linux-kbuild+bounces-13727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z9jiA3C3K2oVCwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13727-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:38:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B80E6774D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:38:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=MRe6ShN7;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13727-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13727-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F15A4300F262
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 07:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D623DDDB2;
	Fri, 12 Jun 2026 07:37:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7CB397329;
	Fri, 12 Jun 2026 07:37:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249868; cv=fail; b=lvRuoXIsjAGIOBZE+BSAcDn7fAouIwzbAlLWllA0ZbnjtDRpFTEUzu+xVsHeJw5bwMbgsAIHLsptcN+MKbUdOjbTCgibVDfQ9m1ugScB58AKkiyKK7MwUbnIF3zoNODqtvBAl+oGO+tF2l3wAEqRyWoiBbdgHrge3n9D4M2XB9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249868; c=relaxed/simple;
	bh=EvPWR/CsJ54FWG+nyjEwibkt0UmDeQTEFihYdQS2Soc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YxZnw+QZhs5MVDvaA4RoxMH9U2V7ICb9jvtZue8TxEWJcX9LZpqju0p2TtEki8HEppbrQc04S94GOzxH/6fWen4wV/ptiYjEfY2RK72pOyVs4vufktl+Iyr09rWnJphkptsqnYrucAEuHmq47PAmqrR3NuVXPaGoULA2/zv3okY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=MRe6ShN7; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPowmZJSmy+Fx9nWpEDGycOwdl3NITQTKigs8GTUpDi6o0TD+HzoETZMUxXXEtV33LL2Nu1Rs0mvi5m0MbvFZ80YkN7PWrSV6vbOMGR0mv+klxDvdL6+MyYmnxyyG52PRPhOR0DbSDuoyxR38j3u0b47FCX3ZedHrWQOSnNssAmA78DwEfST/z68ujbRN9hO28wFkMRka07yyrnCzI+0dYVwQB+t81RLhGdKzrGATDuPdjSVDvbcKXMWkR8uFc+ZcaS7yVUE8kp90+S9kYCakLeT+6L2WFUkvZNk2u6rp3d3Uj6wnWkVi9RZYRebuf6HQjMmYstsSMKumuwBbjnoeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmwD7wBnF6SQ2zRF7CGTMfA24thNIm1mKW1CXn7Ec4c=;
 b=r5xS4wVqphv/RPU96N0LWwlo4tEfFoRvESBURoL98k4Ki2ZaOKfRwRARGtOgwdFD7TEgqStufzixw/lgKA/2S/h7gh033t6EyD1EdrJp217xGNGmtLRD5HHW3uRqGXmEBV2lq0S9UsmtSKcxxG5Fp59ycKweFAZRnj3jvu9bkjeWPWU7PmPVck6AKrKukrQGVD/cvDxk2+J5p0RHAuHwR5c/XNojtSb/9iQigowY4pdmovBYgydCJyzNNwOG1jovt7U8JLy4ei/So6V+gAh0wgfK2Ilfa7HSEkQ3ckwBCm4R7ouMy6wdUmZ55FeBVc3fQYx34iXqw9PNzmsTGyZ78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmwD7wBnF6SQ2zRF7CGTMfA24thNIm1mKW1CXn7Ec4c=;
 b=MRe6ShN7OB0bNghJe4efFB/7Q/Z+Ay9VQfNwMedpG4JQ508jE7IJH/RIPnnSIK3BrcSU633b9QW2ohzdHfvSF2HJL7IhMpck5zp/QVKAFLCaKtLkF3z1kc1qZRSXc3wdqPw2U33nhBmqfqouwf54QM8xeAPEGJkJDcDdETpRRzUhRe9lu+wkjAKpxw8oM9oR5Z4rC5k+pjptWluPb2EDG3XiJeTVZK4C59Cjdlpe2ESI+xcm+UcAKQ0usJKgMIsPL1xSaMjzS1SllkwTA8qC1n0Y0q0BsYnF2fID7LRj5z10JC+Tb+yWmRLtZTbcvC0ohqiS4S/aXB5vMICratjb7g==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0979.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:177::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 07:37:43 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 07:37:43 +0000
Message-ID: <513c68a8-e530-4461-a8e5-36e5d3d5858f@est.tech>
Date: Fri, 12 Jun 2026 09:37:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Dmitry Vyukov
 <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Yunseong Kim <ysk@kzalloc.com>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260604084026.GY3126523@noisy.programming.kicks-ass.net>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <20260604084026.GY3126523@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF0005F6B8.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::288) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0979:EE_
X-MS-Office365-Filtering-Correlation-Id: dc28b9db-f295-4dc2-1995-08dec8557d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|11063799006|56012099006|4143699003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/2mSHQ7ZV4RS0XKvr+V/dmhwBeN/u4TnsOK5h0nWPwqclU1qQsaT3JGyC8KrdaNu6K5n5BeeGDuZSt17d4ZzR/SGj/1gKRu/xuSBAF1/9jiiZ1L4/6NqHazaFaz+4ib+rw7SbJakwCrpvLTSOgmcx+wN52575E8TyeOTRN0+K8DhN2Fezb7WNpl17sJsxipxQM1/h0hMO8syXaUswJN2qZyq+ZiQKTzZeyA4jc1Nj3dCuqk0SitBkaKL8Ic9p5QtpotHCWykQu/t41ktsF+Ny0q9h84HPrJHlG9OCPEiy3C2aAl79hldQp84gXG5oDh38RsHxhJn9hSGN8+bLzvJfQL3MO9YYxoI+sudQjzzooT0OT4eX9x1/+hg3fGPmWc+QPFB6sj2uOFHNkdxhwjl3+HbFLU1Md+pjlsjZbivbupsAHGLK+SLT3hVO6tkh/17XttS0iMUIKRJyCf+9XNHRc4rI3+o4BI5aNp8akJdFFoQGeHKTklMmRMToCGArBDubMgv8NDAUybCxbEqOcZ1OZDucx9Oj/LBWDQ5E2mRss6aFJCZO9hZz7kiHPe3EvkNKlLLqs485arHa3cTvVFhj9j4cy/cmeGTO3yjd/5AEkEf+a1XS3J+/J8HGB7JsdE9ECHuhzdWKC7e+gDskpBn2lx5yxSaJfKvcequaiAYHTalGFnPg9HcGeHZuHEbMoeb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWgvMndORno1c2V3MGJ2K1BWdWt4Y1phT1R5QVpyRysxRFZ4VWVDYWRBdmN1?=
 =?utf-8?B?bm5iNVNReXJ4ZVduWWw4eS9JK3FkVzZPZUIvM0tMb2hBRHBXVmgzMTh6R3pY?=
 =?utf-8?B?b0c4bFN4ZkFBT3JrTUJVMWxOVk5EVVQ5TnVDb0ZHWlR2dW03K2lQckozNUZj?=
 =?utf-8?B?bC9qeEdQZTBWL3FSSmVkM2dJVHJSZENGWnNmNzluMUZDME4rNEwxRms4R3NE?=
 =?utf-8?B?dzdlMHlJTVNvRVNWQTlNQkRVQXUyVjB0U054YlRzTldDTGJwRmZIZVUyNmtr?=
 =?utf-8?B?QUNvUDZiYWNmenZ1bUQwWnZYQ1MzSlJTT2NWUS9FUlRjUVFSbzJNTmVGd3hH?=
 =?utf-8?B?MGhCRGFTR0h3cEUwRDYyYnpDSVVySFduQTR6SE1GMk1mSEJWN1VWL3Q5MERC?=
 =?utf-8?B?amR1bWFhYmVvaURBUkJNUktqb3k3MEh4Tzg3TGhLb1RXZ3JlR0ZHOElodFg5?=
 =?utf-8?B?OEFScDY1ay9oTHd2aFF1ZnZ2a3hkUTUwOHZIcDZHQ3JDWnBYZHZ1SVU0blFW?=
 =?utf-8?B?czByS1JRMVIybVBNUjJUMG9iM3NRM3VyR1J2ZU1yR0M4cVROZFE0eWRZSXpV?=
 =?utf-8?B?TlZOTVZTcHlrTC9mVjZUNDJMVWNZYkxvZlczMkxrQklJVXo4UnB2SVdNUnht?=
 =?utf-8?B?cms2elNnNldvNUZvNGJqTjFPUjZBUDRXVUhTU3VuRFQwdjNnVzJkOHpGYmNu?=
 =?utf-8?B?MnF6eVc4TURjV3Y0MEtXcmVSK3k0UGRnaWpvblJKNXR3Znh2K1FMTnpQYjVY?=
 =?utf-8?B?cGg3YTlqdVFoUWkzTGM1Y2NIQjZ4a1JSbVE3UDFQbHp1VHljUzJpeEpScGhP?=
 =?utf-8?B?b0RSelZlV3FuSXBlc1FydCtoMERoTjBHcXRxWHRPc1dQOUFYWnUvMm5sWlov?=
 =?utf-8?B?L1FaT0M0a3ZHRjJmeExvV29wd1VEcXFpd1h5MFIyQkRiLzhVcHo1WmNwb1Vu?=
 =?utf-8?B?bEFYUU9jeElQNXgvRWVQUTl3US9IVmhFYS9VWSsvRG5tZGxJdVg3a2h6RENS?=
 =?utf-8?B?SEtwbjhZcWlOSFN4a1Q3SUJQOUh1b05YTllyVzZNWlBSeG1NVTM0U0xxb3Nm?=
 =?utf-8?B?SWxvajFiejFOU0JBVGpnVDlnUmptMm5KTmhWZGRqVjkvQ25FaFI3UUkvdVpE?=
 =?utf-8?B?blArd1FaV0ZHYVRGZVB0cFMvcDhic0FSV3dFL2x2Tzk3dlB6ZytoZTNNOXFU?=
 =?utf-8?B?elJ2YVlGcnRqVkZZRVQwSXk4VzAyWlE3VnZzQWJHUXQ3NEVpY3lHVklGSy9U?=
 =?utf-8?B?dCthWmZXck5sSExlSmg3ZDN3Y2pjUG9FYTNiSC9HQXNGeS9kQ2dSYWJqdDBp?=
 =?utf-8?B?TGI0eW11MHZBZDJCWFVOdncwaUhnN1BaQnVRc2ZvbEF0LzZlNVRXTGZHVmQz?=
 =?utf-8?B?UEE4NG9DdkRBYloxQlpndU9lbk1mOHhHelh1cXZBcDNza3BaK1V2SXczSDk2?=
 =?utf-8?B?Mlk5dURmZThzL3RvcWgrY291MG1MNHdGaDRrUTAwWVRhclVWQWQrTnd2WjBH?=
 =?utf-8?B?ZGxzNXVxRnpaTGlnRzRrejd6azN1azhUSDJEWjVTY0lVbzBOZkpBTUdXVE1M?=
 =?utf-8?B?RGpvdEI5dlNTeVpNQmtRVHlvZXQyc3A3bmJwUGN6YWFEb2hXbjhqVldNWlhC?=
 =?utf-8?B?T0YvNkV1aFRMVUEzd0xPUThuaC9WYzVyUVg5L0dMcWFhS3B5c05vNVg1Nkdi?=
 =?utf-8?B?dXFXcEFPZEJoVUg0c0pOaGdpL2FGS2RTWi9BWXVuWVBKaHcrejY4UFh6a0pa?=
 =?utf-8?B?elB0TXJPVlYvTmNVQzY5c3NESGliR2FtU1pxdEZQTXF2a2k1eDFneUxBSWpD?=
 =?utf-8?B?NDlMVFNNQkFFYTZEWXRuRC9BZ2htZjI4Q0tCSDJOTHNLbVlvbGd5WmJ3MmFo?=
 =?utf-8?B?MzI4ak56RnlZellhZnBYdlBWSm5GQ2cxK0Rka3BSWlJRbnYwS2NDaXZnRllI?=
 =?utf-8?B?dDJlSWoyWWkxWnBpNzNKazl3QjA4dGt2NmVlcHpLUEU2K083cDd1eFAwQWRy?=
 =?utf-8?B?bTBQQ2NEUE9mVitNc1N2d3FqNFZoR2lFcUYwcFUvdHpLeHd3RW82Wm1mQ2tU?=
 =?utf-8?B?ZjkxTGRUcDMyZnF6QTM2Vzc5cGFaWHFLUWhYc1hzcXBwdGhVdUM0U1BlSmZl?=
 =?utf-8?B?WGxObFYrc0lrdHI5ZDFLRitOMS9LU1pZZWhaQ2w5TWVPdGxOZVZwQVpQZDFI?=
 =?utf-8?B?aE1JR016QWNzeHJFSCtEVVUrcWNVV3FiUGllS0lJK0Y5MmN5VElmUXlXaG5u?=
 =?utf-8?B?N2VXSUFndW5iMU1xL2lYdlFkK1JHVkxhWUhVckozZ3pjUmNDSVRiNTJmSTdL?=
 =?utf-8?B?bFZYWUxSdTRWUi9icmxoREVyeW5LK0FnNkNXN1VKdlhGUXYzak9aZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dc28b9db-f295-4dc2-1995-08dec8557d1d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 07:37:43.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bAI5OQE0DeHSjbGlr5A5Zc4VkJT111YjUSNcWsS0KB0Xbz+dUpWIPwGcNpbustk2H+v8QHlUD+4PxuLR4qzYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0979
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13727-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[est.tech];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[est.tech:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,est.tech:dkim,est.tech:mid,est.tech:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B80E6774D3

Hi Peter,

> On Wed, Jun 03, 2026 at 07:43:27PM +0200, Yunseong Kim wrote:
>> CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL instruments every function in the
>> kernel. 
> 
> Well, I would hope it would very much not instrument noinstr functions.

Thank you for your guidance. I updated the default
CONFIG_KCOV_DATAFLOW_NO_INLINE to n.

Best regards,
Yunseong

