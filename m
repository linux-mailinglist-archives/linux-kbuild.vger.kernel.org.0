Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12482FE471
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 08:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbhAUH4Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 02:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbhAUHzt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 02:55:49 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45E2C061757;
        Wed, 20 Jan 2021 23:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=gbaHlbn72p0Nalk61HD6pekBXGvUAG7W8zs4TF0KE2o=; b=jiZJQzTm8Ce71EgMfidscH1ePD
        ehUUxCHo/Qc7j8bEAmNWg4n2JGtmg8Dgkj99z3TQd792yUWpvsNEAmUd7uyzy77YaC1bIEFOKVOC3
        fYIGn2SstpDdAoqaqkQdSAXU53DwFQWSwRe7LQJgJdp4ER3bRYhcubRSV8nElHjlxLltO/KbcjReH
        NcIXnLQpQETYU8RNrSaDFwnaQkBzPTKIfIp03r4m6TFMM/U4nYhIK8SJlsaLbfzNGuKJxNhzB1Gop
        a9Nxz0lPcBT0yISxIk1L/51SPdHFyA9EAzYFqzOnabUiYjyF8uHQmYhAwh9PeKjrwIAJbmrktxl7a
        JB1NHZYg==;
Received: from [2001:4bb8:188:1954:d5b3:2657:287:e45f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l2UnT-00Gm8J-Sz; Thu, 21 Jan 2021 07:54:34 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Frederic Barrat <fbarrat@linux.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Joe Lawrence <joe.lawrence@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 06/13] kallsyms: only build {,module_}kallsyms_on_each_symbol when required
Date:   Thu, 21 Jan 2021 08:49:52 +0100
Message-Id: <20210121074959.313333-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121074959.313333-1-hch@lst.de>
References: <20210121074959.313333-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

kallsyms_on_each_symbol and module_kallsyms_on_each_symbol are only used
by the livepatching code, so don't build them if livepatching is not
enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/kallsyms.h | 17 ++++-------------
 include/linux/module.h   | 16 ++++------------
 kernel/kallsyms.c        |  2 ++
 kernel/module.c          |  2 ++
 4 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 481273f0c72d42..465060acc9816f 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -71,15 +71,14 @@ static inline void *dereference_symbol_descriptor(void *ptr)
 	return ptr;
 }
 
-#ifdef CONFIG_KALLSYMS
-/* Lookup the address for a symbol. Returns 0 if not found. */
-unsigned long kallsyms_lookup_name(const char *name);
-
-/* Call a function on each kallsyms symbol in the core kernel */
 int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
 				      unsigned long),
 			    void *data);
 
+#ifdef CONFIG_KALLSYMS
+/* Lookup the address for a symbol. Returns 0 if not found. */
+unsigned long kallsyms_lookup_name(const char *name);
+
 extern int kallsyms_lookup_size_offset(unsigned long addr,
 				  unsigned long *symbolsize,
 				  unsigned long *offset);
@@ -108,14 +107,6 @@ static inline unsigned long kallsyms_lookup_name(const char *name)
 	return 0;
 }
 
-static inline int kallsyms_on_each_symbol(int (*fn)(void *, const char *,
-						    struct module *,
-						    unsigned long),
-					  void *data)
-{
-	return 0;
-}
-
 static inline int kallsyms_lookup_size_offset(unsigned long addr,
 					      unsigned long *symbolsize,
 					      unsigned long *offset)
diff --git a/include/linux/module.h b/include/linux/module.h
index 8588482bde4116..695f127745af10 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -610,10 +610,6 @@ int module_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 /* Look for this name: can be of form module:name. */
 unsigned long module_kallsyms_lookup_name(const char *name);
 
-int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
-					     struct module *, unsigned long),
-				   void *data);
-
 extern void __noreturn __module_put_and_exit(struct module *mod,
 			long code);
 #define module_put_and_exit(code) __module_put_and_exit(THIS_MODULE, code)
@@ -797,14 +793,6 @@ static inline unsigned long module_kallsyms_lookup_name(const char *name)
 	return 0;
 }
 
-static inline int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
-							   struct module *,
-							   unsigned long),
-						 void *data)
-{
-	return 0;
-}
-
 static inline int register_module_notifier(struct notifier_block *nb)
 {
 	/* no events will happen anyway, so this can always succeed */
@@ -893,4 +881,8 @@ static inline bool module_sig_ok(struct module *module)
 }
 #endif	/* CONFIG_MODULE_SIG */
 
+int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
+					     struct module *, unsigned long),
+				   void *data);
+
 #endif /* _LINUX_MODULE_H */
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index a0d3f0865916f9..8043a90aa50ed3 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -177,6 +177,7 @@ unsigned long kallsyms_lookup_name(const char *name)
 	return module_kallsyms_lookup_name(name);
 }
 
+#ifdef CONFIG_LIVEPATCH
 /*
  * Iterate over all symbols in vmlinux.  For symbols from modules use
  * module_kallsyms_on_each_symbol instead.
@@ -198,6 +199,7 @@ int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
 	}
 	return 0;
 }
+#endif /* CONFIG_LIVEPATCH */
 
 static unsigned long get_symbol_pos(unsigned long addr,
 				    unsigned long *symbolsize,
diff --git a/kernel/module.c b/kernel/module.c
index 885feec64c1b6f..e141e5d1d7beaf 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -4399,6 +4399,7 @@ unsigned long module_kallsyms_lookup_name(const char *name)
 	return ret;
 }
 
+#ifdef CONFIG_LIVEPATCH
 int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 					     struct module *, unsigned long),
 				   void *data)
@@ -4429,6 +4430,7 @@ int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
 	mutex_unlock(&module_mutex);
 	return ret;
 }
+#endif /* CONFIG_LIVEPATCH */
 #endif /* CONFIG_KALLSYMS */
 
 /* Maximum number of characters written by module_flags() */
-- 
2.29.2

