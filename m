Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1140242B9B
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Aug 2020 16:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgHLOtw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 10:49:52 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:62323 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgHLOtw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 10:49:52 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 07CEnQ1a030156;
        Wed, 12 Aug 2020 23:49:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 07CEnQ1a030156
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597243767;
        bh=DhmA+0HaX2aM2uWibI/FmSiCbk/WILIOdMgaK5iY8KA=;
        h=From:To:Cc:Subject:Date:From;
        b=YXSY50s1jrpS6iR6SZGsAt3lUPqQL7rgDK2RC07FgqCQZ899VcpEVVF845u3RdSFp
         qup/dUgcuu4rhPTUjQ5ojJTqQSpxoH24FiRY6lV9KGz0D5Txwx8GUHjmI7KddwKzll
         9zorE6C08op6bPjf0yDLf5TEJbw1R9sQZbOJxRfnhK7u4F+P5d/q9PFIIUQolKYRrw
         u+6LwT+56Pbq8IMR6ZwfYsSOcPGlJrskfgW/IJWHzVPWC45FAeEYDBAaUbx8WOuZrL
         OFZYN0hRThho64oUuyPeJuDIv4KqBEEF0pAhajozZBQ6jXgxYjf+d4TuybAmm9r/uG
         uXnH7iKBBGVXw==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove redundant patterns in filter/filter-out
Date:   Wed, 12 Aug 2020 23:49:23 +0900
Message-Id: <20200812144923.1932593-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The '%' in filter/filter-out matches to any number of any characters,
including empty string.

So, '%config' matches to 'config', and '%install' to 'install'.

Drop the redundant patterns.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 952f833dc405..51212c3e3851 100644
--- a/Makefile
+++ b/Makefile
@@ -265,8 +265,7 @@ no-dot-config-targets := $(clean-targets) \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 outputmakefile
-no-sync-config-targets := $(no-dot-config-targets) install %install \
-			   kernelrelease
+no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
 
 config-build	:=
@@ -292,7 +291,7 @@ ifneq ($(KBUILD_EXTMOD),)
 endif
 
 ifeq ($(KBUILD_EXTMOD),)
-        ifneq ($(filter config %config,$(MAKECMDGOALS)),)
+        ifneq ($(filter %config,$(MAKECMDGOALS)),)
 		config-build := 1
                 ifneq ($(words $(MAKECMDGOALS)),1)
 			mixed-build := 1
-- 
2.25.1

