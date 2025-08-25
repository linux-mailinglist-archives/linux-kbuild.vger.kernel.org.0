Return-Path: <linux-kbuild+bounces-8611-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE0B34F98
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Aug 2025 01:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771603BA49F
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 23:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB5E82C11FC;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGdQgghR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4072C0F7B;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756163621; cv=none; b=QUCwcgWnscQfH9s/I6xRGupYq270n/e3uh6MlpgppFdeieXxbETgf4zrnKH6YDpoq4i8jeXOf8kHDujTwLZWEvgSpYpmvv+PwbEEFy6XF9p3PHGNXWi/OAM+jbNhw3uqQ0qwD18FEUV7qRVs0CYi7R8a4G6CkFsmQI38AC+wg0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756163621; c=relaxed/simple;
	bh=T9WAODWoSqWYc1cWvuaSZe07uRkUxeiirO6KfxeEK+s=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=GIXZlq2rONXBYJuTXLCzSlsHGbU1mrNWPxl7e7OvgsMufc+VOLrIxAPpiMs/24JNux1MH1Vw6YqMGOVoBarapJ5UvOMOkrZt/v6JeVWnMaaJcgqAbnIHh7ZcOfUdP7V09lAtxSzlGXFlzwqYnUabLDTp6cRuTf9RmWfQEGZNG70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGdQgghR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C481C116B1;
	Mon, 25 Aug 2025 23:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756163621;
	bh=T9WAODWoSqWYc1cWvuaSZe07uRkUxeiirO6KfxeEK+s=;
	h=Date:From:To:Cc:Subject:References:From;
	b=mGdQgghR/3LTKNlc66DkPEPaqW9N2eFoxIjYrLTl6Th9KNhABD8h1IDuVHrET9gV5
	 FXVx20Uuhg50/D8AA40SqZw/F/Dtg7W70PyYrPgBuG+3T0CuUrkGg14FCEJ4uLBMrR
	 FQvGxL1eEdLKQe53TtVF/k+ycLE6BZzXbt2HndrKULm3VvBXwoIK8GGoglo6ItZzJD
	 4Idj9MUShc8QqHjV0ga3F7u6/F92PrNoYjcPCv1FhTd5+QdHYppvQXTxDiIA5naL97
	 CoqPy6lsXxgSv9B9+gwukqDaoNKxFFsg1tROLGEwes0W3PcsZeVvdZcsKX7xkIa572
	 gEwseM/wiEwqQ==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1uqgNv-00000002tGE-3qP4;
	Mon, 25 Aug 2025 19:13:55 -0400
Message-ID: <20250825231355.769343238@kernel.org>
User-Agent: quilt/0.68
Date: Mon, 25 Aug 2025 19:13:03 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v7 2/3] tracing: Add a tracepoint verification check at build time
References: <20250825231301.433412523@kernel.org>
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

Add a verifier that injects a string of the name of the tracepoint it
calls that is added to the discarded section "__tracepoint_check".
For every builtin tracepoint, its name (which is saved in the in-memory
section "__tracepoint_strings") will have its name also in the
"__tracepoint_check" section if it is used.

Add a new program that is run on build called tracepoint-update. This is
executed on the vmlinux.o before the __tracepoint_check section is
discarded (the section is discarded before vmlinux is created). This
program will create an array of each string in the __tracepoint_check
section and then sort it. Then it will walk the strings in the
__tracepoint_strings section and do a binary search to check if its name
is in the __tracepoint_check section. If it is not, then it is unused and
a warning is printed.

Note, this currently only handles tracepoints that are builtin and not in
modules.

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

This tool could be updated to process modules in the future.

I'd like to thank Mathieu Desnoyers for suggesting using strings instead
of pointers, as using pointers in vmlinux.o required handling relocations
and it required implementing almost a full feature linker to do so.

Link: https://lore.kernel.org/all/20250528114549.4d8a5e03@gandalf.local.home/

Suggested-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com> # for using strings instead of pointers
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
Changes since v6: https://lore.kernel.org/20250820174828.080947631@kernel.org

- Fix typo on comment (Randy Dunlap)

 include/asm-generic/vmlinux.lds.h |   1 +
 include/linux/tracepoint.h        |  10 ++
 kernel/trace/Kconfig              |  10 ++
 scripts/Makefile                  |   3 +
 scripts/link-vmlinux.sh           |   4 +
 scripts/tracepoint-update.c       | 232 ++++++++++++++++++++++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 scripts/tracepoint-update.c

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e..b0aed322ccbd 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -1047,6 +1047,7 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 	*(.modinfo)							\
 	/* ld.bfd warns about .gnu.version* even when not emitted */	\
 	*(.gnu.version*)						\
