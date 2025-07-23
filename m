Return-Path: <linux-kbuild+bounces-8109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA14B0FB0B
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 21:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AFA1C84BBC
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Jul 2025 19:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2487722FAF4;
	Wed, 23 Jul 2025 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJFcps/k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47251F3B9E;
	Wed, 23 Jul 2025 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753299731; cv=none; b=QR4VMrC++H3OExhqgHE8r/a0Kglk5i6FCSTel5WMT0/olsPpelz9tkOKfkQYr4jy88xDBAfuoLUGWK51pcZHm16HmDwLKzYw0zefYJRh4duQSMG5gb+1NC3sNsYpJH2CG3JX3/CIdLQGpnW4xdUPjgJkWg2UjxwV8hVV3p2A8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753299731; c=relaxed/simple;
	bh=E0Eab80CSspUom29cz1hW0Xjip+olKwYQlEy7+VGQEY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=V4jyJpKMqo+LDwLnl0+pqW2DT3FU2phnJGdnJpjjI91xXXqvTyv/XWptOvXr3NSZrz6gvq1dmW4zG1OFAXJaoVJowiZo8M4UHLzHOgo7LedEk1LSC1y9gs5cn0A5Mkq7EClSSykkOU+lS2ukQ4gsLPIw1mFlg9rXTBsyBY1OUaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJFcps/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529B9C4CEF4;
	Wed, 23 Jul 2025 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753299730;
	bh=E0Eab80CSspUom29cz1hW0Xjip+olKwYQlEy7+VGQEY=;
	h=Date:From:To:Cc:Subject:References:From;
	b=PJFcps/kE5PQJsEarYvghsZFGtu0h8oEw02MeAxXfES7J+CC76RxlUg/0Rvi/4O42
	 uW3Q3vfGe6ivGNYTu8m728XnZ85KpWiHi56fDta1TGDMeE1lgjY2LuglxvtN5THeJi
	 4nuK9U7t2vh6mG1G6QhJXaZXk9CLY5rVq54RWLLn3eUMg30OgDrDbAqnNXyFG4SimL
	 2UN3h3iwOt6mffPWNJknKow3+LHScpVXwhz1oVjUKzhVUp+CyDoGK4rbAa+oR9nIWr
	 EVl9YXpHWqccW0ftKhakd2UhYRD8477RAhQTLyykDI/I+2RlCu45VwZU22fc4GqKwY
	 gDm/fRGars4Nw==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uefLv-00000000QYY-3pwl;
	Wed, 23 Jul 2025 15:42:11 -0400
Message-ID: <20250723194211.768813368@kernel.org>
User-Agent: quilt/0.68
Date: Wed, 23 Jul 2025 15:41:42 -0400
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
Subject: [PATCH v4 1/4] tracing: sorttable: Add a tracepoint verification check at build time
References: <20250723194141.617125835@kernel.org>
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
For every builtin tracepoint within the tracepoint_ptr section that is
used, will have a corresponding pointer back to it in the __tracepoint_check
section.

Update the sorttable code to check the tracepoint_check and tracepoint_ptr
sections to see what trace events have been created but not used.

List the tracepoints that are not used at build time. Note, this currently
only handles tracepoints that are builtin and not in modules.

Enabling this currently with a given config produces:

