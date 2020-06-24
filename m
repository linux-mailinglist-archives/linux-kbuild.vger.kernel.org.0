Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B378207375
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 14:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403910AbgFXMeo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 08:34:44 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:36131 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403891AbgFXMek (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:34:40 -0400
Received: by mail-qt1-f195.google.com with SMTP id x62so1497219qtd.3;
        Wed, 24 Jun 2020 05:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y4czRrcF8zH3CO6lp92Gxox7EeM3jmLaCFfYGsiywQ8=;
        b=GBrSQ1s33amMw4QXx6/+mKPViD4qLrACT/Nv5lolYn+J44jcFloF83aIK/qSoWVnEo
         TjeEhPawhf5gSXm+UE8FOnT2klw2BmE4YbA9UkV5imKM7yOzZ1xi7Mk8bVVmofBkgKEh
         /TxY9kW/puLVs2n/ZK+QwC1Z3IQ0ML/Tj/jr/YXPWY9MG0QwIRxJTHy1yF8MIsE95LFX
         0d5nQg/Oex5veFgkgxRJg10xidocJwYHvMI4uFVZGl62a9gw1GCyhuIPy8H3c5dYs3ep
         yoezG53Zb0Q6lwKEaZBfhmXwsJj51r2Y8q1on8n1RDlFgl52f/QSeRQV7Cz3JN6IRWGF
         kOvQ==
X-Gm-Message-State: AOAM530ozmNvBwgeUdtq3pBwuQXkZFXoiZsCjjNEHqvoLZ3reX0FMINg
        Kxw82eeKil9nLNHBk5xRIk8=
X-Google-Smtp-Source: ABdhPJwMR5kemIERKfm0W+OpXFOK+gSG7ictSnsXTa1f5CZsDv6zNarK9fLqgQYKuzvvKfSHWnlFDQ==
X-Received: by 2002:ac8:263b:: with SMTP id u56mr26577878qtu.388.1593002077584;
        Wed, 24 Jun 2020 05:34:37 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id x26sm3354512qtr.4.2020.06.24.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 05:34:36 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
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
Subject: [PATCH v2 4/5] gcc-plugins/stackleak: Use asm instrumentation to avoid useless register saving
Date:   Wed, 24 Jun 2020 15:33:29 +0300
Message-Id: <20200624123330.83226-5-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200624123330.83226-1-alex.popov@linux.com>
References: <20200624123330.83226-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The kernel code instrumentation in stackleak gcc plugin works in two stages.
At first, stack tracking is added to GIMPLE representation of every function
(except some special cases). And later, when stack frame size info is
available, stack tracking is removed from the RTL representation of the
functions with small stack frame. There is an unwanted side-effect for these
functions: some of them do useless work with caller-saved registers.

As an example of such case, proc_sys_write without() instrumentation:
    55                      push   %rbp
    41 b8 01 00 00 00       mov    $0x1,%r8d
    48 89 e5                mov    %rsp,%rbp
    e8 11 ff ff ff          callq  ffffffff81284610 <proc_sys_call_handler>
    5d                      pop    %rbp
    c3                      retq
    0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
    66 2e 0f 1f 84 00 00    nopw   %cs:0x0(%rax,%rax,1)
    00 00 00

proc_sys_write() with instrumentation:
    55                      push   %rbp
    48 89 e5                mov    %rsp,%rbp
    41 56                   push   %r14
    41 55                   push   %r13
    41 54                   push   %r12
    53                      push   %rbx
    49 89 f4                mov    %rsi,%r12
    48 89 fb                mov    %rdi,%rbx
    49 89 d5                mov    %rdx,%r13
    49 89 ce                mov    %rcx,%r14
    4c 89 f1                mov    %r14,%rcx
    4c 89 ea                mov    %r13,%rdx
    4c 89 e6                mov    %r12,%rsi
    48 89 df                mov    %rbx,%rdi
    41 b8 01 00 00 00       mov    $0x1,%r8d
    e8 f2 fe ff ff          callq  ffffffff81298e80 <proc_sys_call_handler>
    5b                      pop    %rbx
    41 5c                   pop    %r12
    41 5d                   pop    %r13
    41 5e                   pop    %r14
    5d                      pop    %rbp
    c3                      retq
    66 0f 1f 84 00 00 00    nopw   0x0(%rax,%rax,1)
    00 00

Let's improve the instrumentation to avoid this:

1. Make stackleak_track_stack() save all register that it works with.
Use no_caller_saved_registers attribute for that function. This attribute
is available for x86_64 and i386 starting from gcc-7.

2. Insert calling stackleak_track_stack() in asm:
  asm volatile("call stackleak_track_stack" :: "r" (current_stack_pointer))
Here we use ASM_CALL_CONSTRAINT trick from arch/x86/include/asm/asm.h.
The input constraint is taken into account during gcc shrink-wrapping
optimization. It is needed to be sure that stackleak_track_stack() call is
inserted after the prologue of the containing function, when the stack
frame is prepared.

This work is a deep reengineering of the idea described on grsecurity blog
  https://grsecurity.net/resolving_an_unfortunate_stackleak_interaction

Signed-off-by: Alexander Popov <alex.popov@linux.com>
Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
---
 include/linux/compiler_attributes.h    |  13 ++
 kernel/stackleak.c                     |  16 +-
 scripts/Makefile.gcc-plugins           |   2 +
 scripts/gcc-plugins/stackleak_plugin.c | 205 +++++++++++++++++++++----
 4 files changed, 196 insertions(+), 40 deletions(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index cdf016596659..551ea8cb70b1 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -37,6 +37,7 @@
 # define __GCC4_has_attribute___copy__                0
 # define __GCC4_has_attribute___designated_init__     0
 # define __GCC4_has_attribute___externally_visible__  1
+# define __GCC4_has_attribute___no_caller_saved_registers__ 0
 # define __GCC4_has_attribute___noclone__             1
 # define __GCC4_has_attribute___nonstring__           0
 # define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
@@ -175,6 +176,18 @@
  */
 #define __mode(x)                       __attribute__((__mode__(x)))
 
+/*
+ * Optional: only supported since gcc >= 7
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/x86-Function-Attributes.html#index-no_005fcaller_005fsaved_005fregisters-function-attribute_002c-x86
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#no-caller-saved-registers
+ */
+#if __has_attribute(__no_caller_saved_registers__)
+# define __no_caller_saved_registers	__attribute__((__no_caller_saved_registers__))
+#else
+# define __no_caller_saved_registers
+#endif
+
 /*
  * Optional: not supported by clang
  *
diff --git a/kernel/stackleak.c b/kernel/stackleak.c
index b193a59fc05b..a8fc9ae1d03d 100644
--- a/kernel/stackleak.c
+++ b/kernel/stackleak.c
@@ -104,19 +104,9 @@ asmlinkage void notrace stackleak_erase(void)
 }
 NOKPROBE_SYMBOL(stackleak_erase);
 
-void __used notrace stackleak_track_stack(void)
+void __used __no_caller_saved_registers notrace stackleak_track_stack(void)
 {
-	/*
-	 * N.B. stackleak_erase() fills the kernel stack with the poison value,
-	 * which has the register width. That code assumes that the value
-	 * of 'lowest_stack' is aligned on the register width boundary.
-	 *
-	 * That is true for x86 and x86_64 because of the kernel stack
-	 * alignment on these platforms (for details, see 'cc_stack_align' in
-	 * arch/x86/Makefile). Take care of that when you port STACKLEAK to
-	 * new platforms.
-	 */
-	unsigned long sp = (unsigned long)&sp;
+	unsigned long sp = current_stack_pointer;
 
 	/*
 	 * Having CONFIG_STACKLEAK_TRACK_MIN_SIZE larger than
@@ -125,6 +115,8 @@ void __used notrace stackleak_track_stack(void)
 	 */
 	BUILD_BUG_ON(CONFIG_STACKLEAK_TRACK_MIN_SIZE > STACKLEAK_SEARCH_DEPTH);
 
+	/* 'lowest_stack' should be aligned on the register width boundary */
+	sp = ALIGN(sp, sizeof(unsigned long));
 	if (sp < current->lowest_stack &&
 	    sp >= (unsigned long)task_stack_page(current) +
 						sizeof(unsigned long)) {
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 5f7df50cfe7a..952e46876329 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -33,6 +33,8 @@ gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
 		+= -DSTACKLEAK_PLUGIN
 gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
 		+= -fplugin-arg-stackleak_plugin-track-min-size=$(CONFIG_STACKLEAK_TRACK_MIN_SIZE)
+gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK)		\
+		+= -fplugin-arg-stackleak_plugin-arch=$(SRCARCH)
 ifdef CONFIG_GCC_PLUGIN_STACKLEAK
     DISABLE_STACKLEAK_PLUGIN += -fplugin-arg-stackleak_plugin-disable
 endif
diff --git a/scripts/gcc-plugins/stackleak_plugin.c b/scripts/gcc-plugins/stackleak_plugin.c
index cc75eeba0be1..a18b0d4af456 100644
--- a/scripts/gcc-plugins/stackleak_plugin.c
+++ b/scripts/gcc-plugins/stackleak_plugin.c
@@ -20,7 +20,7 @@
  *
  * Debugging:
  *  - use fprintf() to stderr, debug_generic_expr(), debug_gimple_stmt(),
- *     print_rtl() and print_simple_rtl();
+ *     print_rtl_single() and debug_rtx();
  *  - add "-fdump-tree-all -fdump-rtl-all" to the plugin CFLAGS in
  *     Makefile.gcc-plugins to see the verbose dumps of the gcc passes;
  *  - use gcc -E to understand the preprocessing shenanigans;
@@ -32,6 +32,7 @@
 __visible int plugin_is_GPL_compatible;
 
 static int track_frame_size = -1;
+static bool build_for_x86 = false;
 static const char track_function[] = "stackleak_track_stack";
 
 /*
@@ -43,32 +44,31 @@ static GTY(()) tree track_function_decl;
 static struct plugin_info stackleak_plugin_info = {
 	.version = "201707101337",
 	.help = "track-min-size=nn\ttrack stack for functions with a stack frame size >= nn bytes\n"
+		"arch=target_arch\tspecify target build arch\n"
 		"disable\t\tdo not activate the plugin\n"
 };
 
-static void stackleak_add_track_stack(gimple_stmt_iterator *gsi, bool after)
+static void add_stack_tracking_gcall(gimple_stmt_iterator *gsi, bool after)
 {
 	gimple stmt;
-	gcall *stackleak_track_stack;
+	gcall *gimple_call;
 	cgraph_node_ptr node;
 	basic_block bb;
 
-	/* Insert call to void stackleak_track_stack(void) */
+	/* Insert calling stackleak_track_stack() */
 	stmt = gimple_build_call(track_function_decl, 0);
-	stackleak_track_stack = as_a_gcall(stmt);
-	if (after) {
-		gsi_insert_after(gsi, stackleak_track_stack,
-						GSI_CONTINUE_LINKING);
-	} else {
-		gsi_insert_before(gsi, stackleak_track_stack, GSI_SAME_STMT);
-	}
+	gimple_call = as_a_gcall(stmt);
+	if (after)
+		gsi_insert_after(gsi, gimple_call, GSI_CONTINUE_LINKING);
+	else
+		gsi_insert_before(gsi, gimple_call, GSI_SAME_STMT);
 
 	/* Update the cgraph */
-	bb = gimple_bb(stackleak_track_stack);
+	bb = gimple_bb(gimple_call);
 	node = cgraph_get_create_node(track_function_decl);
 	gcc_assert(node);
 	cgraph_create_edge(cgraph_get_node(current_function_decl), node,
-			stackleak_track_stack, bb->count,
+			gimple_call, bb->count,
 			compute_call_stmt_bb_frequency(current_function_decl, bb));
 }
 
@@ -85,6 +85,79 @@ static bool is_alloca(gimple stmt)
 	return false;
 }
 
