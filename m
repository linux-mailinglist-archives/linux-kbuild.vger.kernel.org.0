Return-Path: <linux-kbuild+bounces-9405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D2C34671
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 09:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 494BC4E68A4
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 08:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECAE28D8D1;
	Wed,  5 Nov 2025 08:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uk0zZ3v0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFBB21CC68;
	Wed,  5 Nov 2025 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762330260; cv=fail; b=rF6xINLeBOvU7Cfg5UIUuU+pkRvw1IQ2hwqa3LcBJ28tn2It+aTXh70qVFcEHjR8kKaC3teZFYCKt0biT/yAT+zKcXtweLKqRd6wiVHH4JUcE1v9Iw15PjUDFEGZvpkJ4MBFzBkENZoiKcSGWcOf8US84zB8qVr8hrdf0cCoHJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762330260; c=relaxed/simple;
	bh=INgzPF1SBTsMGHiY5OlYp+b+XGrAEReulZCsLCLH+N0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=LKzUpzM+z2HMUtHsYZ8WU6Tx2Nb4fsylZhfL3fBcH/J9dp468joLSiql/y5HnqWE1hl2tzL3WMya7c+emAuXPxOmHfgOSAOlHW/4OSgxzdRO4SNZXBH/2eJ4Z/e5O9PN47N1wgTxiMKH1ZG1bVFMsg9WZszsBQjmUfO8Rzjjc7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uk0zZ3v0; arc=fail smtp.client-ip=40.107.209.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xveahJCWqz3ZTonWOizxVRA4pJr2HsK3EHz/5cFV+rGrj8qj8rv+xEZXpVeneP79j0dDLMiV8EyrAeUsDeXyGFBd9PYBK/ZlTO961yHM/8GGoQHzRxE3FsAEMwiIBxsFf95r3ZQtMh8syCXTzoQPKvgWVoi1VwiGaGtJT2LwCCylbNa+SRCsDNBCePyeiM9HEzUUiL9bkSTznlt+5k+QvX0XoftqvYcIxA3JYpcd8Jn1lrAnG6V7RFreD11T6uQKONj+d1FLejdrzU9JwIH1aCEd3NWmjgP3ekDhbi2HGs+ceo09tbiLUNTdXkypJOH0r9P/KefT9ab6eHZREHmL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFoB19f4Akk+JZnEfrgBj+HOSpcGvz7+8ETRZITB5NI=;
 b=ZyzAydEt2nA5x6FxmbAHWtrAVMLJiMnZpD0XsGEQx+JrAD+cVWNUUaaS4/gRTdQeo6kuLIi0ILb+dNjAi8nLbnHbGqGuGkuVIDsDYZ/JHz/2B65+X0B560rPMY7cOYnM5hnUZlw/bJpsQQ1XXc8yHXcFKFOqfqDiy4i15gAxlgggdENZAGDisZwWWgMFbuJACP9BoMNDPkNYMLArpGcpq00y34WiYWxWQUwRLt+tW5IYg/oRbuTz/kOt9rS8Hr99mLSTyKU/0s7tetGZr+AGha9hLzGF6dlpmB0kJREDOF+04ZLJcwg4B6f29Wt5Hjpu5q5b/Xh3PjD+TOARjGcHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFoB19f4Akk+JZnEfrgBj+HOSpcGvz7+8ETRZITB5NI=;
 b=Uk0zZ3v0MTz6SGLXq4+g/7gYRZnggEOh42qyfgbyUmulLzBzw9eD6Z/akJH61VZoqmQuDz4c8EvLDv/aFHsGBvUvJdfRB3fTWbVFy8G5dLiiVUuNfbTOwtwQHzR4Rh5hzVJoFCHsqrLlGyRDsB8tLj8/+QMXdB+rfcQRMzQaSGV4z3ChoduDCHYWdgzIQ2dpLWPIgE68Wt3xhPyaHYg8oT7oVpHqidLbxscsEgv51GaRSI3AfPfXHXdctlheJGStbmlPdQk9gjkxvFRQ+6y5675oFPSq+uHH4k8fZVS7wCzQO7LcWb9LXbIl79aAVzz21Gd9Oj2wLBJ6N2BBeoyCJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 08:10:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:10:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Nov 2025 17:10:47 +0900
Message-Id: <DE0LXMXWMDNI.WIHMY9TEPRVE@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nicolas.schier@linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] rust: enable slice_flatten feature and provide it
 through an extension trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251104-b4-as-flattened-v2-1-b042d8715a8d@nvidia.com>
 <aQoJUAdFFBpQiEZU@google.com>
