Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 612462130C
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 06:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfEQE3z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 00:29:55 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:40507 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfEQE3z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 00:29:55 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x4H4S6m7020760;
        Fri, 17 May 2019 13:28:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x4H4S6m7020760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558067287;
        bh=S6lUG5wzELNkLDTIQ5q0KxmZoKYRPjFzFvxypw0i15o=;
        h=From:To:Cc:Subject:Date:From;
        b=lmJWY92eISyiUDky3rMD3ZyuryoVjAMcuTit/WmqwC8NXp7LrdSs9SUFwZoRYBjqa
         M4wRPzpxa5JJIArOLFzLBGxR7XDpwmowRFKd7Y6f4JEhGls/6PQPSRmEGKf4onuKCk
         qiOdjy4a7x6wQyB3FZzdu2Um5sHJpjgmHYVhgLH0W38UROX5QUvbW5QqZZaO3PpsZD
         vM+R6PSpD3geAyxQxInyiolXsrDb/XLRCAd2d2QC/4Caz3cSmnWbb6KsYg4xVx8rVH
         pgfFkg1ZnlqXNNy7s7c5oVD6EaY6U+D5nuYJtD+cYMm7HP8GSF3UfXDP/pnUfYP3uH
         ckE6paHnX6XpA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: check uniqueness of module names
Date:   Fri, 17 May 2019 13:27:53 +0900
Message-Id: <20190517042753.25857-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
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
---

Changes in v2:
 - redirect messages to stderr
 - use '--' after 'basename -a'
 - use '-r' for xargs to cope with empty modules.order/modules.builtin

 Makefile                 |  1 +
 scripts/modules-check.sh | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100755 scripts/modules-check.sh

diff --git a/Makefile b/Makefile
index a61a95b6b38f..30792fec7a12 100644
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
index 000000000000..c875f6eab01e
--- /dev/null
+++ b/scripts/modules-check.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+# Check uniqueness of module names
+check_same_name_modules()
+{
+	same_name_modules=$(cat modules.order modules.builtin | \
+				xargs -r basename -a -- | sort | uniq -d)
+
+	for m in $same_name_modules
+	do
+		echo "warning: same basename if the following are built as modules:" >&2
+		grep -h -e "/$m" modules.order modules.builtin | \
+						sed 's:^kernel/:  :' >&2
+	done
+}
+
+check_same_name_modules
-- 
2.17.1

