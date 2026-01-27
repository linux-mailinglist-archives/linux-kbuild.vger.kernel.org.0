Return-Path: <linux-kbuild+bounces-10908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB/gLmNBeWmAwAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10908-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 23:51:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A50A9B3AC
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 23:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04286301AD2D
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 22:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8854C1D9346;
	Tue, 27 Jan 2026 22:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ZDUheXZs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020131.outbound.protection.outlook.com [52.101.196.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C478F2E;
	Tue, 27 Jan 2026 22:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769554272; cv=fail; b=f+D/VHbZUPmrutjjgQsN/fB0lwsIglsnOLllsYvfMjKGHQi9K1Xe8hITCH884f7gyOJel1pEeU2uMyPgdk5zw2yiiXZCV7roI9H5/Phqnts+NR2K45l8FGmJjkMfsJNBhheIHoB1yxU1xnzwDgun0XEJ/vOm/Ap9pMGYDLpxps8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769554272; c=relaxed/simple;
	bh=g3VdmO+Aqvk3/hc5+KE4NbTc94Zm3j4e9oSyy96oDdI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ndD4PgvexgzNRdz6MKJKgiRt8FMgg6G3GLR81nWWkE7SlMhL0L7Fse8PF7DJSJJIRrIAjWgE3CX+NbYAMDVO4WFPUIhjoUSNVixfRS52EnAR5DZD4rjyRKZL1uwZQ0h44Dve7j8wfFSUhuICPKOFMo2C64D05E0PbMOO4xzp7Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ZDUheXZs; arc=fail smtp.client-ip=52.101.196.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtYJerAUDMLF0olDEqMqwqbcfBkjyvb2h7XyejUhWuPuKSeMpw/UR8v/9Wyvzq9mnnvzeZWsaqlUn3SlAVpCD0GCOp8xBqGBrjP6FJriuYngxOQ7vUSXx+SRj1dQ2KvRWEjhKUWaPhdN5CQ6PWhzywQFw2MKfgyoV51bsm1r0YIdk3Z+KlD9j86veKBMkd6uDUc3jAyTuhwFLH6VZgH21aexZpPZSOMpqYMWQpU8BVN+2405EtecZo3cT9hAxyuzSCJcD5mZSV49+Pyp7qF9PtIeykgIxdVF4X2grw64MJ5T/Dj3szfdVKmqJc0stEIjamPkPEGvzYZoNt1aNWaB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=db0SmnoPMG1OnmpvmfHmHAGyTCNyscV1yw3u1G2TMF4=;
 b=ZsdfRJExi7xUcDEhwRitVaBk8UG2oYKwonWk4cj9BXnWzDcv2/iLcsA+VGvUftR6XSfUXpqGumK1vd/2C03u1mLT90w5uyjvucp0Yjqj4fW9Obn1fnBhnQ2UGV2L9MRPqK35gmOwHJorNYt9BU4xomSGeG1QrJS6d+RYBg4to9udeoDHfx3ZJ9wvAccKb2QbIOm9PNOmqONg1x1jn3jrZbNrSylSAk1B1WTzPM11vDoG/KAXJVIBk0cvCnZ0FY6G+Hv76fXAlcZE8elUvJP65UlLAWfhtMootgGk+DStfNxQVhSoYIyT+PuipM4rXpdHkGImLzH3jTaIwTYtUCPRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=db0SmnoPMG1OnmpvmfHmHAGyTCNyscV1yw3u1G2TMF4=;
 b=ZDUheXZsZJah2GLf+RQTF6Q0EQZlg3WM7NQwEeKsE9zrm8JlYpURO7PYQRwkpiVmS8VLg20maxaGlte53KmfOUqzf0UbvQDTbJ+SNkpyq9iOYsXXpZXKWJhbQc5OUW34LULwV7AEvlBCg68pMDUBdj/kbn+YgV7vPfQre15rICY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWXP265MB4986.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:199::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 22:51:07 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 22:51:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 22:51:06 +0000
Message-Id: <DFZQMVAWC7IS.7MTK7QGQLDB8@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, =?utf-8?q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, "Masahiro Yamada" <masahiroy@kernel.org>, "Kees
 Cook" <kees@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide
 CONFIG_FRAME_WARN
From: "Gary Guo" <gary@garyguo.net>
To: "Nathan Chancellor" <nathan@kernel.org>, "Gary Guo" <gary@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org> <20260127221531.GC3382807@ax162>
In-Reply-To: <20260127221531.GC3382807@ax162>
X-ClientProxiedBy: LO4P123CA0626.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::11) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWXP265MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: 091a3d20-8a0d-469c-eae8-08de5df68e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWpvMTRSNUdnZEF0cFNPYnhKbE9OcndLZnoxUWwrTnBZQUs1RG00TEt6TExZ?=
 =?utf-8?B?QmIvMkFZM1hYUmxKSzE2M21vSHlmb01rZHF1TWgxYzF1K3BRMEhyQkpVa1l5?=
 =?utf-8?B?UFNGOTdDQWs4N3dWQ2dmNXdmTnk0VWRXRXF2WElJTExLOHZ1QUlkNlVXRUJh?=
 =?utf-8?B?QkpmWEp0YzhZNURkWndkRGZhWCtTWC9YdGcvdDR3M05adEZ0bHZGN1FjS1VG?=
 =?utf-8?B?cW9iaWh0b1grKzZwUEV1d0NGQ0lGaFVQT1pZdGJreTVML0djQ1RKOWxsN3c3?=
 =?utf-8?B?OFF1NjVGSGp3QmhySUVCRzd0cVMxNTJPMUxOZW5WY3hlbHZBUmhsRS9iK0F6?=
 =?utf-8?B?VnFjUEZ3bjR6clZ2b0Z4RFZ3YTVSZk12SkRUbStjd2t2UGJCbGpZRGNCS3lq?=
 =?utf-8?B?Q29MeVNXME5PcXJMUnBzRlNPbnRnQjluSzAyVVdEa25aWWFta2JrMCtnME5U?=
 =?utf-8?B?NVlnd1VBL09lRWhwdUxpNzlCUjNkcy9ZZUxhRjhOUXdrZzc3NGhmYUVYUEs1?=
 =?utf-8?B?MUREL3hBR2R0VkpmcjlYOVlFVGpHZ2doaTdMakNjVlgyalgrRW1DZy8rN1p4?=
 =?utf-8?B?RDRCOXBDbnVJR3FucXptZ3RFWHFBdmRDSjlxay80cWxRd2dkb2tOcnRvei95?=
 =?utf-8?B?ZUxpQ1VkelY1WjlXdVRUeGRkNGNERUJONVdZVjZNb2FVTWduQVVqYldselk3?=
 =?utf-8?B?bVBmck12T2wrczgyalVzZGZaVy9HZFF0ejk4VSsvUGFlZFJLbHFaemRVYnBx?=
 =?utf-8?B?d2s0OE1MWm9JQTdRRExtcXd1YlgrY2N3RmN0dTZFWENFWm5pKzk2ajJ6cU50?=
 =?utf-8?B?RXY1MmpCTFNvSTNaYVFjY3FHVEZRREwxNGRFRUhwckVLcHFJd3ZuakMrci9i?=
 =?utf-8?B?cjRGdGZFVzVGMWZVMERIaTVyU0xFSmVSRGh2czIvdzdsVjE0QmpHK2VkcWpU?=
 =?utf-8?B?TjY3OXpaZ0ZhcUo5bHI5dDd5Q0N2MjVaYXFXcVZnS2paRnBXek14NVJyOGMx?=
 =?utf-8?B?QmdIbEgwOUNpRW1IUkhZMUZiMC8rYXhHVldHWWFpclh1Q3NOSWNZcDZIeDB3?=
 =?utf-8?B?cVhWMW5IQThIRTl1YzNxNUxKd1hPUFY3R2swb3NkODVqVGNaVGptMW1DSTVH?=
 =?utf-8?B?Q2pqVDdFZzlPRmxuUHlvSVVpZ3FOakNvaTZOT3dxTm12ZUJIQTkvT003TWZq?=
 =?utf-8?B?ZU1BVUpPTXB3TFU0cHBaQjZQTXZCWk9uVURmRFF5dnBCYThLcnh4cnE3WGhJ?=
 =?utf-8?B?T21wSm92MlZTc3pscVNra0RlcDVSNkhPOE05bCtRd2lDZlJYd0NTcDFydE9j?=
 =?utf-8?B?T0MyNHpYU1l3cWhwRWE4UTRkV3pGUDRlaHpiSmF0d09Wd2lVTGx6ZFJUT0g5?=
 =?utf-8?B?RWlGWkFWc1BId2h4ZkhFcmNTOGVqZ3prWTh6N003eXVCYmw2MlgrRFUzRHBy?=
 =?utf-8?B?Y05qMFMrM0dmdXpURkdscGt3cnZzalNEUnI5c1dLR0tjZVVKSTNHWVhZQ1Jz?=
 =?utf-8?B?MlJWOENoc1NBZ1dubm1aWlFZSnZMQ1Y4QzJnS2FPZEgxdE1aQ2lUWGtYd0VS?=
 =?utf-8?B?OTBVYlJ0WVlnZGtWc3ZSUm9UbkZjVFlQcFMxSjBWZmdkdnVHek5FRUpVTmpr?=
 =?utf-8?B?SHU3SXhJcGt3R2lRK0VsVGE3UHNPa3ZacGp5VStvRXFPQXlacW9mNE5GeVpR?=
 =?utf-8?B?YkZFSkhYa3VBWnhtQ1dMS3ZKczhtdFcwVVozWkF1dHBTc2pta3JpMHdzUFFm?=
 =?utf-8?B?bk02MFo3QzdVMFRhYjJoYnNub0VHM3c3bjhMc25NS3FXcjh4WEVHWk1IWWNQ?=
 =?utf-8?B?UUFTLzRNNXNNS3EyanFUVnFBTEtwRmpiVTd6dnlia0MxZGVRUWFEbnVVSmxB?=
 =?utf-8?B?a0FVQWtsVlBkb1hmNUhUdSszaDMxelBUbG8yalRoajA5UThMcTBzd25wbndp?=
 =?utf-8?B?UEtVWEdVZG92Y2RteXFXMTI5ZHM2d3lKYkNhN210TGtZMlhDQzRaY0xlZG1q?=
 =?utf-8?B?di9IUSs3SFBNMHJlL3NDeGtITGpYdmloSXNVb0dFd3lBOHd3MlVUdWh5R0RO?=
 =?utf-8?B?alZJNFNCL2l5MzhGYU1WVFNWalA1Vm9sQnJrOG03RHpkZzlsV3phVHdWVDB4?=
 =?utf-8?Q?NKY4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2ZLRzhhR1doSG5uZi9vQU8rcjVWYnI5cDBnVHdpR0tCSG4wZ1VwaEY4VW92?=
 =?utf-8?B?TitpQlU1ZWhjMVBWak81VG5JOFlxK3EwRXhOZ3g0NEp1Wk5GVlRzVGdTQ1A2?=
 =?utf-8?B?clJ1Z0hubUdNSHFiOEozUnc4QmZUaUJqOVg2M0p0S0ZoOEJmWXQwa25sMTBJ?=
 =?utf-8?B?aHk2RXZOSEFzUUF4dmJyeDRyQ3JZaVJaMW9QVUZUVEM4Rkt0UE9YaEdVMW9v?=
 =?utf-8?B?Rk1acjR2VWpyeUYxRlVYU1FERGk2a28xN2F5Y3BacElwTk5kZVlseFcxcWk4?=
 =?utf-8?B?eSs2elNJaXZJODdDZitFTW9CMngwemo2aW15bGpqRjdCYllwWC8xazlhR0I1?=
 =?utf-8?B?S3dmNW9Nb2Y2TmpFK2FDcG1RMUx2SENaV1F6ZmVFeWk1RUdwZWpMK3JESkl2?=
 =?utf-8?B?ZDNBUWgxWVVBZldCSnVYaG91Snp3eWQ3NlhiM2dMMExTU0djSlppVEVYN2dF?=
 =?utf-8?B?dkU0WDd2N2pjZWd5a0xHZElIR2NyU05Vb2dBdVo3RTZzMGgzTUFHT3cvekNr?=
 =?utf-8?B?Z3RjMVZVOTVmU1JEOHJGMFhnaExJRzVicDAvMng0dXllLzF0YUVhYjdNaGI2?=
 =?utf-8?B?MEswbkswM29KbS83cUZEQnllcHllK1dDeTUyWFJDdUJMRUhLN2tRRUFGZ3du?=
 =?utf-8?B?bHpHK1hRcDJ1MUNyNUdtdnY2WE1raFFqWjVJd055S3BnYWFhWTFDVUt5K011?=
 =?utf-8?B?ZC9NZGVRT3JxakttOHd4ckNTM2pZTm0xQjFRZDlKTlFZeThkTVlyUXFXN0cz?=
 =?utf-8?B?SFJmdUJrZjk2N1EvanRXM3hUS0E4a05URHQwNG5JS3gzNTdkSzhFajY0MktM?=
 =?utf-8?B?a0JtR3B4ak9OQmZPb3NjRlQ2dE1ZTDBoUWtjazR6K2tGdXRDZm9ZTm9IcXUr?=
 =?utf-8?B?UGdZa1RLNFEzM0k2QytiemcyNFdhVWwySzFQUHo4ODRMcGFHUFVFN2lJMEFk?=
 =?utf-8?B?a2JvVDR1K3FKK2x5ZW55U0NkMVZ6ZW93WjdXdDF6cVV3WFI1c29lOVhkOGlD?=
 =?utf-8?B?ak1oQ08ybCtHUi9GRE5COXhBTWlBalNCZm1SRTRzOVcxWWdCdmQ4RUJkUDJo?=
 =?utf-8?B?M1dqUGZnQXpJOFFVTmNxMFEzVWNjSDdBTldmK1o3MHBUajFDK0JQbXdKYURl?=
 =?utf-8?B?U0huaTlGLzlaSG92YStJcmkxYmg0eS9jVTRrdWs1elNuN0lDeS84MGNaSnRn?=
 =?utf-8?B?a0prZ0tjYW9aYzdsRXRKdDY0UjMzQVRWMlBmaGx5S3RqQSt6TldDSVlqUmFU?=
 =?utf-8?B?VlNhajl1WmxkUUxEMkJCK1ZNbHBVdHBjSE1ZM3pOb2doS3k4eDhvR1hFYkRC?=
 =?utf-8?B?cTJncmQwM1ppendtQXRKNlNDYkZYV0xyWnNCVlYveDJJczVicGFDU0wzZDJO?=
 =?utf-8?B?ZXdZS2trS0J4T1kwSjZXLzdsSWl5K05GOXE1S2VxSldQd2lZcXR0clJrZDhB?=
 =?utf-8?B?QlFRTW5uMnVGT1FkY0p0NHJGOTRRMzNUbS9qRkJHaHRRSlkvL0swcVYrcllY?=
 =?utf-8?B?NjczVVVIRDhYODdldDZZVE1DZlh0OXhoK1B1NTVXQ1dIVlhEb29QNDNnSWtz?=
 =?utf-8?B?dnJZNUZDMFhBdUxlb3owb2VaQU1zeWdmYnFtVmllVDZOQjRDZ2g0c1M0cEFx?=
 =?utf-8?B?MStYNkoyRlBSVWdsRzN4YTl6cUxwbnhORXFVZFNyWEZibjl6TG0vK200R2pq?=
 =?utf-8?B?QWVVaXNGQnlWZVM3Qjgxa0I3czdsTWc4TlVXMXZrcmRsVjFhZjYrM2cvNmpw?=
 =?utf-8?B?SXNvby9PSVg1WmNZcmtNS3J0M2FkK00rN0hiaS9rNzkxczBoT2ZTVzdaZ3oy?=
 =?utf-8?B?czdWRkx6eVpUWjNhOGMxUnArYzRubnYxL1pXNm1ZSk9uWWxPVnBCbE9lOU00?=
 =?utf-8?B?T2lsc2I0aWpzRlVkUFJaR3htKzNMdWFIUVBvcGc2TS9NeXAyOUZsM1kxVWk5?=
 =?utf-8?B?K2RFcC90TS9zTzgxUnV5YUNzYmYxWUhOVnhJMnJrVkpFYkpkbWRxKzlvWDVh?=
 =?utf-8?B?dlc3czM5ZGIvbjJTSDBsOHU3b2hDTUZ4SXJEQWJ5WFNqcGhjRWV6Y2NpaEdt?=
 =?utf-8?B?dUdxY1NuTUxxZi9tZlhHYVA4anRweEVGdjBVci9NL2V3UXRYYzFDUXJuS0xK?=
 =?utf-8?B?WmJlWW1UYkltRGYvZGlKYjNoaHZxdGVqVEdSaXpUSTJoclhYR1RKRTNUbkFD?=
 =?utf-8?B?YU9YVEpTaWRBdlQrR2NhcXFSSUF6YzdtcUppNVV5UVYrZ1dmUXVQc2FMajRT?=
 =?utf-8?B?MTVmTXJjeGlvYkZQcXRKZmFaZlNGNDlGR1R5TVE1NjkxZnQvL0VxTlVmV0oy?=
 =?utf-8?B?ZTdNcnVUS2hBd0NQcEVnRjNUMDJ6M3YrNXhSQyt1b2ZVVVEwMkdhQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 091a3d20-8a0d-469c-eae8-08de5df68e6d
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:51:06.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usfurzMKUBmf9GBIGzSk9FdQ80OdP4ETEz8LBBTLT/yJEi/mLCSIrryseeVytj+nCf95XY0kTDwKySG/fezTEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB4986
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10908-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,weissschuh.net,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email,garyguo.net:dkim,garyguo.net:mid]
X-Rspamd-Queue-Id: 1A50A9B3AC
X-Rspamd-Action: no action

