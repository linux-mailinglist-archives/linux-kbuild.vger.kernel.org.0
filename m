Return-Path: <linux-kbuild+bounces-9531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA4C48FF9
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596CC3ABE2D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 19:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DD9331A6D;
	Mon, 10 Nov 2025 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DMyF6RZp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010071.outbound.protection.outlook.com [52.101.193.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800B330B38;
	Mon, 10 Nov 2025 19:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802292; cv=fail; b=nEZylV98eXOUOUqJXP4AsPxGtStbEJDDY/WLUyZbSLTFxrc0sBn5xcyf3Ih5HxONXYg3BC0yo3S9W599meRo1hPYOVJ3ZamXmZUFOPEiRaxWYKIS8WhR//OMXq7nFriCy2pxMWM9KHns7QcU+f1DBOmV6moca47qQtenxqk+5D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802292; c=relaxed/simple;
	bh=EvabUf+eB9ZUMWsHejhaonhw52sB6wvhR9TBtKnOSao=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cjRLnYSSTzocI7ubvGB9M/xSSWNIEChEeAinORkPwVebgzR/2CeYnRhTTIkf43PkDtj4uhRim0fDfxANFTnX8/T35zFBVQ+krOclopV82fUeEL2VV0KA5wpiP55zvjjwCbgL4lPM0IEtGdOdZuAmHkNO8fwmP2Q4bnLYi7frG6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DMyF6RZp; arc=fail smtp.client-ip=52.101.193.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1Qogt/w6cKQLcQyVE+Lo8W059+fkxwUGDduWCDiZTbIXM2M4JXgMu8nu2u7r8H7ZeVwkLsHOdhD80QUcKrqx4s2Y+Nlb6msiKg8kjoL5TkGamFcHZX/xN5Fek5cnneXa+bK64QHTg0SrWTh4B3O6/+0ZxDF+Sa+JDQrmC9UKqD/zV6jRF5NOKTcVbQTUe69g9s+E4NquX3IZmzcmgcb29OjXuDeVt6osNLqaLwyHnNSYQNQiIWOkv/NcklBPmsmnaBoz3vERpB90ZmhTa/wVm0/M1h4Txx5AZA3Z4iSKZzCDtMwOaaCpoEA8iqx61ymwVzEg3i//OAIZI1tcyg57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+7mfAO4mbN4dz+F4K6tdoFe5kniXjmKSeldfgNlPZE=;
 b=o2ZZSt7Rx+b8dci/VGucb2x0djNyZo3huUHTvqYNFcp0w8ESsPNV0mF7iCc9DlkiAv867JRm2nsNSSSTcUS7BCzP1NCO9YWnsYrfQ6Ew3V3SnExTGdVTISOR878N/FlX2FhdFMELirnMnRu3G4MR+lPEYpyV5XAnIEvLTiMEEK31LLPfraClFOueLfVGAhbXFrAnegAQB7N+OFx+fD2jSyVJQssoRBlJwtu2/wyCgtacBeEwPLk3VFBxTy3nH3U38VtIhl+A9b/JqtnwzzpKfRX6AB1DUZjxB9K6dlv86LGPYxL0jd78LzkobcvfgL1bBOatkysrnYBMoeuEYeAP3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+7mfAO4mbN4dz+F4K6tdoFe5kniXjmKSeldfgNlPZE=;
 b=DMyF6RZp2bEixnbWtDeuatld3hecngIODnai0ZGu6sW5uQHlC7XIu3xM2MipqUtqn8ZUBDCwB/yCv7H3ESZ0gHe9WJVs6ZOf4f6vT164o+rnvGA9mJyvsUy5VVU1m1EsaGGtj/H/kKdmSpSiAiCOcwTW839JOObqw61f4TKkAsWYXq+pUkuHQaxeT1RwtSIY5+hEuCmKuMifWBb3Bi/HDTCQvbxsHH2jyiDnJO8ONHy4j7HK6aAQI2x2KQQbi/PRGEHbTqQrvCJs9LEl8xq7Tt9gwrm5UVXnhJFfe6FPemp7MV8BGZxtqCNYk/Cdfv7lClEFiuoxyOMnjKtAu052Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB8786.namprd12.prod.outlook.com (2603:10b6:8:149::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 19:18:06 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:18:06 +0000
Message-ID: <8e58087b-17e6-4362-93f9-f9aaac6c4476@nvidia.com>
Date: Mon, 10 Nov 2025 11:18:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and
 `core-skip_flags`
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <20251110095025.1475896-1-ojeda@kernel.org>
 <20251110095025.1475896-3-ojeda@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251110095025.1475896-3-ojeda@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::39) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ee168b-241f-4fe1-ad68-08de208de057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDdkNU0vaWM3cWVROFVEUnc5eEIzMkRwMXZOVk9vYjVMelpSUm01aVp1RkRC?=
 =?utf-8?B?TitYNEJYSVk4WWk3UU03aytFUDdwSU40ZzZOeGVubkFvRyt5c3dnanIvc09I?=
 =?utf-8?B?UEJVTGpxRW9ESmY3cjdFUndaOVJ1YmtKRDJJaG14d2psMTVnZ1AweVpmdEQx?=
 =?utf-8?B?Y3lEREMra1hqM3BFWDRBbVM2WDdjc0RiWGRuTHcreEZqRndNdWltM25TeUE2?=
 =?utf-8?B?d3lhb0pnOGpnckVvVUZzT3d2R0h6V1RHdW1iRGViTnM5Zi9ESEVzSkVpdUpG?=
 =?utf-8?B?YUhBcEQzZEJ0NnlYY3VXOGRHMmRBN1E0M05yb2RVbUdGQmFmSjd6M0JCNmZF?=
 =?utf-8?B?cUpGY2w0WHFJUDBDWTBZUG9FaHMrT0ViNnNJbWt0Qkx6VUZXbU51d0x0VlVY?=
 =?utf-8?B?Y0Zud0ZhN2N0MFVwam04Wkd1cGYzMVdUUjZEd1ZrbHEzKzE2YW5WM1pldHU3?=
 =?utf-8?B?YytwV29LV29iR20wMUxFc0tYRFhDM3VsUDhBUTc0MU4yOEg4K2Myd0ZaOXZ3?=
 =?utf-8?B?aVJBdVVDNTRETVZQMGMyNXIxYnJRUnpJcmNQTjdQb2JxcXBoRmZYekZqYU1L?=
 =?utf-8?B?RzkzRnNLdjVGeGxURXRHZWJEK3BwUUhoVHNIZlI1OU16U1NPejF5eWh1RXZ2?=
 =?utf-8?B?VklCSENuZHo1VVFjd09MMldoMVFHRGdGVE1IQ055aFhUUFJHc3NhZTIvL2tZ?=
 =?utf-8?B?ZUJXeEpYdEdMc3ZJZmlWR3Q5OUlsNVlvaFBBd2QrVko3UlZHenNjS3oySnh1?=
 =?utf-8?B?OFBsZnhHaXJOK09McU5Uc05QTDdUdThKTzZuM21mMXIrODZyakdWeUxoL1ZN?=
 =?utf-8?B?eDhnRzU5WEtsdEV6M2ZvNFZvcFRxYVFhV2U1WW55OFNBeExwYy9qTkN5MTl4?=
 =?utf-8?B?TWhUb2Fxd3VzcHExZjh4R3pwdGYzRWt3RGpXcVZSSjVjTjBpd1hhcE0zSEtY?=
 =?utf-8?B?d282eUh6amFaMWtRU01IZmxneHNuaWJXMGs3MENEMjJ0aEplNlh3cFV5ajhr?=
 =?utf-8?B?QTJXQ1l2NjdwVVdwOVpOV09sK0RZODFJMGV1dExDUlBqK2ZCeGhiaW5SU2NY?=
 =?utf-8?B?QnBkblFmWGlaRGMvalI3aWJTNEx1NUZPeFZWazdrSmdYeUV6NUt4RDFiUnBu?=
 =?utf-8?B?SXMzaFBqQUt1Zzh6c0Vmd25qR05XSExlRFErUUxTQitJUnNBMlpJVUVBeUpt?=
 =?utf-8?B?VmxhZEFacG82SGw3eHlKaVg0QVVpRGVuQVNPVWRuSkVtTkwyVXJRcm9aOGxL?=
 =?utf-8?B?cENQb2JuMTdEUms5WjVxZ3pKRUl5dXhSTkxCQ3RsaHdtUkdXMU9UUWp3Ymcy?=
 =?utf-8?B?b1NGMVhaakhEeW83eXVxa1pwbEpZNUJtWDZQZXVhTWp5SWhWRE00V0NyVWRq?=
 =?utf-8?B?bUkrOEtIdEVycTBiU3FFbGlRYUIxUlE0SHVvOGZ2MkZwUlhOaWNyOE9vcU94?=
 =?utf-8?B?cVloblJmSkZISVhOTFVkcEI2Q2tLQmVLS3dkUVMySWhvOWk2ZmpVY2RNRUpM?=
 =?utf-8?B?bjcyS1ZPUU1nYUwvU2M1L1hYUXFKeDRxVUJGRktxdkd3bEpqa1AyQ3JpcVd0?=
 =?utf-8?B?b3cxOXZwaE1XOEtiSitZdXZ3RHc4YnhmM2o1MGVrRTY3QXdxS2VuVk1pc3Ro?=
 =?utf-8?B?eUFSazhtS1JxazdmVXA5T0ZKTERiL0RUcisxcWJRczNYQm1Cd1p2V05uUWNP?=
 =?utf-8?B?R2tZOFBGNVNPYjNFSzRESUVKRG53NEN2MGN2aGl4UCs5NUp3ZmhENm80UG84?=
 =?utf-8?B?cFNzN1IvVXhGRTV4MWsweVQzRVc5SWNBemdPNGkrOXpaamRpSEE0c2ZHVUQx?=
 =?utf-8?B?cjg5TnRSK1l6N1orKzIwYll1aklVRTVVUGRkQ0ZkZnpHMzZ5QnYrK2l1VVIz?=
 =?utf-8?B?OE9kV3J3N0RWQTQrTDNyQjJ6NGIvSU9RZTlkbkI3UzhFZTVodFE3Y25YU21q?=
 =?utf-8?B?UG5XdmdLcENNWXdUa0kvQU1OckhCTFBUb1laOGZWTDczVWNkS01VVmp5NHlS?=
 =?utf-8?B?UjJGWGVsbGl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4116.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkF3aXl3ZjkxcUVKakdyRnJnL2psbWE2K0tBNkdZNUo0bTJib1Y5S21hYzZa?=
 =?utf-8?B?ZFRTZUMyOVZSTHZxN0VkNVc1YU5UWUQyekJYVVFoaFR0YkZ2MS9XY2ttalQr?=
 =?utf-8?B?Tm9CaXVnNXZDTkgvUWd4b0NqTGw4ZWNIOGJNZFB1Ym1aRXdTQWJsd2VhUTRC?=
 =?utf-8?B?d1VXOFpJWjJwblFTVnpWcktJb0p3ZnI1a05RaHZueUpublMwY0VqMXBHUzQ2?=
 =?utf-8?B?Ry9TUStqM3FFOVRMTGMzcGFyRUxJWGovUVR5aWVkZGZTSDh6c1Uyd1FWNlZT?=
 =?utf-8?B?aXBJOXh0VzdmbDFyeENyblJST0tvYVFZOURvTThoSVF5WkwzWC8rSFBycEFQ?=
 =?utf-8?B?c0RqaXhKajBiaFlyWm83RlRTS2d6akIxdkJTL25lT0dKUVBVR3RRMEEzMXFm?=
 =?utf-8?B?OCtIMlBiOHJXdWRnbHgyTXNiS0JTZWpSenNRZ0RHbURPS2xEMStVazQ0MG9o?=
 =?utf-8?B?Y2VJQnVUUEZQQ3Q0R1FmNGNaZkxyMTJLSFJ6MUdiZFZUYnpBakQvNzEwMHp6?=
 =?utf-8?B?UlRtUXQxeG9BRzl1aUhGWGFFOTZqVDEvSTI3a1BoQ0JPeFUyTDdRbFhNa0N6?=
 =?utf-8?B?OXBjbFBWM0RlU0E1MmZKVnpkVDdDd08vNUhmZ2pISlFUQ2lZQmphWTNQOEc0?=
 =?utf-8?B?b1lGZTZPWnBsTEN3NUxLY3laMmZ5Z1AvWm9VUXdPNGxFT2FJNnhoOC92WWJl?=
 =?utf-8?B?WkRlYmdTeVAvWUQ4bGkwVkFyNTEzQUhEM1NvRHJBVjRWdTR0WGxhKzVnYXB2?=
 =?utf-8?B?amtQTkNJNjRCNkh4NEQxR3Q5d1R0ZEVLdVRFMUd5N25WOTlvbGpsS2pVd3Vs?=
 =?utf-8?B?ZmgySnpKR2RMRmh6S1VUTkpGN0V2OG5BS0RmcjBob2JnQTNrK1JtdW4yWFVU?=
 =?utf-8?B?d1pGZ0YrcGd3bCtTcmdleis5bkVjQlNjZ1hSeWpuMmxQNTFFT2Vocm94YUNP?=
 =?utf-8?B?VjRrbXk4RDFJQ2tyeG9ZOVlPZ3NMVzR6d2kxNXVpS3ZkOG01RjJMZThjQWFJ?=
 =?utf-8?B?R0xsR29HdVBCay8zeDRONmpDRy92b3FQR2JveWFCVHlhU280UmN3NnRma0t5?=
 =?utf-8?B?NWI2QzBpdk1BZ3duZzlWTkZWTFpSQUQrcmtvOGM4NEIrMTBDeTVPc1VVSWIx?=
 =?utf-8?B?d3czajRNakRHd0VtU21PbDk0S3d4RXRMcmh2VWIreFRuclhnYWdCbVc1alNV?=
 =?utf-8?B?dDBKV2pJdklDVVBJeTJVNzhsTXRwSEQvN0x3eWRhUndsdG43MDBPL0xOZFlL?=
 =?utf-8?B?YmhPNlNNYUdaUzU2aEIxZE9Jb3lmMnVxZWdQb1BFTTgrZWI3VVg3VXRpanZ2?=
 =?utf-8?B?LzE3RFRzc2JrN0RJOGNaeVBLRGgvR2s1M2hnZng4Ty91eWx2anZhRGd6ZkJZ?=
 =?utf-8?B?Q2MvNHN4czNZckFhdnJkRm1ZazNCT01XeWtJSVF4VUk5VzlHdStockErNVdR?=
 =?utf-8?B?YWRmZ21ZTCtyMU1qNG5kVWF4K2g1ellESnpzYzFJbEhueEF2cXdoZFB1MDF1?=
 =?utf-8?B?d2VvZm9qNzczdGc3d3JwMkdocUNROGlyZGtoc0hWVjRhTUJsWmE3Q0FNclFM?=
 =?utf-8?B?QzV0NXlneGlTc2lGM3FQaTJ0NWVxWnVUUitDMzMyN2hLK2QwcGpjUWZLcXhB?=
 =?utf-8?B?ejJadkdUK095eGFnbEUvSlhFWVZMeXVNNXhJUXpodkFKSkc3eHhrWDVCVTd1?=
 =?utf-8?B?R2dmaURUMDRlTDQybDNIOXN2MFhNYitra1JnS3loRTNQT0dpVWVKOVVxbVNR?=
 =?utf-8?B?TTFiY3djbHZkdjJPVmJpTTVOaUpiU3MzRVhIV1YxUzhGMlFKNjI2dW1JWElV?=
 =?utf-8?B?UmJxN0JwZWtMRHZiNE14dVFZUnd4Q0FzSUFXN2V6cFdTRU1OMHl3UEw1U3lX?=
 =?utf-8?B?N1lqWk1lK1ZKWVIzNUNUM01vS0RYRjBMa2VxUm11ci9veUxiMVVYKzFqUkpl?=
 =?utf-8?B?SnNpUGNCMnNWRWFCSVY2T3UvQk8wZnpBT0lXeHdnWHdSbjQzbk9iWjcyRTBi?=
 =?utf-8?B?MFFsTkdadXBHWU5kUU0yMDg5cFd1dVNyV3UyU0pBTkx1VmFZcGg1MlRNMExO?=
 =?utf-8?B?Y3RqeldTYUN3SnBJMTRQZGNVbWJXdktERXhVQXNwRERrMjlhdzNnQndramI1?=
 =?utf-8?Q?O76bEqTwwnOkciTVw6CCaUIB3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ee168b-241f-4fe1-ad68-08de208de057
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 19:18:06.1067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1VBALN6QcX53NONHqEf+GwcG+eSykxmISNEr8iIelpWUKCctqzibIGBVjcuBxGLOiHMgMU8I8HKAFwFevEEiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8786

On 11/10/25 1:50 AM, Miguel Ojeda wrote:
> In the next commits we are introducing `*-{cfgs,skip_flags,flags}`
> variables for other crates.
> 
> Thus do so here for `core`, which simplifies a bit the `Makefile`
> (including the next commit) and makes it more consistent.
> 
> This means we stop passing `-Wrustdoc::unescaped_backticks` to `rustc`
> and `-Wunreachable_pub` to `rustdoc`, i.e. we skip more, which is fine
> since it shouldn't have an effect.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 3e545c1a0ff4..a001aae0da9d 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -60,11 +60,20 @@ rustdoc_test_quiet=--test-args -q
>  rustdoc_test_kernel_quiet=>/dev/null
>  endif
>  
> -core-cfgs = \
> +core-cfgs := \

I agree that switching to ":=" for this kind of Makefile variable
is a good move. However, it should be mentioned in the commit log
so that it doesn't look like it was accidentally introduced.


thanks,
-- 
John Hubbard

>      --cfg no_fp_fmt_parse
>  
>  core-edition := $(if $(call rustc-min-version,108700),2024,2021)
>  
> +core-skip_flags := \
> +    --edition=2021 \
> +    -Wunreachable_pub \
> +    -Wrustdoc::unescaped_backticks
> +
> +core-flags := \
> +    --edition=$(core-edition) \
> +    $(core-cfgs)
> +
>  # `rustdoc` did not save the target modifiers, thus workaround for
>  # the time being (https://github.com/rust-lang/rust/issues/144521).
>  rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
> @@ -125,8 +134,8 @@ rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean FORCE
>  
>  # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
>  # not be needed -- see https://github.com/rust-lang/rust/pull/128307.
> -rustdoc-core: private skip_flags = --edition=2021 -Wrustdoc::unescaped_backticks
> -rustdoc-core: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs)
> +rustdoc-core: private skip_flags = $(core-skip_flags)
> +rustdoc-core: private rustc_target_flags = $(core-flags)
>  rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
>  	+$(call if_changed,rustdoc)
>  
> @@ -508,9 +517,9 @@ $(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
>  $(obj)/exports.o: private skip_gendwarfksyms = 1
>  
>  $(obj)/core.o: private skip_clippy = 1
> -$(obj)/core.o: private skip_flags = --edition=2021 -Wunreachable_pub
> +$(obj)/core.o: private skip_flags = $(core-skip_flags)
>  $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
> -$(obj)/core.o: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs)
> +$(obj)/core.o: private rustc_target_flags = $(core-flags)
>  $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
>      $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
>  	+$(call if_changed_rule,rustc_library)



