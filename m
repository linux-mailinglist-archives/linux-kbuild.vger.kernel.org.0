Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB253BAEE1
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhGDUbb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:31:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230000AbhGDUba (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:31:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C72306115C;
        Sun,  4 Jul 2021 20:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430534;
        bh=KZ2/g9t2YFofiHUUTARbQC2rknRlRYTuBulzw9sklTQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GB4WTpLbb4EZyykJdjez2hrkJYR1j/rw4BpiGuD83wWe3mVSnBSA2bMSxd0+4BgYV
         8ueHjV+sfkUU8pYKRV6lYFYYxY73L/+xvYzejkSVtTzu9ni/DJ5vWU6Dwr9F4pSGSS
         FRKaPPueR4XRQGSJNKRAq+01sU99VTAlNpsBvopL1TUNThqpGEH/dACiHGgHKu3BAp
         Pks0dml1tdZ4szpvV+46oHdyCMu0ZrwHrWdL4IFndX0IB1rl03zsUYve7MbnJhfYZt
         Lyfuo7sXT02/gNEVeqn4oL4DZAdjoOSCo4VCtKywyk7yLXTwy4MGVwgbcyhhLR3SBa
         zDEv6IaLyG++A==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Fox Chen <foxhlchen@gmail.com>,
        Ayaan Zaidi <zaidi.ayaan@gmail.com>,
        Douglas Su <d0u9.su@outlook.com>, Yuki Okushi <jtitor@2k36.org>
Subject: [PATCH 05/17] rust: add C helpers
Date:   Sun,  4 Jul 2021 22:27:44 +0200
Message-Id: <20210704202756.29107-6-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-1-ojeda@kernel.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

This source file contains forwarders to C macros and inlined
functions.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
Co-developed-by: Finn Behrens <me@kloenk.de>
Signed-off-by: Finn Behrens <me@kloenk.de>
Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
Co-developed-by: Fox Chen <foxhlchen@gmail.com>
Signed-off-by: Fox Chen <foxhlchen@gmail.com>
Co-developed-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Signed-off-by: Ayaan Zaidi <zaidi.ayaan@gmail.com>
Co-developed-by: Douglas Su <d0u9.su@outlook.com>
Signed-off-by: Douglas Su <d0u9.su@outlook.com>
Co-developed-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Yuki Okushi <jtitor@2k36.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/helpers.c | 235 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)
 create mode 100644 rust/helpers.c