On Tue Jan 27, 2026 at 10:15 PM GMT, Nathan Chancellor wrote:
> On Tue, Jan 27, 2026 at 05:11:04PM +0000, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>=20
>> klint is able to analyze frame size and warn on frames that are too big.
>>=20
>> With `register_tool(klint)` support, we can simply instruct rust to turn=
 on
>> `klint::stack_frame_too_large`. This is a no-op if normal rustc (or Clip=
py)
>> is invoked, but will perform the check if klint is used.
>>=20
>> This is an example of a bug caught using this option:
>>=20
>> warning: stack size of `gsp::cmdq::Cmdq::new` is 8216 bytes, exceeds the=
 2048-byte limit
>>    --> drivers/gpu/nova-core/gsp/cmdq.rs:453:5
>>     |
>> 453 |     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Cmdq> {
>>     |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^
>>     |
>>     =3D note: the stack size is inferred from instruction `sub $0x2018,%=
rsp` at .text+32778
>>=20
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
>
> Is the limit customizable?

Lints in Rust do not take arguments, so there's no way to represent somethi=
ng
similar to `-Wframe-larger-than=3Dfoo`. However, I've made klint search [1]=
 for
`CONFIG_FRAME_WARN` and use whatever value is there.

Link: https://github.com/Rust-for-Linux/klint/blob/168031d93c3aa538c8ef71d1=
e448ae77c2cef7a7/src/binary_analysis/stack_size.rs#L70-L82 [1]

Best,
Gary

>
>> ---
>>  scripts/Makefile.warn | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
>> index 5567da6c7dfe..254a4d53f8f3 100644
>> --- a/scripts/Makefile.warn
>> +++ b/scripts/Makefile.warn
>> @@ -23,6 +23,7 @@ KBUILD_CFLAGS +=3D -Wmissing-prototypes
>> =20
>>  ifneq ($(CONFIG_FRAME_WARN),0)
>>  KBUILD_CFLAGS +=3D -Wframe-larger-than=3D$(CONFIG_FRAME_WARN)
>> +KBUILD_RUSTFLAGS +=3D -Wklint::stack-frame-too-large
>>  endif
>> =20
>>  KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) +=3D -Wno-array-bounds
>> --=20
>> 2.51.2
>>=20


