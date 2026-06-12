Return-Path: <linux-kbuild+bounces-13722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ah67DXm0K2rnCAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13722-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:25:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F06267734E
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:25:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=TdMh7g7F;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13722-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13722-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EDE530BF76E
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 07:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34B93D8135;
	Fri, 12 Jun 2026 07:25:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229983932DA;
	Fri, 12 Jun 2026 07:25:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249142; cv=fail; b=VZxIYXpi3A35AMJBnRd3u4L7nuspjjMLC1o4m1ASEoIA8zvnaA+rSdtz48wiaHKyUeneoSo0q/Tu+JmTMUNNlw/ds3NnVkrD2l2hE73NfZLe5SVg4/8zNdnz5CEJvZSEGDbl9T9I9LgOFOlgDsewi9jN9J5rS0RiQ6feAwrBT8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249142; c=relaxed/simple;
	bh=08ySdj7ugZodcRAzxzy5t5CPWzHP6k9Ee9XDReS0GOo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U4cQG/ycqEcbS+/G9wYWEEcC+9H891Qlt7pinUAdAim5p3Z/TxLZmpywMZsPBWMcvp5l4Smbsquv2gKecFxXe2U8fIrhCuMNC1G/PU3d8FNtbQAUErUja40LpOE/YNVrhqb3FXYeNThIb5i8pL5v8kyuuScP1fKwY+VsMMpg7U4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=TdMh7g7F; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzBVklcJJK8xwe1jgmpP/qw4A0eI8Ojydpjw9OlFaSeCY01M759HRIFwsUXXh1hwzs/HuilSU20I1I80KJPzbG3GkLrNO2oHKFdid2jzUgqXoeY1Dpygal7P804h8WwdsXe+EkGQxwaYYrHAAtU0TBiCyfTGJfnrP0ITRc/+5b+meBAjQUOQuZ/+ZmDcztu9t9Zoet64k72nbu59UytsOSwC8RIYXLSJHms9XQUaIOeu5+nj/une7854sp8129DxD7mxDXM+BoPYUKMPtb6CgG1Ktbh4rmZWAzvWclfu+SpADzIvroEGRlBmzq+Pk+rStrVgitfZlqEzCkx8GCH8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZ6zLbpasBSAFDksbflrBfGNYz6Ch8g0O5luPLqhreI=;
 b=SwQMQeYt3ryQjjLRMblstKwnWV/S+xLXbEm0QQciQs+34s4PgAIgLcL9GCNuDnJ0wQblVAhQFDyomIFPdtvWUGhpM+PJNpQS8l2UB3XZP2GWRfu+al9MOtB6/jLiaHNvdPxYNZ849CEPgVvlYEGGPLQuOtPwAqw5MaC5Bog9+8ChBLT4W9rw5CmtvB9q0UktKkEJHSBp+G+ut5VRWjvt5FLV3MA/fQhmmT1vW46F6iTDTgGYQFAY1U8ecgy+C2QPsQVrXiQ6bLYjDNA19otvb4wqHG2hBrLizhweY66JGdlTQJLAH/U5fI4oOEf3cAuX2Lb7SRocCM/uPGWli23i3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZ6zLbpasBSAFDksbflrBfGNYz6Ch8g0O5luPLqhreI=;
 b=TdMh7g7FKvHlyiz/HJC9+rbuFnyz3x6DhdyphKzO/gIOToDFvfjQuJIzfiI4q+fvi8i8MGh25kR8Ui75cjrRw3br/WK1IDD+K4zchNT2HuzAzySH+X+ZEvVwy6k/SWkGb0uRUCdSRRKO9NAFmdCS/2PXwBrqZEjxng6Zc0GksFi0P2VJ4cyXre961ZH7Zuq8prvwsMqSgWNtmW08OQBN6Lrrxsyq/TssFkhGobJTz4w+vIqVTFABK1slJxS4Y6A5VYX2VV16IlpZgvu0YZlX+kTLbsIDD/9fTB/OFwp+OoZa0ZnbjSGWgVI2qmRL7UE6NiFFcVnwybUH06um0TfszA==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DU0P189MB2475.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:423::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Fri, 12 Jun
 2026 07:25:36 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 07:25:36 +0000
