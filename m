Return-Path: <linux-kbuild+bounces-9920-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C6C95B55
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 05:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEFFF3A164E
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 04:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5C41E9B3D;
	Mon,  1 Dec 2025 04:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PR6y2rrN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013052.outbound.protection.outlook.com [40.93.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2AB1F1534;
	Mon,  1 Dec 2025 04:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764565031; cv=fail; b=WLzpj2dO3xTaki3msgv/GPZfZcxlJnYm4GJ6KuQlNSf+2YyCDU8PjNAS6CSlOrN+HnBM0BOeK1qhfg+ZNqMGEc1nfbMbGcGcOseYhdmTjJ/FU5plJUvMrYyGWVcznrjO+p2iXMaszDS4xpe3zY4eW0EgB82WW8tB/G6SHUAOLNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764565031; c=relaxed/simple;
	bh=hy6FYgnbSVKRFHZGV53EzuzBYfN4h/1HpOOQYGDC6hI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LlpQ5Sn1WRI5F66YFW79zkfXwNgiaMLcc3K7k89Y9Do78lwGvel6OJxGlzm+oIqHODLRu2SO4V3GGgkcc/JfeCs3mp3tJ72Wob8C3BBs/A6yjwd/Js+aNY1gKHgC5zSL+Ksi+Whp0g0ZElNS76T5BqdU635MOH45x4Vzw11Naso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PR6y2rrN; arc=fail smtp.client-ip=40.93.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKYdqGzDkhbJpgUhZIvYQmB0d1N+mRS32oDpKx36MLBSZxx7wlZJsaPm76cKtroye5G9cA3GYcMrdJ5aYlh1zNk1wedAqLJaFDbv0C3hszlOCrP4FVIIji9otOZIEqNJ+qxNdCMVYCWebkjoOjVDv7/v39SW44D4lVquK0oy+OXZy7clawW4yh1WpWkaetnckp/jNdQHljl19NEDpkGZmITJYm5+CTl23K1qQ3mx26CxMIL/y5wHFrK2MyfD3UVyF7+UYLLL7TZEE7bNaQH3dwvKsXAqZVlQgRxWZvhNwF7p81LF6YJCKF8Rc7JdhSHrflgkI7C55p9hzUh5tLpc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtNkiKOa1cgDsJW7JpdjAHpSk9+UYFcwo7KrRelGwkg=;
 b=lOa3qRUXsyd/2GmJxKsDGH9Itf47ywRHXZULEGimD1LLnHvIsjF12R80LCzNwNrJVhVFw/DQAunZQ1H8qhtVa4QAt4h+8RSyztt8g1w8ycTroROrzRJR6REh/8imQr7hnbgu4VrORHb64TzenEgZHhKpjj9lZGiYR2uJ9/2VRkaSqKGtGNkHx6YyHUNHxzA7cEKVwTarqeSLluLkR30Eg1cfzjgl2qPgUXkBu1lPmRYeUn6CzlP18mAfhoBY3ljmLT8vlHoKsnHhf/M9KsOpwEdLtSEpHM9qpf8SB42vL3qrW6woOYCPD62VslZQGUvhqjC24e9GZLu0ELL9gsvJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtNkiKOa1cgDsJW7JpdjAHpSk9+UYFcwo7KrRelGwkg=;
 b=PR6y2rrN/rd8Bafa4BMN24KuwNrn2e6bhFgLrygXCJTX5CPqDEaVx1nyDFRDsWSfWC5DU9pYecXVBG0C0hopTTlrbC4TwNkbFZEkrL8qHio8wzYYG8X/ddO0PjSle0Ey9y2Is1CFukXmR6HEZdYlfNj278ZLBbBMOrWk+iA8pHDDVhcns9y9LtiUBKSXwLg/RaX3HlCdaFuZftosgjOXfdOuP4RZzORYpBL3KJ164lvRgQH2QUCpnXjkvDKEgqYZjs40SqPVY3D0yFdqHNY2+5W/rUckDrIR2jSgr8/y5PbFU9b29AoW2vpSKrzHNizGQFb9HqK1FA9f95IovrzW4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 04:57:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 04:57:06 +0000
Message-ID: <470357d7-5958-4470-a718-25b9c7660565@nvidia.com>
Date: Sun, 30 Nov 2025 20:56:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: `KSYM_NAME_LEN` strikes again
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20251201021659.1729308-1-ojeda@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251201021659.1729308-1-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: eee256e1-65a6-47cf-4501-08de3096139a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDgzYkN4cXZTdExyTXYrRGRYRVVFTFduQ2JzUkNMQVNuU2pzdGZXaXZyT1M0?=
 =?utf-8?B?ZnA3L0gvTi8rSUprUHRNNzc0LzBxaFlNZWdqalUyNVV0UWJDVjZjdzBlUmtT?=
 =?utf-8?B?VFAxVGJmZXJneFFZbFhoTklYZkdQZy9SWHZGVk5nd0lYZDN0RFhwbDZSRFpv?=
 =?utf-8?B?dEZ5QmU1MW93dzFKSGVvNXpLSEdGaEtkeG52UTJlRlZyR1g0bkUxZU01Tmkx?=
 =?utf-8?B?THNEd2xDZTJaeUpsRU45SXdFemNmS3hJV0ZlOExIOTd5bURtOVc5eUVpSjZV?=
 =?utf-8?B?R0Z1T0ZmYmZYelE3T0tIZ1FqbHAzcnMxVWJBSkYyeVZOSmZTSU02VTMxTkdz?=
 =?utf-8?B?dkhWSWszNkpjdXg5Rk5lRXJWRXBhRFNDLzF2M1MvcnhNalNBaHBXOG9JRFhw?=
 =?utf-8?B?ejZUNTJ1bFBpY2Zaem9weVdzZzZUaXlvK0liaWEwMU5Vbjk5V0tOeXlYVWV0?=
 =?utf-8?B?aEZ6N0ZBR0FvT3RzSGNXQUpHTUhMNG11d3Z3WXRJTEJvNDVlcHdGZzdYakxw?=
 =?utf-8?B?aGRWQnMxcUh0ei9TaGhiR1lyazhQd2ZSdlBVY3RDZmpCRkJBUUNGYS96R1JS?=
 =?utf-8?B?Y2MzUWMzdUw2Mzd5bjlRbWRmUEh4RWpZUnh5Um1BVERnY2J2dlpRc1pwcURj?=
 =?utf-8?B?Rms1Z3NtbDJQb1BJUXNncUY0R1RCeHRRRTJDTXdXekpKWVFyckVQYTBhNjl3?=
 =?utf-8?B?dm0zMW1jeFF2MEk2QWxuSFM4Ykc3aEJJVHN2aXN1RFYvOEFTSU1tYU5IbHlJ?=
 =?utf-8?B?djZXOTJRWTY2RW1pZUdPMWRXT2hPMGlYQmZ2YjBBeGlURGtWL0Z3cVRGR3RD?=
 =?utf-8?B?dTUyRGJITlZUVkRzK1lsMXFNMzFyRXMvY2xIVk4veVVoMjI1OE1DR0w4dEMy?=
 =?utf-8?B?aXdraDdXZllYdFpQK1h2bUFIaFVTWWFOSm13MHVpRkw1bXRnVUdjVDN0eWdz?=
 =?utf-8?B?WUpJMFU5OVM1Q2ZqR1laekZPTjVwa2NzeXRvOUhmWWh0TWZzREE5S05maEdx?=
 =?utf-8?B?N0tnYmJ1eWY3M2pNREVCMCtJZDFtREtsTzdDdnRqYU83WWN0NjR4TWs5Y2tZ?=
 =?utf-8?B?UUFRcUh2QVJMcWh2dlJhc3RmaysxMlhQT0dGc0I4UzdDMTZsOXBZRTlnL2lD?=
 =?utf-8?B?NnU5S0FtT1FCSTRwR2R2UzAwWXNjdXJDbC9VY2pVUkovYlZpRE5XaEdNUElp?=
 =?utf-8?B?cGlZbUw1NXUwV3BwaDZaZU1FTXg3SXRwbitJRkM0UFVPUkJ5R09ZemtNQ09v?=
 =?utf-8?B?UjVzTUVoWElWUDREYWlYTDViN0x6RmMwcGJWeWtjQmFobVkxZzh3MHpnWnpG?=
 =?utf-8?B?Mzh6UWYxS2F5OWRNVzRQWCt0UDZuemV2ZnhWaEhCL1FOcTN2Umd4djIya1hJ?=
 =?utf-8?B?cTJ6bzlDQWFDL0s1RVZtZ0s1RWVXSVN1Q3JHK2RlOWZmcVZGS2lKMjhJTTNm?=
 =?utf-8?B?Nm13RkxyRGNFVWlFbUF3d3NJN0NqaStsUUJRdE5lTEJFUVplRmM4TFIwWmpk?=
 =?utf-8?B?bFM1dDVyZGJoWnppNTgrUUZqUnVjQWo2R1o2TTFjdDhsQUloOTMweTJmRUk3?=
 =?utf-8?B?MHNMQU5oU05lQkdrWHExN1RKSDlabHBhU2VrOFJvYitpZmxIQlZhb1ZIdkZW?=
 =?utf-8?B?aVBaTHJEZmNwaEpDVUw5UDFYNlJwWHcyUGRnQlE5bmNBbStNVDVkV3VTdHhI?=
 =?utf-8?B?QjNuVXR0U290dHE1NnVvUEQ2M29hTk9wN09NbE5obTZkL2ZMOHNKUEg0ZUpk?=
 =?utf-8?B?c0F4NWZzVWVEN3JDV3kvTXpTMlhlaWZSdDdwQzVpWisxUDVURlg3a0ZObG1q?=
 =?utf-8?B?UlFKMUdLTFd2UlRWTFYwcHd2dkJsR1dsbU5pMVlzVnBWVlFscVkvL0FuSXRq?=
 =?utf-8?B?M2owNVd3b0taQjd4RUpRWFFlREtTcnkveWwwcndYMEo2b3BRMWM5cmFkNFR6?=
 =?utf-8?B?ZmMxMit3ZWsrTzNzdU5IWm4wK1JQeWl6VEk1dnNkUkJ1MjNVdnp5MmJQazJP?=
 =?utf-8?B?bWl2dW9tbDVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhkV1dobWwxYm5oU0JMNmgyQVhTNmdPZVUvajZJeE9wTlUyTjdpK2JNZVY5?=
 =?utf-8?B?cnFBcDZwQjVDdzJmd3Rac0JJc04xUjMxdTRwcjR1UzlHMVBXc1NFY0kreGcw?=
 =?utf-8?B?WlJrQ3BCYkZWQTQyVHhpZG12dUprMy8yTUR2SlFrUXNZYTRnR0J6d1V6N2lN?=
 =?utf-8?B?NzZaZytRNkF1eXl4bTczZFhkVXBObGtmMmkrM0FHdlYyREk5R2VUUVVscFA2?=
 =?utf-8?B?V0VPdjY2RXZpa2ZkMGIwZDVjNWlWdmEyR3FlRmRPdk9GM1FjN1d0OFNDN2hp?=
 =?utf-8?B?LzZIMWJUSGYxK2tpSUg1ZnU4VmZLVi9OY21wdjJIRVByamtCcG4zUnlNdzhl?=
 =?utf-8?B?SytSTTdYcjBrcWpvUzlmRkxHcDlKVnhnRTJSa2dmekp5N09UcFAyNlRzZ29u?=
 =?utf-8?B?QWlDOGZnSEpSbkRYWlBJTER2aEYyVlJPS0hGWCtweTlHcm15VnA1YnBtUWR2?=
 =?utf-8?B?MDZCc2FYWEJwZk5FWmRLZ2x3ZDY3azhYcWZZTVdnVFVzSVNHTlRURmZWTnor?=
 =?utf-8?B?Y3FGN20zNHpjTDdBdGxZZUlRMzhqTHV4NmhLMjlTQldOQXJYR2gzenZlVy9w?=
 =?utf-8?B?bWREUTJ5RnBValk1SFMwSjAxTE91QUk2NnI2Z2tBTFdrVE9zODNGaXI3TVFC?=
 =?utf-8?B?eVJOdG45YmdQZmkzaWdKbVlBQTI0N0QwQzJ2ZWk3QVR4cFVBRUpjVlR2WTNm?=
 =?utf-8?B?VDE1M05OaVV2cHYvZGtzKzlYcGxMRkN1cVAvaGc2NEZkYmJKRzNHK3JvZGZH?=
 =?utf-8?B?dzVTNGxpdXdWL05FMzRlK21ZdzFLc2ovanhUS0dRZU9oYnhVMFQwd0Y2R0NQ?=
 =?utf-8?B?eHRBZTV1V2dPazVqaFMwbi9pcEYyR1NnNEI1bkg3YUdiYTRMOFRjZit5UXFF?=
 =?utf-8?B?SVduYlVGUjM5d3FsMEtUU20zTXNnbEhEcldOMzJFQ1lQNE81S2JHNVJFSFN5?=
 =?utf-8?B?dm44YzM5VzJDTTRLRURPQXhLNmUvVnkyMWpLZFJ3N0Y1eVZRS29zYTdtOGI5?=
 =?utf-8?B?V0VMMHRwaE54WnRwWWo5eXZpMW0wS1Rhd2FXOVppdXZCNlRjd1M5UFlyYWZE?=
 =?utf-8?B?Zmx5MVhJMkdseEtSZ1I0OUlHS0N1d3k1c2s1Rzdnd0cya0hVYzI3WHJSNk1U?=
 =?utf-8?B?MnBpdWk2emJuZUllV2VQc0VuV3E3YXd4WFM4S0M5LzhoaHhKUkVXNG45ZmZ6?=
 =?utf-8?B?dVpMdXo5cXdZcHRHQytqRGUzRWJkMzFsUXN4a1Fuemhwb1dhN2doWDBXMVM0?=
 =?utf-8?B?SjJQanR4T3ZtZUsxaG9NOFJVLzJNRklKZVBuNTdZbk5YTEhEMXlLTkc0a3pV?=
 =?utf-8?B?Ynk0OGo2T3lHenc0Q3Y1ZUxBaXRBU3VrL3hoajIrcitlQTh2bHpVOG1YckVY?=
 =?utf-8?B?YWFPelUzbUJlbk90a3ZWd2pLQ2U5d0dTNFlqZ1NpQzJQS2lweEQwTmxPYnE5?=
 =?utf-8?B?VDFQYVc4ZFoxelJvcG9xMEJ3MUdRSWdURm9BTnIzM3hVQk9sZkZFcjFmRFQ1?=
 =?utf-8?B?eUtubFE5Sm4zVlZjYXFQcVdCR3BUVEo1L0ZiaEhCT0lqVWxiMXFKRkNIME9V?=
 =?utf-8?B?YVpNMDk4emp0UTRURFVwMkxmNVZ5Z0s1SG10RVFqSm5HcUxVYnpHWFVBb3Nu?=
 =?utf-8?B?L2I3cVRKQ1kzVlAreVVsU3hXMDZaSGhpY1dqTWtjNjFSWlFVMzNEM1RVaHdh?=
 =?utf-8?B?eCtUcGRMZWF2WmhQNnFFdjVmdU1YdkxDdmlUd2k0eXJCZ0Z1enBUVVJVWmJ6?=
 =?utf-8?B?aVlaS3REMjAwU0JEMFdjd1dKUk1MU05ob2JIcDZkcnltWTdENmE3TjdJa3A5?=
 =?utf-8?B?ZzdkNlRxWmcrZjR2OGVhc1Fpd0s5Z1RrTG5TRUd5VGNOaS95dW5wUFo2a3My?=
 =?utf-8?B?UXV0cDhVbHZGZGdSSFRjRnUwU2pBT0FTNHUzUktOQS81TmZmWjZ2c0dTamJB?=
 =?utf-8?B?RGczSFg4VStYUExQbXVXZWE4RFNwSk5vOGRBRC85MVplWDQ3ejRhc3RWWHlq?=
 =?utf-8?B?YU1QSTVYcGordUlOQW1nRUwwRzRjZFIzUkJFRXhpMkYxK3k4QkVWdGhGTkxq?=
 =?utf-8?B?ZHUwbmdLeURSS2t2RkpZcyt2MFhpMWxjd0tKeGN2ZWUrWHhHRUExRFRMcXNO?=
 =?utf-8?B?M3hZNFVPVnR3S1V2Tk9Pd1ZrN1M3dDM3WDdnaFhjQmtqOFBYTDJrcUVUYVBx?=
 =?utf-8?B?bGc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee256e1-65a6-47cf-4501-08de3096139a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 04:57:06.6963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2M7dFyXzd1S2CmOxfiCKo+rpZ4ETVGXeQryYEs24Ae6xBNSOoYapkj90LC27+/WREuHZViNRZqzES/LeeObVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229

On 11/30/25 6:16 PM, Miguel Ojeda wrote:
> Hi all,
> 
> In some Rust configs with -Os and doctests enabled, we are hitting
> KSYM_NAME_LEN again:
...
> Other options:
> 
>    - Conditionally doing it only for those builds that need it, to avoid
>      penalizing other builds (including normal Rust builds).
> 
>    - Building the Rust side with -O2 for now, or at least tweaking some
>      of the inlining behavior under -Os.
> 
>    - Not supporting Rust for `CC_OPTIMIZE_FOR_SIZE` for now (e.g. under
>      `BROKEN`).
> 
>    - Stop all this and go with a hashing approach like Willy/Linus
>      discussed back then:
> 
>          https://lore.kernel.org/rust-for-linux/CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com/
  
I'm impressed that you listed this last one, because it seems like a
somewhat extensive project!

But if it's actually an option, it seems like a very nice one:
a durable and long-lasting fix.

Maybe we would also get demangled backtraces at runtime as a side
effect, which would remove another minor bit of unhappiness too.
  

thanks,
-- 
John Hubbard


