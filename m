Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D45249016F
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Jan 2022 06:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbiAQFeX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Jan 2022 00:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbiAQFeS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jan 2022 00:34:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A94EC06173E;
        Sun, 16 Jan 2022 21:34:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE26960E07;
        Mon, 17 Jan 2022 05:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AC5C36AF2;
        Mon, 17 Jan 2022 05:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642397657;
        bh=1YNK3U/icTxDVC1n2Cln0G5YVW2SCJT2iCfDVDitxsg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BepNCJRfu+sdQ+d8ZATcsoz4sEcwT4gAJTsd+nG8TylcOmSqMPqAI9kuXEjYhBTOV
         5g09qyw51r0Wtp4U3Qxbh59IgOjrQnsCptkNZz4UAyWN+77v7Hygh87Sxp0n4IFnaT
         D0mH5ncWLxe0UQB/sx96gKpvMKH5fDD1vOD//TSX+QnrrTDByJIOgl/oSWWI4c+cqP
         ISI84BB9emFsvZVkROO0rkP5JzCUXUI9oBap5STpGWQ0g9vlSQcuSogInGivwA6dlv
         96JeJExRcgRxPyMV//tmFdovrS1UCF8uzkNKRddZaIbgLgsO7bylWN0NWwhay52nyD
         niFZfqLKQ2hDA==
From:   Miguel Ojeda <ojeda@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>,
        Maciej Falkowski <m.falkowski@samsung.com>
Subject: [PATCH v3 04/19] rust: add C helpers
Date:   Mon, 17 Jan 2022 06:33:34 +0100
Message-Id: <20220117053349.6804-5-ojeda@kernel.org>
In-Reply-To: <20220117053349.6804-1-ojeda@kernel.org>
References: <20220117053349.6804-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This source file contains forwarders to C macros and inlined
functions.

Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/helpers.c | 508 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 508 insertions(+)
 create mode 100644 rust/helpers.c

