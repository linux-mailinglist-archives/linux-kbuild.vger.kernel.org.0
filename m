Return-Path: <linux-kbuild+bounces-10702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27078D3C325
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 10:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7923A600015
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 08:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02FE3C009A;
	Tue, 20 Jan 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O8r7c7FW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8D63BFE40;
	Tue, 20 Jan 2026 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899275; cv=fail; b=aVaZBVbHAN5JY0PZ0H4aMJr2kLKlhz2R8pSG5NCBKUAxXvAyuq3cTTELFP6eTrpJYOTW0eMWldD4DxQK9ulCXdtVXdg+XAyNA/LqKNBinyJFQu8QANPnzH8IxYJrCUMRJCX4+xWTxbqEOmqsdEuRk83qzOm542+QURG+TSZOxWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899275; c=relaxed/simple;
	bh=gfGaNeOQG3Cror3bccgSEkqLTtoR4GhOZCbhRZ8RxM4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZSD/7OwnACMs70HhLg6kvWnjIj+us8b5Y18eoGBQ4HXgEckI5ME2AnqtNuIIknELPpyzFytlqe7JZFv31rLFxHucQbrZa+2z1qg9kSFfnWiST1p9XpjUr1jcfIfFuxEczoJz4TsBzkLRhu0OfxF1maesY81QAXbTjchcDX1qvOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O8r7c7FW; arc=fail smtp.client-ip=52.101.53.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZT3ExPD1H3mR557lglKhc/uYroEkI5TlWBn8WNnAPzDW+N7F3xi4Nyb9ScHV/siZGI0/9/fJ1kwax/1nSquc5J19PpOB4s4MvcqMT+XLze2s1HOrnPA1hOeOZoTJuTaQHVIkolBraU9jmblz+9GVffYrhhQCnysftlubP/4r/wOoPYVVT1+44jXi/GUUMFrLPVFW2Agq0v2VFgW6I9G3PiX0InJJp1/XVXhEQhTdeaG5qY3f1RHZ6MUmhhdDsfOQTN+3iyipIuGS/qwXzlWnsag6vxv5Uft0a3qS3IJj3Z7B2RrrHdLkyPFzyfi34K3kAXmxcSILoDOo3+jsj3+Qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhYb11h1JlypBJXEyIC7RiHjRhM1T7Y/NJuAc3Kp9Xw=;
 b=FHeHY1dvdVRBiW3UckLSMlHKRM6vlirUW2/GCLSpzBPawynNXfIGjlvLob00cX6FUvI7V7+UZH9evGAMrbq2BNlvJEmNmn7exmq3zMqO/R6PezyhaQ+TKrlFBvUhZN66+gF3FGVrDLUqdKZ+Ojp/LGwOpLUPcsOIrybcrVcQLWmhzeVdS8ZmKyk1zZKij4wenO7Ai4XxNoWFFvCsoFleWyTPi8A59r512CqIeWWHbZFLz4z8Pz0Tgq/36sssCYvmK8rZ4y2iQVncxKouiad20FDRroaZT7z2aSeJn0v0kEclCMBRA+/L8oI43P1aUfIppx9cQti1du5P1Hj/ynH+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhYb11h1JlypBJXEyIC7RiHjRhM1T7Y/NJuAc3Kp9Xw=;
 b=O8r7c7FW5w/w2AeM0JUTLIH9ZGYC9J6HoRGM1NYv0gDvaFyowTgzNkLCup1ge4+4RMeIk9k3GUL3ugCeGhMnI3/YYphDradFWe2RlvnOxGQyX1szZWP/3u22ZK9y1E00MDw/6nXN7GHyu5YJuI33NBlSmM3Nj++dwvf7q5ng5ZPo2xilkwYbA0iGQ2lF1hiVRkDkib7OKZ+nc2s9piOazUWuL2/mmxa7IhLf9PhJhk/WxzQAJaWerINUGXtGv/Ye3sT0et/9bZz7beE+CHq+afEYczoBoESqhGPV4PMxcVL4q2SJ207e3USBbdJLJpWF3h16cxz/uQh6TI8ccKi31w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:54:27 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:54:27 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 20 Jan 2026 17:52:53 +0900
