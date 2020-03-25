Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00657191F9B
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 04:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgCYDPh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 23:15:37 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:48675 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgCYDPh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 23:15:37 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02P3EoCx025927;
        Wed, 25 Mar 2020 12:14:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02P3EoCx025927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585106092;
        bh=cgsIqWqugMjz8HN6+lxwzq+uunzWFHXqk0J7yNJ3uGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AxIyTfduvH5EL0D4ELrczuAbTkEw+h/281HSvn4KmAckOS9onjIlDYuzphTOAe2lm
         ZXhgen488xporCpvw0MiSjNyXnhF+h1nVU8mLVC0RmvfLTyToyvhcOh+BKY+G9+4Xx
         Ryf1y3+g4mMnlB+zrYuv/O6juACAjDVuSqFwGZAxG1U2JlMIKvq1mRRz/YL9YX83Oc
         y94dpFAap5NRspesnE3EEUstyT78StGRe5Vl6mmprqf47FB13vNZXhxyU2iBJqfQzb
         vfP70xBwyZkaDkBAvltd/Cd+Ea25kQW1ma/+KYwqyvuVj7pvOxSbUUT4Ej//+P8WnY
         9OPilZGNKzJdw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        kernel-hardening@lists.openwall.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: add -Wall to KBUILD_HOSTCXXFLAGS
Date:   Wed, 25 Mar 2020 12:14:32 +0900
Message-Id: <20200325031433.28223-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325031433.28223-1-masahiroy@kernel.org>
References: <20200325031433.28223-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add -Wall to catch more warnings for C++ host programs.

When I submitted the previous version, the 0-day bot reported
-Wc++11-compat warnings for old GCC:

  HOSTCXX -fPIC scripts/gcc-plugins/latent_entropy_plugin.o
In file included from /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/tm.h:28:0,
                 from scripts/gcc-plugins/gcc-common.h:15,
                 from scripts/gcc-plugins/latent_entropy_plugin.c:78:
/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/config/elfos.h:102:21: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
                     ^
/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/config/elfos.h:170:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
                        ^
In file included from /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/tm.h:42:0,
                 from scripts/gcc-plugins/gcc-common.h:15,
                 from scripts/gcc-plugins/latent_entropy_plugin.c:78:
/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/defaults.h:126:24: warning: C++11 requires a space between string literal and macro [-Wc++11-compat]
       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",  \
                        ^

The source of the warnings is in the plugin headers, so we have no
control of it. I just suppressed them by adding -Wno-c++11-compat to
scripts/gcc-plugins/Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                     | 2 +-
 scripts/gcc-plugins/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 3b57ccab367b..593d8f1bbe90 100644
--- a/Makefile
+++ b/Makefile
@@ -400,7 +400,7 @@ HOSTCXX      = g++
 KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
 		$(HOSTCFLAGS)
-KBUILD_HOSTCXXFLAGS := -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
+KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
 KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index f2ee8bd7abc6..efff00959a9c 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -10,7 +10,7 @@ else
   HOSTLIBS := hostcxxlibs
   HOST_EXTRACXXFLAGS += -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=gnu++98 -fno-rtti
   HOST_EXTRACXXFLAGS += -fno-exceptions -fasynchronous-unwind-tables -ggdb
-  HOST_EXTRACXXFLAGS += -Wno-narrowing -Wno-unused-variable
+  HOST_EXTRACXXFLAGS += -Wno-narrowing -Wno-unused-variable -Wno-c++11-compat
   export HOST_EXTRACXXFLAGS
 endif
 
-- 
2.17.1

