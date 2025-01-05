Return-Path: <linux-kbuild+bounces-5390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054FA01BB8
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 21:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D11D18841CE
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jan 2025 20:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52A11C5F11;
	Sun,  5 Jan 2025 20:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="fZyR++4T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022085.outbound.protection.outlook.com [52.101.96.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134053224;
	Sun,  5 Jan 2025 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736107412; cv=fail; b=tLijxLRUivfHgCZSU9ApUJPKG7OB0Wdigmo2yQmjcvsQ1IiJ6l1mtSQeK5N4eOYBjPE7ZmYFgvJJtweOHo6v2GtdwjisVQaBFfQBeO+JPVr+zDoTgTT5S0+P7MH3ttxTnYJwgM+MwAGQIZoiERcyFolzDh2SjJoQ9YnOo+8m9eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736107412; c=relaxed/simple;
	bh=S4OvdId2qFovSKYfvnSG5ySc/Y0sAczH68rv1SImg7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CPXPAwOnb+kwDhG+41US+slVeltTpljHkNoIfzTc8J+s5dSdvGx3Qkk3vrQinaPKV09LYSy9RSvjQbuSL1Rqo6s2NvPZvPhNJuhUql/L68R4bA/t1eA8Hgjkq3m9EISWcJWhhrER9BjhMcfoDaMKFO9nk0sKRTau0u6KbEwmaK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=fZyR++4T; arc=fail smtp.client-ip=52.101.96.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC+jcMLfyDD6pz2F3SEJY4yfLW9CGKDo3JjNHgSDk/F/IGhxkwX+ex0Db/z0szjFLJUdCk1+87bV/PLPUWNuxlaWWGmkLXzmyqjHS9Mw4HaFR66RPRGr9dWqhMiZiHzsXM52ogbdCxwzuR9xi3Rf5qELR8CjUsItdwySmLMXSWHr/pTXv15AQ1jMHXkcbTKDJiNFT1NXr4tTFfUfucL7oIjLC+XQQzusOZHtMYOH3i6rNAB8LEusPOz8fIBkpWdYBS9qtnCUt+3da2kYXjzdh1shJVayPFVJI5Jj3vlxd7aZDiSbPnUf4RaYOmj85L5yxYnWhLSFICc/so0tNhuvSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzlN3tZoO2o5WybtyY7a0mjrHrV6lyTO7QNbUaiS9/4=;
 b=Jn5NWzCLlxb6QvY0UvuqeEIY5Rv68iWBdTNzARl+oYNpSc4EXXnLTgaDdecDei9wcwFnq88Ph66NsZKSfr5+bZZtwG7we3QRgCskTELJH4px4Zd2GlRB2LTr512/puRS8Uz3B/eife84hnln79oyrF7dsZmUPAU3n73o2+yk0SxYwwhOHGFRHCGUhLAHyH0xHpK9jRtBIfiWDlMaK88d82bgsVSykEdxfX0p6AepyTI5KMIjkL+1HKBKTL/K461LfxmnjAtIVJj9CYvH3kaS1+uu6+2CnZeSc5wZOQjMSn1Hi1SzUgYpsWkgEy77frtFm0csV0DUbqUqwGe3Ljy4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzlN3tZoO2o5WybtyY7a0mjrHrV6lyTO7QNbUaiS9/4=;
 b=fZyR++4T3s6PDmlxLHaj0NVHAFAlzuUWTpwMpz7pz9TIEj4CGANtKt3lr1DldlysGr1EzS+4nQHXHA06y4JG+MGjMIU+GF9UhtvRQcGE2DBLU2mOLLjUhUue2x048Xfa59rgJAxJXYH9XcpB1X33/AGMGd7KL39oAC1maPVCezQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO8P265MB7704.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Sun, 5 Jan
 2025 20:03:26 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.8314.015; Sun, 5 Jan 2025
 20:03:26 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Eder Zulian <ezulian@redhat.com>,
	Filipe Xavier <felipe_life@live.com>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	Kees Cook <kees@kernel.org>,
	Daniel Xu <dxu@dxuuu.xyz>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] kbuild: rust: provide an option to inline C helpers into Rust
