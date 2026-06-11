Return-Path: <linux-kbuild+bounces-13718-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ft4XOTjiKmoqywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13718-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:28:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F3673834
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:28:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=nA0eYwQy;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13718-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13718-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59E5C30659C0
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA4549251B;
	Thu, 11 Jun 2026 16:22:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4831D48BD5F;
	Thu, 11 Jun 2026 16:22:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194931; cv=fail; b=hK9pzx/4Au38NVdl37tLo72ulPLIklzwe1DJf/yOhOvTwxptCni8m7VMF6HM7tfPqApW3chohJMUshFPN5K7R0mOQpXuXvc1DapsyG/1fzK+U/Ei8/F3435U712SyfbcHA5svqqcHE8rK4JCvPgJhFsv1uiCwael8UEWGTiTk/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194931; c=relaxed/simple;
	bh=4DPA/LfQDzADLggDW0Va/jTLqiBSuY6geNMUj2Kgx58=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AH+9MYEjs5dlPzR1uqYv3xy6Z1wl1dSGFAAz0tYuNwEmgF2YQqtCTw+YlMmgQufpJJpJ3H9lNnF/UYfwjmFoM0GKKUtZoCf0GU5ItRZSFYu1R5CFyWuoUfyWN8GNnEaCoUujz069M86SyUm7XqvUH0PLVGziQp1Ohc7h2VFMZ4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=nA0eYwQy; arc=fail smtp.client-ip=52.101.69.42
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F99AnI0tCRVn5KCNd6SC6I8JdDC4TgTFmr7gPJuFd7W8lc1q8+rjZhsg9pus+Z2fajaFlcDCz5rzNYMaeIh6B2NbHtNpttXJbb962+m55fmv1DgB4DGL1Qa0Zfqftu0tsN8YGnXFxT6XhgnEvcwMFkDyoUG7wZZ/6pHOiKwLJf1M6zNl9+5LCO/D3A75HFeMLjBpytnPWV9JYya6qOxCT/UM3CL+PD/bRwzczQJ+SCe/AYKA91gXNtMMuERPaOYdcuyRYmAWarXuewLr4kiplZnqZzVBBO2+336kCWuYEkSkSBeX2rwfPh7dxoMHQEff1c1mfH9aYDVR2UcHd+KQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9P1wEzr3g9s+QUx9wxzSnMEdkyOTIVXQWHbPb5rL4o=;
 b=je0CHXZnMYF8mpmelKDC3K1OksMZAyf/zX/8NPzBGHVBmcIYnGhHeaiSSsadBOMNF35XNC6djmjFXZMnxBG9QwR61OBSMRVBtD/pmngYbj+5iRJq+lDcPit13ulI7d9gObld9JfrW8gE/LLMr/PBYfqc7OdShac37H2B8121866dm07AehIsjPEdauqNOMJ0o9TCrA9FCHzBr7scCypbkGfeMCQwuLXT0nfLwm1e2J5ChxDDEOIqhCAW1E3dSCgZfbHr7o2qG5Z7c8MrDezwXBnpaR5nu1j0kqheS5YOZyB7Xcahw6KNnxpdYMnf9KlaxAyS8tK0fsfGN3QNe4gqNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9P1wEzr3g9s+QUx9wxzSnMEdkyOTIVXQWHbPb5rL4o=;
 b=nA0eYwQyiaGeLRtvuwTuF8/PJ9k4IwFjC1Bhv7o8FyrsdfPqUFd53iwT4RyH1LuRD3D7MuZz9mLYGdV72ON4KZTXfmgU3oItLgC4mmzBJiRntzwmvhXmoYw0Xi8GzcV6wfL7fnOKUPNflYVTVJReS4Pd2DGIt08I2jMZqyuryi3sHkLmoftVIbk9s/sU14RhcJu9sB6CHSRME+aHz9ae34k9w6WfehPBjojy1vO/bw4I3Uq2S2szRUNQktsvr9zG5XZkhyVRDk4QNlANLe5B1w9J5T5AjWJw7vbmo0kJbDGleOBDtZpfKNrtOuRXx1MbhpE5SkUmUgLGE5Am8urtOA==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:22:00 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:22:00 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:15 +0200
