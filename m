Return-Path: <linux-kbuild+bounces-8209-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5077B12ECD
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 11:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53BCF3B4A01
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Jul 2025 09:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF4F1FBCAA;
	Sun, 27 Jul 2025 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkr5kBJd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787C85BAF0;
	Sun, 27 Jul 2025 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753608211; cv=none; b=JZbA8BQHfbSiMtQjzXRBlxVe5BzUvb9JKagk1k8tkz/toDTrDuiOvnu37Ay+Y8xDe7nrWw4NUcyQyTDao8AImVW5zhpIyuRMd/e2RLKga1ogVSuvOzn9m+w2y3myV42ovF6VNP3ctxkcWgMx94O0va4NXqccIAT43arVn2G92ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753608211; c=relaxed/simple;
	bh=n6hN9T/Z+2neDj8Lv66Tiym0tHWZpRrvvyIE6tdVN/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SSQ3pkOOkeNbwnyr3TeT+5NW4e2FB83d46/u52a+4OneWgPluH1K7mUpUcdWSFXTHC7kGSye6haGy0alsde9j98gcgo8ITp331HJUOUjQd/SIxHxrQ4x/U3k2ZQKAjB14u+54UTwCSETpCyqOb5+OKCr3FY3Acl27gFLRYuitsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkr5kBJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173C9C4CEEB;
	Sun, 27 Jul 2025 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753608211;
	bh=n6hN9T/Z+2neDj8Lv66Tiym0tHWZpRrvvyIE6tdVN/o=;
	h=From:To:Cc:Subject:Date:From;
	b=bkr5kBJdg04KbxaI83qsRlhou3E59OyVHUGKPyTVb4roQyvx0VNmf1Op/0vL2rOY6
	 NGJeCL/HgbIOsbg9pi2ViRSU668Z7WBN8Yx5Zamprfoe4FatJsh8/9cvVLeCdoj8tS
	 Pnf/stasPgO9NGt2J+nZVUSegHe8/kcvqNcur336OlSCCHsrxwKqMXytijK8h986pC
	 osjF1nvqKA1GOdFS97S06Quk+sZWxjQxpyXKyf1JA3vWdpVhMG3UnmWHAPdbfi1gPm
	 KTfoiEqCiUVFR1irnALIHGiCr5/9zfnCx8HpLoyHLyeeSg6AtwubIUSZlb8WngmoLa
	 GKXkQ4MLjuf+w==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] rust: workaround `rustdoc` target modifiers bug
Date: Sun, 27 Jul 2025 11:23:17 +0200
Message-ID: <20250727092317.2930617-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with Rust 1.88.0 (released 2025-06-26), `rustdoc` complains
about a target modifier mismatch in configurations where `-Zfixed-x18`
is passed:

    error: mixing `-Zfixed-x18` will cause an ABI mismatch in crate `rust_out`
      |
      = help: the `-Zfixed-x18` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
      = note: unset `-Zfixed-x18` in this crate is incompatible with `-Zfixed-x18=` in dependency `core`
      = help: set `-Zfixed-x18=` in this crate or unset `-Zfixed-x18` in `core`
      = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=fixed-x18` to silence this error

The reason is that `rustdoc` was not passing the target modifiers when
configuring the session options, and thus it would report a mismatch
that did not exist as soon as a target modifier is used in a dependency.

We did not notice it in the kernel until now because `-Zfixed-x18` has
been a target modifier only since 1.88.0 (and it is the only one we use
so far).

The issue has been reported upstream [1] and a fix has been submitted
[2], including a test similar to the kernel case.

Meanwhile, conditionally pass `-Cunsafe-allow-abi-mismatch=fixed-x18`
to workaround the issue on our side.

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Closes: https://lore.kernel.org/rust-for-linux/36cdc798-524f-4910-8b77-d7b9fac08d77@oss.qualcomm.com/
Link: https://github.com/rust-lang/rust/issues/144521 [1]
Link: https://github.com/rust-lang/rust/pull/144523 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 115b63b7d1e3..f5883152fd5d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -62,6 +62,10 @@ core-cfgs = \
 
 core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
+# `rustdoc` did not save the target modifiers, thus workaround for
+# the time being (https://github.com/rust-lang/rust/issues/144521).
+rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
+
 # `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
 # since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
 # 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaround both
@@ -74,6 +78,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
+		$(rustdoc_modifiers_workaround) \
 		$(if $(rustdoc_host),,--sysroot=/dev/null) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
@@ -212,6 +217,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 		--extern bindings --extern uapi \
 		--no-run --crate-name kernel -Zunstable-options \
 		--sysroot=/dev/null \
+		$(rustdoc_modifiers_workaround) \
 		--test-builder $(objtree)/scripts/rustdoc_test_builder \
 		$< $(rustdoc_test_kernel_quiet); \
 	$(objtree)/scripts/rustdoc_test_gen

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
-- 
2.50.1


