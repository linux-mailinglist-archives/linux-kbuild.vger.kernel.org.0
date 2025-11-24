Return-Path: <linux-kbuild+bounces-9825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518ECC82511
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 20:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18F943A721B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 19:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54F22E1C6B;
	Mon, 24 Nov 2025 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="egXLgG91"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6878C2C325C;
	Mon, 24 Nov 2025 19:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764013033; cv=fail; b=IdHGSxvFHk9yGA4lewLwNxW+aFjDpUQU8szhjoEZYs4i44taMSWjETVC1jMmolPM6l0OzyoFXwTe3O6kAOJ7srmadknadSr3hUEdZjFMNBWqXXDzUO9fce45kSPjmLxprtigxqppWTwfz7mnf+F4kVIClxBHm+A1XN9jHf8jNLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764013033; c=relaxed/simple;
	bh=WH/dnlPR/Y4mIzAsFl97mMw/3UvBrAipWJSfWQztZUY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DcsfDAvJgZZqXbiLwcJ8PKDIG1DQNF5Z3Lb6yW2NMY+Pu6ofRMwuDoYvHtXNQCRusbdlS5q6mMw+/L8uwpMUIDBbzqhD61jA7RMP35FWM/G2HMa/FBGVgt/OCyu06B5DXNj7bOxSmHoxdX0/RV28ymQ2aAULYs3lOYu9M9laPzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=egXLgG91; arc=fail smtp.client-ip=52.101.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eC4iDZEzaTwPXUWxuGvwZvcx+IeHY656LcUcbo0A8cBOr8TGb/15+LCTvehtrH9xbNw2jpQPLY28U2U7Ptkn95a24sd/pCQvYxNlVpA4tCgZ0bMHsUnN/zSPAmp/CZrWrHrllNr4WK2S8C8CcRrwnw4WR9oX8F907EVvjKZjaDxHC4NPCRgmBuX/QV7V1GNIrFGqfKfxrzkRhmJBis58+D7rYcrUEomMFSwGb4CrxhqTAHVoLGwOeyfv+uyORNL2QsnJ0cjKKAcKITddiNFQHAPB6ippcbnFkDrjXL/GsYrQkT2G+4n0RUCqYOKN3wiOCS9S9wWjPvGGs2MtOJwv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJw/CB3QyNJi4TlpTav2J+hfXo8LoA6K1mpcP4zjsYU=;
 b=Dsn9OwV/ubyAugwd3pL1k1b1LRM2FkgYxUkXkK8U7Ubq/mv4twQgPmy0y6bfA7sFb99M1M61fE3f1y/kLshxdUtnKCC+TFxKvE5rhxeW0ZDEoo0l2gffavkzCXbZMHhRfPyroXfH/LBOJXvKb6Kz1fb1tkKPX+qaZAVT2vkdp7NDmr9PS2UbFCsD7Ccg4s7J0802+Uft2UZj/J8kydBEr7vSI+N8cmKIVWOOEIvXh+WM/lVsUH6nj1ml4kuaeHOIU6k68Uatqo41MVEIrLvwyBjVr64i5n1XMoTDPxEp6aRoQJdrjzQVk1ukBBrF1SKyy70c+XvUY7RrixW3and/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJw/CB3QyNJi4TlpTav2J+hfXo8LoA6K1mpcP4zjsYU=;
 b=egXLgG91d9AJc/YR9E7XK2JMtnerOKTRUrUhaNnkzVHGcVlHweKGfW3Nauqibv1BZZ9Lyrn7Eh6WnNyTnNiLTvGY7qFrrfxZlbxZP1nm3cQBIqsgQ7DM48bAz3RjqOJ0Fvu1/ln60UR+m+ewOZxkhPSUoFAggQnJd7L3cNkvJDiSbZK082QYDnNjEi/gQkolcVnxohSs9UylHiAEKnxA1b9mFPr9gEjg9FstgTDX2UEX4A8ifZCbfdeJqvFFj6cNbWgFKt8eSjV1EZBzbnnGbrIFKjpvVcMedPx05PZ8F7U3H50oSfAhFXBYxrEQsqCT2ZCYIeg5Wkc4J3SYkVd9TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6117.namprd12.prod.outlook.com (2603:10b6:8:9b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.17; Mon, 24 Nov 2025 19:37:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 19:37:06 +0000
Message-ID: <27735776-7538-495c-b4b7-2ae8893d28d6@nvidia.com>
Date: Mon, 24 Nov 2025 11:36:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20251110095025.1475896-1-ojeda@kernel.org>
 <20251110095025.1475896-10-ojeda@kernel.org>
 <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com>
 <CANiq72mcQJnW-F+nb=Vseoa_amcwwhkC26N9BOs12MVfMVOdVA@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mcQJnW-F+nb=Vseoa_amcwwhkC26N9BOs12MVfMVOdVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ab5748-a883-4245-2ac5-08de2b90d99f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjlFU0cvQVFicXg4dVVCKzJicWFwRytwMUtJTXBQM3kvOGtVK0RaYk5Nemo0?=
 =?utf-8?B?Z3pQWGh1dmovQkJncjJNeVRhcDVxRWtqVWRHWHY0ZFRVOWZ1RTdpbzVmSnhj?=
 =?utf-8?B?VFdZVUpXWTJoUkJnQjd0cDQ0KzdiekhyOFNVOUhCRXdReE8xNmZ6ZERRSTVB?=
 =?utf-8?B?ZlRrTHdqWVQzcHExWG91V0xxaERORzRtRDYvQS9seG9Fa1NjVlZMTHp6UXdo?=
 =?utf-8?B?M0JsQkt2SlpwcElVOVlvczBhNFlVZkZJVjRoMXRzSVFvSjhMT0xrZjY3b0NN?=
 =?utf-8?B?enVlVWRqT1NQQktDczFOcVdqY1k2dis0L2RTNW1uTk1xN0hGazFDS0U2NWlW?=
 =?utf-8?B?OFltdWxEdDNYNkZreitvYnc4bExzQWlBZERodkJaM3pPZUFEYW5kaVFQTVBu?=
 =?utf-8?B?dkRKZ0Zuc1lIdDZhN1BYMzlIbThBaSsrK2VhZTAzdVluTGQ0WlA1K0VONWEw?=
 =?utf-8?B?blNpYVNBVm43N3d4SldJT0ZMcHZMNDhYOWU0c3ZWc3ZxWHNqemlaakFSNklp?=
 =?utf-8?B?MTBzUzNCa0JmL29zcUpVRFJuNWxVUWZPU0hFYnI2YU12MzlCcWM4S0FHdXhk?=
 =?utf-8?B?cGpEcGVReDFxR2JqTGM5TXA4RFFLMG4zM2F3bExDRWk0dHFaaXBUMUVuNnBL?=
 =?utf-8?B?T2xMem9WdW80dTNKV3ovN2ZRakN5b3FlTytSamprY0hEUTRRdVBhNHlPaHhi?=
 =?utf-8?B?NHZ4bUhVbUVHdngwRk54M3d2RUFmWnZidTgrTEJld3R5SnpaWk81enpXTldQ?=
 =?utf-8?B?akxtRWR4V3BheG05SjBRMG1yalNIVktiU2gwbXVhQ3NNMWNxTVU2WEFkbkM2?=
 =?utf-8?B?MTNsMDhSdDdSK3MxeC90cXBoY3lUd0czSUU4T2ViY3ZTb2NFV0RSL2xSRXBy?=
 =?utf-8?B?RFJQUmpMTjhNektGNTI5TzJDQ2ZoVDIrR1FQaU9va1E1WWNxY0pNYU92RTN2?=
 =?utf-8?B?eVlSQ2k5WXA0MGZ5Y0YwU0NoOGI4U0NRd2tCd2J1aWRsOWp5OFJGYzAwY293?=
 =?utf-8?B?dTdjZG5ESUhnY094VWJscDBUQUxodzJEK0E1OEhzemdVU29LS1RGVUtlUnl1?=
 =?utf-8?B?SXJmbm9xclI5czlYZHB2U0ZwV1crMVhkL29ZRHBxcjJaU3d2b200WXBFZkNK?=
 =?utf-8?B?MDhEN2l1elBWRUwveUk0OHdTUEprbktBOHRTQyt0ZjVFMG1tV3gybFJKZ3RB?=
 =?utf-8?B?UExYY1A2VllZQ0FId3BQSFp6dkl4ckFnZWgvY3NHUk56eFpPcElHZnV3ZFRJ?=
 =?utf-8?B?QjEyME5pY0wyMmVJUlRaZ1dyczA0K3N6YmtBbzVsYUFjMWIzZWRyeTB3L2o0?=
 =?utf-8?B?VkJQZHJGNkZBM1B6eVoySUFFakErV01iZDZHV2ZXeXMrN3UwTVIxWW9XM1Bp?=
 =?utf-8?B?dHFSWi9zN25PMXdFNzhxWVZCVnZZU2MvdHY2MzJKMW5qWityWkE2a2psNk1F?=
 =?utf-8?B?NVRNYndyNzFVanFvUTlLdElQSHphSFpDd01YRVYyRndjQTVJZTljN2pNbitq?=
 =?utf-8?B?QXlGVi9VdjRLcDFPUkRKTHZpeFJHbFlWOVpJUS9aYmV4aGxDRjNSUWpzZGNz?=
 =?utf-8?B?VE1TalQ5eEQ4bnBtcHBGSWdnUk00OE8yN1Rucmw0T2FZL0hZeTJKakVtL1Bw?=
 =?utf-8?B?dUczcjFGdmxYYSt0aktXa3NxcjdCUEZJT0JjZk9VdzkyQkZ4RFA4M3RLb1Jx?=
 =?utf-8?B?L2ozQ1NCVUgwM2RKMnJra3Y1TnB4TEh1cEN6OUM3NXR0WXg3L25qaXU4cDQ0?=
 =?utf-8?B?dnJFcmNIOFhNSUZTS25JNnppZXliZ0hvemZ3SDBBR2hVMUNyNTRxM29UQjkx?=
 =?utf-8?B?NldkWWZHVGFzZWNTZERSL2pYd3FVTVVWMlJscnFHTTdmcXFudVRUQlBkTDZD?=
 =?utf-8?B?UnEwUDlEWVZNTlY5eExxQk90TU0rVGhZTFc3Q2JEcW9qb2hudnpiODgxVXh2?=
 =?utf-8?Q?bcPQj1v4WxowURX4YRvbl2KMBfXOx8Lg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjJjWkgybXdvbmZyUEF1NUFpR3loRWR4TCt5bERWVHRkbGZuTEF3N1BRb0d5?=
 =?utf-8?B?U1o1bTM3SFN2V29XNjhRRzkrM2s1UGJ1Yk43QjJjSXV2V3Q3cnZEVDR4Mkxl?=
 =?utf-8?B?Lzl1eUdiVlN6Tkp4dEJQb0E4cEx6MlRwaDlXNkM0a01zUDdTUWtZZlB5cXpO?=
 =?utf-8?B?ZTdncmtPdnBZcGlETmR3dEhqWnpiS3lIYTNidHl0amhZUm1YbVJuMHlaWEJH?=
 =?utf-8?B?M2tpQkRQVVRhSjM2Vnd1MkdselZHaFo4bUdSczd1UWdnQ2tzdW1adFg5WWZS?=
 =?utf-8?B?N3NkRTBIVHJoS2pXWGtLeWlGalVrLzkzYUlSRkNOWmhHdC82eU5nS1NzWDRj?=
 =?utf-8?B?YmllbDRWQk5DN1p6L1hha1RuczY0ZUpPZkVxelNWTjlZbHo2QnYrdXo2MU1U?=
 =?utf-8?B?UlliV2hPWjJPZXAvU1V1UmdhV2xUTkNiRUg2QmFMOXpJRExMVGVUNWxMUGV4?=
 =?utf-8?B?SUlWWWo2RHRnc1RSMHVzaVZQbnp6bGJzclRmTXFGLzNCSnJTTEhOazdYWTdY?=
 =?utf-8?B?ZnlTMWUySHRISHJWMFBnbFdWakhuOGticStQL2twNXMxQnNxSVkvdlZaSnlw?=
 =?utf-8?B?RUlFMHJPWmF5QWpIUmdEekRiaEQ3RGhEbUM0Y2VObDZsT0hTSldJVFpOZ1JD?=
 =?utf-8?B?WmZtNmpmSkwvYVhwTHN5Z1pVcjJMYzNrYzlkNm9jVDl6RDM4SjdLaWRVK0Vv?=
 =?utf-8?B?elAyVU9LRXdBYkM4Um0zMjdFcFpmaVkwYW5FOFRGT1ljU2dOeVdhVW4vWFdG?=
 =?utf-8?B?bHlRd3dXY2xoczVnVzlydm94dklETVR2S0JSUVV5UXhFRGdZOUhDVFBDT2ls?=
 =?utf-8?B?SS93bktoRFBRaVhwRHVnL3RkME1GZ0swSlhjTUYwcEkvb051UTUvRnJpYkda?=
 =?utf-8?B?TklibXloTGx6dEF0dU5SYllkTjNvcGtqaXJ3RTRPenJPYTJSRVgycGhoTDk0?=
 =?utf-8?B?SGJXUUd4cmpYNDU2VW5lRFo4WG1Ja1ZLQXVJVE5ydWlIK0RuNXd0V0RsUkI0?=
 =?utf-8?B?RjFxVURzQmRGQnBDRDZvblR6RDVWeUY5NzRlR3NEdFVZbS8xeUlFVjRUQWdN?=
 =?utf-8?B?ZEIwSUlhTUNFRys3NnpvK2VGYmxnNDNnaGY1aGN3ZWhsYmpiY0lhMnhJWlI2?=
 =?utf-8?B?eHdMQW5iWFdYQlRkSFovU3YzSnFoQjdMRlFvcFFJU0wwOGJEZWxaNEUzUXhW?=
 =?utf-8?B?US9FYU1QRHlKOHNBUVNocVQ0SDl5QWU2OVlpYVhWOXdXZGp3TW5vTEJBN1Ra?=
 =?utf-8?B?d21Gc2dJL0RMY3V5bGRPL283bGVEM0czcFVaNzNidzJZTmJYV1A2cnJYbll4?=
 =?utf-8?B?K2hOM3M3T1E3RU1oSGVMUllNaU84OEYremlqYjJLMlJLSEx0SkNNOGZtSmVS?=
 =?utf-8?B?bnRmeDFPRUpGSG9sZ1V2OC9lVVlIWTJNM3h6U1J5ODkvY0JEWG1aK3F4R1Bo?=
 =?utf-8?B?V3RabTRHTW1WRGUxazdqdTBIWGlOUUNaNmlwRUpuV0pSajF3RytpdGRDTlZu?=
 =?utf-8?B?MlBsMFBqS2hHdlVpcmdYYk5ZaVNZM0F1SnorbnBDb0NvQ2toZ3BLa3JlOVRG?=
 =?utf-8?B?SUYzNVFhOENMd2JPOTdGSU5hYXVaQjF4M2xnbi84akdyc0lzRDIwRjlkdmNl?=
 =?utf-8?B?UmczS2hxQWtrbzdPWU8wclRXM1loVklDWm9SaENRRjZJb29Yc2JjbzR6WXBH?=
 =?utf-8?B?Ty93QlNLMHFpakROVDJldVdmM2I5ZTd3MTBWUkFzaG1GK3dEUmZ6UDErSEVa?=
 =?utf-8?B?YW9DbXpYK2h2eG82SVQ5bHRMenY0K09LVUIzU3IrRVdzTTVkVDRSZllxUUVV?=
 =?utf-8?B?L3E1c3VleTBnTWFzZFp2Mkk0RGRmclJ6MC9SdWhGNkZaYkFrSkFRamp6YVNv?=
 =?utf-8?B?RjlJWWNhQjVpdmJZUld0NWRmeXhjWGRKb0MxMDh1akFwbWdVc3ErK1RjdGo4?=
 =?utf-8?B?cDZzelovV21EQWNoOVBKaHRTWE95QUxrMlZta25PZ2pTb1I2ZUwvcE5ESnZN?=
 =?utf-8?B?a0p3MmdHb3ZRa0JzMVBJQlhvSTY2dWg4OCsrc3Yzb3BlZnF3K0NmV1A2UjRm?=
 =?utf-8?B?MmxrTHhnaGdLbUFwUTF4NVVxQ2tTdy9WUEhFRzRWUi9MYkRDUE52N0dYWmdE?=
 =?utf-8?Q?WWXYFJUh3vJycbIFxMGRG2pgL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ab5748-a883-4245-2ac5-08de2b90d99f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 19:37:06.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GU+u5n6qkcSLkGW6DrF3m1YsANm4M2rNohjblcDho0sYonZOH1/eB/iRvimuJYaBvzMUsF48al0Js8C7R8A+zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6117

On 11/12/25 3:14 AM, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 8:34 PM John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> Looks good. But for future code and commit log readers, should
>> we leave a small comment, to explain that this was vendored in,
>> and therefore excluded from "make rustfmt"?
>>
>> An alternative approach might be to create a "vendored" subdir,
>> to make it clear which parts of the Rust for Linux code are
>> special in that way.
> 
> Sure, that can help, I will add it.

A minor thing, but, it looks like maybe this was forgotten or 
overlooked in v2?

> 
> The subdir makes sense, although it makes it into a different level
> than the other crates and I don't see it done with a folder in other
> cases either. Hmm... I will think about it.
> 
> Thanks for taking a look!
> 
> Cheers,
> Miguel


thanks,
-- 
John Hubbard


