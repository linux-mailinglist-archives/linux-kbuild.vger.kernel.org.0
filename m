Return-Path: <linux-kbuild+bounces-1953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C06048D3FA0
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 22:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78364289168
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 May 2024 20:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C605F1C9EAF;
	Wed, 29 May 2024 20:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="l8HVsaZC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11021010.outbound.protection.outlook.com [52.101.196.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519B1C8FD1;
	Wed, 29 May 2024 20:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717014570; cv=fail; b=ZZwK2470j4TufpBc/hg4w/NFelJ/Ux1j8s9oTynqMVPOlgL8b5IrPWtg+F3FSmYKa5HSVi4zNBEH8HF+HIDAdF8SSdKtA0g8cRHwa+NOlx4Ykzcxc0jiSZghfwgJeNXLc0Wu7A0w6aVX3UPGJhJBM4ZqEAA4wGTFbR0mU5/s5ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717014570; c=relaxed/simple;
	bh=FVuy+ESUY01vmjVZz33EE1eqVXbLoOH5qWYRowmN8qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cq4j67xjJ03Lk6cOVbe4oV9eJA84990dPtDjHQFU2/boCDIxA39ESkc/eQzVA4YtamjMo4JhMGU+qp3ai7iL9s0tK7JzRFw5oSzsnCMp3g18UxYGwUIbc9LyzmyJbJ+VDUN1RCgSrtmJTDDkHZW75FWZXumSwgB23VLI3nvxUdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=l8HVsaZC; arc=fail smtp.client-ip=52.101.196.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDq9ilc+qC86et5XhCYm7uH/vmebCZrEzscsHGZ8PdeWZJr6qJviHRFTcXIuNZT9G3DtiguSpgbYj6iKcDgjlF/hDmKFTRkUWiOd3C3ukgNkW+2/OBmwqc/ZbmQBModzBm3I3tOVnUPjOhsnSmPOrr7EDFy1OyIEH1j2NmdOTsbmD5YurZ9QovYA/2uAzSKAJQyhzKhXK9JYCq2EZwfE+GIbri6Ln6zyHtqWpjZm49KbTqAEbKjMROdKOiXvnymuCIpewHK4qyZIKjIy7zswoXO45dopeX+T9jhwxmRtz6JpNdP2pix16kJAUvzvIbz9j9ySuwMLSE1haV6EI7hVYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOhXJhKDH27lus00GBWWNRz1EWg+5TLWAsJkjCCEYPo=;
 b=MWsogD8fQoN38AFb+Xr24DceILHKlaXv4YBONGMTqYmA1tGmtK68NMm/Sj8x8xuFruyyp1PxxeKRah7suLDo4kkMJBlZ0UqguijHnxVLYfvfjiCnjPIIOsQQck4X93NT9PUWjVHIMqEVs+ScfMctw0OEPD+RrcXGqnWTpR/5rp7Q6DJSz65fDNHX0zioxFEvhQRzLswq/oH3o7Zan0sv1aXZHRE5fuj6LsRZjCXV5PI1U/pCsslIR14cIRTzBYzENfTyhOiBtiCWe0aZo3qfkhO2vKYjRyJgub/tKiHVWCkTRJPJ0/angQ49+InGNeCAmzDu2rpmuZZvtO8cO2vxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOhXJhKDH27lus00GBWWNRz1EWg+5TLWAsJkjCCEYPo=;
 b=l8HVsaZC24H9r+WrYu0/b3y3BPMel2+Xv4iyYfiIqrxX9CjyM8N2RFfPKb53k8PvnzRbzI1UOmdSGRSOsRVS3MLSicGkCYJG6WsFSIMgt/bQ2nFJrDXoYDTmyx3yIXfe2CucbO4NAwGIUvXv83cEnmI1J8tQiiHHpzHIM3MAHBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO9P265MB7874.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 29 May
 2024 20:29:26 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.7611.016; Wed, 29 May 2024
 20:29:26 +0000
