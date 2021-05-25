Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7566B390CA5
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 01:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhEYXDy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 May 2021 19:03:54 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:51098 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232040AbhEYXDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 May 2021 19:03:54 -0400
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1621983742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TbNffWAwwOO/zHwDZAIuU9j/1ayprncSRG9Hgevu32g=;
        b=y4ouNV33WrlWVrNzIJbDB3mWmu+faDsWmAclWAKB8uuJagRq+DDP1feE8vDqZjHCtC9BHl
        RMmrfmXbUp+bm7YOJKvP6Xp/SMVtPAv9gTxvJwvAS/rgVpWDVIkJfKvZallBov9QjESd+j
        +63qvQ67J4ZMiTPkGovCUK0Ax2HvF5P7HhNSTIW51XHZKhzeoosFE17k8zXqyGu+STVrcr
        SKoBUnBYGgnA0JwTwwthPICYDuowh86wvBVJFI/fAhYl2gg2R5U2xk9xSFLmylMLts8hyu
        0GASb7uokaogQkgQgV2p1sWIs9ObcYx1YCjqZYygVIpFZnwXh8M2ULC/mDvsrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1621983742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TbNffWAwwOO/zHwDZAIuU9j/1ayprncSRG9Hgevu32g=;
        b=VLjhj/xfkFRv/iO0dsDUCehda4shULe6GT1AQEzI7xkr2WV3lcLYvfl4njJwg3VsybbkHU
        lz1YljPzuaMVP4Dw==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH v2 1/5] builddeb: ignore or export files for clean pkg build
Date:   Wed, 26 May 2021 01:01:35 +0200
Message-Id: <20210525230139.6165-2-bage@linutronix.de>
In-Reply-To: <20210525230139.6165-1-bage@linutronix.de>
References: <20210525230139.6165-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

scripts/Makefile.package's TAR_CONTENT lists the files to include in orig
tarballs while the deb-pkg make target only ignores .git. This results in
the other top-level files ending up in the .diff.gz.

Extend the TAR_CONTENT with the git-controlled top-level files.

Let dpkg-source ignore .git with the default diff-ignore and list
dynamically generated files that are not cleaned in extend-diff-ignore.
Use the debian/source/options in order to have those always available on
building the package.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/Makefile.package | 5 +++--
 scripts/package/mkdebian | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index b74c65284fb2..360ce0ae2fa1 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -28,8 +28,9 @@ KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
 KDEB_SOURCENAME ?= linux-upstream
 KBUILD_PKG_ROOTCMD ?="fakeroot -u"
 export KDEB_SOURCENAME
-# Include only those top-level files that are needed by make, plus the GPL copy
 TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
+               .clang-format .cocciconfig .get_maintainer.ignore \
+               .gitignore .mailmap CREDITS MAINTAINERS README \
                Kbuild Kconfig COPYING $(wildcard localversion*)
 MKSPEC     := $(srctree)/scripts/package/mkspec
 
@@ -75,7 +76,7 @@ deb-pkg:
 	$(call cmd,src_tar,$(KDEB_SOURCENAME))
 	origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
 		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
-	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -i.git -us -uc
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -us -uc
 
 PHONY += bindeb-pkg
 bindeb-pkg:
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 60a2a63a5e90..b317d26e2bbf 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -134,6 +134,8 @@ fi
 
 mkdir -p debian/source/
 echo "1.0" > debian/source/format
+echo diff-ignore > debian/source/options
+echo 'extend-diff-ignore = ".config.old|.version|.*include/generated.*|scripts/mod/.*"' >> debian/source/options
 
 echo $debarch > debian/arch
 extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
-- 
2.30.2

