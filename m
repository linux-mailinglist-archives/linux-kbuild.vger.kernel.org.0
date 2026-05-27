Return-Path: <linux-kbuild+bounces-13354-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MeND7PbFmofuAcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13354-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:55:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFB35E3B9D
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B74D3064441
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 11:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BB040488C;
	Wed, 27 May 2026 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h7AQkMb+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE6F402436;
	Wed, 27 May 2026 11:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882777; cv=fail; b=u0/kJNAAwYjv5XYzGkXA+PVl/lIdhmb8Sf6WXqC5GmZEJnhS5GpViw/htmm/b8ip92mXoo6Y3aBgY83cAbsjWTRVBGWn/Pz6DlN8h1F9dCwUIwZde3M80FkcUP5l2A99T5odzvBhq+pIlFHnXPlDEQkiIKrwSBM3S+nV5z1th3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882777; c=relaxed/simple;
	bh=YxNpMS9ACxWEmRMviIfoirIL2KCbcbV8yslTJ9nlln4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ocacnPMwXAXp7l9Z/lkNtm4AXQ1YpSi3ECIfydLUQjUoUL8sj5/N9ERbwXKQGjIQiUnPk6KBoV9aadXm3tnqbAa7vIwQH6n3nMyTL/QUSOpY1z4yVJ2uQsFQWrF2ulcFpm5xAYdt1l2A09AIoen7xlDUy2EOlaHD5G3OJL1uIlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h7AQkMb+; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0G3htlITiGy7kzzXfjYv9PVzVizVLmYorhQRkNnhN+jY4cDpHu74B1eIsgmrQq+BRCPi8D5SzwlfX4RsblE7+MkeJPRifjARvvbUnQKe4YJgy+uloujOABWIYULbvKz480Xddzt9W+8PNCR5W2HkCCz9DnTBT1Q1ELsgg0KWRAt82nIh2XDMvkmcrBQdeyGl020aJgkKWvpp8M4tyJlJ/5pncmARiPINvHKBZ9U3d2GgT+MCQd/fGTUnl1GV32H5tTuDPAH4D+X5ecdlHJvGGRX9W0ktCRkvpaAe6SVsxKCTVbIYCOENVXzmlApLNiVxiteoiWCvnoTWZu/BpziqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfcjVlsy3JmZsBOLxwZhMvFqzF3KT3WA7LQA6+/p8sc=;
 b=pSZ1YT7gSchseQUxdcMsrhWfcrFieub1w6rTbuiiP3oAIQfLarPeHSnh23R1o1+H7hrpkGewMXG9cjOFsPlgIxQN9tiExh2ebJldqllf3uJLUH47XtsFa1wB8OZ9AJEZGaFiFZR9Ao0F6cCvN8OvrFmO9KP5Yy7PpS9HwgBQaCF0e9jvEmG/Ss8pysm6HA0yvWiJ3tFQktn8zcMtcZMFj1dv0DXdCXIscakR/KaSUZ9CIYCkDZ6PLiXdVXyZ8UD9ysasGRbwNNKHifabJVWz0p5IGHjMsMkQ1cPcucF0ZedeGhI2DYxV2Z9oOlpshUgBXZLQ1saTaKQt/fewxbOodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfcjVlsy3JmZsBOLxwZhMvFqzF3KT3WA7LQA6+/p8sc=;
 b=h7AQkMb+INTO1zAJOarjVgrvAjjsUsFIzZx1sQRO0VcQOt7uYbNhV5BcAx189M8geJ74I0o4tcvfddeq24PQLLeAhEQnPTHgi4ejv30YeT0l9tnRgmI17bUTNF2GKqSGHSNnLA08XUeqwInfUjCmcExQpM7ex8P1TY9h6YfphvKlnANVF18Jhjf7eT9Uv99wyWBtFd26JXsuFSBRA5uRkYMMn+P3cW0+8gKfPWX8sHBu1CEMAivjYJxJ9Dg/EvbDmMCn0ANawwW19au/M9ywUFWTKzBaH9saaYMcdZHzN6DeTB6qSHZ5jquMz9XWz8a1HIPh9TpGasNdulDFWG4+7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 11:52:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 11:52:48 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 20:52:21 +0900
