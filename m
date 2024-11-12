Return-Path: <linux-kbuild+bounces-4660-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F659C60B5
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 19:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC882815F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 18:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFAE21764C;
	Tue, 12 Nov 2024 18:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqfOgf+d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9048217476;
	Tue, 12 Nov 2024 18:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731437131; cv=none; b=MpzWE6epy5aA+QmZbaW4v2gAxbXqYVb0VGW6m1clk98bHboncSw9bgX7JeFudXnpggKP7bVw3VXbagxNfKjzvGYXOa9yMvLIXBWdteZgLw89amw/71Q9tftHKrJb93H2Ce7zIeNHdnju94E/pkcDPlvAGKPD45cNoyppO0HJUcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731437131; c=relaxed/simple;
	bh=wCXJF4/5quDEP4F6qG1v7jSbleUiRWK2iEYLSUjTZPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlsXxx5MGGuHOe/cW06saf3qXQnTpzzQ79l+xlKonsrIPyHblYWhCh3fOzKap8/bXwJFCMY8N4OofXq0ukzGi+0TYACM530p60/qHaVXz2BZDYSDyFyHsmAlcaQFWCTm/fxA7x45JC1HAnSEAU4n0m1WUEF2TimJVUJGPTweRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqfOgf+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9E7C4CECD;
	Tue, 12 Nov 2024 18:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731437130;
	bh=wCXJF4/5quDEP4F6qG1v7jSbleUiRWK2iEYLSUjTZPQ=;
	h=From:To:Cc:Subject:Date:From;
	b=jqfOgf+dYhrkzneeZkWksvX30rmB1BmKC2+jNVBNOZHz3sDYVd1lbsk1WwjI0eUR0
	 rKjq0bzNBJkPMQvjvKFY/cRI+GzPIeyF226omTKNgTnF5TVh6NHQJvvs1rAvfiTtYR
	 cB/REsuUsWKUAAvFk+CUj+ZN89VeG+cdxPmNOtljdAkHcfBW7qoQt6KQqgz6aWQ7/f
	 Epi9h3b8xOMoRMbMCpaTSu7R4RdZcCO8FBtMqBcH2eMh6nC3X2ZbFskWSrbfrjLBBU
	 BoPH7b7YByjbp+JtHLIikSlg0a7b0ooLzte/iv2E7rVU2yHbQmtTPgm5BiTfVs9API
	 l3xCxrjpP+6vA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	HONG Yifan <elsk@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
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
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v3] kbuild: rust: add PROCMACROLDFLAGS
Date: Tue, 12 Nov 2024 19:44:55 +0100
Message-ID: <20241112184455.855133-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HONG Yifan <elsk@google.com>

These are flags to be passed when linking proc macros for the Rust
toolchain. If unset, it defaults to $(KBUILD_HOSTLDFLAGS).

This is needed because the list of flags to link hostprogs is not
necessarily the same as the list of flags used to link libmacros.so.
When we build proc macros, we need the latter, not the former (e.g. when
using a Rust compiler binary linked to a different C library than host
programs).

To distinguish between the two, introduce this new variable to stand
out from KBUILD_HOSTLDFLAGS used to link other host progs.

Signed-off-by: HONG Yifan <elsk@google.com>
Link: https://lore.kernel.org/r/20241017210430.2401398-2-elsk@google.com
[ v3:

  - `export`ed the variable. Otherwise it would not be visible in
    `rust/Makefile`.

  - Removed "additional" from the documentation and commit message,
    since this actually replaces the other flags, unlike other cases.

  - Added example of use case to documentation and commit message.
    Thanks Alice for the details on what Google needs!

  - Instead of `HOSTLDFLAGS`, used `KBUILD_HOSTLDFLAGS` as the fallback
    to preserve the previous behavior as much as possible, as discussed
    with Alice/Yifan. Thus moved the variable down too (currently we
    do not modify `KBUILD_HOSTLDFLAGS` elsewhere) and avoided
    mentioning `HOSTLDFLAGS` directly in the documentation.

  - Fixed documentation header formatting.

  - Reworded slightly.

         - Miguel ]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Masahiro: if Kbuild wants to pick this up, that is great. Otherwise, I am happy
picking this up early next cycle, if you give an `Acked-by` since this is
changing the interface for Kbuild users given we are introducing a new
environment variable. Thanks!

Note that the `or` means if the string is empty, we will use the default rather
than nothing. I didn't change that from Yifan's version, but maybe we want to do
otherwise. Users can still provide e.g. an empty space to avoid any flag.

Yifan/Alice: please double-check the changes. Thanks!

v3: see changes above.
v2: https://lore.kernel.org/rust-for-linux/20241017210430.2401398-2-elsk@google.com/
v1: https://lore.kernel.org/rust-for-linux/20241017200138.2390077-2-elsk@google.com/

 Documentation/kbuild/kbuild.rst | 11 +++++++++++
 Makefile                        |  3 ++-
 rust/Makefile                   |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 1796b3eba37b..9cb876ccc363 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -91,6 +91,17 @@ HOSTRUSTFLAGS
 -------------
 Additional flags to be passed to $(HOSTRUSTC) when building host programs.

+PROCMACROLDFLAGS
+----------------
+Flags to be passed when linking Rust proc macros. Since proc macros are loaded
+by rustc at build time, they must be linked in a way that is compatible with
+the rustc toolchain being used.
+
+For instance, it can be useful when rustc uses a different C library than
+the one the user wants to use for host programs.
+
+If unset, it defaults to the flags passed when linking host programs.
+
 HOSTLDFLAGS
 -----------
 Additional flags to be passed when linking host programs.
diff --git a/Makefile b/Makefile
index a9e723cb0596..3efb001bada5 100644
--- a/Makefile
+++ b/Makefile
@@ -471,6 +471,7 @@ KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
 			-Zallow-features= $(HOSTRUSTFLAGS)
 KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
+KBUILD_PROCMACROLDFLAGS := $(or $(PROCMACROLDFLAGS),$(KBUILD_HOSTLDFLAGS))

 # Make variables (CC, etc...)
 CPP		= $(CC) -E
@@ -595,7 +596,7 @@ export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
-export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
+export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS KBUILD_PROCMACROLDFLAGS LDFLAGS_MODULE
 export KBUILD_USERCFLAGS KBUILD_USERLDFLAGS

 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
diff --git a/rust/Makefile b/rust/Makefile
index f349e7b067ea..9f55c470aa2c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -344,7 +344,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
-		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
+		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<

base-commit: d072acda4862f095ec9056979b654cc06a22cc68
--
2.47.0

