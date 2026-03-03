Return-Path: <linux-kbuild+bounces-11532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GycLMbVpmnHWgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11532-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 13:36:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACC1EF8D1
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 13:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11D783043D07
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 12:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4247D311975;
	Tue,  3 Mar 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="topBYXbi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021139.outbound.protection.outlook.com [52.101.95.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB174282F02;
	Tue,  3 Mar 2026 12:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540497; cv=fail; b=lSuNAwSV5DWzhqTYbcxJO4fo89f6tJ6tFzX+FeZFKk9A1gLZKBsw2hw3WmR8Svdz9sHM4YDMtCYrWCRJ34jYs/8B/eEu9tKEy2NmwCT6DpkFbWZGqlxjL2RK1lsN4ZaGkvT/8mNdkvTltI14uHVXNYtZSkAp+toCjm6DhcPKSoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540497; c=relaxed/simple;
	bh=t1PApQTse5KKQE8SFcNMmbeGrJ339PADb1cQc1RoRHg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=k7DMnjB6thSebPxMZvKYjzjyNWUrqcLT/A7F1p1Yu9u/D0mQBRzuj20UP6H+XZ7KLzJKTvDcTpWcHGvW1rm61pchygKgNvyahnO/yiP3tv8+YdkbwD8WDE3UberEKWIV191VPjSj+XDaEJLGFsmaiYCpNWwh19eUUV0kCFoqnoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=topBYXbi; arc=fail smtp.client-ip=52.101.95.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKPQV7yVDCVA4zj/yV+UGIj8/L6whJi0PEcQIhqUiKN2WNq7UFXB2Ro7I3cTjTbfESVijO2Dat4J36RN5YJiPqFmru7gWVZti5P0CBowyt7+QWS6pOd4Owc0MLUuib2FOutFxhEksbAamdqgVGnfEMc/B19OS/yP7XZhP22XrK7JGtih/yLauRSbBWbPPnJUwvDOSQnWwbjgMjPUL29oYB3v6v8RMgu9Id2ZK29C6Ctf16r/g0ixntbt9hGdBMSd5w36PwE0vdANN1sD0Wx+OaTduxg6JZenA1w/oBv2eiHY8WsVKJ3aLjNA0xJgAPs9dhrMMb6yn/HxIttRSwT92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1PApQTse5KKQE8SFcNMmbeGrJ339PADb1cQc1RoRHg=;
 b=DbUOOqS1rIPZvwy6va9BAzdOe2Doy8+Yee5JZ3iB+vjwUsxljNQSJPElZZC5yTjzhQvm+t40sodJmjdO5gMMpJqmvuyi9CMaRoNJmern5DD2yKxtEWZzVuFaCwefbwkjJqX7jZHPKlbPktnZJ6nmNRnANbJ2n9Jm3ZgPl2cLLaXCfm2b5FI/sjMgAjR9wU1ZJJeI9ipVu1/CapL4tZflUBjJ5CN5VuwzLGMc1OrPf3uGogaEwbyWI/9mx9kcMTYdnU5Je2CIul5O5++OeEtlplxbMq7/tz5SQ8lzXky4+qat9C28mSkdzZZCOJM4HHd732TyTPWUrITSm+1LSxh3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1PApQTse5KKQE8SFcNMmbeGrJ339PADb1cQc1RoRHg=;
 b=topBYXbi6bCVTEPgnm7QLT7nA8wYNn2NAF5FLtKROOsM8vACfop3UKVK6EGC4Y/jJlPrjZQoLu5pfzW07P2L38i+BPg2iHUZUYolB9RMPev9kt8tib5gbRR+29dmtGAcOOEjsYDkI27w2Xvfe9IXvAvQOGGaIe4OngvRSGQhcvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5542.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 12:21:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 12:21:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 12:21:29 +0000
