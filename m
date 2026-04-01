Return-Path: <linux-kbuild+bounces-12532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDGbBrA8zWn5awYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12532-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:41:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A5C37D53E
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BED473156329
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829173CB2C1;
	Wed,  1 Apr 2026 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="j9kSMZOF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022106.outbound.protection.outlook.com [52.101.96.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C238228C;
	Wed,  1 Apr 2026 15:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055961; cv=fail; b=ofdNW6vgqK4dcdUOwN35U+GdxOkK0gAXgvuuOOp+TdumXl9+aAZ630ihBQrh6mUFL3KQMrDgXVSQSb8mcvmYt6ymewP3J3mw032fgbMWjdVtdnsNG0+3USBDJ+x36H288Wwq8XqFMgtjyuJ5BVhDHA4x/cGKSqy96F7zLX8R/yM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055961; c=relaxed/simple;
	bh=wvHlj+j/HyAoRx48FV5Q3Pxy4vLstWhXgTLX0/RJelo=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=umgimz5mJsFLeKM0ORXaSaQefoWeQHR4v3S4/j8HMHmFvFp9h7rHLxEXvld5ZvR/Fn5PqbTMWvbz+40eKljig8dKb2D1Lb5EJW70DuiQxOC0e/88lMZkPn6+DpHekrzwf746LwLlKXocJIKWF7qNRlCL9lnKNifuZG2qexY1Ohs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=j9kSMZOF; arc=fail smtp.client-ip=52.101.96.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoRSIbNBUMI1irpvEpRbDi8uj32QJvBbf1OAeNnAHr88nHMug8mUHVfBEnLVJdukFcdf4Q1I8K9tsj4r3NM1hH48M2iSMq+aMVOI9Rro2eAtSHzfcXbbMvafquNU9h+DvzcYnfogxKh0o0h3vJIvt8W6BFqDiRXSnD8bT+x+OmbPSC0AWkl2meh0GgLQeiYBg5eVkXVK9PjvKy+oBczN2IF8dILLH5sjpXShwNghjQwylj9TSqQkA4DkYQgreAw0LTw2ELQO+ME13TMMeEjKkQb4gHLauYxb6067/b+d/Kj94Picqgbv5OQ2UH9PVO1l+LobVlxdxfuK+Bdv5DjX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oan5Nvg57VYPY9v3tt6Js9N8vHuOgAgK7Hs3WjQWrOE=;
 b=cbHH38qzhAcNpaa6/WfGZntDGAb0ZfdoG5JdiAMqiA3hPHC9nyQnHnwJQ+QguNqFTo2HjrMhXamoSmZ2EAylCrt2beokdz2mgsQ6gy9GxsdvotXcr+EFR5Fl7BB/pClP2D0bbWD61407bDDAsQWIXISczbgTjJyjvfR0Ce1aUFaKzjGTJ4AwMUp4yPO9T7kLCpPR20Vpwpi1QklEFNp74C6/C9nHxg4xVnBJziI9KiT5/4Pm1WPm6Aq0Fn4H+mMZbkELmdnbB2sqVEIp2aN0zHuvPQyTktWId27WrWMUb6AsiihW3iPzrxFEefAY/sUGA+oTpsApQk/+DYhgC429Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oan5Nvg57VYPY9v3tt6Js9N8vHuOgAgK7Hs3WjQWrOE=;
 b=j9kSMZOFEEhgiSdpD/YsiFYRJPGVshW/PNbu6oQIgWYMHSOMUqqYO3II5SYMb+PcAJsphH1yAdVob2W29gGaTx4vU1bD5/Xx2T0ZX/VrxA3t1Uo+hgJuuA63C3TTeKEq0874Tb5GgPfeJ+3GXK4yasR1m1OjGQf3igETlrgCLtw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LNXP265MB2492.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 15:05:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:05:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:05:55 +0100
