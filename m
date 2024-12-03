Return-Path: <linux-kbuild+bounces-4950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE49E1398
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 07:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D255CB23F90
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 06:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BBC126C13;
	Tue,  3 Dec 2024 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="nDnfiZIa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5F31862BD
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 06:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733208899; cv=none; b=nAfG1SK/x3H9bdXOzu70osm0koqauOACV5DK9TWUaVmoo/g2V8L5VokSMtWr4UjdbwzsEHfLaWF6X1AIXyEmdBg8uh3RQQz/DtfKO9hyzXAqZ+CLjYzf7aUe+S1G/a2o+LuJQwe5jc/C7pyNm5Kwwjv1SLlzZrcJlJA5HkPoy2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733208899; c=relaxed/simple;
	bh=F2UcucQzs03hW28AxWtEkntcCudiZwJPP8+A7wShFBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h1KKG28m45JFm4uXUiP8UbhkmqijG/Ys6arhFc8ObYvwDY3BqQH+fOXTLyNTzK1GVBlL2k62yu+z17bAlXlL+QH8/C8UJCgkmv+VSgddF8JMzaNvgbOWkncY7FWb4tXhjz74Sz6UjowEuq08SeFOFx7XRucD7fxfAVOJyifFpjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=nDnfiZIa; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (unknown [37.4.230.225])
	by mister-muffin.de (Postfix) with ESMTPSA id E3441342;
	Tue,  3 Dec 2024 07:54:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1733208895;
	bh=F2UcucQzs03hW28AxWtEkntcCudiZwJPP8+A7wShFBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDnfiZIavYeIHk6ANX7JyRyRuugH++Uz+EGbzqGLy0yj8ZebASq9YoaANsBysRYqF
	 xOZCvuIipkhWMrdTrIc++l3j0F5Syl73pSZ93i8EMzKklGtA1A6fQNSClRU5j0fcOa
	 rPobPFcqfGQ9Sr2nD9OEDa3HcQ3zRrwI7N+mPBT8=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
Date: Tue,  3 Dec 2024 07:54:41 +0100
Message-Id: <20241203065441.2341579-2-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203065441.2341579-1-josch@mister-muffin.de>
References: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com>
 <20241203065441.2341579-1-josch@mister-muffin.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By passing an additional directory to run-parts, allow Debian and its
derivatives to ship maintainer scripts in /usr while at the same time
allowing the local admin to override or disable them by placing hooks of
the same name in /etc. This adds support for the mechanism described in
the UAPI Configuration Files Specification for kernel hooks. The same
idea is also used by udev, systemd or modprobe for their config files.
https://uapi-group.org/specifications/specs/configuration_files_specification/

This functionality relies on run-parts 5.21 or later.  It is the
responsibility of packages installing hooks into /usr/share/kernel to
also declare a Depends: debianutils (>= 5.21).

KDEB_HOOKDIR can be used to change the list of directories that is
searched. By default, /etc/kernel and /usr/share/kernel are hook
directories.

Signed-off-by: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
---
 scripts/package/builddeb | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 441b0bb66e0d..6e83f6f3ec6d 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -5,10 +5,12 @@
 #
 # Simple script to generate a deb package for a Linux kernel. All the
 # complexity of what to do with a kernel after it is installed or removed
-# is left to other scripts and packages: they can install scripts in the
-# /etc/kernel/{pre,post}{inst,rm}.d/ directories (or an alternative location
-# specified in KDEB_HOOKDIR) that will be called on package install and
-# removal.
+# is left to other scripts and packages. Scripts can be placed into the
+# preinst, postinst, prerm and postrm directories in /etc/kernel or
+# /usr/share/kernel. A different list of search directories can be given
+# via KDEB_HOOKDIR. Scripts in directories earlier in the list will
+# override scripts of the same name in later directories.  The script will
+# be called on package installation and removal.
 
 set -eu
 
@@ -68,11 +70,18 @@ install_linux_image () {
 	# kernel packages, as well as kernel packages built using make-kpkg.
 	# make-kpkg sets $INITRD to indicate whether an initramfs is wanted, and
 	# so do we; recent versions of dracut and initramfs-tools will obey this.
-	debhookdir=${KDEB_HOOKDIR:-/etc/kernel}
+	debhookdir=${KDEB_HOOKDIR:-/etc/kernel /usr/share/kernel}
+
+	# Only pre-create the first hook directory. Support for more than one hook
+	# directory requires run-parts 5.21 and it is the responsibility of packages
+	# creating additional hook directories to declare that dependency.
+	firsthookdir=${debhookdir%% *}
 	for script in postinst postrm preinst prerm; do
-		mkdir -p "${pdir}${debhookdir}/${script}.d"
+		mkdir -p "${pdir}${firsthookdir}/${script}.d"
+	done
 
-		mkdir -p "${pdir}/DEBIAN"
+	mkdir -p "${pdir}/DEBIAN"
+	for script in postinst postrm preinst prerm; do
 		cat <<-EOF > "${pdir}/DEBIAN/${script}"
 		#!/bin/sh
 
@@ -84,7 +93,15 @@ install_linux_image () {
 		# Tell initramfs builder whether it's wanted
 		export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
 
-		test -d ${debhookdir}/${script}.d && run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" ${debhookdir}/${script}.d
+		# run-parts will error out if one of its directory arguments does not
+		# exist, so filter the list of hook directories accordingly.
+		hookdirs=
+		for dir in ${debhookdir}; do
+			test -d "\$dir/${script}.d" || continue
+			hookdirs="\$hookdirs \$dir/${script}.d"
+		done
+		hookdirs="\${hookdirs# }"
+		test -n "\$hookdirs" && run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" \$hookdirs
 		exit 0
 		EOF
 		chmod 755 "${pdir}/DEBIAN/${script}"
-- 
2.39.2


