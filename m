Return-Path: <linux-kbuild+bounces-7143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D50A6ABABE8
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 20:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6743617E942
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 May 2025 18:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A48E2136358;
	Sat, 17 May 2025 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BoVPMVVu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F08F58
	for <linux-kbuild@vger.kernel.org>; Sat, 17 May 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747507616; cv=fail; b=Zio0KZBlmdap5fyzpmTtFfZuctSPy7eOmyH+aTFQhLb/X/bZWgw3yjbJgztg1Bm3rcvJT66WsR+ywtS7ykIN+luU/zWLFDBU9zHG8PsNDMpirX+dZHawvux4EBAu3jJ8+WxKtlc75yj3y/932siW43oi0wp+X4A0zD3nng1xa8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747507616; c=relaxed/simple;
	bh=sW018HUvwX7xTZVrM5fW7VdQ11gB28byIo/mLjKR4D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nfz+LRAoFyOgtQ6SogABAuYpUuFy7byfTRdYMolSb9sKmrJKHgRKQPNLEs0A7RebXMMuKMYavJniKU9sS1ssqnk6v5bweO5VUlppM86D0ztDqNY4i3XoyG2fPCGy300VhrI08XQaWiKUYLj6PVU9LOFRN01cwXK9mC/6kKAE8Rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BoVPMVVu; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd2bpcwGOeYRp4W7F4aWLIT/22BPJzk6SaRWazwIWciavI7Cb56cIIudsShjTY3yvKtrnwxEaQKYPtSQNXfAYb6MEz5bvDjYblad8giqx3q4MMQl5X3yzoynC5wacAZGCLixqrAh8b1G/hd+Oxr/fha45jdZqJZJI75O/zCHX6ldKaE3RRME0iLCetD9NzmqJMWtpafx6HfzCds3GVFMlKaFGox3iBQjg/LEMEItYhGM4yKbUSmBMEil/4UkcQSoGyRpotQYMobsUMqGOBw6WlCl+Rg8GN21TAcJ8x+jNptfX5ORqVsJ3YDQYiHQATpeMLbNJWmecIc9/JdjbFOg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Y+7QX2ksDNTLXpvsu6qpfSKmyYLVJkVlb7f0wSRM9Q=;
 b=Px/BMwMnYfK9ZHK9MYziLFrh/22S7RRbymzyRtFmGgikl9YenFoVWgCUgfK9pdXYI14g8ycUIVfNGZpPD3YPDrxtefbVL0PF3RIE+GlQp3NZBxq6MfwRGDmKbiJUKILpcLNezIpA17GuTo5Q5/HpZfvtsYJAjfIMAGKIyw/Bp3K8M8Aredxqup+T/bYIAEElIDI9Vb8cAu88I9TwPIJIOBPYJ/tRz251EExSh6QyRFdjU4EfDEGv5trgunMTSQIjVnoULSh6NJbDNM2ZExbO3J2gXm75LcITsnGhneou/ddmz94l1zHz0blQTevJsMGIgJnpCAC7kBVALYKCS3PoUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y+7QX2ksDNTLXpvsu6qpfSKmyYLVJkVlb7f0wSRM9Q=;
 b=BoVPMVVuMBQErisG9A8UQZx1Lef2PGz+6dGVipsgfzi0bbmETH9bgpa5ICkLWtQIV5LFCR4d4OjfQX2dE39ZXWil/dQF4pwEUXYgPKyrHj2pyz0fNQgxngdijUtLSVf4x+OQhU7YTMSPMR5iomXlYmwIbV29oX5nLo3WxlFoETexlnwYP9LSyx5rtDvWVonOrLGOEMv0KZCgd4Zmc7uT08dX0FSkdOb4hcXAs9FV7eFonzuP+LCgG/X4PS3VbUaLuyR0fnhCiCquzq+5pIsLh5CXZbqLEG611ckIH3qdYISA9NDsGsQWyfquSDwByY1oRKTyRUTbZx4Zt7VBP/+l8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 18:46:51 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 18:46:51 +0000
