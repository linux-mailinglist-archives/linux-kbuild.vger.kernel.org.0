Return-Path: <linux-kbuild+bounces-8721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97088B443DD
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 19:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C561C87D85
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 17:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5BA179BD;
	Thu,  4 Sep 2025 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BDSiwnO4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NcUu/km6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFD21C5F10;
	Thu,  4 Sep 2025 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005477; cv=fail; b=GgtVGlXKNf/dEp4L6Ps3OJZWmB4W41J110N6wOsS4R7ZSLrF95oicv78Pcq3dcKHGYy+voYw3VWhi/SJDZ4RpB1d2IRgRlrH1wgDVheNCqDAfksOjwL5z/hbGIjD9KbkMKo9UPTqe2bKU1IQyXml+ycUI5GOgjigzuekMSecBRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005477; c=relaxed/simple;
	bh=DJMJouvX2uOFw+QjUbQeCE/I7TOdQNYYCMpC93isoEA=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=OXZjuI1lxyOnFiYhkEGwDijog67zBKWGTgTIaZaothwCoZxM9HiMclHnIAd/c5/PADb54ON4N1Z01LZuVBG9Ca8HQw3FcDsEGD3++Blq/GUswQLwny6yljgK2Zu3oYNwzPt0c66tUXyzR60wUQs22fSC4KhC8lnq91KK2LHOpM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BDSiwnO4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NcUu/km6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GMjX9026705;
	Thu, 4 Sep 2025 17:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Q+sm+J1c98JlQ71D28
	202MQagCe9hhi+GcxrtxH4Huc=; b=BDSiwnO4L4/u76iYgmGu7wcvxCAuqLNGYt
	hfw8DkpU3B4roOQFfdwzcOjeAestXUnbnAIRm7exc9cMfGYbn5JKjznPmOOMYCsP
	nlRoN2jxEEN1zKgeh5NlQKhYzR+dlra/L3TZtZdc+ZevQW7i0q5yhEroBc8QQeQQ
	R4f6xU8tA4ATmGXxjK1RZkNnn65TI17N/Em0r/GFkWOFfr+4ovs9gJjqOe3OZorX
	NiW3OFUtdM12RCjXp0dpU+7FplC4+0sn123AM269hwxvPPUEGF4da/GdfCU1QukD
	K89L8Jl5JdsuDGKgAYLBBozFtwFbkefM5HW9Yiwo39bkz9m+1Zzw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ybmh0hfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 17:04:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 584GrS2W040037;
	Thu, 4 Sep 2025 17:04:06 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrhvwr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 17:04:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZstNZxmHHm7BVWamhybPfUT5rwraPDTdMkmYqjhutZCmQ6ENjQyzxl35xjxRxTt0l2CyiHwgBRwrBDffTKldA/5xPQPHpVlob3/oc0XZxG8KMN8GiAGuLs61/P+2CsE1IGGQ+eM22/eGXjMoYRxFFz9Kyv7Kcrks8DcsscOpOixzquKSj3s4H6yf8bakdftA5o0Dd8vUvD84tolZcSidhmRGxc0bqZgvz6DrFvGdEC5jMhD7Z2Np2h/nlQVdixa2LeyAGYK2rgzSLQBlCDyr8yGcfQndlhmI0oiyEZNIvcT0voUgOa4znoqISReQ2hmJVn8q7ltlIVjqlL1fPhQSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+sm+J1c98JlQ71D28202MQagCe9hhi+GcxrtxH4Huc=;
 b=DOU24Pg/xKHnlBoJaZFLTLdo6yhMwPxRIPqjQTCIjScVKjyrbsfvss/MdhfFlkGbHKt/VryRRe38+Qpx/L97KeXQds8HMllFx7v9Mdk6mxhhFMlLMugJzGLBaAWgMQZ74SZ1uea/HaHW57wQIqApR0YMI3aavnpuUZkwokj2QfW5dy0VhMXDFjuA4/bxTC9YbH0Vbq6tIStwKbM5Jozp3YvxEI40gdCHUvrrJasEVftFQ91nf/oIv8fbZtclz5sXHABC7ByfohLYxd1T4M5iGgUoUkbJgpMiggCV3o3IhMCwSxpd48bQQrp/VerMbiYC9iHdez6tUc3RQuTDbinrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+sm+J1c98JlQ71D28202MQagCe9hhi+GcxrtxH4Huc=;
 b=NcUu/km6yx9Bpcu5fs1eIt8ll3yS21+H8++mwvcgj0zvA+kXjoAJbuKq+wSIWKdxNqtF94lJmkfiBI2daSFvu/SuTgRLZXRqowTf860eqGb1+jMkDFSNAd5TtqBg6pHRKVKziW1H0JdTlyV1wVjwm5BF/XyhM6dsWVCHlMlKYQg=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH0PR10MB7099.namprd10.prod.outlook.com (2603:10b6:510:26d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 17:04:03 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::47be:ad6e:e3be:ba80%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 17:04:02 +0000
Content-Type: multipart/mixed; boundary="------------YCIkl2AeTAbleaHP3tTNHmPS"
Message-ID: <4cbc348d-02ca-4743-b8d4-21db2ebf4460@oracle.com>
Date: Thu, 4 Sep 2025 19:03:56 +0200
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
 <d25b2c63-32e2-4a41-b982-da5131cffd2f@oracle.com>
 <202509011125.5879901C@keescook>
 <0d9ef42f-57c7-472b-89c1-4534f40991f7@oracle.com>
 <202509031949.375138FB13@keescook>
Content-Language: en-US
From: Vegard Nossum <vegard.nossum@oracle.com>
Autocrypt: addr=vegard.nossum@oracle.com; keydata=
 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 8A==
In-Reply-To: <202509031949.375138FB13@keescook>
X-ClientProxiedBy: LO6P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::11) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|PH0PR10MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: a313ff4a-2a0c-4bb4-9582-08ddebd50c07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGZCTC81THkwM1ZKbHlHU2p5RUMrLzRCZ2xDYXdCZ1piWEgwdXNRcnlYMm5v?=
 =?utf-8?B?YVdvcktDc1M0TU85cjlVcEhJd1JjeDBVUmI3WFI3cEM0S0xjWlFoTEpMMVM3?=
 =?utf-8?B?RnJMa3I0YkN3eFdpeUF2YmZxWTFnQWNLZkJVdW84UCtRV2p6emQ5R2Rpbk9L?=
 =?utf-8?B?NFpvTnZybi9KY3kwcmtpaFZWekQ5NWtFOGpzbGVGMnl2RU9UM0J0VGlMQ2FM?=
 =?utf-8?B?Nk1va0xtVmRWYVF1U1N5ZGpxckVnNUpKei9RV2lUZnluSkFjTWlIdUlBdjg5?=
 =?utf-8?B?SkE0Z09YVWlZZXorS01JcTNZWGJhcDJucW9pLzkwNDdxZG03L1daaktwM2Rz?=
 =?utf-8?B?MXFkcy9GOEI5QmhQVW9HL21IcmNjL3MxZng3MWRnQ3hHT1lUNWluU2pMVFVw?=
 =?utf-8?B?YjhzN0EzS2NvUlJJdXhDUnowbzUyZkNvY2xwME82NjVCTU9XTVBKNTE2dnhE?=
 =?utf-8?B?RzU2dFByVjI4ZVhsQnV6UFlzOUQxMGQ3bTV5a3BHSi9xRVFUVVcwcGJ0cm9Z?=
 =?utf-8?B?aHcyREhsSlkwODRxemJycVI5WmlPczIzTjJEYS9pTUdMUFBUT1pMcmJ5RUhI?=
 =?utf-8?B?bDREM0U5OXhmWHdQanVnNDMxWktVY2cxY2loQjhwcm5sWnU1cmxVMUlhdExt?=
 =?utf-8?B?SkdxTisyVVphRFJVMnRwYlUxWWYwc2xVVDNiRnRZMk9KVVp1d0dNRHordC8v?=
 =?utf-8?B?djZWejR2Mll5RWtHeUYzUWRFeTFuVHpLV2NzY0lCcXM3Ymtmc0dxMWpBSDc2?=
 =?utf-8?B?Y0hZcmZwYXkvNnNlbVVhWHNzc1pJeXJRNmJZSmpzeDBISTVEZEUxaTdvc1pF?=
 =?utf-8?B?ZjYvQUx2K0hHaXVyeTVPUmJOQ25LWmxseS80YVB0U0hDTjlJQzlEMkdSZEVs?=
 =?utf-8?B?Z1NOT2p6MHJrYWF4djRqL1Z1dzNlRmFDQm1tNm8yUGkxRDVYaGx3WTJuS0lJ?=
 =?utf-8?B?L0x1OWFobjZMdTAxZ1NDbG10R2ZiS1NjbkJBWjlFWGhPd3JkcEJVWmdySFVw?=
 =?utf-8?B?dVhFSUZESEpwblJ4a0JvTXVkUnliTXZqbmh4S0hqWWQ1VURwdlB4SkdXTjBV?=
 =?utf-8?B?NHZhOTZRNWdXUG1wQ1NpclVtdDhTaW1OaU8wcnFOb1VxbFNvUTVjdytMeG1X?=
 =?utf-8?B?dWZoQ2piUkNBZ2d0Qzk5OHd1d2lUa3lrbHFzK2NsanlLcDM0U2dabktRMS9O?=
 =?utf-8?B?NnJMY2hIUlQwZDNBQnRyWTBFYjhPMVIraXhsSzRhVHh1YnM0TXRPVXZWR2Fy?=
 =?utf-8?B?UENlaWROdHUyWEdhNlg1Wi8raW50d1d0dkhDVDkyWnBleG1pbW51azNBYVFF?=
 =?utf-8?B?dU1kUU5NS2IrdmRRQk9LbFBtN2doWDdLRWxGbkM4NnQrSTcvOFlIWEl5dE1s?=
 =?utf-8?B?c3pNSzVRa2Zidm11VnJwVXgxRmtMNGZHMGI2V0FZYjQrRUh3cGRLRWdETkNY?=
 =?utf-8?B?V3BJVjVTODJRSGtyei9zcnBrMmFHQzlKRXJYeVgwbXBlc0JpR29vSzNOVnJz?=
 =?utf-8?B?bmpsMUxPN3BmQXRFRTFwT3ZuMWNqUW9EY3kvbkl4dWkyclFPVUlWTWMyVm9w?=
 =?utf-8?B?YklGSW9Ma3Y0T2Z3YWFwQTRUcVB1bVZzSHArVmNQREJXZFhQeGgyamg3Y0JK?=
 =?utf-8?B?RWE0VTVUTmVoSlpodU90ZUxzMUZTNHRFUnlqVGVOUDZBUkhkK3ZtbjluL1FI?=
 =?utf-8?B?YVJISnFsM3RrWjFqdDB5dStpU3RZNTUzVnNyWTlJekZ4ZTNTaDNwYVhVUjB4?=
 =?utf-8?B?RWlQNGNLREZGa01UN0JIZlFndTltODU1S3VxaVNpK3B6c0tyWm5jWDRRWWdB?=
 =?utf-8?B?NlBTZGJ4ajRtM1ZwbDdaa2RsRWZyUlpvME9MeDR6VW0zeExFVHRKMWYvSkZQ?=
 =?utf-8?B?ZW5IcjNoT2ZWRUo4cktwMnNZQVdjdXN3ZFJiY0lvUGJLR01uWFlLZmZ3MFdR?=
 =?utf-8?Q?W85qZvfAqyI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE9sYXFETU95YkZCZ2tKMnBOY1V2ek5ULzk1TXBrMlRZTmF4OTNscUlsdEpZ?=
 =?utf-8?B?anhBc05RaHhJUlFyUFBPSUFKSzZUeTJtcEg0Vm5KQmN2RG1mTFQwYzIyRFI5?=
 =?utf-8?B?YWkwNUQ4V0JlWUJuUFJiVmlPMHpGZXhHRC9KZUhGamw2bDNQMVgvTERGMG9M?=
 =?utf-8?B?SmNYcElqRld3R2RyWUdvdktXcHhVVjNPZVlWemRqdW55RHRwS3JGOXdScy82?=
 =?utf-8?B?aEl4YU1CRWRRNmV0Z1pheFNMcHZVL1BLOThRZ1h5UkxRUTlUZUluU0NtODFC?=
 =?utf-8?B?WW13NThsdkx6N3NaVDd5N1RndzlzS0R5WXRESzUyanU1UEN0ZHBSQTU3UlF4?=
 =?utf-8?B?UEEyYXZqbTJvVlhuZWV1SkFkZ3dTdEE0VlRaWnd4S0hPeGlDdVVLQVFRM1RY?=
 =?utf-8?B?TUd6S0NXOE9uQm5OUEMrM0dEQU9SY2tlUExiekJ6V2lZZGJNdm1rd2hjY0pJ?=
 =?utf-8?B?cFBWaktzaHhLUHVqUlpZcEd3cHkwTElPR0twdVdTT1puM3QrcFR6K3VzUWYz?=
 =?utf-8?B?d2l6SnlDVnc2czgxWVVGcVRMYjhQQ3VnbUNWTHdMQUdJK2NsMlBFVHc0dGpa?=
 =?utf-8?B?ay9VV3VnU09PT2pDaThPbXIvZnQ1V1Vwd1ZyclZYU0NyWHQxTXJZOXJQV1pl?=
 =?utf-8?B?VTlvcHFESnEwd0J4M2cwVEV6ZCtLM0pXekZzZ2M5MUtSY2RVSlJVUVluOUow?=
 =?utf-8?B?YmtYR0J2L3Y0ZUY1b1Q2MWVYWENtQnd4N2lzNzBGelczWExXR3hvRnRuc0lm?=
 =?utf-8?B?MnVYQVp1WmhYaUxxbld1WlZLY0NCbFdlRXV0b0NzNitueG9zajJwVVZCcEVW?=
 =?utf-8?B?dS8xQzVtYmlseDBMWUlWRjljd3dGeUQ0eXpIUloyRy9RWDNueTVlZy94dlJr?=
 =?utf-8?B?ZENZck5OMnkwV0I1THVnTmZ3TkpQVzBPcjZYOFZlYXpXYURWODBlQUs0b0xJ?=
 =?utf-8?B?NDlZMWQzbEtBMTdIUkFPaFVlZGxYWUNRd2Raek9ZRmJ0SzFVWS83L3lGTkYx?=
 =?utf-8?B?bzBwWWpOc0JwZ2ZxbTdURGdBN2ZXZ1QvMjhTZkFXaDNDVzROOS9YUC9wLzU4?=
 =?utf-8?B?c0ZnNXlIRmhWdmdnaVR0MXJHenlzeGNyTUc3SjZ3WXN1YjltMVhrZlZ1Z3kw?=
 =?utf-8?B?dlBERlFhV3ZvbVdFcU9wOG5pWFBRY2ZnQ2lsYzFUMW8vQXU0cDZZa25Qa2Ux?=
 =?utf-8?B?T0kzVzBoZittWmFGVnJtVDQ2bEhQQ3hXWHBXamZsRExOQW9jQmVWQ0pDVTVG?=
 =?utf-8?B?TjNrRzU3S0E4a3dSSWJrbTFLWTcyWkNYVG4xa3luQitrcHhQNUVrU3F4blpW?=
 =?utf-8?B?WVlicDNudHRvVS9hYnVjNWFKN0ZCMVVXejFzN0Q0ZlltM3AyeFYvNEowaXR6?=
 =?utf-8?B?b0RFaGlXdXpCSVM3TWtwWWZ5bW5MOEI4clZvK3ZEaWx6SFJqNi9OKzhWVjhp?=
 =?utf-8?B?YTZBOGlGZ1lxVWdFSkJreDJhajZDWHdzYjVZM2xFWnJITWpEc2dxYnZzNFZk?=
 =?utf-8?B?MEYwWlBlY040TE1QTWU3dzhjb3BYZWpTMWJFc2xwelFUM1F4dEdlZzRoejVP?=
 =?utf-8?B?T2l0VjJVVE5LUHFqcmdVQ2dGYWNDMDFjV3JtWVoyMGZ0KzBsMDkzVWp2YkJQ?=
 =?utf-8?B?T1hIelRwVGRoYlZPbHZmWWRmZm1ZNnNsNmxBZkI2dFZuUjJObEFOQW5Mbmtp?=
 =?utf-8?B?QzNTb0xRY0dvODdWRGpvNGJuSitwSE5SS0h4Mmd1d1ptdk1nSUZ5ZDY1TVdm?=
 =?utf-8?B?amxja1pPbjlYd2YyaUZ2a2Z1UUw4dFRFQUVGQ2JuU2t1RE4xM1poK1UyL0xj?=
 =?utf-8?B?Yk9BMkhUOGhLNHg4ZDdJdTRHZTlSMUxuMmFBSGJlNFg4RTAzcVplN2hyai9X?=
 =?utf-8?B?dGJESXJPS1JEek5wOFFyYkhaNWN5eWl2TncvenoramVodTUzL0k3T3dkdmZj?=
 =?utf-8?B?cExPMmhZRFNMZ1ZQUGNSb1VGeU5XUkFMTXZJM2tWOGNvMVpSUjk3c09STHJ6?=
 =?utf-8?B?Zm1mRGdWMlB2TnFtamYvclJNb0FyVnc3L3RYOVh4UC84TU9BeFArTVRRZUwx?=
 =?utf-8?B?WVo1bW9wRXNIUTdtYklwbzNzT1hDc2RhUndPUDBGSGdOWFBHSUlLK1B2S0dI?=
 =?utf-8?B?cWlYZ01Va2RkZE0vRmdPb3FpbGVlQms2VGNUODFlZHAzQzBzUVM5cVQ1bG9F?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EZstn4vSw0yhh8EgqPxzFhwJYby2NAHGu3g6F+uCfItoDbeLeaVYqdnaLLOuWSwnoKmWR6PAsrSpcUpIpEGtq8aIRkU/5ddRsiBNZB3BmZbZNb9jsTY/8EvhLdM/xGF8QFG/J3oH35uVAi8xfahvXjmy8sDR3POonD0GvEwN1T8E+ECrHs4tZ06Rp9FQLD0W43IrRvWlG2gBSZCDrJnyxboEdPyX9W33kXqM+RLABUwb3VA4El34Vt+t+ngmkxKF27Oovix/OSQ85SmzkORI/DuEKIEoojzWjaLnggUW+KmZeritjrd1IFHNCgPwd+82c8GB8qZE70O4HKcFz6pSusmhVVV0hTO0yHh81aCkTAWZ6A9qEpdkMhP3kEfIsY+sKKioJjlap6WwcohraNyf7fzxTRnZJj1oHhJSic7D+hOUQKE4O2VlhobMgXZgveOvNtQSd1WipWdxC4Liii7dH3/zF2Ybl0P2P6R4rXeXImc8FX72CTWFtQhpx2THycAQx4g/hjyvA026eg2ROLZ0znnjR0MAfrGSL9eoakerCaZSDu2SLV7DSti1HYIrJRX2BwpUqqw+iQ/I7mJrTHEnuXCdI7/0H4Y7FCsmDP7ZRxo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a313ff4a-2a0c-4bb4-9582-08ddebd50c07
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 17:04:02.3053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvpYgU4bW1KxMoMFECPuEY3wg2GGErdax8kRdTAfUer5H6Usa8xyrAUtQomxsixi2gAfpjz7BZOXvoZjMtyZ9z+1fbWbqfAhMZwsAq1QD7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7099
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509040168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDEzMiBTYWx0ZWRfXzYDUrsxKX9gx
 FX9Z8MOUcrfbx0TkuYPJgWVbt9Sx96jTVIovWDa0zCvjIsmLIj0URFdE6Y3pXmIoNozi519aRuw
 maWIb5Gih7/bcYuDBXqYCWXkCxG2QFtG+kEjWEE4e/EAsTbrjuTsVP/h6Eg65YLAhSqI46ET7Oq
 8pKIxMW9w6ATH1bZqkuUioCOP7ruWO5vZ/MnxNdGM2v/tJ+hCVFvg0S8YsncNCHuhYoXDA8omto
 QCGSAlE4LJw0jtX+IhFZu4NVlOpWIX5xT8HFJ5tKs0bPgNmAftvIuMmk4E31ds0Q8D2GNVo9Bx9
 UPUBF8Vv0qwZdlLh8DCEPBILcoJMryZmxs3Ty9nLJoqAmaHqd5tLl1FMFo7vemj12v/qnoxkDvP
 Xwte7fx0CvDZka0rTpQTbxwLhqYxGg==
