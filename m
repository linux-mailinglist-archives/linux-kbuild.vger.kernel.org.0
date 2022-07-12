Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3EC57148E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jul 2022 10:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbiGLI34 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jul 2022 04:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbiGLI3y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jul 2022 04:29:54 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77F7E313B4;
        Tue, 12 Jul 2022 01:29:53 -0700 (PDT)
Received: from tincan.cable.virginm.net (cpc108961-cmbg20-2-0-cust263.5-4.cable.virginm.net [80.5.129.8])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 099166601A21;
        Tue, 12 Jul 2022 09:29:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1657614592;
        bh=qF5KsrDk1wnJCMbBrz32Fq0ehFqJG1C5/xkAwgDIVao=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SEGlmd5rDB2m9XHEIjnCSNJWMSNihvWqQNNeHjMDYzIcomUSjxpMBVOlg8VwCOdcp
         t+z5cjubde5NsojLt2oIb/PgoavQNyOV9FRDfJ131JbepmiMYtoSjJAS8n0bhju/Sb
         B1uYTg2ZUkJCK93ptuzn0V4ShlaqobrsaCs0C/FA2NubdpzrJPdb/0Anj+nhVnuG+D
         vwOJq2zrPi4+DrQJdLMqi/OHYaieUzs5ZDrdKVJNJzJYreiXfyiuR/uMGxeYuUTHDT
         EoDLckF+eWeBbIkcAFF4yaZejrrhrpew2PCpyHhCVIQFAqRJ4ai/thNQ+P/cXjGapd
         LwrlclfQTCIFg==
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Shuah Khan <shuah@kernel.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>, Tim.Bird@sony.com,
        kernel@collabora.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/4] selftests: stop using KSFT_KHDR_INSTALL
Date:   Tue, 12 Jul 2022 09:29:46 +0100
Message-Id: <da799d61cc670da0473e14dceadec3e00cf324aa.1657614127.git.guillaume.tucker@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1657614127.git.guillaume.tucker@collabora.com>
References: <cover.1657614127.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Stop using the KSFT_KHDR_INSTALL flag as installing the kernel headers
from the kselftest Makefile is causing some issues.  Instead, rely on
the headers to be installed directly by the top-level Makefile
"headers_install" make target prior to building kselftest.

Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 tools/testing/selftests/arm64/mte/Makefile              | 1 -
 tools/testing/selftests/arm64/signal/Makefile           | 1 -
 tools/testing/selftests/arm64/signal/test_signals.h     | 4 +---
 tools/testing/selftests/drivers/s390x/uvdevice/Makefile | 1 -
 tools/testing/selftests/futex/functional/Makefile       | 1 -
 tools/testing/selftests/kvm/Makefile                    | 1 -
 tools/testing/selftests/landlock/Makefile               | 1 -
 tools/testing/selftests/net/Makefile                    | 1 -
 tools/testing/selftests/net/mptcp/Makefile              | 1 -
 tools/testing/selftests/tc-testing/Makefile             | 1 -
 tools/testing/selftests/vm/Makefile                     | 1 -
 11 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/Makefile b/tools/testing/selftests/arm64/mte/Makefile
index 409e3e53d00a..a5a0744423d8 100644
--- a/tools/testing/selftests/arm64/mte/Makefile
+++ b/tools/testing/selftests/arm64/mte/Makefile
@@ -22,7 +22,6 @@ ifeq ($(mte_cc_support),1)
 TEST_GEN_PROGS := $(PROGS)
 
 # Get Kernel headers installed and use them.
-KSFT_KHDR_INSTALL := 1
 else
     $(warning compiler "$(CC)" does not support the ARMv8.5 MTE extension.)
     $(warning test program "mte" will not be created.)
diff --git a/tools/testing/selftests/arm64/signal/Makefile b/tools/testing/selftests/arm64/signal/Makefile
index ac4ad0005715..be7520a863b0 100644
--- a/tools/testing/selftests/arm64/signal/Makefile
+++ b/tools/testing/selftests/arm64/signal/Makefile
@@ -11,7 +11,6 @@ PROGS := $(patsubst %.c,%,$(SRCS))
 TEST_GEN_PROGS := $(notdir $(PROGS))
 
 # Get Kernel headers installed and use them.
-KSFT_KHDR_INSTALL := 1
 
 # Including KSFT lib.mk here will also mangle the TEST_GEN_PROGS list
 # to account for any OUTPUT target-dirs optionally provided by
