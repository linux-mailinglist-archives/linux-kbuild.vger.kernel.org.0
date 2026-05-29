Return-Path: <linux-kbuild+bounces-13405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPLsEAG1GWoRyggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13405-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:47:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF2860501E
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D9E6307BDB6
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 15:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918883FC5CB;
	Fri, 29 May 2026 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OCF7r9dQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4427E3ED3C9;
	Fri, 29 May 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068498; cv=fail; b=VvPidLaCcThDZylFk1NOPq8Tr52jNGwOftbpY7N/KIj4Jxr2ZxCOiaxGnSi7DdAfAftme1RY8ARvN+17v80ft/X4wanvvxEcP0Dg/sOB06AN9Js+wqqx4v/VOJojm0AoVE/+8jCQiArtrNkCcE9VfU8uXXayR1QTPXgYOMrdfhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068498; c=relaxed/simple;
	bh=Qt1CSPcr6YFlheshTF3UVIq2CynOLS5ucO6GvaCrBMg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Og8pFQDlr8ueJFAnuLORI5YupOYjcj7+aChReePcOjSy6F8w7ICGRxTpXSC8nmd03YFN5YTlZmvmapm1uWRv7t4YM1FANXVAteh/aHf2t8Itdo/5R3A4A8ym4XYUodF5hKh0yMD3IH3unLbf1Dcsn2BpUasUm7nnQnH/e8+Ti5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OCF7r9dQ; arc=fail smtp.client-ip=52.101.62.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHoGIrQg/b4zDx2W/ur6ubIieiFBdqX8WMHGkY0nbKdolaVZl4owPAK0she5nsiVw0O51wsALbM64kyfTbRRDpKGVCi6JXGjF9pJPaddfTSVIPlnfra2QzsBrJRdmGvf9kKrov8DDmi59TehF8rcLsIUV1+eIKeGeeq/V6hMIJ8ZSxIfRraZI2q3xKcUBeafkSn8BqpSHObjeXYqxWxl3LKniEkPYOjB1cIwf4i2LQeKZXuVg7UksEzEPhn0Dy0V381he7TEtj+cjWzwkbBbN5yePx7Xbn8Gr/+0HnjdOr2a+Ek8uztQRdo6/CV3z+bX5voZgMmqmvrZqtMJoqoo0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Al/UycmJpREoEjBhDSZQbCjh5MgedODPve/UEBOw7sQ=;
 b=eKuoNckrj+IScnZYtizfOkHPErD4hviZiuByBH0H/EaipI1ahIADhFMML52V9+2u5AqdIgEHr4h7O/GCwRvmVmnhDFh8p5oyAZfVS8WPIWpSwPAgZsuLe+Yw0+NIpSqiBCLgBUyLuv2JL+ZdwgjqPaWSLPKQFQMkIF+lU+uM/IHTUy6NoF9ZghFoherCDIzMsIQDn+f5l57YE06ZPK+x89ijOdYIoCrJc6okXO1QXb6TXi95Fh6d3CBqaWBVdaAcRlZwAsYl1QSXU0JekLTA/O/RIXfl88x8WSvhz1daegDcqofgrbwvhsYC0B6c6IS9fvBXRaFSrW3LCF/Q9iwAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Al/UycmJpREoEjBhDSZQbCjh5MgedODPve/UEBOw7sQ=;
 b=OCF7r9dQFffk+wazaCNQ7wQsB5DjYmsmMrwyQmSA+dLyKzeAtdB81whk1Z7+rySHgVn6SFMLi0uiwu7ARouYUBpgpZWhmG2mkcLaf92LBoVQyot+alY7UjQLMXLifOtw7CXh75oKKnk0K53lVpTfQZ1MwyejrETHPvRg+vgE5s1fLk9281w6PjqkXlz7GajPDUMBgvu92Lo1j7QXgvetFvdXtehrldnb03m1zGSiwYdqdja/DqbULpeSbUYgkryWzREjRfDwaYekgpMqHD3lFbvdYlUB7ue8v6WUHglrZzJjkIoZhIALnS/QCQ3pamfDfZLz5i7R/MWCSeeZ8u55oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 15:28:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:28:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 30 May 2026 00:27:42 +0900
