Return-Path: <linux-kbuild+bounces-1993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8948FC5C2
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 10:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2A1FB285F1
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 08:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06C94963B;
	Wed,  5 Jun 2024 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UTlWQqP1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82C27459;
	Wed,  5 Jun 2024 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717575272; cv=fail; b=Dq7l86I8whX8DcEiXRk6XCLU99IP2JTIz+7XQV9f3cz6/Kf6bZ+M1n38LhfdP7UBx8B8O8MFekIKCCX8R7Y17if4C1iI/6ZbNtkaA4J05o1URYYWVXTstl5vCaFMRKPp0a6qVJJN7aIoq0SUrEv2UGP7EZElxdLSDemdhY+NmIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717575272; c=relaxed/simple;
	bh=IpeKsItZVU5ZbssE1eNMLvQAXvmuXinadBEoexurj1w=;
	h=Message-ID:Date:From:To:Cc:Subject:Content-Type:MIME-Version; b=DivKzgpWwct6+zl/c/ybG2XqlOKU3gvi1iyJuFEP/b0sISCHaAEJnCmz5SvcSlvtvM4BDYYiZO7g+71v4JHvjyGuqYDpwYMWsb/x+9Tzth5kb+u2YLyUIHYKZGAu6a9Z/GR/IovqCGbbWeKCNrxhyQIcYXutzm486wCsTkzpmiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UTlWQqP1; arc=fail smtp.client-ip=40.107.220.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ofabbykofs2TDBhhoA3gIjOoUKm1Z+N7goPYAKq9h+WpUjTIIzhkQcokWuGRZQlagm0Sk/RDajSCwwijJgxLsrgpiy3QRFeMQcuuoTin1kuj9CRGyH++lPdn1v7judq9oF/+72vrbvt3OD8X2w+D11f73bfXUIVqI41N6HhPO99ix77HZkOvxQT4r7Thr9d5FUGwBDCTw484ckjqccMAY98FtVhdMeK+Iat5FRkdoXNUmYBiNu2btHeLUVEm9IY7MzcEr+yxhaU/HEQc2Bf68O3hdZyW/u71XkSSLxbpestgRTTjRqt/w8cPS9H8rqEeKGhQS2Jzkkzwob2j3YmJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpeKsItZVU5ZbssE1eNMLvQAXvmuXinadBEoexurj1w=;
 b=lo4OW57Wu7Gv5UDlWoqkAiTM37/gTjN5YkmZoU1Zaji7pguhkxaVrNQUDKhwlb33JmnG1K+szWttAabCkZ3Qpx2G44ktJOc2F9K/6/mhbC3hDTdM1w9RXyV0tORE6Lyyci2HOvZo7CQP3vGEmekdT5GPHAlfDnz5rOeaRZ/LJW6lQDFlc8DQOC0zaOonarch0nplpDOM8AmtGgeXoFcXay2OxncPQvWWqfSAAqI17xpKXtYh58VThZhH+Eq4sSSloSsh3Ii22HkrTxQsyFpnK7rIjw1wyrdjFMg3yImXmYfnvKRx1yORrjgdIK/m73+2o9TULQ74GRCLfj7tupl34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpeKsItZVU5ZbssE1eNMLvQAXvmuXinadBEoexurj1w=;
 b=UTlWQqP1Sn5dS5LPO5yV1j08iTKpWvwGSVqP3JyAzi1OFA6TS/T6vmdj6ebi5qrT4VxQHSsejMFNrN/24LZq/Ubr60k3//Rl6GWe/6tTG2O2kUKEFM8OZ+ywLyS9b2uvjqHaNl9ppxR0Mqkpzl1FAact6AJsZh5k5zVeJsqWY/QWrYhl2JE00kJh6WTdnO/dWKsDR/i6GYmluIzlsjmo15U3EdWMES45hpGZF1RqQfkHNzjzYwr3IdLU7j9LVZniGe954mlUS2X1SXDM4UH2kBYGE5mSmHEWGmKOqYU8Ra4XuvoT09ChFkZYa8mK0D1YuYcZ8y8Mh2y8jCylcxCt4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.17; Wed, 5 Jun 2024 08:14:28 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 08:14:28 +0000
