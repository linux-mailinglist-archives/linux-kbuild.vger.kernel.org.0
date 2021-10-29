Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A3043F582
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 05:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhJ2Drd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 23:47:33 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22800 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbhJ2Drc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 23:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635479105; x=1667015105;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=naRok50L8z+Gq6O3oKapVcQxMNbixW5H72GMSVPA0mI=;
  b=kAacePV86sCotR0v4m2INtir7HDFH9uYvJKi5dx9fxHEDWlyuVGlwAoY
   g83bloOPTzJXiA6mFUpd92bAXpU3N1cT5t/KbDsBg6jOB4xBvVHvcZlJY
   nLr0HIciekXzbjdTX5pURJJFKOjm+Xj3g+MD0p88kkAIkB9+7XthzcD3l
   8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 28 Oct 2021 20:45:04 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 20:45:03 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 20:45:03 -0700
Received: from qian-HP-Z2-SFF-G5-Workstation.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 28 Oct 2021 20:45:02 -0700
From:   Qian Cai <quic_qiancai@quicinc.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qian Cai <quic_qiancai@quicinc.com>
Subject: [PATCH v2] configs: Introduce debug.config for CI-like setup
Date:   Thu, 28 Oct 2021 23:44:34 -0400
Message-ID: <20211029034434.24553-1-quic_qiancai@quicinc.com>
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
v2:
Double the size of CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE due to the most
of defconfigs used 4KB page instead of 64KB which would consume more early
kmemleak objects to track early_pgtable_alloc(). Otherwise, we could
run out of kmemleak early memory pool and disable kmemleak entirely.

 kernel/configs/debug.config | 119 ++++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)
 create mode 100644 kernel/configs/debug.config

diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
new file mode 100644
index 000000000000..fea127155eb6
--- /dev/null
+++ b/kernel/configs/debug.config
@@ -0,0 +1,119 @@
+# Keep alphabetically sorted.
+#
+# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
+# CONFIG_DEBUG_PAGEALLOC is not set
+# CONFIG_DEBUG_RODATA_TEST is not set
+# CONFIG_DEBUG_WX is not set
+# CONFIG_KFENCE is not set
+# CONFIG_PAGE_POISONING is not set
+# CONFIG_PROVE_RAW_LOCK_NESTING is not set
+# CONFIG_SLUB_STATS is not set
+# CONFIG_UBSAN_ALIGNMENT is not set
+# CONFIG_UBSAN_DIV_ZERO is not set
+# CONFIG_UBSAN_TRAP is not set
+# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+CONFIG_BUG_ON_DATA_CORRUPTION=y
+CONFIG_CONTEXT_SWITCH_TRACER=y
+CONFIG_DEBUG_ATOMIC_SLEEP=y
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_FS_ALLOW_ALL=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_IRQFLAGS=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
+CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=80000
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_LIST=y
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
+CONFIG_DEBUG_OBJECTS_FREE=y
+CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
+CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
+CONFIG_DEBUG_OBJECTS_TIMERS=y
+CONFIG_DEBUG_OBJECTS_WORK=y
+CONFIG_DEBUG_OBJECTS=y
+CONFIG_DEBUG_PER_CPU_MAPS=y
+CONFIG_DEBUG_RT_MUTEXES=y
+CONFIG_DEBUG_RWSEMS=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_STACK_USAGE=y
+CONFIG_DEBUG_VIRTUAL=y
+CONFIG_DEBUG_VM_PGFLAGS=y
+CONFIG_DEBUG_VM_RB=y
+CONFIG_DEBUG_VM_VMACACHE=y
+CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DYNAMIC_DEBUG_CORE=y
+CONFIG_DYNAMIC_DEBUG=y
+CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
+CONFIG_DYNAMIC_FTRACE=y
+CONFIG_EVENT_TRACING=y
+CONFIG_FRAME_POINTER=y
+CONFIG_FRAME_WARN=2048
+CONFIG_FTRACE_MCOUNT_RECORD=y
+CONFIG_FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY=y
+CONFIG_FTRACE=y
+CONFIG_FUNCTION_TRACER=y
+CONFIG_GENERIC_PTDUMP=y
+CONFIG_GENERIC_TRACER=y
+CONFIG_IO_STRICT_DEVMEM=y
+CONFIG_KASAN_GENERIC=y
+CONFIG_KASAN_INLINE=y
+CONFIG_KASAN_STACK=y
+CONFIG_KASAN_VMALLOC=y
+CONFIG_KASAN=y
+CONFIG_LOCK_DEBUGGING_SUPPORT=y
+CONFIG_LOCKDEP_BITS=15
+CONFIG_LOCKDEP_CHAINS_BITS=16
+CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
+CONFIG_LOCKDEP_STACK_TRACE_BITS=19
+CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
+CONFIG_LOCKDEP=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
+CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
+CONFIG_MAGIC_SYSRQ_SERIAL=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_NOP_TRACER=y
+CONFIG_PAGE_EXTENSION=y
+CONFIG_PAGE_OWNER=y
+CONFIG_PANIC_ON_OOPS_VALUE=1
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=0
+CONFIG_PREEMPTIRQ_TRACEPOINTS=y
+CONFIG_PRINTK_CALLER=y
+CONFIG_PRINTK_TIME=y
+CONFIG_PROVE_LOCKING=y
+CONFIG_PROVE_RCU_LIST=y
+CONFIG_PROVE_RCU=y
+CONFIG_PTDUMP_CORE=y
+CONFIG_PTDUMP_DEBUGFS=y
+CONFIG_RCU_CPU_STALL_TIMEOUT=60
+CONFIG_RING_BUFFER=y
+CONFIG_SCHED_INFO=y
+CONFIG_SCHED_STACK_END_CHECK=y
+CONFIG_SECTION_MISMATCH_WARN_ONLY=y
+CONFIG_SLUB_DEBUG_ON=y
+CONFIG_SOFTLOCKUP_DETECTOR=y
+CONFIG_STACKTRACE=y
+CONFIG_STRICT_DEVMEM=y
+CONFIG_SYMBOLIC_ERRNAME=y
+CONFIG_TRACE_CLOCK=y
+CONFIG_TRACE_IRQFLAGS=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_TRACING=y
+CONFIG_UBSAN_BOOL=y
+CONFIG_UBSAN_BOUNDS=y
+CONFIG_UBSAN_ENUM=y
+CONFIG_UBSAN_ONLY_BOUNDS=y
+CONFIG_UBSAN_SHIFT=y
+CONFIG_UBSAN_UNREACHABLE=y
+CONFIG_UBSAN=y
-- 
2.30.2

