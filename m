Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C671EE5CF
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 15:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgFDNus (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 09:50:48 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44327 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728337AbgFDNur (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:50:47 -0400
Received: by mail-lj1-f195.google.com with SMTP id c17so7346666lji.11;
        Thu, 04 Jun 2020 06:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HscaqQ3a9rlG7LMvxfetj9PZadqBQlxA9luDvY709kI=;
        b=ai6pgs+Tew/uxPdpW0D6kM9fjKaFU57Yse/NujW+695tWtAZsHbMGGjsRLwvkvSFdM
         tKaKvGQpWjWbihXm9SM7bzwIuUyydb6gftVGfGn+rqrf8iT84i2RTj6MP76Pkb3s7Wtv
         u2i1GX3tx60c2Sye/K5XP1y5zvn163ycQ1SR1IDsoyjiGPkmpQ9nc5k8xIuY7cpNXkxe
         Ny3vMLTeLJHhVYOFYSlJMhAkaXrk7pKOBF/AP1p5BtvMyovAinP3X23oSRcwCyermoIZ
         OOdjYs1SLiwTCfRS0PA+Ha75IlelzNAKXJeEctRiFvw7bbdTtJSLgfapP+/Nti9yhtyg
         q8Nw==
X-Gm-Message-State: AOAM530Fkf4utpvodap55ttY2/yNOYsu0YKEeaGDv2lW83PULYVAn2oJ
        4Axxi4wbLXQjpHiWggk/vqM=
X-Google-Smtp-Source: ABdhPJwFgNnX9eJFc5s+1RCeoml4wry3jADSZr+Uk82Gr4M4947yFLD4wkmGdf/0gl0X9+wHhybHLA==
X-Received: by 2002:a2e:8ec9:: with SMTP id e9mr2378478ljl.152.1591278644807;
        Thu, 04 Jun 2020 06:50:44 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id u16sm1202140lji.58.2020.06.04.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 06:50:43 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Alexander Popov <alex.popov@linux.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc:     notify@kernel.org
Subject: [PATCH 1/5] gcc-plugins/stackleak: Exclude alloca() from the instrumentation logic
Date:   Thu,  4 Jun 2020 16:49:53 +0300
Message-Id: <20200604134957.505389-2-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200604134957.505389-1-alex.popov@linux.com>
References: <20200604134957.505389-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some time ago Variable Length Arrays (VLA) were removed from the kernel.
The kernel is built with '-Wvla'. Let's exclude alloca() from the
instrumentation logic and make it simpler. The build-time assertion
against alloca() is added instead.

Unfortunately, for that assertion we can't simply check cfun->calls_alloca
during RTL phase. It turned out that gcc before version 7 called
allocate_dynamic_stack_space() from expand_stack_vars() for runtime
alignment of constant-sized stack variables. That caused cfun->calls_alloca
to be set for functions that don't use alloca().

Signed-off-by: Alexander Popov <alex.popov@linux.com>
---
 scripts/gcc-plugins/stackleak_plugin.c | 51 +++++++++++---------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/scripts/gcc-plugins/stackleak_plugin.c b/scripts/gcc-plugins/stackleak_plugin.c
index cc75eeba0be1..1ecfe50d0bf5 100644
--- a/scripts/gcc-plugins/stackleak_plugin.c
+++ b/scripts/gcc-plugins/stackleak_plugin.c
@@ -9,10 +9,9 @@
  * any of the gcc libraries
  *
  * This gcc plugin is needed for tracking the lowest border of the kernel stack.
- * It instruments the kernel code inserting stackleak_track_stack() calls:
- *  - after alloca();
- *  - for the functions with a stack frame size greater than or equal
- *     to the "track-min-size" plugin parameter.
+ * It instruments the kernel code inserting stackleak_track_stack() calls
+ * for the functions with a stack frame size greater than or equal to
+ * the "track-min-size" plugin parameter.
  *
  * This plugin is ported from grsecurity/PaX. For more information see:
  *   https://grsecurity.net/
@@ -46,7 +45,7 @@ static struct plugin_info stackleak_plugin_info = {
 		"disable\t\tdo not activate the plugin\n"
 };
 
-static void stackleak_add_track_stack(gimple_stmt_iterator *gsi, bool after)
+static void stackleak_add_track_stack(gimple_stmt_iterator *gsi)
 {
 	gimple stmt;
 	gcall *stackleak_track_stack;
@@ -56,12 +55,7 @@ static void stackleak_add_track_stack(gimple_stmt_iterator *gsi, bool after)
 	/* Insert call to void stackleak_track_stack(void) */
 	stmt = gimple_build_call(track_function_decl, 0);
 	stackleak_track_stack = as_a_gcall(stmt);
-	if (after) {
-		gsi_insert_after(gsi, stackleak_track_stack,
-						GSI_CONTINUE_LINKING);
-	} else {
-		gsi_insert_before(gsi, stackleak_track_stack, GSI_SAME_STMT);
-	}
+	gsi_insert_before(gsi, stackleak_track_stack, GSI_SAME_STMT);
 
 	/* Update the cgraph */
 	bb = gimple_bb(stackleak_track_stack);
@@ -87,14 +81,13 @@ static bool is_alloca(gimple stmt)
 
 /*
  * Work with the GIMPLE representation of the code. Insert the
- * stackleak_track_stack() call after alloca() and into the beginning
- * of the function if it is not instrumented.
+ * stackleak_track_stack() call into the beginning of the function.
  */
 static unsigned int stackleak_instrument_execute(void)
 {
 	basic_block bb, entry_bb;
-	bool prologue_instrumented = false, is_leaf = true;
-	gimple_stmt_iterator gsi;
+	bool is_leaf = true;
+	gimple_stmt_iterator gsi = { 0 };
 
 	/*
 	 * ENTRY_BLOCK_PTR is a basic block which represents possible entry
@@ -111,27 +104,17 @@ static unsigned int stackleak_instrument_execute(void)
 	 */
 	FOR_EACH_BB_FN(bb, cfun) {
 		for (gsi = gsi_start_bb(bb); !gsi_end_p(gsi); gsi_next(&gsi)) {
-			gimple stmt;
-
-			stmt = gsi_stmt(gsi);
+			gimple stmt = gsi_stmt(gsi);
 
 			/* Leaf function is a function which makes no calls */
 			if (is_gimple_call(stmt))
 				is_leaf = false;
 
-			if (!is_alloca(stmt))
-				continue;
-
-			/* Insert stackleak_track_stack() call after alloca() */
-			stackleak_add_track_stack(&gsi, true);
-			if (bb == entry_bb)
-				prologue_instrumented = true;
+			/* Variable Length Arrays are forbidden in the kernel */
+			gcc_assert(!is_alloca(stmt));
 		}
 	}
 
-	if (prologue_instrumented)
-		return 0;
-
 	/*
 	 * Special cases to skip the instrumentation.
 	 *
@@ -168,7 +151,7 @@ static unsigned int stackleak_instrument_execute(void)
 		bb = single_succ(ENTRY_BLOCK_PTR_FOR_FN(cfun));
 	}
 	gsi = gsi_after_labels(bb);
-	stackleak_add_track_stack(&gsi, false);
+	stackleak_add_track_stack(&gsi);
 
 	return 0;
 }
@@ -185,12 +168,20 @@ static bool large_stack_frame(void)
 /*
  * Work with the RTL representation of the code.
  * Remove the unneeded stackleak_track_stack() calls from the functions
- * which don't call alloca() and don't have a large enough stack frame size.
+ * that don't have a large enough stack frame size.
  */
 static unsigned int stackleak_cleanup_execute(void)
 {
 	rtx_insn *insn, *next;
 
+	/*
+	 * gcc before version 7 called allocate_dynamic_stack_space() from
+	 * expand_stack_vars() for runtime alignment of constant-sized stack
+	 * variables. That caused cfun->calls_alloca to be set for functions
+	 * that don't use alloca().
+	 * For more info see gcc commit 7072df0aae0c59ae437e.
+	 * Let's leave such functions instrumented.
+	 */
 	if (cfun->calls_alloca)
 		return 0;
 
-- 
2.25.2

