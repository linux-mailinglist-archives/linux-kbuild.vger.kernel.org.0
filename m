Return-Path: <linux-kbuild+bounces-11070-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y5ylBFl7hmnnNwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11070-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 00:38:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7A410429D
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 00:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7F3A3014FD7
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 23:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CAB30EF81;
	Fri,  6 Feb 2026 23:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pt/Mq+fr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B63923C8A0;
	Fri,  6 Feb 2026 23:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770421078; cv=fail; b=UvHAM5SdqbTNN3Wfw1bVVKzEqm97M9LUmoBookBKP5B0pRMFcmT/yxmDMh3SqstgABif05m5efwtUs5/+E7x927x+dLpnBBHNEqi12M6yO8jHbktIT4EE1qzbB/dS0hM3MwcN8wIIp2uU0EkMQ8pyC6iYAn546XI59/6w4tKKu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770421078; c=relaxed/simple;
	bh=ckOnGf3OeAlsNClqcZ1VMw4zps1bR1DxrdB5Z/S5WjM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F9iReW89L8CTKYK8nz7KANipmUrd3iHnjWvo4XrWQsGOKR9zeHUskUlZ+vunhaU7WjblmwBxj5sosbp+GyLcqCTQC/bCBksjiLNaAP2f8M2+VOpYDrR42QMT3skpZk+gyRrNr6w30lMphdpuU84F9Gb5bHzEP9rvVXmhd0lFJSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pt/Mq+fr; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3PbV7NAUsa1FtDAGtwe+LOj1I6/xJverg8zPchHs53gmsWINvwCuz+YkXNBKEQltWxLE1W0+jIB22u/bX6MxOW+CMjjN3p4NL3+lf8p6ZRrqVoqAXBe3cQljIVvS+uZXohrojQBJIF4P7N3XJV7/zlb3seS+/JiB3/Pi/0wBbdD35Gz8IXbzaCU4Wj/NJtnxSoJdFTJX47vorQJ9768JuQu6R6WxC4x/vkfS54Ob46RCOjF8i6DCwkY+ckuVQTjRfqWsvbcedUVhsNIFAzLtk+GIj58hCTP1RBj5kcJ6rA6cosFQsmxHbWIGBceRDrN8z+ViPnqAwo+knbGRr+wQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dR16eIXX5G4BUmHdC2u559hhUBpL9RxSYT5j4MGMoc=;
 b=ncQBswcnY1X4ONCeagXlq1suNASan8WO2GBcrlYK56ilMoNvnXtWw1o7PNskkcbpYFt6DLgYBa4ev5StPe0MvP6MDoMVx2fQ30eaF16OjQmZiwFwtjBoYClXgi3ivj7m2XC/LDlyukWkrmCVZtSvGGaddeFnlKxKSbG8//6dX6a4Bjnd1Nzd3XFk0CdGVuZMoA75NZwdXK6H3WETdIhGxz6vW3k2fGPLVaXDfNYOLIAFp8DJH79UnHtKZiV5WtcHABQOAnzgqcm7RVCBwpCajvDBYGzXj5QxYq4pBzNxDjHUIM1/UAJWODxd2SgYGzEsf8XmIwsSfmhW0SngvoLfFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dR16eIXX5G4BUmHdC2u559hhUBpL9RxSYT5j4MGMoc=;
 b=Pt/Mq+frtOhYHvoKzgXsEkLGzB8BClR8BGSHx0FObdLMxvW+mS1c5JGp+tQ6ocxDDcWIIT2nqQprdqmAWzrJngInxq8IYBIUd+rI78GlssQj4XzBCadXdQcuFdEiskGs9VsWshiF1RsI1P3To90IYKeRanyaDbX8Oti1cPlzlxVZA+qOqNZIsobfXMl+X+/xtrx8mV4FiLF/sAs+FJYJFVL+B3YnrhaO6w6L50fsayJLybZzLR9TS8X9RLip875sI9LnsDYr3lDlVoWTw3Ge4E/hFYlyFr1Xjgh/Y3HGg4566BkfPAz1sselWfXnuzCcyyEOPcrPbxNKYOs+T+MACg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 23:37:53 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 23:37:53 +0000
