Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36BD235241
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Aug 2020 14:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgHAM1l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Aug 2020 08:27:41 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:17684 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728632AbgHAM1k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Aug 2020 08:27:40 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 071CRKxl018934;
        Sat, 1 Aug 2020 21:27:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 071CRKxl018934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596284841;
        bh=xLiaOQ1TEc0N8chuDQ7/0wJBORv+8padPrYOMikNf7M=;
        h=From:To:Cc:Subject:Date:From;
        b=SeZi4Goh5brk5Mnva3aWEYFsZKJgDyHSJfdNESPUHYTdQ7isxtfUMiYIwLBAH3bwR
         Lgg3LpQb0k8XcajoCkzZ2WSWs67cBbG6KbQP90ufx8F4tDLB1cXlUJ9GkBGLg42bQ7
         BUdQ2cUKDKGh1m4T6RKM1BoGpX0zmcLnRtL9lDIupoGbuSUpJT8SdIlFES+8184ZkM
         DNTr0+IXyhmhvltnWFh4mMDfvj12/JeNnqXF4mpkKxzbhKK7ZntfSKeLoJs9PZO2mI
         6cXgIlLXI3BqR1nUOz+jVdKqeZ5H8S/9GEfGexeXfKEsrKMe6MdKX1mt6gC9kgNAW6
         l0TWG+RZqgXOA==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: introduce hostprogs-always-y and userprogs-always-y
Date:   Sat,  1 Aug 2020 21:27:18 +0900
Message-Id: <20200801122718.543376-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To build host programs, you need to add the program names to 'hostprogs'
to use the necessary build rule, but it is not enough to build them
because there is no dependency.

There are two types of host programs: built as the prerequisite of
another (e.g. gen_crc32table in lib/Makefile), or always built when
Kbuild visits the Makefile (e.g. genksyms in scripts/genksyms/Makefile).

The latter is typical in Makefiles under scripts/, which contains host
programs globally used during the kernel build. To build them, you need
to add them to both 'hostprogs' and 'always-y'.

This commit adds hostprogs-always-y as a shorthand.

The same applies to user programs. net/bpfilter/Makefile builds
bpfilter_umh on demand, hence always-y is unneeded. In contrast,
programs under samples/ are added to both 'userprogs' and 'always-y'
so they are always built when Kbuild visits the Makefiles.

userprogs-always-y works as a shorthand.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst  | 31 ++++++++++++++++++++++++++++-
 samples/auxdisplay/Makefile         |  3 +--
 samples/binderfs/Makefile           |  3 +--
 samples/connector/Makefile          |  3 +--
 samples/hidraw/Makefile             |  3 +--
 samples/mei/Makefile                |  4 +---
 samples/pidfd/Makefile              |  4 +---
 samples/seccomp/Makefile            |  4 +---
 samples/timers/Makefile             |  3 +--
 samples/uhid/Makefile               |  3 +--
 samples/vfs/Makefile                |  3 +--
 samples/watch_queue/Makefile        |  3 +--
 samples/watchdog/Makefile           |  3 +--
 scripts/Makefile                    | 18 ++++++++---------
 scripts/Makefile.clean              | 12 ++++++++---
 scripts/Makefile.lib                | 10 ++++++++++
 scripts/basic/Makefile              |  3 +--
 scripts/dtc/Makefile                |  5 ++---
 scripts/genksyms/Makefile           |  3 +--
 scripts/mod/Makefile                |  4 ++--
 scripts/selinux/genheaders/Makefile |  4 +---
 scripts/selinux/mdp/Makefile        |  3 +--
 22 files changed, 77 insertions(+), 55 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 14d8e7d23c04..b81b8913a5a3 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -749,6 +749,10 @@ Both possibilities are described in the following.
 		hostprogs     := lxdialog
 		always-y      := $(hostprogs)
 
+	Kbuild provides the following shorthand for this:
+
+		hostprogs-always-y := lxdialog
+
 	This will tell kbuild to build lxdialog even if not referenced in
 	any rule.
 
@@ -831,7 +835,32 @@ The syntax is quite similar. The difference is to use "userprogs" instead of
 5.4 When userspace programs are actually built
 ----------------------------------------------
 
-	Same as "When host programs are actually built".
+	Kbuild builds userspace programs only when told to do so.
+	There are two ways to do this.
+
+	(1) Add it as the prerequisite of another file
+
+	Example::
+
+		#net/bpfilter/Makefile
+		userprogs := bpfilter_umh
+		$(obj)/bpfilter_umh_blob.o: $(obj)/bpfilter_umh
+
+	$(obj)/bpfilter_umh is built before $(obj)/bpfilter_umh_blob.o
+
+	(2) Use always-y
+
+	Example::
+
+		userprogs := binderfs_example
+		always-y := $(userprogs)
+
+	Kbuild provides the following shorthand for this:
+
+		userprogs-always-y := binderfs_example
+
+	This will tell Kbuild to build binderfs_example when it visits this
+	Makefile.
 
 6 Kbuild clean infrastructure
 =============================
