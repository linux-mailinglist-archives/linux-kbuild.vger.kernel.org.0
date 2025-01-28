Return-Path: <linux-kbuild+bounces-5564-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42205A20DA8
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jan 2025 16:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6631B18804AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jan 2025 15:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BC441CF5E2;
	Tue, 28 Jan 2025 15:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="ruLtgPEn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020119.outbound.protection.outlook.com [52.101.189.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005431D7E30;
	Tue, 28 Jan 2025 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.189.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738079628; cv=fail; b=bNOSmGYciaYHT/QQ0t9FqwADHBtWP12KKzdtY00ocxSz4Ln46LximimwyotCr/AwSBV1x6K0E7Icxl6ZAmYeSgcn/h0//CNjQpofLxSrMwoQgfpu4VLLOr2+pxbTn0UYWOxuYMaJQPKwHy7z8qS3evLrOeBTw7GxpqcV8jOKYr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738079628; c=relaxed/simple;
	bh=laHPRtfTuaf6mZIohpUvQawZODQEqPXS5brJgjIm4a8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JCKUALOiXJPbCh/lOy1C6gjfBCWzqOFjoHvDL+OZAGyEi6vb4dVNUkYjQEcRaXWIRJ/nPT/E8PuzwA7V29BW1o1/nPhRR9tBdymQ/ZMNNm230bwmjY8agEPrQ2q8ovwWFDU31J7G0rx6g+9ZECoyWaJVP9g7G7bX5jgBgoE5WsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=ruLtgPEn; arc=fail smtp.client-ip=52.101.189.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCYUKtrcynAmA3WUBazTw/Zd4U8kyD+q0yXrl0yHCiSAOgfxi2Cw74jD7O1ytJdteEAZ+ozt897gNrhUHum1b2adBfXjJD7+ny/yTmFKPsLLH0/u/0asp+eLXROjeujkh1GHTQRLYLnKz6UHP3YP706LBFKyoVyWzmvVQTKbxhb51E44VjMr3hAZ+dHXCJFiHl1iLIl5q77eYtsspvdZ6JwO8aOtglteaiXZf1S0bOdXSew8Wv/F0np8Fl9ctj7uYkUTnBE/01ftWU3Ucp55CNJeTh3wkgfI2C0KU/zRj+GrGLC7NQUxwpAxbjwnHii0uIC7zpQ9XEvaUqejVMPgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i95QI9uxrJ1jG2qmxLGjkHcrycJe+ehHqd//8bsfQmU=;
 b=l0ECEMlDEFped+rMmYL5BAz3PXuHlBHh8UNXfr6q8FbQeMeuPpVGxw8wK827kE7uppmDIvEK30sLHhgKVfSJF394EzuRDN48ogKaOWSnaOfqzemFn9WpCwkXirBII/aIvu0uD8pqZAsGt6FoyV5aAn01pJDQ4zGO8uS9rRW6WVB8w7j4c322HCyM/ffc1VJNO+WS1dakwiI/Aufun2AM80vkZkdgWPCHVjSVptHSumxR9IlBlaFvU7XaCXyIqLK31UOJsXUARuhjBRFzMxE8KSI9BbG3xECuo2nUc1a2gc4wIMEgapJFnuGnx44itIMoIpdbxb6ZM9smJf0aG5PFaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i95QI9uxrJ1jG2qmxLGjkHcrycJe+ehHqd//8bsfQmU=;
 b=ruLtgPEnNgIj4DUj3S++2/5zhnPTAvhGzJGdhEsffr4BXfUc988h6RFv+4bFZp7RF+DNvhdE+s+5RLENveLjLy/UZqP6wzIPedyN9n/gWRdnnZWZUe+2hJLjDVB3VqHuGaYjgCSgS2dL0R2wSuv2R59aXRUimjIVyB7ZDP/Wvct6VAKXggdO5O5AbK4mz49sySBQ2/gAkuKOC47PAJnui17O4+V74mpxU4NwxcHRxl7EcC57O1M5nBPuShTbD8t5noH0LM1xN+zgSWC7pBSV3driumIdf6xDhh7IyKCGXV26eKjrEf3ciaTOjbn13ixJM+iMYzueFpPrrWLsViMgnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e8::14)
 by YT3PR01MB5779.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:67::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Tue, 28 Jan
 2025 15:53:44 +0000
