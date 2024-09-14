Return-Path: <linux-kbuild+bounces-3552-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D125979213
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 18:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22B84283466
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Sep 2024 16:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9779414285;
	Sat, 14 Sep 2024 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Ncom/Y0i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (mail-cwxgbr01on2113.outbound.protection.outlook.com [40.107.121.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2DBD530;
	Sat, 14 Sep 2024 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.121.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726331444; cv=fail; b=YC8mXcqGMwnewdbijVVP7zApgIOH049OHMX2StYV0viU6SCgnQluohmiV+9+LsPVpacGN1qR9FGgs8s31C1pepN4DSjjJw6DJ2CEu1QFw2xBmzhnXgzOOY53W2ekNT/lCAvntU4eLNTXeSA2pWX1bwfijQBv971iN2UPDoytx5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726331444; c=relaxed/simple;
	bh=L8UyZT4sBCCsxXAECmeu4OqeD6PH+s0Pp32H5yW5zP0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K32HdaD0rD9y7p6QAp0eYEy1I+Yx9jO+sbC8AxYmPFKjKflFFUksQmqkCsNXf2ovuE5E8j5y0kioIQvlKpnUogmsA+YBl5Lg+R3UDgwQ8aOpy8oCdVDNCmnh7NOXsN+431EUYfLXuXl9m1Fo6vq1IPODlY7DJFb2NOgNQqD7evo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Ncom/Y0i; arc=fail smtp.client-ip=40.107.121.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxO/m6k279J3nvqOr9zpFbNzzX9Ts0yaPvJPEubieEanvIkjM+mJvjGlxLYhhbJJmgriK6aC75AUDSVscdcHKPxzlq2Qkp4DPXNU1aBcmeo2RS6ga+68n0+vdoe8z3RltfAuhtVVPpXSc3vMqnIBdB1gYIwHaUgQnvb+TVB7ab0Sfr6RtPUWcx9Qr1lNh4OVYqc6A+yOneKPwIQuJzqn1Dwpv8PNEEzjVkXfE7WreVKFgEZqVd44o6W3dI0puwrxQ5EAzxGZAZVw8og4ZfS8vG4SBEP4WdXrGkxeT1NBoG1gpWGisXQiokJRiknZzlANTjucCDgEIAItQmpusoe1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXvepcBFcvzoLZcbn5buzwvcucRec8m7DP4ut7EudyU=;
 b=U0tOYyNeDHfKyGc5P+QGbXyuWQNLErybPwdHnxUQMEKI3eqZqaS0c3wzg+h+b4pdXLyDpZ+WFiHKCwClB3F3FEaAHjRD5NJE/vgrB+f912g0CJhAoTK1/G+znNfQ+dJX3hlKAHUbal+neMVtYt8WhgUDQyuieG8C4PfWALpWCH9C0BLFSc/Zo/iYlpxNGqHgEbfmYStw86Xpn3cBqhiY3G6UibP1a+urlunQb4uOYk4GOPjuAyoyc/UE/rG3CP0W0zjXVOSzfqgabI9RIKZwVVX3iSWEw+E8mlYFtwg09H90PJSxlriqDfAQV/Raz7K0F4F7zvevlMad4fRjugYn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXvepcBFcvzoLZcbn5buzwvcucRec8m7DP4ut7EudyU=;
 b=Ncom/Y0ioV9m9A0GEId/nMEpdL85Z7iMVLB2uz2TZxge+tOIV1hQsYlyE5PJpfykdCDI1g4yurPSo0MXL4SrCgYN7axmlC7w0vFjf8UhBmJmSuFet8jme/0e6CkvrqFpFUMeZavDAHxi5AEazABiEsmpmjrkIKGQKpZGQftLjuw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LOYP265MB2192.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.22; Sat, 14 Sep
 2024 16:30:40 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7962.022; Sat, 14 Sep 2024
 16:30:40 +0000
Date: Sat, 14 Sep 2024 17:30:37 +0100
From: Gary Guo <gary@garyguo.net>
To: Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl
 <aliceryhl@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ard
 Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami
 Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
Message-ID: <20240914173037.422902b9.gary@garyguo.net>
In-Reply-To: <20240913-shack-estate-b376a65921b1@spud>
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
	<CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
	<20240913-shack-estate-b376a65921b1@spud>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LOYP265MB2192:EE_
X-MS-Office365-Filtering-Correlation-Id: b3da886c-e44e-4924-9664-08dcd4da920c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFRqRk9jcEd2UUVpNDREWHhrWmhyVWE0dktLdEZzK05XMjg0Y2lFNm1VcytB?=
 =?utf-8?B?RXBiSWsycUx3K0xuR0NLdDFwS0JNck9IeGtocVVuNVFRNG42RTJsOUFSK3JJ?=
 =?utf-8?B?YWozaGE1ZVVFVXhKUDhlWDZldVhjenp1aWFLVDFDeHdWZENFWlltZWVJMWxI?=
 =?utf-8?B?OHZmMjRlQytMRU5keEhLUXo5M0c1NEZGbFBSeUVWVzRkQnVBaEhCOFFJSFl2?=
 =?utf-8?B?MElLYWd6WG5ma2pZRWVHOUtuODBVaUVzK2Y3d1JnT2ZSK0U4RjU1MHNwM0RV?=
 =?utf-8?B?cDFVZWNCT3c5cEhnUmVGSTF2dnlxZWdkQnFmZUEwTnkyVjZUWU9ZQjJFNWNz?=
 =?utf-8?B?YkNUYnM1ZjNORVFIV2d5Si91ZFRCdTh4YlE2THBIN2lsRU1OYThKMzhKc2x5?=
 =?utf-8?B?QnpXaVEwMzdWWkpvdTNiR3ZMNnJreWowRE5TZytHTVNiTGlud2ZhRWF4WTFH?=
 =?utf-8?B?WTcvanQ0N2ZQWUFZUGpiSEt5QnlsTFlnaTdpbFp3YUhBNjlET2xHZi9qamNa?=
 =?utf-8?B?dWM5d2dDa1BIUjVjQ2F3NU12KzVUVmdEWVFzdmZYQk1pSWxBNEV6eC9BNXhH?=
 =?utf-8?B?NWQ2QnIvNitVQTBHOEhmc3MyZWdmQUtBQ05SMXBYWTdwdjZpeDZwOEliaDZt?=
 =?utf-8?B?QkVQN25qYyt1VEFSTXFWNFZ6eXhuRTBMT1ZxUTByVTFxVUk0cHdIaUlyUlpG?=
 =?utf-8?B?ZTNYNWo0bWJKbFJuUzFzRWEzV2NmRDdybzhRVWVnZXEwT2Zwcm1yQkRrdE1v?=
 =?utf-8?B?YkdSekRSbGx1YUgxTy9TbHlpMUliRTFSNU9hVWdxR3BJMjJ2R1l4akYvSW1w?=
 =?utf-8?B?dFVUbmNlZWdwNFBtckVjU2FFbnVtTllTYTBPbkMyR2Y4ZVJIeGlmcGROSGlN?=
 =?utf-8?B?QzBEajIzbnQyb1B2TkRSYkpOcVdGUnlJeWpaU2hwNFYrcU1KeVNJRVl0RDE1?=
 =?utf-8?B?QlNzY2VwWWxBTE04a0NKQW9hK2NWdVdPbWRua1NNZkVxeXlJOXc4RStKNEFi?=
 =?utf-8?B?U0xpaUxCeWNYWkppK3ZhR1p4WHpuQ28rRytyV0ZPZjZCUzl1NHdia3FpWkJ6?=
 =?utf-8?B?VUM1ZW9jajBnL05HbFdvSFB0UHByOFBua29hcjAyemdiN1VPemdlMGRYbHVI?=
 =?utf-8?B?UHpwM1VkUm1QZWZSTnlZdmxiUGVUc3N1cVVYVDltMThKeHErOFN0NTZPbUZk?=
 =?utf-8?B?bDNPc3B4MHlkYmlkRWpTVHFNaEtaemdwc0tSL1NIbkQySVdFcVA5QjdWODdw?=
 =?utf-8?B?aEFBZG4wa0ZRZjNPU3ZVWDBCT01WKzMxNU1UenFneGgxQlNscC9QTklsSXBh?=
 =?utf-8?B?amRBRW1hUkVpSlprdnFiSVZRMGpwT3FzQzk4d3NWcG5BQkNqZWpFVmFVNjZM?=
 =?utf-8?B?dHAxQW94bnRkMXU5R0xDQlhBR29FVWx1T1ppeEo1eTVGZGk3dnkvZURZVEMr?=
 =?utf-8?B?Q2xCY0ZaU1hWc3FPV1YvV0dYTmpDWDlSYUF5NkEvSDgxWllCRHhHeEc0SlBi?=
 =?utf-8?B?SjJrYm9IdVlMcVFTREFqZXVvV04xbXBqZTR3eEUzMEZEOFRMbHh1NW5sT2NQ?=
 =?utf-8?B?WmtsMndjeXcvbmxtdUMyT3RwWDB6SDhhTk9HT2JHdHNYQ2ZFcC9MMnVQdk1s?=
 =?utf-8?B?VWtNUk84bmRsT05YcGVlejdEaGovdmFEVm1zaGdYQkI0U2lRVU12YlZZRFlD?=
 =?utf-8?B?MzNMYkhhbUpoZU5zUDZXcWpucVgrMDJ6UmNMY3I3M0licGRSVmpEWURjRlUv?=
 =?utf-8?B?MFlpNUlMVFlET003REVidDlYUzZNSTgvREFST25EN0RUZ29NRlNjd2pyVy96?=
 =?utf-8?B?czFVSk82aXgxampyNDV1Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGlRWDdaSEFXSWVjbUFGU3ZSelNxb3puN2dNUTNvKzExWWNaZnRRRHpQYzVJ?=
 =?utf-8?B?MmlobFdrbGNyZkthdVp4TUFsZGlWN1N1STF6eWQrS0VZeXZTSEVDaTRvZnBL?=
 =?utf-8?B?dGRjSitsUWRtK0pLTXRKeGtQYWl5MjE4dnVYeWQ2TmtWVUxkd1lpazlBWWZN?=
 =?utf-8?B?UlFMTlRFWS9jY205S3RBVjBvbmdCKzEzaDhoYXpVZUk3ZjFBVmtTejFxTFN5?=
 =?utf-8?B?ZFFTemZHNWUrZCtRRlJ5b3JPVkZ4bHZYM3lBREVlZm1FdVBodUdhVTQvTWN2?=
 =?utf-8?B?dVEvQW92THd3WVRYVTB3TG1lbWVyaW8rZDFnQm5UekxxVDdQM2gwMTdKc3JH?=
 =?utf-8?B?WUNuZGYwdWNoRng5ckxhbUlsQjRpUnY0Y0JtS2pRVlhmRWZJT1VTVzhNeUJq?=
 =?utf-8?B?U1ZzQngzL05DN2UwdHhOTEQ0TDBVZTBDQnJVQ0ZSU3dacUlHSlBDMEVlbEtG?=
 =?utf-8?B?dUVkaTlRZ0twWkk4QVZNSHdITnJjSXMvak90ODM2dkc1UitCSmY1NDN0cWJF?=
 =?utf-8?B?b0lWcjBaaURid05QNEl5YXJEaFFDTGwzVVlaQ3VMMHBvekVETllUTDhmUDhB?=
 =?utf-8?B?YnlQTkRBU2k5SjhTWEcwNkNQaDBkRDMvYVFZU0pCNHFvMjFBMnRYVFJRNzhM?=
 =?utf-8?B?MEJ3U0M1aVZldnEzUHlETCtQZ1VEa2dENFNITUhJWmhkRS9HN1ljRlBFRHFh?=
 =?utf-8?B?d2dpNUJoTnpsZU5LSzFKdmpKM0xoaGxKOCtlWnVLMlA4eVBzcVB5V0NiNDkr?=
 =?utf-8?B?bXZibFlXcVk1Z2VySWtUWUNNOFdLRldtUTRrZ3pxcndEQkxiQTRvU0pNT1J4?=
 =?utf-8?B?L05wYU5zNDlyOC8vd1FoOGRveHZVbmJ1STBpR2R0WThoRVJETmk1S0lNTGV4?=
 =?utf-8?B?R2V1OVZCRWRKT21rRWVKdHpaa3ZEZGJBdTFOR2F6ODdHQmJPKzA5OS90RDVM?=
 =?utf-8?B?Y1QwVXZYaHZ2NkFQL0gzeksxWWFNSUtyakgyODd2dERsNzFNYkJaeStpbW5Q?=
 =?utf-8?B?bEJFakVoSlFxNXR1eThIdTVpcGJuVHpVRnBHSTNVM003ZXNCbjR2ZHVwRldp?=
 =?utf-8?B?TmFpcXNZNitSTU85TzY2TUYyZTNjc1Y0MGMvM1ZRZ2J5d0s5UFZnaDg4aG5s?=
 =?utf-8?B?Q05Bcy9YZkZDR052NTUzVlFyTWtVV2pFWDFsR0ZjbHMzWTNoOFN2Sk05SGU2?=
 =?utf-8?B?dG1wRjk0UG5nWVA4cmJPemVRaE5uSGRmajJEMHpMVlhMZ00xK3ZzaUxjUHRv?=
 =?utf-8?B?bnNhNHI2TWdPeXRpRkdsSHFwUlVlMXltZUllV2V2QlFRUXJGeEpQdU5ER1Nw?=
 =?utf-8?B?am5jQ0MrUGMydS9UY3VZbHltTlhYN3RzRnRjNVNjb21yMW1vdlJNVUNlZnZY?=
 =?utf-8?B?RGNMNk1BT2VBYUxiS1dlR1lxWm02dHdoL05LRDF4eTVkZnZlSkpobytiWitL?=
 =?utf-8?B?bEpaQ1A2YUdSSWVOMFZQZnRtWG0zUzJZR0pwaVBBUld0eEt2RUpUWUkyUHZv?=
 =?utf-8?B?WlFuQ0pNWFA2SEZnRHlCMmZxMFIrdStVQ0szUHJRZlRJeHRXTjhCNkdvL3Rl?=
 =?utf-8?B?ZWNSbVhzTC9IRk81V2NjQUpqWmJ3SUFGcEZIeG1mT3JqQlRueWduMm9wcTF6?=
 =?utf-8?B?N0pWV2JyQm9FWEIybERsWWR6cXUrWC9NZWdISW00elJGMmlDTXJYdGlYY0hy?=
 =?utf-8?B?QlhBeUx4TmFiQVdTZXpRNzhGejUrNStxOGFFbmVrbWgxMXRDbFRIWldZUHZU?=
 =?utf-8?B?TURUdmJpUnVJSmhJbVBvZ05CajVQdkEwTUFxYktla3I1dUlpcklOcVZ4US93?=
 =?utf-8?B?akpZWnJPaXdEcUdIUWFPRTlaR0lpbE1BNFdyV2ltaFJTQTRNc2dzQnRsai9o?=
 =?utf-8?B?ay9ZMEwzNHVvbUhzU2V4bjlkYU9RVjk2UGhUTnhJK21KdkgvNFFXSjBWTVNu?=
 =?utf-8?B?RGdNRGNMaXgvNkJkSzV5YVJOK3Z6OUNFOCt0cERBNVg4aEdvcmNJb2phUmEw?=
 =?utf-8?B?SndmQkxkaTNoSDZWU3VsUlYzTlQreWc2eC9RSHV3WHV2R3JhUitHL01la3VS?=
 =?utf-8?B?KzdpUUQzUEZOWlJrUG9JR3BXZUFKbTE5TmFGQURRK0ZYWFdqWEdCK0o3d3h1?=
 =?utf-8?B?TStadlJLM3pFSXpveHljTXhSTDRLZURRdGpHS085OVIrRS9GOUh0NDVVc015?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b3da886c-e44e-4924-9664-08dcd4da920c
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 16:30:39.9238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNpC78nV1ydBNTx8fEv1kblSluLfVhO2qVtZ/GoO4VSEHyD7cUX26dwjJFPtHKsTXmmqXqIPnNTiJr+lGAdzUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2192

On Fri, 13 Sep 2024 22:17:56 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Fri, Sep 13, 2024 at 12:08:20AM +0200, Miguel Ojeda wrote:
> > On Thu, Aug 29, 2024 at 10:23=E2=80=AFAM Alice Ryhl <aliceryhl@google.c=
om> wrote: =20
> > >
> > > Add all of the flags that are needed to support the shadow call stack
> > > (SCS) sanitizer with Rust, and updates Kconfig to allow only
> > > configurations that work. =20
> >=20
> > Applied to `rust-next` -- thanks everyone!
> >=20
> > Paul/Palmer/Albert/RISC-V: I think you were not Cc'd (at least in this
> > version?), so please shout if you have a problem with this. =20
>=20
> For some reason I deleted the series from my mailbox, must've been in
> dt-binding review mode and hit ctrl + d. I've been away and busy, so my
> apologies Alice for not trying this out sooner.
> It's sorta annoying to test rust + scs on riscv, cos you need (unless I
> am mistaken) llvm-19. llvm-18 + rust built fine, but has no SCS.
>=20
> llvm-19 + rust failed to build for me riscv, producing:
>=20
> In file included from /stuff/linux/rust/helpers/helpers.c:22:
> /stuff/linux/rust/helpers/spinlock.c:10:23: error: call to undeclared fun=
ction 'spinlock_check'; ISO C99 and later do not support implicit function =
declarations [-Wimplicit-function-declaration]
> __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
> ^
> /stuff/linux/rust/helpers/spinlock.c:10:23: error: incompatible integer t=
o pointer conversion passing 'int' to parameter of type 'raw_spinlock_t *' =
(aka 'struct raw_spinlock *') [-Wint-conversion]
> __raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
> ^~~~~~~~~~~~~~~~~~~~
> /stuff/linux/include/linux/spinlock.h:101:52: note: passing argument to p=
arameter 'lock' here
> extern void __raw_spin_lock_init(raw_spinlock_t *lock, const char *name,
> ^
> 2 errors generated.
>=20
> This occurs because I have DEBUG_SPINLOCK enabled. I didn't check why,
> but Andreas seems to have introduced that code - luckily he's already on
> CC here :)
>=20
> With that disabled, there are dozens of warnings along the lines of:
> /stuff/linux/rust/helpers/err.c:6:14: warning: symbol 'rust_helper_ERR_PT=
R' was not declared. Should it be static?
> If those are okay for rust code, it would be rather helpful if the
> warnings could be disabled - otherwise they should really be fixed.
>=20
> Following that, I got a build error:
>=20
> error[E0425]: cannot find function `__mutex_init` in crate `bindings`
> --> /stuff/linux/rust/kernel/sync/lock/mutex.rs:104:28 =20
> |
> 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
> |                              ^^^^^^^^^^^^ help: a function with a simil=
ar name exists: `__mutex_rt_init`
> |
> ::: /stuff/brsdk/work/linux/rust/bindings/bindings_generated.rs:12907:5
> |
> 12907 | /     pub fn __mutex_rt_init(
> 12908 | |         lock: *mut mutex,
> 12909 | |         name: *const core::ffi::c_char,
> 12910 | |         key: *mut lock_class_key,
> 12911 | |     );
> | |_____- similarly named function `__mutex_rt_init` defined here
>=20
> error: aborting due to 1 previous error
>=20
> I stopped there, Space Marine 2 awaits.
>=20
> Hopefully I'll get to say hello next week,
> Conor.

Hi Conor,

Do you have PREEMPT_RT enabled?

Best,
Gary

