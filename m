Return-Path: <linux-kbuild+bounces-13711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WNXOM3rhKmruygMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13711-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:25:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0C67377E
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:25:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=Mjlhshnw;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13711-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13711-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B11C3036087
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B916466B6A;
	Thu, 11 Jun 2026 16:22:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61D44D014;
	Thu, 11 Jun 2026 16:21:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194920; cv=fail; b=ArRJkWd3rA7FSCD3nhqk3FbyOVrOfXqfAk8MFOLk+ifscCX2fZ5ZKOABsGEJoWeZk+uXcblWVwgsENOcxHN3DzLAnk6lOuGdXYzERi+lN5w0/Ctli98dZmxJzpQnA8oBxxvN7x5RSmtQoLCxVwDOe9vx0zc530yclNPpeTRdYSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194920; c=relaxed/simple;
	bh=PmtegGlP3oC3YRD6P1kuj8eoKvWyzYU8JTA0aTpc6bM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hv9nPjCR4yoWn5pM4b+ymMckZpJy9EtiQcKJ3oL5wyEHaQkV9Pa3Gx90C/CZicVt66ph/HwIPeeiz9O19nXPe7tB8QhJq6EmLPSbO8KwmjfJR16ZsmnEJxgaMF67lToRsFD4Coz1InAOSr/kN7RFks6wRqC4WKbJztcRTQJC2FE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=Mjlhshnw; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPyrch2NgrEWB+HjpdLbdBkqeee8dBaKdWmd+K236HUTARMmHVSaLbYGpjBhK95+TNz8pVlcRu/2R2aisVQUwfUkN4d6qBME4VuH4BjefjYweVy+zLTuqGVuUsv73Q2f5dPEXYIC4+UY9RD3WuiuRj12Kw17WMqKRWXQU4L29lxi9ArN0tzZNFKuX78VKDp5NU5DDcSTehDbZbC4mRQ17WWYLWLkxvutgPhAGR6/MIN5yExa9HJhBSu757jBVzsmjY9MBeSWlu5A+XkcClzb7u6mpfgWpVbUY24nws49qjX/xVTD6KaZ2l0RqDLVanKKuMYl9OLUWabpP8tgkwo1fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaeM3xQHpXxRiq9fltNVkln/dOccxRMDrYQW+wNikZk=;
 b=yIgmB6bDKk64cvrYwtXoiu38Z1viqWY+TQaN2HhR8zYjkIpIr6REwTbNbMJnV3Won2CKsTi/NRsUNypxR97IcrsufUTSMc+/BHNyKz9FOtihu4bRz+3QTYGDUNabw56XGVQLZg1sqMIwOIcNqieunBDDasE5AAir3pvsiIImYakS4brS6Qnm6qKOPZyaZ5KAYP7TtNw7uw1TySiXpp/1Rf67dZf0z4dI0PC4dILS2jzXQ8+vPTcZsGGMYUI99pJQj17Gx/fdUcXE7eqyI0yYVD/hqi8PJTaFXbwlpMHCsxk+DR9zcNKPl6G3PhfKF7dfhETPphNNopQf3SfDiVlszg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaeM3xQHpXxRiq9fltNVkln/dOccxRMDrYQW+wNikZk=;
 b=MjlhshnwEKSnL4vjTDV+fxFckR75MImYh/gOad/l3L6YHkElt/L9r4bqjWds6fqiaPOISwb4SjJ7BcAglYlE5kopfJbRShi3IXjitdKP8uMko1GvkzB9bzpdPay6ITskjz1J79LVgTxAjFZ9g38zcxQf2sfqAOS8UkTEdDT+cWfKqzzmmrtUTM6x0NcF1kPsj9BVBylKo2feJsvocdnhcud1YMhGd/msyy2wOOvKZNRvreG38GWd6Ifse8xLFFCm3wWnDQFnJ5HsYDKb4Ft95NLNoiKaYTjC2Kwfed9XBpCZfQZggBYB1K5t/KJewPfJD/CDH74TM+L17F4PbWUANA==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:50 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:50 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:09 +0200
