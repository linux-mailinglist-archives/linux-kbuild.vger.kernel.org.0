Return-Path: <linux-kbuild+bounces-1809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942178BEEAD
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 23:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E0DF2B22072
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2024 21:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB29278269;
	Tue,  7 May 2024 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RD8wqP+Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800B973194;
	Tue,  7 May 2024 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715116184; cv=none; b=p+r61gJuF8NftA8U/5E8z7xCGq8EupCt3xRf60AXAcHZnAZh0PjlALCGCsm1lRN14RH8qFHK4VhClJd20Lh1VhC/+lTj2piZfLLu8kf48sfzC+kd0Qt2bgTPprl5Y9lSdCztwH3wCc3K6BHVDIRIcfFTTwbBDMge5wVDrZrFAY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715116184; c=relaxed/simple;
	bh=YBM+aHaOnENJtGcc2EcRvTcNyEBIYpWkQOdlyodLL/4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hyEB5h1WnPFaNyBeUJ+/nCwMdkAPS9nKvn2WzYeF8cx9ZAp2HqZ/tTSzTnEXP5PMskFE5WAQWCyJ2XkqtbraZjC6JkRgpPKoprgnrydqvRlodpMFGuiKjupDlwRZ+rJaVzICu+DBtEbhWizj9pgJ+/e4ueQ3qp+uNfq0G4Zj+6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RD8wqP+Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A173C2BBFC;
	Tue,  7 May 2024 21:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715116184;
	bh=YBM+aHaOnENJtGcc2EcRvTcNyEBIYpWkQOdlyodLL/4=;
	h=From:To:Cc:Subject:Date:From;
	b=RD8wqP+QE6TuECeQ7G9MUvQi1hci+28uMml9Lz76a1Ae/XalU8vC7uQUn6by4NS7K
	 qMjZkD8t7pyxWE0QYnKue9iq+d79CI4Ng7VVG/ftpPyif5C2SJkI++o9xRuLBGl6kp
	 9F/FisoyFyLxp8GMp0051u7KW/AsCpdq0lu1vM5kQUHBXnzYaRlftC2sVsj88KkFF5
	 gfW4HNgGcmma4wnt8Gk+zZ5SKj4UC35ff+B9RIP8ztJusBFFsNntXeTVxJhFLyqXzN
	 es3hwy1WRoqveYsIlDCz8nk5hJr+V4EGGH49v8oUyyRpGWZUn2F3zl94yc/119zmWk
	 oAZz7FY1+L5/A==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>
Subject: [PATCH v2] kbuild: rust: split up helpers.c
Date: Tue,  7 May 2024 23:08:18 +0200
Message-ID: <20240507210818.672517-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Hindborg <a.hindborg@samsung.com>

When rebasing patch sets on top of upstream Linux, merge conflicts in
helpers.c are common and time consuming [1]. Thus, split the file so
that each kernel component can live in a separate file.

Each helper file is listed explicitly and thus conflicts in the file
list are still likely. However, they should be simpler to resolve than
the conflicts usually seen in helpers.c.

Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
Reviewed-by: Sergio González Collado <sergio.collado@gmail.com>
Tested-by: Sergio González Collado <sergio.collado@gmail.com>
Link: https://lore.kernel.org/r/20240416074607.1395481-1-nmi@metaspace.dk
[ Reworded message slightly and fixed nits in it. Applied commit
  84373132b831 ("rust: helpers: Fix grammar in comment") here. Added
  SPDX license identifier in new Makefile. Applied Markdown formatting.
  Added `.gitignore`. Included `helpers_combined.c` in the `clean`
  target. - Miguel ]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
This is a patch from Andreas that I was going to apply to `rust-next`
with the tweaks mentioned above, but I noticed Kbuild was not Cc'd, so
we decided to send this as a "v2" and thus give a chance to Kbuild to
take a look for next cycle.

