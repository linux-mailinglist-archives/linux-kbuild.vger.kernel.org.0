Return-Path: <linux-kbuild+bounces-13290-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIH5EAWIDWpdygUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13290-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 12:08:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EC458B5A8
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 12:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1928C30D83FA
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 10:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76FF3AD515;
	Wed, 20 May 2026 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XLKkp0q3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022135.outbound.protection.outlook.com [52.101.101.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6015C3BCD05;
	Wed, 20 May 2026 10:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271303; cv=fail; b=LDzuzTg3LjzEizao3XGjzrFCVqdl3KAqHU7XNa2wlbpH/FeDeAZLhrybOdudKLOxV82OOZA0ickAfwCXtuZhDSnPqXrJtkXF9BEllIXNMhu635OWTA6FumxYUDioPgkC+h8CquPYhbN9U5VI2o20RhNC9wHieKDEFFCAZKEA/30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271303; c=relaxed/simple;
	bh=7+9Kz+jIvcwJvYLBksrcJ8HRpWLZpF35jpkjVyVUQgI=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Beztl8qaVPMAY0Y4X7A6Wohk9L7A4UmDwVMvsn0F4cnl0hm711dB/CZZZjOQdq01yJxHRaMW2HGDHrNd573G633hjcbDUnkoa4CQ1MnfWU/02WweMLFFY02aR3amcjBbEXgQFr+a5nhywnpOnnC7wDdUHApDKHZEgkX3CbUgi9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XLKkp0q3; arc=fail smtp.client-ip=52.101.101.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOcsc3VAHIxPt13+bO7yYcPWFxywbWAh5gne2p6zlYYld1KRroLhc/h7K/8i0J5y+5R5lWnwfA4FQPQakbh9ifdQqBCbA1l9l3XTNVy2F3B8q/2EP2az5KzaS/QWU57QLGJ/7MesnDTdNzmE8seKRJ7XSBqTH9exgNdLkr5IS1axj+RYrxXs2rqgfKMjIIOA/1UYipibJxVKFK386CodTDEKK38BuDlBkjP7SMm03V8ZQN3bnjXclxcxXvScoI1JP7jcD8DN87zjCPu2LNC97fAGD5+YQku7XCCSLQep2tAB36Q8rNj1RbSQDJh253uRtYW7FS2gls6qxGo46/4CnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+9Kz+jIvcwJvYLBksrcJ8HRpWLZpF35jpkjVyVUQgI=;
 b=bl2M7C3/4rTZpZ2MEIH8Tzn26qB5UNi71sZhZ3MzN+PA8u4Z/ETbCe/PNd7gUX3dQlVhKHPiK6wO1zS9f8KMhRhC8UxOgwzyQ1gpV7DnhSpW66NVswCftb2Xc4KdvO8tG94SHWp3JPOizgt1F8bqZyDXlX2Swx9zJ354xS56GxftsvZ8qsjX25KbVCMGGfi7R+m5XUgeLV1wHpEDr195GKknC6XHjC88wJ0e6A7W8E9Y5ztJRkOwzDXinFhaqM0XFJAr42KCnL5InhBzasKsMwm7BlxeF2uvZLWL3gkkLxk+yfVm9DV5JNmm3u+bF5acPoBO0+d1sv1lKa4pvJvixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+9Kz+jIvcwJvYLBksrcJ8HRpWLZpF35jpkjVyVUQgI=;
 b=XLKkp0q3UjhcylDZQQ6P50SGy2k7u8mWzP33wt6WTqLbm3/5e7F5W4TDY6QpVsYEKt0O0rAKiOhv+DGtWbwX3h11Af8h9eY58MevMRgmdDaI/7hFk/z0bIlxWdgOkKlzHxvZIlHFqFN9LKavNWQWt6iCfGRpm66DbYgfq4UxAZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWLP265MB5188.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 10:01:37 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0048.016; Wed, 20 May 2026
 10:01:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 11:01:36 +0100
Message-Id: <DINF19EGPSAU.3OCUDU9NQD6FK@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] scripts: modpost: increase buf_printf's buffer size
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
 <20260430-nova-exports-v1-2-7ca31664e983@nvidia.com>
 <DI7CZA3ISGOE.1CP5YEM3NNSH6@garyguo.net>
 <DIN5QTIGKQ80.11TOOMMQOBGI@nvidia.com>