diff --git a/samples/auxdisplay/Makefile b/samples/auxdisplay/Makefile
index dbdf939af94a..19d5568938c3 100644
--- a/samples/auxdisplay/Makefile
+++ b/samples/auxdisplay/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-userprogs := cfag12864b-example
-always-y := $(userprogs)
+userprogs-always-y += cfag12864b-example
diff --git a/samples/binderfs/Makefile b/samples/binderfs/Makefile
index 989e4badaee2..629e43b9b129 100644
--- a/samples/binderfs/Makefile
+++ b/samples/binderfs/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-userprogs := binderfs_example
-always-y := $(userprogs)
+userprogs-always-y += binderfs_example
 
 userccflags += -I usr/include
diff --git a/samples/connector/Makefile b/samples/connector/Makefile
index 50cb40e09a7b..d98a9e047c11 100644
--- a/samples/connector/Makefile
+++ b/samples/connector/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SAMPLE_CONNECTOR) += cn_test.o
 
-userprogs := ucon
-always-$(CONFIG_CC_CAN_LINK) := $(userprogs)
+userprogs-always-$(CONFIG_CC_CAN_LINK) += ucon
 
 userccflags += -I usr/include
diff --git a/samples/hidraw/Makefile b/samples/hidraw/Makefile
index d2c77ed60b39..594d989e5486 100644
--- a/samples/hidraw/Makefile
+++ b/samples/hidraw/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-userprogs := hid-example
-always-y := $(userprogs)
+userprogs-always-y += hid-example
 
 userccflags += -I usr/include
diff --git a/samples/mei/Makefile b/samples/mei/Makefile
index 329411f82369..c54b8a0ab04e 100644
--- a/samples/mei/Makefile
+++ b/samples/mei/Makefile
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright (c) 2012-2019, Intel Corporation. All rights reserved.
-
-userprogs := mei-amt-version
-always-y := $(userprogs)
+userprogs-always-y += mei-amt-version
 
 userccflags += -I usr/include
diff --git a/samples/pidfd/Makefile b/samples/pidfd/Makefile
index 6e5b67e648c2..9754e2d81f70 100644
--- a/samples/pidfd/Makefile
+++ b/samples/pidfd/Makefile
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-
-usertprogs := pidfd-metadata
-always-y := $(userprogs)
+usertprogs-always-y += pidfd-metadata
 
 userccflags += -I usr/include
diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
index 75916c23e416..c85ae0ed8342 100644
--- a/samples/seccomp/Makefile
+++ b/samples/seccomp/Makefile
@@ -1,8 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-userprogs := bpf-fancy dropper bpf-direct user-trap
+userprogs-always-y += bpf-fancy dropper bpf-direct user-trap
 
 bpf-fancy-objs := bpf-fancy.o bpf-helper.o
 
 userccflags += -I usr/include
-
-always-y := $(userprogs)
diff --git a/samples/timers/Makefile b/samples/timers/Makefile
index 15c7ddbc8c51..e6836cdea4e2 100644
--- a/samples/timers/Makefile
+++ b/samples/timers/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-userprogs := hpet_example
-always-y := $(userprogs)
+userprogs-always-y += hpet_example
 
 userccflags += -I usr/include
diff --git a/samples/uhid/Makefile b/samples/uhid/Makefile
index 9e652fc34103..0aa424ec4899 100644
--- a/samples/uhid/Makefile
+++ b/samples/uhid/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-userprogs := uhid-example
-always-y := $(userprogs)
+userprogs-always-y += uhid-example
 
 userccflags += -I usr/include
diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
index 00b6824f9237..6377a678134a 100644
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-userprogs := test-fsmount test-statx
-always-y := $(userprogs)
+userprogs-always-y += test-fsmount test-statx
 
 userccflags += -I usr/include
diff --git a/samples/watch_queue/Makefile b/samples/watch_queue/Makefile
index 792b22f593cf..c0db3a6bc524 100644
--- a/samples/watch_queue/Makefile
+++ b/samples/watch_queue/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-userprogs := watch_test
-always-y := $(userprogs)
+userprogs-always-y += watch_test
 
 userccflags += -I usr/include
diff --git a/samples/watchdog/Makefile b/samples/watchdog/Makefile
index 17384cfb387e..ab39d23dc96b 100644
--- a/samples/watchdog/Makefile
+++ b/samples/watchdog/Makefile
@@ -1,3 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-userprogs := watchdog-simple
-always-y := $(userprogs)
+userprogs-always-y += watchdog-simple
diff --git a/scripts/Makefile b/scripts/Makefile
index 95ecf970c74c..bc018e4b733e 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -3,14 +3,14 @@
 # scripts contains sources for various helper programs used throughout
 # the kernel for the build process.
 