Date: Sun,  5 Jan 2025 19:40:05 +0000
Message-ID: <20250105194054.545201-3-gary@garyguo.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250105194054.545201-1-gary@garyguo.net>
References: <20250105194054.545201-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO8P265MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7b61ad-2093-4115-9d30-08dd2dc40443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x4ZoIXhhFfGC+zoZurygEJNuscUdDuOvVcqposWvh+4MXsSndEHzPLb2+v4T?=
 =?us-ascii?Q?T1JalfsApAeyhiE1IBxkNOzrYxUsKzmnsNjS20eFblsd0odFHKJAiWT9rg0B?=
 =?us-ascii?Q?i6V1Ty6KkmEacCiVDyAPFBaRXwQ3KoNIokThBcjdilLZfgekM4dscG9lboZC?=
 =?us-ascii?Q?9ekpVb21pmWr0Q/lgqH2J66mshaHTjxsGugTjb91V0P3G+Hohz0uWhGrCV1o?=
 =?us-ascii?Q?kBot9wSRTYaoqVcbi1OORXjuEx/2xtXa19qmdyC9lo2IKrjI5BCckLPkvxtJ?=
 =?us-ascii?Q?WgtvCGF/+zeX7L/OMgJpV5iA2dzFPqSf4EN2WbXdehb1rDJo9kRTGvrYajhq?=
 =?us-ascii?Q?0ReBYg8pVA1zj06lDo3d75gR4v5jC22IIuTw2ZwZ5cxJFM/BYxeV4Q3HP2q1?=
 =?us-ascii?Q?F+IdAK9pftc+mSlDzGiRsnfmvg0PcUzSs5OyaCIpyh0BUwvoGQDie+tKeQ9h?=
 =?us-ascii?Q?LKh4YW12ozjS19LJbSvodlamn+lRASpVzGe3/MtXWf5zKpUaab5qfx7n0OxM?=
 =?us-ascii?Q?zs+qoE75+p4UudZDZdOz3TFKiWjv81AdEFNogwk+wfGCLhc9k+5VZWVktQNO?=
 =?us-ascii?Q?nPgeQ8Glp0m3rFOs9jvsnGJiwFRn1PVN7MeLk9gL2n7Gjt/KlLRzXRoJWbZQ?=
 =?us-ascii?Q?iLJuEIu9v0srKnoKqJi30m+50dRCzPJleVWSYhnbtVEtLcwZFzvV5IKO1NVV?=
 =?us-ascii?Q?+/RxvAnABhDom8uU0xA7SuxxtvSa7GJ2BIXcfFQxJycVQgP4BYrBlcujFw1+?=
 =?us-ascii?Q?/OPlrRfGlKcCO3tvrzvcalLyXaF0B3stbIee60iQPhOpCjopoSSB9cN6DC8Q?=
 =?us-ascii?Q?pdTFB4vCquJ++MKvsNoLdtbstUrzmhspaTzbIuvRs7VDTXdA/syigFIdeyiF?=
 =?us-ascii?Q?q84hDCv47wptfkUgrTamlS3jo0MoiWX8k3blUN0UqJ5RQ+BNSwUuWjvkmhTp?=
 =?us-ascii?Q?0PssJ9PORd6IuEURBKWBALQDa4GjDWIJMXrsq5oPv1TGyFu05CvSvc4Oalwj?=
 =?us-ascii?Q?GfGzrLUTQkbH31ZobG6B8AzBlxAlNodKdUjEu/L4nNXoThlrH46CIfpW9a8D?=
 =?us-ascii?Q?SMkeuKFWhr3gNeE478tXnfnPHT0Q7pytmZkn1Xz5eUbyirVYf7Vav6C2hMxD?=
 =?us-ascii?Q?twSV3L5Y2qrLc8yHilwMDlYjb4YnuU7HE8xZX/YYH7xLVzOB4oYg/0FMtQHD?=
 =?us-ascii?Q?VRAc6pi+HMNd5SE8eu+fJ7D1Tn2BdLepFYM/NhdYAmaQrYYl0/T40azHX0LO?=
 =?us-ascii?Q?CgyaCHWRafpGiOc/4qSd/2p/qh65nR3Y3OK2crNpjDZbiC1Y9/2vfQvVSFHq?=
 =?us-ascii?Q?MDwvD+LFt71KeGH2e5H/HeHueRS3ZZvX+S4oCnoi5p9MJqjeOpHnY0uBQs8R?=
 =?us-ascii?Q?8BLoS3JfVJ906OGxNh8DCGmrZV4vlYWTBlO0Fn6Db8KW4QIbbeHeOfM6ZhX2?=
 =?us-ascii?Q?1FFTpPdRzU0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HQXD5ZYxi0SYJbzkwud4wunsxm3LZ3SZi8c6QAf+umLaIinFf6jmyyYx75UP?=
 =?us-ascii?Q?7581FSn5ggT3cQKC7C2lkke9E5SGOT8Nmsb2eXIjLr2DFYnFl6Mot3YBPMkg?=
 =?us-ascii?Q?Xy5KzLtiuD3mbw6NlAJVzqUS/wSgXHHJF+oIhSrMbkYsbDH581muhrQlpFRL?=
 =?us-ascii?Q?QA4angT5/ApaHFwo6yc0LYX1tjMUa2m8Gqzrxfs10aWWnBeFw1gJ71xPe6hf?=
 =?us-ascii?Q?euGI1adGVI/zGf36KzR4qpJAP/zi8HoY/EdDmkEzvAxpKKoGag2IXxV0IpiQ?=
 =?us-ascii?Q?Lg9y99j7xzkspME1ZZCeRBX4kX3E6RCrV/zTcIl/aap/pMg8ZRhDaEUTT5zl?=
 =?us-ascii?Q?s0oOUj/wjvBt1gr+vtEeSMQDB/vqKs47HpGoGraJSNiWTITiepfBFAS+/FHX?=
 =?us-ascii?Q?z7zrDn9YplYyMyZkvKfgHhEmt21PO37WKYKDqIZiXub79VMjYViOewHnLe4c?=
 =?us-ascii?Q?aYKYsbRyEY3/oKXAj1xdkceLYcP+lv9ayh2GqJX5b9NBOH8UG3UdSwOCRspg?=
 =?us-ascii?Q?Hy7RU0h8+TwY+Ah4GJSHT66JQ4OsHqP2KTItViEu4ft5+LgVAYnI7NgJsuZD?=
 =?us-ascii?Q?toWcE9B+hRebCrvaqCi4N5fUkWYWyFcqQx2yQ1D8I97GZpIvkMWZaehRrHgg?=
 =?us-ascii?Q?fedFp36W55/FqTtG8i0UbsNvqJfLXxpi08sTytNLZv3Xai6m2Kq/l9oRDpeN?=
 =?us-ascii?Q?UVRDLSia1U5U0WdrEClSo6uwKOmZwTdfA64QDWNEDm0JX+kRRXfiDoAfr9N1?=
 =?us-ascii?Q?WLhhCBAPza1zx0/O8Yj1CRtLX9+YnftCW9sjEYwF9p7HHra5axgOMmks0tg+?=
 =?us-ascii?Q?rtoWMZc6KiV+FNr97mblcRUgefhslobR663vaG4Wx6KmZgemuDZh0halMItb?=
 =?us-ascii?Q?Em7wjHZKuebtXDBiVlez43ejUz1yaS2mwSCZ3uCO88hCYZEGUZuSY74Vqoug?=
 =?us-ascii?Q?4BgeKjx04HR9yTKkjoQCYqVhTBBJyBv5gjCaNlduP/kdrd8o/F4aqhU9fEHF?=
 =?us-ascii?Q?EJZcXsIXM08mSs532dhMzzgKgy4i3NaszbTSzGOhKwCHYBXYH2fVrK/H8IIi?=
 =?us-ascii?Q?9ZdX6eaLHZFhqSr7QU3b6SlucRUaRK7jju9a0SQ//adhc/xNXl+H92d/jX6I?=
 =?us-ascii?Q?RxvXVlgF/+4demIRtjN996OGt0j3ZcosUBgCBzPVq11Ifl4BJFUEslwSAwi7?=
 =?us-ascii?Q?qyP7L2MSv7rppheNIa4E6KxApFjx29y5g4Q8YzSVjctlvC/Gk9giPUB+uuBn?=
 =?us-ascii?Q?O+aNbyEiHNc/H7WFvjyNG2cQROT2hm2pBehTu3VFcs9LxAlVk14YuC0/bpza?=
 =?us-ascii?Q?sh0zAGoZz4lUphPfQcRhOHsvDNpLaITs4Jh4TPrw1vISt2bNBWapDn7EeVaI?=
 =?us-ascii?Q?Ut2iI0Ex4c4Wi07pjyZd2YueXL9hkaJ6e7zuZyy8e3jbw9fgxrXN12bfOXFy?=
 =?us-ascii?Q?C9f2nc5uSX7CTJw1aSNA/VYDU9DHTuUADGBammNHx2cTNaVuVXr4d02aRNJX?=
 =?us-ascii?Q?lChywyRqPN9DTO9DywPnR90j6D9PyEv9JP0Mu7/9NM6lvqAOCrDEjjvw9zKy?=
 =?us-ascii?Q?d33ev59EeIIqQUOQJRXXrMxSooVgDpi2zwsKBm7tXjJmGLci660+y4W8BRR0?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7b61ad-2093-4115-9d30-08dd2dc40443
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2025 20:03:26.6892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o41UnjYG7eBZ0kK09Ek6GKYueCqe+wULIoDUsO+AKzE8nGE9czabsCUF+uplVdIzH5jw8OUeoRp9s8FUpEA//Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7704

