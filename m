Return-Path: <linux-kbuild+bounces-13545-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f524HWRoIGoM3AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13545-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:46:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1040463A40E
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:46:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=xNgUPgON;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13545-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13545-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6782530990E8
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 17:44:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07BB481254;
	Wed,  3 Jun 2026 17:43:54 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD9648033E;
	Wed,  3 Jun 2026 17:43:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508634; cv=fail; b=lG0CHsPzMlatTH7cNkKIfNuIh8uFxcQmpglrYAbf/UOBolPsnqK8Xb/1J+y3I3C/GVv5UPC7vTkmglHAnISwjyVFK6JAnUmnbXMAQ6BI++DXfpYOiL2T9klG9vzuwOjMZF5bfQ3vs5uK+ZObD8BVRI94W5xY62RQ2dKsBZarkzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508634; c=relaxed/simple;
	bh=+xfznbHFRNJvLBGos9C7SoS912geIXFu9E+d1ulriZk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=EFaUmkxsOLkTEiIUSYp8n/oSqI5+y3tm8HYnDSArYaxpZuJDimaMUq3X8PxDGN9TDyKb7d6g9ljMSJY9p6jb6KT0NegHZNaa0jDh/CN6ACNmnKj9s1v99jGFsL8xH9Uq/Tc2KZTJR3HDzwe7XP3ZiXrZTar8/qKf+ui/3F/Xu1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=xNgUPgON; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ee+nsSY9/k3B9nYsWl4/epf2HR3jG/tSeb4Qqioh434ell7ZTe/iNQ/i8KIIpcmbWpV98Xm3tAvSEFWQwobIb2FRO9fBLJ0/bOfNXoZT52xFt5Z9a9UmRZIDXIdPVQ5veOTYWNwapTm+BxUONFUAAisHnL6PfemrNYy79B3AcpunP01MQNN/CAcqRm7U/uUV2aRve2VOt/mY4cx3g9kEPPR4IP+cDb5617jJa+GOzCr3kLczbQnr3yb9IrAE7/kNwrE/SUmELENoM5dgKFMW4zqBmaa49Mnd4P5uGmJstwSPHId2IyqwTz+xweOStlkPDS+lg9kPvnopPbtVw8sbPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slWpyV6EIesdBTU3x08xAgpjvzLlNxHQ9EVVIiQq10U=;
 b=l6bJtOkmGPmAcnNi6QRlwdhZzvUMPctekh6jtlmNMChNPABI9gWm45TpTLUBzrRat9z4LUNj5xb71Ie939So01pO8ILtFxfF5aIejOortS9MaSVpyv7i/Cxtl6SnjR3tMiHY/bItnqpSWuQ00hpfahBPu/F39a/2hxdGb6b3eb4h65A2l4L4FJj6iU8WDnL5694X8sAdHTy15NMvKSpSvCENO07nvEZj98zy2LO3/mHyaX3RKc3ivjq5oYIMGYKxvZ9csPP6QP9qmzbIOIowdpWFUL++NrwJ7r4rmFJKdn4gw+/W3jWkCn2IQGTdVaYRm9oUtxEHhlG2mc1QetsAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slWpyV6EIesdBTU3x08xAgpjvzLlNxHQ9EVVIiQq10U=;
 b=xNgUPgONGFBWFJ6zml2k6gwbKPnk48mwjJsqDK1J0Ob1H13nSNAaSzfboAynNRbfPxlja4KdTtQqtj0VTMPyuIkmktZSQo6hlezD4FtWrFJSbnJaYpXkpdmYv1nBCFe5QAw/WWGFAo8CJtFQ6qPxevlB9HBisOTr5A1O6lxWgi45w7GqZ8BnOCWlZbO7LSWOyr0KIkxDRxH+Un0HQOw/zyQhxeQq63k+uak8sFSyXKo0bG9OqeqS3S71hLBaKK7kwrlPtULfYWk0z3TwwI7ShNBZiwgWk1HEE8pY9CGPuwhan1vfLn1g6Laz+eqFK5ktXQpSx4HdzNERu8/wuNupQA==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0929.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:43:50 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:43:50 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 19:43:30 +0200