From: Gary Guo <gary@garyguo.net>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [RFC PATCH 2/2] kbuild: rust: provide an option to inline C helpers into Rust
Date: Wed, 29 May 2024 21:28:15 +0100
Message-ID: <20240529202817.3641974-3-gary@garyguo.net>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240529202817.3641974-1-gary@garyguo.net>
References: <20240529202817.3641974-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0222.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::11) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO9P265MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: 32baca0a-ce57-4531-dffe-08dc801e08f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|7416005|921011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zxHuOoR5+prvxuFj0Y2+Vh+yUIEgTfAdojKHO/kvdRTWNd9dZypc0bZt6/RQ?=
 =?us-ascii?Q?ohTjBQ4Ii0iGqU5SWYX0fOqcBIWDPwW1yC1Pk2nSodWyHe757VrhWw8t3NZJ?=
 =?us-ascii?Q?G9JFBdI0qppobySODaYehq0I/Cp0YE4V98jf5ocNQU3LD2MWJ6q4Kd28HypE?=
 =?us-ascii?Q?9cJ/13KLAFdfoVzTTBhDnPdMIq193Wk2svdDFkbHPHCa80i4CvpetdryCsFm?=
 =?us-ascii?Q?XGS5qNTOmCV4nzKwdfGItrdAiT+lwuAOk23hz/c/K5uiqfsLc/ofBIY+O5z7?=
 =?us-ascii?Q?d2nuQ2DaNli9v59zXw9zlzLRcqlHT/MAbqZz8TfkdZP4gtldnIihFitDHtqC?=
 =?us-ascii?Q?Xfnbf7JTX9As9QDOYGfj4daQJadBt/5SOg4ztZpBkrMdSM3CSr0omgklMC7P?=
 =?us-ascii?Q?LrQZdDNv/0ZFKvKEc0/MvV4mKTFD/KieV7cTaaUce3/nLnTFrOX7zMUl8DHT?=
 =?us-ascii?Q?7XB3hSvP+yJSpSvNG9P0rihBB3e9+VD/OCGdE7KZYhXA+iSMqtq5QJ8Fu51N?=
 =?us-ascii?Q?NN6r645pbBpBUFE5T/2AXvBeq20uh5NgMPz5okDbNow1cTkuDfWc/7NWkSMD?=
 =?us-ascii?Q?/ilOUaNZkyWaeW5c6l+JyNgSvEGVqkFr2uKRGqOOcrLP5Ht3Ol2sPcbDzg2B?=
 =?us-ascii?Q?DI+RWf/KOvMCodSgmQQty3jRU6b9j0yaocBIkbOEq2soQjhtix13NpRA7ygo?=
 =?us-ascii?Q?4oHUxA2fwd3jfzImFmJ8kiLNGaVO4xbL3kUErzpYAK48H61N18gwWBWEQbYD?=
 =?us-ascii?Q?TIUlhbPKMMpvfjvOac2y47X4NJtdiPCZQMb0O2RO0Y8v5aJTBCt9V/SaELA5?=
 =?us-ascii?Q?kJ5H9ViEQQOUS1/vvQYs929XkqobAoOouMTRReWVuMCumGQTFZQVef+1rrTd?=
 =?us-ascii?Q?t9hhMZSdBds8IxbhnCu99+obVUhUtwqUAo5qWw5rnV8tZ09tWjni0g/It5tc?=
 =?us-ascii?Q?QG6POaEzfalrFctgKtavP8Vh7msGFzIst3GJ6z0Gu5S7QnjES9hI3Mm5pWZA?=
 =?us-ascii?Q?r5YAgDZwZwmmJpCTYInf3nJ9kYqg1WgXnPfAv8F1hAUg1ShNIO+8GrqiPEOV?=
 =?us-ascii?Q?o0FzcwbZts7w3aVL9clQUQ3Hn6g5ezHJ4tGtGf51689VjGU5EeGzovTj8Fan?=
 =?us-ascii?Q?sNgYmbsZuwCudGP9XWjSL4sWhksZa+YWdS+90JXYRXgVeJvpp/6PQd/9oUT7?=
 =?us-ascii?Q?kOJEhoOZHWDVmZ1hstXUavf+Rb0R13mchQrBMa2nMO6RFFUQi3YwSN+qeo0z?=
 =?us-ascii?Q?PMtvK6C32P78hsWoVKfu9+G0aT/bq49OCZ09hrpKU/the4bAQgvVIwU5U6wA?=
 =?us-ascii?Q?v08yZz68RFTqIoMts7eMkuv5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pLPHqq4rFV4EvBdU5I0d9HXQVaSk81sUAS1l04HJxYDPGwGM4Qbr5D4IEz7H?=
 =?us-ascii?Q?EBI+69NfkmiShcKQtBvUAN2mlpR4+GLEBxnrjqcDVyv0dleDm6mG1nuTfYrW?=
 =?us-ascii?Q?Ji4udp8BLKs3npfCZawZ0ZQj/5iFmkT7wRO4SiQgoFuw7P+SgON2RniVselH?=
 =?us-ascii?Q?KdhPFzc8M8ylf/CNQ2XbMmdvLO5N/kr3qgOze3aX+E/Fn6d0k3OT73alf2VT?=
 =?us-ascii?Q?93SwTkmxWyeOFsaAU/YOSig7YEPzaMnnN14HYJu9Lk0t6pAa2PsMfLpNNeYk?=
 =?us-ascii?Q?fPN6FmNw8mIXK1Smw1aadoTJsPdbXYbYNC9FmDQ0eSHNcOu9Ec1iQGUwf1eo?=
 =?us-ascii?Q?XmND6IFrTaQ2Ztl8KCQgHRCuJQrYZyMiM5qixvq30fA+QPVizD97rD8cmmUB?=
 =?us-ascii?Q?Z63C9pkfnf+vWTn8Qrar8jWg2nrultcDwpM9Ak+cMRwNjXLvTcK7uwXg8AYM?=
 =?us-ascii?Q?G58ejNnfhhew0gPgJfKPTBdleIKxcGxkhnFpL6gpLdiYrRT5eIXbXUalNdj8?=
 =?us-ascii?Q?lBbKnm48K5h093XC8N2Cvctn1xUjWU+qYnw7/BhkW7lJdLIj7Oo+ZlyVjHUm?=
 =?us-ascii?Q?S3sBUd4nbPD3l7Ta+J1y+CPBm44eRHifTmhbnHSKy4wqqsty0QkrUf16Ska6?=
 =?us-ascii?Q?IuaFrsibTNn/hHr40kbF0P0Yj2kae4wki3eknxxYFlFYXLm1CXLErm29Mh52?=
 =?us-ascii?Q?kj+zARu/Pg3KyRHqoY4UJUsE/PYCAvtf2XOG4IddCh6y5UQ3vaJzL1FCJevg?=
 =?us-ascii?Q?2ekkNaQdlkiNZjF9XY8rw8GVOJMHJHvh+me07hTyg/wJWCDb1akG37RG9B+9?=
 =?us-ascii?Q?S8VXf2UWTz5GPseWKbez97Fhelw6DjNfKCUkrO8agbS0Nz66Ic4xm1uy6jx/?=
 =?us-ascii?Q?mjPY/MlaAttYz3MsbVemYO3rXb9zaRLaZWd4KmmhZYzQTG9FF2edjmdJ5HcK?=
 =?us-ascii?Q?yAc+kPTi+ZnhkWCQKd5bPXPw65KVhmf9f5Ua/mxHl/K7GKfB1opPFiTJ3ESl?=
 =?us-ascii?Q?ayyJIztAnP0cGiy2srmlZu5bzrGaV726/nBllzu5INrPyx4B7/pU70nh4lZF?=
 =?us-ascii?Q?uRVZ9t5hp1ZYgn3Do8mmeBOhrLWFBk2JVNOqkH99HMNU4vw+ZKr0aOFCByBy?=
 =?us-ascii?Q?Mt1wYCXfUXMFhGZv3QRF82H9kjwQsuEoY6nRUszUDVab5ASmcw4zIPkI4nyT?=
 =?us-ascii?Q?Elwu2O88Y4cige2boLKoPBZW4917rGRAGSEeI4LPh5C2cwuDNZCQ5jRfKf7f?=
 =?us-ascii?Q?QU4RyBmvaTm36toMjMe9mqyzoZtR1p72WVgMs96AvjdZ9ork9BBWN+eyhqcK?=
 =?us-ascii?Q?RgwAwjC67DwvEs/BKw1yH0SG2pPbp/2t7pl9vk7TqssTNTCMnhTKafqWh15d?=
 =?us-ascii?Q?IcRYWBLVXXvWZM6ueyRMcfKScztnKiHQftVH8zxA0ZJPHeEB1l15rM7/NNZV?=
 =?us-ascii?Q?ltRBBaLGNeAGVI7U1qAu/8tcBhB66wELiAuCa78km4Py5hSGA6YUxz0EjbEK?=
 =?us-ascii?Q?50Is2yjiVEUwgUcnIH5/dbQK8ilg2c9a6xNk2b0Ra4MZaNkIs2mJJJ3to+Ex?=
 =?us-ascii?Q?vKsfvurDzUHlT2JfNt39CR/yT17FaQvacWupANiE6oatsbyZwH/ZYs6OVli2?=
 =?us-ascii?Q?+Ecgf20QQ0+90CfEEwWLl5AaOUW5l0gVujp5x41msQc0?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 32baca0a-ce57-4531-dffe-08dc801e08f8
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 20:29:26.8868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/yMn06/QNn4cm6FpgnHbatkiF9kL4BIQLz5P2opm0Kw95rak7D0svW8kZ1FtTrGyNSJCd5jTrkAKZjdvroNaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7874

