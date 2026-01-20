Return-Path: <linux-kbuild+bounces-10700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC08D3C2FC
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 10:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC8394866FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 08:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1613BF2FB;
	Tue, 20 Jan 2026 08:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YOgPciO0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010025.outbound.protection.outlook.com [40.93.198.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F043BC4F9;
	Tue, 20 Jan 2026 08:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899264; cv=fail; b=QutO2JQ5A8eer74IdH4f58/WFHIiaOp7TeIMaIzuOfmCgj096EUJS6eKPSnFw5K03pSVUhYO61DBlu0ggqjkdMmPOIE1rNVLBwl903XlLWQ9DEv4vYXGMz9vBph3eAg5KdY++jxmTZA1K8HtSoHGC0tKevImo7/aSH2c/8NCH+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899264; c=relaxed/simple;
	bh=loD8TfH/cmmv4AV0EaP8LOehLBlT48nlqmpRsd2ojMs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hq1mduUGLvQCBH++Mc+7C3PGQzemSx5vhibm+3dXE3erbIgd08IRuMkQD9cOcdSmB2m5yPiK6iQemGUpWu9Hl+RDsnNJIfWB6+/fI6ok996p2ZloKEyLDro0s7fcGhFm7k2L2N7heBBTrqxC8CY84Evowsf5ILIjnFWu51nE/9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YOgPciO0; arc=fail smtp.client-ip=40.93.198.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBZl/mlzjLUVUE4pmxB6nVQJtBKpzKtXsfeMH8mCDEkekaTO9GIyNrnthHuZp3kS571Erkzk7sqC1/LkpEZPQT2r9owScQkj1f6zZbSTe/wQEDzkzjDyXaVFzSkTwJAHnOuC9p1enM8WerryB6y/YHZ0GwY+izOqWO4DFah8g2uslTzryJAEvjZBQfTtwWNP/pitu3l4PjuS4E1TyzxkOfSbohsdSzcfrgx3zciAO3TDyABd61daPJfVq6EkpwazemH5EMA/4QvbSu37JD2R+ylXKE9wHxFQuFX/zhF5dDsKebj8Yu3VQwoRsAuDTi2ACyNX0vBX0+YuVIeRIUfTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SILC4Hm/nLBTuHVolur2n/aBGQpehuabkHK3k1RXsA=;
 b=VNOOZa2XGWD93vnz/wAraKDdl6nO63eZxbUWvctfj3afp+s/Zsxal3jbi8XO2gF3vwRPhJoSsOehKhcZJiDhNNDwtXKENMQtVwMMq5Yeqxw3GtacZ705VowvHEJ8DePNM4l6ghxVYMKIenuItqMMHqHq5KqrGxWjhBIBwjc7gy5wnjijldgOjAjttTIMwLJD3OqutvtkSd5naE1gojOR0xRE5Z9IzRgZcskHVXNNvlMfl8kNKfYOm9PlgZYOpIIUzQbvSjzx3h+tLPMdx1ccYg5faAoOy4JhkCRNdivU2F1ucRPktxd7Bm5ZuxsYzlueAGgi6kkAB6ZyfbXd1LMO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SILC4Hm/nLBTuHVolur2n/aBGQpehuabkHK3k1RXsA=;
 b=YOgPciO0IipuimB8Sd6mIcjWBfy9n6lNi7914S7yUlyGbQgse1RPkYV3ESz/1ZHRmA8WtWpyuW3ZHYNj6CdnxNNMhwuxnj6yyujTltuOP9zmYf0lomMmt/T5fCYWJsULxTBEYg6WX4679wamQthGOWt6fcHrHqLx5+Pjs6WW9T2K4gJe+2XK9CeJ6GOMZHYbF12tC+/cfLefhLuiwKyY+9XOlqAR9yCSY3uhYDLIyhC2WEZMc3/FBzJtXUgpYnLVy+gdrp36mGYq7bU79yv9jUX5jtigjH/lb0IpZ07/ZTdAQZDak0WjjvWues1u31ZigIvGMeoBks8VqyBhdR5V4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:54:19 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:54:19 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 20 Jan 2026 17:52:51 +0900
Subject: [PATCH 2/6] scripts: generate_rust_analyzer: plumb editions via
 command line
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-ra-fix-v1-2-829e4e92818c@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0015.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::17) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb8a561-8405-4069-bef9-08de58017feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUtMbWZWZ2J5a281VW5DT1VDN25iNEZMdHBRN2FVSkRiS01BS2poOFA4REpv?=
 =?utf-8?B?WG0zQmZ6ZTNtbUp3eTRlT05qOHE0eXExcmVXYUxndnl1NG1IRlFPT2NTRHF0?=
 =?utf-8?B?aUhoZU5rT0c5bEl6ekdUYmNJQlZ3N2ZjejgyOGVTSWJteFNDSkdKa2w2eTE1?=
 =?utf-8?B?TU1VTHRYb201allDZytLKzBiSWNvbG9xbWxKb1hEbjdidng3VStmaHZBS2pa?=
 =?utf-8?B?aWp2eDJyWkFvdHZ3U3hEb2U2WDVBUElub1Jsc1lrK2Z1R2hjMDRacjJOMWdT?=
 =?utf-8?B?RG9JYjBNODVBc3lKSlpRMk9odzUwNVQzNzlOa25DdDIwWU5WYUFsemlaZ0dt?=
 =?utf-8?B?elU0a1hxcmdvSmU3aHUrdVl3aGpKcmZJQms1c0NFbkVLcjJiQ0hsUnRWZlZH?=
 =?utf-8?B?NEZQbUdtRGZLc21xZHZyenBmQTFybSsraGtnM000enluVlhmc2YzYUlNODBx?=
 =?utf-8?B?Tk1pdk9kNEkyTmN4MVVDUXlzTW5EMXc2dC8xTGJhdmd2MUs2eS9xRmd0MllH?=
 =?utf-8?B?SzV3b1JLNnl4eWZzSXlrNWRhUGtVNWo0VVY4czJjRW43Q1dpNkl4endCdDdn?=
 =?utf-8?B?UFFzUW5VWG1NekxiMm1MYStwcnluZ2hEUms2VmMvWDJrRTB2aVVYazVwRlhi?=
 =?utf-8?B?WU9rMEtaNEw2SFdGcitZcERhNytYQ0ZXRnJsZkMyYzJnblBhYkV4NUtSeWps?=
 =?utf-8?B?QWM3aUJpVGdnU2ZYS2NZTVpUUUVtS2l0cDVLRitMR01zRW1JOGt2NjFNUnVK?=
 =?utf-8?B?MXNURmpIQzJpWC81aWJCb0t2U0N5K3REVGhvL1ltSWdzUVVBeER1ZDN2em1K?=
 =?utf-8?B?WGQrQk5vWGhrSks1WktqYlFRcTVKRHhDOWZvMTNKaHRwMjE4L0Mxd1VEM2tH?=
 =?utf-8?B?ZCtwZUhkNEN5ejg5c0w0V1ljVXU5YTYvWW1oV2dKV2tXcXNUTHYrazRHMXdI?=
 =?utf-8?B?ZnU0SktlSlduTmt4T090UXpzV2h0T3NwV3BKbXptcnluSGpqR3VETkwwaGhZ?=
 =?utf-8?B?cFBUN25MdFZza0tQbkdjVUhnM0c2ZGpCdDRDVEdDbG1SdWVSeHhBdDRaQmxz?=
 =?utf-8?B?dTlUZ2F3dlNyUW1PVnpZQ0FJK3ZmUTdoeDBSNVAvdjhRcnlVM0F4THkzdnRv?=
 =?utf-8?B?TkdOZ2lMVjFzb1VXWW1kNnNrUG5HVnRCaWdXc2R2QzJzaHh5QmkrMGxESjMx?=
 =?utf-8?B?S2kwSE5hV21pK3JWVDdDMEQvNjl1bHJTV0o2bHJkZStUQXVCUktmdkgwT3pp?=
 =?utf-8?B?UFNPRmR0dzZDREVNNXZ1QmZSQ3h1b0J3RFlDczc2UkhVSUNqVWo2bk1sZTdy?=
 =?utf-8?B?ZUN2TkxPeTRaVmszaFZ3ZzZCUlNiUHQ1eTJKOEt2WGxLMzl3bWp5WWZtWS9x?=
 =?utf-8?B?VWQvV244ZWdnb2c2c0oxcHZzSm1aODJjQzIwZ3ZudG9EbzlKUWZRR01VbTVE?=
 =?utf-8?B?MlE2ZlNUYTZ1Q0t6SlVCTVBKWGRUb1pyejFvQzFXaitPYUdKT1J6UVN0NnZj?=
 =?utf-8?B?WitRcXZJcjZ3d0RVMklxMXpoNElkOHNFMm1uOHdBaUcrY3V1WHpDMkdsejZF?=
 =?utf-8?B?bVNTd1l2ZnJVOXlLUk9UZVdpb2x5QitKaEJKT3krbWk0ekFBMTZJYm55K2Rn?=
 =?utf-8?B?eUUvb1ZERUl1bVVuN0xBM01ZQlY5YU0vWGVKeEp4YXlTOTZRSDFPMzF2Q0pP?=
 =?utf-8?B?WmFYVC8rSVIvQWpYN1d5K21yMDZiRjh0aUQ1QTRuV01vTlBVYzlwU29ycXYw?=
 =?utf-8?B?T2FRRXhsNUlEeTRRS1FrbzZabW1GdXkwcE53T0FocVRyb29kZXBFOGl0Q3Fh?=
 =?utf-8?B?VWhhQkUwUFd6SGxZYzgrY1JyVVAzNGdabWZMNjBTRGtaSnVTa1hBUVk5NG05?=
 =?utf-8?B?d0UxR3lhSUJxRjBWUHhhUVJwK3pTQnk3NWcybllMK0pqcnZQa1NzYW1NdmlD?=
 =?utf-8?B?a2NjZUUxcjhSajArTndMUmYxRWo0U3JvS3BYczFuSFJLRjVFQVZnWENvT3ZG?=
 =?utf-8?B?SC9LUDNaT3NwaXY1QXgrdThvUXNxcGpIWXg4YVp5N1dLcjZLQVVVdnBoRnls?=
 =?utf-8?B?dFNGMjFFb2dvNlJqLzB3em1vS3hoTGtQR1hidDZhanZSWkI1VGNRQXkrMGdr?=
 =?utf-8?B?UkNXYmlFREVIM3ZMRUFpUXhpcEpHVlZXWlhDblYyL3R4MUtyd2o0U2tWdXgy?=
 =?utf-8?B?Ync9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWdRYjZJM0JlV0VVTDVIRUx2YXovWmVOdUZGVm9QODV3b3JIWlZTL3l4WUxq?=
 =?utf-8?B?ZEgzYjMra3orbUljOW1YWUhSTkwzR3JLcFFoaG5mU0d2SzVnSzBjbjF5RVpZ?=
 =?utf-8?B?OWNtRVNpUmdXRGNDeUtOUTRqY3pIaVh6TFdaYVVZQ2d5QXFGL2JYVGwwbVFa?=
 =?utf-8?B?SXE2bWRSQlFOTkE4WEVRdVFlYXlZU1E2akw1SzNlOGR6QXRFRTduYzNpbzc5?=
 =?utf-8?B?QzFWcHpFRExtT092bnNFUk81aWhBZnVWMVR1SjUrV0RidnNIQW03ZmNNSG5N?=
 =?utf-8?B?VXU5UFcweWQ4b1pxdmw0ZzVRSlBDeFJkMmsybjA4Y1pScTllaGs2aFJldUk0?=
 =?utf-8?B?ODZDOWtpbThxUTFHVTU0U045NDI4UkxjUnc3bzVVWXJzZ1BaOXRwMG04bTFt?=
 =?utf-8?B?Q1B4UzExc0RQbWJYVmxYYjlqMFBwL0E3UnhzQk93RzRJNlo3N2FjWmpzNkht?=
 =?utf-8?B?N2dwaFB4MlFGd1E3R2ZVNEVrOFJyV25QeWpmTEMzL2FLKzRJa0RHOGFTZ0lo?=
 =?utf-8?B?eHZXbk04ekI5T1p0a2pFMk05RC9uMG95N25Vb25ObDdMeElEOTVqSUFTd2NR?=
 =?utf-8?B?VHNCYjZsNlQ1KzZ0azRZSS9DcTdkcm5yTU9aa3k2TVkrUnZvYWJHQzkyMHd4?=
 =?utf-8?B?RERraFJYY29iRFFqMk1yQXZqVXI5aFFSSHhSeWRHYlVOVTF4S0pGSjBzSlNP?=
 =?utf-8?B?c3RmQTlFYTI3dmVta1FkUm0wRG9DWlRkRmtpV21LQUdiQXZ5L3h6SDRKZEhQ?=
 =?utf-8?B?aGtDVzFYVjVWS0Y2Qnk0WGg3OC9ka2tPV0xIcTY4MUpIMU0rM3VQQWxZampv?=
 =?utf-8?B?SmIxclFRc1h5SDlCOE1nTjVSWmdIVDZjTFlEaDBwbktwTEpZOHhzWVRxcmxi?=
 =?utf-8?B?eThEQ1k0UnFTM2VnWXZGZUQ1ZXJFWjNKNnBrNTRiZmdGVjMzWnhHT3lyUlR2?=
 =?utf-8?B?WUJRdGpmZXg3YW5LdTE0N2RXZTA2RjNFQ3pKMFlLNVpIaUNuMVBwNFVGb3Ru?=
 =?utf-8?B?aFFJQ1BYYVN6K2Z1MEtMbEk0Nm1tWkFRcjZsQ1B1b043TFQrenRSMy9teE9E?=
 =?utf-8?B?cFFsUDdYRmREYWh0RDlOSnBKRVAyaGpoU3BYOTZxdjMvR1NZN0JEWWY2cnBO?=
 =?utf-8?B?b01NNGZmTVlXTlBRaEZRSUdDWi9ibjJBQzJjd1huNENRK3BCUzdVTm01dDZ6?=
 =?utf-8?B?RjJLeUxxTytrT0NVOWk0dnU2NHlBb212WFRyR1MzazFJdW5rWGlmV0w1Y0Mr?=
 =?utf-8?B?eTkxekZtM01TMUNuQ2pSeldlbXB0K1FyMFVFRWxKMnJlc3lJY2lRT25KbjEy?=
 =?utf-8?B?aytBZzl5eWd3Ylg0M0dBVE9yMUx5ZWhmdEVNVGhOYnVKRUlxU25aR3dzSnkr?=
 =?utf-8?B?Zm93c28xdmRyVUV6OXVEdVFIU1hhSVJ0czdkYSt2aFd3TjlDdnFHbnlreDRp?=
 =?utf-8?B?NFNtMUp3eU9KY0dvc1NvbjZ4OVhib1JOcG44cFdpNjV0K3MvK2JkYjljSHFO?=
 =?utf-8?B?Nyt1eWZsMThQSjVvMFVqeFVJbEF0UXVWNHQ5amZBNjZMbnkwTE9WZk82MjQy?=
 =?utf-8?B?eXdCbGdKckNLendORlpvVm5CdHNqS3I1SU1yejRxSzBxem1Wa1ZISVlXcURK?=
 =?utf-8?B?YzcwTFNWK0lHNStwckUrT0lqUHpTamZXQnBlamRmRzZ1cit2VHhvSGtRR0Z3?=
 =?utf-8?B?NHBxTC9POERNeVZadWVRb3VCSlVSdHNBRitYOUMzUFBJOUUrR2lQYUUyTnlG?=
 =?utf-8?B?TDBkRnJVNS9BbWRkQTUzWTZVZyt4MlBmdEdXcFhZUE1FZTFNQXU0dHBMaWlv?=
 =?utf-8?B?dU0zOGk4bEE0ZC9zSVRETWpVdHl2Q29xYUJ5UWFLYW1Hd0ErYSt2OWdqSWd0?=
 =?utf-8?B?dzdQQVVVRDIwNlcrS3ZON0ljc2VFUFhaQnZwd09GS0p4QS9vZVFNSlN1VkZT?=
 =?utf-8?B?eTRIcVBFV3llUUd6RUF3NklnZFQzaVF0Z09KYkxnd0NkcjVxUGkyMjAyV0tj?=
 =?utf-8?B?b1hzUWIwRXRrY2hsNGRPMFFBS1ZkMUd3RkQ5L1NnTTdrcng4bUVLbzRsSG9Y?=
 =?utf-8?B?SGFqL3hzb2dtTmU5WU9aTGpUNkRGYi9JOTRBQ1ArekI4dU83VmlCSmtKNDZC?=
 =?utf-8?B?VmE3WHkxMGg0YnoyK3dxY1RjaW5EbHF5YTA3QXN4NituVDB1dUo4dlJ3UHhp?=
 =?utf-8?B?ZlZocU5sRGFuWHFrWXUrRWlCL2pJWWRCN0ZPSWxBb3VhOGJDdm5hRzhlVjJI?=
 =?utf-8?B?ZUErSTJRYndmdXdCQktHck91cHM1YWx2SFFiZjBTNFU2UDRmU1JtdXJnMFBI?=
 =?utf-8?B?Y0k4UEpXQitSTjRmeWhrNFo3V1RnbnRaYkhyci9RK3N5SjladjZoK1c5MmFw?=
 =?utf-8?Q?c8Bl9I7f+GYNLYn6INRsIP3K4gQgQj/wCH0uulkL7dldB?=
