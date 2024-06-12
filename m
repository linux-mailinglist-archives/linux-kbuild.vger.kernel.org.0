Return-Path: <linux-kbuild+bounces-2099-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4287B9058C9
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 18:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C29B1C21913
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Jun 2024 16:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7479A1822F3;
	Wed, 12 Jun 2024 16:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="auijZpC8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (mail-lo4gbr01on2093.outbound.protection.outlook.com [40.107.122.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21CF1822ED;
	Wed, 12 Jun 2024 16:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.122.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718209589; cv=fail; b=fgsbb4i64hZGJUpkekp24V3lOnMMU/o9a+Ew6LyyKmGWPB6tmWuwRaHI5ElUxmilnzH71RSre1VeE/yKg4EBAMhO/+2hpg0XYMLAuM0ztEwA/KaQRKHibj+m2io+cIuOHGVntN/b4jxu7FYkS6Rw7t2+N+kiZxm2rrSqaVFops0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718209589; c=relaxed/simple;
	bh=MBFu4J9+OxZubq8gfcMp9FsYuDVq9pnlAH0AAvK8mPo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iycEyNzleKFvCKTkToK4RFRWNJm0jWn8iFn37w8xeoMCTwWGQlnTMkrwBd7vqsoCf8o+vtrQ+iXHGv+6XcTIwAsTXW+g7eibYfifbT/wvH8+jr7h1tE6OGjtx683V8rn8hBW7FO/HTXJVZmeeRT8i6xEf5zWglx+1RteiVpBpT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=auijZpC8; arc=fail smtp.client-ip=40.107.122.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeO9Vss6Cu8VBT9X8iFsrZs7ua6lRlNvVfJh6XGICbOy7OqMmjd3XQoOS6LzLy50gyJuVgwjADrTYlBGHqz+QDued646sITNsX1YYKI8xJEsM03A70HApNn5XYu2rvuoajwZxqB/fbCISveEeeQbCr94/yalZsq+HM1tvpm4G0flygNXTPtibEMsmQWigpN+V6IvskVEU/wuu+02Hn7nYSBvN5gXMPCMNs2lcT0CjbjwnzI8ThzqPhnsH7hVlFk7+UhX1jGJvmssMpNNZXmK8PRaZScW/sIk4oSKkbfYtB3dCtuoTw/Hlp9DfvRbQ+mtPhV6HqusAcjkmALsQjQaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBFu4J9+OxZubq8gfcMp9FsYuDVq9pnlAH0AAvK8mPo=;
 b=IIg/mkPnP3Ev5ippvQw3GgluKQuy8+oNtw8d3srhMxdI+dq7N68nVT21CV2L6Kxf+lUkF0jY7NkVBcg24uUSaYmNYqr+WuXY5NOCP9yMVOofDyY959Qn2tTk8acYPzuGpJuF3gHBd2tUdyiXaWjfu04JkhymTZG2S9YCm8IlqWPuN1XGPHGjpTobLTixiKBLFPgO2O1oZ41gwuZogCPZVZLcql5tyq8iHFeZ5810fuTAyQfAFu/cR0SvqrIz02JJC1T2rM3wWcmPiY99Ry4SyX3+GjglWixIHJbxKjDyr53VlQYf/ZNvcu6jW8SCv6rEi8FI+6wOzfKp1ZOzGn8d2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBFu4J9+OxZubq8gfcMp9FsYuDVq9pnlAH0AAvK8mPo=;
 b=auijZpC8OYH4l7GyQIVDUTpd8zSaw5+mSHC85BNumInsu86oTdYZftitWQ+28UNtXrMB7rNkY9y7gP4Lc5oeuvGmXvG1og4K+QLO8Ve2cWubdVIKQ3bwjivOSl8ssyN/grQh4CBiKK93cGUMacyeQK6h/+5yhkMik1qGrUgi4KY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by CWLP265MB5866.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20; Wed, 12 Jun
 2024 16:26:25 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%5]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 16:26:25 +0000
