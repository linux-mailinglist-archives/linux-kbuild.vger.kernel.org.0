Return-Path: <linux-kbuild+bounces-9963-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE41CA0CC7
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 19:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1783930012E6
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 18:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C9E253F11;
	Wed,  3 Dec 2025 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="j5rZyJJM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021092.outbound.protection.outlook.com [52.101.95.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C495255F3F;
	Wed,  3 Dec 2025 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785407; cv=fail; b=HpPaPIf05sj9qRtC3Bdd08rib4CQvGI1mFdFgKyBPgEOUy8HCXR+CED/1EJd9653Ly9WC5d1/N5dkfDQS1wsAtD0T7NjS3VHni/YlNV155iJBNhf5dk7wVoh1rstnOu6fjl/qp+7P7LIYh46MVj5zrA/Wf1lfb+SFetg6xBvEQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785407; c=relaxed/simple;
	bh=V1bkA1RKJXpHCUyVAZDViNmOwJDITfnxoLQXX6pPwms=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eM/IRTbjQz/aNynbnOxLskvfQln0zP+bnyJ/jPRwg9E7tVFsfJkRtHHeajKW8FCfq2AGnRUGcb+Onm2SPLZ73/E4+0hwrd/v+/dQONgzQCOQJbet3N5/OAMDx7QpClkz+sH2idUA155MEgurgHU5Uq1L1WYyvi1oKlMacl4UvAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=j5rZyJJM; arc=fail smtp.client-ip=52.101.95.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpxCcw98Er9lEEv2ZrSjy0wxVX7090XsVgS/Tu9M6GucCLW9RO/nDhBOyD0L0lkcZRoAD6FQa7W4o2HCIVEOGNhQ3K+sNR/0ZV9Z5oAHywZCLQQchUq1jMiN/wX3fMOLSZggRh8SKUo961SifrWGvaR2/oSxnUd+tz7NKyjiKESEvvpWyxz6qNrw4dMts5zV61UULPKR9qXVm9DOahD6h1MKCZ+0K088aYdhesaZDO7t58xcXevYcGK68Xu7GIhMeAjRcjA5FuQUJDhfLahL8gAM96dY4dTkC/QcQiH6Z4UyEZn5BGq5En36JAwy+t+I4gBCe/LTAg9HKd7BYKfRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CexfHDQVtU6Ucrh0kKELVpCwL8tP7Wkn47wKP4rMe5A=;
 b=CPNl449Y0BzmGtxGwdRMv6C2LKtYitRq/mVRReGMjeLAl4N46id/jr4vO/pOkkIOvApeXr+JkYSKi6lLPfrIxuP9k4+w5Bcx4UM30fRLDM2gZFCJ1yiTn9UU9XHElRURYTpgiD2F0B+YQdmeXjLz4xQ9fPyxzGDUUX5120hFKa53VxWpGKIL6xqdbxQFdMlzBDLuk6rLX0uUXm1qTY2aKcc9SEPgE9zO9x/fTL2BY23NIEdhn24UDIOfLHqHa+yhoPXke/vhTe+M83oAwZjfl7AdT7jiwDwg3F+15tCJ4QS4wYlxGbODwMVlJwoUv1BTC60h6KJIpH7nO/ld0yJ/7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CexfHDQVtU6Ucrh0kKELVpCwL8tP7Wkn47wKP4rMe5A=;
 b=j5rZyJJMPVyztCs+RVx3dMDju5iZarcgGUlCEuwB1qDcAjq0KqD7xSpJM94BCM+B7UnfrAjxx1gEJnLa0T/15N4gs1f9nPVwmTmPwp5u64Cmv3bnBXlUaupUXHF5SxSTZSD8NkJC2xQ7GBV7BC1EWszusdtMdHOKdDmswfK9TJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO4P265MB5979.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 18:09:59 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 18:09:58 +0000
