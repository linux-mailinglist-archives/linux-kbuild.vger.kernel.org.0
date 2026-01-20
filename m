Return-Path: <linux-kbuild+bounces-10698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 65055D3C2F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 10:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2025C4E4922
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 08:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1033BB9F1;
	Tue, 20 Jan 2026 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="arj7/CbH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012066.outbound.protection.outlook.com [40.93.195.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B55F3B8D7C;
	Tue, 20 Jan 2026 08:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768899257; cv=fail; b=a9Bd7FYTgHQPpAfYFga6EsJ3AWemO+/odkhXD0ytU/WpZqtqRgiBAYBxNwWXzOwBLTyVKyr7moCo0y1/NhFQI4gb2+4cB+c/a8gPJZyqSO5It98CU4FKtK/KFC6VlCarhCRPhLuyZu8UxqVWY4oalL1wBtqklwq9ivgdS+PEvgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768899257; c=relaxed/simple;
	bh=0ACpMfmtWSkJxACzdmOMXB3Ow4RY6krC3dqVSp5QfSY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fA+0ud5VRIFMu+2n+VnK85wT0HIEcHPmnE8d+9Ni17PWhIuUYldnYfnSt2XgO5O9Q8w8Fege4S1j03ChQFjKmlvIoBg+Z9Wl3TTEHMtTC2QJbaDJSkzKUBZMh0cPj2ULlvb88QtGOGawm7q9gGrYfXxdhIOUoday61T7aZ9ITeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=arj7/CbH; arc=fail smtp.client-ip=40.93.195.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aD7QwIzzxFM1qU3SxKtKkr007UfjwGH6GDlPwZWrI7zKLneovUwoFs5ThCAHidt7bpAdwp6jVsbUGpfHId7t8C+xIkwv045Ql6fap+fvi9KXuMDBIJ/pYs3ADnPTVFrg1jPY6qHpgLEm9XpPPA2S0EL1vGOod9IAxPkAoCVScetOLIQjLMISqWbHN0JVj4Hgqj7Bm2ms8aURk4a2xi4nHz0XowEtxD+ZJ0TobhGR/O9knCwjBI4ns4G0JSGOukYXgGSlaW5zuvq5RCe1nTPZrwX2oJfgcsFLNmQzhlrpcNt1+C59mhJUOmEjy+1dm6hYKyK+rO+pCxzT3iKUMcRM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yb5OqESLWpVMhQZRw+qrNJtkIeBUQP79XBTc4Kk41ds=;
 b=k00d0VLJxs7cGcWPdWcHaYaVC3ruQSLBQviniS5GhnICaPbAA32oZFHiHkhhCnp+RPBnx8zPWS38GyrUBi4Lg6GwwcjWHX0uJDkWjCJBcfPyhb1ip6nFBVxwTqTJMqf4vJeO820MhZrLq1tT6msnN+Geon+MstDzgNmAQRtukE33nlx1aPepHU0CWqWAn4hY0OV23jDxBm8uNQlysSshm7PODnY3EZo4/JElQnCnXppBh90+8fQrG+SGkzDX2fMB3f6rR0C8Bqq0kzOfaghbS7XOngKhH8KXggxNEOQ9B6XeYJMm/iH3s+wJdK9U2JYLb0jW0EcEnfDDZ1dtX/EKjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yb5OqESLWpVMhQZRw+qrNJtkIeBUQP79XBTc4Kk41ds=;
 b=arj7/CbHrxsCO8lguDTVA8xneyWfLA7XTnkDyzqTSloyA4jtJM8houlN2v357E/+BqyYDKaoJdgnCdZZfjtamyWgOSG5CraEnJDgdudvl7y3fF/HMOX45ljR2Spc/G5Mo1nb46oqEzUeftrsD2h2TUMUjDRetTtPoFCkA8R7UCW+FUYLBin0KwfQelaHkxdp5tb4P+AqFY1hMRp7YvBxK2uDOksmPuWuVyctIOReURFRVTEUNXQFm5FFCdrD/JHz1Hgdnzi461YtaLC8e3jLUEfPXAzanKFrJuTnwRhwFfSyeF4wR1NyJsytvp5P5XsmkbMnPVmw2vwwlCSuZR3dPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 08:54:12 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 08:54:11 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 0/6] scripts: generate_rust_analyzer: improve
 rust-project.json generation
