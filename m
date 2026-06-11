Return-Path: <linux-kbuild+bounces-13710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HzcsKafiKmpNywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13710-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:30:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C06738A9
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:30:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=ilcMrArR;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13710-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13710-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61B683055212
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EF044BC97;
	Thu, 11 Jun 2026 16:21:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77D4418E3;
	Thu, 11 Jun 2026 16:21:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194918; cv=fail; b=lyrp8E7TfSRR4aNl04LenUGBHmNqt2xteXyiUfJYqu2q6bUKrncEZ3RK6Ay2wHK1Z9pdXVTLNz1bcbU1kNWzQKeCPWmN6JFZ720rLxTtSpLMm3lLFGxLpkHetG+V23770LSQrrAoyr+GGsyts574Rz0i6/z5jj29rK0HfBC4df8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194918; c=relaxed/simple;
	bh=7Pnjvi+4epWPTcGltf6A+9evO+71HuRhwFoMz+JJ8u4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZdGOTMrbTVrWkGFcG97PyVlLminmTasxvfNeIlaoeYRjW8BzT3LrU60lGElr8kv2XwXGKcwomFQsgGtSHMpxTdEktCiMRZd4yXPd9WyTvX5y7Pn3NOfOqPpjYnicSJGK0Mk1E/alnNHJPIEbMbW9DbutbOkdd0JsG4Ur2V4fP8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=ilcMrArR; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sPUSiLmdnnmF4p7KurxhLiIlpoOOKazps8Qsyf/vDQYBf7Fhsi3nUnp0ZIQBVns8W7CGTxF4ecZ0+jEm8M0d4lCsjXaL1Kf7Ebq8iDpLa8R4bhLq7RkA6v/8D8IvLkw60D1AQJ3TGupYWSeKHnC7l72UgGjsRebmt67WHU09tx84uBwmxCU2e0qmGEV8wVvo3i1hThCqAT8kt0QdLRtKNyKOdvHieNzrnC/eei+N0bBOxU0O1lroOZWo2UYkWtnOMBJcyCJ+4n0zLV3SbAU5H0XCmvA7uNhWbfYY/uBa4WS14xZwJzMrPfwS7Ls/MbtNUge3yCYHcpFnvkdVYaZGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxXm1zfoVILkxHIifVxL/xkFAYzGxih3eqqVn3MvdQ4=;
 b=KBlTFSQsETSCRw0KBVF/v4y2r+BvnAvNcHKbMS+tkGbdBeZE1cQ3Vm6LZWq80NJEvkDwmk8MqKsGVyzFlRuIJs24XdrZyTqGjqbx/hkwSul3H4XsOQ177QxbPEbb/nnxDHsDF37Co57YMo2gxgFLXG78E3Khh4nBs/5juLKdvRnMo2fymcMR7rVY0Ts4OpuJokIsO2KacS8vf6XnJmngLVeXGLYD22ediEtTZflN5E/KUmO7wmsu0qrz2p08oAegl6qjnhzx+ZrSX+oJCRuFwo+FjGTX+BR55cw14kOmW8fcR+XUrUrEDg9O/u+QgNaWCyJJXpHV/FjNKjPssSMWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxXm1zfoVILkxHIifVxL/xkFAYzGxih3eqqVn3MvdQ4=;
 b=ilcMrArR4JpHouPP9uEVEKKENc40k7IB1BtR1yG46LEXEVPzhHv7+s/i+8ZE/9n0pKH0Zcc8xPjREuexpgI3fP2xpW077l7lWqNltUpwft6GGc/nfxbqfvZo0I9tXNzeAX9S7IY1zdSD85TA5WM8B0csWeJDl9QuR5BTQpFtvZ50cNwRjlMcZmZaEKhN90OY1lZUVTYrRSwKYs5+KA7LA3pYSioTEwvltMMUwghXnrmHchRkTV+0FJWvxCOtJaPR/wfmZ4bBVrMZbWn73OQtrpXCD24Ljnfzp1/6YJS83d+haloq8s14uxSPzWAusqw9fuUQUfVS+QeMMQukcrtJmA==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:47 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:47 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:07 +0200
