Return-Path: <linux-kbuild+bounces-2839-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5C94984E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:31:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43BA1F22D9E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 19:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006321C32;
	Tue,  6 Aug 2024 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWX4AoF7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D06149C53;
	Tue,  6 Aug 2024 19:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722972690; cv=none; b=u/8qrKknXbbkJaHKgSnck86V8O7JwbIY+d/PKIFvCiJsBz0JdZv8ksOpUzqDRly3pTHhWF6wW6xNetEcsqrLyVXzURtQjGgT4lbB1ZbkOBwc9TBZh/G/BJDv2AYaMelvw3YCa0OrT5jp69CNzrqYAbVMTL16pLy+H2p2ORqzZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722972690; c=relaxed/simple;
	bh=jy3PddGYjt0uN5zHNvmmqGl+uOosLHmlsSl+MaIaI5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbIEkvwWQA4jOJ1cHIX8vp+nQFYiRkj6EbDxUNlHTNHC6k2GnUQd9hEi3oGI46TIjAqpURXWI4dvhmONBqEKYtNwQkGWjZyP00Z2Yagi2dJyRFnQySXsd+cDrMeOAEsyw1SI8WJ/JNf9S5/58kJq85caZhJUvbsVLdNfNwIQRow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWX4AoF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0B6C4AF0D;
	Tue,  6 Aug 2024 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722972690;
	bh=jy3PddGYjt0uN5zHNvmmqGl+uOosLHmlsSl+MaIaI5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWX4AoF7bx7+/nBB+2IDB+CslsPtv2F9Tq24wpo2ry6qMV6ad6T1AiLd2Jez4fFjk
	 rHawOfpbQMbbITUQfm3txG0aby6pQq/g1Sv0hke0X6OkVKhYAt6IHbJk5G5oKyncf6
	 lodtdLEhU81ZpQgYHJKWyHKJZcBtPI06Zb2hex42FdrCT0Wvq4x2cRqV4CyyFIAvtk
	 aRGdCl+btd5GD6YUheYbiZT76It2hZSJCw9cDSgxx2mPdOYnvYxB+OQJGMWWpxTJzP
	 +k5e1pqG0El/X9sOlVpogJHsfuhWyJ8eeQ0QkKaJUwDebbm3GuNtBJyL/rt1WytLvl
	 8gLPHAuvFRpZA==
Date: Tue, 6 Aug 2024 12:31:29 -0700
From: Kees Cook <kees@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Rust KCFI support
Message-ID: <202408061230.82BE3CEFA7@keescook>
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>

On Thu, Aug 01, 2024 at 01:35:16PM +0000, Alice Ryhl wrote:
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
> ---
> Changes in v2:
> - Fix for FineIBT.
> - Add more info to commit messages and config descrptions.
> - Link to v1: https://lore.kernel.org/r/20240730-kcfi-v1-0-bbb948752a30@google.com
> 
> ---
> Alice Ryhl (1):
>       cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
> 
> Matthew Maurer (1):
>       rust: cfi: add support for CFI_CLANG with Rust
> 
>  Makefile                        | 10 ++++++++++
>  arch/Kconfig                    | 16 ++++++++++++++++
>  arch/x86/Makefile               |  4 ++++
>  init/Kconfig                    |  4 +++-
>  rust/Makefile                   |  2 +-
>  scripts/generate_rust_target.rs |  1 +
>  6 files changed, 35 insertions(+), 2 deletions(-)

This is great to have! I assume this will go via the Rust tree, so:

Acked-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

