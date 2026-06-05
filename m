Return-Path: <linux-kbuild+bounces-13581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id naoOBL+MImotaAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13581-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:45:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91D64685F
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 10:45:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=Nvidia.com header.s=selector2 header.b=MridzUhz;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13581-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13581-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=nvidia.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7485C3084778
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 08:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F413D9041;
	Fri,  5 Jun 2026 08:32:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2972A3D890F;
	Fri,  5 Jun 2026 08:32:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780648348; cv=fail; b=sXfddwVo9v2DebKd5836uU74XzIMErvEMAGRUhTHZB5Ro7x5BNH0yXDx2vueoFb1/Xu70V6heDmSUdRlJwttly/HKueSRdX6V5vbmIuTkoD8qTGsJxqn1Ejcv4yejqG/8KCGcu0xlglITJ4H2JHNm0lkVoRqdLpwTgLlIWeEaic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780648348; c=relaxed/simple;
	bh=V94CDXtTl05ayQywWeTVC6DT5AzlT1XWknkJ4kMXAz4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jZ5Ci1ph/3qvxCAZtMJFxECE/5kuY9bYhtXAveHdpI7kcgOJTu8LhWYY6fwAxhR7EAQfM8vJ3zCOHos/bBCKSBKHLnF48fUQVN8weoGxnZUf5Tdg7xb1r7bMa42uwn26E+QD49Sas7RFH6dVBNy6Cm2wLeA8YxbeU03d1QoGIdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MridzUhz; arc=fail smtp.client-ip=40.107.200.49
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5i6bXomDppfGzQMDJl/mfN3+5boztpKa042oyPbrp3T9zDRtTPmxG3cBfQec/b4wBeOJ3j4AlGnm7UXVZKlVgn0Vb/OF2EGkf72fAFHT3cIJME1jsnCJgvqsNC/st7YarYB5Jz6ErwN3Z+x4yeNj/FX/2WbOkM5eRA3bFT/IL2Wq4VQPISGlQJ3EmAl6UA+KP9vRKuiKaxH6DCs6SoVOL/31WwdNQMvLngwHVt+Aw3dh6jzefsYakpEcx9BHdUB0tx82vNVoDGfyk1jgdJRZ0XBk98+cYaPJkrzPcusQT5I2Pilib4h59UJPNurWnM3t6VMl1mfL+jfeHd9Rmq8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgtsKxJti6A0bssqY6P1oPjVsfvI4ulpdzbKVoiHLQU=;
 b=Y56N3m3L4XO+PcBKbleEPmgG5Cvc6Lr4UZbIU8QrUMCG6zwGh6KzTc3+xJu5naYVdeFdG1M+YU77m7SJAdm6oapGY18ZdTZ3oL5MEblPtsy9ZDbV/ij7KKYF6ORAtOYsv/xehif1qbLFJfdwi6Cgw7r8L7+LBmHsMtxkaFRtawegR6GDRRDRfjJb/bb+b7EZVF6Q6czJesmg0oHE783XuJUyijpA79+vtWV7JrcKIbffRZSg+yBLoDAl4h5r395dFGEmCJDPjFf8sRPrstT03ddwJ2w8w5JlTXyl74ThFxPiX+KENWXVpeWzsIUEPHYArae8+t+/BEcyhV70hlcpFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgtsKxJti6A0bssqY6P1oPjVsfvI4ulpdzbKVoiHLQU=;
 b=MridzUhz+tlnHvkcGJ/5zZZw7Lm8xVUkEfPiLvBJAWQewsgDYjDHphbHSwb1ct2NzVVNMfogHZQzuj0THTyrTjOT8hIybLGQblfXB5+cTgwUE7UEeudqOZtDjPfnGkvR0k2WG3NbeQFqq1KUnfFFQAEOvYigxoDKCZNufEtkwXNtR+va4xD5rVY2tQKv/07ToqQ1kXmmBtI/mC+Mda1ADHCTNTPidzQaGkZ4KQQU5vTeYf3+zSNfnBr5FE1CLTcuHkt+TtGLtyAzZai3NG6H3NzWCvcFqDpQWspGZ/ywl/LycezVrhUKnBOiRLqYR5CYGxtFY2tD4Ttdcv2mlTvDkw==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8911.namprd12.prod.outlook.com (2603:10b6:610:169::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 08:32:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 08:32:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 05 Jun 2026 17:31:53 +0900
Subject: [PATCH v4 3/6] gpu: nova-core: export Rust symbols for nova-drm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-nova-exports-v4-3-e948c287407c@nvidia.com>
References: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
In-Reply-To: <20260605-nova-exports-v4-0-e948c287407c@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6PR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8911:EE_
X-MS-Office365-Filtering-Correlation-Id: f433eb83-6d38-42c5-2fdf-08dec2dcf4fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|1800799024|376014|921020|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	C/T/p+DO5OeiLigp0LXnQPvKsWU3uHNXgoVjUKrCoAsJaorQdWfu6wl/gJuO9SXRiSeDD0iKaryCoQJppd6vtNu4e/VvKt2PMKkfywZV8GFTx/dTupHl6zyBryfbbPX1Sqv8bSkpXopbb/7Xt00SuGAz6kt96eXPxPOuiEMWCiWXtdm3g7RcNjXgt5y9amuMwtugYNGXcGEZmjmFmU/2W3y+Vcq2apDuDpce0W42doNOvn7RRhwSqD2jV02NdjtkpPDf9IhRX7V2tPQ9E3ysno6C6yS+0YpFuYLFMI2rEI2SxvNeGGGej9qUqJS5h+4y2c5nI+8VSLGbmmMQaRWBT/WMeBR7qcVWcoXVXalvQ9FOZV8j9c9CJqPQaKDYP9ozbsAtNS5thuKSRZL9haznMvLvwsDo8mTX7eIeYhkVJ/LRdztBlzi3d2hS7HZ2IijY4RT8f31l4AF9wPvD/RimLz5OrhstJYOzM6kjdH4RK3hT3YDPY+iyblxyILUD/gF3eX1QjUF07nXReM+9x5ZpyVzSqK5Hw9t66jjoyXspPrqyr0WopNDvC2+aGewXBRRbc24p212c5nwxLY3RG5nQdQWS5DlmWI92dERpRqiKXTM/uIrvvbOPoWs7og+CPIBTyGFWv5PhDpz9dihBo3Z7hwiPkVS7yektIJnTlS7a7hJHgU9AyN3U6BJjEfe05h04o8kMfLGaTlV0lyLWeMPd5sTqA5tgF6jVZ5FTd/U4Oug=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(1800799024)(376014)(921020)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXJSYk5vM1h5UG4xNXg5VTFxNUQwVkt3Q2xJcEtjWXAwQTFHeUlIbXlrSFRW?=
 =?utf-8?B?aXZHRWVaU29uZzZiVUFNcWkyeEo3ZXZOMXFDditGZXpPQWFXNDNTNmZrb0Iw?=
 =?utf-8?B?aFJmbXNubU0rTytrVk9ZUUFWK3U1V2dERDU1Tk1iWGdZUVduOUUrbDlSSzZH?=
 =?utf-8?B?cysrN0EvaStKVEtoNmhyUER0bFpLV3lJb08zZ1RlY29LVWpzL3F6L0tPa1FF?=
 =?utf-8?B?REVjOUwxOGRQN05sbG4ySjBJMUVaeFJlOEVPQmdnamFXdzYrOHZrUThySEg5?=
 =?utf-8?B?Qnhaakgxdi80WWVuTWpuaW9OMWFrdXl2czJNZmlZdmxUQkJoSXEwelJGNWN6?=
 =?utf-8?B?bTMzMzdsQk9sZThqbGwzS0FkQ2dNNk94bUVpVzR6WGRsVFZHK2krU0d2MGM0?=
 =?utf-8?B?UHR2MmhkSnB0b21BWjh3dloxWmxDTE5wdGsvOUlGTzVwc2ZzeUdiRU5EOTBo?=
 =?utf-8?B?ajh2ZHlOQUVLVXVLSFQwSFJEa0RqeFNVR1ltZFBhNnVNVnVzZmdlZ2M1OHVm?=
 =?utf-8?B?ZzAwb2JrOTM4WE8yeGdTekdvSHh3b3BxOWp1M0N6SDh0ZDVFeEFBbTlkWW5v?=
 =?utf-8?B?eGE3UzMzODRhS1pGS0t6d2UzZi9iV1pSbmJLVENVT1krUEZheHp2OU9TWEtL?=
 =?utf-8?B?LzE0bEU0WHBjUy9yUklSUHpsVUU1T24rVjRJRkpkR2JvRlpaaXZGV1pMYjZK?=
 =?utf-8?B?WDVCNnFjbDQyUnRQbVNCSjcrMXhPTXNZN0hHRXJST3graENueXpWQUp3UmN4?=
 =?utf-8?B?eVB1aENUVXZKdnVGV25ZMU9aemVHYzdPWFhpSG1GcFBUczlxM25DUDAybVI0?=
 =?utf-8?B?SUpEbkxwVEM2MVNDNE1xdWZYei9ETGMrUVdCMWpqTDB2RmN3RVJYbXVBVzZi?=
 =?utf-8?B?UzJBQVhOWlhlNkJVV2pjV3h0RmJSRHplcmVoY050bzNWbGdYK0EvdDl1czVx?=
 =?utf-8?B?NERQV2xpWmhzSlNQSmNsTFdtVTlhWWFpZVZlK1RneHNjWkZaK2ZvNXdMd0xM?=
 =?utf-8?B?cFMwZ0M2QzB1WVkrWjJnWlZwRHlUbi9qdTZGbFVYM3puNWZGVTZYYmVSbk5Y?=
 =?utf-8?B?NmZ1ZmRZT1Fpcno3ZU1KNGFyMHhiLzByZEdDNnlDQmpKZHdacC9yN2t2RUUr?=
 =?utf-8?B?TmtUVU5oRXUwdGpOckZlUlRTdFVkQWpHT0Z4eU42N1puS2p3RXI3c0N5M043?=
 =?utf-8?B?eUJoaFpzWUVNMHBWMEJHMDhiNEE1Tmk5bHRnenRVdXloRExWY0VRSjMvcHYv?=
 =?utf-8?B?eWsrZzMwSlNYU0tCcENQdk5LdW5ORE9HeXI1L3FXbG8xdTZPKzJ2TDhRMmtP?=
 =?utf-8?B?TmxBSHo1TzZYVTZkWEgxUVFsT2t4VGUzMGhOV0prcGxpL2JaYUxBOURTVDdF?=
 =?utf-8?B?U0JUNER1L1pieXhvZTZWY1JVVGp0aFhuS0FBdjZqWWRReVcxam03Zk5TY1pp?=
 =?utf-8?B?S091TEZhUjVWbHFUR0xyY1V0RFhpdERBRkhQRlg3OU03dGRueUtmVzRxaHRs?=
 =?utf-8?B?KzNTV1FmK2w4Zk4vdmpiNXNyWjN4Si9PakVINkxpY0pwMitueDVxN1dNNkEr?=
 =?utf-8?B?Sm9Bc0dtSlk2aFhGNWFDUFJ3VmhVVG10Ly9EeXFabEoxaDI4R1hhU1dpRmJZ?=
 =?utf-8?B?LzZuSlUrVjkyWVBRdlpzdEU4U2RYYzIvV0lWWUdrclRGSmdOUDNQNitSNDZK?=
 =?utf-8?B?M01TWkxiVUN0SDN6S2ovWFphd2lMVUFjM2oyNGYzSlNTUURIUSt2eTM2Mjlm?=
 =?utf-8?B?d1JkQ056c2FLYTNSOWVSOU9JcGdlNUNBSkowdkxvUTUyS2I0cmZSWGVoQkdP?=
 =?utf-8?B?WHB0ZStGM3J3QXhMQ2o4YTFhVjgzSkNZWWgvbjRCZmM4RjRZclo5SDRyRnBR?=
 =?utf-8?B?WUo0bUZjQkZsejYrRTRBKzFSM3pEdzh2bHNJRWRXVVJFWjh0QzF4T3Bvbnhj?=
 =?utf-8?B?KzRBd25lRHpwY3BZcFZVaXQ0VUpLaUVsa2hwejJ5a1lzaUhTazUzTkg3aW8z?=
 =?utf-8?B?U0wxMFMvS2xJdFZIaUxtdGdOd2NBTmdTKys5VE1BVkh0WEs5S2srd2VNend4?=
 =?utf-8?B?Y21sdWErNlBCalpPQXVXb3VpcFZYSW1QMVQ0aDh1bjB6bVEzL3hCSkJjQm1J?=
 =?utf-8?B?cSswL0ZUeGRtb29VSUZzRUhNZ0FoRERUNVRFdGdGbG1OMjJIVVpMVGZnTU9t?=
 =?utf-8?B?em1udTQxckpKR1ZLd2dqTVhmeUVkUWIrWmhEMGJUMzlzMFlUcER2N3BUV0k3?=
 =?utf-8?B?SEhOalBxOG95SUYyRThiN0lEUGtiUVBTUjUyYXFwVjZPK0ZYSjEwOU5NcXdP?=
 =?utf-8?B?RWhHL2lUV0JTSW1UcXIzbStKczJkbmcvL2xRVG9kUk1WWFZsK1R4QzNLdXh1?=
 =?utf-8?Q?+ttjZQSO0bWpBfAEtXiFV+0Zug+b5J4+03+pud5oV31l9?=
X-MS-Exchange-AntiSpam-MessageData-1: 0ujBhN/XqUPdcA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f433eb83-6d38-42c5-2fdf-08dec2dcf4fb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 08:32:19.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1TOiQXWINVKUmwcmiJ7q4D/x95c98ZoEgssawsHcLSAJGoms3ZgMXRMirDxuY0n+O/2Gqz0X5ojKKmdAayMkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8911
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13581-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:zhiw@nvidia.com,m:ecourtney@nvidia.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:nova-gpu@lists.linux.dev,m:dri-devel@lists.freedesktop.org,m:acourbot@nvidia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:from_mime,nvidia.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D91D64685F

Export nova-core's Rust symbols so nova-drm can resolve references to it
when loaded as a module.

This is done by generating declarations and EXPORT_SYMBOL_RUST_GPL()
calls for Rust global symbols using nm and compiling them into the
module as nova_core_exports.o.

This is intended to be a workaround until the build system supports Rust
cross-crate dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/Makefile                      | 18 +++++++++++++++++-
 drivers/gpu/nova-core/.gitignore          |  1 +
 drivers/gpu/nova-core/nova_core_exports.c | 15 +++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 45e0941324fb..2f9c6101e21c 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -14,7 +14,23 @@ obj-$(CONFIG_TRACE_GPU_MEM)		+= trace/
 # system supports cross-crate dependencies natively.
 
 obj-$(CONFIG_NOVA_CORE) += nova-core.o
-nova-core-y := nova-core/nova_core.o
+nova-core-y := nova-core/nova_core.o nova-core/nova_core_exports.o
 
 obj-$(CONFIG_DRM_NOVA) += nova-drm.o
 nova-drm-y := drm/nova/nova.o
+
+# Slightly adapted from rust/Makefile's rust_exports, restricted to Rust v0
+# mangled symbols.
+rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3~/^_R/ && $$3!~/_(init|cleanup)_module$$/ && $$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
+
+quiet_cmd_exports = EXPORTS $@
+      cmd_exports = \
+	$(call rust_exports,$<,"EXPORT_SYMBOL_RUST_GPL(%s);\n") > $@
+
+$(obj)/nova-core/exports_nova_core_generated.h: $(obj)/nova-core/nova_core.o FORCE
+	$(call if_changed,exports)
+
+targets += nova-core/exports_nova_core_generated.h
+
+$(obj)/nova-core/nova_core_exports.o: $(obj)/nova-core/exports_nova_core_generated.h
+CFLAGS_nova-core/nova_core_exports.o := -I $(objtree)/$(obj)/nova-core
diff --git a/drivers/gpu/nova-core/.gitignore b/drivers/gpu/nova-core/.gitignore
new file mode 100644
index 000000000000..7cc8318c76b1
--- /dev/null
+++ b/drivers/gpu/nova-core/.gitignore
@@ -0,0 +1 @@
+exports_nova_core_generated.h
diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
new file mode 100644
index 000000000000..6e80ca9792ee
--- /dev/null
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+/*
+ * Exports Rust symbols from the `nova_core` crate for use by dependent modules.
+ *
+ * This is a workaround until the build system supports Rust cross-module
+ * dependencies natively.
+ */
+
+#include <linux/export.h>
+
+#define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
+
+#include "exports_nova_core_generated.h"

-- 
2.54.0


