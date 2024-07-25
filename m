Return-Path: <linux-kbuild+bounces-2658-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3687293C863
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 20:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6539E1C21484
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 18:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5453D57E;
	Thu, 25 Jul 2024 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/BhvdJq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E11E3B79C;
	Thu, 25 Jul 2024 18:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721932502; cv=none; b=U0t8L/+r91kKEFidqmU70/YoFErKOuIW7crK5c1QJgpdzIXCFpt5DnJlIrv6OY5G2bTfBhvPp5etK8SxCLFkH6iTIhqVBO8lTRHbKlEueUwIEyWKJ1IbFqX5pRFDw19/jm2w+cBouhMlXrFgZGDuO69kYJ4jEcFUd0EzA0VHPOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721932502; c=relaxed/simple;
	bh=26T2QjUffzc0MnZFn4Miu/SCpQ+ELbRTz6C+axsjgFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZnNU7H7L2rbh1iqq/AeGf5jylhKtLxDVCrN4apc2xsWYwKYxbtMaXoQnQGy1f2uHa+mdvgncIS8woEe+ZcfQMhm1oAH0QKbBM9kyGGssn1sKkHBYj8Xx3hoOnbHcRwgNTl/j25Yh7l865vEPW8y2r785uaSaXnd2iWmOlFYqM/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/BhvdJq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2BCC116B1;
	Thu, 25 Jul 2024 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721932502;
	bh=26T2QjUffzc0MnZFn4Miu/SCpQ+ELbRTz6C+axsjgFE=;
	h=From:To:Cc:Subject:Date:From;
	b=A/BhvdJqEKf4EXKUaYF01vDx52mBO1ws2o10zdq9tKn7A9q4AlQeDGm2PjQzOt5O9
	 mb1vOLlhfxEFxrmwgUk8jN5ZhPFFBCfnAsuDl7HsskA2QPrPAZVk9csdcJefd3pTdo
	 QuTADG2PsjJXa7+uEPUpcESE/MVdznSLGJ2jQaYzUOHs0rOBOJXmPVaVHj8oV3DZC/
	 x3KS6sTbSQIpAuMB3PEGmff7YvlQ1MDY/pbzFDuJ2hfROjIej2ZS2TgdKDERqUJdc7
	 FyPKN+IKuoybKslhCc8AOzfQdTBjz8UKW0UtqmIkXtYHRlGGLvNuMJHUdzpukFbRvr
	 9H0fLeMyavDsQ==
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
Subject: [PATCH v3 0/6] Rust: support `CPU_MITIGATIONS` and enable `objtool`
Date: Thu, 25 Jul 2024 20:33:17 +0200
Message-ID: <20240725183325.122827-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is just v2 with the helper function suggested by Peter.

I dropped Benno's and Alice's Tested-bys from the modified patch, just
in case, but the logic should be equivalent.

Cheers,
Miguel

v3:
  - Added `is_rust_noreturn()` helper function (Peter).
  - Reworded a couple bits.

v2: https://lore.kernel.org/rust-for-linux/20240724161501.1319115-1-ojeda@kernel.org/
v1: https://lore.kernel.org/rust-for-linux/20231023174449.251550-1-ojeda@kernel.org/

Miguel Ojeda (6):
  rust: module: add static pointer to `{init,cleanup}_module()`
  x86/rust: support MITIGATION_RETPOLINE
  x86/rust: support MITIGATION_RETHUNK
  x86/rust: support MITIGATION_SLS
  objtool/rust: list `noreturn` Rust functions
  objtool/kbuild/rust: enable objtool for Rust

 arch/x86/Makefile               |  7 ++++-
 rust/Makefile                   | 22 +++++++++------
 rust/macros/module.rs           | 12 +++++++++
 scripts/Makefile.build          |  9 +++++--
 scripts/generate_rust_target.rs | 15 +++++++++++
 tools/objtool/check.c           | 48 ++++++++++++++++++++++++++++++++-
 tools/objtool/noreturns.h       |  2 ++
 7 files changed, 103 insertions(+), 12 deletions(-)


base-commit: b1263411112305acf2af728728591465becb45b0
--
2.45.2

