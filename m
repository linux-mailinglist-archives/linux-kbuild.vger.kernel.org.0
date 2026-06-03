Return-Path: <linux-kbuild+bounces-13542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I9yTJS1qIGp53AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13542-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:53:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 175E163A4C0
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:53:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b="U5h/2kTs";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13542-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13542-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9284E301457B
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 17:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095C13E51D3;
	Wed,  3 Jun 2026 17:43:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E31C358367;
	Wed,  3 Jun 2026 17:43:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508628; cv=fail; b=VoP/V55p13EzIeqokqV82eA02ZmUiDWQUjzgsXkSfy+5p4aknRPSffvXDWhOhBXxx5GNseTdANQ4LPAb/JZQiwJu/ZXyGWBjRzgW3KhK4WtmcZu6FlRJF4wt3ND3TQCqxtNW6AcSOoHULcxkrugbTRpGO8fsetpifjXvsMnI33s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508628; c=relaxed/simple;
	bh=N5WfnUZswbSSztr1Zm85NDygAEa2ZSIUEYtjxhZ7ucA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=q/a/k2a6CyixN9eyX5MOWmLxYZ7eexT/1tvqEYOIK/vH4gR35dxC1xmiNGLc/XrLhGnx15th9e3T29BUu4GCCIujwHLE3qHfkUSD0DhE3vzSaZimWHjadtpaZr6GOT9I1jwc4/+8ou15gOe0EhJ1gAYWLbLHx2vQ2oupXWBnD/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=U5h/2kTs; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYfGkOGQOySurEbfxT9ngcuojA2WAbo2m5uZMfYQX27Fbx0TUrIFphA2atMVjd1LjLFehBllzxsPOaHO3UmUHNwqXjz5QwFRJjRtZzpk5OZ+XWfNGwKSEt1kkqBoxrc61FAYkbeG+fR1PZFLDnZGIA5XBlTqbEJx28fXCdjOPPvVOIMocJwgfyDOkBbw+Lwy6QNT+jLsCxJs9akGh6DaedscgADXSPME5g6Z4y7OZCGnQlJCIAHXySVPQGjNDzOIAl6EwGcDGveZh0hTnAnG0a3hGYJljl6zdtpRJXTekx3twTu7p1mc4NnTgarsicRS2Hy7timS7DyO0Ofx5U/yzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCwm7by1dJ4irR0/+NbbyjtFEaGptT8NIPO9ziTrg0U=;
 b=J2kb80IaECkiTg6R0nSIhiasc+HLTFViRI8Apsz2l5x8shVywHlQt8gserkx7i94Nq5fRCLslP8ycsG7cuXUuA6u9Q1fVeHbWfXpyENnd+uN2e2iX5A+vcAtgalNgpignH8NlwbiwuL2n/hteh74enLAqq5T3xXqkwefSFHtIXdBcxHC/frem/lx6sUa/APM02Io39ZMaH7qqjXz6oZzZUwp+JpLBUSlBjw8SkTNQIe21NGWDk/ruSjcxC+2ihahAKv7ub0DXtoiG/blY1yhsAVckaftXLdOpfgy/Iwijh4NE1KQojiYuY5OofuVh6aGo5gBb8OEKmqdD0+7LrgNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCwm7by1dJ4irR0/+NbbyjtFEaGptT8NIPO9ziTrg0U=;
 b=U5h/2kTsf7xn/kdJmgoPI8N3yPa2DRTe1wszeK8E8NdLS6T1kp1q7iHMxLmy/LVb0BxdjUl43xv97VgvPFZ/z9K79NF+hVBcQgcGXganaqXiJHGUKGw5/mL+Gr/ZSKyvssAUzQCv3dIlW4AzwZss+9SdDEQbgEjGKc/Ny1bhiQZWc1jyH9Cd6Qc5R148gHhOe1QENRib5SduoVeellTWwM35K+hud213hfwI0bx98w1IVMmnJP9w7mrHE8LorOUQCF+5DJ6u/Hi1E5h5EBj1+12WBHH2rfMiNlJ3T45BMCLwclAnV7PxQbA93eo8D3zVpSB2x0rfi8mV/VQVtbv3ow==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0929.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:43:43 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:43:43 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Subject: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