Date: Wed, 12 Jun 2024 17:26:22 +0100
From: Gary Guo <gary@garyguo.net>
To: Matthew Maurer <mmaurer@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Andrew Morton
 <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
Message-ID: <20240612172623.5876d0ad@eugeo>
In-Reply-To: <CAGSQo02_siEiS07H+7MCi_T2REGoyF6FFuGHVmiUFi4EocLizQ@mail.gmail.com>
References: <20240529202817.3641974-1-gary@garyguo.net>
	<20240529202817.3641974-3-gary@garyguo.net>
	<CAGSQo02_siEiS07H+7MCi_T2REGoyF6FFuGHVmiUFi4EocLizQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::21) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|CWLP265MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 5667fda9-ab82-4b94-405f-08dc8afc6756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230034|7416008|366010|376008|1800799018;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U9FJoHf6T0Lq4y2n1LMbx0/wXY0fKwf1lp6zHvINIhY4UQTyKqrUwKkohJoi?=
 =?us-ascii?Q?XqK2D7GH6n1NdYdJFTFk5eZJUYMIE4g+irH611foKOLSoMEZqn/+4nyvmQQN?=
 =?us-ascii?Q?D5HmGGP3qJ6cPYj1223Li4mArPx2zIuNubFKnTF1JF6wGlH4m3QKdmuG4rnH?=
 =?us-ascii?Q?ouAS/Ah5xsajeYac+C32ZNImKwENGRxC/pQSpwiXcyb+DQ5Ggv33S/4D6UvK?=
 =?us-ascii?Q?GuHjepb6LYAXBwKoKVu+3KyEnA9x3h71nglJiOlDxbqGZ8uredwPLml9po14?=
 =?us-ascii?Q?Fhold2TjSQCRpN40BGhww+HA5EgAANGPg+kNcL7B/lpMXchAIlkU15WvzS41?=
 =?us-ascii?Q?Zm/f/rAUFcMmPWinS2bahkRZjaKvIR1zCrWVKFBWQ7UtSXdObz4dsNJq7rU6?=
 =?us-ascii?Q?MSfX3up7EVybOAJxvsLKYyG8RYu9HU8TWiWE/Kx/unEaGBB9Y64E44lr5/4E?=
 =?us-ascii?Q?FU8/FcgDBgNjTr30e2rh5aPJRuW6mwvtmF0vB3bZfESKiyneoafjXEYJs+pf?=
 =?us-ascii?Q?kzbcsTfHvAFE05jar2sRhflHSY+vsO9GplknE8fwHNUXEyjxjgvfP7Yx9LNo?=
 =?us-ascii?Q?huxZ79OmxWTwPvbQIfOovdgLGTHxfdmB3ofzZrEH0hFSmqc1fTTUi7kr+d4t?=
 =?us-ascii?Q?A8Xu5/gF8n2UG/tqgzl9OfoLm2TlOLCGzqsx1uOKlnRc5zSAF1ZEZ0i4YXvJ?=
 =?us-ascii?Q?s3+pqynG+uEcyFzIUOrPPp7WtgqDNRF03sTy42o169YizSBUnXc/j+gy7zGd?=
 =?us-ascii?Q?DNFM7egojSz9tbKAilz5W9yArQszhKe+UBm2uaWJJy4BD0MyWLvfHsU5afY6?=
 =?us-ascii?Q?OTHCfARgRjAzifftEGZHExeStbV0tMCnC207CtCAXQqfqYK1NB83ROnyOuX6?=
 =?us-ascii?Q?BJeqssApBIDPeEQS4c0/7yyATbiWRxG8kSaJQb/q1rUkEt+qHBCzYABhxkx2?=
 =?us-ascii?Q?bValPs9CWN5syoLtGygndAwCpfWRZxGVwUM0xkSNwEyQ4L4u7CqKpIImR+4f?=
 =?us-ascii?Q?SdGoUwkGCOwEqbBfO55t6g79AgDM4XrFGW9Hz2oS5QOWWE9uiWJ3qERIGTDe?=
 =?us-ascii?Q?MvxV9e4MsnFfo/tYDWhSkZPBLNKR5PJRnIjM8twYFn5utoTaqn69BkgGXZ7l?=
 =?us-ascii?Q?QxgWMC35RQehf1VfEmFtoAL3C/HGBeS/q/KfvQXA3lZWCSqC6vD5YX0ptoSD?=
 =?us-ascii?Q?v8OJEtwAnjwpUm0yCef2gbYmxDstAZdCD8RjaIAALcTQq1xi58RrDKTlwj8j?=
 =?us-ascii?Q?azUNNdDDrQ5NhW94RndpHNa232MIbaZ8aSEIXOyUD0W6/N2J1wSo8mDpbjHT?=
 =?us-ascii?Q?ZexZGn5PT9fylWFe8SjhxNW/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230034)(7416008)(366010)(376008)(1800799018);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G00p+Ka9p+5WUlHg25Or4f2qraxx2Tzxowxct3+RoKjGAnuoZ5jgtjnf5OI8?=
 =?us-ascii?Q?YyRRG+coZxVllxWUhtSR/MLT/uiDwGz1GHgc8lIE9OiW552sfsHTyECJ157B?=
 =?us-ascii?Q?cdAuS0bfCuFifnoul+c2WspK4T4djIWdXzCgSTUusAr+PgFpV4K+9vdZbniv?=
 =?us-ascii?Q?fnL1xkd7LhdeVmUgFg5RQrAO+awZJ9u0UeDgivcqqGSeuvtng2BVxkhzUZA2?=
 =?us-ascii?Q?BbW+/Ki32LWn9cWfG7PoOhYpIi8DItQ3tF6ThVgm2hifwTxMirqBMjQpKesu?=
 =?us-ascii?Q?OXOjMTjxUlCkr82K4oInn0A3XRprndMfTCubFZRD2PrTRMRJgEo2vNB9+dvt?=
 =?us-ascii?Q?066BlM1xxqaRfndeVzU5rYTGz2R81QS+U6walZZ+16pvSdCkZjRBOqQx7BVB?=
 =?us-ascii?Q?+2DRPnXaDTYNld2gM3J9OFJ5GByH54SrHsrB5knoxBpkoFJu5kn3C3Glmqqp?=
 =?us-ascii?Q?VOzdw11lA/uQ+izCh93q/I1kF0GjrvfCm6o1EjUFUWBs3+W5Dt/1fZ/6apfX?=
 =?us-ascii?Q?FyxvkRPaDtoDNqjP0PThWWRWeKlzbBocxZTPhzRiFKNvAGWuYe9NXBnfJPgk?=
 =?us-ascii?Q?30BdtJMtNwxouhzhrVnyVP6IIhjLgZxk5I4yoblxY+JQS81ho+k9p9XAcf6u?=
 =?us-ascii?Q?ZDLMSgUdU0nUHdHyHpF5NAat2H30tiXBvp1gu1/93gkQEPwf4Xk8HwZ9W8nE?=
 =?us-ascii?Q?S3y8mCRnGucv17YdKNBMWakS7eq1O1hrKAY0+miYW+0xaVof6VUm7hBLMj3G?=
 =?us-ascii?Q?z34erQ553iKvtiYLC1Z8RzAI71gcq2Ll42SSh/38qGU6qKZxs+btZZ1nroJq?=
 =?us-ascii?Q?29QuKLshjkW0tSsdD6XHPXay5Gtvh08VDT8KpAbwFNy6spiCNfhoyburU5dp?=
 =?us-ascii?Q?9fwn2rSCPXK/Mqgb+QsK2pITzv+0giH9bBFxanP7KVUns7kJhUzCdkeY90Zu?=
 =?us-ascii?Q?TCn9YnafJzvj+pP3PqI5e4TIc4DO3VZvuTE9YAKkStsMLil+fs9tqp6/XXfs?=
 =?us-ascii?Q?KGN9dLc2qwdn90/vdf/Ay01OFH62oqyIFb83HCOU0B/BO3K57yDMnO6CeR87?=
 =?us-ascii?Q?o16jwzoFB9JD+qT2DWrYJU+oU5Hs24Y0LgukwI4NfHNcH3/dHPZ5PU5sm5hO?=
 =?us-ascii?Q?j0LISiG/aEloO5x8nSVaqReRIawb57hNVTdUBPFu7sKKVsuVv2+WEd8cLDlH?=
 =?us-ascii?Q?Wz5C83FKyHozA7v2N2fb+RBkghx0LpYxfSs/bfxXMr2Kmstw2QRj1j2D+LYI?=
 =?us-ascii?Q?9UfVleDZSng18Kgsb5BGSnZfQv8Qe+VWg64iykl1G4+5VVY/eYOowCWeMonw?=
 =?us-ascii?Q?R7NJhNlz6uVebYtOUEXtezw0z506CK3h46ZCQ+3DsSF6vd/Y8LTxS26EyZ18?=
 =?us-ascii?Q?DLu5r58q4OVhNNUg99kEcv08FwPwRnm14RaC8rtjQpVGxwdFEbpAvbzZ/H3q?=
 =?us-ascii?Q?+wkTlrfKe2JbhL7+uPfr7Sa5ZizdaX1HjTle6eXVm7zC4lsPTpKrxGKkEoN+?=
 =?us-ascii?Q?0+k9qnr5lXojy0Ky3FuFuaPdMj2BllbmWa4ZTV+V+onYVymx2g7hn5evpzV2?=
 =?us-ascii?Q?MkKAoazXsgNI6EXq57L7d26l63qZGsNjTCFfFgcO?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5667fda9-ab82-4b94-405f-08dc8afc6756
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 16:26:25.1134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sJlvZX0YWrcnTREky5JpAXWfm+Uz5bDEWiQntfEnJ1duUNmQ6rHl0Lb3R+OsJJPYJmUUmR9L7+ZOT9wRxuHAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5866

