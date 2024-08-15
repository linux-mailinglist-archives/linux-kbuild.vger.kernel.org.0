Return-Path: <linux-kbuild+bounces-2994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2935A952CB7
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8C31F20F40
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 10:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EC21C0DF3;
	Thu, 15 Aug 2024 10:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace.dk header.i=@metaspace.dk header.b="RLExazqL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715071C0DF7;
	Thu, 15 Aug 2024 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723717845; cv=none; b=aus31Es1F61JC3GYfIPxZOTSVFoa29GsjptgUM5nrRNaDXnqt6wSTEp0YNGbjAn4JaD7zbL2uPMa3936Ughvu6nYeL3RpaFuIHFdSTuDhD9on7d+MzY066LCc+PqFzlxz+L8Q4m+W+LnPdNPz45YmW4uXkzCGxfUzjJIgLLvyCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723717845; c=relaxed/simple;
	bh=VWZRKRtu6zgp4UQYM6BxVb6N8OoV39KqLuCyQdw0Aks=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r2+uQ0FUaBY1Mw1Dyf9i3C3cJPEn53g9txz0nfA/JjeeHr4TW6ZC1sAkJrlkW+3fS0ufkeEecUQb0GGojjDj46BGrHkDPl4HSadaK8QpXE9Oc+v9XS4NrGqt/8EiGO3piyAayZ5SJS6/UNpvaM1+GxWp5qyf9vMVEpLmM1bYZ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=metaspace.dk; spf=pass smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace.dk header.i=@metaspace.dk header.b=RLExazqL; arc=none smtp.client-ip=185.70.40.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metaspace.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=metaspace.dk;
	s=protonmail; t=1723717832; x=1723977032;
	bh=/g1lBdOD660PIsQeYpgPldRYhpCtMZs+flfcSgsyGE8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RLExazqL65a30aHOCFAhhTs5xTOhMt0sYMMoIcqkNQqF8monXxL1qJDYb6watkPbg
	 lxJuKTfQoAlyGCcFdR9wjMUbOrbMx448cwmowj+MwdAapudTjxBpuWbpPCsZlEuNUl
	 tLtHBgsZevzxx6/Vg7eeIHbzxVvRSw8Bwuk1+tOnQi5hUJVVY5gDYUB7ziUfnBg/ma
	 ggQvVwffjq5vQx4XcBIj7m4h6hHI95ytsppYl226SpyXJgBs+jDqSt5ODL7eFmusOr
	 UhLcVFFG9x+57VglLIaHTzX6CVh9j5izY09ICIY93QzJ7XKmpPs6X5eDPS6JGCRO+l
	 B1J9i/PtxiyAw==
Date: Thu, 15 Aug 2024 10:30:26 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
From: Andreas Hindborg <nmi@metaspace.dk>
Cc: Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, =?utf-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] kbuild: rust: split up helpers.c
Message-ID: <20240815103016.2771842-1-nmi@metaspace.dk>
Feedback-ID: 113830118:user:proton
X-Pm-Message-ID: f0aa83ebcc44c8c022f8169f0dbf2de91566a72f
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andreas Hindborg <a.hindborg@samsung.com>

This patch splits up the rust helpers C file. When rebasing patch sets on
upstream linux, merge conflicts in helpers.c is common and time consuming
[1]. Thus, split the file so that each kernel component can live in a
separate file.

This patch lists helper files explicitly and thus conflicts in the file
list is still likely. However, they should be more simple to resolve than
the conflicts usually seen in helpers.c.

Link: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/to=
pic/Splitting.20up.20helpers.2Ec/near/426694012 [1]
Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>

---

Changes since v2 [2]:
- Rebase on 6.11-rc3.
- Use `cpp` instead of Makefile scripting to concatenate files.

