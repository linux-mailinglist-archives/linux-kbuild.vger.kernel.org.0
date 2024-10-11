Return-Path: <linux-kbuild+bounces-4056-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4694299A2E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 13:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C39961F2274E
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 11:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D75D2141BA;
	Fri, 11 Oct 2024 11:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="NMnumxg4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021108.outbound.protection.outlook.com [52.101.95.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59882141C6;
	Fri, 11 Oct 2024 11:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728646865; cv=fail; b=BuZeYNP/AfvaCKE0DuVt49sR+un2lTcq7y50OFZ1CsnhbmPlF0j7RbcajBZNvXXb5AgAHWyhtl83ztxTcHQpoMrS8b/Uy0si2sdVYHJQ0JzxvD/M0kVbGTYHRv7Ab4oImwlMnMwT9hUhApZicw4J6Hw7vnX0JpVBSnM2gJcwHrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728646865; c=relaxed/simple;
	bh=JcccRRsPniAGLkqMnQiqfz5bSm7USb+wXGcqWUMU1jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nr+HIho5EQouOeaLWn5f3pRvgx9azBVUMxsZQ9tKknw7N68OB1L/7HpTrokYRaUoJHX37iBEV6T9VfH8FRvRv/SqSNd1ash5kGdHDPyMdNHQpb5AtejfeMxQeNsdzVWaOYB3hz8gP8NPQo28gEBtBUW3LkKIxUolljRNytJOEqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=NMnumxg4; arc=fail smtp.client-ip=52.101.95.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J2a4mh8ikrTgoSsMS8Ncod8DH3VysJaJKpTWi2DVMjRevMCS9Muu7vXV/s+J4/ct+kPIo/3KSVimVUBVpAeJDSDSXnYOrxpTxPNDuvDQdlCMb9+I6hMKrIycvCNm4yfxQ5eE/tFmSOwZ0RwpcmSpzlCvQfV25zDJLRieT6Yh309WXl0V+tRCa5yXXoHEngn0rM/vU7IDp0QHdq3xQzK0hxfMvPcffJX+P4Kq6L3j3nd9Xw0TLiWUL4msn0tAP4R+ixwwwVTQFI82yV+63dj77bXC00xo/KX3hmsPG87Wv8adbejCkGYIWTtRc4VY4mtm/veySKIdMbpae+qxZ0+7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckjQRWwDT/eRcydao40iiwrZxOFMUcFU8yVTIXP/b7E=;
 b=hAP0wKRQdyfhYpCHzKU1XGLajp5ha9W+GBmrOzaekiajpRc17ZuXiD9C3DsBsrRDJgkqVDzxMTy22OS+6q8rY7ZBEGa93sjLSpLc+bIIdluonUtcs1Y0eEJeitexL0l4RJwAfpBkifjFym0x2mvrKpuNR3RB4PedOO12WXWzJy+Xf+EGTC3bYenbNEEiXjQ7VkzatLoKNWZbMd1eglhju2NYlGYqRRXxnq4/HN0fI9xH5t/ARXJQmIE4kZj8ukhWz10922VyD0bBCQjNrmbxHbmntGGRyt5qzIwx3WPemXf+q8RVCiItj6gvNWm3ujTRO66XS9ulbogh4AEEzfvKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckjQRWwDT/eRcydao40iiwrZxOFMUcFU8yVTIXP/b7E=;
 b=NMnumxg4J6QlO+803oTJdLNq34JzqzXrZ2wZLwzPRI/sWg2REV/H/Eqw8U6ldJxu7AqBzAnCGcibFURcm8Ix98B5uPhR7y4liIsJEzBaK/B2XMf5C6LuD8R5Z4rOdBbjw5mjf+3vOmHfgoDQJAM0LsOnFYK4lkE7zkWPBmpgHGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CW1P265MB7424.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:217::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 11:40:59 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.8048.013; Fri, 11 Oct 2024
 11:40:59 +0000
