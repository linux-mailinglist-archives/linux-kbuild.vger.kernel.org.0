Return-Path: <linux-kbuild+bounces-13352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCZYM4jbFmrVtwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13352-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:54:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8C5E3B45
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F1C83056371
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 11:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FD03DFC7C;
	Wed, 27 May 2026 11:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J52QuhzE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279F93FDC00;
	Wed, 27 May 2026 11:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882771; cv=fail; b=iyPA3UBHAv3388pR460SFFd+82H2xHErANL8FNccx+V3tXn8NT8o8vHrir7boWpo3iJeCfQKnPEZYNFAArx+wilG4ui+qhvY1yRc9W1SqDDOaiLsTa8QKWwce62alWP7X/BtBjp4U3GiQBAB/l/wmmpQ0RiHLaeF+QQSXueUGhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882771; c=relaxed/simple;
	bh=garOLx9cbyJI7I87bkuMb/ZIO4arUIokU4VLpPje6g4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bhZEhtTmG/UqhcwgsmeaC53wW8ykd7ZDflGBjPpYZ/STJI8ib2UkWFCbt8KS1+WanF8wFHsi9mFNRmUntG7osIz5DIjhrTu6DsVx8InosnwJamZxVlau0ZKAQQxzZ1wl+o4x9rf3Q7gCQZdhevLnNlQ6Sf30ofkjLVtOvqjED3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J52QuhzE; arc=fail smtp.client-ip=52.101.48.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4l8TZH9dscKkmiy5QoXFA9Z1JyFqEbTqA13d3l0jRBsFcDIUNmuScgeQ/0Qq5S5jZZ5Rxaz8W+sB5VPsNrCeD4MyJuukc0/YEpXdiSWqFCbBJ9tQthnOF3c5pyC8C88szxlnnAftUkY99xYL7zIDHBxDz6ORBbHHzrCI6B7GprH9b0viCwlPve9vRNjRStHPTy0TW5eqPJXt34K57osXXbkzlP7dHSObLaymM6I/TGszoGSk+VH/TOYRequF95fQc5MGUdv1A5Fh+a+8NQ6ZrPARy9261njwA43bUZqb6W67yUo5d7z5qbrk/9cULORmjyLy9yLWTb2K3Jc6LWUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeZwT6aI/YbwOhUAOpNgcyIhF25j+ueFXGBUO6C5sfE=;
 b=fZEhgtn3xgCQwebiLiJ8RFtiR0emudM+zFkSuWO9LWk18LtZBBY6tS/FdbXdEn4kMSN6Bnw7et09wyN8y0tif8Wrn4/NbH5f8iHDdS6rVA8p+44eoxKcpiUkf1k71E+Rl/xeBJKkVwEYuDCIQIULOdj3IfL7u96Ra8T/Yi1uQyoPBcRMZikgN9XPE5f4xRKHdlvEgDbOIIJzvON3/GP6LSTLIIUmNPoRpU300iLQOTeGqiM2sel5yScvccN6Xp3NIcIqO3oaJCCPsQc71FQHBXm1dhX14dtv0CgZDWHQ2d/t7D+qTo1AKOOwQm1YZN0UjTLefbQd5u93tbA+Rq2uUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeZwT6aI/YbwOhUAOpNgcyIhF25j+ueFXGBUO6C5sfE=;
 b=J52QuhzElr2PonzbpOugIbgMSV0i+P87E1vkSs0ICKKxkHGC93iG/SCHq9Sr2z2sh4wwQ9MFui2UzOIIpMWAWkaXMljH3dN1JLz8IMmUiK4A5il1zdn3j2ED9HCwlgUCFaqzEELMYBMmvBRPOM6htIzQNard1Q6G0Cx9oo1hCK/TnU/1sTLITZYum+zwsnQLBsfhuUaBjE7AoZ5oMpUl/CZ9yTJZblmsJugoxa8CjIrMoHsB+K8ZWAlGkpNRQlfg6VqnxeNFefF3qLzine1/6+Q3ixt7XBJY7N16Jw1/45PsVYl2un2YaoS9BiJG0xj8EBkhuGrzAXIx1cBkGdUQdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Wed, 27 May
 2026 11:52:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 11:52:41 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 20:52:19 +0900