X-MS-Exchange-AntiSpam-MessageData-1: LyIvolCU8NIyKw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb8a561-8405-4069-bef9-08de58017feb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:54:19.8269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohdNF5fqz9iCzlvcl4N+SwWj0fWAaGGOfpW7HHJVX9njt4lsRMqt90kYjSDL3GgaIrEaXPyZjfYZX7UOpbvoQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Add --editions argument to pass crate editions in a similar way to the
existing --cfgs mechanism.

It sets editions as follows:
  - core: 2024 for rustc >= 1.87 otherwise 2021
  - quote: 2018
  - all others: 2021

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/Makefile                     |  8 +++--
 scripts/generate_rust_analyzer.py | 70 ++++++++++++++++++++++-----------------
 2 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 4dcc2eff51cb..2238b0b69197 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -95,8 +95,10 @@ quote-cfgs := \
 quote-skip_flags := \
     --edition=2021
 
+quote-edition := 2018
+
 quote-flags := \
-    --edition=2018 \
+    --edition=$(quote-edition) \
     --cap-lints=allow \
     --extern proc_macro2 \
     $(call cfgs-to-flags,$(quote-cfgs))
@@ -567,10 +569,12 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 
 rust-analyzer:
 	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
-		--cfgs='core=$(core-cfgs)' $(core-edition) \
+		--cfgs='core=$(core-cfgs)' \
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		--cfgs='quote=$(quote-cfgs)' \
 		--cfgs='syn=$(syn-cfgs)' \
