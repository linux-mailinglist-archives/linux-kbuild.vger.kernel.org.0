Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55F62264C30
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 20:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgIJSEg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 14:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbgIJSEC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 14:04:02 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB91C061573;
        Thu, 10 Sep 2020 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=lkjSc0oNKJsgw7+XYMws5doAYQy29kpb0njFyLk4OHE=; b=JzOHMYvnbMG1Qm3sPuHXlGnTVC
        LG6XRhMA+jft1D3Up4XI2InlqjC2sHe1isMB+WETewtc0urNhE69YuNJjJCMMVwMgUrok5M+d/JcD
        BGuRCsbK6A8jYxhbM+unXqN3rZoO4gqJNW8U7kLmM+KmUHL2LMhYnnnGie+qCeMDCyKyBiWvlt7yg
        kdxUgZsXGnWvkE5fCvRys7ZJtP1NLYeW2Qgd/YhPkz15f7vpNnl/qi3NG+x+vs4ob+OmAYgY+fwos
        Dp0Em1ckq7Sk+Guwm4y+o0q1Ns+wWCkXhkr9LdT6TLTkC9gP8nMGQWhhWnUizQTUJkbVml/udjAdr
        sUTw/Phg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kGQvJ-0003JI-Pt; Thu, 10 Sep 2020 18:03:53 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [PATCH] build: Fix documentation checking
Date:   Thu, 10 Sep 2020 19:03:52 +0100
Message-Id: <20200910180352.12632-1-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Using $(call cmd,...) requires that there be a quiet_ version of the
command, otherwise it's silently skipped.

Fixes: 3a2429e1faf4 ("kbuild: change if_changed_rule for multi-line recipe")
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 scripts/Makefile.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index a467b9323442..571d75777b6f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -104,7 +104,8 @@ else ifeq ($(KBUILD_CHECKSRC),2)
 endif
 
 ifneq ($(KBUILD_EXTRA_WARN),)
-  cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
+  quiet_cmd_checkdoc = CHKDOC  $<
+        cmd_checkdoc = $(srctree)/scripts/kernel-doc -none $<
 endif
 
 # Compile C sources (.c)
-- 
2.28.0

