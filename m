Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A1B299946
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 23:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391776AbgJZWDy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 18:03:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391763AbgJZWDx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 18:03:53 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9D5BF20706;
        Mon, 26 Oct 2020 22:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603749832;
        bh=mZA155bDOUr6xE6zOwjLW4uXm7Jxh/NAZ+oFR/xBspM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SOi3aCf7R2Q877PaaGvAQEYVlU4kW46/FX7+85kQQbasAyM7LG0YLn8VBiD394wHf
         MgRskRIgBsPawQZZ0QSXVci31gg91cO1i5TFNc8g20aElXBOBsJUqhkwOkkB90mqT6
         qJRw4c7p+m1D99VGc1pkliJyB5RXSMsHBz06T8ag=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 2/2] Makefile.extrawarn: limit -Wnested-externs to clang
Date:   Mon, 26 Oct 2020 23:03:14 +0100
Message-Id: <20201026220331.3896226-2-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201026220331.3896226-1-arnd@kernel.org>
References: <20201026220331.3896226-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The -Wnested-externs warning has become useless with gcc, since
this warns every time that BUILD_BUG_ON() or similar macros
are used.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.extrawarn | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 6baee1200615..9406f752e355 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -61,7 +61,10 @@ endif
 ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wdisabled-optimization
+ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wnested-externs
+endif
+
 KBUILD_CFLAGS += -Wshadow
 KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
-- 
2.27.0

