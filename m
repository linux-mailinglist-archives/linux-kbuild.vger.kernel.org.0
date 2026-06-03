Return-Path: <linux-kbuild+bounces-13543-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FzmtKbxpIGpj3AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13543-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:51:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B41C063A482
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 19:51:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=DUWAmEzz;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13543-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13543-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36969301F5FA
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 17:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F74445348D;
	Wed,  3 Jun 2026 17:43:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ACF3E2756;
	Wed,  3 Jun 2026 17:43:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780508631; cv=fail; b=K9CCPFcygoRXx1QzGQnyiT3aEiTRbuizfB/Q5dIEvV/T1WKV18xKnoLWDEHSmVGpWjnNorwnPgUzW9lEXUaqTARRtt+LnMJiKen7GvmawkFMf8VI32WX9AO/VRAw2qE0FpaZBY3erh3ezmtn6McRb6/tfgY9wWiaoT83/gBh8SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780508631; c=relaxed/simple;
	bh=jnlv9+N8aPMj7C7Ic/VjPezCllbBd0x72BlUlp0oOig=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mYyx/a+DR5GKvS+9m2d+/RN118YxIJ8A14QoSHJWJKSRN2Zw7pRQxGqkA1LK3rYTDXAy8auHp1AsP+83ILVoKtQkmckeAd3nZs8dRK3/knRl44ge6FY3WNZIUDUZHkuZG/bwzx8HC5rKujaL3MLghAFPXYBACUXl+Ty7O0vqJyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=DUWAmEzz; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5pal65YgecFiRWOOXy9qqC+lPIp+HHPdig0jqlv+783obaL16CLAZGHnhb+oE6JCqy8KRnWBUIL4kaCi9LQR3PSHXiqbPQtZdsaxcMmlBpZ5JT3IyHm2TAoilLjmQtY5zIjNdBpq7NaoQqUAoRNTfft3cMzD6wPZwCAevaTOilhSUoESxPIdWDrEb4i6K8g3cR0XGndYwBpGN6597Sf0vCOKoi6YCtgOdSROowoW3Hrq3XijVkvGiKjq2JYVrsfFTLxfW8XdqnZ57TU24FLgD7QK2+qyO2ljddAaqC8WFS0/eCoxD5IyrL4YkzOdzYC2BcLDoKgTKn8wt4ZmifmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rryPoMmjtSeV1PWkE072O4wQvVTYtimIeSrGkK8+TLE=;
 b=espK+Hygz6k40VY+PB9yvb/TvBzfFiGZrzmnTCSCxrFcvgaX1dmY7VXBiw3SC8s9FvWAzJWZKhgrkqm6BtH5O42hH7xa8YpwU/lKTJBclbSI5Gba3d+5iBlJ2tg/5d9hxKdLu0gbhCY2GwIWDGVBg760tTbd6jhKxKMIirL8PlTYbOXc0RCUowQ7MR0ZKYh4FeKBKfmZBQkzfKuq7X7+NjtKdAiJeCsMRoXiVdofgtOoxz23CD3t8fyw7kOLMw7XHv1/whB/HoqymSJW9j0yw3/uGnB+pDEid2GeL+HKUeSmO99ASafZOJTKVqx5+hpsJgw9c5b3Q0neRuCpI9P5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rryPoMmjtSeV1PWkE072O4wQvVTYtimIeSrGkK8+TLE=;
 b=DUWAmEzzgvMJ6aI/i2HqbEheNf5gaynJje8n6/a4V2XposZHsmOOHJhiWmcgCwNSzeChQQfGSsaVsdsW2MNbWz6QMrQA2fiWhwmqmpmFzUsI6FgBc1Eqv8zjLXXyz/GmkAltSQW8AomFZrlY1O3B+yDRVCwZi+nydD6vk5HUrJoGrrg43jpSgA3itHblgT90nSuRnQnbHCU7sEiE4sVuCoW71r7zTqProbXR245HSHCOHIq2EUI5YoPGqNq3T4GwzopBqkL6u/sEaLxjm3Y4jJJbWhu8HTkE9avgmcxu783CE6uACMBb2IInxyV8LHovvahcd5845HAgfu/DGR2TeQ==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by AM7P189MB0929.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:43:46 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:43:46 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
