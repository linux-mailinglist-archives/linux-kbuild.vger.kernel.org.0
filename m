Return-Path: <linux-kbuild+bounces-12681-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBbQG6/50mkXcwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12681-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:09:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E416C3A0CDA
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDB6730048F9
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 00:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5E518AE2;
	Mon,  6 Apr 2026 00:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="i+P2r/qq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020104.outbound.protection.outlook.com [52.101.195.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379C29CE1;
	Mon,  6 Apr 2026 00:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434156; cv=fail; b=UwHBuQ8DatuBRoJP2RJSdZa05QoAWoU8kjLVuFA8LKB3dXBSUYSF1Sr1kQVXuM8aN6nGIQfn/olTKMH1WPEGWaJ04eWRdcsWhW+Fdy8EQs+HoiPkg2VHm8j7J++IhXZxMpF9dZzUWlZ9dg4mCs0y5OzCygkaSraeywSfG5sZV1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434156; c=relaxed/simple;
	bh=PE2j0vrsyeSI+0KJYgPlLcV0f5E3KheYJDbCHCRoaww=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GfYm0cLpaOFEHgBxGZA8QpWhcR9PhwDw7jTaPclaeSXl9fZj096kzqdX6j/aXw/CMB/2VKw6pzXF1EVYQpbO93ewwgu8CrhYobFsUAWMJ9Ua831ehOHwFvfe1sPwB+1zlSRQoUn22m+ffafuON68kORx5mT7h+kkyrxSni+ZDjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=i+P2r/qq; arc=fail smtp.client-ip=52.101.195.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ro7dA3iFxTBK9c3AFkInmNJf9Acv2LTKbqM2cgj9NKeqRH0clwS2GqzO6DtcuUlDqNgjGqnMMzWV26QRC1OULrNrdT9AvpYFdM+KTGNDojFbiDtYd9+pu34W7Gi4AIxVGdnmjDh89EqOGwPOw6H4QB5n/MLlO3aZkV70s2LnBhsgyE/Eou8hueRFp1PwLPyir3MEPfnkL1Eur/hOLamgSescmlMYTugDpeng7MnPDx5uDJ4efgMLC7SBmEUmsxnqWmX1RagFr8qGetbxZdZBV+L9hiB5+kh2OMLTkNMwOT1Wy+/ktV8cqB+Wlp+OHZLgYU+kpoGr/2W5+IpC76ut7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRzIu6sBMia7PX1fMw1AGKpctDdUZfL+eftZEQVOsHY=;
 b=H/yUZ+cTGpZg+VK/ArGk6RKUvR0Ek1z4kqQDIRNL0y3AU68qrQzxF0tqY2xNT4f5Va3LsY1SK6qZJG1yyV7nR51e9lWUTtXotnhUtp82MGHT24SBeaQRL1rDk7TacZwp8G8cpicmZvmxckmpjJ8MM9YIhcGXP1H2E/UO69Mlg0Ok41z25/i4Cf0VeVME6eKFhRYcKXKwaINJ4IcJsR7b0nEqnGg1S5b+BpqoJ6RiFCVss9VT50IWXmfdOInRZ2OQl49SR00/Ogn7sNBygPF2HBMxefSPoZVA3jBGsexVQgENav+wAOcjyzTn6Or3Bff8LUx9+t2wZ9nkDtnG240Ucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRzIu6sBMia7PX1fMw1AGKpctDdUZfL+eftZEQVOsHY=;
 b=i+P2r/qq77hUUK80X08pDIl2STq5KTLp5qCHQwEt9gzjz/euyO8uUUk6XMLNkI3VEGrNvsnWj+6UAyDBVKccOF+yzmmb04DQBvOJ1EkGMg+iTM78ubNEk+X74Ty5/b6VEeT3ougIrwLpHrJFDjvtN8oGFKgoQ6DtHbW5gpZx5KA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6978.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 00:09:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 00:09:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 01:09:09 +0100
Message-Id: <DHLMVOOB2U58.1M64OYVFFTLV@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Courbot" <acourbot@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Christian Brauner" <christian@brauner.io>, "Carlos
 Llamas" <cmllamas@google.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Boqun Feng" <boqun@kernel.org>,
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
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
From: "Gary Guo" <gary@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Nathan Chancellor" <nathan@kernel.org>, "Nicolas
 Schier" <nsc@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
 <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
