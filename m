Return-Path: <linux-kbuild+bounces-6917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABBAA81FA
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 20:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 076F5189EF36
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 18:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503BD27E7D7;
	Sat,  3 May 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMyiXwu5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A816B3B7;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746297987; cv=none; b=MevFtRfGT6hrJoRnHPKEiJTnZcBJHcFXZF3AzvJUefLvvo7K9tV1XDZFHFUwn9i7u6JRjLwZ+P3DP721R3eQT1ZMAJkCL2iSC/6iEDTut+hwqVP7XyKuiB3f545BIXCOoILYVz4MnZozImItichc6S1VvsvMXZzXLVTsW2zERUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746297987; c=relaxed/simple;
	bh=+tpyu2HU8spYPzq1uf4EZ3SloA5fFEfjRjUkQSozF1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fjbT93gRYUDiYUD+tPQ7YKhAkvdjUvpcYA6BjePGEYqkTlHAeKE6/9ZefTte7SlyZ/hEulsq86nnqYWBDM4Ujg4y7lIv/Dw/R8E+OdNO6MVOrJHs+GTprqfhP94LoHBrf+45kGtsPEWXhO1tDZRrKbNPoGeh8Ox7q9ozOBCNiso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMyiXwu5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C232C4CEEE;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746297986;
	bh=+tpyu2HU8spYPzq1uf4EZ3SloA5fFEfjRjUkQSozF1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMyiXwu5nh0hGSlwFkUAtV2aMl6hkBcXj2nYBXc1EZfem3afnc7pOIoxQnegM+UtO
	 AQIX/rgsH46feRTLVDVOdcfOdx7+h/S9GGAdOepB6Iak/4D6EZ7JHv1Ng8aNV3qeE/
	 fEROiBke/e8y7Ef8ZrA7MekJgwyKG3eJuSMnANJcB5+kaWC45hvJfC3IsQhqx1s81z
	 aoTZHdunenePfUBV7z3DDmdXUK5vADwMNnESZDl3o7C16DkfgDUBxS0fTgZyN1LSym
	 RL9viwL9YsPstWtVkqXz7gqeZoyz4nucQhW4q3HhvUpRAOXGQs5X6JGm0/uCgtog5E
	 DyVYWt6phyH7Q==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 3/3] integer-wrap: Force full rebuild when .scl file changes
Date: Sat,  3 May 2025 11:46:20 -0700
Message-Id: <20250503184623.2572355-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503184001.make.594-kees@kernel.org>
References: <20250503184001.make.594-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674; i=kees@kernel.org; h=from:subject; bh=+tpyu2HU8spYPzq1uf4EZ3SloA5fFEfjRjUkQSozF1w=; b=owGbwMvMwCVmps19z/KJym7G02pJDBliyft7n2QtDHVZzPzT7voxVRX9o38qkjOX/vRYvIpJI GFTQFxERykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwETSDRj+Z68L0rBx8nkQ1vFK /Z3w59knAyKm/q25XLPDJ3Wd/pPO+4wMr37EPn6zUEbQ81Oxn66L3YPZSxqD1p88miN63FK3vj+ FDQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Since the integer wrapping sanitizer's behavior depends on its associated
.scl file, we must force a full rebuild if the file changes. If not,
instrumentation may differ between targets based on when they were built.

Generate a new header file, integer-wrap.h, any time the Clang .scl
file changes. Include the header file in compiler-version.h when its
associated feature name, INTEGER_WRAP, is defined. This will be picked
up by fixdep and force rebuilds where needed.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <kasan-dev@googlegroups.com>
Cc: <linux-hardening@vger.kernel.org>
---
 include/linux/compiler-version.h | 3 +++
 scripts/Makefile.ubsan           | 1 +
 scripts/basic/Makefile           | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index 69b29b400ce2..187e749f9e79 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -19,3 +19,6 @@
 #ifdef RANDSTRUCT
 #include <generated/randstruct_hash.h>
 #endif
+#ifdef INTEGER_WRAP
+#include <generated/integer-wrap.h>
+#endif
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 9e35198edbf0..653f7117819c 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -15,6 +15,7 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined
 export CFLAGS_UBSAN := $(ubsan-cflags-y)
 
 ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
+	-DINTEGER_WRAP						\
 	-fsanitize-undefined-ignore-overflow-pattern=all	\
 	-fsanitize=signed-integer-overflow			\
 	-fsanitize=unsigned-integer-overflow			\
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index dd289a6725ac..fb8e2c38fbc7 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -14,3 +14,8 @@ cmd_create_randstruct_seed = \
 $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
 	$(call if_changed,create_randstruct_seed)
 always-$(CONFIG_RANDSTRUCT) += randstruct.seed
+
+# integer-wrap: if the .scl file changes, we need to do a full rebuild.
+$(obj)/../../include/generated/integer-wrap.h: $(srctree)/scripts/integer-wrap-ignore.scl FORCE
+	$(call if_changed,touch)
+always-$(CONFIG_UBSAN_INTEGER_WRAP) += ../../include/generated/integer-wrap.h
-- 
2.34.1


