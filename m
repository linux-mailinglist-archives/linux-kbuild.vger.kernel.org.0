Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17578441C9C
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Nov 2021 15:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhKAOcB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Nov 2021 10:32:01 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59395 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhKAOcA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Nov 2021 10:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635776967; x=1667312967;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B5fKvlYLxZV/WKO9MT5POqMifapp4RX+wc2bjemrwtc=;
  b=U9Uvq69xjKLMBZOhsDtbmz84s+YoBikQpVzeeVHqeKFqKizCv/Lh4deg
   9lweQRv4glqb9/mZwSQFXtGRBrcplhzGCSItiBGri3PzP+B8DGM/drxSf
   3Pcx2/aCpwYmPdBo6O9T4FdN7FcAWoZnPWH7N1jAMjjFFbHuTYFq/oaA3
   U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 01 Nov 2021 07:29:27 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2021 07:29:27 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 07:29:26 -0700
Received: from qian-HP-Z2-SFF-G5-Workstation.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 1 Nov 2021 07:29:25 -0700
From:   Qian Cai <quic_qiancai@quicinc.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qian Cai <quic_qiancai@quicinc.com>
Subject: [PATCH v3] configs: Introduce debug.config for CI-like setup
Date:   Mon, 1 Nov 2021 10:28:58 -0400
Message-ID: <20211101142858.8267-1-quic_qiancai@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some general debugging features like kmemleak, KASAN, lockdep, UBSAN etc
help fix many viruses like a microscope. On the other hand, those features
are scatter around and mixed up with more situational debugging options
making them difficult to consume properly. This cold help amplify the
general debugging/testing efforts and help establish sensitive default
values for those options across the broad.

The config is based on years' experiences running daily CI inside the
largest enterprise Linux distro company to seek regressions on
linux-next builds on different bare-metal and virtual platforms. This is
more of some art than science. It can be used for example,

$ make ARCH=arm64 defconfig debug.config

Signed-off-by: Qian Cai <quic_qiancai@quicinc.com>
---
v3:
- Reorganize options into different sections.
- Remove options that not user-visible.
- Add a comment header to debug.config.

 kernel/configs/debug.config | 107 ++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 kernel/configs/debug.config

diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
new file mode 100644
index 000000000000..b4002ba696a7
--- /dev/null
+++ b/kernel/configs/debug.config
@@ -0,0 +1,107 @@
+# The config is based on running daily CI for enterprise Linux distros to
+# seek regressions on linux-next builds on different bare-metal and virtual
+# platforms. It can be used for example,
+#
+# $ make ARCH=arm64 defconfig debug.config
+#
+# Keep alphabetically sorted inside each section.
+#
+# printk and dmesg options
+#
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_PRINTK_CALLER=y
+CONFIG_PRINTK_TIME=y
+CONFIG_SYMBOLIC_ERRNAME=y
+#
+# Compile-time checks and compiler options
+#
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_FRAME_WARN=2048
+CONFIG_SECTION_MISMATCH_WARN_ONLY=y
+#
+# Generic Kernel Debugging Instruments
+#
+# CONFIG_UBSAN_ALIGNMENT is not set
+# CONFIG_UBSAN_DIV_ZERO is not set
+# CONFIG_UBSAN_TRAP is not set
+# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_FS_ALLOW_ALL=y
+CONFIG_DEBUG_IRQFLAGS=y
+CONFIG_UBSAN=y
+CONFIG_UBSAN_BOOL=y
+CONFIG_UBSAN_BOUNDS=y
+CONFIG_UBSAN_ENUM=y
+CONFIG_UBSAN_SHIFT=y
+CONFIG_UBSAN_UNREACHABLE=y
+#
+# Memory Debugging
+#
+# CONFIG_DEBUG_PAGEALLOC is not set
+# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
+# CONFIG_DEBUG_RODATA_TEST is not set
+# CONFIG_DEBUG_WX is not set
+# CONFIG_KFENCE is not set
+# CONFIG_PAGE_POISONING is not set
+# CONFIG_SLUB_STATS is not set
+CONFIG_PAGE_EXTENSION=y
+CONFIG_PAGE_OWNER=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
+CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=80000
+CONFIG_DEBUG_OBJECTS=y
+CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
+CONFIG_DEBUG_OBJECTS_FREE=y
+CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
+CONFIG_DEBUG_OBJECTS_TIMERS=y
+CONFIG_DEBUG_OBJECTS_WORK=y
+CONFIG_DEBUG_PER_CPU_MAPS=y
+CONFIG_DEBUG_STACK_USAGE=y
+CONFIG_DEBUG_VIRTUAL=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_VM_RB=y
+CONFIG_DEBUG_VM_VMACACHE=y
+CONFIG_GENERIC_PTDUMP=y
+CONFIG_KASAN=y
+CONFIG_KASAN_GENERIC=y
+CONFIG_KASAN_INLINE=y
+CONFIG_KASAN_VMALLOC=y
+CONFIG_PTDUMP_DEBUGFS=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_SLUB_DEBUG_ON=y
+#
+# Debug Oops, Lockups and Hangs
+#
+# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=0
+CONFIG_SOFTLOCKUP_DETECTOR=y
+#
+# Lock Debugging (spinlocks, mutexes, etc...)
+#
+# CONFIG_PROVE_RAW_LOCK_NESTING is not set
+CONFIG_PROVE_LOCKING=y
+#
+# Debug kernel data structures
+#
+CONFIG_BUG_ON_DATA_CORRUPTION=y
+#
+# RCU Debugging
+#
+CONFIG_PROVE_RCU=y
+CONFIG_PROVE_RCU_LIST=y
+CONFIG_RCU_CPU_STALL_TIMEOUT=60
+#
+# Tracers
+#
+CONFIG_BRANCH_PROFILE_NONE=y
+CONFIG_DYNAMIC_FTRACE=y
+CONFIG_FTRACE=y
+CONFIG_FUNCTION_TRACER=y
-- 
2.30.2

