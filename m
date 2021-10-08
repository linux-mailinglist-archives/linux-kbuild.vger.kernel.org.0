Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C04426A1C
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Oct 2021 13:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241923AbhJHLuK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Oct 2021 07:50:10 -0400
Received: from hypnos.jasiak.dev ([54.37.136.131]:59820 "EHLO
        hypnos.jasiak.dev" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240772AbhJHLt7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Oct 2021 07:49:59 -0400
X-Greylist: delayed 532 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Oct 2021 07:49:58 EDT
From:   =?UTF-8?q?Pawe=C5=82=20Jasiak?= <pawel@jasiak.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jasiak.dev; s=2021;
        t=1633693141;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=B6XIaZTr2HvdhOCxFxUI4pMeKIDCo+enKkSdts+y4sc=;
        b=CoxcmQ8mmnhQ97HKWiyP9OViWTqsF4uZDTeBjXe8S63cReHVw5UwvVmcAuZC6i7qeftRCC
        NcOadwBEInRzmIXI6op39Icp+qxsRueQHaMc/SW8/52qqNoCQ/jy2NdOYhSCj0YO+FrOEY
        k7nHvIKiQjMZp+A/brjc+Do+tRU/ccO0femYlTb9sN7HjUx4gJUreNSYzTBJBVeKgzyolt
        Wd2JbyiwnlkRXXA8tIjxrZ/tdhFaYK+LDVWnPER0aEf9rmA74Dw2Um9ptj14pCj2ziVjoc
        42KSD56fzr8ZI6YEBldgBsisS+z1csECzo8S2kP+EqT8eXIDbSqkT94HUI72Uw==
Cc:     =?UTF-8?q?Pawe=C5=82=20Jasiak?= <pawel@jasiak.dev>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Add make tarzst-pkg build option
Date:   Fri,  8 Oct 2021 13:37:59 +0200
Message-Id: <20211008113800.85155-1-pawel@jasiak.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=pawel@jasiak.dev smtp.mailfrom=pawel@jasiak.dev
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add tarzst-pkg and perf-tarzst-src-pkg targets to build zstd compressed
tarballs.

Signed-off-by: Paweł Jasiak <pawel@jasiak.dev>
---
 scripts/Makefile.package | 10 +++++++---
 scripts/package/buildtar |  4 ++++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index b74c65284fb2..77b612183c08 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -103,7 +103,7 @@ snap-pkg:
 
 # tarball targets
 # ---------------------------------------------------------------------------
-tar-pkgs := dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
+tar-pkgs := dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg tarzst-pkg
 PHONY += $(tar-pkgs)
 $(tar-pkgs):
 	$(MAKE) -f $(srctree)/Makefile
@@ -130,10 +130,12 @@ $(if $(findstring tar-src,$@),,                                     \
 $(if $(findstring bz2,$@),$(KBZIP2),                                 \
 $(if $(findstring gz,$@),$(KGZIP),                                  \
 $(if $(findstring xz,$@),$(XZ),                                     \
-$(error unknown target $@))))                                       \
+$(if $(findstring zst,$@),$(ZSTD),                                  \
+$(error unknown target $@)))))                                      \
 	-f -9 $(perf-tar).tar)
 
-perf-tar-pkgs := perf-tar-src-pkg perf-targz-src-pkg perf-tarbz2-src-pkg perf-tarxz-src-pkg
+perf-tar-pkgs := perf-tar-src-pkg perf-targz-src-pkg perf-tarbz2-src-pkg \
+		 perf-tarxz-src-pkg perf-tarzst-src-pkg
 PHONY += $(perf-tar-pkgs)
 $(perf-tar-pkgs):
 	$(call cmd,perf_tar)
@@ -153,9 +155,11 @@ help:
 	@echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
 	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
 	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
+	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
 	@echo '  perf-tar-src-pkg    - Build $(perf-tar).tar source tarball'
 	@echo '  perf-targz-src-pkg  - Build $(perf-tar).tar.gz source tarball'
 	@echo '  perf-tarbz2-src-pkg - Build $(perf-tar).tar.bz2 source tarball'
 	@echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source tarball'
+	@echo '  perf-tarzst-src-pkg - Build $(perf-tar).tar.zst source tarball'
 
 .PHONY: $(PHONY)
diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 221aa7df008d..cb54c7f1aa80 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -39,6 +39,10 @@ case "${1}" in
 		opts="-I ${XZ}"
 		tarball=${tarball}.xz
 		;;
+	tarzst-pkg)
+		opts="-I ${ZSTD}"
+		tarball=${tarball}.zst
+		;;
 	*)
 		echo "Unknown tarball target \"${1}\" requested, please add it to ${0}." >&2
 		exit 1
-- 
2.33.0