From: Gary Guo <gary@garyguo.net>
To: masahiroy@kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy Dunlap <rdunlap@infradead.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Jens Axboe <axboe@kernel.dk>,
	Jann Horn <jannh@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: kees@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	samitolvanen@google.com
Subject: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
Date: Fri, 11 Oct 2024 12:40:33 +0100
Message-ID: <20241011114040.3900487-1-gary@garyguo.net>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0548.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::11) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CW1P265MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb6152f-24c8-49e7-a1d9-08dce9e99397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sZxygTeTy5E1tufDO/YH3B/EMT893w5t3QGPu0uOoIWM496+EMyVYofuQ5tG?=
 =?us-ascii?Q?rLa8qSBcTk+UosQJG48Yeox98paeotySXhUgOl764Tj826mEKcevZPdJcwlu?=
 =?us-ascii?Q?5eXEHc7l0nOTc7M12kYtRyR0h2Z/nr1s4gTepRcZTbe/tKbVbY3ZyK7QBFDO?=
 =?us-ascii?Q?7B4RGPg6q2CzNQSyLRwChmXK2FDXaEPu6XU4Hc2EO+y81anTVqTUxKixSgSD?=
 =?us-ascii?Q?w1YB9I+avJQwMEq3uC3fb8tcr4UmznAj1mYB6KE+37sopGgTr3A63AnVh6i7?=
 =?us-ascii?Q?alzzBTIhCwlf+ea4dgZHe0SB7iPKG6GNX8r1BqghQ8RuUP/K0oxjUAtJ7xr7?=
 =?us-ascii?Q?2FNBFNNx8UUKpeTW1CkRq+JspK8N4GIWIZi3eBoa7g0ar/L+0iZhuWwt0UG/?=
 =?us-ascii?Q?7G3BVeVNklczn4aV9sSSm+JVuLlmgpMQ3d/RQfW51N6pPly008YRmY8JIaJB?=
 =?us-ascii?Q?ljg/TB19IQkx4Qh+3dlTuSJNz1Fsp7qy/VRHxaUPTnxWIwae9yjMVtwLxGh7?=
 =?us-ascii?Q?k4bnANietEQKQqvRAsLBn7Nr4CMXsy04w/4F367jVccELDB/am2BOhQ/UW/s?=
 =?us-ascii?Q?wWMi2Zj8nwpQ4O7eCR1kFYzen1pAb/t8EhMMnZXplNxW7aH+RmqJ56PIX3MP?=
 =?us-ascii?Q?GKZN8A5zCy3axhjl4KGzFzdjlkK90oanHa+O6foTJNGic5A/9s2eUskdZyoT?=
 =?us-ascii?Q?k1Gq7wL1pFqeb7jLmTDVg1zXuPKY8OZyPbuBDXP2nT/lOX668J/C9w3iWctj?=
 =?us-ascii?Q?Pu7Ci7DsXLEY6TY34DAJvU3js2z1W7YhUyIGC8EJIs0JXUL0jbf0t8d1Hz3I?=
 =?us-ascii?Q?kgve8Xf4nQjoUbI9TkKB8DtGqGR68NsaGu4K4gZ+qfOlSijts8YlvjyMLE4N?=
 =?us-ascii?Q?zODiA8vsEWx4BdkpvXJ2S1F2th0Ot6yqEoTUBc0+6jYBKGZF4jpMiCDDINol?=
 =?us-ascii?Q?OyEJ9pEfKMovrOu6qB9OG/4lOrHQK5N2NOIqnyeNmSQHOJo1cpEba3UVsSzS?=
 =?us-ascii?Q?LqS/YztUAS17FRqisey5jOZEkw31OBsQIlgXuyN4kb285JKcM3JvcHEXeR/o?=
 =?us-ascii?Q?2KU5THXPLlxOGBF9Uz7CLKcFqkn9sDXGawRpSHtQqdcEP/5ngOPTsUUzhoI1?=
 =?us-ascii?Q?CnxDmnPvcj2mecO1AFF4X3k56c4i2qARXTRX5Idaa+CrYB/OA6m3iFT/Nu6R?=
 =?us-ascii?Q?47aD0QK0M0aW5l7yUxB5HUe7VmbagPPMgHz9InbI6rL0oNqefJ0w2lW+yB0K?=
 =?us-ascii?Q?nlhVxZFLnkozeKWRaXMmls5cZi1SWDpbidE+AeHTf+PNC9dseymfCuJGwjEB?=
 =?us-ascii?Q?oUagcklAZl0cdElzV33TmPO0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uGg1tmJn72KCynIwO3RuuILZbwCNWlmDELgnsWiopu8R+y/Z//fsV3hDwQk3?=
 =?us-ascii?Q?C2zF64I/XROm4aTYiCC0AUmQdcKKYtvWmRNAnQ4QKa+lCIzD5hT5irhIQQ1v?=
 =?us-ascii?Q?nj53rN34oGEiS0F0Km9FWXuJH46CzwUxHOAi3o7A6olMXIRZwed3jmV+/gpE?=
 =?us-ascii?Q?MQqBPcdT+KZT7rVkCf9paSiwcBk4UWT4nzrJFgdlpWX1A8A6fmalgiK8WDCt?=
 =?us-ascii?Q?8myZodUbvt8ze+cZdj9B1JOgaRLaDSOUozmboEcF37RD13rNQGg1HeXMMd9F?=
 =?us-ascii?Q?/IpKybWsVDtWsn9RzJcaEGoF6r4mAHnm5If4fnEH6xH6y+lw4WGPt2+se0l6?=
 =?us-ascii?Q?KNgG0VlCctIwlBUDb0Cw9pN9c1zWMlRexYyAW0LgmJoYNM8tblvw1RaAaHrX?=
 =?us-ascii?Q?Sosw/siKzbp9PQj4nLbfFFWX0F3lKrWUYVCIIt/atXQgYYruoQNQVQLl4NkQ?=
 =?us-ascii?Q?FBcrx0qhreYUdvw8k7MNa2D1DFqP8MYPL+i+yUZHTJZZRP+SZKcmgKhjzYyI?=
 =?us-ascii?Q?AtTSvW0TqJJXTcwzWmj+BJQnZLKg2Vjie9bqDyVaxCkWShwMoBmOki5D3ciN?=
 =?us-ascii?Q?rzXuqzNHu4QRToxodW5IFne585Z1bHC69tXDZX69fC2OMM3l9kfW3kpDJGR0?=
 =?us-ascii?Q?t064xuWNQnaUbIpRWWg5lznP12XkFvtnMyuyY8DVhKltWy3AbhwYUXhnk1FT?=
 =?us-ascii?Q?RZ2RHVIURCNQajQKh+X2y/LxdkmB+7yiDqxV2xDy8+ci4YenMoKjO/2q/LJ8?=
 =?us-ascii?Q?NXObuPzSayLXJdpICzJ6h5jx2gW4gpRHRNf+3SWAyAjuW8QXxr1sUB8P8BzF?=
 =?us-ascii?Q?e5VPkVlKHXcSQMsbLzcaZH7n6JEMen8cFU0H2+Cnc2D2yvmn+zg3UEl1kEDJ?=
 =?us-ascii?Q?IMT0zUofk5fukWqUu7c6vucn2SfQx7yrDbnyKTnHfU4iSDOWK7Q+miACmcmw?=
 =?us-ascii?Q?GvC9YLYufoCARWU3D53qThT9M8g3AZHXn4YSQifSd3qUNASXWT8WGNBGYpIH?=
 =?us-ascii?Q?bhACTJ10/i6iXaTOcGVcDeNlwouQhlf3zImz8WFrIb4/fqmYNZo4yTiu6bXc?=
 =?us-ascii?Q?ajHbvM1Gg3Nq0gX0jWlNdDOoy/3b/Bh4u6NUDHzfsboeHIq5sTQr1dwCXAaS?=
 =?us-ascii?Q?ML4TsGP6VR+TqpGmWXEph039J6AScImcKCgz+GTIPv9jgcGa/k9ULt6e6HBy?=
 =?us-ascii?Q?KZqHpdhTOPpZay/6E9lYNSJftTo4ZxKAp8MeVKwUlIw6w1/zWBnvJluajyXB?=
 =?us-ascii?Q?38SQG3SC6yYN/qaXprbZ6jVHEU2s3rs3Hx0wPzcMDAC+eclcDJ4cFlTAP9Z+?=
 =?us-ascii?Q?VPLSwyidOGVEK8FotwE+m74a2m3f18poEQmub7dR6L1olRiyuPhyx56Q1+MA?=
 =?us-ascii?Q?kBjaNdru0wK/F8sb/yzfADGm9L9SiJnA8o8Yr8BuzHcZO++yKIZF8uBZOqCK?=
 =?us-ascii?Q?gVfLyDVaCiaJrb8CyOvKgUAYPuMa1N7fc8FmVyhOgCfCaWoFI/HB+FvwMj7y?=
 =?us-ascii?Q?/PK9YeNXlRDYQFj8stn8u0FvqTdhr+4JNOxOjhofQw9OWBOpQYBCpP8GlP+5?=
 =?us-ascii?Q?UgOU51QlYEGDdKEhzuYQ1whABlUW0mrPiExjYKe8?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb6152f-24c8-49e7-a1d9-08dce9e99397
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 11:40:59.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oxEZqg8jiXjBQMngJ3CfkhGovWiatj3gmTyiERAz/PzDjcULEYBMklupGv+qaV5P37PtN+hEtWAgYTjVU6bQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB7424

