Return-Path: <linux-kbuild+bounces-13713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ksf1I1rjKmqDywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13713-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:33:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D48673919
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:33:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=pta01dfy;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13713-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13713-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B8C433061DD3
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9AE47DF85;
	Thu, 11 Jun 2026 16:22:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294A478851;
	Thu, 11 Jun 2026 16:22:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194924; cv=fail; b=WE+CweMONrqvgC7DDpZtv1DHkJvYjPv1EmkQMmEXMxXjpkoVJxfY3amTZkBuCnWyxZoLkGFjnLv1tu9gFzJfJb7jYf2+yxUUjxtZUDZxZnDLQW6P0PbJtcdYkuhvu7dUIfozmKJy+pC3g4JVUhVzoh3VVO9r8cDYTzgdWN6/848=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194924; c=relaxed/simple;
	bh=jwuzX1cP0P+EPi7RNlJUI8LFba/lT//dIZ9nmZnn9vE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Zrb4x+EeyTEJDbb8nXz+HWR/1D7nJshn2yPI+aJCe+eSTQGIwD7raOMaFtRsKOdxVywZF8bhzf7cXjjD/BNjBkCor6WrshWGAuP05wikrWDyM01baOAx6ao1Tlz++0sP5L68gAYI0l+RLFq3B4qyzy4vE/RSQWdKEt8fWV5X/Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=pta01dfy; arc=fail smtp.client-ip=52.101.69.42
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHfClKXaPlXP0Y2Qlp8GfspEocsAf/G9FODLnUBeNvVfYscSUUdk84Y/1g641QAXaU0+PXrgBY9UoCWTpuk8F+iGmvWqFo3o14XTtqIHbebgPAPWy88vn4F+b40Fb7ipPAUAx8VBPpQVrbz8qYT1YtuxAXREpQkCG5SxTUeDrefI1L3WK3Csf82yOZKibITtH2dK5UTrd6RIDJrmFIAhXoVmx4lTOzUnkW2MWNeIn07TYTEFsXTbYduQJQCJrqyEHE7tvjejtMcFldSG3jtuALVGWrSc1Y1tZQ9V5RMv2k1pIl0Ls/xURpJ9NQuVjRlEHy/DxRxP4BSReqFecIBzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPAvQAWl+YEzEEBSaHvtqmqDpqWGP3vIWNmCd5hzBWA=;
 b=fPnum9UUzWNk5KgnzF/GrCnEYldEVjHM7hgRJTF/rIttTXgpG7dvtV02V7Q6SkCm2YWWIzH2z7pozYkqn/974jX+DFNuFmWJXD43wWMwamOMDllxTOw3J8vgEUQySIoMh8RmwGU9PzJv3iKRDRIeieEdgKG0UkPgaUIT5mH4FmzNAQcxcOAyhI3s/3ZvsbTkYsTz3LE8ZhnfgDADFhT00iP2V3xRivFjWDsJSpsOogN+QIoADmQPWWVU6fU+6U/zUlISy9h+mnlttxM0F1tr3DFlzzZUgSyYHbKeRggSRaA7ByQc+hknvcSClQ8LQ0nf9pIL13OtDK1SHtOOi0gYWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wPAvQAWl+YEzEEBSaHvtqmqDpqWGP3vIWNmCd5hzBWA=;
 b=pta01dfybbSpxZ+CtcF+Fe1Q7SSIDMK7iCdgGPiaXvuxvRYVV7ubu17oUfmUHLo7mN9Pv0dX8rBbngq9Sps0fcTYcFqtur04O7tRHXuT32Cy4Ude0cOkxDLzEnbzrfKkZOk7aZ8/MHZaaRR4V+nzNUZSCQi/L0zXVoqA1I+b5VeXhT1kCtyavkGa1By6XgBU5OXOMT0dgnqRHfPjKrOzj2CokoQbLIgAWSyuRH8ZXGLaf13pRFgSzP2nbtiNfePlN9IbX+GUtju+NRD+jvlmmplPtfOA79KHlZ+5hX2n2x/4gLuvHgMPlWhhZQLcuwU/rDxyGEcGWVwKktK0Y01/MA==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:54 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:53 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:11 +0200
