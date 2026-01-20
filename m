Return-Path: <linux-kbuild+bounces-10699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD98D3C34D
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 10:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0D0C6839A6
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 08:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618B63BC4C5;
	Tue, 20 Jan 2026 08:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UEqkEWut"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF0D3904D1;
	Tue, 20 Jan 2026 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899260; cv=fail; b=QPgg+2Jlw0516V/8k/fSDz6DNp7K5P8Ri/r/73NyQiyXH0rLYWG3dlgqoLSp4k73H8xXneBydYuubvH/B0Q+0pOpvYwCu21pEBnIOTzrtG8/isIrmM6Q9TT5n5u6a2NnLWe0CfLZAhVSNdT7mAx5KBdzcXEIeycM8x0PMl54pFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899260; c=relaxed/simple;
	bh=Jm4xRWanhYaHoB/BgqqwbBfhiZVQOJzfeLq8tXJJplM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yfcbthk0nq2CPPonRRcQ9fSMZTAxNRocsGOFvEjXb3lVK2UWIAt+jMfaQjyCW5vF9WxDT5eK6R/LypWqz48qXDI+LCW+NJ0hZ0hmDpCFXdIYosyKB+jXPOfXq3v3011xnSRBC3WzN7z1HKln6mALd7QzZkongtQ6AYVGcCIZqRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UEqkEWut; arc=fail smtp.client-ip=40.93.195.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POk79IU+I4sWbJ0TmosTlP+en7uccdYElLDimSljx70THfmQ5uZPQJdmXeUgUNHY6TXMvG1BZcGdr1SsXNdzNxemD1GeSomw8CW0NQZnX5PHVIpEqIHeN9R4qkELVnwca9qvM4zN1Z+gboWo0KrQlTUg4kETNpLAY0ujB25zWH9Q5GEqvBe5ehbSpEUjKp93/tt80gQ6Ogi1ayXNsHj+CG2+xDsg5R6qM0U/+esUcBRQAluEOwpGEHlliiH+V4nZa2qw2aiEUYF7WHDmp+2Xn4jfdksjcqd3RaH3enm29xL3Uc5ThqSa6q94UzrDkvvCsXqeDSq8nCJQ9CX8vnp1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD36LridDEbAtpLNNvwG/SGdXVmeP/305x2RdGJF66s=;
 b=tMp5NKHM2wN8SnM2QLDOncvG3Zh4OI0iE8C8LZDWF30a0fMxPn8HoN35103M4K2NEjprPcmigrrDKPRHoaPNRXn56avlMAn/lNREEp57odw45plK513iA43ZtasRodTajrb9ZA4ObfH6Ev/dnKdnpoo8ANT5pRe/ZbeSSZ9P4kL+4I/IIHzZoWadze8NPfRIfB5DiDch/EfZY7AOZvB1mJqgb0RoHPOHOiJs0NDegCBzhuAidWBSLUPfYiNON6XuY+CtrwoBsQnwyIIyQsRCk3/SP4bf1uV8jXcS6WfREPYpIXpZwHX7uE4nDrB6kb+YS42TV1ceMZICYwqkEaLeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD36LridDEbAtpLNNvwG/SGdXVmeP/305x2RdGJF66s=;
 b=UEqkEWutLvirvHEoNcEPc7dKe23m3OWlH3xtiAn4Vt6CNrg3KAckMTqgJ3sgjgJQpA8iImiulZEW408vHQeOdCst2ditifq4NI8+mYyMEb37SgsfNHoyIQpzFpjH5ZlqG7lCEZpY3e09Bu78jExuWouQDC6g3xh6ab06RKi2mvVVDjIyG5r9qRpcpnrbuxi/302kdOXKNqr5SXXEkhdi4rjKe6fjdbSQCSK/zhbGzDIAUIwtCijkkTrVyAMik5/8hN9tdf50FHvAXTOUXaXuzgR0wdthSX86KmIAsyeXfBCD/nNUkxRhSTO6kaeQo0PciSKz3ywwcaRgZIgBLhPVIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:54:16 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:54:15 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 20 Jan 2026 17:52:50 +0900
