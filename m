Return-Path: <linux-kbuild+bounces-10913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHCzIntjeWlhwwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10913-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 02:16:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C819BDEA
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 02:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC8CC3014978
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 01:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD1325771;
	Wed, 28 Jan 2026 01:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ot2qUhbp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021084.outbound.protection.outlook.com [52.101.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D15221277;
	Wed, 28 Jan 2026 01:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769562873; cv=fail; b=IensuPsyuOFI1oEVoPjpT11V0WQSnhP2JkxMjJR/mOPv7ron2512o3UTn0gFitQbn8bkz/l4wb7hJ0qdraMnOUM1KoQGHoK6WBwZ+xrJCCZ6Hu17jQ5YOmdQbeDCRZczV12NZuDL9emAl55edccd+fkcSX+xkLw9KSiLAU3i1T8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769562873; c=relaxed/simple;
	bh=muPEJNjYf5iLIrte8GxvwRxPIS+Z3YTbhZMNVC79AQI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BpbIcXml2NqNDhhmXpt1JgtalC/DNfH8X+jsjxWJukokH5Q1IY040ipPeBZQobDpNRByguth2oeMQd2bwIHxwmgB/YDRRaQ3wInAoV0Mggq2dNz4FOd5Z+sztSdmCaP743VlPzk76yjDogvoG+iZ/CyHZMjbmpWK1Kh9AL8p9OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ot2qUhbp; arc=fail smtp.client-ip=52.101.95.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvW+PvzFB0BU1J1myStuDLEnwTCDLJzdqg0/EecjEcitG8Z8cRqGWCoMgaroJ88cGQ8Z4ItHkOf/YqhwIxXxeprHrn7dr/BSJoNjhPwW2xEVUq9QtPKCKIESy8jvlOiuIc6+7X8IicUSMBrBwz9O0JhBN+oRq1SJZwRZG/voayq1gB9O0xODjIW2NYY3/mEJ7tZ3Wb/RUwAZDq7URijv3vDZN2JHv99jycZiGho9riSkbrZdFS/wu373A9NfxCbUq3+/TIHSFki0dZXpoCX9Ore7PHCXh5/Ja2NJ4yzlQ4TpE3I7FyYtKm9ktB8WnyfUg7wcnBumtPbmAb/hqt4E3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHCiE4JTOeySloKvwhjqPHLamRZrBcPrQdjZlz1m7r0=;
 b=Ozrdyd/PXremVaHWou3FWAsL3HS2B4Y0j9m8LDRA7Uhn8vafzzdQ0l9ijmo6M6ln2GJsvfrIxZXEWDabIAYBK3R8OnUcr8GeewHkKg6mb/C2aPVJGgHWNuec+IGIVgxz/P/bG/SnNeftYGa4kvG7LWY2FYoC9zMc6rxRELqK+qq1lK95ccEKxKikB0a7ORevIZIw+ZGeaO+gv2cROYH0JtOGXCPWlkkuyDasdORIeEsBvM9QiBN5bbqtrTn8y0R551ggWyYllH+XszjjDBuvTZ1CLhf3zGqpXmSV0V8XATB6MF1OXtjnl7HZTTNFB0ptMiyHgmrSEFjw7ahFLvKtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHCiE4JTOeySloKvwhjqPHLamRZrBcPrQdjZlz1m7r0=;
 b=ot2qUhbpK540yNnGoDBwsM3wJkUJbuf1qGoc2UH2d/yoIxNQfuu3pM7aVhDferZheGOarLBm4XrWqt4+LZnBUZj+duDXKx/03u0T0SPDR3mWOrehRfW2YUuheIUOm8ttfjpp0TrbmJDNID+ZDGhlcoO3mE/lX6hlR8kscoqbgpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2014.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:110::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 01:14:28 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 01:14:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 01:14:27 +0000
Message-Id: <DFZTOMSDPOQM.3QW4TZ52N4MKZ@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Masahiro Yamada"
 <masahiroy@kernel.org>, "Kees Cook" <kees@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide
 CONFIG_FRAME_WARN
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org>
 <DFZSRE43IHOU.2OZNE9IFIO3UB@nvidia.com>
In-Reply-To: <DFZSRE43IHOU.2OZNE9IFIO3UB@nvidia.com>
X-ClientProxiedBy: LO4P123CA0120.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2014:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d842b9a-85ad-441f-a95b-08de5e0a9543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1lBTHNzeW8valdlenFPMDFMQmpyN0RnS01MRWtYMjNGeERNOXlGaWtHMzNM?=
 =?utf-8?B?dS9RL0ZnTXhLdkZSTFNtcWFZcURTZndtdkNvZmhadjR3WWtabHdzMkd2aGMv?=
 =?utf-8?B?cmJTR01UVW5oUklKc3B6NEVKcVMwSWNRMmZYS1JJZWQ2Rkh4S3BENWpxUWVo?=
 =?utf-8?B?c2VhNklYaGpMQWdRL2N3VWNMbWdiQ05EWDZkNVlMUFRUVHl5Wi96NmEyU3JZ?=
 =?utf-8?B?T2plNGdLTzJPcDIzaWNJS0dYT3FENmM3WW5lZmJxdno3K3g0NlJvWVFCRlQx?=
 =?utf-8?B?TE15MW5hanpBZDExWlc1cjViRlFVOVhMRExWdzlROWRjZFlPZmlIMisxcTZL?=
 =?utf-8?B?aFVPOU5ScDAyVlFwTlM4aFJjQnFNTFRBMEtKQnNqdlErUjBONG9MWWVLcG5V?=
 =?utf-8?B?aVhKZ2diWklIeCtXRjJvamx2RUl6RGhsd2lOTE55emo2aEo1T2VraXpseFNU?=
 =?utf-8?B?Zm96VDBsWk12WkwreDd4M0RGK1I5ZWpXUVZBZlYyeEpsdWNKQ2ovczdUeXJQ?=
 =?utf-8?B?YU8vR3oxR2FvM24wblI5WUtGQncrODIwSFJ0SmdYcW9VMUE3MHZicElXQ3hD?=
 =?utf-8?B?dy9Yamc2VkxobGhvUVlCQXZqSUptdmJNcmt1bE04OVB4RnZkVGhRd0lrYnVn?=
 =?utf-8?B?OER0VlFzRGJYZmFwVTF4S3dxNFdtT1hyVStIQU5wTllSNUpBSkk4YzhFWEU2?=
 =?utf-8?B?T2FjRXBLTlFXSThYbXc4Z3hoNVQvQm5SMHVWWnBVZnZiSXY0NFdMekdxRWdQ?=
 =?utf-8?B?NnU2T3JUR21rUVdCUmlYdVl0MUs3dVlFWWxQT3pFSVhQVmV4bkNnWDRQeDJv?=
 =?utf-8?B?eVZzeXYvWWgxU2JnM2g1cElKbk9SZ0x2UGQ1SnR1Z2syL1dEWHV3SGpJdUFy?=
 =?utf-8?B?Sk04cVpxcEFKbFJodkpzTDRHRjd6a3hpdi91cjM2Wms1MnVaQzdLSlpZN1pX?=
 =?utf-8?B?ZWRYTWlYaFQ3c3g1RE1TT0FKc2dneHdkOFRVaXNwNDRDU0JubFJTWndJTkVl?=
 =?utf-8?B?YUVselNuWnZQUE1iVUw1THFSVnIyb3lJdWtDSzl2dHlIVVppcnFPbkNiZ255?=
 =?utf-8?B?dnhzVDM2RGJoaVJwZnB0K0ZvK1F3S3ZWc1pJUjJLc2t6Y3NteE84dVNKWHcz?=
 =?utf-8?B?Q3hDcVk4ZlN0Q1E0R0JmR1VwZjlCRWJHMkFSdkxZMmRsWFVRc0EwY0Vybk1j?=
 =?utf-8?B?Vzc3MHpWd0k4b2NYTGFuZE50UWU5Q2syc3B5WXFEdlN6Zkw0bzBGZVFSSlNG?=
 =?utf-8?B?UndQZy96dHlGOUZHNDFYMkVDNGFETXB6U2ZrYU5SR0lzR3U4Ty85TmF3cDRx?=
 =?utf-8?B?T1FLME5jQUg3SFcyeWxmeVhOWUdjNWtZa1I2VU45aU9IZ3p0Yk1PV3N6TXZH?=
 =?utf-8?B?WUlVa3VIemdUWllvTW9IbEVOWW43TWhIYTNLOE1FWGgvZ1VlR01iRFU4L3RD?=
 =?utf-8?B?cGN1TTBlRkR0OEc1Q0tWRS9QeGdQVGw1V0pLdFdKUmJHcE55SUxUeXozRGpq?=
 =?utf-8?B?UmVHNmNWeDVFY1owVUlONUNOUnhVblk1NWxLMGRSTndIZm1uRFg2L0Rjd0dN?=
 =?utf-8?B?TmNWa1ZNdC90RmF5NUYxYkE1R3JxNVpmZFlJVmRTRWJoTmt0dEVESkZna1Ey?=
 =?utf-8?B?T2tHZ0ZpcXNvZGlGbEprdXdSejBmclFuRC9sNzMvWHo2ZlZkNnRiUmV2ckgv?=
 =?utf-8?B?Q1M2WFBZdS94enQ1Si9ZbkttMjkzQVREVHhJMVc3TVRLaWcrK0ZsTStkY1B4?=
 =?utf-8?B?b1NyeU1pV0o2UVZkVW4ySEtqNnUzSDV1R3E2REMralZqbTg1SHR4bE51R3lr?=
 =?utf-8?B?ZW1veGZ1b0N2TCtiU0hscmlPM0ZlRUwrWmxRZGVqNmRscVlSNGVHMCthc083?=
 =?utf-8?B?SjlMM0hENGVsOGVnY2ZNLzlDTlcrbTNmQk1HQitRdDBwaDJzWGFsSXcwMFRv?=
 =?utf-8?B?VUZ5dk5ST1VkNnlrbWlQQjViM0xURDdtcW9ESXZqUVFQNDVwQmI4c2VwNFUz?=
 =?utf-8?B?Y1FmMHl2dlRBQ1hMdzJDbFhIK091SWRrb3NaOXZNZFJQTFlCVjVRQmp3RkFz?=
 =?utf-8?B?SWFkVWUycTVSSVlCNE80YzhBZ2lCN1NZWTYyYXdHSDhxdlFkYnhmRE5IYWVU?=
 =?utf-8?Q?j9rA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmtnZE5qbUh0aXdpU3lmU1ZWbEd0TmlkNHMwOTJmdFJJNk9IbURoVHNTaGls?=
 =?utf-8?B?Vm53TGk2dlZNdlpxNTQzNm9OKytsRFVSY1RTeTFZMVJmOGJ1SldFYS94ME1a?=
 =?utf-8?B?Z3RyWVU2dFVnb1dYKzl6VHlWUUtHcWpKYUkzNm1qclIrbzNpZzJBNDN4WmtF?=
 =?utf-8?B?QlY1MUczL1JDc3BlN3JnQzk1QXJiUk8vWENTMXBEcTBFQnVLemtGRGFDbGtD?=
 =?utf-8?B?SGFvOHJvamV4Uml3anBjQ2d3NTFrTUVUeW52Vm1pVEhhMENEM3VSSUQ1NTZ0?=
 =?utf-8?B?MXFJWVA5MjBEZS9Yb0VoUnU5ZXUwbHJsZUtNMnhJWjdQaUNLTmgydVdWa29y?=
 =?utf-8?B?eW5VQ0lCeHNpZ1Y2MXdEdWlHeDB1U3JsdE9PSDhIakg3ei84bS92VEViL3dw?=
 =?utf-8?B?ZlBOMmJTL0swN1R5WEpVSUJWTHNLVllZejVNcUVQU3pBV3BsdElwVWljdzFq?=
 =?utf-8?B?azZXVWkyUkE3MFV0d0RaQXYzZHRLa2lxSDRkaHhMb2k4UFhVL0tIbDdPNGEy?=
 =?utf-8?B?YXk2cExjMlRndXF6eXlrUmh2MFNFMDR0UlpmR0V2anF2U3JUbTVDZTlxN0g5?=
 =?utf-8?B?RTc3TGg4MnFOM2JoQlRZWjVtZWJxQjlzMlBCeVM2NEs3eFhKS2treGNGejk2?=
 =?utf-8?B?MVkzNWdGdVhMK3FoYlZVODFXUUdMbzBKaEZzdWRTRmZGWnk5UHltSFBKQWVR?=
 =?utf-8?B?cDIvWWV4SnRGb29Db3lWQXd5b1NGb3FqR1dYTUxSTGlJSUR5UkhOcTFBNUxp?=
 =?utf-8?B?UTFVY1RxWW9CWmpUcHNha0VrZ013QVJBMjRtdDg0YVN1bk1VbEFiUWg0WlQr?=
 =?utf-8?B?dDY3MmcxVVdnZmUyQVJuVzNHaktoU3AwMm5oQ3RFUmt4NlpUMzQwbmJYaDBi?=
 =?utf-8?B?M1FrV2V5eUFjaXJURnFJTUhLaTNKYVdqakVMY21Ia2xiZHI0Wk1UYWR6ckxK?=
 =?utf-8?B?Wkh5bDc5bElvaktRd01TNzNjd3ptQW44cXEvZ1MrSG9qNHVqU2RpbzB6WUJu?=
 =?utf-8?B?VWV5NDEzNDBCZytuQkxiVmJqOExCMlAySzRDY2YvcXpqTWtKVUZ1Rkc2NDR1?=
 =?utf-8?B?cEJ4VloyVVoyQXZtS1N1OFB1V1hJTnNEU1NnbGg2NndFRTlZY2JFRWRnamly?=
 =?utf-8?B?Tlc0MHlCSHhtZExrTGNHU0VhUy9QY05MNVZCRC92dXV1N2JxYWl4YTduZVFj?=
 =?utf-8?B?N1k2ZG10WDRrQnFLSDJnRWZ5WWh0aC96YVJaaXExSTUraGp1QjczcUlJdll1?=
 =?utf-8?B?SkRndHhKcytxZHZLVW5jRHpkQk5TVHlRUVR1NjBVUkJZcVkyM0ZNdVV2WWhk?=
 =?utf-8?B?djR5TnFYRlNCUEp5M0d4ZnZLT1pXSXZ2Wlc0bkI1L0FPbVduYlJRQ1A0b3Yw?=
 =?utf-8?B?cUV5SWdnNktZdXcrQmNMaU9IZEROckFvYmhLS0ZLNkpzNVZoYnE2Unl6aktG?=
 =?utf-8?B?aUh6b0ZTeTNMUW82NjMzNjZNMk5KL2lRZUVhSS9HazVvUmNoVXZEM0hidlRD?=
 =?utf-8?B?RzA0L3NOZTV1WCtQTkoxa1VpRllueDljQmx2dnJCMXBxMlFTNUtDcUdiTGZK?=
 =?utf-8?B?Z094WGFaSVM1QVRMWlBFMFlrZnZISlNKQU1EOENzVHZ2TlVUT2dQaE9BNUxC?=
 =?utf-8?B?Y2VydFM3TkJnRENYcm5ubkkyL0FNTlRkd0JBejJYSUwwc2o2Q3RJMThqeWYy?=
 =?utf-8?B?VVJjZFVDdGF0czdncHhIRXpmK1loV24vV2pzNnoxOTloOE1tWWxmOVkvYnZq?=
 =?utf-8?B?ZXdvTXJsWFdLVFlrT3hITUxlak1ldzVMak5SakpPVTJMaTZhY0Uyb1l0Z1NL?=
 =?utf-8?B?NzgwdlRJK0dQY01xN1hjVzR2V2wzQzB2dkp6WEZoRmp2ZExNczF6cXlGZTlY?=
 =?utf-8?B?OXJNeDNJL28vdHpaUndWM2NSNHZEYjdTV1BHR01HMExxNG5nbzVJUUw2dkJa?=
 =?utf-8?B?Qk1VSzNoYk5KZUI4NkhSOVNSM1VDUXZDS0I3dWtqSkcvUTVjdkFCM1UzL0h1?=
 =?utf-8?B?S1VzTENjcTBJYmkwNGF6eTl3L1l3MDJhYlFzTmNoblQ4NTJCaTM0ZTI0SEZi?=
 =?utf-8?B?WjFxSnQrbDVNMGtBY3RNZUNpM2NEQmpTdUU5c2RoVlVrNWdDby9EYTBWRnox?=
 =?utf-8?B?Nk1zb2RBTDRhQ0NwQzdCb1IyWGZXVlVReWQ0YVRYUmxOVnV1N1puU09qb3RH?=
 =?utf-8?B?SXRLUERpY3FOZ1hnSWpTQXduZm5xcndRR0IvVnFvRWNQdmhhN1lnVWpGbUVL?=
 =?utf-8?B?b0FNWUxlc3d5ZytrQXp6aFNiRVc0d09LZ1d6emtkelh1TVNXenI0NDRSRGFl?=
 =?utf-8?B?bnh4N0dGQnNLMm8xcGErcVRuVTAzMkU0S3d4d1ZUUWN2SVJxbkZJdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d842b9a-85ad-441f-a95b-08de5e0a9543
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 01:14:28.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wX4pgTv4SNlBq8DiQbytccoRSI4DzkX5mNceyK4woeY8ecBMP9jGSYoiv+5skgtC/rFyElrkP0wJS+bT4G8TZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2014
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10913-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07C819BDEA
X-Rspamd-Action: no action

On Wed Jan 28, 2026 at 12:31 AM GMT, Alexandre Courbot wrote:
> On Wed Jan 28, 2026 at 2:11 AM JST, Gary Guo wrote:
>> From: Gary Guo <gary@garyguo.net>
>>
>> klint is able to analyze frame size and warn on frames that are too big.
>>
>> With `register_tool(klint)` support, we can simply instruct rust to turn=
 on
>> `klint::stack_frame_too_large`. This is a no-op if normal rustc (or Clip=
py)
>> is invoked, but will perform the check if klint is used.
>>
>> This is an example of a bug caught using this option:
>>
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
>
> Initially this error puzzled me a bit since the objects directly built
> by Cmdq::new are not larger than ~40 bytes, but then I dug into the
> constructors it called and found that `PteArray`, a large struct, is
> built on the stack! We need to convert it to an `Init` I guess.
>
> Super valuable tool!

Yeah, I've already created a Zulip which mentions that the PTE array is lik=
ely
the root cause. This specific lint only concerns the final stack size and i=
s not
aware of what's creating them.

It might be possible to do more detailed analysis by checking what is using=
 the
stack (e.g. perhaps recovery variable -> stack slots using DWARF if full
debuginfo is enabled, or find out the instruction that first touches the
specific stack location and map it back like that), but doing so is quite t=
ricky
and the marginal benefit is less than pointing out there's an issue to be
investigated in the first place.

Best,
Gary

