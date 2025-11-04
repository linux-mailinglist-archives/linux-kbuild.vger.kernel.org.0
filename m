Return-Path: <linux-kbuild+bounces-9392-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF497C2F368
	for <lists+linux-kbuild@lfdr.de>; Tue, 04 Nov 2025 04:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A0E1189C144
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Nov 2025 03:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3683D29DB6C;
	Tue,  4 Nov 2025 03:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eHuVUgm7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594AB14C5B0;
	Tue,  4 Nov 2025 03:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762228444; cv=fail; b=o33jEVJjHRS4q/fcZHtQWwH8KUoK13oKJdxjSdjczjM2Ua3QTAF2zTUW35IaJd9guoMu4sO7sEHmqt4poEhfkRxmaI+/h9mDuQ7Pp/jbQEN2VNHFao2iOdJkNhSek1kst8cOyFWwbPRei6lVlxPayezifpznb+ddmZ5O2/Crc1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762228444; c=relaxed/simple;
	bh=oPD/nlBzpLYg7dMuyk5pfKR9hxuEOL5/K0dOlNFGTHs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=JhPbZ61hapNhtWAb+ym/IadEdIwlxRdCLlDpW0CjI0EtDFlg+juZSiGRLqiKCpkRs4gcz8Y3u/Wf8jWiz8R8T4aTB3aUkgDNAcbv/Xn5anIlMV8elDPjteamZiBK9xCqFGkznWq6JkFM/A2pHW1s2RwP8ZdYwHUfXlbqOuBcjrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eHuVUgm7; arc=fail smtp.client-ip=40.93.195.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjZ2JeLCkzZEe7UzgmvzjzIEuMKH6JSQMzyqMvLyhykZrlhQj0AklWgNAs9d3P5snP7YPzCkJxsppWK69MEPadUS17SQX2QbJub0Byr8b4NR2+3WmMJvDtiUaSQ+jOzemP8Ck4AGR/qGOq0+s12JrscuDSYykbETvQu9oHzXy7d1D3SDta5x7c4ol0Jdyr/hW2E0lEQ4CuQ6MYGUAhvEUQwRUFyOxIcsV6e/OeRepMnJmlYe8pS0VeCjATYQsWIBjYlbfaycO97IV5N5BqCGvlhB3+JyazJo7d3rCZa8pov4iRP4k9QCjEDkfKU/bEAzX+QcbStGyqHUvDrTDMZstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzKMUGF+SdVmV5X20mwi/uEYPlfq9QfkEkNp7dIZEt8=;
 b=eFdkt2fGogoNKqWq5UMk2KtIA3ftzK9RqzI9pK3Rn9Jqekqd6/hylbEyEw4MYP64u4C8PAuGGP1EWvvDe68DTo0WBkSLZH3ri+EQ87dydiaevOcSR8KElyrd0zecEPNCzGQkG6yq9z+p3evV+TEPj+GgHbZSMN6GnB/6cxF4jkjeo8Npi9HPlj/FnspnMErKAI/ExuJwxRSn7j77nFvwfUEpt90+DlJ8QBAU6fZL7gIUkzH5/J7+txuJEdoyy7nFahmqph7LIke5isEjlW2wNVWoeLndlb9dVUGlQSo5O7j6XSkH/BGO+YBR/FGyW5SITDedoLPqDTWBEPTUSMcJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzKMUGF+SdVmV5X20mwi/uEYPlfq9QfkEkNp7dIZEt8=;
 b=eHuVUgm7ckMcNQ8qDBfgWVJTxpU2pPfSSgMImzk4WcEJmG/DGOGDI3ptsuK28Ee+Pqvaef8JHH7tB7oM3j0CNtc8gDwJ39pYFJEp5FelbwL0wtouZLNdsnOH/vSx9fhhj1ZfUO0PuraBpGfcrRTfD9M5nLY0tWi7mFgFSMskiZUr5c2ZLD2g1UaCMQI9q12v3A4wqqcGY5I3vCNkMkFPW7eSij/sOulh3xF+CGSr7d6atqf2u4McLjVUV3u00PwnJgGSQLhQSRm73NiF2R1v/usPL92VExBHlwmFJyolQDRDSMEQ0tcf+BHAGbqQrUhd4s+e4hmKoOnoXSXWkiGG7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 4 Nov
 2025 03:53:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:53:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 04 Nov 2025 12:53:18 +0900
