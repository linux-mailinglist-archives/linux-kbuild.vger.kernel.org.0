Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 711DF6ED3DA
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Apr 2023 19:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjDXRq5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Apr 2023 13:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjDXRq5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2023 13:46:57 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3C4E9
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2023 10:46:54 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 26689218D6
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2023 17:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1682358413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type;
        bh=0Xn1uT17cEmjgnWq6XOzx2+3VncuOSwoIq1e0FPNZDE=;
        b=IR58HqseossuHn6qgotbVSUhyPNhTq4ZCDXZ6wVj80CqfQP6Q+dKAcP5olq9y/RG08YpKQ
        URc2wSOhQGOFc9Dw5VW5RnU80tS1IcpI/3dgrT7YFwkn+5tEIW2pfx409JMjGEKwJ9GqZY
        GrvJp7wg90wMcdIQy+x2RynfWpIG/Sc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1682358413;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type;
        bh=0Xn1uT17cEmjgnWq6XOzx2+3VncuOSwoIq1e0FPNZDE=;
        b=V+LhdCtTfqqgTWJTPW5Sqo+li/48qiCU2GET0k6EyuDx0jBkKdIsoH0g8dh5beoDxB4KFY
        Ve9H4C146sj5fUCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A243613780
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2023 17:46:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id McvZGYzARmTiNgAAMHmgww
        (envelope-from <mpdesouza@suse.com>)
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Apr 2023 17:46:52 +0000
Date:   Mon, 24 Apr 2023 14:46:50 -0300
From:   Marcos Paulo de Souza <mpdesouza@suse.de>
To:     linux-kbuild@vger.kernel.org
Subject: Question: Adding new kselftest mod build rule resulting on "m2c:
 command not found"
Message-ID: <rgbi7vgqel5f2vtzeuxykeh7civd6xxbxkohsgwgsond3vwbbv@hebfs24hxzir>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="pyfwqlfq3a7hxxti"
Content-Disposition: inline
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--pyfwqlfq3a7hxxti
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I've being trying to understand a problem when adding a new rule to compile
modules on ksefltests:

$ make kselftest TARGETS=livepatch
make[2]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make[3]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
make -C /home/mpdesouza/git/linux M=/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules modules
m2c    -o scripts/Makefile.build -e scripts/Makefile.build scripts/Makefile.build.mod
make[5]: m2c: No such file or directory

I managed to create a minimal reproducer for the problem here[1]. I'll attach
the patches at the end of the email if you want to inspect the changes without
getting the patches from github.

The curious part is, if I execute the ksefltests using a different target, it
works:

$ make -C tools/testing/selftests run_tests TARGETS=livepatch
make: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests'
make[1]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make -C /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules
make[2]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
make -C /home/mpdesouza/git/linux M=/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules modules
  CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.o
  MODPOST /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/Module.symvers
  CC [M]  /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.mod.o
  LD [M]  /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.ko
  BTF [M] /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules/mod_test.ko
make[2]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
make[1]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make[1]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make -C /home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules
make[2]: Entering directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
make -C /home/mpdesouza/git/linux M=/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules modules
make[2]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch/test_modules'
TAP version 13
1..1
# selftests: livepatch: test-true.sh
ok 1 selftests: livepatch: test-true.sh
make[1]: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests/livepatch'
make: Leaving directory '/home/mpdesouza/git/linux/tools/testing/selftests'

In the root Makefile, ksefltest is defined as:

PHONY += kselftest
kselftest: headers
        $(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests

So, it's quite odd that a "mostly identical" rules being triggered result in
that odd "m2c" command being invoked. Both outputs here were got from a openSUSE
Tumbleweed machine, using make 4.4.1. When executing the kselftest target on a
Ubuntu machine, the error is similar but not the same:

...
make[4]: Entering directory '/root/linux-kbuild'
make -f ./scripts/Makefile.build obj=arch/x86/entry/syscalls all
m2c    -o scripts/Makefile.lib -e scripts/Makefile.lib scripts/Makefile.lib.mod
make[5]: m2c: No such file or directory
make[5]: *** [<builtin>: scripts/Makefile.lib] Error 127
make[4]: *** [arch/x86/Makefile:248: archheaders] Error 2
...

So, error is the same, but it failed on Makefile.lib, instead of Makefile.build
from the previous run.

I also tried to change the KDIR from
tools/testing/selftests/livepatch/test_modules/Makefile to point to KDIR ?=
/lib/modules/$(shell uname -r)/build, but it then results in a different
problem, making building_out_of_srctree to be set to false on
/usr/src/linux-6.2.10-1-obj/x86_64/default/Makefile, which then results in
different problems... So I would like to understand this problem first, since
there was no way to stop make from calling "m2c". It was also tested on
linux-kbuild/for-next, but the problem is the same.

I also found some links[2] mentioning "m2c", but the workarounds didn't solved
the issue. At this point any help would be great!

[1]: https://github.com/marcosps/linux/commits/kbuild-next-kselftests
[2]: https://lists.mcs.anl.gov/pipermail/petsc-users/2010-November/007299.html

--pyfwqlfq3a7hxxti
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-kselftests-lib.mk-Add-TEST_GEN_MODS_DIR-variable.patch"

From 7fce0614e9399083596415c9e2cd446e46ec5cf8 Mon Sep 17 00:00:00 2001
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 14 Apr 2023 15:05:08 -0300
Subject: [PATCH 1/2] kselftests: lib.mk: Add TEST_GEN_MODS_DIR variable

This new variable can be set by selftests to point to a directory where
exists modules to be built and tested.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/lib.mk | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 05400462c779..978d7780cc03 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -57,8 +57,16 @@ endif
 TEST_GEN_PROGS := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS))
 TEST_GEN_PROGS_EXTENDED := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_PROGS_EXTENDED))
 TEST_GEN_FILES := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_FILES))
