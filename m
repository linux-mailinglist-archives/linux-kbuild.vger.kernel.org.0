Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624702FF594
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 21:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbhAUUMb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 15:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbhAUHz0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 02:55:26 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE02FC0613D3;
        Wed, 20 Jan 2021 23:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=L0Uh0qVEBo6n0g5APvI6DfD4SW2QxvLnqk+s+Gff7a0=; b=Ab+aqkWpwBQnUwFNKEMqw/Exd3
        gd7xLavCQ9Oep5CowaIGdPECAfOxci1DQDovn7CkycV9YZHapTzxeVw/ctvlPfaclIuvE+EnE/DHE
        KdjPFgboTJ8l6h31GYYklhaD7rGHTARiw/H3o0XwyTuJ27+j7GGT5nOR/hnw6j+U6fm1D9ZByuAmx
        gEAdg16tSJ2dmYkaugawsj+zkrcLfupogmIicC43DWj6wSfDwIL1pqWC/ViS6teRcKsk1Ia6izn3B
        yG4gETOoPr8KRLBdfhaRuCgHR9Fdmyr68fzFBr07Gw23lRybGRcuETo5S7BRnvWb/EWh6C6qh21W9
        NlE2w9jA==;
Received: from [2001:4bb8:188:1954:d5b3:2657:287:e45f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l2Umk-00Gm6s-8y; Thu, 21 Jan 2021 07:53:45 +0000
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
Subject: [PATCH 04/13] livepatch: move klp_find_object_module to module.c
Date:   Thu, 21 Jan 2021 08:49:50 +0100
Message-Id: <20210121074959.313333-5-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121074959.313333-1-hch@lst.de>
References: <20210121074959.313333-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

To uncouple the livepatch code from module loader internals move a
slightly refactored version of klp_find_object_module to module.c
This allows to mark find_module static and removes one of the last
users of module_mutex outside of module.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/module.h  |  3 +--
 kernel/livepatch/core.c | 39 +++++++++++++--------------------------
 kernel/module.c         | 17 ++++++++++++++++-
 3 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index b4654f8a408134..8588482bde4116 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -586,8 +586,7 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
 	return within_module_init(addr, mod) || within_module_core(addr, mod);
 }
 
-/* Search for module by name: must hold module_mutex. */
-struct module *find_module(const char *name);
+struct module *find_klp_module(const char *name);
 
 /* Check if a module is loaded. */
 bool module_loaded(const char *name);
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index a7f625dc24add3..878759baadd81c 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -49,30 +49,6 @@ static bool klp_is_module(struct klp_object *obj)
 	return obj->name;
 }
 
-/* sets obj->mod if object is not vmlinux and module is found */
-static void klp_find_object_module(struct klp_object *obj)
-{
-	struct module *mod;
-
-	mutex_lock(&module_mutex);
-	/*
-	 * We do not want to block removal of patched modules and therefore
-	 * we do not take a reference here. The patches are removed by
-	 * klp_module_going() instead.
-	 */
-	mod = find_module(obj->name);
-	/*
-	 * Do not mess work of klp_module_coming() and klp_module_going().
-	 * Note that the patch might still be needed before klp_module_going()
-	 * is called. Module functions can be called even in the GOING state
-	 * until mod->exit() finishes. This is especially important for
-	 * patches that modify semantic of the functions.
-	 */
-	if (mod && mod->klp_alive)
-		obj->mod = mod;
-	mutex_unlock(&module_mutex);
-}
-
 static bool klp_initialized(void)
 {
 	return !!klp_root_kobj;
@@ -820,14 +796,25 @@ static int klp_init_object(struct klp_patch *patch, struct klp_object *obj)
 	const char *name;
 
 	obj->patched = false;
-	obj->mod = NULL;
 
 	if (klp_is_module(obj)) {
 		if (strlen(obj->name) >= MODULE_NAME_LEN)
 			return -EINVAL;
 		name = obj->name;
 
-		klp_find_object_module(obj);
+		/*
+		 * We do not want to block removal of patched modules and
+		 * therefore we do not take a reference here. The patches are
+		 * removed by klp_module_going() instead.
+		 * 
+		 * Do not mess work of klp_module_coming() and
+		 * klp_module_going().  Note that the patch might still be
+		 * needed before klp_module_going() is called.  Module functions
+		 * can be called even in the GOING state until mod->exit()
+		 * finishes.  This is especially important for patches that
+		 * modify semantic of the functions.
+		 */
+		obj->mod = find_klp_module(obj->name);
 	} else {
 		name = "vmlinux";
 	}
diff --git a/kernel/module.c b/kernel/module.c
index 619ea682e64cd1..299cbac0775cf2 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -666,7 +666,7 @@ static struct module *find_module_all(const char *name, size_t len,
 	return NULL;
 }
 
-struct module *find_module(const char *name)
+static struct module *find_module(const char *name)
 {
 	module_assert_mutex();
 	return find_module_all(name, strlen(name), false);
@@ -684,6 +684,21 @@ bool module_loaded(const char *name)
 }
 EXPORT_SYMBOL_GPL(module_loaded);
 
+#ifdef CONFIG_LIVEPATCH
+struct module *find_klp_module(const char *name)
+{
+	struct module *mod;
+
+	mutex_lock(&module_mutex);
+	mod = find_module(name);
+	if (mod && !mod->klp_alive)
+		mod = NULL;
+	mutex_unlock(&module_mutex);
+
+	return mod;
+}
+#endif /* CONFIG_LIVEPATCH */
+
 #ifdef CONFIG_SMP
 
 static inline void __percpu *mod_percpu(struct module *mod)
-- 
2.29.2

