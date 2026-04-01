Return-Path: <linux-kbuild+bounces-12520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AmzOugnzWnTaQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12520-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:12:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 424E037BEED
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 16:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 842853006209
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 13:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0A744CACA;
	Wed,  1 Apr 2026 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="CR/yjg0C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020073.outbound.protection.outlook.com [52.101.195.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1F426D19;
	Wed,  1 Apr 2026 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775051976; cv=fail; b=aeHW5/nOdOUkkrg5S1Js06hN0QLezqR4+xajmYzU4Rx0SeOhmnquF9yzr3k5VFgyn0mOfPRObhwE43SwlFwQg8DcN4YV2itp2oXFcQSSszmZ6gW+fUdtFDaKAoxW4eVDxvns7s5kBUloV/BCPunpIo9e5S5aqQgju3YM5KbK/Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775051976; c=relaxed/simple;
	bh=b+uai7eS/sQg33DpjZGV7x5IT+NfL7oewQvLrTzFduU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=A3ugKUphoSwn3jzw92MkbSZ6APJoWlkPAPhq+nOc1Kcw4ya2OioIG4BcXVqpVhvfV42aHMFK96jmeJYM0lb1zVgRJcNNLOg/Ks8v3P5VvNglAy5M5C4GvxdwkLBBxrdtVJezEqpg6uhzZ9WHyhSDwIEwqhwml8TaYLMrtIRbOrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=CR/yjg0C; arc=fail smtp.client-ip=52.101.195.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLe+oZzULe9FPMkkVQFnjCObZVF9eI5RM8vC0wH8ybXiUdnhVpzfrnjKkqzJ0pICAktWWDTKWPYAbcmrhGd9TdbiaxQUk3Q2Iu5Me94VVz/ZVekMPTLu/8jXHepW6+tUZBvnDLzbmQf98prGIdLdcF/emxHyMtFXgYzHm5keSRbQts7rBd/lP+aFAd+qxXQWZnSqwyTaSXWifY2R9HxIjXDh6/fORlW0XU9lE6IcNLG/WXJVNeHxQpfYDqH6uC/QNBiVpFSMeiqcRT7NTeplDlfTnvKpmJl2v/LLJxLMW1HpzA46K5jRYIVolkrt4Pf7sUgtr7v1kB1NvclKdEfuDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcB1TXDB3R4KqMqU/4Qj98B3Elk+KRtdA5bl2TAPotE=;
 b=UDpGsrEyT5iyDCjAk4/Nsp31qbDFGF6SwEtk4FvVT0AKVNk7UuHxJ645BDg1k8NroDzyz8eSPNjFHtUnQviQPvZhhz9VyLl+f+n4uM1qQo46zWHD9COUQ1LlCwxmDSKark7hfK1r9ZVO1xj+F/+qVa6JK/PXPZz73F7pNaOau06/25fapG90tzOaOFi066pbI7B6Ja1rzhS5Ao/Welwx5NZh1iT+4zLAyAItuxMRUISt3w0BTd9HDbBAp147u68qMmMguxGtIIf57rnwANVoWL3lwBJoEAF99OfvSITRYAPCDHZxuI+G+Ql7irptaQq5SKuB8YkbWLKwuGUdwMrOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcB1TXDB3R4KqMqU/4Qj98B3Elk+KRtdA5bl2TAPotE=;
 b=CR/yjg0C4FSD9sGmQmQRe+6hSjARo+4fpGpxNOExnhsYmfTXyIloHcpbQ60qFlqOPM73NFX6wnP+Fc0A6uOzxCuzR/vAqizW6tjRGNXStNgJ3ffx6ctBIgvlnMV3X4x9131wZ/78Bom7s/R35Q1mfz/2S7TY/z1DANYaN+k5VVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3059.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:59:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 13:59:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:59:29 +0100
