Return-Path: <linux-kbuild+bounces-10704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D2534D3C318
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 10:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 34A5B6855FD
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 08:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866853C1FC5;
	Tue, 20 Jan 2026 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eGPMxdRn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048303C199E;
	Tue, 20 Jan 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899283; cv=fail; b=gmYxZqeD42xNU2kcDKgVQrBtmuzIrbrAGXzPijN3VbOuqbKg0ndii+1mlMCAcsDoLNtzdTbEqbGWv2RxLke6A18TGInvbIMwAfl+Vq4rMfxdsK8eJ3KvScSQqbf8Bd+ldsL/mP7jcgJfjc7xHyPuj63qp2WNHvvjOJV/aO3OJDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899283; c=relaxed/simple;
	bh=xy9NjPoCg6lCL6VH6CC1Qjjn/rbhEONo/oRsdJ3HodM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z2Em5RYqHas94por3gix3GLEv1XQaZMe9FOQwdyysS/GLsUHV3R5VNExCACqTPl5yeoTiXHGXxVyBeNgraZ7JyAJilL5YNy7Yi1uYqkzgycxbBPY4ZTh0flq2r7csbWiuRJigwOeDtH2bJGB/4o0lHOEcfvIJZAmbRhQ57oS/pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eGPMxdRn; arc=fail smtp.client-ip=52.101.56.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfG0N8QBEi19lGxGf26ju+KB47pmhsDRKMKqq4M/zYhiZ9kiw4BsGL2YVPHRBzDfavwtzTn88t3U1HVq0LDaZYnQGr3KH0PzjYMSkKKYtwn405a7zuSfO+b4PCarT2FuizrtWsDvweTmIgpmJxu/iFP3LrlhgwDZzqm+pbjsrOXS+5N4cBpoypx2skHMJuwhlWBPL6hm/3Wq0rYfmh/zApFoBakB5RYaxHkNzfrqxo8Gl3iZo1o57diR2IkBTRKk3KLjL3pDwQmnCh0K7U+ExL06L1qVjbJuPFbcopHrmkn2OfIeRbAeYSxSAET1OD63W2E6JkwGLz4/rgQnz2fUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/GSjKQIy64ewi8MufxITGMfmVs+KsJ2Ya0vA+ukeuA=;
 b=VvajWdt9MUQPiz5WWfLFaNCTDUD2AnzRwVXki2D+d8eKky3T7irq0fJdaOGXdgM2cyZRgav3BAZyUW/rbs/TObmRvH09x2Mj1NxmTlhH6tOw6MJCbiUmmv//9QNL2hl3+R3FTVQjkYFbgrEwXh2cdVk7on/gHHgQJJ8Bb9cZ38Jwp63T57/87GPjyIoE+Pm1QtakvUdy+UEFrI5H9vTSiVeicGanUjl4i3329jG9dsiNuyApvXW918aCVLGB7AnthGN+rWXonOtSi3//8rIEWRyU5MHHf+LGbxqm8cW6CJL1G/TrxCB3WPYz4ToSRpC+7SifZfWsSLzNfGh00pHlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/GSjKQIy64ewi8MufxITGMfmVs+KsJ2Ya0vA+ukeuA=;
 b=eGPMxdRnAuDD96TJTunZenQOPU98/QmwEUsfY/1okiVFqfCoKJRadeC1K5cSC92ayVGAFMo+i+/ua4auLDhVLhGwF/1KzA2l66jDvA2z3jYcvgo1+QDcHNqkC6sBwVgqMc8oAIWs7Uqa7dcxwqJfn9URwUQxavxODWP8ufou1MdpVmtmh9kwmnSLsfSp6j0lZ/j/9dPoS3TCaAfxMbQvLgmaPSP10AXuiD/q4rH+A9+bRXorF+EE4MRxkFTCVgAw1Xn+EH8l8SYHEw7kPsx78FDFQE4daKBjS8NYWP5DSAM36Oh7gaLKSyyhLuiq192Mw4fAWWk0r4oxq5q7fsPZTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:54:36 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:54:36 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 20 Jan 2026 17:52:55 +0900
