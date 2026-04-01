Return-Path: <linux-kbuild+bounces-12531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB0lI6Q8zWn5awYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12531-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:41:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595637D529
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 522C331D141E
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62703361DDA;
	Wed,  1 Apr 2026 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Xo5Mi2lr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020143.outbound.protection.outlook.com [52.101.196.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FCA381B02;
	Wed,  1 Apr 2026 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055956; cv=fail; b=ika3bVKbCfGVzKDApqg/6EQXtLYgji6j/9unJss/OCwrRziJXKbOiNymT2g6ZM50WRQtUOfKtD31h/oCUDauzZW30WlOhKYptqTP8X9ay1cHgkzLEHn5Iwhf4c1OURx4YT19Kx6YtsFFAEGF4uX9O8pkUPxwal2cFpdancjZqK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055956; c=relaxed/simple;
	bh=68knzZXlGC9iv/dV9UhX23JVcc+yi0OH3J390i+59ZA=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=lLLGzy0xVLDzW3w9qjaNocQhMi80qFDeG17eojcwuPm680Rj6l02A2Z0Gw+2mXT4LtI9d5AxzbxHywkHW80tVNi7dEPmIgxVdsE3MuXhlITOo54RHX2lGDKDo2l2pzNniB9HcQdMTqwrcmJu9J3PimgqUyMLukE9Wujg/tfT6iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Xo5Mi2lr; arc=fail smtp.client-ip=52.101.196.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtP/99ZNm9DunynNz6P91exIwziaHZ9rBE5S2gvTLHxNXF5pcwApX/bxFcmYOx87QRfIpT1BsOF3J8x/xrq25iL+CiiJhZJVJkDchy2zE36OqrW2WLTHV5RVqxkQGRlfA+UvVzYFSgktVun1TDmPpBkMPr8/qVt9xLuGI/LmM9tfWzlV7RVAoJ7tM/OPbrFLc947zFPXir8F0LgRyvr78FS+pxXT/gigifbOHt2unZXiOjqkH2lW+6ceHU4Opb6z2HsBCafE1sVKrVhm+jIRRMuNA7x2wf8QTHov5FpQuJILQqSR340/rcEDZf/jVtCUJY1hJO243rm3zDP4YJLGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5FwKL98v5d+njjywmmO41fA7+wSvD3FwPG0LQG5AHs=;
 b=DrzkmbllSPFjObzHLt2uuR6lxfCFxMZpJLD/xZMeiw1aryrU7WEYxN7tqOtqD+jQCrJMxF16i//Eolr6EdkHqfBg+sBn6tTyt+xbp9KMsevST8eWVB0XmtNE0aRVB6f68Hwyx78M9zHTI1X/WYGoa1dnvhc1CJNti0LxtD108nEinPcf7uYJQQfUmBPXz0QIQctex6wUCJkUrd9D0RvTV+x8Cpi/zOwFc6Jn6ScNfpWiipBCm3nu36GWlJ9m1kEXIyeLGqW0ggFhd/QkYlsoTRKY4ilMQJHguADQaX8GkHCzsLcrIGfZB/Im5hbGA2ThE834brIp7oPR8+yg7r38Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5FwKL98v5d+njjywmmO41fA7+wSvD3FwPG0LQG5AHs=;
 b=Xo5Mi2lrf50+ERkfoyfjZ1Q8RJWYg+bNc4ryeQkTmije8YBeUPvYjD4Cd6v2qqmCmODZNhDMogOsI9ooxkLnEQ8UQ1qMhp/FKrj99KPTeOzKN2+LtC/5RN7CWfKqgDoe82UVBp1P9kbKnl4D8jMo64ovNJiKCnhWKjn2CwPXy48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6112.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:05:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:05:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:05:51 +0100
Message-Id: <DHHWTIL1ME5S.2UBL6GC6FWUZ6@garyguo.net>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "David Gow"
 <david@davidgow.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kbuild@vger.kernel.org>, "Lorenzo
 Stoakes" <lorenzo.stoakes@oracle.com>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 "Uladzislau Rezki" <urezki@gmail.com>, <linux-block@vger.kernel.org>,
 "moderated for non-subscribers" <linux-arm-kernel@lists.infradead.org>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Rae
 Moar" <raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
 <kunit-dev@googlegroups.com>, "Nick Desaulniers"
 <nick.desaulniers+lkml@gmail.com>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, <llvm@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Shuah Khan" <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 19/33] rust: kbuild: remove "`try` keyword" workaround
 for `bindgen` < 0.59.2
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-20-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-20-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: a7bd56af-aff5-45d1-d531-08de90002a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wvpzgr38FoJ7AZcxYFDtR/cmQ6CJILnEq9efdxGCQQRplkP7fwxE47PJJS2s5Qmt6sFKPz5eubd1owBkc4ge6EGh0PiGPqQYe2LoaLpVClRJUKDqKF4Ejus1xOL/koEsFFW3y2I3l8GjmtT8bZjIvJfHG/nO+umsqMQE7dfsbGtWtpa+ct16RBgwH6WFFnwiEao1oPVVK35udekaXnnIrmkRcjvP6IP/Ugni5FhKBWtNZJdncfNrKRoYEkWYww5AHrio7pzABHuYO6cCDUmjw6pNMffZifHafRVzwCMP784V1ET6T0W61vXcfyvypfaCdzUkXrzRi/u3+XIFyVvcW8T+n7pvU2r2dGXs12YDvnYrDSS8c6XqSRaG1mL4FHkf3iOZ/DXp2xzOkLrFg8k9KGLlO7NLonXsMgn07qfDPFoEHhzR5cVPQqOk0QJBos1Tbl8mFpwkqI0EmP2T9WQQXztIDrTLWSOHPkmDdT/98cAmp7RDWGWKN+/qQRdzpHkn3kkiUvrshED+Hrtz1BRg+vwZ8vr/H1pwA453OoOBSuLMPxo158CINjedwb3YMGajeWPn5xfxpQ66uhv86u/5Bh8EbpUgxEZm7js6P7Hi4qtmaDDj6Y/DrnDhAFlUA2Vi05gwhS5tbXplHDhOAiwgiVLzZArx/vzgT4DoagsOvMBIgoU061WlDyz3EnaXsNO/Ime3IEzPrh2kXgPrYsrePX6YlkVWE/Htnv/rnsr5UlsOlH49lOIxobe+eUk07KlsuFxyjHaBJcy2LW733PH8Hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blk2eWJtelNnR2liWTlvRVp0K2VRTFBRWVJhNlBiU3dmR2l3SlRKamtXQ0pQ?=
 =?utf-8?B?YWlrWjJFOVEyTUhXY2hubnF1NWtDQmowL3hrRzgwNDlBNDVBVEF6eHVKcVdQ?=
 =?utf-8?B?VjVFYXRWQlBiSjJJNkF2SWU5Ry9QUXg0MjlZM1h5Z0F0WHFQRXlZOWpsRzJP?=
 =?utf-8?B?MHM4T2wyc2dGRCtST3kvbmpZU0FRd09KTDVhaWpDa3J1OUYxMVhpR1R1TGNI?=
 =?utf-8?B?cWVsNEc4NUgvN1RscUZiVld3NzRweExZdlRWVHpPbGZoekpteFFFMm1sdzdP?=
 =?utf-8?B?M2UyYVByZUhNWEtoZjE0a0FKZGNheER0dmlxOC9CVkE0NENnQ1Q3c2tkU1hv?=
 =?utf-8?B?NE5JVUlreWlnZW8xbFIrajZTUkdKc3lDTDBOcnVEL24wdHFtZ2tEL1NJeHZX?=
 =?utf-8?B?YjJqSVhYWjhIVHYzLzVjQlVNUGFYZXNoTWtHeDVUdVE2TktDNXM1YllzN0ZW?=
 =?utf-8?B?cWFoOGRjb3N2dE5LYng1dGFrRlQ5Qm00SHd5ZDhVK3B5T1JsZ2ljbm5ZbFlJ?=
 =?utf-8?B?eGhOOGpjOWNjZXdpWHFINGhoVWhub2hYK0FpRDhHRnh2bGhGZVZmU01KZnhm?=
 =?utf-8?B?eko2SStMcmdlQjRDcnQyOUdrTjdYelRNdDA0dGNhWUxjTHlLMEZQSHdlRktZ?=
 =?utf-8?B?bXBFMTlxakhQUGNxbzBkSlNXK1ZIT0RRaFdld0JqOWk3bW9TMWloOU4yOUh1?=
 =?utf-8?B?SVZpSndhbzlYTnhHTEZKaXQ0WmovaE8xeVBLbmVlUjZZVEltV3Q2bk54TlZ0?=
 =?utf-8?B?V0JkK0pPN0dIVlUzRFE0cHpzZ2VjUkpNNWdySFBLeUp5bmFIMVVNdzY1N3Q3?=
 =?utf-8?B?YTkxOGNYUnlVYjk4NmJvRGhOYi9MbXJ4a2xuSzl3UkRVanFkMnZybDlwblRE?=
 =?utf-8?B?OXBQYTdOZlE5UDlQWFFGeDRmWFlpUGsrSU5PWWMvTmZnOVpqTUU3bEpUaW1i?=
 =?utf-8?B?Y3N2R09XS1RkNkZVQmRXa0tJb2VvVUkvbnc3T2E3ZkxGZElMZXZVay94aEtp?=
 =?utf-8?B?RVFtMGl5Vmo0Z1dHa3lqWFZLWmtuS1pVMTNEVllEVWpraEJDL0FVK2o1eitV?=
 =?utf-8?B?Uk9oS284b05BSE9JUnJtRDdQT1RyRlo2WjZZejlzdnFMQ2wwRys5OHpGNDJp?=
 =?utf-8?B?Y25Eais2VXBjVUIrTVFjZEM3QjVGUWJSTitZRmdjTW1VNXlOVDNwVUFrME5G?=
 =?utf-8?B?NzR5Y3VyZktmaGtiZ0ZYOWhzWWQyZWVsYy9CVXNyTUxsRlMrTjREWmpheG8w?=
 =?utf-8?B?WHNoS0VQSlVDNVRuM3NlTEowZUFFYUdxS3ROaXRBNGVFK2pRd3hxWFFacVhU?=
 =?utf-8?B?bFZBMmdUSktwTkcrVmlWZ3JybUR2RzhMdVRNSHVFRy92UVBWdjA4WktXdFE0?=
 =?utf-8?B?WnhOajN2WE1Na0M0T08zV3BLZ1JkY2o1azNTSndUN2NNd0kxTm55cmRRTDdF?=
 =?utf-8?B?bU1XdURaaHdVVTEzaFRvMU1nMzJtQWNZa1FXWjVtc0dhdys4RWN3Y21UUW9X?=
 =?utf-8?B?czd2YUozRWV0Q0RwN2VuNTJid2J4am0wSFhUeWJuaURybGg1TSs5ejFEbUNh?=
 =?utf-8?B?cVBCRkdCa3F4MVh4MGFVdldKVVhPaGNPODAzdmdvbEFXNjRPSTM0c2FqL1hE?=
 =?utf-8?B?ejhMc3lsd2lFc2k4UmRNRlFzeE83OTJjbUJUVXZaU0ZYQUo1Nm9sa1FPWTIz?=
 =?utf-8?B?TjBwRVROMXFudU9EeHZnK0UvYXg4Y3lEVU9uQ2xzRVFQT3hMd1BIcm9Rc0ZY?=
 =?utf-8?B?ZUNaVDVDMEpZakgySjVlNnUxR0pGSUlQMUNONTBZaDZWUnJzWUlZTUU2VnNW?=
 =?utf-8?B?R2U3TmFQVmlSVG9VTHFqR0lDbmpWeFU5RmdTdmg0OGFHTUZ2UEVnaU5ZV3Qw?=
 =?utf-8?B?cDlQSFhnaitvN3h4RHNuamd6SWx3MTJQbVNzKzczUVM3ZUlzZUZZQnhieDJq?=
 =?utf-8?B?ZGpnQmo3VVZzWmgvYlhIbXVmdnRCajlWbEtzRDFMU2E4Z3o5RFBjaHNKWjlO?=
 =?utf-8?B?SUNtRy8rYWRoc0FscWxlVGpCRnJwdHZ2TDVUM2VkUk1ZQ3pqM3IrZXArSUhG?=
 =?utf-8?B?Q2s5QUExQmhnUVNXYmpvTHB4NjFGcnlPOEhaQXpCVi8rYTRDY2pIZUE4V3Ir?=
 =?utf-8?B?WFR3UWt5cE1lNTg4NE1BZCtGbVo5QmF1ZlpjV0NzRXZ1ZnVlTWNCc1lWK0wx?=
 =?utf-8?B?bHFMOW1oTFlqclh1NVRvRXN1QWdoZzRHZHFFTC9yTTlaUUFjZFNwdEc5blhv?=
 =?utf-8?B?dWRCUFR6Q0Irck1KTUxDVlUzNDVwNE5HRE9VS1NSNjlzOHQ5Ulg4T2RVMW94?=
 =?utf-8?B?akFqNVJ5TkFRRU90amVKWTVZMU53UHNjelRJS21RbVluSGlpN1dIUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a7bd56af-aff5-45d1-d531-08de90002a7e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:05:52.1290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNwgwNKeEj9HcA1zJsBhbDc8lSCGEGtasxYBrHjicjEfmO8jKb65DjmVtqvKJ13btLpceZdFEBbWBKdtfT509w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6112
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12531-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 1595637D529
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> There is a workaround that has not been needed, even already after commit
> 08ab786556ff ("rust: bindgen: upgrade to 0.65.1"), but it does not hurt.
>=20
> Thus remove it.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/bindgen_parameters | 4 ----
>  1 file changed, 4 deletions(-)