Date: Wed, 03 Jun 2026 19:43:27 +0200
Message-Id: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL9nIGoC/42NQQ7CIBBFr9LM2jFTahBdeQ/TRUsHIRowQLCm6
 d3FLly7fO8n7y+QODpOcG4WiFxccsFXELsGtB38jdFNlUGQkCSpw7sOBachD+YRXuh5zvjb1Gi
 kUOakSEmohWdk4+atfu0rW5dyiO/trLRf+1+3tEjI8tARjaY9anPhlPeZtYV+XdcPUPuD5sUAA
 AA=
X-Change-ID: 20260603-kcov-dataflow-next-20260603-8bf628f98086
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780508619; l=11478;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=N5WfnUZswbSSztr1Zm85NDygAEa2ZSIUEYtjxhZ7ucA=;
 b=wfrfS6aT59ZcNcbBFvS6Kc1vfgHp4EEPb6O7KQlmtILOKvopGsrQMC4H+TeaD8fi5+ji2bh/S
 oWopH5ACIYOCwu1btoY933urhLvxY9rpEdD9scIjIujlBwuofhJYJBx
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: LO2P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::19) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0929:EE_
X-MS-Office365-Filtering-Correlation-Id: 5553b108-353a-4ae8-9367-08dec197a744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|6133799003|18002099003|56012099006|11063799006|3023799007|5023799004;
X-Microsoft-Antispam-Message-Info:
	IAP4NDKpAM0mBzgA7dJ2G3RtphyQHMIVBBd2xw/TKIlF9DHG0TBjCxtlCubcPX8MQkbde2H7+pQGsCIfiLJJ4oQiKDJFR8eFtqWL/n1dr9ZyJ3QYgCGvVQX3Y9ZMzsoF35IKM+jlawPljiUDmlYyYeOhT3rosDtInYaPxN8e4L5v0K0S4Dwt8ZjxV9BqIhPaCFowR1gfg+8YdIu/p+13se9VFgARjIx4TXJeFR0srPNfPTtq1yK3sOfk1uFbNsh4/gL4WCf/BnCteQtEWMP1FV7eAm+nfz9fCgoh+kbLsVcfe/OwMKtyp/v6ZXAX0grrxZq/sE0EW2NholOYL7TrW+m+e5ByMeDR6D76NVaFI6ZpWsH0eAz3clRSABArzbg9uHhPZfzD6BgT4002u/q5kscjdt8/5q7J8IDuxQzUoTqc1vk5MZslLLe2t9etgMQv2J9Da9lAP5ukBLTioEVWUolvq6uQFgKGdWwzXz9K5mkQqak47M/RlEoPuiB4pEmzd7MFYvLJZayP8EKgulIRHh6O5S7+2uq5RD18p4GQ37OvATPsrOF3QNgH70CnmEdU4+aet2lsAWNeOyy4krzIFhXFUgR4G5PdyqZ+Un67k+reX0HQxYYQV/g9c+fzCch4JjBa/UT3mqeIqAJOjei/A6uMa4OCOs6IQVtEuPfChuCV48Nuv4U4AK97zkuMWjKy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(6133799003)(18002099003)(56012099006)(11063799006)(3023799007)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlhZTFZVZXBJRDlaQXJyNmo4czYrdFkva1Vua05EbW5lbzB5RzVsQ2hrTXo0?=
 =?utf-8?B?RDg1R2lEWWZLYkhJMVh3T2Vwb05iU1BFOWJOUUtkUmpqaHRmcjJaUlh5T2pW?=
 =?utf-8?B?WjIrQlkzVmVqUi9WLzAxQWZlcjdSSEdRK1BmTU5TQVEraXAzNjYrLzlpV2Vm?=
 =?utf-8?B?Q004VldRYXVjd3FxV2Q4NVkrSlFreTNMT2d3b1ZuWitKSTNxRG9CQnI5dlFn?=
 =?utf-8?B?R0ExdVFNSDJWSXFCeWtRRnpiZjM1Yzg1TEx6dnpOK2w3ZUVyQ3lwMHpiVzlB?=
 =?utf-8?B?ZUhFc3MxTWF3UnZsd0pCTWxCc1R5VDBaT1MwS2cvQ1F2MWludUJpNVVHRUM2?=
 =?utf-8?B?Qzl4YVg0T2owYTRDd1o4bnBqZ3E1OE95Y1RxUG5MTmJZRnJzR0FkTldlbFRs?=
 =?utf-8?B?c214alFSVjRnc20vREttNTdrVjNoVlZiMzBQZDR1cHBQWmEzVHVudmF4K2Nn?=
 =?utf-8?B?UHJyUHJydFZ0MDJPUnJ6RGI3ZU9ORFVkRW9OTTdTMy9XSnNnOE9wRDZsTDJV?=
 =?utf-8?B?S3p5SlFWNnlvYlF4S1FlTWxOdWpDNEY3TGdZQmo5Z2NLQmdxQVVwTE9uZ1JH?=
 =?utf-8?B?UGgwcWNLdld4YlFrZ05iWnZNWXQ0OWc3aWcrRUw4UzlVL3JDbXc4YzZDSEor?=
 =?utf-8?B?b1htT0Y4MnU5MUN5MThNQXMvbU5RVVNqeHJXOFZ6WndpcWptZkdWRnVCVUdx?=
 =?utf-8?B?UDBVSitNWXVncjZqQUdiTm1zNmgwNlVNVlVJQW5SandqSXhBdzhFaHJvWWFk?=
 =?utf-8?B?YXMvSUZSU0hwdldXVC9mR0liM0Jyc1d1SGRBNGtGLzFnVURPTDFkN2poK0lT?=
 =?utf-8?B?YXpKTWpFQ3lUd1VJY1pGTUl1dzVIbER3RERUbWZoeDBEMHZYS05oQ24wTXM2?=
 =?utf-8?B?WUZNS1RqMSszeEUwd2wvK29BRGFGKy9PZUNTR3RQQUptbXJBb0JlUi9DS3Fn?=
 =?utf-8?B?S1hMSDRuMklzZSt2S3JEYm1sL3pITm1ad0Z1Q3RKTDl1amM2QVdyQ1RNR0Jk?=
 =?utf-8?B?R1JIRmVGSTNxUUpPQnArOUNsQ3EwcG1rUXhZUU82a0t6RkFBc2hvYm5MYjhk?=
 =?utf-8?B?a05sSWRlUDZualVQbjZTb1dXeGNubG92eldVYVZ3cTRvWDR3N0RFQlNoc2Fa?=
 =?utf-8?B?RStydFQ5MlgyS2NmVU9ibzg0QnhGSFR6Z3FzczlRdGV1UXZCY1RoRkJYSEZB?=
 =?utf-8?B?SzVFMm9LTHkzWGl2NkFJQ0JkUXlXQUtrMTJGd0tWb2dnRHRLUmJ6R0ZFaXR4?=
 =?utf-8?B?bm9sV3ZjRXZFYlJIM3orV05KcDFxTk9DVEs4YXhvVStVc3JNVW9TSzMxank0?=
 =?utf-8?B?Y0NFbHVsTGc3YitvQUhZT2VoZURtbmhsZkxwdWZrKzl1MWsxaVdmVVMwdlBs?=
 =?utf-8?B?UG9OUFNNQnl0a0JCUjFPU21zdi9DeE1oWDZYWjRvNUQxSFBIT0RjT0x1c3dY?=
 =?utf-8?B?YW9vS0dGWUx4ejRiWE16cWdDVDVNZThBYzQwcEJleUNVd1FiaVBuVVVyRG90?=
 =?utf-8?B?N3JOQnIxaGhXaFJZZjJSRmEvVldodHZOWE9TMkJCd01jWXJGeUI3U0Vwa29h?=
 =?utf-8?B?UFJOQzRSZVhMWXExMmEybS81NEUwYkk0bWpPSmlaWDEzRnl5d3lzdzhjSzRm?=
 =?utf-8?B?SUFDTC8zMWpYKys3MnN1TzdNNUo0NU9VTTlLVWNBeU96ajVGSFZzMVptNGp2?=
 =?utf-8?B?bnN3WGtXRnNvZU5CMVdGM1JNc2ttMHZWMXpPQllqNmlwZUNGZ29zMmlNWisv?=
 =?utf-8?B?ODVBSEVudXNJakVRUzV4cjZBNlQrVmdvTFNlWi9yTTl1VVJ5aE1PNWxUcFhV?=
 =?utf-8?B?dXVnUmNlR3k5WkV0MVg4U0pKSDhmTDdsZlk2T0ZHMVJSMkR3c2lVcEh6aWVk?=
 =?utf-8?B?SlFjNjRsWEtRTUF4dEJQV2YvbHl4NDhjSlZVOUo1T0tmSFB0U2dMbnFCRTYw?=
 =?utf-8?B?QXV3MndrVG1KYWJIdFkyVUJwb25oWkU4LzNoVkVsc2c4aXJ5cGRGdWhoWElq?=
 =?utf-8?B?b3NBaDl3cGNyV0ROQ1FTKzF3VDRTSnQ0bmRWNGVpQ3d4eDhJSGUxVDgzNzI1?=
 =?utf-8?B?Rzl6OG9YNGFiank2VDlVc3M0blpjQjFBdkpwUlpqQ2lGTUdiN0VKbjJnbVBq?=
 =?utf-8?B?UFNXdWc1LzV3VGd5ZmZ1elJhYy9TWEFXMVA3UVBPQ0s4YnpzSVpvNGN2dG5K?=
 =?utf-8?B?YnNuOHhPQnVMaW0zV1E3SGNWOGNTM0RZTTdNTXBxSXlwTTRBd0FHd3ZCRnFO?=
 =?utf-8?B?eWdWd0VIWW0wdjN6enp0dUtPc1RwSllxU1J1RFQvY2FpTkR2S1MzWVhqdXFR?=
 =?utf-8?B?N1JNZmp5QnRNbG91RlhLdUpUeE5mTy9oTHpjTGpRdUNsSGZpdFR6UT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5553b108-353a-4ae8-9367-08dec197a744
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:43:43.3449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgb2QLTjnE8T9iiL8ssMPr8/kuf5ZhKKgzRkU+5Ze8Ng0yEPS7aU4NqIj7h37VATh7N3FuzBfPMuEfWe91Ujqg==
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
	TAGGED_FROM(0.00)[bounces-13542-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 175E163A4C0

Introduces a new KCOV exetened feature that captures function arguments and
return values at kernel function boundaries, enabling per-process visibility
into runtime dataflow.

Motivation
==========

Even for highly experienced developers, it is not straightforward to
determine, at any given moment, which specific kernel paths a user
process is executing or how function arguments and return values evolve
during execution. This lack of visibility makes debugging and security
auditing significantly more challenging.

Limitations of existing tools in per-task dataflow extraction:

  - ftrace/kprobes provide dynamic tracing at specific probe points
  - eBPF enables programmable in-kernel analysis but requires manual
    specification of struct layouts rather than automatic extraction
    from compiler debug metadata
  - perf provides statistical sampling of hardware/software events,
    inherently lossy and designed for performance profiling rather
    than deterministic data-flow capture

This is NOT a performance tool. The purpose is auditing and contract
verification — confirming that kernel functions receive and return
expected values at runtime.

Real-World Result: Android Binder Vulnerabilities
=================================================

Using kcov-dataflow with CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL, I
audited the Android binder driver (both C and Rust implementations)
and discovered two exploitable logic bugs:

Bug 1: BINDER_SET_MAX_THREADS accepts 0xFFFFFFFF without validation.
  kcov-dataflow showed: set_max_threads(max=0xffffffff) → return 0
  Impact: bypasses RLIMIT_NPROC, OOM from unprivileged userspace.

Bug 2: BC_ENTER_LOOPER accepted twice without error.
  kcov-dataflow showed: looper_enter() called with ENTERED already set,
  no rejection, return=0 on both calls.
  Impact: thread pool state corruption.

These bugs are invisible to:
  - KASAN: no memory corruption occurs
  - Edge coverage: same code paths for valid/invalid values
  - ftrace: shows "function called" but not argument values

Only by capturing the actual runtime values at function boundaries
could I detect that 0xFFFFFFFF passes through without rejection, or
that the same state-mutating command succeeds twice.

The fixes are submitted separately:
  [PATCH 1/4] binder: cap BINDER_SET_MAX_THREADS at RLIMIT_NPROC
  [PATCH 2/4] binder: reject duplicate BC_ENTER_LOOPER commands
  [PATCH 3/4] rust_binder: cap set_max_threads at RLIMIT_NPROC
  [PATCH 4/4] rust_binder: reject duplicate BC_ENTER_LOOPER in looper_enter

Approach
========

Rather than tracing individual probe points, this patch set enables
continuous per-task extraction of data flow across all instrumented
function boundaries — capturing how argument values enter and return
values exit each function as execution progresses through a subsystem.

The key insight is that function boundaries are natural observation
points: arguments at entry reveal what data enters a subsystem, and
return values reveal what comes out.

The compiler (clang with a SanitizerCoverage extension) inserts
callbacks at function entry/exit that record argument values into a
per-task mmap'd buffer. The kernel backend reads struct fields safely
via copy_from_kernel_nofault(). When not enabled for a task, the
overhead is a single boolean check per instrumented function.

Design
======

- Completely independent from legacy /sys/kernel/debug/kcov
- Separate device: /sys/kernel/debug/kcov_dataflow
- Separate ioctl namespace ('d'), separate per-task buffer
- Per-module opt-in: KCOV_DATAFLOW_file.o := y
- Optional global enablement: CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
- Supports both C and Rust kernel modules
- Safe in process context; rejects interrupt/NMI via in_task() guard
- Recursion guard via sequence counter bit 31
- Requires clang with -fsanitize-coverage=dataflow-args,dataflow-ret
  (Kconfig uses cc-option to verify compiler support)

Performance Note
================

This feature is designed for auditing and security analysis, NOT for
production use or performance measurement. It should not be compared
to runtime tracing tools optimized for low overhead.

Per-module instrumentation (recording active):
  ~27ns per callback (dominated by LOCK XADD + copy_from_kernel_nofault)

Global instrumentation (INSTRUMENT_ALL, recording disabled):
  .text: +9.5%, .data: +44%, boot: +71%, syscall latency: +133%

CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL instruments every function in the
kernel. This incurs significant overhead comparable to KMSAN and is
intended exclusively for:
  - Fuzzer-driven whole-kernel auditing (syzkaller integration)
  - Full-subsystem contract verification (as demonstrated with binder)
  - Capturing complete call-flow data for post-mortem analysis

For targeted auditing, use per-module opt-in (KCOV_DATAFLOW_file.o := y)
which limits overhead to the specific subsystem under investigation.

Patches
=======

1/6: Core kernel implementation (kernel/kcov.c, sched.h, Kconfig)
2/6: Build system support (Makefile.kcov, Makefile.lib)
3/6: CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL and NO_INLINE
4/6: Userspace tools and test modules
5/6: Harden kcov_df_write() against interrupt reentry
6/6: Recursion guard and documentation

Prerequisites / Toolchain
=========================

This kernel patch relies on a custom LLVM SanitizerCoverage pass that
emits __sanitizer_cov_trace_args() and __sanitizer_cov_trace_ret()
callbacks at function boundaries, extracting struct field layouts from
DWARF debug metadata at compile time.

To build and test this patchset, compile the kernel using the modified
toolchain:

1. LLVM/Clang (adds -fsanitize-coverage=dataflow-args,dataflow-ret):
   https://github.com/llvm/llvm-project/pull/201410

2. Rust (rustc 1.98 built against the above LLVM 23, for Rust module support):
   https://github.com/yskzalloc/rust

Build instructions:

  # Build the modified clang
  cd llvm-project && cmake -G Ninja -S llvm -B build \
    -DLLVM_ENABLE_PROJECTS="clang;lld" -DCMAKE_BUILD_TYPE=Release
  ninja -C build clang

  # Build the kernel with dataflow support
  export PATH=$HOME/llvm-project/build/bin:$PATH
  export RUSTC=$HOME/rust/build/x86_64-unknown-linux-gnu/stage1/bin/rustc
  export RUST_LIB_SRC=$HOME/rust/library

  make LLVM=1 defconfig
  scripts/config --enable KCOV \
                 --enable KCOV_DATAFLOW_ARGS \
                 --enable KCOV_DATAFLOW_RET
  make LLVM=1 olddefconfig
  make LLVM=1 -j$(nproc)

Note: CONFIG_KCOV_DATAFLOW_ARGS and CONFIG_KCOV_DATAFLOW_RET depend on
CONFIG_KCOV and use $(cc-option) to verify the compiler supports the
new flags. With standard (unpatched) clang, these options will not
appear in menuconfig and silently remain disabled.

Optional configs:
  --enable KCOV_DATAFLOW_INSTRUMENT_ALL  (instrument entire kernel)
  --enable KCOV_DATAFLOW_NO_INLINE       (enabled by default)
  --set-val FRAME_WARN 4096             (needed for INSTRUMENT_ALL)
  --disable KASAN                        (conflicts with INSTRUMENT_ALL)

Testing
=======

Tested on linux-next 7.1.0-rc5 with custom clang/LLVM 23 and
rustc 1.98-nightly (built against the same LLVM). Verified under
virtme-ng (QEMU/KVM, 1GB RAM):
- Per-module C (eight_args_mod): all 8 functions captured
- Per-module C (deep_chain_mod): 10-deep call chain captured
- Per-module Rust (eight_args_rust): all 8 rfunc functions captured
- Interrupt safety: in_task() + recursion guard prevents corruption
- Binder auditing: discovered 2 exploitable bugs (patches separate)
- Standard clang (without patch): Kconfig options correctly hidden
- Global enablement (INSTRUMENT_ALL): kernel boots, 104K records
  captured during single copy.fail exploit reproduction
  
    https://github.com/yskzalloc/kcov-dataflow/blob/main/copy.fail/origin/converted.txt

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260603-kcov-dataflow-next-20260603-v1-0-e64300bf17cf@est.tech

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Juri Lelli <juri.lelli@redhat.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
To: Ben Segall <bsegall@google.com>
To: Mel Gorman <mgorman@suse.de>
To: Valentin Schneider <vschneid@redhat.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
To: Dmitry Vyukov <dvyukov@google.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
To: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Danilo Krummrich <dakr@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev
Cc: linux-kbuild@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: workflows@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Yunseong Kim (6):
      kcov: add per-task dataflow tracking for function arguments/return values
      kcov: add build system support for dataflow instrumentation
      kcov: add CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL and NO_INLINE
      tools/kcov-dataflow: add userspace consumer and test modules
      kcov: add interrupt context guard to kcov_df_write()
      kcov: add recursion guard and documentation for kcov-dataflow

 Documentation/dev-tools/kcov-dataflow.rst          | 282 +++++++++++++++++++
 include/linux/sched.h                              |   8 +
 kernel/Makefile                                    |   3 +
 kernel/kcov.c                                      | 307 +++++++++++++++++++++
 lib/Kconfig.debug                                  |  43 +++
 rust/Makefile                                      |   1 +
 scripts/Makefile.kcov                              |   6 +
 scripts/Makefile.lib                               |   7 +
 tools/kcov-dataflow/.gitignore                     |  12 +
 tools/kcov-dataflow/deep_module/Makefile           |   2 +
 tools/kcov-dataflow/deep_module/deep_chain_mod.c   | 224 +++++++++++++++
 tools/kcov-dataflow/eight_args_c/Makefile          |   3 +
 tools/kcov-dataflow/eight_args_c/eight_args_mod.c  |  95 +++++++
 tools/kcov-dataflow/eight_args_rust/Makefile       |   2 +
 .../eight_args_rust/eight_args_rust.rs             | 114 ++++++++
 tools/kcov-dataflow/kcov-view.py                   | 272 ++++++++++++++++++
 tools/kcov-dataflow/trigger.c                      | 125 +++++++++
 17 files changed, 1506 insertions(+)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260603-kcov-dataflow-next-20260603-8bf628f98086

Best regards,
--  
Yunseong Kim <yunseong.kim@est.tech>