Subject: [PATCH v3 2/5] gpu: nova-core: export Rust symbols for dependent
 modules
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-nova-exports-v3-2-1202aa339ef7@nvidia.com>
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
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P301CA0038.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 8372ecaa-e98d-4439-fe00-08debd96e538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|22082099003|18002099003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	rjN/TLFM04khOTdkNeTzJsdCJhnVhoGvfxfsZtPBIpMcQJ0Y2052FOmPmgyMNWPwhwH+OaLSn7gjTt0IjnlbnsEPAOQFHYcJVN6MIqgymwRWzz3KStH8Zx41JCasyjX5a4bTt22Xu1HYHTzl1ZZQBrcq9tXoAFdh3YjvB/S7AGPGMy6SJZfgjUJVokT5IYQtyA41g7BMj4xW4l4ct3Xjfzaz7klAPEqjgWzRE5DEQMgUJdBap27tB1087OAZBepAwJWFFRYHAYz+E9LUaca4aclRkc9ATlgCeNcT6BUA0OGk0+Q7VRn/DNDG/PTW3gKYpCf1Q+G/l8a7+ptiffwGvNNhKMH3efNNVcbvzZdfwIyeUoREICAjKWgDrS5y2ctGyuOdZ1+THy6UwtpZkqyIM50oDzAfckQa0tK4ZHyPPzLi3frZjhAelNYy+L0lXZR+kXdBqewlNcayQ48pWIXt8CgCwHA/I5Ra6o+Yl0+CGot4nPBkk61EEsJphajIjAR3hszwzAggDUDDTtBAiNNupAfdoJKVJJIWiV8asAMppHKgQO6Vb7lEG47O/iZlQSPY30u+dd8wGnl4A+G4OrQShqbDerkIQIQzrr8eZw20W/p33SjwavEqZDVrhyvPh2VqkoaMo/uM4/xo5kpUAZXmXlnflVAlCHth8AgWoH+hqpDjf3XWa0atRWlE3h01Py7KBQI6EeZKJmetmVFVelQQUG29dK/yRXVxDMAk9esXqbI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(22082099003)(18002099003)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXAzUUhDQ0ZnbnY0Q2gxSUdTMFNOZUNNT3hWbi93TDVTMCtHYi9tU3N4elA0?=
 =?utf-8?B?YndsOVk2TDNyUTZaRmJ5cm5FRFRISllpc3VWOTJ4R3FnaGVWTDdRNlVNWGp4?=
 =?utf-8?B?UzR2Rzg2dHI2NTdQUERyWlFTRnhSQ2xEcmNIaGwrWFlFSDVKcW5MaEVvUWRZ?=
 =?utf-8?B?VlhTZ0pHb3FlOXZjWFFMdFo4b1BXRGVva0dZeEV5elVQNVhtZi9lQWpaTWsx?=
 =?utf-8?B?Z2JtdFV1SVdBcHJYWXowK2thdDZEM2tSdmNGVk1LN3pEZU43Yy9YNmNJU0k4?=
 =?utf-8?B?ZThCVVRlL2t3L2FKQzNqRzJneW9xaFV1cG9lNlhTck1HamprMDlrQUZicDUr?=
 =?utf-8?B?TkI5Qmx2S2tJV0V4dlJIQk1nSlE4N2F0VzNxOTJ4cnNCS2J1bFZrUDRNU0cz?=
 =?utf-8?B?aTAvV3NiZDdPQTRmekhsT2thU2NmaUs0NVpQVWtMYXlBeVdDVGFRTVBKM3Aw?=
 =?utf-8?B?amZNdVl0aHZxUG0yUEJWeHpuWnhJVTR1dVdnb0lrZzh3Yk42RDRla214Y282?=
 =?utf-8?B?MGhkM2NvRzhySjl5T2ZJSXBzRjR0d28rbVJjL1FFTzJQOVBjNHEzQXM5TytD?=
 =?utf-8?B?U1o3TGpuWms2SlZvVmpvTngrbkh5d3RubC9ENTZ4S09TaXhUQjN5SjZwdm4w?=
 =?utf-8?B?c3pSU21kdGg4SVRkcWIzM2hiWWVjelQ3RURuV2loT2o3dUhaT09Fak9CbGhC?=
 =?utf-8?B?SlIyeEFpT3NkVUh5aHNiV0UxMEpBYXNXYUJIUGl5ZWxvNnp3cURWTTUvUmlH?=
 =?utf-8?B?U0cvTjcra2xVSWJvSFlCNjRUWE5jL1gyQ0dNMHErQ1NMVmlnRDVjUXFOeEpn?=
 =?utf-8?B?V3FsemY2cjlxTnBBcXEyZDk4STFZQ2FrSE1PMjRWUXVlcTY0dFo4OU83am5w?=
 =?utf-8?B?eFBiK3UvY3ZIVFdyNWFhNGVoWVBiUzVrRHBDVmR5SXU1RW1Wa3ZGdEJiU1p0?=
 =?utf-8?B?azF0L1pzUmdSTnNOYU1aV2Nxd3JCdDI2MmJUWG9xTkhYK0xZb0VITEhDdisy?=
 =?utf-8?B?OXJHcFRCTHdkanhlV1RSZkh5ZXZPOG14cUVnRVduT2c4L0tMSVJLUnZ4T3ly?=
 =?utf-8?B?UFRSeFFCZGtwZWJCblR6V0JxOENtK01QOEsyK3hWWjhPR2VWZ3U5ZnBNeUM2?=
 =?utf-8?B?RDBaWEtDdGhFc1poTXdqaFZQNUpWbHlDMmxTcmNNcUhaN1dpWE02dk81ckJz?=
 =?utf-8?B?U2VLcUlTOEgxTFpUTFl0MVp5d1VmR2JRWUdhU0hWdXcxMW9TSFlOTkZCQ094?=
 =?utf-8?B?dEloZDJ6WWVDVlpnZlUyQmNpMnF0M2FJc0R3S0RpeWxCT3JCeW1peHMrMzFF?=
 =?utf-8?B?M0pxSFZOOU1BT3gvc3grZGU0aHBHUmdURkVKKzhlUWtOZ1VHb0JzVEpWczRi?=
 =?utf-8?B?VUJxUGlFcHVDMUovTUtSOXh1R0thRVZQd2ZaY243dFRCMHRidEdUZWZod1h2?=
 =?utf-8?B?M3YrdDFPWldIeVhiNkQ0dmU4T2V4L0hWZlFnaUxHNjlwQzJlQmRFLzk3dHMr?=
 =?utf-8?B?SHNib0o5MStlalhEamhzZzBtMk1vZTdGSlZ0bzBHcTE0QitvbFdEeldLZmYy?=
 =?utf-8?B?R0dFcWw3Wm1JWmMyU3lZY1gybFZyVHBWVm9DSWpBYjJ3Wk1aNUpQajB0ajhZ?=
 =?utf-8?B?ZkRCQXlhejRhaUp6dFdaVFBTUkpVQnFhTFFiTVN1Vmt4T3VEMkNOYU9ObEpw?=
 =?utf-8?B?bElkZ3FrY2hKbUUvN0p1NjhpQUpBdU5IUU13OVhaYW40RW93U3FlcGpRQkIw?=
 =?utf-8?B?U0djclRkMWtaYUFHMXVRQ05XaEVpTWhwSDFObUw2b1J0bzRkQ1lJeTh4Z1pY?=
 =?utf-8?B?T1hQc2VrLzZEU3E4Nm5jQXpRUlRLSkNVa3VBWFNUWlo1Y2FzalN1OW5jcWJR?=
 =?utf-8?B?eGdnWm1HTEZuSnRpREoySXlhUGpyWDJ0TzljNVczOG9wUkNPR1JXZThjdmRv?=
 =?utf-8?B?dUkyOG1DZ2ttWGdxK0tvTTllUGVWU0RLYXJhV3VHbmx4SkN6eVhza2RheTg1?=
 =?utf-8?B?Q2ZLN2lVUVpFY3FnQlhnY2UyYWtId1ZOaFFUSzdRcDhNSnhhYmpjRThnTnVk?=
 =?utf-8?B?NzVvaXlydXFibVpXVHpvUkpoWmdoL00xajhvWHltUDlwLzV0VDM3SVhMS0dL?=
 =?utf-8?B?Qnd1NEh4SVdDd2ltL1F2MWdpZ0M2TGhrL3ZGNCttZi93T0hCbEFUTXlOeUF2?=
 =?utf-8?B?cW44dVczWEFlcDRJSnRTK0YwTS9YSUdBdVBDMmFLSldTSDRXYXN1eHpUL2NU?=
 =?utf-8?B?d1hrKytPelZpMTBEYW9EVk1hWXVycjNuczRZaFlCSndhVzJHdXEvUW9vcG5S?=
 =?utf-8?B?Tzk2OGhrT3pUcUhFVldXekcya2k0TVRZckJ3RGlqZ0xaS056bncrTi9lckQy?=
 =?utf-8?Q?JC9kTh+yBvSWNrcStvjIawzOc9hCjNLcx3cFi1gShO4Tl?=
