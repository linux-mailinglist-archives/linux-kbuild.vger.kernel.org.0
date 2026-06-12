Return-Path: <linux-kbuild+bounces-13724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VMl+KI+2K2puCgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13724-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:34:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5667743C
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 09:34:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=GmW+JPeq;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13724-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13724-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D23F31360DF
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 07:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB8C35E93E;
	Fri, 12 Jun 2026 07:33:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480A1360ED8;
	Fri, 12 Jun 2026 07:33:12 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249594; cv=fail; b=a3p+ZTtXePOgW3KNljGf7ushObqrzNbE7kT5qgciGNu15dlkSJbSwuFWjbOO2IHBSWdGi5wXZLYCR/z6lwyHwGRCqqihGVMpNgvFXwTKO9d2dorbF5YRw4zR7gYEx2im0SeR7cxkrU4frTzptAUMaPf5OIvd7FuFrTtvecHH5Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249594; c=relaxed/simple;
	bh=jHCJHcJkD0l53V4TpzADRcKi3n18Iczh77RLhm570QM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ryNcrwyYPD4pK/hhNLzQgyxyNAXIwA1foXVYvdAIxBQpluG86aLspkaufHMshuFzP9Hc4rqof8Yw52YrWfMYsh+V/RGRPDbXjlHhpicUrKzERZekn7UjeFbvuBhxvp7XeVkEtiwQyy+H/8rsTpuW056SZ38F4JvAgS/iLBok6zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=GmW+JPeq; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiyhmlBDAByfbtq8FjPr8ei2cJzcjVhlnBwIHANtXYtbKf4cE1xh7G/GnPzVbII+q3S6fyBcvGZ3nCPJNyqGENbmYdYNAkeE6TYNODX+xrhTgUdytvLwP42GXVJwF9D10DfiJ/fdS11R2DGbCc66IosCVF4TEsSOyqE2qZcA348CG3WeMKuT8RvnVpSv/vwTWTnb3ZkH0pNtrrPQsojUqHg+uIJxn3O9BwgspYUCZB6uGrOjoYOqr12RRBsXJ52afM7Mk9FPvYPZJXkjNf2AAHQ9C9qNCZVkPSzb9HiM2IJZXjEbEI6lxC2iyM/G5fvAs2AQW2e47tSbfvbBe3G0DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJq4fa9rM9uZEC7f3XuPHliifevdHTxzarBSl7UEpNI=;
 b=CLDO//Mvw61HH9DYpD6/PHYRIP6bIaBlY4WWa4Cq/1idWnjLsC+wlSmwAXDPlEHpnUctmmxFV3YdudRtmLw6Y2DZ6MI44fRrGjhjjYbXU0jFfvhB3ngUXTHe1fwPaYtxCZW4DY5sAXE7TbMrCHAUXvKri1R3wodSXJy6DFnZ4taJRfXxP2c2Pkr2rdsJ5y5T7CKSRHaVm6U7zGXJQP95bwyP2c8EW5GrwJwFfGOVDTCEl1CzkUKrFcbXStoh5V7f6GqSNU6bMRHikbrx0fYzYGskMnklNPPmW1vN1tP2o9XL0gFpNxx2mF+ILEvQJnP3y29X7HTU//xpXWM4thIWbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJq4fa9rM9uZEC7f3XuPHliifevdHTxzarBSl7UEpNI=;
 b=GmW+JPeqULf2M8M/DKFHqKideOA4cVBXSmR+4JW7BKhPNBlYLDcpr6VtlrNiPrdWIIVzLyz5jaZXo9rUqxhZYO6n8oo9ThnCMqHjnEWyQ2L2LvvcdVTfxIp8b0yle5ya0khhlHbebyMd5VouIMP6JCK/3Yc2rGf1LDPuEjYDiqp1utDSKtcZhxGUyfFFr53gBAe9SUbhqfKhP6tYvWj7dHCzCPNS/OiZ3zl1xLtB2As8ROl0lCpX/DPKvjlu1iK9Dpxh9kJ8CKnn9Lbxk63bgQN44EsRps8XN6n0PmzuwQpKcsZYhNJVwwikoivZdEqrm1lHQly9ZLnnJ7EbHAfv0A==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by PAVP189MB2620.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:2fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 07:33:07 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 07:33:07 +0000
Message-ID: <2c655653-88d7-4717-98f2-94e51cd457ef@est.tech>
Date: Fri, 12 Jun 2026 09:33:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
To: Alexander Potapenko <glider@google.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Dmitry Vyukov
 <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 Yunseong Kim <ysk@kzalloc.com>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <CAG_fn=W1++qPJWQk1+4MtRfe6n1iUKF2O5pddnqKGwSq85CuqA@mail.gmail.com>