Subject: [PATCH v2] rust: enable slice_flatten feature and provide it
 through an extension trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAK14CWkC/3WNQQ7CIBBFr9LM2jFALWlceY+mCyiDnUSpAUI0D
 XcXu3f5XvLf3yFRZEpw7XaIVDjxFhqoUwfLasKdkF1jUEINUgqJ9oImoX+YnCmQQ2F7En7Qeuw
 1tNUrkuf3UZzmxiunvMXPcVDkz/5vFYkSRy28IkvkvLuFwo7NedmeMNdavzzXPTmvAAAA
X-Change-ID: 20251101-b4-as-flattened-0b3e0f566836
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: beb273d0-9f62-4f85-e433-08de1b55c61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlQvNUN5VFFHTlA3aG4vamNobGFQK28xK3Nid3lYTStxSW1TeWRVNXNYc3kw?=
 =?utf-8?B?U1NnYU9Ea093RVJOVHlTQ1VoM0hoRGJIWmExQktiSEVVNEpxRFhCVTZmcTEv?=
 =?utf-8?B?Zzk3ekk0WklYM2oxTWxVTVIxTnBqeGFMQjVtMlgvWFZoSU1VL25HdDgyL05X?=
 =?utf-8?B?SUZKV0ExaW8xWnp6SERMNFQ2MjhYS1l6RHgvbXRMWlRlMVEzYlNGQjlOMERJ?=
 =?utf-8?B?T3M0Z2ZsRnVVeGorNE1sVzFvTjZQL0dMMWtvRUZaRWx5VGtBNVRRRHd6MGtM?=
 =?utf-8?B?QUhkbEh5NlVFT1hNVWJadVdGS2l0cWN2Yk92VE01dWtTdjZlRWNVRTJsaDlF?=
 =?utf-8?B?MkVVOGRlMzZPeVFMUndjZHpCUlRCZ0poQmtadGRXYkVrWm10cFFmc2YzTWZr?=
 =?utf-8?B?NVJabVZTNGNZWUFvcjFoby9qODdRRlRSQjRRRjhSTFd4UDJadnczZkpUbHZY?=
 =?utf-8?B?OFRkeUptd0RmR3lzbm5rNkNhMlRHQkYydC96U2VHRTFhQkgwTWdHbjBaMnFV?=
 =?utf-8?B?bitCVjRwNkw1ZStqcjVkaW8vMyszY3hvbW1Gazc5VGVUY1FIMEo4RkVoSkJE?=
 =?utf-8?B?dHB4ZmIxaUo0amlxcWpuY2k5MlYvOFo4RWhPdHdDSEFvTFlKMzFQcGlCZWZ1?=
 =?utf-8?B?ZGV1N3U2TUcrZmN1anpHUkxxZ0FSWFZFcWhMU0xNTXV3TFMvWW1sc1JlaDU1?=
 =?utf-8?B?YUhSbXdmTGdRVSs3aUgrTjZTUjdJSTZQUkpTUHhFa0Q2ek5oZy9SOTUvekRY?=
 =?utf-8?B?UDVTdnYrRHluTXUvcnhGZWpteDdXOGRLYlcyWjVYVmNjWWxzellUZ1FPRlp1?=
 =?utf-8?B?WGJUc1hXZy81WGlINzFlSjBrUFlDbUlHdDdaMWV1TVc4ZWZDNE1GbXlpOU1u?=
 =?utf-8?B?d1hoUW1TY2pwbU9NejJGNlBPTWM2Y2NjeVRVVm9oRmNRLzF5bTJCR2V6UWhG?=
 =?utf-8?B?djdZOGdVdE8wS3ArQlF6ZGFFUHBKaTFqKzJnVVFQcGJWTlNqd1NQUy9NZC9r?=
 =?utf-8?B?ek4vSksvL2FLNVBTU0hBRmZrMWUzNEhiZ3VvaWxsVTJOWVMwbFFtK0p1S2Jz?=
 =?utf-8?B?U250c1dZUWJLTEhJYm9LNTlyNEhQN01MMWJGVm1BcUVIR2taTzBtSzJ5Y09E?=
 =?utf-8?B?L0NzREVPbzE0MTFqU0xhUnVIYngvNUV2VGlQZlFUb2NQbUFXdmlWSEdjSGxC?=
 =?utf-8?B?ZEI2bnVBemx3VCtuS2xrcGhuU3Zid0U0ZGpBOUp6V2FXQ05rclpKUFFqL3BQ?=
 =?utf-8?B?NHg0WERQYUNYTUhJNmJ3STdIM2l0bzNvZjM1eW1VMzYyUjE3dEFiQmdTUzcr?=
 =?utf-8?B?R2VGMWFqTUt1QjZUMlhPaEZ5K1RDTWRJSTlJMEVpOEpBT244VkdweFY2UEUw?=
 =?utf-8?B?ZEdqMFJOY3hSVVFJNmVoRXBtQWpLUjFaZ3lwYUQyR0VQNTJFYkkyREVLL25x?=
 =?utf-8?B?SVFZcE84L2JaaWZjU08veGN1RWExL3ZUeW83QWJkczBrS3N6RVNka1oyQWxY?=
 =?utf-8?B?bFkxUVpPZmRYU0llTVVkWkRwcVQ4QTRRWjJSYzJBSEU3QmVaQUlleWFzL2Ur?=
 =?utf-8?B?YUJlQ3lkVW1vK1hhS3lyZFVnZWxqVzR6TlFLeFc4YXBTM1FPNWk3aFhHNXd6?=
 =?utf-8?B?L1VaZU9WWnVDUkJDSUpxTGIzVzVTZGt0UXpUYVZqTWJveWhnTVI0MWVTR25X?=
 =?utf-8?B?NU1pYXZYUUtGNW5nNm1vVHdmUGpRVGErb2RLNG9jTzVpRjJBeTd3NUVBT2pK?=
 =?utf-8?B?SkxpZU5PZzNvaGRlc3FGbk4rT2U1QjExRXZJT2k2clhmSWI4K2czVlVJQkJy?=
 =?utf-8?B?RDFkN3J5NStSd3lHVk9LM0hmRG5xOEk5LzRWUTd0czJzam03YVVoY3YwRDUz?=
 =?utf-8?B?UVV5SmNMdFdJZVVOOTI4TjNoRjBMc2RsQ2g4VnhjMHJEZWg2aFlHUkI3Tk80?=
 =?utf-8?B?TnhtNTNmeFhUNXNpUFM3MlVTcE5wajFWTDhndkwwTkZVWDZSS1JGY3NEdFlX?=
 =?utf-8?B?ZEd0YlhkeFVMbG8zeklPeVdHTERXNjFycHpDV2xRNWJBUU1Ga1ZCWjEzdEp6?=
 =?utf-8?Q?7eiPzb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjQ5Qy8rTDNKa2xTN2hwTE5sNWlIM3lDZVJWaldMaFQrNUk1OEt1RHh1R2N3?=
 =?utf-8?B?SDlEV2hoQ1FJcmtrUEpRY25iNytGaG9DSTNqTmVlelJ4VEprWEU1RmtsdTY0?=
 =?utf-8?B?cm92MnlQVVdrV2Q3dkxvdGFDZzMyZVFvVVRmWEswWkJ0c04rejJraG54S29t?=
 =?utf-8?B?cEJkZFFYbzFVZHA2UkE4akJFQmpRRjdQbW56VXhHOC9NMlIzcFdVaXp3MWgv?=
 =?utf-8?B?eXVuRjAzQ3RQR3V2ckFXaTd6NjBFbGMyM2hwSk45dkhoZWhmOTQ3L3A3Mmcv?=
 =?utf-8?B?NzloZEFBNCtlalpySlkxdkRhaG45YW9zaXZrd2xBcE1JVnNoMnp4MnJtNUxL?=
 =?utf-8?B?SDRGbFE5WmpTZjJRMnpKSVd3MzNmekI4SE5TaHFCdUE5ZVBCWWxFNGd2T011?=
 =?utf-8?B?UEdTR1p2dlNNQ0RZblptM3Awb3l5N0pmV1VVQkpvZnBiQUc0Tll2T3Y0cWh0?=
 =?utf-8?B?NTNNUjRyaVNhbm5GbXpBZ1NiWGpGdUlDekNoQnRJc3pUWUppejZ1cC9KM2w5?=
 =?utf-8?B?aHByU3BCQXJBM0diNEtQTTJMUSs2SEYrOE5CN1cwTEdCV01JbHZDN1ZoVytp?=
 =?utf-8?B?b2JSTmMyRUpTRitaM255WDIzeWl4WDdiVUNIRXUxdG1TWmhEeUlZeCtUZ3g3?=
 =?utf-8?B?cVdFRjdacXBjMUMreUw3TXlMcFgxeklJWVpNYzlrOE5aMDkveWZEZlJrUGc5?=
 =?utf-8?B?cnNHMnVJekdjdW9XQVI0cVRZRjliSXdWTTAzaitJbGZDdnBSTTlKTjlQMDd5?=
 =?utf-8?B?T0VSUkVoRGZlcmRFTHhWemZ6bGJVMUdzQWtCMVV5aU5ONmMwWjVsb25kMU9Q?=
 =?utf-8?B?ZmFNTFlSOWMzUTJuT0RNWWYzVFF0UjVFSGt1TGg1Q1JXcy9MTGJWMFBGT1Vv?=
 =?utf-8?B?Qk04SXhSK0pydU5RTHBwMkIvT0ZYTDA1cDdzaVdHbnpVSDB4Sk41ZWh0M3Fr?=
 =?utf-8?B?ZlNPWWpzYXUwZWJmMXpiZWVRQ0JFdU9DR1R4Smx3VzAwLzhDUFFiUlVxMkJ4?=
 =?utf-8?B?WGtxVDZLcHZKM2tZUFRHZVAwc0xlc240RXJYQnZBbVlSLys0U01zNXd4azhk?=
 =?utf-8?B?MUZmZHFmTWRpVHlMSG94MjgzbEx1Q3U1WTI2Z2QwQkV6djBkRS94eEpDa0dG?=
 =?utf-8?B?QjEySlpGNCtHVTdvQk9NQUtVYlIzRDVvRHAydlVpcm9qU1VMQU1ybEhFMjhj?=
 =?utf-8?B?MEZkNGo3bVljdVJrelU1SlFoREh6Wk5GcElPQlVsMUY0eGV1UGpiN1ovSE9E?=
 =?utf-8?B?dmhVUTRWYmJPdmUzWnZtTWJia1RpcWsvNm4zcHo3Tm5zRDU3UmNyR1BOWTZv?=
 =?utf-8?B?VUVIdjRvVGttc3lLN1ZGRVdWL0g0Y1Z3U01YdUh3Zks3dDAwR3BwaDBzWHVa?=
 =?utf-8?B?bnNlM1gyN1U1S3IzekNHL00vcjUxWnBvN1RKZ0djYW5RNTB6Q2hZWjEzcXB6?=
 =?utf-8?B?bjlWajVRb2dXZHczTStzeTE0SlNIQkQzSXhsdEt0WTNYQmZZT245NTU2TWZq?=
 =?utf-8?B?Vkdlb0NqelA3THloOHMzaU5lcVI5dzVEZi9LT1lQTml0eHdMZTBaTFZWKzRT?=
 =?utf-8?B?eFNoQjYrWHNpNklYWWk4QnFKLzhCcXFrbXVQazVyRUYrZW5YWmUzcXdyZmp6?=
 =?utf-8?B?QkJKVmJjWmpSRXBrSGxhWnFWV1VZekNDWXJUTEY0ZFpKTTNqZ2RXbVRkNXpM?=
 =?utf-8?B?T3BBWGJGdGIyVm8wV0syM2xSUmVuWFRkYkpNV2RsWVJWQ3c4R2tPQUxadWFu?=
 =?utf-8?B?NTFzZlVoRE9RY2FoUU9DZTV4M3dSd0VXRUlSRUFyZGs1VGczVHhOc2VIQXor?=
 =?utf-8?B?Y0MyYkNQUzZUZExGaXRiWGtxUlZwd1k2U1h0RXN3dHh4VnVQVWZzZGVhVFZP?=
 =?utf-8?B?UFlHcVNsMVZiTEtlR1NBZ005MlJDeE5odEVCNjNRUkgrZmJLeFdpSUcxK3R0?=
 =?utf-8?B?Z0lGOEIwb2tMM0Q1SG04T0ljemFpWXhTd25qaFVVczVkTm5iVzlaK09XNkY4?=
 =?utf-8?B?T0d5blNFaFlqWG5QQ0pFNDZaU2NZM1o3Y3U3U2ZkU2xmWk1hVnc5UWNtSHFj?=
 =?utf-8?B?UDQzZkV1MjhscEYyaEYzamFuMUMrNEFDa3BzZ21lT3drUXlnUEQwbDkvVmh0?=
 =?utf-8?B?bGZkSmlVSmFEazZhL3RPRzhaUWJYUCtCdSt4Zy9vUVJqOUM3UWk3QzFKZjBH?=
 =?utf-8?Q?cuSmK05WwhKZOo4EeiGJ417i9TQ5beboUel9XT8Vxs6c?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb273d0-9f62-4f85-e433-08de1b55c61d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:53:54.5569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5fg5Fi4QZ7yHASXflHx4361YywRmtEtgcpALX9XhaZTMd5D8LNukYSFyXm70UGj0vLefqgQGocB70ycme6xkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244

