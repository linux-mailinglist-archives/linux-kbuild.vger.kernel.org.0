Return-Path: <linux-kbuild+bounces-5082-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 287E39ECBE6
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 13:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A756164209
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 12:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CFE1C173F;
	Wed, 11 Dec 2024 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PGxSAoks"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECF42210F9;
	Wed, 11 Dec 2024 12:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733919697; cv=fail; b=gRfnMGq9lb9ZznHFwHH3IKEiGGjGXR6gvz1bM2iahb+/QO+IEjw2/Ry+jEsnNhFfp6NSE9u2G8r2EQpQV8HN7IUW9i4OezJZMwA2xW2G8TiVwd/szbJMzOtEug2+iRn4mtwf2Rw9jgeMb+N4YH/CM54c4XAItuv1D4AsMxmv3NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733919697; c=relaxed/simple;
	bh=pXRPzk9uD3vCXhBi91QJp31mui9DZ9VJxMc7TQK38vI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Zq/JUNgjJ2RJZNifuIedbhgv/vlWrLEn5Gin0y79rh4ngswn1E/yTWm6wVVdE6xGSsAbekcJNfDd9bhSgaNX2Da4STKDjpDD87m9oyKxNnIymMs0mfdcIr0CDauz7jW2UMRt7o473+U8fzbwqpJhAA0tA5ZhO0e+IqctMV6zRho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PGxSAoks; arc=fail smtp.client-ip=40.107.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwkJxNTa1hJIDk2aZfDDQAwiBuGj8Z+IbMvfdwgafA7dxGbr3lV5cL8Z/9PesmxOeU8La5RT7DKVc869MU5T9AFjIl1KV3unVdtj4lrVmx2z88/F3GXlC2S/zVJ+2AdIsgpNPWXQUmA6QYIfFgRa2kgjgZdS99bYkB4Iuufiz6yi0Brnti4ze3tun0iuimUWwaSK75PSHQAsDilgur/tpBuaSeNMQ6CzckDZBxwJPQe69ubFmskql+XPbSQ5KIi7iG/xJPwvTRW62kPv8MPOnj/aReWvFvP9OFK7e1O/Jy+mjrxWyYRu/KuSlZY3zhGYTwyL/sQfKeGdB9BAsQ/shA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3S6Bw9wZUvSelo3OOXVd5edDd+7iL9lvO752wOfpq0=;
 b=kqsGXorOgw0eOBBc5mW0uNKHL9bxxZgTvvLYQLIyi5OMJDuhgWOejJmEVyRM+n/lPrfMzfX+WikkHvcII2FljWviS188bQemzuuMudu0okpmlXScaQ/g8hSHIORfDf0dJtyyic0yoqT89ixJi8p/q/EyJnjkp1OZxW6C9D5xQUY9flINWILWezKmrORmhb/d/mgNSPHgxc4O4tmrUGg/8uDyTP66D4VDRgtgH9Nwi7h2gZHoeE5it2QEHJsl+RElxnaeJlAR7Q1HaCoDub9g/3FnAINPUOIOZgxFZ0dpCc2cGRqc3wKcc7TMWxB1bTzMq0PhjQ8DGlSZaOy2TQt5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3S6Bw9wZUvSelo3OOXVd5edDd+7iL9lvO752wOfpq0=;
 b=PGxSAoksYjYas+UNI4FgwxNx7kZ/VE9lWf7DFz4OIpI4/u8gNJSNyzjqwUsvG3kGtK0s6q6IjJkZFPWGu8syUrfw1YyYR+m9kRYN7lfk5YmiSJZaNBKs3OnX+Kx4cxU4zYE2BvQDvzJ6T7NMm8kr2rrvmDQjI0bCoFUmWl0bfMa6IlLtH0ekvN4Xkp0pSTCf+zSonIRUq4++XK/Wxtvp4XN6FnOK9w4S+jrse3fYem5AucmP9/bDnyukVnHk4bjDFxpWEQTA39lmVjVt1t+k2KA4TCJ5LXdbdrH4isJNHRr2rKiNe3RecIVTykV+jvvgkTCrOE2fU+cr+8FptZXGKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Wed, 11 Dec
 2024 12:21:31 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%2]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 12:21:31 +0000