Date: Wed, 03 Jun 2026 19:43:28 +0200
Subject: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780508619; l=12529;
 i=yunseong.kim@est.tech; s=20260426; h=from:subject:message-id;
 bh=jnlv9+N8aPMj7C7Ic/VjPezCllbBd0x72BlUlp0oOig=;
 b=F89hT1xNZgqviKpqwwcQYMuNYZHP3nxcRJaAeY/Kht1QJasEYuPb5AzirkF4FCVn4VAZ64Ieg
 t8xuGyONezJBFHBnv4RYQH2N0C27XvutuCmBM17d+azFTN9I9NlaaVL
X-Developer-Key: i=yunseong.kim@est.tech; a=ed25519;
 pk=1nBUX92cvTaavYG1+MR073D+XMKhdOciBZcnf6h6qEo=
X-ClientProxiedBy: DB8P191CA0027.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::37) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|AM7P189MB0929:EE_
X-MS-Office365-Filtering-Correlation-Id: 0381af3a-769a-483f-b513-08dec197a90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	L30Y8vJ9U7W3oMjivMj4TeeRXipPqh1Kh2zRidRDvFq+Cpe9BIulKha2P/Y7UDfWX3hQ7RIZUEcnIFJvCBa8qR78HPLYYKWOy7yNNp4XmhA2tS3Uub+8uNBGag6ILiY8Ys3hfCcsjLHbA/js2dcXYFwmi8J8MoYMPZoYWIKoeu3GhO3yOhMFXG5Q7BfjV1VWFBdWif7sOih/+WFYkBZNiPY+v25XSGvQTCNkdO18F5e+jeXa8FLT/47/HdotlnrK2lVpFPTPXCe6OIU7e1sILw1JqP9CKzsEnJuSdLLUCpdi9ADvw2SN/W3pvxfj8NXTTkflMxnP3zcdKvCFfLmiFdmsRsYOKhFZyMZ7T+2hCv/wr8e0o+rGuSit10n7Qq6HIhEtlyIsn72InIuIGFCe/k/ZdcMnS7fnpvhLSRC0lTK72DlD93jSLAa/z/2DCZM7sG/uzNHQssQgJ0iC7yYT4rsjuUsMFdFKY2lHRykNKAdGyrxQGxAZCxQit91H1AUxHI1+lyErkyxbiwtju2UZ2mk72dblEgkkC1EqMg62KpJlbmdGOBL3vWnyfqXiQWixT7H8CS09jpKp8dMLB7ld5BK81/1gXSmeAGmIHCDsl2oO9amS4w55nIT8svuILEqJinX48OZXvUxWD/p9eq/s76TYtoSfa1Neepax6ImXQ5eJZ3qW8XvayY/LYDTgC7OkXYAaK54iwYC9LJ1vKTkI0gY4S+auATbHbVjcMRoSkTA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW5IQUpUc1NMbXNUZGovemlUdiswVG8yRTd6MVFtM0JKU29mRHp5Y29GeWNt?=
 =?utf-8?B?VWEzQXlCTFNIL3FCMXlMd3prNVBUS0lDQ2ZCVW41clRmTEgxTlU0ZGp1UUl4?=
 =?utf-8?B?cThheEU3clh0N205SmVPdTRKZkU4NmVyRFE1Y0ZJVm53VlZ3K2RtUUtjZHd1?=
 =?utf-8?B?L2h5WWgzN2lRR0l0Znoyd1cxK1Z5VFAxMUdjeFhtS2tiS2trVi9KWllRWEpY?=
 =?utf-8?B?WlNWSC84RTg3NnZGMVNCQXB4c0h1ZHVyU2Nod3F0bjE5eURJdzRZeFFwZlJ3?=
 =?utf-8?B?eVRENTBQWVZBdVV0cXIvRVlZSEdSMjExUzBhYVB5eVBrZ3Z5cU9VVE1TQ2U2?=
 =?utf-8?B?d3RxMC8wVmU0TjZROFBoZU1LVTRPRnpocldBNEpXQzNMOSs1a0VMdXhEREs1?=
 =?utf-8?B?amE3dHgwWVVaZUlxUURjVm90aDVJTHd6dlZDdUIyY09uVHdPTks5NlpmMTVu?=
 =?utf-8?B?cDRqVm91UXJGa3dSRUJrZ1FNYUE2UFFqOGVoMmIybG5lckluNkp3OG5hajdp?=
 =?utf-8?B?MCtIdkVmUjA3TWFRTExkRWhtYmxnM0VhRmk1Z1JUNkxZYkdZbml3RjdHTHVE?=
 =?utf-8?B?N3Q5RnYxNnNmUnR1N29ML2VGU1RDTlV1UVV6dnkzVHE4MndzK1ZKMnRvaVhC?=
 =?utf-8?B?Yk9rdU5JWUF6NWsrRVdhTExWZ0MxZG5STk5CYUY5b0lNK2llWi9mVkwyT2Z6?=
 =?utf-8?B?NkFMNGxoRXJHbThrZjRTUE1INFErMllrbUFBRTlnTE5Db1V0WGppZ2JTdm1y?=
 =?utf-8?B?cGNKTW5CZWNnYVdUOVp3NDJ4ZkRNVDd2V1VOTS9uUDl4UlYrbkljdWx0L1FG?=
 =?utf-8?B?UEthMUd1cEtXMGZJT3IyWHVsakdabWNQZ04vbnpCM3E1OWhCbGdqelE3eXFO?=
 =?utf-8?B?T2pjSlArNHNZNzRxWXVMUE1xNVlrZUhWR3I5U1NKTzlodmYrazJ0cjVLalBL?=
 =?utf-8?B?TCs0ZjZrR2FEbUNOZnFpL01MYzdmMll0RHlNWGFCOFBaR1pMV1hwK25BTmlL?=
 =?utf-8?B?aDh3S3l4M0d1RG9ZUmM0a0FSMDFWaW1iTUZqZkp0VU9rS0QzZlkrUUZiTWZr?=
 =?utf-8?B?QXRUUVFkMUlMd1U2NEExcGJLSmMrTndlbTlXRzJMQ25BVlUyV2FwME1DZ2Rl?=
 =?utf-8?B?SERSbnlRbUZoT21jRmVnUUpFaGNOS3QxL041N0t3cWVVeHk5eC9CaWRtS0RM?=
 =?utf-8?B?L3FHV2Nia3U3YVpjeEQ5NGtmQzFQaDFvNFBzeUxFQlEra25ocGtob1RPTE5K?=
 =?utf-8?B?QnR4aTk3S05DLzhSOGc4Smh4UTF2d24xY3BMUDk2dGg2SjlyaGczQ2xuWDY3?=
 =?utf-8?B?eStmdTVKTXhMckwwOE05dnQxeGFkN3hZbEpaR2svN0haZW5nNHZlaTl3Wlo3?=
 =?utf-8?B?NlByNWY3RDVSak12eTZnanZLY2twM0NSekVIZmpXT1Iya2NPbldiY3YwK1oz?=
 =?utf-8?B?QzJTSEZaV2ZRL2hyczR5SDJSYk5RRk8xaVM4MGNtdFNEU1hJOVdYK0ZtcE9Q?=
 =?utf-8?B?MTc0K0hXZGl3alRUNUIwUlgvVFN1VlBtWHJtWkMyU1M1b0w3S3dhOXJnRUpx?=
 =?utf-8?B?REwyRnFnV3NFK1I4OUhnbzEvMXF1YXB4aTJqTk5QK0IrUDEwcjFSckUrSnlB?=
 =?utf-8?B?dks5N0xCMDRHaVJKeW5vMmJyd2VRSWlsZ2poRzYxdVNQVUVKNjRIVThqa05u?=
 =?utf-8?B?d1BBSUc2RUpVUlFNeTUwcjV3T2ZROFl4Ty9ubE1DWm9xc1haL0lybnFHKzRB?=
 =?utf-8?B?Zkxua01wbVk5anloWmxVQXVIMHpZeDBCTUVHdjdSZnJQbHZ3NHZ3WWFJWDcv?=
 =?utf-8?B?K1FmVGtCUVJQZThTNkd5akRwc0hpcUc0YVVmUkh0R20rOGhWM1pLdGwvOCtZ?=
 =?utf-8?B?NzNaS3RNYVFOYmgwM0NpRjlYc0gvcngxeU1IZ21zZXRWcmVIcHh4WkRDRnhQ?=
 =?utf-8?B?V0xjNGJjZXBJMml0K01Ub0V6cUZSWVo0c2JaSXQ3bzN3V3Z2K3ZSMlc2VVVv?=
 =?utf-8?B?a0xHWHR6ZzBkbVl2ZFRJdXBxZStwMXdTNWhsYTdWUFJwMjJjd3RHZkV6bU5D?=
 =?utf-8?B?dXRDaStJLzlDRiszQndUNFdBWE5rcE1RQUJsbHZYM1VpWUoybjR0R0ZtV2NT?=
 =?utf-8?B?Y25MM0JNbHhlem55cXlkdU1uYlRxZGIrTS9tejYrS1dhVStKQ241SHRaTTdQ?=
 =?utf-8?B?YjNsQmdDVGRlcFp2WnVZYVBVVDBzQzlaTW8yOVh2UWFJSmZFWTB0WGdCOXhz?=
 =?utf-8?B?TVhMTHRmdHlUb1NDTE5vODUxbjNUR3kvajBmMXNlWUcrTzMyWWVNYTc1Z3Ni?=
 =?utf-8?B?T0Vsbm1acjVxa3pwQzRjTEpuVnRpYnhvLzZUWHNHNjZjYjNVNnJMQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0381af3a-769a-483f-b513-08dec197a90b
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:43:46.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoh4cKjmkDczsw7rWGFWh2mTgfB+HwqHaGgJKAcK6eB/2eKiMQ6uv2DwzgvuBrtXMnQxaNOzaOF7fOGQvC6lUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0929
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13543-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:yunseong.kim@est.tech,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[est.tech];
	FORGED_SENDER(0.00)[yunseong.kim@est.tech,linux-kbuild@vger.kernel.org];
	FREEMAIL_TO(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B41C063A482

Add a new KCOV subsystem that captures function arguments at entry and
return values at exit, with automatic struct field expansion using
compiler-generated DebugInfo metadata.

Key components:
- CONFIG_KCOV_DATAFLOW_ARGS: enables argument capture
- CONFIG_KCOV_DATAFLOW_RET: enables return value capture
- /sys/kernel/debug/kcov_dataflow: separate device from legacy kcov
- Ioctl namespace 'd' (KCOV_DF_INIT_TRACE, KCOV_DF_ENABLE, KCOV_DF_DISABLE)
- Per-task buffer: task->kcov_df_area with atomic xadd reservation
- Fault-tolerant: all reads via copy_from_kernel_nofault()
- Recursion-safe: notrace __no_sanitize_coverage noinline
- ERR_PTR aware: skips struct expansion for error pointers

The callbacks (__sanitizer_cov_trace_args/ret) are inserted by the
compiler when -fsanitize-coverage=dataflow-args,dataflow-ret is used.
The Kconfig options depend on cc-option to verify compiler support.

Buffer format (TLV records, all u64):
  area[0]: atomic word count
  [pos+0]: type_and_seq (0xE=entry, 0xF=return in upper 4 bits)
  [pos+1]: PC
  [pos+2]: meta (arg_idx | arg_size | ptr)
  [pos+3..N]: field values read via copy_from_kernel_nofault()

This is completely independent from legacy /sys/kernel/debug/kcov.
Existing users (syzkaller, oss-fuzz) are unaffected.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 include/linux/sched.h |   8 ++
 kernel/kcov.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/Kconfig.debug     |  22 ++++
 3 files changed, 321 insertions(+)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index c4433c185ad8..03be4b495f70 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1533,6 +1533,14 @@ struct task_struct {
 	/* KCOV sequence number: */
 	int				kcov_sequence;
 
+	/* KCOV dataflow per-task sequence counter for TLV records: */
+	u32				kcov_dataflow_seq;
+
+	/* KCOV dataflow: separate buffer for trace-args/trace-ret */
+	unsigned int			kcov_df_size;
+	void				*kcov_df_area;
+	bool				kcov_df_enabled;
+
 	/* Collect coverage from softirq context: */
 	unsigned int			kcov_softirq;
 #endif
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 1df373fb562b..d3c9c0efe961 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -353,6 +353,288 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 val, void *arg)
 EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
+#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_RET)
+/*
+ * KCOV Dataflow: /sys/kernel/debug/kcov_dataflow
+ *
+ * Completely separate from legacy /sys/kernel/debug/kcov.
+ * Own buffer, own ioctl, own mmap. No printk — buffer only.
+ *
+ * TLV record layout (all u64):
+ *   area[0]: total u64 words written (atomic counter)
+ *   [pos+0]: type_and_seq (0xE=entry|0xF=return in upper 4 bits, seq in lower 24)
+ *   [pos+1]: PC
+ *   [pos+2]: raw pointer | (arg_idx << 56) | (arg_size << 48) for entry
+ *   [pos+3..N]: field values (or scalar value if num_fields=0)
+ */
+#define KCOV_DF_TYPE_ENTRY	0xE0000000ULL
+#define KCOV_DF_TYPE_RET	0xF0000000ULL
+#define KCOV_DF_MAGIC_BAD	0xBADADD85ULL
+#define KCOV_DF_IS_ERR(p)	((unsigned long)(p) >= (unsigned long)-4095UL)
+
+/* Ioctl commands for /sys/kernel/debug/kcov_dataflow */
+#define KCOV_DF_INIT_TRACE	_IOR('d', 1, unsigned long)
+#define KCOV_DF_ENABLE		_IO('d', 100)
+#define KCOV_DF_DISABLE		_IO('d', 101)
+
+struct kcov_dataflow {
+	refcount_t	refcount;
+	spinlock_t	lock;
+	unsigned int	size;	/* in u64 words */
+	void		*area;
+	struct task_struct *t;
+};
+
+static void kcov_df_put(struct kcov_dataflow *df)
+{
+	if (refcount_dec_and_test(&df->refcount)) {
+		vfree(df->area);
+		kfree(df);
+	}
+}
+
+/*
+ * Core write function — no printk, no locks, just atomic buffer write.
+ * Called from __sanitizer_cov_trace_args/ret in instrumented code.
+ */
+static noinline notrace __no_sanitize_coverage void
+kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
+	      u64 *offsets, u32 num_fields)
+{
+	struct task_struct *t = current;
+	u64 *area;
+	unsigned long pos, max_pos;
+	u32 record_len, seq, i;
+
+	if (!t->kcov_df_enabled)
+		return;
+
+	area = (u64 *)t->kcov_df_area;
+	if (!area)
+		return;
+
+	max_pos = t->kcov_df_size;
+
+	/* Record: header(1) + pc(1) + meta(1) + fields or scalar(max 1) */
+	record_len = 3 + (num_fields > 0 ? num_fields : 1);
+
+	/* Atomic reservation */
+	pos = 1 + xadd((unsigned long *)&area[0], record_len);
+	if (unlikely(pos + record_len > max_pos)) {
+		xadd((unsigned long *)&area[0], -(long)record_len);
+		return;
+	}
+
+	seq = ++t->kcov_dataflow_seq;
+	area[pos] = type_marker | (seq & 0x00FFFFFFULL);
+	area[pos + 1] = pc;
+	area[pos + 2] = meta;
+
+	if (num_fields == 0) {
+		/* Scalar: read value from ptr using size from meta */
+		u64 val = 0;
+		u32 sz = (meta >> 48) & 0xFF;
+
+		if (sz > sizeof(val))
+			sz = sizeof(val);
+		if (ptr && !KCOV_DF_IS_ERR(ptr))
+			copy_from_kernel_nofault(&val, ptr, sz);
+		area[pos + 3] = val;
+	} else {
+		/* Struct fields */
+		if (KCOV_DF_IS_ERR(ptr)) {
+			for (i = 0; i < num_fields; i++)
+				area[pos + 3 + i] = KCOV_DF_MAGIC_BAD;
+			return;
+		}
+		for (i = 0; i < num_fields; i++) {
+			u64 off, sz, val = KCOV_DF_MAGIC_BAD;
+			void *fa;
+
+			if (copy_from_kernel_nofault(&off, &offsets[i * 2], sizeof(off)) ||
+			    copy_from_kernel_nofault(&sz, &offsets[i * 2 + 1], sizeof(sz))) {
+				area[pos + 3 + i] = KCOV_DF_MAGIC_BAD;
+				continue;
+			}
+			fa = (void *)((unsigned long)ptr + off);
+			val = 0;
+			if (sz <= sizeof(val))
+				copy_from_kernel_nofault(&val, fa, sz);
+			else
+				copy_from_kernel_nofault(&val, fa, sizeof(val));
+			area[pos + 3 + i] = val;
+		}
+	}
+}
+
+#ifdef CONFIG_KCOV_DATAFLOW_ARGS
+noinline void notrace __no_sanitize_coverage
+__sanitizer_cov_trace_args(u64 pc, u32 arg_idx, u32 arg_size, void *arg_ptr,
+			   u64 *offsets, u32 num_fields);
+
+noinline void notrace __no_sanitize_coverage
+__sanitizer_cov_trace_args(u64 pc, u32 arg_idx, u32 arg_size, void *arg_ptr,
+			   u64 *offsets, u32 num_fields)
+{
+	/* meta: [arg_idx(8) | arg_size(8) | ptr(48)] */
+	u64 meta = ((u64)arg_idx << 56) | ((u64)arg_size << 48) |
+		   ((u64)(unsigned long)arg_ptr & 0xFFFFFFFFFFFFULL);
+	kcov_df_write(KCOV_DF_TYPE_ENTRY, pc, meta, arg_ptr,
+		      offsets, num_fields);
+}
+EXPORT_SYMBOL(__sanitizer_cov_trace_args);
+#endif
+
+#ifdef CONFIG_KCOV_DATAFLOW_RET
+noinline void notrace __no_sanitize_coverage
+__sanitizer_cov_trace_ret(u64 pc, u32 ret_size, void *ret_val,
+			  u64 *offsets, u32 num_fields);
+
+noinline void notrace __no_sanitize_coverage
+__sanitizer_cov_trace_ret(u64 pc, u32 ret_size, void *ret_val,
+			  u64 *offsets, u32 num_fields)
+{
+	u64 meta = ((u64)ret_size << 48) |
+		   ((u64)(unsigned long)ret_val & 0xFFFFFFFFFFFFULL);
+	kcov_df_write(KCOV_DF_TYPE_RET, pc, meta, ret_val,
+		      offsets, num_fields);
+}
+EXPORT_SYMBOL(__sanitizer_cov_trace_ret);
+#endif
+
+/* --- /sys/kernel/debug/kcov_dataflow file operations --- */
+
+static int kcov_df_open(struct inode *inode, struct file *filep)
+{
+	struct kcov_dataflow *df;
+
+	df = kzalloc(sizeof(*df), GFP_KERNEL);
+	if (!df)
+		return -ENOMEM;
+	spin_lock_init(&df->lock);
+	refcount_set(&df->refcount, 1);
+	filep->private_data = df;
+	return nonseekable_open(inode, filep);
+}
+
+static int kcov_df_close(struct inode *inode, struct file *filep)
+{
+	struct kcov_dataflow *df = filep->private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&df->lock, flags);
+	if (df->t == current) {
+		current->kcov_df_enabled = false;
+		current->kcov_df_area = NULL;
+		current->kcov_df_size = 0;
+		df->t = NULL;
+	}
+	spin_unlock_irqrestore(&df->lock, flags);
+	kcov_df_put(df);
+	return 0;
+}
+
+static int kcov_df_mmap(struct file *filep, struct vm_area_struct *vma)
+{
+	struct kcov_dataflow *df = filep->private_data;
+	unsigned long size, off;
+	struct page *page;
+	unsigned long flags;
+	void *area;
+	int res = 0;
+
+	spin_lock_irqsave(&df->lock, flags);
+	size = df->size * sizeof(u64);
+	if (!df->area || vma->vm_pgoff != 0 ||
+	    vma->vm_end - vma->vm_start != size) {
+		res = -EINVAL;
+		goto out;
+	}
+	area = df->area;
+	spin_unlock_irqrestore(&df->lock, flags);
+
+	vm_flags_set(vma, VM_DONTEXPAND);
+	for (off = 0; off < size; off += PAGE_SIZE) {
+		page = vmalloc_to_page(area + off);
+		res = vm_insert_page(vma, vma->vm_start + off, page);
+		if (res)
+			return res;
+	}
+	return 0;
+out:
+	spin_unlock_irqrestore(&df->lock, flags);
+	return res;
+}
+
+static long kcov_df_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
+{
+	struct kcov_dataflow *df = filep->private_data;
+	unsigned long flags;
+	unsigned long size;
+	int res = 0;
+
+	spin_lock_irqsave(&df->lock, flags);
+	switch (cmd) {
+	case KCOV_DF_INIT_TRACE:
+		if (df->area) {
+			res = -EBUSY;
+			break;
+		}
+		size = arg;
+		if (size < 2 || size > (128 << 20) / sizeof(u64)) {
+			res = -EINVAL;
+			break;
+		}
+		spin_unlock_irqrestore(&df->lock, flags);
+		df->area = vmalloc_user(size * sizeof(u64));
+		if (!df->area)
+			return -ENOMEM;
+		spin_lock_irqsave(&df->lock, flags);
+		df->size = size;
+		break;
+
+	case KCOV_DF_ENABLE:
+		if (!df->area || df->t) {
+			res = -EINVAL;
+			break;
+		}
+		df->t = current;
+		current->kcov_df_area = df->area;
+		current->kcov_df_size = df->size;
+		current->kcov_dataflow_seq = 0;
+		/* Barrier before enabling */
+		barrier();
+		current->kcov_df_enabled = true;
+		break;
+
+	case KCOV_DF_DISABLE:
+		if (df->t != current) {
+			res = -EINVAL;
+			break;
+		}
+		current->kcov_df_enabled = false;
+		barrier();
+		current->kcov_df_area = NULL;
+		current->kcov_df_size = 0;
+		df->t = NULL;
+		break;
+
+	default:
+		res = -ENOTTY;
+	}
+	spin_unlock_irqrestore(&df->lock, flags);
+	return res;
+}
+
+static const struct file_operations kcov_df_fops = {
+	.open		= kcov_df_open,
+	.unlocked_ioctl	= kcov_df_ioctl,
+	.compat_ioctl	= kcov_df_ioctl,
+	.mmap		= kcov_df_mmap,
+	.release	= kcov_df_close,
+};
+#endif /* CONFIG_KCOV_DATAFLOW_ARGS || CONFIG_KCOV_DATAFLOW_RET */
+
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
 			unsigned int size, void *area, enum kcov_mode mode,
 			int sequence)