Date: Tue, 20 Jan 2026 17:52:49 +0900
Message-Id: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6DMAwEvxL5XEtJ1ELLVyoOAUzrA9DaAVVC/
 L0WOc5od3ZQEiaFxu0gtLHyMhuEi4P+neYXIQ/GEH2sfAgPlIQj/7Du/Bju11tNVQQbf4RMn6F
 nW1jou1ovFwldUsJ+mSbOjZNVM5ZDexx/zck4QIYAAAA=
X-Change-ID: 20260119-ra-fix-7b0f18457e62
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::12) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a750ca9-085d-4cce-1c2f-08de58017b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTJzZk5oYVlUTUFKbE9zOUYyWWN0OGEzT3gyNmJ6cVZUT09kUU1USGczdm15?=
 =?utf-8?B?UVdFeUVkN2Z4TDJ5M0tQVEF2akxwMkpkZGVsWEhnRjBoVVh5eFZ2emF5ZmtM?=
 =?utf-8?B?VnY2QUpqWlFsSUxDTmg5L0NoUEdEb2tGc1BPUzdYajdyZHRNM0lJNnpacXpj?=
 =?utf-8?B?dVJNc0FvMVNyVmgwYSt0ZXFpTmoxdzhOV3pYNWFtTENiT2dBdTE3cDhFWXZX?=
 =?utf-8?B?YW1URk93bnpwUEYzUGtzU0k1YUJFL0tRM0xsYlFwRGVMWmhZWjlXN2ljeE1M?=
 =?utf-8?B?R25nN3YvZDZqemdQeWxvL0lBVXhoS3QzdWxjaERtcXIwUDQvZlZTeERDRis5?=
 =?utf-8?B?TXBNWnlMM0Q1SlY4cDlmdktJdnkvalJuU3BRckFwZlZmS2xyampNSHBLTkpP?=
 =?utf-8?B?Vmt0VmtSWnh4UUlJUEQ4cTJaUllFM1prSEpGVCtjQldZU1czVEwyL2JLTyt6?=
 =?utf-8?B?eDRNMkxyYWZmRFBHdmlpRDhacldhRFNEb1ZXY2g4dFE3TENJa05QeGJKM0M3?=
 =?utf-8?B?aGdGRWszVzVpc0lBS2l6NFB1MWlpby9BcUdaWCtYSFRzV3hBQ1RGaFpqK21P?=
 =?utf-8?B?Q0F6cDZ5cGNIdHFxOFN2bmFaa1lpTUsvVFExTEJtRWliZlptbmdzWVR4ajdE?=
 =?utf-8?B?aHE2bnNkNFI4cWFZZmRBSHNWMHhoSE9QNmVydDQ1WCt2bDhFYWY3alp5ZlI0?=
 =?utf-8?B?UjZrWk43MHJRdVBEbkV2Qmd1VjNIRXo4YXUvRkVDRSs2WWQrTEtKNExDVUVC?=
 =?utf-8?B?TmNuWUplMW5DSWpEMzN4VjBjcEYrc1ZlbzA4Mm5zcTJNVE0wTk1rVnp3dDRn?=
 =?utf-8?B?ZWFNYTZsM3J1dzBUcE9rUmhPcUdaNEpsTFhSOU55N2RXT3g4c1ppeEFBSUJa?=
 =?utf-8?B?eEZnZ1lHVVpCcEZBTlhRRFU3MnFPRlRmSFJ6M1ZybG1kMVFMbVRpbG9sK2hn?=
 =?utf-8?B?N29BVGZEeTNja1FFa1RkN0pOVTA4M3YwQmlUSHE1NjVUb2p4R2loL3JSdkN6?=
 =?utf-8?B?bWJLZWQ1dkJaT3RHWnhrZ2tVS214WE9MZFUzVVBGS2ZEVnN2N3M2aWlzTG1C?=
 =?utf-8?B?T0ZhdDNTT1FXSXYveWp6MTVKM25QcTI4UUdMV2dyS3UyOFJKaTBLd28vSSs5?=
 =?utf-8?B?OSs5TEhwbzdwU3grNlRvZjU4MkxnWWRwaWEvNElpaGJ3NkJGVGZ0NWZUb0dp?=
 =?utf-8?B?dXR2Z3FSZDVqRDBpSXNuV3krWFJlUUJKZEZVVXRVendzMFlCY0RRM0NQa2Ro?=
 =?utf-8?B?bUxxUmtDNnJ6dlJqNE1kNVU0Qk1ZWW44K1Q5dVdHd2pydkhvdXgyK04rUGli?=
 =?utf-8?B?VDVzaUpkNVBMdTNycXU4d3lnMXhUaXN1TTIzYUxFdndTWm4zakhGeWtJSTA0?=
 =?utf-8?B?c0dxazBVN2NWWXM0YlhYcDYwUXNVRlRBWWk2aDBESU16SFp3ODk3bXN3cGtU?=
 =?utf-8?B?SDlWSEJmNkRsck50dW1mUnUxbFcycUhPTHBRSTFwOG5NRHIvZk1SMWg3WlRp?=
 =?utf-8?B?eFFnQ3NkUWhqSDRmcGg4NjBJUzFnbjRET0dCTEdxMWJnZXlwRFNXbTAvUEVh?=
 =?utf-8?B?L0VPYVBVTHluQ1ZSMjRwbXpBYnorb3MvMndQY0RzNVBJK2NsMlVYdGdQV1pS?=
 =?utf-8?B?MDN6bFBiUXR4Yk9VYkdlNnNLcjdvbythclgzMCtJb0I2QmZsNGJBNWR6UUFL?=
 =?utf-8?B?eTQvY3VpOTkwMkZubFE2OFBHd1UrYUtidjhycWZXbjdiaDduUmJjMU0zMzdH?=
 =?utf-8?B?SmpRV0lDOVE1eHUyK1dPV0VnVTJhME5DdmorY0FrNGEwakMxaGZnZ1RLcEIv?=
 =?utf-8?B?K1lLTy9nWXNrTG1XVGpLMUhJK1pieGw0OW9GdDlSWm05MFJxNVRKRjdYUE96?=
 =?utf-8?B?K2xTOVl2NzA5YXAyQzJ1UjVCTDBuNHNNZmdRd2JyVXd2MGRCWVBlbTNWaFRz?=
 =?utf-8?B?S0FDNzdJSjZCbXpvaExKZXFQOEplZWpoWDBNZXBMTXFYODV6d1M5dlJzbzQ2?=
 =?utf-8?B?MjYzVmdvaGFTOG1jcEpVOWJMOFF0M1ZtbjlCWStzRXNlTy9XY081Uml0UE5L?=
 =?utf-8?B?OGs5VldyUGFMLzRxTEN4WGNDaEJwS2FhWFZHK3Jsbm9KekFkc2JvL3VjSlUv?=
 =?utf-8?B?WGwxL0NBMEFKbytNR1lPcStza1RMNUU4SFFQMm9TUGpYMU96NDdtdGdJMGR5?=
 =?utf-8?B?T2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDl6MEI2dXBlNW9BQ0Y4UUVCekcxeTVVV3MxR3RSYjVnTG42VjhtdnhzTDRx?=
 =?utf-8?B?UGFoZDFvUUJ0U28wKzd1aStYZFhkcmRrdEtJbWQraG9PSUlRc1FFUnJYM0p4?=
 =?utf-8?B?S241MHBURExLZWY0RjRUak04Y0thM3pvcXZaOTdhMHJTT3FHcXcwU0sxMmdl?=
 =?utf-8?B?YzN0QU9oQWZ0bnFLWldsWlB6clU2TmZxdHRrd1Jzd2VIcXJEc1EvYktJbVlE?=
 =?utf-8?B?TndPRzRFTTBxOVFtcDJ1ZzY0MkhNUVdjcU1ZY1FHOTh3THR1Y3hsYjZUZ0dF?=
 =?utf-8?B?dUJGYWFXTnJjdjVaZU56Q0hCT2lveWU5b3lVeENIY2k0aE5hOFVZZHZwQmk1?=
 =?utf-8?B?eHk3NXhZV2xNNytDMFY5NFBnUlNyR3dURVQxMUdobzFidFVWbHJEYjBTL2pL?=
 =?utf-8?B?cm9HTisxWXdzMWw4cnhaV2ViY1N2SjZvWEYrU3owRGI1K3lzQnBHUFg1M2Nz?=
 =?utf-8?B?eE90R0lmMUNLVmxtenlOQUhGMzUxNjczcEppS05wQ2p0MmJLR3FZN1lnb2NY?=
 =?utf-8?B?QVF3Y3VYS0pLM0x5WDB2Q2JETWJzd0xlTWk0dkt0a2o1VXNqV0VWTDBLTHpZ?=
 =?utf-8?B?aThMdS9icEg0ZGE2dVV6OVhqQS95SzBlWDhURTJtbVlrUytaWDdNZ1E2REpk?=
 =?utf-8?B?MlFTa0RPVjdGZHRKWjZ0YXQwbE15blZteGFNWUF1VlZLcnZBVXlGN25sK29C?=
 =?utf-8?B?UW5SUm8xcStMOFk4L0g4dll6TW9hQWx0WFZKUzNFNERIRGxGa1B0dUxBb3Bu?=
 =?utf-8?B?ZGZtOEMvaTdWaXU4YXhleU1WeGs5elBOUEFNU0kzYlN0VkRSdGF5NExsM2Jw?=
 =?utf-8?B?S1lFZVlyWndsMkRIN1R1ek15Und1VW9WUVVBcDZTeHI4akVhT29mck5iaEgw?=
 =?utf-8?B?TkVPUisrSysrZWFnWnFGOUV3djJFZjh5RXl5cHZKR3lkMDVhSEJWVjRnSG9F?=
 =?utf-8?B?NExzS28vTVRueHA5SmNLUGhZQVpRSXJPTWhkTFVzK1dFUjRjdmdxUGx2L3BC?=
 =?utf-8?B?SDJ4VHFrN2RhNVV6QWpnaHJ0NktkY2ZzMVRVZEpKTDJxaHhnWUtLQjZTZ0pT?=
 =?utf-8?B?d1hmRitRZ3g1ZW1XanhYNXhZQnJnblA5bk1GcHRQNHJER3VneDY2NEZVdDJy?=
 =?utf-8?B?Mm5iUU9yQnFWSHRna2JRamZnMGJHVllIbFZtKy92OFNvWTRvN2xGRXcrV0di?=
 =?utf-8?B?enF5NzVxcFQ3bVBZblppTm04aEpWckZoR1BONzBqNGRHU2x2TUVZeTZ1TjJl?=
 =?utf-8?B?eWhYT3BLREY4SU5mSEY3bG1UdjhnckVnQlJDWW5uQXRHVDdjUC94WlBYbE1W?=
 =?utf-8?B?TndQb0xxMkp0Tnd6SU12d2pmeVR3cmY5ajJnNmcvNkpvNExLc1EyZDg3YXh4?=
 =?utf-8?B?VU1USmkwU2xjbTVURHhkejduV2lmZ3NVRWVrM0VQN2RHTVJDUWRNMmxZZ0tw?=
 =?utf-8?B?SGJxWXgvbzhSL3JBaGdOZHV0SFVUM1hGWVZ6MFFFU0tLUGJ1aXNMdlhkS0t5?=
 =?utf-8?B?VVE5QWgxTFhnWFJDY0dTWlc1c0ZkZVMrT01FYmVWTVB0RElYd3FablF5dUxD?=
 =?utf-8?B?QzJHcUZ0VEUzdXpPMzF1US8wTDQzNkVHZEd5WHdMaGhLbE5VSEt4eGh5bElw?=
 =?utf-8?B?L2ZSZ09oSk15bnorLzRLYmdOa1YrbE5pUHRoUWY1dnk0cVphNTJXR3pyU2JQ?=
 =?utf-8?B?azlYYTFSbmZ4SHJ2eUgxdzdUcE1za3dra3VYOFIyZTlBRG85QmRMbTlHWFAz?=
 =?utf-8?B?OFZOY2Z5ODNqZ2NYanh4bytCQkRORFhwa1QzcUtPQnQ1UnRUR2FMWmR3cHdC?=
 =?utf-8?B?RkVCQ0I5Smp6THF4VUg5ekYvQnJpMjlZQ2xkZVBvbGppK3FnU1ppT0cyZ3k5?=
 =?utf-8?B?dGxhbnpuOFZieTcxSUZKdFdqRXVqTFdKKzRyWFFYTjVPZTdoVWJHWmsxT1d0?=
 =?utf-8?B?LzUwSGN3YW1DblJCN2pSZ1VTSitFd2w4ZzBSR1JDRHBpNk1DOHJJTld0V2Vn?=
 =?utf-8?B?V2pMUjkzNEtTNnl6b2ExVkVuVVU1ZnhpdmhyM09nWWR0T1Evck1wdHYwcnNk?=
 =?utf-8?B?ZEtVZ1BBSUtoR1NxZHJMWThiclpjTnV0bEwwWlh6UUtvZUplNDNLVWlUMGhK?=
 =?utf-8?B?YVhwTDJjMjgxcnVzWVdjcW9qZ2FNQWpNVFVkeiswc3QrMTNyd09yRExhaEV1?=
 =?utf-8?B?eW8zSWZEdDBCQy9sOUJBOG1JOURPR1V0UzRJc1hyU0h3T3FIMFYyVGh4RDBJ?=
 =?utf-8?B?RjNYdkJyVW9BSjVzOUx3Q2tPOWZBWDV2M3grN3ZvV0dxay9tb2pFUFpuWk1E?=
 =?utf-8?B?MlJWNDhmc2R5a2tNeEJieVArclY3U3VMUWxiSnBNekxLdVFLVWhmWmsrQytE?=
 =?utf-8?Q?KH7idRfRXPO/23QVNKdJmiL/VDMZze3ye9Cx4Shu7a63r?=