Subject: [RFC PATCH v2 05/14] kcov: clear dataflow fields on fork
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-5-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=2736;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=7Pnjvi+4epWPTcGltf6A+9evO+71HuRhwFoMz+JJ8u4=;
 b=pLbpk0qjdiVZKeD2Ca6tHX9EMLpu9RrWI1zEV8aYO6XVipohqEbx/UUExmaA7QloCwsOAsuKX
 T3lnj7fq1U3Cfs8tpaB8H8+1URKxmBV4JVCaHxlxKA14GkKP1LGhJ51
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GV2PEPF00023949.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::346) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: cfab93ce-37d6-4df4-8f3b-08dec7d588dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	B0B402cjyaKShVUXVo4Ul1zmIfkfv/9xM2+tASrfx8IV7p7dwrkHAgrRdqN2qqMkBhRuD7rvefeCsnXQlxejB0NgpeoX43AoobR3tuC+j85c5FhLeAQ1Bjwf0QfORXR521S7WeD6OR8tSA/H/X/RlStZEf132gUu0BFs0jX4SUvXet8JZYBNQnH3BLOsSFaJBRd8Hsuw7qZrTxYI9efajz7SxrIfqIOeUv1QJC3EiW2JhOr47qJtLsRmRPFVK/CI/t4B9S9E81fTSc3g46FG5zwxxvJzZn0wATHGAqYIpCE++sJcnw9Nvxx9krhO+IUOIChiiEAAO4cbNPfb9XAzKUBBW2QL/7Y4BLzrn0RYxawcqxPeVGRHTSdLqqD4K/pvFoZwyZeeb+lBsvNcuDLtFd4FBUAJnpUrBx4jXdx9lPsP4nQUotCJo8H5geHNelNVaQlEyzydSV7DVrm2mXnhcErY6YTWS0ExWNcvaWWwcN/CjoZbZV4QAavDLeHBt7sGvwXF38nZaXmMjmNNha56W/0npBsVe/e/uvrTreM+NWZ0i7FUhJ2maMweO2yitOCXE9mE0fznaTxv0ehqrVW4+jpHtOYdVLFjgGSiDM5dMgww4ffn6bI18kEE9p+1YhK4BxdNnwOWkIjk5ADmQBU+EpPs6S9+9CrPekq+fHO/2yar+Rp+HgXMqXUwHq8bQfNw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QytlZzZuOTJ5WFQ0ODFmdUtJWTBPd2ZoR1Z4Sks0MzhFRVNUQWlYYjk4TDdG?=
 =?utf-8?B?OGxoeHpKWk9LUFFOMmM4NVZ1endCQWViWTdiaTFMSHQzNHNxV0xDZTJuSGlo?=
 =?utf-8?B?bW9oWHFUZ1Z0OGx1NFNDWFBNNWxFR0tQNTVMTkkwUGd5SWpwUk1IdGdiVW94?=
 =?utf-8?B?L0xUdE5aU2tOMVlYMWxjY04wc0t4NFYzdzFZUEhpallKVm42bS8yU2dYWmlC?=
 =?utf-8?B?MVAyVzRiRWQ3YVc3ODliSGJYWUYwaG1rRk1GVm9VOGd3U2JvVndVcUN4L1dX?=
 =?utf-8?B?SDczNlJJRGZXQUhFNE16cEdKUjdmS3MrL240bDlDZWF5Q29wUVlOc1pRUmRB?=
 =?utf-8?B?MVNNME9qQ09QaStDOUVELzVveGxQeGRxeHNwRWpMYmVxRkl4eW9KUU9aRENK?=
 =?utf-8?B?TEkwT1pSTnk2bm5pYXJiNm1KWHJzbWMyaEVJSkJBOC82MWhPVkpuTHRYNEp6?=
 =?utf-8?B?MXZxVnpRaGcvMGx6NHFlR2crWmdBK1pBSUh1cU5GSEV4RUF5ZVV4NjBmMnlV?=
 =?utf-8?B?MzJDOUR6Uk45MEFDNTRHVEphMWQ2KzFnK0VnY01EN1NCb0VaNjk2ZmQwdGRP?=
 =?utf-8?B?eTdvRlJIYVFMWmRwNEsyK2phSHdEenRkM2ZNbEFrV3B6eTJUQVRSc3grZk9q?=
 =?utf-8?B?RXJnT2twdDdPUXRvRlIvZmdITS81c0RFRitZYXBLdkZvYlFsVW9raUUwNXYv?=
 =?utf-8?B?cFdFVzd0VDRmSURKY0pJVWpjVmpxWVlxRlU1aWVQVm1lbmF1cDVJT0hCMURi?=
 =?utf-8?B?SDNwaXRBWVAxcEUwOHBpYXRTcGpjOUhzaG9tQ1NZeXlUZHZVa0doUlpMK0pv?=
 =?utf-8?B?YjV6VTNqWGRNeEw1ZFUvSjJPN1hhZ1RaaUZBWTA2WDdMa1RGbWpZaWJKK0xk?=
 =?utf-8?B?aVVuKzM0YnJoRGpMOVM1Y2NjWTJiMnJvOEFkK0pxWEpIOE4yZStPVmJCdXdV?=
 =?utf-8?B?ZWU2V05IeW5zb0o1ai9IbExldU9YcVE3bkNqaTRzRkxVdXIwSGpYZGZFS0dh?=
 =?utf-8?B?bzU0SnY4V2FONjlqOFoxUUpnVEpHNW1HTjR0N3VIVGR6TlpYbVg0dGJrSU00?=
 =?utf-8?B?NWNadXpyRDJHUE1YUVNwL2hjbDZhVXFqRHVHU1VMT1BLbTc3OW5DS1JZME40?=
 =?utf-8?B?ME90YXF6TGpNUGsreWhlTlBadlJPaVB1UnBma0lSb1g5Lzd0aFFLa1ZMZW9R?=
 =?utf-8?B?NEV4UDJDRlY3OHdnYVZ5dGgxMzNCaUNtSEM2RnVnU1hnaC9PZWhYeC9JVHhZ?=
 =?utf-8?B?UjNUZjVwUlF3c2NlQmErY2pYV0xreGk5L200QURHRUxNbzd4U2E2N0Ztb0c5?=
 =?utf-8?B?aHNqM2ZVRklxWS9zaTIyUGtDQy9ZV0FFc2pEenpRNWZvSHpkdXN3ZUNOcVRV?=
 =?utf-8?B?QzIxQm1XY09VdWRLa3hpU2FOQ0JWWDN5NnRwWGt2UmdqT1hYUUViZWlVekhQ?=
 =?utf-8?B?emVVaVdPTHlkczRzMjU3cGYzaXpkRDJMSXdlM3gzUi8xYTNPTzVqLzFhU3Q2?=
 =?utf-8?B?cmY5b3hFbEhENGk1U3ZpYU9DT1lDTy9kdHJDeFFIM2gydTVVakFJcktidWF0?=
 =?utf-8?B?RTVrMThMc2ZOMmtPdm9MQzlRblF1NUNQUDZFL3poYnNROTd2SFlsd1ltZ283?=
 =?utf-8?B?Vy83bkQwbUxubzVCTjliMk1Sa01EYmlseE92VFR5NkdELzFEQ1NCOWF4R2hG?=
 =?utf-8?B?YXdVeDlNQUdORnBNb1NHZkdaMGI3WFdjSTZEY1p4aXoxTU40b2NLUSt0QnFM?=
 =?utf-8?B?Q0ZReHBrTE11UGhZbUdZVlB0UzI5WHFWMEQ2Mk9pRXkwdUEvLzJGZzVCYmpt?=
 =?utf-8?B?Zm5nMTV2WndUMmt4Y1RONVNjaDQwYzJ2WHcvdEV1ak5uR2dLZGJZZTBZaW5L?=
 =?utf-8?B?Z25CY0Z6R1RBSUJGdUtLMUlrK0hiWlNHMGtOSFI5R2J0YnFiSGtCc010V1NX?=
 =?utf-8?B?L2hiYlNJcnNNOEVpc1lSSjJkVmg5aGtiRlU3Rk1qQzlLa0Uva0dEWkRkZ01l?=
 =?utf-8?B?SjhpOFYreHhtSXJnaG1pZm5kSXZ3WkdHL0ZINW03MUFOMUo4c0Z4MVVCT0J4?=
 =?utf-8?B?WFY3cUd0WDNsNlRUQkJuZnlGM2V5ZW5RVW1ZMmZwbEFvUFZYRFVySkpYdU1v?=
 =?utf-8?B?VzVGN3VPdzQ5UFplYzVhek5VcTN0Um1TeVgwcnFhQkFoaERab2FGSDRDQjRk?=
 =?utf-8?B?RHcyTTh5UUdpZmZIdE83ZytiZU5rc2tnenV2QnBGWEoveEJiQW8zTTNJTXpG?=
 =?utf-8?B?Q0FGVFlxTG1panJGQlplbjFzdE1vVHpWcVF4STJrQUJUWkZUanoxbEljM20x?=
 =?utf-8?B?enhSYWhIaUJNTS9VZnlJSlkyblMrK1l5SDVQc0ZQTkM3cXVla0wwQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: cfab93ce-37d6-4df4-8f3b-08dec7d588dc
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:47.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szA00vXzerSXKUzNxJL0A5x42LH6mkZgPQGg66eVyUb9dr05RQctiZlU/01O8Vcyee5Nh1i5b/J9CIEkODt4VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13710-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,sashiko.dev:url,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C6C06738A9

