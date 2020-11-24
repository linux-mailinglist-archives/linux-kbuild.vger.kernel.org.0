Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C15C2C2BA5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 16:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389788AbgKXPnp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 10:43:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:45420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388337AbgKXPno (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 10:43:44 -0500
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44AD0206FB;
        Tue, 24 Nov 2020 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606232624;
        bh=1hK4kNfOK501rKtMxoTeLGsdYaMpKUMPPmYoUz5Kya0=;
        h=From:To:Cc:Subject:Date:From;
        b=cmmgKB+cCUGt1UqNGEJ+JIFtQ8MIcYONJhF0TrXFS2dIme6DBoZrX+YJzQXa6rzWR
         L4wUDUmqKja5WxI7o5H2dPehP9VQV32MPOzdM5sl2+WO6Gxt8u4MuO7VsjCwE7qkss
         xZ8EAq95bA2/S//437viajyg0YV1nzcXkFDQzUr8=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH] Makefile.extrawarn: remove -Wnested-externs warning
Date:   Tue, 24 Nov 2020 16:43:17 +0100
Message-Id: <20201124154339.173752-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The -Wnested-externs warning has become useless with gcc, since
this warns every time that BUILD_BUG_ON() or similar macros
are used.

With clang, the warning option does nothing to start with, so
just remove it entirely.

Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 6baee1200615..d53825503874 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -61,7 +61,6 @@ endif
 ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wdisabled-optimization
-KBUILD_CFLAGS += -Wnested-externs
 KBUILD_CFLAGS += -Wshadow
 KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
-- 
2.27.0

