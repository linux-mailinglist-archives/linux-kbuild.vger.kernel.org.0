Return-Path: <linux-kbuild+bounces-12111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKIqLlCYvmm2TwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12111-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 14:08:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0352E56E0
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 14:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAFDF3007E34
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 13:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04101318EDF;
	Sat, 21 Mar 2026 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s03004zv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCF33563E8;
	Sat, 21 Mar 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774098352; cv=fail; b=tYysL6zbLdQcZQDVR7uyF1rLkfNMvqrlmUq6BVyoVTfBS73i8L26EO3NsbCGtwarcfQBqu6GvABomZPvrTFAgAVfOuEQakyml3m7LjzNmKpTSMnYQnUXvNeenrcrvlzmgzuCtj/LahH+DI/jZqlXqn8KGqRyLdjmBwD/PVhESKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774098352; c=relaxed/simple;
	bh=H2A/ABB0QImPo8V4cm7b6hBCU+zP1M26gP08rlevfOA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=FJhk3KRoRpb1CrAXKAL2l/zEqvv+l9qj2b4vmNLo7txj3u/0IFfAI8rpOPujzhL2zNrJV4STWGu+MhU1LFdfUp9TLtA1zAq9guQnw9kCTwexKvGwxcorBH/PQZbqzlfE4K3Azj9HmuAIkMTUUufCmJcUDybKPt3/vhaGRzR4Exs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s03004zv; arc=fail smtp.client-ip=40.93.194.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjPeRoZqG2jKFmWeZYg/MlcadR3HcNAPSh792OcnlOZ9Ot0c/uzIrCohPIilVfADSu9m1ihwjCscJHAe0eRRtO1oCT6qF/aaEws4PhGzZXLY/93csMtw0bth5smLo5Pcz7Op85xdcwau4VipAJyFgqBYeJjZ28N31B28E6z5TKR4/KvFZrlcytlSgBdkqQOcT4CGjZvC94/EcEABoUWxT+Q6/DELihb9zRrlAeFixIFRiCdGSWnijutzuyvHWgefM+QNRc0SjsoB8Q1CEeL2L9LU7Aqwu/hlDTAgWK+Uc5gOq7/IDZa3X5v0IHZbmXhMECfCcHhDvBi2dAMXGYbkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dauMjEjfG7kAEQcG2gc3csWeTv+llkN98y/bfVcUATE=;
 b=oJ7llToFKuR00iGsOCUwzfyUrkIWjQaXAgP2iirA7saQkZofJ9b4+hzKk9STfkhY/ycfFtH6ap2b120hH3JqT9DzULAo5mRwU0LGsqFNRRnn+MnRsS1hkz3VZXLL2jZMEbSbpmM3sXMm+4kklPYwNCd5Un+r50dsKibqIGj1fjO/SuLCru5Y7gDB75gfYS/QlyT9tPk3cV3bngUfoeA2gN9621Y257YzLHJq2ZVqtyvCrA2z2lb8Rl9NogyDMtDVoqWmwU69tApzsbvqP678SxRvb7f4C/Iwl6HzmOkzK2Ku3mLiz2K6bNEbjVy+OWUaP0nIi0qAA63VWd9F+cvxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dauMjEjfG7kAEQcG2gc3csWeTv+llkN98y/bfVcUATE=;
 b=s03004zvf+73HJllpozRuKPiWxFtgiK0lYJlGsXayAZFKeMBZxQ8ML1r3AMR7sqUYF6CCScc88hH1h5oTxUxvWFdgqMY5qMq9reIAZW1Fni636wVpbeZIHEK0ln38yjuuhBLTYrbw6Lb1F10n3TXTbQYcRDFVzB6EfbPOjyYynptfJmQv0xaBxE3+XuelxUCIK+FQxk+cAEj1weIiUl4BrAuyCMhBzoINc4hZXA/c9+MB3x7WscoBchtYA+My2pBpTYwwHJwRWgAs/3z3X1xDRlbjJN40u7hv0lihsLyXDfDFbT5F17wlovWosUejhADd+jaGQqinngUurVRrLLzHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFEC2853BA9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Sat, 21 Mar
 2026 13:05:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:05:44 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 22:05:40 +0900
Message-Id: <DH8HDIB9BY1V.39W764ROE7AQ3@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Yury Norov" <yury.norov@gmail.com>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Yury Norov"
 <ynorov@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] rust: add `const_assert!` macro
