Return-Path: <linux-kbuild+bounces-2745-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA7940FCA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 12:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C90F81C22AA1
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 10:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C3919FA82;
	Tue, 30 Jul 2024 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="xML81jQr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021100.outbound.protection.outlook.com [52.101.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570219FA79;
	Tue, 30 Jul 2024 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335933; cv=fail; b=nhC2jF//Kgr/80MT9QyQGBrkAWKIUlRbwYFpDJiE1AIWG1mcdDFJT/VTD30OPgIhUm6flr94ihcWIoWhCZmChLUM0GGidraCTBtnADtjffz2gtl5Rz0F2ApvXND62ti+h40OBfyio38flaBMvwxxvwlCflzc/ZvTdbbxwJ2ZfMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335933; c=relaxed/simple;
	bh=sFUHklFlB3pL97L+4clVdXPF3TY5Rkw2gJlQAcmSsec=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rx7qwMkG3FY7DYBxWd5/adx7+4lVcLOHgtWV+YpjZMBT3QR6Ze81usCuZL/UT4JatQxRkzJDxaO4uddYk6h8dUdvAYgFvVZaFCvGGfbP8cl9JJqLFfegzzGN2kth1vKRrQT5pR3SUOIEcLJtMfRGDVGwbwslufbtscU9TE/lERo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=xML81jQr; arc=fail smtp.client-ip=52.101.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWtBBMOmhoJrICmWx8Xo2huNPPG0vV/no5RtwxxFVPeIHjOSGWDXvm1S+uTwIuecjixaiujJ70hFothRxEx91JGJOfYjswkuk6SAl+dk6RrEZz3aIbKWoOsNlNotqbEMOWmGS9pVPOg1aU1UnEeVQ6xibdXnPQwEkNQfDFHa7eBja8967VPjGJH7qEBNRY5lIY6k5pKDrjvzMUf+xTF6LYHxQYfwS7xK1ImVjHh9E01itl6RDrrw8Y6JEihxlKU2h/EyJQSWnFzKsarQoPwWUVC4sHK8zYxHUJ0uVe/poNLOJOo7W2vv/d3rS86aUAOBN26dkPoMqwAeCqVTnb6QWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTsm/unWOMN9y+SlZO8G8I4NReJkHKJ0UiJDyqK2g9Y=;
 b=A71tFLpH2zpcgKJmsZfLVEQuK2uNAYEY4Kvq4epKR+n2JgCW4W69RqN0EXJHgmL24taO9zMLi8UZIXkymLN5/vFA6iE8cyKrF3+neqoBXdE3g1dcT09pg+NDoiZ7YHEe0jG5J8HErmWXb4EChc1EjoewO1KzN6tyaHPNVcNof8ntgdAe151FaXcXj2E5gpXWtSm/7S3CSsPQzDIRQslC1QWPQOFuHIY6XgHPneRj3aPgUHZDJ9O/GTTyf660kWd3B9wbHEMrjojgZfSZdh/GqwsL7EO+HDy01zMsikIHwiVyWDQWewEgJzCvfKemfMW0wx8AFBZoyyn7Hdom8yN48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTsm/unWOMN9y+SlZO8G8I4NReJkHKJ0UiJDyqK2g9Y=;
 b=xML81jQr2Dbrf0q+ldvxlpKXQTOjdd/0i204/0e0PHAat9jL2Wa/2xqicETQA/bZWsOT+GSJBtTVhzV52CgW8F1qJ2UqnX2oM8+JVX4NYfJJF/hV1Kj89ATQxPWlu0p9nCwc5J2rCDr/GwDaMt+YCOlvzuuvD8UBqDhWplKTIho=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB2748.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 10:38:48 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 10:38:48 +0000
Date: Tue, 30 Jul 2024 11:38:46 +0100
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen
 <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, Miguel
 Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Matthew Maurer <mmaurer@google.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/2] Rust KCFI support