diff --git a/rust/helpers.c b/rust/helpers.c
new file mode 100644
index 00000000000..a6e98abb13e
--- /dev/null
+++ b/rust/helpers.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bug.h>
+#include <linux/build_bug.h>
+#include <linux/uaccess.h>
+#include <linux/sched/signal.h>
+#include <linux/gfp.h>
+#include <linux/highmem.h>
+#include <linux/uio.h>
+#include <linux/errname.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/security.h>
+
+void rust_helper_BUG(void)
+{
+	BUG();
+}
+
+unsigned long rust_helper_copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	return copy_from_user(to, from, n);
+}
+
+unsigned long rust_helper_copy_to_user(void __user *to, const void *from, unsigned long n)
+{
+	return copy_to_user(to, from, n);
+}
+
+unsigned long rust_helper_clear_user(void __user *to, unsigned long n)
+{
+	return clear_user(to, n);
+}
+
+void rust_helper_spin_lock_init(spinlock_t *lock, const char *name,
+				struct lock_class_key *key)
+{
+#ifdef CONFIG_DEBUG_SPINLOCK
+	__spin_lock_init(lock, name, key);
+#else
+	spin_lock_init(lock);
+#endif
+}
+EXPORT_SYMBOL_GPL(rust_helper_spin_lock_init);
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
+
+void rust_helper_init_wait(struct wait_queue_entry *wq_entry)
+{
+	init_wait(wq_entry);
+}
+EXPORT_SYMBOL_GPL(rust_helper_init_wait);
+
+int rust_helper_signal_pending(struct task_struct *t)
+{
+	return signal_pending(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_signal_pending);
+
+struct page *rust_helper_alloc_pages(gfp_t gfp_mask, unsigned int order)
+{
+	return alloc_pages(gfp_mask, order);
+}
+EXPORT_SYMBOL_GPL(rust_helper_alloc_pages);
+
+void *rust_helper_kmap(struct page *page)
+{
+	return kmap(page);
+}
+EXPORT_SYMBOL_GPL(rust_helper_kmap);
+
+void rust_helper_kunmap(struct page *page)
+{
+	return kunmap(page);
+}
+EXPORT_SYMBOL_GPL(rust_helper_kunmap);
+
+int rust_helper_cond_resched(void)
+{
+	return cond_resched();
+}
+EXPORT_SYMBOL_GPL(rust_helper_cond_resched);
+
+size_t rust_helper_copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
+{
+	return copy_from_iter(addr, bytes, i);
+}
+EXPORT_SYMBOL_GPL(rust_helper_copy_from_iter);
+
+size_t rust_helper_copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
+{
+	return copy_to_iter(addr, bytes, i);
+}
+EXPORT_SYMBOL_GPL(rust_helper_copy_to_iter);
+
+bool rust_helper_is_err(__force const void *ptr)
+{
+	return IS_ERR(ptr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_is_err);
+
+long rust_helper_ptr_err(__force const void *ptr)
+{
+	return PTR_ERR(ptr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_ptr_err);
+
+const char *rust_helper_errname(int err)
+{
+	return errname(err);
+}
+
+void rust_helper_mutex_lock(struct mutex *lock)
+{
+	mutex_lock(lock);
+}
+EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
+
+void *
+rust_helper_platform_get_drvdata(const struct platform_device *pdev)
+{
+	return platform_get_drvdata(pdev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_platform_get_drvdata);
+
+void
+rust_helper_platform_set_drvdata(struct platform_device *pdev,
+				 void *data)
+{
+	return platform_set_drvdata(pdev, data);
+}
+EXPORT_SYMBOL_GPL(rust_helper_platform_set_drvdata);
+
+refcount_t rust_helper_refcount_new(void)
+{
+	return (refcount_t)REFCOUNT_INIT(1);
+}
+EXPORT_SYMBOL_GPL(rust_helper_refcount_new);
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
+
+void rust_helper_rb_link_node(struct rb_node *node, struct rb_node *parent,
+			      struct rb_node **rb_link)
+{
+	rb_link_node(node, parent, rb_link);
+}
+EXPORT_SYMBOL_GPL(rust_helper_rb_link_node);
+
+struct task_struct *rust_helper_get_current(void)
+{
+	return current;
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_current);
+
+void rust_helper_get_task_struct(struct task_struct * t)
+{
+	get_task_struct(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_task_struct);
+
+void rust_helper_put_task_struct(struct task_struct * t)
+{
+	put_task_struct(t);
+}
+EXPORT_SYMBOL_GPL(rust_helper_put_task_struct);
+
+int rust_helper_security_binder_set_context_mgr(struct task_struct *mgr)
+{
+	return security_binder_set_context_mgr(mgr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_set_context_mgr);
+
+int rust_helper_security_binder_transaction(struct task_struct *from,
+					    struct task_struct *to)
+{
+	return security_binder_transaction(from, to);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_transaction);
+
+int rust_helper_security_binder_transfer_binder(struct task_struct *from,
+						struct task_struct *to)
+{
+	return security_binder_transfer_binder(from, to);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_transfer_binder);
+
+int rust_helper_security_binder_transfer_file(struct task_struct *from,
+					      struct task_struct *to,
+					      struct file *file)
+{
+	return security_binder_transfer_file(from, to, file);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_transfer_file);
+
+/* We use bindgen's --size_t-is-usize option to bind the C size_t type
+ * as the Rust usize type, so we can use it in contexts where Rust
+ * expects a usize like slice (array) indices. usize is defined to be
+ * the same as C's uintptr_t type (can hold any pointer) but not
+ * necessarily the same as size_t (can hold the size of any single
+ * object). Most modern platforms use the same concrete integer type for
+ * both of them, but in case we find ourselves on a platform where
+ * that's not true, fail early instead of risking ABI or
+ * integer-overflow issues.
+ *
+ * If your platform fails this assertion, it means that you are in
+ * danger of integer-overflow bugs (even if you attempt to remove
+ * --size_t-is-usize). It may be easiest to change the kernel ABI on
+ * your platform such that size_t matches uintptr_t (i.e., to increase
+ * size_t, because uintptr_t has to be at least as big as size_t).
+*/
+static_assert(
+	sizeof(size_t) == sizeof(uintptr_t) &&
+	__alignof__(size_t) == __alignof__(uintptr_t),
+	"Rust code expects C size_t to match Rust usize"
+);
-- 
2.32.0