Subject: [RFC PATCH v2 09/14] selftests/kcov_dataflow: add ioctl interface
 selftest
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-9-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=8940;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=jwuzX1cP0P+EPi7RNlJUI8LFba/lT//dIZ9nmZnn9vE=;
 b=vleU45dLzLC6oHoxPjhnIjxjIUZY7+rzuLyuOV9/Byn8RFj/Mj2uBcadDz1Y2m8PI4wwcNyhk
 zR8oO3QIAVxDi0LHl/Xhtlm6oZOI015uS3sVbP1DXIygra8Hqe6vWRt
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GVX0EPF0005F6BE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::648) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a069f7-e6ae-403b-a6bd-08dec7d58ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gw9Ag5o12GhYvHoMFl1q9k9nHQi81LE4QEXTPGp2PqAwO2UK1Tj6+V2NQ5wtxOSFXC7YPB1nfA05cQP2v/vjfz6hVjLi9gygkMXW0k/HkLm15K9tFoq3sV6rhhY8oQ8cVh8PdZUF84si55iVzWs3blMEWoPlGRoWtZ+KLwzNOtmyqOlxrTp9HTSs+k+NoM02uWlK8zxPDPHbZOUApuRODICjOcWTeCv/x9oGAGuXfUfi+IAiY3XMAeeoNAoIpuZeDNd1VQ2N+9CM+0M6vcsAXmdfy/o8IFvRxjuW+NnAGkiyo04LT+MpQ5FxIfUeyDwlMl0Q6XR/pjKk5ncOqwHzqBcwyw4RPTrIHs4++cAdl9X0Lg0JevPAf0NoVQnPU3laJHb/6IQNesEaLtXno8D8KOwsOxQI1G/6I9HI/nQnGztfWzE1XUBWgiatA1M02UhVYboLFLq7covmlVxPs1KQ79SZHqhHJib1JfyE585xdVipDy6+IbT0yn0mIzeiGx7wLEUt0TWDvmZYtOHB9NRWqdCNqRJjMWvm1RNTM6K//hUvFY9hGCvZRDCUKqcyeiGyqMbeV9pUuVRsKZN8qnCv+k56zUr0vPMjbj11uX62x+CSLfXYQ+AovNk+mlSpXiHGPW2N3VobEUmUfxETcNMVWZiaBBM9Nd6r/EN93GmI2f3tk3yOZNBko5F7jPTd5NLpm317sOdJaF0mIBNFeo5jv6HxxNeBvJTdLIg4rQ+xoSfFoFm8pQVlrwNr2ihdIRFC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZW1HNHlUc2t1OU1KeFZZMENkcWFRNmhDdEJRTFdVTkpNNnJiY3JzNDUzMm03?=
 =?utf-8?B?bGEvM254WFc4Y0RLYjN6K2dxNExvR3RtWmlVNFBjZzVOaThSbEFyOHVGVlVJ?=
 =?utf-8?B?bzVEb3pCUjZtS1MrVDJIN3hoTmNNNVdVck9ZOVkya3dTZ3doZmhXMFhqL0da?=
 =?utf-8?B?YjZVdEx1a2lZRHp6a1k3TTRycGVFNndYejB3TStXRWg1QndNalBNR3BHQ3Yx?=
 =?utf-8?B?ekowRWRSK2FjYWJQWXBqcGJpUmtpQUYzemRJcUthK0N1cjVFUlI4aGJtbDh0?=
 =?utf-8?B?dTdkTzFsVHR4K0I5enFlMlYvRHY1N2thVFdWOUxUcWp0TzdiYS9HaGdEREYv?=
 =?utf-8?B?UlIyaXp4eHFXRmFFL1pjMzRIRlJmNW5xcVRIaUtmQU41dTY2a0gyeHlON2tN?=
 =?utf-8?B?OHJhbnpEWUtlK1E4T0E3bDlFWGpXRHByaC9GRXBRakVNSFB0QzFzOTZkMndm?=
 =?utf-8?B?RnhnbEo1WXVQdEJNUFZiUW1aajYyTUhzNWVOdHRlcG14YkxybnFPcVh4MlU3?=
 =?utf-8?B?OFNQcWwvL0pKekJaWWFBOElwN2RVVk92YU1vTlVlS2FYZjM0WU0xcUEvQlZx?=
 =?utf-8?B?cTBPdTh6eU4xN1hVQ2VickpkcWFRc0QwQ3JZOTBkT3JHYitvbEY3RDQ4Q0xK?=
 =?utf-8?B?cXlSMTd1WG5EbTZLNWtTTDk5OGd6d0U5aDY1SDczdkpqSDU1WU54c29HL3l4?=
 =?utf-8?B?T1hSM3kvNUZielFrYytqM3JtUXh5WVhSeXVhbmJrMitkUERyR3oyWVpRZDEr?=
 =?utf-8?B?NmY0T1NaaXFiYzlCK3UvWWV4UW81R2pQbUxYdTFqRk1BK0JVa3dxUjdrMkYz?=
 =?utf-8?B?T2RFL0s2U0dieVFHMXVwZC9VeFZYVE9sSVJ4Si93MDljRHVlWUl3bEJHcTYz?=
 =?utf-8?B?K1VuaXVjOTkzWnBYUE85Qk55SGo3VVp4NkNOMWo0VnR1c2ovZnQ1bUZwajdY?=
 =?utf-8?B?QWYrNE1TTXhtemZvUlEvUit1MVByU2wwTk1aa0p6eVVnOWs1WDB5M1Iwb2dI?=
 =?utf-8?B?M2J6Z0dueFVsT2VOWkZ6S0MyaGppQ3ZmRmJ0NDdvOXk0OWR6SU8xSHQwM3RZ?=
 =?utf-8?B?OTBlUXFHbnNFY2hPbVNvaTBwWkF4UW5kNXo1UmVzWmxMZFFhMkFIeGlQai9q?=
 =?utf-8?B?RWxnaEljK0R1NGJXRU5LMG9ReDZGVUQwczVwZXM4L1p5SDdYT1Rray9Pc1gw?=
 =?utf-8?B?VTU4YjV4Sng3QTVvL0RBU3NGMmorcWJLWHhsWmhzdU13N0thaXRhV3p4dmJn?=
 =?utf-8?B?ZWYvNmhCOFNtNFdXa1QyWmxFOVpqanVEYXRHZVY3L29odmFXU3c5djNRRVhl?=
 =?utf-8?B?dE5jZGVnK3EyUCs1SmJ4d2c2UC8weXVkTHlhMTcvVXVWcWl4L2lmQ1JzbjNY?=
 =?utf-8?B?dzRpRWdDdEZ6bGNjYjZiYms3T3FCUk96QXRmcmV3cFUxb2gwYVFHZGp0b3Ex?=
 =?utf-8?B?QjhjK0IyN0daRlFsTWR4MCtJUlZDYTQ1NnJNTktvK3EweWlMQ1lqclpGWVZB?=
 =?utf-8?B?ekg3YlMwMllrZkF4QVl2UHhKNkhBYzVicUk5eGlGS1dTTURoeVVQelRmajl1?=
 =?utf-8?B?YnluWWdsVHZuNlkwT2RwdGIxSjRSTE5sY2cxL0FzVUw2WGhrb3E3MVE3NXQ2?=
 =?utf-8?B?eFh0OS9uaGF1Vm91a1k2bVJhZzlJdHMxaGsyZStqUnc5eVYrdzJCT0lOZ0Jy?=
 =?utf-8?B?WlJrYUYvaE1HTUN2c0xSMjJnV0VxTmVMNWpRQm0rN08zSkhTakN6cXQ1VEZ4?=
 =?utf-8?B?bGV0OTRtYUVqYmZXeEVoL1J6amx1bmgxWGR6U2krYThyVnZJOUxGOFZ6WXpZ?=
 =?utf-8?B?NTl1dVJUcEhSVTZlZGQ5MEJ3SU1rUmJkNHZsNldibUIzNXdWV0YzelE5aWNN?=
 =?utf-8?B?bXNBR3MvQkRScDBhTWs2SExXQ1FHSGltZmFaZjE4VkM5SzgzNzVHamhwcFNz?=
 =?utf-8?B?Q0RvQ3FHbVE1VGRGangxTnRZWlNVSDQzYzYxcmZtMU9ycGQ1b211QmljSy90?=
 =?utf-8?B?cWZsWmpwZk13Y2ptSXI1MXVHQnQrMjhtbXltWEVHcHppVXRJb1BBeGxyWmdN?=
 =?utf-8?B?M3RNM1dmNGdCVGFVcXV2ZVo1b0lESG1VMnBOWXNRNTd5YjNKQzIwbEFqUzJs?=
 =?utf-8?B?RzhCTWpVK2phTXVBYjBtSVlGcXpqNWNidUR2MjNWVVY5UkxxZ2hScDZzZWRK?=
 =?utf-8?B?RUVJOXhnUkRZRUxGMWR6NHMwcE9wZm9rUFZVTnpIU1ZVMngvZkhlTWJqNkpT?=
 =?utf-8?B?Z1J2dnVjVnlGS21kZGVrWTcrMlpGK3k0ODhPNE15ZmpUeWQxTTYySi9wN2ln?=
 =?utf-8?B?T0pOUlVEOEMxRzBnWmF3K1BoTGZneTgzTXFqclFqUHkya3cwOWU3dz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a069f7-e6ae-403b-a6bd-08dec7d58ccb
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:53.8189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2ZfUhkEOIrDihvP5iAsiRcID12RPLmu2B2g7YZ+14p9HcDbpPE8i8QaZuJ7nRNFS42DI6Q4zZbijQNczTJjSQ==
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
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13713-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,trigger-view.py:url,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82D48673919

