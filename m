Return-Path: <linux-kbuild+bounces-10701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2A7D3C2FF
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 10:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BA227684A6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 08:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0139E3B961B;
	Tue, 20 Jan 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="grCH5Y4j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76223BFE33;
	Tue, 20 Jan 2026 08:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899273; cv=fail; b=ODw2xGeB2PNgep35qrtYN4eusv7hhCSDHjZ/+nic6+Ff3g5WUV7JBihgsTn5RjVNR6DglZww/IpKAF8ln9fWiCtQ8AsBTr4G8qzyQPKbBWMUN3wOmjdmgiPxxS8gEh4FPidh+E8VIvOXuUN8EzoM7a97xy8g5ryejfnEZv4wfWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899273; c=relaxed/simple;
	bh=k1pBOJYw84q9UsVd+b5OdK+jv8+XpfoOS4N3LWPpnJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eSNaRkQG8MnqcZH3m8n2MEUxyMWSL5cF07tCeyQBegAJ10QXyYqRRg9zgXPuAppe/Lb4Qv2gpddv9JOlQSg7KIjkOLoT8AJoNm+4fswoAPI8wtcVDoppL0x6DWkccwOMOA3ilkP5oFd2HrxuYJacIRgFoniG7M0qQAce/4caP8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=grCH5Y4j; arc=fail smtp.client-ip=52.101.53.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFglUXZkye7cM34HEvdhNFNnUAO44aT6AgevercDECybukr7LZS8Rctv4xxdGG/rjyhPBvR1AKwZS6wYPQva09nFfKyhNWYN5reRHOQD7Mpkz0xwrzCKh7dRBoibOHASeR2jK7YmrNQspWCLc9eHo/T7PQzi8uKjqLzUELIEG1GMO0czX4Gm2+27CJTg/cAQ9PoY/mSd6loG5dsOjgHFvaZKJJvRqeNqSkzo2PCBKTyw6EBqPCcEMHqcqHVK+kz5AgODF1IUO7+hH36an1TyjlkXZrAQxxob6qWkdY26xLAEY40HAcwLgxYr2gmCT4WOCUwEZJ6WHHtMbXA931DVYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HouJemgJScweZPO+K027HgjdU1njGCDhmr67JBT67x0=;
 b=aY6hHpKMYip71xhsiErntfNdLkqIuKAKXB0dunXlSSevOiHq6l4Wi0gwuiCWMwKZ4oFoT7lRFxiP4m3LxZ1H2Cj3GXE2o1fRMzX0+qHlQH0lTss6P18c2fB6PARQzekKSb5bECPDySeqFsvfr/1iFVZo+2wwWDbZvWR4kdR8pLlw9pJK7cIc56TGW0rFgYY8cvevzs8c0UkzuO1ZrlvCzLBgawn8UOkz5zRlb2SCPU0gqq+5Uarb/Ucc60BgDbyLV+yaq4AeNZD299Uew9MG1cPrFN/9BJ7I0XEP9lFKsFVDyAt/aG2bqyNXb/Drfp2a7h3yindQhQej9E/CIOieOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HouJemgJScweZPO+K027HgjdU1njGCDhmr67JBT67x0=;
 b=grCH5Y4jkujNj2DR47KiTUvo3qiqvYt8bLU4bz5yX9IMsBxNeLRvu6hscQfM4Gv0ExKtKx0jqOb/CxcfsTu9SqCrPwAO2sQuIXHFXddLnfiS6LrfYkggrlx9mJ1JBMgDtEMIQ78AsMkEScAhWrDsAmHT6pYr1bL5B1FMY3TZtTarykqgqeie1oOXYjZbI0RAQytPP3DqjB2JAh0653F+sVp4j01f6CGB7Muw2Dz+ULdydpSsupo38sR1gfRsPI6xuWNZa6caufiT5HrxNQpauY6inqSYh+oluM9d3HcubvLoIvkqEV1PBANXuOEP0h+8X8BrCy3zyGo5je9NAUe0Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:54:23 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:54:23 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 20 Jan 2026 17:52:52 +0900