X-MS-Exchange-AntiSpam-MessageData-1: oWq590MG+tqXSA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8372ecaa-e98d-4439-fe00-08debd96e538
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:28:12.2911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDjAL38hkQZvvtbBg70xRoDqDUyaedaPtp+wiV4k/jR7kq0FojQUCKMfANW/t0hiTql4VrGMYmTrh81Nh6G6UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-13405-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7FF2860501E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Export `nova-core`'s Rust symbols so that other loadable modules,
particularly `nova-drm`, can resolve references to `nova-core` at
runtime.

This is done by generating declarations and `EXPORT_SYMBOL_GPL()` calls
for Rust global text symbols using `nm` and compiling them into the
module as `nova_core_exports.o`.

This is a workaround until the build system supports Rust cross-crate
dependencies natively.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Makefile            | 24 +++++++++++++++++++++++-
 drivers/gpu/nova-core/nova_core_exports.c | 13 +++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Makefile b/drivers/gpu/nova-core/Makefile
index 4ae544f808f4..59ac25488896 100644
--- a/drivers/gpu/nova-core/Makefile
+++ b/drivers/gpu/nova-core/Makefile
@@ -1,4 +1,26 @@
 # SPDX-License-Identifier: GPL-2.0
 
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
+targets += exports_nova_core_generated.h
+
+$(obj)/nova_core_exports.o: $(obj)/exports_nova_core_generated.h
diff --git a/drivers/gpu/nova-core/nova_core_exports.c b/drivers/gpu/nova-core/nova_core_exports.c
new file mode 100644
index 000000000000..480472b039db
--- /dev/null
+++ b/drivers/gpu/nova-core/nova_core_exports.c
@@ -0,0 +1,13 @@
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
+#include "exports_nova_core_generated.h"

-- 
2.54.0