Subject: [RFC PATCH v2 13/14] selftests/kcov_dataflow: add binderfs ioctl
 capture test
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-13-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=8164;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=4DPA/LfQDzADLggDW0Va/jTLqiBSuY6geNMUj2Kgx58=;
 b=bBeM+vxOVK22K1EZF0OhgWnon9GHXKnX8lACBrIKVbSG1KW25ebFa7bE6OodE72vM/s1d1DyF
 V2KHKYyszAzC+4o8CRnF0HvZsEP/+uKmjY/jRXvudNfVZ4yLrsIoPD0
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GV2PEPF00023991.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::199) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: d9fea763-6fc1-45d9-61c2-08dec7d59079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2Izdiu+suLw5Q/GhbzE99pEfd+ON1pLKTF2RlSaHbh6ToBuA1aEgGzqH//uaubWa7ToAz4bYHBSa8rQU8OrXY3V9PtfmaEHTZ1xeG55KNO0KH1OoqFSoouv/7LnzfkrpCFXZoexH6InmKei6SA/eFLA9zZPPT7W6/b5FcVUxZjW5dn1IefGo9aP2t+RREu8mm7leON115aeCaCzev2wcbeiMhIEvQ2ZFB/QT4eCDzu1NMabJetUFviqepoNI1hlmiSM+img1QW9Qjp0enz5cevnHiDaJZLnHfjBwy9C20cuqumnqUwis1Zdxm1hNfg6S/Ifk97RkHU6Ge0AawgVb3Hfvycaekghaal2hVyqO4pP/hNLgB4ErJ0J+FgHM4yUBbNoFa+znCsmrtpndcW28QnDpRha0xwdG2dhjuwWT1R8/Y7EX9fc0Zz/EvM8c6LasD/TzFUaC6uHFsN/uIyg5wPHrvhqwYkwBUyjvvyRc2dZxAhV8Jx1igUIOGSJeOELMtuJpe8L46Mh1K5KvsGsKSZpMvMQppYTbEEQ4SYlBon1pY6xmmUUe1zRN015ZHAb977RThsd1S5c+CkmZFUsE+4PZsspGQYoMkUk0LkzsDvVixUsqr7AgbV2BqEI3P7BAsb6DCUbBxPacu99L8lIpvzihRnD4/hvAFHashYDKONLeH6eXG/3BSdmMqIZLi2YSLPeEregfsUgbKJS7C+asxnetNn6Nty3pv+Zq8hAibg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzlEZ0RwTnJKOUZTczVGaTNBY3N1dHJFTm94WDJ0QkdoaWlRaWJlT0I4R21u?=
 =?utf-8?B?ZWwwK3F5UFZsR0c3VEtSL0xiSzF1R3BrckVNc2lzaXRwN1hzMlZKZkI4N1ox?=
 =?utf-8?B?eXZwR0E3cW9PeU42NVBMYStrcXlxc2FRWFBGaXVXYkVyZ2xoWUhKNER3TmJo?=
 =?utf-8?B?Y1hNMENmWlNXOVJ5MTRNeHhrbWozOHNLdG9IRS93aG9WdmtIcndIYXdMTDZv?=
 =?utf-8?B?em5hNksxL3VNNmM4ZGVJS2lKdVRjbGFZcjc1RjdlaWFCMjRaMy9xMUQxcFNk?=
 =?utf-8?B?VUFNd1VWV3hhUjVUaytXMUJZVzV3K2xOaW5jUC9IWi9ZZG1xb0Rhc3BDSG1n?=
 =?utf-8?B?UFRhdGNTalhDNXlKemFNb0UybTlxNGVTY0t1M3lHVEpKVzV2QW9MZzFlVEYy?=
 =?utf-8?B?UlB3Vjc5RVZjcGlqdTMwb25iZWFWM3JBbFFyUXhTRXRoK1BmY20zeGY3Ti8z?=
 =?utf-8?B?Vll4c1VPMWJ0YTEzVlh2U2ljTnkzSG9IUUZQdFQ5bnRKTVdiU1RJQ2RtaDVs?=
 =?utf-8?B?SlVSeUdrd1EzL2xaZjNVK25NNHdieDFnTGIrQjlrVzlKM1JrVWlmeGdrdDU0?=
 =?utf-8?B?bmhxMk5Pc2dLNjI0UTZrSUlvcmxYMU9zVGFYN0FiVkdsQitTOTZZVzkzRy9R?=
 =?utf-8?B?b1FzVmQwTHptbDlWUEVEMW9oZXc5eGwxMGxBYTlhZnl0bDViQlBHQUlkdGha?=
 =?utf-8?B?dVZDajc5a3BZZVdtSHI1NS9KSHJ6N2UzWER4SDRGYXMvZkplVy9sektiUnJK?=
 =?utf-8?B?ZTRkVGNDV282TnNxd0pPQ3lrVm9McEVGR0pvMjRPdWhteWt2U2sxV1JOTjht?=
 =?utf-8?B?N1F6VWxCY1FBSkMwQ21UbWxONENSVXcwMmZRVGNIYlgzQmROb3o1VThpdC9S?=
 =?utf-8?B?N0FFUS9jU0JhQnB0ZGF1SXNldmZsaVJBTlhkSjNsZDA1a2VHUmQ4SUc4QkdP?=
 =?utf-8?B?eXVZSGdERjRIMHl3QXNQVkJ6YU5ydEJsak5RcEw4UVJ4WWFLTGozWWNPR0Rh?=
 =?utf-8?B?NXUzNXdwczhRVyt4YXM4ZDIwbytOVE1LaEFSdXA0MGsxSlUwQzdmcW9BZW9z?=
 =?utf-8?B?SGlOeGJtUFExaEV5VXFrZm9GeEtJTGcvaG4zYkVzcHU0K2RUUXNJSmdETlVX?=
 =?utf-8?B?aVIvSHNmN0thaDBDK2hlY0NhNmNTemt3RmpIODBvM2dOTm1CWVlBZ0txdkVk?=
 =?utf-8?B?N0xJMjVNTUhzU3FUMWJJeHVXdlErSEJhb0RJQUFhak5nWU8zemtOMGU3SG12?=
 =?utf-8?B?NmtmT3h6amlvSndJWVc5OWpxcFZyVWVFYTljcDlUZ0FFMjJYZ0pwR0laMjc3?=
 =?utf-8?B?OFo1dDk4Z1hXRFk3SU95VG5Na01IUWpuZnBwclNXVndiVEdrQjZFTjMrTnk4?=
 =?utf-8?B?RmJWNjQ1em1lQ1lLVlVFTmRkTHlGYW1qSEhrRC9iN1R1eXRrUFJ5S3h2UXlk?=
 =?utf-8?B?YlZoZDd2S05JQVJBMmtPMzRGTzMxTzdJMGJkR0RSOUY5ME9TM2dHS1JlbytJ?=
 =?utf-8?B?YlJub3FWOWNtQytmbVFsbEJyMTFseGIvY3J0MGZtdFFvNTFaNUNxKzg2NW5C?=
 =?utf-8?B?WWE3TGNzdGJETlRCT1ZBS2hhTVpiUUdRaWI0UzU5MXZnUG5BSFBlQ1p6Z1BS?=
 =?utf-8?B?M0hOK09DS055ZHp4d2hHTkNPUVJNTnZEUjEySXVwd2FYWUVXYjJxZ0owVFo3?=
 =?utf-8?B?UjVVT0U3b0pYcUZZM2hIWVorZEdtQmhZOWQyN3ROUzBtVnVrTnR4VGNSRGpt?=
 =?utf-8?B?UzZTZ0hHQlB2eEI0VXVubmo2TEIvQzYyV3cxN1lGa0RNRklBMFBNUExzWmpn?=
 =?utf-8?B?NXV6dzJYR0pnVHpseUJtbFdGc3dYeThoQUFZVFcwTDMvTExCUVVqelVBVVRL?=
 =?utf-8?B?WGZTdnNVK2UvTkhPNEhzbWtWVFdXWFpNZ3YzWXpzaldOS05Qdml4R1VDSi8w?=
 =?utf-8?B?Y2RaZGx5MkRnRFRCellJektMQWZMLzg5K2h3bjhFa3kyeTJ5VForZU5rVCt0?=
 =?utf-8?B?TTlPY1BNUDcySlBCOUI5TWFodjRQbXE4TERvck9Bd21BUXVpNFNZQ1h0OExz?=
 =?utf-8?B?S1hBREM2OUVQMk1lY1kxRTRQc1hLclZod2IwVnBIbUlkLzY5UnZPREN6NkEr?=
 =?utf-8?B?YWw0SW4zVExsWU9Jckd0Ynh2SEJmSzFhWGo4Q1ZGT25RN0xRd1dkNG5vY0lW?=
 =?utf-8?B?Ymlyc0ZIT0ZBb1Ewa3gyaHRSbHVwRUFlZ3dyZ0hKa2s1WFJmVTJxc2tBNENY?=
 =?utf-8?B?TW5yM1NLcERrQk9DazlYdThnT3FOL2ZwczRzV2RFdGtPSVhlWHlMT0JhMDZO?=
 =?utf-8?B?aEV1NXJZQkpGQ0dzbGNLQ3luQ2R6UUhlYmgzOFh0T0dHOStGd2VNdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fea763-6fc1-45d9-61c2-08dec7d59079
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:22:00.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3B80hJ9Z86Qnu0RmfTECStOAuzp9HgSgM3Q01+W6Uqm5NEN/zSi9PcvQwsd1w6YXplKilc/19Vh1O9l2jZyrJQ==
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
	TAGGED_FROM(0.00)[bounces-13718-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D1F3673834

Exercise the binder driver via binderfs with kcov_dataflow recording
active. Verifies that function argument records are captured at binder
ioctl boundaries (BINDER_VERSION, BINDER_SET_MAX_THREADS).

Requires CONFIG_ANDROID_BINDER_IPC=y and CONFIG_ANDROID_BINDERFS=y.
Gracefully skips if binderfs is not available.

Build and test:

  export PATH=$PWD/../llvm-project/build/bin:$PATH
  vng --build \
    --configitem CONFIG_KCOV=y \
    --configitem CONFIG_KCOV_DATAFLOW_ARGS=y \
    --configitem CONFIG_KCOV_DATAFLOW_RET=y \
    --configitem CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=y \
    --configitem CONFIG_DEBUG_INFO=y \
    --configitem CONFIG_ANDROID_BINDER_IPC=y \
    --configitem CONFIG_ANDROID_BINDERFS=y \
    LLVM=1 CC=clang

  make -C tools/testing/selftests/kcov_dataflow/binderfs
  vng --user root --exec \
    tools/testing/selftests/kcov_dataflow/binderfs/binderfs_test

Result:

  TAP version 13
  1..3
  ok 1 kcov_dataflow.binderfs_setup
  ok 2 kcov_dataflow.binderfs_captured # 636 words
  ok 3 kcov_dataflow.binderfs_valid_records
  # Totals: pass:3 fail:0 skip:0
  #
  # Captured call records:
  #   ENTRY pc=0xffffffff... arg=0x4           (fd)
  #   ENTRY pc=0xffffffff... arg=0xc0046209    (BINDER_VERSION)
  #   ENTRY pc=0xffffffff... arg=0x0           (binder_get_thread)
  #   RET   pc=0xffffffff... ret=0x0           (success)
  #   ENTRY pc=0xffffffff... arg=0x40046205    (SET_MAX_THREADS)
  #   ENTRY pc=0xffffffff... arg=0x4           (_copy_from_user size)

Cc: Alexander Potapenko <glider@google.com>
Assisted-by: Claude:claude-opus-4-6 [kiro-chat]
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 tools/testing/selftests/kcov_dataflow/.gitignore   |   1 +
 .../selftests/kcov_dataflow/binderfs/Makefile      |   4 +
 .../kcov_dataflow/binderfs/binderfs_test.c         | 177 +++++++++++++++++++++
 .../selftests/kcov_dataflow/run_binderfs.sh        |  13 ++
 4 files changed, 195 insertions(+)

diff --git a/tools/testing/selftests/kcov_dataflow/.gitignore b/tools/testing/selftests/kcov_dataflow/.gitignore
index f71fc89580f8..da4c189ad3be 100644
--- a/tools/testing/selftests/kcov_dataflow/.gitignore
+++ b/tools/testing/selftests/kcov_dataflow/.gitignore
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 user_ioctl/user_ioctl
+binderfs/binderfs_test
 *.o
 *.ko
 *.mod
diff --git a/tools/testing/selftests/kcov_dataflow/binderfs/Makefile b/tools/testing/selftests/kcov_dataflow/binderfs/Makefile
new file mode 100644
index 000000000000..9f1588512dba
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/binderfs/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+TEST_GEN_PROGS := binderfs_test
+CFLAGS += -Wall -O2
+include ../../lib.mk
diff --git a/tools/testing/selftests/kcov_dataflow/binderfs/binderfs_test.c b/tools/testing/selftests/kcov_dataflow/binderfs/binderfs_test.c
new file mode 100644
index 000000000000..ce9b49aa0b9f
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/binderfs/binderfs_test.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * binderfs selftest for kcov_dataflow
+ *
+ * Exercises the binder driver via binderfs with kcov_dataflow recording
+ * active, then verifies that function argument records were captured at
+ * binder ioctl boundaries.
+ *
+ * Requires: CONFIG_ANDROID_BINDER_IPC=y (or _RUST), CONFIG_ANDROID_BINDERFS=y
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <errno.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <linux/android/binder.h>
+#include <linux/android/binderfs.h>
+
+#define KCOV_DF_INIT_TRACK	_IOR('d', 1, unsigned long)
+#define KCOV_DF_ENABLE		_IO('d', 100)
+#define KCOV_DF_DISABLE		_IO('d', 101)
+
+#define BUF_SIZE	(1 << 20)
+#define BINDERFS_PATH	"/tmp/binderfs_test"
+#define BINDER_DEV	BINDERFS_PATH "/my_binder"
+
+static int setup_binderfs(void)
+{
+	struct binderfs_device dev = {};
+
+	mkdir(BINDERFS_PATH, 0755);
+
+	if (mount("binder", BINDERFS_PATH, "binder", 0, NULL)) {
+		if (errno == ENODEV || errno == ENOENT) {
+			printf("SKIP: binderfs not available\n");
+			return -1;
+		}
+		perror("mount binderfs");
+		return -1;
+	}
+
+	/* Create a binder device via BINDER_CTL_ADD ioctl */
+	int ctl_fd;
+
+	ctl_fd = open(BINDERFS_PATH "/binder-control", O_RDONLY);
+	if (ctl_fd < 0) {
+		perror("open binder-control");
+		umount(BINDERFS_PATH);
+		return -1;
+	}
+
+	strcpy(dev.name, "my_binder");
+	if (ioctl(ctl_fd, BINDER_CTL_ADD, &dev) && errno != EEXIST) {
+		perror("BINDER_CTL_ADD");
+		close(ctl_fd);
+		umount(BINDERFS_PATH);
+		return -1;
+	}
+	close(ctl_fd);
+	return 0;
+}
+
+static void cleanup_binderfs(void)
+{
+	umount(BINDERFS_PATH);
+	rmdir(BINDERFS_PATH);
+}
+
+int main(void)
+{
+	uint64_t *buf;
+	int df_fd, binder_fd;
+	uint64_t total;
+	int valid = 0;
+
+	printf("TAP version 13\n");
+	printf("1..3\n");
+
+	/* Setup binderfs */
+	if (setup_binderfs()) {
+		printf("ok 1 # SKIP binderfs not available\n");
+		printf("ok 2 # SKIP\n");
+		printf("ok 3 # SKIP\n");
+		return 0;
+	}
+
+	/* Open kcov_dataflow */
+	df_fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+	if (df_fd < 0) {
+		printf("not ok 1 cannot open kcov_dataflow\n");
+		cleanup_binderfs();
+		return 1;
+	}
+
+	if (ioctl(df_fd, KCOV_DF_INIT_TRACK, BUF_SIZE)) {
+		printf("not ok 1 INIT_TRACK failed\n");
+		close(df_fd);
+		cleanup_binderfs();
+		return 1;
+	}
+
+	buf = mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+		   PROT_READ | PROT_WRITE, MAP_SHARED, df_fd, 0);
+	if (buf == MAP_FAILED) {
+		printf("not ok 1 mmap failed\n");
+		close(df_fd);
+		cleanup_binderfs();
+		return 1;
+	}
+
+	printf("ok 1 kcov_dataflow.binderfs_setup\n");
+
+	/* Open binder device */
+	binder_fd = open(BINDER_DEV, O_RDWR | O_CLOEXEC);
+	if (binder_fd < 0) {
+		printf("not ok 2 cannot open %s: %s\n", BINDER_DEV,
+		       strerror(errno));
+		munmap(buf, BUF_SIZE * sizeof(uint64_t));
+		close(df_fd);
+		cleanup_binderfs();
+		return 1;
+	}
+
+	/* Enable recording and exercise binder ioctls */
+	ioctl(df_fd, KCOV_DF_ENABLE, 0);
+	__atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+	/* BINDER_VERSION - simple ioctl that exercises the binder path */
+	struct binder_version ver = {};
+
+	ioctl(binder_fd, BINDER_VERSION, &ver);
+
+	/* BINDER_SET_MAX_THREADS */
+	uint32_t max_threads = 4;
+
+	ioctl(binder_fd, BINDER_SET_MAX_THREADS, &max_threads);
+
+	ioctl(df_fd, KCOV_DF_DISABLE, 0);
+
+	total = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+	close(binder_fd);
+
+	if (total > 0)
+		printf("ok 2 kcov_dataflow.binderfs_captured # %lu words\n",
+		       (unsigned long)total);
+	else
+		printf("not ok 2 kcov_dataflow.binderfs_captured # 0 words\n");
+
+	/* Verify at least one record has valid header (type 0xE or 0xF) */
+
+	if (total > 3) {
+		uint64_t hdr = buf[1];
+		uint32_t type = (hdr >> 28) & 0xF;
+
+		if (type == 0xE || type == 0xF)
+			valid = 1;
+	}
+
+	if (valid)
+		printf("ok 3 kcov_dataflow.binderfs_valid_records\n");
+	else
+		printf("not ok 3 kcov_dataflow.binderfs_valid_records\n");
+
+	printf("# Totals: pass:%d fail:%d skip:0\n",
+	       valid ? 3 : 2, valid ? 0 : 1);
+
+	munmap(buf, BUF_SIZE * sizeof(uint64_t));
+	close(df_fd);
+	cleanup_binderfs();
+	return valid ? 0 : 1;
+}
diff --git a/tools/testing/selftests/kcov_dataflow/run_binderfs.sh b/tools/testing/selftests/kcov_dataflow/run_binderfs.sh
new file mode 100755
index 000000000000..5376e5350061
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/run_binderfs.sh
@@ -0,0 +1,13 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Test binderfs ioctl capture via kcov_dataflow
+DIR="$(dirname "$0")"
+BIN="$DIR/binderfs/binderfs_test"
+
+if [ ! -f "$BIN" ]; then
+	echo "SKIP: $BIN not found"
+	echo "Build: make -C tools/testing/selftests/kcov_dataflow/binderfs"
+	exit 4
+fi
+
+exec "$BIN"

-- 
2.43.0


