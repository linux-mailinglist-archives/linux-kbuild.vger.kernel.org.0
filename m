Return-Path: <linux-kbuild+bounces-2663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23B93C8AA
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 21:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27D161F226A2
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 19:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C452833CF1;
	Thu, 25 Jul 2024 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+qwjFMO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9302B9B5;
	Thu, 25 Jul 2024 19:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721935433; cv=none; b=S4AJly3pOLLAfw/DjBQkGjkdl2aOBPududNwsj48eq0/pj1YC7WcEmu3exkETgRTpSVPsCNeJmh3Qy3KJIueJ+A0/6v272TTjhhuFPncvU+WApTmMajLcNzL/P42fCcKtVXqqvx+76qxLnVi5WJFTQWnsGtqWNLTtnlrnAxF9Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721935433; c=relaxed/simple;
	bh=NczLUIduPhPLvO8eR2I/BD4NAaJ8aoqR5GQb1vqr72g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bu/zqLS4guRIqjhOLBwRdmKwcTtRVwYZsg/4OkQXqwX4Dc2MdjIqgQD+ad8HQl5xFeHrWZlDTJ7hkVJBOjmtONHva6aZ9iJzyDZ/H1yq25l1yn6tOchwATsPoCsgY6Ar6MfiVGAknbXt0tD3K9BjZzYopeAYs83eyjU7jFiPFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+qwjFMO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B84C116B1;
	Thu, 25 Jul 2024 19:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721935433;
	bh=NczLUIduPhPLvO8eR2I/BD4NAaJ8aoqR5GQb1vqr72g=;
	h=From:To:Cc:Subject:Date:From;
	b=U+qwjFMOiDl5LsQKfPCSYtQ7mqBdxUXkXbTE4BSJicIQLPzTAoefcnU43s1LvSE7q
	 1BeLYsinqODmBGRMLD2R9pItxvvZ5wiAVqBY/mrizbvv7TsMdaLnENykH6U6js98fz
	 M7IfWojmB1MwbM+NmI4kAsxSNdz9koJZQ7LESoo+sKMAkF6wGQUCUEgYQrKsdBF2CK
	 Yg33OUKb/E29MJh5DoPHZpP12EhnxzgNsk6MwvdEnj8QbLSjm5Fl0PBCwlRCTMAEdI
	 Q9/U3YYmHyqfjDHb/xQ9CA3x3P5GdPOHU0N/z5wYM6c3Z2v+XogzhoniV9a/PA6ODe
	 9GVqGTGqY+gRQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: clean up code duplication in cmd_fdtoverlay
Date: Fri, 26 Jul 2024 04:23:14 +0900
Message-ID: <20240725192317.258132-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When resolving a merge conflict, Linus noticed the fdtoverlay command
duplication introduced by commit 49636c5680b9 ("kbuild: verify dtoverlay
files against schema"). He suggested a clean-up.

I eliminated the duplication and refactored the code a little further.

No functional changes are intended, except for the short logs.

The log will look as follows:

  $ make ARCH=arm64 defconfig dtbs_check
      [ snip ]
    DTC [C] arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dtb
    DTC [C] arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dtb
    DTC [C] arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dtb
    DTC [C] arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb
    DTC     arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtbo
    OVL [C] arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtb

The tag [C] indicates that the schema check is executed.

Link: https://lore.kernel.org/lkml/CAHk-=wiF3yeWehcvqY-4X7WNb8n4yw_5t0H1CpEpKi7JMjaMfw@mail.gmail.com/#t
Requested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index fe3668dc4954..207325eaf1d1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -400,26 +400,23 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
 	$(call if_changed,wrap_S_dtb)
 
-quiet_cmd_dtc = DTC     $@
+quiet_dtb_check_tag = $(if $(dtb-check-enabled),[C],   )
+cmd_dtb_check = $(if $(dtb-check-enabled),; $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ || true)
+
+quiet_cmd_dtc = DTC $(quiet_dtb_check_tag) $@
 cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
-
-DT_CHECK_CMD = $(DT_CHECKER) $(DT_CHECKER_FLAGS) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA)
+	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile) \
+	$(cmd_dtb_check)
 
 # NOTE:
 # Do not replace $(filter %.dtb %.dtbo, $^) with $(real-prereqs). When a single
 # DTB is turned into a multi-blob DTB, $^ will contain header file dependencies
 # recorded in the .*.cmd file.
-ifneq ($(CHECK_DTBS),)
-quiet_cmd_fdtoverlay = DTOVLCH $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) ; $(DT_CHECK_CMD) $@ || true
-else
-quiet_cmd_fdtoverlay = DTOVL   $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^)
-endif
+quiet_cmd_fdtoverlay = OVL $(quiet_dtb_check_tag) $@
+      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(filter %.dtb %.dtbo, $^) $(cmd_dtb_check)
 
 $(multi-dtb-y): FORCE
 	$(call if_changed,fdtoverlay)
@@ -430,16 +427,11 @@ DT_CHECKER ?= dt-validate
 DT_CHECKER_FLAGS ?= $(if $(DT_SCHEMA_FILES),-l $(DT_SCHEMA_FILES),-m)
 DT_BINDING_DIR := Documentation/devicetree/bindings
 DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.json
-
-quiet_cmd_dtb =	DTC_CHK $@
-      cmd_dtb =	$(cmd_dtc) ; $(DT_CHECK_CMD) $@ || true
-else
-quiet_cmd_dtb = $(quiet_cmd_dtc)
-      cmd_dtb = $(cmd_dtc)
+dtb-check-enabled = $(if $(filter %.dtb, $@),y)
 endif
 
 $(obj)/%.dtb: $(obj)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
-	$(call if_changed_dep,dtb)
+	$(call if_changed_dep,dtc)
 
 $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
 	$(call if_changed_dep,dtc)
-- 
2.43.0


