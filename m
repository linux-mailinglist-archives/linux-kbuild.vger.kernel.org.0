Return-Path: <linux-kbuild+bounces-13577-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2vaMCAuGImq9ZgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13577-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:17:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE47646531
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:17:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=fUEXg8AP;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13577-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13577-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5FF83053334
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78291480DED;
	Fri,  5 Jun 2026 08:08:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020080.outbound.protection.outlook.com [52.101.195.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B7B48B367;
	Fri,  5 Jun 2026 08:08:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780646904; cv=fail; b=srlBJelDD8oOkT8xMjeIBZ7yPm6SS8s22owo06Ji+c/TlbuwJYonwswpySdnfZC5WKJbfZDwM7NqZ0zYFNPQrhclrFSx68Z3UW+/183Yl9Y+mm53AtJ4LXHsm9LfrM+S3Vja96ckclXR9POBLIF5Q1xEHREI23Le5x8To1T4Gq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780646904; c=relaxed/simple;
	bh=aHpciEhT07jAy29lhWPk9gGS6LzE3HDDg6B8iVgnhwQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=H7IBaLwfZuvIiPk1Ns64Q+gK3T6GQgp2zXr6nxLekFDWP+5cgDbQNizTcVC5Z2NgZOfMCIw1kMStI0roT4evCSP4KlSwPrCeGQrAE/VJxXfNmwgYYphtYF8b2bngU89hS/EZxTYh1Nd7EoriIC74Q2q0tPTBjVtpLKozvN7pj84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fUEXg8AP; arc=fail smtp.client-ip=52.101.195.80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qur4POCU3VjMFzPh1NSo6xTDktuabgW+xK9t5mDHxpEL5kR58iS9jFN0S07VeRBhlOAJF2GNjoymDJB39n8SF4PoWu8pmUnOEOHgpro/eaZUQzuciAzWZAefy8JYc67UBgMRPu/a6cjFwm+F6kWF+svBjrUUdhYCWLbibabCyDbupQlOcf3RYp6Uikk//CVqS8iGKpRDKWHn7yRWc9WvNNgyoiKYLYFCQ1cyetg+3c2wccx1kNEOYA/TMhok7aRSwQCoJDQEUTfpi1TwEyCfIfFZiYHYaDHD7GhP9NSV4wwu0fLWNITK28lMFcVuyH89XQLKqA2hG/AYEO6MDAzHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHpciEhT07jAy29lhWPk9gGS6LzE3HDDg6B8iVgnhwQ=;
 b=mLF2o+LiWnEZBv9s7cLTuAqvpFyJQF9TaJman9h9q/evjXhaCOG1IwyT/KBoLDKi3PBYtp5H/lRMG1DcFYNCwogfZ1aJNhbL7vnTGZ1J7JUU3+fBGDjtmbRtSBuhOwwtKCXTLaiM76ETF725hswFMU2VMxifjoQEnAriGPiYZrJCMPLao1a3Xq4cjdLHn4AST0ijOpmdOa1LKqNz8/WMHITZC5ebYLlf+JIsvfeheOilN+smJjY7dW2RqrhXUD1bV2rnZwlzP2U0/ovoK2J04wjiqhJwwr0tAfcWTUcoyQmwOFlFvhPqPUh51BVyts/S2picfmlrze4wWjhb8ZEKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHpciEhT07jAy29lhWPk9gGS6LzE3HDDg6B8iVgnhwQ=;
 b=fUEXg8APSXvTwZJ7BRLQi8NrxyfTeeK7xEGJbSCYN1yv+2AHiurBVnuisJXkt3b5lnO1U9/scqkwvvEU36n9Lz027HXE+ojAo6CHUd4AIHprMFUzzdldNDH1yR85IornpNwGRbVdASAXLP4azkq+rMC3jJvVIIuf1UhLveJefAk=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 08:08:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:08:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 09:08:16 +0100
Message-Id: <DJ0YN7DGQDD1.2O7A7RAXRACTC@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/5] rust: inline some init methods
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
 <20260530-nova-exports-v3-1-1202aa339ef7@nvidia.com>
 <DIZE5YHLR2WJ.1VOBKWU8Q6AWH@garyguo.net>
 <DJ0CR9A8OXYR.27EFEWLDXK5RZ@nvidia.com>