X-Authority-Analysis: v=2.4 cv=Z8PsHGRA c=1 sm=1 tr=0 ts=68b9c687 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=zvKimvz7MDjskAdbHtUA:9 a=QEXdDO2ut3YA:10
 a=OLyQd7VvofjBG7mQHSoA:9 a=B2y7HmGcmWMA:10 cc=ntf awl=host:12068
X-Proofpoint-GUID: 2uVV6DY6rbGAQv-Mdh94mJhH2iqK-pM-
X-Proofpoint-ORIG-GUID: 2uVV6DY6rbGAQv-Mdh94mJhH2iqK-pM-

--------------YCIkl2AeTAbleaHP3tTNHmPS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 04/09/2025 04:51, Kees Cook wrote:
> On Mon, Sep 01, 2025 at 08:44:56PM +0200, Vegard Nossum wrote:
>> If you change sym_calc_visibility() to always return 'yes' for
>> transitional values then I don't think you need to touch
>> sym_calc_value() at all.
> 
> Hm, it looks like sym_calc_visibility() doesn't strictly just look at
> visibility. And visibility seems to "last"? And I think the "tri" still
> can't just be "yes", don't we need the other stuff handled?
> 
> Do you see a way to do it how you're suggesting? And now I wrote the
> regression tests so we can test any alternatives! ;)

