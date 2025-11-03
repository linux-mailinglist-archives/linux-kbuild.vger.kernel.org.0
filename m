Return-Path: <linux-kbuild+bounces-9372-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED2C2CF0C
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 16:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20AAC563538
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 15:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BFD314B9F;
	Mon,  3 Nov 2025 15:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FVIBcVck"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E9314D03;
	Mon,  3 Nov 2025 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182431; cv=fail; b=mL5pDeMfKAeKAaMqJb08JTB3+tTrzxnDO0ZyhBWVoQCAbHbzhQd/tODYGoY08TepRWR0NnFGnwOH2OzAySQQtDON83Dv62jMUarvurgeMNbamWZ7vaSgo7RhOYza+xKnF9Bo7/WRvTin0H0a15P2cFXFGIzBZv9xbZ1FJh5xuH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182431; c=relaxed/simple;
	bh=m1JB2o7/aSlF/hwuRDJyOq3bWCajvq+uYU7J3UXA/o0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=a34y4axUA/LhD9tAfI4e6+GM3AsftT/4RR9AePZnL7aeLaBTjghSHawt7JixFsozk+zYgXeCZ6NdujR/M8ElbxE9Kd9JltVqFd+bb2pKbMsUSDf4T8aeUcbvcRJUyeIgebx9uqcDt9AGaRG7UpuUUnUMQSXaCho/jBYD5HNdhFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FVIBcVck; arc=fail smtp.client-ip=52.101.53.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBWNrsragh+NjrgJQCwHZ6qjRjqWYHeQJO8qhRYQR1mfKuAJ0Gw6GEIkwg8SM44W3/1b0Kk/cum+u0OAZrYiESkjJS6R+FjXLgE+NihRwW/wUhjOnmiPvQNau/TMyKi+S4kvmf0baQasqQLy1rsbn312C8N8iwQsXp8P1h2wgIGtkJfFzRmFrIsQB3Cccu5Qc0K01nU7KuJebcfzHc5SaXxaf4tV8hBSUtW6Pk8dtVhXWg4Z3maRNoZW/C/NqDAS1lkNn34wTJIIeyrStet1OeMr938gj6DFBVBMm5Fu80C8qmGasdJ9vk6fE9kaJMuOisLtFeKABFBhqUEjgf2Iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbewZsLvQ6D08x/PAKygt2hVfTzXNwW6OlRJedxCycU=;
 b=epEPyakj17spqsT600+DDlaHeO/z/8hit+q+EeU4nDqzQVpTA2GHmH5sD+/ncfD9f8mYgV0u4kl/OB1OEGAUWBQcK/N7nQwz5q07rCyKnvwa/lHlI/Gmkavl0/r5+oonxtKqZAkKbRiZd7L1oDdv1qmHKmjeLuZ+xttMqW2XYGcFmgYmkTWeP9D/I762z4gUdNqE8qSBdtkJg0y7Q4xKdNRdzJ2h+/truY00qgZg5sWBQ7a7MhPJsRSE3wQ8IKlFASvZt9SBM47jlEJlcdiQCN7CXDnWnkgOt/uxe4cEGScaRGcnp5h1rsvUBOLeWpR/mHSDvlXe2BBMwJ+AoIzrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbewZsLvQ6D08x/PAKygt2hVfTzXNwW6OlRJedxCycU=;
 b=FVIBcVckBHso/URZLTXoxwi6BjHOAe82qltlOZqTHLdZtcG8r5TfYITGXIlNK3A0asHpXoFAX9Pbv4sEUqR4vMKeyyjZbXWg3A/ABwL6yWPlRpcYpUPGW46JojBcRHM+VLZHSjLzgdZjatgrmbAw+uC9lwaFi5H7DboGV6PRoaF736AWQSZMT8DLccywkzYgNH39y8bfDZ4EuJjKRW1JAJ9RBRS9LgoA0we35RAwV2s9MWUHoone7kOYg4vx8/CpXN7BKyer7/+5g9HY/rKSf+gnIkim8ER4NPq0DpTcWgEpcxuLxiaElhLyxBp1I49pDvC+Mvg56z0OqkbeadObvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7121.namprd12.prod.outlook.com (2603:10b6:930:62::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Mon, 3 Nov
 2025 15:06:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:06:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 00:06:54 +0900
Message-Id: <DDZ5J5OC26UH.1B8CGNEJGRTS5@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract
 it through an extension trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
 <aQiCeZE7eN_KVdZ5@google.com>
In-Reply-To: <aQiCeZE7eN_KVdZ5@google.com>
X-ClientProxiedBy: TYCP286CA0314.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7d0cdf-06ce-429c-e427-08de1aeaa28f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGZ2KzR3UGlKRG9QNE8rVjZYSzJvVGpSdUVWbk4wcEt0RXNyaGFESFplK3JG?=
 =?utf-8?B?bDdXVG1wejVtQ2t1WEw4eGxhRkxMTTgxSXdVbW5TdTBvdlIrVERZOFpCQzV0?=
 =?utf-8?B?SDNDTVpkVkFHa2s5ZnlZRUtUMG1Ua3dRbW5aWEU3MGRNT01TeFlId3hiWkZQ?=
 =?utf-8?B?UGQ4WEdyVnB2WlZVUG54bHZ6anR5NmllYzVkcEozVk9qRnp6MGwxTjlUVGNE?=
 =?utf-8?B?U0tuNjZONjVQWEw2c1doOWVkRXQ4QXYwTE9KdFVHMTM4ZzI2eHJKSFhUTU1R?=
 =?utf-8?B?WVRGektUNGVGQjR2WlBzZmlKWEM5YUZ5MFFmQnhFRVNoY2Z4Tlk5dFUwZExO?=
 =?utf-8?B?aFpmR0tvc1JSbW9jK2lsdGx6ZnRmQXdMT3BGb3RUSkdiTEt5ZWl3ZlpObTlG?=
 =?utf-8?B?VC9ETWowcFZ3cURWSUFhVTdNVE14TjM2Z0RzMnBVTFlqTGpHNTJxT2dWbjB0?=
 =?utf-8?B?VkFTMXdYbWZMU1dwdzl2c0w5NzVudHhyZ3FhQ3Q1WWpQU1loOWEzRmN0d2Qr?=
 =?utf-8?B?QmIwbmRSdDloQzlwek1KMExWWVd1R2cycGFOcCtLTW1xN1pLVWY2V0p3WjZK?=
 =?utf-8?B?bnYwbGNiOXBZWUgraGV3bDYyU3paWlJibHVaMmRhY1d6amdQU01QcFliNXhW?=
 =?utf-8?B?aUF1c0JYSllrNG1PbC90Z3hCN1ZOUmFLTXM2Q0VsUFVzVzBEcmJxdTZXOEdN?=
 =?utf-8?B?bFlUcE8wd3BkUWZEVHZZMEhlYmxVMTJYMnA5ZkIvMWxZOXRlNjFKQ0tldnNy?=
 =?utf-8?B?SEdHUnZGN0NvUjhKeVAvRE5GSUhnbFptRlBHU3I2SXIwNGVublNPY25zZklB?=
 =?utf-8?B?UWswTW5pbmMwb2NtZFowZG94NGxwalNja1crNCtLRlF4STV4U2l5VllOVW93?=
 =?utf-8?B?Y1ZJWWFjekhlWTVkZzNEU0U3ejRFQzVRZ3MwUU15Ris0REU0WFZsZ1BxVndw?=
 =?utf-8?B?QVVRdWhkMW93M3VOZkhTTGdqdzRCZnhmU2o1Z3UyaHQzZFlacjA5aG5xNk5W?=
 =?utf-8?B?enFsQWl5RWxmdUowMWx4em53Y1ZGZGdic1RabEZ4OENoajlIcFZsMXBXMnRO?=
 =?utf-8?B?bk5XK01CbktSaUloZW1DTHVEWDAvVDF4KzhFU0hVa0tlbjdNVERiTDVpTno3?=
 =?utf-8?B?eG1VeWIySWhUbHhmaWtlU1pnQ3ZQbUR4RG95NlNhRktuUTFMYzZoMHdZM2h2?=
 =?utf-8?B?ZTBBM3h0U0tWZ1l5dWZEcDhDR3lhT3VtNDFVaXZVcjFSWHdFa1Y0d2RmMllM?=
 =?utf-8?B?SDk1Snc2aE9NdmYvQW1FSFRpeHI4WnpTbmwxSzJMYm5ZNE5Sb0RhNXBDYmJx?=
 =?utf-8?B?ZnBxL1AvUDRmbzU1SFVlTmEydnl3UUROR2RZUW5SUEZXdkdUSEJIYXVVN3pz?=
 =?utf-8?B?RlRWd0JoYVhkNlFYWVp5dytBS0NwSUtUU2VwWHE0NEdKaElidW4wWUIxeGRX?=
 =?utf-8?B?SWdaaEhvd2U1Q1N1d25KNHhKRm5hZ3kyQU0xbTJsRFUzelYrQkMvSjc1Rkp3?=
 =?utf-8?B?dERwcVZsejRmb3NuKzhWR1IvSkZxU3MvcG8yczg3eTVaYWpwVTVPNHc5bFRq?=
 =?utf-8?B?Y2dOSUlBemxlUGhFd0lxQjc4Z0pZamh3aW9jaWNVckIraHo0YVplVGVQcFk5?=
 =?utf-8?B?YVdCQm9sNkZpTVM0bXNnK0cvVkhzS1lQNFFZR0Z2cENXUU81NytJSW9sN0FC?=
 =?utf-8?B?SFRJbUowRDZJdXpsWXhsYU9hVzhoVFdRQWlTeE9YN3ZydUk4aDBuSVFqZGFw?=
 =?utf-8?B?YXFhVGR3MUp3UmVaQ05tK2lYZkIrVnFMWEY3d0RPL0FCQlVCejc4cDFwYlBE?=
 =?utf-8?B?S3JzZmU3NmRTVmdCRi9SclFKem1YUiswbmN2LytYa0lub0h0L24rWjdtYVd4?=
 =?utf-8?B?OEtmLzNpNFRkczdRWElTUSttYkxvTXFzWEprVFY4TlVGTzF6ZlRiSjZESjdP?=
 =?utf-8?B?WVRHcjFGYlU1YmU5WCtnS3d6TDZmN3JPUTZtRkVpNVRIb3VpU0FmRjIrV1NN?=
 =?utf-8?B?VzJ4MWdBVjFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWtzemgwR2RoZU5idEYyM1lkaWdpc1o3VE9zRmdsZHRJRlA5TjFoYTJsa2M4?=
 =?utf-8?B?NWppSkRGZ0VwYzVUR2ppcUMwdGpzWTM1SjlPek81K0pHSTJyNUsrTmNxeUI0?=
 =?utf-8?B?Z1RFRjhMaWhoVWJJNDUrc2FiNEFoNjZWNnp1T3JhWm5ZZVZTKzUvbkNxOFNo?=
 =?utf-8?B?UXVmeHgyKzRHbGc0VXZpVnJNdWxubmxhbWZoOXBJaVp4b0xsVmhTUlZSWlJy?=
 =?utf-8?B?MWtMUldaNXdNSnRwbk41emxJdEFoVUNMOGhHdXc3WXhOUGpTNi9ST0ZFYzFk?=
 =?utf-8?B?QkdoeHdHWlBiYWs2ZkpKU3Y0K3Vqb0ZNRHdCUzhXblVIdHNNZEkzSHpLR3JI?=
 =?utf-8?B?UjR5ZEt2WUdUYVBOcHQzdlUzYnFiOGZGcDNpSXdjS2h4YlMzcUx3T1RoK0dV?=
 =?utf-8?B?ck9HZEVPUmU3aFZ6eWs2NW51d3RWQjlDSCtRR2c2QWU0ckhsU0lHWThJaWJl?=
 =?utf-8?B?SDdMZm9sdk5uaTFGWEhyaFZPTU5ZTXBXRFM4QTMyTmV4U3FWUHB4NFZMMkN4?=
 =?utf-8?B?WllsU1lOc2hUbitiVmxROXlGSkF3L0duRXVFcWhLc1FqTjBUT0QzWEZiZ2sx?=
 =?utf-8?B?cHZ1cHhSQVZBMVNQMkVtQ0Y4WWlxU0FSYmVUTmZWSDlidm5RY3Z2SktJZUJ3?=
 =?utf-8?B?WTV3UkV6ZzRwZEJHWVlNZ29GTUVFNW93bDlJV0ZzVnJ0QzdGeFE0YU9McU05?=
 =?utf-8?B?NVhZbFJsSlJZcE9RaVNFSUZsSkdDVkxvTHRmOUVNR1VyclA3cVVFN0djUG9R?=
 =?utf-8?B?bXFrQTdqbmVjZzhKTXZCcE1HVlFBNU9hanpQcGd5eTducUQ2SG53RjBUeGh4?=
 =?utf-8?B?SEtwMnZDM0JuWitCSnJTSkZ0S1dTVUdoRGpzeG9EZzVmU1k1dXJSb0tXWDRJ?=
 =?utf-8?B?TFFmajE3d1B3b25RRFpjTGxYdUJyTUk1MjZnVDFjVzlGRzRRWUFkSlFkNlp0?=
 =?utf-8?B?SmlqejVlUSt1a3Y5bVh6V2NaSlVDUU9neEtPdWpDNkRiUC80Y0FlbWlEVEh6?=
 =?utf-8?B?L3U4K1Z4Ni9yc3U3Z0puU3NpZ1JKR3RwL2NHSXBRQzl4TGVITjZyRUswVU0r?=
 =?utf-8?B?YnNqUVlsVFVmWjhsLysvMUllTFVtZTJIMmZsLzgySnpXU0hUT2hTbTJwTFg1?=
 =?utf-8?B?eFNKdFcvR3pwMHFIRTJFTHhrNitobGovU1NJekg3aWErZWtPRnlXK2pGd2dr?=
 =?utf-8?B?d29Bb2JaK1ZxK3BGcGxPM0xsS05GU1Avb2tVOWdjb1VaajB1Q2FvU2NWRE5T?=
 =?utf-8?B?eXlDUjVKMnh1bHF3LzUzQWdlK2pkbFBJUUZ5Zi9TeExNN3ZWOTRGTFpCWmdG?=
 =?utf-8?B?eDdTYkxmUnU5cjVqTjVLbEJ0a2VkY3luWVlMaThJN2xNTEY0cDQ1UWJlU1NO?=
 =?utf-8?B?Z3RiSVRkaFAySEZpU05DZklYN082Yzd5eitZVEU1YWJweWllZ0wwajJMN3ZH?=
 =?utf-8?B?YmJSQjdIL2ZFMmU5VnEzOFQ5RTYxN2dzTE1qVW5Wa3BjSjl2bTNFRTJxRklS?=
 =?utf-8?B?K1IvR1pzc1cwVzRrc0NqUmxYWUFVR093RWUwaTdDa1g3Nmx2a3NPcUNCems5?=
 =?utf-8?B?RW9kb1NwQTl1YXZwVm96YjJ2RVhwNitVU0JoU0h4dytIdUczV0E0UFlQTGM0?=
 =?utf-8?B?ZnFkQk1Nelg2NVhhQnVDalM2ZXVGdUowWWlBOGp1RXR1VEZVQmhQNUs0aVRt?=
 =?utf-8?B?VEdpaUduODBuTXduTzJveG94WUtIWVB1Q3JJUHJRY0Zmci95VTRSUFc4RFdP?=
 =?utf-8?B?aGVUVVU2eWpiK2U0TWRxbFg2bmF0UVh4NVNkVDgya3Ywb3c2Z015bEhKRVRP?=
 =?utf-8?B?WnN4TXoyblRDbWRLZDJ2ejRKbm41bjJyeDlqS2ZXWmZBRVozV0tmUDVpVmY3?=
 =?utf-8?B?NTMrcGtlS1dxV1YzV3VHWWhNVWRCMG9YRGpuNmgwUmdBdEdxTzQ1L044SFlL?=
 =?utf-8?B?SVRjc1lDWjFlN0QwRjQ1WVA0Uk5aT1dIYmNBaVBwNzd0cStFdnFnc3lwNlk1?=
 =?utf-8?B?Sm1tZU44QklpZ3R5RElRb2FSU3pYUFN5N1NQU0tnSVYrSW1ZbFFFTnliblRJ?=
 =?utf-8?B?ZGhONy9WSHpkOE1DWTJUTjZmRVAzcVdPZVB1a1hGOGJzSDltajduTks2c2Zu?=
 =?utf-8?B?ek83RjIySURFVmp2TEd6NGtWV1dTRjVrSkFhOERFZmh5RzBoUlhFUEtIQ2NL?=
 =?utf-8?Q?KAA3fygfmeBsOe439cfxJKcSLNDOZQYDz5xvO8/EUFY5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7d0cdf-06ce-429c-e427-08de1aeaa28f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:06:58.6942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9S6i1QYfRGCknji/sUR93NYu5ibp5DkDmt71Dhn7cNZ2VvvHluMqgiN4JpnsehGqRsju9Ff9OZWj7ZmGiAzoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7121

On Mon Nov 3, 2025 at 7:22 PM JST, Alice Ryhl wrote:
> On Sat, Nov 01, 2025 at 10:31:38PM +0900, Alexandre Courbot wrote:
>> In Rust 1.80, the previously unstable `slice::flatten` family of methods
>> have been stabilized and renamed to `as_flattened`.
>>=20
>> This creates an issue as we want to use `as_flattened`, but need to
>> support the MSRV (which at the moment is Rust 1.78) where it is named
>> `flatten`.
>>=20
>> Solve this by enabling the `slice_flatten` feature, and abstracting
>> `as_flatten` behind an extension trait that calls the right method
>> depending on the Rust version.
>>=20
>> This extension trait can be removed once the MSRV passes 1.80.
>>=20
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Link: https://lore.kernel.org/all/CANiq72kK4pG=3DO35NwxPNoTO17oRcg1yfGcv=
r3=3D=3DFi4edr+sfmw@mail.gmail.com/
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>> This patch was part of the Nova GSP boot series [1], but since it
>> requires attention from the core Rust team (and possibly the build
>> maintainers?) and is otherwise buried under Nova patches, I am taking
>> the freedom to send it separately for visibility.
>>=20
>> Hopefully it captures Miguel's suggestion [2] accurately, but please let
>> me know if I missed something.
>>=20
>> Since the Nova GSP boot series makes use of this, I hope to eventually
>> merge it alongside the series, through the DRM tree.
>>=20
>> Thanks!
>>=20
>> [1] https://lore.kernel.org/all/20251029-gsp_boot-v7-0-34227afad347@nvid=
ia.com/
>> [2] https://lore.kernel.org/all/CANiq72kK4pG=3DO35NwxPNoTO17oRcg1yfGcvr3=
=3D=3DFi4edr+sfmw@mail.gmail.com/
>> ---
>>  init/Kconfig           |  3 +++
>>  rust/kernel/lib.rs     |  4 ++++
>>  rust/kernel/slice.rs   | 63 +++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  scripts/Makefile.build |  3 ++-
>>  4 files changed, 72 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/init/Kconfig b/init/Kconfig
>> index cab3ad28ca49..7da93c9cccc3 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -147,6 +147,9 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
>>  	# https://github.com/llvm/llvm-project/pull/130661
>>  	def_bool LD_IS_BFD || LLD_VERSION >=3D 210000
>> =20
>> +config RUSTC_HAS_SLICE_AS_FLATTENED
>> +	def_bool RUSTC_VERSION >=3D 108000
>> +
>>  config RUSTC_HAS_COERCE_POINTEE
>>  	def_bool RUSTC_VERSION >=3D 108400
>> =20
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 3dd7bebe7888..2581a356d114 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -21,6 +21,9 @@
>>  #![feature(inline_const)]
>>  #![feature(pointer_is_aligned)]
>>  //
>> +// Stable since Rust 1.80.0.
>> +#![feature(slice_flatten)]
>> +//
>>  // Stable since Rust 1.81.0.
>>  #![feature(lint_reasons)]
>>  //
>> @@ -128,6 +131,7 @@
>>  pub mod security;
>>  pub mod seq_file;
>>  pub mod sizes;
>> +pub mod slice;
>>  mod static_assert;
>>  #[doc(hidden)]
>>  pub mod std_vendor;
>> diff --git a/rust/kernel/slice.rs b/rust/kernel/slice.rs
>> new file mode 100644
>> index 000000000000..7e837bec4bed
>> --- /dev/null
>> +++ b/rust/kernel/slice.rs
>> @@ -0,0 +1,63 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Additional (and temporary) slice helpers.
>> +
>> +/// Extension trait providing a portable version of [`as_flattened`] an=
d
>> +/// [`as_flattened_mut`].
>> +///
>> +/// In Rust 1.80, the previously unstable `slice::flatten` family of me=
thods
>> +/// have been stabilized and renamed from `flatten` to `as_flattened`.
>> +///
>> +/// This creates an issue for as long as the MSRV is < 1.80, as the sam=
e functionality is provided
>> +/// by different methods depending on the compiler version.
>> +///
>> +/// This extension trait solves this by abstracting `as_flatten` and ca=
lling the correct  method
>> +/// depending on the Rust version.
>> +///
>> +/// This trait can be removed once the MSRV passes 1.80.
>> +///
>> +/// [`as_flattened`]: slice::as_flattened
>> +/// [`as_flattened_mut`]: slice::as_flattened_mut
>> +pub trait AsFlattened<T> {
>> +    /// Takes an `&[[T; N]]` and flattens it to a `&[T]`.
>> +    ///
>> +    /// This is an portable layer on top of [`as_flattened`]; see its d=
ocumentation for details.
>> +    ///
>> +    /// [`as_flattened`]: slice::as_flattened
>> +    fn as_flattened_slice(&self) -> &[T];
>> +
>> +    /// Takes an `&mut [[T; N]]` and flattens it to a `&mut [T]`.
>> +    ///
>> +    /// This is an portable layer on top of [`as_flattened_mut`]; see i=
ts documentation for details.
>> +    ///
>> +    /// [`as_flattened_mut`]: slice::as_flattened_mut
>> +    fn as_flattened_slice_mut(&mut self) -> &mut [T];
>> +}
>> +
>> +impl<T, const N: usize> AsFlattened<T> for [[T; N]] {
>> +    #[allow(clippy::incompatible_msrv)]
>> +    fn as_flattened_slice(&self) -> &[T] {
>> +        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
>> +        {
>> +            self.flatten()
>> +        }
>> +
>> +        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
>> +        {
>> +            self.as_flattened()
>> +        }
>> +    }
>> +
>> +    #[allow(clippy::incompatible_msrv)]
>> +    fn as_flattened_slice_mut(&mut self) -> &mut [T] {
>> +        #[cfg(not(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED))]
>> +        {
>> +            self.flatten_mut()
>> +        }
>> +
>> +        #[cfg(CONFIG_RUSTC_HAS_SLICE_AS_FLATTENED)]
>> +        {
>> +            self.as_flattened_mut()
>> +        }
>
> Hmm. Why not have this match the name that this was stabilized under?
> That way, when bumping the MSRV, we can just remove this trait without
> changing the callers.

I expected that doing so would clash with the methods of the same name
in `slice` on Rust >=3D 1.80, but instead I just got a warning that my
`AsFlattened` import was ignored - it looks like Rust did the right
thing and picked the non-trait method by default.

So all we need to do to make your proposal work is to make the import
conditional on Rust being < 1.80. And we can also make the whole trait
and its impl block that way.

That would actually be much cleaner! Thanks a lot.

