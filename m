Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE584271877
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 00:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgITWsP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 18:48:15 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:36146 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726156AbgITWsP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 18:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:From:Reply-To:Subject:Content-Type:
        Content-ID:Content-Description:X-Debbugs-Cc;
        bh=lbNtc3l1aqZilp5aS4XM3Fn9MRNPxCa8bqrg1tnHpDo=; b=B/t1anEQLOwmTLh8F6EVDSo/S0
        nFuHy7gQ6d/gm/q7ncfxT2WxeGMILyjq88p55PjEqwEWmePCI7fMXV3eYTV85FUOFA8wxnv4accGl
        UpdDmap5R3fFg/aZOvskMuVi5uWvTKWPOz+8x5LCmWKstXtcwR+Oi2epLWx+GQZLDYTDimuFUUtPj
        o3jQppyXfPbqWjKGOxuHcw46xeQB0B1HfFUiZ7SdPSZQ0ZhQ4SCDiEpMXywm4JH1gm3Le+mzJz6+W
        GguJDiGG/wL1bz5F3OIbBfAqOd3shcjYsmyo13w+4gs7PoG3KYRgj0DZglWIcAYkvK9AFrKQK3stG
        sK+Xchew==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1kK7nD-0002ck-LW; Mon, 21 Sep 2020 00:26:47 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] builddeb: Enable rootless builds
Date:   Mon, 21 Sep 2020 00:25:54 +0200
Message-Id: <20200920222556.10002-6-guillem@hadrons.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200920222556.10002-1-guillem@hadrons.org>
References: <20200920222556.10002-1-guillem@hadrons.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This makes it possible to build the Debian packages without requiring
(pseudo-)root privileges, when the build drivers support this mode
of operation.

See-Also: /usr/share/doc/dpkg/rootless-builds.txt.gz
Signed-off-by: Guillem Jover <guillem@hadrons.org>
---
 scripts/package/builddeb | 9 +++++++--
 scripts/package/mkdebian | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index b14abbe5afbb..d428c0945d4b 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -26,6 +26,7 @@ if_enabled_echo() {
 
 create_package() {
 	local pname="$1" pdir="$2"
+	local dpkg_deb_opts
 
 	mkdir -m 755 -p "$pdir/DEBIAN"
 	mkdir -p "$pdir/usr/share/doc/$pname"
@@ -36,14 +37,18 @@ create_package() {
 		| xargs -r0 md5sum > DEBIAN/md5sums"
 
 	# Fix ownership and permissions
-	chown -R root:root "$pdir"
+	if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
+		dpkg_deb_opts="--root-owner-group"
+	else
+		chown -R root:root "$pdir"
+	fi
 	chmod -R go-w "$pdir"
 	# in case we are in a restrictive umask environment like 0077
 	chmod -R a+rX "$pdir"
 
 	# Create the package
 	dpkg-gencontrol -p$pname -P"$pdir"
-	dpkg-deb ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
+	dpkg-deb $dpkg_deb_opts ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
 }
 
 deploy_kernel_headers () {
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index dae6c0ec0bd6..b98c382f967a 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -188,6 +188,7 @@ Source: $sourcename
 Section: kernel
 Priority: optional
 Maintainer: $maintainer
+Rules-Requires-Root: no
 Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
 Homepage: https://www.kernel.org/
 
-- 
2.28.0.297.g1956fa8f8d