diff --git a/rust/helpers.c b/rust/helpers.c
new file mode 100644
index 000000000000..324ed4dc27d5
--- /dev/null
+++ b/rust/helpers.c
@@ -0,0 +1,508 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/bug.h>
+#include <linux/build_bug.h>
+#include <linux/clk.h>
+#include <linux/uaccess.h>
+#include <linux/sched/signal.h>
+#include <linux/gfp.h>
+#include <linux/highmem.h>
+#include <linux/uio.h>
+#include <linux/errname.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/security.h>
+#include <asm/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/amba/bus.h>
+#include <linux/of_device.h>
+
+__noreturn void rust_helper_BUG(void)
+{
+	BUG();
+}
+
+void rust_helper_clk_disable_unprepare(struct clk *clk)
+{
+	return clk_disable_unprepare(clk);
+}
+EXPORT_SYMBOL_GPL(rust_helper_clk_disable_unprepare);
+
+int rust_helper_clk_prepare_enable(struct clk *clk)
+{
+	return clk_prepare_enable(clk);
+}
+EXPORT_SYMBOL_GPL(rust_helper_clk_prepare_enable);
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
+void __iomem *rust_helper_ioremap(resource_size_t offset, unsigned long size)
+{
+	return ioremap(offset, size);
+}
+EXPORT_SYMBOL_GPL(rust_helper_ioremap);
+
+u8 rust_helper_readb(const volatile void __iomem *addr)
+{
+	return readb(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readb);
+
+u16 rust_helper_readw(const volatile void __iomem *addr)
+{
+	return readw(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readw);
+
+u32 rust_helper_readl(const volatile void __iomem *addr)
+{
+	return readl(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readl);
+
+#ifdef CONFIG_64BIT
+u64 rust_helper_readq(const volatile void __iomem *addr)
+{
+	return readq(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readq);
+#endif
+
+void rust_helper_writeb(u8 value, volatile void __iomem *addr)
+{
+	writeb(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writeb);
+
+void rust_helper_writew(u16 value, volatile void __iomem *addr)
+{
+	writew(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writew);
+
+void rust_helper_writel(u32 value, volatile void __iomem *addr)
+{
+	writel(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writel);
+
+#ifdef CONFIG_64BIT
+void rust_helper_writeq(u64 value, volatile void __iomem *addr)
+{
+	writeq(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writeq);
+#endif
+
+u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
+{
+	return readb_relaxed(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readb_relaxed);
+
+u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
+{
+	return readw_relaxed(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readw_relaxed);
+
+u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
+{
+	return readl_relaxed(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readl_relaxed);
+
+#ifdef CONFIG_64BIT
+u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
+{
+	return readq_relaxed(addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_readq_relaxed);
+#endif
+
+void rust_helper_writeb_relaxed(u8 value, volatile void __iomem *addr)
+{
+        writeb_relaxed(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writeb_relaxed);
+
+void rust_helper_writew_relaxed(u16 value, volatile void __iomem *addr)
+{
+        writew_relaxed(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writew_relaxed);
+
+void rust_helper_writel_relaxed(u32 value, volatile void __iomem *addr)
+{
+        writel_relaxed(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writel_relaxed);
+
+#ifdef CONFIG_64BIT
+void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
+{
+        writeq_relaxed(value, addr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_writeq_relaxed);
+#endif
+void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
+				  struct lock_class_key *key)
+{
+#ifdef CONFIG_DEBUG_SPINLOCK
+	__spin_lock_init(lock, name, key);
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
+
+unsigned long rust_helper_spin_lock_irqsave(spinlock_t *lock)
+{
+	unsigned long flags;
+	spin_lock_irqsave(lock, flags);
+	return flags;
+}
+EXPORT_SYMBOL_GPL(rust_helper_spin_lock_irqsave);
+
+void rust_helper_spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
+{
+	spin_unlock_irqrestore(lock, flags);
+}
+EXPORT_SYMBOL_GPL(rust_helper_spin_unlock_irqrestore);
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
+
+const char *rust_helper_errname(int err)
+{
+	return errname(err);
+}
+EXPORT_SYMBOL_GPL(rust_helper_errname);
+
+void rust_helper_mutex_lock(struct mutex *lock)
+{
+	mutex_lock(lock);
+}
+EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
+
+void rust_helper_amba_set_drvdata(struct amba_device *dev, void *data)
+{
+	amba_set_drvdata(dev, data);
+}
+EXPORT_SYMBOL_GPL(rust_helper_amba_set_drvdata);
+
+void *rust_helper_amba_get_drvdata(struct amba_device *dev)
+{
+	return amba_get_drvdata(dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_amba_get_drvdata);
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
+int rust_helper_security_binder_set_context_mgr(const struct cred *mgr)
+{
+	return security_binder_set_context_mgr(mgr);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_set_context_mgr);
+
+int rust_helper_security_binder_transaction(const struct cred *from,
+					    const struct cred *to)
+{
+	return security_binder_transaction(from, to);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_transaction);
+
+int rust_helper_security_binder_transfer_binder(const struct cred *from,
+						const struct cred *to)
+{
+	return security_binder_transfer_binder(from, to);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_transfer_binder);
+
+int rust_helper_security_binder_transfer_file(const struct cred *from,
+					      const struct cred *to,
+					      struct file *file)
+{
+	return security_binder_transfer_file(from, to, file);
+}
+EXPORT_SYMBOL_GPL(rust_helper_security_binder_transfer_file);
+
+void rust_helper_rcu_read_lock(void)
+{
+	rcu_read_lock();
+}
+EXPORT_SYMBOL_GPL(rust_helper_rcu_read_lock);
+
+void rust_helper_rcu_read_unlock(void)
+{
+	rcu_read_unlock();
+}
+EXPORT_SYMBOL_GPL(rust_helper_rcu_read_unlock);
+
+void rust_helper_synchronize_rcu(void)
+{
+	synchronize_rcu();
+}
+EXPORT_SYMBOL_GPL(rust_helper_synchronize_rcu);
+
+void *rust_helper_dev_get_drvdata(struct device *dev)
+{
+	return dev_get_drvdata(dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
+
+const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_dev_name);
+
+void rust_helper___seqcount_init(seqcount_t *s, const char *name,
+				 struct lock_class_key *key)
+{
+	__seqcount_init(s, name, key);
+}
+EXPORT_SYMBOL_GPL(rust_helper___seqcount_init);
+
+unsigned rust_helper_read_seqcount_begin(seqcount_t *s)
+{
+	return read_seqcount_begin(s);
+}
+EXPORT_SYMBOL_GPL(rust_helper_read_seqcount_begin);
+
+int rust_helper_read_seqcount_retry(seqcount_t *s, unsigned start)
+{
+	return read_seqcount_retry(s, start);
+}
+EXPORT_SYMBOL_GPL(rust_helper_read_seqcount_retry);
+
+void rust_helper_write_seqcount_begin(seqcount_t *s)
+{
+	do_write_seqcount_begin(s);
+}
+EXPORT_SYMBOL_GPL(rust_helper_write_seqcount_begin);
+
+void rust_helper_write_seqcount_end(seqcount_t *s)
+{
+	do_write_seqcount_end(s);
+}
+EXPORT_SYMBOL_GPL(rust_helper_write_seqcount_end);
+
+void rust_helper_irq_set_handler_locked(struct irq_data *data,
+					irq_flow_handler_t handler)
+{
+	irq_set_handler_locked(data, handler);
+}
+EXPORT_SYMBOL_GPL(rust_helper_irq_set_handler_locked);
+
+void *rust_helper_irq_data_get_irq_chip_data(struct irq_data *d)
+{
+	return irq_data_get_irq_chip_data(d);
+}
+EXPORT_SYMBOL_GPL(rust_helper_irq_data_get_irq_chip_data);
+
+struct irq_chip *rust_helper_irq_desc_get_chip(struct irq_desc *desc)
+{
+	return irq_desc_get_chip(desc);
+}
+EXPORT_SYMBOL_GPL(rust_helper_irq_desc_get_chip);
+
+void *rust_helper_irq_desc_get_handler_data(struct irq_desc *desc)
+{
+	return irq_desc_get_handler_data(desc);
+}
+EXPORT_SYMBOL_GPL(rust_helper_irq_desc_get_handler_data);
+
+void rust_helper_chained_irq_enter(struct irq_chip *chip,
+				   struct irq_desc *desc)
+{
+	chained_irq_enter(chip, desc);
+}
+EXPORT_SYMBOL_GPL(rust_helper_chained_irq_enter);
+
+void rust_helper_chained_irq_exit(struct irq_chip *chip,
+				   struct irq_desc *desc)
+{
+	chained_irq_exit(chip, desc);
+}
+EXPORT_SYMBOL_GPL(rust_helper_chained_irq_exit);
+
+const struct cred *rust_helper_get_cred(const struct cred *cred)
+{
+	return get_cred(cred);
+}
+EXPORT_SYMBOL_GPL(rust_helper_get_cred);
+
+void rust_helper_put_cred(const struct cred *cred) {
+	put_cred(cred);
+}
+EXPORT_SYMBOL_GPL(rust_helper_put_cred);
+
+const struct of_device_id *rust_helper_of_match_device(
+		const struct of_device_id *matches, const struct device *dev)
+{
+	return of_match_device(matches, dev);
+}
+EXPORT_SYMBOL_GPL(rust_helper_of_match_device);
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
2.34.1

