Return-Path: <linux-kbuild+bounces-13719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FWjzL17kKmqvywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13719-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:37:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0C673986
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:37:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=pnOWWgPT;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13719-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13719-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF41F307B177
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BA14968EE;
	Thu, 11 Jun 2026 16:22:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25567492517;
	Thu, 11 Jun 2026 16:22:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194934; cv=fail; b=roalsysTtMbvD0GyJeH+C4vh3tgsoJzaJc0xT5L71KAnI1MEguzy8P54V8R76QK5uZ5ibWWuE0wqHk2ErftzZNtPyQ4dwILB4uGg9wSk8mVAWzd5j+/ZP8/dfjvA5opHOb83gh7FTBcaKX6dLZ02JCr6t9zJOtqRxWm7MDXdLlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194934; c=relaxed/simple;
	bh=/QO7d0pbLHh6PDXLjjWzFubgN6kPyE0jU7Dr92rYdGY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=r+cNqaCoum+kOprf04mCX6bO52qt0KDc/+oi85t4e0azFKhLPLZT+8wDLtA/3GFoINF0+rVnEzFQ1z1Nj7ffxLH88lzheGYshDiktWtyKx5Wcdku+R6kvZqpRbzM8u+zWnzuoPIgImSIj4sjGUQkhkMQIe8OdhmCYz7Io6FuSEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=pnOWWgPT; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNCCw8gDHe8R68nVJ17p8+ZeDW3zPrjKG2QrqCpVKIyzZBhQXwoYDKKJC20BMdXf91t6efOl+xdsW4rk4XJ/6h92XzZ21z3THpXHMq6Khp5ZS6xEUdUOwQNxAjbqJenshr4dbGGuySXJvELv7lkfKDSWfCdd/p8XfVZD/aB1BBdRIFtn8EEB8NZ5VHQcpzyJduH9DVGDcLvYsdn8dGxKiocDbsObYovZg9PE54kXylHQDvQd16vIkNFraSZQH5J57ZjtIkl7mgW6pwKHhgEbned3H9BEPNHMWJjsmPbpD5ryDGUoCgo3jNkPaqKQYygubIPRJGUc9W5Lfw7dbbksew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWpBGa9Bxt7VzvS8PLudFJQTc3v2XROBC4kSRu7VSAg=;
 b=Q6XoAD8NFfj6o0SELYOU9XzlI8YPUZ+YXV3ncSWW7cc96vsMXHgi3JFDY8XJk2spn32GjmNQuf0wbamL2bkT5DUDbUnH1rQFFj+tg+SOgtiM1IQoxbxJ9IBwHX5g+h3CZGZDTGUdofyC7pZjafMSt7/NicFtMtfWm5Qf5kd2r/WbrjPjydzCryUFiVrIfdOYBKIRON4T0beIEn5uCcI16uaJNici0Mr1Yyyy+WVlvnfNOKp6n6tgj/nFHSJYVwhSouxaH6a5s8/B0WsVARDKW9qVflVjhOOx8MP9YeGUZMQw0f6/FCbx5zLih0L9jHQyh448MFBSGiUqWN2pI0de6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWpBGa9Bxt7VzvS8PLudFJQTc3v2XROBC4kSRu7VSAg=;
 b=pnOWWgPTf+QA6HQPdViPLCWKPIcOToU7hlSV7f+lVkImoSAkdHNTrWspZDjlS8ZjcNq1dyWCWyE7HqSwzQ8Ha7t6HqAGmXZVHnGHuG9bgs6eRApTpfrcXRsCjsLOaGR40TG//bZopvT7ESOe+zymv/2HuaNapUGFbgFS9DTozt/6i2CJqp/YzXAInX+OMG9eBIhyMYb94gQscP+fNAWMNTM7TTTJHqSEzW/C3w2R2V1MazxtJI5RrBwoLhmT5Z4TBAD/hcNyZ14G/sNwBXI61BUK7ZGXNVVNRt0rfGE3BvEqrluMNh6JZx2nh9SqbJjbN34jmm0tlUo3V+BRLvR6+g==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:22:01 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:22:01 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:16 +0200