A new Kconfig option, `RUST_LTO_HELPERS` is added to allow C helpers
(which was created to allow Rust to call into inline/macro C functions
without having to re-implement the logic in Rust) to be inlined into
Rust crates without performing a global LTO.

If the option is enabled, the following is performed:
* For helpers, instead of compiling them to object file to be linked
  into vmlinux, we compile them to LLVM IR.
* The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
  means that the function is inlineable (effect of `_odr`), and the
  symbols generated will have weak linkage if emitted into object file
  (important since as later described, we might have multiple copies of
  the same symbol) and it will may be discarded if it is not invoked or
  all invocations are inlined.
* The LLVM IR is compiled to bitcode (This is step is not necessary, but
  is a performance optimisation to prevent LLVM from always have to
  reparse the same IR).
* When a Rust crate is compiled, instead of generating object file, we
  ask LLVM bitcode to be generated.
* llvm-link is invoked to combine the helper bitcode with the crate
  bitcode. This step is similar to what's done in a full LTO, hence the
  option name, but this is much faster since it only needs to inline the
  helpers.
* clang is invoked to turn the combined bitcode into object file.

Some caveats with the option:
* clang and Rust doesn't have the exact target string. Manual inspection
  shows that they should be compatible, but since they are not exactly
  the same LLVM seems to prefer not inlining them. This is bypassed with
  `--ignore-tti-inline-compatible`.
