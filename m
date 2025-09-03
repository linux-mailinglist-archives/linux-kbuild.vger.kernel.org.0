Return-Path: <linux-kbuild+bounces-8695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51310B42979
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 21:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D1AF3B9BB7
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 19:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203B22D3756;
	Wed,  3 Sep 2025 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCeTthky"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C553A20EB;
	Wed,  3 Sep 2025 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756926528; cv=none; b=KcBObPd/3BF0xsZi0L0X27nOp9iu/q2KBLglydHviPUN6aDUXlYkcHYxXFYSLU3oiPpx/TwQAeqxPZ/n3zZ0K4eNlvPILHA1AnTaa76gqltZoMGvi66bo4/93whf+bEo6ErALKWZJCDI5o0ZzNeTBd0G8u0j8D8d1ionOMFxJJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756926528; c=relaxed/simple;
	bh=lt1X5nno3YagBYAPvaGQeyuIXD+O/kJMXvxR2+WGwvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm1rvt0XFyjjvvdpwUDqkA9RmbvdA8UocNCiPcY4PLpUH4iotEmBMkQs5ZyYt1dcinbVuyWeZHu04obOyv4LSLmgJgffW0Rxrgk4e4wIywCla2gMtMLCXVGH+4EnA3YbEYGHncmraOvbOcD61xkiMK7XQMjFKS2am/KGd2ocup8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCeTthky; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f6f434c96so148667e87.2;
        Wed, 03 Sep 2025 12:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756926524; x=1757531324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoAHxsHKD0ewEF953K31aGSSXT9m0xMjrB8ov1qgJGk=;
        b=mCeTthkyad6w7hmVZaUP4e40ZIK5XCU7Mked2hZF8bb55BJ+HgSQMVDiHwQAo4V2pm
         cUjBF/uAi/xzmtdbO0E/X8SdrF9jb0lLqvNx3a/nYloKFh0qXS0SAQo25Pzi7N9AviSN
         v/gxvQDxxjGCvjKxBruCnlwR20JGlpTRAAbPYWwuWrtKf9ZXc7BPNSIJ2zpLww7obb62
         piIecf/3WjIrRt8HU/oOd1zE6FzZiY3evde8LzEablz/67CLvyvrMTuj1VeAsAKpjocx
         71bmtVr1xYViEgR3MGFNniiGFOqOwKq7Z0b5QhPx8prXDK5V6oEIO4kDi5VsiKooOHtZ
         B17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756926524; x=1757531324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FoAHxsHKD0ewEF953K31aGSSXT9m0xMjrB8ov1qgJGk=;
        b=XC7QjjVoPmAaFxdNLXwozCH50IzL7tK3qLWW1p2SmstmtO33a54bWnlrU+Sey3A0YJ
         Z3C/bG3rkP9B+corV3/2pXn4YS6hAebH9scz2x8ooD+h1dK8c2YyYytNp4M1vOQJbnxo
         LpD+8PYbl19VuwDsvA6i2Xqbd3oheu07Td9zHxDVfzKCrlm4ap/EuEoHNVU7d95iFhUW
         ILdzBosp9F87u8METBqO0Gqqp/WLmyQtQzYmIhY3bWFf0wDARbSGHdOXTLwRRgNH8lk1
         xLPjB0XNdFH59iKFFHxnPYcd1lTDJ5YBiK64HT85SuOAcg6TGfBHtP64O8Ewf6cEkmbr
         oCkw==
X-Forwarded-Encrypted: i=1; AJvYcCWZpyKVJtk0jv7wNMpxaF14G3suclSdI/xzeU66ItvHeV8B6YzsgM7jGxnXHf7NFq69Go632lGIucqy3QWS@vger.kernel.org, AJvYcCXGKAPyMo/pSdCQ2C60/zICpgRb42H7H9FMjbujHBBin5iiqCw34v2+fNyZ3fNAl3Y75qj4bNwMJOrnk5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YztzGn2p94lrAJ8OApZl5IoYgUTDPKlBnGhcyL60hlyr/UNTy+S
	v+as1IlFip+uqTPlT9N5+Qn/pbglzHTXM8I82m9twPxDHlL2+zJWLW9p
