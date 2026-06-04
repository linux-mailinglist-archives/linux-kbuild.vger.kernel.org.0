Return-Path: <linux-kbuild+bounces-13572-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 870yGO9GIWqjCQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13572-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 11:35:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D1063E95D
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 11:35:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=est.tech header.s=selector1 header.b=QSY2z47I;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13572-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13572-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0EA73023A4A
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 09:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8548F3A9017;
	Thu,  4 Jun 2026 09:30:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EED372058;
	Thu,  4 Jun 2026 09:29:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780565402; cv=fail; b=tipezgmzEFdY2pDEjm5+9d1Ql5+QpZewLpmuaZRsq2Kvxl688AaQub1dwVAF1lDVnPE2L+5DqLcowZd0kLy7FgTcVYVM0Pe10x+P92suU7pTXTpwUzglM4YW/m1ZvtvzhkZHhVNozRD8UcecJC/GcosigO+ido2sBysuRyLEYq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780565402; c=relaxed/simple;
	bh=womoXms92eqe2X6R9DHJQRO5KzUJIFoMqwF9IIaqAqM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0zpmBCFHyswMAcawSVM+jnD7WT4ySz5U6v+Cz/jokgQnTE1MA0wvcbC6VWPGuBCdxiilqfcF9q9x8j0B5NjiZL0vtm5excrBvHLsZf8167WZCGPffr0OKriRhDh/pTRk6Mq34CHYxKV6aaYZs/VRa0EkKxmQDXcA/aOWSP/uC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=QSY2z47I; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+47VhkoR3SfklUOswBWi+vpWWO0E/WzI2ZM5duVBLDggZjZiEtX8lZkpIdvW7qw9bPdORONWR+PRUhBShVMtFkx5hCbpsHaLaOokXODU7Qr0cBIJroj3Fz5EPtCmmONo2TIyqbERjdFjLGx9aI0MTaw62fgD9r441u3aZSc5R+Vc9MrCN+f0hu5kkg8qc8RCSQvkfrCpuea4oG0VU8gcHFGlDox4SQ8wGcK+bF0WVj3P4Fvh0lAhUZvlTP2KBmTikM608uZZQ5yGkMdX0KSqZen5AM7WvtGHwEmm18gYI7TV9S6HvtSzy4GFEpsRxnnjhWltV9n7MKk8ChFLfNRlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ar8Kdao8qCVWSK0PY2QBUpKU3mC0cM+YwlyQToan/nE=;
 b=rRH1n4rAch8gjNVjINz5deRI29AiQYvSlOb1CRezFIM3d3R3tWJawb/ic50MpTr7t2Age7f9rr7jehrwBjC5g4c7DlUYOPIzp9wDl4++lPHVX3b/2ardUr8B+acE4Euoq6Pm8EJk5Fk3QDjg9hrZoI2yM01/s6wLefh0X6u9dVp0mI9rf5mdEE1ScMR7kR/YfJfgNYGI2fWHJCV7o+JS2UqPutFMG0tCUmMCB+D39WLq7LXp/op2jOtPj78WnVSLuavRHh6fI78V3n1hL745YsK3FzmNwxr6ha3qkWcBE5yLxDraEwATidZZSc79tXxfFEFq7PGapak8Hv7oQ346QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar8Kdao8qCVWSK0PY2QBUpKU3mC0cM+YwlyQToan/nE=;
 b=QSY2z47I/HvGpgDsfsQFQ89nqZo+6CkqKhhVFXCUVrUM+R++U+/aaKChxt4JVFxz7RhXmFfu0av6IgXJ7Jbl1KuLZ1ww24WUIfNG7F8NZxGiAh/XVsJDuBKD2TQE8ex5LQOxMEj/GSsFDySoB+Caz3Ah7K0VumUbIG9YkW1uNUlz9QoR6HKfCzEqzFquUDyCgE8R7nzpia+Oey4uXxgD8UANOOXwhl1kcwkOI+Flseew1rVbdRUpr3x/21Pby/Hzz/J+F8QO4KowX6zonGasOfWMHq1KbuPorTOJs2uY35Wza6aNrb660IcUC+2VOqb/VMVDBFcJ4Jy8ytwfnmE1gA==
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by DB9P189MB1834.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:29:55 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 09:29:55 +0000
Message-ID: <5bbc98a8-fb7f-4909-ab5a-5229e9ef74f2@est.tech>
Date: Thu, 4 Jun 2026 11:29:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 rust-for-linux@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
Content-Language: en-US
From: Yunseong Kim <yunseong.kim@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV2PEPF000239A4.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::225) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|DB9P189MB1834:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a71689-356b-400e-7a73-08dec21bd66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|921020|11063799006|6133799003|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7p65TcjUvLFoEr6TnmOnk//ZT8X/rrsG03NVZtMvq+tHxwcdstA6m9MWcrx6AcKLAw4c42TkyGQwT2zqEfHA/PWFniHrSczFZ7fUx5Z4E1ReTvY4azIn/4Ilplq+m+vUvFIVbgzPqOAblMYQkArDCmgNAcsVwpkSdK9mhjo58FZVkpGWP+9dTo9W/7f9SZInOnRW+yXZxvCvwmQbQypjPorCIHBMu9nG5SYXHyF2v1/OUpYFKoxVE/WmWtshdJJL3KFag/Abf7F/35ykKuSBDiIZhnH6hYsfO6qoS8v4BlxIN94/z0rvYSM60m6VbTocKENpb1XdgouHoHXEDEQkTlLk87CfLCnMl+5d70wtItf35cSQrUcPtDF3IJday/BOLY2N5ST3QOPg4oKnLLZfdq9lF18pq4Ki2/o+YDozeKgxDMNCSXHyR/kX4MYlJMQqWKWoTAO+1amCcZauD5RzlbFdONLZ6/M/95BNBkh6Hj3zCC1E1z9Ei4irDRKfrBNWjk7t3CwF8q/D1BqvYP2zbkiRKXMi7hNbzsSh7F7XcGNIqh9eViY+n75EQSOS2zg0u3p2COz0XqVh40uO7tPqZK0EFQd8GwJtLqnIgOIceRwpHUyvfPxUxdu4Ssb2C+sCxr+Suk+DvcZ/YlygFxbFcFEQ575C5xID0Jznf2ZS4DhgutiESVLw/x6IRmpQ+nr7mJ7GSfgfLtMBxKEdDnpj0CpUApegLCLVLKRsWgrLy+YP9NNnjjWhnASrbZ8usU5C
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020)(11063799006)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDhkVDZDK1pJK2Q3bjhMMFRLOVVSeXBWbVR1V3Npd0l0Y1dWL3JoTTdUNlNP?=
 =?utf-8?B?TGJBR3pxcHNEL0dtZGw5MTNlZDBIamplN0o0SzVSODZmbXdwV3pKTHRPeGN5?=
 =?utf-8?B?cXJRTjJJdm1oMlA1SUFBQUlYd3g2UWphb1dyN2R5c3pWQ25Dc1Q1QmVXNDg5?=
 =?utf-8?B?a05NMVlFQ1FHQUpmYkl1cTA5Z1ljQ2VYOUlFMWduVFpLcFVOTDB2RjJvWHhm?=
 =?utf-8?B?UGR0aE5tS0wweGRmODFtV0QxZ2xHY081NUNWVGljZW8yejdUSkZDREFWUGxa?=
 =?utf-8?B?Q1Rib21CWVVVbDh5M0l3S1N4SmlpOFdkYU02ZHE4SnYyM2ZEYUJ5RnN2TUg3?=
 =?utf-8?B?M1B4OE5BeldyRkRVU0VzVkhMRXRQdGRCdGQvaGIxM0hDR3Izdis1SzNYeXZn?=
 =?utf-8?B?ekF1VnhlOXdGdzl5ck0xWjNrd1FOWlFGSzlsT1FsZlJieUVZR2t5cVNPUWhr?=
 =?utf-8?B?T2ZGckVnd0ptc3p3TURTb0VZTzhGVFV5WHJ3bzVZaFl4UUtIVkFjVzhRbHYr?=
 =?utf-8?B?Q0VCSVpZRGkvcUNkWUxwTW9mYkJaQ3R1dkFEOXRjbmxLc3lvU2c2MUJteEwy?=
 =?utf-8?B?Y0h3QWo4QkpCN211eHRWK2JxaGdwWlJxT09YdjBNOXd4WmlNcC9ZVS9qbzM0?=
 =?utf-8?B?UENHVFJBcGJmZFB4b1I3NlVrc1BQY01QQmhYVUkxMnRTTnNKRDNmYVo1dVh5?=
 =?utf-8?B?Z1IzM3JWajNZT1p5MkNaeDZtR2gxVVFJdklwdjNPbGxSUndWT3RvM2E4Y2dD?=
 =?utf-8?B?dlB2dk9xcWgrNWtvQ0crRTUwUmRCbS80YzhaOHo0b29LWmRUdGVNVCtqekRB?=
 =?utf-8?B?NGI4bE5PS21DN1YvSE9TK1dsMGVsMGJMUHY3aG4rRVVtbXdlYXpseU9WVmlQ?=
 =?utf-8?B?emo1MFJwcHVwRjFGdm9KKy9SU3pEYk5NMmdJbmNnTlM4eHpiakdGclM0bGdB?=
 =?utf-8?B?c05FdkdLVGh6cHpIY09rQllkdFpYeUgvQ3hjbWxBL3FLaXhvckhQNGRqTUU0?=
 =?utf-8?B?R2FRNEhyYjRISU1yRTFuM2NxUmdkZWpqbEI3QVdxSDZhamZZOXhLMWNqS1N0?=
 =?utf-8?B?dVNNeXZKeXd5OW9leTVqOVRaQnIwN3U5VlFxcTJ5UXRRQkpEQm5pTUJUUHNs?=
 =?utf-8?B?RWRJa2FBc2QwbXdPQ1EvS1haRTNBN3ZQS21ISFAydnB0RGFkTy9TckNBRnJJ?=
 =?utf-8?B?V0FGSkFwT0dYV3JUd0d5RHZhTWRTZFJMUEZYdlkxekVpQmtnVHViWkNObzBN?=
 =?utf-8?B?RjhTWmM5L0N4MnNNSUhZSjgwUkowMHlVR0gwVFhWUHpibkVhWlYzN2VYTDd5?=
 =?utf-8?B?V3Z4dHA3S2o3cHYzUHBYbjFpZ20yb3JVMWRqQ3FjOWYyMXQ5QkhDQWpGd0Mx?=
 =?utf-8?B?T0dqSXd3TFNJZ3VQTWg2WGY3Ym14NEZCV3ZlNVpZeEVjTkdSZ3dmdU5uMitm?=
 =?utf-8?B?dlRZRVRtWW1YamQxNFdYZE0vVWV0RXJudytxeGN1LzUxWDBRTTE2SjZhTTJn?=
 =?utf-8?B?UUE1SG95ck9hVWRmY2JHNnNRdEJZWXlHWUJFZG9kWVA0SWlDNGZjTHZEMWhG?=
 =?utf-8?B?MmxGN3ZUOEc3VDBuSWs3QzV3QnBuTGdUTkIvYW1pYWYvYisrSUpJamlDOW5i?=
 =?utf-8?B?K2RNOTc1SmYrVjh1dEpaSFRYa3FQUEtKR1p6aHRVVDV5bXNZSDQvNnloL2Zh?=
 =?utf-8?B?cVc5WjhZdEh1OFd2WUdzT2J4THk4VVlZY0FmdjI3UkM5Y0puN0dQSlErYTlh?=
 =?utf-8?B?Q1BnNlFTSVZDV2N3bm9YK01HRVZ5TGFFZFFCV0VLU252STI5YkwzRVpneGhP?=
 =?utf-8?B?L01BZ0d5c0xrOUJPdW5QWVJsVS9USG5rRTBCWmxMMG9qZkI3MGtnRzNzTE9W?=
 =?utf-8?B?MDd5T3BtMEV5L1VBaVRzdXBkSVVCMkNOaUkzSUFQeTUxRlloMTFvUE1OMWln?=
 =?utf-8?B?T2o0WVAwcEtuWktHZ2tSRTUxc3JwVC93WVFLY2ZIVFFFOVZ0NHBMdlBtbEp6?=
 =?utf-8?B?WCtmL0ZzNFphQ3o5RWlaSkVKRFp6cE9xUWtTbTNUZTZlNllqSDZ6RUpZQi9G?=
 =?utf-8?B?MzlocFRZMjFWbU5uQ0RPQmppTTQreUpRbWZ1MW1kY0hwTW5RQnBuV2ttM0Yr?=
 =?utf-8?B?cEptUm1DRWtOUkE4dk9PV1F3VnZiRThEK3psOEJCU2NRRnB5RTNzZlhWNkt3?=
 =?utf-8?B?WkFhVDFHYkRtWGhNU2NKRHJUVjhFY2k1NkZ6d2ZMVXNUL1dMcWNRZmhkaEdx?=
 =?utf-8?B?aGRieHNNQTNTS25RalpzK0toMS9qcTZVaGxMNG1iTkRLenlXajR1VTV2bnZL?=
 =?utf-8?B?YkExQWhMQUc3M2dxZVRhS3BWU09EMU5jTStodVdNNDR5ekZMZFpVdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a71689-356b-400e-7a73-08dec21bd66c
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:29:55.1846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o5cDXuaiGsYECkrmb+JAnJHUlACYANOPhe21H+Gvj/4hnYjMFoz4CDktl4mm3OksrACypTUi9dbeAWV6o6Kauw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1834
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[est.tech:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13572-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,est.tech:mid,est.tech:from_mime,est.tech:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C0D1063E95D

Hi,

I would like to make a correction to my cover letter.

Note: v1 was sent as "RFC v2" due to my b4 misconfiguration.

On 6/3/26 19:43, Yunseong Kim wrote:
> Introduces a new KCOV exetened feature that captures function arguments and
> return values at kernel function boundaries, enabling per-process visibility
> into runtime dataflow.
> 
> [snip...]

kcov-dataflow are not in conflict with "KASAN_GENERIC + KCOV_DATAFLOW_INSTRUMENT_ALL"

> Prerequisites / Toolchain
> =========================
> 
> This kernel patch relies on a custom LLVM SanitizerCoverage pass that
> emits __sanitizer_cov_trace_args() and __sanitizer_cov_trace_ret()
> callbacks at function boundaries, extracting struct field layouts from
> DWARF debug metadata at compile time.
> 
> To build and test this patchset, compile the kernel using the modified
> toolchain:
> 
> 1. LLVM/Clang (adds -fsanitize-coverage=dataflow-args,dataflow-ret):
>    https://github.com/llvm/llvm-project/pull/201410
> 
> 2. Rust (rustc 1.98 built against the above LLVM 23, for Rust module support):
>    https://github.com/yskzalloc/rust
> 
> Build instructions:
> 
>   # Build the modified clang
>   cd llvm-project && cmake -G Ninja -S llvm -B build \
>     -DLLVM_ENABLE_PROJECTS="clang;lld" -DCMAKE_BUILD_TYPE=Release
>   ninja -C build clang
> 
>   # Build the kernel with dataflow support
>   export PATH=$HOME/llvm-project/build/bin:$PATH
>   export RUSTC=$HOME/rust/build/x86_64-unknown-linux-gnu/stage1/bin/rustc
>   export RUST_LIB_SRC=$HOME/rust/library
> 
>   make LLVM=1 defconfig
>   scripts/config --enable KCOV \
>                  --enable KCOV_DATAFLOW_ARGS \
>                  --enable KCOV_DATAFLOW_RET
>   make LLVM=1 olddefconfig
>   make LLVM=1 -j$(nproc)
> 
> Note: CONFIG_KCOV_DATAFLOW_ARGS and CONFIG_KCOV_DATAFLOW_RET depend on
> CONFIG_KCOV and use $(cc-option) to verify the compiler supports the
> new flags. With standard (unpatched) clang, these options will not
> appear in menuconfig and silently remain disabled.
> 
> Optional configs:
>   --enable KCOV_DATAFLOW_INSTRUMENT_ALL  (instrument entire kernel)
>   --enable KCOV_DATAFLOW_NO_INLINE       (enabled by default)

I checked, and it’s better to use CONFIG_FRAME_WARN=0 when using KASAN
together regarding flood of -Wframe-larger-than warnings.

>   --set-val FRAME_WARN 4096             (needed for INSTRUMENT_ALL)
>   --disable KASAN                        (conflicts with INSTRUMENT_ALL)   --enable KASAN (no conflicts; works well, but slower, a lot of dataflow)

What I meant by that conflicts is that I was using it for kernel-space
behavior only for the "offensive kernel vulnerability auditing",
and in that case, sometime it’s better to disable KASAN.

Tested CONFIG_KASAN=y + CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=y together
(FRAME_WARN=4096, virtme-ng 1 vCPU 1GB on my Intel CPU Dell Pro 14
Premium PA14250):

  - Builds clean, no frame size warnings
  - Boots and runs without KASAN errors
  - kcov-dataflow captures correctly under KASAN:

        getpid():    6,682 records
        open+close: 16,382 records (filled 64K buffer)

Time to "Freeing unused kernel image (initmem)":

  KCOV_DATAFLOW_INSTRUMENT_ALL only:          ~0.95s (+40%)
  KASAN + KCOV_DATAFLOW_INSTRUMENT_ALL:       ~2.02s (+197%)


Sorry for any confusion the earlier wording may have caused.

Thank you!

Kind regards,
Yunseong

