Return-Path: <linux-kbuild+bounces-8167-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F7B11F3D
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 15:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46254E22EA
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 13:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AFC2ECEA4;
	Fri, 25 Jul 2025 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="VhnbYj2a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2139.outbound.protection.outlook.com [40.107.116.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9423E335;
	Fri, 25 Jul 2025 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.116.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753449342; cv=fail; b=p+XrJyM6dzXYcE1UMaGiAQJykSaz67zrg1uQTjPqv9FibH7oZmeRhCsSxPSPAXdEjJEZxRr69gsnwYezzQJGsKFHHgvuAKRzbPeBcjNDdf9QgEaQWNlMkCaYgEwL2HikNo0wy9m5nBL5hduDsaP9oeS9Uh6imDlUGsN7Cp++BY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753449342; c=relaxed/simple;
	bh=7uyTfhqAYDF4ObjF75+sUIE3RSPXMsUZx+iSRRqB2K0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I8EmmHG7xBLHw8Ha7u+znzz8Msxm8T5oVsQy2AnV1Rcg4VFwNXtAZ0eoAueaCdpx3MtZzFAfi6YTqr3jMCzxBn2DKLM1xEb1WReb04kFHbFxeLwNd5aPkyWYrzGbEJZChR6UUbjWcFq6rCkS3FQJ65D0d0zss+Xv72QfYbjWhgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=VhnbYj2a; arc=fail smtp.client-ip=40.107.116.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJjbsktf00Mr3RbKjZbldNRUnp6P74MLbblkd/QPaHhAYBZluLJTDkQreMa1HB12zrDpG4Lahijh45LfU8U+gPlSt2RGmYnv2xiZ03kQ64XRT9srSsc3F0QzYhZWVl/rQzf/8pxhZ17G5RbXSWgY01doV2Ui6xZpPUjf73ZCiJz6z/BuI6ShQoGgWTPHjby5nx0AlSjtSQFHyHpT1ybXgKuGToArkfXFg/92B9bdoqLltceU/6EaRqZSi7Km43jxCNVl6xt9qwptS85/RzPxmBGf3FwYdVmgwE240JvjteRr3EPRT/m0EPguFvm73UJYK969i6w1ngwrxMzHLWXDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWwkZnZ3bfDYstg2FqYAk6KkxLAjiYrBRKjU0dEAyG8=;
 b=OJcSDIEhKx+uaLGUWaxLLG3hA5dNsxRkH/vUlN9xxgPUqkYry4dcp6GZKIHnfpZqVX4khFANTD8Nud30vWlVIIm8qZelSZGvzv96rM+KK53ls9nqWhInPqtoL10kYfMcaM+bRcWK3mt8322I5r9Ri0y4yPqrfj6skFXT8SwiMqNyU7TSJingbe/O/NL2JEikaSkaWEJkT4M+cPmFAFGndp52HR01zKOgHyiMHQUizmJ3+CkwIarawj3Eh0qtcLw/Y6kuaZC3Z614QQb/VrgCLSPWEACU6xM9ySIHmlrEwS2jfKieuVKPU54hOk714sCO3qPiGhwyn3bSw4cIYsmWXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWwkZnZ3bfDYstg2FqYAk6KkxLAjiYrBRKjU0dEAyG8=;
 b=VhnbYj2aCb862xjg9YfceOz2Af/P5Rb6gCOl2PUlfxHJkKf0mhkX0Shv2/RtEyf81X8SyOSqEMuzVNsW/Sid/kVNbgQol0dNZL086yDxvypU+FXDUBqOlfWO3gHh4USSFesolk7QOgM+vzjst8hdlsKDVm/J/4jDt9AydU9cwYa7OkwGWz6JE9gYNRReGX4OMdrWcRYyfgbWBh659gsnwh0sfj9fW7W/CYS+JF6XNX8lWGiV3YlxLFNL6gMp9SM7myEvGIlSikVTyu9BMGK/qa93XpbZmA892XAv3sac/q0vYjn/ii+5DYsp7vNwELFvfGCVGDmhmIeTiUBl0XexMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:be::5)
 by YT2PPF12FF28F4C.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b08::411) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 13:15:35 +0000
Received: from YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4]) by YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::50f1:2e3f:a5dd:5b4%3]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 13:15:35 +0000
Message-ID: <a1f2f201-61f9-4564-b0c8-45c4d912bd00@efficios.com>
Date: Fri, 25 Jul 2025 09:15:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] tracing: Add a tracepoint verification check at
 build time
To: Steven Rostedt <rostedt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250725025149.726267838@kernel.org>
 <20250725025213.342188378@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20250725025213.342188378@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0031.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::44) To YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:be::5)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: YT2PR01MB9175:EE_|YT2PPF12FF28F4C:EE_