+TEST_GEN_MODS_DIR := $(patsubst %,$(OUTPUT)/%,$(TEST_GEN_MODS_DIR))
 
-all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES)
+gen_mods_dir:
+	$(Q)$(MAKE) -C $(TEST_GEN_MODS_DIR)
+
+clean_mods_dir:
+	$(Q)$(MAKE) -C $(TEST_GEN_MODS_DIR) clean
+
+all: $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES) \
+	$(if $TEST_GEN_MODS_DIR, gen_mods_dir)
 
 define RUN_TESTS
 	BASE_DIR="$(selfdir)";			\
@@ -71,8 +79,8 @@ endef
 
 run_tests: all
 ifdef building_out_of_srctree
-	@if [ "X$(TEST_PROGS)$(TEST_PROGS_EXTENDED)$(TEST_FILES)" != "X" ]; then \
-		rsync -aLq $(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES) $(OUTPUT); \
+	@if [ "X$(TEST_PROGS)$(TEST_PROGS_EXTENDED)$(TEST_FILES)$(TEST_GEN_MODS_DIR)" != "X" ]; then \
+		rsync -aLq $(TEST_PROGS) $(TEST_PROGS_EXTENDED) $(TEST_FILES) $(TEST_GEN_MODS_DIR) $(OUTPUT); \
 	fi
 	@if [ "X$(TEST_PROGS)" != "X" ]; then \
 		$(call RUN_TESTS, $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) \
@@ -122,7 +130,7 @@ define CLEAN
 	$(RM) -r $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED) $(TEST_GEN_FILES) $(EXTRA_CLEAN)
 endef
 
-clean:
+clean: $(if $TEST_GEN_MODS_DIR, clean_mods_dir)
 	$(CLEAN)
 
 # Enables to extend CFLAGS and LDFLAGS from command line, e.g.
@@ -153,4 +161,4 @@ $(OUTPUT)/%:%.S
 	$(LINK.S) $^ $(LDLIBS) -o $@
 endif
 
-.PHONY: run_tests all clean install emit_tests
+.PHONY: run_tests all clean install emit_tests gen_mods_dir
-- 
2.40.0


--pyfwqlfq3a7hxxti
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment;
	filename="0002-easily-test-mods-building-for-kselftests.patch"

From 5ac1d2d3e7e66bfe58094f00029fc4ba15555d10 Mon Sep 17 00:00:00 2001
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Thu, 20 Apr 2023 11:51:29 -0300
Subject: [PATCH 2/2] easily test mods building for kselftests

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 tools/testing/selftests/livepatch/Makefile        |  8 ++------
 tools/testing/selftests/livepatch/test-true.sh    |  3 +++
 .../selftests/livepatch/test_modules/Makefile     | 11 +++++++++++
 .../selftests/livepatch/test_modules/mod_test.c   | 15 +++++++++++++++
 4 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100755 tools/testing/selftests/livepatch/test-true.sh
 create mode 100644 tools/testing/selftests/livepatch/test_modules/Makefile
 create mode 100644 tools/testing/selftests/livepatch/test_modules/mod_test.c

diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
index 02fadc9d55e0..bfe048f6a65d 100644
--- a/tools/testing/selftests/livepatch/Makefile
+++ b/tools/testing/selftests/livepatch/Makefile
@@ -1,13 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
+TEST_GEN_MODS_DIR := test_modules
 TEST_PROGS_EXTENDED := functions.sh
 TEST_PROGS := \
-	test-livepatch.sh \
-	test-callbacks.sh \
-	test-shadow-vars.sh \
-	test-state.sh \
-	test-ftrace.sh \
-	test-sysfs.sh
+	test-true.sh
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/livepatch/test-true.sh b/tools/testing/selftests/livepatch/test-true.sh
new file mode 100755
index 000000000000..8c3cbfc39d94
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test-true.sh
@@ -0,0 +1,3 @@
+#!/bin/bash
+
+exit 0
diff --git a/tools/testing/selftests/livepatch/test_modules/Makefile b/tools/testing/selftests/livepatch/test_modules/Makefile
new file mode 100644
index 000000000000..2975fe21f48c
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test_modules/Makefile
@@ -0,0 +1,11 @@
+LP_TESTMODS_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
+#KDIR ?= /lib/modules/$(shell uname -r)/build
+KDIR ?= $(abspath $(LP_TESTMODS_DIR)/../../../../..)
+
+obj-m += mod_test.o
+
+all:
+	make -C $(KDIR) M=$(LP_TESTMODS_DIR) modules
+
+clean:
+	make -C $(KDIR) M=$(LP_TESTMODS_DIR) clean
diff --git a/tools/testing/selftests/livepatch/test_modules/mod_test.c b/tools/testing/selftests/livepatch/test_modules/mod_test.c
new file mode 100644
index 000000000000..135f5d0b55b0
--- /dev/null
+++ b/tools/testing/selftests/livepatch/test_modules/mod_test.c
@@ -0,0 +1,15 @@
+#include <linux/module.h>
+#include <linux/kernel.h>
+
+static int mod_init(void)
+{
+	return 0;
+}
+
+static void mod_exit(void)
+{
+}
+
+module_init(mod_init);
+module_exit(mod_exit);
+MODULE_LICENSE("GPL");
-- 
2.40.0


--pyfwqlfq3a7hxxti--
