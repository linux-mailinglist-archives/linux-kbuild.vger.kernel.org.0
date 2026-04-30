Return-Path: <linux-kbuild+bounces-12958-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHGFCGFu82m42gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12958-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:59:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C30D4A459F
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 16:59:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3145309F143
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 14:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A649436343;
	Thu, 30 Apr 2026 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LAic69Mx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9E436358;
	Thu, 30 Apr 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560951; cv=fail; b=s82lGqF1DVO/BPhldgeAEl1LrdDd6S2HxhpQ8/KegYrKOQcHhoh7BPoudBlUDce7hnfUoKVETXuKh2ADUeJfkF0uqjmmYtwuPUfDD4X1QAF9/IWOC3CUL9hvsV6gWxXCPC3N32yPT/aruNPFW/5D6FVJlWUeia8M8AD7B0JWScQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560951; c=relaxed/simple;
	bh=V7DRWXVEct+jBs8BRXWsa5MTH5QOBV9zqctKmZXmyGg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GTdHrYyq2+yWAWuMCkwUfN6fjcvzcP60Kqjd/de5zF7TK8+phFmKcsPZk0wjzWhfY6PwdlXsWHPoKVnAT/zj2JPTnKvhenh29QWf1gh3uJrHAsQsK+QCmLfjc/n8NyYU+pHq7ufq2mWddXCLwBewKzRbx6bwIYk7l2dqCB8sMXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LAic69Mx; arc=fail smtp.client-ip=52.101.43.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfQXiCK5HrO9+jWN6cyVg8jR75BtmPJowwTJtynRnsh0R5S5COYz5vYla9nilwQAOKKhsPkWQjmYTX6sbCOAIBgltiwzOLJl1yFdOv0hTKh+ETTeCYu9JOokH5/6T1durE+/aXc9ZaOdw6bNO2lwGBu5/4EaHl9aM3cvkI0ZI5OKVl30Zi0VT4FBiQ0W8aoe8VpP6Xgh2+t8jxrypombSZIOsVkvcgQ4OfWVOKzuUW4wxOugjOOwO/El6vOoLfxSFNAd25SnpW6GdDPhI7tTtaZWBJZlLtSxqm/YCMVRjN4pVgnNm6yNCf5JophOFp7wNWOmC0sogiBb5gH1xIB3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjYMWbwbn51AuJ+KPJgRqfZnLCb9diMnl9gg+k5lHx0=;
 b=RHN7XBJtlNZ900rFtjs5mjLwohWENTSM7xzSz2mvSwzhT+rxMKbNDT+hYVX5oDiDIKgtg0auznInYQyaYJ5PXVQVLYGHoIJu6RkJrIp2Dqykfo8nNYp4DwU86P6L8gl30tZEPkbfbo0T/ffTXr2y0MCvKhBP+4przbeTcmAUvSUijSMF5Hl5IFK4bL5xQ7DR8t0ZMmCoDJxnH8LDdOeKX6sBx1D5Fi0Dty+X1F9bSiNBmJPKFJQo2nrVBXufOfIQrOJ1IEx/90z9+eZDVJWqGKEKNCxGDYp3ZRr+wR5iFpUiShTdeRahtRdc4NXKU6NYZL04cFGJs1fnI40/0IFS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjYMWbwbn51AuJ+KPJgRqfZnLCb9diMnl9gg+k5lHx0=;
 b=LAic69MxAU6TyVfblg+EJXXtGN1pTmAnXKWEARyAlwMl0vBlGK2TJvd8hN38SHd1RlH8XAP+vg3/8ZFuW+QeDaYvVnX867c5fw3poLPw5SnYVSVQmlSPhvq17iE+nkPOqkBbr9pFoUVQcc2LC8K280ffR8vcrmoHeI18KWsvleRCIB8Uyy6y4d17QeVfMD/bunMmHCFiNWJ9CTBJLSHm0NXRKpbnQyI+huApCp3ogIn4QnWLZPj+xv6YFzoa8WU/BRLlIWFD8aPRJqwkXPfZXJ93j9MU4owTmTkCn2p4yFsmiaL605wsr7x5Jhvnq6tSNTOU7jPg23UPrjxuNxBW0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 14:55:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 14:55:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 30 Apr 2026 23:55:07 +0900