A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
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
  bitcode. This step is similar to LTO, but this is much faster since it
  only needs to inline the helpers.
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

Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 Makefile                     |  4 +++-
 lib/Kconfig.debug            | 14 ++++++++++++++
 rust/Makefile                | 31 +++++++++++++++++++++++++++----
 rust/exports.c               |  5 ++++-
 rust/helpers/blk.c           |  5 +++--
 rust/helpers/bug.c           |  3 ++-
 rust/helpers/build_bug.c     |  3 ++-
 rust/helpers/cred.c          |  5 +++--
 rust/helpers/err.c           |  7 ++++---
 rust/helpers/fs.c            |  3 ++-
 rust/helpers/helpers.h       | 12 ++++++++++++
 rust/helpers/jump_label.c    |  3 ++-
 rust/helpers/kunit.c         |  3 ++-
 rust/helpers/mutex.c         |  7 ++++---
 rust/helpers/page.c          |  8 +++++---
 rust/helpers/pid_namespace.c |  7 ++++---
 rust/helpers/rbtree.c        |  6 ++++--
 rust/helpers/refcount.c      |  7 ++++---
 rust/helpers/security.c      |  7 ++++---
 rust/helpers/signal.c        |  3 ++-
 rust/helpers/slab.c          |  5 +++--
 rust/helpers/spinlock.c      | 11 ++++++-----
 rust/helpers/task.c          | 23 ++++++++++++-----------
 rust/helpers/uaccess.c       |  9 +++++----
 rust/helpers/vmalloc.c       |  3 ++-
 rust/helpers/wait.c          |  3 ++-
 rust/helpers/workqueue.c     |  9 ++++++---
 scripts/Makefile.build       |  5 ++++-
 28 files changed, 147 insertions(+), 64 deletions(-)
 create mode 100644 rust/helpers/helpers.h