Received: from YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e27c:c1e2:e6e:9256]) by YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::e27c:c1e2:e6e:9256%6]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 15:53:44 +0000
Message-ID: <d0eb6abf-c0f2-4726-92ea-7d007813936d@efficios.com>
Date: Tue, 28 Jan 2025 10:53:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.org>, Nathan Chancellor <nathan@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com>
Content-Language: en-US
From: Kienan Stewart <kstewart@efficios.com>
In-Reply-To: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0309.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::13) To YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:e8::14)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT4PR01MB10341:EE_|YT3PR01MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 51569954-23f0-4f87-a47a-08dd3fb3f1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODVLMXE3SFBPY1JTREtOMEU1cEpnQWZhK01aUVdTeVB2WW8xRk1meTgzMzAy?=
 =?utf-8?B?WG9CSGsvaldVeUUwQmluandMU2Z5Uy9nUVJnYlpFeXVMa01aZEd1dHlIaFFu?=
 =?utf-8?B?SjRuMDNidUVMd1lsdkdtdW1UVWFoR29ObW41VWl6dTlkOFJ0Q3YzL3BacE5Z?=
 =?utf-8?B?VzlqelVxbis0Uzd5azIvK2dGVGdPeTM3Qm0wMlJMdEZiY1FCc3plSzBwbjBO?=
 =?utf-8?B?aGlMZkc5NHVzbTRPR3FPSU9VNXRSNDhmLy83ZHlCZnVVb3ZkYjV1TVV6cmov?=
 =?utf-8?B?VmRFWWRYK3ZVTlR0RzJIWGdINzVIcU96VEUrZUN2Qmc3eEhjWXJ2SXNHRHlE?=
 =?utf-8?B?dnE1UFR1V2RacHh6TG9ObkpvZGNDMlpsN3FrNENXTzZ5aXQ1MGxzeUMvVW53?=
 =?utf-8?B?RXRLNzBEcm9Zcnh3TnA4TXZCRXVOOVlIdDlJWWg5SkRVNVpaUG1zK3lFYjlZ?=
 =?utf-8?B?ZGs1djExWWh1RXZFa3lCN1BlaXdVbkdhVXpZUHRBa2UzVnRzOGhUckxJQlY4?=
 =?utf-8?B?NEVjby95SEZ6c2xJZ1dUVVdRSzdpcjNTS2ZjbzdjMVBWeVhzQmFiL2xKL0Zh?=
 =?utf-8?B?Y09KaDFKd2ZyWnJ2TmJBSHhTekJTd3l0aXExQmN6L1JBKzZvMXRyWFVzVVdP?=
 =?utf-8?B?K3FEanJ0Tm9NN0ZBNDJzRDRwM25ReFZWdUpaQ0hWUnFQREMrTC9rY0g5dEJo?=
 =?utf-8?B?LzJDS1BsdTNIN3M5Sm43MHMxYUtHTktrLy96MzMvVk5RSGcyUUJlTDk0aXkz?=
 =?utf-8?B?WjdNMjc2bGFPQ1krQnNPcUpoZUlXR2FNU2VCTHJTUjBtQlF1OEFObE5kaWJV?=
 =?utf-8?B?QTZVZE9jRnhjbzE3RFpiVDR3M0ovbWlWOXpjc2lWa0t1QkZaMlVPYTNqR0FD?=
 =?utf-8?B?eWE4a1c5aDBWNWpWR2tIbm9XVy85YnlzZXVkdDc0WkltQllVZTE0NkZXZDJE?=
 =?utf-8?B?TWcrY3NRYnJqUWVvcW4rUXdJN1ZoOU1nYldrcUlIZERxenJTc0JYejd4dFJ3?=
 =?utf-8?B?ZWRCc1dLR3hUaG9ReWxwOWxVNThSOGpuWVZkamg2aHlWNDcrUk5Edk85YVBs?=
 =?utf-8?B?OHRtdlhEbjVTM21UcU1qZDdwK1ViSCttM1RJYld6UXNFZ0U5VEdMV01vY0ZH?=
 =?utf-8?B?VThMaEJOODBRSzlPRUJaWDA5M2c0TzFWSWJVcCsxVUkrZjNOYUdWTzhYa3Vn?=
 =?utf-8?B?cnpYOGpiWml1ZktFYXI5SnFqNXYrV01iRWlHTDBlcDJQV1FnVFZHQytPQ3hH?=
 =?utf-8?B?UWxQelRZMWhSNHRCcWlKV3NicEtFdjZ3N3krSENQS3FXTU54anJ0NzZkdE42?=
 =?utf-8?B?Tm9tNVVyK0NVNFVqb0RMdE1OYkRXTC83a1V4MUNpWlJRSEUrZHBBbC91Umpq?=
 =?utf-8?B?US9ybTN4WTJMZDlaRlg2MHRSeGtiK3V4aEE0VXcwL0JIbTY3NStVQkV5cTRQ?=
 =?utf-8?B?RDhmMDEwVmY3RFIwdFRoTzhHbU9wdFJjVUNRbU16THViRmJPQm9oWjgyZzlW?=
 =?utf-8?B?a2dYYjFiZVRYRkhsVWtCdW9uOXU2cWxJWTEzSE16cGxWQkxBL2hEWTRhMi9L?=
 =?utf-8?B?Z2RFQU1nbWlNT2l2MnkyY0NPVVVhUUhtbGZBSERqOWhUalMxVUdtNU1hT2xz?=
 =?utf-8?B?dk1EN2JlSGg5UXhIVDV6d051Q0VsK2NrMU1FaHFBZDNXeFRHdzFCcDViRC9Q?=
 =?utf-8?B?ODBVeVl1emdCT0oxMnhmRjFObUZWMDZzc0Ywb3BUNVdKbXgwQTJDcVN3Y1pC?=
 =?utf-8?B?dGI1RFpnb2lGRmRoL091NXdGY1g5M3lNVTJERWlGMVVWUHB6MnduWDB6K2lo?=
 =?utf-8?B?QWszNjVHTUhPVTZGek0zWnFObWg4TiswbUhveWkvNnp5WFhYV1BEd3NFY1Ny?=
 =?utf-8?Q?7FGJSt9dCX7Ij?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3lJRlZzOXpjT1dBTndwZHFiaWZjOEM0d3YwZlc0VlZqMzB4MTIxQVNraDRW?=
 =?utf-8?B?L0lreHBJV1RKcVpjK2c5L09XL29IZWtCNFExZitUcHVNeDIzR0kwVGIxZFcx?=
 =?utf-8?B?dzBCV3NGaGZEYWtTVW5xUEU0WjJFK05Db1ZCa0NMWm9YZ2p4OVVkcTZib05I?=
 =?utf-8?B?YU44eFRia05ZeXlHMjh1WUNDNFozYU1wanNQYy9SK2pxOWx4bkY4UTdxYUlN?=
 =?utf-8?B?QzlGOE9QbUNldXRTK21DZnViQkpZY1ZLcWRzMnV3S2ZVc2NTOEhCUXBaTlM1?=
 =?utf-8?B?NnE0T0F5VzJqdHdhUVNSalNyTXlDMks0NEo5ZFNsVlgvQWVTaXc4TjhMdDBY?=
 =?utf-8?B?bTNEeFBBblI1RWEvcWhSZDQvSVYxNWVTOWlMSmVMM0Z3S0FwVDg3NVc1NGlZ?=
 =?utf-8?B?cDJYK1FKMlo5emlxNlJMUS9aNHBqWjVFOENWNFRhVC9jNjZOWlVGNG5WenE2?=
 =?utf-8?B?K01HalVJSitSUEtQSFpzcVB4MVlPNVBkMHVvQ2NhNnZsMWZhN0tFbFMySmdj?=
 =?utf-8?B?UndUdWpZTStBZFZRRmNTeUsvQU9OeXNuK1huOXZmak5SZG9Qc1RLcG84MlRU?=
 =?utf-8?B?YlJnTktxSmlIMTZVdW5DSFhBMTVFUVMwTVFoY1IycGV3TEpsaitjSzYxUkZ5?=
 =?utf-8?B?Tk04RlVzSC9pNWphVVZHZ2RlOFhuQk5tcWlLZ2ZVWmdCRTJxRzVzeEVYNUVG?=
 =?utf-8?B?SkxTWmZiNVU2QytPbXFZZ2tqZzIrOC8wUm1ZNWFiYlYrOVVYeGpIdFdqTGFp?=
 =?utf-8?B?Tm9yQzEwMVhtSEU0UDVQOVk1RnJoaHBmUGZ0dC9IeFNzTTRHbkxCVHlEUkhw?=
 =?utf-8?B?VnJLclIva2dVRDFBYUFHYU56Y0xkK1BmRGc3bTE3TUJoSHpXK1Fqdldyc1dO?=
 =?utf-8?B?a3pCaE1VdHZCUzBMckxBc2NnU00vMm5UcnR3cWJpM3U3QUhUV1o5cTJSRXp3?=
 =?utf-8?B?VHEyWjNwNmRkMmNMcUQ3TjRicmlLVEJ6SXphVDVmMzhKNXZtZ0lxK0t0bklm?=
 =?utf-8?B?aFZ3dWhQckYvNVBzRlArYUNOclFqTHZYaytCWmtGNFZUYWh5SlVrc0VJcE13?=
 =?utf-8?B?aHlxU2ZPT2k2M1lCcUpGSGltanFqa2ZqNkcwRURUL3RPZmxUMWdJa2tCNEpE?=
 =?utf-8?B?cHJPYStESEZtZDhQVnVVQ1kyS3NnRkVkb2RtSkJhZkZEN2hSa2FnZFo5NGJL?=
 =?utf-8?B?VHdRb0xkbjR2SG9qRzVKajg5YSt5SHNUUVMrcmhxY0VSeGpOTUNPYURMb0pJ?=
 =?utf-8?B?MmNnTkpwTjZOWUlwQ3RUUE9TTWZOc0dyMkNua2w4OW4xTFNlekwwUk9DWVMy?=
 =?utf-8?B?emRzV083MjlLR3ZKQ0Y3TXE2TDc5NzRNbmpnL2UyMEtYakRLR2JQWGFNVyt1?=
 =?utf-8?B?cEQzajl4Q0YvK2l1RDIra2hRVWhWZ0txVTlDMUxTUE5xNjBJZVpkakZvRm9l?=
 =?utf-8?B?bEJPVFBSRy9ZekhPZ1pDUTdXVWkrcUNVdFpEakhGWVJSWmNiaHFFdy9kMVhF?=
 =?utf-8?B?MEJTYjNBcURDK29Xajg0VmtEdExpWnZLRjBBNU0rOGdwWkVSamRmc0NaY2hM?=
 =?utf-8?B?QjMyeUxNdENMc1JEbVpGdXB4QUNaZmMwR3lLRUxzQU1IbEFuM1M5djBPSGgw?=
 =?utf-8?B?d2FleVVFRDBkVk5QaC9xdm1MWVBpQ0dQVytTY0diWGVZSVJqeVpGN2h6RHBT?=
 =?utf-8?B?TjVzTEFQNGVtMys0YlE4WmFqRDNveVlHQW9zakZHVVVxSlltMmdoQjRhVldP?=
 =?utf-8?B?VFVyL2hlb0VFSmJLV21JYjdueCtObFRIT09aRGFEMnBodWRIbG1UMkN4M1Ra?=
 =?utf-8?B?VXRNck0wbDRkeHlyNE1xdC91NjZhMjUxcW1NNnZ4eENOdTluTW5QVDBVbmhy?=
 =?utf-8?B?YnpiMjF0NTVmWTVXS09JOWlLR1B3QXRTbHlCZkYwUktyRlY3cFp0T3RMOXZs?=
 =?utf-8?B?dFJORE5lZVlkUHlPWlRCR08xc0xjbnBuWkg3UWpCbUFZaVVMUlV3bnVwODI5?=
 =?utf-8?B?c0lockJYemwvSnNhaE1BeEs1L280bGhyREVlZ2xNTFhTdUVlRkVoeEhUUmVp?=
 =?utf-8?B?aitkcEIxNTA3TDUvYURJckxyZkVTeHBzZW9meUlmZkE1V09QRitzUTM0ZXFK?=
 =?utf-8?Q?fA4eiM6vGQQkL33ml7Qb/17Zq?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51569954-23f0-4f87-a47a-08dd3fb3f1c7
