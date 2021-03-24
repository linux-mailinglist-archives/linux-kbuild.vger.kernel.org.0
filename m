Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1CE73484B3
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 23:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235384AbhCXWhe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 18:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238836AbhCXWhX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 18:37:23 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CFBC06174A;
        Wed, 24 Mar 2021 15:37:22 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id i19so320177qtv.7;
        Wed, 24 Mar 2021 15:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QTbxgtv/tUXlCJsUJZGUIrt5Qt8zQR8qdxBCC0xO1Io=;
        b=pcRjs/w4CoNuBxhcNAaDI/KU6QvU+K4k6lWBgXKFnbU/Btvg/0LThIEDsef+FKY4aZ
         Q1VMODDuqNbwRo4ZRM26VWqHXttcOSCOCwn7TlcM1FjeoZtymQnQBcAmRi4ngLRzZtxe
         OgKYxVFPWh9R563ZG5LHlcqhBipVzF3ps6SwyFIjWh8/O5b6fArDXam/xsmWZM4qhUnV
         JtzMrgwmzlN5bbG7zdh8Beyr3rArTH7pBs+7IHkuJs0WriyUjngUmQBaEUX2oYw+YcvF
         vvQA4LrMbsqZeT3rshm7G7QeNbN/XXJAR02DKlYcvYcw63eYohXPiQbUn3QAe3xsSnH5
         u6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QTbxgtv/tUXlCJsUJZGUIrt5Qt8zQR8qdxBCC0xO1Io=;
        b=smYtw5Z/BZsLTgIzKTJ0p8ne4Oo2onRHsRmrsmsoVRC3ZroM7lAqb99OQmStJvLD39
         C9ovAAX3OFSF8RobsxG/Y1dFq9ZLe4VrRCEDsf0k5BvF7Awxt6Eu5AjUlijuGOM9NvJI
         YY3KSO/1JEId9Y8UhMk44+9dAgl4nwqzQokgLLbd+PJ7dlIBrzhfNCZvB+W7UaknafOS
         rSrWBwggVSkfoJ15TYb5co4hokti6Y6quMLSynHKtQkuctac6EyZZPryel+5BMZilK4s
         ZAyKHJ7KeExroc4TxYkZGVxgNjwRaVzsPPSVm76Q2/Tsy+YplZkrGd+7tlvTDpSvCvCQ
         f6uA==
X-Gm-Message-State: AOAM532mJI3yxDRUp5pgY2Qxix9kVwrrSBEcOQEpdi+dxmZYNmZDY40v
        1En2ZPYT7ba3hP8CWhNfkv0=
X-Google-Smtp-Source: ABdhPJxSFRHpow2fuGW6XAV9xmisGsYyNXijG4K+2CDCfA5hamXrZ/M3Nx/tZW2lXMuZ0l2bBiMzJA==
X-Received: by 2002:ac8:4510:: with SMTP id q16mr5045838qtn.241.1616625441906;
        Wed, 24 Mar 2021 15:37:21 -0700 (PDT)
Received: from localhost.localdomain (c-67-187-90-124.hsd1.tn.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id e18sm2452833qtr.52.2021.03.24.15.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 15:37:21 -0700 (PDT)
From:   frowand.list@gmail.com
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] of: unittest: rename overlay source files from .dts to .dtso
Date:   Wed, 24 Mar 2021 17:37:13 -0500
Message-Id: <20210324223713.1334666-1-frowand.list@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
source file.

Rename unittest .dts overlay source files to use .dtso suffix.

Update Makefile to build .dtbo.o objects instead of .dtb.o from
unittest overlay source files.

Modify unitest.c to use .dtbo.o based symbols instead of .dtb.o

Modify Makefile.lib %.dtbo rule to depend upon %.dtso instead of %.dts

Documentation/devicetree/of_unittest.rst was already out of date.
This commit would make it even more out of date.  Delete the document
instead of continuing the maintenance burden of keeping the document
in sync with the source.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---

This patch applies on top of Viresh Kumar's patches 1, 2, 4, and 5
that Rob has already accepted at:
https://lore.kernel.org/r/20210315171357.GA1063052@robh.at.kernel.org

Viresh Kumar's series is
"[PATCH V11 0/5] dt: Add fdtoverlay rule and statically build unittest" at:
https://lore.kernel.org/linux-devicetree/cover.1615354376.git.viresh.kumar@linaro.org/