diff --git a/Makefile b/Makefile
index e5b8a8832c0c..5fbb5e829f81 100644
--- a/Makefile
+++ b/Makefile
@@ -509,6 +509,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
+LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
+LLVM_AS	= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
@@ -616,7 +618,7 @@ export RUSTC_BOOTSTRAP := 1
 export CLIPPY_CONF_DIR := $(srctree)
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
-export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index f3d723705879..8a8834128f13 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3253,6 +3253,20 @@ config RUST_KERNEL_DOCTESTS
 
 	  If unsure, say N.
 
+config RUST_INLINE_HELPERS
+    bool "Inline C helpers into Rust crates"
+    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
+    help
+        Links C helpers into with Rust crates through LLVM IR.
+
+        If this option is enabled, instead of generating object files directly,
+        rustc is asked to produce LLVM IR, which is then linked together with
+        the LLVM IR of C helpers, before object file is generated.
+
+        This requires a matching LLVM version for Clang and rustc.
+
+        If unsure, say N.
+
 endmenu # "Rust"
 
 endmenu # Kernel hacking
diff --git a/rust/Makefile b/rust/Makefile
index a40a3936126d..8a3d61e5a799 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,9 +6,14 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
+ifdef CONFIG_RUST_INLINE_HELPERS
+always-$(CONFIG_RUST) += helpers/helpers.bc
+else
+obj-$(CONFIG_RUST) += helpers/helpers.o
+always-$(CONFIG_RUST) += exports_helpers_generated.h
+endif
 # Missing prototypes are expected in the helpers since these are exported
 # for Rust only, thus there is no header nor prototypes.
-obj-$(CONFIG_RUST) += helpers/helpers.o
 CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations
 
 always-$(CONFIG_RUST) += libmacros.so