Subject: [PATCH 4/6] scripts: generate_rust_analyzer: plumb common
 crate-attrs for non-host crates
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-ra-fix-v1-4-829e4e92818c@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc8cc4f-6e7e-4fa5-8ab4-08de580184b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bCtZaXBWMmNYekY4VlNrczVvWnY5ZE5ZODYycTlHQjIxSG5kbklRbDZ5UnBW?=
 =?utf-8?B?clpadSs1VnIrTWxzZTR3cTlhN1FXZjlvaW40Qll0TjlpQndrdkpDWDRvVXJj?=
 =?utf-8?B?bTcxWHdHOFFHakVHdU96cGY0Nk5PTXozVm11aXpQRHVGb2s5djUvRGRjZ1Zp?=
 =?utf-8?B?TEw3MitsSU9ncjN0d0JpRE5Gd3NqbmszeldQSC9YV0xEMGg0NHphMzE3QnQr?=
 =?utf-8?B?MDlwQlMvVzRCRG50MFJ4blJkMHZPOEdyQytsbHF1STJkUzVjcTNrem1oYXNK?=
 =?utf-8?B?aURBUTRxbXZuaVZEVmExd2RuNGR1YzVCQkhGTHBUZ3RGQ0drbUpqci9MbGZP?=
 =?utf-8?B?TjNjb3dJWjh1ZFlyQTZyUFBCa0NVQ1BhNlNBQ2w5UGlsdHpTczNwT1hEWFRm?=
 =?utf-8?B?dW5yTUs1Mm9mUzZCZllJM2hFVHVRWmhLTXBiazN0MEF4YWJ1R0FQTFl6dmVv?=
 =?utf-8?B?NlorTWRGMnFMaFp6cjFkWFBjWVNwQ2FpM3FsRXBBenNVTjJ2VEQyMXlYOEZp?=
 =?utf-8?B?MGEydHFYcHZGNkwvTmJsQWtpQUNDMWw1TnJCTXNYM2kzcjEwbEZWQnBITDZP?=
 =?utf-8?B?amNrSVM1dExub2w0ZGFvUjBOeXBNVDVuS2FjNkhqbCt6bEVMdlhCeXZSK1R6?=
 =?utf-8?B?YkhTUmxRRDh5Wmw2eTYwZC94NU9iSmtETFd0SzR4ZFJOc24rUmFFQXIxU3Qv?=
 =?utf-8?B?MG9xcVVHMjk3RllRWmg0aXRVK0lzNloweXpVYlBhMlBpbno5SjBwSWVBWUpG?=
 =?utf-8?B?c0o0ZDhiUlZLdURvUFVpZ2dNR0JPV1JodC9JNjBteDI2SGJCUXZqK2VVS0lI?=
 =?utf-8?B?MjRDWDFRNmQ1MGxtUzZ5QW5rdjgwbjdEcUJtRFA2ZW1Baldaay9Yd082aWV2?=
 =?utf-8?B?Mm5LTlpRQlNoR2FaWFBhVXlyam5ZYm5UZ011Q0Q5WCtUWTk3L1NnREMxcDlW?=
 =?utf-8?B?Yk5vUHhveWV0VG5GUUg2cDM2K0dVTktXTSs2a2lyNUsvNllncmlLUUd6RWV4?=
 =?utf-8?B?TlJDU25XTld2VFZUQUU1Y0d4R1BWcTZySDJjTkZMcDhueTZxa0dkKzk0REJS?=
 =?utf-8?B?SnR5TmFYYVlEVWgvSnRnREV5ZmR6cTFLcG4rUVhHZzZDWUNPV2xTTzdUbnVU?=
 =?utf-8?B?SHRHdUF5K1RQRlJIUlAwVi9EQXpMKzUvWC8xMHNmblNydGZ5YTFVaUdNY1ZV?=
 =?utf-8?B?RS9IVXVFVFFXdnkwZEQxc3FtdHhWVWF5eEVNTzN3VWJLcFFhTkdHMitqdERi?=
 =?utf-8?B?ZllLNEIyWWwzVnJVQm9YZnZORUUyYklTVDJNM0I0L1RCOWJVYlcwbWpkZmVF?=
 =?utf-8?B?SjJtbFh5aGtxRUdwd05nUTVqWXFySmhjT3BlZlRzUXIvTG1IMFh3UGVibGxk?=
 =?utf-8?B?R1pxeGZpWE1qWFNyZXp0aXpqNzlZOE9ybHFGbUkvYTJFc3Z2MERWWldsc3R6?=
 =?utf-8?B?cU83OTZrRFhXQXRJcTNzY1lWeUJVbjVWOSsyOFNWV3NyUzJrNXRSaGs5YkFo?=
 =?utf-8?B?M0Y3dVlBd1Q5VHIzYjhFWVBTaXJIVE9ITWlRUmo2YkUxRDY1dXI5N1ZiQmtu?=
 =?utf-8?B?M1h2SnlYRDMxOW9qNGQ0NDVVYXZnSmpuQ3BDZDF6cmYxRmx5N1lTL01UZzFp?=
 =?utf-8?B?b2V6ZEhFK2lDdUxvbmgrVmxLdzRpZklJdjBKZjMxN2NpaWlZK1B3Y1JNcW1r?=
 =?utf-8?B?MHh6M1dFY2xxT1FxMjhUdHI5bkM3d1ZQTVVHSk9pSG5pN0FEc05ZRUhnSVRP?=
 =?utf-8?B?NjhUMUJmM2JMbTEyLzRwYUhwSExpTWFrMzg3ejUySEFvc2ZmOGgvNVN3ZW1w?=
 =?utf-8?B?VGdQUmo3SW0zTTRhbDQxcnJpUmhSenRUUU5lT1pQQ2hRNUh5cjZRSUd1eGZR?=
 =?utf-8?B?ZGUrRWJrZTlIOVQxOFp5MG9CZUxMVC8xNi9mRzAxcmVBUWs0WFF4NFp5UDY4?=
 =?utf-8?B?UkFTMHNJayt1cjJZWjZIUkFxQVNaOGhCODlncFVIb0FidjVXTnMzTjNqMHZx?=
 =?utf-8?B?RWJ2RGhibTJqN1NQd0cxZks5Qmx5SVhtZ3BRbHNaczR3d3dhempZUGxOc2o2?=
 =?utf-8?B?UTdHZ2Y4anBvVTJPb0wzcU1zQjkrZTR5VEZWUm5DSzhTU21MYmRuWk1EdzU1?=
 =?utf-8?B?UGl2aDBkaktxOW5tVjF3WnVTUzdpUW40OElIRDJ5S09VSURBa3ZDOVNPT21u?=
 =?utf-8?Q?cuP+1YmGllc3ZxQOb1zf3wI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkdhaW5mV25Ta0wwRm54b3ZWaW1HRkwzMGxPbkxFQWNlVnR1NWxSS21PZ0xH?=
 =?utf-8?B?R3lNdnNrdlVFL2lnVXR5NHlpUmx0elNpTzdEeFpaZjhnZ0VPb1lYMFowQjNH?=
 =?utf-8?B?ZDViYjlsTlpPbW1ubzlqd0Q0S0FXcWlNa3ZJQk53emdOd0ZpLzJJOU83ckRY?=
 =?utf-8?B?TXllVFJpTWxtWnlHY3d5VVUxeG0zMjljK08xdlVhb1BKbXhyb2Mxc080Qk01?=
 =?utf-8?B?TjRqc1NlaXIrT09kNTVHeVZIV3RyUUlyU25oN1FQbUFqcWU2ZEtpWXZiVS9s?=
 =?utf-8?B?REwrSUQrdVdzNVczbldUUHVreXFkdDg4elF3VWdvcXQvMXZNY2x5Nm1lZTBr?=
 =?utf-8?B?WVR1MldkdUF6T0F2MjVmNXh5VGJQbkgwWG43aUJibGpRejZLbFBpUmdRMnpk?=
 =?utf-8?B?MHp0a0VlTjZXck9CV0diYk54WXFOWnJDZnZjM25oUzRzRWlyL1Rzb2txbXVo?=
 =?utf-8?B?L0pSR0lsa3A1cUg4d3k2blBMQlJqbTFtMW9HZldwUy9BRGlHb2dUNXIwWVVL?=
 =?utf-8?B?NzZWb1dRc3I1MlgwYlNMZk13a0JrUldqekl5SlhiY1Fjcmd3Yk9CR1VKZVpO?=
 =?utf-8?B?NWcrak5wQmxjNzd1a1JXV0JUMWhwd1paMmlHWWt3ZXRwc1NTZXltcnV0TFdY?=
 =?utf-8?B?S3VLbFNLb2htbEp4MThxVDUxQTBZNGdxRHhhZHo0VW41dDVYYkg5Zmg1U0Rp?=
 =?utf-8?B?bnI5dXZWVStMY2JYYVllRWR1cmpmVE01N05hbCtrKy9ZRnRsZ2lha1RZTkJJ?=
 =?utf-8?B?cjlBU044VzY5KzlDOHlNb0NDSFRINkpnUnpKSGxvRTA0MEFjdVlNcDNLNCtD?=
 =?utf-8?B?S25lQm9iQXFJS1NXOVZYeE52ZmF3bllSSElRSmZmaVFHbmdtdUxrMHliQjZw?=
 =?utf-8?B?YnlTM2c5dlhYdmZCRGxITjk0MmdTTDIzZVc4RTViNFkwUEVLYUU1RVVkc1JB?=
 =?utf-8?B?bENLODVHKy85bnVLOEJUUG1KVHlrSnFLME5WVnU1NDNZMkVpWGlrQmlpbHZz?=
 =?utf-8?B?Q1MrUGdYM2lENHIwdUFZWkhjZGJNRDhDNzJ6NzJhNXlYS3BMQkwvaE5YUTEv?=
 =?utf-8?B?U2paWmxnNEc3QTcxWEFZZ3BUNlVFOVdJZVc5MUUwUUdUYUtrdWtKa3pMT0tK?=
 =?utf-8?B?QVlrYm01THhPaDN3U2NzYjZXTWpCQ0tnN3lEV05GK0ZUc3UyZGcxVkcwWHJZ?=
 =?utf-8?B?a2FDanFlbVVSQWdnZC9IemJVNEh6Z2RDTzBlTmJiZ3hZR3pNbGVOQlp0cDdR?=
 =?utf-8?B?T3JuMHhwRWw5a1R0VWVGa3p3YUZUQ2s3T1JqRk1ha2JQTUo0ckxsY2xlSHB5?=
 =?utf-8?B?R0t2bWRjNzAxd21BejVrUzdkdDRueExmbXpXUlNGN2RUeCtPQ0tVMUkybU9B?=
 =?utf-8?B?MGFUUk0zczBScDVYamptZVBMQlhCTkFQcTlHSk5RdWFndUNVZ0NDS2U5ektC?=
 =?utf-8?B?N01jaXB2M2V6bFQycWNUQVoyVzZDTkM2aWdkR01yUkplSk9NZi9LcHQ2VGhj?=
 =?utf-8?B?UE1ISGw2Y2w2MFdlSEdkZVR1bGV2d1g3R3BIQitxbkpEcEUwZWZmVHpkMDlN?=
 =?utf-8?B?RGh3M3l6aG5IcXlaengrWitpWGc1NGp2M0pKMXQrOUs4dVdIRk1URjVKOGVp?=
 =?utf-8?B?M1gxb3lLTGt3azJEbzllU0k5OTRZMndhSWVQSHpZZWlwcnVndUJSVHEwOEQ5?=
 =?utf-8?B?TFlZWGwwSDF2aWxCa0RYRkJGSk8wQU13Wks0QXQxZk9GTHNQYXFDQmFSOUNX?=
 =?utf-8?B?RmgwRlVZdThqTWxoODVFU0RoZFFPeEllWm1vZGlNeVpvbkhhOE5uS0RidTN4?=
 =?utf-8?B?dHpXTHZJY2d0ZzMrV0t4dWF1bHNFdnJiT1loR082ajVwaXVaS1dIWEQvbHpG?=
 =?utf-8?B?SlppcDU1S0FEbnlsdXVGVFZiN3FQUkg0eDU0am4rQktjN01OZnhtYVhWOUNN?=
 =?utf-8?B?T2UwUDRzNWxmb2lubCtvd0VWSFhTbnFpVUFpWE1ETzZ5LzhTWVlYSjREMWRx?=
 =?utf-8?B?UFl5S3lROG9WTEdHcmpYRmhzQkF1Ym0xeVVxVCtPTDZNMVdTbm5TUlNtd2ZL?=
 =?utf-8?B?anZjakIvL1lGZUxyRUVURS8yMjVUSnQ5ZmZFNVh3TVBrWVJIMXhYWnhpaGZy?=
 =?utf-8?B?Q0E0RmpWK3JkVUk0cFh3Wnp1TDFqM2ZrMTZ4VWd6a25mbVIxd0txbHVnU093?=
 =?utf-8?B?UDJuSDRZTmR0ems3V0c3cE9RbkZTQUxYcjVsaUhsT3NBSTdiOWMxMXh0Q0NU?=
 =?utf-8?B?cjQ0STl2RmlScnRSVUNnb1VtNUN6c0Y5VjNZWFA1S2xwZ2xhOHRJUVBZeTQ2?=
 =?utf-8?B?M3V4RWRCY2J4UWp2bHJTWDgvMHd4ZnR5OUVOZzNROFp1ZUR2YWZjS1hNNkZN?=
 =?utf-8?Q?ClNPx8YCBtKJRAGQlmuHKbKJSN5w4owfmq6952dZL91xr?=
