Return-Path: <linux-kbuild+bounces-13709-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 018YHkLhKmrbygMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13709-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:24:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13335673754
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:24:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=nsOPupXe;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13709-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13709-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43D8A30414DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA55B441020;
	Thu, 11 Jun 2026 16:21:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7843DA2D;
	Thu, 11 Jun 2026 16:21:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194916; cv=fail; b=M8i9VlffXlXn+rcwrnvaFb0eNM3Eg008fPKZZP5UmvjNg8uSWyaJwGsieZ0fJl4AtgCajP+pzCsg837ub0RjOGY6DCBzubmFXmdc22MVmLJSrBI11P9G3/xWVa8AbZekOuTBHZCN2jOBmDg0ZKy3Sg/3XqZXcfkYxec2e54JA/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194916; c=relaxed/simple;
	bh=XSHe8vY0Ve68XUnibvBYYD9uBYIxECRAW5jYSSDgvdw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gNDFaOBAH0xKZrJQge9EhxnOPvtRgEAenKz9UJlh9H/AP3w4Bmcaqmx8rjZGYCp9RNc7qKvIkF6AwwzrHx7I/3xGx7tmY0UX02GTr6C8790cQnZytT1oxV/XWH9EHM9bmWi7Z5DuxS4liYbG/Vwmg6VlRITU1YolGHxRXrnqmN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=nsOPupXe; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYBjQyQULH5EJxNnaLfjmnG7Wyd+CgLzOscxHUaydvmYmFof6g4ZYyQYwqMQ1QDPq3lxlbdguaDzny734QwqKDkqyyOH+yUKHmimlyV9iW5FgInSpkmVvXvmUF4/CVnbMm5F0v6RgNiIGypjSLezGXeOKBzmmf6acQV+2JxtMXct1j1/XDRCAyf3aDA5OUkHOpGd+E7IYp+b1qURa8PNgPtLQC/X7yqw1YZmQB4ucnsBPpnORrvCRyDfwgqBGUmPiMDRgYtOpGNiQaplBwGhw/fCLEtQ+Z5Re8UVJAwtJOxiGxPB7zt9+Le1HjU9VwrrSsFWR7D1sGrbLX1mr018Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DcjJJICF13QlleMB9TTboTYw5ZFMT80D83okJYoZLs=;
 b=kFYb+kHzaUaEqpHP6zpJHS4sxm3Pw6nKgg+bE9mIriokQ38AMUnWyhdkDltLnoLWrEPUM7UQiRkLf1+5DVGXBJkafMflOVE9ML097QWpRlNkazXMnPZKSO16glfNMTPVgALZWizFS9gEsPKLIwoqlTNH/PQwA0r6Kv/gf8rb/OL04N7xhdF6hV8MjzLAsOn/C1JEyGBZATtwZcB40Daf9fe7QA0ABZOssEYDWRkCZioMySLDRe16ROcUBmkIoEB8oGfAB8pmZ+N37YdDSUlmal8WbloHCucfVKDtqyb45br4NUHSsvM74Y3feoDBD5NNBl79SobbHz8y30r2+cEpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DcjJJICF13QlleMB9TTboTYw5ZFMT80D83okJYoZLs=;
 b=nsOPupXei2Hk5j6qn8kEP8rfLFDmGV+l6TgJcRl6Ek3HIjwEvGnZUnyY68IFSBShdeO1z6j3qUU6cFIhycncb2iJAKiD/OwJ1D0kIh4ZSQtg646e6tSR1NjINlNqeTObHdbOycorWr8rET7AlQ70iXhfl50TyJq7uv/JuvqJVfbiFYrEvFf3RyBr9kQAwD57AQXRjPv0SZ9TBsDyXHVI0Q05QGCrn+SIPpWh3DvusUTOH4pn8qfloy/JFWhHUs2DLU+nXc/rGM2DQPVo1f0dod0cJzCAkqx64qwr0LCxkvgbcCXrK3sMe1bHffydchV8T+UPPkoftqvjiLG0EpdCGA==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:45 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:45 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:06 +0200
