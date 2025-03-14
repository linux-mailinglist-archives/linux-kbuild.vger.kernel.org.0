Return-Path: <linux-kbuild+bounces-6145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63508A61E2C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 22:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ADC9883E8E
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Mar 2025 21:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9131A317D;
	Fri, 14 Mar 2025 21:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="reyiEnln"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB2F1DFED;
	Fri, 14 Mar 2025 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741988046; cv=none; b=dM3MQTAO/Zjqfxam2dhAiMtfK97H46kakri09CA3jnFF32C8HNWdUGZn1wYLhWkRdazVVBoNOHX17x609v2EEcDwJJlRsAdN0KMJNOYJ64dp0OCnKdpg9CA35s30SBUJUATdG5sMkb3XSr+bGVFp0QzeLNInNihKAZI90hK8EvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741988046; c=relaxed/simple;
	bh=yZIuloNXhuF5Z8BfZA1mYt0ELvR7GzpoA/U2KGPfEG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ORidebA/y4uAibrF2+g2ABcgf2fDAWmlS13SeZMrFPIikTe7ym7+TB370WfOI6A18LE/ACPVK9x/POP4SaRA5+H8fS6ppUU3fqr/od1kofkVVek5ZqXqHv3iQ2BQrJ9s2xeUZrDEPKeUGi73A6I/ZbODNiM7hmzOcc0Xw//wUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=reyiEnln; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52649C4CEE3;
	Fri, 14 Mar 2025 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741988045;
	bh=yZIuloNXhuF5Z8BfZA1mYt0ELvR7GzpoA/U2KGPfEG4=;
	h=From:To:Cc:Subject:Date:From;
	b=reyiEnlndX4MH+SxzFQI5HynnCqCV/TbbnGqI+cipORUKHkt4djDi32ZPQGv4TD6C
	 1EI1hBg2jm7w7UbtuuU54dAynixRlzk7OcRXWGohlRFjaqnzm8Kb1m7h3TESeuhXDJ
	 DdKid1+AUVAFlmqcyxk/qbW98KQsjh26WgnIWV8Yjjbo2AjuZmsMfUGEWMEjcE7qQG
	 RF/IXF7v/ken/ZC/o6sHk4ynJ8q5sj8dexqe5WD9ssawvWsc8UCkQ95i+kHgLc+sc8
	 gSWwxCPjIuI7+pG8z0fmNDbQVjM5o6dfbGOijMppStvyJxR+Z1m0biTpopmmISAJbp
	 UHXv9CVRZbnoQ==
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
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH] rust: kbuild: skip `--remap-path-prefix` for `rustdoc`
Date: Fri, 14 Mar 2025 22:33:33 +0100
Message-ID: <20250314213333.2230670-1-ojeda@kernel.org>
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

Fixes: 6b5747d07138 ("kbuild, rust: use -fremap-path-prefix to make paths relative")
Link: https://github.com/rust-lang/rust/issues/138520 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index ea3849eb78f6..6586a7aa007e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -57,10 +57,14 @@ endif
 core-cfgs = \
     --cfg no_fp_fmt_parse
 
+# `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
+# since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
+# 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaround both
+# issues skipping the flag.
 quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTDOC) $(filter-out $(skip_flags),$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
+	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
 		$(rustc_target_flags) -L$(objtree)/$(obj) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \

base-commit: bc5431693696b3f928b0b7acf8d7a120127db7a4
-- 
2.49.0


