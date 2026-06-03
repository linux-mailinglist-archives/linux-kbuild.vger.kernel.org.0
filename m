Return-Path: <linux-kbuild+bounces-13546-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IYAAI0NqIGp/3AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13546-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:54:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDED063A4D9
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:54:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=lteTRD8a;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13546-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13546-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A86A13021E90
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 17:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E691481A9D;
	Wed,  3 Jun 2026 17:43:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4248164A;
	Wed,  3 Jun 2026 17:43:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508638; cv=fail; b=I7u5wgxc9UIgmLCB7VdaA6ln10xq8JDsVMwT3dxyQ7Lass+fZ5reqnMqsDCEcFPwAuWtxtC9fMDGBaEOQhJbG5gVv0DyiygRg0gR7jMtqhqNCf00JaXZ4RPU2BaR0JVM4rMVAzQ4P1ehcfD6Mbmd8LeUpUDmPOWEcZ3kueSAdgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508638; c=relaxed/simple;
	bh=4uAmKVHT4YgUXldNscMuTepw72D9AUUzGcclheaGOys=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bl7eYtFaTPfjZz0TN03+/QYDcyV9LtlZ88ik7lEsf5OzqS7MhN0pFr2H5bAR5Q6k8Dit/enxkunelN31E4aKIZ3QQuajWiO7f6j0EMptsGzd4FNtrMsQjZ7zFAbzum8qIR+Td+ICr+5q0H0e2W/jGDX5X3vXHFxzHWu2FjO3seQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=lteTRD8a; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7wQdL3TrjKsMcoCdC6PUVx73fwHEKugbsfaPGIHZfGDI3bh+Cx0t9RzGCwoiYMNebVPog8zBKKLSY5/LRCaViJva0xDfumVY/ZWaRd/etU6XJpc112J7mhtxuh/AyPicjhWNE8WICblc169aNzYcMwV+vHhKMKjH8Q1gk4LlVTSd3dsVkQxXfhmzVc2lq9xLCxSOY+q7TambuEPrJ5agIRxIuPmFjzqPh2J2SwbT8mRmzRR6o2EuwRehl2o6H7vF/4qWKTjKxPMqIXjftTnFUtXi2vCdr7I8rBbsSLRo4SnZGDFUPfFRtNHkF0PLW6W5JOZfJWRGXa7iFXXur6EUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cOGKiJ6cSokO7n5kdbwTxpc/y/P6fiLF96NtQPAHaU=;
 b=oJoGRZk6NCok+9BdfgraXUDaoksKKoDWnwde2EgCK81iKgj3ejC8ra1EWxlQkmrm0a6at8Os0bPWyPaofwR8f3HdPj/y9ZdSDZDBjtbxtJ3HL3+bWaHiwzx2NMcMELmnVhs3fWv0cF0eOMYptJ/n1G9vtJrmDP44XkH3/QUxRI94OJMcMP8556/WJ5bE+psGg3aXJswN5mj8x92cpccvEy6ZEdANqFm9Hbjqqc+F3B5+OFeQaI5NspljfbLzm2aJHqQI7kVVHCu0CL7SSlNb6FqXGUSdVlxiyxr/RIaK/xOUCfu8l0b4RkuEcl/OsQ4cYx1LdYspyL1zcSxzDbECUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/cOGKiJ6cSokO7n5kdbwTxpc/y/P6fiLF96NtQPAHaU=;
 b=lteTRD8aIgaRnAzjAX2oLMQ7UyTRqCpkfXz+nY55BL12BbnL81GZP1E6yGbyQmh670sP1XmnfN2KrxbpmtsrlgBa4dQVP6B6UtA6c4vsaI3aSsSuv5/UjOdtsHc5a3mIfd6Q7m7g/nypS7YD0XPUbsnFp/9rq+BWGfh995VlXqxkTNZoXfEE9IWfXRM4KqwMfLDKv1TMIwtPW/9kgQ3FBm9Ek0TbVQWmUm7rMz4L2G3n8dgCIkQu9YZvKWEGtswslXt79zcGl0b384h1RtHPD0YMDJ0q+L4P89F7L272P31sYMcfYN9zFvwIfd+6zlAiwtQqpXW0QT+5wCgkQ12YEQ==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0929.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:43:52 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:43:52 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 19:43:31 +0200