Subject: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot crates
 to sysroot_project
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 7114df09-7dd9-4f7a-33e5-08de580189cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTdTZ3pzWnY2NFl6T1J0b0Z5N21tNE9MVitsQURZbFRiMGUzT0dNcVdTVGkz?=
 =?utf-8?B?cWxGVW9nY2lOZ3R4aUdNR1QyQkF5dmgyM2dDNDEreWV5TVlSVFU0ZllHUjF5?=
 =?utf-8?B?YjJtdG1SQ1pXY1VydENpNEZxYjA3WjRtZjh4S09RRndXc1h1N3crZzZTNHZn?=
 =?utf-8?B?RmVCSTVYZ0tWV3M3ZG1UTkVzNER4bGZpOFFYOVc3U0xWcTdZYzcrUEh5YjZE?=
 =?utf-8?B?SWM2Z0RzWEZRcGdrTTIzUEhGMlBXZ2NUYW5oM24vYjdMWWZENFdVRzZicXhS?=
 =?utf-8?B?MWRPQUlIS2RGc0VDMjFDeFRWTStFYlJJUGRoVmI2RHhKb1k5R0R1cVRaUjFs?=
 =?utf-8?B?dDhMTUpYK2hqakYwSHdKTWJuVEpYRG5QOWlzM05XRzBlRDRuZHkxei8xNVVM?=
 =?utf-8?B?Qkh2UE5HRTFnR3ZzUVQrU1NhWlgrVmk1dU9PM2U1cFRHQ2QzQVo4VEl4V0ZM?=
 =?utf-8?B?OGo2Q09OZ2Y5d0ZGem02OHJWcUtRcHRpYzIvUXg3Unp0bHVPbzlGL0F5bXdK?=
 =?utf-8?B?MmNEcFZCQzFJTWpYUGFick5hRkliN1hOYjMwNHdJVVVGOHdzTFFLQjN5TmYz?=
 =?utf-8?B?cVAxNStZWGFVL0hqVzFOdGlzQzVWeUVvekJiZHJxaURveEQ4QnRwNkR2dGkv?=
 =?utf-8?B?ejdrZ1BwVzg4ZHEveWhLZWo3SWNOdkwyamxINzlHOElyMThhWWhPV1VZTzhQ?=
 =?utf-8?B?Ymtld2dEL283K2phK3N2bUpvRGl1UXpYNFN4QnhHNk9KeXZaMFVXYmlBWVZq?=
 =?utf-8?B?WUpLQ3BVdFBHckVrbFFkMWJ5VmNidE0zbmtETUplYThWWVZaT25LaDNoVDly?=
 =?utf-8?B?TjZkcGJtWFlKVXVyUUNHN1B0ZVQ0ckNac090WjFVOFVrcWZUZzNaZUkzM0xT?=
 =?utf-8?B?bW5RdU8reWE4NDh2ZlZETlFTNXRBemFRT3Juc3NWalRkM1RUdmFkTWtwL0U4?=
 =?utf-8?B?MXNBTXg4TmRJZTZYaWFGVGJxUEpNalBQV3BoRDJmSU1MbllTNUkwenhobDB2?=
 =?utf-8?B?YUg4T2VjazQ3VjBKdDdnME14QUk2ai9YVzFudDFIWGRpck5pRTlJUUpxRVZh?=
 =?utf-8?B?Ull3TGNEQjdvUHJkL0tEZ3gyNXluQzBPMXZHUDEvYVNhdGhRdDZSVXU1dXlT?=
 =?utf-8?B?ZVlSbWduK1B5QVZmYTJKYXhJWFZlUGREaERvYkFnN051M1RxeWZuS0MzaWtu?=
 =?utf-8?B?Y1c1cXpjYVNyQVlQcEIzeWZyT3pPL3F3RzFFRlhuSHdsSDg0azMwWnNENTdi?=
 =?utf-8?B?bmtISXAxOGJwZkxlb1pPQldIaE1YbU1LMS9pNFNZejY2c0dKRWZNNndoTUdH?=
 =?utf-8?B?ajB6VmNUN2tUQnlGclp3WnZrVVJmQkpMckIvVDVHcnhUcm9jUTR2THl4ZVdI?=
 =?utf-8?B?UTlvaFk4RWQzYlRYYlk4S3lxVEhjU2hubktPNzBMdlNUb0JzODNCa2xZdHd3?=
 =?utf-8?B?dnd5OUFGWXBGcU1lczdNa3N2UTFTSlE4Z3ZZUjFkRFVIMkZEM2lHWlFrZ0Fl?=
 =?utf-8?B?T3gyZm9MQUYwanlkTGRZWEFHVDN1M2ZaaFNWYXgxcmlDUjc0b1BKTk9nQmFh?=
 =?utf-8?B?RVp5U2dnNUhDMU9ETXQ0T3Y3NTBJUHdGek9BVHgzblNmcGswNDhqeEgrYzVU?=
 =?utf-8?B?QVU4N1NnSjcrcnl4K2pjSTYza05pL1U4R2JhYmMyM1Z4aFNyWFlGenVaa0Ev?=
 =?utf-8?B?ZmJwaEpjdWd5bmM1LzZRWTRJaGxIS1JKNXpOVXh3M0NwUDh0aVRuSkk1SktR?=
 =?utf-8?B?aWVjR3Flb0xoMEN4b1p4YVhWVXBGVkpnNzh0YStYYlZHUzBzZG1jZHNrN1Vj?=
 =?utf-8?B?R2dqbmpnVENJOGZVMGQvZUQzNEhNU3VyNllnN0IrRDhKNjk4aVQzbHZBQXdG?=
 =?utf-8?B?WUVhb0NvdTdaSjltZHlMb3BrSmR3VWZhV2JaRno2eCtLOWxLUnZDeW51NlBK?=
 =?utf-8?B?VW5ld2tzSTcwMVhlVjRqMWtNajczbDVHZDJ2UkZjOE1uSCtpMUxJdGNjZ1FZ?=
 =?utf-8?B?U0tnV3dVNkpmbWJmVzFBclZTWlZKdjhoMXJETlNQVmZ2SU4xdDEwdXRGWjJC?=
 =?utf-8?B?OUw0VjAvQ1A3aGxXTXNlZ1BSOXdoQ1FQUGdML1dRaytOOHlnbGkydVpFMDhu?=
 =?utf-8?B?VmorWXBvOG84YWdXZHpJcnpyVjVqenVQN2lPSEcwMC9yU0VVM01VL1ZPWTZo?=
 =?utf-8?B?K3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUJHQUJ3R0dhazZoRXJEdVdCblpYMjlTV1l3UVpYT1gyUmJoOG5aaEtpODU0?=
 =?utf-8?B?Q1ByejZsUzU3SFkzYW9YNVhiRXJxRi9IREVXUHVyWk1LVklYZVA3KzNxRmE1?=
 =?utf-8?B?Wmpsa2FaMjZzVmRIVlE5M3dtcGtoRHpqQmNKOEMrUytaNE5lMFFMTFVNSUxJ?=
 =?utf-8?B?akZySDROZG5URy9heFgzanlaaHdzaHppKzE5MWJwZ1JwNUd2a0lCanorelNt?=
 =?utf-8?B?aDVYTHkwWmlsZEJSMGZWa2syeTVYZEdqVkZ5NDk1RTFtODk1cE1CeVVnZlVi?=
 =?utf-8?B?d0JBRDAxVWg5dlZ0aVdnc2Mvb3dWSGQrUFFFVDcyUXhkN2kwTjZUWklPODlC?=
 =?utf-8?B?STF2dUZIOUhBWXZEMzhHY2MzZHprTHY3MWNoMGg2NmhRVnVvbVV3cUxvU3Ax?=
 =?utf-8?B?aXhwWlNieWdFaHlVYTdlRkRMNzNWaXVoRDl5UThoMjl5NU0ySlU1SnA5NzAy?=
 =?utf-8?B?bEc1WHhXYnM5ZDJ2dWQxeHJ6ODVWSnhoSDY2clFYZmFFd1RKQjVEK2hxWmE4?=
 =?utf-8?B?RmRDaXBHaXVsaEkwTnFWQTRBT3BLQ3E0dlU1bjlvK0V4Ylk5SjR3eFVRdXo4?=
 =?utf-8?B?QXhXLzhjaEpGdVNRdFE4YVFEdDF3SFMvMkxDc2pqMzFhQk1ZeEFXVGVUTHNj?=
 =?utf-8?B?R05MUUdySlhLay85Uk9tRFpJZDM0RC9wZEFIUjNjSEpmWEczSzJXYWNLUEZL?=
 =?utf-8?B?dnovMytseUsxNytNMlJVYTJMN2tCN1ZCd1ZTS0IrcS9RSFh5Mk1zd0hJaHds?=
 =?utf-8?B?MkNhRkgzWUtUZHRNSHRJQmhwaFBHVWtpT0xDMFBXYm4zOWdobmdMTDEza1VH?=
 =?utf-8?B?RTdhaUlsTmxZS0Q2YTdTcnVVZjl6Tms2YXVUR0hseGVpd1BXZnduNUg5TGls?=
 =?utf-8?B?S2thbG9IUFJtWXRzMmlpWWdGTndrMTJwUHNEbEhpQ28yUXA5eUw4UkhPYUJZ?=
 =?utf-8?B?eXdvWjNNMjAxTGwySzF6REFWTmVOTjhRdUFuZ05sMGpiWjhISlRnc2UyazhD?=
 =?utf-8?B?WlRlVnNrY3Mwc2dzKzd0Z0dBREhTMmFpYm5TM0s3SlJOYjAvMnFOMEtuU2gx?=
 =?utf-8?B?cXdrZURmcWxzT2ZESVdJRVAxdTJORi9uZjdYRDBwemNkWm9NSFQySGk1N0tJ?=
 =?utf-8?B?NzhpS0ZBV0Z1WDl3NkU0SWp1eWd5M1VHUWVpNmhzTlVhZTVkM1JDWFczWkto?=
 =?utf-8?B?S2VvZGhFSzhxQytIMnN3T2x0ZnorbXdpNUNjVHhoLytFMm1Camp4NENUSXFS?=
 =?utf-8?B?TVBtMHJ0b1J5dTVVeC91bG8wYjF4Zmk1RHRNSFpFL0VIRXJCQVQwUlVQYldm?=
 =?utf-8?B?NmRQZGJTN3hDVDN0eDRyREV1aEFRT3JwRTh4dnVVUXg0NXdrcUhZRlk3ZEM3?=
 =?utf-8?B?UGNHYzdMWWN0dFFxV2NPd09TMDNKNWpWY1dNQ0lBYjhldW5ETjFYaHNvYXNo?=
 =?utf-8?B?QmY2YjBuc1dtelNRV1hBUWxWNVVlV1hLeWlEVkFmSWpKZnpZNGp0S2dveE9F?=
 =?utf-8?B?VGZaV0l6aHJBTFBIVDAzaEh2SE96ZEV1Z1JUVTZNTlZya3IxeEF1UkVhdW1V?=
 =?utf-8?B?bDg3ZGNhbFBkcjJRNjVDZmRid05pMlhRM29GdGRuNmdTOHl4Zk5mUitaYVR6?=
 =?utf-8?B?VjVpWVFPdWJIY3krZUlRZ25peTczdUdLbU5VRkdpZFZGa0tseW1vN25IT1NL?=
 =?utf-8?B?azJVMFFxSEVtTVZFMkllOTZTbEJVZWRuUHgxL1h2SWp3SnNnYm42SG9wcEFQ?=
 =?utf-8?B?bmp3VzhzK1Z6dzZsODdMMFd5SUdKeFVoS0F6ajRNZFEyUW9tVnJrVDhvV29Y?=
 =?utf-8?B?elpsbEp4VWljOXBEdHRTUk54TzFpV25GK1RZNTMvMHNiSGFwZllMTmJSNDF1?=
 =?utf-8?B?ZlVUbGdiSXoyVTh2RUllY0NweTk5Ukc2a0JsWnVOanU2V1I4d0JDZUs4Qmg5?=
 =?utf-8?B?aWtNMGtPZllLSVRZUUp0VE4vWlppVVl2eXV4UjRFa04zV1puZk9waXR5SlB3?=
 =?utf-8?B?VFNXQUlia1k3TUFHOWsyU3ZVRHRyTC9HWUFHOW44TkpzYVlhelBJbVhOczdP?=
 =?utf-8?B?VFFWalNSUG9qZzF1V1hpZUc5UnV3VUZFVVlqZ2EvYjNOWndVNDB4dGdlbXB5?=
 =?utf-8?B?bEhFWE4rVGU1WHowd0hzL3NaOEJoTnJic0dJemVqei9oa2NhNnJlOHVvZ3hN?=
 =?utf-8?B?U293SDRkRzQvWUd5TG9uK3ZzU2tSSzgrSE5BV3lFQnVjcFdYTDZNK0hwbll5?=
 =?utf-8?B?dVRYelhrS0NjV2Vwb0ltZGlpZyt2bnNwc2VDMjB2ZVFaenM4Y3l1OW1MdXMz?=
 =?utf-8?B?N0E3aXlqSmczU2lZV3lWcFdCRFhaRlVqb0JsdXhqb2dJdDYyb3IzRmlzajdj?=
 =?utf-8?Q?q8QZN4wcjg36uvpdjkiACMB8Z74bfLvlNLyjifYfC/mSu?=
