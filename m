Return-Path: <linux-kbuild+bounces-6250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D36A69A59
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 21:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3123E189615B
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Mar 2025 20:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98C42135DE;
	Wed, 19 Mar 2025 20:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zo8xs2+s"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021130.outbound.protection.outlook.com [52.101.95.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6A616F858;
	Wed, 19 Mar 2025 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742417595; cv=fail; b=TeIkiybgXZWheYZbr6SI+/K/H0FI81LL27OnMHCwfKg2sHSlAdENXPiip+gVHmriXsjC1iATAyZVbfxS1xB/iOAF6KvFxJZ7ewGGSEqFW26lgmKLkF+D80EvoI6+u6KsI6dMxF9oF7Nb3tkRSF8eFoyPW3Co9nJyKsq24m/JuFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742417595; c=relaxed/simple;
	bh=V1Ahyt8kq3lFGjBoYWOMCR28//qsYnkylfxpn0MnrEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tnTel1if8kRWAOJAGFo3XyGAA1w6iwtL6EcX4pnZcMQH7eU2Hvfu+M3MMr57aLgPW07wjArC74PwvVm73MOcz0ILLQT6Xhf5cxQ9prs+L+9P/tmW/VeKwd//b35azVCYh9TCRmZm6HYRRU83N3jXLFop7OxW4hIeqJqtAv9VJ9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zo8xs2+s; arc=fail smtp.client-ip=52.101.95.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEpB8d9yvd7d1D5/urnhRZkStDEEhjYW1gWomtnlbTGGAEK2SBjUxp7G0PAAr1GRZhxhE1sZN7V6CYjvyfmh3lK95kBP8ByzTpxzdqkupbCLhxQap87vUcaqmokwrTb6vgK8xdJoVG0RorSTMMTiE7LPoICNSZNMM8hla/2xwDoLBlzOnJCugiMaDJpQ13ZLDfej8eid5Y7tC5/LYwZN13F5XpGcPAzlmxm2BXbP+1eUXJ47AZTYeZITmdLdMgqfEuth71fFeU89AYAKDQHnrTKrU6Fw4lMfgMYImZ9TsYE8t2fLKp1CRI8bxegd1dtRALU6Ss7G1AeRi/K0fBBPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8GPQeHac/haI43x28eaM1opeiQdzGNw9lA47c6GDVQ=;
 b=fJ+pQYPxYqHPgRHp7PXlD5oFfHeZuWZDlCL90oq/mVM6bAK0KKlLabKj338yl1gXj1+W0i1XZ6xbxXp0CFpDAoMO/t8RPeLFaqOEa4cbtF9zltInUBMONTd/3IJVWyrWVdkazA8r7SjU/1GsvAdXMLNIZ/PKKpz1HUZXBjRqCBZK5tn4OIif8l2aoTHUWXxG7/eKfwP2ExTAGe/KaIhN1pFIaKqwFQrdZ8SKmNb+RbZmHApea+aE4hjKX/JKqKLxas10vm9qvrwURVaO3bXjb4mMt9xTWzsrTRNsHSC7jLOQ5Ag3McDPotWxh+NLzvC+xEJj7+Ihq+tp00FE0JFrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8GPQeHac/haI43x28eaM1opeiQdzGNw9lA47c6GDVQ=;
 b=zo8xs2+sihO9NWI7oVcO0JH2um98pbVmqTlO+drg++D4fKfL/ovDWRBAim8Oxbxc0B1Me8SY52EZJRkX5DicSFRsMFmWLopbPcu5+vmJWJDHUBycR5WgDSf23CJAsOW2NPmPUG3D9Gk7o2ZKpKBFF6H4mJoMJrJdEx7y8g3DQ4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO6P265MB6735.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:307::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 20:53:09 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 20:53:09 +0000
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
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Paul Moore <paul@paul-moore.com>,
	Kees Cook <kees@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] kbuild: rust: provide an option to inline C helpers into Rust