X-MS-Office365-Filtering-Correlation-Id: ea2e8a80-ba85-443f-a0d6-08ddcb7d5761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVRNRWpzbUtBM2ZNU05TSlpLdTYxaFgxc1JoK3NaQ1lOci8zaHNGZ2RUbW1z?=
 =?utf-8?B?MEExVG1WT2F3SnovRWVHV0NpanR3c05tVnludDIyOUZubEU3eEllbjNWQTkv?=
 =?utf-8?B?WFN4Nzl2NmF3R21DS3d6RlhPWVBtdktRSnJGM2wxZUdIbHZNNk5LMzA2cnJ1?=
 =?utf-8?B?N3BhSnJPd2ZrRTkyTnNpSGdSVEVUV2d2OFIxQkovVkZJMWVaM29PSlB0L1N2?=
 =?utf-8?B?ZEQ2T1FNL0RCWkNaUXczTTFFeHBVcWNrcFhFUnAyMXE4N3ptMjZFaEt5Y2VH?=
 =?utf-8?B?bVJhTUQ3OGRZby9VOGs0eXlrOVk1YmFvOWFUMFFOQnJlTWRuamZ4VE5WL0Ri?=
 =?utf-8?B?aGhEV2tFMml0Tk92RERHV1l3bG1XTThkQ1B0NjBiWEp1bGh5Y3k0dWIwanEy?=
 =?utf-8?B?czV5QkczNUFhai9GWGQrQ2pqSkMvQ0lyclJOem1FRkYyQ0tUc1dqQkJzZmJt?=
 =?utf-8?B?NWlhaEh6R3VDa2Qzalo0RG4vVm0vM2ZUYXdiL044Uk54Z0RvSjZKeitySWdy?=
 =?utf-8?B?WFI1aUxVdjNnV3A4T0l2SEtXaXRoVTFRVlNOcUt6TG51QkUyNWRmbndxVG9r?=
 =?utf-8?B?WXVNK2VnbEJ0MlE0MkJyNU9JcUhzdUhTeEJwUkxBQ1ZsT2kxaDFsUHRWUWpk?=
 =?utf-8?B?dS9ET3VjOGtQZmxsais2ZGJLQUcvTXRJeG5pWVowVTB5RFlYY2czSmk4RXdB?=
 =?utf-8?B?UnpVTFRPVUtHc3JlVnFhZzMwamdBZmJvRGVTSEJVaks5YWxzdWpqekhrTTBS?=
 =?utf-8?B?RjJ6WXIwWUdGYy85TU05eHRkelljUCs0OS8xaTR6WDQ3UUdJbnFxR2JRaVdG?=
 =?utf-8?B?NElVY3l2aDlTRVF0a0xDY0wxZFBocUZKY3lxU3NBYUhvUE9GWm9BbDBsL0Y1?=
 =?utf-8?B?UUxyRytHdUg5c0RxU1BMT05pZEhxdWJWdlE2eEhleGw4S3F5VGVwenJiV1Rv?=
 =?utf-8?B?QlRFYlA2ZWszYlBwOFZpWndOdkVYU0wvVTRLY0x5eEptL1U1QnRhZGtvbE1X?=
 =?utf-8?B?NjNqVWNmTGk3VVdIb2pCUGY2YmtRcDZTN1NuME9IWkl4WlhSemlMQlFCV2Vr?=
 =?utf-8?B?eDNhSEkxaUovOE9rVHlUWXJSNEhaUWFVWTBJekJBeHIwZ1ljUk5udWlVaUpw?=
 =?utf-8?B?S3JickRXUzhzQ2lNL1gySXowV3ZHQm9zL1dVQ2UyR0FRSmxnTHdveVpWc1BK?=
 =?utf-8?B?Y2Zhb2pUMkR3S056MGlmMWpoVnA2Ui9VVDBCSUdJalJLdXRlWTBXUytOSzB1?=
 =?utf-8?B?a283dkM1cnlGTnROV0J5VXEvR2oreko1djYvaWhFSk9wT0VCRGJNM3NWN2xC?=
 =?utf-8?B?UWRqOFgyb09GQTBCMUFmRFMyL281SHNUa0thOEd0UW51TyswOTcvNlNxNTg3?=
 =?utf-8?B?S3U5c0Vhd1lTR0JPMlgzTVdPbnpNcjFyNFd3eE5sRHJQQ1VlWm1kdDE0dmZN?=
 =?utf-8?B?bmtWYlRKN1A0S1FBNW5Na0NORFB0c2lOVmpqODhXWFJBT240bTZDdS8xVXVz?=
 =?utf-8?B?KzVHanpIOEJJUzZrT1dlaEVybk1oQ2dNK1Zwa1cvUXlaRVRPNWZTV0lyNjlK?=
 =?utf-8?B?dHczMXptcHdMYmFpeklocXB3cFhZOUJTT2UzVWtmT2FrMnR4OHdOVkt5eXc3?=
 =?utf-8?B?dzNTMkRTZ1dCSURrd29vampVZmlBbFJNMmpoSEhSZ1d3UFBldnQrcTNLeHRl?=
 =?utf-8?B?YmtwRExhUXV2dTlva0hqSm5JOHBWWHdSUENxc2dDMWNWbGxoZk1ZUDBXZmpX?=
 =?utf-8?B?U2tQSEtJVkJCOVdvT3JJQWNZU3F4bi9ubDZtTXovSG1VNU52R096S2lWd3B4?=
 =?utf-8?Q?bcd+vr5FGkeZbB25iCr74Fua54FocdRQ7Db+w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDhMTG80ZDBINXMzcFZaUVp1Z3lBQVU3dHFuZDJzbTl0akpNS1Z0aStGd0FU?=
 =?utf-8?B?Y2oxS04zTXFET0lPd21nOEpHbXl0MTJyM3I5YVJzc0FzMEx1VDAySnI5dU53?=
 =?utf-8?B?SWIvODRKZ2ZFSjNXQ29kRFpIMGxpTit5ZXc4blNSODltNGdPL1lnRlZuRkZP?=
 =?utf-8?B?eUcvRUJOMENFWGM0U2pHTi8wTjdSYmh6bDg4T0NFNXdGeTZsbm1qd1ZFdDdp?=
 =?utf-8?B?QWRXZVJ1b3duN2ZHOGtZbU5id1hNU2JkT2hYVHpoRVNVWTJyV1NXY0ZqTjdF?=
 =?utf-8?B?TDRqamxoU1NkWmk1SXZmazE4cWxUUUlKUzBJKzJHMTI3cHJpWWF1TzQ5YmhE?=
 =?utf-8?B?b1pQY3JKK1R4OWNsa3lQdVRmR2tyaVlJVFV6NnJIYVpxc3dUN2xwNWFBMVln?=
 =?utf-8?B?K0JpSitMU0xSSzZqNDFHM1YwWXlxV3dCTy9yR0xYeENnUmRwcUpBSFFZS2lH?=
 =?utf-8?B?WGRWajJSemtVa2tBenRWMitQSEdSdGprRlNwbEE2YUszTXY1Wm5aRWtjbFFR?=
 =?utf-8?B?Z1FITVRubnBMb3lBWGd4Y1JvUitPYjFhMmk2dE5pbmRlSTNrcGo5WExjc2hl?=
 =?utf-8?B?cVl0QUZUZGMxTnhkWXRyalcwWEJNSnoyMG1weC9xRi9meVpiK0hjdmZ6MWJk?=
 =?utf-8?B?L09QemtYNW5FaWZHV0crM1VOTnpKK00yTzRCT1p4TXY5M3ptdjY3eVVJUkQ2?=
 =?utf-8?B?RHBITzdPdDFydWpqR2dqYmlrWW5NRk9tRE84UlNKZURYbEcveGozdzhqUnQ5?=
 =?utf-8?B?NURNbG1wcU5jYTZlbW5LVGJwQ3lBbHY1YWtQRmNmZ1l2K01nbTdxczE1Qk0v?=
 =?utf-8?B?S29KS2wwQmREeUlFU1IrK3NOaVp0ZVorbnphWTRmQ0FPQ3MyN09xL1pJRnhU?=
 =?utf-8?B?bDhhclphRStBbHlUNithVUx3NXExNWRzT1RQVHA2YURpbHFaQkpaOEIyQTJU?=
 =?utf-8?B?eVJ0dXg3L3ZPYkRyUTNXTW5SRzdZYlk0L3BQcnVBSE44SHJBYXhUZlA0RjZO?=
 =?utf-8?B?RDg5T1pCbmxSaGh4WERubFh4eHBwTGRpN05yQld0di9pVys4T2NqUjJURG9Q?=
 =?utf-8?B?amtlRW9WOFFlQ2VrUzg3aWFYYnJqcDZidUFEamJLMHhRUFRVczA2YkNpeGRZ?=
 =?utf-8?B?OXFXQThxTDNDNEJtLzFkSDZGdzN0NnlvcGNrN1h1Y1lFWDV1M0NWQWd1Qjlx?=
 =?utf-8?B?VklCdTBPd2ZEZXlSZHNsMzgzRmpBQXJ5QzJhakdtR2lkSTcwZUt3TnhTWTBJ?=
 =?utf-8?B?bjlzQVNUY1pBd2pWd1BpbWtROWNyVXhDczlUMmNLazk4eFBHUUZXdnJxSGhG?=
 =?utf-8?B?UkVqSWxhTG1pKzVxdnZtdTQ0OTFhTEN2cTJWbHkvNlZzRXZUWFJ3ZlNMeGpP?=
 =?utf-8?B?V2J5VTZnZ3VTWTFrSVMrbE5HVnpLNGZ5TGt4ZnhFenI0WnpUdUVFblNNbUxN?=
 =?utf-8?B?ZW9yYVEzQnI3dVk4QTlIb0s0cXJDc0xHWVNRTmJ0VXZ2Ky9wQUpkV3BscmhB?=
 =?utf-8?B?WStUaW1oS1c1SjZESy9mb3hIcWJ1YVJwano4N1FBRm5xSEJkeFdOM25vLzBu?=
 =?utf-8?B?YzQyOVM4eDk2NGJ3ZmE3NThML3lvVk9pcnFUb0ZlNGRkenZYM2VEWmZhOTRo?=
 =?utf-8?B?emU2cmNIOHhML01TemRpekFCdnFtTXZ3UWFreWJURThheEVBOEUzM0d4b2RC?=
 =?utf-8?B?cmRBeDJWQUJzc1I2ZlVpZkpVSi9uMkFGVzdmd0dtN3FhclZRTUtwZUlGbllp?=
 =?utf-8?B?Z2V0empGbjNlWEs4aFdBSVhQVFJrMGR5a05WSEdhZ1o4SExJNWQ2NmUrVmpT?=
 =?utf-8?B?NWhFYWNDODdWakRiZGU0QmQ1eUc5UW8yMFNJSHovOVZVUnVkT0pKMDdqeGFU?=
 =?utf-8?B?R1YyNW1lVkhxMTEzNDB2YmxaNkJOWXpQdTlMQ1NLOGV5ZWdMa3VkQzlYNUZO?=
 =?utf-8?B?YmMxSUl4YzNhY0tkVUkwWi9TSzhmWndUTjVURExmSEFwM0NiMzlBVEljaEI0?=
 =?utf-8?B?M2YzQUJFODVpTFA5L1Bza2xrb0E4dmRPdHZoWFhTZG43V2FyRTRma0xwZ1Nu?=
 =?utf-8?B?SXpMMFVGTEV0bERyalQ4a3Fhd2E1R044amkyS0NnWW11Mm5Gd05EZndOVlhi?=
 =?utf-8?B?N2x4U3dMVUpUMzh5RENUTU43TjY1ekkySmVyQUl2U2M1b2JtcXdoWGhadEtV?=
 =?utf-8?B?VTdYRHFlRlljbExSTWJ6ZWErRVkvaTRCZkFGbEtEZUw2UWkyaWQzYWM3YUky?=
 =?utf-8?Q?wemP4zF8ydXQKbZUOt27Psin7R3/R1ehDoWmaBNijc=3D?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2e8a80-ba85-443f-a0d6-08ddcb7d5761
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB9175.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:15:35.5446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bJJ6Jp/cSlDCamK7CDmVSpEg0zZzVCt49L2oIvamchHKg2rzV405VQQnRNnGjKog0aFZ+2ovD1dYyV81vhgcu/Myd2lcqQG107+e828sh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PPF12FF28F4C