There are checkpatch warnings.  I have reviewed them and feel
they can be ignored.

 Documentation/devicetree/index.rst            |   1 -
 Documentation/devicetree/of_unittest.rst      | 205 ------------------
 drivers/of/unittest-data/Makefile             |  76 ++++---
 .../{overlay.dts => overlay.dtso}             |   0
 .../{overlay_0.dts => overlay_0.dtso}         |   0
 .../{overlay_1.dts => overlay_1.dtso}         |   0
 .../{overlay_10.dts => overlay_10.dtso}       |   0
 .../{overlay_11.dts => overlay_11.dtso}       |   0
 .../{overlay_12.dts => overlay_12.dtso}       |   0
 .../{overlay_13.dts => overlay_13.dtso}       |   0
 .../{overlay_15.dts => overlay_15.dtso}       |   0
 .../{overlay_2.dts => overlay_2.dtso}         |   0
 .../{overlay_3.dts => overlay_3.dtso}         |   0
 .../{overlay_4.dts => overlay_4.dtso}         |   0
 .../{overlay_5.dts => overlay_5.dtso}         |   0
 .../{overlay_6.dts => overlay_6.dtso}         |   0
 .../{overlay_7.dts => overlay_7.dtso}         |   0
 .../{overlay_8.dts => overlay_8.dtso}         |   0
 .../{overlay_9.dts => overlay_9.dtso}         |   0
 ...node.dts => overlay_bad_add_dup_node.dtso} |   0
 ...prop.dts => overlay_bad_add_dup_prop.dtso} |   0
 ...d_phandle.dts => overlay_bad_phandle.dtso} |   0
 ...bad_symbol.dts => overlay_bad_symbol.dtso} |   0
 .../{overlay_base.dts => overlay_base.dtso}   |   0
 ...erlay_gpio_01.dts => overlay_gpio_01.dtso} |   0
 ...lay_gpio_02a.dts => overlay_gpio_02a.dtso} |   0
 ...lay_gpio_02b.dts => overlay_gpio_02b.dtso} |   0
 ...erlay_gpio_03.dts => overlay_gpio_03.dtso} |   0
 ...lay_gpio_04a.dts => overlay_gpio_04a.dtso} |   0
 ...lay_gpio_04b.dts => overlay_gpio_04b.dtso} |   0
 .../{testcases.dts => testcases.dtso}         |   0
 drivers/of/unittest.c                         |  48 ++--
 scripts/Makefile.lib                          |   2 +-
 33 files changed, 73 insertions(+), 259 deletions(-)
 delete mode 100644 Documentation/devicetree/of_unittest.rst
 rename drivers/of/unittest-data/{overlay.dts => overlay.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_0.dts => overlay_0.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_1.dts => overlay_1.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_10.dts => overlay_10.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_11.dts => overlay_11.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_12.dts => overlay_12.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_13.dts => overlay_13.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_15.dts => overlay_15.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_2.dts => overlay_2.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_3.dts => overlay_3.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_4.dts => overlay_4.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_5.dts => overlay_5.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_6.dts => overlay_6.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_7.dts => overlay_7.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_8.dts => overlay_8.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_9.dts => overlay_9.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_add_dup_node.dts => overlay_bad_add_dup_node.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_add_dup_prop.dts => overlay_bad_add_dup_prop.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_phandle.dts => overlay_bad_phandle.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_bad_symbol.dts => overlay_bad_symbol.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_base.dts => overlay_base.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_01.dts => overlay_gpio_01.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_02a.dts => overlay_gpio_02a.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_02b.dts => overlay_gpio_02b.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_03.dts => overlay_gpio_03.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_04a.dts => overlay_gpio_04a.dtso} (100%)
 rename drivers/of/unittest-data/{overlay_gpio_04b.dts => overlay_gpio_04b.dtso} (100%)
 rename drivers/of/unittest-data/{testcases.dts => testcases.dtso} (100%)

diff --git a/Documentation/devicetree/index.rst b/Documentation/devicetree/index.rst
index 54026763916d..b2071f744e46 100644
--- a/Documentation/devicetree/index.rst
+++ b/Documentation/devicetree/index.rst
@@ -11,7 +11,6 @@ Open Firmware and Device Tree
    writing-schema
    changesets
    dynamic-resolution-notes
-   of_unittest
    overlay-notes
 
    bindings/index
