Return-Path: <linux-kbuild+bounces-183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972DF7FBE42
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 16:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3833EB20EE2
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 15:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7361E48A;
	Tue, 28 Nov 2023 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxtKZl5c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FDD1E481
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 15:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A32AC433C7;
	Tue, 28 Nov 2023 15:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701185966;
	bh=Ul+5JsEr00hCpcNY6/TNQDzkKwuTkuFGMnHWCDK+NiQ=;
	h=From:To:Cc:Subject:Date:From;
	b=bxtKZl5cWQvfmShV2blhYD0rDSVuah4Ce0Eozowu4YOmpaYNRnSb6GLgpLG0AWcut
	 Iwr6tTepl394varvsVmU920cR7OmdKvFrcGMfSOrDw46hVs4DQ7pb0ai+zk6vcqzEI
	 je5wWmc/0iegGdNDotkuZ+LeVAASpcsvPazhoKMBOpYcEqEuQFqBWshfM820Qx3y2z
	 HMya6KS6oNDZtscgJA+TbVOPEHr2A11XC49PQSWqJJ27xPhWEmulgKkMjFnb8sfDUi
	 gPs7wsZsQv5AoXdP9Pvs8D93I7da5S3WRRM3tvWajQyOeFFUTWMR7MJPT0hd6d1ik6
	 wZL1U2qEboNwQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Guillem Jover <guillem@debian.org>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: deb-pkg: remove the fakeroot builds support
Date: Wed, 29 Nov 2023 00:38:58 +0900
Message-Id: <20231128153858.84932-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2017, the dpkg suite introduced the rootless builds support with the
following commits:

  - 2436807c87b0 ("dpkg-deb: Add support for rootless builds")
  - fca1bfe84068 ("dpkg-buildpackage: Add support for rootless builds")

This feature is available in the default dpkg on Debian 10 and Ubuntu
20.04.

Remove the old method.

Additionally, export DEB_RULES_REQUIRES_ROOT=no in case debian/rules is
invoked without dpkg-buildpackage. This change aligns with the Debian
kernel commit 65206e29f378 ("Allow to run d/rules.real without root").
While the upstream kernel currently does not run dh_testroot, it may
be useful in the future.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - add DEB_RULES_REQUIRES_ROOT=no to debian/rules

 scripts/Makefile.package     | 4 +---
 scripts/package/builddeb     | 8 +-------
 scripts/package/debian/rules | 2 ++
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/Makefile.package b/scripts/Makefile.package
index 0c3adc48dfe8..a81dfb1f5181 100644
--- a/scripts/Makefile.package
+++ b/scripts/Makefile.package
@@ -109,8 +109,6 @@ debian-orig: linux.tar$(debian-orig-suffix) debian
 		cp $< ../$(orig-name); \
 	fi
 
-KBUILD_PKG_ROOTCMD ?= 'fakeroot -u'
-
 PHONY += deb-pkg srcdeb-pkg bindeb-pkg
 
 deb-pkg:    private build-type := source,binary
@@ -125,7 +123,7 @@ deb-pkg srcdeb-pkg bindeb-pkg:
 	$(if $(findstring source, $(build-type)), \
 		--unsigned-source --compression=$(KDEB_SOURCE_COMPRESS)) \
 	$(if $(findstring binary, $(build-type)), \
-		-R'$(MAKE) -f debian/rules' -j1 -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch), \
+		-R'$(MAKE) -f debian/rules' -j1 -a$$(cat debian/arch), \
 		--no-check-builddeps) \
 	$(DPKG_FLAGS))
 
diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index d7dd0d04c70c..2fe51e6919da 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -36,19 +36,13 @@ create_package() {
 	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
 		| xargs -r0 md5sum > DEBIAN/md5sums"
 
-	# Fix ownership and permissions
-	if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
-		dpkg_deb_opts="--root-owner-group"
-	else
-		chown -R root:root "$pdir"
-	fi
 	# a+rX in case we are in a restrictive umask environment like 0077
 	# ug-s in case we build in a setuid/setgid directory
 	chmod -R go-w,a+rX,ug-s "$pdir"
 
 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
-	dpkg-deb $dpkg_deb_opts ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
+	dpkg-deb --root-owner-group ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
 }
 
 install_linux_image () {
diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
index 3dafa9496c63..f23d97087948 100755
--- a/scripts/package/debian/rules
+++ b/scripts/package/debian/rules
@@ -5,6 +5,8 @@ include debian/rules.vars
 
 srctree ?= .
 
+export DEB_RULES_REQUIRES_ROOT := no
+
 ifneq (,$(filter-out parallel=1,$(filter parallel=%,$(DEB_BUILD_OPTIONS))))
     NUMJOBS = $(patsubst parallel=%,%,$(filter parallel=%,$(DEB_BUILD_OPTIONS)))
     MAKEFLAGS += -j$(NUMJOBS)
-- 
2.40.1