Subject: [PATCH 3/6] scripts: generate_rust_analyzer: plumb crate-attrs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-ra-fix-v1-3-829e4e92818c@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::21) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: b699d8e3-7094-423a-8e9b-08de58018249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MS9BU2N5SkZHNnpBUmhic1FzZjBCVzk0dXA2bS9ZQjhDb1lDTkhsWDRKYkRP?=
 =?utf-8?B?a3FLRXgxVXVBZEJpakUvZVZVK2dlNVFsa1drcEtVQTZzRnZlQXZGNjIrU0pF?=
 =?utf-8?B?ekQ2S3FtSUI2aEFNMXBRMEdEMUFJZWJpZ2svM2FtbWJ4cWttYlZuRTQ1a3VD?=
 =?utf-8?B?ZXJYdG4rNk1nZk5zd3g2eXNmelFVZW9YNDdhcGFuTyt1cU5lMVU0UGZsRmhZ?=
 =?utf-8?B?b0F2QWNUaG1NbmxkbnBteTVCOHJodk1HZU5WTUJCejVwTzBTVXFOSnlJMWY5?=
 =?utf-8?B?U2lBZWw4UGUwSUVaYzNmZkwzbUVNcThQVzZHVWFhMnFlY0hEUGUzSEppbWtl?=
 =?utf-8?B?Sm1LOHlqLzVMTDZKdW1Kb1RTYWxHdFpyZVVVSHFxVVQ5b3l1Mzh0RXZjLzc2?=
 =?utf-8?B?M0lKNTMrdVFYYWVTb2pkbnI3am1ETjdLV3JpNlcwQ0hDc0VTQiswVytzVklv?=
 =?utf-8?B?S2lMTjJCeis3c3VBSnJ4U2JsUjlyNzRxTHBHRHI3N1hybi9GZEpxSFFwN0Y4?=
 =?utf-8?B?WkI4RjZyTVcyQ2JMZ1dzVWdmSzIxaUxJVmlvOUZnR3hScHpoUTZxL2JSVGc2?=
 =?utf-8?B?NTBVaWRwcjJJVXdmVjlUcVR4STBER0FTZjRvd0ttVEFpZnJDVThTbGM2dWhz?=
 =?utf-8?B?YzYxU3R0MHFCc3gweWkvc1p0YnVlemk1bjJCNEQwMG1TNjdqaE1uNDNFWDBC?=
 =?utf-8?B?eUxUMkIwS29CRHFmdHJ3RXEyeUY5MVNudWZDd1k1S2J0cVkzRm9RUktJZjZE?=
 =?utf-8?B?QnExcHczWko1UTI0TkZpa3Blak91NGhZMkVvWXhUL1UyUUNVWFI3Mm5XaEY0?=
 =?utf-8?B?T1JlZUZtOE9kODU5c0tlRDZvVklBZlZUVjh5bEtuZk85Wk5xamJhWk1IZlp3?=
 =?utf-8?B?RVRCSkNWV0lva29iVis3REhLTkpsbmFiVTFKOWRBY0tDUlVIM2hhTmV4Sjd4?=
 =?utf-8?B?Wm5UU2hkV3NTSEVFdXJpemVXN1NZM2dkOWN3cGxiOUp0VWRIUkNwSzFHWll2?=
 =?utf-8?B?VWg3cU5TcWFZUVNCa0c2STkyVTRjV1ZqQnlDY0dzMGl6Y0RJdUFwRU5BdTU1?=
 =?utf-8?B?ZXJ4NWxhWnhGeXZMMHZVTUlDN3dFMFQ5dnYzbk15VHRYVUJPdEZ5L3hiOWVV?=
 =?utf-8?B?OGNOUE5yU0xXRG4wNVlWVjVySXBHdnhHY1BGWlc4UjgxQ0FzYndDbVd3WjBP?=
 =?utf-8?B?bTJUUFRsRlp6VVNQc2h0ZHg0QXlQZm5MK043L09aUkw2N1d4U0ZobFRqcmRY?=
 =?utf-8?B?bDZrclNtd1UrSUwyT2xPOE1OZjVCeWMvclN5ZmZCeWxaREYyUDRlVFN4WVZh?=
 =?utf-8?B?M1hKcnV2Ty9lUjJXUjdpK1VQOE4rRXJuVDZiSFI2d3NSU0swblRHSC93Wjhl?=
 =?utf-8?B?bDhIMTlBTWR6U1lCanhrQlNiYWxpNVdZWVl4TmhCMDB6QjFIUlJvenA3a29W?=
 =?utf-8?B?VWp2M0pPdUU4YTFkVHB4TytOQVNIMzZtTDNKNlh5V001bHg0SEtiWnpmM2RW?=
 =?utf-8?B?MVZFb2F1NGNKVi9HMUhndjlpdXZYeERCVktQZ3BVa21vekh6dDRtQmxTWVFj?=
 =?utf-8?B?WnBTTHJ6Wkp0bjcrNGRpK1lqV25ySDh3RG42QnFMaXlBQzZiWFNFSzI4eXMx?=
 =?utf-8?B?aERoQ1pFQ3dSRG12VXNVck5KVEZiWFp5L25Tcjlqa0ZkNXZwNEpOc0Ura3RT?=
 =?utf-8?B?S09kSkpaMTJvQ0hJUEQ2ZENsWGo1WE5WRnJuQkdjRHVyNlBPSkMvT2p2T3lp?=
 =?utf-8?B?azc1MlNFblR1VWNpQk9hQlJKa2JwRWpDL3FOT1Mvb0g1TCtBREJvUFkzZE9n?=
 =?utf-8?B?OTJlY2hwQngyaFBLamg2cFU2WXFYQWZCaDZyMDZHVnJXZnVmRnpmaW9vdGwz?=
 =?utf-8?B?ckFBL0RBQWpRb095alJjV3g3YTBGc0Y5aE9JZnRhWkxrdVhzd0hsNUN4cEp2?=
 =?utf-8?B?Q1pqRmJoY1MzeUJ4ZW9rTTZ3WXhuOE5jbmMxYjRZZFdNZTJ4VExtdk5pek8w?=
 =?utf-8?B?KzBxSVlDWnZqLzE0bDRxZjQzWDFhVWFVZHRhc2Qwc2RraVFGeU5KRWRwdGpP?=
 =?utf-8?B?QldIUHBQLytzOE40OUNhaGl2UERHOUU5TUE0TEJNdlBoYkFuQk1jWFYvWVZk?=
 =?utf-8?B?RmJGdk5MRXU5WFJJL1NmaGRQeGloSDhVZkU1SHZ2aFdrOWZEWUE0b1JKSmxO?=
 =?utf-8?B?M2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHR6aG1RdzBVaHVrRXpWZi94Q0xUSGx5OHF4QkJTSVpOTWw0NHljZXFyekhU?=
 =?utf-8?B?Z1pBaG5ZT2pwWThXVldWb2ttT290SkF5Yzh0RGwvSW8xUGtLQkt0bkhhNDM4?=
 =?utf-8?B?bGF0a2l0RmNUSzUyWkoyZS95WW0yKzkydGdLUVNERWQzczJDQU5GTHhCbzJ4?=
 =?utf-8?B?SW1sY0NPejVTMU5qOWswQTVZMDF3WVpMSjQvSUcvek1SVDNEeUZ6dHdrTlRQ?=
 =?utf-8?B?bVRGMTUzM1M4Z3Bvd2FVZ3kzTHNZclhiSWJGZEg2N00rNG5WZGNjNXZsN21U?=
 =?utf-8?B?TG1zcytzMGN2dW5VZkUyaitKb0NWalh6Ry82R3NHSkl1TXBqV0Z2Q2p2L0ZI?=
 =?utf-8?B?VEdreUFmdmtoVGRmTzVIVjNtanhyb1AyQkZ2MnQrUnk4cGpJSWpuYVNuYU1Z?=
 =?utf-8?B?T3RXazhmNUhIektid3JQYm5YN3k4TWlZWGJLVlpETmFySWRlWm10UEJkbHh4?=
 =?utf-8?B?ZGpLa3JVSFlVYjI3YnVGL3dXUUFpNmExOEdTNERwbGU1VmJJaGJWZjRybTJx?=
 =?utf-8?B?K3R2RDdyZlQzQW8xRjRrVzRzdlZScGl0RXZzVjE4ZERLeGpSLzhnVGJra2F6?=
 =?utf-8?B?cm5QTzZyV0tIYTNVMFVDUzNINGp4SHkwWlNHb3JmM3VFTTEwaTNxQkgwc0Qv?=
 =?utf-8?B?WTFEUUJSRmE4Nm04WFMzT3pWV3pvTXpHUkNPTVJYS3F0RWRLcEUyRWNnOUdv?=
 =?utf-8?B?aS9zc2VFdDhCUFJ5RFAzOERRdlV3dXFHejBOWkZiMmQwVWlCdXVxUlprZCtW?=
 =?utf-8?B?aURodkNPQVoweTBWTUYrNjY0WDJEZHZDN3VLMnZRRWpuZkJSUDlYOWJQRG05?=
 =?utf-8?B?VTZSWHVrYWNacVk2SW5ZRFVaRE94N3BPMC8zVW1BeXpBYkp1bzhaZlU1TmYv?=
 =?utf-8?B?cnFPYk5FZnJTNEc0REdVRzdTbU8yR00zM3dFL0M4SnM3b2c5d3JWR2dXeW5T?=
 =?utf-8?B?VGRtdDQwZmQ5cGVuWGMzak9JYXcwUVhYdlNXTVZUQmZ3VnM1THFlc3JCREdr?=
 =?utf-8?B?SjZnU1lWc2pWVjdGUlhtSHg2V3FaN1Jkcm83c3ZkYmIvWDVGMWpmb1c1MU1L?=
 =?utf-8?B?dExuaERwTzVISXhhNWhzRGRUNmtCWURvZWdTbVMxVFVwWnNHYmpUcW8rUWpl?=
 =?utf-8?B?WnJmK2EvRzZrYXdsQVR6RmVsWm9LZFNLaVRqR1Jra3hIT1MweVJCNlFHN1A5?=
 =?utf-8?B?Mm85eUFRTWFSSVoxMTRiUW5wTVlBbVo4OUU5RWRuNmdRcVpLNk1tVXRxQ2xE?=
 =?utf-8?B?WVFsUjdYcUF6SVZRZ0tRZ3NJZHlLL05WeHcvSjFLVHBTclBtMWxHWElrcTJV?=
 =?utf-8?B?c2RBdzZuZnpRSW9MZXowMVh0NXVjVUcwUUZBNVJTU2JQa1MxMXpOVWZQdDlR?=
 =?utf-8?B?NTh4U0JoTEN2NFp6czNsdXUrYUhXaFpRZjh1dlBVd3dkVVVPUVA0NzhrK2xu?=
 =?utf-8?B?azc1TkxLVDJrSEpwbWowdjYwZlZXbytocmExbWJsNmlCVXpsQzc1c3JtTHlW?=
 =?utf-8?B?eHFzNnZINFVxYWp6Z2taZnhlN2g0ZC9hOTNURmlXTXFiSzdyUFNtSHVrUFJM?=
 =?utf-8?B?cTRXQVAvOW5ibS9pdU9SMGR1MmlBazhxbnRRczQvbU5ha0RXdXNqRmJNakNk?=
 =?utf-8?B?Yys4aU8zVGx1TkVKdmUrS1BtWFArSklWZnFFSTl6NDcwc2dGTGlnMW1HdEQ4?=
 =?utf-8?B?Sk5ZOGhQWTFGQ3pTY2Z6ZnkvYXRxL1dkK3NkSGxuOFZYRXlTL2dTR0pqc3NN?=
 =?utf-8?B?MUxtS1JROWtUTkl6UlZzeDFldVUwTEFvVkNxUmdya1dMeXNXRmI3RURFU01t?=
 =?utf-8?B?YW9hYUg2Vlh5bnN3NWIvc0FjTWtQT1VxL1lhZ3hNa3EvdEljQXFBVjRKcWNZ?=
 =?utf-8?B?TnpmZnFhdStsWWw1N1V4cmZhcld4VjdsOE5oaVE0eUsrblZLUWFiVWx3T3lj?=
 =?utf-8?B?cWd5SlNnaXVHbE5haHFnS1NhOSswbHpJa3Z3dTdYTnRWZ0pjVENXTk1nTU5y?=
 =?utf-8?B?a3IyWVFkeFl1Y2Uya05RaXhwMVlMWWZOaW9RcUdwa3pocEh4clIwYnhkVWhH?=
 =?utf-8?B?VkJqNGZSU3pmU0c5L3EyNzZtVmM1WEtDWE82dlcvSjd2TU1qOG8rTExSK1Jt?=
 =?utf-8?B?UnJ5WnIrS2RpcDVqMHpzblUraHBIV2hmRmhWOHJpNVBrSDdCSWdrQ1lhWVg1?=
 =?utf-8?B?dHl0enRnelhERlN5RS9XRzFKRC93eGlMUWluMWYzRlNpcXBvVXJhTmdzbG9s?=
 =?utf-8?B?UmxTSWJCOGhLSmNuajd6ZE0vMWx5SEl5TGJpZWFyZFdWNWs0bTVoYW9Eak9M?=
 =?utf-8?B?M3hraE5WWWluazIrYjBoT2xqc0tVaGRTZ2FsbjJhV1JodVNoZDdoSlVvekZy?=
 =?utf-8?Q?Bm/7UttXq6vduh7GZRk8nKikX7rsteczB+UFPo39OL8OG?=
