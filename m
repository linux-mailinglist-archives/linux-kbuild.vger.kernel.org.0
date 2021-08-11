Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD3F3E9B14
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Aug 2021 00:54:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbhHKWzL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Aug 2021 18:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbhHKWzK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Aug 2021 18:55:10 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC865C061765;
        Wed, 11 Aug 2021 15:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=2wxyBZN4Hk4I18K5RwgFDHv/H1AMQ7HcLWjYd+zp/TY=; b=nnMKtZLzc1yUsXHZArntvKErl1
        UjtrIJISkTvTz02IN8VXHr5j9ypw288xz9EtemV2TNnJl/1Q/jdmdFsqrf4MJK1xD0FZpYhBA9Dz3
        pKFQlumqspzOuiWT2f1ONtLvbEGnktVYAlOLIAlRlkfnFQQ/Iif+p/wJqiNa8Ln7XcvamFwmr2sQR
        LzcOguFmqxFtCXxx8gPnFQ7oKLel4WTomnXVelMJ4TW056Ca11kDlRhkQqUcHtUvDS6aXeIPT5jiR
        K6dQ+BTkTduqz6Npcu5EIICuqp5jdkAQHftYnsam/fRVKAF1n4z8M7KVsmOwwM0ygrE8sFsotuPFG
        EdVOFw1w==;
Received: from [2601:1c0:6280:3f0:e65e:37ff:febd:ee53] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mDx7U-008Iec-H0; Wed, 11 Aug 2021 22:54:44 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: allow "make" targets 'versioncheck' and 'includecheck' withoug .config file
Date:   Wed, 11 Aug 2021 15:54:42 -0700
Message-Id: <20210811225442.9537-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Top-level Makefile targets 'versioncheck' and 'includecheck' don't
need a configured kernel (i.e., don't need a .config file), so add
them the the list of "no-dot-config-targets".
This eliminates the 'make' error:

***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
Makefile:759: include/config/auto.conf.cmd: No such file or directory

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
---
Fixes: I couldn't determine this.

 Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20210811.orig/Makefile
+++ linux-next-20210811/Makefile
@@ -274,7 +274,8 @@ no-dot-config-targets := $(clean-targets
 			 cscope gtags TAGS tags help% %docs check% coccicheck \
 			 $(version_h) headers headers_% archheaders archscripts \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
-			 outputmakefile rustfmt rustfmtcheck
+			 outputmakefile rustfmt rustfmtcheck \
+			 versioncheck includecheck
 # Installation targets should not require compiler. Unfortunately, vdso_install
 # is an exception where build artifacts may be updated. This must be fixed.
 no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
