Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8030F21B2A
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 18:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbfEQQKE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 12:10:04 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:58837 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbfEQQKE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 12:10:04 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x4HG7US3006312;
        Sat, 18 May 2019 01:07:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x4HG7US3006312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558109251;
        bh=KvvGD13sSEkabVZlqCDEfHGHyy3N71YktjZRCjCmt8c=;
        h=From:To:Cc:Subject:Date:From;
        b=EdtEN/ASXyFVDslvp+QeBtvFo3NtuxHuv/qoNBnA1EJArY9I8QHWn4EQDLd+2rv8H
         DdvLOX56xvQxEm+jseJ8UR+7GEkunJtGPMFYzODjXkem0o+UAJRgv78/2+5MPVYjjP
         DHR/0WdWHnYq2v4uWvlibI1251Z6SQ5ddARPSuI3WnPXHEw4MfdljtpFJkObcu/5F/
         VLUVJ6JSiEsNSqMN5KZf+FWKFlprwwVF9OUb8TaOWZQuQYJiSIv3RwD6eu9N1gDElm
         M4zJBB3uEjUldAsVLGPD9dQOyJ2IlBBiFI9SIvKg+CRdf0LRYKBD0VdCp2+C0lQhek
         sSI4eQaer0xxw==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
        Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] kbuild: check uniqueness of module names
Date:   Sat, 18 May 2019 01:07:15 +0900
Message-Id: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In the recent build test of linux-next, Stephen saw a build error
caused by a broken .tmp_versions/*.mod file:

  https://lkml.org/lkml/2019/5/13/991

drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
basename, and there is a race in generating .tmp_versions/asix.mod

Kbuild has not checked this before, and it suddenly shows up with
obscure error message when this kind of race occurs.

Non-unique module names cause various sort of problems, but it is
not trivial to catch them by eyes.

Hence, this script.

It checks not only real modules, but also built-in modules (i.e.
controlled by tristate CONFIG option, but currently compiled with =y).
Non-unique names for built-in modules also cause problems because
/sys/modules/ would fall over.

I tested allmodconfig on the latest kernel, and it detected the
following:

warning: same basename if the following are built as modules:
  drivers/regulator/88pm800.ko
  drivers/mfd/88pm800.ko
warning: same basename if the following are built as modules:
  drivers/gpu/drm/bridge/adv7511/adv7511.ko
  drivers/media/i2c/adv7511.ko
warning: same basename if the following are built as modules:
  drivers/net/phy/asix.ko
  drivers/net/usb/asix.ko
warning: same basename if the following are built as modules:
  fs/coda/coda.ko
  drivers/media/platform/coda/coda.ko
warning: same basename if the following are built as modules:
  drivers/net/phy/realtek.ko
  drivers/net/dsa/realtek.ko

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

Changes in v3:
 - Simplied sed code (Alexander Kapshuk)

Changes in v2:
 - redirect messages to stderr
 - use '--' after 'basename -a'
 - use '-r' for xargs to cope with empty modules.order/modules.builtin

 Makefile                 |  1 +
 scripts/modules-check.sh | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100755 scripts/modules-check.sh

diff --git a/Makefile b/Makefile
index a61a95b..30792fe 100644
--- a/Makefile
+++ b/Makefile
@@ -1290,6 +1290,7 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
 	$(Q)$(AWK) '!x[$$0]++' $(vmlinux-dirs:%=$(objtree)/%/modules.order) > $(objtree)/modules.order
 	@$(kecho) '  Building modules, stage 2.';
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
 modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
 	$(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
new file mode 100755
index 0000000..2f65953
--- /dev/null
+++ b/scripts/modules-check.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+# Check uniqueness of module names
+check_same_name_modules()
+{
+	for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
+	do
+		echo "warning: same basename if the following are built as modules:" >&2
+		sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
+	done
+}
+
+check_same_name_modules
-- 
2.7.4