From: Yunseong Kim <yunseong.kim@est.tech>
Content-Language: en-US
In-Reply-To: <CAG_fn=W1++qPJWQk1+4MtRfe6n1iUKF2O5pddnqKGwSq85CuqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3PEPF0001DBFC.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::317) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|PAVP189MB2620:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e745ec3-3eb8-4f2c-5bbc-08dec854d8f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|18002099003|22082099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4AgIUqRVzO92Ncj0sRWqc6O94hUQRKGNBwyzyoCy2/tIGnt5dYq0EadzsQ8SthvThLEfhfYZk4SoQYIvPhmVdUGmrNOLqWHHLfFAL3DhBcHLir5JDjyeiXpX+bWNJ1YA/4cZXXuw+DBCsVOgfWEypeBAksw7Nj/+XAXxqXejnW44ThvocTR4tlzQIZkArntEphtiBo4BCOPJi9rk1jsNZNsmJ6FHUv66QgFMYUaqfhi5jfyIOAYSyowxWwyw/QB4/mD3w28f+G6PKt7s4Lt65keL2b0kD2/oFrl+BcA/dDo91Xx/0r3eyHU3uVXYabn/+NBtDtPj1lo958y5dg3rOcoERDBkX/2/YuKC9OoQsRnGAOZx74lkNv+uGodR+FyUYz4ezla8LIm3NsqpjRmo6P5TVSWtHtOH/mouI6inn/8IZUXHrRku99rGkO27paT9BDZUlDq0MRjNyqaFuSDc5tEoY10XhAL4PTIexegGHnntAHzGvTYSW+D2n8g/mGqBz6X2n7lDoeCnhy8MQwcfrFC++AdA7BmondxRqWHTpf2aZvkpNRuGC7877e4/YKbT0COQF6C1ZCA68V0qpcHS6llIIlLEDRe9a92OCgxGgjive3SjtlJjI4lJe/cn8k6AYB0gGefYyqScBeFe2oHkFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGxGcDBkdllCRHZ5SXRhd2NubXVPWGtRNk15TnRLTzNDZy8vNHdYY3d5ZEpE?=
 =?utf-8?B?K1FmcGJILzdzY082U1g2SG5KdUF1Z0ZlRUlSMFRHa2xQbWNxS0o1eVZqR3Q1?=
 =?utf-8?B?RllaRmxzT01ZME1mTzl4NERGdStJdUlONnpNeW9tRU9uSWVzbTZVRndBa0li?=
 =?utf-8?B?azdETFlPMVlXVVRqRTVMNkNodlMvaUxWcTd6b3Z1OTVUUFY3Zmc0cG1mM0xL?=
 =?utf-8?B?MG1JREZWaGVWVTFTUGZsc0xqNGk3cjNTVzlNcjlLOGY0SHAveExhRHROZUNj?=
 =?utf-8?B?Vm95TFppZGRqeFQ0RVlmVUdaQ0R5RWdUYVdNeFpVdm1PcEhuVERDZVBLcmxX?=
 =?utf-8?B?dzYwRW1CdGl2ZzJpengxdGpYVUZRZmwvcExGMTM5Tjh4VDVtUXZEYlhIQVV2?=
 =?utf-8?B?d0h6R2lGSDVVNzNIbUZWSjhDVHFVbTlaQ3pVRkVZcWNnS0RGMzFyQXB4UU5k?=
 =?utf-8?B?c3d0Z20xejVYQi85MjVxcERHb3RHRXFOVFE1dm1EM0l1dC9DcXNycFFneEx5?=
 =?utf-8?B?c1NqMks0L0l0RXE0amZHRlhuVGpDc1FCYzIvcnZERVRJR2F6RDBlQStBWmpv?=
 =?utf-8?B?QS9VejlDNjlzd2NHZm9FRVVXdnVRMnhFTzdSbk01UTlCTHZpVHM4ZWM5MHlm?=
 =?utf-8?B?Z1cvdG8rZzM2ZVFGUkVDdjlTdTZWOXpiZGs3dHBlTzV6NmhzYUtiT2dxR2Fu?=
 =?utf-8?B?UzgyaE91eUZXeXM4OUJBelBrWFhLOUZCQ2RHMlVpaEM4WVNmK1JQeEZFRVFX?=
 =?utf-8?B?eEFqNjN4anB6dE9vRnVLN2t0VFViOGdnWVc3R2x6dlpHZVFycVZtVmR4VzN3?=
 =?utf-8?B?cUdwUnhtSmlyMmZyTVBPN3d0dTRqVDMxbjhoTFhiTmF5eWVYcE5zNHI4UEtL?=
 =?utf-8?B?TnBueGE1SDhlNmZQUDBGRFNXbGxJVVg2UVRQRWpkV3Bma1EyaTN3SW9CR2FE?=
 =?utf-8?B?NjdzbUFzZVdmaW9Sb3RQU25JYjFlUWhGZ2JpVmcyaXNoUW1oN3prbWlqWU5t?=
 =?utf-8?B?S1pBYmd6RTlTSTVPQTNoRytYbC9uRU9Vcngzb1Y0eVd5QUZ4bHp3aTZDSzFj?=
 =?utf-8?B?SXhzUDA5MTg4NXFESHNoL2s5R0RjVjdUOGN5SjB5bUh0K2owYUxYS0FUWGpm?=
 =?utf-8?B?Wlo2TFhxQTcvUEc0SUoxUG53ZG5wUUV4M0Z0enBHZWQ4d20yV1dTTnFqcU1M?=
 =?utf-8?B?MkRhL0dOaUNaRzhkdUdOU3lLMHZZenMxV2tEaWdURlR5OXZ4aTN1UHJqMFQ0?=
 =?utf-8?B?RmNTdUtnUFF3dEtoU01Mek1EUm5WWmNQZ3E2WGswZ0JTSGx2MUsxMGxHaVJz?=
 =?utf-8?B?ZTZLSWpQTHVZNHJadys5L3FEYVc4QzYrUUhJcnNxWFZIeW5vSVRDNXNxeTV1?=
 =?utf-8?B?N09yVDdrL2hSQVBGOHZNWE5WZjc4ekRITEFNaTFlc3ppQ0R4Z280ZTJwZGtL?=
 =?utf-8?B?eXBEN3ZOU2tCa2JQYTN5U28wMEtiUVVWS3hIZUxpZVR2MlVMR0NYQVdJdVhR?=
 =?utf-8?B?MDJxekk2b2x1OFRqVkVXSHh1NnoveHA3a3Y2TVpTMGFUREU3eDVEd0hzak5U?=
 =?utf-8?B?SDlMWk1UN0Focm5FeHNRTHVkRSsxcGEweUhDR0JoZUhURG83bHh5NnFMM3dP?=
 =?utf-8?B?MTlXMWxuYnR5YzNJSE1pOGFpZXh3R2YrL2hIQ2IrZEt0S0JDS0p3R0laRHhC?=
 =?utf-8?B?c3BpSDVZaElaSG41enBHcVQzTzR0QzdsRkV4MXNNcWVNaDZkUWhwVm1XeDNz?=
 =?utf-8?B?clJXellRMlhXbzN4SEcyaWkzQTBGck9VVjMwUzZQK3g3UjdsN2k4MjM2WE8z?=
 =?utf-8?B?cm9RWEQ5dVY1VUUrUW03Mml3bUl1ZG82T3RmOHRUSVVTNnVFanFjS1JXZ2pM?=
 =?utf-8?B?UGhmNytKcDdNN0pYZWlTWEluakhMcVZ0SEVqUkFpNXBBVytNcFhlMG15SmRX?=
 =?utf-8?B?S2JNVnpOU0RwNHh3Rk1uV1M2ZWsrR2JJUlZ3a0t3VDMrTkswVHBFT1N0UjlB?=
 =?utf-8?B?WXdsT1M2S24vQWZ1NG12c2w3WFg5V3ZNMVVRTk5ld0h3bHlUMXc1QzNRSjdN?=
 =?utf-8?B?cVZXZEtUUURGQ3VFalRZdHdpcFI1cmNjMzlXMXVYbFloc3N2RHBsc1dDUmVB?=
 =?utf-8?B?d2l1RjhPVUxLMW5vVHA4d05wbVZjNHJOM0RobnBtZkpHOEhkdXc4SnEzQWV4?=
 =?utf-8?B?VGNOL0p6amhNYkFaWkh0K3R2eUtaMzZicTdUY2pRWXR3a2V1TktKallOeTRN?=
 =?utf-8?B?b21rQmIxNVozSFVNbkFEeGtHN2FsdUR3a3lBUUo0aE5jeGIzQWEyc1NzUDB1?=
 =?utf-8?B?aTd3SzUrZVJ2cnhsZnA4NzBDL1Z2YWV3SDIzL1hnWk1JTEVSV1JEUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e745ec3-3eb8-4f2c-5bbc-08dec854d8f5
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 07:33:07.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpyvbxylVbs2owF94kzlFSitwc8IYc3a7Vb7j5NAXdKP+MRQKvnwe2su3oMWyrvlyR0sh1rQrctH6nn+NNgRjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2620
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13724-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:glider@google.com,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[est.tech];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[est.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43A5667743C

Hi Alexander,

> On Wed, Jun 3, 2026 at 7:43 PM Yunseong Kim <yunseong.kim@est.tech> wrote:
>>
>> Introduces a new KCOV exetened feature that captures function arguments and
>> return values at kernel function boundaries, enabling per-process visibility
>> into runtime dataflow.
> 
> Some high-level comments:
> - Make sure your code can run on every platform supported by kcov (namely ARM64)
> - Check out Sashiko findings:
> https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4%40est.tech,

I handled those parts that seemed problematic from sashiko's review.

> at least some of them seem to make sense
> - Please consolidate changes to the same file into a single patch
> - There seem to be two tools (one in C and one in Python) with
> overlapping functionality, can you keep only one?

I revised this part in v2.

> - The test modules seem to be used only in manual testing. Can you
> convert them to kselftests or remove them?

Thanks again for yout guide, I've updated it to v2.

> - At this point, long dashes in the kernel codebase are quite rare,
> and I don't see a reason to add more.

I checked that the v2 series patchset was removed, using long dashes.

Best regards,
Yunseong


