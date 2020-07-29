Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01CA232311
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jul 2020 19:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2RDW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jul 2020 13:03:22 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:32764 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RDW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jul 2020 13:03:22 -0400
Received: from oscar.flets-west.jp (softbank126025067101.bbtec.net [126.25.67.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 06TH2fR7004951;
        Thu, 30 Jul 2020 02:02:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 06TH2fR7004951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596042162;
        bh=ki/I2JVLlzzEPe4gFZZEO/oFmjQU5Yu0bwRBBt2ph5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wznjt9t1jeXbcqow7HzurRkk4rfmEKfLvuOvIiBb5sLL2QDwAd30lqrnCb2YG+bzw
         J8bm70EqQ07RLIZ/P2g9GA1rJnkN+oULJggZr5+e+cfy+lL2LPz4Ntg4cISxITmY4X
         3xz1SDTL6giZ/3+w5YG1RsGsgrVsFvMGUr8QHtiALFFw14fOOX11aEIqkkVM/7aun4
         B0a8m3wBBqdR/zQ+nMNVL8DzkzXNJaE+A2nEOOc6PN9fmuTTyjoPr3j2ARNjZr+Q5C
         t7QlL0QfInfzS3DcvX3x6mqSP9cp3R13giuzHtiPhtS0SdwIp9g0vSsgKdfFdPHwf2
         0gUbd3w80zPHg==
X-Nifty-SrcIP: [126.25.67.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     David Binderman <dcb314@hotmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] kconfig: qconf: compile moc object separately
Date:   Thu, 30 Jul 2020 02:02:38 +0900
Message-Id: <20200729170239.160208-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200729170239.160208-1-masahiroy@kernel.org>
References: <20200729170239.160208-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, qconf.moc is included from qconf.cc but they can be compiled
independently.

When you modify qconf.cc, qconf.moc does not need recompiling.

Rename qconf.moc to qconf.moc.cc, and split it out as an independent
compilation unit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch

 scripts/kconfig/.gitignore |  2 +-
 scripts/kconfig/Makefile   | 11 ++++++-----
 scripts/kconfig/qconf.cc   |  1 -
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index 12a67fdab541..5914a3f5408c 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-*.moc
+/qconf.moc.cc
 *conf-cfg
 
 #
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index a5e770e75653..96d015473288 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -181,21 +181,22 @@ $(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/mconf-cfg
 
 # qconf: Used for the xconfig target based on Qt
 hostprogs	+= qconf
-qconf-cxxobjs	:= qconf.o
+qconf-cxxobjs	:= qconf.o qconf.moc.o
 qconf-objs	:= images.o $(common-objs)
 
 HOSTLDLIBS_qconf	= $(shell . $(obj)/qconf-cfg && echo $$libs)
 HOSTCXXFLAGS_qconf.o	= $(shell . $(obj)/qconf-cfg && echo $$cflags)
+HOSTCXXFLAGS_qconf.moc.o = $(shell . $(obj)/qconf-cfg && echo $$cflags)
 
-$(obj)/qconf.o: $(obj)/qconf-cfg $(obj)/qconf.moc
+$(obj)/qconf.o: $(obj)/qconf-cfg
 
 quiet_cmd_moc = MOC     $@
-      cmd_moc = $(shell . $(obj)/qconf-cfg && echo $$moc) -i $< -o $@
+      cmd_moc = $(shell . $(obj)/qconf-cfg && echo $$moc) $< -o $@
 
-$(obj)/%.moc: $(src)/%.h $(obj)/qconf-cfg FORCE
+$(obj)/qconf.moc.cc: $(src)/qconf.h $(obj)/qconf-cfg FORCE
 	$(call if_changed,moc)
 
-targets += qconf.moc
+targets += qconf.moc.cc
 
 # gconf: Used for the gconfig target based on GTK+
 hostprogs	+= gconf
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 4a616128a154..bb0a0bd511b9 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -23,7 +23,6 @@
 #include "lkc.h"
 #include "qconf.h"
 
-#include "qconf.moc"
 #include "images.h"
 
 
-- 
2.25.1

