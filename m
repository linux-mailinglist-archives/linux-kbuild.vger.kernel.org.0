Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C40CF445700
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Nov 2021 17:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhKDQSC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Nov 2021 12:18:02 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:58896 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231419AbhKDQSC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Nov 2021 12:18:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636042524; x=1667578524;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lxUDkF/DKqszv+vGgiO5YcLNJdQE7tjfmMQGwGrzaD4=;
  b=OWR1gsOiyWVFFSb+e7Ti4EAJeLRcxRRx8+XUAcNVYkx9mHSNTu7ojr9h
   mogtvtCEEpypsQ5HIxQOq93y/6v7Rln53rvzPZT+ZJJ4NoRk2Ddw6R0dW
   8WjyQWWq2EWUVMNk2816I3EUW1BdrRT/0T0CGsVF/FEw+AT1FgZgjMloG
   0=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 Nov 2021 09:15:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 09:15:23 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 4 Nov 2021 09:15:23 -0700
Received: from qian-HP-Z2-SFF-G5-Workstation.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 4 Nov 2021 09:15:22 -0700
From:   Qian Cai <quic_qiancai@quicinc.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qian Cai <quic_qiancai@quicinc.com>
Subject: [PATCH v4] configs: Introduce debug.config for CI-like setup
Date:   Thu, 4 Nov 2021 12:15:04 -0400
Message-ID: <20211104161504.11806-1-quic_qiancai@quicinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
linux-next builds on different bare-metal and virtual platforms. It can be
used for example,

$ make ARCH=arm64 defconfig debug.config

Signed-off-by: Qian Cai <quic_qiancai@quicinc.com>
---
v4:
Drop CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE because a patch was sent upstream
to make the default value great again.

https://lore.kernel.org/lkml/20211104155623.11158-1-quic_qiancai@quicinc.com/

 kernel/configs/debug.config | 106 ++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 kernel/configs/debug.config

diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
new file mode 100644
index 000000000000..9d6375930048
--- /dev/null
+++ b/kernel/configs/debug.config
@@ -0,0 +1,106 @@
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