Subject: [PATCH v2 3/7] rust: always inline some init methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-nova-exports-v2-3-06de4c556d55@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 64564c2e-ab56-409b-5aee-08debbe674b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|18002099003|22082099003|921020|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	UmZam9zRMia7LoRpGebAmM8gSr/JIlKFLtTVLhpPiqIbiZUq9wUOjoYGBKt1yYAmFNB4IHb8pJ66wqK+EjxJ8MAi8ms3dgbdS0Nz1m1uSWVWYFvqwLK+mNMPSkrMykVAV4eliAeGJaQVmEotOu5I+IYmTgOqR14l2ySatJ8w6WzizSAjn1vGDLbkTgQ7EQ2IMKweH6UzGYWmxQRWd9lUAU8sBF3RDI3/gWcsc+aGWRCCCiXnZGnFgKSAGButTXkgUW4EnjfI2XXvcDcy/7xT2clWzDw4QWllJQCAjqj8729KXlQ00tN6Ud0T3031OuNNezj/pvoucvp9z0pwdIolliTd3n2SVg01KJ2EF/iTYdUrY4vF5n+YVeHeNvGCrf/b9kAphAkYsgsGLKYTOq+o+omI6gcRj3YcD9QyOK/br5W6B5ZXFGxsROTZVyDXy0R9Q3O8oLXoj7qDDrDIND/CZJ1OOJ8Joo4wNeHMdv4hK5FjZQEnyx4NoSF84r7GD6CQcMiifi82ZHpKLGm6QVehrsSeDueK/txF+GG1yAdBr8EK4LMcQs0yG/3licYzu0iv71FaYUrjwrt2yQzsEQkudhu8FirO9+ltMdsV0Ad3qerZEh7fy1CZhFKvpPyIXLIikxUx8WFs7tZglOTupeq8QgMC2C1gzBwzcWYD4eZDXO87jcPDYP4H3wys3nx7EMkBgVsMM9K1r5Jzi+zaMhDWJkDUKsKt4c6kRTDupO7BgoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(22082099003)(921020)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czdYOXFjblBKSWM3amZEcGI0ZWJidU5rZDhqcWZ6dnl5cG5hSUsvM29tUysz?=
 =?utf-8?B?Y014RytlcURmVWRCcHVwdnlsU3pFanNWdHFOTkk5TTUzNXVReFdPRW4wVzEz?=
 =?utf-8?B?MHFHanpqOW5nOUlDVi9BcGNSL3NJZ3I5VzcwQzV1ZXBQR1paTjZUV1BOMERx?=
 =?utf-8?B?NWtJcWNBTk81OW50RW9SQUp2L2xHUDZmQW9LVjUya1FENUNFbjFmcWJNcHIr?=
 =?utf-8?B?NWtqa2ZSSndvbjNpUWJYSHpBU2Q0TEd6QTVzejZaNXdMRUpwK3M4ZTlDNzhC?=
 =?utf-8?B?d0J3b3Rpek1NMUYyWVQ1VFdyN3NMMThhc1JpNlZjT2hOaHlRV24yVGV3N1BE?=
 =?utf-8?B?Y3BWMEVOVk9adm9hbkNYclBiY3BHdXZjZ1pkaVFyS01HS1c3eFgrOEEyUHI1?=
 =?utf-8?B?VURmWmFSU3JqRGlrb294U2IwSGNtVThvc1NuK1dPUnVJTEpSQXpiQlJLM1Qr?=
 =?utf-8?B?QXhOMm5GU2tOd09UUE1tZi9vL0QyMHVVVFo2VTJ3TS9KMjRURktEV0xuMHo4?=
 =?utf-8?B?VjlzZmdORkhFTUFZYjkxS0J5YU8vU1d4WEVtYVpBQjN3VTFtSW5pVVFLVHB5?=
 =?utf-8?B?UDNjT2dhTE54ZmMzNll1TkRtSGl2ZmFkVkxDNXAxalVpZXZISHhHOE5Ub2h4?=
 =?utf-8?B?c3Yxc3gxTi9mTTlObHRQaHVQbUpsQzBsTkVjZlVOY0dZVUVqbXlsNEdqWCtB?=
 =?utf-8?B?bTZUWHZRczJoMElOZWwxWEp1V1AwSWEvT3BuRGZqR0NoekNnOFlrMzJBeXpt?=
 =?utf-8?B?RkJWWUxicjhmZFhQSk84RmJsRDZwVE1kUHNyUHBNZUhWaDhQL2piTWw3T3V0?=
 =?utf-8?B?TDFHcndRLzg1a1dTZDlsRGN4b3BvcW9iK3FxVEtNOWNBOHliNmhLQW1qYnZm?=
 =?utf-8?B?S2VWb3R3MVYzT2JXYjhDQm54VHlja0ZQcTB6cFhxbnBoTDlYQ3F5ajJISHpy?=
 =?utf-8?B?VzRkcUN1Vnp2NitiN0t6UjBMaE9rV3k3VjZrOExpK0M5VHA4SVRnYnRSdHJU?=
 =?utf-8?B?Zm44VUJlNFZGandTenJwT3FNY1pTYUloa0dxYXJHN2Rwd0RYeEFhSUt2ekdN?=
 =?utf-8?B?YjN6ZTAxbUovUnZ1SEI4THpZYWZaZHFqVVZhTUZLUk82V3JGaFlpbVhhTkgz?=
 =?utf-8?B?S2FJZVM4VGg0Zzl2NXBUbEVWK0JJUU5XQ0lVbzRvSitKSURXekVJOFpVSExH?=
 =?utf-8?B?RmRMcDYzL1BYR2ljZjVBb0luVGphdVhMb1lMVmVDQ0xDUzNqaEZ3S1RhZ3h0?=
 =?utf-8?B?M3N1cHNOVU9EamRmNHFtMjhrYTU4eTVvbDZacjE5bEptbmE2SllqQnBrdUUw?=
 =?utf-8?B?ZXdsMDVGcUlDQnhhMVhwVUlFbTYxeDBWTzZCU3d4Y05oYU5IMnRZYzBrVFA0?=
 =?utf-8?B?TUQ5MXpSVVJkSDZDYldEbjlHZWdQekYzWkNWT2pwMGFBMDlCWHBNdXE5REpX?=
 =?utf-8?B?L0RiWFp5L05Oa09FaXk0eGs4aWY1M0FxeXJpaTQweVlSb2wzRnZVNkZaRTBp?=
 =?utf-8?B?dFZiYnRwUGQ3eDhHdkxlSStKSENMSDluTVhpa2YyYUdyQVZLdVp2cjBxK2lN?=
 =?utf-8?B?TlhaYU9yNXllQ2JaS09USzgveEFGdHZHZkpWMkIyTmVCUXR1eXgvNnZYN3JM?=
 =?utf-8?B?OExwQUUyM3hMSHkzNm5DWjdkYzU4RzU4cmtzZjdKaW5pSEs3MnVNUWl0N3Nn?=
 =?utf-8?B?ZUx1NE5uMVlPU3d0eEV5Sk9NblgzMGhPZGhYYko3b3NJSjZMQWJXcVJ2dEMx?=
 =?utf-8?B?YkJrRC9HUGRnSjFiNmNaRkIvSDFYOXlqZ3Zmc0tsc2R0eHoyZVRBTEZrWTY5?=
 =?utf-8?B?TndxM3pVOTRaWEJiaEU1WWFUcUp5VHdCdllLRU1ieEx4NDIyUTNrQVhKeVZL?=
 =?utf-8?B?akxzT3dVeTJ5bE5yQTl3TEdMV3oyUEpIYU1DRzRHdm9CYkRmaWRiYVgyRE9q?=
 =?utf-8?B?RFNTbXRtdlNZSU54N1BpTmFRdnlydUQxcnJNQTZZdEJSZklRbkplNS9veXZq?=
 =?utf-8?B?NTNtbko1emVOcnJZa3E1cDc0MzlvZVNPY1FTckRBdnNnc2RnbFE2U0dsa0xS?=
 =?utf-8?B?cmdXUVVqd2liSEROSm9HdDVFNWh5dXlmaFVrbWtxd1M2QjRvTTl4d2NQZjhE?=
 =?utf-8?B?OUFSMTdGalBBdDJucjhIRmxIQ3o3QVhmNHRTMkU2YytjVzFkc3Y4NXB4eTBO?=
 =?utf-8?B?amt0NmZZUkdQNEZXS1VrdlE2T3ZGRUNrZmZXeHVsWGhiRjQrK3lUdCt0V2Nl?=
 =?utf-8?B?Qk83cWlOd2ZlVHN4UVN1SzZhOUt4RkQzaU9MSVFxbW5vS1dIZFd4MFZON1BT?=
 =?utf-8?B?NzFjdk9kek1vRHNjY1N0R0N3a0d5NEhaTktNclZxa0M0S0VNUzk1bVQ5Zmk3?=
 =?utf-8?Q?t8qb6zIu0HsIt4IRujMgOq7B0y1MvRkPQBJQ+4bKEjdZ1?=