@@ -16,8 +21,7 @@ no-clean-files += libmacros.so
 
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
 obj-$(CONFIG_RUST) += bindings.o kernel.o
-always-$(CONFIG_RUST) += exports_helpers_generated.h \
-    exports_bindings_generated.h exports_kernel_generated.h
+always-$(CONFIG_RUST) += exports_bindings_generated.h exports_kernel_generated.h
 
 always-$(CONFIG_RUST) += uapi/uapi_generated.rs
 obj-$(CONFIG_RUST) += uapi.o
@@ -329,6 +333,18 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+# When compiling helpers, filter `-fno-delete-null-pointer-checks` since LLVM
+# prevents inlining such functions to be inlined into functions compiled
+# without the option (e.g. Rust functions).
+quiet_cmd_rust_helper = HELPER  $@
+      cmd_rust_helper = \
+	$(CC) $(filter-out -fno-delete-null-pointer-checks $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) -S $< -emit-llvm -o $(patsubst %.bc,%.ll,$@); \
+	sed -i 's/^define dso_local/define linkonce_odr dso_local/g' $(patsubst %.bc,%.ll,$@); \
+	$(LLVM_AS) $(patsubst %.bc,%.ll,$@) -o $@
+
+$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
+	+$(call if_changed_dep,rust_helper)
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
 	$(NM) -p --defined-only $< \
