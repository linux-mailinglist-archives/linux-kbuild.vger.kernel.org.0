Return-Path: <linux-kbuild+bounces-6842-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73BAA643E
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 21:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E62351BA7251
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 19:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C887323505B;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoaU0ply"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B222201034;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746128909; cv=none; b=jQqqvc30TqyuYStnOko1cynmxdpp1YCg84m4dlx4wLzAYIznsWTG2RM05nqkam7Vy6+SqlVQEHW8is9fsK76mdF7CRap6tV6ziSKyjD+O9t+suJ+GAAX8x7DDk7lvjqqPY1DgM4BZp4xe66rf9MOgsvYT0Gm+TkX4g+hAoaBZFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746128909; c=relaxed/simple;
	bh=8LFYhUOk2+Lg4KhiXXk+lmCuulr10jRLqqlaJXRzOrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aQtpivkxpd/Ia8SeBQqaFQ6EeFl6ISPNhzz5vhsIPndOHRj6aGi3ND1Sy8grntzG4/ZQYjyFEMWr/K74bnK97E9JEa8t/ozmJ+UUHay42p3TGrdlPQcPTknWH3N+oPYD5k/FiZG3opm8sc7narylkkOlK9MZw6N3KycsONUHp5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoaU0ply; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1646DC4CEE3;
	Thu,  1 May 2025 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746128909;
	bh=8LFYhUOk2+Lg4KhiXXk+lmCuulr10jRLqqlaJXRzOrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OoaU0ply0zZoLW19x2S5w/vOr9gMBxBZvZWYEy+zdy9ynwqc1RJ6slmlbpJHvXmUX
	 UjDWsOVqy2jCTr0Gk5vsO4BshJuz7Xsd1gIjx5OzY55M5IVbvUOnQEj3XOvZl/6Ecj
	 U2WdBTd4AewUdvU9M4k82Ia56Q8qokJ+IGBGK5DYrSBNuJyrP2N1PUZPfAZiEpcgZC
	 MrL9OlrhBdR15+apQWo8S/nkoUOOHRtYAh9LVnK6Pp2hKkrIQqLtqDFAmcenq6MrZC
	 LwRpTv7DYJYFtmXxgN1Z5Y7rd7Y+PP03GzBDUverxD73IZIv1bnMqzEs04HZz9pqzk
	 ZT/6OI+kFC5CQ==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: [PATCH 2/3] randstruct: Force full rebuild when seed changes
Date: Thu,  1 May 2025 12:48:17 -0700
Message-Id: <20250501194826.2947101-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250501193839.work.525-kees@kernel.org>
References: <20250501193839.work.525-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2614; i=kees@kernel.org; h=from:subject; bh=8LFYhUOk2+Lg4KhiXXk+lmCuulr10jRLqqlaJXRzOrE=; b=owGbwMvMwCVmps19z/KJym7G02pJDBnCFxilL1bpJjfMsursvPHsZVvOgY2/T2osYPuZcVu/O /PSkVNKHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABN5cI/hf8CtpJVxv4zKS3pC 1uSt7nzgcupuV5KsK3NNik/hmpKEOYwMk75s22Rhal9opsopI2+uzPizQo7lAu8EFdad2Z2Pq83 YAQ==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

While the randstruct GCC plugin was being rebuilt if the randstruct
seed changed, Clangs build did not notice the change. Include the hash
header directly so that it becomes a universal build dependency and full
rebuilds will happen if it changes.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: <linux-kbuild@vger.kernel.org>
---
 include/linux/vermagic.h    |  1 -
 scripts/Makefile.randstruct |  3 ++-
 scripts/basic/Makefile      | 11 ++++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
index 939ceabcaf06..335c360d4f9b 100644
--- a/include/linux/vermagic.h
+++ b/include/linux/vermagic.h
@@ -33,7 +33,6 @@
 #define MODULE_VERMAGIC_MODVERSIONS ""
 #endif
 #ifdef RANDSTRUCT
-#include <generated/randstruct_hash.h>
 #define MODULE_RANDSTRUCT "RANDSTRUCT_" RANDSTRUCT_HASHED_SEED
 #else
 #define MODULE_RANDSTRUCT
diff --git a/scripts/Makefile.randstruct b/scripts/Makefile.randstruct
index 24e283e89893..ab87219c6149 100644
--- a/scripts/Makefile.randstruct
+++ b/scripts/Makefile.randstruct
@@ -12,6 +12,7 @@ randstruct-cflags-y	\
 	+= -frandomize-layout-seed-file=$(objtree)/scripts/basic/randstruct.seed
 endif
 
-export RANDSTRUCT_CFLAGS := $(randstruct-cflags-y)
+export RANDSTRUCT_CFLAGS := $(randstruct-cflags-y) \
+			    -include $(objtree)/scripts/basic/randstruct_hash.h
 
 KBUILD_CFLAGS	+= $(RANDSTRUCT_CFLAGS)
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index dd289a6725ac..31637ce4dc5c 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -8,9 +8,10 @@ hostprogs-always-y	+= fixdep
 # before running a Clang kernel build.
 gen-randstruct-seed	:= $(srctree)/scripts/gen-randstruct-seed.sh
 quiet_cmd_create_randstruct_seed = GENSEED $@
-cmd_create_randstruct_seed = \
-	$(CONFIG_SHELL) $(gen-randstruct-seed) \
-		$@ $(objtree)/include/generated/randstruct_hash.h
-$(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
+      cmd_create_randstruct_seed = $(CONFIG_SHELL) $(gen-randstruct-seed) \
+		$(obj)/randstruct.seed $(obj)/randstruct_hash.h
+
+$(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
 	$(call if_changed,create_randstruct_seed)
-always-$(CONFIG_RANDSTRUCT) += randstruct.seed
+
+always-$(CONFIG_RANDSTRUCT) += randstruct.seed randstruct_hash.h
-- 
2.34.1


