Return-Path: <linux-kbuild+bounces-13736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 65N4EWIALGpmJQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13736-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:49:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDD6797CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 14:49:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=cPglFNhJ;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13736-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13736-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB6C93008D23
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 12:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4463DEAD7;
	Fri, 12 Jun 2026 12:45:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013018.outbound.protection.outlook.com [52.101.83.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78801282F06;
	Fri, 12 Jun 2026 12:45:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268345; cv=fail; b=Qdk1d4EHaG/H02xlsui/7sw46ed40PWu9Z4cwwbBXdLpi8Xj41fP8Qlwsn/mxxbgPRy/nKZMpdxk+rBhHbV37M/XXqyPMH5YQmjhjDayeV0LQKlTObhRzFdKqWygVLFfjtgvbI9E4tgC58+54OzDfSo9TpaRhEokQIjOI32o2/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268345; c=relaxed/simple;
	bh=mU6zfBZQE4BC22lPpyLdexvO7jSf2oiw4oRHf1ZNxuw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LQAg7UcRVYy8f5EbG5LCRv8P4mH10AAJ38F0Z95pkj81/j2nXm2dVHwUntE2nhPm4RWK+Fi3WpsJ5W5pRr6nk7KVOR82HivB9BWBaD+l4HQNLsKkYK4iW2sQYn5BkslWXcJKlSTgjdMxELKuvT0sw7bieLANiU5vsrU9cCewko8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=cPglFNhJ; arc=fail smtp.client-ip=52.101.83.18
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfN06XDgwmU7dtDEJ9M52SPDDEWgvbAKlk2Ep4v9VpTRtZW6aB+tNT9j8jLLhMTJSXuD6Yxd5y25SbAsVYkiHz1dgI6bo4mKNUjX/8Ge0U7l2wvcarq19X/nmRzJgLEaguntdoNe4ao7MWA1v1uDceks23lVoq+jId7pD2dAQ7f4ocurCNgj7ou4VLC3Mz78RxJSP+A/D0SEtwf9m/imZ7D/LeHQIjT+Xg4ubKPLbCvJOdd03OpvK6IJZvcP3wKSuZcguwC7Qu0P1a6KMOwfsRxH2nsyPG9+bqP5K9jiiOZBLJmVlk8kojIpMZwHlmcOqmoe7wc5SSg7fpvsMimCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=by5ZlX7G5fpV2fuz8CB39odUOXmn9mfcMl6iAXv0ss4=;
 b=N0lRU0g6JwjxtL8buBRLXSpRY9k5EVXLUWD3ALVk1AuEWabdWjxQiXZeyAhdiVGo0GamGdTzeRNPl9uMR+c16eIi2+XWw41zAwicq3qHWGi+NrETIY4TBWawtn4HeKznluOaK2ABkW2XGWboT1tr95l1LvkWG3xIFaEnXSVxZfuUGW7A+YVdrthIOfrVcOzsnDebmEZ+Aj94QUYDTTn3bwGWDb3XR4WRMvzq+1RRKCNNJq6H158+9nYjPh/+LGRet1SwQ1AC25qvIBiVDkAdmwlp+ePJPdxFqI0++U8i5REv6gHjhqAZxRsSvH6FIozVPQRs10vXW6KvbbaAuG3amA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=by5ZlX7G5fpV2fuz8CB39odUOXmn9mfcMl6iAXv0ss4=;
 b=cPglFNhJW2bNx8uba0Xx6Spw1F7Rm7o6Z4HIkODkAbgDLW2BiXWYaIYGt9NVhubuH2d8H0X7c7gfEu/3iVqLe0WGJHsQub981Hl9ilHk8x+aL9H/3/w323cNKvQb59azN8HTsNOQwxoz8/s6mREPEcupJvo/CkyGXMqAWI2mb5DI9StfYvz/yVhyDWr0rQnrh2rPF7yJl6iQqbmvrkmPA/23dIJA2R3E/UgzzufGkZkW4iGs1zc+ncLg7wG1/IGEh0XmZIh3nVYFT057+Aw0w3RlFjPBUNsZQYSvFCgiJ+SZxC/J4TakOf9I2VPlQ3KoGVrdDHiJ1GRZTtIpryDdQA==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by PA4P189MB1295.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 12:45:40 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 12:45:39 +0000
Message-ID: <7f116596-6d71-42b0-8796-4a82c4c922c4@est.tech>
Date: Fri, 12 Jun 2026 14:45:37 +0200
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
 Yunseong Kim <ysk@kzalloc.com>, Yeoreum Yun <yeoreum.yun@arm.com>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260604084026.GY3126523@noisy.programming.kicks-ass.net>
 <513c68a8-e530-4461-a8e5-36e5d3d5858f@est.tech>
 <20260612073858.GS187714@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Yunseong Kim <yunseong.kim@est.tech>
In-Reply-To: <20260612073858.GS187714@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::13) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|PA4P189MB1295:EE_
X-MS-Office365-Filtering-Correlation-Id: c552db22-3e4e-47a9-8bf8-08dec8808200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|22082099003|18002099003|56012099006|3023799007|6133799003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TEh+vLFvoCTXdg1HoRBh3R2QOYTBy9jYdy9GMIe9I4pM4HgQ3y3JPrPRBtCIeTtNKbSvZEPQNuxNS1YPnCXewSMcfcOgWp9gzAa++ffpCF7pJ6RbXlX/TrgX5HcJTC3cMwBaEqN2SPW+2Gjj1v93oLlF5B064NYEjRH02Jsa/ID/iG/7jpehdInY47b6dQCqVX/y36wLzbf9wVqmCOV513r1VXhSrp0Evy+IAnD0lmmJ1KCzVqjwqJqKBe+c6YQOmPeXHPnYggjqQp9fSXQRnN2SyY0RcFbbKrPeTde0trjzVXXwWvxrO3uUMysh3SxSyYBDNpN/1f40uCCd0ksA1kAf6lN2VlNOMgEXOy1Qdwf/ONC14etipKVpif45niijYABp1cj8GbjwuzNE9L9VCFWMA0oyK3S7KDfNLq+6NJFTcfENdgouBOpqAiPjkLV8OAHObHpU1BOtOSObRfM+nL/LdgyIvjX3rDo//yf5EhQQHEs0VtmEcAPusWELd4P0SZBO+bP8/O73sRZ8rZ/na7ZM81G1ZxgXL+quHLtRTppqRVpN3M79/p2TzP0JMTCYujoHS+1f9ZOJsf8ZKKr7bYeHGdh6quwiyFtoz9GN1eRPvdL8zNUnVrALlBK51BqcyAALngoqUy5QCNS/MjdxJ6oQBX/ozDsflB5HF40pbVF8Ee0lh/37MvYoIj7FKz6bHHQBphoDg34O30s057cjMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bktkU1M5eXZjenZka1crL0svMnFkNEprZksyMVNYWEZsNGRyMnZwS21sc1ZC?=
 =?utf-8?B?WGVlWTE3SmZCWnF0M2s2a2ZEOVMzbWViajFkU1FzRk1FdnZQTkFad3psYXJX?=
 =?utf-8?B?OVpvMHNUY0NnUVlFckd2NUdLc0phSmcyUW9iVTliSmFEMXBHdE1hWGNZME9w?=
 =?utf-8?B?SnFyYU1rR2FjSXphTWR0U2JQZkhzTzROS2dUenZpbXRrbHRTeUdnUWwyK2gw?=
 =?utf-8?B?NmNnVm1zZnRaTHdXR1VGZDhDK3A3Y2JPcDNnTis1L1g1ejlzWWlRMDNZMlZw?=
 =?utf-8?B?Qmtibi9UZ3YyclJRekRpN0pxK2MvQTdRT3dibWRwVGZBQk44eFlOU2VMcklU?=
 =?utf-8?B?WWdPczZFZXhLaysvOXY4alJtaWkvY1gvWVowRHFNa09EUHdPTVNid0FqQkc3?=
 =?utf-8?B?a3JUWEdSUGM2cDBwNDNxM2JUS3IrdFNROXhjZnBKbHlkd01qY1p6QngzZVBt?=
 =?utf-8?B?MEJFM1dzR25vR1lETzhUbFoyOEZLejJmb2dNcEpkb21ZUW9RanlyKytyM2FI?=
 =?utf-8?B?emNyR0ZBTDUrV0FPNGRDSXE2Q1hVSXBlemhGZlVUZERnWXZaVGlodFdVR1hH?=
 =?utf-8?B?SSszL0xmVndFejVYLzRTcnF3UzF4WitZWWVxSVFvbFY1aXQzTGtyZjhWMzUy?=
 =?utf-8?B?MnNOc3ZubFViZmM3UWk5aisxVEJHWHNEMFA5ajBDUG9STitEVFlJNkc1dzNM?=
 =?utf-8?B?clRXc3EyNUdiUVlYR29KSUo4bGhMMGVxYWJXSTc4d3FLZVFHQ3dyODBHOWJB?=
 =?utf-8?B?K2Z5WUlScDJEZXpkTzZPZmdCYUowcHVOUmFybWYxYUlGT2tPdVJRY1JmTTFk?=
 =?utf-8?B?T0EzbWJGeEZMenNGOTRnYVNHcVpINnJ5MlZ6R1ZMeGN4YURvUnFrMTQrLzFa?=
 =?utf-8?B?Y011SUNKTG1Tbm5ES0lBWTBLYmJWdGpwYmpUUUl6Q3hqMkhFdy9YaEMzQ3pK?=
 =?utf-8?B?RDc5aEZUYjBLTWtobEVlV2RlbHV3NGpUOE1UM2RzeXFpc0Y1cmFEdE5aSTZX?=
 =?utf-8?B?M1VuU3UwczNZWUJvVnBGQUtOOFJSREExREx3NkZSN2tTTHhldk5jdzAzQU5K?=
 =?utf-8?B?K0Eya2ZpZEFXcGZabS91anFKT1RvL2pFMXZtZG8yOEhRUzg2VTV0NjRxSnRm?=
 =?utf-8?B?VXNIZlZLdm5uSldsV3Bzd2pITFg2QjlLMENOelk0RG9zdjZhSmcvWTF3bW4v?=
 =?utf-8?B?NEtLdmJOY1hFbVEzREd3N2crSS9PVGRYRFoxUzF5Q3Z1VzZ6dDJSSzkwZjNK?=
 =?utf-8?B?NVA1R2FWNG5nMFJxMlNxdjkzZ0IwRGUxaFRMWE8yc2g5Sm5kb1lObXVnbnpo?=
 =?utf-8?B?Z3JZeGU4WFNzT3BmUCtaSGxzRXVtY3BIZnBkVXk1eVljNWR3UkErcjVESUdC?=
 =?utf-8?B?ZFVocXBRL3h2cGs5OXdSaWpoeHVvR044b1AzRVBLZC9JTk9nRUszT3BCNWRW?=
 =?utf-8?B?K2hYOGVhWjArd0pJSElkYk1rTm1GNXMydENiZDlEMmsyaUZsMFRZVWRyN3pw?=
 =?utf-8?B?RWJ1NlZYTDRBRzUyNVVWU2F0M0FQL1VqTEJDdFltZGdDcDhScnZOc1FNVjdl?=
 =?utf-8?B?VU9hZlhibXRDVFk0OCsvbCt2M0J3TzhhSHdvNTRaemFRa01SZnFnKzAzaExM?=
 =?utf-8?B?akttSk93QWJqV1NNUVB4bVB4S2VUSmRNdzNiZ2lNS1hsR2ZNZnovQ2lrRVJX?=
 =?utf-8?B?clhTT0NSRjNxeHExOWVmRFFhRDVybTVBV3JEWkwwRjNDR2RCTDRJZC9jSjN6?=
 =?utf-8?B?YkcrbU0wSklMeUtEUkJrNmxQbVRoK000NFRiaUdadEk4RXRyYmRCYVo2RzE1?=
 =?utf-8?B?T1hucThqNHhqdDBaODNmdDcrM1NZR1JhdFNPYkFzVUxPMUlQaEQxb0grb2Ni?=
 =?utf-8?B?d0dwTDVGNmoyaXZQWnM4QTk0T0Fta09kSFBQQndodmRsOXFVTjhBYllKSWVm?=
 =?utf-8?B?OTJma3hmVXlrdVJXejdJZ2t4ZVRuN1ZueDJqZ2RRR2RSbTN0eUY0NTc1WkNI?=
 =?utf-8?B?TGJZSUdYQ3hJVkxjRFpURS9HcDIzRXowYjdBZHpxU2prSjNKTzFzcmlFY1B3?=
 =?utf-8?B?ajNWTDRydVU4U1M2T2JGYk1LWnVMb3RsZlBURzVGbTJncjNwTFRSVXVYSHJ1?=
 =?utf-8?B?NEV2QkZHcHVLWWpacHg0cG5uWWl5ekZSYW9Td1FyVTQ5eFJNNThQSGZwUnZy?=
 =?utf-8?B?Vmx1cE5ralRmYUtObDdFeHlKZWtPV1ZxQlVDUWxtdlJoVEU4cm51ZGdrcGhJ?=
 =?utf-8?B?MlBWbUs3Y0xQWFZRb2JERlEybDhIWVB0cG9PWEEva0lBUVRkQkxITkppUnQw?=
 =?utf-8?B?OWlPYnR0bXhYeWNIeFNtYXF1dWczVTV4a0x2ZjAySUVxcmpnTTJkdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c552db22-3e4e-47a9-8bf8-08dec8808200
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 12:45:39.6883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2HAd+zpuEOyUp4ZjZ4UECAqIYZhWvaEYV9EsDie4tJN3ZSCrUeYjmzB+iOA+j9C7i9JjCMYBO4XfH26Rj2TGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1295
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
	TAGGED_FROM(0.00)[bounces-13736-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,est.tech:dkim,est.tech:mid,est.tech:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41EDD6797CA

Hi Peter,

> On Fri, Jun 12, 2026 at 09:37:40AM +0200, Yunseong Kim wrote:
>> Hi Peter,
>>
>>> On Wed, Jun 03, 2026 at 07:43:27PM +0200, Yunseong Kim wrote:
>>>> CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL instruments every function in the
>>>> kernel. 
>>>
>>> Well, I would hope it would very much not instrument noinstr functions.
>>
>> Thank you for your guidance. I updated the default
>> CONFIG_KCOV_DATAFLOW_NO_INLINE to n.
> 
> That's not really the point. The compiler extension *must* respect
> noinstr. If there it no function attribute to suppress this kcov stuff,
> then its an absolute non-starter.

Thank you again, for pointing that out.

I've been using the same mechanism that KCOV (trace-pc) already relies on.
trace-args/ret shares the identical code path and attribute check.

LLVM side:

noinstr functions are never instrumented because the existing
NoSanitizeCoverage attribute check at the top of the function-level pass
covers all SanCov instrumentation types including trace-args/ret.

  1. Marked functions as noinstr expands to __no_sanitize_coverage, emits
   __attribute__((no_sanitize("coverage")))

  2. Clang translates that to Attribute::NoSanitizeCoverage

  3. llvm/lib/Transforms/Instrumentation/SanitizerCoverage.cpp

     if (F.hasFnAttribute(Attribute::NoSanitizeCoverage))

     https://github.com/llvm/llvm-project/commit/280333021e95#diff-1b024748b036cfd10a7c3dfc7e9c53b0f752b27d7ea193939c59b2de60f69a70R445

  4. skips ALL instrumentation including trace-args/trace-ret

Dobule check with objtool:

Even KCOV_DATAFLOW_NO_INLINE enabled kernel:

  $ for fn in ct_nmi_enter ct_nmi_exit exc_nmi syscall_enter_from_user_mode; do
      count=$(objdump -d vmlinux --disassemble=$fn | grep -c sanitizer_cov)
      echo "$fn: $count sanitizer calls"
    done
  
  ct_nmi_enter: 0 sanitizer calls
  ct_nmi_exit: 0 sanitizer calls
  exc_nmi: 0 sanitizer calls
  syscall_enter_from_user_mode: 0 sanitizer calls

If Rust noinstr functions are added in the future, they would use                          
#[no_sanitize(coverage)]. This maps to the same Attribute::NoSanitizeCoverage                                                          
LLVM attribute, yielding the exact same check and result.


Best regards,
Yunseong