X-MS-Exchange-AntiSpam-MessageData-1: SHxg7hShDWvCsA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b699d8e3-7094-423a-8e9b-08de58018249
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:54:23.7928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5QDiK3OE2eCU/L/D5P+oVkI/4LZ379jm3Pjk/tQbpVCw4AzdMr9NAi2Ob4ab1+cmpOsdNoN5i4ijdyGZ2kQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Add --crate-attrs argument to pass per-crate attributes.

The crate_attrs field was added to rust-analyzer in v0.3.2727 (~1.94.0)
and is silently ignored by older versions, so it's safe to add it.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/Makefile                     | 5 ++++-
 scripts/generate_rust_analyzer.py | 9 +++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 2238b0b69197..e6c5108ab625 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -84,9 +84,11 @@ proc_macro2-cfgs := \
     $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macro_span_location)
 
 # Stable since Rust 1.79.0: `feature(proc_macro_byte_character,proc_macro_c_str_literals)`.
+proc_macro2-crate-attrs := feature(proc_macro_byte_character,proc_macro_c_str_literals)
+
 proc_macro2-flags := \
     --cap-lints=allow \
-    -Zcrate-attr='feature(proc_macro_byte_character,proc_macro_c_str_literals)' \
+    -Zcrate-attr='$(proc_macro2-crate-attrs)' \
     $(call cfgs-to-flags,$(proc_macro2-cfgs))
 
 quote-cfgs := \
