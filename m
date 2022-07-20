Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72AB57B699
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jul 2022 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbiGTMlz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jul 2022 08:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbiGTMlz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jul 2022 08:41:55 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382B867CBE
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jul 2022 05:41:54 -0700 (PDT)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 29C663F0E1
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jul 2022 12:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1658320912;
        bh=Y+9o9GFX1ufwCQQNftB4eyTX1KW13yoadiZ61emz3PM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=IlXf4AMFX3+PcHTEXcf+i+gdEf1THrbHmKwjtIWQ9eaAAk9QsOtW4k8EmS+nCgfUI
         PpUBYsY//GIL3DekW2QNAOlNVCZmYouGkpe5jrT2O3G2e9NsQKOBLFn9xvOr/t3hU1
         gOruDQ7Zj6RhL+mFvh9l2vfT3daSs3i3WvBGNKnDEEB/PCShW1tsrXczdjLrkf6Z2U
         um2zAJ/U3fz5efUpbxmhr0k8QO4cLcDhduUdOZiX2uTd+vJbrO0Gohkqs7n1Lu0BUu
         nqWiHv6j2ESoO2Zj6nIPsTWkINn6Tpk/yHSFPFlCbZTSaGoQp6/umKL/ZIL1WKHzEq
         XkVA+5P01WnUw==
Received: by mail-wr1-f72.google.com with SMTP id q17-20020adfab11000000b0021e4c9ca970so222450wrc.20
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jul 2022 05:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y+9o9GFX1ufwCQQNftB4eyTX1KW13yoadiZ61emz3PM=;
        b=TAqJEkDUbO4JuvrwvLuBnkZFasg475v8OgTSlgmglAEQxDKSLzzi6kDY7TrEifNixj
         t4wcb8QZci5kTrj9Uw4NG2/x9hAxlQSO91b0JV9sY2reBFbaarxs7XhMue8aVjYVbmGC
         8p3UT82ghMcKyI8B+hh84qNJqncx9Ucap1XBRXntwuaWKzcrlqtG8Oys5RrasD5GtjP9
         Sn/n26ihMc1bXWSdw2VHU/e+fMFhvbtKYE7aVTp5/9bKQpdMELzVcHQuVIip5HmyDT/8
         N8Po6PhlzFQWAvH3eS9F8qtFAEHfQE/995ZHGpnH0sUfUTRDa+nestDEQf87qxAXvKPx
         S+yA==
X-Gm-Message-State: AJIora8vF+mmhc7HNCns+1VV+6UR3XlHSNZwbtTckaLHGGtuNFKCMVop
        uFFUOtLKCpGbiOjO+fAziLvAjPnq6iVc1AY/4EbM4eOGnD0BpWr5qUbfZol2X3eTiWKselEweaQ
        LuqwLASh081gXBUdWSGs4mbt6XXnR5FCLvXksD3j/9g==
X-Received: by 2002:a05:600c:3512:b0:3a3:f39:5735 with SMTP id h18-20020a05600c351200b003a30f395735mr3843864wmq.165.1658320911263;
        Wed, 20 Jul 2022 05:41:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sD3mkpRaKL6ug0/dKvmXLr/1spERmTEgL9iklugP9KjoO+uOlNO/PcjbC7UDTHmV3y4cSdow==
X-Received: by 2002:a05:600c:3512:b0:3a3:f39:5735 with SMTP id h18-20020a05600c351200b003a30f395735mr3843839wmq.165.1658320911002;
        Wed, 20 Jul 2022 05:41:51 -0700 (PDT)
Received: from localhost ([2a01:4b00:85fd:d700:e4f3:532d:c9d0:df5d])
        by smtp.gmail.com with ESMTPSA id m39-20020a05600c3b2700b003a2e1883a27sm3349079wms.18.2022.07.20.05.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 05:41:50 -0700 (PDT)
From:   Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net,
        ndesaulniers@google.com
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, trix@redhat.com
Subject: [PATCH] kbuild: introduce $(GCC) variable for path-prefix or version-suffix
Date:   Wed, 20 Jul 2022 13:41:37 +0100
Message-Id: <20220720124137.151714-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Introduce $(GCC) variable with similar semantics to $(LLVM) for
setting path-prefix or version-suffix.

Currently to correctly and consistently use gcc-10 on Ubuntu 20.04
LTS, to cross compile a kernel one has to do:

$ make ... CROSS_COMPILE=riscv64-linux-gnu- \
           CC=riscv64-linux-gnu-gcc-10 \
           HOSTCC=gcc-10 \
           HOSTCXX=g++-10

With this change

$ make ... CROSS_COMPILE=riscv64-linux-gnu- GCC=-10

is sufficient to correctly select a consistent CC/HOSTCC/HOSTCXX set.

Similarly GCC=/path/to/unpacked/toolchains/ can be used to select
toolchain outside of PATH.

Update documentation for LLVM variable, and mention that GCC variable
can be used in a similar fashion to set path-prefix, or
version-suffix.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 Documentation/kbuild/kbuild.rst | 12 ++++++++++--
 Makefile                        | 12 +++++++++---
 tools/testing/selftests/lib.mk  |  2 +-
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index ef19b9c13523..6382b082018e 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -276,5 +276,13 @@ whoami and host, respectively.
 
 LLVM
 ----
-If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
-of GCC and GNU binutils to build the kernel.
+If this variable is set to 1, Kbuild will use Clang and LLVM utilities
+instead of GCC and GNU binutils to build the kernel. It can also be
+used to set a path prefix, or a version suffix, see "Building
+Linux with Clang/LLVM".
+
+GCC
+---
+This variable can be used similar to LLVM variable above to set a path
+prefix, or a version suffix for GNU Toolchain binaries. See examples
+in "Building Linux with Clang/LLVM".
diff --git a/Makefile b/Makefile
index 00fd80c5dd6e..e7bd0b572b14 100644
--- a/Makefile
+++ b/Makefile
@@ -433,8 +433,14 @@ endif
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
 HOSTCXX	= $(LLVM_PREFIX)clang++$(LLVM_SUFFIX)
 else
-HOSTCC	= gcc
-HOSTCXX	= g++
+ifneq ($(filter %/,$(GCC)),)
+GCC_PREFIX := $(GCC)
+else ifneq ($(filter -%,$(GCC)),)
+GCC_SUFFIX := $(GCC)
+endif
+
+HOSTCC	= $(GCC_PREFIX)gcc$(GCC_SUFFIX)
+HOSTCXX	= $(GCC_PREFIX)g++$(GCC_SUFFIX)
 endif
 HOSTPKG_CONFIG	= pkg-config
 
@@ -461,7 +467,7 @@ OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
 else
-CC		= $(CROSS_COMPILE)gcc
+CC		= $(GCC_PREFIX)$(CROSS_COMPILE)gcc$(GCC_SUFFIX)
 LD		= $(CROSS_COMPILE)ld
 AR		= $(CROSS_COMPILE)ar
 NM		= $(CROSS_COMPILE)nm
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 1a5cc3cd97ec..777757d54f42 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -30,7 +30,7 @@ endif # CROSS_COMPILE
 
 CC := $(LLVM_PREFIX)clang$(LLVM_SUFFIX) $(CLANG_FLAGS) -fintegrated-as
 else
-CC := $(CROSS_COMPILE)gcc
+CC := $(GCC_PREFIX)$(CROSS_COMPILE)gcc$(GCC_SUFFIX)
 endif # LLVM
 
 ifeq (0,$(MAKELEVEL))
-- 
2.34.1

