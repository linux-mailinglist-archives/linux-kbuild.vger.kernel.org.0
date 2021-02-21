Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5436320BDD
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 17:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbhBUQzR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 11:55:17 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:58842 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhBUQzQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 11:55:16 -0500
Received: from oscar.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 11LGrwRb023396;
        Mon, 22 Feb 2021 01:53:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 11LGrwRb023396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613926439;
        bh=fvPvOiHC3oclM/gUK2TUxCb2IrPw8cQ35wDLFWeabIA=;
        h=From:To:Cc:Subject:Date:From;
        b=EIQMx2EmEnEOf4WQoBbs/OwwAv5xmNhmEpwZRDnLlbgvHS6eYGLXSvBwkmqHIlJWt
         9I9kHsrU0XaK9t5QDWgxj0OX+TAnRfGOp0rQFHGUEUFbCPGbfM2RrdV+002FOekDNR
         YYxNPdj34MLfteix3NmwzC9Y4tG9ERJZkzpjjbLH61DoWQkl3AvOcUnJZyHzXyZaqN
         2Z9DXb4S36g9LdLJF4L8pPTsoWp7klOeKCiCxJNKSBu475tsn7VhLLVrnbTI36uuzo
         Wt/ozQFquNeNv5oEB5Wrcrx5aWk8pSJZlP9Z9kho5HJsQteeNw3C95dBcEf5hZYxbx
         MxvRi8DViYP1A==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: remove deprecated 'always' and 'hostprogs-y/m'
Date:   Mon, 22 Feb 2021 01:53:56 +0900
Message-Id: <20210221165356.294443-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These have no more user in the upstream code. The use of them has been
warned for a while for external modules. The migration is finished.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build |  1 -
 scripts/Makefile.clean |  3 ---
 scripts/Makefile.lib   | 12 ------------
 3 files changed, 16 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4c058f12dd73..3a07c46caa3e 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -15,7 +15,6 @@ obj-y :=
 obj-m :=
 lib-y :=
 lib-m :=
-always :=
 always-y :=
 always-m :=
 targets :=
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index d9e0ceace6a6..22a8172bce1f 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -34,9 +34,6 @@ __clean-files	:= \
 	$(hostprogs-always-y) $(hostprogs-always-m) $(hostprogs-always-) \
 	$(userprogs-always-y) $(userprogs-always-m) $(userprogs-always-)
 
-# deprecated
-__clean-files	+= $(always) $(hostprogs-y) $(hostprogs-m) $(hostprogs-)
-
 __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
 
 # clean-files is given relative to the current directory, unless it
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 213677a5ed33..331e85c208c7 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -4,18 +4,6 @@ asflags-y  += $(EXTRA_AFLAGS)
 ccflags-y  += $(EXTRA_CFLAGS)
 cppflags-y += $(EXTRA_CPPFLAGS)
 ldflags-y  += $(EXTRA_LDFLAGS)
-ifneq ($(always),)
-$(warning 'always' is deprecated. Please use 'always-y' instead)
-always-y   += $(always)
-endif
-ifneq ($(hostprogs-y),)
-$(warning 'hostprogs-y' is deprecated. Please use 'hostprogs' instead)
-hostprogs  += $(hostprogs-y)
-endif
-ifneq ($(hostprogs-m),)
-$(warning 'hostprogs-m' is deprecated. Please use 'hostprogs' instead)
-hostprogs  += $(hostprogs-m)
-endif
 
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
-- 
2.27.0

