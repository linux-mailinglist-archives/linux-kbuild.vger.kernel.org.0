Return-Path: <linux-kbuild+bounces-8098-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD4B0E04D
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 17:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FAB07B1F98
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 15:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD52264623;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyiTzfT7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4625B30E;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753197685; cv=none; b=j80rML4WyqWmj6EU4RT/7Mgo8xX8k+1o5W+dAZ2tovBr2OFuwvrEUXprUWwgT0BcY5fScnCl+WKCNhFpypWMiXdmSc8t9YGRSjChiKnf2GivK+OacDolQIGD/LT941Xl7RjCKjVp5mwSNaUJMD6f0rVP5iNXmnKpEFh3lZazq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753197685; c=relaxed/simple;
	bh=WuIWbTlGkfFONXaPtLn7obdDdrTWBX+oweEF8BZa9hI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=X5Fe3Qp5rsIBAzA6YgMrW3T2Q3BLMaclw4MQV/HQxrFfaW/XO7ZuUFeKeiv2AmF4lBjJYDIYkOuuBovq3ZfRQci5U/aDkpdjUpZ1MasMGkP0VzZ5hSfPNLRNRGOJBJh+siUE38eIPkhpb4YZBeBJehnYUbI4xck8TLDXF5nWA60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyiTzfT7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF98C4AF0C;
	Tue, 22 Jul 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753197685;
	bh=WuIWbTlGkfFONXaPtLn7obdDdrTWBX+oweEF8BZa9hI=;
	h=Date:From:To:Cc:Subject:References:From;
	b=NyiTzfT7u7XGS5U8kRPLmbC8kY5lewdpdrYAHGsQ/P7w3u/Yk/4sRk9iLMqALP6fW
	 ZzzoqXloHMqEwO16hGmNZThEGRgVM415kKqjJcW9BTGU9y+DWyVVdiMXmkdccU8xI6
	 plTJHfKynBkvlbH3pd/+TEPpJrvCOCY5FOXJs+gaLlCyTndoMY0rSNnIncE/HViRlu
	 iRFxyBlSAcmlXopNxD1bbO5OBrILXDIaYZPWHIWHWvhQLnlC4EH/K+41sJSUwcHjQL
	 6VNAKRKhGanupTDbrETsQs2IoeRxorTcG+bYZoKavgmk0AhLyqX0bBmOEhKx5T9dRg
	 g4qBFJSYLpQ2Q==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1ueEoX-0000000AYyO-3Pim;
	Tue, 22 Jul 2025 11:21:57 -0400
Message-ID: <20250722152157.664260747@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 22 Jul 2025 11:20:54 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3 1/5] tracepoints: Add verifier that makes sure all defined tracepoints are
 used
References: <20250722152053.343028095@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

If a tracepoint is defined via DECLARE_TRACE() or TRACE_EVENT() but never
called (via the trace_<tracepoint>() function), its metadata is still
around in memory and not discarded.

When created via TRACE_EVENT() the situation is worse because the
TRACE_EVENT() creates metadata that can be around 5k per trace event.
Having unused trace events causes several thousand of wasted bytes.

Add a verifier that injects a pointer to the tracepoint structure in the
functions that are used and added to a section called __tracepoint_check.
Then on boot up, iterate over this section and for every tracepoint
descriptor that is pointed to, update its ".funcs" field to (void *)1, as
the .funcs field is only set when a tracepoint is registered. At this
time, no tracepoints should be registered.

Then iterate all tracepoints and if any tracepoints doesn't have its
.funcs field set to (void*)1, trigger a warning, and list all tracepoints
that are not found.

Enabling this currently with a given config produces:

 Tracepoint x86_fpu_before_restore unused
 Tracepoint x86_fpu_after_restore unused
 Tracepoint x86_fpu_init_state unused
 Tracepoint pelt_hw_tp unused
 Tracepoint pelt_irq_tp unused
 Tracepoint ipi_raise unused
 Tracepoint ipi_entry unused
 Tracepoint ipi_exit unused
 Tracepoint irq_matrix_alloc_reserved unused
 Tracepoint psci_domain_idle_enter unused
 Tracepoint psci_domain_idle_exit unused
 Tracepoint powernv_throttle unused
 Tracepoint clock_enable unused
 Tracepoint clock_disable unused
 Tracepoint clock_set_rate unused
 Tracepoint power_domain_target unused
 Tracepoint xdp_bulk_tx unused
 Tracepoint xdp_redirect_map unused
 Tracepoint xdp_redirect_map_err unused
 Tracepoint mem_return_failed unused
 Tracepoint vma_mas_szero unused
 Tracepoint vma_store unused
 Tracepoint hugepage_set_pmd unused
 Tracepoint hugepage_set_pud unused
 Tracepoint hugepage_update_pmd unused
 Tracepoint hugepage_update_pud unused
 Tracepoint dax_pmd_insert_mapping unused
 Tracepoint dax_insert_mapping unused
 Tracepoint block_rq_remap unused
 Tracepoint xhci_dbc_handle_event unused
 Tracepoint xhci_dbc_handle_transfer unused
 Tracepoint xhci_dbc_gadget_ep_queue unused
 Tracepoint xhci_dbc_alloc_request unused
 Tracepoint xhci_dbc_free_request unused
 Tracepoint xhci_dbc_queue_request unused
 Tracepoint xhci_dbc_giveback_request unused
 Tracepoint tcp_ao_wrong_maclen unused
 Tracepoint tcp_ao_mismatch unused
 Tracepoint tcp_ao_key_not_found unused
 Tracepoint tcp_ao_rnext_request unused
 Tracepoint tcp_ao_synack_no_key unused
 Tracepoint tcp_ao_snd_sne_update unused
 Tracepoint tcp_ao_rcv_sne_update unused

