Return-Path: <linux-kbuild+bounces-4975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7519E271A
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 17:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12DCF166EF5
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 16:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEEC1EE00B;
	Tue,  3 Dec 2024 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b="HGt92Sb8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mister-muffin.de (mister-muffin.de [144.76.155.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41D14A088
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.155.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242677; cv=none; b=p9UInD1pkRITzQQFcNRyuuPepDMjraJFSByM4C+7wzIrMq1RSVR3O3BgvNFJPiPDBUTfBWCxtACw6Upl/R1ZZJuBs9dww0+W2dePqX22WnnXMHuuPnCmRoH9c63cXKxO0OyKyWLkIxr0Tt+tddyM6FwtU9osfbfEax/BAhR2MhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242677; c=relaxed/simple;
	bh=r8OaUDfNALJUUhyhscOy7k2yROP7VGTXlSUgS58edcg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uWOfLnOhUCf2TSvvcg+X/7QcaKE4sJO9jKMEAucE2ux27b9eCdJvzPLViwEQACoMZuvRuvQsIGz9jYY8XNNUbQ37ULOXgRPTzYpNPdO0LOdZcPzAekUlW9DRbrvhILvNXLe0hwMNN/174SDRnlFynMfr2gg5c0YsRPgrb3OUMOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de; spf=pass smtp.mailfrom=mister-muffin.de; dkim=pass (1024-bit key) header.d=mister-muffin.de header.i=@mister-muffin.de header.b=HGt92Sb8; arc=none smtp.client-ip=144.76.155.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mister-muffin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mister-muffin.de
Received: from localhost (ipb218f889.dynamic.kabel-deutschland.de [178.24.248.137])
	by mister-muffin.de (Postfix) with ESMTPSA id 2F64179D;
	Tue,  3 Dec 2024 17:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mister-muffin.de;
	s=mail; t=1733242673;
	bh=r8OaUDfNALJUUhyhscOy7k2yROP7VGTXlSUgS58edcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HGt92Sb8ZiCSqRd3HXSKd7znEp3YLHIb8A3E2X1yst2xYW6aZK9gv1lKBFZ/KxKHz
	 WNq7+7Y4n7wHBdxTmjtnVUC1NrBTQ3hYT9u2B1EcRLnuZdLLtoVMpY9IbvoZ/PrwBw
	 vsnom7+sBS/g9qM0P1UpLZwh/G+d7cZNmhJlQius=
From: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
To: linux-kbuild@vger.kernel.org
Cc: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Subject: [PATCHv4 1/1] kbuild: deb-pkg: allow hooks also in /usr/share/kernel
Date: Tue,  3 Dec 2024 17:17:35 +0100
Message-Id: <20241203161735.2411494-2-josch@mister-muffin.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203161735.2411494-1-josch@mister-muffin.de>
References: <CAK7LNATQ6Gu6D6gpH3htJS=e136zPBQbCxtMLZU3YZx_bkWiLg@mail.gmail.com>
 <20241203161735.2411494-1-josch@mister-muffin.de>
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
directories. Since the list of directories in KDEB_HOOKDIR is separated
by spaces, the paths must not contain the space character themselves.

Signed-off-by: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
---
 scripts/package/builddeb | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 5843c5c04e56..1b79f25442c7 100755
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
 
@@ -68,7 +70,8 @@ install_linux_image () {
 	# kernel packages, as well as kernel packages built using make-kpkg.
 	# make-kpkg sets $INITRD to indicate whether an initramfs is wanted, and
 	# so do we; recent versions of dracut and initramfs-tools will obey this.
-	debhookdir=${KDEB_HOOKDIR:-/etc/kernel}
+	debhookdir=${KDEB_HOOKDIR:-/etc/kernel /usr/share/kernel}
+
 	for script in postinst postrm preinst prerm; do
 		mkdir -p "${pdir}/DEBIAN"
 		cat <<-EOF > "${pdir}/DEBIAN/${script}"
@@ -82,7 +85,15 @@ install_linux_image () {
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


