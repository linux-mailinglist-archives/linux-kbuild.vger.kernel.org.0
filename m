Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5F162F98
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfGIE0I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:26:08 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42175 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfGIEZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVk009969;
        Tue, 9 Jul 2019 13:24:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVk009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646294;
        bh=iBlTAZJuJJ6+50j0WGjD4LyvREzE6vt9HBWQ8mbamWM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HekhdKDxoDJEqpBGRw/bM/WReVW8JEMj5vTDoxmIOmauxgkb9SRw3YCaUUh528FGx
         PmzO8bd2BmeBP/DqTG45W/lG6AyLq2y7601d2ogLbhZuR29UQ8w3CFB4RlwFudfDYa
         okg6ukaV7SeSvkuGLlxM5Rh2yGSzUR9xlsM76E6qUK0ixai2aSWpDSdoS5be9TUi3W
         BdbQxVkm0w9x5ttJyvgipizBQBNpqvQMsU5pDPs0yfKU5y/VMML9l9BkAqxFphKKWK
         zJ2nVCvhi24btSI8bfRMTQIVEzYmWqoHorMqegak9tb/exc9Xje2uEaDHLUS5uADJ7
         OnjQMbpWcUPZw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] kbuild: do not create empty modules.order in the prepare stage
Date:   Tue,  9 Jul 2019 13:24:05 +0900
Message-Id: <20190709042416.27554-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, $(objtree)/modules.order is touched in two places.

In the 'prepare0' rule, scripts/Makefile.build creates an empty
modules.order while processing 'obj=.'

In the 'modules' rule, the top-level Makefile overwrites it with
the correct list of modules.

It might be a good side-effect that modules.order is made empty
every time (probably this is not intended functionality), but I
personally do not like this behavior.

Kbuild descends into some directories in the preparation stage,
where created modules.order files may be broken.

Export 'preparing' while running the 'prepare' target, and when it
is defined, do not touch modules.order at all.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile               | 1 +
 scripts/Makefile.build | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 5c75ea7177f6..a31b672d512b 100644
--- a/Makefile
+++ b/Makefile
@@ -1000,6 +1000,7 @@ ifdef CONFIG_STACK_VALIDATION
 endif
 
 PHONY += prepare0
+prepare: export preparing=1
 
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 776842b7e6a3..93c20664bcbb 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -64,8 +64,10 @@ builtin-target := $(obj)/built-in.a
 endif
 
 ifdef CONFIG_MODULES
+ifndef preparing
 modorder-target := $(obj)/modules.order
 endif
+endif
 
 # We keep a list of all modules in $(MODVERDIR)
 
-- 
2.17.1