Some of the above is totally unused but others are not used due to their
"trace_" functions being inside configs, in which case, the defined
tracepoints should also be inside those same configs. Others are
architecture specific but defined in generic code, where they should
either be moved to the architecture or be surrounded by #ifdef for the
architectures they are for.

Note, currently this only handles tracepoints that are builtin. This can
easily be extended to verify tracepoints used by modules, but it requires a
slightly different approach as it needs updates to the module code.

Link: https://lore.kernel.org/all/20250528114549.4d8a5e03@gandalf.local.home/

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/asm-generic/vmlinux.lds.h |  1 +
 include/linux/tracepoint.h        | 10 ++++++++++
 kernel/trace/Kconfig              | 19 +++++++++++++++++++
 kernel/tracepoint.c               | 26 ++++++++++++++++++++++++++
 4 files changed, 56 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index fa5f19b8d53a..600d8b51e315 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -708,6 +708,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	MCOUNT_REC()							\
 	*(.init.rodata .init.rodata.*)					\
 	FTRACE_EVENTS()							\
+	BOUNDED_SECTION_BY(__tracepoint_check, ___tracepoint_check)	\
 	TRACE_SYSCALLS()						\
 	KPROBE_BLACKLIST()						\
 	ERROR_INJECT_WHITELIST()					\
diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 826ce3f8e1f8..2b96c7e94c52 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -221,6 +221,14 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 		__do_trace_##name(args);				\
 	}
 
+#ifdef CONFIG_TRACEPOINT_VERIFY_USED
+# define TRACEPOINT_CHECK(name)						\
+	static void __used __section("__tracepoint_check") *__trace_check = \
+		&__tracepoint_##name;
+#else
+# define TRACEPOINT_CHECK(name)
+#endif
+
 /*
  * Make sure the alignment of the structure in the __tracepoints section will
  * not add unwanted padding between the beginning of the section and the
@@ -270,6 +278,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
 	static inline void __do_trace_##name(proto)			\
 	{								\
+		TRACEPOINT_CHECK(name)					\
 		if (cond) {						\
 			guard(preempt_notrace)();			\
 			__DO_TRACE_CALL(name, TP_ARGS(args));		\
@@ -289,6 +298,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 	__DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
 	static inline void __do_trace_##name(proto)			\
 	{								\
+		TRACEPOINT_CHECK(name)					\
 		guard(rcu_tasks_trace)();				\
 		__DO_TRACE_CALL(name, TP_ARGS(args));			\
 	}								\
diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index a3f35c7d83b6..e676b802b721 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1044,6 +1044,25 @@ config GCOV_PROFILE_FTRACE
 	  Note that on a kernel compiled with this config, ftrace will
 	  run significantly slower.
 
+config TRACEPOINT_VERIFY_USED
+	bool
+	help
+          This option creates a section when tracepoints are used
+	  that hold a pointer to the tracepoint that is used.
+	  This can be used to test if a defined tracepoint is
+	  used or not.
+
+config TRACEPOINT_WARN_ON_UNUSED
+	bool "Warn if any tracepoint is defined but not used"
+	depends on TRACEPOINTS
+	select TRACEPOINT_VERIFY_USED
+	help
+	  This option checks if every builtin defined tracepoint is
+	  used in the code. If a tracepoint is defined but not used,
+	  it will waste memory as its metadata is still created.
+	  A warning will be triggered if a tracepoint is found and
+	  not used at bootup.
+
 config FTRACE_SELFTEST
 	bool
 
diff --git a/kernel/tracepoint.c b/kernel/tracepoint.c
index 62719d2941c9..7701a6fed310 100644
--- a/kernel/tracepoint.c
+++ b/kernel/tracepoint.c
@@ -677,10 +677,36 @@ static struct notifier_block tracepoint_module_nb = {
 	.priority = 0,
 };
 
+#ifdef CONFIG_TRACEPOINT_WARN_ON_UNUSED
+extern void * __start___tracepoint_check[];
+extern void * __stop___tracepoint_check[];
+
+#define VERIFIED_TRACEPOINT	((void *)1)
+
+static void check_tracepoint(struct tracepoint *tp, void *priv)
+{
+	if (WARN_ONCE(tp->funcs != VERIFIED_TRACEPOINT, "Unused tracepoints found"))
+		pr_warn("Tracepoint %s unused\n", tp->name);
+
+	tp->funcs = NULL;
+}
+#endif
+
 static __init int init_tracepoints(void)
 {
 	int ret;
 
+#ifdef CONFIG_TRACEPOINT_WARN_ON_UNUSED
+	for (void **ptr = __start___tracepoint_check;
+	     ptr < __stop___tracepoint_check; ptr++) {
+		struct tracepoint *tp = *ptr;
+
+		tp->funcs = VERIFIED_TRACEPOINT;
+	}
+
+	for_each_kernel_tracepoint(check_tracepoint, NULL);
+#endif
+
 	ret = register_module_notifier(&tracepoint_module_nb);
 	if (ret)
 		pr_warn("Failed to register tracepoint module enter notifier\n");
-- 
2.47.2