Message-ID: <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
Date: Fri, 12 Jun 2026 09:25:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Alexander Potapenko <glider@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
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
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>,
 sashiko-bot <sashiko-bot@kernel.org>
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
 <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV2PEPF0001A333.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::68e) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DU0P189MB2475:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d591984-178d-4d83-04c0-08dec853cbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z2fIeGHVYHEBExwAe1TX2b6iOk93HjxpyOk4dahmbyIPGPQHm6xOan66KWiQn1BSgOlj6vmMxejTrnTaMwVEjaZgpgrmSlhrm/mJDT5Y/XWWzlPXP5ByqiqiCFYhDsu/2SqSQQFJGq2bsLiU2xxaxEbzLPxpKus8buZEIx2LS8q0hsAkrg5dGoaKbMcvKbH1gjaZ5bSooQqTUgw4dEpSiF1KVOdIIrJ18W7YnHhS/AMDcgd6ihQCX/bNqP2f7IlpSSb6hZHBRhxMQfvzsY3RZ0UcCVgEKD7CW3AsWgiEw8I5pd4i1//7e3bEgn0YVgf819yxQ2wcIz4k7JKvbjJ5yFRKoU+d3SF31wwEeoFlUPyGnW7GmnID/ETltxCTCcel1BK6y0XGQyXgdnQlakp3fHeQcDKqwzMtyVPV2gphu5Nvtc6ewAjhn9BfPkKgA6h2U/+EuHH0VlcGlXmf0K1z4eBDxsZdbYoNe4bI3qZ1FsbGvnQIK3biYO7xXBDthVzGoHudAa4EA5YctZE/SBDmbqhjrB6L7VHMzKe7ySVNIJWuXvMUhhUZAyAGgwQjQqjtZsQsErwWrEe2Bu2zLdS8mCmg/QONDFqC/85ep8Rxr4sqK+lST/+BTkWfmwvxVXzn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzRQQkpDZWZnOHhadW1rRnpqc2x5cm40Q2ZFRVZhVVR2a0dseGYzd2NXZVhC?=
 =?utf-8?B?U0EwV081eWUrVnhOeGcrYlMxRG80QkVhcE1NTFl5cEQvU25OTThFRUhJSWNt?=
 =?utf-8?B?VUFIeXVWMUZxWFkvNEdUVWo3aTd6Nm5PYkxCVHpMM004U1hHekI4SDIvWjRh?=
 =?utf-8?B?ZFhOZW80VUtPc0p2TVZ1NGpCUi9yNm81TUxYK09xemJxV3RWSzhXT2FNemZn?=
 =?utf-8?B?RENVaXd2OUd1QVZWeFF1enNCQjlBTnJzNk9TZ05iSXA1aFozZzFWalVNUkp5?=
 =?utf-8?B?Q0hjVmxDamVRS1JNRWw3L0VNeUdDM29JT1pFa21sNE84N2tSZ21uUEZ6Zy9R?=
 =?utf-8?B?SUN4U2Rtd0xtbU5vZ0R0aHpxQThiNE1qTzNLd05KSjcwRmltZ1NrUkNCdUJq?=
 =?utf-8?B?VDBOSUUyYmwwNE5WeUZBaTB4RnNVMTMxcE5sUlEzbU5GcU5YTUJzMzZQUWZG?=
 =?utf-8?B?ZG0veDJ3YXVsMS93YVRNQTFXU1lRVEgyR2kyVnpPZGxUbXNSUi9mV3graUgz?=
 =?utf-8?B?d256aUNUeWNyMGlBTTd3TmJNejkxM0J0Z1IzTTFzUElKR2ZZUTROcjhhc0xT?=
 =?utf-8?B?TzNLa2UxS2VJWExHVFpucDU0d1F2YmlDMTdFSWRFb3h0Y2hZR205OGZwa2VS?=
 =?utf-8?B?WHFxZ0drK1o3SWRLd3h3aElBT0VVZUVzVE9uNFJHYm81MkZjdGlYOFZlZEdB?=
 =?utf-8?B?c1pLR3JHUnFuOFlCS0U1azJsbE0ycDJiYmdXMENacjFoRzF0N1JocVYvd2J4?=
 =?utf-8?B?TlJRZ3gzQ0laNHZybUFmeTJlS1daWExTTkM4R1dWWkk2K00xM0hSMExCUFly?=
 =?utf-8?B?V0oyS0hPSFloZHBHUlhqS0xXUWM0Q1lpbnRHTVptdHJiY1YxMzJ5QWl2cWRr?=
 =?utf-8?B?VzhxK0FhUmtEcjVLT0tUSFQ5aXpzc0JMa0tPMjkxUU5jMlY1b2lMakpSb2Zp?=
 =?utf-8?B?UUtsOHdIdmlaRW9RdStNeWZNWUloVWtaQXZFRXNJV0VEZjZheWFHZTYyczdW?=
 =?utf-8?B?bXdGTm4xdmtZMHZrWWtnR2s4WWd4c2JiVHBrZDhRc1VBTWlZNnBWVCtZV2NR?=
 =?utf-8?B?MGNQYWZtcTRIaW9MalJoZDdXQ3RYdzFpalJNMVRKbHcyczJmdDh5NW9NRzQ0?=
 =?utf-8?B?dzBmd2JHblNGcjVpM3J1aTJlbkF6T1JCRGVCOE1sWWloVVV2dTdFcW50NGNT?=
 =?utf-8?B?KzA2VkRQcnNGWklQL1R0a0tRakx5bzBaQ3NrckZOdUFaVXZFeTJPREFzbnRX?=
 =?utf-8?B?akgwT0VIUGhMV3FEcnZzME1FKzZuRFBiMkZkNGJBZzRWQ2RXckNObU1nWlJZ?=
 =?utf-8?B?VjZhTng4UVRTczJEOG1GZ3U3RnlISmphUSthb05Pcm9OZnpnOWdZYXZIZ096?=
 =?utf-8?B?My9jOXVZVUxyRTBKTEhDdjhiUEs0clQxcGVjaWRITEZ1UEVuRXhBN2pQaUJw?=
 =?utf-8?B?ZjRNbytCSnNZZ1RlQlhFKzBGUUZvVkRuMnZBamtMaWh0Z1RRazV4TU41bUJy?=
 =?utf-8?B?akRIWE1XcnNNY1hMaUJsTG9CclpLM1A3bHlwMm0rTm1YaDVzSVpMekdWZ1pN?=
 =?utf-8?B?eVlpM3NodGEzQVUrL1VqOFRWL3lSRHl1b1JUZ0FaRlJrM0RhS0dlWFJKR3Vp?=
 =?utf-8?B?M21iQ25HdUUxSTYxYmppOUI5c00wbnRHWnFaNi9uWWpFWWZ3QStIbEJJTjlO?=
 =?utf-8?B?QzlCdzl6OGR5b2NiN1lCNWlkYStXOXo5QklpQ0FUSC9wMjNRb0ZRMXhGUUNj?=
 =?utf-8?B?YnFpclRWV1RIWXB0UDZUZWk4QVJmUG5nanVhOFFPM29JTTJ3UjRRcXhIN09N?=
 =?utf-8?B?TWpNSXgyTVlwNmFZWFVaSnV4K0FRQ3MxN1lzVThwK0R0ZUNMS0hib1hUZms0?=
 =?utf-8?B?bVpHa3VvcGMzTFVkbGJqM0F0NGlVYWZBb3dzT0cwcytMN1B2by9zakp0TzRr?=
 =?utf-8?B?NmhMam5kay9pb09ZNHVlNUdEVXRCQmprNVgvSGlIT2xTN0x5RFMyUWVkdHE4?=
 =?utf-8?B?YUp4cnNGMS9sVjVVdCswUitYZHNPRGwwRFNsbGtVTTVtQlpVOWpPMS94ckow?=
 =?utf-8?B?NDErUWkwUG1oc0hzcDR1K1c1ZVB2bGpmNTdnemt0N0dTVlEyUlpmN0VpL0Vi?=
 =?utf-8?B?QXZLcXpzSVloMmQxZno3M011d215RHRyZE1ZeXVCVFRFbllwc0lUY2x5cmp4?=
 =?utf-8?B?bEVQdFVXUVk0VWhTSTZhZFZ4MFBobDRLWnd6K3djNWdoc1lRQlZqR2tZYld1?=
 =?utf-8?B?R1dEVkE5RU5xUmx4Vnc0TEpRZWJUMWhwdHJ5ajhLbUVvZU5tMHFYYmZoenlL?=
 =?utf-8?B?MjRGZVowMUxzdFJRUWpNYndsY3hjV3F4NnNJaTJGdWFMUEIyV3Zldz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d591984-178d-4d83-04c0-08dec853cbae
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 07:25:35.9572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veRiqRjFVgf5yS1rnbv83DuPtSOp6bQubQdYXMz3p/Ml0LPpPSloqBUl+EunFQU5diqOA1+0BrcTI+HF8L57iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2475
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13722-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:glider@google.com,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:llvm@l
 ists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[est.tech];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kvack.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F06267734E

Hi Alexander,

> On Thu, Jun 11, 2026 at 6:21 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
>>
>> [snip...]
>> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
>> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4%40est.tech
>> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> 
> Can we please avoid this?
> kcov_dataflow.c is being introduced in the same series, there is no
> need to send a buggy commit and a follow-up fix - just squash the two
> together and note the changes after Signed-off-by: separated by a
> triple dash.

Thank you for your guide. I'll remove it in the next patch set.

Best regards,
Yunseong

