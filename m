Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72D82FE477
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 08:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbhAUH5J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 02:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbhAUH4v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 02:56:51 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C28C061575;
        Wed, 20 Jan 2021 23:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=vzLkuMf82/aWxii/Oync9Hqdb/cDk0SHw40dy3Repg0=; b=VJgiX3rOi2+FvYX5K5bZdmJKbV
        KmbjKxv/yhVynbQ7YxZjphpBXnAb9lcS8Rm2DWl0XO5d7lbUNmsSJ4iiecBH1ptIEV1DzaF/tDYcX
        40Fc3Q93GDV/NSPdipbTiWzTuYSjJ3S/ljICeomlVqQNnENFw4OSbarDQcAaUnUOZvoeKuvR3Ocqi
        g1RH5DmKsuETnSyhbKuOPUkYKh0aTiYF4rSpIymKGKNuJcvkQo0JEt1kMD9RHcHM1bUNJso5wzyQT
        oTCpvteHfm8HTp1ikJRrPxgT/MA3ey7JlWDMT+gUyKMJG7F0kp2M7rT18zJPkmynaYm5STnNt7R6V
        V/mRJgbw==;
Received: from [2001:4bb8:188:1954:d5b3:2657:287:e45f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l2UoB-00GmEr-Go; Thu, 21 Jan 2021 07:55:13 +0000
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
Subject: [PATCH 09/13] module: remove each_symbol_in_section
Date:   Thu, 21 Jan 2021 08:49:55 +0100
Message-Id: <20210121074959.313333-10-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121074959.313333-1-hch@lst.de>
References: <20210121074959.313333-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

each_symbol_in_section just contains a trivial loop over its arguments.
Just open code the loop in the two callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/module.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/kernel/module.c b/kernel/module.c
index d163c78ca8ed69..a9d092765c4eab 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -433,30 +433,13 @@ extern const s32 __start___kcrctab_unused_gpl[];
 #define symversion(base, idx) ((base != NULL) ? ((base) + (idx)) : NULL)
 #endif
 
-static bool each_symbol_in_section(const struct symsearch *arr,
-				   unsigned int arrsize,
-				   struct module *owner,
-				   bool (*fn)(const struct symsearch *syms,
-					      struct module *owner,
-					      void *data),
-				   void *data)
-{
-	unsigned int j;
-
-	for (j = 0; j < arrsize; j++) {
-		if (fn(&arr[j], owner, data))
-			return true;
-	}
-
-	return false;
-}
-
 /* Returns true as soon as fn returns true, otherwise false. */
 static bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
 				    struct module *owner,
 				    void *data),
 			 void *data)
 {
+	unsigned int i;
 	struct module *mod;
 	static const struct symsearch arr[] = {
 		{ __start___ksymtab, __stop___ksymtab, __start___kcrctab,
@@ -479,8 +462,9 @@ static bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
 
 	module_assert_mutex_or_preempt();
 
-	if (each_symbol_in_section(arr, ARRAY_SIZE(arr), NULL, fn, data))
-		return true;
+	for (i = 0; i < ARRAY_SIZE(arr); i++)
+		if (fn(&arr[i], NULL, data))
+			return true;
 
 	list_for_each_entry_rcu(mod, &modules, list,
 				lockdep_is_held(&module_mutex)) {
@@ -509,8 +493,9 @@ static bool each_symbol_section(bool (*fn)(const struct symsearch *arr,
 		if (mod->state == MODULE_STATE_UNFORMED)
 			continue;
 
-		if (each_symbol_in_section(arr, ARRAY_SIZE(arr), mod, fn, data))
-			return true;
+		for (i = 0; i < ARRAY_SIZE(arr); i++)
+			if (fn(&arr[i], mod, data))
+				return true;
 	}
 	return false;
 }
-- 
2.29.2