X-MS-Exchange-AntiSpam-MessageData-1: z0zFYaHaUZ44lA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7114df09-7dd9-4f7a-33e5-08de580189cf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:54:36.4539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttyc78BgFih3rV4dSbBER6LYo87+RXiruDxycV5/c10S157FPJGfN0j7AHsgq8T1BCr04j3Aspo/LZL7rtK/pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Use rust-analyzer's sysroot_project feature to properly configure
sysroot crates (core, alloc, std, proc_macro). This allows
rust-analyzer to correctly resolve items from the sysroot and
automatically add sysroot crate dependencies to all project crates.

Some sysroot crates use #[path] directives to load files outside of
their directory but still in the sysroot. This is disallowed by
rust-analyzer, so the sysroot crate are not properly loaded. Loading them
using sysroot_project tells rust-analyzer to let them load anything inside
sysroot_src.

The sysroot_project field was added to rust-analyzer in v0.3.2328
(~1.87.0) and is silently ignored by older versions. In that case,
rust-analyzer falls back to loading the sysroot via sysroot_src.
This basically works, but the advantage of using sysroot_project is
that we can make the set of features/cfgs more similar to what the
actual build uses.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 scripts/generate_rust_analyzer.py | 118 ++++++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 48 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index ba2f6b0fb99b..f8666050a997 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -27,25 +27,14 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions, crate_attrs, common_crate_attrs):
-    # Generate the configuration list.
-    generated_cfg = []
-    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
-        for line in fd:
-            line = line.replace("--cfg=", "")
-            line = line.replace("\n", "")
-            generated_cfg.append(line)
-
-    # Now fill the crates list -- dependencies need to come first.
-    #
-    # Avoid O(n^2) iterations by keeping a map of indexes.
+def generate_sysroot_crates(cfgs, editions, crate_attrs):
     crates = []
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
     crates_editions = args_single(editions)
     crates_crate_attrs = args_crates_cfgs(crate_attrs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False, is_proc_macro_library=False):
