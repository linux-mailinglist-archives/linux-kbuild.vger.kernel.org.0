Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC3244CA8C
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Nov 2021 21:25:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbhKJU2N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Nov 2021 15:28:13 -0500
Received: from foss.arm.com ([217.140.110.172]:50648 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232005AbhKJU2N (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Nov 2021 15:28:13 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225C713A1;
        Wed, 10 Nov 2021 12:25:25 -0800 (PST)
Received: from e113632-lin.cambridge.arm.com (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5F3D3F5A1;
        Wed, 10 Nov 2021 12:25:22 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2 1/5] preempt: Restore preemption model selection configs
Date:   Wed, 10 Nov 2021 20:24:44 +0000
Message-Id: <20211110202448.4054153-2-valentin.schneider@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211110202448.4054153-1-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit c597bfddc9e9 ("sched: Provide Kconfig support for default dynamic
preempt mode") changed the selectable config names for the preemption
model. This means a config file must now select

  CONFIG_PREEMPT_BEHAVIOUR=y

rather than

  CONFIG_PREEMPT=y

to get a preemptible kernel. This means all arch config files would need to
be updated - right now they'll all end up with the default
CONFIG_PREEMPT_NONE_BEHAVIOUR.

Rather than touch a good hundred of config files, restore usage of
CONFIG_PREEMPT{_NONE, _VOLUNTARY}. Make them configure:
o The build-time preemption model when !PREEMPT_DYNAMIC
o The default boot-time preemption model when PREEMPT_DYNAMIC

Add siblings of those configs with the _BUILD suffix to unconditionally
designate the build-time preemption model (PREEMPT_DYNAMIC is built with
the "highest" preemption model it supports, aka PREEMPT). Downstream
configs should by now all be depending / selected by CONFIG_PREEMPTION
rather than CONFIG_PREEMPT, so only a few sites need patching up.

Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
---
 include/linux/kernel.h   |  2 +-
 include/linux/vermagic.h |  2 +-
 init/Makefile            |  2 +-
 kernel/Kconfig.preempt   | 42 ++++++++++++++++++++--------------------
 kernel/sched/core.c      |  6 +++---
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 2776423a587e..9c7d774ef809 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -88,7 +88,7 @@
 struct completion;
 struct user;
 
-#ifdef CONFIG_PREEMPT_VOLUNTARY
+#ifdef CONFIG_PREEMPT_VOLUNTARY_BUILD
 
 extern int __cond_resched(void);
 # define might_resched() __cond_resched()
diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
index 1eaaa93c37bf..329d63babaeb 100644
--- a/include/linux/vermagic.h
+++ b/include/linux/vermagic.h
@@ -15,7 +15,7 @@
 #else
 #define MODULE_VERMAGIC_SMP ""
 #endif
-#ifdef CONFIG_PREEMPT
+#ifdef CONFIG_PREEMPT_BUILD
 #define MODULE_VERMAGIC_PREEMPT "preempt "
 #elif defined(CONFIG_PREEMPT_RT)
 #define MODULE_VERMAGIC_PREEMPT "preempt_rt "
diff --git a/init/Makefile b/init/Makefile
index 2846113677ee..04eeee12c076 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -30,7 +30,7 @@ $(obj)/version.o: include/generated/compile.h
 quiet_cmd_compile.h = CHK     $@
       cmd_compile.h = \
 	$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
-	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
+	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT_BUILD)"	\
 	"$(CONFIG_PREEMPT_RT)" $(CONFIG_CC_VERSION_TEXT) "$(LD)"
 
 include/generated/compile.h: FORCE
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 60f1bfc3c7b2..ce77f0265660 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -1,12 +1,23 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+config PREEMPT_NONE_BUILD
+	bool
+
+config PREEMPT_VOLUNTARY_BUILD
+	bool
+
+config PREEMPT_BUILD
+	bool
+	select PREEMPTION
+	select UNINLINE_SPIN_UNLOCK if !ARCH_INLINE_SPIN_UNLOCK
+
 choice
 	prompt "Preemption Model"
-	default PREEMPT_NONE_BEHAVIOUR
+	default PREEMPT_NONE
 
-config PREEMPT_NONE_BEHAVIOUR
+config PREEMPT_NONE
 	bool "No Forced Preemption (Server)"
-	select PREEMPT_NONE if !PREEMPT_DYNAMIC
+	select PREEMPT_NONE_BUILD if !PREEMPT_DYNAMIC
 	help
 	  This is the traditional Linux preemption model, geared towards
 	  throughput. It will still provide good latencies most of the
@@ -18,10 +29,10 @@ config PREEMPT_NONE_BEHAVIOUR
 	  raw processing power of the kernel, irrespective of scheduling
 	  latencies.
 
-config PREEMPT_VOLUNTARY_BEHAVIOUR
+config PREEMPT_VOLUNTARY
 	bool "Voluntary Kernel Preemption (Desktop)"
 	depends on !ARCH_NO_PREEMPT
-	select PREEMPT_VOLUNTARY if !PREEMPT_DYNAMIC
+	select PREEMPT_VOLUNTARY_BUILD if !PREEMPT_DYNAMIC
 	help
 	  This option reduces the latency of the kernel by adding more
 	  "explicit preemption points" to the kernel code. These new
@@ -37,10 +48,10 @@ config PREEMPT_VOLUNTARY_BEHAVIOUR
 
 	  Select this if you are building a kernel for a desktop system.
 
-config PREEMPT_BEHAVIOUR
+config PREEMPT
 	bool "Preemptible Kernel (Low-Latency Desktop)"
 	depends on !ARCH_NO_PREEMPT
-	select PREEMPT
+	select PREEMPT_BUILD
 	help
 	  This option reduces the latency of the kernel by making
 	  all kernel code (that is not executing in a critical section)
@@ -58,7 +69,7 @@ config PREEMPT_BEHAVIOUR
 
 config PREEMPT_RT
 	bool "Fully Preemptible Kernel (Real-Time)"
-	depends on EXPERT && ARCH_SUPPORTS_RT && !PREEMPT_DYNAMIC
+	depends on EXPERT && ARCH_SUPPORTS_RT
 	select PREEMPTION
 	help
 	  This option turns the kernel into a real-time kernel by replacing
@@ -75,17 +86,6 @@ config PREEMPT_RT
 
 endchoice
 
-config PREEMPT_NONE
-	bool
-
-config PREEMPT_VOLUNTARY
-	bool
-
-config PREEMPT
-	bool
-	select PREEMPTION
-	select UNINLINE_SPIN_UNLOCK if !ARCH_INLINE_SPIN_UNLOCK
-
 config PREEMPT_COUNT
        bool
 
@@ -95,8 +95,8 @@ config PREEMPTION
 
 config PREEMPT_DYNAMIC
 	bool "Preemption behaviour defined on boot"
-	depends on HAVE_PREEMPT_DYNAMIC
-	select PREEMPT
+	depends on HAVE_PREEMPT_DYNAMIC && !PREEMPT_RT
+	select PREEMPT_BUILD
 	default y
 	help
 	  This option allows to define the preemption model on the kernel
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f2611b9cf503..97047aa7b6c2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6625,13 +6625,13 @@ __setup("preempt=", setup_preempt_mode);
 static void __init preempt_dynamic_init(void)
 {
 	if (preempt_dynamic_mode == preempt_dynamic_undefined) {
-		if (IS_ENABLED(CONFIG_PREEMPT_NONE_BEHAVIOUR)) {
+		if (IS_ENABLED(CONFIG_PREEMPT_NONE)) {
 			sched_dynamic_update(preempt_dynamic_none);
-		} else if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY_BEHAVIOUR)) {
+		} else if (IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)) {
 			sched_dynamic_update(preempt_dynamic_voluntary);
 		} else {
 			/* Default static call setting, nothing to do */
-			WARN_ON_ONCE(!IS_ENABLED(CONFIG_PREEMPT_BEHAVIOUR));
+			WARN_ON_ONCE(!IS_ENABLED(CONFIG_PREEMPT));
 			preempt_dynamic_mode = preempt_dynamic_full;
 			pr_info("Dynamic Preempt: full\n");
 		}
-- 
2.25.1

