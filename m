Return-Path: <linux-kbuild+bounces-8351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7C1B21CD9
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA7E06835DD
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E46623ED6A;
	Tue, 12 Aug 2025 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1M35vqZN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="whXEW0nK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96E18FC91;
	Tue, 12 Aug 2025 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976715; cv=none; b=orrJ3WKGreVh0n+RcfHNHFz4OykHZxd0dKZ6rRl3i+6eomJbl4x2A3/j7sbVb8Velrm8vzQxSAZ+VFMWVH9G93i3FXFcvKWJzPBhxTDE20HlU9lRK8Kr4k10URgIMXK/EjnTasuoa48lpCnLXiAxYcNxglt/ZxSgcssjFkNMx/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976715; c=relaxed/simple;
	bh=+pKek1uPajXdjvkKkRPqpP96Ei8Q3LMoOwHeMHpLB4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPsFsyzInoDiMnWcBIPs+yz6Fd1Ic83ne8CJFyvO76UmSELH3QyiC5Q5WxLd4M6QMG5KrJ47wsUetyUdwCkoJDdWHFlZ5X1lasnWhTjoTEUIDoFaDh8zFwXi3SeiJ9ikijyJnYotzmRU8pHWtPpT9HhqLeXPx/kIi+FhADZtxUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1M35vqZN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=whXEW0nK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KMXUeqLVprRM83sPpoFBOYX8oSP1XBvAZsT4HmA8uJU=;
	b=1M35vqZNJ4dU71xhNc8RuydoIBxCBcT1CORAdWaorLsUaOnxpw+2N7GEMvKlincIs62loy
	T74zlTblfMUJb17Wd+NJ+RF1LKgZFFbuVZjfc0qyBzIDQ8mk8LoIIX6uq5yws/CiVfDBZU
	fvlyXvn7CxRFtxI6HWuqYJq0A6aFN6PSzQeAMefS+yCewn/no5fSjYsX9+n9sQbs1GjQZT
	5zZq5z2ZnRGBe6YivYOz+LPV3wNn2hIWS+cG4ZL94Gy28R3btOWLr6XMKSxgt81bL3Xejt
	Ja2CMVV2VaAhqJ8wYWFBo9bcXh/ChPbbVUrj6tVYN1FzqKdnYxUQq934i6SgCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KMXUeqLVprRM83sPpoFBOYX8oSP1XBvAZsT4HmA8uJU=;
	b=whXEW0nKe2faCcoKL5alTItWuG8euaqSpS3PvsIwFTS8IdKST+PnkPwTAoky1Qo0m6gzgW
	3ju/jAmgu9oVILDA==
Date: Tue, 12 Aug 2025 07:31:39 +0200
Subject: [PATCH 1/2] kbuild: move existing CONFIG_WERROR flags into
 dedicated Makefile
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-werror-v1-1-36c9ff653700@linutronix.de>
References: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
In-Reply-To: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976708; l=2547;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+pKek1uPajXdjvkKkRPqpP96Ei8Q3LMoOwHeMHpLB4g=;
 b=nX9JWW4lGC9XaPA7cdKp7851DDASxuzGyvsz0YDZLG7i0Sgz+TL/tIIqgpH/os0l73ct5uDg4
 sk6ZMlp50tvDRoMsiFTS4dtd4PS9u0iVQB9yLCeOxvyQLpC5XAyBHmp
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

CONFIG_WERROR is about to be enabled for more build steps.
To avoid spreading similar flags into multiple locations, create a
dedicated, shared file for them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile                   |  4 +---
 scripts/Makefile.extrawarn |  2 --
 scripts/Makefile.werror    | 11 +++++++++++
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 6bfe776bf3c5ff0cf187dc6719dd5817cd4af2ca..4ffa40e98b1517e1f2a7a155641fa9a3c784f625 100644
--- a/Makefile
+++ b/Makefile
@@ -901,9 +901,6 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
 
 KBUILD_CFLAGS += $(stackp-flags-y)
 
-KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
-KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
-
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
@@ -1085,6 +1082,7 @@ endif
 
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.extrawarn
+include-$(CONFIG_WERROR)	+= scripts/Makefile.werror
 include-$(CONFIG_DEBUG_INFO)	+= scripts/Makefile.debug
 include-$(CONFIG_DEBUG_INFO_BTF)+= scripts/Makefile.btf
 include-$(CONFIG_KASAN)		+= scripts/Makefile.kasan
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index dca175fffcabeb2d942814f0a096a7efbf8bc819..2d8201395002dace78b875a6d25d1fd33b1691fd 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -25,8 +25,6 @@ ifneq ($(CONFIG_FRAME_WARN),0)
 KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
 endif
 
-KBUILD_CPPFLAGS-$(CONFIG_WERROR) += -Werror
-KBUILD_CPPFLAGS += $(KBUILD_CPPFLAGS-y)
 KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 
 ifdef CONFIG_CC_IS_CLANG
diff --git a/scripts/Makefile.werror b/scripts/Makefile.werror
new file mode 100644
index 0000000000000000000000000000000000000000..db14b5490ba83444be39a18109f103cabc5b95e9
--- /dev/null
+++ b/scripts/Makefile.werror
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+# ==========================================================================
+# Warning flags enabled by CONFIG_WERROR
+#
+# Different parts of the build require different flags to transform warnings
+# into errors. These are handled by the entries below.
+# ==========================================================================
+
+KBUILD_CPPFLAGS		+= -Werror
+
+KBUILD_RUSTFLAGS	+= -Dwarnings

-- 
2.50.1