+		--editions='core=$(core-edition)' \
+		--editions='quote=$(quote-edition)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index c188d1f1fd5b..17ed5546504b 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -11,6 +11,13 @@ import pathlib
 import subprocess
 import sys
 
+def args_single(args):
+    result = {}
+    for arg in args:
+        crate, val = arg.split("=", 1)
+        result[crate] = val
+    return result
+
 def args_crates_cfgs(cfgs):
     crates_cfgs = {}
     for cfg in cfgs:
@@ -19,7 +26,7 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edition):
+def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, editions):
     # Generate the configuration list.
     generated_cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -34,8 +41,35 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     crates = []
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
+    crates_editions = args_single(editions)
+
+    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
+        # Miguel Ojeda writes:
+        #
+        # > ... in principle even the sysroot crates may have different
+        # > editions.
+        # >
+        # > For instance, in the move to 2024, it seems all happened at once
+        # > in 1.87.0 in these upstream commits:
+        # >
+        # >     0e071c2c6a58 ("Migrate core to Rust 2024")
+        # >     f505d4e8e380 ("Migrate alloc to Rust 2024")
+        # >     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
+        # >     993359e70112 ("Migrate std to Rust 2024")
+        # >
+        # > But in the previous move to 2021, `std` moved in 1.59.0, while
+        # > the others in 1.60.0:
+        # >
+        # >     b656384d8398 ("Update stdlib to the 2021 edition")
+        # >     06a1c14d52a8 ("Switch all libraries to the 2021 edition")
+        #
+        # Link: https://lore.kernel.org/all/CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com/
+        #
+        # At the time of writing all rust versions we support build the
+        # sysroot crates with the same edition. We may need to relax this
+        # assumption if future edition moves span multiple rust versions.
+        edition = crates_editions.get(display_name, "2021")
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -68,31 +102,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             deps,
             cfg,
             is_workspace_member=False,
