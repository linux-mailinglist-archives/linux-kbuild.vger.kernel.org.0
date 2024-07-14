Return-Path: <linux-kbuild+bounces-2508-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7DC930AE8
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 19:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69588B20EA8
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jul 2024 17:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FEB13BC03;
	Sun, 14 Jul 2024 17:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQoJrb9a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D131E494;
	Sun, 14 Jul 2024 17:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720976943; cv=none; b=m5w972iwdKkaoJ/UP/T/oIEWoy+O7QPMWcWlyZvm/jVdR9zsbO1xhCZuu/m4Pq3i9TfqHp8CitKBw/txL5rrgzjOcN2pZDWLGAv3hIVKF2EMl9e+wX8S/2dhGKiSTkANSYkNeHpX8nff1ac3F9G56V86fcZ1kt/9LZPH6RGmmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720976943; c=relaxed/simple;
	bh=MxRLc97aWW1jnO5G6Jndd9uzcfVljas1IZvntva/lCs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uK06dQXb2UWPsanhdIaiWW3Nz2JWEmTmrNBsyd3yGFQf//6udvhpNWNUlSKCIPdPksPgHs0S4d0tRk4HW4Pbx6dgrToin0wqYxRHgYdqntJ0686lXF1AGiBpFk7Rdqeqga0x7fq8fUgJ8JFYYyP3pu4KZejjy0qUZsSFayW5J5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQoJrb9a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31172C116B1;
	Sun, 14 Jul 2024 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720976943;
	bh=MxRLc97aWW1jnO5G6Jndd9uzcfVljas1IZvntva/lCs=;
	h=From:To:Cc:Subject:Date:From;
	b=JQoJrb9atcNILl3gxuE/+a/h+aqRk7cRcQPuS2x294rEZXNGqaEVwMlBFoyVuc9aM
	 OsJgdz1DgDAmaCfkjGSnxuJXdRE4H6aYI0571cWd5b4EwDDZkPAHQx9leTO0lm2Dqu
	 n6wi4wwXAbKyxno4h52krvbuXMW94oCxaoktW4c0g29ZQ+7JYQ2Xgxf5VyuRD/vZgS
	 Tfa0wDk62afOb5725AoLWw+/eP2tJVU0Wb95D5zkTM2hsn4qjmD6DZGxssJ5R1Tg22
	 obxBPvZ2DzOMkwplGxd/89KnFq4lLIJN7ekDlZenAYAzm6q56RAb4v6t6CdceTui4J
	 fQKViagwMmGXw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <keescook@chromium.org>,
	Marco Elver <elver@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH] fortify: fix warnings in fortify tests with KASAN
Date: Mon, 15 Jul 2024 02:04:32 +0900
Message-ID: <20240714170847.2029108-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a software KASAN mode is enabled, the fortify tests emit warnings
on some architectures.

For example, for ARCH=arm, the combination of CONFIG_FORTIFY_SOURCE=y
and CONFIG_KASAN=y produces the following warnings:

    TEST    lib/test_fortify/read_overflow-memchr.log
  warning: unsafe memchr() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memchr.c
    TEST    lib/test_fortify/read_overflow-memchr_inv.log
  warning: unsafe memchr_inv() usage lacked '__read_overflow' symbol in lib/test_fortify/read_overflow-memchr_inv.c
    TEST    lib/test_fortify/read_overflow-memcmp.log
  warning: unsafe memcmp() usage lacked '__read_overflow' warning in lib/test_fortify/read_overflow-memcmp.c
    TEST    lib/test_fortify/read_overflow-memscan.log
  warning: unsafe memscan() usage lacked '__read_overflow' symbol in lib/test_fortify/read_overflow-memscan.c
    TEST    lib/test_fortify/read_overflow2-memcmp.log
  warning: unsafe memcmp() usage lacked '__read_overflow2' warning in lib/test_fortify/read_overflow2-memcmp.c
     [ more and more similar warnings... ]

Commit 9c2d1328f88a ("kbuild: provide reasonable defaults for tool
coverage") removed KASAN flags from non-kernel objects by default.
It was an intended behavior because lib/test_fortify/*.c are unit
tests that are not linked to the kernel.

As it turns out, some architectures require -fsanitize=kernel-(hw)address
to define __SANITIZE_ADDRESS__ for the fortify tests.

Without __SANITIZE_ADDRESS__ defined, arch/arm/include/asm/string.h
defines __NO_FORTIFY, thus excluding <linux/fortify-string.h>.

This issue does not occur on x86 thanks to commit 4ec4190be4cf
("kasan, x86: don't rename memintrinsics in uninstrumented files"),
but there are still some architectures that define __NO_FORTIFY
in such a situation.

Set KASAN_SANITIZE=y explicitly to the fortify tests.

Fixes: 9c2d1328f88a ("kbuild: provide reasonable defaults for tool coverage")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Closes: https://lore.kernel.org/all/0e8dee26-41cc-41ae-9493-10cd1a8e3268@app.fastmail.com/
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Kees Cook said "I'll try to figure this out", but I have not seen a patch so far,
so I decided to do this myself.
(https://lore.kernel.org/all/202405310908.A5733DF@keescook/)

I will send a pull req with this and some other fixes.
I need to fix this, as v6.10 will be released soon.



 lib/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/Makefile b/lib/Makefile
index 3b1769045651..30337431d10e 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -426,3 +426,7 @@ $(obj)/$(TEST_FORTIFY_LOG): $(addprefix $(obj)/, $(TEST_FORTIFY_LOGS)) FORCE
 ifeq ($(CONFIG_FORTIFY_SOURCE),y)
 $(obj)/string.o: $(obj)/$(TEST_FORTIFY_LOG)
 endif
+
+# Some architectures define __NO_FORTIFY if __SANITIZE_ADDRESS__ is undefined.
+# Pass CFLAGS_KASAN to avoid warnings.
+$(foreach x, $(patsubst %.log,%.o,$(TEST_FORTIFY_LOGS)), $(eval KASAN_SANITIZE_$(x) := y))
-- 
2.43.0