diff --git a/Documentation/devicetree/of_unittest.rst b/Documentation/devicetree/of_unittest.rst
deleted file mode 100644
index dea05214f3ad..000000000000
--- a/Documentation/devicetree/of_unittest.rst
+++ /dev/null
@@ -1,205 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-==================================
-Open Firmware Device Tree Unittest
-==================================
-
-Author: Gaurav Minocha <gaurav.minocha.os@gmail.com>
-
-1. Introduction
-===============
-
-This document explains how the test data required for executing OF unittest
-is attached to the live tree dynamically, independent of the machine's
-architecture.
-
-It is recommended to read the following documents before moving ahead.
-
-(1) Documentation/devicetree/usage-model.rst
-(2) http://www.devicetree.org/Device_Tree_Usage
-
-OF Selftest has been designed to test the interface (include/linux/of.h)
-provided to device driver developers to fetch the device information..etc.
-from the unflattened device tree data structure. This interface is used by
-most of the device drivers in various use cases.
-
-
-2. Test-data
-============
-
-The Device Tree Source file (drivers/of/unittest-data/testcases.dts) contains
-the test data required for executing the unit tests automated in
-drivers/of/unittest.c. Currently, following Device Tree Source Include files
-(.dtsi) are included in testcases.dts::
-
-    drivers/of/unittest-data/tests-interrupts.dtsi
-    drivers/of/unittest-data/tests-platform.dtsi
-    drivers/of/unittest-data/tests-phandle.dtsi
-    drivers/of/unittest-data/tests-match.dtsi
-
-When the kernel is build with OF_SELFTEST enabled, then the following make
-rule::
-
-    $(obj)/%.dtb: $(src)/%.dts FORCE
-	    $(call if_changed_dep, dtc)
-
-is used to compile the DT source file (testcases.dts) into a binary blob
-(testcases.dtb), also referred as flattened DT.
-
-After that, using the following rule the binary blob above is wrapped as an
-assembly file (testcases.dtb.S)::
-
-    $(obj)/%.dtb.S: $(obj)/%.dtb
-	    $(call cmd, dt_S_dtb)
-
-The assembly file is compiled into an object file (testcases.dtb.o), and is
-linked into the kernel image.
-
-
-2.1. Adding the test data
--------------------------
-
-Un-flattened device tree structure:
-
-Un-flattened device tree consists of connected device_node(s) in form of a tree
-structure described below::
-
-    // following struct members are used to construct the tree
-    struct device_node {
-	...
-	struct  device_node *parent;
-	struct  device_node *child;
-	struct  device_node *sibling;
-	...
-    };
-
-Figure 1, describes a generic structure of machine's un-flattened device tree
-considering only child and sibling pointers. There exists another pointer,
-``*parent``, that is used to traverse the tree in the reverse direction. So, at
-a particular level the child node and all the sibling nodes will have a parent
-pointer pointing to a common node (e.g. child1, sibling2, sibling3, sibling4's
-parent points to root node)::
-
-    root ('/')
-    |
-    child1 -> sibling2 -> sibling3 -> sibling4 -> null
-    |         |           |           |
-    |         |           |          null
-    |         |           |
-    |         |        child31 -> sibling32 -> null
-    |         |           |          |
-    |         |          null       null
-    |         |
-    |      child21 -> sibling22 -> sibling23 -> null
-    |         |          |            |
-    |        null       null         null
-    |
-    child11 -> sibling12 -> sibling13 -> sibling14 -> null
-    |           |           |            |
-    |           |           |           null
-    |           |           |
-    null        null       child131 -> null
-			    |
-			    null
-
-Figure 1: Generic structure of un-flattened device tree
-
-
-Before executing OF unittest, it is required to attach the test data to
-machine's device tree (if present). So, when selftest_data_add() is called,
-at first it reads the flattened device tree data linked into the kernel image
-via the following kernel symbols::
-
-    __dtb_testcases_begin - address marking the start of test data blob
-    __dtb_testcases_end   - address marking the end of test data blob
-
-Secondly, it calls of_fdt_unflatten_tree() to unflatten the flattened
-blob. And finally, if the machine's device tree (i.e live tree) is present,
-then it attaches the unflattened test data tree to the live tree, else it
-attaches itself as a live device tree.
-
-attach_node_and_children() uses of_attach_node() to attach the nodes into the
-live tree as explained below. To explain the same, the test data tree described
-in Figure 2 is attached to the live tree described in Figure 1::
-
-    root ('/')
-	|
-    testcase-data
-	|
-    test-child0 -> test-sibling1 -> test-sibling2 -> test-sibling3 -> null
-	|               |                |                |
-    test-child01      null             null             null
-
-
-Figure 2: Example test data tree to be attached to live tree.
-
-According to the scenario above, the live tree is already present so it isn't
-required to attach the root('/') node. All other nodes are attached by calling
-of_attach_node() on each node.
-
-In the function of_attach_node(), the new node is attached as the child of the
-given parent in live tree. But, if parent already has a child then the new node
-replaces the current child and turns it into its sibling. So, when the testcase
-data node is attached to the live tree above (Figure 1), the final structure is
-as shown in Figure 3::
-
-    root ('/')
-    |
-    testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
-    |               |          |           |           |
-    (...)             |          |           |          null
-		    |          |         child31 -> sibling32 -> null
-		    |          |           |           |
-		    |          |          null        null
-		    |          |
-		    |        child21 -> sibling22 -> sibling23 -> null
-		    |          |           |            |
-		    |         null        null         null
-		    |
-		    child11 -> sibling12 -> sibling13 -> sibling14 -> null
-		    |          |            |            |
-		    null       null          |           null
-					    |
-					    child131 -> null
-					    |
-					    null
-    -----------------------------------------------------------------------
-
-    root ('/')
-    |
-    testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
-    |               |          |           |           |
-    |             (...)      (...)       (...)        null
-    |
-    test-sibling3 -> test-sibling2 -> test-sibling1 -> test-child0 -> null
-    |                |                   |                |
-    null             null                null         test-child01
-
-
-Figure 3: Live device tree structure after attaching the testcase-data.
-
-
-Astute readers would have noticed that test-child0 node becomes the last
-sibling compared to the earlier structure (Figure 2). After attaching first
-test-child0 the test-sibling1 is attached that pushes the child node
-(i.e. test-child0) to become a sibling and makes itself a child node,
-as mentioned above.
-
-If a duplicate node is found (i.e. if a node with same full_name property is
-already present in the live tree), then the node isn't attached rather its
-properties are updated to the live tree's node by calling the function
-update_node_properties().
-
-
-2.2. Removing the test data
----------------------------
-
-Once the test case execution is complete, selftest_data_remove is called in
-order to remove the device nodes attached initially (first the leaf nodes are
-detached and then moving up the parent nodes are removed, and eventually the
-whole tree). selftest_data_remove() calls detach_node_and_children() that uses
-of_detach_node() to detach the nodes from the live device tree.
-
-To detach a node, of_detach_node() either updates the child pointer of given
-node's parent to its sibling or attaches the previous sibling to the given
-node's sibling, as appropriate. That is it :)
diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index a5d2d9254b2c..bc1cee638bf7 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -1,33 +1,53 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-y += testcases.dtb.o
 