Date: Wed, 3 Dec 2025 18:09:55 +0000
From: Gary Guo <gary@garyguo.net>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, "
 =?UTF-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki
 <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
Message-ID: <20251203180955.20b41904.gary@garyguo.net>
In-Reply-To: <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
	<20251202-inline-helpers-v1-4-879dae33a66a@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO4P265MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e487b0-0780-44d6-c641-08de32972ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xULtH1uQ5/WVaYKfYaadhQu6yqkbmFt/J2GRs0Mc3a9Pr3BWkxWxkuo9io9F?=
 =?us-ascii?Q?j6dXIyq/s7J4GqKY21w/d9baw/oGBgeseF0D8kMELbXykjp3oY5EWCQAMnpN?=
 =?us-ascii?Q?G2NF1lbBDviCf7/D5uplX9EczYN5G0sSa4z9BC95X7N3wu9O1mmbawD8XpDQ?=
 =?us-ascii?Q?gCXx8SqwcdNzh+O1EeQDeuWjQx/n+RLlSNmJbQWVXJrmv8atLc4B723JJko5?=
 =?us-ascii?Q?UrNEBZVpv+ZufYAY8Az7Z2a0uwkflX44j9BB9atIiXs+4phGRvD4uqgxjabC?=
 =?us-ascii?Q?yhA4NNhcaqQuNprqHtERUBhlJPZt7EpKq6H2zBbwJFAcufPW9ctrDcjA7yTS?=
 =?us-ascii?Q?2vF3LPTZdJOSNLyWTHbcsQtzyG42PjKZ1fDsrOBc+JoMM55x0Ca4H0Sv/Ja9?=
 =?us-ascii?Q?Ztwf6bg0lhvJADcojGAJ40Zeiytg2H2p1iL6TcHgY+iDc+TKPd8CXmA1iEjW?=
 =?us-ascii?Q?6JJrw4irDun7MaHECSytBfWqhQTAJysVGSDMEmH2i8dQ7F1m0r9yWkpsPCZS?=
 =?us-ascii?Q?lDuG2LqQyuiMBKKo+skLQPDTXw9Ml9whXpxc52ec4CQtyOPjzVhp5142yx5L?=
 =?us-ascii?Q?RdV0BXdPWCQ7QXw+HAoxFsd0MW3Lne1ArasDc24WdxD3xvP4zI6wVD2VhZjk?=
 =?us-ascii?Q?hP/p/QjVLY9GER5K1SudG0i4q8MuqXy2aDJKgpEmKBXEIedpKzwftUVran7Y?=
 =?us-ascii?Q?xFpzqig+JBQCWuFpAsVb/9UxKjg+PomxN3cl3f4Pm2KI0NftEGWL6Q5w9Agi?=
 =?us-ascii?Q?PU6xhvy3Wnd6ktGqfPvBp6CnGRDQN3U5jevzR716ZdWrgmLZOIZTVwKIKT1P?=
 =?us-ascii?Q?+QavHJgZ7aquE8TlvXAN3cpWYQauUCXdcNHhTNWYiatd7Msni8m93ilBC63s?=
 =?us-ascii?Q?vK4zkc3la/2YIA1uKTBZAYEookfgxJ0O0EIEE0mboOMjge1VpoBghimfxDax?=
 =?us-ascii?Q?AnyQc/ICznYEXJ2VfEvsUO3BeNn4sowl6V/Cp5/AnI6Vako7pCP5QrPR1Ldh?=
 =?us-ascii?Q?RnancqYcowsQ16QVLPR06ekNtWG0eo2PbhdhRRl4jMtInIxIlP0QreM/ZeYW?=
 =?us-ascii?Q?jN+pvzAIB9MsIP4I20PnfVeGtpLDK1iFrj3yD67uXyW8OkNtzmzf+PUPzRbm?=
 =?us-ascii?Q?p4tcnBN+Di/ymag8f0NoyfSWnFLqAq+wjU3/y4MmvapTzGu5lWFW+qX9IXbo?=
 =?us-ascii?Q?OXJgLnZpT8D48c9E2ZTmpyNfao6VBF0lirvvfwdm/Z1oqpPiJvka2diVTAGe?=
 =?us-ascii?Q?styNaF4UuAP22RHEdsDfpEWimAJpywUnl8bzIVFl3e01lEFJuaR/32Zy7z8W?=
 =?us-ascii?Q?f50cZ6xs/ECGkrMHt7VSX/hxvG9mKNQUTsHorGagnxoYtisctR+9CJUAPvDU?=
 =?us-ascii?Q?ePI/PuY1RVw/Gkm1noBXiDOVp44rrA/CNoyDkDWOuzaFUC7/nYmFb4tX3tk+?=
 =?us-ascii?Q?emZx6gzxwHgB2cpGQ56QeZz16JOoxlY/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QCShDrIfbEu1ceqjTfok+fLMfjrYH17deycsv5so/M6Su5K/RzSb42/lR2lr?=
 =?us-ascii?Q?XJU6DK5/wbCZ+iZiL32SES+LPvQz2Yz27CXRcQ5T2l4G1ysKBwVLn067Sq7V?=
 =?us-ascii?Q?06muWYLQ1aA8dHnkWAr4nE0p0hYEfamhfOHAP7raCrAyztWSU7ckOD2aT+WN?=
 =?us-ascii?Q?MUeicD2QmDXKJE2oI9xnCmi8S5uatMdetGRnPDVv+e5U58CX8gq56qe9J9vz?=
 =?us-ascii?Q?Yib+4qLrRBkce3TucRhknrshoUdFM46HK325CsTgtbjSgaz4AoR3DENctwzc?=
 =?us-ascii?Q?zmZfDVVGFa2IAMpzau1Avn/lJ5UCgMoKN0svyu9uujIxSCznUzBh0IHNteLX?=
 =?us-ascii?Q?F+eJZayjwdZ1iVHXi1W6sgN3SzjlUhP4CP+TGtZdoLAiruKNILWVR5q29n6U?=
 =?us-ascii?Q?pCji1DcyA+AyTjI8op0JzTFMBhsdg7AoFNWEp8+BNCoom8jTYezv6i6s64SG?=
 =?us-ascii?Q?grfIl/YtDIDxUr5DsgEi/Uu9qT5+CEhg1lTDHicsjFOCc/uCPHMdyeNuX2m6?=
 =?us-ascii?Q?+W/qHGJyQbPphvZewnnr1dq0ZC8mZwa4UVQDWEyAXCWQeY86wxLdZkgGYMHm?=
 =?us-ascii?Q?CU1AD0cf+nhrgqrRSsbvK9V1slRc/VsI3T3ZK8oycycQUGXM/2ONIG/ZEsWs?=
 =?us-ascii?Q?W2SStVC6vCC/sUw2h8jgPBV8xfNAhWm7LlA/O08vWe25Q2CdWMS01C2d4GbG?=
 =?us-ascii?Q?W8huetEImdAkfZyrldulotaluBO59pkke057b61NDymfwF5nPLaBegI+PNE2?=
 =?us-ascii?Q?NC0nRrMm99DeQebyrj86po4mWgrqT14yroVJ0pCWyQIa43RlsKyAEkHDRGkA?=
 =?us-ascii?Q?p11QVRMRWpEUWWHIouHs5aghebzolWZzeKuITzVrkXOgIpVK28pqPtDLYEpt?=
 =?us-ascii?Q?AALB8KLGLhl90jqgGLLJR7ZoeAZjOc2o+K5qhUm9suDPy/D8upsOpTo4HCB7?=
 =?us-ascii?Q?6uILrkRDzjJdWn6xSxuJU+rbmjkZh+8JsYzvQMsuzJHEahHFxr1neQbJxF/J?=
 =?us-ascii?Q?+ZcKDdBVCv508FyqSv5NYuT+BTXvdfRhowRsNBgFqBnwZytxQoOa8OOvmqZ/?=
 =?us-ascii?Q?hjRngX3+A7qJYHnoExdSXDEhb7OYuI14ksN8ckSJH1JsmBgQDY/zVI5gZlZ8?=
 =?us-ascii?Q?hNv1x3jSPLcD3P6ZuGVEZ55ES8RtO0A0zOKmDcL+5IshG21Qqe/nK3zebcD3?=
 =?us-ascii?Q?vnOx4YQQInHDrrvbMLdwghX6dDY0rhUT/aeJ7iORKFkyL6ACtjaTjpU0QaNq?=
 =?us-ascii?Q?ENEyvDaanBUM+5MeFdsFtUY0uWjhT1h6isoz4s20B5sJbIHXiMg+AsQwIPRG?=
 =?us-ascii?Q?0wMME7yZnUTi+d2qEG97gBHTcYDAjow4PXcnMylLB7E2qj7Dsf2aP3g0gbXi?=
 =?us-ascii?Q?UgR+0zvzbTUP4r3yx9VLyiFMYFw7wvprQsg+IMIjYe9TQWG+PxbBIQrKzqWa?=
 =?us-ascii?Q?G8gDTA77qDNkTeGsU6YrE1VlD11xgdIjhFhNhx4S8V+Ms2GCtBrSenMm7zHu?=
 =?us-ascii?Q?ZIjkaSFIVXoBERUdauaZSJf668NBRoSBg9TqM2VoG5YQt+QOWQHNvmC1narw?=
 =?us-ascii?Q?VhU18QlAIasuNRS5SHWYzZ6N6eKYAOsYNbBYP8Zq?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e487b0-0780-44d6-c641-08de32972ba6
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 18:09:58.8621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44D/hHN+THU97QmZ9oIyZrOt7R9ckj0z6XjNktazVL0irrdr8jW5oCVfqv+777hcpWvtkOX0YsO/0o+7LEbSOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB5979