Subject: [RFC PATCH v2 14/14] Documentation: add kcov-dataflow.rst
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-14-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=12496;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=/QO7d0pbLHh6PDXLjjWzFubgN6kPyE0jU7Dr92rYdGY=;
 b=djzukwNo+OmamenYPu+h1hlnGM1Q1eKpTy7Lkob/n535yCIsP008ubTTkjqdJErql5jBJKLXt
 bu5itSDzg1QD35LNTmLWyNBOiQ5/KekYTC3Zl71uCLU8/+s3oEr4j/S
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GVX0EPF0005F693.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::13c) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ee207c-d882-45a0-49df-08dec7d59150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7kXpKgAZ2npSI+Vazsj9EPVIK4hAdklIQvqjUVvI9iBAVabc2hw66gqmrzuXzDgx9a7aYOPpdVisxuVYpHkYqcposTqfluv1/DLn47lafC8Bums+9IS7UO7Hk1GZIBOLJ4oeUO67QNU/u1ZdSiFwMJFC6ULbG0oTDFmGx+wy71jkm9hS/8Qr1S3iPFha9FkZBKfSB+1e5UI57KZ1cKcPV/YQ5mEN062NZfA3HhsUSn/sULr5K5R7zKaPGYRHQhEx+tIcp6RC/W7dnX+mn9ZJWbkNctGnb85IAv3o9TwIhjJ/i714/wjUXQbayIfLT9yGgQaQEYiKysJtsjwuS47lgWwze5WlO/7gdsJtVpqBbtBBke+SzHaVho5lI7NhCDuUcOvs1Jey+1/BK8e2KVpViE75HkGg5lSm+/uCsRLQipEOY4sbTYsNivkJpo71NRt8YJkDzSxjT9MB+fcNVFzBT5HoDMMpJBcZgshorKB1PSpBs5r9Uds4k2143Ibfm5/491YsDGiTmDuifC9V7iO48jUrvTRYpTC5yYgdSv95BfvIuddxB3ata4P2ymwmq69M1IPQF3qIXeveuf76M1wvjU2h/ShUjZkKzSlUFr76c7k0BDn7p6Ql9v24sM59a3eiAlFhDDmOdQZykCWjFotM7eQdD+OKQKhzdj5CRZ6t1dKP85s4ThhPEKSml8mvTnuq0Fr+PBZ3mlHNn5cMfaL0GesrxacY76atYKwgRd98Xyo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGtyUmNJYmxSbDBabzl4WFlvYTFITFRhOXVkRHdFcDNoS2grbDM5bjk3a1pu?=
 =?utf-8?B?ZkxBQVFCUFNtcmF3NzZ4NmNHZ2dtSGRMOEhCRHJmb1VQZzVqMnB3OVVJMUxG?=
 =?utf-8?B?Qm9YSG4xaDU0T2daOFpwN1lWT0g0WFdvQnRCUnpCN21IY01SODlEL1dIT29m?=
 =?utf-8?B?U1Nla2VQOS9FRkh3K3lDNUVQSFdzMTJHMzJ4dUMvbFczRTFmM1FOY0U0enlJ?=
 =?utf-8?B?Y1Y1dU9ReXNpSXJRUVRLUGwydWZ5UmVFU05kQXpXSHN2Q29lUG5jRk4vV0cy?=
 =?utf-8?B?dGtvdm9GOU5ydVRFRDNud2thVkRFbVQyWWZocitOVnlxcFZvUnFjcDVwZ2hE?=
 =?utf-8?B?RUJibzhnZDJRbCtBM2JCV0V3Zzk0VEkwUU5LRGp0WDF3RFRLbUhZRGFicXBj?=
 =?utf-8?B?aEhDbElza2VvNFJzVWRtRjdQK3lUV2dzRDV4NStTVHFSVHpIU2V6eEVhd1Rl?=
 =?utf-8?B?MUV6TFJwbzFQZjJrdnRCZGlSVWR6RmppSzN5cytjbEVNZVBVSmZHZlduSjRY?=
 =?utf-8?B?eEhOeDdIdGUwNWRlV0FIWUpGZlg5a1pPbjZJWUdQVmVZMlYweE5kN2xyRGV3?=
 =?utf-8?B?eEtyWDNuTkZBWnI0eFQwN2tGY1ZZTXNKQVhaeDBGMk9JN2xYYmZ4ZlRJdWxK?=
 =?utf-8?B?a2pCbTJZYmIzZVFTYW92YUhNQS9TcnY1UEdITEtQYWVpaFpBemZuMVphdU5O?=
 =?utf-8?B?YWVzcWR3dHVSdjZKVGlKWVlTYTBKMGtBRkl6Yi9neWl4VlY4NW9QMjRRL3Ir?=
 =?utf-8?B?SlVkM0x5aWt5NURVQXYzbjlvUmZvUzBReWUzc3R2cUVxU0toVzFmVi94K094?=
 =?utf-8?B?ZUhWNFlMTlRxcm5idDA3b2dRMDhIbndqL2N6aFBxWXd1d3pKTFZiQTZDNWds?=
 =?utf-8?B?dnZmUHRBUnBKV01UdjZUeUlDUVRpQjFibUpCRDJoa0lUbGVmemRFTGF6NHQ1?=
 =?utf-8?B?ODYyak0vUjZib05OMkZlS3dUMmZzZGhMdllWNElabDM3bkpoY3RLalhMSVRE?=
 =?utf-8?B?SVBycVo3S3JyajE0b3pqS1Rucnk1aGFtWWZvRXMzUHNwUFYwZlVaeXpKMXlt?=
 =?utf-8?B?MDdOaWVLbkJFaXN1QTFVaWJjSnVLZFhOdC9xdnNVdTNQdERxUWtsZGdmRjBy?=
 =?utf-8?B?anY0eGxaL1lQVXZTMUlQM0RjNnM0dElZV0hoMmtlU2Z5L1cveVFvbjc0UGZN?=
 =?utf-8?B?N3ZXTTMxdFRpbGRmUi9DVXVuSmxRRm9ucWxndXJuTUpQVXh6Ui93L2lWeVZY?=
 =?utf-8?B?NUVSMkl4aTZjWnE4RjFjeUcrZVBqUGl0YW9tL0NISGxJZmJORzNobjRXam9j?=
 =?utf-8?B?ckpJelMrbUI1YXczNVZRV2NlYyt5YjNDbExCbG9RUTVVeS9NSm1ObTZiTmtB?=
 =?utf-8?B?YkRnUUN5RWFyL3M0SkdDMmxFeVczTmZWRTZ6MG95empUN3llZS9nM2Ivc3pq?=
 =?utf-8?B?d2VLdjQ0M252WTlsTUE2eStIV3NmUHhyd0VNWFV0QldwSGtGQTYvYXQzaC82?=
 =?utf-8?B?RkkyVW9YMDhOTnlxaVhaekhNU0hoZlJmcjhqOGcwcDBXd0lPemtqTjhTanQ3?=
 =?utf-8?B?QmJmZi9YZytxa3BJNmRVYlBhYllGZEZROXZNYUdVYkZSL0FHTE1nQ2VXN2o0?=
 =?utf-8?B?UGZwUWZvSThMUjFWaU50NzhlaFBvY1dRMy8zeG5GVUx4eU5pUnI3QWtqUThZ?=
 =?utf-8?B?bWRaVHk3L0owa0xqK3g2NVJYblF6NE44TmZWc2NlTUtQbE1FcE1ZdDYrejNH?=
 =?utf-8?B?UUJxNW5SaWV0OUlKWklEMVFuMFE3RmJ3aU96a01naXlSVjIxTFhMZnV3cDFF?=
 =?utf-8?B?YUlSR3VDcGRmUllJdHdBeG5XZUVkc2NYQnVzeGFQaUFRcVhCbDlhWmdWY2cx?=
 =?utf-8?B?ZEsxc0h3YlFIdGNVMW1wY3lNN0hpZmRBcmFIcnp1L1NEOXNZdG1WaG51amZt?=
 =?utf-8?B?WG9TcFE0U1hDRFRKdWVickFKZEVDR2cvZTRsYnBCek4yS2tGMGd0SmFDVzgy?=
 =?utf-8?B?Tk83bUlsSUMvWmNjUktLQnNUMW1YSGdSMElvZ1g1SFNpN2RoRGJQWldsa2Rs?=
 =?utf-8?B?ckhOMDh1amgrM09hd2lYRUF4eUR0dWl0NmZ1TlM0UEd0ZkxwWHIvT0JVdnd1?=
 =?utf-8?B?K2g3ZHFJSjc4TFVtY3QrNXErcE16THF0a1dDd2lDeFRnWk5ReklSU2dBc3Q4?=
 =?utf-8?B?VXExZ1E1WlFYeWwrQjJ2aTNvSWpHcTVDM0ZjdFdlbFZoUExUWjJ6THdHVTZO?=
 =?utf-8?B?V05JTW9PbzFQUi9sVGpGU0x1QzhCNzdYblZNSndCVmlrbVFldWZkNTNTRG9S?=
 =?utf-8?B?TDJMN1UrbmNMaCtvbWxBNmlBM1RQWTJrMkxyL0JMamNWK1ZRaVJIQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ee207c-d882-45a0-49df-08dec7d59150
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:22:01.4854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lz2tdGPdgSR3llAbP75jWb9xs33EXLwlqly9t6QAo6TjkOwDtLWWpChFjGL+Hpgf+CZ0qBI0gCqqJdK4eLOVAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13719-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,run_eight_args_rust.sh:url,run_eight_args_c.sh:url,module.rs:url,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,run_rust_ffi_contract.sh:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2E0C673986

