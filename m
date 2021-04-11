Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297DA35B303
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 12:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbhDKKO6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 06:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235166AbhDKKO5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:14:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD770C06138B
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Apr 2021 03:14:41 -0700 (PDT)
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1618136077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i3+Kl5FcYsjg9qthOVz0Zxrj9dHPWVVERskguSKkN/Y=;
        b=ImymoPySjj85YD8qUUxVXk3wnbOo798teXpPRdYJSaS9attSHCkC6VeQJ7VXv4sIvoaM9v
        e4l92VO4rBfwmV7cmpI4mypSSI203kk2a/OJUAKkVQhHRD/3etOmZXXvzL7t0JxM0qW7z1
        PBR36uO08cp7Pw4iFjsKXsKHvN8zclmIwegaNkCpcd9nwuA4vK1T1kQkeEcbYFwjTV5uy+
        xxqc+20q2fxl5R2sKgvo0U3A603/469jiochbE+J2/tVmaLVcutx3fVwXUD+CDDyQEMRRw
        x9smEJySP8TLLDAxBN0jMj1IBVC/mn/pO0FLJXF13PPdP7F3QkBgL0XC/mSL2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1618136077;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i3+Kl5FcYsjg9qthOVz0Zxrj9dHPWVVERskguSKkN/Y=;
        b=Y3J3C0eurLhN2XLwQXTOyc8CqbpbETgRsTccl55GrTn9Rs2UpFoV6hbfwqK5lfejORFZIx
        tvrEVhZhK5ljHbBw==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH 1/6] builddeb: diff-ignore unexported top-level files
Date:   Sun, 11 Apr 2021 12:14:17 +0200
Message-Id: <20210411101422.7092-2-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-1-bage@linutronix.de>
References: <20210411101422.7092-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

scripts/Makefile.package's TAR_CONTENT lists the files to include in orig
tarballs while the deb-pkg make target only ignores .git. This results in
the other top-level files ending up in the .diff.gz.

Let dpkg-source ignore .git with the default diff-ignore and list the other
top-level files in extend-diff-ignore. Use the debian/source/options to
always have those available on building the package.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/Makefile.package | 2 +-
 scripts/package/mkdebian | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index f952fb64789d..280f3a2fa334 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -75,7 +75,7 @@ deb-pkg:
 	$(call cmd,src_tar,$(KDEB_SOURCENAME))
 	origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
 		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
-	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -i.git -us -uc
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -us -uc
 
 PHONY += bindeb-pkg
 bindeb-pkg:
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 60a2a63a5e90..3d2d4b033e44 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -134,6 +134,8 @@ fi
 
 mkdir -p debian/source/
 echo "1.0" > debian/source/format
+echo diff-ignore > debian/source/options
+echo 'extend-diff-ignore = ".clang-format|.cocciconfig|.config.old|.*ignore|.mailmap|.version|CREDITS|MAINTAINERS|README"' >> debian/source/options
 
 echo $debarch > debian/arch
 extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
-- 
2.30.2

