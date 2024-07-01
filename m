Return-Path: <linux-kbuild+bounces-2296-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A391E7CC
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 20:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E900F1C2142E
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 18:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2C916F8E9;
	Mon,  1 Jul 2024 18:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev3LeNfS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F79E172762;
	Mon,  1 Jul 2024 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859055; cv=none; b=XCop/B2Fbl7cr3CVsLyg0/pQ4vIAnqRw7aFrUM9M9JB8dPeTEu5wwXBz1Hh4+O2kBvRJ2O2h0ZgpuqYpRpNCCV1BWdiZpAhN5oohjuzv9Qzbck/2qv8i6iT9hzV68i+oKi7TN1mgAIePLOVTiZc+xZcaETBosEbM+msbVQsFSn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859055; c=relaxed/simple;
	bh=i7Bpv+VkURk8Dn67Vw4shxE1NjlQlY/Yr/USg4ZFdIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGC5VOcbszzPH4zC8Go33v2PHDirjHe2EojrwkWObHCwY7ltmV8/KO4J0CSLF4aExfA8DdLy56seqHUhrRaMwu9rA/ZwEK1/9g4TornaRQFG7+RtY0op/AmpHMGN5UghMdaUbW4atBAvt3CI8F/hdXl9sIwmF5i2eODZYuRd9G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev3LeNfS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBD8C4AF0A;
	Mon,  1 Jul 2024 18:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719859054;
	bh=i7Bpv+VkURk8Dn67Vw4shxE1NjlQlY/Yr/USg4ZFdIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ev3LeNfSuNuWP66VnIObsN5piFJIp+D9E1BVdCRjKtmgAUSmWejmivQVa6syEA/6b
	 4HdnTuQa9hVxh+jwAInPsBA/EH0jwdwRKYR/Yz2mQv5FD1n5TazevfxgGyky5dyIFz
	 sw5MDEPXrHPjcKiuTV7F7C5bvFT53QdPRrlcZi7v3S+Cahv30HiSccvs2JQyrCysuw
	 4/3kzN5l/sAhi87uEq9GX23J/86zIRgcnKQr9EkDY2ImtD6DIQfiy86+KnY0V8Lv8A
	 Lwedkso4XTmSMhzNxXJQrVRve2+FtUH5y5NMIwEYcNFKE+8AuOYqqhKk9ykF3H+WUn
	 CFnA6ZC+BFfsg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 11/13] kbuild: rust: add `rustc-version` support
Date: Mon,  1 Jul 2024 20:36:21 +0200
Message-ID: <20240701183625.665574-12-ojeda@kernel.org>
In-Reply-To: <20240701183625.665574-1-ojeda@kernel.org>
References: <20240701183625.665574-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we are starting to support several Rust versions, introduce
`rustc-version` support, mimicking the C side:

  - `scripts/rustc-version.sh`, that mimics the other version scripts
     (with one more digit, e.g. Rust 1.79.0 is 107900).

  - `rustc-{info,name,version}` Kbuild macros.

  - `CONFIG_RUSTC_VERSION` Kconfig symbol that calls `rustc-version`.

  - `rustc-min-version` Kbuild macro that uses `CONFIG_RUSTC_VERSION`.

With these, we can easily support flags conditionally depending on
`rustc`'s version -- a user comes in the next patch.

Another user will be the `-Ctarget-feature=+reserve-x18`/`-Zfixed-x18`
arm64 flags [1].

Link: https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig              |  6 +++++
 scripts/Kconfig.include   |  6 +++++
 scripts/Makefile.compiler |  4 +++
 scripts/rustc-version.sh  | 52 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100755 scripts/rustc-version.sh

diff --git a/init/Kconfig b/init/Kconfig
index 94e20d3b99d4..7d344f248785 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1920,6 +1920,12 @@ config RUST
 
 	  If unsure, say N.
 
+config RUSTC_VERSION
+	int
+	depends on RUST
+	default $(rustc-version)
+	default 0
+
 config RUSTC_VERSION_TEXT
 	string
 	depends on RUST
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3ee8ecfb8c04..82ab889725db 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -45,6 +45,12 @@ $(error-if,$(success,test -z "$(cc-info)"),Sorry$(comma) this C compiler is not
 cc-name := $(shell,set -- $(cc-info) && echo $1)
 cc-version := $(shell,set -- $(cc-info) && echo $2)
 
+# Get the Rust compiler name, version, and error out if it is not supported.
+rustc-info := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+$(error-if,$(success,test -z "$(rustc-info)"),Sorry$(comma) this Rust compiler is not supported.)
+rustc-name := $(shell,set -- $(rustc-info) && echo $1)
+rustc-version := $(shell,set -- $(rustc-info) && echo $2)
+
 # Get the assembler name, version, and error out if it is not supported.
 as-info := $(shell,$(srctree)/scripts/as-version.sh $(CC) $(CLANG_FLAGS))
 $(error-if,$(success,test -z "$(as-info)"),Sorry$(comma) this assembler is not supported.)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 92be0c9a13ee..17eaa085b59c 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -69,6 +69,10 @@ gcc-min-version = $(call test-ge, $(CONFIG_GCC_VERSION), $1)
 # Usage: cflags-$(call clang-min-version, 110000) += -foo
 clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 
+# rustc-min-version
+# Usage: rustflags-$(call rustc-min-version, 107900) += -foo
+rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
+
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
new file mode 100755
index 000000000000..4e658fd55ae6
--- /dev/null
+++ b/scripts/rustc-version.sh
@@ -0,0 +1,52 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Print the Rust compiler name and its version in a 5 or 6-digit form.
+# Also, perform the minimum version check.
+
+set -e
+
+# Convert the version string x.y.z to a canonical up-to-7-digits form.
+#
+# Note that this function uses one more digit (compared to other
+# instances in other version scripts) to give a bit more space to
+# `rustc` since it will reach 1.100.0 in late 2026.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+	echo $((100000 * $1 + 100 * $2 + $3))
+}
+
+orig_args="$@"
+
+set -- $("$@" --version)
+
+name=$1
+
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
+case "$name" in
+rustc)
+	version=$2
+	min_version=$($min_tool_version rustc)
+	;;
+*)
+	echo "$orig_args: unknown Rust compiler" >&2
+	exit 1
+	;;
+esac
+
+rustcversion=$(get_canonical_version $version)
+min_rustcversion=$(get_canonical_version $min_version)
+
+if [ "$rustcversion" -lt "$min_rustcversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** Rust compiler is too old."
+	echo >&2 "***   Your $name version:    $version"
+	echo >&2 "***   Minimum $name version: $min_version"
+	echo >&2 "***"
+	exit 1
+fi
+
+echo $name $rustcversion
-- 
2.45.2