On Tue, 02 Dec 2025 20:27:59 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> From: Gary Guo <gary@garyguo.net>
> 
> A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
> allow C helpers (which were created to allow Rust to call into
> inline/macro C functions without having to re-implement the logic in
> Rust) to be inlined into Rust crates without performing global LTO.
> 
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to an object file to be linked
>   into vmlinux, they're compiled to LLVM IR.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating an object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked with --internalize to combine the helper bitcode
>   with the crate bitcode. This step is similar to LTO, but this is much
>   faster since it only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into a final object file.
> 
> The --internalize flag tells llvm-link to treat all symbols in
> helpers.bc using `internal` linkage. This matches the behavior of
> `clang` on `static inline` functions, and avoids exporting the symbol
> from the object file.

Huge shout-out to Matthew for discovering this option, this makes thing
so much nicer and it feels way less hacky and more reliable now.

> 
> To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
> the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
> Disallow BTF generation with Rust + LTO") for details.

Again this is a much nicer way to workaround the issue than changing
the language name in the DWARF info using text replacement that I come
up with :)

> 
> We have an intended triple mismatch of `aarch64-unknown-none` vs
> `aarch64-unknown-linux-gnu`, so we suppress the warning.
> 
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile               |  4 +++-
>  lib/Kconfig.debug      | 15 +++++++++++++++
>  rust/Makefile          | 26 ++++++++++++++++++++++----
>  rust/exports.c         |  5 ++++-
>  scripts/Makefile.build |  5 ++++-
>  5 files changed, 48 insertions(+), 7 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)

I think this is no longer needed as we only use LLVM BC now without
having to round-trip between LLVM IR.

>  else
>  CC		= $(CROSS_COMPILE)gcc
>  LD		= $(CROSS_COMPILE)ld
> @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP := 1
>  export CLIPPY_CONF_DIR := $(srctree)
>  
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX

Best,
Gary