In-Reply-To: <DIN5QTIGKQ80.11TOOMMQOBGI@nvidia.com>
X-ClientProxiedBy: LO4P302CA0003.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::10) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWLP265MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea8c2b7-d429-4012-0aae-08deb656c7f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|4143699003|3023799007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WTp4lwiy4LfAJMW+SmJpgF4bH66cTI2JDyfC04yKXbvHHy6JImkR0GYVUmLsbbKfmEhckQHnUPrLzXrPxzWI++/2wYaOMcd7FMG8zchMCdySj/AqY3bjiXbgAXjU6nIYQjXGGRwRoiTIbEe3OAF5G9QUfCGlW1c550eWA+XipuUAvJPR4gyq+8nBflxvbt1/XGiG+w0RHFDUuFKvOHJpLpxDQfy5VUa6R4HO83gEWmFvJURp7vwqqhbiJR/wuOnsdvSWnHEM5QOcvO00jQwcBd0NC5hIkcifyDzWvQNyilXiQo2zmEXlp8mBs3AT3Fwmrdchif+MKeOW1Fzo9brY0mg4b2etw186aJxChT2337ctrnchtOMwwVBtw2Ag52VEJ/TKKUGbzcNam0SBhQmmgKL+5gvRnolbq28+vTYSutmm+IFvqBi6PuDl/3D5p1bc8fBy3vDh03iUMyJIiwh58cmsWYa5Mh24z7BYgST+7NLGyW9ALuohSe+zpGc3Rzchtpd/Z+4UChDnOOLLZPq4ks0Ly6jWFwELfsxBJjaI8wmyVfT8ujSpQfXmvCOBX0DgX6FP64G8iuAcTEpmxKhCM+BKppKgmZWzxQgHZ1gXNZU1JyE/aLrZaNR22boiQnro82ivexdXWATrZTucyrgEWKhl/pXTzZIOQJbx3TY0YtTo3/dWikiRSap8Uw+hOdEg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(4143699003)(3023799007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djJyNWM3OWZibjdTQW1qYlN5TmtBMDlkSC9pTDdKdkdzcjRBTG9GZDdHTzRD?=
 =?utf-8?B?S2hhbGxwZGUvRnlIemd5c3ljMHBQNWZRdHNoN0ZGMExBSHBtNjVnQytFaWI0?=
 =?utf-8?B?TmVSVGQ2LzArWkFPY0pFc0loOERzWnVNeVQ1ZVJBYWNPYmFmditvLzgxUkZ1?=
 =?utf-8?B?bGFqa1dmSnVOQWY0UTNXaWE4b0E4b25BWnYyU0RCanRWdEZHeVdtR3JINk1u?=
 =?utf-8?B?aFArVm9xdGtPcGpqMDZvN0ZWTU9PckVaeDJITndudTFhdVlRQVRDNk1jTmtH?=
 =?utf-8?B?aHFEdDIxazcyMW56NlhkeUhTdEJQUXlxTloyNUhYNjFJQy9oL1Ava1kzZGNw?=
 =?utf-8?B?RmlhYkVNdVhYdTBiVjJraTR5Q25DemExK1BBSTBDZnRjeFpvNUtKNXB1UEtY?=
 =?utf-8?B?RFAyM2hlOHMvbjNURWdweW91MkFDaXBTVys0RTJHeDhhUVgyYUt3U050MDl3?=
 =?utf-8?B?a2dwb2dtZXhuem13MG9Lb2JxZzRrdWs2TXNGWDlwRTF5dGs5TnkxanR5UFZy?=
 =?utf-8?B?SW9lUUlmVVhqQTU1U3lPL0p6bzRIZmVaNkYycXRxOFhmd2RCTXl4NFdTYllO?=
 =?utf-8?B?d0hwYkprN29GeDAySExCZ1RXMVVtNXNlMzM1UGdLRjdMTUgzMThzSS9mT0w4?=
 =?utf-8?B?T1ZGdmlqUVgrS0pydzVtRXZHakJ6ZWR2RG1WaURQYzFvUHAwK0xYdkpicTRG?=
 =?utf-8?B?TDNEUU5HRGpLYnc1eUQ1dytqd0NLRWlJNUVzNmVSWC9pb0FPSktLMlN5ZU9I?=
 =?utf-8?B?SXpZQnlRWUpOMldDMVJsN05kTktxTG5ueW5Sd01KNWthOUs4QlEzbXRGbXZp?=
 =?utf-8?B?MkFCd1pCb3dBTHVLRWJKSEtmbDZSZEdyZWgzUnZiYmpZbXBVRVNTOXZ6ZmpF?=
 =?utf-8?B?Uzc0OUNVR09pZjJQUGFQTjlhK2l1S2tnb2xWL25tNmt5NFBjMUdMcnF2UUdO?=
 =?utf-8?B?c2ZlU09VV0FWcU9Nc1JNU2piMURRSnpvdHkycnM4NVNKZFRObXk5TXEvYWdo?=
 =?utf-8?B?ZU9kaGZLRWJEak56SFNrY2xHZXhIbGpaeVNUVXVUcTZlTStoemtUSit4N2JT?=
 =?utf-8?B?MDErUjRDT2QvcEsvS2FJQUNkZVZTZHp2RzJNOFh0T0ZuaUZ0dWNvU3haKzRZ?=
 =?utf-8?B?V2lDMGNIbnFWelhPL2VId1dWZmI2UjBrKzdiTUxaNktTdEt2cWJDOFRCZkF6?=
 =?utf-8?B?dnU2dTk4a1U5RXRtUTNRV2UvQTc2cFFxWHgrOWI1aDU3Z28wWERoRit6Y0Vm?=
 =?utf-8?B?TlFNWFkzaTBnTUdFelB5VXRhMDlQNWtVNUY5ZWdvMlNxa25lQU5iQTNvWFJZ?=
 =?utf-8?B?djF3dzRQdnMrYmUzaCtTcUNlOUJGREJxMTZ6NmpWY0Jqam5FRVlCSlJ4aTZ3?=
 =?utf-8?B?b0o4RS9UQmVoZy9peHhBTVpGZW1qMGl2K1JqNDNDVDRWc0U2c1BSa2FwdUxp?=
 =?utf-8?B?bWt0U3FTMkRIMEZZYVEyYnNIQ2NOc1RyTi9xNExOSG5tRWxtbVhzYlh5WHU3?=
 =?utf-8?B?em9sYklMYmtFbjBic1FZR3pPTi9JRWc2VzJ3Q0tLYkRKVW5xb2tqVGtlTGd5?=
 =?utf-8?B?S2M2RGFQejg4SU15OXdmWlUvZWhhK3VJVG42OUlLVE9rV0MwVDcrQzhYNEpD?=
 =?utf-8?B?YkNudGtEKzV5ajJZM3RIWTJBYVVmKzdWY3locFBaaWhrMG9aSGMxYVR5dXFt?=
 =?utf-8?B?aDh6VFVMZVhSNytjZ2RIV0FLM05ETFJJams5dXB6WjRjNmE4TEZxU3dZNi9N?=
 =?utf-8?B?N00xK3ZnK1lHRzYySW5NNEhkbE1zVjV4V0JYU0dRSjdNQk5JMjRtSmk5djNr?=
 =?utf-8?B?T1o2T1J1NC94UndQUE1zckYzcTBoRVlFWFZRYk9UYVMzamJBMUdkZ3lGbExE?=
 =?utf-8?B?YXBtTUU1WjFXeVhiWTdtbVRKdlcxSkJNYTZPUTgvWDBNdzhlSTVXYVVrNk1S?=
 =?utf-8?B?R0JqY1lGZGFNWHIzODdoU0QxY0NScU85NllNZkpONFpqOWowU2x5ejNGNWdX?=
 =?utf-8?B?OWQ1TjdHNUszRU5uNk43UjFzaHMzbkY0anV4OXlqVUt4VFlGUDNvalgyZFds?=
 =?utf-8?B?MFEraTN4bmFubnY0d0UreHoxK2sxd0tPOGtIUG1FUDRPcTMyejN4YTdYd0pH?=
 =?utf-8?B?dkNYcmg0WnJ6MlBjNHBYWFNZTWduMWgxMlAwV1A0cjNCOWZPWW9UQ0NXRFFR?=
 =?utf-8?B?c2RRaHZaQ0dpNGRTR0tzVURvYjZsRzBjNUxsQ0NzckVMdXdib1JqbnA1R1g0?=
 =?utf-8?B?R2JleTdoQzQvOTdUdG9GTnh0ejJpMEtTWkJLYTVCUCttS0NTNUZQc042R3h3?=
 =?utf-8?B?dk4zU3dkRExycWJyUXAyUlpNK1NhRjZWaTYxY0FkT1lpUXdlbzdMZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea8c2b7-d429-4012-0aae-08deb656c7f6
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:01:37.3522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3hzyn2ijzrVza0+oDBU0W+51EL4AYqUAYrP82Os08/Eked1ecDF0+vMjCOSBn1ZV7mLxTGN149pRr7fZ4pRTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5188
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-13290-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: B3EC458B5A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed May 20, 2026 at 3:44 AM BST, Alexandre Courbot wrote:
> Hi Gary,
>
> On Fri May 1, 2026 at 10:02 PM JST, Gary Guo wrote:
>> On Thu Apr 30, 2026 at 3:55 PM BST, Alexandre Courbot wrote:
>>> Rust tends to produce long symbol names; when trying to export symbols
>>> from nova-core for nova-drm to link to, the 500 bytes of the internal
>>> buffer used for symbol name formatting are not enough, making modpost
>>> fail.
>>>
>>> Fix this by increasing the size of the buffer used to format the symbol=
s
>>> to 1024 bytes. It is a stack buffer, but modpost is a user-space progra=
m
>>> so that shouldn't be a problem.
>>
>> I think we should make sure all constants related to symbol names match.
>> KSYM_NAME_LEN is 512 so this should just be that.
>
> Do you mean we should use `KSYM_NAME_LEN` for the size of `tmp`? The
> formatted strings can be longer than the symbol name alone (see the
> example below which wraps it into `KSYMTAB_FUNC()`), so this should
> probably be `KSYM_NAME_LEN + something` if we align to it.
>
>>
>> The only case that I've been hit with very long symbol names so far is d=
oc tests.
>> Can you provide an example of the case where you're hit with very long s=
ymbol
>> names in Nova? In many cases they're just functions that are supposed to=
 be
>> inlined but isn't.
>
> Here is an example string that doesn't make it, it doesn't seem related
> to doctests but also doesn't occur on all configs:
>
> ERROR: modpost: buf_printf output was truncated for string
> KSYMTAB_FUNC(_RINvXs5_NtNtCs1EKtwoKEMO2_6kernel5alloc4kboxINtB6_3BoxINtNt=
NtCs1peUGmbrgHn_4core3mem12maybe_uninit11MaybeUninitINtNtBa_9auxiliary16Reg=
istrationDataNtNtCs6wA3Ay79aUn_9nova_core6driver7AuxDataEENtNtB8_9allocator=
7KmallocEINtCsfxcgfq7FLKi_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtB=
a_5error5ErrorINtNtB3x_10___internal11InitClosureNCINvYIBH_B1L_B34_EINtNtBa=
_4init11InPlaceInitB1L_E8pin_initB4t_IB4N_NCINvMsd_B1O_INtB1O_12Registratio=
nINtNtNtBa_5types6for_lt15UnsafeForLtImplDG_INtB72_:

`InPlaceWrite` should definitely be inline as you pointed out in the reply.=
 I
have some pin_init symbol length opt planned as well.

It also looks like this has to do with the fact that the type being generat=
ed
with `ForLt` macro being overly complex. Perhaps `define_for_lt!` is a bett=
er
approach.

Best,
Gary

> 608 bytes needed, 500 available


