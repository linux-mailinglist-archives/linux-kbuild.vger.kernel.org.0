Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4333734709
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 14:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfFDMjv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 08:39:51 -0400
Received: from mga02.intel.com ([134.134.136.20]:34824 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727580AbfFDMjv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 08:39:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Jun 2019 05:39:50 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2019 05:39:46 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2] kbuild: add support for ensuring headers are self-contained
Date:   Tue,  4 Jun 2019 15:42:48 +0300
Message-Id: <20190604124248.5564-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604101409.2078-14-yamada.masahiro@socionext.com>
References: <20190604101409.2078-14-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Sometimes it's useful to be able to explicitly ensure certain headers
remain self-contained, i.e. that they are compilable as standalone
units, by including and/or forward declaring everything they depend on.

Add special target header-test-y where individual Makefiles can add
headers to be tested if CONFIG_HEADER_TEST is enabled. This will
generate a dummy C file per header that gets built as part of extra-y.

Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

v2: changes suggested by Masahiro:

http://mid.mail-archive.com/CAK7LNAT=nB0=at0X4OnHVKB=y7WwHGm4LXkrQnCw9HpjB5LooA@mail.gmail.com
---
 .gitignore                         | 1 +
 Documentation/dontdiff             | 1 +
 Documentation/kbuild/makefiles.txt | 7 +++++++
 Makefile                           | 1 +
 init/Kconfig                       | 9 +++++++++
 scripts/Makefile.build             | 9 +++++++++
 scripts/Makefile.lib               | 3 +++
 7 files changed, 31 insertions(+)

diff --git a/.gitignore b/.gitignore
index 7587ef56b92d..4bb60f0fa23b 100644
--- a/.gitignore
+++ b/.gitignore
@@ -22,6 +22,7 @@
 *.elf
 *.gcno
 *.gz
+*.hdrtest.c
 *.i
 *.ko
 *.lex.c
diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index 5eba889ea84d..554dfe4883d2 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -19,6 +19,7 @@
 *.grep
 *.grp
 *.gz
+*.hdrtest.c
 *.html
 *.i
 *.jpeg
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index d65ad5746f94..a31e54bd9ddd 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -1022,6 +1022,13 @@ When kbuild executes, the following steps are followed (roughly):
 	In this example, extra-y is used to list object files that
 	shall be built, but shall not be linked as part of built-in.a.
 
+    header-test-y
+
+	header-test-y specifies headers (*.h) in the current directory that
+	should be compile tested to ensure they are self-contained,
+	i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
+	this autogenerates dummy sources to include the headers, and builds them
+	as part of extra-y.
 
 --- 6.7 Commands useful for building a boot image
 
diff --git a/Makefile b/Makefile
index 11358153d8f2..b347be697fbb 100644
--- a/Makefile
+++ b/Makefile
@@ -1646,6 +1646,7 @@ clean: $(clean-dirs)
 		-o -name '*.dwo' -o -name '*.lst' \
 		-o -name '*.su'  \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
+		-o -name '*.hdrtest.c' \
 		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name '*.asn1.[ch]' \
 		-o -name '*.symtypes' -o -name 'modules.order' \
diff --git a/init/Kconfig b/init/Kconfig
index 36894c9fb420..02d8897b91fb 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -96,6 +96,15 @@ config COMPILE_TEST
 	  here. If you are a user/distributor, say N here to exclude useless
 	  drivers to be distributed.
 
+config HEADER_TEST
+	bool "Compile test headers that should be standalone compilable"
+	help
+	  Compile test headers listed in header-test-y target to ensure they are
+	  self-contained, i.e. compilable as standalone units.
+
+	  If you are a developer or tester and want to ensure the requested
+	  headers are self-contained, say Y here. Otherwise, choose N.
+
 config LOCALVERSION
 	string "Local version - append to kernel release"
 	help
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index ae9cf740633e..ee0319560513 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -294,6 +294,15 @@ quiet_cmd_cc_lst_c = MKLST   $@
 $(obj)/%.lst: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
+# Dummy C sources for header test (header-test-y target)
+# ---------------------------------------------------------------------------
+
+quiet_cmd_header_test = HDRTEST $@
+      cmd_header_test = echo "\#include \"$*.h\"" > $@
+
+$(obj)/%.hdrtest.c:
+	$(call cmd,header_test)
+
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f1f38c8cdc74..3e630fcaffd1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
 extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
+# Test self-contained headers
+extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.hdrtest.o,$(header-test-y))
+
 # Add subdir path
 
 extra-y		:= $(addprefix $(obj)/,$(extra-y))
-- 
2.20.1

