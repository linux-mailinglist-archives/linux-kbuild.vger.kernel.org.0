Return-Path: <linux-kbuild+bounces-12519-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK/UAnsnzWlkaQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12519-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:11:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA55637BE33
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 904D0302D5FD
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8B743CEF7;
	Wed,  1 Apr 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jp/KLfwx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020095.outbound.protection.outlook.com [52.101.195.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2787F43E48A;
	Wed,  1 Apr 2026 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051474; cv=fail; b=Piz530BAl0vYTnQibqNhJYyqh1y4r7oFYrY7p4dC8qBA3EhaDKEj6bVzrqz8C8btBUMGgwjb9w7CE97C3jI3no4fEl1CgsP7O57fQBuwCbU6eu17K8gFO1ORAIG57zfwd07HDouTCup53P/RUWunVtwVkVjY7xJ5gxABbC6FJgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051474; c=relaxed/simple;
	bh=60amKpwS4Dm1zGCi+XAWGgGTVTiQzcqeqCd4SpQcsM8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=M/TpEMHV+Hp+YrjJmzLgoqBFIvoLEk/A4c3vlOJ/KsZYf/Uw+LODgaiyXWq9IPM8dsqtt/DtCim8iDA3KRVTEaCqOvUk2xgQcxd0E6xN4zTPypkRe/w7qr9LCjOn59j3SMoKYFoZ5uooZ50EreJJwLv+C/b3UheFR36kxtxIaGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jp/KLfwx; arc=fail smtp.client-ip=52.101.195.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCHqzUWwydUhE8cTiuDodRkgSz0TP/HNWn43mcrtDHEmAr9qYMA2nifF0dKXk8hV1JQ0z8CERk1WcFt1ixXciaQud2/jl4lsnbi1SXBtOoyTYhwzpVSdYe50MtD9JhjSs1OYrqATBor1DDbxIwKLkPQKP83BYrB2t4f/BUlAV43sg7ViE5SzEINzenw9nCFnn1X4+BBTQnSMqlsC3q+AOdIqs0mZ7LoFHRcf5Im4aVuvBTddlaWM489nkhqH/jPEA0Cq67OMeo7BpZlv+VZui+6acHv9JlykJP+78NdNPbSfUub7p3kjaGjZt+JijDkt4465IEZ1IC5+vSdSiANMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj2ic3FIWzru+55C0E+i3u/w6rWlKCBfo6a9c5CdHOA=;
 b=jNFWTlxLXd6jGVeaLzkB00PzdzWJYGi/N3VA6iWTmVnpS4i0Us27WyTpRfu/nT1gIroFEFeU7ntYVlWDbISYsRcHLFFU5qqCuIa0uzFQQF797dHLCfmXIz3ahxbJk2Gv43Q7cZo/j3sk+jurJ/JbMKWl3vvJi1HHca6lGfHOq2bISekWmPIZdzklpS0YGmwCjVt7tEqGmvQGxMlgi2DY2QeNqn+8HMeRM1SFIjCL3fMa3gfdmQMymZKolZou42V/JSGzC0wALRVX3H0kKRDp2jNlgt55j+Is/dyUyaUKYdOwV9JH7POhjlz9vvJ13VFs3uuoE1Du7Dvqpl2ovESf1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj2ic3FIWzru+55C0E+i3u/w6rWlKCBfo6a9c5CdHOA=;
 b=jp/KLfwxjMiGhDWLncGNnZIOJAYHiaRvCP0HdHFGomHHH/NK5xBxtRVkjO9KL8oZ8dFgfVzcExMo5YSQaNvpOth2Nn6Rb9DYtVYhb4/UwlsFT14lnHYofiCVbVj9AXNwGiqRwIDAvQTqJSuImquZwyMdue5LW0/sg8ZCGqTlL/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB2063.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:123::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:51:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:51:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:51:06 +0100
Message-Id: <DHHV8AF0TXLR.1TKOWH8MSO17A@garyguo.net>
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
Subject: Re: [PATCH 07/33] rust: kbuild: remove `feature(...)`s that are now
 stable
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
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-8-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-8-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0335.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB2063:EE_
X-MS-Office365-Filtering-Correlation-Id: 888c7132-77dc-4c8a-c1a2-08de8ff5b98a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	XPyK6u+q9oTDhx0KrbjZoCIb3HfxwEXEdXHQ0ZBFr5+rDrFVTiabG759YLu33UHiS07z3Lxf9xwTt3gwJC4A0tgLarTJDVvSBCUjeDAJEYtndXZKR2jniH4FQ59E2u1ht9Q88eyGx5osJkaCZJ6OKyPx0AE1HyYlK227r8Sj5Rm89rDIoXLnSdgGGEA5rlfNN4qiZUIhOiE8XAu9xuufPFK/RbsFL6x8MPykIoDugRmFb9ouj3hHvZx6RcSfNm7FYBPPg2RFpYjDMbDuCeifQgyizDbWLNZj1SbpLQFTQeCrfczPppjqUFYm7s2Q6/UN5PKzT8K20JiM1EvhtZDrkmoHIlpqcpZ6+oe94iFUc9KL8kqMet5kvWGslWz0rXtKmybgwJZehR+QxuUvmCqr9kD0ZxrgquGxl3Unsm4lKqj+4Z48uDmIAjTTEf+xNybptjHSyjLcHuBi797X6dGLJXaMmmMn5Dn//icbO2W7Y0HxfnRVasONaA0wCRh0UK1CHM18+Lo0HJKwhCO3IUB/0LBjmL6oP2xR844Og65XIlDGgyHVLUoVPzgfyYF2rS2hukh4X2+dci12mXc5jIcEXpVtU4qvZ4vEgQHZipYMJX2ODQ6F+4lqmEben0ExuPAy1AGHH6y5RZDiTqizusjLfTb0sP4tIz908+oZ7v6M/7zgvvuBjxjlYyuXD8UXOY21XjhuZRm4juDlXLnvHx9ZYUbGpgmo9ZEpgWA468lptSU/5bcMDLOVXzjmhRVIslPS17l41jKQWMLN525XpDZucg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk9GSGwzOEtJQjZjK0RmdmdhaEp6VGhkNzhHNEwvdWVLcHRtUVVSNXBHaDFH?=
 =?utf-8?B?bTBEN3pLT25ZUWhEaHdtR2c4RGE3V1JUSjN2eTVnMkp1NXdOK01EbUkzczZ1?=
 =?utf-8?B?TW9qWDZFRDBqMkEvV09FeW9vUktJZ2lUMlRDOUVrNWE3WnFjcHRieU1jRS9Z?=
 =?utf-8?B?eFVteFNjaGdMbE5NNzhqSkVrY0p3RllpN3RRU0VaM0dGUUp6Q0k5RFRwTlpm?=
 =?utf-8?B?dmFtUm05cXFLUWhmWFlKZy9sU0lYd1JlSHpSWGEzV3Nwck9aQ3Y0cjVCY2tH?=
 =?utf-8?B?MUIzTEJ6VExvM0tydllQK04xUW82c3pDTU1pTlRndXFrUXd4OEdBTU9peERO?=
 =?utf-8?B?dm9TdWRsOHF5ZW1iNlkyNlZ6NzZiTjMyTXBzWkNUWXpSTXc0NGlVTzNyeFhV?=
 =?utf-8?B?WUwwSjVvdCtFd3RFUlg3Ym9CczVDMEoveWdtNUM0OWpKZzlJZjIyWDA0VU5J?=
 =?utf-8?B?MTZSNGFyYWhKK0o1c0ZPU1VrR0VaVVp2bmFROTJ6MDFHeW1vL0VYbEFXN3ZW?=
 =?utf-8?B?eDVvWGtZWnpZclA4N3U3dXo2dzJ4cTBCdG5EYnphOVI5N3A5cWkrYkRib1lq?=
 =?utf-8?B?SDJtOHIrVnpHWGhKZlFzMXl5WExUdEpxdHNSQ01LZWYyZGp5SFBwT2VRaHJo?=
 =?utf-8?B?N0s5cXpxTmROQUVub09kaEd5UjlUcVkxNGR3alByOER1VWR2T01ZVTljcHdO?=
 =?utf-8?B?ODkzQXU1RmZscVZEb2hQTFhWT3Z4WnErY1VPS05TOVhOZ1BTNzM2Nnlyc3ph?=
 =?utf-8?B?VEgzNWIzcjhDU0YrZTNPZkJNdWxYZi9qdmhPQUJMcE1LamFoeWFkRGs1QzZC?=
 =?utf-8?B?dUN6ZE5pSTlTY1F1RC9oUVhSa3BtWVJoNW9haEwrdWdDeE4rRFBLWlo5OXg1?=
 =?utf-8?B?NFRGalUxMktXM0RWd1Y1OHVGb0I5bHZabW9mL294QXRpaDlLKzBOc1NQbEVJ?=
 =?utf-8?B?ejJZTTlHSVBMQ1ZlbVJKbEZUUHpkTENFdEJheEJJU2ZyZmp6WlpxWFpDRjJS?=
 =?utf-8?B?cmZTbEJnQUo1YU1GUisyR0x1bnZ0RGZuVit1OEdBM3hXSzk2Y0ROMW5Ddm1l?=
 =?utf-8?B?U1VYMjU1dEUrc2NUMjRTQU8zbXhQdFdhcUJTdmVuZDV0VW1Kbm42TXoyTjNH?=
 =?utf-8?B?akEwVWxvRSt2ZjFTMGtVK1RhZU1GenpyNWt6aWhpTzV0UGlNRFpZTlZibWtv?=
 =?utf-8?B?Mmt3Q1pTSGFIdnpxZFZsakJ0ZGJRU2I4QjVFaHRVbDRpWGFpZ2NFRm56WEdS?=
 =?utf-8?B?emVYakhSOHQxeEV2N0hwbFEzd1cycmJWV0srVzFYbktVYWxEUkRLekxjL0Zo?=
 =?utf-8?B?S015MzFGb1NENVBiakpuQm1tZG80d2FIQUgxQnhYYkFoWXdWMnEvaGQ5Y1Yx?=
 =?utf-8?B?T0EweVhmZWRtZ3FtMGpER1NjMndGVGx0VTFuditzU2VmMzUzNWJvdkxLdnhS?=
 =?utf-8?B?eGpoNEo1SG9kWUpjaUkxcERUaGFBQmdFQWhMRlprb3R5S0VDRi9pSmtuT2tN?=
 =?utf-8?B?MTlhYVFtZFBORkNxQ3dYcDluVWJwV1VkQ3dEeExHbXJFckdjSGk5bnZtamUr?=
 =?utf-8?B?N3RxclFreDlGSmpNcTdNUElJWUQ4VlNybXE2MVRrNTE0SlFlQ3RzM0tGNzM0?=
 =?utf-8?B?Zm1NaSt3K3NlZUpvOWFGTzdkV3hDSHJ5Q0tJdzVIem5EVFdsbnoxR1dMclNm?=
 =?utf-8?B?Nkh4M09VL2JvMVZ5QkptaGpLMjlzR1FZbDUvWG5FdVcwVldJZGdxckdYZ1NB?=
 =?utf-8?B?RmJXZ201S1FDNFdoYlRyNTg5MmNTMlBVOTE3dTNQRDhzRGUxRitsTjJoc0V5?=
 =?utf-8?B?ZEJ4NFRCYWpHOXR5a0xZWTR1WjF1K04rZDBLVk5pNFJaSk5MYXFWVXZjNDVv?=
 =?utf-8?B?R3lIdGlzb0VDMjdSeFRUVXhsMEJKZUphTHJKQmQzcHQ0cy9HN3FTWVZLYWlZ?=
 =?utf-8?B?Z0EwSTN3L3ZsdTB1aFlNbTU0ajhPOUVLaGw3SjZoU3Azckw0QjVsUTVYa01J?=
 =?utf-8?B?NGl5aVQwSis3ZkxZMk0vMWhLRkJtT3Y4RWNMUjlEZ2NuVU5uZ1dyVm1Kcmxi?=
 =?utf-8?B?VnBxaG1ZaDRGcXo0UlhkUTRRS1NyVVBXK2I2cklVZ05Sb3pqRjA4V3ZNRFVZ?=
 =?utf-8?B?R0lWSC8rZmRnb2Z2NkllQXVtWWxSN0J4WjZ6RE42U1BPNGNTKzlvM3FrQjZT?=
 =?utf-8?B?aGJ5Ti9MK1hLMFZwQ0l0M09XdWh4UW5SckxrOU9jVnVhNjgxeXdKalRBUGh4?=
 =?utf-8?B?WUpidXd2OEgxdGZjb1A2Qkp4cE9KOTZXWlkwMVduZ2ZyS1FQUUZ2MFRTZHFv?=
 =?utf-8?B?eDJuditUd2xRakpNN28vM1N5a0RNaDdaOFAyeFdZRUNoK2hDQXNpdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 888c7132-77dc-4c8a-c1a2-08de8ff5b98a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:51:07.6664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGHillGN2OVu2riJBPaSbdHJRYSNvfDDjqNbzp8T/Xl1cPptDpB2zfWm8Sk/41J3tgbKLPJcX6KjDin+eCk7oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2063
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	TAGGED_FROM(0.00)[bounces-12519-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AA55637BE33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> Now that the Rust minimum version is 1.85.0, there is no need to enable
> certain features that are stable.
>=20
> Thus clean them up.
>=20
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/Makefile          |  2 --
>  rust/kernel/lib.rs     | 21 ---------------------
>  scripts/Makefile.build |  6 +-----
>  3 files changed, 1 insertion(+), 28 deletions(-)


