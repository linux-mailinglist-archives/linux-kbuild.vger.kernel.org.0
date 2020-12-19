Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD52C2DF113
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Dec 2020 19:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgLSSlC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Dec 2020 13:41:02 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:53113 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgLSSlB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 13:41:01 -0500
Received: from grover.flets-west.jp (softbank126090214151.bbtec.net [126.90.214.151]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 0BJIdHYR000742;
        Sun, 20 Dec 2020 03:39:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0BJIdHYR000742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608403158;
        bh=9EIh4HZRK+rRK1kW5rgDbqNLvdcmDjAI8StlrS+ZySY=;
        h=From:To:Cc:Subject:Date:From;
        b=Kp/kwqHMvQuwqg2GzjiKB0+0TpZtqseK44IIyLFRj4HabKLmsAfrcjLUJ5IYxessF
         CFS561oKhUSv7qwvwXKFK0x7qs9kgvIgiGCkbKmZSdpaTPoZlu3CwH2rRqNbWTj7/S
         CtH7NMd0KanhB9uuPL5eZ2W6TJtk3G/fVDNOj2uwZsA01Ry3d31/zp62HFcEBS6PQN
         us5Vf3GVwFzxl31oRP9vBqYXLCVjx9s9ubOrM1/D8ac9Ad4PVuXN8bx9qQuBVXOAHc
         vIB+s+UdjFHWjs15Plmx7Wl2E98uN20mF+48cDp34YyM1tBMJ0Sj7QYUtu+EtodlgQ
         AYl5gKkNjqbdg==
X-Nifty-SrcIP: [126.90.214.151]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "kbuild: avoid static_assert for genksyms"
Date:   Sun, 20 Dec 2020 03:39:10 +0900
Message-Id: <20201219183911.181442-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit 14dc3983b5dff513a90bd5a8cc90acaf7867c3d0.

Macro Elver had sent a fix proper fix earlier, and also pointed out
corner cases:

"I guess what you propose is simpler, but might still have corner cases
where we still get warnings. In particular, if some file (for whatever
reason) does not include build_bug.h and uses a raw _Static_assert(),
then we still get warnings. E.g. I see 1 user of raw _Static_assert()
(drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h )."

I believe the raw use of _Static_assert() should be allowed, so this
should be fixed in genksyms.

Even after commit 14dc3983b5df ("kbuild: avoid static_assert for
genksyms"), I confirmed the following test code emits the warning.

  ---------------->8----------------
  #include <linux/export.h>

  _Static_assert((1 ?: 0), "");

  void foo(void) { }
  EXPORT_SYMBOL(foo);
  ---------------->8----------------

  WARNING: modpost: EXPORT symbol "foo" [vmlinux] version generation failed, symbol will not be versioned.

Now that commit 869b91992bce ("genksyms: Ignore module scoped
_Static_assert()") fixed this issue properly, the workaround should
be reverted.

Link: https://lkml.org/lkml/2020/12/10/845
Cc: Marco Elver <elver@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

I will apply this after Macro's patch is pulled.



 include/linux/build_bug.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/build_bug.h b/include/linux/build_bug.h
index 7bb66e15b481..e3a0be2c90ad 100644
--- a/include/linux/build_bug.h
+++ b/include/linux/build_bug.h
@@ -77,9 +77,4 @@
 #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
 #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
 
-#ifdef __GENKSYMS__
-/* genksyms gets confused by _Static_assert */
-#define _Static_assert(expr, ...)
-#endif
-
 #endif	/* _LINUX_BUILD_BUG_H */
-- 
2.27.0