@@ -373,11 +389,13 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	OBJTREE=$(abspath $(objtree)) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
-		--emit=dep-info=$(depfile) --emit=obj=$@ \
+		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 		--sysroot=/dev/null \
+	$(if $(link_helper),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(obj)/helpers/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
 	$(cmd_objtool)
 
@@ -450,4 +468,9 @@ ifdef CONFIG_JUMP_LABEL
 $(obj)/kernel.o: $(obj)/kernel/generated_arch_static_branch_asm.rs
 endif
 
+ifdef CONFIG_RUST_INLINE_HELPERS
+$(obj)/kernel.o: private link_helper = 1
+$(obj)/kernel.o: $(obj)/helpers/helpers.bc
+endif
+
 endif # CONFIG_RUST
diff --git a/rust/exports.c b/rust/exports.c
index 587f0e776aba..1b52460b0f4e 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -16,10 +16,13 @@
 #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
 
 #include "exports_core_generated.h"
-#include "exports_helpers_generated.h"
 #include "exports_bindings_generated.h"
 #include "exports_kernel_generated.h"
 
+#ifndef CONFIG_RUST_INLINE_HELPERS
+#include "exports_helpers_generated.h"
+#endif
+
 // For modules using `rust/build_error.rs`.
 #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
 EXPORT_SYMBOL_RUST_GPL(rust_build_error);
diff --git a/rust/helpers/blk.c b/rust/helpers/blk.c
index cc9f4e6a2d23..a96e5ddf384d 100644
--- a/rust/helpers/blk.c
+++ b/rust/helpers/blk.c
@@ -2,13 +2,14 @@
 
 #include <linux/blk-mq.h>
 #include <linux/blkdev.h>
+#include "helpers.h"
 
-void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
+__rust_helper void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
 {
 	return blk_mq_rq_to_pdu(rq);
 }
 
-struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
+__rust_helper struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
 {
 	return blk_mq_rq_from_pdu(pdu);
 }
diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
index e2d13babc737..3bff5b730ca8 100644
--- a/rust/helpers/bug.c
+++ b/rust/helpers/bug.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/bug.h>
+#include "helpers.h"
 
-__noreturn void rust_helper_BUG(void)
+__rust_helper __noreturn void rust_helper_BUG(void)
 {
 	BUG();
 }
diff --git a/rust/helpers/build_bug.c b/rust/helpers/build_bug.c
index 44e579488037..9dc273fd8db1 100644
--- a/rust/helpers/build_bug.c
+++ b/rust/helpers/build_bug.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/errname.h>
+#include "helpers.h"
 
-const char *rust_helper_errname(int err)
+__rust_helper const char *rust_helper_errname(int err)
 {
 	return errname(err);
 }
diff --git a/rust/helpers/cred.c b/rust/helpers/cred.c
index fde7ae20cdd1..9dceeb7f8c87 100644
--- a/rust/helpers/cred.c
+++ b/rust/helpers/cred.c
@@ -1,13 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/cred.h>
+#include "helpers.h"
 
-const struct cred *rust_helper_get_cred(const struct cred *cred)
+__rust_helper const struct cred *rust_helper_get_cred(const struct cred *cred)
 {
 	return get_cred(cred);
 }
 
-void rust_helper_put_cred(const struct cred *cred)
+__rust_helper void rust_helper_put_cred(const struct cred *cred)
 {
 	put_cred(cred);
 }
diff --git a/rust/helpers/err.c b/rust/helpers/err.c
index 544c7cb86632..b05516fce504 100644
--- a/rust/helpers/err.c
+++ b/rust/helpers/err.c
@@ -1,18 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/err.h>
+#include "helpers.h"
 
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
diff --git a/rust/helpers/fs.c b/rust/helpers/fs.c
index a75c96763372..7d44bda94203 100644
--- a/rust/helpers/fs.c
+++ b/rust/helpers/fs.c
@@ -5,8 +5,9 @@
  */
 
 #include <linux/fs.h>
+#include "helpers.h"
 
-struct file *rust_helper_get_file(struct file *f)
+__rust_helper struct file *rust_helper_get_file(struct file *f)
 {
 	return get_file(f);
 }
diff --git a/rust/helpers/helpers.h b/rust/helpers/helpers.h
new file mode 100644
index 000000000000..9248692146f3
--- /dev/null
+++ b/rust/helpers/helpers.h
@@ -0,0 +1,12 @@
+#ifndef RUST_HELPERS_H
+#define RUST_HELPERS_H
+
+#include <linux/compiler_types.h>
+
+#ifdef __BINDGEN__
+#define __rust_helper
+#else
+#define __rust_helper inline
+#endif
+
+#endif
diff --git a/rust/helpers/jump_label.c b/rust/helpers/jump_label.c
index fc1f1e0df08e..c97a66c51cce 100644
--- a/rust/helpers/jump_label.c
+++ b/rust/helpers/jump_label.c
@@ -5,9 +5,10 @@
  */
 
 #include <linux/jump_label.h>
+#include "helpers.h"
 
 #ifndef CONFIG_JUMP_LABEL
-int rust_helper_static_key_count(struct static_key *key)
+__rust_helper int rust_helper_static_key_count(struct static_key *key)
 {
 	return static_key_count(key);
 }
diff --git a/rust/helpers/kunit.c b/rust/helpers/kunit.c
index b85a4d394c11..f3621a564626 100644
--- a/rust/helpers/kunit.c
+++ b/rust/helpers/kunit.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <kunit/test-bug.h>
+#include "helpers.h"
 
-struct kunit *rust_helper_kunit_get_current_test(void)
+__rust_helper struct kunit *rust_helper_kunit_get_current_test(void)
 {
 	return kunit_get_current_test();
 }
diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
index 7e00680958ef..6259b5c959f6 100644
--- a/rust/helpers/mutex.c
+++ b/rust/helpers/mutex.c
@@ -1,14 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/mutex.h>
+#include "helpers.h"
 
-void rust_helper_mutex_lock(struct mutex *lock)
+__rust_helper void rust_helper_mutex_lock(struct mutex *lock)
 {
 	mutex_lock(lock);
 }
 
-void rust_helper___mutex_init(struct mutex *mutex, const char *name,
-			      struct lock_class_key *key)
+__rust_helper void rust_helper___mutex_init(struct mutex *mutex, const char *name,
+					    struct lock_class_key *key)
 {
 	__mutex_init(mutex, name, key);
 }
diff --git a/rust/helpers/page.c b/rust/helpers/page.c
index b3f2b8fbf87f..cf7deea25cfa 100644
--- a/rust/helpers/page.c
+++ b/rust/helpers/page.c
@@ -2,18 +2,20 @@
 
 #include <linux/gfp.h>
 #include <linux/highmem.h>
+#include "helpers.h"
 
-struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
+__rust_helper struct page *rust_helper_alloc_pages(gfp_t gfp_mask,
+						   unsigned int order)
 {
 	return alloc_pages(gfp_mask, order);
 }
 
-void *rust_helper_kmap_local_page(struct page *page)
+__rust_helper void *rust_helper_kmap_local_page(struct page *page)
 {
 	return kmap_local_page(page);
 }
 
-void rust_helper_kunmap_local(const void *addr)
+__rust_helper void rust_helper_kunmap_local(const void *addr)
 {
 	kunmap_local(addr);
 }
diff --git a/rust/helpers/pid_namespace.c b/rust/helpers/pid_namespace.c
index f41482bdec9a..f066fa4e7872 100644
--- a/rust/helpers/pid_namespace.c
+++ b/rust/helpers/pid_namespace.c
@@ -2,19 +2,20 @@
 
 #include <linux/pid_namespace.h>
 #include <linux/cleanup.h>
+#include "helpers.h"
 
-struct pid_namespace *rust_helper_get_pid_ns(struct pid_namespace *ns)
+__rust_helper struct pid_namespace *rust_helper_get_pid_ns(struct pid_namespace *ns)
 {
 	return get_pid_ns(ns);
 }
 
-void rust_helper_put_pid_ns(struct pid_namespace *ns)
+__rust_helper void rust_helper_put_pid_ns(struct pid_namespace *ns)
 {
 	put_pid_ns(ns);
 }
 
 /* Get a reference on a task's pid namespace. */
-struct pid_namespace *rust_helper_task_get_pid_ns(struct task_struct *task)
+__rust_helper struct pid_namespace *rust_helper_task_get_pid_ns(struct task_struct *task)
 {
 	struct pid_namespace *pid_ns;
 
diff --git a/rust/helpers/rbtree.c b/rust/helpers/rbtree.c
index 6d404b84a9b5..784d8796aa1c 100644
--- a/rust/helpers/rbtree.c
+++ b/rust/helpers/rbtree.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/rbtree.h>
+#include "helpers.h"
 
-void rust_helper_rb_link_node(struct rb_node *node, struct rb_node *parent,
-			      struct rb_node **rb_link)
+__rust_helper void rust_helper_rb_link_node(struct rb_node *node,
+					    struct rb_node *parent,
+					    struct rb_node **rb_link)
 {
 	rb_link_node(node, parent, rb_link);
 }
diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
index d6adbd2e45a1..ad80e153bf37 100644
--- a/rust/helpers/refcount.c
+++ b/rust/helpers/refcount.c
@@ -1,18 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/refcount.h>
+#include "helpers.h"
 
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
diff --git a/rust/helpers/security.c b/rust/helpers/security.c
index 239e5b4745fe..b0c14e1b3aff 100644
--- a/rust/helpers/security.c
+++ b/rust/helpers/security.c
@@ -1,19 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/security.h>
+#include "helpers.h"
 
 #ifndef CONFIG_SECURITY
-void rust_helper_security_cred_getsecid(const struct cred *c, u32 *secid)
+__rust_helper void rust_helper_security_cred_getsecid(const struct cred *c, u32 *secid)
 {
 	security_cred_getsecid(c, secid);
 }
 
-int rust_helper_security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
+__rust_helper int rust_helper_security_secid_to_secctx(u32 secid, char **secdata, u32 *seclen)
 {
 	return security_secid_to_secctx(secid, secdata, seclen);
 }
 
-void rust_helper_security_release_secctx(char *secdata, u32 seclen)
+__rust_helper void rust_helper_security_release_secctx(char *secdata, u32 seclen)
 {
 	security_release_secctx(secdata, seclen);
 }
diff --git a/rust/helpers/signal.c b/rust/helpers/signal.c
index 1a6bbe9438e2..67d3fe8d5132 100644
--- a/rust/helpers/signal.c
+++ b/rust/helpers/signal.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/sched/signal.h>
+#include "helpers.h"
 
-int rust_helper_signal_pending(struct task_struct *t)
+__rust_helper int rust_helper_signal_pending(struct task_struct *t)
 {
 	return signal_pending(t);
 }
diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
index a842bfbddcba..f8776884b729 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -1,14 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/slab.h>
+#include "helpers.h"
 
-void * __must_check __realloc_size(2)
+__rust_helper void *__must_check __realloc_size(2)
 rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
 {
 	return krealloc(objp, new_size, flags);
 }
 
-void * __must_check __realloc_size(2)
+__rust_helper void * __must_check __realloc_size(2)
 rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
 {
 	return kvrealloc(p, size, flags);
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 5971fdf6f755..567161c19a16 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/spinlock.h>
+#include "helpers.h"
 
-void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
-				  struct lock_class_key *key)
+__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
+						struct lock_class_key *key)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 # if defined(CONFIG_PREEMPT_RT)
@@ -16,17 +17,17 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 #endif /* CONFIG_DEBUG_SPINLOCK */
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
 
-int rust_helper_spin_trylock(spinlock_t *lock)
+__rust_helper int rust_helper_spin_trylock(spinlock_t *lock)
 {
 	return spin_trylock(lock);
 }
diff --git a/rust/helpers/task.c b/rust/helpers/task.c
index 31c33ea2dce6..741e1a4b15ee 100644
--- a/rust/helpers/task.c
+++ b/rust/helpers/task.c
@@ -1,56 +1,57 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/sched/task.h>
+#include "helpers.h"
 
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
 
-kuid_t rust_helper_task_uid(struct task_struct *task)
+__rust_helper kuid_t rust_helper_task_uid(struct task_struct *task)
 {
 	return task_uid(task);
 }
 
-kuid_t rust_helper_task_euid(struct task_struct *task)
+__rust_helper kuid_t rust_helper_task_euid(struct task_struct *task)
 {
 	return task_euid(task);
 }
 
 #ifndef CONFIG_USER_NS
-uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
+__rust_helper uid_t rust_helper_from_kuid(struct user_namespace *to, kuid_t uid)
 {
 	return from_kuid(to, uid);
 }
 #endif /* CONFIG_USER_NS */
 
-bool rust_helper_uid_eq(kuid_t left, kuid_t right)
+__rust_helper bool rust_helper_uid_eq(kuid_t left, kuid_t right)
 {
 	return uid_eq(left, right);
 }
 
-kuid_t rust_helper_current_euid(void)
+__rust_helper kuid_t rust_helper_current_euid(void)
 {
 	return current_euid();
 }
 
-struct user_namespace *rust_helper_current_user_ns(void)
+__rust_helper struct user_namespace *rust_helper_current_user_ns(void)
 {
 	return current_user_ns();
 }
 
-pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
-				  struct pid_namespace *ns)
+__rust_helper pid_t rust_helper_task_tgid_nr_ns(struct task_struct *tsk,
+						struct pid_namespace *ns)
 {
 	return task_tgid_nr_ns(tsk, ns);
 }
diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
index f49076f813cd..08bf1851c06a 100644
--- a/rust/helpers/uaccess.c
+++ b/rust/helpers/uaccess.c
@@ -1,15 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/uaccess.h>
+#include "helpers.h"
 
-unsigned long rust_helper_copy_from_user(void *to, const void __user *from,
-					 unsigned long n)
+__rust_helper unsigned long
+rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
 {
 	return copy_from_user(to, from, n);
 }
 
-unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
-				       unsigned long n)
+__rust_helper unsigned long
+rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
 {
 	return copy_to_user(to, from, n);
 }
diff --git a/rust/helpers/vmalloc.c b/rust/helpers/vmalloc.c
index 80d34501bbc0..6d258baa4c9a 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/vmalloc.h>
+#include "helpers.h"
 
-void * __must_check __realloc_size(2)
+__rust_helper void * __must_check __realloc_size(2)
 rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
 {
 	return vrealloc(p, size, flags);
diff --git a/rust/helpers/wait.c b/rust/helpers/wait.c
index ae48e33d9da3..7beaa85494bc 100644
--- a/rust/helpers/wait.c
+++ b/rust/helpers/wait.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/wait.h>
+#include "helpers.h"
 
-void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
+__rust_helper void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
 {
 	init_wait(wq_entry);
 }
diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index b2b82753509b..4256f8c91ce6 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/workqueue.h>
+#include "helpers.h"
 
-void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
-				    bool onstack, const char *name,
-				    struct lock_class_key *key)
+__rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
+						  work_func_t func,
+						  bool onstack,
+						  const char *name,
+						  struct lock_class_key *key)
 {
 	__init_work(work, onstack);
 	work->data = (atomic_long_t)WORK_DATA_INIT();
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index c16e4cf54d77..77c204449d1b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -239,7 +239,10 @@ rust_common_cmd = \
 # would not match each other.
 
 quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $< $(cmd_objtool)
+      cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_INLINE_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
+	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) $(patsubst %.o,%.bc,$@) $(objtree)/rust/helpers/helpers.bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -mllvm=--ignore-tti-inline-compatible -c $(patsubst %.o,%.m.bc,$@) -o $@) \
+	$(cmd_objtool)
 
 define rule_rustc_o_rs
 	$(call cmd_and_fixdep,rustc_o_rs)
-- 
2.47.0