+    def append_sysroot_crate(display_name, deps):
         # Miguel Ojeda writes:
         #
         # > ... in principle even the sysroot crates may have different
@@ -72,6 +61,52 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
         # assumption if future edition moves span multiple rust versions.
         edition = crates_editions.get(display_name, "2021")
 
+        cfg = crates_cfgs.get(display_name, [])
+        crates_indexes[display_name] = len(crates)
+        crates.append({
+            "display_name": display_name,
+            # Paths in sysroot_project are relative to sysroot_src.
+            "root_module": f"{display_name}/src/lib.rs",
+            "is_workspace_member": False,
+            "is_proc_macro": False,
+            "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
+            "cfg": cfg,
+            "edition": edition,
+            # Crate attributes were introduced in 1.94.0 but older versions will silently ignore this.
+            "crate_attrs": crates_crate_attrs.get(display_name, []),
+            "env": {
+                "RUST_MODFILE": "This is only for rust-analyzer"
+            }
+        })
+
+    append_sysroot_crate("core", [])
+    append_sysroot_crate("alloc", ["core"])
+    append_sysroot_crate("std", ["alloc", "core"])
+    append_sysroot_crate("proc_macro", ["core", "std"])
+
+    return crates
+
+def generate_crates(srctree, objtree, external_src, cfgs, editions, crate_attrs, common_crate_attrs):
+    # Generate the configuration list.
+    generated_cfg = []
+    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
+        for line in fd:
+            line = line.replace("--cfg=", "")
+            line = line.replace("\n", "")
+            generated_cfg.append(line)
+
+    # Now fill the crates list -- dependencies need to come first.
+    #
+    # Avoid O(n^2) iterations by keeping a map of indexes.
+    crates = []
+    crates_indexes = {}
+    crates_cfgs = args_crates_cfgs(cfgs)
+    crates_editions = args_single(editions)
+    crates_crate_attrs = args_crates_cfgs(crate_attrs)
+
+    def append_crate(display_name, root_module, deps, cfg=[], is_proc_macro=False, is_proc_macro_library=False):
+        edition = crates_editions.get(display_name, "2021")
+
         crate_attrs = crates_crate_attrs.get(display_name, [])
         # Apply common crate attrs to non-host crates.
         if not is_proc_macro_library and not is_proc_macro:
