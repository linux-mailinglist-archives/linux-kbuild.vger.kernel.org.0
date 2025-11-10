Return-Path: <linux-kbuild+bounces-9474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2EC45BC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BD7A1890AC3
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC4E301474;
	Mon, 10 Nov 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxY8BrV5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA5156F20;
	Mon, 10 Nov 2025 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768272; cv=none; b=cfU55bFOPk3ksvYTIR+WUv3z4VJbsmCJ9wudHRTCe6brzjTjuUxhV3BaAbO3tVICYuWjDQ10KCrPk3pn34OncNEszOiSyq9ATawJq2laifsyDp7XlVolE03gh/r0Z0iUW89Vdrm6E9iDbEiyvikRb+S1Q8bDPClHHzCp/AUiCSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768272; c=relaxed/simple;
	bh=ykCsmsGsnzYd8RNvXUOeEkyW+mZuEjPUIsKX+aJJ+0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcuJPwwwuKYJhDFgAVOMVmYPgR6t4nGHDiRkwlWj3L6fD85wfFeP30iWpa4Z6m4B2d99ukObmmuHqz+tvmpnwVtSW4r3xhhhCsyxsv7vG6hyTuwxD4Tt9Kmx+u1zwm8vzvPtweYRcqTrx8Ud6sPiWTFCvNBAEpgVbMD4XH4J0lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxY8BrV5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630D4C116D0;
	Mon, 10 Nov 2025 09:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768272;
	bh=ykCsmsGsnzYd8RNvXUOeEkyW+mZuEjPUIsKX+aJJ+0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pxY8BrV5GdprhB3JhLKuLkarF42aWdeRi9Pm242+b+OQodthUC3HlGFfWBbrPlw3T
	 RR5ddQdIsYYc2oP4GjAd/ghzHDBoZhtNFfJm8MXA5sntOKM+apGZfFWlzmf1nyC/dD
	 IkBt7rAmM71hXEVafMIA4efzfNSLec+5G3948ahxy9re/4ohROItrPwXJvXxDYQsyg
	 E7ywQJDa12BKFcL0swJsvdNYijuZTy4eE+4cJcRqsPjyatuN9LUd32uaYqlfqfLcrx
	 +Bf0+fLR0yhnnv5Bjck/12mbw0rb8gZu8Yzuy5FDF46goAtLD5nn/jsdM7gzi/b7C8
	 pPLhz+pGfw0OA==
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
	patches@lists.linux.dev
Subject: [PATCH 03/18] rust: kbuild: simplify `--cfg` handling
Date: Mon, 10 Nov 2025 10:50:08 +0100
Message-ID: <20251110095025.1475896-4-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to handle `cfg`s in both `rustc` and `rust-analyzer`, and in
future commits some of those contain double quotes, which complicates
things further.

Thus, instead of removing the `--cfg ` part in the rust-analyzer
generation script, have the `*-cfgs` variables contain just the actual
`cfg`, and use that to generate the actual flags in `*-flags`.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile                     | 6 ++++--
 scripts/generate_rust_analyzer.py | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index a001aae0da9d..7efed88d032c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -60,8 +60,10 @@ rustdoc_test_quiet=--test-args -q
 rustdoc_test_kernel_quiet=>/dev/null
 endif
 
+cfgs-to-flags = $(patsubst %,--cfg='%',$1)
+
 core-cfgs := \
-    --cfg no_fp_fmt_parse
+    no_fp_fmt_parse
 
 core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
@@ -72,7 +74,7 @@ core-skip_flags := \
 
 core-flags := \
     --edition=$(core-edition) \
-    $(core-cfgs)
+    $(call cfgs-to-flags,$(core-cfgs))
 
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index fc27f0cca752..dedca470adc1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -15,7 +15,7 @@ def args_crates_cfgs(cfgs):
     crates_cfgs = {}
     for cfg in cfgs:
         crate, vals = cfg.split("=", 1)
-        crates_cfgs[crate] = vals.replace("--cfg", "").split()
+        crates_cfgs[crate] = vals.split()
 
     return crates_cfgs
 
-- 
2.51.2


