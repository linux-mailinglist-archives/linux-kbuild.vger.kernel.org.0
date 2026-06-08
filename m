Return-Path: <linux-kbuild+bounces-13640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dSluFNDVJmq9lQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13640-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:46:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3D265779B
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:46:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=qtWLTmki;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13640-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13640-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF1853083AFF
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3CC3B27F3;
	Mon,  8 Jun 2026 14:32:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022121.outbound.protection.outlook.com [52.101.96.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1D4071E3;
	Mon,  8 Jun 2026 14:32:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929160; cv=fail; b=gNOyAtHybFp6vL0VJlC7OcV7S5ewubZEOrULFsnZOtrGeXwgtK/C7vtRL1zc0Raz5c2YbKTdwhzvHBFTyTdyjB1gG0BAzVk9T09F3+GMbuIcTIOkOZQ3EXSuuV7FfSmNH4p5udw5ezzSl29UW1Tq3akwwc8zHURnsLM576Gltmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929160; c=relaxed/simple;
	bh=IDw0VLnYNEDsRMZ7FGjQ45qwJ/Iw3/pH2QtlNo1b2ro=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ua0SkaAbRaIVRAPvUriE1hwD3ViCwGjwa71tGSEb+ijGDf4dZLpLXh9S3f2ztkXI2vyB4Wyn3WxqyCRxGQblc1F0j5JsRNbaY+1GtdiQe8QbQwj2x9D7mnnpbIvZtJ3L9fLURB7/mCLqsQkxlQPBNm7ygd6x0mSnK5gW2QOzmfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=qtWLTmki; arc=fail smtp.client-ip=52.101.96.121
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8SUxkFO5enm1etbsElFmyrQ1ey6a6wtxcJ6S3dxJEcXJ3KLrqAYq/3SqHrlDv2q09FkaMz5bBvijtbmgGMinExkK1l3K2WTgEudxJwiiM7B+ulUX7d1B+ZJGKKG0mjdBevUlR/sGfyMI9CdaAzQgQ1aPjI7F77tH6UgTSBlnQw4vvwq60FAPbeb/MG7FB9qGleM8fPk5tw0P7o7AiTfwuL9lcwHFRhBqyi2At8BPkEVi/K11MsGIkSD+vbsEhByu1b65L3oLtBQly+lJmC6DV7lnaoI5UhY5Y/u77WPzExYYZbDJdaRtiFRCBQkEsdrz+gYfHIBVA0VVMP9DXHUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/knTC6WM+MoGYqODH0kE8m5Nt/nRtECoA7U5G8EySuU=;
 b=cfTt9Ggb8DSZseKezXYgBIL0M5GfrZ3aGbrpEsrNr49W40wwbHRcFiDEcwlYaFhzDblZD9KnlICX21xJr7xb955ouFQX1GBWW636ZZaYnsjwDnhgq3tkhrHd9OKTxyUXOIFztHw+Yvw/Sy4QtQnJjZFx4ZTn1382dxWgeTHCmB8fs4281HtRPPq0KQaUy7yOhiP21tzMi+diTISS7JNTwZEjDfc8T6MsxJHEtbeMcHO2bxIrWiljyON1znEgb8SHVHBVPVwycY7ZDlnBgXEdlNnp/ShD50FXpohzjpsjRRvk5mrgpHC2oLksf0fQSvaQErFAh5TfkQQaVtmzhgADxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/knTC6WM+MoGYqODH0kE8m5Nt/nRtECoA7U5G8EySuU=;
 b=qtWLTmkiEIIPmrl5hnUmuPBWyb4ai8N8wSYox5BfMm+w5vffuF/Qz9dE8ganUl2CuzWdwqib6VV0gO5qdolHjzglVYoVhxPLoGHjQ0zDzSJQXN03m16X8VALF3EP6LtrRhXnjplX7qe3S3INcw5Tn6RhidTL0isJ2BcpJnTp0Io=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6973.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:32:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:32:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 15:32:33 +0100
Message-Id: <DJ3QP2IPKKZV.2L0CY2KLXP4LD@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Joshua Liebow-Feeser" <joshlf@google.com>,
 "Jack Wrenn" <jswrenn@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Subject: Re: [PATCH v2 19/19] gpu: nova-core: firmware: parse
 `FalconUCodeDescV2` via `zerocopy`
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260608141439.182634-1-ojeda@kernel.org>
 <20260608141439.182634-20-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-20-ojeda@kernel.org>
X-ClientProxiedBy: LO6P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d0438d-cec7-4c5a-5bcd-08dec56ac7b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EAZ3iiLeRD2Hx40YhNnUXmS9vqGyFBSwlspTcxtoUzzlwdxHDmNHFqI3liYAcn+d1p9ilthnswbfwLAxYnT611V0f/Am8vXj4+DB7JZ31vNllwbyH24MrWY8WM2jUVzsahyyqKfKld3jUrVsOoV5hApqs3SEGiMkk4cexZZy+/n0x1II723UX2ZqAJDh6F0NlLDw+G3dx0Mthw5g6V92Zflj+bn63OhEQ1e+ZpbiTWGl9s66fI/VQnrOcUD7yOvMR3/H+WjL7FRFf4mso1Z7P89HAVDyFyydlzgNEEI+UuqB7lzOPT9dXoHyAIupIFd8ToUHA3LVNRZAVLF5qAD1LQXOHGWWRwlmvbmKtmb55eKpXrmE0ZpiAEirOMYFSPLfZ+q2BKx6Sild+cFoQbrVFUEMKLIFm4fALJjIVBeS80xq1+5GJa8tu+D7nAdSQKK3mZrcj4RPdetpkTOlotlkn2OgsN5dWxzG1JDv2jtbOhCUX20o5cadmYjWD74ge9qWrlJhYakHnfvWRW0mhc1xGq39SZ59ToFzTO7gIPvYsZrQK7pjD1iILDA+650t8b2FskhFYjLaX3I1yBImAom3MhwxtIkbgK3BpKGX5g4caIw8JH4VM0gEloPcFOu9BLyqqgxs4bRWID64oJyBDQ63CWFWnIatkiDoof3FNvvkwV5mm8A4foW/0G/Dmm3i3jqi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHB2YVJMTnpyWjZPYlovY2k4bW1XVjFxb1Z1WWVGT2RTRm9XQXc1Vm9tSGU2?=
 =?utf-8?B?bGI0WVBRUW9lWFpMSGIrVWpoWVN3ZEQ3cEhIZUhEVU5Tdnp3cTBacmlmLzVK?=
 =?utf-8?B?UENFejBNZWtJUjZVWkk5ZlNBTm1HSmluSFpsTEY1akowaThPNDBKUFI5S0NT?=
 =?utf-8?B?Wk9vcWtieDVqZ0hJTlB4T05DMm56R1BDN24zNmJZS1NYdVkyU3l3eUY5all6?=
 =?utf-8?B?bEFjVkdmZFRhMGw3eWlZaWlhQ2VLT2gyWFYveVg5ejUzQ3NZeE5JNU5xM2cw?=
 =?utf-8?B?NWo5ZDZTd2JkQnNudEVUQUJocERDcTJ6V3NQNTJaRGphd0J4eDdZdnhhaXFY?=
 =?utf-8?B?WTZZWTh6OGhIMHNXK05oZ0lQdk96ZDl5OUZzbGpjMkR4dmZjRmhrUThETEE0?=
 =?utf-8?B?WVQ5dkdQT2lZTUZ0WWpoT2RJRCtrSVY0K3IxY1liVlVKeC9jWkx0ZFBYRUdp?=
 =?utf-8?B?UXJPTGlhUnh4MFhqUkE2d2tkRkZJZEoyeHJQM0xOOC9WV0lBblgyUm8yNXpN?=
 =?utf-8?B?S2I1ZnVsSjJzdHpNRmtzOXVaZ255d3lDQVcxMHg1Y04zTk5DQzl2RXI0a0lD?=
 =?utf-8?B?Tk1FSmlwVnBjcVpQUVRYTndoMHE3T1JsYjJIbjFKc2lZV0EvRzB4SUgzdzBX?=
 =?utf-8?B?UTlPME4yQzBvWExRSDZnbklwV1RaTjkzRE1ubHpBSnJveXZiNUhjMHp0bzR2?=
 =?utf-8?B?Smw4TnRpQWZ5WXFnOGlrSFBTMWR3a3FaMS9uNDlwdFdVMDUya0FMWXMrNHNU?=
 =?utf-8?B?UUc5bG5GcDE4OVowbi9RcUJLL29QUmcvYUpyaFhnSkdLMUhJSnRKUXpLdTRF?=
 =?utf-8?B?Mk0xV0lvd1I5RXJVV21iVTVRSEVCeHoyek40WVlNc2Irb3I0aUVGK2preHJ4?=
 =?utf-8?B?UVRQNStWY05PUW9vQWsrWG4xWHloeTFXUnVrM2ZBdjZrNTJvTGY3ZjkwMmVS?=
 =?utf-8?B?QzRxOFkyNUJyOXYvdXljSWxudFJQbVZNMHBINHJFV3JhcG1aaUE4VnFBRzZK?=
 =?utf-8?B?Vkw5amo4Ly82akhFV1NUMS9IT2dXMUpFMzVkUkdLRmVmeTlkaGlCdkFZS2dt?=
 =?utf-8?B?TFdZak9CVG82cXBYNy8vWTRXemlEYW16SGViT3l0eDVHRzBlbm9JdmlVTXc0?=
 =?utf-8?B?Ly9vVm1rUnJxamJQNWlVZjBZNjk5dFJhQW1qQW9JeEJtS3c2WFYrZTJmZTNz?=
 =?utf-8?B?NG9PWHc2ZExZeFpvcDJDZU5vakhrV3JRQmt3eDZFREVQVmJ5d3N1ZHBxbG1l?=
 =?utf-8?B?blhOUDhOR1NTVWQ3MkJjeDhkTHVBYjNvR1J4QWFPR2ZzeFN6ci9VdzZvRW5D?=
 =?utf-8?B?d3RLKzArZjd1bytwYTRuekJjZEtTbXBGbXVxYTN3ZWpZQkJzUTk0aElseVNO?=
 =?utf-8?B?RVYrb2s3VkhNbWg3R2paV0l2YTRJY09vTzltaHBWVE9MQks4cnk5V0VTMDl0?=
 =?utf-8?B?SE16dHRNTElHMWN4bnNiUTdOWGxuSzBWTWsvWkRId1NuVHFWOFg0VE1venJp?=
 =?utf-8?B?K3NaR3lydW43cFBWRmdkdGxJaGhYbWZjNmxxaHUrRWV0Zlhzb2lUeGZsTjdl?=
 =?utf-8?B?YVVGMnBEQ05qU1dZNUxoMjZxZTVuN29zdWNHa29zVHhWeEtOYVVUWDVwQ0pl?=
 =?utf-8?B?OVdHcFdoNi9nWXZkZ2J2b0lkV1YvQmNzTjhPbzNkRURBM0FrMm5zM0pvWDNL?=
 =?utf-8?B?Uld3LytndVBxUE94M0l3Mm9kNWZZVCs0eTR2RkZzYkNBdDRid3BpVUpOSStv?=
 =?utf-8?B?TUNlVGFtbG1HNXMrUGw1di95VUEreE9KMGo4R3lkVWtkYXNDT1lyR2NqZHRJ?=
 =?utf-8?B?SU1lcVNKNDVEeTRaUWJ6bnk5RjgzcWMvbkI5N3BwaUFQNXZnT1hMbytCSHp1?=
 =?utf-8?B?U0J3NnljOVRxKzRRMFVDOHprQXQyOHUzR0RscXVoRzJmamw1M0pBOUhSTTFu?=
 =?utf-8?B?dDFENTBvU3Y0QmxoZk5heGI0RlJkRTlDQjRwOUlLS1V5ajcvOFA1QkhhSHVs?=
 =?utf-8?B?UlFVUzgyUmhFUm9JdXF5OXE4RGoxbjgyalhDUmhyYlo0c2t4d1VlQ0U3YSty?=
 =?utf-8?B?SXU2V04xcVArRmZSV3B3RjVUZURSWnpBVlBEM3BoSXUrR3IzYXRIWnI0a0ov?=
 =?utf-8?B?bnhDaHk5OE91VU5SRW1veUltTGJpSVFRK293QTVtMzY5bDVFZUYwQWhMQTFQ?=
 =?utf-8?B?SU9rSEtYTXJQd0JFeHZkNTB3QnMxRVhZZE9nZmI2MGd3S2hha3JqaFNaR2hu?=
 =?utf-8?B?YnU0SUxjeW5QTy9HTmc3N1FObW9naGFraHM4NzYrdmNQNTArYVJHOW5SS0JU?=
 =?utf-8?B?REdQVDh6V3JLdEpQUVdHVmdUNXFUYWg1bjR3RStud2wrUklGL1lxdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d0438d-cec7-4c5a-5bcd-08dec56ac7b7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:32:34.2483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJGB4CsGWXvCHFpJZGcS0ArDIykSKrR0Qx1kMOMCcNN0kCt4wnwa9rHAl5EMP9y+Fl/ebBygVJ0G5nDWh3LoVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6973
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13640-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:acourbot@nvidia.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,nvidia.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,garyguo.net:dkim,garyguo.net:mid,garyguo.net:from_mime,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C3D265779B

On Mon Jun 8, 2026 at 3:14 PM BST, Miguel Ojeda wrote:
> Now that we have `zerocopy` support, we can avoid some `unsafe` code.
>
> For instance, for `FalconUCodeDescV2`, we can replace the `unsafe impl
> FromBytes` by safely deriving `zerocopy`'s `FromBytes` and then calling
> `read_from_prefix`.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  drivers/gpu/nova-core/firmware.rs | 5 +----
>  drivers/gpu/nova-core/vbios.rs    | 6 ++++--
>  2 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 6c2ab69cb605..ad37994ac15a 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -48,7 +48,7 @@ fn request_firmware(
> =20
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
> -#[derive(Debug, Clone)]
> +#[derive(Debug, Clone, FromBytes)]
>  pub(crate) struct FalconUCodeDescV2 {
>      /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in Op=
enRM.
>      hdr: u32,
> @@ -84,9 +84,6 @@ pub(crate) struct FalconUCodeDescV2 {
>      pub(crate) alt_dmem_load_size: u32,
>  }
> =20
> -// SAFETY: all bit patterns are valid for this type, and it doesn't use =
interior mutability.
> -unsafe impl FromBytes for FalconUCodeDescV2 {}
> -
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index ebda28e596c5..8b7d17a24660 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -16,6 +16,8 @@
>      transmute::FromBytes,
>  };
> =20
> +use zerocopy::FromBytes as _;

Is this still needed given the prelude additional?

Best,
Gary

> +
>  use crate::{
>      driver::Bar0,
>      firmware::{
> @@ -1011,8 +1013,8 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDe=
sc> {
>          let data =3D self.base.data.get(falcon_ucode_offset..).ok_or(EIN=
VAL)?;
>          match ver {
>              2 =3D> {
> -                let v2 =3D FalconUCodeDescV2::from_bytes_copy_prefix(dat=
a)
> -                    .ok_or(EINVAL)?
> +                let v2 =3D FalconUCodeDescV2::read_from_prefix(data)
> +                    .map_err(|_| EINVAL)?
>                      .0;
>                  Ok(FalconUCodeDesc::V2(v2))
>              }