Subject: [PATCH 4/7] gpu: nova-core: export Rust symbols for dependent
 modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nova-exports-v1-4-7ca31664e983@nvidia.com>
References: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
In-Reply-To: <20260430-nova-exports-v1-0-7ca31664e983@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYWPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 0104474f-bc47-4a3b-c9a6-08dea6c88be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	eBcltTFLov0YJzcJ22oZj7Rq5Dew7eOrJO+nRAhE8UoWh+Gk/GliU+qsm4HJYAmb7PSj/WrRNKB+r+30hMm23+DCrLzExjYYR1CIRNk//zqtr8hxeFwG6r61w/LB000sS/ymJxDr/xXSHBxsvhXFdVvnPgTU+W+YLvchbXAs9O7+lJ+yClo+YW1+HKzwgJT+897GFDdoIvKYWmzeb9NjqIZe4y1cs+MkoghGG+MyjXlP9dBKrs/2VQJQBL24rWfn1LoyFIJft62n0U1xyu18I7weo8zlIMwwip8JiGebuV2Ur5ys6RZojtgy7qUKS0A0l8LlTis9TPEp8gBELmW8LPnA4NecxSXcMVDeAKgOojmgTnTaY9g4FaLIX1i80B0yQ89OJ3XKOMOe52lAQuQs5PoVGh9Q3bSVlqUu8LYQ+fvvdRDx7gGQ8cwL6ytVnUoM6KRRVS3VHu1hs+FhHSe3zcHKXwzdMrMGuIzcumNXHLrE+vhN7Wp2LnoFeEU04ssBgltdkLJB/gvFmP59GgA0knHW9eh5GN068yKekRDBKG76M+lOLzkXB1i+LnDI9H9DNZz8MkXf5VyYV1pcDcB8GrTaHv80hUtKMKdFFu6p5TzeGk+j+9PJBNibra9ecJRx+FFbsD5V1P22xuwRZ9w2NDcZxrxb51bWijwT/nC9iMrK6iBor4kyeRnGp7h/3NDDh4njEt9YbFTaiHpre3z4S5NSPUcxME66b0c5mqIvmcw8e4whwP297gO9ZL8hYkclQ+1V9wZGyrdCYsRrhbVHLA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVpqWWpnWWY3M0o5dU5hSWRjZTcrVlMyYjVqSUZGWUw1Wk5IS3NIVWJEMUta?=
 =?utf-8?B?cFFGcVR4a2YwMFpYOWpJaFlUb3FaU3Vqa1FZbFptODV0S1BoeEJMUWlpRUtr?=
 =?utf-8?B?RWRRYkxDZXN6Q3pYcnExSk9ick1qU1I4bXRFcXVMaDMwb1pvbnRmaUlZUnlU?=
 =?utf-8?B?eHNORk52d3ZrekRXdXVQMGdySi9uaFFJenNNMno1bFB6aG9LRlhleGZrcnB6?=
 =?utf-8?B?ZnpPeDRTdW5VRk8yS1VtZ3VGWlFxcWY3RXNWOEtINXp2Rkl1U1R3emJZVzRE?=
 =?utf-8?B?eW9OaWpBZ09zNitScFlkZXlMRnJxUmN4MFFCNjV3RUxZY2M1c3RtcnBuUHFH?=
 =?utf-8?B?MUF4RkZnZmhlYWdUUTI0d3FhdlVaOUpvL1JkT21QUkdLbzNRVWdMQjg1c0JZ?=
 =?utf-8?B?OVhra0tudUdydHdMQUVhazFNSVNtL1JXTTkzT0ZjNXN2aVUrcHhaa3JzZi82?=
 =?utf-8?B?dTRCWDhkb3lHd3poTTZDNStxUWRjUm5QRlZaVUtkTDRTc1psakNHWnp6Z3VP?=
 =?utf-8?B?SThCdmUyazY5Uk1CcitmSHZwZWl6MG12L2pld2hlYW1oQzlKaEhOSnZPdms3?=
 =?utf-8?B?QjVERzdLdW8yelUwRmg5MXpoMGNta3k0TVpVWVluNU55ZjBwbE16SEtNbmpL?=
 =?utf-8?B?SXpWVXJUcDJFcWR4NUFKTTFLNjE0Z2dDZDViMjRXTDhEWHdLWjlsREJjcUdR?=
 =?utf-8?B?WHVVeWQwc2I1Y1ptUTN0Q0dnYjRFNmRpSW9uSnJnREVoWTRyRy9qRkcwL1Rh?=
 =?utf-8?B?Mi9pREhvNUxLN2JQRzdQOFB4Q3A3bjJwajRpQldudFZNaExzeHExdU01RjB3?=
 =?utf-8?B?WlhxQjVSc2hzakV6YUZaeU1SK3ZOclVGZjhCOFFkSGxGTlFsYzRWRFNXMDNz?=
 =?utf-8?B?bnZRekZCY0g4Z28zSHU3cmE1dnNwZEhDelBhakJJSGxjaTNhbWU1aHpzeFBy?=
 =?utf-8?B?MUVheGs4WEN1clJ3U2NmbmtVd2NFSGp0OEFEdWlDR0ltU2k0enlxajZvb044?=
 =?utf-8?B?TmtpV21kQzNnbEJOTWEzL0ZrTEtaMmhqejM0WG1KWUJreDIwR0pXZ1lseHQ0?=
 =?utf-8?B?ajYrZm1HZFVjWVNuMlFPL2doMkNYM1U4SjFtRk56NkdyZitnNDFWUEJ4b1BF?=
 =?utf-8?B?Y0Q3NDJ1Y3ZwZjZuKzVrZW9sMkJKM20vMTFiSWtaNE9ITWdtVlkzRG5ZRWQ4?=
 =?utf-8?B?VXlMbVo0S3UyV3h4MDM3U3MwSDEvbUc4SjB6R0tRRzgwVmo1K01QeU51M3Yw?=
 =?utf-8?B?MnBOWWJGRER6Z2RmdnRnV1lIUm4zN21nT3RjOGdWclN3bUZ1bEUwQ1pSck9W?=
 =?utf-8?B?ZHJsY3Z0aUFnMHFHQkR5VXJkODhxa2hERTRiYWsxZXNWMktIMjlmYURuekl4?=
 =?utf-8?B?aURKZW9uTnZRUXNzNVBwUTN4Q1R3UkdkUk1vYURQQzl6Vk1OWVJoZGpSRXkr?=
 =?utf-8?B?OUR6RW9rMnE0N2ZDNkV0OEJERGU3OWlOZ2IwRExZYm1MV0poc01sMUIwSlYy?=
 =?utf-8?B?enRrWkEzS2UyOXpFRzJXRytoR0lNZlkxSm9kWklHa3ZJbFl3aGZQTDBIMXZw?=
 =?utf-8?B?WWNIQ3VjNVdyYTcrMUN3MkoxWWV4b3A0UjVRdHV3S1ZXbVRDMDExTlVqSG95?=
 =?utf-8?B?bERicTBIWUk4K0JLMVNndlU2YzUzdW13OVNGRXFMQzZiQktYOFJybU9VVXZz?=
 =?utf-8?B?VnpBZDlIY3o0YkIrV0o1NGFkOEhnQVNISklHajhXWUl6aXo5eldCSmhIZUV1?=
 =?utf-8?B?Y3ZhRkU1WVVRK0NiU083eVNXQWRaUzRHSTgwSWtmdWx2OEVFY04yMmt4V1kv?=
 =?utf-8?B?Q1U2emtFZkFUQmFjWVc4bnU5RnJkSE8rU1pWWC9vdEt3TkJkcHArZHV4a2Rr?=
 =?utf-8?B?WmhOeGJLaE9UVCt4WXE4S0NZQlA2WmhtNUtRdWlhNTlwZmMyOUZtdUlMUHpn?=
 =?utf-8?B?dnJtNFBKYWgxbDZBK3ArWGdHTmhvb2RxOFRIV1c1SVQvdEJRSk5taG9ibm5j?=
 =?utf-8?B?MnZ0Mm9GTXlMcmttcXB6WUw1WjRBRk1pNEJrMTFxZi94VldTdjBXWXdhaEdu?=
 =?utf-8?B?ZFVIOUIwQnpqVW1nckphVUk1YnI0NTROQlg2SHhvWlY2VkVJSzAwOVpNZFhC?=
 =?utf-8?B?VHBWbjVRcy83cDRRZ3c0aGxPVDRWVEJycHpuYzJicTVLdTRhc0tRb05IUGY2?=
 =?utf-8?B?REk5cVBaT3RjWDM5WU01OHNCYzViQ2x6OG5IRklQc0Fkb3RkMm9CZEJsUmNw?=
 =?utf-8?B?N3FVV0RxV3c5MjZHazc0QkhaYUI3bmpOM1VOODdxQVZGbzR5dWVzaEFzeVF5?=
 =?utf-8?B?cFUxUE0zMFJ4ZVVFYTVQbjlOb29QVkg2SGQyKzNhc2VCMWR0WmFScmgxYUxa?=
 =?utf-8?Q?KFU1nf92uCrf3PcSnbIeidl119u7jlayCY9hvxWnqan1a?=