In-Reply-To: <aQoJUAdFFBpQiEZU@google.com>
X-ClientProxiedBy: TYCP286CA0297.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 375619a6-1767-40e3-ba9b-08de1c42d53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnhvTWE3VGRsRGVhSFp1THM3LytYMGVEWDNKN0NZNElJSzI0dkZzMUlUK3Qv?=
 =?utf-8?B?Q0RyNkkrN08vMm1mdXlIWHZmSDBTZkwrQmtUa2dOQjlQSllJUGQ5a2FjUmpV?=
 =?utf-8?B?OVdmbEVSMFRkMU5MYnBtcVpCd0xHKzFHVVBGbU92SFlQNXV0bVNhMmZzUVdl?=
 =?utf-8?B?dkpwbUpFVTFWSWJjclRXSGEydjBKc2MwSGVFTXk5amZaRDZFdDNIN2JYcStl?=
 =?utf-8?B?SHpvbHFrSmRwdm9FdUxYNGNZbnFjQWJGV3ZKbCtRNENpVDh6TUViVG82clVC?=
 =?utf-8?B?N2Z5ZGhEdlI2cGN0N2xLeW1lS2FnTDFneUpqMW9Pb1ZGcEZ1cUNrM2VQcXRy?=
 =?utf-8?B?VDBnVVBEdE5VOFZWN2dpL0o1R0FZWEVkWjlESEVpdVA4S3RIUXp4NnJVYjRO?=
 =?utf-8?B?K2p1M2RUcU91Y3RuTFZZRFNxZjNQYTRtbnB0WU51WDIrNjNlS3NiVzl6Q3o2?=
 =?utf-8?B?UzNvUEhLSEdiZVYrdDdnNHN6elUvZW92dUlsWXFZdGViYVFwZWdxZERlcjQ2?=
 =?utf-8?B?TkJPMjRHZGw1WnRyN0wzZVpyNlhPOFcxVWowSzd5WW1LVXlpN2dUS2lZQnQv?=
 =?utf-8?B?a3Z6dXJGWWpwOG1XY2VPbDRVT2ZWMTZKZUtCSjd2d2J5VVRIMDZEKzIwZHBD?=
 =?utf-8?B?azgrRm1sS1BxbW9GYTR3QjNUWXNhSnV0Q0QwTEpoWWRzR1dDTnNiNWl4WHIz?=
 =?utf-8?B?YmNvamdmSjYwRHlhZmZzL1NSbEFLVkZ6eEtPYXovMGlEaVg5YjlncEw0eXZU?=
 =?utf-8?B?dUp5Skg5dXE5SmljYTUvcTN0bGgwZjVLQnpSVDhZZ3BXbjloYjU4NGJDa01p?=
 =?utf-8?B?MldVVVlFazIxUzNoMzR6eE52cjhnZlhrTWpRYjVNQnI2Sy8zeWc4MFpIR0Vv?=
 =?utf-8?B?bVFCa3Uvd3doVUZKNVRrdE9ueFhBMkVkejRWMm1lT1B4UmNlbWh0TzRGQStB?=
 =?utf-8?B?WGFWZjhTZTZyNEtPS1owTnhFVHlBZ3BzY1F6WEptVnl0alk5SHRQdXloNHlG?=
 =?utf-8?B?bHZiWlk3R3FzSlZOVEkzOFNCK1BFZ2dyNjRKeVhweFhjK0lUZG9abnVQZXUr?=
 =?utf-8?B?MmVOeXcxM0xTM1FWTVZ1V0pTcDIybEtsdW42TjUwRHNDd0toZW5Ody9mNHRl?=
 =?utf-8?B?cjQ5d0poYmIrWmdWWlc3UlRKdFFNRDZOY1cvWmJ4M2xhMkUvVEdldEVtd0VS?=
 =?utf-8?B?S0RmY1JpZ2pNcWtZUWZZWmZxdlNIQ2IxQzNmdnJsczRuQ3NPOGE3NTNrTVl5?=
 =?utf-8?B?TWd2bW5VbVRGNWExaSt0cjhrYWFkZnRrOEZhUlFJY29jNzhNQVdWQjhDS1Vl?=
 =?utf-8?B?TEtIYngxUnMwMTdTUjhycjJYNWc3M0YxaHN4djNPaklYWUR3ZG12aG5PS09O?=
 =?utf-8?B?cVkwQWQ3M2V5bWpxWWhEMU1xNUlabEdNdnJ2K3UyeUlCU1lQcVFTYWd0Yng1?=
 =?utf-8?B?TW52azA5eG5jUWFJK3ZkY2xNQ04ydkFQcWhPY0xUajBDeUFMZ3Z6NXJiUWY3?=
 =?utf-8?B?azB3aFpWVUJrOUlqM0JDMGpxTGI0YzIrcjB3ZTZpcmpEK3FqM25vV0hlYVBU?=
 =?utf-8?B?OU9PWlhvbTFvRTJhczJvNVVPMnE2SkNUeU5Kd1VkcGQ5NGo3V0loZTdKdTVh?=
 =?utf-8?B?eGpZWXhyb1ZESVJTcG9yczRvNHR1RjBZalI1VDhReWgzT2FyQ3lxS1JMVnc2?=
 =?utf-8?B?V2plWHB3UFFUVnZFZXdyNkM1YnJiZTFUanlhdWk2TXVHdkpBWlBvS2EvWHNH?=
 =?utf-8?B?MytOT25DZ3lJalVXUGNBSU96SjZYVzl6RzlTUnlRNTVHSnFyenN4a2d3NldI?=
 =?utf-8?B?NUxSS2tPaHppZmVrNFpCZUI0STJORGQwOGs5Nk5QTmtVSUdOaUVEd1FRMkRS?=
 =?utf-8?B?VlViUGQzak9FVWIrcHZQZ3pPWnIyQ1lQOTljanhTSnVZUFozcUhrc0dWd3JU?=
 =?utf-8?B?ejN3NDJxbDVIQ1NqSU4vbnYwUTJ4c3BxTG9CdFM1OUpFUUdMQTBKTXRERnEx?=
 =?utf-8?B?a3pLV0R6WTRRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZmWUt1Z0RmZUFCK0dTYjBHUG8xcTVRU0k3YmFCN1IwZFppZFVLQkJrTlRD?=
 =?utf-8?B?SVh2Q3ZMcCtOTitaMUNmZ1puMGduUldIUnJyVEg3aGxwOXNJbGRaZG9mc3BK?=
 =?utf-8?B?bEs5L05JWVNrMmxmaXc3ZnJDaDA4SmhMRnN5eS9kNHlJenFIVEVSelNHbWd0?=
 =?utf-8?B?UHZRbEJBaytLWGJOM25TZ3ZvenNRVWd6ZjRhbzZHek1sL0NWVlNNNUNGRzds?=
 =?utf-8?B?Z0dQVHV6NHpKczk3ZmozVU9OdGkybTN3L2FadG5kYURIUGFvaG04NU9tbzBE?=
 =?utf-8?B?OXkvTkNQN3h5UjRIcnQ2Q1hFYVlKSnFHVWdzZTRibEFTWjF4RzFkemMvNDky?=
 =?utf-8?B?SFFRWEpSMmE5cmJQQ2xuY3FZdzl4bUlEOWcxRXFrR091QTFUcXBzUU55ZEFL?=
 =?utf-8?B?a210N2VSMEQ5YVVFNG1SVWZWSkw4Y3BITTlJM0lYd2RYSExsUWxnTXl0NUpM?=
 =?utf-8?B?WGtjcTlKVGxMQnVSY0Rxb0hscm5uTEI1UGJrZFVxc1RGcGdOZnJ0YjhXdURw?=
 =?utf-8?B?STh4cGlrTS9ieXdKVzdmck9ZT2tUUk1SYmhZZDU4ZnZhN09EVEFINFVMOEZP?=
 =?utf-8?B?QVhPTm55QXRDeTVhYmxaMWtvQ2FvbnRueTZWdWNGQjdjSmxiNGZRbUhZWUpu?=
 =?utf-8?B?VWNHOVFBT0VRNEU5WUpuZzRScGJMalMyMmFFLy9ZcTN5Nkw1YkNBcDVpa2du?=
 =?utf-8?B?M1NJNXE3NzFUaUpOS1hMcUczRXExMlJUVVc0RUpFdGFSdUIxdUJKS1ppUXQw?=
 =?utf-8?B?SUZML1lZQWIyOXg3czVmU04vSGJIS2lsQ2N6eDBTcGNvTk9IWFlrOHA0NnUz?=
 =?utf-8?B?UlNJM3RUbG9nV0FmUlZNNWJxYUpKSUpTM0xla2RMdFgvVTJJaUF3bWJkSlZj?=
 =?utf-8?B?U1I5dlZiWGsyQTEyZkEzQWVIaDBhRUVoSTBCQzdaeExkOUpWRzd5Y0pjSTh5?=
 =?utf-8?B?NFpjdTdBZVgwNllGLzB3dVhJSURybGNDRHBJNUJibHdsbURxWHltS1hDTGFH?=
 =?utf-8?B?ZmJURk5OZmxaeEFmMGl5d1V1bWZhcDlwTEN2RHQzKzMzcWlsaFlGakQrVGNE?=
 =?utf-8?B?Nm9IZi85cUZ5a2NLYWZlMTFKYm4zaHNQN3p2TnEzYjIwZld4Z1FManlNMVhU?=
 =?utf-8?B?aWRMR3ZyTlVzMnl5NnZsMnZpTVNmbDk1WTAzZnV3RzNCbEV1V2t0Rkp4TEJa?=
 =?utf-8?B?SjlTMXBWWXF3Q2RtRVhjUFd6ZTJVclRUcWxuUS9yM2tjd3NDZEwvK2FDVXJi?=
 =?utf-8?B?NXJoS1ZtSjRpUTVVOURTeUdpOEVGYTRsakU5U3dSRDZMNlQ5eVo3TEI5ZkdJ?=
 =?utf-8?B?MGw1YWt3QmdVSEpRYXk5LzQxRFBVQnFRdURqeHA1VmR2V0d6WlQ5cmp6QjFI?=
 =?utf-8?B?RDEvUGgxL3JhZElCOVRyeDVOdFlCRGFKQWFNWjBER1h6T1hpbGpQZGFYMWV6?=
 =?utf-8?B?aHRxL2h1OGkzMzBkNTI0aUpzRjBlYjZXYzNublF0UjYrYk41TFg4eVpnN1do?=
 =?utf-8?B?M3JxQkJ4OVFrdmd6NGZIU2p1YXE4Um9VV0Fxd2FTcEF0OUJwcWdoenZHanFX?=
 =?utf-8?B?Y0tuTHdRTndoSnJrZWRUcnIzajZVWFdodlJsOXJzQ1c1N2lmOE1NU0VOc2lW?=
 =?utf-8?B?YzlrL0VMcXhSc2s5SEJZOCtRREQvUXVJTmxaRytLSlBSenpZVUU5dHBlQUhI?=
 =?utf-8?B?T3VJRUJBWDJWSjhhZEE5cTZteW9heGVVcmpQaWFQQ0tDcExMOFBhUUxWQ3NP?=
 =?utf-8?B?U2lRbWNScWMxaVJIZ0dIOER0dU1mZlJrVC9JdjhmV1ArWitPR2ZhcTI2cTBQ?=
 =?utf-8?B?VXBjSW93bFZyM25hUW5jRnN5Tks2OG9VdUtURmVCT0tYYXVYSEwyQzF4Yldy?=
 =?utf-8?B?RklkaGlzUEtEclVYT0hqLzZxZ3JXc3lCSDVTd2RMRko2RWJVSzI5K1Z0dnoz?=
 =?utf-8?B?MjNxa20yVVpCSktzWVN5bFRQNnFaYS9EV0JuNGMxMDdscHhEeUVmT0M3RzZK?=
 =?utf-8?B?ekRTeFl3MEpZNVhpSnBJbm5CY2l4bUZQbkhYNnRmcWFLaTNSUVBidHZ1Mzdj?=
 =?utf-8?B?WUYzZWZCeWJZR2xzajhiT01iSWJHUk5VVHRBZDAycGh0bUhwK1d6WlFqUGxP?=
 =?utf-8?B?L0xwMjdabDgvY0RSZ2VtSU9RaHc2ZnJDZjFRc0tCK0MzM05memxreVRVR3Zo?=
 =?utf-8?Q?1w7WM8lBQeaDwEBQWzBbzIe/gK7QrxH56P6wTraCjARq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375619a6-1767-40e3-ba9b-08de1c42d53c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:10:50.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eg9FUp4H160wK0W8Q0q06vtqn4QYyRLRUD8nduSn3zjkyHe9WDEqwmJez04Ov9qR+MmnlhG/4ky7WnEzZVLBjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450

On Tue Nov 4, 2025 at 11:10 PM JST, Alice Ryhl wrote:
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index d0ee33a487be..a84b9e3171a3 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -308,6 +308,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>> =20
>>  # The features in this list are the ones allowed for non-`rust/` code.
>>  #
>> +#   - Stable since Rust 1.80.0: `feature(slice_flatten)`.
>>  #   - Stable since Rust 1.81.0: `feature(lint_reasons)`.
>>  #   - Stable since Rust 1.82.0: `feature(asm_const)`,
>>  #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
>> @@ -317,7 +318,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>>  #
>>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for detai=
ls on
>>  # the unstable features in use.
>> -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint=
_reasons,offset_of_nested,raw_ref_op,used_with_arg
>> +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,lint=
_reasons,offset_of_nested,raw_ref_op,slice_flatten,used_with_arg
>
> You should double-check, but I don't think you need to list it here
> because all uses of the unstable method are under the `rust/` directory.

Confirmed that this is not needed, thank you!