Message-Id: <DHHVEPJHLGDW.1E6KDP9BUFG5U@garyguo.net>
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
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix`
 workaround
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-9-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-9-ojeda@kernel.org>
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3059:EE_
X-MS-Office365-Filtering-Correlation-Id: 5402742a-fe9a-4239-c8f6-08de8ff6e57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|13003099007|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	lJLHUhEuXuBUra1C2X2buN4XN4SEaPuxxGVCL+yUAfb+4Qf34e97t5m4t+Au5la7hkzi813vDD+GtkZpLuHSlREzWE3cQ2XKFqJ0okEEy2rD4T6OuyuKYJZvFWYg87heKp8TQd3ovfzSaxHavpmkWbZoWTQOdJlvV8j33iAgPv9s+Ecdl7r34nNDQ6Sw8E76WzlflgjTx8HcwbBCn0wTSi16DROgFaDhwS6JATs/cUCGfgKdDSqqq2orFaeYZ79PoGY14e+RtyL2OtSW8+8XcsxO1FX5CdBzEu/9AVXwv01s5HI3sop5Busb9ul4J3iDr+Dq/q5ABFIFoYp3QMRMoHXMwNTHQ+1GlHYJWKDrWOD6TNPGwGi0MPT44877UNhogISbxaB6wBMHqnFvVZHr9e9/5+0cbmu46CfH3gUx2eb2WEdHl8/lcQhKa67sBHBVFAQjQeiv+urMV3fKR+4iLmoyWMWx4K/Sx1B+AcIFIJBx6MZoMYduE2xJqADoFIay6ax7LDE998obTzPehrV9h4XRr8imnY2VSiYgAUN9ysPACpRKgjz50559qUioj+O8JIj9nYzFUwDB2UynL41HgSg/64qXEjDkGR4yHlLCdMm2Elx46qvC4W3wFTo1fQ5E2hfCxfFmFXyGeaPzGBV34beaSWjQKYievMpRk4ENE3dJkdIonGZD4LIPcXTLfLsNaCpdM5hNUk4Ar58AcSw7gjoUMbcchE2Zzh5lrwkMEBothJPowZkRrA6RaAj/7VSEG/Uq1e+zUlCaUowH3t0j0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(13003099007)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2VNWEl2d0NnSWdiMmcvd3ZVQnE5ZEJVYTFhQU8vekFIZmdWRWdtYnREdFRD?=
 =?utf-8?B?NEx0MmNwWnBUT1V5MlVnYmdXUWlXMnZFWmF4N3Nlak9yYVl3eVg5MmtPejdi?=
 =?utf-8?B?Qk1nbHluSno2Uktja1lqb1o3ZStMQml4aHNDRlRVcmdtSDdDNFBuRllSbUJx?=
 =?utf-8?B?UHRYZnJjNnZXV0xxYk94SzV0VW9SM3UzSG1MejlUTUVtTHZWMEhpSUlmOUtU?=
 =?utf-8?B?Z0t4cVZ0U3l3TFVKdHA0RDQxZllZYmE0VlJvd1pSQU9LQjQ1VzFmSUtZcmlB?=
 =?utf-8?B?VnphRUhiczRtS2RLS3VnaHB3NUhZd1UzZlJUT3MrTENYcjA3L1RaWkNad0RF?=
 =?utf-8?B?VjkrcEZHVDhaNlRHZEJPZzh5Y3hISUVINFdzK21UWktPZW9jVVRjT2xlS2RZ?=
 =?utf-8?B?UnNuMHF5TWIrWTlhamw1RGRwb2tkYml4d3czNGRLNXlDeFpFUVA0bk5PVHVm?=
 =?utf-8?B?L2FtUXluNzJOTEY5RGI3bW9nT0Zyb1VkbytDclJ1YXVuOTRhc0JQZFNjQy93?=
 =?utf-8?B?SkMzM0thMjdLRmNORDNLRXUrRURaYk5TS2JJZCtPd0dta3p2NXBjc3NnVUJR?=
 =?utf-8?B?eVY3dE9VcmlYV2JqcERrenYyYk9hZzNFLzI4TVVsTDI3ZnhwNjdHSXNWYi9n?=
 =?utf-8?B?S2cwK1BudHVIaUFJM0tvQnFlWHJrZU11bkNjUGxUV0JqeFpSaWt5dGVLSVRQ?=
 =?utf-8?B?WElPSVpEZzEvek9kdmZkM0duV2kyajNxZjlrUlhUVFdJTHZGUkpkUm50S2hE?=
 =?utf-8?B?VzZqSnlZRlFscmxDRnU5bWt2VUluTUxwK0F6STFucWJHOGRzakZ6SG5tcWNs?=
 =?utf-8?B?a3pVWWNpem1RMUdTUUlTU2E0K2RiM0NlckVtcW1tL3VmVjNoTVNOT2FXTWF3?=
 =?utf-8?B?MWx5WUVNNmU2eGVISGJhOU5aSU1lMVY2Z2V2NVgxcE9XSjdlL3NBME9kcDdB?=
 =?utf-8?B?anBDZ09UTTB3OXM5YzRyL3RnUmtmQmEybitMV01iZTNCU2JpK0hBUW1QbG9i?=
 =?utf-8?B?SVVSYXIxb1lMSklVUUpuejM5RXNPMWRWejB1R1NqMi9GRXdpM1hsMDd4UUcx?=
 =?utf-8?B?Z2o4MTMwak5VRStHV2JEV2NHWVJHM3BkQ1RHTC9RZU9tVWlkTUpBK1RNcUVh?=
 =?utf-8?B?UW9lM2xrR0dwaUJDREVZc2RjQlBGZ1RoZXNmL1pCY0ptZkFoZC9hd1lYbGR2?=
 =?utf-8?B?WFpqbVpUcFRWdUUrcEU4cStPL2MzTGpNcmpmVFFCaGJ3RmtQbU13YStZWFNZ?=
 =?utf-8?B?NTdnazl3MWZyeHhWTFNSODRoVWJxNWN4RzIzNW9ISmRhYTY3RWQyYzk1MDhY?=
 =?utf-8?B?clBsZXMvV1VkMTBEM1YwOWVEU1k4Vi96VVNzL1I0RXV2MDFTN2d0NjNDcWRu?=
 =?utf-8?B?VmowdmR4bmZWREMva3FFOWtiR1RSaExweFpyay80ZHJpZ21EcEk2NWpmSndk?=
 =?utf-8?B?Y2JyTzlSNmlyYW4xcHJnZjVJVHh2SlFFVFZRTlpVd3lFdkIrRnRSaVRXa0RU?=
 =?utf-8?B?ZXRwU3lZUDBtK3hueEU5bFU3aHYzSnhsWWYwUFVlZXJkVmo3bTVNQzdLN3F6?=
 =?utf-8?B?T0NmWUcvbzk1VUdCMVIrTzJhTmhOOTJYYVhBLzJEMVZlWFY3RGk2MFMrUE5a?=
 =?utf-8?B?M2huZGtFbXFiSHdLMWx1ZFdVcVp5TVcweVlSaVhaT2lmZC95Wk42cDFEdnNW?=
 =?utf-8?B?S0RIRkYrcDU0VzJaT1psSzVnQlVVTEcyQWJvRk5sYTlvdit0NUF2RlJRT3M0?=
 =?utf-8?B?V1VmRXNuWWFnajhQaDFqb3hhcGtZL2xjSzdlT3dKWDBTSnJhcm5ObHpGejk0?=
 =?utf-8?B?ZHFiWEJVeXFlODBQQWVJTE9YZG5LMzFkVnRnM1J3L2dKV1ljeDVIVC8rQzBx?=
 =?utf-8?B?OWpFZmRHVWxadFVoV1dFME1MQm4wNDcrSkthcnN4ZGUreTdRZ0sxQUkvbXFO?=
 =?utf-8?B?c0VWbXkwTkRYcTVHb0dLaDNHcWs2dERrZlQvdFVrQzFNZUlxYjNGeHBRTEwx?=
 =?utf-8?B?LzFaVTZzRE13QTFxVjh6U1dsQmo3ZUNIMVRiaCtlLzdaWklCTGduWE0xbUJy?=
 =?utf-8?B?NEwrWXJwMkFMcTRtV0pHY1pZalJwZVhNQ0luMmFWcm9scGtSN2UxMEJCWDBN?=
 =?utf-8?B?RnRlODE4MjVUVEY4SThOdW1KMGx2c1BrMlUzOHo2VXFSQUF1MGMzd3JyR3Ex?=
 =?utf-8?B?UU1yaGtHNzcvdFIvcGppN2drWFJmVE1lOWUyUmVpMFpndWdZbmZyUmFzYXRr?=
 =?utf-8?B?YWpIOUdqMjRkNHZicnVwUEsvLzhUbnlHOHpCQ0RsNGpScm1tcUdvT3lTMVpP?=
 =?utf-8?B?VVNIWkJiTXFHaEpzdWVqNUcwUlFaY0ZaT1M4Q2x3ZUVHSDFpYjhSQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5402742a-fe9a-4239-c8f6-08de8ff6e57c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 13:59:30.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bT2HFVNStRc+G2k4L8oaNUUlDGnMfmd/IDyJFZShyWYAZWqTaAMMN+rjSHdMhu5dmuDgaaYsHn+72Kd9nFmBtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3059
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	TAGGED_FROM(0.00)[bounces-12520-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 424E037BEED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> With the minimum version bump in place, `rustdoc` now always recognizes
> the `--remap-path-prefix` flag.
>
> In addition, the Internal Compiler Error that the comment mentions [1]
> was fixed in Rust 1.87.0 [2], so we still need to skip the flag for
> the normal `rustdoc` case, but not for `--test` since the ICE does not
> reproduce there -- please see commit 2c8725c1dca3 ("rust: kbuild: skip
> `--remap-path-prefix` for `rustdoc`").
>
> Thus update the comment and remove the skipping of the flag for the
> `--test` case.
>
> Note that commit dda135077ecc ("rust: build: remap path to avoid
> absolute path") re-landed the `--remap-path-prefix` flag (together with
> `--remap-path-scope`), so we keep the workaround, i.e. an alternative
> could have been to simply delete the skip entirely, but since we still
> have it and it will be needed when this gets merged, let's keep it.

I'm not sure that I parse this. You do remove the filter-out completely bel=
ow?

>
> Link: https://github.com/rust-lang/rust/issues/138520 [1]
> Link: https://github.com/rust-lang/rust/pull/138556 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 193cf06eea64..708530ee3613 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -142,10 +142,9 @@ rustdoc_modifiers_workaround :=3D $(if $(call rustc-=
min-version,108800),-Cunsafe-a
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/1464=
65).
>  doctests_modifiers_workaround :=3D $(rustdoc_modifiers_workaround)$(if $=
(call rustc-min-version,109100),$(comma)sanitizer)
> =20
> -# `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` o=
nly
> -# since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds sinc=
e Rust
> -# 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaro=
und both
> -# issues skipping the flag. The former also applies to `RUSTDOC TK`.
> +# `rustdoc` ICEs on out-of-tree builds in Rust < 1.87.0
> +# (https://github.com/rust-lang/rust/issues/138520). Thus workaround the
> +# issue skipping the flag.
>  quiet_cmd_rustdoc =3D RUSTDOC $(if $(rustdoc_host),H, ) $<
>        cmd_rustdoc =3D \
>  	OBJTREE=3D$(abspath $(objtree)) \
> @@ -333,7 +332,7 @@ quiet_cmd_rustdoc_test_kernel =3D RUSTDOC TK $<
>  	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
>  	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
>  	OBJTREE=3D$(abspath $(objtree)) \
> -	$(RUSTDOC) --test $(filter-out --remap-path-prefix=3D%,$(rust_flags)) \

Looks like this is going to conflict with rust-fixes (which adds the
--remap-path-scope). Perhaps worth doing a back merge?

Best,
Gary


> +	$(RUSTDOC) --test $(rust_flags) \
>  		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
>  		--extern kernel --extern build_error --extern macros \
>  		--extern bindings --extern uapi \