+	*(__tracepoint_check)
 
 #define DISCARDS							\
 	/DISCARD/ : {							\
diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 826ce3f8e1f8..71d2e085c49e 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -221,6 +221,14 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 		__do_trace_##name(args);				\
 	}
 
+#ifdef CONFIG_TRACEPOINT_WARN_ON_UNUSED
+# define TRACEPOINT_CHECK(name)						\
+	static const char __used __section("__tracepoint_check") __trace_check[] = \
+		#name;
+#else
+# define TRACEPOINT_CHECK(tname)
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
index d2c79da81e4f..6dcb0fbacf0d 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -1067,6 +1067,16 @@ config GCOV_PROFILE_FTRACE
 	  Note that on a kernel compiled with this config, ftrace will
 	  run significantly slower.
 
+config TRACEPOINT_WARN_ON_UNUSED
+	bool "Warn on build if a tracepoint is defined but not used"
+	depends on TRACEPOINTS
+	help
+	  This option checks if every builtin defined tracepoint is
+	  used in the code. If a tracepoint is defined but not used,
+	  it will waste memory as its metadata is still created.
+	  This will cause a warning at build time if it detects a
+	  tracepoint created but never called.
+
 config FTRACE_SELFTEST
 	bool
 
diff --git a/scripts/Makefile b/scripts/Makefile
index f19624b3ed92..11bf1bbd8c5d 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -11,8 +11,10 @@ hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
+hostprogs-always-$(CONFIG_TRACEPOINT_WARN_ON_UNUSED)	+= tracepoint-update
 
 sorttable-objs := sorttable.o elf-parse.o
+tracepoint-update-objs := tracepoint-update.o elf-parse.o
 
 ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 always-$(CONFIG_RUST)					+= target.json
@@ -27,6 +29,7 @@ generate_rust_target-rust := y
 rustdoc_test_builder-rust := y
 rustdoc_test_gen-rust := y
 
+HOSTCFLAGS_tracepoint-update.o = -I$(srctree)/tools/include
 HOSTCFLAGS_elf-parse.o = -I$(srctree)/tools/include
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTLDLIBS_sorttable = -lpthread
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 51367c2bfc21..4934c5e6c0b1 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -211,6 +211,10 @@ kallsymso=
 strip_debug=
 generate_map=
 
+if is_enabled CONFIG_TRACEPOINT_WARN_ON_UNUSED; then
+	${objtree}/scripts/tracepoint-update vmlinux.o
+fi
+
 if is_enabled CONFIG_KALLSYMS; then
 	true > .tmp_vmlinux0.syms
 	kallsyms .tmp_vmlinux0.syms .tmp_vmlinux0.kallsyms
diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
new file mode 100644
index 000000000000..4018be0cb4df
--- /dev/null
+++ b/scripts/tracepoint-update.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <getopt.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdbool.h>
+#include <string.h>
+#include <unistd.h>
+#include <errno.h>
+#include <pthread.h>
+
+#include "elf-parse.h"
+
+static Elf_Shdr *check_data_sec;
+static Elf_Shdr *tracepoint_data_sec;
+
+static inline void *get_index(void *start, int entsize, int index)
+{
+	return start + (entsize * index);
+}
+
+static int compare_strings(const void *a, const void *b)
+{
+	const char *av = *(const char **)a;
+	const char *bv = *(const char **)b;
+
+	return strcmp(av, bv);
+}
+
+struct elf_tracepoint {
+	Elf_Ehdr *ehdr;
+	const char **array;
+	int count;
+};
+
+#define REALLOC_SIZE (1 << 10)
+#define REALLOC_MASK (REALLOC_SIZE - 1)
+
+static int add_string(const char *str, const char ***vals, int *count)
+{
+	const char **array = *vals;
+
+	if (!(*count & REALLOC_MASK)) {
+		int size = (*count) + REALLOC_SIZE;
+
+		array = realloc(array, sizeof(char *) * size);
+		if (!array) {
+			fprintf(stderr, "Failed memory allocation\n");
+			return -1;
+		}
+		*vals = array;
+	}
+
+	array[(*count)++] = str;
+	return 0;
+}
+
+/**
+ * for_each_shdr_str - iterator that reads strings that are in an ELF section.
+ * @len: "int" to hold the length of the current string
+ * @ehdr: A pointer to the ehdr of the ELF file
+ * @sec: The section that has the strings to iterate on
+ *
+ * This is a for loop that iterates over all the nul terminated strings
+ * that are in a given ELF section. The variable "str" will hold
+ * the current string for each iteration and the passed in @len will
+ * contain the strlen() of that string.
+ */
+#define for_each_shdr_str(len, ehdr, sec)				\
+	for (const char *str = (void *)(ehdr) + shdr_offset(sec),	\
+			*end = str + shdr_size(sec);			\
+	     len = strlen(str), str < end;				\
+	     str += (len) + 1)
+
+
+static void make_trace_array(struct elf_tracepoint *etrace)
+{
+	Elf_Ehdr *ehdr = etrace->ehdr;
+	const char **vals = NULL;
+	int count = 0;
+	int len;
+
+	etrace->array = NULL;
+
+	/*
+	 * The __tracepoint_check section is filled with strings of the
+	 * names of tracepoints (in tracepoint_strings). Create an array
+	 * that points to each string and then sort the array.
+	 */
+	for_each_shdr_str(len, ehdr, check_data_sec) {
+		if (!len)
+			continue;
+		if (add_string(str, &vals, &count) < 0)
+			return;
+	}
+
+	/* If CONFIG_TRACEPOINT_VERIFY_USED is not set, there's nothing to do */
+	if (!count)
+		return;
+
+	qsort(vals, count, sizeof(char *), compare_strings);
+
+	etrace->array = vals;
+	etrace->count = count;
+}
+
+static int find_event(const char *str, void *array, size_t size)
+{
+	return bsearch(&str, array, size, sizeof(char *), compare_strings) != NULL;
+}
+
+static void check_tracepoints(struct elf_tracepoint *etrace)
+{
+	Elf_Ehdr *ehdr = etrace->ehdr;
+	int len;
+
+	if (!etrace->array)
+		return;
+
+	/*
+	 * The __tracepoints_strings section holds all the names of the
+	 * defined tracepoints. If any of them are not in the
+	 * __tracepoint_check_section it means they are not used.
+	 */
+	for_each_shdr_str(len, ehdr, tracepoint_data_sec) {
+		if (!len)
+			continue;
+		if (!find_event(str, etrace->array, etrace->count)) {
+			fprintf(stderr, "warning: tracepoint '%s' is unused.\n", str);
+		}
+	}
+
+	free(etrace->array);
+}
+
+static void *tracepoint_check(struct elf_tracepoint *etrace)
+{
+	make_trace_array(etrace);
+	check_tracepoints(etrace);
+
+	return NULL;
+}
+
+static int process_tracepoints(void *addr, char const *const fname)
+{
+	struct elf_tracepoint etrace = {0};
+	Elf_Ehdr *ehdr = addr;
+	Elf_Shdr *shdr_start;
+	Elf_Shdr *string_sec;
+	const char *secstrings;
+	unsigned int shnum;
+	unsigned int shstrndx;
+	int shentsize;
+	int idx;
+	int done = 2;
+
+	shdr_start = (Elf_Shdr *)((char *)ehdr + ehdr_shoff(ehdr));
+	shentsize = ehdr_shentsize(ehdr);
+
+	shstrndx = ehdr_shstrndx(ehdr);
+	if (shstrndx == SHN_XINDEX)
+		shstrndx = shdr_link(shdr_start);
+	string_sec = get_index(shdr_start, shentsize, shstrndx);
+	secstrings = (const char *)ehdr + shdr_offset(string_sec);
+
+	shnum = ehdr_shnum(ehdr);
+	if (shnum == SHN_UNDEF)
+		shnum = shdr_size(shdr_start);
+
+	for (int i = 0; done && i < shnum; i++) {
+		Elf_Shdr *shdr = get_index(shdr_start, shentsize, i);
+
+		idx = shdr_name(shdr);
+
+		/* locate the __tracepoint_check in vmlinux */
+		if (!strcmp(secstrings + idx, "__tracepoint_check")) {
+			check_data_sec = shdr;
+			done--;
+		}
+
+		/* locate the __tracepoints_ptrs section in vmlinux */
+		if (!strcmp(secstrings + idx, "__tracepoints_strings")) {
+			tracepoint_data_sec = shdr;
+			done--;
+		}
+	}
+
+	if (!check_data_sec) {
+		fprintf(stderr,	"no __tracepoint_check in file: %s\n", fname);
+		return -1;
+	}
+
+	if (!tracepoint_data_sec) {
+		fprintf(stderr,	"no __tracepoint_strings in file: %s\n", fname);
+		return -1;
+	}
+
+	etrace.ehdr = ehdr;
+	tracepoint_check(&etrace);
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int n_error = 0;
+	size_t size = 0;
+	void *addr = NULL;
+
+	if (argc < 2) {
+		fprintf(stderr, "usage: tracepoint-update vmlinux...\n");
+		return 0;
+	}
+
+	/* Process each file in turn, allowing deep failure. */
+	for (int i = 1; i < argc; i++) {
+		addr = elf_map(argv[i], &size, 1 << ET_REL);
+		if (!addr) {
+			++n_error;
+			continue;
+		}
+
+		if (process_tracepoints(addr, argv[i]))
+			++n_error;
+
+		elf_unmap(addr, size);
+	}
+
+	return !!n_error;
+}
-- 
2.50.1