X-Gm-Gg: ASbGncsendCsjVX2cupNkLPout/qfJ+blU562spAEE2reTBSBA7tXI0cTNPeyoRnQVz
	sIVfEUxQlhJvSIeYsE+MaVUApq5Zd/Xd8GakFy4guDZ4VnCKPE55tHX02hs40pl17lKAygE4iD4
	Cl73qIYnfyR53jVL5pzkYzZXDs9IuzI4tUFgJTnTjlO6eIRuRmjZa86Wny7G21Z7aWB7aKtJWSW
	rKvAgwPM4926U34J4k+d5gWSN11KT9vsnbauuSrtxY22EYZmQ0l6xg5JVnH7FLXUBOSXIb0TGRa
	/XMWBgfhm68tIqwvMyrZ6+Wf35GNi6vC754COuQdVQAddVmX1H38hn5zZCdiv0A8dx5Ddxepvys
	bcw6Ivyzpw5H438A=
X-Google-Smtp-Source: AGHT+IFGniFr4sXUdZW4Hd3B3FQYb7lgWC7FzZ4XugfWmKkHW/Gq3xd+KncZDUCMR1HaX/EQsrKUug==
X-Received: by 2002:a05:6512:61c8:20b0:560:8a08:910d with SMTP id 2adb3069b0e04-5608a0892damr881661e87.14.1756926523348;
        Wed, 03 Sep 2025 12:08:43 -0700 (PDT)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5608abccc75sm704484e87.62.2025.09.03.12.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 12:08:42 -0700 (PDT)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jason Montleon <jmontleo@redhat.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthew Maurer <mmaurer@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Brian Gerst <brgerst@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH 1/2] rust: get the version of libclang used by bindgen in a separate script
Date: Wed,  3 Sep 2025 21:07:56 +0200
Message-ID: <20250903190806.2604757-1-SpriteOvO@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830-cheesy-prone-ee5fae406c22@spud>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Decouple the code for getting the version of libclang used by Rust
bindgen from rust_is_available.sh into a separate script so that we can
define a symbol for the version in Kconfig that will be used for
checking in subsequent patches.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 init/Kconfig                                  |  6 ++
 rust/Makefile                                 |  2 +-
 scripts/Kconfig.include                       |  1 +
 ...lang.h => rust-bindgen-libclang-version.h} |  0
 scripts/rust-bindgen-libclang-version.sh      | 94 +++++++++++++++++++
 scripts/rust_is_available.sh                  | 58 +++---------
 scripts/rust_is_available_test.py             | 22 ++---
 7 files changed, 125 insertions(+), 58 deletions(-)
 rename scripts/{rust_is_available_bindgen_libclang.h => rust-bindgen-libclang-version.h} (100%)
 create mode 100755 scripts/rust-bindgen-libclang-version.sh

diff --git a/init/Kconfig b/init/Kconfig
index 666783eb50ab..322af2ba76cd 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,6 +82,12 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config RUST_BINDGEN_LIBCLANG_VERSION
+	int
+	default $(rustc-bindgen-libclang-version)
+	help
+	  This is the version of `libclang` used by the Rust bindings generator.
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
diff --git a/rust/Makefile b/rust/Makefile
index 115b63b7d1e3..34d0429d50fd 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -300,7 +300,7 @@ bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
 # https://github.com/llvm/llvm-project/issues/44842
 # https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0-rc2/clang/docs/ReleaseNotes.rst#deprecated-compiler-flags
 ifdef CONFIG_INIT_STACK_ALL_ZERO