warning: tracepoint 'sched_move_numa' is unused.
warning: tracepoint 'sched_stick_numa' is unused.
warning: tracepoint 'sched_swap_numa' is unused.
warning: tracepoint 'pelt_hw_tp' is unused.
warning: tracepoint 'pelt_irq_tp' is unused.
warning: tracepoint 'rcu_preempt_task' is unused.
warning: tracepoint 'rcu_unlock_preempted_task' is unused.
warning: tracepoint 'xdp_bulk_tx' is unused.
warning: tracepoint 'xdp_redirect_map' is unused.
warning: tracepoint 'xdp_redirect_map_err' is unused.
warning: tracepoint 'vma_mas_szero' is unused.
warning: tracepoint 'vma_store' is unused.
warning: tracepoint 'hugepage_set_pmd' is unused.
warning: tracepoint 'hugepage_set_pud' is unused.
warning: tracepoint 'hugepage_update_pmd' is unused.
warning: tracepoint 'hugepage_update_pud' is unused.
warning: tracepoint 'block_rq_remap' is unused.
warning: tracepoint 'xhci_dbc_handle_event' is unused.
warning: tracepoint 'xhci_dbc_handle_transfer' is unused.
warning: tracepoint 'xhci_dbc_gadget_ep_queue' is unused.
warning: tracepoint 'xhci_dbc_alloc_request' is unused.
warning: tracepoint 'xhci_dbc_free_request' is unused.
warning: tracepoint 'xhci_dbc_queue_request' is unused.
warning: tracepoint 'xhci_dbc_giveback_request' is unused.
warning: tracepoint 'tcp_ao_wrong_maclen' is unused.
warning: tracepoint 'tcp_ao_mismatch' is unused.
warning: tracepoint 'tcp_ao_key_not_found' is unused.
warning: tracepoint 'tcp_ao_rnext_request' is unused.
warning: tracepoint 'tcp_ao_synack_no_key' is unused.
warning: tracepoint 'tcp_ao_snd_sne_update' is unused.
warning: tracepoint 'tcp_ao_rcv_sne_update' is unused.

Some of the above is totally unused but others are not used due to their
"trace_" functions being inside configs, in which case, the defined
tracepoints should also be inside those same configs. Others are
architecture specific but defined in generic code, where they should
either be moved to the architecture or be surrounded by #ifdef for the
architectures they are for.

Link: https://lore.kernel.org/all/20250528114549.4d8a5e03@gandalf.local.home/

Changes since v3: https://lore.kernel.org/20250722152157.664260747@kernel.org

- Folded this patch with patch 2: https://lore.kernel.org/20250722152157.839415861@kernel.org

- Removed the runtime boot check and only have the build time check (Linus Torvalds).

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/tracepoint.h        |  10 ++
 kernel/trace/Kconfig              |  19 +++
 scripts/Makefile                  |   4 +
 scripts/sorttable.c               | 268 +++++++++++++++++++++++++++---
 5 files changed, 279 insertions(+), 23 deletions(-)

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
index 35448f7233fe..90ffb83a43dc 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1050,6 +1050,25 @@ config GCOV_PROFILE_FTRACE
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
+config TRACEPOINT_WARN_ON_UNUSED_BUILD
+	bool "Warn on build if a tracepoint is defined but not used"
+	depends on TRACEPOINTS
+	select TRACEPOINT_VERIFY_USED
+	help
+	  This option checks if every builtin defined tracepoint is
+	  used in the code. If a tracepoint is defined but not used,
+	  it will waste memory as its metadata is still created.
+	  This will cause a warning at build time if the architecture
+	  supports it.
+
 config FTRACE_SELFTEST
 	bool
 
diff --git a/scripts/Makefile b/scripts/Makefile
index 46f860529df5..f81947ec9486 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -42,6 +42,10 @@ HOSTCFLAGS_sorttable.o += -I$(srctree)/tools/arch/$(SRCARCH)/include
 HOSTCFLAGS_sorttable.o += -DUNWINDER_ORC_ENABLED
 endif
 
+ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
+HOSTCFLAGS_sorttable.o += -DPREL32_RELOCATIONS
+endif
+
 ifdef CONFIG_BUILDTIME_MCOUNT_SORT
 HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
 endif
diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index deed676bfe38..ddcbec22ca96 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -92,6 +92,12 @@ static void (*w)(uint32_t, uint32_t *);
 static void (*w8)(uint64_t, uint64_t *);
 typedef void (*table_sort_t)(char *, int);
 
+static Elf_Shdr *init_data_sec;
+static Elf_Shdr *ro_data_sec;
+static Elf_Shdr *data_data_sec;
+
+static void *file_map_end;
+
 static struct elf_funcs {
 	int (*compare_extable)(const void *a, const void *b);
 	uint64_t (*ehdr_shoff)(Elf_Ehdr *ehdr);
@@ -550,8 +556,6 @@ static void *sort_orctable(void *arg)
 }
 #endif
 