Subject: [RFC PATCH v2 4/6] tools/kcov-dataflow: add userspace consumer and
 test modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-kcov-dataflow-next-20260603-v2-4-fee0939de2c4@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780508619; l=29565;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=4uAmKVHT4YgUXldNscMuTepw72D9AUUzGcclheaGOys=;
 b=iIQn/JcFem10KaKBdhNmfU8hkadmt63RBxoZXTZ40swRetOB3N5+8qwU2vUK8ATdsXbUJxg+i
 oDoA2kE9oxfBSO0ShgA/uNqNwnBlgPmZOX4d4xNx+pXZ2JvCgIbGYQd
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DUZPR01CA0278.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::23) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0929:EE_
X-MS-Office365-Filtering-Correlation-Id: 7644f24e-ebc9-4f06-bf25-08dec197ad5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|6133799003|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	CTHU3GljEXfxZ5udJbGPCLrdHcuakpbR6NW4UCJ3wZlM+N2jadwKtCbZc6DYrFiXE3rSCBJDjCIpg2z+JRar5WcraCHzALaIVfpOUD6ynS1z/2gR5deTFD9NE8aCN09Kww9an25a6DKE00Bx2ZesWfkLgYyJ77eKBbOZE6z3pvSL1rA18YZa5V4FDVY1eh5OtIY/mVlNZxI92uXhFV0OVnGJi7boSaZUuXbzesdM7hA5D4nRCWKoQvnXFMDFCeQ96RInQV5XR0xtrKegMCqBZ8h+XO7ABumVLDY2C9ysikk3d/Hj/zIqN0nxAl6YrKl8FgtkBCJy6IoCkObJyv1wwKCytUzf+Rm0MvSq8cl0ujk5AKY4wRWr4gXIn8OFw1RBjo+pzWe2oF/Em42fHhfSk8rqz+CI1ixstKpyDNy39SMZUy0xHOcGmIZ4f20mASL4vclsvfPj6Pj4fy+Y1PfS0r2rQwGoOsZnWguzg3N31gzAbzgouTaer2j/VsSw2nZwi3qu/LCFeMzagiQdM54qeexffjYNh724Nf02g6jgLffJkHgFPLTmLTbt9T9bbMlFhpe6z6XS0XiqzY9HET4jgi1fYVN/4r2LcSDqGLRHrMmno2Wk/ShVDXe5g7oH7jtSWkQAPwvHob5S7EQdPMG3gEtIjde/D9unb1IhBC9tYt0Mk/JBs93KxNGNqrrAp9O4jJosZRGmfzYCaOEA/ewmQR81t9eY2SoCJh3nLqBgzYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkZyTzBwRW0vT3c5YmxsTWFoU1EyWDVtclFGZWlvZVVuS0IvTXFSTEMrekhm?=
 =?utf-8?B?aGdOdDNKSVQxeEY4RnpSVyt4NEpyWUN2TGpEaTVTR3JBZnFRNFN0OUdybUZY?=
 =?utf-8?B?K3pRbmdVZG1BS1duRktkbWFSZjROd20wU05RbUFTUXdiNkhzQ1VHdjl2dU4y?=
 =?utf-8?B?bDRTWGpkNFl2S25SUDRzeldZc29WWkYrSkdJRVB4NnRqa0xodmZQYmJtNDd3?=
 =?utf-8?B?UVMybGFRcFJlK0pxN3pUbnNTcUlacHFEd0ZXSWQ4NHZrYy82dDFrbGQrbnc2?=
 =?utf-8?B?NTh0Uno3UXdJeGpvdHZ1MDZibFIrSzloS1dhZGVLVDNDTXVJSVY2VWs4ZTFr?=
 =?utf-8?B?NFdjelhMd2c3Ri9tRVRvT1doOFF2ZEJkZGRKK01FTHUwamo5aEJiY3gvenVl?=
 =?utf-8?B?SmxiaUErUndQSzk4YkYyR2tHdDhLUmZRaUl2NC9lYUxzZjJRUURkVjFyOEF3?=
 =?utf-8?B?MjdIUEluZDNWVkpGWW5xZXQzN3FQaTNLTHlnQTdSK1lwQnVHbDNaQzJjU1Vq?=
 =?utf-8?B?dW9PTzZPeXN6b1AwSjFhdmlzU1pDZ1FVSG9lRW41eE9WT1R4RU1pcE02U0FP?=
 =?utf-8?B?TnpkVTkwYXdRNW5VdDY4dG0xWE1mWEM4YkRXaHBCOWRRUDRDamZDcmY3TS8x?=
 =?utf-8?B?d2N2cm1YYVBsTXFWLzdUaFpibFZHeVV3ZGsvclhNN2dLakovV2Z1RmxpelQ0?=
 =?utf-8?B?Y053b3Y3UkNkSkMxcTVNMXBRS1l2YXhwWVJzN0l1ZXdSeGRBbG5mZU93WDFy?=
 =?utf-8?B?bE1TLzhyb2c3Zm9tNGNXU3k4MlZPaGpRSVVpWCtMcHJIZEU5KytpZTE4c3hp?=
 =?utf-8?B?dzhxSmxmb1Z3b002MzB4RDQzdTZGNFJPd0JtdDRCV0kyTHRua0dqUVNCdzFu?=
 =?utf-8?B?MmdpSERGZmdlM1habkZRSThvYjJwcVdHZ3RDRThQYU13bFlRNWFBZXFLS2cx?=
 =?utf-8?B?ckVJcTV6L1BzbC9TemlKaFhnNDVSK1FjTDZqMEZBYTNrNnpaaFd2amJOeU1O?=
 =?utf-8?B?MW5oMEk5U0NYVmRvak83RURYd2g4VFgrMUMvR0Fmb3RJQzNFdE1YdG9MNUlH?=
 =?utf-8?B?cGxwaVRtYUM4bkwxWXg0RTg2d25UV0JGZjFtdHQ5Z3JXR2xKSFk0Y0prejE2?=
 =?utf-8?B?WWdqQ1FqbFJzMzJTd3Q1ZmQ3cExjWUNvZ3hhdGNtcVN3MjRJQlhrRTJkb3Fn?=
 =?utf-8?B?aVQzYlgwakNXaDJDajQyWVdudFVXK0NySDN1eDFWQUNpMG42cHU5VkZVcURH?=
 =?utf-8?B?dEp4Z2NISW16M3paQ0JvbFF5OVp0alZqaGN5VXJwelJJMVpqWjhLSm96SEhZ?=
 =?utf-8?B?alUvU2RvUU1rcFBVTytKSFliaFFGYkVJVG96ZUk3bk5vazVKUm9uS3RXaktp?=
 =?utf-8?B?Q2FCMDJvcWxnZDhDOE4xSFUzY0lMd1cvNnhGb1JzM3MrUHlGNWtSYnIxSmR4?=
 =?utf-8?B?SzJwWGVuNXFBYVBtZ1dPYjNMMncxRDFjL2RZdWtZOWpCRGFoWHdYTDFrSytz?=
 =?utf-8?B?VGZRaWdyYjJPLzU4bjlyZWtXT1JmSERONnIrNndMWHo2WGQvUzdzd1RvUzB0?=
 =?utf-8?B?Z2VISzFtcU55OUJiZ3VaRnkzb1ZCVXVOVVlZQ1M4V29IMCtQZzdadmlnc1Qx?=
 =?utf-8?B?aTk3eGFiSXFjUmtnWk1SdWkrVzI2SHRzajBEUndZU0ZiUTV3dVg0REVUT2gr?=
 =?utf-8?B?eG51QjZOZk5SUktCSC8wRzZOVGpSc1ZOMUZBbkVRN1Vwait1b0hYUDRBekNs?=
 =?utf-8?B?cXNSQWhtSVg4TXcwRlcwYVVySzFFOWtOVTUva2VNbnlNY2NiL3ZrVG9IbEY0?=
 =?utf-8?B?ZFZrR21lMEtLKzZ3c0RGRFd5NWM5MTlqdUdMV29OYWw2TDBROXRvdjRJc0Uy?=
 =?utf-8?B?Q3piY3AvUWF0aHJWOVo4ZzQ0K2wvM0p3T0VFMXNXSlpGWVdZTG5Oc2JWNC9E?=
 =?utf-8?B?enp4Sld6V2Jya2lFQzZBenZYckhQQXFrVlJFV1RuMzhlWFh3U2t6YUZFMmJY?=
 =?utf-8?B?WlZoM3JrNlRwOUxNRlpTNUFnUUhwZW1PelZnM0hZS2VoYjBFOUlmN2dweDA0?=
 =?utf-8?B?U0JqMjA3YkhkT25VV3lxempRZjcxUm1RVE1xSTBMdkpsTWtuMTBKZWsxZStv?=
 =?utf-8?B?Y3J6eVA3dXNyYnowOVpCODlLMVpObHZFUmdock5vSGMvRlJ6UmppR3BTQzNq?=
 =?utf-8?B?RU8wT2NVaGZWS0NVcVhYbzR6RkhPMmk0UXowMWQ1blpReTVMV3djQ1RsQWc0?=
 =?utf-8?B?TVMwcmZuTmdpdVJKTnBPWEM3bWFMakRLeHpJY0JTaHI5cW1ER1RybXNlWk9L?=
 =?utf-8?B?VzBGYWUwR0xIMXlIa2txeDQyWDFzRnFaYk9WL3NOWUwyZnN6VCtOQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7644f24e-ebc9-4f06-bf25-08dec197ad5f
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:43:52.7296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGmygXVUaP6G55PWGhtjGdGKjEjGF9dxBja0/5fIYmtpyU0OfzczWYimSHeI6yAvP13q/VLb8ciWLlSKrdH6RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0929
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13546-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kcov-view.py:url,est.tech:mid,est.tech:dkim,est.tech:from_mime,est.tech:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDED063A4D9