diff --git a/tools/testing/selftests/arm64/signal/test_signals.h b/tools/testing/selftests/arm64/signal/test_signals.h
index c70fdec7d7c4..0c645834ddc3 100644
--- a/tools/testing/selftests/arm64/signal/test_signals.h
+++ b/tools/testing/selftests/arm64/signal/test_signals.h
@@ -9,9 +9,7 @@
 #include <ucontext.h>
 
 /*
- * Using ARCH specific and sanitized Kernel headers installed by KSFT
- * framework since we asked for it by setting flag KSFT_KHDR_INSTALL
- * in our Makefile.
+ * Using ARCH specific and sanitized Kernel headers from the tree.
  */
 #include <asm/ptrace.h>
 #include <asm/hwcap.h>
diff --git a/tools/testing/selftests/drivers/s390x/uvdevice/Makefile b/tools/testing/selftests/drivers/s390x/uvdevice/Makefile
index 5e701d2708d4..891215a7dc8a 100644
--- a/tools/testing/selftests/drivers/s390x/uvdevice/Makefile
+++ b/tools/testing/selftests/drivers/s390x/uvdevice/Makefile
@@ -11,7 +11,6 @@ else
 TEST_GEN_PROGS := test_uvdevice
 
 top_srcdir ?= ../../../../../..
-KSFT_KHDR_INSTALL := 1
 khdr_dir = $(top_srcdir)/usr/include
 LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 
diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index b8152c573e8a..732149011692 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -22,7 +22,6 @@ TEST_GEN_FILES := \
 TEST_PROGS := run.sh
 
 top_srcdir = ../../../../..
-KSFT_KHDR_INSTALL := 1
 DEFAULT_INSTALL_HDR_PATH := 1
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 81470a99ed1c..e15bb9693922 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -4,7 +4,6 @@ include ../../../build/Build.include
 all:
 
 top_srcdir = ../../../..
-KSFT_KHDR_INSTALL := 1
 
 # For cross-builds to work, UNAME_M has to map to ARCH and arch specific
 # directories and targets in this Makefile. "uname -m" doesn't map to
diff --git a/tools/testing/selftests/landlock/Makefile b/tools/testing/selftests/landlock/Makefile
index 0b0049e133bb..1313e44e8fb9 100644
--- a/tools/testing/selftests/landlock/Makefile
+++ b/tools/testing/selftests/landlock/Makefile
@@ -8,7 +8,6 @@ TEST_GEN_PROGS := $(src_test:.c=)
 
 TEST_GEN_PROGS_EXTENDED := true
 
-KSFT_KHDR_INSTALL := 1
 OVERRIDE_TARGETS := 1
 include ../lib.mk
 
diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 464df13831f2..eaf3bb457576 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -63,7 +63,6 @@ TEST_GEN_FILES += bind_bhash_test
 
 TEST_FILES := settings
 
-KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
 include bpf/Makefile
diff --git a/tools/testing/selftests/net/mptcp/Makefile b/tools/testing/selftests/net/mptcp/Makefile
index f905d5358e68..1af2f66fb59a 100644
--- a/tools/testing/selftests/net/mptcp/Makefile
+++ b/tools/testing/selftests/net/mptcp/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 top_srcdir = ../../../../..
-KSFT_KHDR_INSTALL := 1
 
 CFLAGS =  -Wall -Wl,--no-as-needed -O2 -g -I$(top_srcdir)/usr/include $(KHDR_INCLUDES)
 
diff --git a/tools/testing/selftests/tc-testing/Makefile b/tools/testing/selftests/tc-testing/Makefile
index 4d639279f41e..cb553eac9f41 100644
--- a/tools/testing/selftests/tc-testing/Makefile
+++ b/tools/testing/selftests/tc-testing/Makefile
@@ -5,7 +5,6 @@ top_srcdir = $(abspath ../../../..)
 APIDIR := $(top_scrdir)/include/uapi
 TEST_GEN_FILES = action.o
 
-KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
 PROBE := $(shell $(LLC) -march=bpf -mcpu=probe -filetype=null /dev/null 2>&1)
diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 44f25acfbeca..108587cb327a 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -94,7 +94,6 @@ TEST_PROGS := run_vmtests.sh
 TEST_FILES := test_vmalloc.sh
 TEST_FILES += test_hmm.sh
 
-KSFT_KHDR_INSTALL := 1
 include ../lib.mk
 
 $(OUTPUT)/madv_populate: vm_util.c
-- 
2.30.2

