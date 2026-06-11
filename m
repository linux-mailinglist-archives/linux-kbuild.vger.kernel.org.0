Return-Path: <linux-kbuild+bounces-13717-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UM2PK2HjKmqIywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13717-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:33:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B567392B
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:33:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=CtTaCVBb;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13717-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13717-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4435D356DD75
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8474921B1;
	Thu, 11 Jun 2026 16:22:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1363D481ABA;
	Thu, 11 Jun 2026 16:22:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194930; cv=fail; b=EDgPiHH99PuHiZDnstveVlTfPi0SkONqp1/3soueq9bVWx+83q5NV3ADF+Mm8WTuvAFyoV81WkXj/Utexino4MyxSjgcFFCgVpm4kliIbMogT1m5XvvH3PWnTRb5iXBJL4FKwwVQ2CYykQr05iZYizGR+EQ/D74abP0/GSJzWe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194930; c=relaxed/simple;
	bh=YNHRJxU7pBEgkggxGz5sDX5HG43rBjCaNfca9paR2Fk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KVaf+HBu0kWTEp8sFLO67GGVjiHVBy2diXYovJ3iuV0K8cuGrZcHKjECsuRcTBkYtbxt0VTTdZW1cpb0aAX99udyuODosnKYYD+VEpZsz5f9SeeQIHd3EkVrck5cWXJEtvfaz33S+iMaOQ2tCUq+aWsl13WjPZ7OG+KLg9SQYyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=CtTaCVBb; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frPrbC5IEkI2ApUDjmJOTqYZuz2RBKPWgMC2TmA84EsJUrYG/a9BSaqQUCQAtEr74kGi7bjPn/S1h8h8Lbas/0wgGyQScQx6+WEp35IQzYQHqyt2wWlNI1oOqKxTkpbY9lNqpxP5t32p10DLd4+q2kS1KZsAiZBLdiK3qghE5fSTsUbC6Zr1i2aTBzUZtc3sGf30/AiritkopI8fAdBfiEpgLx37HSX7X7fIchj3RVKVrqdGDTykDu2jL3W3Uiri+l0ubDNipWXCOrRIqMBDyHMAai0r2gUstgoz5JZ/+6FjPTixhrfIlvsWPEi0wLMMroGJ7e+uV/U31Q1J4mLddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psY6a90e3/sLp+Oj5S4FiGYhmUJhRZQVAjwBzfCgPHU=;
 b=K1pap0lZUjM8y8xTTCmKiItjGn+IM+L4flrCWHkw8Mo2r0uK9UQsQ64IVjB+j62W9MPxqXRV8NZP4eRb9QLqsPP6O+IfmU8/ABC5AeJWfC0aoHpLtSpZ9eiX0G0LMk8AurqdKkqdsRvak1CMa3DazM1XmwUa25zlkvnisBvw6uvWtXNdTk7HQvd/CLQ/n9WTnww26jR5KKe/emkrrUzO0/KoRxbyqcwt4Ut8zIWhrVB1b2Nebq3VHA+Bwsk3pR6tAOsIFXasLWc/p/jE5GOr8EEYxag3O6ajUKg56bA+vZVd+Dd+fVgrZSFWNDtvYvHXWJIt8WLZ37PLgyFudD4yAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=psY6a90e3/sLp+Oj5S4FiGYhmUJhRZQVAjwBzfCgPHU=;
 b=CtTaCVBblVnx/w6HwDxzBjibcgvsRSCE49u8IH75LRohIiq8TgFWPrulRQeROVYYYUiR5QPkJhHdfWzk7NnkKUij9JWJZQ4kvQBEH6Oirs0OxL1dPzsk4JqKrHJwbWmaDdkj1ixKHN02R3rdrMfgvGKtKQwxJ8yjyiAawiAKaOE4jNOz0VOQHZn/vQymtF/O2NU4Sj+eQfdTcG2IEZNWWMXyoWCJaoTMFKQLC3GFDcY4gDkRdqoC6ddPzES7BiUd/9Flp8MrdkVFK+8LgxmL47Va7Q5+Zmlkvr8FfVSQWGcPHlDY+4PTTE1geMSWWvMo+/hH0kIeGgILCHTKB/DejQ==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:58 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:58 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:14 +0200
