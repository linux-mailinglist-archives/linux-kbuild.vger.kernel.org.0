Return-Path: <linux-kbuild+bounces-13712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EqsSHwPjKmpuywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13712-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:32:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7073A6738EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=HNETnNJu;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13712-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13712-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 653AF305C903
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDE7477E41;
	Thu, 11 Jun 2026 16:22:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E089C44BCBE;
	Thu, 11 Jun 2026 16:21:58 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194921; cv=fail; b=FAEGjPxIxVvauvfB0Pt11lzSVBw0tAkq7fgmTVC25TQcePcN+ePwtxSrkZpYg+pOrsywa8MfdTWwNXvMj0jpJkaWjnCtrE8gcTUjWtOCPVwme/+gpB0hTYXMl0gryuh4YwE1c1BXyoMKqndxdba6oj9lwdK7wOjFy1lNJT0HZBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194921; c=relaxed/simple;
	bh=Sl6u6AvdCIQIiG26Yfl2mpNG0w7ezgkO/1XDtS722aE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=noOcc+rhes5VQRVciydh+UT9nYsdIsiMj+PQ2aSQFwllBeKJEW5i4UVKBeMnR+xCXaEvZZsfrGtO2yFn1gOtC7JYDjwPFLpCOcq9kooJ84K0CXudevLVbYeN/AYUYsLAZ44PUHFXP6tXaU/uzzS4WZmyDTGSo0Rj6Lk1r/F5Nps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=HNETnNJu; arc=fail smtp.client-ip=52.101.69.42
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foNZ5i5EmWGDUnKlDs6u+RoyJFADnL8G8lW5OA5pFrP3LCRCmJAZzs2Csu7rqqc27bjnjG63sr7WSEvpjMGgJn77Kx8JwDmQPfLL3SlmkQDLrrnOlx55u8WUoEh+4+A6P12CeEmq8VQtA02hTaM6YvUpz9hlOx0ON5jUgDpda+KwGJCg7e7fM1ZlQYxpqm1Hfvw07BDqkJWVlhzp3HPgTeXEBPjEvRDlFDXs8ohezyZX5F0M7UbBPnF1Vq65btvoAN7JtowkFJi5wzGkOBm5YN4t+C8/8IjTgpgGMtWAP04CgGIEdkOkIfCed6N7St8aoPAvTXBzrpJFcIzRiL6OZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/Z9buftd28jxr/zK/940oKb0JuRI9nUYB8vwv5I+Lo=;
 b=liDRIAzpvvzIYuKEDI7Q7cGEH4bj2gwwvwTsJFJt6fZGObrpJNgjtSs9ON3zJEQ8/IHoqEoR6cxBz5sqx3YwVwUlMpUycfoyYsY36aWVH9Q5qz+2M/BLD01pL+O4jii/qLQs/HiaJq8styG6VZLLAZ2/FR03G8urfqde7hosTv06sQ5DdROkVzJtWSylBN5iXs+faXJvOxwZ4FGf0Q/bFwYYq7MRzKVy3/btNRFl0O+PgdKDOIPL6cM+M3wWxeMTzn3wpm4GXXaHpjmRm+FAxYUujkzZf1I5BsnKkwVtimKj9yAIf+X6Jn8PGtWKUDOECDbi3mluYK6OKezjw5McLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/Z9buftd28jxr/zK/940oKb0JuRI9nUYB8vwv5I+Lo=;
 b=HNETnNJuKrtTMU61bry43x57VDPSytbXH02qlBqDUnLeFN8gjz9BTTP7db7QOYhU9WIM6w72+xZa1vxcOIh+YToN7PaMi+VGkCp7namOXShypxy8RJB7PSXH8HeIqFhgF+p6vu3DucLHFEFh2XWW2+dqs5OIaHpmR6sTvrfNPR1R9GJBhOdzjvhA+5nQfM5D18ZHQfKqMYVkeFCcHhLAFxhtnHxhQuDxV+1ls1vmBYUDDfUKEYuSLU5sNAzg43mAUW3gF4dVgMc7lvQZgRVKBQpW+5MQJXIvktBxcZ/ABU7UZ+S2l0YV2kadJvskVBH+fIihGjgY1MRf7Sy+3ufUMw==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:48 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:48 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:08 +0200
