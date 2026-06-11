Return-Path: <linux-kbuild+bounces-13715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PhERJT7jKmp4ywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13715-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:33:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC234673905
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 18:33:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=O1xUle1T;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13715-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13715-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A3C8352B126
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jun 2026 16:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90B3481FC4;
	Thu, 11 Jun 2026 16:22:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F6472764;
	Thu, 11 Jun 2026 16:22:00 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194926; cv=fail; b=p/ZoXFg9dSOd4kObF2KQnE2PpozPBYSEW1gGHf9KzCUsSEZlGozCVpT6RyI/AZJfh4gZe6sTCmDOpAf4j2fS1LNuztrPBO5JLWbLhiKB8WuDjNmPh46YhycQc9K6hcGrk6TygqkNQ0VFHYDyNNr1n0AZ+D7mOiQ1KZbJHKNVSL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194926; c=relaxed/simple;
	bh=uKDYnpB8BwFaTgVadpzgWc+JDjhfCuwUY8/JIB0IobY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y+/vBum9ib1ij2SIJEIea9KA+F4GUC3KMKNRVTG4OVTuuASvG7iN66JSE5KLcDwIlWbgC3ZbiFLldor205dYn+8m/26dbYdOWFNRh62hvkeYkaiUtE/sjfJz+ZcFZNFlrRMAbqLB6FXWdhnh+sWxATN1mwvgRpgq/YTmTGyMqbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=O1xUle1T; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oE3lQLUhvmDg57HK+upRRAySE+qBeVJaN4UNbbU3BsqAYBjuS3NHA1ehDn/h+SFWchsy4FFTB902+RH5S5/gy/7o4rkcegd/7O4bA1p0ln5OeljaO1rDRKB+MYp8rpL/A69BGg1zrDeO3tJGTxrGEakpOiScJvXtWSEACV0L/9851G7t/Nl2LZ9u2KBn85ZcQ+X8Qre6Dd1GlxYWyPodjOlTdRzO4JbiSyAnm41x/Px+DtVb7S/SUsOap9n5QXVnRj4Eo4FlKxZ1PaEkx69zDMhw+tnHEfbkRkXp6L7UznbxW2o7Onf7mFLf3OFLv9LQzqpiw+TJup54pdCSKG1fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoENOFMq92qTwczbiLwgprmQTz8BLW620KOHwffPRLk=;
 b=FZhXI5leHAZb9s3c+URZt3wQppfM6ezvRK3hq2N0TD6jBBu11aAn5wVSrIzO2b9LVYWIOYAO9t5ekbeAv+YtskGEqWhuQ0JmZUxJP1BLv/GUnASgvg+sVT7ChoLns1kedkZzCb35rDTU/ZWL+08m4AymqguptoHB6Bw6wJX11Bhiuu7lyO/I4dO7HG1sXV0OCpGJrMtg9DNDjqXHP8/WniB4h8SDtUXPIuwDZ6dqZM46q2uzXDB37NhcwTRPITIf/T8ccUnhW2SiuQJVliJ7U8gFmV9peG1Qm+F0Q3a/Mi2OVjx/t43tgI/HrcwXwfqd4y/AeH6Qm2T//WlwqzgmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoENOFMq92qTwczbiLwgprmQTz8BLW620KOHwffPRLk=;
 b=O1xUle1TTk7+l73YcZcTsatYptpYP5PJQzYZYscx74GH4mX0XvVKHAWf1SR4CoVHRjvtThp5EOte0F8c8OJoA2AAiXgRAtFaDQVDdF+hc7ol1QVdPlb4vCYg7LUK5aHCQxVvmDApj/FBLv3s2Fmq61hCBDOSOV9N9fgWCV+HRQ0gqcf+HP8japctY/nQjOF1zAcxenRtlazIvnIAmaz+MZ993VUr0GQ8s/McUyEZASXdcj/9VCfYo9PyIWpaV1pP+BZ7e9QrfycsNIINyQse515SM4qfsMVZuzJR8LqfEyqRBO9q9PM3bhB1Wx3h6znDSCqjxFObxgnxT3eg65soOA==
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2a5::24)
 by PAWP189MB2829.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:468::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 16:21:52 +0000
