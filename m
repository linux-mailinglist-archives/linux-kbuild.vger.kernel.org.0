Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1AE7BEBD3
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 22:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378023AbjJIUnV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 16:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378019AbjJIUnT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 16:43:19 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3680AA3
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 13:43:18 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id E95E92191E;
        Mon,  9 Oct 2023 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1696884196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=vk98dv9KrL/UN9jMxV5ES8qyuwATYHZzKLCqirMTIvk=;
        b=sBK9qgGQtlx6TFORN4SSOt9M/LY7Wn8JMzaynjZPFWiLSQrKjpqhGSDV1sY8SzoeJH2VCm
        tt06/LvnUGxDhVByvGgsrWc2BGS3YnY7w42uuSmwZqd0YtraPyisd/0h7HzJWIYpdjq/l0
        A3Xwd04567oywg6heDbBKsbfk8ZP2UA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1696884196;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=vk98dv9KrL/UN9jMxV5ES8qyuwATYHZzKLCqirMTIvk=;
        b=SZ0b1W5+ROGl0BNRLMimTZyiHANnhaNszBRPzxi5ROpYLy/THmKabsb0VcRYDbQ3/fF+bw
        VVZsNbZEyCA1a4AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F6C713586;
        Mon,  9 Oct 2023 20:43:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id qJpEDeRlJGXXRAAAMHmgww
        (envelope-from <mpdesouza@suse.com>); Mon, 09 Oct 2023 20:43:16 +0000
Date:   Mon, 9 Oct 2023 17:43:14 -0300
From:   Marcos Paulo de Souza <mpdesouza@suse.de>
To:     linux-kbuild@vger.kernel.org
Cc:     mbenes@suse.cz
Subject: # Toplevel Makefile doesn't process module build correctly on
 recursive make calls
Message-ID: <lp2gjgzwxvhluh7fpmmo2drhii7bxcrlvxacclfgsl4ycubjhc@jjq2jfvow4y2>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gblajfj36ioreeva"
Content-Disposition: inline
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--gblajfj36ioreeva
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I found an issue while moving the livepatch kselftest modules to be built on the
fly, instead of building them on kernel building.

If, for some reason, there is a recursive make invocation that starts from the
top level Makefile and in the leaf Makefile it tries to build a module (using M=
in the make invocation), it doesn't produce the module. This happens because the
toplevel Makefile checks for M= only once. This is controlled by the
sub_make_done variable, which is exported after checking the command line
options are passed to the top level Makefile. Once this variable is set it's
the M= setting is never checked again on the recursive call.

This can be observed when cleaning the bpf kselftest dir. When calling

	$ make TARGETS="bpf" SKIP_TARGETS="" kselftest-clean

What happens:

	1. It checks for some command line settings (like M=) was passed (it wasn't),
	set some definitions and exports sub_make_done.

	2. Jump into tools/testing/selftests/bpf, and calls the clean target.

	3. The clean target is overwritten to remove some files and then jump to
	bpf_testmod dir and call clean there

	4. On bpf_testmod/Makefile, the clean target will execute
		$(Q)make -C $(KDIR) M=$(BPF_TESTMOD_DIR) clean

	5. The KDIR is to toplevel dir. The top Makefile will check that sub_make_done was
	already set, ignoring the M= setting.

	6. As M= wasn't checked, KBUILD_EXTMOD isn't set, and the clean target applies
	to the kernel as a whole, making it clean all generated code/objects and
	everything.

One way to avoid it is to call "unexport sub_make_done" on
tools/testing/selftests/bpf/bpf_testmod/Makefile before processing the all
target, forcing the toplevel Makefile to process the M=, producing the module
file correctly.

If the M=dir points to /lib/modules/.../build, then it fails with "m2c: No such
file", which I already reported here[1]. At the time this problem was treated
like a problem with kselftest infrastructure.

Important: The process works fine if the initial make invocation is targeted to a
different directory (using -C), since it doesn't goes through the toplevel
Makefile, and sub_make_done variable is not set.

I attached a minimal reproducer, that can be used to better understand the
problem. The "make testmod" and "make testmod-clean" have the same effect that
can be seem with the bpf kselftests. There is a unexport call commented on
test-mods/Makefile, and once that is called the process works as expected.

Is there a better way to fix this? Is this really a problem, or am I missing
something?

Thanks in advance,
  Marcos

[1]:
https://lore.kernel.org/linux-kbuild/rgbi7vgqel5f2vtzeuxykeh7civd6xxbxkohsgwgsond3vwbbv@hebfs24hxzir/

--gblajfj36ioreeva
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-TESTING-PoC-of-M-not-being-processed-on-module-build.patch"

From fb99fa8553e7363d2f1f285bf6f2bc05b5c00196 Mon Sep 17 00:00:00 2001
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Mon, 9 Oct 2023 17:19:03 -0300
Subject: [PATCH] TESTING: PoC of M= not being processed on module building

After applying this patch, one can execute
  $ make testmod

And test-mod.ko won't be created. This happens because the toplevel
Makefile first checks if the initial invocation of make contains M=, and
then sets sub_make_done in order to avoid recursive make invocations.

If the unexport is uncommented from the test-mod/Makefile, the the
mod_test.ko is created, since the toplevel Makefile will run the make
for the module.

The same problem can be seen when calling the clean target for the
module. With the "unexport sub_make_done" commented it will execute the
clean on the entire git tree, instead of only cleaning up the modules
directory. The testing can be done by calling
  make testmod-clean

With and without the "unexport" call commented. The will produce different
outcomes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 Makefile            |  6 ++++++
 test-mod/Makefile   | 12 ++++++++++++
 test-mod/mod_test.c | 15 +++++++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 test-mod/Makefile
 create mode 100644 test-mod/mod_test.c

diff --git a/Makefile b/Makefile
index 57698d048e2c..e487497feb04 100644
--- a/Makefile
+++ b/Makefile
@@ -1371,6 +1371,12 @@ kselftest-merge:
 		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
+PHONY += testmod testmod-clean
+testmod:
+	$(Q)$(MAKE) -C $(srctree)/test-mod
+testmod-clean:
+	$(Q)$(MAKE) -C $(srctree)/test-mod clean
+
 # ---------------------------------------------------------------------------
 # Devicetree files
 
diff --git a/test-mod/Makefile b/test-mod/Makefile
new file mode 100644
index 000000000000..d07460088773
--- /dev/null
+++ b/test-mod/Makefile
@@ -0,0 +1,12 @@
+TESTMODS_DIR := $(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
+KDIR ?= $(abs_srctree)
+
+obj-m += mod_test.o
+
+#unexport sub_make_done
+
+all:
+	make -C $(KDIR) M=$(TESTMODS_DIR) modules
+
+clean:
+	make -C $(KDIR) M=$(TESTMODS_DIR) clean
diff --git a/test-mod/mod_test.c b/test-mod/mod_test.c
new file mode 100644
index 000000000000..135f5d0b55b0
--- /dev/null
+++ b/test-mod/mod_test.c
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
2.42.0


--gblajfj36ioreeva--