On 2025-07-24 22:51, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> If a tracepoint is defined via DECLARE_TRACE() or TRACE_EVENT() but never
> called (via the trace_<tracepoint>() function), its metadata is still
> around in memory and not discarded.
> 
> When created via TRACE_EVENT() the situation is worse because the
> TRACE_EVENT() creates metadata that can be around 5k per trace event.
> Having unused trace events causes several thousand of wasted bytes.
> 
> Add a verifier that injects a string of the name of the tracepoint it
> calls that is added to the discarded section "__tracepoint_check".
> For every builtin tracepoint, it's 

its

[...]

> +
> +#define for_each_shdr_str(len, ehdr, sec)	\
> +	for (const char *str = (void *)(ehdr) + shdr_offset(sec),	\
> +	                *end = (str) + shdr_size(sec);			\
> +	     len = strlen(str), (str) < end;				\
> +	     str += (len) + 1, len = strlen(str))
> +
> +static void make_trace_array(struct elf_tracepoint *etrace)
> +{
> +	Elf_Ehdr *ehdr = etrace->ehdr;
> +	const char **vals = NULL;
> +	int count = 0;
> +	int len;
> +
> +	etrace->array = NULL;
> +
> +	/*
> +	 * The __tracepoint_check section is filled with strings of the
> +	 * names of tracepoints (in tracepoint_strings). Create an array
> +	 * that points to each string and then sort the array.
> +	 */
> +	for_each_shdr_str(len, ehdr, check_data_sec) {
> +		if (!len)
> +			continue;

The len==0 case would be when this skips section alignment padding when
the linker decides to align the beginning of each .o sections, which
ends up appearing as zeroed padding within the resulting vmlinux.o
section after the individual sections have been stitched together, am I
correct ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