If something in the diff to v1 is wrong, it is my fault, not Andreas' :)

 Makefile                    |   3 +-
 rust/Makefile               |  36 ++++++--
 rust/helpers.c              | 180 ------------------------------------
 rust/helpers/.gitignore     |   3 +
 rust/helpers/Makefile       |   8 ++
 rust/helpers/README.md      |  18 ++++
 rust/helpers/bug.c          |   9 ++
 rust/helpers/build_assert.c |  25 +++++
 rust/helpers/build_bug.c    |  10 ++
 rust/helpers/err.c          |  22 +++++
 rust/helpers/kunit.c        |  10 ++
 rust/helpers/mutex.c        |  10 ++
 rust/helpers/refcount.c     |  22 +++++
 rust/helpers/signal.c       |  10 ++
 rust/helpers/spinlock.c     |  27 ++++++
 rust/helpers/task.c         |  22 +++++
 rust/helpers/wait.c         |  10 ++
 rust/helpers/workqueue.c    |  16 ++++
 18 files changed, 252 insertions(+), 189 deletions(-)
 delete mode 100644 rust/helpers.c
 create mode 100644 rust/helpers/.gitignore
 create mode 100644 rust/helpers/Makefile
 create mode 100644 rust/helpers/README.md
 create mode 100644 rust/helpers/bug.c
 create mode 100644 rust/helpers/build_assert.c
 create mode 100644 rust/helpers/build_bug.c
 create mode 100644 rust/helpers/err.c
 create mode 100644 rust/helpers/kunit.c
 create mode 100644 rust/helpers/mutex.c
 create mode 100644 rust/helpers/refcount.c
 create mode 100644 rust/helpers/signal.c
 create mode 100644 rust/helpers/spinlock.c
 create mode 100644 rust/helpers/task.c
 create mode 100644 rust/helpers/wait.c
 create mode 100644 rust/helpers/workqueue.c

diff --git a/Makefile b/Makefile
index 763b6792d3d5..cd232594b2a7 100644
--- a/Makefile
+++ b/Makefile
@@ -1478,7 +1478,8 @@ endif # CONFIG_MODULES
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       compile_commands.json .thinlto-cache rust/test \
-	       rust-project.json .vmlinux.objs .vmlinux.export.c
+	       rust/helpers/helpers_combined.c rust-project.json \
+	       .vmlinux.objs .vmlinux.export.c

 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
diff --git a/rust/Makefile b/rust/Makefile
index ca86abac4ed0..71faf420b092 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,10 +6,22 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o
 always-$(CONFIG_RUST) += exports_core_generated.h

-# Missing prototypes are expected in the helpers since these are exported
-# for Rust only, thus there is no header nor prototypes.
-obj-$(CONFIG_RUST) += helpers.o
-CFLAGS_REMOVE_helpers.o = -Wmissing-prototypes -Wmissing-declarations
+RUST_HELPERS := \
+	bug \
+	build_assert \
+	build_bug \
+	err \
+	kunit \
+	mutex \
+	refcount \
+	signal \
+	spinlock\
+	task \
+	wait \
+	workqueue
+
+export RUST_HELPERS
+obj-y += helpers/

 always-$(CONFIG_RUST) += libmacros.so
 no-clean-files += libmacros.so
@@ -329,6 +341,10 @@ quiet_cmd_bindgen = BINDGEN $@
 		-o $@ -- $(bindgen_c_flags_final) -DMODULE \
 		$(bindgen_target_cflags) $(bindgen_target_extra)

+quiet_cmd_cat = CAT     $@
+      cmd_cat = \
+	cat $(patsubst %,$(srctree)/$(src)/helpers/%.c, $(RUST_HELPERS)) > $@
+
 $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
     $(shell grep -Ev '^#|^$$' $(srctree)/$(src)/bindgen_parameters)
 $(obj)/bindings/bindings_generated.rs: private bindgen_target_extra = ; \
@@ -343,9 +359,9 @@ $(obj)/uapi/uapi_generated.rs: $(src)/uapi/uapi_helper.h \
     $(src)/bindgen_parameters FORCE
 	$(call if_changed_dep,bindgen)