-obj-$(CONFIG_OF_OVERLAY) += overlay.dtb.o \
-			    overlay_0.dtb.o \
-			    overlay_1.dtb.o \
-			    overlay_2.dtb.o \
-			    overlay_3.dtb.o \
-			    overlay_4.dtb.o \
-			    overlay_5.dtb.o \
-			    overlay_6.dtb.o \
-			    overlay_7.dtb.o \
-			    overlay_8.dtb.o \
-			    overlay_9.dtb.o \
-			    overlay_10.dtb.o \
-			    overlay_11.dtb.o \
-			    overlay_12.dtb.o \
-			    overlay_13.dtb.o \
-			    overlay_15.dtb.o \
-			    overlay_bad_add_dup_node.dtb.o \
-			    overlay_bad_add_dup_prop.dtb.o \
-			    overlay_bad_phandle.dtb.o \
-			    overlay_bad_symbol.dtb.o \
-			    overlay_base.dtb.o \
-			    overlay_gpio_01.dtb.o \
-			    overlay_gpio_02a.dtb.o \
-			    overlay_gpio_02b.dtb.o \
-			    overlay_gpio_03.dtb.o \
-			    overlay_gpio_04a.dtb.o \
-			    overlay_gpio_04b.dtb.o
+# Generate an assembly file to wrap the output of the device tree compiler
+quiet_cmd_dt_S_dtbo= DTB     $@
+cmd_dt_S_dtbo=						\
+{							\
+	echo '\#include <asm-generic/vmlinux.lds.h>'; 	\
+	echo '.section .dtb.init.rodata,"a"';		\
+	echo '.balign STRUCT_ALIGNMENT';		\
+	echo '.global __dtbo_$(subst -,_,$(*F))_begin';	\
+	echo '__dtbo_$(subst -,_,$(*F))_begin:';	\
+	echo '.incbin "$<" ';				\
+	echo '__dtbo_$(subst -,_,$(*F))_end:';		\
+	echo '.global __dtbo_$(subst -,_,$(*F))_end';	\
+	echo '.balign STRUCT_ALIGNMENT'; 		\
+} > $@
+
+
+$(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
+	$(call if_changed,dt_S_dtbo)
+
+obj-y += testcases.dtbo.o
+
+obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
+			    overlay_0.dtbo.o \
+			    overlay_1.dtbo.o \
+			    overlay_2.dtbo.o \
+			    overlay_3.dtbo.o \
+			    overlay_4.dtbo.o \
+			    overlay_5.dtbo.o \
+			    overlay_6.dtbo.o \
+			    overlay_7.dtbo.o \
+			    overlay_8.dtbo.o \
+			    overlay_9.dtbo.o \
+			    overlay_10.dtbo.o \
+			    overlay_11.dtbo.o \
+			    overlay_12.dtbo.o \
+			    overlay_13.dtbo.o \
+			    overlay_15.dtbo.o \
+			    overlay_bad_add_dup_node.dtbo.o \
+			    overlay_bad_add_dup_prop.dtbo.o \
+			    overlay_bad_phandle.dtbo.o \
+			    overlay_bad_symbol.dtbo.o \
+			    overlay_base.dtbo.o \
+			    overlay_gpio_01.dtbo.o \
+			    overlay_gpio_02a.dtbo.o \
+			    overlay_gpio_02b.dtbo.o \
+			    overlay_gpio_03.dtbo.o \
+			    overlay_gpio_04a.dtbo.o \
+			    overlay_gpio_04b.dtbo.o
 
 # enable creation of __symbols__ node
 DTC_FLAGS_overlay += -@
diff --git a/drivers/of/unittest-data/overlay.dts b/drivers/of/unittest-data/overlay.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay.dts
rename to drivers/of/unittest-data/overlay.dtso
diff --git a/drivers/of/unittest-data/overlay_0.dts b/drivers/of/unittest-data/overlay_0.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_0.dts
rename to drivers/of/unittest-data/overlay_0.dtso
diff --git a/drivers/of/unittest-data/overlay_1.dts b/drivers/of/unittest-data/overlay_1.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_1.dts
rename to drivers/of/unittest-data/overlay_1.dtso
diff --git a/drivers/of/unittest-data/overlay_10.dts b/drivers/of/unittest-data/overlay_10.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_10.dts
rename to drivers/of/unittest-data/overlay_10.dtso
diff --git a/drivers/of/unittest-data/overlay_11.dts b/drivers/of/unittest-data/overlay_11.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_11.dts
rename to drivers/of/unittest-data/overlay_11.dtso
diff --git a/drivers/of/unittest-data/overlay_12.dts b/drivers/of/unittest-data/overlay_12.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_12.dts
rename to drivers/of/unittest-data/overlay_12.dtso
diff --git a/drivers/of/unittest-data/overlay_13.dts b/drivers/of/unittest-data/overlay_13.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_13.dts
rename to drivers/of/unittest-data/overlay_13.dtso
diff --git a/drivers/of/unittest-data/overlay_15.dts b/drivers/of/unittest-data/overlay_15.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_15.dts
rename to drivers/of/unittest-data/overlay_15.dtso
diff --git a/drivers/of/unittest-data/overlay_2.dts b/drivers/of/unittest-data/overlay_2.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_2.dts
rename to drivers/of/unittest-data/overlay_2.dtso
diff --git a/drivers/of/unittest-data/overlay_3.dts b/drivers/of/unittest-data/overlay_3.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_3.dts
rename to drivers/of/unittest-data/overlay_3.dtso
diff --git a/drivers/of/unittest-data/overlay_4.dts b/drivers/of/unittest-data/overlay_4.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_4.dts
rename to drivers/of/unittest-data/overlay_4.dtso
diff --git a/drivers/of/unittest-data/overlay_5.dts b/drivers/of/unittest-data/overlay_5.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_5.dts
rename to drivers/of/unittest-data/overlay_5.dtso
diff --git a/drivers/of/unittest-data/overlay_6.dts b/drivers/of/unittest-data/overlay_6.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_6.dts
rename to drivers/of/unittest-data/overlay_6.dtso
diff --git a/drivers/of/unittest-data/overlay_7.dts b/drivers/of/unittest-data/overlay_7.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_7.dts
rename to drivers/of/unittest-data/overlay_7.dtso
diff --git a/drivers/of/unittest-data/overlay_8.dts b/drivers/of/unittest-data/overlay_8.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_8.dts
rename to drivers/of/unittest-data/overlay_8.dtso
diff --git a/drivers/of/unittest-data/overlay_9.dts b/drivers/of/unittest-data/overlay_9.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_9.dts
rename to drivers/of/unittest-data/overlay_9.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_node.dts b/drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_add_dup_node.dts
rename to drivers/of/unittest-data/overlay_bad_add_dup_node.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_add_dup_prop.dts b/drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_add_dup_prop.dts
rename to drivers/of/unittest-data/overlay_bad_add_dup_prop.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_phandle.dts b/drivers/of/unittest-data/overlay_bad_phandle.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_phandle.dts
rename to drivers/of/unittest-data/overlay_bad_phandle.dtso
diff --git a/drivers/of/unittest-data/overlay_bad_symbol.dts b/drivers/of/unittest-data/overlay_bad_symbol.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_bad_symbol.dts
rename to drivers/of/unittest-data/overlay_bad_symbol.dtso
diff --git a/drivers/of/unittest-data/overlay_base.dts b/drivers/of/unittest-data/overlay_base.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_base.dts
rename to drivers/of/unittest-data/overlay_base.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_01.dts b/drivers/of/unittest-data/overlay_gpio_01.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_01.dts
rename to drivers/of/unittest-data/overlay_gpio_01.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_02a.dts b/drivers/of/unittest-data/overlay_gpio_02a.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_02a.dts
rename to drivers/of/unittest-data/overlay_gpio_02a.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_02b.dts b/drivers/of/unittest-data/overlay_gpio_02b.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_02b.dts
rename to drivers/of/unittest-data/overlay_gpio_02b.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_03.dts b/drivers/of/unittest-data/overlay_gpio_03.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_03.dts
rename to drivers/of/unittest-data/overlay_gpio_03.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_04a.dts b/drivers/of/unittest-data/overlay_gpio_04a.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_04a.dts
rename to drivers/of/unittest-data/overlay_gpio_04a.dtso
diff --git a/drivers/of/unittest-data/overlay_gpio_04b.dts b/drivers/of/unittest-data/overlay_gpio_04b.dtso
similarity index 100%
rename from drivers/of/unittest-data/overlay_gpio_04b.dts
rename to drivers/of/unittest-data/overlay_gpio_04b.dtso
diff --git a/drivers/of/unittest-data/testcases.dts b/drivers/of/unittest-data/testcases.dtso
similarity index 100%
rename from drivers/of/unittest-data/testcases.dts
rename to drivers/of/unittest-data/testcases.dtso
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index eb100627c186..f42a7b7765f1 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1410,12 +1410,12 @@ static int __init unittest_data_add(void)
 	void *unittest_data;
 	struct device_node *unittest_data_node, *np;
 	/*
-	 * __dtb_testcases_begin[] and __dtb_testcases_end[] are magically
-	 * created by cmd_dt_S_dtb in scripts/Makefile.lib
+	 * __dtbo_testcases_begin[] and __dtbo_testcases_end[] are
+	 * created by cmd_dt_S_dtbo in Makefile
 	 */
-	extern uint8_t __dtb_testcases_begin[];
-	extern uint8_t __dtb_testcases_end[];
-	const int size = __dtb_testcases_end - __dtb_testcases_begin;
+	extern uint8_t __dtbo_testcases_begin[];
+	extern uint8_t __dtbo_testcases_end[];
+	const int size = __dtbo_testcases_end - __dtbo_testcases_begin;
 	int rc;
 
 	if (!size) {
@@ -1425,7 +1425,7 @@ static int __init unittest_data_add(void)
 	}
 
 	/* creating copy */
-	unittest_data = kmemdup(__dtb_testcases_begin, size, GFP_KERNEL);
+	unittest_data = kmemdup(__dtbo_testcases_begin, size, GFP_KERNEL);
 	if (!unittest_data)
 		return -ENOMEM;
 
@@ -2806,24 +2806,24 @@ static inline void __init of_unittest_overlay(void) { }
 #ifdef CONFIG_OF_OVERLAY
 
 /*
- * __dtb_ot_begin[] and __dtb_ot_end[] are created by cmd_dt_S_dtb
- * in scripts/Makefile.lib
+ * __dtbo_##overlay_name##_begin[] and __dtbo_##overlay_name##_end[] are
+ * created by cmd_dt_S_dtbo in Makefile
  */
 
-#define OVERLAY_INFO_EXTERN(name) \
-	extern uint8_t __dtb_##name##_begin[]; \
-	extern uint8_t __dtb_##name##_end[]
+#define OVERLAY_INFO_EXTERN(overlay_name) \
+	extern uint8_t __dtbo_##overlay_name##_begin[]; \
+	extern uint8_t __dtbo_##overlay_name##_end[]
 
-#define OVERLAY_INFO(overlay_name, expected)             \
-{	.dtb_begin       = __dtb_##overlay_name##_begin, \
-	.dtb_end         = __dtb_##overlay_name##_end,   \
-	.expected_result = expected,                     \
-	.name            = #overlay_name,                \
+#define OVERLAY_INFO(overlay_name, expected)               \
+{	.dtbo_begin       = __dtbo_##overlay_name##_begin, \
+	.dtbo_end         = __dtbo_##overlay_name##_end,   \
+	.expected_result = expected,                       \
+	.name            = #overlay_name,                  \
 }
 
 struct overlay_info {
-	uint8_t		*dtb_begin;
-	uint8_t		*dtb_end;
+	uint8_t		*dtbo_begin;
+	uint8_t		*dtbo_end;
 	int		expected_result;
 	int		overlay_id;
 	char		*name;
@@ -2887,7 +2887,7 @@ static struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_bad_phandle, -EINVAL),
 	OVERLAY_INFO(overlay_bad_symbol, -EINVAL),
 	/* end marker */
-	{.dtb_begin = NULL, .dtb_end = NULL, .expected_result = 0, .name = NULL}
+	{.dtbo_begin = NULL, .dtbo_end = NULL, .expected_result = 0, .name = NULL}
 };
 
 static struct device_node *overlay_base_root;
@@ -2944,13 +2944,13 @@ void __init unittest_unflatten_overlay_base(void)
 		return;
 	}
 
