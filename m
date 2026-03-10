Return-Path: <linux-kbuild+bounces-11753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB4kMzN5r2kXZwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11753-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:51:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFF6243D26
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50E9E302198C
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 01:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301602ECE9B;
	Tue, 10 Mar 2026 01:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="khVBwx+D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020096.outbound.protection.outlook.com [52.101.195.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57992E973A;
	Tue, 10 Mar 2026 01:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773107504; cv=fail; b=V3mRgGPGucboRaYm7Rw/vABiDurFoaPBWvhmbTpNhQIDH918D6iSKUF9p5NX+C1cWmFULj/Lm2RSveQ3ifvyjOB7J+Nltf9Qb9awud4h8gQNYAVQbhCtOwhF/WlReSZ9SujQEtCQ/DfqK37tn6c61/kAMbZNIG/C62mMmIkpC1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773107504; c=relaxed/simple;
	bh=0EpLjToYatR7LMKtit2CszTUoCTW9nf/9XNe2TL38Ko=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=DqQ3ukVnzQhbRZMa7HAFWooMTZFXD8CBLiMRmZbSGZKzxhDuGReWmKv6YrROGh50wfDujKd5eMiuSKOQCTFlsEcYJ4hvdutI4ylp2Wxb0M7inXakezUNAjjFiBkx8SMX1Ki46ZhRU0q7UQ8oy8GeC4rT+VFmyb1NECj1rhaatnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=khVBwx+D; arc=fail smtp.client-ip=52.101.195.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5bC4NrXCra5Gei9J+Zg4nceQ51bJEIq0k/Pz28S0JFnUNiYmQPpmxrIwGE7efpx0lWydljhbwnVcyIEFD5gMfUrCq35GC+OEGyyORUWBVLzuUNkIZzNEfHFIiiZC1LoIP2FJY2YzluNNyrqRhjkekyP+xSnksnnlvyA0DKPkPMz1ugw/XPZJDtpSUsdcL1ty6j0u1SAPyV8fxHlQtHU/LDp0Ll2Kqb9LotIthEzo3f6EsWF24ASYK6IWSKyhg9GBMV2nenNl5KYqRwmN/hSWPXFHBfaX5I1qWGX8YKwzjOIgEk6M3nfyuNmch+FOsjH2kOFlmV1YcoT/sUCX0exog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAa5Uq2ShCUgqc8O+WS4odVB9frWq6QG95twxwSypHg=;
 b=zBrunOHLHpqIStAl1czpigR2AYicwp0m4pQRWjBff1iYyANyoPoqhAXlRPnnjNT0fPYg7XsMfJwJbNAtjVwQb4O4P6Vh1uo0AJSvQ98U288avzj0Oh/WM9FXWNALxk5GLG721FTWwAFp+NzdpP/jdlsTv/MN6Ij5IatYA5XDYJ9s6huQnrfHcD+5Lkbig/HZaWOC62gpWIPDBTHMmAASQwJYgWqdJ3NQV36uoUr+0TFZt52mTzVhfS8XNn3/zYuHqRFXBINfpPeK2GPytu+qlqzWCZ5Tv3y/U9OwdSHhJvjrXdi3yJpXNyA/Q8ZSCC2szDrKT80ej1Of9su99zj21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAa5Uq2ShCUgqc8O+WS4odVB9frWq6QG95twxwSypHg=;
 b=khVBwx+D+/BYPK5BQz0TNUTlQ66A1O+4oFpDxolyNd9Mn3B5bHUDnrErc/EnLt9PORoM3gDuecmMaitexqwlr4isycElmKVU4TZU0iUaVNsRAiDabgN9oIVYijTsh9HxxhqhBJdgS3hc1zPln3EeBs6JL9ukTUTwrcrRHkWw6s8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6490.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 01:51:37 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 01:51:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 01:51:36 +0000
Message-Id: <DGYQ5EYS1LB0.TP93SPR5Q3BX@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
Cc: <tim.kovalenko@proton.me>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
X-Mailer: aerc 0.21.0
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
 <DGYPX7TT8A4E.3KTO5Z5RS17B4@nvidia.com>
