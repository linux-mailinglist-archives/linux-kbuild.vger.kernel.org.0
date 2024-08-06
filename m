Return-Path: <linux-kbuild+bounces-2840-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9022949884
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 21:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B7228257D
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 19:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD909163AA7;
	Tue,  6 Aug 2024 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nmkIqn3E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07B01547DE;
	Tue,  6 Aug 2024 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722973058; cv=none; b=oA1C0XOBhwP6K0nOFGVcMQSLuAgsmERIbHwA20ifYT1rzgwhuUEbXJdKuPCpxWfph4y/9kfctv5+5kqD+3roUR1g4m5WRiU6YwC8c+4cmEGMEcI+cHOyISSMl2wegypnUddDLmAb9XRbkLvBk9AYQWUu/svgKYju/mpA2R97Rs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722973058; c=relaxed/simple;
	bh=e35vjbhMOBQ7+JlS9DJB1T/+6MrsmRSF0dBpuKz6rv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxfbQTJGe739NLRrChilnHYRClOjU4DA61es6JEu8uJIdC6AfjlmbHKJD6wFdUaHuJ2/YgGum8xGyBL3aY57uOzGcDCX7D9HvGzLyq0qAfHPP1ClGmKl+Ke/jyi1twUhduG75GYk5LpxFerfh4aF8RzXrB2bi4p9snl6AhDzd2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nmkIqn3E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470CEC32786;
	Tue,  6 Aug 2024 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722973058;
	bh=e35vjbhMOBQ7+JlS9DJB1T/+6MrsmRSF0dBpuKz6rv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmkIqn3EpcMc8L4EHnk1TELdWqSEC3z+uHowUc0kL+mxAwN/zSmr8lnK0i/9VGCN6
	 lSJXwLxXeuc0Goxl+fmeikJW7rLzn/rsCIqPLXaSiecU7LxzqM0qgsP9VUPnGvYb69
	 e8EM9A+j3etbdlye8tzL/FiVPyO+GYyPOw0Caij4n7Mzqk9aVwPUASf4t6M/pV2FLQ
	 r1pCH5kHfDLg/inmgBi7397YWnIIvrLdUBew6sNrmIHZwPo8u7VPwrJoX24YG1Racu
	 KPgALQuVkiP/7qrQb8PowXWdJKOPkRHVE3Lashh9oPxppuDFyaQSz5kKZf+/jRI/K4
	 XDBXBZJfqJUBg==
Date: Tue, 6 Aug 2024 12:37:37 -0700
From: Kees Cook <kees@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH v5] rust: support for shadow call stack sanitizer
Message-ID: <202408061237.17199E80AC@keescook>
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>

On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> This patch adds all of the flags that are needed to support the shadow
> call stack (SCS) sanitizer with Rust, and updates Kconfig to allow
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
> enables the SCS sanitizer.
> 
> At the time of writing, all released rustc versions up to and including
> 1.81 incorrectly think that the Rust targets aarch64-unknown-none and
> riscv64-unknown-none-elf don't support -Zsanitizer=shadow-call-stack, so
> the build will fail if you enable shadow call stack in non-dynamic mode.
> See [1] for the relevant feature request. To avoid this compilation
> failure, Kconfig is set up to reject such configurations.
> 
> Note that because these configurations are rejected, this patch only
> allows SCS to be used with arm64 and not on riscv. However, once [1] is
> implemented, I will submit a follow-up patch that allows configurations
> without UNWIND_PATCH_PAC_INTO_SCS on sufficiently new compilers. That
> patch will implicitly allow SCS to be enabled on riscv, but this is okay
> because unlike arm64, riscv does not need any flags for rustc beyond
> -Zsanitizer=shadow-call-stack.
> 
> It is possible to avoid the requirement of rustc 1.80.0 by using
> -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However, this flag
> emits a warning during the build, so this patch does not add support for
> using it and instead requires 1.80.0 or greater.
> 
> The `depends on` clause is placed on `config RUST` to avoid a situation
> where enabling Rust silently turns off the sanitizer. Instead, turning
> on the sanitizer results in Rust being disabled. We generally do not
> want changes to CONFIG_RUST to result in any mitigations being changed
> or turned off.
> 
> Link: https://github.com/rust-lang/rust/issues/121972 [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I'd like to make sure Ard is happy with this, but from what I can see it
looks correct. Thanks!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