Link:
https://lore.kernel.org/rust-for-linux/20240507210818.672517-1-ojeda@kernel=
.org/ [2]
---
 rust/Makefile               |   6 +-
 rust/helpers.c              | 239 ------------------------------------
 rust/helpers/README.md      |  17 +++
 rust/helpers/blk.c          |  16 +++
 rust/helpers/bug.c          |   9 ++
 rust/helpers/build_assert.c |  25 ++++
 rust/helpers/build_bug.c    |  10 ++
 rust/helpers/err.c          |  22 ++++
 rust/helpers/helpers.c      |  18 +++
 rust/helpers/kunit.c        |  10 ++
 rust/helpers/mutex.c        |  10 ++
 rust/helpers/page.c         |  24 ++++
 rust/helpers/refcount.c     |  22 ++++
 rust/helpers/signal.c       |  10 ++
 rust/helpers/slab.c         |  10 ++
 rust/helpers/spinlock.c     |  27 ++++
 rust/helpers/task.c         |  22 ++++
 rust/helpers/uaccess.c      |  17 +++
 rust/helpers/wait.c         |  10 ++
 rust/helpers/workqueue.c    |  16 +++
 20 files changed, 298 insertions(+), 242 deletions(-)
 delete mode 100644 rust/helpers.c
 create mode 100644 rust/helpers/README.md
 create mode 100644 rust/helpers/blk.c
 create mode 100644 rust/helpers/bug.c
 create mode 100644 rust/helpers/build_assert.c
 create mode 100644 rust/helpers/build_bug.c
 create mode 100644 rust/helpers/err.c
 create mode 100644 rust/helpers/helpers.c
 create mode 100644 rust/helpers/kunit.c
 create mode 100644 rust/helpers/mutex.c
 create mode 100644 rust/helpers/page.c
 create mode 100644 rust/helpers/refcount.c
 create mode 100644 rust/helpers/signal.c
 create mode 100644 rust/helpers/slab.c
 create mode 100644 rust/helpers/spinlock.c
 create mode 100644 rust/helpers/task.c
 create mode 100644 rust/helpers/uaccess.c
 create mode 100644 rust/helpers/wait.c
 create mode 100644 rust/helpers/workqueue.c

diff --git a/rust/Makefile b/rust/Makefile
index 1f10f92737f2..967da95ba8b0 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -8,8 +8,8 @@ always-$(CONFIG_RUST) +=3D exports_core_generated.h
=20
 # Missing prototypes are expected in the helpers since these are exported
 # for Rust only, thus there is no header nor prototypes.
-obj-$(CONFIG_RUST) +=3D helpers.o
-CFLAGS_REMOVE_helpers.o =3D -Wmissing-prototypes -Wmissing-declarations
+obj-$(CONFIG_RUST) +=3D helpers/helpers.o
+CFLAGS_REMOVE_helpers/helpers.o =3D -Wmissing-prototypes -Wmissing-declara=
tions
=20
 always-$(CONFIG_RUST) +=3D libmacros.so
 no-clean-files +=3D libmacros.so
@@ -299,7 +299,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: private =
bindgen_target_cflags =3D \
     -I$(objtree)/$(obj) -Wno-missing-prototypes -Wno-missing-declarations
 $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extr=
a =3D ; \
     sed -Ei 's/pub fn rust_helper_([a-zA-Z0-9_]*)/#[link_name=3D"rust_help=