dup_task_struct() copies the parent task_struct byte-for-byte. Without
explicitly clearing the dataflow fields, a forked child inherits the
parent's kcov_df_enabled flag and buffer pointer, leading to two tasks
writing to the same buffer and a potential use-after-free if the parent
closes the trace file.

Add kcov_dataflow_task_init() in kernel/kcov_dataflow.c and call it from
kernel/fork.c alongside kcov_task_init(), matching how kcov_stop() clears
the legacy kcov fields during fork.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4%40est.tech
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 include/linux/kcov.h   |  6 ++++++
 kernel/fork.c          |  1 +
 kernel/kcov_dataflow.c | 10 ++++++++++
 3 files changed, 17 insertions(+)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 895b761b2db1..e9822b02982b 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -28,6 +28,12 @@ enum kcov_mode {
 void kcov_task_init(struct task_struct *t);
 void kcov_task_exit(struct task_struct *t);
 
+#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_RET)
+void kcov_dataflow_task_init(struct task_struct *t);
+#else
+static inline void kcov_dataflow_task_init(struct task_struct *t) {}
+#endif
+
 #define kcov_prepare_switch(t)			\
 do {						\
 	(t)->kcov_mode |= KCOV_IN_CTXSW;	\
diff --git a/kernel/fork.c b/kernel/fork.c
index 892a95214c54..a5741de07979 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -980,6 +980,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 	tsk->worker_private = NULL;
 
 	kcov_task_init(tsk);
+	kcov_dataflow_task_init(tsk);
 	kmsan_task_create(tsk);
 	kmap_local_fork(tsk);
 
diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
index 27587b8ceeab..7cfe2495275a 100644
--- a/kernel/kcov_dataflow.c
+++ b/kernel/kcov_dataflow.c
@@ -32,6 +32,7 @@
 #include <linux/debugfs.h>
 #include <linux/uaccess.h>
 #include <linux/refcount.h>
+#include <linux/kcov.h>
 
 #define KCOV_DF_TYPE_ENTRY	0xE0000000ULL
 #define KCOV_DF_TYPE_RET	0xF0000000ULL
@@ -186,6 +187,15 @@ __sanitizer_cov_trace_ret(u64 pc, u32 ret_size, void *ret_val,
 EXPORT_SYMBOL(__sanitizer_cov_trace_ret);
 #endif
 
+/* Called from kernel/fork.c to clear inherited state. */
+void kcov_dataflow_task_init(struct task_struct *t)
+{
+	t->kcov_df_area = NULL;
+	t->kcov_df_size = 0;
+	t->kcov_df_seq = 0;
+	t->kcov_df_enabled = false;
+}
+
 /* File operations for /sys/kernel/debug/kcov_dataflow */
 
 static int kcov_df_open(struct inode *inode, struct file *filep)

-- 
2.43.0