Message-Id: <DGT55VFRKKEG.2WJBZF3DB973W@garyguo.net>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Aditya Rajan"
 <adi.dev.github@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260302130223.134058-1-gary@kernel.org>
 <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org>
 <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org>
 <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
 <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org>
 <DGSN9C8PBFYP.2T48HOEE5LXSM@garyguo.net>
 <DGT16NCR2TD7.27E74897D8XEC@kernel.org>
 <DGT2IKQK341C.35HW6HHSB03KL@garyguo.net> <aabIW4RNCgSyY945@google.com>
In-Reply-To: <aabIW4RNCgSyY945@google.com>
X-ClientProxiedBy: LO6P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5542:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a647470-a60a-430b-6bbe-08de791f664e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	lzf1jVs6HOV4BWGnFsSr02jhryqlSX/5SME59IIl8kZ6NvYUqm9dO/5Kbkm0LQAGJjGNeOUtHkv5EQVSxjOfOfA9Dk+4KwwL5ZL3IK3XVFuuOETmloc7JCsxU21BpdpBbK6p9wh1wPAcx8eQEOim+oqwiY+gAoHTNZqEU0YMYWZTuWaiW3wOMSqoB6Of4TWAh2mqW6TszGO131wS9bG2wpG5ZR7pgBTVpatnZxM4Llldpbw6qrrW94DlqSS3Qd0MAPMfOc+/hmKgjX91V4gG0RUQ2zQY5kpggdQfTIeWdTR7c2Jh4Urr+CFHKlwDLv66K+EF8IZfqUG4/Btqg9v3CQO9omM/80d8Rl/vNaFLDqHj1rl28fllmmoPqfC/6ntsmvg+z5/bZGH71jFl/qzVC9grIp+LTwBYvajGscyQzOJHs+GOMayC2OZGQf3VbS2Qo1APWfAKbGU2PkKnUuglK6pOdlNRh7c5Vyoa5HySWypPJE80ozG00vIya1hqfgmJ2N73RioOvKFNELwqt3CdVNyMFhBfjLwEx9PdmQvJBohZ7ch1bbWgtWMVHKobNj2pHhCM0S0222Jq3YRl6QvyOVVI8nKWr9Dl3TFpSw52Sx1R21yWnfqGHPr/DW4R3RwHLfho5Q+4sQGArL54XQ5zjrV3aAhe7Ctm4QeoX69PUJzp2MA4KoLv4e7j5YoQ1R5Xm1yJzMhQme6plwgnuQYsO8tzM3Qeit4kt/My9fMpA04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZytlSVEwY3BXZWdjYkJ3SlYrWnFRS1lrSHV1MmZFWmdHcEJHclV4NUxudWpm?=
 =?utf-8?B?N1ZjWEVRbGVaQ05oRExPaFVZdU1lTU51bUdMVXpKUGhxZ3hGa0RvaENlcEtZ?=
 =?utf-8?B?L0p3NWpxaFBkbHBSTktod2ZvWVF3aFdta2s4by9jOG5RZzE0U3hmNUxvUm5q?=
 =?utf-8?B?cmxYSENicDVCVDVUZU1MOFl4WGM5dWV0b21EV013MHRGYzRFc083dlVMZ0Zz?=
 =?utf-8?B?eXAzcExUcHBpdEtrZ2ZyQTJSWkltOVk4TkM2aXRkQlVra2pYc3dSNUMzaXV3?=
 =?utf-8?B?bXBNN0dObDlEeWdvVUhLQ21TQW5tUlJvQnBQYkVrUXVFU3ZLRlFBaWdCMHRR?=
 =?utf-8?B?Rkl4Ny95YURId1U2RGFsSWdvWjd6SFZlZCtsMEt1cmpMYnRxL0NWVnBERDJK?=
 =?utf-8?B?SlpDYjFNTkhHaXpOYkJRY1VaVmFIZlFBTEF3RmxOck5SUUgvVHJXaDNjc1l6?=
 =?utf-8?B?NGx3MFJsamRDWXJHNEdxMU9PeXJ5QktyYjZwTlJMZm01ZlhlZHpVK25wbTVW?=
 =?utf-8?B?M1dHNHZ2SkcwS1NUdzVDbkk2U2VERnJKczBWTGZPdVgvaVNXcFZSSy9VTlJ2?=
 =?utf-8?B?MWFZSGtyZTdmY0owYUUvS0ZJWWhJcStnMmtuWUNWdDVpSm94UTNXZDZKc24z?=
 =?utf-8?B?RTUzT1hTdkJsWExEdUR1bUhRa1NyZUFvOXF6THpYaVFVRGR3TEFXQ3hvOERj?=
 =?utf-8?B?MGRSTjlxbHlDb3lXV092M1g2WkZVVUxDU2dEenZLTXNEYlpuem1kN3FHUHlI?=
 =?utf-8?B?SnZSbENJMnNLU3dvOHhjakdGU2VuNGZWUWQ4UmZCZ3NDMTZuUHNXZmhYWThT?=
 =?utf-8?B?K1pma3VsQ3hSYWVCVHJUeUNtdG9jU1dDWE80K29kb2Nhc25Ic0ZBcW1QWDlm?=
 =?utf-8?B?dk9FTlJ4TlJUNE5zamlvbjZINGwvRGxxeWRhSmRaOFNwZmkxMFdzVWFiMERv?=
 =?utf-8?B?L2FVRGcwV0JOUDdvdkJ4TVZ5dlBBVjdsUDFFWWhTdGJFZW1scVc4dW1GcC92?=
 =?utf-8?B?SkxRdXR0OFNSMm1nR3Z6L1E3N2VlM3hlWTZ4eUNuRkloaWtjOVRVakN1TFox?=
 =?utf-8?B?RjMraWJMbk42bXRRYUVZaTNpUEVhK2xyY3N4QkdyUlB6SU9FU3JqV0pMTG9m?=
 =?utf-8?B?N0JMcVY0RUhNNVltNHk5blQ3cTZSNzdxS1g4T1A2NnVWRVZZK1hyQ3duNG5Z?=
 =?utf-8?B?M1BVQTdlRWVQQ0VUS2ZEY2w4dWh6OXNWSm0za2d0SmVUV1l6VElqWXN5RXE0?=
 =?utf-8?B?LzZWQVEwVkdmOTBZZ1RRWll5SmZJRC9IbUEwdk4yQUpQYXF4b0dycWRyWE03?=
 =?utf-8?B?aGV1b2VUL3cvNWJqbXlUN2h3Q0ViK3MzY2RySk1aY1F0UXBSU1RCbUpZejhV?=
 =?utf-8?B?Ri9vLzFZZWJML3F4NHI0a29VYVhXRW1tTFQyWFcyRm1pZFEvOTBqYWRnSlF3?=
 =?utf-8?B?SkJDK1BmU2F4N3RacFFsY2V4NU1KL1hMVklta3hWU2xFUHd4TEhPbFlDV3B5?=
 =?utf-8?B?Um51OGhGYkRUWUliSHA0blJ3VnlwUUo5T0E4RXVJS1BXL3VXWkJGenBqZ2NX?=
 =?utf-8?B?V0dUa0lWdm1DQ1lVbVEvWkRNclhsR2MyZW1NUzlib3dSbnFuL2RYdHZDL2dq?=
 =?utf-8?B?MU5RWXM2anlFazBlZGY1RjdmNDBLNXlISzk4MTVQTE1UemhrRHNIckVCdXkr?=
 =?utf-8?B?SUpDVi9lazI3TFBUTnZrRnhlaWVLWlVXWFBEQWNnS0RLSEVUc1BEblc1VEth?=
 =?utf-8?B?aXVneVh4SG56UitkQkIxMFRDbG9wbysyZUJFME9TUEt1aHBOaUQ1UWRmN3FT?=
 =?utf-8?B?T3cvT0RIdFRPcGo0b0pOL2dWenNpNENBWGw3Y1BrbzdrK2s1R0ZneWlQZ1h2?=
 =?utf-8?B?MEZKblMvOXFucHJyQWxuTDNJWStrZUVGYjJYZEJ6Q3FPSlV3RUJIUWkwcmh0?=
 =?utf-8?B?cVBUWmFDcjU2d2FmZXNROHZnRE1aS0QzNmQ5bkZOTG1tMk9oUngvOWZ6YlUz?=
 =?utf-8?B?OVlPUHY1WnFMMU9yM1RoT0JqNHZSUkEzUittMUNQK0pyYWZyajdEUUI4UTRI?=
 =?utf-8?B?RVQweXhiL2ZYU3FmT2ZNQmtFTWh1b2hLU09QbWZXSlgzRmlmK2tLUlBQamcv?=
 =?utf-8?B?NWg2RkpQQmZ2ak0ycWNyUEd6OG44aC9UUEJSNGJNdHJhcitEVmc4UVBhU0lj?=
 =?utf-8?B?WkQ4OHRoc2tvcWdzdE5USWZ1WlJVazZxbmNxTHE0UjJTVUw3WjN6SEh6MUN6?=
 =?utf-8?B?cS95ZUxleHlsemJBK1pQNzcrZHMrZHRkT3E5a2tyN1FZeUpFeFN6QjdmS2RQ?=
 =?utf-8?B?dHNHZlZXd2FnQlNRNEkrZHMzTmFJc0dWeExGUmFWUXFqeE1odWRhdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a647470-a60a-430b-6bbe-08de791f664e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 12:21:30.1699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfPBc4x3fb/X19V8v5bjqLN3Pz7QkVgTW0zT/nsLwH1CTXFdGz4Ue44zlezyuxFEUeOwNiTNfCEiM5bby2t+LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5542
