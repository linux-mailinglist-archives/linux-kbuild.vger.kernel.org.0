Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 776FEFE8B3
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2019 00:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfKOXhX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 18:37:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:46150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727056AbfKOXhX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 18:37:23 -0500
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 970F1206D6;
        Fri, 15 Nov 2019 23:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573861042;
        bh=nZ5LwAmuivjeEeQ0Qwg3zn4lr8m5vqYFU8cFuVW68bw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Q5mYqQGA/WWQPLXEaBY6XBR3PIIjoPejYHWAts4FJgf4hNOFboBXBGxprl4GVctGb
         Pc6i4J34v/tPqxR93bAbJxg7kVCxpULw7b6E1DAqaWnzSjV7b7eXEsZ7BT4+a0gljg
         qDcPy4gUrOuS9IS0dWWl9Og9jzSk4GuVrahAsObg=
Date:   Fri, 15 Nov 2019 15:37:21 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Joerg Roedel <jroedel@suse.de>,
        Shile Zhang <shile.zhang@linux.alibaba.com>,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hpa@zytor.com
Subject: Re: [PATCH] mm/vmalloc: Fix regression caused by needless
 vmalloc_sync_all()
Message-Id: <20191115153721.c869afe6e7564877b848c69d@linux-foundation.org>
In-Reply-To: <20191115083847.GB18929@zn.tnic>
References: <20191113095530.228959-1-shile.zhang@linux.alibaba.com>
        <20191114171231.GA21753@suse.de>
        <20191114160108.57a72907f7b1aa9860471a06@linux-foundation.org>
        <20191115083847.GB18929@zn.tnic>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 15 Nov 2019 09:38:47 +0100 Borislav Petkov <bp@alien8.de> wrote:

> On Thu, Nov 14, 2019 at 04:01:08PM -0800, Andrew Morton wrote:
> > It's fairly urgent - I consider this to be -stable material.
> > 
> > Thomas & co, was that a deliberate skip?
> 
> More like lost in the mail flood. I'm assuming you're taking it?
> 
> In any case, patch looks ok to me - the "unmappings" naming sounds like
> coming from someone with a very wild phantasy... :-)
> 

OK, thanks, here's what I queued.  Reviews, acks and testing, please??

From: Joerg Roedel <jroedel@suse.de>
Subject: x86/mm: Split vmalloc_sync_all()

Commit 3f8fd02b1bf1 ("mm/vmalloc: Sync unmappings in
__purge_vmap_area_lazy()") introduced a call to vmalloc_sync_all() in the
vunmap() code-path.  While this change was necessary to maintain
correctness on x86-32-pae kernels, it also adds additional cycles for
architectures that don't need it.

Specifically on x86-64 with CONFIG_VMAP_STACK=y some people reported
severe performance regressions in micro-benchmarks because it now also
calls the x86-64 implementation of vmalloc_sync_all() on vunmap().  But
the vmalloc_sync_all() implementation on x86-64 is only needed for newly
created mappings.

To avoid the unnecessary work on x86-64 and to gain the performance back,
split up vmalloc_sync_all() into two functions:

	* vmalloc_sync_mappings(), and
	* vmalloc_sync_unmappings()

Most call-sites to vmalloc_sync_all() only care about new mappings being
synchronized.  The only exception is the new call-site added in the above
mentioned commit.

Shile Zhang directed us to a report of an 80% regression in reaim
throughput.

Link: http://lkml.kernel.org/r/20191009124418.8286-1-joro@8bytes.org
Link: https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/4D3JPPHBNOSPFK2KEPC6KGKS6J25AIDB/
Link: http://lkml.kernel.org/r/20191113095530.228959-1-shile.zhang@linux.alibaba.com
Fixes: 3f8fd02b1bf1 ("mm/vmalloc: Sync unmappings in __purge_vmap_area_lazy()")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Reported-by: kernel test robot <oliver.sang@intel.com>
Reported-by: Shile Zhang <shile.zhang@linux.alibaba.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>	[GHES]
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/x86/mm/fault.c      |   26 ++++++++++++++++++++++++--
 drivers/acpi/apei/ghes.c |    2 +-
 include/linux/vmalloc.h  |    5 +++--
 kernel/notifier.c        |    2 +-
 mm/nommu.c               |   10 +++++++---
 mm/vmalloc.c             |   11 +++++++----
 6 files changed, 43 insertions(+), 13 deletions(-)

--- a/arch/x86/mm/fault.c~x86-mm-split-vmalloc_sync_all
+++ a/arch/x86/mm/fault.c
@@ -189,7 +189,7 @@ static inline pmd_t *vmalloc_sync_one(pg
 	return pmd_k;
 }
 
-void vmalloc_sync_all(void)
+static void vmalloc_sync(void)
 {
 	unsigned long address;
 
@@ -216,6 +216,16 @@ void vmalloc_sync_all(void)
 	}
 }
 
