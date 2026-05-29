Return-Path: <linux-kbuild+bounces-13408-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wx48AEK9GWrayggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13408-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 18:22:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9E6057EE
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 18:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07970337DC94
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 15:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A1C3FF884;
	Fri, 29 May 2026 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DDWuS3NL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A1F3FF1A2;
	Fri, 29 May 2026 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068508; cv=fail; b=S+SoYHLnVbIeFA32Vm7KR74dXNjpkDk8k+MvT9jLVt9pnPq0US6sawZv1m9kE/EYA3NXX+VLsEIet/q7745qgbdQQT5hK31eTD1omvA31pmYT/57vJaxwzE0d0PmaPxwE/V6Xvv72ZynfyRS4U1OieXpQI11ChgaunQBWx+3thc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068508; c=relaxed/simple;
	bh=9bTL7TE5BShLw5YFA0rwfrxVUg5tykv2UiLShcpcF+U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A1lQNR2aajW4r+8ATRvpDOZeBA74DWibfB8xpC+9+hjj+/3wrrZe/R7yglukLZMBujenFj1UT8XsOCNAeBlKGhnXITRzcBWZaKNyA/ZOh+kxamwcfsVSlNsaRK9xSglzRrEj4Pb2EtZRCikIvnn93wqca1tKw3llGy/3uzsl/NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DDWuS3NL; arc=fail smtp.client-ip=40.107.209.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsFIXw25zgjDkxYvnbC7CQnpH5K8dGNXAQSYlaywmbJWNwQSzdkOehG7PTzTj61JPPJJBnLNf3Jv0kneCWbM5U+CXHYgm4LmXtHsAJ7/JnOAkPmWBeQetE3P4uOI/bb+JnlZHYfu0j5SMdjGq/fWKGZ7LbPHIfoCSin33NRlC4ovWN1DfnEQU18nbPP4P8vL7RljgdiarZKGTn22PBQ20oMXRQb1DxLE1whRjnxrxZjh/qewSr6WAQC9awOCeqXy92IkDDX6iEbe7Pe334sScLMBmTDJg7HD+jmfLnl4PYDCt/FVd3Z/Q4Rf/aXDvJ7J362thuW2+Ilbc6Fl+N/pvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aY1zNp8/qtaVZSIz1acsvdNw6cmp12DF2znjTV866m0=;
 b=Y/WmlWC1vMMB4V/QlKDwfvxGuRr++jWsQzRDmlQg4HuDQPHoKS5bSeLw5Bb5CrlmZqeVTftMDCms9D0wzXmQmT4hTiitLdHiJHZZLTfKZC/xkBm2kAdSpiWjB+3qU5MJ16zr8j0O+55t+9lK0GgFe2byz9uUCpAwc5YugwvBdASEqSD8cVPSQZBnjTIaeHrvJ13mBSm+B94fbZid5sHzQiP/zdFZRgwITlt5aVvawN8u3HJmD5hTZjlZsU0huLDcls7bwav1TIEPgAXpdJV0TXsoRo5jP6Bq3lPywHrP0CPVERKK1avmLTeYmFLOuqjhreF3x/KNLn79D2NDUbT62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY1zNp8/qtaVZSIz1acsvdNw6cmp12DF2znjTV866m0=;
 b=DDWuS3NL2oU10rd6QwUnf5ZuNsXMObTFkJtHm9/a1WMgp6kkjveetPU5tV9uXhLIRIdW1xYM0BpMCK+ppjp5/61Ehav7LXZpDc6v0QK5CWqtwh5t+R4DnwjsS7TaYUNnGd+9+UFwdGYe8TjyeEbApFKbhXtO6jS322gw8jwxmQFDPMsgN/lGHcvaNfk9vboBTNJeOWH78uxwjYKEbu+E/18KR73rVoecaHnDdzQgnq7C55bit6JkJ3vYWZ3KeaaIBZJOjG2ZYgQODaP8NIXhOh5vXobpNo3l4ThJeKEOd1UG9chpGOyrkCbBrOcC8rVRBpPkESGiwOduJ3Ywh0sf0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 15:28:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:28:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 30 May 2026 00:27:44 +0900