@@ -80,7 +115,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
-            "is_workspace_member": is_workspace_member,
+            "is_workspace_member": True,
             "is_proc_macro": is_proc_macro,
             "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
             "cfg": cfg,
@@ -100,37 +135,20 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
         crates_indexes[display_name] = len(crates)
         crates.append(crate)
 
-    def append_sysroot_crate(
-        display_name,
-        deps,
-        cfg=[],
-    ):
-        append_crate(
-            display_name,
-            sysroot_src / display_name / "src" / "lib.rs",
-            deps,
-            cfg,
-            is_workspace_member=False,
-        )
-
-    # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
-    # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
-    # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []))
-    append_sysroot_crate("alloc", ["core"])
-    append_sysroot_crate("std", ["alloc", "core"])
-    append_sysroot_crate("proc_macro", ["core", "std"])
+    # Sysroot crates (core, alloc, std, proc_macro) are in sysroot_project,
+    # and their deps are automatically added to all crates by rust-analyzer.
+    # We only need to define deps between our own crates here.
 
     append_crate(
         "compiler_builtins",
         srctree / "rust" / "compiler_builtins.rs",
-        ["core"],
+        [],
     )
 
     append_crate(
         "proc_macro2",
         srctree / "rust" / "proc-macro2" / "lib.rs",
-        ["core", "alloc", "std", "proc_macro"],
+        [],
         cfg=crates_cfgs["proc_macro2"],
         is_proc_macro_library=True,
     )
