Return-Path: <linux-kbuild+bounces-12530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECVlC9o2zWlwawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12530-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:16:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F437CDAE
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A8A0313B92D
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ED339A064;
	Wed,  1 Apr 2026 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SsRbJCwo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021129.outbound.protection.outlook.com [52.101.100.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941B37998A;
	Wed,  1 Apr 2026 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775055932; cv=fail; b=ALi/gj0TP+q2djYW98y1AqngeIZIHIjxJO6UGLq8HIB13vdtmkY8DqcgwP79/7cpWMlGiWHqBSJO0+FCpsTIs3IWBJyd8nLLf5HN/fgMUa3XYeJTvq5caZzpcA48aVeWFSSDWv+O1mxwzs7CSA9OAKK2jfEmdwV1+xCzOaHZMZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775055932; c=relaxed/simple;
	bh=LJSpZNVwk0EkmwjPHCtECAV1TLngM1VfxsJumrIebm8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=c9TWDFWtR7iriaTIAvGMzjS+tTQ0zxXiuH6KzI535bBEfS9rWzFNRdhXoUkHPQkHvoiLe67k7G8Lh6JFnegAB4YYj2Bw7XUCIFPpP9abLF8voWJ0xqGzpT3Z8C5MDmHyR6BXLVKbCwbTFil3EISTQT1Ef+vK9Q9woTMovcSAISM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SsRbJCwo; arc=fail smtp.client-ip=52.101.100.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu7ATRO+jA+3fZGy3AotIGwD1UoHtZaKestXoAYnnDqqK/VkQicI3+/DWwN9HWlr59UZJ/1XcPxFG3bmcwywn4ynmxI8YZkA9jEenWzzri0KTNIHG7HjkIDxs95WnVWrsgHuHZGqwYy3JAW82RUDo1y2M1k9g7YIiYfQP670neUoUCY2lLIdgM3aTB2HEu8tnv8hd5eBlKfu0lbeMO3UFAoXmBYgZ93yh5YFyYHXyyfMTAci+EDwPvtpzKKg4xwtRhJIY86WDhKs3KwarHK9d+kMPgB/ro7zpmf8778CAeK+r5s/SW7jYP06wv2I++iKO4bNrCeQ8jKHEj2qCaxnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kB6t2wrLTh3WuKm1vE7qp8Mjl8yDyslmMIj0G+obTU=;
 b=uLYUU344zRbW5yEmMpAr8JurPwO/aP6c4G+JnRHMSEKwlPZ0VDpLX2QVWh0/S57fEeje3W49gLyFmHiGJFjatlRVxnhHuLObJyHpCIhRUy2hEMhTMdLjG70tZc0TR4diGNm3JxOKCTlBNEXNrKd2stcTzW8GhdBGJRwgUM/DwFP+nGt0r06JjFoMLjnpafQcxuGtfRciFHcYTf3hTP8BY/25YEi75ngU0nC0W0KXnMfQRayVGswBXRjFLpbU+u7cdq+pomvkQ5ZlY2PueLbMama0JQIco9p6Lk4GQw31fQ5W+/X0pc6zDWxSGtmAZ3OxWQokl6PkleJlq7n026T12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kB6t2wrLTh3WuKm1vE7qp8Mjl8yDyslmMIj0G+obTU=;
 b=SsRbJCwoehvoYZG3Dmv0h/NkRDfMn1rcJVqpmOyyZTn5+3UwQrzsRJ9tlSj3VL75f9OuIrWgOD0WtmjAMjLBsdPQtVEbYouONKc8icSLCqwCaZn8oYdcltMRW66YUd9jfjdnJCMokdQ93hpo0TtILgOYKE2brts2T4HUOwylfsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6112.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 15:05:27 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:05:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:05:26 +0100
Message-Id: <DHHWT7EDOWKD.3G1WY4JL8TRZI@garyguo.net>
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
Subject: Re: [PATCH 18/33] rust: kbuild: remove "dummy parameter" workaround
 for `bindgen` < 0.71.1
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-19-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-19-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0574.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fb60a1-7141-43c0-5eb3-08de90001c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	v73t1GdUT4Xs0dEHz6e3GOlBCait8dMnpqHGJOVyeMPSuXBvYoGE0ORD1qFPTHsPP+Ky8iwhq4/aZsFYdH9e1vbKdMW3HY4n/qRYuan7uVgHMMla4Lm2JOmn1+5ugCx8fQizSkGsAOC/kvcvVPNXBbofTbLvoV4ed5whQz6lZNgtpzq0jQyJ7Gfc5ug8SzmXJsS22zLKJD83VGx3OwQDY5YHOQcQRCbU+qOLJGjEDoM5HztzUtdR7tknhdaKRYI/ho69RHE/i/0E2lwRAyPkuuxwCqbcJAIvoTqXNcEJZd8dEY+eJwt7HWiHi4T79oUWzVT9uuB75vWkKuxAB4bvEcT0P96JbqOvMN/U1XR03BdilReoo6zikUgRvkb2CaK5n6kY924+jc5P2Z92wcaxHAr+F6IZkXzGT8/LoR/ROBmrHRqA3pIJTbiNxhGuYxXoF8x62Xy6f9M7UCEcncGSxoABJh+3NExnGwGV18V9/1toaoQZGbejln39sKDRc9W+L6ycdGPP8SzuxmGVCCTGFLkIoyFMWeUMOwDKcKcEELStvymyF9KK2kXticWt6Le/TAgHw0+a5g54sk+/FcMZieIZNN3tdVnKw1WjLqTp56I+Z7vd9xwC99SS+QU1rO/sIz6WXyTGL1xD2B3SbsFYllQ/9lTyccXZeT61/F/mOR9E/zflbqav2Jzb98yo/354Yu3BTeWREP7nKlRhhGBCAJxcYi3TH1g2ZmMCJ4xfMRkItWsS8lyiV3LZ0IjbUJ100lyKxScreogIfnCjfJDjrg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU1iSUF2Rm4waUI5Ym9pQ3BiLzNKRXV2Ynl0dW8wb2ZGb0xFWVlLUmhzd3V5?=
 =?utf-8?B?K3NwMmRnVWxQUjNqMjRzQnI5aGttMEptMnNHaG9OOFg2bVM0cENvWWtKS2t0?=
 =?utf-8?B?dEVrMXZTSk1WZjdWWDNvY0VKZWVKRitZM2hVWjN5aE1vd0orc1pxTjFseGpK?=
 =?utf-8?B?N29rZ3czYS95dHY5SDZic2JjTlExQmNVK3A3Zmt1NnU3aGFhOVQrU2xIZ1RG?=
 =?utf-8?B?U3BXRncyQm9FNk5sVXpOZ1MwakgrRm52aXBBLzl0dm5QMElSYWk2ZTBRbnEw?=
 =?utf-8?B?cVZoeHlINHFPRjkwOWFTb2w1bW1VWTRGK25MOTRwRlZud1FlYzZXQVFnSldW?=
 =?utf-8?B?aUsxcm9zTjF4Uis1d0g0VEhqU1AybS9qSkJ3b1U1MHRWcTU0WjhKQjJQYllZ?=
 =?utf-8?B?QTJDUmFLUERpYm1CNjhSVkdiSU9MODI0dCtGTkZySGV2VDVYMVYrY0c0RFhY?=
 =?utf-8?B?WG1rc3FDRWk1YmprVW5rMWJEREY0VURQNVFEbzB6UVRYOUlCUFl3VTZqVUZw?=
 =?utf-8?B?RHEyOWFORFA4eDZUcmdyRzNBeXhOZE9HV3FhMDhNbW1uTmFOK0lLZ1pqczdQ?=
 =?utf-8?B?cUJULzY3OUhScEdsWDhVd1VXUnZsYTlyN0t5VTYrdmNMSHZWNWUwang1WHdQ?=
 =?utf-8?B?LzZhRkNLbjMzNUlzb0gzMGRGOHhMWUM4cndlb3NTbHRLbE9VcjM4YVhqWjVK?=
 =?utf-8?B?QVp5OTFWUWxHNTU0OXY1M2l0SURpWG91UGp4dHVxSk1OLzR4ZzAydXFIK2ty?=
 =?utf-8?B?R0FrNHVRQzVXUVZRYzVHdzIrTHZQSXhueVdpbFV5TVhXMXlJckhabDN3NXhV?=
 =?utf-8?B?cXRlb0lwbUMvS2Vqa1Izenp6UmFsQnFIMWlBbFFuQUtnbkE2UU81S3JjWHRs?=
 =?utf-8?B?aWxFd0VJblgrbjR4TkJGUVAxMTM3dzVBdXIxM2RzNTYvOVNsZUlNL01HNTBG?=
 =?utf-8?B?R2pkM1d6bGJsa3M5eWd5NWRvb1ZWSld0ekhMSXNsckdkTHNoay8yVklxT043?=
 =?utf-8?B?TlhnMCs4ejJDZFdmQkdHYWl0VHRxNmg4bUUwc2NaSWEyZjdqRzRxaENvS2NY?=
 =?utf-8?B?Rm1aQmVQejBEL1BhQ0hOVjlCaUxSM0lVV1FjR0Z6NWpndXJzNmFwTkVueFBK?=
 =?utf-8?B?WCttMTBFcUU5TzVIZU5UWVR0RThmZUFIdDdldXNqZjNwWVh1MkVpUzg3M1Vo?=
 =?utf-8?B?NTJHcnNhRWJYSFcrNVA1THdWUXNnMThFZUE1K3lUdmZvZTdGWmlmWjRZclNO?=
 =?utf-8?B?L1RDd1o5RUdkRE9zN0hvQjBYSUxJUEEybjdyNCtOOXNYM1hvYXMxeDkvc2Va?=
 =?utf-8?B?SlJMY0VvaDdnYndRaXpCMXNMc3VsTVpKZ0FIOWdRNDlJaFFmM1lZR2dEZExz?=
 =?utf-8?B?Nmo5bTFhRVpscEU5djJkWllRc3haM1JPVko4QlV6WFQ1enVUVUhWYmd0ZVdx?=
 =?utf-8?B?NzlsbldXNlk3TFRTYzBlZVRVVjdIVTk1T3NicGRtOFRSQkNKMllUamdnMjVy?=
 =?utf-8?B?UFJNYjZnbkI1RW1LSExPaE9mTVJEVFp0cnM1Yk8xRW9UcDZYdFJnWUtjN0lp?=
 =?utf-8?B?alczNTZTZzdBZ0JuRTFUUUdlc2N1UWNCOGNlQnpqYkQ4WVJBWElPTHFZeFVN?=
 =?utf-8?B?WThCZlFNbFVEZm50THJsaElDQyt2cnJpbk9lT0Y3ZmhNSlgwRmhDZlNIT1pO?=
 =?utf-8?B?UXJxOElsZXd0NldudUFKYXROWitEejFwT2x1THExS3hKeTVuaGtoV1cvMWdK?=
 =?utf-8?B?c1FBUlg0Z3IyQVNEc2RFT08vbVRZb2xVM1I4TEZHMmRiVXJzbUwrYkFnME9Q?=
 =?utf-8?B?NlNQVERJK3JCV2JrN2lYN3FWYzF0akRGcHhnNzAvWWpNaU5wQ0pmU0l6QlB1?=
 =?utf-8?B?M016QWREMTNZRjA0Nkw4WnVGV21BQXA1TncwZlB6bExnWjRlVTdyZ3I2TzZy?=
 =?utf-8?B?Uy9IQTV3ZTJ5SUZ5YnNTZTAwZVhuQWQ2N1JZWjhnT0VpK24wVkVjRTltaVQ5?=
 =?utf-8?B?ZW1qNUE3REFjK3k3ZC9wTGJMTk8yczNIa1J2RUxJMkRxOGdwa2VCL1ZXeVhr?=
 =?utf-8?B?cGpMVUk3cExRV2k5ZzV6TFg5bTF5MXk2NUJabjkzL2pDYzFVeHpoVklTQ2Fi?=
 =?utf-8?B?a3M4TzF3U1JhWGRTS1UyTHYzeGtQL05vbmVhMTlPeG1hbDhCR0NLb2p0VXli?=
 =?utf-8?B?TWhuZGdvY2pVa3NMZGIyRkxVS29iSmFtNkUvWEluK0h3ZkZGd3VzS0dqOU1o?=
 =?utf-8?B?Ny9hWWZDampzSnZYWW4rNWtFSXVqU1VRa1lBQkZNa0tPK1JrVTh3SUdVVmgr?=
 =?utf-8?B?NkwyVzJ1cStTNEhQRk1XSmRnSzRwY2FWeEwvL2hHdndmRytsRXVyQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fb60a1-7141-43c0-5eb3-08de90001c00
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:05:27.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2VzDf7MrPDqT+7sG2OgUgQRysKQP5Zxxt6OdAuWIwu9D2Wjfwteo6gtKQWf2vBj+Kz5VKQkDOMZk9HSaoXp/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6112
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12530-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Queue-Id: 904F437CDAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> Until the version bump of `bindgen`, we needed to pass a dummy parameter
> to avoid failing the `--version` call.
>=20
> Thus remove it.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  init/Kconfig                 | 7 +------
>  scripts/rust_is_available.sh | 8 +-------
>  2 files changed, 2 insertions(+), 13 deletions(-)