Message-ID: <b20db4db-afb4-4f58-bc01-ae1250abc8b0@nvidia.com>
Date: Wed, 11 Dec 2024 12:21:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] kbuild: change working directory to external
 module directory with M=
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, cocci@inria.fr,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
 <20241110013649.34903-6-masahiroy@kernel.org>
 <bdd5ff13-ec66-4ab6-985a-1fe433e85f91@nvidia.com>
 <CAK7LNATgL=vOr37+XfF7du+_ak5yKgXYyNNNTEQdVvy5J2MMyA@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAK7LNATgL=vOr37+XfF7du+_ak5yKgXYyNNNTEQdVvy5J2MMyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0009.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|CH3PR12MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ef0dc7-d605-46f3-b897-08dd19de5863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHpMaU93azIwOS9LMzVuNXFQdS9mbEc3d2RZaHFWVlV2YlpaNk9xQ0QwbnFF?=
 =?utf-8?B?Wm9ub3RGalRBMmwyYnBGY2UrSy95N1NzWUlsdFpaK0luT0gyQ3NHZzNBb2t5?=
 =?utf-8?B?V2RKYUYyQk1pMkVRQmVpcWFROUhCSVJnSW41NXlhKzc3WFAwenhHU0VYR0wx?=
 =?utf-8?B?MkpIT3Z6UmxJS2VhcnF0eUN1Z1lWY0pEWks0TWdXbDhOMDNtRUY1cVpsbzlJ?=
 =?utf-8?B?MUtPNDdKWjBKZEZIQW1ObFBTa3EzL0Y2djU2dzc1MUlMTWNaZnhWMzJUT3hy?=
 =?utf-8?B?OFdpK1ZkcmpNdWtkUGdLS1F6M1pGZGtxR2w2KzJLbDYvdUlCWDdKWHozZWh2?=
 =?utf-8?B?RVd6ZHFGY0UrOEFyQjJzWEdBY0tOQVEyb0EwTGh4REJCRk5QVCtKWGJuVFlG?=
 =?utf-8?B?YkpUd1lXV2hlckgrV1Jaa2VoQ1RCL1hkbjNDaWZRMHFUQkZsdjVFZGJhaE9V?=
 =?utf-8?B?dm14UkQ5WU9yKzd4ZS9SNVA3Z21uQkx6U2VWYWtEUC9NWFNXWkpUMExXSURQ?=
 =?utf-8?B?ZVBZODIzTmJlcFhIM3FGOWluU3lJWGJFOTFyWVFZWUFvYkVaVDQrSUVQRVlP?=
 =?utf-8?B?dFc3cWhTTThqSFRnZ1NwdEluWWVOazNoelQyUHVxMnNZTVZpYW4rSTF1bURv?=
 =?utf-8?B?NFVFZmhZSk44YXF5UTdXdDU0Um9ycHZtcU14NHJXNDZTRjNQamZXMXRLVzl3?=
 =?utf-8?B?SGJUMlVxOFdHMFZ0YmFFQ2NjUnRlM0RLdlZCYTFQWTYvUW1xV1l6SDhvd2Fv?=
 =?utf-8?B?M2ZFbU9WREx5RzN6TFVkRi9INmczSFhZVU4vSWZhc3F3VGFvc3Bhc21pYytZ?=
 =?utf-8?B?Z3BYamtaa1NObjRIRlB0YjZsZk9XUTI4UkxTNzNGOHByVDRIanh4SmZxeC9o?=
 =?utf-8?B?WDVsc0lKZkIxa2ZaSHdYL3VNYis1Z2oreVdaSnFkdXN2RDE2UzN6N2c4bFI1?=
 =?utf-8?B?RmlGZGx6cmMxV1A5WWpZMExVeTNCN2FCSGxkY01kU0xnS1JaeDBZUzZPbGJY?=
 =?utf-8?B?QmxuaFVVc2pHVjZXL2R2aFdBSVlWbW9FQUxqa1ZGd1NwcFJ0Um1wdmNSUlND?=
 =?utf-8?B?VVV6WDQ5YjFrRzNneXN3aTA5ZmNwclJiOFpubWo0UWhOc3ByUWdtanlveDMz?=
 =?utf-8?B?VkV6NlAwUnVycmpESlczeCs1YUM0aFRraHF2a3p5eEZVcG82Y21SNmwwMW54?=
 =?utf-8?B?a3V3dHowTlZkWUxYeDVYZXlVYVBWVDVQaUFUbWduUDIya2MvMFFUUU52bnYy?=
 =?utf-8?B?S3VDeFpHM1hwMU90NGh5WlFNaVgvRDY5OEU4TExVcDQxZEcwQVBGa3FNS1o5?=
 =?utf-8?B?Mkp3cDFTMUFWam5ycEZKVEZIYWRBRUZ1TWhKelB1RHRxczZnKzc4TzJtbzVn?=
 =?utf-8?B?R3F1MTExUnAwaUdxQmo2Lyt3RHdlaXg4TjNFZkFEdk90Z2RtSktuNXR1bC95?=
 =?utf-8?B?L0NQdDEyc1F4eWRFUDJQbTJiL1BqTU5ZSzQvTmx6ZzYvMDhWRnh2Ulc4dTJq?=
 =?utf-8?B?eGJmd3RZcTFQVC9LVEMwV29rQzJlcTRNVW9WWUpubDhSL1BxMmQ0cy9YNWFy?=
 =?utf-8?B?Ujl2cHhtcDJkL2x3TnJWdWJOYTBtSUQxS0MwUm54VWtRV1orQmhzdHRhbTR3?=
 =?utf-8?B?SmkvODgyMnZOV0RmWk4zVG83TTBiYXFzYTA5OHp5alJ1WnNGSGVWUUZGSHFj?=
 =?utf-8?B?RGFoRkpvSlFTWTVudXZGa1U3aG1mSnBEOHdvU2JHOXl6SzRjcXU4Vmlhamxp?=
 =?utf-8?B?UUJSZXp1S2QyZlZQd29ZUGVMUDF6MTQzcG1KUVRaQTBQdHhtOThuL01CMDYy?=
 =?utf-8?B?RHluNVVMdXU1bVFDcERmdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEhObW4rZGIxZXBpL0VFT1hibUNFNjZQczhqVnoxdnJKRVlWekhPdU1HbjVI?=
 =?utf-8?B?MDZNU3JOSkJJNDd5S0dDcUhrdXNUTjFXUE43OTYzaWVHcEJWeitiYlJieVdC?=
 =?utf-8?B?b3QyOUJzZXMrL2ZNQXoxY2xZTkcxZ29XYUJYcGM4UERadHBXQVlRaXV5Qklt?=
 =?utf-8?B?Y085Q0Fnb05pWFYrWEpZN08vZGZSWDltbDVIaGNvZ2RpT1k2SjMzNmpxY3Zu?=
 =?utf-8?B?RDU4OUcvSHZqN2MrdFkwYU4yUk5NVm1nS0xpVzArYmxCWmd5Nmp5eE5oUkV5?=
 =?utf-8?B?QlBCMGxEcHJCTlhkMnZPUnRIMFRreElSU1dmZXRXcVY5dzhMcjNaWXAyZlVM?=
 =?utf-8?B?TTNJaExuQnV3WkRnOUFuOElWaTlKUVB2TkRmdjVxa0VRNno2RlZXNDlMdjli?=
 =?utf-8?B?VjFzTi8vTCtYa2JMYmpDdllMSmNCaDlGU3JUdnRPRnoydW9QN1pzWFUxNHBQ?=
 =?utf-8?B?MmlLaFJHcHBMN3pCbEVZMnF5bEs3akwzVUE1YlI1WVZaN2RIY1ZjbVhJT1JH?=
 =?utf-8?B?N1RrdURvZU1EWGN4VWxhMDUwVVN4QURXYU1NNXk2MDlMMXBQZE40UG0yYS9K?=
 =?utf-8?B?Q0g0WEt6aVJQcnRMbzgrUUc5QTh2SitweHI2WWt3dDVUUTFvcFRqUlJNZ016?=
 =?utf-8?B?NFd1czZjeXQvUzlzUkYzU1A4U3p0Ynl4YTZndndRTzhhYWFoMElLbnYxdCts?=
 =?utf-8?B?VldpaFlXK3QzclJjWU85ajlMRGUwYVdXUmlkK21WQlJhNUtlRldub09yWFFF?=
 =?utf-8?B?NEFUdXlIdHMzNWI0dDhrQmVrN1VlQU1yUDN2eWpqSE9pNm9RSWtKbDQrYVdY?=
 =?utf-8?B?SmtTSDhYM0x3Tlh4Y0RSWGRSYzRUQmk1ZG1KQlJ1ZHRCYng2cmc4RUc3RGUx?=
 =?utf-8?B?ckE0ZCt6YnBKY0M4U0tMNHQyTzF3SndodVdlaWdMMGZkeXNzZzFtaDQxZFk5?=
 =?utf-8?B?NmZucjRaN1pYcFovS1ZDN2VudHpoMXRaaHpsNXJlU05ZcHQrd0M2QjRaT3Fx?=
 =?utf-8?B?bzFRZUlqRHdRTWV4elR4SXVXbjZLTmhxV0pXblpjdjBkS25ZWFQwOEJGbm8w?=
 =?utf-8?B?REdvVjdFbzhLeExRRlZoOE5wUlRrWkljSi96YWFqc0FENkVDQzBlMm1TZGxH?=
 =?utf-8?B?MHhTZFZpSGV3WEJiV1hmaFNVVUlZMGFsZjhYOTdmMlZzRWhHbjI5SHZvZVNa?=
 =?utf-8?B?S1N2VU5RTFJaVEsyTnhYSUZ2SllheTQ0NzBXZEt1KzdwSEVXWGRUaTdkR0lE?=
 =?utf-8?B?TXBqTmVSQ0JyS1pqU2F4QXZjdUFjWlBkRmlScXhWeGZ4a2ZiVkovcEdVNXo0?=
 =?utf-8?B?NzBwRHR2SWR2eVBZcHk2QUFoWEhjRlBxRzBjdXZWbENBeXVQNXZsaHBZemFN?=
 =?utf-8?B?QWhYemlTcUh3Um01SUs4cFhmaTJHZHYzZlBEemEzSmxrM0s1RmdWTFdkeGNn?=
 =?utf-8?B?K3BFUTE3ZUlqSTFib2d5VEFMUWJTVkRKSnFicTExbVJ6MmRjaTE0dEZSWmFH?=
 =?utf-8?B?T1BsWmU3WUg5YUZYL2V1ZFNIcVU5UDlKSUE3dVVFcW44NUVKalRocC96Z1dx?=
 =?utf-8?B?YjI0UnRBY0dDa1VDSFRJeVEza3grN05GUzZ1bHV4bi9zK1ZVclNtS2xFQ3ow?=
 =?utf-8?B?bzNHT0Nmc2ZwcEYyWHN5K0dra09uaUw4ZUNkUEJaR3Y4dXVJR3NOd2dtYVFw?=
 =?utf-8?B?YnlXRlFaKy8xTGMxbGFiYXVuWmNOWFVhS3pVOGxwemVoVkNGdE42VFN0ZlND?=
 =?utf-8?B?Z3ljd3NLTjZLcGNmV1QvODRwSG5BeGJQNDZFQTA0ZVdGSVVPaG1zdjlrbWt1?=
 =?utf-8?B?VkFhbEsxTUtPZDBqL1hTeDVJUUZBb3Y0bzR0VkNMbWEySGdCd0ZVUi83dTZO?=
 =?utf-8?B?WlFwZHBLYXRyVURQdVkyZUl3TWtubGJ0YkgwRTBybDI2R3VaQXQ5bXlWOGZl?=
 =?utf-8?B?RnpBa25YaHU1ejlUNjZncTM3OUhtV0hocnFIWHJrL3pmbHc0LzVpbTY2U1dl?=
 =?utf-8?B?Q0swSzVBalRCS0pVcnhHNWQyYVY4UHZZREpmWlBBY2VjdkxXam1QTllIcW5R?=
 =?utf-8?B?eGJNckdaZTdvQ21uYXZYSC8xakhwRFRTV2dwS0ptMTNKYzN1L0tlaTFQM1hz?=
 =?utf-8?B?L29KenlPV0h3aC9JYm04U1I2ODBmd0liZmRFTkJWOG1aT1hmbmZKUTErZklu?=
 =?utf-8?B?N1ZzUFBDdE5EcXBkdUNwRFRHWnFsd1BwcTV2TzZGTDM0dVYzKzFiL2hJckQz?=
 =?utf-8?B?Nm8vWlNtdXFYRDZkUHYxelFOVEt3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ef0dc7-d605-46f3-b897-08dd19de5863
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 12:21:31.5977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5gdGSDdOJEtbs9VenrlMz4gltkTmi26+Dqgk1gCQuEyBONZNVXwZbmLHxbkHW7fzYHrMG8fVERPYsx6GRxYRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401