Add tools/kcov-dataflow/ with:

- trigger.c: userspace consumer that opens /sys/kernel/debug/kcov_dataflow,
  mmaps the buffer, enables recording, triggers a kernel path, and dumps
  the captured TLV records.

- kcov-view.py: visualization tool that parses and pretty-prints the
  binary TLV buffer with struct field expansion and symbol resolution.

- eight_args_c/eight_args_mod.c: stress test with 1-8 argument functions
  verifying correct capture of register and stack-passed arguments.

- eight_args_rust/eight_args_rust.rs: Rust equivalent of the 8-argument
  stress test, verifying Rust module dataflow support.

- deep_module/deep_chain_mod.c: 10-level deep call chain demonstrating
  taint propagation tracking across function boundaries.

Sample kcov-view.py output (C):

  func2+0x0 [eight_args_mod](arg[0]=0x11, arg[1]=0x22)
    ret = 0x33
  func8+0x0 [eight_args_mod](arg[0]=0x11, .., arg[7]=0x88)
    ret = 0x264

Sample kcov-view.py output (Rust):

  rfunc2+0x0 [eight_args_rust](arg[0]=0x11, arg[1]=0x22)
    ret = 0x33
  rfunc8+0x0 [eight_args_rust](arg[0]=0x11, .., arg[7]=0x88)
    ret = 0x264

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 tools/kcov-dataflow/.gitignore                     |  12 +
 tools/kcov-dataflow/deep_module/Makefile           |   2 +
 tools/kcov-dataflow/deep_module/deep_chain_mod.c   | 224 +++++++++++++++++
 tools/kcov-dataflow/eight_args_c/Makefile          |   2 +
 tools/kcov-dataflow/eight_args_c/eight_args_mod.c  |  95 +++++++
 tools/kcov-dataflow/eight_args_rust/Makefile       |   2 +
 .../eight_args_rust/eight_args_rust.rs             | 114 +++++++++
 tools/kcov-dataflow/kcov-view.py                   | 272 +++++++++++++++++++++
 tools/kcov-dataflow/trigger.c                      | 125 ++++++++++
 9 files changed, 848 insertions(+)