X-MS-Exchange-AntiSpam-MessageData-1: cxxkcF6jsRd0cA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc8cc4f-6e7e-4fa5-8ab4-08de580184b3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:54:27.8612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iAjbjb2yVMbwBUfNWyynMLiIW22N4keNquKxlVM6reqxbgskP4vx5uO2RyiZGC8im3jdmt8R9qH1BL3RGroZ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Add --common-crate-attrs argument to specify crate attributes that
apply to all non-host crates. This means no_std will be specified where it
should be, for example.

Proc macro and libraries used by proc macro crates run on the host and
do not get this set of common crate-attrs. This mirrors
rust_procmacrolibrary in the build system.

Create scripts/Makefile.rust to hold shared Rust definitions.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/Makefile                     |  3 +++
 scripts/Makefile.build            | 14 +-------------
 scripts/Makefile.rust             | 20 ++++++++++++++++++++
 scripts/generate_rust_analyzer.py | 20 +++++++++++++++-----
 4 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index e6c5108ab625..750db2885ba2 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+include $(srctree)/scripts/Makefile.rust
+
 # Where to place rustdoc generated documentation
 rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 
@@ -578,6 +580,7 @@ rust-analyzer:
 		--editions='core=$(core-edition)' \
 		--editions='quote=$(quote-edition)' \
 		--crate-attrs='proc_macro2=$(proc_macro2-crate-attrs)' \
