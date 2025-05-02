Return-Path: <linux-kbuild+bounces-6899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C8EAA7C7B
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 00:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079AA5A3D57
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 22:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A5521FF4C;
	Fri,  2 May 2025 22:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xw/kqnMW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E5215184;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226460; cv=none; b=pZUwj7IdhNRwShe/KgRvFWbD29EMTUppEEBPM3N3XqkhjXZY2XtpkrZtR/A4tlKwNENWHFRfgov45QRomT4+ykGKjT05D7fgHy9Itzzt1ZCwKmitBS9pwWDJJ5DlBlA7RODYPZasSU/JJy32zlM07Px3dxi3N3E53rsfxOUp48E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226460; c=relaxed/simple;
	bh=xF83aDmqFbvCUaXo7mxg1j7TWAuDRl3V3C44XfenCBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q02cxiq9AOvHy7XT7siU1EpcaNv/EBHZmEifs16N7763LJFH40FkcY8aDpXdaZaA4+WqoHtjMgyWKTJcxteTFFX+PlStNmDSkGahEmTC2XuY8VuQUyulqxPmbH0L697+D9adAwTYZdQxYf9NVOyukMFghJwEPMjIMnxQJafqMYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xw/kqnMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C102AC4CEED;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746226459;
	bh=xF83aDmqFbvCUaXo7mxg1j7TWAuDRl3V3C44XfenCBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xw/kqnMW6X6itgZQY+XZPyclDOFFHHd8zTcRSpSXNYBwrE9OZ2KcpgeEfhKZl8tOo
	 FYKUq+zupdEyqBix8779gWxG4RAbnlavrlqvDUPUGKM00xhBFQIBW+xCmYpzL+W9U3
	 9CaqJKqoDlE+Cn54ROrdFpjPGzxKRKgFqNqDlE8ca0WobLkdrMzm2oSh1wDhcVzf1B
	 tt6IzOSg/sc1HqEb2M5+E5q6eqnGT4h19iwKAkicM4le5S+cg0KbPO16J9WBCWFqAa
	 CP4scwfEGTvyjdR1OJVN+T3ceAYiKZpQ7ZHShrouGxIbZmOov/r3W9SVSrdB/GvLn7
	 nqnlCB9Oq2/Vw==
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
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [PATCH v2 3/3] integer-wrap: Force full rebuild when .scl file changes
Date: Fri,  2 May 2025 15:54:15 -0700
Message-Id: <20250502225416.708936-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502224512.it.706-kees@kernel.org>
References: <20250502224512.it.706-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2695; i=kees@kernel.org; h=from:subject; bh=xF83aDmqFbvCUaXo7mxg1j7TWAuDRl3V3C44XfenCBQ=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmivuI85U7N/WzzlN9cqLGqVdC53L/oHwfbLf9DF++mi ConLW/pKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmMj1P4wMPZc1RZaLnRXVX3on RnbKtpciUZ2agRuunHxVXLxk+rfnpxkZXieL9fE5qE4+yfT1wdwJO8OkNG0SBQw4Ojzm3NpT65j BCQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Since the integer wrapping sanitizer's behavior depends on its
associated .scl file, we must force a full rebuild if the file changes.
Universally include a synthetic header file that is rebuilt when the
.scl file changes, via compiler-version.h, since using "-include ..." is
not possible in the case of having compiler flags removed via
"filter-out" (which would remove all instances of "-include").

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
 scripts/basic/Makefile           | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index 05d555320a0f..9d6b1890ffc7 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -19,3 +19,6 @@
 #ifdef RANDSTRUCT
 #include "randstruct_hash.h"
 #endif
+#ifdef INTEGER_WRAP
+#include "integer-wrap.h"
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
index 31637ce4dc5c..04f5620a3f8b 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -15,3 +15,12 @@ $(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
 	$(call if_changed,create_randstruct_seed)
 
 always-$(CONFIG_RANDSTRUCT) += randstruct.seed randstruct_hash.h
+
+# integer-wrap: if the .scl file changes, we need to do a full rebuild.
+quiet_cmd_integer_wrap_updated = UPDATE  $@
+      cmd_integer_wrap_updated = echo '/* $^ */' > $(obj)/integer-wrap.h
+
+$(obj)/integer-wrap.h: $(srctree)/scripts/integer-wrap-ignore.scl FORCE
+	$(call if_changed,integer_wrap_updated)
+
+always-$(CONFIG_UBSAN_INTEGER_WRAP) += integer-wrap.h
-- 
2.34.1