@@ -138,7 +156,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
     append_crate(
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
-        ["core", "alloc", "std", "proc_macro", "proc_macro2"],
+        ["proc_macro2"],
         cfg=crates_cfgs["quote"],
         is_proc_macro_library=True,
     )
@@ -146,7 +164,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
     append_crate(
         "syn",
         srctree / "rust" / "syn" / "lib.rs",
-        ["std", "proc_macro", "proc_macro2", "quote"],
+        ["proc_macro2", "quote"],
         cfg=crates_cfgs["syn"],
         is_proc_macro_library=True,
     )
@@ -154,20 +172,20 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
+        ["proc_macro2", "quote", "syn"],
         is_proc_macro=True,
     )
 
     append_crate(
         "build_error",
         srctree / "rust" / "build_error.rs",
-        ["core", "compiler_builtins"],
+        ["compiler_builtins"],
     )
 
     append_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
-        ["std", "proc_macro"],
+        [],
         cfg=["kernel"],
         is_proc_macro=True,
     )
@@ -175,14 +193,14 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
     append_crate(
         "pin_init",
         srctree / "rust" / "pin-init" / "src" / "lib.rs",
-        ["core", "compiler_builtins", "pin_init_internal", "macros"],
+        ["pin_init_internal", "macros"],
         cfg=["kernel"],
     )
 
     append_crate(
         "ffi",
         srctree / "rust" / "ffi.rs",
-        ["core", "compiler_builtins"],
+        ["compiler_builtins"],
     )
 
     def append_crate_with_generated(
@@ -204,9 +222,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
             "exclude_dirs": [],
         }
 
-    append_crate_with_generated("bindings", ["core", "ffi", "pin_init"])
-    append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])
-    append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
+    append_crate_with_generated("bindings", ["ffi", "pin_init"])
+    append_crate_with_generated("uapi", ["ffi", "pin_init"])
+    append_crate_with_generated("kernel", ["macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
 
     def is_root_crate(build_file, target):
         try:
@@ -234,7 +252,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
             append_crate(
                 name,
                 path,
-                ["core", "kernel", "pin_init"],
+                ["kernel", "pin_init"],
                 cfg=generated_cfg,
             )
 
@@ -261,7 +279,11 @@ def main():
 
     common_crate_attrs = args.common_crate_attrs.split() if args.common_crate_attrs else []
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs, common_crate_attrs),
+        "sysroot_src": str(args.sysroot_src),
+        "sysroot_project": {
+            "crates": generate_sysroot_crates(args.cfgs, args.editions, args.crate_attrs),
+        },
+        "crates": generate_crates(args.srctree, args.objtree, args.exttree, args.cfgs, args.editions, args.crate_attrs, common_crate_attrs),
         "sysroot": str(args.sysroot),
     }
 

-- 
2.52.0