On Fri, 7 Jun 2024 07:40:45 -0700
Matthew Maurer <mmaurer@google.com> wrote:

> The LLVM `.ll` textual bitcode representation may change from version
> to version, which makes using `sed` to edit it potentially fragile.
> Would it be possible to attach similar attributes without this? (Or
> other attributes that can accomplish something similar, see the second
> part.)

I agree that text editing is fragile and should be avoided, but I'm not
aware of a way to achieve this without text editing.

> Would it be possible to use a Rust-only-LTO (actual LTO) flag rather
> than a `llvm-link`? It seems likely that someone that wants to use a
> synced `clang` and `rustc` to allow helpers to be inlined would be
> unlikely to object to thin LTO of Rust. This would avoid introducing a
> new tool.

There's no way for rustc to actually perform the LTO, since the crate
type that we use is rlib rather than staticlibs or cdylibs, Rust does
not take care of the linking.

> As one possible route around editing the `.ll` file, we could consider
> *not* hiding these symbols, just marking them as "good idea to inline
> if possible", and then masking any symbol that ends up in the final
> `.o` via `objcopy --localize-symbol=blah`. If we're doing full-kernel
> LTO rather than rust-only LTO, we'd need to use `llvm-objcopy`
> instead, but the same process would follow - a postprocessing step on
> the final crate object that localizes the symbol, with LTO giving the
> compiler the option (but not requirement) to inline these functions if
> it seems like a good idea.

This was one of the approach that I considered, but IIUC objcopy
require you to supply it a list of exact-match symbols rather than
patterns, so we have to get all helper symbols and then feed it to
objcopy. I really want to avoid having a script or host program to do
this step.

Best,
Gary