Message-Id: <DHHWTKRLK61W.NJB2K3ZBKZAD@garyguo.net>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
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
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-21-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-21-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0643.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LNXP265MB2492:EE_
X-MS-Office365-Filtering-Correlation-Id: 525b46d8-0635-40b6-9e22-08de90002d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XD/kPPRtONqtYuSHJiWY57Y1JgaEzOYoLpXcP/EG2d7cl3Yc2RAA0Cnx4rEOkULxi3/K72yqdE0wu1dGu8dSBpmMeJf5AM0g3tOUEFxjx6GiQIVhvkrun8R+4umTw8P2d/MEDInJgSIVBh96SkFLbDjzPh1azftAx0apC1dLDNN3/WNMk4K9ysWDOkXQEUPtYAwXWJaI/edcB5W29S6YQiwO1aXreaiECeYnKcREDML9MLelvfDREmMOQXe0XLUExum22J8wON4dYQC8wxrxgzSZ+HXypm600sJD897xE5Yo/cWJrX8g0CfvhH5qZ/B7bdAcU/ljL07A8zgVHh6ZZD1pZr3j6dk3MbdkAXREAfgNPubdcuBAYftabYqjwQtRaNoPWieClTEbxsfSYdxSrICT9vZ55jyjUlWKaL9O/+Nt1q9wm8MiqNEyf1DLVwfB/jDRXX5zRuQ4CeZ4GyBuykyHnnM066Pi6xZy8Ws/n6hhkp8pw51ob2W0V5crZpsd8GE6hzBYo1+bXXLrBHnTdU/JGQk/0hgQMzvpmHsh5L+ezb7cmlbGckFcgWGfcPAZi/2kK+DUwXBYbhGfIkFKClcYT9hIJCt0ZpodyCH6/kst7v2gBCNhOZN2XgKtxgFoJKVOAWP+nE6/+DMkdv0E+XewkvTMihpXktk3cAE3hxk1hrVNSdmzhh1xw+2QeoQKzukkyiYeQaVOcwkhN1YZQikSCugbvxc0c0/gSQAirPo9bp9jgnmQsmzl7mFNKdj7TosfC0rL8Gm34dWgjwUXsg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlIwUGNvWmhHTTQvNEtGdmlyOTJvZjdBZG9yNkJyeUlOYk9vRkk2cTQyT1lB?=
 =?utf-8?B?KzlqcFdBWS8yMXVXVGdVUGMwRzVRQ2NkeE9POGszTUkyVWM0L1NLSDhOTDlC?=
 =?utf-8?B?Q0VFdzE1TmFaWEVRelVleXZuajB0ZXh2TEh3NThvVFJJend6WHJoSHdxOFBE?=
 =?utf-8?B?NHgzbnRQMnlmRmcxdFNuUlU2VllFczd0TVdNbnd1ZmROdFdjT0wxOUJRV3Nq?=
 =?utf-8?B?L0hDWmtLeWtJMVV2dFd4TVFCWUk1TzNCM2lUKzBqdG1hS1FuQmlyeGkzbW0z?=
 =?utf-8?B?dEE1UU03UW5jcUJWbUUrYWZwRzBsbVY0YWx5ZTI0Q0k0V2ltTTgwRElUcGZQ?=
 =?utf-8?B?YnpVemVNaUZNanpRaVU1U2NtbVRMUDNFMkdtT0tKOTNCQk1obTRBd2hJNkZI?=
 =?utf-8?B?bXdNdGsrU2lLczVrSW4reEdmSmdpRUQ5T1RabU1acXhlazJqT1VWQ2dCaHdh?=
 =?utf-8?B?RWh4UUVrb1BjQ2tONkJvUFlNeTNUWVdJNldJdWg2ZWo3RGQyd1QvMkdwLzN0?=
 =?utf-8?B?Ny9CNzFGOVZyS21BellIL2U0S3M1bzdRVXRXdGpLUlZ5RUQ3bFovOVFkNmFZ?=
 =?utf-8?B?OXhyYnk3VEVKSWtpc2Qrb2FwZmlCVlphSmxQVTd5dkc4ZWNYbVk2SkcxUlBH?=
 =?utf-8?B?TXdWSHdBSnRQd2d3TVlJRHA2MDkwdlBnVGpFcUcxK2diZXJYcExNSHBsSzR2?=
 =?utf-8?B?UkVNT1E4YVEvZUFaclBUNGVHWWNvY1haTU1OZ3VLOXZhN0Mwd2UxSlFsbDk4?=
 =?utf-8?B?VzArU1VNbWpUcmdBTTNpZWxwWFF3cnhWRS9jRHVLbHUvU2NmUXozREYxVmRD?=
 =?utf-8?B?SlFYT29HeWE3QmhzSWY5eDExeUtIQTd4WXNyd0pzZWlnUFprUytEWjl5ZEtH?=
 =?utf-8?B?cExTbWVBSGoxV3JVUjBxL2lhY3pEaVVJckxDd281ckh0M0U1WGpNcjFPaEUz?=
 =?utf-8?B?SEpSM1lKaGhXbVZtRXVkRHFad1RjSFVzY0hXNHRQTW5mY0ZheXZ6RFMwTHdM?=
 =?utf-8?B?OGk0dXpQUzBxUHlvVm1jQ0RRQVVUY2RURHZJbTdUZm5QbVBlclU3ZGwycnNB?=
 =?utf-8?B?RmhjVjIzWXdGR0pLUHNScFo2SnpiN3RGS1B4RnpPeThralF4ZXNCM0tQTy9i?=
 =?utf-8?B?czR0OEIzOWR1MmFvV1RaNUJuWnY5di9DREhBQWpWT09lemU3WmttNVlQOXVU?=
 =?utf-8?B?V0R5SWVCbUptTWExbWQ2aW9jODF4VjdFeEREc3J5N1I2SWgvTVF5aTJubEpW?=
 =?utf-8?B?Z0d2T1E5ZVFKdURWM2ZkT2gxbGFvbmMxcWhZVHJBNG1tYWxNOXBVRlljclNQ?=
 =?utf-8?B?WEZ3R0RlN3hmR3diUFlvYkZFVzdkTVo0ekdmYjh0aUF4WHpDU1NEN3hHcWZE?=
 =?utf-8?B?ZVArVXBDOTFFREcxQW1BbmJzQmlqajFUcUpVNVpCRVU3MkFKOUFMdDNpcmJG?=
 =?utf-8?B?YkgwNjJMSG9tTllaLzFaUXZON3FuL0svK25sT0NVL3NYQkdQYlNQNHRNbzdI?=
 =?utf-8?B?WUlTNk1BUHlibXRmRXFKc2RMbGpoTE1HK0RiUDQxUTNLdjZEblRNWTd6cFY2?=
 =?utf-8?B?SWlsR09zWFhESE9VaTN1a1ZybUdHZ0dycWhocEQyZ05VZ0w3ZmtGS3FzZEpv?=
 =?utf-8?B?ZDJVV043MG15SlUxVVBqeGxVTHcrRkJWblpCZDEwRGtYNTNTZDJLRkpGZVVm?=
 =?utf-8?B?dEdwQXNhcVRzWG91MndQUXp2cDBrYk1PSGNIdmJRT2N6QWQrZHZLN1YyWFBO?=
 =?utf-8?B?Rmp2aitQaTNvYUlIY1lJVFBHeGtSVGx3Ri9HNXFyaTBzTG10S1dIalB4MlR0?=
 =?utf-8?B?QVFoUUdwZjhCbTRiWWZjNmtDUnZNMHV4T0s3dFpkWUs5R29MODRFRkFTeEpG?=
 =?utf-8?B?Z0VRY2hnUnlHc2pWK1FoSnhPeHF4dVhYY1pDTTRKLzVhUmprWEhTVWtYT3dz?=
 =?utf-8?B?eUFhUnA0cDVKTjJXOEVJVWVGbkdoN2ZlOExjUHBzV2duM0J0U2Jna2ZDWnJm?=
 =?utf-8?B?Tk9tQWl2Sm9uUndTRTBMS1htbVVlZmJ2MXBOZktFd1QxQTJhY1NVV1JUd2V0?=
 =?utf-8?B?cGorRE00VDU0MXRTN1MwbnlDL0RVRkNmRmZ5SHlVNEN6Y3phbXNMdDVIM01D?=
 =?utf-8?B?cXJzQ0l4MjFSNnJJM0ZKZXp2NlljNnI5UHRHcVJqVis5eGMvQzc5QitNL2x4?=
 =?utf-8?B?aVdaMGFnakpDLzJpZDA3MnFCa21FQnoxMmJMTVdMTjhSbmlGRVdHSHpLWUdB?=
 =?utf-8?B?anFORnp6Vk43aG9mc3U0UmpCZjVidWhQdFJSdGRiZGNTbXA0b2wzeFNsKzhJ?=
 =?utf-8?B?dWNreFhLME15bkxySzNvb0drcy80NEw2RkNsb3FkR0g2d29jN2Rudz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 525b46d8-0635-40b6-9e22-08de90002d56
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:05:56.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJylQCXuiHQGeWdhdmpbYsNd1kgJS71hi+RS+tb9X0iKJ18k4h3g5oC09VVT1pq4jt/QS3qu+caP44IzF35t5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LNXP265MB2492
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12532-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.874];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 75A5C37D53E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> The issue that required `allow`s for `cfg(test)` code generated by
> `bindgen` for layout testing was fixed back in `bindgen` 0.60.0 [1],
> so it could have been removed even before the version bump, but it does
> not hurt.
>=20
> Thus remove it now.
>=20
> Link: https://github.com/rust-lang/rust-bindgen/pull/2203 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/bindings/lib.rs | 4 ----
>  rust/uapi/lib.rs     | 4 ----
>  2 files changed, 8 deletions(-)