Content-Transfer-Encoding: quoted-printable
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-3-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-3-gary@kernel.org>
X-ClientProxiedBy: TYCP301CA0042.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFEC2853BA9:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b4c82b-2610-4b84-6d9d-08de874a8f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VlmlLjrFKBOYf9/xuRgwoLRadIla7EBQTTcsOYk1b66M92zWwDAGy7CZPUovgkIZPHFjcArjn6BzXYHCd7XBvvnJNVnMINZ7QypzpPMuTIz637r6P1162BMviaPVuhUmu7MY/PBGQ3Z5Ztg/QQVZvOnd8hrQSfHq1Q9Ty6d9QYQuI3IzzeVRKMkJDxbh+L6zrUGc6vXCk1VmuJ64MaaPtS2UBvP54aBGs6HeZfRUjDGmfy6J+G9IYmxJE2wwPAogatFNajEdekcOcuYIqv+Of/SEhcgEZu4VDUHhKoKztpbh6DmDbg0cCoKmzdWg+Uq3PLWXNY1QlF9yEpEuBqaYECk8ycXnGi4fXVwP0S6a2mV5uTh0yDDTujgu5o4M6OEaA+67rIaG0u74uBo0daKiRmlLN0OqL5UD6emgmw64qLR2ANttzxWbiQlgxSEgJbaxlrlrUwsfbcngTQ7KT6Gf4doFi74KNcKgkPFERxZ7lljUsEVPDc/TW2ZTDAMEzbiL+HaAv60trwKl87pVjhw2hLy/3DdxjOmkiAMobLL4llrfZwBCs1Gz4SbT8qkDpYmaEFml5XOAdi3qt1TLTx8Q6+UNL+MySPoz7uAFS3rORha6vYhmBlOzvT8e+bigDOBozX09APXlGzVaNv5KLWIcQcuVw/J4dywrSXbf1CFvtUq7d+aBJHmPp1SzCLWWtXu3Fp10HtXFYGUrLRxkIg97ahmvdA7tXO7xZu9JTaIDiS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZQRW9EL1FodFpibmk0eXpSL2RQeUJJdyttMDJHKzM2a2dCMUZUL1BpelVQ?=
 =?utf-8?B?eFg1QnlNWThvQVJIRFhUUnRaekxlTThxY2VnOUhES09jeUJFYzJtR0xPeGJm?=
 =?utf-8?B?QWhVbUUrMkdPWWZZWHVqd29ZVGZMdGl2M0tsemVyWEQ1V2c0d21scmx0eFkz?=
 =?utf-8?B?Wlp4R2ZlRnN6Q2FYYkpLZGZHQndNZlo1aXh3YmVaYytxUGVBdnI3OXdSSkhq?=
 =?utf-8?B?dCtMVlIxd2o3SkpzcjB3aFZwOStDbEt3bjBENk5wSk8wemh5Q3FFV2tjMDk0?=
 =?utf-8?B?VUk2UHhHYWluNXlKNS9zMzdhbGFaVmxoc2U2MFcyL2hvMWhocWtraGtUcGVp?=
 =?utf-8?B?aCtXS2FvVmRidUdxbk1qenVYV3RocVZjTkZ1OHJRQ3pCMDc5L216SlZ3amlm?=
 =?utf-8?B?TE9GVGZKNU5RV3A2aitFdnM3amJKN3BtSkhSSWN1djQzZEVwTnVLeFpRUzVJ?=
 =?utf-8?B?VFpDOVhTWjRzVGdlb210d0FRY1NtYkQ0eS9vcXBtS1JDQk5tc0FxNGJXcERa?=
 =?utf-8?B?REJhU1ZyWmFOTHAyd2JmWE9HSWlOYUxQUUJNOXJqODZYTjJxR1MwZlZVbTQz?=
 =?utf-8?B?Vy9HdXQvNkk4SFo3d2M4ZDZYeWg5UEFDK3ZjRGJLSm96K3ZWNlg3dGo0eVVG?=
 =?utf-8?B?RlRFQVV6WHR5SGJ5T2czOG5mMTU5d1FyVUN3TzFnR0gwaVlORnZCTmw1OC95?=
 =?utf-8?B?TFZWYWJxenMzV3QxNGhnTmlvUTlPMktYYTlrZnNrdThJeXdVK1RtcHRYL3hY?=
 =?utf-8?B?VUlyR3ZVT3I1cllJa1JVQjg2T1VyS3QrT0ZaMk4rT1hVeW1PQUc2czZENW80?=
 =?utf-8?B?dWJ5ZHJqT3JLYlhGeVg5elQzRjFGWURjMFg5eThuV0pVT2hpY0pTWWpiVzFS?=
 =?utf-8?B?YU9INFRRQXNyUG5BelVWK1dsMkRjT2JlOGpMQ0hvb2J2NlpzTTVmaEY4dWpC?=
 =?utf-8?B?Ym5kOHFBUVBkZmN0NVk0T29PN3o4MUl1Yzh4WUxPNTVYcmQ1cUZVNFBDZDVG?=
 =?utf-8?B?clp4aXhRamsxQWVtT2loNHA4Y3ZNZko1S1o0NktxbGt3NmtTUXRhTTNhQVFj?=
 =?utf-8?B?NldOaVRGR1g4a24vdkNDRHFVL3FwVFo4aUdvRWhWQnhobTlpMC92NmE5TkJ3?=
 =?utf-8?B?VHN3MEFXYkd1U0QrTWhtd0Rpd2dUeXFHOVJDMDZzcjMwaDR4MXNUazRIYlNR?=
 =?utf-8?B?TkhyeHZuTXE4eElZVUMrdlZrdGxUTnZBWkF4SkQ4RW9uK2hHaWxVYVdBRkE0?=
 =?utf-8?B?VWpnZ1NGSFZpaEkzYjB2U1puZjZWQXRNQU4xQWNRT3FFMjJYZ2RUL29mSFBK?=
 =?utf-8?B?OXEvK292SXFmZlhsSE5VMU1IMW5COWlrSGhlS3p1akZzQlo3cngxV0p6Rm9u?=
 =?utf-8?B?MEc0SzdnaGJPK2h4dmdJSXVHbUhVZ0svTGVlZW1OU3RrQ2Z4NTRLVUtibmhv?=
 =?utf-8?B?WnVQcUdWYXZUNytpQVhPWE9DNy9mbTJTNjRuMWdNVGdGd1U4c3FoRENDQVFw?=
 =?utf-8?B?MldrSTBObS9BeEV3SnNmWmdZV295TmpySXhuL0dIMVNJa3dLM2lDeU16ek1I?=
 =?utf-8?B?SllhR2kwRCtuM0ZBQ1dZM1B6aE1Za0J3R2M0N1F2WURwOHRDUnZ2bEkyNUdS?=
 =?utf-8?B?YnYxZXRvM25uNktHUHR4NXd1VUVMN1B5Tjd6MmpIMDNzWW5CRXZJVnpLL3Vk?=
 =?utf-8?B?WVBoemFQMGs2eTZ1UExRS3JLMmtmOTVzRzFRWnl3TUFKa2VodEp2VFlScmZ3?=
 =?utf-8?B?cGtNUy9ZSUlDNFNWWFBVajRCRTIxcndFSTFFSnpDNnhmM2x4VWxRdkE5d2VB?=
 =?utf-8?B?WUcrdGtkU096b3JaSTZ6TUdWbkxxNFJ2cmRDOWNpSit4SncxcngwSExCZmo0?=
 =?utf-8?B?ek91ZHZoajk4NzJOaTZXOFovUEhpS2JDOW1mV2cydlZydTVaVG9ZRkF5WmF6?=
 =?utf-8?B?eDExalhKR3NmOXpWOEdXM3cxb3BLZE5DYTFsUFo3K1FvVWs0QVhienlKTjlS?=
 =?utf-8?B?Nk5objRTL3pQa1k1clFtbW45OHpYeWZlTFB6YmtHOEpacDJRR2lVK3dOblMr?=
 =?utf-8?B?WVdWazJ6d3B6WkxtY1lmM05vN3FFNnVHR3NTdDlhNmRVWDkrWlAxM1hCUlZY?=
 =?utf-8?B?UUQ5S1pGTW4xUW43dzUxL056bDdBcDAyQnEzb0lCYmZIRXJOUVJBOE9PNy9t?=
 =?utf-8?B?cWpja3E3MDhwZWsyaVhiMkFMVGFMWWJQQm9NQXN1NCtSeVJRUTlQMW0xcVE5?=
 =?utf-8?B?OWpGVkM0aUV1bXJHakR1KzliUkRTSWNReFdCazJMTGlRMFBjOHpScVpRUnlF?=
 =?utf-8?B?UUdxREt6dUtKZkJLc3d1K0VEUHFhL0Qwb212RXhGbFA3UElhejlnQVlrbk4y?=
 =?utf-8?Q?cba2KcHvjtJ6KfGmrX/qBlqcvrONEOb+H1WPFeIcSCvts?=
