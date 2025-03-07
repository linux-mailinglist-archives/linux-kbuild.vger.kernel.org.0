Return-Path: <linux-kbuild+bounces-5990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D553DA55F51
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 05:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9ED31894F12
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 04:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9BE19259A;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Buin79jU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630EF19047A;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321158; cv=none; b=iAWX/MNnAU6DwMAW7UGqDxwf4jQL8jzfruFJ7s5A/UxOfIVRz0Ntc04W9mrIolSMGBgYmZwYSxwffwbLZB3mUOQFsxfaIZi3YxFv1uRhTrwEts82X/EGgaSroLuGKUFBie32aqZkglrACEjKSKoiwR+mbFb+MLU1pCYoTdKlDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321158; c=relaxed/simple;
	bh=uNpuQxTpZBJvM7GGSJmEy7lrrBKKHc7fIlKudivWp4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CV7mwfZnxGX1p4XeB+M9L63xn+h7yI55JZHWXRWsikBCxwAMZ7Aim3jdRU71ncps1jI0zBm/+GrqPJI5TE4RKBGoGiecdYqOSYxqiy0bxs3Hfdd1p5UDAMxqnx2N6lbv/Ax+O10Je76xjoU1DoqYEx2W83GpLTg/EeGS6kGe1FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Buin79jU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF828C4AF09;
	Fri,  7 Mar 2025 04:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741321158;
	bh=uNpuQxTpZBJvM7GGSJmEy7lrrBKKHc7fIlKudivWp4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Buin79jUQfKozriM7zIKRN492/C5+yYUH3moaW/JBqerJ1wGI/zI0KF7Ou3jujH8p
	 eLmGEOU0FF9YC2ObjfSXlxaDkB9Um0RBWe0/Ji22FkRPO21m/I2ZTWHwiF/Q7F+oGH
	 3e9ZZNspworYdQTyFu3xiMZWsMNDTQuBTaI1f0XqLufrF8lqxaJX6sgkPrPybnGHkE
	 5HVp471Grx9ibv4zOdX1JeZhNTtZC0n241cjYfkMmGHAWpLHXylinwG8HrfEmmDXaV
	 8m1QhkFFaesVVyGV+woBtc1Bty+dHU9gltaiMD5qaH9M/5xTG5RUcrT7yFdePjxfRK
	 UJKuJrBtwMyIQ==
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Hao Luo <haoluo@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Bill Wendling <morbo@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 3/3] ubsan/overflow: Enable ignorelist parsing and add type filter
Date: Thu,  6 Mar 2025 20:19:11 -0800
Message-Id: <20250307041914.937329-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307040948.work.791-kees@kernel.org>
References: <20250307040948.work.791-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2672; i=kees@kernel.org; h=from:subject; bh=uNpuQxTpZBJvM7GGSJmEy7lrrBKKHc7fIlKudivWp4k=; b=owGbwMvMwCVmps19z/KJym7G02pJDOmnive33Kyu+u8yKfiLVCOnWmx084Lfr96smbtIRLf/Y /i1tR++dpSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzk6FNGhjMLtQ0mlb6V+2tR 4rv444FVF+UfOWn5vX6TuOWrR3HWmjiGf2rWE+S+bv728PWUGc1T79xsMF5YJ606fauk2+YfCQ4 mlQwA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Limit integer wrap-around mitigation to only the "size_t" type (for
now). Notably this covers all special functions/builtins that return
"size_t", like sizeof(). This remains an experimental feature and is
likely to be replaced with type annotations.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Justin Stitt <justinstitt@google.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: kasan-dev@googlegroups.com
Cc: linux-hardening@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
---
 lib/Kconfig.ubsan               | 1 +
 scripts/Makefile.ubsan          | 3 ++-
 scripts/integer-wrap-ignore.scl | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 scripts/integer-wrap-ignore.scl

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 888c2e72c586..4216b3a4ff21 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -125,6 +125,7 @@ config UBSAN_INTEGER_WRAP
 	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
 	depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
 	depends on $(cc-option,-fsanitize=implicit-unsigned-integer-truncation)
+	depends on $(cc-option,-fsanitize-ignorelist=/dev/null)
 	help
 	  This option enables all of the sanitizers involved in integer overflow
 	  (wrap-around) mitigation: signed-integer-overflow, unsigned-integer-overflow,
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 233379c193a7..9e35198edbf0 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -19,5 +19,6 @@ ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
 	-fsanitize=signed-integer-overflow			\
 	-fsanitize=unsigned-integer-overflow			\
 	-fsanitize=implicit-signed-integer-truncation		\
-	-fsanitize=implicit-unsigned-integer-truncation
+	-fsanitize=implicit-unsigned-integer-truncation		\
+	-fsanitize-ignorelist=$(srctree)/scripts/integer-wrap-ignore.scl
 export CFLAGS_UBSAN_INTEGER_WRAP := $(ubsan-integer-wrap-cflags-y)
diff --git a/scripts/integer-wrap-ignore.scl b/scripts/integer-wrap-ignore.scl
new file mode 100644
index 000000000000..431c3053a4a2
--- /dev/null
+++ b/scripts/integer-wrap-ignore.scl
@@ -0,0 +1,3 @@
+[{unsigned-integer-overflow,signed-integer-overflow,implicit-signed-integer-truncation,implicit-unsigned-integer-truncation}]
+type:*
+type:size_t=sanitize
-- 
2.34.1