+void vmalloc_sync_mappings(void)
+{
+	vmalloc_sync();
+}
+
+void vmalloc_sync_unmappings(void)
+{
+	vmalloc_sync();
+}
+
 /*
  * 32-bit:
  *
@@ -318,11 +328,23 @@ out:
 
 #else /* CONFIG_X86_64: */
 
-void vmalloc_sync_all(void)
+void vmalloc_sync_mappings(void)
 {
+	/*
+	 * 64-bit mappings might allocate new p4d/pud pages
+	 * that need to be propagated to all tasks' PGDs.
+	 */
 	sync_global_pgds(VMALLOC_START & PGDIR_MASK, VMALLOC_END);
 }
 
+void vmalloc_sync_unmappings(void)
+{
+	/*
+	 * Unmappings never allocate or free p4d/pud pages.
+	 * No work is required here.
+	 */
+}
+
 /*
  * 64-bit:
  *
--- a/drivers/acpi/apei/ghes.c~x86-mm-split-vmalloc_sync_all
+++ a/drivers/acpi/apei/ghes.c
@@ -171,7 +171,7 @@ int ghes_estatus_pool_init(int num_ghes)
 	 * New allocation must be visible in all pgd before it can be found by
 	 * an NMI allocating from the pool.
 	 */
-	vmalloc_sync_all();
+	vmalloc_sync_mappings();
 
 	rc = gen_pool_add(ghes_estatus_pool, addr, PAGE_ALIGN(len), -1);
 	if (rc)
--- a/include/linux/vmalloc.h~x86-mm-split-vmalloc_sync_all
+++ a/include/linux/vmalloc.h
@@ -126,8 +126,9 @@ extern int remap_vmalloc_range_partial(s
 
 extern int remap_vmalloc_range(struct vm_area_struct *vma, void *addr,
 							unsigned long pgoff);
-void vmalloc_sync_all(void);
- 
+void vmalloc_sync_mappings(void);
+void vmalloc_sync_unmappings(void);
+
 /*
  *	Lowlevel-APIs (not for driver use!)
  */
--- a/kernel/notifier.c~x86-mm-split-vmalloc_sync_all
+++ a/kernel/notifier.c
@@ -554,7 +554,7 @@ NOKPROBE_SYMBOL(notify_die);
 
 int register_die_notifier(struct notifier_block *nb)
 {
-	vmalloc_sync_all();
+	vmalloc_sync_mappings();
 	return atomic_notifier_chain_register(&die_chain, nb);
 }
 EXPORT_SYMBOL_GPL(register_die_notifier);
--- a/mm/nommu.c~x86-mm-split-vmalloc_sync_all
+++ a/mm/nommu.c
@@ -359,10 +359,14 @@ void vm_unmap_aliases(void)
 EXPORT_SYMBOL_GPL(vm_unmap_aliases);
 
 /*
- * Implement a stub for vmalloc_sync_all() if the architecture chose not to
- * have one.
+ * Implement a stub for vmalloc_sync_[un]mapping() if the architecture
+ * chose not to have one.
  */
-void __weak vmalloc_sync_all(void)
+void __weak vmalloc_sync_mappings(void)
+{
+}
+
+void __weak vmalloc_sync_unmappings(void)
 {
 }
 
--- a/mm/vmalloc.c~x86-mm-split-vmalloc_sync_all
+++ a/mm/vmalloc.c
@@ -1259,7 +1259,7 @@ static bool __purge_vmap_area_lazy(unsig
 	 * First make sure the mappings are removed from all page-tables
 	 * before they are freed.
 	 */
-	vmalloc_sync_all();
+	vmalloc_sync_unmappings();
 
 	/*
 	 * TODO: to calculate a flush range without looping.
@@ -3050,16 +3050,19 @@ int remap_vmalloc_range(struct vm_area_s
 EXPORT_SYMBOL(remap_vmalloc_range);
 
 /*
- * Implement a stub for vmalloc_sync_all() if the architecture chose not to
- * have one.
+ * Implement stubs for vmalloc_sync_[un]mappings () if the architecture chose
+ * not to have one.
  *
  * The purpose of this function is to make sure the vmalloc area
  * mappings are identical in all page-tables in the system.
  */
-void __weak vmalloc_sync_all(void)
+void __weak vmalloc_sync_mappings(void)
 {
 }
 
+void __weak vmalloc_sync_unmappings(void)
+{
+}
 
 static int f(pte_t *pte, unsigned long addr, void *data)
 {
_

