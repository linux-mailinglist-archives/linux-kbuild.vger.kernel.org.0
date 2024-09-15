Return-Path: <linux-kbuild+bounces-3557-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 836ED9796D2
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 15:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A15001C20993
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Sep 2024 13:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113571C688E;
	Sun, 15 Sep 2024 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Hqn3F5/8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (mail-lo4gbr01on2100.outbound.protection.outlook.com [40.107.122.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D12C1C57BC;
	Sun, 15 Sep 2024 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.122.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726406984; cv=fail; b=qnEm5yNWNVXN3RbKtj3ytu6aCeO+2ybBHCSE7AnML6F9ngwxzUhHdLhTYkLHivRQ7VGFFqTc0d0c69jFUYePD/QKr+Ycxcuwdny+Lz1wg3QzznbQwmlr2HAPT+mENffFIUczYPPiUjtzGAiUD0phTw1Dwmbs/ZWWWArggxkg6Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726406984; c=relaxed/simple;
	bh=AyIxFsKHUqJkMwBn5DcmB5MbQ/57s0nwE4uZIFIc0nc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qFVg3CnNlL0/oqXcHwMKvjv70WDsU/A8inWFDbaetLhA5amxWa4LFYGP+beinkky2MKV4op7Bj6/L8DxvA74P33wCGzko/tNXkOAPg9CEwcuwR87Wl/i9N713HuaZOMdKu+JVN1FSD/RcvoBeE43jxz8sjrBaJjJ0tLZ0Dm/hgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Hqn3F5/8; arc=fail smtp.client-ip=40.107.122.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNzQaQ1Qd3yE5kKXdo682I9dCUWOXW5fG7V7p7f9fynhNVqXM05I1oP7ozFxdZGb9aUgQy1uTiscM1LyXA1qvEPAD23zf3PrHCk+8cKb9pK2C8d2mQ48IxEHWCPy+iKRVBcJBO206r6Yj67LsmKRrtbmehCIqRRY6TwwVuYkekP70LfRzRmRpXW+hvPIKNj4p7e1X1Owy2A6rLjuQuLCyXL9WGIEG5uk01JUtT1IntASRlV/2VlDYLZSdyo8VFwJ0GBRrI+aycf+EUWD5ohdVoNzEdE3CZ2T88vTOOe/4i4XPMbYERWYb9f6QBZ4Kj0yxQ4LoRHaimqDiE8S0TFNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baTeVckjfz5JFIg2XJGt6Pj6nA+qccFr8CEFuei7A1o=;
 b=yGcMxnsyKTmUmkhe74rACM96IAG0NZ0ZMGi9/ss98lELYN6JMreS9ia8+/WXZnCdaqZXW6YWq5TlRo1Vizt0kJpMnSDMRfulOUZBKfYwk+Y5CkJWKnQElQBeuDCAhV/h4s5IRHGx/FbEL0CVZ6FwEXcdMnffC1SrU0puf+17io99vBbW+0WYfwxiLVwFbT4eU6E0cSKRPFY2/yhlPknJwb2F7uAZauJAlMIYJKwkIy+BJv0rsFIh32suUjL+NW0RcggzPMwG7JPoFs32hVJsJvo5nQzyZxGHSQ4Y7d5BL3mVHKpC+9Pd6+gLl1puh+O4oAgPEqmVbB4kYC7Zf0l6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baTeVckjfz5JFIg2XJGt6Pj6nA+qccFr8CEFuei7A1o=;
 b=Hqn3F5/8Aar48dcq2BbchiOm8CczXMEtARKa4ccUFxlleNJghKdk3i9Vv5HthETsVv/vy0ZddIfd1adLaytLrTGGN0lefC+DM/C5WOqXxGcBDHns8Re+XgE4sAXHZJhyb+xG4qZrmeLJTxX9uAa+BwSi4FThLokYPbuvpGTZk2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB3097.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:15c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 13:29:39 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 13:29:38 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Danilo Krummrich <dakr@redhat.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alex Mantel <alexmantel93@mailbox.org>
Cc: Adrian Taylor <ade@hohum.me.uk>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2] rust: enable arbitrary_self_types and remove `Receiver`
Date: Sun, 15 Sep 2024 14:26:31 +0100
Message-ID: <20240915132734.1653004-1-gary@garyguo.net>
X-Mailer: git-send-email 2.44.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::6) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB3097:EE_
X-MS-Office365-Filtering-Correlation-Id: 904d8afd-d11c-4910-0794-08dcd58a72c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xjyykEVssTrFCaGq9aNLwU0gepJ8Sjk49n0i2FBD8sT73POtF00aHba48t8J?=
 =?us-ascii?Q?1MtCQidb5qna265D0OYrQHpPQXXsdijmZovD/V6eM6WrR9cPbDVMuBQ+gE8m?=
 =?us-ascii?Q?i3ARynkSEmbRE1SrT695jiVoKQw8v9TIgj22AEBwCoLJ/ZowcPodilj9s/JY?=
 =?us-ascii?Q?+W4JZbwlWnkTL4c8Wh+t9l/sTf1q74b+OHNxlQ+L2412fFy6ZMCdMbf46uIP?=
 =?us-ascii?Q?AWNbk/ykzwUtT57Y/pYy0ZAXciVEPEL0qnjX763V8oiITwXXVFtl3NvrN1eB?=
 =?us-ascii?Q?2nP/nIpROa4ZhPKzIJcKhjPBijoL6AkqlZoT6Eu+gfVCqP7YXuDRgw475EBg?=
 =?us-ascii?Q?nDmqWLBTJ8FFyS61DfY4SOUHBUhAc6n5X3fy3UHhOPdrE871VXxe955I/ngZ?=
 =?us-ascii?Q?t7s8jrLeYfwB6OJTMBdUcfB2d1I61g//1/RMeiU7FSc5IE8B8ehF0CJg69pL?=
 =?us-ascii?Q?5afrp6YOrvW0CmaOfCEqBRBe8lUl8Bxw5Lf0mPBLC1f/1A/qo883nRf1LpVs?=
 =?us-ascii?Q?btA7u5s49LzLxGxO44ZxZhFIS3iYZfMlDCVo9w/8MMDw6JviIuF6AzluAsy5?=
 =?us-ascii?Q?jiFyvrQj+oDDsPudXdH/sZArIj/qFvdsElf4vJzk6mM5KJjFS6ipwRc/3v0r?=
 =?us-ascii?Q?j6NTlDDdPguAmfDl6c2RSuH9Rg+FSJ3SKpB0ezPoBi+txzV9f0QFw9zlXLCA?=
 =?us-ascii?Q?nxxzQCtSgkK1kXyQ34XK7Rg6DBu+ubSgiIQGbUr6bzVpvsIOTBVLwiR476C7?=
 =?us-ascii?Q?W76/KbeKAhPM811YxZ+nheG/O1B9tPTuNocZQHbFnVFXTiZYd7zUcaza3vu1?=
 =?us-ascii?Q?z0UCbZ6Lff9mAafSPXAiB8E1wETuQbNfGyzH8zfZoQYfw8xM4ifQtTOWmmWQ?=
 =?us-ascii?Q?3CtM05z+uRVT+qNMJQnD8e4ZjkmYwB/MuqUKHxo5qHr+0u2RDZQZxIv8elkq?=
 =?us-ascii?Q?oe20ckma2VCbEg+6hepEXC0/121uNya7Vkcl3Bj28SF1Y+Md3R5AohSD3H3g?=
 =?us-ascii?Q?XU1w6hPjTEa6WWdQgUI1iSWh/BWuaQkKYVVNe0vzHdeR6FsFFUQWqOvIJY7e?=
 =?us-ascii?Q?xyY+zY7St0lBTpClv43CqbCod8V1VJeSWoGyf7q9WFZjjUvhXHwh0Qebttlc?=
 =?us-ascii?Q?J7M99ctQ2Jhypl03b04sXrjdFKUizvDbDrJZ+PiU1Qizq1sCeoNH+nYnFQIl?=
 =?us-ascii?Q?L8pKbM+4lq9j5tEjrRJLeDs8kl+J5Xb9sp3/QF/h0CrbjxrmtKriwqhChxQV?=
 =?us-ascii?Q?Y0YWEiaQ1ca2sUTEsE0wIisx5/CDuGA7ZjBFAh5cFFFN/mUqAAEA3YZMke/k?=
 =?us-ascii?Q?w9Anr2eAnfinfQjwQVbPlEsG45P8tb6l04iCiRfqgFiyM5wLr0RnOmZz8xo5?=
 =?us-ascii?Q?pxOTYMd+jnZjVzBLHOxH6DrZILyEf2m1vKfOpuq1FsdE+fGf3g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7I9MYiiOL1IMUzvsAOFvdTnk7W1xE7gpo5wAdto/ZPimt5ITp7AcN+3GtJv?=
 =?us-ascii?Q?n9LL99RpjJPsNxFrdyQk/49glAeegk3jzxHVk4p6yetlaubnpdnYINS4lvYe?=
 =?us-ascii?Q?WesM8cohklHobW4n3LxDO64Vln3ggCvvHvAEpoxH/w/3UEpGtl/sZ8gNqVjp?=
 =?us-ascii?Q?NiKBzKTLdwVJ952J6inUuWc8CjVemyMYa+uWN85XNfBjFY9U51o14MRYMudT?=
 =?us-ascii?Q?ruJPKYZxDR3SdxnaB64rkSevtbUQ1ob+owad/0t9TCdhprNVjzgVkEATiB+1?=
 =?us-ascii?Q?pnEB1fBim79O3JpkaO8mh0Ab+IsDZOSrzydTmam5P7E1GIaqT1CKif0Eb0Gq?=
 =?us-ascii?Q?ZKfceTGfGNTgRXlD5ognYlslMTUAMoCNxCQNxYbpdCRrfwrjMK1sw08qgZMy?=
 =?us-ascii?Q?wDdBuQdUoW+ZOaZ0w10C4/rWaJzdoaqZcOaQ9PZGj6QCDZDJS7hLKld8KR2U?=
 =?us-ascii?Q?Ki4fQPpmoISOXtwHA37rE5lZfnHlGLwR4aXPqzCd8VHQJf9KbhBvuwJa0U9R?=
 =?us-ascii?Q?3HsyBmML5NDiCq7Atm8uoc9gePiLz1OHItqGiplm3a8XxgyUT4Gceua3CzXB?=
 =?us-ascii?Q?9alUvTQhDLgmzOlQ8bNkIIkqVPkZ4oVRvo6istl7mrvQGK2vbpz6hnsiV5wC?=
 =?us-ascii?Q?xcdplL4RVKx3lTVVLjxj9blmPjcSE9M1wtABo4gLUcvChMiKhuVKO3pJi6Vr?=
 =?us-ascii?Q?722SWioeEVDgdcN02F5xOOHEJnwYUoZgPGgbN7NsQKrjggpWg/oWEhIU0WtE?=
 =?us-ascii?Q?jCu6cjoRB8aqGwefiFDklf+peo0Wmx5mW+a/M7xc7k14gNHbHCIT35ExsGJE?=
 =?us-ascii?Q?rZYqAXab76P1TZ6dzIOd10lgbd8UXH5shL8SNCFBP6MaqoxYM8FrnKVuCi4C?=
 =?us-ascii?Q?I75Nq8en6glspwMu0DsYyb4/vJBAo14pp6jFqouZ3Y8UpnIzwZ/cqkJoMs3E?=
 =?us-ascii?Q?mYldOqgZfF7bIu9ZU7FdirjYVq8dgbv0YuLpVcP/gB8lxJ5ihAqGGaJKOPri?=
 =?us-ascii?Q?9U7ZwwKmhOYQFvPzOKqLX6P4BwwTSw541xYOUTPs42RjQvC1reseokFcKqu8?=
 =?us-ascii?Q?puKJ/tv5fEiCywhn//keewR9hguc1OYFZsgC49715dgCAiVs+MykoWpH2rkj?=
 =?us-ascii?Q?bZX794UvTp60LXQAPvP3TbEMaHB3a/GfwHbMrCLjJcRI9h4wvojUH/pIUKYA?=
 =?us-ascii?Q?CBzoBRwN0Tmj6JsVDrwo+qUAckH4YDN+j0yo0F8sO8jP8SwaOK78bIyryMLL?=
 =?us-ascii?Q?FtAgugbq/otVyqjfeukujkv4B0JsuYpCVfO65DOgBmx5T/MXXDXZUHuSM4iY?=
 =?us-ascii?Q?iHp3Q9/uAWI2mMx/IyMn0brZV3Hpy/+L3h/YtKEwJKGjwiUNa/kQn6F6YrvS?=
 =?us-ascii?Q?hKfnHdhEwD9HO9QyTzc/pw3G10bghgAEGHuUB6tYUFvurMTeahkiJlwpBxVg?=
 =?us-ascii?Q?prIpe8DWLebYEb5s1mab4xf98rEeV6RAn+uh2UmUEcMxO2w6Trywi3YKfbft?=
 =?us-ascii?Q?D5OzRPwL8pOr2cxVOu52Iu2iFhxyMybdlfWhhQObgDeklIwl0tRPQX2I6Boh?=
 =?us-ascii?Q?Ta6NWK2oOvEJ4XphE0YYrbRI/exn6/RbLskXxFMehQbLsbytWkmAG6zqQOmY?=
 =?us-ascii?Q?ug=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 904d8afd-d11c-4910-0794-08dcd58a72c0
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 13:29:38.8682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcBn3u5wpnQAuI1cdwYPiC5ftu3C5nU72BjRyJ0Alkk2H0pc879hGIQr4WyaHo6N0MVhTm4Mbsf3rN3rcsjMZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB3097

