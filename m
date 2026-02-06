Return-Path: <linux-kbuild+bounces-11068-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BiGMpVphmnwMwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11068-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 23:22:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C358103BBB
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 23:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FF703012845
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 22:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292C92EAB6F;
	Fri,  6 Feb 2026 22:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nlKXCt5N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FE23183F;
	Fri,  6 Feb 2026 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770416531; cv=fail; b=upDERN/ULU2LGXNSTTdPNIw6SNAHjBRwj6tXGfYEy68o239L3AUThyM+gPfRq+wbQXyUbp0M4AuhF4KAn+gqIjHxCIP/fdly3woyigVHQ4t/oQr2raf90NP+XlqWbK1gy/1s2Y7pSciKF3Ue5HVWfrg3uy/PD9L1LhCla4aZXYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770416531; c=relaxed/simple;
	bh=vBZ3KlJyxHf6E4LGWOhZ378g497AkC03xw/V9wJUtdc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ToYH5NsFTf4iK5tBsgit1L7ymzphcf5p+oXVqM9lAxG/Y0MDL3lidshEUzeDbz8Dn0+79sVlSnO3BEwzUSVscI5g98C2mLA0TFVm+WLF8c8nE8uVYBGyfiP1WLOhhc9C6bAoRqHVVj3b+ovqNe7O5aSnaSUgIMCLHlaypreopSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nlKXCt5N; arc=fail smtp.client-ip=40.107.209.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEZYX+V7gQrsyRiI+CdwRRV7VgcVqR/sMSTRhUNTIKnf09tpuYL3e9annNiucE0FVFQJnhCgvwrcvaIMCvx5tn/HGklX/YGyoTjEjI3AmC35oDasdKQFZ8Dk6Z6FIEubCZTTCF9UgV/LdHWpj6T5DJ0py70yb7JeK3Fu9sYZetx95dgiDfXCM1Ya/V7bXOQUZiCYlDZIIaqGZZnR59LpH0N8T86zKOXAJUJolOvgx1PFtkA44Kkbu02UauzfMpdawaqdjIKgz0393utQz1R4ZKZGqRRhKG3f9+WADoJhU0QUVZP3WNPvmgfrAGo+RTjfgKshqiLo4O0mVdP3C+WlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORnYHqIWydYkSOkgyimSNypIZzlR22Dxpv8+ab84Iig=;
 b=iDc1gTZLYn62RacNdP65dmTfeiaT1Ncc+LmUOYyryyXZI09woYStxmdUM+mLHEmiHtLs8k6KMkc2Lg/fSaoO6Z6UDMZOHnbK+Jsd047VJ+bE26R8vAYK5pCtydHaqcO0exrbL5/XMdH3DRqvDovfO9Xx9HxxTRC8YJCLDMOTilad/C2KBtp1kgBiBRazMj3YbTfp9K4lBLnrmIjQrzcJ4t6/XeWLHirRrll2Jw/dfc5vijZvULWx0cccIu5Beg3U1tMG6qQdpe27qKYCkuyKCv2tgF8N47pR7JbzQkmBO1qqnq/uH/C8bzVAyqLihHL1tF7ktlK8RvepY4eVTG91lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORnYHqIWydYkSOkgyimSNypIZzlR22Dxpv8+ab84Iig=;
 b=nlKXCt5N/t1qi3pE0b0j+V91zwkSG5CAwot2rs0ck6vJqSY0VkgxU548A9olDUm4XsVmGHXAeXNycmmGzCvu03xQquAMu4b2wNL0/eGUF0w/OoV58YwxSMQeWvkfNlezB7S2riKZk7HKkC6zbgcTcvJdjWgTy/tpGvo00RNTDIHRhwATqE4A2pup8Y21A84/TLg3igX64LlwuFNJcGF4R+LZBUlVUORXnUxhwiNu7SJN8KhHKypaFcVw3xLdarDLNzEkZoKxm+P9gHfGpZkrgc8yNIByCpc2OdgecIujIVQrUpCAnJGWDTWX5IFHzULPcGBe9JU6qHT/hNBI5KswFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9007.namprd12.prod.outlook.com (2603:10b6:a03:541::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 22:22:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 22:22:05 +0000
Message-ID: <e137e948-e44a-455e-b3a1-717865ed15aa@nvidia.com>
Date: Fri, 6 Feb 2026 14:21:35 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: add `const_assert!` macro
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260206171253.2704684-1-gary@kernel.org>
 <20260206171253.2704684-2-gary@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260206171253.2704684-2-gary@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:a03:167::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9007:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d19799-6b02-400a-15b2-08de65ce2886
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkFCSlRocTVCamRzZmRZejVkYTlNNXdrMmhjbDFaRnVTVVVJUmNJUFByYXhy?=
 =?utf-8?B?NmJDeGlZeTB3ZWR6YjI3VWh5Nk1TeG16THNHaVV4UGJvaS9FTmY1ekFvVERC?=
 =?utf-8?B?NXkrUlhPbFRjVUlHN1VUUlZJemNMQXBCM2ZhOWNkUlB5WFdnT3Q1Y0RsY0hI?=
 =?utf-8?B?ZUwxdElvTFhsUEdaVjF5U1RGVWZYTURNOXBzeVVMWDZtMzJSTmhldnlSNHdu?=
 =?utf-8?B?MkpJejZkVFppZ1RRb05uZFBCbG9weDh5dm93U1RhN0NFMFh5c1RaRFdQQWlK?=
 =?utf-8?B?UjV2Um10OXVUWG4vWDM4WU5vZllSMGZlTzd5K1Z4TE8yN2s2dkhLVjBnbmY3?=
 =?utf-8?B?UWtGek1jdHBOSGcrWWhMSHJxV3c5Qks1UGtvRkw2YmF4YVlwUGJVL3UveVRW?=
 =?utf-8?B?RzBXbFF0RE1NV3BBTlZVTEg1OWs1SFVlVVhtNldNNHJiZVc1dkx1R3RFVkpo?=
 =?utf-8?B?NDVVV1h0OFJDZGRQMjZzN284d09WcG1QazFzd1hjakhVRHZESmVGMWJTZUtq?=
 =?utf-8?B?L2d2bDJ6WUIxRXNZK0V5WGRYd1NJUGdPaHhwK1pHSWRlaFk4c1lFV1loUDJh?=
 =?utf-8?B?T1UyVnQ4dk92dG1jWG5LMWtFSHkyQm90b0FBaExuZ25jNCtJWmhJdHdaNVFy?=
 =?utf-8?B?Sk0wTUMwOXppYStwYWdhY0g0dmZGcjh5WVJZMTg0bmd0MjBKVXcrcE9US2tk?=
 =?utf-8?B?T0lydWZjNVc0dnExS1BtTW5mUWwvTkY4aER6dGpmRWZSdXYyZjVKZ2s2d1A5?=
 =?utf-8?B?dWYrQzhlVjhpTFIrenlKUjBiWDcvQkNFbW81TnoxVDF6cFY3T09QQmQ1c1Bq?=
 =?utf-8?B?TlRRNVdRVTVqZkplM1MzS2VYRTMvNnMvK001bjMvNWhRY3lxSFRzeFliM0d1?=
 =?utf-8?B?WUZGYU1uY1kwSlZWOVZjVkVrbFpvVk1NUlFkMlN5TDZBbWdkSXVOUDRPUW9J?=
 =?utf-8?B?RkMyRWFEZk1YTG5vcFVWa20zU2ZpcXJSbnNwZXBrZmdMbFBZckRWbWd2eXEv?=
 =?utf-8?B?dGdoZEVVWlVUekFjQXhPRlJna3ppYjdxV2Z2MU9WbU5oWEVaaVF1cTh3U25y?=
 =?utf-8?B?aGFlTGgzVERvUG56Y2drUTJJekYyWVhZbEhMUThQa2xROExhV2ttb0ZoNExZ?=
 =?utf-8?B?bGp1Ukh6cXllMnUzRmZySUdIaHlpUkV0U0dVSEFsemkvSjdrSjNXS1NPaytF?=
 =?utf-8?B?dlkwdk0wbHFKK1JONTFrcTNIeXFFRXJIbC93WFBGVmdvY3U3WVJ5N3hnTzdz?=
 =?utf-8?B?VTRPYzl0QllydENuRjRTMEN0eHhFMml1MjlIM2VLSTFMblJVSUZNU09VUTdL?=
 =?utf-8?B?WXZlaHZiSEw0QlhiOTMwbkZOTFdqR2VkTlhmMWtPRXk1dG1HRXRaeExpaWNk?=
 =?utf-8?B?N0tHWTBKeGxTN0NJZHFnN1VhcmJHZXIyYTZCTlJmcXRHZy9NREhjT0d4azZ5?=
 =?utf-8?B?Yk8wdzNJRUJQYnJSWUk3bFc0cHBRbWtickhYcWsvZTNIOHo0ZVV1eVo3VUht?=
 =?utf-8?B?TjlYVkcvaWVkZlBKZXhGaXJ6MkdLR3U1MHp1VlVQcjl3Z3F6VWswdXFsc1N4?=
 =?utf-8?B?SHhKUFJmTDhwTTdPSTlhK3AvSkYxY2o4Y2pwbjZYdEMzNW04THptWHVrUVRT?=
 =?utf-8?B?WGwxRTYzYmh0Z05sSlJMQ1A5L0xvWVRBcm56QVhiRkVTZFpWcGlseEdlQnk1?=
 =?utf-8?B?OUx5ZWF4cTkyS25Gdi9iRWRkTFBJVlpuMGMxaGZVQWhtYnNnZnBqbDdJODZU?=
 =?utf-8?B?NjUyaDB4c0JITVNXcmhsUGVBTVFpR1dSZDVrVjFZQlU4MHYwNlBNOWo0Y0pO?=
 =?utf-8?B?YVh1RkR4UzV1OWNpeWt6N3BTR0pyZkdQbEJCdEkyNGYxWjh5cXJpSEsycVM2?=
 =?utf-8?B?U2piUGNyWGhHTUFjMkhNMUdGRU1uUW00OHVNNGNDSjZ3aXpoV3RiSmVtc0Rz?=
 =?utf-8?B?RldXdjd0c213VzkvdkZQcW5ZSUVKM2ZZY2Npa0RoK2t1bzRGbUFhVktYWjF0?=
 =?utf-8?B?R2J2WndUSFM4N3hPUHJmUFpsTEgzTnRFbGx3T1JpSGFLUXZ3VEVLbTI2V1h0?=
 =?utf-8?B?ZU1meVJTWUUvdnlmMjVVaDVaa2NTL2JrSENIUmlVYlgrR1UzRmt0L0VJemRD?=
 =?utf-8?B?TVRPSUNLK2NHRjRETFJjYXdLMjlMUmszbjBrcXkxYzVWeTNIeU1yQjJRKzlq?=
 =?utf-8?Q?ygbLa869Lgh2JqO1jmo0MNA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnVIenFQTDlmeTlMS3MwT2VaNEs0L3RYa2VmRm9lMjZ3N0YyeUxpMlh1Q3Rr?=
 =?utf-8?B?QkgzR0wzK1BQMmo4Q2o3QzlmK2R4L2pIOWFzcGh1WC9qUzkrRm5pdnZob3Nw?=
 =?utf-8?B?elpreGJ3Wmpld05QQ0pya3FrTXlyS0YrQlF1ZUlYdWlNSTBNYUdBaWk0aUhU?=
 =?utf-8?B?WFd6U2N0enl3MXh0U2k0N0FvS1BQRDFOUk8wSDFSRDFyUXhjeXFSU1d6YUgx?=
 =?utf-8?B?YUpicHN3MkZFcFZjTlBQcEFLV2xubWFSaVdETHVsay9rV01WNnl2NHVjMjJn?=
 =?utf-8?B?ZFI0OWlCUHVSTWljT0pYRUpLQjRFczFEdVVnLzNuYi9zcWd5WlRwUHlVTHJy?=
 =?utf-8?B?QXJxQmhjQ1JwdG1qVkhIbXVna25Oa0xwKzRVTHNmcVFNRFVTclVVemxkZWJ0?=
 =?utf-8?B?dDN4Z3pndmhoazVzNk9QMjVmR0ZoZEJtdFhDZlFVdEllRVZ6WDdjSkpDNHor?=
 =?utf-8?B?WDFpWHIreE1zVzNLRlA5aUEvOERkOVpYQlJ5QmdkVW5nazU1VGM2WmgvOG1E?=
 =?utf-8?B?Tzk0ZWJqZ1czRVo0WXhDaHZGVDBPNTBMNWRvdUhMLzAzWDNqRGNhSlBPUFpo?=
 =?utf-8?B?WGJBRFVTeTJuaGV4NGlLMlFWMjExU2xDRW5pZnJYakhieGdKZVBEa3VKd29F?=
 =?utf-8?B?eEVMVG5sejFSdXJuaEVSWjZmM1hmR1pETmgzK2YzYVBwYmpDc0gzdlR3V3hS?=
 =?utf-8?B?UE1HSGZJWndsWWd3YUZ6a0hwUEQvcWlGT05pbTlTcGQrcmFBVDBoYnNSOUs0?=
 =?utf-8?B?WWVMZEEwbmhaQWZkNUlyZDhPRmxGNzE2SmpzYXdLVFlZK1NxUGpEWUx6U0d4?=
 =?utf-8?B?OEpXaURzN2cwLzBlTVlQcEZ4NDZTRmc1SmJLckU1Q3hpa0VLY1lwWGhJVDdN?=
 =?utf-8?B?UEE1cnY4QTgzY1ozNHNiUDROb1lua1BBZDVWOU5pVGdlNkYrVW56a1JUci9G?=
 =?utf-8?B?emdaU2NyN25KdGtNMS81WkNxdFovTitvTUE5bGxTRHRzT21KSU1ud083dloz?=
 =?utf-8?B?eUR5WU1jdmduZ05IcG45MW9wSkJNRWhFZjF0WmptRlM0N1I5MEhVQ1FaeHU1?=
 =?utf-8?B?TS83ZzBmL1ZZRnBLMmVoQ2xJSDNIY2xJSXV6OE0wSHR4RytxT0EyWDNmSGp4?=
 =?utf-8?B?MHFZYnZzeDlaVmMwRlczZVZFY0t4OHdtaDdoL2o1NXdFMS9LYWgzK1FMSjVt?=
 =?utf-8?B?UVNYd0FFTm90RDdJeWkxMlJJS0F3MG0zaGNnUDY0NWZoQ2Q5d3BHUStnUlNB?=
 =?utf-8?B?b1VZWXBTZXMwWGdGamp5eWltMW1VcWY3dkJ5QzV1Y1B6Smd2bUdCaHlBMTVU?=
 =?utf-8?B?NUJHbWdvdHc0SkZQTHBiMDhDOGRpNjRSMlEyTURaOTd0MVA2ekNKNTZsRFBT?=
 =?utf-8?B?dHZBVzNBMngwUDdJQnh1bjE5QWRsQW1wb1hsV2d3UjZ2Nkd6YUVDZHdsejNt?=
 =?utf-8?B?SnpLOUlkQmp3QnRsVW9EYlFvUGhlM0R0cFBzUGNzS1ZmTjZ3eWJvTXZLQVVE?=
 =?utf-8?B?Wm1oZVJiMW91dTZMd3l1SUZnNHVTaVQxRzluYTMrMFNXcVV1dWwyQ3JRZ1Bz?=
 =?utf-8?B?aFhGRUd0RWV2aE9vSG16N0FYTEtiR04rcHRrZjhNSGhub2hBbENKOUFKcVJF?=
 =?utf-8?B?TDdLbEQ0Z3JabnpsMU56SHZrbzMzMWRjT2U5Wi9lTEFNbUFwVGNiNE03bTlS?=
 =?utf-8?B?SGkyQzJHYXJiU0lnV1dDR0FCNlJlQmlXV3FsMVNLNHZCQ1BVZjEvY3FJOTkr?=
 =?utf-8?B?S2RyRVJJMnZZY29hQ1l3YWx3NTltaVNtc0dqZEFjYlpXc2oxdW84QnNsd1E4?=
 =?utf-8?B?NzdOMW5yU29vWFl6R0hHZTQzTFlCWVMwMjFnT2VLZ0M5c1p6TlRHQkp1bFhJ?=
 =?utf-8?B?VDZVWjFmN1V1U2ZFNEZyaXI2QkN0WHpjeElrV2Z0blY2TUNnY2EzRm50VEkw?=
 =?utf-8?B?VjNuYzZCNEw3bERNeTVhdFFIWFdnUnNyV0JwTTZUN0FhQlNCcHBQOWlZKzNT?=
 =?utf-8?B?U2tlcCtleFVqNUFyRU9LaUJCZWxKNmdNMEdBbTRXZVArdDM0NVdvZEF5VnU5?=
 =?utf-8?B?SWN5NHdzRWN1WWNnRE90ZUZUdDFlUVZTNDduczY5K083RnFCN3BYMlp2YzRN?=
 =?utf-8?B?UnNOWFBlUUNFTnNqcnV6aXBDSmNZMzV1ZXF2QngxMXdBdnAwL1ZnM0RabDlz?=
 =?utf-8?B?T1FVY0ZTYVZmRXA3ZlpqWHI2eUYrQ3lkQmcwWVg0a2hKVWlZb3cvaW1QTmxE?=
 =?utf-8?B?NEFvd1U2TDhQK09pdjhoNXNHVnY0R2hhOFF3MmxVVjBDeHFDZVh2WjZMNFcv?=
 =?utf-8?B?OUE0L1A2RGpydWhYcnlWcXU3ZkdRMTRMNnQvRkRnZ0NCb2dhQVlldz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d19799-6b02-400a-15b2-08de65ce2886
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 22:22:05.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKGHo6Fkw4e850GtHAzPRt+IOYdX0rNCS/99LYstzHuXcH1TDamaduTwvPrCm8EJCRe9+Fh0ZuQbFyoboLkjjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11068-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[garyguo.net,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,garyguo.net:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C358103BBB
X-Rspamd-Action: no action

On 2/6/26 9:12 AM, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> The macro is a more powerful version of `static_assert!` for use inside
> function contexts. This is powered by inline consts, so enable the feature
> for old compiler versions that does not have it stably.

This is nice. A nit below about documentation.

> 
> The `build_assert!` doc is refined to recommend it where possible.

Another piece of the puzzle...see below to continue the treasure
hunt.

> 
> While it is possible already to write `const { assert!(...) }`, this
> provides a short hand that is more uniform with other assertions. It also
> formats nicer with rustfmt where it will not be formatted into multiple
> lines.
> 
> Two users that would route via the Rust tree are converted.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  rust/kernel/build_assert.rs | 55 +++++++++++++++++++++++++++++++++----
>  rust/kernel/num/bounded.rs  | 24 ++++++----------
>  rust/kernel/prelude.rs      |  2 +-
>  rust/kernel/ptr.rs          | 18 ++++++------
>  scripts/Makefile.build      |  3 +-
>  5 files changed, 71 insertions(+), 31 deletions(-)
> 
> diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
> index d464494d430a..e40f0227e1ef 100644
> --- a/rust/kernel/build_assert.rs
> +++ b/rust/kernel/build_assert.rs
> @@ -41,6 +41,45 @@ macro_rules! static_assert {
>      };
>  }
>  
> +/// Assertion during constant evaluation.
> +///
> +/// This is a more powerful version of `static_assert` that can refer to generics inside functions
> +/// or implementation blocks. However, it also have a limitation where it can only appear in places
> +/// where statements can appear; for example, you cannot use it as an item in the module.
> +///
> +/// [`static_assert!`] should be preferred where possible.

Over what? There are 3 different assertion types. If it is actually
possible to list a clear order of preference, then let's list all
3 in order, rather than having a scattering around of "A is 
better than B", "C is sometimes worse than A", and then the
reader has to play treasure hunt to work it out. haha :)


