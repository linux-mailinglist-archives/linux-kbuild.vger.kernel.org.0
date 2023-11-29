Return-Path: <linux-kbuild+bounces-189-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 901B37FCB17
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 00:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1B971C20BE9
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Nov 2023 23:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC4B5C3E0;
	Tue, 28 Nov 2023 23:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2ttvRu6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBC4481C4
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 23:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D90C433C7;
	Tue, 28 Nov 2023 23:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701215642;
	bh=VbzLBZ/YYyTvUGv4/iK4ZZqJeQrZU/0QjMg1LUuUi1k=;
	h=From:To:Cc:Subject:Date:From;
	b=P2ttvRu6LCRc2NS+7C8SHzFk3J3EUa3WYM98z1Irrlea6vASLS4w/4xGhR5UY5xHm
	 cBdNMNzHf0FdxNgIGPulW2p98FuME9N+Vm2i5TvpNiZOQ82YDKcgtn4+ttpxTgQlwh
	 C7DsA3h5gtSld+qmeswoYwZp9NHtVN+z2z35hwS9Uo2+oCD/jWJn8AiUN8rWL5/2ko
	 dTV6xjc5VvB4wUkExly+a3/RFS5z/JdjwNhWgvPMqQb0CmbZw2tK6JQu3gV2dAIQj8
	 pat6wPu+25qbXVswIv8Ab+7HaeX5pGipLQUUjkq42QGP2ddHADgJdUvy1f806SM3hL
	 6HNYOw+koeXLg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Guillem Jover <guillem@debian.org>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] kbuild: deb-pkg: remove the fakeroot builds support
Date: Wed, 29 Nov 2023 08:53:56 +0900
Message-Id: <20231128235356.527642-1-masahiroy@kernel.org>
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

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3:
  - Remove DEB_RULES_REQUIRES_ROOT=no again
    (resent in order to clarify which one should be applied)

Changes in v2:
  - add DEB_RULES_REQUIRES_ROOT=no to debian/rules

 scripts/Makefile.package | 4 +---
 scripts/package/builddeb | 8 +-------
 2 files changed, 2 insertions(+), 10 deletions(-)

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
-- 
2.40.1