Subject: [RFC PATCH v2 3/6] kcov: add CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
 and NO_INLINE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-kcov-dataflow-next-20260603-v2-3-fee0939de2c4@est.tech>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780508619; l=3118;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=+xfznbHFRNJvLBGos9C7SoS912geIXFu9E+d1ulriZk=;
 b=9FMDsEJt+OhekcfZrZygVatO9+mLVp0qgBpSjIispfCCGDZjErdudM4xSciLOvYzhMFUv1Hi2
 34WlN1apkMwDq+E28sZlYRSTIZbS/8nySnJxdxcl1hwUw0zzs6YZD3+
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DUZPR01CA0248.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::21) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0929:EE_
X-MS-Office365-Filtering-Correlation-Id: a087201d-afe2-49e0-3fcd-08dec197ac38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|6133799003|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	RC+zQYxpyT6lLGg9j/U9u5diBLe45GPXNpYS3gxE7J3gjdOLMnsuzwjIIMj3M85DCLFMWAnCiWGA7PfS0Ost4MBLbjYH/ytFDavXpSIKFJFCRWHAb0RjGwM98mAIOyYtkKGAlWsLHcn40hhWmHbFXVjVB7ie+Bw4rGYqLndM9rxQSkuqSSvUUbnI7YimCxjsmaigh5CFc2mLayVkObaBbj6N+LqMpGiG+vAb+PumQjVV6yCxLmFFbRTrh3Fvxu00I5EJJiJBxkLfvSlLOHRjVYjt01LCDT4qk+ilhs1VjdTL/BfUwi+0sZieFQIVg9OM5BCZ2320qrCWZYo+1FGKn0YznpxRzJpCpdSWRPaGyOgZpKumawnxBxpmK6lvZ6hKudzfHLaRiZhKSJcb6Y7SE92p78krh0PIqMS/ba1mCzUTUsXuP4+KuOgjNdUgjXby2fwYHONABfixjTkbMUW/1UFJ+Ye3aioDmibYUsARYdbFNpmJnU3MmICbQsxxLOEm1m+cPQtzxHbwBcaQmMLlxYt+bqqkbL8EHh283DIWE/Vo80cMpoUPcSmAtH5KLYZsXAuXFsto3EdFY7K7XC0KJIAAAif6GmA+XAwVG7nxEk5mZPfmP7knRVprtTKo1if/fFkq/D3V+ZpJzimrP4ZSKLaCDW0kbJLaKIBvpuksONPNygCorqnXYrRUikSsnY46G7ODluJi9AZiR5CbjXyP5dWObiAg7Tc/26Rd7r+Qcas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXA5SDIrYkNCdVlNUTVkY1dqTlFKeklWeDc1ZGM4Q2xRSE5neVNkZnBGT2N2?=
 =?utf-8?B?cFJ2V2E4TlBXVXFzQ1l5R2NJaFZpUENsUGR4NTA3VVloS2ZGMmRRdUQxS0Jj?=
 =?utf-8?B?bFJ1aHRZTlRDc09LdGJaSS9peUZ6WVFxMGpVZHBGN0IyS01NOEU0U2Y4T3VJ?=
 =?utf-8?B?ZHFZajh0ajZLK2RrejQyOWlSWUFOTWNEcWNYVE9ndElCL092QUJrM3FhdU9S?=
 =?utf-8?B?ODYzRDliSGkxKzlHS015c0d6OUlWUjZMNlNEWExUSVg0UkdiUTg2dFF1YmEw?=
 =?utf-8?B?QzVXMVIrUUFyMERwRzZoME9CVENUdWxyRXkxUlhIMzZLUXpjMGI3cEtLL3pC?=
 =?utf-8?B?d29rT3FYVm9HYi8xQkVicHpoUktZZ1hCcFFiQ0ltTkhxeWdHaFBBSXRJN1dE?=
 =?utf-8?B?bVVuU09sWTdKZzErSi93V2JIeEN6dXZqN3VqcnZEK25pM3hZd0RHaG8zYkJx?=
 =?utf-8?B?V0MwMzFpWm9UanFiUSt5UkdNUEg2eE1IL3FZdzRTSVhpUXN4eE5IdisrVFky?=
 =?utf-8?B?bVZxdU5aNWtlUkZkLzRYV0E1THNHZzB2N0tQRWRMSkR3RFMzRGpFZ3Q5MTZw?=
 =?utf-8?B?NlR0eVBUL2p4Y3NHeXg1NkpCcHU0NzY4S1BsNThFUWtNOXpDZ0FKcTBNS05Z?=
 =?utf-8?B?Y2dsTmtYT0pja2pTRFEvU05OWGt2Ri8zbFVvaXhIb09xbDdmWlFpL1dMdFcz?=
 =?utf-8?B?aUhjQVdXTkJBY3B4bE53VGk5bWQxZkFRKzNqQmVRWGRkMkZERG5BOHJUMU55?=
 =?utf-8?B?M0p6eGdSdjA5YzVWajNNKzhWZ2ExVmlkQ1hTZ05neGkzb0xhSlVQYzRFdWlJ?=
 =?utf-8?B?dm1Tc3V6OGJlMnZlbS84ZlNBdklCdVAwMkNHMDA3T3NqMDRrNVFSeEdiNXpT?=
 =?utf-8?B?RGJNaGF5eEh5bys0ZTM0d2luZWpVQ3cxamxDWHVCd0QyRnlWcW9qNlZBL3Y4?=
 =?utf-8?B?MWM1U3NkTnRXY05MNkE1TURTV0JwMzJxOVgyK1lQRWh0MVJXejZSNWFuejN1?=
 =?utf-8?B?YUlVVXdNeVN5M1pzU1ZPbUJWWHN1OUxkcER0ejhOem53SFBuY1YzS1IxU01N?=
 =?utf-8?B?blJoNmpFVk5NSktvTDlqcnUzTGJoa1BvOWpJM1laMjdhZm12a004R3FFclE2?=
 =?utf-8?B?bUxlTFpJSmg3ZlBrSXhTWWhGc3FZQ3NqSFc2MEVjMkx0RkxDVnFKRXp1SUxC?=
 =?utf-8?B?eDRieWpKTmRUeTJKMDIwTXFoMFpwMm9RcFFVWWNGTVl4bWFxVHZVNVo2ekRr?=
 =?utf-8?B?aUpWdFkzVUFlMFR5Zjc2VWtPV3hQWEJlU1Bxc3JHSi9GU0M2S0ZSUEcwSWxk?=
 =?utf-8?B?L3Axd29PcC9IcWRiWlp4a1JFa3NRRjRDRlQwMEJYMHJPSzNOaDVuNmRuTDJC?=
 =?utf-8?B?RWNvbkFScTEwcWVLMkp4aHRnTkZaUE1RQkhhd3hsRXlxSEVkbEZscUVtZUV0?=
 =?utf-8?B?aTNrQ0tMbSt5UFg4dWJ6dnM1ZFNFR0x5YUMxemxlbThkVmlKRDZNbDM3bWhI?=
 =?utf-8?B?YlhuankrVzE0aG5jaHdYUnRiTDJzNUtWUDMrNnhCd2gvbklpMENFYTE2bTBY?=
 =?utf-8?B?TTNSZ3VrN05aRFJ6RDdvSncrYy9XVHFYaFVqRG13SHlPbGJHd25pMHNWcnk5?=
 =?utf-8?B?amVzNWozV0RvUTM5aW5GZDkrZm5GbGUvdW9TRDNub0s1Z3IySzM1NGEzZTgv?=
 =?utf-8?B?NDJjT3hBciszZ0M4bUlpOU1EZVdIZGEvbGVqdWxadk5oYnN4Nk5xU0NSWmIr?=
 =?utf-8?B?YXY3a3E4SXA1bUIwQnh0RzB1TUJkemEyQkI3MnRzWEZtWmRLWnBGc05lWDBu?=
 =?utf-8?B?ZUM0ajVBYXhSZ3ZKUWtLWkVXdnBYYkRhaDZnekdYcWNxNk9WMGNXNlNFK0Vw?=
 =?utf-8?B?ZFo4QlFpMzhyc3NHWnhQSkVhS0xueHJnV0dqVnVXb3dTMWNUMCtQZjJmTGtx?=
 =?utf-8?B?WjRUdnhTYzZYa09yWUg3WkxxMVczWnFEblN1OG5iVUtBbGhwakl3dDBPN0gz?=
 =?utf-8?B?MmgvNEdTUVJIcnpGS2ZOekdhdkZlY3pNWlJZK1VQdTRNaUJ0dTVkOTFLTlli?=
 =?utf-8?B?Z2dCN2d3UnNOQTV4ZkNzMnBKUmZ2UGxlYnYvK0F4OTQvTnkyTksyZWRjMUNi?=
 =?utf-8?B?bElNY0ZJVW5oVXFtUmdwcVIvQ1JrS3pXWnhtQXZ5WmJuTCtvTUMxWGh0SDd6?=
 =?utf-8?B?enpIWHdTK0w5QS9ZcW9OaU5OckNsTHlXS251WVRQRW9CVHFHQ3pCREZiU1J4?=
 =?utf-8?B?NW9xWjB5ajdldnVEM0RjTTc5aVVUWGFvMmxSalJQYTVodnNhR0tlZXRZSS9r?=
 =?utf-8?B?dytCMnN4dHBEQ09Xc2E5OHd5SGtsQkt1UG8zZVhpaGRIK3R3cnhBdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a087201d-afe2-49e0-3fcd-08dec197ac38
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:43:50.7780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c05xihhwxUCfwtcIgTqhbym2hj8KOm9NyTMqneIWe5o4xuGG+tEVw2IrmwiEytLgquyN8tEm2FrdhOXn5MZaeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0929
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13545-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[est.tech:mid,est.tech:dkim,est.tech:from_mime,est.tech:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1040463A40E

Add two Kconfig options for global dataflow instrumentation control:

- CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL: instruments all kernel objects
  with dataflow tracing by default (mirrors CONFIG_KCOV_INSTRUMENT_ALL).
  Individual files can opt out with: KCOV_DATAFLOW_file.o := n

- CONFIG_KCOV_DATAFLOW_NO_INLINE: adds -fno-inline to instrumented files
  for complete argument visibility (default y). Setting to n allows
  global enablement without stack overflow or BUILD_BUG_ON failures.

Overhead with INSTRUMENT_ALL (NO_INLINE=n, KASAN baseline):
  .text: +9.5%, .data: +44%, boot: +71%, syscall: +133%
Comparable to KASAN (+100-200%) and acceptable for fuzzing kernels.

rust/Makefile: opt out core.o from dataflow (same as KCOV_INSTRUMENT).

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 lib/Kconfig.debug | 23 ++++++++++++++++++++++-
 rust/Makefile     |  1 +
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index abd1a94589aa..3b952b6361a8 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2261,7 +2261,6 @@ config KCOV_SELFTEST
 	  On test failure, causes the kernel to panic. Recommended to be
 	  enabled, ensuring critical functionality works as intended.
 
-
 config KCOV_DATAFLOW_ARGS
 	bool "Enable KCOV dataflow: function argument capture"
 	depends on KCOV
@@ -2283,6 +2282,28 @@ config KCOV_DATAFLOW_RET
 	  metadata, recording individual field values at runtime.
 	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
 	  Requires clang with -fsanitize-coverage=dataflow-ret support.
+
+config KCOV_DATAFLOW_INSTRUMENT_ALL
+	bool "Instrument all code with KCOV dataflow by default"
+	depends on KCOV_DATAFLOW_ARGS || KCOV_DATAFLOW_RET
+	help
+	  If enabled, all kernel objects are compiled with dataflow
+	  instrumentation (like CONFIG_KCOV_INSTRUMENT_ALL for basic KCOV).
+	  Individual files can opt out with: KCOV_DATAFLOW_file.o := n
+	  Increases compile time and binary size significantly.
+	  Suitable for fuzzing and security auditing kernels.
+
+config KCOV_DATAFLOW_NO_INLINE
+	bool "Disable inlining for dataflow-instrumented files"
+	depends on KCOV_DATAFLOW_ARGS || KCOV_DATAFLOW_RET
+	default y
+	help
+	  Adds -fno-inline to dataflow-instrumented files for complete
+	  argument visibility. Without this, inlined functions will not
+	  have their arguments captured individually.
+	  Disabling allows global enablement with lower overhead at the
+	  cost of missing inlined function traces.
+
 config DEBUG_AID_FOR_SYZBOT
        bool "Additional debug code for syzbot"
        default n
diff --git a/rust/Makefile b/rust/Makefile
index b9e9f512cec3..d122a65226dc 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -656,6 +656,7 @@ ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 KCOV_INSTRUMENT_core.o := n
+KCOV_DATAFLOW_core.o := n
 
 $(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'

-- 
2.43.0


