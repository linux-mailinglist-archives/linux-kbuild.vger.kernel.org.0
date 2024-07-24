Return-Path: <linux-kbuild+bounces-2644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9893B4B1
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 18:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AF9B282B3F
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jul 2024 16:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C697715CD79;
	Wed, 24 Jul 2024 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlVLHRe5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C1B158DA7;
	Wed, 24 Jul 2024 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721837716; cv=none; b=Y+mLajvMGTJen2QSmtNHhe+Ij/w0H0jAeV1XMdf0gprF7y4cxLPeIUIFTQUicOcLX+iLiQ5RFlJF3V2YUocgxuKIfhI3tEk7OcG/dfZVhv4Ch8ihKowIe+quCXgth1K9N76to1vqvz70jv5oQnqtDE0nLcAJWhYZjCg62ITqLac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721837716; c=relaxed/simple;
	bh=8M3qjziEkK6RAO+75p2nb4kN9+Ujgr+tBOEusNCKTV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H3HN3dnXJa3acHfdUPMFrFYtk5bwEwcaVLnfS0aAoYpnUcQRxP3/d1ZtiEx1m7ykyTxDqkn2JeAugFxI/bd4OPPyjCS9Nonq/8/Mjw0b9NTvcAacXiRpbVZvHkKw7+sKdK8OYjzS/pTwdZSDHiwfT4Xc1TzaLMaacNbR0toHyso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlVLHRe5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7041AC32781;
	Wed, 24 Jul 2024 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721837716;
	bh=8M3qjziEkK6RAO+75p2nb4kN9+Ujgr+tBOEusNCKTV8=;
	h=From:To:Cc:Subject:Date:From;
	b=FlVLHRe59YHkx4tbO6Y8QuEwXnbAXcenjTrbEw+w6A77CmxgaLm6cApR+go0XNoqd
	 zmvKg6OIjYAFqTvpm0++9kXLqjzuZlKtLdqq9q+ldXD0SIyqEC+i4sWku5ZrsAzRkD
	 HMjpTIhEoDo1tHRdNWGnkA44Y1MfH4yQmSJaYohYNGug/gjJ300aPnq1pFTrtEmy0j
	 Gcndq0rFG8u7uzbIHzw5siyh2kJFRnTLXXiAaSq/qDuy+VvYS2XxaT53RrmMsOjt1I
	 mzebKG2bXK22zaKt04+BfSScquf6seeIDOszccpTtFNrWE4agkjP9yyMDNKAqQUT2X
	 9PT1VmmwMOQgg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
Date: Wed, 24 Jul 2024 18:14:53 +0200
Message-ID: <20240724161501.1319115-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is an updated series to the CPU mitigations support for Rust. It
also has the patch to enable `objtool`, so that we can start running it
for Rust.

It would be nice to get this applied soon, so that we start being
warning-free (since we already get warnings under IBT builds via
`vmlinux.o`). I am happy to take it through the Rust tree if the x86 and
objtool maintainers give an Acked-by, or through any of the other trees,
as you prefer. Otherwise, I think at this point we would need to make
Rust exclusive to the mitigations, which isn't great.

With this series, again, x86_64 is warning-free with `objtool` enabled. I
tested `-O2`/`-Os` and the Rust versions we support under `-O2` (mainly
for the `noreturn` patch, which uses heuristics), as well as IBT vs. no
IBT (i.e.  running on individual object files vs. in `vmlinux`). I also
did an arm64 build.

Testing is very welcome for this one!

Cheers,
Miguel

v2:
  - Add patch to enable `objtool` for Rust.

  - Add patch to list `noreturn` Rust functions (via heuristics) to avoid
    warnings related to that.

  - Make the `RETHUNK` patch not an RFC since the Rust compiler has
  support for
    it now.

  - Update the names of the migitation config symbols, given the changes
  at e.g.
    commit 7b75782ffd82 ("x86/bugs: Rename CONFIG_MITIGATION_SLS =>
    CONFIG_MITIGATION_SLS").

Miguel Ojeda (6):
  rust: module: add static pointer to `{init,cleanup}_module()`
  x86/rust: support MITIGATION_RETPOLINE
  x86/rust: support MITIGATION_RETHUNK
  x86/rust: support MITIGATION_SLS
  objtool: list `noreturn` Rust functions
  objtool/kbuild/rust: enable objtool for Rust

 arch/x86/Makefile               |  7 ++++++-
 rust/Makefile                   | 22 ++++++++++++--------
 rust/macros/module.rs           | 12 +++++++++++
 scripts/Makefile.build          |  9 +++++++--
 scripts/generate_rust_target.rs | 15 ++++++++++++++
 tools/objtool/check.c           | 36 ++++++++++++++++++++++++++++++++-
 tools/objtool/noreturns.h       |  2 ++
 7 files changed, 91 insertions(+), 12 deletions(-)


base-commit: b1263411112305acf2af728728591465becb45b0
--
2.45.2