Here's what I had in mind (on top of your kcfi patchset), see the
attachment.

It basically undoes all your additions to sym_calc_value() in favour of
two straightforward additions:

@@ -214,6 +214,11 @@ static void sym_calc_visibility(struct symbol *sym)
         struct property *prop;
         tristate tri;

+       if (sym->flags & SYMBOL_HIDDEN) {
+               sym->visible = yes;
+               return;
+       }
+

and

@@ -536,7 +531,7 @@ void sym_calc_value(struct symbol *sym)
                 }
         }

-       if (sym_is_choice(sym))
+       if (sym_is_choice(sym) || sym->flags & SYMBOL_HIDDEN)
                 sym->flags &= ~SYMBOL_WRITE;
  }

Let me know how that works for you (the new test passes here).


Vegard
--------------YCIkl2AeTAbleaHP3tTNHmPS
Content-Type: text/x-patch; charset=UTF-8; name="hidden.patch"
Content-Disposition: attachment; filename="hidden.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9zeW1ib2wuYyBiL3NjcmlwdHMva2NvbmZpZy9z
eW1ib2wuYwppbmRleCBiMjY4NmRiYTA1ZWNlLi4zNzk1OGZmNTdmNzA3IDEwMDY0NAotLS0gYS9z
Y3JpcHRzL2tjb25maWcvc3ltYm9sLmMKKysrIGIvc2NyaXB0cy9rY29uZmlnL3N5bWJvbC5jCkBA
IC0yMTQsNiArMjE0LDExIEBAIHN0YXRpYyB2b2lkIHN5bV9jYWxjX3Zpc2liaWxpdHkoc3RydWN0
IHN5bWJvbCAqc3ltKQogCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKIAl0cmlzdGF0ZSB0cmk7CiAK
KwlpZiAoc3ltLT5mbGFncyAmIFNZTUJPTF9ISURERU4pIHsKKwkJc3ltLT52aXNpYmxlID0geWVz
OworCQlyZXR1cm47CisJfQorCiAJLyogYW55IHByb21wdCB2aXNpYmxlPyAqLwogCXRyaSA9IG5v
OwogCWZvcl9hbGxfcHJvbXB0cyhzeW0sIHByb3ApIHsKQEAgLTQwOCw3ICs0MTMsNiBAQCB2b2lk
IHN5bV9jYWxjX3ZhbHVlKHN0cnVjdCBzeW1ib2wgKnN5bSkKIAlzdHJ1Y3Qgc3ltYm9sX3ZhbHVl
IG5ld3ZhbCwgb2xkdmFsOwogCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKIAlzdHJ1Y3QgbWVudSAq
Y2hvaWNlX21lbnU7Ci0JYm9vbCB1c2FibGU7CiAKIAlpZiAoIXN5bSkKIAkJcmV0dXJuOwpAQCAt
NDQ4LDEzICs0NTIsNiBAQCB2b2lkIHN5bV9jYWxjX3ZhbHVlKHN0cnVjdCBzeW1ib2wgKnN5bSkK
IAlpZiAoc3ltLT52aXNpYmxlICE9IG5vKQogCQlzeW0tPmZsYWdzIHw9IFNZTUJPTF9XUklURTsK
IAotCS8qCi0JICogRm9yIGEgc3ltYm9sIHRvIGJlIHByb2Nlc3NlZCBkdXJpbmcgY29uZmlndXJh
dGlvbiBpdCBuZWVkcyB0bwotCSAqIGJlIGVpdGhlciB2aXNpYmxlIG9yIGEgdHJhbnNpdGlvbmFs
IHN5bWJvbCB0aGF0IGlzIGhpZGRlbiBmcm9tCi0JICogbWVudXMgYW5kIG9taXR0ZWQgZnJvbSBu
ZXdseSB3cml0dGVuIC5jb25maWcgZmlsZXMuCi0JICovCi0JdXNhYmxlID0gKHN5bS0+dmlzaWJs
ZSAhPSBubyB8fCAoc3ltLT5mbGFncyAmIFNZTUJPTF9ISURERU4pKTsKLQogCS8qIHNldCBkZWZh
dWx0IGlmIHJlY3Vyc2l2ZWx5IGNhbGxlZCAqLwogCXN5bS0+Y3VyciA9IG5ld3ZhbDsKIApAQCAt
NDY3LDE1ICs0NjQsMTMgQEAgdm9pZCBzeW1fY2FsY192YWx1ZShzdHJ1Y3Qgc3ltYm9sICpzeW0p
CiAJCQlzeW1fY2FsY19jaG9pY2UoY2hvaWNlX21lbnUpOwogCQkJbmV3dmFsLnRyaSA9IHN5bS0+
Y3Vyci50cmk7CiAJCX0gZWxzZSB7Ci0JCQlpZiAodXNhYmxlKSB7CisJCQlpZiAoc3ltLT52aXNp
YmxlICE9IG5vKSB7CiAJCQkJLyogaWYgdGhlIHN5bWJvbCBpcyB2aXNpYmxlIHVzZSB0aGUgdXNl
ciB2YWx1ZQogCQkJCSAqIGlmIGF2YWlsYWJsZSwgb3RoZXJ3aXNlIHRyeSB0aGUgZGVmYXVsdCB2
YWx1ZQogCQkJCSAqLwogCQkJCWlmIChzeW1faGFzX3ZhbHVlKHN5bSkpIHsKLQkJCQkJdHJpc3Rh
dGUgdmFsdWUgPSAoc3ltLT5mbGFncyAmIFNZTUJPTF9ISURERU4pID8KLQkJCQkJCXN5bS0+ZGVm
W1NfREVGX1VTRVJdLnRyaSA6IHN5bS0+dmlzaWJsZTsKIAkJCQkJbmV3dmFsLnRyaSA9IEVYUFJf
QU5EKHN5bS0+ZGVmW1NfREVGX1VTRVJdLnRyaSwKLQkJCQkJCQkgICAgICB2YWx1ZSk7CisJCQkJ
CQkJICAgICAgc3ltLT52aXNpYmxlKTsKIAkJCQkJZ290byBjYWxjX25ld3ZhbDsKIAkJCQl9CiAJ
CQl9CkBAIC01MDcsNyArNTAyLDcgQEAgdm9pZCBzeW1fY2FsY192YWx1ZShzdHJ1Y3Qgc3ltYm9s
ICpzeW0pCiAJY2FzZSBTX1NUUklORzoKIAljYXNlIFNfSEVYOgogCWNhc2UgU19JTlQ6Ci0JCWlm
ICh1c2FibGUgJiYgc3ltX2hhc192YWx1ZShzeW0pKSB7CisJCWlmIChzeW0tPnZpc2libGUgIT0g
bm8gJiYgc3ltX2hhc192YWx1ZShzeW0pKSB7CiAJCQluZXd2YWwudmFsID0gc3ltLT5kZWZbU19E
RUZfVVNFUl0udmFsOwogCQkJYnJlYWs7CiAJCX0KQEAgLTUzNiw3ICs1MzEsNyBAQCB2b2lkIHN5
bV9jYWxjX3ZhbHVlKHN0cnVjdCBzeW1ib2wgKnN5bSkKIAkJfQogCX0KIAotCWlmIChzeW1faXNf
Y2hvaWNlKHN5bSkpCisJaWYgKHN5bV9pc19jaG9pY2Uoc3ltKSB8fCBzeW0tPmZsYWdzICYgU1lN
Qk9MX0hJRERFTikKIAkJc3ltLT5mbGFncyAmPSB+U1lNQk9MX1dSSVRFOwogfQogCg==

--------------YCIkl2AeTAbleaHP3tTNHmPS--

