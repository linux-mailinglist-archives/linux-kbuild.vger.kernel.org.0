Return-Path: <linux-kbuild+bounces-7179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 922EEABE385
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 21:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 052C08A68AE
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 19:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6102741B2;
	Tue, 20 May 2025 19:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ki3b9EtO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54E424C692;
	Tue, 20 May 2025 19:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768846; cv=none; b=mc4hN4BbxVlXMZx5vmA/DZV1z+pXyWzObnmgtT9PXeXyBojLhg/LCXZFJoLECgM8zMjbRSwzkUmQ1UWFFHs1IPGnpQcfc95NCVOBOZILGFqyecvYCO3dwoSKHDxWeKVuf0eUntOiL70PaA6bNpfY2m7IMQ6iiV1lyB346e4OSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768846; c=relaxed/simple;
	bh=WL+oZ2MYQpnuVlpx+GohcQq+F1xhZWw9zI0Bz3ifrss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OeNB3EvAEX/i3F/R72mtTdtAJ7YiFz5Si1f9oMmvgWiUzyN/UAGYFZRt2CWhs0EK1Wsl2w3c2ZeGYl4HVrzdHDcXGDWMhjDKIFywqMQcvb+/kwNNmtl22Kr7Cr8sT0JzudIaAo07nWBI8jOUaWABs2DClyYDiDJnWEM340g+tP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ki3b9EtO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9674C4CEE9;
	Tue, 20 May 2025 19:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747768846;
	bh=WL+oZ2MYQpnuVlpx+GohcQq+F1xhZWw9zI0Bz3ifrss=;
	h=From:To:Cc:Subject:Date:From;
	b=Ki3b9EtO356CV2lvoGptrYkmyv1YUM6PUNwvQk1U8gfzwobfXVrSNDvAM2ZjSlgdY
	 jfzBKouPVA0tntG14HPwl4QhVIsG1vCv40iM8rPMxkWzD8x7ldddiNSdrw3zYCNtAb
	 EBz31sRg25d1HO6NI1kPSnN6AGxyD+B5DBhNm3PvaAUY2mdPYNAQCynd0zwlN9LbFw
	 qb0Hz4peSUVJjfiIeFqGQ+DbuHg7L5GiXqtQwx/oXSvqVD4WMFGYRbzvNwGKZCiODG
	 iKGeYUzz9B2kMl03rygLWEgipoFRRKCDyOvZMIe61BOSRTKq0fmrPFUKR6njaQ0r7Y
	 PIZQAs9BDlMFg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
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
	stable@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH] rust: kbuild: rebuild if `.clippy.toml` changes
Date: Tue, 20 May 2025 21:20:34 +0200
Message-ID: <20250520192034.889415-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We rarely modify `.clippy.toml`, but currently we do not rebuild if that
happens, thus it is easy to miss possible changes in lints.

Thus rebuild in case of changes.

Cc: stable@vger.kernel.org
Reported-by: Tamir Duberstein <tamird@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1151
Fixes: 7d56786edcbd ("rust: introduce `.clippy.toml`")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..0dcc9ba0d225 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -405,11 +405,12 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(srctree)/.clippy.toml FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
-$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs FORCE
+$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
+    $(srctree)/.clippy.toml FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
@@ -495,7 +496,8 @@ endif
 
 $(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
-$(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
+$(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o \
+    $(srctree)/.clippy.toml FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/pin_init.o: private skip_gendwarfksyms = 1

base-commit: 22c3335c5dcd33063fe1894676a3a6ff1008d506
-- 
2.49.0


