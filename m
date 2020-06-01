Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A211E9DA2
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgFAF5x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:57:53 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:39161 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgFAF5x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:57:53 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaLg023694;
        Mon, 1 Jun 2020 14:57:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaLg023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991058;
        bh=//S+CseyHNhRzgrsQ7TQ5JRIUmN4rALWWecIo96lqwk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rhWEl2I60PRry0XbiWGvB7+wh11F32hrQlJSicua13NtmRsEBtQZ5dV19z8v7jou7
         OqMXipjAcKVPc+aSZUbQbVXylPunua+AwyWzIQgIzz+NYFi80qGoa4z24a+eJR4FBs
         spxZOxgNLC0MOKJBkS1uVQHnXqgltoYGCrv/kwG8baM2DMciUSVDO61Nk+8OH8RD3+
         iTladGfkelQ0nY/tAJPBYJWZGOJcRfgbKCB5LE9g4XN9ysSOBMwGMz2wheIU0ea8BA
         7GaOZCQncUKKDrUAQnyt4VGncHYF/XKhN/bMlqrGaEhaXqZ+uOC5j/dDo6myVLaHsQ
         O9f0I3Dslv5kQ==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 03/37] kbuild: merge init-y into core-y
Date:   Mon,  1 Jun 2020 14:56:57 +0900
Message-Id: <20200601055731.3006266-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

No arch Makefile specifies init-y.

Merge init-y into core-y. This does not change the link order.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 44921d9cf3cf..f9c37045cf64 100644
--- a/Makefile
+++ b/Makefile
@@ -643,12 +643,11 @@ endif
 
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
-init-y		:= init/
+core-y		:= init/ usr/
 drivers-y	:= drivers/ sound/
 drivers-$(CONFIG_SAMPLES) += samples/
 net-y		:= net/
 libs-y		:= lib/
-core-y		:= usr/
 virt-y		:= virt/
 endif # KBUILD_EXTMOD
 
@@ -1060,18 +1059,17 @@ export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
 
-vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
+vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
 		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
 
 vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
-		     $(patsubst %/,%,$(filter %/, $(init-) $(core-) \
+		     $(patsubst %/,%,$(filter %/, $(core-) \
 			$(drivers-) $(net-) $(libs-) $(virt-))))
 
 build-dirs	:= $(vmlinux-dirs)
 clean-dirs	:= $(vmlinux-alldirs)
 
-init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
 drivers-y	:= $(patsubst %/, %/built-in.a, $(drivers-y))
 net-y		:= $(patsubst %/, %/built-in.a, $(net-y))
@@ -1085,7 +1083,7 @@ endif
 virt-y		:= $(patsubst %/, %/built-in.a, $(virt-y))
 
 # Externally visible symbols (used by link-vmlinux.sh)
-export KBUILD_VMLINUX_OBJS := $(head-y) $(init-y) $(core-y) $(libs-y2) \
+export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) \
 			      $(drivers-y) $(net-y) $(virt-y)
 export KBUILD_VMLINUX_LIBS := $(libs-y1)
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
-- 
2.25.1