+		--common-crate-attrs='$(rust_common_crate_attrs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0c838c467c76..e9af8a11f2dc 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -34,6 +34,7 @@ subdir-ccflags-y :=
 
 include $(srctree)/scripts/Kbuild.include
 include $(srctree)/scripts/Makefile.compiler
+include $(srctree)/scripts/Makefile.rust
 include $(kbuild-file)
 include $(srctree)/scripts/Makefile.lib
 
@@ -306,19 +307,6 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-# The features in this list are the ones allowed for non-`rust/` code.
-#
-#   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
-#   - Stable since Rust 1.82.0: `feature(asm_const)`,
-#     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
-#   - Stable since Rust 1.87.0: `feature(asm_goto)`.
-#   - Expected to become stable: `feature(arbitrary_self_types)`.
-#   - To be determined: `feature(used_with_arg)`.
-#
-# Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
-# the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
-
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
new file mode 100644
index 000000000000..d96662d1ac17
--- /dev/null
+++ b/scripts/Makefile.rust
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+# ==========================================================================
+# Rust shared definitions
+# ==========================================================================
+
+# The features in this list are the ones allowed for non-`rust/` code.
+#
+#   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
+#   - Stable since Rust 1.82.0: `feature(asm_const)`,
+#     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
+#   - Stable since Rust 1.87.0: `feature(asm_goto)`.
+#   - Expected to become stable: `feature(arbitrary_self_types)`.
+#   - To be determined: `feature(used_with_arg)`.
+#
+# Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
+# the unstable features in use.
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+
+# Common crate attrs for non-host, non-sysroot crates.
+rust_common_crate_attrs := no_std feature($(rust_allowed_features))
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index e8c50812fb9f..0d93e8a8e4bd 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -27,7 +27,7 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions, crate_attrs):
+def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions, crate_attrs, common_crate_attrs):
     # Generate the configuration list.
     generated_cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -45,7 +45,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
     crates_editions = args_single(editions)
     crates_crate_attrs = args_crates_cfgs(crate_attrs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
+    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False, is_proc_macro_library=False):
         # Miguel Ojeda writes:
         #
         # > ... in principle even the sysroot crates may have different
