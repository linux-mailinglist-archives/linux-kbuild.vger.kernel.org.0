Return-Path: <linux-kbuild+bounces-8686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9EAB3EDC2
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 20:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F0CA1A834D3
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Sep 2025 18:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C6B246778;
	Mon,  1 Sep 2025 18:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZmbH/vLJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ahgAe0oi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09BA32F75C;
	Mon,  1 Sep 2025 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756750862; cv=fail; b=IgLkopSwICsXUSUmXdYQzCqF5hBgLoYqxZdGuQvezoOZODP/o6XQIbERrVaGDP/LCnJNpP3OnPJ2lX6nj7HGGpTwguUuMqlL3pmsKc+W2BAHhHSEoKxAt8aZ3seiERwS53gtuutPFDeLgvo5kasiS1f4DtLr43d1i7uh/x8ldMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756750862; c=relaxed/simple;
	bh=ten7T+wJwjgT2Q6py07VstSdngbDnKU7h482ZY7IEQc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=briz/stTJ0zzgTM46+uUg/CR6JCZLYX6rrmqdluS5OnOCz9F3Z/VgPP8a8Ik+KG/0IBXGULayfmRP/BVHr/KXGPJ/bEyFvIiN7No5UutWnSQX2GpRmy4z5wB/Eb6QQd7zSyznUkjW0w9xfzNKTRG45nxMx9dRravW9O8U2VgAwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZmbH/vLJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ahgAe0oi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581FN497000713;
	Mon, 1 Sep 2025 18:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=XJ8w7lEynp6vg+ValYqRmH2rZ/ya9+jplao6Zq0qARM=; b=
	ZmbH/vLJQzVu5uxM3oK1GtM/inMkLIDVmNrj+TFsW5Gnpqa/pxe5pk/V+nO61ovM
	Skid43LRlk/iiWhwJi4s4Tg9OJW0lhcy82MEvYrkb3p8lnrH2jWh+BPf5LO83Xlc
	a4iAenYjCEL3+7EF1Kx3tCS1BhwDzyKfbXOckkkX7/l3CRQlpmQw+Y+b1fFoY09T
	Eu7s7N+vuaNsrL0lyhZd+uN3LVzX2m+1vzvclVVihdU6n9ZXt+7Wj5R7tSo6HKju
	wAFFAWX9jIqkpxjWGpLIUf9LCeHT2TpkBDD1Mj8V9aOxakNSKD5pclZRpJzSSpWJ
	vfjIIen+wxpkqh3VOFfxUw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usmnatgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Sep 2025 18:20:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 581GZ9oZ032183;
	Mon, 1 Sep 2025 18:20:27 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012044.outbound.protection.outlook.com [52.101.48.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrekww4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 01 Sep 2025 18:20:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuYPIvDh6UAq/7ZTqM9eGUKChcKgz3mbc0GzdYuGNH9FOq/zOnOM98s1ypyyCPSBGhZRMALhpo7PnU7kGmMB2K+j4RhrirxJSj5KANVU7g1ElKsrj47X9qHtJJvQm79hgupfoIlZecUMfo99VOpUWhbtY6JfAgQc0VPMZmH/JPLDmkTUm///IDyv3cDMRug4u9uOhgSpQVi8BlTOG7656fT1fhWQXojCj0yTYjQ1iUTI3zKAA+T92S2XeQN6+H9U0JiqNdRXKXy4h2TZNPsoCp3EOBi2d5S6tBHOE9DrPpugmq/ffUZLbVuMBTpKn1CigsSIpql56QrYaEXNXxdQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJ8w7lEynp6vg+ValYqRmH2rZ/ya9+jplao6Zq0qARM=;
 b=D9tXuPjL7WoojBgyUdkPi+0oKxiLj8XW95zSFuUMj6XonGTtc3Y3TMc3nhkD/Pcj3FQFIC612gOtByyf+T0PY1se2Bo2KOvaEvfsf1Hpgwj3OLuYnRSkIiCTZydEZVDKQQooiIWYJg14WiqW/7z7iNx/hRf8PeJhEAMv7z5maKfH1lw54CiytQ/l4DyKgbl2rcAV2NcYLdTfKjUbJxyDVzw+bxlM5CTmLtJxxewiqX7jTjvoRSGqMuJ7PrgiDMxJq7KkXQZSYuq9pv2qtKhHdYklk8VCuEAWTeVKOhMfpIthanxcPVxs8Foa9S/NMZgTLYa3Fps5L3699Nb7vn95WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJ8w7lEynp6vg+ValYqRmH2rZ/ya9+jplao6Zq0qARM=;
 b=ahgAe0oiBeLXMzMlE3HAvYUDYUmeKUWINe3ozsICsJilHgSwWQ++XOj1gZmX3MMCRBThlTUJESO3YGOeKoQ21jT1WcU7Z6uuXEznuPudsfK+NDUAqpec4M7Pf3jodt3dTBmlAhC7fDbeN3osCoUqwbds+egaiT5oHORknwpMB0s=
Received: from DM8PR10MB5430.namprd10.prod.outlook.com (2603:10b6:8:24::10) by
 DM6PR10MB4361.namprd10.prod.outlook.com (2603:10b6:5:211::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Mon, 1 Sep 2025 18:20:24 +0000
Received: from DM8PR10MB5430.namprd10.prod.outlook.com
 ([fe80::9e25:f5cc:10f5:14dc]) by DM8PR10MB5430.namprd10.prod.outlook.com
 ([fe80::9e25:f5cc:10f5:14dc%4]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 18:20:24 +0000
Message-ID: <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
Date: Mon, 1 Sep 2025 20:20:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: Add transitional symbol attribute for
 migration support
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas.schier@linux.dev>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap
 <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Stephen Brennan <stephen.s.brennan@oracle.com>,
        Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250830020109.it.598-kees@kernel.org>
 <59c4f103-7f1b-4829-bd82-0d392047fea4@oracle.com>
 <202509010949.9A61A98@keescook>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <202509010949.9A61A98@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::12) To DM8PR10MB5430.namprd10.prod.outlook.com
 (2603:10b6:8:24::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR10MB5430:EE_|DM6PR10MB4361:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c0d1e4-83a5-4390-775d-08dde9843831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Yit2UWpxUWRlYTBCWk1weCt2YkJnc3h6MGRnVndhTmoyRkhjTmV4QmNiNDVr?=
 =?utf-8?B?OEFlNmllNFRFSDZPRTFtNWltQi91b3hmNktKclpmczVEbys5bnVzdUNnSHB1?=
 =?utf-8?B?RkdDOWxrd08zaUxrcVF5S21hNXc4bXR0b25Vb2RGMFoydk1ibkY2YjFqZWF4?=
 =?utf-8?B?bnpQVnFyU1RzdkFPbk1rWFZJTkl2UnM5L1VWRm9YMUNHeHd1OG52V2dvTzNn?=
 =?utf-8?B?cEN1TW51Ri81eVY2cytRVVI5aVlSKzRmZzNEWjFadmlWQk85alNuN0xMdFZO?=
 =?utf-8?B?akNtSHZaS0dyWjFJMXhFbTdqUFpsSWhiUlk3NFhhbHpzQk9YRkhtdUNrbzZE?=
 =?utf-8?B?SEl6UkhXekk1b1RIR2ltRjJGSGx3OGVjamJhM3RGelYzU29jY3VRamhOVURQ?=
 =?utf-8?B?c0c0WXVxZE1nYW8vd0xLb0lyUTRvbWRZYnV5S2pvRXVDMkVsRzJRbmlOK2s5?=
 =?utf-8?B?Smp0cFR4ajFHbEVZNTFqcjFTTjd3TkppZjdjZmZTU1o3UTV6RFNnRXpaZ0c3?=
 =?utf-8?B?bXVIQ3NYYVd2RUVsanRlZjAyUFpidzd5Yy9MMm4xOG90RXgvVGFHSHlWSmFX?=
 =?utf-8?B?dzB3clRBWm4xTEZsZi9PWE9RNTgxNUJYUGFuSjZJL1duaFUvL25qK1pDZVc1?=
 =?utf-8?B?MUxsNGoxMEtuZStra0lHaTZ5TXQ0Yzc5MUVmb0c2WlRmaTFRU3BpVktTWkl0?=
 =?utf-8?B?V1FaYnZLRTY3VWdYU1J3ODkveE1hLyt0aGk3OTlVWm5pYU9PM3I0WlF3bWw5?=
 =?utf-8?B?WlpHMnl4VnBoc1JxbktDaVNoZllHRm91aUdyMHhUT2pyL09EdlhZRm02UXpq?=
 =?utf-8?B?a1Qwb3VrRXFYTEI3WFJ0U3JXRGVsZmM4U3cwRkF0RU83Skl4ZUMzOSsrd0g4?=
 =?utf-8?B?NnRIUDc3SFV1eTZ3ZkN6M3hXUmN5SU94Q0tkRndHLzFJOG5uT0l4Znl1WFNG?=
 =?utf-8?B?KzlLL043UTVOQk1vZnN2UmY0YnhGV1BUV1luWWcyNGhRWmZmKy9tYVhwT2pa?=
 =?utf-8?B?VlNZQlJRdzdPTEZGK1czUDVsZzRnUkFJNk0xUTNYMXlxSDBlK3ZGTmJUSjBP?=
 =?utf-8?B?S1l3NTMvN0h3ZmNRTFFrTzdXOERQR3RGMkRtb2x1U2dmcERnUVVZWG5nK0FP?=
 =?utf-8?B?RVkvTDdYajQ3RjRUR0IxMDl3eFBBWnVSTW5ybXpwM0h2Q0oyR1FxaXJiZXho?=
 =?utf-8?B?OVp1UHFJbW51RWFra3V6R1YwQkRob2JhRUtMZUtYNzdXS2lyTmFaUVFHVURJ?=
 =?utf-8?B?dkNOYlpCR2JicFFqN3ROZ3UrekxwZXo0N3k2YnVDV1ArdkJ4d25UT0FldDVX?=
 =?utf-8?B?Q3dObzZkbjlJOVBIM2ROSWcwVWpRcjZKTVdMTmEyK2Z1V2x3TmtOM1hIWlB2?=
 =?utf-8?B?VlZCTkZKQWtqN2JTcHc0VlJhSU5mS3JwN1dHYURuNDNCZ3B6QnRqVVlKR3R0?=
 =?utf-8?B?ZjV5a2RuOGRmZFNlVXM5Y09ZWXVwMFZLRXZDaHc1c2l5UTRBNHN1R0Rqa3ZK?=
 =?utf-8?B?WXlNcWJNZFp0SjBZRSswYm5ZZytTZC9JWDVEemh4cis1YWlyWFBHS2NadEh2?=
 =?utf-8?B?S1MrWi92a0g0ZDVYVlpJT3NLbHp2c2Z3aUlUcnhwWGlnMjdSbGl5cU5pS2hE?=
 =?utf-8?B?ZmpGUkxPcWNsRXF2bTllcmdEbHJ4VlZLcGRyV1l2R2JOUDg0am9FZ2NLMUpi?=
 =?utf-8?B?enh0MXlFMHliLysyd3c5cXBJZkQ5WU5vRkxsODdiM3VTNkYwZzRMdktDbHps?=
 =?utf-8?B?NVBxK0svd0lONlhOdjZjV3JFYWpEWm42TnB3MzRUU2RkZTZCa2F3WXZRTUVs?=
 =?utf-8?B?ckJUcmNyV3FoRSttZ0pXWksrR1VSM2FpcnFmVTd3c2JhU3ozM0NkcXN3Y1Y1?=
 =?utf-8?B?aUE4UWVaTXdDQVYwMEoyUUlXUTFjQ29FalAwMWhOWmsxVkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR10MB5430.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzVtYkNBOVczVllNcUlITTZOT3RhWEZHc20wVDdrOXFtejBhNUYveGQ2TVE4?=
 =?utf-8?B?eXVjbkdrZ2JiNWQ1Q0MveXFyTnBCWW1PMW5VZStZNlMyWWYrWnpDa012UlRw?=
 =?utf-8?B?cUJkWkdWemVOVlpDYndXZDFhSUNVVUpZb0NTNVQ0TUd5TnBGV2Q4N0pEZlRr?=
 =?utf-8?B?M25kcVJNc0FqaUNQZWdnVWNVSHBIUldHZktJOG5tOVFpbHNUOENMTC9MTDd3?=
 =?utf-8?B?ZGh6d2I2c0hQZWdxQThaZEVUQ3hwVGtqWjZXMnY4V29nTlRVSVJNRHNsWmJr?=
 =?utf-8?B?RlduQXJHMXNOb3BFd3ppaWJ5WW5CV1NlVHJEcGRoRkxZN3luMHZwK2lCN0l0?=
 =?utf-8?B?SHN1U0NqcW9OL1RVR2hIZG02NTduZmt4NU5nZzI3RVM1bm1pN0VweFVtMUxa?=
 =?utf-8?B?YUlVSDVGWGU3LzZtTmZBaUJYTU01VThMZTNhb1hoeDNGTldtU2hNM2sxbVpk?=
 =?utf-8?B?dVhud0FDRnJIV2xJdmIvTUdqUUt5TGtucFZOWGI1T0RGOHVUQlAxMFdiS0VL?=
 =?utf-8?B?cU00ZU5SeUxOV2NleDBHZityOUY4ZU55Z3N0OENDbERjNU5SQnorQ1BGbVJo?=
 =?utf-8?B?R2pJa1lsempSUDhsTDhxWjI1c3FOWGF6QnVvT2FJbndzYU1qdmdocVZwZWZU?=
 =?utf-8?B?bzE2SkZNeWg0dUFZNFhEWUM1dEVqbUU2TW1oMVRUczNDUm11WXpTSE53djVE?=
 =?utf-8?B?ZXVJSkI5d0JnZzQwUE1nS28wNGZZUUlZc0VGR1ZNRkl2K1hrNGN2ZG0zR1lB?=
 =?utf-8?B?ZFZ6ZzZHTWlQblllQzlKRnVoNjZZeGFoWXdjK1p0VWJpYnFncmh1YUFiaWUx?=
 =?utf-8?B?RmdnaEdWOGliNVprT0JkYjZHdEZKUnNYQmh0UnBTNG4yMmdrM2JudklVZmd2?=
 =?utf-8?B?b3cyWkNOUlBDSUdBcG1vS25hTUV1M2lvcDg5NnRIRHlTR0QrblpYN0xHb0Rz?=
 =?utf-8?B?RDBkajdDN2JQM2MvZVpLQ0tsaEpyOVdweDJrTTI1VE5iT3hOYlBWNUxqQzNz?=
 =?utf-8?B?NnhoMHhRazNKbFJ3TlFyWGZxL3FYOWNwbERpcXE4Wml6aEFaSlJpTnpiOFJY?=
 =?utf-8?B?NlBZQncxTFd6eHhnR0x4eVpzNk4xUzZTTVpWTExNY2srNlJPdVlGanhKcXpw?=
 =?utf-8?B?UjViN3lRa2lZaUZhK21ZTkpIUUM4ZDRyejVlN0JpUlJQY2ErL0RISWIrYURI?=
 =?utf-8?B?WUJyN1Q5dzRCQmFWOUxLLytQTFFVaDk5Ly85aFFnTVRHYTdsWk9WNTJaV3h5?=
 =?utf-8?B?bmhOczE3YU1WTmRoZ1RrTUFva0dVOUdDNnVBZWlhSW44MzBlLytKckt5THVK?=
 =?utf-8?B?dDB6dGRoeEJvemZxcGUxMkJHVDlOT3JLaFBjbEkyZnVYNUpzNHlsSHN6MkJR?=
 =?utf-8?B?Tjl5alNkU084MUpNR2dERGp6UmZRY3JjYUZsR0RWeXBpQlZzc1Z5OFB3bU9n?=
 =?utf-8?B?d0N4TVNmd25GR0JlYlVOYmVuelZIVE5QQnRXM05Ed0haNUF5VkpVN0Zwc3gw?=
 =?utf-8?B?L3ZlZTN4bldwQ1hYMkZObXI3eXQ4Z1A4WnJXUlZ3Q3NiazM1ZEJJWG5YVVlR?=
 =?utf-8?B?cGszd04xRUNoOGlCUG13L253SjA2RHU0ZUIvY3d2MVU4em1CTFVIVnB1dFly?=
 =?utf-8?B?OE5ybHJ5bUw5YjF4TlVhc2Q3VmNhdXgzUlJZbXB6QnpRYWlzV3p3WCt4VVFz?=
 =?utf-8?B?VkJmZWRSTkxVTzdQUVUzb3EweDB2UjRrY09ZTitTWlpMVEZTcFFGQ2ZITW9L?=
 =?utf-8?B?VFB3cEFIUHVBbmVZaHZad3h1OXhTNHRmMzN4UEhNWVdZblFkMU9mSFg1dDlV?=
 =?utf-8?B?RUY1MXBjaXJSOVJCTk53d0xnSFlTc1A1RjRMdHE1Z2VkZWZQd2NUako5azRy?=
 =?utf-8?B?VWo4dGEyR2JGeEFzU3NuajdLZVZ2MkNqbVVWdHRMSUtET3BKVXdmWlY2TWov?=
 =?utf-8?B?N0lUdS92NVdaM1A2bHFlUk55SDFHOGgyWVp6cmZwaXNnR0ZodGQ2Z2s4WEs4?=
 =?utf-8?B?TFlrdkd2QkNUdWdORDZod09ieFQ5Y25ra0pEQ3hjS3Foejk1ZTc5eCtJZHNa?=
 =?utf-8?B?NU5vcnB5b2JBTnJuRlZKYzVmdDdlSTFwdGk0UjVseCtYWkVEOTBIaHdaRnF5?=
 =?utf-8?B?ODZnbFZGYmtWSHh0NC9QMEdrVmpXUkdia1pkQWpOaVhyVm5HdXFQaUR5T2xV?=
 =?utf-8?B?N1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QU2rRC3a40U/9l9ehjl0pRg+Gq1cYozAm3wUZtFoFUZ6vi2dOHerQsi0rweUqUBdFYVSFEt/CBdYX5XJYLt+QVo+xHEcXAvkoFr2eX5BOYATAatEG/Fq1cKuiIk2BtDYY08VX5acOhCW9VsK0jS7E7AwfG2qiSp4khmWWgOSI8sY+4jie0qBz9Vo+ogG+aGm5LScGnpYhCduUySrrtogdELzXUrIxrq3Zm6xvfzB7t3eMtPBTg7r7Y459VnvizMiXWAxCh7ix2v4B/bue9w5AS9zjdmID6BmGf6TWp5Zwlz/XwNcgvL+eNlENCcGjp/qXDawQEBXOXleENwAazK0HcgjGGnrKno1vOUJCpBIjxaYY7lEWZH2XjUGDp54dn+Atd0YBeWyBcvg92v8nv3FrTjwJXtnboabUH95MUXhjZIlZVkCXLBbq3Cj+aXCKhuW5O2okooRQ2mVE7Un72NT4xDECR2qPdGxyc69ZnEgzVeVX38OIgTYXz0iwYA3U6vA6EWe+djBjlqSa5CSMDouVfwKg/kKby/rgz6wdOQMhUxwvuQu9RxbaIgABQ1hhhlO6rkXspQiBtAKDwANrPdARvh50TAECv35HGFyGkdLTHk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c0d1e4-83a5-4390-775d-08dde9843831
X-MS-Exchange-CrossTenant-AuthSource: DM8PR10MB5430.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 18:20:24.7316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZ1mVp/mAVQBH1gE/lnXq7nMVM4QLPGtP2BY86NOvVZ1Ip22zxhIjq0V5d0kRNYXvpqJokJr4BMpBIFvpxaW4T4fczfvuCAvCHVHgDnxraY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4361
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509010192
X-Proofpoint-GUID: dboXWvRtsT9iPDGIhgf2QD9JlvOLKZfu
X-Proofpoint-ORIG-GUID: dboXWvRtsT9iPDGIhgf2QD9JlvOLKZfu
X-Authority-Analysis: v=2.4 cv=Of2YDgTY c=1 sm=1 tr=0 ts=68b5e3ed b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=zHn-gLMUkVVpSXM8HZYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXynhlDaTQHAZ+
 PGaxDghq4MPg9mhFaV1/GoZZ5S9XRJ5fLAf9GhbIrfOg4fbHS36fMkKIYvNRajkINQWTP4XXUiB
 8Dax3yH7H93hh9IbTIrzyqFa1smKEK820MerGhN1bfJ9+1yppPBq2Z3eeqy4MUZXng00SIQMv/l
 1zZtrK+C91N4tUYeZGN2DFKhyU5meSLmHAvrOfxUSsmdv42pudg38hLzZ/+WZG25u9B8DJpblKU
 24s4LaiJ0gTdmJgKKRuVzY+V7MSu+vmWtgOwIV7Qd9d1QHEYI3eyHnrXb3BfizW6aAtg4BEAf8h
 WfNAj+moE3Ti2X6GH9Sjq6pvq/hKX7xFEA2hlcXL0yEA6fm8VPzB7V1Q0rI0JbHqjC2jiRfhauG
 cbaON25lZVx4PJk6hmR8qIQNpWG3KQ==


On 01/09/2025 18:56, Kees Cook wrote:
>>> @@ -459,13 +462,15 @@ void sym_calc_value(struct symbol *sym)
>>>    			sym_calc_choice(choice_menu);
>>>    			newval.tri = sym->curr.tri;
>>>    		} else {
>>> -			if (sym->visible != no) {
>>> +			if (sym->usable) {
>>>    				/* if the symbol is visible use the user value
>>>    				 * if available, otherwise try the default value
>>>    				 */
>>>    				if (sym_has_value(sym)) {
>>> +					tristate value = sym->transitional ?
>>> +						sym->def[S_DEF_USER].tri : sym->visible;
>>>    					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
>>> -							      sym->visible);
>>> +							      value);
>> This looks a bit odd to me. Just thinking out loud: your new logic is
>> there to be able to use a value even though it's not visible. In the
>> case where it's transitional you use the .config value instead of the
>> condition that makes it visible.
>>
>> Could you simply change sym_calc_visibility() instead to always return
>> 'yes' when the symbol is transitional? Wouldn't that simplify everything
>> in sym_calc_value()?
> It's a tristate, so "m" is also possible besides "y". (sym->visible is
> also a tristate. 🙂

That would be fine, right?

We'd pass the if (sym->visible != no) check... we'd do the

newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri, sym->visible);

EXPR_AND() is basically min() (with n=0, m=1, y=2), so effectively it
would end up doing

newval.tri = min(sym->def[S_DEF_USER].tri, 2);

which is the same as

newval.tri = sym->def[S_DEF_USER].tri;

That's what your code is currently doing too, but in a much more
roundabout way.


Vegard