Subject: [PATCH v3 4/5] gpu: drm: nova: build after nova-core metadata
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-nova-exports-v3-4-1202aa339ef7@nvidia.com>
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
In-Reply-To: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0099.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d3a8db-9a28-4f1c-728c-08debd96e9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|22082099003|18002099003|921020|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	XG2zWWkjNyecS5G1HsWHEV0F9TJ2r/oYwZZgKgKEN7Ih9WprtDUPdnvmKNvyZs6B2/FzT8kiWNBi1CSL+WwCRRq9IeQrQaQtxwhsxcXoDlrqonNwZ/0LecapI9MGqAgJwePmAFgCS2ST/TAMfqpq5ZZzTgy7oVxxWrObRkW3Jl+twFSR5wCZuWs0+HjSGI35g0mIfc8c2cDk2ohKNAnMA4qahlGAlqOC4/bMv45B7NXKnUR5GZqH1yrpRnCZng2OH4D6BlAoXhkkiPScTbrRFpVnhKyCYSxdx0u+R2tPW3I0bBP33jl8brNwVOOSEtJCHkarbINylO5klR+Qa8Yk3VoWVl6jdSrdbfk/VTJo139Z76dShpvyjyyVjuDCYpgH5/SNzs3ULVsHO0FrJ9rrqhcnBoc/POn0uwfAIQxYjK++G/bSUD6V7DdBZPoIb5fE0EuHwekX4Lt8wvIQti9ttZk6ItCeUE0i+tpzuQvUVvF74rwFLCnsqHABn5efOeCadNSzETdNhEsx6BciEpQoMAeMx8IUMuRu8eqdHzuCcm299UU9OgvHyI+sjEYyWAxcz+q97wTJK58WmPRxiwjaRX7nBoo8M5nkgtQy1XDPfJPbv1CgWqfLCX+g39Tv0essWnQ2WCQ7eOE7YT23yrGz2VMgxNo/31Ftunm+dYeA/5mwU4aiATJRkjbTqPpcGb28EiFvgYeuaKEEWFkPDRBRmhvYm9c17BeKncPxqGBsFMs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(22082099003)(18002099003)(921020)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amZkZ3BXTTdKTjE5b3d6R2xBOVRYRUhVaWFndlBkT3dTYkRGZGlUdlIvTGt2?=
 =?utf-8?B?WEY3aUhGS29WNUFRR3p2ODY3b2tlMGNjcFlNVjRYSFFFR1FwdHYrMXB4VWU0?=
 =?utf-8?B?cytYS2tIOG55Y3FoejgrenhiUENwZEFtOW9zdFNNTEVZYzVEVm1OQTNILzhQ?=
 =?utf-8?B?TzRTU256cktmRDhqQkR3cUd4WjNxcHl0YUlVZHU2cWNPWWlVQ2NKZGk1SVFl?=
 =?utf-8?B?c0lwbnQ0Z0pweVpmNjVVOTN6czNBNENwNGxCbDJkWTdSU2huUTJGY3p0dzBi?=
 =?utf-8?B?cXVhNVFiQUxHdklBeXIrNWRYaDVGN0diTlN5S1dRRFVvM2ZxQjRoRm56YkFk?=
 =?utf-8?B?YWxZV2YvS1loUWRHM0RKbWtRdWNJYmhwaTl1cEJTN1BBblpwSitaUmpudGl4?=
 =?utf-8?B?T3R4cG1KTkJJaElhM2s0SHR2RWxQb1hpYzZ5c2I4STlhNTUxaTQzTjYyZWta?=
 =?utf-8?B?SWdscVBJSTd0b3ZnczUvbmNhTUFXcjhnUGREYldGT2s1WHRkTVk5RmZzU215?=
 =?utf-8?B?SVlIcExicHBkUGR3SEluMVpsYVRhM01OWk5WZGdGRVlQanFlTWZSS09VY1RD?=
 =?utf-8?B?MkNoUlNPTXYyeFlTKzUzbkd4RFB0dUs1Skg3Y1QxcjFSRTBCU1NZZU1RaWdy?=
 =?utf-8?B?OVVrbzMveTd0L0hpT1RTVVZsQTU3a0cybXNBeEk2cWRsdHRPNmZoRDdPdkt1?=
 =?utf-8?B?bVNaTTJYNVo0UVdoT1lMRDNYMVVISE1IMFlCb1ZmMlkrVEdEZGllN3VrYVlQ?=
 =?utf-8?B?Y05mUCtZcHczL0syZmlTaUZlSERva2pPLzFEeDU1Yms1U0xuemgzK2pEYk14?=
 =?utf-8?B?K0YxanlOYlVWUTNWYmNiSForSkFXbGtsYnlKQXVrVzl5ZGFONHpjRnFWRTJC?=
 =?utf-8?B?OXppOWM5d2EzTXdTV2p3VFpYRi9zekwzSlVWR01OWTRhSittaXIzQkVhS1Vi?=
 =?utf-8?B?MmhYcG1NVlYyK3h0VDdlL1MwSUovZnlnVXJveWErVkhURFNIZEkzRDdLeFF6?=
 =?utf-8?B?eTArUi9KNHNBVXp5WnNsbVE2UitQdlQzd1pqUmlCRGtCNXk1dFJ2L0h4RWdE?=
 =?utf-8?B?d3FFSHNlRWVVUzNpMFN3KzRVakNHa28vTWxuUlV2MXVpRHZPMFNpbDYrNmYw?=
 =?utf-8?B?akk5OU9vSFFGU21ZM1ZReWg3ZVZOK05waXNqOG1FaDRsNWxwTnFKZ1R5ZTdW?=
 =?utf-8?B?bEV5dHptNFdYZlpmcHZDV0o4cE50MXpNZUpiYk9hWDNHOFE3MnpDT2xNYVZ5?=
 =?utf-8?B?VEpiaW9va3cwTnVyWDROdFNUcDM0cDFwVmlpRXJVTVFZNmpTM1lRc201MVVD?=
 =?utf-8?B?b1Ewc29OOExwOHZKMzQ0Q3VoWEF5L0hUTTVtdHA0Z3lsQmRyTHVsaGZjdWNU?=
 =?utf-8?B?MnppeEhLU0pBRVJSb2xKYXA3ditqZno1ckM4a0pjNkM5dVN6SytBalljTnhH?=
 =?utf-8?B?RC9TTmlWVG4wVmRyTkF5STFnMUlmNnkvSXR3QkJNSjFzbTBkUEtFY2pFWUlO?=
 =?utf-8?B?REZDVTZLenZUODVpdEt6UG1LVUNDK2s2VzE1T0pQZjdmWVRjQ2Y3L09LRElq?=
 =?utf-8?B?ZVcrOUl1VVB2bVNsYWVURm5mWXhWeWJNeVgwVU5SZi9lSVJ6aGh6QUxMa1Bk?=
 =?utf-8?B?em44ajlqa1lkM3ErTjFNUmNKS0FpZFJQcWVLMklHL2xlOFN3U1hyNjFvcE14?=
 =?utf-8?B?aUN5WldJTi9qa09oSDFQZmtjZHRJYWllcEJaME9xNWF4WFUzcm9OZGo5N2kz?=
 =?utf-8?B?RXl6OWNZcnozRzZaL2gxZFpnaXBKWm51em1raVhGVnpuNWVBdXh6UTkvVmFh?=
 =?utf-8?B?YW9FZk1MckVLLzZjK2xONXplRCs5SU5PM3R2YjJPRlNBa2ZkRDJhVkwyR2Mz?=
 =?utf-8?B?cytLRkZGcVEzRW1aMERaQVFpMVhYTlZBa1VjOEs2NXQ3MHdiTjB2Um8xczFK?=
 =?utf-8?B?bmVxcjJIckdqV2k4bjNvcThKdUFIM0hja24wRTNmekprV0lFUnE2RFgzVFIy?=
 =?utf-8?B?TDZmY3h1NVZrVXVuVytMTnBIc2dJQkJMM0Z6Y0dZWnZEMW5VbFJYdTFCY1Qv?=
 =?utf-8?B?MzE5d0p6MTN6MHZJbHZSZWNLb2FGVUtKUFU3WlpCRzhobG1zVWlhRS9xcGdo?=
 =?utf-8?B?MWZ1MW11NXJZY3I2UWlPaDFZc2k5c2o3SUtSdm5vS0VrMXJ2RkJCbkVxZDRo?=
 =?utf-8?B?QnY3bkp5aDJhU0tCZXBSbWc3Zzk3cGIxVzNoamtHWDBWMU9TeWUyVTE5bENW?=
 =?utf-8?B?M2RyODB1eXQzc0hlRjhDdTRtZDRweDNYTVlzd3B2Sm1aanVUUDVrRkdvMkUv?=
 =?utf-8?B?TUpWRE9uUjVEYVd1b08yZk9xZ21Wb3I3TlZnUXB0aytya3pYUTl0MXgwbXJT?=
 =?utf-8?Q?5HzUjK5h97LCkg1IyLtTHrxZYNay4Kf8JutxcWwa6fTeP?=