Subject: [RFC PATCH v2 04/14] kcov: reject enable on multiple dataflow fds
 simultaneously
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
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
 Yeoreum Yun <yeoreum.yun@arm.com>, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=1107;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=XSHe8vY0Ve68XUnibvBYYD9uBYIxECRAW5jYSSDgvdw=;
 b=7BuxcA5kqODHyzk3q5zvlCtXW91Hq/pjdzu81lfJJN13nx58HmFJUwAGdHkzePXC9VfuG8hor
 TlGiJCiWaa8BC5RBIFRJDJHuB/FRov1gQVKNzCLufEgQiZk3OtUFOjb
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GVX0EPF0005F6AB.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::289) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db0e22e-c732-49de-e0d7-08dec7d587e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TinHYOQ6URFbQXH/jiT+fGZYJtTACA/zt6ktbg8m0aD+EY2pjlHx8biZl+GjeTjTRBjTr0+GMb892944Z8WfS8IwAHDUM95LF0TDp+rcdWXj7FBZUhDeY3KudASG9VDpNnm2oEzgLu9ZpofhSc4Przh4FSXM+5dSXuVo//jxxyTjGmniDoRCRZvLi8RF5WvQmdP6g+j/lY8IhCOxEshSyi4hEAmWOIKDEuqXjO8RWyx4yOCwu2VjkjXmYDIyRNaaYCP9PtlTti5C626yk2WNuIP6mmvqmOsIB1GfYGIrFuVelyFR6DOukzwn6eofx19iayESkPyOKQEnB/DD4514i/FGQwIEL9NmwbgmTFXGTFmC+5kuYGgsbyPEqIIZSB20RII8TtzrlDILs5OJMR/xjvMDXsYWzJapauqRVSLmxBZLWb+KJwgapfJKdfFUwuVM5HzWF6lbpXkBMMKsAVSibvWfZJq7lbA6nyVvUi6T8w+DJCF5g/A99swbN9ukldH+uAVV82NJtdqKWKH+OsmArFQMZOb0QbEaDbEqIxqUWamhzVav/iKQNNv6hv5gOnBYgyJN6SNT4X13LLD8xFUVDr3zaH7H/I28inGeHbzqm2IT5JW+rZvrwnXS0KPEy57e/gZxIypsZ/22cfPx1pMofhYGy5CeaAFu4/25vvMM25IYgDQ8Xk53wjBmQkpMTUVp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Um9rSFI4WFgrTkxRZWNlYlRiN0ZkUWowOGFkQkUxMm93MHE5MTZ0WmN6VGlr?=
 =?utf-8?B?elk0MCtQdmZtMmg4RE1DVTI5WStacjFVWHFNdTR4YTArVW8vVC8vckRNdXg1?=
 =?utf-8?B?aTF6YlR0NmhHUDZXUU5ZVXpwOFlONng4bzNqNC9KRW16dTdMMzhoTkUzS0da?=
 =?utf-8?B?RHpUSUFRb09CQStpL0EyaXFjS2NPdlBzUGY3RDNjZVhnZGJWTFM2NW5raGxy?=
 =?utf-8?B?Ni94QnhsdHM2Qm5hS0tQUFFuSFdQVmNoZ1d2TVRnT01HWjJ1Y1BqdG1sM3Bs?=
 =?utf-8?B?OUlKaDQ0bUIvNDVRZzVHOVBzand4cXlRbDRzU005Q1pSWGpDZkhudEp6N2t4?=
 =?utf-8?B?TnlUOEJWb3I4WEZyZVcwM1gyNG1UMCtyQzdDQ0xZaGhscEJpWmo3ME8wWldR?=
 =?utf-8?B?VmJoZzM5U2ZKc2lOUVZzODZmcDdUU0g4ViswSUdmelFBUVNDazE2K0p4anVY?=
 =?utf-8?B?bWhqZHA5YXc5c3ZYUzVTU3ZDM2dsNFNSTTgvTjJrVHNDekVjcldwbGNISW1C?=
 =?utf-8?B?UDhneHc4dWlXcTBxc3A0L2tja0Z5bnNiemE5WnhEV21Lc0FTS0dCQ2gvN3ZE?=
 =?utf-8?B?bmNpNjNuVlpkVjN1RjNFVnJkQW1jaUZXNG5uNVp5V3BDVldGanFWaG10WTJL?=
 =?utf-8?B?eXpoTHNmWFdiblVoMlhjTmlORUtqK3ByYTdXaWlkY3pRTVB2UVZid2lKU2ZP?=
 =?utf-8?B?Nys3T2F5Y3p3ODU3MCt6MmsyOFVxK2ZyTEUyM2tjVGFzRTUxMnNtVVR6VHN1?=
 =?utf-8?B?YjQ5YWVFcHlxYXlJRWgrT3d0b3VCdEd2blEwMDB3eTRxYWIwaXk3OXk3QUpk?=
 =?utf-8?B?a0c4QVZFRXMzN0QydnhxQksveGFlYzJOYXVsL1g5UWJlUFZGUXNYcFZ2QkFR?=
 =?utf-8?B?TUkyN05EaFd0MWYyTUw3Ylh3MXFTaVFiOGs3UWlET0s1R3lRUWZoMzZhMWhK?=
 =?utf-8?B?cDVlelBDc3FQYVhMakVJbXh2dDFUVzlMblFzTm5uSVI0MTdpTkg1Rzd4U2VV?=
 =?utf-8?B?UFJQbTdHZnd0b2R2eVM5QU13N2RlbElHSFFyOTVSNWREenhxWHB5NkljRXh4?=
 =?utf-8?B?cnhIZlRtR1Q4aFFQeWg3ZGZDVmJtYVBFMVJLVTdBS0tnSjBvTnN1citINXlD?=
 =?utf-8?B?VXlFK29oVitBK2RuTkJIbDNwZ1hKZXY5WTBOWUw0VkczZEcrZEtyV0FGaGRa?=
 =?utf-8?B?aUVwbk45SjdvL0xJUkJaQVhTbmRlbWNleHNQRWtuTGg1ZG9CblNlMWV3SWpn?=
 =?utf-8?B?dkhXcStneFBPUWs3UHlPMGVWdUYzeXZFS0xFMWRHTEQwQ0RLVjZyWTh2SmVU?=
 =?utf-8?B?dkg1OGR6YkcxWDFHYXJLb2FUYVd6THBlUlo2Nzl3R2lnY0FOK21PY3FUNmkz?=
 =?utf-8?B?YnpqQkM3WHZiVm9oenR2SFlLbmRUTFlqdm1QYkJqK0xsUHc5dlVjTUtOQjBP?=
 =?utf-8?B?ei9vOUs1eDZuK3k4bjl0b0dMNlZmL3Q4L243NVVWNmE4Z1FzeXNpa01hOFhD?=
 =?utf-8?B?Wk4rZHZGbFpYMmVDTW9iYmx0ZFI2RFFlZUZyNHk4YnZrcEVYWk5sQVBYdlY3?=
 =?utf-8?B?OTNMTzE0c1p2UlBCMTNxRU1BVE9IaVkwMXIvRFl4dks1UVIwQTBva3l1WVlJ?=
 =?utf-8?B?U2YrMnNMQi9WRm1RbkVtMm55U3NlRkRiVXV4MnFUcXVSVmJpemtMUk1ocEhV?=
 =?utf-8?B?M1I2d2tib1dHQWlLa2VNK0FWT0toZFBTbExsVG1QcFAvMkdTcFJkU0gyRUxQ?=
 =?utf-8?B?ODRUdStpdWRvQ0szeXkxek1PbFZFUTBEUDlyZDJIS2RvaEhIZ29Bc24xSUoz?=
 =?utf-8?B?TEhoVFRYUWtoOHp4ZmFwbDZjQnpWSjFvZmN4azBkQWFLME1Zb3MvTW9BQVRH?=
 =?utf-8?B?MEtWVlRlQVRGWDhrcm4zbG5IWWthTDhmanFZaWJ0c1VHMTE0ZkNrSHFTb2Y0?=
 =?utf-8?B?QU56dW5OZEU4czc2bm9FeXhVekY1R1BwWUFNeWUxc1lIWEtCNWloZnlWc3V0?=
 =?utf-8?B?dFZjM0xnUWE4U3cybUQ3bTRpRkpRenF4MUhZNENoZWtaYnpYVC9JNmErdVNK?=
 =?utf-8?B?MFJjbWcwNnprT1B0MVRTc1VBVHRyWDR3TlptbythNXlEOW5pTklRbGdCRHZR?=
 =?utf-8?B?TFdFR3VnL1QxT0k5V3hnaXJNa25ZbXAyWUJ5QURqRzBkVGFYdjhEMjYwUlF3?=
 =?utf-8?B?TTUwdnZTMEY2Zkg1WDRhcFNiN09hTU51UDNrUDR2c0Fxcjh1OWM0NFB0cjR5?=
 =?utf-8?B?eDdWSXZrajJkdllKcTVUUktocFNJZ2xKRWs0ZURwMnJibEpTaDJRZ0tPdStO?=
 =?utf-8?B?N0FTRVpSbnhIWGlVR0FyNWxiN09PMndlenN4YWZ3ZFlBNk9EbEFSZz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db0e22e-c732-49de-e0d7-08dec7d587e0
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:45.6234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfVxmb+5wb98Q/0tZOEsc3HncXupO0r5yXzAxMt+cc8dFkgHew464+34El9Hs7C30FUa6LuC5c95RL8kexPuwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13709-lists,linux-kbuild=lfdr.de];
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
	RCPT_COUNT_GT_50(0.00)[51];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sashiko.dev:url,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13335673754

A task could enable tracing on multiple kcov_dataflow file descriptors,
corrupting the internal tracking state when one is subsequently closed.

Check current->kcov_df_enabled before allowing KCOV_DF_ENABLE and
return -EBUSY if already active. This matches kcov's check of
t->kcov != NULL in the KCOV_ENABLE path.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4%40est.tech
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 kernel/kcov_dataflow.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
index 5248293280d5..27587b8ceeab 100644
--- a/kernel/kcov_dataflow.c
+++ b/kernel/kcov_dataflow.c
@@ -287,8 +287,8 @@ static long kcov_df_ioctl(struct file *filep, unsigned int cmd, unsigned long ar
 		break;
 
 	case KCOV_DF_ENABLE:
-		if (!df->area || df->t) {
-			res = -EINVAL;
+		if (!df->area || df->t || current->kcov_df_enabled) {
+			res = -EBUSY;
 			break;
 		}
 		df->t = current;

-- 
2.43.0


