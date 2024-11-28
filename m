Return-Path: <linux-kbuild+bounces-4908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC29DB2C8
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 07:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7822B21DB7
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827A21FAA;
	Thu, 28 Nov 2024 06:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="J8ZtrmSy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA64C84E1C
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Nov 2024 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732775394; cv=none; b=QGzW2TIupF6RZE4pCw/sD6AQfO4g9z6sJwFZQJiU6RsCmAuvRLwdHs+hYF1oxU2W+wynL4eI6+oK7Y3hz4cb+kMcH1NPWsq4E8A+ZjMvJZv5i7KrxxvdoUWO4m1tyYUQLUA/b/+j45XD1bVbV/wUTBfbuw7LgNtEeUsFkP0qEAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732775394; c=relaxed/simple;
	bh=P5+yT/GQq/uMzUjlcVJTCfgWVZvPY9jaWqHxCbxl6AM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WcMkY2U7sFqRbxjRJSDv6nvPM8+44iPGM4z9vMqJ62zXzhcM1sUMGzPFjQ/HoENZf1HMcjLRpZCR9sYpqTiquauR8e9Rem3M76m9y3Munl5auublNXxV6qbKtG0D6MhZSByhnrlKuWDFYBMOsV47ZNNEaMRoovjhFCOusWvWDTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=J8ZtrmSy; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (unknown [37.4.230.225])
	by mister-muffin.de (Postfix) with ESMTPSA id 6D1732B8;
	Thu, 28 Nov 2024 07:29:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1732775389;
	bh=P5+yT/GQq/uMzUjlcVJTCfgWVZvPY9jaWqHxCbxl6AM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J8ZtrmSyvw5n/zs8QoCy1djOkKI+SKM0vjQE2Lvl55+baAJurVY9KDAQLS0DCZlnp
	 3gPAaj3RSnMxyQz5xQnGDIgAiuL2TCoERfarlUNCw4VjUPDhaWLquffZNnmBXBRgWm
	 SJkhErKiLE2IqsnIqLrkCqEgQmT12cTfskieodJQ=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
Date: Thu, 28 Nov 2024 07:29:40 +0100
Message-Id: <20241128062940.1708257-2-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241128062940.1708257-1-josch@mister-muffin.de>
References: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com>
 <20241128062940.1708257-1-josch@mister-muffin.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By passing an additional directory to run-parts, allow Debian and its
derivatives an easy way to ship maintainer scripts in /usr while at the
same time allowing the local admin to easily override or disable them by
placing hooks of the same name in /etc. This adds support for the
mechanism described in the UAPI Configuration Files Specification for
kernel hooks:
https://uapi-group.org/specifications/specs/configuration_files_specification/

This functionality relies on run-parts 5.21 or later.  It is the
responsibility of packages installing hooks into /usr/share/kernel to
also declare a Depends: debianutils (>= 5.21).

KDEB_HOOKDIR can be used to change the list of directories that is
searched. By default, /etc/kernel and /usr/share/kernel are hook
directories.

Signed-off-by: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
---
 scripts/package/builddeb | 44 ++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 441b0bb66e0d..2772146a76ce 100755
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
 
@@ -84,7 +93,26 @@ install_linux_image () {
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
+		test -n "\$hookdirs" || exit 0
+
+		# If more than one hook directory remained, check version of run-parts. If
+		# run-parts is too old, fall back to only processing the first.
+		case \$hookdirs in *" "*) if ! run-parts --help 2>&1 \
+				| grep -Fxq "Usage: run-parts [OPTION]... DIRECTORY [DIRECTORY ...]"; then
+				echo "E: run-parts >=5.21 is required for multiple hook directories, falling back to $firsthookdir" >&2
+				test -d "${firsthookdir}/${script}.d" || exit 0
+				hookdirs="${firsthookdir}/${script}.d"
+			fi
+		esac
+		run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" \$hookdirs
 		exit 0
 		EOF
 		chmod 755 "${pdir}/DEBIAN/${script}"
-- 
2.39.2