-            # Miguel Ojeda writes:
-            #
-            # > ... in principle even the sysroot crates may have different
-            # > editions.
-            # >
-            # > For instance, in the move to 2024, it seems all happened at once
-            # > in 1.87.0 in these upstream commits:
-            # >
-            # >     0e071c2c6a58 ("Migrate core to Rust 2024")
-            # >     f505d4e8e380 ("Migrate alloc to Rust 2024")
-            # >     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
-            # >     993359e70112 ("Migrate std to Rust 2024")
-            # >
-            # > But in the previous move to 2021, `std` moved in 1.59.0, while
-            # > the others in 1.60.0:
-            # >
-            # >     b656384d8398 ("Update stdlib to the 2021 edition")
-            # >     06a1c14d52a8 ("Switch all libraries to the 2021 edition")
-            #
-            # Link: https://lore.kernel.org/all/CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com/
-            #
-            # At the time of writing all rust versions we support build the
-            # sysroot crates with the same edition. We may need to relax this
-            # assumption if future edition moves span multiple rust versions.
-            edition=core_edition,
         )
 
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
@@ -120,8 +129,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
         ["core", "alloc", "std", "proc_macro", "proc_macro2"],
-        cfg=crates_cfgs["quote"],
-        edition="2018",
+        cfg=crates_cfgs["quote"]
     )
 
     append_crate(
@@ -224,7 +232,7 @@ def main():
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
     parser.add_argument('--cfgs', action='append', default=[])
-    parser.add_argument("core_edition")
+    parser.add_argument('--editions', action='append', default=[])
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
     parser.add_argument("sysroot", type=pathlib.Path)
@@ -238,7 +246,7 @@ def main():
     )
 
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.core_edition),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.editions),
         "sysroot": str(args.sysroot),
     }
 

-- 
2.52.0