In-Reply-To: <DGYPX7TT8A4E.3KTO5Z5RS17B4@nvidia.com>
X-ClientProxiedBy: LO4P123CA0559.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: c68c2c87-750d-4453-2b68-08de7e4790f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	ZTGUcAFgcs83B5Rsy2y6PRe78TE3lRQ/JrJLjZTuJwjt0jxAYwhpguGkVHJvgD7sut+7CHSetVPpvv37DqhEl7Sa4yX6zWNFUTr1fhhhop+QI5wZNCX1UH9NubpkZkUXCBfg1aKHfHBCqbQjhP3NtJ8WDvom4gquc0K/s+p3OVraGXwYfBw1XYdBUqWtE2zhfe4q/lnfZ47tSZ0zIPn4gLyD8h73rzVQ/wLuFGQKG/Wm5qMGdANYbLnHN0q2dsdvnvm8VM+LBKjirlLRNS6mVw8QWVFWnLlrk/RFhfb7YcxvVvnojzyxYNn3sB6zaYPnWi0anrRSSlqiFqXjqmXWRjqRT7lmeg2TzBx6uGwNbRaj46xH1U6eYRBIRrV/0HFanc0dn4RRQb26VdnYhugpAWusX7ghWOtrRQ1cJRgs79EKWJO031gkqmUpB0EtgI8hTtCPsk5TB30vNxAt0bm7UDddEhn1mCMjxLMQVm9EB6NJpZscrXgZlsl5Bf9gf6itg43iTbDhyW6ntT4pimmUg2sALqFPYw+aiAt3n5y/pqXN9eIt8/ZEHCCdViHu3H9Q72I7o7j0kgflnVFaGNF2CXjF/2RX/hVra8NcEMNI2Br3bOdlspLW93NQrZugkY0xdJJhosfYCvyrB5WRQyYd/OxlIaSCx3KOHSTq5iJCZCij50f7EtntZg0jag91zST7v2n2VrqlEd/BPUl4CAvDZp8yP1PxfLq/Tqx6lhk6+V0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M21SS0ZWY0ZCa203bkY2RzFKQUgyd1ViRjVrT09VWERUV2kzTFZvWEVGUHBx?=
 =?utf-8?B?M2NwMHlZQnhuQW02OXowMFg2Y21sUklkUFNvWWZPK2dkRE9NeXpVWHJpQ2Rv?=
 =?utf-8?B?ZFcyWGpGZ0tMTDY1dk9ETE45eU5wZElEbkNJdG5XK3UxalNaZXNSZGVEZTFu?=
 =?utf-8?B?Rkl2NlBXT1RZbE5GbHNSWW42QzBsVHM4elhjYTh3dTkwUWI1MFJzdm9hOTg1?=
 =?utf-8?B?a1JJMFZaKzBRVHh2QlZwQURGa3IycEZXYUdldG1hS2tlRXA1a252bHFaSnhP?=
 =?utf-8?B?NXl1cUFnc3NOb28reEhaaEZtcjdGblJ5ckQ5b2RtYTliSU5pOVJ0ZUVleTFI?=
 =?utf-8?B?RmVxYStuWE02bEFOWUVySmZzQW9UeXRXZGkvd3JPNGwwTzUvRWQrUnFmelpG?=
 =?utf-8?B?VFlETHpQLzJyZ2NvVGxwM2IweHAxdGNGNWJIYlNZM3YrS1VqNENKUDFscmxD?=
 =?utf-8?B?ejFoczh3bFEyc0RFOHphaHNTT2ZUSGhqZzR1dFJSU2FiNS9HOVJBZHV6VXN2?=
 =?utf-8?B?RllwdnVvR1dLQ1d6S3BuUU5Hb0pTWDloclU2bjFjNnFGLzBGRmFaNFY4Qjdn?=
 =?utf-8?B?K3BjNFRqbjllTktqUE11RGZUNjJYczlJN0FuU2oxWFY3aXp2ZnhqNU52N1Nn?=
 =?utf-8?B?RVdSOUtGUWdZSThjM0lFOHVYSTRlYjBrR3BSUFZJTnVORGc1WjEwWHV0M1lU?=
 =?utf-8?B?V0pkdlpHNEVFZVZ6bE96cHJMZS90SHFFc0pqNnNJYnJ6SHc4WE8yNzVsb1FG?=
 =?utf-8?B?bnZBbDI2WEY0bHZMYjYvL2IvZ2dWVVZ3Y2tXdTZ2dTBoT3hzM3RpdXdFaVg5?=
 =?utf-8?B?VFpTRmtZRjFIaHMvL0ZkUjVJa3lweWt0QVFsVlVJeVl5K2lldWtpYzNpcitx?=
 =?utf-8?B?WUpBUFZMVlo2RVlkL0RnZFRpMWRrVFU1aUJmMnBNN3ZBU3NLSi9yKzVVNlJm?=
 =?utf-8?B?eUF1KzdSTDBYemxUc0FHMWtVT2RXT1pSUVMrWmlqaEs0aUk4aVg3Y3VhcU1p?=
 =?utf-8?B?Ly9FYWN0SW1aYjg1VHk1N1NvdG9oY1BpSlA2LzlId05OVURYYnNWdXBmOEta?=
 =?utf-8?B?RHNvMnNOWmRWZ2EwTnBZSXFzSUp6eitqQlZ4OHBGWkVpcmdzMmluVEFGWCtP?=
 =?utf-8?B?ckd5dkpDWGkxM0NwNWN1d1lVajVsQjBVYUxLK2pYT0RFOEhmMTJQTURwWGls?=
 =?utf-8?B?a3BTV1YxeEFVTCtjVkV6N1Nrbk0xbTJYOVdQakw1MjFKRkc1ODZZcFlycG10?=
 =?utf-8?B?ZjcvQ0lUUTRHUkVNZDc5L3h2YmZlTm9EUG41R2RoZ1lnVXlnSE8xWWlCeENm?=
 =?utf-8?B?bGdPdEg0V0U1MGpUUlVjQXcxRHZleDMvWWlrK01FUVV5VVZyWDJXWGovcnZj?=
 =?utf-8?B?T1pDUzB4amkyNmRnMGVUcHVMTEdxSDUrVHdKdUVKYm5BTXZjVmdYdlVDNmpv?=
 =?utf-8?B?VUtKMStZVGVRQWpKMEtjOUlSSDF0U1JadHhOODZvWGhGMXBnamhMRmgwNlFG?=
 =?utf-8?B?a1c0TFhyQUZtVlFMNW4vUVBvM0pDQU9kTjNzWG45OUY3aTNXZ3pRdmMxd0Jx?=
 =?utf-8?B?ZDlsenRzNHpFMUk1bE4zdGhHbnFCT1FyWWROVkVLRWNBNEpDZVl5dTVDTnFM?=
 =?utf-8?B?Mkt0QWFwVXBqNXNJMC9GWUFRWVVkd211c1pQSWFLOTZ3MTU2bnNCUi9mcE52?=
 =?utf-8?B?WWppTzhFY2dZc1N1U3lQUUMrUzBaa2NOd0FLaVo0S0ZMam10ZWUzN0d3eThW?=
 =?utf-8?B?cTAzdHNKekFGeEYrRUJHYW5Xdk5sT0xmUElrQkVXcXlKTzNSQXBWU2UrZGM2?=
 =?utf-8?B?YzNYamp1ejh5elpDMFo4a0gzUWNLYmZlbUZSbVlBNE1FVzJOQ1N1QVRrRTY2?=
 =?utf-8?B?WEhwVk1vZXNGbnFsYkNCeFNpQ1pmTVNiU2xDZDVGUjkyNUpHaDNlenAwdjJm?=
 =?utf-8?B?MFNLTW9RN1FKQUxnZkR1K3RKWk1IVXZYcHpNcFI1aDBNRE96eGRSd3dGR2Ry?=
 =?utf-8?B?UjJ6ejI5Syt2RFF5NFdrc1UraW0zM3dlTGRvYUJ3ZkNac0VOWG52UWFnL2lY?=
 =?utf-8?B?Z21aNXFnbzgxYnhGNWFtVXZiL0dWSnpObXNJWC9oOVN2THRVYUdXRGlZUHpN?=
 =?utf-8?B?MzhIRWhiRkNaSHEvL0wyaDF5NVAvbnVLdXE4Uk8vVitzVDVhZDJHMFA5OXNo?=
 =?utf-8?B?MmRsemlBTHNSeEhGdnorWmJud3p1VllTMWZrNzdJMVBkb1pHWnVndVpXRFlV?=
 =?utf-8?B?ZTVhODBuK1RVaFFldTMwUEdsbGlONEozVklTUDA5Q3ByNEtpYVl1UWE5RmQ5?=
 =?utf-8?B?Y1I4UmYyditBa1ptVnhneGdpL05NaDltaDZ0Y0w4UjVrUFJsNndnUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c68c2c87-750d-4453-2b68-08de7e4790f7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:51:37.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDKXrqDo2KO7rhBin3P7GGz6Jg4XP8RURASgpma231AOgm4ctZ3c7lBN9JDAV8xl80X8YxSXdsgrLKUTIb6/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6490