diff --git a/tools/kcov-dataflow/.gitignore b/tools/kcov-dataflow/.gitignore
new file mode 100644
index 000000000000..1f35df8fbd07
--- /dev/null
+++ b/tools/kcov-dataflow/.gitignore
@@ -0,0 +1,12 @@
+# Built binaries
+test_mock
+test_mock_binary
+trigger
+*.o
+*.ko
+*.mod
+*.mod.c
+Module.symvers
+modules.order
+.module-common.o
+*.ll
diff --git a/tools/kcov-dataflow/deep_module/Makefile b/tools/kcov-dataflow/deep_module/Makefile
new file mode 100644
index 000000000000..6afed580dc9a
--- /dev/null
+++ b/tools/kcov-dataflow/deep_module/Makefile
@@ -0,0 +1,2 @@
+obj-m := deep_chain_mod.o
+KCOV_DATAFLOW_deep_chain_mod.o := y
diff --git a/tools/kcov-dataflow/deep_module/deep_chain_mod.c b/tools/kcov-dataflow/deep_module/deep_chain_mod.c
new file mode 100644
index 000000000000..786e23c5d213
--- /dev/null
+++ b/tools/kcov-dataflow/deep_module/deep_chain_mod.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * deep_chain_mod.c - Demonstrates kcov_dataflow tracing through 10 nested
+ * function calls. An attacker-controlled "offset" value propagates from
+ * the entry point through transformations until it causes an OOB write
+ * in the deepest function.
+ *
+ * Call chain:
+ *   entry_handler → parse_request → validate_header → extract_payload →
+ *   transform_data → apply_filter → compute_index → lookup_slot →
+ *   write_slot → commit_write (BUG: OOB here)
+ */
+#include <linux/module.h>
+#include <linux/proc_fs.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/delay.h>
+
+/* Simulated protocol structures */
+struct request_header {
+	u32 magic;
+	u32 version;
+	u32 payload_offset;  /* ← attacker controls this */
+	u32 payload_size;
+};
+
+struct payload {
+	u64 session_id;
+	u32 transform_key;
+	u32 filter_mask;
+	u8  data[32];
+};
+
+struct slot_table {
+	u32 num_slots;
+	u64 slots[8];  /* only 8 slots! */
+};
+
+static struct proc_dir_entry *proc_deep;
+
+/* === 10 nested functions: deepest first === */
+
+/* Function 10 (DEEPEST): The vulnerable write */
+static noinline int commit_write(struct slot_table *table, u32 index, u64 value)
+{
+	/* BUG: no bounds check on index — if index >= 8, OOB write */
+	table->slots[index] = value;
+	return 0;
+}
+
+/* Function 9 */
+static noinline int write_slot(struct slot_table *table, u32 slot_idx,
+			       u64 session_id)
+{
+	u64 combined = session_id ^ (u64)slot_idx;
+
+	return commit_write(table, slot_idx, combined);
+}
+
+/* Function 8 */
+static noinline u32 lookup_slot(struct slot_table *table, u32 computed_idx)
+{
+	/* Pass through — in real code this might do hash lookup */
+	u32 final_idx = computed_idx % 16;  /* BUG: should be % 8 */
+
+	write_slot(table, final_idx, 0xDEADC0DE00000000ULL | final_idx);
+	return final_idx;
+}
+
+/* Function 7 */
+static noinline u32 compute_index(u32 transform_result, u32 filter_output)
+{
+	/* Combines two values into an index */
+	return (transform_result + filter_output) & 0xF;  /* 0-15, but table has 8 */
+}
+
+/* Function 6 */
+static noinline u32 apply_filter(struct payload *pl, u32 transformed_val)
+{
+	u32 filtered = transformed_val & pl->filter_mask;
+
+	return filtered >> 1;
+}
+
+/* Function 5 */
+static noinline u32 transform_data(struct payload *pl, u32 raw_offset)
+{
+	/* Transforms the offset using the payload's key */
+	return raw_offset * pl->transform_key;
+}
+
+/* Function 4 */
+static noinline struct payload *extract_payload(void *buf, u32 offset, u32 size)
+{
+	/* In real code: validates and extracts payload from buffer */
+	return (struct payload *)((u8 *)buf + offset);
+}
+
+/* Function 3 */
+static noinline int validate_header(struct request_header *hdr)
+{
+	if (hdr->magic != 0x50524F54)  /* "PROT" */
+		return -1;
+	if (hdr->version > 2)
+		return -1;
+	/* BUG: doesn't validate payload_offset bounds! */
+	return 0;
+}
+
+/* Function 2 */
+static noinline int parse_request(void *buf, u32 buf_size,
+				  struct request_header **out_hdr,
+				  struct payload **out_payload)
+{
+	struct request_header *hdr = (struct request_header *)buf;
+
+	if (validate_header(hdr) < 0)
+		return -1;
+
+	*out_hdr = hdr;
+	*out_payload = extract_payload(buf, hdr->payload_offset, hdr->payload_size);
+	return 0;
+}
+
+/* Function 1 (ENTRY): The syscall handler */
+static noinline int entry_handler(void *user_buf, u32 user_size)
+{
+	struct request_header *hdr;
+	struct payload *pl;
+	struct slot_table *table;
+	u32 transformed, filtered, index, slot;
+
+	if (parse_request(user_buf, user_size, &hdr, &pl) < 0)
+		return -1;
+
+	table = kzalloc(sizeof(*table), GFP_KERNEL);
+	if (!table)
+		return -ENOMEM;
+	table->num_slots = 8;
+
+	/* The tainted data flow:
+	 * hdr->payload_offset → extract_payload → pl
+	 * pl->transform_key + payload_offset → transform_data → transformed
+	 * transformed + pl->filter_mask → apply_filter → filtered
+	 * transformed + filtered → compute_index → index
+	 * index → lookup_slot → slot (% 16, should be % 8)
+	 * slot → write_slot → commit_write (OOB if slot >= 8)
+	 */
+	transformed = transform_data(pl, hdr->payload_offset);
+	filtered = apply_filter(pl, transformed);
+	index = compute_index(transformed, filtered);
+	slot = lookup_slot(table, index);
+
+	pr_info("deep_chain: slot=%u (OOB if >= 8)\n", slot);
+
+	kfree(table);
+	return 0;
+}
+
+/* Trigger: constructs a malicious request that causes index=12 (OOB) */
+static ssize_t deep_trigger_write(struct file *file, const char __user *ubuf,
+				  size_t count, loff_t *ppos)
+{
+	u8 *buf;
+	struct request_header *hdr;
+	struct payload *pl;
+
+	buf = kzalloc(256, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	/* Craft malicious request */
+	hdr = (struct request_header *)buf;
+	hdr->magic = 0x50524F54;       /* valid magic */
+	hdr->version = 1;              /* valid version */
+	hdr->payload_offset = 16;      /* offset to payload (valid position) */
+	hdr->payload_size = sizeof(struct payload);
+
+	/* Craft payload that will produce OOB index */
+	pl = (struct payload *)(buf + 16);
+	pl->session_id = 0xAAAABBBBCCCCDDDDULL;
+	pl->transform_key = 3;         /* multiplier */
+	pl->filter_mask = 0xFFFFFFFF;  /* no filtering */
+	memcpy(pl->data, "ATTACKER_PAYLOAD_DATA!!!", 24);
+
+	/*
+	 * Trace: payload_offset=16, transform_key=3
+	 * transformed = 16 * 3 = 48
+	 * filtered = (48 & 0xFFFFFFFF) >> 1 = 24
+	 * index = (48 + 24) & 0xF = 72 & 0xF = 8
+	 * lookup_slot: final_idx = 8 % 16 = 8  ← OOB! (table has slots[0..7])
+	 */
+
+	pr_info("deep_chain: triggering 10-deep call chain with offset=%u\n",
+		hdr->payload_offset);
+
+	entry_handler(buf, 256);
+
+	kfree(buf);
+	return count;
+}
+
+static const struct proc_ops deep_proc_ops = {
+	.proc_write = deep_trigger_write,
+};
+
+static int __init deep_chain_init(void)
+{
+	proc_deep = proc_create("deep_trigger", 0200, NULL, &deep_proc_ops);
+	if (!proc_deep)
+		return -ENOMEM;
+	pr_info("deep_chain_mod: loaded. echo x > /proc/deep_trigger\n");
+	return 0;
+}
+
+static void __exit deep_chain_exit(void)
+{
+	proc_remove(proc_deep);
+}
+
+module_init(deep_chain_init);
+module_exit(deep_chain_exit);
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("10-deep call chain for kcov_dataflow visualization");
diff --git a/tools/kcov-dataflow/eight_args_c/Makefile b/tools/kcov-dataflow/eight_args_c/Makefile
new file mode 100644
index 000000000000..de35bb541f07
--- /dev/null
+++ b/tools/kcov-dataflow/eight_args_c/Makefile
@@ -0,0 +1,2 @@
+obj-m := eight_args_mod.o
+KCOV_DATAFLOW_eight_args_mod.o := y
diff --git a/tools/kcov-dataflow/eight_args_c/eight_args_mod.c b/tools/kcov-dataflow/eight_args_c/eight_args_mod.c
new file mode 100644
index 000000000000..660b27033756
--- /dev/null
+++ b/tools/kcov-dataflow/eight_args_c/eight_args_mod.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * eight_args_mod.c - Verify kcov_dataflow captures 1 through 8 argument functions.
+ */
+#include <linux/module.h>
+#include <linux/proc_fs.h>
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KCOV dataflow 8-argument stress test module");
+
+noinline u64 func1(u64 a1)
+{
+	return a1;
+}
+EXPORT_SYMBOL(func1);
+
+noinline u64 func2(u64 a1, u64 a2)
+{
+	return a1 + a2;
+}
+EXPORT_SYMBOL(func2);
+
+noinline u64 func3(u64 a1, u64 a2, u64 a3)
+{
+	return a1 + a2 + a3;
+}
+EXPORT_SYMBOL(func3);
+
+noinline u64 func4(u64 a1, u64 a2, u64 a3, u64 a4)
+{
+	return a1 + a2 + a3 + a4;
+}
+EXPORT_SYMBOL(func4);
+
+noinline u64 func5(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5)
+{
+	return a1 + a2 + a3 + a4 + a5;
+}
+EXPORT_SYMBOL(func5);
+
+noinline u64 func6(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6)
+{
+	return a1 + a2 + a3 + a4 + a5 + a6;
+}
+EXPORT_SYMBOL(func6);
+
+noinline u64 func7(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6,
+		   u64 a7)
+{
+	return a1 + a2 + a3 + a4 + a5 + a6 + a7;
+}
+EXPORT_SYMBOL(func7);
+
+noinline u64 func8(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6,
+		   u64 a7, u64 a8)
+{
+	return a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8;
+}
+EXPORT_SYMBOL(func8);
+
+static ssize_t trigger_write(struct file *f, const char __user *buf,
+			     size_t count, loff_t *ppos)
+{
+	pr_info("func1(0x11)=0x%llx\n", func1(0x11));
+	pr_info("func2(0x11,0x22)=0x%llx\n", func2(0x11, 0x22));
+	pr_info("func3(0x11,0x22,0x33)=0x%llx\n",
+		func3(0x11, 0x22, 0x33));
+	pr_info("func4(0x11,..,0x44)=0x%llx\n",
+		func4(0x11, 0x22, 0x33, 0x44));
+	pr_info("func5(0x11,..,0x55)=0x%llx\n",
+		func5(0x11, 0x22, 0x33, 0x44, 0x55));
+	pr_info("func6(0x11,..,0x66)=0x%llx\n",
+		func6(0x11, 0x22, 0x33, 0x44, 0x55, 0x66));
+	pr_info("func7(0x11,..,0x77)=0x%llx\n",
+		func7(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77));
+	pr_info("func8(0x11,..,0x88)=0x%llx\n",
+		func8(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88));
+	return count;
+}
+
+static const struct proc_ops ops = { .proc_write = trigger_write };
+
+static int __init init_mod(void)
+{
+	proc_create("test_args", 0200, NULL, &ops);
+	return 0;
+}
+
+static void __exit exit_mod(void)
+{
+	remove_proc_entry("test_args", NULL);
+}
+
+module_init(init_mod);
+module_exit(exit_mod);
diff --git a/tools/kcov-dataflow/eight_args_rust/Makefile b/tools/kcov-dataflow/eight_args_rust/Makefile
new file mode 100644
index 000000000000..8881d369e670
--- /dev/null
+++ b/tools/kcov-dataflow/eight_args_rust/Makefile
@@ -0,0 +1,2 @@
+obj-m := eight_args_rust.o
+KCOV_DATAFLOW_eight_args_rust.o := y
diff --git a/tools/kcov-dataflow/eight_args_rust/eight_args_rust.rs b/tools/kcov-dataflow/eight_args_rust/eight_args_rust.rs
new file mode 100644
index 000000000000..11bbe1449eaf
--- /dev/null
+++ b/tools/kcov-dataflow/eight_args_rust/eight_args_rust.rs
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0
+//! Verify kcov_dataflow captures 1-arg through 8-arg functions.
+//! Write to /sys/kernel/debug/test_args_rust to trigger all 8.
+#![allow(missing_docs)]
+
+use kernel::prelude::*;
+use kernel::c_str;
+
+module! {
+    type: ArgsModule,
+    name: "eight_args_rust",
+    authors: ["kcov-dataflow"],
+    description: "1-8 arg verification",
+    license: "GPL",
+}
+
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc1(a1: u64) -> u64 { a1 }
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc2(a1: u64, a2: u64) -> u64 { a1 + a2 }
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc3(a1: u64, a2: u64, a3: u64) -> u64 {
+    a1 + a2 + a3
+}
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc4(a1: u64, a2: u64, a3: u64, a4: u64) -> u64 {
+    a1 + a2 + a3 + a4
+}
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc5(
+    a1: u64, a2: u64, a3: u64, a4: u64, a5: u64,
+) -> u64 {
+    a1 + a2 + a3 + a4 + a5
+}
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc6(
+    a1: u64, a2: u64, a3: u64, a4: u64, a5: u64, a6: u64,
+) -> u64 {
+    a1 + a2 + a3 + a4 + a5 + a6
+}
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc7(
+    a1: u64, a2: u64, a3: u64, a4: u64, a5: u64, a6: u64, a7: u64,
+) -> u64 {
+    a1 + a2 + a3 + a4 + a5 + a6 + a7
+}
+#[no_mangle]
+#[inline(never)]
+pub extern "C" fn rfunc8(
+    a1: u64, a2: u64, a3: u64, a4: u64, a5: u64, a6: u64, a7: u64,
+    a8: u64,
+) -> u64 {
+    a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8
+}
+
+unsafe extern "C" fn write_handler(
+    _file: *mut kernel::bindings::file,
+    _buf: *const core::ffi::c_char,
+    count: usize,
+    _ppos: *mut kernel::bindings::loff_t,
+) -> kernel::ffi::c_long {
+    let r1 = rfunc1(0x11);
+    pr_info!("rfunc1: ret=0x{:x}\n", r1);
+    let r2 = rfunc2(0x11, 0x22);
+    pr_info!("rfunc2: ret=0x{:x}\n", r2);
+    let r3 = rfunc3(0x11, 0x22, 0x33);
+    pr_info!("rfunc3: ret=0x{:x}\n", r3);
+    let r4 = rfunc4(0x11, 0x22, 0x33, 0x44);
+    pr_info!("rfunc4: ret=0x{:x}\n", r4);
+    let r5 = rfunc5(0x11, 0x22, 0x33, 0x44, 0x55);
+    pr_info!("rfunc5: ret=0x{:x}\n", r5);
+    let r6 = rfunc6(0x11, 0x22, 0x33, 0x44, 0x55, 0x66);
+    pr_info!("rfunc6: ret=0x{:x}\n", r6);
+    let r7 = rfunc7(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77);
+    pr_info!("rfunc7: ret=0x{:x}\n", r7);
+    let r8 = rfunc8(0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88);
+    pr_info!("rfunc8: ret=0x{:x}\n", r8);
+    count as kernel::ffi::c_long
+}
+
+#[repr(transparent)]
+struct SyncFops(kernel::bindings::file_operations);
+unsafe impl Sync for SyncFops {}
+
+static FOPS: SyncFops = SyncFops(kernel::bindings::file_operations {
+    write: Some(unsafe { core::mem::transmute(write_handler as *const ()) }),
+    ..unsafe { core::mem::zeroed() }
+});
+
+struct ArgsModule { d: *mut kernel::bindings::dentry }
+
+impl kernel::Module for ArgsModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        let d = unsafe {
+            kernel::bindings::debugfs_create_file_unsafe(
+                c_str!("test_args_rust").as_char_ptr(),
+                0o222, core::ptr::null_mut(), core::ptr::null_mut(), &FOPS.0,
+            )
+        };
+        Ok(Self { d })
+    }
+}
+impl Drop for ArgsModule {
+    fn drop(&mut self) { unsafe { kernel::bindings::debugfs_remove(self.d) }; }
+}
+unsafe impl Send for ArgsModule {}
+unsafe impl Sync for ArgsModule {}
diff --git a/tools/kcov-dataflow/kcov-view.py b/tools/kcov-dataflow/kcov-view.py
new file mode 100755
index 000000000000..70acb5474f5e
--- /dev/null
+++ b/tools/kcov-dataflow/kcov-view.py
@@ -0,0 +1,272 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+kcov-view.py - Merged KCOV + KCOV_DATAFLOW viewer
+
+Reads both /sys/kernel/debug/kcov (PC trace) and /sys/kernel/debug/kcov_dataflow
+(args/ret), correlates by PC, and produces a human-readable call trace with
+argument values and struct field expansion.
+
+Usage (inside guest or with appropriate permissions):
+    python3 kcov-view.py <trigger_command>
+
+Example:
+    python3 kcov-view.py "echo x > /proc/uaf_trigger"
+
+Output:
+    func+0x0 [module]
+      → a(arg[0]=0x1, arg[1]=0x2, arg[2]=0x3, arg[3]=struct{.f[0]=1, .f[1]=2, .f[2]=3})
+        ← ret = struct{.f[0]=1, .f[1]=2, .f[2]=3}
+      → a(arg[0]=0x0, arg[1]=0x0, arg[2]=0x1, arg[3]=NULL)
+        ← ret = 0x0
+"""
+import os, sys, struct, mmap, fcntl, subprocess, re, ctypes
+from collections import defaultdict
+
+# Ioctl definitions (x86_64)
+KCOV_INIT_TRACE = 0x80086301   # _IOR('c', 1, unsigned long)
+KCOV_ENABLE = 0x6364           # _IO('c', 100)
+KCOV_DISABLE = 0x6365          # _IO('c', 101)
+KCOV_TRACE_PC = 0
+
+KCOV_DF_INIT_TRACE = 0x80086401  # _IOR('d', 1, unsigned long)
+KCOV_DF_ENABLE = 0x6464          # _IO('d', 100)
+KCOV_DF_DISABLE = 0x6465         # _IO('d', 101)
+
+BUF_SIZE = 65536  # 65536 * 8 = 512KB = 128 pages (page-aligned)
+
+# Load kallsyms for symbolization
+def load_kallsyms():
+    syms = {}
+    try:
+        with open("/proc/kallsyms") as f:
+            for line in f:
+                parts = line.split()
+                if len(parts) >= 3:
+                    addr = int(parts[0], 16)
+                    name = parts[2]
+                    mod = parts[3].strip("[]") if len(parts) > 3 else ""
+                    syms[addr] = (name, mod)
+    except:
+        pass
+    return syms
+
+def symbolize(pc, syms):
+    """Find nearest symbol <= pc"""
+    best_addr = 0
+    best_name = f"0x{pc:x}"
+    best_mod = ""
+    for addr, (name, mod) in syms.items():
+        if addr <= pc and addr > best_addr:
+            best_addr = addr
+            best_name = name
+            best_mod = mod
+    offset = pc - best_addr
+    if best_mod:
+        return f"{best_name}+0x{offset:x} [{best_mod}]"
+    return f"{best_name}+0x{offset:x}"
+
+def parse_dataflow(buf, n):
+    """Parse TLV records from kcov_dataflow buffer into a list of events."""
+    events = []
+    i = 1
+    while i <= n and i < BUF_SIZE:
+        hdr = buf[i]
+        typ = hdr & 0xF0000000
+        seq = hdr & 0x00FFFFFF
+
+        if typ not in (0xE0000000, 0xF0000000):
+            i += 1
+            continue
+
+        pc = buf[i + 1]
+        meta = buf[i + 2]
+        i += 3
+
+        # Collect field values
+        fields = []
+        while i <= n and i < BUF_SIZE:
+            v = buf[i]
+            vtype = v & 0xF0000000
+            if vtype == 0xE0000000 or vtype == 0xF0000000:
+                break
+            fields.append(v)
+            i += 1
+
+        if typ == 0xE0000000:
+            arg_idx = (meta >> 56) & 0xFF
+            arg_sz = (meta >> 48) & 0xFF
+            ptr = meta & 0xFFFFFFFFFFFF
+            events.append({
+                "type": "entry", "seq": seq, "pc": pc,
+                "arg_idx": arg_idx, "arg_size": arg_sz,
+                "ptr": ptr, "fields": fields
+            })
+        else:
+            ret_sz = (meta >> 48) & 0xFF
+            ptr = meta & 0xFFFFFFFFFFFF
+            events.append({
+                "type": "ret", "seq": seq, "pc": pc,
+                "ret_size": ret_sz, "ptr": ptr, "fields": fields
+            })
+    return events
+
+def format_value(val):
+    if val == 0xBADADD85:
+        return "FAULT"
+    if val == 0:
+        return "0"
+    return f"0x{val:x}"
+
+def format_entry(ev):
+    """Format an entry event as a function argument."""
+    if len(ev["fields"]) > 1:
+        # Struct: multiple fields
+        flds = ", ".join(f".f[{i}]={format_value(v)}" for i, v in enumerate(ev["fields"]))
+        return f"struct{{{flds}}}"
+    elif len(ev["fields"]) == 1:
+        v = ev["fields"][0]
+        if v == 0 and ev["ptr"] == 0:
+            return "NULL"
+        return format_value(v)
+    return format_value(ev["ptr"])
+
+def merge_and_display(pc_trace, df_events, syms):
+    """Display dataflow events with symbolization."""
+    print("\n╔═══════════════════════════════════════════════════════════╗")
+    print("║  Merged KCOV Coverage + Dataflow View                    ║")
+    print("╚═══════════════════════════════════════════════════════════╝\n")
+
+    if not df_events:
+        print("  (no dataflow events captured)")
+        return
+
+    # Group events into calls: consecutive entries for same PC followed by a ret
+    calls = []
+    current_args = []
+    current_pc = None
+
+    for ev in df_events:
+        if ev["type"] == "entry":
+            if current_pc is not None and ev["pc"] != current_pc:
+                calls.append({"pc": current_pc, "args": current_args, "ret": None})
+                current_args = []
+            current_pc = ev["pc"]
+            current_args.append(ev)
+        elif ev["type"] == "ret":
+            if current_pc == ev["pc"]:
+                calls.append({"pc": current_pc, "args": current_args, "ret": ev})
+                current_args = []
+                current_pc = None
+            else:
+                if current_args:
+                    calls.append({"pc": current_pc, "args": current_args, "ret": None})
+                    current_args = []
+                calls.append({"pc": ev["pc"], "args": [], "ret": ev})
+                current_pc = None
+
+    if current_args:
+        calls.append({"pc": current_pc, "args": current_args, "ret": None})
+
+    for call in calls:
+        sym = symbolize(call["pc"], syms)
+        args_parts = []
+        for a in call["args"]:
+            idx = a["arg_idx"]
+            if len(a["fields"]) > 1:
+                flds = ", ".join(f".f[{i}]={format_value(v)}" for i, v in enumerate(a["fields"]))
+                args_parts.append(f"arg[{idx}]=struct{{{flds}}}")
+            elif len(a["fields"]) == 1:
+                args_parts.append(f"arg[{idx}]={format_value(a['fields'][0])}")
+            else:
+                args_parts.append(f"arg[{idx}]=?")
+
+        print(f"  → {sym}({', '.join(args_parts)})")
+
+        if call["ret"]:
+            r = call["ret"]
+            if len(r["fields"]) > 1:
+                flds = ", ".join(f".f[{i}]={format_value(v)}" for i, v in enumerate(r["fields"]))
+                print(f"    ← ret = struct{{{flds}}}")
+            elif len(r["fields"]) == 1:
+                print(f"    ← ret = {format_value(r['fields'][0])}")
+        print()
+
+def main():
+    if len(sys.argv) < 2:
+        print(f"Usage: {sys.argv[0]} <trigger_command>")
+        print(f"Example: {sys.argv[0]} 'echo x > /proc/uaf_trigger'")
+        sys.exit(1)
+
+    trigger_cmd = sys.argv[1]
+    syms = load_kallsyms()
+
+    # Setup ctypes mmap
+    libc = ctypes.CDLL("libc.so.6", use_errno=True)
+    libc.mmap.restype = ctypes.c_void_p
+    libc.mmap.argtypes = [ctypes.c_void_p, ctypes.c_size_t, ctypes.c_int,
+                          ctypes.c_int, ctypes.c_int, ctypes.c_long]
+    PROT_RW = 0x3  # PROT_READ | PROT_WRITE
+    MAP_SHARED = 0x01
+
+    # Open both devices
+    kcov_fd = -1
+    df_fd = -1
+    kcov_arr = None
+    df_arr = None
+
+    # Legacy kcov (PC trace) - skip for now, use kallsyms for symbolization
+    kcov_arr = None
+
+    # Dataflow device - required
+    df_fd = os.open("/sys/kernel/debug/kcov_dataflow", os.O_RDWR)
+    fcntl.ioctl(df_fd, KCOV_DF_INIT_TRACE, BUF_SIZE)
+    df_ptr = libc.mmap(None, BUF_SIZE * 8, PROT_RW, MAP_SHARED, df_fd, 0)
+    if df_ptr == ctypes.c_void_p(-1).value:
+        print("Error: kcov_dataflow mmap failed")
+        sys.exit(1)
+    df_arr = (ctypes.c_uint64 * BUF_SIZE).from_address(df_ptr)
+
+    # Enable both
+    if kcov_arr:
+        fcntl.ioctl(kcov_fd, KCOV_ENABLE, KCOV_TRACE_PC)
+        kcov_arr[0] = 0
+
+    fcntl.ioctl(df_fd, KCOV_DF_ENABLE, 0)
+    df_arr[0] = 0
+
+    # Trigger - must happen in THIS process (kcov_dataflow is per-task)
+    if ">" in trigger_cmd:
+        target = trigger_cmd.split(">")[-1].strip()
+    else:
+        target = trigger_cmd
+    try:
+        fd_t = os.open(target, os.O_WRONLY)
+        os.write(fd_t, b"x")
+        os.close(fd_t)
+    except Exception as e:
+        print(f"Trigger failed: {e}")
+
+    # Read results
+    pc_trace = []
+    if kcov_arr:
+        n_pcs = kcov_arr[0]
+        for i in range(1, min(int(n_pcs) + 1, BUF_SIZE)):
+            pc_trace.append(kcov_arr[i])
+        fcntl.ioctl(kcov_fd, KCOV_DISABLE, 0)
+
+    n_df = int(df_arr[0])
+    df_raw = [int(df_arr[i]) for i in range(min(n_df + 10, BUF_SIZE))]
+    fcntl.ioctl(df_fd, KCOV_DF_DISABLE, 0)
+
+    # Parse and display
+    df_events = parse_dataflow(df_raw, int(n_df))
+    merge_and_display(pc_trace, df_events, syms)
+
+    # Cleanup
+    if kcov_arr:
+        os.close(kcov_fd)
+    os.close(df_fd)
+
+if __name__ == "__main__":
+    main()
diff --git a/tools/kcov-dataflow/trigger.c b/tools/kcov-dataflow/trigger.c
new file mode 100644
index 000000000000..7fa7b4414770
--- /dev/null
+++ b/tools/kcov-dataflow/trigger.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * trigger.c - Uses /sys/kernel/debug/kcov_dataflow to capture
+ * function args/ret TLV records. Completely independent from legacy kcov.
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+
+#define KCOV_DF_INIT_TRACE	_IOR('d', 1, unsigned long)
+#define KCOV_DF_ENABLE		_IO('d', 100)
+#define KCOV_DF_DISABLE		_IO('d', 101)
+
+#define COVER_SIZE (64 * 1024)  /* 64K u64 words = 512KB */
+
+static void dump_buffer(uint64_t *cover, uint64_t n)
+{
+	uint64_t i = 1;
+
+	printf("=== KCOV Dataflow TLV Dump (%lu words) ===\n", n);
+	while (i <= n && i < COVER_SIZE) {
+		uint64_t hdr = cover[i];
+		uint64_t type = hdr & 0xF0000000ULL;
+		uint64_t seq = hdr & 0x00FFFFFFULL;
+		uint64_t pc = cover[i + 1];
+		uint64_t meta = cover[i + 2];
+
+		if (type == 0xE0000000ULL) {
+			uint32_t arg_idx = (meta >> 56) & 0xFF;
+			uint32_t arg_sz = (meta >> 48) & 0xFF;
+			uint64_t ptr = meta & 0xFFFFFFFFFFFFULL;
+
+			printf("[ENTRY] seq=%lu pc=0x%lx arg[%u](%u) ptr=0x%lx\n",
+			       seq, pc, arg_idx, arg_sz, ptr);
+		} else if (type == 0xF0000000ULL) {
+			uint32_t ret_sz = (meta >> 48) & 0xFF;
+			uint64_t ptr = meta & 0xFFFFFFFFFFFFULL;
+
+			printf("[RET]   seq=%lu pc=0x%lx ret(%u) ptr=0x%lx\n",
+			       seq, pc, ret_sz, ptr);
+		} else {
+			i++;
+			continue;
+		}
+
+		/* Print field values */
+		i += 3;
+		while (i <= n && i < COVER_SIZE) {
+			uint64_t next = cover[i];
+			uint64_t next_type = next & 0xF0000000ULL;
+
+			if (next_type == 0xE0000000ULL || next_type == 0xF0000000ULL)
+				break;
+			if (next == 0xBADADD85ULL)
+				printf("  val = FAULT\n");
+			else
+				printf("  val = 0x%lx\n", next);
+			i++;
+		}
+	}
+	printf("=== Done ===\n");
+}
+
+int main(int argc, char **argv)
+{
+	const char *trigger_path = "/proc/uaf_trigger";
+	int fd, tfd;
+	uint64_t *cover;
+	uint64_t n;
+
+	if (argc > 1)
+		trigger_path = argv[1];
+
+	fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+	if (fd < 0) {
+		perror("open kcov_dataflow");
+		return 1;
+	}
+
+	if (ioctl(fd, KCOV_DF_INIT_TRACE, COVER_SIZE)) {
+		perror("KCOV_DF_INIT_TRACE");
+		close(fd);
+		return 1;
+	}
+
+	cover = mmap(NULL, COVER_SIZE * sizeof(uint64_t),
+		     PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	if (cover == MAP_FAILED) {
+		perror("mmap");
+		close(fd);
+		return 1;
+	}
+
+	if (ioctl(fd, KCOV_DF_ENABLE, 0)) {
+		perror("KCOV_DF_ENABLE");
+		munmap(cover, COVER_SIZE * sizeof(uint64_t));
+		close(fd);
+		return 1;
+	}
+
+	/* Reset */
+	__atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
+
+	/* Trigger */
+	tfd = open(trigger_path, O_WRONLY);
+	if (tfd >= 0) {
+		write(tfd, "x", 1);
+		close(tfd);
+	}
+
+	n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
+
+	ioctl(fd, KCOV_DF_DISABLE, 0);
+
+	dump_buffer(cover, n);
+
+	munmap(cover, COVER_SIZE * sizeof(uint64_t));
+	close(fd);
+	return 0;
+}

-- 
2.43.0