X-Rspamd-Queue-Id: 2DACC1EF8D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11532-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,umich.edu,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 11:39 AM GMT, Alice Ryhl wrote:
> On Tue, Mar 03, 2026 at 10:17:01AM +0000, Gary Guo wrote:
>> On Tue Mar 3, 2026 at 9:14 AM GMT, Benno Lossin wrote:
>> > On Mon Mar 2, 2026 at 11:19 PM CET, Gary Guo wrote:
>> >> I am basically just having `size_of_val_raw` in mind when writing thi=
s. So the
>> >> current `KnownSize` comment in v4 is something that I am happy about.
>> >
>> > Well size_of_val_raw is `unsafe` and only valid to call in certain
>> > conditions. It asks in the case of slices that the length is an
>> > initialized integer and that the entire value must fit into `isize`.
>> > This to me just further indicates that `*mut T` has safety
>> > requirements to obtaining the size of an arbitrary pointer.
>> >
>> > In the special cases of `T: Sized` and `T =3D=3D [U]`, we have safe wa=
ys of
>> > getting their size.
>>=20
>> Hmm, the `isize` fitting requirement is problematic indeed. It's broken =
code if
>> pointer projection is used with an allocation that exceeds the limit, bu=
t I want
>> the API to be safe, so it'll be good if the API is defined to just be wr=
apping
>> and safe (it may return values that doesn't make sense, but that'll be o=
n the
>> user).
>>=20
>> Anyhow this is moot as we're going the `KnownSize` route.
>
> It sounds like that's no different from dyn trait vtable case. Fat
> pointer must have valid metadata, even if raw pointer.

If you have a `*const dyn Trait`, then yes, it's all valid. However, the `i=
size`
fitting requirement means that if you have `*const TypeWithUnsizedTail<dyn
Trait>`, the fixed-sized prefix, when added together with the `dyn Trait` t=
ail,
may exceed isize::MAX and violate the safety requirement of `size_of_val_ra=
w`.

Best,
Gary

>
> Alice


