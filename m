Return-Path: <linux-kbuild+bounces-9803-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C426DC81494
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:19:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E99C44E60E4
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211C9313E0F;
	Mon, 24 Nov 2025 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vKWEzcrg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5857313522;
	Mon, 24 Nov 2025 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997545; cv=none; b=scxd3i4VHir2jJK/5fhlIeyaCSb4uqXZ4Beo++ZcagpPVU5ZkeWWNtjU86EdIP0CQGG0XwS3utdS/Eu6Bt2aR7mdSA+8P0KVlp66x+iPklulD6bIZtMFaTMOKwfGicdtO8Ru4SEnEkMxJZEE42YCmM4Df/anez3HF37FNzw/NMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997545; c=relaxed/simple;
	bh=6Y31Ep13sBVEy0VoLZvLjFfOWYJl9hv0DSol9lc30Go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWhT2NQoGYv3W/uT3YL5l3bBcZhr7sON8yc7ELHWjHimh6L6qmjgix1e2WOUAEPk2V8TpjjAtve37fUFQ3x111qcZTpdDDNU3O4z5xhz1ZCuZCKYmxn7lC84tdkBph8SEpxRH8rxBTOgjl4/4tbabiqZ+Trg17IirW9pYkuBSFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vKWEzcrg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5239C116C6;
	Mon, 24 Nov 2025 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997544;
	bh=6Y31Ep13sBVEy0VoLZvLjFfOWYJl9hv0DSol9lc30Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vKWEzcrg2SwqKC2t07VmZacO+CFm39z7vRUTOR8DuST7F6E/9zhu/kRsRky8igt8M
	 DrP0JMXXViKQRE8iLXbzUb18V0NKR7RfT1+HRSsD+RkmYYigtLww80bBpx+cr1W/j9
	 GlT8k9ipyHY6XCZwnOIfB/UnQrC3DXRtTO5Hr4qvx6mIq7CGAlbYAU2CLQhA8h/bcV
	 20UoHqf73UB1CV1QHzfn6rhUqJILq6j1G9flVyS5jHtJq3FNn3y3/LZn4tlCQYg937
	 SfmFPzdcb3W2ZUcrIIMgkhGUopKQa461aEDzgsZPt2/0HJKsyd7bgPwbPoSLcw7BZ+
	 BNZn4NOVNrDCw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 01/20] rust: kbuild: introduce `core-flags` and `core-skip_flags`
Date: Mon, 24 Nov 2025 16:18:13 +0100
Message-ID: <20251124151837.2184382-2-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the next commits we are introducing `*-{cfgs,skip_flags,flags}`
variables for other crates.

Thus do so here for `core`, which simplifies a bit the `Makefile`
(including the next commit) and makes it more consistent.

This means we stop passing `-Wrustdoc::unescaped_backticks` to `rustc`
and `-Wunreachable_pub` to `rustdoc`, i.e. we skip more, which is fine
since it shouldn't have an effect.

In addition, use `:=` for `core-cfgs` to make it consistent with the
upcoming additions.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 23c7ae905bd2..ce1853a09d3d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -60,11 +60,20 @@ rustdoc_test_quiet=--test-args -q
 rustdoc_test_kernel_quiet=>/dev/null
 endif
 
-core-cfgs = \
+core-cfgs := \
     --cfg no_fp_fmt_parse
 
 core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
+core-skip_flags := \
+    --edition=2021 \
+    -Wunreachable_pub \
+    -Wrustdoc::unescaped_backticks
+
+core-flags := \
+    --edition=$(core-edition) \
+    $(core-cfgs)
+
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
 rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
@@ -122,8 +131,8 @@ rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean FORCE
 
 # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
 # not be needed -- see https://github.com/rust-lang/rust/pull/128307.
-rustdoc-core: private skip_flags = --edition=2021 -Wrustdoc::unescaped_backticks
-rustdoc-core: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs)
+rustdoc-core: private skip_flags = $(core-skip_flags)
+rustdoc-core: private rustc_target_flags = $(core-flags)
 rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
@@ -499,9 +508,9 @@ $(obj)/helpers/helpers.o: $(src)/helpers/helpers.c $(recordmcount_source) FORCE
 $(obj)/exports.o: private skip_gendwarfksyms = 1
 
 $(obj)/core.o: private skip_clippy = 1
-$(obj)/core.o: private skip_flags = --edition=2021 -Wunreachable_pub
+$(obj)/core.o: private skip_flags = $(core-skip_flags)
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
-$(obj)/core.o: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs)
+$(obj)/core.o: private rustc_target_flags = $(core-flags)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
     $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
 	+$(call if_changed_rule,rustc_library)
-- 
2.52.0