er_\1"]\n    pub fn \1/g' $@
-$(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
+$(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FO=
RCE
 =09$(call if_changed_dep,bindgen)
=20
 quiet_cmd_exports =3D EXPORTS $@
diff --git a/rust/helpers.c b/rust/helpers.c
deleted file mode 100644
index 92d3c03ae1bd..000000000000
--- a/rust/helpers.c
+++ /dev/null
@@ -1,239 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Non-trivial C macros cannot be used in Rust. Similarly, inlined C funct=
ions
- * cannot be called either. This file explicitly creates functions ("helpe=
rs")
- * that wrap those so that they can be called from Rust.
- *
- * Even though Rust kernel modules should never use the bindings directly,=
 some
- * of these helpers need to be exported because Rust generics and inlined
- * functions may not get their code generated in the crate where they are
- * defined. Other helpers, called from non-inline functions, may not be
- * exported, in principle. However, in general, the Rust compiler does not
- * guarantee codegen will be performed for a non-inline function either.
- * Therefore, this file exports all the helpers. In the future, this may b=
e
- * revisited to reduce the number of exports after the compiler is informe=
d
- * about the places codegen is required.
- *
- * All symbols are exported as GPL-only to guarantee no GPL-only feature i=
s
- * accidentally exposed.
- *
- * Sorted alphabetically.
- */
-
-#include <kunit/test-bug.h>
-#include <linux/bug.h>
-#include <linux/build_bug.h>
-#include <linux/device.h>
-#include <linux/err.h>
-#include <linux/errname.h>
-#include <linux/gfp.h>
-#include <linux/highmem.h>
-#include <linux/mutex.h>
-#include <linux/refcount.h>
-#include <linux/sched/signal.h>
-#include <linux/slab.h>
-#include <linux/spinlock.h>
-#include <linux/wait.h>
-#include <linux/workqueue.h>
-
-__noreturn void rust_helper_BUG(void)
-{
-=09BUG();
-}
-EXPORT_SYMBOL_GPL(rust_helper_BUG);
-
-unsigned long rust_helper_copy_from_user(void *to, const void __user *from=
,
-=09=09=09=09=09 unsigned long n)
-{
-=09return copy_from_user(to, from, n);
-}
-EXPORT_SYMBOL_GPL(rust_helper_copy_from_user);
-
-unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
-=09=09=09=09       unsigned long n)
-{
-=09return copy_to_user(to, from, n);
-}
-EXPORT_SYMBOL_GPL(rust_helper_copy_to_user);
-
-void rust_helper_mutex_lock(struct mutex *lock)
-{
-=09mutex_lock(lock);
-}
-EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
-
-void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
-=09=09=09=09  struct lock_class_key *key)
-{
-#ifdef CONFIG_DEBUG_SPINLOCK
-=09__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
-#else
-=09spin_lock_init(lock);
-#endif
-}
-EXPORT_SYMBOL_GPL(rust_helper___spin_lock_init);
-
-void rust_helper_spin_lock(spinlock_t *lock)
-{
-=09spin_lock(lock);
-}
-EXPORT_SYMBOL_GPL(rust_helper_spin_lock);
-
-void rust_helper_spin_unlock(spinlock_t *lock)
-{
-=09spin_unlock(lock);
-}
-EXPORT_SYMBOL_GPL(rust_helper_spin_unlock);
-
-void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
-{
-=09init_wait(wq_entry);
-}
-EXPORT_SYMBOL_GPL(rust_helper_init_wait);
-
-int rust_helper_signal_pending(struct task_struct *t)
-{
-=09return signal_pending(t);
-}
-EXPORT_SYMBOL_GPL(rust_helper_signal_pending);
-
-struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
-{
-=09return alloc_pages(gfp_mask, order);
-}
-EXPORT_SYMBOL_GPL(rust_helper_alloc_pages);
-
-void *rust_helper_kmap_local_page(struct page *page)
-{
-=09return kmap_local_page(page);
-}
-EXPORT_SYMBOL_GPL(rust_helper_kmap_local_page);
-
-void rust_helper_kunmap_local(const void *addr)
-{
-=09kunmap_local(addr);
-}
-EXPORT_SYMBOL_GPL(rust_helper_kunmap_local);
-
-refcount_t rust_helper_REFCOUNT_INIT(int n)
-{
-=09return (refcount_t)REFCOUNT_INIT(n);
-}
-EXPORT_SYMBOL_GPL(rust_helper_REFCOUNT_INIT);
-
-void rust_helper_refcount_inc(refcount_t *r)
-{
-=09refcount_inc(r);
-}
-EXPORT_SYMBOL_GPL(rust_helper_refcount_inc);
-
-bool rust_helper_refcount_dec_and_test(refcount_t *r)
-{
-=09return refcount_dec_and_test(r);
-}
-EXPORT_SYMBOL_GPL(rust_helper_refcount_dec_and_test);
-
-__force void *rust_helper_ERR_PTR(long err)
-{
-=09return ERR_PTR(err);
-}
-EXPORT_SYMBOL_GPL(rust_helper_ERR_PTR);
-
-bool rust_helper_IS_ERR(__force const void *ptr)
-{
-=09return IS_ERR(ptr);
-}
-EXPORT_SYMBOL_GPL(rust_helper_IS_ERR);
-
-long rust_helper_PTR_ERR(__force const void *ptr)
-{
-=09return PTR_ERR(ptr);
-}
-EXPORT_SYMBOL_GPL(rust_helper_PTR_ERR);
-
-const char *rust_helper_errname(int err)
-{
-=09return errname(err);
-}
-EXPORT_SYMBOL_GPL(rust_helper_errname);
-
-struct task_struct *rust_helper_get_current(void)
-{
-=09return current;
-}
-EXPORT_SYMBOL_GPL(rust_helper_get_current);
-
-void rust_helper_get_task_struct(struct task_struct *t)
-{
-=09get_task_struct(t);
-}
-EXPORT_SYMBOL_GPL(rust_helper_get_task_struct);
-
-void rust_helper_put_task_struct(struct task_struct *t)
-{
-=09put_task_struct(t);
-}
-EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
-
-struct kunit *rust_helper_kunit_get_current_test(void)
-{
-=09return kunit_get_current_test();
-}
-EXPORT_SYMBOL_GPL(rust_helper_kunit_get_current_test);
-
-void rust_helper_init_work_with_key(struct work_struct *work, work_func_t =
func,
-=09=09=09=09    bool onstack, const char *name,
-=09=09=09=09    struct lock_class_key *key)
-{
-=09__init_work(work, onstack);
-=09work->data =3D (atomic_long_t)WORK_DATA_INIT();
-=09lockdep_init_map(&work->lockdep_map, name, key, 0);
-=09INIT_LIST_HEAD(&work->entry);
-=09work->func =3D func;
-}
-EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
-
-void * __must_check __realloc_size(2)
-rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
-{
-=09return krealloc(objp, new_size, flags);
-}
-EXPORT_SYMBOL_GPL(rust_helper_krealloc);
-
-/*
- * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
- * use it in contexts where Rust expects a `usize` like slice (array) indi=
ces.
- * `usize` is defined to be the same as C's `uintptr_t` type (can hold any
- * pointer) but not necessarily the same as `size_t` (can hold the size of=
 any
- * single object). Most modern platforms use the same concrete integer typ=
e for
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
-=09sizeof(size_t) =3D=3D sizeof(uintptr_t) &&
-=09__alignof__(size_t) =3D=3D __alignof__(uintptr_t),
-=09"Rust code expects C `size_t` to match Rust `usize`"
-);
-
-// This will soon be moved to a separate file, so no need to merge with ab=
ove.
-#include <linux/blk-mq.h>
-#include <linux/blkdev.h>
-
-void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
-{
-=09return blk_mq_rq_to_pdu(rq);
-}
-EXPORT_SYMBOL_GPL(rust_helper_blk_mq_rq_to_pdu);
-
-struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
-{
-=09return blk_mq_rq_from_pdu(pdu);
-}
-EXPORT_SYMBOL_GPL(rust_helper_blk_mq_rq_from_pdu);
diff --git a/rust/helpers/README.md b/rust/helpers/README.md
new file mode 100644
index 000000000000..940b24bb552d
--- /dev/null
+++ b/rust/helpers/README.md
@@ -0,0 +1,17 @@
+# Rust Helpers
+
+Non-trivial C macros cannot be used in Rust. Similarly, inlined C function=
s
+cannot be called either. The files in this directory explicitly create fun=
ctions
+("helpers") that wrap those so that they can be called from Rust.
+
+Even though Rust kernel modules should never use the bindings directly, so=
me of
+these helpers need to be exported because Rust generics and inlined functi=
ons
+may not get their code generated in the crate where they are defined. Othe=
r
+helpers, called from non-inline functions, may not be exported, in princip=
le.
+However, in general, the Rust compiler does not guarantee codegen will be
+performed for a non-inline function either. Therefore, this file exports a=
ll the
+helpers. In the future, this may be revisited to reduce the number of expo=
rts
+after the compiler is informed about the places codegen is required.
+
+All symbols are exported as GPL-only to guarantee no GPL-only feature is
+accidentally exposed.
diff --git a/rust/helpers/blk.c b/rust/helpers/blk.c
new file mode 100644
index 000000000000..d99c965eb59b
--- /dev/null
+++ b/rust/helpers/blk.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/blk-mq.h>
+#include <linux/blkdev.h>
+
+void *rust_helper_blk_mq_rq_to_pdu(struct request *rq)
+{
+=09return blk_mq_rq_to_pdu(rq);
+}
+EXPORT_SYMBOL_GPL(rust_helper_blk_mq_rq_to_pdu);
+
+struct request *rust_helper_blk_mq_rq_from_pdu(void *pdu)
+{
+=09return blk_mq_rq_from_pdu(pdu);
+}
+EXPORT_SYMBOL_GPL(rust_helper_blk_mq_rq_from_pdu);
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
+=09BUG();
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
+ * use it in contexts where Rust expects a `usize` like slice (array) indi=
ces.
+ * `usize` is defined to be the same as C's `uintptr_t` type (can hold any
+ * pointer) but not necessarily the same as `size_t` (can hold the size of=
 any
+ * single object). Most modern platforms use the same concrete integer typ=
e for
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
+=09sizeof(size_t) =3D=3D sizeof(uintptr_t) &&
+=09__alignof__(size_t) =3D=3D __alignof__(uintptr_t),
+=09"Rust code expects C `size_t` to match Rust `usize`"
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
+=09return errname(err);
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
+=09return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(rust_helper_ERR_PTR);
+
+bool rust_helper_IS_ERR(__force const void *ptr)
+{
+=09return IS_ERR(ptr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_IS_ERR);
+
+long rust_helper_PTR_ERR(__force const void *ptr)
+{
+=09return PTR_ERR(ptr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_PTR_ERR);
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
new file mode 100644
index 000000000000..74dd4275c233
--- /dev/null
+++ b/rust/helpers/helpers.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "blk.c"
+#include "bug.c"
+#include "build_assert.c"
+#include "build_bug.c"
+#include "err.c"
+#include "kunit.c"
+#include "mutex.c"
+#include "page.c"
+#include "refcount.c"
+#include "signal.c"
+#include "slab.c"
+#include "spinlock.c"
+#include "task.c"
+#include "uaccess.c"
+#include "wait.c"
+#include "workqueue.c"
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
+=09return kunit_get_current_test();
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
+=09mutex_lock(lock);
+}
+EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
diff --git a/rust/helpers/page.c b/rust/helpers/page.c
new file mode 100644
index 000000000000..b3280c80b283
--- /dev/null
+++ b/rust/helpers/page.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/gfp.h>
+#include <linux/highmem.h>
+
+struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
+{
+=09return alloc_pages(gfp_mask, order);
+}
+EXPORT_SYMBOL_GPL(rust_helper_alloc_pages);
+
+void *rust_helper_kmap_local_page(struct page *page)
+{
+=09return kmap_local_page(page);
+}
+EXPORT_SYMBOL_GPL(rust_helper_kmap_local_page);
+
+void rust_helper_kunmap_local(const void *addr)
+{
+=09kunmap_local(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_kunmap_local);
+
+
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
+=09return (refcount_t)REFCOUNT_INIT(n);
+}
+EXPORT_SYMBOL_GPL(rust_helper_REFCOUNT_INIT);
+
+void rust_helper_refcount_inc(refcount_t *r)
+{
+=09refcount_inc(r);
+}
+EXPORT_SYMBOL_GPL(rust_helper_refcount_inc);
+
+bool rust_helper_refcount_dec_and_test(refcount_t *r)
+{
+=09return refcount_dec_and_test(r);
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
+=09return signal_pending(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_signal_pending);
diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
new file mode 100644
index 000000000000..3e0a1a173d8a
--- /dev/null
+++ b/rust/helpers/slab.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/slab.h>
+
+void * __must_check __realloc_size(2)
+rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
+{
+=09return krealloc(objp, new_size, flags);
+}
+EXPORT_SYMBOL_GPL(rust_helper_krealloc);
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
+=09=09=09=09  struct lock_class_key *key)
+{
+#ifdef CONFIG_DEBUG_SPINLOCK
+=09__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
+#else
+=09spin_lock_init(lock);
+#endif
+}
+EXPORT_SYMBOL_GPL(rust_helper___spin_lock_init);
+
+void rust_helper_spin_lock(spinlock_t *lock)
+{
+=09spin_lock(lock);
+}
+EXPORT_SYMBOL_GPL(rust_helper_spin_lock);
+
+void rust_helper_spin_unlock(spinlock_t *lock)
+{
+=09spin_unlock(lock);
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
+=09return current;
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_current);
+
+void rust_helper_get_task_struct(struct task_struct *t)
+{
+=09get_task_struct(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_task_struct);
+
+void rust_helper_put_task_struct(struct task_struct *t)
+{
+=09put_task_struct(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
new file mode 100644
index 000000000000..3d004ac1c180
--- /dev/null
+++ b/rust/helpers/uaccess.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/uaccess.h>
+
+unsigned long rust_helper_copy_from_user(void *to, const void __user *from=
,
+=09=09=09=09=09 unsigned long n)
+{
+=09return copy_from_user(to, from, n);
+}
+EXPORT_SYMBOL_GPL(rust_helper_copy_from_user);
+
+unsigned long rust_helper_copy_to_user(void __user *to, const void *from,
+=09=09=09=09       unsigned long n)
+{
+=09return copy_to_user(to, from, n);
+}
+EXPORT_SYMBOL_GPL(rust_helper_copy_to_user);
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
+=09init_wait(wq_entry);
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
+void rust_helper_init_work_with_key(struct work_struct *work, work_func_t =
func,
+=09=09=09=09    bool onstack, const char *name,
+=09=09=09=09    struct lock_class_key *key)
+{
+=09__init_work(work, onstack);
+=09work->data =3D (atomic_long_t)WORK_DATA_INIT();
+=09lockdep_init_map(&work->lockdep_map, name, key, 0);
+=09INIT_LIST_HEAD(&work->entry);
+=09work->func =3D func;
+}
+EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);

base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
--=20
2.46.0




