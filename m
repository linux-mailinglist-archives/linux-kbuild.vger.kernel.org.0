Return-Path: <linux-kbuild+bounces-13708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DXRQBivhKmrYygMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13708-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:24:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3635673747
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:24:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=APusSClx;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13708-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13708-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B74EF3021ED8
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC2B425CE4;
	Thu, 11 Jun 2026 16:21:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D642B75E;
	Thu, 11 Jun 2026 16:21:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194914; cv=fail; b=qF+22bUBKMCbGyJ/9jz/pp7nJ1zgTUAEVgPPlGJt9EnOXH5xw9VXOB67i5mx+WKFCEJHOsaDyr8IaOte8M/OX3GRIG0ZaKyeocZP3NCQ/U9Sbrpim+VJfOev4pE/brUz+7YkXKyzp/qn+6TPuaEWVC9pMD6LyaG2l9QbYOWl/ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194914; c=relaxed/simple;
	bh=DtTK/AwDIMCe6OV/j0JPVlnaNajVItLVDATu96GAQ40=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=B1Z8E3pJvUB+2jug/Q+XYdnSwo3QOJYgrMWNgDDfksb0DHT8OUHgL4PjQ0nlJSHVxc0Q2DP8d4bA+tWUfMS8AGl/2iFqZs4UiJG8QtuP9tHoyObeMDblAgldVrr2oi7hcsmGlJ1KlASV63vb6FOYc3nVOiuzIeERwBc81AiYs30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=APusSClx; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQoCvJn0Yo59gfHHQYI9tTHZcWo4o7hksjj/6o+haDlfCg4OJEYMLiReaX16cYGFrKGtxbXeY2TYyEmUP5RJPW506zdwekdNSbWMo/dmdzZnrXRyZP3wN9Ig8vfHO4hoyRDK6RjKOvg2ctciYV/49Td8qyOMdK+4qJ+fyNDvsyIJsi7Qk27UJ5wuLczn23QLpmofIYtSGvdrr2f+5bjg458f0PO+7n+XSgS2Ms/NOmEjsR+1iYUQRDKTjtB63LKBZfwtcnAqjL6or/GJSAW69i7f8U7R8oSkRT22sWyxpLke/qS2TIouwNcnxP2g8EhCeIDYRX+NcCYhzsnGEkrRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gUwCp5AgFOtQROqvKz+0UcZEedw4/fv9Nv5OBc/iCA=;
 b=qiJk3kGQ2Qm7ta1sbgDdlkjcnItoMLJ7bjr/u1rf2vkS/HH5z04DM+3F0fawV3p+IJt3Bdx9vhKSBbG0jUzDtL+ZYtYm4OnqYG0sJINcGPPrMAeDpmLJi53zvHuL+HMIn7mDW+qYhwcHEA2yaWYFMIf3kIu/zrIfYs/YEnaIlj2BrEJcsKBU2aFDx5blIQlyUtmv/HyxkmefHIBjUnu7S/cY8n6PjrL57g1SfkEoltYsYL37Hq+ocjwQk595/6XojvdKW8q8hc5Rf0Z/kV/WocfLaUU5tPgWjUa4n98zJToB8Dfx0dXIFAU8qJqyJaaMzR5ylCWkj05LzN95+FNExw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4gUwCp5AgFOtQROqvKz+0UcZEedw4/fv9Nv5OBc/iCA=;
 b=APusSClx8BrHI9O0fGbskQhuQhRNqQlik7I7H50CcDq9S9fFk2cu27PbbA4/9yttiR1llYtjfITdIPAftb2ktrYXRw1QyvCd/RlGCQd42KJjNwzvGRvxYa+UGWs+5cAutZgxdXwypWiYTm3EnKEXWWwFYw1s7pXnGVk3QSLOy2AB5z8gyWkzMbj0tCGa1EOQBKh35xB5nCSbCkkt7sVJsjCqbLPH3M56dPgmyXe6xYO/L70yZ7xbzbtP+Wx34cD1GDMZz48sibsRqX/RtluYiBzklhx79TGQZZXXRx+ouONbP8hyNYDFGvt8YsyevN8XbJWUYD36ACSZqnuJfiVfZg==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:44 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:44 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:05 +0200