On 11/12/2024 02:39, Masahiro Yamada wrote:
> On Wed, Dec 11, 2024 at 12:34 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> Hi Masahiro,
>>
>> On 10/11/2024 01:34, Masahiro Yamada wrote:
>>> Currently, Kbuild always operates in the output directory of the kernel,
>>> even when building external modules. This increases the risk of external
>>> module Makefiles attempting to write to the kernel directory.
>>>
>>> This commit switches the working directory to the external module
>>> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
>>> some build artifacts.
>>>
>>> The command for building external modules maintains backward
>>> compatibility, but Makefiles that rely on working in the kernel
>>> directory may break. In such cases, $(objtree) and $(srctree) should
>>> be used to refer to the output and source directories of the kernel.
>>>
>>> The appearance of the build log will change as follows:
>>>
>>> [Before]
>>>
>>>     $ make -C /path/to/my/linux M=/path/to/my/externel/module
>>>     make: Entering directory '/path/to/my/linux'
>>>       CC [M]  /path/to/my/externel/module/helloworld.o
>>>       MODPOST /path/to/my/externel/module/Module.symvers
>>>       CC [M]  /path/to/my/externel/module/helloworld.mod.o
>>>       CC [M]  /path/to/my/externel/module/.module-common.o
>>>       LD [M]  /path/to/my/externel/module/helloworld.ko
>>>     make: Leaving directory '/path/to/my/linux'
>>>
>>> [After]
>>>
>>>     $ make -C /path/to/my/linux M=/path/to/my/externel/module
>>>     make: Entering directory '/path/to/my/linux'
>>>     make[1]: Entering directory '/path/to/my/externel/module'
>>>       CC [M]  helloworld.o
>>>       MODPOST Module.symvers
>>>       CC [M]  helloworld.mod.o
>>>       CC [M]  .module-common.o
>>>       LD [M]  helloworld.ko
>>>     make[1]: Leaving directory '/path/to/my/externel/module'
>>>     make: Leaving directory '/path/to/my/linux'
>>>
>>> Printing "Entering directory" twice is cumbersome. This will be
>>> addressed later.
>>>
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>
>>
>> Since this change I have been observing the following build error when
>> building an external module ...
>>
>>    MODPOST Module.symvers
>> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_init' exported
>>       twice. Previous export was in drivers/gpu/host1x/host1x.ko
>> ERROR: modpost: drivers/gpu/host1x/host1x: 'host1x_device_exit' exported
>>       twice. Previous export was in drivers/gpu/host1x/host1x.ko
>>
>> Now host1x is an upstream driver, but I have a local copy that using to
>> stage development changes (and avoid polluting the upstream driver).
>> Plus I can swap between which version I am using on a live system.
>>
>> What I noticed is that previously the Modules.symvers for the external
>> module had the full path of the external module for the name. However,
>> now the name is just the relative path and in this case
>> 'drivers/gpu/host1x/host1x'. Hence, this clashes with the in-kernel
>> driver and we get the 'exported twice' error.
>>
>> I have been looking to see if there is a way to fix this because it has
>> been a useful feature to override an upstream driver with a locally
>> modified version.
> 
> 
> I do not know how to reproduce it.
> 
>    if (s && (!external_module || s->module->is_vmlinux || s->module == mod)) {
> 
> is not checking the module path at all.
> I do not understand why it was affected.


So this is not explicitly checking the path, but comparing the contents
of the Module.symvers before and after this change for the external
module I see ...

$ grep -r host1x_device_init Module.symvers
0x00000000      host1x_device_init      /absolute/path/to/drivers/gpu/host1x/host1x        EXPORT_SYMBOL

And now I see ...

$ grep -r host1x_device_init Module.symvers
0x00000000      host1x_device_init      drivers/gpu/host1x/host1x  EXPORT_SYMBOL

So the problem is that now there is no longer an absolute path in the
external modules Module.symvers and so conflicts with the kernel's.

Does that make sense?

Jon

-- 
nvpublic


