Return-Path: <linux-kbuild+bounces-12525-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCSPIeY0zWlwawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12525-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:08:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4037CB4D
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29F2B303C00C
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 14:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D2943C054;
	Wed,  1 Apr 2026 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ivsu9j+m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021115.outbound.protection.outlook.com [52.101.95.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585D5311957;
	Wed,  1 Apr 2026 14:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054247; cv=fail; b=TLsu6lxk4r3cbcu9A1JBiwumqAm1VtLOZIhNonqS7vwlbo4P8NtBHy8j0346n0Zgu00hd81AmKEprWohgYu+uQZvcZo4ZB8sLdmBs5aZCq9SZlIv5zDP7gSHdxiCGC6pvopKi4bt2VXq2kak5N/s0cUnTnaYM3XS4kw14XQp4Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054247; c=relaxed/simple;
	bh=57pCbJQfSLdrftvGpv0WDMXUrZNqzFnLscg+EBpJyR8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=rBpCUOhygjyqlGg/cZkhpyqhEpAKSQjDN4bHJELSmNf2GhoHe1HDl+7jfk9BHoPG/L/Co88BAwINWg/xG5PBfUGmH1ZL1T9gzloXMk40ctN45vnOrMyqsRnDFCaG7/lEKN3VyLDo7/CLPYmk90i5YzU+1YVFiugY1OYcz/J7TyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ivsu9j+m; arc=fail smtp.client-ip=52.101.95.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOFnmxm8cPBjmWoJBhe5beDLqSKJ2QCnTOcQzQYf9Bx+jH3LNi5sSkDEmqebMLLdIDJOHhtgNhkHDfJX3tDB51SIW+FbvrlVu3ETtYzD4RuGPANhiLw4XuhCDW0AVnA961CjBSXRkb15MtjWrzYtWZ7aCe15saRMmh27UZcgU/JP0OeOYrov87A0oeHcYMRn/MPcEkwKbMhIUdieWVapx5iFsDurbSih0xLe4QVZJsS32UvWQeWN3DN1RfgeI4d2QjvMls/5ajHdTreGJ38BiY76+JLaq/0d8xTxbB3rAMlkne/ZmPOSIRMd+awn6uyzIA+8MuBxjtTRmdn3LHAdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8ENkD2ZBN5tsrwmpnHmuI5h2ivnqwx24Oea14ybxhc=;
 b=MP/8P1qTt8CwlD2gogws2Mj22Oxy4F/nN05FeJT23z5uLEDE8n54Wv+IXC4rn21kRJdM+EPIDhAxcyl0yA55ChMO95na9ChbKSAJllyMb8rPBFGCMa1Mz0D9ymbbgC7FwhNJGDclzktg6RJ7m8ySZ6sI+CzL7R5jy8Hzfpn1UFmTSCOK3p6poUhW2JO63u51QIhqko+LmOGZmn6CfoCi0Wnyqt1crNdQo5CywLPvrHYSb97e7LDoC41HhhQTsvuPDXObc/K459WEaC0PtdgNFb0xqiYl4LBxWz8TKE30+kdnGpXCmHKGhVeGTGMbPMfcHen/6puj+RvjiOv+m03H0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8ENkD2ZBN5tsrwmpnHmuI5h2ivnqwx24Oea14ybxhc=;
 b=ivsu9j+mhHK1V0RD1FKKQ0Zs2j82K7L6ybPsAf6sSo0oQ00z6EiBFqha7MYwjvrYExKoy7zbUH3dCmrEzwfolsK0kSbz8vC9t3IooCVr75Zmw/iU9QpYqkVbSsyC+5vrGx+fG5E7jtqULuTTga+/xYJbf0VTnv6gnmOE+VtQvxo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1959.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:83::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 1 Apr
 2026 14:37:21 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 14:37:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 15:37:20 +0100
Message-Id: <DHHW7OT205K1.2N2RSOB4SU8DY@garyguo.net>
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
Subject: Re: [PATCH 13/33] rust: block: update `const_refs_to_static` MSRV
 TODO comment
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
 <20260401114540.30108-14-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-14-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1959:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c6a804-657d-40ec-45e2-08de8ffc2f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|22082099003|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Uyv22NCIVevIrZH5BSTmyPcqNVeXnnPx12uFtx9jXhkL3DK+Ew+YTRXUBUa7b2RVcgtfTZ3GG+G/5/gLO+aayjJ4S9ZjYKQbWGlo3c4ujBHPQdRrUSJZe7TtwUSFSCXVtJzJmPfiJ3AZzjr2EBG6t/4l2N4XjMpOcsRrcRYsWG41q3E9iBvOnGnk8hWrlO/laA7XeU3S+Ez8P51z4GsOuGXQRAG2YligsCIn63lwrg1WD5nnKVklMuXJangkbTq4wTd7k4C1iUrqWjnkx5ccPhn1LNAQ7oaJXVMqAnp4SXWG1kiKfYQPZg5cHJiEUZcH7dV1hcIZsaWaOAiNvhLrRGnqmYYsiIIqE2CkSS7rr1pEsy0L95IA5seFNyzt6Jqz3gW4AdWRN0tn+7mBlr0NgvpirS42EQah1ZD5MMG8GZRd8RuxPhA6/l83wmbmvWKzRy9Kz5Cqi2uM+tEY0kRN4orlVMfQZaL+zURm6iwSIJbqhnrpDZxD1ny1fI67vTlx+YwKy5SiUvLbPvo6hCCdObdjV5cUaXAxQW0Ygmu/ILca19QNeUOyIMH62qFBco19QX9LpCHfmiAsD0KE/yxIzPUN0wzgcifPVCq4v9IUrijgD8LczloZiOghNDP5Fwx7OtJviuT6XcMrMYPDTG7UizEhH/fAedTPRvo/sAomg1TZBvDb8y37Dcbtmg8UXsrdU9t3KiaHWdXxkUwjQ6Xxu3EJKs2PZtsUj6ipmZU4mU1nNLyachNPoWG1TknmbAKFg6Gt9aYTpaAAAQb8czgg2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(22082099003)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHFKZ0IwU2VMVVY2NFZRWkFiQ0xsYVNNMGVLVFdacXZDN2lPTEVTUEVQRm9P?=
 =?utf-8?B?SXYxU0FIeFVRT25XQWdHYjE3dFB5bUc4Tkw3bzBOUU1Tam91ZzNIbzBpVzUz?=
 =?utf-8?B?cis1M1pGamdPNVY3WGdBaEMxRXVCelR6MFhIcElVT1BDNTljK0hiMEx4OTR4?=
 =?utf-8?B?Qk81WTAxUmFBK3lkSlpoZWZPTEJhd2d2M1lFY1Z2djZNRmZPc0Z3L3E2d0wv?=
 =?utf-8?B?L0d2UUdaV3NBSzNTZy9aeUhScEZEUklWNG8yT0lscUxmZ1p0eEZqWW9wNnQy?=
 =?utf-8?B?S2g2UFpjWEF4K3F1ejk4ZGJLRHc4UVczV1ZjYVltNVpNK2JTNGJSa1Z0VE0v?=
 =?utf-8?B?dHhXbStxamJHL3JvMFpLdi80MEJ6U3BkMjVEK1ZjY2Z1dnJubWt2Wm1EeURZ?=
 =?utf-8?B?ZmJXMm1JVzhsTDJRSzVnYTlGbEh4WlBMeGc3VXhSeDE0WE1acjNuWnhxUTQ3?=
 =?utf-8?B?VnViU3E3Y25zTGZKOHo2dlhqa0UxeWxCWEVvdXBmSXJKR0liZzBESDlhdGpy?=
 =?utf-8?B?UHNSejlQbVEweEtOc25UUDJ6THdtOG9xcFRvY3QxK2tBcVJNbTRqUjNDbWdi?=
 =?utf-8?B?YjFxbTUwMUFrQVcrZUx3OWs1cHhlMUxmMTdDYmpDdzBTckUxOW5OTUR5VEZT?=
 =?utf-8?B?eXVac05kc0tNNVd0ME50RGo3R0Z3QzdDUWhQQzlaMGVPQ2hqemxWakJzblB1?=
 =?utf-8?B?K2hSWGJUdjN2eHUyeEd4S1FGYWlLL2w2WWkvL3VKbk5ISEEvZ1lmdlRIWWVO?=
 =?utf-8?B?UTZnY2R2V2xzREZDTWxPRmRoYzdNNXVVZXZRYnJxMld6V2NrYmg4OCtwbUtU?=
 =?utf-8?B?Y1JtQzBpeWQvcXVNUGVFS2w2OWtpT2RsQ1dUQXMrRCs2ci9OaTNLUUZxSHJ0?=
 =?utf-8?B?UFRFeS9mQ05DMGlnR0k3Y05SSjlBWjJEMkYvNTFpVU9LQWFaODZFKzM3OG8x?=
 =?utf-8?B?T0pESFdZOVRjTmw4eGJURmNOdVVaaitVRk5HcmtpOGRjaGVuL01LT29RMCt0?=
 =?utf-8?B?UWFocktxSHByVkVUY3J1Sm5TVUpSYnhwY3Npd25MVmxVSCtoL0ZHOHBZcnVO?=
 =?utf-8?B?Ui90eVl5NVk4U3krYVF6U29pd3NuNEZjb0RhcUVhYmVSOG9qdmRVcmJXSHZM?=
 =?utf-8?B?VEVvZU9Sd3lrai9EYzdEZ2VQMVhiZzFKNmhpdVYwbUs3L1NZb1FCTmYrRno3?=
 =?utf-8?B?VFliMDQxWmowbDd5NnZSLzJDWWNNbzh1WUZ3QWxJdDU5dUVxWk5qcmNnd1Fw?=
 =?utf-8?B?Z1pSeGZIRW1OOGZDU0orQ1hyZjRiNkFkL04vL3F4WEo4TmpUVEZXbDJoZ1A2?=
 =?utf-8?B?c25EMmpCYzlxWUhHeHdqRVJVT1paakdwc2Z0QWNoVTZzMG1wQ05SeDZCQmdw?=
 =?utf-8?B?cWduV29iakxSYkREUEhSUUJaemVIZU9ocDdmSWcxRHRSRHBLdmlwVXRQSWRX?=
 =?utf-8?B?Rk03cUtTWFJzakY1UlQrWVQxdjkyUnQ3WUhDS3NXNlA2TW9yVXUxZnZhZy93?=
 =?utf-8?B?bHJ5T1NUZm5RQWlnZDU2SGxxUEdJaHlnb2FZNXoxSWs5OHBRMmZMb1JJOVdh?=
 =?utf-8?B?ajhvNlFVd0RxbFIxV015NWh4Qjg4NlFwbkxtdFpKWUFTd00wVmFwbm9vanRi?=
 =?utf-8?B?TlhKMC83aENuZ0VOeW1jaTdjNnBOaG13L29mcTZ3MHRrNkVGUXVCZ2w3ZVhU?=
 =?utf-8?B?YjRFYllYbVdCUUdUMVRwcWJPYjg5Y2twZDgvT1hiU0o2d1FoYWF3RHRudTFz?=
 =?utf-8?B?bGErOVIzWHc4c0VTYlJlYnp1cWs5VTB3b2tOaU5sWjl3aW5GUXFqRnBFWVNM?=
 =?utf-8?B?RVNHZnRNQ1U1UlFGVGkwYkRxUkFxUVRKdFFhNzlLZVNnVnVrSmJwZm9nM0dy?=
 =?utf-8?B?cUdUL2g5OTZHcXltdWl5K3MvS29qN29La2gvY2FPckZpV2JDdllFN2plY0pG?=
 =?utf-8?B?eWM4R1pJbXJnY3o2a09yVEd6VDc5NjZsWE5abjJvOGx2ZXFCdHNHRjBIZThG?=
 =?utf-8?B?YmxEdXUyaUNkdHJuTHVHNmN5RjZsWGpCd1pYcVlOK0xuMnk0VXJSdU1EUS8w?=
 =?utf-8?B?a3k0VnpqUEMwQmptRkFxSTZBc1ZsRlRZZUJkOEZ3VWs2dHliSmFoaVU1WkQ5?=
 =?utf-8?B?ck1xNTdFaDQrellmNVk0Tzd3M1dZajhwRG0za1BsMGJ4WVVGV3FwcjFITHY1?=
 =?utf-8?B?RXFTWE9VaGYrK1RIQjVjTFFlYW5sWGpoL0hORm1TdmhmZXdVRHp0MUNZV0JL?=
 =?utf-8?B?MEdMc0tkZWFsT1JycVdmczVHY0VmR3hyU01lLzl4THpkdGEwK2hVUlVvUE04?=
 =?utf-8?B?bHBZemUvZzZ4cjlSdnlFV2VHbGx2MlBrN3dzeEtNY0daNDVGaUcrUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c6a804-657d-40ec-45e2-08de8ffc2f0f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 14:37:21.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9NCti9ClndDU5+1dO6169pkbV7TCJWpuV9jinx6/ztzwu3JS7vPQf2QzbJ5s/C0l8e4W46K2OJu8Xzxc6q+sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1959
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
	TAGGED_FROM(0.00)[bounces-12525-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-0.900];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D5B4037CB4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> `feature(const_refs_to_static)` was stabilized in Rust 1.83.0 [1].
>=20
> Thus update the comment to reflect that.
>=20
> Link: https://github.com/rust-lang/rust/pull/129759 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/block/mq/gen_disk.rs | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)