X-MS-Exchange-AntiSpam-MessageData-1: GlkcmzxM2bWIxQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0104474f-bc47-4a3b-c9a6-08dea6c88be8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 14:55:40.5747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTGduyuUYyuIIkxQGm2E7CuYUAmAqwiEAisyZ3hOYs6zwKKoUswlVsB7NA85HJcSX/7CFyMYakFR3PR1g5em1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Rspamd-Queue-Id: 7C30D4A459F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-12958-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Export `nova-core`'s Rust symbols so that other loadable modules,
particularly `nova-drm`, can resolve references to `nova-core` at
runtime.

This is done by generating declarations and `EXPORT_SYMBOL_GPL()` calls
for Rust global text symbols using `nm` and compiling them into the
module as `nova_core_exports.o`.

This is a workaround until the build system supports Rust cross-crate
dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/Makefile            | 22 +++++++++++++++++++++-
 drivers/gpu/nova-core/nova_core_exports.c | 11 +++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index 1f794baadc86..f9aaf19f2477 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -2,4 +2,24 @@
 
 obj-$(CONFIG_NOVA_CORE) += nova-core.o
 
-nova-core-y := nova_core.o
+nova-core-y := nova_core.o nova_core_exports.o
+
+# Export Rust symbols so dependent modules can use them at runtime.
+#
+# This is a workaround until the build system supports Rust cross-module
+# dependencies natively.
+# Kbuild uses Rust v0 mangling, whose symbols start with "_R".
+rust_exports = \
+	$(NM) -p --defined-only $(1) | \
+	awk '$$2 == "T" && $$3 ~ /^_R/ { \
+		printf "extern void %s(void); EXPORT_SYMBOL_GPL(%s);\n", $$3, $$3 \
+	}'
+
+define filechk_nova_core_exports
+	$(call rust_exports,$(obj)/nova_core.o)
+endef
+
+$(obj)/exports_nova_core_generated.h: $(obj)/nova_core.o FORCE
+	$(call filechk,nova_core_exports)
+
+$(obj)/nova_core_exports.o: $(obj)/exports_nova_core_generated.h
diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
new file mode 100644
index 000000000000..1d3f1544fe8d
--- /dev/null
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Exports Rust symbols from the `nova_core` crate for use by dependent modules.
+ *
+ * This is a workaround until the build system supports Rust cross-module
+ * dependencies natively.
+ */
+
+#include <linux/export.h>
+
+#include "exports_nova_core_generated.h"

-- 
2.54.0