Message-ID: <3f811c47-663c-4326-a7b5-cfe068e3b9d9@nvidia.com>
Date: Fri, 6 Feb 2026 15:37:45 -0800
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
 <e137e948-e44a-455e-b3a1-717865ed15aa@nvidia.com>
 <DG88F5B5IAA2.1XXMBH517NDBW@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG88F5B5IAA2.1XXMBH517NDBW@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:a03:100::39) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: 922ad1a8-ede1-4d32-1b3f-08de65d8bf75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NTI2NlpSSFpXWHdOSHlST2hiMlNLcFhRdG1ySExCODBkWWp1cXFtUG5INVVp?=
 =?utf-8?B?Z3p3b293MmRKREtUV0lnai9OeDI1OEJXblY2ZjJBNjMwSzg5Tmw5Q2NneXA1?=
 =?utf-8?B?UTBkdzY1QW9sTWRhUDlOdFhHckJtR2dTTkh6M0dhclpJRkQ4ajhGNnZRVDhj?=
 =?utf-8?B?SXMwdlhrRzdYeitQRkR3ZXQ4ejhEM1hZZ2xEVDBiQUpwTjdhRmhSbmo2anN5?=
 =?utf-8?B?QU1RTmRzb2pTSVJjRVhmNE16V3ZLOW9JS2Z5WHpEYVdsSUVqMklOYS90a0hW?=
 =?utf-8?B?WUdKSk5HMXZxeVY2aURKN3ByRkRkZDQ3elhJcnhUQzJ0a1VpSnZLeDlsVDMz?=
 =?utf-8?B?aUJVc1hPd2MyVzFzUDc3REhuYjFxWktCTUhqZlhCUElCdUM0cFJGaXJ4WWpT?=
 =?utf-8?B?dmdXTm1OTFdCSWtNT2JIUDBQSVl5S2NiOGxRbTdJVEtjQXE5c2ovMlkyblJy?=
 =?utf-8?B?K1RTRTB1cWJRV0lROWVqTmV6QXdYQ0tFN2lpRmE2OUdwdFBYSFl0ek14Q095?=
 =?utf-8?B?R05KVURzdEVxanVXSWRFNCtqbjcvM1V3RlN2VGt1cUovb2tiektuNUQ4aERU?=
 =?utf-8?B?TlltTmVxcW9hcmtwVmN3RGdYRnRuTjBuNWtleEFDNnpiaDBuRTFyRXVieWxV?=
 =?utf-8?B?dHlsM3YrWlBHRXVnWFE3ZVJ6eGMrWEd6REQ5cVZTRjRGbWoyeXJreXJIcXFr?=
 =?utf-8?B?MWRuYWUxTUVZaGhpb1FZdG9PUFJNQlZSZlNHSTRkWGNuK1hLNDNMZmFtaXM2?=
 =?utf-8?B?VHFhUVRPUGYxTVY3enNlOXlFVU9ja0JaTkIzZ3dBS0Q0RWpqb1FWV0hxVnRG?=
 =?utf-8?B?T014SnZYWTdNUTRhc3dFdGpzdjBBSXZscTk0cmRBS09zcW5MOWM4UUpyVTVG?=
 =?utf-8?B?Q1haMHpRYklSOWczQ1ZERXJYNUVBMkxPZ0lsdStVSTkvaHBKSytVejFqUTcz?=
 =?utf-8?B?dDBydXdzcDB5VDl0L243WFBQakYxRURITjk0MjhNWVpnRitBajFWaUFxbGJ6?=
 =?utf-8?B?YkVNOFFGVUxvUFoySlZ2ZUFPTERpYnVPYi9oTXdoUTJ4dDdmT3V4UzMwOEFN?=
 =?utf-8?B?dlJNSHQxU0ZPNDQwd0xpcFUvU25SZHZkbVU5RnZVZW0yeUdtT3h6aklqM2dh?=
 =?utf-8?B?YTI3UlVVN08xdEp3SnNDYndnY3JDMHhteFZBME5KMzFENEYwZVk5TE1WUUkx?=
 =?utf-8?B?ZjVSZTYwV3dmVHJEb3kyMnhvWkl5dFdhdFcvc2NycjVjRmpCSnhtbDNLcWNW?=
 =?utf-8?B?T08yY1F2UkpjRlBkSFZrOEZxNW1RMmxJb2lTQ3dTYlF4QmVtM1ZGSzJpbjBk?=
 =?utf-8?B?OWxoWko1bGV2cG5wZjlKcnk2K052QWdiOWhrL0x0TTJaWXlOeU52RWNuMTJJ?=
 =?utf-8?B?WXZsYmUvS1BuUURvcUZzRWpLNFBNd1BjdU1lK3cwSld4N1h3b3dsTnJXcUth?=
 =?utf-8?B?S1cwT3VJdHZ0cUh5L1hvYW45Ky9uU0lKOVV1K2F0NlJSS2ZJNDlTcTdHanh4?=
 =?utf-8?B?NFZneUlOK3VDM0FHVjZjbjRkdUxWQk5Nd3pVcE9DN1hyQjhseFRKTTg3bWxB?=
 =?utf-8?B?V1VGSnJnQ1pVcTNyYzdBSVBnTVI1bHZCN2lTekgrVHNtQXU2UWVuR3V2b0Ra?=
 =?utf-8?B?MVdDMExzNFIvTG1zSkFRekpRTHRWVUZ3V0sydjQwZ1JqMmhvZE1HdzhxWDBR?=
 =?utf-8?B?TnFWWms2ODN1WEkzRmoxR1dZa1AwcW83QVF6RlFBOHprNERKb0RaSEFiWHRr?=
 =?utf-8?B?NFVrR2laVWxOREVXSExROTZxR0pKT0lwMmdFTXZBdFBoSko5OHJXd0w5VkNa?=
 =?utf-8?B?L2NoTFUxYWlzVHF3WG54eS8rSTNmem5WZlFoalcvNmxoTUhuSHRUNUx6ZWtX?=
 =?utf-8?B?OGpoRzJweXc2cm1iR3A0dFl1djI1andzMXg1amIzWjRzbld6WHM5SHNLUnJt?=
 =?utf-8?B?RFdNRFZhRXpEekVjTHY0MGtUMUp1UU5GZUlBemRZVG9md2ZIZzVCTFBiNnFE?=
 =?utf-8?B?VUVuc09JRjFvdHF0b3dmWXdreVFqa0RXOWtJdWdiSHNYcWtPb0hJL2tZTmRB?=
 =?utf-8?B?clI0RVdMVkZBRlFEcFF6ZUdwRTRoNmwwU0drZXBJajFIVHJhMFNrZzhiSnZO?=
 =?utf-8?B?L1ZBUW5oQSt0dnNMTzF5dWo1R1NqMDNPTVdad0hoWWJZRW55Y0Fmc09Pa09v?=
 =?utf-8?B?bGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDRibGNxN0ZCWFRadWJoUklITVBMSDBoWC8yVXVxMXlyWE8wVUhxaGUwY3pR?=
 =?utf-8?B?aTZGcjk5RnVyWmZkRER5Uk42NlpJMXZRcmlOSXVWbHRPTzJHSjBYMUhHV3hq?=
 =?utf-8?B?SVVOS0EyaXk3aFJxOFQwM2hwcFVnU2VVNUJidWtHZmwrRjlpRHlYWGEwNENI?=
 =?utf-8?B?ZndvSmkyTXZuVHUvd0JJRkFFSXJDRXcrYXpicGFyNXVhNEVramFVTlpqT2xP?=
 =?utf-8?B?VXJ0MjlGWkExWUM3UWs0aHBWUU9JQmE4dURsSVB3Rno1aXY5Y3lLdkpOSFVT?=
 =?utf-8?B?S1dTNW8wbS9JOFVpK2JYYWxGemNWSXBDUXpwUUxKU0VIME9JV2laRkRROVJR?=
 =?utf-8?B?MEw0U0JPTGRMRkhUMG1UL0U1UlM2Ujl2WCt3WDA2ZVpVYXVCOTNNbWEvQjhO?=
 =?utf-8?B?dWViWGRrQXY5SmZxSVRod05GalYrRHY2Y2U0SVFIRmVjcXcxaW40ZjY3dVNk?=
 =?utf-8?B?RFFtbXRxeDhYWnZkcjNhd1FXSzVpQWw1aXJ4UGNpKzEzMDJjN2kwK01CYk5l?=
 =?utf-8?B?YTc2ZXU1UXJ4c0FKUERTK3BUMWhGL3cya3ZvTmtMTFhVTXIrTHpmSTdFdG0r?=
 =?utf-8?B?dTcvNU9QWVh0MXk4WGVwdVVEd0Z1SVdWeXVhVGVQRnFkdWJLU2QvQWQxaFU2?=
 =?utf-8?B?Lzl2UXJBZHJjcEJRdy9wbU02THBRS2tCZFpKVExYUWdlUEVwSTg2aHR3RlEr?=
 =?utf-8?B?Tk1OZ3pySndZMEpYMDRvakpIeUtIS3QxSE9lS3JVeXk4MkhCWGFzbEVNaVo3?=
 =?utf-8?B?QzJSbkdRZFZpb2E3M1lyV3JDckNTN3FWRU5wa1p4enNPVXVWQ1cvUzNTMG53?=
 =?utf-8?B?VkhUeStEWDk5OGVoNzQ0aXIyT2R3VlBlcVJGcWFuempjQWRsaURSNTB1bFQx?=
 =?utf-8?B?aDlLM2hVSWdwNzZmUTkxczZkbjcxQTljeG9oMW9RekY2Z1pubkVUa25MYUUy?=
 =?utf-8?B?dGIxdnE3RnluK1NqdUYvLy9vb0lJa2xUTUFxRnRKeGQ4V1g1RC84Wm82Uloy?=
 =?utf-8?B?M3EvdjJUeXRQZ1NhK1RoZlJlSEdZTGROVzRmMG1MT1dqR3dSSDZMdHRKS0Rz?=
 =?utf-8?B?WkF0dWhENFRRTDVNekNSSEpldThJd1VvZGtqTTdoZCtMajBJSjBEZVFDNHR6?=
 =?utf-8?B?ZE10bTFabzExU0RyR1A0UXRmY21laG9jZ0dBUktHaVBGaG9NVUQ2VWY1QXhy?=
 =?utf-8?B?OCtPaEJqUC9PUmUyN3hlTzRlNFhzcFpIcVZsU25jSk1NQWQ4bHZMYTd6TnEz?=
 =?utf-8?B?NlpHQ3lsUVE0Q0NYVGd4M0xFOWgvbDJJSHVYTWxKb25qOXhmU01XOVo5RjVK?=
 =?utf-8?B?ZHJJWFZXMXVlNGNBQ0oyUlFqQktvR3lMVmlNS2swRHNaNVdURG9RTmFyamZm?=
 =?utf-8?B?SlphK24rL1I3MEdvTkNCd3lDT0djZUNkdW5IWFhDalBzNVpkYis2OUk5UjJO?=
 =?utf-8?B?UVdLOTQzVGY0R2tsOFJDcExrQXZMQmZnT1ROc2pvUkJTUG4ySEFWQm5vVStv?=
 =?utf-8?B?TjBJZklySEMvbmhwTW9ZaTlKbW1oZ09vbVFCSEc0bVllNkVBdmw2TnljYVhM?=
 =?utf-8?B?YXRmc2JIci91SFdVY2t0T2doUGFabHhrNFQxM0NGMUdMWlV5YTc0eGVqRTZp?=
 =?utf-8?B?TUYzdkNldjNIL2xXMGRyL01VeXc3a2dTMmFtYUw4ZUR4dDlNT2RCWTNvcWRI?=
 =?utf-8?B?VEFDQnF6eTIvd1Y0NENxU1hiK2JsMXZ4N3pFRXpoVHdXRkF2WmZKMzRMV09M?=
 =?utf-8?B?N1NKZDlGSWdFOU9XaTNybDh5c2VtOHJXUFg2MFYvLzlXRmpSTDJTd3JUZGlq?=
 =?utf-8?B?a00rTVRSQmRUdVBrMlVveGlISVkycmdUZ3pLY0ZPSEJkYmNFdzVkbjNWU3pQ?=
 =?utf-8?B?VjlNVjJwaEJCN21yKzh2d0NCQ0NoNkZTckNBWXhrc2FKWDRrc20rbW5MMmNo?=
 =?utf-8?B?ZE55eWNacEJjd3R4dlFTaFJlVWhXMStHYktlSTlSZStmVUkvdEpqYml6WC9v?=
 =?utf-8?B?NlFPVTFXN1pGZlhNVDVtTzdxNnNrVWl3SlVwSXRkeSt2OTN3REV1amUwNnMr?=
 =?utf-8?B?elhTbHB6dXdBcjUxT2ZuWThWR0NWTG1FVDIvOHFUTUhoUVBBcU0xN01qUTZ2?=
 =?utf-8?B?cEUrYjl3VnFSeWl4OTZGZ0I5cFdjcHVJNGxUeGdJU3dOUTVpM2RxNGtoMUxM?=
 =?utf-8?B?VUN2Z1FyT0FETDFWNDk2VFFnYnVmZXNiWGZoemVsR1lsNjR1cDJYNldIYVUw?=
 =?utf-8?B?amZkVnlOYkR2Q1E1cTQ3eXpoakk0Y2RXbnk3dUlyUS9FSHN0dHUvSnVuT3Nn?=
 =?utf-8?B?LzVhSFJwNFc5blc1dmRQMUpqb05IdTFRNEVpWlFpbldudnhrckxRZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922ad1a8-ede1-4d32-1b3f-08de65d8bf75
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 23:37:53.4198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekvSZFvddMGgYzKyg3xjlIRCxhso2tYKPt385n/yzsMnmHSrQn9kYP2FqCbduK6YZOSP+x6yr7lQTK4HZ9EohA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11070-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 9E7A410429D
X-Rspamd-Action: no action