@@ -1146,6 +1428,15 @@ static int __init kcov_init(void)
 	 */
 	debugfs_create_file_unsafe("kcov", 0600, NULL, NULL, &kcov_fops);
 
+#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_RET)
+	/*
+	 * Toggle verbose printk: echo 1 > /sys/kernel/debug/kcov_dataflow_verbose
+	 * Default off — zero overhead when not debugging.
+	 */
+	debugfs_create_file_unsafe("kcov_dataflow", 0600, NULL, NULL,
+				   &kcov_df_fops);
+#endif
+
 #ifdef CONFIG_KCOV_SELFTEST
 	selftest();
 #endif
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e2f976c3301b..abd1a94589aa 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2261,6 +2261,28 @@ config KCOV_SELFTEST
 	  On test failure, causes the kernel to panic. Recommended to be
 	  enabled, ensuring critical functionality works as intended.
 
+
+config KCOV_DATAFLOW_ARGS
+	bool "Enable KCOV dataflow: function argument capture"
+	depends on KCOV
+	depends on $(cc-option,-fsanitize-coverage=dataflow-args)
+	help
+	  Captures function arguments at entry via /sys/kernel/debug/kcov_dataflow.
+	  Struct pointer arguments are auto-expanded using compiler DebugInfo
+	  metadata, recording individual field values at runtime.
+	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
+	  Requires clang with -fsanitize-coverage=dataflow-args support.
+
+config KCOV_DATAFLOW_RET
+	bool "Enable KCOV dataflow: return value capture"
+	depends on KCOV
+	depends on $(cc-option,-fsanitize-coverage=dataflow-ret)
+	help
+	  Captures function return values via /sys/kernel/debug/kcov_dataflow.
+	  Struct pointer returns are auto-expanded using compiler DebugInfo
+	  metadata, recording individual field values at runtime.
+	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
+	  Requires clang with -fsanitize-coverage=dataflow-ret support.
 config DEBUG_AID_FOR_SYZBOT
        bool "Additional debug code for syzbot"
        default n

-- 
2.43.0