X-MS-Exchange-CrossTenant-AuthSource: YT4PR01MB10341.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 15:53:44.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fepqQ4zJl+kevdCQp3Ifb4BLSUOczJCTUYZ28+/CMB5HHB2d/z2RZr/OIpQnMRZm7dTtyDOBx+eNqQeSUf1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB5779

Hi,

I missed a few CCs, looping them in now. Apologies for the extra noise.

thanks,
kienan

On 1/27/25 1:47 PM, Kienan Stewart wrote:
> In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
> ("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
> artifacts required for building out-of-tree kernel modules had
> $(objtree) prepended to them to prepare for building in other
> directories.
> 
> When building external modules for powerpc,
> arch/powerpc/lib/crtsavres.o is required for certain
> configurations. This artifact is missing the prepended $(objtree).
> 
> External modules may work around this omission for v6.13 by setting MO=$KDIR.
> 
> Signed-off-by: Kienan Stewart <kstewart@efficios.com>
> ---
>   arch/powerpc/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d36155cc61ab4460c7 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
>   # There is a corresponding test in arch/powerpc/lib/Makefile
>   KBUILD_LDFLAGS_MODULE += --save-restore-funcs
>   else
> -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> +KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
>   endif
>   
>   ifdef CONFIG_CPU_LITTLE_ENDIAN
> 
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83
> 
> Best regards,