Add documentation for the KCOV-Dataflow subsystem covering:
- Prerequisites and Kconfig options
- Per-module and per-directory instrumentation
- Data collection example with buffer parsing
- Ring buffer TLV record format
- Safety properties
- Ioctl interface reference
- Compatibility with legacy KCOV
- Rust module support via post-compilation pipeline
- Fork/child process tracing pattern

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 Documentation/dev-tools/index.rst              |   1 +
 Documentation/dev-tools/kcov-dataflow.rst      | 321 +++++++++++++++++++++++++
 tools/testing/selftests/kcov_dataflow/Makefile |   2 +-
 3 files changed, 323 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 59cbb77b33ff..541c58cc65ea 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -24,6 +24,7 @@ Documentation/process/debugging/index.rst
    context-analysis
    sparse
    kcov
+   kcov-dataflow
    gcov
    kasan
    kmsan
diff --git a/Documentation/dev-tools/kcov-dataflow.rst b/Documentation/dev-tools/kcov-dataflow.rst
new file mode 100644
index 000000000000..603c83946d12
--- /dev/null
+++ b/Documentation/dev-tools/kcov-dataflow.rst
@@ -0,0 +1,321 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+KCOV-Dataflow: function argument and return value extraction
+=============================================================
+
+KCOV-Dataflow captures function arguments and return values, including
+automatic struct field decomposition, at instrumented kernel function
+boundaries. It provides per-task, lock-free ring buffers accessible via
+``mmap()``, enabling data-flow-aware fuzzing and post-mortem contract
+verification.
+
+Unlike KCOV's ``trace-pc`` which reports *which* code executed,
+KCOV-Dataflow reports *what values* were passed and returned. This is
+a completely separate device from ``/sys/kernel/debug/kcov``.
+
+Prerequisites
+-------------
+
+KCOV-Dataflow requires Clang/LLVM with the ``trace-args`` and
+``trace-ret`` SanitizerCoverage extensions. Standard (unpatched)
+compilers will not expose these Kconfig options.
+
+To enable KCOV-Dataflow, configure the kernel with::
+
+        CONFIG_KCOV=y
+        CONFIG_KCOV_DATAFLOW_ARGS=y
+        CONFIG_KCOV_DATAFLOW_RET=y
+
+Optional: instrument the entire kernel (significant overhead)::
+
+        CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=y
+
+Coverage data becomes accessible once debugfs is mounted::
+
+        mount -t debugfs none /sys/kernel/debug
+
+Per-module instrumentation
+--------------------------
+
+To instrument a specific module, add to its Makefile::
+
+        KCOV_DATAFLOW_my_module.o := y
+
+For example, to instrument the Android binder driver::
+
+        # drivers/android/Makefile
+        KCOV_DATAFLOW_binder.o := y
+        KCOV_DATAFLOW_binder_alloc.o := y
+
+To instrument an entire directory, set the variable without a filename::
+
+        # fs/Makefile
+        KCOV_DATAFLOW := y
+
+The build system automatically adds the required compiler flags
+(``-fsanitize-coverage=trace-args,trace-ret``). Debug info is provided
+by ``CONFIG_DEBUG_INFO`` which is a Kconfig dependency.
+
+Data collection
+---------------
+
+The following program demonstrates how to collect function argument and
+return value data for a single syscall:
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <stdlib.h>
+    #include <sys/types.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <unistd.h>
+    #include <fcntl.h>
+
+    #define KCOV_DF_INIT_TRACE  _IOR('d', 1, unsigned long)
+    #define KCOV_DF_ENABLE      _IO('d', 100)
+    #define KCOV_DF_DISABLE     _IO('d', 101)
+    #define BUF_SIZE            (1 << 20)  /* 1M words = 8MB */
+
+    int main(void)
+    {
+        int fd;
+        uint64_t *buf, n, i;
+
+        fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+        if (fd == -1)
+            perror("open"), exit(1);
+
+        /* Allocate buffer (size in u64 words). */
+        if (ioctl(fd, KCOV_DF_INIT_TRACE, BUF_SIZE))
+            perror("ioctl(INIT)"), exit(1);
+
+        /* Map the buffer into user space. */
+        buf = (uint64_t *)mmap(NULL, BUF_SIZE * sizeof(uint64_t),
+                               PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+        if (buf == MAP_FAILED)
+            perror("mmap"), exit(1);
+
+        /* Enable data-flow collection for this task. */
+        if (ioctl(fd, KCOV_DF_ENABLE, 0))
+            perror("ioctl(ENABLE)"), exit(1);
+
+        /* Reset counter. */
+        __atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+        /* === Trigger syscall(s) here === */
+        read(-1, NULL, 0);
+
+        /* Read how many words were written. */
+        n = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+
+        /* Parse TLV records. */
+        i = 1;
+        while (i + 3 < n) {
+            uint64_t type_seq = buf[i];
+            uint64_t pc       = buf[i + 1];
+            uint64_t meta     = buf[i + 2];
+            uint32_t type     = (type_seq >> 28) & 0xF;
+            uint32_t num_vals = (type_seq >> 24) & 0xF;
+            uint32_t seq      = type_seq & 0x00FFFFFF;
+            uint32_t arg_idx  = (meta >> 56) & 0xFF;
+            uint32_t size     = (meta >> 48) & 0xFF;
+
+            if (type_seq >> 32 || (type != 0xE && type != 0xF)) {
+                i++;
+                continue;
+            }
+            if (!num_vals)
+                num_vals = 1;
+
+            printf("[%s] seq=%u pc=0x%lx arg_idx=%u size=%u val=0x%lx\n",
+                   type == 0xE ? "ENTRY" : "RET",
+                   seq, pc, arg_idx, size, buf[i + 3]);
+            i += 3 + num_vals;
+        }
+
+        if (ioctl(fd, KCOV_DF_DISABLE, 0))
+            perror("ioctl(DISABLE)"), exit(1);
+
+        munmap(buf, BUF_SIZE * sizeof(uint64_t));
+        close(fd);
+        return 0;
+    }
+
+Ring buffer format
+------------------
+
+The buffer is an array of ``u64`` words::
+
+        buf[0]: atomic counter -- total words written
+
+Each record occupies 3 + N words:
+
+.. list-table::
+   :header-rows: 1
+
+   * - Offset
+     - Field
+     - Description
+   * - 0
+     - type_and_seq
+     - bits[31:28] = 0xE (entry) or 0xF (return), bits[27:24] = num_vals,
+       bits[23:0] = sequence number
+   * - 1
+     - pc
+     - Instrumented function address
+   * - 2
+     - meta
+     - bits[63:56] = arg_idx (0 for return), bits[55:48] = size in bytes,
+       bits[47:0] = raw pointer value
+   * - 3..N
+     - field_val[0..N]
+     - Struct field values or single scalar
+
+Magic values:
+
+- ``0xBADADD85``: field read failed (pointer was invalid/freed/poisoned)
+
+Safety
+------
+
+- Callbacks are ``notrace``, ``__no_sanitize_coverage``, ``noinline``
+  to prevent recursion.
+- All pointer reads use ``copy_from_kernel_nofault()`` -- survives
+  freed, poisoned, or unmapped memory.
+- An ``in_task()`` guard rejects calls from hardirq/softirq/NMI context,
+  preventing reentrant buffer corruption.
+- No ``printk`` or allocation in the data path.
+- When not enabled for a task, overhead is a single boolean check.
+
+Ioctl interface
+---------------
+
+.. list-table::
+   :header-rows: 1
+
+   * - Command
+     - Value
+     - Description
+   * - KCOV_DF_INIT_TRACK
+     - ``_IOR('d', 1, unsigned long)``
+     - Allocate buffer (size in u64 words)
+   * - KCOV_DF_ENABLE
+     - ``_IO('d', 100)``
+     - Start collection for current task
+   * - KCOV_DF_DISABLE
+     - ``_IO('d', 101)``
+     - Stop collection
+
+Compatibility
+-------------
+
+KCOV-Dataflow is completely independent from legacy KCOV:
+
+- Separate device: ``/sys/kernel/debug/kcov_dataflow``
+- Separate ioctl namespace (``'d'`` vs ``'c'``)
+- Separate per-task buffer
+- Both can be used simultaneously without interference
+- syzkaller and other KCOV users are unaffected
+
+Rust module support
+-------------------
+
+Rust kernel modules are supported via a post-compilation pipeline::
+
+        rustc --emit=llvm-ir -g module.rs
+        opt -passes=sancov-module \
+            -sanitizer-coverage-trace-args \
+            -sanitizer-coverage-trace-ret module.ll -S -o module_inst.ll
+        llc -filetype=obj module_inst.ll -o module.o
+
+Selftests
+---------
+
+Automated tests and visualization tools are in
+``tools/testing/selftests/kcov_dataflow/``::
+
+        # Automated ioctl interface test (TAP output):
+        make -C tools/testing/selftests/kcov_dataflow
+        vng --user root --exec \
+          tools/testing/selftests/kcov_dataflow/user_ioctl/user_ioctl
+
+        # Load a test module and view captured records:
+        make LLVM=1 CC=clang M=tools/testing/selftests/kcov_dataflow/eight_args_c modules
+        vng --user root --exec \
+          "python3 tools/testing/selftests/kcov_dataflow/trigger-view.py \
+            eight_args_c -C 8 --ko \
+            tools/testing/selftests/kcov_dataflow/eight_args_c/eight_args_c.ko"
+
+        # Binderfs ioctl capture test (requires CONFIG_ANDROID_BINDER_IPC):
+        make -C tools/testing/selftests/kcov_dataflow/binderfs
+        vng --user root --exec \
+          tools/testing/selftests/kcov_dataflow/binderfs/binderfs_test
+
+See ``tools/testing/selftests/kcov_dataflow/README.rst`` for details.
+
+Tracing child processes
+-----------------------
+
+KCOV-Dataflow is per-task: after ``fork()``, the child does not inherit
+the enabled state. To trace child processes, re-enable on the inherited
+file descriptor in the child before ``exec()``. The ``mmap``'d buffer is
+shared (``MAP_SHARED``), so both parent and child write to the same ring
+buffer atomically.
+
+.. code-block:: c
+
+    #include <stdio.h>
+    #include <stdint.h>
+    #include <stdlib.h>
+    #include <sys/ioctl.h>
+    #include <sys/mman.h>
+    #include <sys/wait.h>
+    #include <unistd.h>
+    #include <fcntl.h>
+
+    #define KCOV_DF_INIT_TRACE  _IOR('d', 1, unsigned long)
+    #define KCOV_DF_ENABLE      _IO('d', 100)
+    #define KCOV_DF_DISABLE     _IO('d', 101)
+    #define BUF_SIZE            (1 << 20)
+
+    int main(int argc, char **argv)
+    {
+        int fd = open("/sys/kernel/debug/kcov_dataflow", O_RDWR);
+        ioctl(fd, KCOV_DF_INIT_TRACE, BUF_SIZE);
+        uint64_t *buf = mmap(NULL, BUF_SIZE * 8,
+                             PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+
+        /* Enable for parent task. */
+        ioctl(fd, KCOV_DF_ENABLE, 0);
+        __atomic_store_n(&buf[0], 0, __ATOMIC_RELAXED);
+
+        pid_t pid = fork();
+        if (pid == 0) {
+            /*
+             * Child: re-enable on inherited fd.
+             * The shared mmap buffer receives records from both tasks.
+             */
+            ioctl(fd, KCOV_DF_ENABLE, 0);
+            execvp(argv[1], &argv[1]);
+            _exit(1);
+        }
+
+        waitpid(pid, NULL, 0);
+        ioctl(fd, KCOV_DF_DISABLE, 0);
+
+        uint64_t n = __atomic_load_n(&buf[0], __ATOMIC_RELAXED);
+        printf("Captured %lu words from parent + child\n", n);
+
+        munmap(buf, BUF_SIZE * 8);
+        close(fd);
+        return 0;
+    }
+
+Note: the child's ``ioctl(fd, KCOV_DF_ENABLE)`` will fail if the parent
+has not yet called ``KCOV_DF_DISABLE``, because only one task can be
+associated with a descriptor at a time. For true multi-process tracing,
+open a separate ``kcov_dataflow`` fd per child, or disable in the parent
+before the child enables (as shown above -- the parent is blocked in
+``waitpid`` so it generates no records during that time anyway).
diff --git a/tools/testing/selftests/kcov_dataflow/Makefile b/tools/testing/selftests/kcov_dataflow/Makefile
index 6412c90edfa1..9691b41ffd3e 100644
--- a/tools/testing/selftests/kcov_dataflow/Makefile
+++ b/tools/testing/selftests/kcov_dataflow/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 TEST_GEN_PROGS := user_ioctl/user_ioctl
-TEST_PROGS := run_eight_args_c.sh run_rust_ffi_contract.sh
+TEST_PROGS := run_eight_args_c.sh run_eight_args_rust.sh run_rust_ffi_contract.sh
 include ../lib.mk

-- 
2.43.0


