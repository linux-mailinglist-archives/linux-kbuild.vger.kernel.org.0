Return-Path: <linux-kbuild+bounces-11065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHJgK/NZhmntMAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11065-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 22:15:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F52C103608
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Feb 2026 22:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 12EE5300C333
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Feb 2026 21:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA32E26D4CD;
	Fri,  6 Feb 2026 21:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="lBeWuVFw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020095.outbound.protection.outlook.com [52.101.196.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9413E22339;
	Fri,  6 Feb 2026 21:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412526; cv=fail; b=luWZIb0Reg+D4dDVppUJPrvKLq3d8Mnvy1O6c9kQUke6UvxvntwF07LurhIyGSE3Dy3lGsH+QGby6SKdh5AgNjPJQjINiGio28QMl1DP6kpH/4PtnOLdQOWD46yR4uw4CfpPdgmSy5PMIpODv8LKsa6/F2Eq7Q82cSPvBnUIEUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412526; c=relaxed/simple;
	bh=0GC0goH1vCbd92av8t+syV21WapfYZDco1vnie+IFxI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GsV71P6Wlc4UseJNjsCB3cjNU9Vk0xM7EABxeITOIlGSa+UcrqLkq8Nn4yOIjoNc9vrtdseZwNPxARHieXvc2eaHaYvcbekzJYU6xc+tq8NYli9Q9APCT613QfJuPbZd/gSXwRT5Cq/ln1PPGi4ZO0ObrxG4I8I3EZhq0sYnUvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=lBeWuVFw; arc=fail smtp.client-ip=52.101.196.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gekd/nWe0kjc+60GVPwN38qZr9vLJzNLQhBN8E34gDatXN9G3cnBwI1hjoFYrveNaGaTi3zyzCZNdJQzyyqBcXvn3JLGEYOwDf95unMpKj8ULqiwhvCZgMWYrOTIXj30WVj3NWQB7vozghaT7RTgjfhGpkOwBgio9BN90vOvU2zqvBLWDGj2SuDEczbiPm4ALlWEGy/MmOHkb7Hi77KexCXwY6V3WkhcbEeR2/U++5BbWIfE3h0IFoHtiydrgCcSjA6a7eOZV32sYgUzh5oyGksGYFMtYXWUf4VLugNqyRk4nVCluaaz/W6yI4vao+ru1VMBffd251CzDQoq7j36Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nmSt0PM7KiGM3450LNJJg6ErEZxMXgWnMx6iTiiiDI=;
 b=DvwyoIJVCz5IV5QSG/ikooA9rdvqvo9/guhRgWqLCNYbGIPHvrEWXF6fxnFr/cyiic/Uw1dr5UeRCD+D44u9iQr2voNq8D1m64LLc+6PGekpnt1HloHVM259X7hnxE8ma4ywzkyQ2IaeT1/HHpTffPUzZUZou6vtk2uc/ggN4IT+1r0BEKCZEBqOcNvuhWN1P8Uy/F8jcXuDE4kNkzW60VJDxubyytHrBr++jICQflR3RGEA8+SdIQJoPSv7Irgx2ELPZCQbSjpbbuzElk3WMhEu2mAZgvx1RB6O84nfg8ESD9S357EPehlqh5hMGZiW2tC028vCCsmUAVjOzoRatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nmSt0PM7KiGM3450LNJJg6ErEZxMXgWnMx6iTiiiDI=;
 b=lBeWuVFw3u8O4OZ8W/I6ymu6Vng/Vv52aR3OVxcnsntAckN/vwfYbZdHUu/0NP8Am2SmtQniULM3GzLUJ/YpNnrFnDxqUXvo52E5WVThyn5KDZVsD4oeqFKNCpYWGQfxYzwSehTwh0+IzApfbwX5fuBR9kZvsVBploP80UE3Msc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2277.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:77::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 21:15:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 21:15:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 21:15:22 +0000
