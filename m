Return-Path: <linux-kbuild+bounces-5774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D58A377DD
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2025 22:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D3747A357F
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2025 21:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75DF1154C05;
	Sun, 16 Feb 2025 21:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="kPbIPpth"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3867F9
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Feb 2025 21:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739742372; cv=none; b=un+FulZ+bULDX6aggcwR5yBg52fLGoASlvPb7H6FXQN1NQOQGEByz86B4oqkVRzwftfd2dWTUEPfe3NWcFXuNSZUuQGwUZof9sJRi2mFCZ5L4ZXV9MU4/rOiJeaPxae6KIWbtxzK0JrgFzX89UPl1qGWZAYoXVAdCoLA1nUYmtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739742372; c=relaxed/simple;
	bh=XO1ungWgGlaCMuovbefRcBqAASEVNsr83NIPIV3eZJ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OZYDZteKke6YWqLN/kamTU7piVCgTMo/WBHBZ7DfSE69c4cGNa1ug0Lv91UAImJJtSkv87vX1Aw0iyMZJbLlphmjHLQ5CU9iBPbfzzIfPrVqajU7dmhSw6vNdMbG53Fnmb8v3GLVImmMDgG9boy++BSUaQFWH3Q3lRtG1jjQvC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=kPbIPpth; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7F609240029
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Feb 2025 22:46:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739742368; bh=XO1ungWgGlaCMuovbefRcBqAASEVNsr83NIPIV3eZJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=kPbIPpthwoSzJrHF6WoSt0vJa3YV4XzlX2BCAHj+mvQ0EybBKlwJ8jgpVEE8gRnr5
	 gef7H9RKCzYsfY6virj4KIBSp2PVtwCtaXY7ueoTR6Cs4A/RaFbe0GbBaHNj1YB69Q
	 JYsTcCGbxcl3WI6YTF9AXYf7NdpHbCBKM++vQDQFfNu0iyJA03qDpqWR2207bzZ+2A
	 yn0fS1xi0etdtvYLdPZ7azQynTmZHcg1vKP/Bz8+hMSg4Irhqkl/6evFH667tskUWI
	 k3Py369cmhALGvlV9dILjebrsHJZ0kZJZDZ7FL8dlJ5GJMH85WfXaUqD6UYoCAgpDY
	 DP4eP6rpw1tbA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywzqx1t8mz6txn;
	Sun, 16 Feb 2025 22:46:05 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Masahiro Yamada <masahiroy@kernel.org>,  Nathan Chancellor
 <nathan@kernel.org>,  Nicolas Schier <nicolas@fjasle.eu>,  Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Danilo Krummrich <dakr@kernel.org>,  linux-kbuild@vger.kernel.org,
  linux-kernel@vger.kernel.org,  rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: enable `too-long-first-doc-paragraph` clippy
 lint
In-Reply-To: <20250216213827.3752586-2-benno.lossin@proton.me>
References: <20250216213827.3752586-1-benno.lossin@proton.me>
	<20250216213827.3752586-2-benno.lossin@proton.me>
Date: Sun, 16 Feb 2025 21:46:04 +0000
Message-ID: <m2jz9p7ecj.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benno Lossin <benno.lossin@proton.me> writes:

> Introduced in Rust 1.82.0 [1], this lint ensures that the first line of
> documentation is short. That is because those lines get rendered in the
> html version of the docs directly next to the items and should therefore
> be short.
> Additionally, a short first sentence might help developers remember the
> rest of the documentation if they have read it already before.
>
> Reviewers have pointed this out manually on several occasions, thus
> enable the lint.
>
> Here is an example error fixed in the previous commit:
>
>     error: first doc comment paragraph is too long
>       --> rust/kernel/driver.rs:13:1
>        |
>     13 | / /// The [`RegistrationOps`] trait serves as generic interface for subsystems (e.g., PCI, Platform,
>     14 | | /// Amba, etc.) to provide the corresponding subsystem specific implementation to register /
>     15 | | /// unregister a driver of the particular type (`RegType`).
>     16 | | ///
>     17 | | /// For instance, the PCI subsystem would set `RegType` to `bindings::pci_driver` and call
>        | |_^
>        |
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#too_long_first_doc_paragraph
>        = note: `-D clippy::too-long-first-doc-paragraph` implied by `-D warnings`
>        = help: to override `-D warnings` add `#[allow(clippy::too_long_first_doc_paragraph)]`
>
>     error: aborting due to 1 previous error
>
> The exact length can be configured in the .clippy.toml if we need to do
> so.
>
> Link: https://github.com/rust-lang/rust-clippy/issues/12989 [1]
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index 9e0d63d9d94b..d00cbeb63714 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -486,6 +486,7 @@ export rust_common_flags := --edition=2021 \
>  			    -Wclippy::undocumented_unsafe_blocks \
>  			    -Wclippy::unnecessary_safety_comment \
>  			    -Wclippy::unnecessary_safety_doc \
> +			    -Wclippy::too-long-first-doc-paragraph \
>  			    -Wrustdoc::missing_crate_level_docs \
>  			    -Wrustdoc::unescaped_backticks

Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>

