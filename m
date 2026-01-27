Return-Path: <linux-kbuild+bounces-10900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDCPEtL0eGnYuAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10900-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 18:24:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD498658
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 18:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92D54301F9A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 17:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325222E5B32;
	Tue, 27 Jan 2026 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivRaQmZX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3DB139D;
	Tue, 27 Jan 2026 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534635; cv=none; b=ARc46MIhKDwf3lrAljligHaBQiLl4pkCgCeeteA9CYOnRcCywU4f42VZaPdNeW9H1IZNY8FejE+8VHmhoEdgcnQV8ZfjDXC5SGZ7Oc47/c3X8+uiIdi4z8jSdMq6KEq3ZXCDXXwVCGMoIKk89Dx/xoUmBMsUm/IXRp/GOPwwUIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534635; c=relaxed/simple;
	bh=cqsMlLRy7zqvwAUpkBcAkydIJEH/fkzTF6In+Tnnr+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dx7yV7AkpErh77tj+0HKLfgvq9ZSSuDZJBXF5xldpUKFAPi2d1yicrJF9p10fjc1DNDaAH1J0Mp3GQjzVIQr5eB1zGshHUxQzP9c+m3EJBaxZO5OecFf+0eWES363cUeWFg+QzDYXlSkYRZKZFc2xK9+8pYVjwXuNtEXxS/jV4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivRaQmZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3640DC2BC86;
	Tue, 27 Jan 2026 17:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769534634;
	bh=cqsMlLRy7zqvwAUpkBcAkydIJEH/fkzTF6In+Tnnr+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ivRaQmZX82EPMz2+D1X20DAFSJRE243h4Vnw1lznquXS7qhXklJYb5LKV1GCSZ5Rz
	 3+Oavu6+l9Do96XCQu04LITuL8B7bSYAjeiLnHtLlnJIxQdFPtDPNQpQncihMT8spK
	 +VGF5apn0DRh0PzRrc5x6fydUCjXv0MvoQOmrmaZ5G8haeCYiIAnJ3tyuKQRDz2Yvi
	 M/dFtqxY0XttZ3OeW/1tCK7v0yEWlwygbUOYz5Zf55QbeSWyt+LI7YfIvZSBB5wb3+
	 QrrsebEGCFmX5ejVw3ajSUKXHQ5c8bleyrRvEYN321eV0jdr82CAYJ6afxsSL5F0sx
	 uM9xvjZe6BEiQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Antonio Hickey <contact@antoniohickey.com>,
	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: rust-for-linux@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jean Delvare <jdelvare@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 1/2] kbuild: rust: register "klint" as a tool
Date: Tue, 27 Jan 2026 17:11:03 +0000
Message-ID: <20260127172330.1492107-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260127172330.1492107-1-gary@kernel.org>
References: <20260127172330.1492107-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,antoniohickey.com,nokia.com];
	TAGGED_FROM(0.00)[bounces-10900-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AABD498658
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

Register "klint" as a tool so that rustc understands that `#[klint::attr]`
is a tool attribute and `klint::lint` is a tool lint.

This makes use of the `register_tool` feature which has been implemented as
a nightly feature for long time and has an active RFC. The feature does not
change any functionality, simply make it possible for Rust to recognize
extra tools in addition to the built-in hardcoded ones (clippy & rustdoc).

Link: https://github.com/rust-lang/rfcs/pull/3808
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile          | 5 ++++-
 scripts/Makefile.build | 6 ++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 63464bd2c1e9..db3dd17f780b 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -320,7 +320,9 @@ quiet_cmd_rustdoc_test_kernel = RUSTDOC TK $<
 	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) --test $(filter-out --remap-path-prefix=%,$(rust_flags)) \
-		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
+		-L$(objtree)/$(obj) \
+		-Zcrate-attr='feature(register_tool)' -Zcrate-attr='register_tool(klint)' \
+		--extern ffi --extern pin_init \
 		--extern kernel --extern build_error --extern macros \
 		--extern bindings --extern uapi \
 		--no-run --crate-name kernel -Zunstable-options \
@@ -562,6 +564,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_flags) \
 		--emit=dep-info=$(depfile) --emit=obj=$@ \
+		-Zcrate-attr='feature(register_tool)' -Zcrate-attr='register_tool(klint)' \
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0c838c467c76..d951d553c82f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -312,12 +312,13 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #   - Stable since Rust 1.82.0: `feature(asm_const)`,
 #     `feature(offset_of_nested)`, `feature(raw_ref_op)`.
 #   - Stable since Rust 1.87.0: `feature(asm_goto)`.
-#   - Expected to become stable: `feature(arbitrary_self_types)`.
+#   - Expected to become stable: `feature(arbitrary_self_types)`,
+#     `feature(register_tool)`.
 #   - To be determined: `feature(used_with_arg)`.
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,register_tool,used_with_arg
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
@@ -328,6 +329,7 @@ rust_common_cmd = \
 	-Zallow-features=$(rust_allowed_features) \
 	-Zcrate-attr=no_std \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
+	-Zcrate-attr='register_tool(klint)' \
 	-Zunstable-options --extern pin_init --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--crate-name $(basename $(notdir $@)) \
-- 
2.51.2