Subject: [PATCH 1/6] scripts: generate_rust_analyzer: rename cfg to
 generated_cfg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-ra-fix-v1-1-829e4e92818c@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: cf13c6a5-37c4-488b-6472-08de58017d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXhKQ2t5MTlqVGd4VTY1UWZMTURpMXFYUDhTNFpaNFc3ck9IeEdqME9MRHY0?=
 =?utf-8?B?Z2ZKc2ZxVzMrNDFZWlFJeTVMN2V4KytjZTdia3pkUVVnN1BIUUdMc3hFS2lj?=
 =?utf-8?B?dC91aFp4R1MrZFdCWlk3THpoMERacHd4QlhadGpoRUIxYkVJdUYvLzlpVGV5?=
 =?utf-8?B?V0QvVDI5aVB1RUcwYTJvMnF5UEZqUlFCWHlZWVJSZVhzeDBjNHpnKzl1Rmla?=
 =?utf-8?B?WEdocGpBa2tUZ3BZeGhjaWJHMmY2K01weUJKWWVxSVhCQUFnVjdoWFEzQ1hi?=
 =?utf-8?B?VGZoTng2cEhTaVBWcTVkYnNFeXZTYXpwNkFPUEdVdWNscktGcEJYcldhUkN4?=
 =?utf-8?B?WE12aHRtUTdQMlhFN1JBbDY1dHd4dUFtNUNtL2k4VUpIZjQrRG1PZlNoSFFj?=
 =?utf-8?B?SDh0dDVTdDFNazlFM2JFRG9VT3FyNVNhdTVhSTJUVTdzUmE4emNETlVHd3Zh?=
 =?utf-8?B?WEVCeFhwYVNqNDN0RThQQzV3YSthSHc0NTRIdVhZL3VHdnI3S3FBQUxyU2NN?=
 =?utf-8?B?QXJoZUZPOUlRZkc1ZFYzT0V3S2JIc1UwNDl4WE80OU9EY29KOHpXZXZjK05M?=
 =?utf-8?B?SDFPME54SHRpOExnQ1VjM3d6TmxtR0RSL09kQi9VTVJkM1ZhcDFoZFRyMGtj?=
 =?utf-8?B?RjVmMlBKR3loMVpLNDhlZi9XRXA1dGNvZEJwanZLUTRwODhwNFhiWWRpbGQ5?=
 =?utf-8?B?K0o0U0lGZnBqbVlkekRFY29VTXlpeHM0c0FXK0xlVDVXUHhhSUdYWmdhR3dS?=
 =?utf-8?B?NFA4R1FMWVlMTjMrZjdXNU8ySWh5TU5YVVdGKzkvNzBzOXlBbHB4VmZCMitq?=
 =?utf-8?B?cG1FQXdCRXlMQ0Y1Zk44cmJIU3p0ZEliNDZ3VEp5SWJVcm0wSlA5aHA2dWh3?=
 =?utf-8?B?ZkFodDhqNXFodVZ4K2FtVUVhNm42azdPVmNvYmdDMDkzcTd3RFBmd205SmNs?=
 =?utf-8?B?VnpMOUlydzJLd2FXMXZPeGx6NHFvUnN1TmFrbkV6THNkRC9RVmVoVVVLV1ll?=
 =?utf-8?B?TlZmbkZZcDlubVZ4bEFCZ2FJVldmQmtZWGx2azlRRmhhcHh0bVl2UlQrYm82?=
 =?utf-8?B?S2VIb2psU25yajE3Y3Q2TzBvNU9IUDVrak5iQU9MQUFNMnN1eUdRTzJiaVJJ?=
 =?utf-8?B?R0Qvd1Y2RloxMGxFQzJ3UHNoWUI5dldYTWlYODljeVRwTGRRaHl1QVVDeTBh?=
 =?utf-8?B?Z1p4OFh2RGlicGdHMDdnajRxVkNEelpxVzVwN21uZDc5RndINnRER2Y0cmZx?=
 =?utf-8?B?VmJlbWliT0Z4bTJ5S1BpdzVDdDBoNS80c3d6S24vblU5U2RZVXZRNUlGZ1dC?=
 =?utf-8?B?SldpNERQUjhWOHRqVkVpTVRrdkNLbGR2NkdLTjJNcW40MGdNajJHZytJc1Vn?=
 =?utf-8?B?ZmNzZFg4WDNGMHVUdDhINm5MMU1XVE43WC8zZkRQR2EzbDlDZ0kyVjdsd1JQ?=
 =?utf-8?B?aDNGMkNQd01rM1krMXk2YmxoOXlWY3JmZk5MSTV2OXBWRUs0V2QrL08ySGVq?=
 =?utf-8?B?MnRCZGpRRG1lakhqS1FiL3VsL3lIVDZaRllqV3hHSllTTmt6ckc1aTR0Yi81?=
 =?utf-8?B?djF6d1VGa3F6djlmWjVGUHhwdnB2dW5nNVJ1WFI3cU5JQ3A1VC9sblJ4ZmVN?=
 =?utf-8?B?RTlwcmdzSno0NURaTFlJUDJxOHUxcGoycmd5Sk0xeGZqcnVmM2VWTk84Sjky?=
 =?utf-8?B?K2liVnI2bVJVZ0lGckx1YnlpVURQelQ1Mkk0MjNlT1B2VTlYYnNPeGlmS3hn?=
 =?utf-8?B?c2Y1QVorYWlxZXBBYU9YQzRPVnJtSStRZ3k1Tmk3TGg5M0dVS2FQMCt5Y01M?=
 =?utf-8?B?MVdWM1ptZDhPalhvN0RLdk5LMGx0TEtRYlQ4ejEvRlNTUnN0RnRBWFU4NG56?=
 =?utf-8?B?SUFJbE1YSFNLaDZpaUFyOGphOFJ1OTdjS0hIQjE5UjFMdVJwU1RtN2R2VWlV?=
 =?utf-8?B?dExZQVJURzZOeVZHMzF1R09LS1pGRDI0Um9pejJRYzFycmg3YkZHaW0xa1hr?=
 =?utf-8?B?c2NMeWpob1FPZC9kcUFrOE5LL1VYc1RDSHJ1c2RCSEJJTnJVb3R2Q1VaaUxE?=
 =?utf-8?B?Tlp1V1h2emJwd3ZDSkZGc1RhWHhUTDN1clUyRnNOajc1Y2taTXR3UHVLWDVD?=
 =?utf-8?B?Nk5JZ2dqU3dzczZYK1FIOEJWM2hYU3N5YVc0ZktzbFd4VVpsdDlnemhCTDRZ?=
 =?utf-8?B?SlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2Q1dnF2eHdCZVBsT0NrNXFFbzRVTTZGTExtZUpDQ0lZOGNjdjBrWko3YmZv?=
 =?utf-8?B?V3VLamdIQVdxODFlS3hwUVk3Sk8rTDRpV0M5em5QbzltZ2tFRzYxZkQyTnFw?=
 =?utf-8?B?R3JNMVVLa2lzaGFDVE1xaG02c3ZvZWNSOXcyeVdvSVVqVllxWWxsM0ZyNk9P?=
 =?utf-8?B?OVc3N2ZTTE1yeis4MnYyK2NaVUEyNVNJVzBRTWxqWHFRY2w0NFdPNHh3cTNs?=
 =?utf-8?B?cFV5OXhkeE84SkxhNTVhKzhvaUd0ek9TazBiR1ZsK0Evdlh4VnhMWXluMyt4?=
 =?utf-8?B?UzJsRTd6dCt2ZU5wRHBqdlIzcmp5SW9QOENSYUZERWx2M0dMVUI1eGxwQWVl?=
 =?utf-8?B?L0tSMCs3TjBRL1RjMFhsTzZESER2bWx2ZC8xK0pHVGw5MW4vQ3lsaUlXV3VU?=
 =?utf-8?B?QmQ3STNKeTVmc3lrMzQxVlJlUTRNWEY0bW00cjU5bHJQNjV3Q21OUk1tM3hV?=
 =?utf-8?B?V0lycHNVWTBvUWhpNEhMS0pLekV0MXVqV3hTbTAxOVJRamNLc0crVUhHY3ha?=
 =?utf-8?B?a25WVDQvdk5sSXNHYTlpUnVrUFJqZ3JFdHp0ZkF1VXl6SGsvT0J1dzYzR0Fy?=
 =?utf-8?B?U1BFOGQ5cVBuenRsM0ViU0RJc2RYeTB3WUc3eUQ3am5YbUVIb3dTaFp2bStp?=
 =?utf-8?B?UTJsNkFSWjJ2WXMrU09oejVnWUdGU1NxanZiR3BkdFJuQmZjclNVRHNWdFEr?=
 =?utf-8?B?K05GMXFqQmtYQzc5Z0VVUGpyT3BNa0RqbENZVEtrM0xaR1lKR29tVjBpM0Zw?=
 =?utf-8?B?Q1AxOVkvemY1M0xzRklZYloyZGtXRDFwYUIzUjFFS2tZdnJvb0x4S0hGN3ZK?=
 =?utf-8?B?aFhicVNsZE9YTHlGSmZjRVAyUmRFMXhUY3Jhd3llZGdRRTg1eFpMQ05Jbnl5?=
 =?utf-8?B?RWdUVy9vT3J6SW5nMzhSdHFiZXdjU0ZRcll0bVRjM3owNHRxR1pQaTNrWk8v?=
 =?utf-8?B?N3BhTGVNZXROcHR0VGt5RTFGU3RBV2FBVzJETk5hMExSV2dSdmRlUm1OeHdr?=
 =?utf-8?B?WEp6dFNxKytFMVNqZGFrR1hqZDk5RTFIWXlOVjhrYkVSdEFDNDdWREEyUnRp?=
 =?utf-8?B?bmtFMFdwaVE1R1pOTWdRMm5xajZWa3dvVGpzVlhFcVk2YWV0eWZGd2VheEhm?=
 =?utf-8?B?K3J2eHhlQml5Zjh2K0hZUG5NNWZFTHZvT3dQUEtUTy9NbHMxMmVNVUYzMDFJ?=
 =?utf-8?B?Qk50QWs1UXM5OHliU1ppUzZrMWhaRzFFYTA5VDhNbENVbEJCK0VjYzdPL044?=
 =?utf-8?B?WlRQVzRkSjY1bmtCY01raXlUSjRiVjBkNTZSZmJkc0lRbUNwTWRpQ1ZSdFNq?=
 =?utf-8?B?ZHVNUUpYSHluZFkxZzlaWk5PMnRsalhEcC94UTBIVTF4WmVCZlJGcWJscnZ5?=
 =?utf-8?B?SGc0TElDaDdPSXdjZjlEZlhqTTRJcmRzNkk4SVVZblZpNVZaWHV5ZXR5MGR3?=
 =?utf-8?B?b3BqSDJCaTg5aW4wT1NOd28wU2lndTlxQlRuVFBRWHNtUjNsWnFWQW5FTWZF?=
 =?utf-8?B?cEplQjFIRFVyUE11cjlGaEJFUXpEbXRQNzRkYnZwVFQ3UmhmVUNUYThjU2JP?=
 =?utf-8?B?bzhIWGdoNXhQM0dUdkxQZ1Q3dm1vcEg2cnc3L1hub0N1UTh3S25rQU5zREFB?=
 =?utf-8?B?RVhCUEhYekRzSWQ5Q05Qcmd1SlRSRDRyTzZlcVhGSFEvNlZtY1NqV0hOZkJa?=
 =?utf-8?B?TlYxVERYeXN5K29ZYTEram8rL1lxYUlQOW5PRzJJYVJQam1SaVdUcWp3NEhy?=
 =?utf-8?B?R2tMNWZlZGMzN2dtTHdmM1BGOXdkR09mMHdwT0poYXcvSnJWUTJGRG8wcmhW?=
 =?utf-8?B?OGRlZU1KRUpmaDRVUkJ6M3pQU3U0UTJldXRDWkFiWGt4WkZsb3lvTEkvZmRB?=
 =?utf-8?B?K1Z5MjcxYXJqcXJaU2hTaVdPZ2p6aUx2U1VrbHp3K1NocUdIalRjRGNHRzRv?=
 =?utf-8?B?YlFqTWhPamdJZXpsYnIwZzVJU3JWTUNCVkhkeUZDTXZ5U2pqeVpBelRSQlgr?=
 =?utf-8?B?aGlZcWlpYUdmWDkzRDVMUDFHdTN1NGMzeXJzMytUYjJxek0zeW1hZS9vbWY1?=
 =?utf-8?B?S0NWRWJiMFlxQ2dMcmQyUms3dUhWd0dmWDFycUVuRSt3eStjZVB2MHBMTkNi?=
 =?utf-8?B?bzZpNmUvcTdaQXljb0V0OU5EUzlrbGtqVnR4YmJMd0RJeHJGbXNkaG1xc0w4?=
 =?utf-8?B?KytvbUdpMHl2Sm8zVnBXSnZOYWl1ZU9UWWowVFJYcDF1MFZtbzlxTzdkT3JO?=
 =?utf-8?B?KzNyM3RneUtFNnBxYzcvMFZLTzFQVDQrMnFzc09QdFhzSURrdDBQZ20waXlB?=
 =?utf-8?B?WXJDa2VzOERzM3NBcmxRUmRjTFVsVHlOWm1WMjlicEk0YUNUdFJxdHhvay9M?=
 =?utf-8?Q?/+U9+WW/FHgVEISP9NrMOz/AWOJEXO/SXkPa105FA7CUi?=