In-Reply-To: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: ae1ce629-83c5-43a4-e992-08de9370ba85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xOp6a83gBRdLE4U6obQUBgYLQ0MsUt22RLTUCkr2T42n986JVcXiVcPU+lF7pKnQHBQwhaFqpxv3hnZOudRy50FvOInCwnSU187m/AQkE798W0yPc03kHqqmbmWmNb4SfCj/IZ8gPbt9D2T3iQuh4xuaW/tNvPNYwJyBlen4HIyhA59xTt2QjiMjVt2NY5cOj0bNcCYhWq0OuBdCXW3ZaBEGWewUf49+HG08va//r8MXpCaZUib0wjBKx/7z/vx7L/nDMn5m354g7ZcC36UPVTdiHT1YS0MDBur+dCj6NgWVQg5MJrwjbUwlBZ1ONfdKibzy4sifUPwP7K9ObGEQB/43aW/cNJUjC64eFZo2Kw9RXG8zaxmceJpCLndhd3lEfgopIhX2amxf3LMPaHKeRTM2hFTyMX8XtWvHPgm0S0XcSLcqGkLLeoZBuh4ElKh0D4hiePgwY+KKJaZhnkaUK4hab2rl++lkEswLobGWkjrpDaXJlYv9C+2bM8ntHIQXm/s+6xrI5+izsBSrJL3HaG4WwoEu9mtEvcQ15GWPT4zMPhcE1cMQLM+lrmCQi2M0RQcD5nzGnvOysJYSxBGrOBs75k3o1oFeliLsM5EGeA4wEUYBko85L8PhUbOFHt1oMxh7g1rJeUgBKUtGESEwFOJP8waAty7hoNQ7F3K7ywBvbmFqxOwaDrPgXJOb+x4tV6GNexuXZxpBICipFZCa5kFo/s3S2w6U+4GnX1B8J18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlFiT0JhckFOTGZycFYwdjlBeUJHczd5WnhOYkFYM2w2Skx4ZXhJYmlvY01O?=
 =?utf-8?B?R01NNTZyeC9KWkIwM0xFZXozWUhkM3NxZDJNM2JEcFFlaWFFNU9YbXArN1Fi?=
 =?utf-8?B?L3lBRTZDSzMrNFdWdHRmWmg1Ri9QazBUSUdKb1U0aDRvRWVwZng1K2lZdWhp?=
 =?utf-8?B?T3dKQ09BM3dDZ3RHYnVnV3pWbnQwaEFhanRoY2RvR0k0TUllb3QvZUYxYlVZ?=
 =?utf-8?B?SHUrL05FZVAzR1pUUE5sb0RhOFBkcVBkcG1YYlRNaVZxQkNOTlZ5T1NyZEVw?=
 =?utf-8?B?RFlRSDhmZm9SSFhmV2JWeUJJdVJ4N0JUbXYvV3ZFeXgzYTVmMHMzZlpaY241?=
 =?utf-8?B?KzdVcGZidWJMeENzMVdaU3N5d0pUTFVCNHJnK213L0daMFVLZVZqMWJrZkU0?=
 =?utf-8?B?dkxGUmxhdi9mQ0FDQnRYR1ZQM2pDOUlHVmhscndWdzZYbFFBWXlLMXJrNStC?=
 =?utf-8?B?b2JPUVBBRXhGdFpjRm1RRnN6OXV2QnhEa1FXSXFOZTVVR2dPWTY5M3ZOWFdB?=
 =?utf-8?B?d3RLY1VJNHQwYmEyallySHFKb0FDWDgxVkRHVjBaWnB4T0p1V3JoQkRlSjlG?=
 =?utf-8?B?cnpDL3lNbDF1THpEdUtYR3B0SzN0cnRaQkV5YllkNDZQVDNFQmZNampFOEts?=
 =?utf-8?B?WVd1YzFWZWFHVmg4Y1hQT0t2Ulp6NWM5SU0wbk8yWm5XbVMwTjZnLzhtdi9i?=
 =?utf-8?B?dlBWaFIvVmoveWxPdDhnaEp0UE1hVENrU0dSWERaNGp5NDE5UW5QUEtLNVFM?=
 =?utf-8?B?TldSbGZaYTAvdmF6SlVObjJZRWRLRzl6S09pdFQ4Rlk3ek5oL293L2NDb0NS?=
 =?utf-8?B?V0prZ0xGUHRkT3prQ2tLS29JVGNzRjJnYW94ZForN3pQWDlJRkNDa2FaRmI4?=
 =?utf-8?B?VTk2MDBjZ3h3UGk0QmhlbFV4ZlEwNXQ4R2JiRzdFeC9UemZNcGplYXpSS2VC?=
 =?utf-8?B?SXd5SmZvNVZ3eWJVT0h4VDJDQkpqK3V3L2lyRXFWZm9aMXM0Qm5uRVdzMkRK?=
 =?utf-8?B?QzJ6OFBYYkQ4OUlpVS94cnpGa0tPQk8xaGlMV0pUWmhzaGV4WHdGclpSSjdi?=
 =?utf-8?B?WU5OUE5tdDRGZ1N0NGU3WmpFVjRtMFlPSFNNK2xpSFluZmEvUFE3S2FJY0FU?=
 =?utf-8?B?UDFvdkJsaGUxbGR1TE9FMzlMcTN6TXdmNHNHSHpuMzNoYTlZYWpPL2pvR0VZ?=
 =?utf-8?B?L1hkZzlIQTlkQitQVHJYOTlhQU0va0FadC90d3gwL1N6YkZIeW0xV1c2dE5a?=
 =?utf-8?B?bVBzbzc5MUpDU3F2V1dKbDVxY000SzJWS2lHaU1UV0NCMGNpdnNiU0IyeGJj?=
 =?utf-8?B?enRRa0MyZmNLUlFMNzhhcU5YZUgySi9PenlKQUhLSU9HdXN6ZVJPVWhpZUY4?=
 =?utf-8?B?LzFQQW9LU29ZbytFV3pQc2FvelhTU21OM1JSN1hrV1VFa1R4YW9ZTDNKY3VQ?=
 =?utf-8?B?RGtMajA0OFdqckM4VDNjTnBpNmFVaitpL0xadFQ2anBCYWk0Rll3ZjYweVU4?=
 =?utf-8?B?ckNKdG81dUxtTW5uUndQdy8reVVCYzBacEpacCtBbk1JWmRKMk9NQTJQTm0x?=
 =?utf-8?B?L3lGSHR6c1RkbDB2S2VSSHpsSGQ5TmlWOHRsZVpxM3NVdWJSVjZ1dnJ0TE51?=
 =?utf-8?B?RTVNbXUyMDRsZENRU1JpNUQ1VjZnMUpjQzY0dCtEUDN6OFU1djN1TXFka0pt?=
 =?utf-8?B?elp6TmJiUU5Xa0xlM3hpcko1SHhqa3NVOUdxUnQ2UUgydHU5ekdDTUlodEVm?=
 =?utf-8?B?alB2c1puTXoxOUFqMlRBRUlGV3F6MklMMXVCZGxzeWw4QVFiOEM3SWhwODdO?=
 =?utf-8?B?T3J3Z3dDWEMrQ3doVXo0eHRQaXZQQmxpZStFdTZzNGp1ZGpYeVQvU2dhbnFJ?=
 =?utf-8?B?TmFNMVNhQ3I2aFFEdGRxTjVqM2FIVVQvOElmWEkxdUZlcW9Kd0grc1doYlZu?=
 =?utf-8?B?MHM3dmo1QS81S2Jydm9QN0pOSmhTazZKU2JkbjRiL2hFR0l5ZHRRbWMwUFVX?=
 =?utf-8?B?enM3aldKU2RHNjJCTGVFRmZBanVqQnY4QkpjMkdraWlEeE9GY2RvRzBkSVhj?=
 =?utf-8?B?d04xcHdDYkpCSGdCeWZqRlhTYjNQM2c0QTJTYTNDcW5TR1YvR1pKVUlZZ09P?=
 =?utf-8?B?WXgzbUkvMTFlNm8rUDE1MnpMTVFKZWlLQXl1YUMxdEZhMVlGSjNYSy82b0Vn?=
 =?utf-8?B?bkpYbHd1WlpjeDVxamU3ZzNaSDRmRFFZYWMrNnloWGg2eldCd0FpY3FiVGg2?=
 =?utf-8?B?K00wM1MvbXlXaDN3YlBFWW9yQzR5Wjd0eXhYdVRXbGY4K1BaU2hvNG1WMnFu?=
 =?utf-8?B?dis1SmRhT2hrSzRXUGg2M0xxT0tYMDhXZ2c5a2lUdGtPT09aMmt5UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1ce629-83c5-43a4-e992-08de9370ba85
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:09:10.8936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xibHt/6xHNPmHv7kfNUTOoVm+cKBbIz1wKOlRe8A3s0RzdkujYdTmUU4jOfyBimzRen6gBPBAFqmNMrwr1yp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6978
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,garyguo.net,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12681-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E416C3A0CDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Apr 6, 2026 at 12:15 AM BST, Miguel Ojeda wrote:
> On Thu, Apr 2, 2026 at 12:28=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> I think I would prefer moving these down.
>>
>> The current approach append the flags to all variables, which will cause=
 the