X-MS-Exchange-AntiSpam-MessageData-1: 7+VanB6vccHIEg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a750ca9-085d-4cce-1c2f-08de58017b26
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 08:54:11.8463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkckFm7WPtpGk40PychrJaRH16UG8EudxEH6CWY4LstHIoFZMny554775bEIbdI8p/3lTwDs2lK08WRw5MNG7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

This series improves rust-analyzer rust-project.json generation by:

- Adding missing dependencies to driver crates
- Plumbing per-crate editions via command line (core: 2024/2021, quote: 2018)
- Plumbing per-crate crate-attrs for host crates
- Plumbing common crate-attrs for non-host crates (no_std, feature flags)
- Migrating sysroot crates to sysroot_project

This fixes a bunch of errors when using rust-analyzer caused by sysroot
crates not being properly processed.

For example, some sysroot crates try to load paths outside of
themselves, using directives like "`#[path =
"../../portable-simd/crates/core_simd/src/mod.rs"]`". The current
structure of rust-project.json has sysroot crates put in with the driver
and kernel crates. But rust-analyzer doesn't let crates access files
outside of themselves unless they are sysroot crates (there is special
handling for this in rust-analyzer). For this to work the sysroot has to
be specified via either sysroot_src or the new sysroot_project
attribute. It's also possible to specify "include_dirs" to allow this
but it makes sense to specify sysroot crates in the intended way.

This patch series uses the following new rust-analyzer features:
  - crate_attrs: added in v0.3.2727 (~rust-analyzer 1.94.0)
  - sysroot_project: added in v0.3.2328 (~rust-analyzer 1.87.0)

Both features are silently ignored by older rust-analyzer versions,
so this remains backwards compatible. For older versions, sysroot
is loaded via sysroot_src as before. This may be simpler than version
detecting rust-analyzer and changing behaviour based on that.

I measured how many compile errors rust-analyzer reports using
`rust-analyzer diagnostics . | grep RustcHardError | wc -l`. Since we
know the code compiles this is a rough indication of how incorrect
the rust-project.json setup is compared to the actual build environment.

Error reduction (RustcHardError count):
  rust-analyzer 1.78.0:  6127 before patches -> 519 after
  rust-analyzer 0.3.2753: 1742 before patches -> 65 after

I also observed no rust-analyzer errors on nova-core after this series.

There is some overlap between this patch series and ones already sent
but not applied, but it's unclear to me what the status of those are.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Eliot Courtney (6):
      scripts: generate_rust_analyzer: rename cfg to generated_cfg
      scripts: generate_rust_analyzer: plumb editions via command line
      scripts: generate_rust_analyzer: plumb crate-attrs
      scripts: generate_rust_analyzer: plumb common crate-attrs for non-host crates
      scripts: generate_rust_analyzer: add pin_init to driver crate deps
      scripts: generate_rust_analyzer: move sysroot crates to sysroot_project

 rust/Makefile                     |  16 +++-
 scripts/Makefile.build            |  14 +--
 scripts/Makefile.rust             |  20 +++++
 scripts/generate_rust_analyzer.py | 181 ++++++++++++++++++++++++--------------
 4 files changed, 147 insertions(+), 84 deletions(-)
---
base-commit: 2af6ad09fc7dfe9b3610100983cccf16998bf34d
change-id: 20260119-ra-fix-7b0f18457e62

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>


