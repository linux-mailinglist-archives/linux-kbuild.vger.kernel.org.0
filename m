Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C990E350164
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 15:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235880AbhCaNiz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 09:38:55 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38970 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235865AbhCaNid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 09:38:33 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 12VDcFed003995;
        Wed, 31 Mar 2021 22:38:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 12VDcFed003995
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617197898;
        bh=GDUqIPAyXFlw9XgsY6d2xuYxGGqR5Pjr563gkbK8bNQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BDEGunVlIF8GfL6OKcla7dVZ9xPt6hJoRixq6w3/Gbhp2gFPnsXN4WlDlJmidzZrU
         ySfrW97pQphoWpgjsReeFC5DgYXbD1zkQKsDVFRl3AMsS7bBKeJeSRr6jqxwM5ODRZ
         TFaR/aTZ/Fuwxa/IOWIwrQHDo8fUbb+gX7RwMfvRvFEFiZ3uuC+aCvynY4TMkRsl9c
         euaLjiPUmJi+3AJZrG2/YTgGYzYUD0+uVJneLn5ONCohGxJEPsOuwTAyG+/oAnLoeV
         Fp1fr9vZSD0+CUp7jVRJUlCxGaZrSemlQOj/AgqEOs5PW1iBuBvoexS/tWdqdlbB3r
         x8yTl5Hp55Z6Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 6/9] kbuild: refactor scripts/Makefile.modinst
Date:   Wed, 31 Mar 2021 22:38:07 +0900
Message-Id: <20210331133811.3221540-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
References: <20210331133811.3221540-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/Makefile.modinst is ugly and weird in multiple ways; it
specifies real files $(modules) as phony, makes directory manipulation
needlessly too complicated.

Clean up the Makefile code, and show the full path of installed modules
in the log.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                 |  2 +-
 scripts/Makefile.modinst | 42 +++++++++++++++++++++++-----------------
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/Makefile b/Makefile
index e3c2bd1b6f42..88e5c15e1186 100644
--- a/Makefile
+++ b/Makefile
@@ -1141,7 +1141,7 @@ endif # CONFIG_BPF
 
 PHONY += prepare0
 
-extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
+export extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
 export MODORDER := $(extmod_prefix)modules.order
 export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index ad1981233d0b..3b2d0380504d 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -8,28 +8,34 @@ __modinst:
 
 include $(srctree)/scripts/Kbuild.include
 
-modules := $(sort $(shell cat $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)modules.order))
+modules := $(sort $(shell cat $(MODORDER)))
+
+ifeq ($(KBUILD_EXTMOD),)
+subdir := kernel
+else
+INSTALL_MOD_DIR ?= extra
+subdir := $(INSTALL_MOD_DIR)
+endif
+
+dst := $(MODLIB)/$(subdir)
+
+modules := $(patsubst $(extmod_prefix)%, $(dst)/%, $(modules))
 
-PHONY += $(modules)
 __modinst: $(modules)
 	@:
 
 # Don't stop modules_install if we can't sign external modules.
-quiet_cmd_modules_install = INSTALL $@
-      cmd_modules_install = \
-    mkdir -p $(2) ; \
-    cp $@ $(2) ; \
-    $(mod_strip_cmd) $(2)/$(notdir $@) ; \
-    $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
-    $(mod_compress_cmd) $(2)/$(notdir $@)
-
-# Modules built outside the kernel source tree go into extra by default
-INSTALL_MOD_DIR ?= extra
-ext-mod-dir = $(INSTALL_MOD_DIR)$(subst $(patsubst %/,%,$(KBUILD_EXTMOD)),,$(@D))
-
-modinst_dir = $(if $(KBUILD_EXTMOD),$(ext-mod-dir),kernel/$(@D))
-
-$(modules):
-	$(call cmd,modules_install,$(MODLIB)/$(modinst_dir))
+quiet_cmd_install = INSTALL $@
+      cmd_install = \
+    mkdir -p $(dir $@); cp $< $@; \
+    $(mod_strip_cmd) $@; \
+    $(mod_sign_cmd) $@ $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
+    $(mod_compress_cmd) $@
+
+$(modules): $(dst)/%: $(extmod_prefix)% FORCE
+	$(call cmd,install)
+
+PHONY += FORCE
+FORCE:
 
 .PHONY: $(PHONY)
-- 
2.27.0