>> following equivalence to stop holding after the flag update.
>>
>> KBUILD_HOSTRUSTFLAGS :=3D $(rust_common_flags) -O -Cstrip=3Ddebuginfo \
>>                         -Zallow-features=3D $(HOSTRUSTFLAGS)
>>
>> (Per version flags doesn't go before -O anymore, it comes after HOSTRUST=
FLAGS).
>
> [ For context for others, Sashiko reported the same and we also talked
> about it in a Rust for Linux call. ]
>
> I have been thinking about this, and about potential other ways to
> achieve the same thing. I think the best at the moment is to move just
> the `$(HOSTRUSTFLAGS)` below, but not the rest.
>
> The reason is that it is closer to what we do with other user (kernel)
> flags (e.g. arch flags come after the general ones). But I am
> wondering if we should/could set all the user variables later in the
> `Makefile` in general `HOST*FLAGS` later in the `Makefile`.
>
> In fact, there is already a limitation with the host flags: `-Werror`,
> i.e. that one gets appended later, and so users cannot override it.

I cared a bit more about the code clarity (where appending to all variables
feel like a hack, while moving the code block is natural).

Best,
Gary

> [...]
>
> Anyway, for now I moved the expansion of `HOSTRUSTFLAGS` in v2. If
> Kbuild (Nathan, Nicolas) think it is a good idea to do one of the
> bigger changes (e.g. for more `HOST*` flags, appending it even later),
> then we can do it afterwards.
>
> Cheers,
> Miguel