X-MS-Exchange-AntiSpam-MessageData-1: jOfs8UGzllUh8g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d3a8db-9a28-4f1c-728c-08debd96e9fc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:28:20.3304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBRv6k+7SEZ5kYucqtM+sh+N6lFEJ9XnCpUkmLiaYEodQoGWbzprfdJtJxd8oSjqEdlePl1NQiTqFm3K5Hzqow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TAGGED_FROM(0.00)[bounces-13408-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 43A9E6057EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Point rustc to `nova-core`'s `.rmeta` file so `nova-drm` can use
`nova_core`'s types and functions at compile time.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nova/Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/nova/Makefile b/drivers/gpu/drm/nova/Makefile
index f8527b2b7b4a..6ed4ccbfbcdc 100644
--- a/drivers/gpu/drm/nova/Makefile
+++ b/drivers/gpu/drm/nova/Makefile
@@ -2,3 +2,18 @@
 
 obj-$(CONFIG_DRM_NOVA) += nova-drm.o
 nova-drm-y := nova.o
+
+nova_core_rmeta := drivers/gpu/nova-core/libnova_core.rmeta
+
+rustflags-y += --extern nova_core=$(objtree)/$(nova_core_rmeta)
+
+# `nova-drm` imports `nova-core` at compile time, so request `nova-core`'s
+# explicit metadata target before compiling nova.o.
+$(obj)/nova.o: | $(objtree)/$(nova_core_rmeta)
+
+# Build `nova-core`'s metadata by invoking make.
+#
+# This is ugly but only temporary until the build system natively supports
+# cross-crate dependencies.
+$(objtree)/$(nova_core_rmeta): FORCE
+	$(Q)$(MAKE) $(build)=drivers/gpu/nova-core $(nova_core_rmeta)

-- 
2.54.0


