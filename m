Return-Path: <linux-kbuild+bounces-5395-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F14CA03DC3
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jan 2025 12:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAE9F1618BA
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jan 2025 11:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22EC91E9B33;
	Tue,  7 Jan 2025 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owHFS/n6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66581E9B0A;
	Tue,  7 Jan 2025 11:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249530; cv=none; b=ReI72ERie1gwLFyowa0XfVVWLwGtmJv8BuNDdBmyaXrmcGK1ymbb/dCwSDWJ5o0E4Ft01xng8+9y0hVQ0gbYBsvIcTxgsqXq2Eu/sKQ7cTTzSNc/EGrXA68rZwdckDoY3mq7nMOAfswx6k00ReH5W6r8JTwbvYryKeIOmziMgtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249530; c=relaxed/simple;
	bh=phn3hwLXnNphs7vvlhjVmpFho6Dc/2pwkrPxE1EmRDQ=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=SvGbozqq0Ly93+lTLYmoUHzydwpTf6g2G6oU6OizuIRE6kMwUN3F5A7gM6UaYQaC74EA2kxzx3KWkUnLt7czwLU1x2l1/aUIPV0NEQdEhIlvERKNjyf7p/EixzCwJKQSsfASp+fYOGFsyJWtkLioHbEPx/yLXwXi1bJlsllaTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owHFS/n6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2136AC4CED6;
	Tue,  7 Jan 2025 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736249529;
	bh=phn3hwLXnNphs7vvlhjVmpFho6Dc/2pwkrPxE1EmRDQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=owHFS/n6PeQp48GHDuuV3BdrmJnB1h9pACV5ka2DTlgaTWJs8lHDzmIfKi1EoCegp
	 +owCgOp4ucRTyv5YOylTU3pLPHMVBniJj2YxdlUIlLD9t+9pG5c6GN3quyGpvrRGng
	 YjfQilR51YZ1gs0UDephTo17w7HCw1mHdpK4fj8Nn20WH+1n6GDZSOfkbk02o9xz7I
	 DGNUewwA143ZBFarKwXmepGK7SoeAWmsNybztCzp0YSMmCrfELaAUA7cbucpnbdGVq
	 qZi0Sx1SmIuz5es2Rh+dbR0gk+otWSrAA4+7ZZa+D+2aFug7wcurVwDnJ15VUmOT/s
	 Jx//h8pvNWOVg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  =?us-ascii?Q?=3D=3Futf-8=3FQ=3FBj=3DC3=3DB6rn=3F=3D?= Roy
 Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nick Desaulniers" <ndesaulniers@google.com>,  "Bill Wendling"
 <morbo@google.com>,  "Justin Stitt" <justinstitt@google.com>,  "Masahiro
 Yamada" <masahiroy@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,
  "Andrew Morton" <akpm@linux-foundation.org>,  "Dirk Behme"
 <dirk.behme@de.bosch.com>,  "Tamir Duberstein" <tamird@gmail.com>,
  "Christian Brauner" <brauner@kernel.org>,  "Martin Rodriguez Reboredo"
 <yakoyoku@gmail.com>,  "Paul Moore" <paul@paul-moore.com>,  "Wedson
 Almeida Filho" <wedsonaf@gmail.com>,  "Steven Rostedt (Google)"
 <rostedt@goodmis.org>,  "Matt Gilbride" <mattgilbride@google.com>,
  "Danilo Krummrich" <dakr@kernel.org>,  "Eder Zulian"
 <ezulian@redhat.com>,  "Filipe Xavier" <felipe_life@live.com>,
  <rust-for-linux@vger.kernel.org>,  <llvm@lists.linux.dev>,  "Kees Cook"
 <kees@kernel.org>,  "Daniel Xu" <dxu@dxuuu.xyz>,
  <linux-kbuild@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] kbuild: rust: provide an option to inline C
 helpers into Rust
In-Reply-To: <20250105194054.545201-3-gary@garyguo.net> (Gary Guo's message of
	"Sun, 05 Jan 2025 19:40:05 +0000")
Message-ID: <87msg26fxt.fsf@kernel.org>
References: <20250105194054.545201-1-gary@garyguo.net>
	<iBq_cLfbfAlkVpp_rSu0KOou6nPf2GahTQAxQVWuACzz5zggxHp-_AEzLnEl-ZnFZHLEVCudIZJNic7xI5G2mg==@protonmail.internalid>
	<20250105194054.545201-3-gary@garyguo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 07 Jan 2025 12:31:32 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> A new Kconfig option, `RUST_INLINE_HELPERS` is added to allow C helpers
> (which was created to allow Rust to call into inline/macro C functions
> without having to re-implement the logic in Rust) to be inlined into
> Rust crates without performing a global LTO.
>
> If the option is enabled, the following is performed:
> * For helpers, instead of compiling them to object file to be linked
>   into vmlinux, we compile them to LLVM IR.
> * The LLVM IR is patched to add `linkonce_odr` linkage. This linkage
>   means that the function is inlineable (effect of `_odr`), and the
>   symbols generated will have weak linkage if emitted into object file
>   (important since as later described, we might have multiple copies of
>   the same symbol) and it will may be discarded if it is not invoked or
>   all invocations are inlined.
> * The LLVM IR is compiled to bitcode (This is step is not necessary, but
>   is a performance optimisation to prevent LLVM from always have to
>   reparse the same IR).
> * When a Rust crate is compiled, instead of generating object file, we
>   ask LLVM bitcode to be generated.
> * llvm-link is invoked to combine the helper bitcode with the crate
>   bitcode. This step is similar to LTO, but this is much faster since it
>   only needs to inline the helpers.
> * clang is invoked to turn the combined bitcode into object file.
>
> Some caveats with the option:
> * clang and Rust doesn't have the exact target string. Manual inspection
>   shows that they should be compatible, but since they are not exactly
>   the same LLVM seems to prefer not inlining them. This is bypassed with
>   `--ignore-tti-inline-compatible`.
> * LLVM doesn't want to inline functions combined with
>   `-fno-delete-null-pointer-checks` with code compiled without. So we
>   remove this command when compiling helpers. I think this should be
>   okay since this is one of the hardening features and we shouldn't have
>   null pointer dereferences in these helpers.
>
> The checks can also be bypassed with force inlining (`__always_inline`)
> but the behaviour is the same with extra options.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Tested-by: Andreas Hindborg <a.hindborg@kernel.org>

Tested with downstream rnull tree, works as expected.

Best regards,
Andreas Hindborg