* LLVM doesn't want to inline functions combined with
  `-fno-delete-null-pointer-checks` with code compiled without. So we
  remove this command when compiling helpers. I think this should be
  okay since this is one of the hardening features and we shouldn't have
  null pointer dereferences in these helpers.

The checks can also be bypassed with force inlining (`__always_inline`)
but the behaviour is the same with extra options.

This option requires clang to be used for CC and the LLVM version of
clang and rustc to be matching (at least to the same major version), and
therefore is gated as EXPERT option.

Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 Makefile               |  4 +++-
 lib/Kconfig.debug      | 10 ++++++++++
 rust/Makefile          | 34 ++++++++++++++++++++++++++++++----
 rust/exports.c         |  3 +++
 rust/helpers.c         | 41 +++++++++++++++++++++--------------------
 scripts/Makefile.build |  5 ++++-
 6 files changed, 71 insertions(+), 26 deletions(-)

diff --git a/Makefile b/Makefile
index f975b6396328..c6f12093fb1c 100644
--- a/Makefile
+++ b/Makefile
@@ -492,6 +492,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
+LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
+LLVM_AS	= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
@@ -601,7 +603,7 @@ endif
 export RUSTC_BOOTSTRAP := 1
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
-export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN CARGO
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN CARGO LLVM_LINK LLVM_AS
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 59b6765d86b8..8b9a1bd8ce71 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3049,6 +3049,16 @@ config RUST_KERNEL_DOCTESTS
 
 	  If unsure, say N.
 