X-MS-Exchange-AntiSpam-MessageData-1: I5CVvW76hOQjCg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64564c2e-ab56-409b-5aee-08debbe674b1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 11:52:40.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYxt1Ypj36fR8GF+yFSUbfq3TOsSy8TSQ5ly5K1hPerkR1DyVSM7N89d+eLxML5IK0xkFvqOrhMn/SsvZ2EMcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13352-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 48C8C5E3B45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These methods should always be inlined for optimization reasons. Failure
to do so can also produce symbol names larger than what `modpost`
supports.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kbox.rs | 2 ++
 rust/kernel/init.rs       | 1 +
 rust/kernel/sync/arc.rs   | 2 ++
 rust/kernel/types.rs      | 3 +++
 4 files changed, 8 insertions(+)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index 2f8c16473c2c..592fffc72e52 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -433,6 +433,7 @@ impl<T, A> InPlaceWrite<T> for Box<MaybeUninit<T>, A>
 {
     type Initialized = Box<T, A>;
 
+    #[inline(always)]
     fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
@@ -442,6 +443,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E
         Ok(unsafe { Box::assume_init(self) })
     }
 
+    #[inline(always)]
     fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 7a0d4559d7b5..36d4bf1959fb 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -151,6 +151,7 @@ fn try_pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> Result<Self::Pinne
     /// type.
     ///
     /// If `T: !Unpin` it will not be able to move afterwards.