From: Zi Yan <ziy@nvidia.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Juan Yescas <jyescas@google.com>, <linux-kbuild@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 Isaac Manjarres <isaacmanjarres@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: Kconfig for range is being ignored
Date: Sat, 17 May 2025 14:46:49 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <86B954BA-2AF7-46F8-8C56-966D24889139@nvidia.com>
In-Reply-To: <438DD530-00EA-4F7E-9CC0-A1274400DD84@nvidia.com>
References: <CAJDx_rjX4Z3QvoFDnQ7qH06x+Q+pTP3bAyLv2GD2C+CoWu9haQ@mail.gmail.com>
 <CAK7LNASeN7za4eq2rsTO255y2A6m9uzxec-MSn=TyM=qD1iEOQ@mail.gmail.com>
 <438DD530-00EA-4F7E-9CC0-A1274400DD84@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0264.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 848f6a6a-5020-44ea-b629-08dd95732fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVEreDNZVkR3OTh5RTBmcXMrRlhFOUF6VXhkRmMvVkpIY2hnSnZwaTc2c2xG?=
 =?utf-8?B?OHI5SEg4dXR0b09ZWEtZcTBNaVZLeFRJQnBNaExsekdLeC9rM3ZWZEFhcDRl?=
 =?utf-8?B?aTBZcCswUm45UEJmNDAvWWJLWmlaK0h3U1UzQjNubkNXaVN1ZzlSTDlCaVpx?=
 =?utf-8?B?T3lyNjk2WGlRZjk4ak5xdjVSSEtqVmNqMERpUVAvamVmTDhTUXR3Q2dvYkI0?=
 =?utf-8?B?dEYvckdab2hUQXJsMlQrSEc2SlA4cEg0SkEybEYxV2dOa0FRN0M3d0NpeVor?=
 =?utf-8?B?d1E1SWpZd2xobW5oR0dDMXhYdlFzMWVuYWQyQnVlNXNBT1RIY25URUUxSHlF?=
 =?utf-8?B?MTNheW1WejNlSks4UllGY2JQbCtmYWpxVzhaNEMxVS9UZ1Y2anRpQUJjSHNx?=
 =?utf-8?B?Mkh5TjI4RWxGRGQ3elVEaWtjWlBJcU1pQXVLanNZcDU3UEdGV3NpU05ST29W?=
 =?utf-8?B?eUdHQmhkd2VpRUxUWTZsdWpXVVpxbWlRb21OZm8zZW1xaFNIN3FHYjlFUm5a?=
 =?utf-8?B?MDk4bW1ZVzlRZmRjVzdWL2dpRGhTei9FOTRFOWZjMWpqaTFZVHpuOGpjTGhB?=
 =?utf-8?B?OHZkNi9jY0RHVEw4WEtkTnBxQ0p0N0hWekJ3SGlIc2x4a0xBRWMwZ3puWWlt?=
 =?utf-8?B?OURsM0ZhdjZhM3EyZnNueVFLeVcxbFhlcjVQYWJZWlhRUUdhWXIrcGVPM215?=
 =?utf-8?B?dytrcWtDbms1M0R4OVBGK0ZzbVdVdG5tRFcxdi9QaUJERncxcmFBc3hJUVY1?=
 =?utf-8?B?ejNvM3Q0YzlZbE5qZjZoeCtOaHMwUzYyTmJCTENhZ2x6UEU0MDM1ZWI5RzAx?=
 =?utf-8?B?RGVoVllyWkZtSy9GM25iMGJwRDdwdWRJNkYxcHNkZkJ4VVF6Y1M0VDBsVFJq?=
 =?utf-8?B?MGlkTWJkNXc5OFhpcFU1WnpGNTdnYUNKRVZnVERhTzEwaWkrRVo4OGxKU1Vl?=
 =?utf-8?B?N1UrVnloekZPUEoyYUlJQkhGRkNaYjUwbURnbHYySXhvZFJ6cm9Ec1FQUU1z?=
 =?utf-8?B?bjF2azVSYmdpSmpVNEdVUjg4UkQzazMxOU52UVdreG92ZThlcEpiYmdIYzVF?=
 =?utf-8?B?U0ZrVHh0SUlsbDRuK2lrdzJqOVVlWnVZNTlxN3k0bTVyRWJ3K0dvZS9FWGdj?=
 =?utf-8?B?RG1GUDZic01uS2VMVU9nb0k5V1cwUlBQRGNTMWlwaHVpd2pnWTZyMElJd09T?=
 =?utf-8?B?bys2ckdCejA2dmRVbGp6MDRvajhKZ0l5S09rTlJCeXR6VXFtc2pJSDV6QVd1?=
 =?utf-8?B?djJlZTNDMC9zdmJpcitYZmVxM3lmTzQyYzE2RUYxWEs5L0lrbUpmalAxWVNG?=
 =?utf-8?B?NUYzeDZONWNxUCtyL2EyMmpEQkpBQXpTM0pGZXYyUDQ1bEFmMXhaTVZIcWpR?=
 =?utf-8?B?cU5wZXdaWEMrd2JYQnZVa2ZNSVZlRTB1SmxHaDVISnVWNCtaT1dCanRGQUlm?=
 =?utf-8?B?NCtJNjFKL2ZKMlQ5dGpWd3l0RE44UHl4RDRlMFBzaWxZREp4VkJiKzRsOFFZ?=
 =?utf-8?B?ZTVEelZRa2JnUWp5THkrUTllOCtKamFvVHdLbGU5c3NlM05qd011OVVQK251?=
 =?utf-8?B?Qm83TzJnNDZhbE1ocWExZVpRc0dUNVI3Y1N4N3FkLy9GUjdsWWY2NHdmTFZD?=
 =?utf-8?B?VGJNc2JHc1BqRTJXcmhIV0dOdWhVODRjSEVNaHpiV3RjZzkvbWI3UnArb2Jq?=
 =?utf-8?B?d2NKelF1Y1VIWW1pd1JvVzVEdlVWQ1pBdWZDRW16SVI5c0pudlJya0k3dFMw?=
 =?utf-8?B?aFFJdlp3YlRJdjV3SDFOb3JwOUQ4bUxFbms5UDVTN1lTNU1JZ1ZzYTQ0M1R4?=
 =?utf-8?B?dUNkaDNrYWlmU2xSMTdvendPTXFnZW1sL2JJaUh0RXJMdlVIVmI1ZVFoNEVy?=
 =?utf-8?B?TGVqaURsWXlqUUk2RGIwZFJpeE1qR3RBb1lQQVNuUGVKOS9hVVpjaWFqTjRF?=
 =?utf-8?Q?vENvpefL/SE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVISStkSEpjOFJFZlRFYW9hTzJoZVM1MUs4bmN2eUlTTWRnbHVYYkt3Qndj?=
 =?utf-8?B?dkppYUZkRkg3VG5lT2dpb3MyL3p6MWt6c0dBQ2VWcWZJUnh3aEVoRXJrOWtQ?=
 =?utf-8?B?ZWhSN1I1QkVvano2cEtnaG1FMm5DUnNSUUNGMk4xNGl6d2ZHdnlFK1c1Mzcv?=
 =?utf-8?B?TW44TnlybUUrSWZCbGUxQ0IybUlVaDZOUXo3NVR6dmFWVEtpanFRUzJVNm9F?=
 =?utf-8?B?Q2pjd3VwSTNGbjJLS3UxQ1VrSHBZTi9ZNFgvTzZIbzdTekxLVTliaXVLZkNo?=
 =?utf-8?B?RHBsWHpLWXVTWTlwM2tuL2VvK3ExQU8zMmlabU9Xa25jaVhqcEJnaHBBV0ZS?=
 =?utf-8?B?ajdNbGlMeFZXWkhLZjBGL3B3aHd2NzRCVjZhWURUK1VONzF0YUJ1SjBZMk0y?=
 =?utf-8?B?eEt4Sk42TENQNlkvVzVpRFlmVU1TbEtXdkIvWUFoNjlNN1VuQlVzMjQvYlFK?=
 =?utf-8?B?Rml1REdpMXRZTGRyUDJMdEpRZnFucjF3RXFnQUZ1Mi9ZZmZuMTRxUWprR0Iy?=
 =?utf-8?B?RWxjczdpMXlxZ1BwZCthVS9KRldLM1hmUkk3RGNaQXRkZ2h1UDZoRjBFMlM5?=
 =?utf-8?B?cFEwc2tZejc1c25LVFBncUVqWERXNzAwVmVSZ05FNHR2Mm9Udzd4RjMydU1I?=
 =?utf-8?B?RHBic3dQMzBKcUVUUlZyS0FyQnVHbEhNbUlNT2VkalBXc0IxQjRMV05rNSt3?=
 =?utf-8?B?UUpXK3VQeUU3cHRaZ25MM25vVGIyeUhwSU9JTDE3Snd4dnZvZFhNeG9RY210?=
 =?utf-8?B?ai8vNVNWZFFZZGRIcWRPaXIvcDArSldsbW1FUW00ejFMajJzaXIrak51dlZC?=
 =?utf-8?B?QzBlWE9yanhqZ1UrNTRSdXNoTlUvRUN1bG9nUGVaUS83akJkem11V1hSOW5O?=
 =?utf-8?B?L3FkeFg2djBhK2o2aC9HaGZJOGNWRSsvZkF3MEV4Z3U4UEYyMDhoOS96UUdV?=
 =?utf-8?B?b3BTQ3BuSWZVYnR0cWpDeEJMYzJzUmJ2T0M2cDhiQXdYUktZcDQ5Z0NEVkIz?=
 =?utf-8?B?UmJwaWZyYlo1NDZ1NzY1a0FkajJSenNrRFRjelNycEhvSDdIRkZ5SmxDeStw?=
 =?utf-8?B?Vk5oV3FZcGZQcnE2WkNiSlNrUjY3RkZNQ3lycEpnVzlhVk1SLytjYVhicGRk?=
 =?utf-8?B?dHUyYXA1YWprbGM2RlBBeHcrRk9TaHZoSWJTVHZYQ2FmNFJWMThBVjF2TUsr?=
 =?utf-8?B?bDVsTHpuek5zSE9HTlE5dlo3V21vL3NEREF0dFFhRDZMWTFBdjdCVU8zOVJR?=
 =?utf-8?B?Wjl0cHhHTS9nVGtwczkzdlNDWWFVYmNFS3JrbXd1NlFLbUUvL0lLYmkzRjRU?=
 =?utf-8?B?Q3hzb0FPeDd5Sk8wMlBaUGNnZmFjNWZtL3F0dGtjaEFyQVVsTkhUQlZDRHUv?=
 =?utf-8?B?aDRLWWd5SHc0aGthZUcyZ215NWI4MGFuc3R4b2l3RnVGUDFQQlRBMzhVeWZV?=
 =?utf-8?B?c1Zwb3RrM09VcUNUVnhDdGpOUWd3a0dHVk5PRlVVL2lTamhRc3dPbFMzalJU?=
 =?utf-8?B?TmgxTTZGRkx5QmJTMkZyU1BJb1paYUdvTlhnOC9FSzRNUEZoUGVQUFJwTG5K?=
 =?utf-8?B?YzJUckVYQzYxdVl0R1ptVjdtT2hQUHRpYTFXZm5zZ0ZTSkFXN2NiOTBzbXNT?=
 =?utf-8?B?ZjBWbkxURE1mUkxIK0pIYmtEZytVUjUveHN6TnhOdUhoYTVadWR5YnZ0enhS?=
 =?utf-8?B?ZEQwZ1RhVURlVzBNaUFjQmVTTnNkeHZJU3c0enBxMHA3S2pIeTdFcVc4a2t1?=
 =?utf-8?B?Ky9iZmVzRXY5amt4QW1YbUR4UndZbjg5eHZ1Wmc3cVRSOFkxVjdFM29kOWxS?=
 =?utf-8?B?dFovaERXVzNJSWlPOFY0Zk01SFA4amd4OXJveXRhMWljS0wzUmQvNm1Obk4z?=
 =?utf-8?B?bUloV01Rb2tPSnVwcXVPMC96V1krTFhYSjhRY1B6UDZRRmJaUldMS3ZGNlBy?=
 =?utf-8?B?bHpGejVNTCtYSHBhLzdoTVVEakhKT0V5eUQvajJycmpGQ243L0sxTHRseHd2?=
 =?utf-8?B?WWFQOWVEMytWZ05oRTBUTzVOdUVHR2UrYy85TlNwNFF5eGw4NkR6bXU3NExo?=
 =?utf-8?B?K1Jhdkp3Nitac3NTa2FiWGh2ZWpFZXBCL2JreURhbTlodkU5UXI4cGphdnNR?=
 =?utf-8?Q?QbOcY2seC/wXPdgD5UiGD2vjq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848f6a6a-5020-44ea-b629-08dd95732fe5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 18:46:51.4791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dwl9zBwgBsW7plMRykRDSeB8u1Me/DFOlHL9MrLLt38YDX6YxmXN2zvSGFvs2+Yr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196