-libclang_maj_ver=$(shell $(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -ne 's/.*clang version \([0-9]*\).*/\1/p')
+libclang_maj_ver=$(shell $(srctree)/scripts/rust-bindgen-libclang-version.sh --with-non-canonical $(BINDGEN) | sed -ne '2s/\([0-9]*\).*/\1/p')
 ifeq ($(shell expr $(libclang_maj_ver) \< 16), 1)
 bindgen_extra_c_flags += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e803..68df1fed69a1 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -67,6 +67,7 @@ m64-flag := $(cc-option-bit,-m64)
 
 rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
 rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
+rustc-bindgen-libclang-version := $(shell,$(srctree)/scripts/rust-bindgen-libclang-version.sh $(BINDGEN) 2>/dev/null)
 
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise
diff --git a/scripts/rust_is_available_bindgen_libclang.h b/scripts/rust-bindgen-libclang-version.h
similarity index 100%
rename from scripts/rust_is_available_bindgen_libclang.h
rename to scripts/rust-bindgen-libclang-version.h
diff --git a/scripts/rust-bindgen-libclang-version.sh b/scripts/rust-bindgen-libclang-version.sh
new file mode 100755
index 000000000000..45485d0f95c8
--- /dev/null
+++ b/scripts/rust-bindgen-libclang-version.sh
@@ -0,0 +1,94 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Print the version of `libclang` used by the Rust bindings generator in a 5 or 6-digit form,
+# and a non-canonical form if `--with-non-canonical` option is specified.
+# Also, perform the minimum version check.
+
+set -e
+
+# If the script fails, print 0 to stdout as the version output.
+trap 'if [ $? -ne 0 ]; then echo 0; fi' EXIT
+
+while [ $# -gt 0 ]; do
+	case "$1" in
+	--with-non-canonical)
+		with_non_canonical=1
+		;;
+	-*)
+		echo >&2 "Unknown option: $1"
+		exit 1
+		;;
+	*)
+		break
+		;;
+	esac
+	shift
+done
+
+get_bindgen_libclang_version()
+{
+	# Invoke `bindgen` to get the `libclang` version found by `bindgen`. This step
+	# may already fail if, for instance, `libclang` is not found, thus inform the
+	# user in such a case.
+	output=$( \
+		LC_ALL=C "$@" $(dirname $0)/rust-bindgen-libclang-version.h 2>&1 >/dev/null
+	) || code=$?
+	if [ -n "$code" ]; then
+		echo >&2 "***"
+		echo >&2 "*** Running '$@' to check the libclang version (used by the Rust"
+		echo >&2 "*** bindings generator) failed with code $code. This may be caused by"
+		echo >&2 "*** a failure to locate libclang. See output and docs below for details:"
+		echo >&2 "***"
+		echo >&2 "$output"
+		echo >&2 "***"
+		exit 1
+	fi
+
+	# Unlike other version checks, note that this one does not necessarily appear
+	# in the first line of the output, thus no `sed` address is provided.
+	version=$( \
+		echo "$output" \
+			| sed -nE 's:.*clang version ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p'
+	)
+	if [ -z "$version" ]; then
+		echo >&2 "***"
+		echo >&2 "*** Running '$@' to check the libclang version (used by the Rust"
+		echo >&2 "*** bindings generator) did not return an expected output. See output"
+		echo >&2 "*** and docs below for details:"
+		echo >&2 "***"
+		echo >&2 "$output"
+		echo >&2 "***"
+		exit 1
+	fi
+	echo "$version"
+}
+
+# Convert the version string x.y.z to a canonical 5 or 6-digit form.
+get_canonical_version()
+{
+	IFS=.
+	set -- $1
+	echo $((10000 * $1 + 100 * $2 + $3))
+}
+
+min_tool_version=$(dirname $0)/min-tool-version.sh
+
+version=$(get_bindgen_libclang_version "$@")
+min_version=$($min_tool_version llvm)
+cversion=$(get_canonical_version $version)
+min_cversion=$(get_canonical_version $min_version)
+
+if [ "$cversion" -lt "$min_cversion" ]; then
+	echo >&2 "***"
+	echo >&2 "*** libclang (used by the Rust bindings generator '$@') is too old."
+	echo >&2 "***   Your version:    $version"
+	echo >&2 "***   Minimum version: $min_version"
+	echo >&2 "***"
+	exit 1
+fi
+
+echo "$cversion"
+if [ -n "$with_non_canonical" ]; then
+	echo "$version"
+fi
diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index d2323de0692c..ccbd5efe9498 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -179,55 +179,21 @@ fi
 
 # Check that the `libclang` used by the Rust bindings generator is suitable.
 #
