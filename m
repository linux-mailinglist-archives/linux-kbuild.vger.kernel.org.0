Return-Path: <linux-kbuild+bounces-12535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBr5CA45zWnDawYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12535-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:26:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A666937D0A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 17:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22A85303D8B6
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 15:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD5D3AA4EB;
	Wed,  1 Apr 2026 15:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jYXDi7P7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020137.outbound.protection.outlook.com [52.101.195.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844F936EA9F;
	Wed,  1 Apr 2026 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056514; cv=fail; b=WuaGfB8VElxkAHJtcMGdlxfIkXwxOYK8zWR3FCf7Lx8xd1lvW5h0qWevv3Y8HOSfeCRamBRONKaPRWlGbDigs/iC7BwJygjDx292JqS2JZosUrlTOcUFuE0Q1ykNsBYgRCfSl/WGFXKUmAu6wx532x6eO2xPFpazp963UiRapMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056514; c=relaxed/simple;
	bh=dFwJ/yLjEK76Xp9mf8qnM5tm+uuBXgGAF+2qsw60CxM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=V3zuclGa0EcGwF6rFcCq9df6R/0Ad/IpiOkKvWx0Cs7pZS3yHj1aVtz/JGCTDwvPVuibNDGpTfvZRfn8lPrPxGafDBlFR+EGZ/oBcaII41GNUrYOvFQb2j/Pz8iE8+Y07tHkXmV17/D1XCe0DI/d5m9vzmYPRUZenKLZK/BU0K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jYXDi7P7; arc=fail smtp.client-ip=52.101.195.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL86eoyHSdG3dJwxvbvs+i0QOHpFmU0EgAsBjQ35GUrSAuDrdds1+L5WBJms7ImyPuZbFXp33a+We9pTSudwAkBv2Zx7vW/JgT7tzLZ5UzLurpCYgOYDtwZUQYhv17A4SRqdkRWZJptieiRnTyG2Tl1SfpWnlecEPGdkgBjYy/DDYdygGQKBkdxnZxXacGYn3yp6ZE9oLp0thGs1XGS8Rc9EavY8qdHrobtc35ABhUr/fzacqDo+ExXPiqXR/vLhpkoahnG7JNcWlG9RN8zIl6bZcD37R15SS7ReYR2u8xyYpFNDVBkWUEUhwaPsiWrTQS3/AhhblauyFHHDsabLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIveiotkeGlE192c9KG+dumBiPtlgN2ju7yaOPdld0M=;
 b=ZMGkUlXrQSz7GPEHTqFapKwyaZ5E+eUbm/QFOyuLvZqiwCtC3/f2FC5tg/iwgzt3M+WY+cHK2mQ0u3hUqyGAEVSwc+7FX75TTtXE04LO02Q2HF9x+OpKVLS2+04Hu9b8AB9+mHSyIiXtr1lzVpj9kUbmsZtT78cRxscrK2tihULTYRp1jRl4Bl0jhjxHB9aodc2m+cD8L2gUy4YpTXZfkB+lNclWV+X+l3O099siFNEcCmFA5fd/77rYRfExGGqgAjLXcDqrDA9p5INIV45xH01I1QCvp8n/5mkLn7Emkwlhd0G0tsmqqdeLXpSkjos5Oj/5y99n9BNlliPRH/WX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIveiotkeGlE192c9KG+dumBiPtlgN2ju7yaOPdld0M=;
 b=jYXDi7P7W0SYPlxUPzvKi4vktHuqnu1f9Nkr4YFU5PmuPHwMeHJHAPjL1qV4P+l0OVPkFXvWcHbi9ok93ntuiQaq8mXuB8Rt+3PnIcIvNXX2RKTbq1bLI724Ib+YFHcJqFdiBYVQxe1Tb2nhHYQ/3i1naEV8W38CL5cnzUTFxB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5651.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:158::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 15:15:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 15:15:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 16:15:06 +0100
Message-Id: <DHHX0LG9K10F.3NNW0OGTARLLK@garyguo.net>
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
Subject: Re: [PATCH 28/33] docs: rust: quick-start: remove GDB/Binutils
 mention
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
 <20260401114540.30108-29-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-29-ojeda@kernel.org>
X-ClientProxiedBy: LO4P123CA0323.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::22) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b00ac4-bdfc-4313-0636-08de90017539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OYr5ZvfguCLkWwH7cRnSLnKVQ02OwxukuobmX820gGDbWFv1hdkRoFF1TbqYHusSuMcsA3sAJdG8EhXwinS01u0UGaCSg9XsJxVCu1f57XJnfL7wHzIyZDIHmHJJtDTbUEEa4jOQDvM7aXWJ2MjGIGoYRojcZdTgthR9pYgDhfnS42549v79xDSdUM1Cfm1QHAD9vM7eQ7ZvpfiUYlRXM1oyOA/dDhrcMMfimrhkPT6yT+0CVwoRTyqroUIQJB2anBpaXO3vFQCwMZnEHQLdZqjbLnnQ4uYGPlRT/oldrotTw1aLyU0xJOd7skePyQ8WLGrygmzgK9ViueXYU6bsDkFmHex8ldpMW4iJCsnrNRyZfuZWX9FQBSbLygZ0nu9R4uYhKaC+7mJrloDqadmpyxsz0O0xfjiV4OkOc36Gg48R+14sgVysYTyX+ZCQP84BS43GGgYjI2tFAz7pguTNQxmFKZkA5x8RoHOLqrMmc1eNcOZhCmR1WTDsCsitkjeZgBmx/WPnAQ5iwVEQiygQPSKbU1Ca9RUDhjd1wIS5lGv0Uf+bRI7niedrbGGNSZ80C7Vr3oTyRlDpFgkRjwXVZ+5fzhDA+1xICEawJTtLjaEVix7UtDPlQ9o27ovf24NRbP40sv8Orlxl3/bC66Mo2hj3YItnqPNwnNFCY0jLyt73G3BfiOvHAanLWfc913u6wpy+xwB+g9F2GA6+fzBxc+VXCeSWUp5bVIqZ5tO8Gc7lezzMohreoB9HHisGE13jzKu+4AQgxAWrfqB7qhSbhg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVN1WWhsZFl6ak5QRzU2RExaQnpqQ2ZVTkxrU3k3Uy85dnk2cy93c2tidTlk?=
 =?utf-8?B?NmE1cFovcU9MMGlwVk9vV0hEUURabWxSeWxHanFpWGZLMEZ1NlB3UmVUOG1q?=
 =?utf-8?B?ckZLNjZJT21UNWhzR3NRalE1YnNFeDNCUGNTdlFWNEw4YUNRTEJzd0NyYWdy?=
 =?utf-8?B?QU96bjkyYmZra3ErSG12M3JIMmFNbnlzYmJRVlBQSk9qd0pWWjVVVy9zci9w?=
 =?utf-8?B?djdsS0dwemNnbHNTTnFNWFV5VGl0YUdWYzFrZGtPNURyNWxGRjBzbnRvUExz?=
 =?utf-8?B?dVBMR0dYOXdXTm5Gbi9OMWNrSWtEdlpHaTRienUyWHNpT3kveTBrcEltRzl4?=
 =?utf-8?B?azRJTWR1aDlaSGdUQ245QTB2Z0hrRmVTMWR6N0lRTndRQTl6RmdncWlNQU5Q?=
 =?utf-8?B?dmRpbVJqTzVpdjVOZkYzWEUycEpUQzNhdGJzUjcyREw2T0JEVTNiMzdjam5s?=
 =?utf-8?B?YlF3U0dXNVpHTmttSDA0ZkJ0Q2VTbTF4b0MzU29zWlhUY0g2a0s3aWcxSjYz?=
 =?utf-8?B?b1Z6b2lHWUdYME5KVzZUWEt6cjZySE1pUjNxWTF3SFBDeEpLMG1UTXdQK2V3?=
 =?utf-8?B?NHdaNmR1bHAvSGhxcUpWZVJzY3E5NzR6ZE5YZXo3N0pTRktTZ3FZSFBQQlZD?=
 =?utf-8?B?OU80M2E2TVlCOEdmS1JrMmFidHRVQ290Qm94aHJCRm42em9UYmwzQnQ5SUMw?=
 =?utf-8?B?bGFvRG9rYjJxRFk1Zll5cEMyeTY4NjZjNDlwRHlUU056UHUwQlQ1OFZMbGlD?=
 =?utf-8?B?bmNIMWdGdGswaHFzeGxIejY2RmtobHRXUUg3K3RONDFEcDZFZ1BEdnpLc1F6?=
 =?utf-8?B?Zi92bTZ2cm5CRkdIZXF3MXdZMTZmQTVIVjUyUGhsTEh2d08waWtaUWRsQlBZ?=
 =?utf-8?B?SDBGaUYzSU9FUkFQdEgyNW1ma0NMd0ZLZUU2Q1F6UU1YNmU0ZGRFQWRqbDhz?=
 =?utf-8?B?RmlUMGJrVytaR1dGWEtoOHVNYjVNRnU3aEl1Z0RYQlk5OUFxYk1odWc0WE1n?=
 =?utf-8?B?Yzg1VG5NT1BYU0RZaTFUL0Ruakd4OVFlZS9aYW1aaFE5YVpOdmdlSnJoVUVF?=
 =?utf-8?B?V3RZZ0dUYlNpN3NCelRTL0ltNnN2M1pxT2hTOElUS2ptUkVJbVZ2aElXMWRX?=
 =?utf-8?B?SXZUUkVWVlZJbGtGdjQyWW5HanUxakxYWnNUZXc3dVBXTlM4ZFFDT1BnY1lG?=
 =?utf-8?B?SGNxTjRrUjVoZDVZT0psKy9DL1BZOGF1N05aN21nVTl4ZzV2eUZzNzdibXA3?=
 =?utf-8?B?eFZMTFMrVHhtaDNObXdMSUpuKzZKL0FvRVFjZTQ1dFN3MjhFM1JJQ3lLM0Nw?=
 =?utf-8?B?SGg3MWQ3Z3BqNDRmaDBYV0ZPeXlnOEZYZFZ2dmtrUjlBVlQ1OWM1dmRMZkkw?=
 =?utf-8?B?d3dzR0NiUXNHRHp4TUlhRU5rc1ZiUHB1aTR6TkhSZDVUUWtLTUpVbmlKY1JM?=
 =?utf-8?B?VGlKa2hzYjlVUzZxbmxxZ1p1SGNzRVBsZHNCWE54T05pMHZ4NXdUWnZEYXda?=
 =?utf-8?B?WmZCTXNPR0cxNER4a3NLN2lzSElxS2dMUkczdDBTL3hTajh2TWpob1YrTEdv?=
 =?utf-8?B?dmxEL3lwRkhOcnhPak9GdUkrTlRDTHRCeVBsVm1WaGhMWHBkbUIwdWNSU3B6?=
 =?utf-8?B?U0Z2NUh5NXFFMS9XRmEyOUJZZmpVOUllSTVFakdydWhSeTNheFdySjZnRnJQ?=
 =?utf-8?B?RjJPbE9OOHVmbGNWTE5tNHlSajgyWG11cFdZd2lpUmsxYlVNa3JOenlzSXEx?=
 =?utf-8?B?Ny9zKzFLdFZKZWxUVUhzc0dwSllQdlZhWjN4WFJpWVhVa3JGVDdJb1ZjS0Nj?=
 =?utf-8?B?MmY1VUZnejdiYURSUEs3enhPNkRZZmFWQ21pZkpITkpCY0k5K0hBMTJDUE0z?=
 =?utf-8?B?MW1OODNmVnAvb0pLVFBUT1IvS0IvRzQ5aG45aDNJQjB0RERPTDBZMU1xZ1J5?=
 =?utf-8?B?ak9yUWJoWTVNTE96cmNtUFk5Um9wN3lUQmtoK3gweWdNZTZkY0MvczlJNlVi?=
 =?utf-8?B?QVdaM0FTVkNCajRnUmY5TFRWYmZ5OEdwdGgvQXlXOTI4OUlaZGdEcXV5WHE4?=
 =?utf-8?B?OVZrUVpMblRjVklmbWRCbzMzMFNDTEh4ZVlxZlRpem9YWm00aU04S0Vsc0tn?=
 =?utf-8?B?RFJwQlNVMVU3c0d4RUVWYmpzd1NTcnBhZ2cvSGhxQUZuQnlTNVZDM3FzSEt3?=
 =?utf-8?B?cmN4ZWl2dkNNaHREQkMrb1B3c1M5ekNabjVUTUxEZDV1c3BQTG1YVlFuM3o5?=
 =?utf-8?B?RUp3WEFrZDJXaklrUkdpL3hjVkR2NXJRQzU4OVU0YTVVdUlUNk5VQmdMbUdN?=
 =?utf-8?B?L2N2S0RLR29yWFBNOUZKeWhQOElXcU00aWJpWmdVaU56bVRVSWh2dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b00ac4-bdfc-4313-0636-08de90017539
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 15:15:06.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lHflWd9u7AoLIoFJ49pndNMlb5mo4KUN7L4Yv+bYf3FuKZ7e2r+1U5oqTt9AQtzsC76N53PD3YPfie7Ht+YmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5651
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12535-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.976];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:email,garyguo.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A666937D0A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed Apr 1, 2026 at 12:45 PM BST, Miguel Ojeda wrote:
> The versions provided nowadays by even a distribution like Debian Stable
> (and Debian Old Stable) are newer than those mentioned [1].
>
> Thus remove the workaround.
>
> Note that the minimum binutils version in the kernel is still 2.30, so
> one could argue part of the note is still relevant, but it is unlikely
> a kernel developer using such an old binutils is enabling Rust on a
> modern kernel, especially when using distribution toolchains, e.g. the
> Rust minimum version is not satisfied by Debian Old Stable.