Message-Id: <DG86V0YSM7W8.2SNKPBF9ZJC7X@garyguo.net>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "David Wood" <david@davidtw.co>, "Wesley
 Wiser" <wwiser@gmail.com>, <stable@vger.kernel.org>
Subject: Re: [PATCH] rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nicolas@fjasle.eu>
X-Mailer: aerc 0.21.0
References: <20260206204535.39431-1-ojeda@kernel.org>
In-Reply-To: <20260206204535.39431-1-ojeda@kernel.org>
X-ClientProxiedBy: LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::27) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e762f3b-d8e3-4353-15b7-08de65c4d72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a25vTkY0aWwvZXl0ZzhBTU9kVVNJSFNELzU1aUxlZTBUUUk4YVpEdkRMSnow?=
 =?utf-8?B?YmpObGtpU2pkdkdFT1B5bERndTN3Snp3V1J0b1NXWFMvbllqQ3BFL2dXbFp1?=
 =?utf-8?B?SXNWdU1qcEtrK3ZuMDRxb2kxRmpLdWV1K0NOeFIrOWZKLzZSOHJQTUZybklk?=
 =?utf-8?B?V2ZUVGhZY3FxWHBQUGV3UUZobFVrRVBWOHZBT0d0YW9ENXdXejNiS0N3OE1B?=
 =?utf-8?B?UFpoM0ZDMndFTHUra1hTT1ZES0FmLzY0azN0ZDZZZ0pnU1NJajNjRlduYjFN?=
 =?utf-8?B?OGQ4azlFN21zNzl2aEV5aldHdUtNam5oVVp2V0pMcHc2Vi9jd1BzNDc3ajRu?=
 =?utf-8?B?blc3OUZyUVc2WjdreDB3QUc0ZnJkeDQxSmVIM0ZLdVNlR2M2WVBKWWVVUVlQ?=
 =?utf-8?B?R0pURDNQV01KV292SFpzOVB1dCtQLzFIREd6bEthVXNkVWFua1p5QzFTUmds?=
 =?utf-8?B?dEV0aFN5bTdwTG9NUHB1QlRXTEFuVFRwazZNVW9waWhnWEVLZXIxVlpUU0VJ?=
 =?utf-8?B?QkdhRDlhYXpWbzQ1K0pRNVhuZzRuKzBPY2U4U1ljZ2l3bXdnU1cvRGlKa2JJ?=
 =?utf-8?B?a3NrQXE0bDB3c3hhaWpxRXhONVZPRVRwZkxGRmNHeW40NzhUelpMb3JWekpz?=
 =?utf-8?B?bkRqaVd6RlUrdVFTd0dOVGp1cEhRWS8ydG41QWkzdzBMZlRjVm1SWkVPTi9X?=
 =?utf-8?B?RHh1SXBnTFNBWitCVEZJRW01dE0rODNwMm1YRWI0Q0wxK0Rpek4zbThQNmRu?=
 =?utf-8?B?MzNGMi9LU2dsdmpVODgzS0hoRDlpRXk0ZHdWVzVEUnFUUjk3a0F3eHd1Q1B5?=
 =?utf-8?B?WSs3a3ZiRUM0Kzd5dVRkN1BBQk8wb3ljcjBFajAxZlQwU3pzdmExaUtmR0lG?=
 =?utf-8?B?REdhcVBieEpPY3QvbmF0TkZXZ3JQUkxWcDNIWEM0QVFiaWM1eEd4WG1adXBX?=
 =?utf-8?B?cjNGbk1hS1Q3ZnQxU2UyU3BDTDUyQXRsa2wwNGZFOG1CUFB2Z2lsY0R4UVRr?=
 =?utf-8?B?TEg3ZnNOYmdhRWowSWtKMXRBZTZaNjNYV21DdndoeUxXNWoyaHNTaDk1d0Fm?=
 =?utf-8?B?UlVrYmx5aEdDeHU0Q2x2Y1UrM2JrcnVNaEwwaGd5LzVTQm5FbXAwcEE2ZDZo?=
 =?utf-8?B?TkNlT1FDcjBrdXNIdTFSQnlieUYvMVpWT2RjeEo3TjVjUXhrbzJvT0NHWlhD?=
 =?utf-8?B?cGE4elFlR21UUk1scFVhL29FTC9iWEZhOWZwL01aZm1zWUxHRStJWGVGaEJF?=
 =?utf-8?B?aUdGY0JaeU15cDhsR1NVc05lcHJycVRlREg0am9XQ2pDVi9aRWk0TlpSZ09U?=
 =?utf-8?B?akJLbGFicVVqTXdLSkxWRW1lUHFlOEd3cjA1UWVJaVJIWWRFTG5taHVCdG0y?=
 =?utf-8?B?bFdPaDBBcHAzbkp1YlBPbXhKNFU1TXpsZHJjR3d2Z2lOek9TTm1iOEpNT2x2?=
 =?utf-8?B?TUxjNzkrR1JFRTJCdVcxV0JvS0c4Tkk4c3BTUzZ4RTNMOWFveE5Kb0UyZlJ5?=
 =?utf-8?B?WlJvSnc0cENRNXB3dDBsWUlEN3ZFZkdDMFdxS25qUTYxOHdhVFIvby9sZEZx?=
 =?utf-8?B?YXJoTUpMVHJIOHpmTHJoeWJ1Rm9iUUpENGpIZUxDMGRIMmwvVVZQRndhaE1t?=
 =?utf-8?B?QWZDcGo2aFE1MmNNL2JhSHN4UFZvb0JXMkc4cDk5N3UrbjBBbkRsdzNoemlL?=
 =?utf-8?B?dExjVEdBY29hSDhrUFNpcTVIWVpCOGpUNmpQcnJEcVpucUZoejVpWCtHWDlD?=
 =?utf-8?B?UlRldHlQL2tIKzBtODF2VnJCUTRlRkNPKzArZmNtRm5MamwySjVIVjdDOUVT?=
 =?utf-8?B?Tjdhd1JrdkhsMnFtcFBQUlJWNlhvb0haT1U3OVZoZ1F0UjFjdnlvYkE4eGpx?=
 =?utf-8?B?dmxNN2dtSnMvbU9MUDU4NVFydEtMaHdiNDNhRlZtdU8vdzk4SzRJNWZ0NTFU?=
 =?utf-8?B?QWpmTHZHVmYvYmtlRGg1NU1sVzZEckhVQnJ3WUQ4dFBQR3prSGl3N0tva011?=
 =?utf-8?B?UVEzcHFBRlRyM1IvalVOakVDdEkyeUhDTC94a2VuMlpOL1FOdEFOTFFYUzMx?=
 =?utf-8?B?R2tseitDaGdlekl1L2R3ZC9NL1VrcEZaK05GYU95YnoxNU9FV0JqWGlrSS9D?=
 =?utf-8?Q?/6yc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzF6Q2Q0VlBsMXcrZzhuNUJRNFAzVy9xR09JMU11UWNiRHJLTjdtakcwNnBX?=
 =?utf-8?B?WDNhTnNwSWdhL3FCZmUzdEhrTUE4NFpPRTV0NmVaTUhNR2RUQlNrUDBwUTAw?=
 =?utf-8?B?amo2Y0FKZm9zUEJZKzFvdzRMYlBlbkpmMHpVSXBrMFdLZFNHMU9GbkFPc2g0?=
 =?utf-8?B?Zlp6LzZWZ1JQbWV5dGhRU2Z2eU1udmRSZ0gzblNlNTlYcDZFUDZMYzc0S2xu?=
 =?utf-8?B?ZXpFTUp5YlFnMzYvd2pSN2ZWSGIzcnBSUitPV0tBc29rbmw3dXByWnF0dlFz?=
 =?utf-8?B?OEh6c3V2NU5Cd1RrZzMzOWVobzNUb3A3VWZrSm93cE1IS2locG5CZ0ZRSDlM?=
 =?utf-8?B?RFNEQ2FSeVRuTzdmeDFKRnhRVTRHam1xejdrT25VZzczaHl5LzlDMkM1N0xx?=
 =?utf-8?B?TUFUa0ZKOE5xb3ZsRDFYTXdLbDA4RG5xd1I5eXBKUDVnejQ2QUlMQ2VpK1N2?=
 =?utf-8?B?bzQ3Z3l2LzcxOWUvanQvWmpUQTdLYXBNblhoYWE4dUl5dm1mOGJvaXR0RXhk?=
 =?utf-8?B?UURBMFhBVzdmK3NIeEVlTG11b3pLdEhUcFRzdXRyemI4V2Q1eUtHRHpwblh3?=
 =?utf-8?B?UGVkcDZwQm5qajJwT1Z6WE5KWkZISGxGSXFneDVPZ3U2Tm5kOXhtc0hzeXZo?=
 =?utf-8?B?R2s0dmZta285L1cvWDdNd1lBOEFSVE5ZYll6YXREVGdKSVl0Wnc0ZEhpRXlH?=
 =?utf-8?B?aVk4b1BvWVFqMkRVZ0F6SWZiTFdLbUEvRll1N2pVekdwTlZqWUgrOThhdGdR?=
 =?utf-8?B?RkI3WWVYcHFmU1l5VkEzaC9kU2FkOVhUQ0hSQ0ZHRWI0dG5vT1UrNlk5Ky9U?=
 =?utf-8?B?RWxSL1ZrTzNmT016OTFHbDZjSVZoeGhrR1ROWkk0QWk2dzU3bitibUxwWlJq?=
 =?utf-8?B?Y2NJWHFkMUk0R1NBdmcweCtuN2VRV0V4dmdmTFNwcERVSWtWSmtKSnBMYmRM?=
 =?utf-8?B?dkJ2dkt3NWRlYTZkYTJieWNsa0cxcVRrb2s1K1liY1QzRmduWlVZeVZtenhL?=
 =?utf-8?B?eXNlM2xjZVJnTTBrYlQ4R3ZzZ2s1Sk5JQ2J1dzNkaWk5b0xaK2tUT2ZkZDFQ?=
 =?utf-8?B?UHhlYWJrdUs1UURTMnJpMDJsZUtzcCtoT05TNDdhWnNqaXZXUThyUnd1Rkc4?=
 =?utf-8?B?K3EzWUNBbVBlU2FWbFpiVFBueDJFUHpTSVFCTUFsS2ZpdGhNUWVmMjl0OVVC?=
 =?utf-8?B?SmtxK09WK0FBY0NlT0h4ZlVhWVY1YnJqSXdXaXR6ZEZhejViM2U4YjlMWWh5?=
 =?utf-8?B?d0FJc24rYyt0cHNXbEQvT3hFbFI2NXR4KzhDczRNWDI1eWZsS0cxZ05uRGlz?=
 =?utf-8?B?b1Uyc243WTlzS2pWamQ3cFNzdjE1SkNpcmFHTTgvamJ4Vit4dm5rTnQwUXJv?=
 =?utf-8?B?WWg1R1RyZG9TUitQUDJwZ2p4S2EwTUc2RGRVNm43TjNFL3hCWlpvWTNic0E3?=
 =?utf-8?B?L3ZDMmc0WWlNNTQ1SkJLUkpjYW5rLytudTJ3djU3TTREOStJUG1WN3VDR2Nn?=
 =?utf-8?B?MkYvRjFuRmdMWkNBMjN1Rm93SXRwbnVkbk96aEZmeS8rRUNPd21sQ2tvNVJR?=
 =?utf-8?B?TDdNMW9abDVNdCtxa0VVQjVva2h2U2hMbE5ySEMvbWtGeTR3QnBIbzVwcTNW?=
 =?utf-8?B?Ty96d1gvdzBTMXZpWDVwSzd1VFNDL2czWk9kYTkyRW82a0djSm5zYXJ6b3lt?=
 =?utf-8?B?emgzTDVsZDIyMDFDdVZHWGEvbEZtTjZWbUNYN3FZUW1FUzAwR3RQR1V2QUdQ?=
 =?utf-8?B?YUhRNlpQMUpGaTNCSVNxc0s4VFFyQmVoMS9iamdpcmJwNDd1emdySVpxUlM3?=
 =?utf-8?B?Q3BINkRwR1BnQUpuQWV3R2tUdU82dW52S3FSY3Y5aitQY1hHKzdZa21QdStK?=
 =?utf-8?B?N3NyZ2FsZ0tEdlRmclcrcU1BTVVpYWJqaXVkMUhHb0VmWWdDbW1qakwxSXFt?=
 =?utf-8?B?NDJ0c29HcVpCSWZGUjdnTVY0eGNEVUJVUXlHeDlkNTVvSWM2bGg5bCt1ajZk?=
 =?utf-8?B?bUdTUnVDcjhycndhVjFsbUpMTUo3bjBDRWNrSytxRldrcUJMWUFCM2p6ODNU?=
 =?utf-8?B?VWpFL3VwSFVIUjY2N2RnRVE5QjgwcmFWS3hqNFZnbE9tK1J2azJYVmhoQ3JK?=
 =?utf-8?B?N3RRQk95OHBrNHJVbDJ4ZkErNTIyMkxsRXU2cVA0aXdhV3drZ0lZTWtaZy9h?=
 =?utf-8?B?UlJIL2hiczMreStsU2pUNVgwcUtXMlpnYTMyQUpFVkNtNXF3YW93Y3ZTcktQ?=
 =?utf-8?B?OVk3S3Y1Y0pYTlVOUkozNVZCTDNSbkVQa0hCRDAzQjBvVkd2ajMxT1hoSGl4?=
 =?utf-8?B?N1p2bnRNbXFIcmVMV2trMnh6WFI1TWdQVm9pOG56a1hBZDVYTXNDUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e762f3b-d8e3-4353-15b7-08de65c4d72c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 21:15:23.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1ihQeWHbq82+mnfI4wujakTMuy8Dwc5lacO3gf8bOxb8DNq2J6Q+0ghkz9neht86057XbuuxLfFLS7+mrpVfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2277
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11065-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,fjasle.eu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,google.com,umich.edu,vger.kernel.org,davidtw.co];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,garyguo.net:dkim,garyguo.net:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,davidtw.co:email]
X-Rspamd-Queue-Id: 4F52C103608
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 8:45 PM GMT, Miguel Ojeda wrote:
> Custom target specifications are unstable, but starting with Rust 1.95.0,
> `rustc` requires to explicitly pass `-Zunstable-options` to use them [1]:
>=20
>     error: error loading target specification: custom targets are unstabl=
e and require `-Zunstable-options`
>       |
>       =3D help: run `rustc --print target-list` for a list of built-in ta=
rgets
>=20
> David (Rust compiler team lead), writes:
>=20
>    "We're destabilising custom targets to allow us to move forward with
>     build-std without accidentally exposing functionality that we'd like
>     to revisit prior to committing to. I'll start a thread on Zulip to
>     discuss with the RfL team how we can come up with an alternative
>     for them."
>=20
> Thus pass it.
>=20
> Cc: David Wood <david@davidtw.co>
> Cc: Wesley Wiser <wwiser@gmail.com>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/151534 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

I can confirm that build will fail on x64 without this patch in latest nigh=
tly
and this fixed it.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/Makefile | 3 +++
>  1 file changed, 3 insertions(+)