X-Rspamd-Queue-Id: 4BFF6243D26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11753-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[proton.me,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,nvidia.com:email,proton.me:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue Mar 10, 2026 at 1:40 AM GMT, Alexandre Courbot wrote:
> On Tue Mar 10, 2026 at 1:34 AM JST, Tim Kovalenko via B4 Relay wrote:
>> From: Tim Kovalenko <tim.kovalenko@proton.me>
>>
>> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
>> and was causing a stack overflow with 8216 bytes.
>>
>> Modify the `PteArray` to calculate and write the Page Table Entries
>> directly into the coherent DMA buffer one-by-one. This reduces the stack
>> usage quite a lot.
>>
>> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
>> ---
>>  drivers/gpu/nova-core/gsp.rs      | 34 +++++++++++++++++++-------------=
--
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 15 ++++++++++++++-
>>  2 files changed, 33 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
>> index 25cd48514c777cb405a2af0acf57196b2e2e7837..20170e483e04c476efce8997=
b3916b0ad829ed38 100644
>> --- a/drivers/gpu/nova-core/gsp.rs
>> +++ b/drivers/gpu/nova-core/gsp.rs
>> @@ -47,16 +47,11 @@
>>  unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES>=
 {}
>> =20
>>  impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
>> -    /// Creates a new page table array mapping `NUM_PAGES` GSP pages st=
arting at address `start`.
>> -    fn new(start: DmaAddress) -> Result<Self> {
>> -        let mut ptes =3D [0u64; NUM_PAGES];
>> -        for (i, pte) in ptes.iter_mut().enumerate() {
>> -            *pte =3D start
>> -                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
>> -                .ok_or(EOVERFLOW)?;
>> -        }
>> -
>> -        Ok(Self(ptes))
>> +    /// Returns the page table entry for `index`, for a mapping startin=
g at `start` DmaAddress.
>> +    fn entry(start: DmaAddress, index: usize) -> Result<u64> {
>> +        start
>> +            .checked_add(num::usize_as_u64(index) << GSP_PAGE_SHIFT)
>> +            .ok_or(EOVERFLOW)
>>      }
>>  }
>> =20
>> @@ -86,16 +81,25 @@ fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Self> {
>>              NUM_PAGES * GSP_PAGE_SIZE,
>>              GFP_KERNEL | __GFP_ZERO,
>>          )?);
>> -        let ptes =3D PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
>> +
>> +        let start_addr =3D obj.0.dma_handle();
>> =20
>>          // SAFETY: `obj` has just been created and we are its sole user=
.
>> -        unsafe {
>> -            // Copy the self-mapping PTE at the expected location.
>> +        let pte_region =3D unsafe {
>>              obj.0
>> -                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
>> -                .copy_from_slice(ptes.as_bytes())
>> +                .as_slice_mut(size_of::<u64>(), NUM_PAGES * size_of::<u=
64>())?
>>          };
>> =20
>> +        // This is a  one by one GSP Page write to the memory
>> +        // to avoid stack overflow when allocating the whole array at o=
nce.
>> +        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>())=
.enumerate() {
>> +            let pte_value =3D start_addr
>> +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
>> +                .ok_or(EOVERFLOW)?;
>> +
>> +            chunk.copy_from_slice(&pte_value.to_ne_bytes());
>> +        }
>> +
>>          Ok(obj)
>>      }
>>  }
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee99=
038ad10a16e1e32d 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>> =20
>>          let gsp_mem =3D
>>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KE=
RNEL | __GFP_ZERO)?;
>> -        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle=
())?);
>> +
>> +        const NUM_PTES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
>> +
>> +        let start =3D gsp_mem.dma_handle();
>> +        // One by one GSP Page write to the memory to avoid stack overf=
low when allocating
>> +        // the whole array at once.
>> +        for i in 0..NUM_PTES {
>> +            dma_write!(
>> +                gsp_mem,
>> +                [0]?.ptes.0[i],
>> +                PteArray::<NUM_PTES>::entry(start, i)?
>
> Does `::<NUM_PTES>` need to be mentioned here, or is the compiler able
> to infer it?

The function signature doesn't mention NUM_PTES at all, so no. In fact, per=
haps
the `entry` shouldn't be an associated method at all (even if is, it probab=
ly
should be of `PteArray::<0>` or something.

Best,
Gary

>
> In any case, the updated patch
>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Thanks!