-# See `CFLAGS_REMOVE_helpers.o` above. In addition, Clang on C does not warn
-# with `-Wmissing-declarations` (unlike GCC), so it is not strictly needed here
-# given it is `libclang`; but for consistency, future Clang changes and/or
+# See `ccflags-remove-y` in `helpers/Makefile`. In addition, Clang on C does not
+# warn with `-Wmissing-declarations` (unlike GCC), so it is not strictly needed
+# here given it is `libclang`; but for consistency, future Clang changes and/or
 # a potential future GCC backend for `bindgen`, we disable it too.
 $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_flags = \
     --blocklist-type '.*' --allowlist-var '' \
@@ -354,9 +370,13 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_cflags = \
     -I$(objtree)/$(obj) -Wno-missing-prototypes -Wno-missing-declarations
 $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ; \
     sed -Ei 's/pub fn rust_helper_([a-zA-Z0-9_]*)/#[link_name="rust_helper_\1"]\n    pub fn \1/g' $@
-$(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
+$(obj)/bindings/bindings_helpers_generated.rs: $(obj)/helpers/helpers_combined.c FORCE
 	$(call if_changed_dep,bindgen)

+targets += helpers/helpers_combined.c
+$(obj)/helpers/helpers_combined.c: $(patsubst %,$(src)/helpers/%.c, $(RUST_HELPERS)) FORCE
+	$(call if_changed,cat)
+
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
 	$(NM) -p --defined-only $< \
diff --git a/rust/helpers.c b/rust/helpers.c
deleted file mode 100644
index 4c8b7b92a4f4..000000000000
--- a/rust/helpers.c
+++ /dev/null
@@ -1,180 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Non-trivial C macros cannot be used in Rust. Similarly, inlined C functions
- * cannot be called either. This file explicitly creates functions ("helpers")
- * that wrap those so that they can be called from Rust.
- *
- * Even though Rust kernel modules should never use the bindings directly, some
- * of these helpers need to be exported because Rust generics and inlined
- * functions may not get their code generated in the crate where they are
- * defined. Other helpers, called from non-inline functions, may not be
- * exported, in principle. However, in general, the Rust compiler does not
- * guarantee codegen will be performed for a non-inline function either.
- * Therefore, this file exports all the helpers. In the future, this may be
- * revisited to reduce the number of exports after the compiler is informed
- * about the places codegen is required.
- *
- * All symbols are exported as GPL-only to guarantee no GPL-only feature is
- * accidentally exposed.
- *
- * Sorted alphabetically.
- */
-
-#include <kunit/test-bug.h>
-#include <linux/bug.h>
-#include <linux/build_bug.h>
-#include <linux/err.h>
-#include <linux/errname.h>
-#include <linux/mutex.h>
-#include <linux/refcount.h>
-#include <linux/sched/signal.h>
-#include <linux/spinlock.h>
-#include <linux/wait.h>
-#include <linux/workqueue.h>
-
-__noreturn void rust_helper_BUG(void)
-{
-	BUG();
-}
-EXPORT_SYMBOL_GPL(rust_helper_BUG);
-
-void rust_helper_mutex_lock(struct mutex *lock)
-{
-	mutex_lock(lock);
-}
-EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
-
-void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
-				  struct lock_class_key *key)
-{
-#ifdef CONFIG_DEBUG_SPINLOCK
-	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
-#else
-	spin_lock_init(lock);
-#endif
-}
-EXPORT_SYMBOL_GPL(rust_helper___spin_lock_init);
-
-void rust_helper_spin_lock(spinlock_t *lock)
-{
-	spin_lock(lock);
-}
-EXPORT_SYMBOL_GPL(rust_helper_spin_lock);
-
-void rust_helper_spin_unlock(spinlock_t *lock)
-{
-	spin_unlock(lock);
-}
-EXPORT_SYMBOL_GPL(rust_helper_spin_unlock);
-
-void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
-{
-	init_wait(wq_entry);
-}
-EXPORT_SYMBOL_GPL(rust_helper_init_wait);
-
-int rust_helper_signal_pending(struct task_struct *t)
-{
-	return signal_pending(t);
-}
-EXPORT_SYMBOL_GPL(rust_helper_signal_pending);
-
-refcount_t rust_helper_REFCOUNT_INIT(int n)
-{
-	return (refcount_t)REFCOUNT_INIT(n);
-}
-EXPORT_SYMBOL_GPL(rust_helper_REFCOUNT_INIT);
-
-void rust_helper_refcount_inc(refcount_t *r)
-{
-	refcount_inc(r);
-}
-EXPORT_SYMBOL_GPL(rust_helper_refcount_inc);
-
-bool rust_helper_refcount_dec_and_test(refcount_t *r)
-{
-	return refcount_dec_and_test(r);
-}
-EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);
-
-__force void *rust_helper_ERR_PTR(long err)
-{
-	return ERR_PTR(err);
-}
-EXPORT_SYMBOL_GPL(rust_helper_ERR_PTR);
-
-bool rust_helper_IS_ERR(__force const void *ptr)
-{
-	return IS_ERR(ptr);
-}
-EXPORT_SYMBOL_GPL(rust_helper_IS_ERR);
-
-long rust_helper_PTR_ERR(__force const void *ptr)
-{
-	return PTR_ERR(ptr);
-}
-EXPORT_SYMBOL_GPL(rust_helper_PTR_ERR);
-
-const char *rust_helper_errname(int err)
-{
-	return errname(err);
-}
-EXPORT_SYMBOL_GPL(rust_helper_errname);
-
-struct task_struct *rust_helper_get_current(void)
-{
-	return current;
-}
-EXPORT_SYMBOL_GPL(rust_helper_get_current);
-
-void rust_helper_get_task_struct(struct task_struct *t)
-{
-	get_task_struct(t);
-}
-EXPORT_SYMBOL_GPL(rust_helper_get_task_struct);
-
-void rust_helper_put_task_struct(struct task_struct *t)
-{
-	put_task_struct(t);
-}
-EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
-
-struct kunit *rust_helper_kunit_get_current_test(void)
-{
-	return kunit_get_current_test();
-}
-EXPORT_SYMBOL_GPL(rust_helper_kunit_get_current_test);
-
-void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
-				    bool onstack, const char *name,
-				    struct lock_class_key *key)
-{
-	__init_work(work, onstack);
-	work->data = (atomic_long_t)WORK_DATA_INIT();
-	lockdep_init_map(&work->lockdep_map, name, key, 0);
-	INIT_LIST_HEAD(&work->entry);
-	work->func = func;
-}
-EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
-
-/*
- * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
- * use it in contexts where Rust expects a `usize` like slice (array) indices.
- * `usize` is defined to be the same as C's `uintptr_t` type (can hold any
- * pointer) but not necessarily the same as `size_t` (can hold the size of any
- * single object). Most modern platforms use the same concrete integer type for
- * both of them, but in case we find ourselves on a platform where
- * that's not true, fail early instead of risking ABI or
- * integer-overflow issues.
- *
- * If your platform fails this assertion, it means that you are in
- * danger of integer-overflow bugs (even if you attempt to add
- * `--no-size_t-is-usize`). It may be easiest to change the kernel ABI on
- * your platform such that `size_t` matches `uintptr_t` (i.e., to increase
- * `size_t`, because `uintptr_t` has to be at least as big as `size_t`).
- */
-static_assert(
-	sizeof(size_t) == sizeof(uintptr_t) &&
-	__alignof__(size_t) == __alignof__(uintptr_t),
-	"Rust code expects C `size_t` to match Rust `usize`"
-);
diff --git a/rust/helpers/.gitignore b/rust/helpers/.gitignore
new file mode 100644
index 000000000000..b3e8bd345aec
--- /dev/null
+++ b/rust/helpers/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+helpers_combined.c
diff --git a/rust/helpers/Makefile b/rust/helpers/Makefile
new file mode 100644
index 000000000000..e03c7d7bd54d
--- /dev/null
+++ b/rust/helpers/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# Note: `RUST_HELPERS` is defined in `../Makefile`.
+
+# Missing prototypes are expected in the helpers since these are exported
+# for Rust only, thus there is no header nor prototypes.
+obj-$(CONFIG_RUST) += $(patsubst %,%.o, $(RUST_HELPERS))
+ccflags-remove-y += -Wmissing-prototypes -Wmissing-declarations
diff --git a/rust/helpers/README.md b/rust/helpers/README.md
new file mode 100644
index 000000000000..256d37efc7c9
--- /dev/null
+++ b/rust/helpers/README.md
@@ -0,0 +1,18 @@
+# Rust Helpers
+
+Non-trivial C macros cannot be used in Rust. Similarly, inlined C functions
+cannot be called either. The files in this directory explicitly create functions
+("helpers") that wrap those so that they can be called from Rust.
+
+Even though Rust kernel modules should never use the bindings directly, some
+of these helpers need to be exported because Rust generics and inlined
+functions may not get their code generated in the crate where they are
+defined. Other helpers, called from non-inline functions, may not be
+exported, in principle. However, in general, the Rust compiler does not
+guarantee codegen will be performed for a non-inline function either.
+Therefore, this file exports all the helpers. In the future, this may be
+revisited to reduce the number of exports after the compiler is informed
+about the places codegen is required.
+
+All symbols are exported as GPL-only to guarantee no GPL-only feature is
+accidentally exposed.
diff --git a/rust/helpers/bug.c b/rust/helpers/bug.c
new file mode 100644
index 000000000000..e2afbad23dcd
--- /dev/null
+++ b/rust/helpers/bug.c
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bug.h>
+
+__noreturn void rust_helper_BUG(void)
+{
+	BUG();
+}
+EXPORT_SYMBOL_GPL(rust_helper_BUG);
diff --git a/rust/helpers/build_assert.c b/rust/helpers/build_assert.c
new file mode 100644
index 000000000000..6a54b2680b14
--- /dev/null
+++ b/rust/helpers/build_assert.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/build_bug.h>
+
+/*
+ * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
+ * use it in contexts where Rust expects a `usize` like slice (array) indices.
+ * `usize` is defined to be the same as C's `uintptr_t` type (can hold any
+ * pointer) but not necessarily the same as `size_t` (can hold the size of any
+ * single object). Most modern platforms use the same concrete integer type for
+ * both of them, but in case we find ourselves on a platform where
+ * that's not true, fail early instead of risking ABI or
+ * integer-overflow issues.
+ *
+ * If your platform fails this assertion, it means that you are in
+ * danger of integer-overflow bugs (even if you attempt to add
+ * `--no-size_t-is-usize`). It may be easiest to change the kernel ABI on
+ * your platform such that `size_t` matches `uintptr_t` (i.e., to increase
+ * `size_t`, because `uintptr_t` has to be at least as big as `size_t`).
+ */
+static_assert(
+	sizeof(size_t) == sizeof(uintptr_t) &&
+	__alignof__(size_t) == __alignof__(uintptr_t),
+	"Rust code expects C `size_t` to match Rust `usize`"
+);
diff --git a/rust/helpers/build_bug.c b/rust/helpers/build_bug.c
new file mode 100644
index 000000000000..f3106f248485
--- /dev/null
+++ b/rust/helpers/build_bug.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/errname.h>
+
+const char *rust_helper_errname(int err)
+{
+	return errname(err);
+}
+EXPORT_SYMBOL_GPL(rust_helper_errname);
diff --git a/rust/helpers/err.c b/rust/helpers/err.c
new file mode 100644
index 000000000000..fba4e0be64f5
--- /dev/null
+++ b/rust/helpers/err.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/err.h>
+#include <linux/export.h>
+
+__force void *rust_helper_ERR_PTR(long err)
+{
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(rust_helper_ERR_PTR);
+
+bool rust_helper_IS_ERR(__force const void *ptr)
+{
+	return IS_ERR(ptr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_IS_ERR);
+
+long rust_helper_PTR_ERR(__force const void *ptr)
+{
+	return PTR_ERR(ptr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_PTR_ERR);
diff --git a/rust/helpers/kunit.c b/rust/helpers/kunit.c
new file mode 100644
index 000000000000..905e4ff4424a
--- /dev/null
+++ b/rust/helpers/kunit.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test-bug.h>
+#include <linux/export.h>
+
+struct kunit *rust_helper_kunit_get_current_test(void)
+{
+	return kunit_get_current_test();
+}
+EXPORT_SYMBOL_GPL(rust_helper_kunit_get_current_test);
diff --git a/rust/helpers/mutex.c b/rust/helpers/mutex.c
new file mode 100644
index 000000000000..29fd141c387d
--- /dev/null
+++ b/rust/helpers/mutex.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/mutex.h>
+
+void rust_helper_mutex_lock(struct mutex *lock)
+{
+	mutex_lock(lock);
+}
+EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
diff --git a/rust/helpers/refcount.c b/rust/helpers/refcount.c
new file mode 100644
index 000000000000..13ab64805f77
--- /dev/null
+++ b/rust/helpers/refcount.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/refcount.h>
+
+refcount_t rust_helper_REFCOUNT_INIT(int n)
+{
+	return (refcount_t)REFCOUNT_INIT(n);
+}
+EXPORT_SYMBOL_GPL(rust_helper_REFCOUNT_INIT);
+
+void rust_helper_refcount_inc(refcount_t *r)
+{
+	refcount_inc(r);
+}
+EXPORT_SYMBOL_GPL(rust_helper_refcount_inc);
+
+bool rust_helper_refcount_dec_and_test(refcount_t *r)
+{
+	return refcount_dec_and_test(r);
+}
+EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);
diff --git a/rust/helpers/signal.c b/rust/helpers/signal.c
new file mode 100644
index 000000000000..d44e8096b8a9
--- /dev/null
+++ b/rust/helpers/signal.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/sched/signal.h>
+
+int rust_helper_signal_pending(struct task_struct *t)
+{
+	return signal_pending(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_signal_pending);
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
new file mode 100644
index 000000000000..04fd8ddb4986
--- /dev/null
+++ b/rust/helpers/spinlock.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/spinlock.h>
+
+void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
+				  struct lock_class_key *key)
+{
+#ifdef CONFIG_DEBUG_SPINLOCK
+	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
+#else
+	spin_lock_init(lock);
+#endif
+}
+EXPORT_SYMBOL_GPL(rust_helper___spin_lock_init);
+
+void rust_helper_spin_lock(spinlock_t *lock)
+{
+	spin_lock(lock);
+}
+EXPORT_SYMBOL_GPL(rust_helper_spin_lock);
+
+void rust_helper_spin_unlock(spinlock_t *lock)
+{
+	spin_unlock(lock);
+}
+EXPORT_SYMBOL_GPL(rust_helper_spin_unlock);
diff --git a/rust/helpers/task.c b/rust/helpers/task.c
new file mode 100644
index 000000000000..b176c347f0d4
--- /dev/null
+++ b/rust/helpers/task.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/sched/task.h>
+
+struct task_struct *rust_helper_get_current(void)
+{
+	return current;
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_current);
+
+void rust_helper_get_task_struct(struct task_struct *t)
+{
+	get_task_struct(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_task_struct);
+
+void rust_helper_put_task_struct(struct task_struct *t)
+{
+	put_task_struct(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
diff --git a/rust/helpers/wait.c b/rust/helpers/wait.c
new file mode 100644
index 000000000000..bf361f40c7cb
--- /dev/null
+++ b/rust/helpers/wait.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/wait.h>
+
+void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
+{
+	init_wait(wq_entry);
+}
+EXPORT_SYMBOL_GPL(rust_helper_init_wait);
diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
new file mode 100644
index 000000000000..12e2ee66aa4f
--- /dev/null
+++ b/rust/helpers/workqueue.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/export.h>
+#include <linux/workqueue.h>
+
+void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
+				    bool onstack, const char *name,
+				    struct lock_class_key *key)
+{
+	__init_work(work, onstack);
+	work->data = (atomic_long_t)WORK_DATA_INIT();
+	lockdep_init_map(&work->lockdep_map, name, key, 0);
+	INIT_LIST_HEAD(&work->entry);
+	work->func = func;
+}
+EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);

base-commit: 1161057f53f643b63060835d46461ef09e8abe2f
--
2.45.0