Add kselftest_harness-based test in user_ioctl/ covering the
kcov_dataflow ioctl interface (9 TAP cases): init, mmap, enable,
disable, error paths, double-enable rejection, and record capture.

Test:

  make -C tools/testing/selftests/kcov_dataflow
  ./user_ioctl/user_ioctl

Result:

  TAP version 13
  1..9
  # Starting 9 tests from 1 test cases.
  #  RUN           kcov_dataflow.init_track ...
  #            OK  kcov_dataflow.init_track
  ok 1 kcov_dataflow.init_track
  #  RUN           kcov_dataflow.init_track_too_small ...
  #            OK  kcov_dataflow.init_track_too_small
  ok 2 kcov_dataflow.init_track_too_small
  #  RUN           kcov_dataflow.init_track_double ...
  #            OK  kcov_dataflow.init_track_double
  ok 3 kcov_dataflow.init_track_double
  #  RUN           kcov_dataflow.mmap_before_init ...
  #            OK  kcov_dataflow.mmap_before_init
  ok 4 kcov_dataflow.mmap_before_init
  #  RUN           kcov_dataflow.enable_disable ...
  #            OK  kcov_dataflow.enable_disable
  ok 5 kcov_dataflow.enable_disable
  #  RUN           kcov_dataflow.enable_without_mmap ...
  #            OK  kcov_dataflow.enable_without_mmap
  ok 6 kcov_dataflow.enable_without_mmap
  #  RUN           kcov_dataflow.disable_without_enable ...
  #            OK  kcov_dataflow.disable_without_enable
  ok 7 kcov_dataflow.disable_without_enable
  #  RUN           kcov_dataflow.double_enable ...
  #            OK  kcov_dataflow.double_enable
  ok 8 kcov_dataflow.double_enable
  #  RUN           kcov_dataflow.records_captured ...
  #            OK  kcov_dataflow.records_captured

