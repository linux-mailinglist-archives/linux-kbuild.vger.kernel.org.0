Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C86DA35FBA0
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234964AbhDNT1m (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhDNT1m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:27:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B682C061574;
        Wed, 14 Apr 2021 12:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=4+1wd2pK7CXY/M3KV/UrvShdnppGdq/Gmh3jx1eH2uk=; b=V38veh0ZV+GJTzNvuppo+TnfmG
        +YAEeyyCSpWLmXom4TZxQadG8btsAH7f4u6Qwf0wek/LetPwrWMBMwvjrWEYs7UjjEZksCrpdf0+R
        S1gHNfzcABdBis/UMk5bAk/1mJtG6Btz5JdMKtNYM6stCqMFahtOd1fYZSJ23bMedmgc0pJDALQhR
        EpbNYsrDTGUwl/h4a2DcbMQIMcqvOUiyS1saP6sriN2cC5uVDOO5FvWgVJ01URq+j7b6arBXs3zws
        11fH8api7CEMImDjHqHMptTd6EKf8n4RNr9wqVPoyn0NjC1xyKsGPDeS5OJv5BUIpMIB/GjR5zika
        dds9ppZA==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lWlAE-007XJv-So; Wed, 14 Apr 2021 19:27:09 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
Subject: [PATCH] uml: fix W=1 missing-include-dirs warnings
Date:   Wed, 14 Apr 2021 12:26:57 -0700
Message-Id: <20210414192657.17764-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently when using "W=1" with UML builds, there are over 700 warnings
like so:

  CC      arch/um/drivers/stderr_console.o
cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]

but arch/um/ does not have include/uapi/ at all, so don't
include arch/um/include/uapi/ in USERINCLUDE for UML.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org
Cc: Jeff Dike <jdike@addtoit.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: linux-um@lists.infradead.org
---
 Makefile |   10 ++++++++++
 1 file changed, 10 insertions(+)

Option 2: change the setting of USERINCLUDE. This could alter
	(a) build times and
	(b) which header files get used: if there are multiple
	    header files named foobar.h in the $(USERINCLUDE)
	    subdirectories, this Option changes the order in which
	    they would be found.

- linux-next-20210413.orig/Makefile
+ linux-next-20210413/Makefile
@@ -501,13 +501,16 @@ LDFLAGS_vmlinux =
 
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
-		-I$(srctree)/arch/$(SRCARCH)/include/uapi \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
 		-I$(srctree)/include/uapi \
 		-I$(objtree)/include/generated/uapi \
                 -include $(srctree)/include/linux/compiler-version.h \
                 -include $(srctree)/include/linux/kconfig.h
 
+ifneq ($(ARCH),um)
+USERINCLUDE    += -I$(srctree)/arch/$(SRCARCH)/include/uapi
+endif
+
 # Use LINUXINCLUDE when you must reference the include/ directory.
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := \

Option 3: modify scripts/Makefile.extrawarn not to set
	-Wmissing-include-dirs for arch=um. I think that this is not
	a good idea: it could cause valid problem reports not to be
	reported.

Option 4: simply mkdir arch/um/include/uapi
	That's what I did first, just as a test, and it works.

--- linux-next-20210413.orig/Makefile
+++ linux-next-20210413/Makefile
@@ -500,6 +500,15 @@ AFLAGS_KERNEL	=
 LDFLAGS_vmlinux =
 
 # Use USERINCLUDE when you must reference the UAPI directories only.
+# Note: arch/um/ does not have an include/uapi/ subdir.
+ifeq ($(ARCH),um)
+USERINCLUDE    := \
+		-I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
+		-I$(srctree)/include/uapi \
+		-I$(objtree)/include/generated/uapi \
+                -include $(srctree)/include/linux/compiler-version.h \
+                -include $(srctree)/include/linux/kconfig.h
+else
 USERINCLUDE    := \
 		-I$(srctree)/arch/$(SRCARCH)/include/uapi \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
@@ -507,6 +516,7 @@ USERINCLUDE    := \
 		-I$(objtree)/include/generated/uapi \
                 -include $(srctree)/include/linux/compiler-version.h \
                 -include $(srctree)/include/linux/kconfig.h
+endif
 
 # Use LINUXINCLUDE when you must reference the include/ directory.
 # Needed to be compatible with the O= option
