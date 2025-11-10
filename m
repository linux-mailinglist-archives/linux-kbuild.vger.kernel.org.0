Return-Path: <linux-kbuild+bounces-9533-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C6C491D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:43:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7AA324E6503
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 19:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384FD336EED;
	Mon, 10 Nov 2025 19:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ncwjX0UP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A530CDA5;
	Mon, 10 Nov 2025 19:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762803801; cv=fail; b=UPAbAEZWWykA+ZezRAIAVwR418ZX4etJ4lCe+G2orlBDLTC8LinNZfz/keFAXonefh9tVY63zn0up/cbZz/wQBvpOhHzY5R3OMOEj0d0uzzsXw2fQkDlYZWa0xr/dN5bsybQo2mQDKUMyEj6ZkDoee8hWwYDgTsTQnElxPo00AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762803801; c=relaxed/simple;
	bh=p13w0/El/GqBY58ECQVs9fD++NQPaTjhZF0tfJf27Z8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FV4IR1IfgrzfRC5xr1B6H6+QrimHzSpIYLFvWx9yVSaeiB3aGv+yfxalbcS3LHVvXbD0OIt/+dbO72vdNHP2JPLniZvjupVv9OfLfj6LmUgtMUJ5gdJ/2lvB7B5JfAt6cx2wzT/qPF3J7kfVoNyyxogld+opmIdr2AlXbeSPyUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ncwjX0UP; arc=fail smtp.client-ip=52.101.46.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hV2HG4FybJNIC1VWPUfWYREuIM2b7meaC5PgxhQbvmGX7USeTT4wHnbBcqzVO7b3ERFR0FfaaTHy+TgKzCZSvfkHgy3XBom3moASOHlYFBMpGKHGWfOFk0rdoPojjEK3QnQvLSZ+TxSG1y1zvQVrBeKA+Atg9tKT0/JtE0ngH1fqJdCOW/gwXrnbtd7x9l8g6HowtQ0xCYBkuP1ybedo00FdSA9yguqEiLbeXc0Aj26rdBTaT5b4xazhTIMifJJ9ottGnxm8nwsewdeK+WbtuV5nswnoqH8Rxyq9Fn/gxK6AlWJfZqdD/4JAbcgvMoBXy/2YY8mM/omR83+5k10F5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zerrlblmKBzMykQpMoWEmtk48T04j+ARP0gLmPdNhgM=;
 b=WlsZ2fv0kjWtvOyMxewC4jFKdqeZ5SZaAeGHEhhcogvBEtK6/pIGu+rl5zatoKp2hKtHidHqnI+EEO39K3ATRkIImHYCIh5YsLpxjRFNOPYwWstX8a8LtStRC1cYifJ5jBP42S11ZF5IK8/Qrvj+Bn4RgKKIGdzPsvkAvoGK4TpR8LA8NOiJ34rH3zlepLW+3QFfYiwoIx+HCoIqame1g8K1YMIvXuG4T2Vps+ePxSjqNVYg7cjp9rFMeMHn+nABg8z60shSBGIPJYOZ/K4XlRMnsD9ePjVoF4lUzt1aYvhq0Qlgim5ORYTG9sGV8zOhFCaYZ2hGVPMQtxbJ3tYdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zerrlblmKBzMykQpMoWEmtk48T04j+ARP0gLmPdNhgM=;
 b=ncwjX0UPNXVtavLYlGV8eObjpLY/La5q3zLkCrfnAfm/cXSii9APUIeBj65vrYb4PWCOUHeDHHZlBuVwpz0/8FQAGv0FYvDeOQSKl0xImrOCMPfY9mDNgxzkcQBPO2/UN5RmTLbC+Tu47p8WUl4RL53q9UEa3XUgKJS6RDO5hqQmt3PLcco+Q8NfC3wYzko1UMtZYmuoTX2bYKGDIeeFzFsG8SDUYoZyW7Qgfb8ojVDercrdoYZTgNmxBJeAXSqaNArqYN5Di8vpbGtbT8kRdLY4se+/+EtHlfcoJuFfBU0L7EGkvHTor0x3RhTZwCFCaBEAIPnOp/uWVQ8NYjUhTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SN7PR12MB8148.namprd12.prod.outlook.com (2603:10b6:806:351::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 19:43:16 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:43:16 +0000
Message-ID: <62b806eb-2e89-4e92-8b94-b932199778d3@nvidia.com>
Date: Mon, 10 Nov 2025 11:43:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/18] rust: syn: enable support in kbuild
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20251110095025.1475896-1-ojeda@kernel.org>
 <20251110095025.1475896-19-ojeda@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251110095025.1475896-19-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SN7PR12MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: f356a648-d0f0-43c1-3e46-08de209164ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yk9GNWxpVVlXMkF4eEZCSzdhbVVKdlpleXhoRnM0SEVPTk1TalY5b0JkcFc0?=
 =?utf-8?B?b1VxaFFQbkFvK1k4K0V1MytYUVk3SjdYZkhNTDcxdzBSUGNXNURHMzZ4U1dD?=
 =?utf-8?B?NW9wVkp5WnZ4SndOT2dib1JXREFEdHp3THd3N2JaQ29VUXZDSHl1eFRHMmo1?=
 =?utf-8?B?UTZ5eUM3d0Q4anVhNnoyYUJrNmhTaUo1Zm51TmpnelJxVjVzSy9xUE9taE1p?=
 =?utf-8?B?Q1hvTnpyK2IvamdLWmJ3R3ZPdW1sNlRHRGFhM3NDOGpQRzgrT1o5dTNxQUZo?=
 =?utf-8?B?M2tmLzBXbFJ2TnNLMURUeWpwcXN5RzcxUHVNb0c1cktkUk1PK0x5eFBUZk9D?=
 =?utf-8?B?TjR2QVhLUzBub1d6MzB3cWxjRFY1Z0lWa0JadlIvUVh4ZWF4ZmFERGJtM0hQ?=
 =?utf-8?B?VllFbTFNNDFVMm4zR2RnOHRqL2J1YXlaQWNjazY2K0RKUVdNUVpJS2JNUkRa?=
 =?utf-8?B?UTFURjhlSHpkdGlWY0FuWFM2Um80eW81WG5MZFNkdTkvRk8xdis3Smh2cGlz?=
 =?utf-8?B?bHlnb1BhWnRzZlQzek5jTzNQUThleVBaSGlyMGk2VDBiT0xEZTZ2NUlxbjBw?=
 =?utf-8?B?RGNCOWhNQnM2TGZWdkwxRzFQU1c1UWVHeEgzeW0xM3Z2WWdZVUtMSjMwbDFM?=
 =?utf-8?B?MFMwOVIwUWoybDY2cXU4bWxPc1Z6b3M1Z21UdG9LanpKRk1BY2IvRjdSRm11?=
 =?utf-8?B?ck5FZ0VzL0grYXhoOEJxeEdRQ3U5S2cydkE4bE9BSnUyQkZzd2poVWF5VC9v?=
 =?utf-8?B?TFZxMXptNnhpdGRjUlczdzJId3lFT3kvQVkwRUtWMitYclJYbEd5Unp1ZW1u?=
 =?utf-8?B?cVN3cGJyNDRnYytUNnZIbDdWWjZ4Rm1RSEdTKzBiSHBZVS9YVlpuRHpsWVJm?=
 =?utf-8?B?VGlCN0JaU1p4OU1DZ29hYzNOSzlQUnFSbnc5R0F5ZXViTEdsaStwZXYzajlW?=
 =?utf-8?B?Q3kzbjQ2Z0lpZU9JU3BLekl5QkphelpWck5KRXdiWmNMMWpjSGxDRGtZYW9R?=
 =?utf-8?B?RmRRaXhJOEFlOGUwcnByZ1RvK3EvTFV0WGNPb2lrM0ZudWo2ZSt6VFJrbFhS?=
 =?utf-8?B?cWkycWY1SlRFT1FFbDlSaDJqR3ozVEc0SVd2ZUtLeHAweFd6L2syeklIUS9Z?=
 =?utf-8?B?ejdVY0RLTGF1ZEJNMXhheHpWbjNEMHorYXZMeWVwTEdNMi95aXphQlAzSTd3?=
 =?utf-8?B?NmgyYkhkcFoxeksrTEdXcTFDZlcvRDFUWG44ZnEvQTJvTWxuZ09ScFF2dVpo?=
 =?utf-8?B?WkVmSEtwTEd3WDVkbW5XeElaRGE0ZU05NHdoUHAwVGJhQWhDS1lpU0JhWDVk?=
 =?utf-8?B?VUJCaElpS2VFaVhXbENlVDRqanM1NnFxWTNpWDVZdUtaTjdXZEJFMis4VUV0?=
 =?utf-8?B?amgvaWZMYnQvOCtoZ3RQZ0VaUk1DTjczbnVlQ1kwb085azlRdFNHcHFDa016?=
 =?utf-8?B?R05tNkx0SHFFdk5tMTd5S2M3bzJxQWRpdzR5TTg2TzBQSjRBUS8rWnhSck02?=
 =?utf-8?B?QSsvQnRXbEJ3RkNlbE5hTUFkZVRSRndvek1lVjJkNDE3U21kZ1pDTWRVQVJK?=
 =?utf-8?B?SFcrQ2s2QWREemR4cEphanBndnFTZjRsT0lBV1A3WmN1akJ2ZkY0cUEwTnZw?=
 =?utf-8?B?RWNBbVNBcnFYRjhWOGM3Y3pIdmdqTDFjYTNVSktQaC84ZmhhWGxSVzAzRGpq?=
 =?utf-8?B?ME5nTHB6THhhK2pPL0VJcXllUFVLazNvNnpuelE3dE40S0FkWmZPUC9PaVVR?=
 =?utf-8?B?UmFFaDI4eW10ek8vaTdabkptYWtrOWNqU3ZTeFQyc3A5d053eTRxRnNNblF3?=
 =?utf-8?B?MjkwMC9uQmVld3NaNnJtTEhKU1JRaUVCTFB2ZUo0WE8vY1pCcE0rUG1JaTBI?=
 =?utf-8?B?TmVBVlRRTDVKYmR6WFV5QUpmRVFCdk5BOVlMWVY5dXJXNFhkUVUxOXpJeTBR?=
 =?utf-8?B?ajRLcnhvR00vbElkREpEdmUzTUxoQW56dmN6Ujg3bDJ0YjFPQURqRFdiZjg5?=
 =?utf-8?B?aG1Ia0p5RmJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4116.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnJkeXhxVkMyTUtidmJQVW9RK2tGNm04NFJSOC82alhwbDhMa09obUFZamxI?=
 =?utf-8?B?ajRkQThIUEV5WGlITHQ0OTVpbEsrd3JZS2ZyMDN4bm1ZamlvYW90U0MvWmtH?=
 =?utf-8?B?VWhCK1BHNGhrVU0wTUZ6RmcyL0hFNVY2aTV5VXdjMnJqUlF2VnV6eXRzWWpS?=
 =?utf-8?B?SUlqRzdlV3BDU1RLREZpcXErd0xlSElFZS9vYlFsbVFwelFsOEdPazJLSFIv?=
 =?utf-8?B?YzRDenRxUVE3Tzk1U3A0OCtpcjg1cU5hRVU5eVlWZkZCRFgyZDRKd0F1Q2t3?=
 =?utf-8?B?ZkdqeGg4alFjY0dVMDNUaStRdGtiKy9LM2pQNG91SXg0V1RHSnpTUE8wNTRu?=
 =?utf-8?B?YUdlNzZGem5VWUMyNWQ5MjFJTlpFNjl0aFhOVWNYaHY5VlVHcXQ2M0J2Y3Nv?=
 =?utf-8?B?NTR2eklOUnYzS20rNFJhRFN2ZFpma0J1Yzc5VWVQZldDU20vb2dtenMrTnpk?=
 =?utf-8?B?OUF0M2d5TzFWNFRiS1p2NkEyQTYwZ0Jwa1ZVekZRbWVhM2hiTzBodFR5aHY4?=
 =?utf-8?B?NUFZTURHTFZtZ0k5eE1NY0RraHIwZlFMOWZaaGx6VzFnMzRWSFZwNjZxRGN4?=
 =?utf-8?B?bjJPMmZOZm5DQ29jbXRBMDNuTHBjMXJOL3NyeGVINDY5TTIxa3k1bllPT2E1?=
 =?utf-8?B?dUx4RGZRZHhJNGx3dlpVWjgvQlR6L0FWNzM4Q3RWM1NFbmlnRGFIMGZ0ZlRr?=
 =?utf-8?B?L090dGZ5OFA3MzZsQjlvbWFUZWtnTUplbjZKenBua3ZEc0RLcm1GdzB3SHFE?=
 =?utf-8?B?T2dHOTV0SWRrNm5NUGF5aE1DQmJ5TUdwOENuRmVQb0VKUWd2TmFzRG5TL0sv?=
 =?utf-8?B?d0xsM3Y2NkV3azhqcmdsMWtaWTFBZmhqb3dYR3ZFTFhEYkRQV1Q4aU5nTDhv?=
 =?utf-8?B?YzlLQ2lISVFuME5lbS9WU0w0WlJtTjFabFFMNEZtWlQ5NGpPTHg5US9jbHBK?=
 =?utf-8?B?cG1DZWs5bVgydnM5NnJkaUxFaGorc0Z1L085M09QbmwwSmZTMjNKSktJWXV2?=
 =?utf-8?B?VWpiRW8rbHBLRXY2Nkc3MmJKd29uTllyUElPTUlQN0JrUUI2MUJETzBhUHk4?=
 =?utf-8?B?Ly9mNk55djYrMFVLSWZnOXVHcW1naHpTNTd0S3JKVndqRlkrVmd5VmVpa2F1?=
 =?utf-8?B?Y0g2N3dnc2ZuUVpvZWMwemlDL2M3a1NRZ1pJd094OWtVWElBZSs5OG5nbTZt?=
 =?utf-8?B?RXB4eTRZVW5KaU1hNVpURms5TnpMcUVQeDRaWlZ2aTdSaGF3clpLMytXdTdG?=
 =?utf-8?B?bGhiaTVWd1ZIeVMvSWpLd3VPNlN5ODVlem9tMUxxV3F4MWQ4bENJSlZTWDdR?=
 =?utf-8?B?VHVwUExOd24zVHRPd2l6RjdCQzFZazdPMi90ZTMyRmdxTGFYK25lZUNYNjdH?=
 =?utf-8?B?Y20zRk5ONXBtQTQ0TVNMbWx2NXlOTnpGZXhFZDArQUxXcERFc2Vyb2pwZU5u?=
 =?utf-8?B?VS91YVZnTVgwTG1MZWVCYThuUmFvT1dDcFB2dnVCRkZ3VmFSbzZiNDFxUW9R?=
 =?utf-8?B?ZEN6SE9FT2xCSWNWNWdRbXVSWENzZ3lmcWtYSW9USUxoelVTTFh0dlRRK3Ji?=
 =?utf-8?B?TGZheGVXZDFWREREQTIwbHRhL2NaQjdvM0ZhN3J5ck1XS1RINkJWcFhVVm1i?=
 =?utf-8?B?VStGSnFpR1JjUzE4clJIR3VzTDdCQzhqQ2lqdENzaVpRSGd5cGdqdFhReEVH?=
 =?utf-8?B?U2RPQUg3RnlrT003Wm93QlVhVDZtNlFidytqZWYyYWo4U01aUGRQNjVuQWlM?=
 =?utf-8?B?Nk5XZWsrbHVWWWthUzA0c2V3TFp2QzRQRzgxN1paQ21jWE5iU0ZNQ1k3NU1v?=
 =?utf-8?B?MDFxSnNTNFZicURSNzdoUzNKcVNnL0ZyeWEwOE5MOXkyYXdFR2o5eEhnTXRi?=
 =?utf-8?B?dlBVL1dqNThpMVVvYUJlMDFOZE5sZ2VSME84d04zRnU0b2J1d2lFTURMYmY3?=
 =?utf-8?B?L3JTdVorNHRLMkY1ZTJWL3FXb0lCUVVZRnNQaFk3bFMzb3ZRYmlkQnZsN3Fo?=
 =?utf-8?B?UWJwU1MycEsvMTc4dEdyYllmVmY2dmx4THVNcUIxdUxReS9lMXYwRmlEeG44?=
 =?utf-8?B?RTBZKzNiYk5PVmhIZ3lQbm4xK2FCVFJzbFJURGhlUDNvYnNLcjdQK3dZUEM4?=
 =?utf-8?Q?2HzlWgqA45fKIp94Nemh4TKb4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f356a648-d0f0-43c1-3e46-08de209164ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 19:43:16.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASqQjVE4GH0BiqQc2yOvxT+vWBpLWOFFvWGZeiiLstcQq8Ae+DZwIcaaTN2xmOpZpP1uAa3KvPFdzjk+WanPtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8148