-# In order to do that, first invoke `bindgen` to get the `libclang` version
-# found by `bindgen`. This step may already fail if, for instance, `libclang`
-# is not found, thus inform the user in such a case.
-bindgen_libclang_output=$( \
-	LC_ALL=C "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_libclang.h 2>&1 >/dev/null
-) || bindgen_libclang_code=$?
-if [ -n "$bindgen_libclang_code" ]; then
-	echo >&2 "***"
-	echo >&2 "*** Running '$BINDGEN' to check the libclang version (used by the Rust"
-	echo >&2 "*** bindings generator) failed with code $bindgen_libclang_code. This may be caused by"
-	echo >&2 "*** a failure to locate libclang. See output and docs below for details:"
-	echo >&2 "***"
-	echo >&2 "$bindgen_libclang_output"
-	echo >&2 "***"
-	exit 1
-fi
-
-# `bindgen` returned successfully, thus use the output to check that the version
-# of the `libclang` found by the Rust bindings generator is suitable.
-#
-# Unlike other version checks, note that this one does not necessarily appear
-# in the first line of the output, thus no `sed` address is provided.
-bindgen_libclang_version=$( \
-	echo "$bindgen_libclang_output" \
-		| sed -nE 's:.*clang version ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p'
-)
-if [ -z "$bindgen_libclang_version" ]; then
-	echo >&2 "***"
-	echo >&2 "*** Running '$BINDGEN' to check the libclang version (used by the Rust"
-	echo >&2 "*** bindings generator) did not return an expected output. See output"
-	echo >&2 "*** and docs below for details:"
-	echo >&2 "***"
-	echo >&2 "$bindgen_libclang_output"
-	echo >&2 "***"
-	exit 1
-fi
-bindgen_libclang_min_version=$($min_tool_version llvm)
-bindgen_libclang_cversion=$(get_canonical_version $bindgen_libclang_version)
-bindgen_libclang_min_cversion=$(get_canonical_version $bindgen_libclang_min_version)
-if [ "$bindgen_libclang_cversion" -lt "$bindgen_libclang_min_cversion" ]; then
-	echo >&2 "***"
-	echo >&2 "*** libclang (used by the Rust bindings generator '$BINDGEN') is too old."
-	echo >&2 "***   Your version:    $bindgen_libclang_version"
-	echo >&2 "***   Minimum version: $bindgen_libclang_min_version"
-	echo >&2 "***"
+# Get the version, and the minimum version check will be performed internally.
+bindgen_libclang_version_output=$( \
+	$(dirname $0)/rust-bindgen-libclang-version.sh --with-non-canonical $BINDGEN
+) || bindgen_libclang_version_code=$?
+if [ -n "$bindgen_libclang_version_code" ]; then
+	# Detailed error messages have already been output in the script we just called.
 	exit 1
 fi
 
-if [ "$bindgen_libclang_cversion" -ge 1900100 ] &&
+# Getting the version successfully, thus use the output to check that the
+# version of the `libclang` found by the Rust bindings generator is suitable.
+readarray -t bindgen_libclang_version_array <<<"$bindgen_libclang_version_output"
+bindgen_libclang_version=${bindgen_libclang_version_array[1]}
+bindgen_libclang_cversion=${bindgen_libclang_version_array[0]}
+if [ "$bindgen_libclang_cversion" -ge 190100 ] &&
 	[ "$rust_bindings_generator_cversion" -lt 6905 ]; then
 	# Distributions may have patched the issue (e.g. Debian did).
 	if ! "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_libclang_concat.h | grep -q foofoo; then
diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_available_test.py
index 4fcc319dea84..b7265e2691cf 100755
--- a/scripts/rust_is_available_test.py
+++ b/scripts/rust_is_available_test.py
@@ -72,7 +72,7 @@ else:
 
         return cls.generate_executable(f"""#!/usr/bin/env python3
 import sys
-if "rust_is_available_bindgen_libclang.h" in " ".join(sys.argv):
+if "rust-bindgen-libclang-version.h" in " ".join(sys.argv):
     {libclang_case}
 elif "rust_is_available_bindgen_0_66.h" in " ".join(sys.argv):
     {version_0_66_case}
@@ -113,7 +113,7 @@ else:
 
         cls.bindgen_default_bindgen_version_stdout = f"bindgen {cls.bindgen_default_version}"
         cls.bindgen_default_bindgen_libclang_failure_exit_code = 42
-        cls.bindgen_default_bindgen_libclang_stderr = f"scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {cls.llvm_default_version} [-W#pragma-messages], err: false"
+        cls.bindgen_default_bindgen_libclang_stderr = f"scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version {cls.llvm_default_version} [-W#pragma-messages], err: false"
 
         cls.default_rustc = cls.generate_rustc(f"rustc {cls.rustc_default_version}")
         cls.default_bindgen =  cls.generate_bindgen(cls.bindgen_default_bindgen_version_stdout, cls.bindgen_default_bindgen_libclang_stderr)
@@ -265,13 +265,13 @@ else:
         self.assertIn(f"bindings generator) failed with code {self.bindgen_default_bindgen_libclang_failure_exit_code}. This may be caused by", result.stderr)
 
     def test_bindgen_libclang_unexpected_version(self):
-        bindgen = self.generate_bindgen_libclang("scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version unexpected [-W#pragma-messages], err: false")
+        bindgen = self.generate_bindgen_libclang("scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version unexpected [-W#pragma-messages], err: false")
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
         self.assertIn(f"Running '{bindgen}' to check the libclang version (used by the Rust", result.stderr)
         self.assertIn("bindings generator) did not return an expected output. See output", result.stderr)
 
     def test_bindgen_libclang_old_version(self):
-        bindgen = self.generate_bindgen_libclang("scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version 10.0.0 [-W#pragma-messages], err: false")
+        bindgen = self.generate_bindgen_libclang("scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version 10.0.0 [-W#pragma-messages], err: false")
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
         self.assertIn(f"libclang (used by the Rust bindings generator '{bindgen}') is too old.", result.stderr)
 
@@ -291,7 +291,7 @@ else:
         ):
             with self.subTest(bindgen_version=bindgen_version, libclang_version=libclang_version):
                 cc = self.generate_clang(f"clang version {libclang_version}")
-                libclang_stderr = f"scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {libclang_version} [-W#pragma-messages], err: false"
+                libclang_stderr = f"scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version {libclang_version} [-W#pragma-messages], err: false"
                 bindgen = self.generate_bindgen(f"bindgen {bindgen_version}", libclang_stderr)
                 result = self.run_script(expected_not_patched, { "BINDGEN": bindgen, "CC": cc })
                 if expected_not_patched == self.Expected.SUCCESS_WITH_WARNINGS:
@@ -301,7 +301,7 @@ else:
                 result = self.run_script(self.Expected.SUCCESS, { "BINDGEN": bindgen, "CC": cc })
 
     def test_clang_matches_bindgen_libclang_different_bindgen(self):
-        bindgen = self.generate_bindgen_libclang("scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version 999.0.0 [-W#pragma-messages], err: false")
+        bindgen = self.generate_bindgen_libclang("scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version 999.0.0 [-W#pragma-messages], err: false")
         result = self.run_script(self.Expected.SUCCESS_WITH_WARNINGS, { "BINDGEN": bindgen })
         self.assertIn("version does not match Clang's. This may be a problem.", result.stderr)
 
@@ -352,16 +352,16 @@ InstalledDir: /usr/bin
 
     def test_success_bindgen_libclang(self):
         for stderr in (
-            f"scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {self.llvm_default_version} (https://github.com/llvm/llvm-project.git 4a2c05b05ed07f1f620e94f6524a8b4b2760a0b1) [-W#pragma-messages], err: false",
-            f"/home/jd/Documents/dev/kernel-module-flake/linux-6.1/outputs/dev/lib/modules/6.1.0-development/source/scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {self.llvm_default_version}  [-W#pragma-messages], err: false",
-            f"scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {self.llvm_default_version} (Fedora 13.0.0-3.fc35) [-W#pragma-messages], err: false",
+            f"scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version {self.llvm_default_version} (https://github.com/llvm/llvm-project.git 4a2c05b05ed07f1f620e94f6524a8b4b2760a0b1) [-W#pragma-messages], err: false",
+            f"/home/jd/Documents/dev/kernel-module-flake/linux-6.1/outputs/dev/lib/modules/6.1.0-development/source/scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version {self.llvm_default_version}  [-W#pragma-messages], err: false",
+            f"scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version {self.llvm_default_version} (Fedora 13.0.0-3.fc35) [-W#pragma-messages], err: false",
             f"""
 /nix/store/dsd5gz46hdbdk2rfdimqddhq6m8m8fqs-bash-5.1-p16/bin/bash: warning: setlocale: LC_ALL: cannot change locale (c)
-scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {self.llvm_default_version}  [-W#pragma-messages], err: false
+scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version {self.llvm_default_version}  [-W#pragma-messages], err: false
 """,
             f"""
 /nix/store/dsd5gz46hdbdk2rfdimqddhq6m8m8fqs-bash-5.1.0-p16/bin/bash: warning: setlocale: LC_ALL: cannot change locale (c)
-/home/jd/Documents/dev/kernel-module-flake/linux-6.1/outputs/dev/lib/modules/6.1.0-development/source/scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {self.llvm_default_version} (Fedora 13.0.0-3.fc35) [-W#pragma-messages], err: false
+/home/jd/Documents/dev/kernel-module-flake/linux-6.1/outputs/dev/lib/modules/6.1.0-development/source/scripts/rust-bindgen-libclang-version.h:2:9: warning: clang version {self.llvm_default_version} (Fedora 13.0.0-3.fc35) [-W#pragma-messages], err: false
 """
         ):
             with self.subTest(stderr=stderr):
-- 
2.51.0