Subject: [RFC PATCH v2 07/14] kcov: exclude kcov_dataflow.o from sanitizer
 instrumentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-7-0a261da3987c@est.tech>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Shuah Khan <skhan@linuxfoundation.org>, 
 Yunseong Kim <yunseong.kim@est.tech>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=922;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=PmtegGlP3oC3YRD6P1kuj8eoKvWyzYU8JTA0aTpc6bM=;
 b=e5xstSMsJXnbXyB+C7adTAPN//7fQTeFH4ATtubzHpMsx0JK0Otu4HT3jDZy6qquKsRKR6sT+
 a4NAYtSFhCGCSzK79P1/f/gwkNtmL/6Rxjw78k/f4CQeCAzAqFPkjdn
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GVX0EPF0005F6D1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::64e) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: 2454eb6c-da2d-4096-2b13-08dec7d58ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kd8j3nrOOqM2I54A4h2lzfTpkw/heKam5BLD2/SVdnsuNJTypk7CaTl3MR76ZECvPkXT1SLr8zv5tw1O4OG3cyWZZhvRGSfxLneSw28Bw2T/CVu+5Zlz41mJmZ+89hU0+K4MQeY+PtZrOxflJZaCT0dNH6qlMAvE9VMBk8pQeDaxwvlfuUh5hu0bUso5ZpH4+ORwYpbHK6kyE27BcIdQoVrTow/rrY7oew5liD2eXNflJMm7beRtOrCVbGc/cT03rDP30xyfEON109hTVIfqbp3IOF64Ybrjs87H7Rd54V7ew8y7N39wxr5IOj7lSQqk93pUKeyyUIQCxYno1Avw+Mo25mwT0dBk1Zl7Vd64iE/0RiGEtG2ZzDCcVC8ot7g2yzSrkuoephxOP0X8hK7fsZoOIp8yr/PiPlF8d/EcsAQnY5Yh9w2QWjPRiW/h0VJT6VqdnXEp3NU/xmV/mSMqq/SJ0/Fs6kLRthuRjpb6ByTjfHBIsCraR0EQB6p84Wpgl8Q7NAkyA4pGFxzxfFUxWAhz1s3JHE5k3MUGUP8yLdPBopqjm2Zj4S4g9CSZwE3a7b/yVXN9cDZ0DKcAAtlNbbpCXDRsjb/VhkKgtlmtjhTzojpwEHBWkG3FFHKcIoLC80jNhsOvB5HwcVjvOCWpRBhcHGZW4Fxg64gvqj6yDKmcQXrYyFn5CgmgL16SNzyeapnAEelis8wY3OneAXi4RYsqf0G8q7++pOZiW+ZLwbA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkJSS0FUVHZBRkw3bWxJeUdDc29nR2FOektaa2tUWitOd2k3MFZvaWNnY29s?=
 =?utf-8?B?SEFsSVZSSnZWZVYwS3h1OHdLL3hISWo4dkJVVlNZM1VuQmg5bWVjdUdwOWlk?=
 =?utf-8?B?RXZoSURZc3V6cTNzb1p2ZCtiNkh1YVhZckNRakl6Rkk1T09waEthcElWb1lS?=
 =?utf-8?B?SWpOamxlMGR4Y2hzRXdoazNKbm1haVZIY0FaUG5Ic1QzTHRKQktCT1Njc3Jv?=
 =?utf-8?B?Y3NUeThIMmpVa2NpVThpVUI0M2ducjMraThXUzhpaWVYVWRQcFFPKzF5OS83?=
 =?utf-8?B?aXhvazFrd0MwTlRTSXhKbGtXcmFnVGZGQkNpTjdoTU9BTjIwbHIvWTBJNVA3?=
 =?utf-8?B?UUVpUmd2NEIrcldMLy91ckJQQ21CR3kzUzduRElrUkE1dmdpb29QTGxCTG1v?=
 =?utf-8?B?cUlaOCsveUlJWDNPZStPUVBVbU1BSUk4WXZ6SGdOWTNRZVBXMWRoanFPN2Fl?=
 =?utf-8?B?VTV6UWVGN0dHOFNKMEl4eXZxa2xWcWNqVm1pT3VHazJYWmdlQTk1azAvaHNH?=
 =?utf-8?B?SGZyc1FJYnZZaUV4Qi8waWNLejV6aktmSzlNM0VYNXNUN1NVY3Bva05YczE3?=
 =?utf-8?B?bjE0UUJkcTdtUHNHYmgxZnFKQ0piRUdKVisvd3MxUHllSzgxR21pTXFzN3dZ?=
 =?utf-8?B?Q2pQU2NkKzFEZmxyV0ttZnJFQnVjSStWWEpzcVdJOGlUeHIwYjFWeFg3T1Zu?=
 =?utf-8?B?NXVyMm9lZHQvbjlIWDFpYVNKalJzZ1ZkQU5RSmFGV29Da0MzQW9jY0tEbXVN?=
 =?utf-8?B?U2NGMmYyWTc2c2k0ZW9TRUhhNTZhS2Jpb29CS0V4QzNRZFJZbXNqNjQzU05z?=
 =?utf-8?B?SytzT2pGU1pGWUoxRGwvOXphRUtLV1J6N2FmNEdENWF4Y0FXSWlBL2hkSXRv?=
 =?utf-8?B?VFBaUTd0SkluSEI3VWM2VTZvaHhOdjQrRXdBYmtvMkM0T0xvakV0clNzb3FN?=
 =?utf-8?B?UTQrcGNHNlN4N1FaQjFxbGdGN3h6UmVSS0RtZFR4RTRlM0VYSmxzbWplSHQ2?=
 =?utf-8?B?VWdtSmRqeXdXUzlDcGFMVVllWlZhNFovVVcxajB5RmlyS2U0ZVZLTjhYQjJn?=
 =?utf-8?B?YUVjMWV4dGxpYVhFTFFDcWlBQzZRK1pZTFFwM2xlbDRzWXRqRGVaUFBXSGlK?=
 =?utf-8?B?TjFoNEYreHZoeXoxOXNJaUlGYjV2QWplQTVBaHlWc3loRThVeWNNQTFLZzJh?=
 =?utf-8?B?M1c2T0NjSzRqTUV2UTZXMGk4NVE0VDczTjZtNFBXZWRtdFRqNVRpUG5pY0RE?=
 =?utf-8?B?Z25OWW1xYXhXM3UxWTRuYUlmcWF2Z29YUXUxN1Nva1RIdHR4SzZTRlJUUkgv?=
 =?utf-8?B?ZjdnM3dFVENmVzBLRnNLekRUdkJ5bktmRDFHZEYvZ2t0V3Z6M0ZuQ2dsc0Yw?=
 =?utf-8?B?Z2NrQnBodHBwb0lrWHczdTJXTWxWUWxCQ1Bwb200Zk5zVlpyaEhEYzVYU0Ft?=
 =?utf-8?B?Q2E5TDZJbDF2ZHV2WHdQRzBhTlYzdDBrbGZXUHlRSlp3bFZpZWNvYVFWelFp?=
 =?utf-8?B?SGFhUVJ6aWdQbllzdm9zUktENWs3NzJOcGhDM2N3WHVDUE5ESnZlUlVhcUdH?=
 =?utf-8?B?VlpsR1MyNnhUVHlWajEyOFBwbGcxNmFTeFNVL1p3a0ZTcjdzWVBXb09lRUdO?=
 =?utf-8?B?L3pranlVZ2ZGVDR2YXFmSTg0ZXZ4RjlkZDdGbzFTNGR6TWt3c3lCcC95QnFK?=
 =?utf-8?B?OURRazhoOGtzUXkrZWxtbk1wSlozNzFlUitIZFZZVGZaRDFKVFRGRFZPeWRC?=
 =?utf-8?B?aWszVHZBRTR0TG1ZTm14MGVNaTFjelo4Nk5EN1dsSVdLRTh4d1k4UlJTblpB?=
 =?utf-8?B?STQxM21xQ013emRGOHM2K0RIMWZuUWwvdlF4ZkhQUk5MUk1Ld3ZuRDZaWEtK?=
 =?utf-8?B?Q1hlZEVEc2lGWlJPeGNNVlo1eUZUR1NUckRBT3daUVpqdUQyQ2JKTDgweS9i?=
 =?utf-8?B?UmNEMWRIL3RHQzhpNEt0TUtiaG5KaFJCbnVnZ0xOM1phU3pmZHVrWHF5NC82?=
 =?utf-8?B?bi9CMlpxb01iMmxaNkx0QjRCK3U3UysrdUxOcHkvcTNBcjk3Wkc5RUs1TFVr?=
 =?utf-8?B?blJvZjBza2RnRmFTNVRsQ1hCUmhocFVma28zcFlEaENZZ2J5dWdISjdsZzNk?=
 =?utf-8?B?S2FkM2wxWXRNZXA0VVNnMXRRVUFtZVR1M25VT2xXaUdWRUd2SEg3c3RsTFNr?=
 =?utf-8?B?eFlTOVYydlhyaWtHOTBWNHJkc1ZFWFViZUVTTk1EQk9iTzdKWjd1RGVJL2xv?=
 =?utf-8?B?ajg4dGtoQnR4ZlJ3dDhuY3NVVkQreHBDeVcvU2NTTkh0UEYzZmRUQTlwdzM1?=
 =?utf-8?B?Nkh4cEFxNStlNEh1bVArb3JndmpQdlp0TnJZLzhrc0dCUHlOWjhkUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2454eb6c-da2d-4096-2b13-08dec7d58ae8
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:50.6767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUpn7b3SfIdLROAGs2f3S36enjvrUcgw0N14v/k8GTZDqr4OCLE24jiZgG5YBtmET3ATTy9aLbp9L5rbTs2sug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13711-lists,linux-kbuild=lfdr.de];
	DMARC_NA(0.00)[est.tech];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,est.tech];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[est.tech:+];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70C0C67377E

Exclude kcov_dataflow.o from KCOV, KASAN, KCSAN, UBSAN, and KMSAN
instrumentation, matching the exclusions already applied to kcov.o.
Without this, sanitizers instrumenting the dataflow callbacks would
cause infinite recursion.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 kernel/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/Makefile b/kernel/Makefile
index b70e524c4074..307b7fd1e1f9 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -44,6 +44,12 @@ KCSAN_SANITIZE_kcov.o := n
 UBSAN_SANITIZE_kcov.o := n
 KMSAN_SANITIZE_kcov.o := n
 
+KCOV_INSTRUMENT_kcov_dataflow.o := n
+KASAN_SANITIZE_kcov_dataflow.o := n
+KCSAN_SANITIZE_kcov_dataflow.o := n
+UBSAN_SANITIZE_kcov_dataflow.o := n
+KMSAN_SANITIZE_kcov_dataflow.o := n
+
 CONTEXT_ANALYSIS_kcov.o := y
 CFLAGS_kcov.o := $(call cc-option, -fno-conserve-stack) -fno-stack-protector
 

-- 
2.43.0


