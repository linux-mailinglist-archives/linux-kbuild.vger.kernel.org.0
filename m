Return-Path: <linux-kbuild+bounces-2911-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97E94C6D2
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 00:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96FEC1F22D77
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 22:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E387015FA85;
	Thu,  8 Aug 2024 22:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXtyBSAe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691415FA73;
	Thu,  8 Aug 2024 22:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155121; cv=none; b=gRltGD2Wt3PY/RLG+av98jdZZuNuZ7Yir3L3zGXO+Etwhd2cYklKMhlrqThn/giBc5y9NPDnnZX1H2NVuq5IZmfZJsmmdzi5TajhvGnjoOLhYNrCrai3LdYgXQPQheMsOWTcwfRTOEfLg3EnwHdn6V36Zob8zDXBnSWklcp27xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155121; c=relaxed/simple;
	bh=dyjEI+qN7UE6T5JZLmW51Kukg6KdxKj+Q9Udid5aCvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cmUatzkNnJBH/wQl/bsCCGtboPbckZ27Aj0pKqvU2ltd+6X0oFWo9DW+z69lRCoItAf448hgU6qFcPYqhL/6BzTUMKV9bZ39mX2jVR87Us7w3h5tW8pg46zUT3Cd8HfDOoHC+pOtDvddX4Ri5p4+nEhv5ejmHV155l6FrawYiuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXtyBSAe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2C0C4AF09;
	Thu,  8 Aug 2024 22:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723155121;
	bh=dyjEI+qN7UE6T5JZLmW51Kukg6KdxKj+Q9Udid5aCvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SXtyBSAet2dLZe3YiuPEOINhNkdMmW8ohKVhr7NP/FadhWLFG+DfUcy8zNv8IfyuJ
	 8wu5Ae4c21JpuN7jqCd3AaCKzdpgtJQ3uQ6X4utrTwrEtzCqxT4vT+S0cidlNekH8y
	 pJ9zmq8LOu03GJ244P3wwW3Ur/VvoU7mojFv2lbK+DAN6HQOkLpYTveqgIrD2IFD8B
	 FDjPFUYkW12ciEff7504MocOxMPp0pN2pIAWxzjWtg9crVfLUM3RjmsRF/bPe9lOTI
	 bDI3sJ2Z2+AEKt3FeKgzRMs90BQidgMItC6j+gYR8EscHcg0kDA6DGlg3qxriE4aWs
	 eb6DB41pEkhYw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 1/6] kbuild: rust: add `CONFIG_RUSTC_VERSION`
Date: Fri,  9 Aug 2024 00:11:33 +0200
Message-ID: <20240808221138.873750-2-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-1-ojeda@kernel.org>
References: <20240808221138.873750-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that we support several Rust versions, introduce
`CONFIG_RUSTC_VERSION` so that it can be used in Kconfig to enable and
disable configuration options based on the `rustc` version.

The approach taken resembles `pahole`'s -- see commit 613fe1692377
("kbuild: Add CONFIG_PAHOLE_VERSION"), i.e. a simple version parsing
without trying to identify several kinds of compilers, since so far
there is only one (`rustc`).

However, unlike `pahole`'s, we also print a zero if executing failed for
any reason, rather than checking if the command is found and executable
(which still leaves things like a file that exists and is executable,
but e.g. is built for another platform [1]). An equivalent approach to
the one here has also been submitted for `pahole` [2].

Link: https://lore.kernel.org/rust-for-linux/CANiq72=4vX_tJMJLE6e+bg7ZECHkS-AQpm8GBzuK75G1EB7+Nw@mail.gmail.com/ [1]
Link: https://lore.kernel.org/linux-kbuild/20240728125527.690726-1-ojeda@kernel.org/ [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig             |  7 +++++++
 scripts/rustc-version.sh | 26 ++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100755 scripts/rustc-version.sh

diff --git a/init/Kconfig b/init/Kconfig
index 3ada33b1d681..47e2c3227b99 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -60,6 +60,13 @@ config LLD_VERSION
 	default $(ld-version) if LD_IS_LLD
 	default 0
 
+config RUSTC_VERSION
+	int
+	default $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+	help
+	  It does not depend on `RUST` since that one may need to use the version
+	  in a `depends on`.
+
 config RUST_IS_AVAILABLE
 	def_bool $(success,$(srctree)/scripts/rust_is_available.sh)
 	help
diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
new file mode 100755
index 000000000000..62ea510be71b
--- /dev/null
+++ b/scripts/rustc-version.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Usage: $ ./rustc-version.sh rustc
+#
+# Print the Rust compiler name and its version in a 6 or 7-digit form.
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
+if output=$("$@" --version 2>/dev/null); then
+	set -- $output
+	get_canonical_version $2
+else
+	echo 0
+	exit 1
+fi
-- 
2.46.0