@@ -575,6 +577,7 @@ rust-analyzer:
 		--cfgs='syn=$(syn-cfgs)' \
 		--editions='core=$(core-edition)' \
 		--editions='quote=$(quote-edition)' \
+		--crate-attrs='proc_macro2=$(proc_macro2-crate-attrs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 17ed5546504b..e8c50812fb9f 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -11,6 +11,7 @@ import pathlib
 import subprocess
 import sys
 
+
 def args_single(args):
     result = {}
     for arg in args:
@@ -26,7 +27,7 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions):
+def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions, crate_attrs):
     # Generate the configuration list.
     generated_cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -42,6 +43,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions)
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
     crates_editions = args_single(editions)
+    crates_crate_attrs = args_crates_cfgs(crate_attrs)
 
     def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
         # Miguel Ojeda writes:
@@ -78,6 +80,8 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions)
             "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
             "cfg": cfg,
             "edition": edition,
+            # Crate attributes were introduced in 1.94.0 but older versions will silently ignore this.
+            "crate_attrs": crates_crate_attrs.get(display_name, []),
             "env": {
                 "RUST_MODFILE": "This is only for rust-analyzer"
             }
@@ -233,6 +237,7 @@ def main():
     parser.add_argument('--verbose', '-v', action='store_true')
     parser.add_argument('--cfgs', action='append', default=[])
     parser.add_argument('--editions', action='append', default=[])
+    parser.add_argument('--crate-attrs', action='append', default=[])
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
     parser.add_argument("sysroot", type=pathlib.Path)
@@ -246,7 +251,7 @@ def main():
     )
 
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.editions),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs),
         "sysroot": str(args.sysroot),
     }
 

-- 
2.52.0