Received: from DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471]) by DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 ([fe80::2af4:a981:db81:d471%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 16:21:52 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Thu, 11 Jun 2026 18:21:10 +0200
Subject: [RFC PATCH v2 08/14] selftests/kcov_dataflow: add trigger-view.py
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-b4-kcov-dataflow-v2-v2-8-0a261da3987c@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781194895; l=13901;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=uKDYnpB8BwFaTgVadpzgWc+JDjhfCuwUY8/JIB0IobY=;
 b=MJ+pxNM0hyDV00H+eS5JXNTGMaBudcXB/KrtkQygYEPcv/YjIQS6azSDdSx7mR0HYcs4USdjb
 xZYjOhZ4WclAUpk2oh8earMYXFXS+QrgswaFBo8HTqyIMNg7P61r11b
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: GV2PEPF00023985.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::36b) To DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2a5::24)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1754:EE_|PAWP189MB2829:EE_
X-MS-Office365-Filtering-Correlation-Id: 6448ddd8-50e0-419a-f028-08dec7d58bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|921020|56012099006|11063799006|5023799004|3023799007|6133799003|9063799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lsGmbgDnFuyfk7xcUxN2TU+I7jAfM1g2ZEYhOcpBmptpQNLmlmswaMWJnacupOvWi50GpKrdl7DrtMX6QkvtJLmyNyvWD5rIwyzo3dqjrJCDaTqsCPi6OpDYdud4MKcQYXPegCQaC7XI+5/+pVCmeYQrH7PIp4ryFYr7E3MOrDwVzfl9rzKUK5UYDXp58k+u2jVajnqchumf3lqglRqAiS8107IzPSVBWplVOA8ZEc4GMfvMPpL3Sc/24E5u5RFhNMTzWFzSLJsC0H1BuCBkYt9iutxlYhQQIacOX1HP69N/AOgoLlt7wcYx/C7Xrp/1I2XZB+GDyke/qb3eFRNJiL0Z8kh1dBifEdIDZuk+9IBcrszQp1X2nQ6MZYqknrLK/SrzA82naM0qFMmJvVGl5K5GUAz6RPlH7a8ui58GJVVp5pLy97NhGeQc/+ZDJmR6vwupCtuJNwqXSiM5dP76cslwQhYjfB9YRSAtpYKWq+XoJKkkVA1+sz5OK7mBp/lguiY5Lt/1b7SUOk55mbiKjpFWvv2yB9Y5eFK64+h3B0gXF6VVzPDyShI/kzx0r1s2X44ZDfBLRkl1nwvd2ui2/feSfhxrfVybzhFBQI+LCnzG37h2Yz0UhArv1EW/95zIOVGx9I/TIay6aUJfwTxvqIUX/ZKd+pU7eqKD9yaVEk3FMya/eIhmpfMmpknuJD/FtHngKCW/iyYEP5GQ3Hr1BifWNXoVjJAHmnHt4sfh6ImffgR1BfNd9gRR6XHzXpZj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1754.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(921020)(56012099006)(11063799006)(5023799004)(3023799007)(6133799003)(9063799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlNTeWhKNUFBMXV6eU9NSGdQRnVvNUtWTDNlQ1dUY1hXVXhYTXd5cHkxWWQ0?=
 =?utf-8?B?TVB4NEdzSUl6THpSUGFIU2I1ZVdIYllCUlRwY1RZbFRYV25jcHNWQjkwYnFm?=
 =?utf-8?B?VEdoNGprSUt6TjJXeGRKRTVjK1NaN0VETGEwejE4c2Y2S1Y0RCtSdHZxclpH?=
 =?utf-8?B?YzhYTmJvZ0xzeDVMMFJhMTNmbDl3UkZxK3BoRmlWNTVTUTJKZWNwK09pV2Nq?=
 =?utf-8?B?WFc2T3paN2pyb2tKeS9yZ0tFZ2pyZGVpc29GQy9XQXlxOEgyQnhOV3Z4NUVQ?=
 =?utf-8?B?dWZlZmk1NTYrOERjVWU1VGdyM3I0TXdzNEZRRjVLbmZ2b1Z2Q1VQd21QWng0?=
 =?utf-8?B?MkZVRzVxOG1FL0F3ODJyNkFCYU9OUWRNRzhxS0JyZmdMR0tYaDhKclpLM3R1?=
 =?utf-8?B?OFBZSjB1aU40R0U0eE9wRUZFNXRrd0Rlcjc4RFZPZERYenZOdG5FTnhXTUcv?=
 =?utf-8?B?eTIvTGRnWERVV1VpUDFBSDVlc1NEczZpaS9KS2daZEFybDRsSFJsRnEzcGpi?=
 =?utf-8?B?NHlFYUMxalgxaWlDWkRhNXJTbFBJa1Q4WWk2UzgvK3YvSWNTcGlTR0J4N1lv?=
 =?utf-8?B?a1NTWlZ2VXpXTTZYSlhwNHkrZ2lNdkh6VEV2ZEczcEJhNXkwUDBmQWlkUzE3?=
 =?utf-8?B?bFRyU3phRmFuNWVrMmc4Vm8wTmJBSnAvU1o2SjBmcW5NNTdsL3NSSTU5Sk9K?=
 =?utf-8?B?NHZhSEZBWGdrSEQrQVNHc2RqZVpSRjdFUThVZXdHVmNXNkVYREhCOFc4U0dt?=
 =?utf-8?B?SFZlNUxoSkdReDlIZmh6RmZyNmxZZk9SNmZUWWJueTZtMFd6bWtJcUQwSmZt?=
 =?utf-8?B?TlFMd2tGR0xLNFZIaC93RnkwOVcrWGpuTko0dWJtZHY4QnR0dE1lWmlWaURr?=
 =?utf-8?B?bzYzYTl4dTNHNWxkRE5nUW43b1NTbW55VC9XbTJuYi9pelNUK1pNdzBxd2N6?=
 =?utf-8?B?VWhKSlZIYTJQam9lOTFiYWZuOGNIV3lqeEM0Q2FBNWpCNy9pODhlTmF5VGdY?=
 =?utf-8?B?OFJSU3g1dm5rQnY4YkZhWENuZmpqZGN2aHovSGdpWlc3c2pUTXAxbi9LRUJw?=
 =?utf-8?B?UjR0T3BWenRpWkxaZ2g3eWE2OVVqUk1FejQ3YlY0QWp0cElkQndyc0VyU2t3?=
 =?utf-8?B?NG16RXNtREkzNjlkUEpSUklLWUxBQWRuQ2VhTks3ZkZSKy82ekw3dGQxeHB6?=
 =?utf-8?B?S1VrWXpBZnZkcDFXc3BOUFVNeGlQMSs0S0NhOGl3dllmQWNET05objV0RTN5?=
 =?utf-8?B?NEo0MU0wYUdsM041WE5lc1FFQ2pBbFpFRFMxK0kzcW0zeG9XTUpwYTdGRXc5?=
 =?utf-8?B?WUZabWV1Sk1yS1YxeWJBQkxwOGlTVHdJSm94anNuQjlCMDR4aElKMWJPbThi?=
 =?utf-8?B?c1ZGckFjYWtBOElVdGJPWXAzbmNGbVhYQW5INmNhWEp3cE1QWTdmaWMrRWZQ?=
 =?utf-8?B?NlRwaW0xM1VpdHdPY2I3R3NGa2Z4RVJacjk0Q2dUcVlnM2c0Mnh2TnlsYWRR?=
 =?utf-8?B?emlHVDVMWDZtdUZWbWF6SVR3SEJGZHZNQ0xNNUJGSzk3NzdHd0hyOE1QbUwy?=
 =?utf-8?B?eVV1SHRQUGtrTk5hQnU0eHJCNHJlZzdwbksrd2ZSdXBhRmR5SE9jMUdxbXBy?=
 =?utf-8?B?OWI1dHpnVkw5Q09zQXI1dHMxYzVOUk5HNUJSQVg3MENkL0VBQnJRbnUzWFhw?=
 =?utf-8?B?Q003T1d4SXF2UnVVamx1cXp2WnFoczROTjJYdmtlZU93VW1wNlRHUmw2NFc2?=
 =?utf-8?B?cldNUW9nemg1WGJ4bVJDOVRBRFJadENocEh2OGJsNVgrV2tweXZudXozMnli?=
 =?utf-8?B?ZWNpYWw2QndWYWRabEdEYUJFYnk1cTVlNnlhWk1lcUhzVGRaR05xeW56R1BN?=
 =?utf-8?B?aC9GZUhmN2QzcTJMbC84ZkQvNm42S20rZXRXNHBBMUxYWVZTeVdDcXA2clZD?=
 =?utf-8?B?MjMxTHBzaVdNZUVZT3JXOGlIc1hKNW9lM3FBNGs5QVZpMmJGbHVNVFlwd09z?=
 =?utf-8?B?REJmUzc2SGkzdCtoMjgzTlgzbmZ6c05zWXl1bGtUU1YvOFZYcUxHR1hzcE4x?=
 =?utf-8?B?TzYyN21KSG85aHFhaVZFaEpLVDRqcXRvTWp0OGZ2U29XMCsrMGVQZllJZFIw?=
 =?utf-8?B?cDdVTm42MFczRk9oYVU1b2xRZTd4am9ha2dzRG9CSlF1RlMrTkY1RFp3VUVB?=
 =?utf-8?B?Y2NjYitYczd6SmZpOHRFYTFsL1JiNi8zWHJqRUlHTVFPTVJxNU9DaFRWN0sw?=
 =?utf-8?B?RHAvYmMrbWI0L1lEbUJRSlM4V203RDhlU3Q5bVJPVnBqMk5Hb3RoclovYm1w?=
 =?utf-8?B?TnpDZmlJZlVKQ05wc3VTNWZJSUVSK2VOSmlVb21aSU1mY3ZJUEN1QT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6448ddd8-50e0-419a-f028-08dec7d58bc7
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1754.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 16:21:52.1334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/OWa3q+SFFqrYLZMKBhQ0hQMEqffvHXHhChT9Zgf8uQcUbK/S9jpFt1oFewZ0qIKnhdnt6J6tRmqBSeN+g8VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2829
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:glider@google.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@
 vger.kernel.org,m:llvm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13715-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,est.tech:dkim,est.tech:email,est.tech:mid,est.tech:from_mime,trigger-view.py:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC234673905

Add a Python script that loads a test module, triggers its debugfs
entry with kcov_dataflow recording active, then pretty-prints captured
records as a nested call tree with kallsyms symbol resolution.

Features:
- 8MB ring buffer (1M u64 words) for INSTRUMENT_ALL kernels
- Enable recording after module load, before trigger (avoids VFS noise)
- Variable-length record parsing using header-encoded field count
- Module-only filtering via kallsyms symbol lookup
- --context/-C N: show N records before/after each module function call
- --raw: print raw records instead of call tree
- Architecture-aware syscall numbers (x86_64 and arm64)

Usage:

  python3 trigger-view.py eight_args_c \
    --ko eight_args_c/eight_args_c.ko

  python3 trigger-view.py eight_args_rust \
    --ko eight_args_rust/eight_args_rust.ko

  python3 trigger-view.py rust_ffi_contract \
    --ko rust_ffi_contract/rust_ffi_contract.ko

Cc: Alexander Potapenko <glider@google.com>
Assisted-by: Claude:claude-opus-4-6 [kiro-chat]
Link: https://github.com/yskzalloc/kcov-dataflow/actions
Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 .../selftests/kcov_dataflow/trigger-view.py        | 377 +++++++++++++++++++++
 1 file changed, 377 insertions(+)

diff --git a/tools/testing/selftests/kcov_dataflow/trigger-view.py b/tools/testing/selftests/kcov_dataflow/trigger-view.py
new file mode 100755
index 000000000000..a3274e472dc1
--- /dev/null
+++ b/tools/testing/selftests/kcov_dataflow/trigger-view.py
@@ -0,0 +1,377 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+trigger-view.py - Load a module with kcov_dataflow
+recording active, then pretty-print captured records.
+
+Usage:
+    python3 trigger-view.py eight_args_c
+    python3 trigger-view.py rust_ffi_contract
+    python3 trigger-view.py eight_args_c --raw
+
+The script:
+  1. Opens /sys/kernel/debug/kcov_dataflow
+  2. Inits and mmaps the buffer
+  3. Enables recording for this process
+  4. Loads the module via finit_module() -- init runs in our context
+  5. Disables recording
+  6. Unloads the module
+  7. Parses and prints captured records with kallsyms resolution
+"""
+import os
+import sys
+import struct
+import ctypes
+import ctypes.util
+import argparse
+import fcntl
+
+# Constants
+DF_TYPE_ENTRY = 0xE
+DF_TYPE_RET = 0xF
+MAGIC_BAD = 0xBADADD85
+BUF_SIZE = 1048576  # 1M words = 8MB
+
+# Ioctl numbers
+def _IOR(t, nr, size):
+    return (2 << 30) | (ord(t) << 8) | nr | (size << 16)
+
+def _IO(t, nr):
+    return (ord(t) << 8) | nr
+
+KCOV_DF_INIT_TRACK = _IOR('d', 1, 8)
+KCOV_DF_ENABLE = _IO('d', 100)
+KCOV_DF_DISABLE = _IO('d', 101)
+
+# syscall numbers (x86_64)
+import platform
+_machine = platform.machine()
+if _machine == "aarch64":
+    SYS_FINIT_MODULE = 273
+    SYS_DELETE_MODULE = 106
+else:  # x86_64
+    SYS_FINIT_MODULE = 313
+    SYS_DELETE_MODULE = 176
+
+SELFTEST_DIR = os.path.dirname(os.path.abspath(__file__))
+
+
+def load_kallsyms():
+    """Load kernel symbols for PC resolution."""
+    syms = []
+    try:
+        with open("/proc/kallsyms") as f:
+            for line in f:
+                parts = line.split()
+                if len(parts) >= 3:
+                    addr = int(parts[0], 16)
+                    name = parts[2]
+                    mod = parts[3].strip("[]") if len(parts) > 3 else ""
+                    syms.append((addr, name, mod))
+    except (PermissionError, FileNotFoundError):
+        pass
+    syms.sort()
+    return syms
+
+
+def symbolize(pc, syms):
+    """Find nearest symbol <= pc."""
+    if not syms:
+        return f"0x{pc:x}"
+    lo, hi = 0, len(syms) - 1
+    while lo < hi:
+        mid = (lo + hi + 1) // 2
+        if syms[mid][0] <= pc:
+            lo = mid
+        else:
+            hi = mid - 1
+    addr, name, mod = syms[lo]
+    if addr > pc:
+        return f"0x{pc:x}"
+    offset = pc - addr
+    if mod:
+        return f"{name}+0x{offset:x} [{mod}]" if offset else f"{name} [{mod}]"
+    return f"{name}+0x{offset:x}" if offset else name
+
+
+def format_val(v):
+    """Format a captured value."""
+    if v == MAGIC_BAD:
+        return "FAULT"
+    if v == 0:
+        return "0x0"
+    return f"0x{v:x}"
+
+
+def find_module(name):
+    """Find the .ko file for the given test name."""
+    ko_path = os.path.join(SELFTEST_DIR, name, f"{name}_mod.ko")
+    if os.path.exists(ko_path):
+        return ko_path
+    # Try without _mod suffix
+    ko_path = os.path.join(SELFTEST_DIR, name, f"{name}.ko")
+    if os.path.exists(ko_path):
+        return ko_path
+    # Search for any .ko in the directory
+    mod_dir = os.path.join(SELFTEST_DIR, name)
+    if os.path.isdir(mod_dir):
+        for f in os.listdir(mod_dir):
+            if f.endswith(".ko"):
+                return os.path.join(mod_dir, f)
+    return None
+
+
+def finit_module(ko_path):
+    """Load a kernel module via finit_module syscall."""
+    libc = ctypes.CDLL(ctypes.util.find_library("c"), use_errno=True)
+    fd = os.open(ko_path, os.O_RDONLY)
+    ret = libc.syscall(SYS_FINIT_MODULE, fd, b"", 0)
+    os.close(fd)
+    if ret != 0:
+        errno = ctypes.get_errno()
+        raise OSError(errno, f"finit_module({ko_path}): {os.strerror(errno)}")
+
+
+def delete_module(name):
+    """Unload a kernel module."""
+    libc = ctypes.CDLL(ctypes.util.find_library("c"), use_errno=True)
+    ret = libc.syscall(SYS_DELETE_MODULE, name.encode(), 0)
+    if ret != 0:
+        errno = ctypes.get_errno()
+        raise OSError(errno, f"delete_module({name}): {os.strerror(errno)}")
+
+
+def parse_records(buf, total_words):
+    """Parse the ring buffer into a list of records."""
+    records = []
+    pos = 1
+    while pos + 3 <= total_words and pos < BUF_SIZE:
+        hdr = buf[pos]
+
+        # Valid headers fit in 32 bits (upper 32 must be zero)
+        if hdr >> 32:
+            pos += 1
+            continue
+
+        rtype = (hdr >> 28) & 0xF
+
+        if rtype not in (DF_TYPE_ENTRY, DF_TYPE_RET):
+            pos += 1
+            continue
+
+        pc = buf[pos + 1]
+        meta = buf[pos + 2]
+        seq = hdr & 0x00FFFFFF
+        num_vals = (hdr >> 24) & 0xF
+        if num_vals == 0:
+            num_vals = 1
+
+        # Valid records always have a non-zero PC (kernel text address)
+        if pc == 0:
+            pos += 1
+            continue
+
+        val = buf[pos + 3] if pos + 3 < BUF_SIZE else 0
+        records.append({
+            "type": rtype,
+            "seq": seq,
+            "pc": pc,
+            "meta": meta,
+            "val": val,
+        })
+        pos += 3 + num_vals
+    return records
+
+
+def print_raw(records, syms):
+    """Print records in raw format."""
+    for r in records:
+        sym = symbolize(r["pc"], syms)
+        t = "ENTRY" if r["type"] == DF_TYPE_ENTRY else "RET  "
+        arg_idx = (r["meta"] >> 56) & 0xFF
+        size = (r["meta"] >> 48) & 0xFF
+        print(f"[{t}] seq={r['seq']:3d} {sym} "
+              f"arg[{arg_idx}]({size}) = {format_val(r['val'])}")
+
+
+def print_tree(records, syms):
+    """Print records as indented call tree matching converted.txt format."""
+    depth = 0
+    # Group consecutive ENTRY records by PC to collect all args
+    i = 0
+    while i < len(records):
+        r = records[i]
+        sym = symbolize(r["pc"], syms)
+
+        if r["type"] == DF_TYPE_ENTRY:
+            # Collect all args for this call (same PC, consecutive entries)
+            args = []
+            pc = r["pc"]
+            while i < len(records) and records[i]["type"] == DF_TYPE_ENTRY \
+                    and records[i]["pc"] == pc:
+                args.append(format_val(records[i]["val"]))
+                i += 1
+            indent = "  " * depth
+            print(f"{indent}{sym}({', '.join(args)})")
+            depth += 1
+        else:
+            depth = max(0, depth - 1)
+            indent = "  " * depth
+            print(f"{indent}{format_val(r['val'])} = {sym}()")
+            i += 1
+
+
+def main():
+    parser = argparse.ArgumentParser(
+        description="Load a test module with kcov_dataflow and view records")
+    parser.add_argument("module", help="Test module name (e.g. eight_args_c)")
+    parser.add_argument("--raw", action="store_true",
+                        help="Print raw records instead of tree")
+    parser.add_argument("--ko", help="Explicit path to .ko file")
+    parser.add_argument("--context", "-C", type=int, default=0,
+                        help="Show N lines before/after each module record")
+    args = parser.parse_args()
+
+    # Find module
+    if args.ko:
+        ko_path = args.ko
+    else:
+        ko_path = find_module(args.module)
+    if not ko_path or not os.path.exists(ko_path):
+        print(f"Cannot find module for '{args.module}'", file=sys.stderr)
+        print(f"Build it first: make LLVM=1 CC=clang "
+              f"M=tools/testing/selftests/kcov_dataflow/{args.module} modules",
+              file=sys.stderr)
+        sys.exit(1)
+
+    # Open kcov_dataflow
+    # Ensure kallsyms shows real addresses
+    try:
+        with open("/proc/sys/kernel/kptr_restrict", "w") as f:
+            f.write("0")
+    except (PermissionError, FileNotFoundError):
+        pass
+
+    try:
+        df_fd = os.open("/sys/kernel/debug/kcov_dataflow", os.O_RDWR)
+    except OSError as e:
+        print(f"Cannot open kcov_dataflow: {e}", file=sys.stderr)
+        sys.exit(1)
+
+    # Init + mmap
+    fcntl.ioctl(df_fd, KCOV_DF_INIT_TRACK, BUF_SIZE)
+    libc = ctypes.CDLL(ctypes.util.find_library("c"), use_errno=True)
+    libc.mmap.restype = ctypes.c_void_p
+    libc.mmap.argtypes = [
+        ctypes.c_void_p, ctypes.c_size_t, ctypes.c_int,
+        ctypes.c_int, ctypes.c_int, ctypes.c_long
+    ]
+    buf_ptr = libc.mmap(None, BUF_SIZE * 8, 0x3, 0x01, df_fd, 0)
+    if buf_ptr == ctypes.c_void_p(-1).value:
+        print("mmap failed", file=sys.stderr)
+        sys.exit(1)
+    buf = (ctypes.c_uint64 * BUF_SIZE).from_address(buf_ptr)
+
+    # Load module first (generates noise with INSTRUMENT_ALL)
+    mod_name = os.path.basename(ko_path).replace(".ko", "")
+    try:
+        finit_module(ko_path)
+        print(f"# Loaded {mod_name}")
+    except OSError as e:
+        print(f"Failed to load module: {e}", file=sys.stderr)
+        sys.exit(1)
+
+    # Get module .text address for PC filtering
+    mod_text_start = 0
+    try:
+        with open(f"/sys/module/{mod_name}/sections/.text") as f:
+            mod_text_start = int(f.read().strip(), 16)
+    except (FileNotFoundError, ValueError, PermissionError):
+        pass
+
+    # Enable recording AFTER load, BEFORE trigger (avoids VFS/loader noise)
+    fcntl.ioctl(df_fd, KCOV_DF_ENABLE, 0)
+    buf[0] = 0
+
+    # Trigger the module's debugfs file to invoke test functions
+    trigger_paths = [
+        f"/sys/kernel/debug/kcov_dataflow_test/trigger",
+        f"/sys/kernel/debug/kcov_dataflow_test/rust_ffi_trigger",
+        f"/sys/kernel/debug/trigger_rust",
+        f"/sys/kernel/debug/{mod_name}/trigger",
+    ]
+    for tp in trigger_paths:
+        try:
+            with open(tp, "w") as f:
+                f.write("1")
+            break
+        except (FileNotFoundError, PermissionError):
+            continue
+
+    fcntl.ioctl(df_fd, KCOV_DF_DISABLE, 0)
+
+    # Read kallsyms while module is still loaded (symbols available)
+    syms = load_kallsyms()
+
+    # Unload
+    try:
+        delete_module(mod_name)
+    except OSError:
+        pass
+
+    # Parse and display
+    total = int(buf[0])
+    print(f"# Captured {total} words")
+    records = parse_records(buf, total)
+    print(f"# {len(records)} records")
+
+    # Filter to module records using kallsyms
+    # Build set of module symbol addresses for fast lookup
+    mod_syms = set()
+    for addr, name, mod in syms:
+        if mod == mod_name and addr != 0:
+            mod_syms.add(addr)
+
+    def is_module_pc(pc):
+        """Check if PC belongs to mod_name via kallsyms."""
+        if mod_syms:
+            # Binary search: find nearest symbol <= pc, check module
+            lo, hi = 0, len(syms) - 1
+            while lo < hi:
+                mid = (lo + hi + 1) // 2
+                if syms[mid][0] <= pc:
+                    lo = mid
+                else:
+                    hi = mid - 1
+            return syms[lo][2] == mod_name
+        # Fallback: if no module symbols (kptr_restrict), use .text start
+        return mod_text_start and pc >= mod_text_start
+
+    if syms or mod_text_start:
+        if args.context > 0:
+            module_indices = set()
+            for i, r in enumerate(records):
+                if is_module_pc(r["pc"]):
+                    for j in range(max(0, i - args.context),
+                                   min(len(records), i + args.context + 1)):
+                        module_indices.add(j)
+            records = [records[i] for i in sorted(module_indices)]
+            print(f"# showing {len(records)} records with context={args.context} "
+                  f"around {mod_name}\n")
+        else:
+            module_records = [r for r in records if is_module_pc(r["pc"])]
+            print(f"# {len(module_records)} from {mod_name}\n")
+            records = module_records
+    else:
+        print("")
+
+    if args.raw:
+        print_raw(records, syms)
+    else:
+        print_tree(records, syms)
+
+    os.close(df_fd)
+
+
+if __name__ == "__main__":
+    main()

-- 
2.43.0