+static tree get_current_stack_pointer_decl(void)
+{
+	varpool_node_ptr node;
+
+	FOR_EACH_VARIABLE(node) {
+		tree var = NODE_DECL(node);
+		tree name = DECL_NAME(var);
+
+		if (DECL_NAME_LENGTH(var) != sizeof("current_stack_pointer") - 1)
+			continue;
+
+		if (strcmp(IDENTIFIER_POINTER(name), "current_stack_pointer"))
+			continue;
+
+		return var;
+	}
+
+	return NULL_TREE;
+}
+
+static void add_stack_tracking_gasm(gimple_stmt_iterator *gsi, bool after)
+{
+	gasm *asm_call = NULL;
+	tree sp_decl, input;
+	vec<tree, va_gc> *inputs = NULL;
+
+	/* 'no_caller_saved_registers' is currently supported only for x86 */
+	gcc_assert(build_for_x86);
+
+	/*
+	 * Insert calling stackleak_track_stack() in asm:
+	 *   asm volatile("call stackleak_track_stack"
+	 *		  :: "r" (current_stack_pointer))
+	 * Use ASM_CALL_CONSTRAINT trick from arch/x86/include/asm/asm.h.
+	 * This constraint is taken into account during gcc shrink-wrapping
+	 * optimization. It is needed to be sure that stackleak_track_stack()
+	 * call is inserted after the prologue of the containing function,
+	 * when the stack frame is prepared.
+	 */
+	sp_decl = get_current_stack_pointer_decl();
+	if (sp_decl == NULL_TREE) {
+		add_stack_tracking_gcall(gsi, after);
+		return;
+	}
+	input = build_tree_list(NULL_TREE, build_const_char_string(2, "r"));
+	input = chainon(NULL_TREE, build_tree_list(input, sp_decl));
+	vec_safe_push(inputs, input);
+	asm_call = gimple_build_asm_vec("call stackleak_track_stack",
+					inputs, NULL, NULL, NULL);
+	gimple_asm_set_volatile(asm_call, true);
+	if (after)
+		gsi_insert_after(gsi, asm_call, GSI_CONTINUE_LINKING);
+	else
+		gsi_insert_before(gsi, asm_call, GSI_SAME_STMT);
+	update_stmt(asm_call);
+}
+
+static void add_stack_tracking(gimple_stmt_iterator *gsi, bool after)
+{
+	/*
+	 * The 'no_caller_saved_registers' attribute is used for
+	 * stackleak_track_stack(). If the compiler supports this attribute for
+	 * the target arch, we can add calling stackleak_track_stack() in asm.
+	 * That improves performance: we avoid useless operations with the
+	 * caller-saved registers in the functions from which we will remove
+	 * stackleak_track_stack() call during the stackleak_cleanup pass.
+	 */
+	if (lookup_attribute_spec(get_identifier("no_caller_saved_registers")))
+		add_stack_tracking_gasm(gsi, after);
+	else
+		add_stack_tracking_gcall(gsi, after);
+}
+
 /*
  * Work with the GIMPLE representation of the code. Insert the
  * stackleak_track_stack() call after alloca() and into the beginning
@@ -94,7 +167,7 @@ static unsigned int stackleak_instrument_execute(void)
 {
 	basic_block bb, entry_bb;
 	bool prologue_instrumented = false, is_leaf = true;
-	gimple_stmt_iterator gsi;
+	gimple_stmt_iterator gsi = { 0 };
 
 	/*
 	 * ENTRY_BLOCK_PTR is a basic block which represents possible entry
@@ -123,7 +196,7 @@ static unsigned int stackleak_instrument_execute(void)
 				continue;
 
 			/* Insert stackleak_track_stack() call after alloca() */