On 17 May 2025, at 14:42, Zi Yan wrote:

> On 17 May 2025, at 2:45, Masahiro Yamada wrote:
>
>> On Wed, May 14, 2025 at 5:18 AM Juan Yescas <jyescas@google.com> wrote:
>>>
>>> Hi Kbuild team,
>>>
>>> In the patch from below, I am adding a new configuration that depends
>>> on ARCH_FORCE_MAX_ORDER.
>>>
>>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>>>
>>> When ARCH_FORCE_MAX_ORDER is defined, the max value of PAGE_BLOCK_ORDER has
>>> to be ARCH_FORCE_MAX_ORDER.
>>>
>>> mm/Kconfig
>>>
>>> config ARCH_FORCE_MAX_ORDER
>>>       int
>>> config PAGE_BLOCK_ORDER
>>>        int "Page Block Order"
>>>        range 1 10 if !ARCH_FORCE_MAX_ORDER
>>>        default 10 if !ARCH_FORCE_MAX_ORDER
>>
>>
>> The logical calculations such as "!", "if"
>> are allowed for bool and tristate types.
>>
>> Here, ARCH_FORCE_MAX_ORDER is "int".
>>
>> So, I do not understand what
>> "!ARCH_FORCE_MAX_ORDER" is intended for.
>
> It is intended for when ARCH_FORCE_MAX_ORDER is not set
> in arch/*/Kconfig and has value 0. Would
> if ARCH_FORCE_MAX_ORDER == 0 work?

if ARCH_FORCE_MAX_ORDER = 0 and if ARCH_FORCE_MAX_ORDER != 0
work.

>
>>
>>
>> You are doing what is not supposed to work.
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>>        range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>>        default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
>>>
>>> This configuration works on ARM64, however, on powerpc, the restriction is
>>> not being respected.
>>>
>>> The main difference that I see between arch/arm64/Kconfig and
>>> arch/powerpc/Kconfig
>>> is that powerpc/Kconfig is using ranges, but not in arm64/Kconfig
>>>
>>> https://elixir.bootlin.com/linux/v6.14.6/source/arch/arm64/Kconfig#L1637
>>> config ARCH_FORCE_MAX_ORDER
>>> int
>>> default "13" if ARM64_64K_PAGES
>>> default "11" if ARM64_16K_PAGES
>>> default "10"
>>>
>>> https://elixir.bootlin.com/linux/v6.14.6/source/arch/powerpc/Kconfig#L918
>>> config ARCH_FORCE_MAX_ORDER
>>> int "Order of maximal physically contiguous allocations"
>>> range 7 8 if PPC64 && PPC_64K_PAGES
>>> default "8" if PPC64 && PPC_64K_PAGES
>>> range 12 12 if PPC64 && !PPC_64K_PAGES
>>> default "12" if PPC64 && !PPC_64K_PAGES
>>> range 8 10 if PPC32 && PPC_16K_PAGES
>>>
>>> How to reproduce it
>>>  $ ARCH=powerpc make allmodconfig
>>>  $ cat .config | grep MAX_ORDER
>>> CONFIG_ARCH_FORCE_MAX_ORDER=8
>>>  $ cat .config | grep PAGE_BLOCK
>>> CONFIG_PAGE_BLOCK_ORDER=10.   -> This should be 8, NOT 10.
>>>
>>> Is the Kconfig in this change
>>> https://lore.kernel.org/all/20250510010338.3978696-1-jyescas@google.com/
>>> configured properly? What needs to be changed?
>>>
>>> Thanks
>>> Juan
>>>
>>
>>
>> -- 
>> Best Regards
>> Masahiro Yamada
>
>
> --
> Best Regards,
> Yan, Zi


--
Best Regards,
Yan, Zi

