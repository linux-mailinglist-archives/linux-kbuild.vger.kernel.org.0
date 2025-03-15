Return-Path: <linux-kbuild+bounces-6181-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FF5A63214
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 20:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3FF61895850
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 19:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69D8199935;
	Sat, 15 Mar 2025 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1qYZBlI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E1E1917E4;
	Sat, 15 Mar 2025 19:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742067659; cv=none; b=IQX9i+6KV34R9s4dD2ja81X2zNx6UOP+YPEZgkCLxk127JEWhO4Qg4s9LGBpaD0Nd/+841TCQj5FzgQwWasNes5ZAv2qw3TAgIcCg81E4kp9cYgsRd6u1pqyLgGyCa6Wqd16pH22spB5gexAabEY2HRJWrwkOlOpeXQOIaegEII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742067659; c=relaxed/simple;
	bh=laZAIbEZVXCBq3fZOiRaGSFxCaavR5HOBVJ9LIzb2q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qxKo402wI1tL+y78+2quAxmia3IoudHlxb+F57G2JOKFI/zeMVtjHuDD5rYPaby70qKXcQ09IFB0lY/3lrBXgcbY1xeNcrEHSp1wVHK5QS35m92nOeXpkaOVVAJ4trEnBUpUKvAHKxGhBtXnSW368F0lAHfg4WdkLsU40/Lo3xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1qYZBlI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3C6C4CEE5;
	Sat, 15 Mar 2025 19:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742067658;
	bh=laZAIbEZVXCBq3fZOiRaGSFxCaavR5HOBVJ9LIzb2q8=;
	h=From:To:Cc:Subject:Date:From;
	b=H1qYZBlIMNjF3EdiBtzLFp4vbmq9Uz9BMYWCJeFP6JRlMk2CcFsRtMMIkyCJjefqx
	 6J273h+GaDISyfFYvsPL5x4gF/eo690xAAnXZdbzzsnB7hF+2CfcIrlbMWhHtXVRcx
	 /mHr3OtZpKkUQyHFL1x4oxKGX3y79ibBJupH3IEawknSQTqYQlMypNT2SFkR4eXGa7
	 yFmESW+HC3EbEQfhb5fOvetiPNTQCaA3WZMm3PpC1y/we+TXKqd1xTOv9VhJMMGWoV
	 s23zE68GkQ1RwhC5YqrWtrCCKRPiUNATwcYDL8dhNq8eoXVSP5AH5ZeWjmLOMfNlmU
	 x3vo8ckKkzJPQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2] rust: kbuild: skip `--remap-path-prefix` for `rustdoc`
Date: Sat, 15 Mar 2025 20:40:45 +0100
Message-ID: <20250315194045.2353200-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`rustdoc` only recognizes `--remap-path-prefix` starting with
Rust 1.81.0, which is later than on minimum, so we cannot pass it
unconditionally. Otherwise, we get:

    error: Unrecognized option: 'remap-path-prefix'

Note that `rustc` (the compiler) does recognize the flag since a long
time ago (1.26.0).

Moreover, `rustdoc` since Rust 1.82.0 ICEs in out-of-tree builds when
using `--remap-path-prefix`. The issue has been reduced and reported
upstream [1].

Thus workaround both issues by simply skipping the flag when generating
the docs -- it is not critical there anyway.

The ICE does not reproduce under `--test`, but we still need to skip
the flag as well for `RUSTDOC TK` since it is not recognized.

Fixes: 6b5747d07138 ("kbuild, rust: use -fremap-path-prefix to make paths relative")
Link: https://github.com/rust-lang/rust/issues/138520 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
v2:
  - Skip the flag also in `RUSTDOC TK`. The ICE does not apply there,
    but we still need to skip the flag.

 rust/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index ea3849eb78f6..089473a89d46 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -57,10 +57,14 @@ endif
 core-cfgs = \
     --cfg no_fp_fmt_parse

+# `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
+# since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
+# 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaround both
+# issues skipping the flag. The former also applies to `RUSTDOC TK`.
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) $(filter-out $(skip_flags),$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
+	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 		$(rustc_target_flags) -L$(objtree)/$(obj) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
@@ -171,7 +175,7 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) --test $(rust_flags) \
+	$(RUSTDOC) --test $(filter-out --remap-path-prefix=%,$(rust_flags)) \
 		-L$(objtree)/$(obj) --extern ffi --extern kernel \
 		--extern build_error --extern macros \
 		--extern bindings --extern uapi \

base-commit: bc5431693696b3f928b0b7acf8d7a120127db7a4
--
2.49.0