-			stackleak_add_track_stack(&gsi, true);
+			add_stack_tracking(&gsi, true);
 			if (bb == entry_bb)
 				prologue_instrumented = true;
 		}
@@ -168,7 +241,7 @@ static unsigned int stackleak_instrument_execute(void)
 		bb = single_succ(ENTRY_BLOCK_PTR_FOR_FN(cfun));
 	}
 	gsi = gsi_after_labels(bb);
-	stackleak_add_track_stack(&gsi, false);
+	add_stack_tracking(&gsi, false);
 
 	return 0;
 }
@@ -182,21 +255,10 @@ static bool large_stack_frame(void)
 #endif
 }
 
-/*
- * Work with the RTL representation of the code.
- * Remove the unneeded stackleak_track_stack() calls from the functions
- * which don't call alloca() and don't have a large enough stack frame size.
- */
-static unsigned int stackleak_cleanup_execute(void)
+static void remove_stack_tracking_gcall(void)
 {
 	rtx_insn *insn, *next;
 
-	if (cfun->calls_alloca)
-		return 0;
-
-	if (large_stack_frame())
-		return 0;
-
 	/*
 	 * Find stackleak_track_stack() calls. Loop through the chain of insns,
 	 * which is an RTL representation of the code for a function.
@@ -257,6 +319,84 @@ static unsigned int stackleak_cleanup_execute(void)
 		}
 #endif
 	}
+}
+
+static bool remove_stack_tracking_gasm(void)
+{
+	bool removed = false;
+	rtx_insn *insn, *next;
+
+	/* 'no_caller_saved_registers' is currently supported only for x86 */
+	gcc_assert(build_for_x86);
+
+	/*
+	 * Find stackleak_track_stack() asm calls. Loop through the chain of
+	 * insns, which is an RTL representation of the code for a function.
+	 *
+	 * The example of a matching insn:
+	 *  (insn 11 5 12 2 (parallel [ (asm_operands/v
+	 *  ("call stackleak_track_stack") ("") 0
+	 *  [ (reg/v:DI 7 sp [ current_stack_pointer ]) ]
+	 *  [ (asm_input:DI ("r")) ] [])
+	 *  (clobber (reg:CC 17 flags)) ]) -1 (nil))
+	 */
+	for (insn = get_insns(); insn; insn = next) {
+		rtx body;
+
+		next = NEXT_INSN(insn);
+
+		/* Check the expression code of the insn */
+		if (!NONJUMP_INSN_P(insn))
+			continue;
+
+		/*
+		 * Check the expression code of the insn body, which is an RTL
+		 * Expression (RTX) describing the side effect performed by
+		 * that insn.
+		 */
+		body = PATTERN(insn);
+
+		if (GET_CODE(body) != PARALLEL)
+			continue;
+
+		body = XVECEXP(body, 0, 0);
+
+		if (GET_CODE(body) != ASM_OPERANDS)
+			continue;
+
+		if (strcmp(ASM_OPERANDS_TEMPLATE(body),
+						"call stackleak_track_stack")) {
+			continue;
+		}
+
+		delete_insn_and_edges(insn);
+		gcc_assert(!removed);
+		removed = true;
+	}
+
+	return removed;
+}
+
+/*
+ * Work with the RTL representation of the code.
+ * Remove the unneeded stackleak_track_stack() calls from the functions
+ * which don't call alloca() and don't have a large enough stack frame size.
+ */
+static unsigned int stackleak_cleanup_execute(void)
+{
+	bool removed = false;
+
+	if (cfun->calls_alloca)
+		return 0;
+
+	if (large_stack_frame())
+		return 0;
+
+	if (lookup_attribute_spec(get_identifier("no_caller_saved_registers")))
+		removed = remove_stack_tracking_gasm();
+
+	if (!removed)
+		remove_stack_tracking_gcall();
 
 	return 0;
 }
@@ -392,6 +532,15 @@ __visible int plugin_init(struct plugin_name_args *plugin_info,
 					plugin_name, argv[i].key, argv[i].value);
 				return 1;
 			}
+		} else if (!strcmp(argv[i].key, "arch")) {
+			if (!argv[i].value) {
+				error(G_("no value supplied for option '-fplugin-arg-%s-%s'"),
+					plugin_name, argv[i].key);
+				return 1;
+			}
+
+			if (!strcmp(argv[i].value, "x86"))
+				build_for_x86 = true;
 		} else {
 			error(G_("unknown option '-fplugin-arg-%s-%s'"),
 					plugin_name, argv[i].key);
-- 
2.25.4