+config RUST_LTO_HELPERS
+    bool "LTO C helpers with Rust crates"
+    depends on RUST && CC_IS_CLANG && EXPERT
+    help
+      Links C helpers together with Rust crates using LTO.
+
+      This is achieved by compiling both helpers and Rust crates into
+      LLVM bitcode and use llvm-link to combine them.
+
+      This requires a matching LLVM version for Clang and rustc.
+
+      If unsure, say N.
+
 endmenu # "Rust"
 
 endmenu # Kernel hacking
diff --git a/rust/Makefile b/rust/Makefile
index b4d63ea9209f..ad0797467102 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,9 +6,14 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
+ifdef CONFIG_RUST_LTO_HELPERS
+always-$(CONFIG_RUST) += helpers.bc
+else
+obj-$(CONFIG_RUST) += helpers.o
+always-$(CONFIG_RUST) += exports_helpers_generated.h
+endif
 # Missing prototypes are expected in the helpers since these are exported
 # for Rust only, thus there is no header nor prototypes.
-obj-$(CONFIG_RUST) += helpers.o
 CFLAGS_REMOVE_helpers.o = -Wmissing-prototypes -Wmissing-declarations
 
 always-$(CONFIG_RUST) += libmacros.so
@@ -17,7 +22,7 @@ no-clean-files += libmacros.so
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
 obj-$(CONFIG_RUST) += alloc.o bindings.o kernel.o
 always-$(CONFIG_RUST) += exports_alloc_generated.h exports_bindings_generated.h \
-    exports_kernel_generated.h exports_helpers_generated.h
+    exports_kernel_generated.h
 
 always-$(CONFIG_RUST) += uapi/uapi_generated.rs
 obj-$(CONFIG_RUST) += uapi.o
@@ -350,12 +355,24 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_flags = \
     --blocklist-type '.*' --allowlist-var '' \
     --allowlist-function 'rust_helper_.*'
 $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_cflags = \
-    -I$(objtree)/$(obj) -Wno-missing-prototypes -Wno-missing-declarations
+    -I$(objtree)/$(obj) $(CFLAGS_helpers.o) -Wno-missing-prototypes -Wno-missing-declarations
 $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ; \
     sed -Ei 's/pub fn rust_helper_([a-zA-Z0-9_]*)/#[link_name="rust_helper_\1"]\n    pub fn \1/g' $@
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+# When compiling helpers, filter `-fno-delete-null-pointer-checks` since LLVM
+# prevents inlining such functions to be inlined into functions compiled
+# without the option (e.g. Rust functions).
+quiet_cmd_rust_helper = HELPER  $@
+      cmd_rust_helper = \
+	$(CC) $(filter-out -fno-delete-null-pointer-checks $(CFLAGS_REMOVE_helpers.o), $(c_flags) $(CFLAGS_helpers.o)) -S $< -emit-llvm -o $(patsubst %.bc,%.ll,$@); \
+	sed -i 's/^define dso_local/define linkonce_odr dso_local/g' $(patsubst %.bc,%.ll,$@); \
+	$(LLVM_AS) $(patsubst %.bc,%.ll,$@) -o $@
+
+$(obj)/helpers.bc: $(obj)/helpers.c FORCE
+	+$(call if_changed_dep,rust_helper)
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
 	$(NM) -p --defined-only $< \
@@ -396,11 +413,13 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	OBJTREE=$(abspath $(objtree)) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
-		--emit=dep-info=$(depfile) --emit=obj=$@ \
+		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 		--sysroot=/dev/null \
+	$(if $(link_helper),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(obj)/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
 
 rust-analyzer:
@@ -463,4 +482,11 @@ $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.o \
     $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_dep,rustc_library)
 
+ifdef CONFIG_RUST_LTO_HELPERS
+
+$(obj)/kernel.o: private link_helper = 1
+$(obj)/kernel.o: $(obj)/helpers.bc
+
+endif
+
 endif # CONFIG_RUST
diff --git a/rust/exports.c b/rust/exports.c
index aa1218b325e5..212c1ec1d38b 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -19,7 +19,10 @@
 #include "exports_alloc_generated.h"
 #include "exports_bindings_generated.h"
 #include "exports_kernel_generated.h"
+
+#ifndef CONFIG_RUST_LTO_HELPERS
 #include "exports_helpers_generated.h"
+#endif
 
 // For modules using `rust/build_error.rs`.
 #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