X-MS-Exchange-AntiSpam-MessageData-1: BMXP4ZtYmzHLlQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf13c6a5-37c4-488b-6472-08de58017d91
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:54:15.8725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSnkS7a6DihPR08/seqF9Zow2tqAd/lmO2/HfPnYmNzXfIxDwOvqmUAh679lzvYcicd8BpdsOwxHyZWCUl6ZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

This variable is for the cfg from generated files. It's also easy to
confuse with the `cfg` parameter in append_crate(), so rename it.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 scripts/generate_rust_analyzer.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 3b645da90092..c188d1f1fd5b 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -21,12 +21,12 @@ def args_crates_cfgs(cfgs):
 
 def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edition):
     # Generate the configuration list.
-    cfg = []
+    generated_cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
         for line in fd:
             line = line.replace("--cfg=", "")
             line = line.replace("\n", "")
-            cfg.append(line)
+            generated_cfg.append(line)
 
     # Now fill the crates list -- dependencies need to come first.
     #
@@ -173,7 +173,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             display_name,
             srctree / "rust"/ display_name / "lib.rs",
             deps,
-            cfg=cfg,
+            cfg=generated_cfg,
         )
         crates[-1]["env"]["OBJTREE"] = str(objtree.resolve(True))
         crates[-1]["source"] = {
@@ -215,7 +215,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
                 name,
                 path,
                 ["core", "kernel"],
-                cfg=cfg,
+                cfg=generated_cfg,
             )
 
     return crates

-- 
2.52.0