The term "receiver" means that a type can be used as the type of `self`,
and thus enables method call syntax `foo.bar()` instead of
`Foo::bar(foo)`. Stable Rust as of today (1.81) enables a limited
selection of types (primitives and types in std, e.g. `Box` and `Arc`)
to be used as receivers, while custom types cannot.

We want the kernel `Arc` type to have the same functionality as the Rust
std `Arc`, so we use the `Receiver` trait (gated behind `receiver_trait`
unstable feature) to gain the functionality.

The `arbitrary_self_types` RFC [1] (tracking issue [2]) is accepted and
it will allow all types that implement a new `Receiver` trait (different
from today's unstable trait) to be used as receivers. This trait will be
automatically implemented for all `Deref` types, which include our `Arc`
type, so we no longer have to opt-in to be used as receiver. To prepare
us for the change, remove the `Receiver` implementation and the
associated feature. To still allow `Arc` and others to be used as method
receivers, turn on `arbitrary_self_types` feature instead.

This feature gate is introduced in 1.23.0. It used to enable both
`Deref` types and raw pointer types to be used as receivers, but the
latter is now split into a different feature gate in Rust 1.83 nightly.
We do not need receivers on raw pointers so this change would not affect
us and usage of `arbitrary_self_types` feature would work for all Rust
versions that we support (>=1.78).

Cc: Adrian Taylor <ade@hohum.me.uk>
Link: https://github.com/rust-lang/rfcs/pull/3519 [1]
Link: https://github.com/rust-lang/rust/issues/44874 [2]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
Changes in v2:
- Reword the commit message to explain term "receiver" and add
  background about the feature gate.
- Link to v1: https://lore.kernel.org/rust-for-linux/20240910120721.107877-1-gary@garyguo.net/
---
 rust/kernel/lib.rs      | 2 +-
 rust/kernel/list/arc.rs | 3 ---
 rust/kernel/sync/arc.rs | 6 ------
 scripts/Makefile.build  | 2 +-
 4 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f10b06a78b9d5..35a65a085bce5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -12,10 +12,10 @@
 //! do so first instead of bypassing this crate.
 
 #![no_std]
+#![feature(arbitrary_self_types)]
 #![feature(coerce_unsized)]
 #![feature(dispatch_from_dyn)]
 #![feature(new_uninit)]
-#![feature(receiver_trait)]
 #![feature(unsize)]
 
 // Ensure conditional compilation based on the kernel configuration works;
diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index d801b9dc6291d..3483d8c232c4f 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -441,9 +441,6 @@ fn as_ref(&self) -> &Arc<T> {
     }
 }
 