-#ifdef MCOUNT_SORT_ENABLED
-
 static int compare_values_64(const void *a, const void *b)
 {
 	uint64_t av = *(uint64_t *)a;
@@ -574,6 +578,22 @@ static int compare_values_32(const void *a, const void *b)
 
 static int (*compare_values)(const void *a, const void *b);
 
+static int fill_addrs(void *ptr, uint64_t size, void *addrs)
+{
+	void *end = ptr + size;
+	int count = 0;
+
+	for (; ptr < end; ptr += long_size, addrs += long_size, count++) {
+		if (long_size == 4)
+			*(uint32_t *)ptr = r(addrs);
+		else
+			*(uint64_t *)ptr = r8(addrs);
+	}
+	return count;
+}
+
+#ifdef MCOUNT_SORT_ENABLED
+
 /* Only used for sorting mcount table */
 static void rela_write_addend(Elf_Rela *rela, uint64_t val)
 {
@@ -684,7 +704,6 @@ static char m_err[ERRSTR_MAXSZ];
 
 struct elf_mcount_loc {
 	Elf_Ehdr *ehdr;
-	Elf_Shdr *init_data_sec;
 	uint64_t start_mcount_loc;
 	uint64_t stop_mcount_loc;
 };
@@ -785,20 +804,6 @@ static void replace_relocs(void *ptr, uint64_t size, Elf_Ehdr *ehdr, uint64_t st
 	}
 }
 
-static int fill_addrs(void *ptr, uint64_t size, void *addrs)
-{
-	void *end = ptr + size;
-	int count = 0;
-
-	for (; ptr < end; ptr += long_size, addrs += long_size, count++) {
-		if (long_size == 4)
-			*(uint32_t *)ptr = r(addrs);
-		else
-			*(uint64_t *)ptr = r8(addrs);
-	}
-	return count;
-}
-
 static void replace_addrs(void *ptr, uint64_t size, void *addrs)
 {
 	void *end = ptr + size;
@@ -815,8 +820,8 @@ static void replace_addrs(void *ptr, uint64_t size, void *addrs)
 static void *sort_mcount_loc(void *arg)
 {
 	struct elf_mcount_loc *emloc = (struct elf_mcount_loc *)arg;
-	uint64_t offset = emloc->start_mcount_loc - shdr_addr(emloc->init_data_sec)
-					+ shdr_offset(emloc->init_data_sec);
+	uint64_t offset = emloc->start_mcount_loc - shdr_addr(init_data_sec)
+					+ shdr_offset(init_data_sec);
 	uint64_t size = emloc->stop_mcount_loc - emloc->start_mcount_loc;
 	unsigned char *start_loc = (void *)emloc->ehdr + offset;
 	Elf_Ehdr *ehdr = emloc->ehdr;
@@ -920,6 +925,211 @@ static void get_mcount_loc(struct elf_mcount_loc *emloc, Elf_Shdr *symtab_sec,
 static inline int parse_symbols(const char *fname) { return 0; }
 #endif
 
+struct elf_tracepoint {
+	Elf_Ehdr *ehdr;
+	uint64_t start_tracepoint_check;
+	uint64_t stop_tracepoint_check;
+	uint64_t start_tracepoint;
+	uint64_t stop_tracepoint;
+	uint64_t *array;
+	int count;
+};
+
+static void make_trace_array(struct elf_tracepoint *etrace)
+{
+	uint64_t offset = etrace->start_tracepoint_check - shdr_addr(init_data_sec)
+					+ shdr_offset(init_data_sec);
+	uint64_t size = etrace->stop_tracepoint_check - etrace->start_tracepoint_check;
+	Elf_Ehdr *ehdr = etrace->ehdr;
+	void *start = (void *)ehdr + offset;
+	int count = 0;
+	void *vals;
+
+	etrace->array = NULL;
+
+	/* If CONFIG_TRACEPOINT_VERIFY_USED is not set, there's nothing to do */
+	if (!size)
+		return;
+
+	vals = malloc(long_size * size);
+	if (!vals) {
+		fprintf(stderr, "Failed to allocate tracepoint check array");
+		return;
+	}
+
+	count = fill_addrs(vals, size, start);
+
+	compare_values = long_size == 4 ? compare_values_32 : compare_values_64;
+	qsort(vals, count, long_size, compare_values);
+
+	etrace->array = vals;
+	etrace->count = count;
+}
+
+static int cmp_addr_64(const void *K, const void *A)
+{
+	uint64_t key = *(const uint64_t *)K;
+	const uint64_t *a = A;
+
+	if (key < *a)
+		return -1;
+	return key > *a;
+}
+
+static int cmp_addr_32(const void *K, const void *A)
+{
+	uint32_t key = *(const uint32_t *)K;
+	const uint32_t *a = A;
+
+	if (key < *a)
+		return -1;
+	return key > *a;
+}
+
+static int find_event(void *array, size_t size, uint64_t key)
+{
+	uint32_t val_32;
+	uint64_t val_64;
+	void *val;
+	int (*cmp_func)(const void *A, const void *B);
+
+	if (long_size == 4) {
+		val_32 = key;
+		val = &val_32;
+		cmp_func = cmp_addr_32;
+	} else {
+		val_64 = key;
+		val = &val_64;
+		cmp_func = cmp_addr_64;
+	}
+	return bsearch(val, array, size, long_size, cmp_func) != NULL;
+}
+
+static int failed_event(struct elf_tracepoint *etrace, uint64_t addr)
+{
+	uint64_t sec_addr = shdr_addr(data_data_sec);
+	uint64_t sec_offset = shdr_offset(data_data_sec);
+	uint64_t offset = addr - sec_addr + sec_offset;
+	Elf_Ehdr *ehdr = etrace->ehdr;
+	void *name_ptr = (void *)ehdr + offset;
+	char *name;
+
+	if (name_ptr > file_map_end)
+		goto bad_addr;
+
+	if (long_size == 4)
+		addr = r(name_ptr);
+	else
+		addr = r8(name_ptr);
+
+	sec_addr = shdr_addr(ro_data_sec);
+	sec_offset = shdr_offset(ro_data_sec);
+	offset = addr - sec_addr + sec_offset;
+	name = (char *)ehdr + offset;
+	if ((void *)name > file_map_end)
+		goto bad_addr;
+
+	fprintf(stderr, "warning: tracepoint '%s' is unused.\n", name);
+	return 0;
+bad_addr:
+	fprintf(stderr, "warning: Failed to verify unused trace events.\n");
+	return -1;
+}
+
+static void check_tracepoints(struct elf_tracepoint *etrace)
+{
+	uint64_t sec_addr = shdr_addr(ro_data_sec);
+	uint64_t sec_offset = shdr_offset(ro_data_sec);
+	uint64_t offset = etrace->start_tracepoint - sec_addr + sec_offset;
+	uint64_t size = etrace->stop_tracepoint - etrace->start_tracepoint;
+	Elf_Ehdr *ehdr = etrace->ehdr;
+	void *start = (void *)ehdr + offset;
+	void *end = start + size;
+	void *addrs;
+	int inc = long_size;
+
+	if (!etrace->array)
+		return;
+
+	if (!size)
+		return;
+
+#ifdef PREL32_RELOCATIONS
+	inc = 4;
+#endif
+
+	sec_offset = sec_offset + (uint64_t)ehdr;
+	for (addrs = start; addrs < end; addrs += inc) {
+		uint64_t val;
+
+#ifdef PREL32_RELOCATIONS
+		val = r(addrs);
+		val += sec_addr + ((uint64_t)addrs - sec_offset);
+#else
+		val = long_size == 4 ? r(addrs) : r8(addrs);
+#endif
+		if (!find_event(etrace->array, etrace->count, val)) {
+			if (failed_event(etrace, val))
+				return;
+		}
+	}
+	free(etrace->array);
+}
+
+static void *tracepoint_check(struct elf_tracepoint *etrace, Elf_Shdr *symtab_sec,
+			      const char *strtab)
+{
+	Elf_Sym *sym, *end_sym;
+	int symentsize = shdr_entsize(symtab_sec);
+	int found = 0;
+
+	sym = (void *)etrace->ehdr + shdr_offset(symtab_sec);
+	end_sym = (void *)sym + shdr_size(symtab_sec);
+
+	while (sym < end_sym) {
+		if (!strcmp(strtab + sym_name(sym), "__start___tracepoint_check")) {
+			etrace->start_tracepoint_check = sym_value(sym);
+			if (++found == 4)
+				break;
+		} else if (!strcmp(strtab + sym_name(sym), "__stop___tracepoint_check")) {
+			etrace->stop_tracepoint_check = sym_value(sym);
+			if (++found == 4)
+				break;
+		} else if (!strcmp(strtab + sym_name(sym), "__start___tracepoints_ptrs")) {
+			etrace->start_tracepoint = sym_value(sym);
+			if (++found == 4)
+				break;
+		} else if (!strcmp(strtab + sym_name(sym), "__stop___tracepoints_ptrs")) {
+			etrace->stop_tracepoint = sym_value(sym);
+			if (++found == 4)
+				break;
+		}
+		sym = (void *)sym + symentsize;
+	}
+
+	if (!etrace->start_tracepoint_check) {
+		fprintf(stderr, "warning: get start_tracepoint_check error!\n");
+		return NULL;
+	}
+	if (!etrace->stop_tracepoint_check) {
+		fprintf(stderr, "warning: get stop_tracepoint_check error!\n");
+		return NULL;
+	}
+	if (!etrace->start_tracepoint) {
+		fprintf(stderr, "warning: get start_tracepoint error!\n");
+		return NULL;
+	}
+	if (!etrace->stop_tracepoint) {
+		fprintf(stderr, "warning: get start_tracepoint error!\n");
+		return NULL;
+	}
+
+	make_trace_array(etrace);
+	check_tracepoints(etrace);
+
+	return NULL;
+}
+
 static int do_sort(Elf_Ehdr *ehdr,
 		   char const *const fname,
 		   table_sort_t custom_sort)
@@ -948,6 +1158,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	int i;
 	unsigned int shnum;
 	unsigned int shstrndx;
+	struct elf_tracepoint tstruct = {0};
 #ifdef MCOUNT_SORT_ENABLED
 	struct elf_mcount_loc mstruct = {0};
 #endif
@@ -985,11 +1196,17 @@ static int do_sort(Elf_Ehdr *ehdr,
 			symtab_shndx = (Elf32_Word *)((const char *)ehdr +
 						      shdr_offset(shdr));
 
-#ifdef MCOUNT_SORT_ENABLED
 		/* locate the .init.data section in vmlinux */
 		if (!strcmp(secstrings + idx, ".init.data"))
-			mstruct.init_data_sec = shdr;
-#endif
+			init_data_sec = shdr;
+
+		/* locate the .ro.data section in vmlinux */
+		if (!strcmp(secstrings + idx, ".rodata"))
+			ro_data_sec = shdr;
+
+		/* locate the .data section in vmlinux */
+		if (!strcmp(secstrings + idx, ".data"))
+			data_data_sec = shdr;
 
 #ifdef UNWINDER_ORC_ENABLED
 		/* locate the ORC unwind tables */
@@ -1055,7 +1272,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	mstruct.ehdr = ehdr;
 	get_mcount_loc(&mstruct, symtab_sec, strtab);
 
-	if (!mstruct.init_data_sec || !mstruct.start_mcount_loc || !mstruct.stop_mcount_loc) {
+	if (!init_data_sec || !mstruct.start_mcount_loc || !mstruct.stop_mcount_loc) {
 		fprintf(stderr,
 			"incomplete mcount's sort in file: %s\n",
 			fname);
@@ -1071,6 +1288,9 @@ static int do_sort(Elf_Ehdr *ehdr,
 	}
 #endif
 
+	tstruct.ehdr = ehdr;
+	tracepoint_check(&tstruct, symtab_sec, strtab);
+
 	if (custom_sort) {
 		custom_sort(extab_image, shdr_size(extab_sec));
 	} else {
@@ -1404,6 +1624,8 @@ int main(int argc, char *argv[])
 			continue;
 		}
 
+		file_map_end = addr + size;
+
 		if (do_file(argv[i], addr))
 			++n_error;
 
-- 
2.47.2