Each version of Rust supports a range of LLVM versions. There are cases where
we want to gate a config on the LLVM version instead of the Rust version.
Normalized cfi integer tags are one example [1].

The invocation of rustc-version is being moved from init/Kconfig to
scripts/Kconfig.include for consistency with cc-version.

Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com/ [1]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 init/Kconfig                  |  6 +++++-
 scripts/Kconfig.include       |  3 +++
 scripts/rustc-llvm-version.sh | 22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100755 scripts/rustc-llvm-version.sh

diff --git a/init/Kconfig b/init/Kconfig
index fbd0cb06a50a..304e2bd32bfd 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -62,7 +62,7 @@ config LLD_VERSION
 
 config RUSTC_VERSION
 	int
-	default $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+	default $(rustc-version)
 	help
 	  It does not depend on `RUST` since that one may need to use the version
 	  in a `depends on`.
@@ -78,6 +78,10 @@ config RUST_IS_AVAILABLE
 	  In particular, the Makefile target 'rustavailable' is useful to check
 	  why the Rust toolchain is not being detected.
 
+config RUSTC_LLVM_VERSION
+	int
+	default $(rustc-llvm-version)
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 785a491e5996..33193ca6e803 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -65,6 +65,9 @@ cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
 
+rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
+
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise
 # Calls to this should be guarded so that they are not evaluated if
diff --git a/scripts/rustc-llvm-version.sh b/scripts/rustc-llvm-version.sh
new file mode 100755
index 000000000000..b8ffa24afea8
--- /dev/null
+++ b/scripts/rustc-llvm-version.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Usage: $ ./rustc-version.sh rustc
+#
+# Print the LLVM version that the Rust compiler uses in a 6 digit form.
+
+# Convert the version string x.y.z to a canonical up-to-6-digits form.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+	echo $((10000 * $1 + 100 * $2 + $3))
+}
+
+if output=$("$@" --version --verbose 2>/dev/null | grep LLVM); then
+	set -- $output
+	get_canonical_version $3
+else
+	echo 0
+	exit 1
+fi

base-commit: f5e50614e39e74401b492a2fa125f2e2b6458bab
-- 
2.44.1


