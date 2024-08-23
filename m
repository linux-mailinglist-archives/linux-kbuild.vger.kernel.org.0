Return-Path: <linux-kbuild+bounces-3168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64C95CC49
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 14:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15FF1F23393
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 12:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049F718452B;
	Fri, 23 Aug 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ls5/LtwE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D01514CE;
	Fri, 23 Aug 2024 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724415872; cv=none; b=W+J7kaA65kgwdoSVZ8cs2L358mm9232/1ZOXlWXf/iEZvhOtg+Jeosmbc2d342fTjnWDZVdQT9ooNY/KpeQSEVz9wpkNcF61YFs07qau5sWnZ/hbtS/KEHXuAUnxr9r0E/bVcMGKQyjjl58ksyAHdU3qAwozBvIpjsEi4j34Wmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724415872; c=relaxed/simple;
	bh=8a6EIa44OOJDxbLB2ztVoJlWqzWC+VF2rEZMS8UZcXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyMLFgYXbBc3wfPR/Ezz3fiBkRwfdykmgpXOezsTF+GNDUL9qhcgew8UdsbE85nSrFTunJfjS5qL6mp4UXX0OvaxeS6RtxukpZ6ZT9ZFdmE54jm+mJP7YzIaQNass/SphWCKm3JlOsdJhGe0hB7DNaTlS+NkEkaSwXBbEzL/8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ls5/LtwE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB63AC32786;
	Fri, 23 Aug 2024 12:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724415872;
	bh=8a6EIa44OOJDxbLB2ztVoJlWqzWC+VF2rEZMS8UZcXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ls5/LtwEmVBoo0uvKo9yzL/3KY62jz6z7v/qU4DLNiSpQDoWpsFNwon/L4bptD+mj
	 2g1EXECOknp85t2VSHc8kvJg8LGeBE+2XalbNl0xUgX4o2DQSlu94azseId+xfiyT+
	 ahxX9yQaK6UncPCIKSfeXOVkUYwCkRiHVzpQhow7EhPpUs4d830vi8Y28nK0jQbnkU
	 2LHiSLVg3owUTqHTT+W9aI5ZZspWUb83sufwjFb06nFChOn2lTa486lpP4YlDylyOH
	 TiBsQduJIpJz4QxIkL7YJ9srrEob3Hm77m6QQcZiJFV97qwoMvh8w3OE9Gwk/17Fwx
	 Gn8t/3V/aNgQA==
Date: Fri, 23 Aug 2024 13:24:24 +0100
From: Will Deacon <will@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
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
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v5] rust: support for shadow call stack sanitizer
Message-ID: <20240823122423.GB32110@willie-the-truck>
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
 <20240820143503.GD28338@willie-the-truck>
 <CAH5fLggN+A2RawC-cpmSUHxYm=xz=1EDpMUv5C803hj37re1qA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggN+A2RawC-cpmSUHxYm=xz=1EDpMUv5C803hj37re1qA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Aug 20, 2024 at 05:13:58PM +0200, Alice Ryhl wrote:
> On Tue, Aug 20, 2024 at 4:35 PM Will Deacon <will@kernel.org> wrote:
> > On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> > > diff --git a/init/Kconfig b/init/Kconfig
> > > index fe76c5d0a72e..d857f6f90885 100644
> > > --- a/init/Kconfig
> > > +++ b/init/Kconfig
> > > @@ -1909,7 +1909,7 @@ config RUST
> > >       depends on !MODVERSIONS
> > >       depends on !GCC_PLUGINS
> > >       depends on !RANDSTRUCT
> > > -     depends on !SHADOW_CALL_STACK
> > > +     depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
> >
> > Sorry, I didn't spot this in v4, but since UNWIND_PATCH_PAC_INTO_SCS is
> > specific to arm64 and the only other architecture selecting
> > ARCH_SUPPORTS_SHADOW_CALL_STACK is riscv, I can't help but feel it would
> > be cleaner to move this logic into the arch code selecting HAVE_RUST.
> >
> > That is, it's up to the architecture to make sure that it has whatever
> > it needs for SCS to work with Rust if it claims to support Rust.
> >
> > What do you think?
> 
> The `select RUST if ...` is going to get really complicated if we
> apply that rule in general. Having options here allows us to split
> them across several `depends on` clauses. I'm not sure it will even
> work, I had issues with cyclic Kconfig errors previously. I also don't
> think it's unreasonable for the architecture to say it supports both
> options when it really does support both; they are just mutually
> exclusive. I also think there is value in having all of the options
> that Rust doesn't work with in one place.

I'm not sure I follow why this will get really complicated. Isn't it as
straightforward as the diff below, or did I miss something?

Will

--->8

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2f8ff354ca6..2f5702cb9dac 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -231,7 +231,7 @@ config ARM64
        select HAVE_FUNCTION_ARG_ACCESS_API
        select MMU_GATHER_RCU_TABLE_FREE
        select HAVE_RSEQ
-       select HAVE_RUST if CPU_LITTLE_ENDIAN
+       select HAVE_RUST if RUSTC_SUPPORTS_ARM64
        select HAVE_STACKPROTECTOR
        select HAVE_SYSCALL_TRACEPOINTS
        select HAVE_KPROBES
@@ -265,6 +265,11 @@ config ARM64
        help
          ARM 64-bit (AArch64) Linux support.
 
+config RUSTC_SUPPORTS_ARM64
+       bool
+       depends on CPU_LITTLE_ENDIAN
+       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SC
+
 config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
        def_bool CC_IS_CLANG
        # https://github.com/ClangBuiltLinux/linux/issues/1507
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..93858dbfefc0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -172,7 +172,7 @@ config RISCV
        select HAVE_REGS_AND_STACK_ACCESS_API
        select HAVE_RETHOOK if !XIP_KERNEL
        select HAVE_RSEQ
-       select HAVE_RUST if 64BIT
+       select HAVE_RUST if 64BIT && !SHADOW_CALL_STACK
        select HAVE_SAMPLE_FTRACE_DIRECT
        select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
        select HAVE_STACKPROTECTOR
diff --git a/init/Kconfig b/init/Kconfig
index 5783a0b87517..3ada33b1d681 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1902,7 +1902,6 @@ config RUST
        depends on !MODVERSIONS
        depends on !GCC_PLUGINS
        depends on !RANDSTRUCT
-       depends on !SHADOW_CALL_STACK
        depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
        help
          Enables Rust support in the kernel.