Date: Wed, 19 Mar 2025 20:50:39 +0000
Message-ID: <20250319205141.3528424-3-gary@garyguo.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250319205141.3528424-1-gary@garyguo.net>
References: <20250319205141.3528424-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::27) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO6P265MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: ad60f13a-dfdb-41fa-8638-08dd67280e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mjEzjAVdyCaAU1Pv31XSlc8YZcgziElBWC6is2DRHXv3D84Lng9lG1afGcWr?=
 =?us-ascii?Q?DNltEZPtv94ThQMZxkx5OXa50puQ17DDXRT5YB+Ughuy1Vr2o2rE8QNl6qxq?=
 =?us-ascii?Q?sQJ41lWAgDISASXXuRzrHRapauF1Top6bpmTlaZ4sW2iSS0Ht7m4KbBB/Sfa?=
 =?us-ascii?Q?A0OKHleRFmMhfQJmhjQR4xjeybqN3KgQgpyQqqU3aE9NbfZ0PEuoy2VlSEwg?=
 =?us-ascii?Q?PCS5jb/c7JrqwpkID0+NNEFGjLUF6V3lpwf59V4O5FQEKYlx/sjXxUl08g3y?=
 =?us-ascii?Q?WmL78MwT1BLNZnoyc3Jsh46yDmv2dOYXpGYGWEWDrhSSjxPX7vQKyuMJdWOR?=
 =?us-ascii?Q?3EnHaqJHgdXuZ2e3GmSDNofHDaWk6voJLEnu+OPaXz8oUBzgk7nScyqkEg9t?=
 =?us-ascii?Q?zhg4XJhb+hfa6qS+SDeGMWkGHMhqv1kP5YH6GZmHkzwpz+v/Lb58qp/Ikuj8?=
 =?us-ascii?Q?hThjKFeE0DqG0yGNnkHvbQK7JvcQw05QA/6RFXpuWP4lrdfy1DueLXO6CCPI?=
 =?us-ascii?Q?/7013gpvVu5c4nyvBYAefHJBBVW25/VBpAYraWv4tWNsKvadwIrbWvSFo6cp?=
 =?us-ascii?Q?yi+2TWL/BcpocY+dpUegW1IQ8JvPvzj2mur/g3NKXgDBzPwx6o+B91kCYDxe?=
 =?us-ascii?Q?80TXU+TD3F6Mo6ArHNOMSHDKz73x2lpiQE0OcD74Y8xvTCOfn2Hy3t7IMxDl?=
 =?us-ascii?Q?2VWIiogNUWtJPHq+ZDwQ7a5Epazc7OyHCR5jIOKZYnPuxrhb8Qi6lXSmx6Us?=
 =?us-ascii?Q?GZhOFeFkXmh47So8cvDqf2d662mtvDQrOik2u3/c/0OQSASxZulYwYtIjAJ5?=
 =?us-ascii?Q?psirGB3EHPmfBKGFIv9Bhz0HHrU4S4OLpjFvDoRl8WwCt+qGlmQMJXH5mL1/?=
 =?us-ascii?Q?GM8Q2vn3JG7V9M0ZYHuxuJ33Gx4dJev4MN+t1WCJR7MIFD0ChdhzVf4+ulDC?=
 =?us-ascii?Q?NmAQKt67LMbQb7ZDQESgmSF0lyE9Ire5Fczxge5WoBCausgEADvsCZ0/XdZG?=
 =?us-ascii?Q?4xFHNenRtBh96KKlp85nMs/jTJ2j7URBpO8mpL6gOvRsUIui4SJ2+dZ0j6xy?=
 =?us-ascii?Q?vvZZZEOKE8byEcXfgmPiXBMmBx1RpAnxFRSEj+LJmi7BSqTj5hGpbCV/D25Y?=
 =?us-ascii?Q?ecn5ofuWn+yavR+4SIik/eeXH1/6WYaNy8bQKqJLF9ndCezqCa1GBU2F46W0?=
 =?us-ascii?Q?D46lqcnRbD9Bb/3I9J8fDPCr22TP0NjXNdM+XOzBG+yKiTRBIn72HXQzurUM?=
 =?us-ascii?Q?oFu1C+uN8UhKmzvGUMZnjbw2xBvt3sN0ToCrDvfYIXzlMwF1KUztNwC30Bvl?=
 =?us-ascii?Q?u16QXwGc9+VK/g/TKWRGKkQ78t59c7/EGLFMVaZVEyjaCGk5JLz0CnJINpff?=
 =?us-ascii?Q?GokPPkHvEwZArRvXMTJtFVuLfvpCqAp3Udu1Yg0O28NRXE0Pa2BSXNXFvEAv?=
 =?us-ascii?Q?IkG94LfplUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4HtymUE/vBfTs03ajHBZAjh+flaD1N8lgs7Dd1WIoufCaOWyKmASz67DF97m?=
 =?us-ascii?Q?13eMuRdNCDdveZukpcx78AM5+yrwHpIAhg3hnzzHp2sK0ydrJvqG43OXRf2V?=
 =?us-ascii?Q?+659Nl1bDJVcequDNmjSV9yguXOanhQ+zw0pCpR8IxpHJWOifWmeIWCvLEIn?=
 =?us-ascii?Q?HlvM3gBb6TZjfceLkoC9b2V6hTQpPnyjknQtmQCzFxqMRHdtjpARsQegBGlk?=
 =?us-ascii?Q?jod8b5OZhZ8kDs0ofNE4rOwgWreah12irKt7muyC2ymQ3is96kWLuILKAuB/?=
 =?us-ascii?Q?GeIM4ecEIcqOnFFCKz7Z9JQHhmAf8Ktth9/olEVhFBdRRY0UneoIdst8Q0jp?=
 =?us-ascii?Q?oah/dC93PhgAE+1PqYfjoPM8/DEFhu6dCvEoz5Bq4iBaH5Se2SiHp7dJxbmf?=
 =?us-ascii?Q?UcJDNsz6vj910Nxx/8JtI+UqUF2xV7F4oisYbuzDxCs8N+7QHTO0A98IhbVx?=
 =?us-ascii?Q?P+6nY1Taev1gF+xN5nY6S9sR5O/FRXYAMqZinHC5PWYOuHd4doagOzilazjR?=
 =?us-ascii?Q?q7NUhOQSABVWPCFnjfRgn4yiiXDFPXX+nIBquWyiGvUVLHp3nk8JehjBFvve?=
 =?us-ascii?Q?soEADn/Elx/64H2YgyhSsJS54iV0ItGJ/BmJSEbZufU0uLUH0dbqVTxT5Pxn?=
 =?us-ascii?Q?JVJFQEdsuJe1JRzcrXbDnzs24xGg8auD6hsevNQH3rr9Jycvjut7uf6VRlKx?=
 =?us-ascii?Q?PI1HyLSIHT1KpYlEGcyJuc4KDSA/Wy4uQE/A1Y+NLOZlSEU9Uh7AwAbq3PJz?=
 =?us-ascii?Q?itkPH5n0LMKJT1To64mm02Gm6KP6n9ethw5XPtzpWz71vUhcQb9N/l8eRxW7?=
 =?us-ascii?Q?/NQ/xXXbpI0YxzrM+WXbkcY14CkiaqnYYo5Gy3AznVp/ZwRPnd72GYaQOS3N?=
 =?us-ascii?Q?WvNG7+PkbmhArcuarQs/NhOXNim8oAO5L4fiPohP9f6tS0z4vwKcbPaZOXY3?=
 =?us-ascii?Q?pNQdR1a+FUApTSik7gMs66sFrlb56DVlWX30v8/f5fbE3rWAPAoM1ZLP6pZt?=
 =?us-ascii?Q?Go0GBS+QS90z4Z1zFPLHok8Yyn99IHJ46PgH/l1DOtt46LrbxYZw6miJGO4a?=
 =?us-ascii?Q?1z5xPOUgCUQ8vr6SWfXrX/YBt2DScjPwXIxW5LJz9+eARjeggIcPpq3xU4ZN?=
 =?us-ascii?Q?3vZ5xarea+3/YF+Rrxfr4Z2kwVN3jmKxT55mrHwtxFe8XdCSeVmtu3L/6mIf?=
 =?us-ascii?Q?xNzIesxT91uGjqtjk3R3g3I1TUED+KIPr718lwaf7DHkgG8ENJpy8PG9vwDb?=
 =?us-ascii?Q?eStHQMSypWIVHBe+creirG53dwzlHu6aotXJq4SoYdueMRD0JsCmr2JpTjes?=
 =?us-ascii?Q?8A/bCSVncRMX6Z9GNqbvB7FnceZeFoM7soS5jQderu+rMIGLjpkHpJQXtaus?=
 =?us-ascii?Q?zQv+O2OZO5C3FgISMd854DtyoMhj52ExQYCwrx8gnYhWlL9i6OMIlbx0RwEa?=
 =?us-ascii?Q?pfgekhIkJAh22WNT6bHRdiPR2SPmpty8hu3WJLWv/7cxTQcdYpTo65qpkVon?=
 =?us-ascii?Q?7OV0uTnQy8cC/TcSJa08wPte3cCdhxBROs5fr3/l9ERBMojRGk0GcxqbtKWq?=
 =?us-ascii?Q?cAT+9wtm+Yx1oYKQuJCi6abgCYeq6iNFjot58imkZC1x0q2W517XtX9EViRS?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ad60f13a-dfdb-41fa-8638-08dd67280e79
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 20:53:09.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpwJZLO40gc8NZroVMzCtbrGEtiHcdfL9k2seonBWdDftz7a3foUcRb8xj8sxUV3Wz4tJWX2RDINs7v8A1NPmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6735

