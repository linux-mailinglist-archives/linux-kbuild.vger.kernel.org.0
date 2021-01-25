Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07764302D00
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 21:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732148AbhAYUxa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 15:53:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28708 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726648AbhAYUns (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 15:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611607341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZgDCZSeGhmRWWHT5vzy2jb80PxnR6l3Ybnpj6nBPRRM=;
        b=Tspy7zkrs7mBKrZOOHw8cC/HRAeL4eFq40ciOPeYRyFFOSprOfSA3jtFpdHZ7SycgoOwWE
        dlJkK3SZXqx2PW4DTHMWE5N+f77MNc2XLgvbs5/Ix8wqX2BtD1dvljsIm5WPYk5+Vc/qQI
        FmlBzI+Gss283+bkZKTS1J6sAXG/0RQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-9rCtESvLMP-ekps1qOjHfQ-1; Mon, 25 Jan 2021 15:42:19 -0500
X-MC-Unique: 9rCtESvLMP-ekps1qOjHfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F3EB800592;
        Mon, 25 Jan 2021 20:42:18 +0000 (UTC)
Received: from treble.redhat.com (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F39576F44E;
        Mon, 25 Jan 2021 20:42:16 +0000 (UTC)
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
Date:   Mon, 25 Jan 2021 14:42:10 -0600
Message-Id: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building out-of-tree kernel modules, the build system doesn't
require the GCC version to match the version used to build the original
kernel.  That's probably [1] fine.

In fact, for many distros, the version of GCC used to build the latest
kernel doesn't necessarily match the latest released GCC, so a GCC
mismatch turns out to be pretty common.  And with CONFIG_MODVERSIONS
it's probably more common.

So a lot of users have come to rely on being able to use a different
version of GCC when building OOT modules.

But with GCC plugins enabled, that's no longer allowed:

  cc1: error: incompatible gcc/plugin versions
  cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so

That error comes from the plugin's call to
plugin_default_version_check(), which strictly enforces the GCC version.
The strict check makes sense, because there's nothing to prevent the GCC
plugin ABI from changing -- and it often does.

But failing the build isn't necessary.  For most plugins, OOT modules
will otherwise work just fine without the plugin instrumentation.

When a GCC version mismatch is detected, print a warning and disable the
plugin.  The only exception is the RANDSTRUCT plugin which needs all
code to see the same struct layouts.  In that case print an error.

[1] Ignoring, for the moment, that the kernel now has
    toolchain-dependent kconfig options, which can silently disable
    features and cause havoc when compiler versions differ, or even when
    certain libraries are missing.  This is a separate problem which
    also needs to be addressed.

Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 scripts/Makefile.gcc-plugins | 19 +++++++++++++++++++
 scripts/Makefile.kcov        | 11 +++++++++++
 2 files changed, 30 insertions(+)

diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 952e46876329..7227692fba59 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -51,6 +51,25 @@ export DISABLE_ARM_SSP_PER_TASK_PLUGIN
 GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
 # The sancov_plugin.so is included via CFLAGS_KCOV, so it is removed here.
 GCC_PLUGINS_CFLAGS := $(filter-out %/sancov_plugin.so, $(GCC_PLUGINS_CFLAGS))
+
+# Out-of-tree module check: If there's a GCC version mismatch, disable plugins
+# and print a warning.  Otherwise the OOT module build will fail due to
+# plugin_default_version_check().
+ifneq ($(GCC_PLUGINS_CFLAGS),)
+    ifneq ($(KBUILD_EXTMOD),)
+        ifneq ($(CONFIG_GCC_VERSION), $(shell $(srctree)/scripts/gcc-version.sh $(HOSTCXX)))
+
+            ifdef CONFIG_GCC_PLUGIN_RANDSTRUCT
+                $(error error: CONFIG_GCC_PLUGIN_RANDSTRUCT requires out-of-tree modules to be built using the same GCC version as the kernel.)
+            endif
+
+            $(warning warning: Disabling GCC plugins for out-of-tree modules due to GCC version mismatch.)
+            $(warning warning: The following plugins have been disabled: $(gcc-plugin-y))
+            GCC_PLUGINS_CFLAGS :=
+	endif
+    endif
+endif
+
 export GCC_PLUGINS_CFLAGS
 
 # Add the flags to the build!
diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67e8cfe3474b..63a2bc2aabb2 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -3,4 +3,15 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
 
+# Out-of-tree module check for GCC version mismatch.
+# See the similar check in scripts/Makefile.gcc-plugins
+ifneq ($(CONFIG_GCC_PLUGIN_SANCOV),)
+    ifneq ($(KBUILD_EXTMOD),)
+        ifneq ($(CONFIG_GCC_VERSION), $(shell $(srctree)/scripts/gcc-version.sh $(HOSTCXX)))
+            $(warning warning: Disabling CONFIG_GCC_PLUGIN_SANCOV for out-of-tree modules due to GCC version mismatch.)
+            kcov-flags-y := $(filter-out %/sancov_plugin.so, $(kcov-flags-y))
+        endif
+    endif
+endif
+
 export CFLAGS_KCOV := $(kcov-flags-y)
-- 
2.29.2

