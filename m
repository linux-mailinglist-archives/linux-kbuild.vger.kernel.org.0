Return-Path: <linux-kbuild+bounces-2532-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86693171D
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9669C1F21ACE
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 14:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C93F18F2F3;
	Mon, 15 Jul 2024 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDj0UG7M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F5218F2EE;
	Mon, 15 Jul 2024 14:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054741; cv=none; b=HjA3oVhKPpUG/iWS3s1OgERZizrUt+7RJ6dhvQAmxrEUs//XHqnmYHvdBYrtg1D7eUkjRgtT27ol6IG+vfTMoEYZE53xTn4EXIQvgAwQPg8kMIblDVv0oQQWfMmIoAm2mHxRWD60ouzP+fes6MGZfgsuFuQ6vvglvKIgeCq1CiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054741; c=relaxed/simple;
	bh=I1UKVVzTnNKGlxUmplZAsSSIQ8883iIB3GCT7nIEdKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsXuVRhAHXvhSJBjAdwx+Nm04T7nRLQIXT/6ngEtqwWiLax6W/SpZsTDiePC5M8t7adNc+7fNnhNBQmJ/q1K+8fnV0kCA89gQN2TVQwzJibGr7rbBe9chfTm0bo8wQwAkvOuuiFCijX9bHPg7lTDOCundZVGaS753BoH/v2S5BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDj0UG7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879F6C4AF0D;
	Mon, 15 Jul 2024 14:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721054740;
	bh=I1UKVVzTnNKGlxUmplZAsSSIQ8883iIB3GCT7nIEdKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CDj0UG7MClDGkxtKpABt17Xl/QcJqOPXSh+I5BXR5aFhJblhpO/MWFdHKKUhYkYce
	 T13cRkvY4SqwGLT+OgLJ7pShkkIN37Fp88TiSIWVzsYCpMqe+98efWa1L303Xxh0LA
	 Ti8P1N5Hh0LVpyOez97iBqyFQtjit54mrR75aGbzS2vvX4/VN1Y4TYYQxB+mpDX52M
	 C6S8vBk6w+eTLBqBL1saX8/ehld3mrKAmpO85gjqjZugOsmN5rA6yfrwuFLSsvdjnS
	 GEbUNvNNp85tpOxuoZ0shILsPvpQWNleJdXuasz67odiQ4zbiJHK+3ci7md053GB0z
	 11TAu/2w4Ne+Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] fortify: refactor test_fortify Makefile to fix some build problems
Date: Mon, 15 Jul 2024 23:45:24 +0900
Message-ID: <20240715144529.101634-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715144529.101634-1-masahiroy@kernel.org>
References: <20240715144529.101634-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some issues in the test_fortify Makefile code.

Problem 1: cc-disable-warning invokes compiler dozens of times

To see how many times the cc-disable-warning is evaluated, change
this code:

  $(call cc-disable-warning,fortify-source)

to:

  $(call cc-disable-warning,$(shell touch /tmp/fortify-$$$$)fortify-source)

Then, build the kernel with CONFIG_FORTIFY_SOURCE=y. You will see a
large number of '/tmp/fortify-<PID>' files created:

  $ ls -1 /tmp/fortify-* | wc
       80      80    1600

This means the compiler was invoked 80 times just for checking the
-Wno-fortify-source flag support.

$(call cc-disable-warning,fortify-source) should be added to a simple
variable instead of a recursive variable.

Problem 2: do not recompile string.o when the test code is updated

The test cases are independent of the kernel. However, when the test
code is updated, $(obj)/string.o is rebuilt and vmlinux is relinked
due to this dependency:

  $(obj)/string.o: $(obj)/$(TEST_FORTIFY_LOG)

always-y is suitable for building the log files.

Problem 3: redundant code

  clean-files += $(addsuffix .o, $(TEST_FORTIFY_LOGS))

... is unneeded because the top Makefile globally cleans *.o files.

This commit fixes these issues and makes the code readable.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 lib/.gitignore              |  2 --
 lib/Makefile                | 36 +-----------------------------------
 lib/test_fortify/.gitignore |  2 ++
 lib/test_fortify/Makefile   | 25 +++++++++++++++++++++++++
 4 files changed, 28 insertions(+), 37 deletions(-)
 create mode 100644 lib/test_fortify/.gitignore
 create mode 100644 lib/test_fortify/Makefile

