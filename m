Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065B82FCB14
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 07:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbhATGbe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 01:31:34 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:39180 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729641AbhATGZ7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 01:25:59 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 10K6Nskv000951;
        Wed, 20 Jan 2021 15:23:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 10K6Nskv000951
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611123835;
        bh=1JrYU8+EbJufEwrJi23/GxY2VE/PHExCTFg+NH0kfF8=;
        h=From:To:Cc:Subject:Date:From;
        b=pQthdvoM7RX8d6r5+I7dpdk0z0OAI33IVQgRjIYNHskv+uiNyGJRuaYkNrLCL61/v
         PKjMVOWdBkefCKjHqL7eLPuKNRBeigvyLUu9m/iE0YmLU1v0Cq64ziBBveazsCo328
         d5kqkp/shU4dAN3/kw3/68GjX+fxG8mYhy5rf2b1LPHT0vDXvCa1nxIht6eG3wqMjI
         keAY8LNL/CHObN8jK1Wyl5zTYc/oSQmAtBeHmIOlfvBQAsV3LNb5vs0cBztCYMCycL
         yBW4wbhvi2dDrjje4cLwUJP0ISPzWtXalHFW+OdG5kqvZ6YWf57o6VSDwFyLwRk/LV
         Bkv9fkAxAa7Pg==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: use always-y instead of extra-y
Date:   Wed, 20 Jan 2021 15:23:51 +0900
Message-Id: <20210120062351.3011786-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As commit d0e628cd817f ("kbuild: doc: clarify the difference between
extra-y and always-y") explained, extra-y should be used for listing
the prerequsites of vmlinux. always-y is a better fix here.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/devicetree/bindings/Makefile |  8 ++++----
 drivers/gpu/drm/i915/Makefile              |  2 +-
 scripts/Makefile.lib                       | 10 +++++-----
 scripts/gdb/linux/Makefile                 |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 8f2b054bec5a..90fcad98984d 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -78,10 +78,10 @@ $(obj)/processed-schema.json: $(DT_SCHEMA_FILES) check_dtschema_version FORCE
 
 endif
 
-extra-$(CHECK_DT_BINDING) += processed-schema-examples.json
-extra-$(CHECK_DTBS) += processed-schema.json
-extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
-extra-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
+always-$(CHECK_DT_BINDING) += processed-schema-examples.json
+always-$(CHECK_DTBS)       += processed-schema.json
+always-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dts, $(DT_SCHEMA_FILES))
+always-$(CHECK_DT_BINDING) += $(patsubst $(src)/%.yaml,%.example.dt.yaml, $(DT_SCHEMA_FILES))
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
 # build artifacts here before they are processed by scripts/Makefile.clean
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 6d9e81ea67f4..938221894d0c 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -294,7 +294,7 @@ no-header-test := \
 	gvt/mpt.h \
 	gvt/scheduler.h
 
-extra-$(CONFIG_DRM_I915_WERROR) += \
+always-$(CONFIG_DRM_I915_WERROR) += \
 	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
 		$(shell cd $(srctree)/$(src) && find * -name '*.h')))
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 4612a887f28e..b8e587a17dcc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -64,12 +64,12 @@ always-y += $(userprogs-always-y) $(userprogs-always-m)
 
 # DTB
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
-extra-y				+= $(dtb-y)
-extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
+always-y			+= $(dtb-y)
+always-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
 
 ifneq ($(CHECK_DTBS),)
-extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
-extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
+always-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
+always-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
 # Add subdir path
@@ -230,7 +230,7 @@ $(obj)/%: $(src)/%_shipped
 #	target: source(s) FORCE
 #		$(if_changed,ld/objcopy/gzip)
 #
-#	and add target to extra-y so that we know we have to
+#	and add target to 'targets' so that we know we have to
 #	read in the saved command line
 
 # Linking
diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
index 124755087510..13903073cbff 100644
--- a/scripts/gdb/linux/Makefile
+++ b/scripts/gdb/linux/Makefile
@@ -18,7 +18,7 @@ quiet_cmd_gen_constants_py = GEN     $@
 	$(CPP) -E -x c -P $(c_flags) $< > $@ ;\
 	sed -i '1,/<!-- end-c-headers -->/d;' $@
 
-extra-y += constants.py
+always-y += constants.py
 $(obj)/constants.py: $(src)/constants.py.in FORCE
 	$(call if_changed_dep,gen_constants_py)
 
-- 
2.27.0