On 11/10/25 1:50 AM, Miguel Ojeda wrote:
> With all the new files in place and ready from the new crate, enable
> the support for it in the build system.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile                          |  1 +
>  rust/Makefile                     | 39 +++++++++++++++++++++++++++----
>  scripts/generate_rust_analyzer.py |  7 ++++++
>  3 files changed, 43 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f1b38b7fed1e..5364b3ad3600 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1833,6 +1833,7 @@ rustfmt:
>  		\( \
>  			-path $(srctree)/rust/proc-macro2 \
>  			-o -path $(srctree)/rust/quote \
> +			-o -path $(srctree)/rust/syn \

At this point, a "vendored" subdirectory for these three items is
starting to sound even better, from a self-documenting point of
view, yes?

thanks,
-- 
John Hubbard

>  		\) -prune -o \
>  		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
>  		| xargs $(RUSTFMT) $(rustfmt_flags)
> diff --git a/rust/Makefile b/rust/Makefile
> index 801a8cbf3bdd..984aec608c27 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -27,7 +27,7 @@ endif
>  
>  obj-$(CONFIG_RUST) += exports.o
>  
> -always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib
> +always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
>  
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
>  always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
> @@ -101,6 +101,22 @@ quote-flags := \
>      --extern proc_macro2 \
>      $(call cfgs-to-flags,$(quote-cfgs))
>  
> +# `extra-traits`, `fold` and `visit` may be enabled if needed.
> +syn-cfgs := \
> +    feature="clone-impls" \
> +    feature="derive" \
> +    feature="full" \
> +    feature="parsing" \
> +    feature="printing" \
> +    feature="proc-macro" \
> +    feature="visit-mut"
> +
> +syn-flags := \
> +    --cap-lints=allow \
> +    --extern proc_macro2 \
> +    --extern quote \
> +    $(call cfgs-to-flags,$(syn-cfgs))
> +
>  # `rustdoc` did not save the target modifiers, thus workaround for
>  # the time being (https://github.com/rust-lang/rust/issues/144521).
>  rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
> @@ -164,11 +180,16 @@ rustdoc-quote: private skip_flags = $(quote-skip_flags)
>  rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
>  	+$(call if_changed,rustdoc)
>  
> +rustdoc-syn: private rustdoc_host = yes
> +rustdoc-syn: private rustc_target_flags = $(syn-flags)
> +rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
> +	+$(call if_changed,rustdoc)
> +
>  rustdoc-macros: private rustdoc_host = yes
>  rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
>      --extern proc_macro
>  rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
> -    rustdoc-quote FORCE
> +    rustdoc-quote rustdoc-syn FORCE
>  	+$(call if_changed,rustdoc)
>  
>  # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
> @@ -240,6 +261,10 @@ rusttestlib-quote: private rustc_target_flags = $(quote-flags)
>  rusttestlib-quote: $(src)/quote/lib.rs rusttestlib-proc_macro2 FORCE
>  	+$(call if_changed,rustc_test_library)
>  
> +rusttestlib-syn: private rustc_target_flags = $(syn-flags)
> +rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
> +	+$(call if_changed,rustc_test_library)
> +
>  rusttestlib-macros: private rustc_target_flags = --extern proc_macro
>  rusttestlib-macros: private rustc_test_library_proc = yes
>  rusttestlib-macros: $(src)/macros/lib.rs FORCE
> @@ -497,19 +522,24 @@ $(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
>  $(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
>  	+$(call if_changed_dep,rustc_hostlibrary)
>  
> +$(obj)/libsyn.rlib: private skip_clippy = 1
> +$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
> +$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
> +	+$(call if_changed_dep,rustc_hostlibrary)
> +
>  quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
>        cmd_rustc_procmacro = \
>  	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
>  		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
>  		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
>  		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
> -		--crate-type proc-macro \
> +		--crate-type proc-macro -L$(objtree)/$(obj) \
>  		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
>  		@$(objtree)/include/generated/rustc_cfg $<
>  
>  # Procedural macros can only be used with the `rustc` that compiled it.
>  $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
> -    $(obj)/libquote.rlib FORCE
> +    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
>  	+$(call if_changed_dep,rustc_procmacro)
>  
>  $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
> @@ -534,6 +564,7 @@ rust-analyzer:
>  		--cfgs='core=$(core-cfgs)' $(core-edition) \
>  		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
>  		--cfgs='quote=$(quote-cfgs)' \
> +		--cfgs='syn=$(syn-cfgs)' \
>  		$(realpath $(srctree)) $(realpath $(objtree)) \
>  		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
>  		> rust-project.json
> diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
> index 4faf153ed2ee..5b6f7b8d6918 100755
> --- a/scripts/generate_rust_analyzer.py
> +++ b/scripts/generate_rust_analyzer.py
> @@ -100,6 +100,13 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
>          cfg=crates_cfgs["quote"],
>      )
>  
> +    append_crate(
> +        "syn",
> +        srctree / "rust" / "syn" / "lib.rs",
> +        ["proc_macro", "proc_macro2", "quote"],
> +        cfg=crates_cfgs["syn"],
> +    )
> +
>      append_crate(
>          "macros",
>          srctree / "rust" / "macros" / "lib.rs",