@@ -72,6 +72,11 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
         # assumption if future edition moves span multiple rust versions.
         edition = crates_editions.get(display_name, "2021")
 
+        crate_attrs = crates_crate_attrs.get(display_name, [])
+        # Apply common crate attrs to non-host crates.
+        if not is_proc_macro_library and not is_proc_macro:
+            crate_attrs = common_crate_attrs + crate_attrs
+
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -81,7 +86,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
             "cfg": cfg,
             "edition": edition,
             # Crate attributes were introduced in 1.94.0 but older versions will silently ignore this.
-            "crate_attrs": crates_crate_attrs.get(display_name, []),
+            "crate_attrs": crate_attrs,
             "env": {
                 "RUST_MODFILE": "This is only for rust-analyzer"
             }
@@ -127,13 +132,15 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
         srctree / "rust" / "proc-macro2" / "lib.rs",
         ["core", "alloc", "std", "proc_macro"],
         cfg=crates_cfgs["proc_macro2"],
+        is_proc_macro_library=True,
     )
 
     append_crate(
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
         ["core", "alloc", "std", "proc_macro", "proc_macro2"],
-        cfg=crates_cfgs["quote"]
+        cfg=crates_cfgs["quote"],
+        is_proc_macro_library=True,
     )
 
     append_crate(
@@ -141,6 +148,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions,
         srctree / "rust" / "syn" / "lib.rs",
         ["std", "proc_macro", "proc_macro2", "quote"],
         cfg=crates_cfgs["syn"],
+        is_proc_macro_library=True,
     )
 
     append_crate(
@@ -238,6 +246,7 @@ def main():
     parser.add_argument('--cfgs', action='append', default=[])
     parser.add_argument('--editions', action='append', default=[])
     parser.add_argument('--crate-attrs', action='append', default=[])
+    parser.add_argument('--common-crate-attrs', default='')
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
     parser.add_argument("sysroot", type=pathlib.Path)
@@ -250,8 +259,9 @@ def main():
         level=logging.INFO if args.verbose else logging.WARNING
     )
 
+    common_crate_attrs = args.common_crate_attrs.split() if args.common_crate_attrs else []
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.editions, args.crate_attrs, common_crate_attrs),
         "sysroot": str(args.sysroot),
     }
 

-- 
2.52.0


