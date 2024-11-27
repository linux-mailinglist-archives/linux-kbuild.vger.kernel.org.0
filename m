Return-Path: <linux-kbuild+bounces-4891-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BAB9DA65A
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 12:01:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF5D72810AE
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 11:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313771E0DE4;
	Wed, 27 Nov 2024 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="ZeweBbsF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22351E0DCC
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Nov 2024 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732705195; cv=none; b=aHC+j3vRyUZidOVBZ46XOp3GLnc5MAPibcP1hBU5wEeOHHcad0LHrn6fhsiQVaX8tfJnvvtV1owsO4DHz/+eNKgvP2NPM3G3YTWmPNM6oREEgs/gsL7Pwk7MMSQ2ZalIgddeIjS3hKYFd6KTj5d8k92miE9/OWHDbgOmtE/xS+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732705195; c=relaxed/simple;
	bh=QWFcUDetBA5mUaLpr4GHpziaLZ4TrW/wVS5MZsV0Qfk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uBOh2K203iEwTeJGjmzHfmhZ1BxqLTl636ukNNK+QgfxHWThYJ0gLRgy3ydeiBLCSGd2n1D29FXgn+63h/G/BSweqc91vFvGAZ3/ST8VoymS4ie1dSF+QeTQF6qHb0xXpv1oWrOhA9V3M76c2oISWlucCrq+opi/02iCS7ZmcL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=ZeweBbsF; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (ipb218f8ac.dynamic.kabel-deutschland.de [178.24.248.172])
	by mister-muffin.de (Postfix) with ESMTPSA id 8EF00600;
	Wed, 27 Nov 2024 11:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1732705189;
	bh=QWFcUDetBA5mUaLpr4GHpziaLZ4TrW/wVS5MZsV0Qfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZeweBbsFsfHkVsNspqeTjtB2YKyUAIGMAzJG7boDfxfzsyRNrQbkQRqrfKcDF9jia
	 LhuwN1HXrEVoRcPFMLb3WUcjk4t6rRCtlg5vbtic4JJ+3lKKBzz8gHFtuH7bTfdywj
	 iqYITHjMrKifu7BvmdbeqFOEO5yFn9byCXUw+mfs=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
Date: Wed, 27 Nov 2024 11:58:51 +0100
Message-Id: <20241127105851.1590405-2-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241127105851.1590405-1-josch@mister-muffin.de>
References: <20241127105851.1590405-1-josch@mister-muffin.de>
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

This functionality relies on run-parts 5.21 or later. If run-parts is
lacking support, only scripts in /etc/kernel will be considered. It is
the responsibility of packages installing hooks into /usr/share/kernel
to also declare a Depends: debianutils (>= 5.21).
---
 scripts/package/builddeb | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 441b0bb66e0d..1fa5228eed0b 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -5,10 +5,14 @@
 #
 # Simple script to generate a deb package for a Linux kernel. All the
 # complexity of what to do with a kernel after it is installed or removed
-# is left to other scripts and packages: they can install scripts in the
-# /etc/kernel/{pre,post}{inst,rm}.d/ directories (or an alternative location
-# specified in KDEB_HOOKDIR) that will be called on package install and
-# removal.
+# is left to other scripts and packages. Scripts can be placed into
+# the preinst, postinst, prerm and postrm directories in /etc/kernel
+# (override with KDEB_HOOKDIR) or /usr/share/kernel (override with
+# KDEB_DISTRO_HOOKDIR). Hooks of the same name in KDEB_HOOKDIR will override
+# hooks in KDEB_DISTRO_HOOKDIR. This, the former directory (usually in /etc)
+# can be used by the local admin while the latter directory (usually in /usr)
+# can be used by packages shipped by the distribution. The preinst, postinst,
+# prerm and postrm will then be called on package installation and removal.
 
 set -eu
 
@@ -69,8 +73,10 @@ install_linux_image () {
 	# make-kpkg sets $INITRD to indicate whether an initramfs is wanted, and
 	# so do we; recent versions of dracut and initramfs-tools will obey this.
 	debhookdir=${KDEB_HOOKDIR:-/etc/kernel}
+	debdistrohookdir=${KDEB_DISTRO_HOOKDIR:-/usr/share/kernel}
 	for script in postinst postrm preinst prerm; do
 		mkdir -p "${pdir}${debhookdir}/${script}.d"
+		mkdir -p "${pdir}${debdistrohookdir}/${script}.d"
 
 		mkdir -p "${pdir}/DEBIAN"
 		cat <<-EOF > "${pdir}/DEBIAN/${script}"
@@ -84,7 +90,30 @@ install_linux_image () {
 		# Tell initramfs builder whether it's wanted
 		export INITRD=$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
 
-		test -d ${debhookdir}/${script}.d && run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" ${debhookdir}/${script}.d
+		if test -d "${debhookdir}/${script}.d" && test -d "${debdistrohookdir}/${script}.d"; then
+			if test -n "$(find "${debhookdir}/${script}.d" -maxdepth 0 -empty)" ; then
+				# KDEB_HOOKDIR is empty, execute run-parts on KDEB_DISTRO_HOOKDIR only
+				run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" "${debdistrohookdir}/${script}.d"
+			elif test -n "$(find "${debdistrohookdir}/${script}.d" -maxdepth 0 -empty)" ; then
+				# KDEB_DISTROHOOKDIR is empty, execute run-parts on KDEB_HOOKDIR only
+				run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" "${debhookdir}/${script}.d"
+			else
+				# Both KDEB_HOOKDIR and KDEB_DISTROHOOKDIR contain files. It is the
+				# responsibility of the distribution package that placed files into
+				# KDEB_DISTROHOOKDIR to add a Depends: debianutils (>= 5.21)
+				if run-parts --help 2>&1 | grep -Fxq "Usage: run-parts [OPTION]... DIRECTORY [DIRECTORY ...]"; then
+					run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" "${debhookdir}/${script}.d" "${debdistrohookdir}/${script}.d"
+				else
+					echo "E: Ignoring maintainer scripts in ${debdistrohookdir} because run-parts is too old (5.21 required)" >&2
+					run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" "${debhookdir}/${script}.d"
+				fi
+			fi
+		elif test -d "${debhookdir}/${script}.d"; then
+			run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" "${debhookdir}/${script}.d"
+		elif test -d "${debdistrohookdir}/${script}.d"; then
+			run-parts --arg="${KERNELRELEASE}" --arg="/${installed_image_path}" "${debdistrohookdir}/${script}.d"
+		fi
+
 		exit 0
 		EOF
 		chmod 755 "${pdir}/DEBIAN/${script}"
-- 
2.39.2