thanks,
-- 
John Hubbard

> +///
> +/// # Examples
> +///
> +/// When the condition refers to generic parameters [`static_assert!`] cannot be used.
> +/// Use `const_assert!` in this scenario.
> +/// ```
> +/// fn foo<const N: usize>() {
> +///     // `static_assert!(N > 1);` is not allowed
> +///     const_assert!(N > 1); // Compile-time check
> +///     build_assert!(N > 1); // Build-time check
> +///     assert!(N > 1); // Run-time check
> +/// }
> +/// ```
> +///
> +/// Note that `const_assert!` cannot be used when referring to function parameter, then
> +/// `const_assert!` cannot be used even if the function is going to be called during const
> +/// evaluation. Use `build_assert!` in this case.
> +/// ```
> +/// const fn foo(n: usize) {
> +///     // `const_assert!(n > 1);` is not allowed
> +///     build_assert!(n > 1);
> +/// }
> +///
> +/// const _: () = foo(2); // Evaluate during const evaluation
> +/// ```
> +#[macro_export]
> +macro_rules! const_assert {
> +    ($condition:expr $(,$arg:literal)?) => {
> +        const { ::core::assert!($condition $(,$arg)?) };
> +    };
> +}
> +
>  /// Fails the build if the code path calling `build_error!` can possibly be executed.
>  ///
>  /// If the macro is executed in const context, `build_error!` will panic.
> @@ -74,7 +113,8 @@ macro_rules! build_error {
>  /// will panic. If the compiler or optimizer cannot guarantee the condition will
>  /// be evaluated to `true`, a build error will be triggered.
>  ///
> -/// [`static_assert!`] should be preferred to `build_assert!` whenever possible.
> +/// [`static_assert!`] or [`const_assert!`] should be preferred to `build_assert!` whenever
> +/// possible.
>  ///
>  /// # Examples
>  ///
> @@ -84,24 +124,27 @@ macro_rules! build_error {
>  /// ```ignore
>  /// fn foo() {
>  ///     static_assert!(1 > 1); // Compile-time error
> +///     const_assert!(1 > 1); // Compile-time error
>  ///     build_assert!(1 > 1); // Build-time error
>  ///     assert!(1 > 1); // Run-time error
>  /// }
>  /// ```
>  ///
> -/// When the condition refers to generic parameters or parameters of an inline function,
> -/// [`static_assert!`] cannot be used. Use `build_assert!` in this scenario.
> +/// When the condition refers to generic parameters [`static_assert!`] cannot be used.
> +/// `build_assert!` is usable in this scenario, however you should prefer `const_assert!`.
>  /// ```
>  /// fn foo<const N: usize>() {
>  ///     // `static_assert!(N > 1);` is not allowed
> +///     const_assert!(N > 1); // Compile-time check
>  ///     build_assert!(N > 1); // Build-time check
>  ///     assert!(N > 1); // Run-time check
>  /// }
>  /// ```
>  ///
> -/// When a condition depends on a function argument, the function must be annotated with
> -/// `#[inline(always)]`. Without this attribute, the compiler may choose to not inline the
> -/// function, preventing it from optimizing out the error path.
> +/// When the condition refers to parameters of an inline function, neither [`static_assert!`] or
> +/// [`const_assert!`] can be used. You may use `build_assert!` in this scenario, however you must
> +/// annotate the function `#[inline(always)]`. Without this attribute, the compiler may choose to
> +/// not inline the function, preventing it from optimizing out the error path.
>  /// ```
>  /// #[inline(always)]
>  /// fn bar(n: usize) {
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index fa81acbdc8c2..54d0ce3ba595 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -255,9 +255,7 @@ impl<const N: u32> Bounded<$type, N> {
>              /// ```
>              pub const fn new<const VALUE: $type>() -> Self {
>                  // Statically assert that `VALUE` fits within the set number of bits.
> -                const {
> -                    assert!(fits_within!(VALUE, $type, N));
> -                }
> +                const_assert!(fits_within!(VALUE, $type, N));
>  
>                  // SAFETY: `fits_within` confirmed that `VALUE` can be represented within
>                  // `N` bits.
> @@ -287,12 +285,10 @@ impl<T, const N: u32> Bounded<T, N>
>      /// The caller must ensure that `value` can be represented within `N` bits.
>      const unsafe fn __new(value: T) -> Self {
>          // Enforce the type invariants.
> -        const {
> -            // `N` cannot be zero.
> -            assert!(N != 0);
> -            // The backing type is at least as large as `N` bits.
> -            assert!(N <= T::BITS);
> -        }
> +        // `N` cannot be zero.
> +        const_assert!(N != 0);
> +        // The backing type is at least as large as `N` bits.
> +        const_assert!(N <= T::BITS);
>  
>          // INVARIANT: The caller ensures `value` fits within `N` bits.
>          Self(value)
> @@ -406,12 +402,10 @@ pub fn get(self) -> T {
>      /// assert_eq!(larger_v, v);
>      /// ```
>      pub const fn extend<const M: u32>(self) -> Bounded<T, M> {
> -        const {
> -            assert!(
> -                M >= N,
> -                "Requested number of bits is less than the current representation."
> -            );
> -        }
> +        const_assert!(
> +            M >= N,
> +            "Requested number of bits is less than the current representation."
> +        );
>  
>          // SAFETY: The value did fit within `N` bits, so it will all the more fit within
>          // the larger `M` bits.
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index c7e91b80d301..75c52b5879e3 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -29,7 +29,7 @@
>  
>  pub use pin_init::{init, pin_data, pin_init, pinned_drop, InPlaceWrite, Init, PinInit, Zeroable};
>  
> -pub use super::{build_assert, build_error, static_assert};
> +pub use super::{build_assert, build_error, const_assert, static_assert};
>  
>  // `super::std_vendor` is hidden, which makes the macro inline for some reason.
>  #[doc(no_inline)]
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index 5b6a382637fe..0b6acd112c4f 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -2,8 +2,12 @@
>  
>  //! Types and functions to work with pointers and addresses.
>  
> -use core::mem::align_of;
> -use core::num::NonZero;
> +use core::{
> +    mem::align_of,
> +    num::NonZero, //
> +};
> +
> +use crate::const_assert;
>  
>  /// Type representing an alignment, which is always a power of two.
>  ///
> @@ -38,12 +42,10 @@ impl Alignment {
>      /// ```
>      #[inline(always)]
>      pub const fn new<const ALIGN: usize>() -> Self {
> -        const {
> -            assert!(
> -                ALIGN.is_power_of_two(),
> -                "Provided alignment is not a power of two."
> -            );
> -        }
> +        const_assert!(
> +            ALIGN.is_power_of_two(),
> +            "Provided alignment is not a power of two."
> +        );
>  
>          // INVARIANT: `align` is a power of two.
>          // SAFETY: `align` is a power of two, and thus non-zero.
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0c838c467c76..204e58dd1bb0 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  
>  # The features in this list are the ones allowed for non-`rust/` code.
>  #
> +#   - Stable since Rust 1.79.0: `feature(inline_const)`.
>  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
> @@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
>  # the unstable features in use.
> -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree



