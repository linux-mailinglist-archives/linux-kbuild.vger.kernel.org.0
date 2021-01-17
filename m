Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF5312F9222
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Jan 2021 12:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbhAQLxT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Jan 2021 06:53:19 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:30719 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbhAQLxR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jan 2021 06:53:17 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 10HBpwK5020030;
        Sun, 17 Jan 2021 20:51:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 10HBpwK5020030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610884320;
        bh=EFj9oeMgvAYa1rwIlWvX8nLtsqK0q+woofcIbdkFZtE=;
        h=From:To:Cc:Subject:Date:From;
        b=BExNmYJMACnAIG7HBYf+h6vPyxKSUYGnXAK3ZUVD+pFluNBTsod8bZjlDP1NMFu5f
         fsSpepbFopByM2nkfA7vcQvGlnBpRLtW48Diq3E/9hke5SSc+tNJaG8IDH75EzNuw8
         I/uizbLu8snHMogCajSQDsdnhcafIMAcdLNm5NV7XR9OhWVbLu43CwConssAaAmWtI
         hl4U9VJrJUDpp+o49LB8GO7MMVlSb40dSLw2WAFsSy+JAkpsB7TKIznWwlVy7+W4L+
         rz6x1nO3BHqSUWnJmJpbxYtXzWlV+cl+mA9E3S7i4M7WqKL9+yZW61OfiVqmxkBkRU
         VLBEdlUNE2HgA==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: doc: remove "Objects which export symbols" section
Date:   Sun, 17 Jan 2021 20:51:56 +0900
Message-Id: <20210117115156.2394975-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

EXPORT_SYMBOL is unrelated to makefiles. No need to mention it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 9f6a11881951..949f09ea3f1a 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -12,7 +12,7 @@ This document describes the Linux kernel Makefiles.
 	   --- 3.1 Goal definitions
 	   --- 3.2 Built-in object goals - obj-y
 	   --- 3.3 Loadable module goals - obj-m
-	   --- 3.4 Objects which export symbols
+	   --- 3.4 <deleted>
 	   --- 3.5 Library file goals - lib-y
 	   --- 3.6 Descending down in directories
 	   --- 3.7 Non-builtin vmlinux targets - extra-y
@@ -247,12 +247,6 @@ more details, with real examples.
 	kbuild will build an ext2.o file for you out of the individual
 	parts and then link this into built-in.a, as you would expect.
 
-3.4 Objects which export symbols
---------------------------------
-
-	No special notation is required in the makefiles for
-	modules exporting symbols.
-
 3.5 Library file goals - lib-y
 ------------------------------
 
-- 
2.27.0

