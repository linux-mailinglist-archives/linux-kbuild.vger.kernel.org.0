Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6CEB9780
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2019 21:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405539AbfITTB3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 15:01:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33788 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405208AbfITTB3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 15:01:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F027E60A96; Fri, 20 Sep 2019 19:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569006088;
        bh=sh+xEGpAAy1K9B++fVDC6nEhBl8tw28dbCnDfBuG3oM=;
        h=From:To:Cc:Subject:Date:From;
        b=BwAaWYQmDUUa3V24pAQNbmFkOP8hjRCK0qbp8PFJfCFXN1/NOmuL4v3gHdR96+hkW
         B96pXw99cnMgkHBBazLuuiG4zdXC0aIzu9bLjejAa98X8eLgzdkyEm7SolhDyI3TVv
         751dOYhslfBaS35xLvS3BlwxUc2STEwOkZ5ZnbOg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7F9C60735;
        Fri, 20 Sep 2019 19:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569006087;
        bh=sh+xEGpAAy1K9B++fVDC6nEhBl8tw28dbCnDfBuG3oM=;
        h=From:To:Cc:Subject:Date:From;
        b=nphzEk9K0e+D/SC2Hia43eM8zAmbmyNq0cX0AeC1VbwcckZm2Xv6aOhS1wx5W2z6k
         oqSzPVyZjq9sU0Zljdi8bT33NXpt1XeM/NM4yMNavdxkwEObzlixn+lk+eJhNuTEAt
         1oCzJdROdyhaFUyDtTE8Lfp0z2k5juW7vgmcf+B0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7F9C60735
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH] kbuild: binrpm-pkg: Propagate O= to rpmbuild
Date:   Fri, 20 Sep 2019 13:01:02 -0600
Message-Id: <1569006062-17862-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If the user specifies O= to indicate a specific output directory for the
build, rpmbuild does not honor this, and will use its default, which could
be the user's home directory.  In cases where the user has limited home
directory space, this could cause the build to outright fail.

In the case of the binrpm-pkg target, redefine the top directory for output
to be what the user specified in O=, thus the user will find a "rpmbuild"
subdirectory in that location with all of the RPM artifacts.

This does not apply to rpm-pkg, since we already cannot handle creating
the source tarball out of tree.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 scripts/Makefile.package | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 56eadcc..aab0711 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -21,7 +21,7 @@ include $(srctree)/scripts/Kbuild.include
 # - Use /. to avoid tar packing just the symlink
 
 # Note that the rpm-pkg target cannot be used with KBUILD_OUTPUT,
-# but the binrpm-pkg target can; for some reason O= gets ignored.
+# but the binrpm-pkg target can
 
 # Remove hyphens since they have special meaning in RPM filenames
 KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
@@ -33,6 +33,12 @@ TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
                Kbuild Kconfig COPYING $(wildcard localversion*)
 MKSPEC     := $(srctree)/scripts/package/mkspec
 
+RPM_OUTDIR :=
+ifneq ($(objtree),$(srctree))
+# Using absolute path as relative path will cause parts of rpmbuild to fail
+        RPM_OUTDIR := --define "_topdir $(abs_objtree)/rpmbuild"
+endif
+
 quiet_cmd_src_tar = TAR     $(2).tar.gz
       cmd_src_tar = \
 if test "$(objtree)" != "$(srctree)"; then \
@@ -65,8 +71,8 @@ PHONY += binrpm-pkg
 binrpm-pkg:
 	$(MAKE) -f $(srctree)/Makefile
 	$(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
-	+rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
-		$(UTS_MACHINE) -bb $(objtree)/binkernel.spec
+	+rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" $(RPM_OUTDIR) \
+		--target $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
 
 PHONY += deb-pkg
 deb-pkg:
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