X-MS-Exchange-AntiSpam-MessageData-1: 1/XKi7PdsmH+iA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b4c82b-2610-4b84-6d9d-08de874a8f7c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:05:44.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7m/k39bt8dAB6cf5nJTISMUatLL2UqAAX5CYQgLSFMHEhikUPejwpVRp/PHStEh4jV2mwn47X9SFfQ7SSuWLYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFEC2853BA9
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12111-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,gmail.com,nvidia.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email,Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: 1B0352E56E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu Mar 19, 2026 at 9:16 PM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> The macro is a more powerful version of `static_assert!` for use inside
> function contexts. This is powered by inline consts, so enable the featur=
e
> for old compiler versions that does not have it stably.
>
> While it is possible already to write `const { assert!(...) }`, this
> provides a short hand that is more uniform with other assertions. It also
> formats nicer with rustfmt where it will not be formatted into multiple
> lines.
>
> Two users that would route via the Rust tree are converted.
>
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/build_assert.rs | 24 ++++++++++++++++++++++++
>  rust/kernel/num/bounded.rs  | 24 +++++++++---------------
>  rust/kernel/prelude.rs      |  7 ++++++-
>  rust/kernel/ptr.rs          | 12 ++++++------
>  scripts/Makefile.build      |  5 +++--

I'd split the update of users to the new version into dedicated patches,
but other than that,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