I suppose people could have been using an old LTS distro + rustup and run i=
nto
this issue. Albeit it's probably quite unlikely.

Reviewed-by: Gary Guo <gary@garyguo.net>

>
> So we are at the point where keeping the docs short and relevant for
> essentially everyone is probably the better trade-off.
>
> Link: https://packages.debian.org/search?suite=3Dall&searchon=3Dnames&key=
words=3Dbinutils [1]
> Link: https://lore.kernel.org/all/CANiq72mCpc9=3D2TN_zC4NeDMpFQtPXAFvyiP+=
gRApg2vzspPWmw@mail.gmail.com/
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/rust/quick-start.rst | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quic=
k-start.rst
> index 5bbe059a8fa3..a6ec3fa94d33 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -352,12 +352,3 @@ Hacking
>  To dive deeper, take a look at the source code of the samples
>  at ``samples/rust/``, the Rust support code under ``rust/`` and
>  the ``Rust hacking`` menu under ``Kernel hacking``.
> -
> -If GDB/Binutils is used and Rust symbols are not getting demangled, the =
reason
> -is the toolchain does not support Rust's new v0 mangling scheme yet.
> -There are a few ways out:
> -
> -- Install a newer release (GDB >=3D 10.2, Binutils >=3D 2.36).
> -
> -- Some versions of GDB (e.g. vanilla GDB 10.1) are able to use
> -  the pre-demangled names embedded in the debug info (``CONFIG_DEBUG_INF=
O``).


