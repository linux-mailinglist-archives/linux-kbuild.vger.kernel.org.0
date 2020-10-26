Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B801299943
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 23:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391687AbgJZWDi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 18:03:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:57336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391677AbgJZWDi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 18:03:38 -0400
Received: from localhost.localdomain (unknown [192.30.34.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D45A920706;
        Mon, 26 Oct 2020 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603749818;
        bh=DmLwsZj6EZcsnvLvDgbYr67ECzrC3Drdxf44wh+PWU4=;
        h=From:To:Cc:Subject:Date:From;
        b=YjBffOju/ndKBxhoedC7FHK5JkIWSgILcO/YbiQJSmHy9RvzpB+n+R2XJKJIG6Rx0
         knCAa2qhaOci5aYTGmd6qndbf+0vuFy8s7Lxb7PZGRMzLBP0iJxgwNlMJA4f/3mMUo
         rGBdxy05ErPFDzMYX5O3qkWQpizQ9sFK8S6w3Vgo=
From:   Arnd Bergmann <arnd@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 1/2] Makefile.extrawarn: move -Wcast-align to W=3
Date:   Mon, 26 Oct 2020 23:03:13 +0100
Message-Id: <20201026220331.3896226-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

This warning behaves differently depending on the architecture
and compiler. Using x86 gcc, we get no output at all because
gcc knows the architecture can handle unaligned accesses.

Using x86 clang, or gcc on an architecture that needs to
manually deal with unaligned accesses, the build log is
completely flooded with these warnings, as they are commonly
invoked by inline functions of networking headers, e.g.

include/linux/skbuff.h:1426:26: warning: cast increases required alignment of target type [-Wcast-align]

The compiler is correct to point this out, as we are dealing
with undefined behavior that does cause problems in practice,
but there is also no good way to rewrite the code in commonly
included headers to a safer method.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.extrawarn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 95e4cdb94fe9..6baee1200615 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -60,7 +60,6 @@ endif
 #
 ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
 
-KBUILD_CFLAGS += -Wcast-align
 KBUILD_CFLAGS += -Wdisabled-optimization
 KBUILD_CFLAGS += -Wnested-externs
 KBUILD_CFLAGS += -Wshadow
@@ -80,6 +79,7 @@ endif
 ifneq ($(findstring 3, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wbad-function-cast
+KBUILD_CFLAGS += -Wcast-align
 KBUILD_CFLAGS += -Wcast-qual
 KBUILD_CFLAGS += -Wconversion
 KBUILD_CFLAGS += -Wpacked
-- 
2.27.0