In-Reply-To: <DJ0CR9A8OXYR.27EFEWLDXK5RZ@nvidia.com>
X-ClientProxiedBy: LO4P123CA0317.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b73e93-a292-4474-9a99-08dec2d999b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zyRoDuomEMR8LArgYT5CUQpS0GzWZ+H29WWy6gHayUMmtVBS3xXhNBxnDHIoZVbFatKdPVU+GQH0LLpONUJPRbNdI4rchM/yQdNFOl/Z4nMvJHkVkjfCOfFAiVVZncoQc/HqWRZLOqBQ3cX2iFTE+SoXuIwo6peZhGv1i6EkVcsNdWOyCZH6n/RHINL6vYN+hRanvYKjmqC7VvByIJz2C+Tc/c4RLBJrn3inFYr9Z1Ig53cJPeXK8pec72JzLEdgYhnWWgAt4ddw8I3KeqPSmcJizbrSvMHydWLzfVFtKhftzT3TUmpGmzzcCttxI/i7MadFqHG188JkYSO+yNmLbJR9lx7RF6nG3ndVYhpcJVi2/TPCjDnaCDFi+V0FRETapFA6D/bV8fDW4ZXVeNNNPHS85rh2CKN/+wss+ij/2EVldL9AQoN20eqXLnTDZpuPSXi3vI3xX90TvdGQMnBw5LlF0SdT8q2nwGTmfUfPf4ggFKUEnVAg0m9VwvhhSYTJLtu02bwNS/yiSCNKQC+ignf/lmN5YgvOpDgE7uUdKBhykC/UkMsdgLyUPg5KSJiogDoDpfXA75qeUbotKZuk9uoDzRTjiv5ygiu8zNcRM/jneXRTWVDWGLDylwoKRY21HdbXQXq8TDT0nxxiFJIH6UbZjfsI7f48ZP/S2JvYW2brp0Zh2nP9WGTzkiBf/JBu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODV0L3ljbVZEL3kwVEJjYjk1eUx5VWFZS3JWbmtZQlVKV2U1a1dtSWIyYVBX?=
 =?utf-8?B?TjFmdjFVUGphaEttRTZNUTZQVVdIYjJmV0M4dXE5RDJtTStMbU9aR1haVzBQ?=
 =?utf-8?B?Y01wRlkyWWp0Mzd2USsyZ0JzaWFRUllTNGRZUU1XQ0lZc2V2ZHA1UEFzWlpw?=
 =?utf-8?B?QXlqOE5Ob1ltb25SMFRFR3BGYndoQm1XMEIrZGdWRnM5TEdFU2Q4cjJoaFFO?=
 =?utf-8?B?ZzBrQ0Z1U0dkcXdzWDhUb1h0cXp4Qk94UWg3WmJDdDhmRHBlM3U4aHR1MVkz?=
 =?utf-8?B?djJ1RlZtV0JpT0R2NjdZR0Z5dDlIMENmQVAvOEd6OVhYNGNNYXNmbjhPYnp0?=
 =?utf-8?B?NVZMQXpvbFNVYzNhNFhscGN0S0dISDNrdllxM3F1ZzZSR3Zka1haNCtQWS9w?=
 =?utf-8?B?cVpyREVVOURXTk9icDRlWlU1Q09QcmxFSmorZ3F3b1NyeUNUdkZHWk9qbjlm?=
 =?utf-8?B?QUcrWWxNWnl5QWl0cFFJWitXNnFyRnJnamNRQ2RoQjhKazl3NnhYelZOL3Jv?=
 =?utf-8?B?UVBCZlpKWDNBNXMxRTFIelBxeU9OVUk2TngySW8xS1k5NVVjU0xSN3FzVTJj?=
 =?utf-8?B?aE9UVi9IVlhORTkxWldnbzZRU2RKL1dzVVNrd1N4N3ZCNm9NbmltUlIrSy81?=
 =?utf-8?B?ZlZNWFdMSy9FR1dwVFlSTDBpNWI2VmJWYXBLL3B1L2Riem13eWxkVnJGLzRS?=
 =?utf-8?B?dTF1dzlUZUloaHhsYllyTTRlTTdHQjd5Vzg4WnNUTEN3bnJJOXpDT2VsUEh6?=
 =?utf-8?B?M0V5R0piRURaU2RJM0lvT0lHYWRhd1JmWTRZaTdpYWN4ZDU3ZngwUHNhTlJH?=
 =?utf-8?B?ckQvN0NxREVFOExoUUovKytCYWw4QkRLRjRIcmF2M1o3Q3RaV3FYN0RGVURh?=
 =?utf-8?B?RXVLQVBoSGl3ek8rY3gzVTJicG5qWnFjN3lVYjR2akR6MTkyUWlrL0I1Wmt4?=
 =?utf-8?B?aEVzQTg3WGtGZTIvMk9TOHhlK0V1MFUrdXZJejYwK3lJeTlwUm11bmIza043?=
 =?utf-8?B?cEc2VFRMN0d2OXE2Zm13cGNURWhvWHRXajJOTkljTzBTTFpWRnhrSEF2OG82?=
 =?utf-8?B?cWlxVGdwQ3V4djF0VlF1Sko1RkpjMm1kNXBvOEFQcTFzZGUzTHEzUFI0NVo4?=
 =?utf-8?B?NGhtMk85TkFOY2Z2cVMzUDI1Z1lqekE3aVVPdVBVNkJYeExUSkF1Yi9zSFZ2?=
 =?utf-8?B?Njl2M1Q2a2ZYZXpOZXBkeHB1WGwvTXg5bUhnT0xOYmNTc1ZNNlI1WXNrZFVK?=
 =?utf-8?B?eHUwSm5FN1BNa0RMQXVSWUJCdHlNSjlSYWhyWEhET0VNYjFVbk5hS0xoRXFU?=
 =?utf-8?B?azNIeHlvSGM1VzdoTmNRMkRBYUVGTjJWdVNYN3BFYmI5L3I3ZlBZWkx3dkUv?=
 =?utf-8?B?c2VRZkRKNytkZ3ozam9tUTFMRXYvL1lLbkttYzgvQkdTNEU4SFZBVHpFcmt6?=
 =?utf-8?B?d2E1MHdzQTlDU3ZhVkRCVGtCVWFlMTYyaG1XZjdCNTdkVXNkanRMQ2pIYjlD?=
 =?utf-8?B?T2g2b2dJUzBoS1NyRVNGR3BIU1ZuWHk2QmhQcmMvQVRwUkxzL0NINVN5eEZu?=
 =?utf-8?B?ZXVaNitiVnlmc21kbldkbjRrWnRJNkQrdmwyQWRxQndQcGlwNXNhNDF3Ti9Q?=
 =?utf-8?B?QXozQzdGZWc0bzVyd3FBZDBYL0lLUHJKVzI0ekNmNThWaDU4QVgwQUtFbHVx?=
 =?utf-8?B?NXFNTjJ6dXlTemY1Vlh3VUZYTjZXbXBlOFRuczBhZUEvTjgyeHF4REQvMXJY?=
 =?utf-8?B?R2tOOHZjeDNndWJyc04vTWdENVBzZGdUcTdvKzlWWWFwRGU1aG9ScTZzZnc0?=
 =?utf-8?B?cWZmQmlwL3RFckpQTnZDOXFHb1JNQ2ExeVNkUXFET0Z6Vys5UEFwYi9tRG1C?=
 =?utf-8?B?WmdJS0dybmd5QUF6UXlHMVdoYncxVnFTTUMyVlRQNCtMVG01UlNWcXlocGoz?=
 =?utf-8?B?Tk1NaTJoTkcreEZXN0x5NkhkNzdaMTFLZ0RQd08rZjNRcEZZU3hhWXBlZ1c3?=
 =?utf-8?B?VjhEV1RIbEdSaGU1WDNTSkdnQVpJVjJ0YjZad1pWZE9BRDZ0Y0oyQXVYMnQ3?=
 =?utf-8?B?SlNxN2ZENXhKUmRwN244YVJyNkJzeUZ4S0k3U1Q5OHdRa1FhbFBVUlpzdWM1?=
 =?utf-8?B?SEVqMEJGaUl0enA1Mk9zUlpIdDREOW1RVVZaQ1g2ZVVKSy80THlMYi90dlBK?=
 =?utf-8?B?MytaRUN5UzdpdG52dnVoeW5MTXdFb1p1U1B4RjRKc1lwcGYwdnNObjQ4eXND?=
 =?utf-8?B?U0Ntc1BnS1VNbzlWallvUlh4ZUY4TDNsN2M0NVFBL002RmNUdVRNb2pBdS9B?=
 =?utf-8?Q?AAOcvfy9rXdyIzaSuQ?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b73e93-a292-4474-9a99-08dec2d999b0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:08:18.0646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhvsidfTh3VvEYApZ9CP1Sd0KOL89F6iQktVSLkjI6uFR5pJpg5tkDVL6JzeZVRbAgbke3kRRDXCCdUZiqmeZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13577-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,m:gary@garyguo.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:mid,garyguo.net:dkim,garyguo.net:from_mime,garyguo.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BE47646531

On Thu Jun 4, 2026 at 3:59 PM BST, Alexandre Courbot wrote:
> On Wed Jun 3, 2026 at 8:52 PM JST, Gary Guo wrote:
>> On Fri May 29, 2026 at 4:27 PM BST, Alexandre Courbot wrote:
>>> These methods should be inlined for optimization reasons. Failure to do
>>> so can also produce symbol names larger than what `modpost` or `objtool=
`
>>> can handle.
>>>=20
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> Hi Gary,
>
> Sashiko suggested (and I tend to agree) to also inline the following
> methods for consistency:
>
> - InPlaceInit::init
> - UniqueArc::init_with
> - UniqueArc::pin_init_with
>
> Does your `Reviewed-by` still hold with these methods added?

Yes, it's fine to keep the tag.

Best,
Gary