diff --git a/rust/helpers.c b/rust/helpers.c
index 895f4b696962..3abf96f14148 100644
--- a/rust/helpers.c
+++ b/rust/helpers.c
@@ -32,18 +32,19 @@
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
+#include "helpers.h"
 
-__noreturn void rust_helper_BUG(void)
+__rust_helper __noreturn void rust_helper_BUG(void)
 {
 	BUG();
 }
 
-void rust_helper_mutex_lock(struct mutex *lock)
+__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
 {
 	mutex_lock(lock);
 }
 
-void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
+__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 				  struct lock_class_key *key)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
@@ -53,82 +54,82 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 #endif
 }
 
-void rust_helper_spin_lock(spinlock_t *lock)
+__rust_helper void rust_helper_spin_lock(spinlock_t *lock)
 {
 	spin_lock(lock);
 }
 
-void rust_helper_spin_unlock(spinlock_t *lock)
+__rust_helper void rust_helper_spin_unlock(spinlock_t *lock)
 {
 	spin_unlock(lock);
 }
 
-void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
+__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
 {
 	init_wait(wq_entry);
 }
 
-int rust_helper_signal_pending(struct task_struct *t)
+__rust_helper int rust_helper_signal_pending(struct task_struct *t)
 {
 	return signal_pending(t);
 }
 
-refcount_t rust_helper_REFCOUNT_INIT(int n)
+__rust_helper refcount_t rust_helper_REFCOUNT_INIT(int n)
 {
 	return (refcount_t)REFCOUNT_INIT(n);
 }
 
-void rust_helper_refcount_inc(refcount_t *r)
+__rust_helper void rust_helper_refcount_inc(refcount_t *r)
 {
 	refcount_inc(r);
 }
 
-bool rust_helper_refcount_dec_and_test(refcount_t *r)
+__rust_helper bool rust_helper_refcount_dec_and_test(refcount_t *r)
 {
 	return refcount_dec_and_test(r);
 }
 
-__force void *rust_helper_ERR_PTR(long err)
+__rust_helper __force void *rust_helper_ERR_PTR(long err)
 {
 	return ERR_PTR(err);
 }
 
-bool rust_helper_IS_ERR(__force const void *ptr)
+__rust_helper bool rust_helper_IS_ERR(__force const void *ptr)
 {
 	return IS_ERR(ptr);
 }
 
-long rust_helper_PTR_ERR(__force const void *ptr)
+__rust_helper long rust_helper_PTR_ERR(__force const void *ptr)
 {
 	return PTR_ERR(ptr);
 }
 
-const char *rust_helper_errname(int err)
+__rust_helper const char *rust_helper_errname(int err)
 {
 	return errname(err);
 }
 
-struct task_struct *rust_helper_get_current(void)
+__rust_helper struct task_struct *rust_helper_get_current(void)
 {
 	return current;
 }
 
-void rust_helper_get_task_struct(struct task_struct *t)
+__rust_helper void rust_helper_get_task_struct(struct task_struct *t)
 {
 	get_task_struct(t);
 }
 
-void rust_helper_put_task_struct(struct task_struct *t)
+__rust_helper void rust_helper_put_task_struct(struct task_struct *t)
 {
 	put_task_struct(t);
 }
 
-struct kunit *rust_helper_kunit_get_current_test(void)
+__rust_helper struct kunit *rust_helper_kunit_get_current_test(void)
 {
 	return kunit_get_current_test();
 }
 
-void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
+__rust_helper void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
 				    bool onstack, const char *name,
 				    struct lock_class_key *key)
 {
@@ -139,7 +140,7 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
 	work->func = func;
 }
 
-void * __must_check __realloc_size(2)
+__rust_helper void * __must_check __realloc_size(2)
 rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
 {
 	return krealloc(objp, new_size, flags);
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index efacca63c897..201e7dc5ae5d 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -288,7 +288,10 @@ rust_common_cmd = \
 # would not match each other.
 
 quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $<
+      cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_LTO_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
+	$(if $(CONFIG_RUST_LTO_HELPERS),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@)
+
 
 $(obj)/%.o: $(obj)/%.rs FORCE
 	+$(call if_changed_dep,rustc_o_rs)
-- 
2.42.0