Message-ID: <20240730113846.6318d806@eugeo>
In-Reply-To: <20240730-kcfi-v1-0-bbb948752a30@google.com>
References: <20240730-kcfi-v1-0-bbb948752a30@google.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::11) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB2748:EE_
X-MS-Office365-Filtering-Correlation-Id: fe02a538-096d-4fb6-49f0-08dcb083cbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fNEVExSjEYtIZKylgN1DhcvnId0RJk2KNLRH4w9LK+k6D88tYB13hLxnb/Xa?=
 =?us-ascii?Q?s1rz57uUN2SekR37cWzc8ElMcfEfe1+dKI5/Ygf01HUifrauuvFjNw4IZsvV?=
 =?us-ascii?Q?JpA9XvVwTX+Mj2MMixUXR0/a095PpoJN3KUX5aRP+mg1sAshmRhB9DA+QC+C?=
 =?us-ascii?Q?33qYkfdernXJyucvnA2D7YXjeYsZ/XmWmEraa7ipJtxSylqWHYaG38f36MTq?=
 =?us-ascii?Q?F6iH7jHDvITTS7Rwy0EzkZRY9twP6vd5OKUYy05vN9OzclF/Pl1WWBdDXaUR?=
 =?us-ascii?Q?Mk66FOuudPV4H7wnzigKxUjCL6nZ3cD6jiAfY0gERQoMROjceBanyxbs31nT?=
 =?us-ascii?Q?RiMCTqt0mbW+GUcm+xmOz4hnDcWz6AOlWq0OMh/SlMgTGRBMogkF+2JuvP92?=
 =?us-ascii?Q?5dRmLsnVZcgTBr+qmLUYK/WUArVGYiBArevgaH5y/RVMyIau33SAK6ZgJxzi?=
 =?us-ascii?Q?rSImesmfCVT2hiJXIS8phtxJuIxrDYXxCoAdpvVQAjFn4x30F2Uf2TsOC/GH?=
 =?us-ascii?Q?wOjMDZb+nLu0VwncLLMrGO4E0BJEgsgmUq8XsL6Qh9iZehMaso8JaFdSCTbz?=
 =?us-ascii?Q?hT6m4woLiq5xz65VzxJu24MKEtFrONeiY3iv2zs6ZMfylUe+nXQ5R249X8pZ?=
 =?us-ascii?Q?x1t+qW5VaGdpuyCyUgMtiiz6tEJXb09DXdM+qNJpgN7kpWbFdYElaF7OhRxm?=
 =?us-ascii?Q?ur2F8/f0Fz4oJRbUxF1HBrvp8i0xj4vpXDEKhMZ5wBmLjmNTC5l4VhaD8Ssi?=
 =?us-ascii?Q?sJprb20wwABlypvkOdK5c0y03xzD78BLDtxCp6MfYZTMMIjuNq0lRWaXEiQR?=
 =?us-ascii?Q?lhNs3VjBmUdHtHg9xuKJwkJ9zGAh8pVnHu7WhrWkILCIyUkXy+K2njFfhbAE?=
 =?us-ascii?Q?zDO1wAYeTwf7MUsjovrmB1wcAmu/xUe5Qcb5tZnuBtluIIDWqagN8v0ieN5b?=
 =?us-ascii?Q?2qk0oB7XdpMTj0W+aTKPjUtXFat1D5TuAvmkKBfL3uhaW4pq5fTqAeX4YAsl?=
 =?us-ascii?Q?I5b72ny11hlUCfKr0Peih00u6p2aVb7mrdEiL3miPkRhqgNMJTcJxft8xhxg?=
 =?us-ascii?Q?j2VtS/a/mN3uUn/XXvwIOK70EGk1D2rBy/kbIb9OlqD2hPXidth6dpB3Wush?=
 =?us-ascii?Q?nishTKr98wvAx56ZF8MS08DKGc1EnlC3N1gROXf4MhZl93dP6dA9kLFX8YFb?=
 =?us-ascii?Q?7zbdz3/lSOaVjAXxgnN+asrvYKYLkd0ML7FSCu6vnqGRmRDFCDiPkoHO0I/D?=
 =?us-ascii?Q?+vr12zPW5ZJd4E0aoi8x+urgLOCSfEMXNS7WuoyFojVdvUSvjhdDsFINVXKW?=
 =?us-ascii?Q?lfk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dzh8HzS69P1C3QVskDyKeIE+fuNIadm9DAIZCaZKmM299U2/xZ3IiayFPGBl?=
 =?us-ascii?Q?Jmh6Txstoni3NsVmPsOeIIDtP3cDT5oB1vJsdR6pru+AnF+X6FYO8IbiUZUj?=
 =?us-ascii?Q?nWLlr/DNXUw19ClUla9MUXkUPqiclVxkN83NkM1kHItwsTd4Iblh6GPZ8sBG?=
 =?us-ascii?Q?vQ3zhG0UdnLlSJ2saj6WZY7aYkhOi/MU2gJHLbhuHHB3f8vbzjYPB5hnShXV?=
 =?us-ascii?Q?o7pHKglCI1UL0dcw6MV538imkSp2CV3smC1x6AszXiFOIWvA6jZiCk3Oz0K9?=
 =?us-ascii?Q?fhrfaoDhktbBjYo7P/tomQKFfuTbWslYmOHVdN955AMhMVnFjyGlnPS80KtK?=
 =?us-ascii?Q?jK2wGT9D/H2bE9AdiN3gy5GcqQSkORPYjE90k36iCzeAno+RWHsaTykyF4U/?=
 =?us-ascii?Q?+AvrRsJrNZ+8zFG3yaEgUFdYUiosN4YbVmaOpOiHu6NetGNajdQvt5FZd+LG?=
 =?us-ascii?Q?mxAdwQsj0Rz38p+JpVMZHfPDibHL6UnScMHYuaxXyq4C+Pv16whHKuUFt65j?=
 =?us-ascii?Q?EOoKIRue14+5Be8lTDS2USzoBe0vOvjcYok/aKln1cYD63NpTSj4oaSE+K9w?=
 =?us-ascii?Q?LpKx77k0enunFJ057LozTqkLBN6xFlP2OW9hr2EZRpKuwW3XSNn5SC1KeRDd?=
 =?us-ascii?Q?wKTwW1WkhyIOAWaBEWVr20a9Mer9Er3cWlMvmF6Y6BZlQn8gPfK7V4EAF9Ld?=
 =?us-ascii?Q?3tsWc+j0X8C3A+CyIAPsBQwbq5yNFUykkj0ccjf0pAkRp/a43+VdBRcGCC2l?=
 =?us-ascii?Q?yav+hAWFokZed5U+IJOQMmluqWGh45kJcniB9QHkv21MvpOJb9lA+xdK3VQD?=
 =?us-ascii?Q?tMQ7opn6rdcI8nz5E1F2xMtGRiqiGm1YQbcoguQxFvGOl9PHVEtb1KV+i5Xn?=
 =?us-ascii?Q?ocGhNGXpkoDYOdbwmvPI2S7elJhPLddL9R9lBoo2Mw77Hgo+Wh3SyHG4MCua?=
 =?us-ascii?Q?Wc9oiYx9YRQ+6feIOzGl1bUX2xrR51wmi8/J6vkOfSUFbt+YjShi59CK7IA7?=
 =?us-ascii?Q?jmSd1hHCiKOloXv06dM1cGKQOZGS3nwnH4ns8coXL30+cyQysryvVgDTSDFv?=
 =?us-ascii?Q?f2jr+j3kTb58sxFsXkeuG492vchsEXzeSCr05eXFNOxJDoUG++sZdERsAteY?=
 =?us-ascii?Q?Yi52EJCzF7lg5z+4sE/1YX6MBnNNHiGLjxplJ5c+H4rFXzLAaeDMA0D2DG7b?=
 =?us-ascii?Q?RaPwwHoY+QbMfLi/QIZiDUvvMM14ERH7Pl+zfz0RnNirIabPOG4rlcLsAbYe?=
 =?us-ascii?Q?nSVRl3LYyQZ8iUYiN/VDQQWE7hdVbWB/A7eDvgXAl5562lDJQBd7Br/Qlimv?=
 =?us-ascii?Q?NspmX3gd3F42ertb7Qxp+RnkaicVf370BFalN5Ql41YOwMwQHSdr3r0KV8VX?=
 =?us-ascii?Q?lKhOpBKNVmww0NJF7nVymoW0++Yy+Z7fJuhOU2/lHOL2FLFcDveMhT3waxPZ?=
 =?us-ascii?Q?iYp7orzoj/lP/BJIl6h+BHk5uy+aPrlm4dbN564rOig67AsBahIXxyIkcYOa?=
 =?us-ascii?Q?8RdETBk9qL2yRJKDcSspg+XjLSIzP5sVUOMqt+WXzCMLNmQobW22JMxZ+v+a?=
 =?us-ascii?Q?bf4iDjRV/2+HmzFfqyelS1pN7Qs+Jb5f6cXxjoDD?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fe02a538-096d-4fb6-49f0-08dcb083cbbb
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 10:38:48.6568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aBHCJNXgIn8kgLD+iWWW4235rEYMi8DkyplTyqZjFK5i9KPAk2YDyk49tr749RlmNU4YZnmWF3hwRNYkHNBog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2748

On Tue, 30 Jul 2024 09:40:10 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> The control flow integrity (kCFI) sanitizer is an important sanitizer
> that is often used in production. This patch series makes it possible to
> use kCFI and Rust together.
> 
> The second patch in this series depends on the next version of [1],
> which Miguel will send soon. It also depends on [2].
> 
> Link: https://lore.kernel.org/r/20240709160615.998336-12-ojeda@kernel.org [1]
> Link: https://lore.kernel.org/r/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Both patches:

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
> Alice Ryhl (1):
>       cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
> 
> Matthew Maurer (1):
>       rust: cfi: add support for CFI_CLANG with Rust
> 
>  Makefile                        | 10 ++++++++++
>  arch/Kconfig                    | 11 +++++++++++
>  init/Kconfig                    |  2 +-
>  rust/Makefile                   |  2 +-
>  scripts/generate_rust_target.rs |  1 +
>  5 files changed, 24 insertions(+), 2 deletions(-)
> ---
> base-commit: 8718bc07faa6ddf4f7335a12e4cdd4ffc796bbd8
> change-id: 20240725-kcfi-c592898e2bfb
> 
> Best regards,


