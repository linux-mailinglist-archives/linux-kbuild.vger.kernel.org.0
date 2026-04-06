Return-Path: <linux-kbuild+bounces-12683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ0sBdX70ml7cwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12683-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:18:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF70B3A0DD0
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F0303005752
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 00:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62FC112FF69;
	Mon,  6 Apr 2026 00:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wzXPFRqw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021135.outbound.protection.outlook.com [52.101.95.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF4C39FD9;
	Mon,  6 Apr 2026 00:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775434701; cv=fail; b=CPAn/LtCTDX06PT9GdZKbHM/+lv3HwtoA2taqicS1PJzI0ZBFnntrXUlZHcOwgrcsHJZuVs3wHSxM1GEk4XAW2CUelds8T6szpQHJWiD7pMiyJ+z0jjEB/VhY4zu1aHVcuO41zCWFXxb+AXPDRs001NaNEEMlY7p2Rxj1BaBkak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775434701; c=relaxed/simple;
	bh=y6tt0I6FSE+ohmJ3DYgPNKA1XpFe4oVP4ykTiASpRHo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=OpB/bDXipswTekP5i9h/Xh1KdYCyzdMEcSGbVI63BZPpGYx/rQ5UWD+QYgD7YBXKV1eDbfDVi9TlFOk7HGi2oRGv1Jyov8wvUpuPVWFKg2s+INsXNiQQHDjWIJNDP+CaAE1Sp/4XeSVtNBXr6IvVHRjfXZl2pQ9sVqT+OlR6sy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wzXPFRqw; arc=fail smtp.client-ip=52.101.95.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQWlmyV+zOWpamyQH6iN0geKyiRr2BqwEGekBQ5Lm8c6iiQDuQoRF7OAs5HywlnZjLYIJIobAMrMSNa/k2fkAk0KFV/HgW1a9Ybs25EMoBmwxBbfYDQY7oDqk4RQobkF1VBl0MxTInwzzf6uCXC35B0QTT0UdPHEsHDSDczWnbN0ojop6lA7jDaLCg36ZLTCZ10PeqNBfUfW9cL1sSERs5y2bVOZV7zqwK1SYCIA6aBWHLtkrkZBg6bAZNFLXaWSn9ZtlF67d+ZUxsiyhR9ZHE3ACQzGW54HbNWYmproP2ouC2UAEA3sur8ndNE9Rwc2KlWGjQL454Kq0hvwqRi25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omNWnIAVZkrgymVA/7BYGQL3Tr+Bj4SrSWGDmQWd6wY=;
 b=EBSXEzuNtBlB/hgxCKhkmI8sIJKMZ1hsi5IZ+8ZTSb+ptKo9h2rKyiFrgpJ3Kov5+UySKOlzQhGmxZIPrTUBeGi5BuGrPdSsSTg0MzN6gfua9lPmKqnW4Bailq9fQ0CJqiq6Z/ZCwvS9sgHHjow3S/InNbXd6EVPh6S9G6ydkj8z2TarKnoov/x4h/565YONCc9mOKI7F1PMpUFP7QEaki1/jxFCM/LGv9nMiffKAb1Yox/gM1K1DsLNRQ5x/gqpiaKRSxyav9F4+XxlgIqJwdX+7QWMMUtIK528QUpgVwb8N83pV7e6uqCO5sbeuEntCWEqnWxSLela53tCDhu31A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omNWnIAVZkrgymVA/7BYGQL3Tr+Bj4SrSWGDmQWd6wY=;
 b=wzXPFRqwQTItZW6WV0Jz3VPE+iswsCf1rjtgxcj84hReubFjPbvgk2T6CaK3V27LjWEZnDXO2j9lcdSBQVyZT+qLPYo8/iqed1vkngU3erewey856i1GKYfe0081FzQIAko7+zccyO3Yrw6iEvXRAIqyDeLSgVlgAWsbhe4ukq4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6050.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 00:18:15 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 00:18:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Apr 2026 01:18:14 +0100
Message-Id: <DHLN2MQO6RCH.2ONELHUJ5GXEK@garyguo.net>
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
Subject: Re: [PATCH v2 01/33] rust: kbuild: remove `--remap-path-prefix`
 workarounds
From: "Gary Guo" <gary@garyguo.net>
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
X-Mailer: aerc 0.21.0
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-2-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-2-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f075b8a-812e-43c9-afa4-08de9371fefc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JPVQIlKICC/Q0o2c/os6CN0PAsqrm4sLKIuSxKPfmuXATzeul4J2oTtx5DZiXwouIoGH16KPy4ZBbqA59IZeP4hBpXZ8mbFZiZNmXHi+Ry2UimbtjbdYTKEdt3Mz7js8B2B6k53sLpaTwK9MWi5AC+eaBSLZyL1ylAOUyenPzx1RPmtVunf6YiwYuFrpvQQmLqYSPytt82ByBmLzeokL82M5oPUkkfcFf986jeKUyHWkNpJr7rWr6y6UaLXv/+E2+JzRMCsaC7MVd+GVsxXGLzVkhi+DxWO6eXbRZTtMesai8pXnKFLZ3OfEG53n+rUlx5Ai6oMHlh09/Fb4hd+yffxYASg9Nh+VRR61zR4K71EaX8tgWdC7JdUk9srR1rLUzLxi3e+qWLJync7YD9xvtj6UHB5IrII03tMe5fjS17WNNm2j5+SUFIf/gc4uf4qsf0cqoDGOEic99x61+w+di/UMXWY3GVQCQNvJewGAaVNHvoCghHBJE0h8+zzjVu5KuUqKEX5Az0uEqv+2vdIfxmkNrQ/GZW16vge2i4XDlO7CLcffG68J2TBIUoQfjoVsn5tBlOX9ko1wuW8+rVeDO3GTOXn1juT5WrrAjOevLBCe+YfTCWoM3cNUAIndSHKJP0A77T+99jWvWPms++GST4TNVANuJc6rJv9Be8dVKegDMmITEWYTYAR1KpwQlndhGuxYqm1ag8njgfmjLvIySX/oH/KUEorXdhhStDfQ56U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGR3LzZtT2JPK0ViV2tFYk5VYmxXN0lzcVVubDlyQ0p0QldEa0dtUWRuSzRk?=
 =?utf-8?B?SFZYUVRKM0ZUWkxCcHMydWR2aHZaaU5zMmdYdXNhbUhKdUNzTEZyTmE4M2o0?=
 =?utf-8?B?Ri9nWUZQKzcwOGR3dGRJNWNVWXp5dzRoMlJIZGxodmZPKzZ5YS82U3dnOTg5?=
 =?utf-8?B?TE51Ylo4SFFWT0tySTB1a2Q2OGVZVFNDQ3A2ampnelBiWmV6VmNiUnJvai9U?=
 =?utf-8?B?cm5iQlkwckI3THByVk12R0dzR0VHL1hodFNnQlVYbGsxZlFLc3pQN0poTmJG?=
 =?utf-8?B?aXBWeDJGQXNPUVRqQkN1ZFlsZ21vajFUeDhWK0JTZVI5WG1sN0thckQxNk55?=
 =?utf-8?B?bGI2L1A3UFBUSFpWeHBtZm5lMEdtOEc4YXJVMUZwSkw1YkVZV1pkelBHVFlm?=
 =?utf-8?B?OGRKOURzcjZLRlRXVmNVa1NadDh3Z1laeTB6bk8zaFZQQTM5ODBvUXg3SXNB?=
 =?utf-8?B?TUg1emxSRlR3NERoQXV3bzFWTGl1Q243b241NytJTGZ2aCt0NTdSTEUvT0ZT?=
 =?utf-8?B?MHRBNVkyOEljS1VEc1NkZXhvbEdTc2lVa2tEQ085SDJucGR6VDZVeThMaTlv?=
 =?utf-8?B?Q0FEWkoxM2ZqZmZsVllIMUpYMDBSNXpOSWtmaW90YTVRWHJVejlUT0o4Yy9S?=
 =?utf-8?B?QlFPK0ZMcjdPQXBhVklPbjhBbXdHSUJFMWxqSjE3MzlSSGxJN0pDZnMra2NN?=
 =?utf-8?B?Z3lhNGhEOFVldndWbWhsb29Mb1lLblBMTHpLR0FxYjdVTFdqa09OR21nYzBV?=
 =?utf-8?B?TkRSMzJGL2hXTUlmK2dnR1VzS1RGV1lNM3dXb0VPRHowVXh0ajJ1bnNQT014?=
 =?utf-8?B?QkU0Q2pkZjNsVGY5SVpTeTAxVXFpY0V1N0VKanRwUk12U2pONWxPT3dpYTNI?=
 =?utf-8?B?MVR1M0p5d0p4Q3FzZVZqVkdBTG55MmNTaHlFdTFsWWR2VkE4ZG80WGdGNnlB?=
 =?utf-8?B?ZVpDQ2N1cVZEUFFIeCthKzNJWGx4bEhmNU8wYnZrTHdQakJnL1V0OUFQRjRY?=
 =?utf-8?B?aWE0UFl2aXF4cnpNb3lpU1ViMUk2RHhaMytpMHpCMFlJRXlzWEFldnR5T0cv?=
 =?utf-8?B?VXBySlFKTW4yMTdjSXB6T2tSSkgyK0JRV2tEczZXKzBic01wbnFsNy9lSnkx?=
 =?utf-8?B?U0cwTGdmMzAwYUljdHZLdVo5L05OUXpEc2dQRitPYXpkbVN6cW9lNGFGWWhh?=
 =?utf-8?B?ZUd3ZVI3MHpBQ0FKc3J2MkRrWm5ZbE9uaXQ1VlhPTFJOU3VXZXlHb2VwYzZP?=
 =?utf-8?B?cURUSlh0UTRTdG5LaHV1Zk8vQmdVRkNoUkc3N0l0cU5kcWNab1F3Ulp6QkNo?=
 =?utf-8?B?WUJ6OVZIc2Y4WFkzMFA3UVFrclFISU9mL3BpSlY3c3VINU9vTGxvbnc0RnZl?=
 =?utf-8?B?Tk1OSWJkeWV4SG9IaVEzQThnUy8xcHorTk1nYUxjbmw4SDIvM3huWW4zakVz?=
 =?utf-8?B?QlpqSEV6YklEeVhxZ1RTdG92YkhrOW9CQkYrN0h2bXVvZkhCYjFnQm0zVXdr?=
 =?utf-8?B?QlV0OTFLdE0rSUt4SDdsVWExMzUwbC9od0U1dmYzSUxOTFlpRVd2V1hmaGND?=
 =?utf-8?B?NXVjR2cwSFpZZ2N1SFBidG9mK0hIQURZOE9ZeE5mNjRLQVc3U0hlUWNYa2Fu?=
 =?utf-8?B?SXlFL1pLdFhaTkxRZ3NMT1lOc1VyaTZNenRNNWlsbDQveHQvY2lVVGJ6dEFs?=
 =?utf-8?B?by9ubGhkZ3hoejRjSEtvOVJTdkhEMTVnZnc3TGtyQmFWSko3NFlNMU5lOW5U?=
 =?utf-8?B?VExqa1RYeE1xR0RDdXdZOTdOQzh3NWpYWEZzNnhCd0NJTS9DMHRzbVBCNDNa?=
 =?utf-8?B?N0hldk12b1lKUnpaTFN4QzdTRXlGQTFKbS8zSjNZS0dVMWNQaXBHZVFHc08x?=
 =?utf-8?B?dW5kOW9odzhPYXA1US9nWTdpTFRXL0FWSXFucnBRVFMwanFMS0REMnBRcHEy?=
 =?utf-8?B?eVlhd1BsVTRBRUJpUmR0akM1TkFwM0liWmxHdzRhWmxSMFgxODJVakh4TXNT?=
 =?utf-8?B?c2phSDd4Q01MZ3JVSHpkc2JvdVM5c2hlT1dyNlk3WlptVWtDVDdaSy9iaXYz?=
 =?utf-8?B?Rk1semt6YUdWM1pXQ0ZySXVXampDVVZJUkxnK2ErMEJFaXVkaG9xeEZoVEll?=
 =?utf-8?B?cm8wcWI3T0tRT0hDN0pOdFFSUkJOYU1Ub2pXYno0NjM1cFYvWkJWaWlnQnBr?=
 =?utf-8?B?cWJNbXZBS1UzM1lFMXR4N3REcHdNYS9NdDhEZ25tU3hDSkwveWNjZDE5ZDVz?=
 =?utf-8?B?eUJMK1psL3o1RkZqNjZzMWlUVDBicDVBYWNDa3p1cG1tVElUSjRKMEkvWk1k?=
 =?utf-8?B?SVFZa081TDRGblhYUU81Q2w4VjNoelB4UXVhNGV4ckZLcVBWYlh1Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f075b8a-812e-43c9-afa4-08de9371fefc
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 00:18:15.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvcXzcExcNxOHa8ZyX8AoA6nN3dMtoBomt5OT18LwG8RvF9hEfN/rSqH9w66jjpmaPMz2UGIW5b7YnS6YouqgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6050
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12683-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rust-lang.org:url]
X-Rspamd-Queue-Id: AF70B3A0DD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Apr 6, 2026 at 12:52 AM BST, Miguel Ojeda wrote:
> Commit 8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix
> to make paths relative"") removed `--remap-path-prefix` from the build
> system, so the workarounds are not needed anymore.
>=20
> Thus remove them.
>=20
> Note that the flag has landed again in parallel in this cycle in
> commit dda135077ecc ("rust: build: remap path to avoid absolute path"),
> together with `--remap-path-scope=3Dmacro` [1]. However, they are gated o=
n
> `rustc-option-yn, --remap-path-scope=3Dmacro`, which means they are both
> only passed starting with Rust 1.95.0 [2]:
>=20
>   `--remap-path-scope` is only stable in Rust 1.95, so use `rustc-option`
>   to detect its presence. This feature has been available as
>   `-Zremap-path-scope` for all versions that we support; however due to
>   bugs in the Rust compiler, it does not work reliably until 1.94. I opte=
d
>   to not enable it for 1.94 as it's just a single version that we missed.
>=20
> In turn, that means the workarounds removed here should not be needed
> again (even with the flag added again above), since:
>=20
>   - `rustdoc` now recognizes the `--remap-path-prefix` flag since Rust
>     1.81.0 [3] (even if it is still an unstable feature [4]).
>=20
>   - The Internal Compiler Error [5] that the comment mentions was fixed i=
n
>     Rust 1.87.0 [6]. We tested that was the case in a previous version
>     of this series by making the workaround conditional [7][8].
>=20
> ...which are both older versions than Rust 1.95.0.
>=20
> We will still need to skip `--remap-path-scope` for `rustdoc` though,
> since `rustdoc` does not support that one yet [4].
>=20
> Link: https://github.com/rust-lang/rust/issues/111540 [1]
> Link: https://github.com/rust-lang/rust/pull/147611 [2]
> Link: https://github.com/rust-lang/rust/pull/107099 [3]
> Link: https://doc.rust-lang.org/nightly/rustdoc/unstable-features.html#--=
remap-path-prefix-remap-source-code-paths-in-output [4]
> Link: https://github.com/rust-lang/rust/issues/138520 [5]
> Link: https://github.com/rust-lang/rust/pull/138556 [6]
> Link: https://lore.kernel.org/rust-for-linux/20260401114540.30108-9-ojeda=
@kernel.org/ [7]
> Link: https://lore.kernel.org/rust-for-linux/20260401114540.30108-10-ojed=
a@kernel.org/ [8]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Acked-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/Makefile | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)


