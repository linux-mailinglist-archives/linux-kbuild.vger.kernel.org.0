Return-Path: <linux-kbuild+bounces-13404-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBkMOMq2GWpByggAu9opvQ
	(envelope-from <linux-kbuild+bounces-13404-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:54:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0F6051CC
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 17:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C241933841B0
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 15:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64B13ED11A;
	Fri, 29 May 2026 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VADusbzU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D743EBF24;
	Fri, 29 May 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068496; cv=fail; b=R30BSdgFA9qSsKAqG1LC2G7u4MfgrJuaFElcyoJr00lLuyrBDQVkkEooOeoGW4czE4kqqTnrYGVVzSvai0tt4cibFjXOSggIq7cTQ3pGTZQFyeKU6hn5Ad97wgmeKbvUkUgqURQ6Dm3KRNGW/vpjGFo60DtlFkp5lQYWGVnFLC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068496; c=relaxed/simple;
	bh=kJvs/Y7RUL83A0o09UVK6kJwjCDPnn0F4V/85uyyvfE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=CKVnNFF6UHyVTQ3c8N4osctrlKWlawP+HI4HXKtjOG2WglS7r1iOr5hVpqt0bmjC4NV01RX6+b6nIpMpQzKB4eLaoyKnkC9Hs4P7tOpxFozokPNqia55jTWE6B/bvtCJ5mgyW6TBI06yJtJ5F0x/HrsmSotuygkdc63gfx3PVhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VADusbzU; arc=fail smtp.client-ip=52.101.193.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JemiCtjHF7BpkStr8PNnzzyj/HmpPgWrC5u7bZV5zJ0kRWcwvZ6mlTOY3DOD2Q895Yb5NPzWlM6ZlV0JOLVRj53K9c20hHmcVtE6lQ+63mald7MIKtHyP7v8+DQo98KvMCFeLqaoZcXSosmNFerZjO9hchwzoJlPah49gGqtFKTeqSJafvZPg3ZrnGlZsoQ+UF0Qneql6xowndYm5a4UcwCLka+tokwmAR51C/zTbpV1ZVFLcMRV8I0PCpLfWaydmwtDwguLwpXMFgLLsIdu+hsyd0sjOKaF8N1gsVSR40zS4lkLaE25EVOk5Ug9iIErRxrrca8h0LSzHDdgTuxfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktc/68Z8EATZl4zwX+Coobvoyc+/721qXGWfdxTlLYo=;
 b=hfFwvZ/HePgTh7EPMOUbAiEkMv2SF7HhIOMj2PpQPZCD29WeQX0ciNdJs1sLhY3nCE9XfHCmGzJVjhG880Sh2SeWKbpF4E0AC/iSbVHMn7uryVRF5VFf1eLo0JxkTglYDRFsk7xCxVKE9v65dG3XAhxganwpilw0xPWa3DisYeLX/95Kj1YuIM9+55e/Vtre1qYpRZLLg43dgfIEcWPq2l1iK6eg8EXtQEVHGwDPqdZ6H9uLUpt3xSzuBza0h0gpe53MdJTJr/4PQCKyZxyEkv32+ETNzpKtbQwzSBxTTfZ+gFT8ZWtenQ3db34G6qsS9wid3e68do/BNSHN8O9o3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktc/68Z8EATZl4zwX+Coobvoyc+/721qXGWfdxTlLYo=;
 b=VADusbzUsej2JPuIFK1wwo6ZPfX0L4PcMRPRLddeV0SBS28tY+urxuNvMpRe5FUaIZ/K4lXNUUbG8XCMs6PgmUf7OJdDcOyw4odmdzzz19Ng+mWSGTc5NoeR7DRBJ5iCPlbT5zJ2rTdWmpnt3gqdcTKAummgUXEckVOr6tmHUxsxeh5DU7csbGbBjV28+s4TN9wLLRBKMO6ZjOwPxYGwaGMKGQfVCiY1h8JFNEbuPFgTo2YySEpTHYSeCHIB+ZYXJsRLTQl0O41+NKE4VHxWQVbw08/ChIwA5cZVx0VGmzm23kEqK2aOraGn4fLbw8w997eqcwogjiFmAd6qxq9lgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 15:28:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 15:28:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
Date: Sat, 30 May 2026 00:27:40 +0900
Message-Id: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ7CIBQFr9KwFkOhUOvKexgXFH7tN7E0UElN0
 7sLdWE0cTnJm3kLCeARAjkWC/EQMaAbEohdQUyvhytQtIkJZ1yxSjA6uKgpzKPzU6CS8a5plJF
 atyQpo4cO5y13vrw5PNobmCk38qLHMDn/3P5imXd/0rGkjNZGi1KpCpqDOA0RLeq9cXeS25F/b
 MnrH5snmykLlZFSWSm/7HVdX13NbMn5AAAA
X-Change-ID: 20260430-nova-exports-502f996c5aab
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCPR01CA0101.jpnprd01.prod.outlook.com
 (2603:1096:405:4::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d9d69b-15c0-4e19-6a5b-08debd96e08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|18002099003|56012099006|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	08ig4DfqcwmrT5H6s8gkpUvFNdI3OhG895L1oshYSUdseWIkHOK9e8HclSxgoh5XqTR4muguYNnFrKBCB2jt+dbHhLaHQh+Z9qem7y9OIVEvLTxr/SY8yMcu0p8IGA25Qo2tD5WhCPqY9T6/d7WxZrtfVQfyfUxs96CofXWTu7Z7z7+fHQqeVRlSPcFaMZl36MV/F6a2puUSw1tj9U55LR6DuP3Q1mqnJMUmCilfpCNcOhDcLnCo+UoQ6EdtPTCOLFfTtE7icQ8YVTVjyt61KorLRkI5+OA/bxzVzzmjLmuvgFKOc3/r5ldCSYZOMRodez50Jbo8juXK1tXdq1F9Sh8bER/9vulnmjNz1K8BR5sAXc4dkW/8RNmjqsx6KY82ffadseAieHBD2eRMsyLcC0CTIQfChyPfbS5ydfE/3KSfqGInc+oIhzi/P0niRMCHOTP8iBJgXludvLF4GeBzsfqaPvHKjxxA0TCqVJr3axx4jxSBIfZr++hy3WFXR+wNEOw9ASV57dUDM1yQOWY/+pBRtUeHbjy4/UzOqQ1+9hU7zYAc2cc0L/wSCa1NH2XbAwvVzwkM2dlW1B7IC1zmgP4zfFlUsqJ2saS7Um2KFJCIvVllzxoOzb2pviVIy/+Cvh5AqS5KLiD3jPVj00/UH5knMShJXLZg4AKwRqikQ1FdS/kNrzL53SjyslJGSvTdvGoe88kJrCAypc3PmJMRRNc1DCgR4jwy9EFkpwb47NcSUF7Uc+rlx5dYwS5QLh4x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(18002099003)(56012099006)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGdOd0ZkekxXUEkvUndJbmF6Y21LRzUwYnovWmlOL2F4aUFMNGxCd2ZqWmg5?=
 =?utf-8?B?K01RMUNKOW5sQjRPTEhHWlVya2tZRjBMYUlmOURiRDd4NDB4NDZPbHZuVjlH?=
 =?utf-8?B?S3FZclU0VUk4akV6OFQzYlA1SHNGR09IZWpDOHJKL0tIMzJnTXNwNG5na3NZ?=
 =?utf-8?B?SmNvSnZCNlJvSEJhY1RkdGVVTkNOeXJ5SWtkR0dFdlY4ZkZLQnU3ZUZZK3I0?=
 =?utf-8?B?VG9PMWlZZVNvVmpMKzhjTE1WUTlFVFBkWitEb1F3TTRWT0I3NjdrWnhhbjAy?=
 =?utf-8?B?SFVyL0lCMzN1QjRUUGNMY25CeU84U3ltSitBZkl1M3RYbzd4VndNYlpBd3U5?=
 =?utf-8?B?VGUvSmRZdlo3K0pEOWM3OGlvT0R1WWRjN0RxTU5iYWpvZlV4MGZyUS9rbTlW?=
 =?utf-8?B?Y2ZsdE41U0xaNmIwSC9UalBRUS81azJSNmFtbmY2NE9IN0xHQzBVRTRrNStx?=
 =?utf-8?B?ZmhEdEF5bDRUeWN6Yks4N1hOV3kzcDNXNjFUcWhsK2FCWHFpMytNVDhJRGZy?=
 =?utf-8?B?TGNleHc1bFRhZTM5dkFpOWNQc2JzbWFxZndtOGtOMkYyaWpNWVJaeDQxUnd6?=
 =?utf-8?B?VVN4VFNVVnp3V2I0a1RMWW5kYkZyVk1nak5zU2xaM1IxeVpNRFc1d1FHL0U1?=
 =?utf-8?B?NS9ZRlZrKzlUNEMwRnFKRWNGRHFEVUVva3FmNXZWeWVsb1pRTi9XT1hwc3Fh?=
 =?utf-8?B?eXNRaERoUVZ6Ymh1Rjg1M2twK01NZ2J1MDJGTVVPK2pqS0NDMnR6RlgrbE5T?=
 =?utf-8?B?VUQ0d0c3S0QrK0NJZzZjMXN5aTUvMVZrRW85ZWNpRTducVkxbmJHUEowUVh5?=
 =?utf-8?B?dlc2Q2VDcTk4QkphazB6eUdMMjZJMXRNTG1jcE1xNHFiRVNRMzd4aEVWaVJV?=
 =?utf-8?B?eVQwYTRibnJ4WVhVRXgreVA1STVhZXo1S21Sb1NXR01qYXhCZDViZlZVTitJ?=
 =?utf-8?B?cEM2VE5tdEx1SGRWTm9mc1VOR3ZjWFpCL1NCVzRtMVloWEprb01ZUlJabmFE?=
 =?utf-8?B?UUlTZG5aNzZaQXpMc1hIMDNrcnd1ZzhZdmlGV1FnQ0hyd3ZVazhNdG1DWW5H?=
 =?utf-8?B?TEFOVUdyRVRLYXNEK1JzclhTdDBHVTJFMHpOTmdoL1M5ZFV0cSt1bkdGcVNh?=
 =?utf-8?B?NEFqZ2JBMmc5N2tta2hEdGZld0tISTZiQ2twTHhaaVVzUk5oUExkSjltczhW?=
 =?utf-8?B?SnI2dkRsQzZZNDA4Wnc2a2Q4cDNSQitxRG1UV1pPU2htWnA3LzVHQ2dJOCtJ?=
 =?utf-8?B?UGZFN1d1Q0dmUmRxSG42aGRvM3Q4cC8vV3ROVFByaTNhU3U5aWh1VHlLTWZV?=
 =?utf-8?B?SEMwRkUwdVpmLzA1K1lERG5PU2dnNS9SL1pJS0lBd1JuMXRkZVU5SXZaVDFx?=
 =?utf-8?B?OE5aUW5aT0V5RlB0L1lYYmxkZkJxeitXeEtnb2YyS2dBR0ZQMUFyMW9XU21n?=
 =?utf-8?B?VmRkOElDVFRwME1abmR2OS9RRW9OMzRQZVFvN3g0a0xTZDE2eGt0cjBQU2h6?=
 =?utf-8?B?STFwUTFmTlA5N09xckFTcFhVa1Vva3UyR01IZzhXdEVhUWZ4LzRSN2xUb252?=
 =?utf-8?B?djBqWWc4UFVEdk1uZmNnY3JSQmh4dHJheUlMN3RDVTRCUmM2T0xWMXNneTdm?=
 =?utf-8?B?S3FiT3dWRElHZ015VEFjMHJGMFV4MXNWM0VrVWpvNWx0cVVpcS8vMnh1OTZV?=
 =?utf-8?B?U0tIek95T0hLQytmQUIzVHJDanpkTWRjMFdoT1habUltZ0I1WURGWkRvVlMr?=
 =?utf-8?B?S3Q5amo5a3NmdWw3bVdNeGRxNjJYdVd2M2tlanFBVTJVeXBjU0Y4R0xLRHhQ?=
 =?utf-8?B?RW5qcGx0ZzZEc2cxVU1saUZwbW5tODJhQWpTVlQzYWF0b0dUSzdpendFSEF2?=
 =?utf-8?B?cEJrYTJPTjVGZmZkTUFEQUtzcmhhbTZtQTZoR3FzSmFVWU9zTUw2UnV3cXZI?=
 =?utf-8?B?dVpQWEs2NnN4bkVDUEkvcXpnN2lPN1pQSGFFYmRPR2RnZjNxVXZjV0c0d1E2?=
 =?utf-8?B?ZGswa0pZM3BLaW9PQ2pwd0EvZmZGMGM4SUpWYVBORDFDeXVqdlV5d3JYMXQ3?=
 =?utf-8?B?SXFHUFNwRTdMWENBTEM3RWFtakxrWkI1Y001QXhOQkg4Ui85a3UvbkRSVUV1?=
 =?utf-8?B?UGZnVU4wamlxOWc3TXY2WWxPNWRFUUxlMU9tV3dpRnhkdG1MUXBPRXhxZXRL?=
 =?utf-8?B?OTRYUmM2dkZqYjJaSUlSaG5vQ1FZU1lOOFc4WnpLZ2pPLzAxR2V4ak9IY29p?=
 =?utf-8?B?VlZ3Vis4aDZRZ2hNSFdnZW1LbUNKVGZYQ3NzaFQ1T0xqSGQ5dGhzdU9LSnRp?=
 =?utf-8?B?Y2UrcDZvc0NtSmhhSkxkYmg2dDRHYys3bXJ5SzhxWEg5alBibytBL2lWUXIr?=
 =?utf-8?Q?3zZEvVuRJ5znxcHLVeqsxWw+RNvi7yvp+wLc8gHcwUSC9?=
X-MS-Exchange-AntiSpam-MessageData-1: 6uqFiRx2H+pJNg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d9d69b-15c0-4e19-6a5b-08debd96e08b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:28:04.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdfvWCxbCB6Rxh4gT0zQhgT4IwyI8+Pi8yUt5XBR6mNAV54kg+DnQSUmCuEhWVrSM00qN5tecsM98OxfFziQUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-13404-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 49A0F6051CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

`nova-drm` is scheduled to expose a user-space API to receive IOCTLs
from user-mode drivers, and to call into `nova-core` to perform the
actual work. We are about to reach the state where we need the ability
to call into `nova-core`, but the current Rust build system does not
support this, and the solution will likely take at least a couple of
cycles to be merged.

In the meantime, this series introduces a Nova-local workaround for
`nova-drm` to call into `nova-core`. It generates the `nova-core`
metadata that `nova-drm` can use to resolve references at build-time,
and also builds a list of exported symbols for symbol resolution when
modules are loaded.

Since Rust symbols are long, this work ran into the limits on symbol
sizes `modpost` can handle. Thus, the first patch instructs the compiler
to inline initializers for some Rust basic types to avoid those long
symbol names when symbols from `nova-core` are exported. Interestingly,
this also results in a smaller nova-core binary size [1].

The rest of the patches enable inter-module calls from nova-drm to
nova-core.

This series is based on `drm-rust-next`.

[1] https://lore.kernel.org/all/DIN76NTFEU1N.1RT6G4IFD62RG@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Drop the modpost overflow detection patch as it is to be merged
  through the KBuild tree.
- Drop obsolete (and actually unnecessary) changes to `pin_init`.
- Do not inline methods returning `impl PinInit` as they cannot
  contribute to the long symbol names problem.
- Use `#[inline]` instead of `#[inline(always)]` for methods that could
  create excessively long symbols.
- Link to v2: https://patch.msgid.link/20260527-nova-exports-v2-0-06de4c556d55@nvidia.com

Changes in v2:
- Rebase on top of HRT v5.
- Inline some `pin_init` and Rust basic types methods to avoid long
  symbol names and optimize code.
- Print truncating modpost symbols and abort upon meeting them.
- Drop increase of `buf_printf`'s buffer.
- Drop obsolete nova-core renaming patch.
- Link to v1: https://patch.msgid.link/20260430-nova-exports-v1-0-7ca31664e983@nvidia.com

---
Alexandre Courbot (5):
      rust: inline some init methods
      gpu: nova-core: export Rust symbols for dependent modules
      gpu: nova-core: emit Rust metadata for dependent modules
      gpu: drm: nova: build after nova-core metadata
      [POC] drm: nova: demonstrate interaction with nova-core

 drivers/gpu/drm/nova/Makefile             | 15 ++++++++
 drivers/gpu/drm/nova/driver.rs            |  9 ++++-
 drivers/gpu/nova-core/Makefile            | 48 ++++++++++++++++++++++++-
 drivers/gpu/nova-core/driver.rs           | 59 +++++++++++++++++++++++--------
 drivers/gpu/nova-core/gpu.rs              |  9 +++--
 drivers/gpu/nova-core/nova_core.rs        |  4 +--
 drivers/gpu/nova-core/nova_core_exports.c | 13 +++++++
 rust/kernel/alloc/kbox.rs                 |  2 ++
 rust/kernel/init.rs                       |  1 +
 rust/kernel/sync/arc.rs                   |  2 ++
 10 files changed, 141 insertions(+), 21 deletions(-)
---
base-commit: 0e42ec83d46ab8877d38d37493328ed7d1a24de8
change-id: 20260430-nova-exports-502f996c5aab

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>