Subject: [PATCH v2 5/7] gpu: nova-core: emit Rust metadata for dependent
 modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-nova-exports-v2-5-06de4c556d55@nvidia.com>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
In-Reply-To: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: a71dedc3-aac2-4dca-dfda-08debbe67960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|921020|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	e+QV6nq3I3HqJ2vO+IXkarrNby7JcUZoRE/x0ms1iZY/tyd/u0YlSfEBk6QqmJ/I0q3VzR75WVQoNodxRHQ2/5vZO/C+qsZ0CQOfFUwliMipA2WOBt3VfhB4l2cgsXt+zV6gs4h+P1bLcQFsAVaSi6dfTMm0ailhIs33HB4m0zRoxd/RVIuASKKqkru/YHuuAgwEY4MkWv6d0fviEKJc6wXEI4JKn/BetwdfhPqkFub1bwssKXt9H93P6Unz54r4GX+VeibAUmbgdDAZFvd9TkOJdh+7zwCMoZU+h3qoP+YDt+V6LpLml7aZOZw/JPF69J7JP3PKv9F6PVpVIhz1hls/043j+3ycHhyHQSoSsGfwBjHNvYeJdvOhMthumhkSCiLFM76rMoNeFI3xODohdcFIOLaKHXOxkK+cOJ7W71rkxtuNORu+yVaB5/YYYb6IW0RFItHuCfssrWeePLNXEC7XwNIgR2hJ7xUYguiMeGPCqBFwq3BC7UTtVpZ/gumjNJAXyTPQXzZFyngVMPiRqzTmzKZiAuNTs+cXO11r36lbyxr6wUAcIqAi3CFBc7GCmzlOYolbqMFO7G8xJcnwKqurFmqazw12JziNxLrYK2KSV3UJw2WyC1WdYxvhZL7WKYcfz4bjbMUDvVdHvrtmyz6SuZCyYQ8E0rKunhlZMLMaHsyfj7TA81IV5U9l7bOEz3bZ8FMm7AaP4eS6Gud7Xjjr72LHD8fRFwe1RGgzuJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlBIWEF4WExkejFjOEthUitjdk1zRFczM0JEQ2tHdm5jejJZWWRBL0IxaG1P?=
 =?utf-8?B?ZFZ1eTJHSXNXUlBxMVArWXFiS3ZGZUxsVXdmRkdrR3FmYWtkd3FCYmszWmVR?=
 =?utf-8?B?QXJvRUhLa3BKeTB4dmp3TVh2MEgxM1BvSkpvZkJLVHlvM2pDSFR0SXhhM0o4?=
 =?utf-8?B?ZUVCN0hicWxzUXREbHhDYnRucmlNK2VzRVR3S2NOZW1HWFZpSGZ4em5XVGt0?=
 =?utf-8?B?QS84R0thaWxqOEpEb2dqZEdqU2xPc1lNZ1FFdUZHYU5vU2JJWnQvaHV1Z0po?=
 =?utf-8?B?SndxSFlwSlVoWnEvS3Zjb2ZZRklaeXRTanJZWjNhbDVTUHhxM1FubW5jLzVW?=
 =?utf-8?B?NjgzUWxYUjI3cDNkTmZ6NnpJa0hCeFZDNDNlRGoyZVNPNGJVaHVYMm9PN1Qy?=
 =?utf-8?B?cU5uTXVtdW4wcWxnblNTL1lEbzkyLzJIdXQ5ZTV3aUkvem9DNFV4SWlHdk1i?=
 =?utf-8?B?YTRrR2d5WW44bzZUaXNDZGdYR0h3ZkRTTm9rc29XODdZMEpyVzJ0bE1DNHVk?=
 =?utf-8?B?dnJJcXY4SWJibEVOWjRYYU95N0FFTG1aYVdqM1BCb1ZlR0RXL1orV2ZrRDhP?=
 =?utf-8?B?RXRtaSt5SVFGSi80WjVjSXl5UkpLTEc5V1dVeklNTG9nS0lpTXZ1YnBwUm0y?=
 =?utf-8?B?Q2VTZEZPdjR4WnV2UHlWSy9hUlhCN0xYemdBUHo4bDhnUXhwdTM1eWoyZ0Fk?=
 =?utf-8?B?ajJNcDlXWWdaaXZXTlNpVTBrclRNQURZU1NMNTRmTU1MRGIyK01jRWRTd0F3?=
 =?utf-8?B?eGE0aTBqdnBKSUNyN2lsTTFselgxcGJhUHpvYVNETC8xNTZhN1kwd3JrUkVG?=
 =?utf-8?B?T3lheFowamg0SHlJYjNyTG1YSkt2VmpkNVVaVm5PQzlaVk9xcUdxbG1BWmZY?=
 =?utf-8?B?VUthc2d1R1g2MWVVWTNRU0I2RmtaZlErSHFIWGYwNGs3dkJMQ2RrYUFWVW1Q?=
 =?utf-8?B?L25YbGJncm9ZUU9TdkFDY0IxL041N2pNVm5KZjcyY1lIVk91R04rZm9Fc0o0?=
 =?utf-8?B?SzFIbURCc0pqenBmay9Id3l6RzkvQ3NBaXMwRkFGdmZ6NWFkVTMwU25sc0No?=
 =?utf-8?B?TjE1c1JMMnRQT1NNT3k5bmV2ZzNkS1JRMjlBdzA0WXhRelVoZWRNTUtBMnBz?=
 =?utf-8?B?MUNQd2pIMmpzUEs1ZmlqbnpncFE4SzNQUjl4RG0wdzJ5YWcwVEJydnNPZXR1?=
 =?utf-8?B?dHFvNTB2MEdMQ1JnVEduV2crK3puWlBHbHROejJqRTNZRUNheUxNNHRkUGtl?=
 =?utf-8?B?Yk5YN3J1UlV6Wi9rQktZRks1YmhHTW8yOXZQWTVjNzRYUWp1THNQdkp6MVdy?=
 =?utf-8?B?SFAyelJGeUV6cHNaV3RjcVlZQnA5dW8wa2ZLL1ZMOTd5Yy9TUU9sZmNkTzZa?=
 =?utf-8?B?WXhsWFl3a25FVk5mdnF6emFEQ1I5VVZiN3p3ZHRmQ1orcGJIT1BFR2ovUUJD?=
 =?utf-8?B?TkthRC9kWnZTYlg2b1NUcnB4K1NHUlVwT2VrMGprV05lOUZscTg3ajE5dWhJ?=
 =?utf-8?B?SllsZ2N6ZlBQcU5iSi9MekordFdvbU5nOG1ocjZZbzhweDN0RERhMUtyYnBW?=
 =?utf-8?B?TkpoZEE1YTl4VHg2Wm10K1VKdUxrZ0hDTE9HaUtzNngycnpZTEVzMmZubzVW?=
 =?utf-8?B?R2ZTYndmVjRZRWJTUmdGek1iaHlqeThkOU5WSFVZaTFFODM5ckU4c3pocmdt?=
 =?utf-8?B?b2haeUpiRXczOXFnT3NvbXRKWVNqV0ZqZGQ5U1V5aEpKYWQ5dDJHYWlJWk9O?=
 =?utf-8?B?QjRCeFJrQW1JOWJHUGx1RWwxdlo0NkpyemF3dmREM1NqOFFiK21TWDBoSmNO?=
 =?utf-8?B?MmlyWlRtMjg2ZHMxRFV1SmdKL1NubWV2amZqVkd3SnV4ZTRyZnFIL2ZML2Ux?=
 =?utf-8?B?SjdHK3JqV09MZFM4TUVhc2dGR3ROenhPZ3NDUEo2U0hiUjdDUURJcjBiQ2Qx?=
 =?utf-8?B?ZzRDQzk1Z1FkSzN6RUNyOERzbG9VbUNFWkV5eWt5ajFydERJYkttSHAyeWNY?=
 =?utf-8?B?QzV4NStxWkhLVURRamtPaUlIajNkYnI4SzdsM3VGS2NSQkdaWk5nVWc5VUdI?=
 =?utf-8?B?eThReHpmeWwvWVJqaGthV2E0eFBCSkNLOVBpWDVkb3k0Qml5MUx3VGlCR0NR?=
 =?utf-8?B?c3p0ZytGSjhBd1R3a2REYWc0OENGQi9Ec2V5Z1RyaGRZQys3VnNaYzNMSzRV?=
 =?utf-8?B?eUNiWjlaMFpsRHlIZUcxMjRkT3ZTbERwK0ZiSlRsQTdtdXhpbHU0Y2lwVnpH?=
 =?utf-8?B?Ujh3RUdwdHg4UlpxTTUrOVF6MmFTeHd2Qnp5Q0VLRG5iMGhLRkNTeGE4NGda?=
 =?utf-8?B?UUlidVBObVZ2U09lSGNoclU1T0RKY3grNnNWci9hR3JwY2ZKQzVFcVovbFNv?=
 =?utf-8?Q?1rXOo1pPWuZqxzDeGR8QOWCiqiQfqHyU9uikMM5LtJ0Bg?=