diff --git a/lib/.gitignore b/lib/.gitignore
index 54596b634ecb..101a4aa92fb5 100644
--- a/lib/.gitignore
+++ b/lib/.gitignore
@@ -5,5 +5,3 @@
 /gen_crc32table
 /gen_crc64table
 /oid_registry_data.c
-/test_fortify.log
-/test_fortify/*.log
diff --git a/lib/Makefile b/lib/Makefile
index 429b259b5b64..689adbeb6c4c 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -393,38 +393,4 @@ obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 
 obj-$(CONFIG_FIRMWARE_TABLE) += fw_table.o
 
-# FORTIFY_SOURCE compile-time behavior tests
-TEST_FORTIFY_SRCS = $(wildcard $(src)/test_fortify/*-*.c)
-TEST_FORTIFY_LOGS = $(patsubst $(src)/%.c, %.log, $(TEST_FORTIFY_SRCS))
-TEST_FORTIFY_LOG = test_fortify.log
-
-quiet_cmd_test_fortify = TEST    $@
-      cmd_test_fortify = $(CONFIG_SHELL) $(srctree)/scripts/test_fortify.sh \
-			$< $@ "$(NM)" $(CC) $(c_flags) \
-			$(call cc-disable-warning,fortify-source) \
-			-DKBUILD_EXTRA_WARN1
-
-targets += $(TEST_FORTIFY_LOGS)
-clean-files += $(TEST_FORTIFY_LOGS)
-clean-files += $(addsuffix .o, $(TEST_FORTIFY_LOGS))
-$(obj)/test_fortify/%.log: $(src)/test_fortify/%.c \
-			   $(srctree)/scripts/test_fortify.sh \
-			   FORCE
-	$(call if_changed_dep,test_fortify)
-
-quiet_cmd_gen_fortify_log = GEN     $@
-      cmd_gen_fortify_log = cat </dev/null $(filter-out FORCE,$^) 2>/dev/null > $@ || true
-
-targets += $(TEST_FORTIFY_LOG)
-clean-files += $(TEST_FORTIFY_LOG)
-$(obj)/$(TEST_FORTIFY_LOG): $(addprefix $(obj)/, $(TEST_FORTIFY_LOGS)) FORCE
-	$(call if_changed,gen_fortify_log)
-
-# Fake dependency to trigger the fortify tests.
-ifeq ($(CONFIG_FORTIFY_SOURCE),y)
-$(obj)/string.o: $(obj)/$(TEST_FORTIFY_LOG)
-endif
-
-# Some architectures define __NO_FORTIFY if __SANITIZE_ADDRESS__ is undefined.
-# Pass CFLAGS_KASAN to avoid warnings.
-$(foreach x, $(patsubst %.log,%.o,$(TEST_FORTIFY_LOGS)), $(eval KASAN_SANITIZE_$(x) := y))
+subdir-$(CONFIG_FORTIFY_SOURCE) += test_fortify
diff --git a/lib/test_fortify/.gitignore b/lib/test_fortify/.gitignore
new file mode 100644
index 000000000000..c1ba37d14b50
--- /dev/null
+++ b/lib/test_fortify/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/*.log
diff --git a/lib/test_fortify/Makefile b/lib/test_fortify/Makefile
new file mode 100644
index 000000000000..8c5bee33ee36
--- /dev/null
+++ b/lib/test_fortify/Makefile
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ccflags-y := $(call cc-disable-warning,fortify-source)
+
+quiet_cmd_test_fortify = TEST    $@
+      cmd_test_fortify = $(CONFIG_SHELL) $(srctree)/scripts/test_fortify.sh \
+			$< $@ "$(NM)" $(CC) $(c_flags) -DKBUILD_EXTRA_WARN1
+
+$(obj)/%.log: $(src)/%.c $(srctree)/scripts/test_fortify.sh FORCE
+	$(call if_changed_dep,test_fortify)
+
+logs = $(patsubst $(src)/%.c, %.log, $(wildcard $(src)/*-*.c))
+targets += $(logs)
+
+quiet_cmd_gen_fortify_log = CAT     $@
+      cmd_gen_fortify_log = cat $(or $(real-prereqs),/dev/null) > $@
+
+$(obj)/test_fortify.log: $(addprefix $(obj)/, $(logs)) FORCE
+	$(call if_changed,gen_fortify_log)
+
+always-y += test_fortify.log
+
+# Some architectures define __NO_FORTIFY if __SANITIZE_ADDRESS__ is undefined.
+# Pass CFLAGS_KASAN to avoid warnings.
+KASAN_SANITIZE := y
-- 
2.43.0