A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
(which were created to allow Rust to call into inline/macro C functions
without having to re-implement the logic in Rust) to be inlined into
Rust crates without performing global LTO.

If the option is enabled, the following is performed:
* For helpers, instead of compiling them to an object file to be linked
  into vmlinux, they're compiled to LLVM IR.
* The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
  means that functions are inlineable (effect of `_odr`), and the
  symbols generated will have weak linkage if emitted into object file
  (important since as later described, we might have multiple copies of
  the same symbol) and it will may be discarded if it is not invoked or
  all invocations are inlined.
* The LLVM IR is compiled to bitcode (This is step is not necessary, but
  is a performance optimisation to prevent LLVM from always have to
  reparse the same IR).
* When a Rust crate is compiled, instead of generating an object file, we
  ask LLVM bitcode to be generated.
* llvm-link is invoked to combine the helper bitcode with the crate
  bitcode. This step is similar to LTO, but this is much faster since it
  only needs to inline the helpers.
* clang is invoked to turn the combined bitcode into a final object file.

Some caveats with the option:
* clang and Rust doesn't have the exact target string. Clang generates
  `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
  complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64 always
  enable these features, so they are in fact the same target string, but
  LLVM doesn't understand this and so inlining is inhibited. This is bypassed
  with `--ignore-tti-inline-compatible`.
* LLVM doesn't want to inline functions compiled with
  `-fno-delete-null-pointer-checks` with code compiled without. So we
  remove this flag when compiling helpers. This is okay since this is one of
  the hardening features that does not change the ABI, and we shouldn't have
  null pointer dereferences in these helpers.

The checks can also be bypassed with force inlining (`__always_inline`),
but doing so would also bypass inlining cost analysis.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 Makefile                     |  4 +++-
 lib/Kconfig.debug            | 14 ++++++++++++
 rust/Makefile                | 34 ++++++++++++++++++++++++++----
 rust/exports.c               |  5 ++++-
 rust/helpers/blk.c           |  5 +++--
 rust/helpers/bug.c           |  3 ++-
 rust/helpers/build_bug.c     |  3 ++-
 rust/helpers/cred.c          |  5 +++--
 rust/helpers/device.c        |  6 +++---
 rust/helpers/err.c           |  7 +++---
 rust/helpers/fs.c            |  3 ++-
 rust/helpers/helpers.h       | 13 ++++++++++++
 rust/helpers/io.c            | 41 ++++++++++++++++++++----------------
 rust/helpers/jump_label.c    |  3 ++-
 rust/helpers/kunit.c         |  3 ++-
 rust/helpers/mutex.c         | 10 +++++----
 rust/helpers/page.c          |  8 ++++---
 rust/helpers/pci.c           |  8 ++++---
 rust/helpers/pid_namespace.c |  9 +++++---
 rust/helpers/platform.c      |  7 ++++--
 rust/helpers/rbtree.c        |  6 ++++--
 rust/helpers/rcu.c           |  5 +++--
 rust/helpers/refcount.c      |  7 +++---
 rust/helpers/security.c      |  9 +++++---
 rust/helpers/signal.c        |  3 ++-
 rust/helpers/slab.c          |  9 ++++----
 rust/helpers/spinlock.c      | 14 ++++++------
 rust/helpers/task.c          | 23 ++++++++++----------
 rust/helpers/uaccess.c       |  9 ++++----
 rust/helpers/vmalloc.c       |  5 +++--
 rust/helpers/wait.c          |  3 ++-
 rust/helpers/workqueue.c     |  9 +++++---
 scripts/Makefile.build       |  5 ++++-
 33 files changed, 201 insertions(+), 97 deletions(-)
 create mode 100644 rust/helpers/helpers.h

diff --git a/Makefile b/Makefile
index 70bdbf2218fc..97756ecd5a56 100644
--- a/Makefile
+++ b/Makefile
@@ -510,6 +510,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
+LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
+LLVM_AS	= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
@@ -617,7 +619,7 @@ export RUSTC_BOOTSTRAP := 1
 export CLIPPY_CONF_DIR := $(srctree)
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
-export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1af972a92d06..42e26f3377d1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3289,6 +3289,20 @@ config RUST_KERNEL_DOCTESTS
 
 	  If unsure, say N.
 
+config RUST_INLINE_HELPERS
+    bool "Inline C helpers into Rust crates"
+    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
+    help
+        Links C helpers into Rust crates through LLVM IR.
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
index e761a8cc3bd5..07fc4f5d0e36 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,15 +6,19 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
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
 
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
 obj-$(CONFIG_RUST) += bindings.o pin_init.o kernel.o
-always-$(CONFIG_RUST) += exports_helpers_generated.h \
-    exports_bindings_generated.h exports_kernel_generated.h
+always-$(CONFIG_RUST) += exports_bindings_generated.h exports_kernel_generated.h
 
 always-$(CONFIG_RUST) += uapi/uapi_generated.rs
 obj-$(CONFIG_RUST) += uapi.o
@@ -360,6 +364,21 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+# When compiling helpers, filter `-fno-delete-null-pointer-checks` since LLVM
+# prevents inlining such functions into functions compiled without the option
+# (e.g. Rust functions).
+#
+# `linkonce_odr` is added to make functions inlineable and allow LLVM to
+# omit unreferenced functions.
+quiet_cmd_rust_helper = HELPER  $@
+      cmd_rust_helper = \
+	$(CC) $(filter-out -fno-delete-null-pointer-checks $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) -S $< -emit-llvm -o $(patsubst %.bc,%.ll,$@); \
+	sed -i 's/^define dso_local/define linkonce_odr dso_local/g' $(patsubst %.bc,%.ll,$@); \
+	$(LLVM_AS) $(patsubst %.bc,%.ll,$@) -o $@
+
+$(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
+	+$(call if_changed_dep,rust_helper)
+
 rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ && $$3!~/__odr_asan/ { printf $(2),$$3 }'
 
 quiet_cmd_exports = EXPORTS $@
@@ -409,11 +428,13 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
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
 
@@ -522,4 +543,9 @@ ifdef CONFIG_JUMP_LABEL
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
diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index b2135c6686b0..b9432cb2f085 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -2,9 +2,9 @@
 
 #include <linux/device.h>
 
-int rust_helper_devm_add_action(struct device *dev,
-				void (*action)(void *),
-				void *data)
+__rust_helper int rust_helper_devm_add_action(struct device *dev,
+					      void (*action)(void *),
+					      void *data)
 {
 	return devm_add_action(dev, action, data);
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
index 000000000000..d6ee9bf6f5ae
--- /dev/null
+++ b/rust/helpers/helpers.h
@@ -0,0 +1,13 @@
+#ifndef RUST_HELPERS_H
+#define RUST_HELPERS_H
+
+#include <linux/compiler_types.h>
+
+#ifdef __BINDGEN__
+// Omit `inline` for bindgen as it ignores inline functions.
+#define __rust_helper
+#else
+#define __rust_helper inline
+#endif
+
+#endif
diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 4c2401ccd720..f61cf77cf9cd 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -1,100 +1,105 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/io.h>
+#include "helpers.h"
 
-void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
+__rust_helper void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
 {
 	return ioremap(offset, size);
 }
 
-void rust_helper_iounmap(volatile void __iomem *addr)
+__rust_helper void rust_helper_iounmap(volatile void __iomem *addr)
 {
 	iounmap(addr);
 }
 
-u8 rust_helper_readb(const volatile void __iomem *addr)
+__rust_helper u8 rust_helper_readb(const volatile void __iomem *addr)
 {
 	return readb(addr);
 }
 
-u16 rust_helper_readw(const volatile void __iomem *addr)
+__rust_helper u16 rust_helper_readw(const volatile void __iomem *addr)
 {
 	return readw(addr);
 }
 
-u32 rust_helper_readl(const volatile void __iomem *addr)
+__rust_helper u32 rust_helper_readl(const volatile void __iomem *addr)
 {
 	return readl(addr);
 }
 
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq(const volatile void __iomem *addr)
+__rust_helper u64 rust_helper_readq(const volatile void __iomem *addr)
 {
 	return readq(addr);
 }
 #endif
 
-void rust_helper_writeb(u8 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writeb(u8 value, volatile void __iomem *addr)
 {
 	writeb(value, addr);
 }
 
-void rust_helper_writew(u16 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writew(u16 value, volatile void __iomem *addr)
 {
 	writew(value, addr);
 }
 
-void rust_helper_writel(u32 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writel(u32 value, volatile void __iomem *addr)
 {
 	writel(value, addr);
 }
 
 #ifdef CONFIG_64BIT
-void rust_helper_writeq(u64 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writeq(u64 value, volatile void __iomem *addr)
 {
 	writeq(value, addr);
 }
 #endif
 
-u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
+__rust_helper u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
 {
 	return readb_relaxed(addr);
 }
 
-u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
+__rust_helper u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
 {
 	return readw_relaxed(addr);
 }
 
-u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
+__rust_helper u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
 {
 	return readl_relaxed(addr);
 }
 
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
+__rust_helper u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
 {
 	return readq_relaxed(addr);
 }
 #endif
 
-void rust_helper_writeb_relaxed(u8 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writeb_relaxed(u8 value,
+					      volatile void __iomem *addr)
 {
 	writeb_relaxed(value, addr);
 }
 
-void rust_helper_writew_relaxed(u16 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writew_relaxed(u16 value,
+					      volatile void __iomem *addr)
 {
 	writew_relaxed(value, addr);
 }
 
-void rust_helper_writel_relaxed(u32 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writel_relaxed(u32 value,
+					      volatile void __iomem *addr)
 {
 	writel_relaxed(value, addr);
 }
 
 #ifdef CONFIG_64BIT
-void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
+__rust_helper void rust_helper_writeq_relaxed(u64 value,
+					      volatile void __iomem *addr)
 {
 	writeq_relaxed(value, addr);
 }
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
index 06575553eda5..8900cd504cb2 100644
--- a/rust/helpers/mutex.c
+++ b/rust/helpers/mutex.c
@@ -1,19 +1,21 @@
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
+__rust_helper void rust_helper___mutex_init(struct mutex *mutex,
+					    const char *name,
+					    struct lock_class_key *key)
 {
 	__mutex_init(mutex, name, key);
 }
 
-void rust_helper_mutex_assert_is_held(struct mutex *mutex)
+__rust_helper void rust_helper_mutex_assert_is_held(struct mutex *mutex)
 {
 	lockdep_assert_held(mutex);
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
diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index 8ba22f911459..5b1066028d7d 100644
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@ -1,18 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/pci.h>
+#include "helpers.h"
 
-void rust_helper_pci_set_drvdata(struct pci_dev *pdev, void *data)
+__rust_helper void rust_helper_pci_set_drvdata(struct pci_dev *pdev, void *data)
 {
 	pci_set_drvdata(pdev, data);
 }
 
-void *rust_helper_pci_get_drvdata(struct pci_dev *pdev)
+__rust_helper void *rust_helper_pci_get_drvdata(struct pci_dev *pdev)
 {
 	return pci_get_drvdata(pdev);
 }
 
-resource_size_t rust_helper_pci_resource_len(struct pci_dev *pdev, int bar)
+__rust_helper resource_size_t rust_helper_pci_resource_len(struct pci_dev *pdev,
+							   int bar)
 {
 	return pci_resource_len(pdev, bar);
 }
diff --git a/rust/helpers/pid_namespace.c b/rust/helpers/pid_namespace.c
index f41482bdec9a..f4419c3ff5bb 100644
--- a/rust/helpers/pid_namespace.c
+++ b/rust/helpers/pid_namespace.c
@@ -2,19 +2,22 @@
 
 #include <linux/pid_namespace.h>
 #include <linux/cleanup.h>
+#include "helpers.h"
 
-struct pid_namespace *rust_helper_get_pid_ns(struct pid_namespace *ns)
+__rust_helper struct pid_namespace *
+rust_helper_get_pid_ns(struct pid_namespace *ns)
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
+__rust_helper struct pid_namespace *
+rust_helper_task_get_pid_ns(struct task_struct *task)
 {
 	struct pid_namespace *pid_ns;
 
diff --git a/rust/helpers/platform.c b/rust/helpers/platform.c
index ab9b9f317301..052b2a09f1a9 100644
--- a/rust/helpers/platform.c
+++ b/rust/helpers/platform.c
@@ -1,13 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/platform_device.h>
+#include "helpers.h"
 
-void *rust_helper_platform_get_drvdata(const struct platform_device *pdev)
+__rust_helper void *
+rust_helper_platform_get_drvdata(const struct platform_device *pdev)
 {
 	return platform_get_drvdata(pdev);
 }
 
-void rust_helper_platform_set_drvdata(struct platform_device *pdev, void *data)
+__rust_helper void
+rust_helper_platform_set_drvdata(struct platform_device *pdev, void *data)
 {
 	platform_set_drvdata(pdev, data);
 }
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
diff --git a/rust/helpers/rcu.c b/rust/helpers/rcu.c
index f1cec6583513..0bd98ab32300 100644
--- a/rust/helpers/rcu.c
+++ b/rust/helpers/rcu.c
@@ -1,13 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/rcupdate.h>
+#include "helpers.h"
 
-void rust_helper_rcu_read_lock(void)
+__rust_helper void rust_helper_rcu_read_lock(void)
 {
 	rcu_read_lock();
 }
 
-void rust_helper_rcu_read_unlock(void)
+__rust_helper void rust_helper_rcu_read_unlock(void)
 {
 	rcu_read_unlock();
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
index 0c4c2065df28..676c82a4a6eb 100644
--- a/rust/helpers/security.c
+++ b/rust/helpers/security.c
@@ -1,19 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/security.h>
+#include "helpers.h"
 
 #ifndef CONFIG_SECURITY
-void rust_helper_security_cred_getsecid(const struct cred *c, u32 *secid)
+__rust_helper void rust_helper_security_cred_getsecid(const struct cred *c,
+						      u32 *secid)
 {
 	security_cred_getsecid(c, secid);
 }
 
-int rust_helper_security_secid_to_secctx(u32 secid, struct lsm_context *cp)
+__rust_helper int rust_helper_security_secid_to_secctx(u32 secid,
+						       struct lsm_context *cp)
 {
 	return security_secid_to_secctx(secid, cp);
 }
 
-void rust_helper_security_release_secctx(struct lsm_context *cp)
+__rust_helper void rust_helper_security_release_secctx(struct lsm_context *cp)
 {
 	security_release_secctx(cp);
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
index a842bfbddcba..71dd3fc88d53 100644
--- a/rust/helpers/slab.c
+++ b/rust/helpers/slab.c
@@ -1,15 +1,16 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/slab.h>
+#include "helpers.h"
 
-void * __must_check __realloc_size(2)
-rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
+__rust_helper void *__must_check __realloc_size(2)
+	rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
 {
 	return krealloc(objp, new_size, flags);
 }
 
-void * __must_check __realloc_size(2)
-rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
+__rust_helper void *__must_check __realloc_size(2)
+	rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
 {
 	return kvrealloc(p, size, flags);
 }
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index 42c4bf01a23e..023ef3a24913 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/spinlock.h>
+#include "helpers.h"
 
-void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
-				  struct lock_class_key *key)
+__rust_helper void rust_helper___spin_lock_init(spinlock_t *lock,
+						const char *name,
+						struct lock_class_key *key)
 {
 #ifdef CONFIG_DEBUG_SPINLOCK
 # if defined(CONFIG_PREEMPT_RT)
@@ -16,22 +18,22 @@ void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
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
 
-void rust_helper_spin_assert_is_held(spinlock_t *lock)
+__rust_helper void rust_helper_spin_assert_is_held(spinlock_t *lock)
 {
 	lockdep_assert_held(lock);
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
index 80d34501bbc0..6ef908bd45f9 100644
--- a/rust/helpers/vmalloc.c
+++ b/rust/helpers/vmalloc.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/vmalloc.h>
+#include "helpers.h"
 
-void * __must_check __realloc_size(2)
-rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
+__rust_helper void *__must_check __realloc_size(2)
+	rust_helper_vrealloc(const void *p, size_t size, gfp_t flags)
 {
 	return vrealloc(p, size, flags);
 }
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
index 08b6380933f5..f7bccb22328b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -252,7 +252,10 @@ rust_common_cmd = \
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
2.47.2