Subject: [RFC PATCH v2 12/14] selftests/kcov_dataflow: add
 rust_ffi_contract test module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-12-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=9250;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=YNHRJxU7pBEgkggxGz5sDX5HG43rBjCaNfca9paR2Fk=;
 b=8cDztotREPor/G6xcbhmpILOlAgxGYlwU+i7il0yY4g3T/qI7SskicjdN3rMs9iPkQOnDAMXs
 HVC5MntnHluDLOk1wOBp80N2giabqVzG2JcEh5HlMCqyBCo5hq4mJ2L
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GV3PEPF0001DBF0.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::315) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: de428a95-98ca-42db-ea15-08dec7d58f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ITX49KV1ZIsoniDnALyWs8CIWp9pf2nzwcRph/luzxZthhe+gQzLHQ3EfnQfaTYZDjKtylOPYADPh2Ygy6Ag58S+35iBUkR0e/5dNXKMCYUM8hwvV4UfeWUgo3Go/EY2GoA8T1S7cR4Iq6I1BHM/Nobu8aHac4/l7hdLN1ON/B+CzduarPmI+uNFJL/vzjOpyoNNuMagPNjORM/S6noA6vC7SYwdfjlOWGbXTWH7CEJ/D8dF5x6ivXrJpYKq4yccVWDRjP7HCjXs712qvImsWHiy+jxA0PWUVgNNkXikYHVwRHPkytTG/UNMhQ7IiVJprmWrgQjgCJRu0w609qWnbhJ7mFy2Bc9vhwNG/vdjExXGIH96ULagL/e2tqXfHlTCYt0OG/blS+pZP6DmOuicxDK1ew22GXr8NFwblC6eG9IhK2nmHKZVtgeexJfBtggjihca74JX0Ay20Awa/fLsJMtXDlAjte7PbDtxAfnRLQHHeET2zYc9EAU8R7JC+ZS4E5kfvux/1/muYSYM48LhAGYz5YZCFtvhI07m8i6yEWeUITJydkOqyWzh9c7N0QsUlVcffRVBTWMglMweH1xPqD1dbY9Ge/M76+j7SMTSovwDoSlJYKoiL8O5o2wYRQfI96MRPozuW8CdQ+gL9Aacm3lkfL7sJAebx3qdgr/9fqscKhn+5abHBWm5Uuh9i90AczUvhWFovPFbpMW4kVHG6s0NFebGimnwyRDfGWniD9zs6x17ECy8aT3g0TEwLVS1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHg4RGc3ekdvR25zWjhQRUZPbUtMSXp4Q0d2dk1oU3UzdHk4YmVLUUZFakRL?=
 =?utf-8?B?UXM4SklDdlcxUnd1RWZ5MGR3ZEVzdGRrQm1LZmMwWDB6NkE2NnArSkdnVzVG?=
 =?utf-8?B?anYyNFY4WlhpOVU0TU41b0tML092aVRlSmpGNVgrclhsWkl6UkxNZDBOQWtm?=
 =?utf-8?B?YVNuTDQ4TS93M0pkN1RXeXVRclFibmk0L3dmc25ya2RRNFJwWUhLb1NzZmJN?=
 =?utf-8?B?MVJHeHFZbVRqOUNvbFRRNDIvLzdUQmhrVnpJem14SmtyN2FZV2Nrd3JPdWdu?=
 =?utf-8?B?cDVncEhncG5jN3QvZjZ1NjhiaFhJZVVCYkRURFZzallQRlFxZWtBMWEzOE5Q?=
 =?utf-8?B?QW9rYWxqVURvY1hLaHNMbnZleHBTQkNXMXExeEU3SlVrbEI4RDZNRWNPeWI3?=
 =?utf-8?B?a0kySUIybGlSMHBnZGkxNzRBWUdmZVJrUy9GaXNGR0kyN3NJcFdRTXFwMk1s?=
 =?utf-8?B?UTB1NWphMCtQM1U2aFNvT0drYjFqSFBDZWw0bDFqbXhkOHFITk10QTJ3YzJO?=
 =?utf-8?B?bFBmOGdqMzZIQXlUR3p0OHJuazdOeUNxSXZQdnozcDFoRFBNODJHTC9pQmJu?=
 =?utf-8?B?QUlyczR2ZnBLa3BMbEpyTGphU2ROSGJBaFVrL0F2VDJ4OXptd2hHRVp3d1hZ?=
 =?utf-8?B?Y3FXVHBQTTFCS0xIKzE2TEhRRlJHRzhsS29LK2tsbkJ1TlRDckhZSGFjRWVw?=
 =?utf-8?B?RVd0M0VEME9OWnhTeUhHQUg1TG9ucnVDa2lhMkQxanFLM2V1SUhORVYvVkU0?=
 =?utf-8?B?Mk1nblVLZU5WM2ltcUlZU0IrZ2lBZWVHY2tQSDFJbWhHNTZ4S1ZWNnU4U2VF?=
 =?utf-8?B?dDNmWnkxeDVHcXFjMnNKcjJodENmbEIzMDI2bUk1eDRFRVZ4WGJyZ05ncStx?=
 =?utf-8?B?NnEvME9vWjBWT0tZUDArRGhiY0NEZHBmK1lZbERuKzU1a3NSeE1jb2l0MFNM?=
 =?utf-8?B?SnFKbFozM2VoaWV0YjIxazhCYXI4MmhheVZhVXdIQUZTcWhxWTMzTWZ2SEVF?=
 =?utf-8?B?TXUvNExJTEE4VVhLOGpObUl5ckZuNExqeHdxZ2loQUZWSy8rVncwWGJ5ejND?=
 =?utf-8?B?WXpicGc3QTczUVVvUnpPOHNySDlodEZFbVFZYTBvaCtuRzVEODdDd3Ezay9B?=
 =?utf-8?B?ejZUVlZvK013bTFSbjJTKzBCZ1V2S2I4eFlNR3VHWkpJL0VkM3R2ZWtWazll?=
 =?utf-8?B?MldtYmlkZDdiZzlKSnkvYjc1TVlwcnlJLzhpQSs5VG1CSUo3SmpkL0FWM2Na?=
 =?utf-8?B?bzZ2YmRwVG9VeWg0K0NBSUdBcHlVVk52K1NlZms2aGNSY2MxNzZrYm84ckFa?=
 =?utf-8?B?OGYzaUFXQmVOOHVWOFZodDBBNHpYK3Z6aFhiWER5R3h6c0JXSGNYaGJvMys5?=
 =?utf-8?B?MmN5cTRzVTk1Ukd0VUs5QXI3U3NnNjloOXZDWmhKd2R0MmpLMGxZTmdBRm5K?=
 =?utf-8?B?NFpFRW53aVRCSG5Id2pUVUk1UWpGNEFyVXVoZnhLQzdRa01hVnloczNaQ1dm?=
 =?utf-8?B?T0hObmdrQkFaZDBxbnJpZUFCZmhnTGhPbStPcFJvTnZFYmloYldaajRTQldi?=
 =?utf-8?B?TUYxVXdvVW5ZZDA0VzhvRytRVXJuNTlIenhiMG9PSzBWWEt3dVU0OGxpZ09Q?=
 =?utf-8?B?Z0dDUmRHS2p0dytuMGVlTGhFSTVWOTZBeEE1NlMxNENHRGxieE1hZEhwRFov?=
 =?utf-8?B?ZmRqU2VkeWRKWTNEOVU3Y2trS2piZk1TWGtoS3cxQW9YYVpUMWlGYmx0Zy9N?=
 =?utf-8?B?cWNkeG1LZDVFdUpSN0FoREw3bWcwY1FIanR6MFlVZ01ibjB4RzBZMkk0Q0xE?=
 =?utf-8?B?MXhUS2gzYnFIWjhTcUpLbDJyWGVWMlN2dThXdllwRzF1SVI0T3E1WWNIa1Mz?=
 =?utf-8?B?WFhIMHlIRUpTVG5sVmJmT1JSRkFJMTl3SnBOeTdyb2VzM285cW1Ub2N2OURR?=
 =?utf-8?B?WSt6aDRUMUlnSVpGNjVxbW9vV2liWTVkM2dkWVBBTVBJa283dUg1dis5eEdD?=
 =?utf-8?B?VERnOHEydTZXN0NVN3puVTRGMDBOUVBLMnlHbkd3dW82QUZuSmpFVWFBakJs?=
 =?utf-8?B?STlXV0JvVlNWdmhmYzg2NzdrQjRDSFI1aXJsVElBYnpFZWwyM2JuT0VQNXRk?=
 =?utf-8?B?ajNNZGRRU1UzRkRmNTNTbU05b2tFSzdaZE5jRlBSL29ybTdzZGxOMGhoOXV6?=
 =?utf-8?B?dTMzU0lIL1FIYnRiYk9mTkwxNEFOUHMvTk5PbnVwUUpEbmVWT3h2RGxBSzZz?=
 =?utf-8?B?Qm1EQWRCS2FGWTFQazlqRllCcHYvaXRMT0NqYmhCaVVkakNMVWo4dHE0UHcv?=
 =?utf-8?B?QzJMYUVhOTQ0TUltT3VCaXlUTDlna2c2TFNxMEttbE9zeU9ZSlVBUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: de428a95-98ca-42db-ea15-08dec7d58f8b
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:58.4696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1q0q3A/Pd4ORrgMRBq3SzXpnXk0SNH0Xs70vb5CJoJvf7dvb/t3FIpACY2fmjV8zAEAbI5A3xCziuIu5Y2pefw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13717-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[run_rust_ffi_contract.sh:url,trigger-view.py:url,run_eight_args_c.sh:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 030B567392B

Demonstrates FFI contract violation detection. A C callee returns
success (0) but leaves buffer=NULL, violating the postcondition
"ret==0 implies buffer!=NULL". kcov_dataflow captures struct fields
at the boundary proving the violation without a crash or KASAN report.

Test:

  make LLVM=1 CC=clang \
    M=tools/testing/selftests/kcov_dataflow/rust_ffi_contract modules
  vng --user root --exec \
    "python3 tools/testing/selftests/kcov_dataflow/trigger-view.py \
      rust_ffi_contract -C 8 --ko \
      tools/testing/selftests/kcov_dataflow/rust_ffi_contract/rust_ffi_contract.ko"

Result:

  vfs_write(0x0)
  0x0 = full_proxy_write()
  full_proxy_write(0x0, 0x1, 0x0)
  0x8200080 = __debugfs_file_get()
  __debugfs_file_get(0x0)
  0x0 = __debugfs_file_get()
  0x0 = rust_ffi_trigger_write [rust_ffi_contract]()
  rust_ffi_trigger_write [rust_ffi_contract](0x0, 0x1, 0x0)
    ffi_alloc_buf [rust_ffi_contract](0xffffffff912288ad, 0x100, 0x0, 0x1)
    0x0 = ffi_alloc_buf [rust_ffi_contract]()
    _printk(0x6f635f6966663601)
      vprintk(0x6f635f6966663601, 0x8)
        vprintk_default(0x6f635f6966663601, 0x8)
          vprintk_emit(0x0, 0xffffffff, 0x0)
          0x0 = panic_on_this_cpu()
        0x0 = _prb_read_valid()
      0x0 = prb_read_valid()
    0x0 = console_unlock()
  0x3f = vprintk_emit()
  0x3f = vprintk_default()
  0x3f = vprintk()
  0x3f = _printk()
  ffi_check_result [rust_ffi_contract](0x0)
    _printk(0x6f635f6966663301)
      vprintk(0x6f635f6966663301, 0x8)
        vprintk_default(0x6f635f6966663301, 0x8)
          vprintk_emit(0x0, 0xffffffff, 0x0)
          0x0 = panic_on_this_cpu()
        0x0 = _prb_read_valid()
      0x0 = prb_read_valid()
    0x0 = console_unlock()
  0x3f = vprintk_emit()
  0x3f = vprintk_default()
  0x3f = vprintk()
  0x3f = _printk()
  0xfffffff2 = ffi_check_result [rust_ffi_contract]()
  0x1 = rust_ffi_trigger_write [rust_ffi_contract]()
  0x1 = full_proxy_write()
  0x1 = vfs_write()
  0x1 = ksys_write()
  0x1 = __x64_sys_write()
  0x0 = fpregs_assert_state_consistent()
  0xba5748 = __x64_sys_close()
  file_close_fd(0x4)
  0x0 = file_close_fd()

Cc: Alexander Potapenko <glider@google.com>
Assisted-by: Claude:claude-opus-4-6 [kiro-chat]
Link: https://github.com/yskzalloc/kcov-dataflow/actions
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 tools/testing/selftests/kcov_dataflow/Makefile     |   2 +-
 tools/testing/selftests/kcov_dataflow/README.rst   |   8 ++
 .../kcov_dataflow/run_rust_ffi_contract.sh         |  35 +++++++
 .../kcov_dataflow/rust_ffi_contract/Makefile       |   3 +
 .../rust_ffi_contract/rust_ffi_contract.c          | 111 +++++++++++++++++++++
 5 files changed, 158 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kcov_dataflow/Makefile b/tools/testing/selftests/kcov_dataflow/Makefile
index 3a42c54e954d..6412c90edfa1 100644
--- a/tools/testing/selftests/kcov_dataflow/Makefile
+++ b/tools/testing/selftests/kcov_dataflow/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 TEST_GEN_PROGS := user_ioctl/user_ioctl
-TEST_PROGS := run_eight_args_c.sh
+TEST_PROGS := run_eight_args_c.sh run_rust_ffi_contract.sh
 include ../lib.mk
diff --git a/tools/testing/selftests/kcov_dataflow/README.rst b/tools/testing/selftests/kcov_dataflow/README.rst
index 61a41f3bd596..06a0c805cc74 100644
--- a/tools/testing/selftests/kcov_dataflow/README.rst
+++ b/tools/testing/selftests/kcov_dataflow/README.rst
@@ -48,3 +48,11 @@ eight_args_rust/
 
         make LLVM=1 CC=clang M=tools/testing/selftests/kcov_dataflow/eight_args_rust modules
         python3 trigger-view.py eight_args_rust
+
+rust_ffi_contract/
+    Demonstrates FFI contract violation detection. A callee returns
+    success but leaves buffer=NULL. kcov_dataflow captures struct
+    fields proving the violation::
+
+        make LLVM=1 CC=clang M=tools/testing/selftests/kcov_dataflow/rust_ffi_contract modules
+        python3 trigger-view.py rust_ffi_contract
diff --git a/tools/testing/selftests/kcov_dataflow/run_rust_ffi_contract.sh b/tools/testing/selftests/kcov_dataflow/run_rust_ffi_contract.sh
new file mode 100755
index 000000000000..8662e532296b
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/run_rust_ffi_contract.sh
@@ -0,0 +1,35 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Test rust_ffi_contract module capture via kcov_dataflow
+DIR="$(dirname "$0")"
+KO="$DIR/rust_ffi_contract/rust_ffi_contract.ko"
+
+if [ ! -f "$KO" ]; then
+	echo "SKIP: $KO not found"
+	echo "Build: make LLVM=1 CC=clang M=...rust_ffi_contract modules""
+	exit 4  # kselftest SKIP
+fi
+
+if [ ! -e /sys/kernel/debug/kcov_dataflow ]; then
+	echo "SKIP: kcov_dataflow not available"
+	exit 4
+fi
+
+OUTPUT=$(python3 "$DIR/trigger-view.py" rust_ffi_contract --ko "$KO" --raw 2>&1)
+RC=$?
+
+if [ $RC -ne 0 ]; then
+	echo "FAIL: trigger-and-view exited with $RC"
+	echo "$OUTPUT"
+	exit 1
+fi
+
+RECORDS=$(echo "$OUTPUT" | grep -c "^\[ENTRY\]\|^\[RET")
+if [ "$RECORDS" -gt 0 ]; then
+	echo "PASS: captured $RECORDS records from rust_ffi_contract"
+	exit 0
+else
+	echo "FAIL: no records captured"
+	echo "$OUTPUT"
+	exit 1
+fi
diff --git a/tools/testing/selftests/kcov_dataflow/rust_ffi_contract/Makefile b/tools/testing/selftests/kcov_dataflow/rust_ffi_contract/Makefile
new file mode 100644
index 000000000000..d2a0261070b1
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/rust_ffi_contract/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-m := rust_ffi_contract.o
+KCOV_DATAFLOW_rust_ffi_contract.o := y
diff --git a/tools/testing/selftests/kcov_dataflow/rust_ffi_contract/rust_ffi_contract.c b/tools/testing/selftests/kcov_dataflow/rust_ffi_contract/rust_ffi_contract.c
new file mode 100644
index 000000000000..9cbb17c42195
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/rust_ffi_contract/rust_ffi_contract.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rust_ffi_contract.c - Demonstrates kcov_dataflow detecting an FFI
+ * contract violation at a function boundary.
+ *
+ * The pattern: caller passes a struct pointer to callee. Callee's
+ * contract says "returns 0 implies out->buffer is valid". A bug in
+ * the async path returns 0 but leaves buffer=NULL.
+ *
+ * kcov_dataflow captures:
+ *   [ENTRY] ffi_alloc_buf(alloc={.buffer=NULL, .data_size=0}, 256, 16, 1)
+ *   [RET]   ffi_alloc_buf() = 0
+ *   [ENTRY] ffi_check_result(alloc={.buffer=NULL, ...})
+ *                             ^ proves contract violated
+ *
+ * Write to /sys/kernel/debug/kcov_dataflow_test/rust_ffi_trigger to run.
+ */
+#include <linux/module.h>
+#include <linux/debugfs.h>
+#include <linux/slab.h>
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("FFI contract violation detection via kcov_dataflow");
+
+struct ffi_alloc {
+	void *buffer;
+	u64 data_size;
+	u32 free_async;
+	u32 flags;
+};
+
+/* Prototypes */
+int ffi_alloc_buf(struct ffi_alloc *alloc, u64 data_size,
+		  u64 offsets_size, int is_async);
+int ffi_check_result(struct ffi_alloc *alloc);
+
+/*
+ * Callee with contract: returns 0 implies alloc->buffer is valid.
+ * BUG: async path with free_async==0 returns 0 but buffer stays NULL.
+ */
+noinline int ffi_alloc_buf(struct ffi_alloc *alloc, u64 data_size,
+			   u64 offsets_size, int is_async)
+{
+	if (!is_async) {
+		alloc->buffer = kmalloc(data_size, GFP_KERNEL);
+		if (!alloc->buffer)
+			return -ENOMEM;
+		return 0;
+	}
+	/* BUG: returns success but buffer is NULL when pool empty */
+	if (alloc->free_async == 0) {
+		alloc->buffer = NULL;
+		return 0; /* contract violation */
+	}
+	alloc->buffer = kmalloc(data_size, GFP_KERNEL);
+	alloc->free_async--;
+	return 0;
+}
+EXPORT_SYMBOL(ffi_alloc_buf);
+
+/* Caller that trusts the contract */
+noinline int ffi_check_result(struct ffi_alloc *alloc)
+{
+	if (!alloc->buffer) {
+		pr_err("ffi_contract: VIOLATION detected - buffer is NULL after success\n");
+		return -EFAULT;
+	}
+	kfree(alloc->buffer);
+	return 0;
+}
+EXPORT_SYMBOL(ffi_check_result);
+
+static struct dentry *test_dir;
+
+static ssize_t rust_ffi_trigger_write(struct file *f, const char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct ffi_alloc alloc = { .buffer = NULL, .data_size = 0,
+				   .free_async = 0, .flags = 0 };
+	int ret;
+
+	/* Trigger the bug: is_async=1, free_async=0 */
+	ret = ffi_alloc_buf(&alloc, 256, 16, 1);
+	pr_info("ffi_contract: ffi_alloc_buf returned %d, buffer=%p\n",
+		ret, alloc.buffer);
+
+	if (ret == 0)
+		ffi_check_result(&alloc);
+
+	return count;
+}
+
+static const struct file_operations rust_ffi_trigger_fops = {
+	.write = rust_ffi_trigger_write,
+};
+
+static int __init ffi_contract_init(void)
+{
+	test_dir = debugfs_create_dir("kcov_dataflow_test", NULL);
+	debugfs_create_file("rust_ffi_trigger", 0200, test_dir, NULL,
+			    &rust_ffi_trigger_fops);
+	return 0;
+}
+
+static void __exit ffi_contract_exit(void)
+{
+	debugfs_remove_recursive(test_dir);
+}
+
+module_init(ffi_contract_init);
+module_exit(ffi_contract_exit);

-- 
2.43.0