Message-ID: <21cdf8ef-e2fe-4247-9390-4b3d975f80a3@nvidia.com>
Date: Wed, 5 Jun 2024 09:14:23 +0100
User-Agent: Mozilla Thunderbird
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: kbuild: mksysmap: Build regression for next-20240604
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f8616d-4f98-4c6d-97ed-08dc8537851d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWhTMHN0MVVmaWFYZ0t1N1Jmc2Q0REs1cE94VVZPdnRnZkYrUFVSMUZwT2ZX?=
 =?utf-8?B?MjVaMEdUNzlib0ExcVFFZ2tlZmNXbWxkaU1nMFZGYjJ6cDlUSzJHZWhHQWk5?=
 =?utf-8?B?Uzd5OFZyZzZLa203UVA4YVZtZ3Bmc1Y3Qi8zdEVBYzdsUmM1OUxybFdCdEpR?=
 =?utf-8?B?eFJmTlo5WFBweGVnRGJwb1ExTzVjRXNTVit0dHVZcU9EV0pGYkszT2VyR3JP?=
 =?utf-8?B?M1VpUFhXRlJMOTViYlFrNHV4R1VPb2Q3c0NEK1IwV0dDMTlrM2xQbGZUWkk3?=
 =?utf-8?B?WmZpS1VRZWNydWlJaGlSa0gyaWZQNE42d3pQYUFzVnBBWUYxMHRyQ2w3dmU2?=
 =?utf-8?B?SDRTUThwMytQVUQzRGU2T3JaRjg3UytRRzEwUEVZOTJOMDdXZ2hGR1htTytm?=
 =?utf-8?B?ejVkcU4vRExoa2dLbC9DejY0QjczQjZiNE8rSTJaWFUrZkZEQWw5djR1b1ND?=
 =?utf-8?B?VVB5dTJzL2lRTmIvRDBaZVpHakpmOG5la2dMVkRGTUZWTTkxQW9iWUFDYjda?=
 =?utf-8?B?UjhPSDJDcm50V1B6RjJkNFczTnlkdWc4cXlUdUw4dXBEUGFTRTJhTnlUYWlW?=
 =?utf-8?B?MUtpL3dueTNrVGZkeEZIeWpHQ3NoU0xlQ2xpMU52b0FvNWpOV2lieDEyQzhG?=
 =?utf-8?B?Z1BhOGN0eUU5TlhlZnZMTnl2bmpuVDAybFV1YkdPQzFvNnBaT2p1TUtUWjh6?=
 =?utf-8?B?U1BTR0pXdzJHc0RSVkdaUEhnNjFJc0oyVkNnS1ZxWHlkTHVkYit6cEROd2lu?=
 =?utf-8?B?UHc4Y1JxcHlwd0YvdXIzd2pOb3lpTXd3a1VSRkxRbTN4bFFNYmlvZUtERmZM?=
 =?utf-8?B?d0FWdGdldVNzVzVsMmlSZGNLQ2kycGdsYS9na2F6ZGNPY1NvWUduM3RwbkFB?=
 =?utf-8?B?VWdZUDArdTUzaHJQNFdnazdlZUhkWFhReVNEK0haWnZMMnNVcnZGNVQ5RFJU?=
 =?utf-8?B?d2NjVGtnejRvVS81aERpek9nTDNtYzVCbHkyQTFtTGdQczVqQkNWKzlyb2tP?=
 =?utf-8?B?bEJTamIzdVZPTTI5YlB6MUVWcVAzNEkzMVRaalZnTVRpOUNlVUtvVXJsaTNo?=
 =?utf-8?B?K3BZbkFubzN5enR4RDZDK1c5NTB5V0wyMzEvOG5vdzRoOTBVT2ZEYldzdjd6?=
 =?utf-8?B?T21pNTVDQ25GVXppZmNFODArc0lwUTRoS2lXK0RtWjZRalc2WE1qZmltVnEw?=
 =?utf-8?B?SG5EdWFLanFmTmxQN2Y0RGpqd1A0LzJLcGxqcHdvVkovV1QwYm5NT1BvSU1m?=
 =?utf-8?B?SjRpS085REJIeS9JSmdWdTB6Tk1HK1o1NGh1VjVNM0pXdWlFa1RhSCtRSTlJ?=
 =?utf-8?B?akFVUW1jdnUxMVh1NW43WmFOWG04QnVkaUlPRC9WTXo2bWJRMXB5c1hEYzdV?=
 =?utf-8?B?bnRVUmtGbzU0SmdEV3hTdmpab1UrSjhHUm5EZmFxUUNodjRyWE8vWXlLSWNT?=
 =?utf-8?B?R1NQc21MT0lLSkZvbDduSFlQOFN4SmtBM0hrUDJRZ3VoMGlBZjFiNWJoVUJp?=
 =?utf-8?B?NGZDd2xVaTYwR041NFhaV1dDd3VnVVl6bGJNV25NYUU2Z1VEZ3NnRXd2TC9o?=
 =?utf-8?B?Y29yeFZuZThHb2s0ckhjZ3ZnUG9uMzI0M2wzckNxOHZTTFhqam0vYnlRczJC?=
 =?utf-8?B?bkNLbmMwYW93TUsvak5BQWFiVWc4K2FqY01IdTNDNWszQ29COStzNDhoN1Rk?=
 =?utf-8?B?SFhXbGUwU1R2VmhLODl0bC94Wi8yUXBxUXEzRUJZOUhsU29LK0w1VHlWZmtx?=
 =?utf-8?Q?MT9NzMvdeBOPtKDj3jkPIYAi/62UVIxLTEdSYb5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXpXU09aMzl1QXlVaVR5WWFlVTd4dzQyMC9nM2Jyei8xNHJBTnVDVkk5L0ZT?=
 =?utf-8?B?eThaU2hlM0hEeEZheFhPbk90YW9ZQitSRkhjdmp5S1J5M0lhMFQ5cGIvVmZP?=
 =?utf-8?B?QTJqV3hRU3craGd6UmFoRGNHdDlpRy9td0U4RXV0N3EvYXMzbnJScWJ5OE5H?=
 =?utf-8?B?V3ViMytvNnNpaHZCMU9RcGNkVm1ReDI3WDlUR2RZbXM1bFg2K0NLTWtSaEVX?=
 =?utf-8?B?Wi9SVXhLMjVRRHJtUWQ3MSs3TWFlclR2cjY1SDQ1YjAwUis1UktlOGdMTExw?=
 =?utf-8?B?WXovaitYdi8yNyt5d1oydllndmM0cFd0azMrckVEalNmRWZid0doOE1HSUpn?=
 =?utf-8?B?dEQyUDMzaWNpM0tMNzJ1OW5qZlBRVkZpcllpeUYxYkRqOHpTbElSREYwVEsw?=
 =?utf-8?B?dGZOM3V2QktsVEVUcnZGRVhpTzhlWEt6YndnZFVKRDd1bWJPOVgxQk5pR3k4?=
 =?utf-8?B?NjUvYzhIVGE4RXFDdmRZcGlPbGVNV2VaWmFUNW4remxIWjZxWTZsZ2xUc0FJ?=
 =?utf-8?B?TjNaT3hmODRLYVRmSEZmYjBOQ3B0QWhqNkM0SUM1RmpDMmJWdmVqMVM5QmZH?=
 =?utf-8?B?MnFhekV2eHZ3U2ZBWlpJMWNoSENoMXVWaVk1LytJWlV3eVdOTHhyMmllTUR4?=
 =?utf-8?B?V29pRTR6Q29PbHI4RDRzK1A0a2tMZkwwdk1XcDhSbU5ZUVMrdEJrNWNWbUxW?=
 =?utf-8?B?WlBmQ3N0Q3dYUkxwLzFKeFFJZ1dEUVUyY2VPRlBjWkZ3alNwZ3o3MWtHdWNY?=
 =?utf-8?B?eHMvdnU1ektScm1mM0tyY05vRnJ4N2hseGYza3dLTXZiVWV3c1QrU0daQThD?=
 =?utf-8?B?NWtyYlVGMmo1YW1CQ1E5MGp6Z0RrdFhNMUlQZ2tNWVVUNUtoRU1weWhKZmY3?=
 =?utf-8?B?VWlQRFhSVDNrS2xmYWpBWk02MStHWmdJcXcySDEzd2Q2UGwzSGUyRWdhT2Qz?=
 =?utf-8?B?ZUtlbGxrUFFueUtqWDJyd3hBYU52ZGJuVlByTExvTXJWL0p3ZWNJZlNGVlNR?=
 =?utf-8?B?Q21CZGVRWndnNFNnVGtpTmttYVNISXEwd1lvV0FVK29VY0EzcDU3aHhIbmZ4?=
 =?utf-8?B?Um0ya2R5M1RGSHNHQUYwWElpajZFY3NhN3NuNEorc3RFdzZUS3pEN09xVzli?=
 =?utf-8?B?WURKM2hYV2hyeWNWSmxOMzB2cSthM3doMC9URll0d1ptNVhMeTZrMlFWd0Ix?=
 =?utf-8?B?Z0JFa0gzNzJMQ2thNVYzMXcvdnEvUC83VzhqTTNYdGxtU0RkeFZiOUN2NVRl?=
 =?utf-8?B?Rmx3N0RLWHd1bE1hdklURFpFbC9Vd0ZXV3Rva0xaUGxTU0VCRmxWNDhFd0xu?=
 =?utf-8?B?WUI3ZnkrTm1BaVdaLytmdERaUU1nR3VteHpaUGJEN0VhaUJFOVNRcjFDUnlE?=
 =?utf-8?B?ZHJmR05uZHRFOXg5ZkZUTUFNQjFTMDlDOFdyM2svbmU0eWE0cnFua1Bkc1N3?=
 =?utf-8?B?NFJ6SmkxMy9xSSsrcTZ6VWR1MEtNeTVZRmRsU25XOGVkMllkZjZKUkxiSU5a?=
 =?utf-8?B?S0FJa3pmdnp6TnpwUmo0VU1wQ0tIaFBDQisyblJrcFRhODJqTTFSSnprNmlh?=
 =?utf-8?B?VGVTazdGUzJzMVBUWWZRVUZVS1Vla2ZrUm5WcGZtMkZOeUR4VEw0K0c1R0d2?=
 =?utf-8?B?QnpnRGpKTmtVRDZjNEFwTXZJQTJJQ2d6M3g0eGNYZy9hYzgyRHJOKzFTYStx?=
 =?utf-8?B?VkNQcytYNWY4UFMxNFQxa2lkWkc4N2tHLy9sdlZhTG50c3JvR3ladjNqVWMy?=
 =?utf-8?B?WWVmMTNqbTRiTXNDdVJiTnpjdHlQdmtXL0s4Z29jbjdhaGt3ODVWcjBLVlk1?=
 =?utf-8?B?RDAvYy9SbWRMemtHbFpzTjlLazZ2YUNMZEtzUHQweG55cndEenFxa3drSElk?=
 =?utf-8?B?aEVKZnc2d2tuVkdac2pNL2FYYnNmQWU1MUpzblVQVy93R3Yza0g5d0VGSWpC?=
 =?utf-8?B?Wm5DeE5OZnNJdE9UNVh3TDlEcFN0YWlNRyt6UHpXVnIwZE5MN3hpYk9nbXVN?=
 =?utf-8?B?REx1a1RUZXhnV0N6WUtJa1hyZXI4KzVQWEg2SlZIVEtJVU8ydnppb3BWVXdz?=
 =?utf-8?B?WDd4aE5tTENlWDd5alpKbjMyUGpkaWFKMUUrcWtMaTl4amN1WVY0eGgvOUhQ?=
 =?utf-8?B?cUh6dUY0YUVEZ2IyeGxuenNJckY3RGVZbks4ZzRUUzkyVnpER1JUZCt1QUZs?=
 =?utf-8?Q?F9C1h0ptH5SDq0nRfD73lpF4pA2JYjHxuDwJ74tC3sTy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f8616d-4f98-4c6d-97ed-08dc8537851d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 08:14:28.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrAvoKTl69vFFfxcmEgL2pCrF3niG9qvj4OFnWE9pelFoRdy1rnzRjUqGg+zefB3cV6FE6OqDXvjMnu81cKb4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066

Hi Kent,

Since next-20240604 I noticed a build regression in our farm builders
and I am seeing the following error ...

/usr/bin/env: invalid option -- 'S'
Try '/usr/bin/env --help' for more information.

These builders have an older version of 'env' that do not support the
'-S' argument and so your change [0] is breaking the for these
machines. I did not see your patch on any list and found it on your
bcachefs tree [1]. So not clear if this has been reviewed and if this
is trying to fix some related to Masahiro change [2]?

It is also not clear what the minimum version of 'env' is supported
for building the linux kernel, but these builders have been building
the kernel fine for years.

Thanks
Jon

[0] https://evilpiepirate.org/git/bcachefs.git/commit/?h=for-next&id=973eca8db5570dd0c3f2b3190867138cc446eb3b
[1] https://evilpiepirate.org/git/bcachefs.git/log/?h=for-next
[2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=b18b047002b7d3b19d9fb905c1bd2a214016c153

