Return-Path: <linux-kbuild+bounces-12518-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANQWLtEkzWlkaQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12518-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:59:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A94237BBBF
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 15:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34ED8315D62C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA53043DA50;
	Wed,  1 Apr 2026 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="unY+yv52"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022100.outbound.protection.outlook.com [52.101.101.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36A42882D;
	Wed,  1 Apr 2026 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051086; cv=fail; b=tviXv964kwDrHNZoEmrQWmBOr03TCDxBgaOBk5ScTUxjEw3sFFfGmRuRQcN6ZCNusjv76yNCloCL5VObfC/cmHGQ2ImVNQsB163inD1yErPasv187NgXVBAbYQHsyl39RWLrCrD8DZ/PeKY+aCSA67EppPo4s+gAt4Qq9S0Yh8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051086; c=relaxed/simple;
	bh=O1O2Y1Hn+fmLrTWFChJxdlDHta/T9VgDIs8tVnCH5YU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=fzVF41QKHFL3MFH9O+huMnFrmB4/isQeJVsXinJN5z/nkzbZcK/Xdt48DfY8opnbmts9qlQDrdduEgwMNZktjxD2uoAVDhWMMB/lP4kSJsKFtWDCGSCiR7VK6qDykprd3xc9Tg7RO8+PBv0Y1P0GFg4JX6hHlM6Zse5bu3kDfX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=unY+yv52; arc=fail smtp.client-ip=52.101.101.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhYBqqc625m2MuxcNUcCm1EE2jjthg5Z79o2zG7+8OkeiqOuxnos7hfOyJw9xp9IuD8qrn0zo6a0+BAtL+4jl1CzAfuM6DCz469W6g+qqp/1LYLOSriIlGtfa/zSR8c1QKuitkI4jnWo6ve/gU2zQnukfcdYKpXd5sivXsUeWcp6WEMbQ4uiR+6gcrUK1iTNeNH73iwiCcAkJOpEe7xq0G47U2KOgq86XVh7WEOc1kvnfzPvHPUgnQw+pwiqx6M9Fx0YVgxoNJMurR6qMdQgBQYnYw0CLW+77EuRdLrWa+RsR2hVakL8RkdfpNFDFfQ0U4ibIdvGmPgYmSKoG3ssdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjQ03GN1cGoxVTQiR37x/WF81BNH9NkMfAVaF/ln54E=;
 b=M/DA0nqB06nvRay7yukT5JJ5s0MXT0JOz7/x3uJwteExaKmPkGG/L16ApoEiaSYHaASbMMkaPPPewJXAthXkHJpM8iMKrokx1os9kGY37OkedL/xJla2RcZN8lWDvijpPE311U+XIUvJeVH0t/lSHctuxdfvZwn4aGBWwtiA+4Z2Ak/Pmlb7Oxs0CrIL5dy7nRFJFiE2JhRmc0Tbbz40e01kJnKDhgm+j5Gu+5KbN276f6NwbNKBqgtjgOKZJDjAujzXQxW48ZivWeek5oWQl9hsTXHiKtftyZTfzOFobMZbdClczTMHrhVUiIkUnF23ClHv5IduRjepqpWN9y4jUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjQ03GN1cGoxVTQiR37x/WF81BNH9NkMfAVaF/ln54E=;
 b=unY+yv52v8x0pKHs5oExakc0Y/jKIhJeIy3vV1uB0fvee5oVzQZIdEWt05AqNVwIFtJJGB9qe8HW0GDVfNdTN55L09arGlk9QdZfmjFPYuJCAG7h4WYkoe0g80vegd/SILGSZi5RfFhPUrbBTNQWSIYnmt+RaMr6hYgR96WVJeU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5811.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:265::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:44:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:44:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:44:40 +0100
Message-Id: <DHHV3D4H9Y0W.22GPYL889NZ4K@garyguo.net>
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
Subject: Re: [PATCH 06/33] rust: kbuild: remove skipping of
 `-Wrustdoc::unescaped_backticks`
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-7-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-7-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5811:EE_
X-MS-Office365-Filtering-Correlation-Id: eba49220-1b3c-4171-7cce-08de8ff4d37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	i40V8I5W8QazNsIi0ZpFRwWH1cv+AhNVn9DwazbnE7QXOaNiGSwljACMcYtYPGRhkj4quWyZU9Lz/Xj+gIrzXRJSfmyyl72vO5mViJmR+ur+E9Oy8GwAJoM33imAlavpqxJQp1aKbI0iAGKG1OXKYYBubQR2b8MFjfKyHFwERxCXY4/rUgtwBg7hpqoxFi90LYXAf36S9Fi7dO5HvLPMg8H5MoVzo1Gi0Kr3l1Nc+dQYVgGgiAcA7vr3NcpcBCiVEu/YhfIZ1C0CI9vaBvjix0R0E5jifYr+FniwqiaIuCT4hn0xizcg701MOgBx6lSt1eT7pSDe6dtPKuJfDG+LMqq0SyxYM9tyJrSmBbHjfWRy7B27iESxMquIngfHWxI6Bgt149gCFrrPI9zw8xG6YOgvilv5uRBoyEI5mnnC2t9PXjsPvOUWOKJH4YL+OguF1B3EAlYMOUh32ZitYLQA/7hHHZLYARL93nxm7hGmn8rrUMOhJSKr4YMn6MYJmbGeabd1+uGAQ40/3MBCcMpaP4ihy/Y0HJr4uq2rHDOHs7rGveFcKjeGFyrV8cvEwYiSHEnggBNA41Gj1AuII9lUfgs2IYKGGWqasahq+hb6FZ86FTUWnzToQPsAN8OqvCdUH2ohlnPjnY/bHryIM7CBmAbr6EEe3qn9ntjvZUA+LWenX0IdAaUFN38fpNuh8UMwOHIvH6yacX2h9QhzBTLuVXdy4cOD/QFNpBukANa8M8hXF0TFDZmsHfGcXYE0f3PB/DVpo9+3gjrHKFEYp0wdUg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpSN1ZRZVV0K0xuR3hGT1MwN2t5aUJScjUxcENPaGFxQmFvN2xDMmFoT05z?=
 =?utf-8?B?bE0xbS85bjF2cXNWOVgvZFJLQmpkK1c4cUVDVGtGVkJ4Y1phZ3ZOcEQ5WENN?=
 =?utf-8?B?ZE5EMHhGU1FVUGVHTUl1NWtTZHllTXVHTGtsNlFUa21PY3lnOG80T3lpRm1h?=
 =?utf-8?B?VS9KTkRlZ1BRdDh6ZDh1NUpaTW1KU21kczZOcW9aUTZZbk53RVNTeTk5U2wx?=
 =?utf-8?B?MlFyRk96THJZRS8rdTQyTkhXdm15Q0hmS0RKTzFZSzFYTjVPUlJUYUM2MTh2?=
 =?utf-8?B?aXlGZitaRmkzbzBHWEszWVZnNXJOcWlCS2pFWmdoNWJQUXpTdnQwOFRMKzkx?=
 =?utf-8?B?NHNvdWhpMk5BeDZBN1BHdHAxc3V0NDQxcXA4ZVNsYTZ2bVM4eFA5bGZJbUNX?=
 =?utf-8?B?L3ZZMnVOQnBObEhsd0piSjNjcDhvQ2RVSGxSWklxUEc2VHhrdDJqd3pHRGpM?=
 =?utf-8?B?STJOUG9VSzFrWllZdTNRUkFPNlVFVzR1bWw2dkdKVTluaHF1T2VnUlU4WWRH?=
 =?utf-8?B?TE1Ybi9Hb3JRblg4WnhhUXdDc0ZzQzFnU0FvRUpMUHp6NXZSRG1yazdORmxF?=
 =?utf-8?B?STMvMGQrOStBMmdCS1BxWElicVEzVDk4MWQxa2Z2M2c4Z1JzYzc3aUI1cUNl?=
 =?utf-8?B?VEpZclBRWmFGeUpnU1FSK2M4RFF3eFpSYmVvRVdWeDRnNXkvdVRYaGtTbGNM?=
 =?utf-8?B?ZmdnVFphaVBOUjFFeUF2Wm5ubWM5eEtjVWFqejc1VWlCSmJOb3g2NlVwcVZp?=
 =?utf-8?B?YjVCVGdRRzl0RStxQ1RmU2haV0RKWFlNUDNlcXEyOUpmNkZ3QnNEekU0RWVU?=
 =?utf-8?B?aGw5MGFIV2xNNGtUTFhzR1pXUVdEczJsR1kwWXpVaEZkaDlwRWRnNk5Ca0Fl?=
 =?utf-8?B?aUxRSnI0R0RQcmRmSE5vcFZ4OFBHT1NhemtlbDJXNGdQRkIrNWh1UnYrRHNI?=
 =?utf-8?B?c2JsdGVxZVBWamg1MXhzb1AxMGdhbExDeUxHaytiNmVIWUpDamRsaitNUzl0?=
 =?utf-8?B?NzAxRncwZWtERC9VZGw3ZklpNjVMRHdodHJoa1BtR2RqNEx0NCtOdC81SFRY?=
 =?utf-8?B?UVVnSkE1NUlpQk9OTnFMcE9xV2k3Smh1QXdGN01ueTdRUGMyTktLRzhBb0d0?=
 =?utf-8?B?a2g0SGRpUUNYeCtlMHFuVldMZUJyRHgvT0lmRXdya0dsRjdIZ3Zwckt1TUtn?=
 =?utf-8?B?SjFKc2VheWVHc3hUQngydlZVaHRGcXB4ZmUxRE1ZWHBDcEJZYXYrZ0ZMUGQ3?=
 =?utf-8?B?aFRWdHpnbnkvdXdQTkl6Vm1ZYXdycFFjZnRobzZqWkJqRDdyUk5ubGh1ZjU2?=
 =?utf-8?B?eHN0dnFuWlZzVVl4dVI1M1lDNjd6bXcxc3pSL2phY1o1SDIzeDg2MDFBWXhR?=
 =?utf-8?B?T2JjNmpOM21ENCtKVjZ6WlNlelpLZXU3K3ZmVUlFaFVXUG0zSndmaGJhWkc3?=
 =?utf-8?B?RUk5SjI1UzVwYllMOWtLNCs5cmpTSDBrWEJCYXYrU3FmaUVabHNpNlpjR2ov?=
 =?utf-8?B?ZTEwbDJ0RW1JdGVLWkF1NGxHZEVKUTlwcXM0aXNEVndPUmFvSjNkWTNkL3FL?=
 =?utf-8?B?WGR2Q2dPSHVFYzh1ZlE2dUMzVmJ0RUVGY2p2WnlhbFozOHNDbTkxMWJpbXdK?=
 =?utf-8?B?aEdodVdCVnEwU3FURUp5MWl4a3dGL3BLOG44elJZeGpnUVFvSXc2RmZJN2V2?=
 =?utf-8?B?R0V3cFpEcUdVcnZRdE95b0JuRnhHVURzcGZkRGQrd3RpRlJpQTh5MVE4MTBF?=
 =?utf-8?B?aVkrSDFKWjNidVVUOC83WFVNMTZ4SCs2cDZPckxEZHFtbmxLWnRpbDkrbjhn?=
 =?utf-8?B?MUZ5K2hUQmJKaTQrR3pOSkR3Rk04VU1pS3VjV2pDSi9aT1Fnc1BXTlBUR3cw?=
 =?utf-8?B?dnZXYkxERWRvU09yZDlqOEFrZHpOakJzVDhDTGRPNVIzOEF2bDhITjRhWGNN?=
 =?utf-8?B?N1hMQkxBWCtxdy9yYTA5TkJzdUNpeU9KYkxYQ0w3MEhyM3E0U01VTEVRZEJs?=
 =?utf-8?B?TnhwN1R2N2kxYlJQbmNRSGVJT1k3c2VKWlJQQTFIUDB6MmFTS0lBNmplYmg3?=
 =?utf-8?B?eUo3VmdiTHU3bCtQKzJYSFFJcG5INGxUSkJydE85dkFmdFNQcDJ3eHYwMjQ1?=
 =?utf-8?B?bXNxaUtvK21MWjQ0RDVVSG43R3dZUXN5NHluNVhxWXhxcmI1WElPdlIwbmhT?=
 =?utf-8?B?bFJoYjRDRjUvVm80d0o3N05odHR3eUVvcm1xV3hnVWZsNU51SUxTeGtIUGlH?=
 =?utf-8?B?QTErT2pZVW4vVENPVHloR0VFVzJiQ3FPZlRtZjlIRE0yeDI5cVRDL0pldkJN?=
 =?utf-8?B?eUZyc1IwRjRISnBXTUhScUFldDdNdENzL0RXeFpyT2VFelBscTBUQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: eba49220-1b3c-4171-7cce-08de8ff4d37c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:44:41.6949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87lJJSuAg7hy8Nq3Qzj4KnBP2l/3dhgMlEkT4f9mODpVoArZ8PR8d0c1clwKyhtIYfkYrjgMD3h7MK9jePdLuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5811
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	TAGGED_FROM(0.00)[bounces-12518-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.869];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5A94237BBBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> Back in Rust 1.82.0, I cleaned the `rustdoc::unescaped_backticks` lint in
> upstream Rust and added tests so that hopefully it would not regress [1].
>=20
> Thus we can remove it from our side given the Rust minimum version bump.
>=20
> Link: https://github.com/rust-lang/rust/pull/128307 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/Makefile | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)


