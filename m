Return-Path: <linux-kbuild+bounces-3224-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7E695FA6A
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 22:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B40DAB2203A
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 20:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B70199E9C;
	Mon, 26 Aug 2024 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j623cd1/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEED811E2;
	Mon, 26 Aug 2024 20:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724703139; cv=none; b=g1Ai43ZDEUx5gAHFBYYMY3btbNmdGcbcGexuJgc3s7FnaMzmQUtUM29aK+IQqyywmWgw4XHN7AbOLN2ol1DXGMzWurK22EoMjjnags1NkcXr3rIOmuFTb0v8jKBikfTTOLWartNz7Rqh19guWMEK/8qVMLESPgRbtwtSVMCBqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724703139; c=relaxed/simple;
	bh=rbSh8CmH7ijmLi8lho/8tDPvmVlxo2BscRK2x9bo/Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0tw8OHKehygAvlMDpzzpSFG4KaOsIc/5Ddm81S9O51q3wbAgUI3HIwnBan4kK2styPbQPCJV9+qL+ya2dp1QEIQ7qsEGWkMbHG2L394ZRP9/56xneDzMdhPoDeNfV7jHaYJGxIydfP/8ntFWn37Z0XoCos5rokLGIb+1U3LDLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j623cd1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCB9C8B7AA;
	Mon, 26 Aug 2024 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724703138;
	bh=rbSh8CmH7ijmLi8lho/8tDPvmVlxo2BscRK2x9bo/Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j623cd1/U+2g5Dgk9F6SU74+/4hy9tkDdQijiKKVQX7xKpQBNo4w8X3i97Zf7AH8F
	 MAKj58+DtCiZHysZnZEx2lzG5YffQiYv0rF4QKSblwO48L9HfCtNUJc0Sdma1dAAsZ
	 uLvB0jqLlFH0/+HMVcyrpNgZRa9N9ECKg7CkzqZDBno2E68wM8nR00nmjey4zEwgN2
	 CcBz8SBJz7Id8HQwf/u5R/2caJ3aJ0SqTJPohbSxZ1IoFsoTuI1yayYYJUDCdRKiVP
	 Dozcyqa6rOiFOK/+MYs6H5qwnxeg104wP4JMhxlMYxFuHwJi1JXdgVxKKaTGhqbJUW
	 B08nfstphiQaA==
Date: Mon, 26 Aug 2024 13:12:18 -0700
From: Kees Cook <kees@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] rust: support for shadow call stack sanitizer
Message-ID: <202408261311.3C191659@keescook>
References: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>

On Mon, Aug 26, 2024 at 02:22:52PM +0000, Alice Ryhl wrote:
> This patch adds all of the flags that are needed to support the shadow
> call stack (SCS) sanitizer with Rust, and updates Kconfig to allow only
> configurations that work.
> 
> The -Zfixed-x18 flag is required to use SCS on arm64, and requires rustc
> version 1.80.0 or greater. This restriction is reflected in Kconfig.
> 
> When CONFIG_DYNAMIC_SCS is enabled, the build will be configured to
> include unwind tables in the build artifacts. Dynamic SCS uses the
> unwind tables at boot to find all places that need to be patched. The
> -Cforce-unwind-tables=y flag ensures that unwind tables are available
> for Rust code.
> 
> In non-dynamic mode, the -Zsanitizer=shadow-call-stack flag is what
> enables the SCS sanitizer. Using this flag requires rustc version 1.82.0
> or greater on the targets used by Rust in the kernel. This restriction
> is reflected in Kconfig.
> 
> It is possible to avoid the requirement of rustc 1.80.0 by using
> -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However, this flag
> emits a warning during the build, so this patch does not add support for
> using it and instead requires 1.80.0 or greater.
> 
> The dependency is placed on `select HAVE_RUST` to avoid a situation
> where enabling Rust silently turns off the sanitizer. Instead, turning
> on the sanitizer results in Rust being disabled. We generally do not
> want changes to CONFIG_RUST to result in any mitigations being changed
> or turned off.
> 
> At the time of writing, rustc 1.82.0 only exists via the nightly release
> channel. There is a chance that the -Zsanitizer=shadow-call-stack flag
> will end up needing 1.83.0 instead, but I think it is small.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks for continuing to chase this down.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