-always-$(CONFIG_BUILD_BIN2C)			+= bin2c
-always-$(CONFIG_KALLSYMS)			+= kallsyms
-always-$(BUILD_C_RECORDMCOUNT)			+= recordmcount
-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
-always-$(CONFIG_ASN1)				+= asn1_compiler
-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)		+= extract-cert
-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
+hostprogs-always-$(CONFIG_BUILD_BIN2C)			+= bin2c
+hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
+hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
+hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
+hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
+hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
+hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
+hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
@@ -26,8 +26,6 @@ HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
 HOSTLDLIBS_sorttable = -lpthread
 endif
 
-hostprogs := $(always-y) $(always-m)
-
 # The following programs are only built on demand
 hostprogs += unifdef
 
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 3cdf31218198..d9e0ceace6a6 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -27,9 +27,15 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
 # build a list of files to remove, usually relative to the current
 # directory
 
-__clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
-		   $(always) $(always-y) $(always-m) $(always-) $(targets) $(clean-files)   \
-		   $(hostprogs) $(hostprogs-y) $(hostprogs-m) $(hostprogs-) $(userprogs)
+__clean-files	:= \
+	$(clean-files) $(targets) $(hostprogs) $(userprogs) \
+	$(extra-y) $(extra-m) $(extra-) \
+	$(always-y) $(always-m) $(always-) \
+	$(hostprogs-always-y) $(hostprogs-always-m) $(hostprogs-always-) \
+	$(userprogs-always-y) $(userprogs-always-m) $(userprogs-always-)
+
+# deprecated
+__clean-files	+= $(always) $(hostprogs-y) $(hostprogs-m) $(hostprogs-)
 
 __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 5cfd377778b4..f940f22292de 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -68,6 +68,16 @@ real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))
 
 always-y += $(always-m)
 
+# hostprogs-always-y += foo
+# ... is a shorthand for
+# hostprogs += foo
+# always-y  += foo
+# userprogs-always-y is likewise.
+hostprogs += $(hostprogs-always-y) $(hostprogs-always-m)
+userprogs += $(userprogs-always-y) $(userprogs-always-m)
+always-y += $(hostprogs-always-y) $(hostprogs-always-m) \
+	    $(userprogs-always-y) $(userprogs-always-m)
+
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 extra-y				+= $(dtb-y)
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index 290dd27d2809..eeb6a38c5551 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -2,5 +2,4 @@
 #
 # fixdep: used to generate dependency information during build process
 
-hostprogs	:= fixdep
-always-y	:= $(hostprogs)
+hostprogs-always-y	+= fixdep
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 0b44917f981c..a698ece43fff 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # scripts/dtc makefile
 
-hostprogs			:= dtc
-always-$(CONFIG_DTC)		+= $(hostprogs)
-always-$(CHECK_DT_BINDING)	+= $(hostprogs)
+hostprogs-always-$(CONFIG_DTC)		+= dtc
+hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 		   srcpos.o checks.o util.o
diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index d328de1e10ee..ce4f99935de5 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-hostprogs	:= genksyms
-always-y	:= $(hostprogs)
+hostprogs-always-y	+= genksyms
 
 genksyms-objs	:= genksyms.o parse.tab.o lex.lex.o
 
diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 296b6a3878b2..78071681d924 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD := y
 
-hostprogs	:= modpost mk_elfconfig
-always-y	:= $(hostprogs) empty.o
+hostprogs-always-y	+= modpost mk_elfconfig
+always-y		+= empty.o
 
 modpost-objs	:= modpost.o file2alias.o sumversion.o
 
diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
index 70cf8d95d07c..1faf7f07e8db 100644
--- a/scripts/selinux/genheaders/Makefile
+++ b/scripts/selinux/genheaders/Makefile
@@ -1,7 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-hostprogs	:= genheaders
+hostprogs-always-y += genheaders
 HOST_EXTRACFLAGS += \
 	-I$(srctree)/include/uapi -I$(srctree)/include \
 	-I$(srctree)/security/selinux/include
-
-always-y	:= $(hostprogs)
diff --git a/scripts/selinux/mdp/Makefile b/scripts/selinux/mdp/Makefile
index 3026f3c2aa2b..d61058ddd15c 100644
--- a/scripts/selinux/mdp/Makefile
+++ b/scripts/selinux/mdp/Makefile
@@ -1,8 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-hostprogs	:= mdp
+hostprogs-always-y += mdp
 HOST_EXTRACFLAGS += \
 	-I$(srctree)/include/uapi -I$(srctree)/include \
 	-I$(srctree)/security/selinux/include -I$(objtree)/include
 
-always-y	:= $(hostprogs)
 clean-files	:= policy.* file_contexts
-- 
2.25.1