Subject: [RFC PATCH v2 06/14] kcov: clean up dataflow state on task exit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-6-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=2400;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=Sl6u6AvdCIQIiG26Yfl2mpNG0w7ezgkO/1XDtS722aE=;
 b=+Kzb3ovU+beuHUv8M53MW3+pE00ij6W4GaFOkOymP0rlQbqr/UhgAjnK29kP/TquBrQIY/ay9
 eCCBeM9sEtcCBomWEne+Hj8+6lxSdwnH+tjJ6BozULhBfL4JDDddJ1P
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GV3PEPF0001DBFC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::317) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: efe2062d-e52f-4ed3-e82b-08dec7d589bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	quvWXfSxMSEUvFFbyZiJ+PaJ5VeCRCRT3cMqFCIB7Hlss0el7GQ62VJGs4ODW5BhhPvLqdPpDRW7gTGwFAZjZs2OVMaDGsbHMXOceMYA/po33bh30c6ICGS2VclxopDUoTnzlVYHptivdICxMw0LrM6Zad+C3R6VS89JhQ+4TTC3A9NZSeMQsXaa0EWmdQR/n45OYZVhgufg1sU0ES6yAZfZnCzHr7KPVdaviwS9/psdZY2gdyuF1q0t2frUXO8KApk2uL31fOCz2M8WHAeTzRKAl5WTM0EwTwdxb6OcNaSkuFVKXXw2Tz1Z4gObLCmlKFLxGf+Za28ivmd8j90Rud2E6jUJEpYb1+2kzatEr6wwihbok8JdivtleFnNSRJcl7fmHLYsYAu7r7HJ5pklDbiBt8GuFFrIEyvMDm8NVL7QGczy4osXCNzUKCOkdrVfyqGEreUBaSx7n5WJsgrxSl2k3EU89Cvm8ui8hbRRFn7itpikqUC/rL+Z9h8VA/xuJYcnDq7d6eS19J+X6XGukIQs5lJ2iYCmNRrWQfvL7tB4ug0smgE1ogPSJgrtAAi5ZrEd2nYKI0j2rtXvm5xrGkPn15UypKhYK7jQnce3Ce3HRGO7PpB3VLVbpb511+q/zd5MgJ6JcZ9/MOCbM6xhVHeUiQu9ItNWuBuRG18WqcFp07sBlzv75IelQiS6yq1v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkJ5UGpBY0wwK3VTRVMxOExTZzlaWHlUS3dXcmEvQ1lsTFVKbmdnUmV1d2lP?=
 =?utf-8?B?UVF6Ly9ydnU1SnpVUlZ2VkRaM0F4ZU1oRE9nNGMzcEl4d01ObTM1MURpSjV2?=
 =?utf-8?B?alV1a25QUFh0YzNTdnAyMnFITzFJOUhoSVFiWGREV3ZxMi9sMmtNVzFMRWRM?=
 =?utf-8?B?ZUM0VWplNENycVg2ODd4UzhuTWl2Z0h5dlVPT21QL0haV01MSzVDRk50dWJw?=
 =?utf-8?B?eUhLNTVBS2FBem5HeFdCbURNVFduYkhzVDZ3cDBodjhzTU91VjRzWXlYOUw4?=
 =?utf-8?B?T0Q3bHRueGYvVy95SnAwNHFZVi9JazJVUXUxZGFTMTdkSGZyM2pGUmVQY1Mz?=
 =?utf-8?B?WTFrN3MyN0FtMUFWWkpac3FsdnJCdFpJREFDK2ovQXFGd3lnTkd2eGJaOGxE?=
 =?utf-8?B?ZFQyaHUrUzlvR05hQU54b1JKQnB5Nm5XUDJLMTEvRGZaZFY3ZXNiWVhDVEFq?=
 =?utf-8?B?cUpvMXgzSWV3OU5Ia0ZkWVBXL0RucEZ0eGplbVRMQ1V2djIyNkFaTUlNWHJq?=
 =?utf-8?B?aWFTWGpHNTdXYkphMDhnS0ROVitQZis1QnQrNmk0UWhGY0owUDI2aTU3d0JG?=
 =?utf-8?B?UjBwVkNCMXBEbVBjd2VzWFFMcVRpZFZnazJMdkN2MWVHMXdyTzY2VVBaWCtj?=
 =?utf-8?B?TER6K1hKTm9pc0tCRTZEbU5qWkh1TVpLaU52NlUrYk0rRWk4ZmZVTnpUb2I5?=
 =?utf-8?B?YWpzbS9pYWd1QldIVWxPY0VwZW56UlZQWEhBR2xsNmUrZHU4MGtmR3dqeXZr?=
 =?utf-8?B?RW5oRm1zMXE4bFcxdDJVMDlNaWZxRnpuR2RqdzZxSEc0alFvVjJXUjlYSlJG?=
 =?utf-8?B?VGovUzRQQkMvQ1hwQTVnS2pYa01sM1JoRkZnOTVndk51VDFQYTBVd0hWcFBX?=
 =?utf-8?B?d0FZR0ZsL29ueGIzL1pGNkRGai9raTlEeGJpS01hai9EWUN1bWg0VXQzSUMz?=
 =?utf-8?B?MUJmMG9sOXhMQlY0NitzZzJ2dUJyV3JSd3hZRDZzTytMWlp3dEdRd0ZKKzFV?=
 =?utf-8?B?ZmFGTjZzWXBlWU5kK3UxMXJIaVlhUjE0ckJrY1RpTDdMMUtHOGgrS2h3dnJM?=
 =?utf-8?B?Z1ZXLzhGTDJwd20xMGVvUFFTbGJwbGp4Z1RNM1NuS2RPZldwUUtIRFJibWR2?=
 =?utf-8?B?UlVwQlViNnlaVUVkOVdING1UazFDVVRMSlkyWFZGbWNzM2ZySGt0amNKb1px?=
 =?utf-8?B?L2laN0NNajFKdS9xT3hDVnhoclYwZTBvMUtDanBTc05XY1g5VktSTkJOV0oz?=
 =?utf-8?B?RWd4K3FCc1QyZFZkdHJOMlAyUTQxeEorRS9neGlwM3UzVHgwaExiYjJ1M013?=
 =?utf-8?B?dnVzc3VJRmZJaFBidWFRVzVDWVJNVjIyb1JlTU9DTlVLd3lBV1pzMW5vWW1l?=
 =?utf-8?B?WlZ5aVRwRWNoZys3TmNCMzJUdkJKOFhvTFo5aGdoeHMzd0ovR0E3WVEwQWJo?=
 =?utf-8?B?aCtBYmloMXRVSlk2TGVkb0RFMjNDOHI3SDU4ZEVhS0tXTkxTTHFXT045TVZt?=
 =?utf-8?B?NmpDZktaVnUvemsyc2h3SlVBTjZpeTgxMXQ4MHhkNEpheHk4eDcreFdIL2Jy?=
 =?utf-8?B?N2J4a2c5NjQvZCtUd29xSm1kNW5Pd3VkQ1gxT29sS0hqM2w4K0V1VTcwaGEv?=
 =?utf-8?B?enkyNFgrbE02T3JON1UzNDFGTzMvSmJqbHRrZWoyK1ExZUloQWNzdVdDaklW?=
 =?utf-8?B?RDZ1TWpwR3JTc1RPQlJlWWljdFpObzBRdTRrdlg3Q0ZmN091TXVpakNDTkpY?=
 =?utf-8?B?Rk9SSzloMzBDQW43NiszK1kzMk5vdE1zUDhta0NnN05XNVBpam4vb3pGb2Vv?=
 =?utf-8?B?RnpGVENnZjV1c3lBM3c5bThudUtHSkF3ZVhkV3Rsb2p6TkIxVVBNVXZFZ0o4?=
 =?utf-8?B?WVByWXdWY1YwUGhXQklROVJqaUlLSnU2MEY5TmdIdUJYRlJIY2pOMFpUTGVl?=
 =?utf-8?B?aDBZNkpWYzEzVloyeFl0L005WmoySmZSbXU1THdlNDVLTzdmWGhDbi9sWW4r?=
 =?utf-8?B?MnBKVGZod1poM053Q0puaWVlV2wxNlJveFlSSkw1ODdFZmNnMWxzc3RPUXlx?=
 =?utf-8?B?WjdSZzNOcmhXb05seFFlR1hLU3RDS3ZEbTdLbEZ6YXd1aUZMVUNadlN2RGRz?=
 =?utf-8?B?Vjk4TGZOc3NTdHdxRHo5dElmckZKSE92cHllNjRhbGozNmI1NXV0U2xPMTdW?=
 =?utf-8?B?SU9Yd1VSRHVyMm5XajR3VTNQcVkrZXpGVnhpYUFGSWZ6SGN6aWpCa1QwVS8x?=
 =?utf-8?B?RE9UME94RUw0T1I4RE4wc3c3VUlFZlZzVHlISEZsaDBsY2REZG5MZ3pLbzRv?=
 =?utf-8?B?MmJJelBKZXRjUXFhVW9sdnE4Wk10M3FGNkNxOE9oR0N6R1h4elpjdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: efe2062d-e52f-4ed3-e82b-08dec7d589bf
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:48.7614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8IT8/Ect7M88fT2bAQx96ioqggdeYYhW17VSDRUM7HE4RyDzs/l4bj/KOTYLPz9KmGFA8wYX9dokCPhoyNk8Q==
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
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13712-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,sashiko.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7073A6738EC