X-MS-Exchange-AntiSpam-MessageData-1: mN4sEzNgPyIKcA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71dedc3-aac2-4dca-dfda-08debbe67960
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:52:48.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYJVAGLLAxZQKAG5JQDUZw0VoZe6+eJQwj77Z15GqE7TNDFb80R+hdJcuPWpGj9WXg8db8yz57nD8jwpYrBy0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13354-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9FFB35E3B9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Emit nova-core's `.rmeta` crate metadata so dependent Rust modules can
resolve nova-core's types and functions via `--extern`.

The metadata is exposed as an explicit Kbuild target instead of relying
on an untracked side effect of the object build. This lets dependent
modules ask for the metadata directly, including single-target builds
where `nova-core`'s object may already be up to date.

This is a workaround until the build system supports Rust cross-crate
dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Makefile | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index d31bfb04921f..7e2c62b9a597 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -22,3 +22,27 @@ $(obj)/exports_nova_core_generated.h: $(obj)/nova_core.o FORCE
 	$(call filechk,nova_core_exports)
 
 $(obj)/nova_core_exports.o: $(obj)/exports_nova_core_generated.h
+
+# Dependent Rust drivers need `nova-core`'s crate metadata.
+# Expose it as an explicit target so they can request it directly.
+nova_core_rmeta := libnova_core.rmeta
+nova_core_rmeta_private := .nova_core_rmeta/$(nova_core_rmeta)
+targets += $(nova_core_rmeta) $(nova_core_rmeta_private)
+
+# Build in a private directory to avoid racing with `nova_core.o` on rustc's
+# intermediate object names during parallel builds.
+quiet_cmd_rustc_rmeta_rs = RUSTC RMETA $@
+      cmd_rustc_rmeta_rs = mkdir -p $(dir $@); \
+		$(rust_common_cmd) --emit=metadata=$@ \
+		--emit=obj=$(basename $@).o $<; \
+		rm -f $(basename $@).o
+
+$(obj)/$(nova_core_rmeta_private): private __modname := nova-core
+$(obj)/$(nova_core_rmeta_private): private part-of-builtin := $(if $(filter y,$(CONFIG_NOVA_CORE)),y)
+$(obj)/$(nova_core_rmeta_private): private part-of-module := $(if $(filter m,$(CONFIG_NOVA_CORE)),y)
+$(obj)/$(nova_core_rmeta_private): $(obj)/nova_core.rs FORCE
+	+$(call if_changed_dep,rustc_rmeta_rs)
+
+# Keep the metadata available at a stable path for consumers.
+$(obj)/$(nova_core_rmeta): $(obj)/$(nova_core_rmeta_private) FORCE
+	$(call if_changed,copy)

-- 
2.54.0