Subject: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in
 kcov_df_write
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=1194;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=DtTK/AwDIMCe6OV/j0JPVlnaNajVItLVDATu96GAQ40=;
 b=6s4thnbvxtn6G6L9s8cAEalXqwxmJVxfMkv2yjMZhMZC2zLywFqsPTA4LZ6bJUxdqXa9GaJjV
 uoV33ShugW1C4iEe2uRkNob9F+OczQFeFnWF6Oy1aFmItngDpMJZTtC
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GV3PEPF0001DBB5.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::6f4) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0c2c64-c500-4586-17a9-08dec7d586ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4+E/3FCMz5pzjomtdNxEd5uqo1C7kxe2wN687gJ+aULvUy3l2uiz0jpyIZZlwgvGJcmjeujMMmyZ4A1TwJiPG+pcamTDtgPDq2oEWkWYoIsX8pFV+K8VnUtpBP/0uXbnUMvF0swNSkNf9dnOToPvMI21jS+yaJJEvNWOo5J8JL5PVXsRSl1Q4MBYa2zb9htlPKGgrIOZ3SglQP94P4wHspPW8lnTw+CaYhR9eLDlzpGwkNR64Mt67B9tpstP32PEFaL01RMTs6AeIF8PEpA8+63Dks8HJq391tiVk4sotG7hxURJ3phWjMN16cyQRHOGSgslv5PTYp7kXmJ5FW55Mg6XzqMVoniHgpC/bFx+hWwY/Cx+cVkCwCMtD3wZ1CPgsMhQmVcX3jLFE+W8ywxnoIKsWp1o9zcNjzh1ZrFQ0h+QpNaEd+C0T92RmpM4VMrWb3Y7nAxLeB5UDb47chkpCGoP99/gHOl47MhcjsbU3AyojhDHbG1s1LYC8m9ds3nGWdAk/EqbL/tHmQ93EbAzI4FQ4dvtg4u95ueFNq/cOTN6wy1VJcgU+mcGFZYMznHYmGv2dFOzMtWhZZ65J83HLuMGb8Oicep4FS0RkEqU7dMTFtOzhIaNa6g2gjt3VbRm+XfG4k4hdUGbCMzGH0iGrKZdp0bg6XivDjo0Oei7Ffl9Gh/3705ggYv5bjI72O1brTecZNnxCUdWyU4aN0+hLZ3BBR1HM5LPG6wA3cfOlo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlNNS1ZzWm8rYk0zNzQyV3NBMkZZdjhubzRKMU9mbzdhUFBLa1dmYWpYV2pI?=
 =?utf-8?B?TklQaXgza2lFeWFWNDkxajZpekFvNVJOa1ZISjlBUHg3ZlpmODFlRGpKUExj?=
 =?utf-8?B?Q3pmbnNzYnYvMml1YVVTbkozOWM4Tms1VG53dzVoUmExU0xWQVZFSlZ4RDRW?=
 =?utf-8?B?SDFqb1lEK2Y3TVFYYkUrQ0dnSzVUM09wQWpIcWNjYndBLzhjelJUM013RHRW?=
 =?utf-8?B?alhsQjFIYmMraUEvN1diaXA5cmUxUWp2WkpSYlRQK0ZXRG9hV09mejgxa0cv?=
 =?utf-8?B?UnpUV3JBTDF0UEJ1SGgvUEllMVNLY3NpM1FJd1FnM3YxaFkyOUZuNlJuRVVH?=
 =?utf-8?B?MDQ3VnZhMkVyNjMyOU40TmQ2Zjc3cXdjTjJQMXRFNG11Uk9iaXhNQ1hKNUJ0?=
 =?utf-8?B?NFlHaDBIeUgvSzZITHFOcmRPSVRLbmNQQlNvZWxkV0pKNkR6NlB5UkFVZ21k?=
 =?utf-8?B?QkpwN085d09iUzdRWHNXcnZYeXZlampkcVlWNDJBWFk5VUM0d0lTUGZvam5Y?=
 =?utf-8?B?eXhEWjJTSmxBd1JUMldqZHo0a3Q1eTJEenFQMGdqbmRubGhEako2QjhkczJu?=
 =?utf-8?B?Ulh0VTdhRk1hZDE1NWVxbUFjWmZZd0UyRDVobG5FcXVwYjdHcW84MUk5djZV?=
 =?utf-8?B?TnJFVkc2MkVGbmJtMDgzQUtUbWdYbXNqdGwxZnhlL3JhZ2xETm40eFl6aU9Z?=
 =?utf-8?B?L2lFVWRNWVk0NTR1YzBXemNaSWVHaU1nRFVkYUM3czQzOEpRSzhvcEVPRDc3?=
 =?utf-8?B?ZGIrUnU0WTB1dU1RS0hqNDd0ZHpiWWpiazN4djBIYzdTellISjl4Q09maytp?=
 =?utf-8?B?MDhVQUJJaFZ4K3BVbGVVRG1NVkYzZEd6cGxmc2o4NmhCWjU2MUR0dkVyUzJM?=
 =?utf-8?B?V2JCTnNGNEl3aEdua2Q5TW9FU2hMN3paalJyMUVnSk9Od0RwSUJ4cVRQUGVQ?=
 =?utf-8?B?RVBLeStSZmJBMFNEcElBTVpHVUdLNS9qaW55aHYzNzkyOXZTajFuOHhlYTBV?=
 =?utf-8?B?aUNIRys1V29yNlR2U1diRVNzNWxrTlZIUytOMUw2dXFZNDZBNzF0bEtCZGFH?=
 =?utf-8?B?V083amxpbmUwOUJQU2xjM3hDVVo1ZWY1TTg3WnB4dDdWaUFINjlDdkNCSmZV?=
 =?utf-8?B?N2FqZjdwQnl0a3ZXV3RLK0ZCYTlqME51VS9MMllQSXlXNzh1c0VpL2ZMa0t2?=
 =?utf-8?B?Q0MrejVtODFGYmNNcHRRcjJhTkdrdHA1QUVWazRHMHNROU0vcjNVWCtURzcr?=
 =?utf-8?B?UXFvcVhETEZoZFdvdUhCTnphWlp1Mnk1SFNjcW5ua0dndUttakJrSmN6K1pj?=
 =?utf-8?B?OUlkS2pjTXl5ZzdHeDVjVnZuNjhMZXdRZXBHVmx5b1hXNXBoY1ZxWGNnam5k?=
 =?utf-8?B?ZTlnS2oyWFNyRzRrbU1MMXJJNGtqUXdyb3pNRFNlYVZqS0tQMDJHd3g4KzhJ?=
 =?utf-8?B?cSs3WTRtNmhLWXJaeGNNOWdCYkcyZjVmOEVWZ21ZaWNna0tOQjYzd0o1QTJY?=
 =?utf-8?B?R3lwbDZCMjZUU2ZDRUZUMmZhT1hkYkRMNzUxRm56R1UwYXUwZWMwRUVHeHRL?=
 =?utf-8?B?MFB1U3g0YVRvRXo2d09kbFZwR2w5M3ZJY2JaanRVSVBWYnlwWWEwMndzdDZK?=
 =?utf-8?B?bnJvdVFzZEU3YU9lM01JcVlKSUZKSG5oYnZBNUoweXJmd2h6Q1BOems3eHFZ?=
 =?utf-8?B?eWdlbXEzcmxTT0k5R3FlSDJGcWVsV0FOUEswR1FHS25VRGZHRHlnbVFUR2Jv?=
 =?utf-8?B?U1lmZjB5ZStqbU0zbjN6eFl6Mmo5ZGc0S3FueFpCMDNsNitmZkNWdnIwOXUz?=
 =?utf-8?B?ZTZ2bmxVKzloUGpOc2Vpd1EybkozV2ZrbndDUjlkcDhNWDI4NlJ6N0FnNEV3?=
 =?utf-8?B?d0hsTlN5Yyt1WkdkdUw1T2xTZkZ1YndRVHpFTjBoRndoSTVaRm1rTXBybEpu?=
 =?utf-8?B?U2ZEcTFEbVM2czhqZ3JPYTZIOXVtbWIwcW1zdFBNSXprNnN1cGEvK2RYK1Fy?=
 =?utf-8?B?WEVVZ3lkWG5BLzlpVjQvbHR5OGFYUVV2eWRMYzVqRitYR21PYmdTNW5idTVv?=
 =?utf-8?B?Q3RLaFF4ZExXMTkvL3ROK1pHbTV2ODJEVzg4NDVpNzZmS3lvUXR2RmNTVHU0?=
 =?utf-8?B?clVKd3BnT3ppc2lNN3BtZ2l0NHpNL3ZBc0pvOWdWSFZmY1djOVhPdC94M0ow?=
 =?utf-8?B?M3p1bUpuNXVDYWJtUVZqcEgzSWk3RE8zbzg4OEluM2dodWE3SEk2M2VwMFJi?=
 =?utf-8?B?VGVUVFJXOUJ3S3M4alRPS1JFdEl3ZmxFYy91d01OVG9sWDE1aHV3R1RXbUpq?=
 =?utf-8?B?cUg1OHJUa3l3NkJ4MzkyaUZGL0M5Y2JNTFZ1MU9qWFdiaEs1dS9XUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0c2c64-c500-4586-17a9-08dec7d586ff
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:44.1288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1qX/VqvLp0hOuaaRSQ9kFtX/64Miy6C1fD8ab1CUCzPTW9T3YBYAJhbxNHUAiHErzAG+bNBU1x81vVCn2BsMQ==
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
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13708-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,infradead.org:email,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3635673747

The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
copy_from_kernel_nofault() or other called functions are instrumented
with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
can be reordered relative to the function body, making the protection
ineffective under optimization.

Add barrier() after setting the guard and before clearing it, ensuring
the compiler does not move instrumented operations outside the guarded
region.

Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 kernel/kcov_dataflow.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
index df7e8bf70bfa..5248293280d5 100644
--- a/kernel/kcov_dataflow.c
+++ b/kernel/kcov_dataflow.c
@@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
 	if (t->kcov_df_seq & (1U << 31))
 		return;
 	t->kcov_df_seq |= (1U << 31);
+	barrier();
 
 	area = (u64 *)t->kcov_df_area;
 	if (!area)
@@ -147,6 +148,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
 		}
 	}
 out:
+	barrier();
 	t->kcov_df_seq &= ~(1U << 31);
 }
 

-- 
2.43.0