In Rust 1.80, the previously unstable `slice::flatten` family of methods
have been stabilized and renamed to `slice::as_flattened`.

This creates an issue as we want to use `as_flattened`, but need to
support the MSRV (which at the moment is Rust 1.78) where it is named
`flatten`.

Solve this by enabling the `slice_flatten` feature, and providing an
`as_flattened` implementation through an extension trait for compiler
versions where it is not available.

This lets code use `as_flattened` portably by just adding

    #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
    use kernel::slice::AsFlattened;

This extension trait can be removed once the MSRV passes 1.80.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This patch was part of the Nova GSP boot series [1], but since it
requires attention from the core Rust team (and possibly the build
maintainers?) and is otherwise buried under Nova patches, I am taking
the freedom to send it separately for visibility.

For v2, the methods are aligned with the final names of the standard
library, and the extension trait is only visible when needed. This
simplifies both the patch, and the extra labor for user code.

[1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvidia.com/
[2] https://lore.kernel.org/all/CANiq72kK4pG=O35NwxPNoTO17oRcg1yfGcvr3==Fi4edr+sfmw@mail.gmail.com/
---
Changes in v2:
- Rename methods to `as_flattened` and `as_flattened_mut` to match
  standard library (thanks Alice!).
- Only expose the `AsFlattened` trait if using Rust < 1.80.
- Fixed a couple of typos (thanks Miguel!)
- Link to v1: https://lore.kernel.org/r/20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com
---
 init/Kconfig           |  3 +++
 rust/kernel/lib.rs     |  4 ++++
 rust/kernel/slice.rs   | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.build |  3 ++-
 4 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index cab3ad28ca49..7da93c9cccc3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >= 210000
 
+config RUSTC_HAS_SLICE_AS_FLATTENED
+	def_bool RUSTC_VERSION >= 108000
+
 config RUSTC_HAS_COERCE_POINTEE
 	def_bool RUSTC_VERSION >= 108400
 
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3dd7bebe7888..2581a356d114 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -21,6 +21,9 @@
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
 //
+// Stable since Rust 1.80.0.
+#![feature(slice_flatten)]
+//
 // Stable since Rust 1.81.0.
 #![feature(lint_reasons)]
 //
@@ -128,6 +131,7 @@
 pub mod security;
 pub mod seq_file;
 pub mod sizes;
+pub mod slice;
 mod static_assert;
 #[doc(hidden)]
 pub mod std_vendor;
diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
new file mode 100644
index 000000000000..6ca91a4fd1f2
--- /dev/null
+++ b/rust/kernel/slice.rs
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Additional (and temporary) slice helpers.
+
+/// Extension trait providing a portable version of [`as_flattened`] and
+/// [`as_flattened_mut`].
+///
+/// In Rust 1.80, the previously unstable `slice::flatten` family of methods
+/// have been stabilized and renamed from `flatten` to `as_flattened`.
+///
+/// This creates an issue for as long as the MSRV is < 1.80, as the same functionality is provided
+/// by different methods depending on the compiler version.
+///
+/// This extension trait solves this by abstracting `as_flatten` and calling the correct method
+/// depending on the Rust version.
+///
+/// This trait can be removed once the MSRV passes 1.80.
+///
+/// [`as_flattened`]: slice::as_flattened
+/// [`as_flattened_mut`]: slice::as_flattened_mut
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+pub trait AsFlattened<T> {
+    /// Takes a `&[[T; N]]` and flattens it to a `&[T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened`]; see its documentation for details.
+    ///
+    /// [`as_flattened`]: slice::as_flattened
+    fn as_flattened(&self) -> &[T];
+
+    /// Takes a `&mut [[T; N]]` and flattens it to a `&mut [T]`.
+    ///
+    /// This is an portable layer on top of [`as_flattened_mut`]; see its documentation for details.
+    ///
+    /// [`as_flattened_mut`]: slice::as_flattened_mut
+    fn as_flattened_mut(&mut self) -> &mut [T];
+}
+
+#[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
+impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened(&self) -> &[T] {
+        self.flatten()
+    }
+
+    #[allow(clippy::incompatible_msrv)]
+    fn as_flattened_mut(&mut self) -> &mut [T] {
+        self.flatten_mut()
+    }
+}
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..a84b9e3171a3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 
 # The features in this list are the ones allowed for non-`rust/` code.
 #
+#   - Stable since Rust 1.80.0: `feature(slice_flatten)`.
 #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
@@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,slice_flatten,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

---
base-commit: 9a3c2f8a4f84960a48c056d0da88de3d09e6d622
change-id: 20251101-b4-as-flattened-0b3e0f566836

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