If a task exits without calling KCOV_DF_DISABLE, the kcov_df_enabled
flag and area pointer remain set on the freed task_struct. If that
memory is reallocated, subsequent writes could corrupt arbitrary memory.

Add kcov_dataflow_task_exit() which clears the dataflow fields, called
from kernel/exit.c alongside kcov_task_exit(). This matches how
kcov_task_exit() cleans up the legacy kcov state.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4%40est.tech
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 include/linux/kcov.h   |  2 ++
 kernel/exit.c          |  1 +
 kernel/kcov_dataflow.c | 11 +++++++++++
 3 files changed, 14 insertions(+)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index e9822b02982b..07d7823e5d6f 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -30,8 +30,10 @@ void kcov_task_exit(struct task_struct *t);
 
 #if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_RET)
 void kcov_dataflow_task_init(struct task_struct *t);
+void kcov_dataflow_task_exit(struct task_struct *t);
 #else
 static inline void kcov_dataflow_task_init(struct task_struct *t) {}
+static inline void kcov_dataflow_task_exit(struct task_struct *t) {}
 #endif
 
 #define kcov_prepare_switch(t)			\
diff --git a/kernel/exit.c b/kernel/exit.c
index 1056422bc101..af2314500791 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -935,6 +935,7 @@ void __noreturn do_exit(long code)
 		kthread_do_exit(kthread, code);
 
 	kcov_task_exit(tsk);
+	kcov_dataflow_task_exit(tsk);
 	kmsan_task_exit(tsk);
 
 	synchronize_group_exit(tsk, code);
diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
index 7cfe2495275a..df037b7e90eb 100644
--- a/kernel/kcov_dataflow.c
+++ b/kernel/kcov_dataflow.c
@@ -196,6 +196,17 @@ void kcov_dataflow_task_init(struct task_struct *t)
 	t->kcov_df_enabled = false;
 }
 
+/* Called from kernel/exit.c to clear state on task exit. */
+void kcov_dataflow_task_exit(struct task_struct *t)
+{
+	if (t->kcov_df_enabled) {
+		t->kcov_df_enabled = false;
+		barrier();
+		t->kcov_df_area = NULL;
+		t->kcov_df_size = 0;
+	}
+}
+
 /* File operations for /sys/kernel/debug/kcov_dataflow */
 
 static int kcov_df_open(struct inode *inode, struct file *filep)

-- 
2.43.0