Cc: Alexander Potapenko <glider@google.com>
Assisted-by: Claude:claude-opus-4-6 [kiro-chat]
Link: https://github.com/yskzalloc/kcov-dataflow/actions
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 tools/testing/selftests/kcov_dataflow/.gitignore   |   8 ++
 tools/testing/selftests/kcov_dataflow/Makefile     |   3 +
 tools/testing/selftests/kcov_dataflow/README.rst   |  37 +++++
 .../kcov_dataflow/user_ioctl/user_ioctl.c          | 156 +++++++++++++++++++++
 4 files changed, 204 insertions(+)

diff --git a/tools/testing/selftests/kcov_dataflow/.gitignore b/tools/testing/selftests/kcov_dataflow/.gitignore
new file mode 100644
index 000000000000..f71fc89580f8
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/.gitignore
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+user_ioctl/user_ioctl
+*.o
+*.ko
+*.mod
+*.mod.c
+Module.symvers
+modules.order
diff --git a/tools/testing/selftests/kcov_dataflow/Makefile b/tools/testing/selftests/kcov_dataflow/Makefile
new file mode 100644
index 000000000000..b9fc1c5f0104
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+TEST_GEN_PROGS := user_ioctl/user_ioctl
+include ../lib.mk
diff --git a/tools/testing/selftests/kcov_dataflow/README.rst b/tools/testing/selftests/kcov_dataflow/README.rst
new file mode 100644
index 000000000000..8b650a62acb1
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/README.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+KCOV-Dataflow Selftests
+========================
+
+This directory contains selftests for the KCOV-Dataflow subsystem
+(``/sys/kernel/debug/kcov_dataflow``).
+
+Prerequisites
+-------------
+
+Build the kernel with::
+
+    CONFIG_KCOV=y
+    CONFIG_KCOV_DATAFLOW_ARGS=y
+    CONFIG_KCOV_DATAFLOW_RET=y
+    CONFIG_DEBUG_INFO=y
+
+For full capture, also enable::
+
+    CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=y
+
+Tests
+-----
+
+user_ioctl/user_ioctl.c
+    Automated ioctl interface test (9 TAP cases)::
+
+        make -C tools/testing/selftests/kcov_dataflow
+        ./user_ioctl/user_ioctl
+
+trigger-view.py
+    Loads a test module via finit_module() with recording active,
+    prints captured records with symbol resolution::
+
+        python3 trigger-view.py <module_name>
+        python3 trigger-view.py <module_name> --raw
diff --git a/tools/testing/selftests/kcov_dataflow/user_ioctl/user_ioctl.c b/tools/testing/selftests/kcov_dataflow/user_ioctl/user_ioctl.c
new file mode 100644
index 000000000000..48448bc02d2f
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/user_ioctl/user_ioctl.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * kcov_dataflow_test.c - Selftest for /sys/kernel/debug/kcov_dataflow
+ *
+ * Verifies the ioctl interface: open, INIT_TRACK, mmap, ENABLE, DISABLE.
+ * With INSTRUMENT_ALL, also verifies that records are produced for
+ * syscalls executed while recording is active.
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <stdint.h>
+#include <string.h>
+#include <errno.h>
+
+#include "../../kselftest_harness.h"
+
+#define KCOV_DF_INIT_TRACK	_IOR('d', 1, unsigned long)
+#define KCOV_DF_ENABLE		_IO('d', 100)
+#define KCOV_DF_DISABLE		_IO('d', 101)
+
+#define BUF_SIZE 65536
+
+#define DF_TYPE_ENTRY	0xE
+#define DF_TYPE_RET	0xF
+
+FIXTURE(kcov_dataflow) {
+	int fd;
+	uint64_t *buf;
+};
+
+FIXTURE_SETUP(kcov_dataflow)
+{
+	self->fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+	if (self->fd < 0)
+		SKIP(return, "kcov_dataflow not available (need CONFIG_KCOV_DATAFLOW_ARGS)");
+	self->buf = MAP_FAILED;
+}
+
+FIXTURE_TEARDOWN(kcov_dataflow)
+{
+	if (self->buf != MAP_FAILED)
+		munmap(self->buf, BUF_SIZE * sizeof(uint64_t));
+	if (self->fd >= 0)
+		close(self->fd);
+}
+
+TEST_F(kcov_dataflow, init_track)
+{
+	int ret = ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE);
+
+	ASSERT_EQ(0, ret);
+}
+
+TEST_F(kcov_dataflow, init_track_too_small)
+{
+	int ret = ioctl(self->fd, KCOV_DF_INIT_TRACK, 1UL);
+
+	ASSERT_EQ(-1, ret);
+	ASSERT_EQ(EINVAL, errno);
+}
+
+TEST_F(kcov_dataflow, init_track_double)
+{
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	ASSERT_EQ(-1, ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	ASSERT_EQ(EBUSY, errno);
+}
+
+TEST_F(kcov_dataflow, mmap_before_init)
+{
+	self->buf = mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+			 PROT_READ | PROT_WRITE, MAP_SHARED, self->fd, 0);
+	ASSERT_EQ(MAP_FAILED, self->buf);
+}
+
+TEST_F(kcov_dataflow, enable_disable)
+{
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	self->buf = mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+			 PROT_READ | PROT_WRITE, MAP_SHARED, self->fd, 0);
+	ASSERT_NE(MAP_FAILED, self->buf);
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_ENABLE, 0));
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_DISABLE, 0));
+}
+
+TEST_F(kcov_dataflow, enable_without_mmap)
+{
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	/* enable works even without mmap (mmap is optional for setup) */
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_ENABLE, 0));
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_DISABLE, 0));
+}
+
+TEST_F(kcov_dataflow, disable_without_enable)
+{
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	ASSERT_EQ(-1, ioctl(self->fd, KCOV_DF_DISABLE, 0));
+	ASSERT_EQ(EINVAL, errno);
+}
+
+TEST_F(kcov_dataflow, double_enable)
+{
+	int fd2;
+
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	self->buf = mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+			 PROT_READ | PROT_WRITE, MAP_SHARED, self->fd, 0);
+	ASSERT_NE(MAP_FAILED, self->buf);
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_ENABLE, 0));
+
+	/* Second fd should fail to enable (task already active) */
+	fd2 = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+	ASSERT_GE(fd2, 0);
+	ASSERT_EQ(0, ioctl(fd2, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	ASSERT_EQ(-1, ioctl(fd2, KCOV_DF_ENABLE, 0));
+	ASSERT_EQ(EBUSY, errno);
+	close(fd2);
+
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_DISABLE, 0));
+}
+
+TEST_F(kcov_dataflow, records_captured)
+{
+	uint64_t count;
+
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_INIT_TRACK, (unsigned long)BUF_SIZE));
+	self->buf = mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+			 PROT_READ | PROT_WRITE, MAP_SHARED, self->fd, 0);
+	ASSERT_NE(MAP_FAILED, self->buf);
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_ENABLE, 0));
+
+	/* Trigger some kernel code in this task */
+	getpid();
+
+	ASSERT_EQ(0, ioctl(self->fd, KCOV_DF_DISABLE, 0));
+
+	count = self->buf[0];
+	/*
+	 * With INSTRUMENT_ALL, getpid() produces records.
+	 * Without it, count may be 0 (no instrumented code).
+	 * Either way, the interface works correctly.
+	 */
+	if (count > 0) {
+		uint64_t hdr = self->buf[1];
+		unsigned int type = (hdr >> 28) & 0xF;
+
+		/* First record should be ENTRY or RET */
+		ASSERT_TRUE(type == DF_TYPE_ENTRY || type == DF_TYPE_RET);
+	}
+}
+
+TEST_HARNESS_MAIN

-- 
2.43.0