+    #[inline(always)]
     fn pin_init<E>(init: impl PinInit<T, E>, flags: Flags) -> error::Result<Self::PinnedSelf>
     where
         Error: From<E>,
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 18d6c0d62ce0..973f15165606 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -712,6 +712,7 @@ fn try_init<E>(init: impl Init<T, E>, flags: Flags) -> Result<Self, E>
 impl<T> InPlaceWrite<T> for UniqueArc<MaybeUninit<T>> {
     type Initialized = UniqueArc<T>;
 
+    #[inline(always)]
     fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
@@ -721,6 +722,7 @@ fn write_init<E>(mut self, init: impl Init<T, E>) -> Result<Self::Initialized, E
         Ok(unsafe { self.assume_init() })
     }
 
+    #[inline(always)]
     fn write_pin_init<E>(mut self, init: impl PinInit<T, E>) -> Result<Pin<Self::Initialized>, E> {
         let slot = self.as_mut_ptr();
         // SAFETY: When init errors/panics, slot will get deallocated but not dropped,
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index ac316fd7b538..381a06ee0d59 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -367,6 +367,7 @@ pub const fn zeroed() -> Self {
     /// This function is safe, because the `T` inside of an `Opaque` is allowed to be
     /// uninitialized. Additionally, access to the inner `T` requires `unsafe`, so the caller needs
     /// to verify at that point that the inner value is valid.
+    #[inline(always)]
     pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl PinInit<Self> {
         // SAFETY: We contain a `MaybeUninit`, so it is OK for the `init_func` to not fully
         // initialize the `T`.
@@ -386,6 +387,7 @@ pub fn ffi_init(init_func: impl FnOnce(*mut T)) -> impl PinInit<Self> {
     /// This function is safe, because the `T` inside of an `Opaque` is allowed to be
     /// uninitialized. Additionally, access to the inner `T` requires `unsafe`, so the caller needs
     /// to verify at that point that the inner value is valid.
+    #[inline(always)]
     pub fn try_ffi_init<E>(
         init_func: impl FnOnce(*mut T) -> Result<(), E>,
     ) -> impl PinInit<Self, E> {
@@ -417,6 +419,7 @@ pub const fn cast_from(this: *const T) -> *const Self {
 
 impl<T> Wrapper<T> for Opaque<T> {
     /// Create an opaque pin-initializer from the given pin-initializer.
+    #[inline(always)]
     fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
         Self::try_ffi_init(|ptr: *mut T| {
             // SAFETY:

-- 
2.54.0