-// This is to allow [`ListArc`] (and variants) to be used as the type of `self`.
-impl<T, const ID: u64> core::ops::Receiver for ListArc<T, ID> where T: ListArcSafe<ID> + ?Sized {}
-
 // This is to allow coercion from `ListArc<T>` to `ListArc<U>` if `T` can be converted to the
 // dynamically-sized type (DST) `U`.
 impl<T, U, const ID: u64> core::ops::CoerceUnsized<ListArc<U, ID>> for ListArc<T, ID>
diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3021f30fd822f..28743a7c74a84 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -171,9 +171,6 @@ unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
     }
 }
 
-// This is to allow [`Arc`] (and variants) to be used as the type of `self`.
-impl<T: ?Sized> core::ops::Receiver for Arc<T> {}
-
 // This is to allow coercion from `Arc<T>` to `Arc<U>` if `T` can be converted to the
 // dynamically-sized type (DST) `U`.
 impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::CoerceUnsized<Arc<U>> for Arc<T> {}
@@ -480,9 +477,6 @@ pub struct ArcBorrow<'a, T: ?Sized + 'a> {
     _p: PhantomData<&'a ()>,
 }
 
-// This is to allow [`ArcBorrow`] (and variants) to be used as the type of `self`.
-impl<T: ?Sized> core::ops::Receiver for ArcBorrow<'_, T> {}
-
 // This is to allow `ArcBorrow<U>` to be dispatched on when `ArcBorrow<T>` can be coerced into
 // `ArcBorrow<U>`.
 impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<ArcBorrow<'_, U>>
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 72b1232b1f7d9..56b8c72687255 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -263,7 +263,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 # Compile Rust sources (.rs)
 # ---------------------------------------------------------------------------
 
-rust_allowed_features := new_uninit
+rust_allowed_features := arbitrary_self_types,new_uninit
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

base-commit: 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
-- 
2.44.1