-	data_size = info->dtb_end - info->dtb_begin;
+	data_size = info->dtbo_end - info->dtbo_begin;
 	if (!data_size) {
 		pr_err("No dtb 'overlay_base' to attach\n");
 		return;
 	}
 
-	size = fdt_totalsize(info->dtb_begin);
+	size = fdt_totalsize(info->dtbo_begin);
 	if (size != data_size) {
 		pr_err("dtb 'overlay_base' header totalsize != actual size");
 		return;
@@ -2962,7 +2962,7 @@ void __init unittest_unflatten_overlay_base(void)
 		return;
 	}
 
-	memcpy(new_fdt, info->dtb_begin, size);
+	memcpy(new_fdt, info->dtbo_begin, size);
 
 	__unflatten_device_tree(new_fdt, NULL, &overlay_base_root,
 				dt_alloc_memory, true);
@@ -2997,11 +2997,11 @@ static int __init overlay_data_apply(const char *overlay_name, int *overlay_id)
 		return 0;
 	}
 
-	size = info->dtb_end - info->dtb_begin;
+	size = info->dtbo_end - info->dtbo_begin;
 	if (!size)
 		pr_err("no overlay data for %s\n", overlay_name);
 
-	ret = of_overlay_fdt_apply(info->dtb_begin, size, &info->overlay_id);
+	ret = of_overlay_fdt_apply(info->dtbo_begin, size, &info->overlay_id);
 	if (overlay_id)
 		*overlay_id = info->overlay_id;
 	if (ret < 0)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index bc045a54a34e..5be0dc2b2b26 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -347,7 +347,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
 $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
-$(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
+$(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
 overlay-y := $(addprefix $(obj)/, $(overlay-y))
-- 
Frank Rowand <frank.rowand@sony.com>