On 2/6/26 2:28 PM, Gary Guo wrote:
> On Fri Feb 6, 2026 at 10:21 PM GMT, John Hubbard wrote:
>> On 2/6/26 9:12 AM, Gary Guo wrote:
>>> From: Gary Guo <gary@garyguo.net>
...
>>> +/// Assertion during constant evaluation.
>>> +///
>>> +/// This is a more powerful version of `static_assert` that can refer to generics inside functions
>>> +/// or implementation blocks. However, it also have a limitation where it can only appear in places
>>> +/// where statements can appear; for example, you cannot use it as an item in the module.
>>> +///
>>> +/// [`static_assert!`] should be preferred where possible.
>>
>> Over what? There are 3 different assertion types. If it is actually
>> possible to list a clear order of preference, then let's list all
>> 3 in order, rather than having a scattering around of "A is 
>> better than B", "C is sometimes worse than A", and then the
>> reader has to play treasure hunt to work it out. haha :)
> 
> I am trying to avoid listing all assertion macros in all assertions macros,
> that's just going to be duplications.
> 
> How about remove `#[doc(hidden)]` on `mod build_assert` and enumerate all
> assertions in the module documentation and give them rankings there?
> 

Maybe yes? In any case, let's at least clarify the preference one-liner
above. Something like:

    /// [`static_assert!`] should be preferred over [`const_assert!`]
    /// because ...

(If that's even correct. I'm a little vague on the intent still.)

thanks,
-- 
John Hubbard


